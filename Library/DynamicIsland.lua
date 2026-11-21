--[[
    DynamicIsland  |  Roblox Luau UI library  |  Red theme

    Put this in a ModuleScript (client side), then from a LocalScript:

        local Island = require(path.to.DynamicIsland)
        local isl = Island.new({ Title = "Crimson" })

        isl:Notify({ Title = "Welcome", Text = "Island loaded", Icon = "✓", Duration = 3 })

        isl:AddLabel("Player")
        isl:AddButton("Reset Character", function() print("reset") end)
        local t = isl:AddToggle("God Mode", false, function(v) print("toggle", v) end)
        isl:AddSlider("WalkSpeed", 16, 100, 16, function(v) print("speed", v) end, 1)

        -- Tap the pill to expand / tap the header to collapse
        -- isl:Expand()  isl:Collapse()  isl:Toggle()  isl:SetTitle("x")  isl:Destroy()
]]

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local Island = {}
Island.__index = Island

Island.Theme = {
	Background = Color3.fromRGB(8, 5, 6),
	Surface = Color3.fromRGB(28, 13, 15),
	Accent = Color3.fromRGB(236, 40, 52),
	AccentDark = Color3.fromRGB(120, 16, 24),
	Text = Color3.fromRGB(255, 240, 240),
	SubText = Color3.fromRGB(190, 150, 153),
	Font = Enum.Font.GothamMedium,
	FontBold = Enum.Font.GothamBold,
}

local IDLE = Vector2.new(126, 34)
local NOTIFY = Vector2.new(330, 66)

--------------------------------------------------------------------- helpers

local function make(class, props)
	local o = Instance.new(class)
	local parent = props.Parent
	for k, v in pairs(props) do
		if k ~= "Parent" then
			o[k] = v
		end
	end
	o.Parent = parent
	return o
end

local function tween(o, t, props, style, dir)
	local tw = TweenService:Create(
		o,
		TweenInfo.new(t, style or Enum.EasingStyle.Quint, dir or Enum.EasingDirection.Out),
		props
	)
	tw:Play()
	return tw
end

local function round(parent, r)
	return make("UICorner", { CornerRadius = UDim.new(0, r), Parent = parent })
end

local function stroke(parent, color, transparency, thickness)
	return make("UIStroke", {
		Color = color,
		Transparency = transparency or 0,
		Thickness = thickness or 1,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		Parent = parent,
	})
end

local function text(parent, T, props)
	local p = {
		BackgroundTransparency = 1,
		Font = T.Font,
		TextColor3 = T.Text,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = parent,
	}
	for k, v in pairs(props) do
		p[k] = v
	end
	return make("TextLabel", p)
end

local function view(parent)
	return make("CanvasGroup", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		GroupTransparency = 1,
		Visible = false,
		Parent = parent,
	})
end

--------------------------------------------------------------------- constructor

