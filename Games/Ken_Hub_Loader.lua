-- Ken Hub Loader
-- Click the Execute button to fetch and run your hosted loader.
-- Use only with code you own or have permission to run.

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

local LOADER_URL = "https://api.aurorax.site/files/v5/loaders/babc9729b2fce8d6a321d6968cf502b3"
local GUI_NAME = "KenHubLoader"

-- Remove an older copy of this loader UI.
pcall(function()
    local parent = (gethui and gethui()) or CoreGui
    local old = parent:FindFirstChild(GUI_NAME)
    if old then old:Destroy() end
end)

local parent = (gethui and gethui()) or CoreGui
local gui = Instance.new("ScreenGui")
gui.Name = GUI_NAME
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = parent

local frame = Instance.new("Frame")
frame.Name = "Main"
frame.Size = UDim2.fromOffset(300, 160)
frame.Position = UDim2.new(0.5, -150, 0.5, -80)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
frame.BorderSizePixel = 0
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Transparency = 0.78
stroke.Thickness = 1
stroke.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -24, 0, 36)
title.Position = UDim2.fromOffset(12, 10)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.Text = "KEN HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 20
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = frame

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -24, 0, 24)
status.Position = UDim2.fromOffset(12, 48)
status.BackgroundTransparency = 1
status.Font = Enum.Font.Gotham
status.Text = "Ready to execute"
status.TextColor3 = Color3.fromRGB(175, 175, 185)
status.TextSize = 12
status.TextXAlignment = Enum.TextXAlignment.Left
status.Parent = frame

local executeButton = Instance.new("TextButton")
executeButton.Size = UDim2.new(1, -24, 0, 42)
executeButton.Position = UDim2.fromOffset(12, 91)
executeButton.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
executeButton.BorderSizePixel = 0
executeButton.Font = Enum.Font.GothamBold
executeButton.Text = "EXECUTE"
executeButton.TextColor3 = Color3.fromRGB(15, 15, 20)
executeButton.TextSize = 14
executeButton.AutoButtonColor = true
executeButton.Parent = frame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8)
buttonCorner.Parent = executeButton

local busy = false
executeButton.MouseButton1Click:Connect(function()
    if busy then return end
    busy = true
    executeButton.Text = "LOADING..."
    status.Text = "Fetching Ken Hub loader..."

    local ok, result = pcall(function()
        local source = game:HttpGet(LOADER_URL)
        assert(type(source) == "string" and #source > 0, "The server returned an empty response")

        local chunk, compileError = loadstring(source)
        assert(chunk, compileError or "Could not compile the loader")

        chunk()
    end)

    if ok then
        status.Text = "Loader executed"
    else
        status.Text = "Error: " .. tostring(result)
        warn("[Ken Hub] Loader error: " .. tostring(result))
    end

    executeButton.Text = "EXECUTE"
    busy = false
end)
