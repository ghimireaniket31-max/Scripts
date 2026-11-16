--[[
	CrimsonUI - Roblox UI Library (Luau)
	Red / shiny theme, sidebar categories, tabs, sub tabs, collapsible sections,
	sub sections, minimize-to-pill (WindUI style), notifications, animations.

	Elements: Toggle, Button, Slider, Dropdown (single/multi), Textbox, Keybind,
	          Label, Paragraph, Divider
]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Library = { Flags = {}, Windows = {} }

local Theme = {
	Background = Color3.fromRGB(11, 7, 9),
	Panel = Color3.fromRGB(17, 10, 13),
	Card = Color3.fromRGB(24, 14, 18),
	Card2 = Color3.fromRGB(32, 19, 24),
	Off = Color3.fromRGB(46, 31, 36),
	Accent = Color3.fromRGB(230, 25, 50),
	AccentDark = Color3.fromRGB(120, 8, 22),
	AccentLight = Color3.fromRGB(255, 105, 120),
	Text = Color3.fromRGB(242, 236, 237),
	SubText = Color3.fromRGB(158, 135, 140),
	Stroke = Color3.fromRGB(78, 30, 40),
}
Library.Theme = Theme

local EZ = Enum.EasingStyle
local ED = Enum.EasingDirection

---------------------------------------------------------------------
-- Helpers
---------------------------------------------------------------------
local function Create(class, props, children)
	local obj = Instance.new(class)
	local parent
	for k, v in pairs(props or {}) do
		if k == "Parent" then
			parent = v
		else
			obj[k] = v
		end
	end
	for _, c in ipairs(children or {}) do
		c.Parent = obj
	end
	if parent then
		obj.Parent = parent
	end
	return obj
end

local function Tween(obj, props, t, style, dir)
	local tw = TweenService:Create(obj, TweenInfo.new(t or 0.25, style or EZ.Quint, dir or ED.Out), props)
	tw:Play()
	return tw
end

local function Corner(o, r)
	return Create("UICorner", { CornerRadius = UDim.new(0, r), Parent = o })
end

local function Stroke(o, color, th, tr)
	return Create("UIStroke", {
		Color = color, Thickness = th or 1, Transparency = tr or 0,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Parent = o,
	})
end

local function Pad(o, l, t, r, b)
	return Create("UIPadding", {
		PaddingLeft = UDim.new(0, l or 0), PaddingTop = UDim.new(0, t or 0),
		PaddingRight = UDim.new(0, r or 0), PaddingBottom = UDim.new(0, b or 0), Parent = o,
	})
end

local function Fire(cb, ...)
	if cb then task.spawn(cb, ...) end
end

local function Label(props)
	local p = {
		BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 13,
		TextColor3 = Theme.Text, TextXAlignment = Enum.TextXAlignment.Left,
	}
	for k, v in pairs(props) do p[k] = v end
	return Create("TextLabel", p)
end

-- one Heartbeat loop rotates every shiny gradient
local spinners, spinConn = {}, nil
local function Spin(g, speed)
	spinners[g] = speed or 80
	if not spinConn then
		spinConn = RunService.Heartbeat:Connect(function(dt)
			for gr, s in pairs(spinners) do
				if gr.Parent then
					gr.Rotation = (gr.Rotation + dt * s) % 360
				else
					spinners[gr] = nil
				end
			end
		end)
	end
end

local function ShineStroke(parent, th)
	local s = Create("UIStroke", {
		Thickness = th or 1.5, ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		Color = Color3.new(1, 1, 1), Parent = parent,
	})
	local g = Create("UIGradient", {
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Theme.AccentDark),
			ColorSequenceKeypoint.new(0.3, Theme.Accent),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 195, 200)),
			ColorSequenceKeypoint.new(0.7, Theme.Accent),
			ColorSequenceKeypoint.new(1, Theme.AccentDark),
		}),
		Parent = s,
	})
	Spin(g, 80)
	return s
end

local function AccentGradient(o, rot)
	return Create("UIGradient", {
		Color = ColorSequence.new(Color3.fromRGB(255, 60, 82), Color3.fromRGB(145, 10, 28)),
		Rotation = rot or 0, Parent = o,
	})
end

local function Ripple(btn)
	btn.ClipsDescendants = true
	btn.InputBegan:Connect(function(i)
		if i.UserInputType ~= Enum.UserInputType.MouseButton1 and i.UserInputType ~= Enum.UserInputType.Touch then return end
		local abs, size = btn.AbsolutePosition, btn.AbsoluteSize
		local c = Create("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromOffset(i.Position.X - abs.X, i.Position.Y - abs.Y),
			Size = UDim2.fromOffset(0, 0), BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 0.7, ZIndex = btn.ZIndex + 5, Parent = btn,
		})
		Corner(c, 999)
		local d = math.max(size.X, size.Y) * 2.4
		Tween(c, { Size = UDim2.fromOffset(d, d), BackgroundTransparency = 1 }, 0.55)
		task.delay(0.6, function() c:Destroy() end)
	end)
end

-- diagonal light sweep on hover
local function HoverShine(btn)
	local shine = Create("Frame", {
		Size = UDim2.new(0.35, 0, 2, 0), Position = UDim2.new(-0.5, 0, -0.5, 0), Rotation = 20,
		BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 0.82,
		BorderSizePixel = 0, ZIndex = btn.ZIndex + 3, Parent = btn,
	})
	Create("UIGradient", {
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 1),
		}), Parent = shine,
	})
	btn.MouseEnter:Connect(function()
		shine.Position = UDim2.new(-0.5, 0, -0.5, 0)
		Tween(shine, { Position = UDim2.new(1.2, 0, -0.5, 0) }, 0.6, EZ.Sine)
	end)
end

local function MakeIcon(parent, icon, pos, size)
	size = size or 14
	if type(icon) == "string" and (icon:find("rbxassetid") or icon:match("^%d+$")) then
		return Create("ImageLabel", {
			BackgroundTransparency = 1, Image = icon:match("^%d+$") and ("rbxassetid://" .. icon) or icon,
			ImageColor3 = Theme.SubText, Size = UDim2.fromOffset(size, size), Position = pos, Parent = parent,
		})
	end
	local d = Create("Frame", {
		Size = UDim2.fromOffset(6, 6), Position = pos + UDim2.fromOffset(4, size / 2 - 3),
		BackgroundColor3 = Theme.SubText, Parent = parent,
	})
	Corner(d, 3)
	return d
end

