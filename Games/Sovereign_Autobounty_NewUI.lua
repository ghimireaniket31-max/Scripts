-- Sovereign Autobounty | discord.gg/uUGJbNNJSg
repeat task.wait() until game:IsLoaded() and game:GetService("Players").LocalPlayer
if _G.SOVEREIGN_autobounty_Loaded then
	return
end

_G.SOVEREIGN_autobounty_Loaded = true
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local VirtualInputManager = game:GetService("VirtualInputManager")
local VirtualUser = game:GetService("VirtualUser")
local CommF = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
local CommE = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommE")

local LocalPlayer = Players.LocalPlayer
local Net = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net")

local function T(text)
    return text
end

if getgenv and getgenv().AutoBountyMainLoaded and getgenv().AutoBountyMainReady then
    return
end
if getgenv then
    getgenv().AutoBountyMainLoaded = true
end

local LastCaughtError = nil

local function SafeCall(fn, ...)
    local ok, err = pcall(fn, ...)
    if not ok then
        LastCaughtError = tostring(err)
    end
    return ok, err
end

local SaveConfig
local ConfigLoading = true

local InjectedConfig = (function()
    local env = getgenv and getgenv()
    local cfg = env and env.Config
    if type(cfg) ~= "table" then return nil end
    return cfg
end)()
-- UI: Sovereign UI (tabs > sub tabs > groupboxes)
local LOGO_ID = "rbxassetid://140460622905781"

local UIKit = {}

function UIKit.Method(obj, ...)
    if type(obj) ~= "table" then return nil end
    for _, name in ipairs({ ... }) do
        local fn = obj[name]
        if type(fn) == "function" then return fn end
    end
    return nil
end

local Library
do
    local okLib, lib = pcall(function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/ghimireaniket31-max/Scripts/refs/heads/main/Library/newui"))()
    end)
    if okLib and type(lib) == "table" then
        Library = lib
    else
        warn("[Auto Bounty] Could not load the UI library: " .. tostring(lib))
    end
end

local Window
do
    local createWindow = UIKit.Method(Library, "CreateWindow", "Window")
    if createWindow then
        local okWindow, result = pcall(createWindow, Library, {
            Name = "Sovereign Autobounty",
            LoadingSubtitle = "discord.gg/uUGJbNNJSg",
            Icon = LOGO_ID,
            Theme = "Sovereign Red",
            Size = UDim2.fromOffset(720, 520),
            Transparent = true,
            Background = LOGO_ID,
            BackgroundTransparency = 0.55,
            Home = false,
            Backdrop = false,
            ToggleButton = false,
            OpenButton = { Title = "Sovereign Autobounty", Icon = LOGO_ID },
            UnsupportedExecutor = false,
            Loading = { Enabled = true, Title = "Sovereign Autobounty", Text = "Starting", Duration = 1.2 }
        })
        if okWindow and type(result) == "table" then
            Window = result
        else
            warn("[Auto Bounty] Window creation failed: " .. tostring(result))
        end
    end
end

if not Window then
    _G.SOVEREIGN_autobounty_Loaded = nil
    if getgenv then
        getgenv().AutoBountyMainLoaded = nil
        getgenv().AutoBountyMainReady = nil
    end
    warn("[Auto Bounty] The UI library returned no usable window API")
    return
end

local UI = {}

local Tabs = {}
do
    local createTab = UIKit.Method(Window, "CreateTab", "Tab")
    if not createTab then
        error("[Auto Bounty] The UI library has no CreateTab API", 0)
    end
    local function MakeTab(key, name, icon, desc)
        Tabs[key] = createTab(Window, { Name = name, Icon = icon, Desc = desc })
    end
    MakeTab("Discord", "Discord", "message-circle", "Community and support")
    MakeTab("Bounty", "Auto Bounty", "target", "Hunt players for bounty")
    MakeTab("Skills", "Skill Config", "sparkles", "Skills and charge times per weapon")
    MakeTab("Attacks", "Combat Settings", "swords", "Attack modes and combat helpers")
    MakeTab("ESP", "ESP", "eye", "Player overlays")
    MakeTab("Server", "Server", "globe", "Server hopping")
    MakeTab("Settings", "Settings", "settings", "Performance and config")
end

-- Every Toggle / Slider / Dropdown / Button callback also triggers an auto save.
-- Applied to each sub tab / groupbox that holds widgets (see UIKit.Box).
UIKit.WidgetMethods = { "Toggle", "Slider", "Dropdown", "Button" }
UIKit.Wrapped = setmetatable({}, { __mode = "k" })

function UIKit.Wrap(container)
    if type(container) ~= "table" or UIKit.Wrapped[container] then return container end
    UIKit.Wrapped[container] = true
    for _, name in ipairs(UIKit.WidgetMethods) do
        local original = container[name]
        if type(original) == "function" then
            container[name] = function(self, config, ...)
                if type(config) ~= "table" then
                    return original(self, config, ...)
                end
                local callback = config.Callback
                local creating = false
                if name == "Toggle" and type(callback) == "function" then
                    -- the library runs a toggle's callback once on creation when it starts on; skip that run
                    creating = true
                    local inner = callback
                    callback = function(...)
                        if creating then return end
                        return inner(...)
                    end
                end
                if type(callback) == "function" and config.AutoSave ~= false then
                    local userCallback = callback
                    config.Callback = function(...)
                        local results = table.pack(pcall(userCallback, ...))
                        local ok, err = results[1], results[2]
                        if not ok then
                            LastCaughtError = "Widget callback error: " .. tostring(err)
                        end
                        if not ConfigLoading and SaveConfig then
                            SaveConfig(true)
                        end
                        if not ok then error(err, 0) end
                        return table.unpack(results, 2, results.n)
                    end
                else
                    config.Callback = callback
                end
                local handle = original(self, config, ...)
                creating = false
                return handle
            end
        end
    end
    return container
end

-- Sub tab = pill row under the page title. Falls back to the tab itself if the library has none.
function UIKit.Sub(tab, name, icon)
    local make = UIKit.Method(tab, "CreateSubTab", "SubTab", "AddSubTab")
    if make then
        local ok, result = pcall(make, tab, { Name = name, Icon = icon })
        if ok and type(result) == "table" then return result end
    end
    return tab
end

-- Groupbox = titled card that holds the widgets. Falls back to a section heading.
function UIKit.Box(parent, name, icon)
    local box
    local make = UIKit.Method(parent, "CreateGroupbox", "Groupbox", "AddGroupbox")
    if make then
        local ok, result = pcall(make, parent, { Name = name, Icon = icon })
        if ok and type(result) == "table" then box = result end
    end
    if not box then
        local section = UIKit.Method(parent, "CreateSection", "Section")
        if section then pcall(section, parent, name) end
        box = parent
    end
    return UIKit.Wrap(box)
end

ConfigLoading = true

-- Sub categories: every feature lives in a groupbox, big tabs are split into sub tabs.
local Boxes = {}
do
    local Sub, Box = UIKit.Sub, UIKit.Box

    Boxes.Community = Box(Tabs.Discord, "Community", "users")

    local bountyTab = Sub(Tabs.Bounty, "Bounty", "crosshair")
    Boxes.Hunt = Box(bountyTab, "Auto Bounty", "target")
    Boxes.Targeting = Box(bountyTab, "Targeting", "timer")
    local loadoutTab = Sub(Tabs.Bounty, "Loadout", "backpack")
    Boxes.Team = Box(loadoutTab, "Team", "flag")
    Boxes.Weapon = Box(loadoutTab, "Weapon", "sword")

    local skillTabs = {
        { "Melee", "hand" }, { "Sword", "sword" }, { "Fruit", "apple" }, { "Gun", "crosshair" }
    }
    for _, info in ipairs(skillTabs) do
        local skillTab = Sub(Tabs.Skills, info[1], info[2])
        Boxes["Skills" .. info[1]] = Box(skillTab, "Skills", "list-checks")
        Boxes["Charge" .. info[1]] = Box(skillTab, "Charge Time", "timer")
    end

    local attackTab = Sub(Tabs.Attacks, "Attacks", "swords")
    Boxes.FastAttack = Box(attackTab, "Fast Attack", "zap")
    Boxes.OneShot = Box(attackTab, "One Shot", "crosshair")
    local assistTab = Sub(Tabs.Attacks, "Assist", "shield")
    Boxes.Assist = Box(assistTab, "Combat Assist", "shield-check")
    Boxes.Flee = Box(assistTab, "Auto Flee", "heart-pulse")

    Boxes.ESPMain = Box(Tabs.ESP, "ESP", "eye")
    Boxes.ESPLabels = Box(Tabs.ESP, "Labels", "tag")
    Boxes.ESPStyle = Box(Tabs.ESP, "Style", "type")

    Boxes.Hop = Box(Tabs.Server, "Server Hop", "server")
    Boxes.ServerInfo = Box(Tabs.Server, "Current Server", "info")

    Boxes.Performance = Box(Tabs.Settings, "Performance", "gauge")
    Boxes.Config = Box(Tabs.Settings, "Config", "save")
end

local Settings = {
    AutoBounty = false,
    MeleeSkills = { "Z", "X", "C" },
    SwordSkills = { "Z", "X" },
    FruitSkills = { "X" },
    GunSkills = { "Z", "X" },
    V4Only = { Melee = false, Sword = false, ["Blox Fruit"] = false, Gun = false },
    FPSBoost = false,
    WaterWalk = true,
    Hold = {
        Melee = { Z = 0.1, X = 0.1, C = 0.1, V = 0.1, F = 0.1 },
        Sword = { Z = 0.1, X = 0.1, C = 0.1, V = 0.1, F = 0.1 },
        ["Blox Fruit"] = { Z = 0.1, X = 0.1, C = 0.1, V = 0.1, F = 0.1 },
        Gun = { Z = 0.1, X = 0.1, C = 0.1, V = 0.1, F = 0.1 }
    },
    FastAttack = false,
    FruitM1 = false,
    Dragonstorm = false,
    VoidFruitM1 = false,
    OneShotKitsune = false,
    OneShotTRex = false,
    OneShotDragon = false,
    OneShotDelay = "0.15s (Default)",
    AutoHaki = true,
    AutoKen = true,
    AutoV3 = true,
    AutoSoru = false,
    AutoEnablePVP = true,
    AutoFlee = false,
    AutoFleeHP = 30,
    ESP = false,
    ESP_ShowName = true,
    ESP_ShowLevel = true,
    ESP_ShowHealth = true,
    ESP_ShowDistance = true,
    ESP_ShowPVP = true,
    ESP_FontSize = 14,
    LockTime = 90,
    HoldWeapon = "Melee",
    ServerRegion = "Singapore",
    HopPlayerRange = "1-12",
    HopBountyRange = "> 3M",
    AutoLoadConfig = true,
    AutoSaveConfig = true,
    SelectTeam = "Pirates",
    MaxStaySeconds = 360,
    ConfigVersion = 2
}

local INTERNAL_CONFIG_KEYS = {
    BountyBase = true,
    AutoBountyBountyBase = true,
    AutoBountyEarned = true,
    AutoBountyRunTime = true
}

local OBSOLETE_CONFIG_KEYS = {
    LockCounts = true,
    Blacklist = true,
    FastAttackMode = true,
    FastAttackMobs = true,
    FastAttackPlayers = true
}

local function IsSkippedConfigKey(key)
    return INTERNAL_CONFIG_KEYS[key] or OBSOLETE_CONFIG_KEYS[key]
end

local function ApplyConfigTable(data)
    if type(data) ~= "table" then return false end
    for key, value in pairs(data) do
        if key ~= "Hold" and key ~= "V4Only" and not IsSkippedConfigKey(key) then
            Settings[key] = value
        end
    end
    if type(data.V4Only) == "table" then
        for tip in pairs(Settings.V4Only) do
            if type(data.V4Only[tip]) == "boolean" then Settings.V4Only[tip] = data.V4Only[tip] end
        end
    end
    if type(data.Hold) == "table" then
        for weaponTip, holds in pairs(data.Hold) do
            if type(holds) == "table" and Settings.Hold[weaponTip] then
                for key, value in pairs(holds) do
                    if Settings.Hold[weaponTip][key] ~= nil and tonumber(value) then
                        Settings.Hold[weaponTip][key] = math.clamp(math.floor(tonumber(value) * 10 + 0.5) / 10, 0.1, 1)
                    end
                end
            end
        end
    end
    return true
end

ApplyConfigTable(InjectedConfig)

local TeamConfigReady = false

local function ApplyTeam(team)
    if not TeamConfigReady or not team or team == "" then return end
    local cur = LocalPlayer.Team
    if cur and cur.Name == team then return end
    pcall(function() CommF:InvokeServer("SetTeam", team) end)
    pcall(function() CommF:InvokeServer("SetTeam2", team) end)
end

do
    task.spawn(function()
        local configWait = tick() + 30
        while not TeamConfigReady and tick() < configWait do
            task.wait(0.05)
        end
        TeamConfigReady = true

        local deadline = tick() + 20
        local nextTry = 0
        while tick() < deadline do
            local team = LocalPlayer.Team
            if team and team.Name == Settings.SelectTeam then break end
            if tick() >= nextTry then
                SafeCall(ApplyTeam, Settings.SelectTeam)
                nextTry = tick() + 1.5
            end
            task.wait(0.2)
        end
    end)
end

local CurrentTarget = nil
local CurrentTargetRoot = nil
local ChaseActive = false
local ChaseConnection = nil
local ActiveTween = nil
local ChaseSample = nil
local Random = Random.new()

local TargetLockStart = 0
local TargetInvalidSince = nil
local TempSkipUntil = {}
local NextWoundedCheck = 0
local OffsetAngle = Random:NextNumber(0, math.pi * 2)
local NextOffsetRefresh = 0
local FleeActive = false
local SoruLastTime = 0

local NextTargetSwitch = 0
local TargetLostTime = 0
local LastScanTime = 0

local Stay = {
    Combat = {},
    Enter = tick(),
    Armed = false,
    Limit = function(self)
        local v = tonumber(Settings.MaxStaySeconds) or 360
        if v < 60 then v = 60 end
        return v
    end,
    Elapsed = function(self)
        return tick() - self.Enter
    end,
    Reached = function(self)
        if not Settings.AutoBounty then return false end
        return self:Elapsed() >= self:Limit()
    end
}

-- Visual changes are queued and reversible; no collision, hitboxes or remotes are removed.
do
    local Boost = {
        Enabled = false, Saved = setmetatable({}, { __mode = "k" }),
        Queue = {}, Head = 1, Tail = 0, Seen = setmetatable({}, { __mode = "k" }),
        Lighting = game:GetService("Lighting"), FlagName = "RemoteEventSingleInvocationSizeLimit"
    }
    Stay.Performance = Boost
    function Boost:Write(obj, property, value)
        pcall(function()
            local old = obj[property]
            if old == value then return end
            local saved = self.Saved[obj]
            if not saved then saved = {}; self.Saved[obj] = saved end
            if not saved[property] then saved[property] = { Original = old } end
            saved[property].Applied = value
            obj[property] = value
        end)
    end
    function Boost:Protected(obj)
        local characters = Workspace:FindFirstChild("Characters")
        local cursor = obj
        while cursor and cursor ~= Workspace and cursor ~= self.Lighting do
            if cursor == Workspace.CurrentCamera or cursor == characters
                or cursor:IsA("Tool") or cursor:IsA("GuiBase2d")
                or (cursor:IsA("Model") and cursor:FindFirstChildOfClass("Humanoid")) then return true end
            cursor = cursor.Parent
        end
        return false
    end
    function Boost:Apply(obj)
        if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam")
            or obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("Sparkles") then
            if not obj.Parent or obj.Parent.Name ~= "ElectricFire" then self:Write(obj, "Enabled", false) end
        elseif obj:IsA("PostEffect") then
            self:Write(obj, "Enabled", false)
        elseif obj:IsA("BasePart") then
            self:Write(obj, "CastShadow", false)
            local map = Workspace:FindFirstChild("Map")
            if map and obj:IsDescendantOf(map) then
                self:Write(obj, "Material", Enum.Material.SmoothPlastic)
                self:Write(obj, "Reflectance", 0)
            end
        elseif obj:IsA("Decal") or obj:IsA("Texture") then
            local map = Workspace:FindFirstChild("Map")
            if map and obj:IsDescendantOf(map) then self:Write(obj, "Transparency", 1) end
        end
    end
    function Boost:Push(obj, walk)
        self.Tail = self.Tail + 1
        self.Queue[self.Tail] = { Object = obj, Walk = walk }
    end
    function Boost:Drain()
        local began, count = os.clock(), 0
        while self.Head <= self.Tail and count < 100 and os.clock() - began < 0.003 do
            local item = self.Queue[self.Head]
            self.Queue[self.Head] = nil
            self.Head = self.Head + 1
            count = count + 1
            local obj = item.Object
            if self.Enabled then
                if obj.Parent and not self.Seen[obj] and not self:Protected(obj) then
                    self.Seen[obj] = true
                    pcall(self.Apply, self, obj)
                    if item.Walk then
                        for _, child in ipairs(obj:GetChildren()) do self:Push(child, true) end
                    end
                end
            else
                local saved = self.Saved[obj]
                if saved then
                    for property, record in pairs(saved) do
                        pcall(function()
                            if obj[property] == record.Applied then obj[property] = record.Original end
                        end)
                    end
                    self.Saved[obj] = nil
                end
            end
        end
        if self.Head > self.Tail then
            self.Queue, self.Head, self.Tail = {}, 1, 0
            if not self.Enabled and self.Worker then self.Worker:Disconnect(); self.Worker = nil end
        end
    end
    function Boost:SetEnabled(value)
        value = value == true
        if self.Enabled == value then return end
        self.Enabled = value
        if self.WorldAdded then self.WorldAdded:Disconnect(); self.WorldAdded = nil end
        if self.LightAdded then self.LightAdded:Disconnect(); self.LightAdded = nil end
        self.Queue, self.Head, self.Tail = {}, 1, 0
        self.Seen = setmetatable({}, { __mode = "k" })
        if value then
            if not self.FlagApplied and type(setfflag) == "function" then
                if type(getfflag) == "function" then
                    local ok, old = pcall(getfflag, self.FlagName)
                    if ok and old ~= nil then self.FlagOriginal = tostring(old) end
                end
                self.FlagApplied = pcall(setfflag, self.FlagName, "1500")
            end
            self:Write(self.Lighting, "GlobalShadows", false)
            local terrain = Workspace:FindFirstChildOfClass("Terrain")
            if terrain then
                self:Write(terrain, "WaterWaveSize", 0)
                self:Write(terrain, "WaterWaveSpeed", 0)
                self:Write(terrain, "WaterReflectance", 0)
            end
            pcall(function() self:Write(settings().Rendering, "QualityLevel", Enum.QualityLevel.Level01) end)
            self:Push(Workspace, true)
            self:Push(self.Lighting, true)
            self.WorldAdded = Workspace.DescendantAdded:Connect(function(obj) self:Push(obj, false) end)
            self.LightAdded = self.Lighting.DescendantAdded:Connect(function(obj) self:Push(obj, false) end)
        else
            for obj in pairs(self.Saved) do self:Push(obj, false) end
            if self.FlagApplied then
                if self.FlagOriginal and type(setfflag) == "function" then
                    if pcall(setfflag, self.FlagName, self.FlagOriginal) then self.FlagApplied = false end
                else
                    warn("[FPS Boost] " .. "Restoring visuals; the original flag is unavailable, rejoin to reset it")
                end
            end
        end
        if not self.Worker then
            self.Worker = RunService.Heartbeat:Connect(function() SafeCall(self.Drain, self) end)
        end
    end
