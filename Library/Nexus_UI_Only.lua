--[[
    NEXUS HUB — Premium Black + Neon Purple UI (native Roblox Luau)
    Run as a LocalScript (e.g. StarterPlayerScripts). Client-side only.

    Sections:
      1. Services & configuration     8. Toggle creation
      2. Theme                        9. Search
      3. Main ScreenGui              10. Configuration management
      4. Dashboard                   11. Notifications
      5. Sidebar                     12. Animations (helpers + open/close)
      6. Tab management              13. Initialization
      7. Feature cards

    The UI only manages state. Wire your own logic with:
      Nexus.Handlers["Core/Main Farm/Auto Farm Level"] = function(enabled) ... end
      Nexus.OnToggle = function(flag, enabled) ... end
      Nexus.SetInfo("Core/Section/Current Bones", "1,250")
]]

--// ============================================================
--// 1. SERVICES & CONFIGURATION
-- Standalone UI: no external UI library is required or loaded.
-- Execute this source directly as a LocalScript in a supported Roblox client.
--// ============================================================
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Camera = workspace.CurrentCamera

local Config = {
	Name = "Nexus Hub",
	Version = "v1.0",
	ToggleKey = Enum.KeyCode.RightShift,
	ConfigFolder = "NexusHub",
	DefaultConfig = "default",
	BaseSize = Vector2.new(660, 440),
	MinSize = Vector2.new(320, 260),
	HeaderHeight = 46,
	SidebarWidth = 168,
	SidebarCompactWidth = 48,
	RowHeight = 32, -- touch-friendly
}

--// ============================================================
--// 2. THEME
--// ============================================================
local Theme = {
	Background = Color3.fromHex("#08070D"),
	Secondary = Color3.fromHex("#100D18"),
	Card = Color3.fromHex("#15111F"),
	Primary = Color3.fromHex("#A855F7"),
	Neon = Color3.fromHex("#9333EA"),
	Deep = Color3.fromHex("#6D28D9"),
	Text = Color3.fromHex("#FFFFFF"),
	SubText = Color3.fromHex("#9993A6"),
	Off = Color3.fromHex("#2A2635"),
	OffKnob = Color3.fromHex("#7C7690"),
	Success = Color3.fromHex("#22C55E"),
	Error = Color3.fromHex("#EF4444"),
	Warning = Color3.fromHex("#F59E0B"),
	Info = Color3.fromHex("#38BDF8"),
	Font = Enum.Font.GothamMedium,
	FontBold = Enum.Font.GothamBold,
}

--// ============================================================
--// Shared helpers (instances, tweens, connections)
--// ============================================================
local Connections = {} -- every long-lived connection, disconnected on destroy
local Cleanups = {}    -- extra cleanup callbacks

local function connect(signal, callback)
	local connection = signal:Connect(callback)
	table.insert(Connections, connection)
	return connection
end

local function create(className, props, children)
	local instance = Instance.new(className)
	local parent
	for key, value in pairs(props or {}) do
		if key == "Parent" then
			parent = value
		else
			instance[key] = value
		end
	end
	for _, child in ipairs(children or {}) do
		child.Parent = instance
	end
	instance.Parent = parent -- parent last for performance
	return instance
end

local function corner(radius)
	return create("UICorner", { CornerRadius = UDim.new(0, radius) })
end

local function stroke(color, transparency, thickness)
	return create("UIStroke", {
		Color = color,
		Transparency = transparency,
		Thickness = thickness or 1,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	})
end

local function padding(top, right, bottom, left)
	return create("UIPadding", {
		PaddingTop = UDim.new(0, top),
		PaddingRight = UDim.new(0, right or top),
		PaddingBottom = UDim.new(0, bottom or top),
		PaddingLeft = UDim.new(0, left or right or top),
	})
end

