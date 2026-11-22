wait(3)
do
    local v1 = getgenv()
    local v2 = v1.KaitunTeleportQueue
    if v2 and v2.Connection then
        v2.Connection:Disconnect()
    end
    local v3 = { Queued = false }
    v1.KaitunTeleportQueue = v3
    local v4 = if syn and syn.queue_on_teleport then syn.queue_on_teleport else queue_on_teleport
    local function v5(p6, p7)
        local v8 = type(p6)
        if v8 == "string" then
            return string.format("%q", p6)
        end
        if v8 == "boolean" then
            return tostring(p6)
        end
        if v8 == "number" and (p6 == p6) and (math.abs(p6) < math.huge) then
            return tostring(p6)
        end
        if v8 ~= "table" then
            return "nil"
        end
        p7 = p7 or {}
        if p7[p6] then
            return "nil"
        end
        p7[p6] = true
        local v9 = {}
        for v10, v11 in pairs(p6) do
            if type(v10) == "string" or type(v10) == "number" then
                table.insert(v9, "[" .. v5(v10, p7) .. "]=" .. v5(v11, p7))
            end
        end
        p7[p6] = nil
        return "{" .. table.concat(v9, ",") .. "}"
    end
    local function v12()
        local v13 = type(v1.Config) == "table" and v1.Config or {}
        if v13.AutoLoad ~= true or v3.Queued then
            return
        end
        if type(v4) ~= "function" then
            v3.Error = "executor has no teleport queue"
            return
        end
        local v14 = string.format("repeat task.wait() until game:IsLoaded() and game:GetService(\"Players\").LocalPlayer\n" .. "getgenv().Config=%s\ngetgenv().KaitunMovementConfig=%s\n" .. "Scripts_Type=\"KaitunBF\"\nscript_key=%s\ngetgenv().KurinianKey=%s\n" .. "loadstring(game:HttpGet(\"https://raw.githubusercontent.com/tokaruun/VapeHub/refs/heads/main/Loader.lua\"))()", v5(v13), v5(v1.KaitunMovementConfig), v5(v1.script_key or script_key), v5(v1.KurinianKey))
        local v15, v16 = pcall(v4, v14)
        v3.Queued = v15
        v3.Error = not v15 and tostring(v16) or nil
    end
    v3.Connection = game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(p17)
        if p17 == Enum.TeleportState.Started then
            v12()
        end
    end)
end
local v18, v19 = pcall(game.HttpGet, game, "https://raw.githubusercontent.com/tokaruun/VapeHub/refs/heads/main/kaibfver")
if not v18 or v19:gsub("%s+", "") ~= "0.0.1" then
    game.Players.LocalPlayer:Kick("Outdated Script")
end
wait(7)
do
    local v20 = getgenv()
    local _v21 = v20.KaitunFixedCamera
    if _v21 and _v21.Destroy then
        pcall(_v21.Destroy, _v21)
    end
    local v22 = game:GetService("RunService")
    local v23 = "KaitunBFFixedWorldCamera"
    local v24 = {
        Enabled = false,
        Saved = setmetatable({}, { __mode = "k" })
    }
    v20.KaitunFixedCamera = v24
    v24.SetEnabled = function(p25, p26, p27, p28)
        local v29 = workspace.CurrentCamera
        if p26 and not v29 then
            return false
        end
        if p26 then
            if not p25.Enabled or typeof(p27) == "CFrame" then
                p25.Frame = typeof(p27) == "CFrame" and p27 or v29.CFrame
                p25.Focus = v29.Focus
            end
            p25.Enabled = true
        else
            p25.Enabled = false
            for v30, v31 in pairs(p25.Saved) do
                pcall(function()
                    v30.CameraType = v31.kind
                    local v32 = game.Players.LocalPlayer.Character
                    local v33 = v32 and v32:FindFirstChildOfClass("Humanoid")
                    v30.CameraSubject = v31.subject and v31.subject.Parent and v31.subject or v33
                end)
            end
            table.clear(p25.Saved)
        end
        if not p28 and (type(v20.Config) == "table") then
            v20.Config.LockCamera = p25.Enabled
            if v20.Config.lockcamera ~= nil then
                v20.Config.lockcamera = p25.Enabled
            end
        end
        return true
    end
    v22:UnbindFromRenderStep(v23)
    v22:BindToRenderStep(v23, Enum.RenderPriority.Last.Value + 10, function()
        if not v24.Enabled then
            return
        end
        local v34 = workspace.CurrentCamera
        if not v34 then
            return
        end
        if not v24.Saved[v34] then
            v24.Saved[v34] = { kind = v34.CameraType, subject = v34.CameraSubject }
        end
        v34.CameraType = Enum.CameraType.Scriptable
        v34.CFrame = v24.Frame
        v34.Focus = v24.Focus
    end)
    v24.Destroy = function(p35)
        p35:SetEnabled(false, nil, true)
        v22:UnbindFromRenderStep(v23)
        if v20.KaitunFixedCamera == p35 then
            v20.KaitunFixedCamera = nil
        end
    end
    local v36 = v20.Config or {}
    local v37 = v36.LockCamera
    if v37 == nil then
        v37 = v36.lockcamera
    end
    if v37 == nil and (type(v36.Setup) == "table") then
        v37 = v36.Setup.FixedCamera
    end
    v24:SetEnabled(v37 == true)
end
task.spawn(function()
    local v346, v347 = pcall(function()
        (function()
            local v38 = getgenv().Config or {}
            local v39 = v38.Fps or {}
            local v40 = tonumber(v39.Cap) or 60
            local v41 = v39.Render3D
            if v41 == nil then
                v41 = v40 > 20
            end
            local v42 = {
                Render3D = v38.WhiteScreen ~= true and (v41 ~= false),
                FPSBoost = v39.Boost ~= false
            }
            local v43 = getgenv and getgenv() or _G
            if type(v43.FPSBoost) == "table" and (type(v43.FPSBoost.Destroy) == "function") then
                v43.FPSBoost:Destroy()
            end
            local v44 = game:GetService("RunService")
            local v45 = game:GetService("Players")
            local v46 = game:GetService("Lighting")
            local v47 = workspace:FindFirstChildOfClass("Terrain")
            local v48 = setmetatable({}, { __mode = "k" })
            local v49, v50 = {}, {}
            local v51 = setmetatable({}, { __mode = "k" })
            local v52, v53, v54 = 1, 0, 0
            local v55 = false
            local v56 = {
                Enabled = false,
                Config = {
                    Disable3D = false,
                    HideGeometry = false,
                    HideTextures = true,
                    SimplifyMaterials = true,
                    DisableEffects = true,
                    DisableWorldGui = false,
                    KeepCharacters = true,
                    KeepNames = { CoinContainer = true },
                    KeepInstances = {},
                    BatchSize = 80,
                    FrameBudget = 0.0015
                },
                Stats = { Processed = 0, Pending = 0, FailedWrites = 0 }
            }
            local function v57(p58, p59, p60)
                local v63, v64 = pcall(function()
                    local v61 = p58[p59]
                    if v61 == p60 then
                        return
                    end
                    local v62 = v48[p58]
                    if not v62 then
                        v62 = {}
                        v48[p58] = v62
                    end
                    if v62[p59] == nil then
                        v62[p59] = { Value = v61 }
                    end
                    p58[p59] = p60
                    v56.Stats.ChangedWrites = (v56.Stats.ChangedWrites or 0) + 1
                end)
                if not v63 then
                    v56.Stats.FailedWrites = v56.Stats.FailedWrites + 1
                    v56.Stats.LastError = tostring(v64)
                end
            end
            local function v65(p66)
                for v67, v68 in ipairs(v56.Config.KeepInstances) do
                    if typeof(v68) == "Instance" and (p66 == v68 or p66:IsDescendantOf(v68)) then
                        return true
                    end
                end
                local v69 = p66
                while v69 and (v69 ~= game) do
                    if v56.Config.KeepNames[v69.Name] then
                        return true
                    end
                    if v56.Config.KeepCharacters and v69:IsA("Model") then
                        if v45:GetPlayerFromCharacter(v69) or v69:FindFirstChildOfClass("Humanoid") then
                            return true
                        end
                    end
                    v69 = v69.Parent
                end
                return false
            end
            local function v70(p71)
                if not p71.Parent or v65(p71) then
                    return
                end
                local v72 = v56.Config
                if p71:IsA("BasePart") then
                    v57(p71, "CastShadow", false)
                    if v72.HideGeometry or (v72.Disable3D and not v55) then
                        v57(p71, "LocalTransparencyModifier", 1)
                    end
                    if v72.SimplifyMaterials then
                        v57(p71, "Material", Enum.Material.SmoothPlastic)
                        v57(p71, "Reflectance", 0)
                    end
                    if v72.HideTextures and p71:IsA("MeshPart") then
                        v57(p71, "TextureID", "")
                    end
                elseif v72.HideTextures and (p71:IsA("Decal") or p71:IsA("Texture")) then
                    v57(p71, "Transparency", 1)
                elseif v72.DisableEffects and (p71:IsA("ParticleEmitter") or p71:IsA("Trail") or p71:IsA("Beam") or p71:IsA("Smoke") or p71:IsA("Fire") or p71:IsA("Sparkles") or p71:IsA("Light") or p71:IsA("PostEffect")) then
                    v57(p71, "Enabled", false)
                elseif v72.DisableEffects and p71:IsA("Atmosphere") then
                    v57(p71, "Density", 0)
                    v57(p71, "Haze", 0)
                    v57(p71, "Glare", 0)
                elseif v72.DisableWorldGui and (p71:IsA("SurfaceGui") or p71:IsA("BillboardGui")) then
                    v57(p71, "Enabled", false)
                end
            end
            local function v73(p74)
                if v51[p74] then
                    return
                end
                v51[p74] = true
                v53 = v53 + 1
                v50[v53] = p74
            end
            v56.SetEnabled = function(p75, p76)
                p76 = p76 == true
                if p75.Enabled == p76 then
                    return
                end
                p75.Enabled = p76
                v54 = v54 + 1
                for v77, v78 in ipairs(v49) do
                    v78:Disconnect()
                end
                table.clear(v49)
                table.clear(v50)
                table.clear(v51)
                v52, v53 = 1, 0
                p75.Stats.Pending = 0
                if not p76 then
                    if v55 then
                        local v79 = pcall(function()
                            v44:Set3dRenderingEnabled(true)
                        end)
                        if v79 then
                            v55 = false
                        end
                    end
                    local v80 = v54
                    local v81 = 0
                    for v82, v83 in pairs(v48) do
                        for v84, v85 in pairs(v83) do
                            pcall(function()
                                v82[v84] = v85.Value
                            end)
                        end
                        v48[v82] = nil
                        v81 = v81 + 1
                        if v81 % 180 == 0 then
                            v44.Heartbeat:Wait()
                            if v54 ~= v80 then
                                return
                            end
                        end
                    end
                    return
                end
                p75.Stats.Processed, p75.Stats.FailedWrites = 0, 0
                p75.Stats.ChangedWrites, p75.Stats.LastError = 0, nil
                p75.Stats.RenderError = nil
                if p75.Config.Disable3D then
                    local v86, v87 = pcall(function()
                        v44:Set3dRenderingEnabled(false)
                    end)
                    v55 = v86
                    p75.Stats.RenderError = not v86 and tostring(v87) or nil
                    if not v86 then
                        warn("[FPSBoost] Cannot disable 3D rendering; hiding map geometry instead: " .. tostring(v87))
                    end
                end
                p75.Stats.RenderDisabled = v55
                pcall(function()
                    v57(settings().Rendering, "QualityLevel", Enum.QualityLevel.Level01)
                end)
                v57(v46, "GlobalShadows", false)
                v57(v46, "FogEnd", 1000000)
                if v47 then
                    v57(v47, "WaterWaveSize", 0)
                    v57(v47, "WaterWaveSpeed", 0)
                    v57(v47, "WaterReflectance", 0)
                end
                for v88, v89 in ipairs({ workspace, v46 }) do
                    table.insert(v49, v89.DescendantAdded:Connect(v73))
                    for v90, v91 in ipairs(v89:GetDescendants()) do
                        v73(v91)
                    end
                end
                table.insert(v49, v44.Heartbeat:Connect(function()
                    local v92, v93 = os.clock(), 0
                    local v94 = math.max(1, tonumber(p75.Config.BatchSize) or 180)
                    local v95 = math.max(0.0005, tonumber(p75.Config.FrameBudget) or 0.003)
                    while v52 <= v53 and (v93 < v94) and (os.clock() - v92 < v95) do
                        local v96 = v50[v52]
                        v50[v52] = nil
                        v52 = v52 + 1
                        v51[v96] = nil
                        local v97, v98 = pcall(v70, v96)
                        if not v97 then
                            p75.Stats.FailedObjects = (p75.Stats.FailedObjects or 0) + 1
                            p75.Stats.LastError = tostring(v98)
                        end
                        v93 = v93 + 1
                    end
                    p75.Stats.Processed = p75.Stats.Processed + v93
                    p75.Stats.Pending = math.max(0, v53 - v52 + 1)
                    if v52 > v53 then
                        v52, v53 = 1, 0
                    end
                end))
            end
            v56.Configure = function(p99, p100)
                local v101 = p99.Enabled
                if v101 then
                    p99:SetEnabled(false)
                end
                for v102, v103 in pairs(p100) do
                    p99.Config[v102] = v103
                end
                if v101 then
                    p99:SetEnabled(true)
                end
            end
            v56.Destroy = function(p104)
                p104:SetEnabled(false)
                if v43.FPSBoost == p104 then
                    v43.FPSBoost = nil
                end
            end
            v56.SetRender3D = function(p105, p106)
                local v107, v108 = pcall(function()
                    v44:Set3dRenderingEnabled(p106 == true)
                end)
                if v107 then
                    v55 = p106 ~= true
                end
                p105.Stats.RenderError = not v107 and tostring(v108) or nil
                if not v107 then
                    warn("[FPSBoost] Render3D: " .. tostring(v108))
                end
                return v107, v108
            end
            v56.ApplyConfig = function(p109, p110)
                assert(type(p110) == "table", "FPSBoost config must be a table")
                if p110.Render3D ~= nil then
                    assert(type(p110.Render3D) == "boolean", "Render3D must be true/false")
                    v42.Render3D = p110.Render3D
                end
                if p110.FPSBoost ~= nil then
                    assert(type(p110.FPSBoost) == "boolean", "FPSBoost must be true/false")
                    v42.FPSBoost = p110.FPSBoost
                end
                v39.Boost = v42.FPSBoost
                v39.Render3D = v42.Render3D
                v38.WhiteScreen = not v42.Render3D
                p109.Config.Disable3D = false
                p109:SetEnabled(v42.FPSBoost)
                return p109:SetRender3D(v42.Render3D)
            end
            v56.GetStatus = function(p111)
                return {
                    Enabled = p111.Enabled,
                    Processed = p111.Stats.Processed,
                    Pending = p111.Stats.Pending,
                    FailedWrites = p111.Stats.FailedWrites,
                    FailedObjects = p111.Stats.FailedObjects or 0,
                    RenderDisabled = v55,
                    RenderError = p111.Stats.RenderError,
                    LastError = p111.Stats.LastError
                }
            end
            v43.FPSBoost = v56
            v56:ApplyConfig(v42)
            return v56
        end)()
        if getgenv().Config and getgenv().Config.UI and (getgenv().Config.UI.Enabled == false) then
            local v112 = getgenv().VapeTracker
            if type(v112) == "table" and v112.Destroy then
                v112:Destroy()
            end
            return
        end
        (function()
            local v113 = {
                Title = "Status",
                ToggleKey = Enum.KeyCode.LeftControl,
                InventoryRefresh = 20,
                UpdateInterval = 1,
                BlurSize = 4,
                DimBackground = 0.35
            }
            local v114 = getgenv and getgenv() or _G
            local v115 = type(v114.Config) == "table" and v114.Config.UI or {}
            if type(v115) == "table" then
                v113.InventoryRefresh = math.max(5, tonumber(v115.InventoryRefresh) or v113.InventoryRefresh)
                v113.UpdateInterval = math.max(0.5, tonumber(v115.UpdateInterval) or v113.UpdateInterval)
                v113.BlurSize = tonumber(v115.BlurSize) or v113.BlurSize
                v113.DimBackground = tonumber(v115.DimBackground) or v113.DimBackground
            end
            local v116 = type(v114.VapeTracker) == "table" and v114.VapeTracker.StartedAt or nil
            if type(v114.VapeTracker) == "table" and v114.VapeTracker.Destroy then
                v114.VapeTracker:Destroy()
            end
            local v117 = game:GetService("Players")
            local v118 = game:GetService("ReplicatedStorage")
            local v119 = game:GetService("RunService")
            local v120 = game:GetService("UserInputService")
            local v121 = game:GetService("TweenService")
            repeat
                task.wait()
            until v117.LocalPlayer
            local v122 = v117.LocalPlayer
            local v123, v124, v125 = {}, true, v116 or os.clock()
            local v126 = Color3.fromRGB(183, 139, 250)
            local v127 = Color3.fromRGB(183, 139, 250)
            local v128 = Color3.fromRGB(160, 148, 177)
            local v129 = Color3.fromRGB(240, 233, 250)
            local function v130(p131, p132, p133)
                local v134 = Instance.new(p131)
                for v135, v136 in pairs(p132) do
                    v134[v135] = v136
                end
                v134.Parent = p133
                return v134
            end
            local v137 = v130("ScreenGui", {
                Name = "VapeTrackerUI",
                ResetOnSpawn = false,
                IgnoreGuiInset = true,
                DisplayOrder = 80,
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            }, v122:WaitForChild("PlayerGui"))
            local v138 = v130("Frame", {
                Name = "Backdrop",
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = Color3.fromRGB(5, 2, 10),
                BackgroundTransparency = 1 - v113.DimBackground,
                BorderSizePixel = 0,
                ZIndex = 0
            }, v137)
            local v139 = v130("BlurEffect", { Name = "VapeTrackerBlur", Size = v113.BlurSize, Enabled = true }, game:GetService("Lighting"))
            local v140 = v114.FPSBoost
            if type(v140) == "table" and v140.Config then
                v140.Config.KeepInstances = v140.Config.KeepInstances or {}
                table.insert(v140.Config.KeepInstances, v139)
            end
            local function v141(p142, p143)
                if type(p143) == "table" and (type(p143.Image) == "string") then
                    p142.Image = p143.Image
                    p142.ImageRectOffset = p143.ImageRectOffset or Vector2.zero
                    p142.ImageRectSize = p143.ImageRectSize or Vector2.zero
                    p142.Visible = true
                else
                    p142.Visible = false
                end
            end
            local v144 = {}
            local function v145(p146, p147, p148, p149)
                local v150 = v130("Frame", {
                    Position = p147,
                    Size = p148,
                    BackgroundColor3 = Color3.fromRGB(16, 12, 23),
                    BackgroundTransparency = 0.04,
                    BorderSizePixel = 0
                }, p146)
                v130("UICorner", {
                    CornerRadius = UDim.new(0, p149 and 2 or 8)
                }, v150)
                v130("UIStroke", {
                    Color = p149 and Color3.fromRGB(161, 113, 232) or Color3.fromRGB(110, 83, 141),
                    Thickness = p149 and 2 or 1,
                    Transparency = p149 and 0.18 or 0.9
                }, v150)
                return v150
            end
            local function v151(p152, p153, p154, p155, p156, p157, p158, p159)
                return v130("TextLabel", {
                    Position = UDim2.fromOffset(p154, p155),
                    Size = UDim2.fromOffset(p156, p157),
                    BackgroundTransparency = 1,
                    Text = p153,
                    Font = Enum.Font.GothamBold,
                    TextSize = p158 or 13,
                    TextColor3 = p159 or v129,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextTruncate = Enum.TextTruncate.AtEnd
                }, p152)
            end
            local v160 = v145(v137, UDim2.fromScale(0.5, 0.64), UDim2.fromOffset(760, 520), true)
            v160.Name = "CommandCenter"
            v160.AnchorPoint = Vector2.new(0.5, 0.5)
            v160.ClipsDescendants = true
            local v161 = v130("Frame", {
                Size = UDim2.new(0, 160, 1, 0),
                BackgroundColor3 = Color3.fromRGB(10, 7, 16),
                BorderSizePixel = 0
            }, v160)
            v130("UICorner", { CornerRadius = UDim.new(0, 2) }, v161)
            v130("Frame", { Position = UDim2.new(1, -2, 0, 0), Size = UDim2.new(0, 2, 1, 0), BackgroundColor3 = v161.BackgroundColor3, BorderSizePixel = 0 }, v161)
            local v162 = v145(v161, UDim2.fromOffset(18, 21), UDim2.fromOffset(36, 36))
            v162.BackgroundTransparency = 1
            local v163 = v130("ImageLabel", {
                Name = "HubLogo",
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                Image = "rbxthumb://type=Asset&id=102614001940598&w=150&h=150",
                ScaleType = Enum.ScaleType.Fit
            }, v162)
            v151(v161, "VAPE", 65, 20, 94, 23, 18, v129)
            v151(v161, v122.DisplayName, 65, 43, 100, 12, 9, v128)
            v151(v161, "Menu", 20, 84, 140, 18, 10, v128)
            local function v164(p165, p166)
                local v167 = v130("TextButton", {
                    Position = UDim2.fromOffset(16, p166),
                    Size = UDim2.fromOffset(128, 40),
                    Text = "   " .. p165,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Font = Enum.Font.GothamBold,
                    TextSize = 12,
                    TextColor3 = v128,
                    BackgroundColor3 = Color3.fromRGB(26, 19, 37),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0
                }, v161)
                v130("UICorner", { CornerRadius = UDim.new(0, 8) }, v167)
                return v167
            end
            local v168, v169 = v164("Overview", 112), v164("Inventory", 160)
            v151(v161, "Graphics", 20, 220, 140, 18, 10, v128)
            local function v170(p171, p172)
                local v173 = v130("TextButton", {
                    Position = UDim2.fromOffset(16, p172),
                    Size = UDim2.fromOffset(128, 40),
                    Text = p171,
                    Font = Enum.Font.GothamBold,
                    TextSize = 10,
                    TextColor3 = v129,
                    BackgroundColor3 = Color3.fromRGB(32, 24, 46),
                    BorderSizePixel = 0
                }, v161)
                v130("UICorner", { CornerRadius = UDim.new(0, 8) }, v173)
                table.insert(v123, v173.MouseEnter:Connect(function()
                    v121:Create(v173, TweenInfo.new(0.12), { BackgroundTransparency = 0.25 }):Play()
                end))
                table.insert(v123, v173.MouseLeave:Connect(function()
                    v121:Create(v173, TweenInfo.new(0.12), { BackgroundTransparency = 0 }):Play()
                end))
                return v173
            end
            local v174, v175 = v170("FPS BOOST", 248), v170("RENDER 3D", 296)
            local v176 = v170("LOCK CAMERA: OFF", 344)
            v151(v161, "Session", 20, 444, 120, 18, 10, v128)
            local v177 = v151(v161, "00:00:00", 20, 467, 120, 26, 18, v129)
            v177.Font = Enum.Font.RobotoMono
            local v178 = v151(v161, "", 20, 498, 120, 12, 8, v128)
            local v179, v180, v181 = {}, {}, {}
            v151(v160, "Vape Hub", 184, 22, 500, 16, 11, v128)
            local v182 = v151(v160, "Overview", 184, 43, 500, 30, 23, v129)
            local v183 = v130("TextButton", {
                Position = UDim2.fromOffset(704, 20),
                Size = UDim2.fromOffset(32, 28),
                BackgroundTransparency = 1,
                Text = "—",
                TextSize = 20,
                TextColor3 = v128,
                Font = Enum.Font.GothamBold
            }, v160)
            local v184 = v130("TextButton", {
                Name = "TrackerToggle",
                Position = UDim2.new(0, 18, 0.5, -20),
                Size = UDim2.fromOffset(104, 40),
                BackgroundColor3 = Color3.fromRGB(20, 14, 30),
                Text = "V  ·  Open",
                TextSize = 12,
                TextColor3 = v126,
                Font = Enum.Font.GothamBold,
                BorderSizePixel = 0,
                Visible = false,
                ZIndex = 8
            }, v137)
            v130("UICorner", { CornerRadius = UDim.new(0, 5) }, v184)
            v130("UIStroke", { Color = v126, Thickness = 1, Transparency = 0.3 }, v184)
            local function v185(p186)
                v160.Visible = p186
                v184.Visible = not p186
            end
            table.insert(v123, v184.Activated:Connect(function()
                v185(true)
            end))
            table.insert(v123, v183.Activated:Connect(function()
                v185(false)
            end))
            local v187 = v130("Frame", { Position = UDim2.fromOffset(184, 88), Size = UDim2.fromOffset(552, 408), BackgroundTransparency = 1 }, v160)
            local v188 = v130("Frame", { Position = UDim2.fromOffset(184, 88), Size = UDim2.fromOffset(552, 408), BackgroundTransparency = 1, Visible = false }, v160)
            local v189 = "Overview"
            local function v190(p191)
                v189 = p191
                v182.Text = p191
                v187.Visible = p191 == "Overview"
                v188.Visible = p191 == "Inventory"
                for v192, v193 in ipairs({ { v168, "Overview" }, { v169, "Inventory" } }) do
                    local v194 = v193[2] == p191
                    v193[1].BackgroundTransparency = v194 and 0 or 1
                    v193[1].BackgroundColor3 = v194 and Color3.fromRGB(57, 35, 83) or Color3.fromRGB(26, 19, 37)
                    v193[1].TextColor3 = v194 and v126 or v128
                end
            end
            table.insert(v123, v168.Activated:Connect(function()
                v190("Overview")
            end))
            table.insert(v123, v169.Activated:Connect(function()
                v190("Inventory")
            end))
            v190("Overview")
            local v195 = v145(v137, UDim2.new(0.5, 0, 0, 101), UDim2.fromOffset(620, 50), true)
            v195.Name = "TaskHUD"
            v195.AnchorPoint = Vector2.new(0.5, 0)
            v195.BackgroundColor3 = Color3.fromRGB(20, 14, 30)
            local v196 = v151(v195, "Waiting for task", 14, 7, 592, 36, 16, v129)
            v196.TextXAlignment = Enum.TextXAlignment.Center
            v196.TextYAlignment = Enum.TextYAlignment.Center
            v196.TextWrapped = true
            v196.TextTruncate = Enum.TextTruncate.None
            local v197 = v130("UIScale", { Scale = 1 }, v195)
            local v198 = {}
            for v199, v200 in ipairs({ "LEVEL / SEA", "RACE", "BELI", "FRAGMENTS" }) do
                local v201 = v145(v187, UDim2.fromOffset((v199 - 1) * 141, 0), UDim2.fromOffset(129, 86))
                v151(v201, v200, 14, 13, 101, 16, 9, v128)
                v198[v199] = v151(v201, "—", 14, 40, 101, 28, 16, v199 == 3 and v126 or v129)
            end
            local v202, v203, v204, v205 = v198[1], v198[2], v198[3], v198[4]
            local v206 = v145(v187, UDim2.fromOffset(0, 102), UDim2.fromOffset(552, 218))
            local v207 = v151(v206, "Equipment  ·  0 / 6", 16, 11, 520, 22, 12, v129)
            local v208 = v130("Frame", {
                Position = UDim2.fromOffset(16, 39),
                Size = UDim2.fromOffset(520, 2),
                BackgroundColor3 = Color3.fromRGB(49, 36, 65),
                BorderSizePixel = 0
            }, v206)
            local v209 = v130("Frame", { Size = UDim2.fromScale(0, 1), BackgroundColor3 = v126, BorderSizePixel = 0 }, v208)
            local v210 = {}
            for v211, v212 in ipairs({
            "Godhuman",
            "Cursed Dual Katana",
            "Skull Guitar",
            "Mirror Fractal",
            "Valkyrie Helm",
            "Pull Lever"
        }) do
                local v213 = v145(v206, UDim2.fromOffset(16 + ((v211 - 1) % 2 * 266), 52 + (math.floor((v211 - 1) / 2) * 52)), UDim2.fromOffset(254, 44))
                v144[v212] = v130("ImageLabel", {
                    Position = UDim2.fromOffset(8, 5),
                    Size = UDim2.fromOffset(34, 34),
                    BackgroundTransparency = 1,
                    ScaleType = Enum.ScaleType.Fit,
                    Image = ""
                }, v213)
                local v214 = v213:FindFirstChildOfClass("UIStroke")
                if v214 then
                    v214.Enabled = false
                end
                v210[v212] = v151(v213, v212, 50, 0, 194, 44, 11, v128)
            end
            local v215 = v145(v187, UDim2.fromOffset(0, 336), UDim2.fromOffset(552, 62))
            v151(v215, "Performance", 16, 10, 400, 16, 10, v128)
            local v216 = v151(v215, "FPS — / PING —", 16, 33, 350, 19, 12, v129)
            for v217 = 1, 20 do
                v180[v217] = v130("Frame", {
                    AnchorPoint = Vector2.new(0, 1),
                    Position = UDim2.fromOffset(386 + ((v217 - 1) * 7.2), 47),
                    Size = UDim2.fromOffset(4, 2),
                    BackgroundColor3 = v126,
                    BorderSizePixel = 0
                }, v215)
            end
            local v218 = v145(v188, UDim2.new(), UDim2.fromScale(1, 1))
            local v219 = v151(v218, "INVENTORY", 17, 12, 518, 25, 17, v129)
            local v220 = v151(v218, "Loading inventory…", 17, 43, 518, 22, 11, v128)
            local v221 = v130("TextBox", {
                Position = UDim2.fromOffset(16, 78),
                Size = UDim2.new(1, -32, 0, 34),
                BackgroundColor3 = Color3.fromRGB(29, 21, 42),
                BorderSizePixel = 0,
                PlaceholderText = "Search by item name…",
                PlaceholderColor3 = v128,
                Text = "",
                TextColor3 = v129,
                TextSize = 12,
                Font = Enum.Font.Gotham,
                ClearTextOnFocus = false,
                TextXAlignment = Enum.TextXAlignment.Left
            }, v218)
            v130("UICorner", { CornerRadius = UDim.new(0, 8) }, v221)
            v130("UIPadding", { PaddingLeft = UDim.new(0, 12) }, v221)
            local v222 = v130("ScrollingFrame", {
                Position = UDim2.fromOffset(16, 124),
                Size = UDim2.new(1, -32, 1, -140),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ScrollBarThickness = 3,
                ScrollBarImageColor3 = v126,
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                CanvasSize = UDim2.new()
            }, v218)
            v130("UIListLayout", { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder }, v222)
            local function v223()
                local v224 = v221.Text:lower()
                for v225, v226 in ipairs(v222:GetChildren()) do
                    if v226:IsA("Frame") then
                        v226.Visible = v224 == "" or (v226:GetAttribute("ItemName") or ""):lower():find(v224, 1, true) ~= nil
                    end
                end
            end
            table.insert(v123, v221:GetPropertyChangedSignal("Text"):Connect(v223))
            local v227 = {
                Gui = v137,
                StartedAt = v125,
                Stats = { InventoryCount = 0 },
                Main = nil,
                Task = nil
            }
            v227.SetMinimized = function(p228, p229)
                v185(not p229)
            end
            v227.SetStatus = function(p230, p231, p232)
                p230.Main = p231
                p230.Task = p232
            end
            v227.Destroy = function(p233)
                v124 = false
                for v234, v235 in ipairs(v123) do
                    v235:Disconnect()
                end
                v139:Destroy()
                if type(v140) == "table" and v140.Config then
                    for v236 = #(v140.Config.KeepInstances or {}), 1, -1 do
                        if v140.Config.KeepInstances[v236] == v139 then
                            table.remove(v140.Config.KeepInstances, v236)
                        end
                    end
                end
                v137:Destroy()
                if v114.VapeTracker == p233 then
                    v114.VapeTracker = nil
                end
            end
            v114.VapeTracker = v227
            local v237 = true
            table.insert(v123, v176.Activated:Connect(function()
                local v238 = v114.KaitunFixedCamera
                if v238 then
                    v238:SetEnabled(not v238.Enabled)
                end
            end))
            table.insert(v123, v174.Activated:Connect(function()
                local v239 = v114.FPSBoost
                if type(v239) ~= "table" or not v239.ApplyConfig then
                    v220.Text = "Execute FPSBoost.lua to enable this control"
                    return
                end
                v239:ApplyConfig({ FPSBoost = not v239.Enabled })
            end))
            table.insert(v123, v175.Activated:Connect(function()
                local v240 = v114.FPSBoost
                local v241 = not v237
                local v242, v243 = pcall(function()
                    if type(v240) == "table" and v240.ApplyConfig then
                        v240:ApplyConfig({ Render3D = v241 })
                    else
                        v119:Set3dRenderingEnabled(v241)
                    end
                end)
                if v242 then
                    v237 = v241
                else
                    v220.Text = "Render error: " .. tostring(v243)
                end
            end))
            table.insert(v123, v120.InputBegan:Connect(function(p244, p245)
                if not p245 and not v120:GetFocusedTextBox() and (p244.KeyCode == v113.ToggleKey) then
                    v185(not v160.Visible)
                end
            end))
            local v246, v247, v248
            local v249 = false
            local v250 = nil
            table.insert(v123, v160.InputBegan:Connect(function(p251)
                if p251.UserInputType == Enum.UserInputType.MouseButton1 and (p251.Position.Y - v160.AbsolutePosition.Y < 80) then
                    v246 = true
                    v249 = true
                    v247 = p251.Position
                    v248 = v160.Position
                end
            end))
            table.insert(v123, v120.InputEnded:Connect(function(p252)
                if p252.UserInputType == Enum.UserInputType.MouseButton1 then
                    v246 = false
                end
            end))
            table.insert(v123, v120.InputChanged:Connect(function(p253)
                if v246 and (p253.UserInputType == Enum.UserInputType.MouseMovement) then
                    local v254 = p253.Position - v247
                    v160.Position = UDim2.new(v248.X.Scale, v248.X.Offset + v254.X, v248.Y.Scale, v248.Y.Offset + v254.Y)
                end
            end))
            local v255 = v130("UIScale", { Scale = 1 }, v160)
            local function v256()
                local v257 = workspace.CurrentCamera
                if not v257 then
                    return
                end
                local v258 = v257.ViewportSize
                local v259 = math.max(0.2, math.min(1, (v258.X - 48) / 760, (v258.Y - 150) / 640))
                v255.Scale = v259
                v197.Scale = v259
                local v260 = 76
                v195.Position = UDim2.new(0.5, 0, 0, v260)
                if not v249 or v250 ~= v258 then
                    v160.Position = UDim2.new(0.5, 0, 0, math.min(v258.Y - (260 * v259) - 24, math.max(v260 + ((96 + 24 + 260) * v259), v258.Y * 0.58)))
                end
                v250 = v258
            end
            local function v261(p262)
                local v263 = tostring(math.floor(tonumber(p262) or 0))
                return v263:reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
            end
            local function v264(p265, p266)
                local v267 = v122:FindFirstChild("Data")
                local v268 = v267 and v267:FindFirstChild(p265)
                return v268 and v268.Value or p266
            end
            local v269
            local function v270()
                local v271 = setthreadidentity or setidentity or set_thread_identity
                local v272 = getthreadidentity or getidentity or get_thread_identity
                local v273 = v272 and v272()
                if v271 and v273 then
                    v271(2)
                end
                local v296, v297 = pcall(function()
                    local v274 = v118:FindFirstChild("ItemReplicationService")
                    assert(v274, "Item replication not ready")
                    local v275 = require(v274)
                    local v276 = require(v274:FindFirstChild("KEYS"))
                    local v277 = require(v118:FindFirstChild("ItemConfig"))
                    local v278 = (v275._UserCache or v275.UserCache or {})[v122.UserId]
                    local v279 = {}
                    if v278 then
                        for v280, v281 in pairs(v278:GetItems("Mastery") or {}) do
                            v279[v281.ItemId] = tonumber(v281.Value) or 0
                        end
                    end
                    local v282 = v269 or {}
                    if not v269 then
                        for v283, v284 in pairs(v277.dumpItems()) do
                            local v285, v286 = v284.Index, v284.Display
                            if v285 and v286 and v286.Sprite then
                                local v287 = (v285.DebugLabel or ""):gsub("%s*%[.-%]%s*$", "")
                                v282[v287] = v286.Sprite
                                if v286.Name then
                                    v282[v286.Name] = v286.Sprite
                                end
                            end
                        end
                        v282["Skull Guitar"] = v282["Skull Guitar"] or v282["Soul Guitar"]
                        v282.Godhuman = v282.Godhuman or v282.GodHuman
                        v269 = v282
                    end
                    local v288 = {}
                    for v289, v290 in pairs(v275:GetItems(v276.QUANTITY) or {}) do
                        if (tonumber(v290.Value) or 0) > 0 then
                            local v291, v292 = pcall(function()
                                return v277.match(v290.ItemId):unwrap()
                            end)
                            if v291 and v292 and v292.Index then
                                local v293 = v292.Index.DebugLabel:gsub("%s*%[.-%]%s*$", "")
                                local v294 = v292.Display or {}
                                local v295 = tostring(v294.Category or v292.Index.IdType or "Items")
                                table.insert(v288, {
                                    Name = v293,
                                    Count = v290.Value,
                                    Mastery = v279[v290.ItemId],
                                    Category = v295,
                                    Sprite = v294.Sprite
                                })
                            end
                        end
                    end
                    return { Items = v288, Icons = v282 }
                end)
                if v271 and v273 then
                    v271(v273)
                end
                return v296, v297
            end
            local v298 = {}
            task.spawn(function()
                while v124 do
                    local v299, v300 = v270()
                    local v301, v302 = false, false
                    local v303 = v118:FindFirstChild("Remotes")
                    local v304 = v303 and v303:FindFirstChild("CommF_")
                    if v304 then
                        local v305, v306 = pcall(function()
                            return v304:InvokeServer("CheckTempleDoor")
                        end)
                        v301, v302 = v305 and (type(v306) == "boolean"), v306 == true
                    end
                    if not v124 then
                        break
                    end
                    v227.Stats.LeverKnown = v301
                    v227.Stats.LeverDone = v302
                    if v299 then
                        local v307 = v300
                        v300 = v307.Items
                        local v308 = 0
                        for v309, v310 in pairs(v144) do
                            v141(v310, v307.Icons[v309])
                            if v310.Visible then
                                v308 = v308 + 1
                            end
                        end
                        v227.Stats.MilestoneIcons = v308
                        v298 = {}
                        table.sort(v300, function(p311, p312)
                            if p311.Category == p312.Category then
                                return p311.Name < p312.Name
                            end
                            return p311.Category < p312.Category
                        end)
                        for v313, v314 in ipairs(v222:GetChildren()) do
                            if v314:IsA("Frame") then
                                v314:Destroy()
                            end
                        end
                        for v315, v316 in ipairs(v300) do
                            v298[v316.Name] = true
                            local v317 = v145(v222, UDim2.new(), UDim2.new(1, -5, 0, 43))
                            v317.LayoutOrder = v315
                            v317:SetAttribute("ItemName", v316.Name)
                            local v318 = v130("Frame", {
                                Position = UDim2.fromOffset(7, 7),
                                Size = UDim2.fromOffset(29, 29),
                                BackgroundColor3 = Color3.fromRGB(47, 30, 70),
                                BorderSizePixel = 0
                            }, v317)
                            v130("UICorner", { CornerRadius = UDim.new(0, 8) }, v318)
                            local v319 = v130("ImageLabel", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ScaleType = Enum.ScaleType.Fit, Image = "" }, v318)
                            v141(v319, v316.Sprite)
                            if not v319.Visible then
                                local v320 = v151(v318, "?", 0, 0, 29, 29, 12, v128)
                                v320.TextXAlignment = Enum.TextXAlignment.Center
                            end
                            v151(v317, v316.Name, 45, 3, 208, 22, 12)
                            v151(v317, v316.Category:upper(), 45, 25, 208, 13, 8, v128)
                            local v321 = v316.Mastery and "Mas " .. v261(v316.Mastery) or "×" .. v261(v316.Count)
                            local v322 = v151(v317, v321, 0, 0, 115, 43, 11, v126)
                            v322.Position = UDim2.new(1, -130, 0, 0)
                            v322.TextXAlignment = Enum.TextXAlignment.Right
                        end
                        v223()
                        v227.Stats.InventoryCount = #v300
                        v227.Stats.InventoryError = nil
                        v219.Text = "Inventory  ·  " .. #v300 .. " items"
                        v220.Text = "Owned items · refreshed every " .. v113.InventoryRefresh .. "s"
                    else
                        v227.Stats.InventoryError = tostring(v300)
                        v220.Text = "Inventory unavailable · retrying"
                    end
                    task.wait(v113.InventoryRefresh)
                end
            end)
            local v323, v324, v325, v326 = 0, 0, 0, 0
            table.insert(v123, v119.Heartbeat:Connect(function(p327)
                v323 = v323 + 1
                v324 = v324 + p327
                v325 = v325 + p327
                if v324 >= 1 then
                    v326 = math.floor(v323 / v324 + 0.5)
                    v323 = 0
                    v324 = 0
                end
                if v325 < v113.UpdateInterval then
                    return
                end
                v325 = 0
                local v328 = workspace.CurrentCamera
                if v328 and (v328.ViewportSize ~= v250) then
                    v256()
                end
                local v329 = ({
                    [2753915549] = 1,
                    [79091703265657] = 2,
                    [4442272183] = 2,
                    [100117331123089] = 3,
                    [7449423635] = 3
                })[game.PlaceId]
                v202.Text = v261(v264("Level", 0)) .. " / SEA " .. tostring(v329 or "?")
                v203.Text = tostring(v264("Race", "—"))
                v204.Text = v261(v264("Beli", 0))
                v205.Text = v261(v264("Fragments", 0))
                local v330 = "—"
                pcall(function()
                    v330 = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
                end)
                v216.Text = "FPS " .. v326 .. "  /  PING " .. tostring(math.floor(tonumber(v330:match("[%d%.]+")) or 0)) .. " ms"
                local v331 = math.floor(os.clock() - v125)
                v177.Text = ("%02d:%02d:%02d"):format(v331 // 3600, v331 // 60 % 60, v331 % 60)
                v178.Text = ""
                for v332, v333 in ipairs(v179) do
                    v333.BackgroundColor3 = v331 % 60 >= (v332 - 1) * 5 and (v332 % 2 == 0 and v127 or v126) or Color3.fromRGB(48, 35, 65)
                end
                table.insert(v181, v326)
                if #v181 > 20 then
                    table.remove(v181, 1)
                end
                local v334 = 60
                for v335, v336 in ipairs(v181) do
                    v334 = math.max(v334, v336)
                end
                if v160.Visible then
                    for v337, v338 in ipairs(v180) do
                        local v339 = v181[v337 - (20 - #v181)]
                        v338.Size = UDim2.fromOffset(3, v339 and math.max(2, math.floor(v339 / v334 * 19)) or 2)
                        v338.BackgroundTransparency = v339 and 0.1 or 0.8
                    end
                end
                v196.Text = tostring(v227.Task or v114.CurrentSubTask or _G.CurrentSubTask or v114.CurrentMainTask or v114.PullLeverActiveTask or _G.statusnow or "Waiting for task")
                local v340 = v114.FPSBoost
                v174.Text = type(v340) == "table" and "FPS Boost: " .. (v340.Enabled and "ON" or "OFF") or "FPS Boost: unavailable"
                if type(v340) == "table" and v340.GetStatus then
                    v237 = not v340:GetStatus().RenderDisabled
                end
                v175.Text = "Render 3D: " .. (v237 and "ON" or "OFF")
                v176.Text = "Lock camera: " .. (v114.KaitunFixedCamera and v114.KaitunFixedCamera.Enabled and "ON" or "OFF")
                v174.BackgroundColor3 = type(v340) == "table" and v340.Enabled and Color3.fromRGB(57, 35, 83) or Color3.fromRGB(32, 24, 46)
                v175.BackgroundColor3 = v237 and Color3.fromRGB(49, 31, 72) or Color3.fromRGB(32, 24, 46)
                local v341 = 0
                for v342, v343 in pairs(v210) do
                    local v344 = v298[v342] or (v342 == "Skull Guitar" and v298["Soul Guitar"]) or (v342 == "Godhuman" and v298.GodHuman) or (v342 == "Pull Lever" and v227.Stats.LeverDone)
                    local v345 = v342 == "Pull Lever" and v227.Stats.LeverKnown or (v342 ~= "Pull Lever" and (v227.Stats.InventoryError == nil) and (v227.Stats.InventoryCount > 0))
                    v343.Text = (v344 and "✓ " or "") .. v342
                    v343.TextColor3 = v344 and v126 or v128
                    v343.Parent.BackgroundColor3 = v344 and Color3.fromRGB(44, 28, 64) or Color3.fromRGB(26, 19, 37)
                    if v344 then
                        v341 = v341 + 1
                    end
                end
                v207.Text = "Equipment  ·  " .. v341 .. " / 6"
                v209.Size = UDim2.fromScale(v341 / 6, 1)
            end))
            v256()
            return v227
        end)()
    end)
    if not v346 then
        getgenv().__KaitunUIError = tostring(v347)
        warn("[Kaitun UI] " .. tostring(v347))
    else
        getgenv().__KaitunUIError = nil
    end
end)
LocalPlayer = game.Players.LocalPlayer
local v348 = LocalPlayer
getgenv().AutoCakePrince = false
pcall(function()
    setmetatable(_G, {
        __newindex = function(p349, p350, p351)
            if p350 == "Stop" and (p351 == true) then
                rawset(p349, p350, false)
                return
            end
            rawset(p349, p350, p351)
        end
    })
    _G.Stop = false
end)
if not getgenv()._FloatProtectHook then
    getgenv()._FloatProtectHook = true
    pcall(function()
        local v352
        v352 = hookmetamethod(game, "__namecall", function(p353, ...)
            local v354 = getnamecallmethod()
            if (v354 == "Destroy" or v354 == "destroy") and (typeof(p353) == "Instance") and (p353.Name == "GodmaxFloat") and not getgenv()._AllowFloatDestroy then
                return nil
            end
            return v352(p353, ...)
        end)
    end)
end
do
    getgenv()._kaitun_attackHeight = nil
    local function v355()
        return type(getgenv()._kaitun_attackHeight) == "number" and getgenv()._kaitun_attackHeight or 15
    end
    local v356 = 15
    getgenv()._KaitunScriptId = (getgenv()._KaitunScriptId or 0) + 1
    local v357 = getgenv()._KaitunScriptId
    local v358 = {
        "BringConnV6",
        "BringConnV5",
        "BringConnV4",
        "BringConn",
        "_GodmaxNoclipConn",
        "PlayerNoclipConn",
        "NoclipConnection",
        "FastAttackConnection",
        "_AnchorLockConn",
        "GrabConn"
    }
    for v359, v360 in ipairs(v358) do
        if getgenv()[v360] then
            pcall(function()
                getgenv()[v360]:Disconnect()
            end)
            getgenv()[v360] = nil
        end
    end
    local v361 = {
        "FA_S1",
        "FA_S2",
        "FA_S3",
        "_KaitunMainTask",
        "_MonitorTask"
    }
    for v362, v363 in ipairs(v361) do
        if getgenv()[v363] then
            pcall(function()
                task.cancel(getgenv()[v363])
            end)
            getgenv()[v363] = nil
        end
    end
    local v364 = game:GetService("UserInputService")
    local v365 = game:GetService("TweenService")
    local v366 = game:GetService("RunService")
    local v367 = game:GetService("Players")
    local v368 = game:GetService("CoreGui")
    local v369 = game:GetService("StarterGui")
    local v370 = game:GetService("Stats")
    local v371 = game:GetService("HttpService")
    local v372 = typeof(getgenv) == "function" and getgenv() or _G
    local function func_373()
        return v372
    end
    _G.getgenv = func_373
    _G.statusnow = _G.statusnow or "Loading..."
    pcall(function()
        local v374 = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
        local v375 = v374 and v374:FindFirstChild("KaitunMiniStatus")
        if v375 then
            v375:Destroy()
        end
    end)
    status = function(p376)
        p376 = tostring(p376 or "")
        _G.statusnow = p376
        local v377 = func_373().VapeTracker
        if type(v377) == "table" and v377.SetStatus then
            local v378 = func_373().CurrentMainTask or _G.CurrentMainTask or p376
            local v379 = func_373().CurrentSubTask or _G.CurrentSubTask
            v377.SetStatus(v377, v378, v379 and (v379 ~= "") and v379 or v378)
        end
    end
    setmilestone = function(p380, p381) end
    _G.SetKaitunStatus = status
    _G.SetKaitunMilestone = setmilestone
    pcall(function()
        local v382 = game:GetService("Players").LocalPlayer
        local v383 = v382 and v382.Character
        if v383 then
            for v384, v385 in ipairs(v383:GetDescendants()) do
                if v385:IsA("BodyVelocity") or v385:IsA("BodyPosition") or v385:IsA("BodyGyro") or v385:IsA("AlignPosition") then
                    pcall(function()
                        v385:Destroy()
                    end)
                end
            end
            local v386 = v383:FindFirstChildOfClass("Humanoid")
            if v386 then
                v386.PlatformStand = false
            end
        end
    end)
    pcall(function()
        if TweenInstance then
            TweenInstance:Cancel()
        end
    end)
end
getgenv()._KaitunScriptId = (getgenv()._KaitunScriptId or 0) + 1
local v387 = getgenv()._KaitunScriptId
Config = Config or getgenv().Config or {}
if type(getgenv().Config) ~= "table" then
    getgenv().Config = Config
end
if Config and Config.Setup then
    if Config.Setup.AttackYOffset == nil then
        Config.Setup.AttackYOffset = 22
    end
    if Config.Setup.TweenSpeed == nil then
        Config.Setup.TweenSpeed = 185
    end
    if Config.Setup.BypassTPThreshold == nil then
        Config.Setup.BypassTPThreshold = 2500
    end
    getgenv().Config.BypassTPThreshold = Config.Setup.BypassTPThreshold
    getgenv()._kaitun_attackHeight = Config.Setup.AttackYOffset
    attackHeight = getgenv()._kaitun_attackHeight
end
timeee = os.time()
pcall(function()
    local v388 = game:GetService("CoreGui"):WaitForChild("RobloxPromptGui", 10)
    local v389 = v388 and v388:WaitForChild("promptOverlay", 10)
    if v389 then
        local function v390(p391)
            if p391 and (p391.Name == "ErrorPrompt") then
                warn("[AutoRejoin] Phat hien ErrorPrompt mat ket noi! Tu dong teleport rejoin sau 4s...")
                task.spawn(function()
                    task.wait(4)
                    local v392 = game:GetService("TeleportService")
                    local v393 = game.Players.LocalPlayer
                    pcall(function()
                        v392:Teleport(2753915549, v393)
                    end)
                end)
            end
        end
        v389.ChildAdded:Connect(v390)
        for v394, v395 in ipairs(v389:GetChildren()) do
            v390(v395)
        end
    end
end)
game:GetService("TeleportService").TeleportInitFailed:Connect(function(p396, p397, p398)
    warn("[TeleportInitFailed] " .. tostring(p397) .. ": " .. tostring(p398))
end)
local v399 = game.Players.LocalPlayer
local v400, v401, v402, v403
local function v404()
    if v401 and v402 and v403 then
        return true
    end
    pcall(function()
        local v405 = game:GetService("ReplicatedStorage")
        v400 = v400 or v405:WaitForChild("ItemReplicationService", 10)
        v401 = v401 or (v400 and require(v400))
        v402 = v402 or (v400 and require(v400.KEYS))
        v403 = v403 or require(v405:WaitForChild("ItemConfig", 10))
    end)
    return v401 ~= nil and (v402 ~= nil) and (v403 ~= nil)
end
local function v406()
    local v407 = {}
    if not v404() then
        return v407
    end
    local v408 = tick() + 5
    while v401.IsInitialized ~= true and (tick() < v408) do
        task.wait()
    end
    local v409, v410 = pcall(function()
        return v401:GetItems(v402.QUANTITY)
    end)
    if v409 and v410 then
        for v411, v412 in pairs(v410) do
            if v412.Value and (v412.Value > 0) then
                local v413, v414 = pcall(function()
                    return v403.match(v412.ItemId):unwrap().Index.DebugLabel
                end)
                if v413 and v414 then
                    local v415 = v414:gsub("%s*%[.-%]%s*$", "")
                    table.insert(v407, { Name = v415, Count = v412.Value, ItemId = v412.ItemId })
                end
            end
        end
    end
    return v407
end
local function v416(p417)
    local v418 = false
    local v419 = 0
    pcall(function()
        local v420 = v406()
        for v421, v422 in pairs(v420) do
            if v422.Name == p417 then
                v418 = true
                v419 = v422.Count or 1
                break
            end
        end
    end)
    return v418, v419
end
local function v423()
    local v424 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CheckTempleDoor")
    if v424 then
        return true
    else
        return false
    end
end
if not game:IsLoaded() then
    game.Loaded:Wait()
end
local v425 = game:GetService("TeleportService")
local v426 = game:GetService("HttpService")
local v427 = game:GetService("Players")
Hop = {}
getgenv().Hop = Hop
local v428 = getgenv and getgenv() or _G
v428.FailedJobIds = v428.FailedJobIds or {}
local v429 = v428.FailedJobIds
local v430 = {}
local v431 = false
local v432 = 3 * 60
Hop.BaseUrl = v428.HopApiBaseUrl or "https://memaybeo.kurinian-hub.xyz"
local function v433()
    local v434 = game:GetService("HttpService")
    local v435 = getgenv and getgenv() or _G
    local v436 = {}
    v436.Request = function(p437, p438, p439, p440)
        if type(p437) ~= "string" or not p437:match("^https://") then
            return nil, "HTTPS API URL required"
        end
        local v441 = "92b62b279e2d9869c739467fcfb54d01e5f35253c3f8e659cc4eaead65cf46de"
        if type(v441) ~= "string" or #v441 < 32 then
            return nil, "Set HopApiKey first"
        end
        local v442 = syn and syn.request or http_request or request or (http and http.request)
        if type(v442) ~= "function" then
            return nil, "HTTP request unavailable"
        end
        local v443 = {
            Url = p437:gsub("/+$", "") .. p439,
            Method = p438,
            Headers = { ["Content-Type"] = "application/json", Authorization = "Bearer " .. v441 }
        }
        if p440 then
            v443.Body = v434:JSONEncode(p440)
        end
        local v444, v445 = pcall(v442, v443)
        if not v444 or type(v445) ~= "table" then
            return nil, "API request failed"
        end
        if tonumber(v445.StatusCode) ~= 200 then
            return nil, "API HTTP " .. tostring(v445.StatusCode)
        end
        local v446, v447 = pcall(v434.JSONDecode, v434, v445.Body)
        if not v446 or type(v447) ~= "table" then
            return nil, "Invalid API response"
        end
        return v447
    end
    v436.Decode = function(p448, p449)
        if type(p449) ~= "string" or #p449 > 512 or not p449:match("^JID1%.[%w_-]+$") then
            return nil, "Invalid encoded Job ID"
        end
        local v450, v451 = v436.Request(p448, "POST", "/api/job-id/decode", { token = p449 })
        if not v450 then
            return nil, v451
        end
        local v452 = v450.jobId
        if type(v452) ~= "string" or #v452 ~= 36 or not v452:match("^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") then
            return nil, "Invalid decoded Job ID"
        end
        return v452
    end
    v436.Encode = function(p453, p454)
        local v455, v456 = v436.Request(p453, "POST", "/api/job-id/encode", { jobId = p454 })
        if not v455 then
            return nil, v456
        end
        return v455.token
    end
    v435.JobIdCodec = v436
    return v436
end
local v457 = v428.JobIdCodec or v433()
Hop.DecodeJobId = function(p458)
    return v457.Decode(Hop.BaseUrl, p458)
end
local v459 = game:GetService("Players")
local v460 = game:GetService("TeleportService")
local function v461(p462)
    return string.lower((tostring(p462):gsub("%s+", "")))
end
local function v463(p464)
    if type(p464) == "number" then
        return p464
    end
    return tonumber(tostring(p464 or ""):match("(%d+)")) or 99
end
local function v465(p466)
    local v467 = {}
    for v468 in tostring(p466 or ""):gmatch("(%d+)") do
        v467[#v467 + 1] = tonumber(v468)
    end
    if #v467 >= 3 then
        return v467[#v467 - 2] * 3600 + (v467[#v467 - 1] * 60) + v467[#v467]
    elseif #v467 == 2 then
        return v467[1] * 60 + v467[2]
    end
    return v467[1] or 0
end
local function v469(p470)
    if type(p470) ~= "table" then
        return nil
    end
    local v471 = p470.jobId or p470.jobid or p470.joinId
    if type(v471) ~= "string" or v471 == "" then
        return nil
    end
    local v472 = p470.sea
    if v472 ~= nil then
        v472 = tonumber(tostring(v472):match("(%d+)"))
    end
    return {
        token = v471,
        placeId = tonumber(p470.placeId or p470.placeid) or game.PlaceId,
        players = v463(p470.players),
        ageSeconds = v465(p470.age),
        sea = v472,
        moon = p470.moon
    }
end
local function v473(p474)
    local v475, v476 = v457.Request(Hop.BaseUrl, "GET", "/api/bloxfruit/" .. p474)
    if type(v475) ~= "table" then
        return nil, v476
    end
    local v477 = v475.data or v475.servers
    if type(v477) ~= "table" then
        return nil, "Invalid server list"
    end
    return v477
end
local function v478(p479)
    if p479.jobId == game.JobId or v429[p479.jobId] then
        return false
    end
    local v480 = false
    local v485, v486 = pcall(function()
        return v460.TeleportInitFailed:Connect(function(p481, p482, p483, p484)
            if p481 ~= v459.LocalPlayer then
                return
            end
            if p484 and (tonumber(p484) ~= tonumber(game.PlaceId)) then
                return
            end
            v480 = true
            v429[p479.jobId] = tick()
            if p482 == Enum.TeleportResult.GameFull then
                warn("[Hop] Server full")
            end
        end)
    end)
    if not v485 or not v486 then
        return false
    end
    local function v487(p488)
        local v489 = tick() + p488
        repeat
            task.wait(0.25)
        until v480 or tick() >= v489
        return not v480
    end
    local v491, v492 = pcall(function()
        local v490 = game:GetService("ReplicatedStorage"):WaitForChild("__ServerBrowser", 5)
        assert(v490, "Server browser unavailable")
        return v490:InvokeServer("teleport", p479.jobId)
    end)
    local v493 = false
    if v491 and (v492 ~= false) then
        v493 = v487(8)
    else
        v480 = false
        local v494 = pcall(function()
            v460:TeleportToPlaceInstance(game.PlaceId, p479.jobId, v459.LocalPlayer)
        end)
        if v494 then
            v493 = v487(3)
        end
    end
    v486:Disconnect()
    if not v493 then
        v429[p479.jobId] = tick()
    end
    return v493
end
Hop.API = function(p495, p496, p497)
    if v431 then
        return false
    end
    v431 = true
    p496 = tonumber(p496) or 12
    p497 = tonumber(p497) or 25
    local v520, v521 = pcall(function()
        local v498 = v461(p495)
        v430[v498] = v430[v498] or {}
        local v499 = v430[v498]
        local v500 = math.max(1, math.floor(p497 / 5))
        for v501 = 1, v500 do
            local v502, v503 = v473(v498)
            if v502 then
                local v504 = tonumber(tostring(workspace:GetAttribute("MAP") or ""):match("(%d+)"))
                local v505, v506, v507 = {}, {}, {}
                for v508, v509 in ipairs(v502) do
                    local v510 = v469(v509)
                    if v510 and (v510.placeId == tonumber(game.PlaceId)) and (not v504 or not v510.sea or v510.sea == v504) and (v510.ageSeconds < v432) and (v510.players > 2) and (v510.players < p496) then
                        local v511 = Hop.DecodeJobId(v510.token)
                        if v511 and not v505[v511] then
                            v505[v511] = true
                            v510.jobId = v511
                            if v511 ~= game.JobId and not v429[v511] then
                                local v512 = v499[v511] and v507 or v506
                                v512[#v512 + 1] = v510
                            end
                            v499[v511] = true
                        end
                    end
                end
                local function v513(p514, p515)
                    return p514.ageSeconds < p515.ageSeconds
                end
                table.sort(v506, v513)
                table.sort(v507, v513)
                for v516, v517 in ipairs({ v506, v507 }) do
                    for v518, v519 in ipairs(v517) do
                        if v478(v519) then
                            return true
                        end
                    end
                end
            elseif v503 then
                warn("[Hop] " .. tostring(v503))
            end
            if v501 < v500 then
                task.wait(5)
            end
        end
        return false
    end)
    v431 = false
    if not v520 then
        warn("[Hop] " .. tostring(v521))
    end
    return v520 and (v521 == true)
end
local v522 = 0
Hop.A = function(p523)
    if tick() - v522 < 15 then
        warn("[Hop.A] Đang trong cooldown 15s, không hop liên tục!")
        return false
    end
    v522 = tick()
    if not p523 then
        p523 = 8
    end
    local v524, v525 = pcall(function()
        return v426:JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
    end)
    local v526 = v524 and v525 and v525.data
    if type(v526) ~= "table" then
        return
    end
    for v527, v528 in pairs(v526) do
        if v528.playing < p523 and (v528.id ~= game.JobId) then
            game:GetService("ReplicatedStorage"):WaitForChild("__ServerBrowser"):InvokeServer("teleport", v528.id)
            break
        end
    end
end
a = function()
    for v529, v530 in next, require(game.ReplicatedStorage.GuideModule).Data do
        if v529 == "QuestData" then
            return true
        end
    end
    return false
end
c = function()
    if a() then
        for v531, v532 in next, require(game.ReplicatedStorage.GuideModule).Data.QuestData.Task do
            return v531
        end
    end
end
e = function()
    local v533 = {}
    if a() then
        for v534, v535 in next, require(game.ReplicatedStorage.GuideModule).Data.QuestData.Task do
            table.insert(v533, v534)
        end
    end
    return v533
end
local v536, v537
SeaIndexes = { "Main", "Dressrosa", "Zou" }
if workspace:GetAttribute("MAP") and (workspace:GetAttribute("MAP") == "Sea1") then
    v537 = "Main"
    v536 = 1
elseif workspace:GetAttribute("MAP") and (workspace:GetAttribute("MAP") == "Sea2") then
    v537 = "Dressrosa"
    v536 = 2
elseif workspace:GetAttribute("MAP") and (workspace:GetAttribute("MAP") == "Sea3") then
    v537 = "Zou"
    v536 = 3
else
    v537 = "Main"
    v536 = 1
    warn("[KaitunBloxFruit] MAP attribute không xác định: " .. tostring(workspace:GetAttribute("MAP")) .. " - fallback Sea1")
end
local function v538()
    local v539 = game.Players.LocalPlayer.Data.Level.Value
    if v536 == 1 and (v539 >= 700) then
        v539 = 699
    end
    if v536 == 2 and (v539 >= 1500) then
        v539 = 1499
    end
    local v540, v541, v542
    local v543 = 0
    for v544, v545 in pairs(require(game.ReplicatedStorage.Quests)) do
        for v546, v547 in pairs(v545) do
            for v548, v549 in pairs(v547.Task) do
                local v550, v551 = tostring(v548), tostring(v544)
                if v550 == "Military Soldiers" then
                    v550 = "Military Soldier"
                end
                local v552 = v550 == "Gladiator"
                if v539 >= v547.LevelReq and (v547.LevelReq >= v543) and (v547.Task[v548] > 1) and not table.find({ "BartiloQuest", "Trainees", "MarineQuest", "CitizenQuest" }, v551) and not v552 then
                    if v550 ~= "Factory Staff" then
                        v543, v540, v541, v542 = v547.LevelReq, v544, v550, v546
                    end
                end
            end
        end
    end
    return { NameMonster = v541, NameQuest = v540, ID = v542, LevelReq = v543 }
end
task.spawn(function()
    if setfpscap and getgenv().Config and getgenv().Config.Fps and getgenv().Config.Fps.Cap then
        setfpscap(getgenv().Config.Fps.Cap)
    end
end)
local v553 = {
    "Task1",
    "Task2",
    "Currencies",
    "Melees",
    "LiveTime",
    "DebugLine"
}
local v554 = { Instances = {} }
local v555 = true
local v556 = false
local v557 = game.Players.LocalPlayer
local v558 = {}
alert = function(p559, p560)
    print(p559)
    print(p560)
end
OldSessionTime = isfile(".tdif-" .. game.Players.LocalPlayer.Name) and tonumber(readfile(".tdif-" .. game.Players.LocalPlayer.Name)) or 0
repeat
    wait()
until game:FindFirstChild("CoreGui")
repeat
    wait()
until not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen")
repeat
    wait()
until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded")
repeat
    task.wait()
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("SetTeam", "Marines")
until game.Players.LocalPlayer.Character
repeat
    wait()
until game.Players.LocalPlayer.Character
repeat
    wait()
until game:IsLoaded() and game.Players.LocalPlayer
repeat
    wait()
until game:FindFirstChild("CoreGui")
repeat
    task.wait(0.2)
until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
repeat
    task.wait(0.2)
until game.Players.LocalPlayer:FindFirstChild("Data") and game.Players.LocalPlayer.Data:FindFirstChild("Level") and (game.Players.LocalPlayer.Data.Level.Value > 0)
spawn(function()
    game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("NewIslandLOD", 9999):Destroy()
    game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("IslandLOD", 9999):Destroy()
end)
local v561 = {
    "RawConstants",
    "Utilly",
    "QuestManager",
    "SpawnRegionLoader",
    "TweenController",
    "AttackController",
    "CombatController",
    "FunctionsHandler",
    "Hooks",
    "Debug",
    "Hop",
    "Storage"
}
StartTick = tick()
local v562 = "BacKyhub/Blox_Fruit/Assets/"
ConvertTo = function(p563, p564)
    return p563.new(p564.x, p564.y, p564.z)
end
SkipPlayer = true
LockAimPositionTo = function(p565)
    getgenv().LastestLockDate = os.time()
    getgenv().LockPosition = ConvertTo(CFrame, p565)
end
ScriptStorage = {
    IsInitalized = false,
    PlayerData = {},
    Melees = {},
    CurrentMeleeData = {},
    Enemies = {},
    Tools = {},
    Backpack = {},
    ReservedFruits = {},
    Connections = { LocalPlayer = {} },
    Task = {},
    Tracebacks = {},
    TaskController = {},
    TracebackUpdater = {},
    Interface = v554,
    NPCs = {},
    Map = {}
}
v459 = game.Players
LocalPlayer = v459.LocalPlayer
Character = v459.LocalPlayer.Character
Humanoid = Character:WaitForChild("Humanoid")
HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
PlayerGui = LocalPlayer:WaitForChild("PlayerGui", 10)
Lighting = game:GetService("Lighting")
Services = {}
setmetatable(Services, {
    __index = function(p566, p567)
        return game:GetService(p567)
    end
})
setmetatable(ScriptStorage.Enemies, {
    __index = function(p568, p569)
        return Services.Workspace.Enemies:FindFirstChild(p569)
    end
})
setmetatable(ScriptStorage.Map, {
    __index = function(p570, p571)
        return Services.Workspace.Map:FindFirstChild(p571) or Services.Workspace:FindFirstChild(p571)
    end
})
setmetatable(ScriptStorage.Tools, {
    __index = function(p572, p573)
        return LocalPlayer.Character:FindFirstChild(p573) or LocalPlayer.Backpack:FindFirstChild(p573)
    end
})
setmetatable(ScriptStorage.NPCs, {
    __index = function(p574, p575)
        if not p575 then
            return
        end
        return workspace.NPCs:FindFirstChild(p575) or game.ReplicatedStorage.NPCs:FindFirstChild(p575)
    end
})
CreateTraceback = function(p576, p577)
    table.insert(ScriptStorage.Tracebacks, GetCurrentDateTime() .. " ( " .. DispTime(os.time() - os.time(), true) .. " ) after execution | " .. p576 .. " | " .. p577)
end
Remotes = {}
BindedMeleeNPCNames = {
    BlackLeg = "Dark Step Teacher",
    Electro = "Mad Scientist",
    FishmanKarate = "Water Kung-fu Teacher",
    DragonClaw = "Sabi",
    Superhuman = "Martial Arts Master",
    DeathStep = "Phoeyu, the Reformed",
    SharkmanKarate = "Sharkman Teacher",
    DragonTalon = "Uzoth",
    ElectricClaw = "Previous Hero",
    Godhuman = "Ancient Monk"
}
MeleesTable = {
    "Black Leg",
    "Electro",
    "Fishman Karate",
    "Dragon Claw",
    "Superhuman",
    "Death Step",
    "Electric Claw",
    "Sharkman Karate",
    "Dragon Talon",
    "Godhuman",
    "SanguineArt"
}
GetMeleeNPC = function(p578)
    if not p578 then
        return nil
    end
    local v579 = BindedMeleeNPCNames and BindedMeleeNPCNames[p578]
    if not v579 then
        local v580 = string.lower(tostring(p578)):gsub("[^%w]", "")
        for v581, v582 in pairs(BindedMeleeNPCNames or {}) do
            if string.lower(v581):gsub("[^%w]", "") == v580 or string.lower(v582):gsub("[^%w]", "") == v580 then
                v579 = v582
                break
            end
        end
    end
    if not v579 then
        return nil
    end
    if workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild(v579) then
        return workspace.NPCs[v579], v579
    end
    if game:GetService("ReplicatedStorage"):FindFirstChild("NPCs") and game.ReplicatedStorage.NPCs:FindFirstChild(v579) then
        return game.ReplicatedStorage.NPCs[v579], v579
    end
    getgenv().__KaitunNPCFallback = getgenv().__KaitunNPCFallback or {}
    local v583 = getgenv().__KaitunNPCFallback
    local v584 = v583[v579]
    if v584 and (os.clock() < v584.untilAt) then
        if v584.object and v584.object.Parent then
            return v584.object, v579
        end
        if not v584.object then
            return nil, v579
        end
    end
    for v585, v586 in ipairs(workspace:GetDescendants()) do
        if v586.Name == v579 and (v586:IsA("Model") or v586:IsA("BasePart")) then
            v583[v579] = { object = v586, untilAt = os.clock() + 2 }
            return v586, v579
        end
    end
    v583[v579] = { untilAt = os.clock() + 2 }
    return nil, v579
end
GetNPCPosition = function(p587)
    if not p587 then
        return nil
    end
    if p587:IsA("BasePart") then
        return p587.CFrame
    end
    if p587:FindFirstChild("HumanoidRootPart") then
        return p587.HumanoidRootPart.CFrame
    end
    if p587:FindFirstChild("Head") then
        return p587.Head.CFrame
    end
    if p587.PrimaryPart then
        return p587.PrimaryPart.CFrame
    end
    local v588, v589 = pcall(function()
        return p587:GetPivot()
    end)
    if v588 and v589 then
        return v589
    end
    if p587.WorldPivot then
        return p587.WorldPivot
    end
    return nil
end
TweenToMeleeNPC = function(p590)
    local v591, v592 = GetMeleeNPC(p590)
    local v593 = v591 and GetNPCPosition(v591)
    if not v593 then
        print("[ Debug ] Cannot find NPC for melee:", p590, "NPC Name:", v592)
        return false
    end
    local v594 = _G.ActiveMeleeQuest
    if not v594 then
        _G.ActiveMeleeQuest = "Buying " .. tostring(p590)
    end
    pcall(function()
        if v562 and v562.AbandonQuest then
            v562.AbandonQuest()
        end
        Remotes.CommF_:InvokeServer("AbandonQuest")
    end)
    local v595 = (typeof(v593) == "CFrame" and v593 or CFrame.new(v593)) + Vector3.new(0, 3, 0)
    local v596 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    local v597 = v596 and (v596.Position - v595.Position).Magnitude or 5000
    local v598 = os.clock() + math.max(65, v597 / 150 + 15)
    while os.clock() < v598 do
        local v599 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not v599 then
            break
        end
        local v600 = (v599.Position - v595.Position).Magnitude
        if v600 <= 18 then
            task.wait(0.3)
            if not v594 then
                _G.ActiveMeleeQuest = nil
            end
            return true
        end
        if TweenController and TweenController.Create then
            TweenController.Create(v595)
        end
        task.wait(0.2)
    end
    if not v594 then
        _G.ActiveMeleeQuest = nil
    end
    local v601 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    return v601 and ((v601.Position - v595.Position).Magnitude <= 25)
end
local v602 = {}
setmetatable(Remotes, {
    __index = function(p603, p604)
        if p604 ~= "CommF_" then
            return Services.ReplicatedStorage.Remotes[p604]
        end
        local v615 = {
            InvokeServer = function(p605, ...)
                local v606, v607, v608 = ...
                if type(v606) == "string" and not v607 then
                    local v609 = nil
                    if string.find(v606, "Buy") == 1 then
                        v609 = string.gsub(v606, "Buy", "")
                    elseif v606 == "BlackbeardReward" and (v607 == "DragonClaw" or v608 == "2") then
                        v609 = "DragonClaw"
                    end
                    if v609 and BindedMeleeNPCNames and BindedMeleeNPCNames[v609] then
                        local v610 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local v611, v612 = GetMeleeNPC(v609)
                        local v613 = v611 and GetNPCPosition(v611)
                        local v614 = v610 and v613 and (v610.Position - (typeof(v613) == "CFrame" and v613.Position or v613)).Magnitude or 9999
                        if v614 > 25 then
                            TweenToMeleeNPC(v609)
                        end
                    end
                    if v606 == "BuyElectro" then
                        pcall(function()
                            Services.ReplicatedStorage.Remotes.CommF_:InvokeServer("ElectroQuestState")
                            task.wait(0.2)
                            Services.ReplicatedStorage.Remotes.CommF_:InvokeServer("ElectroQuestState")
                            task.wait(0.2)
                            Services.ReplicatedStorage.Remotes.CommF_:InvokeServer("AcceptElectroQuest")
                            task.wait(0.2)
                            Services.ReplicatedStorage.Remotes.CommF_:InvokeServer("DeliverLightningBolt")
                        end)
                        task.wait(0.2)
                    end
                end
                return Services.ReplicatedStorage.Remotes.CommF_:InvokeServer(...)
            end
        }
        return v615
    end
})
Tasks = {}
AwaitUntilPlayerLoaded = function(p616, p617)
    repeat
        task.wait()
    until p616.Character and p616.Character:FindFirstChildOfClass("Humanoid")
    repeat
        task.wait()
    until p616.Character and p616.Character:FindFirstChildOfClass("Humanoid") and (p616.Character.Humanoid.Health > 0)
end
AddPoint = function()
    local v618 = {}
    for v619, v620 in ipairs(LocalPlayer.Data.Stats:GetChildren()) do
        local v621 = v620 and v620:FindFirstChild("Level")
        if v621 then
            v618[v620.Name] = v621.Value
        end
    end
    local v622 = v618.Defense or 0
    local v623 = v618.Melee or 0
    local v624 = ScriptStorage.PlayerData.Level or 0
    local v625
    if v623 < MaxLevel then
        v625 = "Melee"
    elseif v622 < MaxLevel then
        v625 = "Defense"
    else
        v625 = "Sword"
    end
    Remotes.CommF_:InvokeServer("AddPoint", v625, 999)
end
RefreshPlayerData = function()
    pcall(function()
        if LocalPlayer and LocalPlayer:FindFirstChild("Data") then
            ScriptStorage.Connections = ScriptStorage.Connections or {}
            ScriptStorage.Connections.PlayerData = ScriptStorage.Connections.PlayerData or {}
            for v626, v627 in ipairs(LocalPlayer.Data:GetChildren()) do
                pcall(function()
                    ScriptStorage.PlayerData[v627.Name] = v627.Value
                end)
                if not ScriptStorage.Connections.PlayerData[v627.Name] then
                    ScriptStorage.Connections.PlayerData[v627.Name] = v627.Changed:Connect(function(p628)
                        ScriptStorage.PlayerData[v627.Name] = p628
                    end)
                end
            end
        end
    end)
end
SaveMeleeCache = function() end
RefreshRace = function()
    ScriptStorage.PlayerData.RaceLevel = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getRaceLevel")
end
RefreshInventory = function()
    ScriptStorage.Backpack2 = {}
    for v629, v630 in ipairs(v406()) do
        ScriptStorage.Backpack2[v630.Name] = v630
    end
    ScriptStorage.Backpack = ScriptStorage.Backpack2
end
SyncMeleeMasteryFromInventory = function()
    pcall(function()
        local v631 = game:GetService("ReplicatedStorage")
        local v632 = v631:FindFirstChild("ItemReplicationService")
        local v633 = v631:FindFirstChild("ItemConfig")
        if not v632 or not v633 then
            return
        end
        local v634 = require(v632)
        local v635 = require(v633)
        local v636 = game.Players.LocalPlayer
        local v637 = v634._UserCache and v634._UserCache[v636.UserId]
        if not v637 then
            return
        end
        local v638 = v637:GetItems("Mastery")
        if not v638 then
            return
        end
        for v639, v640 in pairs(v638) do
            if v640 and v640.ItemId then
                local v641 = tonumber(v640.Value) or 0
                local v642, v643 = pcall(function()
                    return v635.match(v640.ItemId):unwrap()
                end)
                if v642 and v643 and v643.Index and v643.Index.DebugLabel then
                    local v644 = tostring(v643.Index.DebugLabel):gsub("%s*%[.-%]%s*$", ""):gsub("^%s+", ""):gsub("%s+$", "")
                    for v645, v646 in ipairs(MeleesTable or {}) do
                        if string.lower(v644) == string.lower(v646) or string.lower(v644):gsub("[^%w]", "") == string.lower(v646):gsub("[^%w]", "") then
                            ScriptStorage.Melees[v646] = math.max(ScriptStorage.Melees[v646] or 0, v641)
                        end
                    end
                    if v644:find("Water Kung") or v644:find("Fishman") then
                        ScriptStorage.Melees["Fishman Karate"] = math.max(ScriptStorage.Melees["Fishman Karate"] or 0, v641)
                    elseif v644:find("Dragon Breath") or v644:find("Dragon Claw") then
                        ScriptStorage.Melees["Dragon Claw"] = math.max(ScriptStorage.Melees["Dragon Claw"] or 0, v641)
                    elseif v644:find("Dark Step") or v644:find("Black Leg") then
                        ScriptStorage.Melees["Black Leg"] = math.max(ScriptStorage.Melees["Black Leg"] or 0, v641)
                    elseif v644:find("Death Step") then
                        ScriptStorage.Melees["Death Step"] = math.max(ScriptStorage.Melees["Death Step"] or 0, v641)
                    elseif v644:find("Superhuman") then
                        ScriptStorage.Melees.Superhuman = math.max(ScriptStorage.Melees.Superhuman or 0, v641)
                    elseif v644:find("Electric Claw") then
                        ScriptStorage.Melees["Electric Claw"] = math.max(ScriptStorage.Melees["Electric Claw"] or 0, v641)
                    elseif v644:find("Electric") or v644:find("Electro") then
                        ScriptStorage.Melees.Electro = math.max(ScriptStorage.Melees.Electro or 0, v641)
                    end
                end
            end
        end
        SaveMeleeCache()
    end)
end
GetServerMasteryByName = function(p647)
    local v648 = nil
    pcall(function()
        local v649 = game:GetService("ReplicatedStorage")
        local v650 = v649:FindFirstChild("ItemReplicationService")
        local v651 = v649:FindFirstChild("ItemConfig")
        if not v650 or not v651 then
            return
        end
        local v652 = require(v650)
        local v653 = require(v651)
        local v654 = nil
        local v655 = v650:FindFirstChild("KEYS") and require(v650.KEYS)
        local v656 = v655 and (v655.MASTERY or v655.Mastery)
        if v656 then
            local v657, v658 = pcall(function()
                return v652:GetItems(v656)
            end)
            if v657 then
                v654 = v658
            end
        end
        if not v654 then
            local v659 = v652._UserCache and v652._UserCache[game.Players.LocalPlayer.UserId]
            v654 = v659 and v659:GetItems("Mastery")
        end
        if not v654 then
            return
        end
        local v660 = string.lower(tostring(p647)):gsub("[^%w]", "")
        for v661, v662 in pairs(v654) do
            if v662 and v662.ItemId then
                local v663, v664 = pcall(function()
                    return v653.match(v662.ItemId):unwrap()
                end)
                if v663 and v664 and v664.Index and v664.Index.DebugLabel then
                    local v665 = tostring(v664.Index.DebugLabel)
                    local v666 = string.lower(v665):gsub("[^%w]", "")
                    local v667 = v666 == v660 or string.find(v665, p647, 1, true)
                    if not v667 and (p647 == "Electro") and (v666 == "electric" or (v665:find("Electric") and not v665:find("Electric Claw"))) then
                        v667 = true
                    elseif not v667 and (p647 == "Black Leg") and (v666 == "darkstep" or v665:find("Dark Step")) then
                        v667 = true
                    elseif not v667 and (p647 == "Fishman Karate") and (v666 == "waterkungfu" or v665:find("Water Kung")) then
                        v667 = true
                    elseif not v667 and (p647 == "Dragon Claw") and (v666 == "dragonbreath" or v665:find("Dragon Breath")) then
                        v667 = true
                    end
                    if v667 then
                        local v668 = tonumber(v662.Value) or 0
                        if not v648 or v668 > v648 then
                            v648 = v668
                        end
                    end
                end
            end
        end
    end)
    return v648
end
GetTrueMastery = function(p669)
    local v670 = ScriptStorage.Melees[p669] or 0
    pcall(function()
        local v671 = game.Players.LocalPlayer
        for v672, v673 in ipairs({ v671.Character, v671:FindFirstChild("Backpack") }) do
            if v673 then
                for v674, v675 in ipairs(v673:GetChildren()) do
                    if v675:IsA("Tool") and (v675.Name ~= "Tool") and CombatController and CombatController.MeleeInternalName and (CombatController.MeleeInternalName(v675.Name) == p669) then
                        local v676 = v675:FindFirstChild("Level")
                        local v677 = v676 and tonumber(v676.Value) or nil
                        if v677 and (v677 > v670) then
                            v670 = v677
                        end
                    end
                end
            end
        end
    end)
    local v678 = GetServerMasteryByName(p669)
    if v678 and (v678 > v670) then
        v670 = v678
    end
    if v670 > (ScriptStorage.Melees[p669] or 0) then
        ScriptStorage.Melees[p669] = v670
    end
    return v670
end
ResearchMoves = function(p679)
    ScriptStorage.Backpack = {}
    local v680 = game.Players.LocalPlayer
    local v681, v682 = pcall(function()
        return require(game.ReplicatedStorage.ItemReplicationService)._UserCache[v680.UserId]
    end)
    if not v681 or not v682 then
        for v683, v684 in Remotes.CommF_:InvokeServer("getInventory") do
            ScriptStorage.Backpack[v684.Name] = v684
        end
        return
    end
    local v685 = v682:GetItems("Quantity")
    local v686 = v682:GetItems("Mastery")
    local v687 = require(game.ReplicatedStorage.ItemConfig)
    local v688 = require(game.ReplicatedStorage.Modules.CombatUtil)
    local v689 = {}
    if v686 then
        for v690, v691 in pairs(v686) do
            v689[v691.ItemId] = v691.Value
        end
    end
    local function v692(p693)
        return p693:gsub(" %[.-%]", "")
    end
    for v694, v695 in pairs(v685) do
        local v696, v697 = v695.ItemId, v695.Value
        local v698, v699 = "?", ""
        pcall(function()
            local v700 = v687.match(v696):unwrap()
            if v700 and v700.Index then
                v698 = v700.Index.IdType
                v699 = v700.Index.DebugLabel
            end
        end)
        local v701 = v692(v699)
        if v701 ~= "" then
            ScriptStorage.Backpack[v701] = { Name = v701, Count = v697, ItemId = v696 }
            if v698 == "Moveset" or v698 == "PhysicalMoveset" then
                local v702 = v689[v696]
                if v702 then
                    local v703 = v688:GetWeaponData(v701)
                    if v703 then
                        ScriptStorage.Melees[v701] = v702
                    end
                end
            end
        end
    end
    SyncMeleeMasteryFromInventory()
end
SetTask = function(p704, p705)
    p705 = tostring(p705 or "")
    local v706 = p704 == "Main" or p704 == "MainTask"
    if v706 then
        getgenv().CurrentMainTask = p705
        _G.CurrentMainTask = p705
    else
        getgenv().CurrentSubTask = p705
        _G.CurrentSubTask = p705
    end
    local v707 = tostring(getgenv().CurrentMainTask or _G.CurrentMainTask or "")
    local v708 = tostring(getgenv().CurrentSubTask or _G.CurrentSubTask or "")
    local v709 = ""
    if v707 ~= "" and (v708 ~= "") and (v708 ~= v707) then
        v709 = v707 .. " | " .. v708
    elseif v707 ~= "" then
        v709 = v707
    else
        v709 = v708
    end
    getgenv().CurrentTask = v709
    _G.CurrentTask = v709
    local v710 = getgenv().VapeTracker
    if type(v710) == "table" and v710.SetStatus then
        v710.SetStatus(v710, v707, v708 ~= "" and v708 or v707)
    end
    task.defer(function()
        pcall(function()
            if _G.SetKaitunStatus then
                _G.SetKaitunStatus(v709)
            end
        end)
    end)
end
getgenv().SetTask = SetTask
Report = function(p711)
    print(p711)
end
ResearchMoves = function(p712)
    if p712 and (tostring(p712) == "V") then
        if ScriptStorage.Connections.BurstCheck then
            ScriptStorage.Connections.BurstCheck:Disconnect()
            task.wait(1)
        end
        print("[ Debug ] Registering burst", p712)
        ScriptStorage.Connections.BurstCheck = p712.Cooldown:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
            if EnablingBurstDebounce and (os.time() - EnablingBurstDebounce < 10) then
                return
            end
            local v713 = p712.Cooldown.AbsoluteSize.X
            if v713 < 3 then
                EnablingBurstDebounce = os.time()
                task.wait(5)
                SendKey("V", 0)
            end
        end)
    end
end
CheckMeleeBurstMove = function(p714)
    if p714.Name == "Black Leg" or p714.Name == "Death Step" then
        local v715 = PlayerGui.Main.Skills:WaitForChild(p714.Name, 9)
        ResearchMoves(v715:WaitForChild("V"))
    end
end
RefreshMelees = function(p716)
    local v717 = ""
    for v718, v719 in ScriptStorage.Melees do
        v717 = v717 .. v718 .. ": " .. v719 .. " "
    end
    v717 = v717 == "" and "[0]" or v717
    if p716 then
        return v717
    end
end
ReconcileMeleeCache = function()
    for v720, v721 in MeleesTable do
        local v722 = ScriptStorage.Tools[v721]
        if v722 then
            MeleeCheck(v722)
        end
    end
end
IsFruitReserved = function(p723)
    local v724 = p723 and ScriptStorage.ReservedFruits[p723]
    if not v724 then
        return false
    end
    if os.clock() > v724 then
        ScriptStorage.ReservedFruits[p723] = nil
        return false
    end
    return true
end
ReserveFruit = function(p725, p726)
    if not p725 then
        return
    end
    ScriptStorage.ReservedFruits[p725] = os.clock() + (p726 or 60)
end
GetFruitId = function(p727)
    local v728 = p727 and p727:FindFirstChild("EatRemote", true)
    return v728 and v728.Parent:GetAttribute("OriginalName") or nil
end
StoreLooseFruits = function()
    local v729 = LocalPlayer.Character
    local v730 = v729 and v729:FindFirstChildOfClass("Tool")
    if v730 and not IsFruitReserved(GetFruitId(v730)) and GetFruitId(v730) then
        local v731 = v729:FindFirstChildOfClass("Humanoid")
        if v731 then
            pcall(function()
                v731:UnequipTools()
            end)
        end
    end
    task.wait(0.1)
    local v732 = LocalPlayer:FindFirstChild("Backpack")
    if not v732 then
        return
    end
    for v733, v734 in ipairs(v732:GetChildren()) do
        local v735 = GetFruitId(v734)
        if v735 and not IsFruitReserved(v735) then
            pcall(function()
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("StoreFruit", v735, v734)
            end)
        end
    end
end
ReleaseFruit = function(p736)
    if p736 then
        ScriptStorage.ReservedFruits[p736] = nil
    else
        table.clear(ScriptStorage.ReservedFruits)
    end
    task.spawn(StoreLooseFruits)
end
EquipFruitById = function(p737, p738)
    local v739 = os.clock() + (p738 or 5)
    repeat
        task.wait(0.1)
        local v740 = LocalPlayer:FindFirstChild("Backpack")
        for v741, v742 in ipairs(v740 and v740:GetChildren() or {}) do
            if GetFruitId(v742) == p737 then
                local v743 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if v743 then
                    v743:EquipTool(v742)
                    return true
                end
            end
        end
        task.wait(0.2)
    until os.clock() > v739
    return false
end
MeleeCheck = function(p744)
    if p744 and (typeof(p744) == "Instance") and p744:IsA("Tool") then
        if p744.ToolTip == "Melee" or p744.Name == "Combat" then
            if p744.Name == "Combat" then
                local v745 = ScriptStorage.PlayerData.Beli or (LocalPlayer:FindFirstChild("Data") and LocalPlayer.Data:FindFirstChild("Beli") and LocalPlayer.Data.Beli.Value) or 0
                if v745 >= 150000 or (ScriptStorage.Melees["Black Leg"] or 0) > 0 or ScriptStorage.Tools["Black Leg"] then
                    if CombatController and CombatController.StopCombat then
                        CombatController.StopCombat()
                    end
                end
                return
            end
            local v746 = p744:WaitForChild("Level", 5)
            if not v746 then
                return
            end
            if ScriptStorage.Connections.Melees then
                ScriptStorage.Connections.Melees:Disconnect()
            end
            ScriptStorage.CurrentMeleeData.Name = p744.Name
            pcall(function()
                ScriptStorage.Connections.Melees:Destroy()
            end)
            ScriptStorage.Connections.Melees = v746.Changed:Connect(function(p747)
                ScriptStorage.Melees[p744.Name] = p747
                RefreshMelees()
                SaveMeleeCache()
                if p744.Name ~= "Godhuman" and (p747 >= 400) then
                    if ScriptStorage.FarmingMelee and (ScriptStorage.FarmingMelee ~= p744.Name) then
                        if CombatController and CombatController.StopCombat then
                            CombatController.StopCombat()
                        end
                    end
                end
            end)
            ScriptStorage.Melees[p744.Name] = v746.Value
            RefreshMelees()
            SaveMeleeCache()
        elseif GetFruitId(p744) then
            task.spawn(StoreLooseFruits)
        end
    end
end
MeleeCheck(LocalPlayer.Character:FindFirstChildOfClass("Tool"))
RefreshPlayerData()
RegisterLocalPlayerEventsConnection = function()
    task.spawn(function()
        task.wait(6)
        if LocalPlayer.Character:FindFirstChild("HasBuso") then
            return
        end
        Remotes.CommF_:InvokeServer("Buso")
    end)
    for v748, v749 in ScriptStorage.Connections.LocalPlayer do
        pcall(function()
            v749:Disconnect()
        end)
    end
    AwaitUntilPlayerLoaded(LocalPlayer)
    LocalPlayer:SetAttribute("IsAvailable", true)
    ScriptStorage.Connections.LocalPlayer.HealthCheck = LocalPlayer.Character:WaitForChild("Humanoid"):GetPropertyChangedSignal("Health"):Connect(function()
        local v750 = LocalPlayer.Character.Humanoid.Health
        LocalPlayer:SetAttribute("IsAvailable", v750 > 10)
        ScriptStorage.LocalPlayerHealth = v750
    end)
    local v751 = LocalPlayer:WaitForChild("Backpack")
    ScriptStorage.Connections.LocalPlayer.Melee = LocalPlayer.Character.ChildAdded:Connect(MeleeCheck)
    ScriptStorage.Connections.LocalPlayer.Fruit = v751.ChildAdded:Connect(MeleeCheck)
    for v752, v753 in ipairs(v751:GetChildren()) do
        MeleeCheck(v753)
    end
    LastIdleCheck = os.time()
    ScriptStorage.Connections.LocalPlayer.PositionChecker = LocalPlayer.Character.HumanoidRootPart:GetPropertyChangedSignal("CFrame"):Connect(function()
        if os.time() == LastIdleCheck then
            return
        end
        LastIdleCheck = os.time()
        if oldPos then
            if (LocalPlayer.Character.HumanoidRootPart.CFrame.p - oldPos).magnitude < 2 then
                return
            end
        end
        oldPos = LocalPlayer.Character.HumanoidRootPart.CFrame.p
        LastIdling = os.time()
    end)
    local v754 = LocalPlayer.Data:WaitForChild("Points")
    ScriptStorage.Connections.LocalPlayer.PointConnection = v754:GetPropertyChangedSignal("Value"):Connect(function()
        local v755 = LocalPlayer.Data:WaitForChild("Points")
        if OldPointValue == v755 then
            return
        end
        OldPointValue = v755
        AddPoint()
    end)
end
RegisterLocalPlayerEventsConnection(LocalPlayer)
game.Players.LocalPlayer.CharacterAdded:Connect(function(p756)
    print("[ Debug ] re-registering events")
    RegisterLocalPlayerEventsConnection(LocalPlayer)
end)
task.spawn(function()
    task.wait(3)
    if LocalPlayer.Character:FindFirstChild("HasBuso") then
        return
    end
    Remotes.CommF_:InvokeServer("Buso")
end)
MeleesTable = {
    "Black Leg",
    "Electro",
    "Fishman Karate",
    "Dragon Claw",
    "Superhuman",
    "Death Step",
    "Electric Claw",
    "Sharkman Karate",
    "Dragon Talon",
    "Godhuman",
    "SanguineArt"
}
MeleesId = {
    "BlackLeg",
    "Electro",
    "FishmanKarate",
    "DragonClaw",
    "Superhuman",
    "DeathStep",
    "ElectricClaw",
    "SharkmanKarate",
    "DragonTalon",
    "Godhuman",
    "SanguineArt"
}
MeleePrices = {
    ["Black Leg"] = {
        Price = { Beli = 150000 },
        Id = "BlackLeg",
        NextLevelRequirement = 400,
        position = CFrame.new(),
        Requirements = function()
            return true
        end,
        Buy = function(p757)
            return BuyMelee("BlackLeg", p757, "Dark Step Teacher")
        end
    },
    Electro = {
        Price = { Beli = 500000 },
        Id = "Electro",
        NextLevelRequirement = 400,
        Requirements = function()
            return true
        end,
        Buy = function(p758)
            return BuyMelee("Electro", p758, "Mad Scientist")
        end
    },
    ["Fishman Karate"] = {
        Price = { Beli = 750000 },
        NextLevelRequirement = 400,
        Requirements = function()
            return true
        end,
        Buy = function(p759)
            return BuyMelee("FishmanKarate", p759, "Water Kung-fu Teacher")
        end
    },
    ["Dragon Claw"] = {
        Price = { Fragments = 1500 },
        NextLevelRequirement = 400,
        Requirements = function()
            return true
        end,
        Buy = function(p760)
            return BuyMelee("DragonClaw", p760, "Sabi")
        end
    },
    Superhuman = {
        Price = { Beli = 3000000 },
        NextLevelRequirement = 400,
        Requirements = function()
            return true
        end,
        Buy = function(p761)
            return BuyMelee("Superhuman", p761, "Martial Arts Master")
        end
    },
    ["Death Step"] = {
        Price = { Beli = 2500000, Fragments = 5000 },
        NextLevelRequirement = 400,
        Requirements = function()
            return true
        end,
        Buy = function(p762)
            return BuyMelee("DeathStep", p762, "Phoeyu, the Reformed")
        end
    },
    ["Sharkman Karate"] = {
        Price = { Beli = 2500000, Fragments = 5000 },
        NextLevelRequirement = 400,
        Requirements = function()
            return true
        end,
        Buy = function(p763)
            return BuyMelee("SharkmanKarate", p763, "Sharkman Teacher")
        end
    },
    ["Electric Claw"] = {
        Price = { Beli = 3000000, Fragments = 5000 },
        NextLevelRequirement = 400,
        Requirements = function()
            return true
        end,
        Buy = function(p764)
            return BuyMelee("ElectricClaw", p764, "Previous Hero")
        end
    },
    ["Dragon Talon"] = {
        Price = { Beli = 3000000, Fragments = 5000 },
        NextLevelRequirement = 400,
        Requirements = function()
            return true
        end,
        Buy = function(p765)
            return BuyMelee("DragonTalon", p765, "Uzoth")
        end
    },
    Godhuman = {
        Price = { Beli = 5000000, Fragments = 5000 },
        NextLevelRequirement = 400,
        Requirements = function()
            return true
        end,
        Buy = function(p766)
            return BuyMelee("Godhuman", p766, "Ancient Monk")
        end
    }
}
GodhumanMaterials = {
    ["Fish Tail"] = {
        20,
        3,
        { "Fishman Raider", "Fishman Captain" },
        { "DeepForestIsland3", 1, 1775, "Turtle Adventure Quest Giver" }
    },
    ["Dragon Scale"] = {
        10,
        3,
        { "Dragon Crew Warrior", "Dragon Crew Archer" },
        { "DragonCrewQuest", 1, 1575, "Dragon Crew Quest Giver" }
    },
    ["Magma Ore"] = {
        20,
        2,
        { "Magma Ninja" },
        { "FireSideQuest", 1, 1100, "Fire Quest Giver" }
    },
    ["Mystic Droplet"] = {
        10,
        2,
        { "Sea Soldier", "Water Fighter" },
        { "ForgottenQuest", 2, 1425, "Forgotten Quest Giver" }
    }
}
local v767 = {
    "ExpRedeem",
    "SecondSeaPuzzle",
    "MeleesController",
    "LevelFarm",
    "Saber",
    "BossesTask"
}
local v768 = {
    "ExpRedeem",
    "ColosseumPuzzle",
    "Trevor",
    "ThirdSeaPuzzle",
    "UtillyItemsActivitation",
    "SpecialBossesTask",
    "BossesTask",
    "RaidController",
    "MeleesController",
    "LevelFarm"
}
local v769 = {
    "ExpRedeem",
    "UtillyItemsActivitation",
    "BossesTask",
    "SpecialBossesTask",
    "PirateRaid",
    "KataFragTask",
    "RaidController",
    "MeleesController",
    "LevelFarm"
}
TasksOrder = v536 == 1 and v767 or (v536 == 2 and v768) or v769
MaxLevel = 2800
placeId = game.PlaceId
Portals = ({
    {
        Vector3.new(-7894.6201171875, 5545.49169921875, -380.246346191406),
        Vector3.new(-4607.82275390625, 872.5422973632812, -1667.556884765625),
        Vector3.new(61163.8515625, 11.759522438049316, 1819.7841796875),
        Vector3.new(3876.280517578125, 35.10614013671875, -1939.3201904296875)
    },
    {
        Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
        Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),
        Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
        Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
    },
    {}
})[v536]
local v770 = {
    "The Gorilla King",
    "Bobby",
    "The Saw",
    "Yeti",
    "Mob Leader",
    "Vice Admiral",
    "Warden",
    "Chief Warden",
    "Swan",
    "Magma Admiral",
    "Fishman Lord",
    "Wysper",
    "Thunder God",
    "Cyborg",
    "Saber Expert"
}
local v771 = { "Awakened Ice Admiral", "Tide Keeper", "Don Swan" }
local v772 = {
    "Dough King",
    "rip_indra True Form",
    "rip_indra",
    " of the Skies",
    "Cake Prince"
}
BossesOrder = v536 == 1 and v770 or (v536 == 2 and v771) or v772
BossesOrderLevel = {
    ["Awakened Ice Admiral"] = 700,
    ["Tide Keeper"] = 700,
    ["Don Swan"] = 1100,
    ["Cake Prince"] = 1500,
    ["Dough King"] = 1500,
    ["Soul Reaper"] = 1500,
    ["Tyrant of the Skies"] = 1550,
    ["The Gorilla King"] = 20,
    Bobby = 55,
    ["The Saw"] = 100,
    Yeti = 105,
    ["Mob Leader"] = 120,
    ["Vice Admiral"] = 130,
    Warden = 220,
    ["Chief Warden"] = 230,
    Swan = 240,
    ["Saber Expert"] = 200,
    ["Magma Admiral"] = 350,
    ["Fishman Lord"] = 425,
    Wysper = 500,
    ["Thunder God"] = 575,
    Cyborg = 675
}
BossesOrderWL = {
    ["Cake Prince"] = 1500,
    ["Dough King"] = 1500,
    ["Awakened Ice Admiral"] = 700,
    ["Tide Keeper"] = 700,
    ["Don Swan"] = 1100,
    ["Tyrant of the Skies"] = 1550
}
SpecialBossesOrder = { Core = 700, Darkbeard = 700 }
BlankTablets = {
    "Segment6",
    "Segment2",
    "Segment8",
    "Segment9",
    "Segment5"
}
Trophy = {
    Segment1 = "Trophy1",
    Segment3 = "Trophy2",
    Segment4 = "Trophy3",
    Segment7 = "Trophy4",
    Segment10 = "Trophy5"
}
Pipes = {
    Part1 = "Really black",
    Part2 = "Really black",
    Part3 = "Dusty Rose",
    Part4 = "Storm blue",
    Part5 = "Really black",
    Part6 = "Parsley green",
    Part7 = "Really black",
    Part8 = "Dusty Rose",
    Part9 = "Really black",
    Part10 = "Storm blue"
}
CheckIsPlayerAlive = function(p773)
    p773 = p773 or LocalPlayer
    return p773 and p773.Character and p773.Character.Humanoid and p773.Character.HumanoidRootPart and p773.Character.Head and (p773.Character.Humanoid.Health > 0)
end
ConvertTo = function(p774, p775)
    if not p775 then
        return nil
    end
    local v776, v777 = pcall(function()
        if typeof(p775) == "Instance" and p775:IsA("BasePart") then
            p775 = p775.Position
        end
        return p774.new(p775.X, p775.Y, p775.Z)
    end)
    return v776 and v777 or nil
end
local function v778(p779)
    if not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        return false
    end
    local v780 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    for v781, v782 in pairs(v459:GetPlayers()) do
        if v782 ~= game.Players.LocalPlayer and v782.Character and v782.Character:FindFirstChild("HumanoidRootPart") then
            local v783 = (v782.Character.HumanoidRootPart.Position - v780).Magnitude
            if v783 <= p779 then
                return true
            end
        end
    end
    return false
end
CaculateDistance = function(p784, p785)
    if not p784 then
        return math.huge
    end
    if not p785 then
        local v786 = game.Players.LocalPlayer.Character
        local v787 = v786 and v786:FindFirstChild("HumanoidRootPart")
        if not v787 then
            return math.huge
        end
        p785 = v787.CFrame
    end
    local v788, v789 = ConvertTo(Vector3, p784), ConvertTo(Vector3, p785)
    if not v788 or not v789 then
        return math.huge
    end
    return (v788 - v789).Magnitude
end
DispTime = function(p790, p791)
    p790 = tonumber(p790)
    if not p790 then
        return "[err]"
    end
    local v792 = math.floor(p790 / 86400)
    local v793 = math.floor(math.fmod(p790, 86400) / 3600)
    local v794 = math.floor(math.fmod(p790, 3600) / 60)
    local v795 = math.floor(math.fmod(p790, 60))
    if p791 then
        return v792 .. "day, " .. v793 .. "hrs, " .. v794 .. "min, " .. v795 .. "sec."
    end
    return v792 .. "day, " .. v793 .. "hrs."
end
GetCurrentDateTime = function()
    local v796 = os.date("*t")
    local v797 = v796.hour
    local v798 = v796.min
    local v799 = v796.day
    local v800 = v796.month
    local v801 = v796.year
    local v802 = v796.wday
    local v803 = string.format("%02d:%02d ", v797, v798)
    local v804 = {
        "Sun",
        "Mon",
        "Tue",
        "Wed",
        "Thu",
        "Fri",
        "Sat"
    }
    local v805 = v804[v802]
    local v806 = {
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec"
    }
    local v807 = v806[v800]
    local v808 = string.format("%s, %s %d %d", v805, v807, v799, v801)
    return v803 .. v808
end
RandomArguments = function(...)
    local v809 = { ... }
    return v809[math.random(0, #v809)]
end
RoundVector3Down = function(p810)
    return Vector3.new(math.floor(p810.X / 10) * 10, math.floor(p810.Y / 10) * 10, math.floor(p810.Z / 10) * 10)
end
local v811 = 30
lastChange = tick()
CaculateCircreDirection = function(p812)
    if v811 > 50000 then
        v811 = 60
    end
    v811 = v811 + (tick() - lastChange > 0.4 and 80 or 0)
    if tick() - lastChange > 0.4 then
        lastChange = tick()
    end
    local v813 = p812 + Vector3.new(math.cos(math.rad(v811)) * 40, 0, math.sin(math.rad(v811)) * 40)
    return CFrame.new(RoundVector3Down(v813.p))
end
GetMonAsSortedRange = function()
    local v814 = {}
    if Services.Workspace:FindFirstChild("Enemies") then
        for v815, v816 in ipairs(Services.Workspace.Enemies:GetChildren()) do
            if v816 and v816:IsA("Model") and v816:FindFirstChildOfClass("Humanoid") and v816:FindFirstChild("HumanoidRootPart") and (v816.Humanoid.Health > 0) and v816:IsDescendantOf(workspace) and (v816.HumanoidRootPart.Position.Magnitude > 100) and (v816.HumanoidRootPart.Position.Y > -3500) then
                table.insert(v814, v816)
            end
        end
    end
    table.sort(v814, function(p817, p818)
        return CaculateDistance(p817.HumanoidRootPart.CFrame) < CaculateDistance(p818.HumanoidRootPart.CFrame)
    end)
    return v814
end
GetMeleeIdByName = function(p819)
    for v820, v821 in MeleesTable do
        if v821 == p819 then
            return MeleesId[v820]
        end
    end
end
getpos = function(p822)
    for v823, v824 in game:GetService("ReplicatedStorage").NPCs:GetChildren() do
        if v824.Name == p822 then
            return v824.HumanoidRootPart.CFrame
        end
    end
    for v825, v826 in workspace.NPCs:GetChildren() do
        if v826.Name == p822 then
            return v826.HumanoidRootPart.CFrame
        end
    end
end
BuyMelee = function(p827, p828)
    if p827 == "DragonClaw" then
        if p828 then
            local v829 = Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
            if type(v829) == "number" and not table.find(v602, p827) then
                table.insert(v602, p827)
            end
            return v829 == 1
        end
        return Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
    end
    if p827 == "Electro" then
        if p828 then
            local v830 = Remotes.CommF_:InvokeServer("BuyElectro", true)
            if type(v830) == "number" and not table.find(v602, p827) then
                table.insert(v602, p827)
            end
            return v830 == 1
        end
        pcall(function()
            Remotes.CommF_:InvokeServer("ElectroQuestState")
            task.wait(0.2)
            Remotes.CommF_:InvokeServer("ElectroQuestState")
            task.wait(0.2)
            Remotes.CommF_:InvokeServer("AcceptElectroQuest")
            task.wait(0.2)
            Remotes.CommF_:InvokeServer("DeliverLightningBolt")
        end)
        task.wait(0.2)
        return Remotes.CommF_:InvokeServer("BuyElectro")
    end
    if p828 then
        local v831 = Remotes.CommF_:InvokeServer("Buy" .. p827, true)
        print("Response_", v831 == 1, typeof(v831))
        if type(v831) == "number" and not table.find(v602, p827) then
            table.insert(v602, p827)
        end
        return v831 == 1
    end
    return Remotes.CommF_:InvokeServer("Buy" .. p827)
end
SendKey = function(p832, p833)
    (function()
        game:GetService("VirtualInputManager"):SendKeyEvent(true, p832, false, game)
        task.wait(p833)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, p832, false, game)
    end)()
end
FruitIdToName = function(p834)
    local v835 = string.match(p834, "((%u)[^%-]+)$")
    return v835 .. " Fruit"
end
Split = function(p836, p837)
    if p837 == nil then
        p837 = "%s"
    end
    local v838 = {}
    for v839 in string.gmatch(p836, "([^" .. p837 .. "]+)") do
        table.insert(v838, v839)
    end
    return v838
end
FruitNameToId = function(p840)
    local v841 = Split(p840)[1]
    return v841 .. "-" .. v841
end
local v842 = {
    CurrentLevel = 2,
    DoubleQuest = true,
    CurrentQuests = {},
    BlacklistedQuestIds = {
        BartiloQuest = 1,
        CitizenQuest = 1,
        Trainees = 1,
        MarineQuest = 1,
        ImpelQuest = 1
    }
}
getgenv().J = v842
repeat
    task.wait()
until game.Players.LocalPlayer.DataLoaded and ScriptStorage
v842.Quests = require(game.ReplicatedStorage.Quests)
v842.Set = function(p843, p844, p845)
    p843[p844] = p845
end
v842.RefreshQuest = function(p846)
    p846 = type(p846) == "table" and p846 or v842
    local v847 = os.time()
    while not ScriptStorage.PlayerData.Level do
        task.wait(0.5)
        if os.time() - v847 > 10 then
            break
        end
    end
    local v848 = ScriptStorage.PlayerData.Level or (LocalPlayer:FindFirstChild("Data") and LocalPlayer.Data:FindFirstChild("Level") and LocalPlayer.Data.Level.Value) or 1
    local v849 = v848
    if v536 == 1 and (v849 >= 700) then
        v849 = 699
    end
    if v536 == 2 and (v849 >= 1500) then
        v849 = 1499
    end
    local v850 = 0
    local v851 = nil
    local v852 = require(game.ReplicatedStorage.Quests)
    for v853, v854 in pairs(v852) do
        if not v842.BlacklistedQuestIds[v853] and v854[1] and v854[1].LevelReq then
            if v854[1].LevelReq >= v850 and (v854[1].LevelReq <= v849) then
                v850 = v854[1].LevelReq
                v851 = v854
                p846.CurrentQuestId = v853
                if v848 >= 1500 and (v536 == 2) and (v853 == "ForgottenQuest") then
                    break
                end
                if v854[1].NameMonster == "Factory Staff" or (v854[1].Task and v854[1].Task["Factory Staff"]) then
                    v851 = nil
                end
            end
        end
    end
    if not v851 then
        return
    end
    local v855 = {}
    for v856, v857 in ipairs(v851) do
        local v858 = false
        local v859 = false
        for v860, v861 in pairs(v857.Task or {}) do
            if v861 == 1 then
                v858 = true
            end
            if tostring(v860) == "Factory Staff" or tostring(v857.Name) == "Factory Staff" then
                v859 = true
            end
        end
        if not v859 and (not v858 or v856 == 1) then
            table.insert(v855, v857)
        end
    end
    if #v855 == 0 then
        v855 = v851
    end
    local v862 = v855[#v855] and v855[#v855].LevelReq
    pcall(function()
        local v863 = require(game.ReplicatedStorage.GuideModule).Data.NPCList
        for v864, v865 in pairs(v863) do
            if v865.Levels then
                for v866, v867 in ipairs(v865.Levels) do
                    if v867 == v862 then
                        if typeof(v864) == "Instance" then
                            p846.CurrentNpc = v864:IsA("BasePart") and v864.CFrame or (v864:IsA("Model") and v864:GetPivot()) or (v864.PrimaryPart and v864.PrimaryPart.CFrame)
                        elseif typeof(v864) == "CFrame" then
                            p846.CurrentNpc = v864
                        elseif v864 and v864.CFrame then
                            p846.CurrentNpc = v864.CFrame
                        end
                    end
                end
            end
        end
    end)
    p846.CurrentQuests = v855
end
v842.GetCurrentQuest = function(p868)
    local v869 = p868.CurrentQuests[p868.CurrentLevel] and (p868.CurrentQuests[p868.CurrentLevel].LevelReq <= ScriptStorage.PlayerData.Level) and p868.CurrentLevel or 1
    for v870 in p868.CurrentQuests[v869].Task do
        return v870, p868.CurrentNpc, p868.CurrentQuestId, v869, p868.CurrentQuests[v869].Name
    end
end
v842.MarkAsCompleted = function(p871)
    local v872 = p871.MaxSlots or 3
    p871.CurrentLevel = p871.CurrentLevel % v872 + 1
end
v842.MaxSlots = 3
v842.AbandonQuest = function()
    print("Abandon Quest")
    if CombatController and CombatController.StopCombat then
        CombatController.StopCombat()
    end
    pcall(function()
        if TweenController and TweenController.StopMovement then
            TweenController.StopMovement()
        end
        if TweenInstance then
            pcall(function()
                TweenInstance:Cancel()
            end)
        end
        TweenInstance = nil
        CurrentTweenTarget = nil
        LastTweenCreate = 0
        local v873 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if v873 then
            v873.Velocity = Vector3.zero
            v873.RotVelocity = Vector3.zero
        end
    end)
    pcall(function()
        Remotes.CommF_:InvokeServer("AbandonQuest")
    end)
    pcall(function()
        if CombatController then
            CombatController._fixedAnchorPos = nil
            CombatController._lastMobTarget = nil
            CombatController._lastTweenTarget = nil
            CombatController._lastTweenTime = 0
        end
        getgenv().KaitunMismatchCount = nil
    end)
end
local function v874(p875)
    if not p875 or p875 == "" then
        return nil
    end
    local v876 = tostring(p875)
    v876 = v876:gsub("^%s*[Dd][Ee][Ff][Ee][Aa][Tt]%s*%d*%s*", ""):gsub("%s*%(%d*%s*/%s*%d*%)%s*$", ""):gsub("%s*%d+%s*/%s*%d+%s*$", "")
    v876 = v876:gsub("^%s+", ""):gsub("%s+$", "")
    if v876 == "" then
        return nil
    end
    v876 = v876:gsub("^[Mm]il%.?%s*[Ss]oldier.*", "Military Soldier")
    v876 = v876:gsub("^[Mm]il%.?%s*[Ss]py.*", "Military Spy")
    if v876 == "Military Soldiers" then
        return "Military Soldier"
    end
    if v876:sub(-1) == "s" and (v876:sub(-2) ~= "ss") then
        local v877 = v876:sub(1, -2)
        if workspace:FindFirstChild("Enemies") and workspace.Enemies:FindFirstChild(v877) or (ScriptStorage and ScriptStorage.MobRegions and (ScriptStorage.MobRegions[v877] or ScriptStorage.MobRegions[v877 .. " [Lv. "])) or (CombatController and CombatController.ResolveMobKey and (CombatController.ResolveMobKey(v877) ~= v877)) then
            return v877
        end
    end
    return v876
end
ParseCurrentQuest = function()
    local v878 = game.Players.LocalPlayer
    local v879 = v878 and v878:FindFirstChild("PlayerGui")
    if not v879 then
        return nil, nil, 0, 0
    end
    local v880 = v879:FindFirstChild("TrackedQuestFrame")
    if v880 and v880.Enabled and v880:FindFirstChild("Frame") then
        local v881 = v880.Frame:FindFirstChild("description")
        local v882 = v881 and (v881.Text ~= "") and v881.Text or nil
        local v883 = v880.Frame:FindFirstChild("header")
        local v884 = v883 and v883:FindFirstChild("textLabel")
        local v885 = v884 and v884.Text or v882 or ""
        local v886 = nil
        if v885:match("^%s*[Dd][Ee][Ff][Ee][Aa][Tt]%s+%d") then
            v886 = v874(v885)
        end
        if not v886 and v882 then
            v886 = v874(v882)
        end
        local v887, v888 = 0, 0
        local v889 = v880.Frame:FindFirstChild("progress")
        if v889 and (v889.Text ~= "") then
            local v890, v891 = v889.Text:match("(%d+)%s*/%s*(%d+)")
            if v890 and v891 then
                v887 = tonumber(v890) or 0
                v888 = tonumber(v891) or 0
            end
        end
        if v886 and (v886 ~= "") then
            local v892 = false
            if v536 == 2 and (v886:find("Venomous") or v886:find("Hydra") or v886:find("Turtle") or v886:find("Haunted") or v886:find("Peanut") or v886:find("Bandit") or v886:find("Dragon Crew")) then
                v892 = true
            elseif v536 == 3 and (v886:find("Raider") or v886:find("Mercenary") or v886:find("Swan") or v886:find("Factory") or v886:find("Water Fighter") or v886:find("Sea Soldier")) then
                v892 = true
            end
            if not v892 then
                return v886, v885, v887, v888
            else
                pcall(function()
                    v880.Enabled = false
                end)
            end
        end
    end
    local v893 = v879:FindFirstChild("Main") and v879.Main:FindFirstChild("Quest")
    if v893 and v893.Visible then
        local v894 = v893:FindFirstChild("Container") and v893.Container:FindFirstChild("QuestTitle") and v893.Container.QuestTitle:FindFirstChild("Title")
        local v895 = v894 and v894.Text or ""
        local v896, v897, v898 = "", 0, 0
        if v895:match("^%s*[Dd][Ee][Ff][Ee][Aa][Tt]%s+%d") then
            v896 = v874(v895) or ""
            local v899, v900 = v895:match("%((%d+)%s*/%s*(%d+)%)")
            if v899 and v900 then
                v897 = tonumber(v899) or 0
                v898 = tonumber(v900) or 0
            end
        end
        if v896 and (v896 ~= "") then
            return v896, v895, v897, v898
        end
    end
    getgenv().KaitunQuestDeep = getgenv().KaitunQuestDeep or {
        at = 0,
        mob = nil,
        title = "",
        cur = 0,
        max = 0
    }
    local v901 = getgenv().KaitunQuestDeep
    if tick() - (tonumber(v901.at) or 0) >= 2 then
        v901.at = tick()
        v901.mob, v901.title, v901.cur, v901.max = nil, "", 0, 0
        pcall(function()
            local function v902(p903)
                local v904 = p903
                while v904 and v904:IsA("GuiObject") do
                    if not v904.Visible then
                        return false
                    end
                    v904 = v904.Parent
                end
                return true
            end
            local function v905(p906)
                if v901.mob then
                    return
                end
                if (p906:IsA("TextLabel") or p906:IsA("TextButton") or p906:IsA("TextBox")) and v902(p906) then
                    local v907 = p906.Text
                    if type(v907) == "string" and v907:match("^%s*[Dd][Ee][Ff][Ee][Aa][Tt]%s+%d") then
                        local v908 = v874(v907)
                        local v909 = v536 and (v536 > 1) and (v908 and (v908:upper() == "BANDITS" or v908:upper() == "BANDIT"))
                        if v908 and (v908 ~= "") and not v909 then
                            local v910, v911 = v907:match("%((%d+)%s*/%s*(%d+)%)")
                            if not v910 then
                                v910, v911 = v907:match("(%d+)%s*/%s*(%d+)")
                            end
                            v901.mob, v901.title = v908, v907
                            v901.cur, v901.max = tonumber(v910) or 0, tonumber(v911) or 0
                            return
                        end
                    end
                end
                for v912, v913 in ipairs(p906:GetChildren()) do
                    if v901.mob then
                        return
                    end
                    v905(v913)
                end
            end
            v905(v879)
        end)
    end
    if v901.mob and (v901.mob ~= "") then
        return v901.mob, v901.title, v901.cur, v901.max
    end
    return nil, nil, 0, 0
end
_G.ParseCurrentQuest = ParseCurrentQuest
getgenv().ParseCurrentQuest = ParseCurrentQuest
v842.GetCurrentClaimQuest = function(p914)
    return ParseCurrentQuest()
end
v842.StartQuest = function(p915, p916)
    pcall(function()
        if CombatController then
            CombatController._fixedAnchorPos = nil
            CombatController._lastMobTarget = nil
            CombatController._lastTweenTarget = nil
            CombatController._lastTweenTime = 0
        end
        getgenv().KaitunMismatchCount = nil
    end)
    return Remotes.CommF_:InvokeServer("StartQuest", p915, p916)
end
getgenv().KaitunLastTakeQuest = getgenv().KaitunLastTakeQuest or { id = "", at = 0 }
local function v917(p918, p919)
    local v920 = os.clock()
    local v921 = getgenv().KaitunLastTakeQuest
    local v922 = tostring(p918) .. ":" .. tostring(p919)
    if v921.inFlight then
        return false
    end
    if v920 < (tonumber(v921.coolUntil) or 0) then
        return false
    end
    if v921.id == v922 and (v920 - (tonumber(v921.at) or 0) < 8) then
        return false
    end
    v921.id = v922
    v921.at = v920
    v921.inFlight = true
    local v923 = LocalPlayer.Character
    local v924 = tostring(game.JobId)
    task.spawn(function()
        pcall(function()
            if _G.Stop or _G.ActiveMeleeQuest or LocalPlayer.Character ~= v923 or tostring(game.JobId) ~= v924 then
                return
            end
            v842.StartQuest(p918, p919)
        end)
        v921.inFlight = false
    end)
    return true
end
local function v925(p926, p927)
    getgenv().KaitunAbandonGuard = getgenv().KaitunAbandonGuard or {}
    local v928 = getgenv().KaitunAbandonGuard
    p927 = tonumber(p927) or 0
    if p927 > 0 then
        v928[p926] = nil
        return false
    end
    v928[p926] = (tonumber(v928[p926]) or 0) + 1
    if v928[p926] >= 3 then
        v928[p926] = nil
        getgenv().KaitunLastTakeQuest = getgenv().KaitunLastTakeQuest or { id = "", at = 0 }
        getgenv().KaitunLastTakeQuest.coolUntil = os.clock() + 10
        return true
    end
    return false
end
ScriptStorage.MobRegions = {}
for v929, v930 in game:GetService("ReplicatedStorage").FortBuilderReplicatedSpawnPositionsFolder:GetChildren() do
    ScriptStorage.MobRegions[tostring(v930)] = ScriptStorage.MobRegions[tostring(v930)] or {}
    table.insert(ScriptStorage.MobRegions[tostring(v930)], v930.CFrame)
end
TweenController = {}
getgenv().TweenController = TweenController
local v931 = 0
local v932 = math.huge
local v933 = 0
local v934 = {}
for v935, v936 in game.ReplicatedStorage.NPCs:GetChildren() do
    if v936.Name == "Set Home Point" then
        table.insert(v934, v936:GetModelCFrame())
    end
end
TweenController.Update = function()
    local v937 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if v937 then
        HumanoidRootPart = v937
    end
end
GetPortal = function(p938)
    local v939, v940 = 9000000000, nil
    for v941, v942 in Portals do
        local v943 = CaculateDistance(v942, p938)
        if v943 < CaculateDistance(p938) - 300 and (v943 < v939) then
            v939 = v943
            v940 = v942
        end
    end
    if v940 then
        Remotes.CommF_:InvokeServer("requestEntrance", v940)
        return task.wait()
    end
end
GetEntries = function(p944)
    local v945, v946 = 9000000000, nil
    for v947, v948 in v934 do
        local v949 = CaculateDistance(v948, p944)
        if v949 < CaculateDistance(p944) - 700 and (v949 < v945) then
            v945 = v949
            v946 = v948
        end
    end
    if v946 then
        if os.time() - 0 > 30 then
            for v950 = 1, 10 do
                task.wait()
            end
        end
    end
end
CheckLegendaryItems = function()
    return v416("God's Chalice") or v416("Fist of Darkness") or v416("Sweet Chalice") or v416("Hallow Essence") or v416("Flower1") or v416("Special Microchip")
end
HasFruitOnHand = function()
    local v951 = game.Players.LocalPlayer
    for v952, v953 in ipairs({ v951:FindFirstChild("Backpack"), v951.Character }) do
        if v953 then
            for v954, v955 in ipairs(v953:GetChildren()) do
                if v955:IsA("Tool") and (string.find(v955.Name, "Fruit") or v955:FindFirstChild("EatRemote", true)) then
                    return true
                end
            end
        end
    end
    return false
end
InArea = function(p956)
    local v957 = workspace:FindFirstChild("_WorldOrigin")
    if not v957 or not v957:FindFirstChild("Locations") then
        return nil
    end
    local v958 = typeof(p956) == "CFrame" and p956.Position or p956
    local v959, v960 = nil, 0
    for v961, v962 in next, v957.Locations:GetChildren() do
        if v962:FindFirstChild("Mesh") and ((v958 - v962.Position).Magnitude <= v962.Mesh.Scale.X / 2 + 500) then
            if v962.Mesh.Scale.X > v960 then
                v960 = v962.Mesh.Scale.X
                v959 = v962
            end
        end
    end
    return v959
end
GetSpawnPoint = function(p963)
    local v964 = workspace:FindFirstChild("_WorldOrigin") and workspace._WorldOrigin:FindFirstChild("PlayerSpawns") and workspace._WorldOrigin.PlayerSpawns:FindFirstChild(game.Players.LocalPlayer.Team.Name)
    if not v964 then
        return nil
    end
    local v965 = typeof(p963) == "CFrame" and p963.Position or (typeof(p963) == "Vector3" and p963) or p963.Position
    for v966, v967 in next, v964:GetChildren() do
        if v967:FindFirstChild("Part") and ((v967.Part.Position - v965).Magnitude <= 2500) then
            return v967
        end
    end
    return nil
end
local v968 = {
    Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)
}
IsNoBypassEntrance = function(p969)
    local v970, v971 = math.huge, nil
    for v972, v973 in next, Portals do
        local v974 = (v973 - p969).Magnitude
        if v974 < v970 then
            v970 = v974
            v971 = v973
        end
    end
    if not v971 then
        return false
    end
    for v975, v976 in ipairs(v968) do
        if (v971 - v976).Magnitude < 5 or (p969 - v976).Magnitude < 5 then
            return true
        end
    end
    return false
end
CanBypassTeleport = function(p977)
    if v536 == 1 and p977 and (p977.Y >= 250) and (p977.X <= -3500) then
        return false
    end
    if IsNoBypassEntrance(p977) then
        return false
    end
    local v978 = InArea(p977)
    if not v978 then
        return false
    end
    local v979 = v978.Name
    if v979:find("Dimension") or v979:find("Submerged") or v979 == "Sealed Cavern" or v979:lower():find("under") then
        return false
    end
    if CheckLegendaryItems() then
        return false
    end
    if HasFruitOnHand() then
        return false
    end
    local v980 = game.Players.LocalPlayer:FindFirstChild("Data")
    local v981 = v980 and v980:FindFirstChild("LastSpawnPoint")
    if v981 and (v981.Value == "SubmergedIsland") then
        return false
    end
    local v982 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not v982 then
        return false
    end
    if (p977 - v982.Position).Magnitude <= 3500 then
        return false
    end
    return true
end
GetBypassCFrame = function(p983)
    local v984, v985 = math.huge, nil
    local v986 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not v986 then
        return nil
    end
    local v987 = workspace:FindFirstChild("_WorldOrigin") and workspace._WorldOrigin:FindFirstChild("PlayerSpawns") and workspace._WorldOrigin.PlayerSpawns:FindFirstChild(game.Players.LocalPlayer.Team.Name)
    if not v987 then
        return nil
    end
    local v988 = GetSpawnPoint(v986)
    for v989, v990 in next, v987:GetChildren() do
        if v990:FindFirstChild("Part") then
            local v991 = (p983 - v986.Position).Magnitude
            local v992 = (v990.Part.Position - v986.Position).Magnitude
            local v993 = (v990.Part.Position - p983).Magnitude
            local v994 = GetSpawnPoint(v990.Part)
            if v991 >= 3000 and (v994 ~= v988) and (v992 <= 10000) and (v993 <= v984) then
                v984 = v993
                v985 = v990
            end
        end
    end
    return v985
end
BypassTP = function(p995)
    if true then
        return false
    end
    if not CanBypassTeleport(p995) then
        return false
    end
    local v996 = GetBypassCFrame(p995)
    if not v996 then
        return false
    end
    local v997 = game.Players.LocalPlayer.Character
    if not v997 then
        return false
    end
    local v998 = v997:FindFirstChildOfClass("Humanoid")
    if not v998 or v998.Health <= 0 then
        return false
    end
    pcall(function()
        v997.LastSpawnPoint.Disabled = true
    end)
    Remotes.CommF_:InvokeServer("SetLastSpawnPoint", v996.Name)
    Remotes.CommF_:InvokeServer("SetSpawnPoint")
    v997:PivotTo(v996.Part.CFrame)
    v998:ChangeState(15)
    repeat
        task.wait()
    until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and (game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health > 0)
    return true
end
local v999 = 0
local v1000 = nil
RequestEntrance = function(p1001)
    local v1002 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not v1002 then
        return false
    end
    local v1003 = typeof(p1001) == "CFrame" and p1001.Position or (typeof(p1001) == "Vector3" and p1001 or Vector3.zero)
    local v1004 = v1002.Position
    local v1005 = (v1004 - v1003).Magnitude
    if v1005 < 1500 then
        return false
    end
    local v1006, v1007 = math.huge, nil
    for v1008, v1009 in next, Portals do
        local v1010 = (v1009 - v1003).Magnitude
        if v1010 < v1006 then
            v1006 = v1010
            v1007 = v1009
        end
    end
    if not v1007 then
        return false
    end
    local v1011 = (v1004 - v1007).Magnitude
    if v1011 > 1500 and (v1006 + 1500 < v1005) then
        if v1000 == v1007 and (os.clock() - v999 < 6) then
            return false
        end
        v999 = os.clock()
        v1000 = v1007
        if TweenInstance then
            pcall(function()
                TweenInstance:Cancel()
            end)
        end
        pcall(function()
            Remotes.CommF_:InvokeServer("requestEntrance", v1007)
        end)
        task.wait(1)
        local v1012 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if v1012 and ((v1012.Position - v1003).Magnitude < v1005 - 800) then
            return true
        end
        return false
    end
    return false
end
local v1013 = nil
local function v1014(p1015)
    if not p1015 or p1015 == "" then
        return false
    end
    if not v1013 then
        v1013 = {
            rip_indra = true,
            ["rip_indra True Form"] = true,
            ["Dough King"] = true,
            ["Cake Prince"] = true,
            Darkbeard = true,
            ["Soul Reaper"] = true,
            ["Don Swan"] = true,
            ["Saber Expert"] = true,
            ["Cursed Captain"] = true,
            ["Mob Leader"] = true,
            Deandre = true,
            Urban = true,
            Diablo = true,
            ["Tyrant of the Skies"] = true,
            Longma = true,
            Core = true,
            Bobby = true,
            ["The Gorilla King"] = true,
            ["Vice Admiral"] = true,
            ["Ice Admiral"] = true,
            Swan = true,
            ["Chief Warden"] = true,
            Warden = true,
            ["Magma Admiral"] = true,
            ["Fishman Lord"] = true,
            Wysper = true,
            ["Thunder God"] = true,
            Cyborg = true,
            Diamond = true,
            Jeremy = true,
            Fajita = true,
            ["Smoke Admiral"] = true,
            ["Awakened Ice Admiral"] = true,
            ["Tide Keeper"] = true,
            Stone = true,
            ["Island Empress"] = true,
            ["Kilo Admiral"] = false,
            ["Captain Elephant"] = false,
            ["Beautiful Pirate"] = false,
            ["Cake Queen"] = true,
            ["Hydra Leader"] = false,
            Orbitus = true
        }
        pcall(function()
            local v1016 = require(game:GetService("ReplicatedStorage"):WaitForChild("Quests"))
            for v1017, v1018 in pairs(v1016) do
                for v1019, v1020 in pairs(v1018) do
                    if v1020.Task then
                        for v1021, v1022 in pairs(v1020.Task) do
                            if v1022 == 1 then
                                v1013[tostring(v1021)] = true
                            end
                        end
                    end
                end
            end
        end)
    end
    return v1013[tostring(p1015)] == true
end
local v1023 = nil
local v1024 = 0
local v1025 = Vector3.new(-6496.89795, 89.0350037, -116.509003)
local v1026 = Vector3.new(924.639771, 125.397652, 32844.3906)
local v1027 = 5000
local v1028 = 8000
TweenInstance = nil
TweenDebounce = false
Portals = ({
    {
        ["Sky Area 1"] = CFrame.new(-4166.6, 5469.7, 380.2),
        ["Sky Area 2"] = CFrame.new(-6023.6, 5469.7, 0),
        ["Fish Man"] = CFrame.new(61163.9, 11.68, 1819.8),
        ["Whirl Pool"] = CFrame.new(3864.7, 6.74, -1926.2)
    },
    {
        Mansion = CFrame.new(-288.5, 306.1, 598),
        ["Swan's room"] = CFrame.new(2284.9, 15.15, 905.5),
        ["Ghost Ship Entrance"] = CFrame.new(-6508.6, 89, -132.8),
        ["Ghost Ship"] = CFrame.new(923.2, 127, 32852.8)
    },
    {}
})[v536] or {}
local function v1029()
    local v1030 = {}
    if v536 == 1 then
        local v1031 = Services.Workspace:FindFirstChild("Map")
        local v1032 = v1031 and v1031:FindFirstChild("TeleportSpawn")
        local v1033 = v1032 and v1032:FindFirstChild("Entrance")
        v1033 = v1033 and v1033.CFrame or CFrame.new(4050.3, -1.7, -1814.1)
        local v1034 = v1032 and v1032:FindFirstChild("Exit")
        v1034 = v1034 and v1034.CFrame or CFrame.new(61170, -2, 1952.8)
        if Portals["Fish Man"] then
            table.insert(v1030, { From = v1033, To = Portals["Fish Man"], Name = "Fish Man" })
        end
        if Portals["Whirl Pool"] then
            table.insert(v1030, { From = v1034, To = Portals["Whirl Pool"], Name = "Whirl Pool" })
        end
    elseif v536 == 2 then
        if Portals["Ghost Ship Entrance"] and Portals["Ghost Ship"] then
            table.insert(v1030, { From = Portals["Ghost Ship Entrance"], To = Portals["Ghost Ship"], Name = "Ghost Ship" })
            table.insert(v1030, { From = Portals["Ghost Ship"], To = Portals["Ghost Ship Entrance"], Name = "Ghost Ship Entrance" })
        end
    end
    return v1030
end
local function v1035(p1036)
    local v1037 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not v1037 then
        return nil
    end
    local v1038 = typeof(p1036) == "CFrame" and p1036.Position or p1036
    local v1039 = v1037.Position
    local v1040 = (v1039 - v1038).Magnitude
    if v1040 < 1000 then
        return nil
    end
    if v536 == 2 and Portals.Mansion and Portals["Swan's room"] then
        local v1041 = Portals["Swan's room"].Position
        local v1042 = (v1038 - v1041).Magnitude <= 300
        local v1043 = (v1039 - v1041).Magnitude <= 300
        if v1042 ~= v1043 then
            if v1042 then
                return { From = Portals.Mansion, To = Portals["Swan's room"], Name = "Swan's room" }
            end
            return { From = Portals["Swan's room"], To = Portals.Mansion, Name = "Mansion" }
        end
    end
    local v1044 = v1029()
    local v1045, v1046 = 0, nil
    for v1047, v1048 in ipairs(v1044) do
        local v1049 = (v1039 - v1048.From.Position).Magnitude
        local v1050 = (v1048.To.Position - v1038).Magnitude
        local v1051 = v1040 - v1049 + v1050
        if v1051 > 500 and (v1051 > v1045) and (v1050 < v1040) then
            v1045 = v1051
            v1046 = v1048
        end
    end
    return v1046
end
do
    local v1052, v1053, v1054 = 0, 0, 0
    local v1055 = Vector3.new(-6496.89795, 89.0350037, -116.509003)
    local v1056 = Vector3.new(924.639771, 125.397652, 32844.3906)
    local v1057 = 5000
    local v1058 = 8000
    TweenController.Create = function(p1059)
        if not p1059 or TweenDebounce or _G.Stop then
            return false
        end
        local v1060 = typeof(p1059)
        local v1061, v1062
        if v1060 == "CFrame" then
            v1061 = p1059
            v1062 = p1059.Position
        elseif v1060 == "Vector3" then
            v1062 = p1059
            v1061 = CFrame.new(p1059)
        elseif v1060 == "Instance" and p1059:IsA("BasePart") then
            v1062 = p1059.Position
            v1061 = p1059.CFrame
        elseif v1060 == "Instance" and p1059:IsA("Model") then
            v1061 = p1059:GetPivot()
            v1062 = v1061.Position
        else
            return false
        end
        if typeof(v1062) ~= "Vector3" or typeof(v1061) ~= "CFrame" then
            return false
        end
        local v1063 = game.Players.LocalPlayer.Character
        local v1064 = v1063 and v1063:FindFirstChild("HumanoidRootPart")
        if not v1064 then
            return false
        end
        if (v1064.Position - v1062).Magnitude < 6 then
            return
        end
        if TweenInstance and (TweenInstance.PlaybackState == Enum.PlaybackState.Playing) and v1023 then
            if (v1062 - v1023).Magnitude < 15 then
                return
            end
        end
        if v536 == 1 then
            local v1065 = Vector3.new(4050.31104, -1.68800354, -1814.12402)
            if v1064.Position.X < 50000 and (v1062.X > 50000) then
                local v1066 = (v1064.Position - v1065).Magnitude
                if v1066 > 20 then
                    local v1067 = Config and Config.Setup and Config.Setup.BypassTPThreshold or 185
                    return TweenController.Create(CFrame.new(v1065))
                else
                    if TweenInstance then
                        pcall(function()
                            TweenInstance:Cancel()
                        end)
                    end
                    v1064.Velocity = Vector3.zero
                    v1064.CFrame = CFrame.new(v1065)
                    task.wait(0.1)
                    local v1068 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if v1068 then
                        v1068.Jump = true
                    end
                    task.wait(0.5)
                    v1023 = nil
                    return true
                end
            end
            if v1064.Position.X > 50000 and (v1062.X < 50000) then
                if TweenInstance then
                    pcall(function()
                        TweenInstance:Cancel()
                    end)
                end
                local v1069 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if v1069 then
                    v1069.Health = 0
                end
                task.wait(1)
                v1023 = nil
                return true
            end
        end
        local v1070 = CaculateDistance(v1061)
        if not game.Players.LocalPlayer.Character:FindFirstChild("highlight") then
            local v1071 = Instance.new("Highlight")
            v1071.Name = "highlight"
            v1071.Enabled = true
            v1071.FillColor = Color3.fromRGB(255, 165, 0)
            v1071.OutlineColor = Color3.fromRGB(255, 255, 255)
            v1071.FillTransparency = 0.5
            v1071.OutlineTransparency = 0.2
            v1071.Parent = game.Players.LocalPlayer.Character
        end
        for v1072, v1073 in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v1073:IsA("BasePart") then
                v1073.CanCollide = false
            end
        end
        local v1074 = game.Players.LocalPlayer.Character:FindFirstChild("Head")
        if v1074 and v1074:FindFirstChild("bac ky") then
            pcall(function()
                v1074["bac ky"]:Destroy()
            end)
        end
        do
            local v1075 = (v1064.Position - v1062).Magnitude
            local v1076 = (v1064.Position - v1056).Magnitude < v1057
            local v1077 = (v1062 - v1056).Magnitude < v1057
            if v1075 > v1058 and (v1076 ~= v1077) then
                local v1078 = not v1076 and v1055 or v1056
                if (v1064.Position - v1078).Magnitude > 40 then
                    TweenController._cursedWait = nil
                    return TweenController.Create(CFrame.new(v1078))
                end
                local v1079 = os.clock()
                if not TweenController._cursedWait then
                    TweenController._cursedWait = v1079
                end
                if v1079 - TweenController._cursedWait < 20 then
                    return true
                end
                TweenController._cursedWait = nil
            else
                TweenController._cursedWait = nil
            end
        end
        if v536 == 3 then
            local v1080 = Vector3.new(-2151.82, 149.32, -12404.9)
            local v1081 = Vector3.new(-2089.865, 4536.924, -14800.007)
            local v1082 = (v1062.Y > 3500 or v1062.Y < -100) and ((v1062 - v1081).Magnitude < 2000)
            local v1083 = (v1064.Position.Y > 3500 or v1064.Position.Y < -100) and ((v1064.Position - v1081).Magnitude < 2000)
            if v1082 and not v1083 then
                local v1084 = (v1064.Position - v1080).Magnitude
                if v1084 > 15 then
                    return TweenController.Create(CFrame.new(v1080))
                else
                    pcall(function()
                        local v1085 = workspace.Map:FindFirstChild("CakeLoaf")
                        v1085 = v1085 and v1085:FindFirstChild("BigMirror")
                        local v1086 = v1085 and v1085:FindFirstChild("Main")
                        if v1086 and firetouchinterest then
                            firetouchinterest(v1064, v1086, 0)
                            task.wait(0.1)
                            firetouchinterest(v1064, v1086, 1)
                        end
                    end)
                end
            end
        end
        if CaculateDistance(Vector3.new(11256, -2138, 9888), v1061) < CaculateDistance(v1061) - 700 and (v536 == 3) then
            if ScriptStorage.Backpack["Feathered Visage"] then
                local v1087 = CFrame.new(-16269, 23, 1371)
                if CaculateDistance(v1087) > 60 then
                    return TweenController.Create(v1087) and task.wait(1)
                end
                local v1088 = require(game.ReplicatedStorage.Modules.Net)
                v1088:RemoteFunction("SubmarineWorkerSpeak"):InvokeServer("TravelToSubmergedIsland")
                AwaitUntilPlayerLoaded(game.Players.LocalPlayer)
            end
        end
        local v1089 = v1063:FindFirstChildOfClass("Humanoid")
        if not v1089 or v1089.Health <= 0 or v1064.Anchored then
            return false
        end
        local v1090 = getgenv().KaitunMovementConfig
        local v1091 = math.clamp(tonumber(type(v1090) == "table" and v1090.Speed) or 275, 50, 325)
        local v1092 = v1064:FindFirstChild("GodmaxFloat")
        if not v1092 then
            v1092 = Instance.new("BodyVelocity")
            v1092.Name = "GodmaxFloat"
            v1092.Parent = v1064
        end
        v1092.MaxForce = Vector3.new(100000, 100000, 100000)
        v1092.Velocity = Vector3.zero
        v1092.P = 10000
        if v1089.FloorMaterial ~= Enum.Material.Air then
            v1089:ChangeState(Enum.HumanoidStateType.Jumping)
        end
        v1089.PlatformStand = false
        if TweenInstance then
            pcall(function()
                TweenInstance:Cancel()
            end)
        end
        v1023 = v1062
        v1024 = os.clock()
        local v1093 = {
            PlaybackState = Enum.PlaybackState.Playing
        }
        local v1094
        local v1095, v1096 = os.clock(), 0
        local v1097 = v1091
        local v1098 = v1064.Position
        local function v1099(p1100)
            if v1094 then
                v1094:Disconnect()
                v1094 = nil
            end
            v1093.PlaybackState = p1100
            if TweenInstance == v1093 then
                TweenInstance = nil
                v1023 = nil
                if getgenv().Tween == v1093 then
                    getgenv().Tween = nil
                end
                if p1100 == Enum.PlaybackState.Completed and (game.Players.LocalPlayer.Character == v1063) then
                    TweenController.HoldPosition()
                end
            end
        end
        v1093.Cancel = function(p1101)
            v1099(Enum.PlaybackState.Cancelled)
        end
        TweenInstance = v1093
        getgenv().Tween = v1093
        v1094 = game:GetService("RunService").Heartbeat:Connect(function(p1102)
            if TweenInstance ~= v1093 or _G.Stop or game.Players.LocalPlayer.Character ~= v1063 or not v1064.Parent or v1089.Health <= 0 or v1064.Anchored or os.clock() - v1095 > 120 then
                v1099(Enum.PlaybackState.Cancelled)
                return
            end
            local v1103 = v1064.Position
            local v1104 = v1062 - v1103
            local v1105 = v1104.Magnitude
            if v1105 <= 2.5 then
                v1064.CFrame = v1061
                v1099(Enum.PlaybackState.Completed)
                return
            end
            if (v1103 - v1098).Magnitude > 40 then
                v1097 = math.max(120, v1097 * 0.7)
                v1096 = os.clock() + 3
            elseif os.clock() >= v1096 then
                v1097 = math.min(v1091, v1097 * 1.08)
                v1096 = os.clock() + 1.5
            end
            local v1106 = math.min(v1097 * math.min(p1102, 0.1), 18, v1105)
            v1098 = v1103 + (v1104.Unit * v1106)
            v1064.CFrame = CFrame.new(v1098) * v1061.Rotation
            v1064.AssemblyLinearVelocity = Vector3.zero
            v1064.AssemblyAngularVelocity = Vector3.zero
        end)
        return v1093
    end
    TweenController.HoldPosition = function(p1107)
        pcall(function()
            if TweenInstance then
                TweenInstance:Cancel()
            end
        end)
        TweenInstance = nil
        getgenv().Tween = nil
        v1023 = nil
        v1024 = 0
        local v1108 = game.Players.LocalPlayer.Character
        local v1109 = v1108 and v1108:FindFirstChild("HumanoidRootPart")
        local v1110 = v1108 and v1108:FindFirstChildOfClass("Humanoid")
        if v1110 and not v1110.PlatformStand then
            v1110.PlatformStand = true
        end
        if v1109 then
            if p1107 then
                local v1111 = typeof(p1107) == "CFrame" and p1107.Position or (typeof(p1107) == "Vector3" and p1107)
                if v1111 and ((v1109.Position - v1111).Magnitude > 3) then
                    if typeof(p1107) == "CFrame" then
                        v1109.CFrame = p1107
                    elseif typeof(p1107) == "Vector3" then
                        v1109.CFrame = CFrame.new(p1107)
                    end
                end
            end
            if v1109.AssemblyLinearVelocity.Magnitude > 0.05 then
                v1109.AssemblyLinearVelocity = Vector3.zero
            end
            if v1109.AssemblyAngularVelocity.Magnitude > 0.05 then
                v1109.AssemblyAngularVelocity = Vector3.zero
            end
            local v1112 = v1109:FindFirstChild("GodmaxFloat")
            if not v1112 then
                v1112 = Instance.new("BodyVelocity")
                v1112.Name = "GodmaxFloat"
                v1112.Parent = v1109
            end
            v1112.MaxForce = Vector3.new(1000000, 1000000, 1000000)
            v1112.Velocity = Vector3.zero
        end
    end
    TweenController.StopMovement = function(p1113)
        pcall(function()
            if TweenInstance then
                TweenInstance:Cancel()
            end
        end)
        TweenInstance = nil
        getgenv().Tween = nil
        v1023 = nil
        v1024 = 0
        local v1114 = game.Players.LocalPlayer.Character
        local v1115 = v1114 and v1114:FindFirstChild("HumanoidRootPart")
        local v1116 = v1114 and v1114:FindFirstChildOfClass("Humanoid")
        if p1113 then
            if v1116 then
                v1116.PlatformStand = false
            end
            if v1115 then
                v1115.AssemblyLinearVelocity = Vector3.zero
                v1115.AssemblyAngularVelocity = Vector3.zero
                local v1117 = v1115:FindFirstChild("GodmaxFloat")
                if v1117 then
                    pcall(function()
                        v1117:Destroy()
                    end)
                end
            end
        else
            if v1116 then
                v1116.PlatformStand = true
            end
            if v1115 then
                v1115.AssemblyLinearVelocity = Vector3.zero
                v1115.AssemblyAngularVelocity = Vector3.zero
                local v1118 = v1115:FindFirstChild("GodmaxFloat")
                if not v1118 then
                    v1118 = Instance.new("BodyVelocity")
                    v1118.Name = "GodmaxFloat"
                    v1118.Parent = v1115
                end
                v1118.MaxForce = Vector3.new(1000000, 1000000, 1000000)
                v1118.Velocity = Vector3.zero
            end
        end
    end
    TweenController.Update = function()
        local v1119 = v399.Character and v399.Character:FindFirstChild("HumanoidRootPart")
        if not v1119 then
            return
        end
        HumanoidRootPart = v1119
    end
end
local v1120 = {}
local v1121 = game:GetService("Players")
local v1122 = game:GetService("RunService")
local v1123 = game:GetService("ReplicatedStorage")
local v1124 = game:GetService("Workspace")
local v1125 = game:GetService("VirtualInputManager")
local v1126 = v1121.LocalPlayer
local v1127 = v1123:WaitForChild("Modules")
local v1128 = v1127:WaitForChild("Net")
local v1129 = v1128:WaitForChild("RE/RegisterAttack")
local v1130 = v1128:WaitForChild("RE/RegisterHit")
local v1131 = v1128:WaitForChild("RE/ShootGunEvent")
local v1132 = v1123:WaitForChild("Remotes"):WaitForChild("Validator2")
local v1133 = game.ReplicatedStorage.Modules
local v1134 = v1133.Net
local v1135, v1136 = v1134:WaitForChild("RE/RegisterHit"), v1134:WaitForChild("RE/RegisterAttack")
local v1137 = {}
local function v1138()
    local v1139 = getgenv().IsInRaid and getgenv().IsInRaid() or (IsInRaid and IsInRaid())
    if not v1139 then
        return false
    end
    local v1140 = CombatController and CombatController.RaidMaxIsland or 0
    local v1141 = CombatController and CombatController.RaidIsland or (FunctionsHandler and FunctionsHandler.RaidController and FunctionsHandler.RaidController.Methods and FunctionsHandler.RaidController.Methods.GetCurrentRaidIsland and FunctionsHandler.RaidController.Methods.GetCurrentRaidIsland:Call())
    local v1142 = v1141 and tonumber(string.match(tostring(v1141.Name), "Island (%d+)")) or v1140
    return v1142 >= 4
end
getgenv().IsRaidKillAuraIsland = v1138
getgenv().KaitunRaidAuraPulse = function()
    local v1143 = getgenv()
    local v1144 = v1143.KaitunRaidAuraStatus
    if not v1144 then
        v1144 = { Attempts = 0, Matched = 0, NextAt = 0 }
        v1143.KaitunRaidAuraStatus = v1144
    end
    local v1145 = os.clock()
    if v1145 < v1144.NextAt then
        return
    end
    v1144.NextAt = v1145 + 0.25
    v1144.Matched = 0
    v1144.Active = false
    if not v1138() then
        v1144.Reason = "not island 4/5"
        return
    end
    local v1146 = CombatController and CombatController.RaidCenter
    local v1147 = game.Players.LocalPlayer.Character
    local v1148 = v1147 and v1147:FindFirstChild("HumanoidRootPart")
    if not v1146 or not v1148 or (v1148.Position - v1146.Position).Magnitude > 1000 then
        v1144.Reason = "travelling to island"
        return
    end
    local v1149 = workspace:FindFirstChild("Enemies")
    if not v1149 then
        v1144.Reason = "enemies unavailable"
        return
    end
    v1144.Active = true
    v1144.Reason = "running"
    v1144.Island = CombatController.RaidMaxIsland
    for v1150, v1151 in ipairs(v1149:GetChildren()) do
        local v1152 = v1151:FindFirstChildOfClass("Humanoid")
        local v1153 = v1151:FindFirstChild("HumanoidRootPart")
        if v1152 and v1153 and (v1152.Health > 0) and ((v1153.Position - v1146.Position).Magnitude <= 800) then
            v1144.Matched = v1144.Matched + 1
            v1144.Attempts = v1144.Attempts + 1
            local v1154, v1155 = pcall(function()
                v1152.Health = 0
            end)
            if not v1154 then
                v1144.Error = tostring(v1155)
            end
        end
    end
end
GetAllBladeHits = function()
    bladehits = {}
    local v1156 = game.Players.LocalPlayer.Character
    local v1157 = v1156 and v1156:FindFirstChild("HumanoidRootPart")
    if not v1157 then
        return bladehits
    end
    local v1158 = v1138 and v1138()
    local v1159 = 60
    for v1160, v1161 in pairs(workspace.Enemies:GetChildren()) do
        if v1161:FindFirstChildOfClass("Humanoid") and v1161:FindFirstChild("HumanoidRootPart") and (v1161.Humanoid.Health > 0) and ((v1161.HumanoidRootPart.Position - v1157.Position).Magnitude <= v1159) then
            table.insert(bladehits, v1161)
        end
    end
    return bladehits
end
Getplayerhit = function()
    bladehits = {}
    local v1162 = game.Players.LocalPlayer.Character
    local v1163 = v1162 and v1162:FindFirstChild("HumanoidRootPart")
    if not v1163 then
        return bladehits
    end
    for v1164, v1165 in pairs(workspace.Characters:GetChildren()) do
        if v1165.Name ~= game.Players.LocalPlayer.Name and v1165:FindFirstChildOfClass("Humanoid") and v1165:FindFirstChild("HumanoidRootPart") and (v1165.Humanoid.Health > 0) and ((v1165.HumanoidRootPart.Position - v1163.Position).Magnitude <= 60) then
            table.insert(bladehits, v1165)
        end
    end
    return bladehits
end
local v1166 = Services.ReplicatedStorage.Modules.Net
local v1167 = v1166:WaitForChild("RE/RegisterAttack", 15)
local v1168 = v1166:WaitForChild("RE/RegisterHit", 15)
assert(v1167 and v1167:IsA("RemoteEvent") and v1168 and v1168:IsA("RemoteEvent"), "KaitunBF: combat remotes unavailable")
v1137.Attack = function(p1169)
    local v1170 = {}
    for v1171, v1172 in pairs(GetAllBladeHits()) do
        table.insert(v1170, v1172)
    end
    for v1173, v1174 in pairs(Getplayerhit()) do
        table.insert(v1170, v1174)
    end
    if #v1170 == 0 then
        return
    end
    local v1175 = {}
    local v1176 = nil
    for v1177, v1178 in pairs(v1170) do
        local v1179 = v1178:FindFirstChild("HumanoidRootPart")
        local v1180 = v1178:FindFirstChild("Head") or v1178.PrimaryPart or v1179
        if not v1176 then
            v1176 = v1180
        end
        if v1179 then
            table.insert(v1175, { v1178, v1179 })
        end
    end
    if v1176 and (#v1175 > 0) then
        pcall(function()
            v1167:FireServer(0.16, 1)
            local v1181, v1182 = pcall(function()
                return require(game:GetService("ReplicatedStorage"):WaitForChild("Global"))
            end)
            if v1181 and v1182 and v1182.SendHitsToServer then
                v1182.SendHitsToServer(v1176, v1175)
            else
                v1168:FireServer(v1176, v1175)
            end
        end)
    end
    return
end
local v1183 = 0
v1120.Attack = function(p1184, p1185)
    local v1186 = os.clock()
    if v1186 - v1183 < (getgenv().Config_FastAttackSpeed or 0.15) then
        return
    end
    v1183 = v1186
    pcall(function()
        _G.FastAttack = os.time()
    end)
    if not getgenv()._FA_Worker then
        pcall(function()
            v1137:Attack()
        end)
    end
end
CombatController = {
    GRAB = true,
    GRAB_DISTANCE = 300,
    MAX_ATTACK_DURATION = 2,
    MAX_ATTACK_DURATION_2 = 60,
    LEVITATE_TIME = 0,
    CurrentIndex = 1
}
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            local v1187 = game.Players.LocalPlayer
            local v1188 = v1187.Character
            local v1189 = v1188 and v1188:FindFirstChild("HumanoidRootPart")
            if v1189 then
                if not v1189:FindFirstChild("Buddha") then
                    local v1190 = Instance.new("Folder")
                    v1190.Name = "Buddha"
                    v1190.Parent = v1189
                end
                v1189:SetAttribute("HrpSizeScale", Vector3.new(6.5, 6.5, 6.5))
            end
        end)
    end
end)
if getgenv()._GodmaxNoclipConn then
    pcall(function()
        getgenv()._GodmaxNoclipConn:Disconnect()
    end)
    getgenv()._GodmaxNoclipConn = nil
end
getgenv()._GodmaxNoclipConn = game:GetService("RunService").Stepped:Connect(function()
    local v1191 = game.Players.LocalPlayer
    local v1192 = v1191 and v1191.Character
    if v1192 then
        for v1193, v1194 in ipairs(v1192:GetChildren()) do
            if v1194:IsA("BasePart") and v1194.CanCollide then
                v1194.CanCollide = false
            end
        end
        local v1195 = v1192:FindFirstChild("HumanoidRootPart")
        if v1195 and v1195:FindFirstChild("GodmaxFloat") then
            local v1196 = v1192:FindFirstChildOfClass("Humanoid")
            if v1196 and not v1196.PlatformStand then
                v1196.PlatformStand = true
            end
        end
    end
end)
getgenv().ScriptStorage = ScriptStorage
getgenv().CombatController = CombatController
LastFound = os.time()
CombatController.Grab = function(p1197)
    pcall(sethiddenproperty, game.Players.LocalPlayer, "SimulationRadius", math.huge)
    if not CombatController.GRAB or GrabDebounce == os.time() then
        return
    end
    GrabDebounce = os.time()
    local v1198, v1199 = Vector3.zero, 0
    ForcePosition = nil
    local v1200 = {}
    for v1201, v1202 in Services.Workspace.Enemies:GetChildren() do
        local v1203 = v1202.Name == p1197 or (CombatController.MobNameMatches and CombatController.MobNameMatches(v1202.Name, p1197))
        if v1203 then
            if v1202:FindFirstChildOfClass("Humanoid") and v1202:FindFirstChild("HumanoidRootPart") and (v1202.Humanoid.Health > 0) then
                local v1204 = v1202.HumanoidRootPart.Position
                local v1205 = v1202.PrimaryPart or v1202:FindFirstChild("HumanoidRootPart")
                local v1206 = false
                pcall(function()
                    v1206 = isnetworkowner(v1205)
                end)
                if v1204 and v1206 then
                    if not ForcePosition or CaculateDistance(v1204, ForcePosition) < CombatController.GRAB_DISTANCE then
                        v1199 = v1199 + 1
                        v1202.SetAttribute(v1202, "OldPosition", v1202:GetAttribute("OldPosition") or v1204)
                        v1198 = v1198 + v1204
                        ForcePosition = ForcePosition or v1204
                        table.insert(v1200, v1202)
                    end
                end
            end
        end
    end
    if v1199 == 0 then
        return
    end
    v1198 = CFrame.new(v1198 / v1199)
    pcall(function()
        for v1207, v1208 in ipairs(Services.Workspace.Enemies:GetChildren()) do
            local v1209 = v1208.Name == p1197 or (CombatController.MobNameMatches and CombatController.MobNameMatches(v1208.Name, p1197))
            if v1209 and not table.find(v1200, v1208) then
                if v1208:FindFirstChildOfClass("Humanoid") and v1208:FindFirstChild("HumanoidRootPart") and (v1208.Humanoid.Health > 0) then
                    local v1210 = v1208.PrimaryPart or v1208:FindFirstChild("HumanoidRootPart")
                    local v1211 = false
                    pcall(function()
                        v1211 = isnetworkowner(v1210)
                    end)
                    if v1211 and ((v1208.HumanoidRootPart.Position - v1198.Position).Magnitude <= 300) then
                        v1208.SetAttribute(v1208, "OldPosition", v1208:GetAttribute("OldPosition") or v1208.HumanoidRootPart.Position)
                        table.insert(v1200, v1208)
                    end
                end
            end
        end
    end)
    table.foreach(v1200, function(p1212, p1213)
        pcall(function()
            if not p1213 or not p1213.Parent then
                return
            end
            if p1213:GetAttribute("IgnoreGrab") then
                return
            end
            if (p1213:GetAttribute("FailureCount") or 0) > 7 then
                return
            end
            local v1214 = p1213:FindFirstChild("HumanoidRootPart")
            if not v1214 then
                return
            end
            local v1215 = v1214:FindFirstChild("FarmingVelocity")
            if not v1215 then
                v1215 = Instance.new("BodyVelocity")
                v1215.Name = "FarmingVelocity"
                v1215.MaxForce = Vector3.new(4000, 4000, 4000)
                v1215.Parent = v1214
            end
            v1215.Velocity = Vector3.new(0, 0, 0)
            local v1216 = v1214:FindFirstChild("FarmingPosition")
            if not v1216 then
                v1216 = Instance.new("BodyPosition")
                v1216.Name = "FarmingPosition"
                v1216.MaxForce = Vector3.new(4000, 4000, 4000)
                v1216.P = 4.12
                v1216.D = 1000
                v1216.Parent = v1214
            end
            p1213:SetAttribute("IsGrabbed", true)
            p1213.HumanoidRootPart.CFrame = v1198
            p1213:SetAttribute("MidPoint", v1198)
        end)
    end)
end
Sort1 = function(p1217)
    return p1217 and p1217:FindFirstChild("HumanoidRootPart") and math.floor(CaculateDistance(p1217.HumanoidRootPart.CFrame))
end
ScriptStorage.DenseCampCache = ScriptStorage.DenseCampCache or {}
CombatController.GetAnchorFloorY = function(p1218)
    if not p1218 then
        return 70
    end
    local v1219 = RaycastParams.new()
    v1219.FilterType = Enum.RaycastFilterType.Blacklist
    v1219.FilterDescendantsInstances = { game.Players.LocalPlayer.Character, workspace.Enemies }
    local v1220 = Vector3.new(p1218.X, p1218.Y + 25, p1218.Z)
    local v1221 = workspace:Raycast(v1220, Vector3.new(0, -60, 0), v1219)
    if v1221 then
        return v1221.Position.Y + 2.5
    end
    return p1218.Y
end
CombatController._mobKeyCache = CombatController._mobKeyCache or {}
CombatController.StripLevel = function(p1222)
    local v1223 = tostring(p1222 or "")
    v1223 = v1223:gsub("%s*%[Lv%.?%s*%d+%]%s*", ""):gsub("^%s+", ""):gsub("%s+$", "")
    return v1223
end
CombatController.MobNameMatches = function(p1224, p1225)
    if not p1224 or not p1225 then
        return false
    end
    if p1224 == p1225 then
        return true
    end
    local v1226, v1227 = tostring(p1224), tostring(p1225)
    if v1226 == v1227 then
        return true
    end
    local v1228 = string.lower(CombatController.StripLevel(v1226))
    local v1229 = string.lower(CombatController.StripLevel(v1227))
    if v1228 == v1229 then
        return true
    end
    v1228 = v1228:gsub("^mil%.?%s*", "military ")
    v1229 = v1229:gsub("^mil%.?%s*", "military ")
    if v1228 == v1229 then
        return true
    end
    if v1228 == v1229 .. "s" or v1229 == v1228 .. "s" then
        return true
    end
    return false
end
CombatController.ResolveMobKey = function(p1230)
    if not p1230 then
        return nil
    end
    p1230 = tostring(p1230)
    local v1231 = CombatController._mobKeyCache
    if v1231[p1230] then
        return v1231[p1230]
    end
    if ScriptStorage.MobRegions and ScriptStorage.MobRegions[p1230] then
        v1231[p1230] = p1230
        return p1230
    end
    local v1232 = workspace:FindFirstChild("Enemies")
    if v1232 and v1232:FindFirstChild(p1230) then
        v1231[p1230] = p1230
        return p1230
    end
    if ScriptStorage.MobRegions then
        for v1233, v1234 in pairs(ScriptStorage.MobRegions) do
            if CombatController.MobNameMatches(v1233, p1230) then
                v1231[p1230] = v1233
                return v1233
            end
        end
    end
    if v1232 then
        for v1235, v1236 in ipairs(v1232:GetChildren()) do
            if v1236:IsA("Model") and CombatController.MobNameMatches(v1236.Name, p1230) then
                v1231[p1230] = v1236.Name
                return v1236.Name
            end
        end
    end
    local v1237 = game:GetService("ReplicatedStorage"):FindFirstChild("FortBuilderReplicatedSpawnPositionsFolder")
    if v1237 then
        for v1238, v1239 in ipairs(v1237:GetChildren()) do
            if CombatController.MobNameMatches(v1239.Name, p1230) or CombatController.MobNameMatches(tostring(v1239), p1230) then
                v1231[p1230] = v1239.Name
                return v1239.Name
            end
        end
    end
    return p1230
end
CombatController.GetGrabRadius = function(p1240, p1241, p1242)
    local v1243 = CombatController.GetSubCamps and CombatController.GetSubCamps(p1240)
    if v1243 and (#v1243 > 0) and p1241 then
        local v1244, v1245 = nil, math.huge
        for v1246, v1247 in ipairs(v1243) do
            if v1247.center then
                local v1248 = (v1247.center - p1241).Magnitude
                if v1248 < v1245 then
                    v1245 = v1248
                    v1244 = v1247
                end
            end
        end
        if v1244 and (v1245 <= (v1244.radius or 250) + 120) then
            return math.min(300, math.max(260, (v1244.radius or 220) + 30))
        end
    end
    return 280
end
CombatController.MeleeInternalName = function(p1249)
    if not p1249 then
        return nil
    end
    local v1250 = tostring(p1249)
    if v1250:find("Dark Step") or v1250:find("Black Leg") then
        return "Black Leg"
    end
    if v1250:find("Water Kung") or v1250:find("Fishman Karate") then
        return "Fishman Karate"
    end
    if v1250:find("Dragon Breath") or v1250:find("Dragon Claw") then
        return "Dragon Claw"
    end
    if v1250:find("Electric Claw") then
        return "Electric Claw"
    end
    if v1250:find("Electro") or v1250:find("Electric") then
        return "Electro"
    end
    if v1250:find("Superhuman") then
        return "Superhuman"
    end
    if v1250:find("Death Step") then
        return "Death Step"
    end
    if v1250:find("Sharkman") then
        return "Sharkman Karate"
    end
    if v1250:find("Dragon Talon") then
        return "Dragon Talon"
    end
    if v1250:find("Godhuman") then
        return "Godhuman"
    end
    if v1250:find("Sanguine") then
        return "SanguineArt"
    end
    local v1251 = v1250:lower():gsub("[^%w]", "")
    local v1252 = {
        "Black Leg",
        "Electro",
        "Fishman Karate",
        "Dragon Claw",
        "Superhuman",
        "Death Step",
        "Sharkman Karate",
        "Electric Claw",
        "Dragon Talon",
        "Godhuman",
        "SanguineArt"
    }
    for v1253, v1254 in ipairs(v1252) do
        if v1251 == v1254:lower():gsub("[^%w]", "") then
            return v1254
        end
    end
    return v1250
end
CombatController.EquipMeleeStyle = function(p1255)
    if not p1255 or p1255 == "" then
        return false
    end
    local v1256 = game.Players.LocalPlayer
    local v1257 = v1256.Character and v1256.Character:FindFirstChildOfClass("Tool")
    if v1257 and (CombatController.MeleeInternalName(v1257.Name) == p1255) then
        return true
    end
    for v1258, v1259 in ipairs({ v1256.Character, v1256:FindFirstChild("Backpack") }) do
        if v1259 then
            for v1260, v1261 in ipairs(v1259:GetChildren()) do
                if v1261:IsA("Tool") and (v1261.Name ~= "Tool") and (CombatController.MeleeInternalName(v1261.Name) == p1255) then
                    local v1262 = false
                    pcall(function()
                        v1256.Character:WaitForChild("Humanoid"):EquipTool(v1261)
                        v1262 = true
                    end)
                    if v1262 then
                        return true
                    end
                end
            end
        end
    end
    return false
end
CombatController.FixedFarmSpots = {
    Mercenary = {
        { center = Vector3.new(-960, 73, 1691), floorY = 72.4, name = "Lua Trai Nam" },
        { center = Vector3.new(-1095, 73, 1154), floorY = 71.9, name = "Lua Trai Bac" }
    }
}
CombatController.MobAttackHeightOverride = { Vampire = 15 }
CombatController.SubCampsCache = CombatController.SubCampsCache or {}
CombatController.GetSubCamps = function(p1263)
    if not p1263 then
        return {}
    end
    if CombatController.FixedFarmSpots and CombatController.FixedFarmSpots[p1263] then
        return CombatController.FixedFarmSpots[p1263]
    end
    if CombatController.SubCampsCache[p1263] then
        return CombatController.SubCampsCache[p1263]
    end
    local v1264 = CombatController.ResolveMobKey and CombatController.ResolveMobKey(p1263) or p1263
    local v1265 = ScriptStorage.MobRegions and (ScriptStorage.MobRegions[p1263] or ScriptStorage.MobRegions[v1264])
    if not v1265 or #v1265 == 0 then
        local v1266 = game:GetService("ReplicatedStorage"):FindFirstChild("FortBuilderReplicatedSpawnPositionsFolder")
        if v1266 then
            v1265 = {}
            for v1267, v1268 in ipairs(v1266:GetChildren()) do
                if v1268.Name == p1263 or tostring(v1268) == p1263 or v1268.Name == v1264 or (CombatController.MobNameMatches and (CombatController.MobNameMatches(v1268.Name, p1263) or CombatController.MobNameMatches(tostring(v1268), p1263))) then
                    table.insert(v1265, v1268.CFrame)
                end
            end
            if #v1265 > 0 then
                ScriptStorage.MobRegions = ScriptStorage.MobRegions or {}
                ScriptStorage.MobRegions[p1263] = v1265
                if v1264 ~= p1263 then
                    ScriptStorage.MobRegions[v1264] = v1265
                end
            end
        end
    end
    if not v1265 or #v1265 == 0 then
        return {}
    end
    local v1269 = {}
    for v1270, v1271 in ipairs(v1265) do
        local v1272 = typeof(v1271) == "CFrame" and v1271.Position or v1271
        table.insert(v1269, v1272)
    end
    local function v1273(p1274)
        local v1275 = Vector3.zero
        for v1276, v1277 in ipairs(p1274) do
            v1275 = v1275 + v1277
        end
        return v1275 / #p1274
    end
    local v1278 = {}
    do
        local v1279 = #v1269
        local v1280, v1281, v1282 = v1269[1], v1269[1], 0
        for v1283 = 1, v1279 do
            for v1284 = v1283 + 1, v1279 do
                local v1285 = (v1269[v1283] - v1269[v1284]).Magnitude
                if v1285 > v1282 then
                    v1282 = v1285
                    v1280, v1281 = v1269[v1283], v1269[v1284]
                end
            end
        end
        if v1279 <= 1 or v1282 <= 180 then
            local v1286 = v1273(v1269)
            v1278 = {
                {
                    center = v1286,
                    spawns = v1269,
                    name = "Toàn Bãi",
                    floorY = CombatController.GetAnchorFloorY(v1286),
                    radius = 220,
                    isMultiWave = false
                }
            }
        else
            local v1287, v1288 = {}, {}
            for v1289, v1290 in ipairs(v1269) do
                if (v1290 - v1280).Magnitude <= (v1290 - v1281).Magnitude then
                    table.insert(v1287, v1290)
                else
                    table.insert(v1288, v1290)
                end
            end
            if #v1287 == 0 then
                v1287 = { v1280 }
            end
            if #v1288 == 0 then
                v1288 = { v1281 }
            end
            local v1291, v1292 = v1273(v1287), v1273(v1288)
            local function v1293(p1294, p1295)
                local v1296 = 0
                for v1297, v1298 in ipairs(p1295) do
                    local v1299 = (v1298 - p1294).Magnitude
                    if v1299 > v1296 then
                        v1296 = v1299
                    end
                end
                return math.max(220, v1296 + 40)
            end
            v1278 = {
                {
                    center = v1291,
                    spawns = v1287,
                    name = "Đợt 1",
                    floorY = CombatController.GetAnchorFloorY(v1291),
                    radius = v1293(v1291, v1287),
                    isMultiWave = true
                },
                {
                    center = v1292,
                    spawns = v1288,
                    name = "Đợt 2",
                    floorY = CombatController.GetAnchorFloorY(v1292),
                    radius = v1293(v1292, v1288),
                    isMultiWave = true
                }
            }
        end
    end
    CombatController.SubCampsCache[p1263] = v1278
    return v1278
end
CombatController.GetBestSubCamp = function(p1300, p1301)
    local v1302 = CombatController.GetSubCamps(p1300)
    if #v1302 == 0 then
        return nil
    end
    if #v1302 == 1 then
        return v1302[1]
    end
    local v1303 = {}
    for v1304, v1305 in ipairs(v1302) do
        v1303[v1304] = 0
        for v1306, v1307 in ipairs(workspace.Enemies:GetChildren()) do
            local v1308 = CombatController.MobNameMatches and CombatController.MobNameMatches(v1307.Name, p1300)
            if (v1307.Name == p1300 or v1308) and v1307:FindFirstChildOfClass("Humanoid") and (v1307.Humanoid.Health > 0) then
                local v1309 = v1307:FindFirstChild("HumanoidRootPart")
                if v1309 and ((v1309.Position - v1305.center).Magnitude <= (v1305.radius or 160)) then
                    v1303[v1304] = v1303[v1304] + 1
                end
            end
        end
    end
    if p1301 then
        for v1310, v1311 in ipairs(v1302) do
            local v1312 = (v1311.radius or 250) + 40
            if (v1311.center - p1301).Magnitude < v1312 then
                if v1303[v1310] >= 1 then
                    return v1311
                end
            end
        end
    end
    local v1313 = nil
    local v1314 = 0
    for v1315, v1316 in ipairs(v1302) do
        local v1317 = (v1316.radius or 250) + 40
        local v1318 = p1301 and ((v1316.center - p1301).Magnitude < v1317)
        if not v1318 and (v1303[v1315] > v1314) then
            v1314 = v1303[v1315]
            v1313 = v1316
        end
    end
    if not v1313 then
        for v1319, v1320 in ipairs(v1302) do
            if v1303[v1319] > v1314 then
                v1314 = v1303[v1319]
                v1313 = v1320
            end
        end
    end
    return v1313 or v1302[1]
end
CombatController.GetDenseCampCenter = function(p1321)
    if not p1321 then
        return nil
    end
    if ScriptStorage.DenseCampCache[p1321] then
        return ScriptStorage.DenseCampCache[p1321]
    end
    local v1322 = CombatController.ResolveMobKey and CombatController.ResolveMobKey(p1321) or p1321
    local v1323 = ScriptStorage.MobRegions and (ScriptStorage.MobRegions[p1321] or ScriptStorage.MobRegions[v1322])
    if not v1323 or #v1323 == 0 then
        local v1324 = game:GetService("ReplicatedStorage"):FindFirstChild("FortBuilderReplicatedSpawnPositionsFolder")
        if v1324 then
            v1323 = {}
            for v1325, v1326 in ipairs(v1324:GetChildren()) do
                if v1326.Name == p1321 or tostring(v1326) == p1321 or v1326.Name == v1322 or (CombatController.MobNameMatches and (CombatController.MobNameMatches(v1326.Name, p1321) or CombatController.MobNameMatches(tostring(v1326), p1321))) then
                    table.insert(v1323, v1326.CFrame)
                end
            end
            if #v1323 > 0 then
                ScriptStorage.MobRegions = ScriptStorage.MobRegions or {}
                ScriptStorage.MobRegions[p1321] = v1323
            end
        end
    end
    if not v1323 or #v1323 == 0 then
        local v1327 = workspace:FindFirstChild("_WorldOrigin")
        local v1328 = v1327 and v1327:FindFirstChild("EnemySpawns")
        if v1328 then
            v1323 = {}
            for v1329, v1330 in ipairs(v1328:GetChildren()) do
                if v1330.Name:find(p1321) then
                    table.insert(v1323, v1330.CFrame)
                end
            end
        end
    end
    if not v1323 or #v1323 == 0 then
        return nil
    end
    if #v1323 == 1 then
        local v1331 = v1323[1]
        local v1332 = typeof(v1331) == "CFrame" and v1331.Position or v1331
        ScriptStorage.DenseCampCache[p1321] = v1332
        return v1332
    end
    local v1333 = nil
    local v1334 = -1
    for v1335, v1336 in ipairs(v1323) do
        local v1337 = typeof(v1336) == "CFrame" and v1336.Position or v1336
        local v1338 = 0
        local v1339, v1340, v1341 = 0, 0, 0
        for v1342, v1343 in ipairs(v1323) do
            local v1344 = typeof(v1343) == "CFrame" and v1343.Position or v1343
            if (v1337 - v1344).Magnitude <= 300 then
                v1338 = v1338 + 1
                v1339 = v1339 + v1344.X
                v1340 = v1340 + v1344.Y
                v1341 = v1341 + v1344.Z
            end
        end
        if v1338 > v1334 then
            v1334 = v1338
            v1333 = Vector3.new(v1339 / v1338, v1340 / v1338, v1341 / v1338)
        end
    end
    if not v1333 and (#v1323 > 0) then
        local v1345, v1346, v1347 = 0, 0, 0
        for v1348, v1349 in ipairs(v1323) do
            local v1350 = typeof(v1349) == "CFrame" and v1349.Position or v1349
            v1345 = v1345 + v1350.X
            v1346 = v1346 + v1350.Y
            v1347 = v1347 + v1350.Z
        end
        v1333 = Vector3.new(v1345 / #v1323, v1346 / #v1323, v1347 / #v1323)
    end
    ScriptStorage.DenseCampCache[p1321] = v1333
    return v1333
end
CombatController.IsFarmCandidate = function(p1351, p1352)
    local v1353 = workspace:FindFirstChild("Enemies")
    if not v1353 or not p1351 or p1351.Parent ~= v1353 or not p1351:IsA("Model") then
        return false
    end
    local v1354 = p1351:FindFirstChildOfClass("Humanoid")
    local v1355 = p1351:FindFirstChild("HumanoidRootPart")
    if not v1354 or v1354.Health <= 0 or not v1355 or not v1355:IsA("BasePart") then
        return false
    end
    if v1355.Position.Magnitude <= 100 or v1355.Position.Y <= -3500 then
        return false
    end
    if (tonumber(p1351:GetAttribute("FailureCount")) or 0) >= 3 then
        return false
    end
    if tick() < (tonumber(getgenv().KaitunNoPrisonerUntil) or 0) and p1351.Name:lower():find("prisoner", 1, true) then
        return false
    end
    if type(p1352) == "table" then
        for v1356, v1357 in ipairs(p1352) do
            if CombatController.MobNameMatches(p1351.Name, v1357) then
                return true
            end
        end
        return false
    end
    return CombatController.MobNameMatches(p1351.Name, p1352)
end
CombatController.Search = function(p1358)
    local v1359 = workspace:FindFirstChild("Enemies")
    if not v1359 then
        return nil
    end
    local v1360 = type(p1358) == "table" and p1358[1] or p1358
    local v1361 = CombatController.GetBestSubCamp and CombatController.GetBestSubCamp(v1360, CombatController._fixedAnchorPos)
    local v1362 = v1361 and v1361.center or (CombatController.GetDenseCampCenter and CombatController.GetDenseCampCenter(v1360))
    local v1363, v1364, v1365 = nil, math.huge, math.huge
    for v1366, v1367 in ipairs(v1359:GetChildren()) do
        if CombatController.IsFarmCandidate(v1367, p1358) then
            local v1368 = v1367:FindFirstChild("HumanoidRootPart")
            local v1369 = v1362 and ((v1368.Position - v1362).Magnitude > 320) and 1 or 0
            local v1370 = Sort1(v1367) or math.huge
            if v1369 < v1364 or (v1369 == v1364 and (v1370 < v1365)) then
                v1363, v1364, v1365 = v1367, v1369, v1370
            end
        end
    end
    return v1363
end
BossNames = {
    rip_indra = true,
    ["rip_indra True Form"] = true,
    ["Dough King"] = true,
    ["Cake Prince"] = true,
    Longma = true,
    ["Cake Queen"] = true,
    ["Beautiful Pirate"] = false,
    ["Captain Elephant"] = true,
    ["Hydra Leader"] = false,
    Darkbeard = true,
    Core = true,
    ["Don Swan"] = true,
    ["Saber Expert"] = true,
    Jeremy = true,
    ["Ice Admiral"] = true,
    ["Cursed Captain"] = true,
    ["Mob Leader"] = true,
    ["Tyrant of the Skies"] = true
}
CombatController.IsBoss = function(p1371)
    if not p1371 then
        return false
    end
    local v1372 = typeof(p1371) == "Instance" and p1371.Name or tostring(p1371)
    v1372 = CombatController.StripLevel and CombatController.StripLevel(v1372) or v1372
    return BossNames[v1372] ~= nil or (BossesOrderLevel and (BossesOrderLevel[v1372] ~= nil)) or (BossesOrderWL and (BossesOrderWL[v1372] ~= nil)) or (SpecialBossesOrder and (SpecialBossesOrder[v1372] ~= nil))
end
CombatController.FindAliveMob = function(p1373, p1374)
    if not p1373 then
        return nil
    end
    local v1375 = workspace:FindFirstChild("Enemies")
    if not v1375 then
        return nil
    end
    local v1376 = nil
    local v1377 = math.huge
    local v1378 = p1374
    if not v1378 then
        local v1379 = LocalPlayer.Character
        local v1380 = v1379 and v1379:FindFirstChild("HumanoidRootPart")
        v1378 = v1380 and v1380.Position
    end
    local v1381 = v1375:GetChildren()
    for v1382, v1383 in ipairs(v1381) do
        if CombatController.IsFarmCandidate(v1383, p1373) and (v1383 ~= LocalPlayer.Character) then
            local v1384 = false
            if type(p1373) == "table" then
                for v1385, v1386 in ipairs(p1373) do
                    if v1383.Name == v1386 or (CombatController.MobNameMatches and CombatController.MobNameMatches(v1383.Name, v1386)) then
                        v1384 = true
                        break
                    end
                end
            else
                v1384 = v1383.Name == p1373 or (CombatController.MobNameMatches and CombatController.MobNameMatches(v1383.Name, p1373))
            end
            if v1384 then
                local v1387 = v1383:FindFirstChildOfClass("Humanoid")
                local v1388 = v1383:FindFirstChild("HumanoidRootPart")
                if v1387 and (v1387.Health > 0) and v1388 and (v1388.Position.Magnitude > 100) and (v1388.Position.Y > -3500) then
                    local v1389 = v1378 and (v1388.Position - v1378).Magnitude or 0
                    if v1389 < v1377 then
                        v1377 = v1389
                        v1376 = v1383
                    end
                end
            end
        end
    end
    return v1376
end
CombatController.FindEnemyByName = function(p1390)
    if not p1390 then
        return nil
    end
    local v1391 = {}
    if workspace:FindFirstChild("Enemies") then
        table.insert(v1391, workspace.Enemies)
    end
    if workspace:FindFirstChild("Characters") then
        table.insert(v1391, workspace.Characters)
    end
    for v1392, v1393 in ipairs(v1391) do
        for v1394, v1395 in ipairs(v1393:GetChildren()) do
            if v1395:IsA("Model") and (v1395 ~= LocalPlayer.Character) and (v1395.Name == p1390 or (CombatController.MobNameMatches and CombatController.MobNameMatches(v1395.Name, p1390))) then
                local v1396 = v1395:FindFirstChildOfClass("Humanoid")
                local v1397 = v1395:FindFirstChild("HumanoidRootPart")
                if v1396 and (v1396.Health > 0) and v1397 and v1395:IsDescendantOf(workspace) and (v1397.Position.Magnitude > 100) and (v1397.Position.Y > -3500) then
                    return v1395
                end
            end
        end
    end
    local v1398 = workspace:FindFirstChild(p1390)
    if v1398 and v1398:IsA("Model") and (v1398 ~= LocalPlayer.Character) then
        local v1399 = v1398:FindFirstChildOfClass("Humanoid")
        local v1400 = v1398:FindFirstChild("HumanoidRootPart")
        if v1399 and (v1399.Health > 0) and v1400 and (v1400.Position.Magnitude > 100) and (v1400.Position.Y > -3500) then
            return v1398
        end
    end
    return nil
end
CombatController.FindTopPriorityBoss = function()
    local v1401 = { "Dough King", "rip_indra True Form", "rip_indra", "Tyrant of the Skies" }
    for v1402, v1403 in ipairs(v1401) do
        local v1404 = CombatController.FindEnemyByName(v1403)
        if v1404 then
            return v1404, v1404.Name
        end
    end
    return nil
end
CombatController.FindCakePrince = function()
    local v1405 = {}
    if workspace:FindFirstChild("Enemies") then
        table.insert(v1405, workspace.Enemies)
    end
    if workspace:FindFirstChild("Characters") then
        table.insert(v1405, workspace.Characters)
    end
    table.insert(v1405, workspace)
    for v1406, v1407 in ipairs(v1405) do
        for v1408, v1409 in ipairs(v1407:GetChildren()) do
            if v1409:IsA("Model") and (v1409 ~= LocalPlayer.Character) then
                local v1410 = v1409.Name:lower()
                if v1410:find("cake prince") or v1410:find("dough king") then
                    local v1411 = v1409:FindFirstChildOfClass("Humanoid")
                    local v1412 = v1409:FindFirstChild("HumanoidRootPart") or v1409:FindFirstChild("Torso") or v1409:FindFirstChild("UpperTorso") or v1409:FindFirstChild("Head") or v1409.PrimaryPart or v1409:FindFirstChildWhichIsA("BasePart")
                    if (not v1411 or v1411.Health > 0) and v1412 then
                        return v1409, v1409.Name
                    end
                end
            end
        end
    end
    return nil
end
CombatController.FindCakeBoss = function()
    return CombatController.FindCakePrince()
end
CombatController.StopCombat = function()
    CombatController._abortCombat = true
    CombatController._fixedAnchorPos = nil
    CombatController._lastMobTarget = nil
    CombatController._lastTweenTarget = nil
    CombatController._lastTweenTime = 0
    if TweenController and TweenController.StopMovement then
        TweenController.StopMovement()
    end
end
CombatController.Attack = function(p1413, p1414, p1415, p1416)
    if _G.Stop then
        return
    end
    if _G.ActiveMeleeQuest or CombatController._abortCombat then
        CombatController._abortCombat = nil
        if TweenController and TweenController.StopMovement then
            TweenController.StopMovement()
        end
        return
    end
    pcall(AutoSaveCurrentIslandSpawn)
    local v1417 = nil
    if ScriptStorage.Tools["Sweet Chalice"] and getsenv(game.ReplicatedStorage.GuideModule)._G.InCombat then
        TweenController.Create(Vector3.new(0, 0, 0))
        return
    end
    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
    p1413 = (type(p1413) == "string" or typeof(p1413) == "Instance") and { p1413 } or (p1413 or {})
    for v1418, v1419 in p1413 do
        if _G.ActiveMeleeQuest or CombatController._abortCombat then
            CombatController._abortCombat = nil
            if TweenController and TweenController.StopMovement then
                TweenController.StopMovement()
            end
            break
        end
        local v1420 = tostring(v1419)
        if (v1420 == "Deandre" or v1420 == "Urban" or v1420 == "Diablo") and (os.time() - (LastFire12 or 0) > 180) then
            LastFire12 = os.time()
            Remotes.CommF_:InvokeServer("EliteHunter")
        end
        if p1414 then
            local v1421 = GetMonAsSortedRange()[1]
            local v1422 = v1421 and v1421:FindFirstChild("HumanoidRootPart") and v1421.HumanoidRootPart.Position
            if v1422 and (CaculateDistance(v1422) < p1415) then
                v1417 = v1421
            end
        else
            v1417 = typeof(v1419) == "Instance" and v1419 or (CombatController.FindAliveMob and CombatController.FindAliveMob(v1419, CombatController._fixedAnchorPos))
            if not v1417 then
                v1417 = CombatController.Search(p1413)
            end
            if v1417 and (v1419 == "Don Swan") then
                v1417:SetAttribute("IgnoreGrab", nil)
                v1417:SetAttribute("FailureCount", 0)
            end
        end
        if not v1417 then
            local v1423 = ParseCurrentQuest and ParseCurrentQuest()
            if v1423 and (v1423 == v1420 or v1423 == v1420 .. "s" or v1420:find(v1423) or v1423:find(v1420)) then
                local v1424 = CombatController.GetBestSubCamp and CombatController.GetBestSubCamp(v1420)
                local v1425 = v1424 and v1424.center or CombatController._fixedAnchorPos
                if v1425 then
                    local v1426 = v1424 and v1424.floorY or (CombatController.GetAnchorFloorY and CombatController.GetAnchorFloorY(v1425)) or v1425.Y
                    local v1427 = type(attackHeight) == "number" and attackHeight or (getgenv()._kaitun_attackHeight or 15)
                    TweenController.Create(CFrame.new(v1425.X, v1426 + v1427, v1425.Z))
                end
                local v1428 = os.time() + 35
                while os.time() < v1428 and not v1417 do
                    task.wait(0.05)
                    if _G.Stop or _G.ActiveMeleeQuest or CombatController._abortCombat then
                        break
                    end
                    v1417 = CombatController.FindAliveMob and CombatController.FindAliveMob(p1413, v1425) or (CombatController.Search and CombatController.Search(p1413))
                end
            end
        end
        if v1417 then
            LastFound = os.time()
            do
                local v1429 = v1417 and (v1417.Name == "Don Swan") and v1417 or nil
                local v1430 = v1429 and v1429:FindFirstChildOfClass("Humanoid")
                local v1431 = v1429 and v1429:FindFirstChild("HumanoidRootPart")
                local v1432 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if v1430 and (v1430.Health > 0) and v1431 and v1432 and ((v1432.Position - v1431.Position).Magnitude > 300) then
                    TweenController.Create(CFrame.new(2284.91, 20, 865.48))
                    continue
                end
            end
            do
                local v1433 = v1417 and (v1417.Name == "Cake Prince" or v1417.Name == "Dough King" or (CombatController.MobNameMatches and (CombatController.MobNameMatches(v1417.Name, "Cake Prince") or CombatController.MobNameMatches(v1417.Name, "Dough King"))))
                local v1434 = v1433 and v1417:FindFirstChildOfClass("Humanoid")
                local v1435 = v1433 and v1417:FindFirstChild("HumanoidRootPart")
                local v1436 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if v1434 and (v1434.Health > 0) and v1435 and v1436 and (v1435.Position.Y > 3500 or v1435.Position.Y < -100) and (v1436.Position.Y < 3500 and (v1436.Position.Y > -50)) then
                    local v1437 = CFrame.new(-2151.82, 149.32, -12404.9)
                    TweenController.Create(v1437)
                    if (v1436.Position - v1437.Position).Magnitude <= 20 then
                        pcall(function()
                            local v1438 = workspace.Map:FindFirstChild("CakeLoaf")
                            v1438 = v1438 and v1438:FindFirstChild("BigMirror")
                            local v1439 = v1438 and v1438:FindFirstChild("Main")
                            if v1439 and firetouchinterest then
                                firetouchinterest(v1436, v1439, 0)
                                task.wait(0.1)
                                firetouchinterest(v1436, v1439, 1)
                            end
                        end)
                        task.wait(0.5)
                    end
                    continue
                end
            end
            local v1440, v1441 = 0, os.time()
            local v1442, v1443 = 0, os.time()
            local v1444 = false
            while task.wait() do
                if _G.Stop or _G.ActiveMeleeQuest or CombatController._abortCombat then
                    if TweenController and TweenController.StopMovement then
                        TweenController.StopMovement()
                    end
                    break
                end
                if not v1417 then
                    break
                end
                if ParseCurrentQuest() then
                    v1444 = true
                end
                if v536 == 3 then
                    local v1445 = GetTrueMastery and GetTrueMastery("Electro") or 0
                    local v1446 = ScriptStorage.Tools["Electric Claw"] or (ScriptStorage.Melees["Electric Claw"] or 0) > 0
                    local v1447 = LocalPlayer:FindFirstChild("Data") and LocalPlayer.Data:FindFirstChild("Beli") and LocalPlayer.Data.Beli.Value or ScriptStorage.PlayerData.Beli or 0
                    local v1448 = LocalPlayer:FindFirstChild("Data") and LocalPlayer.Data:FindFirstChild("Fragments") and LocalPlayer.Data.Fragments.Value or ScriptStorage.PlayerData.Fragments or 0
                    if v1445 >= 400 and (v1447 >= 3000000) and (v1448 >= 5000) and not v1446 then
                        if v842 and v842.AbandonQuest and ParseCurrentQuest and ParseCurrentQuest() then
                            pcall(v842.AbandonQuest)
                        end
                        if TweenController and TweenController.StopMovement then
                            TweenController.StopMovement()
                        end
                        CombatController._abortCombat = true
                        break
                    end
                end
                if v536 == 3 and CombatController and CombatController.FindTopPriorityBoss then
                    local v1449, v1450 = CombatController.FindTopPriorityBoss()
                    local v1451 = v1449 and v1417 and (v1417 == v1449 or v1417.Name == v1449.Name or (CombatController.MobNameMatches and CombatController.MobNameMatches(v1417.Name, v1449.Name)))
                    if v1449 and not v1451 then
                        warn("[Sea3 Priority Boss] Phat hien " .. tostring(v1450) .. " xuat hien -> Dung combat hien tai de danh " .. tostring(v1450) .. " truoc!")
                        if v842 and v842.AbandonQuest and ParseCurrentQuest and ParseCurrentQuest() then
                            pcall(v842.AbandonQuest)
                        end
                        if TweenController and TweenController.StopMovement then
                            TweenController.StopMovement()
                        end
                        break
                    end
                end
                if v536 == 3 and CombatController and CombatController.FindCakePrince then
                    local v1452 = CombatController.FindTopPriorityBoss and CombatController.FindTopPriorityBoss()
                    if not v1452 then
                        local v1453, v1454 = CombatController.FindCakePrince()
                        local v1455 = v1453 and v1417 and (v1417 == v1453 or v1417.Name == "Cake Prince" or (CombatController.MobNameMatches and CombatController.MobNameMatches(v1417.Name, "Cake Prince")))
                        if v1453 and not v1455 then
                            warn("[Sea3 Cake Prince] Phat hien Cake Prince xuat hien -> Dung combat hien tai de danh Cake Prince!")
                            if v842 and v842.AbandonQuest and ParseCurrentQuest and ParseCurrentQuest() then
                                pcall(v842.AbandonQuest)
                            end
                            if TweenController and TweenController.StopMovement then
                                TweenController.StopMovement()
                            end
                            break
                        end
                    end
                end
                if ScriptStorage.Tools["Sweet Chalice"] and getsenv(game.ReplicatedStorage.GuideModule)._G.InCombat then
                    TweenController.Create(Vector3.new(0, 0, 0))
                    return
                end
                local v1456 = v1417:FindFirstChildOfClass("Humanoid")
                local v1457 = v1417:FindFirstChild("HumanoidRootPart")
                if not v1456 or v1456.Health <= 0 then
                    TweenController.HoldPosition()
                    local v1458 = v1417 and v1417.Name or ""
                    if v1458 == "Don Swan" then
                        Storage:Set("SwanDefeated", true)
                    end
                    local v1459 = CombatController.IsBoss and (CombatController.IsBoss(v1458) or CombatController.IsBoss(v1419))
                    if v1459 then
                        break
                    end
                    if v1444 and not ParseCurrentQuest() then
                        break
                    end
                    local v1460 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local v1461 = CombatController._fixedAnchorPos
                    local v1462 = CombatController.FindAliveMob(v1458, v1461) or CombatController.FindAliveMob(v1419, v1461)
                    if not v1462 then
                        local v1463 = IsInRaid and IsInRaid() or (CombatController and (CombatController.RaidCenter ~= nil))
                        if v1463 then
                            break
                        end
                        local v1464 = CombatController.GetBestSubCamp and CombatController.GetBestSubCamp(v1458, v1461)
                        local v1465 = v1464 and v1464.center or v1461 or (v1460 and v1460.Position)
                        if v1465 then
                            local v1466 = type(attackHeight) == "number" and attackHeight or (getgenv()._kaitun_attackHeight or 15)
                            local v1467 = v1464 and v1464.floorY or (CombatController.GetAnchorFloorY and CombatController.GetAnchorFloorY(v1465)) or v1465.Y
                            TweenController.Create(CFrame.new(v1465.X, v1467 + v1466, v1465.Z))
                        end
                        local v1468 = os.time()
                        while os.time() - v1468 < 20 do
                            task.wait(0.05)
                            if _G.Stop or _G.ActiveMeleeQuest or CombatController._abortCombat then
                                CombatController._abortCombat = nil
                                break
                            end
                            if v1444 and not ParseCurrentQuest() then
                                break
                            end
                            v1462 = CombatController.FindAliveMob(v1458, v1465) or CombatController.FindAliveMob(v1419, v1465)
                            if v1462 then
                                break
                            end
                        end
                    end
                    if v1462 then
                        v1417 = v1462
                        CombatController._lastMobTarget = v1462
                        local v1469 = v1462:FindFirstChild("HumanoidRootPart")
                        if v1469 then
                            local v1470 = CombatController.GetAnchorFloorY and CombatController.GetAnchorFloorY(v1469.Position) or v1469.Position.Y
                            local v1471 = type(attackHeight) == "number" and attackHeight or (getgenv()._kaitun_attackHeight or 15)
                            local v1472 = v1469.Position.Y < -50 and v1469.Position.Y - 50 or 20
                            local v1473 = CFrame.new(v1469.Position.X, math.max(v1470 + v1471, v1472), v1469.Position.Z)
                            TweenController.Create(v1473)
                        end
                        continue
                    else
                        CombatController._fixedAnchorPos = nil
                        CombatController._lastMobTarget = nil
                        break
                    end
                end
                local v1474 = IsInRaid and IsInRaid() or CombatController.RaidCenter ~= nil
                if v1474 and CombatController.RaidCenter then
                    CombatController._fixedAnchorPos = CombatController.RaidCenter.Position
                    CombatController._lastMobTarget = v1417
                elseif not CombatController._fixedAnchorPos or CombatController._lastMobTarget ~= v1417 then
                    local v1475 = CombatController.GetBestSubCamp and CombatController.GetBestSubCamp(v1417.Name, CombatController._fixedAnchorPos)
                    if v1475 then
                        CombatController._fixedAnchorPos = v1475.center
                    else
                        local v1476 = CombatController.GetDenseCampCenter and CombatController.GetDenseCampCenter(v1417.Name)
                        if v1476 and v1457 and ((v1457.Position - v1476).Magnitude < 350) then
                            CombatController._fixedAnchorPos = v1476
                        else
                            local v1477 = v1417:GetAttribute("OldPosition")
                            if v1477 then
                                CombatController._fixedAnchorPos = v1477
                            elseif v1457 then
                                local v1478 = v1457.Position.Y
                                local v1479 = v536 == 2 and 65 or (v536 == 3 and 40) or 20
                                if v1478 >= v1479 or v1478 < -50 then
                                    CombatController._fixedAnchorPos = v1457.Position
                                end
                            end
                        end
                    end
                    CombatController._lastMobTarget = v1417
                end
                local v1480 = CombatController._fixedAnchorPos or (v1457 and v1457.Position) or Vector3.zero
                local v1481 = CombatController.GetBestSubCamp and CombatController.GetBestSubCamp(v1417.Name, CombatController._fixedAnchorPos)
                local v1482 = v1481 and v1481.radius and v1481.radius + 40 or 280
                if not v1474 and v1457 and ((v1457.Position - v1480).Magnitude > v1482) then
                    v1480 = v1457.Position
                    CombatController._fixedAnchorPos = v1480
                end
                local v1483 = CombatController.GetAnchorFloorY and CombatController.GetAnchorFloorY(v1480)
                local v1484 = type(v1483) == "number" and v1483 or (v1480 and v1480.Y) or 0
                local v1485 = 20
                if v1480 and (v1480.Y < -50) or (v1457 and (v1457.Position.Y < -50)) then
                    local v1486 = v1457 and v1457.Position.Y or (v1480 and v1480.Y) or -2160
                    v1485 = v1486 - 50
                elseif v536 == 1 and (v1480.X > 50000 or (v1457 and (v1457.Position.X > 50000))) then
                    v1485 = 15
                end
                local v1487 = type(v1484) == "number" and v1484 or 0
                local v1488 = v1417 and v1417.Name or nil
                local v1489 = v1488 and CombatController.MobAttackHeightOverride and CombatController.MobAttackHeightOverride[v1488]
                local v1490 = type(v1489) == "number" and v1489 or (type(attackHeight) == "number" and attackHeight) or (getgenv()._kaitun_attackHeight or 15)
                local v1491
                if type(v1489) == "number" then
                    v1491 = v1487 + v1489
                else
                    v1491 = math.max(v1487 + v1490, v1485)
                end
                local v1492 = CFrame.new(v1480.X, v1491, v1480.Z)
                local v1493 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                local v1494 = v1417 and (v1417.Name == "Cake Prince" or v1417.Name == "Dough King" or (CombatController.MobNameMatches and (CombatController.MobNameMatches(v1417.Name, "Cake Prince") or CombatController.MobNameMatches(v1417.Name, "Dough King"))))
                if v1494 and v1493 and (v1493.Position.Y < 3500 and (v1493.Position.Y > -50)) and v1457 and (v1457.Position.Y > 3500 or v1457.Position.Y < -100) then
                    local v1495 = CFrame.new(-2151.82, 149.32, -12404.9)
                    local v1496 = (v1493.Position - v1495.Position).Magnitude
                    if v1496 > 15 then
                        TweenController.Create(v1495)
                        task.wait(0.2)
                        continue
                    else
                        pcall(function()
                            local v1497 = workspace.Map:FindFirstChild("CakeLoaf")
                            v1497 = v1497 and v1497:FindFirstChild("BigMirror")
                            local v1498 = v1497 and v1497:FindFirstChild("Main")
                            if v1498 and firetouchinterest then
                                firetouchinterest(v1493, v1498, 0)
                                task.wait(0.1)
                                firetouchinterest(v1493, v1498, 1)
                            end
                        end)
                        task.wait(0.5)
                        continue
                    end
                end
                local v1499 = v1457 and (v1457.Position - v1480).Magnitude or 0
                local v1500 = CombatController.IsBoss and (CombatController.IsBoss(v1417.Name) or CombatController.IsBoss(v1419))
                if v1500 and v1457 then
                    local v1501 = CombatController.GetAnchorFloorY and CombatController.GetAnchorFloorY(v1457.Position) or v1457.Position.Y
                    v1492 = CFrame.new(v1457.Position.X, math.max(v1501 + v1490, v1485), v1457.Position.Z)
                elseif not v1474 and v1457 and v1493 and (v1499 > 50) then
                    CombatController._mobPullWait = CombatController._mobPullWait or tick()
                    if tick() - CombatController._mobPullWait > 4 then
                        local v1502 = CombatController.GetAnchorFloorY and CombatController.GetAnchorFloorY(v1457.Position) or v1457.Position.Y
                        v1492 = CFrame.new(v1457.Position.X, math.max(v1502 + v1490, v1485), v1457.Position.Z)
                    else
                        v1492 = CFrame.new(v1480.X, v1491, v1480.Z)
                    end
                else
                    CombatController._mobPullWait = nil
                    v1492 = CFrame.new(v1480.X, v1491, v1480.Z)
                end
                local v1503 = CaculateDistance(v1492)
                if v1503 > 25 then
                    TweenController.Create(v1492)
                else
                    TweenController.HoldPosition(v1492)
                end
                if v1503 < 150 then
                    v1418 = p1416 and p1416()
                    if os.clock() - (_lastCombatGrab or 0) >= 0.25 then
                        _lastCombatGrab = os.clock()
                        CombatController.Grab(v1417 and v1417.Name or v1419 or "")
                    end
                    if (FarmFruitMastery or math.huge) - os.time() < 3 and (math.floor(v1417.Humanoid.Health / v1417.Humanoid.MaxHealth * 100) < 30) and not FunctionsHandler.RaidController.Methods.GetCurrentRaidIsland:Call() then
                        TweenController.Create(v1457.CFrame + Vector3.new(0, 25, 0))
                        FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Blox Fruit")
                        LockAimPositionTo(v1417.HumanoidRootPart.CFrame.p)
                        local v1504 = { "Z", "X", "C", "V" }
                        local v1505 = v1504[math.random(1, #v1504)]
                        SendKey(v1505, 0.31)
                    else
                        if not ScriptStorage.ForceToUseSword then
                            local v1506 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
                            if v1506 and (v1506.ToolTip == "Melee" or v1506.Name == "Combat") then
                                local v1507 = v1506:FindFirstChild("Level")
                                local v1508 = ScriptStorage.PlayerData and ScriptStorage.PlayerData.Beli or (LocalPlayer:FindFirstChild("Data") and LocalPlayer.Data:FindFirstChild("Beli") and LocalPlayer.Data.Beli.Value) or 0
                                if v1506.Name == "Combat" and ((ScriptStorage.Melees["Black Leg"] or 0) == 0) and not ScriptStorage.Tools["Black Leg"] and (v1508 >= 150000) and (v536 == 1) then
                                    break
                                end
                                local v1509 = CombatController.IsBoss and (CombatController.IsBoss(v1417.Name) or CombatController.IsBoss(v1419))
                                if not v1509 and (v1506.Name == "Combat") and ((ScriptStorage.Melees["Black Leg"] or 0) > 0 or ScriptStorage.Tools["Black Leg"]) then
                                    if ScriptStorage.FarmingMelee and CombatController.EquipMeleeStyle(ScriptStorage.FarmingMelee) then
                                    else
                                        FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Melee")
                                    end
                                elseif not v1509 and (v1507 and (v1507.Value >= 400)) and ScriptStorage.FarmingMelee and ScriptStorage.Tools[ScriptStorage.FarmingMelee] then
                                    if not CombatController.EquipMeleeStyle(ScriptStorage.FarmingMelee) then
                                        break
                                    end
                                end
                            end
                        end
                        if ScriptStorage.ForceToUseSword then
                            FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Sword")
                        else
                            local v1510 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
                            local v1511 = v1510 and (v1510.ToolTip == "Melee") and (v1510.Name ~= "Combat")
                            if not v1511 then
                                if ScriptStorage.FarmingMelee and CombatController.EquipMeleeStyle(ScriptStorage.FarmingMelee) then
                                else
                                    FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Melee")
                                end
                            end
                        end
                    end
                    v1120:Attack(v1417)
                    if os.time() ~= v1443 then
                        v1443 = os.time()
                        v1440 = v1440 + 1
                        v1442 = v1442 + 1
                    end
                    local v1512 = CombatController.IsBoss and (CombatController.IsBoss(v1417.Name) or CombatController.IsBoss(v1419))
                    if not v1512 and (v1440 > 30) and (v1417.Name ~= "Core") then
                        alert("Take more than 30s to attack, canceling")
                        break
                    end
                end
            end
        elseif not p1414 then
            local v1513 = CombatController.ResolveMobKey and CombatController.ResolveMobKey(v1419) or v1419
            local v1514 = ScriptStorage.MobRegions[v1419] or ScriptStorage.MobRegions[v1513]
            if not v1514 then
                local v1515 = Services.Workspace.Enemies:FindFirstChild(v1419) or Services.Workspace.Enemies:FindFirstChild(v1513)
                if not v1515 and CombatController.MobNameMatches then
                    for v1516, v1517 in ipairs(Services.Workspace.Enemies:GetChildren()) do
                        if CombatController.MobNameMatches(v1517.Name, v1419) then
                            v1515 = v1517
                            break
                        end
                    end
                end
                v1514 = v1515 and { v1515:GetPrimaryPartCFrame().p }
            end
            if not v1514 then
                local v1518 = game:GetService("ReplicatedStorage"):FindFirstChild("FortBuilderReplicatedSpawnPositionsFolder")
                if v1518 then
                    local v1519 = {}
                    for v1520, v1521 in pairs(v1518:GetChildren()) do
                        if tostring(v1521) == tostring(v1419) or tostring(v1521) == tostring(v1513) or (CombatController.MobNameMatches and (CombatController.MobNameMatches(v1521.Name, v1419) or CombatController.MobNameMatches(tostring(v1521), v1419))) then
                            table.insert(v1519, v1521.CFrame.Position)
                        end
                    end
                    if #v1519 > 0 then
                        v1514 = v1519
                    end
                end
            end
            if not v1514 then
                Report("[ Game data error ] Mob with name " .. tostring(v1419) .. " have no spawn region datas")
                return
            end
            local v1522 = CombatController._fixedAnchorPos or (CombatController.GetDenseCampCenter and CombatController.GetDenseCampCenter(v1419))
            if not v1522 and v1514 and (#v1514 > 0) then
                local v1523, v1524, v1525 = 0, 0, 0
                for v1526, v1527 in ipairs(v1514) do
                    local v1528 = typeof(v1527) == "CFrame" and v1527.Position or v1527
                    v1523 = v1523 + v1528.X
                    v1524 = v1524 + v1528.Y
                    v1525 = v1525 + v1528.Z
                end
                v1522 = Vector3.new(v1523 / #v1514, v1524 / #v1514, v1525 / #v1514)
            end
            if v1522 then
                CombatController._fixedAnchorPos = v1522
            end
            local v1529 = v1522 + Vector3.new(0, attackHeight, 0)
            local v1530 = CFrame.new(v1529)
            local v1531 = CaculateDistance(v1530)
            if _G.ActiveMeleeQuest or CombatController._abortCombat then
                CombatController._abortCombat = nil
                if TweenController and TweenController.StopMovement then
                    TweenController.StopMovement()
                end
                return
            end
            if v1531 > 8 then
                if not CombatController._lastTweenTarget or (CombatController._lastTweenTarget - v1529).Magnitude > 5 or os.clock() - (CombatController._lastTweenTime or 0) > 3 then
                    TweenController.Create(v1530)
                    CombatController._lastTweenTarget = v1529
                    CombatController._lastTweenTime = os.clock()
                end
            else
                TweenController.HoldPosition(v1530)
                local v1532 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if v1532 then
                    v1532.CFrame = v1530
                    v1532.AssemblyLinearVelocity = Vector3.zero
                    v1532.AssemblyAngularVelocity = Vector3.zero
                end
            end
        end
    end
end
LevelFarmTTL = 0
LastTravel = os.time()
FunctionsHandler = { Initalized = false }
getgenv().FunctionsHandler = FunctionsHandler
setmetatable(FunctionsHandler, {
    __index = function(p1533, p1534)
        QueryResult = rawget(p1533, p1534)
        if not QueryResult then
            return {
                Register = function(p1535)
                    if p1535 == false then
                        return
                    end
                    Result = {
                        CacheListener = {},
                        RealCache = {},
                        Methods = {},
                        Constants = {},
                        Events = {},
                        Initalized = true
                    }
                    Result.RegisterMethod = function(p1536, p1537, p1538)
                        p1536.Methods[p1537] = {
                            Name = p1537,
                            Callback = p1538,
                            Call = function(p1539, ...)
                                return p1539.Callback(...)
                            end,
                            Events = {}
                        }
                        return true
                    end
                    setmetatable(Result.Constants, {
                        __newindex = function()
                            assert(false, "cannot change constant value!")
                        end
                    })
                    if p1533.Constants[Key] then
                        Result.SaveConstant = function(p1540, p1541, p1542)
                            return assert(false, "constant name was used before!")
                        end
                        rawset(p1533.Constants, Key, Value)
                    end
                    Result.Set = function(p1543, p1544, p1545)
                        p1543.CacheListener[p1544] = p1545
                        return p1545
                    end
                    Result.Get = function(p1546, p1547)
                        return p1546.Constants[p1547] or p1546.RealCache[p1547]
                    end
                    Result.AddVariableChangeListener = function(p1548, p1549, p1550)
                        p1548.Events[p1549] = p1550
                    end
                    Result.CacheListener.__parent = Result
                    setmetatable(Result.CacheListener, {
                        __newindex = function(p1551, p1552, p1553)
                            _ = p1551.__parent.Events[p1552] and p1551.__parent.Events[p1552](p1552, p1553)
                            p1551.__parent.RealCache[p1552] = p1553
                        end
                    })
                    FunctionsHandler[p1534] = Result
                end,
                Initalized = false
            }
        end
        return QueryResult
    end
})
FunctionsHandler.SynchorizeUntilModuleLoaded = function(p1554, p1555)
    local v1556 = os.time()
    while not p1554.Initalized do
        task.wait()
        local v1557 = os.time() - v1556
        assert(not (p1555 and (v1557 > p1555)), "timed out")
    end
end
GetCurrentClaimQuest = function(p1558)
    return ParseCurrentQuest()
end
FunctionsHandler.PullLever:Register()
FunctionsHandler.MirrorAndValk:Register()
FunctionsHandler.LocalPlayerController.Register()
FunctionsHandler.ExpRedeem:Register()
FunctionsHandler.FactoryController:Register()
FunctionsHandler.LevelFarm:Register()
FunctionsHandler.Saber:Register()
FunctionsHandler.Rengoku:Register()
FunctionsHandler.Yama:Register()
FunctionsHandler.Tushita:Register()
FunctionsHandler.Pole:Register()
FunctionsHandler.FoxLamp:Register()
FunctionsHandler.DarkDagger:Register()
FunctionsHandler.Canvander:Register()
FunctionsHandler.BuddySword:Register()
FunctionsHandler.HallowScythe:Register()
FunctionsHandler.CursedDualKatana:Register()
FunctionsHandler.AcidumRifle:Register()
FunctionsHandler.Kabucha:Register()
FunctionsHandler.VenomBow:Register()
FunctionsHandler.SoulGuitar:Register()
FunctionsHandler.DragonStorm:Register()
FunctionsHandler.InsictV2:Register()
FunctionsHandler.RainbowSaviour:Register()
FunctionsHandler.DarkBladeV2:Register()
FunctionsHandler.SecondSeaPuzzle:Register()
FunctionsHandler.ColosseumPuzzle:Register()
FunctionsHandler.Trevor:Register()
FunctionsHandler.EvoRace:Register()
FunctionsHandler.Wenlocktoad:Register()
FunctionsHandler.DarkBladeV3:Register()
FunctionsHandler.ThirdSeaPuzzle:Register()
FunctionsHandler.DojoQuest:Register()
FunctionsHandler.RaceAwakening:Register()
FunctionsHandler.PirateRaid:Register()
FunctionsHandler.RaidController:Register()
FunctionsHandler.MeleesController:Register()
FunctionsHandler.KataFragTask:Register()
FunctionsHandler.Superhuman:Register()
FunctionsHandler.DeathStep:Register()
FunctionsHandler.SharkmanKarate:Register()
FunctionsHandler.ElectricClaw:Register()
FunctionsHandler.DragonTalon:Register()
FunctionsHandler.Godhuman:Register()
FunctionsHandler.BossesTask:Register()
FunctionsHandler.SpecialBossesTask:Register()
FunctionsHandler.CollectDrops:Register()
FunctionsHandler.CollectBerries:Register()
FunctionsHandler.UtillyItemsActivitation:Register()
local v1559 = {
    Rocket = 5000,
    Spin = 7500,
    Chop = 30000,
    Spring = 60000,
    Bomb = 80000,
    Smoke = 100000,
    Spike = 180000,
    Flame = 250000,
    Falcon = 300000,
    Ice = 350000,
    Sand = 420000,
    Dark = 500000,
    Diamond = 600000,
    Light = 650000,
    Rubber = 750000,
    Barrier = 800000,
    Ghost = 940000,
    Magma = 850000,
    Quake = 1000000,
    Buddha = 1200000,
    Love = 1300000,
    Spider = 1500000,
    Sound = 1700000,
    Phoenix = 1800000,
    Portal = 1900000,
    Rumble = 2100000,
    Pain = 2300000,
    Blizzard = 2400000,
    Gravity = 2500000,
    Mammoth = 2700000,
    ["T-Rex"] = 2700000,
    Dough = 2800000,
    Shadow = 2900000,
    Venom = 3000000,
    Control = 3200000,
    Spirit = 3400000,
    Dragon = 3500000,
    Leopard = 5000000,
    Kitsune = 8000000
}
local v1560 = {
    "Gravity",
    "Mammoth",
    "T-Rex",
    "Dough",
    "Shadow",
    "Venom",
    "Control",
    "Spirit",
    "Dragon",
    "Leopard",
    "Kitsune",
    "Gas",
    "Yeti",
    "Tiger",
    "Creation"
}
CheckFruitRequirements = function()
    local v1561 = 0
    local v1562 = 0
    local v1563 = game.Players.LocalPlayer
    pcall(function()
        local v1564 = require(game.ReplicatedStorage.ItemReplicationService)
        local v1565 = v1564._UserCache and v1564._UserCache[v1563.UserId]
        if v1565 then
            local v1566 = v1565:GetItems("Quantity")
            local v1567 = require(game.ReplicatedStorage.ItemConfig)
            for v1568, v1569 in pairs(v1566 or {}) do
                pcall(function()
                    local v1570 = v1567.match(v1569.ItemId):unwrap()
                    if v1570 and v1570.Index and (v1570.Index.IdType == "PhysicalMoveset") then
                        local v1571 = v1570.Index.DebugLabel:gsub("%s*%[.-%]%s*$", "")
                        for v1572, v1573 in pairs(v1559) do
                            if string.find(v1571, v1572) then
                                local v1574 = false
                                for v1575, v1576 in ipairs(v1560) do
                                    if v1576 == v1572 or string.find(v1571, v1576) then
                                        v1574 = true
                                        break
                                    end
                                end
                                local v1577 = v1569.Value or 1
                                if v1573 >= 1000000 and not v1574 then
                                    v1561 = v1561 + v1577
                                elseif v1573 < 1000000 and not v1574 then
                                    v1562 = v1562 + v1577
                                end
                                break
                            end
                        end
                    end
                end)
            end
        end
    end)
    return v1561 >= 1, v1562 >= 5
end
local function v1578()
    local v1579 = game.Players.LocalPlayer
    if v1579 then
        local v1580 = v1579:FindFirstChild("Backpack")
        local v1581 = v1579.Character
        if v1580 and v1580:FindFirstChild("Lightning Bolt") or (v1581 and v1581:FindFirstChild("Lightning Bolt")) then
            return true
        end
        if v1580 and v1580:FindFirstChild("Electro") or (v1581 and v1581:FindFirstChild("Electro")) then
            return true
        end
    end
    if ScriptStorage.Melees and ((ScriptStorage.Melees.Electro or 0) > 0) then
        return true
    end
    if ScriptStorage.Tools and (ScriptStorage.Tools.Electro or ScriptStorage.Tools["Lightning Bolt"]) then
        return true
    end
    if ScriptStorage.Backpack and ScriptStorage.Backpack["Lightning Bolt"] then
        local v1582 = ScriptStorage.Backpack["Lightning Bolt"]
        local v1583 = type(v1582) == "table" and (v1582.Count or v1582.count or 0) or (type(v1582) == "number" and v1582 or 0)
        if v1583 >= 1 then
            return true
        end
    end
    local v1584 = false
    pcall(function()
        local v1585 = game:GetService("ReplicatedStorage"):FindFirstChild("ItemReplicationService")
        if v1585 and v1585._UserCache and v1585._UserCache[v1579.UserId] then
            for v1586, v1587 in pairs(v1585._UserCache[v1579.UserId]) do
                if type(v1587) == "table" and (v1587.Name == "Lightning Bolt" or v1587.id == "Lightning Bolt") then
                    local v1588 = v1587.Count or v1587.count or 1
                    if v1588 >= 1 then
                        v1584 = true
                        break
                    end
                end
            end
        end
    end)
    if v1584 then
        return true
    end
    return false
end
local v1589 = {
    "SUB2GAMERROBOT_EXP1",
    "Sub2CaptainMaui",
    "Sub2Fer999",
    "Enyu_is_Pro",
    "Magicbus",
    "JCWK",
    "Starcodeheo",
    "Bluxxy",
    "kittgaming",
    "Axiore",
    "Sub2Daigrock",
    "Sub2NoobMaster123",
    "Sub2OfficialNoobie",
    "StrawHatMaine",
    "TheGreatAce",
    "TantaiGaming",
    "EASTEREXP",
    "KITT_RESET",
    "SUB2GAMERROBOT_RESET1",
    "Sub2UncleKizaru",
    "Bignews",
    "Fudd10",
    "fudd10_v2",
    "Chandler"
}
local v1590 = false
local v1591 = false
FunctionsHandler.ExpRedeem:RegisterMethod("Refresh", function()
    if v1591 or v1590 then
        return false
    end
    return true
end)
FunctionsHandler.ExpRedeem:RegisterMethod("Start", function()
    if v1591 or v1590 then
        return
    end
    v1590 = true
    task.spawn(function()
        local v1592 = game:GetService("ReplicatedStorage")
        local v1593 = v1592:WaitForChild("Remotes", 15)
        local v1594 = v1593 and v1593:WaitForChild("Redeem", 15)
        if not v1594 then
            v1590 = false
            return
        end
        local v1595 = 0
        for v1596, v1597 in ipairs(v1589) do
            pcall(function()
                local v1598 = v1594:InvokeServer(v1597)
                if v1598 and (v1598 ~= "") then
                    print("[Redeem Code] " .. v1597 .. " -> " .. tostring(v1598))
                    if tostring(v1598):find("SUCCESS") then
                        v1595 = v1595 + 1
                    end
                end
            end)
            task.wait(0.25)
        end
        v1591 = true
        v1590 = false
        alert("[ Promo Codes ]", "Da xu ly xong tat ca Promo Codes! (Active 2x EXP & Stat Resets)")
        print("[Blox Fruits] All promo codes processed!")
    end)
end)
FunctionsHandler.LevelFarm:RegisterMethod("Refresh", function()
    if IsInRaid and IsInRaid() then
        return false
    end
    local v1599 = game.Players.LocalPlayer.Data.Level.Value
    if v536 == 1 and (v1599 >= 700) and not FunctionsHandler.SecondSeaPuzzle:Get("IsCompleted") then
        return false
    end
    if v536 == 1 and not v1578() then
        return "LightningBolt"
    end
    if v1599 < 75 then
        return 1
    else
        return 4
    end
    return true
end)
KaitunFarmPingStep = function(p1600, p1601, p1602, p1603, p1604, p1605)
    if p1602 < (p1600.nextAt or 0) then
        return false
    end
    p1600.nextAt = p1602 + p1605
    if p1600.lastAt and (p1602 - p1600.lastAt > p1605 * 3) then
        p1600.high = 0
    end
    p1600.lastAt = p1602
    if type(p1601) ~= "number" or p1601 ~= p1601 or p1601 == math.huge or p1601 <= 0 then
        p1600.high = 0
        return false
    end
    p1600.ping = p1601
    p1600.high = p1601 > p1603 and (p1600.high or 0) + 1 or 0
    return p1600.high >= p1604
end
KaitunCheckFarmPing = function()
    if not Config or Config.HopLowPing ~= true then
        local v1606 = getgenv().KaitunFarmPingState
        if v1606 then
            v1606.high = 0
            v1606.nextAt = 0
            v1606.pendingUntil = nil
        end
        return false
    end
    local v1607 = type(Config.PingHop) == "table" and Config.PingHop or {}
    local v1608 = os.clock()
    local v1609 = getgenv()
    local v1610 = v1609.KaitunFarmPingState
    if not v1610 or v1610.job ~= game.JobId then
        v1610 = {
            job = game.JobId,
            joinedAt = v1608,
            high = 0,
            nextAt = 0,
            lastHop = -math.huge
        }
        v1609.KaitunFarmPingState = v1610
    end
    if v1608 < (v1610.pendingUntil or 0) then
        return true
    end
    if _G.Stop or _G.ActiveMeleeQuest or (IsInRaid and IsInRaid()) then
        v1610.high = 0
        return false
    end
    if v1608 - v1610.joinedAt < math.max(0, tonumber(v1607.JoinGrace) or 30) or v1608 - v1610.lastHop < math.max(15, tonumber(v1607.Cooldown) or 120) then
        return false
    end
    if v1608 < (v1610.nextAt or 0) then
        return false
    end
    local v1611, v1612 = pcall(function()
        return game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
    end)
    local v1613 = math.max(1, tonumber(v1607.Threshold) or 200)
    local v1614 = math.max(1, math.floor(tonumber(v1607.Samples) or 3))
    local v1615 = math.max(1, tonumber(v1607.Interval) or 2)
    if not KaitunFarmPingStep(v1610, v1611 and tonumber(v1612) or nil, v1608, v1613, v1614, v1615) then
        return false
    end
    v1610.high = 0
    v1610.lastHop = v1608
    v1610.pendingUntil = v1608 + 15
    SetTask("MainTask", string.format("Farm Level | Ping %.0f > %.0f ms - hopping", v1610.ping, v1613))
    if CombatController then
        CombatController._abortCombat = true
    end
    if TweenController and TweenController.StopMovement then
        TweenController.StopMovement()
    end
    task.spawn(function()
        local v1616, v1617 = pcall(function()
            Hop.A(8)
        end)
        if not v1616 then
            v1610.pendingUntil = 0
            warn("[KaitunBF PingHop] Hop request failed: " .. tostring(v1617))
        end
    end)
    return true
end
local function v1618(p1619)
    if IsInRaid and IsInRaid() then
        return
    end
    if _G.ActiveMeleeQuest then
        return
    end
    if CombatController then
        CombatController._abortCombat = nil
    end
    if v536 == 3 then
        local v1620 = ScriptStorage.Tools.Godhuman or (ScriptStorage.Melees and ((ScriptStorage.Melees.Godhuman or 0) > 0))
        if not v1620 then
            local v1621 = GetTrueMastery and GetTrueMastery("Electro") or 0
            local v1622 = ScriptStorage.Tools["Electric Claw"] or (ScriptStorage.Melees and ((ScriptStorage.Melees["Electric Claw"] or 0) > 0))
            local v1623 = game.Players.LocalPlayer
            local v1624 = v1623 and v1623:FindFirstChild("Data") and v1623.Data:FindFirstChild("Beli") and v1623.Data.Beli.Value or (ScriptStorage.PlayerData and ScriptStorage.PlayerData.Beli) or 0
            local v1625 = v1623 and v1623:FindFirstChild("Data") and v1623.Data:FindFirstChild("Fragments") and v1623.Data.Fragments.Value or (ScriptStorage.PlayerData and ScriptStorage.PlayerData.Fragments) or 0
            if v1621 >= 400 and (v1624 >= 3000000) and (v1625 >= 5000) and not v1622 then
                if v842 and v842.AbandonQuest then
                    pcall(v842.AbandonQuest)
                end
                return
            end
            local v1626 = GetTrueMastery and GetTrueMastery("Fishman Karate") or 0
            local v1627 = ScriptStorage.Tools["Sharkman Karate"] or (ScriptStorage.Melees and ((ScriptStorage.Melees["Sharkman Karate"] or 0) > 0))
            if v1626 >= 400 and (v1624 >= 2500000) and (v1625 >= 5000) and not v1627 then
                if v842 and v842.AbandonQuest then
                    pcall(v842.AbandonQuest)
                end
                return
            end
        end
    end
    if p1619 == "LightningBolt" then
        SetTask("MainTask", "Farm Lightning Bolt | Ưu tiên Level 1")
        FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Melee")
        local v1628 = game:GetService("CollectionService")
        local function v1629()
            local v1630 = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Sky")
            local v1631 = workspace:FindFirstChild("CloudPieces")
            local v1632, v1633 = nil, nil
            for v1634, v1635 in ipairs(v1628:GetTagged("M1HitRegistry")) do
                if v1635:IsA("BasePart") and v1635:IsDescendantOf(workspace) and string.find(string.lower(v1635.Name), "cloud", 1, true) and (v1630 and v1635:IsDescendantOf(v1630) or (v1631 and v1635:IsDescendantOf(v1631)) or v1635.Position.Y > 500) then
                    local v1636 = v1635.Color.R + v1635.Color.G + v1635.Color.B
                    if v1636 < 2.88 and (not v1632 or v1636 < v1633) then
                        v1632, v1633 = v1635, v1636
                    end
                end
            end
            if not v1632 and v1631 then
                for v1637, v1638 in ipairs(v1631:GetDescendants()) do
                    if v1638:IsA("BasePart") and string.find(string.lower(v1638.Name), "cloud", 1, true) then
                        local v1639 = v1638.Color.R + v1638.Color.G + v1638.Color.B
                        if v1639 < 2.88 and (not v1632 or v1639 < v1633) then
                            v1632, v1633 = v1638, v1639
                        end
                    end
                end
            end
            return v1632
        end
        local function v1640(p1641)
            if not p1641 or not p1641.Parent then
                return false
            end
            local v1642 = v399.Character
            local v1643 = v1642 and v1642:FindFirstChild("HumanoidRootPart")
            local v1644 = v1642 and v1642:FindFirstChildOfClass("Humanoid")
            if not v1643 or not v1644 or v1644.Health <= 0 then
                return false
            end
            local v1645 = v1642:FindFirstChildOfClass("Tool")
            if not v1645 then
                FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Melee")
                v1645 = v1642:FindFirstChildOfClass("Tool")
            end
            pcall(function()
                local v1646 = game:GetService("ReplicatedStorage"):FindFirstChild("Modules") and game:GetService("ReplicatedStorage").Modules:FindFirstChild("Net")
                if v1646 then
                    local v1647 = require(v1646)
                    local v1648 = v1647:RemoteEvent("RegisterAttack", true)
                    local v1649 = v1647:RemoteEvent("RegisterHit", true)
                    if v1648 then
                        v1648:FireServer(0.4)
                    end
                    if v1649 then
                        v1649:FireServer(p1641)
                    end
                end
            end)
            return true
        end
        local v1650 = tick()
        local v1651 = tick()
        while v536 == 1 and not v1578() do
            local v1652 = v1629()
            if not v1652 or not v1652.Parent then
                SetTask("SubTask", "Waiting for a charged cloud (Sky Island)")
                TweenController.Create(CFrame.new(-4953.20703125, 295.74420166015625, -2899.22900390625))
                if tick() - v1650 > 35 then
                    SetTask("MainTask", "Farm Lightning Bolt | Server không có cloud, đang đổi server...")
                    if Hop and Hop.A then
                        Hop.A()
                    elseif Lowhop then
                        Lowhop()
                    end
                    task.wait(5)
                    return
                end
                task.wait(1)
            else
                v1650 = tick()
                SetTask("SubTask", "Found charged cloud! Attacking...")
                local v1653 = v1652.CFrame + Vector3.new(0, math.min(v1652.Size.Y / 2 + 5, 90), 0)
                TweenController.Create(v1653)
                if CaculateDistance(v1653) < 15 then
                    SetTask("MainTask", "Farm Lightning Bolt | Đang đánh charged cloud...")
                    v1640(v1652)
                end
                task.wait(0.25)
            end
            if tick() - v1651 >= 2 then
                v1651 = tick()
                pcall(RefreshInventory)
                if v1578() then
                    break
                end
            end
        end
        return
    end
    local function v1654(p1655)
        if not p1655 then
            return 0
        end
        local v1656 = 0
        pcall(function()
            local v1657 = game:GetService("ReplicatedStorage")
            local v1658 = require(v1657.ItemReplicationService)
            local v1659 = require(v1657.ItemConfig)
            local v1660 = v1658._UserCache and v1658._UserCache[game.Players.LocalPlayer.UserId]
            if v1660 then
                local v1661 = v1660:GetItems("Quantity") or {}
                for v1662, v1663 in pairs(v1661) do
                    local v1664, v1665 = pcall(function()
                        return v1659.match(v1663.ItemId):unwrap()
                    end)
                    local v1666 = v1664 and v1665 and v1665.Index and v1665.Index.DebugLabel
                    if v1666 and v1666:lower():find(p1655:lower(), 1, true) then
                        v1656 = tonumber(v1663.Value) or 0
                        return
                    end
                end
            end
        end)
        if v1656 > 0 then
            return v1656
        end
        if ScriptStorage.Backpack and ScriptStorage.Backpack[p1655] then
            return tonumber(ScriptStorage.Backpack[p1655].Count) or 0
        end
        return 0
    end
    if v536 == 3 then
        local v1667 = v1654("Bones")
        if v1667 >= 50 and (os.time() > (BonesCooldown or 0)) then
            pcall(function()
                local v1668, v1669, v1670, v1671 = Remotes.CommF_:InvokeServer("Bones", "Check")
                local v1672 = tonumber(v1668) or 0
                if v1672 >= 50 then
                    Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                    task.wait(0.5)
                    RefreshInventory()
                else
                    BonesCooldown = os.time() + 60
                end
            end)
        end
    end
    local v1673 = ScriptStorage.PlayerData.Level
    if GodHumanFlag then
        local v1677, v1678 = (function()
            getgenv()["   mphm ><<3"] = {}
            for v1674, v1675 in GodhumanMaterials do
                local v1676 = v1654(v1674)
                if v1676 < v1675[1] then
                    getgenv()["   mphm >< <3"] = { v1674, v1675 }
                    break
                end
            end
            return unpack(getgenv()["   mphm >< <3"] or {})
        end)()
        if v1677 then
            if v536 ~= v1678[2] then
                alert("Material - " .. v1677, "Travelling sea " .. v1678[2])
                Remotes.CommF_:InvokeServer("Travel" .. SeaIndexes[v1678[2]])
                return
            end
            SetTask("MainTask", "Material Farming | Godhuman | " .. v1677 .. " | In Progress")
            if v1673 >= v1678[4][3] then
                local v1679, v1680 = GetCurrentClaimQuest()
                if v1679 then
                    CombatController.Attack(v1678[3])
                    return
                else
                    local v1681 = ScriptStorage.NPCs[v1678[4][4]]
                    v1681 = v1681 and v1681:GetModelCFrame()
                    if v1681 then
                        TweenController.Create(v1681 + Vector3.new(0, 5, 3))
                        if CaculateDistance(v1681) < 10 then
                            task.wait(1)
                        else
                            return
                        end
                    else
                        Report("NPC HauntedQuest2 not found")
                    end
                    v842.StartQuest(v1678[4][1], v1678[4][2])
                    return
                end
            end
            CombatController.Attack(v1678[3])
        end
        Remotes.CommF_:InvokeServer("BuyGodhuman", true)
        Remotes.CommF_:InvokeServer("BuyGodhuman")
        GodHumanFlag = false
        return true
    end
    if os.time() - LastTravel > 60 then
        if v1673 >= 1500 and (v536 == 2) then
            local v1682 = ScriptStorage.Tools["Dragon Claw"] or (ScriptStorage.Melees["Dragon Claw"] or 0) > 0
            local v1683 = GetTrueMastery and GetTrueMastery("Dragon Claw") or 0
            if not v1682 or v1683 < 400 then
            else
                local v1684 = false
                pcall(function()
                    local v1685 = Services.Workspace.Map.IceCastle.Hall.LibraryDoor
                    if v1685 and v1685:FindFirstChild("PhoeyuDoor") then
                        v1684 = true
                    end
                end)
                if not v1684 then
                    SetTask("MainTask", "Sea Travel | Teleporting to Third Sea")
                    Remotes.CommF_:InvokeServer("TravelZou")
                    LastTravel = os.time()
                end
            end
        elseif v1673 >= 700 and (v536 == 1) then
            SetTask("MainTask", "Sea Travel | Teleporting to Second Sea")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective")
            task.wait(1)
            Remotes.CommF_:InvokeServer("TravelDressrosa")
            LastTravel = os.time()
        end
    end
    if p1619 == 1 then
        SetTask("MainTask", "Farm Level : Attack Sky Bandit")
        CombatController.Attack("Sky Bandit")
    else
        local v1686 = v538()
        local v1687 = type(p1619) == "string" and (p1619 ~= "LightningBolt") and (p1619 ~= "") and p1619 or v1686.NameMonster
        local v1688 = v1686.NameQuest
        local v1689 = v1686.ID
        if not v1687 or not v1688 then
            v842:RefreshQuest()
            return
        end
        local v1690, v1691, v1692, v1693 = ParseCurrentQuest()
        CurrentClaimQuest1 = v1690 or GetCurrentClaimQuest()
        if ScriptStorage.PlayerData.Level == MaxLevel then
            return
        end
        local v1694 = v1692 and (v1692 > 0)
        local function v1695(p1696)
            return string.lower(tostring(p1696 or "")):gsub("%s+", ""):gsub("^mil%.?", "military"):gsub("s$", "")
        end
        local v1697 = CurrentClaimQuest1 and (CurrentClaimQuest1 == v1687 or CurrentClaimQuest1 == v1687 .. "s" or v1687:find(CurrentClaimQuest1, 1, true) or CurrentClaimQuest1:find(v1687, 1, true) or v1695(CurrentClaimQuest1) == v1695(v1687) or (CombatController and CombatController.MobNameMatches and CombatController.MobNameMatches(CurrentClaimQuest1, v1687)))
        if CurrentClaimQuest1 or v1694 then
            if not v1697 and not v1694 then
                getgenv().KaitunMismatchCount = getgenv().KaitunMismatchCount or {}
                local v1698 = getgenv().KaitunMismatchCount
                local v1699 = tostring(CurrentClaimQuest1) .. ">" .. tostring(v1687)
                if v1698.last ~= v1699 then
                    v1698.last, v1698.count = v1699, 1
                else
                    v1698.count = (v1698.count or 0) + 1
                end
                if (v1698.count or 0) >= 3 then
                    v1698.last, v1698.count = nil, 0
                    SetTask("MainTask", "huy quest")
                    v842.AbandonQuest()
                end
                return
            end
            getgenv().KaitunMismatchCount = nil
            local v1700 = v1694 and CurrentClaimQuest1 or v1687
            SetTask("MainTask", " Farm Level : " .. v1700 .. " (" .. tostring(v1692 or 0) .. "/" .. tostring(v1693 or 8) .. ")")
            local v1701 = os.time()
            CombatController.Attack(v1700)
            LevelFarmTTL = LevelFarmTTL + os.time() - v1701
        else
            local v1702 = ParseCurrentQuest()
            if v1702 then
                return
            end
            if (v1687 == "Dangerous Prisoner" or v1687 == "Prisoner") and (v536 == 1) then
                local v1703 = CFrame.new(5309.6474609375, 1.654262661933899, 477.8815612792969)
                if CaculateDistance(v1703) > 10 then
                    TweenController.Create(v1703)
                    return
                end
            end
            LevelFarmTTL = 0
            v842.StartQuest(v1688, v1689)
            task.wait(0.3)
            local v1704 = os.time()
            CombatController.Attack(v1687)
            LevelFarmTTL = LevelFarmTTL + os.time() - v1704
        end
    end
end
FunctionsHandler.LevelFarm:RegisterMethod("Start", function(p1705)
    if KaitunCheckFarmPing() then
        return
    end
    local v1706 = true
    task.spawn(function()
        while v1706 do
            task.wait(1)
            if v1706 and KaitunCheckFarmPing() then
                break
            end
        end
    end)
    local v1708 = table.pack(xpcall(function()
        return v1618(p1705)
    end, function(p1707)
        return debug.traceback(tostring(p1707), 2)
    end))
    v1706 = false
    if not v1708[1] then
        error(v1708[2], 0)
    end
    return table.unpack(v1708, 2, v1708.n)
end)
FunctionsHandler.LocalPlayerController:RegisterMethod("EquipTool", function(p1709)
    if not Humanoid then
        return
    end
    for v1710, v1711 in ipairs(LocalPlayer.Backpack:GetChildren()) do
        if v1711:IsA("Tool") and (v1711.Name ~= "Tool") and (v1711.Name == tostring(p1709) or (v1711.ToolTip == p1709 and (v1711.Name ~= "Combat"))) then
            LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v1711)
            return
        end
    end
    for v1712, v1713 in ipairs(LocalPlayer.Backpack:GetChildren()) do
        if v1713:IsA("Tool") and (v1713.Name ~= "Tool") and (v1713.Name == tostring(p1709) or v1713.ToolTip == p1709) then
            LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v1713)
            return
        end
    end
end)
FunctionsHandler.LocalPlayerController:RegisterMethod("ToggleAbilities", function(p1714, p1715)
    if p1714 == "Buso" then
        if LocalPlayer:HasTag("Buso") and not p1715 or p1715 then
            Remotes.CommF_:InvokeServer("Buso")
        end
    elseif p1714 == "Observation" then
    end
end)
FunctionsHandler.LocalPlayerController:RegisterMethod("SetupAbilitiesToggle", function()
    FunctionsHandler.LocalPlayerController.Methods.ToggleAbilities:Call("Buso", true)
    FunctionsHandler.LocalPlayerController.Methods.ToggleAbilities:Call("Observation", true)
end)
FunctionsHandler.Saber:RegisterMethod("Refresh", function()
    if not (Config and Config.Saber) then
        return
    end
    local v1716
    if ScriptStorage.Backpack.Saber then
        return
    end
    if ScriptStorage.PlayerData.Level < 200 then
        return
    end
    local v1717 = Remotes.CommF_:InvokeServer("ProQuestProgress")
    for v1718, v1719 in v1717.Plates do
        if v1719 == false then
            v1716 = 1
        end
    end
    if not v1716 then
        if not v1717.UsedTorch then
            v1716 = 2
        elseif not v1717.UsedCup then
            v1716 = 3
        elseif not v1717.TalkedSon then
            v1716 = 4
        elseif not v1717.KilledMob then
            v1716 = 5
        elseif not v1717.UsedRelic then
            v1716 = 6
        elseif not v1717.KilledShanks and ScriptStorage.Enemies["Saber Expert"] then
            v1716 = 7
        end
    end
    FunctionsHandler.Saber:Set("CurrentProgressLevel", v1716)
    FunctionsHandler.Saber:Set("LastestRefreshSenque", os.time())
    return v1716
end)
FunctionsHandler.Saber:RegisterMethod("GetQuestplates", function()
    local v1720 = FunctionsHandler.Saber:Get("QuestplatesCache")
    if v1720 then
        return v1720
    end
    local v1721 = Services.Workspace.Map.Jungle
    local v1722 = {}
    table.foreach(v1721.QuestPlates:GetChildren(), function(p1723, p1724)
        p1723 = p1724:FindFirstChild("Button") and table.insert(v1722, p1724)
    end)
    FunctionsHandler.Saber:Get("QuestplatesCache", v1722)
    return v1722
end)
FunctionsHandler.Saber:RegisterMethod("Start", function()
    local v1725, v1726 = FunctionsHandler.Saber:Get("CurrentProgressLevel"), FunctionsHandler.Saber:Get("LastestRefreshSenque")
    print("[ Debug ] Saber quest indexes", v1725)
    if not v1725 then
        FunctionsHandler.Saber.Methods.Refresh:Call()
        return FunctionsHandler.Saber.Methods.Start:Call()
    elseif v1725 == 0 then
    elseif os.time() - v1726 > 60 then
        FunctionsHandler.Saber.Methods.Refresh:Call()
        return FunctionsHandler.Saber.Methods.Start:Call()
    else
        if v1725 == 1 then
            local v1727 = FunctionsHandler.Saber.Methods.GetQuestplates:Call()
            for v1728, v1729 in v1727 do
                SetTask("MainTask", "Saber Quest | Quest Plates | Touching " .. v1728 .. "/5")
                while CaculateDistance(v1729.Button.CFrame) > 20 do
                    task.wait()
                    TweenController.Create(v1729.Button.CFrame)
                end
                task.wait(1)
            end
        elseif v1725 == 2 then
            SetTask("MainTask", "Saber Quest | Torch Puzzle | Using Torch")
            Remotes.CommF_:InvokeServer("ProQuestProgress", "GetTorch")
            task.wait(1)
            Remotes.CommF_:InvokeServer("ProQuestProgress", "DestroyTorch")
        elseif v1725 == 3 then
            SetTask("MainTask", "Saber Quest | Sick Man | Helping with Cup")
            Remotes.CommF_:InvokeServer("ProQuestProgress", "GetCup")
            if ScriptStorage.Tools.Cup then
                FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Cup")
                task.wait(1)
                Remotes.CommF_:InvokeServer("ProQuestProgress", "FillCup", LocalPlayer.Character.Cup)
            end
            Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan")
        elseif v1725 == 4 then
            SetTask("MainTask", "Saber Quest | Rich Son | Getting Information")
            Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
        elseif v1725 == 5 then
            SetTask("MainTask", "Saber Quest | Mob Leader | Defeating Boss")
            CombatController.Attack("Mob Leader")
        elseif v1725 == 6 then
            SetTask("MainTask", "Saber Quest | Relic | Placing at Location")
            Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
            Remotes.CommF_:InvokeServer("ProQuestProgress", "PlaceRelic")
        elseif v1725 == 7 then
            SetTask("MainTask", "Saber Quest | Saber Expert | Final Battle")
            CombatController.Attack("Saber Expert")
        end
    end
end)
Remotes.RefreshQuestPro.OnClientEvent:Connect(FunctionsHandler.Saber.Methods.Refresh.Callback)
MeleeLastCursor = 1
FirstCall = true
CanPurchase = {}
FunctionsHandler.MeleesController:RegisterMethod("Refresh", function()
    if not (Config and Config.Items and Config.Items.GodHuman) then
        return false
    end
    local v1730 = ScriptStorage.PlayerData.Beli or (LocalPlayer:FindFirstChild("Data") and LocalPlayer.Data:FindFirstChild("Beli") and LocalPlayer.Data.Beli.Value) or 0
    local v1731 = ScriptStorage.PlayerData.Fragments or (LocalPlayer:FindFirstChild("Data") and LocalPlayer.Data:FindFirstChild("Fragments") and LocalPlayer.Data.Fragments.Value) or 0
    local v1732 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
    if not ScriptStorage.Tools["Black Leg"] and ((ScriptStorage.Melees["Black Leg"] or 0) == 0) and (v1730 >= 150000) and (v536 == 1) then
        if not (_G.BlackLegCooldown and (os.time() < _G.BlackLegCooldown)) then
            return true
        end
    end
    if v1732 and (v1732.Name == "Combat") and ((ScriptStorage.Melees["Black Leg"] or 0) > 0 or ScriptStorage.Tools["Black Leg"]) then
        return true
    end
    local v1733 = ScriptStorage.Tools.Electro or (ScriptStorage.Melees and ((ScriptStorage.Melees.Electro or 0) > 0))
    if not v1733 and (v1730 >= 500000) then
        local v1734 = GetTrueMastery("Black Leg")
        if v1734 >= 400 or (ScriptStorage.Melees and ((ScriptStorage.Melees["Black Leg"] or 0) >= 400)) or v536 >= 2 then
            if not (_G.ElectroCooldown and (os.time() < _G.ElectroCooldown)) then
                return true
            end
        end
    end
    local v1735 = ScriptStorage.Tools["Fishman Karate"] or (ScriptStorage.Melees and ((ScriptStorage.Melees["Fishman Karate"] or 0) > 0))
    if not v1735 and (v1730 >= 750000) then
        local v1736 = GetTrueMastery("Electro")
        if v1736 >= 400 or (ScriptStorage.Melees and ((ScriptStorage.Melees.Electro or 0) >= 400)) or v536 >= 2 then
            if not (_G.FishmanCooldown and (os.time() < _G.FishmanCooldown)) then
                return true
            end
        end
    end
    local v1737 = ScriptStorage.Tools["Dragon Claw"] or (ScriptStorage.Melees["Dragon Claw"] or 0) > 0
    if v1731 >= 1500 and not v1737 then
        return true
    end
    local v1738 = GetTrueMastery("Electro")
    local v1739 = ScriptStorage.Tools["Electric Claw"] or (ScriptStorage.Melees["Electric Claw"] or 0) > 0
    if v536 == 3 and (v1738 >= 400) and (v1730 >= 3000000) and (v1731 >= 5000) and not v1739 then
        return true
    end
    local v1740 = GetTrueMastery("Fishman Karate")
    local v1741 = ScriptStorage.Tools["Sharkman Karate"] or (ScriptStorage.Melees["Sharkman Karate"] or 0) > 0
    if v1740 >= 400 and (v1730 >= 2500000) and (v1731 >= 5000) and not v1741 then
        return true
    end
    local v1742 = GetTrueMastery("Dragon Claw")
    local v1743 = ScriptStorage.Tools["Dragon Talon"] or (ScriptStorage.Melees["Dragon Talon"] or 0) > 0
    local v1744 = ScriptStorage.Tools and ScriptStorage.Tools["Fire Essence"] or LocalPlayer.Backpack:FindFirstChild("Fire Essence") or (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Fire Essence")) or (GetMaterialCount and (GetMaterialCount("Fire Essence") > 0))
    if v536 == 3 and (v1742 >= 400) and (v1730 >= 3000000) and (v1731 >= 5000) and v1744 and not v1743 then
        return true
    end
    local v1745 = ScriptStorage.Tools.Godhuman or (ScriptStorage.Melees.Godhuman or 0) > 0
    if v536 == 3 and not v1745 then
        local v1746 = GetTrueMastery("Superhuman") >= 400 and (GetTrueMastery("Death Step") >= 400) and (GetTrueMastery("Electric Claw") >= 400) and (GetTrueMastery("Sharkman Karate") >= 400) and (GetTrueMastery("Dragon Talon") >= 400)
        if v1746 and (v1730 >= 5000000) and (v1731 >= 5000) then
            local v1747 = GetMaterialCount and GetMaterialCount("Fish Tail") or 0
            local v1748 = GetMaterialCount and GetMaterialCount("Dragon Scale") or 0
            local v1749 = GetMaterialCount and GetMaterialCount("Magma Ore") or 0
            local v1750 = GetMaterialCount and GetMaterialCount("Mystic Droplet") or 0
            if v1747 >= 20 and (v1748 >= 10) and (v1749 >= 20) and (v1750 >= 10) then
                return true
            end
        end
    end
    local v1751 = nil
    for v1752, v1753 in ipairs(MeleesTable) do
        if v1753 ~= "SanguineArt" and (v1753 ~= "Godhuman") then
            local v1754 = ScriptStorage.Tools[v1753] or (ScriptStorage.Melees[v1753] or 0) > 0
            if v1754 then
                local v1755 = GetTrueMastery(v1753)
                if v1755 < 400 then
                    v1751 = v1753
                    break
                end
            end
        end
    end
    if v1751 then
        ScriptStorage.FarmingMelee = v1751
        CombatController.EquipMeleeStyle(v1751)
        return false
    else
        ScriptStorage.FarmingMelee = nil
        return false
    end
end)
local v1756 = {
    Superhuman = CFrame.new(-5004.72119140625, 370.42333984375, -3198.915283203125),
    Electro = CFrame.new(-4866.15039, 33.9298477, -4767.10254, -0.453972578, 0, -0.891015649, 0, 1, 0, 0.891015649, 0, -0.453972578)
}
local v1757 = { "Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker" }
local function v1758()
    for v1759, v1760 in ipairs(workspace.Enemies:GetChildren()) do
        if table.find(v1757, v1760.Name) then
            local v1761 = v1760:FindFirstChildOfClass("Humanoid")
            if v1761 and (v1761.Health > 0) and v1760:FindFirstChild("HumanoidRootPart") then
                return v1760
            end
        end
    end
    return nil
end
FunctionsHandler.MeleesController:RegisterMethod("Start", function()
    if not (Config and Config.Items and Config.Items.GodHuman) then
        return
    end
    pcall(SyncMeleeMasteryFromInventory)
    local v1762 = ScriptStorage.PlayerData.Beli or (LocalPlayer:FindFirstChild("Data") and LocalPlayer.Data:FindFirstChild("Beli") and LocalPlayer.Data.Beli.Value) or 0
    local v1763 = ScriptStorage.PlayerData.Fragments or (LocalPlayer:FindFirstChild("Data") and LocalPlayer.Data:FindFirstChild("Fragments") and LocalPlayer.Data.Fragments.Value) or 0
    local v1764 = LocalPlayer.Character
    local v1765 = v1764 and v1764:FindFirstChildOfClass("Tool")
    if v1765 and (v1765.ToolTip == "Melee") and (v1765.Name ~= "Combat") then
        local v1766 = v1765:FindFirstChild("Level")
        if v1766 then
            ScriptStorage.Melees[v1765.Name] = v1766.Value
            SaveMeleeCache()
        end
    end
    if not ScriptStorage.Tools["Black Leg"] and ((ScriptStorage.Melees["Black Leg"] or 0) == 0) and (v1762 >= 150000) and (v536 == 1) then
        if _G.BlackLegCooldown and (os.time() < _G.BlackLegCooldown) then
        else
            _G.ActiveMeleeQuest = "Black Leg"
            pcall(function()
                if v842 and v842.AbandonQuest then
                    v842.AbandonQuest()
                end
                Remotes.CommF_:InvokeServer("AbandonQuest")
            end)
            local v1767 = workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild("Dark Step Teacher")
            local v1768 = v1767 and (v1767:FindFirstChild("HumanoidRootPart") or v1767:FindFirstChild("Head") or v1767.PrimaryPart)
            local v1769 = v1768 and v1768.CFrame or CFrame.new(-983.617981, 12.4499969, 3990.46289)
            SetTask("MainTask", "Buying Melee | Flying to Dark Step Teacher")
            local v1770 = tick() + 35
            while CaculateDistance(v1769) > 20 and (tick() < v1770) do
                TweenController.Create(v1769)
                task.wait(0.2)
            end
            if CaculateDistance(v1769) <= 20 then
                SetTask("MainTask", "Buying Melee | Purchasing Black Leg")
                pcall(function()
                    Remotes.CommF_:InvokeServer("BuyBlackLeg")
                end)
                task.wait(0.8)
                RefreshInventory()
                if ScriptStorage.Tools["Black Leg"] or (ScriptStorage.Melees["Black Leg"] or 0) > 0 then
                    _G.BlackLegFailCount = 0
                    _G.BlackLegCooldown = nil
                    FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Black Leg")
                    FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Melee")
                    _G.ActiveMeleeQuest = nil
                    return
                else
                    _G.BlackLegFailCount = (_G.BlackLegFailCount or 0) + 1
                    if _G.BlackLegFailCount >= 3 then
                        _G.BlackLegCooldown = os.time() + 180
                        _G.BlackLegFailCount = 0
                    end
                end
            end
            _G.ActiveMeleeQuest = nil
            return
        end
    end
    local v1771 = ScriptStorage.Tools.Electro or (ScriptStorage.Melees and ((ScriptStorage.Melees.Electro or 0) > 0))
    if not v1771 and (v1762 >= 500000) then
        local v1772 = GetTrueMastery("Black Leg")
        if v1772 >= 400 or (ScriptStorage.Melees and ((ScriptStorage.Melees["Black Leg"] or 0) >= 400)) or v536 >= 2 then
            if _G.ElectroCooldown and (os.time() < _G.ElectroCooldown) then
            else
                _G.ActiveMeleeQuest = "Electro"
                pcall(function()
                    if v842 and v842.AbandonQuest then
                        v842.AbandonQuest()
                    end
                    if CombatController and CombatController.StopCombat then
                        CombatController.StopCombat()
                    end
                    Remotes.CommF_:InvokeServer("AbandonQuest")
                end)
                local v1773 = nil
                if v536 == 2 then
                    v1773 = CFrame.new(-4866.15039, 33.9298477, -4767.10254, -0.453972578, 0, -0.891015649, 0, 1, 0, 0.891015649, 0, -0.453972578)
                elseif v536 == 1 then
                    v1773 = CFrame.new(-211.5, 356.5, -5938.8)
                end
                pcall(function()
                    local v1774 = workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild("Mad Scientist") or (game:GetService("ReplicatedStorage"):FindFirstChild("NPCs") and game:GetService("ReplicatedStorage").NPCs:FindFirstChild("Mad Scientist"))
                    if v1774 then
                        local v1775 = v1774:FindFirstChild("HumanoidRootPart") or v1774:FindFirstChild("Head") or v1774.PrimaryPart
                        if v1775 then
                            v1773 = v1775.CFrame
                        else
                            local v1776, v1777 = pcall(function()
                                return v1774:GetPivot()
                            end)
                            if v1776 and v1777 then
                                v1773 = v1777
                            end
                        end
                    end
                end)
                if v1773 then
                    SetTask("MainTask", "Buying Melee | Flying to Mad Scientist (Electro)")
                    local v1778 = CaculateDistance(v1773)
                    local v1779 = tick() + math.max(45, v1778 / 150 + 20)
                    while CaculateDistance(v1773) > 20 and (tick() < v1779) do
                        if _G.Stop then
                            _G.ActiveMeleeQuest = nil
                            return
                        end
                        TweenController.Create(v1773 + Vector3.new(0, 3, 0))
                        task.wait(0.2)
                    end
                    if CaculateDistance(v1773) <= 25 then
                        SetTask("MainTask", "Buying Melee | Purchasing Electro")
                        pcall(function()
                            Remotes.CommF_:InvokeServer("ElectroQuestState")
                            task.wait(0.25)
                            Remotes.CommF_:InvokeServer("ElectroQuestState")
                            task.wait(0.25)
                            Remotes.CommF_:InvokeServer("AcceptElectroQuest")
                            task.wait(0.25)
                            Remotes.CommF_:InvokeServer("DeliverLightningBolt")
                            task.wait(0.25)
                            Remotes.CommF_:InvokeServer("BuyElectro")
                        end)
                        task.wait(0.8)
                        RefreshInventory()
                        pcall(SyncMeleeMasteryFromInventory)
                        if ScriptStorage.Tools.Electro or (ScriptStorage.Melees and ((ScriptStorage.Melees.Electro or 0) > 0)) then
                            _G.ElectroFailCount = 0
                            _G.ElectroCooldown = nil
                            FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Electro")
                            FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Melee")
                            _G.ActiveMeleeQuest = nil
                            return
                        else
                            _G.ElectroFailCount = (_G.ElectroFailCount or 0) + 1
                            if _G.ElectroFailCount >= 3 then
                                _G.ElectroCooldown = os.time() + 180
                                _G.ElectroFailCount = 0
                            end
                        end
                    end
                end
                _G.ActiveMeleeQuest = nil
                return
            end
        end
    end
    local v1780 = ScriptStorage.Tools["Fishman Karate"] or (ScriptStorage.Melees and ((ScriptStorage.Melees["Fishman Karate"] or 0) > 0))
    if not v1780 and (v1762 >= 750000) then
        local v1781 = GetTrueMastery("Electro")
        if v1781 >= 400 or (ScriptStorage.Melees and ((ScriptStorage.Melees.Electro or 0) >= 400)) or v536 >= 2 then
            if _G.FishmanCooldown and (os.time() < _G.FishmanCooldown) then
            else
                _G.ActiveMeleeQuest = "Fishman Karate"
                pcall(function()
                    if v842 and v842.AbandonQuest then
                        v842.AbandonQuest()
                    end
                    if CombatController and CombatController.StopCombat then
                        CombatController.StopCombat()
                    end
                    Remotes.CommF_:InvokeServer("AbandonQuest")
                end)
                local v1782 = nil
                if v536 == 2 then
                    v1782 = CFrame.new(-4957.67041, 35.9498367, -4665.59961)
                elseif v536 == 1 then
                    v1782 = CFrame.new(61122.65234375, 18.4974422454834, 1569.3997802734375)
                end
                pcall(function()
                    local v1783 = workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild("Water Kung-fu Teacher") or (game:GetService("ReplicatedStorage"):FindFirstChild("NPCs") and game:GetService("ReplicatedStorage").NPCs:FindFirstChild("Water Kung-fu Teacher"))
                    if v1783 then
                        local v1784 = v1783:FindFirstChild("HumanoidRootPart") or v1783:FindFirstChild("Head") or v1783.PrimaryPart
                        if v1784 then
                            v1782 = v1784.CFrame
                        else
                            local v1785, v1786 = pcall(function()
                                return v1783:GetPivot()
                            end)
                            if v1785 and v1786 then
                                v1782 = v1786
                            end
                        end
                    end
                end)
                if v1782 then
                    SetTask("MainTask", "Buying Melee | Flying to Water Kung-fu Teacher")
                    local v1787 = CaculateDistance(v1782)
                    local v1788 = tick() + math.max(45, v1787 / 150 + 20)
                    while CaculateDistance(v1782) > 20 and (tick() < v1788) do
                        if _G.Stop then
                            _G.ActiveMeleeQuest = nil
                            return
                        end
                        TweenController.Create(v1782 + Vector3.new(0, 3, 0))
                        task.wait(0.2)
                    end
                    if CaculateDistance(v1782) <= 25 then
                        SetTask("MainTask", "Buying Melee | Purchasing Fishman Karate")
                        pcall(function()
                            Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                        end)
                        task.wait(0.8)
                        RefreshInventory()
                        pcall(SyncMeleeMasteryFromInventory)
                        if ScriptStorage.Tools["Fishman Karate"] or (ScriptStorage.Melees and ((ScriptStorage.Melees["Fishman Karate"] or 0) > 0)) then
                            _G.FishmanFailCount = 0
                            _G.FishmanCooldown = nil
                            FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Fishman Karate")
                            FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Melee")
                            _G.ActiveMeleeQuest = nil
                            return
                        else
                            _G.FishmanFailCount = (_G.FishmanFailCount or 0) + 1
                            if _G.FishmanFailCount >= 3 then
                                _G.FishmanCooldown = os.time() + 180
                                _G.FishmanFailCount = 0
                            end
                        end
                    end
                end
                _G.ActiveMeleeQuest = nil
                return
            end
        end
    end
    local v1789 = ScriptStorage.Tools["Dragon Claw"] or (ScriptStorage.Melees["Dragon Claw"] or 0) > 0
    if v1763 >= 1500 and not v1789 then
        _G.ActiveMeleeQuest = "Dragon Claw"
        pcall(function()
            if v842 and v842.AbandonQuest then
                v842.AbandonQuest()
            end
            if CombatController and CombatController.StopCombat then
                CombatController.StopCombat()
            end
            Remotes.CommF_:InvokeServer("AbandonQuest")
        end)
        local v1790 = v536 == 2 and CFrame.new(699.028992, 185.660995, 654.89502) or CFrame.new(-4981.16211, 370.010986, -3208.33887)
        local v1791 = workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild("Sabi") or (game:GetService("ReplicatedStorage"):FindFirstChild("NPCs") and game:GetService("ReplicatedStorage").NPCs:FindFirstChild("Sabi"))
        if v1791 then
            local v1792 = v1791:FindFirstChild("HumanoidRootPart") or v1791:FindFirstChild("Head") or v1791.PrimaryPart
            if v1792 then
                v1790 = v1792.CFrame
            end
        end
        if v536 == 3 then
            SetTask("MainTask", "Dragon Breath | Sabi chỉ bán ở Sea 2...")
            SetTask("SubTask", "Đang dịch chuyển qua Second Sea (Dressrosa)")
            Remotes.CommF_:InvokeServer("TravelDressrosa")
            task.wait(5)
            return
        end
        SetTask("MainTask", "Buying Melee | Flying to Sabi (Dragon Breath)")
        local v1793 = tick() + 60
        while CaculateDistance(v1790) > 20 and (tick() < v1793) do
            if _G.Stop then
                _G.ActiveMeleeQuest = nil
                return
            end
            TweenController.Create(v1790 + Vector3.new(0, 5, 0))
            task.wait(0.2)
        end
        if CaculateDistance(v1790) <= 25 then
            SetTask("MainTask", "Buying Melee | Purchasing Dragon Breath")
            pcall(function()
                Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
                task.wait(0.5)
                Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
            end)
            task.wait(1)
            RefreshInventory()
            pcall(SyncMeleeMasteryFromInventory)
            if ScriptStorage.Tools["Dragon Claw"] or (ScriptStorage.Melees["Dragon Claw"] or 0) > 0 then
                FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Dragon Claw")
                FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Melee")
                _G.ActiveMeleeQuest = nil
                return
            end
        end
        _G.ActiveMeleeQuest = nil
        return
    end
    local v1794 = GetTrueMastery("Electro")
    local v1795 = ScriptStorage.Tools["Electric Claw"] or (ScriptStorage.Melees["Electric Claw"] or 0) > 0
    if v536 == 3 and (v1794 >= 400) and (v1762 >= 3000000) and (v1763 >= 5000) and not v1795 then
        if FunctionsHandler.UtillyItemsActivitation and FunctionsHandler.UtillyItemsActivitation.Initalized then
            FunctionsHandler.UtillyItemsActivitation.Methods.Start:Call("Previous Hero")
            return
        end
    end
    local v1796 = GetTrueMastery("Fishman Karate")
    local v1797 = ScriptStorage.Tools["Sharkman Karate"] or (ScriptStorage.Melees["Sharkman Karate"] or 0) > 0
    if v1796 >= 400 and (v1762 >= 2500000) and (v1763 >= 5000) and not v1797 then
        _G.ActiveMeleeQuest = "Sharkman Karate"
        pcall(function()
            if v842 and v842.AbandonQuest then
                v842.AbandonQuest()
            end
            if CombatController and CombatController.StopCombat then
                CombatController.StopCombat()
            end
            Remotes.CommF_:InvokeServer("AbandonQuest")
        end)
        if v536 == 3 then
            SetTask("MainTask", "Sharkman Karate | Đi sang Sea 2 để mua võ...")
            SetTask("SubTask", "Đang dịch chuyển qua Second Sea (Dressrosa)")
            Remotes.CommF_:InvokeServer("TravelDressrosa")
            task.wait(5)
            return
        elseif v536 == 2 then
            SetTask("MainTask", "Sharkman Karate | Bay tới Sharkman Teacher (Forgotten Island)")
            local v1798 = CFrame.new(-3050.2, 240.5, -10150.3)
            pcall(function()
                local v1799 = workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild("Sharkman Teacher")
                if v1799 then
                    v1798 = v1799:GetPivot()
                end
            end)
            local v1800 = CaculateDistance(v1798)
            local v1801 = tick() + math.max(90, v1800 / 150 + 30)
            while CaculateDistance(v1798) > 25 and (tick() < v1801) do
                if _G.Stop then
                    _G.ActiveMeleeQuest = nil
                    return
                end
                TweenController.Create(v1798)
                task.wait(0.2)
                pcall(function()
                    local v1802 = workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild("Sharkman Teacher") or workspace:FindFirstChild("Sharkman Teacher")
                    if v1802 then
                        v1798 = v1802:GetPivot()
                    end
                end)
            end
            if CaculateDistance(v1798) <= 25 then
                SetTask("MainTask", "Sharkman Karate | Đang kiểm tra Sharkman Teacher...")
                local v1803 = nil
                pcall(function()
                    v1803 = Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
                end)
                print("[Sharkman Karate] Check status:", v1803)
                local v1804 = ScriptStorage.Tools["Water Key"] or LocalPlayer.Backpack:FindFirstChild("Water Key") or (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Water Key"))
                if typeof(v1803) == "string" and not v1804 then
                    SetTask("MainTask", "Sharkman Karate | Đang săn Tide Keeper lấy Water Key...")
                    local v1805 = workspace.Enemies:FindFirstChild("Tide Keeper")
                    if v1805 and v1805:FindFirstChildOfClass("Humanoid") and (v1805.Humanoid.Health > 0) then
                        CombatController.Attack("Tide Keeper")
                        return
                    else
                        SetTask("SubTask", "Chờ Tide Keeper xuất hiện...")
                        task.wait(2)
                        return
                    end
                elseif v1804 then
                    SetTask("MainTask", "Sharkman Karate | Nộp Water Key cho Sharkman Teacher...")
                    FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Water Key")
                    pcall(function()
                        Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
                        Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                    end)
                    task.wait(1)
                    RefreshInventory()
                end
                SetTask("MainTask", "Sharkman Karate | Đang mua võ Sharkman Karate...")
                pcall(function()
                    Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                end)
                task.wait(1)
                RefreshInventory()
                pcall(SyncMeleeMasteryFromInventory)
                if ScriptStorage.Tools["Sharkman Karate"] or (ScriptStorage.Melees["Sharkman Karate"] or 0) > 0 then
                    FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Sharkman Karate")
                    FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Melee")
                    _G.ActiveMeleeQuest = nil
                    SetTask("MainTask", "Sharkman Karate | Đã có võ! Đang quay lại Sea 3 để cày cấp...")
                    Remotes.CommF_:InvokeServer("TravelZou")
                    task.wait(5)
                    return
                end
            end
            _G.ActiveMeleeQuest = nil
            return
        end
    end
    local v1806 = GetTrueMastery("Dragon Claw")
    local v1807 = ScriptStorage.Tools["Dragon Talon"] or (ScriptStorage.Melees["Dragon Talon"] or 0) > 0
    local v1808 = ScriptStorage.Tools and ScriptStorage.Tools["Fire Essence"] or LocalPlayer.Backpack:FindFirstChild("Fire Essence") or (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Fire Essence")) or (GetMaterialCount and (GetMaterialCount("Fire Essence") > 0))
    if v536 == 3 and (v1806 >= 400) and (v1762 >= 3000000) and (v1763 >= 5000) and v1808 and not v1807 then
        _G.ActiveMeleeQuest = "Dragon Talon"
        pcall(function()
            if v842 and v842.AbandonQuest then
                v842.AbandonQuest()
            end
            if CombatController and CombatController.StopCombat then
                CombatController.StopCombat()
            end
            Remotes.CommF_:InvokeServer("AbandonQuest")
        end)
        SetTask("MainTask", "Dragon Talon | Bay tới Uzoth (Haunted Castle)...")
        local v1809 = CFrame.new(5661, 1210, 863)
        pcall(function()
            local v1810 = workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild("Uzoth")
            if v1810 then
                v1809 = v1810:GetPivot()
            end
        end)
        local v1811 = tick() + 60
        while CaculateDistance(v1809) > 25 and (tick() < v1811) do
            if _G.Stop then
                _G.ActiveMeleeQuest = nil
                return
            end
            TweenController.Create(v1809)
            task.wait(0.2)
        end
        if CaculateDistance(v1809) <= 25 then
            SetTask("MainTask", "Dragon Talon | Nộp Fire Essence và mua Dragon Talon...")
            FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Fire Essence")
            pcall(function()
                Remotes.CommF_:InvokeServer("BuyDragonTalon", true)
                Remotes.CommF_:InvokeServer("BuyDragonTalon")
            end)
            task.wait(1)
            RefreshInventory()
            pcall(SyncMeleeMasteryFromInventory)
            if ScriptStorage.Tools["Dragon Talon"] or (ScriptStorage.Melees["Dragon Talon"] or 0) > 0 then
                FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Dragon Talon")
                FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Melee")
            end
        end
        _G.ActiveMeleeQuest = nil
        return
    end
    local v1812 = ScriptStorage.Tools.Godhuman or (ScriptStorage.Melees.Godhuman or 0) > 0
    if v536 == 3 and not v1812 then
        local v1813 = GetTrueMastery("Superhuman") >= 400 and (GetTrueMastery("Death Step") >= 400) and (GetTrueMastery("Electric Claw") >= 400) and (GetTrueMastery("Sharkman Karate") >= 400) and (GetTrueMastery("Dragon Talon") >= 400)
        if v1813 and (v1762 >= 5000000) and (v1763 >= 5000) then
            local v1814 = GetMaterialCount and GetMaterialCount("Fish Tail") or 0
            local v1815 = GetMaterialCount and GetMaterialCount("Dragon Scale") or 0
            local v1816 = GetMaterialCount and GetMaterialCount("Magma Ore") or 0
            local v1817 = GetMaterialCount and GetMaterialCount("Mystic Droplet") or 0
            if v1814 >= 20 and (v1815 >= 10) and (v1816 >= 20) and (v1817 >= 10) then
                _G.ActiveMeleeQuest = "Godhuman"
                pcall(function()
                    if v842 and v842.AbandonQuest then
                        v842.AbandonQuest()
                    end
                    if CombatController and CombatController.StopCombat then
                        CombatController.StopCombat()
                    end
                    Remotes.CommF_:InvokeServer("AbandonQuest")
                end)
                SetTask("MainTask", "Godhuman | Bay tới Ancient Monk (Floating Turtle)...")
                local v1818 = CFrame.new(-2880, 44, -10140)
                pcall(function()
                    local v1819 = workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild("Ancient Monk")
                    if v1819 then
                        v1818 = v1819:GetPivot()
                    end
                end)
                local v1820 = tick() + 60
                while CaculateDistance(v1818) > 25 and (tick() < v1820) do
                    if _G.Stop then
                        _G.ActiveMeleeQuest = nil
                        return
                    end
                    TweenController.Create(v1818)
                    task.wait(0.2)
                end
                if CaculateDistance(v1818) <= 25 then
                    SetTask("MainTask", "Godhuman | Mua võ Godhuman (5M Beli + 5,000 Fragments)...")
                    pcall(function()
                        Remotes.CommF_:InvokeServer("BuyGodhuman", true)
                        Remotes.CommF_:InvokeServer("BuyGodhuman")
                    end)
                    task.wait(1)
                    RefreshInventory()
                    pcall(SyncMeleeMasteryFromInventory)
                    if ScriptStorage.Tools.Godhuman or (ScriptStorage.Melees.Godhuman or 0) > 0 then
                        FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Godhuman")
                        FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Melee")
                    end
                end
                _G.ActiveMeleeQuest = nil
                return
            end
        end
    end
    local v1821 = nil
    local v1822 = nil
    local v1823 = nil
    for v1824, v1825 in ipairs(MeleesTable) do
        if v1825 ~= "SanguineArt" and (v1825 ~= "Godhuman") then
            local v1826 = MeleePrices[v1825]
            if v1826 then
                local v1827 = GetTrueMastery(v1825)
                local v1828 = ScriptStorage.Tools[v1825] or (ScriptStorage.Melees[v1825] or 0) > 0
                if v1828 and (v1827 < 400) then
                    v1821 = v1825
                    v1822 = v1826
                    break
                elseif not v1828 then
                    if v1826.Price and v1826.Price.Fragments and (v1763 < v1826.Price.Fragments) then
                        v1823 = math.max(v1823 or 0, v1826.Price.Fragments)
                    end
                end
            end
        end
    end
    getgenv().KaitunNeedFragAmount = v1823
    if v1821 and v1822 then
        ScriptStorage.FarmingMelee = v1821
        local v1829 = 400
        local v1830 = GetTrueMastery(v1821)
        SetTask("SubTask", "Farming Mastery For " .. v1821 .. " ( " .. v1830 .. " / " .. v1829 .. " )")
        if not ScriptStorage.Tools[v1821] then
            pcall(function()
                if v1822.Buy then
                    v1822.Buy(true)
                else
                    local v1831 = v1822.Id or v1821:gsub("%s+", "")
                    Remotes.CommF_:InvokeServer("Buy" .. v1831, true)
                end
            end)
            task.wait(0.3)
            RefreshInventory()
        end
        CombatController.EquipMeleeStyle(v1821)
        FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Melee")
        return
    else
        ScriptStorage.FarmingMelee = nil
        SetTask("SubTask", "")
    end
    if FirstCall then
        FirstCall = false
        return
    end
    FarmingItem = nil
    for v1832, v1833 in ScriptStorage.Backpack do
        if v1833.Type == "Sword" then
            if v1833.Name == "Yama" or v1833.Name == "Tushita" then
                MasteryRequirement = 350
            else
                for v1834, v1835 in v1833.MasteryRequirements do
                    MasteryRequirement = v1835
                end
            end
            if v1833.Mastery < MasteryRequirement then
                if v1833.Name == "Yama" or v1833.Name == "Tushita" then
                    FarmingItem = { v1833.Name, v1833.Mastery, MasteryRequirement }
                    break
                end
            end
        end
    end
    if FarmingItem then
        SetTask("SubTask", "Farming mastery for " .. FarmingItem[1] .. " ( " .. FarmingItem[2] .. " / " .. FarmingItem[3] .. " )")
        if not ScriptStorage.Tools[FarmingItem[1]] then
            Remotes.CommF_:InvokeServer("LoadItem", FarmingItem[1])
        end
        ScriptStorage.ForceToUseSword = FarmingItem
    end
end)
FunctionsHandler.KataFragTask:RegisterMethod("Refresh", function()
    if v536 ~= 3 then
        return false
    end
    local v1836 = ScriptStorage.PlayerData and ScriptStorage.PlayerData.Level or (game.Players.LocalPlayer:FindFirstChild("Data") and game.Players.LocalPlayer.Data:FindFirstChild("Level") and game.Players.LocalPlayer.Data.Level.Value) or 0
    if v1836 < 2000 then
        return false
    end
    local v1837 = ScriptStorage.Tools.Godhuman or (ScriptStorage.Melees and ((ScriptStorage.Melees.Godhuman or 0) > 0))
    if v1837 then
        for v1838, v1839 in ipairs({
    "Black Leg",
    "Electro",
    "Fishman Karate",
    "Dragon Claw",
    "Superhuman",
    "Death Step",
    "Sharkman Karate",
    "Electric Claw",
    "Dragon Talon"
}) do
            ScriptStorage.Melees[v1839] = math.max(ScriptStorage.Melees[v1839] or 400, 400)
        end
        if v1836 < MaxLevel and not getgenv().AutoCakePrince then
            return false
        end
    end
    if IsInRaid and IsInRaid() then
        return false
    end
    local v1840 = nil
    pcall(function()
        if FunctionsHandler.RaidController and FunctionsHandler.RaidController.Methods.GetCurrentRaidIsland then
            v1840 = FunctionsHandler.RaidController.Methods.GetCurrentRaidIsland:Call()
        end
    end)
    if v1840 then
        return false
    end
    if CombatController and CombatController.FindCakeBoss and CombatController.FindCakeBoss() then
        return true
    end
    if getgenv().AutoCakePrince == true then
        return true
    end
    local v1841 = nil
    for v1842, v1843 in ipairs(MeleesTable) do
        if v1843 ~= "SanguineArt" and (v1843 ~= "Godhuman") then
            local v1844 = ScriptStorage.Tools[v1843] or (ScriptStorage.Melees[v1843] or 0) > 0
            if v1844 then
                local v1845 = GetTrueMastery(v1843)
                if v1845 < 400 then
                    v1841 = v1843
                    break
                end
            end
        end
    end
    if v1841 then
        ScriptStorage.FarmingMelee = v1841
        return false
    end
    local v1846 = ScriptStorage.PlayerData and ScriptStorage.PlayerData.Fragments or (game.Players.LocalPlayer:FindFirstChild("Data") and game.Players.LocalPlayer.Data:FindFirstChild("Fragments") and game.Players.LocalPlayer.Data.Fragments.Value) or 0
    local v1847 = 0
    for v1848, v1849 in ipairs(MeleesTable) do
        if v1849 ~= "SanguineArt" then
            local v1850 = ScriptStorage.Tools[v1849] or (ScriptStorage.Melees[v1849] or 0) > 0
            if not v1850 then
                local v1851 = MeleePrices[v1849]
                if v1851 and v1851.Price and v1851.Price.Fragments then
                    if v1846 < v1851.Price.Fragments then
                        v1847 = v1851.Price.Fragments
                        break
                    end
                end
            end
        end
    end
    getgenv().KaitunNeedFragAmount = v1847
    if v1847 > 0 and (v1846 < v1847) then
        return true
    end
    return false
end)
FunctionsHandler.KataFragTask:RegisterMethod("Start", function()
    local v1852 = ScriptStorage.PlayerData and ScriptStorage.PlayerData.Fragments or (game.Players.LocalPlayer:FindFirstChild("Data") and game.Players.LocalPlayer.Data:FindFirstChild("Fragments") and game.Players.LocalPlayer.Data.Fragments.Value) or 0
    local v1853 = ScriptStorage and ScriptStorage.FarmingMelee
    local v1854 = v1853 and ScriptStorage.Melees and ScriptStorage.Melees[v1853] or 0
    if v1853 then
        SetTask("MainTask", "Cake Prince Hop | Cày võ " .. tostring(v1853) .. " (" .. tostring(v1854) .. "/400)")
    else
        SetTask("MainTask", "Farm Frag | Cake Prince (" .. tostring(v1852) .. " frags)")
    end
    if getgenv()._LastCakeJobId ~= game.JobId then
        getgenv()._LastCakeJobId = game.JobId
        getgenv()._JoinCakeServerTime = os.time()
        getgenv()._InsideMirrorSince = nil
        getgenv()._ArrivedCenterTime = nil
        getgenv().KaitunCakeProg = nil
        getgenv().KaitunCakeRawSpawner = nil
        getgenv().KaitunCakeProgAt = 0
    end
    local v1855 = game.Players.LocalPlayer
    local v1856 = v1855 and v1855.Character
    local v1857 = v1856 and v1856:FindFirstChild("HumanoidRootPart")
    local v1858, v1859 = CombatController.FindTopPriorityBoss and CombatController.FindTopPriorityBoss()
    if v1858 then
        warn("[KataFragTask] Phat hien Top Priority Boss: " .. tostring(v1859))
        SetTask("MainTask", "Priority Boss | " .. tostring(v1859))
        CombatController.Attack(v1858)
        return
    end
    local v1860, v1861 = CombatController.FindCakePrince and CombatController.FindCakePrince()
    if v1860 then
        warn("[KataFragTask] Phat hien " .. tostring(v1861) .. " -> Danh ngay!")
        SetTask("MainTask", "Fight | " .. tostring(v1861))
        CombatController.Attack(v1860)
        return
    end
    if v1857 and (v1857.Position.Y > 3500) then
        local v1862 = Vector3.new(-2113, 4676, -15137)
        local v1863 = (v1857.Position - v1862).Magnitude
        if v1863 > 40 then
            SetTask("MainTask", "Mirror Dimension | Bay vao tam san dau...")
            TweenController.Create(CFrame.new(v1862))
            return
        end
        if not getgenv()._ArrivedCenterTime then
            getgenv()._ArrivedCenterTime = os.time()
            task.wait(0.8)
            return
        end
        local v1864, v1865 = CombatController.FindCakePrince and CombatController.FindCakePrince()
        if v1864 then
            getgenv()._ArrivedCenterTime = nil
            warn("[KataFragTask] Phat hien " .. tostring(v1865) .. " -> Danh ngay!")
            SetTask("MainTask", "Fight | " .. tostring(v1865))
            CombatController.Attack(v1864)
            return
        end
        warn("[KataFragTask] Khong co Cake Prince trong Mirror Dimension -> Hop API ngay!")
        SetTask("MainTask", "Hop Cake Prince | Kurinian API...")
        getgenv()._ArrivedCenterTime = nil
        if ParseCurrentQuest and ParseCurrentQuest() and v842 and v842.AbandonQuest then
            pcall(v842.AbandonQuest)
        end
        if TweenController and TweenController.StopMovement then
            TweenController.StopMovement()
        end
        Hop.API("cakeprince", 12, 10)
        task.wait(1)
        return
    end
    local v1866 = getgenv().KaitunCakeProg
    getgenv().KaitunCakeProgAt = getgenv().KaitunCakeProgAt or 0
    local v1867 = getgenv().KaitunCakeRawSpawner
    if os.time() - getgenv().KaitunCakeProgAt > 3 or not v1867 then
        getgenv().KaitunCakeProgAt = os.time()
        pcall(function()
            local v1868 = Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
            if v1868 then
                v1867 = tostring(v1868)
                getgenv().KaitunCakeRawSpawner = v1867
                local v1869 = v1867:lower()
                local v1870 = v1869:find("still need") or v1869:find("more enemies")
                if not v1870 and (v1869:find("open") or v1869:find("dimension") or v1869:find("rift") or v1869:find("inside") or v1869:find("ready") or v1869:find("he is here") or v1869:find("arrived") or v1869:find("cake prince") or v1869:find("dough king")) then
                    v1866 = 0
                    getgenv().KaitunCakeProg = 0
                else
                    local v1871 = tonumber(string.match(v1867, "(%d+)%s*more") or string.match(v1867, "%d+"))
                    if v1871 then
                        v1866 = v1871
                        getgenv().KaitunCakeProg = v1871
                    end
                end
            end
        end)
    end
    local v1872 = workspace.Map:FindFirstChild("CakeLoaf") and workspace.Map.CakeLoaf:FindFirstChild("BigMirror")
    local v1873 = v1867 and v1867:lower() or ""
    local v1874 = v1872 ~= nil or v1866 == 0 or (v1867 and not (v1873:find("still need") or v1873:find("more enemies")) and (v1873:find("open") or v1873:find("dimension") or v1873:find("rift") or v1873:find("inside") or v1873:find("ready")))
    if v1874 then
        if v1857 and (v1857.Position.Y < 3500) then
            SetTask("MainTask", "Cake Prince | Cổng mở -> Bay vao Mirror Dimension...")
            local v1875 = CFrame.new(-2151.82, 149.32, -12404.9)
            TweenController.Create(v1875)
            if (v1857.Position - v1875.Position).Magnitude <= 25 then
                pcall(function()
                    local v1876 = nil
                    if workspace.Map:FindFirstChild("CakeLoaf") and workspace.Map.CakeLoaf:FindFirstChild("BigMirror") then
                        local v1877 = workspace.Map.CakeLoaf.BigMirror
                        v1876 = v1877:FindFirstChild("Main") or v1877:FindFirstChildWhichIsA("BasePart")
                    end
                    if v1876 and firetouchinterest then
                        firetouchinterest(v1857, v1876, 0)
                        task.wait(0.1)
                        firetouchinterest(v1857, v1876, 1)
                    end
                end)
                task.wait(0.5)
            end
            return
        end
    end
    if not v1867 then
        local v1878 = os.time() - (getgenv()._JoinCakeServerTime or 0)
        if v1878 < 4 then
            SetTask("MainTask", "Cake Prince | Kiem tra trang thai server...")
            task.wait(0.5)
            return
        end
    end
    warn("[KataFragTask] Server chua co Cake Prince (" .. tostring(v1867 or "chua ro") .. ") -> Hop tim server co Cake Prince bang API...")
    SetTask("MainTask", "Hop Cake Prince | Kurinian API...")
    if ParseCurrentQuest and ParseCurrentQuest() and v842 and v842.AbandonQuest then
        pcall(v842.AbandonQuest)
    end
    if TweenController and TweenController.StopMovement then
        TweenController.StopMovement()
    end
    local v1879 = Hop.API("cakeprince", 12, 15)
    if not v1879 then
        warn("[KataFragTask] Chua tim duoc server Cake Prince phu hop, se thu lai...")
        task.wait(2)
    end
end)
local v1880 = nil
FunctionsHandler.SecondSeaPuzzle:RegisterMethod("Refresh", function()
    if ScriptStorage.PlayerData.Level < 700 or v536 ~= 1 then
        return
    end
    if FunctionsHandler.SecondSeaPuzzle:Get("IsCompleted") then
        return
    end
    local v1881 = nil
    pcall(function()
        v1881 = Remotes.CommF_:InvokeServer("DressrosaQuestProgress")
    end)
    local v1882 = nil
    if type(v1881) == "table" then
        if not v1881.TalkedDetective then
            v1882 = 1
        elseif not v1881.KilledIceBoss then
            v1882 = 2
        else
            v1882 = 3
        end
    else
        if v1881 == 0 then
            v1882 = 1
        elseif v1881 == 1 then
            v1882 = 2
        elseif v1881 == 2 then
            v1882 = 3
        else
            v1882 = 1
        end
    end
    FunctionsHandler.SecondSeaPuzzle:Set("CurrentProgressLevel", v1882)
    FunctionsHandler.SecondSeaPuzzle:Set("LastestRefreshSenque", os.time())
    return v1882
end)
FunctionsHandler.SecondSeaPuzzle:RegisterMethod("Start", function()
    local v1883 = FunctionsHandler.SecondSeaPuzzle:Get("CurrentProgressLevel")
    FunctionsHandler.SecondSeaPuzzle:Set("CurrentProgressLevel", nil)
    if not v1883 then
        v1883 = FunctionsHandler.SecondSeaPuzzle.Methods.Refresh:Call()
        if not v1883 then
            return
        end
    end
    if v1883 == 1 then
        SetTask("MainTask", "Auto Second Sea - Talk To Detective")
        local v1884 = CFrame.new(4849.2, 5.65, 743.5)
        local v1885 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if v1885 and ((v1885.Position - v1884.Position).Magnitude > 50) then
            TweenController.Create(v1884)
        else
            Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective")
            task.wait(1)
            Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "UseKey")
        end
    elseif v1883 == 2 then
        Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "UseKey")
        SetTask("MainTask", "Auto Second Sea - Defeating Ice Admiral")
        local v1886 = workspace.Enemies:FindFirstChild("Ice Admiral")
        if v1886 and v1886:FindFirstChildOfClass("Humanoid") and (v1886.Humanoid.Health > 0) then
            v1880 = nil
            CombatController.Attack("Ice Admiral")
        else
            local v1887 = CFrame.new(1347, 37, -1325)
            local v1888 = CFrame.new(1212, 28, -1429)
            local v1889 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if v1889 and ((v1889.Position - v1887.Position).Magnitude > 60) then
                TweenController.Create(v1887)
            else
                TweenController.Create(v1888)
                if not v1880 then
                    v1880 = tick()
                end
                if tick() - v1880 > 45 then
                    SetTask("MainTask", "Auto Second Sea - Ice Admiral chưa spawn, đang đổi server...")
                    v1880 = nil
                    if Hop and Hop.A then
                        Hop.A()
                    elseif Lowhop then
                        Lowhop()
                    end
                    task.wait(5)
                    return
                else
                    SetTask("MainTask", string.format("Auto Second Sea - Chờ Ice Admiral spawn (%ds)...", math.max(0, math.floor(45 - (tick() - v1880)))))
                end
            end
        end
    elseif v1883 == 3 then
        SetTask("MainTask", "Auto Second Sea - Teleporting to Second Sea")
        Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective")
        task.wait(1)
        Remotes.CommF_:InvokeServer("TravelDressrosa")
        FunctionsHandler.SecondSeaPuzzle:Set("IsCompleted", true)
    end
end)
FunctionsHandler.ColosseumPuzzle:RegisterMethod("Refresh", function()
    if v536 ~= 2 then
        return
    end
    if (tonumber(ScriptStorage.PlayerData.Level) or 0) < 850 then
        return
    end
    local v1890 = tonumber(Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo"))
    if v1890 == 0 then
        return 1
    end
    if v1890 == 1 then
        return 2
    end
    if v1890 == 2 then
        return 3
    end
    return nil
end)
FunctionsHandler.ColosseumPuzzle:RegisterMethod("Start", function(p1891)
    print("Progress : ", p1891)
    if not p1891 then
        FunctionsHandler.ColosseumPuzzle.Methods.Refresh:Call()
        return FunctionsHandler.ColosseumPuzzle.Methods.Start:Call()
    elseif p1891 == 1 then
        SetTask("MainTask", "Auto Bartilo Quest - Defeating 50x Swan Pirate")
        local v1892, v1893 = v842:GetCurrentClaimQuest()
        if v1892 then
            if not string.find(v1893, "50") then
                v842.AbandonQuest()
            else
                CombatController.Attack("Swan Pirate")
            end
        else
            v842.StartQuest("BartiloQuest", 1)
        end
    elseif p1891 == 2 then
        SetTask("MainTask", "Auto Bartilo Quest - Defeating Jeremy")
        local v1894 = workspace:FindFirstChild("Enemies")
        local v1895 = v1894 and v1894:FindFirstChild("Jeremy")
        local v1896 = v1895 and v1895:FindFirstChildOfClass("Humanoid")
        if v1896 and (v1896.Health > 0) then
            CombatController.Attack("Jeremy")
        else
            local v1897 = CFrame.new(2200, 449, 752)
            TweenController.Create(v1897)
            local v1898 = os.clock()
            local v1899 = FunctionsHandler.ColosseumPuzzle:Get("JeremyWaitSince")
            if not v1899 then
                FunctionsHandler.ColosseumPuzzle:Set("JeremyWaitSince", v1898)
            end
            SetTask("MainTask", "Bartilo | Waiting for Jeremy; searching server after 30s")
            if v1899 and (v1898 - v1899 >= 30) then
                FunctionsHandler.ColosseumPuzzle:Set("JeremyWaitSince", v1898)
                Hop.A(10)
            end
        end
    elseif p1891 == 3 then
        SetTask("MainTask", "Bartilo | Completing plate puzzle")
        local v1900 = LocalPlayer.Character
        local v1901 = v1900 and v1900:FindFirstChild("HumanoidRootPart")
        local v1902 = v1900 and v1900:FindFirstChildOfClass("Humanoid")
        if not v1901 or not v1902 or v1902.Health <= 0 then
            return
        end
        local v1903 = CFrame.new(-1837.46155, 44.2921753, 1656.1987)
        if (v1901.Position - v1903.Position).Magnitude > 100 then
            TweenController.Create(v1903)
            return
        end
        local v1904 = workspace:FindFirstChild("Map")
        local v1905 = v1904 and v1904:FindFirstChild("Dressrosa")
        local v1906 = v1905 and v1905:FindFirstChild("BartiloPlates")
        if not v1906 then
            SetTask("MainTask", "Bartilo | Waiting for plates to load")
            return
        end
        for v1907 = 1, 8 do
            if not v1906:FindFirstChild("Plate" .. v1907) then
                return
            end
        end
        TweenController.StopMovement()
        CombatController._fixedAnchorPos = nil
        v1901.CFrame = CFrame.new(-1836, 11, 1714)
        task.wait(1)
        for v1908 = 1, 8 do
            if _G.Stop or LocalPlayer.Character ~= v1900 or v1902.Health <= 0 then
                return
            end
            local v1909 = v1906:FindFirstChild("Plate" .. v1908)
            if not v1909 or not v1909:IsA("BasePart") then
                return
            end
            SetTask("MainTask", "Bartilo | Plate " .. v1908 .. "/8")
            v1901.CFrame = v1909.CFrame + Vector3.new(0, v1909.Size.Y / 2 + 2, 0)
            v1901.AssemblyLinearVelocity = Vector3.zero
            if firetouchinterest then
                pcall(function()
                    firetouchinterest(v1901, v1909, 0)
                end)
            end
            task.wait(1)
            if firetouchinterest then
                pcall(function()
                    firetouchinterest(v1901, v1909, 1)
                end)
            end
        end
        task.wait(1)
        local v1910 = tonumber(Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo"))
        FunctionsHandler.ColosseumPuzzle:Set("PuzzleProgress", v1910)
        SetTask("MainTask", v1910 == 3 and "Bartilo | Completed" or "Bartilo | Not confirmed; retrying plates")
    end
end)
do
    local v1911 = getgenv().__KaitunWorldIndex
    if v1911 and v1911.Destroy then
        v1911:Destroy()
    end
end
KaitunWorldIndex = function()
    local v1912 = getgenv()
    local v1913 = v1912.__KaitunWorldIndex
    if v1913 then
        return v1913
    end
    local v1914 = { Chests = {}, Fruits = {}, Connections = {} }
    v1912.__KaitunWorldIndex = v1914
    local function v1915(p1916)
        if p1916:IsA("BasePart") and (p1916.Name == "Chest1" or p1916.Name == "Chest2" or p1916.Name == "Chest3") then
            v1914.Chests[p1916] = true
        elseif p1916:IsA("Tool") then
            v1914.Fruits[p1916] = true
        end
    end
    v1914.Connections[1] = workspace.DescendantAdded:Connect(v1915)
    v1914.Connections[2] = workspace.DescendantRemoving:Connect(function(p1917)
        v1914.Chests[p1917] = nil
        v1914.Fruits[p1917] = nil
    end)
    v1914.Destroy = function(p1918)
        for v1919, v1920 in ipairs(p1918.Connections) do
            v1920:Disconnect()
        end
        table.clear(p1918.Chests)
        table.clear(p1918.Fruits)
        if v1912.__KaitunWorldIndex == p1918 then
            v1912.__KaitunWorldIndex = nil
        end
    end
    local v1921 = os.clock()
    for v1922, v1923 in ipairs(workspace:GetDescendants()) do
        v1915(v1923)
        if os.clock() - v1921 >= 0.002 then
            task.wait()
            v1921 = os.clock()
        end
    end
    return v1914
end
KaitunNearestIndexedChest = function()
    local v1924 = game.Players.LocalPlayer.Character
    local v1925 = v1924 and v1924:FindFirstChild("HumanoidRootPart")
    if not v1925 then
        return nil
    end
    local v1926, v1927 = nil, math.huge
    for v1928 in pairs(KaitunWorldIndex().Chests) do
        if v1928.Parent and v1928.CanTouch then
            local v1929 = (v1925.Position - v1928.Position).Magnitude
            if v1929 < v1927 then
                v1926, v1927 = v1928, v1929
            end
        end
    end
    return v1926
end
local function v1930()
    return KaitunNearestIndexedChest()
end
checksafezone = function(p1931)
    if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
        for v1932, v1933 in pairs(game:GetService("Workspace")._WorldOrigin.SafeZones:GetChildren()) do
            if v1933:IsA("Part") then
                if p1931 and p1931:FindFirstChild("HumanoidRootPart") and ((v1933.Position - p1931.HumanoidRootPart.Position).magnitude <= 200) and (p1931.Humanoid.Health / p1931.Humanoid.MaxHealth >= 90 / 100) then
                    return true
                end
            end
        end
    end
    return false
end
BlacklistedPlayers = { LocalPlayer.Name }
GetSkyRacePlayer = function()
    for v1934, v1935 in game.Players:GetPlayers() do
        if v1935 and v1935.Character then
            local v1936 = v1935.Character:FindFirstChildOfClass("Humanoid")
            if not table.find(BlacklistedPlayers, v1935.Name) and v1936 and (v1936.Health > 0) then
                Hop.A()
                if v1935.Data.Race.Value == "Skypiea" and not v1935:GetAttribute("IslandRaiding") then
                    print(3)
                    if not checksafezone(v1935) and (CaculateDistance(v1935.Character.HumanoidRootPart.CFrame) < 12000) and (v1935.Character.HumanoidRootPart.CFrame.Y > 0) then
                        print(4)
                        table.insert(BlacklistedPlayers, v1935.Name)
                        return v1935
                    end
                end
            end
        end
    end
end
GetPlayerBoat = function()
    for v1937, v1938 in workspace.Boats:GetChildren() do
        if v1938:IsA("Model") then
            local v1939 = v1938:FindFirstChild("Owner")
            local v1940 = v1938:FindFirstChildOfClass("Humanoid")
            if v1939 and v1940 and (tostring(v1939.Value) == game.Players.LocalPlayer.Name) and (v1940.Value > 0) then
                return v1938
            end
        end
    end
end
SendKey = function(p1941, p1942)
    (function()
        game:GetService("VirtualInputManager"):SendKeyEvent(true, p1941, false, game)
        task.wait(p1942)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, p1941, false, game)
    end)()
end
GetSeabeast = function()
    for v1943, v1944 in workspace.SeaBeasts:GetChildren() do
        if v1944:FindFirstChild("Health").Value > 30000 then
            return v1944
        end
    end
end
local v1945 = getrawmetatable(game)
local v1946 = v1945.__namecall
setreadonly(v1945, false)
v1945.__namecall = newcclosure(function(p1947, ...)
    local v1948 = getnamecallmethod()
    local v1949 = { ... }
    if v1948 == "FireServer" and (p1947.Name == "RemoteEvent") then
        if getgenv().LastestLockDate and (os.time() - LastestLockDate < 3) then
            v1949[1] = getgenv().LockPosition
        end
    end
    return v1946(p1947, unpack(v1949))
end)
FunctionsHandler.EvoRace:RegisterMethod("Refresh", function()
    if ScriptStorage.PlayerData.Level < MaxLevel then
        return
    end
    if not (Config and Config.Items and Config.Items.RaceV3) then
        return
    end
    local v1950 = ScriptStorage.PlayerData.RaceLevel or 1
    if v1950 >= 3 then
        return nil
    end
    if v536 == 3 then
        return "TravelBackToSea2"
    end
    if v536 ~= 2 then
        return
    end
    local v1951 = ""
    if LocalPlayer.Data and LocalPlayer.Data:FindFirstChild("Race") then
        v1951 = LocalPlayer.Data.Race.Value
    end
    local v1952 = v1951 == "Mink" or v1951 == "Rabbit" or v1951 == "Human"
    local v1953 = ScriptStorage.PlayerData.RaceLevel or 1
    local v1954 = ScriptStorage.PlayerData.Beli or 0
    local v1955 = ScriptStorage.PlayerData.Fragments or 0
    if not v1952 then
        if v1955 < 3000 then
            return "FarmFrag"
        end
        return "Reroll"
    end
    if v1953 == 1 then
        if v1954 < 500000 then
            return "FarmBeli"
        end
        return "UpgradeV2"
    elseif v1953 == 2 then
        if v1954 < 2000000 then
            return "FarmBeli"
        end
        return "UpgradeV3"
    end
    return nil
end)
v1930 = function()
    return KaitunNearestIndexedChest()
end
FunctionsHandler.EvoRace:RegisterMethod("Start", function(p1956)
    if p1956 == "TravelBackToSea2" then
        SetTask("MainTask", "Auto Race - Travelling back to Second Sea")
        Remotes.CommF_:InvokeServer("TravelDressrosa")
        task.wait(10)
        return
    end
    if p1956 == "FarmBeli" then
        SetTask("MainTask", "Auto Race - Farming Beli")
        if FunctionsHandler.LevelFarm and FunctionsHandler.LevelFarm.Methods.Start then
            FunctionsHandler.LevelFarm.Methods.Start:Call()
        end
        return
    end
    if p1956 == "FarmFrag" then
        SetTask("MainTask", "Auto Race - Farming Fragments")
        if FunctionsHandler.RaidController and FunctionsHandler.RaidController.Methods.Start then
            FunctionsHandler.RaidController.Methods.Start:Call()
        end
        return
    end
    if p1956 == "Reroll" then
        SetTask("MainTask", "Auto Race - Rerolling Race")
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
        task.wait(1)
        if RefreshRace then
            RefreshRace()
        end
        return
    end
    if p1956 == "UpgradeV2" then
        if v536 ~= 2 then
            return
        end
        Upv2 = true
        if math.floor(game.Lighting.ClockTime) >= 18 or math.floor(game.Lighting.ClockTime) < 5 then
        else
            Hop.API("CursedCaptain", 12, 2)
            return true
        end
        Remotes.CommF_:InvokeServer("Alchemist", "1")
        Remotes.CommF_:InvokeServer("Alchemist", "2")
        for v1957 = 1, 2 do
            local v1958 = ScriptStorage.Tools["Flower " .. v1957]
            local v1959 = Services.Workspace:FindFirstChild("Flower" .. v1957)
            if not v1958 then
                if v1959 and (v1959.Transparency == 0) then
                    while not ScriptStorage.Tools["Flower " .. v1957] do
                        task.wait()
                        TweenController.Create(v1959.CFrame + Vector3.new(0, math.random(-1, 2), 0))
                    end
                end
            end
        end
        if not ScriptStorage.Tools["Flower 3"] then
            CombatController.Attack("Swan Pirate")
        else
            if LocalPlayer.Character.HumanoidRootPart.CFrame.Y < 10000 then
                TweenController.Create(LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 50, 0))
            end
            Remotes.CommF_:InvokeServer("Alchemist", "3")
        end
        Upv2 = false
        return true
    end
    if p1956 == "UpgradeV3" then
        if v536 ~= 2 then
            return
        end
        Upv3 = true
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
        Race = game.Players.LocalPlayer.Data.Race.Value
        if Race == "Mink" then
            local v1960 = 0
            while task.wait() do
                if v1960 > 35 then
                    break
                end
            end
            local v1961 = v1930()
            if v1961 then
                repeat
                    wait()
                    TweenController.Create(v1961.CFrame + Vector3.new(0, math.random(-2, 2), 0))
                until not v1961.CanTouch
                SetTask("SubTask", "Total Collected Chests: " .. v1960)
                v1960 = v1960 + 1
                task.wait(2)
            end
        elseif Race == "Skypiea" then
            local v1962 = GetSkyRacePlayer()
            if not v1962 then
                return Hop.A() or true
            end
            Remotes.CommF_:InvokeServer("EnablePvp")
            local v1963 = os.time()
            repeat
                task.wait()
                TweenController.Create(CaculateCircreDirection(v1962.Character.HumanoidRootPart.CFrame) + Vector3.new(0, math.random(-35, 35), 0))
                if math.random(1, 20) == 1 then
                    TweenController.Create(CaculateCircreDirection(v1962.Character.HumanoidRootPart.CFrame) + Vector3.new(0, math.random(300, 3005), 0))
                    task.wait(math.random(2, 5) / 10)
                end
                if not ScriptStorage.Tools.Yama and ScriptStorage.Backpack.Yama then
                    Remotes.CommF_:InvokeServer("LoadItem", "Yama")
                end
                if CaculateDistance(v1962.Character.HumanoidRootPart.CFrame) < 100 then
                    CombatController.Attack(v1962.Character.HumanoidRootPart.CFrame)
                end
            until os.time() - v1963 > 100 or SkipPlayer or not v1962 or not LocalPlayer or not v1962.Character or not LocalPlayer.Character or not v1962.Character:FindFirstChildOfClass("Humanoid") or not LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or v1962.Character.Humanoid.Health <= 0 or LocalPlayer.Character.Humanoid.Health <= 0
            SetTask("MainTask", "Auto Race - Upgrading")
            Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
            SkipPlayer = false
        elseif Race == "Fishman" then
            local v1964
            if not v1964 then
                local v1965 = GetPlayerBoat()
                if not v1965 then
                    TweenController.Create(CFrame.new(-14, 10, 2955))
                    if CaculateDistance(CFrame.new(-14, 10, 2955)) < 10 then
                        Remotes.CommF_:InvokeServer("BuyBoat", "PirateBrigade")
                    end
                elseif CaculateDistance(v1965.VehicleSeat.CFrame, CFrame.new(-67, 5, 4205)) > 500 then
                    v1965.VehicleSeat.CFrame = CFrame.new(-67, 5.564787268638611, 4205)
                elseif CaculateDistance(v1965.VehicleSeat.CFrame) > 5 then
                    TweenController.Create(v1965.VehicleSeat.CFrame + Vector3.new(0, math.random(-1, 2), 0))
                end
            else
                if not ScriptStorage.Tools["Sharkman Karate"] then
                    getpos = function(p1966)
                        for v1967, v1968 in game:GetService("ReplicatedStorage").NPCs:GetChildren() do
                            if v1968.Name == p1966 then
                                return v1968.HumanoidRootPart.CFrame
                            end
                        end
                        for v1969, v1970 in workspace.NPCs:GetChildren() do
                            if v1970.Name == p1966 then
                                return v1970.HumanoidRootPart.CFrame
                            end
                        end
                    end
                    TweenController.Create((getpos("Sharkman Teacher")))
                    repeat
                        wait()
                    until game.Players.LocalPlayer:DistanceFromCharacter(getpos("Sharkman Teacher").Position) <= 30
                    Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                end
                repeat
                    task.wait()
                    if v1964.WorldPivot.Position.Y >= -179 then
                        TweenController.Create(v1964.WorldPivot * CFrame.new(0, 300, 0))
                        LockAimPositionTo(v1964.WorldPivot * CFrame.new(0, 300, 0))
                        for v1971, v1972 in { "Z", "X", "C" } do
                            SendKey(v1972)
                        end
                    else
                        TweenController.Create(v1964.WorldPivot * CFrame.new(0, 900, 0))
                    end
                until not v1964 or not v1964:FindFirstChild("Health") or v1964.Health.Value <= 0
                Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
            end
        elseif Race == "Human" then
            local v1973 = { "Diamond", "Jeremy", "Orbitus" }
            for v1974, v1975 in v1973 do
                if not ScriptStorage.Enemies[v1975] then
                    Hop.A()
                end
            end
            for v1976, v1977 in v1973 do
                repeat
                    wait()
                    CombatController.Attack(v1977)
                until not ScriptStorage.Enemies[v1977] or not ScriptStorage.Enemies[v1977]:FindFirstChildOfClass("Humanoid") or ScriptStorage.Enemies[v1977].Humanoid.Health < 1
            end
            Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
        end
        Upv3 = false
        return true
    end
end)
FunctionsHandler.BossesTask:RegisterMethod("Refresh", function()
    if IsInRaid and IsInRaid() then
        return false
    end
    if v536 == 3 then
        if CombatController and CombatController.FindTopPriorityBoss then
            local v1978, v1979 = CombatController.FindTopPriorityBoss()
            if v1978 then
                return v1978
            end
        end
        if CombatController and CombatController.FindCakePrince then
            local v1980, v1981 = CombatController.FindCakePrince()
            if v1980 then
                return v1980
            end
        end
        return nil
    end
    if ParseCurrentQuest and ParseCurrentQuest() then
        return nil
    end
    local v1982
    if v536 == 2 then
        v1982 = { ["Awakened Ice Admiral"] = true, ["Tide Keeper"] = true, ["Don Swan"] = true }
    elseif v536 == 1 then
        v1982 = {
            ["The Gorilla King"] = true,
            Bobby = true,
            ["The Saw"] = true,
            Yeti = true,
            ["Mob Leader"] = true,
            ["Vice Admiral"] = true,
            Warden = true,
            ["Chief Warden"] = true,
            Swan = true,
            ["Magma Admiral"] = true,
            ["Fishman Lord"] = true,
            Wysper = true,
            ["Thunder God"] = true,
            Cyborg = true,
            ["Saber Expert"] = true
        }
    end
    local v1983
    for v1984, v1985 in ipairs(BossesOrder) do
        if v1985 == "Deandre" or v1985 == "Urban" or v1985 == "Diablo" then
            continue
        end
        if v1982 and not v1982[v1985] then
            continue
        end
        local v1986 = BossesOrderLevel[v1985]
        if ScriptStorage.PlayerData.Level >= v1986 then
            local v1987 = ScriptStorage.Enemies[v1985]
            if not v1987 and CombatController and CombatController.FindEnemyByName then
                v1987 = CombatController.FindEnemyByName(v1985)
            end
            if v1987 and v1987:IsDescendantOf(workspace) and v1987:FindFirstChildOfClass("Humanoid") and (v1987.Humanoid.Health > 0) and v1987:FindFirstChild("HumanoidRootPart") and (v1987.HumanoidRootPart.Position.Magnitude > 100) and (v1987.HumanoidRootPart.Position.Y > -3500) then
                v1983 = v1987
            end
        end
    end
    if v1983 and v1983:FindFirstChild("HumanoidRootPart") and (CaculateDistance(v1983.HumanoidRootPart.CFrame) < (v536 == 2 and 3000 or 5000) or (BossesOrderWL[tostring(v1983)] and (ScriptStorage.PlayerData.Level < MaxLevel))) then
        return v1983
    end
end)
FunctionsHandler.BossesTask:RegisterMethod("Start", function(p1988)
    if p1988 then
        SetTask("MainTask", "Auto Farm Boss | Defeating " .. p1988.Name)
        CombatController.Attack(p1988, null, null, function()
            SpecialItems = nil
        end)
        SpecialItems = nil
    end
end)
FunctionsHandler.SpecialBossesTask:RegisterMethod("Refresh", function()
    if FunctionsHandler.RaidController and FunctionsHandler.RaidController.Methods.GetCurrentRaidIsland and FunctionsHandler.RaidController.Methods.GetCurrentRaidIsland:Call() or (IsInRaid and IsInRaid()) then
        return false
    end
    local v1989
    for v1990, v1991 in SpecialBossesOrder do
        if ScriptStorage.PlayerData.Level >= v1991 then
            local v1992 = ScriptStorage.Enemies[v1990]
            if v1992 and v1992:FindFirstChildOfClass("Humanoid") and (v1992.Humanoid.Health > 0) then
                v1989 = v1992
            end
        end
    end
    return v1989
end)
FunctionsHandler.SpecialBossesTask:RegisterMethod("Start", function(p1993)
    if FunctionsHandler.RaidController and FunctionsHandler.RaidController.Methods.GetCurrentRaidIsland and FunctionsHandler.RaidController.Methods.GetCurrentRaidIsland:Call() or (IsInRaid and IsInRaid()) then
        return
    end
    if p1993 then
        SetTask("MainTask", "Auto Farm Boss | Defeating " .. p1993.Name)
        CombatController.Attack(tostring(p1993))
    end
end)
NoRaidFruits = {
    ["Quake-Quake"] = true,
    ["Buddha-Buddha"] = true,
    ["Love-Love"] = true,
    ["Spider-Spider"] = true,
    ["Sound-Sound"] = false,
    ["Phoenix-Phoenix"] = true,
    ["Portal-Portal"] = true,
    ["Lightning-Lightning"] = true,
    ["Pain-Pain"] = true,
    ["Blizzard-Blizzard"] = true,
    ["Gravity-Gravity"] = true,
    ["Mammoth-Mammoth"] = true,
    ["T-Rex-T-Rex"] = true,
    ["Gas-Gas"] = true,
    ["Yeti-Yeti"] = true,
    ["Tiger-Tiger"] = true,
    ["Dough-Dough"] = true,
    ["Shadow-Shadow"] = true,
    ["Venom-Venom"] = true,
    ["Control-Control"] = true,
    ["Spirit-Spirit"] = true,
    ["Dragon-Dragon"] = true,
    ["Magnet-Magnet"] = true,
    ["Kitsune-Kitsune"] = true,
    ["Creation-Creation"] = true
}
FunctionsHandler.RaidController:RegisterMethod("GetRaidableFruit", function()
    for v1994, v1995 in pairs(v406()) do
        local v1996, v1997 = string.match(tostring(v1995.Name), "^(.-)%-(.+)$")
        if v1996 and (v1996 == v1997) and not NoRaidFruits[v1995.Name] and not IsFruitReserved(v1995.Name) then
            return { Name = v1995.Name, Count = v1995.Count, ItemId = v1995.ItemId }
        end
    end
end)
KaitunRaidTimerActive = function()
    local v1998 = game.Players.LocalPlayer
    local v1999 = v1998 and v1998:FindFirstChild("PlayerGui")
    if not v1999 then
        return false
    end
    local v2000 = getgenv()
    local v2001 = v2000.__KaitunRaidTimerIndex
    if not v2001 or v2001.Gui ~= v1999 then
        if v2001 then
            for v2002, v2003 in ipairs(v2001.Connections) do
                v2003:Disconnect()
            end
        end
        v2001 = {
            Gui = v1999,
            Labels = setmetatable({}, { __mode = "k" }),
            Connections = {},
            nextAt = 0,
            active = false
        }
        v2000.__KaitunRaidTimerIndex = v2001
        local function v2004(p2005)
            if p2005:IsA("TextLabel") then
                v2001.Labels[p2005] = true
            end
        end
        v2001.Connections[1] = v1999.DescendantAdded:Connect(v2004)
        v2001.Connections[2] = v1999.DescendantRemoving:Connect(function(p2006)
            v2001.Labels[p2006] = nil
        end)
        for v2007, v2008 in ipairs(v1999:GetDescendants()) do
            v2004(v2008)
        end
    end
    if os.clock() < v2001.nextAt then
        return v2001.active
    end
    v2001.nextAt = os.clock() + 0.25
    v2001.active = false
    for v2009 in pairs(v2001.Labels) do
        if v2009.Parent and v2009.Visible then
            local v2010 = v2009.Text:gsub("<[^>]+>", "")
            local v2011 = v2010:find("Time Left", 1, true) ~= nil
            local v2012, v2013, v2014 = true, v2009, false
            while v2013 and (v2013 ~= v1999) do
                if v2013.Name == "Timer" or v2013.Name == "RaidTimer" then
                    v2014 = true
                end
                if v2013:IsA("GuiObject") and not v2013.Visible then
                    v2012 = false
                    break
                end
                if v2013:IsA("ScreenGui") and not v2013.Enabled then
                    v2012 = false
                    break
                end
                v2013 = v2013.Parent
            end
            if v2012 and (v2011 or (v2014 and v2010:match("%d+:%d%d"))) then
                v2001.active = true
                break
            end
        end
    end
    return v2001.active
end
IsInRaid = function()
    local v2015 = KaitunRaidTimerActive()
    if not v2015 and CombatController and CombatController.RaidIsland then
        CombatController.RaidIsland = nil
        CombatController.RaidCenter = nil
        CombatController.RaidMaxIsland = nil
        CombatController.RaidCommitAt = nil
        CombatController.RaidSawMobs = nil
        CombatController.RaidNilSince = nil
        CombatController._fixedAnchorPos = nil
        TweenController.StopMovement()
    end
    return v2015
end
getgenv().IsInRaid = IsInRaid
FunctionsHandler.RaidController:RegisterMethod("GetCurrentRaidIsland", function()
    if not IsInRaid() then
        return nil
    end
    local v2016 = LocalPlayer.Character
    local v2017 = v2016 and v2016:FindFirstChild("HumanoidRootPart")
    if not v2017 then
        return nil
    end
    local v2018 = workspace:FindFirstChild("_WorldOrigin")
    local v2019 = v2018 and v2018:FindFirstChild("Locations")
    local v2020, v2021 = nil, 3500
    if v2019 then
        for v2022, v2023 in ipairs(v2019:GetChildren()) do
            if v2023:IsA("BasePart") and v2023.Name:match("^Island [1-5]$") then
                local v2024 = (v2017.Position - v2023.Position).Magnitude
                if v2024 < v2021 then
                    v2020, v2021 = v2023, v2024
                end
            end
        end
    end
    return v2020
end)
CheckSpecialMicrochip = function()
    return ScriptStorage.Tools["Special Microchip"]
end
FunctionsHandler.RaidController:RegisterMethod("RefreshRaidType", function()
    FunctionsHandler.RaidController:Set("CurrentChip", "Ice")
end)
CombatController.GetRaidMobNames = CombatController.GetRaidMobNames or function()
    local v2025, v2026 = {}, {}
    local v2027 = CombatController.RaidCenter and CombatController.RaidCenter.Position
    local v2028 = game.Players.LocalPlayer
    local v2029 = v2028 and v2028.Character and v2028.Character:FindFirstChild("HumanoidRootPart") and v2028.Character.HumanoidRootPart.Position or nil
    for v2030, v2031 in ipairs(workspace.Enemies:GetChildren()) do
        if v2031:IsA("Model") then
            local v2032 = v2031:FindFirstChildOfClass("Humanoid")
            local v2033 = v2031:FindFirstChild("HumanoidRootPart")
            if v2032 and v2033 and (v2032.Health > 0) then
                local v2034 = v2027 and ((v2033.Position - v2027).Magnitude <= 800) or (not v2027 and v2029 and ((v2033.Position - v2029).Magnitude <= 600))
                if v2034 then
                    if not v2025[v2031.Name] then
                        v2025[v2031.Name] = true
                        table.insert(v2026, v2031.Name)
                    end
                end
            end
        end
    end
    table.sort(v2026)
    return v2026
end
local function v2035(p2036)
    return p2036 and tonumber(string.match(tostring(p2036.Name), "Island (%d+)")) or nil
end
local function v2037(p2038)
    local v2051, v2052 = pcall(function()
        local v2039 = CombatController.RaidMaxIsland or 0
        if not CombatController.RaidSawMobs and (os.time() - (CombatController.RaidCommitAt or 0) < 2) then
            return nil
        end
        local v2040 = workspace:FindFirstChild("_WorldOrigin")
        local v2041 = v2040 and v2040:FindFirstChild("Locations")
        if not v2041 then
            return nil
        end
        local v2042 = v2039 + 1
        local v2043, v2044 = nil, 3500
        for v2045, v2046 in ipairs(v2041:GetChildren()) do
            local v2047, v2048 = pcall(function()
                return v2046.Position
            end)
            if v2047 and v2048 and (v2035(v2046) == v2042) and ((v2048 - Vector3.new(0, 0, 0)).Magnitude > 7000) then
                local v2049 = CombatController.RaidCenter
                local v2050 = v2049 and (v2048 - v2049.Position).Magnitude or math.huge
                if v2046 ~= p2038 and (v2050 < v2044) then
                    v2043, v2044 = v2046, v2050
                end
            end
        end
        return v2043
    end)
    if not v2051 then
        warn("[Raid] FindRaidIslandWithMobs loi: " .. tostring(v2052))
        return nil
    end
    return v2052
end
local function v2053(p2054)
    if Config and Config.Fragments and (Config.Fragments.Enable or Config.Fragments.Max) then
        local v2055 = tonumber(Config.Fragments.Max) or 5000
        if p2054 < v2055 then
            return true
        end
    end
    local v2056 = ScriptStorage.Tools.Godhuman or (ScriptStorage.Melees and ((ScriptStorage.Melees.Godhuman or 0) > 0))
    if v2056 and ((ScriptStorage.PlayerData and ScriptStorage.PlayerData.Level or 0) < MaxLevel) then
        return false
    end
    if Config and Config.Items and Config.Items.GodHuman and not (ScriptStorage.Melees and ScriptStorage.Melees.Godhuman) then
        return p2054 < 5000
    end
    if Config and Config.Items and Config.Items.MM and ScriptStorage.Melees and ScriptStorage.Melees.Godhuman and Config.Fragments and Config.Fragments.Max and (p2054 < Config.Fragments.Max) then
        return true
    end
    local v2057 = tonumber(getgenv().KaitunNeedFragAmount) or 0
    if v2057 > 0 and (p2054 < v2057) then
        return true
    end
    return false
end
FunctionsHandler.RaidController:RegisterMethod("NeedsFragFarm", function()
    local v2058 = ScriptStorage.PlayerData.Fragments or 0
    return v2053(v2058)
end)
FunctionsHandler.RaidController:RegisterMethod("Refresh", function()
    if IsInRaid() then
        local v2059 = FunctionsHandler.RaidController.Methods.GetCurrentRaidIsland:Call()
        return v2059 or true
    end
    local v2060 = game.Players.LocalPlayer
    local v2061 = v2060 and v2060:FindFirstChild("Data")
    local v2062 = v2061 and v2061:FindFirstChild("Level") and v2061.Level.Value or (ScriptStorage.PlayerData and ScriptStorage.PlayerData.Level) or 0
    local v2063 = v2061 and v2061:FindFirstChild("Fragments") and v2061.Fragments.Value or (ScriptStorage.PlayerData and ScriptStorage.PlayerData.Fragments) or 0
    if v2062 == 0 then
        return false
    end
    if v2062 < 1300 or v536 == 1 then
        return false
    end
    local v2064 = FunctionsHandler.RaidController.Methods.GetCurrentRaidIsland:Call()
    if v2064 then
        return v2064
    end
    local v2065 = 2000
    if Config and Config.Fragments and (Config.Fragments.Enable or Config.Fragments.Max) then
        v2065 = tonumber(Config.Fragments.Max) or 5000
    end
    if v2062 < 1500 and (v2063 >= v2065) then
        return false
    end
    if v2062 < MaxLevel then
        if not v2053(v2063) then
            return false
        end
    elseif v2062 == MaxLevel then
        if not v2053(v2063) then
            return false
        end
        if Config and Config.Items and Config.Items.MM then
            if not ScriptStorage.Backpack["Valkyrie Helm"] then
                return false
            end
            if not ScriptStorage.Backpack["Mirror Fractal"] then
                return false
            end
        end
    end
    local v2066 = FunctionsHandler.RaidController.Methods.GetRaidableFruit:Call()
    if v2066 then
        FunctionsHandler.RaidController:Set("CurrentProgressLevel", v2066)
    end
    local v2067 = CheckSpecialMicrochip() or v2060.Backpack:FindFirstChild("Special Microchip") ~= nil or (v2060.Character and (v2060.Character:FindFirstChild("Special Microchip") ~= nil))
    local v2068 = v2061 and v2061:FindFirstChild("Beli") and v2061.Beli.Value or (ScriptStorage.PlayerData and ScriptStorage.PlayerData.Beli) or 0
    local v2069 = _G.BeliChipCooldown and (os.time() < _G.BeliChipCooldown)
    local v2070 = not v2069 and (v2068 >= 100000)
    if not v2067 and not v2066 and not v2070 then
        return false
    end
    return v2066 or v2067 or v2070
end)
FunctionsHandler.RaidController:RegisterMethod("Start", function()
    if not FunctionsHandler.RaidController:Get("CurrentChip") then
        FunctionsHandler.RaidController.Methods.RefreshRaidType:Call()
    end
    local v2071 = FunctionsHandler.RaidController.Methods.GetCurrentRaidIsland:Call()
    RefreshInventory()
    FunctionsHandler.RaidController:Set("CurrentProgressLevel", nil)
    if IsInRaid() and not v2071 then
        SetTask("MainTask", "Auto Raid - Waiting for current raid islands")
        return
    end
    if not IsInRaid() then
        if CombatController.RaidIsland then
            TweenController.StopMovement()
        end
        CombatController.RaidIsland = nil
        CombatController.RaidCenter = nil
        CombatController.RaidMaxIsland = nil
        CombatController.RaidCommitAt = nil
        CombatController.RaidSawMobs = nil
        CombatController.RaidNilSince = nil
        CombatController._fixedAnchorPos = nil
        SetTask("MainTask", "Auto Raid - Buying Chip - " .. tostring(FunctionsHandler.RaidController:Get("CurrentChip")))
        local v2072 = ScriptStorage.Tools["Special Microchip"] or LocalPlayer.Backpack:FindFirstChild("Special Microchip") ~= nil or (LocalPlayer.Character and (LocalPlayer.Character:FindFirstChild("Special Microchip") ~= nil))
        if not v2072 then
            local v2073 = FunctionsHandler.RaidController.Methods.GetRaidableFruit:Call()
            if not v2073 then
                local v2074 = game.Players.LocalPlayer
                local v2075 = v2074 and v2074:FindFirstChild("Data")
                local v2076 = v2075 and v2075:FindFirstChild("Beli") and v2075.Beli.Value or (ScriptStorage.PlayerData and ScriptStorage.PlayerData.Beli) or 0
                local v2077 = _G.BeliChipCooldown and (os.time() < _G.BeliChipCooldown)
                if v2076 >= 100000 and not v2077 then
                    pcall(function()
                        Remotes.CommF_.InvokeServer(Remotes.CommF_, "RaidsNpc", "Select", FunctionsHandler.RaidController:Get("CurrentChip") or "Flame")
                    end)
                    task.wait(1)
                    RefreshInventory()
                end
                local v2078 = ScriptStorage.Tools["Special Microchip"] or LocalPlayer.Backpack:FindFirstChild("Special Microchip") ~= nil or (LocalPlayer.Character and (LocalPlayer.Character:FindFirstChild("Special Microchip") ~= nil))
                if not v2078 then
                    _G.BeliChipCooldown = os.time() + 180
                    warn("[RaidController] Khong co trai va khong the mua chip bang Beli -> Chuyen quyen sang LevelFarm")
                    return
                end
            else
                ReserveFruit(v2073.Name, 30)
                pcall(function()
                    Remotes.CommF_:InvokeServer("LoadFruit", v2073.Name)
                    if not EquipFruitById(v2073.Name, 5) then
                        return
                    end
                    Remotes.CommF_:InvokeServer("RaidsNpc", "Select", FunctionsHandler.RaidController:Get("CurrentChip"))
                    task.wait(2)
                end)
                ReleaseFruit(v2073.Name)
                RefreshInventory()
            end
        end
        local v2079 = ({ nil, "CircleIsland", "Boat Castle" })[v536]
        local v2080 = workspace.Map:FindFirstChild(v2079)
        if not v2080 then
            task.wait(1)
            return
        end
        if not v2080:FindFirstChild("RaidSummon2") then
            task.wait(1)
            TweenController.Create(v2080:GetModelCFrame() or v2080.CFrame)
        end
        FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Special Microchip")
        task.spawn(function()
            if v536 == 2 then
                raidButton = game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main
            elseif v536 == 3 then
                raidButton = game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main
            end
            local v2081 = raidButton and raidButton:FindFirstChild("ClickDetector")
            if not v2081 then
                return
            end
            local v2082 = v2081.MaxActivationDistance
            v2081.MaxActivationDistance = math.huge
            fireclickdetector(v2081)
            task.wait(0.1)
            v2081.MaxActivationDistance = v2082
        end)
        local v2083 = os.clock()
        SetTask("MainTask", "Auto Raid - Waiting Until Raid Is Started")
        TweenController.StopMovement()
        repeat
            task.wait(0.25)
        until KaitunRaidTimerActive() or os.clock() - v2083 > 30
        if not KaitunRaidTimerActive() then
            SetTask("MainTask", "Auto Raid - Start timed out; waiting at summon")
        end
        LastRaidAlert = 0
        LastRaidAlert2 = 0
    else
        CombatController.RaidNilSince = nil
        SetTask("MainTask", "Auto Raid | " .. v2071.Name .. " /5")
        local v2084 = CFrame.new(v2071.Position)
        local v2085 = nil
        pcall(function()
            local v2086 = game.Players.LocalPlayer
            local v2087 = v2086 and v2086.Character and v2086.Character:FindFirstChild("HumanoidRootPart")
            if v2087 then
                v2085 = v2087.Position
            end
        end)
        local v2088 = CombatController.RaidIsland
        local v2089 = v2088 and v2088.Parent and CombatController.RaidCenter
        local v2090 = v2089 and v2085 and ((v2085 - CombatController.RaidCenter.Position).Magnitude <= 300)
        if not v2089 then
            CombatController.RaidCenter = v2084
            CombatController.RaidIsland = v2071
            CombatController.RaidMaxIsland = v2035(v2071) or 0
            CombatController.RaidCommitAt = os.time()
            CombatController.RaidSawMobs = false
        elseif not v2090 then
            TweenController.Create(CombatController.RaidCenter + Vector3.new(0, 30, 0))
        end
        if v2090 or not v2089 then
            local v2091 = CombatController.GetRaidMobNames and CombatController.GetRaidMobNames() or {}
            if #v2091 > 0 then
                getgenv().KaitunRaidDbgAt = getgenv().KaitunRaidDbgAt or 0
                if os.clock() - getgenv().KaitunRaidDbgAt > 10 then
                    getgenv().KaitunRaidDbgAt = os.clock()
                    warn("[Raid] island=" .. tostring(v2071 and v2071.Name) .. " mobs=" .. tostring(#v2091) .. " (" .. table.concat(v2091, ",") .. ")")
                end
                CombatController.RaidSawMobs = true
                CombatController._fixedAnchorPos = CombatController.RaidCenter and CombatController.RaidCenter.Position or v2084.Position
                CombatController.Attack(v2091)
            else
                local v2092 = v2037(v2071)
                getgenv().KaitunRaidDbgAt = getgenv().KaitunRaidDbgAt or 0
                if os.clock() - getgenv().KaitunRaidDbgAt > 10 then
                    getgenv().KaitunRaidDbgAt = os.clock()
                    warn("[Raid] island=" .. tostring(v2071 and v2071.Name) .. " mobs=0 next=" .. tostring(v2092 and v2092.Name))
                end
                if v2092 then
                    SetTask("MainTask", "Auto Raid | Sang dao moi: " .. v2092.Name)
                    CombatController.RaidCenter = CFrame.new(v2092.Position)
                    CombatController.RaidIsland = v2092
                    CombatController.RaidMaxIsland = math.max(CombatController.RaidMaxIsland or 0, v2035(v2092) or 0)
                    CombatController.RaidCommitAt = os.time()
                    CombatController.RaidSawMobs = false
                    TweenController.Create(CFrame.new(v2092.Position) + Vector3.new(0, 30, 0))
                else
                    TweenController.Create((CombatController.RaidCenter or v2084) + Vector3.new(0, 30, 0))
                end
            end
        end
    end
end)
FunctionsHandler.UtillyItemsActivitation:RegisterMethod("Refresh", function()
    local v2093 = false
    if v536 == 3 then
        local v2094 = LocalPlayer:FindFirstChild("Data") and LocalPlayer.Data:FindFirstChild("Beli") and LocalPlayer.Data.Beli.Value or ScriptStorage.PlayerData.Beli or 0
        local v2095 = LocalPlayer:FindFirstChild("Data") and LocalPlayer.Data:FindFirstChild("Fragments") and LocalPlayer.Data.Fragments.Value or ScriptStorage.PlayerData.Fragments or 0
        local v2096 = GetTrueMastery and GetTrueMastery("Electro") or ScriptStorage.Melees.Electro or ScriptStorage.Melees.Electric or 0
        local v2097 = ScriptStorage.Tools["Electric Claw"] or (ScriptStorage.Melees["Electric Claw"] or 0) > 0
        if v2096 >= 400 and (v2094 >= 3000000) and (v2095 >= 5000) and not v2097 then
            v2093 = true
        end
    end
    if not v2093 and (os.time() - timeee < 5) then
        return
    end
    if Upv3 or Upv2 then
        return
    end
    if not SpecialItems then
        SpecialItems = {}
        local v2098 = {}
        IceAdmiralPassed = true
        if not ScriptStorage.Backpack.Rengoku then
            table.insert(SpecialItems, "Hidden Key")
            IceAdmiralPassed = false
        end
        print(3)
        if v536 == 2 and Services.Workspace.Map.IceCastle.Hall.LibraryDoor:FindFirstChild("PhoeyuDoor") then
            table.insert(SpecialItems, "Library Key")
            IceAdmiralPassed = false
        end
        print(4)
        if IceAdmiralPassed then
            table.insert(v2098, "Awakened Ice Admiral")
        end
        print(5)
        local v2099 = nil
        if v536 == 2 and not ScriptStorage.Melees["Sharkman Karate"] then
            pcall(function()
                v2099 = Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
            end)
        end
        print(6)
        SharkmanPassed = typeof(v2099) == "string"
        if typeof(v2099) == "string" then
            table.insert(SpecialItems, "Water Key")
        else
            TidePassed = true
            table.insert(v2098, "Tide Keeper")
        end
        print(7)
        if not ScriptStorage.Backpack.Yama then
            print("Elite")
            table.insert(v2098, "Deandre")
            table.insert(v2098, "Urban")
            table.insert(v2098, "Diablo")
        end
        print(8)
        local function v2100()
            local v2101 = {}
            for v2102, v2103 in BossesOrder do
                local v2104 = true
                for v2105, v2106 in v2098 do
                    if v2106 == v2103 then
                        v2104 = false
                    end
                end
                if v2104 then
                    table.insert(v2101, v2103)
                end
            end
            local v2107 = #v2101
            for v2108 = 1, v2107 - 1 do
                for v2109 = 1, v2107 - v2108 do
                    local v2110 = key and tostring(v2101[v2109][key]):lower() or tostring(v2101[v2109]):lower()
                    local v2111 = key and tostring(v2101[v2109 + 1][key]):lower() or tostring(v2101[v2109 + 1]):lower()
                    if v2110 > v2111 then
                        v2101[v2109], v2101[v2109 + 1] = v2101[v2109 + 1], v2101[v2109]
                    end
                end
            end
            return v2101
        end
        print(9)
        BossesOrder = v2100()
        if v536 == 2 and FunctionsHandler.Trevor and FunctionsHandler.Trevor.Get and FunctionsHandler.Trevor:Get("IsCompleted") and not Storage:Get("SwanDefeated") then
            print("Added Don Swan to boss orser list")
            BossesOrderLevel["Don Swan"] = 1100
            print(ScriptStorage.PlayerData.Level, ScriptStorage.Enemies["Don Swan"])
        end
    end
    for v2112, v2113 in SpecialItems do
        if ScriptStorage.Tools[v2113] then
            FunctionsHandler.UtillyItemsActivitation:Set("CurrentProgressLevel", v2113)
            return v2113
        end
    end
    local v2114 = LocalPlayer:FindFirstChild("Data") and LocalPlayer.Data:FindFirstChild("Beli") and LocalPlayer.Data.Beli.Value or ScriptStorage.PlayerData.Beli or 0
    local v2115 = LocalPlayer:FindFirstChild("Data") and LocalPlayer.Data:FindFirstChild("Fragments") and LocalPlayer.Data.Fragments.Value or ScriptStorage.PlayerData.Fragments or 0
    if not ScriptStorage.Melees.Electro or ScriptStorage.Melees.Electro < 400 then
        pcall(SyncMeleeMasteryFromInventory)
    end
    local v2116 = GetTrueMastery and GetTrueMastery("Electro") or ScriptStorage.Melees.Electro or ScriptStorage.Melees.Electric or 0
    if v2116 < 400 and GetServerMasteryByName then
        local v2117 = GetServerMasteryByName("Electro") or 0
        if v2117 > v2116 then
            v2116 = v2117
            ScriptStorage.Melees.Electro = v2117
        end
    end
    local v2118 = ScriptStorage.Tools["Electric Claw"] or (ScriptStorage.Melees["Electric Claw"] or 0) > 0
    if not v2118 and GetServerMasteryByName then
        local v2119 = GetServerMasteryByName("Electric Claw")
        if v2119 and (v2119 > 0) then
            ScriptStorage.Melees["Electric Claw"] = v2119
            v2118 = true
        end
    end
    if v536 == 3 and (v2116 >= 400) and (v2114 >= 3000000) and (v2115 >= 5000) and not v2118 then
        FunctionsHandler.UtillyItemsActivitation:Set("CurrentProgressLevel", "Previous Hero")
        return "Previous Hero"
    end
    if ScriptStorage.Tools["Red Key"] then
        FunctionsHandler.UtillyItemsActivitation:Set("CurrentProgressLevel", "Red Key")
        return "Red Key"
    end
    if ScriptStorage.Tools["Hallow Essence"] then
        FunctionsHandler.UtillyItemsActivitation:Set("CurrentProgressLevel", "Soul Reaper Spawner")
        FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Hallow Essence")
        return "Soul Reaper Spawner"
    end
    if ScriptStorage.Tools["Fire Essence"] then
        FunctionsHandler.UtillyItemsActivitation:Set("CurrentProgressLevel", "Uzoth")
        return "Uzoth"
    end
end)
FunctionsHandler.UtillyItemsActivitation:RegisterMethod("Start", function(p2120)
    local v2121 = p2120 or FunctionsHandler.UtillyItemsActivitation:Get("CurrentProgressLevel")
    if not v2121 then
        return
    end
    FunctionsHandler.UtillyItemsActivitation:Set("CurrentProgressLevel", v2121)
    if v2121 == "Hidden Key" then
        Remotes.CommF_:InvokeServer("OpenRengoku")
    elseif v2121 == "Water Key" then
        _G.ActiveMeleeQuest = "Sharkman Karate"
        if CombatController and CombatController.StopCombat then
            CombatController.StopCombat()
        end
        pcall(function()
            if v842 and v842.AbandonQuest then
                v842.AbandonQuest()
            end
            Remotes.CommF_:InvokeServer("AbandonQuest")
        end)
        SetTask("MainTask", "Sharkman Karate | Submitting Water Key")
        FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Water Key")
        Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
        Remotes.CommF_:InvokeServer("BuySharkmanKarate")
        task.wait(0.8)
        RefreshInventory()
        _G.ActiveMeleeQuest = nil
    elseif v2121 == "Library Key" then
        _G.ActiveMeleeQuest = "Death Step"
        if CombatController and CombatController.StopCombat then
            CombatController.StopCombat()
        end
        pcall(function()
            if v842 and v842.AbandonQuest then
                v842.AbandonQuest()
            end
            Remotes.CommF_:InvokeServer("AbandonQuest")
        end)
        SetTask("MainTask", "Death Step | Unlocking Library Door")
        Remotes.CommF_:InvokeServer("OpenLibrary")
        pcall(function()
            if Services.Workspace.Map:FindFirstChild("IceCastle") and Services.Workspace.Map.IceCastle:FindFirstChild("Hall") and Services.Workspace.Map.IceCastle.Hall:FindFirstChild("LibraryDoor") and Services.Workspace.Map.IceCastle.Hall.LibraryDoor:FindFirstChild("PhoeyuDoor") then
                Services.Workspace.Map.IceCastle.Hall.LibraryDoor.PhoeyuDoor:Destroy()
            end
        end)
        task.wait(0.5)
        _G.ActiveMeleeQuest = nil
    elseif v2121 == "Red Key" then
        alert("Red Key", "Submitting red key to the scienctist.")
        Remotes.CommF_:InvokeServer("CakeScientist", "Check")
        ScriptStorage.Tools["Red Key"]:Destroy()
    elseif v2121 == "Previous Hero" then
        _G.ActiveMeleeQuest = "Electric Claw"
        if CombatController and CombatController.StopCombat then
            CombatController.StopCombat()
        end
        pcall(function()
            if v842 and v842.AbandonQuest then
                v842.AbandonQuest()
            end
            Remotes.CommF_:InvokeServer("AbandonQuest")
        end)
        SetTask("MainTask", "Electric Claw Quest | Running to Previous Hero")
        local v2122 = workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild("Previous Hero")
        local v2123 = v2122 and GetNPCPosition(v2122) or CFrame.new(-10375.4, 331.7, -10134.4)
        local v2124 = CaculateDistance(v2123)
        local v2125 = tick() + math.max(60, v2124 / 180)
        while CaculateDistance(v2123) > 25 and (tick() < v2125) do
            if _G.Stop then
                _G.ActiveMeleeQuest = nil
                return
            end
            TweenController.Create(v2123)
            task.wait(0.2)
        end
        if CaculateDistance(v2123) > 25 then
            _G.ActiveMeleeQuest = nil
            return
        end
        SetTask("MainTask", "Electric Claw | Mua võ...")
        pcall(function()
            Remotes.CommF_:InvokeServer("BuyElectricClaw")
        end)
        task.wait(0.5)
        RefreshInventory()
        if ScriptStorage.Tools["Electric Claw"] or (ScriptStorage.Melees["Electric Claw"] or 0) > 0 then
            FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Electric Claw")
            FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Melee")
            _G.ActiveMeleeQuest = nil
            return
        end
        local v2126 = nil
        pcall(function()
            v2126 = Remotes.CommF_:InvokeServer("BuyElectricClaw", true)
        end)
        print("[Electric Claw] Buy check status:", v2126)
        if v2126 == 1 or v2126 == 2 or v2126 == 3 or v2126 == 0 then
            pcall(function()
                Remotes.CommF_:InvokeServer("BuyElectricClaw")
            end)
            task.wait(0.5)
            RefreshInventory()
            if ScriptStorage.Tools["Electric Claw"] or (ScriptStorage.Melees["Electric Claw"] or 0) > 0 then
                FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Electric Claw")
                FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Melee")
            end
            _G.ActiveMeleeQuest = nil
            return
        end
        SetTask("MainTask", "Electric Claw Quest | Bắt đầu chạy 30s tới Mansion")
        Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start")
        task.wait(0.4)
        SetTask("MainTask", "Electric Claw Quest | Running to Mansion")
        local v2127 = CFrame.new(-12463.874, 374.914, -7523.773)
        local v2128 = CFrame.new(-12548, 332.378, -7617)
        local v2129 = tick()
        while CaculateDistance(v2128) > 25 and (tick() - v2129 < 26) do
            if _G.Stop then
                _G.ActiveMeleeQuest = nil
                return
            end
            TweenController.Create(v2128)
            task.wait(0.1)
        end
        pcall(function()
            TweenController.Create(v2127)
        end)
        task.wait(0.8)
        SetTask("MainTask", "Electric Claw Quest | Returning to Previous Hero")
        local v2130 = tick() + 60
        while CaculateDistance(v2123) > 25 and (tick() < v2130) do
            if _G.Stop then
                _G.ActiveMeleeQuest = nil
                return
            end
            TweenController.Create(v2123)
            task.wait(0.2)
        end
        SetTask("MainTask", "Electric Claw Quest | Purchasing Electric Claw")
        pcall(function()
            Remotes.CommF_:InvokeServer("BuyElectricClaw")
        end)
        task.wait(1)
        RefreshInventory()
        if ScriptStorage.Tools["Electric Claw"] or (ScriptStorage.Melees["Electric Claw"] or 0) > 0 then
            FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Electric Claw")
            FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Melee")
        end
        _G.ActiveMeleeQuest = nil
    elseif v2121 == "Uzoth" then
        _G.ActiveMeleeQuest = "Dragon Talon"
        if CombatController and CombatController.StopCombat then
            CombatController.StopCombat()
        end
        pcall(function()
            if v842 and v842.AbandonQuest then
                v842.AbandonQuest()
            end
            Remotes.CommF_:InvokeServer("AbandonQuest")
        end)
        SetTask("MainTask", "Dragon Talon | Submitting Fire Essence")
        print("Use Fire Essence")
        Remotes.CommF_:InvokeServer("BuyDragonTalon", true)
        Remotes.CommF_:InvokeServer("BuyDragonTalon")
        IsFireEssenceGave = true
        Report("Fire Essence Used")
        task.wait(0.8)
        RefreshInventory()
        _G.ActiveMeleeQuest = nil
    elseif v2121 == "Soul Reaper Spawner" then
        print("Use Hallow Essence")
        FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Hallow Essence")
        if CaculateDistance(workspace.Map["Haunted Castle"].Summoner.Detection.CFrame) < 100 then
            SpecialItems = nil
        end
        TweenController.Create(workspace.Map["Haunted Castle"].Summoner.Detection.CFrame)
    end
end)
local v2131 = {
    "Quake-Quake",
    "Buddha-Buddha",
    "Love-Love",
    "Spider-Spider",
    "Sound-Sound",
    "Phoenix-Phoenix",
    "Portal-Portal",
    "Rumble-Rumble",
    "Pain-Pain",
    "Blizzard-Blizzard",
    "Lightning-Lightning",
    "Lighting-Lightning",
    "Magnet-Magnet"
}
local v2132 = {
    "Gravity-Gravity",
    "Mammoth-Mammoth",
    "T-Rex-T-Rex",
    "Gas-Gas",
    "Yeti-Yeti",
    "Tiger-Tiger",
    "Dough-Dough",
    "Shadow-Shadow",
    "Venom-Venom",
    "Control-Control",
    "Spirit-Spirit",
    "Dragon-Dragon",
    "Leopard-Leopard",
    "Kitsune-Kitsune",
    "Creation-Creation"
}
local v2133 = {}
for v2134, v2135 in pairs(v2131) do
    v2133[v2135] = "Legendary"
end
for v2136, v2137 in pairs(v2132) do
    v2133[v2137] = "Mythical"
end
local function v2138()
    local v2139 = {}
    local v2140 = v406()
    for v2141, v2142 in pairs(v2140) do
        if v2133[v2142.Name] and not IsFruitReserved(v2142.Name) then
            table.insert(v2139, { Name = v2142.Name, Rarity = v2133[v2142.Name], Count = v2142.Count, ItemId = v2142.ItemId })
        end
    end
    return v2139
end
local function v2143()
    local v2144 = LocalPlayer.Character
    local v2145 = LocalPlayer:FindFirstChild("Backpack")
    if v2144 then
        for v2146, v2147 in ipairs(v2144:GetChildren()) do
            if v2147:IsA("Tool") and string.find(v2147.Name, "Fruit") then
                return v2147, true
            end
        end
    end
    if v2145 then
        for v2148, v2149 in ipairs(v2145:GetChildren()) do
            if v2149:IsA("Tool") and string.find(v2149.Name, "Fruit") then
                return v2149, false
            end
        end
    end
    return nil
end
local function v2150(p2151)
    if not p2151 then
        return false
    end
    local v2152 = GetFruitId(p2151) or p2151.Name
    if v2133[v2152] then
        return true
    end
    for v2153, v2154 in ipairs(v2131) do
        local v2155 = v2154:gsub("%-.*", "")
        if p2151.Name:find(v2155, 1, true) or v2152:find(v2155, 1, true) then
            return true
        end
    end
    for v2156, v2157 in ipairs(v2132) do
        local v2158 = v2157:gsub("%-.*", "")
        if p2151.Name:find(v2158, 1, true) or v2152:find(v2158, 1, true) then
            return true
        end
    end
    return false
end
local function v2159()
    for v2160 in pairs(KaitunWorldIndex().Fruits) do
        local v2161 = v2160.Parent and v2160:FindFirstChild("Handle")
        if v2161 and v2160.Name:find("Fruit", 1, true) then
            local v2162 = false
            local v2163 = v2160.Parent
            while v2163 and (v2163 ~= workspace) do
                if game.Players:GetPlayerFromCharacter(v2163) or (v2163.Parent and (v2163.Parent.Name == "Enemies")) then
                    v2162 = true
                    break
                end
                v2163 = v2163.Parent
            end
            if v2163 == workspace and not v2162 then
                return v2160, v2161.CFrame
            end
        end
    end
end
local v2164 = 0
local function v2165()
    if tick() - v2164 < 8 then
        return false
    end
    v2164 = tick()
    if Hop and Hop.API then
        local v2166 = pcall(function()
            return Hop.API("fruit", 11, 10)
        end)
        if v2166 then
            return true
        end
    end
    local v2167 = syn and syn.request or request or (http and http.request) or http_request
    if v2167 then
        local v2168, v2169 = pcall(v2167, {
            Url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100",
            Method = "GET"
        })
        if v2168 and v2169 and (v2169.StatusCode == 200) then
            local v2170 = v426:JSONDecode(v2169.Body)
            if v2170 and v2170.data and (#v2170.data > 0) then
                local v2171 = {}
                for v2172, v2173 in ipairs(v2170.data) do
                    if v2173.playing and (v2173.playing > 0) and (v2173.playing < 11) and (v2173.id ~= game.JobId) then
                        table.insert(v2171, v2173)
                    end
                end
                if #v2171 > 0 then
                    local v2174 = v2171[math.random(1, #v2171)]
                    pcall(function()
                        game:GetService("ReplicatedStorage"):WaitForChild("__ServerBrowser"):InvokeServer("teleport", v2174.id)
                    end)
                    task.wait(2)
                    pcall(function()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v2174.id, LocalPlayer)
                    end)
                    return true
                end
            end
        end
    end
    if Hop and Hop.A then
        return Hop.A(10)
    end
    return false
end
local function v2175(p2176)
    if type(p2176) ~= "table" then
        return false
    end
    for v2177, v2178 in ipairs({ "FlamingoAccess", "FlamingoAcces" }) do
        local v2179 = p2176[v2178]
        if v2179 == true or v2179 == 1 or v2179 == "1" or v2179 == "true" then
            return true
        end
    end
    return false
end
FunctionsHandler.Trevor:RegisterMethod("GetFruit", function()
    local v2180 = v2138()
    if #v2180 == 0 then
        return
    end
    for v2181, v2182 in ipairs(v2180) do
        if v2182.Rarity == "Legendary" then
            return v2182
        end
    end
    return v2180[1]
end)
FunctionsHandler.Trevor:RegisterMethod("Refresh", function()
    if ScriptStorage.PlayerData.Level < 1100 or v536 ~= 2 then
        return
    end
    if FunctionsHandler.Trevor:Get("IsCompleted") then
        return
    end
    local v2183 = Remotes.CommF_:InvokeServer("TalkTrevor", "3")
    if tonumber(v2183) == 0 then
        FunctionsHandler.Trevor:Set("IsCompleted", true)
        return
    end
    local v2184, v2185 = pcall(function()
        return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables")
    end)
    if v2184 and (typeof(v2185) == "table") and v2175(v2185) then
        FunctionsHandler.Trevor:Set("IsCompleted", true)
        return
    end
    local v2186, v2187 = v2143()
    if v2186 and v2150(v2186) then
        return { Mode = "FeedHeld", Tool = v2186, InChar = v2187 }
    end
    local v2188 = FunctionsHandler.Trevor.Methods.GetFruit:Call()
    if v2188 then
        FunctionsHandler.Trevor:Set("Fruit", v2188)
        FunctionsHandler.Trevor:Set("IsCompleted", false)
        TrevorDebounce = os.time()
        return { Mode = "FeedStorage", Fruit = v2188 }
    end
    pcall(function()
        local v2189 = require(game.ReplicatedStorage.Controllers.GachaClient)
        local v2190 = v2189.CheckGachaAsync("ZiolesGacha", "Blox Fruit Gacha")
        if v2190 and v2190.RequirementsMet then
            local v2191, v2192 = v2189.PurchaseGachaAsync("ZiolesGacha")
            if v2191 then
                task.wait(1)
                local v2193 = v2143()
                if v2193 and not v2150(v2193) then
                    StoreLooseFruits()
                end
            end
        end
    end)
    v2186, v2187 = v2143()
    if v2186 and v2150(v2186) then
        return { Mode = "FeedHeld", Tool = v2186, InChar = v2187 }
    end
    v2188 = FunctionsHandler.Trevor.Methods.GetFruit:Call()
    if v2188 then
        return { Mode = "FeedStorage", Fruit = v2188 }
    end
    if ScriptStorage.PlayerData.Level >= 1500 then
        return { Mode = "FruitSniper" }
    end
    return nil
end)
FunctionsHandler.Trevor:RegisterMethod("Start", function(p2194)
    if type(p2194) == "table" and (p2194.Mode == "FeedHeld") then
        SetTask("MainTask", "Trevor | Feeding >= 1M Fruit: " .. tostring(p2194.Tool.Name))
        if not p2194.InChar and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character.Humanoid:EquipTool(p2194.Tool)
            task.wait(0.5)
        end
        Remotes.CommF_:InvokeServer("TalkTrevor", "1")
        Remotes.CommF_:InvokeServer("TalkTrevor", "2")
        local v2195 = Remotes.CommF_:InvokeServer("TalkTrevor", "3")
        task.wait(1)
        if tonumber(v2195) == 0 then
            FunctionsHandler.Trevor:Set("IsCompleted", true)
            alert("[ Trevor ]", "Da nap thanh cong trai cho Trevor! FlamingoAccess da mo!")
        end
        return
    elseif type(p2194) == "table" and (p2194.Mode == "FeedStorage") then
        local v2196 = p2194.Fruit
        alert("[ Trevor ]", "Dung trai tu kho: " .. v2196.Name .. " (" .. tostring(v2133[v2196.Name]) .. ")")
        FunctionsHandler.Trevor:Set("Fruit", nil)
        ReserveFruit(v2196.Name, 45)
        local v2197
        local v2198 = pcall(function()
            Remotes.CommF_:InvokeServer("LoadFruit", v2196.Name)
            if not EquipFruitById(v2196.Name, 6) then
                alert("[ Trevor ]", "Khong lay duoc " .. v2196.Name .. " ra kho, thu lai sau")
                return
            end
            Remotes.CommF_:InvokeServer("TalkTrevor", "1")
            Remotes.CommF_:InvokeServer("TalkTrevor", "2")
            v2197 = Remotes.CommF_:InvokeServer("TalkTrevor", "3")
            task.wait(1)
        end)
        ReleaseFruit(v2196.Name)
        if v2198 and (tonumber(v2197) == 0) then
            FunctionsHandler.Trevor:Set("IsCompleted", true)
            alert("[ Trevor ]", "Da nap thanh cong trai cho Trevor! FlamingoAccess da mo!")
        end
        RefreshInventory()
        return
    elseif type(p2194) == "table" and (p2194.Mode == "FruitSniper") then
        local v2199, v2200 = v2159()
        if v2199 and v2200 then
            SetTask("MainTask", "Fruit Sniper | Found " .. v2199.Name .. " | Flying to pick up...")
            TweenController.Create(v2200)
            if CaculateDistance(v2200) < 15 then
                task.wait(1)
                local v2201 = v2143()
                if v2201 then
                    if v2150(v2201) then
                        alert("[ Fruit Sniper ]", "Da nhat duoc trai >= 1M: " .. v2201.Name .. "! Dang nap Trevor...")
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                            LocalPlayer.Character.Humanoid:EquipTool(v2201)
                            task.wait(0.5)
                        end
                        Remotes.CommF_:InvokeServer("TalkTrevor", "1")
                        Remotes.CommF_:InvokeServer("TalkTrevor", "2")
                        local v2202 = Remotes.CommF_:InvokeServer("TalkTrevor", "3")
                        if tonumber(v2202) == 0 then
                            FunctionsHandler.Trevor:Set("IsCompleted", true)
                            alert("[ Trevor ]", "Da nap thanh cong trai cho Trevor! FlamingoAccess da mo!")
                        end
                    else
                        alert("[ Fruit Sniper ]", "Nhat duoc trai < 1M (" .. v2201.Name .. "), cat vao kho...")
                        StoreLooseFruits()
                        task.wait(1)
                    end
                end
            end
            return
        end
        SetTask("MainTask", "Fruit Sniper | Hopping to fruit server (Kurinian API)...")
        alert("[ Fruit Sniper ]", "Hop server tim trai (Kurinian API)...")
        v2165()
        task.wait(5)
        return
    end
end)
FunctionsHandler.ThirdSeaPuzzle:RegisterMethod("Refresh", function()
    if ScriptStorage.PlayerData.Level < 1500 or v536 ~= 2 then
        return nil
    end
    local v2203 = ScriptStorage.Backpack and ScriptStorage.Backpack["Warrior Helmet"] or (ScriptStorage.Tools and ScriptStorage.Tools["Warrior Helmet"]) or false
    if not v2203 and v406 then
        for v2204, v2205 in ipairs(v406()) do
            if v2205.Name == "Warrior Helmet" then
                v2203 = true
                break
            end
        end
    end
    if not v2203 then
        local v2206, v2207 = pcall(function()
            return Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")
        end)
        if not v2206 or tonumber(v2207) ~= 3 then
            SetTask("MainTask", "Third Sea | Complete Bartilo quest first")
            return nil
        end
    end
    local v2208 = false
    pcall(function()
        local v2209 = Remotes.CommF_:InvokeServer("GetUnlockables")
        if typeof(v2209) == "table" and v2175(v2209) then
            v2208 = true
        end
    end)
    if not v2208 then
        pcall(function()
            local v2210 = Remotes.CommF_:InvokeServer("TalkTrevor", "3")
            if tonumber(v2210) == 0 then
                v2208 = true
            end
        end)
    end
    if not v2208 then
        return nil
    end
    local v2211, v2212 = pcall(function()
        return Remotes.CommF_:InvokeServer("ZQuestProgress", "Check")
    end)
    if not v2211 then
        return nil
    end
    if v2212 ~= nil then
        v2212 = tonumber(v2212) or v2212
    end
    ZQuestProgress = v2212
    if v2212 == nil then
        FunctionsHandler.ThirdSeaPuzzle:Set("State", "DonSwan")
        return "DonSwan"
    elseif v2212 == 0 then
        FunctionsHandler.ThirdSeaPuzzle:Set("State", "Indra")
        return "Indra"
    elseif v2212 == 1 then
        FunctionsHandler.ThirdSeaPuzzle:Set("State", "TravelZou")
        return "TravelZou"
    end
    return nil
end)
KaitunBossRespawnTimer = function(p2213)
    local v2214 = workspace:FindFirstChild("_WorldOrigin")
    local v2215 = v2214 and v2214:FindFirstChild(string.upper(p2213) .. " Respawn Marker")
    local v2216 = v2215 and v2215:FindFirstChild("RespawnTimer")
    local v2217 = v2216 and v2216:FindFirstChild("Frame")
    local v2218 = v2217 and v2217:FindFirstChild("Timer")
    if not v2218 or not v2218:IsA("TextLabel") then
        return nil
    end
    local v2219 = v2218.Text:gsub("<[^>]+>", "")
    local v2220, v2221 = v2219:match("(%d+):(%d%d)")
    if not v2220 then
        return nil
    end
    return string.format("%02d:%02d", tonumber(v2220), tonumber(v2221)), tonumber(v2220) * 60 + tonumber(v2221)
end
doorPos = Vector3.new(2284.81299, 21.7887726, 912.070251)
FunctionsHandler.ThirdSeaPuzzle:RegisterMethod("Start", function(p2222)
    p2222 = p2222 or FunctionsHandler.ThirdSeaPuzzle:Get("State")
    local v2223 = game.Players.LocalPlayer.Character
    local v2224 = v2223 and v2223:FindFirstChild("HumanoidRootPart")
    if not v2224 then
        return
    end
    if p2222 == "DonSwan" then
        local v2225 = CFrame.new(-286.926025, 312.458679, 590.981018)
        local v2226 = CFrame.new(2284.91, 20, 865.48)
        local v2227 = (v2224.Position - v2226.Position).Magnitude <= 250
        if not v2227 then
            if (v2224.Position - v2225.Position).Magnitude > 12 then
                SetTask("MainTask", "Third Sea | Moving to Don Swan entrance")
                TweenController.Create(v2225)
                return
            end
            TweenController.StopMovement()
            local v2228 = FunctionsHandler.ThirdSeaPuzzle:Get("SwanDoorClickAt") or -math.huge
            if os.clock() - v2228 >= 2 then
                FunctionsHandler.ThirdSeaPuzzle:Set("SwanDoorClickAt", os.clock())
                SetTask("MainTask", "Third Sea | Jumping + clicking Don Swan entrance")
                local v2229 = v2223:FindFirstChildOfClass("Humanoid")
                if v2229 and (v2229.Health > 0) then
                    v2229.PlatformStand = false
                    v2229.Jump = true
                    v2229:ChangeState(Enum.HumanoidStateType.Jumping)
                end
                if mouse1click then
                    mouse1click()
                else
                    local v2230 = game:GetService("VirtualUser")
                    v2230:CaptureController()
                    v2230:Button1Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                    task.wait(0.05)
                    v2230:Button1Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                end
            end
            task.wait(0.3)
            return
        end
        TweenController.HoldPosition(v2226)
        local v2231 = os.time() + 4
        local v2232 = false
        while os.time() < v2231 do
            task.wait(0.2)
            local v2233 = workspace.Enemies:FindFirstChild("Don Swan")
            if v2233 and v2233:FindFirstChildOfClass("Humanoid") and (v2233.Humanoid.Health > 0) and v2233:FindFirstChild("HumanoidRootPart") then
                v2232 = true
                break
            end
        end
        if v2232 then
            SetTask("MainTask", "Auto Third Sea - Defeating Don Swan")
            CombatController.Attack("Don Swan")
            FunctionsHandler.ThirdSeaPuzzle:Set("State", nil)
        else
            local v2234 = KaitunBossRespawnTimer("Don Swan")
            SetTask("MainTask", "Third Sea | Waiting for Don Swan" .. (v2234 and " | Respawn: " .. v2234 or ""))
            TweenController.HoldPosition(v2226)
        end
    elseif p2222 == "Indra" then
        local v2235 = tonumber(Remotes.CommF_:InvokeServer("ZQuestProgress", "Check"))
        if v2235 == 1 then
            FunctionsHandler.ThirdSeaPuzzle:Set("State", "TravelZou")
            CombatController.StopCombat()
            SetTask("MainTask", "Third Sea | Quest completed - travelling")
            Remotes.CommF_:InvokeServer("TravelZou")
            return
        end
        SetTask("MainTask", "Third Sea Puzzle | Defeating rip_indra")
        pcall(function()
            Remotes.CommF_:InvokeServer("ZQuestProgress", "Begin")
        end)
        task.wait(0.5)
        local v2236 = true
        task.spawn(function()
            while v2236 do
                task.wait(1)
                if not v2236 then
                    break
                end
                local v2237, v2238 = pcall(function()
                    return Remotes.CommF_:InvokeServer("ZQuestProgress", "Check")
                end)
                if v2236 and v2237 and (tonumber(v2238) == 1) then
                    FunctionsHandler.ThirdSeaPuzzle:Set("State", "TravelZou")
                    SetTask("MainTask", "Third Sea | Quest completed - travelling")
                    CombatController.StopCombat()
                    break
                end
            end
        end)
        local v2240, v2241 = xpcall(function()
            CombatController.Attack("rip_indra")
        end, function(p2239)
            return tostring(p2239)
        end)
        v2236 = false
        if not v2240 then
            error(v2241, 0)
        end
        v2235 = tonumber(Remotes.CommF_:InvokeServer("ZQuestProgress", "Check"))
        FunctionsHandler.ThirdSeaPuzzle.Set(FunctionsHandler.ThirdSeaPuzzle, "State", v2235 == 1 and "TravelZou" or nil)
        if v2235 == 1 then
            SetTask("MainTask", "Third Sea | Quest completed - travelling")
            Remotes.CommF_:InvokeServer("TravelZou")
        end
    elseif p2222 == "TravelZou" then
        SetTask("MainTask", "Third Sea Puzzle | Teleporting to Third Sea")
        CombatController.StopCombat()
        Remotes.CommF_:InvokeServer("TravelZou")
    end
end)
FunctionsHandler.Yama:RegisterMethod("Refresh", function()
    if v536 ~= 3 then
        return
    end
    if ScriptStorage.Backpack.Yama then
        return
    end
    if not FunctionsHandler.Yama:Get("EliteCount") then
        FunctionsHandler.Yama:Set("EliteCount", Remotes.CommF_:InvokeServer("EliteHunter", "Progress"))
    end
    if FunctionsHandler.Yama:Get("EliteCount") >= 30 then
        return true
    end
end)
FunctionsHandler.Yama:RegisterMethod("Start", function()
    repeat
        task.wait()
        TweenController.Create(game:GetService("ReplicatedStorage").FakeIslands.Waterfall:GetModelCFrame())
    until workspace.Map:FindFirstChild("Waterfall") and workspace.Map.Waterfall:FindFirstChild("SealedKatana")
    fireclickdetector(workspace.Map.Waterfall.SealedKatana.Hitbox.ClickDetector)
end)
FunctionsHandler.PirateRaid:RegisterMethod("Refresh", function()
    local v2242 = FunctionsHandler.PirateRaid:Get("Senque")
    return v2242 and (os.time() - v2242 < 500)
end)
FunctionsHandler.PirateRaid:RegisterMethod("Start", function()
    local v2243 = GetMonAsSortedRange()
    local v2244 = Vector3.new(-5543.5327148438, 313.80062866211, -2964.2585449219)
    if v2243[1] then
        local v2245, v2246 = v2243[1]:FindFirstChildOfClass("Humanoid"), v2243[1]:FindFirstChild("HumanoidRootPart")
        if v2246 and v2245 and (v2245.Health > 0) and (CaculateDistance(v2246.CFrame, v2244) < 500) then
            CombatController.Attack(v2243[1].Name)
            return
        end
    end
    TweenController.Create(v2244)
end)
isnight = function()
    local v2247 = game.Lighting.ClockTime
    if v2247 >= 16 or v2247 < 5 then
        return true
    end
    return false
end
CheckFullMoon = function()
    return game:GetService("Lighting"):GetAttribute("MoonPhase") == 5
end
local function v2248()
    if not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        return
    end
    local v2249 = workspace:WaitForChild("ChestModels")
    local v2250 = {}
    local v2251 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    for v2252, v2253 in ipairs(v2249:GetChildren()) do
        if v2253:IsA("Model") then
            local v2254 = v2253.PrimaryPart or v2253:FindFirstChild("RootPart", true)
            if v2254 then
                table.insert(v2250, { Model = v2253, Root = v2254, Dist = (v2254.Position - v2251).Magnitude })
            end
        end
    end
    table.sort(v2250, function(p2255, p2256)
        return p2255.Dist < p2256.Dist
    end)
    if #v2250 == 0 then
        SetTask("SubTask", "Not Found Chest => Hop")
        Hop.A(5)
        return
    end
    local v2257 = 0
    for v2258, v2259 in ipairs(v2250) do
        if ScriptStorage.Tools["Fist of Darkness"] then
            SetTask("SubTask", "Đã có Fist of Darkness!")
            return "FOD"
        end
        if v2257 >= 50 then
            SetTask("SubTask", "Đủ 50 chest => Hop")
            return
        end
        local v2260 = v2259.Model
        if not v2260 or not v2260.Parent or not v2260:IsDescendantOf(v2249) then
            continue
        end
        for v2261, v2262 in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v2262:IsA("BasePart") then
                v2262.CanCollide = false
            end
        end
        local v2263 = 0
        repeat
            v2263 = v2263 + 1
            if not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                break
            end
            if not v2260 or not v2260.Parent or not v2260:IsDescendantOf(v2249) then
                break
            end
            if ScriptStorage.Tools["Fist of Darkness"] then
                return "FOD"
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v2259.Root.CFrame + Vector3.new(0, 2, 0)
            task.wait(0.15)
        until not v2260.Parent or not v2260:IsDescendantOf(v2249) or v2263 >= 20
        if not v2260.Parent or not v2260:IsDescendantOf(v2249) then
            v2257 = v2257 + 1
        end
        if v2257 > 0 and (v2257 % 10 == 0) then
            SetTask("SubTask", "Reset Character")
            local v2264 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if v2264 then
                v2264.Health = 0
                repeat
                    task.wait(0.2)
                until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and (game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health > 0)
            end
        end
    end
    Hop.A(5)
end
FunctionsHandler.SoulGuitar:RegisterMethod("Refresh", function()
    if not (Config and Config.Items and Config.Items.SkullGuitar) then
        return
    end
    if ScriptStorage.Backpack["Skull Guitar"] then
        return
    end
    if ScriptStorage.PlayerData.Fragments < 5000 then
        return
    end
    if ScriptStorage.PlayerData.Level < MaxLevel then
        return
    end
    if not ScriptStorage.Backpack["Dark Fragment"] then
        if v536 ~= 2 then
            return "TravelSea2"
        else
            if Config and Config.Hop and Config.Hop["Hop For Dark Beard ( Skull Guitar )"] then
                return "HopDarkbeard"
            else
                return "FarmFragment"
            end
        end
    end
    local v2265 = (ScriptStorage.Backpack.Ectoplasm or { Count = 0 }).Count
    local v2266 = (ScriptStorage.Backpack.Bones or { Count = 0 }).Count
    if v2265 < 250 then
        return 1
    end
    if v536 ~= 3 then
        return
    end
    SoulGuitarProcess = Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check")
    if not SoulGuitarProcess then
        Remotes.CommF_:InvokeServer("gravestoneEvent", 2)
        if not CheckFullMoon() then
            SetTask("MainTask", "Hopping for full moon ( soul guitar )")
            Hop.API("fullmoon", 10, 5)
        end
        return 7
    end
    if not SoulGuitarProcess.Swamp then
        return 2
    elseif not SoulGuitarProcess.Gravestones then
        return 3
    elseif not SoulGuitarProcess.Ghost then
        return 4
    elseif not SoulGuitarProcess.Trophies then
        return 5
    elseif not SoulGuitarProcess.Pipes then
        return 6
    elseif v2266 >= 500 and not ScriptStorage.Backpack["Skull Guitar"] then
        return 8
    end
end)
FunctionsHandler.SoulGuitar:RegisterMethod("Start", function(p2267)
    if p2267 == "TravelSea2" then
        SetTask("MainTask", "Soul Guitar | No Dark Fragment | Travelling to Sea 2")
        Remotes.CommF_:InvokeServer("TravelDressrosa")
        task.wait(10)
        return
    end
    if p2267 == "FarmFragment" then
        SetTask("MainTask", "Soul Guitar | Farming Chest for Fist of Darkness")
        local v2268 = v2248()
        if v2268 == "FOD" then
            if ScriptStorage.Enemies.Darkbeard then
                SetTask("MainTask", "Soul Guitar | Attacking Darkbeard")
                CombatController.Attack("Darkbeard")
                return
            end
            if ScriptStorage.Tools["Fist of Darkness"] then
                TweenController.Create(CFrame.new(3780.00391, 18.5, -3499.56689))
                FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Fist of Darkness")
                return
            end
        end
    end
    if p2267 == "HopDarkbeard" then
        SetTask("MainTask", "Soul Guitar | Hopping for Darkbeard")
        Hop.API("Darkbeard", 12, 5)
        return
    end
    if p2267 == 7 then
        while CaculateDistance(CFrame.new(-8654, 140, 6167)) > 5 do
            task.wait()
            TweenController.Create(CFrame.new(-8654, 140, 6167))
        end
        SoulGuitarProcess = Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
    elseif p2267 == 1 then
        if v536 ~= 2 then
            SetTask("MainTask", "Teleport to second sea to farm ectoplasm")
            return Remotes.CommF_:InvokeServer("TravelDressrosa")
        else
            SetTask("MainTask", "Farming ectoplasms for soul guitar")
            CombatController.Attack({ "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer" })
            return
        end
    elseif p2267 == 2 then
        TTL9 = TTL9 or 0
        if os.time() ~= LastestTime1 then
            TTL9 = TTL9 + 1
            LastestTime1 = os.time()
        end
        if TTL9 > 60 then
            return Hop.API("fullmoon", 10, 5)
        end
        local v2269 = {}
        for v2270, v2271 in Services.Workspace.Enemies:GetChildren() do
            if v2271.name == "Living Zombie" then
                table.insert(v2269, v2271)
            end
        end
        if #v2269 < 6 then
            SetTask("MainTask", "Soul Guitar task 1 / 5: waiting until entity spawn")
            TweenController.Create(ScriptStorage.MobRegions["Living Zombie"][1] + Vector3.new(0, 30, 0))
        else
            local v2272 = os.time()
            for v2273, v2274 in v2269 do
                while task.wait() and (v2274.Humanoid.Health > 7000) do
                    SetTask("MainTask", "Soul Guitar task 1 / 5: Hit mob " .. v2273 .. " / 6")
                    FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Melee")
                    if os.time() - v2272 > 60 then
                        Hop.API("fullmoon", 10, 5)
                    end
                    TweenController.Create(v2274.HumanoidRootPart.CFrame + Vector3.new(0, 50, 0))
                    v1120:Attack()
                end
            end
            SetTask("MainTask", "Soul Guitar task 1 / 5: Attack")
            while workspace.Enemies:FindFirstChild("Living Zombie") and task.wait() do
                if os.time() - v2272 > 60 then
                    Hop.API("fullmoon", 10, 5)
                end
                CombatController.Attack("Living Zombie")
            end
        end
    elseif p2267 == 3 then
        local v2275 = workspace.Map["Haunted Castle"]
        while CaculateDistance(CFrame.new(-8800, 178, 6033)) > 10 do
            task.wait()
            SetTask("MainTask", "Soul Guitar task 2 / 5: completing placards")
            TweenController.Create(CFrame.new(-8800, 178, 6033))
        end
        for v2276, v2277 in {
    Placard1 = "Right",
    Placard2 = "Right",
    Placard3 = "Left",
    Placard4 = "Right",
    Placard5 = "Left",
    Placard6 = "Left",
    Placard7 = "Left"
} do
            fireclickdetector(v2275[v2276][v2277].ClickDetector)
        end
    elseif p2267 == 4 then
        Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Ghost")
    elseif p2267 == 5 then
        if CaculateDistance(CFrame.new(-9530.0126953125, 6.104853630065918, 6054.83349609375)) > 30 then
            TweenController.Create(CFrame.new(-9530.0126953125, 6.104853630065918, 6054.83349609375))
        else
            local v2278 = workspace.Map["Haunted Castle"].Tablet
            for v2279, v2280 in pairs(BlankTablets) do
                local v2281 = v2278[v2280]
                if v2281.Line.Rotation.Z ~= 0 then
                    repeat
                        task.wait()
                        fireclickdetector(v2281.ClickDetector)
                    until v2281.Line.Rotation.Z == 0
                end
            end
            for v2282, v2283 in pairs(Trophy) do
                local v2284 = workspace.Map["Haunted Castle"].Trophies.Quest[v2283].Handle.CFrame
                v2284 = tostring(v2284)
                v2284 = v2284:split(", ")[4]
                local v2285 = "180"
                if v2284 == "1" or v2284 == "-1" then
                    v2285 = "90"
                end
                if not string.find(tostring(v2278[v2282].Line.Rotation.Z), v2285) then
                    repeat
                        task.wait()
                        fireclickdetector(v2278[v2282].ClickDetector)
                    until string.find(tostring(v2278[v2282].Line.Rotation.Z), v2285)
                end
            end
        end
    elseif p2267 == 6 then
        for v2286, v2287 in pairs(Pipes) do
            pcall(function()
                local v2288 = workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model[v2286]
                if v2288.BrickColor.Name ~= v2287 then
                    repeat
                        task.wait()
                        fireclickdetector(v2288.ClickDetector)
                    until v2288.BrickColor.Name == v2287
                end
            end)
        end
        Remotes.CommF_:InvokeServer("soulGuitarBuy")
    elseif p2267 == 8 then
        Remotes.CommF_:InvokeServer("soulGuitarBuy")
    end
end)
FunctionsHandler.CursedDualKatana:RegisterMethod("Refresh", function()
    if not (Config and Config.Items and Config.Items.CDK) then
        return
    end
    local v2289 = ScriptStorage.Backpack
    if ScriptStorage.PlayerData.Level < 2200 then
        return
    end
    if v2289["Cursed Dual Katana"] or not v2289.Tushita or v2289.Tushita.Mastery < 350 or not v2289.Yama or v2289.Yama.Mastery < 350 then
        return
    end
    if v536 ~= 3 then
        Remotes.CommF_:InvokeServer("TravelZou")
    end
    SetTask("MainTask", "Cursed Dual Katana | Checking Progress")
    CdkProgess = CdkProgess or Remotes.CommF_:InvokeServer("CDKQuest", "Progress")
    local v2290 = CdkProgess
    if not v2290 then
        print("ban roi")
        return
    end
    if workspace.Map.Turtle.Cursed:FindFirstChild("Breakable") then
        alert("Cursed Dual Katana", "Open Door")
        return { "break" }
    end
    local v2291 = { Good = "Tushita", Evil = "Yama" }
    if v2290.Good == 4 and (v2290.Evil == 4) then
        print("burn 2")
        return { "burn 2" }
    end
    if v2290.Good == 3 or v2290.Evil == 3 then
        print("burn 1")
        return { "burn" }
    end
    if v2290.Opened then
        for v2292, v2293 in v2290 do
            if v2292 ~= "Opened" and (v2292 ~= "Finished") and (v2293 < 3) then
                print(v2292, v2293)
                ScriptStorage.CdkCache = { v2292, v2293 + 1 }
                if not ScriptStorage.Tools[v2291[v2292]] then
                    Remotes.CommF_:InvokeServer("LoadItem", v2291[v2292])
                end
                alert("Cursed Dual Katana", "Start " .. tostring(v2291[v2292]) .. " " .. tostring(v2292))
                Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", v2292)
                SetTask("MainTask", "Cursed Dual Katana - " .. tostring(v2291[v2292]) .. " " .. tostring(v2292))
                CdkProgess = v2290
                return ScriptStorage.CdkCache
            end
        end
    end
    local v2294 = ScriptStorage.CdkCache
    if not v2294 then
        return
    end
    local v2295, v2296 = v2294[1], v2294[2]
    if v2295 == "Evil" and (v2296 == 3) then
        if not ScriptStorage.Enemies["Soul Reaper"] then
            ForceToRollBone = true
            return
        end
    elseif v2295 == "Good" then
        if v2296 == 2 then
            SetTask("SubTask", "CDK Quest / Waiting until pirate raid started")
            return
        elseif v2296 == 3 and not ScriptStorage.Enemies["Cake Queen"] then
            Hop.A()
            SetTask("SubTask", "CDK Quest / Waiting until Cake Queen boss spawned")
            return
        end
    end
    return v2294
end)
FunctionsHandler.CursedDualKatana:RegisterMethod("GetHazeMon", function()
    local v2297 = {}
    for v2298, v2299 in LocalPlayer.QuestHaze:GetChildren() do
        if v2299.Value > 0 then
            table.insert(v2297, v2299)
        end
    end
    table.sort(v2297, function(p2300, p2301)
        return CaculateDistance(p2300:GetAttribute("Position")) < CaculateDistance(p2301:GetAttribute("Position"))
    end)
    return tostring(v2297[1])
end)
FunctionsHandler.CursedDualKatana:RegisterMethod("DoDimension", function(p2302)
    local v2303 = string.gsub(p2302, " ", "")
    local v2304 = os.time()
    repeat
        task.wait()
        TweenController.Create(LocalPlayer.Character.HumanoidRootPart.CFrame)
        if os.time() - v2304 > 60 then
            return
        end
    until os.time() - TorchEnabledTime < 10
    repeat
        task.wait()
        local v2305 = workspace.Map:WaitForChild(v2303, 10)
        if v2305 then
            for v2306, v2307 in v2305:GetChildren() do
                if v2307 and string.find(v2307.Name, "Torch") and v2307:FindFirstChild("ProximityPrompt") and v2307.ProximityPrompt.Enabled then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = v2307.CFrame
                    v2307.ProximityPrompt.HoldDuration = 0
                    task.wait(1)
                    local v2308 = game:GetService("VirtualInputManager")
                    v2308:SendKeyEvent(true, "E", 0, game)
                    v2308:SendKeyEvent(false, "E", 0, game)
                    fireproximityprompt(workspace.Map:WaitForChild(v2303, 10):FindFirstChild(tostring(v2307)).ProximityPrompt)
                end
                for v2309, v2310 in workspace.Enemies:GetChildren() do
                    local v2311 = v2310:FindFirstChild("HumanoidRootPart")
                    local v2312 = v2310:FindFirstChildOfClass("Humanoid")
                    if v2311 and v2312 and (CaculateDistance(v2311.CFrame) < 1000) then
                        CombatController.Attack(v2310.Name)
                    end
                end
            end
            ExitDoor = v2305:FindFirstChild("Exit")
            print("exit door", ExitDoor)
            if ExitDoor then
                PortalBrick = tostring(ExitDoor.BrickColor)
                print("Brick color", ExitDoor, ExitDoor.BrickColor, PortalBrick)
            end
        else
            print("no island idk wt-")
        end
        print("loop damn", PortalBrick)
    until PortalBrick == "Olive" or PortalBrick == "Cloudy grey"
    print("leave")
    while os.time() - DoneCdkTick > 15 do
        TweenController.Create(ExitDoor.CFrame + Vector3.new(0, math.random(1, 5), 0))
        task.wait()
    end
    Hop.A()
end)
GetBlueGear = function()
    for v2313, v2314 in workspace.Map.MysticIsland:GetDescendants() do
        if v2314:IsA("MeshPart") then
            if v2314.MeshId == "rbxassetid://10153114969" then
                if v2314.Transparency ~= 1 then
                    return v2314.CFrame
                end
            end
        end
    end
end
local v2315, v2316 = nil, 0
FunctionsHandler.PullLever:RegisterMethod("Refresh", function()
    if not (Config and Config.Items and Config.Items.PullLever) then
        return
    end
    if ScriptStorage.PlayerData.Level < MaxLevel then
        return
    end
    if Remotes.CommF_:InvokeServer("CheckTempleDoor") then
        return
    end
    if not ScriptStorage.Backpack["Valkyrie Helm"] then
        return
    end
    if not ScriptStorage.Backpack["Mirror Fractal"] then
        return
    end
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getRaceLevel") < 3 then
        return
    end
    if v536 ~= 3 then
        return "TravelToSea3"
    end
    if v2315 == nil or tick() - v2316 > 3 then
        v2315 = Remotes.CommF_:InvokeServer("RaceV4Progress", "Check")
        v2316 = tick()
    end
    AiChoMaDiGatCan = v2315
    SetTask("MainTask", "Pull Lever")
    if not AiChoMaDiGatCan then
        return 1
    else
        if workspace.Map:FindFirstChild("MysticIsland") then
            if math.floor(game.Lighting.ClockTime) >= 12 or math.floor(game.Lighting.ClockTime) < 5 then
                return 2
            else
                SetTask("SubTask", "Hop for server moon and mirage")
                Hop.API("Mirage", 12, 5)
            end
        else
            SetTask("SubTask", "Hop for server mirage")
            Hop.API("Mirage", 12, 5)
        end
    end
end)
FunctionsHandler.PullLever:RegisterMethod("Start", function(p2317)
    if p2317 == "TravelToSea3" then
        SetTask("MainTask", "Pull Lever | Travelling to Third Sea")
        Remotes.CommF_:InvokeServer("TravelZou")
        task.wait(10)
        return
    end
    if p2317 == 1 then
        SetTask("SubTask", "Get Quest Pull Lever")
        if PullLeverQuestDebounce and (tick() - PullLeverQuestDebounce < 8) then
            return
        end
        TweenController.Create(CFrame.new(3032, 2280, -7325))
        if CaculateDistance(CFrame.new(3032, 2280, -7325)) < 30 then
            PullLeverQuestDebounce = tick()
            if not game.Workspace.Map:FindFirstChild("Temple of Time") then
                game.ReplicatedStorage.MapStash["Temple of Time"].Parent = workspace.Map
            end
            Remotes.CommF_:InvokeServer("RaceV4Progress", "Begin")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress", "Check")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress", "Teleport")
            task.wait(2)
            TweenController.Create(CFrame.new(28613, 14896, 106))
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress", "Check")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress", "TeleportBack")
            v2316 = 0
            AiChoMaDiGatCan = Remotes.CommF_:InvokeServer("RaceV4Progress", "Check")
            Hop.A()
            return
        end
        return
    end
    if p2317 == 2 then
        SetTask("SubTask", "Go to Mirage Island")
        local v2318 = GetBlueGear()
        GatCanChuaNguoiDep = Remotes.CommF_:InvokeServer("CheckTempleDoor")
        if v2318 then
            TweenController.Create(v2318)
            SetTask("SubTask", "Pull Lever | Done")
            return true
        else
            TweenController.Create(workspace.Map.MysticIsland.Center.CFrame * CFrame.new(0, 400, 0))
            if CaculateDistance(workspace.Map.MysticIsland.Center.CFrame * CFrame.new(0, 400, 0)) < 20 then
                LocalPlayer.CameraMaxZoomDistance = 0.5
                LocalPlayer.CameraMaxZoomDistance = 200
                workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, game.Lighting:GetMoonDirection() + workspace.CurrentCamera.CFrame.Position)
                game.ReplicatedStorage.Remotes.CommE:FireServer("ActivateAbility")
            end
            return
        end
    end
end)
FunctionsHandler.MirrorAndValk:RegisterMethod("Refresh", function()
    if not (Config and Config.Items and Config.Items.MM) then
        return
    end
    if not ScriptStorage.Melees.Godhuman then
        return
    end
    local v2319 = { "Dough King", "Cake Prince", "rip_indra True Form" }
    local v2320 = nil
    for v2321, v2322 in ipairs(v2319) do
        if ScriptStorage.Enemies[v2322] then
            v2320 = v2322
            break
        end
    end
    if v2320 then
        return { AttackBoss = v2320 }
    end
    if ScriptStorage.PlayerData.Level < MaxLevel then
        return nil
    end
    local v2323 = ScriptStorage.Backpack["Mirror Fractal"] ~= nil
    local v2324 = ScriptStorage.Backpack["Valkyrie Helm"] ~= nil
    if v2323 and v2324 then
        return nil
    end
    if v536 ~= 3 then
        return { TravelToSea3 = true }
    end
    local v2325 = ScriptStorage.Tools["God's Chalice"]
    local v2326 = ScriptStorage.Tools["Sweet Chalice"]
    if v2325 or v2326 then
        return nil
    end
    local v2327 = { "Urban", "Deandre", "Diablo" }
    local v2328 = nil
    for v2329, v2330 in ipairs(v2327) do
        if ScriptStorage.Enemies[v2330] then
            v2328 = v2330
            break
        end
    end
    if ScriptStorage.PlayerData.Level < MaxLevel then
        if v2328 then
            return { AttackBoss = v2328 }
        end
    end
    return { Mirror = not v2323, Valk = not v2324 }
end)
FunctionsHandler.MirrorAndValk:RegisterMethod("Start", function(p2331)
    if p2331.TravelToSea3 then
        SetTask("MainTask", "Mirror And Valk | Travelling to Third Sea")
        Remotes.CommF_:InvokeServer("TravelZou")
        task.wait(10)
        return
    end
    if p2331.AttackBoss then
        SetTask("MainTask", "Priority Boss | Attacking " .. p2331.AttackBoss)
        CombatController.Attack(p2331.AttackBoss)
        return
    end
end)
FunctionsHandler.CursedDualKatana:RegisterMethod("Start", function(p2332)
    SetTask("MainTask", "Cursed Dual Katana | Starting " .. tostring(p2332[1]) .. (p2332[2] and " " .. tostring(p2332[2]) or ""))
    local v2333 = workspace.Map.Turtle.Cursed
    if p2332[1] == "break" then
        TweenController.Create(workspace.Map.Turtle.Cursed.Breakable.CFrame)
        Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")
        Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor", true)
        workspace.Map.Turtle.Cursed.Breakable:Destroy()
        CdkProgess = nil
        return
    end
    if p2332[1] == "burn 2" then
        if workspace.Map.Turtle.Cursed.Pedestal3.ProximityPrompt.Enabled then
            fireproximityprompt(workspace.Map.Turtle.Cursed.Pedestal3.ProximityPrompt)
            task.wait(4)
            pcall(function()
                LocalPlayer.Character.Humanoid.Health = 0
            end)
            task.wait(10)
        else
            CDKAttempts = (CDKAttempts or 0) + 1
            TweenController.Create(CFrame.new(-12341.66796875, 603.3455810546875, -6550.6064453125))
            task.wait(5)
            pcall(function()
                LocalPlayer.Character.Humanoid.Health = 0
            end)
            task.wait(5)
            if CDKAttempts > 5 then
                Hop.A()
            end
            CdkProgess = nil
        end
    elseif p2332[1] == "burn" then
        for v2334 = 1, 3 do
            local v2335 = workspace.Map.Turtle.Cursed:FindFirstChild("Pedestal" .. v2334)
            if workspace.Map.Turtle.Cursed:FindFirstChild("Pedestal" .. v2334).ProximityPrompt.Enabled then
                repeat
                    task.wait()
                    TweenController.Create(workspace.Map.Turtle.Cursed:FindFirstChild("Pedestal" .. v2334).CFrame)
                until CaculateDistance(workspace.Map.Turtle.Cursed:FindFirstChild("Pedestal" .. v2334).CFrame) < 5
                fireproximityprompt(workspace.Map.Turtle.Cursed:FindFirstChild("Pedestal" .. v2334).ProximityPrompt)
                task.wait(3)
                pcall(function()
                    LocalPlayer.Character.Humanoid.Health = 0
                end)
            end
            CdkProgess = nil
        end
    elseif p2332[1] == "Evil" then
        if p2332[2] == 1 then
            local v2336 = ScriptStorage.Enemies["Forest Pirate"]
            TweenController.Create(v2336 and v2336.HumanoidRootPart.CFrame or ScriptStorage.MobRegions["Forest Pirate"][0])
            CdkProgess = nil
        elseif p2332[2] == 2 then
            CombatController.Attack(FunctionsHandler.CursedDualKatana.Methods.GetHazeMon:Call())
            CdkProgess = nil
        elseif p2332[2] == 3 then
            Report("found cdk yama 3")
            while not (os.time() - TorchEnabledTime < 100 or not ScriptStorage.Enemies["Soul Reaper"]) do
                SetTask("SubTask", "tweening to soul reaper")
                task.wait()
                if FunctionsHandler.RaidController.Methods.GetCurrentRaidIsland:Call() then
                    pcall(function()
                        LocalPlayer.Character.Humanoid.Health = 0
                    end)
                end
                TweenController.Create(ScriptStorage.Enemies["Soul Reaper"]:GetModelCFrame())
            end
            if not ScriptStorage.Enemies["Soul Reaper"] then
                return
            end
            FunctionsHandler.CursedDualKatana.Methods.DoDimension.Callback("Hell Dimension")
            CdkProgess = nil
        end
    else
        if p2332[2] == 1 then
            for v2337, v2338 in game.ReplicatedStorage.NPCs:GetChildren() do
                if v2338.Name == "Luxury Boat Dealer" then
                    repeat
                        task.wait()
                        if os.time() - DoneCdkTick < 15 then
                            return
                        end
                        TweenController.Create(v2338:GetModelCFrame())
                        RealNPC = nil
                        for v2339, v2340 in workspace.NPCs:GetChildren() do
                            if CaculateDistance(v2340:GetModelCFrame(), v2338:GetModelCFrame()) < 20 then
                                RealNPC = v2340
                                break
                            end
                        end
                    until CaculateDistance(v2338:GetModelCFrame()) < 5 and RealNPC
                    Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", RealNPC)
                end
            end
            CdkProgess = nil
        elseif p2332[2] == 3 then
            if not ScriptStorage.Enemies["Cake Queen"] then
                Hop.API("CakeQueen", 12, 5)
            end
            repeat
                task.wait()
                SetTask("SubTask", "attacking cake queen")
                CombatController.Attack("Cake Queen")
            until os.time() - TorchEnabledTime < 10 or not ScriptStorage.Enemies["Cake Queen"]
            Report("Cake Queen")
            SetTask("SubTask", "Attack in Heavenly Dimension")
            FunctionsHandler.CursedDualKatana.Methods.DoDimension.Callback("Heavenly Dimension")
            CdkProgess = nil
        end
    end
end)
local v2341 = { Listeners = {} }
TorchEnabledTime = 0
DoneCdkTick = 0
getgenv().NotificationCallBack = function(p2342)
    for v2343, v2344 in v2341.Listeners do
        if string.find(string.lower(p2342), string.lower(v2343)) then
            v2344(p2342)
        end
    end
end
v2341.RegisterNotifyListener = function(p2345, p2346, p2347)
    v2341.Listeners[p2346] = p2347
end
v2341:RegisterNotifyListener("go!", function()
    LastRaidAlert = os.time()
end)
v2341:RegisterNotifyListener("raid", function()
    LastRaidAlert2 = os.time()
end)
v2341:RegisterNotifyListener("been spotted approaching", function()
    FunctionsHandler.PirateRaid:Set("Senque", os.time())
end)
v2341:RegisterNotifyListener("job", function()
    FunctionsHandler.PirateRaid:Set("Senque", 0)
end)
v2341:RegisterNotifyListener("level", function()
    AddPoint()
end)
v2341:RegisterNotifyListener("torch", function()
    TorchEnabledTime = os.time()
end)
v2341:RegisterNotifyListener("scroll reacts", function()
    DoneCdkTick = os.time()
end)
v2341:RegisterNotifyListener("elite", function()
    FunctionsHandler.Yama:Set("EliteCount", Remotes.CommF_:InvokeServer("EliteHunter", "Progress"))
    alert("[KurinianHub ] ", "Elite defeated: " .. tostring(FunctionsHandler.Yama:Get("EliteCount") or "n/a"))
end)
v2341:RegisterNotifyListener("the raid with", function()
    if ScriptStorage.PlayerData.Level < MaxLevel then
        return
    end
    Remotes.CommF_:InvokeServer("Awakener", "Awaken")
end)
v2341:RegisterNotifyListener("quest completed", function()
    v842:RefreshQuest()
    task.wait()
    if not v842:GetCurrentClaimQuest() then
        v842:MarkAsCompleted()
    end
end)
v2341:RegisterNotifyListener("Confront the prisoner", function()
    getgenv().KaitunNoPrisonerUntil = tick() + 30
    warn("[Prisoner] confront canh bao -> doi mob khac 30s")
    pcall(function()
        SetTask("SubTask", "Prisoner confront - doi mob khac...")
    end)
end)
local v2348
v2348 = hookfunction(require(game.ReplicatedStorage.Notification).new, function(p2349, p2350)
    v21 = tostring(tostring(p2349 or "") .. tostring(p2350 or "")) or ""
    getgenv().NotificationCallBack(v21)
    return v2348(p2349, p2350)
end)
if v536 ~= 1 then
end
IfTableHaveIndex = function(p2351)
    for v2352 in p2351 do
        return true
    end
end
GetServers = function()
    if LastServersDataPulled then
        if os.time() - LastServersDataPulled < 60 then
            return CachedServers
        end
    end
    for v2353 = 1, 100 do
        local v2354 = game:GetService("ReplicatedStorage"):WaitForChild("__ServerBrowser"):InvokeServer(v2353)
        if IfTableHaveIndex(v2354) then
            LastServersDataPulled = os.time()
            CachedServers = v2354
            return v2354
        end
    end
end
Storage = { WRITE_DELAY = 0.5, Data = {} }
LocalPlayer = game.Players.LocalPlayer
local v2355 = ".storage_u_" .. tostring(LocalPlayer)
Decode = function(p2356)
    return Services.HttpService:JSONDecode(p2356)
end
Encode = function(p2357)
    return Services.HttpService:JSONEncode(p2357)
end
Storage.Set = function(p2358, p2359, p2360)
    p2358.Data[p2359] = p2360
end
Storage.Get = function(p2361, p2362)
    return p2361.Data[p2362]
end
Storage.Save = function(p2363)
    writefile(v2355, Encode(p2363.Data))
end
if not isfile(v2355) then
    writefile(v2355, "{}")
    task.wait(1)
end
Storage.Data = {}
pcall(function()
    Storage.Data = Decode(readfile(v2355) or "{}")
end)
spawn(function()
    while task.wait(Storage.WRITE_DELAY) do
        Storage:Save()
    end
end)
CreateTraceback("Initalize", "Initalizing script..")
local v2364 = 0
local v2365 = {}
local v2366 = 101
local v2367 = {
    "ExpRedeem",
    "SecondSeaPuzzle",
    "LevelFarm",
    "Saber",
    "BossesTask",
    "MeleesController"
}
local v2368 = {
    "ExpRedeem",
    "ColosseumPuzzle",
    "Trevor",
    "ThirdSeaPuzzle",
    "UtillyItemsActivitation",
    "SpecialBossesTask",
    "BossesTask",
    "RaidController",
    "MeleesController",
    "LevelFarm"
}
local v2369 = {
    "ExpRedeem",
    "UtillyItemsActivitation",
    "BossesTask",
    "SpecialBossesTask",
    "PirateRaid",
    "KataFragTask",
    "RaidController",
    "MeleesController",
    "LevelFarm"
}
RefreshTasksData = function()
    if _G.Stop then
        return
    end
    if _G.TasksDataRunning then
        if tick() - (_G.TasksDataRunningAt or 0) > 30 then
            _G.TasksDataRunning = false
        else
            return
        end
    end
    _G.TasksDataRunning = true
    _G.TasksDataRunningAt = tick()
    local function v2370()
        if IsInRaid and IsInRaid() then
            if ParseCurrentQuest and ParseCurrentQuest() then
                pcall(function()
                    if v842 and v842.AbandonQuest then
                        v842.AbandonQuest()
                    end
                    Remotes.CommF_:InvokeServer("AbandonQuest")
                end)
            end
            if FunctionsHandler.RaidController and FunctionsHandler.RaidController.Initalized then
                CurrentTaskName = "RaidController"
                FunctionsHandler.RaidController.Methods.Start:Call()
                return
            end
        end
        local v2371, v2372, v2373, v2374 = nil, nil, nil, nil
        if ParseCurrentQuest then
            v2371, v2372, v2373, v2374 = ParseCurrentQuest()
        end
        local v2375 = nil
        if FunctionsHandler.UtillyItemsActivitation and FunctionsHandler.UtillyItemsActivitation.Initalized then
            local v2376, v2377 = pcall(FunctionsHandler.UtillyItemsActivitation.Methods.Refresh.Call, FunctionsHandler.UtillyItemsActivitation.Methods.Refresh, false)
            if v2376 and v2377 and (v2377 == "Previous Hero" or v2377 == "Uzoth" or v2377 == "Water Key" or v2377 == "Library Key") then
                v2375 = v2377
            end
        end
        local v2378 = nil
        if not v2375 and FunctionsHandler.MeleesController and FunctionsHandler.MeleesController.Initalized then
            local v2379, v2380 = pcall(FunctionsHandler.MeleesController.Methods.Refresh.Call, FunctionsHandler.MeleesController.Methods.Refresh, false)
            if v2379 and v2380 then
                v2378 = true
            end
        end
        if v2375 or v2378 then
            _G.ActiveMeleeQuest = v2375 or "Melee Task"
            if v2371 and v842 and v842.AbandonQuest then
                pcall(v842.AbandonQuest)
            end
            pcall(function()
                Remotes.CommF_:InvokeServer("AbandonQuest")
            end)
            if CombatController and CombatController.StopCombat then
                CombatController.StopCombat()
            end
            if TweenController and TweenController.StopMovement then
                TweenController.StopMovement()
            end
            if v2375 then
                CurrentTaskName = "UtillyItemsActivitation"
                FunctionsHandler.UtillyItemsActivitation.Methods.Start:Call(v2375)
            else
                CurrentTaskName = "MeleesController"
                FunctionsHandler.MeleesController.Methods.Start:Call()
            end
            _G.ActiveMeleeQuest = nil
            return
        end
        local v2381 = v2371 and (v2371 ~= "") or (v2373 and (v2373 > 0))
        if v536 == 1 and (ScriptStorage.PlayerData.Level >= 700) and not FunctionsHandler.SecondSeaPuzzle:Get("IsCompleted") then
            if v2381 then
                pcall(function()
                    Remotes.CommF_:InvokeServer("AbandonQuest")
                end)
                v2381 = false
            end
        end
        if v2381 then
            if v536 == 3 and CombatController and CombatController.FindTopPriorityBoss then
                local v2382 = CombatController.FindTopPriorityBoss()
                if v2382 then
                    CurrentTaskName = "BossesTask"
                    FunctionsHandler.BossesTask.Methods.Start:Call(v2382)
                    return
                end
            end
            if CurrentTaskName == "ColosseumPuzzle" and FunctionsHandler.ColosseumPuzzle and FunctionsHandler.ColosseumPuzzle.Initalized then
                FunctionsHandler.ColosseumPuzzle.Methods.Start:Call(1)
                return
            elseif CurrentTaskName == "KataFragTask" and FunctionsHandler.KataFragTask and FunctionsHandler.KataFragTask.Initalized then
                FunctionsHandler.KataFragTask.Methods.Start:Call()
                return
            elseif FunctionsHandler.LevelFarm and FunctionsHandler.LevelFarm.Initalized then
                CurrentTaskName = "LevelFarm"
                FunctionsHandler.LevelFarm.Methods.Start:Call(v2371)
                return
            end
        end
        local v2383 = v536 == 1 and v2367 or (v536 == 2 and v2368) or v2369
        for v2384, v2385 in ipairs(v2383) do
            local v2386 = FunctionsHandler[v2385]
            if not v2386 or not v2386.Initalized then
                if not v2365[v2385] then
                    v2365[v2385] = true
                end
            else
                local v2387 = v2386.Methods.Refresh
                local v2388 = v2386.Methods.Start
                if v2387 and v2388 then
                    local v2389, v2390 = pcall(v2387.Call, v2387, false)
                    if not v2389 then
                        warn("[ Task Error ] Refresh " .. tostring(v2385) .. ": " .. tostring(v2390))
                        v2390 = nil
                    end
                    v2366 = v2366 + 1
                    if v2390 then
                        CurrentTaskName = v2385
                        local v2391, v2392 = pcall(v2388.Call, v2388, v2390)
                        if not v2391 then
                            warn("[ Task Error ] Start " .. tostring(v2385) .. ": " .. tostring(v2392))
                            if v2385 == "LevelFarm" then
                                return
                            end
                        else
                            return
                        end
                    end
                end
            end
        end
    end
    local v2393, v2394 = pcall(v2370)
    _G.TasksDataRunning = false
    if not v2393 then
        warn("[RefreshTasksData Error] " .. tostring(v2394))
    end
end
getgenv().RefreshTasksData = RefreshTasksData
pcall(AddPoint)
pcall(function()
    if v842 and (type(v842) == "table") and v842.RefreshQuest then
        v842:RefreshQuest()
    end
end)
pcall(RefreshInventory)
pcall(function()
    if Remotes and Remotes.CommE and Remotes.CommE.OnClientEvent then
        Remotes.CommE.OnClientEvent:Connect(function(...)
            local v2395 = { ... }
            if v2395[1] and string.find(tostring(v2395[1]), "Item") then
                RefreshInventory()
            end
        end)
    end
end)
pcall(RefreshRace)
pcall(function()
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        pcall(function()
            local v2396 = game:GetService("Players").LocalPlayer.Character
            local v2397 = v2396 and v2396:FindFirstChildOfClass("Humanoid")
            if v2397 then
                v2397:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    end)
end)
QueueList = {}
NearbyHopHandler = function()
    if NearbyHopHandlerDebounce and (os.time() - NearbyHopHandlerDebounce < 10) then
        return
    end
    NearbyHopHandlerDebounce = os.time()
    for v2398, v2399 in ipairs(game:GetService("Players"):GetPlayers()) do
        if v2399 ~= game:GetService("Players").LocalPlayer then
            local v2400 = v2399.Character and v2399.Character:FindFirstChild("HumanoidRootPart") and v2399.Character.HumanoidRootPart.Position
            if v2400 then
                local v2401 = QueueList[v2399.Name]
                if not v2401 then
                    QueueList[v2399.Name] = os.time()
                else
                    if os.time() - v2401 > 30 then
                        if CaculateDistance(v2400) < 100 then
                            Hop.A()
                            task.wait(5)
                        else
                            QueueList[v2399.Name] = nil
                        end
                    end
                end
            end
        end
    end
end
task.spawn(function()
    while task.wait(1) do
        if not _G.Stop then
            pcall(function()
                local v2402 = game:GetService("Players").LocalPlayer.Character
                if v2402 and v2402:FindFirstChildOfClass("Humanoid") and v2402.Humanoid.Sit then
                    v2402.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
            pcall(RefreshPlayerData)
            if getgenv().Config and getgenv().Config.HopNearr then
                pcall(NearbyHopHandler)
            end
        end
    end
end)
if getgenv()._KaitunMainTaskThread then
    pcall(function()
        task.cancel(getgenv()._KaitunMainTaskThread)
    end)
    getgenv()._KaitunMainTaskThread = nil
end
_G.TasksDataRunning = false
getgenv()._KaitunMainTaskThread = task.spawn(function()
    while task.wait(0.5) do
        if _G.Stop then
            break
        end
        getgenv()._KaitunLoopRunning = tick()
        if LastIdling and (os.time() - LastIdling > 300) then
            SetTask("MainTask", "Rejoining due idle in 10 min!")
            Hop.A()
        end
        if ScriptStorage.PlayerData.Level and (ScriptStorage.PlayerData.Level > 0) then
            local v2403, v2404 = xpcall(RefreshTasksData, debug.traceback)
            if not v2403 then
                warn("[RefreshTasksData CRASH] " .. tostring(v2404))
                task.wait(1)
            end
        else
            pcall(RefreshPlayerData)
        end
    end
end)
task.spawn(function()
    repeat
        task.wait()
    until game:IsLoaded() and game.Players.LocalPlayer
    local v2405 = game.Players.LocalPlayer
    local v2406 = game:GetService("RunService")
    local v2407 = getgenv().__ORIGINAL_WRITEFILE or writefile
    local v2408 = getgenv().__ORIGINAL_READFILE or readfile
    local v2409 = getgenv().__ORIGINAL_ISFILE or isfile
    local v2410 = getgenv().__ORIGINAL_DELFILE or delfile
    getgenv().__ORIGINAL_WRITEFILE = v2407
    getgenv().__ORIGINAL_READFILE = v2408
    getgenv().__ORIGINAL_ISFILE = v2409
    getgenv().__ORIGINAL_DELFILE = v2410
    local v2411 = tostring(v2405.UserId)
    local function v2412(p2413)
        if not p2413 or p2413 == "fluent.lua" or p2413:find("fluent") then
            return p2413
        end
        if p2413:find(v2411) or p2413:find(v2405.Name) then
            return p2413
        end
        local v2414 = p2413:find("%.[%w]+$")
        if v2414 then
            return p2413:sub(1, v2414 - 1) .. "_" .. v2411 .. p2413:sub(v2414)
        else
            return p2413 .. "_" .. v2411
        end
    end
    if v2407 then
        getgenv().writefile = function(p2415, p2416)
            return v2407(v2412(p2415), p2416)
        end
    end
    if v2408 then
        getgenv().readfile = function(p2417)
            return v2408(v2412(p2417))
        end
    end
    if v2409 then
        getgenv().isfile = function(p2418)
            return v2409(v2412(p2418))
        end
    end
    if v2410 then
        getgenv().delfile = function(p2419)
            return v2410(v2412(p2419))
        end
    end
    getgenv().SendKey = function(...)
        return
    end
    if SendKey then
        SendKey = function(...)
            return
        end
    end
    getgenv().Config_FastAttackSpeed = 0.15
    getgenv().Config_BladeHitRadius = 60
    local v2420 = game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net")
    local v2421 = v2420:WaitForChild("RE/RegisterAttack", 15)
    local v2422 = v2420:WaitForChild("RE/RegisterHit", 15)
    assert(v2421 and v2421:IsA("RemoteEvent") and v2422 and v2422:IsA("RemoteEvent"), "KaitunBF: combat remotes unavailable")
    local function v2423()
        local v2424 = {}
        local v2425 = v2405.Character and v2405.Character:FindFirstChild("HumanoidRootPart")
        if not v2425 then
            return v2424
        end
        for v2426, v2427 in pairs(workspace.Enemies:GetChildren()) do
            if v2427:FindFirstChildOfClass("Humanoid") and (v2427.Humanoid.Health > 0) then
                local v2428 = v2427:FindFirstChild("HumanoidRootPart")
                if v2428 and ((v2428.Position - v2425.Position).Magnitude <= getgenv().Config_BladeHitRadius) then
                    table.insert(v2424, v2427)
                end
            end
        end
        return v2424
    end
    local function v2429() end
    if getgenv()._FA_Worker then
        pcall(function()
            task.cancel(getgenv()._FA_Worker)
        end)
        getgenv()._FA_Worker = nil
    end
    getgenv().__KaitunFastAttackStatus = { Sent = 0 }
    getgenv()._FA_Worker = task.spawn(function()
        local v2430 = setthreadidentity or setidentity or set_thread_identity
        if v2430 then
            v2430(2)
        end
        while true do
            local v2431 = math.max(tonumber(getgenv().Config_FastAttackSpeed) or 0.15, 0.15)
            task.wait(v2431)
            local v2432 = getgenv().KaitunRaidAuraPulse
            if v2432 then
                local v2433, v2434 = pcall(v2432)
                if not v2433 then
                    local v2435 = getgenv().KaitunRaidAuraStatus
                    if v2435 then
                        v2435.Error = tostring(v2434)
                    end
                end
            end
            if _G.FastAttack and (os.time() - _G.FastAttack <= 2) and not _G.ActiveMeleeQuest then
                local v2436 = v2405.Character and v2405.Character:FindFirstChild("HumanoidRootPart")
                if v2436 then
                    local v2437 = v2423()
                    if #v2437 > 0 then
                        local v2438 = {}
                        local v2439 = nil
                        for v2440, v2441 in ipairs(v2437) do
                            if #v2438 >= 3 then
                                break
                            end
                            local v2442 = v2441:FindFirstChild("HumanoidRootPart")
                            local v2443 = v2441:FindFirstChild("Head") or v2441.PrimaryPart or v2442
                            if not v2439 then
                                v2439 = v2443
                            end
                            if v2442 then
                                table.insert(v2438, { v2441, v2442 })
                            end
                        end
                        if v2439 and (#v2438 > 0) and (os.clock() >= (getgenv().VapeNextAttackPacket or 0)) then
                            getgenv().VapeNextAttackPacket = os.clock() + 0.15
                            local v2446, v2447 = pcall(function()
                                v2421:FireServer(0.16, 1)
                                local v2444, v2445 = pcall(function()
                                    return require(game:GetService("ReplicatedStorage"):WaitForChild("Global"))
                                end)
                                if v2444 and v2445 and v2445.SendHitsToServer then
                                    v2445.SendHitsToServer(v2439, v2438)
                                else
                                    error(v2444 and "Global.SendHitsToServer unavailable" or tostring(v2445))
                                end
                            end)
                            local v2448 = getgenv().__KaitunFastAttackStatus
                            if v2446 then
                                v2448.Sent = v2448.Sent + 1
                                v2448.Error = nil
                            else
                                v2448.Error = tostring(v2447)
                            end
                        end
                    end
                end
            end
        end
    end)
end)
;(function()
    local v2449 = game.Players.LocalPlayer
    local v2450 = game:GetService("RunService")
    local v2451 = game:GetService("ReplicatedStorage")
    local v2452 = getgenv()._KaitunScriptId
    if getgenv().BringConnV4 then
        pcall(function()
            getgenv().BringConnV4:Disconnect()
        end)
    end
    if getgenv().BringConnV5 then
        pcall(function()
            getgenv().BringConnV5:Disconnect()
        end)
    end
    if getgenv().FA_S1 then
        pcall(function()
            task.cancel(getgenv().FA_S1)
        end)
    end
    if getgenv().FA_S2 then
        pcall(function()
            task.cancel(getgenv().FA_S2)
        end)
    end
    if getgenv().FA_S3 then
        pcall(function()
            task.cancel(getgenv().FA_S3)
        end)
    end
    local v2453 = 200
    local function v2454(p2455)
        local v2456 = v2451:FindFirstChild("FortBuilderReplicatedSpawnPositionsFolder")
        if not v2456 then
            return nil
        end
        local v2457 = {}
        for v2458, v2459 in pairs(v2456:GetChildren()) do
            if tostring(v2459) == p2455 then
                table.insert(v2457, v2459.CFrame.Position)
            end
        end
        if #v2457 == 0 then
            return nil
        end
        if #v2457 == 1 then
            return { v2457[1] }
        end
        local v2460 = true
        for v2461 = 1, #v2457 do
            for v2462 = v2461 + 1, #v2457 do
                if (v2457[v2461] - v2457[v2462]).Magnitude > v2453 then
                    v2460 = false
                    break
                end
            end
            if not v2460 then
                break
            end
        end
        local function v2463(p2464)
            local v2465 = Vector3.zero
            for v2466, v2467 in ipairs(p2464) do
                v2465 = v2465 + v2467
            end
            return v2465 / #p2464
        end
        if v2460 then
            return { v2463(v2457) }
        end
        local v2468, v2469 = v2457[1], v2457[2]
        local v2470 = 0
        for v2471 = 1, #v2457 do
            for v2472 = v2471 + 1, #v2457 do
                local v2473 = (v2457[v2471] - v2457[v2472]).Magnitude
                if v2473 > v2470 then
                    v2470 = v2473
                    v2468 = v2457[v2471]
                    v2469 = v2457[v2472]
                end
            end
        end
        local v2474, v2475 = {}, {}
        for v2476, v2477 in ipairs(v2457) do
            if (v2477 - v2468).Magnitude <= (v2477 - v2469).Magnitude then
                table.insert(v2474, v2477)
            else
                table.insert(v2475, v2477)
            end
        end
        return { v2463(v2474), v2463(v2475) }
    end
    local v2478 = {}
    local v2479 = 1
    local v2480 = os.time()
    local v2481 = 60
    local function v2482(p2483)
        if not v2478[p2483] then
            v2478[p2483] = v2454(p2483) or {}
        end
        local v2484 = v2478[p2483]
        if #v2484 == 0 then
            return nil
        end
        if #v2484 == 1 then
            return v2484[1]
        end
        if os.time() - v2480 >= v2481 then
            v2479 = v2479 % #v2484 + 1
            v2480 = os.time()
        end
        return v2484[v2479]
    end
    getgenv().GetCurrentAnchor = v2482
    local v2485 = {
        ["Ice Admiral"] = true,
        ["Awakened Ice Admiral"] = true,
        ["Saber Expert"] = true,
        ["The Gorilla King"] = true,
        Bobby = true,
        ["Mob Leader"] = true,
        ["Vice Admiral"] = true,
        Swan = true,
        ["Magma Admiral"] = true,
        ["Fishman Lord"] = true,
        Wysper = true,
        ["Thunder God"] = true,
        Cyborg = true,
        ["Don Swan"] = true,
        Greybeard = true,
        ["The Saw"] = true,
        Core = true
    }
    local function v2486()
        local v2487 = v2449.Character
        local v2488 = v2487 and v2487:FindFirstChildOfClass("Humanoid")
        if v2488 then
            local v2489 = v2488:FindFirstChildOfClass("Animator") or v2488
            local v2490, v2491 = pcall(v2489.GetPlayingAnimationTracks, v2489)
            if v2490 and v2491 then
                for v2492, v2493 in ipairs(v2491) do
                    local v2494 = v2493.Animation
                    local v2495 = v2494 and v2494.AnimationId or ""
                    local v2496 = (v2494 and v2494.Name or ""):lower()
                    local v2497 = (v2493.Name or ""):lower()
                    if v2496:find("attack") or v2496:find("slash") or v2496:find("punch") or v2496:find("swing") or v2497:find("attack") or v2497:find("slash") or v2497:find("punch") or v2497:find("swing") or v2495:find("attack") or v2495:find("combat") then
                        pcall(v2493.Stop, v2493, 0)
                    end
                end
            end
        end
    end
    local function v2498(p2499)
        if not p2499 then
            return
        end
        local v2500 = p2499:WaitForChild("Humanoid", 5)
        local v2501 = v2500 and (v2500:WaitForChild("Animator", 5) or v2500)
        if v2501 then
            v2501.AnimationPlayed:Connect(function(p2502)
                local v2503 = p2502.Animation
                local v2504 = v2503 and v2503.AnimationId or ""
                local v2505 = (v2503 and v2503.Name or ""):lower()
                local v2506 = (p2502.Name or ""):lower()
                if v2505:find("attack") or v2505:find("slash") or v2505:find("punch") or v2505:find("swing") or v2506:find("attack") or v2506:find("slash") or v2506:find("punch") or v2506:find("swing") or v2504:find("attack") or v2504:find("combat") then
                    task.defer(function()
                        pcall(p2502.Stop, p2502, 0)
                    end)
                end
            end)
        end
    end
    if v2449.Character then
        v2498(v2449.Character)
    end
    v2449.CharacterAdded:Connect(v2498)
    local function v2507()
        if CombatController and CombatController._lastMobTarget and CombatController._lastMobTarget.Parent then
            local v2508 = CombatController._lastMobTarget:FindFirstChildOfClass("Humanoid")
            if v2508 and (v2508.Health > 0) then
                local v2509 = CombatController._lastMobTarget.Name
                if not v2485[v2509] then
                    return v2509
                end
            end
        end
        local v2510 = ParseCurrentQuest and ParseCurrentQuest()
        if v2510 and (v2510 ~= "") then
            return v2510
        end
        return nil
    end
    if CombatController then
        CombatController.Grab = function(p2511)
            return
        end
    end
    local v2512 = 0
    local v2513 = 0
    if getgenv().BringConnV6 then
        pcall(function()
            getgenv().BringConnV6:Disconnect()
        end)
    end
    getgenv().BringConnV6 = v2450.Heartbeat:Connect(function()
        if _G.Stop then
            return
        end
        if v2452 and getgenv()._KaitunScriptId and (getgenv()._KaitunScriptId > v2452 + 1) then
            if getgenv().BringConnV6 then
                getgenv().BringConnV6:Disconnect()
            end
            return
        end
        if _G.ActiveMeleeQuest then
            return
        end
        local v2514 = os.clock()
        if v2514 - v2512 < 0.1 then
            return
        end
        v2512 = v2514
        local v2515 = v2449.Character and v2449.Character:FindFirstChild("HumanoidRootPart")
        if not v2515 then
            return
        end
        if v2514 - v2513 > 2 then
            v2513 = v2514
            pcall(sethiddenproperty, v2449, "SimulationRadius", math.huge)
            pcall(sethiddenproperty, v2449, "MaxSimulationRadius", math.huge)
        end
        local v2516 = IsInRaid and IsInRaid() or (CombatController and (CombatController.RaidCenter ~= nil))
        local v2517 = v2516 and CombatController and CombatController.RaidCenter and CombatController.RaidCenter.Position or (CombatController and CombatController._fixedAnchorPos) or v2515.Position
        local v2518 = v2507()
        if not v2516 and not v2518 then
            return
        end
        local v2519 = CombatController and CombatController.GetAnchorFloorY and CombatController.GetAnchorFloorY(v2517) or v2517.Y
        local v2520 = ParseCurrentQuest and (ParseCurrentQuest() ~= nil) or false
        local v2521 = v2516 and 800 or math.min(300, CombatController.GetGrabRadius(v2518, v2517, v2520))
        local v2522 = Vector3.new(v2517.X, v2519, v2517.Z)
        local v2523 = v2516 and 800 or 360
        for v2524, v2525 in pairs(workspace.Enemies:GetChildren()) do
            local v2526 = v2525:FindFirstChildOfClass("Humanoid")
            local v2527 = v2525:FindFirstChild("HumanoidRootPart")
            if v2526 and (v2526.Health > 0) and v2527 then
                local v2528 = (v2527.Position - v2517).Magnitude
                local v2529 = false
                if v2516 then
                    if v2528 <= 800 then
                        v2529 = true
                    end
                else
                    if v2485 and v2485[v2525.Name] and not (CombatController and CombatController.MobNameMatches and CombatController.MobNameMatches(v2525.Name, v2518)) then
                        continue
                    end
                    v2529 = v2525.Name == v2518 or (CombatController and CombatController.MobNameMatches and CombatController.MobNameMatches(v2525.Name, v2518))
                end
                if v2529 then
                    local v2530 = v2525:GetAttribute("OldPosition")
                    if not v2530 and v2527 then
                        v2530 = v2527.Position
                        v2525:SetAttribute("OldPosition", v2530)
                    end
                    local v2531 = v2530 and (v2530 - v2517).Magnitude or v2528
                    local v2532 = (v2527.Position - v2515.Position).Magnitude
                    if v2528 <= v2521 and (v2532 <= v2523 or v2516) and (v2516 or v2531 <= v2521 + 50) then
                        do
                            if v2526.PlatformStand then
                                v2526.PlatformStand = false
                            end
                            if v2526.WalkSpeed ~= 0 then
                                v2526.WalkSpeed = 0
                            end
                            if v2526.JumpPower ~= 0 then
                                v2526.JumpPower = 0
                            end
                            if v2527.CanCollide then
                                v2527.CanCollide = false
                            end
                            if not v2525:GetAttribute("KaitunLowPhysics") then
                                v2525:SetAttribute("KaitunLowPhysics", true)
                                for v2533, v2534 in ipairs(v2525:GetDescendants()) do
                                    if v2534:IsA("BasePart") then
                                        v2534.CanCollide = false
                                    end
                                end
                            end
                            local v2535 = v2527:FindFirstChild("FarmingPosition")
                            if not v2535 then
                                v2535 = Instance.new("BodyPosition")
                                v2535.Name = "FarmingPosition"
                                v2535.MaxForce = Vector3.new(1000000, 1000000, 1000000)
                                v2535.P = 20000
                                v2535.D = 1250
                                v2535.Parent = v2527
                            end
                            if v2535.P ~= 20000 then
                                v2535.P = 20000
                            end
                            if v2535.D ~= 1250 then
                                v2535.D = 1250
                            end
                            if (v2535.Position - v2522).Magnitude > 0.5 then
                                v2535.Position = v2522
                            end
                            local v2536 = v2527:FindFirstChild("FarmingVelocity")
                            if v2536 then
                                v2536:Destroy()
                            end
                            local v2537 = (Vector2.new(v2527.Position.X, v2527.Position.Z) - Vector2.new(v2522.X, v2522.Z)).Magnitude
                            if v2537 > 6 then
                                v2527.CFrame = CFrame.new(v2522)
                                v2527.Velocity = Vector3.zero
                            end
                        end
                    end
                end
            end
        end
    end)
    task.spawn(function()
        local v2538 = v2451.Remotes
        local function v2539(p2540, p2541)
            local v2542, v2543
            if p2541 ~= nil then
                v2542, v2543 = pcall(function()
                    return v2538.CommF_:InvokeServer(p2540, p2541)
                end)
            else
                v2542, v2543 = pcall(function()
                    return v2538.CommF_:InvokeServer(p2540)
                end)
            end
            print("[BUY] " .. p2540 .. " res=" .. tostring(v2543))
        end
        local v2544 = { "Black Leg", "Electro", "Fishman Karate" }
        for v2545, v2546 in ipairs(v2544) do
            local v2547 = v2449.Backpack:FindFirstChild(v2546) or (v2449.Character and v2449.Character:FindFirstChild(v2546))
            if v2547 and v2449.Character then
                v2449.Character.Humanoid:EquipTool(v2547)
                break
            end
        end
    end)
    print("[V6] Anchors+Pin+FA live. id=" .. tostring(v2452 or "0"))
end)()
boost = false
if false then
    boost = true
    local v2548 = workspace:FindFirstChildOfClass("Terrain")
    local v2549 = game:GetService("RunService")
    local v2550 = game:GetService("MaterialService")
    local v2551 = game:GetService("CollectionService")
    local function v2552(p2553, p2554)
        pcall(function()
            if setfflag then
                setfflag(p2553, tostring(p2554))
            end
        end)
    end
    v2552("DFFlagTextureQualityOverride", 1)
    v2552("FIntRenderShadowMapRes", 0)
    v2552("FFlagRenderShadowIntensity", 0)
    v2552("FIntRenderMultisampleSamples", 1)
    v2552("FFlagRenderTerrainDecoration", "False")
    v2552("FIntRenderResolutionScale", 50)
    pcall(function()
        local v2555 = v2549.Rendering
        v2555.QualityLevel = Enum.QualityLevel.Level01
        v2555.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level04
        v2555.GraphicsMode = false
        local v2556 = v2549.Physics
        v2556.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Alwayss
        local v2557 = v2549:GetService("RenderSettings")
        if v2557 then
            v2557.EagerBulkExecution = false
        end
        local v2558 = UserSettings():GetService("UserGameSettings")
        v2558.SavedQualityLevel = 1
    end)
    if v2548 then
        pcall(function()
            v2548.WaterWaveSize = 0
            v2548.WaterWaveSpeed = 0
            v2548.WaterTransparency = 1
        end)
        local v2559 = Vector3.new
        if not flag3 then
            return
        end
        for v2560, v2561 in ipairs(Enum.Material:GetEnumItems()) do
            pcall(function()
                v2548:SetMaterialColor(v2561, color)
            end)
        end
    end
    pcall(function()
        for v2562, v2563 in ipairs(v2550:GetChildren()) do
            v2563:Destroy()
        end
    end)
    pcall(function()
        for v2564, v2565 in ipairs(v2551:GetTagged("Emitters")) do
            if v2565:GetAttribute("EmitCount") then
                v2565:SetAttribute("EmitCount", 0)
            end
        end
    end)
    pcall(function()
        gcinfo("collect")
    end)
    local v2566 = getgenv and getgenv() or _G
    local v2567 = "ClientFPSBoost"
    local v2568 = 300
    local v2569 = 0.03
    local v2570 = v2566[v2567]
    if type(v2570) == "table" and (type(v2570.Cancel) == "function") then
        pcall(v2570.Cancel, v2570, "re-executed")
    end
    local v2571 = game:GetService("Workspace")
    local v2572 = game:GetService("Lighting")
    local v2573 = {
        Active = true,
        Running = false,
        Done = false,
        Reason = nil,
        Stats = { Scanned = 0, Changed = 0, Destroyed = 0, Errors = 0 }
    }
    v2566[v2567] = v2573
    local function v2574(p2575, p2576, p2577)
        local v2578 = pcall(function()
            p2575[p2576] = p2577
        end)
        if not v2578 then
            v2573.Stats.Errors = v2573.Stats.Errors + 1
        end
        return v2578
    end
    local function v2579(p2580)
        local v2581 = pcall(p2580.Destroy, p2580)
        if v2581 then
            v2573.Stats.Destroyed = v2573.Stats.Destroyed + 1
        else
            v2573.Stats.Errors = v2573.Stats.Errors + 1
        end
        return v2581
    end
    local function v2582()
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        end)
        pcall(function()
            settings().Rendering.EditQualityLevel = Enum.QualityLevel.Level01
        end)
        pcall(function()
            if sethiddenproperty then
                sethiddenproperty(v2572, "Technology", Enum.Technology.Compatibility)
            end
        end)
        v2574(v2572, "GlobalShadows", false)
        v2574(v2572, "Brightness", -1)
        v2574(v2572, "EnvironmentDiffuseScale", 0)
        v2574(v2572, "EnvironmentSpecularScale", 0)
        v2574(v2572, "ExposureCompensation", 0)
        v2574(v2572, "FogStart", 9000000000)
        v2574(v2572, "FogEnd", 9000000000)
        v2574(v2572, "ShadowSoftness", 0)
        v2574(v2571, "GlobalWind", Vector3.zero)
        local v2583 = v2571:FindFirstChildOfClass("Terrain")
        if v2583 then
            v2574(v2583, "WaterWaveSize", 0)
            v2574(v2583, "WaterWaveSpeed", 0)
            v2574(v2583, "WaterReflectance", 0)
            v2574(v2583, "WaterTransparency", 1)
        end
        pcall(function()
            local v2584 = game:GetService("Players").LocalPlayer
            local v2585 = v2584 and v2584:FindFirstChild("PlayerGui")
            local v2586 = v2585 and v2585:FindFirstChild("Main") and v2585.Main:FindFirstChild("SettingsMenu") and v2585.Main.SettingsMenu:FindFirstChild("Content") and v2585.Main.SettingsMenu.Content:FindFirstChild("ScrollingFrame")
            if v2586 then
                local function v2587(p2588)
                    if not p2588 then
                        return
                    end
                    pcall(firesignal, p2588.Activated)
                    pcall(firesignal, p2588.MouseButton1Click)
                end
                local v2589 = v2586:FindFirstChild("FastMode")
                if v2589 and v2589:FindFirstChild("SecondButton") and (v2589.SecondButton.BackgroundColor3.R > 0.8) then
                    v2587(v2589.FirstButton)
                end
                local v2590 = v2586:FindFirstChild("DamageCounter")
                if v2590 and v2590:FindFirstChild("FirstButton") and (v2590.FirstButton.BackgroundColor3.G > 0.7) then
                    v2587(v2590.SecondButton)
                end
                local v2591 = v2586:FindFirstChild("CameraShake")
                if v2591 and v2591:FindFirstChild("FirstButton") and (v2591.FirstButton.BackgroundColor3.G > 0.7) then
                    v2587(v2591.SecondButton)
                end
                local v2592 = v2586:FindFirstChild("AllyVFX")
                if v2592 and v2592:FindFirstChild("FirstButton") and (v2592.FirstButton.BackgroundColor3.G > 0.7) then
                    v2587(v2592.SecondButton)
                end
                local v2593 = v2586:FindFirstChild("ReduceMotion")
                if v2593 and v2593:FindFirstChild("SecondButton") and (v2593.SecondButton.BackgroundColor3.R > 0.8) then
                    v2587(v2593.FirstButton)
                end
            end
        end)
    end
    task.spawn(function()
        while true do
            task.wait(10)
            pcall(v2582)
        end
    end)
    local v2594 = {
        ParticleEmitter = true,
        Trail = true,
        Beam = true,
        Fire = true,
        Smoke = true,
        Sparkles = true,
        PointLight = true,
        SpotLight = true,
        SurfaceLight = true,
        Highlight = true,
        SelectionBox = true
    }
    local v2595 = {
        Atmosphere = true,
        BloomEffect = true,
        BlurEffect = true,
        Clouds = true,
        ColorCorrectionEffect = true,
        DepthOfFieldEffect = true,
        SunRaysEffect = true,
        SurfaceAppearance = true
    }
    local function v2596(p2597)
        if not v2573.Active or not p2597 or not p2597.Parent then
            return
        end
        v2573.Stats.Scanned = v2573.Stats.Scanned + 1
        local v2598 = p2597.ClassName
        local v2599 = false
        if p2597:IsA("BasePart") then
            v2599 = v2574(p2597, "Material", Enum.Material.SmoothPlastic) or v2599
            v2599 = v2574(p2597, "Reflectance", 0) or v2599
            v2599 = v2574(p2597, "CastShadow", false) or v2599
            if v2598 == "MeshPart" then
                v2599 = v2574(p2597, "TextureID", "") or v2599
            end
        elseif v2598 == "SpecialMesh" then
            v2599 = v2574(p2597, "TextureId", "") or v2599
        elseif v2594[v2598] then
            v2599 = v2574(p2597, "Enabled", false) or v2599
        elseif v2595[v2598] then
            v2579(p2597)
            return
        elseif v2598 == "Sky" and p2597:IsDescendantOf(v2572) then
            v2579(p2597)
            return
        elseif v2598 == "Explosion" then
            v2599 = v2574(p2597, "Visible", false) or v2599
        end
        if v2599 then
            v2573.Stats.Changed = v2573.Stats.Changed + 1
        end
    end
    v2573.Cancel = function(p2600, p2601)
        p2600.Active = false
        p2600.Running = false
        p2600.Reason = p2601 or "cancelled"
    end
    v2573.Apply = function(p2602)
        if p2602.Running then
            return false
        end
        p2602.Active = true
        p2602.Running = true
        p2602.Done = false
        p2602.Reason = nil
        v2582()
        task.spawn(function()
            local v2603 = {}
            pcall(function()
                for v2604, v2605 in ipairs(workspace:GetDescendants()) do
                    v2603[#v2603 + 1] = v2605
                end
            end)
            pcall(function()
                for v2606, v2607 in ipairs(v2572:GetDescendants()) do
                    v2603[#v2603 + 1] = v2607
                end
            end)
            local v2608 = 0
            for v2609 = 1, #v2603 do
                if not p2602.Active or v2566[v2567] ~= p2602 then
                    p2602.Running = false
                    return
                end
                local v2610 = pcall(v2596, v2603[v2609])
                if not v2610 then
                    p2602.Stats.Errors = p2602.Stats.Errors + 1
                end
                v2608 = v2608 + 1
                if v2608 >= v2568 then
                    v2608 = 0
                    task.wait(v2569)
                end
            end
            p2602.Running = false
            p2602.Done = true
            print(string.format("[ClientFPSBoost] Done | scanned=%d changed=%d destroyed=%d errors=%d cap=%d", p2602.Stats.Scanned, p2602.Stats.Changed, p2602.Stats.Destroyed, p2602.Stats.Errors))
        end)
        return true
    end
    v2573:Apply()
    local v2611 = game.Workspace
    local v2612 = game.Lighting
    local v2613 = v2611.Terrain
    v2613.WaterWaveSize = 0
    v2613.WaterWaveSpeed = 0
    v2613.WaterReflectance = 0
    v2613.WaterTransparency = 0
    v2612.GlobalShadows = false
    v2612.FogEnd = 9000000000
    v2612.Brightness = 0
end
local v2614 = game:GetService("Lighting")
local v2615 = game:GetService("HttpService")
local v2616 = game:GetService("Players")
local v2617 = "https://memaybeo.kurinian-hub.xyz"
local v2618 = getgenv and getgenv() or _G
local function v2619()
    local v2620 = game:GetService("HttpService")
    local v2621 = getgenv and getgenv() or _G
    local v2622 = {}
    v2622.Request = function(p2623, p2624, p2625, p2626)
        if type(p2623) ~= "string" or not p2623:match("^https://") then
            return nil, "HTTPS API URL required"
        end
        local v2627 = "92b62b279e2d9869c739467fcfb54d01e5f35253c3f8e659cc4eaead65cf46de"
        if type(v2627) ~= "string" or #v2627 < 32 then
            return nil, "Set HopApiKey first"
        end
        local v2628 = syn and syn.request or http_request or request or (http and http.request)
        if type(v2628) ~= "function" then
            return nil, "HTTP request unavailable"
        end
        local v2629 = {
            Url = p2623:gsub("/+$", "") .. p2625,
            Method = p2624,
            Headers = { ["Content-Type"] = "application/json", Authorization = "Bearer " .. v2627 }
        }
        if p2626 then
            v2629.Body = v2620:JSONEncode(p2626)
        end
        local v2630, v2631 = pcall(v2628, v2629)
        if not v2630 or type(v2631) ~= "table" then
            return nil, "API request failed"
        end
        if tonumber(v2631.StatusCode) ~= 200 then
            return nil, "API HTTP " .. tostring(v2631.StatusCode)
        end
        local v2632, v2633 = pcall(v2620.JSONDecode, v2620, v2631.Body)
        if not v2632 or type(v2633) ~= "table" then
            return nil, "Invalid API response"
        end
        return v2633
    end
    v2622.Decode = function(p2634, p2635)
        if type(p2635) ~= "string" or #p2635 > 512 or not p2635:match("^JID1%.[%w_-]+$") then
            return nil, "Invalid encoded Job ID"
        end
        local v2636, v2637 = v2622.Request(p2634, "POST", "/api/job-id/decode", { token = p2635 })
        if not v2636 then
            return nil, v2637
        end
        local v2638 = v2636.jobId
        if type(v2638) ~= "string" or #v2638 ~= 36 or not v2638:match("^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") then
            return nil, "Invalid decoded Job ID"
        end
        return v2638
    end
    v2622.Encode = function(p2639, p2640)
        local v2641, v2642 = v2622.Request(p2639, "POST", "/api/job-id/encode", { jobId = p2640 })
        if not v2641 then
            return nil, v2642
        end
        return v2641.token
    end
    v2621.JobIdCodec = v2622
    return v2622
end
local v2643 = v2618.JobIdCodec or v2619()
local v2644 = v2618.HopApiBaseUrl or v2617:gsub("/api/bloxfruit/$", "")
local function v2645(p2646)
    return string.lower((tostring(p2646):gsub("%s+", "")))
end
local function v2647(p2648)
    return workspace.Enemies:FindFirstChild(p2648) or game:GetService("ReplicatedStorage"):FindFirstChild(p2648)
end
GetPirateRaidMob = function()
    local v2649 = Vector3.new(-5545.9873046875, 314.0802307128906, -2964.34912109375)
    for v2650, v2651 in ipairs({ workspace.Enemies, game:GetService("ReplicatedStorage") }) do
        for v2652, v2653 in ipairs(v2651:GetChildren()) do
            if v2653:FindFirstChild("HumanoidRootPart") and v2653:IsA("Model") and ((v2653.HumanoidRootPart.Position - v2649).Magnitude <= 1000) and not v2653:GetAttribute("IsBoss") then
                return v2653
            end
        end
    end
    return nil
end
checkSea = function(p2654)
    local v2655 = workspace:GetAttribute("MAP")
    if not v2655 then
        return false
    end
    return p2654 == tonumber(v2655:match("%d+"))
end
local v2657 = newcclosure(function()
    local v2656 = checkSea(3) and (game.Lighting:FindFirstChild("Sky") and game.Lighting.Sky.MoonTextureId or (game.Lighting:FindFirstChild("Space_Skybox") and game.Lighting.Space_Skybox.MoonTextureId)) or ""
    v2656 = v2656:gsub("rbxassetid://", "http://www.roblox.com/asset/?id=")
    return ({
        ["http://www.roblox.com/asset/?id=15493317929"] = "Blue Moon",
        ["http://www.roblox.com/asset/?id=9709149431"] = "8/8",
        ["http://www.roblox.com/asset/?id=9709149052"] = "7/8",
        ["http://www.roblox.com/asset/?id=9709143733"] = "6/8",
        ["http://www.roblox.com/asset/?id=9709150401"] = "5/8",
        ["http://www.roblox.com/asset/?id=9709135895"] = "4/8",
        ["http://www.roblox.com/asset/?id=9709150086"] = "2/8",
        ["http://www.roblox.com/asset/?id=9709139597"] = "1/8",
        ["http://www.roblox.com/asset/?id=9709149680"] = "0/8"
    })[v2656] or "nil"
end)
local v2659 = newcclosure(function()
    local v2658 = game.Lighting:GetAttribute("MoonPhase")
    if not v2658 then
        return "Unknown"
    end
    if v2658 == 5 and not v2618.isfmended then
        return "Full Moon"
    end
    return "Normal"
end)
local v2660 = 30
local function v2661(p2662, p2663)
    local v2664, v2665 = v2643.Request(v2644, "POST", "/api/bloxfruit/" .. v2645(p2662), p2663)
    if not v2664 then
        warn("POST failed: " .. tostring(v2665))
    end
end
local function v2666()
    local v2667 = #v2616:GetPlayers()
    local function v2668()
        return {
            jobid = game.JobId,
            players = v2667,
            placeid = game.PlaceId,
            sea = tonumber(tostring(workspace:GetAttribute("MAP") or ""):match("(%d+)"))
        }
    end
    local v2669 = { "Diablo", "Urban", "Deandre" }
    local v2670 = {
        ["rip_indra True Form"] = "RipIndra",
        ["Dough King"] = "DoughKing",
        ["Cake Prince"] = "CakePrince",
        ["Soul Reaper"] = "SoulReaper",
        ["Cursed Captain"] = "CursedCaptain"
    }
    for v2671, v2672 in ipairs(v2669) do
        if v2647(v2672) then
            v2661("Elite", v2668())
            break
        end
    end
    for v2673, v2674 in pairs(v2670) do
        if v2647(v2673) then
            v2661(v2674, v2668())
        end
    end
    if GetPirateRaidMob() then
        v2661("RaidCastle", v2668())
    end
    if workspace.Map:FindFirstChild("MysticIsland") then
        v2661("Mirage", v2668())
    end
    if v2657() == "8/8" and (v2659() == "Full Moon") then
        local v2675 = workspace:GetAttribute("MAP")
        local v2676 = v2675 and tonumber(v2675:match("%d+")) or 3
        local v2677 = workspace.DistributedGameTime
        local v2678 = math.floor(v2677 / 3600)
        local v2679 = math.floor(v2677 % 3600 / 60)
        local v2680 = math.floor(v2677 % 60)
        local v2681 = string.format("%d:%02d:%02d", v2678, v2679, v2680)
        v2661("FullMoon", {
            jobid = game.JobId,
            placeid = game.PlaceId,
            players = v2667,
            maxplayers = v2616.MaxPlayers,
            sea = v2676,
            moon = "Full Moon",
            age = v2681
        })
    end
end
task.spawn(function()
    while true do
        local v2682, v2683 = pcall(v2666)
        if not v2682 then
            warn(" postDataIntoServer lỗi: " .. tostring(v2683))
        end
        task.wait(v2660)
    end
end)
webhook = function()
    local v2684
    if (getgenv().Config and getgenv().Config.Webhook and getgenv().Config.Webhook.Url or "") == "" then
        return
    end
    local function v2685(p2686)
        local v2687 = "None"
        pcall(function()
            for v2688, v2689 in ipairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v2689:IsA("Tool") and (v2689.ToolTip == p2686 or (p2686 == "Melee" and (v2689.Name == "Combat"))) then
                    v2687 = v2689.Name
                end
            end
            if game.Players.LocalPlayer.Character then
                for v2690, v2691 in ipairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v2691:IsA("Tool") and (v2691.ToolTip == p2686 or (p2686 == "Melee" and (v2691.Name == "Combat"))) then
                        v2687 = v2691.Name
                    end
                end
            end
        end)
        return v2687
    end
    local v2692 = v2685("Melee")
    local v2693 = v2685("Sword")
    local v2694 = v2685("Gun")
    local v2695 = v2685("Blox Fruit")
    local v2696 = getgenv().Config and getgenv().Config.Webhook and getgenv().Config.Webhook.Url or ""
    local v2697 = {
        username = "Vape Hub - Best Kaitun Script",
        avatar_url = "https://cdn.discordapp.com/attachments/1537499433573289984/1539678659680669716/58f149e9bf546c78ab84e78fcc3ec0c4.png?ex=6a8730fe&is=6a85df7e&hm=e8979c1e11e0e36c84cd550346d8e55d22c3078228149c83b60b2139c0aa170d&",
        embeds = {
            {
                title = "Kaitun Blox Fruit",
                description = "Name : " .. game.Players.LocalPlayer.Name,
                color = 11986679,
                fields = {
                    {
                        name = " Levels ",
                        value = "```" .. tostring(game.Players.LocalPlayer.Data.Level.Value) .. "```",
                        inline = false
                    },
                    {
                        name = " Beli ",
                        value = "```" .. tostring(game.Players.LocalPlayer.Data.Beli.Value) .. "```",
                        inline = false
                    },
                    {
                        name = " Fragments ",
                        value = "```" .. tostring(game.Players.LocalPlayer.Data.Fragments.Value) .. "```",
                        inline = false
                    },
                    {
                        name = " Sea ",
                        value = "```" .. tostring(GetSea()) .. "```",
                        inline = false
                    },
                    {
                        name = " Race ",
                        value = "```" .. tostring(game.Players.LocalPlayer.Data.Race.Value) .. "```",
                        inline = false
                    },
                    { name = " Melee ", value = "```" .. v2692 .. "```", inline = true },
                    { name = " Sword ", value = "```" .. v2693 .. "```", inline = true },
                    { name = " Gun ", value = "```" .. v2694 .. "```", inline = true },
                    { name = " Fruit ", value = "```" .. v2695 .. "```", inline = true }
                },
                footer = {
                    text = " https://discord.gg/NKUKRhUFNa  | " .. os.date("%H:%M:%S %d/%m/%Y")
                }
            }
        }
    }
    pcall(function()
        local v2698 = game:GetService("HttpService"):JSONEncode(v2697)
        local v2699 = syn and syn.request or http_request or request or (http and http.request)
        if not v2699 then
            warn(" Executor không có request() -> không gửi được webhook")
            return
        end
        local v2700, v2701 = pcall(function()
            return v2699({
                Url = v2696,
                Method = "POST",
                Headers = { ["Content-Type"] = "application/json" },
                Body = v2698
            })
        end)
        if v2700 then
        else
            warn(" Webhook error: " .. tostring(v2701))
        end
    end)
end
task.spawn(function()
    while task.wait(120) do
        local v2702, v2703 = pcall(webhook)
        if not v2702 then
            warn("⚠️ webhook lỗi: " .. tostring(v2703))
        end
    end
end)
task.spawn(function()
    while task.wait(0.5) do
        local v2704 = game:GetService("ReplicatedStorage")
        pcall(function()
            local v2705 = {
                { Context = "Purchase", BoxName = "ZiolesGacha" }
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/GachaNetworkRF"):InvokeServer(unpack(v2705))
            task.wait(1)
            if StoreLooseFruits then
                StoreLooseFruits()
            end
        end)
        task.wait(3600 * 2)
    end
end)
task.spawn(function()
    pcall(function()
        repeat
            task.wait(0.5)
        until game:IsLoaded() and game.Players.LocalPlayer and game.Players.LocalPlayer.Character
        local v2706 = game:GetService("ReplicatedStorage")
        local v2707 = v2706:WaitForChild("Remotes", 20)
        local v2708 = v2707 and v2707:WaitForChild("Redeem", 20)
        if not v2708 then
            return
        end
        local v2709 = {
            "SUB2GAMERROBOT_EXP1",
            "Sub2CaptainMaui",
            "Sub2Fer999",
            "Enyu_is_Pro",
            "Magicbus",
            "JCWK",
            "Starcodeheo",
            "Bluxxy",
            "kittgaming",
            "Axiore",
            "Sub2Daigrock",
            "Sub2NoobMaster123",
            "Sub2OfficialNoobie",
            "StrawHatMaine",
            "TheGreatAce",
            "TantaiGaming",
            "EASTEREXP",
            "KITT_RESET",
            "SUB2GAMERROBOT_RESET1",
            "Sub2UncleKizaru",
            "Bignews",
            "Fudd10",
            "fudd10_v2",
            "Chandler"
        }
        for v2710, v2711 in ipairs(v2709) do
            pcall(function()
                local v2712 = v2708:InvokeServer(v2711)
                if v2712 and (v2712 ~= "") then
                    print("[Startup Redeem] " .. v2711 .. " -> " .. tostring(v2712))
                end
            end)
            task.wait(0.2)
        end
        warn("[Kaitun] Startup promo codes redeemed successfully!")
    end)
end)
pcall(function()
    if FunctionsHandler and FunctionsHandler.ExpRedeem and FunctionsHandler.ExpRedeem.Initalized then
        FunctionsHandler.ExpRedeem.Methods.Start:Call()
    end
end)
if Config and Config.Fruit and Config.Fruit.BuyInShop and type(Config.Fruit.Fruit) == "table" and not table.find(Config.Fruit.Fruit, game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
    for v2713, v2714 in pairs(Remotes.CommF_:InvokeServer("GetFruits", true)) do
        if v2714.OnSale and v2714.Name and table.find(Config.Fruit.Fruit, v2714.Name) and (ScriptStorage.PlayerData.Beli > v2714.Price) then
            Remotes.CommF_:InvokeServer("PurchaseRawFruit", v2714.Name)
            Remotes.CommF_:InvokeServer("PurchaseRawFruit", true, v2714.Name)
        end
    end
end