local function IconColor(ic, color, t)
	if ic:IsA("ImageLabel") then
		Tween(ic, { ImageColor3 = color }, t or 0.25)
	else
		Tween(ic, { BackgroundColor3 = color }, t or 0.25)
	end
end

local function MakeDraggable(window, handle, target)
	local dragging, dragStart, startPos
	handle.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
			dragging, dragStart, startPos = true, i.Position, target.Position
			i.Changed:Connect(function()
				if i.UserInputState == Enum.UserInputState.End then dragging = false end
			end)
		end
	end)
	window:_connect(UIS.InputChanged, function(i)
		if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
			local d = i.Position - dragStart
			Tween(target, {
				Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y),
			}, 0.08, EZ.Quad)
		end
	end)
end

-- collapsible card: header + body that animates open/closed
local function MakeCollapsible(card, headerH, body, layout, pad, chevron)
	local C = { Open = true }
	function C.Update(anim)
		local c = layout.AbsoluteContentSize.Y
		local bodyH = c > 0 and (c + pad) or 0
		body.Size = UDim2.new(1, 0, 0, bodyH)
		local h = headerH + (C.Open and bodyH or 0)
		if anim then
			Tween(card, { Size = UDim2.new(1, 0, 0, h) }, 0.32, EZ.Quart)
		else
			card.Size = UDim2.new(1, 0, 0, h)
		end
	end
	function C.SetOpen(v)
		C.Open = v
		if chevron then Tween(chevron, { Rotation = v and 90 or 0 }, 0.25, EZ.Back) end
		C.Update(true)
	end
	layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() C.Update(false) end)
	return C
end

local function GetGui()
	if Library._gui and Library._gui.Parent then return Library._gui end
	local gui = Create("ScreenGui", {
		Name = "CrimsonUI", ResetOnSpawn = false, IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling, DisplayOrder = 999,
	})
	local ok = pcall(function()
		gui.Parent = (gethui and gethui()) or game:GetService("CoreGui")
	end)
	if not ok or not gui.Parent then
		gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
	end
	Library._gui = gui
	return gui
end

---------------------------------------------------------------------
-- Notifications
---------------------------------------------------------------------
function Library:Notify(o)
	o = o or {}
	local gui = GetGui()
	local holder = gui:FindFirstChild("Notifications")
	if not holder then
		holder = Create("Frame", {
			Name = "Notifications", AnchorPoint = Vector2.new(1, 1), Position = UDim2.new(1, -14, 1, -14),
			Size = UDim2.fromOffset(290, 500), BackgroundTransparency = 1, Parent = gui,
		})
		Create("UIListLayout", {
			Padding = UDim.new(0, 8), VerticalAlignment = Enum.VerticalAlignment.Bottom,
			HorizontalAlignment = Enum.HorizontalAlignment.Right, SortOrder = Enum.SortOrder.LayoutOrder, Parent = holder,
		})
	end
	local wrap = Create("Frame", { Size = UDim2.fromOffset(290, 64), BackgroundTransparency = 1, Parent = holder })
	local card = Create("Frame", {
		Size = UDim2.fromScale(1, 1), Position = UDim2.fromScale(1.25, 0),
		BackgroundColor3 = Theme.Panel, ClipsDescendants = true, Parent = wrap,
	})
	Corner(card, 9)
	ShineStroke(card, 1.3)
	Label({ Text = o.Title or "Notification", Font = Enum.Font.GothamBold, TextSize = 14, TextColor3 = Theme.AccentLight,
		Position = UDim2.fromOffset(12, 8), Size = UDim2.new(1, -24, 0, 16), Parent = card })
	Label({ Text = o.Content or "", TextSize = 12, TextColor3 = Theme.SubText, TextWrapped = true,
		TextYAlignment = Enum.TextYAlignment.Top, Position = UDim2.fromOffset(12, 26),
		Size = UDim2.new(1, -24, 0, 30), Parent = card })
	local bar = Create("Frame", {
		AnchorPoint = Vector2.new(0, 1), Position = UDim2.fromScale(0, 1), Size = UDim2.new(1, 0, 0, 2),
		BackgroundColor3 = Theme.Accent, BorderSizePixel = 0, Parent = card,
	})
	AccentGradient(bar)
	Tween(card, { Position = UDim2.fromScale(0, 0) }, 0.5, EZ.Back)
	local dur = o.Duration or 4
	Tween(bar, { Size = UDim2.new(0, 0, 0, 2) }, dur, EZ.Linear)
	task.delay(dur, function()
		Tween(card, { Position = UDim2.fromScale(1.25, 0) }, 0.4, EZ.Back, ED.In)
		task.wait(0.45)
		wrap:Destroy()
	end)
end

---------------------------------------------------------------------
-- Group (Section / SubSection) with all elements
---------------------------------------------------------------------
local Group = {}
Group.__index = Group