local function listLayout(gap, direction)
	return create("UIListLayout", {
		Padding = UDim.new(0, gap),
		FillDirection = direction or Enum.FillDirection.Vertical,
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
end

local function label(parent, text, props)
	local base = {
		BackgroundTransparency = 1,
		Text = text,
		Font = Theme.Font,
		TextSize = 13,
		TextColor3 = Theme.Text,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
		Parent = parent,
	}
	for key, value in pairs(props or {}) do
		base[key] = value
	end
	return create("TextLabel", base)
end

local function createLogo(parent, size)
	return create("Frame", {
		Name = "Logo",
		Size = UDim2.fromOffset(size, size),
		BackgroundColor3 = Color3.new(1, 1, 1),
		Parent = parent,
	}, {
		corner(math.floor(size * 0.3)),
		create("UIGradient", { Color = ColorSequence.new(Theme.Primary, Theme.Deep), Rotation = 45 }),
		create("TextLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "N",
			Font = Theme.FontBold,
			TextSize = math.floor(size * 0.55),
			TextColor3 = Theme.Text,
		}),
	})
end

--// ============================================================
--// 12. ANIMATIONS (helpers)
--// ============================================================
local function tween(instance, duration, props, style, direction, delay)
	local info = TweenInfo.new(
		duration,
		style or Enum.EasingStyle.Quad,
		direction or Enum.EasingDirection.Out,
		0,
		false,
		delay or 0
	)
	local t = TweenService:Create(instance, info, props)
	t:Play()
	return t
end

local function setProps(instance, props)
	for key, value in pairs(props) do
		instance[key] = value
	end
end

local function bindHover(button, target, normalProps, hoverProps)
	connect(button.MouseEnter, function()
		tween(target, 0.15, hoverProps)
	end)
	connect(button.MouseLeave, function()
		tween(target, 0.15, normalProps)
	end)
end

--// ============================================================
--// Global state & public API
--// ============================================================
local State = {
	Tabs = {},          -- [id] = tab
	TabOrder = {},      -- ordered tab ids
	ActiveTab = nil,
	Toggles = {},       -- [flag] = toggle
	Infos = {},         -- [id] = TextLabel
	Inputs = {},        -- [id] = TextBox
	Query = "",
	Compact = false,
	Minimized = false,
	Visible = false,
	Destroyed = false,
	Scale = 1,
	Notifications = true,
	ColumnCount = 0,
}

local Nexus = {
	Handlers = {}, -- per-flag callbacks
	OnToggle = nil, -- global callback (flag, value)
}

-- Forward declarations (defined in later sections)
local layout, applyFilter, selectTab, setMinimized, notify, refreshActiveCount

--// ============================================================
--// 3. MAIN SCREENGUI
--// ============================================================
local oldGui = PlayerGui:FindFirstChild("NexusHub")
if oldGui then
	oldGui:Destroy()
end

local ScreenGui = create("ScreenGui", {
	Name = "NexusHub",
	ResetOnSpawn = false,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	IgnoreGuiInset = true,
	DisplayOrder = 100,
	Parent = PlayerGui,
})

local function getViewport()
	local size = ScreenGui.AbsoluteSize
	if size.X < 1 then
		size = Camera.ViewportSize
	end
	return size
end

--// ============================================================
--// 11. NOTIFICATION SYSTEM
--// ============================================================
local NotifyContainer = create("Frame", {
	Name = "Notifications",
	AnchorPoint = Vector2.new(1, 1),
	Position = UDim2.new(1, -14, 1, -14),
	Size = UDim2.fromOffset(280, 340),
	BackgroundTransparency = 1,
	ZIndex = 50,
	Parent = ScreenGui,
}, {
	create("UIListLayout", {
		Padding = UDim.new(0, 8),
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Bottom,
	}),
})

local NOTIFY_TYPES = {
	Success = { color = Theme.Success, icon = "+" },
	Error = { color = Theme.Error, icon = "×" },
	Warning = { color = Theme.Warning, icon = "!" },
	Info = { color = Theme.Info, icon = "i" },
}
local notifyCounter = 0
local MAX_NOTIFICATIONS = 4

notify = function(kind, title, text, duration)
	if State.Destroyed then return end
	if not State.Notifications and kind ~= "Error" then return end

	local style = NOTIFY_TYPES[kind] or NOTIFY_TYPES.Info
	notifyCounter += 1

	-- Drop the oldest entry when too many are visible
	local existing = {}
	for _, child in ipairs(NotifyContainer:GetChildren()) do
		if child:IsA("Frame") then
			table.insert(existing, child)
		end
	end
	if #existing >= MAX_NOTIFICATIONS then
		table.sort(existing, function(a, b) return a.LayoutOrder < b.LayoutOrder end)
		existing[1]:Destroy()
	end

	local wrapper = create("Frame", {
		Size = UDim2.new(1, 0, 0, 62),
		BackgroundTransparency = 1,
		LayoutOrder = notifyCounter,
		Parent = NotifyContainer,
	})
	local card = create("CanvasGroup", {
		Size = UDim2.fromScale(1, 1),
		Position = UDim2.new(1, 40, 0, 0),
		BackgroundColor3 = Theme.Card,
		GroupTransparency = 1,
		Parent = wrapper,
	}, {
		corner(10),
		stroke(style.color, 0.55, 1),
		create("Frame", { -- accent bar
			Size = UDim2.new(0, 3, 1, 0),
			BackgroundColor3 = style.color,
			BorderSizePixel = 0,
		}),
		create("Frame", { -- icon badge
			Position = UDim2.fromOffset(14, 17),
			Size = UDim2.fromOffset(28, 28),
			BackgroundColor3 = style.color,
			BackgroundTransparency = 0.8,
		}, {
			corner(14),
			create("TextLabel", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Text = style.icon,
				Font = Theme.FontBold,
				TextSize = 14,
				TextColor3 = style.color,
			}),
		}),
	})
	label(card, title or "Nexus Hub", {
		Position = UDim2.fromOffset(52, 9),
		Size = UDim2.new(1, -62, 0, 18),
		Font = Theme.FontBold,
		TextSize = 13,
	})
	label(card, text or "", {
		Position = UDim2.fromOffset(52, 27),
		Size = UDim2.new(1, -62, 0, 28),
		TextSize = 12,
		TextColor3 = Theme.SubText,
		TextWrapped = true,
		TextYAlignment = Enum.TextYAlignment.Top,
	})

	tween(card, 0.35, { Position = UDim2.fromOffset(0, 0), GroupTransparency = 0 }, Enum.EasingStyle.Back)

	local dismissed = false
	local function dismiss()
		if dismissed or not wrapper.Parent then return end
		dismissed = true
		local out = tween(card, 0.25, { Position = UDim2.new(1, 40, 0, 0), GroupTransparency = 1 },
			Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		out.Completed:Once(function()
			wrapper:Destroy()
		end)
	end
	task.delay(duration or 3, dismiss)
end

--// ============================================================
--// 4. DASHBOARD CREATION
--// ============================================================
local Window = create("Frame", {
	Name = "Window",
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.fromScale(0.5, 0.5),
	Size = UDim2.fromOffset(Config.BaseSize.X, Config.BaseSize.Y),
	BackgroundColor3 = Theme.Background,
	BackgroundTransparency = 0.04, -- subtle glass
	ClipsDescendants = true,
	Visible = false,
	Parent = ScreenGui,
}, { corner(14) })

local WindowScale = create("UIScale", { Scale = 1, Parent = Window })

-- Floating N launcher: shown whenever the dashboard is minimized.
-- It stays available independently of the dashboard and restores it on tap.
local MiniLauncher = create("TextButton", {
	Name = "NexusMiniLauncher",
	AnchorPoint = Vector2.new(1, 1),
	Position = UDim2.new(1, -22, 1, -110),
	Size = UDim2.fromOffset(54, 54),
	BackgroundColor3 = Theme.Primary,
	Text = "N",
	TextColor3 = Theme.Text,
	TextSize = 25,
	Font = Theme.FontBold,
	AutoButtonColor = false,
	Visible = false,
	ZIndex = 80,
	Parent = ScreenGui,
}, { corner(27), stroke(Theme.Primary, 0.12, 2), create("UIGradient", {
	Color = ColorSequence.new(Theme.Primary, Theme.Deep),
	Rotation = 45,
}) })
local MiniLauncherScale = create("UIScale", { Scale = 1, Parent = MiniLauncher })
connect(MiniLauncher.MouseEnter, function()
	tween(MiniLauncherScale, 0.14, { Scale = 1.09 })
end)
connect(MiniLauncher.MouseLeave, function()
	tween(MiniLauncherScale, 0.14, { Scale = 1 })
end)
local WindowStroke = create("UIStroke", {
	Color = Color3.new(1, 1, 1),
	Transparency = 0.45,
	Thickness = 1.5,
	ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	Parent = Window,
})
create("UIGradient", {
	Color = ColorSequence.new(Theme.Primary, Theme.Deep),
	Rotation = 45,
	Parent = WindowStroke,
})

-- Header ------------------------------------------------------
local Header = create("Frame", {
	Name = "Header",
	Size = UDim2.new(1, 0, 0, Config.HeaderHeight),
	BackgroundColor3 = Theme.Secondary,
	BackgroundTransparency = 0.15,
	BorderSizePixel = 0,
	Parent = Window,
})
create("Frame", { -- divider under header
	Position = UDim2.fromOffset(0, Config.HeaderHeight),
	Size = UDim2.new(1, 0, 0, 1),
	BackgroundColor3 = Theme.Primary,
	BackgroundTransparency = 0.85,
	BorderSizePixel = 0,
	Parent = Window,
})

local HeaderLeft = create("Frame", {
	Position = UDim2.fromOffset(12, 0),
	Size = UDim2.new(0.5, 0, 1, 0),
	BackgroundTransparency = 1,
	Parent = Header,
}, {
	create("UIListLayout", {
		Padding = UDim.new(0, 8),
		FillDirection = Enum.FillDirection.Horizontal,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
	}),
})
local logo = createLogo(HeaderLeft, 28)
logo.LayoutOrder = 1
local BrandLabel = label(HeaderLeft, Config.Name, {
	LayoutOrder = 2, Size = UDim2.new(0, 0, 1, 0), AutomaticSize = Enum.AutomaticSize.X,
	Font = Theme.FontBold, TextSize = 16, TextTruncate = Enum.TextTruncate.None,
})
local SeparatorLabel = label(HeaderLeft, "/", {
	LayoutOrder = 3, Size = UDim2.new(0, 6, 1, 0), TextColor3 = Theme.SubText,
})
local Breadcrumb = label(HeaderLeft, "", {
	LayoutOrder = 4, Size = UDim2.new(0, 0, 1, 0), AutomaticSize = Enum.AutomaticSize.X,
	TextColor3 = Theme.Primary, Font = Theme.FontBold, TextTruncate = Enum.TextTruncate.None,
})

local function headerButton(text, xOffset, hoverColor)
	local button = create("TextButton", {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, xOffset, 0.5, 0),
		Size = UDim2.fromOffset(30, 30),
		BackgroundColor3 = Theme.Card,
		BackgroundTransparency = 0.3,
		Text = text,
		Font = Theme.FontBold,
		TextSize = 16,
		TextColor3 = Theme.SubText,
		AutoButtonColor = false,
		Parent = Header,
	}, { corner(8) })
	bindHover(button, button,
		{ BackgroundColor3 = Theme.Card, TextColor3 = Theme.SubText },
		{ BackgroundColor3 = hoverColor, TextColor3 = Theme.Text })
	return button
