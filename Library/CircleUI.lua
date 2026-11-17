--[[
    Circle Launcher UI (Roblox Luau)
    - Floating draggable circle
    - Click: circle spins, gets "thrown" in an arc to the center and morphs into the panel
    - Transparent panel with Toggles, Buttons and Sliders
    - Close (X): panel shrinks and the circle flies back to where it was
]]

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

-- ====== THEME ======
local ACCENT = Color3.fromRGB(110, 90, 255)
local DARK = Color3.fromRGB(20, 20, 28)
local TEXT = Color3.fromRGB(235, 235, 245)
local PANEL_SIZE = Vector2.new(300, 340)
local CIRCLE_SIZE = 56

-- ====== SETUP ======
local gui = Instance.new("ScreenGui")
gui.Name = "CircleUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local ok = pcall(function()
	gui.Parent = (gethui and gethui()) or game:GetService("CoreGui")
end)
if not ok or not gui.Parent then
	gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
end

local function tween(obj, time, props, style, dir)
	local t = TweenService:Create(
		obj,
		TweenInfo.new(time, style or Enum.EasingStyle.Quad, dir or Enum.EasingDirection.Out),
		props
	)
	t:Play()
	return t
end

local function corner(obj, radius)
	local c = Instance.new("UICorner")
	c.CornerRadius = radius or UDim.new(0, 10)
	c.Parent = obj
	return c
end

local function stroke(obj, color, transparency, thickness)
	local s = Instance.new("UIStroke")
	s.Color = color or ACCENT
	s.Transparency = transparency or 0.3
	s.Thickness = thickness or 1.5
	s.Parent = obj
	return s
end

local function center()
	local s = gui.AbsoluteSize
	return Vector2.new(s.X / 2, s.Y / 2)
end

-- ====== CIRCLE ======
local circle = Instance.new("TextButton")
circle.Name = "Circle"
circle.AnchorPoint = Vector2.new(0.5, 0.5)
circle.Size = UDim2.fromOffset(CIRCLE_SIZE, CIRCLE_SIZE)
circle.Position = UDim2.fromOffset(60, 200)
circle.BackgroundColor3 = DARK
circle.BackgroundTransparency = 0.25
circle.Text = "☰"
circle.TextColor3 = TEXT
circle.TextSize = 24
circle.Font = Enum.Font.GothamBold
circle.AutoButtonColor = false
circle.Parent = gui
corner(circle, UDim.new(1, 0))
stroke(circle, ACCENT, 0.1, 2)

-- ====== PANEL ======
local panel = Instance.new("Frame")
panel.Name = "Panel"
panel.AnchorPoint = Vector2.new(0.5, 0.5)
panel.Size = UDim2.fromOffset(0, 0)
panel.Position = UDim2.fromScale(0.5, 0.5)
panel.BackgroundColor3 = DARK
panel.BackgroundTransparency = 0.35
panel.Visible = false
panel.ClipsDescendants = true
panel.Parent = gui
corner(panel, UDim.new(0, 16))
stroke(panel, ACCENT, 0.3, 1.5)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -50, 0, 40)
title.Position = UDim2.fromOffset(14, 0)
title.BackgroundTransparency = 1
title.Text = "My Scripts"
title.TextColor3 = TEXT
title.TextSize = 18
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = panel

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.fromOffset(28, 28)
closeBtn.Position = UDim2.new(1, -36, 0, 6)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 90)
closeBtn.BackgroundTransparency = 0.3
closeBtn.Text = "✕"
closeBtn.TextColor3 = TEXT
closeBtn.TextSize = 14
closeBtn.Font = Enum.Font.GothamBold
closeBtn.AutoButtonColor = false
closeBtn.Parent = panel
corner(closeBtn, UDim.new(1, 0))

local content = Instance.new("ScrollingFrame")
content.Size = UDim2.new(1, -16, 1, -50)
content.Position = UDim2.fromOffset(8, 44)
content.BackgroundTransparency = 1
content.BorderSizePixel = 0
content.ScrollBarThickness = 3
content.ScrollBarImageColor3 = ACCENT
content.CanvasSize = UDim2.new()
content.AutomaticCanvasSize = Enum.AutomaticSize.Y
content.Parent = panel

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 6)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = content

local pad = Instance.new("UIPadding")
pad.PaddingLeft = UDim.new(0, 4)
pad.PaddingRight = UDim.new(0, 8)
pad.PaddingTop = UDim.new(0, 2)
pad.PaddingBottom = UDim.new(0, 8)
pad.Parent = content