local function NewGroup(window, parent, name, isSub, page)
	local self = setmetatable({ Window = window, Page = page }, Group)
	local HEADER = isSub and 28 or 34
	local card = Create("Frame", {
		Size = UDim2.new(1, 0, 0, HEADER), BackgroundColor3 = isSub and Theme.Card2 or Theme.Card,
		ClipsDescendants = true, Parent = parent,
	})
	Corner(card, isSub and 6 or 8)
	Stroke(card, Theme.Stroke, 1, 0.45)
	local header = Create("TextButton", {
		Size = UDim2.new(1, 0, 0, HEADER), BackgroundTransparency = 1, Text = "", AutoButtonColor = false, Parent = card,
	})
	local dot = Create("Frame", {
		Size = UDim2.fromOffset(6, 6), Position = UDim2.new(0, 12, 0.5, -3), BackgroundColor3 = Theme.Accent, Parent = header,
	})
	Corner(dot, 3)
	Stroke(dot, Theme.AccentLight, 3, 0.75)
	local title = Label({
		Text = name or "Section", Font = Enum.Font.GothamBold, TextSize = isSub and 12 or 13,
		Position = UDim2.fromOffset(28, 0), Size = UDim2.new(1, -56, 1, 0), Parent = header,
	})
	local chev = Label({
		Text = "›", Font = Enum.Font.GothamBold, TextSize = 20, TextColor3 = Theme.SubText,
		TextXAlignment = Enum.TextXAlignment.Center, Rotation = 90,
		Position = UDim2.new(1, -28, 0.5, -10), Size = UDim2.fromOffset(20, 20), Parent = header,
	})
	local body = Create("Frame", {
		Position = UDim2.fromOffset(0, HEADER), Size = UDim2.new(1, 0, 0, 0), BackgroundTransparency = 1, Parent = card,
	})
	Pad(body, 8, 0, 8, 0)
	local layout = Create("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder, Parent = body })
	self.Body = body
	self.Collapse = MakeCollapsible(card, HEADER, body, layout, 10, chev)
	self.Collapse.Update(false)
	header.MouseButton1Click:Connect(function() self.Collapse.SetOpen(not self.Collapse.Open) end)
	header.MouseEnter:Connect(function() Tween(title, { TextColor3 = Theme.AccentLight }, 0.2) end)
	header.MouseLeave:Connect(function() Tween(title, { TextColor3 = Theme.Text }, 0.2) end)
	return self
end

local function Register(self, row, name)
	table.insert(self.Window._rows, { row = row, name = (name or ""):lower() })
end

local function SetFlag(o, v)
	if o.Flag then Library.Flags[o.Flag] = v end
end

local function HoverRow(row)
	row.MouseEnter:Connect(function() Tween(row, { BackgroundTransparency = 0.9 }, 0.2) end)
	row.MouseLeave:Connect(function() Tween(row, { BackgroundTransparency = 1 }, 0.2) end)
end

function Group:AddSubSection(name)
	return NewGroup(self.Window, self.Body, name, true, self.Page)
end

function Group:AddDivider()
	local d = Create("Frame", { Size = UDim2.new(1, 0, 0, 1), BackgroundColor3 = Theme.Stroke, BackgroundTransparency = 0.5, BorderSizePixel = 0, Parent = self.Body })
	return d
end

function Group:AddLabel(text)
	local l = Label({ Text = text, TextSize = 12, TextColor3 = Theme.SubText, TextWrapped = true,
		Size = UDim2.new(1, 0, 0, 22), Parent = self.Body })
	Pad(l, 8, 0, 8, 0)
	local api = {}
	function api:Set(t) l.Text = t end
	return api
end

function Group:AddParagraph(o)
	local f = Create("Frame", { Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, Parent = self.Body })
	Pad(f, 8, 2, 8, 4)
	Create("UIListLayout", { Padding = UDim.new(0, 2), Parent = f })
	Label({ Text = o.Title or "", Font = Enum.Font.GothamBold, TextSize = 13, Size = UDim2.new(1, 0, 0, 16), Parent = f })
	local c = Label({ Text = o.Content or "", TextSize = 12, TextColor3 = Theme.SubText, TextWrapped = true,
		AutomaticSize = Enum.AutomaticSize.Y, Size = UDim2.new(1, 0, 0, 0), Parent = f })
	local api = {}
	function api:Set(t) c.Text = t end
	return api
end

function Group:AddToggle(o)
	o = o or {}
	local state = o.Default == true
	local row = Create("TextButton", {
		Size = UDim2.new(1, 0, 0, 30), BackgroundColor3 = Theme.Accent, BackgroundTransparency = 1,
		Text = "", AutoButtonColor = false, Parent = self.Body,
	})
	Corner(row, 6)
	HoverRow(row)
	local label = Label({ Text = o.Name or "Toggle", TextColor3 = Theme.SubText,
		Position = UDim2.fromOffset(8, 0), Size = UDim2.new(1, -60, 1, 0), Parent = row })
	local track = Create("Frame", {
		AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -6, 0.5, 0),
		Size = UDim2.fromOffset(36, 18), BackgroundColor3 = Theme.Off, Parent = row,
	})
	Corner(track, 9)
	local glow = Stroke(track, Theme.AccentLight, 1.5, 1)
	Create("UIGradient", { Color = ColorSequence.new(Color3.new(1, 1, 1), Color3.fromRGB(185, 185, 185)), Rotation = 90, Parent = track })
	local knob = Create("Frame", {
		Size = UDim2.fromOffset(14, 14), Position = UDim2.new(0, 2, 0.5, -7), BackgroundColor3 = Color3.new(1, 1, 1), Parent = track,
	})
	Corner(knob, 7)

	local api = {}
	local function render(anim)
		local t = anim and 0.3 or 0
		Tween(track, { BackgroundColor3 = state and Theme.Accent or Theme.Off }, t)
		Tween(glow, { Transparency = state and 0.35 or 1 }, t)
		Tween(knob, { Position = state and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7) }, t, EZ.Back)
		Tween(label, { TextColor3 = state and Theme.Text or Theme.SubText }, t)
	end
	function api:Set(v, silent)
		state = v and true or false
		render(true)
		SetFlag(o, state)
		if not silent then Fire(o.Callback, state) end
	end
	function api:Get() return state end
	row.MouseButton1Click:Connect(function() api:Set(not state) end)
	render(false)
	SetFlag(o, state)
	Register(self, row, o.Name)
	return api
end

function Group:AddButton(o)
	o = o or {}
	local b = Create("TextButton", {
		Size = UDim2.new(1, 0, 0, 30), BackgroundColor3 = Color3.new(1, 1, 1), Text = o.Name or "Button",
		Font = Enum.Font.GothamBold, TextSize = 13, TextColor3 = Color3.new(1, 1, 1), AutoButtonColor = false, Parent = self.Body,
	})
	Corner(b, 7)
	AccentGradient(b)
	Stroke(b, Theme.AccentLight, 1, 0.6)
	Ripple(b)
	HoverShine(b)
	b.MouseButton1Click:Connect(function() Fire(o.Callback) end)
	b.MouseButton1Down:Connect(function() Tween(b, { Size = UDim2.new(1, -6, 0, 28) }, 0.08) end)
	b.MouseButton1Up:Connect(function() Tween(b, { Size = UDim2.new(1, 0, 0, 30) }, 0.25, EZ.Back) end)
	b.MouseLeave:Connect(function() Tween(b, { Size = UDim2.new(1, 0, 0, 30) }, 0.2) end)
	Register(self, b, o.Name)
	local api = {}
	function api:SetText(t) b.Text = t end
	return api
end