end

local CloseButton = headerButton("×", -10, Theme.Error)
local MinimizeButton = headerButton("−", -44, Theme.Deep)

local SearchWrap = create("Frame", {
	AnchorPoint = Vector2.new(1, 0.5),
	Position = UDim2.new(1, -84, 0.5, 0),
	Size = UDim2.fromOffset(170, 30),
	BackgroundColor3 = Theme.Card,
	Parent = Header,
}, { corner(8) })
local SearchStroke = create("UIStroke", {
	Color = Theme.Primary, Transparency = 0.8, Thickness = 1, Parent = SearchWrap,
})
label(SearchWrap, "⌕", {
	Size = UDim2.fromOffset(24, 30), Position = UDim2.fromOffset(4, 0),
	TextXAlignment = Enum.TextXAlignment.Center, TextSize = 12, TextTransparency = 0.3,
})
local SearchBox = create("TextBox", {
	Position = UDim2.fromOffset(28, 0),
	Size = UDim2.new(1, -54, 1, 0),
	BackgroundTransparency = 1,
	Text = "",
	PlaceholderText = "Search features...",
	PlaceholderColor3 = Theme.SubText,
	TextColor3 = Theme.Text,
	Font = Theme.Font,
	TextSize = 12,
	TextXAlignment = Enum.TextXAlignment.Left,
	ClearTextOnFocus = false,
	Parent = SearchWrap,
})
local ClearButton = create("TextButton", {
	AnchorPoint = Vector2.new(1, 0.5),
	Position = UDim2.new(1, -4, 0.5, 0),
	Size = UDim2.fromOffset(22, 22),
	BackgroundTransparency = 1,
	Text = "×",
	Font = Theme.FontBold,
	TextSize = 16,
	TextColor3 = Theme.SubText,
	Visible = false,
	Parent = SearchWrap,
})

-- Body --------------------------------------------------------
local Body = create("Frame", {
	Name = "Body",
	Position = UDim2.fromOffset(0, Config.HeaderHeight + 1),
	Size = UDim2.new(1, 0, 1, -(Config.HeaderHeight + 1)),
	BackgroundTransparency = 1,
	Parent = Window,
})

--// ============================================================
--// 5. SIDEBAR CREATION
--// ============================================================
local Sidebar = create("Frame", {
	Name = "Sidebar",
	Size = UDim2.new(0, Config.SidebarWidth, 1, 0),
	BackgroundColor3 = Theme.Secondary,
	BackgroundTransparency = 0.3,
	BorderSizePixel = 0,
	Parent = Body,
})
create("Frame", { -- right divider
	AnchorPoint = Vector2.new(1, 0),
	Position = UDim2.fromScale(1, 0),
	Size = UDim2.new(0, 1, 1, 0),
	BackgroundColor3 = Theme.Primary,
	BackgroundTransparency = 0.88,
	BorderSizePixel = 0,
	Parent = Sidebar,
})
local SidebarList = create("ScrollingFrame", {
	Size = UDim2.new(1, -1, 1, -44),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	ScrollBarThickness = 0,
	CanvasSize = UDim2.new(),
	AutomaticCanvasSize = Enum.AutomaticSize.Y,
	ScrollingDirection = Enum.ScrollingDirection.Y,
	Parent = Sidebar,
}, { padding(8), listLayout(4) })

local SidebarFooter = create("Frame", {
	AnchorPoint = Vector2.new(0, 1),
	Position = UDim2.fromScale(0, 1),
	Size = UDim2.new(1, -1, 0, 44),
	BackgroundTransparency = 1,
	Parent = Sidebar,
})
create("Frame", { -- status indicator
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.new(0, 24, 0.5, 0),
	Size = UDim2.fromOffset(8, 8),
	BackgroundColor3 = Theme.Success,
	Parent = SidebarFooter,
}, { corner(4) })
local FooterLabel = label(SidebarFooter, LocalPlayer.DisplayName .. "  •  " .. Config.Version, {
	Position = UDim2.fromOffset(40, 0), Size = UDim2.new(1, -48, 1, 0),
	TextSize = 11, TextColor3 = Theme.SubText,
})

--// Content area
local ContentArea = create("Frame", {
	Name = "Content",
	Position = UDim2.new(0, Config.SidebarWidth + 1, 0, 0),
	Size = UDim2.new(1, -(Config.SidebarWidth + 1), 1, 0),
	BackgroundTransparency = 1,
	ClipsDescendants = true,
	Parent = Body,
})
local EmptyLabel = create("TextLabel", {
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.fromScale(0.5, 0.5),
	Size = UDim2.new(1, -40, 0, 60),
	BackgroundTransparency = 1,
	Text = "No results found\nTry a different search term",
	Font = Theme.Font,
	TextSize = 14,
	TextColor3 = Theme.SubText,
	TextWrapped = true,
	Visible = false,
	Parent = ContentArea,
})