end

local WeaponLockUntil = 0
local SkillLoopThread = nil

local Aim = {
    Pos = nil,
    Part = nil,
    Position = nil,
    MouseHookInstalled = false,
    GameHookReady = false,
    MouseMod = nil,
    MouseStore = nil,
    MouseMT = nil,
    MouseGame = nil
}

pcall(function()
    for _, conn in pairs(getconnections(LocalPlayer.Idled)) do
        conn:Disable()
    end
end)
LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

local function GetHRP(plr)
    plr = plr or LocalPlayer
    local char = plr and plr.Character
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function GetHumanoid(plr)
    plr = plr or LocalPlayer
    local char = plr and plr.Character
    return char and char:FindFirstChildOfClass("Humanoid")
end

-- Keep only the current engagement when crossing a safe-zone boundary.
function Stay:UpdateEngagement(plr)
    local char = plr and plr.Character
    local ownChar = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local ownHum = ownChar and ownChar:FindFirstChildOfClass("Humanoid")
    local root, ownRoot = GetHRP(plr), GetHRP(LocalPlayer)
    local fight = self.Combat
    if fight.Player ~= plr or fight.Character ~= char or fight.OwnCharacter ~= ownChar then
        fight = { Player = plr, Character = char, OwnCharacter = ownChar }
        self.Combat = fight
    end
    if not hum or not ownHum or hum.Health <= 0 or ownHum.Health <= 0 then
        fight.Engaged = false
        return
    end
    local pg = LocalPlayer:FindFirstChild("PlayerGui")
    local main = pg and pg:FindFirstChild("Main")
    local hud = main and main:FindFirstChild("BottomHUDList")
    local combatUI = hud and hud:FindFirstChild("InCombat")
    local inCombat = ownChar:GetAttribute("InCombat") == true or (combatUI and combatUI.Visible == true)
    if not inCombat then
        fight.Engaged = false
    elseif root and ownRoot and (root.Position - ownRoot.Position).Magnitude <= 150 then
        -- HUD alone may describe fighting somebody else: require target combat or observed damage.
        if char:GetAttribute("InCombat") == true
            or (fight.Health and hum.Health < fight.Health)
            or (fight.OwnHealth and ownHum.Health < fight.OwnHealth) then
            fight.Engaged = true
        end
    end
    fight.Health, fight.OwnHealth = hum.Health, ownHum.Health
end

local function EquipTool(tool)
    local hum = GetHumanoid(LocalPlayer)
    if not hum or hum.Sit or not tool then return false end
    if tool.Parent ~= LocalPlayer.Character then
        pcall(function() hum:EquipTool(tool) end)
        task.wait(0.05)
    end
    local equipped = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
    return equipped == tool
end

local function FindWeaponTool(weaponTip)
    local function scan(container)
        if not container then return nil end
        for _, item in ipairs(container:GetChildren()) do
            if item:IsA("Tool") and item.ToolTip == weaponTip then
                return item
            end
        end
        return nil
    end
    return scan(LocalPlayer.Character) or scan(LocalPlayer:FindFirstChild("Backpack"))
end

local function LockWeapon(owner, duration)
    local now = tick()
    WeaponLockUntil = math.max(WeaponLockUntil, now + duration)
end

local function IsWeaponLocked()
    return tick() < WeaponLockUntil
end

local SafeZonePositions = {
    World1 = {
        { pos = Vector3.new(-3000, 250, 2057), radius = 700 },
        { pos = Vector3.new(1101, 16, 1446), radius = 400 }
    },
    World2 = {
        { pos = Vector3.new(-12, 29, 2840), radius = 200 },
        { pos = Vector3.new(-376, 149, 307), radius = 150 },
        { pos = Vector3.new(-6437, 306, -4730), radius = 150 }
    },
    World3 = {
        { pos = Vector3.new(-338, 21, 5539), radius = 200 },
        { pos = Vector3.new(-12550, 337, -7506), radius = 400 },
        { pos = Vector3.new(-5046, 315, -2993), radius = 300 },
        { pos = Vector3.new(-16228, 9, 443), radius = 300 },
        { pos = Vector3.new(28695, 14959, -81), radius = 10000 },
        { pos = Vector3.new(9637, -1989, 9618), radius = 10000 }
    }
}

local function GetSafeZones()
    if game.PlaceId == 2753915549 or game.PlaceId == 85211729168715 then
        return SafeZonePositions.World1
    elseif game.PlaceId == 4442272183 or game.PlaceId == 79091703265657 then
        return SafeZonePositions.World2
    elseif game.PlaceId == 7449423635 or game.PlaceId == 100117331123089 then
        return SafeZonePositions.World3
    end
    return nil
end

local function IsInSafeZone(plr)
    if not plr or not plr.Character then return false end
    local char = plr.Character
    if char:FindFirstChild("TempSafeZone") then return true end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    local origin = Workspace:FindFirstChild("_WorldOrigin")
    local liveZones = origin and origin:FindFirstChild("SafeZones")
    if liveZones then
        local pos = hrp.Position
        for _, zone in ipairs(liveZones:GetChildren()) do
            if zone:IsA("BasePart") then
                local mesh = zone:FindFirstChildOfClass("SpecialMesh")
                local radius = mesh and (mesh.Scale.X * 0.5) or (zone.Size.X * 0.5)
                if (zone.Position - pos).Magnitude <= radius then
                    return true
                end
            end
        end
    end
    local zones = GetSafeZones()
    if not zones then return false end
    local pos = hrp.Position
    for _, zone in ipairs(zones) do
        if (pos - zone.pos).Magnitude <= zone.radius then
            return true
        end
    end
    return false
end

local function IsPVPDisabled(plr)
    if not plr then return true end
    if plr:GetAttribute("PvpDisabled") == true then return true end
    return false
end

local function IsInFriendlyPvp(plr)
    if not plr then return false end
    local session = plr:FindFirstChild("PvpSessionComponent", true)
        or (plr.Character and plr.Character:FindFirstChild("PvpSessionComponent", true))
    if not session then return false end
    local pointer = session:FindFirstChild("pvpArenaPointer")
    -- Any bound arena session is excluded, regardless of team/player count or match phase.
    return pointer ~= nil and pointer.Value ~= nil
end

local function IsPVPEnabled(plr)
    if not plr then return false end
    return plr:GetAttribute("PvpDisabled") ~= true
end

local function GetLevel(plr)
    if not plr then return nil end
    local obj = (plr:FindFirstChild("Data") and plr.Data:FindFirstChild("Level"))
        or (plr:FindFirstChild("leaderstats") and plr.leaderstats:FindFirstChild("Level"))
    return obj and tonumber(obj.Value) or nil
end

local function EvaluateTarget(plr)
    if not plr or plr == LocalPlayer then return false, "self" end
    local char = plr.Character
    if not char then return false, "no_character" end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum then return false, "missing_parts" end
    if hum.Health <= 0 then return false, "dead" end
    if hrp.Position.Y < -100 then return false, "too_low" end
    if IsInFriendlyPvp(plr) then return false, "friendly_pvp" end
    if IsInSafeZone(plr) and not (plr == CurrentTarget and Stay.Combat.Engaged
        and Stay.Combat.Player == plr and Stay.Combat.Character == char
        and Stay.Combat.OwnCharacter == LocalPlayer.Character) then return false, "safe_zone" end
    if IsPVPDisabled(plr) then return false, "pvp_disabled" end
    local myTeam = LocalPlayer.Team
    local tgTeam = plr.Team
    if myTeam and tgTeam and myTeam.Name == "Marines" and tgTeam.Name == "Marines" then
        return false, "same_team"
    end
    local myLv = GetLevel(LocalPlayer)
    local tgLv = GetLevel(plr)
    if myLv and tgLv and math.abs(myLv - tgLv) > 700 then return false, "level_gap" end
    local myHRP = GetHRP(LocalPlayer)
    if not myHRP then return false, "no_local_hrp" end
    if (hrp.Position - myHRP.Position).Magnitude > 30000 then return false, "too_far" end
    return true, nil
end

local TARGET_SKIP_TIME = 30

-- remembers players we got low on health, so they are not forgotten when they escape and come back
local Wounded = {}
local WOUNDED_MEMORY = 180
local WOUNDED_HP = 0.5
local function IsWounded(plr)
    local w = plr and Wounded[plr]
    if not w then return false end
    if tick() - w.Time > WOUNDED_MEMORY or not plr:IsDescendantOf(Players) then
        Wounded[plr] = nil
        return false
    end
    return true
end

local LockGuard = {
    Counts = {},
    Blacklist = {},
    Last = {}
}

do
    local MAX_LOCKS_PER_PLAYER = 3

    local function PlayerKey(plr)
        local id = plr and plr.UserId
        if id and id ~= 0 then return tostring(id) end
        return plr and plr.Name or "?"
    end

    function LockGuard.GetCount(plr)
        return tonumber(LockGuard.Counts[PlayerKey(plr)]) or 0
    end

    local LOCK_FORGET_TIME = 120

    local function Decay(plr)
        local key = PlayerKey(plr)
        local last = LockGuard.Last[key]
        if last and tick() - last > LOCK_FORGET_TIME then
            LockGuard.Counts[key] = nil
            LockGuard.Blacklist[key] = nil
            LockGuard.Last[key] = nil
        end
    end

    function LockGuard.IsBlacklisted(plr)
        if IsWounded(plr) then return false end
        Decay(plr)
        return LockGuard.Blacklist[PlayerKey(plr)] ~= nil
    end

    function LockGuard.RegisterLock(plr)
        if not plr then return end
        Decay(plr)
        local key = PlayerKey(plr)
        LockGuard.Last[key] = tick()
        local n = LockGuard.GetCount(plr) + 1
        LockGuard.Counts[key] = n
        if n >= MAX_LOCKS_PER_PLAYER then
            LockGuard.Blacklist[key] = plr.Name
        end
    end

    function LockGuard.IsLockedOut(plr)
        if IsWounded(plr) then return false end
        Decay(plr)
        if LockGuard.IsBlacklisted(plr) then return true end
        return LockGuard.GetCount(plr) >= MAX_LOCKS_PER_PLAYER
    end
end

local function GetNearestTarget()
    local myHRP = GetHRP(LocalPlayer)
    if not myHRP then return nil, math.huge end
    local best, bestDist = nil, math.huge
    local now = tick()
    for _, plr in ipairs(Players:GetPlayers()) do
        if TempSkipUntil[plr] and now >= TempSkipUntil[plr] then
            TempSkipUntil[plr] = nil
        end
        local wounded = IsWounded(plr)
        if (wounded or not TempSkipUntil[plr]) and not LockGuard.IsLockedOut(plr) then
            local ok = select(1, EvaluateTarget(plr))
            if ok then
                local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                local dist = (hrp.Position - myHRP.Position).Magnitude
                local score = wounded and dist * 0.1 or dist -- wounded players come first
                if score < bestDist then
                    best = plr
                    bestDist = score
                end
            end
        end
    end
    return best, bestDist
end

local function UpdateAimTarget()
    local root = CurrentTargetRoot
    if root and root.Parent then
        Aim.Part = root
        Aim.Pos = root.CFrame
        Aim.Position = root.Position
    else
        Aim.Part = nil
        Aim.Pos = nil
        Aim.Position = nil
    end
end

local function InstallMouseModuleHook()
    if Aim.MouseHookInstalled then return true end
    if type(getrawmetatable) ~= "function" or type(setreadonly) ~= "function" then return false end
    local mod = ReplicatedStorage:FindFirstChild("Mouse")
    if not mod then return false end
    local okRequire, mouseMod = pcall(require, mod)
    if not okRequire or type(mouseMod) ~= "table" then return false end
    local ok = pcall(function()
        local store = { Hit = rawget(mouseMod, "Hit"), Target = rawget(mouseMod, "Target") }
        local mt = getrawmetatable(mouseMod) or {}
        setreadonly(mt, false)
        rawset(mouseMod, "Hit", nil)
        rawset(mouseMod, "Target", nil)
        mt.__index = function(self, key)
            if Aim.Position then
                if key == "Hit" then return Aim.Pos or CFrame.new(Aim.Position) end
                if key == "Target" and Aim.Part then return Aim.Part end
            end
            local value = rawget(self, key)
            if value ~= nil then return value end
            return store[key]
        end
        mt.__newindex = function(self, key, value)
            if key == "Hit" or key == "Target" then
                store[key] = value
            else
                rawset(self, key, value)
            end
        end
        setreadonly(mt, true)
        Aim.MouseMod = mouseMod
        Aim.MouseStore = store
        Aim.MouseMT = mt
        Aim.MouseHookInstalled = true
    end)
    return ok
end

local function InstallGameMouseHook()
    if Aim.GameHookReady then return true end
    if type(getrawmetatable) ~= "function" or type(newcclosure) ~= "function" then return false end
    local mouse = LocalPlayer:GetMouse()
    if not mouse then return false end
    local gmt = getrawmetatable(game)
    if not gmt then return false end
    local ok = pcall(function()
        setreadonly(gmt, false)
        local oldIndex = gmt.__index
        gmt.__index = newcclosure(function(self, key)
            local targetPos = Aim.Position
            if targetPos and self == mouse and not checkcaller() then
                local cam = Workspace.CurrentCamera
                local camPos = cam and cam.CFrame.Position or nil
                if key == "Hit" then return Aim.Pos or CFrame.new(targetPos) end
                if key == "Target" then return Aim.Part end
                if camPos then
                    local dir = targetPos - camPos
                    if key == "UnitRay" then return Ray.new(camPos, dir.Unit) end
                    if key == "Origin" then return CFrame.new(camPos) end
                    if key == "Direction" then return dir.Unit end
                end
            end
            if type(oldIndex) == "function" then return oldIndex(self, key) end
            if type(oldIndex) == "table" then return oldIndex[key] end
            return nil
        end)
        setreadonly(gmt, true)
        Aim.MouseGame = mouse
        Aim.GameHookReady = true
    end)
    return ok
end

local function InstallAimHooks()
    SafeCall(InstallGameMouseHook)
    if SafeCall(InstallMouseModuleHook) then return end
    task.spawn(function()
        local deadline = tick() + 10
        while tick() < deadline do
            if InstallMouseModuleHook() then return end
            task.wait(0.5)
        end
    end)
end

RunService.RenderStepped:Connect(UpdateAimTarget)


local Sov = {
    SnapDist = 85,
    PredictLead = 0.162,
    SampleInterval = 0.08,
    MaxSampleJump = 300,
    TweenSpeed = 200,
    OffsetRadius = 10,
    OffsetRefresh = 0.7,
    TweenRefreshDist = 4,
    Tween = game:GetService("TweenService")
}

local function StopTween()
    if ActiveTween then
        ActiveTween:Cancel()
        ActiveTween = nil
    end