function Group:AddSlider(o)
	o = o or {}
	local min, max, inc = o.Min or 0, o.Max or 100, o.Increment or 1
	local value = math.clamp(o.Default or min, min, max)
	local row = Create("Frame", { Size = UDim2.new(1, 0, 0, 44), BackgroundTransparency = 1, Parent = self.Body })
	Label({ Text = o.Name or "Slider", Position = UDim2.fromOffset(8, 2), Size = UDim2.new(0.6, 0, 0, 20), Parent = row })
	local val = Label({ Text = "", TextColor3 = Theme.AccentLight, Font = Enum.Font.GothamBold, TextXAlignment = Enum.TextXAlignment.Right,
		Position = UDim2.new(0.5, 0, 0, 2), Size = UDim2.new(0.5, -8, 0, 20), Parent = row })
	local bar = Create("Frame", { Position = UDim2.new(0, 8, 0, 29), Size = UDim2.new(1, -16, 0, 6), BackgroundColor3 = Theme.Off, Parent = row })
	Corner(bar, 3)
	local fill = Create("Frame", { Size = UDim2.fromScale(0, 1), BackgroundColor3 = Color3.new(1, 1, 1), Parent = bar })
	Corner(fill, 3)
	AccentGradient(fill)
	local knob = Create("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(1, 0.5), Size = UDim2.fromOffset(12, 12),
		BackgroundColor3 = Color3.new(1, 1, 1), Parent = fill,
	})
	Corner(knob, 6)
	local ks = Stroke(knob, Theme.Accent, 2, 0.2)

	local api = {}
	local function render(anim)
		local rel = (value - min) / math.max(max - min, 1e-9)
		val.Text = tostring(value) .. (o.Suffix or "")
		Tween(fill, { Size = UDim2.fromScale(rel, 1) }, anim and 0.12 or 0, EZ.Quad)
	end
	function api:Set(v, silent)
		v = math.clamp(math.floor((v - min) / inc + 0.5) * inc + min, min, max)
		value = tonumber(string.format("%.4f", v))
		render(true)
		SetFlag(o, value)
		if not silent then Fire(o.Callback, value) end
	end
	function api:Get() return value end

	local dragging = false
	local function fromX(x)
		api:Set(min + (max - min) * math.clamp((x - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1))
	end
	local function lock(v)
		if self.Page and self.Page.Scroll then self.Page.Scroll.ScrollingEnabled = not v end
	end
	row.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			lock(true)
			Tween(knob, { Size = UDim2.fromOffset(16, 16) }, 0.15, EZ.Back)
			Tween(ks, { Thickness = 4, Transparency = 0.5 }, 0.15)
			fromX(i.Position.X)
		end
	end)
	self.Window:_connect(UIS.InputChanged, function(i)
		if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
			fromX(i.Position.X)
		end
	end)
	self.Window:_connect(UIS.InputEnded, function(i)
		if dragging and (i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch) then
			dragging = false
			lock(false)
			Tween(knob, { Size = UDim2.fromOffset(12, 12) }, 0.2, EZ.Back)
			Tween(ks, { Thickness = 2, Transparency = 0.2 }, 0.2)
		end
	end)
	render(false)
	SetFlag(o, value)
	Register(self, row, o.Name)
	return api
end

function Group:AddDropdown(o)
	o = o or {}
	local options = o.Options or {}
	local multi = o.Multi == true
	local selected, current = {}, nil
	local open = false
	local listH = 0

	local row = Create("Frame", { Size = UDim2.new(1, 0, 0, 30), BackgroundTransparency = 1, ClipsDescendants = true, Parent = self.Body })
	local head = Create("TextButton", {
		Size = UDim2.new(1, 0, 0, 30), BackgroundColor3 = Theme.Accent, BackgroundTransparency = 1,
		Text = "", AutoButtonColor = false, Parent = row,
	})
	Corner(head, 6)
	HoverRow(head)
	Label({ Text = o.Name or "Dropdown", TextColor3 = Theme.SubText, Position = UDim2.fromOffset(8, 0), Size = UDim2.new(1, -150, 1, 0), Parent = head })
	local box = Create("Frame", {
		AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -6, 0.5, 0), Size = UDim2.fromOffset(130, 22),
		BackgroundColor3 = Theme.Off, Parent = head,
	})
	Corner(box, 6)
	local bstroke = Stroke(box, Theme.Accent, 1, 0.8)
	local txt = Label({ Text = "None", TextSize = 12, TextColor3 = Theme.AccentLight, TextTruncate = Enum.TextTruncate.AtEnd,
		Position = UDim2.fromOffset(8, 0), Size = UDim2.new(1, -26, 1, 0), Parent = box })
	local chev = Label({ Text = "›", Font = Enum.Font.GothamBold, TextSize = 18, TextColor3 = Theme.SubText, TextXAlignment = Enum.TextXAlignment.Center,
		Rotation = 90, Position = UDim2.new(1, -20, 0.5, -9), Size = UDim2.fromOffset(18, 18), Parent = box })

	local list = Create("ScrollingFrame", {
		Position = UDim2.fromOffset(0, 34), Size = UDim2.new(1, 0, 0, 0), BackgroundColor3 = Theme.Panel,
		BorderSizePixel = 0, ScrollBarThickness = 2, ScrollBarImageColor3 = Theme.Accent,
		CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, Parent = row,
	})
	Corner(list, 6)
	Pad(list, 4, 4, 4, 4)
	Create("UIListLayout", { Padding = UDim.new(0, 2), Parent = list })

	local buttons = {}
	local api = {}
	local function display()
		if multi then
			local t = {}
			for _, opt in ipairs(options) do if selected[opt] then table.insert(t, tostring(opt)) end end
			txt.Text = #t > 0 and table.concat(t, ", ") or "None"
		else
			txt.Text = current ~= nil and tostring(current) or "None"
		end
	end
	local function paint()
		for opt, b in pairs(buttons) do
			local on = multi and selected[opt] or (not multi and current == opt)
			Tween(b, { BackgroundTransparency = on and 0.75 or 1, TextColor3 = on and Theme.AccentLight or Theme.SubText }, 0.2)
		end
	end
	local function setOpen(v)
		open = v
		Tween(row, { Size = UDim2.new(1, 0, 0, v and (34 + listH + 4) or 30) }, 0.3, EZ.Quart)
		Tween(list, { Size = UDim2.new(1, 0, 0, listH) }, 0.3, EZ.Quart)
		Tween(chev, { Rotation = v and -90 or 90 }, 0.25, EZ.Back)
		Tween(bstroke, { Transparency = v and 0.2 or 0.8 }, 0.2)
	end
	local function result()
		if multi then
			local t = {}
			for _, opt in ipairs(options) do if selected[opt] then table.insert(t, opt) end end
			return t
		end
		return current
	end
	function api:Refresh(newOptions)
		options = newOptions or options
		for _, b in pairs(buttons) do b:Destroy() end
		buttons = {}
		for _, opt in ipairs(options) do
			local b = Create("TextButton", {
				Size = UDim2.new(1, 0, 0, 24), BackgroundColor3 = Theme.Accent, BackgroundTransparency = 1,
				Text = "   " .. tostring(opt), Font = Enum.Font.GothamMedium, TextSize = 12, TextColor3 = Theme.SubText,
				TextXAlignment = Enum.TextXAlignment.Left, AutoButtonColor = false, Parent = list,
			})
			Corner(b, 5)
			Ripple(b)
			buttons[opt] = b
			b.MouseButton1Click:Connect(function()
				if multi then
					selected[opt] = not selected[opt] or nil
				else
					current = opt
					setOpen(false)
				end
				display(); paint()
				SetFlag(o, result())
				Fire(o.Callback, result())
			end)
		end
		listH = math.min(#options, 5) * 26 + 8
		display(); paint()
		if open then setOpen(true) end
	end
	function api:Set(v, silent)
		if multi then
			selected = {}
			for _, x in ipairs(v or {}) do selected[x] = true end
		else
			current = v
		end
		display(); paint()
		SetFlag(o, result())
		if not silent then Fire(o.Callback, result()) end
	end
	function api:Get() return result() end
	head.MouseButton1Click:Connect(function() setOpen(not open) end)
	api:Refresh(options)
	if o.Default ~= nil then api:Set(o.Default, true) end
	Register(self, row, o.Name)
	return api
end

function Group:AddTextbox(o)
	o = o or {}
	local row = Create("Frame", { Size = UDim2.new(1, 0, 0, 30), BackgroundTransparency = 1, Parent = self.Body })
	Label({ Text = o.Name or "Textbox", TextColor3 = Theme.SubText, Position = UDim2.fromOffset(8, 0), Size = UDim2.new(1, -150, 1, 0), Parent = row })
	local box = Create("TextBox", {
		AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -6, 0.5, 0), Size = UDim2.fromOffset(130, 22),
		BackgroundColor3 = Theme.Off, Text = o.Default or "", PlaceholderText = o.Placeholder or "...",
		PlaceholderColor3 = Theme.SubText, TextColor3 = Theme.Text, Font = Enum.Font.GothamMedium, TextSize = 12,
		ClearTextOnFocus = false, Parent = row,
	})
	Corner(box, 6)
	local s = Stroke(box, Theme.Accent, 1, 0.85)
	box.Focused:Connect(function() Tween(s, { Transparency = 0.1 }, 0.2) end)
	box.FocusLost:Connect(function(enter)
		Tween(s, { Transparency = 0.85 }, 0.2)
		SetFlag(o, box.Text)
		Fire(o.Callback, box.Text, enter)
	end)
	SetFlag(o, box.Text)
	Register(self, row, o.Name)
	local api = {}
	function api:Set(t) box.Text = t; SetFlag(o, t) end
	function api:Get() return box.Text end
	return api