--// ============================================================
--// 8. TOGGLE CREATION
--// ============================================================
local function createToggle(parent, flag, opts, onChanged)
	local track = create("Frame", {
		Name = "Toggle",
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -10, 0.5, 0),
		Size = UDim2.fromOffset(40, 20),
		BackgroundColor3 = Theme.Off,
		Parent = parent,
	}, { corner(10) })
	local glow = create("UIStroke", { Color = Theme.Primary, Thickness = 2, Transparency = 1, Parent = track })
	local knob = create("Frame", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 3, 0.5, 0),
		Size = UDim2.fromOffset(14, 14),
		BackgroundColor3 = Theme.OffKnob,
		Parent = track,
	}, { corner(7) })

	local toggle = {
		Flag = flag,
		Value = opts.Default == true,
		Default = opts.Default == true,
		NoSave = opts.NoSave == true,
	}

	local function render(animated)
		local on = toggle.Value
		local trackProps = { BackgroundColor3 = on and Theme.Neon or Theme.Off }
		local knobProps = {
			BackgroundColor3 = on and Theme.Text or Theme.OffKnob,
			Position = on and UDim2.new(0, 23, 0.5, 0) or UDim2.new(0, 3, 0.5, 0),
		}
		local glowProps = { Transparency = on and 0.45 or 1 }
		if animated then
			tween(track, 0.2, trackProps)
			tween(knob, 0.2, knobProps, Enum.EasingStyle.Back)
			tween(glow, 0.2, glowProps)
		else
			setProps(track, trackProps)
			setProps(knob, knobProps)
			setProps(glow, glowProps)
		end
	end

	function toggle:Set(value, silent)
		value = value == true
		if value == self.Value then return end
		self.Value = value
		render(true)
		if not silent and onChanged then
			task.spawn(onChanged, value)
		end
	end

	render(false)
	return toggle
end

--// ============================================================
--// 7. FEATURE CARD CREATION
--// ============================================================
local function dispatchToggle(flag, value, item)
	local function safe(fn, ...)
		local ok, err = pcall(fn, ...)
		if not ok then warn("[Nexus Hub] handler error (" .. flag .. "): " .. tostring(err)) end
	end
	if item.Callback then safe(item.Callback, value) end
	if Nexus.Handlers[flag] then safe(Nexus.Handlers[flag], value) end
	if Nexus.OnToggle then safe(Nexus.OnToggle, flag, value) end
end

local function createRowFrame(card, order)
	return create("Frame", {
		Size = UDim2.new(1, 0, 0, Config.RowHeight),
		BackgroundColor3 = Theme.Secondary,
		BackgroundTransparency = 0.3,
		LayoutOrder = order,
		Parent = card.Frame,
	}, { corner(8) })
end

local RowBuilders = {}

function RowBuilders.Toggle(card, item, order)
	local row = createRowFrame(card, order)
	label(row, item.Name, { Position = UDim2.fromOffset(10, 0), Size = UDim2.new(1, -64, 1, 0) })
	local hit = create("TextButton", {
		Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = "", AutoButtonColor = false, Parent = row,
	})
	local flag = card.Id .. "/" .. item.Name
	local toggle = createToggle(row, flag, { Default = item.Default, NoSave = item.NoSave }, function(value)
		card.Refresh()
		refreshActiveCount()
		dispatchToggle(flag, value, item)
	end)
	State.Toggles[flag] = toggle
	table.insert(card.ToggleList, toggle)
	connect(hit.Activated, function()
		toggle:Set(not toggle.Value)
	end)
	bindHover(hit, row, { BackgroundTransparency = 0.3 }, { BackgroundTransparency = 0.05 })
	return { Name = item.Name, Frame = row }
end

function RowBuilders.Button(card, item, order)
	local button = create("TextButton", {
		Size = UDim2.new(1, 0, 0, Config.RowHeight),
		BackgroundColor3 = Theme.Deep,
		BackgroundTransparency = 0.35,
		Text = item.Name,
		Font = Theme.FontBold,
		TextSize = 13,
		TextColor3 = Theme.Text,
		AutoButtonColor = false,
		LayoutOrder = order,
		Parent = card.Frame,
	}, { corner(8), stroke(Theme.Primary, 0.6, 1) })
	bindHover(button, button, { BackgroundTransparency = 0.35 }, { BackgroundTransparency = 0.05 })
	connect(button.Activated, function()
		if item.Callback then
			local ok, err = pcall(item.Callback)
			if not ok then warn("[Nexus Hub] button error: " .. tostring(err)) end
		end
	end)
	return { Name = item.Name, Frame = button }
end

function RowBuilders.Info(card, item, order)
	local row = createRowFrame(card, order)
	label(row, item.Name, { Position = UDim2.fromOffset(10, 0), Size = UDim2.new(0.55, -10, 1, 0), TextColor3 = Theme.SubText })
	local value = label(row, tostring(item.Value or "-"), {
		AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -10, 0, 0), Size = UDim2.new(0.45, -10, 1, 0),
		TextXAlignment = Enum.TextXAlignment.Right, TextColor3 = Theme.Primary, Font = Theme.FontBold,
	})
	State.Infos[item.Id or (card.Id .. "/" .. item.Name)] = value
	return { Name = item.Name, Frame = row }
end

function RowBuilders.Input(card, item, order)
	local row = createRowFrame(card, order)
	local rowStroke = create("UIStroke", { Color = Theme.Primary, Transparency = 0.85, Thickness = 1, Parent = row })
	local box = create("TextBox", {
		Position = UDim2.fromOffset(10, 0),
		Size = UDim2.new(1, -20, 1, 0),
		BackgroundTransparency = 1,
		Text = item.Default or "",
		PlaceholderText = item.Name,
		PlaceholderColor3 = Theme.SubText,
		TextColor3 = Theme.Text,
		Font = Theme.Font,
		TextSize = 13,
		TextXAlignment = Enum.TextXAlignment.Left,
		ClearTextOnFocus = false,
		Parent = row,
	})
	State.Inputs[item.Id or item.Name] = box
	connect(box.Focused, function() tween(rowStroke, 0.15, { Transparency = 0.2 }) end)
	connect(box.FocusLost, function() tween(rowStroke, 0.15, { Transparency = 0.85 }) end)
	return { Name = item.Name, Frame = row }
end