function Island.new(opts)
	opts = opts or {}
	local self = setmetatable({}, Island)

	local T = table.clone(Island.Theme)
	for k, v in pairs(opts.Theme or {}) do
		T[k] = v
	end
	self.Theme = T
	self.Title = opts.Title or "Island"
	self.Width = opts.Width or 380
	self.State = "Idle"
	self.Queue = {}
	self._token = 0
	self._order = 0
	self._busy = false
	self._conns = {}

	-- gui
	local gui = make("ScreenGui", {
		Name = "DynamicIsland",
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
		DisplayOrder = 999,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	})
	local ok, hui = pcall(function()
		return gethui()
	end)
	gui.Parent = (ok and hui) or Players.LocalPlayer:WaitForChild("PlayerGui")
	self.Gui = gui

	-- root pill
	local root = make("Frame", {
		Name = "Island",
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.new(0.5, 0, 0, 10),
		Size = UDim2.fromOffset(IDLE.X, IDLE.Y),
		BackgroundColor3 = T.Background,
		ClipsDescendants = true,
		Parent = gui,
	})
	self.Root = root
	self.Corner = round(root, IDLE.Y / 2)
	self.Stroke = stroke(root, T.Accent, 0.55, 1.2)

	-- idle view
	local idle = view(root)
	local row = make("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		Parent = idle,
	})
	make("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0, 8),
		Parent = row,
	})
	local dot = make("Frame", {
		Size = UDim2.fromOffset(8, 8),
		BackgroundColor3 = T.Accent,
		Parent = row,
	})
	round(dot, 4)
	tween(dot, 0.9, { BackgroundTransparency = 0.7 }, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
	TweenService:Create(
		dot,
		TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
		{ BackgroundTransparency = 0.7 }
	):Play()
	self.IdleLabel = text(row, T, {
		Size = UDim2.fromOffset(0, 16),
		AutomaticSize = Enum.AutomaticSize.X,
		Text = self.Title,
		TextSize = 13,
		Font = T.FontBold,
	})

	-- notify view
	local notify = view(root)
	local icon = make("Frame", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 14, 0.5, -2),
		Size = UDim2.fromOffset(36, 36),
		BackgroundColor3 = T.Accent,
		Parent = notify,
	})
	round(icon, 18)
	self.NotifyIcon = text(icon, T, {
		Size = UDim2.fromScale(1, 1),
		Text = "!",
		TextSize = 18,
		Font = T.FontBold,
		TextXAlignment = Enum.TextXAlignment.Center,
	})
	self.NotifyTitle = text(notify, T, {
		Position = UDim2.fromOffset(60, 12),
		Size = UDim2.new(1, -74, 0, 18),
		Font = T.FontBold,
		TextTruncate = Enum.TextTruncate.AtEnd,
	})
	self.NotifyText = text(notify, T, {
		Position = UDim2.fromOffset(60, 30),
		Size = UDim2.new(1, -74, 0, 16),
		TextSize = 12,
		TextColor3 = T.SubText,
		TextTruncate = Enum.TextTruncate.AtEnd,
	})
	self.NotifyBar = make("Frame", {
		Position = UDim2.new(0, 18, 1, -8),
		Size = UDim2.new(1, -36, 0, 3),
		BackgroundColor3 = T.Accent,
		BorderSizePixel = 0,
		Parent = notify,
	})
	round(self.NotifyBar, 2)

	-- expanded view
	local exp = view(root)
	text(exp, T, {
		Position = UDim2.fromOffset(18, 12),
		Size = UDim2.new(1, -70, 0, 24),
		Text = self.Title,
		TextSize = 16,
		Font = T.FontBold,
	})
	self.ExpTitle = exp:FindFirstChildOfClass("TextLabel")
	local close = make("TextButton", {
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, -14, 0, 12),
		Size = UDim2.fromOffset(24, 24),
		BackgroundColor3 = T.AccentDark,
		Text = "×",
		TextColor3 = T.Text,
		TextSize = 18,
		Font = T.FontBold,
		AutoButtonColor = false,
		Parent = exp,
	})
	round(close, 12)
	close.Activated:Connect(function()
		self:Collapse()
	end)
	make("Frame", {
		Position = UDim2.fromOffset(14, 44),
		Size = UDim2.new(1, -28, 0, 1),
		BackgroundColor3 = T.Accent,
		BackgroundTransparency = 0.7,
		BorderSizePixel = 0,
		Parent = exp,
	})
	self.Content = make("ScrollingFrame", {
		Position = UDim2.fromOffset(12, 52),
		Size = UDim2.new(1, -24, 1, -62),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 2,
		ScrollBarImageColor3 = T.Accent,
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		CanvasSize = UDim2.new(),
		Parent = exp,
	})
	self.List = make("UIListLayout", {
		Padding = UDim.new(0, 6),
		SortOrder = Enum.SortOrder.LayoutOrder,
		Parent = self.Content,
	})
	self.List:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		if self.State == "Expanded" then
			self:_morph(self.Width, self:_expandedHeight(), true)
		end
	end)

	self.Views = { Idle = idle, Notify = notify, Expanded = exp }

	-- tap target (idle / notify)
	self.Hit = make("TextButton", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Text = "",
		ZIndex = 50,
		Parent = root,
	})
	self.Hit.Activated:Connect(function()
		self:Expand()
	end)

	self:_setState("Idle", IDLE.X, IDLE.Y)
	return self
end

--------------------------------------------------------------------- internals

function Island:_morph(w, h, springy)
	local style = springy and Enum.EasingStyle.Back or Enum.EasingStyle.Quint
	tween(self.Root, springy and 0.55 or 0.4, { Size = UDim2.fromOffset(w, h) }, style)
	tween(self.Corner, 0.4, { CornerRadius = UDim.new(0, math.min(h / 2, 26)) })