-- ====== THROW ANIMATION ======
local function throw(obj, from, to, duration, arcHeight, callback)
	local t0 = os.clock()
	local conn
	conn = RunService.RenderStepped:Connect(function()
		local a = math.clamp((os.clock() - t0) / duration, 0, 1)
		local e = TweenService:GetValue(a, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
		local p = from:Lerp(to, e) - Vector2.new(0, math.sin(math.pi * a) * arcHeight)
		obj.Position = UDim2.fromOffset(p.X, p.Y)
		if a >= 1 then
			conn:Disconnect()
			if callback then callback() end
		end
	end)
end

local opened, busy = false, false
local home = Vector2.new(60, 200)
local panelFull = UDim2.fromOffset(PANEL_SIZE.X, PANEL_SIZE.Y)

local function openUI()
	if opened or busy then return end
	busy = true
	home = Vector2.new(circle.Position.X.Offset, circle.Position.Y.Offset)

	task.spawn(function()
		-- wind-up: spin + squash
		tween(circle, 0.3, { Rotation = 360, Size = UDim2.fromOffset(CIRCLE_SIZE - 14, CIRCLE_SIZE - 14) },
			Enum.EasingStyle.Back, Enum.EasingDirection.Out)
		task.wait(0.3)
		circle.Rotation = 0

		-- throw to center, growing slightly
		tween(circle, 0.45, { Size = UDim2.fromOffset(CIRCLE_SIZE + 10, CIRCLE_SIZE + 10) })
		throw(circle, home, center(), 0.45, 140, function()
			-- morph into panel
			tween(circle, 0.15, { BackgroundTransparency = 1, TextTransparency = 1 })
			circle.Visible = false
			panel.Position = UDim2.fromOffset(center().X, center().Y)
			panel.Size = UDim2.fromOffset(0, 0)
			panel.Visible = true
			tween(panel, 0.4, { Size = panelFull }, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
			task.delay(0.4, function()
				opened, busy = true, false
			end)
		end)
	end)
end

local function closeUI()
	if not opened or busy then return end
	busy = true
	opened = false

	task.spawn(function()
		local t = tween(panel, 0.3, { Size = UDim2.fromOffset(0, 0) }, Enum.EasingStyle.Back, Enum.EasingDirection.In)
		t.Completed:Wait()
		panel.Visible = false

		circle.Position = UDim2.fromOffset(center().X, center().Y)
		circle.Size = UDim2.fromOffset(CIRCLE_SIZE, CIRCLE_SIZE)
		circle.BackgroundTransparency = 0.25
		circle.TextTransparency = 0
		circle.Visible = true

		throw(circle, center(), home, 0.5, 140, function()
			-- landing bounce + spin
			circle.Size = UDim2.fromOffset(CIRCLE_SIZE + 14, CIRCLE_SIZE + 14)
			tween(circle, 0.35, { Size = UDim2.fromOffset(CIRCLE_SIZE, CIRCLE_SIZE), Rotation = 360 },
				Enum.EasingStyle.Back, Enum.EasingDirection.Out)
			task.delay(0.35, function()
				circle.Rotation = 0
				busy = false
			end)
		end)
	end)
end

closeBtn.MouseButton1Click:Connect(closeUI)

-- ====== DRAGGING (circle + panel) ======
local function makeDraggable(handle, target, onClick)
	local dragging, moved, startInput, startPos = false, false, nil, nil

	handle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then
			dragging, moved = true, false
			startInput = input.Position
			startPos = Vector2.new(target.Position.X.Offset, target.Position.Y.Offset)
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if not dragging then return end
		if input.UserInputType == Enum.UserInputType.MouseMovement
			or input.UserInputType == Enum.UserInputType.Touch then
			local delta = input.Position - startInput
			if delta.Magnitude > 6 then moved = true end
			if moved and not busy then
				target.Position = UDim2.fromOffset(startPos.X + delta.X, startPos.Y + delta.Y)
			end
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if not dragging then return end
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
			if not moved and onClick then onClick() end
		end
	end)
end

makeDraggable(circle, circle, openUI)
makeDraggable(title, panel)

-- ====== COMPONENTS ======
local UI = {}
local order = 0

local function row(height)
	order += 1
	local f = Instance.new("Frame")
	f.Size = UDim2.new(1, 0, 0, height or 38)
	f.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
	f.BackgroundTransparency = 0.5
	f.LayoutOrder = order
	f.Parent = content
	corner(f, UDim.new(0, 10))
	return f
end

local function label(parent, text, size)
	local l = Instance.new("TextLabel")
	l.BackgroundTransparency = 1
	l.Size = size or UDim2.new(1, -70, 1, 0)
	l.Position = UDim2.fromOffset(12, 0)
	l.Text = text
	l.TextColor3 = TEXT
	l.TextSize = 14
	l.Font = Enum.Font.GothamMedium
	l.TextXAlignment = Enum.TextXAlignment.Left
	l.Parent = parent
	return l
end

function UI:Toggle(text, default, callback)
	local f = row(38)
	label(f, text)

	local switch = Instance.new("Frame")
	switch.Size = UDim2.fromOffset(42, 22)
	switch.AnchorPoint = Vector2.new(1, 0.5)
	switch.Position = UDim2.new(1, -10, 0.5, 0)
	switch.BackgroundColor3 = Color3.fromRGB(70, 70, 90)
	switch.Parent = f
	corner(switch, UDim.new(1, 0))

	local knob = Instance.new("Frame")
	knob.Size = UDim2.fromOffset(16, 16)
	knob.AnchorPoint = Vector2.new(0, 0.5)
	knob.Position = UDim2.new(0, 3, 0.5, 0)
	knob.BackgroundColor3 = Color3.new(1, 1, 1)
	knob.Parent = switch
	corner(knob, UDim.new(1, 0))

	local btn = Instance.new("TextButton")
	btn.Size = UDim2.fromScale(1, 1)
	btn.BackgroundTransparency = 1
	btn.Text = ""
	btn.Parent = f

	local state = default and true or false
	local function render(animate)
		local pos = state and UDim2.new(1, -19, 0.5, 0) or UDim2.new(0, 3, 0.5, 0)
		local col = state and ACCENT or Color3.fromRGB(70, 70, 90)
		if animate then
			tween(knob, 0.2, { Position = pos }, Enum.EasingStyle.Back)
			tween(switch, 0.2, { BackgroundColor3 = col })
		else
			knob.Position, switch.BackgroundColor3 = pos, col
		end
	end
	render(false)

	btn.MouseButton1Click:Connect(function()
		state = not state
		render(true)
		if callback then task.spawn(callback, state) end
	end)

	if default and callback then task.spawn(callback, state) end
end

function UI:Button(text, callback)
	local f = row(38)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.fromScale(1, 1)
	btn.BackgroundColor3 = ACCENT
	btn.BackgroundTransparency = 0.45
	btn.Text = text
	btn.TextColor3 = TEXT
	btn.TextSize = 14
	btn.Font = Enum.Font.GothamBold
	btn.AutoButtonColor = false
	btn.Parent = f
	corner(btn, UDim.new(0, 10))

	btn.MouseButton1Click:Connect(function()
		btn.BackgroundTransparency = 0.1
		tween(btn, 0.25, { BackgroundTransparency = 0.45 })
		if callback then task.spawn(callback) end
	end)
end

function UI:Slider(text, min, max, default, callback)
	local f = row(52)
	local l = label(f, text .. ": " .. tostring(default), UDim2.new(1, -24, 0, 24))
	l.Position = UDim2.fromOffset(12, 2)

	local bar = Instance.new("Frame")
	bar.Size = UDim2.new(1, -24, 0, 6)
	bar.Position = UDim2.new(0, 12, 0, 34)
	bar.BackgroundColor3 = Color3.fromRGB(70, 70, 90)
	bar.Parent = f
	corner(bar, UDim.new(1, 0))

	local fill = Instance.new("Frame")
	fill.BackgroundColor3 = ACCENT
	fill.Size = UDim2.fromScale((default - min) / (max - min), 1)
	fill.Parent = bar
	corner(fill, UDim.new(1, 0))

	local dragging = false
	local function update(x)
		local a = math.clamp((x - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
		local value = math.floor(min + (max - min) * a + 0.5)
		fill.Size = UDim2.fromScale(a, 1)
		l.Text = text .. ": " .. value
		if callback then task.spawn(callback, value) end
	end

	f.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			update(input.Position.X)
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
			or input.UserInputType == Enum.UserInputType.Touch) then
			update(input.Position.X)
		end
	end)
	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)
end

-- ====================================================
-- ADD YOUR SCRIPTS HERE
-- ====================================================

UI:Toggle("Example Toggle", false, function(on)
	print("Example Toggle:", on)
	-- put your script on/off logic here
end)

UI:Toggle("Another Toggle", true, function(on)
	print("Another Toggle:", on)
end)

UI:Slider("Walk Speed", 16, 100, 16, function(value)
	local char = Players.LocalPlayer.Character
	local hum = char and char:FindFirstChildOfClass("Humanoid")
	if hum then hum.WalkSpeed = value end
end)

UI:Button("Example Button", function()
	print("Button clicked")
end)

return UI