local function createCard(tab, spec)
	local card = {
		Title = spec.Title,
		Id = tab.Id .. "/" .. spec.Title,
		Rows = {},
		ToggleList = {},
		Weight = 2,
	}
	local frame = create("CanvasGroup", {
		Name = spec.Title,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = Theme.Card,
		GroupTransparency = 0,
	}, { corner(12), stroke(Theme.Primary, 0.72, 1), padding(10), listLayout(6) })
	card.Frame = frame

	-- Header: title + optional status
	local header = create("Frame", { Size = UDim2.new(1, 0, 0, 22), BackgroundTransparency = 1, LayoutOrder = 0, Parent = frame })
	label(header, spec.Title, { Size = UDim2.new(1, -76, 1, 0), Font = Theme.FontBold, TextSize = 15 })

	local statusDot, statusLabel
	if spec.Status then
		statusDot = create("Frame", {
			AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -60, 0.5, 0),
			Size = UDim2.fromOffset(7, 7), BackgroundColor3 = Theme.OffKnob, Parent = header,
		}, { corner(4) })
		statusLabel = label(header, "Idle", {
			AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, 0, 0.5, 0), Size = UDim2.fromOffset(54, 20),
			TextXAlignment = Enum.TextXAlignment.Right, TextSize = 11, TextColor3 = Theme.SubText,
		})
	end

	function card.Refresh()
		if not statusLabel then return end
		local active = 0
		for _, toggle in ipairs(card.ToggleList) do
			if toggle.Value then active += 1 end
		end
		statusLabel.Text = active > 0 and (active .. " active") or "Idle"
		tween(statusDot, 0.2, { BackgroundColor3 = active > 0 and Theme.Success or Theme.OffKnob })
		tween(statusLabel, 0.2, { TextColor3 = active > 0 and Theme.Success or Theme.SubText })
	end

	if spec.Description then
		label(frame, spec.Description, {
			Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, LayoutOrder = 1,
			TextSize = 12, TextColor3 = Theme.SubText, TextWrapped = true, TextTruncate = Enum.TextTruncate.None,
		})
		card.Weight += 1
	end

	for index, item in ipairs(spec.Items or {}) do
		local builder = RowBuilders[item.Type or "Toggle"]
		if builder then
			table.insert(card.Rows, builder(card, item, 1 + index))
			card.Weight += 1
		end
	end

	table.insert(tab.Cards, card)
	return card
end

--// ============================================================
--// 6. TAB MANAGEMENT
--// ============================================================
local COLUMN_GAP = 10

local function createTab(definition)
	local tab = { Id = definition.Id, Name = definition.Name, Icon = definition.Icon, Cards = {}, ColumnCount = 0 }

	tab.Page = create("ScrollingFrame", {
		Name = definition.Id,
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 3,
		ScrollBarImageColor3 = Theme.Primary,
		ScrollBarImageTransparency = 0.3,
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ElasticBehavior = Enum.ElasticBehavior.Never,
		Visible = false,
		Parent = ContentArea,
	}, { padding(12) })

	local holder = create("Frame", {
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		Parent = tab.Page,
	}, { listLayout(COLUMN_GAP, Enum.FillDirection.Horizontal) })

	tab.Columns = {}
	for index = 1, 2 do
		tab.Columns[index] = create("Frame", {
			Name = "Column" .. index,
			Size = UDim2.new(0.5, -COLUMN_GAP / 2, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			LayoutOrder = index,
			Parent = holder,
		}, { listLayout(COLUMN_GAP) })
	end

	-- Distributes cards across 1 or 2 columns by estimated height
	function tab.Assign(count)
		if tab.ColumnCount == count then return end
		tab.ColumnCount = count
		tab.Columns[2].Visible = count == 2
		local width = UDim2.new(1 / count, -COLUMN_GAP * (count - 1) / count, 0, 0)
		tab.Columns[1].Size = width
		tab.Columns[2].Size = width
		local heights = { 0, 0 }
		for order, card in ipairs(tab.Cards) do
			local target = (count == 2 and heights[2] < heights[1]) and 2 or 1
			card.Frame.LayoutOrder = order
			card.Frame.Parent = tab.Columns[target]
			heights[target] += card.Weight
		end
	end

	-- Sidebar button
	local button = create("TextButton", {
		Name = definition.Id,
		Size = UDim2.new(1, 0, 0, 36),
		BackgroundColor3 = Theme.Card,
		BackgroundTransparency = 1,
		Text = "",
		AutoButtonColor = false,
		LayoutOrder = #State.TabOrder + 1,
		Parent = SidebarList,
	}, { corner(10) })
	local fill = create("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Parent = button,
	}, {
		corner(10),
		create("UIGradient", { Color = ColorSequence.new(Theme.Neon, Theme.Deep), Rotation = 0 }),
	})
	tab.Stroke = create("UIStroke", { Color = Theme.Primary, Thickness = 1.5, Transparency = 1, Parent = fill })
	tab.Fill = fill
	tab.Button = button
	tab.IconLabel = label(button, definition.Icon, {
		Size = UDim2.new(0, 24, 1, 0), Position = UDim2.fromOffset(10, 0),
		TextXAlignment = Enum.TextXAlignment.Center, TextSize = 16, TextColor3 = Theme.SubText,
	})
	tab.NameLabel = label(button, definition.Name, {
		Position = UDim2.fromOffset(40, 0), Size = UDim2.new(1, -46, 1, 0), TextColor3 = Theme.SubText,
	})

	connect(button.MouseEnter, function()
		if State.ActiveTab ~= tab.Id then tween(button, 0.15, { BackgroundTransparency = 0.6 }) end
	end)
	connect(button.MouseLeave, function()
		if State.ActiveTab ~= tab.Id then tween(button, 0.15, { BackgroundTransparency = 1 }) end
	end)
	connect(button.Activated, function()
		selectTab(tab.Id)
	end)

	State.Tabs[tab.Id] = tab
	table.insert(State.TabOrder, tab.Id)
	return tab
end

local function setTabActive(tab, active)
	tween(tab.Fill, 0.25, { BackgroundTransparency = active and 0 or 1 })
	tween(tab.Stroke, 0.25, { Transparency = active and 0.35 or 1 })
	tween(tab.Button, 0.15, { BackgroundTransparency = 1 })
	tween(tab.NameLabel, 0.25, { TextColor3 = active and Theme.Text or Theme.SubText })
	tween(tab.IconLabel, 0.25, { TextColor3 = active and Theme.Text or Theme.SubText })
end

local function animateCards(tab)
	local shown = 0
	for _, card in ipairs(tab.Cards) do
		if card.Frame.Visible then
			shown += 1
			card.Frame.GroupTransparency = 1
			tween(card.Frame, 0.3, { GroupTransparency = 0 }, nil, nil, math.min(shown * 0.04, 0.28))
		end
	end
end

selectTab = function(id)
	local tab = State.Tabs[id]
	if not tab or State.ActiveTab == id then return end
	local previous = State.Tabs[State.ActiveTab]
	if previous then
		previous.Page.Visible = false
		setTabActive(previous, false)
	end
	State.ActiveTab = id
	tab.Page.CanvasPosition = Vector2.zero
	tab.Page.Visible = true
	setTabActive(tab, true)
	Breadcrumb.Text = tab.Name
	applyFilter()
	animateCards(tab)
end

