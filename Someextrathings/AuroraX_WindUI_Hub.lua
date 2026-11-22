--[[
    AuroraX Hub - WindUI edition  (Pinky Modz by Ian)
    Tabs: Home, Aimbot, ESP, PvP, Macro, Players, Configs, Settings
    Every executor API (loadstring/HttpGet/writefile/readfile/gethui/
    VirtualInputManager/setclipboard...) is probed before use; if something
    is missing only that feature is skipped, the hub itself keeps loading.
]]

local Players            = game:GetService("Players")
local RunService         = game:GetService("RunService")
local UserInputService   = game:GetService("UserInputService")
local HttpService        = game:GetService("HttpService")
local TeleportService    = game:GetService("TeleportService")
local CoreGui            = game:GetService("CoreGui")
local Lighting           = game:GetService("Lighting")

local LP = Players.LocalPlayer
if not LP then
    Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
    LP = Players.LocalPlayer
end

---------------------------------------------------------------------------
-- Executor compatibility helpers
---------------------------------------------------------------------------
local Env = _G
do
    local ok, env = pcall(function()
        if type(getgenv) == "function" then return getgenv() end
    end)
    if ok and type(env) == "table" then Env = env end
end

-- unload a previous copy of the hub
if type(Env.AuroraXHub_Unload) == "function" then
    pcall(Env.AuroraXHub_Unload)
end

local function httpGet(url)
    local ok, body = pcall(function() return game:HttpGet(url) end)
    if ok and type(body) == "string" and body ~= "" then return body end
    local req = (type(request) == "function" and request)
        or (type(http_request) == "function" and http_request)
        or (type(syn) == "table" and type(syn.request) == "function" and syn.request)
        or nil
    if req then
        local ok2, res = pcall(req, { Url = url, Method = "GET" })
        if ok2 and type(res) == "table" and type(res.Body) == "string" and res.Body ~= "" then
            return res.Body
        end
    end
    return nil
end

local function canFiles()
    return type(writefile) == "function" and type(readfile) == "function"
end

local function makeFolder(path)
    if type(makefolder) ~= "function" then return false end
    if type(isfolder) == "function" then
        local ok, exists = pcall(isfolder, path)
        if ok and exists then return true end
    end
    return (pcall(makefolder, path))
end

local function fileExists(path)
    if type(isfile) ~= "function" then return false end
    local ok, res = pcall(isfile, path)
    return ok and res == true
end

local function setClip(text)
    local fn = (type(setclipboard) == "function" and setclipboard)
        or (type(toclipboard) == "function" and toclipboard) or nil
    if not fn then return false end
    return (pcall(fn, text))
end