end

function Island:_showView(name)
	for n, v in pairs(self.Views) do
		if n == name then
			v.Visible = true
			tween(v, 0.3, { GroupTransparency = 0 })
		else
			local tw = tween(v, 0.15, { GroupTransparency = 1 })
			tw.Completed:Connect(function()
				if self.State ~= n then
					v.Visible = false
				end
			end)
		end
	end
end

function Island:_setState(state, w, h)
	self.State = state
	self.Hit.Visible = state ~= "Expanded"
	self:_morph(w, h, state ~= "Idle")
	self:_showView(state)
	tween(self.Stroke, 0.3, { Transparency = state == "Idle" and 0.55 or 0.3 })
end

function Island:_expandedHeight()
	return math.clamp(52 + self.List.AbsoluteContentSize.Y + 16, 96, 400)
end

function Island:_nextOrder()
	self._order += 1
	return self._order
end

function Island:_show(d)
	self._token += 1
	local tok = self._token
	local dur = d.Duration or 3

	self.NotifyTitle.Text = d.Title or ""
	self.NotifyText.Text = d.Text or ""
	self.NotifyIcon.Text = d.Icon or "!"
	self.NotifyBar.Size = UDim2.new(1, -36, 0, 3)

	self:_setState("Notify", NOTIFY.X, NOTIFY.Y)
	tween(self.NotifyBar, dur, { Size = UDim2.new(0, 0, 0, 3) }, Enum.EasingStyle.Linear)

	local t0 = os.clock()
	while os.clock() - t0 < dur and self._token == tok do
		task.wait(0.05)
	end
	if self._token == tok then
		self:_setState("Idle", IDLE.X, IDLE.Y)
		task.wait(0.35)
	end
end

function Island:_runQueue()
	if self._busy then
		return
	end
	self._busy = true
	task.spawn(function()
		while #self.Queue > 0 do
			if self.State == "Expanded" then
				task.wait(0.25)
			else
				self:_show(table.remove(self.Queue, 1))
			end
		end
		self._busy = false
	end)
end

--------------------------------------------------------------------- public API

function Island:Notify(data)
	table.insert(self.Queue, data or {})
	self:_runQueue()
end

function Island:Expand()
	if self.State == "Expanded" then
		return
	end
	self._token += 1 -- cancels any running notification
	self:_setState("Expanded", self.Width, self:_expandedHeight())
end

function Island:Collapse()
	if self.State == "Idle" then
		return
	end
	self._token += 1
	self:_setState("Idle", IDLE.X, IDLE.Y)
end

function Island:Toggle()
	if self.State == "Expanded" then
		self:Collapse()
	else
		self:Expand()
	end
end

function Island:SetTitle(t)
	self.Title = t
	self.IdleLabel.Text = t
	self.ExpTitle.Text = t
end

function Island:AddLabel(t)
	local T = self.Theme
	return text(self.Content, T, {
		Size = UDim2.new(1, 0, 0, 20),
		Text = string.upper(t),
		TextSize = 11,
		Font = T.FontBold,
		TextColor3 = T.Accent,
		LayoutOrder = self:_nextOrder(),
	})
end

function Island:AddButton(label, callback)
	local T = self.Theme
	local b = make("TextButton", {
		Size = UDim2.new(1, 0, 0, 36),
		BackgroundColor3 = T.Surface,
		Text = label,
		TextColor3 = T.Text,
		TextSize = 14,
		Font = T.Font,
		AutoButtonColor = false,
		LayoutOrder = self:_nextOrder(),
		Parent = self.Content,
	})
	round(b, 10)
	stroke(b, T.AccentDark, 0.2)
	b.MouseEnter:Connect(function()
		tween(b, 0.15, { BackgroundColor3 = T.AccentDark })
	end)
	b.MouseLeave:Connect(function()
		tween(b, 0.15, { BackgroundColor3 = T.Surface })
	end)
	b.MouseButton1Down:Connect(function()
		tween(b, 0.08, { BackgroundColor3 = T.Accent })
	end)
	b.MouseButton1Up:Connect(function()
		tween(b, 0.15, { BackgroundColor3 = T.AccentDark })
	end)
	b.Activated:Connect(function()
		if callback then
			task.spawn(callback)
		end
	end)
	return b
end