--// ============================================================
--// 9. SEARCH FUNCTIONALITY
--// ============================================================
applyFilter = function()
	local tab = State.Tabs[State.ActiveTab]
	if not tab then return end
	local query = string.lower(State.Query)
	local anyVisible = false

	for _, card in ipairs(tab.Cards) do
		local titleMatch = query == "" or string.find(string.lower(card.Title), query, 1, true) ~= nil
		local anyRow = false
		for _, row in ipairs(card.Rows) do
			local match = titleMatch or string.find(string.lower(row.Name), query, 1, true) ~= nil
			row.Frame.Visible = match
			anyRow = anyRow or match
		end
		local show = titleMatch or anyRow
		card.Frame.Visible = show
		anyVisible = anyVisible or show
	end

	EmptyLabel.Visible = not anyVisible
	ClearButton.Visible = query ~= ""
end

connect(SearchBox:GetPropertyChangedSignal("Text"), function()
	State.Query = SearchBox.Text
	applyFilter()
end)
connect(SearchBox.Focused, function() tween(SearchStroke, 0.15, { Transparency = 0.2 }) end)
connect(SearchBox.FocusLost, function() tween(SearchStroke, 0.15, { Transparency = 0.8 }) end)
connect(ClearButton.Activated, function()
	SearchBox.Text = ""
end)

--// ============================================================
--// 10. CONFIGURATION MANAGEMENT
--// ============================================================
local Storage = {}
local memoryStore = {} -- fallback when no file API exists (session only)
local hasFileApi = typeof(writefile) == "function" and typeof(readfile) == "function" and typeof(isfile) == "function"

local function sanitizeName(name)
	local clean = (tostring(name or ""):gsub("[^%w_%-]", ""))
	return clean == "" and Config.DefaultConfig or clean
end

function Storage.write(name, contents)
	if hasFileApi then
		return pcall(function()
			if typeof(isfolder) == "function" and typeof(makefolder) == "function" and not isfolder(Config.ConfigFolder) then
				makefolder(Config.ConfigFolder)
			end
			writefile(Config.ConfigFolder .. "/" .. name .. ".json", contents)
		end)
	end
	memoryStore[name] = contents
	return true
end

function Storage.read(name)
	if hasFileApi then
		local path = Config.ConfigFolder .. "/" .. name .. ".json"
		local ok, exists = pcall(isfile, path)
		if ok and exists then
			local readOk, contents = pcall(readfile, path)
			return readOk and contents or nil
		end
		return nil
	end
	return memoryStore[name]
end

local ConfigManager = {}

local function currentConfigName()
	local box = State.Inputs["ConfigName"]
	return sanitizeName(box and box.Text)
end

function ConfigManager.save(name)
	local data = { Version = 1, Toggles = {} }
	for flag, toggle in pairs(State.Toggles) do
		if not toggle.NoSave then
			data.Toggles[flag] = toggle.Value
		end
	end
	local ok = Storage.write(name, HttpService:JSONEncode(data))
	if ok then
		notify("Success", "Config saved", "Saved as \"" .. name .. "\".")
	else
		notify("Error", "Save failed", "Could not write the configuration.")
	end
end

function ConfigManager.load(name)
	local raw = Storage.read(name)
	if not raw then
		notify("Warning", "Config not found", "No saved config named \"" .. name .. "\".")
		return
	end
	local ok, data = pcall(function() return HttpService:JSONDecode(raw) end)
	if not ok or type(data) ~= "table" or type(data.Toggles) ~= "table" then
		notify("Error", "Load failed", "The configuration file is invalid.")
		return
	end
	for flag, toggle in pairs(State.Toggles) do
		local saved = data.Toggles[flag]
		if saved ~= nil and not toggle.NoSave then
			toggle:Set(saved)
		end
	end
	notify("Success", "Config loaded", "Loaded \"" .. name .. "\".")
end

function ConfigManager.reset()
	for _, toggle in pairs(State.Toggles) do
		if not toggle.NoSave then
			toggle:Set(toggle.Default)
		end
	end
	notify("Info", "Config reset", "All toggles returned to defaults.")
end

refreshActiveCount = function()
	local label_ = State.Infos["ActiveCount"]
	if not label_ then return end
	local count = 0
	for _, toggle in pairs(State.Toggles) do
		if not toggle.NoSave and toggle.Value then count += 1 end
	end
	label_.Text = tostring(count)
end

--// ============================================================
--// TAB CONTENT DEFINITIONS (data-driven)
--// ============================================================
local function T(name, default) return { Type = "Toggle", Name = name, Default = default } end

local TabDefinitions = {
	{
		Id = "Core", Name = "Core", Icon = "CORE",
		Cards = {
			{ Title = "Main Farm", Status = true, Items = { T("Auto Farm Level"), T("Auto Farm Submerged"), T("Auto Kill Near") } },
			{ Title = "Boss", Status = true, Items = { T("Auto Select Boss"), T("Auto Farm Boss") } },
			{ Title = "AutoRaidPirate", Items = { T("Farm Pirate") } },
			{ Title = "Tyrant of the Skies", Status = true, Description = "Requires all eyes to be placed.",
				Items = { T("Check Eyes Status"), T("Auto Farm Tyrant"), T("Summon Tyrant of the Skies") } },
			{ Title = "Section", Status = true, Items = {
				{ Type = "Info", Name = "Current Bones", Value = "0" },
				T("Farm Bone"), T("Separator Hallow Scythe"), T("Trade Bone"), T("Auto Pray"), T("Auto Try Luck"),
			} },
			{ Title = "Katakuri", Status = true, Items = {
				{ Type = "Info", Name = "Kill Progress", Value = "0 / 0" },
				T("Farm Katakuri"), T("Farm Katakuri V2"),
			} },
			{ Title = "Boss Farm", Description = "Additional boss-related options.",
				Items = { T("Auto Farm All Bosses"), T("Hop When Boss Missing") } },
		},
	},
	{ Id = "Config", Name = "Config", Icon = "CFG", Cards = {} }, -- built below (needs ConfigManager)
	{
		Id = "Farming", Name = "Farming", Icon = "FARM",
		Cards = {
			{ Title = "Mastery", Status = true, Items = { T("Auto Mastery Fruit"), T("Auto Mastery Gun"), T("Auto Mastery Sword") } },
			{ Title = "Collection", Items = { T("Auto Collect Chests"), T("Auto Collect Berries") } },
		},
	},
	{
		Id = "AutoFishing", Name = "Auto Fishing", Icon = "FISH",
		Cards = {
			{ Title = "Fishing", Status = true, Description = "Hands-free fishing helpers.",
				Items = { T("Auto Cast"), T("Auto Reel"), T("Auto Sell Fish") } },
		},
	},
	{
		Id = "Progression", Name = "Progression", Icon = "STAT",
		Cards = {
			{ Title = "Stats", Items = { T("Auto Allocate Stats"), T("Auto Upgrade Weapon") } },
			{ Title = "Unlocks", Items = { T("Auto Unlock Abilities"), T("Auto Buy Upgrades") } },
		},
	},
	{
		Id = "Quests", Name = "Quests", Icon = "QUEST",
		Cards = {
			{ Title = "Quest Helper", Status = true, Items = { T("Auto Accept Quest"), T("Auto Complete Quest") } },
		},
	},
	{
		Id = "RaceV4", Name = "Race V4", Icon = "RACE",
		Cards = {
			{ Title = "Trials", Status = true, Items = { T("Auto Trial"), T("Auto Train"), T("Auto Pull Lever") } },
		},
	},
	{
		Id = "WorldEvents", Name = "World Events", Icon = "EVENT",
		Cards = {
			{ Title = "Events", Items = { T("Auto Join Event"), T("Event Notifier") } },
		},
	},
	{
		Id = "VolcanoDojo", Name = "Volcano Dojo", Icon = "DOJO",
		Cards = {
			{ Title = "Dojo", Status = true, Items = { T("Auto Dojo Quest"), T("Auto Belt Upgrade") } },
		},
	},
	{
		Id = "SeaEvents", Name = "Sea Events", Icon = "SEA",
		Cards = {
			{ Title = "Sea", Status = true, Items = { T("Auto Sea Event"), T("Auto Collect Loot"), T("Auto Sail") } },
		},
	},
	{ Id = "Settings", Name = "Settings", Icon = "SET", Cards = {} }, -- built below
}