local function getHui()
    local candidates = {}
    local ok, res = pcall(function()
        if type(gethui) == "function" then return gethui() end
    end)
    if ok and typeof(res) == "Instance" then candidates[#candidates + 1] = res end
    candidates[#candidates + 1] = CoreGui
    local pg = LP:FindFirstChildOfClass("PlayerGui")
    if pg then candidates[#candidates + 1] = pg end
    for _, container in ipairs(candidates) do
        local test = Instance.new("ScreenGui")
        local okParent = pcall(function() test.Parent = container end)
        local good = okParent and test.Parent == container
        pcall(function() test:Destroy() end)
        if good then return container end
    end
    return pg or CoreGui
end

local function protect(gui)
    if type(syn) == "table" and type(syn.protect_gui) == "function" then
        pcall(syn.protect_gui, gui)
    end
end

local VIM
do
    local ok, svc = pcall(function() return game:GetService("VirtualInputManager") end)
    if ok then VIM = svc end
end

---------------------------------------------------------------------------
-- Load WindUI
---------------------------------------------------------------------------
local function loadWindUI()
    if type(loadstring) ~= "function" then return nil, "loadstring is not supported by this executor" end
    local urls = {
        "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua",
    }
    for _, url in ipairs(urls) do
        local body = httpGet(url)
        if body then
            local okLoad, fn = pcall(loadstring, body)
            if okLoad and type(fn) == "function" then
                local okRun, lib = pcall(fn)
                if okRun and type(lib) == "table" then return lib end
            end
        end
    end
    return nil, "could not download WindUI (HTTP blocked or GitHub unreachable)"
end

local WindUI, loadErr = loadWindUI()
if not WindUI then
    warn("[AuroraX] " .. tostring(loadErr))
    return
end

---------------------------------------------------------------------------
-- State / cleanup
---------------------------------------------------------------------------
local S = {}                 -- every setting lives here (also what configs save)
local Elements = {}          -- key -> WindUI element (for loading configs)
local Connections = {}
local Cleanups = {}
local Blacklist = {}         -- [lowercase name] = true
local unloaded = false

local function connect(signal, fn)
    local c = signal:Connect(fn)
    Connections[#Connections + 1] = c
    return c
end

local function notify(title, content, duration)
    pcall(function()
        WindUI:Notify({ Title = title, Content = content, Duration = duration or 3, Icon = "bell" })
    end)
end

---------------------------------------------------------------------------
-- Window
---------------------------------------------------------------------------
local Window = WindUI:CreateWindow({
    Title = "AuroraX",
    Icon = "sparkles",
    Author = "Pinky Modz by Ian",
    Folder = "AuroraX",
    Size = UDim2.fromOffset(600, 460),
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 190,
})

pcall(function()
    Window:EditOpenButton({
        Title = "AuroraX",
        Icon = "sparkles",
        CornerRadius = UDim.new(0, 16),
        StrokeThickness = 2,
        Color = ColorSequence.new(Color3.fromRGB(255, 32, 56), Color3.fromRGB(110, 48, 58)),
        Draggable = true,
    })
end)
pcall(function() Window:SetToggleKey(Enum.KeyCode.RightShift) end)

local function Section(tab, title)
    pcall(function() tab:Section({ Title = title }) end)
end

local function Toggle(tab, key, title, desc, default, cb)
    S[key] = default
    local ok, el = pcall(function()
        return tab:Toggle({
            Title = title, Desc = desc, Value = default,
            Callback = function(v)
                S[key] = v
                if cb then task.spawn(cb, v) end
            end,
        })
    end)
    if ok then Elements[key] = el end
    return el
end

local function Slider(tab, key, title, min, max, default, cb, step)
    S[key] = default
    local ok, el = pcall(function()
        return tab:Slider({
            Title = title, Step = step or 1,
            Value = { Min = min, Max = max, Default = default },
            Callback = function(v)
                S[key] = v
                if cb then task.spawn(cb, v) end
            end,
        })
    end)
    if ok then Elements[key] = el end
    return el
end

local function Dropdown(tab, key, title, values, default, cb)
    S[key] = default
    local ok, el = pcall(function()
        return tab:Dropdown({
            Title = title, Values = values, Value = default,
            Callback = function(v)
                S[key] = v
                if cb then task.spawn(cb, v) end
            end,
        })
    end)
    if ok then Elements[key] = el end
    return el
end

local function Button(tab, title, desc, cb)
    pcall(function()
        tab:Button({ Title = title, Desc = desc, Callback = function() task.spawn(cb) end })
    end)
end

---------------------------------------------------------------------------
-- Shared game helpers
---------------------------------------------------------------------------
local function getHumanoid(char)
    return char and char:FindFirstChildOfClass("Humanoid")
end

local function isAlive(char)
    local h = getHumanoid(char)
    return h ~= nil and h.Health > 0
end

local function myChar() return LP.Character end
local function myRoot()
    local c = myChar()
    return c and c:FindFirstChild("HumanoidRootPart")
end

local function getLevel(plr)
    local d = plr:FindFirstChild("Data")
    local l = d and d:FindFirstChild("Level")
    return l and tonumber(l.Value) or 0
end

local function getFruit(plr)
    local d = plr:FindFirstChild("Data")
    local f = d and d:FindFirstChild("DevilFruit")
    return f and tostring(f.Value) or "None"
end

local function getBounty(plr)
    local ls = plr:FindFirstChild("leaderstats")
    local b = ls and (ls:FindFirstChild("Bounty/Honor") or ls:FindFirstChild("Bounty"))
    return b and tostring(b.Value) or "?"
end

local function getWeapon(char)
    local t = char and char:FindFirstChildOfClass("Tool")
    return t and t.Name or "None"
end

local function enemiesFolder()
    return workspace:FindFirstChild("Enemies")
end

---------------------------------------------------------------------------
-- TAB: Home
---------------------------------------------------------------------------
local HomeTab = Window:Tab({ Title = "Home", Icon = "info" })
Section(HomeTab, "Welcome")
pcall(function()
    HomeTab:Paragraph({
        Title = "Pinky Modz by Ian",
        Desc = "AuroraX hub rebuilt on WindUI. Press RightShift to hide / show the window.",
    })
end)
Section(HomeTab, "Session")
local gameName = "Unknown"
pcall(function()
    gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
end)
pcall(function()
    HomeTab:Paragraph({
        Title = "Session",
        Desc = ("Game: %s\nPlaceId: %d\nPlayer: %s\nFile support: %s\nVirtualInput: %s"):format(
            gameName, game.PlaceId, LP.Name,
            canFiles() and "yes" or "no", VIM and "yes" or "no"),
    })
end)
Section(HomeTab, "Community")
Button(HomeTab, "Copy Discord Invite", "https://discord.gg/wWJvsQ9Ed8", function()
    if setClip("https://discord.gg/wWJvsQ9Ed8") then
        notify("AuroraX", "Discord invite copied to clipboard")
    else
        notify("AuroraX", "setclipboard is not supported by your executor")
    end
end)

---------------------------------------------------------------------------
-- TAB: Aimbot
---------------------------------------------------------------------------
local AimTab = Window:Tab({ Title = "Aimbot", Icon = "crosshair" })

Section(AimTab, "Aim Assist")
Toggle(AimTab, "AimPlayers", "Aim Assist Players", "Lock onto players while holding Right Mouse", false)
Toggle(AimTab, "AimNPC", "Aim Assist NPC", "Lock onto NPCs (workspace.Enemies)", false)
Dropdown(AimTab, "AimMode", "Aim Mode", { "Cursor FOV", "Closest Distance", "Front 180" }, "Cursor FOV")
Dropdown(AimTab, "TargetPart", "Target Part", { "Head", "UpperTorso", "HumanoidRootPart", "LowerTorso" }, "UpperTorso")
Slider(AimTab, "FOV", "FOV Radius", 30, 600, 150)
Slider(AimTab, "Smooth", "Smoothness (1 = instant)", 1, 20, 1)
Toggle(AimTab, "Prediction", "Prediction", "Lead the target using its velocity", false)
Toggle(AimTab, "ShowFOV", "Show FOV", "Draw the FOV circle", false)
Toggle(AimTab, "Tracers", "Tracers", "Line from cursor to the current target", false)

Section(AimTab, "Target Filters")
Toggle(AimTab, "TeamCheck", "Team Check", "Ignore players on your team", true)
Toggle(AimTab, "IgnoreFF", "Ignore PvP Off / Safe Zone", "Best effort: skips targets that have a ForceField", true)
Toggle(AimTab, "IgnoreLowLevel", "Ignore Low Level", "Skip players below the minimum level", false)
Slider(AimTab, "MinLevel", "Min Level", 1, 2800, 1)

Section(AimTab, "Blacklist Master")
Toggle(AimTab, "MasterBlacklist", "Master Blacklist", "Never aim at blacklisted players", true)
local blacklistChoice
local function playerNames()
    local t = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP then t[#t + 1] = p.Name end
    end
    table.sort(t)
    if #t == 0 then t[1] = "(no players)" end
    return t
end
local blDrop = Dropdown(AimTab, "BlacklistPick", "Player", playerNames(), playerNames()[1], function(v)
    blacklistChoice = v
end)
blacklistChoice = playerNames()[1]
Button(AimTab, "Add to Blacklist", "Aim assist will ignore this player", function()
    if blacklistChoice and blacklistChoice ~= "(no players)" then
        Blacklist[blacklistChoice:lower()] = true
        notify("Blacklist", blacklistChoice .. " added")
    end
end)
Button(AimTab, "Remove from Blacklist", nil, function()
    if blacklistChoice then
        Blacklist[blacklistChoice:lower()] = nil
        notify("Blacklist", blacklistChoice .. " removed")
    end
end)
Button(AimTab, "Clear Blacklist", nil, function()
    Blacklist = {}
    notify("Blacklist", "Cleared")
end)

-- aim overlay (UI based, so it does not depend on the Drawing API)
local hui = getHui()
local Overlay = Instance.new("ScreenGui")
Overlay.Name = "AuroraX_Overlay"
Overlay.ResetOnSpawn = false
Overlay.IgnoreGuiInset = true
Overlay.DisplayOrder = 999999
protect(Overlay)
Overlay.Parent = hui

local FovCircle = Instance.new("Frame")
FovCircle.AnchorPoint = Vector2.new(0.5, 0.5)
FovCircle.BackgroundTransparency = 1
FovCircle.Visible = false
FovCircle.Parent = Overlay
do
    local c = Instance.new("UICorner"); c.CornerRadius = UDim.new(1, 0); c.Parent = FovCircle
    local s = Instance.new("UIStroke"); s.Thickness = 1.8; s.Color = Color3.fromRGB(246, 60, 60); s.Parent = FovCircle
end

local TracerLine = Instance.new("Frame")
TracerLine.AnchorPoint = Vector2.new(0.5, 0.5)
TracerLine.BackgroundColor3 = Color3.fromRGB(255, 32, 56)
TracerLine.BorderSizePixel = 0
TracerLine.Visible = false
TracerLine.Parent = Overlay

local aimHeld = false
connect(UserInputService.InputBegan, function(input, processed)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then aimHeld = true end
end)
connect(UserInputService.InputEnded, function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then aimHeld = false end
end)

local function candidateOk(plr)
    if plr == LP then return false end
    local char = plr.Character
    if not isAlive(char) then return false end
    if S.TeamCheck and plr.Team ~= nil and plr.Team == LP.Team then return false end
    if S.MasterBlacklist and Blacklist[plr.Name:lower()] then return false end
    if S.IgnoreFF and char:FindFirstChildOfClass("ForceField") then return false end
    if S.IgnoreLowLevel and getLevel(plr) < S.MinLevel then return false end
    return true
end

local function pickTarget()
    local cam = workspace.CurrentCamera
    if not cam then return nil end
    local mouse = UserInputService:GetMouseLocation()
    local root = myRoot()
    local best, bestScore, bestPart = nil, math.huge, nil

    local function consider(char)
        local part = char:FindFirstChild(S.TargetPart) or char:FindFirstChild("HumanoidRootPart")
        if not part then return end
        local v, onScreen = cam:WorldToViewportPoint(part.Position)
        local screenDist = (Vector2.new(v.X, v.Y) - mouse).Magnitude
        local score
        if S.AimMode == "Cursor FOV" then
            if not onScreen or screenDist > S.FOV then return end
            score = screenDist
        elseif S.AimMode == "Closest Distance" then
            if not root then return end
            if onScreen and screenDist > S.FOV * 3 then return end
            score = (part.Position - root.Position).Magnitude
        else -- Front 180
            if not root then return end
            local dir = (part.Position - cam.CFrame.Position)
            if dir.Magnitude == 0 or dir.Unit:Dot(cam.CFrame.LookVector) <= 0 then return end
            score = (part.Position - root.Position).Magnitude
        end
        if score < bestScore then best, bestScore, bestPart = char, score, part end
    end

    if S.AimPlayers then
        for _, plr in ipairs(Players:GetPlayers()) do
            if candidateOk(plr) then consider(plr.Character) end
        end
    end
    if S.AimNPC then
        local folder = enemiesFolder()
        if folder then
            for _, m in ipairs(folder:GetChildren()) do
                if m:IsA("Model") and isAlive(m) then consider(m) end
            end
        end
    end
    return best, bestPart
end

connect(RunService.RenderStepped, function()
    if unloaded then return end
    local cam = workspace.CurrentCamera
    local mouse = UserInputService:GetMouseLocation()

    FovCircle.Visible = S.ShowFOV == true
    if FovCircle.Visible then
        FovCircle.Position = UDim2.fromOffset(mouse.X, mouse.Y)
        FovCircle.Size = UDim2.fromOffset(S.FOV * 2, S.FOV * 2)
    end

    TracerLine.Visible = false
    if not cam or not (S.AimPlayers or S.AimNPC) then return end

    local target, part = pickTarget()
    if not target or not part then return end

    local aimPos = part.Position
    if S.Prediction then
        local ok, vel = pcall(function() return part.AssemblyLinearVelocity end)
        if ok and vel then aimPos = aimPos + vel * 0.1 end
    end

    if S.Tracers then
        local v = cam:WorldToViewportPoint(aimPos)
        local from, to = mouse, Vector2.new(v.X, v.Y)
        local diff = to - from
        TracerLine.Size = UDim2.fromOffset(diff.Magnitude, 2)
        TracerLine.Position = UDim2.fromOffset((from.X + to.X) / 2, (from.Y + to.Y) / 2)
        TracerLine.Rotation = math.deg(math.atan2(diff.Y, diff.X))
        TracerLine.Visible = true
    end

    if aimHeld then
        local goal = CFrame.new(cam.CFrame.Position, aimPos)
        local smooth = math.max(1, S.Smooth or 1)
        cam.CFrame = smooth <= 1 and goal or cam.CFrame:Lerp(goal, 1 / smooth)
    end
end)

---------------------------------------------------------------------------
-- TAB: ESP
---------------------------------------------------------------------------
local EspTab = Window:Tab({ Title = "ESP", Icon = "eye" })

Section(EspTab, "Player ESP")
Toggle(EspTab, "EspName", "Name & Level ESP", nil, false)
Toggle(EspTab, "EspHealth", "Health ESP", nil, false)
Toggle(EspTab, "EspDistance", "Distance ESP", nil, false)
Toggle(EspTab, "EspBounty", "Bounty ESP", "Reads leaderstats Bounty/Honor", false)
Toggle(EspTab, "EspFruit", "Fruit ESP", "Reads Data.DevilFruit", false)
Toggle(EspTab, "EspWeapon", "Weapon ESP", "Shows the tool in hand", false)
Slider(EspTab, "EspMaxDist", "Max Distance", 100, 5000, 1500)

Section(EspTab, "Visual Elements & Targets")
Toggle(EspTab, "EspBox", "Box ESP", nil, false)
Dropdown(EspTab, "BoxStyle", "Box Style", { "Box", "Corner Box" }, "Corner Box")
Toggle(EspTab, "EspChams", "Chams ESP", "Highlight through walls", false)
Toggle(EspTab, "EspNPC", "NPC ESP", "Highlights workspace.Enemies", false)

Section(EspTab, "Camera & Lighting")
local defaultFOV = (workspace.CurrentCamera and workspace.CurrentCamera.FieldOfView) or 70
Slider(EspTab, "CamFOV", "Field of View", 40, 120, math.floor(defaultFOV), function(v)
    local cam = workspace.CurrentCamera
    if cam then cam.FieldOfView = v end
end)
local origLighting = {
    Brightness = Lighting.Brightness, ClockTime = Lighting.ClockTime,
    FogEnd = Lighting.FogEnd, GlobalShadows = Lighting.GlobalShadows,
}
Toggle(EspTab, "Fullbright", "Fullbright", "Bright lighting, no fog", false, function(v)
    if v then
        Lighting.Brightness = 2; Lighting.ClockTime = 14
        Lighting.FogEnd = 1e6; Lighting.GlobalShadows = false
    else
        for k, val in pairs(origLighting) do Lighting[k] = val end
    end
end)

local EspObjects = {}   -- [Instance] = { gui, label, hl, box }

local function makeBox(parent)
    local box = Instance.new("Frame")
    box.Name = "Box"
    box.BackgroundTransparency = 1
    box.Size = UDim2.fromScale(1, 1)
    box.Parent = parent
    return box
end

local function drawBoxStyle(box, style)
    for _, c in ipairs(box:GetChildren()) do c:Destroy() end
    local color = Color3.fromRGB(255, 32, 56)
    if style == "Box" then
        local s = Instance.new("UIStroke")
        s.Thickness = 1.5; s.Color = color; s.Parent = box
    else
        local function bar(px, py, sx, sy, ax, ay)
            local f = Instance.new("Frame")
            f.BackgroundColor3 = color; f.BorderSizePixel = 0
            f.AnchorPoint = Vector2.new(ax, ay)
            f.Position = UDim2.fromScale(px, py)
            f.Size = UDim2.new(sx[1], sx[2], sy[1], sy[2])
            f.Parent = box
        end
        for _, corner in ipairs({ { 0, 0, 0, 0 }, { 1, 0, 1, 0 }, { 0, 1, 0, 1 }, { 1, 1, 1, 1 } }) do
            bar(corner[1], corner[2], { 0.3, 0 }, { 0, 2 }, corner[3], corner[4])
            bar(corner[1], corner[2], { 0, 2 }, { 0.2, 0 }, corner[3], corner[4])
        end
    end
    box:SetAttribute("Style", style)
end

local function ensureEsp(char)
    local obj = EspObjects[char]
    if obj and obj.gui.Parent then return obj end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return nil end

    local gui = Instance.new("BillboardGui")
    gui.Name = "AuroraX_ESP"
    gui.Adornee = root
    gui.AlwaysOnTop = true
    gui.Size = UDim2.fromScale(4, 6)
    gui.ResetOnSpawn = false
    protect(gui)
    gui.Parent = hui

    local box = makeBox(gui)

    local label = Instance.new("TextLabel")
    label.BackgroundTransparency = 1
    label.AnchorPoint = Vector2.new(0.5, 1)
    label.Position = UDim2.new(0.5, 0, 0, -2)
    label.Size = UDim2.new(4, 0, 0, 80)
    label.TextYAlignment = Enum.TextYAlignment.Bottom
    label.Font = Enum.Font.GothamBold
    label.TextSize = 12
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextStrokeTransparency = 0.4
    label.RichText = true
    label.Text = ""
    label.Parent = gui

    local hl = Instance.new("Highlight")
    hl.Name = "AuroraX_Chams"
    hl.FillColor = Color3.fromRGB(255, 32, 56)
    hl.OutlineColor = Color3.fromRGB(255, 255, 255)
    hl.FillTransparency = 0.6
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hl.Enabled = false
    pcall(function() hl.Parent = hui end)
    hl.Adornee = char

    obj = { gui = gui, label = label, hl = hl, box = box }
    EspObjects[char] = obj
    return obj
end

local function removeEsp(char)
    local obj = EspObjects[char]
    if not obj then return end
    pcall(function() obj.gui:Destroy() end)
    pcall(function() obj.hl:Destroy() end)
    EspObjects[char] = nil
end

local function updateEsp(char, plr, isNPC)
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local mine = myRoot()
    if not root or not isAlive(char) then removeEsp(char) return end
    local dist = mine and (root.Position - mine.Position).Magnitude or 0
    local wantText = isNPC and S.EspNPC or (S.EspName or S.EspHealth or S.EspDistance or S.EspBounty or S.EspFruit or S.EspWeapon)
    local wantBox = (not isNPC) and S.EspBox
    local wantChams = isNPC and S.EspNPC or ((not isNPC) and S.EspChams)
    if dist > S.EspMaxDist or not (wantText or wantBox or wantChams) then
        local obj = EspObjects[char]
        if obj then
            obj.gui.Enabled = false
            obj.hl.Enabled = false
        end
        return
    end

    local obj = ensureEsp(char)
    if not obj then return end
    obj.gui.Enabled = true
    obj.hl.Enabled = wantChams == true
    obj.box.Visible = wantBox == true
    if wantBox and obj.box:GetAttribute("Style") ~= S.BoxStyle then
        drawBoxStyle(obj.box, S.BoxStyle)
    end

    local lines = {}
    local hum = getHumanoid(char)
    if isNPC then
        lines[#lines + 1] = char.Name
        if hum then lines[#lines + 1] = ("HP %d/%d"):format(hum.Health, hum.MaxHealth) end
        lines[#lines + 1] = ("%d studs"):format(dist)
    else
        if S.EspName then lines[#lines + 1] = ("%s [Lv %d]"):format(plr.Name, getLevel(plr)) end
        if S.EspHealth and hum then lines[#lines + 1] = ("HP %d/%d"):format(hum.Health, hum.MaxHealth) end
        if S.EspBounty then lines[#lines + 1] = "Bounty: " .. getBounty(plr) end
        if S.EspFruit then lines[#lines + 1] = "Fruit: " .. getFruit(plr) end
        if S.EspWeapon then lines[#lines + 1] = "Weapon: " .. getWeapon(char) end
        if S.EspDistance then lines[#lines + 1] = ("%d studs"):format(dist) end
    end
    obj.label.Text = table.concat(lines, "\n")
end

local espClock = 0
connect(RunService.Heartbeat, function(dt)
    if unloaded then return end
    espClock = espClock + dt
    if espClock < 0.15 then return end
    espClock = 0

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LP and plr.Character then updateEsp(plr.Character, plr, false) end
    end
    if S.EspNPC then
        local folder = enemiesFolder()
        if folder then
            for _, m in ipairs(folder:GetChildren()) do
                if m:IsA("Model") then updateEsp(m, nil, true) end
            end
        end
    end
    -- drop ESP for characters that no longer exist
    for char in pairs(EspObjects) do
        if not char.Parent then removeEsp(char) end
    end
end)

Cleanups[#Cleanups + 1] = function()
    for char in pairs(EspObjects) do removeEsp(char) end
    for k, val in pairs(origLighting) do pcall(function() Lighting[k] = val end) end
end

---------------------------------------------------------------------------
-- TAB: PvP
---------------------------------------------------------------------------
local PvpTab = Window:Tab({ Title = "PvP", Icon = "swords" })

Section(PvpTab, "Hitbox Expander")
local origSizes = {}
Toggle(PvpTab, "Hitbox", "Enable Hitbox", "Enlarges other players' HumanoidRootPart", false)
Slider(PvpTab, "HitboxSize", "Hitbox Size", 2, 40, 12)

local function restoreHitboxes()
    for part, info in pairs(origSizes) do
        if part and part.Parent then
            pcall(function()
                part.Size = info.size
                part.Transparency = info.transparency
                part.CanCollide = info.canCollide
            end)
        end
        origSizes[part] = nil
    end
end

local hbClock = 0
connect(RunService.Heartbeat, function(dt)
    if unloaded then return end
    hbClock = hbClock + dt
    if hbClock < 0.3 then return end
    hbClock = 0
    if not S.Hitbox then
        if next(origSizes) then restoreHitboxes() end
        return
    end
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LP and not (S.TeamCheck and plr.Team ~= nil and plr.Team == LP.Team) then
            local root = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
            if root then
                if not origSizes[root] then
                    origSizes[root] = { size = root.Size, transparency = root.Transparency, canCollide = root.CanCollide }
                end
                pcall(function()
                    root.Size = Vector3.new(S.HitboxSize, S.HitboxSize, S.HitboxSize)
                    root.Transparency = 0.75
                    root.CanCollide = false
                end)
            end
        end
    end
end)
Cleanups[#Cleanups + 1] = restoreHitboxes

Section(PvpTab, "Combat & Exploits")
Toggle(PvpTab, "AntiStun", "Anti Stun", "Zeroes Stun values on your character", false)
Toggle(PvpTab, "NoCooldown", "No Overheat / Cooldown", "Resets LocalOverheat & Cooldown attributes on your tool", false)

local utilClock = 0
connect(RunService.Heartbeat, function(dt)
    if unloaded then return end
    utilClock = utilClock + dt
    if utilClock < 0.1 then return end
    utilClock = 0
    local char = myChar()
    if not char then return end
    if S.AntiStun then
        local stun = char:FindFirstChild("Stun")
        if stun and (stun:IsA("NumberValue") or stun:IsA("IntValue")) and stun.Value ~= 0 then
            pcall(function() stun.Value = 0 end)
        end
    end
    if S.NoCooldown then
        local tool = char:FindFirstChildOfClass("Tool")
        if tool then
            pcall(function()
                if tool:GetAttribute("LocalOverheat") ~= nil then tool:SetAttribute("LocalOverheat", 0) end
                if tool:GetAttribute("Cooldown") ~= nil then tool:SetAttribute("Cooldown", 0) end
            end)
        end
    end
    if S.LongDash then
        pcall(function()
            char:SetAttribute("DashLength", S.DashLength)
            char:SetAttribute("DashLengthAir", S.DashLength)
        end)
    end
end)

Section(PvpTab, "Movement")
Toggle(PvpTab, "LongDash", "Long Dash", "Sets DashLength / DashLengthAir attributes", false)
Slider(PvpTab, "DashLength", "Dash Length", 50, 300, 121)
Toggle(PvpTab, "SuperJump", "Super Jump", "Launches you upward when you jump", false)
Slider(PvpTab, "JumpPower", "Super Jump Power", 50, 400, 150)

connect(UserInputService.JumpRequest, function()
    if not S.SuperJump then return end
    local root = myRoot()
    local hum = getHumanoid(myChar())
    if root and hum and hum.Health > 0 then
        pcall(function()
            root.AssemblyLinearVelocity = Vector3.new(root.AssemblyLinearVelocity.X, S.JumpPower, root.AssemblyLinearVelocity.Z)
        end)
    end
end)

-- optional on-screen Super Jump button (for mobile)
local JumpButton = Instance.new("TextButton")
JumpButton.Name = "AuroraX_SuperJumpButton"
JumpButton.Text = "SUPER JUMP"
JumpButton.Font = Enum.Font.GothamBold
JumpButton.TextSize = 11
JumpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpButton.BackgroundColor3 = Color3.fromRGB(16, 12, 18)
JumpButton.Size = UDim2.fromOffset(110, 36)
JumpButton.Position = UDim2.new(0.82, -55, 0.55, 0)
JumpButton.Visible = false
JumpButton.Active = true
JumpButton.Draggable = true
JumpButton.Parent = Overlay
do
    local c = Instance.new("UICorner"); c.CornerRadius = UDim.new(0, 10); c.Parent = JumpButton
    local s = Instance.new("UIStroke"); s.Color = Color3.fromRGB(255, 32, 56); s.Thickness = 1.4; s.Parent = JumpButton
end
JumpButton.MouseButton1Click:Connect(function()
    local root = myRoot()
    if root then
        pcall(function()
            root.AssemblyLinearVelocity = Vector3.new(root.AssemblyLinearVelocity.X, S.JumpPower, root.AssemblyLinearVelocity.Z)
        end)
    end
end)
Toggle(PvpTab, "ShowJumpButton", "Show Super Jump Button", nil, false, function(v)
    JumpButton.Visible = v
end)

---------------------------------------------------------------------------
-- TAB: Macro
---------------------------------------------------------------------------
local MacroTab = Window:Tab({ Title = "Macro", Icon = "keyboard" })

Section(MacroTab, "Aurora Smart Macro")
local macroRunning = false
local macroThread

local KEY_LIST = { "Z", "X", "C", "V", "F", "E", "R", "Q", "G" }
local WEAPONS = { "Melee", "Fruit", "Sword", "Gun" }

Toggle(MacroTab, "MacroEnabled", "Enable Smart Macro", "Master switch for the macro", false)
Toggle(MacroTab, "MacroLoop", "Loop Sequence", "Repeat the combo until stopped", false)
Toggle(MacroTab, "MacroAutoX", "Auto Start on X", "Pressing X starts the macro", false)
Dropdown(MacroTab, "MacroKey", "Macro Key (PC)", KEY_LIST, "F")

local function findTool(weaponType)
    local function scan(container)
        if not container then return nil end
        for _, t in ipairs(container:GetChildren()) do
            if t:IsA("Tool") then
                local wt = t:GetAttribute("WeaponType") or t.ToolTip
                if wt == weaponType then return t end
            end
        end
        return nil
    end
    return scan(myChar()) or scan(LP:FindFirstChildOfClass("Backpack"))
end

local function pressKey(keyName, holdTime)
    if not VIM then return false end
    local code = Enum.KeyCode[keyName]
    if not code then return false end
    local ok = pcall(function() VIM:SendKeyEvent(true, code, false, game) end)
    if not ok then return false end
    task.wait(math.max(holdTime or 0, 0.05))
    pcall(function() VIM:SendKeyEvent(false, code, false, game) end)
    return true
end

Section(MacroTab, "Combo Sequence (6 Blocks)")
local defaults = {
    { false, "Melee", "Z" }, { false, "Fruit", "X" }, { false, "Sword", "Z" },
    { true, "Melee", "C" }, { true, "Fruit", "V" }, { true, "Gun", "F" },
}
for i = 1, 6 do
    Section(MacroTab, "Block " .. i)
    Toggle(MacroTab, "Block" .. i .. "On", "Block " .. i .. " Enabled", nil, defaults[i][1])
    Dropdown(MacroTab, "B" .. i .. "Weapon", "B" .. i .. " Weapon", WEAPONS, defaults[i][2])
    Dropdown(MacroTab, "B" .. i .. "Key", "B" .. i .. " Skill Key", KEY_LIST, defaults[i][3])
    Dropdown(MacroTab, "B" .. i .. "Mode", "B" .. i .. " Cast Mode", { "Tap", "Hold" }, "Tap")
    Slider(MacroTab, "B" .. i .. "Hold", "B" .. i .. " Hold Time (s)", 0, 5, 0, nil, 0.1)
end

local function runMacro()
    if macroRunning then return end
    if not VIM then notify("Macro", "VirtualInputManager is not available here") return end
    macroRunning = true
    macroThread = task.spawn(function()
        repeat
            for i = 1, 6 do
                if not macroRunning or unloaded then break end
                if S["Block" .. i .. "On"] then
                    local tool = findTool(S["B" .. i .. "Weapon"])
                    local hum = getHumanoid(myChar())
                    if tool and hum then
                        pcall(function() hum:EquipTool(tool) end)
                        task.wait(0.15)
                    end
                    local hold = S["B" .. i .. "Mode"] == "Hold" and S["B" .. i .. "Hold"] or 0
                    pressKey(S["B" .. i .. "Key"], hold)
                    task.wait(0.12)
                end
            end
        until not (macroRunning and S.MacroLoop) or unloaded
        macroRunning = false
    end)
end

local function stopMacro()
    macroRunning = false
end

Button(MacroTab, "Start / Stop Macro", "Same as pressing the macro key", function()
    if macroRunning then stopMacro() else runMacro() end
end)

connect(UserInputService.InputBegan, function(input, processed)
    if processed or unloaded or input.UserInputType ~= Enum.UserInputType.Keyboard then return end
    if S.MacroEnabled and input.KeyCode.Name == S.MacroKey then
        if macroRunning then stopMacro() else runMacro() end
    elseif S.MacroEnabled and S.MacroAutoX and input.KeyCode == Enum.KeyCode.X then
        runMacro()
    end
end)
Cleanups[#Cleanups + 1] = stopMacro

---------------------------------------------------------------------------
-- TAB: Players
---------------------------------------------------------------------------
local PlayersTab = Window:Tab({ Title = "Players", Icon = "users" })
Section(PlayersTab, "Server Players")

local selectedPlayer = playerNames()[1]
local plrDrop = Dropdown(PlayersTab, "PlayerPick", "Select Player", playerNames(), selectedPlayer, function(v)
    selectedPlayer = v
end)

local function refreshPlayers()
    local names = playerNames()
    if plrDrop then pcall(function() plrDrop:Refresh(names) end) end
    if blDrop then pcall(function() blDrop:Refresh(names) end) end
end
connect(Players.PlayerAdded, refreshPlayers)
connect(Players.PlayerRemoving, function() task.delay(0.2, refreshPlayers) end)

local function selectedTarget()
    local p = selectedPlayer and Players:FindFirstChild(selectedPlayer)
    if p and p:IsA("Player") then return p end
    return nil
end

Button(PlayersTab, "Teleport to Player", nil, function()
    local p = selectedTarget()
    local root = p and p.Character and p.Character:FindFirstChild("HumanoidRootPart")
    local mine = myRoot()
    if root and mine then
        mine.CFrame = root.CFrame * CFrame.new(0, 0, 3)
    else
        notify("Players", "Target or your character is not available")
    end
end)

Toggle(PlayersTab, "Spectate", "Spectate Player", nil, false, function(v)
    local cam = workspace.CurrentCamera
    if not cam then return end
    if v then
        local p = selectedTarget()
        local hum = p and getHumanoid(p.Character)
        if hum then cam.CameraSubject = hum else notify("Players", "Nothing to spectate") end
    else
        local hum = getHumanoid(myChar())
        if hum then cam.CameraSubject = hum end
    end
end)

Section(PlayersTab, "Server")
Button(PlayersTab, "Copy Job ID", nil, function()
    if setClip(game.JobId) then notify("Server", "Job ID copied") else notify("Server", "setclipboard unsupported") end
end)
Button(PlayersTab, "Rejoin Server", nil, function()
    local ok = pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LP) end)
    if not ok then notify("Server", "Teleport failed") end
end)

---------------------------------------------------------------------------
-- TAB: Configs
---------------------------------------------------------------------------
local CfgTab = Window:Tab({ Title = "Configs", Icon = "save" })
Section(CfgTab, "Configuration")
local FOLDER = "AuroraX"
local slot = "Slot 1"
Dropdown(CfgTab, "_Slot", "Config Slot", { "Slot 1", "Slot 2", "Slot 3", "Slot 4", "Slot 5" }, "Slot 1", function(v)
    slot = v
end)

local function slotPath(name) return FOLDER .. "/" .. name:gsub(" ", "_") .. ".json" end

local function saveConfig(name)
    if not canFiles() then notify("Configs", "This executor has no file support") return false end
    makeFolder(FOLDER)
    local data = {}
    for k, v in pairs(S) do
        local t = type(v)
        if k:sub(1, 1) ~= "_" and (t == "boolean" or t == "number" or t == "string") then data[k] = v end
    end
    local ok = pcall(function() writefile(slotPath(name), HttpService:JSONEncode(data)) end)
    return ok
end

local function loadConfig(name)
    if not canFiles() then notify("Configs", "This executor has no file support") return false end
    local path = slotPath(name)
    if not fileExists(path) then notify("Configs", name .. " does not exist yet") return false end
    local ok, data = pcall(function() return HttpService:JSONDecode(readfile(path)) end)
    if not ok or type(data) ~= "table" then notify("Configs", "Config file is corrupted") return false end
    for k, v in pairs(data) do
        S[k] = v
        local el = Elements[k]
        if el and type(el.Set) == "function" then pcall(function() el:Set(v) end) end
    end
    return true
end

Button(CfgTab, "Save Config", "Writes the current settings to the selected slot", function()
    if saveConfig(slot) then notify("Configs", slot .. " saved") else notify("Configs", "Could not save " .. slot) end
end)
Button(CfgTab, "Load Config", nil, function()
    if loadConfig(slot) then notify("Configs", slot .. " loaded") end
end)
Button(CfgTab, "Set as Autoload", "Loads this slot automatically next time", function()
    if not canFiles() then notify("Configs", "This executor has no file support") return end
    makeFolder(FOLDER)
    local ok = pcall(function() writefile(FOLDER .. "/autoload.txt", slot) end)
    notify("Configs", ok and (slot .. " set as autoload") or "Could not write autoload")
end)

---------------------------------------------------------------------------
-- TAB: Settings
---------------------------------------------------------------------------
local SetTab = Window:Tab({ Title = "Settings", Icon = "settings" })
Section(SetTab, "Interface")
pcall(function()
    local names = {}
    for name in pairs(WindUI:GetThemes()) do names[#names + 1] = name end
    table.sort(names)
    SetTab:Dropdown({
        Title = "Theme", Values = names, Value = "Dark",
        Callback = function(v) pcall(function() WindUI:SetTheme(v) end) end,
    })
end)
Section(SetTab, "Script")
local function unload()
    if unloaded then return end
    unloaded = true
    macroRunning = false
    for _, fn in ipairs(Cleanups) do pcall(fn) end
    for _, c in ipairs(Connections) do pcall(function() c:Disconnect() end) end
    pcall(function() Overlay:Destroy() end)
    pcall(function()
        local cam = workspace.CurrentCamera
        local hum = getHumanoid(myChar())
        if cam and hum then cam.CameraSubject = hum end
    end)
    pcall(function() Window:Destroy() end)
    Env.AuroraXHub_Unload = nil
end
Env.AuroraXHub_Unload = unload
Button(SetTab, "Unload AuroraX", "Removes the hub and stops every feature", unload)

---------------------------------------------------------------------------
-- Finish
---------------------------------------------------------------------------
pcall(function() Window:SelectTab(1) end)

if canFiles() and fileExists(FOLDER .. "/autoload.txt") then
    local ok, name = pcall(readfile, FOLDER .. "/autoload.txt")
    if ok and type(name) == "string" then
        name = name:gsub("%s+$", "")
        task.delay(0.5, function() loadConfig(name) end)
    end
end

notify("Pinky Modz by Ian", "AuroraX loaded. Press RightShift to hide / show.", 4)
