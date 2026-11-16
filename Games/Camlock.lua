local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera


local FOV = 250 -- studs, how far to detect players
local SMOOTHNESS = 0.15 -- 0 = instant, 1 = very slow


local camlockEnabled = false
local targetPlayer = nil
local connection = nil


local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CamlockUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 220, 0, 110)
MainFrame.Position = UDim2.new(0.5, -110, 0.5, -55)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true -- built-in draggable
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(80, 80, 90)
Stroke.Thickness = 1
Stroke.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "Camlock"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.Parent = MainFrame

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "StatusLabel"
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Position = UDim2.new(0, 0, 0, 30)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "OFF"
StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
StatusLabel.Font = Enum.Font.GothamBold
StatusLabel.TextSize = 14
StatusLabel.Parent = MainFrame

local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(1, -20, 0, 32)
ToggleButton.Position = UDim2.new(0, 10, 1, -42)
ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
ToggleButton.Text = "Turn ON"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.Gotham
ToggleButton.TextSize = 14
ToggleButton.BorderSizePixel = 0
ToggleButton.Parent = MainFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 6)
BtnCorner.Parent = ToggleButton

-- ============ LOGIC ============

local function getNearestPlayer()
    local nearest = nil
    local shortestDist = FOV

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if hrp and humanoid and humanoid.Health > 0 then
                local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if myHRP then
                    local dist = (hrp.Position - myHRP.Position).Magnitude
                    if dist < shortestDist then
                        shortestDist = dist
                        nearest = player
                    end
                end
            end
        end
    end

    return nearest
end

local function aimAtTarget()
    if not targetPlayer or not targetPlayer.Character then return end
    local hrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
    local head = targetPlayer.Character:FindFirstChild("Head")
    if not head then return end

    local targetPos = head.Position
    local camPos = Camera.CFrame.Position
    local desiredCFrame = CFrame.new(camPos, targetPos)

    Camera.CFrame = Camera.CFrame:Lerp(desiredCFrame, SMOOTHNESS)
end

local function startCamlock()
    connection = RunService.RenderStepped:Connect(function()
        targetPlayer = getNearestPlayer()
        if targetPlayer then
            aimAtTarget()
        end
    end)
end

local function stopCamlock()
    if connection then
        connection:Disconnect()
        connection = nil
    end
    targetPlayer = nil
end

ToggleButton.MouseButton1Click:Connect(function()
    camlockEnabled = not camlockEnabled

    if camlockEnabled then
        StatusLabel.Text = "ON"
        StatusLabel.TextColor3 = Color3.fromRGB(80, 255, 120)
        ToggleButton.Text = "Turn OFF"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 130, 60)
        startCamlock()
    else
        StatusLabel.Text = "OFF"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
        ToggleButton.Text = "Turn ON"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        stopCamlock()
    end
end)

-- Clean up on respawn/leave
LocalPlayer.CharacterAdded:Connect(function()
    if camlockEnabled then
        stopCamlock()
        startCamlock()
    end
end)