-- Config tab
TabDefinitions[2].Cards = {
	{ Title = "Configuration", Description = "Save, load or reset your toggle states.", Items = {
		{ Type = "Input", Name = "Configuration Name", Id = "ConfigName", Default = Config.DefaultConfig },
		{ Type = "Button", Name = "Save Configuration", Callback = function() ConfigManager.save(currentConfigName()) end },
		{ Type = "Button", Name = "Load Configuration", Callback = function() ConfigManager.load(currentConfigName()) end },
		{ Type = "Button", Name = "Reset Configuration", Callback = ConfigManager.reset },
	} },
	{ Title = "Status", Items = {
		{ Type = "Info", Name = "Active Features", Id = "ActiveCount", Value = "0" },
		{ Type = "Info", Name = "Storage", Value = hasFileApi and "File system" or "Session memory" },
	} },
}

-- Settings tab
local function updateScale(delta)
	State.Scale = math.clamp(math.round((State.Scale + delta) * 10) / 10, 0.7, 1.3)
	tween(WindowScale, 0.2, { Scale = State.Scale })
	if State.Infos["UIScale"] then State.Infos["UIScale"].Text = string.format("%d%%", State.Scale * 100) end
	layout(true)
end

TabDefinitions[#TabDefinitions].Cards = {
	{ Title = "Interface", Items = {
		{ Type = "Toggle", Name = "Compact Mode", NoSave = true, Callback = function(v) State.Compact = v; layout(true) end },
		{ Type = "Toggle", Name = "Notifications", Default = true, NoSave = true, Callback = function(v) State.Notifications = v end },
		{ Type = "Info", Name = "UI Scale", Id = "UIScale", Value = "100%" },
		{ Type = "Button", Name = "Increase Scale", Callback = function() updateScale(0.1) end },
		{ Type = "Button", Name = "Decrease Scale", Callback = function() updateScale(-0.1) end },
		{ Type = "Button", Name = "Reset Window Position", Callback = function()
			tween(Window, 0.3, { Position = UDim2.fromScale(0.5, 0.5) }, Enum.EasingStyle.Quint)
		end },
	} },
	{ Title = "About", Items = {
		{ Type = "Info", Name = "Version", Value = Config.Version },
		{ Type = "Info", Name = "Toggle Key", Value = Config.ToggleKey.Name },
		{ Type = "Button", Name = "Destroy Interface", Callback = function() Nexus.Destroy() end },
	} },
}

local function buildTabs()
	for _, definition in ipairs(TabDefinitions) do
		local tab = createTab(definition)
		for _, cardSpec in ipairs(definition.Cards) do
			local card = createCard(tab, cardSpec)
			card.Refresh()
		end
	end
end

--// ============================================================
--// 12. ANIMATIONS / WINDOW BEHAVIOR (layout, open/close, drag)
--// ============================================================
layout = function(animate)
	if State.Destroyed then return end
	local viewport = getViewport()
	local scale = State.Scale
	local width = math.clamp(viewport.X / scale - 24, Config.MinSize.X, Config.BaseSize.X)
	local height = math.clamp(viewport.Y / scale - 24, Config.MinSize.Y, Config.BaseSize.Y)
	local compact = State.Compact or width < 520
	local sidebarWidth = compact and Config.SidebarCompactWidth or Config.SidebarWidth

	local function apply(instance, props)
		if animate then tween(instance, 0.25, props) else setProps(instance, props) end
	end

	apply(Window, { Size = UDim2.fromOffset(width, State.Minimized and Config.HeaderHeight or height) })
	apply(Sidebar, { Size = UDim2.new(0, sidebarWidth, 1, 0) })
	apply(ContentArea, {
		Position = UDim2.new(0, sidebarWidth + 1, 0, 0),
		Size = UDim2.new(1, -(sidebarWidth + 1), 1, 0),
	})

	-- Sidebar labels / icons
	for _, tab in pairs(State.Tabs) do
		tab.NameLabel.Visible = not compact
		tab.IconLabel.AnchorPoint = compact and Vector2.new(0.5, 0) or Vector2.zero
		tab.IconLabel.Position = compact and UDim2.fromScale(0.5, 0) or UDim2.fromOffset(10, 0)
	end
	FooterLabel.Visible = not compact

	-- Header responsiveness
	BrandLabel.Visible = width >= 520
	SeparatorLabel.Visible = width >= 520
	SearchWrap.Size = UDim2.fromOffset(width < 400 and 96 or 170, 30)
	SearchBox.PlaceholderText = width < 400 and "Search" or "Search features..."

	-- Columns: 1 on narrow screens, 2 otherwise
	local columns = (width - sidebarWidth) >= 430 and 2 or 1
	if columns ~= State.ColumnCount then
		State.ColumnCount = columns
		for _, tab in pairs(State.Tabs) do tab.Assign(columns) end
	end
end