end

local Noclip = {
    Conn = nil,
    DescConn = nil,
    Char = nil,
    Parts = nil,
    Saved = nil
}

local function NoclipStrip(part, saved)
    if part:IsA("BasePart") and part.CanCollide then
        saved[part] = true
        part.CanCollide = false
    end
end

local function NoclipRestore(saved)
    if not saved then return end
    for part in pairs(saved) do
        pcall(function()
            if part.Parent then
                part.CanCollide = true
            end
        end)
    end
end

local function NoclipBind(char)
    NoclipRestore(Noclip.Saved)
    Noclip.Saved = {}
    Noclip.Char = char
    Noclip.Parts = {}
    if Noclip.DescConn then
        Noclip.DescConn:Disconnect()
        Noclip.DescConn = nil
    end
    for _, d in ipairs(char:GetDescendants()) do
        if d:IsA("BasePart") then
            Noclip.Parts[#Noclip.Parts + 1] = d
            NoclipStrip(d, Noclip.Saved)
        end
    end
    Noclip.DescConn = char.DescendantAdded:Connect(function(d)
        if d:IsA("BasePart") then
            Noclip.Parts[#Noclip.Parts + 1] = d
            NoclipStrip(d, Noclip.Saved)
        end
    end)
end

local function NoclipStart()
    if Noclip.Conn then return end
    Noclip.Saved = {}
    local char = LocalPlayer.Character
    if char then NoclipBind(char) end
    Noclip.Conn = RunService.Stepped:Connect(function()
        local current = LocalPlayer.Character
        if not current then return end
        if current ~= Noclip.Char then
            NoclipBind(current)
            return
        end
        local parts = Noclip.Parts
        if not parts then return end
        for i = #parts, 1, -1 do
            local part = parts[i]
            if not part.Parent then
                table.remove(parts, i)
            elseif part.CanCollide then
                part.CanCollide = false
            end
        end
    end)
end

local function NoclipStop()
    if Noclip.Conn then
        Noclip.Conn:Disconnect()
        Noclip.Conn = nil
    end
    if Noclip.DescConn then
        Noclip.DescConn:Disconnect()
        Noclip.DescConn = nil
    end
    NoclipRestore(Noclip.Saved)
    Noclip.Char = nil
    Noclip.Parts = nil
    Noclip.Saved = nil
end

local function SetCollide()
    local char = LocalPlayer.Character
    if not char then return end
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            if part.Name == "HumanoidRootPart"
                or part.Name:find("LowerTorso")
                or part.Name:find("UpperTorso") then
                part.CanCollide = true
            end
        end
    end
end

local TweenTargetPos = nil

function Sov:IsV4()
    local char = LocalPlayer.Character
    local transformed = char and char:FindFirstChild("RaceTransformed")
    return transformed ~= nil and transformed.Value == true
end
function Sov:Speed()
    return self:IsV4() and 250 or self.TweenSpeed
end
function Sov:SnapRange()
    return self:IsV4() and 100 or self.SnapDist
end
function Sov:ApplyWaterWalk(on)
    local map = Workspace:FindFirstChild("Map")
    local plane = map and map:FindFirstChild("WaterBase-Plane")
    if not plane or not plane:IsA("BasePart") then plane = nil end
    if self.WalkPlane and (self.WalkPlane ~= plane or not on) then
        pcall(function()
            if self.WalkPlane.Size == self.WalkApplied then self.WalkPlane.Size = self.WalkOriginal end
        end)
        self.WalkPlane, self.WalkOriginal, self.WalkApplied = nil, nil, nil
        self.WaterCheckedAt, self.WaterSample = nil, nil
    end
    if on and plane then
        if self.WalkPlane ~= plane then
            self.WalkPlane, self.WalkOriginal = plane, plane.Size
            self.WalkApplied = Vector3.new(plane.Size.X, plane.Size.Y + 32, plane.Size.Z)
            self.WaterCheckedAt, self.WaterSample = nil, nil
        end
        if plane.Size ~= self.WalkApplied then plane.Size = self.WalkApplied end
    end
end

task.spawn(function()
    while true do
        SafeCall(Sov.ApplyWaterWalk, Sov, Settings.WaterWalk)
        task.wait(0.2)
    end
end)

-- Use the map's actual water plane; keep underground/interior locations on their own level.
function Sov:WaterSurface()
    if self.WaterCheckedAt and tick() - self.WaterCheckedAt < 1 then return self.WaterY, self.WaterPlane end
    self.WaterCheckedAt = tick()
    local map = Workspace:FindFirstChild("Map")
    local plane = map and map:FindFirstChild("WaterBase-Plane")
    self.WaterPlane = plane and plane:IsA("BasePart") and plane or nil
    self.WaterY = self.WaterPlane and self.WaterPlane.Position.Y + self.WaterPlane.Size.Y * 0.5 or nil
    return self.WaterY, self.WaterPlane
end
function Sov:WaterFloor(pos)
    local surface, plane = self:WaterSurface()
    if surface and pos.Y < surface - 80 then return nil end
    if self.WaterSample and tick() - self.WaterSample.At < 0.15
        and (Vector3.new(pos.X, 0, pos.Z) - self.WaterSample.Pos).Magnitude < 12 then
        return self.WaterSample.Floor
    end
    if not self.WaterParams then
        self.WaterParams = RaycastParams.new()
        self.WaterParams.FilterType = Enum.RaycastFilterType.Exclude
        self.WaterParams.IgnoreWater = false
    end
    local excluded = {}
    for _, obj in pairs({ LocalPlayer.Character, Workspace:FindFirstChild("Characters"),
        Workspace.CurrentCamera, Workspace:FindFirstChild("_WorldOrigin") }) do
        excluded[#excluded + 1] = obj
    end
    self.WaterParams.FilterDescendantsInstances = excluded
    local top = math.max(pos.Y, surface or pos.Y) + 32
    local hit = Workspace:Raycast(Vector3.new(pos.X, top, pos.Z), Vector3.new(0, -160, 0), self.WaterParams)
    local floor
    if hit and (hit.Material == Enum.Material.Water or hit.Instance == plane) then floor = hit.Position.Y + 12 end
    self.WaterSample = { At = tick(), Pos = Vector3.new(pos.X, 0, pos.Z), Floor = floor }
    return floor
end
function Sov:SafeGoal(cf, cruise)
    if not Settings.WaterWalk then return cf end
    local surface = self:WaterSurface()
    local floor
    if cruise and surface and cf.Position.Y >= surface - 80 then floor = surface + 12
    elseif not surface or cf.Position.Y < surface + 12 then floor = self:WaterFloor(cf.Position) end
    if floor and cf.Position.Y < floor then return cf + Vector3.new(0, floor - cf.Position.Y, 0) end
    return cf
end

local function MoveTo(cf, speed)
    local hrp = GetHRP(LocalPlayer)
    local hum = GetHumanoid(LocalPlayer)
    if not hrp or not hum then return end
    speed = math.max(tonumber(speed) or Sov:Speed(), 1)
    cf = Sov:SafeGoal(cf, (cf.Position - hrp.Position).Magnitude > Sov:SnapRange())
    if ActiveTween and ActiveTween.PlaybackState == Enum.PlaybackState.Playing
        and Sov.ActiveTweenSpeed == speed
        and TweenTargetPos and (cf.Position - TweenTargetPos).Magnitude <= Sov.TweenRefreshDist then
        return
    end
    hrp.AssemblyLinearVelocity = Vector3.zero
    hrp.AssemblyAngularVelocity = Vector3.zero
    pcall(function() hum:ChangeState(Enum.HumanoidStateType.Physics) end)
    local distance = (cf.Position - hrp.Position).Magnitude
    StopTween()
    local tween = Sov.Tween:Create(hrp, TweenInfo.new(distance / speed, Enum.EasingStyle.Linear), { CFrame = cf })
    ActiveTween = tween
    TweenTargetPos = cf.Position
    Sov.ActiveTweenSpeed = speed
    NoclipStart()
    tween:Play()
end

local function RandomOffset()
    local now = tick()
    if now >= NextOffsetRefresh then
        OffsetAngle = Random:NextNumber(0, math.pi * 2)
        NextOffsetRefresh = now + Sov.OffsetRefresh
    end
    return Vector3.new(math.cos(OffsetAngle) * Sov.OffsetRadius, 0, math.sin(OffsetAngle) * Sov.OffsetRadius)
end

local HopActive
local ClearFlightComponents

local function ChaseStep()
    local myHRP = GetHRP(LocalPlayer)
    local myHum = GetHumanoid(LocalPlayer)
    if not myHRP or not myHum or myHum.Health <= 0 then
        StopTween()
        NoclipStop()
        return
    end

    local targetRoot = CurrentTarget
        and CurrentTarget.Character
        and CurrentTarget.Character:FindFirstChild("HumanoidRootPart")
    if not targetRoot then
        targetRoot = CurrentTargetRoot
    end
    if not targetRoot or not targetRoot.Parent then
        StopTween()
        NoclipStop()
        ChaseSample = nil
        return
    end
    CurrentTargetRoot = targetRoot
    Aim.Part = targetRoot
    Aim.Pos = targetRoot.CFrame

    if FleeActive or HopActive() then
        StopTween()
        NoclipStop()
        return
    end

    local targetPos = targetRoot.Position
    local vel = Vector3.zero
    local now = tick()
    if ChaseSample then
        local dt = now - ChaseSample.t
        if dt > 0 and dt < 1 and (targetPos - ChaseSample.pos).Magnitude <= Sov.MaxSampleJump then
            vel = (targetPos - ChaseSample.pos) / dt
        end
    end
    if not ChaseSample or now - ChaseSample.t >= Sov.SampleInterval then
        ChaseSample = { pos = targetPos, t = now }
    end

    MoveTo(targetRoot.CFrame + vel * Sov.PredictLead + RandomOffset(), Sov:Speed())
end

local function StartChase()
    if ChaseActive then return end
    ChaseActive = true
    ChaseConnection = RunService.Stepped:Connect(function()
        if not Settings.AutoBounty or not ChaseActive then return end
        SafeCall(ChaseStep)
    end)
end

local function StopChase()
    ChaseActive = false
    if ChaseConnection then
        ChaseConnection:Disconnect()
        ChaseConnection = nil
    end
    StopTween()
    NoclipStop()
    SetCollide()
    ChaseSample = nil
end

local function ResetTarget()
    Stay.Combat = {}
    CurrentTarget = nil
    CurrentTargetRoot = nil
    UpdateAimTarget()
    ChaseSample = nil
    StopTween()
    TargetLostTime = tick()
end
local function SetTarget(plr)
    if not plr or LockGuard.IsBlacklisted(plr) then return false end
    LockGuard.RegisterLock(plr)
    CurrentTarget = plr
    Stay.Combat = {}
    Stay:UpdateEngagement(plr)
    CurrentTargetRoot = plr and plr.Character
        and plr.Character:FindFirstChild("HumanoidRootPart") or nil
    ChaseSample = nil
    TargetInvalidSince = nil
    TargetLockStart = tick()
    StopTween()
    return true
end

local Flight = {
    Speed = 350,
    Attachment = nil,
    Velocity = nil,
    Force = nil,
    DescentTime = 0,
    DescentLastY = nil,
    DescentLastClock = nil,
    DescentHRP = nil
}
local DESCENT_ACCEL_TIME = 1.2

local function SetCharNoclip(char, enabled)
    if not char then return end
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = not enabled
        end
    end
end

function ClearFlightComponents()
    for _, key in ipairs({ "Velocity", "Force", "Attachment" }) do
        local obj = Flight[key]
        if obj then
            pcall(function() obj:Destroy() end)
            Flight[key] = nil
        end
    end
    Flight.DescentTime = 0
    Flight.DescentLastY = nil
    Flight.DescentLastClock = nil
    Flight.DescentHRP = nil
end

local function SetupFlightComponents(hrp)
    if Flight.Velocity and Flight.Velocity.Parent == hrp
        and Flight.Attachment and Flight.Attachment.Parent == hrp then
        return
    end

    ClearFlightComponents()

    local att = Instance.new("Attachment")
    att.Name = "AutoBounty_FlightAttachment"
    att.Parent = hrp
    Flight.Attachment = att

    local lv = Instance.new("LinearVelocity")
    lv.Name = "AutoBounty_FlightVelocity"
    lv.MaxForce = math.huge
    lv.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector
    lv.VectorVelocity = Vector3.zero
    lv.Attachment0 = att
    lv.Parent = hrp
    Flight.Velocity = lv

    local totalMass = 0
    local char = hrp.Parent
    if char then
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") and not part.Massless then
                totalMass = totalMass + part:GetMass()
            end
        end
    end

    local vf = Instance.new("VectorForce")
    vf.Name = "AutoBounty_AntiGravity"
    vf.ApplyAtCenterOfMass = true
    vf.Attachment0 = att
    vf.Force = Vector3.new(0, totalMass * Workspace.Gravity, 0)
    vf.Parent = hrp
    Flight.Force = vf
end

local function ResetDescentState()
    Flight.DescentTime = 0
    Flight.DescentLastY = nil
    Flight.DescentLastClock = nil
end

local function UpdateDescentState(hrp, descending)
    local now = os.clock()

    if not hrp then
        ResetDescentState()
        return 1
    end

    if Flight.DescentHRP ~= hrp then
        Flight.DescentHRP = hrp
        ResetDescentState()
        return 1
    end

    local lastY = Flight.DescentLastY
    local lastClock = Flight.DescentLastClock
    Flight.DescentLastY = hrp.Position.Y
    Flight.DescentLastClock = now

    if not lastY or not lastClock then return 1 end

    local dt = now - lastClock
    if dt <= 0 then return 1 end

    local dropRate = (lastY - hrp.Position.Y) / dt
    if descending and dropRate >= 5 then
        Flight.DescentTime = math.min(Flight.DescentTime + dt, DESCENT_ACCEL_TIME)
    else
        Flight.DescentTime = 0
    end

    local progress = Flight.DescentTime / DESCENT_ACCEL_TIME
    return 1 + (2.0 - 1) * (progress * progress)
end

local function FlyMoveTo(pos)
    if not pos then return end
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    SetupFlightComponents(hrp)

    local dir = pos - hrp.Position
    if dir.Magnitude > 0.1 then
        local mult = UpdateDescentState(hrp, dir.Y < 0)
        if Flight.Velocity then
            Flight.Velocity.VectorVelocity = dir.Unit * Flight.Speed * mult
        end
    else
        if Flight.Velocity then
            Flight.Velocity.VectorVelocity = Vector3.zero
        end
        ResetDescentState()
    end
end

local function FlyStop()
    ResetDescentState()
    if Flight.Velocity then
        Flight.Velocity.VectorVelocity = Vector3.zero
    end
end

local function FleeUpLogic()
    pcall(function()
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hum or not hrp or hum.Health <= 0 then return end

        SetCharNoclip(char, true)
        FlyMoveTo(hrp.Position + Vector3.new(0, 100, 0))
    end)
end

local function IsMarineTeam()
    local ok, teamName = pcall(function()
        return LocalPlayer.Team and LocalPlayer.Team.Name
    end)
    if ok and teamName == "Marines" then return true end

    local okData, dataTeam = pcall(function()
        local data = LocalPlayer:FindFirstChild("Data")
        local teamVal = data and data:FindFirstChild("Team")
        return teamVal and teamVal.Value
    end)
    return okData and dataTeam == "Marines"
end

local function IsMarineBountyRiskUI()
    local mainUI = LocalPlayer:FindFirstChild("PlayerGui") and LocalPlayer.PlayerGui:FindFirstChild("Main")
    local bottomHUD = mainUI and mainUI:FindFirstChild("BottomHUDList")
    if not bottomHUD then return false end

    local function IsActive(obj)
        if not obj then return false end
        return (not obj:IsA("GuiObject")) or obj.Visible
    end

    if IsActive(bottomHUD:FindFirstChild("CampBounty")) then return true end
    if IsActive(bottomHUD:FindFirstChild("initHonor")) then return true end

    local inCombatUI = bottomHUD:FindFirstChild("InCombat")
    local nestedHonor = inCombatUI and inCombatUI:FindFirstChild("initHonor")
    if IsActive(nestedHonor) then return true end

    return false
end

local function GetCombatStatus()
    local mainUI = LocalPlayer:FindFirstChild("PlayerGui") and LocalPlayer.PlayerGui:FindFirstChild("Main")
    local bottomHUD = mainUI and mainUI:FindFirstChild("BottomHUDList")
    local inCombatUI = bottomHUD and bottomHUD:FindFirstChild("InCombat")

    if inCombatUI and inCombatUI.Visible then
        local rawText = ""
        if inCombatUI:IsA("TextLabel") then
            rawText = inCombatUI.Text
        else
            local childText = inCombatUI:FindFirstChildWhichIsA("TextLabel", true)
            if childText then rawText = childText.Text end
        end

        local lowerText = string.lower(rawText)
        local isBountyRisk = string.find(lowerText, "bounty at risk")
            or string.find(lowerText, "bounty")
            or string.find(lowerText, "\u{8CDE}\u{91D1}")
        local isHonorRisk = string.find(lowerText, "honor at risk")
            or string.find(lowerText, "honor")
            or string.find(lowerText, "\u{69AE}\u{8B7D}")
            or string.find(lowerText, "\u{519B}\u{8854}")
            or string.find(lowerText, "\u{8ECD}\u{929C}")

        if IsMarineTeam() and (isHonorRisk or IsMarineBountyRiskUI()) then
            return "BountyAtRisk"
        end
        if isBountyRisk or isHonorRisk then
            return "BountyAtRisk"
        end
        return "InCombatNoRisk"
    end

    if IsMarineTeam() and IsMarineBountyRiskUI() then
        return "BountyAtRisk"
    end
    return "NotInCombat"
end

local CombatCache, CombatCacheTime = "NotInCombat", 0
local function IsBountyAtRisk()
    local now = os.clock()
    if now - CombatCacheTime >= 0.5 then
        CombatCacheTime = now
        CombatCache = GetCombatStatus()
    end
    return CombatCache == "BountyAtRisk"
end

local HopMinPlayers, HopMaxPlayers = 1, 12
local function ApplyPlayerRange(label)
    local a, b = tostring(label):match("(%d+)%-(%d+)")
    HopMinPlayers = tonumber(a) or 1
    HopMaxPlayers = tonumber(b) or 12
end
ApplyPlayerRange(Settings.HopPlayerRange)

local HopMinBounty, HopMaxBounty = 0, 999999999
local function ApplyBountyRange(label)
    local numText = tostring(label):match("([%d%.]+%s*[Mm]?)")
    if numText then
        local num, unit = numText:match("([%d%.]+)%s*([Mm]?)")
        local value = tonumber(num) or 0
        if unit and unit:lower() == "m" then value = value * 1000000 end
        HopMinBounty = value + 1
        HopMaxBounty = 999999999
    else
        HopMinBounty = 0
        HopMaxBounty = 999999999
    end
end
ApplyBountyRange(Settings.HopBountyRange)

local function FormatNumber(n)
    local s = tostring(math.floor(tonumber(n) or 0))
    local left, num, right = s:match("^([^%d]*%d)(%d*)(.-)$")
    return left .. (num:reverse():gsub("(%d%d%d)", "%1,"):reverse()) .. right
end

local HUD = {}

local function SetupHUD()
local RE_EXECUTE_URL = (type(getgenv) == "function" and getgenv().SovereignAutoBountyURL) or nil
local SCRIPT_START_TICK = tick()
local RunTimeCarry = tonumber(getgenv and getgenv().AutoBountyRunTime) or 0
local BountyBase = nil
local BountyPending = nil
local LastEarned = 0

local function GetMyBounty()
    local stats = LocalPlayer:FindFirstChild("leaderstats")
    local value = stats and stats:FindFirstChild("Bounty/Honor")
    return value and tonumber(value.Value) or nil
end

local function GetRunTime()
    return RunTimeCarry + (tick() - SCRIPT_START_TICK)
end

local function GetBountyBase()
    local current = GetMyBounty()
    if BountyBase ~= nil then return BountyBase end
    if not current then return nil end
    if BountyPending == current then
        BountyBase = current
    else
        BountyPending = current
        return nil
    end
    return BountyBase
end

local function GetEarnedBounty()
    local current = GetMyBounty()
    if not current then return LastEarned end
    local base = GetBountyBase()
    if base == nil then return LastEarned end
    LastEarned = current - base
    return LastEarned
end

local function BuildReExecuteScript()
    GetEarnedBounty()
    local env = getgenv and getgenv()
    local lang = type(env) == "table" and (env.Language or env.language) or nil
    local parts = { "getgenv().AutoBountyMainLoaded = nil" }
    if type(lang) == "string" and lang ~= "" then
        parts[#parts + 1] = string.format("getgenv().Language = %q", lang)
    end
    parts[#parts + 1] = string.format("getgenv().AutoBountyRunTime = %.0f", GetRunTime())
    parts[#parts + 1] = string.format("getgenv().AutoBountyEarned = %.0f", LastEarned)
    parts[#parts + 1] = string.format('loadstring(game:HttpGet("%s"))()', RE_EXECUTE_URL)
    return table.concat(parts, "\n") .. "\n"
end

local function QueueAutoReExecute()
    if not RE_EXECUTE_URL then return false end
    local source = BuildReExecuteScript()
    if type(queue_on_teleport) == "function" then
        return select(1, pcall(queue_on_teleport, source))
    end
    if type(queueonteleport) == "function" then
        return select(1, pcall(queueonteleport, source))
    end
    if type(syn) == "table" and type(syn.queue_on_teleport) == "function" then
        return select(1, pcall(syn.queue_on_teleport, source))
    end
    return false
end

HUD.GetRunTime = GetRunTime
HUD.GetEarnedBounty = GetEarnedBounty
HUD.QueueAutoReExecute = QueueAutoReExecute
end

SetupHUD()

local ServerHopCache = { List = nil, Fetching = false }

local function FetchServerList(timeout)
    local browser = ReplicatedStorage:FindFirstChild("__ServerBrowser")
    if not browser then return nil end
    local servers = {}
    local MAX_PAGES, WORKERS = 100, 8
    local nextPage, active, exhausted = 1, WORKERS, false
    local deadline = tick() + (timeout or 20)

    -- a few workers pull pages one at a time instead of 100 requests at once (that flood crashed phones)
    local function worker()
        while not exhausted and tick() < deadline do
            local page = nextPage
            nextPage = nextPage + 1
            if page > MAX_PAGES then break end
            local ok, result = pcall(function() return browser:InvokeServer(page) end)
            if not ok then
                task.wait(0.5)
                ok, result = pcall(function() return browser:InvokeServer(page) end)
            end
            if ok and type(result) == "table" then
                local added = 0
                for job, info in pairs(result) do
                    if type(info) == "table" then
                        added = added + 1
                        servers[job] = {
                            Region = tostring(info.Region or "Unknown"),
                            Count = tonumber(info.Count) or 0,
                            Bounty = tonumber(info.Bounty) or 0
                        }
                    end
                end
                if added == 0 then exhausted = true end
            end
            task.wait(0.08)
        end
        active = active - 1
    end
    for _ = 1, WORKERS do task.spawn(worker) end
    while active > 0 and tick() < deadline + 2 do task.wait(0.1) end
    exhausted = true
    return servers
end

local function GetServerList()
    if ServerHopCache.List and tick() - (ServerHopCache.At or 0) < 60 then return ServerHopCache.List end
    if ServerHopCache.Fetching then
        local deadline = tick() + 25
        while ServerHopCache.Fetching and tick() < deadline do task.wait(0.1) end
        return ServerHopCache.List
    end
    ServerHopCache.Fetching = true
    local ok, servers = pcall(FetchServerList, 20)
    ServerHopCache.Fetching = false
    if ok and type(servers) == "table" and next(servers) then
        ServerHopCache.List = servers
        ServerHopCache.At = tick()
    end
    return ServerHopCache.List
end

local function MatchRegion(info)
    if not info then return false end
    local want = tostring(Settings.ServerRegion or "")
    if want == "" or want == "Random" or want == "Random" then return true end
    local region = tostring(info.Region or ""):lower()
    local aliases = { india = { "india", "mumbai", "delhi", "bangalore", "chennai", "hyderabad", "kolkata" } }
    local list = aliases[want:lower()] or { want:lower() }
    for _, name in ipairs(list) do
        if region:find(name, 1, true) then return true end
    end
    return false
end

local function MatchServer(info)
    if not info then return false end
    if not MatchRegion(info) then return false end
    local count = tonumber(info.Count) or 0
    if count < HopMinPlayers or count > HopMaxPlayers then return false end
    local bounty = tonumber(info.Bounty) or 0
    return bounty >= HopMinBounty and bounty <= HopMaxBounty
end

local function MatchServerRelaxed(info)
    return MatchRegion(info)
end

local function CollectMatches(servers, predicate)
    local matches = {}
    if type(servers) ~= "table" then return matches end
    for job, info in pairs(servers) do
        if job ~= game.JobId and predicate(info) then
            table.insert(matches, { Job = job, Region = info.Region, Count = info.Count, Bounty = info.Bounty })
        end
    end
    return matches
end

local function PickServer(servers)
    local matches = CollectMatches(servers, MatchServer)
    if #matches > 0 then
        return matches[math.random(1, #matches)], false
    end
    local relaxed = CollectMatches(servers, MatchServerRelaxed)
    if #relaxed > 0 then
        return relaxed[math.random(1, #relaxed)], true
    end
    return nil, false
end

local HopTried = {}
local function PickServers(servers, limit)
    local function shuffle(t)
        for i = #t, 2, -1 do
            local j = math.random(1, i)
            t[i], t[j] = t[j], t[i]
        end
        return t
    end
    local out, seen = {}, {}
    local anyServer = function() return true end
    for _, group in ipairs({
        shuffle(CollectMatches(servers, MatchServer)),
        shuffle(CollectMatches(servers, MatchServerRelaxed)),
        shuffle(CollectMatches(servers, anyServer)),
    }) do
        for _, m in ipairs(group) do
            if not seen[m.Job] and not HopTried[m.Job] then
                seen[m.Job] = true
                table.insert(out, m)
                if #out >= limit then return out end
            end
        end
    end
    return out
end

local HopPhase = "idle"
local HopPrepStartY = nil

function HopActive()
    return HopPhase ~= "idle"
end

local HopAscendThread = nil
local function StartHopAscend()
    if HopAscendThread then return end
    if not HopPrepStartY then
        local hrp0 = GetHRP(LocalPlayer)
        HopPrepStartY = hrp0 and hrp0.Position.Y or 0
    end
    HopAscendThread = task.spawn(function()
        while HopActive() do
            local hrp = GetHRP(LocalPlayer)
            if hrp then
                if hrp.Position.Y - HopPrepStartY < 1500 then
                    SafeCall(FleeUpLogic)
                else
                    FlyStop()
                end
            end
            task.wait(0.1)
        end
        FlyStop()
        ClearFlightComponents()
        local char = LocalPlayer.Character
        if char then SetCharNoclip(char, false) end
        HopPrepStartY = nil
        HopAscendThread = nil
    end)
end

local HopInterruptedByDanger = false
local HOP_LANDING_GRACE = 5
local HOP_DELAY = 5
local HopCooldownUntil = 0
local HopWaitUntil = 0

local TeleportService = game:GetService("TeleportService")

-- Try the in-game server browser first, then fall back to TeleportService (same idea as Nexus).
-- Returns true when a teleport appears to be underway.
local function TryTeleportToJob(job)
    local failed = false
    local conn = TeleportService.TeleportInitFailed:Connect(function() failed = true end)
    local function waitFail(seconds)
        local t = tick()
        while tick() - t < seconds and not failed do task.wait(0.25) end
    end

    local browser = ReplicatedStorage:FindFirstChild("__ServerBrowser")
    if browser then
        pcall(function() browser:InvokeServer("teleport", job) end)
        waitFail(3)
    end
    if failed or not browser then
        failed = false
        pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, job, LocalPlayer) end)
        waitFail(3)
    end
    conn:Disconnect()
    return not failed
end

local HopMatchStart = 0

local function BeginHopMatch()
    HopPhase = "matching"
    HopMatchStart = tick()
    task.spawn(function()
        local ok, err = pcall(function()
            local servers = GetServerList()
            local candidates = PickServers(servers, 5)
            if #candidates == 0 and tick() - (ServerHopCache.At or 0) > 30 then
                ServerHopCache.List = nil
                HopTried = {}
                servers = GetServerList()
                candidates = PickServers(servers, 5)
            end

            local queued = false
            for _, target in ipairs(candidates) do
                if HopPhase ~= "matching" then return end
                if IsBountyAtRisk() then
                    HopPhase = "preparing"
                    HopInterruptedByDanger = true
                    return
                end
                if CurrentTarget and not Stay.Armed then
                    HopPhase = "idle"
                    return
                end

                HopTried[target.Job] = true
                if not queued then
                    HUD.QueueAutoReExecute()
                    queued = true
                end
                TryTeleportToJob(target.Job)
                task.wait(1)
            end
        end)
        if not ok then LastCaughtError = "Hop error: " .. tostring(err) end

        -- still here and still matching: that attempt failed, release the hop so it can restart cleanly
        if HopPhase == "matching" then
            HopPhase = "idle"
            HopCooldownUntil = tick() + HOP_LANDING_GRACE
        end
    end)
end

local function DoServerHop()
    if HopActive() then return end

    HopPhase = "preparing"
    HopPrepStartY = nil
    ResetTarget()
    StartHopAscend()
    task.spawn(GetServerList)

    if IsBountyAtRisk() then
        HopInterruptedByDanger = true
        return
    end

    HopPhase = "waiting"
    HopWaitUntil = tick() + HOP_DELAY
end
task.spawn(function()
    while true do
        task.wait(0.2)
        if HopPhase == "waiting" then
            if IsBountyAtRisk() then
                HopPhase = "preparing"
                HopInterruptedByDanger = true
            elseif tick() >= HopWaitUntil then
                BeginHopMatch()
            end
        elseif HopPhase == "matching" and tick() - HopMatchStart > 75 then
            HopPhase = "idle"
            HopCooldownUntil = tick() + HOP_LANDING_GRACE
        elseif HopPhase == "matching" and IsBountyAtRisk() then
            HopPhase = "preparing"
            HopInterruptedByDanger = true
        elseif HopPhase == "preparing" and not IsBountyAtRisk() then
            HopInterruptedByDanger = false
            if CurrentTarget and not Stay.Armed then
                HopPhase = "idle"
            elseif Settings.AutoBounty then
                HopPhase = "waiting"
                HopWaitUntil = tick() + HOP_DELAY
            else
                HopPhase = "idle"
            end
        end
    end
end)

do
    local function ArmForcedHop()
        Stay.Armed = true
        if CurrentTarget then ResetTarget() end
    end

    task.spawn(function()
        while true do
            task.wait(0.5)
            if Stay:Reached() then
                if not Stay.Armed then ArmForcedHop() end
                if not HopActive() and tick() >= HopCooldownUntil then
                    DoServerHop()
                end
            elseif Stay.Armed then
                Stay.Armed = false
            end
        end
    end)
end

do
    local DEATH_HOP_LIMIT = 2
    local DeathCount = 0
    local DeathBound = nil

    local function OnDeath()
        if HopActive() then return end
        DeathCount += 1
        if DeathCount < DEATH_HOP_LIMIT then return end
        DeathCount = 0
        SafeCall(DoServerHop)
    end

    local function BindDeathHop()
        local hum = GetHumanoid(LocalPlayer)
        if not hum or hum == DeathBound then return end
        DeathBound = hum
        hum.Died:Connect(OnDeath)
    end

    BindDeathHop()

    LocalPlayer.CharacterAdded:Connect(function()
        DeathBound = nil
        task.wait(0.2)
        BindDeathHop()
    end)

    task.spawn(function()
        while true do
            task.wait(0.5)
            if GetHumanoid(LocalPlayer) ~= DeathBound then BindDeathHop() end
        end
    end)
end

task.spawn(function()
    while true do
        task.wait(1)
        if Settings.AutoEnablePVP then
            pcall(function() CommF:InvokeServer("EnablePvp") end)
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(2)
        if Settings.AutoHaki then
            local char = LocalPlayer.Character
            if char and not char:FindFirstChild("HasBuso") then
                pcall(function() CommF:InvokeServer("Buso") end)
            end
        end
    end
end)

local function StartAutoKenLoop()
local KEN_PRESS_GAP = 1.2
local KEN_VERIFY = 1.0
local KEN_FAIL_BACKOFF = 20
local KEN_MAX_FAILS = 3
local KEN_DISABLE_LOCK = 5.5

local function KenChar()
    local char = LocalPlayer.Character
    if not char or not char.Parent then
        return nil
    end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum or hum.Health <= 0 then
        return nil
    end
    return char
end

local function KenOn()
    local active = LocalPlayer:GetAttribute("KenActive")
    if active ~= nil then return active == true end
    local blur = game:GetService("Lighting"):FindFirstChild("Blur")
    return (blur and blur.Enabled) and true or false
end

local function KenPressKey()
    local code = Enum.KeyCode.E
    VirtualInputManager:SendKeyEvent(true, code, false, game)
    task.wait(0.1)
    VirtualInputManager:SendKeyEvent(false, code, false, game)
end

local KenNextAt, KenFailCount, KenPendingAt, KenLockUntil = 0, 0, 0, 0
local KenDisableBound = false
local KenStatus = nil

local function BindKenDisable()
    if KenDisableBound then return end
    local remotes = ReplicatedStorage:FindFirstChild("Remotes")
    local disable = remotes and remotes:FindFirstChild("DisableKen")
    if not disable then return end
    KenDisableBound = true
    pcall(function()
        disable.OnClientEvent:Connect(function()
            KenLockUntil = os.clock() + KEN_DISABLE_LOCK
        end)
    end)
end

local function KenStep()
    if not Settings.AutoKen then
        KenNextAt, KenFailCount, KenPendingAt = 0, 0, 0
        KenStatus = "off"
        return KenStatus
    end

    BindKenDisable()
    local char = KenChar()
    local now = os.clock()

    if not char then
        KenNextAt, KenFailCount, KenPendingAt = 0, 0, 0
        KenStatus = "no_char"
    elseif KenOn() then
        KenNextAt, KenFailCount, KenPendingAt = 0, 0, 0
        KenStatus = "on"
    elseif char:FindFirstChild("KenDisabled") then
        KenNextAt, KenFailCount, KenPendingAt = 0, 0, 0
        KenStatus = "blocked"
    elseif now < KenLockUntil then
        KenStatus = "locked"
    elseif now >= KenNextAt then
        if KenPendingAt > 0 and now - KenPendingAt >= KEN_VERIFY then
            KenFailCount = KenFailCount + 1
        end
        KenPendingAt = 0
        if KenFailCount >= KEN_MAX_FAILS then
            KenStatus = "fail"
            KenFailCount = 0
            KenNextAt = now + KEN_FAIL_BACKOFF
        else
            KenStatus = "trying"
            KenPressKey()
            KenPendingAt = os.clock()
            KenNextAt = os.clock() + KEN_PRESS_GAP
        end
    else
        KenStatus = "wait"
    end
    return KenStatus
end

task.spawn(function()
    while true do
        task.wait(0.5)
        pcall(KenStep)
    end
end)
end

StartAutoKenLoop()

task.spawn(function()
    while true do
        task.wait(2)
        local team = LocalPlayer.Team
        if not team or team.Name ~= Settings.SelectTeam then
            ApplyTeam(Settings.SelectTeam)
        end
    end
end)

local function StartV3Loop()
local AUTO_V3_RANGE = 150
local AUTO_V3_COOLDOWN = 1.5

local function ConsiderEnemy(hrp, myPos, best, myHRP)
    if not hrp or hrp == myHRP then return best end
    local dist = (hrp.Position - myPos).Magnitude
    if not best or dist < best then return dist end
    return best
end

local function GetNearestEnemyDistance(limit)
    local myHRP = GetHRP(LocalPlayer)
    if not myHRP then return nil end
    local myPos = myHRP.Position
    local best = nil
    if CurrentTarget and CurrentTarget ~= LocalPlayer then
        best = ConsiderEnemy(GetHRP(CurrentTarget), myPos, best, myHRP)
    end
    if not best or not limit or best > limit then
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                local hum = GetHumanoid(plr)
                if hum and hum.Health > 0 then
                    best = ConsiderEnemy(GetHRP(plr), myPos, best, myHRP)
                end
            end
        end
    end
    if best and limit and best <= limit then return best end
    local enemies = Workspace:FindFirstChild("Enemies")
    if enemies then
        for _, model in ipairs(enemies:GetChildren()) do
            local hum = model:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 then
                best = ConsiderEnemy(model:FindFirstChild("HumanoidRootPart"), myPos, best, myHRP)
                if best and limit and best <= limit then break end
            end
        end
    end
    return best
end

local function V3Ready()
    local char = LocalPlayer.Character
    if not char then return false end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum or hum.Health <= 0 then return false end
    local transformed = char:FindFirstChild("RaceTransformed")
    if transformed and transformed.Value then return false end
    return true
end

local function V3Wanted()
    local char = LocalPlayer.Character
    if char and char:GetAttribute("InCombat") == true then return true end
    local myHRP = GetHRP(LocalPlayer)
    if myHRP and CurrentTarget and CurrentTarget ~= LocalPlayer then
        local targetHRP = GetHRP(CurrentTarget)
        if targetHRP and (targetHRP.Position - myHRP.Position).Magnitude <= AUTO_V3_RANGE then
            return true
        end
    end
    local dist = GetNearestEnemyDistance(AUTO_V3_RANGE)
    return dist ~= nil and dist <= AUTO_V3_RANGE
end

local V3NextAt = 0

local function V3Step()
    if not Settings.AutoV3 then return "off" end
    if not GetHRP(LocalPlayer) then return "no_char" end
    if not V3Ready() then return "busy" end
    if tick() < V3NextAt then return "wait" end
    if not V3Wanted() then return "no_enemy" end
    pcall(function() CommE:FireServer("ActivateAbility") end)
    V3NextAt = tick() + AUTO_V3_COOLDOWN
    return "fired"
end

task.spawn(function()
    while not GetHRP(LocalPlayer) do
        task.wait(0.5)
    end
    while true do
        task.wait(0.5)
        pcall(V3Step)
    end
end)
end

StartV3Loop()

local function GetAwakeningRemote()
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    local awakening = backpack and backpack:FindFirstChild("Awakening")
    if awakening and awakening:FindFirstChild("RemoteFunction") then
        return awakening.RemoteFunction
    end
    local char = LocalPlayer.Character
    local charAwakening = char and char:FindFirstChild("Awakening")
    if charAwakening and charAwakening:FindFirstChild("RemoteFunction") then
        return charAwakening.RemoteFunction
    end
    return nil
end

task.spawn(function()
    while true do
        task.wait(0.5)
        local char = LocalPlayer.Character
        local energy = char and char:FindFirstChild("RaceEnergy")
        local transformed = char and char:FindFirstChild("RaceTransformed")
        if energy and transformed and energy.Value >= 1 and not transformed.Value then
            local remote = GetAwakeningRemote()
            if remote then
                pcall(function() remote:InvokeServer(true) end)
            end
        end
        task.wait(1)
    end
end)

local function SoruTo(targetPosition)
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChild("Humanoid")
    if not hrp or not hum or hum.Health <= 0 then return false end
    local startCFrame = hrp.CFrame
    local finalCFrame = Sov:SafeGoal((startCFrame - startCFrame.Position) + targetPosition + Vector3.new(0, hrp.Size.Y * 1.5, 0), false)
    pcall(function()
        CommE:FireServer("Soru", startCFrame, finalCFrame, workspace:GetServerTimeNow(), math.random(1, 999999999))
    end)
    return true
end

local function SoruToTarget()
    if tick() - SoruLastTime < 10 then return end
    local targetRoot = CurrentTargetRoot
    local myRoot = GetHRP(LocalPlayer)
    if not targetRoot or not targetRoot.Parent or not myRoot then return end
    local distance = (targetRoot.Position - myRoot.Position).Magnitude
    if distance > 900 then return end
    local targetPos = (targetRoot.CFrame * CFrame.new(0, 0, 3)).Position
    if SoruTo(targetPos) then
        SoruLastTime = tick()
    end
end

task.spawn(function()
    while true do
        task.wait(1)
        if Settings.AutoSoru and Settings.AutoBounty then
            SafeCall(SoruToTarget)
        end
    end
end)

do
    local FLEE_ASCEND = 1500
    local FLEE_PLAYER_RANGE = 1500

    local FleeReturnPos = nil
    local FleeStartY = nil

    local function PlayersWithinRange(range)
        local myHRP = GetHRP(LocalPlayer)
        if not myHRP then return 0 end
        local myPos = myHRP.Position
        local count = 0
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                local hum = GetHumanoid(plr)
                local hrp = GetHRP(plr)
                if hum and hrp and hum.Health > 0
                    and (hrp.Position - myPos).Magnitude <= range then
                    count = count + 1
                end
            end
        end
        return count
    end

    local function ClearFleeState()
        FleeActive = false
        FleeReturnPos = nil
        FleeStartY = nil
    end

    local function StopFleeFly()
        FlyStop()
        ClearFlightComponents()
        local char = LocalPlayer.Character
        if char then SetCharNoclip(char, false) end
    end

    task.spawn(function()
        while true do
            task.wait(0.1)
            if not Settings.AutoFlee or not Settings.AutoBounty then
                if FleeActive then StopFleeFly() end
                ClearFleeState()
                continue
            end
            local hum = GetHumanoid(LocalPlayer)
            local hrp = GetHRP(LocalPlayer)
            if not hum or hum.Health <= 0 then
                if FleeActive then StopFleeFly() end
                ClearFleeState()
                continue
            end
            if not hrp then continue end

            local hpPercent = (hum.Health / hum.MaxHealth) * 100
            if hpPercent <= Settings.AutoFleeHP then
                if not FleeActive then
                    FleeActive = true
                    FleeReturnPos = hrp.CFrame
                    FleeStartY = hrp.Position.Y
                    StopTween()
                end
                local climbed = hrp.Position.Y - (FleeStartY or hrp.Position.Y)
                if climbed < FLEE_ASCEND or PlayersWithinRange(FLEE_PLAYER_RANGE) > 0 then
                    SafeCall(FleeUpLogic)
                else
                    FlyStop()
                end
            elseif FleeActive then
                StopFleeFly()
                local returnPos = FleeReturnPos
                ClearFleeState()
                if returnPos then
                    MoveTo(returnPos, Sov:Speed())
                end
            end
        end
    end)
end

local function GetSkillUI()
    local pg = LocalPlayer:FindFirstChild("PlayerGui")
    local main = pg and pg:FindFirstChild("Main")
    return main and main:FindFirstChild("Skills")
end

local function SkillList(weaponTip)
    if Settings.V4Only[weaponTip] then
        local char = LocalPlayer.Character
        local v4 = char and char:FindFirstChild("RaceTransformed")
        if not v4 or v4.Value ~= true then return {} end
    end
    if weaponTip == "Melee" then return Settings.MeleeSkills or {} end
    if weaponTip == "Sword" then return Settings.SwordSkills or {} end
    if weaponTip == "Blox Fruit" then return Settings.FruitSkills or {} end
    if weaponTip == "Gun" then return Settings.GunSkills or {} end
    return {}
end

local DEFAULT_SKILL_HOLD = 0.1

local function HoldTime(weaponTip, key)
    local holds = Settings.Hold[weaponTip]
    if holds and tonumber(holds[key]) then
        return holds[key]
    end
    return DEFAULT_SKILL_HOLD
end

local function SkillFrameReady(frame)
    local title = frame:FindFirstChild("Title")
    local cd = frame:FindFirstChild("Cooldown")
    if not title or not cd then return false end
    local white = title.TextColor3 == Color3.new(1, 1, 1)
    local empty = cd.Size == UDim2.new(0, 0, 1, -1) or cd.Size == UDim2.new(1, 0, 1, -1)
    return white and empty
end

local function FindSkillHolder(ui, tool)
    local holder = ui:FindFirstChild(tool.Name)
    if holder then return holder end
    local char = LocalPlayer.Character
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    local loose = nil
    for _, child in ipairs(ui:GetChildren()) do
        local name = child.Name
        local item = (char and char:FindFirstChild(name))
            or (backpack and backpack:FindFirstChild(name))
        if item and item:IsA("Tool") and item.ToolTip == tool.ToolTip then
            return child
        end
        if not loose and #name >= 4
            and (string.find(tool.Name, name, 1, true) or string.find(name, tool.Name, 1, true)) then
            loose = child
        end
    end
    return loose
end

local TransformGuard = { Gap = 12, Last = { } }

local function CollectReadySkills(weaponTip, tool)
    if not tool then return nil end
    local ui = GetSkillUI()
    if not ui then return nil end
    local holder = FindSkillHolder(ui, tool)
    if not holder then return "prep" end
    local ready = {}
    local now = tick()
    for _, key in ipairs(SkillList(weaponTip)) do
        local frame = holder:FindFirstChild(key)
        if frame and frame:IsA("Frame") then
            local title = frame:FindFirstChild("Title")
            local titleText = title and title.Text
            local isTransform = (type(titleText) == "string" and string.find(titleText, "Transformation"))
                or string.find(frame.Name, "Transformation")
            local gapOk = true
            if isTransform then
                local lastAt = TransformGuard.Last[weaponTip .. key]
                gapOk = lastAt == nil or (now - lastAt) >= TransformGuard.Gap
            end
            if gapOk and SkillFrameReady(frame) then
                if isTransform then TransformGuard.Last[weaponTip .. key] = now end
                table.insert(ready, key)
            end
        end
    end
    return ready
end

local function SendSkillKey(key, hold)
    local code = Enum.KeyCode[string.upper(key)]
    if not code then return false end
    VirtualInputManager:SendKeyEvent(true, code, false, game)
    task.wait(math.clamp(tonumber(hold) or DEFAULT_SKILL_HOLD, 0.1, 1))
    VirtualInputManager:SendKeyEvent(false, code, false, game)
    return true
end

local SkillCastToken = 0
local LastSkillCastTime = 0

local function CastSkill(weaponTip, key, tool)
    if not Settings.AutoBounty or not table.find(SkillList(weaponTip), key) then return false end
    local root = CurrentTargetRoot
    if not root or not root.Parent then return false end
    local hold = HoldTime(weaponTip, key)
    SkillCastToken += 1
    local token = SkillCastToken
    LastSkillCastTime = tick()
    LockWeapon("skill", hold + 0.12)
    Aim.Part = root
    Aim.Pos = root.CFrame
    InstallAimHooks()
    local ok = SendSkillKey(key, hold)
    task.delay(0.35, function()
        if SkillCastToken == token then
            Aim.Pos = nil
            Aim.Part = nil
        end
    end)
    return ok
end

local SkillRotation = { Order = { "Melee", "Sword", "Blox Fruit", "Gun" }, Index = 0 }

local function NextSkillTip()
    for _ = 1, #SkillRotation.Order do
        SkillRotation.Index = SkillRotation.Index % #SkillRotation.Order + 1
        local tip = SkillRotation.Order[SkillRotation.Index]
        if #SkillList(tip) > 0 and FindWeaponTool(tip) then
            return tip
        end
    end
    return nil
end

local function AutoSkillStep()
    local root = CurrentTargetRoot
    local myRoot = GetHRP(LocalPlayer)
    if not root or not root.Parent or not myRoot then return end
    if (root.Position - myRoot.Position).Magnitude > 120 then return end

    local targetPlayer = CurrentTarget
    local weaponTip = NextSkillTip()
    if not weaponTip then return end
    local tool = FindWeaponTool(weaponTip)
    if not tool then return end

    LockWeapon("skill-prep", 0.4)
    if not EquipTool(tool) then return end

    local ready = CollectReadySkills(weaponTip, tool)
    local tries = 0
    while ready == "prep" and tries < 4 do
        task.wait(0.05)
        ready = CollectReadySkills(weaponTip, tool)
        tries += 1
    end
    if ready == "prep" or not ready or #ready == 0 then return end

    for _, key in ipairs(ready) do
        if not Settings.AutoBounty or CurrentTarget ~= targetPlayer
            or not CurrentTargetRoot or not CurrentTargetRoot.Parent then return end
        CastSkill(weaponTip, key, tool)
    end
end

local function StartSkillLoop()
    if SkillLoopThread then return end
    SkillLoopThread = task.spawn(function()
        while true do
            if Settings.AutoBounty then
                SafeCall(AutoSkillStep)
            end
            task.wait(0.1)
        end
    end)
end

task.spawn(function()
    while true do
        task.wait(0.5)
        if Settings.AutoBounty and not IsWeaponLocked()
            and (tick() - LastSkillCastTime) > 1.5 then
            local char = LocalPlayer.Character
            if char then
                local equipped = char:FindFirstChildOfClass("Tool")
                if not equipped or equipped.ToolTip ~= Settings.HoldWeapon then
                    local tool = FindWeaponTool(Settings.HoldWeapon)
                    if tool then
                        SafeCall(EquipTool, tool)
                    end
                end
            end
        end
    end
end)

local AttackState = {
    FoundRemote = nil,
    FoundRemoteId = nil
}

task.spawn(function()
    local folders = {
        ReplicatedStorage:FindFirstChild("Util"),
        ReplicatedStorage:FindFirstChild("Common"),
        ReplicatedStorage:FindFirstChild("Remotes"),
        ReplicatedStorage:FindFirstChild("Assets"),
        ReplicatedStorage:FindFirstChild("FX")
    }
    local function checkChild(child)
        if child:IsA("RemoteEvent") and child:GetAttribute("Id") then
            AttackState.FoundRemoteId = child:GetAttribute("Id")
            AttackState.FoundRemote = child
        end
    end
    for _, folder in ipairs(folders) do
        if folder then
            for _, child in ipairs(folder:GetChildren()) do checkChild(child) end
            folder.ChildAdded:Connect(checkChild)
        end
    end
end)

local M1_RANGE = 500

local function AddAttackTarget(list, seen, model, myPos)
    if not model or seen[model] then return end
    local root = model:FindFirstChild("HumanoidRootPart")
    local hum = model:FindFirstChildOfClass("Humanoid")
    if not root or not hum or hum.Health <= 0 then return end
    if (root.Position - myPos).Magnitude > M1_RANGE then return end
    seen[model] = true
    list[#list + 1] = { Model = model, Root = root, Head = model:FindFirstChild("Head") or root }
end

local function GetAttackTargets()
    local myRoot = GetHRP(LocalPlayer)
    if not myRoot then return {} end
    local myPos = myRoot.Position
    local myChar = LocalPlayer.Character
    local targets, seen = {}, {}
    if CurrentTargetRoot and CurrentTargetRoot.Parent then
        AddAttackTarget(targets, seen, CurrentTarget and CurrentTarget.Character, myPos)
    end
    for _, model in ipairs((Workspace:FindFirstChild("Enemies") or Workspace):GetChildren()) do
        if model ~= myChar then
            AddAttackTarget(targets, seen, model, myPos)
        end
    end
    for _, model in ipairs((Workspace:FindFirstChild("Characters") or Workspace):GetChildren()) do
        if model ~= myChar then
            AddAttackTarget(targets, seen, model, myPos)
        end
    end
    return targets
end

local function PerformFastAttack()
    local char = LocalPlayer.Character
    if not char then return end
    if not (char:FindFirstChildOfClass("Tool") or char:FindFirstChild("EquippedWeapon")) then return end
    local targets = GetAttackTargets()
    if #targets == 0 then return end
    if not AttackState.AttackRemote then
        AttackState.AttackRemote = Net:WaitForChild("RE/RegisterAttack")
        AttackState.HitRemote = Net:WaitForChild("RE/RegisterHit")
        AttackState.Seed = Net:FindFirstChild("seed")
    end
    local mainTarget = targets[1]
    local hitList = {}
    for _, target in ipairs(targets) do
        table.insert(hitList, { target.Model, target.Root })
    end
    pcall(function()
        AttackState.AttackRemote:FireServer(0)
        AttackState.HitRemote:FireServer(mainTarget.Head, hitList)
    end)
    if AttackState.FoundRemote and AttackState.FoundRemoteId then
        pcall(function()
            local seedValue = AttackState.Seed and AttackState.Seed:InvokeServer() or 1
            local encryptedId = bit32.bxor(AttackState.FoundRemoteId + 909090, seedValue * 2)
            local rawName = "RE/RegisterHit"
            local timestamp = math.floor(Workspace:GetServerTimeNow() / 10 % 10) + 1
            local encryptedName = string.gsub(rawName, ".", function(c)
                return string.char(bit32.bxor(string.byte(c), timestamp))
            end)
            AttackState.FoundRemote:FireServer(encryptedName, encryptedId, mainTarget.Head, hitList)
        end)
    end
end

task.spawn(function()
    while true do
        if not Settings.FastAttack then
            task.wait(0.2)
            continue
        end
        local startTime = tick()
        SafeCall(PerformFastAttack)
        local elapsed = tick() - startTime
        task.wait(math.max(0.05 - elapsed, 0.001))
    end
end)

local function GetPlayerFruit()
    local char = LocalPlayer.Character
    if char then
        for _, tool in ipairs(char:GetChildren()) do
            if tool:IsA("Tool") and tool.ToolTip == "Blox Fruit" then
                return tool
            end
        end
    end
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if backpack then
        for _, tool in ipairs(backpack:GetChildren()) do
            if tool:IsA("Tool") and tool.ToolTip == "Blox Fruit" then
                return tool
            end
        end
    end
    return nil
end

local function GetMaxCombo(tool)
    if not tool then return 5 end
    local n = tool.Name
    if n == "T-Rex-T-Rex" then return 4 end
    if n == "Blade-Blade" then return 2 end
    if n == "Pain-Pain" then return 4 end
    if n == "Control-Control" then return 4 end
    if n == "Gas-Gas" then return 5 end
    if n == "Dragon-Dragon" then
        local char = LocalPlayer.Character
        return (char and char:FindFirstChild("DragonHybrid")) and 5 or 3
    end
    return 5
end

task.spawn(function()
    while true do
        task.wait(0.1)
        if not Settings.FruitM1 then continue end
        local fruit = GetPlayerFruit()
        local remote = fruit and fruit:FindFirstChild("LeftClickRemote")
        if not remote then continue end
        local myRoot = GetHRP(LocalPlayer)
        if not myRoot then continue end
        local myChar = LocalPlayer.Character
        local function hit(model)
            if not model or model == myChar then return end
            local root = model:FindFirstChild("HumanoidRootPart")
            local hum = model:FindFirstChildOfClass("Humanoid")
            if not root or not hum or hum.Health <= 0 then return end
            if (root.Position - myRoot.Position).Magnitude > M1_RANGE then return end
            local dir = (root.Position - myRoot.Position).Unit
            pcall(function()
                remote:FireServer(Vector3.new(dir.X, dir.Y, dir.Z), 1, true)
            end)
        end
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then hit(plr.Character) end
        end
        local enemies = Workspace:FindFirstChild("Enemies")
        if enemies then
            for _, npc in ipairs(enemies:GetChildren()) do hit(npc) end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if not Settings.VoidFruitM1 then continue end
        local fruit = GetPlayerFruit()
        local remote = fruit and fruit:FindFirstChild("LeftClickRemote")
        if not remote then continue end
        local maxCombo = GetMaxCombo(fruit)
        pcall(function()
            remote:FireServer(Vector3.new(9e30, 9e30, 9e30), maxCombo, true)
        end)
    end
end)

-- Fruit M1 One-Shot (Kitsune): fires the equipped fruit's click remote at any valid target in range
local OneShotDelays = { ["0.05s (Fast)"] = 0.05, ["0.10s"] = 0.10, ["0.15s (Default)"] = 0.15, ["0.25s"] = 0.25, ["0.50s"] = 0.50 }
local OneShotRange = 500

local function GetOneShotRemote()
    local fruit = GetPlayerFruit()
    if not fruit then return nil end
    local remote = fruit:FindFirstChild("LeftClickRemote") or fruit:FindFirstChild("ClickRemote") or fruit:FindFirstChild("M1Remote")
    if remote and remote:IsA("RemoteEvent") then return remote end
    for _, child in ipairs(fruit:GetChildren()) do
        if child:IsA("RemoteEvent") and child.Name:lower():find("click") then return child end
    end
    return nil
end

task.spawn(function()
    while true do
        task.wait(math.clamp(OneShotDelays[Settings.OneShotDelay] or 0.15, 0.05, 2))
        if not Settings.OneShotKitsune then continue end
        pcall(function()
            local myChar = LocalPlayer.Character
            local myRoot = GetHRP(LocalPlayer)
            local remote = GetOneShotRemote()
            if not myChar or not myRoot or not remote then return end

            local function valid(model)
                if not model or model == myChar then return false end
                local root = model:FindFirstChild("HumanoidRootPart")
                local hum = model:FindFirstChildOfClass("Humanoid")
                return root and hum and hum.Health > 0
                    and (root.Position - myRoot.Position).Magnitude <= OneShotRange
            end

            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and valid(plr.Character) and not IsInSafeZone(plr) then
                    remote:FireServer(Vector3.new(9e30, 9e30, 9e30), 5, false)
                    return
                end
            end
            local enemies = Workspace:FindFirstChild("Enemies")
            if enemies then
                for _, npc in ipairs(enemies:GetChildren()) do
                    if valid(npc) then
                        remote:FireServer(Vector3.new(9e30, 9e30, 9e30), 5, false)
                        return
                    end
                end
            end
        end)
    end
end)

-- One Shot T-Rex / One Shot Dragon: same one-shot fire as Kitsune, only when that fruit is equipped
local function StartFruitOneShot(settingKey, fruitMatch)
    task.spawn(function()
        while true do
            task.wait(math.clamp(OneShotDelays[Settings.OneShotDelay] or 0.15, 0.05, 2))
            if not Settings[settingKey] then continue end
            pcall(function()
                local fruit = GetPlayerFruit()
                if not fruit or not fruit.Name:lower():find(fruitMatch) then return end
                local remote = GetOneShotRemote()
                local myChar = LocalPlayer.Character
                local myRoot = GetHRP(LocalPlayer)
                if not remote or not myChar or not myRoot then return end

                local function valid(model)
                    if not model or model == myChar then return false end
                    local root = model:FindFirstChild("HumanoidRootPart")
                    local hum = model:FindFirstChildOfClass("Humanoid")
                    return root and hum and hum.Health > 0
                        and (root.Position - myRoot.Position).Magnitude <= OneShotRange
                end

                local function fire()
                    remote:FireServer(Vector3.new(9e30, 9e30, 9e30), GetMaxCombo(fruit), false)
                end

                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer and valid(plr.Character) and not IsInSafeZone(plr) then
                        fire()
                        return
                    end
                end
                local enemies = Workspace:FindFirstChild("Enemies")
                if enemies then
                    for _, npc in ipairs(enemies:GetChildren()) do
                        if valid(npc) then
                            fire()
                            return
                        end
                    end
                end
            end)
        end
    end)
end

StartFruitOneShot("OneShotTRex", "t%-rex")
StartFruitOneShot("OneShotDragon", "dragon")

local Dragon = {
    Ready = false,
    ShootFunc = nil,
    Index = nil,
    Limbs = {
        "Head", "UpperTorso", "LowerTorso",
        "LeftUpperArm", "RightUpperArm", "LeftLowerArm", "RightLowerArm",
        "LeftUpperLeg", "RightUpperLeg", "LeftLowerLeg", "RightLowerLeg",
        "HumanoidRootPart"
    }
}

local function InitDragon()
    if Dragon.Ready then return end
    if type(debug) ~= "table" or type(debug.getupvalues) ~= "function" then return end
    local ok = pcall(function()
        local controller = require(ReplicatedStorage:WaitForChild("Controllers"):WaitForChild("CombatController"))
        for _, value in ipairs(debug.getupvalues(controller.Attack)) do
            if type(value) == "function" then
                for i, upvalue in ipairs(debug.getupvalues(value)) do
                    if upvalue == 727595 then
                        Dragon.ShootFunc = value
                        Dragon.Index = { u25 = i - 3, u21 = i - 2, u24 = i - 1, u20 = i, u22 = i + 1, u23 = i + 2, u26 = i + 3 }
                        break
                    end
                end
                if Dragon.ShootFunc then break end
            end
        end
    end)
    if ok and Dragon.ShootFunc then
        Dragon.Ready = true
    end
end

local function FireDragonShot(pos, hit)
    if not Dragon.ShootFunc or not Dragon.Index then return end
    local idx = Dragon.Index
    local u20 = debug.getupvalue(Dragon.ShootFunc, idx.u20)
    local u21 = debug.getupvalue(Dragon.ShootFunc, idx.u21)
    local u22 = debug.getupvalue(Dragon.ShootFunc, idx.u22)
    local u23 = debug.getupvalue(Dragon.ShootFunc, idx.u23)
    local u24 = debug.getupvalue(Dragon.ShootFunc, idx.u24)
    local u25 = debug.getupvalue(Dragon.ShootFunc, idx.u25)
    local u26 = debug.getupvalue(Dragon.ShootFunc, idx.u26)
    local u79 = u25 * u21
    local u80 = (u24 * u21 + u25 * u20) % u22
    u80 = (u80 * u22 + u79) % u23
    u24 = math.floor(u80 / u22)
    u25 = u80 - u24 * u22
    u26 += 1
    debug.setupvalue(Dragon.ShootFunc, idx.u24, u24)
    debug.setupvalue(Dragon.ShootFunc, idx.u25, u25)
    debug.setupvalue(Dragon.ShootFunc, idx.u26, u26)
    ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Validator2"):FireServer(math.floor(u80 / u23 * 16777215), u26)
    Net:WaitForChild("RE/ShootGunEvent"):FireServer(pos, { hit })
end

task.spawn(function()
    while not Dragon.Ready do
        InitDragon()
        task.wait(1)
    end
    while true do
        task.wait()
        if not Settings.Dragonstorm or IsWeaponLocked() then continue end
        local char = LocalPlayer.Character
        local tool = char and char:FindFirstChildOfClass("Tool")
        if not tool or tool.Name ~= "Dragonstorm" then continue end
        local targetRoot = CurrentTargetRoot
        local myRoot = GetHRP(LocalPlayer)
        if not targetRoot or not targetRoot.Parent or not myRoot then continue end
        if (targetRoot.Position - myRoot.Position).Magnitude > 450 then continue end
        FireDragonShot(targetRoot.Position, targetRoot)
    end
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        local loopOk = pcall(function()
        if not Settings.AutoBounty then
            if CurrentTarget then ResetTarget() end
            return
        end

        if not ChaseActive then StartChase() end

        if CurrentTarget then
            Stay:UpdateEngagement(CurrentTarget)
            local valid, reason = EvaluateTarget(CurrentTarget)
            local gone = not CurrentTarget:IsDescendantOf(Players)
            if valid and not gone then
                TargetInvalidSince = nil
                CurrentTargetRoot = CurrentTarget.Character
                    and CurrentTarget.Character:FindFirstChild("HumanoidRootPart")
                local th = CurrentTarget.Character and CurrentTarget.Character:FindFirstChildOfClass("Humanoid")
                if th and th.MaxHealth > 0 and th.Health > 0 and th.Health / th.MaxHealth <= WOUNDED_HP then
                    Wounded[CurrentTarget] = { Time = tick() }
                end
            elseif not gone and (reason == "no_character" or reason == "missing_parts") then
                -- low-HP players often flicker (respawn/teleport/reset): keep the lock for a moment instead of switching
                TargetInvalidSince = TargetInvalidSince or tick()
                if tick() - TargetInvalidSince > 3 then
                    ResetTarget()
                    TargetInvalidSince = nil
                end
            else
                ResetTarget()
                TargetInvalidSince = nil
            end
        end

        if CurrentTarget and TargetLockStart > 0
            and tick() - TargetLockStart >= Settings.LockTime then
            -- don't abandon a target that is low on health or being fought: keep chasing (hard cap: 2x lock time)
            local thum = CurrentTarget.Character and CurrentTarget.Character:FindFirstChildOfClass("Humanoid")
            local lowHp = thum and thum.MaxHealth > 0 and (thum.Health / thum.MaxHealth) <= 0.6
            local fighting = Stay.Combat and Stay.Combat.Engaged
            if (lowHp or fighting) and tick() - TargetLockStart < Settings.LockTime * 2 then
                -- keep target
            else
                if not IsWounded(CurrentTarget) then
                    TempSkipUntil[CurrentTarget] = tick() + TARGET_SKIP_TIME
                end
                ResetTarget()
                TargetInvalidSince = nil
            end
        end

        -- a wounded player came back near us while we chase someone else: go finish them
        if CurrentTarget and not IsWounded(CurrentTarget) and not Stay.Armed and tick() >= NextWoundedCheck then
            NextWoundedCheck = tick() + 0.5
            local myHRP = GetHRP(LocalPlayer)
            if myHRP then
                for plr in pairs(Wounded) do
                    if plr ~= CurrentTarget and IsWounded(plr) and select(1, EvaluateTarget(plr)) then
                        local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                        if hrp and (hrp.Position - myHRP.Position).Magnitude <= 400 then
                            ResetTarget()
                            SetTarget(plr)
                            break
                        end
                    end
                end
            end
        end

        if not CurrentTarget and not Stay.Armed then
            if tick() >= NextTargetSwitch then
                NextTargetSwitch = tick() + 0.5
                LastScanTime = tick()
                local nearest = GetNearestTarget()
                if nearest then
                    SetTarget(nearest)
                end
            end
        end

        if CurrentTarget and HopActive() and not Stay.Armed then
            HopPhase = "idle"
            HopInterruptedByDanger = false
        end

        if not CurrentTarget and LastScanTime >= TargetLostTime then
            if IsBountyAtRisk() then
                HopInterruptedByDanger = true
                if not HopActive() then
                    DoServerHop()
                end
            elseif not HopActive() and tick() >= HopCooldownUntil then
                DoServerHop()
            end
        end

        UpdateAimTarget()
        end)
        if not loopOk then
            LastCaughtError = "Main loop error (auto recovered)"
        end
    end
end)

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.2)
    ChaseSample = nil
    StopTween()
    NoclipStop()
    SetCollide()
    local hum = GetHumanoid(LocalPlayer)
    if hum then
        pcall(function() hum:ChangeState(Enum.HumanoidStateType.Running) end)
    end
    UpdateAimTarget()
    local team = LocalPlayer.Team
    if not team or team.Name ~= Settings.SelectTeam then
        ApplyTeam(Settings.SelectTeam)
    end
    if HopActive() then
        HopPhase = "idle"
        ServerHopCache.List = nil
        TargetLockStart = tick()
        HopCooldownUntil = tick() + HOP_LANDING_GRACE
    end
end)

local function StartAntiSit()
local AntiSitBound = nil

local function UnsitNow()
    local hum = GetHumanoid(LocalPlayer)
    if not hum or not hum.Sit then return false end
    pcall(function() hum.Sit = false end)
    pcall(function() hum:ChangeState(Enum.HumanoidStateType.GettingUp) end)
    return true
end

local function BindAntiSit()
    local hum = GetHumanoid(LocalPlayer)
    if not hum or hum == AntiSitBound then return end
    AntiSitBound = hum
    hum:GetPropertyChangedSignal("Sit"):Connect(function()
        if hum.Sit then UnsitNow() end
    end)
    hum.StateChanged:Connect(function(_, newState)
        if newState == Enum.HumanoidStateType.Seated then UnsitNow() end
    end)
end

BindAntiSit()

LocalPlayer.CharacterAdded:Connect(function()
    AntiSitBound = nil
    task.wait(0.2)
    BindAntiSit()
end)

task.spawn(function()
    while true do
        task.wait(0.25)
        if GetHumanoid(LocalPlayer) ~= AntiSitBound then BindAntiSit() end
        UnsitNow()
    end
end)
end

StartAntiSit()

do
    local function CheckAndDestroyLava(v)
        if not v then return end
        local name = v.Name
        if name == "Lava" then
            pcall(function() v:Destroy() end)
        elseif name == "LavaParts" then
            local parent = v.Parent
            if parent then
                local pName = parent.Name
                if pName == "CircleIsland" or pName == "GhostShipInterior" then
                    local grandParent = parent.Parent
                    if grandParent and grandParent.Name == "Map" then
                        pcall(function() v:Destroy() end)
                    end
                end
            end
        end
    end

    local function SweepLava(container)
        if not container then return end
        pcall(function()
            for _, v in ipairs(container:GetDescendants()) do
                CheckAndDestroyLava(v)
            end
        end)
    end

    SweepLava(Workspace)
    SweepLava(ReplicatedStorage)

    pcall(function()
        Workspace.DescendantAdded:Connect(CheckAndDestroyLava)
        ReplicatedStorage.DescendantAdded:Connect(CheckAndDestroyLava)
    end)

    task.spawn(function()
        while true do
            task.wait(Settings.FPSBoost and 60 or 10)
            SweepLava(Workspace)
        end
    end)
end

Players.PlayerRemoving:Connect(function(plr)
    if plr == CurrentTarget then
        ResetTarget()
    end
end)

local ESPObjects = {}

local function RemoveESP(p)
    local objs = ESPObjects[p]
    if objs then
        if objs.Highlight and objs.Highlight.Parent then objs.Highlight:Destroy() end
        if objs.Billboard and objs.Billboard.Parent then objs.Billboard:Destroy() end
        ESPObjects[p] = nil
    end
    if p and p.Character then
        local h = p.Character:FindFirstChild("ESP_Highlight")
        if h then h:Destroy() end
        local head = p.Character:FindFirstChild("Head")
        if head then
            local bill = head:FindFirstChild("ESP_Billboard")
            if bill then bill:Destroy() end
        end
    end
end

local function CreateESP(p)
    if p == LocalPlayer then return end
    local char = p.Character
    if not char then return end
    local head = char:FindFirstChild("Head")
    if not head then return end

    local objs = ESPObjects[p] or {}
    ESPObjects[p] = objs

    if not objs.Highlight or not objs.Highlight.Parent then
        local h = char:FindFirstChild("ESP_Highlight")
        if not h then
            h = Instance.new("Highlight")
            h.Name = "ESP_Highlight"
            h.FillColor = Color3.fromRGB(255, 80, 80)
            h.OutlineColor = Color3.fromRGB(255, 255, 255)
            h.FillTransparency = 0.6
            h.OutlineTransparency = 0.1
            h.Adornee = char
            h.Parent = char
        end
        objs.Highlight = h
    end

    if not objs.Billboard or not objs.Billboard.Parent then
        local bill = head:FindFirstChild("ESP_Billboard")
        if not bill then
            bill = Instance.new("BillboardGui")
            bill.Name = "ESP_Billboard"
            bill.AlwaysOnTop = true
            bill.Size = UDim2.new(0, 200, 0, 110)
            bill.StudsOffset = Vector3.new(0, 4.5, 0)
            bill.Adornee = head
            bill.Parent = head

            local info = Instance.new("TextLabel", bill)
            info.Name = "InfoLabel"
            info.Size = UDim2.new(1, 0, 0, 80)
            info.BackgroundTransparency = 1
            info.TextStrokeTransparency = 0.1
            info.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            info.Font = Enum.Font.GothamBold
            info.TextSize = Settings.ESP_FontSize
            info.TextColor3 = Color3.fromRGB(255, 255, 255)
            info.RichText = true
            info.TextYAlignment = Enum.TextYAlignment.Bottom

            local barBG = Instance.new("Frame", bill)
            barBG.Name = "HealthBarBG"
            barBG.Size = UDim2.new(0, 110, 0, 5)
            barBG.Position = UDim2.new(0.5, -55, 0, 92)
            barBG.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            barBG.BorderSizePixel = 0
            local c1 = Instance.new("UICorner", barBG)
            c1.CornerRadius = UDim.new(1, 0)

            local barFG = Instance.new("Frame", barBG)
            barFG.Name = "HealthBarFG"
            barFG.Size = UDim2.new(1, 0, 1, 0)
            barFG.BackgroundColor3 = Color3.fromRGB(0, 255, 130)
            barFG.BorderSizePixel = 0
            local c2 = Instance.new("UICorner", barFG)
            c2.CornerRadius = UDim.new(1, 0)
        end
        objs.Billboard = bill
    end
end

local function UpdateESPText(p, bill, hum, hrp, myHRP)
    local info = bill:FindFirstChild("InfoLabel")
    local barBG = bill:FindFirstChild("HealthBarBG")
    local barFG = barBG and barBG:FindFirstChild("HealthBarFG")
    if info then
        local display = ""
        if Settings.ESP_ShowName then
            display = display .. "<b>" .. p.Name .. "</b>\n"
        end
        if Settings.ESP_ShowLevel then
            local lv = GetLevel(p) or "???"
            display = display .. '<font color="#FFFFFF">Lv. ' .. tostring(lv) .. '</font>\n'
        end
        if Settings.ESP_ShowPVP then
            if IsPVPEnabled(p) then
                display = display .. '<font color="#00FF88">' .. "[ PVP ON ]" .. '</font>\n'
            else
                display = display .. '<font color="#FF4D4D">' .. "[ PVP OFF ]" .. '</font>\n'
            end
        end
        local line = ""
        if Settings.ESP_ShowHealth then
            line = '<font color="#FFFFFF">HP: ' .. math.floor(hum.Health) .. "/" .. math.floor(hum.MaxHealth) .. '</font> '
        end
        if Settings.ESP_ShowDistance and myHRP then
            line = line .. '<font color="#FFFFFF">[' .. math.floor((myHRP.Position - hrp.Position).Magnitude) .. 'm]</font>'
        end
        if line ~= "" then display = display .. line end
        info.Text = display
        info.TextSize = Settings.ESP_FontSize
    end
    if barBG and barFG then
        barBG.Visible = Settings.ESP_ShowHealth
        if Settings.ESP_ShowHealth then
            local pct = math.clamp(hum.Health / math.max(hum.MaxHealth, 1), 0, 1)
            barFG.Size = UDim2.fromScale(pct, 1)
            if pct > 0.5 then
                barFG.BackgroundColor3 = Color3.fromRGB(255 * (1 - pct) * 2, 255, 50)
            else
                barFG.BackgroundColor3 = Color3.fromRGB(255, 255 * pct * 2, 50)
            end
        end
    end
end

task.spawn(function()
    while true do
        task.wait(0.1)
        if Settings.ESP then
            local myHRP = GetHRP(LocalPlayer)
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer then
                    local char = p.Character
                    local head = char and char:FindFirstChild("Head")
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    local hum = char and char:FindFirstChildOfClass("Humanoid")
                    if head and hrp and hum and hum.Health > 0 then
                        CreateESP(p)
                        local objs = ESPObjects[p]
                        if objs and objs.Billboard then
                            UpdateESPText(p, objs.Billboard, hum, hrp, myHRP)
                        end
                    else
                        RemoveESP(p)
                    end
                end
            end
        end
    end
end)

Players.PlayerRemoving:Connect(function(p)
    RemoveESP(p)
end)

UI["AutoBounty"] = Boxes.Hunt:Toggle({
    Name = "Auto Bounty",
    Default = Settings.AutoBounty,
    Callback = function(value)
        Settings.AutoBounty = value
        if value then
            TargetLockStart = tick()
            StartChase()
            StartSkillLoop()
            InstallAimHooks()
        else
            StopChase()
            ResetTarget()
        end
    end
})

UI["LockTimeBounty"] = Boxes.Targeting:Slider({
    Name = "Lock Time",
    Min = 60,
    Max = 150,
    Default = Settings.LockTime,
    Step = 1,
    Callback = function(value)
        Settings.LockTime = value
    end
})

UI["HoldWeapon"] = Boxes.Weapon:Dropdown({
    Name = "Hold Weapon",
    Options = { "Melee", "Sword", "Blox Fruit", "Gun" },
    Default = Settings.HoldWeapon,
    AllowNone = false,
    SearchAfter = 8,
    Callback = function(v) Settings.HoldWeapon = v end
})

UI["SelectTeam"] = Boxes.Team:Dropdown({
    Name = "Select Team",
    Options = { "Pirates", "Marines" },
    Default = Settings.SelectTeam,
    AllowNone = false,
    SearchAfter = 8,
    Callback = function(v)
        Settings.SelectTeam = v
        if not ConfigLoading then
            ApplyTeam(v)
        end
    end
})

local WeaponSkillKeys = {
    Melee      = { "Z", "X", "C" },
    Sword      = { "Z", "X" },
    ["Blox Fruit"] = { "Z", "X", "C", "V", "F" },
    Gun        = { "Z", "X" }
}

local function AddSkillConfig(weaponTip, title, defaultSkills, idxPrefix)
    local keys = WeaponSkillKeys[weaponTip]
    UI[idxPrefix .. "Skills"] = Boxes["Skills" .. idxPrefix]:Dropdown({
        Name = title .. " Skills",
        Options = keys,
        Multi = true,
        Default = defaultSkills,
        SearchAfter = 8,
        Callback = function(value)
            local selected = {}
            if type(value) == "table" then
                for key, on in pairs(value) do
                    if on == true then
                        table.insert(selected, key)
                    elseif type(on) == "string" then
                        table.insert(selected, on)
                    end
                end
            elseif type(value) == "string" then
                local current = {}
                for _, key in ipairs(Settings[idxPrefix .. "Skills"] or {}) do
                    current[key] = true
                end
                current[value] = not current[value]
                for key, on in pairs(current) do
                    if on then table.insert(selected, key) end
                end
            end
            table.sort(selected)
            Settings[idxPrefix .. "Skills"] = selected
        end
    })
    UI[idxPrefix .. "V4Only"] = Boxes["Skills" .. idxPrefix]:Toggle({
        Name = title .. " · " .. "V4 Only",
        Desc = "Only cast this category's selected skills while transformed into V4",
        Default = Settings.V4Only[weaponTip],
        Callback = function(value) Settings.V4Only[weaponTip] = value == true end
    })
    local holds = Settings.Hold[weaponTip]
    for _, key in ipairs(keys) do
        if holds[key] ~= nil then
            UI[idxPrefix .. "Hold" .. key] = Boxes["Charge" .. idxPrefix]:Slider({
                Name = title .. " " .. key .. " Charge",
                Min = 0.1,
                Max = 1,
                Default = holds[key],
                Step = 0.1,
                Callback = function(value)
                    holds[key] = math.clamp(math.floor(value * 10 + 0.5) / 10, 0.1, 1)
                end
            })
        end
    end
end

AddSkillConfig("Melee", "Melee", { "Z", "X", "C" }, "Melee")
AddSkillConfig("Sword", "Sword", { "Z", "X" }, "Sword")
AddSkillConfig("Blox Fruit", "Fruit", { "X" }, "Fruit")
AddSkillConfig("Gun", "Gun", { "Z", "X" }, "Gun")

UI["FastAttack"] = Boxes.FastAttack:Toggle({
    Name = "Fast Attack",
    Default = Settings.FastAttack,
    Callback = function(value)
        Settings.FastAttack = value
    end
})

UI["FruitM1"] = Boxes.FastAttack:Toggle({
    Name = "Fruit M1",
    Default = false,
    Callback = function(value)
        Settings.FruitM1 = value
    end
})

UI["Dragonstorm"] = Boxes.FastAttack:Toggle({
    Name = "Dragonstorm",
    Default = false,
    Callback = function(value)
        Settings.Dragonstorm = value
    end
})

UI["VoidFruitM1"] = Boxes.FastAttack:Toggle({
    Name = "Void Fruit M1",
    Default = false,
    Callback = function(value)
        Settings.VoidFruitM1 = value
    end
})

UI["OneShotKitsune"] = Boxes.OneShot:Toggle({
    Name = "One Shot Kitsune (Fruit M1)",
    Desc = "Equip your fruit. Fires the fruit M1 one-shot at targets in range.",
    Default = false,
    Callback = function(value)
        Settings.OneShotKitsune = value
    end
})

UI["OneShotDelay"] = Boxes.OneShot:Dropdown({
    Name = "One Shot Speed",
    Options = { "0.05s (Fast)", "0.10s", "0.15s (Default)", "0.25s", "0.50s" },
    Default = Settings.OneShotDelay,
    AllowNone = false,
    SearchAfter = 8,
    Callback = function(v) Settings.OneShotDelay = v end
})

UI["OneShotTRex"] = Boxes.OneShot:Toggle({
    Name = "One Shot T-Rex",
    Desc = "Equip T-Rex. Fires the one-shot at targets in range.",
    Default = false,
    Callback = function(value)
        Settings.OneShotTRex = value
    end
})

UI["OneShotDragon"] = Boxes.OneShot:Toggle({
    Name = "One Shot Dragon",
    Desc = "Equip Dragon. Fires the one-shot at targets in range.",
    Default = false,
    Callback = function(value)
        Settings.OneShotDragon = value
    end
})

UI["AutoEnablePVP"] = Boxes.Assist:Toggle({
    Name = "Auto Enable PvP",
    Default = Settings.AutoEnablePVP,
    Callback = function(v)
        Settings.AutoEnablePVP = v
    end
})

UI["AutoHaki"] = Boxes.Assist:Toggle({
    Name = "Auto Buso",
    Default = Settings.AutoHaki,
    Callback = function(v)
        Settings.AutoHaki = v
    end
})

UI["AutoKen"] = Boxes.Assist:Toggle({
    Name = "Auto Ken",
    Default = Settings.AutoKen,
    Callback = function(v)
        Settings.AutoKen = v
    end
})

UI["AutoV3"] = Boxes.Assist:Toggle({
    Name = "Auto V3",
    Desc = "Auto use race V3 ability",
    Default = Settings.AutoV3,
    Callback = function(v)
        Settings.AutoV3 = v
    end
})

UI["AutoSoru"] = Boxes.Assist:Toggle({
    Name = "Auto Soru",
    Default = Settings.AutoSoru,
    Callback = function(v)
        Settings.AutoSoru = v
    end
})

UI["AutoFlee"] = Boxes.Flee:Toggle({
    Name = "Auto Flee",
    Default = Settings.AutoFlee,
    Callback = function(v)
        Settings.AutoFlee = v
    end
})

UI["AutoFleeHP"] = Boxes.Flee:Slider({
    Name = "Flee HP threshold (%)",
    Min = 1,
    Max = 100,
    Default = Settings.AutoFleeHP,
    Step = 1,
    Callback = function(v)
        Settings.AutoFleeHP = v
    end
})

UI["ESP"] = Boxes.ESPMain:Toggle({
    Name = "Enable ESP",
    Default = Settings.ESP,
    Callback = function(v)
        Settings.ESP = v
        if not v then
            for _, p in ipairs(Players:GetPlayers()) do RemoveESP(p) end
        end
    end
})

UI["ESP_ShowName"] = Boxes.ESPLabels:Toggle({
    Name = "Show Name",
    Default = Settings.ESP_ShowName,
    Callback = function(v) Settings.ESP_ShowName = v end
})

UI["ESP_ShowLevel"] = Boxes.ESPLabels:Toggle({
    Name = "Show Level",
    Default = Settings.ESP_ShowLevel,
    Callback = function(v) Settings.ESP_ShowLevel = v end
})

UI["ESP_ShowHealth"] = Boxes.ESPLabels:Toggle({
    Name = "Show Health",
    Default = Settings.ESP_ShowHealth,
    Callback = function(v) Settings.ESP_ShowHealth = v end
})

UI["ESP_ShowDistance"] = Boxes.ESPLabels:Toggle({
    Name = "Show Distance",
    Default = Settings.ESP_ShowDistance,
    Callback = function(v) Settings.ESP_ShowDistance = v end
})

UI["ESP_ShowPVP"] = Boxes.ESPLabels:Toggle({
    Name = "Show PvP State",
    Default = Settings.ESP_ShowPVP,
    Callback = function(v) Settings.ESP_ShowPVP = v end
})

UI["ESP_FontSize"] = Boxes.ESPStyle:Slider({
    Name = "Font Size",
    Min = 8,
    Max = 28,
    Default = Settings.ESP_FontSize,
    Step = 1,
    Callback = function(v) Settings.ESP_FontSize = v end
})

UI["ServerRegion"] = Boxes.Hop:Dropdown({
    Name = "Server Region",
    Options = { "Random", "Oregon", "Florida", "Texas", "California", "Hong Kong", "Germany", "Brazil", "Singapore", "India" },
    Default = Settings.ServerRegion,
    AllowNone = false,
    SearchAfter = 8,
    Callback = function(v) Settings.ServerRegion = v end
})

UI["HopPlayerRange"] = Boxes.Hop:Dropdown({
    Name = "Hop Player Range",
    Desc = "Only hop to servers within this player range",
    Options = { "1-12", "3-12", "5-12", "7-12", "9-12" },
    Default = Settings.HopPlayerRange,
    AllowNone = false,
    SearchAfter = 8,
    Callback = function(v)
        Settings.HopPlayerRange = v
        ApplyPlayerRange(v)
    end
})

UI["HopBountyRange"] = Boxes.Hop:Dropdown({
    Name = "Hop Bounty Range",
    Desc = "Only hop to servers above this bounty",
    Options = { "> 3M", "> 5M", "> 10M", "> 15M", "> 25M", "> 35M", "> 50M" },
    Default = Settings.HopBountyRange,
    AllowNone = false,
    SearchAfter = 8,
    Callback = function(v)
        Settings.HopBountyRange = v
        ApplyBountyRange(v)
    end
})

UI["MaxStaySeconds"] = Boxes.Hop:Slider({
    Name = "Max Stay Per Server (s)",
    Min = 60,
    Max = 1800,
    Default = Settings.MaxStaySeconds,
    Step = 30,
    Callback = function(v)
        Settings.MaxStaySeconds = v
    end
})

Boxes.Hop:Button({
    Name = "Manual Hop",
    Callback = function()
        HopPhase = "idle"
        ServerHopCache.List = nil
        DoServerHop()
    end
})

Boxes.ServerInfo:Paragraph({
    Name = "Current Server ID",
    Content = game.JobId
})

local HttpService = game:GetService("HttpService")
local CONFIG_FOLDER = "SovereignAutoBounty"
local LEGACY_CONFIG_FILE = CONFIG_FOLDER .. "/config.json"

local function GetAccountTag()
    local name = "unknown"
    local id = "0"
    if LocalPlayer then
        name = tostring(LocalPlayer.Name or name)
        if LocalPlayer.UserId then id = tostring(LocalPlayer.UserId) end
    end
    name = name:gsub("[^%w_%-]", "_")
    return name .. "_" .. id
end

local ACCOUNT_TAG = GetAccountTag()
local CONFIG_FILE = CONFIG_FOLDER .. "/config_" .. ACCOUNT_TAG .. ".json"
local CONFIG_FALLBACK_FILE = "SovereignAutoBounty_config_" .. ACCOUNT_TAG .. ".json"

local function EnsureConfigFolder()
    if type(isfolder) == "function" and type(makefolder) == "function" then
        if not isfolder(CONFIG_FOLDER) then
            pcall(makefolder, CONFIG_FOLDER)
        end
        return true
    end
    return false
end

local function ListToMap(list)
    local map = {}
    if type(list) == "table" then
        for _, key in ipairs(list) do map[key] = true end
    end
    return map
end

local SYNC_ITEMS = {
    { "AutoBounty", "toggle", function() return Settings.AutoBounty end },
    { "MeleeSkills", "multi", function() return ListToMap(Settings.MeleeSkills) end },
    { "SwordSkills", "multi", function() return ListToMap(Settings.SwordSkills) end },
    { "FruitSkills", "multi", function() return ListToMap(Settings.FruitSkills) end },
    { "GunSkills", "multi", function() return ListToMap(Settings.GunSkills) end },
    { "MeleeV4Only", "toggle", function() return Settings.V4Only.Melee end },
    { "SwordV4Only", "toggle", function() return Settings.V4Only.Sword end },
    { "FruitV4Only", "toggle", function() return Settings.V4Only["Blox Fruit"] end },
    { "GunV4Only", "toggle", function() return Settings.V4Only.Gun end },
    { "FPSBoost", "toggle", function() return Settings.FPSBoost end },
    { "WaterWalk", "toggle", function() return Settings.WaterWalk end },
    { "FastAttack", "toggle", function() return Settings.FastAttack end },
    { "FruitM1", "toggle", function() return Settings.FruitM1 end },
    { "Dragonstorm", "toggle", function() return Settings.Dragonstorm end },
    { "VoidFruitM1", "toggle", function() return Settings.VoidFruitM1 end },
    { "OneShotKitsune", "toggle", function() return Settings.OneShotKitsune end },
    { "OneShotDelay", "dropdown", function() return Settings.OneShotDelay end },
    { "OneShotTRex", "toggle", function() return Settings.OneShotTRex end },
    { "OneShotDragon", "toggle", function() return Settings.OneShotDragon end },
    { "AutoEnablePVP", "toggle", function() return Settings.AutoEnablePVP end },
    { "AutoHaki", "toggle", function() return Settings.AutoHaki end },
    { "AutoKen", "toggle", function() return Settings.AutoKen end },
    { "AutoV3", "toggle", function() return Settings.AutoV3 end },
    { "AutoSoru", "toggle", function() return Settings.AutoSoru end },
    { "AutoFlee", "toggle", function() return Settings.AutoFlee end },
    { "AutoFleeHP", "value", function() return Settings.AutoFleeHP end },
    { "HoldWeapon", "dropdown", function() return Settings.HoldWeapon end },
    { "SelectTeam", "dropdown", function() return Settings.SelectTeam end },
    { "ESP", "toggle", function() return Settings.ESP end },
    { "ESP_ShowName", "toggle", function() return Settings.ESP_ShowName end },
    { "ESP_ShowLevel", "toggle", function() return Settings.ESP_ShowLevel end },
    { "ESP_ShowHealth", "toggle", function() return Settings.ESP_ShowHealth end },
    { "ESP_ShowDistance", "toggle", function() return Settings.ESP_ShowDistance end },
    { "ESP_ShowPVP", "toggle", function() return Settings.ESP_ShowPVP end },
    { "ESP_FontSize", "value", function() return Settings.ESP_FontSize end },
    { "ServerRegion", "dropdown", function() return Settings.ServerRegion end },
    { "HopPlayerRange", "dropdown", function() return Settings.HopPlayerRange end },
    { "HopBountyRange", "dropdown", function() return Settings.HopBountyRange end },
    { "LockTimeBounty", "value", function() return Settings.LockTime end },
    { "MaxStaySeconds", "value", function() return Settings.MaxStaySeconds end },
    { "AutoLoadConfig", "toggle", function() return Settings.AutoLoadConfig end },
    { "AutoSaveConfig", "toggle", function() return Settings.AutoSaveConfig end }
}

for weaponTip, prefix in pairs({ Melee = "Melee", Sword = "Sword", ["Blox Fruit"] = "Fruit", Gun = "Gun" }) do
    local keys = WeaponSkillKeys[weaponTip]
    for _, key in ipairs(keys) do
        local id = prefix .. "Hold" .. key
        table.insert(SYNC_ITEMS, { id, "value", function()
            local holds = Settings.Hold[weaponTip]
            return holds and holds[key] or DEFAULT_SKILL_HOLD
        end })
    end
end

local function SetWidgetValue(widget, kind, value)
    local preferSelect = (kind == "dropdown" or kind == "multi")
    local order = preferSelect and { "Select", "Set" } or { "Set", "Select" }
    for _, name in ipairs(order) do
        local fn = widget[name]
        if type(fn) == "function" then
            if select(1, pcall(fn, widget, value)) then return true end
        end
    end
    return false
end

local function SyncUITo()
    for _, item in ipairs(SYNC_ITEMS) do
        local id, kind, getter = item[1], item[2], item[3]
        local widget = UI[id]
        if widget then
            local value = getter()
            if kind == "toggle" then
                value = value == true
            elseif type(value) == "table" then
                local list = {}
                for key, on in pairs(value) do
                    if on then list[#list + 1] = key end
                end
                value = list
            end
            SetWidgetValue(widget, kind, value)
        end
    end
end

local LastSaveError = nil
local LastSaveOk = false

function SaveConfig(silent)
    if type(writefile) ~= "function" then
        LastSaveError = "Executor does not support writefile"
        LastSaveOk = false
        return false
    end
    EnsureConfigFolder()
    for _, key in ipairs({ "BountyBase", "AutoBountyBountyBase", "AutoBountyEarned", "AutoBountyRunTime" }) do
        Settings[key] = nil
    end
    local ok, encoded = pcall(function() return HttpService:JSONEncode(Settings) end)
    if not ok then
        LastSaveError = "Serialize failed: " .. tostring(encoded)
        LastSaveOk = false
        return false
    end

    local ok2, err = pcall(writefile, CONFIG_FILE, encoded)
    if not ok2 then
        local ok3, err3 = pcall(writefile, CONFIG_FALLBACK_FILE, encoded)
        if ok3 then
            CONFIG_FILE = CONFIG_FALLBACK_FILE
            ok2, err = true, nil
        else
            err = tostring(err) .. " / fallback failed too: " .. tostring(err3)
        end
    end

    if ok2 then
        LastSaveError = nil
        LastSaveOk = true
    else
        LastSaveError = tostring(err)
        LastSaveOk = false
    end

    return ok2 == true
end

local function LoadConfig(silent)
    if type(isfile) ~= "function" or type(readfile) ~= "function" then
        return false
    end
    local source = CONFIG_FILE
    if not isfile(CONFIG_FILE) then
        if type(isfile) == "function" and isfile(CONFIG_FALLBACK_FILE) then
            source = CONFIG_FALLBACK_FILE
        elseif isfile(LEGACY_CONFIG_FILE) then
            source = LEGACY_CONFIG_FILE
        else
            return false
        end
    end
    local ok, raw = pcall(readfile, source)
    if not ok or type(raw) ~= "string" or raw == "" then
        return false
    end
    local ok2, data = pcall(function() return HttpService:JSONDecode(raw) end)
    if not ok2 or type(data) ~= "table" then
        return false
    end

    ApplyConfigTable(data)

    ApplyPlayerRange(Settings.HopPlayerRange)
    ApplyBountyRange(Settings.HopBountyRange)

    local loadedVersion = tonumber(data.ConfigVersion) or 1
    if loadedVersion < 2 then
        for _, holds in pairs(Settings.Hold) do
            for key in pairs(holds) do
                holds[key] = DEFAULT_SKILL_HOLD
            end
        end
        Settings.ConfigVersion = 2
    end
    ConfigLoading = true
    SyncUITo()
    ConfigLoading = false
    if source ~= CONFIG_FILE then
        SaveConfig(true)
    end
    return true
end

UI["WaterWalk"] = Boxes.Performance:Toggle({
    Name = "Water Walk / Water Protection",
    Desc = "Thickens the water plane and protects chase/Soru destinations",
    Default = Settings.WaterWalk,
    Callback = function(value)
        Settings.WaterWalk = value == true
        Sov:ApplyWaterWalk(Settings.WaterWalk)
    end
})

UI["FPSBoost"] = Boxes.Performance:Toggle({
    Name = "FPS Boost",
    Desc = "Simplifies map and effects with frame-batched processing",
    Default = Settings.FPSBoost,
    Callback = function(value)
        Settings.FPSBoost = value == true
        Stay.Performance:SetEnabled(Settings.FPSBoost)
    end
})
Stay.Performance:SetEnabled(Settings.FPSBoost)

UI["AutoSaveConfig"] = Boxes.Config:Toggle({
    Name = "Auto Save On Change",
    Default = Settings.AutoSaveConfig,
    Callback = function(v)
        Settings.AutoSaveConfig = v
    end
})

UI["AutoLoadConfig"] = Boxes.Config:Toggle({
    Name = "Auto Load On Start",
    Default = Settings.AutoLoadConfig,
    Callback = function(v)
        Settings.AutoLoadConfig = v
    end
})

Boxes.Config:Button({
    Name = "Save Config",
    Callback = function() SaveConfig(false) end
})

local ConfigExport = {}

do
    local KEYWORDS = {
        ["and"] = true, ["break"] = true, ["do"] = true, ["else"] = true, ["elseif"] = true,
        ["end"] = true, ["false"] = true, ["for"] = true, ["function"] = true, ["if"] = true,
        ["in"] = true, ["local"] = true, ["nil"] = true, ["not"] = true, ["or"] = true,
        ["repeat"] = true, ["return"] = true, ["then"] = true, ["true"] = true,
        ["until"] = true, ["while"] = true
    }

    local function IsIdentifierKey(key)
        return type(key) == "string"
            and key:match("^[%a_][%w_]*$") ~= nil
            and not KEYWORDS[key]
    end

    local function Quote(text)
        local escaped = text:gsub("\\", "\\\\"):gsub("\"", "\\\"")
        escaped = escaped:gsub("%c", function(c)
            if c == "\n" then return "\\n" end
            if c == "\r" then return "\\r" end
            if c == "\t" then return "\\t" end
            return string.format("\\%d", string.byte(c))
        end)
        return "\"" .. escaped .. "\""
    end

    local function KeyToLua(key)
        if IsIdentifierKey(key) then return key end
        if type(key) == "number" and key == math.floor(key) then
            return "[" .. string.format("%d", key) .. "]"
        end
        return "[" .. Quote(tostring(key)) .. "]"
    end

    local ToLua

    ToLua = function(value, indent)
        local kind = type(value)
        if kind == "number" then
            if value ~= value or value == math.huge or value == -math.huge then return "0" end
            if value == math.floor(value) and math.abs(value) < 1e15 then
                return string.format("%d", value)
            end
            return string.format("%.14g", value)
        elseif kind == "boolean" then
            return value and "true" or "false"
        elseif kind == "string" then
            return Quote(value)
        elseif kind == "table" then
            local pad = string.rep("    ", indent)
            local inner = string.rep("    ", indent + 1)
            local parts = {}
            local arrayLen = #value
            for i = 1, arrayLen do
                parts[#parts + 1] = inner .. ToLua(value[i], indent + 1)
            end
            local keys = {}
            for key in pairs(value) do
                local isArrayIndex = type(key) == "number" and key >= 1 and key <= arrayLen
                    and key == math.floor(key)
                if not isArrayIndex then
                    keys[#keys + 1] = key
                end
            end
            table.sort(keys, function(a, b) return tostring(a) < tostring(b) end)
            for _, key in ipairs(keys) do
                parts[#parts + 1] = inner .. KeyToLua(key) .. " = " .. ToLua(value[key], indent + 1)
            end
            if #parts == 0 then return "{}" end
            return "{\n" .. table.concat(parts, ",\n") .. ",\n" .. pad .. "}"
        end
        return "nil"
    end

    function ConfigExport.Text(data)
        local clean = {}
        for key, value in pairs(data or {}) do
            if not IsSkippedConfigKey(key) then
                clean[key] = value
            end
        end
        return "getgenv().Config = " .. ToLua(clean, 0)
    end
end

local function CopyToClipboard(text)
    if type(text) ~= "string" then return false end
    local writers = {
        setclipboard,
        toclipboard,
        writeclipboard,
        type(syn) == "table" and syn.write_clipboard or nil
    }
    for _, writer in ipairs(writers) do
        if type(writer) == "function" then
            if select(1, pcall(writer, text)) then return true end
        end
    end
    return false
end

-- ═══════════════════════════════════════════════════════════════
-- (removed)
-- ═══════════════════════════════════════════════════════════════
local DISCORD_INVITE_URL = "https://discord.gg/uUGJbNNJSg"
Boxes.Community:Paragraph({
    Name = "Sovereign Autobounty",
    Content = "Join our server" .. "\n" .. DISCORD_INVITE_URL
})

Boxes.Community:Button({
    Name = "Copy Discord invite link",
    Icon = "copy",
    Style = "Primary",
    Callback = function()
        CopyToClipboard(DISCORD_INVITE_URL)
        pcall(function()
            Window:Notify({ Type = "Success", Title = "Sovereign Autobounty", Content = "Discord link copied", Duration = 3 })
        end)
    end
})

Boxes.Config:Button({
    Name = "Export Config to Clipboard",
    Desc = "Copies getgenv().Config = {...}; paste it before the loader line to import",
    AutoSave = false,
    Callback = function()
        CopyToClipboard(ConfigExport.Text(Settings))
    end
})

Boxes.Config:Button({
    Name = "Load Config",
    Callback = function() LoadConfig(false) end
})

Boxes.Config:Button({
    Name = "Delete Config",
    AutoSave = false,
    Callback = function()
        if type(delfile) == "function" and type(isfile) == "function" and isfile(CONFIG_FILE) then
            pcall(delfile, CONFIG_FILE)
        end
    end
})

local LastSavedSnapshot = nil
task.spawn(function()
    while true do
        task.wait(1)
        if Settings.AutoSaveConfig and type(writefile) == "function" and not ConfigLoading then
            local ok, snapshot = pcall(function() return HttpService:JSONEncode(Settings) end)
            if ok and snapshot then
                if snapshot ~= LastSavedSnapshot then
                    SaveConfig(true)
                    LastSavedSnapshot = snapshot
                end
            end
        end
    end
end)

Window:SelectTab(Tabs.Bounty)

if Settings.AutoLoadConfig then
    task.spawn(function()
        task.wait(0.5)
        LoadConfig(true)
        if InjectedConfig then
            ConfigLoading = true
            ApplyConfigTable(InjectedConfig)
            SyncUITo()
            ConfigLoading = false
            if Settings.AutoSaveConfig then
                SaveConfig(true)
            end
        end
        ConfigLoading = false
        TeamConfigReady = true
        local ok, snapshot = pcall(function() return HttpService:JSONEncode(Settings) end)
        if ok then LastSavedSnapshot = snapshot end
    end)
else
    ConfigLoading = false
    if InjectedConfig then
        ApplyConfigTable(InjectedConfig)
        SyncUITo()
    end
    TeamConfigReady = true
    if Settings.AutoSaveConfig then
        SaveConfig(true)
        local ok, snapshot = pcall(function() return HttpService:JSONEncode(Settings) end)
        if ok then LastSavedSnapshot = snapshot end
    end
end


if getgenv then getgenv().AutoBountyMainReady = true end