end

function Group:AddKeybind(o)
	o = o or {}
	local key, listening = o.Default, false
	local row = Create("Frame", { Size = UDim2.new(1, 0, 0, 30), BackgroundTransparency = 1, Parent = self.Body })
	Label({ Text = o.Name or "Keybind", TextColor3 = Theme.SubText, Position = UDim2.fromOffset(8, 0), Size = UDim2.new(1, -100, 1, 0), Parent = row })
	local b = Create("TextButton", {
		AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -6, 0.5, 0), Size = UDim2.fromOffset(80, 22),
		BackgroundColor3 = Theme.Off, Text = key and key.Name or "None", Font = Enum.Font.GothamBold, TextSize = 12,
		TextColor3 = Theme.AccentLight, AutoButtonColor = false, Parent = row,
	})
	Corner(b, 6)
	Stroke(b, Theme.Accent, 1, 0.8)
	Ripple(b)
	b.MouseButton1Click:Connect(function() listening = true; b.Text = "..." end)
	self.Window:_connect(UIS.InputBegan, function(i, gp)
		if listening then
			if i.UserInputType == Enum.UserInputType.Keyboard then
				key = i.KeyCode ~= Enum.KeyCode.Escape and i.KeyCode or nil
				listening = false
				b.Text = key and key.Name or "None"
				SetFlag(o, key)
				Fire(o.Changed, key)
			end
		elseif not gp and key and i.KeyCode == key then
			Fire(o.Callback, key)
		end
	end)
	Register(self, row, o.Name)
	local api = {}
	function api:Get() return key end
	return api
end

---------------------------------------------------------------------
-- Page (holds two columns of sections)
---------------------------------------------------------------------
local Page = {}
Page.__index = Page