setMinimized = function(minimized)
	if State.Destroyed then return end
	State.Minimized = minimized
	MinimizeButton.Text = minimized and "+" or "−"
	if minimized then
		-- Hide the full panel and reveal the floating purple N launcher.
		MiniLauncher.Visible = true
		MiniLauncherScale.Scale = 0.7
		tween(MiniLauncherScale, 0.24, { Scale = 1 }, Enum.EasingStyle.Back)
		local closing = tween(WindowScale, 0.18, { Scale = State.Scale * 0.88 }, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		closing.Completed:Once(function()
			if State.Minimized and not State.Destroyed then Window.Visible = false end
		end)
	else
		MiniLauncher.Visible = false
		Body.Visible = true
		Window.Visible = true
		layout(true)
		WindowScale.Scale = State.Scale * 0.88
		tween(WindowScale, 0.24, { Scale = State.Scale }, Enum.EasingStyle.Back)
	end
end

function Nexus.SetVisible(visible)
	if State.Destroyed or State.Visible == visible then return end
	State.Visible = visible
	if visible then
		Window.Visible = true
		WindowScale.Scale = State.Scale * 0.9
		tween(WindowScale, 0.35, { Scale = State.Scale }, Enum.EasingStyle.Back)
		local tab = State.Tabs[State.ActiveTab]
		if tab then animateCards(tab) end
	else
		local closing = tween(WindowScale, 0.2, { Scale = State.Scale * 0.9 }, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		closing.Completed:Once(function()
			if not State.Visible then Window.Visible = false end
		end)
	end
end

-- Draggable (mouse + touch). Move listener exists only while dragging.
do
	local dragging = false
	local moveConnection, endConnection

	local function stopDrag()
		dragging = false
		if moveConnection then moveConnection:Disconnect() moveConnection = nil end
		if endConnection then endConnection:Disconnect() endConnection = nil end
	end
	table.insert(Cleanups, stopDrag)

	connect(Header.InputBegan, function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		stopDrag()
		dragging = true
		local startInput = input.Position
		local startPosition = Window.Position

		moveConnection = UserInputService.InputChanged:Connect(function(moved)
			if not dragging then return end
			if moved.UserInputType ~= Enum.UserInputType.MouseMovement and moved.UserInputType ~= Enum.UserInputType.Touch then
				return
			end
			local delta = moved.Position - startInput
			local viewport = getViewport()
			local x = math.clamp(startPosition.X.Offset + delta.X, -viewport.X / 2 + 40, viewport.X / 2 - 40)
			local y = math.clamp(startPosition.Y.Offset + delta.Y, -viewport.Y / 2 + 24, viewport.Y / 2 - 24)
			Window.Position = UDim2.new(startPosition.X.Scale, x, startPosition.Y.Scale, y)
		end)
		endConnection = input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then stopDrag() end
		end)
	end)
end

-- Header buttons / hotkey / viewport changes
connect(MinimizeButton.Activated, function() setMinimized(not State.Minimized) end)
connect(MiniLauncher.Activated, function() setMinimized(false) end)
connect(CloseButton.Activated, function() Nexus.Destroy() end)
connect(UserInputService.InputBegan, function(input, processed)
	if not processed and input.KeyCode == Config.ToggleKey then
		Nexus.SetVisible(not State.Visible)
	end
end)
connect(ScreenGui:GetPropertyChangedSignal("AbsoluteSize"), function() layout(false) end)

--// ============================================================
--// Public API
--// ============================================================
Nexus.Notify = notify

function Nexus.SetToggle(flag, value)
	local toggle = State.Toggles[flag]
	if toggle then toggle:Set(value) end
end

function Nexus.GetToggle(flag)
	local toggle = State.Toggles[flag]
	return toggle and toggle.Value or false
end

function Nexus.SetInfo(id, text)
	local target = State.Infos[id]
	if target then target.Text = tostring(text) end
end

local function cleanup()
	for _, fn in ipairs(Cleanups) do pcall(fn) end
	for _, connection in ipairs(Connections) do connection:Disconnect() end
	table.clear(Connections)
	table.clear(Cleanups)
	table.clear(State.Toggles)
	table.clear(State.Infos)
	table.clear(State.Inputs)
	ScreenGui:Destroy()
end

function Nexus.Destroy()
	if State.Destroyed then return end
	State.Destroyed = true
	local closing = tween(WindowScale, 0.2, { Scale = State.Scale * 0.85 }, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
	closing.Completed:Once(cleanup)
	task.delay(0.5, cleanup) -- fallback; Destroy on a destroyed instance is harmless
end

--// ============================================================
--// LOADING SCREEN
--// ============================================================
local function showLoadingScreen()
	local overlay = create("CanvasGroup", {
		Name = "Loading",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(280, 140),
		BackgroundColor3 = Theme.Secondary,
		GroupTransparency = 1,
		Parent = ScreenGui,
	}, { corner(16), stroke(Theme.Primary, 0.4, 1.5) })

	local loadingLogo = createLogo(overlay, 44)
	loadingLogo.AnchorPoint = Vector2.new(0.5, 0)
	loadingLogo.Position = UDim2.new(0.5, 0, 0, 18)
	label(overlay, Config.Name, {
		Position = UDim2.fromOffset(0, 68), Size = UDim2.new(1, 0, 0, 20),
		TextXAlignment = Enum.TextXAlignment.Center, Font = Theme.FontBold, TextSize = 16,
	})
	local status = label(overlay, "Starting...", {
		Position = UDim2.fromOffset(0, 90), Size = UDim2.new(1, 0, 0, 16),
		TextXAlignment = Enum.TextXAlignment.Center, TextSize = 11, TextColor3 = Theme.SubText,
	})
	local barTrack = create("Frame", {
		AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.new(0.5, 0, 0, 116),
		Size = UDim2.new(1, -48, 0, 4), BackgroundColor3 = Theme.Off, Parent = overlay,
	}, { corner(2) })
	local barFill = create("Frame", {
		Size = UDim2.fromScale(0, 1), BackgroundColor3 = Color3.new(1, 1, 1), Parent = barTrack,
	}, { corner(2), create("UIGradient", { Color = ColorSequence.new(Theme.Primary, Theme.Deep) }) })

	tween(overlay, 0.3, { GroupTransparency = 0 })
	local steps = { "Initializing...", "Building interface...", "Loading configuration...", "Ready" }
	for index, step in ipairs(steps) do
		if State.Destroyed then return end
		status.Text = step
		tween(barFill, 0.25, { Size = UDim2.fromScale(index / #steps, 1) })
		task.wait(0.3)
	end
	tween(overlay, 0.3, { GroupTransparency = 1 })
	task.wait(0.3)
	overlay:Destroy()
end

--// ============================================================
--// 13. INITIALIZATION
--// ============================================================
buildTabs()
layout(false)
selectTab(State.TabOrder[1])
refreshActiveCount()

task.spawn(function()
	showLoadingScreen()
	if State.Destroyed then return end
	Nexus.SetVisible(true)
	notify("Success", "Welcome to " .. Config.Name, "Press " .. Config.ToggleKey.Name .. " to hide or show the hub.", 4)
end)

return Nexus
