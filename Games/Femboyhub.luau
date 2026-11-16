
-- Pink Animated GUI
-- Place in a LocalScript

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PinkFemboyGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Main Frame
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 320, 0, 150)
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(255, 145, 205)
Main.BackgroundTransparency = 1
Main.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 18)
Corner.Parent = Main

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(255, 225, 245)
Stroke.Thickness = 2
Stroke.Transparency = 1
Stroke.Parent = Main

-- Text
local Text = Instance.new("TextLabel")
Text.Size = UDim2.new(1, -20, 1, -20)
Text.Position = UDim2.new(0, 10, 0, 10)
Text.BackgroundTransparency = 1
Text.Text = "Femboys are all gay 💗"
Text.TextColor3 = Color3.fromRGB(255, 255, 255)
Text.TextSize = 23
Text.Font = Enum.Font.GothamBold
Text.TextTransparency = 1
Text.TextWrapped = true
Text.Parent = Main

-- Appearance Animation
Main.Size = UDim2.new(0, 0, 0, 0)

local TweenInfo1 = TweenInfo.new(
    0.8,
    Enum.EasingStyle.Back,
    Enum.EasingDirection.Out
)

TweenService:Create(Main, TweenInfo1, {
    Size = UDim2.new(0, 320, 0, 150),
    BackgroundTransparency = 0
}):Play()

TweenService:Create(Stroke, TweenInfo.new(0.8), {
    Transparency = 0
}):Play()

task.wait(0.3)

TweenService:Create(Text, TweenInfo.new(0.6), {
    TextTransparency = 0
}):Play()