local function NewPage(tab, name)
	local self = setmetatable({ Tab = tab, Name = name, Window = tab.Window }, Page)
	self.Frame = Create("CanvasGroup", {
		Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, GroupTransparency = 1, Visible = false, Parent = tab.Holder,
	})
	local scroll = Create("ScrollingFrame", {
		Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 3,
		ScrollBarImageColor3 = Theme.Accent, CanvasSize = UDim2.new(), Parent = self.Frame,
	})
	Pad(scroll, 10, 10, 10, 10)
	self.Scroll = scroll
	local function col(x, px)
		local f = Create("Frame", { Position = UDim2.new(x, px, 0, 0), Size = UDim2.new(0.5, -5, 1, 0), BackgroundTransparency = 1, Parent = scroll })
		local l = Create("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder, Parent = f })
		return f, l
	end
	self.Left, self.LeftLayout = col(0, 0)
	self.Right, self.RightLayout = col(0.5, 5)
	local function canvas()
		scroll.CanvasSize = UDim2.fromOffset(0, math.max(self.LeftLayout.AbsoluteContentSize.Y, self.RightLayout.AbsoluteContentSize.Y) + 20)
	end
	self.LeftLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(canvas)
	self.RightLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(canvas)
	return self
end

function Page:AddSection(name, side)
	local col
	if side == "Left" then
		col = self.Left
	elseif side == "Right" then
		col = self.Right
	else
		col = self.LeftLayout.AbsoluteContentSize.Y <= self.RightLayout.AbsoluteContentSize.Y and self.Left or self.Right
	end
	return NewGroup(self.Window, col, name, false, self)
end

function Page:Show()
	self.Active = true
	self.Frame.Visible = true
	self.Frame.Position = UDim2.fromOffset(0, 16)
	Tween(self.Frame, { GroupTransparency = 0, Position = UDim2.fromOffset(0, 0) }, 0.4, EZ.Quint)
end

function Page:Hide()
	self.Active = false
	Tween(self.Frame, { GroupTransparency = 1 }, 0.15)
	task.delay(0.16, function()
		if not self.Active then self.Frame.Visible = false end
	end)
end

---------------------------------------------------------------------
-- Tab
---------------------------------------------------------------------
local Tab = {}
Tab.__index = Tab

function Tab:_select()
	self.Selected = true
	Tween(self.Button, { BackgroundTransparency = 0 }, 0.3)
	Tween(self.Label, { TextColor3 = Color3.new(1, 1, 1) }, 0.25)
	IconColor(self.Icon, Color3.new(1, 1, 1))
	self.Frame.Visible = true
	if self.ActivePage then self.ActivePage:Show() end
end

function Tab:_deselect()
	self.Selected = false
	Tween(self.Button, { BackgroundTransparency = 1 }, 0.3)
	Tween(self.Label, { TextColor3 = Theme.SubText }, 0.25)
	IconColor(self.Icon, Theme.SubText)
	self.Frame.Visible = false
	if self.ActivePage then self.ActivePage.Active = false; self.ActivePage.Frame.Visible = false; self.ActivePage.Frame.GroupTransparency = 1 end
end

function Tab:Select()
	local w = self.Window
	if w.ActiveTab == self then return end
	if w.ActiveTab then w.ActiveTab:_deselect() end
	w.ActiveTab = self
	self:_select()
end

function Tab:SelectPage(page)
	if self.ActivePage == page then return end
	if self.ActivePage then
		if self.Selected then self.ActivePage:Hide() end
		local p = self.ActivePage
		if p.SubButton then
			Tween(p.SubLabel, { TextColor3 = Theme.SubText }, 0.2)
			Tween(p.SubLine, { Size = UDim2.new(0, 0, 0, 2) }, 0.25)
		end
	end
	self.ActivePage = page
	if page.SubButton then
		Tween(page.SubLabel, { TextColor3 = Theme.AccentLight }, 0.2)
		Tween(page.SubLine, { Size = UDim2.new(1, 0, 0, 2) }, 0.3, EZ.Back)
	end
	if self.Selected then page:Show() end
end

function Tab:AddSubTab(name)
	assert(not self.DefaultPage, "CrimsonUI: this tab already has sections; use only sub tabs OR sections")
	local page = NewPage(self, name)
	table.insert(self.SubTabs, page)
	if not self.SubBar.Visible then
		self.SubBar.Visible = true
		self.Holder.Position = UDim2.fromOffset(0, 40)
		self.Holder.Size = UDim2.new(1, 0, 1, -40)
	end
	local b = Create("TextButton", {
		Size = UDim2.fromOffset(0, 30), AutomaticSize = Enum.AutomaticSize.X, BackgroundColor3 = Theme.Accent,
		BackgroundTransparency = 1, Text = "", AutoButtonColor = false, Parent = self.SubBar,
	})
	Corner(b, 7)
	Pad(b, 12, 0, 12, 0)
	local l = Label({ Text = name, Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = Theme.SubText,
		AutomaticSize = Enum.AutomaticSize.X, Size = UDim2.new(0, 0, 1, -2), Parent = b })
	local line = Create("Frame", {
		AnchorPoint = Vector2.new(0.5, 1), Position = UDim2.fromScale(0.5, 1), Size = UDim2.new(0, 0, 0, 2),
		BackgroundColor3 = Theme.Accent, BorderSizePixel = 0, Parent = b,
	})
	Corner(line, 1)
	page.SubButton, page.SubLabel, page.SubLine = b, l, line
	Ripple(b)
	b.MouseEnter:Connect(function() Tween(b, { BackgroundTransparency = 0.9 }, 0.2) end)
	b.MouseLeave:Connect(function() Tween(b, { BackgroundTransparency = 1 }, 0.2) end)
	b.MouseButton1Click:Connect(function() self:SelectPage(page) end)
	if #self.SubTabs == 1 then self:SelectPage(page) end
	return page
end

function Tab:AddSection(name, side)
	assert(#self.SubTabs == 0, "CrimsonUI: this tab uses sub tabs; call AddSection on the sub tab")
	if not self.DefaultPage then
		self.DefaultPage = NewPage(self, name)
		self:SelectPage(self.DefaultPage)
	end
	return self.DefaultPage:AddSection(name, side)
end

---------------------------------------------------------------------
-- Window
---------------------------------------------------------------------
local Window = {}
Window.__index = Window

function Window:_connect(signal, fn)
	local c = signal:Connect(fn)
	table.insert(self._conns, c)
	return c
end

function Library:CreateWindow(cfg)
	cfg = cfg or {}
	local self = setmetatable({
		Categories = {}, _rows = {}, _conns = {}, Minimized = false, Destroyed = false,
	}, Window)
	table.insert(Library.Windows, self)

	local gui = GetGui()
	local vp = workspace.CurrentCamera.ViewportSize
	local req = cfg.Size or Vector2.new(700, 440)
	local W, H = math.min(req.X, vp.X * 0.94), math.min(req.Y, vp.Y * 0.86)
	local SB = W < 560 and 130 or 172
	local TOP = 42

	local main = Create("CanvasGroup", {
		Name = "Main", AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(W, H), BackgroundColor3 = Theme.Background, GroupTransparency = 1, Parent = gui,
	})
	Corner(main, 12)
	ShineStroke(main, 1.8)
	Create("UIGradient", {
		Color = ColorSequence.new(Color3.fromRGB(24, 10, 14), Color3.fromRGB(9, 6, 8)), Rotation = 60, Parent = main,
	})
	local scale = Create("UIScale", { Scale = 0.8, Parent = main })
	self.Main, self.Gui = main, gui

	-- top bar
	local top = Create("Frame", { Size = UDim2.new(1, 0, 0, TOP), BackgroundTransparency = 1, Parent = main })
	local title = Label({ Text = cfg.Title or "Crimson Hub", Font = Enum.Font.GothamBlack, TextSize = 16, TextColor3 = Theme.Accent,
		Position = UDim2.fromOffset(14, 5), Size = UDim2.fromOffset(150, 20), Parent = top })
	local tg = Create("UIGradient", {
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Theme.Accent), ColorSequenceKeypoint.new(0.42, Theme.Accent),
			ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)), ColorSequenceKeypoint.new(0.58, Theme.Accent),
			ColorSequenceKeypoint.new(1, Theme.Accent),
		}), Offset = Vector2.new(-1, 0), Parent = title,
	})
	Label({ Text = cfg.Subtitle or "", TextSize = 10, TextColor3 = Theme.SubText,
		Position = UDim2.fromOffset(14, 25), Size = UDim2.fromOffset(160, 12), Parent = top })
	task.spawn(function()
		while not self.Destroyed do
			tg.Offset = Vector2.new(-1, 0)
			Tween(tg, { Offset = Vector2.new(1, 0) }, 1.6, EZ.Sine, ED.InOut)
			task.wait(3.4)
		end
	end)
	Create("Frame", { Position = UDim2.fromOffset(0, TOP), Size = UDim2.new(1, 0, 0, 1), BackgroundColor3 = Theme.Stroke, BorderSizePixel = 0, Parent = main })

	local function topButton(x, kind)
		local b = Create("TextButton", {
			AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, x, 0.5, 0), Size = UDim2.fromOffset(26, 26),
			BackgroundColor3 = Theme.Card2, Text = "", AutoButtonColor = false, Parent = top,
		})
		Corner(b, 7)
		Stroke(b, Theme.Stroke, 1, 0.4)
		if kind == "min" then
			Create("Frame", { AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(10, 2),
				BackgroundColor3 = Theme.Text, BorderSizePixel = 0, Parent = b })
		else
			for _, r in ipairs({ 45, -45 }) do
				Create("Frame", { AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(12, 2),
					Rotation = r, BackgroundColor3 = Theme.Text, BorderSizePixel = 0, Parent = b })
			end
		end
		b.MouseEnter:Connect(function() Tween(b, { BackgroundColor3 = Theme.Accent, Size = UDim2.fromOffset(28, 28) }, 0.2, EZ.Back) end)
		b.MouseLeave:Connect(function() Tween(b, { BackgroundColor3 = Theme.Card2, Size = UDim2.fromOffset(26, 26) }, 0.2) end)
		Ripple(b)
		return b
	end
	local closeBtn = topButton(-8, "close")
	local minBtn = topButton(-40, "min")

	local searchW = W < 560 and 110 or 210
	local sbox = Create("Frame", {
		AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -76, 0.5, 0), Size = UDim2.fromOffset(searchW, 26),
		BackgroundColor3 = Theme.Card2, Parent = top,
	})
	Corner(sbox, 8)
	local sstroke = Stroke(sbox, Theme.Accent, 1, 0.85)
	local search = Create("TextBox", {
		Size = UDim2.new(1, -16, 1, 0), Position = UDim2.fromOffset(8, 0), BackgroundTransparency = 1, Text = "",
		PlaceholderText = "Search controls, tabs...", PlaceholderColor3 = Theme.SubText, TextColor3 = Theme.Text,
		Font = Enum.Font.GothamMedium, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left, ClearTextOnFocus = false, Parent = sbox,
	})
	search.Focused:Connect(function() Tween(sstroke, { Transparency = 0.1 }, 0.2) end)
	search.FocusLost:Connect(function() Tween(sstroke, { Transparency = 0.85 }, 0.2) end)

	-- sidebar + content
	Create("Frame", { Position = UDim2.fromOffset(SB, TOP + 1), Size = UDim2.new(0, 1, 1, -(TOP + 1)), BackgroundColor3 = Theme.Stroke, BorderSizePixel = 0, Parent = main })
	local side = Create("ScrollingFrame", {
		Position = UDim2.fromOffset(0, TOP + 1), Size = UDim2.new(0, SB, 1, -(TOP + 1)), BackgroundTransparency = 1, BorderSizePixel = 0,
		ScrollBarThickness = 2, ScrollBarImageColor3 = Theme.Accent, CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, Parent = main,
	})
	Pad(side, 8, 8, 8, 8)
	Create("UIListLayout", { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder, Parent = side })
	self._side = side
	self._content = Create("Frame", {
		Position = UDim2.fromOffset(SB + 1, TOP + 1), Size = UDim2.new(1, -(SB + 1), 1, -(TOP + 1)),
		BackgroundTransparency = 1, ClipsDescendants = true, Parent = main,
	})

	-- search filter
	search:GetPropertyChangedSignal("Text"):Connect(function()
		local q = search.Text:lower()
		for _, r in ipairs(self._rows) do
			r.row.Visible = q == "" or r.name:find(q, 1, true) ~= nil
		end
		for _, cat in ipairs(self.Categories) do
			for _, t in ipairs(cat.Tabs) do
				t.Button.Visible = q == "" or t.Name:lower():find(q, 1, true) ~= nil
			end
		end
	end)

	MakeDraggable(self, top, main)

	-- minimized pill (top of screen)
	local pill = Create("TextButton", {
		AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.new(0.5, 0, 0, 12), Size = UDim2.fromOffset(190, 38),
		BackgroundColor3 = Theme.Panel, Text = "", AutoButtonColor = false, Visible = false, Parent = gui,
	})
	Corner(pill, 19)
	ShineStroke(pill, 1.6)
	Ripple(pill)
	local pscale = Create("UIScale", { Scale = 0.4, Parent = pill })
	local pdot = Create("Frame", { Position = UDim2.new(0, 16, 0.5, -5), Size = UDim2.fromOffset(10, 10), BackgroundColor3 = Theme.Accent, Parent = pill })
	Corner(pdot, 5)
	Stroke(pdot, Theme.AccentLight, 4, 0.7)
	Label({ Text = cfg.Title or "Crimson Hub", Font = Enum.Font.GothamBold, TextSize = 13,
		Position = UDim2.fromOffset(36, 0), Size = UDim2.new(1, -90, 1, 0), Parent = pill })
	Label({ Text = "OPEN", Font = Enum.Font.GothamBold, TextSize = 10, TextColor3 = Theme.AccentLight,
		TextXAlignment = Enum.TextXAlignment.Right, Position = UDim2.new(1, -52, 0, 0), Size = UDim2.fromOffset(38, 38), Parent = pill })
	task.spawn(function()
		while not self.Destroyed do
			Tween(pdot, { BackgroundTransparency = 0.5 }, 0.8, EZ.Sine, ED.InOut)
			task.wait(0.8)
			Tween(pdot, { BackgroundTransparency = 0 }, 0.8, EZ.Sine, ED.InOut)
			task.wait(0.8)
		end
	end)

	function self:Minimize()
		if self.Minimized then return end
		self.Minimized = true
		Tween(scale, { Scale = 0.6 }, 0.3, EZ.Back, ED.In)
		Tween(main, { GroupTransparency = 1 }, 0.25)
		task.delay(0.3, function() if self.Minimized then main.Visible = false end end)
		pill.Visible = true
		pscale.Scale = 0.4
		Tween(pscale, { Scale = 1 }, 0.5, EZ.Back)
	end
	function self:Restore()
		if not self.Minimized then return end
		self.Minimized = false
		main.Visible = true
		scale.Scale = 0.7
		Tween(scale, { Scale = 1 }, 0.5, EZ.Back)
		Tween(main, { GroupTransparency = 0 }, 0.3)
		Tween(pscale, { Scale = 0 }, 0.25, EZ.Back, ED.In)
		task.delay(0.26, function() if not self.Minimized then pill.Visible = false end end)
	end
	function self:Toggle()
		if self.Minimized then self:Restore() else self:Minimize() end
	end
	function self:Destroy()
		self.Destroyed = true
		Tween(scale, { Scale = 0.7 }, 0.3, EZ.Back, ED.In)
		Tween(main, { GroupTransparency = 1 }, 0.25)
		pill:Destroy()
		for _, c in ipairs(self._conns) do c:Disconnect() end
		task.delay(0.35, function() main:Destroy() end)
	end
	function self:Notify(o) Library:Notify(o) end

	minBtn.MouseButton1Click:Connect(function() self:Minimize() end)
	closeBtn.MouseButton1Click:Connect(function() self:Destroy() end)
	pill.MouseButton1Click:Connect(function() self:Restore() end)
	local toggleKey = cfg.ToggleKey or Enum.KeyCode.RightShift
	self:_connect(UIS.InputBegan, function(i, gp)
		if not gp and i.KeyCode == toggleKey then self:Toggle() end
	end)

	-- open animation
	Tween(scale, { Scale = 1 }, 0.6, EZ.Back)
	Tween(main, { GroupTransparency = 0 }, 0.4)

	return self
