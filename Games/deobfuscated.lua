while r0 do
end
if game.Players.LocalPlayer and game.Players.LocalPlayer.Character then
  local from_r_g_b = Color3.fromRGB(255, 0, 0)
  _G.Color = from_r_g_b
  _G.imageLogo = "rbxassetid://14103696428"
  _G.Title = game.GetService(game, "MarketplaceService").GetProductInfo(game.GetService(game, "MarketplaceService"), game.PlaceId).Name
  local service = game.GetService(game, "CoreGui")
  local service_1 = game.GetService(game, "Players")
  local service_2 = game.GetService(game, "UserInputService")
  local service_3 = game.GetService(game, "TweenService")
  local service_4 = game.GetService(game, "RunService")
  local mouse = service_1.LocalPlayer.GetMouse(service_1.LocalPlayer)
  local service_5 = game.GetService(game, "VirtualInputManager")
  local service_6 = game.GetService(game, "VirtualUser")
  local service_7 = game.GetService(game, "HttpService")
  local service_8 = game.GetService(game, "Lighting")
  local service_9 = game.GetService(game, "ReplicatedStorage")
  local service_10 = game.GetService(game, "TeleportService")
  local service_11 = game.GetService(game, "StarterGui")
  local l_18 = function()
  if not service_1.LocalPlayer.Character then
    local wait = service_1.LocalPlayer.CharacterAdded.Wait(service_1.LocalPlayer.CharacterAdded)
  end
  return wait
end
  local wait_for_child = service.WaitForChild(service, "RobloxGui")
  local l_25, children, wait_for_child = ipairs()
else
  while {} do
  end
end
for l_28, l_29 in l_25 do
  while {} do
  end
  local a = l_29.IsA(l_29, "ScreenGui")
  if a then
    local l_30, children_1, l_32 = ipairs()
    for l_33, l_34 in l_30 do
      for l_33, l_34 in l_30 do
        while {} do
        end
        if l_34.Name == "Main" and l_29 then
          l_29.Destroy(l_29)
        end
        for l_28, l_29 in l_25 do
        end
      end
    end
  end
  for l_28, l_29 in l_25 do
  end
end
Instance.new("ScreenGui").Name = tostring()
Instance.new("ScreenGui").Parent = service.WaitForChild(service, "RobloxGui").WaitForChild(service.WaitForChild(service, "RobloxGui"), "Modules")
Instance.new("ScreenGui").ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Instance.new("ImageLabel")
Instance.new("ScreenGui").Name = "ThunderScreen"
Instance.new("ScreenGui").Parent = Instance.new("ScreenGui")
Instance.new("ScreenGui").ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Instance.new("TextButton").Name = "ThunderToggleUI"
Instance.new("TextButton").Parent = Instance.new("ScreenGui")
Instance.new("TextButton").BackgroundColor3 = Color3.fromRGB(31, 31, 31)
Instance.new("TextButton").BorderSizePixel = 0
Instance.new("TextButton").Position = UDim2.new(0, 0, 0.0952890813, 0)
Instance.new("TextButton").Size = UDim2.new(0, 50, 0, 50)
Instance.new("TextButton").Font = Enum.Font.SourceSans
Instance.new("TextButton").Text = ""
Instance.new("TextButton").TextColor3 = Color3.fromRGB(0, 0, 0)
Instance.new("TextButton").TextSize = 14
Instance.new("TextButton").Draggable = true
Instance.new("TextButton").MouseButton1Click.Connect(Instance.new("TextButton").MouseButton1Click, function()
  service_5.SendKeyEvent(service_5, true, 305, false, game)
  service_5.SendKeyEvent(service_5, false, 305, false, game)
  task.wait(3)
end)
Instance.new("UICorner").Name = "ThunderCornerUI"
Instance.new("UICorner").Parent = Instance.new("TextButton")
Instance.new("ImageLabel").Name = "MODILEMAGE"
Instance.new("ImageLabel").Parent = Instance.new("TextButton")
Instance.new("ImageLabel").BackgroundColor3 = Color3.fromRGB(192, 192, 192)
Instance.new("ImageLabel").BackgroundTransparency = 1
Instance.new("ImageLabel").BorderSizePixel = 0
Instance.new("ImageLabel").Position = UDim2.new(0, 0, 0, 0)
Instance.new("ImageLabel").Size = UDim2.new(0, 50, 0, 50)
Instance.new("ImageLabel").Image = "http://www.roblox.com/asset/?id=14288624550"
Instance.new("ScreenGui").Name = tostring()
Instance.new("ScreenGui").Parent = service.WaitForChild(service, "RobloxGui").WaitForChild(service.WaitForChild(service, "RobloxGui"), "Modules")
Instance.new("ScreenGui").ZIndexBehavior = Enum.ZIndexBehavior.Sibling
if syn then
  syn.protect_gui(Instance.new("ScreenGui"))
  local l_0 = {}
  function l_0.Destroy(a0)
    l_0.Destroy(l_0)
  end
  local new = Instance.new("ScreenGui")
  local l_19 = function()
  local l_0 = l_18()
  return l_0.FindFirstChild(l_0, "Humanoid")
end
  local l_25 = function(a0, a1, a2)
  coroutine.resume()
end
  local l_1 = {}
  local l_2 = {}
  local l_24 = {Bind = Enum.KeyCode.RightControl}
  local l_26 = function(a0, a1)
  dragToggle = r2
  dragSpeed = 0.25
  dragInput = nil
  dragStart = nil
  dragPos = nil
  function updateInput(a0)
    Delta = a0.Position - dragStart
    local new = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
    Position = new
    local new = TweenInfo.new(dragSpeed)
    service_3.Create(service_3, a1, new, {Position = Position}).Play(service_3.Create(service_3, a1, new, {Position = Position}))
  end
  a0.InputBegan.Connect(a0.InputBegan, function(a0)
  if a0.UserInputType == Enum.UserInputType.MouseButton1 or a0.UserInputType == Enum.UserInputType.Touch then
    dragToggle = true
    dragStart = a0.Position
    startPos = a1.Position
    a0.Changed.Connect(a0.Changed, function()
  if a0.UserInputState == Enum.UserInputState.End then
    dragToggle = false
  end
end)
  end
end)
  a0.InputChanged.Connect(a0.InputChanged, function(a0)
  if a0.UserInputType == Enum.UserInputType.MouseMovement or a0.UserInputType == Enum.UserInputType.Touch then
    dragInput = a0
  end
end)
  service_2.InputChanged.Connect(service_2.InputChanged, function(a0)
  if a0 == dragInput and dragToggle then
    updateInput(a0)
  end
end)
end
  function l_0.Evil(a0)
    local new = Instance.new("Frame")
    local new_1 = Instance.new("UICorner")
    local new_2 = Instance.new("Frame")
    local new_3 = Instance.new("Frame")
    local new_4 = Instance.new("UICorner")
    local new_5 = Instance.new("ScrollingFrame")
    local new_6 = Instance.new("UIListLayout")
    local new_7 = Instance.new("UIPadding")
    local new_8 = Instance.new("ImageLabel")
    local new_9 = Instance.new("TextLabel")
    local l_12 = "TextLabel"
    local new_10 = Instance.new(l_12)
    new.Name = "Main"
    l_12 = new
    new.Parent = l_12
    l_12 = Color3
    l_12 = l_12.fromRGB
    l_12 = l_12(33, 33, 33)
    new.BackgroundColor3 = l_12
    l_12 = UDim2
    l_12 = l_12.new
    l_12 = l_12(0.5, 0, 0.5, 0)
    new.Position = l_12
    l_12 = UDim2
    l_12 = l_12.new
    l_12 = l_12(0, 520, 0, 340)
    new.Size = l_12
    new.ClipsDescendants = true
    l_12 = Vector2
    l_12 = l_12.new
    l_12 = l_12(0.5, 0.5)
    new.AnchorPoint = l_12
    new_8.Name = "Logo"
    new_8.Parent = new
    new_8.Active = true
    l_12 = Vector2
    l_12 = l_12.new
    l_12 = l_12(0.5, 0.5)
    new_8.AnchorPoint = l_12
    l_12 = Color3
    l_12 = l_12.fromRGB
    l_12 = l_12(255, 255, 255)
    new_8.BackgroundColor3 = l_12
    new_8.BackgroundTransparency = 1
    l_12 = UDim2
    l_12 = l_12.new
    l_12 = l_12(0, 35, 0, 30)
    new_8.Position = l_12
    l_12 = UDim2
    l_12 = l_12.new
    l_12 = l_12(0, 50, 0, 50)
    new_8.Size = l_12
    l_12 = _G
    l_12 = l_12.imageLogo
    new_8.Image = l_12
    l_12 = service_3
    l_12 = l_12.Create
    local new_11 = TweenInfo.new(5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, -1, true, 0)
    l_12 = l_12(l_12, new_8, new_11, {Rotation = 360})
    l_12 = l_12.Play
    l_12(l_12)
    new_9.Name = "Title"
    new_9.Parent = new
    l_12 = Color3
    l_12 = l_12.fromRGB
    l_12 = l_12(255, 255, 255)
    new_9.BackgroundColor3 = l_12
    new_9.BackgroundTransparency = 1
    l_12 = UDim2
    l_12 = l_12.new
    l_12 = l_12(0.0882352963, 20, 0, 7)
    new_9.Position = l_12
    l_12 = UDim2
    l_12 = l_12.new
    l_12 = l_12(0, 483, 0, 31)
    new_9.Size = l_12
    l_12 = Enum
    l_12 = l_12.Font
    l_12 = l_12.GothamBold
    new_9.Font = l_12
    l_12 = "ZEN HUB"
    l_12 = l_12 .. "<font color='rgb(255,0,0)'> NEXT GEN</font>"
    new_9.Text = l_12
    new_9.RichText = true
    l_12 = Color3
    l_12 = l_12.fromRGB
    l_12 = l_12(255, 255, 255)
    new_9.TextColor3 = l_12
    new_9.TextSize = 14
    new_9.TextWrapped = true
    l_12 = Enum
    l_12 = l_12.TextXAlignment
    l_12 = l_12.Left
    new_9.TextXAlignment = l_12
    new_10.Name = "Desc"
    new_10.Parent = new
    l_12 = Color3
    l_12 = l_12.fromRGB
    l_12 = l_12(255, 255, 255)
    new_10.BackgroundColor3 = l_12
    new_10.BackgroundTransparency = 1
    l_12 = UDim2
    l_12 = l_12.new
    l_12 = l_12(0.0882352963, 20, 0, 23)
    new_10.Position = l_12
    l_12 = UDim2
    l_12 = l_12.new
    l_12 = l_12(0, 483, 0, 31)
    new_10.Size = l_12
    l_12 = Enum
    l_12 = l_12.Font
    l_12 = l_12.GothamMedium
    new_10.Font = l_12
    l_12 = _G
    l_12 = l_12.Title
    new_10.Text = l_12
    l_12 = Color3
    l_12 = l_12.fromRGB
    l_12 = l_12(255, 255, 255)
    new_10.TextColor3 = l_12
    new_10.TextSize = 14
    new_10.TextWrapped = true
    new_10.TextTransparency = 0.5
    l_12 = Enum
    l_12 = l_12.TextXAlignment
    l_12 = l_12.Left
    new_10.TextXAlignment = l_12
    l_12 = Instance
    l_12 = l_12.new
    l_12 = l_12("ImageButton")
    l_12.Name = "Interface"
    l_12.Parent = new
    local from_r_g_b = Color3.fromRGB(20, 20, 20)
    l_12.BackgroundColor3 = from_r_g_b
    l_12.BackgroundTransparency = 1
    l_12.Position = UDim2.new(0, 410, 0, 12)
    l_12.Size = UDim2.new(0, 30, 0, 30)
    l_12.Image = "http://www.roblox.com/asset/?id=15681808739"
    Instance.new("Frame").Name = "SettingFrame"
    Instance.new("Frame").Parent = new
    Instance.new("Frame").ClipsDescendants = true
    local new_11 = Vector2.new(0, 0)
    Instance.new("Frame").AnchorPoint = new_11
    Instance.new("Frame").BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    Instance.new("Frame").Position = UDim2.new(0, 10, -2, 50)
    Instance.new("Frame").BackgroundTransparency = 0
    Instance.new("Frame").Size = UDim2.new(0, 500, 0, 285)
    Instance.new("Frame").ZIndex = 6
    local new_11 = Instance.new("TextLabel")
    local new_12 = Instance.new("TextLabel")
    local new_13 = Instance.new("TextLabel")
    Instance.new("Frame")
    Instance.new("UIGradient")
    Instance.new("TextLabel").Name = "Name"
    Instance.new("TextLabel").Parent = Instance.new("Frame")
    Instance.new("TextLabel").Active = true
    local from_r_g_b = Color3.fromRGB(255, 255, 255)
    Instance.new("TextLabel").BackgroundColor3 = from_r_g_b
    Instance.new("TextLabel").BackgroundTransparency = 1
    Instance.new("TextLabel").Position = UDim2.new(0.5, 0, 0.04, 0)
    Instance.new("TextLabel").Size = UDim2.new(0, 150, 0, 27)
    Instance.new("TextLabel").Font = Enum.Font.GothamBold
    Instance.new("TextLabel").TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("TextLabel").TextSize = 15
    Instance.new("TextLabel").Text = "Name : " .. service_1.LocalPlayer.Name .. " (" .. service_1.LocalPlayer.DisplayName .. ")"
    Instance.new("TextLabel").TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("TextLabel").Name = "Lvl"
    Instance.new("TextLabel").Parent = Instance.new("Frame")
    Instance.new("TextLabel").Active = true
    Instance.new("TextLabel").BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("TextLabel").BackgroundTransparency = 1
    Instance.new("TextLabel").Position = UDim2.new(0.5, 0, 0.12, 0)
    Instance.new("TextLabel").Size = UDim2.new(0, 200, 0, 27)
    Instance.new("TextLabel").TextTransparency = 0.4
    Instance.new("TextLabel").Font = Enum.Font.GothamBold
    Instance.new("TextLabel").TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("TextLabel").TextSize = 10
    Instance.new("TextLabel").TextXAlignment = Enum.TextXAlignment.Left
    new_11.Name = "Fruit"
    new_11.Parent = Instance.new("Frame")
    new_11.Active = true
    new_11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    new_11.BackgroundTransparency = 1
    new_11.Position = UDim2.new(0.5, 0, 0.19, 0)
    new_11.Size = UDim2.new(0, 200, 0, 27)
    new_11.Font = Enum.Font.GothamBold
    new_11.TextTransparency = 0
    new_11.TextColor3 = Color3.fromRGB(255, 0, 0)
    new_11.TextSize = 10
    new_11.TextXAlignment = Enum.TextXAlignment.Left
    new_12.Name = "Money"
    new_12.Parent = Instance.new("Frame")
    new_12.Active = true
    new_12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    new_12.BackgroundTransparency = 1
    new_12.Position = UDim2.new(0.5, 0, 0.25, 0)
    new_12.Size = UDim2.new(0, 200, 0, 27)
    new_12.TextTransparency = 0
    new_12.Font = Enum.Font.GothamBold
    new_12.TextColor3 = Color3.fromRGB(255, 255, 0)
    new_12.TextSize = 10
    new_12.TextXAlignment = Enum.TextXAlignment.Left
    new_13.Name = "Fragment"
    new_13.Parent = Instance.new("Frame")
    new_13.Active = true
    new_13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    new_13.BackgroundTransparency = 1
    new_13.Position = UDim2.new(0.5, 0, 0.3, 0)
    new_13.Size = UDim2.new(0, 200, 0, 27)
    new_13.Font = Enum.Font.GothamBold
    new_13.TextTransparency = 0
    new_13.TextColor3 = Color3.fromRGB(102, 0, 204)
    new_13.TextSize = 10
    new_13.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("TextLabel").Name = "Bounty"
    Instance.new("TextLabel").Parent = Instance.new("Frame")
    Instance.new("TextLabel").Active = true
    local from_r_g_b = Color3.fromRGB(255, 255, 255)
    Instance.new("TextLabel").BackgroundColor3 = from_r_g_b
    Instance.new("TextLabel").BackgroundTransparency = 1
    Instance.new("TextLabel").Position = UDim2.new(0.5, 0, 0.35, 0)
    Instance.new("TextLabel").Size = UDim2.new(0, 200, 0, 27)
    Instance.new("TextLabel").Font = Enum.Font.GothamBold
    Instance.new("TextLabel").TextColor3 = Color3.fromRGB(255, 170, 0)
    Instance.new("TextLabel").TextSize = 10
    Instance.new("TextLabel").TextTransparency = 0
    Instance.new("TextLabel").TextXAlignment = Enum.TextXAlignment.Left
    local new_14 = Instance.new("TextLabel")
    local new_15 = Instance.new("TextLabel")
    spawn(function()
  while r0 do
    pcall(function()
  new_14.Text = "Level : " .. service_1.LocalPlayer.Data.Level.Value
  new_12.Text = "Beli : " .. service_1.LocalPlayer.Data.Beli.Value
  new_13.Text = "Fragments : " .. service_1.LocalPlayer.Data.Fragments.Value
  new_15.Text = "Bounty : " .. service_1.LocalPlayer.leaderstats["Bounty/Honor"].Value
  local l_2 = l_18()
  local l_4 = l_18()
  StaminaText.Text = "Stamina : " .. l_2.Energy.Value .. "/" .. l_4.Energy.MaxValue
  local new = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
  local l_6 = l_18()
  local l_7 = l_18()
  local new_1 = UDim2.new(l_6.Energy.Value / l_7.Energy.MaxValue, 0, 1, 0)
  local create = service_3.Create(service_3, LineStamina, new, {Size = new_1})
  create.Play(create)
  HealthText.Text = "Health : " .. l_19().Health .. "/" .. l_19().MaxHealth
  service_3.Create(service_3, LineHealth, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(l_19().Health / l_19().MaxHealth, 0, 0, 5)}).Play(service_3.Create(service_3, LineHealth, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(l_19().Health / l_19().MaxHealth, 0, 0, 5)}))
end)
  end
end)
    local new_16 = Instance.new("UICorner")
    local new_17 = Instance.new("TextLabel")
    local new_18 = Instance.new("TextButton")
    Instance.new("Frame").Name = "guides"
    Instance.new("Frame").Parent = Instance.new("Frame")
    Instance.new("Frame").BackgroundColor3 = _G.Color
    local new_19 = UDim2.new(0, 200, 0, 20)
    Instance.new("Frame").Size = new_19
    Instance.new("Frame").Position = UDim2.new(0.5, 0, 0.42, 0)
    Instance.new("Frame").ZIndex = 16
    new_16.CornerRadius = UDim.new(0, 4)
    new_16.Parent = Instance.new("Frame")
    new_17.Parent = Instance.new("Frame")
    new_17.AnchorPoint = Vector2.new(0.5, 0.5)
    new_17.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    new_17.BackgroundTransparency = 1
    new_17.Position = UDim2.new(0.5, 0, 0.5, 0)
    new_17.Size = UDim2.new(0, 40, 0, 12)
    new_17.ZIndex = 16
    new_17.Font = Enum.Font.GothamMedium
    new_17.Text = "Destroy Gui"
    new_17.TextColor3 = Color3.fromRGB(255, 255, 255)
    new_17.TextSize = 12
    new_18.Parent = Instance.new("Frame")
    new_18.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    new_18.BackgroundTransparency = 1
    new_18.BorderSizePixel = 0
    new_18.ClipsDescendants = true
    new_18.Size = UDim2.new(1, 0, 1, 0)
    new_18.ZIndex = 16
    new_18.AutoButtonColor = false
    new_18.Font = Enum.Font.Gotham
    new_18.Text = ""
    new_18.TextColor3 = Color3.fromRGB(255, 255, 255)
    new_18.TextSize = 12
    new_18.MouseEnter.Connect(new_18.MouseEnter, function()
  local new = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
  local create = service_3.Create(service_3, new_18.Parent, new, {BackgroundTransparency = 0.5})
  create.Play(create)
end)
    new_18.MouseLeave.Connect(new_18.MouseLeave, function()
  local new = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
  local create = service_3.Create(service_3, new_18.Parent, new, {BackgroundTransparency = 0})
  create.Play(create)
end)
    new_18.MouseButton1Click.Connect(new_18.MouseButton1Click, function()
  l_25(new_18.Parent, mouse.X, mouse.Y)
  new_17.TextSize = 0
  local new = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
  local create = service_3.Create(service_3, new_17, new, {TextSize = 12})
  create.Play(create)
  new.Destroy(new)
end)
    Instance.new("Frame").Name = "Line"
    Instance.new("Frame").Parent = Instance.new("Frame")
    Instance.new("Frame").BorderSizePixel = 0
    local new_19 = UDim2.new(0, 239, 0, 1)
    Instance.new("Frame").Size = new_19
    Instance.new("Frame").Position = UDim2.new(0.5, 0, 0.51, 0)
    ColorSequenceKeypoint.new()
    ColorSequenceKeypoint.new()
    ColorSequenceKeypoint.new()
    local new_19 = ColorSequence.new({})
    Instance.new("UIGradient").Color = new_19
    Instance.new("UIGradient").Parent = Instance.new("Frame")
    Instance.new("ImageLabel").Parent = Instance.new("Frame")
    Instance.new("ImageLabel").Active = true
    local from_r_g_b = Color3.fromRGB(255, 255, 255)
    Instance.new("ImageLabel").BackgroundColor3 = from_r_g_b
    Instance.new("ImageLabel").BackgroundTransparency = 1
    Instance.new("ImageLabel").BorderSizePixel = 0
    Instance.new("ImageLabel").Position = UDim2.new(0.48, 0, 0.52, 0)
    Instance.new("ImageLabel").Size = UDim2.new(0, 35, 0, 35)
    Instance.new("ImageLabel").Image = "rbxassetid://14103696428"
    local new_19 = Instance.new("TextLabel")
    local new_20 = Instance.new("TextLabel")
    local new_21 = Instance.new("TextLabel")
    Instance.new("Frame")
    Instance.new("UIGradient")
    Instance.new("TextLabel").Name = "Credits"
    Instance.new("TextLabel").Parent = Instance.new("Frame")
    Instance.new("TextLabel").Active = true
    local from_r_g_b = Color3.fromRGB(255, 255, 255)
    Instance.new("TextLabel").BackgroundColor3 = from_r_g_b
    Instance.new("TextLabel").BackgroundTransparency = 1
    Instance.new("TextLabel").Position = UDim2.new(0.5, 0, 0.54, 0)
    Instance.new("TextLabel").Size = UDim2.new(0, 230, 0, 27)
    Instance.new("TextLabel").Font = Enum.Font.GothamBold
    Instance.new("TextLabel").TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("TextLabel").TextSize = 12
    Instance.new("TextLabel").Text = "Script Made by : Npg & KaiZen"
    new_19.Name = "timee"
    new_19.Parent = Instance.new("Frame")
    new_19.Active = true
    new_19.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    new_19.BackgroundTransparency = 1
    new_19.Position = UDim2.new(0.5, 0, 0.62, 0)
    new_19.Size = UDim2.new(0, 200, 0, 27)
    new_19.TextTransparency = 0.8
    new_19.Font = Enum.Font.GothamBold
    new_19.TextColor3 = Color3.fromRGB(255, 255, 255)
    new_19.TextSize = 10
    new_19.TextXAlignment = Enum.TextXAlignment.Left
    new_20.Name = "executer"
    new_20.Parent = Instance.new("Frame")
    new_20.Active = true
    new_20.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    new_20.BackgroundTransparency = 1
    new_20.Position = UDim2.new(0.5, 0, 0.7, 0)
    new_20.Size = UDim2.new(0, 200, 0, 27)
    new_20.Font = Enum.Font.GothamBold
    new_20.TextTransparency = 0.8
    new_20.TextColor3 = Color3.fromRGB(255, 255, 255)
    new_20.TextSize = 10
    new_20.TextXAlignment = Enum.TextXAlignment.Left
    new_21.Name = "exename"
    new_21.Parent = Instance.new("Frame")
    new_21.Active = true
    new_21.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    new_21.BackgroundTransparency = 1
    new_21.Position = UDim2.new(0.5, 0, 0.78, 0)
    new_21.Size = UDim2.new(0, 200, 0, 27)
    new_21.Font = Enum.Font.GothamBold
    new_21.TextTransparency = 0.8
    new_21.TextColor3 = Color3.fromRGB(255, 255, 255)
    new_21.TextSize = 10
    new_21.TextXAlignment = Enum.TextXAlignment.Left
    local identifyexecutor = identifyexecutor()
    new_21.Text = "Executer : " .. identifyexecutor
    local new_22 = Instance.new("TextLabel")
    local new_23 = Instance.new("TextButton")
    Instance.new("Frame").Name = "Butn2"
    Instance.new("Frame").Parent = Instance.new("Frame")
    Instance.new("Frame").BackgroundColor3 = _G.Color
    local new_24 = UDim2.new(0, 200, 0, 25)
    Instance.new("Frame").Size = new_24
    Instance.new("Frame").Position = UDim2.new(0.5, 0, 0.88, 0)
    Instance.new("Frame").ZIndex = 16
    Instance.new("UICorner").CornerRadius = UDim.new(0, 4)
    Instance.new("UICorner").Parent = Instance.new("Frame")
    new_22.Parent = Instance.new("Frame")
    new_22.AnchorPoint = Vector2.new(0.5, 0.5)
    new_22.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    new_22.BackgroundTransparency = 1
    new_22.Position = UDim2.new(0.5, 0, 0.5, 0)
    new_22.Size = UDim2.new(0, 40, 0, 12)
    new_22.ZIndex = 16
    new_22.Font = Enum.Font.GothamMedium
    new_22.Text = "Copy Zen Hub discord link"
    new_22.TextColor3 = Color3.fromRGB(255, 255, 255)
    new_22.TextSize = 12
    new_23.Parent = Instance.new("Frame")
    new_23.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    new_23.BackgroundTransparency = 1
    new_23.BorderSizePixel = 0
    new_23.ClipsDescendants = true
    new_23.Size = UDim2.new(1, 0, 1, 0)
    new_23.ZIndex = 16
    new_23.AutoButtonColor = false
    new_23.Font = Enum.Font.Gotham
    new_23.Text = ""
    new_23.TextColor3 = Color3.fromRGB(255, 255, 255)
    new_23.TextSize = 12
    new_23.MouseEnter.Connect(new_23.MouseEnter, function()
  local new = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
  local create = service_3.Create(service_3, new_23.Parent, new, {BackgroundTransparency = 0.5})
  create.Play(create)
end)
    new_23.MouseLeave.Connect(new_23.MouseLeave, function()
  local new = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
  local create = service_3.Create(service_3, new_23.Parent, new, {BackgroundTransparency = 0})
  create.Play(create)
end)
    new_23.MouseButton1Click.Connect(new_23.MouseButton1Click, function()
  l_25(new_23.Parent, mouse.X, mouse.Y)
  new_22.TextSize = 0
  local new = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
  local create = service_3.Create(service_3, new_22, new, {TextSize = 12})
  create.Play(create)
  new_22.Text = "Copied to Clipboard!"
  task.wait(1)
  new_22.Text = "Copy Zen Hub discord link"
  setclipboard("https://discord.gg/7xc8z6H9MR")
end)
    function l_1.Set(a0, a1)
      new_19.Text = a1
    end
    function l_2.Set(a0, a1)
      new_20.Text = a1
    end
    function UpdateClient()
      local wait = task.wait()
      local floor = math.floor(1 / wait)
      l_2.Set(l_2, "[Fps] : " .. floor .. " [Ping] : " .. game.GetService(game, "Stats").Network.ServerStatsItem["Data Ping"].GetValueString(game.GetService(game, "Stats").Network.ServerStatsItem["Data Ping"]))
    end
    spawn(function()
  while r0 do
    UpdateClient()
  end
end)
    local l_39 = function()
  local l_1 = "*t"
  local date = os.date(l_1)
  l_1 = date.hour
  l_1 = l_1 % 24
  if l_1 >= 12 or not "AM" then
  end
  local format = string.format("%02i:%02i:%02i %s", (l_1 - 1) % 12 + 1, date.min, date.sec, "PM")
  local format_1 = string.format("%02d/%02d/%04d", date.day, date.month, date.year)
  l_1.Set(l_1, "Date: " .. format_1 .. " - " .. "Time: " .. format)
end
    spawn(function()
  while r0 do
    l_39()
  end
end)
    if game.PlaceId == 2753915549 or game.PlaceId == 4442272183 or game.PlaceId == 7449423635 then
      new_11.Text = "Devil Fruit : " .. service_1.LocalPlayer.Data.DevilFruit.Value .. " / " .. "Race : " .. service_1.LocalPlayer.Data.Race.Value
    else
      new_11.Text = "Don't Find Your Database"
      new_14.Text = "Don't Find Your Database"
    end
    local l_41 = Instance
    l_41 = l_41.new
    l_41 = l_41("Frame")
    l_41.Name = "Playerbackk"
    l_41.Parent = Instance.new("Frame")
    l_41.ClipsDescendants = true
    local from_r_g_b = Color3.fromRGB(35, 35, 35)
    l_41.BackgroundColor3 = from_r_g_b
    l_41.Position = UDim2.new(0, 10, 0, 10)
    l_41.BackgroundTransparency = 0
    l_41.Size = UDim2.new(0, 210, 0, 270)
    l_41.ZIndex = 6
    local new_24 = UDim.new(0, 8)
    Instance.new("UICorner").CornerRadius = new_24
    Instance.new("UICorner").Name = "UserImageCorner"
    Instance.new("UICorner").Parent = l_41
    Instance.new("UIStroke").Name = "strokeplayer"
    Instance.new("UIStroke").Parent = l_41
    Instance.new("UIStroke").ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    Instance.new("UIStroke").Color = _G.Color
    Instance.new("UIStroke").LineJoinMode = Enum.LineJoinMode.Round
    Instance.new("UIStroke").Thickness = 0
    Instance.new("UIStroke").Transparency = 0
    Instance.new("UIStroke").Enabled = true
    Instance.new("UIStroke").Archivable = true
    local l_49, l_50 = service_1.GetUserThumbnailAsync(service_1, service_1.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
    local new_24 = Instance.new("ImageLabel")
    new_24.Name = "Logo_Image2"
    new_24.Parent = l_41
    local from_r_g_b = Color3.fromRGB(255, 255, 255)
    new_24.BackgroundColor3 = from_r_g_b
    new_24.BackgroundTransparency = 1
    new_24.BorderSizePixel = 0
    new_24.Position = UDim2.new(0, 7, 0, 5)
    new_24.Size = UDim2.new(0, 180, 0, 160)
    if l_50 then
      if not l_49 then
      end
    end
    new_24.Image = PLACEHOLDER_IMAGE
    local new_25 = Instance.new("UICorner")
    local new_26 = Instance.new("TextLabel")
    local new_27 = Instance.new("Frame")
    local new_28 = Instance.new("Frame")
    Instance.new("Frame").Name = "HealthBar"
    Instance.new("Frame").Parent = l_41
    local from_r_g_b = Color3.fromRGB(40, 40, 40)
    Instance.new("Frame").BackgroundColor3 = from_r_g_b
    Instance.new("Frame").BorderSizePixel = 0
    Instance.new("Frame").BackgroundTransparency = 1
    Instance.new("Frame").Position = UDim2.new(0.0187500007, 0, 0.640836018, 0)
    Instance.new("Frame").Size = UDim2.new(0, 150, 0, 45)
    new_25.CornerRadius = UDim.new(0, 4)
    new_25.Name = "HealthBarUICorner"
    new_25.Parent = Instance.new("Frame")
    new_26.Name = "HealthText"
    new_26.Parent = Instance.new("Frame")
    new_26.Active = true
    new_26.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    new_26.BackgroundTransparency = 1
    new_26.Position = UDim2.new(0.0260000005, 0, 0.100000001, 0)
    new_26.Size = UDim2.new(0, 300, 0, 22)
    new_26.Font = Enum.Font.GothamBold
    new_26.Text = "Health : 100/100"
    new_26.TextColor3 = Color3.fromRGB(255, 0, 0)
    new_26.TextSize = 12
    new_26.TextWrapped = true
    new_26.TextXAlignment = Enum.TextXAlignment.Left
    new_27.Name = "Line"
    new_27.Parent = Instance.new("Frame")
    new_27.AnchorPoint = Vector2.new(0.5, 0.5)
    new_27.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    new_27.BorderSizePixel = 0
    new_27.Position = UDim2.new(0.498908311, 0, 0.766666651, 0)
    new_27.Size = UDim2.new(0, 240, 0, 5)
    new_28.Name = "LineHealth"
    new_28.Parent = new_27
    new_28.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    new_28.BorderSizePixel = 0
    new_28.Size = UDim2.new(0, 240, 0, 5)
    local new_29 = Instance.new("UICorner")
    local new_30 = Instance.new("TextLabel")
    local new_31 = Instance.new("Frame")
    local new_32 = Instance.new("Frame")
    Instance.new("Frame").Name = "StaminaBar"
    Instance.new("Frame").Parent = l_41
    local from_r_g_b = Color3.fromRGB(40, 40, 40)
    Instance.new("Frame").BackgroundColor3 = from_r_g_b
    Instance.new("Frame").BorderSizePixel = 0
    Instance.new("Frame").BackgroundTransparency = 1
    Instance.new("Frame").Position = UDim2.new(0.0166666675, 0, 0.80803858, 0)
    Instance.new("Frame").Size = UDim2.new(0, 150, 0, 45)
    new_29.CornerRadius = UDim.new(0, 4)
    new_29.Name = "StaminaBarUICorner"
    new_29.Parent = Instance.new("Frame")
    new_30.Name = "StaminaText"
    new_30.Parent = Instance.new("Frame")
    new_30.Active = true
    new_30.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    new_30.BackgroundTransparency = 1
    new_30.Position = UDim2.new(0.0260000005, 0, 0.100000001, 0)
    new_30.Size = UDim2.new(0, 300, 0, 22)
    new_30.Font = Enum.Font.GothamBold
    new_30.Text = "Stamina : 100/100"
    new_30.TextColor3 = Color3.fromRGB(85, 170, 255)
    new_30.TextSize = 12
    new_30.TextWrapped = true
    new_30.TextXAlignment = Enum.TextXAlignment.Left
    new_31.Name = "StaminaLine"
    new_31.Parent = Instance.new("Frame")
    new_31.AnchorPoint = Vector2.new(0.5, 0.5)
    new_31.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    new_31.BorderSizePixel = 0
    new_31.Position = UDim2.new(0.498908311, 0, 0.766666651, 0)
    new_31.Size = UDim2.new(0, 240, 0, 5)
    new_32.Name = "LineStamina"
    new_32.Parent = new_31
    new_32.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
    new_32.BorderSizePixel = 0
    new_32.Size = UDim2.new(0, 240, 0, 5)
    Instance.new("UIStroke").Name = "UIStroke"
    Instance.new("UIStroke").Parent = Instance.new("Frame")
    Instance.new("UIStroke").ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    Instance.new("UIStroke").Color = _G.Color
    Instance.new("UIStroke").LineJoinMode = Enum.LineJoinMode.Round
    Instance.new("UIStroke").Thickness = 2
    Instance.new("UIStroke").Transparency = 0.5
    Instance.new("UIStroke").Enabled = true
    Instance.new("UIStroke").Archivable = true
    l_12.MouseButton1Click.Connect(l_12.MouseButton1Click, function()
  if SettingFrameclose == false then
    SettingFrameclose = true
    Instance.new("UIStroke").Parent.Visible = true
    local new = UDim2.new(0, 10, -2, 50)
    Instance.new("UIStroke").Parent.TweenPosition(Instance.new("UIStroke").Parent, new, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 1, true)
  else
    SettingFrameclose = false
    Instance.new("UIStroke").Parent.Visible = true
    Instance.new("UIStroke").Parent.TweenPosition(Instance.new("UIStroke").Parent, UDim2.new(0, 10, 0, 50), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 1, true)
  end
end)
    local new_33 = Instance.new("UICorner")
    local new_34 = UDim.new(0, 3)
    new_33.CornerRadius = new_34
    new_33.Name = "SettingCornerrr"
    new_33.Parent = Instance.new("Frame")
    Instance.new("ImageButton").Name = "Minimize"
    Instance.new("ImageButton").Parent = new
    local from_r_g_b = Color3.fromRGB(20, 20, 20)
    Instance.new("ImageButton").BackgroundColor3 = from_r_g_b
    Instance.new("ImageButton").BackgroundTransparency = 1
    Instance.new("ImageButton").Position = UDim2.new(0, 445, 0, 12)
    Instance.new("ImageButton").Size = UDim2.new(0, 30, 0, 30)
    Instance.new("ImageButton").Image = "http://www.roblox.com/asset/?id=15681794298"
    Instance.new("ImageButton").Name = "Close"
    Instance.new("ImageButton").Parent = new
    local from_r_g_b = Color3.fromRGB(20, 20, 20)
    Instance.new("ImageButton").BackgroundColor3 = from_r_g_b
    Instance.new("ImageButton").BackgroundTransparency = 1
    Instance.new("ImageButton").Position = UDim2.new(0, 474, 0, 12)
    Instance.new("ImageButton").Size = UDim2.new(0, 30, 0, 30)
    Instance.new("ImageButton").Image = "http://www.roblox.com/asset/?id=15681732588"
    Instance.new("ImageButton").ImageColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("ImageButton").ZIndex = 10
    local new_34 = Instance.new("ImageButton")
    Instance.new("ImageButton").MouseButton1Click.Connect(Instance.new("ImageButton").MouseButton1Click, function()
  if MainPageclose == false then
    MainPageclose = true
    local new = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local create = service_3.Create(service_3, new_34, new, {Rotation = 0})
    create.Play(create)
    new.TweenSize()
    local new = UDim2.new(0.5, 0, 0.5, 0)
    new.Position = new
    new_33.Parent.Visible = false
  else
    MainPageclose = false
    service_3.Create(service_3, new_34, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 180}).Play(service_3.Create(service_3, new_34, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 180}))
    new.TweenSize()
    new_33.Parent.Visible = false
  end
end)
    local from_r_g_b = Color3.fromRGB(25, 25, 25)
    Instance.new("UIStroke").Color = from_r_g_b
    Instance.new("UIStroke").Thickness = 2
    Instance.new("UIStroke").Name = "UiToggle_UiStroke1"
    Instance.new("UIStroke").Parent = new
    new_1.CornerRadius = UDim.new(0, 3)
    new_1.Parent = new
    new_2.Name = "Top"
    new_2.Parent = new
    new_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    new_2.BackgroundTransparency = 1
    new_2.Position = UDim2.new(0.021956088, 0, 0.003333337, 50)
    new_2.Size = UDim2.new(0, 490, 0, 39)
    Instance.new("Frame").Name = "Top"
    Instance.new("Frame").Parent = new
    local from_r_g_b = Color3.fromRGB(255, 255, 255)
    Instance.new("Frame").BackgroundColor3 = from_r_g_b
    Instance.new("Frame").BackgroundTransparency = 1
    Instance.new("Frame").Position = UDim2.new(0, 0, 0, 0)
    Instance.new("Frame").Size = UDim2.new(0, 520, 0, 50)
    new_3.Name = "TabHolder"
    new_3.Parent = new_2
    new_3.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    new_3.Position = UDim2.new(-0.010309278, 6, -0.0323075824, 0)
    new_3.Size = UDim2.new(0, 495, 0, 38)
    new_4.Parent = new_3
    new_5.Name = "TabContainer"
    new_5.Parent = new_3
    new_5.Active = true
    new_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    new_5.BackgroundTransparency = 1
    new_5.Size = UDim2.new(0, 495, 0, 38)
    new_5.CanvasSize = UDim2.new(2, 0, 0, 0)
    new_5.ScrollBarThickness = 0
    new_5.VerticalScrollBarInset = Enum.ScrollBarInset.Always
    new_6.Parent = new_5
    new_6.FillDirection = Enum.FillDirection.Horizontal
    new_6.SortOrder = Enum.SortOrder.LayoutOrder
    new_6.Padding = UDim.new(0, 30)
    new_6.GetPropertyChangedSignal(new_6, "AbsoluteContentSize").Connect(new_6.GetPropertyChangedSignal(new_6, "AbsoluteContentSize"), function()
  local new = UDim2.new(0, new_6.AbsoluteContentSize.X, 0, 0)
  new_5.CanvasSize = new
end)
    new_7.Parent = new_5
    new_7.PaddingLeft = UDim.new(0, 3)
    new_7.PaddingTop = UDim.new(0, 3)
    Instance.new("Frame").Name = "Bottom"
    Instance.new("Frame").Parent = new
    local from_r_g_b = Color3.fromRGB(25, 25, 25)
    Instance.new("Frame").BackgroundColor3 = from_r_g_b
    Instance.new("Frame").BackgroundTransparency = 1
    Instance.new("Frame").Position = UDim2.new(0.0119760484, 7, 0.0916666687, 60)
    Instance.new("Frame").Size = UDim2.new(0, 500, 0, 525)
    local l_69 = false
    service_2.InputBegan.Connect(service_2.InputBegan, function(a0, a1)
  if a0.KeyCode == l_24.Bind then
    if l_69 == false then
      local new = UDim2.new(0, 0, 0, 0)
      new.TweenSize(new, new, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 1, true)
      l_69 = true
      task.wait(0.5)
      new.Enabled = false
    else
      new.TweenSize(new, UDim2.new(0, 520, 0, 340), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 1, true)
      new.Enabled = true
      l_69 = false
    end
  end
end)
    l_26(Instance.new("Frame"), new)
    local new_35 = Instance.new("Frame")
    local l_71 = false
    return {
      Tab = function(a0, a1, a2)
  local new = Instance.new("Frame")
  local new_1 = Instance.new("TextButton")
  local new_2 = Instance.new("UICorner")
  local new_3 = Instance.new("UICorner")
  local new_4 = Instance.new("ImageLabel")
  local new_5 = Instance.new("TextLabel")
  new.Name = "FrameTab"
  new.Parent = new_1
  local from_r_g_b = Color3.fromRGB(34, 34, 34)
  new.BackgroundColor3 = from_r_g_b
  new.Size = UDim2.new(0, 140, 0, 30)
  new_3.CornerRadius = UDim.new(0, 3)
  new_3.Parent = new
  new_1.Name = "Tab"
  new_1.Parent = new_5
  new_1.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
  new_1.Size = UDim2.new(0, 114, 0, 30)
  new_1.BackgroundTransparency = 1
  new_1.Text = ""
  new_2.CornerRadius = UDim.new(0, 3)
  new_2.Parent = new_1
  new_4.Parent = new_1
  new_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  new_4.Position = UDim2.new(0, 5, 0.2, 0)
  new_4.Size = UDim2.new(0, 20, 0, 20)
  new_4.Image = "http://www.roblox.com/asset/?id=" .. a2
  new_4.ImageColor3 = Color3.fromRGB(255, 255, 255)
  new_4.ImageTransparency = 0.2
  new_4.BackgroundTransparency = 1
  new_5.Parent = new_1
  new_5.Text = a1 .. " "
  new_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  new_5.BackgroundTransparency = 1
  new_5.Position = UDim2.new(0.342105269, 0, 0.100000001, 0)
  new_5.Size = UDim2.new(0, 87, 0, 27)
  new_5.Font = Enum.Font.GothamBold
  new_5.TextColor3 = Color3.fromRGB(255, 255, 255)
  new_5.TextSize = 12.3
  new_5.TextXAlignment = Enum.TextXAlignment.Left
  new_5.TextTransparency = 0.2
  if new_5.Name == a1 .. " " then
    new_1.Size = UDim2.new(0, 70 + new_5.TextBounds.X, 0, 25)
    local l_10 = "ScrollingFrame"
    l_10 = Instance
    l_10 = l_10.new
    local l_11 = "ScrollingFrame"
    l_10 = l_10(l_11)
    l_11 = Instance
    l_11 = l_11.new
    l_11 = l_11("ScrollingFrame")
    local new_6 = Instance.new("UIListLayout")
    local new_7 = Instance.new("UIPadding")
    Instance.new(l_10).Name = "Page"
    Instance.new(l_10).Parent = new_35
    local from_r_g_b = Color3.fromRGB(255, 255, 255)
    Instance.new(l_10).BackgroundColor3 = from_r_g_b
    Instance.new(l_10).BackgroundTransparency = 1
    Instance.new(l_10).Size = UDim2.new(0, 500, 0, 300)
    Instance.new(l_10).ScrollBarThickness = 0
    Instance.new(l_10).CanvasSize = UDim2.new(0, 0, 0, 0)
    Instance.new(l_10).Visible = false
    l_10.Name = "Left"
    l_10.Parent = Instance.new(l_10)
    l_10.Active = true
    l_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    l_10.BackgroundTransparency = 1
    l_10.Size = UDim2.new(0, 240, 0, 260)
    l_10.ScrollBarThickness = 0
    l_10.CanvasSize = UDim2.new(0, 0, 0, 0)
    l_11.Name = "Right"
    l_11.Parent = Instance.new(l_10)
    l_11.Active = true
    l_11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    l_11.BackgroundTransparency = 1
    l_11.Size = UDim2.new(0, 240, 0, 260)
    l_11.ScrollBarThickness = 0
    l_11.CanvasSize = UDim2.new(0, 0, 0, 0)
    local new_8 = Instance.new("UIListLayout")
    Instance.new("UIListLayout").Parent = l_10
    Instance.new("UIListLayout").SortOrder = Enum.SortOrder.LayoutOrder
    local new_9 = UDim.new(0, 5)
    Instance.new("UIListLayout").Padding = new_9
    new_8.Parent = l_11
    new_8.SortOrder = Enum.SortOrder.LayoutOrder
    new_8.Padding = UDim.new(0, 5)
    new_6.Parent = Instance.new(l_10)
    new_6.FillDirection = Enum.FillDirection.Horizontal
    new_6.SortOrder = Enum.SortOrder.LayoutOrder
    new_6.Padding = UDim.new(0, 13)
    new_7.Parent = Instance.new(l_10)
    if l_71 == false then
      l_71 = true
      Instance.new(l_10).Visible = true
      new_5.TextColor3 = _G.Color
      new_5.TextTransparency = 0
      new_4.ImageColor3 = _G.Color
    end
  end
  new_1.MouseButton1Click.Connect(new_1.MouseButton1Click, function()
  local l_1, l_2 = new_5.GetChildren(new_5)
  for l_3, l_4 in next do
    for l_3, l_4 in next do
      if l_4.Name == "Tab" then
        local new = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local from_r_g_b = Color3.fromRGB(255, 255, 255)
        local create = service_3.Create(service_3, l_4.TextLabel, new, {TextColor3 = from_r_g_b})
        create.Play(create)
        service_3.Create(service_3, l_4.ImageLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(255, 255, 255)}).Play(service_3.Create(service_3, l_4.ImageLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(255, 255, 255)}))
        service_3.Create(service_3, l_4.ImageLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0.2}).Play(service_3.Create(service_3, l_4.ImageLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0.2}))
        service_3.Create(service_3, l_4.TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0.2}).Play(service_3.Create(service_3, l_4.TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0.2}))
        local l_6, l_7 = new_35.GetChildren(new_35)
        for new, l_9 in next do
          for l_8, l_9 in next do
            l_9.Visible = false
          end
        end
      end
    end
  end
  local create = service_3.Create(service_3, new_5, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = _G.Color})
  create.Play(create)
  service_3.Create(service_3, new_4, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = _G.Color}).Play(service_3.Create(service_3, new_4, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = _G.Color}))
  service_3.Create(service_3, new_4, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0}).Play(service_3.Create(service_3, new_4, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0}))
  service_3.Create(service_3, new_5, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}).Play(service_3.Create(service_3, new_5, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}))
  new_7.Parent.Visible = true
end)
  local new_9 = Instance.new("UIListLayout")
  service_4.Stepped.Connect(service_4.Stepped, function()
  pcall(function()
  local new = UDim2.new(0, 0, 0, new_8.AbsoluteContentSize.Y + 5)
  l_11.CanvasSize = new
  l_10.CanvasSize = UDim2.new(0, 0, 0, new_9.AbsoluteContentSize.Y + 5)
end)
end)
  local l_16 = function(a0)
  if a0 == 1 then
    return l_10
  end
  if a0 == 2 then
    return l_11
  end
  return l_10
end
  return {
    CraftPage = function(a0, a1, a2)
  if a2 == nil then
    return l_10
  end
  local new = Instance.new("Frame")
  local new_1 = Instance.new("UICorner")
  local new_2 = Instance.new("Frame")
  local new_3 = Instance.new("Frame")
  local new_4 = Instance.new("TextLabel")
  local new_5 = Instance.new("Frame")
  local new_6 = Instance.new("Frame")
  local new_7 = Instance.new("UIListLayout")
  local new_8 = Instance.new("UIPadding")
  new.Name = "Section"
  local l_12 = l_16(a2)
  new.Parent = l_12
  new.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
  new.ClipsDescendants = true
  new.Size = UDim2.new(0, 240, 0, 343)
  new_1.CornerRadius = UDim.new(0, 5)
  new_1.Parent = new
  new_2.Name = "Top"
  new_2.Parent = new
  new_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  new_2.BackgroundTransparency = 1
  new_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
  new_2.Size = UDim2.new(0, 238, 0, 31)
  new_3.Name = "Line"
  new_3.Parent = new_2
  new_3.BorderSizePixel = 0
  new_3.Size = UDim2.new(0, 239, 0, 1)
  new_3.Position = UDim2.new(0, 0, 0, 23)
  ColorSequenceKeypoint.new()
  ColorSequenceKeypoint.new()
  ColorSequenceKeypoint.new()
  local new_9 = ColorSequence.new({})
  Instance.new("UIGradient").Color = new_9
  Instance.new("UIGradient").Parent = new_3
  new_4.Name = "Sectionname"
  new_4.Parent = new_2
  new_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  new_4.BackgroundTransparency = 1
  new_4.Position = UDim2.new(0.0591227226, 0, 0.0222222228, 0)
  new_4.Size = UDim2.new(0, 224, 0, 24)
  new_4.Font = Enum.Font.GothamBold
  new_4.Text = "#" .. a1
  new_4.TextColor3 = Color3.fromRGB(255, 255, 255)
  new_4.TextSize = 14
  new_4.TextTransparency = 0
  new_4.TextXAlignment = Enum.TextXAlignment.Center
  new_5.Name = "SectionContainer"
  new_5.Parent = new_2
  new_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  new_5.BackgroundTransparency = 1
  new_5.BorderSizePixel = 0
  new_5.Position = UDim2.new(0, 0, 0.899416223, 0)
  new_5.Size = UDim2.new(0, 239, 0, 318)
  new_6.Name = "SectionContainer_2"
  new_6.Parent = new_2
  new_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  new_6.BackgroundTransparency = 1
  new_6.BorderSizePixel = 0
  new_6.Position = UDim2.new(0, 0, 0.796416223, 0)
  new_6.Size = UDim2.new(0, 239, 0, 318)
  new_7.Parent = new_5
  new_7.SortOrder = Enum.SortOrder.LayoutOrder
  new_7.Padding = UDim.new(0, 5)
  new_8.Parent = new_5
  new_8.PaddingLeft = UDim.new(0, 5)
  new_7.GetPropertyChangedSignal(new_7, "AbsoluteContentSize").Connect(new_7.GetPropertyChangedSignal(new_7, "AbsoluteContentSize"), function()
  local new = UDim2.new(1, 0, 0, new_7.AbsoluteContentSize.Y + 35)
  new.Size = new
end)
  return {
    changelog = function(a0, a1)
  local new = Instance.new("Frame")
  local new_1 = Instance.new("TextLabel")
  new.Name = "Label"
  new.Parent = new_5
  local new_2 = Vector2.new(0.5, 0.5)
  new.AnchorPoint = new_2
  new.BackgroundTransparency = 1
  new.Size = UDim2.new(0.975000024, 0, 0, 30)
  new_1.Name = "Text"
  new_1.Parent = new
  new_1.AnchorPoint = Vector2.new(0.5, 0.5)
  new_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  new_1.BackgroundTransparency = 1
  new_1.Position = UDim2.new(0.5, 0, 0.5, 0)
  new_1.Size = UDim2.new(0, 53, 0, 12)
  new_1.ZIndex = 16
  new_1.Font = Enum.Font.GothamBold
  new_1.Text = a1
  new_1.TextColor3 = Color3.fromRGB(255, 255, 255)
  new_1.TextSize = 11
  return {Change = function(a0, a1)
  new_1.Text = a1
end}
end,
    Label = function(a0, a1)
  local new = Instance.new("TextLabel")
  local new_1 = Instance.new("UIPadding")
  new.Name = "Label"
  new.Parent = new_5
  local from_r_g_b = Color3.fromRGB(255, 255, 255)
  new.BackgroundColor3 = from_r_g_b
  new.BackgroundTransparency = 1
  new.Size = UDim2.new(0, 200, 0, 20)
  new.Font = Enum.Font.GothamBold
  new.TextColor3 = Color3.fromRGB(225, 225, 225)
  new.TextTransparency = 0.5
  new.TextSize = 10
  new.Text = a1
  new.TextXAlignment = Enum.TextXAlignment.Left
  new_1.PaddingLeft = UDim.new(0, 10)
  new_1.Parent = new
  new_1.Name = "PaddingLabel"
  return {Set = function(a0, a1)
  new.Text = a1
end}
end,
    Status = function(a0, a1)
  local new = Instance.new("TextLabel")
  local new_1 = Instance.new("UIPadding")
  local new_2 = Instance.new("UICorner")
  new.Name = "Label"
  new.Parent = new_5
  local from_r_g_b = Color3.fromRGB(255, 255, 255)
  new.BackgroundColor3 = from_r_g_b
  new.BackgroundTransparency = 1
  new.Size = UDim2.new(0.981000024, 0, 0, 20)
  new.Font = Enum.Font.GothamBold
  new.TextColor3 = Color3.fromRGB(225, 225, 225)
  new.TextTransparency = 0.1
  new.TextSize = 11
  new.Text = a1
  new.TextXAlignment = Enum.TextXAlignment.Left
  new_2.CornerRadius = UDim.new(0, 2)
  new_2.Parent = new
  Instance.new("UIStroke").Name = "LabelStrokee"
  Instance.new("UIStroke").Parent = new
  Instance.new("UIStroke").ApplyStrokeMode = Enum.ApplyStrokeMode.Border
  Instance.new("UIStroke").Color = _G.Color
  Instance.new("UIStroke").LineJoinMode = Enum.LineJoinMode.Round
  Instance.new("UIStroke").Thickness = 0.7
  Instance.new("UIStroke").Transparency = 0
  Instance.new("UIStroke").Enabled = true
  Instance.new("UIStroke").Archivable = true
  local new_3 = UDim.new(0, 10)
  new_1.PaddingLeft = new_3
  new_1.Parent = new
  new_1.Name = "PaddingLabel"
  return {Set = function(a0, a1)
  new.Text = a1
end}
end,
    LabelColor = function(a0, a1, a2)
  local new = Instance.new("Frame")
  local new_1 = Instance.new("TextLabel")
  new.Name = "Label"
  new.Parent = new_5
  local new_2 = Vector2.new(0.5, 0.5)
  new.AnchorPoint = new_2
  new.BackgroundTransparency = 1
  new.Size = UDim2.new(0.975000024, 0, 0, 30)
  new_1.Name = "Text"
  new_1.Parent = new
  new_1.AnchorPoint = Vector2.new(0.5, 0.5)
  new_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  new_1.BackgroundTransparency = 1
  new_1.Position = UDim2.new(0.5, 0, 0.5, 0)
  new_1.Size = UDim2.new(0, 53, 0, 12)
  new_1.ZIndex = 16
  new_1.Font = Enum.Font.GothamBold
  new_1.Text = a1
  new_1.TextColor3 = Color3.fromRGB(a2)
  new_1.TextSize = 12
  return {Change = function(a0, a1)
  new_1.Text = a1
end}
end,
    ButtonTog = function(a0, a1, a2, a3)
  if not a3 then
    local new = Instance.new("Frame")
    local new_1 = Instance.new("UICorner")
    local new_2 = Instance.new("TextLabel")
    local new_3 = Instance.new("TextButton")
    new.Name = "Button"
    new.Parent = new_5
    local from_r_g_b = Color3.fromRGB(33, 132, 112)
    new.BackgroundColor3 = from_r_g_b
    new.Size = UDim2.new(0.975000024, 0, 0, 25)
    new.ZIndex = 16
    if a2 then
      new.BackgroundColor3 = Color3.fromRGB(33, 132, 112)
    else
      new.BackgroundColor3 = _G.Color
    end
  end
  new_1.CornerRadius = UDim.new(0, 4)
  new_1.Parent = new
  new_2.Parent = new
  new_2.AnchorPoint = Vector2.new(0.5, 0.5)
  new_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  new_2.BackgroundTransparency = 1
  new_2.Position = UDim2.new(0.5, 0, 0.5, 0)
  new_2.Size = UDim2.new(0, 40, 0, 12)
  new_2.ZIndex = 16
  new_2.Font = Enum.Font.GothamBold
  new_2.Text = tostring(a1)
  new_2.TextColor3 = Color3.fromRGB(255, 255, 255)
  new_2.TextSize = 12
  new_3.Parent = new
  new_3.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
  new_3.BackgroundTransparency = 1
  new_3.BorderSizePixel = 0
  new_3.ClipsDescendants = true
  new_3.Size = UDim2.new(1, 0, 1, 0)
  new_3.ZIndex = 16
  new_3.AutoButtonColor = false
  new_3.Font = Enum.Font.Gotham
  new_3.Text = ""
  new_3.TextColor3 = Color3.fromRGB(255, 255, 255)
  new_3.TextSize = 14
  local l_4 = {}
  new_3.MouseButton1Click.Connect(new_3.MouseButton1Click, function()
  a2 = not a2
  l_4.Update(l_4, a2)
  l_25(new, mouse.X, mouse.Y)
end)
  if a2 then
    local new_4 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    if not state or not _G.Color then
      local from_r_g_b = Color3.fromRGB(33, 132, 112)
    end
    service_3.Create(service_3, new, new_4, {BackgroundColor3 = from_r_g_b}).Play(service_3.Create(service_3, new, new_4, {BackgroundColor3 = from_r_g_b}))
    function()
end(a2)
  end
  local l_5 = function()
end
  function l_4.Update(a0, a1)
    local new = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local from_r_g_b = Color3.fromRGB(33, 132, 112)
    if not a1 or not from_r_g_b then
    end
    local create = service_3.Create(service_3, new, new, {BackgroundColor3 = _G.Color})
    create.Play(create)
    l_5(a1)
    a2 = a1
  end
  return l_4
end,
    Button = function(a0, a1, a2)
  local new = Instance.new("Frame")
  local new_1 = Instance.new("UICorner")
  local new_2 = Instance.new("TextLabel")
  local new_3 = Instance.new("TextButton")
  new.Name = "Button"
  new.Parent = new_5
  new.BackgroundColor3 = _G.Color
  local new_4 = UDim2.new(0.975000024, 0, 0, 20)
  new.Size = new_4
  new.ZIndex = 16
  new_1.CornerRadius = UDim.new(0, 4)
  new_1.Parent = new
  new_2.Parent = new
  new_2.AnchorPoint = Vector2.new(0.5, 0.5)
  new_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  new_2.BackgroundTransparency = 1
  new_2.Position = UDim2.new(0.5, 0, 0.5, 0)
  new_2.Size = UDim2.new(0, 40, 0, 12)
  new_2.ZIndex = 16
  new_2.Font = Enum.Font.GothamBold
  new_2.Text = a1
  new_2.TextColor3 = Color3.fromRGB(255, 255, 255)
  new_2.TextSize = 12
  new_3.Parent = new
  new_3.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
  new_3.BackgroundTransparency = 1
  new_3.BorderSizePixel = 0
  new_3.ClipsDescendants = true
  new_3.Size = UDim2.new(1, 0, 1, 0)
  new_3.ZIndex = 16
  new_3.AutoButtonColor = false
  new_3.Font = Enum.Font.Gotham
  new_3.Text = ""
  new_3.TextColor3 = Color3.fromRGB(255, 255, 255)
  new_3.TextSize = 14
  new_3.MouseButton1Click.Connect(new_3.MouseButton1Click, function()
  l_25(new, mouse.X, mouse.Y)
  a2()
end)
end,
    Toggle = function(a0, a1, a2, a3)
  local new = Instance.new("Frame")
  local new_1 = Instance.new("UICorner")
  local new_2 = Instance.new("TextLabel")
  local new_3 = Instance.new("ImageLabel")
  local new_4 = Instance.new("UICorner")
  local new_5 = Instance.new("ImageLabel")
  local new_6 = Instance.new("UICorner")
  local new_7 = Instance.new("TextButton")
  new.Name = "MainToggle"
  new.Parent = new_5
  local from_r_g_b = Color3.fromRGB(45, 45, 45)
  new.BackgroundColor3 = from_r_g_b
  new.BackgroundTransparency = 0.7
  new.BorderSizePixel = 0
  new.ClipsDescendants = true
  new.Size = UDim2.new(0.975000024, 0, 0, 35)
  new.ZIndex = 16
  new_1.CornerRadius = UDim.new(0, 4)
  new_1.Parent = new
  new_2.Name = "Text"
  new_2.Parent = new
  new_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  new_2.BackgroundTransparency = 1
  new_2.Position = UDim2.new(0, 10, 0, 10)
  new_2.Size = UDim2.new(0, 100, 0, 12)
  new_2.ZIndex = 16
  new_2.Font = Enum.Font.GothamBold
  new_2.Text = a1
  new_2.TextColor3 = Color3.fromRGB(255, 255, 255)
  new_2.TextSize = 10
  new_2.TextTransparency = 0.4
  new_2.TextXAlignment = Enum.TextXAlignment.Left
  new_3.Name = "MainToggle"
  new_3.Parent = new
  new_3.AnchorPoint = Vector2.new(0.5, 0.5)
  new_3.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
  new_3.ClipsDescendants = true
  new_3.Position = UDim2.new(0.899999976, 0, 0.5, 0)
  new_3.Size = UDim2.new(0, 23, 0, 23)
  new_3.ZIndex = 16
  new_4.CornerRadius = UDim.new(0, 3)
  new_4.Parent = new_3
  new_5.Name = "MainToggle"
  new_5.Parent = new_3
  new_5.AnchorPoint = Vector2.new(0.5, 0.5)
  new_5.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
  new_5.ClipsDescendants = true
  new_5.Position = UDim2.new(0.5, 0, 0.5, 0)
  new_5.Size = UDim2.new(0, 0, 0, 0)
  new_5.ZIndex = 16
  new_5.Image = "http://www.roblox.com/asset/?id=6031068421"
  new_5.ImageColor3 = _G.Color
  new_5.Visible = false
  new_6.CornerRadius = UDim.new(0, 3)
  new_6.Parent = new_5
  new_7.Name = ""
  new_7.Parent = new
  new_7.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
  new_7.BackgroundTransparency = 1
  new_7.BorderSizePixel = 0
  new_7.Size = UDim2.new(1, 0, 1, 0)
  new_7.ZIndex = 16
  new_7.AutoButtonColor = false
  new_7.Font = Enum.Font.Gotham
  new_7.Text = ""
  new_7.TextColor3 = Color3.fromRGB(255, 255, 255)
  new_7.TextSize = 14
  local l_4 = {}
  new_7.MouseButton1Click.Connect(new_7.MouseButton1Click, function()
  a2 = not a2
  l_4.Update(l_4, a2)
  l_25(Button, mouse.X, mouse.Y)
end)
  if a2 then
    if a2 then
      new_5.Visible = a2
      local new_8 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
      if not a2 or not 0 then
      end
    end
    service_3.Create(service_3, new_2, new_8, {TextTransparency = 0.4}).Play(service_3.Create(service_3, new_2, new_8, {TextTransparency = 0.4}))
    local new_8 = UDim2.new(0, 25, 0, 25)
    if not a2 or not new_8 then
    end
    service_3.Create(service_3, new_5, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0, 0)}).Play(service_3.Create(service_3, new_5, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0, 0)}))
    service_3.Create(service_3, new_5, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0, 0)}).Completed.Wait(service_3.Create(service_3, new_5, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0, 0)}).Completed)
    if a2 == false then
      new_5.Visible = a2
      a3(a2)
    end
  end
  function l_4.Update(a0, a1)
    if a1 then
      new_5.Visible = a1
      local new = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
      if not a1 or not 0 then
      end
    end
    local create = service_3.Create(service_3, new_2, new, {TextTransparency = 0.4})
    create.Play(create)
    local new = UDim2.new(0, 25, 0, 25)
    if not a1 or not new then
    end
    service_3.Create(service_3, new_5, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0, 0)}).Play(service_3.Create(service_3, new_5, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0, 0)}))
    service_3.Create(service_3, new_5, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0, 0)}).Completed.Wait(service_3.Create(service_3, new_5, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0, 0)}).Completed)
    if a1 == false then
      new_5.Visible = a1
    end
    a3(a1)
    a2 = a1
  end
  return l_4
end,
    Textbox = function(a0, a1, a2, a3)
  local new = Instance.new("Frame")
  local new_1 = Instance.new("UICorner")
  local new_2 = Instance.new("TextLabel")
  local new_3 = Instance.new("Frame")
  local new_4 = Instance.new("UICorner")
  local new_5 = Instance.new("TextBox")
  new.Name = "Textbox"
  new.Parent = new_5
  local from_r_g_b = Color3.fromRGB(45, 45, 45)
  new.BackgroundColor3 = from_r_g_b
  new.BackgroundTransparency = 0.7
  new.BorderSizePixel = 0
  new.ClipsDescendants = true
  new.Size = UDim2.new(0.89, 20, 0, 30)
  new.ZIndex = 16
  new_1.CornerRadius = UDim.new(0, 4)
  new_1.Parent = new
  new_2.Name = "Text"
  new_2.Parent = new
  new_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  new_2.BackgroundTransparency = 1
  new_2.Position = UDim2.new(0, 10, 0, 10)
  new_2.Size = UDim2.new(0, 43, 0, 12)
  new_2.ZIndex = 16
  new_2.Font = Enum.Font.GothamBold
  new_2.Text = a1
  new_2.TextColor3 = Color3.fromRGB(255, 255, 255)
  new_2.TextSize = 11
  new_2.TextXAlignment = Enum.TextXAlignment.Left
  new_3.Name = "TextboxHoler"
  new_3.Parent = new
  new_3.AnchorPoint = Vector2.new(0.5, 0.5)
  new_3.BackgroundColor3 = Color3.fromRGB(13, 13, 15)
  new_3.BackgroundTransparency = 1
  new_3.BorderSizePixel = 0
  new_3.Position = UDim2.new(0.5, 0, 0.5, 13)
  new_3.Size = UDim2.new(0.970000029, 0, 0, 30)
  new_4.CornerRadius = UDim.new(0, 6)
  new_4.Parent = new_3
  new_5.Name = "HeadTitle"
  new_5.Parent = new_3
  new_5.AnchorPoint = Vector2.new(0.5, 0.5)
  new_5.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
  new_5.BackgroundTransparency = 0.7
  new_5.BorderSizePixel = 0.4
  new_5.ClipsDescendants = true
  new_5.Position = UDim2.new(0.74, 0, 0.05, 0)
  new_5.Size = UDim2.new(0, 110, 0, 22)
  new_5.ZIndex = 16
  new_5.Font = Enum.Font.GothamMedium
  new_5.PlaceholderColor3 = Color3.fromRGB(90, 90, 90)
  new_5.PlaceholderText = "type here.."
  new_5.Text = a2
  new_5.TextColor3 = Color3.fromRGB(255, 255, 255)
  new_5.TextSize = 10
  new_5.TextTransparency = 0
  new_5.TextXAlignment = Enum.TextXAlignment.Center
  new_5.FocusLost.Connect(new_5.FocusLost, function()
  a3(new_5.Text)
  if a2 then
    new_5.Text = ""
  end
end)
end,
    Dropdown = function(a0, a1, a2, a3, a4)
  local new = Instance.new("Frame")
  local new_1 = Instance.new("UICorner")
  local new_2 = Instance.new("Frame")
  local new_3 = Instance.new("UICorner")
  local new_4 = Instance.new("TextButton")
  local new_5 = Instance.new("TextLabel")
  local new_6 = Instance.new("ImageButton")
  local new_7 = Instance.new("ScrollingFrame")
  local new_8 = Instance.new("UIListLayout")
  local new_9 = Instance.new("UIPadding")
  new.Name = "MainDropDown"
  new.Parent = new_5
  local from_r_g_b = Color3.fromRGB(45, 45, 45)
  new.BackgroundColor3 = from_r_g_b
  new.BackgroundTransparency = 0.7
  new.BorderSizePixel = 0
  new.ClipsDescendants = true
  new.Size = UDim2.new(0.975000024, 0, 0, 30)
  new.ZIndex = 16
  new_1.CornerRadius = UDim.new(0, 4)
  new_1.Parent = new
  new_2.Name = "MainDropDown"
  new_2.Parent = new
  new_2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
  new_2.BackgroundTransparency = 0.7
  new_2.BorderSizePixel = 0
  new_2.ClipsDescendants = true
  new_2.Size = UDim2.new(1, 0, 0, 30)
  new_2.ZIndex = 16
  new_3.CornerRadius = UDim.new(0, 4)
  new_3.Parent = new_2
  new_4.Name = "v"
  new_4.Parent = new_2
  new_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  new_4.BackgroundTransparency = 1
  new_4.BorderSizePixel = 0
  new_4.Size = UDim2.new(1, 0, 1, 0)
  new_4.ZIndex = 16
  new_4.AutoButtonColor = false
  new_4.Font = Enum.Font.GothamBold
  new_4.Text = ""
  new_4.TextColor3 = Color3.fromRGB(255, 255, 255)
  new_4.TextSize = 12
  function getpro()
    if not a3 then
      return a1 .. " : "
    end
    local find = table.find(a2, a3)
    if find then
      a4(a3)
      return a1 .. " : " .. a3
    end
    return a1 .. " : "
  end
  new_5.Name = "Text"
  new_5.Parent = new_2
  new_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  new_5.BackgroundTransparency = 1
  new_5.Position = UDim2.new(0, 10, 0, 10)
  new_5.Size = UDim2.new(0, 62, 0, 12)
  new_5.ZIndex = 16
  new_5.Font = Enum.Font.GothamBold
  new_5.Text = getpro()
  new_5.TextColor3 = Color3.fromRGB(255, 255, 255)
  new_5.TextSize = 12
  new_5.TextXAlignment = Enum.TextXAlignment.Left
  new_6.Parent = new_2
  new_6.AnchorPoint = Vector2.new(0, 0.5)
  new_6.BackgroundTransparency = 1
  new_6.Position = UDim2.new(1, -25, 0.5, 0)
  new_6.Size = UDim2.new(0, 12, 0, 12)
  new_6.ZIndex = 16
  new_6.Image = "http://www.roblox.com/asset/?id=6282522798"
  new_7.Name = "Scroll_Items"
  new_7.Parent = new
  new_7.Active = true
  new_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  new_7.BackgroundTransparency = 1
  new_7.BorderSizePixel = 0
  new_7.Position = UDim2.new(0, 0, 0, 35)
  new_7.Size = UDim2.new(1, 0, 1, -35)
  new_7.ZIndex = 16
  new_7.CanvasSize = UDim2.new(0, 0, 0, 265)
  new_7.ScrollBarThickness = 0
  new_8.Parent = new_7
  new_8.SortOrder = Enum.SortOrder.LayoutOrder
  new_8.Padding = UDim.new(0, 5)
  new_7.GetPropertyChangedSignal(new_7, "AbsoluteContentSize").Connect(new_7.GetPropertyChangedSignal(new_7, "AbsoluteContentSize"), function()
  local new = UDim2.new(1, 0, 0, new_7.AbsoluteContentSize.Y + 40)
  new_7.CanvasSize = new
end)
  new_9.Parent = new_7
  new_9.PaddingLeft = UDim.new(0, 10)
  new_9.PaddingTop = UDim.new(0, 5)
  local l_16 = false
  local l_5 = {
    TogglePanel = function(a0, a1)
  local new = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
  local new_1 = UDim2.new(0.975000024, 0, 0, 299)
  if not a1 or not new_1 then
  end
  local create = service_3.Create(service_3, new, new, {Size = UDim2.new(0.975000024, 0, 0, 30)})
  create.Play(create)
  if not a1 or not 180 then
  end
  service_3.Create(service_3, new_6, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 0}).Play(service_3.Create(service_3, new_6, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 0}))
end
  }
  new_6.MouseButton1Click.Connect(new_6.MouseButton1Click, function()
  l_16 = not l_16
  l_5.TogglePanel(l_5, l_16)
end)
  new_4.MouseButton1Click.Connect(new_4.MouseButton1Click, function()
  l_16 = not l_16
  l_5.TogglePanel(l_5, l_16)
end)
  function l_5.Clear(a0)
    local l_2, l_3 = new_7.GetChildren(new_7)
    for l_4, l_5 in next do
      for l_4, l_5 in next do
        local a = l_5.IsA(l_5, "TextButton")
        if a then
          l_5.Destroy(l_5)
        end
      end
    end
  end
  function l_5.Add(a0, a1)
    local new = Instance.new("TextButton")
    local new_1 = Instance.new("UICorner")
    new.Name = a1
    new.Parent = new_7
    local from_r_g_b = Color3.fromRGB(25, 25, 25)
    new.BackgroundColor3 = from_r_g_b
    new.BorderSizePixel = 0
    new.ClipsDescendants = true
    new.Size = UDim2.new(1, -10, 0, 20)
    new.ZIndex = 17
    new.AutoButtonColor = false
    new.Font = Enum.Font.GothamBold
    new.Text = a1
    new.TextColor3 = Color3.fromRGB(255, 255, 255)
    new.TextSize = 12
    new_1.CornerRadius = UDim.new(0, 4)
    new_1.Parent = new
    new.MouseButton1Click.Connect(new.MouseButton1Click, function()
  if _x == nil then
    l_16 = false
    l_5.TogglePanel(l_5, l_16)
    a4(a1)
    new_5.Text = a1 .. " : " .. a1
    _x = nil
  end
end)
  end
  for l_20, l_21 in next do
    for l_20, l_21 in next do
      l_5.Add(l_5, l_21)
    end
  end
  return l_5
end,
    MultiDropdown = function(a0, a1, a2, a3, a4)
  local new = Instance.new("Frame")
  local new_1 = Instance.new("UICorner")
  local new_2 = Instance.new("Frame")
  local new_3 = Instance.new("UICorner")
  local new_4 = Instance.new("TextButton")
  local new_5 = Instance.new("TextLabel")
  local new_6 = Instance.new("ImageButton")
  local new_7 = Instance.new("ScrollingFrame")
  local new_8 = Instance.new("UIListLayout")
  local new_9 = Instance.new("UIPadding")
  new.Name = "MainDropDown"
  new.Parent = new_5
  local from_r_g_b = Color3.fromRGB(45, 45, 45)
  new.BackgroundColor3 = from_r_g_b
  new.BackgroundTransparency = 0.7
  new.BorderSizePixel = 0
  new.ClipsDescendants = true
  new.Size = UDim2.new(0.975000024, 0, 0, 30)
  new.ZIndex = 16
  new_1.CornerRadius = UDim.new(0, 4)
  new_1.Parent = new
  new_2.Name = "MainDropDown"
  new_2.Parent = new
  new_2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
  new_2.BackgroundTransparency = 0.7
  new_2.BorderSizePixel = 0
  new_2.ClipsDescendants = true
  new_2.Size = UDim2.new(1, 0, 0, 30)
  new_2.ZIndex = 16
  new_3.CornerRadius = UDim.new(0, 4)
  new_3.Parent = new_2
  new_4.Name = "v"
  new_4.Parent = new_2
  new_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  new_4.BackgroundTransparency = 1
  new_4.BorderSizePixel = 0
  new_4.Size = UDim2.new(1, 0, 1, 0)
  new_4.ZIndex = 16
  new_4.AutoButtonColor = false
  new_4.Font = Enum.Font.GothamBold
  new_4.Text = ""
  new_4.TextColor3 = Color3.fromRGB(255, 255, 255)
  new_4.TextSize = 12
  function getpro()
    if not a3 then
      return a1
    end
  end
  new_5.Name = "Text"
  new_5.Parent = new_2
  new_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  new_5.BackgroundTransparency = 1
  new_5.Position = UDim2.new(0, 10, 0, 10)
  new_5.Size = UDim2.new(0, 62, 0, 12)
  new_5.ZIndex = 16
  new_5.Font = Enum.Font.GothamBold
  new_5.Text = getpro()
  new_5.TextColor3 = Color3.fromRGB(255, 255, 255)
  new_5.TextSize = 12
  new_5.TextXAlignment = Enum.TextXAlignment.Left
  new_6.Parent = new_2
  new_6.AnchorPoint = Vector2.new(0, 0.5)
  new_6.BackgroundTransparency = 1
  new_6.Position = UDim2.new(1, -25, 0.5, 0)
  new_6.Size = UDim2.new(0, 12, 0, 12)
  new_6.ZIndex = 16
  new_6.Image = "http://www.roblox.com/asset/?id=6282522798"
  new_7.Name = "Scroll_Items"
  new_7.Parent = new
  new_7.Active = true
  local from_r_g_b = Color3.fromRGB(255, 255, 255)
  new_7.BackgroundColor3 = from_r_g_b
  new_7.BackgroundTransparency = 1
  new_7.BorderSizePixel = 0
  new_7.Position = UDim2.new(0, 0, 0, 35)
  new_7.Size = UDim2.new(1, 0, 1, -35)
  new_7.ZIndex = 16
  new_7.CanvasSize = UDim2.new(0, 0, 0, 265)
  new_7.ScrollBarThickness = 0
  new_8.Parent = new_7
  new_8.SortOrder = Enum.SortOrder.LayoutOrder
  new_8.Padding = UDim.new(0, 5)
  new_7.GetPropertyChangedSignal(new_7, "AbsoluteContentSize").Connect(new_7.GetPropertyChangedSignal(new_7, "AbsoluteContentSize"), function()
  local new = UDim2.new(1, 0, 0, new_7.AbsoluteContentSize.Y + 40)
  new_7.CanvasSize = new
end)
  new_9.Parent = new_7
  new_9.PaddingLeft = UDim.new(0, 10)
  new_9.PaddingTop = UDim.new(0, 5)
  local l_17 = false
  local l_5 = {
    TogglePanel = function(a0, a1)
  local new = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
  local new_1 = UDim2.new(0.975000024, 0, 0, 200)
  if not a1 or not new_1 then
  end
  local create = service_3.Create(service_3, new, new, {Size = UDim2.new(0.975000024, 0, 0, 30)})
  create.Play(create)
  if not a1 or not 180 then
  end
  service_3.Create(service_3, new_6, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 0}).Play(service_3.Create(service_3, new_6, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 0}))
end
  }
  new_6.MouseButton1Click.Connect(new_6.MouseButton1Click, function()
  l_17 = not l_17
  l_5.TogglePanel(l_5, l_17)
end)
  new_4.MouseButton1Click.Connect(new_4.MouseButton1Click, function()
  l_17 = not l_17
  l_5.TogglePanel(l_5, l_17)
end)
  local l_16 = {}
  function l_5.Add(a0, a1)
    local new = Instance.new("TextButton")
    local new_1 = Instance.new("UICorner")
    new.Name = a1
    new.Parent = new_7
    local from_r_g_b = Color3.fromRGB(25, 25, 25)
    new.BackgroundColor3 = from_r_g_b
    new.BorderSizePixel = 0
    new.ClipsDescendants = true
    new.Size = UDim2.new(1, -10, 0, 20)
    new.ZIndex = 17
    new.AutoButtonColor = false
    new.Font = Enum.Font.GothamBold
    new.Text = a1
    new.TextColor3 = Color3.fromRGB(255, 255, 255)
    new.TextSize = 12
    new_1.CornerRadius = UDim.new(0, 4)
    new_1.Parent = new
    new.MouseButton1Click.Connect(new.MouseButton1Click, function()
  local find = table.find(l_16, a1)
  if not find then
    table.insert(l_16, a1)
    a4(l_16, a1)
    local concat = table.concat(l_16, ", ")
    new_5.Text = a1 .. " : " .. concat
    service_3.Create(service_3, new, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = _G.Color}).Play(service_3.Create(service_3, new, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = _G.Color}))
  else
    local l_1 = service_3
    l_1 = service_3.Create(l_1, new, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = _G.Color})
    service_3.Create(l_1, new, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = _G.Color}).Play(l_1)
    l_1 = l_16
    local l_0, l_1, l_2 = pairs(l_1)
  end
  for new, l_4 in l_0 do
    if l_4 == a1 then
      table.remove(l_16, new)
      local concat = table.concat(l_16, ", ")
      new_5.Text = a1 .. " : " .. concat
    end
    for l_3, l_4 in l_0 do
    end
  end
  a4(l_16, a1)
end)
  end
  function l_5.Clear(a0)
    local l_2, l_3 = new_7.GetChildren(new_7)
    for l_4, l_5 in next do
      for l_4, l_5 in next do
        local a = l_5.IsA(l_5, "TextButton")
        if a then
          l_5.Destroy(l_5)
        end
      end
    end
  end
  for l_21, l_22 in next do
    for l_21, l_22 in next do
      l_5.Add(l_5, l_22)
    end
  end
  return l_5
end,
    Slider = function(a0, a1, a2, a3, a4, a5)
  if not a2 then
    if not a3 and (not a4 and not a5) then
      if 100 < 100 / 2 then
      elseif 100 < 1 then
      end
    end
  end
  local new = Instance.new("Frame")
  local new_1 = Instance.new("UICorner")
  local new_2 = Instance.new("TextLabel")
  local new_3 = Instance.new("TextButton")
  Instance.new("UICorner")
  Instance.new("TextButton")
  Instance.new("UICorner")
  local new_4 = Instance.new("TextButton")
  new.Name = "MainSlider"
  new.Parent = new_5
  local from_r_g_b = Color3.fromRGB(45, 45, 45)
  new.BackgroundColor3 = from_r_g_b
  new.BackgroundTransparency = 0.7
  new.BorderSizePixel = 0
  new.ClipsDescendants = true
  new.Size = UDim2.new(0.975000024, 0, 0, 50)
  new.ZIndex = 16
  new_1.CornerRadius = UDim.new(0, 4)
  new_1.Parent = new
  new_2.Name = "Text"
  new_2.Parent = new
  new_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  new_2.BackgroundTransparency = 1
  new_2.Position = UDim2.new(0, 10, 0, 10)
  new_2.Size = UDim2.new(0, 63, 0, 12)
  new_2.ZIndex = 16
  new_2.Font = Enum.Font.GothamBold
  new_2.Text = a1 .. " : " .. 1
  new_2.TextColor3 = Color3.fromRGB(255, 255, 255)
  new_2.TextSize = 12
  new_2.TextXAlignment = Enum.TextXAlignment.Left
  new_4.Parent = new_3
  new_4.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
  new_4.BackgroundTransparency = 1
  new_4.BorderSizePixel = 0
  new_4.ClipsDescendants = true
  new_4.Position = UDim2.new(0, 0, 0, -8)
  new_4.Size = UDim2.new(1, 5, 1, 18)
  new_4.ZIndex = 16
  new_4.AutoButtonColor = false
  new_4.Font = Enum.Font.Gotham
  new_4.Text = ""
  new_4.TextColor3 = Color3.fromRGB(255, 255, 255)
  new_4.TextSize = 14
  Instance.new("Frame").Name = "SliderValueFrame"
  local new_5 = Vector2.new(0.5, 0.5)
  Instance.new("Frame").AnchorPoint = new_5
  Instance.new("Frame").Size = UDim2.new(0, 197, 0, 4)
  Instance.new("Frame").Position = UDim2.new(0.4857185, 0, 0.7700002, 0)
  Instance.new("Frame").BorderSizePixel = 0
  Instance.new("Frame").BackgroundColor3 = Color3.fromRGB(65, 65, 65)
  Instance.new("Frame").Parent = new
  local new_5 = Instance.new("Frame")
  new_5.Name = "SliderValueFrame"
  local new_6 = UDim2.new(0.5, 0, 0, 4)
  new_5.Size = new_6
  new_5.BorderSizePixel = 0
  new_5.BackgroundColor3 = _G.Color
  new_5.Parent = Instance.new("Frame")
  Instance.new("TextButton").Name = "SliderValueFrame"
  local new_6 = UDim2.new(0, 15, 0, 15)
  Instance.new("TextButton").Size = new_6
  Instance.new("TextButton").Position = UDim2.new(0.5, 0, 0, 0)
  Instance.new("TextButton").BorderSizePixel = 0
  Instance.new("TextButton").BackgroundColor3 = _G.Color
  Instance.new("TextButton").Parent = Instance.new("Frame")
  Instance.new("TextButton").Text = ""
  UICorner_1s2 = Instance.new("UICorner")
  local new_6 = UDim.new(0, 90)
  UICorner_1s2.CornerRadius = new_6
  UICorner_1s2.Parent = Instance.new("TextButton")
  service_1.LocalPlayer.GetMouse(service_1.LocalPlayer)
  local l_8 = 100
  local l_7 = 1
  local l_9 = 1
  local l_10 = function()
end
  local l_21 = false
  Instance.new("TextButton").InputBegan.Connect(Instance.new("TextButton").InputBegan, function(a0)
  if a0.UserInputType == Enum.UserInputType.MouseButton1 then
    l_21 = true
  end
end)
  Instance.new("TextButton").InputEnded.Connect(Instance.new("TextButton").InputEnded, function(a0)
  if a0.UserInputType == Enum.UserInputType.MouseButton1 then
    l_21 = false
  end
end)
  local l_26 = function(a0)
  local clamp = math.clamp((a0.Position.X - Instance.new("TextButton").Parent.AbsolutePosition.X) / Instance.new("TextButton").Parent.AbsoluteSize.X, 0, 1)
  local new = UDim2.new(clamp, 0, 0, -6)
  local clamp = math.clamp((a0.Position.X - Instance.new("TextButton").Parent.AbsolutePosition.X) / Instance.new("TextButton").Parent.AbsoluteSize.X, 0, 1)
  new_5.Size = UDim2.new(clamp, 0, 0, 4)
  UICorner_1s2.Parent.Position = new
  start = math.floor(new.X.Scale * l_8 / l_8 * (l_8 - l_7) + l_7)
  while new.X.Scale * l_8 / l_8 * (l_8 - l_7) + l_7 > 100 do
    if l_8 <= 1000 or 1000 <= l_9 then
      new_2.Text = a1 .. " : " .. start
    elseif 100 <= l_8 or 1000 <= l_7 or 100 <= l_9 then
      new_2.Text = a1 .. " : ..."
    end
    local l_4 = l_10(start)
    if l_4 then
    end
  end
end
  service_2.InputChanged.Connect(service_2.InputChanged, function(a0)
  if l_21 and a0.UserInputType == Enum.UserInputType.MouseMovement then
    l_26(a0)
  end
end)
  if l_9 then
    local l_28 = math
    l_28 = l_28.clamp
    local l_29 = l_9 / l_8
    l_28 = l_28(l_29, 0, 1)
    l_29 = -6
    local new_6 = UDim2.new(l_28, l_29, -1.5, 0)
    Instance.new("TextButton").Position = new_6
    l_28 = UDim2
    l_28 = l_28.new
    if not l_9 then
      l_29 = 0
      l_28 = l_28(l_29 / l_8, 0, 0, 4)
      new_5.Size = l_28
      if 1000 <= l_8 then
        new_2.Text = a1 .. " : ..."
      else
        new_2.Text = a1 .. " : " .. start
      end
    end
    l_10(l_9)
  end
  return {
    Update = function(a0, a1)
  local l_4 = l_9
  local l_5 = l_8
  l_4 = l_4 / l_5
  l_5 = 0
  local clamp = math.clamp(l_4, l_5, 1)
  l_4 = -6
  l_5 = -1.5
  local new = UDim2.new(clamp, l_4, l_5, 0)
  UICorner_1s2.Parent.Position = new
  l_4 = UDim2
  l_4 = l_4.new
  l_5 = l_9
  if not l_5 then
    l_5 = 0
    l_4 = l_4(l_5 / l_8, 0, 0, 4)
    new_5.Size = l_4
    if 1000 <= l_8 then
      new_2.Text = a1 .. " : ..."
    else
      new_2.Text = a1 .. " : " .. start
    end
  end
  l_10(a1)
end
  }
end
  }
end
  }
end
    }
  end
  local tab = l_0.Evil(l_0).Tab(l_0.Evil(l_0), "Home Section", 15557757660)
  local tab_1 = l_0.Evil(l_0).Tab(l_0.Evil(l_0), "Configs Farm", 15557763120)
  local tab_2 = l_0.Evil(l_0).Tab(l_0.Evil(l_0), "Main Farm", 15557766265)
  local tab_3 = l_0.Evil(l_0).Tab(l_0.Evil(l_0), "Items Farm", 15557776256)
  local tab_4 = l_0.Evil(l_0).Tab(l_0.Evil(l_0), "Player Stats", 15557781267)
  local tab_5 = l_0.Evil(l_0).Tab(l_0.Evil(l_0), "Sea Events", 15557785130)
  local tab_6 = l_0.Evil(l_0).Tab(l_0.Evil(l_0), "Race V4", 14477517268)
  local tab_7 = l_0.Evil(l_0).Tab(l_0.Evil(l_0), "Dungeon Raid", 15557831142)
  local tab_8 = l_0.Evil(l_0).Tab(l_0.Evil(l_0), "Island Travel", 15557866616)
  local tab_9 = l_0.Evil(l_0).Tab(l_0.Evil(l_0), "Stores", 15557838230)
  local tab_10 = l_0.Evil(l_0).Tab(l_0.Evil(l_0), "Miscellaneous", 15557842619)
  local craft_page = tab.CraftPage(tab, "Changelog", 1)
  craft_page.changelog(craft_page, "[December, 25 2023 - GIFT EVENT]")
  craft_page.Label(craft_page, "- Teleport Gift Event Isalnd")
  craft_page.Label(craft_page, "- Auto Buy Gift Event Candies")
  craft_page.Label(craft_page, "- Auto Bounty Fix")
  craft_page.Label(craft_page, "- Fixed Some bug issued")
  craft_page.Label(craft_page, "- Fix Auto Sail Boat")
  craft_page.Label(craft_page, "- Fix Auto Collect Amber")
  craft_page.Label(craft_page, "- Fixed Level Auto Farms")
  craft_page.Label(craft_page, "- Fixed Auto Sea Events")
  craft_page.Label(craft_page, "- Improve Functions")
  craft_page.Label(craft_page, "- Fixed Some bug issued")
  craft_page.Label(craft_page, "- Fix Auto Sail Boat")
  craft_page.Label(craft_page, "- Fix Auto Collect Amber")
  craft_page.Label(craft_page, "- Auto Kill Piranha")
  craft_page.Label(craft_page, "- Auto Kill Sea Beast Fully")
  craft_page.Label(craft_page, "- Auto Race V4 Quest")
  craft_page.Label(craft_page, "- New Ui no Lagg")
  craft_page.changelog(craft_page, "[December, 17 2023 - KITSUNE UPDATE]")
  craft_page.Label(craft_page, "- Fixed Level Auto Farms")
  craft_page.Label(craft_page, "- Added Auto Azure")
  craft_page.Label(craft_page, "- Auto Teleport Azure Island")
  craft_page.Label(craft_page, "- Fixed Some bug issued")
  craft_page.changelog(craft_page, "[December, 9 2023 - UPDATE 20]")
  craft_page.Label(craft_page, "- Fixed Level Auto Farms")
  craft_page.Label(craft_page, "- Added Auto Sea Events")
  craft_page.Label(craft_page, "- Improve Functions")
  craft_page.Label(craft_page, "- Fixed Some bug issued")
  craft_page.Label(craft_page, "- Added Auto Sail Boat")
  craft_page.Label(craft_page, "- Improve Security")
  craft_page.Label(craft_page, "- Auto Kill Piranha")
  craft_page.Label(craft_page, "- Auto Kill Leviathan")
  craft_page.Label(craft_page, "- Auto Race V4 Quiz")
  craft_page.Label(craft_page, "- New Ui")
  craft_page.changelog(craft_page, "[November, 5 2023 - UPDATE 20]")
  craft_page.Label(craft_page, "- Fixed Mobs,Bosses Index Farm")
  craft_page.Label(craft_page, "- New Level Farm")
  craft_page.Label(craft_page, "- Improve Farm")
  craft_page.Label(craft_page, "- Fixed Some bug issued")
  craft_page.Label(craft_page, "- Fix All Farm Function")
  craft_page.Label(craft_page, "- Improve Security")
  craft_page.Label(craft_page, "- Fix Lag")
  craft_page.Label(craft_page, "- Fix Ui not Show")
  craft_page.Label(craft_page, "- Fix Kick")
  craft_page.Label(craft_page, "- Fix Auto Rejoin")
  local craft_page_1 = tab.CraftPage(tab, "Status", 2)
  local status = craft_page_1.Status(craft_page_1, "Time")
  function UpdateTime()
    local floor = math.floor(workspace.DistributedGameTime + 0.5)
    local floor_1 = math.floor(floor / 3600)
    local floor_1 = math.floor(floor / 60)
    local floor_1 = math.floor(floor / 1)
    local format = string.format("%02d.%02d.%02d", floor_1 % 24, floor_1 % 60, floor_1 % 60)
    status.Set(status, "Game Time : " .. format)
  end
  spawn(function()
  while r0 do
    UpdateTime()
  end
end)
  local status_1 = craft_page_1.Status(craft_page_1, "Players")
  spawn(function()
  while r0 do
    pcall(function()
  local l_0, players, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      if l_3 == 12 then
        status_1.Set(status_1, "Players :" .. " " .. l_3 .. " " .. "/" .. " " .. "12" .. " " .. "(Max)")
      elseif l_3 == 1 then
        status_1.Set(status_1, "Player :" .. " " .. l_3 .. " " .. "/" .. " " .. "12")
      else
        status_1.Set(status_1, "Players :" .. " " .. l_3 .. " " .. "/" .. " " .. "12")
      end
    end
  end
end)
  end
end)
  local status_2 = craft_page_1.Status(craft_page_1, "Status")
  spawn(function()
  while r0 do
    pcall(function()
  local find_first_child = service_9.FindFirstChild(service_9, "Diablo")
  if find_first_child or service_9.FindFirstChild(service_9, "Deandre") or service_9.FindFirstChild(service_9, "Urban") or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Diablo") or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Deandre") or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Urban") then
    status_2.Set(status_2, "Elite Status : Spawn")
  else
    status_2.Set(status_2, "Elite Status : Not Found")
  end
end)
  end
end)
  local status_3 = craft_page_1.Status(craft_page_1, "Killed")
  spawn(function()
  while r0 do
    pcall(function()
  local len = string.len()
  if len == 88 then
    local invoke_server = service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CakePrinceSpawner")
    local sub = string.sub(invoke_server, 39, 41)
    status_3.Set(status_3, "Dimension Kill : " .. sub)
  elseif string.len() == 87 then
    status_3.Set(status_3, "Dimension Kill : " .. string.sub(service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CakePrinceSpawner"), 39, 40))
  elseif string.len() == 86 then
    status_3.Set(status_3, "Dimension Kill : " .. string.sub(service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CakePrinceSpawner"), 39, 39))
  else
    status_3.Set(status_3, "Dimension Boss Is Spawning")
  end
end)
  end
end)
  spawn(function()
  pcall(function()
  while r0 do
    local find_first_child = game.Workspace._WorldOrigin.Locations.FindFirstChild(game.Workspace._WorldOrigin.Locations, "Mirage Island")
    if find_first_child then
      Mirragecheckq.Set(Mirragecheckq, "Mirage Island Status :  Found")
    end
  end
  Mirragecheckq.Set(Mirragecheckq, "Mirage Island Status : Not Found")
end)
end)
  local status_4 = craft_page_1.Status(craft_page_1, "")
  Mirragecheckq = status_4
  local status_4 = craft_page_1.Status(craft_page_1, "Frozen Island")
  spawn(function()
  pcall(function()
  while r0 do
    local find_first_child = game.Workspace._WorldOrigin.Locations.FindFirstChild(game.Workspace._WorldOrigin.Locations, "Frozen Dimension")
    if find_first_child then
      status_4.Set(status_4, "Frozen Dimension Status : Found")
    end
  end
  status_4.Set(status_4, "Frozen Dimension Status : Not Found")
end)
end)
  local status_5 = craft_page_1.Status(craft_page_1, "Kitsune Island Status : Not Found")
  task.spawn(function()
  while r0 do
    pcall(function()
  local find_first_child = game.Workspace._WorldOrigin.Locations.FindFirstChild(game.Workspace._WorldOrigin.Locations, "Kitsune Island")
  if find_first_child then
    status_5.Set(status_5, "Kitsenu Island Status : Found")
  else
    status_5.Set(status_5, "Kitsenu Island Status : Not Found")
  end
end)
  end
end)
  local status_6 = craft_page_1.Status(craft_page_1, "Third World")
  task.spawn(function()
  while r0 do
    pcall(function()
  if service_8.Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
    status_6.Set(status_6, "Full Moon Status : 100%")
  elseif service_8.Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
    status_6.Set(status_6, "Full Moon Status : 75%")
  elseif service_8.Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709143733" then
    status_6.Set(status_6, "Full Moon Status : 50%")
  elseif service_8.Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709150401" then
    status_6.Set(status_6, "Full Moon Status : 25%")
  elseif service_8.Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149680" then
    status_6.Set(status_6, "Full Moon Status : 15%")
  else
    status_6.Set(status_6, "Wait For Moon")
  end
end)
  end
end)
  local craft_page_2 = tab_1.CraftPage(tab_1, "Farm Misc", 1)
  spawn(function()
  while r0 do
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        if not task.wait() then
        end
        if l_4.ToolTip == SelectWeaponFarm then
          SelectWeaponFarm = l_4.Name
        end
      end
    end
  end
end)
  AutoFarmType = "Above"
  spawn(function()
  while r0 do
    if AutoFarmType == "Above" then
      local new = CFrame.new(0, DisFarm, 0)
      local rad = math.rad(-90)
      local angles = CFrame.Angles(rad, 0, 0)
      Farm_Mode = new * angles
    end
  end
  if AutoFarmType == "Beside" then
  end
end)
  craft_page_2.Dropdown(craft_page_2, "Select Weapon", {"Melee", "Blox Fruit", "Sword", "Gun"}, "Melee", function(a0)
  SelectWeaponFarm = a0
end)
  FastAttackSelected = "0.175 (Default)"
  craft_page_2.Dropdown(craft_page_2, "Fast Attack Delay", {
    "0.100 (Risk)",
    "0.165",
    "0.175 (Default)",
    "0.185",
    "0.200",
    "0.300",
    "0.500",
    "0.700 (Slow)"
  }, "0.175 (Default)", function(a0)
  FastAttackSelected = a0
end)
  DisFarm = 30
  craft_page_2.Textbox(craft_page_2, "Distance Farm", DisFarm, function(a0)
  DisFarm = a0
end)
  spawn(function()
  while r0 do
    if FastAttackSelected == "0.100 (Risk)" then
      FastAttackDelay = 0.1
      if FastAttackSelected == "0.165" then
        FastAttackDelay = 0.165
        if FastAttackSelected == "0.175 (Default)" then
          FastAttackDelay = 0.175
          if FastAttackSelected == "0.185" then
            FastAttackDelay = 0.185
            if FastAttackSelected == "0.200" then
              FastAttackDelay = 0.2
              if FastAttackSelected == "0.300" then
                FastAttackDelay = 0.3
                if FastAttackSelected == "0.500" then
                  FastAttackDelay = 0.5
                end
                if FastAttackSelected == "0.700 (Slow)" then
                end
              end
            end
          end
        end
      end
    end
  end
  FastAttackDelay = 0.7
end)
  local require = require(service_1.LocalPlayer.PlayerScripts.CombatFramework)
  local l_20 = function()
  local l_0 = l_18()
  return l_0.FindFirstChild(l_0, "HumanoidRootPart")
end
  local l_59 = function()
  local getupvalues = debug.getupvalues(require)
  if not getupvalues[2].activeController.blades[1] then
    return
  end
  while r3 ~= r4 do
  end
  return getupvalues[2].activeController.blades[1].Parent
end
  local l_61 = true
  craft_page_2.Toggle(craft_page_2, "Fast Attack 1 (Selected Delay)", true, function(a0)
  l_61 = a0
end)
  local l_60 = function()
  local getupvalues = debug.getupvalues(require)
  for l_5 = 1, 1, 1 do
    local require = require(service_9.CombatFramework.RigLib)
    local l_7 = l_18()
    local l_9, blade_hits, l_11 = pairs(require.getBladeHits(l_7, {}, 60))
    for l_12, l_13 in l_9 do
      for l_12, l_13 in l_9 do
        local find_first_child = l_13.Parent.FindFirstChild(l_13.Parent, "HumanoidRootPart")
        if find_first_child and not {}[l_13.Parent] then
          table.insert({}, l_13.Parent.HumanoidRootPart)
        end
        if 0 < #{} then
          local l_13 = (debug.getupvalue(getupvalues[2].activeController.attack, 5) * 798405 + debug.getupvalue(getupvalues[2].activeController.attack, 4) * 727595) % debug.getupvalue(getupvalues[2].activeController.attack, 6)
          local getupvalue = debug.getupvalue(getupvalues[2].activeController.attack, 6)
          local l_14 = debug.getupvalue(getupvalues[2].activeController.attack, 4) * 798405
          local getupvalue_1 = debug.getupvalue(getupvalues[2].activeController.attack, 5)
          local getupvalue_2 = debug.getupvalue(getupvalues[2].activeController.attack, 4)
          function()
  l_13 = (l_13 * getupvalue + l_14) % 1099511627776
  local floor = math.floor(l_13 / getupvalue)
  getupvalue_1 = floor
  getupvalue_2 = l_13 - getupvalue_1 * getupvalue
end()
          debug.setupvalue(getupvalues[2].activeController.attack, 5, getupvalue_1)
          debug.setupvalue(getupvalues[2].activeController.attack, 6, getupvalue)
          debug.setupvalue(getupvalues[2].activeController.attack, 4, getupvalue_2)
          debug.setupvalue(getupvalues[2].activeController.attack, 7, debug.getupvalue(getupvalues[2].activeController.attack, 7) + 1)
          local l_12 = debug.getupvalue(getupvalues[2].activeController.attack, 7) + 1
          local l_6 = {}
          local l_5 = r5
          pcall(function()
  local l_0 = l_18()
  if l_0.FindFirstChildOfClass(l_0, "Tool") and getupvalues[2].activeController.blades and getupvalues[2].activeController.blades[1] then
    getupvalues[2].activeController.animator.anims.basic[1].Play(getupvalues[2].activeController.animator.anims.basic[1], 0.01, 0.01, 0.01)
    service_9.RigControllerEvent.FireServer()
    local floor = math.floor(l_13 / 1099511627776 * 16777215)
    service_9.Remotes.Validator.FireServer(service_9.Remotes.Validator, floor, l_12)
    service_9.RigControllerEvent.FireServer(service_9.RigControllerEvent, "hit", l_6, l_5, "")
  end
end)
        end
      end
    end
  end
end
  spawn(function()
  while r0 do
    if l_61 then
    end
  end
  local require = require(service_9.Util.CameraShaker)
  require.Stop(require)
  pcall(function()
  while not r0 do
  end
end)
end)
  craft_page_2.Toggle(craft_page_2, "Fast Attack No Delay", MobileFastAttack, function(a0)
  MobileFastAttack = a0
end)
  spawn(function()
  while r0 do
    if MobileFastAttack then
    end
  end
  local require = require(service_9.Util.CameraShaker)
  require.Stop(require)
  pcall(function()
  local getupvalues = getupvalues()
  getupvalues[2].activeController.timeToNextAttack = 0
  getupvalues[2].activeController.attacking = false
  getupvalues[2].activeController.blocking = false
  getupvalues[2].activeController.timeToNextBlock = 0
  getupvalues[2].activeController.increment = 0
  getupvalues[2].activeController.hitboxMagnitude = 100
  getupvalues[2].activeController.focusStart = 0
  getupvalues[2].activeController.humanoid.AutoRotate = 0
  getupvalues[2].activeController.animator.anims.basic[1].Play(getupvalues[2].activeController.animator.anims.basic[1], 0.01, 0.01, 0.01)
end)
end)
  function BringMonster(a0, a1)
    local service = game.GetService(game, "Workspace")
    local l_2, children, l_4 = ipairs()
    for l_5, l_6 in l_2 do
      for l_5, l_6 in l_2 do
        if l_6.Name == a0 then
          local find_first_child = l_6.FindFirstChild(l_6, "Humanoid")
          if find_first_child and 0 < l_6.Humanoid.Health then
            local l_8 = l_20()
            if (l_6.HumanoidRootPart.Position - l_8.Position).Magnitude < tonumber(bringfrec) then
              l_6.HumanoidRootPart.CFrame = a1
              l_6.HumanoidRootPart.CanCollide = false
              l_6.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
              l_6.HumanoidRootPart.Transparency = 1
              if l_6.Humanoid.FindFirstChild(l_6.Humanoid, "Animator") then
                l_6.Humanoid.Animator.Destroy(l_6.Humanoid.Animator)
                sethiddenproperty(service_1.LocalPlayer, "SimulationRadius", math.huge)
              end
            end
          end
        end
      end
    end
  end
  bringfrec = 250
  local l_62 = true
  craft_page_2.Toggle(craft_page_2, "Bring Mob", true, function(a0)
  l_62 = a0
end)
  spawn(function()
  while r0 do
    if l_62 and (LevelFarmQuest or LevelFarmNoQuest) then
      pcall(function()
  BringMonster(Level_Farm_Name, Level_Farm_CFrame)
end)
      if l_62 and Farm_Bone then
        pcall(function()
  BringMonster(Bone_Farm_Name, Bone_Farm_CFrame)
end)
        if l_62 and Farm_Ectoplasm then
          pcall(function()
  BringMonster(Ecto_Farm_Name, Ecto_Farm_CFrame)
end)
          if l_62 and Nearest_Farm then
            pcall(function()
  BringMonster(Nearest_Farm_Name, Nearest_Farm_CFrame)
end)
            if l_62 and (SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm) then
              pcall(function()
  BringMonster(SelectMonster_Farm_Name, SelectMonster_Farm_CFrame)
end)
              if l_62 and Auto_Farm_Material then
                pcall(function()
  BringMonster(Material_Farm_Name, Material_Farm_CFrame)
end)
                if l_62 and (GunMastery_Farm or DevilMastery_Farm) then
                  pcall(function()
  BringMonster(Mastery_Farm_Name, Mastery_Farm_CFrame)
end)
                  if l_62 and AutoRengoku then
                    pcall(function()
  BringMonster(Rengoku_Farm_Name, Rengoku_Farm_CFrame)
end)
                    if l_62 and AutoCakePrince then
                      pcall(function()
  BringMonster(CakePrince_Farm_Name, CakePrince_Farm_CFrame)
end)
                      if l_62 and _G.AutoDoughKing then
                        pcall(function()
  BringMonster(DoughKing_Farm_Name, DoughKing_Farm_CFrame)
end)
                        if l_62 and AutoCitizen then
                          pcall(function()
  BringMonster(Citizen_Farm_Name, Citizen_Farm_CFrame)
end)
                          if l_62 and AutoEvoRace then
                            pcall(function()
  BringMonster(EvoV2_Farm_Name, EvoV2_Farm_CFrame)
end)
                            if l_62 and AutoBartilo then
                              pcall(function()
  BringMonster(Bartilo_Farm_Name, Bartilo_Farm_CFrame)
end)
                              if l_62 and AutoSoulGuitar then
                                pcall(function()
  BringMonster(SoulGuitar_Farm_Name, SoulGuitar_Farm_CFrame)
end)
                                if l_62 and AutoMusketeer then
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  pcall(function()
  BringMonster(Musketere_Farm_Name, Musketere_Farm_CFrame)
end)
end)
  local l_63 = true
  craft_page_2.Toggle(craft_page_2, "Bypass Teleport", true, function(a0)
  l_63 = a0
end)
  local l_64 = true
  craft_page_2.Toggle(craft_page_2, "Set Spawn Point", true, function(a0)
  l_64 = a0
end)
  spawn(function()
  while r0 do
    if l_64 then
    end
  end
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "SetSpawnPoint")
end)
  local craft_page_3 = tab_1.CraftPage(tab_1, "Mobs Misc", 2)
  local l_66 = true
  craft_page_3.Toggle(craft_page_3, "Buso Haki", true, function(a0)
  l_66 = a0
end)
  spawn(function()
  while r0 do
    local l_0 = l_18()
    if l_66 and not l_0.FindFirstChild(l_0, "HasBuso") then
    end
  end
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "Buso")
end)
  craft_page_3.Toggle(craft_page_3, "Disable Audio Effect", DeleteAudioEffect, function(a0)
  DeleteAudioEffect = a0
end)
  spawn(function()
  while r0 do
    if DeleteAudioEffect then
      local service = game.GetService(game, "Workspace")
      local l_0, children, l_2 = pairs()
    elseif not task.wait() then
    end
  end
  for l_3, l_4 in task.wait() do
    if l_4.Name == "Sounds" then
      local l_5, children_1, l_7 = pairs()
      for l_8, l_9 in l_5 do
        for l_8, l_9 in l_5 do
          local a = l_9.IsA(l_9, "Part")
          if a then
            l_9.Destroy(l_9)
          end
          if l_4.Name == "CurvedRing" or l_4.Name == "SlashHit" or l_4.Name == "SwordSlash" or l_4.Name == "SlashTail" then
            l_4.Destroy(l_4)
          end
          for l_3, l_4 in task.wait() do
          end
        end
      end
    end
    for l_3, l_4 in task.wait() do
    end
  end
end)
  craft_page_3.Toggle(craft_page_3, "Hide Notification", HideNotification, function(a0)
  HideNotification = a0
end)
  spawn(function()
  while r0 do
    if HideNotification then
      service_1.LocalPlayer.PlayerGui.Notifications.Enabled = false
    end
  end
  service_1.LocalPlayer.PlayerGui.Notifications.Enabled = true
end)
  craft_page_3.Button(craft_page_3, "Destroy Effect Animation", function()
  service_9.Assets.Models.Destroy(service_9.Assets.Models)
  service_9.Assets.GUI.Destroy(service_9.Assets.GUI)
  service_9.Assets.SlashHit.Destroy(service_9.Assets.SlashHit)
  local l_0, children, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      l_4.Destroy(l_4)
    end
  end
  local l_0, children, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      l_4.Destroy(l_4)
    end
  end
end)
  local craft_page_4 = tab_1.CraftPage(tab_1, "Skill Settings", 2)
  _G.SkillZ = true
  craft_page_4.Toggle(craft_page_4, "Use Skill Z", _G.SkillZ, function(a0)
  _G.SkillZ = a0
end)
  _G.SkillX = true
  craft_page_4.Toggle(craft_page_4, "Use Skill X", _G.SkillX, function(a0)
  _G.SkillX = a0
end)
  _G.SkillC = true
  craft_page_4.Toggle(craft_page_4, "Use Skill C", _G.SkillC, function(a0)
  _G.SkillC = a0
end)
  _G.SkillV = true
  craft_page_4.Toggle(craft_page_4, "Use Skill V", _G.SkillV, function(a0)
  _G.SkillV = a0
end)
  _G.SkillF = true
  craft_page_4.Toggle(craft_page_4, "Use Skill F", _G.SkillF, function(a0)
  _G.SkillF = a0
end)
  local find_first_child = service_1.LocalPlayer.PlayerGui.Main.FindFirstChild(service_1.LocalPlayer.PlayerGui.Main, "ChooseTeam")
  if find_first_child then
    while find_first_child == true do
      if _G.Team == "Pirate" then
        local l_68, getconnections, l_70 = pairs()
        for l_71, l_72 in l_68 do
          for l_71, l_72 in l_68 do
            while l_0 do
            end
            for new_1, new_1 in l_25 do
            end
            task.wait()
            if service_1.LocalPlayer.PlayerGui.WaitForChild(service_1.LocalPlayer.PlayerGui, "Main").ChooseTeam.Visible == true then
              l_72.Function()
            end
            if service_1.LocalPlayer.Team ~= nil then
              if game.IsLoaded(game) then
                First_Sea = false
                Second_Sea = false
                Third_Sea = false
                if game.PlaceId == 2753915549 then
                  First_Sea = true
                elseif game.PlaceId == 4442272183 then
                  Second_Sea = true
                elseif game.PlaceId == 7449423635 then
                  Third_Sea = true
                end
              else
                if _G.Team == "Marine" then
                  local l_68, getconnections, l_70 = pairs()
                  for l_71, l_72 in l_68 do
                    for l_71, l_72 in l_68 do
                      while l_0 do
                      end
                      for l_28, l_29 in l_25 do
                      end
                      l_72.Function()
                    end
                  end
                  local l_68, getconnections, l_70 = pairs()
                end
                for l_71, l_72 in l_68 do
                  while l_0 do
                  end
                  for l_28, l_29 in l_25 do
                  end
                  l_72.Function()
                  for l_71, l_72 in l_68 do
                  end
                end
              end
            else
              for l_71, l_72 in l_68 do
              end
            end
          end
        end
      end
      for l_71, l_72 in l_68 do
      end
    end
  end
end
for l_71, l_72 in l_68 do
end

function CheckLevel()
  if First_Sea then
    if service_1.LocalPlayer.Data.Level.Value == 1 or service_1.LocalPlayer.Data.Level.Value <= 9 or _G.SelectMonster == "Bandit [Lv. 5]" then
      Ms = "Bandit"
      NameQuest = "BanditQuest1"
      QuestLv = 1
      NameMon = "Bandit"
      local new = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875)
      CFrameQ = new
      CFrameMon = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)
    elseif service_1.LocalPlayer.Data.Level.Value == 10 or service_1.LocalPlayer.Data.Level.Value <= 14 or _G.SelectMonster == "Monkey [Lv. 14]" then
      Ms = "Monkey"
      NameQuest = "JungleQuest"
      QuestLv = 1
      NameMon = "Monkey"
      CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
      CFrameMon = CFrame.new(-1448.1446533203, 50.851993560791, 63.60718536377)
    elseif service_1.LocalPlayer.Data.Level.Value == 15 or service_1.LocalPlayer.Data.Level.Value <= 29 or _G.SelectMonster == "Gorilla [Lv. 20]" then
      Ms = "Gorilla"
      NameQuest = "JungleQuest"
      QuestLv = 2
      NameMon = "Gorilla"
      CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
      CFrameMon = CFrame.new(-1142.6488037109, 40.462348937988, -515.39227294922)
    elseif service_1.LocalPlayer.Data.Level.Value == 30 or service_1.LocalPlayer.Data.Level.Value <= 39 or _G.SelectMonster == "Pirate [Lv. 35]" then
      Ms = "Pirate"
      NameQuest = "BuggyQuest1"
      QuestLv = 1
      NameMon = "Pirate"
      CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
      CFrameMon = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875)
    elseif service_1.LocalPlayer.Data.Level.Value == 40 or service_1.LocalPlayer.Data.Level.Value <= 59 or _G.SelectMonster == "Brute [Lv. 45]" then
      Ms = "Brute"
      NameQuest = "BuggyQuest1"
      QuestLv = 2
      NameMon = "Brute"
      CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
      CFrameMon = CFrame.new(-1387.5324707031, 24.592035293579, 4100.9575195313)
    elseif service_1.LocalPlayer.Data.Level.Value == 60 or service_1.LocalPlayer.Data.Level.Value <= 74 or _G.SelectMonster == "Desert Bandit [Lv. 60]" then
      Ms = "Desert Bandit"
      NameQuest = "DesertQuest"
      QuestLv = 1
      NameMon = "Desert Bandit"
      CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
      CFrameMon = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)
    elseif service_1.LocalPlayer.Data.Level.Value == 75 or service_1.LocalPlayer.Data.Level.Value <= 89 or _G.SelectMonster == "Desert Officer [Lv. 70]" then
      Ms = "Desert Officer"
      NameQuest = "DesertQuest"
      QuestLv = 2
      NameMon = "Desert Officer"
      CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
      CFrameMon = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)
    elseif service_1.LocalPlayer.Data.Level.Value == 90 or service_1.LocalPlayer.Data.Level.Value <= 99 or _G.SelectMonster == "Snow Bandit [Lv. 90]" then
      Ms = "Snow Bandit"
      NameQuest = "SnowQuest"
      QuestLv = 1
      NameMon = "Snow Bandit"
      CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
      CFrameMon = CFrame.new(1356.3028564453, 105.76865386963, -1328.2418212891)
    elseif service_1.LocalPlayer.Data.Level.Value == 100 or service_1.LocalPlayer.Data.Level.Value <= 119 or _G.SelectMonster == "Snowman [Lv. 100]" then
      Ms = "Snowman"
      NameQuest = "SnowQuest"
      QuestLv = 2
      NameMon = "Snowman"
      CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
      CFrameMon = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
    elseif service_1.LocalPlayer.Data.Level.Value == 120 or service_1.LocalPlayer.Data.Level.Value <= 149 or _G.SelectMonster == "Chief Petty Officer [Lv. 120]" then
      Ms = "Chief Petty Officer"
      NameQuest = "MarineQuest2"
      QuestLv = 1
      NameMon = "Chief Petty Officer"
      CFrameQ = CFrame.new(-5035.49609375, 28.677835464478, 4324.1840820313)
      CFrameMon = CFrame.new(-4931.1552734375, 65.793113708496, 4121.8393554688)
    elseif service_1.LocalPlayer.Data.Level.Value == 150 or service_1.LocalPlayer.Data.Level.Value <= 174 or _G.SelectMonster == "Sky Bandit [Lv. 150]" then
      Ms = "Sky Bandit"
      NameQuest = "SkyQuest"
      QuestLv = 1
      NameMon = "Sky Bandit"
      CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
      CFrameMon = CFrame.new(-4955.6411132813, 365.46365356445, -2908.1865234375)
    elseif service_1.LocalPlayer.Data.Level.Value == 175 or service_1.LocalPlayer.Data.Level.Value <= 189 or _G.SelectMonster == "Dark Master [Lv. 175]" then
      Ms = "Dark Master"
      NameQuest = "SkyQuest"
      QuestLv = 2
      NameMon = "Dark Master"
      CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
      CFrameMon = CFrame.new(-5148.1650390625, 439.04571533203, -2332.9611816406)
    elseif service_1.LocalPlayer.Data.Level.Value == 190 or service_1.LocalPlayer.Data.Level.Value <= 209 or _G.SelectMonster == "Prisoner [Lv. 190]" then
      Ms = "Prisoner"
      NameQuest = "PrisonerQuest"
      QuestLv = 1
      NameMon = "Prisoner"
      CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
      CFrameMon = CFrame.new(4937.31885, 0.332031399, 649.574524, 0.694649816, 0, -0.719348073, 0, 1, 0, 0.719348073, 0, 0.694649816)
    elseif service_1.LocalPlayer.Data.Level.Value == 210 or service_1.LocalPlayer.Data.Level.Value <= 249 or _G.SelectMonster == "Dangerous Prisoner [Lv. 210]" then
      Ms = "Dangerous Prisoner"
      NameQuest = "PrisonerQuest"
      QuestLv = 2
      NameMon = "Dangerous Prisoner"
      CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
      CFrameMon = CFrame.new(5099.6626, 0.351562679, 1055.7583, 0.898906827, 0, -0.438139856, 0, 1, 0, 0.438139856, 0, 0.898906827)
    elseif service_1.LocalPlayer.Data.Level.Value == 250 or service_1.LocalPlayer.Data.Level.Value <= 274 or _G.SelectMonster == "Toga Warrior [Lv. 250]" then
      Ms = "Toga Warrior"
      NameQuest = "ColosseumQuest"
      QuestLv = 1
      NameMon = "Toga Warrior"
      CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
      CFrameMon = CFrame.new(-1872.5166015625, 49.080215454102, -2913.810546875)
    elseif service_1.LocalPlayer.Data.Level.Value == 275 or service_1.LocalPlayer.Data.Level.Value <= 299 or _G.SelectMonster == "Gladiator [Lv. 275]" then
      Ms = "Gladiator"
      NameQuest = "ColosseumQuest"
      QuestLv = 2
      NameMon = "Gladiator"
      CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
      CFrameMon = CFrame.new(-1521.3740234375, 81.203170776367, -3066.3139648438)
    elseif service_1.LocalPlayer.Data.Level.Value == 300 or service_1.LocalPlayer.Data.Level.Value <= 324 or _G.SelectMonster == "Military Soldier [Lv. 300]" then
      Ms = "Military Soldier"
      NameQuest = "MagmaQuest"
      QuestLv = 1
      NameMon = "Military Soldier"
      CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
      CFrameMon = CFrame.new(-5369.0004882813, 61.24352645874, 8556.4921875)
    elseif service_1.LocalPlayer.Data.Level.Value == 325 or service_1.LocalPlayer.Data.Level.Value <= 374 or _G.SelectMonster == "Military Spy [Lv. 325]" then
      Ms = "Military Spy"
      NameQuest = "MagmaQuest"
      QuestLv = 2
      NameMon = "Military Spy"
      CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
      CFrameMon = CFrame.new(-5787.00293, 75.8262634, 8651.69922, 0.838590562, 0, -0.544762194, 0, 1, 0, 0.544762194, 0, 0.838590562)
    elseif service_1.LocalPlayer.Data.Level.Value == 375 or service_1.LocalPlayer.Data.Level.Value <= 399 or _G.SelectMonster == "Fishman Warrior [Lv. 375]" then
      Ms = "Fishman Warrior"
      NameQuest = "FishmanQuest"
      QuestLv = 1
      NameMon = "Fishman Warrior"
      CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
      CFrameMon = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)
      if LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm then
        local l_2 = l_20()
        if 3000 < (CFrameMon.Position - l_2.Position).Magnitude then
          service_9.Remotes.CommF_.InvokeServer()
        end
        if Second_Sea then
          if service_1.LocalPlayer.Data.Level.Value == 700 or service_1.LocalPlayer.Data.Level.Value <= 724 or _G.SelectMonster == "Raider [Lv. 700]" then
            Ms = "Raider"
            NameQuest = "Area1Quest"
            QuestLv = 1
            NameMon = "Raider"
            CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
            CFrameMon = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688)
          elseif service_1.LocalPlayer.Data.Level.Value == 725 or service_1.LocalPlayer.Data.Level.Value <= 774 or _G.SelectMonster == "Mercenary [Lv. 725]" then
            Ms = "Mercenary"
            NameQuest = "Area1Quest"
            QuestLv = 2
            NameMon = "Mercenary"
            CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
            CFrameMon = CFrame.new(-864.85009765625, 122.47104644775, 1453.1505126953)
          elseif service_1.LocalPlayer.Data.Level.Value == 775 or service_1.LocalPlayer.Data.Level.Value <= 799 or _G.SelectMonster == "Swan Pirate [Lv. 775]" then
            Ms = "Swan Pirate"
            NameQuest = "Area2Quest"
            QuestLv = 1
            NameMon = "Swan Pirate"
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
            CFrameMon = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125)
          elseif service_1.LocalPlayer.Data.Level.Value == 800 or service_1.LocalPlayer.Data.Level.Value <= 874 or _G.SelectMonster == "Factory Staff [Lv. 800]" then
            Ms = "Factory Staff"
            NameQuest = "Area2Quest"
            QuestLv = 2
            NameMon = "Factory Staff"
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
            CFrameMon = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797)
          elseif service_1.LocalPlayer.Data.Level.Value == 875 or service_1.LocalPlayer.Data.Level.Value <= 899 or _G.SelectMonster == "Marine Lieutenant [Lv. 875]" then
            Ms = "Marine Lieutenant"
            NameQuest = "MarineQuest3"
            QuestLv = 1
            NameMon = "Marine Lieutenant"
            CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
            CFrameMon = CFrame.new(-2489.2622070313, 84.613594055176, -3151.8830566406)
          elseif service_1.LocalPlayer.Data.Level.Value == 900 or service_1.LocalPlayer.Data.Level.Value <= 949 or _G.SelectMonster == "Marine Captain [Lv. 900]" then
            Ms = "Marine Captain"
            NameQuest = "MarineQuest3"
            QuestLv = 2
            NameMon = "Marine Captain"
            CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
            CFrameMon = CFrame.new(-2335.2026367188, 79.786659240723, -3245.8674316406)
          elseif service_1.LocalPlayer.Data.Level.Value == 950 or service_1.LocalPlayer.Data.Level.Value <= 974 or _G.SelectMonster == "Zombie [Lv. 950]" then
            Ms = "Zombie"
            NameQuest = "ZombieQuest"
            QuestLv = 1
            NameMon = "Zombie"
            CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
            CFrameMon = CFrame.new(-5536.4970703125, 101.08577728271, -835.59075927734)
          elseif service_1.LocalPlayer.Data.Level.Value == 975 or service_1.LocalPlayer.Data.Level.Value <= 999 or _G.SelectMonster == "Vampire [Lv. 975]" then
            Ms = "Vampire"
            NameQuest = "ZombieQuest"
            QuestLv = 2
            NameMon = "Vampire"
            CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
            CFrameMon = CFrame.new(-5806.1098632813, 16.722528457642, -1164.4384765625)
          elseif service_1.LocalPlayer.Data.Level.Value == 1000 or service_1.LocalPlayer.Data.Level.Value <= 1049 or _G.SelectMonster == "Snow Trooper [Lv. 1000]" then
            Ms = "Snow Trooper"
            NameQuest = "SnowMountainQuest"
            QuestLv = 1
            NameMon = "Snow Trooper"
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
            CFrameMon = CFrame.new(535.21051025391, 432.74209594727, -5484.9165039063)
          elseif service_1.LocalPlayer.Data.Level.Value == 1050 or service_1.LocalPlayer.Data.Level.Value <= 1099 or _G.SelectMonster == "Winter Warrior [Lv. 1050]" then
            Ms = "Winter Warrior"
            NameQuest = "SnowMountainQuest"
            QuestLv = 2
            NameMon = "Winter Warrior"
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
            CFrameMon = CFrame.new(1234.4449462891, 456.95419311523, -5174.130859375)
          elseif service_1.LocalPlayer.Data.Level.Value == 1100 or service_1.LocalPlayer.Data.Level.Value <= 1124 or _G.SelectMonster == "Lab Subordinate [Lv. 1100]" then
            Ms = "Lab Subordinate"
            NameQuest = "IceSideQuest"
            QuestLv = 1
            NameMon = "Lab Subordinate"
            CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
            CFrameMon = CFrame.new(-5720.5576171875, 63.309471130371, -4784.6103515625)
          elseif service_1.LocalPlayer.Data.Level.Value == 1125 or service_1.LocalPlayer.Data.Level.Value <= 1174 or _G.SelectMonster == "Horned Warrior [Lv. 1125]" then
            Ms = "Horned Warrior"
            NameQuest = "IceSideQuest"
            QuestLv = 2
            NameMon = "Horned Warrior"
            CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
            CFrameMon = CFrame.new(-6292.751953125, 91.181983947754, -5502.6499023438)
          elseif service_1.LocalPlayer.Data.Level.Value == 1175 or service_1.LocalPlayer.Data.Level.Value <= 1199 or _G.SelectMonster == "Magma Ninja [Lv. 1175]" then
            Ms = "Magma Ninja"
            NameQuest = "FireSideQuest"
            QuestLv = 1
            NameMon = "Magma Ninja"
            CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameMon = CFrame.new(-5461.8388671875, 130.36347961426, -5836.4702148438)
          elseif service_1.LocalPlayer.Data.Level.Value == 1200 or service_1.LocalPlayer.Data.Level.Value <= 1249 or _G.SelectMonster == "Lava Pirate [Lv. 1200]" then
            Ms = "Lava Pirate"
            NameQuest = "FireSideQuest"
            QuestLv = 2
            NameMon = "Lava Pirate"
            CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameMon = CFrame.new(-5251.1889648438, 55.164535522461, -4774.4096679688)
          elseif service_1.LocalPlayer.Data.Level.Value == 1250 or service_1.LocalPlayer.Data.Level.Value <= 1274 or _G.SelectMonster == "Ship Deckhand [Lv. 1250]" then
            Ms = "Ship Deckhand"
            NameQuest = "ShipQuest1"
            QuestLv = 1
            NameMon = "Ship Deckhand"
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
            if LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm then
              if 20000 < (CFrameMon.Position - l_20().Position).Magnitude then
                service_9.Remotes.CommF_.InvokeServer()
              end
              if Third_Sea then
                if service_1.LocalPlayer.Data.Level.Value == 1500 or service_1.LocalPlayer.Data.Level.Value <= 1524 or _G.SelectMonster == "Pirate Millionaire [Lv. 1500]" then
                  Ms = "Pirate Millionaire"
                  NameQuest = "PiratePortQuest"
                  QuestLv = 1
                  NameMon = "Pirate Millionaire"
                  CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
                  CFrameMon = CFrame.new(-435.68109130859, 189.69866943359, 5551.0756835938)
                elseif service_1.LocalPlayer.Data.Level.Value == 1525 or service_1.LocalPlayer.Data.Level.Value <= 1574 or _G.SelectMonster == "Pistol Billionaire [Lv. 1525]" then
                  Ms = "Pistol Billionaire"
                  NameQuest = "PiratePortQuest"
                  QuestLv = 2
                  NameMon = "Pistol Billionaire"
                  CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
                  CFrameMon = CFrame.new(-236.53652954102, 217.46676635742, 6006.0883789063)
                elseif service_1.LocalPlayer.Data.Level.Value == 1575 or service_1.LocalPlayer.Data.Level.Value <= 1599 or _G.SelectMonster == "Dragon Crew Warrior [Lv. 1575]" then
                  Ms = "Dragon Crew Warrior"
                  NameQuest = "AmazonQuest"
                  QuestLv = 1
                  NameMon = "Dragon Crew Warrior"
                  CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
                  CFrameMon = CFrame.new(6301.9975585938, 104.77153015137, -1082.6075439453)
                elseif service_1.LocalPlayer.Data.Level.Value == 1600 or service_1.LocalPlayer.Data.Level.Value <= 1624 or _G.SelectMonster == "Dragon Crew Archer [Lv. 1600]" then
                  Ms = "Dragon Crew Archer"
                  NameQuest = "AmazonQuest"
                  QuestLv = 2
                  NameMon = "Dragon Crew Archer"
                  CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
                  CFrameMon = CFrame.new(6831.1171875, 441.76708984375, 446.58615112305)
                elseif service_1.LocalPlayer.Data.Level.Value == 1625 or service_1.LocalPlayer.Data.Level.Value <= 1649 or _G.SelectMonster == "Female Islander [Lv. 1625]" then
                  Ms = "Female Islander"
                  NameQuest = "AmazonQuest2"
                  QuestLv = 1
                  NameMon = "Female Islander"
                  CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
                  CFrameMon = CFrame.new(5792.5166015625, 848.14392089844, 1084.1818847656)
                elseif service_1.LocalPlayer.Data.Level.Value == 1650 or service_1.LocalPlayer.Data.Level.Value <= 1699 or _G.SelectMonster == "Giant Islander [Lv. 1650]" then
                  Ms = "Giant Islander"
                  NameQuest = "AmazonQuest2"
                  QuestLv = 2
                  NameMon = "Giant Islander"
                  CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
                  CFrameMon = CFrame.new(5009.5068359375, 664.11071777344, -40.960144042969)
                elseif service_1.LocalPlayer.Data.Level.Value == 1700 or service_1.LocalPlayer.Data.Level.Value <= 1724 or _G.SelectMonster == "Marine Commodore [Lv. 1700]" then
                  Ms = "Marine Commodore"
                  NameQuest = "MarineTreeIsland"
                  QuestLv = 1
                  NameMon = "Marine Commodore"
                  CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
                  CFrameMon = CFrame.new(2198.0063476563, 128.71075439453, -7109.5043945313)
                elseif service_1.LocalPlayer.Data.Level.Value == 1725 or service_1.LocalPlayer.Data.Level.Value <= 1774 or _G.SelectMonster == "Marine Rear Admiral [Lv. 1725]" then
                  Ms = "Marine Rear Admiral"
                  NameQuest = "MarineTreeIsland"
                  QuestLv = 2
                  NameMon = "Marine Rear Admiral"
                  CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
                  CFrameMon = CFrame.new(3294.3142089844, 385.41125488281, -7048.6342773438)
                elseif service_1.LocalPlayer.Data.Level.Value == 1775 or service_1.LocalPlayer.Data.Level.Value <= 1799 or _G.SelectMonster == "Fishman Raider [Lv. 1775]" then
                  Ms = "Fishman Raider"
                  NameQuest = "DeepForestIsland3"
                  QuestLv = 1
                  NameMon = "Fishman Raider"
                  CFrameQ = CFrame.new(-10582.759765625, 331.78845214844, -8757.666015625)
                  CFrameMon = CFrame.new(-10553.268554688, 521.38439941406, -8176.9458007813)
                elseif service_1.LocalPlayer.Data.Level.Value == 1800 or service_1.LocalPlayer.Data.Level.Value <= 1824 or _G.SelectMonster == "Fishman Captain [Lv. 1800]" then
                  Ms = "Fishman Captain"
                  NameQuest = "DeepForestIsland3"
                  QuestLv = 2
                  NameMon = "Fishman Captain"
                  CFrameQ = CFrame.new(-10583.099609375, 331.78845214844, -8759.4638671875)
                  CFrameMon = CFrame.new(-10789.401367188, 427.18637084961, -9131.4423828125)
                elseif service_1.LocalPlayer.Data.Level.Value == 1825 or service_1.LocalPlayer.Data.Level.Value <= 1849 or _G.SelectMonster == "Forest Pirate [Lv. 1825]" then
                  Ms = "Forest Pirate"
                  NameQuest = "DeepForestIsland"
                  QuestLv = 1
                  NameMon = "Forest Pirate"
                  CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
                  CFrameMon = CFrame.new(-13489.397460938, 400.30349731445, -7770.251953125)
                elseif service_1.LocalPlayer.Data.Level.Value == 1850 or service_1.LocalPlayer.Data.Level.Value <= 1899 or _G.SelectMonster == "Mythological Pirate [Lv. 1850]" then
                  Ms = "Mythological Pirate"
                  NameQuest = "DeepForestIsland"
                  QuestLv = 2
                  NameMon = "Mythological Pirate"
                  CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
                  CFrameMon = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)
                elseif service_1.LocalPlayer.Data.Level.Value == 1900 or service_1.LocalPlayer.Data.Level.Value <= 1924 or _G.SelectMonster == "Jungle Pirate [Lv. 1900]" then
                  Ms = "Jungle Pirate"
                  NameQuest = "DeepForestIsland2"
                  QuestLv = 1
                  NameMon = "Jungle Pirate"
                  CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
                  CFrameMon = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313)
                elseif service_1.LocalPlayer.Data.Level.Value == 1925 or service_1.LocalPlayer.Data.Level.Value <= 1974 or _G.SelectMonster == "Musketeer Pirate [Lv. 1925]" then
                  Ms = "Musketeer Pirate"
                  NameQuest = "DeepForestIsland2"
                  QuestLv = 2
                  NameMon = "Musketeer Pirate"
                  CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
                  CFrameMon = CFrame.new(-13291.5078125, 520.47338867188, -9904.638671875)
                elseif service_1.LocalPlayer.Data.Level.Value == 1975 or service_1.LocalPlayer.Data.Level.Value <= 1999 or _G.SelectMonster == "Reborn Skeleton [Lv. 1975]" then
                  Ms = "Reborn Skeleton"
                  NameQuest = "HauntedQuest1"
                  QuestLv = 1
                  NameMon = "Reborn Skeleton"
                  CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 0.0000000452954225, -0.999978542, 0.0000000204920472, 1, 0.0000000451620679, 0.999978542, -0.0000000201955679, -0.00655503059)
                  CFrameMon = CFrame.new(-8761.77148, 183.431747, 6168.33301, 0.978073597, -0.000013950732, -0.208259016, -0.00000108073925, 1, -0.0000720630269, 0.208259016, 0.0000707080399, 0.978073597)
                elseif service_1.LocalPlayer.Data.Level.Value == 2000 or service_1.LocalPlayer.Data.Level.Value <= 2024 or _G.SelectMonster == "Living Zombie [Lv. 2000]" then
                  Ms = "Living Zombie"
                  NameQuest = "HauntedQuest1"
                  QuestLv = 2
                  NameMon = "Living Zombie"
                  CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 0.0000000452954225, -0.999978542, 0.0000000204920472, 1, 0.0000000451620679, 0.999978542, -0.0000000201955679, -0.00655503059)
                  CFrameMon = CFrame.new(-10103.7529, 238.565979, 6179.75977, 0.999474227, 0.0000000277547141, 0.0324240364, -0.0000000258006327, 1, -0.0000000606848474, -0.0324240364, 0.0000000598163865, 0.999474227)
                elseif service_1.LocalPlayer.Data.Level.Value == 2025 or service_1.LocalPlayer.Data.Level.Value <= 2049 or _G.SelectMonster == "Demonic Soul [Lv. 2025]" then
                  Ms = "Demonic Soul"
                  NameQuest = "HauntedQuest2"
                  QuestLv = 1
                  NameMon = "Demonic Soul"
                  CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
                  CFrameMon = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)
                elseif service_1.LocalPlayer.Data.Level.Value == 2050 or service_1.LocalPlayer.Data.Level.Value <= 2074 or _G.SelectMonster == "Posessed Mummy [Lv. 2050]" then
                  Ms = "Posessed Mummy"
                  NameQuest = "HauntedQuest2"
                  QuestLv = 2
                  NameMon = "Posessed Mummy"
                  CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
                  CFrameMon = CFrame.new(-9545.7763671875, 69.619895935059, 6339.5615234375)
                elseif service_1.LocalPlayer.Data.Level.Value == 2075 or service_1.LocalPlayer.Data.Level.Value <= 2099 or _G.SelectMonster == "Peanut Scout [Lv. 2075]" then
                  Ms = "Peanut Scout"
                  NameQuest = "NutsIslandQuest"
                  QuestLv = 1
                  NameMon = "Peanut Scout"
                  CFrameQ = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
                  CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
                elseif service_1.LocalPlayer.Data.Level.Value == 2100 or service_1.LocalPlayer.Data.Level.Value <= 2124 or _G.SelectMonster == "Peanut President [Lv. 2100]" then
                  Ms = "Peanut President"
                  NameQuest = "NutsIslandQuest"
                  QuestLv = 2
                  NameMon = "Peanut President"
                  CFrameQ = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
                  CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
                elseif service_1.LocalPlayer.Data.Level.Value == 2125 or service_1.LocalPlayer.Data.Level.Value <= 2149 or _G.SelectMonster == "Ice Cream Chef [Lv. 2125]" then
                  Ms = "Ice Cream Chef"
                  NameQuest = "IceCreamIslandQuest"
                  QuestLv = 1
                  NameMon = "Ice Cream Chef"
                  CFrameQ = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
                  CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, 0, -0.997525156, 0, 1.00000012, 0, 0.997525275, 0, -0.0703101456)
                elseif service_1.LocalPlayer.Data.Level.Value == 2150 or service_1.LocalPlayer.Data.Level.Value <= 2199 or _G.SelectMonster == "Ice Cream Commander [Lv. 2150]" then
                  Ms = "Ice Cream Commander"
                  NameQuest = "IceCreamIslandQuest"
                  QuestLv = 2
                  NameMon = "Ice Cream Commander"
                  CFrameQ = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
                  CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, 0, -0.997525156, 0, 1.00000012, 0, 0.997525275, 0, -0.0703101456)
                elseif service_1.LocalPlayer.Data.Level.Value == 2200 or service_1.LocalPlayer.Data.Level.Value <= 2224 or _G.SelectMonster == "Cookie Crafter [Lv. 2200]" then
                  Ms = "Cookie Crafter"
                  NameQuest = "CakeQuest1"
                  QuestLv = 1
                  NameMon = "Cookie Crafter"
                  CFrameQ = CFrame.new(-2022.29858, 36.9275894, -12030.9766, -0.961273909, 0, -0.275594592, 0, 1, 0, 0.275594592, 0, -0.961273909)
                  CFrameMon = CFrame.new(-2321.71216, 36.699482, -12216.7871, -0.780074954, 0, 0.625686109, 0, 1, 0, -0.625686109, 0, -0.780074954)
                elseif service_1.LocalPlayer.Data.Level.Value == 2225 or service_1.LocalPlayer.Data.Level.Value <= 2249 or _G.SelectMonster == "Cake Guard [Lv. 2225]" then
                  Ms = "Cake Guard"
                  NameQuest = "CakeQuest1"
                  QuestLv = 2
                  NameMon = "Cake Guard"
                  CFrameQ = CFrame.new(-2022.29858, 36.9275894, -12030.9766, -0.961273909, 0, -0.275594592, 0, 1, 0, 0.275594592, 0, -0.961273909)
                  CFrameMon = CFrame.new(-1418.11011, 36.6718941, -12255.7324, 0.0677844882, 0, 0.997700036, 0, 1, 0, -0.997700036, 0, 0.0677844882)
                elseif service_1.LocalPlayer.Data.Level.Value == 2250 or service_1.LocalPlayer.Data.Level.Value <= 2274 or _G.SelectMonster == "Baking Staff [Lv. 2250]" then
                  Ms = "Baking Staff"
                  NameQuest = "CakeQuest2"
                  QuestLv = 1
                  NameMon = "Baking Staff"
                  CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, 0, -0.308980465, 0, 1, 0, 0.308980465, 0, 0.951068401)
                  CFrameMon = CFrame.new(-1980.43848, 36.6716766, -12983.8418, -0.254443765, 0, -0.967087567, 0, 1, 0, 0.967087567, 0, -0.254443765)
                elseif service_1.LocalPlayer.Data.Level.Value == 2275 or service_1.LocalPlayer.Data.Level.Value <= 2299 or _G.SelectMonster == "Head Baker [Lv. 2275]" then
                  Ms = "Head Baker"
                  NameQuest = "CakeQuest2"
                  QuestLv = 2
                  NameMon = "Head Baker"
                  CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, 0, -0.308980465, 0, 1, 0, 0.308980465, 0, 0.951068401)
                  CFrameMon = CFrame.new(-2251.5791, 52.2714615, -13033.3965, -0.991971016, 0, -0.126466095, 0, 1, 0, 0.126466095, 0, -0.991971016)
                elseif service_1.LocalPlayer.Data.Level.Value == 2300 or service_1.LocalPlayer.Data.Level.Value <= 2324 or _G.SelectMonster == "Cocoa Warrior [Lv. 2300]" then
                  Ms = "Cocoa Warrior"
                  NameQuest = "ChocQuest1"
                  QuestLv = 1
                  NameMon = "Cocoa Warrior"
                  CFrameQ = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
                  CFrameMon = CFrame.new(167.978516, 26.2254658, -12238.874, -0.939700961, 0, 0.341998369, 0, 1, 0, -0.341998369, 0, -0.939700961)
                elseif service_1.LocalPlayer.Data.Level.Value == 2325 or service_1.LocalPlayer.Data.Level.Value <= 2349 or _G.SelectMonster == "Chocolate Bar Battler [Lv. 2325]" then
                  Ms = "Chocolate Bar Battler"
                  NameQuest = "ChocQuest1"
                  QuestLv = 2
                  NameMon = "Chocolate Bar Battler"
                  CFrameQ = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
                  CFrameMon = CFrame.new(701.312073, 25.5824986, -12708.2148, -0.342042685, 0, -0.939684391, 0, 1, 0, 0.939684391, 0, -0.342042685)
                elseif service_1.LocalPlayer.Data.Level.Value == 2350 or service_1.LocalPlayer.Data.Level.Value <= 2374 or _G.SelectMonster == "Sweet Thief [Lv. 2350]" then
                  Ms = "Sweet Thief"
                  NameQuest = "ChocQuest2"
                  QuestLv = 1
                  NameMon = "Sweet Thief"
                  CFrameQ = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)
                  CFrameMon = CFrame.new(-140.258301, 25.5824986, -12652.3115, 0.173624337, 0, -0.984811902, 0, 1, 0, 0.984811902, 0, 0.173624337)
                elseif service_1.LocalPlayer.Data.Level.Value == 2375 or service_1.LocalPlayer.Data.Level.Value <= 2400 or _G.SelectMonster == "Candy Rebel [Lv. 2375]" then
                  Ms = "Candy Rebel"
                  NameQuest = "ChocQuest2"
                  QuestLv = 2
                  NameMon = "Candy Rebel"
                  CFrameQ = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)
                  CFrameMon = CFrame.new(47.9231453, 25.5824986, -13029.2402, -0.819156051, 0, -0.573571265, 0, 1, 0, 0.573571265, 0, -0.819156051)
                elseif service_1.LocalPlayer.Data.Level.Value == 2400 or service_1.LocalPlayer.Data.Level.Value <= 2424 or _G.SelectMonster == "Candy Pirate [Lv. 2400]" then
                  Ms = "Candy Pirate"
                  NameQuest = "CandyQuest1"
                  QuestLv = 1
                  NameMon = "Candy Pirate"
                  CFrameQ = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
                  CFrameMon = CFrame.new(-1437.56348, 17.1481285, -14385.6934, 0.173624337, 0, -0.984811902, 0, 1, 0, 0.984811902, 0, 0.173624337)
                elseif service_1.LocalPlayer.Data.Level.Value == 2425 or service_1.LocalPlayer.Data.Level.Value <= 2449 or _G.SelectMonster == "Snow Demon [Lv. 2425]" then
                  Ms = "Snow Demon"
                  NameQuest = "CandyQuest1"
                  QuestLv = 2
                  NameMon = "Snow Demon"
                  CFrameQ = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
                  CFrameMon = CFrame.new(-916.222656, 17.1481285, -14638.8125, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
                elseif service_1.LocalPlayer.Data.Level.Value == 2450 or service_1.LocalPlayer.Data.Level.Value <= 2474 or _G.SelectMonster == "Isle Outlaw [Lv. 2450]" then
                  Ms = "Isle Outlaw"
                  NameQuest = "TikiQuest1"
                  QuestLv = 1
                  NameMon = "Isle Outlaw"
                  CFrameQ = CFrame.new(-16548.8164, 55.6059914, -172.8125, 0.213092566, 0, -0.977032006, 0, 1, 0, 0.977032006, 0, 0.213092566)
                  CFrameMon = CFrame.new(-16122.4062, 10.6328173, -257.351685, -0.630029082, 0, 0.776571631, 0, 1, 0, -0.776571631, 0, -0.630029082)
                elseif service_1.LocalPlayer.Data.Level.Value == 2475 or service_1.LocalPlayer.Data.Level.Value <= 2499 or _G.SelectMonster == "Island Boy [2475]" then
                  Ms = "Island Boy"
                  NameQuest = "TikiQuest1"
                  QuestLv = 2
                  NameMon = "Island Boy"
                  CFrameQ = CFrame.new(-16548.8164, 55.6059914, -172.8125, 0.213092566, 0, -0.977032006, 0, 1, 0, 0.977032006, 0, 0.213092566)
                  CFrameMon = CFrame.new(-16736.2266, 20.533947, -131.718811, 0.546393692, 0, 0.837528467, 0, 1, 0, -0.837528467, 0, 0.546393692)
                elseif service_1.LocalPlayer.Data.Level.Value == 2500 or service_1.LocalPlayer.Data.Level.Value <= 2524 or _G.SelectMonster == "Sun-kissed Warrior [Lv. 2500]" then
                  Ms = "Sun-kissed Warrior"
                  NameQuest = "TikiQuest2"
                  QuestLv = 1
                  NameMon = "Sun-"
                  CFrameQ = CFrame.new(-16541.0215, 54.770813, 1051.46118, 0.0410757065, 0, -0.999156058, 0, 1, 0, 0.999156058, 0, 0.0410757065)
                  CFrameMon = CFrame.new(-16413.5078, 54.6350479, 1054.43555, -0.999391913, 0, -0.034868788, 0, 1, 0, 0.034868788, 0, -0.999391913)
                elseif 2525 <= service_1.LocalPlayer.Data.Level.Value or _G.SelectMonster == "Isle Champion [Lv. 2525]" then
                  Ms = "Isle Champion"
                  NameQuest = "TikiQuest2"
                  QuestLv = 2
                  NameMon = "Isle Champion"
                  CFrameQ = CFrame.new(-16541.0215, 54.770813, 1051.46118, 0.0410757065, 0, -0.999156058, 0, 1, 0, 0.999156058, 0, 0.0410757065)
                  CFrameMon = CFrame.new(-16787.3203, 20.6350517, 992.131836, -0.775471091, 0, 0.631383121, 0, 1, 0, -0.631383121, 0, -0.775471091)
                end
              end
            end
          elseif service_1.LocalPlayer.Data.Level.Value == 1275 or service_1.LocalPlayer.Data.Level.Value <= 1299 or _G.SelectMonster == "Ship Engineer [Lv. 1275]" then
            Ms = "Ship Engineer"
            NameQuest = "ShipQuest1"
            QuestLv = 2
            NameMon = "Ship Engineer"
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)
            if (LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm) and 20000 < (CFrameMon.Position - l_20().Position).Magnitude then
              service_9.Remotes.CommF_.InvokeServer()
            end
          elseif service_1.LocalPlayer.Data.Level.Value == 1300 or service_1.LocalPlayer.Data.Level.Value <= 1324 or _G.SelectMonster == "Ship Steward [Lv. 1300]" then
            Ms = "Ship Steward"
            NameQuest = "ShipQuest2"
            QuestLv = 1
            NameMon = "Ship Steward"
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
            if (LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm) and 20000 < (CFrameMon.Position - l_20().Position).Magnitude then
              service_9.Remotes.CommF_.InvokeServer()
            end
          elseif service_1.LocalPlayer.Data.Level.Value == 1325 or service_1.LocalPlayer.Data.Level.Value <= 1349 or _G.SelectMonster == "Ship Officer [Lv. 1325]" then
            Ms = "Ship Officer"
            NameQuest = "ShipQuest2"
            QuestLv = 2
            NameMon = "Ship Officer"
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
            if (LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm) and 20000 < (CFrameMon.Position - l_20().Position).Magnitude then
              service_9.Remotes.CommF_.InvokeServer()
            end
          elseif service_1.LocalPlayer.Data.Level.Value == 1350 or service_1.LocalPlayer.Data.Level.Value <= 1374 or _G.SelectMonster == "Arctic Warrior [Lv. 1350]" then
            Ms = "Arctic Warrior"
            NameQuest = "FrostQuest"
            QuestLv = 1
            NameMon = "Arctic Warrior"
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
            CFrameMon = CFrame.new(5935.4541015625, 77.26016998291, -6472.7568359375)
            if (LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm) and 20000 < (CFrameMon.Position - l_20().Position).Magnitude then
              service_9.Remotes.CommF_.InvokeServer()
            end
          elseif service_1.LocalPlayer.Data.Level.Value == 1375 or service_1.LocalPlayer.Data.Level.Value <= 1424 or _G.SelectMonster == "Snow Lurker [Lv. 1375]" then
            Ms = "Snow Lurker"
            NameQuest = "FrostQuest"
            QuestLv = 2
            NameMon = "Snow Lurker"
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
            CFrameMon = CFrame.new(5628.482421875, 57.574996948242, -6618.3481445313)
          elseif service_1.LocalPlayer.Data.Level.Value == 1425 or service_1.LocalPlayer.Data.Level.Value <= 1449 or _G.SelectMonster == "Sea Soldier [Lv. 1425]" then
            Ms = "Sea Soldier"
            NameQuest = "ForgottenQuest"
            QuestLv = 1
            NameMon = "Sea Soldier"
            CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
            CFrameMon = CFrame.new(-3185.0153808594, 58.789089202881, -9663.6064453125)
          elseif 1450 <= service_1.LocalPlayer.Data.Level.Value or _G.SelectMonster == "Water Fighter [Lv. 1450]" then
            Ms = "Water Fighter"
            NameQuest = "ForgottenQuest"
            QuestLv = 2
            NameMon = "Water Fighter"
            CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
            CFrameMon = CFrame.new(-3262.9301757813, 298.69036865234, -10552.529296875)
          end
        end
      end
    elseif service_1.LocalPlayer.Data.Level.Value == 400 or service_1.LocalPlayer.Data.Level.Value <= 449 or _G.SelectMonster == "Fishman Commando [Lv. 400]" then
      Ms = "Fishman Commando"
      NameQuest = "FishmanQuest"
      QuestLv = 2
      NameMon = "Fishman Commando"
      CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
      CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
      if (LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm) and 3000 < (CFrameMon.Position - l_20().Position).Magnitude then
        service_9.Remotes.CommF_.InvokeServer()
      end
    elseif service_1.LocalPlayer.Data.Level.Value == 450 or service_1.LocalPlayer.Data.Level.Value <= 474 or _G.SelectMonster == "God's Guard [Lv. 450]" then
      Ms = "God's Guard"
      NameQuest = "SkyExp1Quest"
      QuestLv = 1
      NameMon = "God's Guard"
      CFrameQ = CFrame.new(-4721.8603515625, 845.30297851563, -1953.8489990234)
      CFrameMon = CFrame.new(-4628.0498046875, 866.92877197266, -1931.2352294922)
      if (LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm) and 3000 < (CFrameMon.Position - l_20().Position).Magnitude then
        service_9.Remotes.CommF_.InvokeServer()
      end
    elseif service_1.LocalPlayer.Data.Level.Value == 475 or service_1.LocalPlayer.Data.Level.Value <= 524 or _G.SelectMonster == "Shanda [Lv. 475]" then
      Ms = "Shanda"
      NameQuest = "SkyExp1Quest"
      QuestLv = 2
      NameMon = "Shanda"
      CFrameQ = CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703)
      CFrameMon = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)
      if (LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm) and 3000 < (CFrameMon.Position - l_20().Position).Magnitude then
        service_9.Remotes.CommF_.InvokeServer()
      end
    elseif service_1.LocalPlayer.Data.Level.Value == 525 or service_1.LocalPlayer.Data.Level.Value <= 549 or _G.SelectMonster == "Royal Squad [Lv. 525]" then
      Ms = "Royal Squad"
      NameQuest = "SkyExp2Quest"
      QuestLv = 1
      NameMon = "Royal Squad"
      CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
      CFrameMon = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)
    elseif service_1.LocalPlayer.Data.Level.Value == 550 or service_1.LocalPlayer.Data.Level.Value <= 624 or _G.SelectMonster == "Royal Soldier [Lv. 550]" then
      Ms = "Royal Soldier"
      NameQuest = "SkyExp2Quest"
      QuestLv = 2
      NameMon = "Royal Soldier"
      CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
      CFrameMon = CFrame.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)
    elseif service_1.LocalPlayer.Data.Level.Value == 625 or service_1.LocalPlayer.Data.Level.Value <= 649 or _G.SelectMonster == "Galley Pirate [Lv. 625]" then
      Ms = "Galley Pirate"
      NameQuest = "FountainQuest"
      QuestLv = 1
      NameMon = "Galley Pirate"
      CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
      CFrameMon = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)
    elseif 650 <= service_1.LocalPlayer.Data.Level.Value or _G.SelectMonster == "Galley Captain [Lv. 650]" then
      Ms = "Galley Captain"
      NameQuest = "FountainQuest"
      QuestLv = 2
      NameMon = "Galley Captain"
      CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
      CFrameMon = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
    end
  end
end

if First_Sea then
  tableMon = {
    "Bandit [Lv. 5]",
    "Monkey [Lv. 14]",
    "Gorilla [Lv. 20]",
    "Pirate [Lv. 35]",
    "Brute [Lv. 45]",
    "Desert Bandit [Lv. 60]",
    "Desert Officer [Lv. 70]",
    "Snow Bandit [Lv. 90]",
    "Snowman [Lv. 100]",
    "Chief Petty Officer [Lv. 120]",
    "Sky Bandit [Lv. 150]",
    "Dark Master [Lv. 175]",
    "Prisoner [Lv. 190]",
    "Dangerous Prisoner [Lv. 210]",
    "Toga Warrior [Lv. 250]",
    "Gladiator [Lv. 275]",
    "Military Soldier [Lv. 300]",
    "Military Spy [Lv. 325]",
    "Fishman Warrior [Lv. 375]",
    "Fishman Commando [Lv. 400]",
    "God's Guard [Lv. 450]",
    "Shanda [Lv. 475]",
    "Royal Squad [Lv. 525]",
    "Royal Soldier [Lv. 550]",
    "Galley Pirate [Lv. 625]",
    "Galley Captain [Lv. 650]"
  }
elseif Second_Sea then
  tableMon = {
    "Raider [Lv. 700]",
    "Mercenary [Lv. 725]",
    "Swan Pirate [Lv. 775]",
    "Factory Staff [Lv. 800]",
    "Marine Lieutenant [Lv. 875]",
    "Marine Captain [Lv. 900]",
    "Zombie [Lv. 950]",
    "Vampire [Lv. 975]",
    "Snow Trooper [Lv. 1000]",
    "Winter Warrior [Lv. 1050]",
    "Lab Subordinate [Lv. 1100]",
    "Horned Warrior [Lv. 1125]",
    "Magma Ninja [Lv. 1175]",
    "Lava Pirate [Lv. 1200]",
    "Ship Deckhand [Lv. 1250]",
    "Ship Engineer [Lv. 1275]",
    "Ship Steward [Lv. 1300]",
    "Ship Officer [Lv. 1325]",
    "Arctic Warrior [Lv. 1350]",
    "Snow Lurker [Lv. 1375]",
    "Sea Soldier [Lv. 1425]",
    "Water Fighter [Lv. 1450]"
  }
elseif Third_Sea then
  tableMon = {
    "Pirate Millionaire [Lv. 1500]",
    "Dragon Crew Warrior [Lv. 1575]",
    "Dragon Crew Archer [Lv. 1600]",
    "Female Islander [Lv. 1625]",
    "Giant Islander [Lv. 1650]",
    "Marine Commodore [Lv. 1700]",
    "Marine Rear Admiral [Lv. 1725]",
    "Fishman Raider [Lv. 1775]",
    "Fishman Captain [Lv. 1800]",
    "Forest Pirate [Lv. 1825]",
    "Mythological Pirate [Lv. 1850]",
    "Jungle Pirate [Lv. 1900]",
    "Musketeer Pirate [Lv. 1925]",
    "Reborn Skeleton [Lv. 1975]",
    "Living Zombie [Lv. 2000]",
    "Demonic Soul [Lv. 2025]",
    "Posessed Mummy [Lv. 2050]",
    "Peanut Scout [Lv. 2075]",
    "Peanut President [Lv. 2100]",
    "Ice Cream Chef [Lv. 2125]",
    "Ice Cream Commander [Lv. 2150]",
    "Cookie Crafter [Lv. 2200]",
    "Cake Guard [Lv. 2225]",
    "Baking Staff [Lv. 2250]",
    "Head Baker [Lv. 2275]",
    "Cocoa Warrior [Lv. 2300]",
    "Chocolate Bar Battler [Lv. 2325]",
    "Sweet Thief [Lv. 2350]",
    "Candy Rebel [Lv. 2375]",
    "Candy Pirate [Lv. 2400]",
    "Snow Demon [Lv. 2425]",
    "Isle Outlaw [Lv. 2450]",
    "Island Boy [2475]",
    "Sun-kissed Warrior [Lv. 2500]",
    "Isle Champion [Lv. 2525]"
  }
end

function CheckBossQuest()
  if First_Sea then
    if SelectBoss == "The Gorilla King" then
      BossMon = "The Gorilla King [Lv. 25] [Boss]"
      NameBoss = "The Gorrila King"
      NameQuestBoss = "JungleQuest"
      QuestLvBoss = 3
      RewardBoss = [[Reward:
$2,000
7,000 Exp.]]
      local new = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
      CFrameQBoss = new
      CFrameBoss = CFrame.new(-1088.75977, 8.13463783, -488.559906, -0.707134247, 0, 0.707079291, 0, 1, 0, -0.707079291, 0, -0.707134247)
    elseif SelectBoss == "Bobby" then
      BossMon = "Bobby [Lv. 55] [Boss]"
      NameBoss = "Bobby"
      NameQuestBoss = "BuggyQuest1"
      QuestLvBoss = 3
      RewardBoss = [[Reward:
$8,000
35,000 Exp.]]
      CFrameQBoss = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
      CFrameBoss = CFrame.new(-1087.3760986328, 46.949409484863, 4040.1462402344)
    elseif SelectBoss == "The Saw" then
      BossMon = "The Saw [Lv. 100] [Boss]"
      NameBoss = "The Saw"
      CFrameBoss = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906)
    elseif SelectBoss == "Yeti" then
      BossMon = "Yeti [Lv. 110] [Boss]"
      NameBoss = "Yeti"
      NameQuestBoss = "SnowQuest"
      QuestLvBoss = 3
      RewardBoss = [[Reward:
$10,000
180,000 Exp.]]
      CFrameQBoss = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
      CFrameBoss = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
    elseif SelectBoss == "Mob Leader" then
      BossMon = "Mob Leader [Lv. 120] [Boss]"
      NameBoss = "Mob Leader"
      CFrameBoss = CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813)
    elseif SelectBoss == "Vice Admiral" then
      BossMon = "Vice Admiral [Lv. 130] [Boss]"
      NameBoss = "Vice Admiral"
      NameQuestBoss = "MarineQuest2"
      QuestLvBoss = 2
      RewardBoss = [[Reward:
$10,000
180,000 Exp.]]
      CFrameQBoss = CFrame.new(-5036.2465820313, 28.677835464478, 4324.56640625)
      CFrameBoss = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)
    elseif SelectBoss == "Saber Expert" then
      NameBoss = "Saber Expert"
      BossMon = "Saber Expert [Lv. 200] [Boss]"
      CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564)
    elseif SelectBoss == "Warden" then
      BossMon = "Warden [Lv. 220] [Boss]"
      NameBoss = "Warden"
      NameQuestBoss = "ImpelQuest"
      QuestLvBoss = 1
      RewardBoss = [[Reward:
$6,000
850,000 Exp.]]
      CFrameBoss = CFrame.new(5278.04932, 2.15167475, 944.101929, 0.220546961, -0.00000449946401, 0.975376427, -0.0000195412576, 1, 0.00000903162072, -0.975376427, -0.0000210519756, 0.220546961)
      CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
    elseif SelectBoss == "Chief Warden" then
      BossMon = "Chief Warden [Lv. 230] [Boss]"
      NameBoss = "Chief Warden"
      NameQuestBoss = "ImpelQuest"
      QuestLvBoss = 2
      RewardBoss = [[Reward:
$10,000
1,000,000 Exp.]]
      CFrameBoss = CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, -0.00062915677, 0.939684749, 0.00191645394, 0.999998152, -0.0000280422337, -0.939682961, 0.00181045406, 0.342041939)
      CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
    elseif SelectBoss == "Swan" then
      BossMon = "Swan [Lv. 240] [Boss]"
      NameBoss = "Swan"
      NameQuestBoss = "ImpelQuest"
      QuestLvBoss = 3
      RewardBoss = [[Reward:
$15,000
1,600,000 Exp.]]
      CFrameBoss = CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812)
      CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
    elseif SelectBoss == "Magma Admiral" then
      BossMon = "Magma Admiral [Lv. 350] [Boss]"
      NameBoss = "Magma Admiral"
      NameQuestBoss = "MagmaQuest"
      QuestLvBoss = 3
      RewardBoss = [[Reward:
$15,000
2,800,000 Exp.]]
      CFrameQBoss = CFrame.new(-5314.6220703125, 12.262420654297, 8517.279296875)
      CFrameBoss = CFrame.new(-5765.8969726563, 82.92064666748, 8718.3046875)
    elseif SelectBoss == "Fishman Lord" then
      BossMon = "Fishman Lord [Lv. 425] [Boss]"
      NameBoss = "Fishman Lord"
      NameQuestBoss = "FishmanQuest"
      QuestLvBoss = 3
      RewardBoss = [[Reward:
$15,000
4,000,000 Exp.]]
      CFrameQBoss = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
      CFrameBoss = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
    elseif SelectBoss == "Wysper" then
      BossMon = "Wysper [Lv. 500] [Boss]"
      NameBoss = "Wysper"
      NameQuestBoss = "SkyExp1Quest"
      QuestLvBoss = 3
      RewardBoss = [[Reward:
$15,000
4,800,000 Exp.]]
      CFrameQBoss = CFrame.new(-7861.947265625, 5545.517578125, -379.85974121094)
      CFrameBoss = CFrame.new(-7866.1333007813, 5576.4311523438, -546.74816894531)
    elseif SelectBoss == "Thunder God" then
      BossMon = "Thunder God [Lv. 575] [Boss]"
      NameBoss = "Thunder God"
      NameQuestBoss = "SkyExp2Quest"
      QuestLvBoss = 3
      RewardBoss = [[Reward:
$20,000
5,800,000 Exp.]]
      CFrameQBoss = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
      CFrameBoss = CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188)
    elseif SelectBoss == "Cyborg" then
      BossMon = "Cyborg [Lv. 675] [Boss]"
      NameBoss = "Cyborg"
      NameQuestBoss = "FountainQuest"
      QuestLvBoss = 3
      RewardBoss = [[Reward:
$20,000
7,500,000 Exp.]]
      CFrameQBoss = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
      CFrameBoss = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)
    elseif SelectBoss == "Ice Admiral" then
      BossMon = "Ice Admiral [Lv. 700] [Boss]"
      NameBoss = "Ice Admiral"
      CFrameBoss = CFrame.new(1266.08948, 26.1757946, -1399.57678, -0.573599219, 0, -0.81913656, 0, 1, 0, 0.81913656, 0, -0.573599219)
    elseif SelectBoss == "Greybeard" then
      BossMon = "Greybeard [Lv. 750] [Raid Boss]"
      NameBoss = "Greybeard"
      CFrameBoss = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
    end
  end
  if Second_Sea then
    if SelectBoss == "Diamond" then
      BossMon = "Diamond [Lv. 750] [Boss]"
      NameBoss = "Diamond"
      NameQuestBoss = "Area1Quest"
      QuestLvBoss = 3
      RewardBoss = [[Reward:
$25,000
9,000,000 Exp.]]
      CFrameQBoss = CFrame.new(-427.5666809082, 73.313781738281, 1835.4208984375)
      CFrameBoss = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)
    elseif SelectBoss == "Jeremy" then
      BossMon = "Jeremy [Lv. 850] [Boss]"
      NameBoss = "Jeremy"
      NameQuestBoss = "Area2Quest"
      QuestLvBoss = 3
      RewardBoss = [[Reward:
$25,000
11,500,000 Exp.]]
      CFrameQBoss = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063)
      CFrameBoss = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
    elseif SelectBoss == "Fajita" then
      BossMon = "Fajita [Lv. 925] [Boss]"
      NameBoss = "Fajita"
      NameQuestBoss = "MarineQuest3"
      QuestLvBoss = 3
      RewardBoss = [[Reward:
$25,000
15,000,000 Exp.]]
      CFrameQBoss = CFrame.new(-2441.986328125, 73.359344482422, -3217.5324707031)
      CFrameBoss = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)
    elseif SelectBoss == "Don Swan" then
      BossMon = "Don Swan [Lv. 1000] [Boss]"
      NameBoss = "Don Swan"
      CFrameBoss = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875)
    elseif SelectBoss == "Smoke Admiral" then
      BossMon = "Smoke Admiral [Lv. 1150] [Boss]"
      NameBoss = "Smoke Admiral"
      NameQuestBoss = "IceSideQuest"
      QuestLvBoss = 3
      RewardBoss = [[Reward:
$20,000
25,000,000 Exp.]]
      CFrameQBoss = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
      CFrameBoss = CFrame.new(-5275.1987304688, 20.757257461548, -5260.6669921875)
    elseif SelectBoss == "Awakened Ice Admiral" then
      BossMon = "Awakened Ice Admiral [Lv. 1400] [Boss]"
      NameBoss = "Awakened Ice Admiral"
      NameQuestBoss = "FrostQuest"
      QuestLvBoss = 3
      RewardBoss = [[Reward:
$20,000
36,000,000 Exp.]]
      CFrameQBoss = CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813)
      CFrameBoss = CFrame.new(6403.5439453125, 340.29766845703, -6894.5595703125)
    elseif SelectBoss == "Tide Keeper" then
      BossMon = "Tide Keeper [Lv. 1475] [Boss]"
      NameBoss = "Tide Keeper"
      NameQuestBoss = "ForgottenQuest"
      QuestLvBoss = 3
      RewardBoss = [[Reward:
$12,500
38,000,000 Exp.]]
      CFrameQBoss = CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625)
      CFrameBoss = CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188)
    elseif SelectBoss == "Darkbeard" then
      BossMon = "Darkbeard [Lv. 1000] [Raid Boss]"
      NameBoss = "Darkbeard"
      CFrameMon = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
    elseif SelectBoss == "Cursed Captain" then
      BossMon = "Cursed Captain [Lv. 1325] [Raid Boss]"
      NameBoss = "Cursed Captain"
      CFrameBoss = CFrame.new(916.928589, 181.092773, 33422)
    elseif SelectBoss == "Order" then
      BossMon = "Order [Lv. 1250] [Raid Boss]"
      NameBoss = "Order"
      CFrameBoss = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
    end
  end
  if Third_Sea then
    if SelectBoss == "Stone" then
      BossMon = "Stone [Lv. 1550] [Boss]"
      NameBoss = "Stone"
      NameQuestBoss = "PiratePortQuest"
      QuestLvBoss = 3
      RewardBoss = [[Reward:
$25,000
40,000,000 Exp.]]
      CFrameQBoss = CFrame.new(-289.76705932617, 43.819011688232, 5579.9384765625)
      CFrameBoss = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)
    elseif SelectBoss == "Island Empress" then
      BossMon = "Island Empress [Lv. 1675] [Boss]"
      NameBoss = "Island Empress"
      NameQuestBoss = "AmazonQuest2"
      QuestLvBoss = 3
      RewardBoss = [[Reward:
$30,000
52,000,000 Exp.]]
      CFrameQBoss = CFrame.new(5445.9541015625, 601.62945556641, 751.43792724609)
      CFrameBoss = CFrame.new(5543.86328125, 668.97399902344, 199.0341796875)
    elseif SelectBoss == "Kilo Admiral" then
      BossMon = "Kilo Admiral [Lv. 1750] [Boss]"
      NameBoss = "Kilo Admiral"
      NameQuestBoss = "MarineTreeIsland"
      QuestLvBoss = 3
      RewardBoss = [[Reward:
$35,000
56,000,000 Exp.]]
      CFrameQBoss = CFrame.new(2179.3010253906, 28.731239318848, -6739.9741210938)
      CFrameBoss = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)
    elseif SelectBoss == "Captain Elephant" then
      BossMon = "Captain Elephant [Lv. 1875] [Boss]"
      NameBoss = "Captain Elephant"
      NameQuestBoss = "DeepForestIsland"
      QuestLvBoss = 3
      RewardBoss = [[Reward:
$40,000
67,000,000 Exp.]]
      CFrameQBoss = CFrame.new(-13232.682617188, 332.40396118164, -7626.01171875)
      CFrameBoss = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
    elseif SelectBoss == "Beautiful Pirate" then
      BossMon = "Beautiful Pirate [Lv. 1950] [Boss]"
      NameBoss = "Beautiful Pirate"
      NameQuestBoss = "DeepForestIsland2"
      QuestLvBoss = 3
      RewardBoss = [[Reward:
$50,000
70,000,000 Exp.]]
      CFrameQBoss = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
      CFrameBoss = CFrame.new(5283.609375, 22.56223487854, -110.78285217285)
    elseif SelectBoss == "Cake Queen" then
      BossMon = "Cake Queen [Lv. 2175] [Boss]"
      NameBoss = "Cake Queen"
      NameQuestBoss = "IceCreamIslandQuest"
      QuestLvBoss = 3
      RewardBoss = [[Reward:
$30,000
112,500,000 Exp.]]
      CFrameQBoss = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
      CFrameBoss = CFrame.new(-678.648804, 381.353943, -11114.2012, -0.908641815, 0.00149294338, 0.41757378, 0.00837114919, 0.999857843, 0.0146408929, -0.417492568, 0.0167988986, -0.90852499)
    elseif SelectBoss == "Longma" then
      BossMon = "Longma [Lv. 2000] [Boss]"
      NameBoss = "Longma"
      CFrameBoss = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
    elseif SelectBoss == "Soul Reaper" then
      BossMon = "Soul Reaper [Lv. 2100] [Raid Boss]"
      NameBoss = "Soul Reaper"
      CFrameBoss = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
    elseif SelectBoss == "rip_indra True Form" then
      BossMon = "rip_indra True Form [Lv. 5000] [Raid Boss]"
      NameBoss = "rip_indra True Form"
      CFrameBoss = CFrame.new(-5415.3920898438, 505.74133300781, -2814.0166015625)
    end
  end
end

function MaterialMon()
  if SelectMaterial == "Radioactive Material" then
    MMon = "Factory Staff"
    local new = CFrame.new(295, 73, -56)
    MPos = new
    SP = "Default"
  elseif SelectMaterial == "Mystic Droplet" then
    MMon = "Water Fighter"
    MPos = CFrame.new(-3385, 239, -10542)
    SP = "Default"
  elseif SelectMaterial == "Magma Ore" then
    if First_Sea then
      MMon = "Military Spy"
      MPos = CFrame.new(-5815, 84, 8820)
      SP = "Default"
    elseif Second_Sea then
      MMon = "Magma Ninja"
      MPos = CFrame.new(-5428, 78, -5959)
      SP = "Default"
    end
    MMon = "God's Guard"
    MPos = CFrame.new(-4698, 845, -1912)
    SP = "Default"
    local new = Vector3.new(-7859.09814, 5544.19043, -381.476196)
    if 5000 <= (l_20().Position - new).Magnitude then
      service_9.Remotes.CommF_.InvokeServer()
    end
  elseif SelectMaterial == "Angel Wings" and SelectMaterial == "Leather" then
    if First_Sea then
      MMon = "Brute"
      MPos = CFrame.new(-1145, 15, 4350)
      SP = "Default"
    elseif Second_Sea then
      MMon = "Marine Captain"
      MPos = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375)
      SP = "Default"
    elseif Third_Sea then
      MMon = "Jungle Pirate"
      MPos = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375)
      SP = "Default"
    end
    if SelectMaterial == "Scrap Metal" then
      if First_Sea then
        MMon = "Brute"
        MPos = CFrame.new(-1145, 15, 4350)
        SP = "Default"
      elseif Second_Sea then
        MMon = "Swan Pirate"
        MPos = CFrame.new(878, 122, 1235)
        SP = "Default"
      elseif Third_Sea then
        MMon = "Jungle Pirate"
        MPos = CFrame.new(-12107, 332, -10549)
        SP = "Default"
      end
      if SelectMaterial == "Fish Tail" then
        if Third_Sea then
          MMon = "Fishman Raider"
          MPos = CFrame.new(-10993, 332, -8940)
          SP = "Default"
        else
          MMon = "Fishman Warrior"
          MPos = CFrame.new(61123, 19, 1569)
          SP = "Default"
          if First_Sea and 17000 <= (l_20().Position - Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)).Magnitude then
            service_9.Remotes.CommF_.InvokeServer()
          end
        end
        if SelectMaterial == "Demonic Wisp" then
          MMon = "Demonic Soul"
          MPos = CFrame.new(-9507, 172, 6158)
          SP = "Default"
        elseif SelectMaterial == "Vampire Fang" then
          MMon = "Vampire"
          MPos = CFrame.new(-6033, 7, -1317)
          SP = "Default"
        elseif SelectMaterial == "Conjured Cocoa" then
          MMon = "Chocolate Bar Battler"
          MPos = CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625)
          SP = "Default"
        elseif SelectMaterial == "Dragon Scale" then
          MMon = "Dragon Crew Archer"
          MPos = CFrame.new(6594, 383, 139)
          SP = "Default"
        elseif SelectMaterial == "Gunpowder" then
          MMon = "Pistol Billionaire"
          MPos = CFrame.new(-469, 74, 5904)
          SP = "Default"
        elseif SelectMaterial == "Mini Tusk" then
          MMon = "Mythological Pirate"
          MPos = CFrame.new(-13545, 470, -6917)
          SP = "Default"
        end
      end
    end
  end
end

function EquipTool(a0)
  pcall(function()
  local l_0 = l_19()
  l_0.EquipTool(l_0, service_1.LocalPlayer.Backpack[a0])
end)
end

function Tween(a0)
  local l_1 = a0.Position
  local l_2 = l_20()
  l_1 = l_1 - l_2.Position
  l_1 = l_1.Magnitude
  if 1 < l_1 then
    Speed = 350
  end
  local l_4 = l_20()
  local new = TweenInfo.new(l_1 / Speed, Enum.EasingStyle.Linear)
  service_3.Create(service_3, l_4, new, {CFrame = a0}).Play(service_3.Create(service_3, l_4, new, {CFrame = a0}))
end

function TP2(a0)
  local l_1 = a0.Position
  local l_2 = l_20()
  l_1 = l_1 - l_2.Position
  l_1 = l_1.Magnitude
  if 1 < l_1 then
    Speed = 350
    local l_4 = l_20()
    local new = TweenInfo.new(l_1 / Speed, Enum.EasingStyle.Linear)
    service_3.Create(service_3, l_4, new, {CFrame = a0}).Play(service_3.Create(service_3, l_4, new, {CFrame = a0}))
    if _G.StopTween2 then
      service_3.Create(service_3, l_20(), TweenInfo.new(l_1 / Speed, Enum.EasingStyle.Linear), {CFrame = a0}).Cancel(service_3.Create(service_3, l_20(), TweenInfo.new(l_1 / Speed, Enum.EasingStyle.Linear), {CFrame = a0}))
    end
  end
  _G.Clip2 = true
  task.wait(l_1 / Speed)
  _G.Clip2 = false
end

function CancelTween(a0)
  if not a0 then
    _G.StopTween = true
    task.wait(0.1)
    local l_2 = l_20()
    Tween(l_2.CFrame)
    task.wait(0.1)
    _G.StopTween = false
  end
end

function BTP(a0)
  local l_2 = l_20()
  if 2000 < (a0.Position - l_2.Position).Magnitude then
    local l_1 = l_18()
    l_1.Head.Destroy(l_1.Head)
    l_20().CFrame = a0
    service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "SetSpawnPoint")
    task.wait(1)
    l_20().CFrame = a0
    service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "SetSpawnPoint")
    task.wait(7)
  elseif (a0.Position - l_20().Position).Magnitude < 2000 then
    Tween(a0)
  end
end

function AutoClick()
  service_6.CaptureController(service_6)
  service_6.Button1Down()
end

spawn(function()
  while r0 do
    pcall(function()
  if LevelFarmNoQuest or LevelFarmQuest or Farm_Bone or Farm_Ectoplasm or Nearest_Farm or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or Auto_Farm_Material or AutoFarmBossNoQuest or AutoFarmBossQuest or GunFarm_Right or DevilFarm_Right or AutoKenV2 or AutoFarmKen or AutoNextIsland or BossRaid or _G.Teleport_to_Player or _G.Clip or _G.Auto_Kill_Player_Melee or _G.Auto_Kill_Player_Gun or TeleporttoMirage or TeleporttoGear or _G.Auto_Teleport_Fruit or AutoSecondWorld or AutoThirdWorld or AutoDeathStep or AutoSuperhuman or AutoSharkman or _G.TeleporttoSeaBeast or _G.AutoBuyBoat or _G.AutoTerrorshark or _G.farmpiranya or AutoElectricClaw or AutoDragonTalon or AutoGodhuman or AutoSaber or AutoRengoku or AutoBuddySword or AutoPole or AutoYama or AutoCavander or AutoTushita or _G.TeleportNPC or Auto_Cursed_Dual_Katana or Auto_Quest_Yama_1 or Auto_Quest_Yama_2 or AutoFarmAcient or Auto_Quest_Yama_3 or Auto_Quest_Tushita_1 or Auto_Quest_Tushita_2 or Auto_Quest_Tushita_3 or AutoEliteHunter or AutoCakePrince or _G.AutoDoughKing or AutoDarkDagger or AutoHallowSycthe or AutoCitizen or AutoEvoRace or AutoBartilo or AutoFactory or _G.SwanGlasses or RipIndra or AutoRainbowHaki or AutoTorch or AutoSoulGuitar or AutoTryLuck or AutoPray or AutoAdvanceDungeon or AutoMusketeer or Auto_Serpent_Bow or _G.TptoKisuneIsland or _G.ColletEmber then
    local l_0 = l_20()
    if not l_0.FindFirstChild(l_0, "BodyClip") then
      Instance.new("BodyVelocity").Name = "BodyClip"
      local l_1 = l_20()
      Instance.new("BodyVelocity").Parent = l_1
      Instance.new("BodyVelocity").MaxForce = Vector3.new(100000, 100000, 100000)
      Instance.new("BodyVelocity").Velocity = Vector3.new(0, 0, 0)
    end
  elseif l_20().FindFirstChild(l_20(), "BodyClip") then
    l_20().FindFirstChild(l_20(), "BodyClip").Destroy(l_20().FindFirstChild(l_20(), "BodyClip"))
  end
end)
  end
end)
spawn(function()
  pcall(function()
  service_4.Stepped.Connect(service_4.Stepped, function()
  if LevelFarmNoQuest or LevelFarmQuest or Farm_Bone or Farm_Ectoplasm or Nearest_Farm or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or Auto_Farm_Material or AutoFarmAcient or _G.TeleporttoSeaBeast or _G.AutoBuyBoat or _G.AutoTerrorshark or _G.farmpiranya or AutoFarmBossNoQuest or _G.TeleportNPC or AutoFarmBossQuest or GunFarm_Right or DevilFarm_Right or AutoKenV2 or AutoFarmKen or AutoNextIsland or BossRaid or _G.Teleport_to_Player or _G.Clip or _G.Auto_Kill_Player_Melee or _G.Auto_Kill_Player_Gun or _G.TptoKisuneIsland or _G.ColletEmber or TeleporttoMirage or TeleporttoGear or _G.Auto_Teleport_Fruit or AutoSecondWorld or AutoThirdWorld or AutoDeathStep or AutoSuperhuman or AutoSharkman or AutoElectricClaw or AutoDragonTalon or AutoGodhuman or AutoSaber or AutoRengoku or AutoBuddySword or AutoPole or AutoYama or AutoCavander or AutoTushita or Auto_Cursed_Dual_Katana or Auto_Quest_Yama_1 or Auto_Quest_Yama_2 or Auto_Quest_Yama_3 or Auto_Quest_Tushita_1 or Auto_Quest_Tushita_2 or Auto_Quest_Tushita_3 or AutoEliteHunter or AutoCakePrince or _G.AutoDoughKing or AutoDarkDagger or AutoHallowSycthe or AutoCitizen or AutoEvoRace or AutoBartilo or AutoFactory or _G.SwanGlasses or RipIndra or AutoRainbowHaki or AutoTorch or AutoSoulGuitar or AutoTryLuck or AutoPray or AutoAdvanceDungeon or AutoMusketeer or Auto_Serpent_Bow then
    local l_1 = l_18()
    local l_0, descendants, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        local a = l_4.IsA(l_4, "BasePart")
        if a then
          l_4.CanCollide = false
        end
      end
    end
  end
end)
end)
end)
spawn(function()
  pcall(function()
  while r0 do
    if _G.Auto_StartRaid or _G.Auto_Next_Island or _G.Kill_Aura or _G.Auto_Start_Law_Dungeon or _G.AutoNevaSoulGuitar or _G.CursedChest or _G.Autotushita or Auto_Cursed_Dual_Katana or _G.BoneFarm or _G.FishBoat or _G.AutoAdvanceDungeon or _G.BrigadeShip or _G.AutoRemover or _G.AutoSail or _G.SendShip or _G.SharkPir or _G.TerShark or _G.Beast or _G.AutoDoughtBoss or _G.Auto_DungeonMobAura or _G.AutoFarmChest or _G.AutoFarmBossHallow or _G.AutoFarmSwanGlasses or _G.AutoLongSword or _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or _G.AutoFarmBoss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or _G.AutoSaber or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.AutoDarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoBounty or _G.AutoAllBoss or _G.Auto_Bounty or _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.GrabChest or _G.AutoFarmBounty or _G.Holy_Torch or _G.AutoFarm or _G.Clip or FarmBoss or _G.AutoElitehunter or _G.AutoThirdSea or _G.Auto_Bone == true then
    end
  end
  local l_0 = l_20()
  if not l_0.FindFirstChild(l_0, "BodyClip") then
  end
end)
end)
spawn(function()
  pcall(function()
  service_4.Stepped.Connect(service_4.Stepped, function()
  if _G.Auto_StartRaid or _G.Auto_Next_Island or _G.Kill_Aura or _G.Auto_Start_Law_Dungeon or _G.AutoNevaSoulGuitar or _G.CursedChest or _G.BoneFarm or _G.FishBoat or _G.AutoAdvanceDungeon or _G.TerShark or _G.BrigadeShip or _G.SharkPir or _G.SendShip or _G.AutoSail or _G.AutoRemover or _G.AutoDoughtBoss or _G.Auto_DungeonMobAura or _G.AutoFarmChest or _G.AutoFarmBossHallow or _G.AutoFarmSwanGlasses or _G.AutoLongSword or _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or _G.AutoFarmBoss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or _G.AutoSaber or _G.NoClip or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.AutoDarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoBounty or _G.AutoAllBoss or _G.Auto_Bounty or _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.GrabChest or _G.AutoFarmBounty or _G.Holy_Torch or _G.AutoFarm or _G.Clip or _G.AutoElitehunter or _G.AutoThirdSea or _G.Auto_Bone == true then
    local l_1 = l_18()
    local l_0, descendants, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        local a = l_4.IsA(l_4, "BasePart")
        if a then
          l_4.CanCollide = false
        end
      end
    end
  end
end)
end)
end)
spawn(function()
  while r0 do
    if _G.Auto_StartRaid or _G.Auto_Next_Island or _G.Kill_Aura or _G.Auto_Start_Law_Dungeon or _G.AutoDoughtBoss or _G.Auto_DungeonMobAura or _G.AutoFarmChest or _G.AutoFarmBossHallow or _G.AutoFarmSwanGlasses or _G.AutoLongSword or _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or _G.AutoFarmBoss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or _G.AutoSaber or _G.NOCLIP or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.AutoDarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoAllBoss or _G.Auto_Bounty or _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.AutoFarm or _G.Clip or _G.AutoElitehunter or _G.AutoThirdSea or _G.Auto_Bone == true then
    end
  end
  pcall(function()
  service_9.Remotes.CommE.FireServer(service_9.Remotes.CommE, "Ken", true)
end)
end)
spawn(function()
  while r0 do
    if _G.Auto_StartRaid or _G.Auto_Next_Island or _G.Kill_Aura or _G.Auto_Start_Law_Dungeon or _G.AutoHakiSpam or _G.AutoFarm or _G.AutoFarmFruitMastery or _G.AutoFarmSwanGlasses or _G.AutoFarmBossHallow or _G.AutoRaid or _G.BoneFarm or _G.AutoRemover or _G.AutoSail or _G.TerShark or _G.Sharky or _G.Piranas or _G.FishBoat or _G.BrigadeShip or _G.BrigadeShips or _G.Beast then
    end
  end
  pcall(function()
  AutoHaki()
end)
end)
spawn(function()
  service_4.Stepped.Connect(service_4.Stepped, function()
  if _G.Auto_StartRaid or _G.Auto_Next_Island or _G.Kill_Aura or _G.Auto_Start_Law_Dungeon or _G.BoneFarm or _G.AutoRemover or _G.AutoSail or _G.TerShark or _G.Sharky or _G.Piranas or _G.FishBoat or _G.BrigadeShip or _G.BrigadeShips or _G.Beast then
    local l_0 = l_18()
    if not l_0.FindFirstChild(l_0, "Humanoid") then
      setfflag("HumanoidParallelRemoveNoPhysics", "False")
      setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
      setfflag("CrashPadUploadToBacktraceToBacktraceBaseUrl", "")
      setfflag("CrashUploadToBacktracePercentage", "0")
      setfflag("CrashUploadToBacktraceBlackholeToken", "")
      setfflag("CrashUploadToBacktraceWindowsPlayerToken", "")
      l_19().ChangeState(l_19(), 11)
    end
  end
end)
end)
spawn(function()
  while r0 do
    pcall(function()
  if AutoSail or AutoFarmTerrorShark or AutoFarmFish or AutoFarmSeaBeast or AutoFarmGhostBoats or LevelFarmNoQuest or LevelFarmQuest or Farm_Bone or Farm_Ectoplasm or Nearest_Farm or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or Auto_Farm_Material or AutoFarmBossNoQuest or AutoFarmBossQuest or GunMastery_Farm or DevilMastery_Farm or AutoKenV2 or AutoFarmKen or AutoNextIsland or BossRaid or _G.Teleport_to_Player or _G.Clip or _G.Auto_Kill_Player_Melee or _G.Auto_Kill_Player_Gun or TeleporttoMirage or TeleporttoGear or _G.Auto_Teleport_Fruit or AutoSecondWorld or AutoThirdWorld or AutoDeathStep or AutoSuperhuman or AutoSharkman or AutoElectricClaw or AutoDragonTalon or AutoGodhuman or AutoSaber or AutoRengoku or AutoBuddySword or AutoPole or AutoYama or AutoCavander or AutoTushita or Auto_Cursed_Dual_Katana or Auto_Quest_Yama_1 or Auto_Quest_Yama_2 or Auto_Quest_Yama_3 or Auto_Quest_Tushita_1 or Auto_Quest_Tushita_2 or Auto_Quest_Tushita_3 or AutoEliteHunter or AutoCakePrince or _G.AutoDoughKing or AutoDarkDagger or AutoHallowSycthe or AutoCitizen or AutoEvoRace or AutoBartilo or AutoFactory or _G.SwanGlasses or RipIndra or AutoRainbowHaki or AutoTorch or AutoSoulGuitar or AutoTryLuck or AutoPray or AutoAdvanceDungeon or AutoMusketeer or Auto_Serpent_Bow then
    local l_0 = l_20()
    if not l_0.FindFirstChild(l_0, "BodyClip") then
      Instance.new("BodyVelocity").Name = "BodyClip"
      local l_1 = l_20()
      Instance.new("BodyVelocity").Parent = l_1
      Instance.new("BodyVelocity").MaxForce = Vector3.new(100000, 100000, 100000)
      Instance.new("BodyVelocity").Velocity = Vector3.new(0, 0, 0)
    end
  elseif l_20().FindFirstChild(l_20(), "BodyClip") then
    l_20().FindFirstChild(l_20(), "BodyClip").Destroy(l_20().FindFirstChild(l_20(), "BodyClip"))
  end
end)
  end
end)
spawn(function()
  pcall(function()
  service_4.Stepped.Connect(service_4.Stepped, function()
  if AutoSail or AutoFarmTerrorShark or AutoFarmFish or AutoFarmSeaBeast or AutoFarmGhostBoats or LevelFarmNoQuest or LevelFarmQuest or Farm_Bone or Farm_Ectoplasm or Nearest_Farm or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or Auto_Farm_Material or AutoFarmBossNoQuest or AutoFarmBossQuest or GunMastery_Farm or DevilMastery_Farm or AutoKenV2 or AutoFarmKen or AutoNextIsland or BossRaid or _G.Teleport_to_Player or _G.Clip or _G.Auto_Kill_Player_Melee or _G.Auto_Kill_Player_Gun or TeleporttoMirage or TeleporttoGear or _G.Auto_Teleport_Fruit or AutoSecondWorld or AutoThirdWorld or AutoDeathStep or AutoSuperhuman or AutoSharkman or AutoElectricClaw or AutoDragonTalon or AutoGodhuman or AutoSaber or AutoRengoku or AutoBuddySword or AutoPole or AutoYama or AutoCavander or AutoTushita or Auto_Cursed_Dual_Katana or Auto_Quest_Yama_1 or Auto_Quest_Yama_2 or Auto_Quest_Yama_3 or Auto_Quest_Tushita_1 or Auto_Quest_Tushita_2 or Auto_Quest_Tushita_3 or AutoEliteHunter or AutoCakePrince or _G.AutoDoughKing or AutoDarkDagger or AutoHallowSycthe or AutoCitizen or AutoEvoRace or AutoBartilo or AutoFactory or _G.SwanGlasses or RipIndra or AutoRainbowHaki or AutoTorch or AutoSoulGuitar or AutoTryLuck or AutoPray or AutoAdvanceDungeon or AutoMusketeer or Auto_Serpent_Bow then
    local l_1 = l_18()
    local l_0, descendants, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        local a = l_4.IsA(l_4, "BasePart")
        if a then
          l_4.CanCollide = false
        end
      end
    end
  end
end)
end)
end)
tab_2.CraftPage(tab_2, "Level Farm", 1).Toggle(tab_2.CraftPage(tab_2, "Level Farm", 1), "Auto Farm Level", LevelFarmQuest, function(a0)
  LevelFarmQuest = a0
  _G.SelectMonster = nil
  CancelTween(LevelFarmQuest)
end)
tab_2.CraftPage(tab_2, "Level Farm", 1).Toggle(tab_2.CraftPage(tab_2, "Level Farm", 1), "Auto Farm Level No Quest", LevelFarmNoQuest, function(a0)
  LevelFarmNoQuest = a0
  _G.SelectMonster = nil
  CancelTween(LevelFarmNoQuest)
end)
tab_2.CraftPage(tab_2, "Level Farm", 1).Toggle(tab_2.CraftPage(tab_2, "Level Farm", 1), "Farm Near Monster", Nearest_Farm, function(a0)
  Nearest_Farm = a0
  CancelTween(Nearest_Farm)
end)
if First_Sea then
  tab_2.CraftPage(tab_2, "Level Farm", 1).Toggle(tab_2.CraftPage(tab_2, "Level Farm", 1), "Auto Second World [Lv. 700]", AutoSecondWorld, function(a0)
  AutoSecondWorld = a0
  CancelTween(AutoSecondWorld)
end)
elseif Second_Sea then
  tab_2.CraftPage(tab_2, "Level Farm", 1).Toggle(tab_2.CraftPage(tab_2, "Level Farm", 1), "Auto Third World [Lv. 1500]", AutoThirdWorld, function(a0)
  AutoThirdWorld = a0
  CancelTween(AutoThirdWorld)
end)
end
spawn(function()
  while r0 do
    if LevelFarmQuest then
    end
  end
  pcall(function()
  CheckLevel()
  local find = string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon)
  if not find or service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
    service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "AbandonQuest")
    if l_63 then
      BTP(CFrameQ)
    elseif not l_63 then
      Tween(CFrameQ)
    end
    local l_1 = l_20()
    if (CFrameQ.Position - l_1.Position).Magnitude <= 5 then
      task.wait(1)
      service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "StartQuest", NameQuest, QuestLv)
    end
  elseif (string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == true) and game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, Ms) then
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
        task.wait()
        EquipTool(SelectWeaponFarm)
        Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
        l_4.HumanoidRootPart.CanCollide = false
        local new = Vector3.new(60, 60, 60)
        l_4.HumanoidRootPart.Size = new
        l_4.HumanoidRootPart.Transparency = 1
        l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
        l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
        Level_Farm_Name = l_4.Name
        Level_Farm_CFrame = l_4.HumanoidRootPart.CFrame
        AutoClick()
        if not (not find_first_child or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or l_4.Name ~= Ms or not LevelFarmQuest or not l_4.Parent or l_4.Humanoid.Health <= 0 or not game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, l_4.Name) or service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == false) then
          Tween(CFrameMon)
        end
      end
    end
  end
end)
end)
spawn(function()
  while r0 do
    if LevelFarmNoQuest then
    end
  end
  pcall(function()
  CheckLevel()
  local find_first_child = game.Workspace.Enemies.FindFirstChild(game.Workspace.Enemies, Ms)
  if find_first_child then
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
        task.wait()
        EquipTool(SelectWeaponFarm)
        Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
        l_4.HumanoidRootPart.CanCollide = false
        local new = Vector3.new(60, 60, 60)
        l_4.HumanoidRootPart.Size = new
        l_4.HumanoidRootPart.Transparency = 1
        l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
        l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
        Level_Farm_Name = l_4.Name
        Level_Farm_CFrame = l_4.HumanoidRootPart.CFrame
        AutoClick()
        if l_4.Name ~= Ms or not find_first_child or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or not LevelFarmNoQuest or not l_4.Parent or l_4.Humanoid.Health <= 0 or not game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, l_4.Name) then
        elseif l_63 then
          BTP(CFrameMon)
        elseif not l_63 then
          Tween(CFrameMon)
        end
      end
    end
  end
end)
end)
BoneCheck = tab_2.CraftPage(tab_2, "Other Farm", 1).Label(tab_2.CraftPage(tab_2, "Other Farm", 1), "Your Bone: Third World ")
spawn(function()
  while r0 do
    pcall(function()
  local invoke_server = service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "Bones", "Check")
  BoneCheck.Set(BoneCheck, "Your Bone: " .. invoke_server)
end)
  end
end)
tab_2.CraftPage(tab_2, "Other Farm", 1).Toggle(tab_2.CraftPage(tab_2, "Other Farm", 1), "Buy Random Surprise (Bone)", Auto_Trade_Bone, function(a0)
  Auto_Trade_Bone = a0
  while r1 do
    task.wait()
    service_9.Remotes.CommF_.InvokeServer()
  end
end)
tab_2.CraftPage(tab_2, "Other Farm", 1).Toggle(tab_2.CraftPage(tab_2, "Other Farm", 1), "Auto Farm Bones", Farm_Bone, function(a0)
  Farm_Bone = a0
  CancelTween(Farm_Bone)
end)
spawn(function()
  while r0 do
    if Farm_Bone then
    end
  end
  pcall(function()
  local new = CFrame.new(-9508.5673828125, 142.1398468017578, 5737.3603515625)
  if l_63 then
    BTP(new)
  elseif not l_63 then
    Tween(new)
  end
  local l_1, children, l_3 = pairs()
  for l_4, l_5 in l_1 do
    for l_4, l_5 in l_1 do
      local find_first_child = l_5.FindFirstChild(l_5, "Humanoid")
      if find_first_child then
        if l_5.FindFirstChild(l_5, "HumanoidRootPart") and (0 < l_5.Humanoid.Health and (l_5.Name == "Reborn Skeleton" or l_5.Name == "Living Zombie" or l_5.Name == "Demonic Soul" or l_5.Name == "Posessed Mummy")) then
          while l_5.Name do
            if not l_5.Parent or l_5.Humanoid.Health <= 0 or not game.Workspace.Enemies.FindFirstChild(game.Workspace.Enemies, l_5.Name) then
              local l_1, children, l_3 = pairs()
            else
              task.wait()
              EquipTool(SelectWeaponFarm)
              Tween(l_5.HumanoidRootPart.CFrame * Farm_Mode)
              l_5.HumanoidRootPart.CanCollide = false
              local new_1 = Vector3.new(60, 60, 60)
              l_5.HumanoidRootPart.Size = new_1
              l_5.HumanoidRootPart.Transparency = 1
              l_5.Humanoid.ChangeState(l_5.Humanoid, 11)
              l_5.Humanoid.ChangeState(l_5.Humanoid, 14)
              Bone_Farm_Name = l_5.Name
              Bone_Farm_CFrame = l_5.HumanoidRootPart.CFrame
              AutoClick()
              if not Farm_Bone or not l_5.Parent or l_5.Humanoid.Health <= 0 or not game.Workspace.Enemies.FindFirstChild(game.Workspace.Enemies, l_5.Name) then
              end
            end
          end
        end
      end
    end
  end
  for l_4, l_5 in l_1 do
    if l_5.Name == "Reborn Skeleton" or (l_5.Name == "Living Zombie" or (l_5.Name == "Demonic Soul" or l_5.Name == "Posessed Mummy")) then
      Tween(l_5.HumanoidRootPart.CFrame * Farm_Mode)
    end
    for l_4, l_5 in l_1 do
    end
  end
end)
end)
tab_2.CraftPage(tab_2, "Other Farm", 1).Toggle(tab_2.CraftPage(tab_2, "Other Farm", 1), "Auto Farm Ectoplasm", Farm_Ectoplasm, function(a0)
  Farm_Ectoplasm = a0
  CancelTween(Farm_Ectoplasm)
end)
spawn(function()
  while r0 do
    if Farm_Ectoplasm then
    end
  end
  pcall(function()
  local new = CFrame.new(904.4072265625, 181.05767822266, 33341.38671875)
  if l_63 then
    BTP(new)
  elseif not l_63 then
    Tween(new)
  end
  local new_1 = Vector3.new(904.4072265625, 181.05767822266, 33341.38671875)
  local l_2 = l_20()
  if 20000 < (new_1 - l_2.Position).Magnitude then
    service_9.Remotes.CommF_.InvokeServer()
    local service = game.GetService(game, "Workspace")
    local l_2, children, l_4 = pairs()
  end
  for l_5, l_6 in l_2 do
    local find_first_child = l_6.FindFirstChild(l_6, "Humanoid")
    if find_first_child and (l_6.FindFirstChild(l_6, "HumanoidRootPart") and 0 < l_6.Humanoid.Health) then
      if l_6.Name == "Ship Steward" or l_6.Name == "Ship Engineer" or l_6.Name == "Ship Deckhand" or l_6.Name == "Ship Officer" then
        while l_6.Name do
          if not l_6.Parent or l_6.Humanoid.Health <= 0 or not game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, l_6.Name) then
            for l_5, l_6 in l_2 do
            end
            local l_2, children, l_4 = pairs()
          else
            task.wait()
            EquipTool(SelectWeaponFarm)
            Tween(l_6.HumanoidRootPart.CFrame * Farm_Mode)
            l_6.HumanoidRootPart.CanCollide = false
            local new_1 = Vector3.new(60, 60, 60)
            l_6.HumanoidRootPart.Size = new_1
            l_6.HumanoidRootPart.Transparency = 1
            l_6.Humanoid.ChangeState(l_6.Humanoid, 11)
            l_6.Humanoid.ChangeState(l_6.Humanoid, 14)
            Ecto_Farm_Name = l_6.Name
            Ecto_Farm_CFrame = l_6.HumanoidRootPart.CFrame
            AutoClick()
            if not Farm_Ectoplasm or not l_6.Parent or l_6.Humanoid.Health <= 0 or not game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, l_6.Name) then
              for l_5, l_6 in l_2 do
              end
            else
              for l_5, l_6 in l_2 do
              end
            end
          end
        end
        for l_5, l_6 in l_2 do
        end
      else
        for l_5, l_6 in l_2 do
        end
      end
    end
    for l_5, l_6 in l_2 do
    end
  end
  for l_5, l_6 in l_2 do
    for l_5, l_6 in l_2 do
    end
    if l_6.Name == "Ship Steward" or (l_6.Name == "Ship Engineer" or (l_6.Name == "Ship Deckhand" or l_6.Name == "Ship Officer")) then
      Tween(l_6.HumanoidRootPart.CFrame * Farm_Mode)
    end
    for l_5, l_6 in l_2 do
    end
  end
end)
end)
spawn(function()
  while r0 do
    if Nearest_Farm then
    end
  end
  pcall(function()
  local l_0, children, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
      task.wait()
      EquipTool(SelectWeaponFarm)
      Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
      l_4.HumanoidRootPart.CanCollide = false
      local new = Vector3.new(60, 60, 60)
      l_4.HumanoidRootPart.Size = new
      l_4.HumanoidRootPart.Transparency = 1
      l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
      l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
      Nearest_Farm_Name = l_4.Name
      Nearest_Farm_CFrame = l_4.HumanoidRootPart.CFrame
      AutoClick()
      if not find_first_child or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or not l_4.Name or (l_20().Position - l_4.HumanoidRootPart.Position).Magnitude > 1000 or not Nearest_Farm or not l_4.Parent or l_4.Humanoid.Health <= 0 or not game.Workspace.Enemies.FindFirstChild(game.Workspace.Enemies, l_4.Name) then
      end
    end
  end
end)
end)
tab_2.CraftPage(tab_2, "Farm Monster", 1).Dropdown(tab_2.CraftPage(tab_2, "Farm Monster", 1), "Select Monster", tableMon, "", function(a0)
  _G.SelectMonster = a0
end)
tab_2.CraftPage(tab_2, "Farm Monster", 1).Toggle(tab_2.CraftPage(tab_2, "Farm Monster", 1), "Auto Farm Select (Quest)", SelectMonster_Quest_Farm, function(a0)
  SelectMonster_Quest_Farm = a0
  CancelTween(SelectMonster_Quest_Farm)
end)
spawn(function()
  while r0 do
    if SelectMonster_Quest_Farm then
    end
  end
  pcall(function()
  CheckLevel(_G.SelectMonster)
  local find = string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon)
  if not find or service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
    service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "AbandonQuest")
    if l_63 then
      BTP(CFrameQ)
    elseif not l_63 then
      Tween(CFrameQ)
    end
    local l_1 = l_20()
    if (CFrameQ.Position - l_1.Position).Magnitude <= 5 then
      service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "StartQuest", NameQuest, QuestLv)
    end
  elseif (string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == true) and game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, Ms) then
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
        task.wait()
        EquipTool(SelectWeaponFarm)
        Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
        l_4.HumanoidRootPart.CanCollide = false
        local new = Vector3.new(60, 60, 60)
        l_4.HumanoidRootPart.Size = new
        l_4.HumanoidRootPart.Transparency = 1
        l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
        l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
        SelectMonster_Farm_Name = l_4.Name
        SelectMonster_Farm_CFrame = l_4.HumanoidRootPart.CFrame
        AutoClick()
        if not (not find_first_child or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or l_4.Name ~= Ms or not SelectMonster_Quest_Farm or not l_4.Parent or l_4.Humanoid.Health <= 0 or not game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, l_4.Name) or service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == false) then
          Tween(CFrameMon)
        end
      end
    end
  end
end)
end)
tab_2.CraftPage(tab_2, "Farm Monster", 1).Toggle(tab_2.CraftPage(tab_2, "Farm Monster", 1), "Auto Farm Select (No Quest)", SelectMonster_NoQuest_Farm, function(a0)
  SelectMonster_NoQuest_Farm = a0
  CancelTween(SelectMonster_NoQuest_Farm)
end)
spawn(function()
  while r0 do
    if SelectMonster_NoQuest_Farm then
    end
  end
  pcall(function()
  CheckLevel(_G.SelectMonster)
  if l_63 then
    BTP(CFrameQ)
  elseif not l_63 then
    Tween(CFrameQ)
  end
  local service = game.GetService(game, "Workspace")
  if service.Enemies.FindFirstChild(service.Enemies, Ms) then
    local service = game.GetService(game, "Workspace")
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
        task.wait()
        EquipTool(SelectWeaponFarm)
        Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
        l_4.HumanoidRootPart.CanCollide = false
        local new = Vector3.new(60, 60, 60)
        l_4.HumanoidRootPart.Size = new
        l_4.HumanoidRootPart.Transparency = 1
        l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
        l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
        SelectMonster_Farm_Name = l_4.Name
        SelectMonster_Farm_CFrame = l_4.HumanoidRootPart.CFrame
        AutoClick()
        if not (not find_first_child or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or l_4.Name ~= Ms or not SelectMonster_NoQuest_Farm or not l_4.Parent or l_4.Humanoid.Health <= 0 or not game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, l_4.Name)) then
          Tween(CFrameMon)
        end
      end
    end
  end
end)
end)
if First_Sea then
  MaterialList = {
    "Scrap Metal",
    "Leather",
    "Angel Wings",
    "Magma Ore",
    "Fish Tail"
  }
elseif Second_Sea then
  MaterialList = {
    "Scrap Metal",
    "Leather",
    "Radioactive Material",
    "Mystic Droplet",
    "Magma Ore",
    "Vampire Fang"
  }
elseif Third_Sea then
  MaterialList = {
    "Scrap Metal",
    "Leather",
    "Demonic Wisp",
    "Conjured Cocoa",
    "Dragon Scale",
    "Gunpowder",
    "Fish Tail",
    "Mini Tusk"
  }
end
tab_2.CraftPage(tab_2, "Material Farm", 1).Dropdown(tab_2.CraftPage(tab_2, "Material Farm", 1), "Select Material", MaterialList, "", function(a0)
  SelectMaterial = a0
end)
tab_2.CraftPage(tab_2, "Material Farm", 1).Toggle(tab_2.CraftPage(tab_2, "Material Farm", 1), "Auto Farm Material", Auto_Farm_Material, function(a0)
  Auto_Farm_Material = a0
  CancelTween(Auto_Farm_Material)
end)
spawn(function()
  while r0 do
    if Auto_Farm_Material then
    end
  end
  pcall(function()
  MaterialMon(SelectMaterial)
  if l_63 then
    BTP(MPos)
  elseif not l_63 then
    Tween(MPos)
  end
  local l_0, children, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
      task.wait()
      EquipTool(SelectWeaponFarm)
      Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
      l_4.HumanoidRootPart.CanCollide = false
      local new = Vector3.new(60, 60, 60)
      l_4.HumanoidRootPart.Size = new
      l_4.HumanoidRootPart.Transparency = 1
      l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
      l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
      Material_Farm_Name = l_4.Name
      Material_Farm_CFrame = l_4.HumanoidRootPart.CFrame
      AutoClick()
      if not find_first_child or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or l_4.Name ~= MMon or not Auto_Farm_Material or not l_4.Parent or l_4.Humanoid.Health <= 0 or not game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, l_4.Name) then
      end
    end
  end
end)
end)
local craft_page_5 = tab_2.CraftPage(tab_2, "Mastery Farm", 2)
KillPercent = 25
craft_page_5.Textbox(craft_page_5, "Health To Kill", KillPercent, function(a0)
  KillPercent = a0
end)
SelectedMethodMastery = "Quest"
craft_page_5.Dropdown(craft_page_5, "Select Method", {"Quest", "No Quest", "Nearest"}, "Quest", function(a0)
  SelectedMethodMastery = a0
end)
craft_page_5.Toggle(craft_page_5, "Auto Farm Devil Mastery", DevilMastery_Farm, function(a0)
  DevilMastery_Farm = a0
  CancelTween(DevilMastery_Farm)
end)
spawn(function()
  local getrawmetatable = getrawmetatable(game)
  setreadonly(getrawmetatable, false)
  local newcclosure = newcclosure(function(...)
  local getnamecallmethod = getnamecallmethod()
  local tostring = tostring(getnamecallmethod)
  if tostring == "FireServer" and tostring({}[1]) == "RemoteEvent" then
    if tostring({}[2]) ~= "true" and (tostring({}[2]) ~= "false" and UseSkill) then
      if type({}[2]) == "vector" then
      end
      return getrawmetatable.__namecall()
    end
    return
  end
  return getrawmetatable.__namecall()
  return
end)
  getrawmetatable.__namecall = newcclosure
end)
spawn(function()
  while r0 do
    if UseSkill then
    end
  end
  pcall(function()
  local service = game.GetService(game, "Workspace")
  local l_0, children, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      if l_4.Name == Mastery_Farm_Name then
        local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
        if find_first_child and (l_4.FindFirstChild(l_4, "HumanoidRootPart") and l_4.Humanoid.Health <= l_4.Humanoid.MaxHealth * KillPercent / 100) then
          while l_4.Humanoid.Health do
            l_18().FindFirstChild(l_18(), service_1.LocalPlayer.Data.DevilFruit.Value).MousePos.Value = PositionSkillMasteryDevilFruit
            if _G.SkillZ and 1 <= l_18().FindFirstChild(l_18(), service_1.LocalPlayer.Data.DevilFruit.Value).Level.Value then
              service_5.SendKeyEvent(service_5, true, "Z", false, game)
              task.wait(0.1)
              service_5.SendKeyEvent(service_5, false, "Z", false, game)
            end
            if _G.SkillX and 1 <= l_18().FindFirstChild(l_18(), service_1.LocalPlayer.Data.DevilFruit.Value).Level.Value then
              service_5.SendKeyEvent(service_5, true, "X", false, game)
              task.wait(0.1)
              service_5.SendKeyEvent(service_5, false, "X", false, game)
            end
            if _G.SkillC and 1 <= l_18().FindFirstChild(l_18(), service_1.LocalPlayer.Data.DevilFruit.Value).Level.Value then
              service_5.SendKeyEvent(service_5, true, "C", false, game)
              task.wait(0.1)
              service_5.SendKeyEvent(service_5, false, "C", false, game)
            end
            if _G.SkillV and 1 <= l_18().FindFirstChild(l_18(), service_1.LocalPlayer.Data.DevilFruit.Value).Level.Value then
              service_5.SendKeyEvent(service_5, true, "V", false, game)
              task.wait(0.1)
              service_5.SendKeyEvent(service_5, false, "V", false, game)
            end
            if _G.SkillF and 1 <= l_18().FindFirstChild(l_18(), service_1.LocalPlayer.Data.DevilFruit.Value).Level.Value then
              service_5.SendKeyEvent(service_5, true, "F", false, game)
              task.wait(0.1)
              service_5.SendKeyEvent(service_5, false, "F", false, game)
            end
            if not DevilMastery_Farm or not UseSkill or l_4.Humanoid.Health == 0 then
            end
          end
        end
      end
    end
  end
end)
end)
spawn(function()
  while r0 do
    if DevilMastery_Farm and SelectedMethodMastery == "Quest" then
      pcall(function()
  CheckLevel()
  local find = string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon)
  if not find or service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
    UseSkill = false
    service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "AbandonQuest")
    if l_63 then
      BTP(CFrameQ)
    elseif not l_63 then
      Tween(CFrameQ)
    end
    local l_1 = l_20()
    if (CFrameQ.Position - l_1.Position).Magnitude <= 5 then
      service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "StartQuest", NameQuest, QuestLv)
    end
  elseif (string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == true) and game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, Ms) then
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
        if find_first_child and (l_4.FindFirstChild(l_4, "HumanoidRootPart") and l_4.Name == Ms) then
          while l_4.Name <= Ms do
            UseSkill = true
            if not (not DevilMastery_Farm or not SelectedMethodMastery == "Quest" or not l_4.Parent or l_4.Humanoid.Health == 0 or service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, l_4.Name)) then
              task.wait()
              if l_4.Humanoid.Health <= l_4.Humanoid.MaxHealth * KillPercent / 100 then
                UseSkill = false
                EquipTool(SelectWeaponFarm)
                Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
                l_4.HumanoidRootPart.CanCollide = false
                local new = Vector3.new(60, 60, 60)
                l_4.HumanoidRootPart.Size = new
                l_4.HumanoidRootPart.Transparency = 1
                l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
                l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
                Mastery_Farm_Name = l_4.Name
                Mastery_Farm_CFrame = l_4.HumanoidRootPart.CFrame
                AutoClick()
              end
              Tween(CFrameMon)
            end
          end
        end
      end
    end
  end
end)
      if DevilMastery_Farm and SelectedMethodMastery == "No Quest" then
        UseSkill = false
        pcall(function()
  CheckLevel()
  if l_63 then
    BTP(CFrameQ)
  elseif not l_63 then
    Tween(CFrameQ)
  end
  local l_0, children, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
      if find_first_child and (l_4.FindFirstChild(l_4, "HumanoidRootPart") and l_4.Name == Ms) then
        while l_4.Name <= Ms do
          UseSkill = true
          if not DevilMastery_Farm or not SelectedMethodMastery == "Quest" or not l_4.Parent or l_4.Humanoid.Health == 0 or not game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, l_4.Name) then
          end
        end
      end
    end
  end
end)
        if DevilMastery_Farm and SelectedMethodMastery == "Nearest" then
          UseSkill = false
          pcall(function()
  local l_0, children, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      if l_4.Name then
        local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
        if find_first_child and l_4.FindFirstChild(l_4, "HumanoidRootPart") then
          local find_first_child = l_4.FindFirstChild(l_4, "HumanoidRootPart")
          if (l_20().Position - find_first_child.Position).Magnitude <= 2000 then
            while (l_20().Position - find_first_child.Position).Magnitude <= find_first_child.Position do
              UseSkill = true
              if not DevilMastery_Farm or not SelectedMethodMastery == "Nearest" or not l_4.Parent or l_4.Humanoid.Health == 0 or not game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, l_4.Name) then
              end
            end
          end
        end
      end
    end
  end
end)
        end
      end
    end
  end
  UseSkill = false
end)
craft_page_5.Toggle(craft_page_5, "Auto Farm Gun Mastery", GunMastery_Farm, function(a0)
  GunMastery_Farm = a0
  CancelTween(GunMastery_Farm)
end)
spawn(function()
  pcall(function()
  while r0 do
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        if not task.wait() then
        end
        local a = l_4.IsA(l_4, "Tool")
        if a and l_4.FindFirstChild(l_4, "RemoteFunctionShoot") then
          CurrentEquipGun = l_4.Name
        end
      end
    end
  end
end)
end)
spawn(function()
  service_4.RenderStepped.Connect(service_4.RenderStepped, function()
  if UseGunMastery then
    pcall(function()
  CheckLevel()
  local service = game.GetService(game, "Workspace")
  local l_0, children, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      if l_4.Name == Ms then
        local l_5 = l_18()
        l_5[CurrentEquipGun].RemoteFunctionShoot.InvokeServer(l_5[CurrentEquipGun].RemoteFunctionShoot, l_4.HumanoidRootPart.Position, l_4.HumanoidRootPart)
        l_18()[CurrentEquipGun].Cooldown.Value = 0
        if l_4.Name == _G.SelectMonster then
          l_18()[CurrentEquipGun].RemoteFunctionShoot.InvokeServer(l_18()[CurrentEquipGun].RemoteFunctionShoot, l_4.HumanoidRootPart.Position, l_4.HumanoidRootPart)
          l_18()[CurrentEquipGun].Cooldown.Value = 0
        end
      end
    end
  end
end)
  end
end)
end)
spawn(function()
  while r0 do
    if GunMastery_Farm and SelectedMethodMastery == "Quest" then
      pcall(function()
  CheckLevel()
  local find = string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon)
  if not find or service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
    UseGunMastery = false
    service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "AbandonQuest")
    if l_63 then
      BTP(CFrameQ)
    elseif not l_63 then
      Tween(CFrameQ)
    end
    local l_1 = l_20()
    if (CFrameQ.Position - l_1.Position).Magnitude <= 5 then
      service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "StartQuest", NameQuest, QuestLv)
    end
  elseif (string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == true) and game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, Ms) then
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
        if find_first_child and (l_4.FindFirstChild(l_4, "HumanoidRootPart") and l_4.Name == Ms) then
          while l_4.Name <= Ms do
            EquipTool(CurrentEquipGun)
            l_18()[CurrentEquipGun].Cooldown.Value = 0
            UseGunMastery = true
            AutoClick()
            if not (not GunMastery_Farm or not SelectedMethodMastery == "Quest" or not l_4.Parent or l_4.Humanoid.Health == 0 or service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, l_4.Name)) then
              task.wait()
              if l_4.Humanoid.Health <= l_4.Humanoid.MaxHealth * KillPercent / 100 then
                UseGunMastery = false
                EquipTool(SelectWeaponFarm)
                Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
                l_4.HumanoidRootPart.CanCollide = false
                local new = Vector3.new(60, 60, 60)
                l_4.HumanoidRootPart.Size = new
                l_4.HumanoidRootPart.Transparency = 1
                l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
                l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
                Mastery_Farm_Name = l_4.Name
                Mastery_Farm_CFrame = l_4.HumanoidRootPart.CFrame
                AutoClick()
              end
              Tween(CFrameMon)
            end
          end
        end
      end
    end
  end
end)
      if GunMastery_Farm and SelectedMethodMastery == "No Quest" then
        UseGunMastery = false
        pcall(function()
  CheckLevel()
  if l_63 then
    BTP(CFrameQ)
  elseif not l_63 then
    Tween(CFrameQ)
  end
  local l_0, children, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
      if find_first_child and (l_4.FindFirstChild(l_4, "HumanoidRootPart") and l_4.Name == Ms) then
        while l_4.Name <= Ms do
          EquipTool(CurrentEquipGun)
          l_18()[CurrentEquipGun].Cooldown.Value = 0
          UseGunMastery = true
          AutoClick()
          if not GunMastery_Farm or not SelectedMethodMastery == "Quest" or not l_4.Parent or l_4.Humanoid.Health == 0 or not game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, l_4.Name) then
          end
        end
      end
    end
  end
end)
        if GunMastery_Farm and SelectedMethodMastery == "Nearest" then
          UseGunMastery = false
          pcall(function()
  local l_0, children, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      if l_4.Name then
        local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
        if find_first_child and l_4.FindFirstChild(l_4, "HumanoidRootPart") then
          local find_first_child = l_4.FindFirstChild(l_4, "HumanoidRootPart")
          if (l_20().Position - find_first_child.Position).Magnitude <= 2000 then
            while (l_20().Position - find_first_child.Position).Magnitude <= find_first_child.Position do
              EquipTool(CurrentEquipGun)
              l_18()[CurrentEquipGun].Cooldown.Value = 0
              UseGunMastery = true
              AutoClick()
              if not GunMastery_Farm or not SelectedMethodMastery == "Nearest" or not l_4.Parent or l_4.Humanoid.Health == 0 or not game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, l_4.Name) then
              end
            end
          end
        end
      end
    end
  end
end)
        end
      end
    end
  end
  UseGunMastery = false
end)
local craft_page_6 = tab_2.CraftPage(tab_2, "Boss Farm", 2)
local l_78, children, l_80 = pairs()
for l_81, l_82 in l_78 do
  for l_81, l_82 in l_78 do
    while l_0 do
    end
    for l_28, l_29 in l_25 do
    end
    for craft_page_7, craft_page_7 in l_68 do
    end
    local find = table.find({
      "The Gorrila King",
      "Bobby",
      "The Saw",
      "Yeti",
      "Mob Leader",
      "Vice Admiral",
      "Saber Expert",
      "Warden",
      "Chief Warden",
      "Swan",
      "Magma Admiral",
      "Fishman Lord",
      "Wysper",
      "Thunder God",
      "Cyborg",
      "Ice Admiral",
      "Greybeard",
      "Diamond",
      "Jeremy",
      "Fajita",
      "Don Swan",
      "Smoke Admiral",
      "Awakened Ice Admiral",
      "Tide Keeper",
      "Darkbeard",
      "Cursed Captain",
      "Order",
      "Stone",
      "Island Empress",
      "Kilo Admiral",
      "Captain Elephant",
      "Beautiful Pirate",
      "Cake Queen",
      "Longma",
      "Soul Reaper",
      "rip_indra True Form"
    }, l_82.Name)
    if find then
      table.insert({}, l_82.Name)
    end
  end
end
local l_76 = {
  "The Gorrila King",
  "Bobby",
  "The Saw",
  "Yeti",
  "Mob Leader",
  "Vice Admiral",
  "Saber Expert",
  "Warden",
  "Chief Warden",
  "Swan",
  "Magma Admiral",
  "Fishman Lord",
  "Wysper",
  "Thunder God",
  "Cyborg",
  "Ice Admiral",
  "Greybeard",
  "Diamond",
  "Jeremy",
  "Fajita",
  "Don Swan",
  "Smoke Admiral",
  "Awakened Ice Admiral",
  "Tide Keeper",
  "Darkbeard",
  "Cursed Captain",
  "Order",
  "Stone",
  "Island Empress",
  "Kilo Admiral",
  "Captain Elephant",
  "Beautiful Pirate",
  "Cake Queen",
  "Longma",
  "Soul Reaper",
  "rip_indra True Form"
}
local dropdown = craft_page_6.Dropdown(craft_page_6, "Select Boss", {}, "", function(a0)
  SelectBoss = a0
end)
craft_page_6.Button(craft_page_6, "Refresh Boss", function()
  local l_1, children, l_3 = pairs()
  for l_4, l_5 in l_1 do
    for l_4, l_5 in l_1 do
      local find = table.find(l_76, l_5.Name)
      if find then
        table.insert({}, l_5.Name)
      end
    end
  end
  dropdown.Add(dropdown, {})
end)
craft_page_6.Toggle(craft_page_6, "Auto Farm Boss (Quest)", AutoFarmBossQuest, function(a0)
  AutoFarmBossQuest = a0
  CancelTween(AutoFarmBossQuest)
end)
spawn(function()
  while r0 do
    if AutoFarmBossQuest then
    end
  end
  pcall(function()
  CheckBossQuest(SelectBoss)
  local find = string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss)
  if not find or service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
    service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "AbandonQuest")
    if l_63 then
      BTP(CFrameQBoss)
    elseif not l_63 then
      Tween(CFrameQBoss)
    end
    local l_1 = l_20()
    if (CFrameQBoss.Position - l_1.Position).Magnitude <= 5 then
      service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "StartQuest", NameQuestBoss, QuestLvBoss)
    end
  elseif (string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) or service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == true) and game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, SelectBoss) then
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
        task.wait()
        EquipTool(SelectWeaponFarm)
        Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
        l_4.HumanoidRootPart.CanCollide = false
        local new = Vector3.new(60, 60, 60)
        l_4.HumanoidRootPart.Size = new
        l_4.HumanoidRootPart.Transparency = 1
        l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
        l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
        AutoClick()
        if not (not find_first_child or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or l_4.Name ~= SelectBoss or not AutoFarmBossQuest or not l_4.Parent or l_4.Humanoid.Health <= 0 or not game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, l_4.Name) or service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == false) then
          Tween(CFrameBoss)
        end
      end
    end
  end
end)
end)
craft_page_6.Toggle(craft_page_6, "Auto Farm Boss (No Quest)", AutoFarmBossNoQuest, function(a0)
  AutoFarmBossNoQuest = a0
  CancelTween(AutoFarmBossNoQuest)
end)
spawn(function()
  while r0 do
    if AutoFarmBossNoQuest then
    end
  end
  pcall(function()
  CheckBossQuest(SelectBoss)
  if l_63 then
    BTP(CFrameBoss)
  elseif not l_63 then
    Tween(CFrameBoss)
  end
  local service = game.GetService(game, "Workspace")
  local l_0, children, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
      task.wait()
      EquipTool(SelectWeaponFarm)
      Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
      l_4.HumanoidRootPart.CanCollide = false
      local new = Vector3.new(60, 60, 60)
      l_4.HumanoidRootPart.Size = new
      l_4.HumanoidRootPart.Transparency = 1
      l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
      l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
      AutoClick()
      if not find_first_child or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or l_4.Name ~= SelectBoss or not AutoFarmBossNoQuest or not l_4.Parent or l_4.Humanoid.Health <= 0 or not game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, l_4.Name) then
      end
    end
  end
end)
end)
tab_2.CraftPage(tab_2, "Chest Farm", 2).Toggle(tab_2.CraftPage(tab_2, "Chest Farm", 2), "Auto Farm All Chest", _G.GrabChested, function(a0)
  _G.GrabChested = a0
end)
spawn(function()
  while r0 do
    if _G.GrabChested then
    end
  end
  pcall(function()
  local l_0 = l_18()
  local l_1, children, l_3 = pairs()
  for l_4, l_5 in l_1 do
    for l_4, l_5 in l_1 do
      if l_5.Name == "Chest1" or l_5.Name == "Chest2" or l_5.Name == "Chest3" then
        l_0.HumanoidRootPart.CFrame = l_5.CFrame
        task.wait(0.25)
      end
    end
  end
  local l_1, descendants, l_3 = pairs()
  for l_4, l_5 in l_1 do
    for l_4, l_5 in l_1 do
      if l_5.Name == "Chest1" or l_5.Name == "Chest2" or l_5.Name == "Chest3" then
        local a = l_5.IsA(l_5, "TouchTransmitter")
        if a then
          task.wait(0.25)
          firetouchinterest(l_0.HumanoidRootPart, l_5.Parent, 0)
          task.wait(0.25)
          firetouchinterest(l_0.HumanoidRootPart, l_5.Parent, 1)
        end
      end
    end
  end
end)
end)
spawn(function()
  while r0 do
    if _G.GrabChested then
    end
  end
  task.wait(20)
  local l_0 = l_18()
  l_0.Head.Destroy(l_0.Head)
  task.wait(20)
end)
tab_2.CraftPage(tab_2, "Chest Farm", 2).Toggle(tab_2.CraftPage(tab_2, "Chest Farm", 2), "Auto Farm All Chest + Hop", _G.GrabChestedHop, function(a0)
  _G.GrabChestedHop = a0
end)
spawn(function()
  while r0 do
    if _G.GrabChestedHop then
    end
  end
  pcall(function()
  local l_0 = l_18()
  local l_1, children, l_3 = pairs()
  for l_4, l_5 in l_1 do
    for l_4, l_5 in l_1 do
      if l_5.Name == "Chest1" or l_5.Name == "Chest2" or l_5.Name == "Chest3" then
        l_0.HumanoidRootPart.CFrame = l_5.CFrame
        task.wait(0.25)
      end
    end
  end
  local l_1, descendants, l_3 = pairs()
  for l_4, l_5 in l_1 do
    for l_4, l_5 in l_1 do
      if l_5.Name == "Chest1" or l_5.Name == "Chest2" or l_5.Name == "Chest3" then
        local a = l_5.IsA(l_5, "TouchTransmitter")
        if a then
          firetouchinterest(l_0.HumanoidRootPart, l_5.Parent, 0)
          task.wait(0.25)
          firetouchinterest(l_0.HumanoidRootPart, l_5.Parent, 1)
        end
        if not game.Workspace.FindFirstChild(game.Workspace, "Chest1") or not game.Workspace.FindFirstChild(game.Workspace, "Chest2") or not game.Workspace.FindFirstChild(game.Workspace, "Chest3") then
          pcall(function()
  Hop()
end)
        end
      end
    end
  end
end)
end)
spawn(function()
  while r0 do
    if _G.GrabChestedHop then
    end
  end
  task.wait(10)
  local l_0 = l_18()
  l_0.Head.Destroy(l_0.Head)
  task.wait(10)
end)
local label = tab_2.CraftPage(tab_2, "Observation Farm", 2).Label(tab_2.CraftPage(tab_2, "Observation Farm", 2), "")
spawn(function()
  while r0 do
    local tostring = tostring(service_1.LocalPlayer.VisionRadius.Value)
    label.Set(label, "Observation Level : " .. tostring)
  end
end)
tab_2.CraftPage(tab_2, "Observation Farm", 2).Toggle(tab_2.CraftPage(tab_2, "Observation Farm", 2), "Auto Farm Observation", AutoFarmKen, function(a0)
  AutoFarmKen = a0
  CancelTween(AutoFarmKen)
end)

local l_21 = function(a0, a1, a2)
  service_11.SetCore(service_11, "SendNotification", {Title = a0, Text = a1, Duration = a2})
end

spawn(function()
  while r0 do
    if AutoFarmKen then
    end
  end
  pcall(function()
  if 3000 <= service_1.LocalPlayer.VisionRadius.Value then
    l_21("Observation", "Your points observation is max.", 3)
  elseif Second_Sea then
    local service = game.GetService(game, "Workspace")
    if service.Enemies.FindFirstChild(service.Enemies, "Lava Pirate [Lv. 1200]") and service_1.LocalPlayer.PlayerGui.ScreenGui.FindFirstChild(service_1.LocalPlayer.PlayerGui.ScreenGui, "ImageLabel") then
      while service_1.LocalPlayer.PlayerGui.ScreenGui.FindFirstChild(service_1.LocalPlayer.PlayerGui.ScreenGui, "ImageLabel") ~= false do
        if service_1.LocalPlayer.PlayerGui.ScreenGui.FindFirstChild(service_1.LocalPlayer.PlayerGui.ScreenGui, "ImageLabel") then
          task.wait()
          local service = game.GetService(game, "Workspace")
          local new = CFrame.new(3, 0, 0)
          l_20().CFrame = service.Enemies.FindFirstChild(service.Enemies, "Lava Pirate").HumanoidRootPart.CFrame * new
          if AutoFarmKen ~= false then
            while not AutoFarmKen do
              service_10.Teleport(service_10, game.PlaceId, service_1.LocalPlayer)
              if AutoFarmKen ~= false then
                if not service_1.LocalPlayer.PlayerGui.ScreenGui.FindFirstChild(service_1.LocalPlayer.PlayerGui.ScreenGui, "ImageLabel") then
                  task.wait()
                  l_20().CFrame = game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(0, 50, 0) + task.wait(1)
                  if not service_1.LocalPlayer.PlayerGui.ScreenGui.FindFirstChild(service_1.LocalPlayer.PlayerGui.ScreenGui, "ImageLabel") then
                  end
                  Tween()
                end
                if game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Galley Captain [Lv. 650]") and service_1.LocalPlayer.PlayerGui.ScreenGui.FindFirstChild(service_1.LocalPlayer.PlayerGui.ScreenGui, "ImageLabel") then
                  while service_1.LocalPlayer.PlayerGui.ScreenGui.FindFirstChild(service_1.LocalPlayer.PlayerGui.ScreenGui, "ImageLabel") ~= false do
                    if service_1.LocalPlayer.PlayerGui.ScreenGui.FindFirstChild(service_1.LocalPlayer.PlayerGui.ScreenGui, "ImageLabel") then
                      task.wait()
                      l_20().CFrame = game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Galley Captain").HumanoidRootPart.CFrame * CFrame.new(3, 0, 0)
                      if AutoFarmKen ~= false then
                        while not AutoFarmKen do
                          service_10.Teleport(service_10, game.PlaceId, service_1.LocalPlayer)
                          if AutoFarmKen ~= false then
                            if not service_1.LocalPlayer.PlayerGui.ScreenGui.FindFirstChild(service_1.LocalPlayer.PlayerGui.ScreenGui, "ImageLabel") then
                              task.wait()
                              l_20().CFrame = game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Galley Captain").HumanoidRootPart.CFrame * CFrame.new(0, 50, 0)
                              task.wait(1)
                              if not service_1.LocalPlayer.PlayerGui.ScreenGui.FindFirstChild(service_1.LocalPlayer.PlayerGui.ScreenGui, "ImageLabel") then
                              end
                              Tween()
                            end
                            if game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Giant Islander [Lv. 1650]") and service_1.LocalPlayer.PlayerGui.ScreenGui.FindFirstChild(service_1.LocalPlayer.PlayerGui.ScreenGui, "ImageLabel") then
                              task.wait()
                              l_20().CFrame = game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Giant Islander").HumanoidRootPart.CFrame * CFrame.new(3, 0, 0)
                              if AutoFarmKen ~= false and service_1.LocalPlayer.PlayerGui.ScreenGui.FindFirstChild(service_1.LocalPlayer.PlayerGui.ScreenGui, "ImageLabel") then
                                task.wait()
                                l_20().CFrame = game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Giant Islander").HumanoidRootPart.CFrame * CFrame.new(0, 50, 0)
                                task.wait(1)
                                if not service_1.LocalPlayer.PlayerGui.ScreenGui.FindFirstChild(service_1.LocalPlayer.PlayerGui.ScreenGui, "ImageLabel") then
                                  service_10.Teleport(service_10, game.PlaceId, service_1.LocalPlayer)
                                  if AutoFarmKen ~= false and not service_1.LocalPlayer.PlayerGui.ScreenGui.FindFirstChild(service_1.LocalPlayer.PlayerGui.ScreenGui, "ImageLabel") then
                                    Tween()
                                  end
                                end
                              end
                            end
                          end
                        end
                        if Third_Sea then
                        end
                      end
                    end
                  end
                end
              end
            end
            if First_Sea then
            end
          end
        end
      end
    end
  end
end)
end)
tab_2.CraftPage(tab_2, "Observation Farm", 2).Toggle(tab_2.CraftPage(tab_2, "Observation Farm", 2), "Auto Observation V2", AutoKenV2, function(a0)
  AutoKenV2 = a0
  CancelTween(AutoKenV2)
end)
spawn(function()
  while r0 do
    if AutoKenV2 then
    end
  end
  pcall(function()
  local invoke_server = service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CitizenQuestProgress", "Citizen")
  if invoke_server == 3 then
    if service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Banana") and (service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Apple") and service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Pineapple")) then
      while service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Pineapple") do
        local new = Vector3.new(-12444.78515625, 332.40396118164, -7673.1806640625)
        if (l_20().Position - new).Magnitude <= 10 then
          task.wait(0.5)
          service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CitizenQuestProgress", "Citizen")
        else
          task.wait()
          Tween()
          if not AutoKenV2 or (l_20().Position - Vector3.new(-12444.78515625, 332.40396118164, -7673.1806640625)).Magnitude <= 10 then
          end
        end
      end
      if service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Fruit Bowl") or l_18().FindFirstChild(l_18(), "Fruit Bowl") then
        while l_18().FindFirstChild(l_18(), "Fruit Bowl") do
          if (l_20().Position - Vector3.new(-10920.125, 624.20275878906, -10266.995117188)).Magnitude <= 10 then
            task.wait(0.5)
            service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "KenTalk2", "Start")
            task.wait(1)
            service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "KenTalk2", "Buy")
          else
            task.wait()
            Tween()
            if not AutoKenV2 or (l_20().Position - Vector3.new(-10920.125, 624.20275878906, -10266.995117188)).Magnitude <= 10 then
              local l_0, descendants, service = pairs()
            end
          end
        end
      end
    end
    for l_3, l_4 in l_0 do
      if l_4.Name == "Apple" or l_4.Name == "Banana" or l_4.Name == "Pineapple" then
        local l_6 = l_20()
        local new = CFrame.new(0, 1, 10)
        l_4.Handle.CFrame = l_6.CFrame * new
        task.wait()
        firetouchinterest(l_20(), l_4.Handle, 0)
        task.wait()
      end
      for l_3, l_4 in l_0 do
      end
    end
  end
end)
end)
spawn(function()
  while r0 do
    if AutoSecondWorld then
    end
  end
  pcall(function()
  if 700 <= service_1.LocalPlayer.Data.Level.Value then
    local invoke_server = service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "DressrosaQuestProgress")
    if invoke_server.UsedKey == false then
      if not service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Key") or not l_18().FindFirstChild(l_18(), "Key") then
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "DressrosaQuestProgress", "Detective")
      elseif service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Key") or l_18().FindFirstChild(l_18(), "Key") then
        l_19().EquipTool(l_19(), service_1.LocalPlayer.Backpack.Key)
        if l_63 then
          BTP()
          local new = Vector3.new(30, 30, 30)
          game.GetService(game, "Workspace").Map.Ice.Door.Size = new
        elseif not l_63 then
          Tween()
          game.GetService(game, "Workspace").Map.Ice.Door.Size = Vector3.new(30, 30, 30)
        end
        if service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "DressrosaQuestProgress").KilledIceBoss == false then
          local l_0, children, l_2 = pairs()
          for l_3, l_4 in l_0 do
            for l_3, l_4 in l_0 do
              if service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "DressrosaQuestProgress").UsedKey == true then
                if l_4.Name == "Ice Admiral" then
                  EquipTool(SelectWeaponFarm)
                  Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
                  l_4.HumanoidRootPart.CanCollide = false
                  local new = Vector3.new(60, 60, 60)
                  l_4.HumanoidRootPart.Size = new
                  l_4.HumanoidRootPart.Transparency = 1
                  l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
                  l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
                  AutoClick()
                end
                local l_0, children, l_2 = pairs()
                for l_3, l_4 in l_0 do
                  for l_3, l_4 in l_0 do
                    if l_4.Name == "Ice Admiral" then
                      Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
                    end
                  end
                end
              end
            end
          end
          if service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "DressrosaQuestProgress").KilledIceBoss == true then
            service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "TravelDressrosa")
          end
        end
      end
    end
  end
end)
end)
spawn(function()
  while r0 do
    if AutoThirdWorld then
    end
  end
  pcall(function()
  if 1500 <= service_1.LocalPlayer.Data.Level.Value then
    local invoke_server = service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BartiloQuestProgress", "Bartilo")
    if invoke_server == 3 then
      if service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "GetUnlockables").FlamingoAccess == nil then
        if service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "ZQuestProgress", "Check") == nil and game.Workspace.Enemies.FindFirstChild(game.Workspace.Enemies, "rip_indra") then
          local l_0, children, l_2 = pairs()
          for l_3, l_4 in l_0 do
            for l_3, l_4 in l_0 do
              local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
              task.wait()
              EquipTool(SelectWeaponFarm)
              Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
              l_4.HumanoidRootPart.CanCollide = false
              local new = Vector3.new(60, 60, 60)
              l_4.HumanoidRootPart.Size = new
              l_4.HumanoidRootPart.Transparency = 1
              l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
              l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
              AutoClick()
              if not (l_4.Name ~= "rip_indra" or not find_first_child or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or not l_4.Parent or l_4.Humanoid.Health <= 0 or not AutoThirdWorld) then
                Tween()
              end
            end
          end
          if service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "ZQuestProgress", "Check") == 1 and game.Workspace.Enemies.FindFirstChild(game.Workspace.Enemies, "Don Swan") then
            local l_0, children, l_2 = pairs()
            for l_3, l_4 in l_0 do
              for l_3, l_4 in l_0 do
                task.wait()
                EquipTool(SelectWeaponFarm)
                Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
                l_4.HumanoidRootPart.CanCollide = false
                l_4.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                l_4.HumanoidRootPart.Transparency = 1
                l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
                l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
                AutoClick()
                if l_4.Name ~= "Don Swan" or not l_4.FindFirstChild(l_4, "Humanoid") or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or not l_4.Parent or l_4.Humanoid.Health <= 0 or not AutoThirdWorld then
                elseif l_63 then
                  BTP()
                else
                  Tween()
                end
              end
            end
          end
        end
        TabelDevilFruitStore = {}
        TabelDevilFruitOpen = {}
        local l_0, invoke_server, l_2 = pairs()
        for l_3, l_4 in l_0 do
          for l_3, l_4 in l_0 do
            local l_5, l_6, l_7 = pairs(l_4)
            for l_8, l_9 in l_5 do
              for l_8, l_9 in l_5 do
                if l_8 == "Name" then
                  table.insert(TabelDevilFruitStore, l_9)
                end
              end
            end
          end
        end
        l_0 = next
        local l_1, l_2 = service_9.WaitForChild(service_9, "Remotes").CommF_.InvokeServer(service_9.WaitForChild(service_9, "Remotes").CommF_, "GetFruits")
        for l_3, l_4 in l_0 do
          for l_3, l_4 in l_0 do
            if 1000000 <= l_4.Price then
              table.insert(TabelDevilFruitOpen, l_4.Name)
            end
          end
        end
        l_0 = pairs
        local l_0, l_1, l_2 = l_0(TabelDevilFruitOpen)
        for l_3, l_4 in l_0 do
          for l_3, l_4 in l_0 do
            local l_5, l_6, l_7 = pairs(TabelDevilFruitStore)
            for l_8, l_9 in l_5 do
              for l_8, l_9 in l_5 do
                if l_4 == l_9 then
                  local invoke_server = service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "GetUnlockables")
                  if invoke_server.FlamingoAccess == nil then
                    if not service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, l_9) then
                      service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "LoadFruit", l_9)
                    else
                      service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "TalkTrevor", "1")
                      service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "TalkTrevor", "2")
                      service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "TalkTrevor", "3")
                    end
                  end
                end
              end
            end
          end
        end
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "TalkTrevor", "1")
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "TalkTrevor", "2")
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "TalkTrevor", "3")
      elseif service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "GetUnlockables").FlamingoAccess == true then
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "TravelZou")
      end
      if string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") then
        if string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and (service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == true and game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Swan Pirate")) then
          local l_0, children, l_2 = pairs()
          for l_3, l_4 in l_0 do
            for l_3, l_4 in l_0 do
              if service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BartiloQuestProgress", "Bartilo") == 0 then
                task.wait()
                EquipTool(SelectWeaponFarm)
                Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
                l_4.HumanoidRootPart.CanCollide = false
                l_4.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                l_4.HumanoidRootPart.Transparency = 1
                l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
                l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
                AutoClick()
                if l_4.Name ~= "Swan Pirate" or not l_4.Parent or l_4.Humanoid.Health <= 0 or service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not AutoThirdWorld then
                elseif l_63 then
                  BTP()
                else
                  Tween()
                end
                service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "StartQuest", "BartiloQuest", 1)
              elseif service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BartiloQuestProgress", "Bartilo") == 1 then
                service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BartiloQuestProgress", "Bartilo")
                if game.Workspace.Enemies.FindFirstChild(game.Workspace.Enemies, "Jeremy") then
                  local l_0, children, l_2 = pairs()
                  for l_3, l_4 in l_0 do
                    for l_3, l_4 in l_0 do
                      task.wait()
                      EquipTool(SelectWeaponFarm)
                      Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
                      l_4.HumanoidRootPart.CanCollide = false
                      l_4.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                      l_4.HumanoidRootPart.Transparency = 1
                      l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
                      l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
                      AutoClick()
                      if not l_4.FindFirstChild(l_4, "Humanoid") or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or l_4.Name ~= "Jeremy" or not l_4.Parent or l_4.Humanoid.Health <= 0 or not AutoThirdWorld then
                      elseif l_63 then
                        BTP()
                      else
                        Tween()
                      end
                    end
                  end
                  if service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BartiloQuestProgress", "Bartilo") == 2 then
                    if 1500 < (l_20().Position - CFrameThird.Position).Magnitude then
                      if l_63 then
                        BTP()
                      else
                        Tween()
                      end
                    else
                      task.wait(1)
                      l_20().CFrame = CFrame.new(-1850.49329, 13.1789551, 1750.89685)
                      task.wait(1)
                      l_20().CFrame = CFrame.new(-1858.87305, 19.3777466, 1712.01807)
                      task.wait(1)
                      l_20().CFrame = CFrame.new(-1803.94324, 16.5789185, 1750.89685)
                      task.wait(1)
                      l_20().CFrame = CFrame.new(-1858.55835, 16.8604317, 1724.79541)
                      task.wait(1)
                      l_20().CFrame = CFrame.new(-1869.54224, 15.987854, 1681.00659)
                      task.wait(1)
                      l_20().CFrame = CFrame.new(-1800.0979, 16.4978027, 1684.52368)
                      task.wait(1)
                      l_20().CFrame = CFrame.new(-1819.26343, 14.795166, 1717.90625)
                      task.wait(1)
                      l_20().CFrame = CFrame.new(-1813.51843, 14.8604736, 1724.79541)
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end)
end)
tab_3.CraftPage(tab_3, "Fighting Style", 1).Toggle(tab_3.CraftPage(tab_3, "Fighting Style", 1), "Auto DeathStep", AutoDeathStep, function(a0)
  AutoDeathStep = a0
  CancelTween(AutoDeathStep)
  if AutoDeathStep then
    service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyBlackLeg")
  end
end)
spawn(function()
  while r0 do
    pcall(function()
  if AutoDeathStep then
    local l_0 = l_18()
    if not l_0.FindFirstChild(l_0, "Black Leg") or 400 > l_18().FindFirstChild(l_18(), "Black Leg").Level.Value then
      if service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Black Leg") and (400 <= service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Black Leg").Level.Value and game.GetService(game, "Workspace").Map.IceCastle.Hall.LibraryDoor.PhoeyuDoor.Transparency == 0) then
        Tween()
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyDeathStep")
        if l_18().FindFirstChild(l_18(), "Library Key") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Library Key") then
          EquipTool("Library Key")
          while EquipTool do
            BTP()
            local l_1 = l_20()
            if (CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375).Position - l_1.Position).Magnitude <= 3 or not AutoDeathStep then
              if (CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375).Position - l_20().Position).Magnitude <= 3 then
                task.wait(1.2)
                service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyDeathStep")
                task.wait(0.5)
              end
            else
              task.wait()
              if l_63 then
                Tween()
              end
              if (service_9.FindFirstChild(service_9, "Awakened Ice Admiral") or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Awakened Ice Admiral")) and game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Awakened Ice Admiral") then
                local l_0, children, l_2 = pairs()
                for l_3, l_4 in l_0 do
                  for l_3, l_4 in l_0 do
                    local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
                    task.wait()
                    EquipTool(SelectWeaponFarm)
                    Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
                    l_4.HumanoidRootPart.CanCollide = false
                    local new = Vector3.new(60, 60, 60)
                    l_4.HumanoidRootPart.Size = new
                    l_4.HumanoidRootPart.Transparency = 1
                    l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
                    l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
                    AutoClick()
                    if not find_first_child or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or l_4.Name ~= "Awakened Ice Admiral" or not l_4.Parent or l_4.Humanoid.Health <= 0 or AutoDeathStep == false or l_18().FindFirstChild(l_18(), "Library Key") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Library Key") then
                    elseif l_63 then
                      BTP(service_9.FindFirstChild(service_9, "Awakened Ice Admiral [Lv. 1400] [Boss]").HumanoidRootPart.CFrame)
                    else
                      Tween(service_9.FindFirstChild(service_9, "Awakened Ice Admiral [Lv. 1400] [Boss]").HumanoidRootPart.CFrame)
                    end
                  end
                end
                service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyBlackLeg")
              end
            end
          end
        end
      end
    end
  end
end)
  end
end)
tab_3.CraftPage(tab_3, "Fighting Style", 1).Toggle(tab_3.CraftPage(tab_3, "Fighting Style", 1), "Auto SuperHuman", AutoSuperhuman, function(a0)
  AutoSuperhuman = a0
  CancelTween(AutoSuperhuman)
  if AutoSuperhuman then
    service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuySuperhuman")
  end
end)
spawn(function()
  while r0 do
    if AutoSuperhuman then
    end
  end
  pcall(function()
  local find_first_child = service_1.LocalPlayer.FindFirstChild(service_1.LocalPlayer, "WeaponAssetCache")
  if find_first_child then
    if not service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Combat") and (l_18().FindFirstChild(l_18(), "Combat") and 150000 <= service_1.LocalPlayer.Data.Beli.Value) then
      service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyBlackLeg")
    end
    if l_18().FindFirstChild(l_18(), "Superhuman") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Superhuman") then
      SelectWeapon = "Superhuman"
      EquipTool(SelectWeapon)
    end
    if service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Black Leg") or l_18().FindFirstChild(l_18(), "Black Leg") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Electro") or l_18().FindFirstChild(l_18(), "Electro") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Fishman Karate") or l_18().FindFirstChild(l_18(), "Fishman Karate") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Dragon Claw") or l_18().FindFirstChild(l_18(), "Dragon Claw") then
      if service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Black Leg") and service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Black Leg").Level.Value <= 299 then
        SelectWeapon = "Black Leg"
        EquipTool(SelectWeapon)
      end
      if service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Electro") and service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Electro").Level.Value <= 299 then
        SelectWeapon = "Electro"
        EquipTool(SelectWeapon)
      end
      if service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Fishman Karate") and service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Fishman Karate").Level.Value <= 299 then
        SelectWeapon = "Fishman Karate"
        EquipTool(SelectWeapon)
      end
      if service_1.LocalPlayer.BackpacUnEquipWeaponk.FindFirstChild(service_1.LocalPlayer.BackpacUnEquipWeaponk, "Dragon Claw") and service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Dragon Claw").Level.Value <= 299 then
        SelectWeapon = "Dragon Claw"
        EquipTool(SelectWeapon)
      end
      if service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Black Leg") and 300 <= service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Black Leg").Level.Value and 300000 <= service_1.LocalPlayer.Data.Beli.Value then
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyElectro")
      end
      if l_18().FindFirstChild(l_18(), "Black Leg") and 300 <= l_18().FindFirstChild(l_18(), "Black Leg").Level.Value and 300000 <= service_1.LocalPlayer.Data.Beli.Value then
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyElectro")
      end
      if service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Electro") and 300 <= service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Electro").Level.Value and 750000 <= service_1.LocalPlayer.Data.Beli.Value then
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyFishmanKarate")
      end
      if l_18().FindFirstChild(l_18(), "Electro") and 300 <= l_18().FindFirstChild(l_18(), "Electro").Level.Value and 750000 <= service_1.LocalPlayer.Data.Beli.Value then
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyFishmanKarate")
      end
      if service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Fishman Karate") and 300 <= service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Fishman Karate").Level.Value and 1500 <= service_1.LocalPlayer.Data.Fragments.Value then
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BlackbeardReward", "DragonClaw", "1")
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BlackbeardReward", "DragonClaw", "2")
      end
      if l_18().FindFirstChild(l_18(), "Fishman Karate") and 300 <= l_18().FindFirstChild(l_18(), "Fishman Karate").Level.Value and 1500 <= service_1.LocalPlayer.Data.Fragments.Value then
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BlackbeardReward", "DragonClaw", "1")
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BlackbeardReward", "DragonClaw", "2")
      elseif service_1.LocalPlayer.Data.Fragments.Value <= 1499 then
        AutoSuperhuman = true
      else
        AutoSuperhuman = false
      end
      if service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Dragon Claw") and 300 <= service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Dragon Claw").Level.Value and 3000000 <= service_1.LocalPlayer.Data.Beli.Value then
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuySuperhuman")
      end
      if l_18().FindFirstChild(l_18(), "Dragon Claw") and 300 <= l_18().FindFirstChild(l_18(), "Dragon Claw").Level.Value and 3000000 <= service_1.LocalPlayer.Data.Beli.Value then
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuySuperhuman")
      end
    end
  end
end)
end)
tab_3.CraftPage(tab_3, "Fighting Style", 1).Toggle(tab_3.CraftPage(tab_3, "Fighting Style", 1), "Auto Sharkman Karate", AutoSharkman, function(a0)
  AutoSharkman = a0
  CancelTween(AutoSharkman)
  if AutoSharkman then
    service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuySharkmanKarate")
  end
end)
spawn(function()
  while r0 do
    pcall(function()
  if AutoSharkman then
    local l_0 = l_18()
    if (not l_0.FindFirstChild(l_0, "Fishman Karate") or 400 > l_18().FindFirstChild(l_18(), "Fishman Karate").Level.Value) and (service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Fishman Karate") and 400 <= service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Fishman Karate").Level.Value) then
      Tween()
      service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuySharkmanKarate")
      if l_18().FindFirstChild(l_18(), "Water Key") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Water Key") then
        while service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Water Key") > 3 do
          if not AutoSharkman then
            local l_1 = l_20()
            if (CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365).Position - l_1.Position).Magnitude <= 3 then
              task.wait(1.2)
              service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuySharkmanKarate")
              task.wait(0.5)
            end
          else
            task.wait()
            Tween()
            if ((CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365).Position - l_20().Position).Magnitude <= 3 or not AutoSharkman) and game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Tide Keeper") then
              local l_0, children, l_2 = pairs()
              for l_3, l_4 in l_0 do
                for l_3, l_4 in l_0 do
                  local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
                  task.wait()
                  EquipTool(SelectWeaponFarm)
                  Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
                  l_4.HumanoidRootPart.CanCollide = false
                  local new = Vector3.new(60, 60, 60)
                  l_4.HumanoidRootPart.Size = new
                  l_4.HumanoidRootPart.Transparency = 1
                  l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
                  l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
                  AutoClick()
                  if not find_first_child or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or l_4.Name ~= "Tide Keeper" or not l_4.Parent or l_4.Humanoid.Health <= 0 or AutoSharkman == false or l_18().FindFirstChild(l_18(), "Library Key") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Library Key") then
                  elseif l_63 then
                    BTP(service_9.FindFirstChild(service_9, "Tide Keeper").HumanoidRootPart.CFrame)
                  else
                    Tween(service_9.FindFirstChild(service_9, "Tide Keeper").HumanoidRootPart.CFrame)
                  end
                end
              end
            end
          end
        end
      end
      service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyFishmanKarate")
    end
  end
end)
  end
end)
tab_3.CraftPage(tab_3, "Fighting Style", 1).Toggle(tab_3.CraftPage(tab_3, "Fighting Style", 1), "Auto Electric Claw", AutoElectricClaw, function(a0)
  AutoElectricClaw = a0
  CancelTween(AutoElectricClaw)
  if AutoElectricClaw then
    service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyElectro")
  end
end)
spawn(function()
  while r0 do
    if AutoElectricClaw then
    end
  end
  pcall(function()
  local find_first_child = service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Electro")
  if find_first_child or l_18().FindFirstChild(l_18(), "Electro") then
    if not service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Electro") and ((not l_18().FindFirstChild(l_18(), "Electro") or 400 > service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Electro").Level.Value) and 400 <= l_18().FindFirstChild(l_18(), "Electro").Level.Value) then
      Tween()
      local l_1 = l_20()
      if (CFrame.new(-10371.4717, 330.764496, -10131.4199).Position - l_1.Position).Magnitude <= 10 then
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyElectricClaw", "Start")
        task.wait(2)
        task.wait(1)
        Tween()
        if (CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438).Position - l_20().Position).Magnitude <= 10 then
          task.wait(1)
          task.wait(1)
          Tween()
          if (CFrame.new(-10371.4717, 330.764496, -10131.4199).Position - l_20().Position).Magnitude <= 10 then
            task.wait(1)
            service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyElectricClaw")
            task.wait(1)
            Tween()
            if (CFrame.new(-10371.4717, 330.764496, -10131.4199).Position - l_20().Position).Magnitude <= 10 then
              task.wait(1)
              service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyElectricClaw", "Start")
              task.wait(1)
              Tween()
              if (CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438).Position - l_20().Position).Magnitude <= 10 then
                task.wait(1)
                task.wait(1)
                Tween()
                if (CFrame.new(-10371.4717, 330.764496, -10131.4199).Position - l_20().Position).Magnitude <= 10 then
                  task.wait(1)
                  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyElectricClaw")
                  SelectWeapon = "Electric Claw"
                  EquipTool(SelectWeapon)
                  task.wait(0.1)
                end
              end
            end
          end
        end
      end
    end
  end
end)
end)
tab_3.CraftPage(tab_3, "Fighting Style", 1).Toggle(tab_3.CraftPage(tab_3, "Fighting Style", 1), "Auto Dragon Talon", AutoDragonTalon, function(a0)
  AutoDragonTalon = a0
  CancelTween(AutoDragonTalon)
  if AutoDragonTalon then
    service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BlackbeardReward", "DragonClaw", "1")
    service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BlackbeardReward", "DragonClaw", "2")
  end
end)
spawn(function()
  while r0 do
    if AutoDragonTalon then
    end
  end
  pcall(function()
  local find_first_child = service_1.LocalPlayer.FindFirstChild(service_1.LocalPlayer, "WeaponAssetCache")
  if find_first_child then
    if service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Dragon Claw") and service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Dragon Claw").Level.Value <= 399 and 0 < l_19().Health then
      SelectWeapon = "Dragon Claw"
      EquipTool(SelectWeapon)
    end
    if l_18().FindFirstChild(l_18(), "Dragon Claw") and l_18().FindFirstChild(l_18(), "Dragon Claw").Level.Value <= 399 and 0 < l_19().Health then
      SelectWeapon = "Dragon Claw"
      EquipTool(SelectWeapon)
    end
    if service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Dragon Claw") and (400 <= service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Dragon Claw").Level.Value and 0 < l_19().Health) then
      SelectWeapon = "Dragon Claw"
      EquipTool(SelectWeapon)
      if service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyDragonTalon", true) == 3 then
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "Bones", "Buy", 1, 1)
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyDragonTalon", true)
      elseif service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyDragonTalon", true) == 1 then
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyDragonTalon")
      else
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyDragonTalon", true)
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyDragonTalon")
      end
    end
    if l_18().FindFirstChild(l_18(), "Dragon Claw") and (400 <= l_18().FindFirstChild(l_18(), "Dragon Claw").Level.Value and 0 < l_19().Health) then
      SelectWeapon = "Dragon Claw"
      EquipTool(SelectWeapon)
      if service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyDragonTalon", true) == 3 then
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "Bones", "Buy", 1, 1)
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyDragonTalon", true)
      elseif service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyDragonTalon", true) == 1 then
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyDragonTalon")
      else
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyDragonTalon", true)
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyDragonTalon")
      end
    end
  end
end)
end)
tab_3.CraftPage(tab_3, "Fighting Style", 1).Toggle(tab_3.CraftPage(tab_3, "Fighting Style", 1), "Auto God Human", AutoGodhuman, function(a0)
  AutoGodhuman = a0
  CancelTween(AutoGodhuman)
  if AutoGodhuman then
    service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyGodhuman")
  end
end)

function CheckMaterial(a0)
  local l_1, invoke_server, l_3 = pairs()
  for l_4, l_5 in l_1 do
    for l_4, l_5 in l_1 do
      local type = type(l_5)
      if type == "table" and l_5.Type == "Material" and l_5.Name == a0 then
        return l_5.Count
      end
    end
  end
end

spawn(function()
  while r0 do
    if AutoGodhuman then
    end
  end
  pcall(function()
  local l_0 = l_18()
  if l_0.FindFirstChild(l_0, "Superhuman") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Superhuman") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Black Leg") or l_18().FindFirstChild(l_18(), "Black Leg") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Death Step") or l_18().FindFirstChild(l_18(), "Death Step") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Fishman Karate") or l_18().FindFirstChild(l_18(), "Fishman Karate") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Sharkman Karate") or l_18().FindFirstChild(l_18(), "Sharkman Karate") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Electro") or l_18().FindFirstChild(l_18(), "Electro") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Electric Claw") or l_18().FindFirstChild(l_18(), "Electric Claw") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Dragon Claw") or l_18().FindFirstChild(l_18(), "Dragon Claw") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Dragon Talon") or l_18().FindFirstChild(l_18(), "Dragon Talon") or l_18().FindFirstChild(l_18(), "Godhuman") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Godhuman") then
    if service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuySuperhuman", true) == 1 then
      if not service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Superhuman") or 400 > service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Superhuman").Level.Value then
        if l_18().FindFirstChild(l_18(), "Superhuman") and 400 <= l_18().FindFirstChild(l_18(), "Superhuman").Level.Value then
          service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyDeathStep")
        end
      else
        l_21("Notification", "Not Have Superhuman", 3)
      end
    end
    if service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyDeathStep", true) == 1 then
      if not service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Death Step") or 400 > service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Death Step").Level.Value then
        if l_18().FindFirstChild(l_18(), "Death Step") and 400 <= l_18().FindFirstChild(l_18(), "Death Step").Level.Value then
          service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuySharkmanKarate")
        end
      else
        l_21("Notification", "Not Have Death Step", 3)
      end
    end
    if service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuySharkmanKarate", true) == 1 then
      if not service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Sharkman Karate") or 400 > service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Sharkman Karate").Level.Value then
        if l_18().FindFirstChild(l_18(), "Sharkman Karate") and 400 <= l_18().FindFirstChild(l_18(), "Sharkman Karate").Level.Value then
          service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyElectricClaw")
        end
      else
        l_21("Notification", "Not Have SharkMan Karate", 3)
      end
    end
    if service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyElectricClaw", true) == 1 then
      if not service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Electric Claw") or 400 > service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Electric Claw").Level.Value then
        if l_18().FindFirstChild(l_18(), "Electric Claw") and 400 <= l_18().FindFirstChild(l_18(), "Electric Claw").Level.Value then
          service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyDragonTalon")
        end
      else
        l_21("Notification", "Not Have Electric Claw", 3)
      end
    end
    if service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyDragonTalon", true) == 1 then
      if not service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Dragon Talon") or 400 > service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Dragon Talon").Level.Value then
        if l_18().FindFirstChild(l_18(), "Dragon Talon") and 400 <= l_18().FindFirstChild(l_18(), "Dragon Talon").Level.Value then
          local invoke_server = service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyGodhuman", true)
          if string.find(invoke_server, "Bring") then
            l_21("Notification", "Not Have Enough Material", 3)
          else
            service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyGodhuman")
          end
        end
      else
        l_21("Notification", "Not Have Dragon Talon", 3)
      end
    else
      service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuySuperhuman")
    end
  end
end)
end)
tab_3.CraftPage(tab_3, "Sword", 1).Toggle(tab_3.CraftPage(tab_3, "Sword", 1), "Auto Saber", AutoSaber, function(a0)
  AutoSaber = a0
  CancelTween(AutoSaber)
end)
spawn(function()
  while r0 do
    local find_first_child = service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Saber")
    if AutoSaber and 200 <= service_1.LocalPlayer.Data.Level.Value and not find_first_child and not l_18().FindFirstChild(l_18(), "Saber") then
    end
  end
  pcall(function()
  local service = game.GetService(game, "Workspace")
  if service.Map.Jungle.Final.Part.Transparency == 0 then
    if game.GetService(game, "Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0 then
      local l_1 = l_20()
      if (CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 0.0000000030717151, -0.928667724, 0.0000000397099491, 1, 0.0000000191679348, 0.928667724, -0.0000000439869794, 0.37091279).Position - l_1.Position).Magnitude <= 100 then
        Tween(l_20().CFrame)
        task.wait(1)
        l_20().CFrame = game.GetService(game, "Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame
        task.wait(1)
        l_20().CFrame = game.GetService(game, "Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame
        task.wait(1)
        l_20().CFrame = game.GetService(game, "Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame
        task.wait(1)
        l_20().CFrame = game.GetService(game, "Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame
        task.wait(1)
        l_20().CFrame = game.GetService(game, "Workspace").Map.Jungle.QuestPlates.Plate5.Button.CFrame
        task.wait(1)
      else
        Tween()
      end
      if service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Torch") or l_18().FindFirstChild(l_18(), "Torch") then
        EquipTool("Torch")
        Tween()
      else
        Tween()
      end
    elseif game.GetService(game, "Workspace").Map.Desert.Burn.Part.Transparency == 0 then
      if service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "ProQuestProgress", "SickMan") ~= 0 then
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "ProQuestProgress", "GetCup")
        task.wait(0.5)
        EquipTool("Cup")
        task.wait(0.5)
        local l_4 = l_18()
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "ProQuestProgress", "FillCup", l_4.Cup)
        task.wait(0)
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "ProQuestProgress", "SickMan")
      elseif service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "ProQuestProgress", "RichSon") == nil then
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "ProQuestProgress", "RichSon")
      elseif service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "ProQuestProgress", "RichSon") == 0 then
        if game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Mob Leader") then
          local l_0, children, l_2 = pairs()
          for l_3, l_4 in l_0 do
            for l_3, l_4 in l_0 do
              local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
              task.wait()
              EquipTool(SelectWeaponFarm)
              Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
              l_4.HumanoidRootPart.CanCollide = false
              local new = Vector3.new(60, 60, 60)
              l_4.HumanoidRootPart.Size = new
              l_4.HumanoidRootPart.Transparency = 1
              l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
              l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
              AutoClick()
              if not (not find_first_child or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or l_4.Name ~= "Mob Leader" or l_4.Humanoid.Health <= 0 or AutoSaber == false or not l_4.Parent) then
                Tween(service_9.FindFirstChild(service_9, "Mob Leader").HumanoidRootPart.CFrame)
              end
            end
          end
          if service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "ProQuestProgress", "RichSon") == 1 then
            service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "ProQuestProgress", "RichSon")
            task.wait(0.5)
            EquipTool("Relic")
            task.wait(0.5)
            Tween()
          end
        end
        if game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Saber Expert") then
          local l_0, children, l_2 = pairs()
          for l_3, l_4 in l_0 do
            for l_3, l_4 in l_0 do
              if l_4.FindFirstChild(l_4, "Humanoid") then
                if l_4.FindFirstChild(l_4, "HumanoidRootPart") and (0 < l_4.Humanoid.Health and l_4.Name == "Saber Expert") then
                  while l_4.Name > 0 do
                    if AutoSaber == false then
                      if l_4.Humanoid.Health <= 0 then
                        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "ProQuestProgress", "PlaceRelic")
                      end
                    else
                      task.wait()
                      EquipTool(SelectWeaponFarm)
                      Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
                      l_4.HumanoidRootPart.CanCollide = false
                      l_4.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                      l_4.HumanoidRootPart.Transparency = 1
                      l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
                      l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
                      AutoClick()
                      if l_4.Humanoid.Health <= 0 or AutoSaber == false then
                      end
                    end
                  end
                end
              end
            end
          end
        else
          Tween(service_9.FindFirstChild(service_9, "Saber Expert").HumanoidRootPart.CFrame)
        end
      end
    end
  end
end)
end)
tab_3.CraftPage(tab_3, "Sword", 1).Toggle(tab_3.CraftPage(tab_3, "Sword", 1), "Auto Legendary Sword", AutoLegendarySword, function(a0)
  AutoLegendarySword = a0
end)
spawn(function()
  while r0 do
    if AutoLegendarySword then
    end
  end
  pcall(function()
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "LegendarySworldDealer", "1")
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "LegendarySworldDealer", "2")
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "LegendarySworldDealer", "2")
end)
end)
tab_3.CraftPage(tab_3, "Sword", 1).Toggle(tab_3.CraftPage(tab_3, "Sword", 1), "Auto Rengoku", AutoRengoku, function(a0)
  AutoRengoku = a0
  CancelTween(AutoRengoku)
end)
spawn(function()
  while r0 do
    if AutoRengoku then
      pcall(function()
  local find_first_child = service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Hidden Key")
  if find_first_child or l_18().FindFirstChild(l_18(), "Hidden Key") then
    EquipTool("Hidden Key")
    loc1 = CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875)
    if l_63 then
      BTP(loc1)
    else
      Tween(loc1)
    end
    if game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Arctic Warrior") then
      local service = game.GetService(game, "Workspace")
      local l_0, children, l_2 = pairs()
      for l_3, l_4 in l_0 do
        for l_3, l_4 in l_0 do
          if game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Snow Lurker") or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Arctic Warrior") then
            local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
            if find_first_child then
              if l_4.FindFirstChild(l_4, "HumanoidRootPart") and (0 < l_4.Humanoid.Health and (l_4.Name == "Snow Lurker" or l_4.Name == "Arctic Warrior")) then
                while not l_4.Name do
                  if not (AutoRengoku == false or not l_4.Parent or l_4.Humanoid.Health <= 0) then
                    task.wait()
                    EquipTool(SelectWeaponFarm)
                    Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
                    l_4.HumanoidRootPart.CanCollide = false
                    local new = Vector3.new(60, 60, 60)
                    l_4.HumanoidRootPart.Size = new
                    l_4.HumanoidRootPart.Transparency = 1
                    l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
                    l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
                    Rengoku_Farm_Name = l_4.Name
                    Rengoku_Farm_CFrame = l_4.HumanoidRootPart.CFrame
                    AutoClick()
                    if service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Hidden Key") or AutoRengoku == false or not l_4.Parent or l_4.Humanoid.Health <= 0 then
                      Tween()
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end)
    end
  end
  RengokuMagnet = false
end)
tab_3.CraftPage(tab_3, "Sword", 1).Toggle(tab_3.CraftPage(tab_3, "Sword", 1), "Auto Buddy Sword", AutoBuddySword, function(a0)
  AutoBuddySword = a0
  CancelTween(AutoBuddySword)
end)
spawn(function()
  while r0 do
    if AutoBuddySword then
    end
  end
  pcall(function()
  local service = game.GetService(game, "Workspace")
  if service.Enemies.FindFirstChild(service.Enemies, "Cake Queen [Lv. 2175] [Boss]") then
    local service = game.GetService(game, "Workspace")
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
        task.wait()
        EquipTool(SelectWeaponFarm)
        Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
        l_4.HumanoidRootPart.CanCollide = false
        local new = Vector3.new(60, 60, 60)
        l_4.HumanoidRootPart.Size = new
        l_4.HumanoidRootPart.Transparency = 1
        l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
        l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
        AutoClick()
        if not (not find_first_child or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or l_4.Name ~= "Cake Queen [Lv. 2175] [Boss]" or not AutoBuddySword or not l_4.Parent or l_4.Humanoid.Health <= 0) then
          Tween(service_9.FindFirstChild(service_9, "Cake Queen [Lv. 2175] [Boss]").HumanoidRootPart.CFrame)
        end
      end
    end
  end
end)
end)
tab_3.CraftPage(tab_3, "Sword", 1).Toggle(tab_3.CraftPage(tab_3, "Sword", 1), "Auto Pole", AutoPole, function(a0)
  AutoPole = a0
  CancelTween(AutoPole)
end)
spawn(function()
  while r0 do
    if AutoPole then
    end
  end
  pcall(function()
  local service = game.GetService(game, "Workspace")
  if service.Enemies.FindFirstChild(service.Enemies, "Thunder God") then
    local service = game.GetService(game, "Workspace")
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
        task.wait()
        EquipTool(SelectWeaponFarm)
        Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
        l_4.HumanoidRootPart.CanCollide = false
        local new = Vector3.new(60, 60, 60)
        l_4.HumanoidRootPart.Size = new
        l_4.HumanoidRootPart.Transparency = 1
        l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
        l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
        AutoClick()
        if not find_first_child or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or l_4.Name ~= "Thunder God" or not AutoPole or not l_4.Parent or l_4.Humanoid.Health <= 0 then
        elseif l_63 then
          BTP(service_9.FindFirstChild(service_9, "Thunder God").HumanoidRootPart.CFrame)
        else
          Tween(service_9.FindFirstChild(service_9, "Thunder God").HumanoidRootPart.CFrame)
        end
      end
    end
  end
end)
end)
tab_3.CraftPage(tab_3, "Sword", 1).Toggle(tab_3.CraftPage(tab_3, "Sword", 1), "Auto Yama", AutoYama, function(a0)
  AutoYama = a0
  CancelTween(AutoYama)
end)
spawn(function()
  while r0 do
    if AutoYama then
      local invoke_server = service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "EliteHunter", "Progress")
      if 30 <= invoke_server then
        while not invoke_server do
          if not AutoYama then
          end
        end
      else
        if not task.wait() then
        end
        while not task.wait() do
        end
      end
    end
  end
  while not task.wait() do
  end
end)
tab_3.CraftPage(tab_3, "Sword", 1).Toggle(tab_3.CraftPage(tab_3, "Sword", 1), "Auto Cavander", AutoCavander, function(a0)
  AutoCavander = a0
  CancelTween(AutoCavander)
end)
spawn(function()
  while r0 do
    if AutoCavander then
    end
  end
  pcall(function()
  local service = game.GetService(game, "Workspace")
  if service.Enemies.FindFirstChild(service.Enemies, "Beautiful Pirate") then
    local service = game.GetService(game, "Workspace")
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
        task.wait()
        EquipTool(SelectWeaponFarm)
        Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
        l_4.HumanoidRootPart.CanCollide = false
        local new = Vector3.new(60, 60, 60)
        l_4.HumanoidRootPart.Size = new
        l_4.HumanoidRootPart.Transparency = 1
        l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
        l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
        AutoClick()
        if not find_first_child or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or l_4.Name ~= "Beautiful Pirate" or not AutoCavander or not l_4.Parent or l_4.Humanoid.Health <= 0 then
        elseif l_63 then
          BTP(service_9.FindFirstChild(service_9, "Beautiful Pirate").HumanoidRootPart.CFrame)
        else
          Tween(service_9.FindFirstChild(service_9, "Beautiful Pirate").HumanoidRootPart.CFrame)
        end
      end
    end
  end
end)
end)
tab_3.CraftPage(tab_3, "Sword", 1).Toggle(tab_3.CraftPage(tab_3, "Sword", 1), "Auto Tushita", AutoTushita, function(a0)
  AutoTushita = a0
  CancelTween(AutoTushita)
end)

function enemyrip()
  Tween()
  task.wait()
  local find_first_child = game.Workspace.Enemies.FindFirstChild(game.Workspace.Enemies, "rip_indra True Form")
  if find_first_child then
    local l_1, children, l_3 = pairs(game.Workspace.Enemies.GetChildren(game.Workspace.Enemies))
    for l_4, l_5 in l_1 do
      for l_4, l_5 in l_1 do
        local a = l_5.IsA(l_5, "Model")
        if l_5.Name == "rip_indra True Form" and a and l_5.FindFirstChild(l_5, "Humanoid") and l_5.FindFirstChild(l_5, "HumanoidRootPart") and 0 < l_5.Humanoid.Health then
          return l_5
        end
      end
    end
  end
  return service_9.FindFirstChild(service_9, "rip_indra True Form [Lv. 5000] [Raid Boss]")
end

function enemyEliteBoss()
  local find_first_child = game.Workspace.Enemies.FindFirstChild(game.Workspace.Enemies, "Deandre")
  if find_first_child or game.Workspace.Enemies.FindFirstChild(game.Workspace.Enemies, "Urban") or game.Workspace.Enemies.FindFirstChild(game.Workspace.Enemies, "Diablo") then
    local l_1, children, l_3 = pairs(game.Workspace.Enemies.GetChildren(game.Workspace.Enemies))
    for l_4, l_5 in l_1 do
      for l_4, l_5 in l_1 do
        if l_5.Name ~= "Deandre" and l_5.Name ~= "Diablo" then
          local find_first_child = l_5.FindFirstChild(l_5, "Humanoid")
          if l_5.Name == "Urban" and find_first_child and l_5.FindFirstChild(l_5, "HumanoidRootPart") and 0 < l_5.Humanoid.Health then
            return l_5
          end
        end
      end
    end
    if not service_9.FindFirstChild(service_9, "Deandre") and not service_9.FindFirstChild(service_9, "Urban") then
    end
  end
  return service_9.FindFirstChild(service_9, "Diablo")
end

function enemylongma()
  Tween()
  local find_first_child = game.Workspace.Enemies.FindFirstChild(game.Workspace.Enemies, "Longma")
  if find_first_child then
    local l_1, children, l_3 = pairs(game.Workspace.Enemies.GetChildren(game.Workspace.Enemies))
    for l_4, l_5 in l_1 do
      for l_4, l_5 in l_1 do
        local find_first_child = l_5.FindFirstChild(l_5, "Humanoid")
        if l_5.Name == "Longma" and find_first_child and l_5.FindFirstChild(l_5, "HumanoidRootPart") and 0 < l_5.Humanoid.Health then
          return l_5
        end
      end
    end
  end
  return service_9.FindFirstChild(service_9, "Longma")
end

function autoTushita()
  local find_first_child = service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "God's Chalice")
  if not find_first_child and not l_18().FindFirstChild(l_18(), "God's Chalice") then
    if (game.Workspace.Enemies.FindFirstChild(game.Workspace.Enemies, "Deandre") or game.Workspace.Enemies.FindFirstChild(game.Workspace.Enemies, "Urban") or game.Workspace.Enemies.FindFirstChild(game.Workspace.Enemies, "Diablo") or service_9.FindFirstChild(service_9, "Deandre") or service_9.FindFirstChild(service_9, "Urban") or service_9.FindFirstChild(service_9, "Diablo")) and service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
      while service_1.LocalPlayer.PlayerGui.Main.Quest.Visible do
        local new = Vector3.new(5420.49219, 314.446045, -2823.07373)
        if (l_20().Position - new).Magnitude <= 10 then
          task.wait(1)
        else
          Tween()
          task.wait()
          if not AutoTushita or (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10 then
          end
        end
      end
      while (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude do
        if (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10 then
          task.wait(1.1)
          service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "EliteHunter")
          task.wait(1)
        else
          Tween()
          task.wait()
          if (not AutoTushita or (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10) and service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
            CheckLevel()
            pcall(function()
  local enemy_elite_boss = enemyEliteBoss()
  enemy_elite_boss.HumanoidRootPart.CanCollide = false
  local new = Vector3.new(50, 50, 50)
  enemy_elite_boss.HumanoidRootPart.Size = new
  EquipTool(SelectWeaponFarm)
  Tween(enemy_elite_boss.HumanoidRootPart.CFrame * Farm_Mode)
  AutoClick()
end)
          end
        end
      end
      Tween()
    end
    if service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "God's Chalice") or l_18().FindFirstChild(l_18(), "God's Chalice") then
      service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "activateColor", "Winter Sky")
      task.wait(0.5)
      while task.wait do
        if (l_20().Position - Vector3.new(-5420.16602, 1084.9657, -2666.8208)).Magnitude <= 10 then
          task.wait(0.5)
          service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "activateColor", "Pure Red")
          task.wait(0.5)
        else
          Tween()
          task.wait()
          if not AutoTushita or (l_20().Position - Vector3.new(-5420.16602, 1084.9657, -2666.8208)).Magnitude <= 10 then
          end
        end
      end
      while (l_20().Position - Vector3.new(-5420.16602, 1084.9657, -2666.8208)).Magnitude do
        if (l_20().Position - Vector3.new(-5414.41357, 309.865753, -2212.45776)).Magnitude <= 10 then
          task.wait(0.5)
          service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "activateColor", "Snow White")
          task.wait(0.5)
        else
          Tween()
          task.wait()
          if not AutoTushita or (l_20().Position - Vector3.new(-5414.41357, 309.865753, -2212.45776)).Magnitude <= 10 then
          end
        end
      end
      while (l_20().Position - Vector3.new(-5414.41357, 309.865753, -2212.45776)).Magnitude do
        if (l_20().Position - Vector3.new(-4971.47559, 331.565765, -3720.02954)).Magnitude <= 10 then
          task.wait(0.5)
          EquipTool("God's Chalice")
          task.wait(0.5)
        else
          Tween()
          task.wait()
          if not AutoTushita or (l_20().Position - Vector3.new(-4971.47559, 331.565765, -3720.02954)).Magnitude <= 10 then
          end
        end
      end
      while (l_20().Position - Vector3.new(-4971.47559, 331.565765, -3720.02954)).Magnitude do
        if (l_20().Position - Vector3.new(-5560.27295, 313.915466, -2663.89795)).Magnitude <= 10 then
          task.wait(0.5)
        else
          Tween()
          task.wait()
          if not AutoTushita or (l_20().Position - Vector3.new(-5560.27295, 313.915466, -2663.89795)).Magnitude <= 10 then
          end
        end
      end
      while (l_20().Position - Vector3.new(-5560.27295, 313.915466, -2663.89795)).Magnitude do
        if (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10 then
          task.wait(1)
        else
          Tween()
          task.wait()
          if not AutoTushita or (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10 then
          end
        end
      end
      while (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude do
        if (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10 then
          task.wait(0.2)
        else
          Tween()
          task.wait()
          if not AutoTushita or (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10 then
          end
        end
      end
      while (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude do
        if (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10 then
          task.wait(1)
          EquipTool("Holy Torch")
          task.wait(1)
          task.wait(0.4)
        else
          Tween()
          task.wait()
          if not AutoTushita or (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10 then
          end
        end
      end
      while (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude do
        if (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10 then
          task.wait(0.4)
        else
          Tween()
          task.wait()
          if not AutoTushita or (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10 then
          end
        end
      end
      while (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude do
        if (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10 then
          task.wait(0.4)
        else
          Tween()
          task.wait()
          if not AutoTushita or (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10 then
          end
        end
      end
      while (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude do
        if (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10 then
          task.wait(0.4)
        else
          Tween()
          task.wait()
          if not AutoTushita or (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10 then
          end
        end
      end
      while (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude do
        if (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10 then
          task.wait(0.4)
        else
          Tween()
          task.wait()
          if not AutoTushita or (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10 then
          end
        end
      end
      while (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude do
        if (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10 then
          task.wait(1)
        else
          Tween()
          task.wait()
          if not AutoTushita or (l_20().Position - Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10 then
            if game.Workspace.Enemies.FindFirstChild(game.Workspace.Enemies, "Longma") or service_9.FindFirstChild(service_9, "Longma") then
              pcall(function()
  local enemylongma = enemylongma()
  enemylongma.HumanoidRootPart.CanCollide = false
  local new = Vector3.new(50, 50, 50)
  enemylongma.HumanoidRootPart.Size = new
  EquipTool(SelectWeaponFarm)
  Tween(enemylongma.HumanoidRootPart.CFrame * Farm_Mode)
  Click()
end)
            elseif game.Workspace.Enemies.FindFirstChild(game.Workspace.Enemies, "rip_indra True Form") or service_9.FindFirstChild(service_9, "rip_indra True Form") then
              pcall(function()
  local enemyrip = enemyrip()
  enemyrip.HumanoidRootPart.CanCollide = false
  local new = Vector3.new(50, 50, 50)
  enemyrip.HumanoidRootPart.Size = new
  EquipTool(SelectWeaponFarm)
  Tween(enemyrip.HumanoidRootPart.CFrame * Farm_Mode)
  AutoClick()
end)
            else
              Tween()
            end
          end
        end
      end
    end
  end
end

spawn(function()
  while r0 do
    if AutoTushita then
    end
  end
  pcall(function()
  autoTushita()
end)
end)

function GetWeaponInventory(a0)
  local l_1, invoke_server, l_3 = pairs()
  for l_4, l_5 in l_1 do
    for l_4, l_5 in l_1 do
      local type = type(l_5)
      if type == "table" and l_5.Type == "Sword" and l_5.Name == a0 then
        return true
      end
    end
  end
  return false
end

tab_3.CraftPage(tab_3, "Sword", 1).Toggle(tab_3.CraftPage(tab_3, "Sword", 1), "Auto CDK", Auto_Cursed_Dual_Katana, function(a0)
  Auto_Cursed_Dual_Katana = a0
  CancelTween(Auto_Cursed_Dual_Katana)
end)
spawn(function()
  while r0 do
    pcall(function()
  if Auto_Cursed_Dual_Katana then
    local l_0 = l_18()
    if l_0.FindFirstChild(l_0, "Tushita") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Tushita") or l_18().FindFirstChild(l_18(), "Yama") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Yama") then
      if l_18().FindFirstChild(l_18(), "Tushita") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Tushita") then
        if service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Tushita") then
          EquipTool("Tushita")
        end
      elseif l_18().FindFirstChild(l_18(), "Yama") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Yama") then
        if service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Yama") then
          EquipTool("Yama")
        end
        if CheckMaterial("Alucard Fragment") == 0 then
          Auto_Quest_Yama_1 = true
          Auto_Quest_Yama_2 = false
          Auto_Quest_Yama_3 = false
          Auto_Quest_Tushita_1 = false
          Auto_Quest_Tushita_2 = false
          Auto_Quest_Tushita_3 = false
          service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CDKQuest", "Progress", "Evil")
          service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CDKQuest", "StartTrial", "Evil")
        elseif CheckMaterial("Alucard Fragment") == 1 then
          Auto_Quest_Yama_1 = false
          Auto_Quest_Yama_2 = true
          Auto_Quest_Yama_3 = false
          Auto_Quest_Tushita_1 = false
          Auto_Quest_Tushita_2 = false
          Auto_Quest_Tushita_3 = false
          service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CDKQuest", "Progress", "Evil")
          service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CDKQuest", "StartTrial", "Evil")
        elseif CheckMaterial("Alucard Fragment") == 2 then
          Auto_Quest_Yama_1 = false
          Auto_Quest_Yama_2 = false
          Auto_Quest_Yama_3 = true
          Auto_Quest_Tushita_1 = false
          Auto_Quest_Tushita_2 = false
          Auto_Quest_Tushita_3 = false
          service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CDKQuest", "Progress", "Evil")
          service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CDKQuest", "StartTrial", "Evil")
        elseif CheckMaterial("Alucard Fragment") == 3 then
          Auto_Quest_Yama_1 = false
          Auto_Quest_Yama_2 = false
          Auto_Quest_Yama_3 = false
          Auto_Quest_Tushita_1 = true
          Auto_Quest_Tushita_2 = false
          Auto_Quest_Tushita_3 = false
          service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CDKQuest", "Progress", "Good")
          service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CDKQuest", "StartTrial", "Good")
        elseif CheckMaterial("Alucard Fragment") == 4 then
          Auto_Quest_Yama_1 = false
          Auto_Quest_Yama_2 = false
          Auto_Quest_Yama_3 = false
          Auto_Quest_Tushita_1 = false
          Auto_Quest_Tushita_2 = true
          Auto_Quest_Tushita_3 = false
          service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CDKQuest", "Progress", "Good")
          service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CDKQuest", "StartTrial", "Good")
        elseif CheckMaterial("Alucard Fragment") == 5 then
          Auto_Quest_Yama_1 = false
          Auto_Quest_Yama_2 = false
          Auto_Quest_Yama_3 = false
          Auto_Quest_Tushita_1 = false
          Auto_Quest_Tushita_2 = false
          Auto_Quest_Tushita_3 = true
          service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CDKQuest", "Progress", "Good")
          service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CDKQuest", "StartTrial", "Good")
        elseif CheckMaterial("Alucard Fragment") == 6 and (game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Cursed Skeleton Boss") or game.GetService(game, "Workspace").ReplicatedStorage.FindFirstChild(game.GetService(game, "Workspace").ReplicatedStorage, "Cursed Skeleton Boss")) then
          Auto_Quest_Yama_1 = false
          Auto_Quest_Yama_2 = false
          Auto_Quest_Yama_3 = false
          Auto_Quest_Tushita_1 = false
          Auto_Quest_Tushita_2 = false
          Auto_Quest_Tushita_3 = false
          if game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Cursed Skeleton Boss") or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Cursed Skeleton") then
            local service = game.GetService(game, "Workspace")
            local l_0, children, l_2 = pairs()
            for l_3, l_4 in l_0 do
              for l_3, l_4 in l_0 do
                service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "LoadItem", "Tushita")
                if l_4.Name == "Cursed Skeleton Boss" or l_4.Name == "Cursed Skeleton" then
                  while l_4.Name do
                    if not (not l_4.Parent or l_4.Humanoid.Health <= 0) then
                      task.wait()
                      EquipTool(SelectWeaponFarm)
                      Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
                      l_4.HumanoidRootPart.CanCollide = false
                      local new = Vector3.new(60, 60, 60)
                      l_4.HumanoidRootPart.Size = new
                      l_4.HumanoidRootPart.Transparency = 1
                      l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
                      l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
                      AutoClick()
                      if not Auto_Cursed_Dual_Katana or not l_4.Parent or l_4.Humanoid.Health <= 0 then
                        if (CFrame.new(-12361.7060546875, 603.3547973632813, -6550.5341796875).Position - l_20().Position).Magnitude <= 100 then
                          service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CDKQuest", "Progress", "Good")
                          task.wait(1)
                          service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CDKQuest", "Progress", "Evil")
                          task.wait(1)
                          Tween()
                          task.wait(1.5)
                          service_5.SendKeyEvent(service_5, true, "E", false, game)
                          task.wait(1.5)
                          Tween()
                        else
                          Tween()
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end)
  end
end)
spawn(function()
  while r0 do
    if Auto_Quest_Yama_1 then
    end
  end
  pcall(function()
  local service = game.GetService(game, "Workspace")
  if service.Enemies.FindFirstChild(service.Enemies, "Mythological Pirate") then
    local service = game.GetService(game, "Workspace")
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        if l_4.Name == "Mythological Pirate" then
          while l_4.Name ~= false do
            if Auto_Quest_Yama_1 == false then
              service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CDKQuest", "StartTrial", "Evil")
            else
              task.wait()
              EquipTool(SelectWeaponFarm)
              Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
              l_4.HumanoidRootPart.CanCollide = false
              local new = Vector3.new(60, 60, 60)
              l_4.HumanoidRootPart.Size = new
              l_4.HumanoidRootPart.Transparency = 1
              l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
              l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
              AutoClick()
              if Auto_Cursed_Dual_Katana == false or Auto_Quest_Yama_1 == false then
              end
            end
          end
        end
      end
    end
  else
    Tween()
  end
end)
end)
spawn(function()
  while r0 do
    if Auto_Quest_Yama_2 then
    end
  end
  pcall(function()
  local service = game.GetService(game, "Workspace")
  local l_0, children, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      local find_first_child = l_4.FindFirstChild(l_4, "HazeESP")
      if find_first_child then
        local new = UDim2.new(50, 50, 50, 50)
        l_4.HazeESP.Size = new
        l_4.HazeESP.MaxDistance = "inf"
      end
    end
  end
  local l_0, children, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      if l_4.FindFirstChild(l_4, "HazeESP") then
        l_4.HazeESP.Size = UDim2.new(50, 50, 50, 50)
        l_4.HazeESP.MaxDistance = "inf"
      end
    end
  end
  local l_0, children, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      l_4.HumanoidRootPart.CFrame = PosMonsEsp
      l_4.HumanoidRootPart.CanCollide = false
      l_4.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
      if l_4.FindFirstChild(l_4, "HazeESP") and (l_4.HumanoidRootPart.Position - PosMonsEsp.Position).magnitude <= 300 and not l_4.HumanoidRootPart.FindFirstChild(l_4.HumanoidRootPart, "BodyVelocity") then
        Instance.new("BodyVelocity", l_4.HumanoidRootPart).MaxForce = Vector3.new(1, 1, 1) * math.huge
        Instance.new("BodyVelocity", l_4.HumanoidRootPart).Velocity = Vector3.new(0, 0, 0)
      end
    end
  end
end)
end)
spawn(function()
  while r0 do
    if Auto_Quest_Yama_2 then
    end
  end
  pcall(function()
  local service = game.GetService(game, "Workspace")
  local l_0, children, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      local find_first_child = l_4.FindFirstChild(l_4, "HazeESP")
      if find_first_child then
        task.wait()
        EquipTool(SelectWeaponFarm)
        Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
        l_4.HumanoidRootPart.CanCollide = false
        local new = Vector3.new(60, 60, 60)
        l_4.HumanoidRootPart.Size = new
        l_4.HumanoidRootPart.Transparency = 1
        l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
        l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
        AutoClick()
        if Auto_Cursed_Dual_Katana ~= false and Auto_Quest_Yama_2 ~= false and l_4.Parent and l_4.Humanoid.Health > 0 and l_4.FindFirstChild(l_4, "HazeESP") then
          local l_5, children_1, l_7 = pairs()
          for l_8, l_9 in l_5 do
            for l_8, l_9 in l_5 do
              local find_first_child = l_9.FindFirstChild(l_9, "HazeESP")
              if find_first_child then
                local l_11 = l_20()
                if 2000 < (l_9.HumanoidRootPart.Position - l_11.Position).Magnitude then
                  BTP(l_9.HumanoidRootPart.CFrameMon * Farm_Mode)
                else
                  Tween(l_9.HumanoidRootPart.CFrame * Farm_Mode)
                end
              end
            end
          end
        end
      end
    end
  end
end)
end)
spawn(function()
  while r0 do
    if Auto_Quest_Yama_3 then
    end
  end
  pcall(function()
  local find_first_child = service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Hallow Essence")
  if find_first_child then
    local service = game.GetService(game, "Workspace")
    Tween(service.Map["Haunted Castle"].Summoner.Detection.CFrame)
  elseif game.GetService(game, "Workspace").Map.FindFirstChild(game.GetService(game, "Workspace").Map, "HellDimension") then
    task.wait()
    if game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Cursed Skeleton") or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Hell's Messenger") then
      local l_0, children, l_2 = pairs()
      for l_3, l_4 in l_0 do
        for l_3, l_4 in l_0 do
          if l_4.Name == "Cursed Skeleton" or l_4.Name == "Hell's Messenger" then
            task.wait()
            EquipTool(SelectWeaponFarm)
            Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
            l_4.HumanoidRootPart.CanCollide = false
            local new = Vector3.new(60, 60, 60)
            l_4.HumanoidRootPart.Size = new
            l_4.HumanoidRootPart.Transparency = 1
            l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
            l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
            AutoClick()
            if not (0 >= l_4.Humanoid.Health or l_4.Humanoid.Health <= 0 or not l_4.Parent or Auto_Quest_Yama_3 == false) then
              task.wait(5)
              Tween(game.GetService(game, "Workspace").Map.HellDimension.Torch1.CFrame)
              task.wait(1.5)
              service_5.SendKeyEvent(service_5, true, "E", false, game)
              task.wait(1.5)
              Tween(game.GetService(game, "Workspace").Map.HellDimension.Torch2.CFrame)
              task.wait(1.5)
              service_5.SendKeyEvent(service_5, true, "E", false, game)
              task.wait(1.5)
              Tween(game.GetService(game, "Workspace").Map.HellDimension.Torch3.CFrame)
              task.wait(1.5)
              service_5.SendKeyEvent(service_5, true, "E", false, game)
              task.wait(1.5)
              Tween(game.GetService(game, "Workspace").Map.HellDimension.Exit.CFrame)
            end
          end
        end
      end
    end
    if Auto_Cursed_Dual_Katana ~= false and Auto_Quest_Yama_3 ~= false then
      if CheckMaterial("Alucard Fragment") ~= 3 and ((game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Soul Reaper") or service_9.FindFirstChild(service_9, "Soul Reaper")) and game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Soul Reaper")) then
        local l_0, children, l_2 = pairs()
        for l_3, l_4 in l_0 do
          for l_3, l_4 in l_0 do
            task.wait()
            EquipTool(SelectWeaponFarm)
            Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
            l_4.HumanoidRootPart.CanCollide = false
            l_4.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
            l_4.HumanoidRootPart.Transparency = 1
            l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
            l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
            AutoClick()
            local service = game.GetService(game, "Workspace")
            if not (l_4.Name ~= "Soul Reaper" or 0 >= l_4.Humanoid.Health or Auto_Cursed_Dual_Katana == false or Auto_Quest_Yama_3 == false or service.Map.FindFirstChild(service.Map, "HellDimension")) then
              Tween()
            end
          end
        end
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "Bones", "Buy", 1, 1)
      end
    end
  end
end)
end)
spawn(function()
  while r0 do
    if Auto_Quest_Tushita_1 then
    end
  end
  Tween()
  task.wait(5)
  Tween()
  task.wait(5)
  Tween()
  task.wait(5)
end)
spawn(function()
  while r0 do
    if Auto_Quest_Tushita_2 then
    end
  end
  pcall(function()
  local new = CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125)
  local l_1 = l_20()
  if (new.Position - l_1.Position).Magnitude <= 500 then
    Tween()
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        local find_first_child = l_4.FindFirstChild(l_4, "HumanoidRootPart")
        local l_6 = l_20()
        task.wait()
        EquipTool(SelectWeaponFarm)
        Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
        l_4.HumanoidRootPart.CanCollide = false
        l_4.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
        l_4.HumanoidRootPart.Transparency = 1
        l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
        l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
        AutoClick()
        if not Auto_Quest_Tushita_2 or not find_first_child or not l_4.FindFirstChild(l_4, "Humanoid") or 0 >= l_4.Humanoid.Health or (l_4.HumanoidRootPart.Position - l_6.Position).Magnitude >= 2000 or l_4.Humanoid.Health <= 0 or not l_4.Parent or Auto_Quest_Tushita_2 == false then
        end
      end
    end
  end
end)
end)
spawn(function()
  while r0 do
    if Auto_Quest_Tushita_3 then
    end
  end
  pcall(function()
  local service = game.GetService(game, "Workspace")
  if service.Enemies.FindFirstChild(service.Enemies, "Cake Queen") or service_9.FindFirstChild(service_9, "Cake Queen") then
    local service = game.GetService(game, "Workspace")
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        task.wait()
        EquipTool(SelectWeaponFarm)
        Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
        l_4.HumanoidRootPart.CanCollide = false
        local new = Vector3.new(60, 60, 60)
        l_4.HumanoidRootPart.Size = new
        l_4.HumanoidRootPart.Transparency = 1
        l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
        l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
        AutoClick()
        local service = game.GetService(game, "Workspace")
        if l_4.Name ~= "Cake Queen" or 0 >= l_4.Humanoid.Health or Auto_Cursed_Dual_Katana == false or Auto_Quest_Tushita_3 == false or service.Map.FindFirstChild(service.Map, "HeavenlyDimension") then
          Tween()
        elseif game.GetService(game, "Workspace").Map.FindFirstChild(game.GetService(game, "Workspace").Map, "HeavenlyDimension") then
          while not game.GetService(game, "Workspace").Map.FindFirstChild(game.GetService(game, "Workspace").Map, "HeavenlyDimension") do
            if game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Heaven's Guardian") then
              local l_0, children, l_2 = pairs()
              for l_3, l_4 in l_0 do
                for l_3, l_4 in l_0 do
                  task.wait()
                  if (game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Cursed Skeleton") or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Heaven's Guardian")) and (l_4.Name == "Cursed Skeleton" or l_4.Name == "Heaven's Guardian") then
                    task.wait()
                    EquipTool(SelectWeaponFarm)
                    Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
                    l_4.HumanoidRootPart.CanCollide = false
                    l_4.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    l_4.HumanoidRootPart.Transparency = 1
                    l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
                    l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
                    AutoClick()
                    if not (0 >= l_4.Humanoid.Health or l_4.Humanoid.Health <= 0 or not l_4.Parent or Auto_Quest_Tushita_3 == false) then
                      task.wait(5)
                      Tween(game.GetService(game, "Workspace").Map.HeavenlyDimension.Torch1.CFrame)
                      task.wait(1.5)
                      service_5.SendKeyEvent(service_5, true, "E", false, game)
                      task.wait(1.5)
                      Tween(game.GetService(game, "Workspace").Map.HeavenlyDimension.Torch2.CFrame)
                      task.wait(1.5)
                      service_5.SendKeyEvent(service_5, true, "E", false, game)
                      task.wait(1.5)
                      Tween(game.GetService(game, "Workspace").Map.HeavenlyDimension.Torch3.CFrame)
                      task.wait(1.5)
                      service_5.SendKeyEvent(service_5, true, "E", false, game)
                      task.wait(1.5)
                      Tween(game.GetService(game, "Workspace").Map.HeavenlyDimension.Exit.CFrame)
                    end
                  end
                  if Auto_Cursed_Dual_Katana == false or Auto_Quest_Tushita_3 == false or CheckMaterial("Alucard Fragment") == 6 then
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end)
end)
local craft_page_7 = tab_3.CraftPage(tab_3, "Elite Hunter", 2)
local label_1 = craft_page_7.Label(craft_page_7, "")
local label_2 = craft_page_7.Label(craft_page_7, "")
spawn(function()
  while r0 do
    local invoke_server = service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "EliteHunter", "Progress")
    label_1.Set(label_1, "Elite Boss Killed : " .. invoke_server)
    local find_first_child = service_9.FindFirstChild(service_9, "Diablo")
    if find_first_child or service_9.FindFirstChild(service_9, "Deandre") or service_9.FindFirstChild(service_9, "Urban") then
      label_2.Set(label_2, "Boss Status : Boss is Spawned.")
      if not service_9.FindFirstChild(service_9, "Diablo") or not service_9.FindFirstChild(service_9, "Deandre") or not service_9.FindFirstChild(service_9, "Urban") then
      end
    end
  end
  label_2.Set(label_2, "Boss Status : Boss is not Spawned.")
end)
craft_page_7.Toggle(craft_page_7, "Auto Elite Hunter", AutoEliteHunter, function(a0)
  AutoEliteHunter = a0
  CancelTween(AutoEliteHunter)
end)
spawn(function()
  while r0 do
    if AutoEliteHunter then
    end
  end
  pcall(function()
  if service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
    local find = string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo")
    if find or string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre") or string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban") then
      if game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Diablo") or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Deandre") or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Urban") then
        local service = game.GetService(game, "Workspace")
        local l_0, children, l_2 = pairs()
        for l_3, l_4 in l_0 do
          for l_3, l_4 in l_0 do
            local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
            if find_first_child then
              if l_4.FindFirstChild(l_4, "HumanoidRootPart") and (0 < l_4.Humanoid.Health and (l_4.Name == "Diablo" or l_4.Name == "Deandre" or l_4.Name == "Urban")) then
                while l_4.Name ~= false do
                  if not (l_4.Humanoid.Health <= 0 or not l_4.Parent) then
                    task.wait()
                    EquipTool(SelectWeaponFarm)
                    Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
                    l_4.HumanoidRootPart.CanCollide = false
                    local new = Vector3.new(60, 60, 60)
                    l_4.HumanoidRootPart.Size = new
                    l_4.HumanoidRootPart.Transparency = 1
                    l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
                    l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
                    AutoClick()
                    if AutoEliteHunter == false or l_4.Humanoid.Health <= 0 or not l_4.Parent then
                      if service_9.FindFirstChild(service_9, "Diablo") then
                        if l_63 then
                          BTP(service_9.FindFirstChild(service_9, "Diablo").HumanoidRootPart.CFrame)
                        else
                          Tween(service_9.FindFirstChild(service_9, "Diablo").HumanoidRootPart.CFrame)
                        end
                        if l_63 then
                          BTP(service_9.FindFirstChild(service_9, "Deandre").HumanoidRootPart.CFrame)
                        else
                          Tween(service_9.FindFirstChild(service_9, "Deandre").HumanoidRootPart.CFrame)
                        end
                      elseif service_9.FindFirstChild(service_9, "Deandre") and service_9.FindFirstChild(service_9, "Urban") then
                        if l_63 then
                          BTP(service_9.FindFirstChild(service_9, "Urban").HumanoidRootPart.CFrame)
                        else
                          Tween(service_9.FindFirstChild(service_9, "Urban").HumanoidRootPart.CFrame)
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "EliteHunter")
    end
  end
end)
end)
local craft_page_8 = tab_3.CraftPage(tab_3, "Cake Prince & Dough King", 2)
local label_3 = craft_page_8.Label(craft_page_8, "")
spawn(function()
  while r0 do
    local len = string.len()
    if len == 88 then
      local invoke_server = service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CakePrinceSpawner")
      local sub = string.sub(invoke_server, 39, 41)
      label_3.Set(label_3, "Killed Left : " .. sub .. " / 500")
      if string.len() == 87 then
        label_3.Set(label_3, "Killed Left : " .. string.sub(service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CakePrinceSpawner"), 39, 40) .. " / 500")
      end
      if string.len() == 86 then
        label_3.Set(label_3, "Killed Left : " .. string.sub(service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CakePrinceSpawner"), 39, 39) .. " / 500")
      end
    end
  end
  label_3.Set(label_3, "Cake Prince Spawned...!!!")
end)
craft_page_8.Toggle(craft_page_8, "Auto Cake Prince", AutoCakePrince, function(a0)
  AutoCakePrince = a0
  CancelTween(AutoCakePrince)
end)
spawn(function()
  while r0 do
    if AutoCakePrince then
    end
  end
  pcall(function()
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CakePrinceSpawner")
  local find_first_child = service_9.FindFirstChild(service_9, "Cake Prince")
  if find_first_child or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Cake Prince") then
    if game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Cake Prince") then
      local l_0, children, l_2 = pairs()
      for l_3, l_4 in l_0 do
        for l_3, l_4 in l_0 do
          local find_first_child = l_4.FindFirstChild(l_4, "HumanoidRootPart")
          task.wait()
          EquipTool(SelectWeaponFarm)
          Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
          l_4.HumanoidRootPart.CanCollide = false
          local new = Vector3.new(60, 60, 60)
          l_4.HumanoidRootPart.Size = new
          l_4.HumanoidRootPart.Transparency = 1
          l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
          l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
          AutoClick()
          if not AutoCakePrince or l_4.Name ~= "Cake Prince" or not find_first_child or not l_4.FindFirstChild(l_4, "Humanoid") or 0 >= l_4.Humanoid.Health or not AutoCakePrince or not l_4.Parent or l_4.Humanoid.Health <= 0 then
          elseif game.GetService(game, "Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 and 2000 <= (CFrame.new(-1990.672607421875, 4532.99951171875, -14973.6748046875).Position - l_20().Position).Magnitude then
            Tween()
          end
        end
      end
    end
    if game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Cookie Crafter") or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Cake Guard") or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Baking Staff") or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Head Baker") then
      local l_0, children, l_2 = pairs()
      for l_3, l_4 in l_0 do
        for l_3, l_4 in l_0 do
          if l_4.FindFirstChild(l_4, "Humanoid") then
            if l_4.FindFirstChild(l_4, "HumanoidRootPart") and (0 < l_4.Humanoid.Health and (l_4.Name == "Cookie Crafter" or l_4.Name == "Cake Guard" or l_4.Name == "Baking Staff" or l_4.Name == "Head Baker")) then
              task.wait()
              EquipTool(SelectWeaponFarm)
              Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
              l_4.HumanoidRootPart.CanCollide = false
              l_4.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
              l_4.HumanoidRootPart.Transparency = 1
              l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
              l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
              CakePrince_Farm_Name = l_4.Name
              CakePrince_Farm_CFrame = l_4.HumanoidRootPart.CFrame
              AutoClick()
              if not (not l_4.FindFirstChild(l_4, "HumanoidRootPart") or not l_4.FindFirstChild(l_4, "Humanoid") or 0 >= l_4.Humanoid.Health or not AutoCakePrince or not l_4.Parent or l_4.Humanoid.Health <= 0) then
                l_0 = CFrame
                l_0 = l_0.new
                l_0 = l_0(-2077, 252, -12373)
                if l_63 then
                  BTP(l_0)
                else
                  Tween(l_0)
                end
              end
            end
          end
        end
      end
    end
  end
end)
end)
craft_page_8.Toggle(craft_page_8, "Auto Dough King (Need Sweet Chalice)", _G.AutoDoughKing, function(a0)
  _G.AutoDoughKing = a0
  CancelTween(_G.AutoDoughKing)
end)
spawn(function()
  while r0 do
    if _G.AutoDoughKing then
    end
  end
  CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -0.0000000187902192, 0.98883605, 0.0000000360619588, 1, 0.0000000135681812, -0.98883605, 0.0000000336376011, 0.149007782)
  pcall(function()
  local service = game.GetService(game, "Workspace")
  if service.Map.CakeLoaf.FindFirstChild(service.Map.CakeLoaf, "RedDoor") then
    if l_18().FindFirstChild(l_18(), "Red Key") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Red Key") then
      service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CakeScientist", "Check")
      task.wait(1)
      service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "RaidsNpc", "Check")
      Tween(CFrame.new)
      local l_1 = l_20()
      if (CFrame.new.Position - l_1.Position).magnitude <= 5 then
        l_20().CFrame = CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -0.0000000187902192, 0.98883605, 0.0000000360619588, 1, 0.0000000135681812, -0.98883605, 0.0000000336376011, 0.149007782)
        task.wait(0.5)
        EquipTool("Red Key")
        task.wait(0.5)
      end
    elseif game.Workspace.FindFirstChild(game.Workspace, "Enemies").FindFirstChild(game.Workspace.FindFirstChild(game.Workspace, "Enemies"), "Dough King") or service_9.FindFirstChild(service_9, "Dough King") then
      if game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Dough King") then
        local l_0, children, l_2 = pairs()
        for l_3, l_4 in l_0 do
          for l_3, l_4 in l_0 do
            local find_first_child = l_4.FindFirstChild(l_4, "HumanoidRootPart")
            task.wait()
            EquipTool(SelectWeaponFarm)
            Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
            l_4.HumanoidRootPart.CanCollide = false
            local new = Vector3.new(60, 60, 60)
            l_4.HumanoidRootPart.Size = new
            l_4.HumanoidRootPart.Transparency = 1
            l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
            l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
            AutoClick()
            if not (l_4.Name ~= "Dough King" or not find_first_child or not l_4.FindFirstChild(l_4, "Humanoid") or 0 >= l_4.Humanoid.Health or not _G.AutoDoughKing or not l_4.Parent or l_4.Humanoid.Health <= 0 or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, l_4.Name)) then
              Tween(CFrame.new(-2151.82153, 149.315704, -12404.9053))
              if game.GetService(game, "Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 and (CFrame.new(-2151.82153, 149.315704, -12404.9053).Position - l_20().Position).magnitude <= 300 then
                l_20().CFrame = CFrame.new(-2151.82153, 149.315704, -12404.9053)
                task.wait(1)
              end
            end
          end
        end
      end
      if (l_18().FindFirstChild(l_18(), "Sweet Chalice") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Sweet Chalice")) and (game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Cookie Crafter") or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Cake Guard") or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Baking Staff") or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Head Baker")) then
        local l_0, children, l_2 = pairs()
        for l_3, l_4 in l_0 do
          for l_3, l_4 in l_0 do
            if l_4.Name == "Cookie Crafter" or l_4.Name == "Cake Guard" or l_4.Name == "Baking Staff" or l_4.Name == "Head Baker" then
              task.wait()
              EquipTool(SelectWeaponFarm)
              Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
              l_4.HumanoidRootPart.CanCollide = false
              l_4.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
              l_4.HumanoidRootPart.Transparency = 1
              l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
              l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
              DoughKing_Farm_Name = l_4.Name
              DoughKing_Farm_CFrame = l_4.HumanoidRootPart.CFrame
              AutoClick()
              service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CakePrinceSpawner", true)
              service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CakePrinceSpawner")
              if not (not l_4.FindFirstChild(l_4, "HumanoidRootPart") or not l_4.FindFirstChild(l_4, "Humanoid") or 0 >= l_4.Humanoid.Health or not _G.AutoDoughKing or not l_4.Parent or l_4.Humanoid.Health <= 0 or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, l_4.Name)) then
                Tween()
                if (CFrame.new(-2077, 252, -12373).Position - l_20().Position).magnitude <= 300 then
                  l_20().CFrame = CFrame.new(-2077, 252, -12373)
                end
              end
            end
          end
        end
        if service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "God's Chalice") or l_18().FindFirstChild(l_18(), "God's Chalice") then
          if 10 <= GetMaterial("Conjured Cocoa") then
            service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "SweetChaliceNpc")
            task.wait(0.2)
          elseif not service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "God's Chalice") and not l_18().FindFirstChild(l_18(), "God's Chalice") then
            if (game.Workspace.Enemies.FindFirstChild(game.Workspace.Enemies, "Deandre") or game.Workspace.Enemies.FindFirstChild(game.Workspace.Enemies, "Urban") or game.Workspace.Enemies.FindFirstChild(game.Workspace.Enemies, "Diablo") or service_9.FindFirstChild(service_9, "Deandre") or service_9.FindFirstChild(service_9, "Urban") or service_9.FindFirstChild(service_9, "Diablo")) and (service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == true and (string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo") or string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban") or string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre"))) then
              if game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Diablo") or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Deandre") or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Urban") then
                local l_0, children, l_2 = pairs()
                for l_3, l_4 in l_0 do
                  for l_3, l_4 in l_0 do
                    if l_4.Name == "Diablo" or l_4.Name == "Urban" or l_4.Name == "Deandre" then
                      task.wait()
                      EquipTool(SelectWeaponFarm)
                      Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
                      l_4.HumanoidRootPart.CanCollide = false
                      l_4.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                      l_4.HumanoidRootPart.Transparency = 1
                      l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
                      l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
                      AutoClick()
                      if not l_4.FindFirstChild(l_4, "HumanoidRootPart") or not l_4.FindFirstChild(l_4, "Humanoid") or 0 >= l_4.Humanoid.Health or not _G.AutoDoughKing or not l_4.Parent or l_4.Humanoid.Health <= 0 or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, l_4.Name) then
                      elseif service_9.FindFirstChild(service_9, "Diablo") then
                        if l_63 then
                          BTP(service_9.FindFirstChild(service_9, "Diablo").HumanoidRootPart.CFrame)
                        else
                          Tween(service_9.FindFirstChild(service_9, "Diablo").HumanoidRootPart.CFrame)
                        end
                        if l_63 then
                          BTP(service_9.FindFirstChild(service_9, "Deandre").HumanoidRootPart.CFrame)
                        else
                          Tween(service_9.FindFirstChild(service_9, "Deandre").HumanoidRootPart.CFrame)
                        end
                      elseif service_9.FindFirstChild(service_9, "Deandre") and service_9.FindFirstChild(service_9, "Urban") then
                        if l_63 then
                          BTP(service_9.FindFirstChild(service_9, "Urban").HumanoidRootPart.CFrame)
                        else
                          Tween(service_9.FindFirstChild(service_9, "Urban").HumanoidRootPart.CFrame)
                        end
                        if game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Candy Rebel") or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Sweet Thief") or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Chocolate Bar Battler") or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Cocoa Warrior") then
                          local l_0, children, l_2 = pairs()
                          for l_3, l_4 in l_0 do
                            for l_3, l_4 in l_0 do
                              service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "EliteHunter")
                            end
                          end
                        else
                          Tween()
                          if (CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625).Position - l_20().Position).magnitude <= 150 then
                            l_20().CFrame = CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625)
                          end
                        end
                      end
                    end
                  end
                end
              end
              for l_3, l_4 in l_20() do
                if l_4.Name == "Candy Rebel" or l_4.Name == "Sweet Thief" or l_4.Name == "Chocolate Bar Battler" or l_4.Name == "Cocoa Warrior" then
                  task.wait()
                  EquipTool(SelectWeaponFarm)
                  Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
                  l_4.HumanoidRootPart.CanCollide = false
                  l_4.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  l_4.HumanoidRootPart.Transparency = 1
                  l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
                  l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
                  DoughKing_Farm_Name = l_4.Name
                  DoughKing_Farm_CFrame = l_4.HumanoidRootPart.CFrame
                  AutoClick()
                  if not l_4.FindFirstChild(l_4, "HumanoidRootPart") or not l_4.FindFirstChild(l_4, "Humanoid") or 0 >= l_4.Humanoid.Health or not _G.AutoDoughKing or not l_4.Parent or l_4.Humanoid.Health <= 0 then
                    for l_3, l_4 in l_20() do
                    end
                  else
                    for l_3, l_4 in l_20() do
                    end
                  end
                else
                  for l_3, l_4 in l_20() do
                  end
                end
              end
            end
          end
        end
      end
    end
    for l_3, l_4 in l_20() do
    end
  end
end)
end)
local craft_page_9 = tab_6.CraftPage(tab_6, "Race V4 Quest", 1)
craft_page_9.Toggle(craft_page_9, "Complete All Trial Race", AutoCompleteRace, function(a0)
  AutoCompleteRace = a0
end)
spawn(function()
  while r0 do
    if AutoCompleteRace and service_1.LocalPlayer.Data.Race.Value == "Human" then
      local l_0, descendants, l_2 = pairs()
      for l_3, l_4 in l_0 do
        for l_3, l_4 in l_0 do
          if not task.wait(0.1) then
          end
          local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
          if find_first_child and l_4.FindFirstChild(l_4, "HumanoidRootPart") and 0 < l_4.Humanoid.Health then
            pcall(function()
  while r0 do
    if not l_4.Parent or l_4.Humanoid.Health <= 0 then
    end
  end
end)
          end
          if service_1.LocalPlayer.Data.Race.Value == "Skypiea" then
            local l_0, descendants, l_2 = pairs()
            for l_3, l_4 in l_0 do
              for l_3, l_4 in l_0 do
                if l_4.Name == "snowisland_Cylinder.081" then
                  local new = CFrame.new(0, 0, 0)
                  TP2(l_4.CFrame * new)
                end
                if service_1.LocalPlayer.Data.Race.Value == "Fishman" then
                  local l_0, descendants, l_2 = pairs()
                  for l_3, l_4 in l_0 do
                    for l_3, l_4 in l_0 do
                      if l_4.Name == "HumanoidRootPart" then
                        local l_6 = l_4.CFrame
                        l_6 = l_6 * CFrame.new(20, 450, 0)
                        TP2(l_6)
                        l_6 = service_1.LocalPlayer
                        l_6 = l_6.Backpack
                        l_6 = l_6.GetChildren
                        local l_5, l_6, l_7 = pairs()
                        for l_8, l_9 in l_5 do
                          for l_8, l_9 in l_5 do
                            local a = l_9.IsA(l_9, "Tool")
                            if a and l_9.ToolTip == "Melee" then
                              l_19().EquipTool(l_19(), l_9)
                            end
                            l_6 = service_5
                            service_5.SendKeyEvent()
                            l_6 = service_5
                            service_5.SendKeyEvent()
                            l_6 = 0.2
                            task.wait(l_6)
                            l_6 = service_5
                            service_5.SendKeyEvent()
                            l_6 = service_5
                            service_5.SendKeyEvent()
                            l_6 = 0.2
                            task.wait(l_6)
                            l_6 = service_5
                            service_5.SendKeyEvent()
                            l_6 = service_5
                            service_5.SendKeyEvent()
                            l_6 = service_1.LocalPlayer
                            l_6 = l_6.Backpack
                            l_6 = l_6.GetChildren
                            local l_5, l_6, l_7 = pairs()
                            for l_8, l_9 in l_5 do
                              for l_8, l_9 in l_5 do
                                if l_9.IsA(l_9, "Tool") and l_9.ToolTip == "Blox Fruit" then
                                  l_19().EquipTool(l_19(), l_9)
                                end
                                l_6 = service_5
                                service_5.SendKeyEvent()
                                l_6 = service_5
                                service_5.SendKeyEvent()
                                l_6 = 0.2
                                task.wait(l_6)
                                l_6 = service_5
                                service_5.SendKeyEvent()
                                l_6 = service_5
                                service_5.SendKeyEvent()
                                l_6 = 0.2
                                task.wait(l_6)
                                l_6 = service_5
                                service_5.SendKeyEvent()
                                l_6 = service_5
                                service_5.SendKeyEvent()
                                l_6 = 0.5
                                task.wait(l_6)
                                l_6 = service_1.LocalPlayer
                                l_6 = l_6.Backpack
                                l_6 = l_6.GetChildren
                                local l_5, l_6, l_7 = pairs()
                                for l_8, l_9 in l_5 do
                                  for l_8, l_9 in l_5 do
                                    if l_9.IsA(l_9, "Tool") and l_9.ToolTip == "Sword" then
                                      l_19().EquipTool(l_19(), l_9)
                                    end
                                    l_6 = service_5
                                    service_5.SendKeyEvent()
                                    l_6 = service_5
                                    service_5.SendKeyEvent()
                                    l_6 = 0.2
                                    task.wait(l_6)
                                    l_6 = service_5
                                    service_5.SendKeyEvent()
                                    l_6 = service_5
                                    service_5.SendKeyEvent()
                                    l_6 = 0.2
                                    task.wait(l_6)
                                    l_6 = service_5
                                    service_5.SendKeyEvent()
                                    l_6 = service_5
                                    service_5.SendKeyEvent()
                                    l_6 = 0.5
                                    task.wait(l_6)
                                    l_6 = service_1.LocalPlayer
                                    l_6 = l_6.Backpack
                                    l_6 = l_6.GetChildren
                                    local l_5, l_6, l_7 = pairs()
                                    for l_8, l_9 in l_5 do
                                      for l_8, l_9 in l_5 do
                                        if l_9.IsA(l_9, "Tool") and l_9.ToolTip == "Gun" then
                                          l_19().EquipTool(l_19(), l_9)
                                        end
                                        service_5.SendKeyEvent()
                                        service_5.SendKeyEvent()
                                        task.wait(0.2)
                                        service_5.SendKeyEvent()
                                        service_5.SendKeyEvent()
                                        task.wait(0.2)
                                        service_5.SendKeyEvent()
                                        service_5.SendKeyEvent()
                                        if service_1.LocalPlayer.Data.Race.Value == "Cyborg" then
                                          TP2()
                                          if service_1.LocalPlayer.Data.Race.Value == "Ghoul" then
                                            local l_0, descendants, l_2 = pairs()
                                            for l_3, l_4 in l_0 do
                                              for l_3, l_4 in l_0 do
                                                if l_4.FindFirstChild(l_4, "Humanoid") and l_4.FindFirstChild(l_4, "HumanoidRootPart") and 0 < l_4.Humanoid.Health then
                                                  pcall(function()
  while r0 do
    if not l_4.Parent or l_4.Humanoid.Health <= 0 then
    end
  end
end)
                                                end
                                                if service_1.LocalPlayer.Data.Race.Value == "Mink" then
                                                  local l_0, descendants, service = pairs()
                                                end
                                                for l_3, l_4 in l_0 do
                                                  if l_4.Name == "StartPoint" then
                                                    TP2(l_4.CFrame * CFrame.new(0, 10, 0))
                                                  end
                                                  for l_3, l_4 in l_0 do
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                        for l_3, l_4 in l_0 do
                                        end
                                      end
                                    end
                                    for l_3, l_4 in l_0 do
                                    end
                                  end
                                end
                                for l_3, l_4 in l_0 do
                                end
                              end
                            end
                            for l_3, l_4 in l_0 do
                            end
                          end
                        end
                      end
                      for l_3, l_4 in l_0 do
                      end
                    end
                  end
                end
                for l_3, l_4 in l_0 do
                end
              end
            end
          end
          for l_3, l_4 in l_0 do
          end
        end
      end
    end
  end
  for l_3, l_4 in l_0 do
  end
end)
craft_page_9.Toggle(craft_page_9, "Auto Acient Quest", AutoFarmAcient, function(a0)
  AutoFarmAcient = a0
end)
craft_page_9.Toggle(craft_page_9, "Auto Use V4", false, function(a0)
  _G.UseAwakenZ = a0
end)
local new_1 = CFrame.new(216.211181640625, 126.9352035522461, -12599.0732421875)
spawn(function()
  while r0 do
    if AutoFarmAcient then
    end
  end
  pcall(function()
  local service = game.GetService(game, "Workspace")
  if service.Enemies.FindFirstChild(service.Enemies, "Cocoa Warrior") or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Chocolate Bar Battler") or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Sweet Thief") or game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Candy Rebel") then
    local service = game.GetService(game, "Workspace")
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        if l_4.Name == "Cocoa Warrior" or l_4.Name == "Chocolate Bar Battler" or l_4.Name == "Sweet Thief" or l_4.Name == "Candy Rebel" then
          local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
          if find_first_child and (l_4.FindFirstChild(l_4, "HumanoidRootPart") and 0 < l_4.Humanoid.Health) then
            while l_4.Humanoid.Health do
              if not l_4.Parent or l_4.Humanoid.Health <= 0 then
                BringAcient = false
              else
                task.wait()
                EquipTool(SelectWeaponFarm)
                BringAcient = true
                l_4.HumanoidRootPart.CanCollide = false
                l_4.Humanoid.WalkSpeed = 0
                l_4.Head.CanCollide = false
                FarmPos = l_4.HumanoidRootPart.CFrame
                Tween(l_4.HumanoidRootPart.CFrame * Pos)
                Click()
                if not AutoFarmAcient or not l_4.Parent or l_4.Humanoid.Health <= 0 then
                end
              end
            end
          end
        elseif l_63 then
          BTP(new_1)
        else
          Tween(new_1)
        end
      end
    end
  end
  local l_0, children, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      if l_4.Name == "Cocoa Warrior" then
        local new = CFrame.new(2, 20, 2)
        Tween(l_4.HumanoidRootPart.CFrame * new)
      elseif l_4.Name == "Chocolate Bar Battler" or (l_4.Name == "Sweet Thief" or l_4.Name == "Candy Rebel") then
        Tween(l_4.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
      end
    end
  end
end)
end)
spawn(function()
  pcall(function()
  while r0 do
    local l_0 = l_18()
    if AutoFarmAcient and l_0.RaceTransformed.Value == false then
    end
  end
  AutoFarmAcient = true
end)
end)
spawn(function()
  while r0 do
    pcall(function()
  if AutoFarmAcient then
    service_5.SendKeyEvent(service_5, true, "Y", false, game)
    task.wait(0.1)
    service_5.SendKeyEvent(service_5, false, "Y", false, game)
  end
end)
  end
end)
craft_page_9.Button(craft_page_9, "Auto Upgrade Tier", function(a0)
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "UpgradeRace", "Buy")
end)
craft_page_9.Button(craft_page_9, "Unlock Lever", function()
  venyx.Notify(venyx, "Unlocked")
  local service = game.GetService(game, "Workspace")
  if service.Map["Temple of Time"].Lever.Prompt.FindFirstChild(service.Map["Temple of Time"].Lever.Prompt, "ProximityPrompt") then
    game.GetService(game, "Workspace").Map["Temple of Time"].Lever.Prompt.FindFirstChild(game.GetService(game, "Workspace").Map["Temple of Time"].Lever.Prompt, "ProximityPrompt").Remove(game.GetService(game, "Workspace").Map["Temple of Time"].Lever.Prompt.FindFirstChild(game.GetService(game, "Workspace").Map["Temple of Time"].Lever.Prompt, "ProximityPrompt"))
  end
  task.wait(0.1)
  local service = game.GetService(game, "Workspace")
  Instance.new("ProximityPrompt").Parent = service.Map["Temple of Time"].Lever.Prompt
  Instance.new("ProximityPrompt").MaxActivationDistance = 10
  Instance.new("ProximityPrompt").ActionText = "Secrets Beholds Inside"
  Instance.new("ProximityPrompt").ObjectText = "An unknown lever of time"
  function onProximity()
    local service = game.GetService(game, "Workspace")
    local new = Vector3.new(0, -50, 0)
    local new = TweenInfo.new(10, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
    local create = service_3.Create(service_3, service.Map["Temple of Time"].MainDoor1, new, {Position = service.Map["Temple of Time"].MainDoor1.Position + new})
    create.Play(create)
    local service = game.GetService(game, "Workspace")
    local new_1 = Vector3.new(0, -50, 0)
    local new_1 = TweenInfo.new(10, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
    local create_1 = service_3.Create(service_3, service.Map["Temple of Time"].MainDoor2, new_1, {Position = service.Map["Temple of Time"].MainDoor2.Position + new_1})
    create_1.Play(create_1)
    local new_2 = Instance.new("Sound")
    new_2.Parent = workspace
    new_2.SoundId = "rbxassetid://1904813041"
    new_2.Play(new_2)
    new_2.Name = "POwfpxzxzfFfFF"
    local service = game.GetService(game, "Workspace")
    service.Map["Temple of Time"].Lever.Prompt.FindFirstChild(service.Map["Temple of Time"].Lever.Prompt, "ProximityPrompt").Remove(service.Map["Temple of Time"].Lever.Prompt.FindFirstChild(service.Map["Temple of Time"].Lever.Prompt, "ProximityPrompt"))
    task.wait(5)
    workspace.FindFirstChild(workspace, "POwfpxzxzfFfFF").Remove(workspace.FindFirstChild(workspace, "POwfpxzxzfFfFF"))
    game.GetService(game, "Workspace").Map["Temple of Time"].NoGlitching.Remove(game.GetService(game, "Workspace").Map["Temple of Time"].NoGlitching)
    game.GetService(game, "Workspace").Map["Temple of Time"].NoGlitching.Remove(game.GetService(game, "Workspace").Map["Temple of Time"].NoGlitching)
    game.GetService(game, "Workspace").Map["Temple of Time"].NoGlitching.Remove(game.GetService(game, "Workspace").Map["Temple of Time"].NoGlitching)
  end
  Instance.new("ProximityPrompt").Triggered.Connect(Instance.new("ProximityPrompt").Triggered, onProximity)
end)
craft_page_9.Button(craft_page_9, "Clock Acces", function()
  local service = game.GetService(game, "Workspace")
  service.Map["Temple of Time"].DoNotEnter.Remove(service.Map["Temple of Time"].DoNotEnter)
  game.GetService(game, "Workspace").Map["Temple of Time"].ClockRoomExit.Remove(game.GetService(game, "Workspace").Map["Temple of Time"].ClockRoomExit)
end)
craft_page_9.Button(craft_page_9, "Disabled Inf Stairs", function()
  local l_0 = l_18()
  l_0.InfiniteStairs.Disabled = value
end)
spawn(function()
  pcall(function()
  while r0 do
    local l_0 = l_18()
    if 1 <= l_0.RaceEnergy.Value then
      if l_18().RaceTransformed.Value == false then
        while l_18().RaceTransformed.Value do
          if l_18().RaceTransformed.Value == true then
          end
        end
      else
        if not task.wait() then
        end
        while task.wait() do
        end
      end
    end
  end
  while task.wait() do
  end
end)
end)
local craft_page_10 = tab_6.CraftPage(tab_6, "Teleports", 2)
Islandplace = {
  "Top Of GreatTree",
  "Timple Of Time",
  "Level Pull",
  "Acient One",
  "Cyborg Door",
  "Fish Door",
  "Ghoul Door",
  "Human Door",
  "Mink Door",
  "Sky Door"
}
craft_page_10.Dropdown(craft_page_10, "Select Place", Islandplace, "", function(a0)
  _G.SelectIslandRace = a0
end)
craft_page_10.Toggle(craft_page_10, "Teleport To Top Of GreatTree", _G.TeleportDoor, "", function(a0)
  _G.TeleportDoor = a0
  if _G.TeleportDoor == true then
    while _G.TeleportDoor == "Top Of GreatTree" do
      Tween()
      if not _G.TeleportDoor then
      end
    end
  end
end)
craft_page_10.Toggle(craft_page_10, "Teleport to Race Door", RaceDoors, function(a0)
  RaceDoors = a0
  CancelTween(RaceDoors)
end)
spawn(function()
  while r0 do
    if RaceDoors then
      if service_1.LocalPlayer.Data.Race.Value == "Human" then
        TP2()
        if service_1.LocalPlayer.Data.Race.Value == "Skypiea" then
          TP2()
          if service_1.LocalPlayer.Data.Race.Value == "Fishman" then
            TP2()
            if service_1.LocalPlayer.Data.Race.Value == "Cyborg" then
              TP2()
              if service_1.LocalPlayer.Data.Race.Value == "Ghoul" then
                TP2()
              end
              if service_1.LocalPlayer.Data.Race.Value == "Mink" then
              end
            end
          end
        end
      end
    else
      local wait = task.wait(0.1)
      if not wait then
      end
    end
  end
  TP2()
end)
craft_page_10.Button(craft_page_10, "Teleport to Safe Zone", function()
  TP2()
end)
craft_page_10.Button(craft_page_10, "Teleport to PVP Zone", function()
  TP2()
end)
local craft_page_11 = tab_5.CraftPage(tab_5, "Rough Sea", 1)
spawn(function()
  pcall(function()
  while r0 do
    local find_first_child = game.Workspace._WorldOrigin.Locations.FindFirstChild(game.Workspace._WorldOrigin.Locations, "Frozen Dimension")
    if find_first_child then
      FrozenIsland.Set(FrozenIsland, "��: Frozen Dimension Spawning")
    end
  end
  FrozenIsland.Set(FrozenIsland, "��: Frozen Dimension Not Found")
end)
end)
local label_4 = craft_page_11.Label(craft_page_11, "")
FrozenIsland = label_4
craft_page_11.Toggle(craft_page_11, "Auto Sail To Rough Sea", _G.BiirTrax, function(a0)
  if a0 then
    _G.BiirTrax = true
  else
    _G.BiirTrax = false
  end
  if _G.BiirTrax then
    local l_1 = l_20()
    local new = CFrame.new(-16921.853515625, 9.0863618850708, 433.9601135253906)
    l_1.CFrame = new
    task.wait(0.5)
    service_9.Remotes.CommF_.InvokeServer()
    function two(a0)
      pcall(function()
  local l_0 = l_19()
  l_0.Sit = false
  l_20().Anchored = false
end)
      local l_1 = l_20()
      if (l_1.Position - a0.Position).Magnitude <= 200 then
        pcall(function()
  tweenz.Cancel(tweenz)
end)
        l_20().CFrame = a0
      else
        local l_3 = l_20()
        local new = TweenInfo.new((l_3.Position - a0.Position).Magnitude / 325, Enum.EasingStyle.Linear)
        local service = game.service(game, "TWS")
        local l_3, l_4 = pcall(function()
  local l_2 = l_18()
  local create = service.Create(service, l_2.HumanoidRootPart, new, {CFrame = a0})
  tweenz = create
  tweenz.Play(tweenz)
end)
        err = l_4
        tween = l_3
        if not tween then
          return err
        end
      end
      function _TweenCanCle()
        tweenz.Cancel(tweenz)
      end
    end
    two()
    local l_3, l_4 = workspace.Boats.PirateBrigade.GetDescendants(workspace.Boats.PirateBrigade)
    for l_5, l_6 in next do
      for l_5, l_6 in next do
        local find = l_6.Name.find(l_6.Name, "VehicleSeat")
        if find then
          l_20().CFrame = l_6.CFrame
        end
      end
    end
  end
end)
spawn(function()
  while r0 do
    pcall(function()
  if _G.BiirTrax then
    local l_1, l_2 = workspace.Boats.PirateBrigade.GetDescendants(workspace.Boats.PirateBrigade)
    for l_3, l_4 in next do
      for l_3, l_4 in next do
        local find = l_4.Name.find(l_4.Name, "VehicleSeat")
        if find then
          task.wait(5)
          l_20().CFrame = l_4.CFrame
          break
        end
      end
    end
    local l_3, l_4 = workspace.Boats.PirateBrigade.GetDescendants(workspace.Boats.PirateBrigade)
    for l_5, l_6 in next do
      for l_5, l_6 in next do
        local find = l_6.Name.find(l_6.Name, "VehicleSeat")
        if find then
          task.wait(0.2)
          local l_7, l_8, l_9 = pairs({
            {name = "Terrorshark", variable = "bjirTerrorshark"},
            {name = "Shark", variable = "bjirShark"},
            {name = "Piranha", variable = "bjirPiranha"},
            {name = "FishBoat", variable = "bjirFishBoat"}
          })
          for l_10, l_11 in l_7 do
            for l_10, l_11 in l_7 do
              local service = game.GetService(game, "Workspace")
              if service.Enemies.FindFirstChild(service.Enemies, l_11.name) then
                l_19().Sit = false
                task.wait(0.1)
                _G[l_11.variable] = true
                while _G do
                  task.wait(0.2)
                end
                _G[l_11.variable] = false
                l_20().CFrame = l_6.CFrame
              end
              if game.Workspace._WorldOrigin.Locations.FindFirstChild(game.Workspace._WorldOrigin.Locations, "Frozen Dimension") then
                _G.BiirTrax = false
                task.wait(0.5)
                l_19().Sit = false
                task.wait(0.5)
                _G.BjirFrozenCuy = true
              end
            end
          end
        end
      end
    end
  end
end)
  end
end)
spawn(function()
  while r0 do
    pcall(function()
  if _G.BiirTrax then
    local l_1, children, l_3 = pairs()
    for l_4, l_5 in l_1 do
      for l_4, l_5 in l_1 do
        local find = table.find({
          "SmallGroup",
          "SmallCluster",
          "MediumGroup",
          "MediumFlat",
          "Large",
          "Largest"
        }, l_5.Name)
        if find and l_5.IsA(l_5, "Model") then
          local l_6, descendants, l_8 = pairs()
          for l_9, l_10 in l_6 do
            for l_9, l_10 in l_6 do
              local a = l_10.IsA(l_10, "BasePart")
              if a then
                l_10.CanCollide = false
              end
            end
          end
        end
      end
    end
  end
end)
  end
end)
spawn(function()
  while r0 do
    pcall(function()
  if _G.BiirTrax then
    task.wait(0.8)
    workspace.Boats.GetChildren(workspace.Boats)
    local l_2, l_3, l_4 = ipairs("PirateBrigade")
    for l_5, l_6 in l_2 do
      for l_5, l_6 in l_2 do
        local find_first_child = workspace.FindFirstChild(workspace, l_6)
        if find_first_child then
          local l_10 = find_first_child.PrimaryPart
          l_10 = l_10.Position
          l_10 = l_10 + find_first_child.PrimaryPart.CFrame.lookVector * 10
          while 0.1 < find_first_child.PrimaryPart.CFrame.lookVector * 10 do
            find_first_child.SetPrimaryPartCFrame(find_first_child, find_first_child.PrimaryPart.CFrame + find_first_child.PrimaryPart.CFrame.lookVector * 10.5)
            task.wait()
            if _G.BiirTrax then
            end
          end
        end
      end
    end
  end
end)
  end
end)
craft_page_11.Toggle(craft_page_11, "TP Frozen Dimension (Need Spawn)", false, function(a0)
  _G.BjirFrozenCuy = a0
  CancelTween(_G.BjirFrozenCuy)
end)
spawn(function()
  while r0 do
    pcall(function()
  local find_first_child = game.Workspace._WorldOrigin.Locations.FindFirstChild(game.Workspace._WorldOrigin.Locations, "Frozen Dimension")
  if _G.BjirFrozenCuy and find_first_child then
    Tween(find_first_child)
  end
end)
  end
end)
craft_page_11.Toggle(craft_page_11, "Auto Kill Terrorshark", _G.Makori_gay, function(a0)
  _G.bjirTerrorshark = a0
  CancelTween(_G.bjirTerrorshark)
end)
spawn(function()
  while r0 do
    if _G.bjirTerrorshark and World3 then
    end
  end
  pcall(function()
  local service = game.GetService(game, "Workspace")
  if service.Enemies.FindFirstChild(service.Enemies, "Terrorshark") then
    local l_1 = game
    l_1 = l_1.GetService
    l_1 = l_1(l_1, "Workspace")
    l_1 = l_1.Enemies
    l_1 = l_1.GetChildren
    local l_0, l_1, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        if l_4.Name == "Terrorshark" then
          local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
          if find_first_child and (l_4.FindFirstChild(l_4, "HumanoidRootPart") and 0 < l_4.Humanoid.Health) then
            while l_4.Humanoid.Health do
              if not l_4.Parent or l_4.Humanoid.Health <= 0 then
                MakoriGayMag = false
              else
                task.wait()
                EquipTool(SelectWeaponFarm)
                l_4.HumanoidRootPart.CanCollide = false
                l_4.Humanoid.WalkSpeed = 0
                l_4.Head.CanCollide = false
                MakoriGayMag = false
                PosGay = l_4.HumanoidRootPart.CFrame
                local new = CFrame.new(2, 63, 2)
                Tween(l_4.HumanoidRootPart.CFrame * new)
                service_6.CaptureController(service_6)
                service_6.Button1Down()
                if not _G.bjirTerrorshark or not l_4.Parent or l_4.Humanoid.Health <= 0 then
                end
              end
            end
          end
        end
      end
    end
  elseif service_9.FindFirstChild(service_9, "Terrorshark") then
    Tween(service_9.FindFirstChild(service_9, "Terrorshark").HumanoidRootPart.CFrame * CFrame.new(2, 60, 2))
  elseif _G.StardHop then
    Hop()
  end
end)
end)
craft_page_11.Toggle(craft_page_11, "Auto Kill Shark", _G.Makori_gay, function(a0)
  _G.bjirShark = a0
  CancelTween(_G.bjirShark)
end)
spawn(function()
  while r0 do
    if _G.bjirShark and World3 then
    end
  end
  pcall(function()
  local service = game.GetService(game, "Workspace")
  if service.Enemies.FindFirstChild(service.Enemies, "Shark") then
    local l_1 = game
    l_1 = l_1.GetService
    l_1 = l_1(l_1, "Workspace")
    l_1 = l_1.Enemies
    l_1 = l_1.GetChildren
    local l_0, l_1, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        if l_4.Name == "Shark" then
          local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
          if find_first_child and (l_4.FindFirstChild(l_4, "HumanoidRootPart") and 0 < l_4.Humanoid.Health) then
            while l_4.Humanoid.Health do
              if not l_4.Parent or l_4.Humanoid.Health <= 0 then
                MakoriGayMag = false
              else
                task.wait()
                EquipTool(SelectWeaponFarm)
                l_4.HumanoidRootPart.CanCollide = false
                l_4.Humanoid.WalkSpeed = 0
                l_4.Head.CanCollide = false
                MakoriGayMag = false
                PosGay = l_4.HumanoidRootPart.CFrame
                local new = CFrame.new(2, 60, 2)
                Tween(l_4.HumanoidRootPart.CFrame * new)
                service_6.CaptureController(service_6)
                service_6.Button1Down()
                if not _G.bjirShark or not l_4.Parent or l_4.Humanoid.Health <= 0 then
                end
              end
            end
          end
        end
      end
    end
  elseif service_9.FindFirstChild(service_9, "Shark") then
    Tween(service_9.FindFirstChild(service_9, "Shark").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
  elseif _G.StardHop then
    Hop()
  end
end)
end)
craft_page_11.Toggle(craft_page_11, "Auto Kill Piranha", _G.Makori_gay, function(a0)
  _G.bjirPiranha = a0
  CancelTween(_G.bjirPiranha)
end)
spawn(function()
  while r0 do
    if _G.bjirPiranha and World3 then
    end
  end
  pcall(function()
  local service = game.GetService(game, "Workspace")
  if service.Enemies.FindFirstChild(service.Enemies, "Piranha") then
    local l_1 = game
    l_1 = l_1.GetService
    l_1 = l_1(l_1, "Workspace")
    l_1 = l_1.Enemies
    l_1 = l_1.GetChildren
    local l_0, l_1, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        if l_4.Name == "Piranha" then
          local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
          if find_first_child and (l_4.FindFirstChild(l_4, "HumanoidRootPart") and 0 < l_4.Humanoid.Health) then
            while l_4.Humanoid.Health do
              if not l_4.Parent or l_4.Humanoid.Health <= 0 then
                MakoriGayMag = false
              else
                task.wait()
                EquipTool(SelectWeaponFarm)
                l_4.HumanoidRootPart.CanCollide = false
                l_4.Humanoid.WalkSpeed = 0
                l_4.Head.CanCollide = false
                MakoriGayMag = false
                PosGay = l_4.HumanoidRootPart.CFrame
                local new = CFrame.new(2, 60, 2)
                Tween(l_4.HumanoidRootPart.CFrame * new)
                service_6.CaptureController(service_6)
                service_6.Button1Down()
                if not _G.bjirPiranha or not l_4.Parent or l_4.Humanoid.Health <= 0 then
                end
              end
            end
          end
        end
      end
    end
  elseif service_9.FindFirstChild(service_9, "Piranha") then
    Tween(service_9.FindFirstChild(service_9, "Piranha").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
  elseif _G.StardHop then
    Hop()
  end
end)
end)
craft_page_11.Toggle(craft_page_11, "Auto Kill GhostShip", _G.bjirFishBoat, function(a0)
  _G.bjirFishBoat = a0
  CancelTween(_G.bjirFishBoat)
end)

function CheckPirateBoat()
  local service = game.GetService(game, "Workspace")
  local l_2, l_3 = service.Enemies.GetChildren(service.Enemies)
  for l_4, l_5 in next do
    for l_4, l_5 in next do
      local find = table.find({"FishBoat"}, l_5.Name)
      if find and l_5.FindFirstChild(l_5, "Health") and 0 < l_5.Health.Value then
        return l_5
      end
    end
  end
end

spawn(function()
  while r0 do
    pcall(function()
  local check_pirate_boat = CheckPirateBoat()
  if _G.bjirFishBoat and check_pirate_boat then
    service_5.SendKeyEvent(service_5, true, 32, false, game)
    task.wait(0.5)
    service_5.SendKeyEvent(service_5, false, 32, false, game)
    while not service_5 do
      local check_pirate_boat = CheckPirateBoat()
      if CheckPirateBoat().Health.Value <= 0 or not check_pirate_boat then
        getgenv().psskill = nil
        bjirFullPower = false
        matquyenkiemsoat = false
        getgenv().noclip = false
      else
        task.wait()
        local new = CFrame.new(0, -20, 0)
        spawn()
        matquyenkiemsoat = true
        getgenv().noclip = true
        bjirFullPower = true
        local l_2 = l_20()
        local new = CFrame.new(0, -5, 0)
        getgenv().psskill = l_2.CFrame * new
        if CheckPirateBoat().Parent or CheckPirateBoat().Health.Value <= 0 or not CheckPirateBoat() then
        end
      end
    end
  end
end)
  end
end)
spawn(function()
  while r0 do
    if _G.bjirFishBoat then
    end
  end
  pcall(function()
  local check_pirate_boat = CheckPirateBoat()
  if check_pirate_boat then
    service_6.CaptureController(service_6)
    service_6.Button1Down()
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        local a = l_4.IsA(l_4, "Tool")
        if a and l_4.ToolTip == "Melee" then
          l_19().EquipTool(l_19(), l_4)
        end
      end
    end
    service_5.SendKeyEvent()
    service_5.SendKeyEvent()
    task.wait(0.2)
    service_5.SendKeyEvent()
    service_5.SendKeyEvent()
    task.wait(0.2)
    service_5.SendKeyEvent()
    service_5.SendKeyEvent()
    task.wait(0.2)
    service_5.SendKeyEvent()
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        if l_4.IsA(l_4, "Tool") and l_4.ToolTip == "Blox Fruit" then
          l_19().EquipTool(l_19(), l_4)
        end
      end
    end
    service_5.SendKeyEvent()
    service_5.SendKeyEvent()
    task.wait(0.2)
    service_5.SendKeyEvent()
    service_5.SendKeyEvent()
    task.wait(0.2)
    service_5.SendKeyEvent()
    service_5.SendKeyEvent()
    task.wait(0.2)
    service_5.SendKeyEvent()
    service_5.SendKeyEvent()
    task.wait(0.6)
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        if l_4.IsA(l_4, "Tool") and l_4.ToolTip == "Sword" then
          l_19().EquipTool(l_19(), l_4)
        end
      end
    end
    service_5.SendKeyEvent()
    service_5.SendKeyEvent()
    task.wait(0.2)
    service_5.SendKeyEvent()
    service_5.SendKeyEvent()
    task.wait(0.2)
    service_5.SendKeyEvent()
    service_5.SendKeyEvent()
    task.wait(0.5)
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        if l_4.IsA(l_4, "Tool") and l_4.ToolTip == "Gun" then
          l_19().EquipTool(l_19(), l_4)
        end
      end
    end
    service_5.SendKeyEvent()
    service_5.SendKeyEvent()
    task.wait(0.2)
    service_5.SendKeyEvent()
    service_5.SendKeyEvent()
    task.wait(0.2)
    service_5.SendKeyEvent()
    service_5.SendKeyEvent()
  end
end)
end)
craft_page_11.Toggle(craft_page_11, "Get Anchor (Need Material)", _G.BjirAnchorCuy, function(a0)
  local l_2 = function(a0, a1)
  local l_2, invoke_server, l_4 = pairs()
  for l_5, l_6 in l_2 do
    for l_5, l_6 in l_2 do
      if l_6.Type == "Material" and l_6.Name == a0 and a1 <= l_6.Count then
        return true
      end
    end
  end
  return false
end("Monster Magnet", 1)
  if a0 and l_2 then
    _G.BjirAnchorCuy = true
  elseif a0 and function(a0, a1)
  local l_2, invoke_server, l_4 = pairs()
  for l_5, l_6 in l_2 do
    for l_5, l_6 in l_2 do
      if l_6.Type == "Material" and l_6.Name == a0 and a1 <= l_6.Count then
        return true
      end
    end
  end
  return false
end("Terror Eyes", 2) and function(a0, a1)
  local l_2, invoke_server, l_4 = pairs()
  for l_5, l_6 in l_2 do
    for l_5, l_6 in l_2 do
      if l_6.Type == "Material" and l_6.Name == a0 and a1 <= l_6.Count then
        return true
      end
    end
  end
  return false
end("Electric Wing", 8) and function(a0, a1)
  local l_2, invoke_server, l_4 = pairs()
  for l_5, l_6 in l_2 do
    for l_5, l_6 in l_2 do
      if l_6.Type == "Material" and l_6.Name == a0 and a1 <= l_6.Count then
        return true
      end
    end
  end
  return false
end("Fool's Gold", 20) and function(a0, a1)
  local l_2, invoke_server, l_4 = pairs()
  for l_5, l_6 in l_2 do
    for l_5, l_6 in l_2 do
      if l_6.Type == "Material" and l_6.Name == a0 and a1 <= l_6.Count then
        return true
      end
    end
  end
  return false
end("Shark Tooth", 10) then
    service_9.Remotes.CommF_.InvokeServer()
    service_9.Remotes.CommF_.InvokeServer()
    task.wait(0.5)
    _G.BjirAnchorCuy = true
  elseif a0 and function(a0, a1)
  local l_2, invoke_server, l_4 = pairs()
  for l_5, l_6 in l_2 do
    for l_5, l_6 in l_2 do
      if l_6.Type == "Material" and l_6.Name == a0 and a1 <= l_6.Count then
        return true
      end
    end
  end
  return false
end("Monster Magnet", 1) then
    if not function(a0, a1)
  local l_2, invoke_server, l_4 = pairs()
  for l_5, l_6 in l_2 do
    for l_5, l_6 in l_2 do
      if l_6.Type == "Material" and l_6.Name == a0 and a1 <= l_6.Count then
        return true
      end
    end
  end
  return false
end("Terror Eyes", 2) and not function(a0, a1)
  local l_2, invoke_server, l_4 = pairs()
  for l_5, l_6 in l_2 do
    for l_5, l_6 in l_2 do
      if l_6.Type == "Material" and l_6.Name == a0 and a1 <= l_6.Count then
        return true
      end
    end
  end
  return false
end("Electric Wing", 8) and not function(a0, a1)
  local l_2, invoke_server, l_4 = pairs()
  for l_5, l_6 in l_2 do
    for l_5, l_6 in l_2 do
      if l_6.Type == "Material" and l_6.Name == a0 and a1 <= l_6.Count then
        return true
      end
    end
  end
  return false
end("Fool's Gold", 20) and not function(a0, a1)
  local l_2, invoke_server, l_4 = pairs()
  for l_5, l_6 in l_2 do
    for l_5, l_6 in l_2 do
      if l_6.Type == "Material" and l_6.Name == a0 and a1 <= l_6.Count then
        return true
      end
    end
  end
  return false
end("Shark Tooth", 10) then
      _G.BjirAnchorCuy = false
      l_21("! WARNING !", "You need more materials to buy a Monster Magnet.", 3)
    else
      _G.BjirAnchorCuy = false
    end
  end
  if _G.BjirAnchorCuy then
    local new = CFrame.new(-16921.853515625, 9.0863618850708, 433.9601135253906)
    l_20().CFrame = new
    task.wait(0.5)
    service_9.Remotes.CommF_.InvokeServer()
    function two(a0)
      pcall(function()
  local l_0 = l_19()
  l_0.Sit = false
  l_20().Anchored = false
end)
      local l_1 = l_20()
      if (l_1.Position - a0.Position).Magnitude <= 200 then
        pcall(function()
  tweenz.Cancel(tweenz)
end)
        l_20().CFrame = a0
      else
        local l_3 = l_20()
        local new = TweenInfo.new((l_3.Position - a0.Position).Magnitude / 325, Enum.EasingStyle.Linear)
        local service = game.service(game, "TWS")
        local l_3, l_4 = pcall(function()
  local l_2 = l_18()
  local create = service.Create(service, l_2.HumanoidRootPart, new, {CFrame = a0})
  tweenz = create
  tweenz.Play(tweenz)
end)
        err = l_4
        tween = l_3
        if not tween then
          return err
        end
      end
      function _TweenCanCle()
        tweenz.Cancel(tweenz)
      end
    end
    two()
    local l_4, l_5 = workspace.Boats.PirateBrigade.GetDescendants(workspace.Boats.PirateBrigade)
    for l_6, l_7 in next do
      for l_6, l_7 in next do
        local find = l_7.Name.find(l_7.Name, "VehicleSeat")
        if find then
          l_20().CFrame = l_7.CFrame
        end
      end
    end
  end
end)
spawn(function()
  while r0 do
    pcall(function()
  if _G.BjirAnchorCuy then
    local l_1, l_2 = workspace.Boats.PirateBrigade.GetDescendants(workspace.Boats.PirateBrigade)
    for l_3, l_4 in next do
      for l_3, l_4 in next do
        local find = l_4.Name.find(l_4.Name, "VehicleSeat")
        if find then
          task.wait(5)
          l_20().CFrame = l_4.CFrame
          break
        end
      end
    end
    local l_3, l_4 = workspace.Boats.PirateBrigade.GetDescendants(workspace.Boats.PirateBrigade)
    for l_5, l_6 in next do
      for l_5, l_6 in next do
        local find = l_6.Name.find(l_6.Name, "VehicleSeat")
        if find then
          task.wait(0.2)
          local l_7, l_8, l_9 = pairs({
            {name = "Terrorshark", variable = "bjirTerrorshark"},
            {name = "Shark", variable = "bjirShark"},
            {name = "Piranha", variable = "bjirPiranha"},
            {name = "FishBoat", variable = "bjirFishBoat"}
          })
          for l_10, l_11 in l_7 do
            for l_10, l_11 in l_7 do
              local service = game.GetService(game, "Workspace")
              if service.Enemies.FindFirstChild(service.Enemies, l_11.name) then
                l_19().Sit = false
                task.wait(0.1)
                _G[l_11.variable] = true
                while _G do
                  task.wait(0.2)
                end
                _G[l_11.variable] = false
                l_20().CFrame = l_6.CFrame
              end
              if game.Workspace._WorldOrigin.Locations.FindFirstChild(game.Workspace._WorldOrigin.Locations, "Frozen Dimension") then
                _G.BjirAnchorCuy = false
                task.wait(0.5)
                l_19().Sit = false
                task.wait(0.5)
                _G.BjirFrozenCuy = true
              end
            end
          end
        end
      end
    end
  end
end)
  end
end)
spawn(function()
  while r0 do
    pcall(function()
  if _G.BjirAnchorCuy then
    local l_1, children, l_3 = pairs()
    for l_4, l_5 in l_1 do
      for l_4, l_5 in l_1 do
        local find = table.find({
          "SmallGroup",
          "SmallCluster",
          "MediumGroup",
          "MediumFlat",
          "Large",
          "Largest"
        }, l_5.Name)
        if find and l_5.IsA(l_5, "Model") then
          local l_6, descendants, l_8 = pairs()
          for l_9, l_10 in l_6 do
            for l_9, l_10 in l_6 do
              local a = l_10.IsA(l_10, "BasePart")
              if a then
                l_10.CanCollide = false
              end
            end
          end
        end
      end
    end
  end
end)
  end
end)
spawn(function()
  while r0 do
    pcall(function()
  if _G.BiirTrax then
    task.wait(0.8)
    local children = workspace.Boats.GetChildren(workspace.Boats)
    local l_2, l_3, l_4 = pairs(children)
    for l_5, l_6 in l_2 do
      for l_5, l_6 in l_2 do
        if l_6.Name == "PirateBrigade" then
          local l_9 = l_6.PrimaryPart
          l_9 = l_9.Position
          l_9 = l_9 + l_6.PrimaryPart.CFrame.lookVector * 10
          while 0.1 < l_6.PrimaryPart.CFrame.lookVector * 10 do
            l_6.SetPrimaryPartCFrame(l_6, l_6.PrimaryPart.CFrame + l_6.PrimaryPart.CFrame.lookVector * 10.5)
            task.wait()
            if _G.BiirTrax then
            end
          end
        end
      end
    end
  end
end)
  end
end)
tab_5.CraftPage(tab_5, "Sea Beast", 1).Toggle(tab_5.CraftPage(tab_5, "Sea Beast", 1), "Kill Sea Beast", false, function(a0)
  _G.AutoSeaBest = a0
  CancelTween(_G.AutoFarmSeabaest)
end)
spawn(function()
  while r0 do
    if _G.AutoSeaBest then
    end
  end
  pcall(function()
  local service = game.GetService(game, "Workspace")
  local l_0, children, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      local find_first_child = l_4.FindFirstChild(l_4, "HumanoidRootPart")
      if find_first_child then
        local l_6 = l_4.HumanoidRootPart
        l_6 = l_6.CFrame
        local new = CFrame.new(1, 450, 45)
        l_6 = l_6 * new
        Tween(l_6)
        l_6 = service_6
        service_6.CaptureController(l_6)
        l_6 = service_6
        service_6.Button1Down()
        l_6 = service_1.LocalPlayer
        l_6 = l_6.Backpack
        l_6 = l_6.GetChildren
        local l_5, l_6, l_7 = pairs()
        for l_8, l_9 in l_5 do
          for l_8, l_9 in l_5 do
            local a = l_9.IsA(l_9, "Tool")
            if a and l_9.ToolTip == "Melee" then
              l_19().EquipTool(l_19(), l_9)
            end
            l_6 = service_5
            service_5.SendKeyEvent()
            l_6 = service_5
            service_5.SendKeyEvent()
            l_6 = 0.2
            task.wait(l_6)
            l_6 = service_5
            service_5.SendKeyEvent()
            l_6 = service_5
            service_5.SendKeyEvent()
            l_6 = 0.2
            task.wait(l_6)
            l_6 = service_5
            service_5.SendKeyEvent()
            l_6 = service_5
            service_5.SendKeyEvent()
            l_6 = 0.2
            task.wait(l_6)
            l_6 = service_5
            service_5.SendKeyEvent()
            l_6 = service_1.LocalPlayer
            l_6 = l_6.Backpack
            l_6 = l_6.GetChildren
            local l_5, l_6, l_7 = pairs()
            for l_8, l_9 in l_5 do
              for l_8, l_9 in l_5 do
                if l_9.IsA(l_9, "Tool") and l_9.ToolTip == "Blox Fruit" then
                  l_19().EquipTool(l_19(), l_9)
                end
                l_6 = service_5
                service_5.SendKeyEvent()
                l_6 = service_5
                service_5.SendKeyEvent()
                l_6 = 0.2
                task.wait(l_6)
                l_6 = service_5
                service_5.SendKeyEvent()
                l_6 = service_5
                service_5.SendKeyEvent()
                l_6 = 0.2
                task.wait(l_6)
                l_6 = service_5
                service_5.SendKeyEvent()
                l_6 = service_5
                service_5.SendKeyEvent()
                l_6 = 0.2
                task.wait(l_6)
                l_6 = service_5
                service_5.SendKeyEvent()
                l_6 = service_5
                service_5.SendKeyEvent()
                l_6 = 0.6
                task.wait(l_6)
                l_6 = service_1.LocalPlayer
                l_6 = l_6.Backpack
                l_6 = l_6.GetChildren
                local l_5, l_6, l_7 = pairs()
                for l_8, l_9 in l_5 do
                  for l_8, l_9 in l_5 do
                    if l_9.IsA(l_9, "Tool") and l_9.ToolTip == "Sword" then
                      l_19().EquipTool(l_19(), l_9)
                    end
                    l_6 = service_5
                    service_5.SendKeyEvent()
                    l_6 = service_5
                    service_5.SendKeyEvent()
                    l_6 = 0.2
                    task.wait(l_6)
                    l_6 = service_5
                    service_5.SendKeyEvent()
                    l_6 = service_5
                    service_5.SendKeyEvent()
                    l_6 = 0.2
                    task.wait(l_6)
                    l_6 = service_5
                    service_5.SendKeyEvent()
                    l_6 = service_5
                    service_5.SendKeyEvent()
                    l_6 = 0.5
                    task.wait(l_6)
                    l_6 = service_1.LocalPlayer
                    l_6 = l_6.Backpack
                    l_6 = l_6.GetChildren
                    local l_5, l_6, l_7 = pairs()
                    for l_8, l_9 in l_5 do
                      for l_8, l_9 in l_5 do
                        if l_9.IsA(l_9, "Tool") and l_9.ToolTip == "Gun" then
                          l_19().EquipTool(l_19(), l_9)
                        end
                        service_5.SendKeyEvent()
                        service_5.SendKeyEvent()
                        task.wait(0.2)
                        service_5.SendKeyEvent()
                        service_5.SendKeyEvent()
                        task.wait(0.2)
                        service_5.SendKeyEvent()
                        service_5.SendKeyEvent()
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end)
end)
tab_5.CraftPage(tab_5, "Sea Beast", 1).Toggle(tab_5.CraftPage(tab_5, "Sea Beast", 1), "Kill PirateShips", _G.KillGhostShip, function(a0)
  _G.KillGhostShip = a0
  CancelTween(_G.KillGhostShip)
end)

function CheckPirateBoat()
  local service = game.GetService(game, "Workspace")
  local l_2, l_3 = service.Enemies.GetChildren(service.Enemies)
  for l_4, l_5 in next do
    for l_4, l_5 in next do
      local find = table.find({"PirateGrandBrigade", "PirateBrigade"}, l_5.Name)
      if find and l_5.FindFirstChild(l_5, "Health") and 0 < l_5.Health.Value then
        return l_5
      end
    end
  end
end

spawn(function()
  while r0 do
    if _G.KillGhostShip then
    end
  end
  pcall(function()
  local check_pirate_boat = CheckPirateBoat()
  if check_pirate_boat then
    service_5.SendKeyEvent(service_5, true, 32, false, game)
    task.wait(0.5)
    service_5.SendKeyEvent(service_5, false, 32, false, game)
    while CheckPirateBoat() do
      local check_pirate_boat = CheckPirateBoat()
      if not CheckPirateBoat().Parent or CheckPirateBoat().Health.Value <= 0 or not check_pirate_boat then
        getgenv().psskill = nil
        matquyenkiemsoat = false
        getgenv().noclip = false
      else
        task.wait()
        local new = CFrame.new(0, -20, 0)
        local tween = Tween(CheckPirateBoat().Engine.CFrame * new)
        spawn(tween, 1)
        matquyenkiemsoat = true
        getgenv().noclip = true
        local new = CFrame.new(0, -5, 0)
        getgenv().psskill = l_20().CFrame * new
        if not CheckPirateBoat() or not CheckPirateBoat().Parent or CheckPirateBoat().Health.Value <= 0 or not CheckPirateBoat() then
        end
      end
    end
  end
end)
end)
tab_5.CraftPage(tab_5, "Sea Beast", 1).Toggle(tab_5.CraftPage(tab_5, "Sea Beast", 1), "Kill Sea Beast Hop", false, function(a0)
  _G.AutoSeaBestHop = a0
end)
local craft_page_12 = tab_5.CraftPage(tab_5, "Config Rough Sea", 2)
craft_page_12.Dropdown(craft_page_12, "Select Weapon", {"Melee", "Blox Fruit", "Sword", "Gun"}, "", function(a0)
  SelectWeaponSeaFarm = a0
end)
spawn(function()
  while r0 do
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        if not task.wait() then
        end
        if l_4.ToolTip == SelectWeaponSeaFarm then
          SelectWeaponSeaFarm = l_4.Name
        end
      end
    end
  end
end)
DisSeaFarm = 30
craft_page_12.Textbox(craft_page_12, "Distance Sea Farm", DisSeaFarm, function(a0)
  DisSeaFarm = a0
end)
SpeedBoatTween = 200
craft_page_12.Textbox(craft_page_12, "Tween Boat Speed", SpeedBoatTween, function(a0)
  SpeedBoatTween = a0
end)
SpeedAllBoat = 100
craft_page_12.Textbox(craft_page_12, "Speed Boat Hack", SpeedAllBoat, function(a0)
  SpeedAllBoat = a0
  if SpeedAllBoat then
    local service = game.GetService(game, "Workspace")
    service.Boats.PirateBrigade.VehicleSeat.MaxSpeed = SpeedAllBoat
  end
end)
local craft_page_13 = tab_5.CraftPage(tab_5, "Kitsune Update", 2)
craft_page_13.Toggle(craft_page_13, "Auto Teleports To Kitsune Islan", _G.TptoKisuneIsland, function(a0)
  _G.TptoKisuneIsland = a0
end)
craft_page_13.Toggle(craft_page_13, "Auto Collect Azure", _G.ColletEmber, function(a0)
  _G.ColletEmber = a0
end)
spawn(function()
  while r0 do
    if _G.TptoKitsuneIsland then
    end
  end
  local new = CFrame.new(0, 100, 0)
  Tween(game.Workspace.Map.KitsuneIsland.ShrineActive.NeonShrinePart.CFrame * new)
end)
spawn(function()
  while r0 do
    if _G.TptoKitsuneIsland then
    end
  end
  pcall(function()
  local find_first_child = game.Workspace._WorldOrigin.Locations.FindFirstChild(game.Workspace._WorldOrigin.Locations, "Kitsune Island")
  if find_first_child then
    local find_first_child = game.Workspace._WorldOrigin.Locations.FindFirstChild(game.Workspace._WorldOrigin.Locations, "Kitsune Island")
    local new = CFrame.new(0, 100, 0)
    Tween(find_first_child.HumanoidRootPart.CFrame * new)
  end
end)
end)
spawn(function()
  while r0 do
    task.wait()
    pcall(function()
  if game.Workspace.EmberTemplate then
    local l_0 = l_20()
    l_0.CFrame = game.Workspace.EmberTemplate.Part.CFrame
  end
end)
  end
end)
local craft_page_14 = tab_4.CraftPage(tab_4, "Player Stats", 1)
SelectPoint = 1
craft_page_14.Textbox(craft_page_14, "Set Point", SelectPoint, function(a0)
  SelectPoint = a0
end)
craft_page_14.Toggle(craft_page_14, "Melee", Meleef, function(a0)
  Meleef = a0
  while r1 do
    if Meleef then
      service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "AddPoint", "Melee", SelectPoint)
    end
  end
end)
craft_page_14.Toggle(craft_page_14, "Defense", Defensef, function(a0)
  Defensef = a0
  while r1 do
    if Defensef then
      service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "AddPoint", "Defense", SelectPoint)
    end
  end
end)
craft_page_14.Toggle(craft_page_14, "Sword", Swordf, function(a0)
  Swordf = a0
  while r1 do
    if Swordf then
      service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "AddPoint", "Sword", SelectPoint)
    end
  end
end)
craft_page_14.Toggle(craft_page_14, "Gun", Gunf, function(a0)
  Gunf = a0
  while r1 do
    if Gunf then
      service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "AddPoint", "Gun", SelectPoint)
    end
  end
end)
craft_page_14.Toggle(craft_page_14, "Devil Fruit", DevilFruitf, function(a0)
  DevilFruitf = a0
  while r1 do
    if DevilFruitf then
      service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "AddPoint", "Demon Fruit", SelectPoint)
    end
  end
end)
local craft_page_15 = tab_4.CraftPage(tab_4, "Combat", 2)
local label_4 = craft_page_15.Label(craft_page_15, "Players")
spawn(function()
  while r0 do
    pcall(function()
  local l_0, players, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      if l_3 == 12 then
        label_4.Set(label_4, "Players :" .. " " .. l_3 .. " " .. "/" .. " " .. "12" .. " " .. "(Max)")
      elseif l_3 == 1 then
        label_4.Set(label_4, "Player :" .. " " .. l_3 .. " " .. "/" .. " " .. "12")
      else
        label_4.Set(label_4, "Players :" .. " " .. l_3 .. " " .. "/" .. " " .. "12")
      end
    end
  end
end)
  end
end)
Playerslist = {}
local l_100, children, l_102 = pairs()
for l_103, l_104 in l_100 do
  for l_103, l_104 in l_100 do
    while l_0 do
    end
    for l_28, l_29 in l_25 do
    end
    for l_71, l_72 in l_68 do
    end
    table.insert(Playerslist, l_104.Name)
  end
end
local dropdown_1 = craft_page_15.Dropdown(craft_page_15, "Select Players", Playerslist, "", function(a0)
  _G.SelectPly = a0
end)
craft_page_15.Button(craft_page_15, "Refresh Player", function()
  Playerslist = {}
  dropdown_1.Clear(dropdown_1)
  local l_0, children, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      dropdown_1.Add(dropdown_1, l_4.Name)
    end
  end
end)
craft_page_15.Toggle(craft_page_15, "Spectate Player", false, function(a0)
  SpectatePlys = a0
  l_19()
  service_1.FindFirstChild(service_1, _G.SelectPly)
  while service_1 == false do
  end
  local service = game.GetService(game, "Workspace")
  local l_4 = l_19()
  service.Camera.CameraSubject = l_4
end)
craft_page_15.Toggle(craft_page_15, "Teleport", false, function(a0)
  _G.TeleportPly = a0
  pcall(function()
  Tween(service_1[_G.SelectPly].Character.HumanoidRootPart.CFrame)
  task.wait()
  if not _G.TeleportPly or _G.TeleportPly == false then
    CancelTween(_G.TeleportPly)
  end
end)
end)
craft_page_15.Toggle(craft_page_15, "Auto Farm Player", false, function(a0)
  _G.Auto_Kill_Ply = a0
  CancelTween(_G.Auto_Kill_Ply)
end)
spawn(function()
  while r0 do
    if _G.Auto_Kill_Ply then
    end
  end
  pcall(function()
  local find_first_child = service_1.FindFirstChild(service_1, _G.SelectPly)
  task.wait()
  EquipTool(SelectWeaponFarm)
  service_1.FindFirstChild(service_1, _G.SelectPly).Character.HumanoidRootPart.CanCollide = false
  local find_first_child = service_1.FindFirstChild(service_1, _G.SelectPly)
  local new = CFrame.new(0, 35, 0)
  Tween(find_first_child.Character.HumanoidRootPart.CFrame * new)
  spawn(function()
  pcall(function()
  if SelectWeaponFarm == SelectWeaponSword then
    local find_first_child = service_1.FindFirstChild(service_1, _G.SelectPly)
    l_18()[SelectWeaponMelee].RemoteFunctionShoot.InvokeServer()
  else
    service_6.CaptureController(service_6)
    service_6.Button1Down()
  end
end)
end)
  if _G.SelectPly == nil or not find_first_child or 0 >= service_1.FindFirstChild(service_1, _G.SelectPly).Character.Humanoid.Health or service_1.FindFirstChild(service_1, _G.SelectPly).Character.Humanoid.Health <= 0 or not service_1.FindFirstChild(service_1, _G.SelectPly) or not _G.Auto_Kill_Ply then
  end
end)
end)
spawn(function()
  while r0 do
    pcall(function()
  local l_1, players, l_3 = pairs()
  for l_4, l_5 in l_1 do
    for l_4, l_5 in l_1 do
      local l_8 = l_20()
      local distance_from_character = l_5.DistanceFromCharacter(l_5, l_8.Position)
      if l_5.Name ~= service_1.LocalPlayer.Name and distance_from_character < math.huge then
        PlayerSelectAimbot = l_5.Name
      end
    end
  end
end)
  end
end)
craft_page_15.Toggle(craft_page_15, "Aimbot Gun", false, function(a0)
  _G.Aimbot_Gun = a0
end)
spawn(function()
  while r0 do
    local l_0 = l_18()
    if _G.Aimbot_Gun and l_0.FindFirstChild(l_0, SelectWeaponMelee) then
    end
  end
  pcall(function()
  local l_0 = l_18()
  l_0[SelectWeaponMelee].Cooldown.Value = 0
  local find_first_child = service_1.FindFirstChild(service_1, PlayerSelectAimbot)
  l_18()[SelectWeaponMelee].RemoteFunctionShoot.InvokeServer()
  service_6.CaptureController(service_6)
  service_6.Button1Down()
end)
end)
craft_page_15.Toggle(craft_page_15, "Aimbot Skill", false, function(a0)
  _G.Aimbot_Skill = a0
end)
spawn(function()
  pcall(function()
  while r0 do
    local l_0 = l_18()
    local l_1 = l_18()
    if _G.Aimbot_Skill and PlayerSelectAimbot ~= nil and l_0.FindFirstChildOfClass(l_0, "Tool") and l_18()[l_1.FindFirstChildOfClass(l_1, "Tool").Name].FindFirstChild(l_18()[l_1.FindFirstChildOfClass(l_1, "Tool").Name], "MousePos") then
    end
  end
  local l_3 = l_18()
  l_18().FindFirstChild(l_18(), l_3.FindFirstChildOfClass(l_3, "Tool").Name).RemoteEvent.FireServer()
end)
end)
craft_page_15.Toggle(craft_page_15, "Enabled PvP", false, function(a0)
  _G.EnabledPvP = a0
end)
spawn(function()
  pcall(function()
  while r0 do
    if _G.EnabledPvP and service_1.LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
    end
  end
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "EnablePvp")
end)
end)
craft_page_15.Toggle(craft_page_15, "Safe Mode", false, function(a0)
  _G.Safe_Mode = a0
  CancelTween(_G.Safe_Mode)
end)
spawn(function()
  pcall(function()
  while r0 do
    if _G.Safe_Mode then
    end
  end
  local l_0 = l_20()
  local l_1 = l_20()
  l_0.CFrame = l_1.CFrame
end)
end)
craft_page_15.Button(craft_page_15, "Respawn", function()
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "SetTeam", "Pirates")
  task.wait()
end)
local tostring = tostring(service_1.LocalPlayer.leaderstats["Bounty/Honor"].Value)
local label_5 = craft_page_15.Label(craft_page_15, "Current Bounties :")
spawn(function()
  while r0 do
    pcall(function()
  local len = string.len(tostring)
  if len == 4 then
    local sub = string.sub(tostring, 2, 3)
    Bounty1 = string.sub(tostring, 1, 1) .. "." .. sub .. "K"
  elseif string.len(tostring) == 5 then
    Bounty1 = string.sub(tostring, 1, 2) .. "." .. string.sub(tostring, 3, 4) .. "K"
  elseif string.len(tostring) == 6 then
    Bounty1 = string.sub(tostring, 1, 3) .. "." .. string.sub(tostring, 4, 5) .. "K"
  elseif string.len(tostring) == 7 then
    Bounty1 = string.sub(tostring, 1, 1) .. "." .. string.sub(tostring, 2, 3) .. "M"
  elseif string.len(tostring) == 8 then
    Bounty1 = string.sub(tostring, 1, 2) .. "." .. string.sub(tostring, 3, 4) .. "M"
  elseif string.len(tostring) <= 3 then
    Bounty1 = tostring
  end
  if tonumber(tostring) == 25000000 then
    label_5.Set(label_5, "Current Bounties : " .. Bounty1 .. " [ Max ]")
  elseif tonumber(tostring) < 25000000 then
    label_5.Set(label_5, "Current Bounties : " .. Bounty1)
  end
end)
  end
end)
local label_6 = craft_page_15.Label(craft_page_15, "Earned")
tostring(service_1.LocalPlayer.leaderstats["Bounty/Honor"].Value)
local tostring_1 = tostring(service_1.LocalPlayer.leaderstats["Bounty/Honor"].Value - service_1.LocalPlayer.leaderstats["Bounty/Honor"].Value)
spawn(function()
  while r0 do
    pcall(function()
  local len = string.len(tostring_1)
  if len == 4 then
    local sub = string.sub(tostring_1, 2, 3)
    Earned1 = string.sub(tostring_1, 1, 1) .. "." .. sub .. "K"
  elseif string.len(tostring_1) == 5 then
    Earned1 = string.sub(tostring_1, 1, 2) .. "." .. string.sub(tostring_1, 3, 4) .. "K"
  elseif string.len(tostring_1) == 6 then
    Earned1 = string.sub(tostring_1, 1, 3) .. "." .. string.sub(tostring_1, 4, 5) .. "K"
  elseif string.len(tostring_1) == 7 then
    Earned1 = string.sub(tostring_1, 1, 1) .. "." .. string.sub(tostring_1, 2, 3) .. "M"
  elseif string.len(tostring_1) == 8 then
    Earned1 = string.sub(tostring_1, 1, 2) .. "." .. string.sub(tostring_1, 3, 4) .. "M"
  elseif string.len(tostring_1) <= 3 then
    Earned1 = tostring_1
  end
  local tonumber = tonumber(Earned1)
  label_6.Set(label_6, "Earned : " .. tonumber)
end)
  end
end)
craft_page_15.Toggle(craft_page_15, "Auto Farm Bounty", _G.AutoFarmBounty, function(a0)
  _G.AutoFarmBounty = a0
  CancelTween(_G.AutoFarmBounty)
end)
spawn(function()
  while r0 do
    pcall(function()
  if _G.AutoFarmBounty then
    local l_1 = l_18()
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        local a = l_4.IsA(l_4, "Shirt")
        if a then
          l_4.Destroy(l_4)
          if l_4.IsA(l_4, "Pants") then
            l_4.Destroy(l_4)
            if l_4.IsA(l_4, "Accessory") then
              l_4.Destroy(l_4)
            end
          end
        end
      end
    end
  end
end)
  end
end)
spawn(function()
  pcall(function()
  if _G.AutoFarmBounty then
    while _G.AutoFarmBounty do
      local l_0 = l_19()
      if 0 < l_0.Health then
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "SetSpawnPoint")
      elseif task.wait() then
      end
    end
  end
end)
end)
spawn(function()
  while r0 do
    pcall(function()
  local l_0 = l_18()
  if _G.AutoFarmBounty and not l_0.FindFirstChild(l_0, "HasBuso") then
    service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "Buso")
  end
end)
  end
end)
spawn(function()
  while r0 do
    pcall(function()
  if _G.AutoFarmBounty then
    local l_0 = l_18()
    l_0[SelectWeaponMelee].Cooldown.Value = 0
    spawn(function()
  service_1.LocalPlayer.PlayerGui.Main.Beli.Visible = true
  service_1.LocalPlayer.PlayerGui.Main.HP.Visible = true
  service_1.LocalPlayer.PlayerGui.Main.Energy.Visible = true
  service_1.LocalPlayer.PlayerGui.Main.StatsButton.Visible = true
  service_1.LocalPlayer.PlayerGui.Main.ShopButton.Visible = true
  service_1.LocalPlayer.PlayerGui.Main.Skills.Visible = false
  service_1.LocalPlayer.PlayerGui.Main.Level.Visible = true
  service_1.LocalPlayer.PlayerGui.Main.MenuButton.Visible = true
  service_1.LocalPlayer.PlayerGui.Main.Code.Visible = false
  service_1.LocalPlayer.PlayerGui.Main.Settings.Visible = false
  service_1.LocalPlayer.PlayerGui.Main.Mute.Visible = false
  service_1.LocalPlayer.PlayerGui.Main.CrewButton.Visible = false
  local l_0 = l_18()
  l_0.Animate.Disabled = true
end)
  end
end)
  end
end)
local new_2 = CFrame.new(-5084.8447265625, 316.48101806641, -3145.3752441406)
CastlePostoMansion = new_2
MansiontoCastlePos = CFrame.new(-12464.596679688, 376.30590820312, -7567.2626953125)
Castletophydra = CFrame.new(-5095.33984375, 316.48101806641, -3168.3134765625)
HydratoCastle = CFrame.new(5741.869140625, 611.94750976562, -282.61154174805)
spawn(function()
  while r0 do
    pcall(function()
  if _G.AutoFarmBounty then
    local service = game.GetService(game, "Workspace")
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        local wait_for_child = l_4.WaitForChild(l_4, "Humanoid")
        if l_4.Name ~= service_1.LocalPlayer.Name and 0 < wait_for_child.Health and (l_20().Position - l_4.HumanoidRootPart.Position).Magnitude <= 17000 then
          plyselecthunthelpold = l_4.Humanoid.Health
          while l_4.Humanoid.Health == "Pirates" do
            local new = CFrame.new(0, 60, -20)
            Tween(l_4.HumanoidRootPart.CFrame * new)
            spawn(function()
  local l_1 = l_20()
  if (l_4.HumanoidRootPart.Position - l_1.Position).Magnitude <= 150 then
    StartCheckTarget = true
  end
end)
            l_4.HumanoidRootPart.CanCollide = false
            spawn(function()
  pcall(function()
  local l_1 = l_18()
  l_1[SelectWeaponMelee].RemoteFunctionShoot.InvokeServer()
end)
end)
            TargetSelectHunt = l_4.Humanoid
            if _G.AutoFarmBounty == false or l_4.Humanoid.Health == 0 or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or not l_4.FindFirstChild(l_4, "Humanoid") or not l_4.Parent or NextplySelect == true then
              NextplySelect = false
              StartCheckTarget = false
            else
              task.wait()
              EquipTool(SelectWeaponFarm)
              NameTarget = l_4.Name
              if tostring(service_1.LocalPlayer.Team) == "Pirates" and (tostring(service_1.LocalPlayer.Team) == "Marines" and service_1[NameTarget].Team ~= service_1.LocalPlayer.Team) then
                Tween(l_4.HumanoidRootPart.CFrame * CFrame.new(0, 60, -20))
              end
            end
          end
        end
      end
    end
  end
end)
  end
end)
spawn(function()
  pcall(function()
  while r0 do
    if _G.AutoFarmBounty then
    end
  end
  service_1.LocalPlayer.PlayerGui.Main.InCombat.Visible = false
  service_1.LocalPlayer.PlayerGui.Main.SafeZone.Visible = false
end)
end)
spawn(function()
  pcall(function()
  while r0 do
    if _G.AutoFarmBounty and TargetSelectHunt ~= nil then
      if StartCheckTarget then
        task.wait(6.5)
        if TargetSelectHunt.Health == TargetSelectHunt.MaxHealth or plyselecthunthelpold <= TargetSelectHunt.Health then
        end
        task.wait(6.5)
      else
        local wait = task.wait()
        if not wait then
        end
      end
    end
  end
  NextplySelect = true
  TargetSelectHunt = nil
end)
end)
spawn(function()
  pcall(function()
  while r0 do
    if _G.AutoFarmBounty and service_1.LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
    end
  end
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "EnablePvp")
end)
end)
craft_page_15.Toggle(craft_page_15, "Auto Farm Bounty Hop", _G.AutoFarmBounty_Hop, function(a0)
  _G.AutoFarmBounty_Hop = a0
end)
spawn(function()
  while r0 do
    if _G.AutoFarmBounty and _G.AutoFarmBounty_Hop then
    end
  end
  pcall(function()
  task.wait(120)
  Hop()
end)
end)
craft_page_15.Button(craft_page_15, "Next Player", function()
  NextplySelect = true
  task.wait(0.1)
  NextplySelect = false
end)
craft_page_15.Slider(craft_page_15, "Lock Bounty", 1, 25000000, 750000, function(a0)
  _G.BountyLock = a0
end)
craft_page_15.Toggle(craft_page_15, "Start Bounty Lock", false, function(a0)
  _G.StartBountyLock = a0
end)
spawn(function()
  while r0 do
    if _G.StartBountyLock then
    end
  end
  pcall(function()
  if _G.BountyLock <= service_1.LocalPlayer.leaderstats["Bounty/Honor"].Value then
    service_1.LocalPlayer.Kick(service_1.LocalPlayer, "Successfully! Bounty Farm")
  end
end)
end)
tab_3.CraftPage(tab_3, "Other", 2).Toggle(tab_3.CraftPage(tab_3, "Other", 2), "Auto Dark Dagger", AutoDarkDagger, function(a0)
  AutoDarkDagger = a0
  CancelTween(AutoDarkDagger)
end)
spawn(function()
  while r0 do
    if AutoDarkDagger then
    end
  end
  pcall(function()
  local service = game.GetService(game, "Workspace")
  if service.Enemies.FindFirstChild(service.Enemies, "rip_indra True Form") then
    local service = game.GetService(game, "Workspace")
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
        task.wait()
        EquipTool(SelectWeaponFarm)
        Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
        l_4.HumanoidRootPart.CanCollide = false
        local new = Vector3.new(60, 60, 60)
        l_4.HumanoidRootPart.Size = new
        l_4.HumanoidRootPart.Transparency = 1
        l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
        l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
        AutoClick()
        if not (not find_first_child or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or l_4.Name ~= "rip_indra True Form" or not AutoDarkDagger or not l_4.Parent or l_4.Humanoid.Health <= 0) then
          Tween(service_9.FindFirstChild(service_9, "rip_indra True Form").HumanoidRootPart.CFrame)
        end
      end
    end
  end
end)
end)
tab_3.CraftPage(tab_3, "Other", 2).Toggle(tab_3.CraftPage(tab_3, "Other", 2), "Auto Hallow Sycthe", AutoHallowSycthe, function(a0)
  AutoHallowSycthe = a0
  CancelTween(AutoHallowSycthe)
end)
spawn(function()
  while r0 do
    if AutoHallowSycthe then
    end
  end
  pcall(function()
  local service = game.GetService(game, "Workspace")
  if service.Enemies.FindFirstChild(service.Enemies, "Soul Reaper") then
    local service = game.GetService(game, "Workspace")
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
        task.wait()
        EquipTool(SelectWeaponFarm)
        Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
        l_4.HumanoidRootPart.CanCollide = false
        local new = Vector3.new(60, 60, 60)
        l_4.HumanoidRootPart.Size = new
        l_4.HumanoidRootPart.Transparency = 1
        l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
        l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
        AutoClick()
        if not (not find_first_child or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or l_4.Name ~= "Soul Reaper" or l_4.Humanoid.Health <= 0 or not AutoHallowSycthe or not l_4.Parent) then
          loc3 = CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125)
          if service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Hallow Essence") or l_18().FindFirstChild(l_18(), "Hallow Essence") then
            while l_18().FindFirstChild(l_18(), "Hallow Essence") <= 8 do
            end
            EquipTool("Hallow Essence")
          else
            Tween(service_9.FindFirstChild(service_9, "Soul Reaper").HumanoidRootPart.CFrame)
          end
        end
      end
    end
  end
  while Tween <= 8 do
  end
end)
end)
tab_3.CraftPage(tab_3, "Other", 2).Toggle(tab_3.CraftPage(tab_3, "Other", 2), "Auto Citizen", AutoCitizen, function(a0)
  AutoCitizen = a0
  CancelTween(AutoCitizen)
  local find_first_child = service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Musketeer Hat")
  if find_first_child or l_18().FindFirstChild(l_18(), "Musketeer Hat") then
    CTCH = true
  end
  if CTCH and CheckCitizen then
    l_21("Auto Quest Citizen", "Musketeer Hat Successfully", 3)
  elseif service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CitizenQuestProgress", "Citizen") == 3 and CheckCitizen then
    l_21("Auto Quest Citizen", "Citizen Quest Completed", 3)
  end
end)
spawn(function()
  while r0 do
    if AutoCitizen then
    end
  end
  pcall(function()
  if 1800 <= service_1.LocalPlayer.Data.Level.Value then
    local invoke_server = service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CitizenQuestProgress")
    if invoke_server.KilledBandits == false then
      if string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") and (string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == true) then
        if game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Forest Pirate") then
          local service = game.GetService(game, "Workspace")
          local l_0, children, l_2 = pairs()
          for l_3, l_4 in l_0 do
            for l_3, l_4 in l_0 do
              task.wait()
              EquipTool(SelectWeaponFarm)
              Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
              l_4.HumanoidRootPart.CanCollide = false
              local new = Vector3.new(60, 60, 60)
              l_4.HumanoidRootPart.Size = new
              l_4.HumanoidRootPart.Transparency = 1
              l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
              l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
              Citizen_Farm_Name = l_4.Name
              Citizen_Farm_CFrame = l_4.HumanoidRootPart.CFrame
              AutoClick()
              local service = game.GetService(game, "Workspace")
              if l_4.Name ~= "Forest Pirate" or AutoCitizen == false or not l_4.Parent or l_4.Humanoid.Health <= 0 or service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not service.Enemies.FindFirstChild(service.Enemies, l_4.Name) then
              elseif l_63 then
                BTP()
              else
                Tween()
              end
            end
          end
        end
        Tween()
        if (Vector3.new(-12443.8671875, 332.40396118164, -7675.4892578125) - l_20().Position).Magnitude <= 30 then
          task.wait(1.5)
          service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "StartQuest", "CitizenQuest", 1)
        end
      end
      if 1800 <= service_1.LocalPlayer.Data.Level.Value and service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CitizenQuestProgress").KilledBoss == false then
        if service_1.LocalPlayer.PlayerGui.Main.Quest.Visible and (string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") and service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == true) then
          if game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Captain Elephant") then
            local l_0, children, l_2 = pairs()
            for l_3, l_4 in l_0 do
              for l_3, l_4 in l_0 do
                task.wait()
                EquipTool(SelectWeaponFarm)
                Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
                l_4.HumanoidRootPart.CanCollide = false
                l_4.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                l_4.HumanoidRootPart.Transparency = 1
                l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
                l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
                AutoClick()
                if l_4.Name ~= "Captain Elephant" or AutoCitizen == false or l_4.Humanoid.Health <= 0 or not l_4.Parent or service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not gamr.GetService(gamr, "Workspace").Enemies.FindFirstChild(gamr.GetService(gamr, "Workspace").Enemies, l_4.Name) then
                elseif l_63 then
                  BTP()
                else
                  Tween()
                end
              end
            end
          end
          Tween()
          if (CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125).Position - l_20().Position).Magnitude <= 4 then
            task.wait(1.5)
            service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CitizenQuestProgress", "Citizen")
          end
        end
        if 1800 <= service_1.LocalPlayer.Data.Level.Value and service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CitizenQuestProgress", "Citizen") == 2 then
          Tween()
        end
      end
    end
  end
end)
end)
tab_3.CraftPage(tab_3, "Other", 2).Toggle(tab_3.CraftPage(tab_3, "Other", 2), "Auto Evo Race V2", AutoEvoRace, function(a0)
  AutoEvoRace = a0
  CancelTween(AutoEvoRace)
end)
spawn(function()
  while r0 do
    if AutoEvoRace then
    end
  end
  pcall(function()
  local find_first_child = service_1.LocalPlayer.Data.Race.FindFirstChild(service_1.LocalPlayer.Data.Race, "Evolved")
  if not find_first_child then
    if service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "Alchemist", "1") == 0 then
      Tween()
      local l_1 = l_20()
      if (Vector3.new(-2779.83521, 72.9661407, -3574.02002) - l_1.Position).Magnitude <= 4 then
        task.wait(1.1)
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "Alchemist", "2")
      end
    elseif service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "Alchemist", "1") == 1 then
      if not service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Flower 1") and not l_18().FindFirstChild(l_18(), "Flower 1") then
        Tween(game.Workspace.Flower1.CFrame)
      elseif not service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Flower 2") and not l_18().FindFirstChild(l_18(), "Flower 2") then
        Tween(game.Workspace.Flower2.CFrame)
      elseif not service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Flower 3") and (not l_18().FindFirstChild(l_18(), "Flower 3") and game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Zombie")) then
        local l_0, children, l_2 = pairs()
        for l_3, l_4 in l_0 do
          for l_3, l_4 in l_0 do
            task.wait()
            EquipTool(SelectWeaponFarm)
            Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
            l_4.HumanoidRootPart.CanCollide = false
            local new = Vector3.new(60, 60, 60)
            l_4.HumanoidRootPart.Size = new
            l_4.HumanoidRootPart.Transparency = 1
            l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
            l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
            EvoV2_Farm_Name = l_4.Name
            EvoV2_Farm_CFrame = l_4.HumanoidRootPart.CFrame
            AutoClick()
            local find_first_child = service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Flower 3")
            if l_4.Name ~= "Zombie" or find_first_child or not l_4.Parent or l_4.Humanoid.Health <= 0 or AutoEvoRace == false or not game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, l_4.Name) then
            elseif l_63 then
              BTP()
            else
              Tween()
            end
          end
        end
        if service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "Alchemist", "1") == 2 then
          service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "Alchemist", "3")
        end
      end
    end
  end
end)
end)
tab_3.CraftPage(tab_3, "Other", 2).Toggle(tab_3.CraftPage(tab_3, "Other", 2), "Auto Bartilo", AutoBartilo, function(a0)
  AutoBartilo = a0
  CancelTween(AutoBartilo)
  local find_first_child = service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Warrior Helmet")
  if find_first_child or l_18().FindFirstChild(l_18(), "Warrior Helmet") then
    Success = true
  end
end)
spawn(function()
  while r0 do
    if AutoBartilo then
    end
  end
  pcall(function()
  if 850 <= service_1.LocalPlayer.Data.Level.Value then
    local invoke_server = service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BartiloQuestProgress", "Bartilo")
    if invoke_server == 0 then
      if string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and (string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == true) then
        if game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Swan Pirate") then
          local service = game.GetService(game, "Workspace")
          local l_0, children, l_2 = pairs()
          for l_3, l_4 in l_0 do
            for l_3, l_4 in l_0 do
              task.wait()
              EquipTool(SelectWeaponFarm)
              Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
              l_4.HumanoidRootPart.CanCollide = false
              local new = Vector3.new(60, 60, 60)
              l_4.HumanoidRootPart.Size = new
              l_4.HumanoidRootPart.Transparency = 1
              l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
              l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
              Bartilo_Farm_Name = l_4.Name
              Bartilo_Farm_CFrame = l_4.HumanoidRootPart.CFrame
              AutoClick()
              local service = game.GetService(game, "Workspace")
              if l_4.Name ~= "Swan Pirate" or not l_4.Parent or l_4.Humanoid.Health <= 0 or AutoBartilo == false or service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not service.Enemies.FindFirstChild(service.Enemies, l_4.Name) then
              elseif l_63 then
                BTP()
              else
                Tween()
              end
            end
          end
        end
        Tween()
        if (Vector3.new(-456.28952, 73.0200958, 299.895966) - l_20().Position).Magnitude <= 30 then
          task.wait(1.1)
          service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "StartQuest", "BartiloQuest", 1)
        end
      end
      if 850 <= service_1.LocalPlayer.Data.Level.Value and service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BartiloQuestProgress", "Bartilo") == 1 then
        if QuestBartilo == nil then
          Tween()
          if (Vector3.new(-456.28952, 73.0200958, 299.895966) - l_20().Position).Magnitude <= 30 then
            task.wait(1.1)
            service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BartiloQuestProgress", "Bartilo")
            QuestBartilo = 1
            if game.Workspace.Enemies.FindFirstChild(game.Workspace.Enemies, "Jeremy") then
              local l_0, children, l_2 = pairs()
              for l_3, l_4 in l_0 do
                for l_3, l_4 in l_0 do
                  task.wait()
                  EquipTool(SelectWeaponFarm)
                  Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
                  l_4.HumanoidRootPart.CanCollide = false
                  l_4.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                  l_4.HumanoidRootPart.Transparency = 1
                  l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
                  l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
                  AutoClick()
                  if not (l_4.Name ~= "Jeremy" or not l_4.Parent or l_4.Humanoid.Health <= 0 or AutoBartilo == false or not game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, l_4.Name)) then
                    Tween()
                    if QuestBartilo == 1 then
                      Tween()
                    end
                  end
                end
              end
            end
          end
        end
        if 850 <= service_1.LocalPlayer.Data.Level.Value and service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BartiloQuestProgress", "Bartilo") == 2 then
          Tween(game.GetService(game, "Workspace").Map.Dressrosa.BartiloPlates.Plate1.CFrame)
          task.wait(1)
          l_20().CFrame = game.GetService(game, "Workspace").Map.Dressrosa.BartiloPlates.Plate2.CFrame
          task.wait(1)
          l_20().CFrame = game.GetService(game, "Workspace").Map.Dressrosa.BartiloPlates.Plate3.CFrame
          task.wait(1)
          l_20().CFrame = game.GetService(game, "Workspace").Map.Dressrosa.BartiloPlates.Plate4.CFrame
          task.wait(1)
          l_20().CFrame = game.GetService(game, "Workspace").Map.Dressrosa.BartiloPlates.Plate5.CFrame
          task.wait(1)
          l_20().CFrame = game.GetService(game, "Workspace").Map.Dressrosa.BartiloPlates.Plate6.CFrame
          task.wait(1)
          l_20().CFrame = game.GetService(game, "Workspace").Map.Dressrosa.BartiloPlates.Plate7.CFrame
          task.wait(1)
          l_20().CFrame = game.GetService(game, "Workspace").Map.Dressrosa.BartiloPlates.Plate8.CFrame
          task.wait(1)
        end
      end
    end
  end
end)
end)
tab_3.CraftPage(tab_3, "Other", 2).Toggle(tab_3.CraftPage(tab_3, "Other", 2), "Auto Factory", AutoFactory, function(a0)
  AutoFactory = a0
  CancelTween(AutoFactory)
end)
spawn(function()
  while r0 do
    if AutoFactory then
      local find_first_child = game.Workspace.Enemies.FindFirstChild(game.Workspace.Enemies, "Core")
      if find_first_child then
        find_first_child = pairs
        local l_0, children, l_2 = find_first_child()
        for l_3, l_4 in l_0 do
          for l_3, l_4 in l_0 do
            if not task.wait() then
            end
            task.wait()
            Tween()
            EquipTool(SelectWeaponFarm)
            AutoClick()
            if l_4.Name ~= "Core" or 0 >= l_4.Humanoid.Health or not l_4.Parent or l_4.Humanoid.Health <= 0 or AutoFactory == false then
              if service_9.FindFirstChild(service_9, "Core") then
                while service_9.FindFirstChild(service_9, "Core") do
                  if (l_20().Position - Vector3.new(448.46756, 199.356781, -441.389252)).Magnitude <= 10 then
                  end
                end
              else
                while (l_20().Position - Vector3.new(448.46756, 199.356781, -441.389252)).Magnitude do
                end
              end
            end
            while (l_20().Position - Vector3.new(448.46756, 199.356781, -441.389252)).Magnitude do
            end
          end
        end
      end
    end
  end
  while (l_20().Position - Vector3.new(448.46756, 199.356781, -441.389252)).Magnitude do
  end
end)
tab_3.CraftPage(tab_3, "Other", 2).Toggle(tab_3.CraftPage(tab_3, "Other", 2), "Auto Don Swan", _G.SwanGlasses, function(a0)
  _G.SwanGlasses = a0
  CancelTween(_G.SwanGlasses)
end)
spawn(function()
  while r0 do
    if _G.SwanGlasses then
      local service = game.GetService(game, "Workspace")
      if service.Enemies.FindFirstChild(service.Enemies, "Don Swan") then
        local service = game.GetService(game, "Workspace")
        local l_0, children, l_2 = pairs()
        for l_3, l_4 in l_0 do
          for l_3, l_4 in l_0 do
            if not task.wait() then
            end
            local a = l_4.IsA(l_4, "Model")
            task.wait()
            EquipTool(SelectWeaponFarm)
            Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
            l_4.HumanoidRootPart.CanCollide = false
            local new = Vector3.new(60, 60, 60)
            l_4.HumanoidRootPart.Size = new
            l_4.HumanoidRootPart.Transparency = 1
            l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
            l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
            AutoClick()
            if (l_4.Name ~= "Don Swan" or 0 >= l_4.Humanoid.Health or not a or not l_4.FindFirstChild(l_4, "Humanoid") or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or _G.SwanGlasses == false or l_4.Humanoid.Health <= 0 or not l_4.Parent) and l_63 then
              BTP()
            end
            Tween()
          end
        end
      end
    end
  end
end)
if Third_Sea then
  tab_3.CraftPage(tab_3, "Other", 2).Toggle(tab_3.CraftPage(tab_3, "Other", 2), "Auto RIP Indra", RipIndra, function(a0)
  RipIndra = a0
  CancelTween(RipIndra)
end)
  spawn(function()
  while r0 do
    if RipIndra then
    end
  end
  pcall(function()
  local service = game.GetService(game, "Workspace")
  if service.Enemies.FindFirstChild(service.Enemies, "rip_indra True Form") then
    local service = game.GetService(game, "Workspace")
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
        task.wait()
        EquipTool(SelectWeaponFarm)
        Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
        l_4.HumanoidRootPart.CanCollide = false
        local new = Vector3.new(60, 60, 60)
        l_4.HumanoidRootPart.Size = new
        l_4.HumanoidRootPart.Transparency = 1
        l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
        l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
        AutoClick()
        if not (not find_first_child or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or l_4.Name ~= "rip_indra True Form" or l_4.Humanoid.Health <= 0 or not RipIndra or not l_4.Parent) then
          loc11 = CFrame.new(-5524.53271, 313.800537, -2918.07422, 0.964194059, 0, 0.265197694, 0, 1, 0, -0.265197694, 0, 0.964194059)
          Tween(loc11)
        end
      end
    end
  end
end)
end)
  tab_3.CraftPage(tab_3, "Other", 2).Toggle(tab_3.CraftPage(tab_3, "Other", 2), "Auto Rainbow", AutoRainbowHaki, function(a0)
  AutoRainbowHaki = a0
  CancelTween(AutoRainbowHaki)
end)
  spawn(function()
  while r0 do
    if AutoRainbowHaki then
    end
  end
  pcall(function()
  if service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
    local new = CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875)
    loc12 = new
    if l_63 then
      BTP(loc12)
    else
      Tween(loc12)
    end
    local l_1 = l_20()
    if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - l_1.Position).Magnitude <= 30 then
      task.wait(1.5)
      service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "HornedMan", "Bet")
    end
  elseif service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == true and (string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") and game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Stone")) then
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
        task.wait()
        EquipTool(SelectWeaponFarm)
        Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
        l_4.HumanoidRootPart.CanCollide = false
        local new = Vector3.new(60, 60, 60)
        l_4.HumanoidRootPart.Size = new
        l_4.HumanoidRootPart.Transparency = 1
        l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
        l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
        AutoClick()
        if not find_first_child or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or l_4.Name ~= "Stone" or AutoRainbowHaki == false or l_4.Humanoid.Health <= 0 or not l_4.Parent or service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
        elseif service_9.FindFirstChild(service_9, "Stone") then
          if l_63 then
            BTP(service_9.FindFirstChild(service_9, "Stone").HumanoidRootPart.CFrame)
          else
            Tween(service_9.FindFirstChild(service_9, "Stone").HumanoidRootPart.CFrame)
          end
          if service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == true and (string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Island Empress") and game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Island Empress")) then
            local l_0, children, l_2 = pairs()
            for l_3, l_4 in l_0 do
              for l_3, l_4 in l_0 do
                task.wait()
                EquipTool(SelectWeaponFarm)
                Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
                l_4.HumanoidRootPart.CanCollide = false
                l_4.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                l_4.HumanoidRootPart.Transparency = 1
                l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
                l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
                AutoClick()
                if not l_4.FindFirstChild(l_4, "Humanoid") or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or l_4.Name ~= "Island Empress" or AutoRainbowHaki == false or l_4.Humanoid.Health <= 0 or not l_4.Parent or service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                elseif service_9.FindFirstChild(service_9, "Island Empress") then
                  if l_63 then
                    BTP(service_9.FindFirstChild(service_9, "Island Empress").HumanoidRootPart.CFrame)
                  else
                    Tween(service_9.FindFirstChild(service_9, "Island Empress").HumanoidRootPart.CFrame)
                  end
                  if string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") and game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Kilo Admiral") then
                    local l_0, children, l_2 = pairs()
                    for l_3, l_4 in l_0 do
                      for l_3, l_4 in l_0 do
                        task.wait()
                        EquipTool(SelectWeaponFarm)
                        Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
                        l_4.HumanoidRootPart.CanCollide = false
                        l_4.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        l_4.HumanoidRootPart.Transparency = 1
                        l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
                        l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
                        AutoClick()
                        if not l_4.FindFirstChild(l_4, "Humanoid") or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or l_4.Name ~= "Kilo Admiral" or AutoRainbowHaki == false or l_4.Humanoid.Health <= 0 or not l_4.Parent or service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        elseif service_9.FindFirstChild(service_9, "Kilo Admiral") then
                          if l_63 then
                            BTP(service_9.FindFirstChild(service_9, "Kilo Admiral").HumanoidRootPart.CFrame)
                          else
                            Tween(service_9.FindFirstChild(service_9, "Kilo Admiral").HumanoidRootPart.CFrame)
                          end
                          if game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Captain Elephant") then
                            local l_0, children, l_2 = pairs()
                            for l_3, l_4 in l_0 do
                              for l_3, l_4 in l_0 do
                                if string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
                                  task.wait()
                                  EquipTool(SelectWeaponFarm)
                                  Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
                                  l_4.HumanoidRootPart.CanCollide = false
                                  l_4.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                  l_4.HumanoidRootPart.Transparency = 1
                                  l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
                                  l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
                                  AutoClick()
                                  if not l_4.FindFirstChild(l_4, "Humanoid") or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or l_4.Name ~= "Captain Elephant" or AutoRainbowHaki == false or l_4.Humanoid.Health <= 0 or not l_4.Parent or service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                                  elseif service_9.FindFirstChild(service_9, "Captain Elephant") then
                                    if l_63 then
                                      BTP(service_9.FindFirstChild(service_9, "Captain Elephant").HumanoidRootPart.CFrame)
                                    else
                                      Tween(service_9.FindFirstChild(service_9, "Captain Elephant").HumanoidRootPart.CFrame)
                                    end
                                    if game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Beautiful Pirate") then
                                      local l_0, children, l_2 = pairs()
                                      for l_3, l_4 in l_0 do
                                        for l_3, l_4 in l_0 do
                                          if string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
                                            task.wait()
                                            EquipTool(SelectWeaponFarm)
                                            Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
                                            l_4.HumanoidRootPart.CanCollide = false
                                            l_4.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            l_4.HumanoidRootPart.Transparency = 1
                                            l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
                                            l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
                                            AutoClick()
                                            if not l_4.FindFirstChild(l_4, "Humanoid") or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or l_4.Name ~= "Beautiful Pirate" or AutoRainbowHaki == false or l_4.Humanoid.Health <= 0 or not l_4.Parent or service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                                            elseif service_9.FindFirstChild(service_9, "Beautiful Pirate") then
                                              if l_63 then
                                                BTP(service_9.FindFirstChild(service_9, "Beautiful Pirate").HumanoidRootPart.CFrame)
                                              else
                                                Tween(service_9.FindFirstChild(service_9, "Beautiful Pirate").HumanoidRootPart.CFrame)
                                              end
                                              BTP(loc17)
                                              if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - l_20().Position).Magnitude <= 30 then
                                                task.wait(1.5)
                                                service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "HornedMan", "Bet")
                                              end
                                            end
                                            loc17 = CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875)
                                            if l_63 then
                                              Tween(loc17)
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end)
end)
  tab_3.CraftPage(tab_3, "Other", 2).Toggle(tab_3.CraftPage(tab_3, "Other", 2), "Auto Holytorch", AutoTorch, function(a0)
  AutoTorch = a0
  CancelTween(AutoTorch)
end)
  spawn(function()
  while r0 do
    if AutoTorch then
    end
  end
  pcall(function()
  task.wait(1)
  while task.wait do
    local l_0 = l_20()
    local new = Vector3.new(-10752, 417, -9366)
    if (l_0.Position - new).Magnitude <= 10 then
      task.wait(1)
    else
      Tween()
      task.wait()
      if not AutoTorch or (l_20().Position - Vector3.new(-10752, 417, -9366)).Magnitude <= 10 then
      end
    end
  end
  while (l_20().Position - Vector3.new(-10752, 417, -9366)).Magnitude do
    if (l_20().Position - Vector3.new(-11672, 334, -9474)).Magnitude <= 10 then
      task.wait(1)
    else
      Tween()
      task.wait()
      if not AutoTorch or (l_20().Position - Vector3.new(-11672, 334, -9474)).Magnitude <= 10 then
      end
    end
  end
  while (l_20().Position - Vector3.new(-11672, 334, -9474)).Magnitude do
    if (l_20().Position - Vector3.new(-12132, 521, -10655)).Magnitude <= 10 then
      task.wait(1)
    else
      Tween()
      task.wait()
      if not AutoTorch or (l_20().Position - Vector3.new(-12132, 521, -10655)).Magnitude <= 10 then
      end
    end
  end
  while (l_20().Position - Vector3.new(-12132, 521, -10655)).Magnitude do
    if (l_20().Position - Vector3.new(-13336, 486, -6985)).Magnitude <= 10 then
      task.wait(1)
    else
      Tween()
      task.wait()
      if not AutoTorch or (l_20().Position - Vector3.new(-13336, 486, -6985)).Magnitude <= 10 then
      end
    end
  end
  while (l_20().Position - Vector3.new(-13336, 486, -6985)).Magnitude do
    if (l_20().Position - Vector3.new(-13489, 332, -7925)).Magnitude <= 10 then
    end
  end
end)
end)
  tab_3.CraftPage(tab_3, "Other", 2).Toggle(tab_3.CraftPage(tab_3, "Other", 2), "Auto Soul Guitar", AutoSoulGuitar, function(a0)
  AutoSoulGuitar = a0
  CancelTween(AutoSoulGuitar)
end)
  spawn(function()
  while r0 do
    if AutoSoulGuitar then
    end
  end
  pcall(function()
  local weapon_inventory = GetWeaponInventory("Soul Guitar")
  if weapon_inventory == false then
    local l_1 = l_20()
    if (CFrame.new(-9681.458984375, 6.139880657196045, 6341.3720703125).Position - l_1.Position).Magnitude <= 5000 then
      if game.GetService(game, "Workspace").NPCs.FindFirstChild(game.GetService(game, "Workspace").NPCs, "Skeleton Machine") then
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "soulGuitarBuy", true)
      elseif game.GetService(game, "Workspace").Map["Haunted Castle"].Candle1.Transparency == 0 and game.GetService(game, "Workspace").Map["Haunted Castle"].Placard1.Left.Part.Transparency == 0 then
        Quest2 = true
        while true > 3 do
          if not AutoSoulGuitar then
            task.wait(1)
            fireclickdetector(game.GetService(game, "Workspace").Map["Haunted Castle"].Placard7.Left.ClickDetector)
            task.wait(1)
            fireclickdetector(game.GetService(game, "Workspace").Map["Haunted Castle"].Placard6.Left.ClickDetector)
            task.wait(1)
            fireclickdetector(game.GetService(game, "Workspace").Map["Haunted Castle"].Placard5.Left.ClickDetector)
            task.wait(1)
            fireclickdetector(game.GetService(game, "Workspace").Map["Haunted Castle"].Placard4.Right.ClickDetector)
            task.wait(1)
            fireclickdetector(game.GetService(game, "Workspace").Map["Haunted Castle"].Placard3.Left.ClickDetector)
            task.wait(1)
            fireclickdetector(game.GetService(game, "Workspace").Map["Haunted Castle"].Placard2.Right.ClickDetector)
            task.wait(1)
            fireclickdetector(game.GetService(game, "Workspace").Map["Haunted Castle"].Placard1.Right.ClickDetector)
            task.wait(1)
          else
            task.wait()
            Tween()
            if ((CFrame.new(-8762.69140625, 176.84783935546875, 6171.3076171875).Position - l_20().Position).Magnitude <= 3 or not AutoSoulGuitar) and (game.GetService(game, "Workspace").Map["Haunted Castle"].Tablet.Segment1.FindFirstChild(game.GetService(game, "Workspace").Map["Haunted Castle"].Tablet.Segment1, "ClickDetector") and game.GetService(game, "Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part1.FindFirstChild(game.GetService(game, "Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part1, "ClickDetector")) then
              Quest4 = true
              while true > 3 do
                if not AutoSoulGuitar then
                  task.wait(1)
                  Tween(game.GetService(game, "Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.CFrame)
                  task.wait(1)
                  fireclickdetector(game.GetService(game, "Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.ClickDetector)
                  task.wait(1)
                  Tween(game.GetService(game, "Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.CFrame)
                  task.wait(1)
                  fireclickdetector(game.GetService(game, "Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                  task.wait(1)
                  fireclickdetector(game.GetService(game, "Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                  task.wait(1)
                  fireclickdetector(game.GetService(game, "Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                  task.wait(1)
                  Tween(game.GetService(game, "Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.CFrame)
                  task.wait(1)
                  fireclickdetector(game.GetService(game, "Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                  task.wait(1)
                  fireclickdetector(game.GetService(game, "Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                  task.wait(1)
                  Tween(game.GetService(game, "Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.CFrame)
                  task.wait(1)
                  fireclickdetector(game.GetService(game, "Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.ClickDetector)
                  task.wait(1)
                  Tween(game.GetService(game, "Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.CFrame)
                  task.wait(1)
                  fireclickdetector(game.GetService(game, "Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                  task.wait(1)
                  fireclickdetector(game.GetService(game, "Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                  task.wait(1)
                  fireclickdetector(game.GetService(game, "Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                else
                  task.wait()
                  Tween()
                  if (CFrame.new(-9553.5986328125, 65.62338256835938, 6041.58837890625).Position - l_20().Position).Magnitude <= 3 or not AutoSoulGuitar then
                    Quest3 = true
                  elseif game.GetService(game, "Workspace").NPCs.FindFirstChild(game.GetService(game, "Workspace").NPCs, "Ghost") then
                    service_9.Remotes.CommF_.InvokeServer()
                    if game.Workspace.Enemies.FindFirstChild(game.Workspace.Enemies, "Living Zombie") then
                      local l_0, children, l_2 = pairs()
                      for unpack, l_4 in l_0 do
                        for l_3, l_4 in l_0 do
                          local find_first_child = l_4.FindFirstChild(l_4, "HumanoidRootPart")
                          task.wait()
                          EquipTool(SelectWeaponFarm)
                          Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
                          l_4.HumanoidRootPart.CanCollide = false
                          local new = Vector3.new(60, 60, 60)
                          l_4.HumanoidRootPart.Size = new
                          l_4.HumanoidRootPart.Transparency = 1
                          l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
                          l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
                          SoulGuitar_Farm_Name = l_4.Name
                          SoulGuitar_Farm_CFrame = l_4.HumanoidRootPart.CFrame
                          AutoClick()
                          if not (not find_first_child or not l_4.FindFirstChild(l_4, "Humanoid") or 0 >= l_4.Humanoid.Health or l_4.Name ~= "Living Zombie" or l_4.Humanoid.Health <= 0 or not l_4.Parent or not AutoSoulGuitar) then
                            Tween()
                          end
                        end
                      end
                      if string.find(service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "gravestoneEvent", 2), "Error") then
                        print("Go to Grave")
                        Tween()
                      elseif string.find(service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "gravestoneEvent", 2), "Nothing") then
                        print("Wait Next Night")
                      else
                        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "gravestoneEvent", 2, true)
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      Tween()
    end
  end
end)
end)
  tab_3.CraftPage(tab_3, "Other", 2).Toggle(tab_3.CraftPage(tab_3, "Other", 2), "Auto Tryluck Gravestone", AutoTryLuck, function(a0)
  AutoTryLuck = a0
  CancelTween(AutoTryLuck)
end)
  spawn(function()
  while r0 do
    if AutoTryLuck then
      if l_63 then
        BTP()
      else
        Tween()
      end
    else
      local wait = task.wait(0.1)
      if not wait then
      end
    end
  end
  task.wait(2)
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "gravestoneEvent", 1)
end)
  tab_3.CraftPage(tab_3, "Other", 2).Toggle(tab_3.CraftPage(tab_3, "Other", 2), "Auto Pray Gravestone", AutoPray, function(a0)
  AutoPray = a0
  CancelTween(AutoPray)
end)
  spawn(function()
  while r0 do
    if AutoPray then
      if l_63 then
        BTP()
      else
        Tween()
      end
    else
      local wait = task.wait(0.1)
      if not wait then
      end
    end
  end
  task.wait(2)
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "gravestoneEvent", 2)
end)
  tab_3.CraftPage(tab_3, "Other", 2).Toggle(tab_3.CraftPage(tab_3, "Other", 2), "Auto Advanced Dungeon", AutoAdvanceDungeon, function(a0)
  AutoAdvanceDungeon = a0
  CancelTween(AutoAdvanceDungeon)
end)
  spawn(function()
  while r0 do
    if AutoAdvanceDungeon then
    end
  end
  pcall(function()
  local l_0 = l_18()
  if l_0.FindFirstChild(l_0, "Bird-Bird: Phoenix") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Bird-Bird: Phoenix") then
    if service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, service_1.LocalPlayer.Data.DevilFruit.Value) then
      Tween()
      local l_1 = l_20()
      if 400 <= service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, service_1.LocalPlayer.Data.DevilFruit.Value).Level.Value and (CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875).Position - l_1.Position).Magnitude <= 10 then
        task.wait(1.5)
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "SickScientist", "Check")
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "SickScientist", "Heal")
      end
    else
      Tween()
      if l_18().FindFirstChild(l_18(), service_1.LocalPlayer.Data.DevilFruit.Value) and 400 <= l_18().FindFirstChild(l_18(), service_1.LocalPlayer.Data.DevilFruit.Value).Level.Value and (CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875).Position - l_20().Position).Magnitude <= 10 then
        task.wait(1.5)
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "SickScientist", "Check")
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "SickScientist", "Heal")
      end
    end
  end
end)
end)
  tab_3.CraftPage(tab_3, "Other", 2).Toggle(tab_3.CraftPage(tab_3, "Other", 2), "Auto Enchancement Haki", AutoColorHaki, function(a0)
  AutoColorHaki = a0
end)
  spawn(function()
  while r0 do
    if AutoColorHaki then
    end
  end
  pcall(function()
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "ColorsDealer", "2")
end)
end)
  tab_3.CraftPage(tab_3, "Other", 2).Toggle(tab_3.CraftPage(tab_3, "Other", 2), "Auto Musketer", AutoMusketeer, function(a0)
  AutoMusketeer = a0
  CancelTween(AutoMusketeer)
end)
  spawn(function()
  while r0 do
    pcall(function()
  if AutoMusketeer and service_1.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
    while service_1.LocalPlayer.PlayerGui.Main.Quest.Visible do
      local l_0 = l_20()
      local new = Vector3.new(-12444.78515625, 332.40396118164, -7673.1806640625)
      if (l_0.Position - new).Magnitude <= 10 then
        task.wait(0.5)
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "CitizenQuestProgress", "Citizen")
        task.wait(1)
        service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "StartQuest", "CitizenQuest", 1)
      else
        Tween()
        task.wait(2)
        if (not AutoMusketeer or (l_20().Position - Vector3.new(-12444.78515625, 332.40396118164, -7673.1806640625)).Magnitude <= 10) and (string.find(service_1.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Defeat 50 Forest Pirates") and game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Forest Pirate")) then
          local l_0, children, l_2 = pairs()
          for l_3, l_4 in l_0 do
            for l_3, l_4 in l_0 do
              task.wait()
              EquipTool(SelectWeaponFarm)
              Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
              l_4.HumanoidRootPart.CanCollide = false
              local new = Vector3.new(60, 60, 60)
              l_4.HumanoidRootPart.Size = new
              l_4.HumanoidRootPart.Transparency = 1
              l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
              l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
              Musketere_Farm_Name = l_4.Name
              Musketere_Farm_CFrame = l_4.HumanoidRootPart.CFrame
              AutoClick()
              if not (l_4.Name ~= "Forest Pirate" or not AutoMusketeer or l_4.Humanoid.Health <= 0 or not l_4.Parent) then
                Tween(service_9.FindFirstChild(service_9, "Forest Pirate").HumanoidRootPart.CFram)
              end
            end
          end
        end
      end
    end
  end
end)
  end
end)
  tab_3.CraftPage(tab_3, "Other", 2).Toggle(tab_3.CraftPage(tab_3, "Other", 2), "Auto Serpent Bow", Auto_Serpent_Bow, function(a0)
  Auto_Serpent_Bow = a0
  CancelTween(Auto_Serpent_Bow)
end)
  spawn(function()
  while r0 do
    pcall(function()
  if Auto_Serpent_Bow then
    local find_first_child = game.Workspace.Enemies.FindFirstChild(game.Workspace.Enemies, "Island Empress")
    if find_first_child then
      local l_0, children, l_2 = pairs()
      for l_3, l_4 in l_0 do
        for l_3, l_4 in l_0 do
          local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
          task.wait()
          EquipTool(SelectWeaponFarm)
          Tween(l_4.HumanoidRootPart.CFrame * Farm_Mode)
          l_4.HumanoidRootPart.CanCollide = false
          local new = Vector3.new(60, 60, 60)
          l_4.HumanoidRootPart.Size = new
          l_4.HumanoidRootPart.Transparency = 1
          l_4.Humanoid.ChangeState(l_4.Humanoid, 11)
          l_4.Humanoid.ChangeState(l_4.Humanoid, 14)
          AutoClick()
          if not (not find_first_child or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or l_4.Name ~= "Island Empress" or l_4.Humanoid.Health <= 0 or not l_4.Parent or not Auto_Serpent_Bow) then
            Tween(service_9.FindFirstChild(service_9, "Island Empress").HumanoidRootPart.CFrame)
          end
        end
      end
    end
  end
end)
  end
end)
  local craft_page_16 = tab_7.CraftPage(tab_7, "Raids", 1)
  craft_page_16.Dropdown(craft_page_16, "Select Chips", {
    "Flame",
    "Ice",
    "Quake",
    "Light",
    "Dark",
    "Spider",
    "Rumble",
    "Magma",
    "Buddha",
    "Sand",
    "Phoenix",
    "Dough"
  }, "", function(a0)
  SelectChip = a0
end)
  craft_page_16.Toggle(craft_page_16, "Auto Buy Microchips", AutoBuySpecialChip, function(a0)
  AutoBuySpecialChip = a0
end)
  spawn(function()
  while r0 do
    if AutoBuySpecialChip then
      local l_0 = l_18()
      if not l_0.FindFirstChild(l_0, "Microchip") or not service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Microchip") or not l_18().FindFirstChild(l_18(), "Special Microchip") or not service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Special Microchip") then
      end
    elseif not task.wait() then
    end
  end
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "RaidsNpc", "Select", SelectChip)
end)
  craft_page_16.Toggle(craft_page_16, "Auto Start Raids", AutoSTartRaids, function(a0)
  AutoSTartRaids = a0
end)
  spawn(function()
  while r0 do
    if AutoSTartRaids then
      local l_0 = l_18()
      if l_0.FindFirstChild(l_0, "Microchip") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Microchip") or l_18().FindFirstChild(l_18(), "Special Microchip") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Special Microchip") then
        if Second_Sea then
          fireclickdetector(Workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
        end
        if Third_Sea then
        end
      elseif not task.wait() then
      end
    end
  end
  fireclickdetector(Workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
end)
  craft_page_16.Toggle(craft_page_16, "Kill Raid Aura", RaidAura, function(a0)
  RaidAura = a0
end)
  spawn(function()
  service_4.Heartbeat.Connect(service_4.Heartbeat, function()
  if RaidAura then
    pcall(function()
  local l_0, descendants, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      local find_first_child = l_4.FindFirstChild(l_4, "Humanoid")
      task.wait()
      l_4.Humanoid.Health = 0
      l_4.HumanoidRootPart.CanCollide = false
      sethiddenproperty(service_1.LocalPlayer, "SimulationRadius", math.huge)
      if not find_first_child or not l_4.FindFirstChild(l_4, "HumanoidRootPart") or 0 >= l_4.Humanoid.Health or not l_4.Name or not RaidAura or not l_4.Parent or not game.Workspace.Enemies.FindFirstChild(game.Workspace.Enemies, l_4.Name) then
      end
    end
  end
end)
  end
end)
end)
  craft_page_16.Toggle(craft_page_16, "Auto Next Island", AutoNextIsland, function(a0)
  AutoNextIsland = a0
  CancelTween(AutoNextIsland)
end)
  spawn(function()
  while r0 do
    if AutoNextIsland then
      if service_1.LocalPlayer.PlayerGui.Main.Timer.Visible == true then
        local service = game.GetService(game, "Workspace")
        if service._WorldOrigin.Locations.FindFirstChild(service._WorldOrigin.Locations, "Island 5") then
          local service = game.GetService(game, "Workspace")
          local new = CFrame.new(0, 70, 100)
          Tween(service._WorldOrigin.Locations.FindFirstChild(service._WorldOrigin.Locations, "Island 5").CFrame * new)
          if game.GetService(game, "Workspace")._WorldOrigin.Locations.FindFirstChild(game.GetService(game, "Workspace")._WorldOrigin.Locations, "Island 4") then
            Tween(game.GetService(game, "Workspace")._WorldOrigin.Locations.FindFirstChild(game.GetService(game, "Workspace")._WorldOrigin.Locations, "Island 4").CFrame * CFrame.new(0, 70, 100))
            if game.GetService(game, "Workspace")._WorldOrigin.Locations.FindFirstChild(game.GetService(game, "Workspace")._WorldOrigin.Locations, "Island 3") then
              Tween(game.GetService(game, "Workspace")._WorldOrigin.Locations.FindFirstChild(game.GetService(game, "Workspace")._WorldOrigin.Locations, "Island 3").CFrame * CFrame.new(0, 70, 100))
              if game.GetService(game, "Workspace")._WorldOrigin.Locations.FindFirstChild(game.GetService(game, "Workspace")._WorldOrigin.Locations, "Island 2") then
                Tween(game.GetService(game, "Workspace")._WorldOrigin.Locations.FindFirstChild(game.GetService(game, "Workspace")._WorldOrigin.Locations, "Island 2").CFrame * CFrame.new(0, 70, 100))
              end
              if game.GetService(game, "Workspace")._WorldOrigin.Locations.FindFirstChild(game.GetService(game, "Workspace")._WorldOrigin.Locations, "Island 1") then
              end
            end
          end
        end
      elseif not task.wait() then
      end
    end
  end
  Tween(game.GetService(game, "Workspace")._WorldOrigin.Locations.FindFirstChild(game.GetService(game, "Workspace")._WorldOrigin.Locations, "Island 1").CFrame * CFrame.new(0, 70, 100))
end)
  craft_page_16.Toggle(craft_page_16, "Auto Awaken", AutoAwakenAbilities, function(a0)
  AutoAwakenAbilities = a0
end)
  spawn(function()
  while r0 do
    if AutoAwakenAbilities then
    end
  end
  service_9.Remotes.CommF_.InvokeServer()
  service_9.Remotes.CommF_.InvokeServer()
end)
  craft_page_16.Button(craft_page_16, "Fruit Inventory", function()
  service_1.LocalPlayer.PlayerGui.Main.FruitInventory.Visible = not service_1.LocalPlayer.PlayerGui.Main.FruitInventory.Visible
end)
  local craft_page_17 = tab_7.CraftPage(tab_7, "Law Raids", 2)
  local l_116, children, l_118 = pairs()
end
for l_119, l_120 in l_116 do
  while l_0 do
  end
  for l_28, l_29 in l_25 do
  end
  for l_71, l_72 in l_68 do
  end
  local a = l_120.IsA(l_120, "Tool")
  if a then
    table.insert({}, l_120.Name)
  end
  for l_119, l_120 in l_116 do
  end
end
local dropdown_2 = craft_page_17.Dropdown(craft_page_17, "Select Weapon Law", {}, "", function(a0)
  Select_Weapon_Law_Raid = a0
end)
local l_115 = {}
craft_page_17.Button(craft_page_17, "Refresh Weapon Law", function()
  dropdown_2.Add(dropdown_2, l_115)
end)
craft_page_17.Toggle(craft_page_17, "Buy Law Chips", Auto_Buy_Law_Chip, function(a0)
  Auto_Buy_Law_Chip = a0
end)
spawn(function()
  while r0 do
    local find_first_child = service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Microchip")
    if Auto_Buy_Law_Chip and not find_first_child and not l_18().FindFirstChild(l_18(), "Microchip") and not game.GetService(game, "Workspace").Enemies.FindFirstChild(game.GetService(game, "Workspace").Enemies, "Order") and not service_9.FindFirstChild(service_9, "Order") then
    end
  end
  service_9.Remotes.CommF_.InvokeServer()
end)
craft_page_17.Toggle(craft_page_17, "Start Law Raid", Auto_Start_Law_Dungeon, function(a0)
  Auto_Start_Law_Dungeon = a0
end)
spawn(function()
  while r0 do
    if Auto_Start_Law_Dungeon then
    end
  end
  pcall(function()
  local l_0 = l_18()
  if l_0.FindFirstChild(l_0, "Microchip") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Microchip") then
    local service = game.GetService(game, "Workspace")
    fireclickdetector(service.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
  end
end)
end)
craft_page_17.Toggle(craft_page_17, "Auto Kill Law Raid", BossRaid, function(a0)
  BossRaid = a0
  CancelTween(BossRaid)
end)
spawn(function()
  while r0 do
    if BossRaid then
    end
  end
  pcall(function()
  local l_0, children, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      local find_first_child = l_4.FindFirstChild(l_4, "HumanoidRootPart")
      task.wait()
      EquipTool(Select_Weapon_Law_Raid)
      l_4.HumanoidRootPart.CanCollide = false
      local new = Vector3.new(50, 50, 50)
      l_4.HumanoidRootPart.Size = new
      local new = CFrame.new(0, 30, 0)
      Tween(l_4.HumanoidRootPart.CFrame * new)
      service_6.CaptureController(service_6)
      service_6.Button1Down()
      if l_4.Name ~= "Order" or not find_first_child or not l_4.FindFirstChild(l_4, "Humanoid") or 0 >= l_4.Humanoid.Health or not BossRaid or l_4.Humanoid.Health <= 0 or not l_4.Parent then
        local l_0, children, l_2 = pairs()
      end
    end
  end
  for l_3, l_4 in l_0 do
    if l_4.Name == "Order" then
      Tween(l_4.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
    end
    for l_3, l_4 in l_0 do
    end
  end
end)
end)
tab_8.CraftPage(tab_8, "World Teleport", 1).Button(tab_8.CraftPage(tab_8, "World Teleport", 1), "Travel to First Sea", function()
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "TravelMain")
end)
tab_8.CraftPage(tab_8, "World Teleport", 1).Button(tab_8.CraftPage(tab_8, "World Teleport", 1), "Travel to Second Sea", function()
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "TravelDressrosa")
end)
tab_8.CraftPage(tab_8, "World Teleport", 1).Button(tab_8.CraftPage(tab_8, "World Teleport", 1), "Travel to Third Sea", function()
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "TravelZou")
end)
if First_Sea then
  IslandCheck = {
    "Start Island",
    "Marine Start",
    "Middle Town",
    "Jungle",
    "Pirate Village",
    "Desert",
    "Frozen Village",
    "Marine Ford",
    "Colosseum 1",
    "Sky island 1",
    "Sky island 2",
    "Sky island 3",
    "Sky island 4",
    "Prison",
    "Magma Village",
    "UndeyWater City",
    "Fountain City",
    "House Cyborgs",
    "Shanks Room",
    "Mob Island",
    "Sea Beast"
  }
elseif Second_Sea then
  IslandCheck = {
    "Dock",
    "Kingdom of Rose",
    "Mansion 1",
    "Flamingo Room",
    "Green Zone",
    "Cafe",
    "Factory",
    "Colosseum 2",
    "Grave Island",
    "Snow Mountain",
    "Cold Island",
    "Hot Island",
    "Cursed Ship",
    "Ice Castle",
    "Forgotten Island",
    "Usoapp Island",
    "Minisky Island",
    "Sea Beast"
  }
elseif Third_Sea then
  IslandCheck = {
    "Port Town",
    "Hydra Island",
    "Great Tree",
    "Castle on the Sea",
    "Floating Turtle",
    "Mansion 2",
    "Secret Temple",
    "Friendly Arena",
    "Beautiful Pirate Domain",
    "Teler Park",
    "Peanut Island",
    "Chocolate Island",
    "Ice Cream Island",
    "Haunted Castle",
    "Cake Loaf",
    "Candy Cane",
    "Tiki Outpost",
    "Raid Lab",
    "Mini Sky",
    "Sea Beast"
  }
end
tab_8.CraftPage(tab_8, "World Teleport", 1).Dropdown(tab_8.CraftPage(tab_8, "World Teleport", 1), "Select Island", IslandCheck, "", function(a0)
  SelectedIsland = a0
end)
tab_8.CraftPage(tab_8, "World Teleport", 1).Button(tab_8.CraftPage(tab_8, "World Teleport", 1), "Teleport to Island", function()
  if SelectedIsland == "Start Island" then
    if BypassTeleport then
      BTP()
    else
      Tween()
    end
    if BypassTeleport then
      BTP()
    else
      Tween()
    end
  elseif SelectedIsland == "Marine Start" then
    if SelectedIsland == "Middle Town" then
      if BypassTeleport then
        BTP()
      else
        Tween()
      end
      if BypassTeleport then
        BTP()
      else
        Tween()
      end
    elseif SelectedIsland == "Jungle" then
      if SelectedIsland == "Pirate Village" then
        if BypassTeleport then
          BTP()
        else
          Tween()
        end
        if BypassTeleport then
          BTP()
        else
          Tween()
        end
      elseif SelectedIsland == "Desert" then
        if SelectedIsland == "Frozen Village" then
          if BypassTeleport then
            BTP()
          else
            Tween()
          end
          if BypassTeleport then
            BTP()
          else
            Tween()
          end
        elseif SelectedIsland == "Marine Ford" then
          if SelectedIsland == "Colosseum 1" then
            if BypassTeleport then
              BTP()
            else
              Tween()
            end
            if BypassTeleport then
              BTP()
            else
              Tween()
            end
          elseif SelectedIsland == "Sky island 1" then
            if SelectedIsland == "Sky island 2" then
              if BypassTeleport then
                BTP()
              else
                Tween()
              end
              if BypassTeleport then
                BTP()
              else
                Tween()
              end
            elseif SelectedIsland == "Sky island 3" then
              if SelectedIsland == "Sky island 4" then
                if BypassTeleport then
                  BTP()
                else
                  Tween()
                end
                if BypassTeleport then
                  BTP()
                else
                  Tween()
                end
              elseif SelectedIsland == "Prison" then
                if SelectedIsland == "Magma Village" then
                  if BypassTeleport then
                    BTP()
                  else
                    Tween()
                  end
                  if BypassTeleport then
                    BTP()
                  else
                    Tween()
                  end
                elseif SelectedIsland == "UndeyWater City" then
                  if SelectedIsland == "Fountain City" then
                    if BypassTeleport then
                      TP2()
                    else
                      Tween()
                    end
                    if BypassTeleport then
                      BTP()
                    else
                      Tween()
                    end
                  elseif SelectedIsland == "House Cyborgs" then
                    if SelectedIsland == "Shanks Room" then
                      if BypassTeleport then
                        BTP()
                      else
                        Tween()
                      end
                      if BypassTeleport then
                        BTP()
                      else
                        Tween()
                      end
                    elseif SelectedIsland == "Mob Island" then
                      if SelectedIsland == "Dock" then
                        if BypassTeleport then
                          BTP()
                        else
                          Tween()
                        end
                        if BypassTeleport then
                          BTP()
                        else
                          Tween()
                        end
                      elseif SelectedIsland == "Kingdom of Rose" then
                        if SelectedIsland == "Mansion 1" then
                          if BypassTeleport then
                            BTP()
                          else
                            Tween()
                          end
                          if BypassTeleport then
                            BTP()
                          else
                            Tween()
                          end
                        elseif SelectedIsland == "Flamingo Room" then
                          if SelectedIsland == "Green Zone" then
                            if BypassTeleport then
                              BTP()
                            else
                              Tween()
                            end
                            if BypassTeleport then
                              BTP()
                            else
                              Tween()
                            end
                          elseif SelectedIsland == "Cafe" then
                            if SelectedIsland == "Factory" then
                              if BypassTeleport then
                                BTP()
                              else
                                Tween()
                              end
                              if BypassTeleport then
                                BTP()
                              else
                                Tween()
                              end
                            elseif SelectedIsland == "Colosseum 2" then
                              if SelectedIsland == "Grave Island" then
                                if BypassTeleport then
                                  BTP()
                                else
                                  Tween()
                                end
                                if BypassTeleport then
                                  BTP()
                                else
                                  Tween()
                                end
                              elseif SelectedIsland == "Snow Mountain" then
                                if SelectedIsland == "Cold Island" then
                                  if BypassTeleport then
                                    BTP()
                                  else
                                    Tween()
                                  end
                                  if BypassTeleport then
                                    BTP()
                                  else
                                    Tween()
                                  end
                                elseif SelectedIsland == "Hot Island" then
                                  if SelectedIsland == "Cursed Ship" then
                                    if BypassTeleport then
                                      BTP()
                                    else
                                      Tween()
                                    end
                                    if BypassTeleport then
                                      BTP()
                                    else
                                      Tween()
                                    end
                                  elseif SelectedIsland == "Ice Castle" then
                                    if SelectedIsland == "Forgotten Island" then
                                      if BypassTeleport then
                                        BTP()
                                      else
                                        Tween()
                                      end
                                      if BypassTeleport then
                                        BTP()
                                      else
                                        Tween()
                                      end
                                    elseif SelectedIsland == "Usoapp Island" then
                                      if SelectedIsland == "Minisky Island" then
                                        if BypassTeleport then
                                          BTP()
                                        else
                                          Tween()
                                        end
                                        if BypassTeleport then
                                          BTP()
                                        else
                                          Tween()
                                        end
                                      elseif SelectedIsland == "Port Town" then
                                        if SelectedIsland == "Hydra Island" then
                                          if BypassTeleport then
                                            BTP()
                                          else
                                            Tween()
                                          end
                                          if BypassTeleport then
                                            BTP()
                                          else
                                            Tween()
                                          end
                                        elseif SelectedIsland == "Great Tree" then
                                          if SelectedIsland == "Castle on the Sea" then
                                            if BypassTeleport then
                                              BTP()
                                            else
                                              Tween()
                                            end
                                            if BypassTeleport then
                                              BTP()
                                            else
                                              Tween()
                                            end
                                          elseif SelectedIsland == "Floating Turtle" then
                                            if SelectedIsland == "Mansion 2" then
                                              if BypassTeleport then
                                                BTP()
                                              else
                                                Tween()
                                              end
                                              if BypassTeleport then
                                                BTP()
                                              else
                                                Tween()
                                              end
                                            elseif SelectedIsland == "Secret Temple" then
                                              if SelectedIsland == "Friendly Arena" then
                                                if BypassTeleport then
                                                  BTP()
                                                else
                                                  Tween()
                                                end
                                                if BypassTeleport then
                                                  BTP()
                                                else
                                                  Tween()
                                                end
                                              elseif SelectedIsland == "Beautiful Pirate Domain" then
                                                if SelectedIsland == "Teler Park" then
                                                  if BypassTeleport then
                                                    BTP()
                                                  else
                                                    Tween()
                                                  end
                                                  if BypassTeleport then
                                                    BTP()
                                                  else
                                                    Tween()
                                                  end
                                                elseif SelectedIsland == "Peanut Island" then
                                                  if SelectedIsland == "Chocolate Island" then
                                                    if BypassTeleport then
                                                      BTP()
                                                    else
                                                      Tween()
                                                    end
                                                    if BypassTeleport then
                                                      BTP()
                                                    else
                                                      Tween()
                                                    end
                                                  elseif SelectedIsland == "Ice Cream Island" then
                                                    if SelectedIsland == "Haunted Castle" then
                                                      if BypassTeleport then
                                                        BTP()
                                                      else
                                                        Tween()
                                                      end
                                                      if BypassTeleport then
                                                        BTP()
                                                      else
                                                        Tween()
                                                      end
                                                    elseif SelectedIsland == "Cake Loaf" then
                                                      if SelectedIsland == "Candy Cane" then
                                                        if BypassTeleport then
                                                          BTP()
                                                        else
                                                          Tween()
                                                        end
                                                        if BypassTeleport then
                                                          BTP()
                                                        else
                                                          Tween()
                                                        end
                                                      elseif SelectedIsland == "Tiki Outpost" then
                                                        if SelectedIsland == "Raid Lab" then
                                                          if BypassTeleport then
                                                            BTP()
                                                          else
                                                            Tween()
                                                          end
                                                          if BypassTeleport then
                                                            BTP()
                                                          else
                                                            Tween()
                                                          end
                                                        elseif SelectedIsland == "Mini Sky" and SelectedIsland == "Sea Beast" then
                                                          local service = game.GetService(game, "Workspace")
                                                          Tween(service._WorldOrigin.Locations["Sea of Treats"].CFrame)
                                                        end
                                                      end
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end)
tab_8.CraftPage(tab_8, "World Teleport", 1).Toggle(tab_8.CraftPage(tab_8, "World Teleport", 1), "Bypass Teleport", BypassTeleport, function(a0)
  BypassTeleport = a0
end)
if First_Sea then
  tab_8.CraftPage(tab_8, "Npc Teleport", 2).Dropdown(tab_8.CraftPage(tab_8, "Npc Teleport", 2), "Select NPC", {
    "Random Devil Fruit",
    "Blox Fruits Dealer",
    "Remove Devil Fruit",
    "Ability Teacher",
    "Dark Step",
    "Electro",
    "Fishman Karate"
  }, "", function(a0)
  _G.SelectNPC = a0
end)
  if Second_Sea then
    tab_8.CraftPage(tab_8, "Npc Teleport", 2).Dropdown(tab_8.CraftPage(tab_8, "Npc Teleport", 2), "Select NPC", {
      "Dargon Berath",
      "Mtsterious Man",
      "Mysterious Scientist",
      "Awakening Expert",
      "Nerd",
      "Bar Manager",
      "Blox Fruits Dealer",
      "Trevor",
      "Enhancement Editor",
      "Pirate Recruiter",
      "Marines Recruiter",
      "Chemist",
      "Cyborg",
      "Ghoul Mark",
      "Guashiem",
      "El Admin",
      "El Rodolfo",
      "Arowe"
    }, "", function(a0)
  _G.SelectNPC = a0
end)
    if Third_Sea then
      tab_8.CraftPage(tab_8, "Npc Teleport", 2).Dropdown(tab_8.CraftPage(tab_8, "Npc Teleport", 2), "Select NPC", {
        "Blox Fruits Dealer",
        "Remove Devil Fruit",
        "Horned Man",
        "Hungey Man",
        "Previous Hero",
        "Butler",
        "Lunoven",
        "Trevor",
        "Elite Hunter",
        "Player Hunter",
        "Uzoth"
      }, "", function(a0)
  _G.SelectNPC = a0
end)
      tab_8.CraftPage(tab_8, "Npc Teleport", 2).Toggle(tab_8.CraftPage(tab_8, "Npc Teleport", 2), "Teleport", _G.TeleportNPC, "Teleport to npc selected", function(a0)
  _G.TeleportNPC = a0
  if _G.TeleportNPC == true then
    while _G.TeleportNPC == "Dargon Berath" do
      Tween()
      if not _G.TeleportNPC then
      end
    end
  end
end)
      spawn(function()
  pcall(function()
  while r0 do
    local find_first_child = game.Workspace._WorldOrigin.Locations.FindFirstChild(game.Workspace._WorldOrigin.Locations, "Mirage Island")
    if find_first_child then
      Mirragecheck.Set(Mirragecheck, "�����️: Mystic Island Spawning")
    end
  end
  Mirragecheck.Set(Mirragecheck, "��: Mystic Island Not Found ")
end)
end)
      Mirragecheck = tab_8.CraftPage(tab_8, "Mirage Island", 2).Label(tab_8.CraftPage(tab_8, "Mirage Island", 2), "")
      tab_8.CraftPage(tab_8, "Mirage Island", 2).Toggle(tab_8.CraftPage(tab_8, "Mirage Island", 2), "Tween Mystic Island", _G.AutoMysticIsland, function(a0)
  _G.AutoMysticIsland = a0
  StopTween(_G.AutoMysticIsland)
end)
      spawn(function()
  pcall(function()
  while r0 do
    if _G.AutoMysticIsland then
      local l_0, children, l_2 = pairs()
    elseif not task.wait() then
    end
  end
  for l_3, l_4 in task.wait() do
    local service = game.GetService(game, "Workspace")
    if service.Map.FindFirstChild(service.Map, "MysticIsland") then
      HyperCahaya()
    end
    for l_3, l_4 in task.wait() do
    end
  end
end)
end)
      tab_8.CraftPage(tab_8, "Mirage Island", 2).Button(tab_8.CraftPage(tab_8, "Mirage Island", 2), "Teleport Advanced Fruit Dealer", function()
  TweenNpc()
end)
      function TweenNpc()
        while r0 do
        end
        local service = game.GetService(game, "Workspace")
        if service.Map.FindFirstChild(service.Map, "MysticIsland") then
          AllNPCS = getnilinstances()
          local service = game.GetService(game, "Workspace")
          local l_0, children, l_2 = pairs()
          for l_3, l_4 in l_0 do
            for l_3, l_4 in l_0 do
              while l_0 do
              end
              table.insert(AllNPCS, l_4)
            end
          end
          local l_0, l_1, l_2 = pairs(AllNPCS)
          for l_3, l_4 in l_0 do
            for l_3, l_4 in l_0 do
              while l_0 do
              end
              if l_4.Name == "Advanced Fruit Dealer" then
                HyperCahaya(l_4.HumanoidRootPart.CFrame)
              end
            end
          end
        end
      end
      tab_8.CraftPage(tab_8, "Mirage Island", 2).Toggle(tab_8.CraftPage(tab_8, "Mirage Island", 2), "Summon Mystic Island", _G.dao, function(a0)
  if a0 then
    _G.dao = true
  else
    _G.dao = false
  end
  if _G.dao then
    local new = Vector3.new(-12463.6025390625, 378.3270568847656, -7566.0830078125)
    service_9.Remotes.CommF_.InvokeServer()
    task.wait(1)
    local new = CFrame.new(-5411.22021, 778.609863, -2682.27759, 0.927179396, 0, 0.374617696, 0, 1, 0, -0.374617696, 0, 0.927179396)
    l_20().CFrame = new
    task.wait(2)
    l_20().CFrame = CFrame.new(-4526.32177734375, 16.446531295776367, -2648.96484375)
    task.wait(2)
    service_9.Remotes.CommF_.InvokeServer()
    function two(a0)
      pcall(function()
  local l_0 = l_19()
  l_0.Sit = false
  l_20().Anchored = false
end)
      local l_1 = l_20()
      if (l_1.Position - a0.Position).Magnitude <= 200 then
        pcall(function()
  tweenz.Cancel(tweenz)
end)
        l_20().CFrame = a0
      else
        local l_3 = l_20()
        local new = TweenInfo.new((l_3.Position - a0.Position).Magnitude / 325, Enum.EasingStyle.Linear)
        local service = game.service(game, "TWS")
        local l_3, l_4 = pcall(function()
  local l_2 = l_18()
  local create = service.Create(service, l_2.HumanoidRootPart, new, {CFrame = a0})
  tweenz = create
  tweenz.Play(tweenz)
end)
        err = l_4
        tween = l_3
        if not tween then
          return err
        end
      end
      function _TweenCanCle()
        tweenz.Cancel(tweenz)
      end
    end
    two()
    task.wait(13)
    local l_4, l_5 = workspace.Boats.PirateBrigade.GetDescendants(workspace.Boats.PirateBrigade)
    for l_6, l_7 in next do
      for l_6, l_7 in next do
        local find = l_7.Name.find(l_7.Name, "VehicleSeat")
        l_20().CFrame = l_7.CFrame
        if find and game.GetService(game, "Workspace").Map.FindFirstChild(game.GetService(game, "Workspace").Map, "MysticIsland") then
          local service = game.GetService(game, "Workspace")
          local new = CFrame.new(0, 500, -100)
          HyperCahaya(service.Map.FindFirstChild(service.Map, "MysticIsland").HumanoidRootPart.CFrame * new)
        end
      end
    end
  end
end)
      spawn(function()
  while r0 do
    pcall(function()
  if _G.dao then
    local l_1, children, l_3 = pairs()
    for l_4, l_5 in l_1 do
      for l_4, l_5 in l_1 do
        local find = table.find({
          "SmallGroup",
          "SmallCluster",
          "MediumGroup",
          "MediumFlat",
          "Large",
          "Largest"
        }, l_5.Name)
        if find and l_5.IsA(l_5, "Model") then
          local l_6, descendants, l_8 = pairs()
          for l_9, l_10 in l_6 do
            for l_9, l_10 in l_6 do
              local a = l_10.IsA(l_10, "BasePart")
              if a then
                l_10.CanCollide = false
              end
            end
          end
        end
      end
    end
  end
end)
  end
end)
      spawn(function()
  while r0 do
    pcall(function()
  task.wait(0.5)
  if _G.dao and workspace.Boats.PirateBrigade then
    local l_3 = workspace.Boats.PirateBrigade.PrimaryPart
    l_3 = l_3.Position
    l_3 = l_3 + workspace.Boats.PirateBrigade.PrimaryPart.CFrame.lookVector * 10
    while 0.1 < workspace.Boats.PirateBrigade.PrimaryPart.CFrame.lookVector * 10 do
      workspace.Boats.PirateBrigade.SetPrimaryPartCFrame(workspace.Boats.PirateBrigade, workspace.Boats.PirateBrigade.PrimaryPart.CFrame + workspace.Boats.PirateBrigade.PrimaryPart.CFrame.lookVector * 11)
      task.wait()
      if _G.BiirTrax then
      end
    end
  end
end)
  end
end)
      spawn(function()
  while r0 do
    pcall(function()
  local service = game.GetService(game, "Workspace")
  if _G.dao and service.Map.FindFirstChild(service.Map, "MysticIsland") then
    HyperCahaya()
    while HyperCahaya < 5 do
    end
    _G.LockCamToMoon = true
    task.wait(5)
    local service = game.GetService(game, "Workspace")
    if service.Map.FindFirstChild(service.Map, "MysticIsland") then
      local service = game.GetService(game, "Workspace")
      local l_1, children, l_3 = pairs()
      for l_4, l_5 in l_1 do
        for l_4, l_5 in l_1 do
          while l_1 < 5 do
          end
          local a = l_5.IsA(l_5, "MeshPart")
          if a and l_5.Material == Enum.Material.Neon then
            HyperCahaya(l_5.CFrame)
          end
        end
      end
    end
  end
end)
  end
end)
      tab_8.CraftPage(tab_8, "Mirage Island", 2).Toggle(tab_8.CraftPage(tab_8, "Mirage Island", 2), "Tween Gear", _G.TweenMGear, function(a0)
  _G.TweenMGear = a0
  StopTween(_G.TweenMGear)
end)
      spawn(function()
  pcall(function()
  while r0 do
    local service = game.GetService(game, "Workspace")
    if _G.TweenMGear and service.Map.FindFirstChild(service.Map, "MysticIsland") then
      local service = game.GetService(game, "Workspace")
      local l_0, children, l_2 = pairs()
    elseif not task.wait() then
    end
  end
  for l_3, l_4 in task.wait() do
    local a = l_4.IsA(l_4, "MeshPart")
    if a and l_4.Material == Enum.Material.Neon then
      HyperCahaya(l_4.CFrame)
    end
    for l_3, l_4 in task.wait() do
    end
  end
end)
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Race Ghoul", function()
  service_9.Remotes.CommF_.InvokeServer()
  service_9.Remotes.CommF_.InvokeServer()
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Cyborg", function()
  service_9.Remotes.CommF_.InvokeServer()
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Random Race [ f3000 Fragments ]", function()
  service_9.Remotes.CommF_.InvokeServer()
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Reset Stats [ f2500 Fragments ]", function()
  service_9.Remotes.CommF_.InvokeServer()
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).changelog(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Abilities")
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Skyjump [ $10,000 Beli ]", function()
  service_9.Remotes.CommF_.InvokeServer()
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Buso Haki [ $25,000 Beli ]", function()
  service_9.Remotes.CommF_.InvokeServer()
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Observation haki [ $750,000 Beli ]", function()
  service_9.Remotes.CommF_.InvokeServer()
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Soru [ $100,000 Beli ]", function()
  service_9.Remotes.CommF_.InvokeServer()
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).changelog(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Fighting")
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Black Leg", function()
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyBlackLeg")
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Electro", function()
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyElectro")
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Fishman Karate", function()
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyFishmanKarate")
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Dragon Claw", function()
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BlackbeardReward", "DragonClaw", "1")
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BlackbeardReward", "DragonClaw", "2")
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Superhuman", function()
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuySuperhuman")
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Death Step", function()
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyDeathStep")
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Sharkman Karate", function()
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuySharkmanKarate", true)
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuySharkmanKarate")
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Electric Claw", function()
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyElectricClaw")
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Dragon Talon", function()
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyDragonTalon")
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "God Human", function()
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BuyGodhuman")
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).changelog(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Sword")
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Katana [ $1,000 Beli ]", function()
  service_9.Remotes.CommF_.InvokeServer()
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Cutlass [ $1,000 Beli ]", function()
  service_9.Remotes.CommF_.InvokeServer()
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Dual Katana [ $12,000 Beli ]", function()
  service_9.Remotes.CommF_.InvokeServer()
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Iron Mace [ $25,000 Beli ]", function()
  service_9.Remotes.CommF_.InvokeServer()
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Triple Katana [ $60,000 Beli ]", function()
  service_9.Remotes.CommF_.InvokeServer()
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Pipe [ $100,000 Beli ]", function()
  service_9.Remotes.CommF_.InvokeServer()
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Soul Cane [ $750,000 Beli ]", function()
  service_9.Remotes.CommF_.InvokeServer()
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Dual-Headed Blade [ $400,000 Beli ]", function()
  service_9.Remotes.CommF_.InvokeServer()
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Bisento [ $1,200,000 Beli ]", function()
  service_9.Remotes.CommF_.InvokeServer()
end)
      tab_9.CraftPage(tab_9, "Race & Fragment", 1).Button(tab_9.CraftPage(tab_9, "Race & Fragment", 1), "Pole v2 [ f5,000 Fragments ]", function()
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "ThunderGodTalk")
end)
      local find_first_child = service_9.FindFirstChild(service_9, "Remotes")
    end
  end
end
for l_127, l_128 in next do
  while l_0 do
  end
  for l_28, l_29 in l_25 do
  end
  for l_71, l_72 in l_68 do
  end
  for craft_page_18, craft_page_18 in dropdown_2 do
  end
  if l_128.OnSale then
    table.insert({}, l_128.Name .. " [ " .. l_128.Price .. " Beli ]")
  end
  for l_127, l_128 in next do
  end
end
local dropdown_3 = tab_9.CraftPage(tab_9, "Devil Fruits", 2).Dropdown(tab_9.CraftPage(tab_9, "Devil Fruits", 2), "Devil Fruit on Sale", {}, "", function(a0)
  Select_Devil_Fruit = a0
end)
local l_123 = {}
tab_9.CraftPage(tab_9, "Devil Fruits", 2).Button(tab_9.CraftPage(tab_9, "Devil Fruits", 2), "Refresh Fruit on Sale", function()
  dropdown_3.Add(dropdown_3, l_123)
end)
tab_9.CraftPage(tab_9, "Devil Fruits", 2).Button(tab_9.CraftPage(tab_9, "Devil Fruits", 2), "Buy Devil Fruit on Sale", function()
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "GetFruits")
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "PurchaseRawFruit", Select_Devil_Fruit)
end)
tab_9.CraftPage(tab_9, "Devil Fruits", 2).Toggle(tab_9.CraftPage(tab_9, "Devil Fruits", 2), "Buy Random Fruit", AutoBuyFruitZioles, function(a0)
  AutoBuyFruitZioles = a0
end)
spawn(function()
  while r0 do
    if AutoBuyFruitZioles then
    end
  end
  pcall(function()
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "Cousin", "Buy")
end)
end)
tab_9.CraftPage(tab_9, "Devil Fruits", 2).Toggle(tab_9.CraftPage(tab_9, "Devil Fruits", 2), "Auto Bring Fruit", AutoBringFruit, function(a0)
  AutoBringFruit = a0
end)
spawn(function()
  while r0 do
    if AutoBringFruit then
    end
  end
  pcall(function()
  local service = game.GetService(game, "Workspace")
  local l_0, children, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      local a = l_4.IsA(l_4, "Tool")
      if a and string.find(l_4.Name, "Fruit") then
        task.wait(2)
        local l_6 = l_20()
        firetouchinterest(l_6, l_4.Handle, 0)
        task.wait()
        firetouchinterest(l_20(), l_4.Handle, 1)
      end
    end
  end
end)
end)
_G.Sele_Teleport_Fruit = "Tween"
tab_9.CraftPage(tab_9, "Devil Fruits", 2).Toggle(tab_9.CraftPage(tab_9, "Devil Fruits", 2), "Teleport to Fruit", _G.Auto_Teleport_Fruit, function(a0)
  _G.Auto_Teleport_Fruit = a0
  CancelTween(_G.Auto_Teleport_Fruit)
end)
spawn(function()
  while r0 do
    if _G.Auto_Teleport_Fruit then
    end
  end
  pcall(function()
  local l_0, children, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      local a = l_4.IsA(l_4, "Tool")
      if a and l_4.FindFirstChild(l_4, "Handle") then
        if _G.Sele_Teleport_Fruit == "Bring" and _G.Auto_Teleport_Fruit then
          local l_6 = l_20()
          firetouchinterest(l_6, l_4.Handle, 0)
          firetouchinterest(l_20(), l_4.Handle, 1)
        end
        if _G.Sele_Teleport_Fruit == "Tween" and _G.Settings.Devil_Fruit["Bring Fruit"] then
          _G.BringFound = true
          Tween(l_4.Handle.CFrame)
        end
      end
      if l_4.Name == "Fruit " and l_4.FindFirstChild(l_4, "Handle") then
        if _G.Sele_Teleport_Fruit == "Bring" and _G.Auto_Teleport_Fruit then
          firetouchinterest(l_20(), l_4.Handle, 0)
          firetouchinterest(l_20(), l_4.Handle, 1)
          l_20().CFrame = l_4.Handle.CFrame
        end
        if _G.Sele_Teleport_Fruit == "Tween" and _G.Auto_Teleport_Fruit then
          Tween(l_4.Handle.CFrame)
        end
      end
    end
  end
  if _G.BringFound and not game.Workspace.FindFirstChildOfClass(game.Workspace, "Tool") then
    _G.BringFound = false
  end
end)
end)
tab_9.CraftPage(tab_9, "Devil Fruits", 2).Toggle(tab_9.CraftPage(tab_9, "Devil Fruits", 2), "Auto Stored Fruit", AutoStoreFruit, function(a0)
  AutoStoreFruit = a0
end)
spawn(function()
  while r0 do
    if AutoStoreFruit then
    end
  end
  pcall(function()
  local l_0 = l_18()
  if l_0.FindFirstChild(l_0, "Bomb Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Bomb Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Spike Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Spike Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Chop Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Chop Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Spring Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Spring Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Kilo Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Kilo Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Smoke Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Smoke Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Spin Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Spin Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Flame Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Flame Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Bird: Falcon Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Bird: Falcon Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Ice Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Ice Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Sand Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Sand Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Dark Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Dark Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Revive Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Revive Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Revive Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Revive Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Diamond Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Diamond Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Light Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Light Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Love Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Love Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Rubber Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Rubber Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Barrier Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Barrier Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Magma Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Magma Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Quake Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Quake Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Human: Buddha Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Human: Buddha Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "String Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "String Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Bird: Phoenix Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Bird: Phoenix Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Portal Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Portal Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Rumble Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Rumble Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Paw Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Paw Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Blizzard Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Blizzard Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Gravity Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Gravity Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Dough Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Dough Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Shadow Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Shadow Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Venom Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Venom Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Control Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Control Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Spirit Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Spirit Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Dragon Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Dragon Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
  if l_18().FindFirstChild(l_18(), "Leopard Fruit") or service_1.LocalPlayer.Backpack.FindFirstChild(service_1.LocalPlayer.Backpack, "Leopard Fruit") then
    service_9.Remotes.CommF_.InvokeServer()
  end
end)
end)
tab_9.CraftPage(tab_9, "Devil Fruits", 2).changelog(tab_9.CraftPage(tab_9, "Devil Fruits", 2), "Gun")
tab_9.CraftPage(tab_9, "Devil Fruits", 2).Button(tab_9.CraftPage(tab_9, "Devil Fruits", 2), "Slingshot [ $5,000 Beli ]", function()
  service_9.Remotes.CommF_.InvokeServer()
end)
tab_9.CraftPage(tab_9, "Devil Fruits", 2).Button(tab_9.CraftPage(tab_9, "Devil Fruits", 2), "Musket [ $8,000 Beli ]", function()
  service_9.Remotes.CommF_.InvokeServer()
end)
tab_9.CraftPage(tab_9, "Devil Fruits", 2).Button(tab_9.CraftPage(tab_9, "Devil Fruits", 2), "Flintlock [ $10,500 Beli ]", function()
  service_9.Remotes.CommF_.InvokeServer()
end)
tab_9.CraftPage(tab_9, "Devil Fruits", 2).Button(tab_9.CraftPage(tab_9, "Devil Fruits", 2), "Refined Slingshot [ $30,000 Beli ]", function()
  service_9.Remotes.CommF_.InvokeServer()
end)
tab_9.CraftPage(tab_9, "Devil Fruits", 2).Button(tab_9.CraftPage(tab_9, "Devil Fruits", 2), "Refined Flintlock [ $65,000 Beli ]", function()
  service_9.Remotes.CommF_.InvokeServer()
end)
tab_9.CraftPage(tab_9, "Devil Fruits", 2).Button(tab_9.CraftPage(tab_9, "Devil Fruits", 2), "Kabucha [ f1,500 Fragments)", function()
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "BlackbeardReward", "Slingshot", "2")
end)
tab_9.CraftPage(tab_9, "Devil Fruits", 2).changelog(tab_9.CraftPage(tab_9, "Devil Fruits", 2), "Accessories")
tab_9.CraftPage(tab_9, "Devil Fruits", 2).Button(tab_9.CraftPage(tab_9, "Devil Fruits", 2), "Black Cape [ $50,000 Beli ]", function()
  service_9.Remotes.CommF_.InvokeServer()
end)
tab_9.CraftPage(tab_9, "Devil Fruits", 2).Button(tab_9.CraftPage(tab_9, "Devil Fruits", 2), "Swordsman Hat [ 150k Beli ]", function()
  service_9.Remotes.CommF_.InvokeServer()
end)
tab_9.CraftPage(tab_9, "Devil Fruits", 2).Button(tab_9.CraftPage(tab_9, "Devil Fruits", 2), "Tomoe Ring [ $500k Beli ]", function()
  service_9.Remotes.CommF_.InvokeServer()
end)
local craft_page_18 = tab_10.CraftPage(tab_10, "Misc1", 1)
craft_page_18.Toggle(craft_page_18, "Infinite Geppo", InfiniteGeppo, function(a0)
  InfiniteGeppo = a0
end)
spawn(function()
  while r0 do
    if InfiniteGeppo then
    end
  end
  pcall(function()
  local l_1, l_2 = getgc()
  for l_3, l_4 in next do
    for l_3, l_4 in next do
      local getfenv = getfenv(l_4)
      local l_6 = l_18()
      if getfenv.script == l_6.WaitForChild(l_6, "Geppo") then
        local l_6, l_7 = getupvalues(l_4)
        for l_8, l_9 in next do
          for l_8, l_9 in next do
            local tostring = tostring(l_9)
            task.wait(0.1)
            setupvalue(l_4, l_8, 0)
            if tostring ~= "0" or not InfiniteGeppo or l_19().Health <= 0 then
            end
          end
        end
      end
    end
  end
end)
end)
craft_page_18.Toggle(craft_page_18, "Infinite Soru", InfiniteSoru, function(a0)
  InfiniteSoru = a0
end)
spawn(function()
  while r0 do
    local l_0 = l_18()
    if InfiniteSoru and l_0.FindFirstChild(l_0, "HumanoidRootPart") ~= nil then
    end
  end
  pcall(function()
  local l_1, l_2 = getgc()
  for l_3, l_4 in next do
    for l_3, l_4 in next do
      local getfenv = getfenv(l_4)
      local l_6 = l_18()
      if getfenv.script == l_6.WaitForChild(l_6, "Soru") then
        local l_5, getupvalues, l_7 = pairs()
        for l_8, l_9 in l_5 do
          for l_8, l_9 in l_5 do
            local type = type(l_9)
            task.wait(0.1)
            setupvalue(l_4, l_8, {LastAfter = 0, LastUse = 0})
            if type ~= "table" or not l_9.LastUse or not InfiniteSoru or l_19().Health <= 0 then
            end
          end
        end
      end
    end
  end
end)
end)
craft_page_18.Toggle(craft_page_18, "Walk on Water", WalkOnWater, function(a0)
  WalkOnWater = a0
end)
spawn(function()
  while r0 do
    if WalkOnWater then
    end
  end
  pcall(function()
  if not nelzkie then
    local service = game.GetService(game, "Workspace")
    local new = Vector3.new(1000, 112, 1000)
    service.Map["WaterBase-Plane"].Size = new
  else
    game.GetService(game, "Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000)
  end
end)
end)
craft_page_18.Toggle(craft_page_18, "Remove Fog", _G.Remove_Fog, function(a0)
  _G.Remove_Fog = a0
  if not _G.Remove_Fog then
    return
  end
  while _G.Remove_Fog do
    task.wait()
    game.Lighting.FogEnd = 9000000000
    if not _G.Remove_Fog then
    end
  end
  game.Lighting.FogEnd = 2500
end)
craft_page_18.Toggle(craft_page_18, "White Screen", _G.White_Screen, function(a0)
  _G.White_Screen = a0
  if _G.White_Screen then
    service_4.Set3dRenderingEnabled(service_4, false)
  else
    service_4.Set3dRenderingEnabled(service_4, true)
  end
end)
craft_page_18.Button(craft_page_18, "Inventory", function()
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "getInventoryWeapons")
  service_1.LocalPlayer.PlayerGui.Main.Inventory.Visible = true
end)
craft_page_18.Button(craft_page_18, "Devil Fruit Inventory", function()
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "getInventoryFruits")
  service_1.LocalPlayer.PlayerGui.Main.FruitInventory.Visible = true
end)
craft_page_18.Button(craft_page_18, "Title Name", function()
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "getTitles")
  service_1.LocalPlayer.PlayerGui.Main.Titles.Visible = true
end)
craft_page_18.Button(craft_page_18, "Color Haki", function()
  service_1.LocalPlayer.PlayerGui.Main.Colors.Visible = true
end)
craft_page_18.Button(craft_page_18, "Join Pirates Team", function()
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "SetTeam", "Pirates")
end)
craft_page_18.Button(craft_page_18, "Join Marines Team", function()
  service_9.Remotes.CommF_.InvokeServer(service_9.Remotes.CommF_, "SetTeam", "Marines")
end)
local craft_page_19 = tab_10.CraftPage(tab_10, "Misc2", 2)
craft_page_19.Toggle(craft_page_19, "Chest ESP", ChestESP, function(a0)
  ChestESP = a0
end)
spawn(function()
  while r0 do
    pcall(function()
  if ChestESP then
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        if l_4.Name == "Chest1" or l_4.Name == "Chest2" or l_4.Name == "Chest3" then
          local find_first_child = l_4.FindFirstChild(l_4, "ChestESP")
          if not find_first_child then
            local new = Instance.new("TextLabel")
            Instance.new("BillboardGui").Parent = l_4
            Instance.new("BillboardGui").ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            Instance.new("BillboardGui").Active = true
            Instance.new("BillboardGui").Name = "ChestESP"
            Instance.new("BillboardGui").AlwaysOnTop = true
            Instance.new("BillboardGui").LightInfluence = 1
            local new_1 = UDim2.new(0, 200, 0, 50)
            Instance.new("BillboardGui").Size = new_1
            Instance.new("BillboardGui").StudsOffset = Vector3.new(0, 2.5, 0)
            new.Parent = Instance.new("BillboardGui")
            new.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            new.BackgroundTransparency = 1
            new.Size = UDim2.new(0, 200, 0, 50)
            new.Font = Enum.Font.GothamMedium
            new.TextColor3 = Color3.fromRGB(255, 255, 255)
            new.Text.Size = 35
            new.TextStrokeTransparency = 0
            new.TextWrapped = true
            l_4.ChestESP.TextLabel.Text = l_4.Name .. [[

]] .. math.floor((l_20().Position - l_4.Position).Magnitude) .. " M."
            if l_4.Name == "Chest1" or (l_4.Name == "Chest2" or l_4.Name == "Chest3") then
              l_4.FindFirstChild(l_4, "ChestESP").TextLabel.TextColor3 = Color3.new(255, 255, 255)
            end
          end
        else
          local l_0, children, l_2 = pairs()
        end
      end
    end
  end
  for l_3, l_4 in l_0 do
    if l_4.Name == "Chest1" or l_4.Name == "Chest2" or l_4.Name == "Chest3" then
      if l_4.FindFirstChild(l_4, "ChestESP") then
        l_4.ChestESP.Destroy(l_4.ChestESP)
      end
      for l_3, l_4 in l_0 do
      end
    else
      for l_3, l_4 in l_0 do
      end
    end
  end
end)
  end
end)
craft_page_19.Toggle(craft_page_19, "Devil Fruit ESP", _G.ESPDF, function(a0)
  _G.ESPDF = a0
end)
spawn(function()
  while r0 do
    if _G.ESPDF then
      pcall(function()
  local l_0, children, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      local a = l_4.IsA(l_4, "Tool")
      if a and (l_4.FindFirstChild(l_4, "Handle") and not l_4.Handle.FindFirstChild(l_4.Handle, "DFESP")) then
        local new = Instance.new("TextLabel")
        Instance.new("BillboardGui").Parent = l_4.Handle
        Instance.new("BillboardGui").ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        Instance.new("BillboardGui").Active = true
        Instance.new("BillboardGui").Name = "DFESP"
        Instance.new("BillboardGui").AlwaysOnTop = true
        Instance.new("BillboardGui").LightInfluence = 1
        local new_1 = UDim2.new(0, 200, 0, 50)
        Instance.new("BillboardGui").Size = new_1
        Instance.new("BillboardGui").StudsOffset = Vector3.new(0, 2.5, 0)
        new.Parent = Instance.new("BillboardGui")
        new.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        new.BackgroundTransparency = 1
        new.Size = UDim2.new(0, 200, 0, 50)
        new.Font = Enum.Font.GothamMedium
        new.TextColor3 = Color3.fromRGB(255, 255, 0)
        new.Text.Size = 35
        new.TextStrokeTransparency = 0
        new.TextWrapped = true
        Dis = math.floor((l_20().Position - l_4.Handle.Position).Magnitude)
        l_4.Handle.DFESP.TextLabel.Text = l_4.Name .. [[

]] .. Dis .. " M."
      end
    end
  end
end)
      local l_0, children, l_2 = pairs()
    end
  end
  for l_3, l_4 in l_0 do
    while l_0 do
    end
    local a = l_4.IsA(l_4, "Tool")
    if a and l_4.FindFirstChild(l_4, "Handle") and l_4.Handle.FindFirstChild(l_4.Handle, "DFESP") then
      l_4.Destroy(l_4)
    end
    for l_3, l_4 in l_0 do
    end
  end
end)
craft_page_19.Toggle(craft_page_19, "Fruit ESP", FruitESPe, function(a0)
  FruitESPe = a0
end)
spawn(function()
  while r0 do
    if FruitESPe then
      pcall(function()
  local l_0, children, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      if l_4.Name == "PineappleSpawner" or l_4.Name == "BananaSpawner" or l_4.Name == "AppleSpawner" then
        local l_5, children_1, l_7 = pairs()
        for l_8, l_9 in l_5 do
          for l_8, l_9 in l_5 do
            local a = l_9.IsA(l_9, "Tool")
            if a and l_9.FindFirstChild(l_9, "Handle") then
              while not l_9.FindFirstChild(l_9, "Handle") do
                local new = Instance.new("TextLabel")
                Instance.new("BillboardGui").Parent = l_9.Handle
                Instance.new("BillboardGui").ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                Instance.new("BillboardGui").Active = true
                Instance.new("BillboardGui").Name = "FruitESP"
                Instance.new("BillboardGui").AlwaysOnTop = true
                Instance.new("BillboardGui").LightInfluence = 1
                local new_1 = UDim2.new(0, 200, 0, 50)
                Instance.new("BillboardGui").Size = new_1
                Instance.new("BillboardGui").StudsOffset = Vector3.new(0, 2.5, 0)
                new.Parent = Instance.new("BillboardGui")
                new.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                new.BackgroundTransparency = 1
                new.Size = UDim2.new(0, 200, 0, 50)
                new.Font = Enum.Font.GothamMedium
                new.TextColor3 = Color3.fromRGB(255, 255, 0)
                new.Text.Size = 35
                new.TextStrokeTransparency = 0
                new.TextWrapped = true
                l_9.Handle.FruitESP.TextLabel.Text = l_9.Name .. [[

]] .. math.floor((l_20().Position - l_9.Handle.Position).Magnitude) .. " M."
                if FruitESPe then
                  task.wait(0.1)
                  if not l_9.Handle.FindFirstChild(l_9.Handle, "FruitESP") then
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end)
      local l_0, children, l_2 = pairs()
    end
  end
  for l_3, l_4 in l_0 do
    while l_0 do
    end
    if l_4.Name == "PineappleSpawner" or l_4.Name == "BananaSpawner" or l_4.Name == "AppleSpawner" then
      local l_5, children_1, l_7 = pairs()
      for l_8, l_9 in l_5 do
        for l_8, l_9 in l_5 do
          while l_0 do
          end
          local a = l_9.IsA(l_9, "Tool")
          if a and l_9.FindFirstChild(l_9, "Handle") and l_9.Handle.FindFirstChild(l_9.Handle, "FruitESP") then
            l_9.Handle.FruitESP.Destroy(l_9.Handle.FruitESP)
          end
          for l_3, l_4 in l_0 do
          end
        end
      end
    end
    for l_3, l_4 in l_0 do
    end
  end
end)
craft_page_19.Toggle(craft_page_19, "Flower ESP", FlowerESP, function(a0)
  FlowerESP = a0
end)
spawn(function()
  while r0 do
    if FlowerESP then
      pcall(function()
  local l_0, children, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      if l_4.Name == "Flower2" or l_4.Name == "Flower1" then
        local find_first_child = l_4.FindFirstChild(l_4, "FindFlower")
        if not find_first_child then
          local new = Instance.new("TextLabel")
          Instance.new("BillboardGui").Parent = l_4
          Instance.new("BillboardGui").ZIndexBehavior = Enum.ZIndexBehavior.Sibling
          Instance.new("BillboardGui").Active = true
          Instance.new("BillboardGui").Name = "FindFlower"
          Instance.new("BillboardGui").AlwaysOnTop = true
          Instance.new("BillboardGui").LightInfluence = 1
          local new_1 = UDim2.new(0, 200, 0, 50)
          Instance.new("BillboardGui").Size = new_1
          Instance.new("BillboardGui").StudsOffset = Vector3.new(0, 2.5, 0)
          new.Parent = Instance.new("BillboardGui")
          new.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
          new.BackgroundTransparency = 1
          new.Size = UDim2.new(0, 200, 0, 50)
          new.Font = Enum.Font.GothamMedium
          new.TextColor3 = Color3.fromRGB(250, 250, 30)
          new.Text.Size = 75
          new.TextStrokeTransparency = 0
          new.TextWrapped = true
          l_4.FindFlower.TextLabel.Text = l_4.Name .. " - [" .. math.floor((l_20().Position - l_4.Position).Magnitude) .. " M]"
          if l_4.Name == "Flower1" then
            l_4.FindFlower.TextLabel.TextColor3 = Color3.new(255, 120, 120)
          elseif l_4.Name == "Flower2" then
            l_4.FindFlower.TextLabel.TextColor3 = Color3.new(120, 120, 255)
          end
        end
      end
    end
  end
end)
      local service = game.GetService(game, "Workspace")
      local l_0, children, l_2 = pairs()
    end
  end
  for l_3, l_4 in l_0 do
    while l_0 do
    end
    local find_first_child = l_4.FindFirstChild(l_4, "FindFlower")
    if find_first_child then
      l_4.FindFlower.Destroy(l_4.FindFlower)
    end
    for l_3, l_4 in l_0 do
    end
  end
end)
craft_page_19.Toggle(craft_page_19, "Island ESP", IslandESP, function(a0)
  IslandESP = a0
end)
spawn(function()
  while r0 do
    if IslandESP then
      pcall(function()
  local service = game.GetService(game, "Workspace")
  local l_0, children, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      local find_first_child = l_4.FindFirstChild(l_4, "IslandEsp")
      if not find_first_child then
        local new = Instance.new("TextLabel")
        Instance.new("BillboardGui").Parent = l_4
        Instance.new("BillboardGui").ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        Instance.new("BillboardGui").Active = true
        Instance.new("BillboardGui").Name = "IslandEsp"
        Instance.new("BillboardGui").AlwaysOnTop = true
        Instance.new("BillboardGui").LightInfluence = 1
        local new_1 = UDim2.new(0, 200, 0, 50)
        Instance.new("BillboardGui").Size = new_1
        Instance.new("BillboardGui").StudsOffset = Vector3.new(0, 2.5, 0)
        new.Parent = Instance.new("BillboardGui")
        new.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        new.BackgroundTransparency = 1
        new.Size = UDim2.new(0, 200, 0, 50)
        new.Font = Enum.Font.GothamMedium
        new.TextColor3 = Color3.fromRGB(255, 0, 255)
        new.Text.Size = 75
        new.TextStrokeTransparency = 0
        new.TextWrapped = true
        l_4.IslandEsp.TextLabel.Text = l_4.Name .. [[

]] .. "[" .. math.floor((l_20().Position - l_4.Position).Magnitude / 10) .. "]"
      end
    end
  end
end)
      local service = game.GetService(game, "Workspace")
      local l_0, children, l_2 = pairs()
    end
  end
  for l_3, l_4 in l_0 do
    while l_0 do
    end
    local find_first_child = l_4.FindFirstChild(l_4, "IslandEsp")
    if find_first_child then
      l_4.IslandEsp.Destroy(l_4.IslandEsp)
    end
    for l_3, l_4 in l_0 do
    end
  end
end)
craft_page_19.Toggle(craft_page_19, "Npc ESP", NpcESP, function(a0)
  NpcESP = a0
end)
spawn(function()
  while r0 do
    if NpcESP then
      pcall(function()
  local service = game.GetService(game, "Workspace")
  local l_0, children, l_2 = pairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      local find_first_child = l_4.FindFirstChild(l_4, "HumanoidRootPart")
      if find_first_child and not l_4.FindFirstChild(l_4, "NpcEspes") then
        local new = Instance.new("TextLabel")
        Instance.new("BillboardGui").Parent = l_4
        Instance.new("BillboardGui").ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        Instance.new("BillboardGui").Active = true
        Instance.new("BillboardGui").Name = "NpcEspes"
        Instance.new("BillboardGui").AlwaysOnTop = true
        Instance.new("BillboardGui").LightInfluence = 1
        local new_1 = UDim2.new(0, 200, 0, 50)
        Instance.new("BillboardGui").Size = new_1
        Instance.new("BillboardGui").StudsOffset = Vector3.new(0, 2.5, 0)
        new.Parent = Instance.new("BillboardGui")
        new.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        new.BackgroundTransparency = 1
        new.Size = UDim2.new(0, 200, 0, 50)
        new.Font = Enum.Font.GothamMedium
        new.TextColor3 = Color3.fromRGB(0, 255, 255)
        new.Text.Size = 35
        l_4.NpcEspes.TextLabel.Text = l_4.Name .. " - [" .. math.floor((l_20().Position - l_4.HumanoidRootPart.Position).Magnitude) .. " M]"
      end
    end
  end
end)
      local service = game.GetService(game, "Workspace")
      local l_0, children, l_2 = pairs()
    end
  end
  for l_3, l_4 in l_0 do
    while l_0 do
    end
    local find_first_child = l_4.FindFirstChild(l_4, "NpcEspes")
    if find_first_child then
      l_4.NpcEspes.Destroy(l_4.NpcEspes)
    end
    for l_3, l_4 in l_0 do
    end
  end
end)
craft_page_19.Toggle(craft_page_19, "ESP Player", _G.ESPPlayer, function(a0)
  _G.ESPPlayer = a0
end)
spawn(function()
  while r0 do
    pcall(function()
  if _G.ESPPlayer then
    local l_0, children, l_2 = pairs()
    for l_3, l_4 in l_0 do
      for l_3, l_4 in l_0 do
        if l_4.Name ~= service_1.LocalPlayer.Name then
          local find_first_child = l_4.Character.HumanoidRootPart.FindFirstChild(l_4.Character.HumanoidRootPart, "PlayerESP")
          if not find_first_child then
            local new = Instance.new("TextLabel")
            Instance.new("BillboardGui").Parent = l_4.Character.HumanoidRootPart
            Instance.new("BillboardGui").ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            Instance.new("BillboardGui").Active = true
            Instance.new("BillboardGui").Name = "PlayerESP"
            Instance.new("BillboardGui").AlwaysOnTop = true
            Instance.new("BillboardGui").LightInfluence = 1
            local new_1 = UDim2.new(0, 200, 0, 50)
            Instance.new("BillboardGui").Size = new_1
            Instance.new("BillboardGui").StudsOffset = Vector3.new(0, 2.5, 0)
            new.Parent = Instance.new("BillboardGui")
            new.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            new.BackgroundTransparency = 1
            new.Size = UDim2.new(0, 200, 0, 50)
            new.Font = Enum.Font.GothamMedium
            new.TextColor3 = Color3.fromRGB(255, 255, 255)
            new.Text.Size = 35
            new.TextStrokeTransparency = 0
            new.TextWrapped = true
            l_4.Character.HumanoidRootPart.FindFirstChild(l_4.Character.HumanoidRootPart, "PlayerESP").TextLabel.Text = l_4.Name .. [[


]] .. math.floor((l_20().Position - l_4.Character.HumanoidRootPart.Position).Magnitude) .. " M."
            if l_4.Team == service_1.LocalPlayer.Team then
              l_4.Character.HumanoidRootPart.FindFirstChild(l_4.Character.HumanoidRootPart, "PlayerESP").TextLabel.TextColor3 = Color3.new(255, 0, 0)
            else
              l_4.Character.HumanoidRootPart.FindFirstChild(l_4.Character.HumanoidRootPart, "PlayerESP").TextLabel.TextColor3 = Color3.new(0, 255, 0)
            end
          end
        end
      end
    end
  else
    local l_0, children, l_2 = pairs()
  end
  for l_3, l_4 in l_0 do
    if l_4.Name ~= service_1.LocalPlayer.Name and l_4.Character.HumanoidRootPart.FindFirstChild(l_4.Character.HumanoidRootPart, "PlayerESP") then
      l_4.Character.HumanoidRootPart.PlayerESP.Destroy(l_4.Character.HumanoidRootPart.PlayerESP)
    end
    for l_3, l_4 in l_0 do
    end
  end
end)
  end
end)
craft_page_19.Toggle(craft_page_19, "Currently Broken", DodgewithoutCool, function(a0)
  print("What Did i just say")
end)
local l_127 = {
  "EXP_5B",
  "CONTROL",
  "UPDATE11",
  "XMASEXP",
  "1BILLION",
  "ShutDownFix2",
  "UPD14",
  "STRAWHATMAINE",
  "TantaiGaming",
  "Colosseum",
  "Axiore",
  "Sub2Daigrock",
  "Sky Island 3",
  "Sub2OfficialNoobie",
  "SUB2NOOBMASTER123",
  "THEGREATACE",
  "Fountain City",
  "BIGNEWS",
  "FUDD10",
  "SUB2GAMERROBOT_EXP1",
  "UPD15",
  "2BILLION",
  "UPD16",
  "3BVISITS",
  "fudd10_v2",
  "Starcodeheo",
  "Magicbus",
  "JCWK",
  "Bluxxy",
  "Bluxxy",
  "Sub2Fer999",
  "Enyu_is_Pro"
}
craft_page_19.Button(craft_page_19, "Redeem X2 Code", function()
  local l_1, l_2, l_3 = ipairs(l_127)
  for l_4, l_5 in l_1 do
    for l_4, l_5 in l_1 do
      function(a0)
  service_9.Remotes.Redeem.InvokeServer(service_9.Remotes.Redeem, a0)
end(l_5)
    end
  end
end)
craft_page_19.Button(craft_page_19, "Always Day", function()
  while r0 do
    service_8.ClockTime = 12
  end
end)
craft_page_19.Button(craft_page_19, "Remove Lave", function()
  local l_0, descendants, l_2 = ipairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      if l_4.Name == "Lava" then
        l_4.Destroy(l_4)
      end
    end
  end
  local l_0, descendants, l_2 = ipairs()
  for l_3, l_4 in l_0 do
    for l_3, l_4 in l_0 do
      if l_4.Name == "Lava" then
        l_4.Destroy(l_4)
      end
    end
  end
end)
local loadstring = loadstring()
loadstring()
loadstring()()
loadstring()()