function Island:AddToggle(label, default, callback)
	local T = self.Theme
	local state = default and true or false
	local f = make("TextButton", {
		Size = UDim2.new(1, 0, 0, 36),
		BackgroundColor3 = T.Surface,
		Text = "",
		AutoButtonColor = false,
		LayoutOrder = self:_nextOrder(),
		Parent = self.Content,
	})
	round(f, 10)
	text(f, T, {
		Position = UDim2.fromOffset(12, 0),
		Size = UDim2.new(1, -70, 1, 0),
		Text = label,
	})
	local track = make("Frame", {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -12, 0.5, 0),
		Size = UDim2.fromOffset(38, 20),
		BackgroundColor3 = T.AccentDark,
		Parent = f,
	})
	round(track, 10)
	local knob = make("Frame", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 2, 0.5, 0),
		Size = UDim2.fromOffset(16, 16),
		BackgroundColor3 = T.Text,
		Parent = track,
	})
	round(knob, 8)

	local obj = {}
	local function render(animate)
		local dur = animate and 0.2 or 0
		tween(track, dur, { BackgroundColor3 = state and T.Accent or T.AccentDark })
		tween(knob, dur, { Position = UDim2.new(0, state and 20 or 2, 0.5, 0) }, Enum.EasingStyle.Back)
	end
	function obj:Set(v)
		state = v and true or false
		render(true)
		if callback then
			task.spawn(callback, state)
		end
	end
	function obj:Get()
		return state
	end
	f.Activated:Connect(function()
		obj:Set(not state)
	end)
	render(false)
	return obj
end

function Island:AddSlider(label, min, max, default, callback, step)
	local T = self.Theme
	step = step or 1
	local value = math.clamp(default or min, min, max)

	local f = make("Frame", {
		Size = UDim2.new(1, 0, 0, 50),
		BackgroundColor3 = T.Surface,
		LayoutOrder = self:_nextOrder(),
		Parent = self.Content,
	})
	round(f, 10)
	text(f, T, {
		Position = UDim2.fromOffset(12, 6),
		Size = UDim2.new(1, -80, 0, 18),
		Text = label,
	})
	local valueLabel = text(f, T, {
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, -12, 0, 6),
		Size = UDim2.fromOffset(60, 18),
		TextXAlignment = Enum.TextXAlignment.Right,
		TextColor3 = T.Accent,
		Font = T.FontBold,
	})
	local track = make("Frame", {
		Position = UDim2.new(0, 12, 1, -14),
		Size = UDim2.new(1, -24, 0, 6),
		BackgroundColor3 = T.AccentDark,
		Parent = f,
	})
	round(track, 3)
	local fill = make("Frame", {
		Size = UDim2.fromScale(0, 1),
		BackgroundColor3 = T.Accent,
		Parent = track,
	})
	round(fill, 3)
	local hit = make("TextButton", {
		Position = UDim2.new(0, 0, 1, -26),
		Size = UDim2.new(1, 0, 0, 26),
		BackgroundTransparency = 1,
		Text = "",
		Parent = f,
	})

	local obj = {}
	local function set(v, fire)
		v = math.clamp(math.floor(v / step + 0.5) * step, min, max)
		value = v
		valueLabel.Text = tostring(v)
		tween(fill, 0.08, { Size = UDim2.fromScale((v - min) / (max - min), 1) })
		if fire and callback then
			task.spawn(callback, v)
		end
	end
	local function fromX(x)
		local r = math.clamp((x - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
		set(min + (max - min) * r, true)
	end
	local function isPointer(i)
		return i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch
	end

	local dragging = false
	hit.InputBegan:Connect(function(i)
		if isPointer(i) then
			dragging = true
			fromX(i.Position.X)
		end
	end)
	table.insert(
		self._conns,
		UserInputService.InputChanged:Connect(function(i)
			if
				dragging
				and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch)
			then
				fromX(i.Position.X)
			end
		end)
	)
	table.insert(
		self._conns,
		UserInputService.InputEnded:Connect(function(i)
			if isPointer(i) then
				dragging = false
			end
		end)
	)

	function obj:Set(v)
		set(v, true)
	end
	function obj:Get()
		return value
	end
	set(value, false)
	return obj
end

function Island:Destroy()
	self._token += 1
	for _, c in ipairs(self._conns) do
		c:Disconnect()
	end
	self.Gui:Destroy()
end

return Island