end

function Window:AddCategory(name, icon)
	local W = self
	local Category = { Tabs = {}, Window = W }
	local HEADER = name and 32 or 0
	local frame = Create("Frame", {
		Size = UDim2.new(1, 0, 0, HEADER), BackgroundColor3 = Theme.Card, BackgroundTransparency = name and 0 or 1,
		ClipsDescendants = true, LayoutOrder = #W.Categories + 1, Parent = W._side,
	})
	Corner(frame, 8)
	if name then Stroke(frame, Theme.Stroke, 1, 0.5) end
	local body = Create("Frame", { Position = UDim2.fromOffset(0, HEADER), Size = UDim2.new(1, 0, 0, 0), BackgroundTransparency = 1, Parent = frame })
	Pad(body, 4, 0, 4, 0)
	local layout = Create("UIListLayout", { Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder, Parent = body })
	local chev
	if name then
		local header = Create("TextButton", { Size = UDim2.new(1, 0, 0, HEADER), BackgroundTransparency = 1, Text = "", AutoButtonColor = false, Parent = frame })
		local ic = MakeIcon(header, icon, UDim2.fromOffset(10, 9), 14)
		if ic:IsA("Frame") then ic.BackgroundColor3 = Theme.Accent end
		local nl = Label({ Text = name, Font = Enum.Font.GothamBold, TextSize = 13, Position = UDim2.fromOffset(32, 0),
			Size = UDim2.new(1, -56, 1, 0), Parent = header })
		chev = Label({ Text = "›", Font = Enum.Font.GothamBold, TextSize = 18, TextColor3 = Theme.SubText, TextXAlignment = Enum.TextXAlignment.Center,
			Rotation = 90, Position = UDim2.new(1, -24, 0.5, -9), Size = UDim2.fromOffset(18, 18), Parent = header })
		header.MouseEnter:Connect(function() Tween(nl, { TextColor3 = Theme.AccentLight }, 0.2) end)
		header.MouseLeave:Connect(function() Tween(nl, { TextColor3 = Theme.Text }, 0.2) end)
		Category.Collapse = MakeCollapsible(frame, HEADER, body, layout, 6, chev)
		header.MouseButton1Click:Connect(function() Category.Collapse.SetOpen(not Category.Collapse.Open) end)
	else
		Category.Collapse = MakeCollapsible(frame, HEADER, body, layout, 0, nil)
	end
	table.insert(W.Categories, Category)

	function Category:AddTab(tname, ticon)
		local t = setmetatable({ Window = W, Name = tname, SubTabs = {} }, Tab)
		local btn = Create("TextButton", {
			Size = UDim2.new(1, 0, 0, 30), BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 1,
			Text = "", AutoButtonColor = false, LayoutOrder = #Category.Tabs + 1, Parent = body,
		})
		Corner(btn, 7)
		AccentGradient(btn)
		Ripple(btn)
		t.Button = btn
		t.Icon = MakeIcon(btn, ticon, UDim2.fromOffset(10, 8), 14)
		t.Label = Label({ Text = tname, TextSize = 12, TextColor3 = Theme.SubText, Position = UDim2.fromOffset(32, 0), Size = UDim2.new(1, -36, 1, 0), Parent = btn })
		btn.MouseEnter:Connect(function() if not t.Selected then Tween(btn, { BackgroundTransparency = 0.88 }, 0.2) end end)
		btn.MouseLeave:Connect(function() if not t.Selected then Tween(btn, { BackgroundTransparency = 1 }, 0.2) end end)

		t.Frame = Create("Frame", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Visible = false, Parent = W._content })
		t.SubBar = Create("ScrollingFrame", {
			Size = UDim2.new(1, 0, 0, 36), Position = UDim2.fromOffset(0, 4), BackgroundTransparency = 1, BorderSizePixel = 0,
			ScrollBarThickness = 0, CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.X, Visible = false, Parent = t.Frame,
		})
		Pad(t.SubBar, 10, 0, 10, 0)
		Create("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0, 6),
			VerticalAlignment = Enum.VerticalAlignment.Center, Parent = t.SubBar })
		t.Holder = Create("Frame", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Parent = t.Frame })

		btn.MouseButton1Click:Connect(function() t:Select() end)
		table.insert(Category.Tabs, t)
		if not W.ActiveTab then t:Select() end
		return t
	end
	return Category
end

function Window:AddTab(name, icon)
	self._default = self._default or self:AddCategory(nil)
	return self._default:AddTab(name, icon)
end

return Library
