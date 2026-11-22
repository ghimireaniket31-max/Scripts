local v1 = ""
local v2 = syn and syn.request or http_request or request or (http and http.request)
local function v3(p4, p5)
    if type(v2) ~= "function" or type(p4) ~= "string" or p4 == "" then
        return false
    end
    local v6, v7 = pcall(function()
        return v2({
            Url = p4,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = game:GetService("HttpService"):JSONEncode(p5)
        })
    end)
    local v8 = v6 and (type(v7) == "table") and tonumber(v7.StatusCode or v7.Status)
    if not v8 or v8 < 200 or v8 >= 300 then
        warn("[Vape Hub] Progress webhook failed (HTTP " .. tostring(v8 or "unavailable") .. ")")
        return false
    end
    return true
end
do
    local v9 = getgenv()
    local v10 = 4
    local v11 = v9.VapeHunterCapeController
    if not v11 or v11.Version ~= v10 then
        if v11 then
            v11.equipped = false
        end
        local v12 = { Version = v10, equipped = false, nextInventory = 0, nextEquip = 0 }
        local v13 = {
            ["Pilot Helmet"] = 130,
            ["Hunter Cape (Black)"] = 80,
            ["Hunter Cape (Green)"] = 80,
            ["Hunter Cape (Red)"] = 80,
            ["Bandanna (Black)"] = 80,
            ["Bandanna (Green)"] = 80,
            ["Bandanna (Red)"] = 80,
            ["Dojo Belt (Black)"] = 80,
            ["Headband (Black)"] = 70,
            ["Dojo Belt (Red)"] = 60,
            ["Headband (Red)"] = 60,
            ["Jaw Shield"] = 50,
            ["Pretty Helmet"] = 50,
            ["Shark Tooth Necklace"] = 50,
            ["Tooth Necklace"] = 50,
            ["Dino Hood"] = 50,
            ["Easter Bunny Cape"] = 50,
            ["Frosty Helmet"] = 50,
            ["Dojo Belt (Purple)"] = 40,
            ["Headband (Purple)"] = 40,
            ["Ghoul Mask"] = 35,
            ["Dojo Belt (Blue)"] = 30,
            ["Headband (Blue)"] = 30,
            ["Santa Hat"] = 30,
            ["Kitsune Ribbon"] = 30,
            ["Divine Cloak"] = 30,
            ["Oni Helmet"] = 30,
            ["Swan Glasses"] = 25,
            ["Feathered Visage"] = 25,
            ["Dojo Belt (Green)"] = 20,
            ["Headband (Green)"] = 20,
            ["Elf Hat"] = 20,
            ["Peppermint Helmet"] = 20,
            ["Pumpkin Mask"] = 20,
            ["Red Ribbon"] = 20,
            ["Cool Shades"] = 17.5,
            ["Dojo Belt (Yellow)"] = 15,
            ["Dojo Belt (Orange)"] = 15,
            ["Headband (Yellow)"] = 15,
            ["Headband (Orange)"] = 15,
            ["Cupid's Top Hat"] = 14,
            ["Romantic Bouquet"] = 14,
            ["Dojo Belt (White)"] = 10,
            ["Headband (White)"] = 10
        }
        local v14, v15 = {}, v13
        for v16 in pairs(v13) do
            table.insert(v14, v16)
        end
        table.sort(v14, function(p17, p18)
            if v13[p17] == v13[p18] then
                local v19, v20 = p17:find("Hunter Cape", 1, true), p18:find("Hunter Cape", 1, true)
                if v19 ~= nil ~= (v20 ~= nil) then
                    return v19 ~= nil
                end
                return p17 < p18
            end
            return v13[p17] > v13[p18]
        end)
        v12.Bonuses = v13
        local v21, v22, v23
        v9.VapeHunterCapeController = v12
        v9.VapeHunterTweenSpeed = function(p24)
            return v12.equipped and 325 or p24
        end
        local function v25(p26)
            local v27 = game:GetService("ReplicatedStorage")
            local v28 = v27:FindFirstChild("ItemReplicationService")
            local v29 = v27:FindFirstChild("ItemConfig")
            if not v28 or not v29 or not v28:FindFirstChild("KEYS") then
                return nil
            end
            v21 = v21 or require(v28)
            v22 = v22 or require(v28.KEYS)
            v23 = v23 or require(v29)
            if v21.IsInitialized == false then
                return nil
            end
            local v30, v31 = pcall(function()
                return v21:GetItems(v22.QUANTITY)
            end)
            if not v30 or type(v31) ~= "table" or next(v31) == nil then
                local v32 = v21._UserCache or v21.UserCache
                local v33 = v32 and v32[p26.UserId]
                if v33 then
                    v31 = v33:GetItems(v22.QUANTITY)
                end
            end
            if type(v31) ~= "table" then
                return nil
            end
            local v34 = {}
            for v35, v36 in pairs(v31) do
                if v36.ItemId and ((tonumber(v36.Value) or 0) > 0) then
                    local v37, v38 = pcall(function()
                        return v23.match(v36.ItemId):unwrap()
                    end)
                    if v37 and v38 then
                        local v39, v40 = v38.Index or {}, v38.Display or {}
                        for v41, v42 in pairs({ v39.DebugLabel, v39.StorageKey, v40.Name }) do
                            if type(v42) == "string" then
                                local v43 = v42:gsub("%s*%[.-%]%s*$", "")
                                if v15[v43] then
                                    v34[v43] = v36
                                end
                            end
                        end
                    end
                end
            end
            for v44, v45 in ipairs(v14) do
                if v34[v45] then
                    return v45, v34[v45]
                end
            end
        end
        local function v46()
            local v47 = game:GetService("Players").LocalPlayer
            local v48 = v47 and v47.Character
            local v49 = v48 and v48:FindFirstChildOfClass("Humanoid")
            v12.equipped = false
            if not v49 or v49.Health <= 0 then
                return
            end
            local v50
            for v51, v52 in ipairs(v48:GetChildren()) do
                if v15[v52.Name] and not v52:IsA("Tool") or (v52:IsA("StringValue") and v15[v52.Value]) then
                    local v53 = v15[v52.Name] and v52.Name or v52.Value
                    if not v50 or v13[v53] > v13[v50] then
                        v50 = v53
                    end
                end
            end
            local v54 = v47:FindFirstChild("Data")
            local v55 = v54 and v54:FindFirstChild("Accessory")
            if v55 and v55:IsA("StringValue") and v15[v55.Value] then
                v50 = v55.Value
            end
            local v56 = game:GetService("ReplicatedStorage")
            local v57 = v56:FindFirstChild("ItemReplicationService")
            local v58 = v56:FindFirstChild("ItemConfig")
            if v57 and v58 and v57:FindFirstChild("KEYS") then
                v21 = v21 or require(v57)
                v22 = v22 or require(v57.KEYS)
                v23 = v23 or require(v58)
                if v21.IsInitialized ~= false then
                    local v59 = v21._UserCache or v21.UserCache
                    local v60 = v59 and v59[v47.UserId]
                    local v61 = v60 and v60:GetItems(v22.IS_EQUIPPED) or v21:GetItems(v22.IS_EQUIPPED)
                    for v62, v63 in pairs(v61 or {}) do
                        if v63.Value == true then
                            local v64, v65 = pcall(function()
                                return v23.match(v63.ItemId):unwrap()
                            end)
                            local v66 = v64 and v65 and v65.Index and v65.Index.StorageKey
                            if v66 and v15[v66] and (not v50 or v13[v66] > v13[v50]) then
                                v50 = v66
                            end
                        end
                    end
                end
            end
            v12.equipped = v50 ~= nil
            v12.Accessory = v50
            v12.MovementBonus = v50 and v13[v50] or 0
            v12.LastError = nil
            if os.clock() < v12.nextEquip then
                return
            end
            local v67 = v47:FindFirstChild("Backpack")
            for v68, v69 in ipairs(v14) do
                local v70 = v67 and v67:FindFirstChild(v69) or v48:FindFirstChild(v69)
                if v70 and v70:IsA("Tool") and (not v50 or v13[v69] > v13[v50]) then
                    v12.nextEquip = os.clock() + 3
                    v49:EquipTool(v70)
                    return
                end
            end
            if os.clock() < v12.nextInventory then
                return
            end
            v12.nextInventory = os.clock() + 5
            local v71, v72 = v25(v47)
            if v9.VapeHunterCapeController ~= v12 or v47.Character ~= v48 then
                return
            end
            v12.OwnedCape = v71
            if not v71 or (v50 and (v13[v71] <= v13[v50])) then
                return
            end
            local v73 = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
            local v74 = v73 and v73:FindFirstChild("CommF_")
            if not v74 then
                return
            end
            v12.nextEquip = os.clock() + 3
            local v75 = v72 and v72.NetworkedUID
            v12.OwnedUID = v75
            v12.LastEquipResult = v74.InvokeServer(v74, "LoadItem", v75 or v71)
        end
        task.spawn(function()
            local v76 = setthreadidentity or setidentity or set_thread_identity
            if v76 then
                pcall(v76, 2)
            end
            while v9.VapeHunterCapeController == v12 do
                local v77, v78 = pcall(v46)
                if not v77 then
                    v12.equipped = false
                    v12.LastError = tostring(v78)
                end
                task.wait(1)
            end
        end)
    end
end
repeat
    task.wait(0.25)
until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
local v79 = game.Players.LocalPlayer
while not v79.Character do
    local v80 = v79.PlayerGui:FindFirstChild("Main (minimal)") or v79.PlayerGui:FindFirstChild("Main")
    local v81 = v80 and v80:FindFirstChild("ChooseTeam")
    local v82 = v81 and v81:FindFirstChild("Container")
    local v83 = v82 and v82:FindFirstChild(getgenv().Team == "Marines" and "Marines" or "Pirates")
    local v84 = v83 and v83:FindFirstChild("Frame")
    local v85 = v84 and v84:FindFirstChild("TextButton")
    if v85 and (type(firesignal) == "function") then
        pcall(firesignal, v85.Activated)
    end
    task.wait(1)
end
repeat
    task.wait(0.25)
until v79.Character:FindFirstChild("HumanoidRootPart") and v79:FindFirstChild("DataLoaded")
getgenv().Isrunning = true
if getgenv().Loaded then
    return
end
do
    local v86 = getgenv()
    local v87 = game:GetService("RunService")
    local v88 = "AutoBountyTargetCamera"
    v87:UnbindFromRenderStep(v88)
    if v86.AutoBountyCameraLock == nil then
        v86.AutoBountyCameraLock = true
    end
    v87:BindToRenderStep(v88, Enum.RenderPriority.Camera.Value + 1, function()
        if not v86.AutoBountyCameraLock then
            return
        end
        local v89 = v86.CurrentTarget
        local v90 = game:GetService("Players").LocalPlayer
        local v91 = v89 and v89.Parent and v89.Character
        local v92 = v91 and v91:FindFirstChildOfClass("Humanoid")
        local v93 = v91 and (v91:FindFirstChild("Head") or v91:FindFirstChild("HumanoidRootPart"))
        local v94 = v90.Character and v90.Character:FindFirstChildOfClass("Humanoid")
        local v95 = workspace.CurrentCamera
        if v89 == v90 or not v95 or not v93 or not v92 or v92.Health <= 0 or not v94 or v94.Health <= 0 then
            return
        end
        local v96 = v95.CFrame.Position
        if (v93.Position - v96).Magnitude > 0.1 then
            v95.CFrame = CFrame.lookAt(v96, v93.Position)
        end
    end)
end
do
    local v97 = getgenv()
    if v97.__AutoBountyESP then
        v97.__AutoBountyESP.Destroy()
    end
    local v98 = game:GetService("Players").LocalPlayer
    local v99 = Instance.new("BillboardGui")
    v99.Name = "AutoBountyTargetESP"
    v99.AlwaysOnTop = true
    v99.Size = UDim2.fromOffset(260, 66)
    v99.StudsOffsetWorldSpace = Vector3.new(0, 4, 0)
    v99.Enabled = false
    v99.ResetOnSpawn = false
    v99.Parent = v98:WaitForChild("PlayerGui")
    local v100 = Instance.new("TextLabel")
    v100.Size = UDim2.fromScale(1, 1)
    v100.BackgroundColor3 = Color3.fromRGB(15, 18, 24)
    v100.BackgroundTransparency = 0.25
    v100.TextColor3 = Color3.fromRGB(255, 220, 100)
    v100.TextStrokeTransparency = 0.4
    v100.Font = Enum.Font.GothamBold
    v100.TextSize = 15
    v100.Parent = v99
    local v101 = Instance.new("Highlight")
    v101.Name = "AutoBountyTargetHighlight"
    v101.FillColor = Color3.fromRGB(255, 70, 70)
    v101.FillTransparency = 0.65
    v101.OutlineColor = Color3.fromRGB(255, 220, 100)
    v101.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    v101.Enabled = false
    v101.Parent = v99
    local function v102()
        local v103 = v97.CurrentTarget
        local v104 = v103 and v103.Parent and v103.Character
        local v105 = v104 and v104:FindFirstChild("HumanoidRootPart")
        local v106 = v104 and v104:FindFirstChildOfClass("Humanoid")
        local v107 = v98.Character and v98.Character:FindFirstChild("HumanoidRootPart")
        if v103 == v98 or not v105 or not v106 or v106.Health <= 0 then
            v99.Enabled = false
            v99.Adornee = nil
            v101.Enabled = false
            v101.Adornee = nil
            return
        end
        v99.Adornee = v104:FindFirstChild("Head") or v105
        v99.Enabled = true
        v101.Adornee = v104
        v101.Enabled = true
        local v108 = v107 and (v107.Position - v105.Position).Magnitude
        local v109 = math.max(0, v106.Health)
        local v110 = math.max(1, v106.MaxHealth)
        v100.Text = string.format("%s (@%s)\nDistance: %s studs | HP: %.0f / %.0f (%.0f%%)", v103.DisplayName, v103.Name, v108 and tostring(math.floor(v108 + 0.5)) or "?", v109, v110, v109 / v110 * 100)
    end
    local v111 = 0
    local v113 = game:GetService("RunService").Heartbeat:Connect(function(p112)
        v111 = v111 + p112
        if v111 >= 0.15 then
            v111 = 0
            v102()
        end
    end)
    local v114 = { Update = v102 }
    v114.Destroy = function()
        v113:Disconnect()
        v99:Destroy()
        if v97.__AutoBountyESP == v114 then
            v97.__AutoBountyESP = nil
        end
    end
    v97.__AutoBountyESP = v114
end
local v115 = game:GetService("StarterGui")
getgenv().sendnoti = function(p116, p117)
    pcall(function()
        v115.SetCore(v115, "SendNotification", { Title = "Vape Hub", Text = tostring(p116), Duration = p117 or 10 })
    end)
end
local v118 = getgenv().sendnoti
print("[Vape Hub] Loading on process...")
getgenv().Loaded = true
repeat
    task.wait()
until game:IsLoaded() and game:GetService("Players") and game:GetService("Players").LocalPlayer and game.ReplicatedStorage and game.Players.LocalPlayer:FindFirstChild("PlayerGui")
local v119 = 0
while game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen") and (v119 < 30) do
    task.wait(1)
    v119 = v119 + 1
end
if v119 >= 30 then
    game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", game.JobId)
end
isfluxus = string.find(identifyexecutor(), "Fluxus") or string.find(identifyexecutor(), "ScriptWare")
local v120, v121 = identifyexecutor()
local v122 = true
local v123
local v124 = syn and syn.set_thread_identity or set_thread_identity or setidentity or setthreadidentity or function() end
local v125 = syn and syn.get_thread_identity or get_thread_identity or getidentity or getthreadidentity or function()
    return 8
end
getgenv().fluxus = isfluxus
fluxus = isfluxus
local function v126()
    if not fluxus then
        v124(8)
    end
end
v126()
if isfluxus and v121 then
    ismobile = v121 == "Android"
end
local v127 = game:GetService("VirtualUser")
v127:CaptureController()
if getgenv().Team ~= "Pirates" and (getgenv().Team ~= "Marines") then
    getgenv().Team = "Pirates"
end
local v128 = { Name = {}, PlayerDiedTime = 120 }
local v129 = {
    IgnoreFruitTarget = (getgenv().PlayerSetting or {}).IgnoreFruitTarget or { "Portal-Portal", "Kitsune-Kitsune" },
    BlacklistIsland = (getgenv().PlayerSetting or {}).BlacklistIsland or { "Submerged Island" }
}
local v130 = getgenv().PlayerSetting or {
    ForceMelee = true,
    ForceMeleeTime = 3,
    StopAttack = true,
    StopAttackAtHealth = 40,
    FastAttack = true
}
local v131 = getgenv().PlayerSetting or {}
local v132 = getgenv().WeaponsSetting or {
    Melee = {
        Enable = true,
        Delay = 1,
        SwitchNextWeaponIfCooldown = true,
        Skills = {
            Z = {
                Enable = true,
                Position = { false, Vector3.new(0, 0, 0), false },
                HoldTime = 0.1,
                TimeToNextSkill = 0
            },
            X = { Enable = true, HoldTime = 0, TimeToNextSkill = 0 },
            C = { Enable = true, HoldTime = 0, TimeToNextSkill = 0 }
        }
    },
    ["Blox Fruit"] = {
        Enable = false,
        Delay = 4,
        SwitchNextWeaponIfCooldown = true,
        Skills = {
            Z = { Enable = true, HoldTime = 0.5, TimeToNextSkill = 0 },
            X = { Enable = true, HoldTime = 0.5, TimeToNextSkill = 0 },
            C = { Enable = true, HoldTime = 0.5, TimeToNextSkill = 0 },
            V = { Enable = true, HoldTime = 0.5, TimeToNextSkill = 0 },
            F = { Enable = false, HoldTime = 1, TimeToNextSkill = 0 }
        }
    },
    Sword = {
        Enable = true,
        Delay = 1,
        Skills = {
            Z = { Enable = true, HoldTime = 0.1, TimeToNextSkill = 0 },
            X = { Enable = true, HoldTime = 0, TimeToNextSkill = 0 }
        }
    },
    Gun = {
        Enable = false,
        Delay = 0.5,
        Skills = {
            Z = { Enable = true, HoldTime = 0.1, TimeToNextSkill = 0 },
            X = { Enable = true, HoldTime = 0.1, TimeToNextSkill = 0 }
        }
    }
}
pcall(function()
    workspace._WorldOrigin["Foam;"]:Destroy()
    workspace._WorldOrigin.WaterSplashes:Destroy()
end)
pcall(function()
    workspace.Map["WaterBase-Plane"]:Destroy()
end)
local v133 = 0
game:GetService("TeleportService").TeleportInitFailed:Connect(function(p134, p135, p136)
    if string.find(p136, "IsTeleporting") or p135 == Enum.TeleportResult.Flooded or p135 == Enum.TeleportResult.IsTeleporting then
        v133 = v133 + 1
    end
end)
task.spawn(function()
    if v133 >= 10 then
        game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", game.JobId)
        game.Players.LocalPlayer:Kick("[Vape Hub] SERVER HOPPING ERROR")
    end
end)
print("[Vape Hub] Config loaded!")
loadstring("    local IsAlive = function(Object,HaveHRP,HaveHumanoid)\n        if Object and Object.Parent and Object:FindFirstChild(\"HumanoidRootPart\") and Object:FindFirstChild('Humanoid') then\n            if Object:FindFirstChild('Humanoid').Health and Object:FindFirstChild('Humanoid').Health > 0 then\n                return true\n            end\n        end\n        return false\n    end\n    spawn(function ()\n        while task.wait() do\n            for i, v in pairs(game:GetService(\"ReplicatedStorage\"):GetChildren()) do\n                if IsAlive(v) and v:IsA(\"Model\") then\n                    v.Parent = game.Workspace.Enemies\n                end\n            end\n            for i, v in pairs(game:GetService(\"Workspace\").Boats:GetChildren()) do\n                if IsAlive(v) and v:IsA(\"Model\") then\n                    v.Parent = game.Workspace.Enemies\n                end\n            end\n        end\n    end)\n")()
local function v137(...)
    if getgenv().Debugging then
        if getgenv().CurrentEnv == "Mushroom" or getgenv().CurrentEnv == "MagicGetPlayer" then
            print(...)
        end
    end
end
local function v138(p139)
    if p139.Name == "ErrorPrompt" then
        if p139.Visible then
            local v_errText = tostring(p139.TitleFrame.ErrorTitle.Text or "")
            if v_errText ~= "Teleport Failed" and not string.find(v_errText, "Dịch Chuyển") then
                print(p139.TitleFrame.ErrorTitle.Text)
                task.wait(5)
                game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", game.JobId)
            end
        end
    end
end
for v140, v141 in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetChildren()) do
    v138(v141)
end
game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(v138)
do
    local v142 = {}
    v142.create = function(p143, p144)
        local v145 = Instance.new(p143)
        for v146, v147 in next, p144 do
            v145[v146] = v147
        end
        pcall(function()
            v145.AutoButtonColor = false
        end)
        if v145:IsA("ImageLabel") or v145:IsA("ImageButton") then
            if v145.Image == "http://www.roblox.com/asset/?id=108390178405430" and (v145.ImageColor3 == Color3.fromRGB(93, 93, 93)) then
                v145:Destroy()
            end
        end
        return v145
    end
    v142.tween = function(p148, p149, p150, p151)
        local v152 = game:GetService("TweenService"):Create(p148, TweenInfo.new(unpack(p149)), p150)
        v152:Play()
        if p151 then
            v152.Completed:Connect(p151)
        end
        return v152
    end
    v142.dragify = function(p153, p154, p155, p156, p157)
        local v158, v159, v160
        p155 = p155 or 0
        p154.InputBegan:Connect(function(p161)
            if p161.UserInputType == Enum.UserInputType.MouseButton1 then
                v160 = true
                v158 = p161.Position
                v159 = p153.Position
                if p157 then
                    getgenv()["nhin cai deo gi dit con me may"] = true
                end
            end
        end)
        p154.InputEnded:Connect(function(p162)
            if p162.UserInputType == Enum.UserInputType.MouseButton1 then
                v160 = false
                if p157 then
                    getgenv()["nhin cai deo gi dit con me may"] = false
                end
            end
        end)
        game:GetService("UserInputService").InputChanged:Connect(function(p163)
            if p163.UserInputType == Enum.UserInputType.MouseMovement and v160 then
                v142.tween(p153, { p155 }, {
                    Position = UDim2.new(v159.X.Scale, v159.X.Offset + (p163.Position - v158).X, v159.Y.Scale, v159.Y.Offset + (p163.Position - v158).Y)
                })
                if p156 then
                    v142.tween(p156, { p155 + 1e-07 }, {
                        Position = UDim2.new(v159.X.Scale, v159.X.Offset + (p163.Position - v158).X, v159.Y.Scale, v159.Y.Offset + (p163.Position - v158).Y)
                    })
                end
            end
        end)
    end
    local v164 = v142.create("ScreenGui", {
        Parent = game.CoreGui,
        IgnoreGuiInset = true,
        ResetOnSpawn = false,
        DisplayOrder = 100,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    })
end
local function func_165()
    return string.find(identifyexecutor(), "Delta") or string.find(identifyexecutor(), "Hydrogen")
end
print("[Vape Hub] Setup Team...")
repeat
    wait()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", getgenv().Team)
until game.Players.LocalPlayer.Team
repeat
    wait()
until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main")
print("[Vape Hub] Team has been setup!")
local v166 = getsynasset or getcustomasset
local v167 = http_request or request or HttpPost or syn.request
local v168 = game:GetService("Players")
local v169 = game:GetService("VirtualUser")
local v170 = game:GetService("VirtualInputManager")
local v171 = game:GetService("ReplicatedStorage")
local v172 = game:GetService("UserInputService")
local v173 = game:GetService("CoreGui")
local v174 = game:GetService("HttpService")
local v175 = game:getService("RunService")
local v176 = game:getService("Lighting")
local v177 = v168.LocalPlayer
local v178 = workspace.CurrentCamera
local v179 = v177.PlayerGui
print("[Vape Hub] Waitting for required child/script/remote")
player = game:GetService("Players")
LocalPlayer = player.LocalPlayer
PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
ReplicatedStorage = game:GetService("ReplicatedStorage")
NPCLists = ReplicatedStorage:WaitForChild("NPCs")
Remotes = ReplicatedStorage:WaitForChild("Remotes")
Quests = require(ReplicatedStorage.Quests)
GuideModule = require(ReplicatedStorage:WaitForChild("GuideModule"))
CommF = Remotes:WaitForChild("CommF_")
Modules = ReplicatedStorage:WaitForChild("Modules")
Net = Modules:WaitForChild("Net")
RegisterAttack = Net:WaitForChild("RE/RegisterAttack")
RegisterHit = Net:WaitForChild("RE/RegisterHit")
VirtualInputManager = game:GetService("VirtualInputManager")
Enemies = workspace:WaitForChild("Enemies")
PlrData = LocalPlayer:WaitForChild("Data")
Level = PlrData:WaitForChild("Level")
Fragments = PlrData:WaitForChild("Fragments")
Beli = PlrData:WaitForChild("Beli")
LastSpawn = PlrData:WaitForChild("LastSpawnPoint")
Race = PlrData:WaitForChild("Race")
LevelMax = tonumber(require(game.ReplicatedStorage.Modules.Player.PlayerConfig).LEVEL_CAP) or 2800
Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
if game.PlaceId == 2753915549 then
    Sea1 = true
    MaxLevelSea = 675
elseif game.PlaceId == 4442272183 or game.PlaceId == 79091703265657 then
    Sea2 = true
    MaxLevelSea = 1450
elseif game.PlaceId == 7449423635 or game.PlaceId == 100117331123089 then
    Sea3 = true
    MaxLevelSea = 2550
    Request_Places = {
        ["Castle on the sea"] = CFrame.new(-5075.50927734375, 314.5155029296875, -3150.0224609375),
        Mansion = CFrame.new(-12548.998046875, 332.40396118164, -7603.1865234375),
        ["Hydra Island"] = CFrame.new(5661.53027, 1013.38354, -334.961914),
        ["Green Tree"] = CFrame.new(3028.84082, 2281.20264, -7324.7832),
        ["Temple Of Time"] = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
    }
else
    print(string.format("[Vape Hub] Your game is not supported! (PlaceID: %s)", tostring(game.PlaceId)))
    setclipboard(tostring(game.PlaceId))
    game.Players.LocalPlayer:Kick(string.format("[Vape Hub] Your game is not supported! (PlaceID: %s)", tostring(game.PlaceId)))
end
print("[Vape Hub] OK DONE")
local v180 = {
    OneClick = { Enable = false },
    Katakuri = { Enable = false },
    Bone = { Enable = false },
    Elite = { Enable = false },
    SubFarming = {},
    ["Pirate Raid"] = { Enable = false },
    ["Kill Aura"] = { Enable = false, DistanceFromAnchor = 4000, AnchorTPBack = true },
    Factory = { Enable = false },
    Mastery = { Enable = false, ["Fruit/Gun"] = false, ["Sword/Low"] = false, Sword = false },
    LocalPlayer = {
        Speed = 90,
        SpeedHack = false,
        AutoBuso = true,
        AutoEnableObservation = false,
        WaterWalker = true,
        AutoUseV4 = false
    },
    FastAttack = {
        Enable = true,
        TimeFastAttack = 80,
        TimeToAttack = 3,
        FastAttackIfBoss = false,
        OnPlayer = true,
        OnMob = true,
        OldFastAttack = false
    },
    Tween = { Pause = true, TimeNeedPause = 2, TimePause = 0.2, Speed = 175 },
    Pvp = { AutoShootGun = false, Method = "Nearest" },
    ESP = {
        Player = false,
        Chest = false,
        Boss = false,
        Island = false,
        Fruit = false
    },
    SeaEvents = {
        ShipSpeedModifier = false,
        ShipSpeed = 300,
        SpinDistance = 200,
        DistanceNearSeaBeast = 300,
        DistanceNearMob = 300
    },
    Shop = { AutoBuyBribe = false, AutoRandomFruit = false, AutoRandomBone = false },
    SkillsSet2 = { ["Blox Fruit"] = true, Gun = true, Sword = true, Melee = true },
    SkillsSettingRemake = {
        ClickFruit = false,
        ["Blox Fruit"] = {
            "Z",
            "X",
            "C",
            "V",
            "F"
        },
        Gun = { "Z", "X" },
        Sword = { "Z", "X" },
        Melee = { "Z", "X", "C" }
    },
    BringMob = { Enable = true, Radius = 200 },
    Fruit = { AutoStore = false, FruitsToSnipe = {} },
    GetFruit = { Enable = false },
    Trial = { Enable = false, AutoKill = false },
    AutoTrainTrial = { Enable = false, TrainPlace = "Bone" },
    FullyAutoTrial = { Enable = false },
    ["Rip Indra"] = { Enable = false },
    ["Black Beard"] = { Enable = false },
    ["Dough King"] = { Enable = false },
    ["Cake Prince"] = { Enable = false },
    ["Full Dough King"] = { Enable = false },
    FullyRaceV4_Entrance = { Enable = false },
    Material = { Enable = false, Select = "" },
    Misc = { __RemoveNotification = false, __RemoveDMGCounter = false },
    Raid = { Select = "", Enable = false },
    ["Winter Event"] = { Enable = false },
    RaceV4 = { CheckStatus = false },
    Bartilo = { Enable = false },
    ["Race Evolve"] = { Enable = false },
    ["Haki Pad"] = { Enable = false },
    ["Collect Chest"] = { Enable = false },
    ["Open Pad"] = { Enable = false },
    ["Spawn Black Beard"] = { Enable = false },
    ["Spawn Rip Indra"] = { Enable = false },
    ["Mirage Snipe Fruit"] = { Enable = false },
    ["Soul Guitar"] = { Enable = false },
    ["Material Soul Guitar"] = { Enable = false },
    ["Black Beard Hop"] = { Enable = false },
    ["Tushita Hop__1"] = { Enable = false },
    ["Soul Reaper"] = { Enable = false },
    ["Spawn Soul Reaper"] = { Enable = false },
    Tushita = { Enable = false },
    ["Hybrid Fruit Hop"] = { Enable = false },
    ["Fully Cyborg"] = { Enable = false },
    ["Fully Ghoul"] = { Enable = false },
    Law = { Enable = false },
    CDK = { Enable = false },
    ["Level Observation"] = { Enable = false },
    ["Rainbow Haki"] = { Enable = false },
    __SaberHop = { Enable = false },
    ["Citizen Quest"] = { Enable = false },
    __PoleHop = { Enable = false },
    ["Evolve Observation"] = { Enable = false },
    SwordSwitcher = { Enable = false },
    TrialTeam = { Enable = false },
    ["Get Ghoul"] = { Enable = false },
    Webhook = { Url = "" },
    ["Unlock Electric Claw"] = { Enable = false },
    ["Yoru V3"] = { Enable = false }
}
getgenv().SettingManager = {}
if not SettingManager then
    SettingManager = getgenv().SettingManager
end
SettingManager.SetTheme = function(p181, p182)
    if p182 then
        UIThemeCustom.ImageTransparency = 0
        UIThemeCustom.Image = p182
    end
end
SettingManager.SetDiscordIcon = function(p183)
    local v184 = p183.CurrentFolder .. "/Cache" .. "/Discord.png"
    if not isfile(v184) then
        local v185 = game:HttpGet("https://raw.githubusercontent.com/minhhau207-hiro/rblx/main/W-azure/asset/DiscordIcon.png")
        writefile(v184, v185)
        repeat
            wait()
        until isfile(v184)
    end
    if isfile(v184) then
        UserIcon.Image = v166(v184)
    end
end
SettingManager.SetAvatar = function(p186, p187, p188)
    local v192, v193 = pcall(function()
        local v189 = tostring(p188)
        local v190 = p186.CurrentFolder .. "/Cache" .. "/Avt.png"
        if not isfile(v190) then
            local v191 = v167({
                Url = "https://cdn.discordapp.com/avatars/" .. v189 .. "/" .. p187 .. ".png",
                Method = "GET",
                Headers = { ["Content-Type"] = "application/json" }
            })
            writefile(v190, v191.Body)
            repeat
                wait()
            until isfile(v190)
        end
        if isfile(v190) then
            UserIcon.Image = v166(v190)
        end
    end)
    if v193 then
        SettingManager:SetDiscordIcon()
    end
end
SettingManager.SetFolder = function(p194, p195)
    if not isfolder(p195) then
        makefolder(p195)
    end
    p194.CurrentFolder = p195
    p194.Theme = p194.CurrentFolder .. "/Theme"
    p194.Cache = p194.CurrentFolder .. "/Cache"
    p194.AutoSave = p194.CurrentFolder .. "/Main"
    p194.Config = p194.CurrentFolder .. "/ConfigMain"
    p194.Global = p194.CurrentFolder .. "/Global"
    p194.AutoLoad = p194.AutoSave .. "/" .. game.Players.LocalPlayer.Name .. ".txt"
    p194.GlobalTheme = p194.Global .. "/" .. "GlobalTheme.txt"
    p194.GlobalTrans = p194.Global .. "/" .. "GlobalTrans.txt"
    p194.AutoData = p194.Config .. "/" .. game.Players.LocalPlayer.Name .. ".json"
    p194.SameAcc = p194.CurrentFolder .. "/SameAcc"
    p194.AutoConfig = p194.AutoData
    if not isfolder(p194.Theme) then
        makefolder(p194.Theme)
    end
    if not isfolder(p194.SameAcc) then
        makefolder(p194.SameAcc)
    end
    if not isfolder(p194.Cache) then
        makefolder(p194.Cache)
    end
    if not isfolder(p194.AutoSave) then
        makefolder(p194.AutoSave)
    end
    if not isfolder(p194.Config) then
        makefolder(p194.Config)
    end
end
SettingManager.SetGlobalTrans = function(p196, p197, p198)
    if p197 then
        writefile(p196.GlobalTrans, v174:JSONEncode(p198))
    else
        return isfile(p196.GlobalTrans) and v174:JSONDecode(readfile(p196.GlobalTrans))
    end
end
SettingManager.SetGlobalTheme = function(p199, p200, p201)
    if p200 then
        writefile(p199.GlobalTheme, v174:JSONEncode(p201))
    else
        return isfile(p199.GlobalTheme) and v174:JSONDecode(readfile(p199.GlobalTheme))
    end
end
SettingManager.SetSameInstance = function(p202)
    if isfolder(p202.SameAcc) then
        if isfile(p202.SameAcc .. "/Account.json") then
            local v203 = v174:JSONDecode(readfile(p202.SameAcc .. "/Account.json"))
            if not table.find(v203, v177.Name) then
                table.insert(v203, v177.Name)
                writefile(p202.SameAcc .. "/Account.json", v174:JSONEncode(v203))
            end
            for v204, v205 in pairs(v168:GetPlayers()) do
                if v205 == v177 then
                    continue
                end
                if table.find(v203, v205.Name) then
                    print("Checked Same: " .. v205.Name)
                    return true
                end
            end
        else
            writefile(p202.SameAcc .. "/Account.json", v174:JSONEncode({ v177.Name }))
        end
    end
end
SettingManager.LoadAutoConfig = function(p206)
    if not isfile(p206.AutoLoad) then
        writefile(p206.AutoLoad, p206.Config .. "/" .. game.Players.LocalPlayer.Name .. ".json")
    else
        local v207 = readfile(p206.AutoLoad)
        if isfile(v207) then
            p206.AutoConfig = v207
            print("Auto load")
            local v208
            local v209, v210 = pcall(function()
                v208 = v174:JSONDecode(readfile(p206.AutoConfig))
            end)
            if v210 then
            end
            return v208
        end
    end
end
SettingManager.SetAutoConfig = function(p211, p212)
    writefile(p211.AutoLoad, p212)
end
SettingManager.New = function(p213, p214)
    writefile(p213.Config .. "/" .. p214, v174:JSONEncode({}))
end
SettingManager.Save = function(p215, p216, p217)
    if p216 and p217 then
        local v218, v219 = pcall(function()
            writefile(p216, v174:JSONEncode(p217))
        end)
        return v218
    else
        writefile(p215.AutoData, getgenv().Setting and v174:JSONEncode({ Setting = getgenv().Setting }) or v174:JSONEncode({}))
    end
end
SettingManager.Load = function(p220, p221, p222)
    if isfile(p220.Config .. "/" .. p221) then
        return v174:JSONDecode(readfile(p220.AutoSave .. "/" .. p221))
    end
end
SettingManager.ListFile = function(p223, p224)
    local v225 = { Theme = "/Theme", Config = "/ConfigMain" }
    return listfiles(p223.CurrentFolder .. v225[p224])
end
SettingManager:SetFolder("Vape Hub V2_Beta")
do
    if not getgenv().Setting then
        getgenv().Setting = {}
    end
    local v226 = SettingManager:LoadAutoConfig()
    if type(v226) == "table" and type(v226.Setting) == "table" then
        for v227, v228 in pairs(v226.Setting) do
            getgenv().Setting[v227] = v228
        end
        for v229, v230 in pairs(v180) do
            if not getgenv().Setting[v229] then
                print("Missing: " .. v229, v230)
                getgenv().Setting[v229] = v230
                print(getgenv().Setting[v229])
            end
        end
        print("Loaded")
    else
        print("Dell load")
        getgenv().Setting = v180
        SettingManager:Save()
    end
end
local v231 = game:GetService("Workspace").Enemies
local v232 = tick()
local v233 = {
    Cyborg = CFrame.new(28492.52734375, 14895.9755859375, -422.6058654785156),
    Human = {
        CFrame.new(29019.9609375, 14891.1474609375, -389.439697265625),
        CFrame.new(29237.48828125, 14891.052734375, -204.71849060058594)
    },
    Mink = CFrame.new(29020.9492, 14890.6328, -380.407867, -0.0712743625, 8.85832776e-08, -0.997456729, -3.87927805e-08, 1, 9.15811214e-08, 0.997456729, 4.52215083e-08, -0.0712743625),
    Fishman = CFrame.new(28224.0938, 14891.2402, -212.507004, 0.0963651389, -3.22392211e-08, 0.995346069, 3.76359344e-09, 1, 3.20255857e-08, -0.995346069, 6.59927724e-10, 0.0963651389),
    Ghoul = CFrame.new(28673.8555, 14890.334, 454.733765, -0.999887466, -3.48198981e-09, 0.0150030479, -3.48583518e-09, 1, -2.30164096e-10, -0.0150030479, -2.82436352e-10, -0.999887466),
    Skypiea = CFrame.new(28967.8086, 14919.2803, 234.668045, -0.00638482161, 3.80502279e-08, -0.999979615, 6.83823131e-08, 1, 3.76143845e-08, 0.999979615, -6.8140757e-08, -0.00638482161)
}
local v234 = Vector3.new(-5581.2353515625, 313.76556396484375, -3064.094970703125)
local v235 = {
    Castle = {
        CanInstaTP = true,
        Pos = Vector3.new(-5069.12158203125, 314.5155029296875, -3000.46728515625)
    },
    Hydra = {
        CanInstaTP = true,
        Hitbox = function()
            return game:GetService("Workspace").Map["Boat Castle"].MapTeleportB.Hitbox
        end,
        Pos = Vector3.new(5657.0947265625, 1013.0795288085938, -340.00445556640625)
    },
    Mansion = {
        CanInstaTP = true,
        Pos = Vector3.new(-12547.1396484375, 337.16827392578125, -7471.8818359375)
    }
}
local v236 = {
    InCombat = v177.PlayerGui.Main.BottomHUDList.InCombat,
    InCombatBottom = v177.PlayerGui.Main.BottomHUDList.InCombatBottom
}
local v237 = {
    Mink = "Agility",
    Skypiea = "Heavenly Blood",
    Ghoul = "Heightened Senses",
    Fishman = "Water Body",
    Cyborg = "Energy Core",
    Human = "Last Resort"
}
local v238 = {
    "18",
    "19",
    "20",
    "21",
    "23",
    "24",
    "00",
    "01",
    "02",
    "03",
    "04"
}
IsNight = function()
    return table.find(v238, tostring(game:GetService("Lighting").TimeOfDay:split(":")[1]))
end
local v239 = { [4] = "Near Full Moon" }
local function v240()
    local v241 = game:GetService("Lighting"):GetAttribute("MoonPhase")
    local v242 = tonumber(string.sub(tostring(v241), #tostring(v241)))
    if v239[v242] then
        return v239[v242]
    end
    if v241 % 5 == 0 then
        return "Full Moon OMG"
    end
    return v242
end
TimeRemain = function()
    if IsNight() then
        local v243 = 10
        if table.find(v238, tostring(game:GetService("Lighting").TimeOfDay:split(":")[1])) >= 6 then
            v243 = v243 - table.find(v238, tostring(game:GetService("Lighting").TimeOfDay:split(":")[1])) + 1
        else
            v243 = v243 - table.find(v238, tostring(game:GetService("Lighting").TimeOfDay:split(":")[1]))
        end
        return v243
    end
end
do
    getgenv().IsServerVip = nil
    spawn(function()
        local v244 = false
        while not v244 and task.wait(1) do
            local v245 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter", "Progress")
            if v245 == "Sorry, you must join a public server for PvP tasks." then
                getgenv().IsServerVip = true
                v244 = true
            end
            if tonumber(v245) then
                getgenv().IsServerVip = false
                v244 = true
            end
        end
    end)
    spawn(function()
        Encryptor = {}
        local v246 = {}
        for v247 = 0, 9 do
            v246[v247] = tostring(v247)
        end
        v246[10] = "A"
        v246[11] = "B"
        v246[12] = "C"
        v246[13] = "D"
        v246[14] = "E"
        v246[15] = "F"
        local v248 = {}
        for v249 = 0, 9 do
            v248[tostring(v249)] = v249
        end
        v248.A = 10
        v248.B = 11
        v248.C = 12
        v248.D = 13
        v248.E = 14
        v248.F = 15
        Encryptor.decToHex = function(p250)
            local v251 = ""
            while p250 > 0 do
                local v252 = p250 % 16
                v251 = v246[v252] .. v251
                p250 = math.floor(p250 / 16)
            end
            return v251
        end
        Encryptor.hexToDec = function(p253)
            local v254 = 0
            local v255 = string.len(p253)
            for v256 = 1, v255 do
                local v257 = v248[string.sub(p253, v256, v256)]
                v254 = v254 + (v257 * 16 ^ (v255 - v256))
            end
            return v254
        end
        Encryptor.GetUTF8Table = function()
            local v258 = {}
            local v259 = 1
            repeat
                table.insert(v258, { utf8.char(v259), v259 })
                wait()
                v259 = v259 + 1
            until v259 == 127
            return v258
        end
        Encryptor.UTF8Table = Encryptor.GetUTF8Table()
        Encryptor.GetUTF8Number = function(p260)
            local v261 = Encryptor.UTF8Table
            if string.len(p260) > 1 then
                warn("The input cannot be higher than one character")
            elseif string.len(p260) < 1 then
                warn("The input cannot be lower than one character")
            else
                for v262, v263 in pairs(v261) do
                    if p260 == v263[1] then
                        return v263[2]
                    end
                end
            end
        end
        Encryptor.Encrypt = function(p264, p265)
            local v266 = 0
            local v267 = 0
            local v268 = ""
            local v269 = {}
            for v270 = 1, string.len(p264) do
                table.insert(v269, {
                    Encryptor.GetUTF8Number(string.sub(p264, v270, v270))
                })
            end
            for v271 = 1, string.len(p265) do
                v267 = v267 + Encryptor.GetUTF8Number(string.sub(p265, v271, v271))
            end
            for v272, v273 in pairs(v269) do
                if v272 == 1 then
                    v268 = v268 .. Encryptor.decToHex(v273[1] * v267)
                else
                    v268 = v268 .. "-" .. Encryptor.decToHex(v273[1] * v267)
                end
            end
            return v268
        end
        Encryptor.Decrypt = function(p274, p275)
            local v276 = 0
            local v277 = {}
            local v278 = Encryptor.UTF8Table
            local v279 = string.split(p274, "-")
            local v280 = ""
            for v281 = 1, string.len(p275) do
                v276 = v276 + Encryptor.GetUTF8Number(string.sub(p275, v281, v281))
            end
            for v282, v283 in pairs(v279) do
                if v279[v282] ~= "" then
                    table.insert(v277, { Encryptor.hexToDec(v279[v282]) / v276 })
                end
            end
            for v284, v285 in pairs(v277) do
                for v286, v287 in pairs(v278) do
                    if v285[1] == v287[2] then
                        v280 = v280 .. v287[1]
                    end
                end
            end
            return v280
        end
        do
            local v288 = 2345242
            local v289 = 3223
            local v290
            encode = function(p291)
                if not v290 then
                    v290 = {}
                    for v292 = 0, 127 do
                        local v293 = -1
                        repeat
                            v293 = v293 + 2
                        until v293 * (2 * v292 + 1) % 256 == 1
                        v290[v292] = v293
                    end
                end
                local v294, v295 = v288, 16384 + v289
                return (p291:gsub(".", function(p296)
                    local v297 = v294 % 274877906944
                    local v298 = (v294 - v297) / 274877906944
                    local v299 = v298 % 128
                    p296 = p296:byte()
                    local v300 = (p296 * v290[v299] - ((v298 - v299) / 128)) % 256
                    v294 = v297 * v295 + v298 + v300 + p296
                    return ("%02x"):format(v300)
                end))
            end
            decode = function(p301)
                local v302, v303 = v288, 16384 + v289
                return (p301:gsub("%x%x", function(p304)
                    local v305 = v302 % 274877906944
                    local v306 = (v302 - v305) / 274877906944
                    local v307 = v306 % 128
                    p304 = tonumber(p304, 16)
                    local v308 = (p304 + ((v306 - v307) / 128)) * (2 * v307 + 1) % 256
                    v302 = v305 * v303 + v306 + p304 + v308
                    return string.char(v308)
                end))
            end
        end
        repeat
            wait()
        until getgenv().IsServerVip ~= nil
        if getgenv().IsServerVip then
            return
        end
        if string.find(identifyexecutor(), "Delta") or true then
            return
        end
        wait(5)
        local v309 = debug.info or info or false
        local v310 = false
        local v311 = nil
        local v312 = {
            ["0x00"] = "Access Url",
            ["0x01"] = "Dif Function",
            ["0x02"] = "Constant",
            ["0x03"] = "Source",
            ["0x04"] = "Pairs",
            ["0x05"] = "Fail",
            ["0x06"] = "Too Long",
            ["0x07"] = "No Headers",
            ["0x08"] = "No Requests Found"
        }
        local v313 = getgenv().pairs or pairs
        local __tbl314 = type(getgenv().table) == "table" and getgenv().table or table
        local v314 = __tbl314 and __tbl314.foreach
        local v315 = http_request or request or (http and http.request) or (game.HttpGet or httpget)
        if type(__tbl314) == "table" and type(v314) == "function" then
            pcall(function()
                setreadonly(__tbl314, false)
                __tbl314.foreach = function(p316, p317)
                    if checkcaller() then
                        if getmetatable(p316) then
                            if getmetatable(p316).__pairs then
                                for v318, v319 in getmetatable(p316).__pairs(p316) do
                                    p317(v318, v319)
                                end
                            end
                        end
                    end
                    if typeof(p316) == "table" and typeof(p317) == "function" then
                        return v314(p316, p317)
                    end
                end
                setreadonly(__tbl314, true)
            end)
        end
        getgenv().pairs = function(p320)
            if checkcaller() then
                if getmetatable(p320) then
                    if getmetatable(p320).__pairs then
                        return getmetatable(p320).__pairs(p320)
                    end
                end
            end
            if typeof(p320) == "table" then
                return v313(p320)
            end
        end
        local function func_325(p321, p322)
            for v323, v324 in next, p321 do
                if v324 == p322 then
                    return true
                end
            end
            return false
        end
        local v326 = {}
        local function v327(p328)
            if type(p328) ~= "table" then
                return type(p328)
            end
            local v329 = 1
            for v330 in pairs(p328) do
                if p328[v329] ~= nil then
                    v329 = v329 + 1
                else
                    return "table"
                end
            end
            if v329 == 1 then
                return "table"
            else
                return "array"
            end
        end
        local function v331(p332)
            local v333 = {
                "\\",
                "\"",
                "/",
                "\b",
                "\f",
                "\n",
                "\r",
                "\t"
            }
            local v334 = {
                "\\",
                "\"",
                "/",
                "b",
                "f",
                "n",
                "r",
                "t"
            }
            for v335, v336 in ipairs(v333) do
                p332 = p332:gsub(v336, "\\" .. v334[v335])
            end
            return p332
        end
        local function v337(p338, p339, p340, p341)
            p339 = p339 + #p338:match("^%s*", p339)
            if p338:sub(p339, p339) ~= p340 then
                if p341 then
                    error("Expected " .. p340 .. " near position " .. p339)
                end
                return p339, false
            end
            return p339 + 1, true
        end
        local function v342(p343, p344, p345)
            p345 = p345 or ""
            local v346 = "End of input found while parsing string."
            if p344 > #p343 then
                error(v346)
            end
            local v347 = p343:sub(p344, p344)
            if v347 == "\"" then
                return p345, p344 + 1
            end
            if v347 ~= "\\" then
                return v342(p343, p344 + 1, p345 .. v347)
            end
            local v348 = {
                b = "\b",
                f = "\f",
                n = "\n",
                r = "\r",
                t = "\t"
            }
            local v349 = p343:sub(p344 + 1, p344 + 1)
            if not v349 then
                error(v346)
            end
            return v342(p343, p344 + 2, p345 .. (v348[v349] or v349))
        end
        local function v350(p351, p352)
            local v353 = p351:match("^-?%d+%.?%d*[eE]?[+-]?%d*", p352)
            local v354 = tonumber(v353)
            if not v354 then
                error("Error parsing number at position " .. p352 .. ".")
            end
            return v354, p352 + #v353
        end
        v326.encode = function(p355, p356)
            local v357 = {}
            local v358 = v327(p355)
            if v358 == "array" then
                if p356 then
                    error("Can't encode array as key.")
                end
                v357[#v357 + 1] = "["
                for v359, v360 in ipairs(p355) do
                    if v359 > 1 then
                        v357[#v357 + 1] = ", "
                    end
                    v357[#v357 + 1] = v326.encode(v360)
                end
                v357[#v357 + 1] = "]"
            elseif v358 == "table" then
                if p356 then
                    error("Can't encode table as key.")
                end
                v357[#v357 + 1] = "{"
                for v361, v362 in pairs(p355) do
                    if #v357 > 1 then
                        v357[#v357 + 1] = ", "
                    end
                    v357[#v357 + 1] = v326.encode(v361, true)
                    v357[#v357 + 1] = ":"
                    v357[#v357 + 1] = v326.encode(v362)
                end
                v357[#v357 + 1] = "}"
            elseif v358 == "string" then
                return "\"" .. v331(p355) .. "\""
            elseif v358 == "number" then
                if p356 then
                    return "\"" .. tostring(p355) .. "\""
                end
                return tostring(p355)
            elseif v358 == "boolean" then
                return tostring(p355)
            elseif v358 == "nil" then
                return "null"
            else
                error("Unjsonifiable type: " .. v358 .. ".")
            end
            return table.concat(v357)
        end
        local function func_381(p363)
            if type(p363) == "table" and tostring(p363.Url):find("discord.com/api/webhooks", 1, true) and not ((getgenv().PlayerSetting or {}).WebHook or {}).Enable then
                return { StatusCode = 204, Body = "{}", Success = true }
            end
            local v364 = 0
            local v365, v366, v367, v368 = p363.Url, p363.Method, p363.Headers, p363.Body
            local v376 = setmetatable({}, {
                __index = function(p369, ...)
                    do
                        local v370 = v309(2, "f")
                        if is_synapse_function and (v370 ~= v315) then
                        end
                        if pcall(function()
                    debug.getconstants(v370)
                end) then
                            v311 = v312["0x02"]
                            print("Const")
                            return
                        end
                        local v371 = getinfo(v370)
                        if v371.what ~= "C" then
                            v311 = v312["0x03"]
                            print("H")
                            return
                        end
                    end
                    t = { ... }
                    if func_325(t, "Url") then
                        v364 = v364 + 1
                        if v311 and not SendingCrackLog then
                            return MyWebhook
                        end
                        if v364 ~= 1 then
                            v311 = v312["0x00"]
                            while true do end
                            return
                        end
                        return v365
                    end
                    if func_325(t, "Method") then
                        return v366
                    end
                    if func_325(t, "Headers") and (v366 == "POST") then
                        return v367
                    end
                    if func_325(t, "Body") and (v366 == "POST") then
                        if v311 and not SendingCrackLog then
                            return EncodedFakeData
                        end
                        return v368
                    end
                end,
                __pairs = function(p372)
                    v311 = v312["0x04"]
                    local v373 = { "Url", "Method", "Headers", "Body" }
                    local v374 = 0
                    return function()
                        v374 = v374 + 1
                        local v375 = v373[v374]
                        if v375 then
                            if v375 == "Url" then
                                return v375, MyWebhook
                            end
                            if v375 == "Body" then
                                return v375, EncodedFakeData
                            end
                            return v375, p372[v375]
                        end
                    end
                end
            })
            local v377 = tick()
            local v378
            local v379, v380 = pcall(function()
                v378 = v315(v376)
                if not v378.Headers then
                    print("heade")
                    v311 = v312["0x07"]
                    return
                end
            end)
            if not v379 then
                v311 = v312["0x08"]
                print("Failed")
                return
            end
            if v379 and (tick() - v377 < 0.01) then
                v311 = v312["0x06"]
                print("late")
                return
            end
            return v378
        end
        WebhookUrl = {
            Mirage = "https://discord.com/api/webhooks/1479846204220375120/Q3xB9vg_iFWts8Ls5pblMJkMN5goIojl8mIwqx9fnx0fvfZo57IufPZIxp1816efJU3z",
            FullMoon = "https://discord.com/api/webhooks/1479845933494833252/Dp6lXDmjOpWfLgNoon5npX7IE4kInUosob1XOILkoxozFlBTbqfZo6d65WLZoipuXwEx",
            NearFullMoon = "https://discord.com/api/webhooks/1479846086838587713/myo27AL9APOUZ67fQf9WYODFk8Mt9dpEkea05SUxSijJeSbcclD4bup1RGpmGQhumQXt",
            HakiColorNormal = "https://discord.com/api/webhooks/1162600421861359617/YojQDnDFtVwYkwAo1_mQO-BW9-BPsMWQcU3lO3gBw2DvbgA-rbkzXZVzHS-aJCMcopFk",
            HakiColorLegend = "https://discord.com/api/webhooks/1162600567219167293/1G3GMiKMapC4OgWe580VqOxD3G461snP_7A6D3Z9L7GzlxheSsQdpq3ZsWNhuEBLJgwz",
            LegendarySword = "https://discord.com/api/webhooks/1479846300047380644/kRLyRpapFxgMKIh06o9HCT9gFgShfaTpUojpF9DL69KoNcanYy_r-h-dgyqcavwlgclH",
            BossPro = "https://discord.com/api/webhooks/1479846417370448034/LsgBytZ4_bYHZ_Yz6PIvhr7mP7MWe7s4ONjauT7ImNwILBLle0A6Bjv9wBDjv4V02aIK",
            BossRaid = "https://discord.com/api/webhooks/1479846564565356636/vHymPhyWfV6oag6cddLF-Yqn3p2g75k_GBhCeG1l0eaStXEOCktx-rNC2lx46REAjhKx",
            Kistune = "https://discord.com/api/webhooks/1506899686068453468/8liT1NN-Eq8ZgwxJ88VBLEkvxrVdnXJSWANeyuKv_DcQHGypOxYiNyJzEkZFOIUwsu2i"
        }
        local v382 = { "Dough King", "Darkbeard", "rip_indra True Form" }
        local v383 = { "Cursed Captain", "Soul Reaper" }
        local v384 = {}
        PingMirage = "<@&1061564724535382056>"
        PingHakiColor = "<@&1089099922277675008"
        SendMessage = function(p385, p386)
            local v390, v391 = pcall(function()
                local v387 = Text
                local v388 = { content = v387 }
                local v389 = func_381({
                    Url = p386,
                    Method = "POST",
                    Headers = { ["Content-Type"] = "application/json" },
                    Body = game:GetService("HttpService"):JSONEncode(v388)
                })
            end)
        end
        TimeRemain = function()
            if IsNight() then
                local v392 = 10
                if table.find(v238, tostring(game:GetService("Lighting").TimeOfDay:split(":")[1])) >= 6 then
                    v392 = v392 - table.find(v238, tostring(game:GetService("Lighting").TimeOfDay:split(":")[1])) + 1
                else
                    v392 = v392 - table.find(v238, tostring(game:GetService("Lighting").TimeOfDay:split(":")[1]))
                end
                return v392
            end
        end
        EmbedColor = { White = 16777215, Red = 15548997, Pink = 16711862 }
        HakiToColor = { ["Snow White"] = EmbedColor.White, ["Pure Red"] = EmbedColor.Red, ["Winter Sky"] = EmbedColor.Pink }
        SendHakiColor = function()
            local v393 = { "ColorsDealer", "1" }
            local v394 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v393))
            local v395 = WebhookUrl.HakiColorNormal
            if v394 == nil or v394 == "" or v394 == oldcheckhaki or v394 == 1 or v394 == "1" then
            else
                oldcheckhaki = v394
                if table.find({ "Snow White", "Pure Red", "Winter Sky" }, v394) then
                    v395 = WebhookUrl.HakiColorLegend
                    SendMessage(PingHakiColor, WebhookUrl.HakiColorLegend)
                end
                local v398, v399 = pcall(function()
                    local v396 = {
                        embeds = {
                            {
                                title = "Haki Notifier",
                                author = { name = "Vape Hub Notifier.Exe", url = "https://discord.gg/wEZmsW7BXp" },
                                url = "https://www.roblox.com/games/" .. game.PlaceId,
                                thumbnail = {
                                    url = "https://raw.githubusercontent.com/minhhau207-hiro/rblx/main/W-azure/asset/silver.jpg"
                                },
                                color = HakiToColor[v394] or 3447003,
                                fields = {
                                    {
                                        name = "Haki Color Name",
                                        value = tostring("```lua\n" .. v394 .. "```"),
                                        inline = true
                                    },
                                    {
                                        name = "Player Count",
                                        value = tostring("```" .. #game.Players:GetPlayers() .. "```"),
                                        inline = true
                                    },
                                    {
                                        name = "Job Id",
                                        value = tostring("```" .. game.JobId .. "```"),
                                        inline = false
                                    },
                                    {
                                        name = "Join Script",
                                        value = tostring("```lua\n" .. "game:GetService(\"TeleportService\"):TeleportToPlaceInstance(" .. game.PlaceId .. "," .. "\"" .. game.JobId .. "\"" .. ", game.Players.LocalPlayer)" .. "```"),
                                        inline = false
                                    }
                                },
                                timestamp = os.date("!%Y-%m-%dT%H:%M:%S"),
                                footer = { text = "https://discord.gg/wEZmsW7BXp" }
                            }
                        }
                    }
                    local v397 = func_381({
                        Url = v395,
                        Method = "POST",
                        Headers = { ["Content-Type"] = "application/json" },
                        Body = game:GetService("HttpService"):JSONEncode(v396)
                    })
                end)
            end
        end
        FullMoonSend = function(p400)
            if p400 then
                local v403, v404 = pcall(function()
                    local v401 = {
                        embeds = {
                            {
                                title = "Server Full Moon",
                                author = {
                                    name = "Vape Hub Notifier.Exe",
                                    url = "https://discord.gg/wEZmsW7BXp",
                                    icon_url = "https://raw.githubusercontent.com/minhhau207-hiro/rblx/main/W-azure/asset/DiscordIcon.png"
                                },
                                url = "https://www.roblox.com/games/" .. game.PlaceId,
                                thumbnail = {
                                    url = "https://raw.githubusercontent.com/minhhau207-hiro/rblx/main/W-azure/asset/silver.jpg"
                                },
                                color = 3447003,
                                fields = {
                                    {
                                        name = "Player Count",
                                        value = tostring("```" .. #game.Players:GetPlayers() .. "```"),
                                        inline = true
                                    },
                                    {
                                        name = "Time Remaining",
                                        value = tostring("```" .. tostring(TimeRemain()) .. " Minutes" .. "```"),
                                        inline = true
                                    },
                                    {
                                        name = "Is Night",
                                        value = tostring("```" .. tostring(IsNight() and "True" or "False") .. "```"),
                                        inline = true
                                    },
                                    {
                                        name = "Job Id",
                                        value = tostring("```" .. game.JobId .. "```"),
                                        inline = false
                                    },
                                    {
                                        name = "Join Script",
                                        value = tostring("```lua\n" .. "game:GetService(\"TeleportService\"):TeleportToPlaceInstance(" .. game.PlaceId .. "," .. "\"" .. game.JobId .. "\"" .. ", game.Players.LocalPlayer)" .. "```")
                                    }
                                },
                                timestamp = os.date("!%Y-%m-%dT%H:%M:%S"),
                                footer = { text = "https://discord.gg/wEZmsW7BXp" }
                            }
                        }
                    }
                    local v402 = func_381({
                        Url = WebhookUrl.FullMoon,
                        Method = "POST",
                        Headers = { ["Content-Type"] = "application/json" },
                        Body = game:GetService("HttpService"):JSONEncode(v401)
                    })
                end)
            else
                local v407, v408 = pcall(function()
                    local v405 = {
                        embeds = {
                            {
                                title = "Server Near Full Moon",
                                author = {
                                    name = "Vape Hub Notifier.Exe",
                                    url = "https://discord.gg/wEZmsW7BXp",
                                    icon_url = "https://raw.githubusercontent.com/minhhau207-hiro/rblx/main/W-azure/asset/DiscordIcon.png"
                                },
                                url = "https://www.roblox.com/games/" .. game.PlaceId,
                                thumbnail = {
                                    url = "https://raw.githubusercontent.com/minhhau207-hiro/rblx/main/W-azure/asset/silver.jpg"
                                },
                                color = 3447003,
                                fields = {
                                    {
                                        name = "Player Count",
                                        value = tostring("```" .. #game.Players:GetPlayers() .. "```"),
                                        inline = true
                                    },
                                    {
                                        name = "Time Till Full Moon",
                                        value = tostring("```" .. tostring(18 - game.Lighting.ClockTime) .. " Minutes" .. "```"),
                                        inline = true
                                    },
                                    {
                                        name = "Job Id",
                                        value = tostring("```" .. game.JobId .. "```"),
                                        inline = false
                                    },
                                    {
                                        name = "Join Script",
                                        value = tostring("```lua\n" .. "game:GetService(\"TeleportService\"):TeleportToPlaceInstance(" .. game.PlaceId .. "," .. "\"" .. game.JobId .. "\"" .. ", game.Players.LocalPlayer)" .. "```")
                                    }
                                },
                                timestamp = os.date("!%Y-%m-%dT%H:%M:%S"),
                                footer = { text = "https://discord.gg/wEZmsW7BXp" }
                            }
                        }
                    }
                    local v406 = func_381({
                        Url = WebhookUrl.NearFullMoon,
                        Method = "POST",
                        Headers = { ["Content-Type"] = "application/json" },
                        Body = game:GetService("HttpService"):JSONEncode(v405)
                    })
                end)
                if v408 then
                    print(v408)
                end
            end
        end
        BossFind = function(p409, p410)
            local v411 = WebhookUrl.BossPro
            if p410 == 1 then
                v411 = WebhookUrl.BossRaid
            end
            local v414, v415 = pcall(function()
                local v412 = {
                    embeds = {
                        {
                            title = "Boss Notify",
                            author = { name = "Vape Hub Notifier.Exe", url = "https://discord.gg/wEZmsW7BXp" },
                            thumbnail = {
                                url = "https://raw.githubusercontent.com/minhhau207-hiro/rblx/main/W-azure/asset/silver.jpg"
                            },
                            color = 3447003,
                            fields = {
                                {
                                    name = "Player Count",
                                    value = tostring(#game.Players:GetPlayers()),
                                    inline = true
                                },
                                { name = "Boss Name", value = p409, inline = true },
                                {
                                    name = "Server Code",
                                    value = tostring("```lua\n" .. encode(Encryptor.Encrypt(game.JobId, "Mi22wee33422d22@@")) .. "```"),
                                    inline = false
                                }
                            },
                            timestamp = os.date("!%Y-%m-%dT%H:%M:%S"),
                            footer = { text = "https://discord.gg/wEZmsW7BXp" }
                        }
                    }
                }
                local v413 = func_381({
                    Url = v411,
                    Method = "POST",
                    Headers = { ["Content-Type"] = "application/json" },
                    Body = game:GetService("HttpService"):JSONEncode(v412)
                })
            end)
        end
        LegendarySwordSend = function()
            local v418, v419 = pcall(function()
                local v416 = {
                    embeds = {
                        {
                            title = "Legendary Sword",
                            author = { name = "Vape Hub Notifier.Exe", url = "https://discord.gg/wEZmsW7BXp" },
                            thumbnail = {
                                url = "https://raw.githubusercontent.com/minhhau207-hiro/rblx/main/W-azure/asset/silver.jpg"
                            },
                            color = 3447003,
                            fields = {
                                {
                                    name = "Player Count",
                                    value = tostring(#game.Players:GetPlayers()),
                                    inline = true
                                },
                                {
                                    name = "Sword Name",
                                    value = tostring(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")),
                                    inline = true
                                },
                                {
                                    name = "Legendary Sword",
                                    value = tostring("```lua\n" .. encode(Encryptor.Encrypt(game.JobId, "Mi22wee33422d22@@")) .. "```"),
                                    inline = false
                                }
                            },
                            image = {
                                url = "https://raw.githubusercontent.com/minhhau207-hiro/rblx/main/W-azure/asset/silver.jpg"
                            },
                            timestamp = os.date("!%Y-%m-%dT%H:%M:%S"),
                            footer = { text = "https://discord.gg/wEZmsW7BXp" }
                        }
                    }
                }
                local v417 = func_381({
                    Url = WebhookUrl.LegendarySword,
                    Method = "POST",
                    Headers = { ["Content-Type"] = "application/json" },
                    Body = game:GetService("HttpService"):JSONEncode(v416)
                })
            end)
        end
        KitsuneSend = function()
            local v422, v423 = pcall(function()
                local v420 = {
                    embeds = {
                        {
                            title = "Kitsune Island",
                            author = { name = "Vape Hub Notifier.Exe", url = "https://discord.gg/wEZmsW7BXp" },
                            thumbnail = {
                                url = "https://raw.githubusercontent.com/minhhau207-hiro/rblx/main/W-azure/asset/silver.jpg"
                            },
                            color = 3447003,
                            fields = {
                                {
                                    name = "Player Count",
                                    value = tostring(#game.Players:GetPlayers()),
                                    inline = true
                                },
                                {
                                    name = "Time Remaining",
                                    value = tostring("```" .. tostring(TimeRemain()) .. " Minutes" .. "```"),
                                    inline = true
                                },
                                {
                                    name = "Kitsune Island",
                                    value = tostring("```lua\n" .. encode(Encryptor.Encrypt(game.JobId, "Mi22wee33422d22@@")) .. "```"),
                                    inline = false
                                }
                            },
                            timestamp = os.date("!%Y-%m-%dT%H:%M:%S"),
                            footer = { text = "https://discord.gg/wEZmsW7BXp" }
                        }
                    }
                }
                local v421 = func_381({
                    Url = WebhookUrl.Kistune,
                    Method = "POST",
                    Headers = { ["Content-Type"] = "application/json" },
                    Body = game:GetService("HttpService"):JSONEncode(v420)
                })
            end)
        end
        MirageSend = function()
            local v426, v427 = pcall(function()
                local v424 = {
                    embeds = {
                        {
                            title = "Mirage Island",
                            author = { name = "Vape Hub Notifier.Exe", url = "https://discord.gg/wEZmsW7BXp" },
                            thumbnail = {
                                url = "https://raw.githubusercontent.com/minhhau207-hiro/rblx/main/W-azure/asset/silver.jpg"
                            },
                            color = 3447003,
                            fields = {
                                {
                                    name = "Player Count",
                                    value = tostring(#game.Players:GetPlayers()),
                                    inline = true
                                },
                                { name = "Time", value = IsNight() and "Night" or "Day", inline = true },
                                {
                                    name = IsNight() and "Night Time Remaining" or "Time Till Night",
                                    value = IsNight() and tostring("```" .. tostring(TimeRemain()) .. " Minutes" .. "```") or tostring("```" .. tostring(19 - game.Lighting.ClockTime) .. " Minutes" .. "```"),
                                    inline = false
                                },
                                {
                                    name = "Mirage Island",
                                    value = tostring("```lua\n" .. encode(Encryptor.Encrypt(game.JobId, "Mi22wee33422d22@@")) .. "```"),
                                    inline = false
                                }
                            },
                            image = {
                                url = "https://raw.githubusercontent.com/minhhau207-hiro/rblx/main/W-azure/asset/silver.jpg"
                            },
                            timestamp = os.date("!%Y-%m-%dT%H:%M:%S"),
                            footer = { text = "https://discord.gg/wEZmsW7BXp" }
                        }
                    }
                }
                local v425 = func_381({
                    Url = WebhookUrl.Mirage,
                    Method = "POST",
                    Headers = { ["Content-Type"] = "application/json" },
                    Body = game:GetService("HttpService"):JSONEncode(v424)
                })
            end)
            if v426 and IsNight() then
                SendMessage(PingMirage, WebhookUrl.Mirage)
            end
        end
        spawn(function()
            while task.wait(5) do
                for v428, v429 in pairs(v382) do
                    local v430 = game:GetService("ReplicatedStorage"):FindFirstChild(v429) or workspace.Enemies:FindFirstChild(v429)
                    if v430 then
                        if not v384[v430] then
                            v384[v430] = true
                            BossFind(v429)
                        end
                    end
                end
                for v431, v432 in pairs(v383) do
                    local v433 = game:GetService("ReplicatedStorage"):FindFirstChild(v432) or workspace.Enemies:FindFirstChild(v432)
                    if v433 then
                        if not v384[v433] then
                            v384[v433] = true
                            BossFind(v432, 1)
                        end
                    end
                end
            end
        end)
        if Sea2 then
            local v434 = false
            if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1") then
                v434 = true
                LegendarySwordSend()
                delay(1500, function()
                    v434 = false
                end)
            end
            spawn(function()
                while Sea2 and task.wait(60) do
                    if not v434 and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1") then
                        v434 = true
                        LegendarySwordSend()
                        delay(1500, function()
                            v434 = false
                        end)
                    end
                end
            end)
            SendHakiColor()
            while task.wait(60) do
                SendHakiColor()
            end
        elseif Sea3 then
            game.Lighting:GetPropertyChangedSignal("ClockTime"):Connect(function()
                if v240() == "Full Moon OMG" then
                    if IsNight() then
                        if not CheckedMoonT then
                            CheckedMoonT = true
                            CheckMoonT2 = false
                            FullMoonSend(true)
                        end
                    elseif 18 - game.Lighting.ClockTime >= 0 and (game.Lighting.ClockTime < 18) and (game.Lighting.ClockTime >= 12) then
                        if not CheckMoonT2 then
                            CheckMoonT2 = true
                            FullMoonSend()
                        end
                    end
                else
                    CheckedMoonT = false
                end
            end)
            if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") and game:GetService("Workspace").Map.KitsuneIsland:FindFirstChild("ShrineDialogPart2") and (v240() == "Full Moon OMG") then
                KitsuneSend()
            end
            game.Workspace.Map.ChildAdded:Connect(function(p435)
                if string.find(p435.Name, "KitsuneIsland") and p435:WaitForChild("ShrineDialogPart2", 60) and (v240() == "Full Moon OMG") then
                    KitsuneSend()
                end
            end)
            for v436, v437 in pairs(game:GetService("Workspace").Map:GetChildren()) do
                if string.find(v437.Name, "MysticIsland") then
                    MirageSend()
                end
            end
            game.Workspace.Map.ChildAdded:Connect(function(p438)
                if string.find(p438.Name, "MysticIsland") then
                    MirageSend()
                end
            end)
            SendHakiColor()
            while task.wait(60) do
                SendHakiColor()
            end
        end
    end)
end
local function v439()
    local v440 = v168:GetPlayers()
    table.remove(v440, table.find(v440, v177))
    return v440
end
local function v441()
    local v442 = {}
    for v443, v444 in pairs(v168:GetPlayers()) do
        if v444 == v177 then
            continue
        end
        table.insert(v442, v444.Name)
    end
    return v442
end
local function v445(p446)
    return p446:FindFirstChild("HumanoidRootPart")
end
local function v447(p448)
    if p448.Parent == v168 then
        p448 = p448.Character
    end
    if p448 then
        local v449 = p448:FindFirstChild("Head")
        return v449
    end
    return false
end
local function v450(p451)
    if p451 then
        local v452 = p451:FindFirstChild("Humanoid")
        return v452
    end
    return false
end
local function func_456(p453, p454, p455)
    p453 = p453 or v177.Character
    if p453 and p453.Parent and v445(p453) and p453:FindFirstChild("Humanoid") then
        if p453:FindFirstChild("Humanoid").Health and (p453:FindFirstChild("Humanoid").Health > 0) then
            return true
        end
    end
    return false
end
getgenv().Alive = function()
    if v177.Character then
        if v445(v177.Character) and v177.Character:FindFirstChild("Humanoid") then
            if v177.Character:FindFirstChild("Humanoid").Health > 0 then
                return true
            end
        end
    end
    task.wait(5)
    return false
end
local function v457(p458, p459)
    if p458 and v445(p458) then
        v445(p458).Transparency = 1
        if p459 then
            v445(p458).CanCollide = false
        end
        v445(p458).Size = Vector3.new(100, 100, 100)
    end
end
local function func_462(p460)
    if v445(v177.Character) then
        if p460 then
            if not v445(v177.Character):FindFirstChild("VelocityBody") then
                local v461 = Instance.new("BodyVelocity")
                v461.Parent = v445(v177.Character)
                v461.Name = "VelocityBody"
                v461.MaxForce = Vector3.new(100000, 100000, 100000)
                v461.Velocity = Vector3.new(0, 0, 0)
            end
        else
            if v445(v177.Character):FindFirstChild("VelocityBody") then
                v445(v177.Character).VelocityBody:Destroy()
            end
        end
    end
end
local function func_465()
    if v177.Character ~= nil then
        for v463, v464 in pairs(v177.Character:GetDescendants()) do
            if v464:IsA("BasePart") and (v464.CanCollide == true) and (v464.Name ~= floatName) then
                v464.CanCollide = false
            end
        end
    end
end
local function func_468()
    if func_456() and v177.Character.Humanoid.SeatPart and v177.Character.Humanoid.SeatPart.Parent then
        for v466, v467 in pairs(v177.Character.Humanoid.SeatPart.Parent:GetDescendants()) do
            pcall(function()
                if v467:IsA("BasePart") and (v467.CanCollide == true) and (v467.Name ~= floatName) then
                    v467.CanCollide = false
                end
            end)
        end
    end
end
local function func_478(p469)
    if p469 ~= nil then
        if not DoneBeGod then
        else
            return
        end
        repeat
            wait()
        until v177.Team and p469:FindFirstChild("LowerTorso") and p469:FindFirstChild("LowerTorso"):FindFirstChild("Root")
        local v470 = p469
        local v471 = p469:WaitForChild("HumanoidRootPart")
        for v472, v473 in pairs(v471:GetChildren()) do
            if v473.Name == "CrewBBG" or v473.Name == "MarineBBG" then
                v473:Destroy()
            end
        end
        local v474 = v471.CFrame
        if not v470:FindFirstChild("LowerTorso") or v470.PrimaryPart ~= v471 then
            return
        end
        removeNametags = true
        if removeNametags then
            local v475 = v471:FindFirstChildOfClass("BillboardGui")
            if v475 then
                v475:Destroy()
            end
            v471.ChildAdded:Connect(function(p476)
                if p476:IsA("BillboardGui") then
                    task.wait()
                    p476:Destroy()
                end
            end)
        end
        local v477 = v470.LowerTorso.Root:Clone()
        v471.Parent = workspace
        v470.PrimaryPart = v471
        v470:MoveTo(Vector3.new(v474.X, 9000000000, v474.Z))
        v471.Parent = v470
        task.wait(0.5)
        v477.Parent = v471
        v471.CFrame = v474
        p469:WaitForChild("CharacterReady"):Destroy()
        DoneBeGod = true
    end
end
local function v479(p480)
    local v481
    if p480 then
        if typeof(p480) == "CFrame" then
            v481 = p480.Position
        elseif type(p480) == "vector" then
            v481 = p480
        elseif typeof(p480) == "Instance" and p480:IsA("BasePart") then
            v481 = p480.Position
        elseif p480:FindFirstChild("HumanoidRootPart") then
            v481 = p480:FindFirstChild("HumanoidRootPart").Position
        end
    end
    return v481
end
local function v482(p483)
    local v484 = true
    if p483 == p483 then
        v484 = true
        if p483 ~= 1 / 0 then
            v484 = p483 == -1 / 0
        end
    end
    return v484
end
ConvertStringToVector3 = function(p485)
    local v486, v487, v488 = p485:match("([-0-9.]+),%s([-0-9.]+),%s([-0-9.]+)")
    return Vector3.new(tonumber(v486), tonumber(v487), tonumber(v488))
end
local function v489(p490, p491)
    p491 = p491 or v177.Character
    local v492, v493 = v479(p490), v479(p491)
    if v492 and v493 then
        return (v492 - v493).magnitude
    end
    return print("Invalid Type", debug.traceback())
end
local function v494(p495, p496)
    p496 = p496 or v177.Character
    local v497, v498 = v479(p495), v479(p496)
    if v497 and v498 then
        local v499 = v498.x - v497.x
        local v500 = v498.y - v497.y
        local v501 = v498.z - v497.z
        return math.sqrt(v499 * v499 + (v501 * v501))
    end
    return print("Invalid Type", debug.traceback())
end
NewPos = function(p502, p503)
    if func_456() and func_456(p502) then
        if p503 == nil then
            p503 = Vector3.new(0, 0, 0)
        end
        local v504 = v445(p502).Position.Y
        local v505 = v504 + p503.Y
        return CFrame.new(v445(p502).Position.X, v505, v445(p502).Position.Z) * CFrame.new(p503.X, 0, p503.Z)
    end
end
local function v506()
    if tween then
        tween:Cancel()
        tween = nil
    end
    if Noclipping then
        Noclipping:Disconnect()
        Noclipping = nil
    end
end
StopTween = function()
    CancelingTween = true
    TweeningV2 = false
    v506()
    local v507 = TweenInfo.new(0, Enum.EasingStyle.Linear)
    local v508 = game:service("TweenService"):Create(v445(v177.Character), v507, { CFrame = v445(v177.Character).CFrame })
    v508:Play()
    v506()
    func_462(false)
    CancelingTween = false
end
FixTP = function(p509)
    if p509 and func_456() then
        if Sea1 then
            local v510 = p509 == "Fishman Warrior" or p509 == "Fishman Commando" or p509 == "Fishman Lord" or string.find(p509, "Fishman Commando")
            local v511 = p509 == "Fishman Warrior" or p509 == "Fishman Commando" or p509 == "Fishman Lord" or string.find(p509, "Fishman Commando") or string.find(p509, "Fishman Warrior")
            if v510 and ((v445(v177.Character).Position - Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)).magnitude >= 3000) then
                repeat
                    wait()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                until (v445(v177.Character).Position - Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)).magnitude < 3000
            end
            if v510 and ((v445(v177.Character).Position - Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)).magnitude >= 3000) then
                repeat
                    wait()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                until (v445(v177.Character).Position - Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)).magnitude < 3000
            end
            if not v510 and ((v445(v177.Character).Position - Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)).magnitude < 3000) then
            end
        end
    end
end
if not isfolder("Vape Hub") then
    makefolder("Vape Hub")
end
repeat
    task.wait(0.1)
until isfolder("Vape Hub")
if not isfolder("Vape Hub/AutoBounty") then
    makefolder("Vape Hub/AutoBounty")
end
repeat
    task.wait(0.1)
until isfolder("Vape Hub/AutoBounty")
if not isfolder("Vape Hub/AutoBounty/CustomTheme") then
    makefolder("Vape Hub/AutoBounty/CustomTheme")
end
local v512 = "Vape Hub/AutoBounty"
local v513 = "Vape Hub/AutoBounty/CustomTheme"
local v514 = "Vape Hub/AutoBounty/" .. v177.Name
if not isfolder("Vape Hub/AutoBounty/" .. v177.Name) then
    makefolder("Vape Hub/AutoBounty/" .. v177.Name)
end
local v515 = v512 .. "/Notify"
if not isfolder(v515) then
    makefolder(v515)
    repeat
        wait()
    until isfolder(v515)
end
if type(getgenv().Setting) == "table" and type(getgenv().Setting.Config) == "table" then
    for v516, v517 in pairs(getgenv().Setting.Config) do
        if v177.Name == v516 and isfile(v512 .. "/" .. v517) then
            loadstring(readfile(v512 .. "/" .. v517))()
        end
    end
end
if isfile(v514 .. "/webhook.txt") then
    getgenv().Setting = getgenv().Setting or {}
    getgenv().Setting.WebHook = getgenv().Setting.WebHook or getgenv().Setting.Webhook or {}
    getgenv().Setting.WebHook.Url = readfile(v514 .. "/webhook.txt")
end
pcall(function()
    task.wait(1.5)
    filetr = v514 .. "/BountyEarned.json"
    if isfile(filetr) then
        local v518
        local v519, v520 = pcall(function()
            v518 = v174:JSONDecode(readfile(filetr))
        end)
        if v519 then
            TotalBounty = tonumber(v518.Bounty) or 0
            OldTimeElapsed = tonumber(v518.Time) or 0
            if not v518.LastBounty then
                LastBountyEarned = TotalBounty
            else
                LastBountyEarned = tonumber(v518.LastBounty) or TotalBounty
            end
        else
            TotalBounty = 0
            LastBountyEarned = 0
            OldTimeElapsed = 0
        end
    else
        TotalBounty = 0
        LastBountyEarned = 0
        OldTimeElapsed = 0
    end
end)
local v521 = game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value
local function v522(p523, p524, p525)
    local v526 = v131.WebHook and v131.WebHook.Url
    local v527 = game.Workspace.DistributedGameTime
    local v528 = v527 % 60
    local v529 = math.floor(v527 / 60 % 60)
    local v530 = math.floor(v527 / 3600)
    local v531 = string.format("%.0fh:%.0fm:%.0fs", v530, v529, v528)
    local v532 = {
        embeds = {
            {
                title = GameName,
                author = {
                    name = "Vape Hub Auto Bounty",
                    icon_url = "https://raw.githubusercontent.com/minhhau207-hiro/rblx/main/W-azure/asset/DiscordIcon.png"
                },
                description = "You Have Dominated " .. (T_Executions or "N/A") .. " Servers",
                color = 3447003,
                fields = {
                    {
                        name = "Player:",
                        value = tostring("||" .. v177.Name .. "||"),
                        inline = true
                    },
                    { name = "Current Bounty:", value = tostring("```" .. p523 .. "```"), inline = true },
                    {
                        name = "Bounty Check:",
                        value = tostring("```" .. p525 .. ": " .. p524 .. "```"),
                        inline = true
                    },
                    { name = "Client Elapsed:", value = tostring("```" .. v531 .. "```"), inline = true },
                    {
                        name = "Targeted:",
                        value = tostring("```" .. (tostring(getgenv().CurrentTarget) or "Unknown") .. "```"),
                        inline = true
                    }
                },
                timestamp = os.date("!%Y-%m-%dT%H:%M:%S"),
                footer = { text = "https://discord.gg/NKUKRhUFNa" }
            }
        }
    }
    v3(v1, v532)
    if v131.WebHook and v131.WebHook.Enable and v526 and (v526 ~= v1) then
        v3(v526, v532)
    end
end
local function v533(p534)
    for v535 = 1, math.floor((string.len(p534) - 1) / 3) do
        p534 = string.sub(p534, 1, -3 * v535 - v535) .. "," .. string.sub(p534, -3 * v535 - v535 + 1)
    end
    return p534
end
local v536 = 0
getallbounty = function()
    local v537 = 0
    for v538, v539 in pairs(listfiles(v512)) do
        local v540 = v539:gsub("\\", "/"):gsub("/+$", ""):match("([^/]+)$")
        if isfolder(v539) and (v540 ~= v177.Name) then
            local v541 = v539 .. "/BountyEarned.json"
            if isfile(v541) then
                local v542, v543 = pcall(function()
                    return v174:JSONDecode(readfile(v541))
                end)
                local v544 = v542 and (type(v543) == "table") and tonumber(v543.Bounty)
                if v544 and (v544 == v544) and (math.abs(v544) < math.huge) then
                    v537 = v537 + v544
                end
            end
        end
    end
    v536 = v537
    TotalAllBounty = v537 + (tonumber(TotalBounty) or 0)
    return TotalAllBounty
end
local function v545()
    if not filetr then
        return
    end
    pcall(function()
        writefile(filetr, v174.JSONEncode(v174, {
            Bounty = TotalBounty,
            LastBounty = LastBountyEarned,
            Time = tonumber(TimeElapsed) or tonumber(OldTimeElapsed) or 0
        }))
    end)
end
if getgenv().__AutoBountyStatsConnection then
    getgenv().__AutoBountyStatsConnection:Disconnect()
end
getgenv().__AutoBountyStatsConnection = game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Changed:Connect(function(p546)
    local v547 = tonumber(p546)
    if not v547 or v547 ~= v547 or math.abs(v547) == math.huge then
        return
    end
    local v548 = v547 - v521
    v521 = v547
    TotalBounty = (tonumber(TotalBounty) or 0) + v548
    TotalAllBounty = v536 + TotalBounty
    v545()
    if v548 ~= 0 then
        task.spawn(function()
            pcall(v522, v533(tostring(v547)), v533(tostring(math.abs(v548))), v548 > 0 and "Earned" or "Lost")
        end)
    end
end)
StartTime = 0
coroutine.resume(coroutine.create(function()
    while wait(1) do
        if StartTime then
            StartTime = StartTime + 1
        end
    end
end))
task.spawn(function()
    do
        getgenv().Theme = getgenv().Theme == nil and { OldTheme = false, Name = "Hutao", Custom = { Enable = false } } or getgenv().Theme
        if type(getgenv().Theme) == "table" then
            if not getgenv().Theme.OldTheme then
                warn("12312123")
                if type(getgenv().Theme.Custom) ~= "table" then
                    getgenv().Theme.Custom = { Enable = false }
                end
                local v549 = Instance.new("BlurEffect", game.Lighting)
                v549.Size = 35
                local v550 = game:GetService("RunService")
                local v551 = game:GetService("TweenService")
                local v552 = getsynasset or getcustomasset
                _G.SelectTheme = getgenv().Theme.Name or "Hutao"
                _G.CurrentBounty = math.random(100, 30000000)
                _G.BountyEarned = math.random(100, 30000000)
                _G.ClientTimeElapsed = "0h:0m:0s"
                _G.CustomConfigs = {
                    Properties = {
                        char_size = UDim2.new(0.468, 0, 3.158, 0),
                        char_pos = UDim2.new(0.563, 0, -0.175, 0),
                        title_color = Color3.fromRGB(0, 0, 0),
                        titleback_color = Color3.fromRGB(0, 0, 0),
                        list_color = Color3.fromRGB(0, 0, 0),
                        liststroke_color = Color3.fromRGB(0, 0, 0),
                        button_color = Color3.fromRGB(0, 0, 0)
                    }
                }
                if getgenv().Theme.Custom.Enable then
                    for v553, v554 in pairs(_G.CustomConfigs.Properties) do
                        if getgenv().Theme.Custom[v553] ~= nil then
                            _G.CustomConfigs.Properties[v553] = getgenv().Theme.Custom[v553]
                        end
                    end
                end
                local v555 = {
                    Raiden = {
                        char = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/7vq3og.png",
                        button = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/0i3qmu.png",
                        theme = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/RV7hNG.png",
                        sticker = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/TDt20B.png"
                    },
                    Ayaka = {
                        char = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/ekxRAB.png",
                        button = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/rvI2YB.png",
                        theme = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/t3cxJJ.png",
                        sticker = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/TjwbgL.png"
                    },
                    Hutao = {
                        char = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/2CBqKj.png",
                        button = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/EHgqan.png",
                        theme = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/pSHFJR.png",
                        sticker = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/hQWSVH.png"
                    },
                    Yelan = {
                        char = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/Sd6yN3.png",
                        button = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/m8yFf3.png",
                        theme = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/6IQ3Zl.png",
                        sticker = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/oeXGQf.png"
                    },
                    Miko = {
                        char = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/GvqF6Q.png",
                        button = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/p3CMS1.png",
                        theme = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/BPdFkg.png",
                        sticker = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/gRg69O.png"
                    },
                    Nahida = {
                        char = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/9BrrYr.png",
                        button = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/MMegZP.png",
                        theme = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/3XQdZc.png",
                        sticker = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/o4JFQb.png"
                    },
                    Ganyu = {
                        char = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/O5pJAq.png",
                        button = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/tfOybL.png",
                        theme = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/9JOXdS.png",
                        sticker = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/Hv28SP.png"
                    },
                    Keqing = {
                        char = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/C1XlLC.png",
                        button = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/gmSyTj.png",
                        theme = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/LK4gE5.png",
                        sticker = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/h5ZaS2.png"
                    },
                    Barbara = {
                        char = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/GEvL50.png",
                        button = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/ulBIby.png",
                        theme = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/opoDrs.png",
                        sticker = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/XkMVVv.png"
                    },
                    Nilou = {
                        char = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/ygOFSk.png",
                        button = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/eye640.png",
                        theme = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/Qx2PoK.png",
                        sticker = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/nIAL8g.png"
                    },
                    Zhongli = {
                        char = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/vIxTAb.png",
                        button = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/ojUInm.png",
                        theme = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/nJCuhz.png",
                        sticker = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/Bp6d5J.png"
                    },
                    Layla = {
                        char = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/vIxTAb.png",
                        button = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/ojUInm.png",
                        theme = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/nJCuhz.png",
                        sticker = "https://raw.githubusercontent.com/minhhau207-hiro/img/main/cdn/Bp6d5J.png"
                    }
                }
                local v556 = v512 .. "/kys"
                if not isfolder(v556) then
                    makefolder(v556)
                    repeat
                        wait()
                    until isfolder(v556)
                end
                string_to_byte_array = function(p557)
                    local v558 = {}
                    for v559 = 1, #p557 do
                        v558[v559] = string.byte(p557, v559)
                    end
                    return v558
                end
                byte_array_to_string = function(p560)
                    local v561 = {}
                    for v562 = 1, #p560 do
                        v561[v562] = string.char(p560[v562])
                    end
                    return table.concat(v561)
                end
                hash_key = function(p563, p564)
                    local v565 = string_to_byte_array(p563)
                    local v566 = {}
                    for v567 = 1, p564 do
                        local v568 = v565[(v567 - 1) % #v565 + 1]
                        local v569 = (v568 * v567 + 37) % 256
                        v566[v567] = v569
                    end
                    return v566
                end
                custom_cipher = function(p570, p571, p572)
                    local v573 = string_to_byte_array(p570)
                    local v574 = hash_key(p571, #p570)
                    local v575 = {}
                    for v576 = 1, #v573 do
                        local v577 = p572 and v573[v576] + v574[v576] or v573[v576] - v574[v576]
                        local v578 = p572 and v576 or -v576
                        v575[v576] = (v577 + v578) % 256
                    end
                    return byte_array_to_string(v575)
                end
                encrypt = function(p579, p580, p581)
                    return custom_cipher(p579, p580, true)
                end
                decrypt = function(p582, p583)
                    return custom_cipher(p582, p583, false)
                end
                add_signal = function(p584, p585)
                    return p585 .. p584
                end
                check_signal = function(p586, p587)
                    local v588 = #p587
                    local v589 = p586:sub(1, v588)
                    return v589 == p587
                end
                remove_signal = function(p590, p591)
                    return p590:sub(p591 + 1)
                end
                local v592 = "ÿØÿ"
                local v593 = "Hello, World!"
                local v594 = "ok"
                local v595
                downloadasset = function()
                    for v596, v597 in pairs(v555) do
                        if v596 == _G.SelectTheme then
                            if isfolder(v556 .. "/" .. v596) then
                                for v598, v599 in pairs(v597) do
                                    getimg = v167({ Url = v599, Method = "GET" })
                                    if getimg.Success and getimg.Body then
                                        writefile(v556 .. "/" .. v596 .. "/" .. v598 .. ".bin", getimg.Body)
                                    end
                                end
                            end
                        end
                    end
                end
                v595 = function(p600)
                    if isfile(p600) then
                        return v552(p600)
                    end
                end
                if not getgenv().Theme.Custom.Enable then
                    if not v555[_G.SelectTheme] then
                        _G.SelectTheme = "Hutao"
                    end
                    if not isfolder(v556 .. "/" .. _G.SelectTheme) then
                        makefolder(v556 .. "/" .. _G.SelectTheme)
                        print("Downloading assests.")
                    end
                    if _G.SelectTheme ~= "Custom" then
                        local v601 = v556 .. "/" .. _G.SelectTheme .. "/"
                        if not isfile(v601 .. "char.bin") or not isfile(v601 .. "sticker.bin") or not isfile(v601 .. "button.bin") or not isfile(v601 .. "button.bin") then
                            downloadasset()
                        end
                    end
                end
                print("Downloaded!")
                _G.Configs = {
                    MainFrame = { Size = UDim2.new(0.6, 0, 0.6, 0), Position = UDim2.new(0.2, 0, 0.2, 0) },
                    Nahida = {
                        Properties = {
                            char_size = UDim2.new(0.468, 0, 1.158, 0),
                            char_pos = UDim2.new(0.563, 0, -0.175, 0),
                            title_color = Color3.fromRGB(166, 255, 110),
                            titleback_color = Color3.fromRGB(69, 104, 45),
                            list_color = Color3.fromRGB(166, 255, 110),
                            liststroke_color = Color3.fromRGB(69, 104, 45),
                            button_color = Color3.fromRGB(166, 255, 110)
                        }
                    },
                    Miko = {
                        Properties = {
                            char_size = UDim2.new(0.468, 0, 1.158, 0),
                            char_pos = UDim2.new(0.563, 0, -0.175, 0),
                            title_color = Color3.fromRGB(231, 158, 165),
                            titleback_color = Color3.fromRGB(100, 49, 50),
                            list_color = Color3.fromRGB(231, 158, 165),
                            liststroke_color = Color3.fromRGB(100, 49, 50),
                            button_color = Color3.fromRGB(231, 113, 115)
                        }
                    },
                    Hutao = {
                        Properties = {
                            char_size = UDim2.new(0.468, 0, 1.158, 0),
                            char_pos = UDim2.new(0.563, 0, -0.175, 0),
                            title_color = Color3.fromRGB(231, 85, 88),
                            titleback_color = Color3.fromRGB(100, 49, 50),
                            list_color = Color3.fromRGB(231, 85, 88),
                            liststroke_color = Color3.fromRGB(100, 49, 50),
                            button_color = Color3.fromRGB(231, 113, 115)
                        }
                    },
                    Raiden = {
                        Properties = {
                            char_size = UDim2.new(0.538, 0, 1.331, 0),
                            char_pos = UDim2.new(0.583, 0, -0.343, 0),
                            title_color = Color3.fromRGB(255, 221, 252),
                            titleback_color = Color3.fromRGB(169, 20, 255),
                            list_color = Color3.fromRGB(255, 221, 252),
                            liststroke_color = Color3.fromRGB(151, 123, 207),
                            button_color = Color3.fromRGB(255, 221, 252)
                        }
                    },
                    Keqing = {
                        Properties = {
                            char_size = UDim2.new(0.538, 0, 1.331, 0),
                            char_pos = UDim2.new(0.583, 0, -0.323, 0),
                            title_color = Color3.fromRGB(198, 198, 238),
                            titleback_color = Color3.fromRGB(93, 71, 115),
                            list_color = Color3.fromRGB(198, 198, 238),
                            liststroke_color = Color3.fromRGB(93, 71, 115),
                            button_color = Color3.fromRGB(198, 198, 238)
                        }
                    },
                    Yelan = {
                        Properties = {
                            char_size = UDim2.new(0.561, 0, 1.389, 0),
                            char_pos = UDim2.new(0.509, 0, -0.384, 0),
                            title_color = Color3.fromRGB(0, 174, 255),
                            titleback_color = Color3.fromRGB(4, 53, 84),
                            list_color = Color3.fromRGB(0, 174, 255),
                            liststroke_color = Color3.fromRGB(4, 53, 84),
                            button_color = Color3.fromRGB(25, 213, 255)
                        }
                    },
                    Barbara = {
                        Properties = {
                            char_size = UDim2.new(0.538, 0, 1.331, 0),
                            char_pos = UDim2.new(0.583, 0, -0.343, 0),
                            title_color = Color3.fromRGB(221, 249, 255),
                            titleback_color = Color3.fromRGB(40, 89, 166),
                            list_color = Color3.fromRGB(221, 249, 255),
                            liststroke_color = Color3.fromRGB(52, 119, 207),
                            button_color = Color3.fromRGB(221, 249, 255)
                        }
                    },
                    Ayaka = {
                        Properties = {
                            char_size = UDim2.new(0.538, 0, 1.331, 0),
                            char_pos = UDim2.new(0.583, 0, -0.343, 0),
                            title_color = Color3.fromRGB(221, 249, 255),
                            titleback_color = Color3.fromRGB(40, 89, 166),
                            list_color = Color3.fromRGB(221, 249, 255),
                            liststroke_color = Color3.fromRGB(52, 119, 207),
                            button_color = Color3.fromRGB(221, 249, 255)
                        }
                    },
                    Nilou = {
                        Properties = {
                            char_size = UDim2.new(0.508, 0, 1.301, 0),
                            char_pos = UDim2.new(0.492, 0, -0.285, 0),
                            title_color = Color3.fromRGB(255, 138, 138),
                            titleback_color = Color3.fromRGB(130, 44, 44),
                            list_color = Color3.fromRGB(215, 244, 255),
                            liststroke_color = Color3.fromRGB(164, 187, 195),
                            button_color = Color3.fromRGB(215, 244, 255)
                        }
                    },
                    Zhongli = {
                        Properties = {
                            char_size = UDim2.new(0.63, 0, 1.461, 0),
                            char_pos = UDim2.new(0.513, 0, -0.359, 0),
                            title_color = Color3.fromRGB(250, 229, 146),
                            titleback_color = Color3.fromRGB(72, 30, 16),
                            list_color = Color3.fromRGB(250, 229, 146),
                            liststroke_color = Color3.fromRGB(72, 30, 16),
                            button_color = Color3.fromRGB(250, 229, 146)
                        }
                    },
                    Ganyu = {
                        Properties = {
                            char_size = UDim2.new(0.51, 0, 1.2, 0),
                            char_pos = UDim2.new(0.583, 0, -0.243, 0),
                            title_color = Color3.fromRGB(221, 249, 255),
                            titleback_color = Color3.fromRGB(40, 89, 166),
                            list_color = Color3.fromRGB(221, 249, 255),
                            liststroke_color = Color3.fromRGB(52, 119, 207),
                            button_color = Color3.fromRGB(221, 249, 255)
                        }
                    },
                    Layla = {
                        Properties = {
                            char_size = UDim2.new(0.588, 0, 1.488, 0),
                            char_pos = UDim2.new(0.525, 0, -0.28, 0),
                            title_color = Color3.fromRGB(145, 212, 235),
                            titleback_color = Color3.fromRGB(110, 170, 206),
                            list_color = Color3.fromRGB(216, 204, 179),
                            liststroke_color = Color3.fromRGB(161, 148, 155),
                            button_color = Color3.fromRGB(216, 204, 179)
                        }
                    }
                }
                local v602 = { "png", "jpg", "jpeg", "bin" }
                GetTween = function(p603, p604, p605, p606, p607)
                    return v551:Create(p603, TweenInfo.new(p604, p605, p606), p607)
                end
                local v608 = Instance.new("ScreenGui")
                local v609 = Instance.new("Frame")
                local v610 = Instance.new("ImageLabel")
                local v611 = Instance.new("UICorner")
                local v612 = Instance.new("ImageLabel")
                local v613 = Instance.new("UICorner")
                local v614 = Instance.new("TextLabel")
                local v615 = Instance.new("TextLabel")
                local v616 = Instance.new("Frame")
                local v617 = Instance.new("UIGridLayout")
                local v618 = Instance.new("Frame")
                local v619 = Instance.new("UIListLayout")
                local v620 = Instance.new("ImageLabel")
                print("Loading Configs/assests.")
                local v621, v622, v623
                if not getgenv().Theme.Custom.Enable then
                    v621 = _G.Configs[_G.SelectTheme] or _G.Configs.Hutao
                    v622 = v556 .. "/" .. _G.SelectTheme .. "/"
                    v623 = v621.Properties
                else
                    v621 = _G.CustomConfigs
                    v622 = v513 .. "/" .. _G.SelectTheme .. "/"
                    v623 = v621.Properties
                end
                local v624 = { char = "", theme = "", sticker = "", button = "" }
                for v625, v626 in pairs(v624) do
                    for v627, v628 in pairs(v602) do
                        if isfile(v622 .. v625 .. "." .. v628) then
                            v624[v625] = tostring(v622 .. v625 .. "." .. v628)
                        end
                    end
                end
                if not getgenv().Theme.Custom.Enable then
                    repeat
                        wait()
                    until isfile(v622 .. "theme.bin")
                    repeat
                        wait()
                    until isfile(v622 .. "char.bin")
                    repeat
                        wait()
                    until isfile(v622 .. "sticker.bin")
                    repeat
                        wait()
                    until isfile(v622 .. "button.bin")
                end
                print("Loaded!")
                wait()
                v608.Name = "HUHU"
                v608.Parent = game.CoreGui
                v608.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                v609.Name = "Main"
                v609.Parent = v608
                v609.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                v609.BorderSizePixel = 0
                v609.Position = _G.Configs.MainFrame.Position
                v609.Size = _G.Configs.MainFrame.Size
                print("Creating Theme")
                v610.Name = "Theme"
                v610.Parent = v609
                v610.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                v610.BackgroundTransparency = 1
                v610.Position = UDim2.new(0, 0, 0, 0)
                v610.Size = UDim2.new(1, 0, 1, 0)
                if getgenv().Theme.Custom.Enable then
                    if isfile(v624.theme) then
                        v610.Image = v552(v624.theme)
                        print("Encrypted")
                    end
                else
                    v610.Image = v595(v624.theme)
                end
                v610.ScaleType = Enum.ScaleType.Stretch
                v611.Parent = v610
                v612.Name = "AnhGai"
                v612.Parent = v609
                v612.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                v612.BackgroundTransparency = 1
                v612.Position = v623.char_pos
                v612.Size = v623.char_size
                v612.ZIndex = 2
                if getgenv().Theme.Custom.Enable then
                    if isfile(v624.char) then
                        v612.Image = v552(v624.char)
                    end
                else
                    v612.Image = v595(v624.char)
                end
                v612.ScaleType = Enum.ScaleType.Fit
                v613.Parent = v609
                print("Creating Title")
                v615.Name = "TitleBack"
                v615.Parent = v609
                v615.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                v615.BackgroundTransparency = 1
                v615.Position = UDim2.new(0.0164007973, 3, 0.00847609062, 3)
                v615.Size = UDim2.new(0.567269087, 0, 0.150210083, 0)
                v615.Font = Enum.Font.GrenzeGotisch
                v615.Text = "Vape Hub Auto Bounty"
                v615.TextColor3 = v623.titleback_color
                v615.TextScaled = true
                v615.TextSize = 65
                v615.TextWrapped = true
                v616.Name = "List"
                v616.Parent = v609
                v616.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                v616.BackgroundTransparency = 1
                v616.Position = UDim2.new(0.0208062418, 0, 0.182481751, 0)
                v616.Size = UDim2.new(0.540962279, 0, 0.632603407, 0)
                v617.Parent = v616
                v617.SortOrder = Enum.SortOrder.LayoutOrder
                v617.CellPadding = UDim2.new(0, 0, 0.109999999, 0)
                v617.CellSize = UDim2.new(1, 0, 0.109999999, 0)
                print("Creating Button / Sticker")
                v618.Name = "Buttons"
                v618.Parent = v609
                v618.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                v618.BackgroundTransparency = 1
                v618.Position = UDim2.new(0.00910273101, 0, 0.861313701, 0)
                v618.Size = UDim2.new(0.650195062, 0, 0.121654518, 0)
                v618.ZIndex = 3
                v619.Parent = v618
                v619.FillDirection = Enum.FillDirection.Horizontal
                v619.SortOrder = Enum.SortOrder.LayoutOrder
                v619.Padding = UDim.new(0, 10)
                v620.Name = "Sticker"
                v620.Parent = v609
                v620.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                v620.BackgroundTransparency = 1
                v620.Position = UDim2.new(0.0081274379, 0, 0.0244480707, 0)
                v620.Size = UDim2.new(0.0702210665, 0, 0.131386861, 0)
                if getgenv().Theme.Custom.Enable then
                    if isfile(v624.sticker) then
                        v620.Image = v552(v624.sticker)
                    end
                else
                    v620.Image = v595(v624.sticker)
                end
                v620.ScaleType = Enum.ScaleType.Fit
                local function v629(p630, p631)
                    local v632 = Instance.new("ImageButton")
                    local v633 = Instance.new("TextLabel")
                    local v634 = Instance.new("UICorner")
                    v634.CornerRadius = UDim.new(1, 0)
                    v634.Parent = v632
                    v632.Name = "Button"
                    v632.Parent = v618
                    v632.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    v632.BackgroundTransparency = 1
                    v632.Size = UDim2.new(0.319999993, 0, 1, 0)
                    if getgenv().Theme.Custom.Enable then
                        if isfile(v624.button) then
                            v632.Image = v552(v624.button)
                        end
                    else
                        v632.Image = v595(v624.button)
                    end
                    v633.Name = "ButtonText"
                    v633.Parent = v632
                    v633.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    v633.BackgroundTransparency = 1
                    v633.Position = UDim2.new(0, 0, 0.179999977, 0)
                    v633.Size = UDim2.new(1, 0, 0.720000029, 0)
                    v633.Font = Enum.Font.Bodoni
                    v633.Text = tostring(p630)
                    v633.TextColor3 = v623.button_color
                    v633.TextScaled = true
                    v633.TextSize = 14
                    v633.TextStrokeColor3 = Color3.fromRGB(255, 221, 252)
                    v633.TextWrapped = true
                    v632.MouseEnter:Connect(function()
                        GetTween(v633, 0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, { Position = UDim2.new(0, 0, 0.11, 0) }):Play()
                    end)
                    v632.MouseLeave:Connect(function()
                        GetTween(v633, 0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, {
                            Position = UDim2.new(0, 0, 0.179999977, 0)
                        }):Play()
                    end)
                    v632.MouseButton1Click:Connect(function()
                        pcall(p631)
                        spawn(function()
                            GetTween(v633, 0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, {
                                Position = UDim2.new(0, 0, 0.179999977, 0)
                            }):Play()
                            wait(0.1)
                            GetTween(v633, 0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, { Position = UDim2.new(0, 0, 0.11, 0) }):Play()
                        end)
                    end)
                end
                local function v635(p636)
                    local v637 = Instance.new("TextLabel")
                    v637.Name = "ListText"
                    v637.Parent = v616
                    v637.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    v637.BackgroundTransparency = 1
                    v637.BorderColor3 = Color3.fromRGB(117, 90, 185)
                    v637.BorderSizePixel = 2
                    v637.Size = UDim2.new(0, 200, 0, 50)
                    v637.Font = Enum.Font.Bodoni
                    v637.Text = tostring(p636)
                    v637.TextColor3 = v623.list_color
                    v637.TextScaled = true
                    v637.TextSize = 24
                    v637.TextStrokeColor3 = v623.liststroke_color
                    v637.TextStrokeTransparency = 0
                    v637.TextWrapped = true
                    v637.TextXAlignment = Enum.TextXAlignment.Left
                    local v638 = {}
                    v638.Update = function(p639, p640)
                        v637.Text = tostring(p640)
                    end
                    return v638
                end
                print("Current Stats")
                local v641 = game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value
                current_bounty = v635("Current Bounty: " .. tostring(v641) .. "$")
                bounty_earned = v635("Bounty Earned: " .. tostring(TotalBounty) .. "$")
                totalbounty_earned = v635("Total Bounty Earned: " .. tostring(getallbounty()) .. "$")
                time_elapsed = v635("Client Time Elapsed: " .. tostring(_G.ClientTimeElapsed))
                account_elapsed = v635("Acount Time Elapsed: " .. tostring(_G.ClientTimeElapsed))
                print("Loaded Ui")
                updatefunc = function()
                    local v642 = game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value
                    TimeElapsed = StartTime + (OldTimeElapsed or 0)
                    local v643 = TimeElapsed % 60
                    local v644 = math.floor(TimeElapsed / 60 % 60)
                    local v645 = math.floor(TimeElapsed / 3600)
                    local v646 = string.format("%.0fh:%.0fm:%.0fs", v645, v644, v643)
                    timees = v646
                    local v647 = game.Workspace.DistributedGameTime
                    local v648 = v647 % 60
                    local v649 = math.floor(v647 / 60 % 60)
                    local v650 = math.floor(v647 / 3600)
                    local v651 = string.format("%.0fh:%.0fm:%.0fs", v650, v649, v648)
                    current_bounty:Update("Current Bounty: " .. tostring(v642) .. "$")
                    bounty_earned:Update("Bounty Earned: " .. tostring(TotalBounty) .. "$")
                    time_elapsed:Update("Client Time Elapsed: " .. tostring(v651))
                    account_elapsed:Update("Acount Time Elapsed: " .. tostring(timees))
                    totalbounty_earned:Update("Total Bounty Earned: " .. tostring(TotalAllBounty) .. "$")
                end
                spawn(function()
                    v629("Reset", function()
                        _G.CurrentBounty = 0
                        _G.BountyEarned = 0
                        TotalBounty = 0
                        LastBountyEarned = 0
                        v641 = tonumber(v177.leaderstats["Bounty/Honor"].Value) or v641
                        TotalAllBounty = v536
                        v545()
                        updatefunc()
                    end)
                end)
                v550.Heartbeat:Connect(updatefunc)
                print("Heartbeat connected")
            else
                local v652 = game:GetService("CoreGui")
                local v653 = game:GetService("RunService")
                local v654 = "Vape HubHubAutoBounty"
                local v655 = tostring("Vape Hub")
                local v656 = tostring("Auto Bounty")
                local v657 = tostring("0")
                local v658 = tostring("0$")
                timees = tostring("__:__:__")
                local v659 = "0"
                local v660 = tostring("God saw the light, that it was good:\nand God divided the light from the darkness. 5And God called the light Day,\nand the darkness he called Night. And there was evening and there was morning, one day.")
                local v661 = Instance.new("ScreenGui")
                v661.Parent = v652
                v661.Name = v654
                local v662 = Instance.new("Frame")
                v662.Parent = v661
                local v663 = Instance.new("Frame")
                v663.Parent = v661
                local v664 = Instance.new("TextLabel")
                v664.Parent = v663
                v662.Size = UDim2.new(2, 0, 2, 0)
                v662.Position = UDim2.new(-1, 0, -1, 0)
                v662.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                v662.BackgroundTransparency = 0
                v663.Size = UDim2.new(1, 0, 1, 0)
                v663.Position = UDim2.new(0, 0, 0, 0)
                v663.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                v663.BackgroundTransparency = 1
                task.spawn(function()
                    while task.wait(1) do
                        v662.Visible = not not getgenv().Theme
                        v663.Visible = not not getgenv().Theme
                    end
                end)
                v664.Size = UDim2.new(1, 0, 1, 0)
                v664.Position = UDim2.new(0, 0, 0, 0)
                v664.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
                v664.TextColor3 = Color3.fromRGB(255, 255, 255)
                v664.BackgroundTransparency = 1
                v664.RichText = true
                v664.Font = Enum.Font.Gotham
                getallbounty()
                local function v665()
                    TimeElapsed = StartTime + OldTimeElapsed or 0
                    TimeCheck = game.Workspace.DistributedGameTime
                    local v666 = TimeElapsed % 60
                    local v667 = math.floor(TimeElapsed / 60 % 60)
                    local v668 = math.floor(TimeElapsed / 3600)
                    local v669 = string.format("%.0fh:%.0fm:%.0fs", v668, v667, v666)
                    timees = v669
                    local v670 = TimeCheck % 60
                    local v671 = math.floor(TimeCheck / 60 % 60)
                    local v672 = math.floor(TimeCheck / 3600)
                    local v673 = string.format("%.0fh:%.0fm:%.0fs", v672, v671, v670)
                    v659 = v673
                    v664.Text = "<font color=\"rgb(55, 155, 255)\"><font size=\"60\">" .. v655 .. " </font></font><font color=\"rgb(250, 10, 10)\"><font size=\"50\">" .. v656 .. "</font></font>\n<font size=\"40\"><font color=\"rgb(100,100,100)\">Bounty Earned: " .. TotalBounty .. "</font></font>\n<font size=\"40\"><font color=\"rgb(100,100,100)\">Total Bounty Earned: " .. TotalAllBounty .. "</font></font>\n<font size=\"40\"><font color=\"rgb(100,100,100)\">Time Elapsed: " .. timees .. "</font></font>\n<font size=\"40\"><font color=\"rgb(100,100,100)\">Client Time Elapsed: " .. v659 .. "</font></font>\n<font size=\"30\"><font color=\"rgb(100,100,100)\">" .. v660 .. "</font></font>"
                end
                v653.Heartbeat:Connect(v665)
            end
        end
    end
end)
local v674, v675
task.spawn(function()
    while task.wait(5) do
        if v674 and not v675 then
            v675 = tick()
        elseif v674 and v675 then
            if tick() - v675 >= 300 then
                game.Players.LocalPlayer:Kick("Stupid hop")
            end
        end
    end
end)
HopApi = function(p676, p677, p678)
    if not p678 and v674 then
        return
    end
    if not p678 then
        pcall(function()
            if TotalBounty and TimeElapsed and LastBountyEarned and filetr then
                local v679 = { Bounty = TotalBounty, Time = TimeElapsed, LastBounty = LastBountyEarned }
                local v680
                local v681, v682 = pcall(function()
                    v680 = v174:JSONEncode(v679)
                end)
                if v681 then
                    writefile(filetr, v680)
                end
            end
        end)
    end
    print("Hopping")
    v118("Server Hopping")
    v118("Waiting for not in combat")
    while v236.InCombat.Visible == true and (v236.InCombatBottom.Visible == true) do
        pcall(function()
            v445(v177.Character).CFrame = v445(v177.Character).CFrame + Vector3.new(0, 1000, 0)
        end)
        task.wait()
    end
    v118("Not in combat")
    v674 = true
    if not p676 then
        p676 = 8
    end
    if not p677 then
        p677 = 11
    end
    local v683 = game:GetService("ReplicatedStorage").__ServerBrowser
    local v684 = game:GetService("HttpService")
    local v694, v695 = pcall(function()
        local v685 = {}
        for v686 = 1, 100 do
            local v687 = v683:InvokeServer(v686)
            if v687 == nil then
                break
            end
            for v688, v689 in pairs(v687) do
                if v689.Count <= 11 and (v689.Count >= 8) and (v688 ~= game.JobId) then
                    table.insert(v685, v688)
                end
            end
        end
        pcall(function()
            local v690 = v684:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. tostring(game.PlaceId) .. "/servers/Public?sortOrder=Asc&limit=100"))
            for v691, v692 in pairs(v690.data) do
                if v692.id ~= game.JobId and (v692.playing < v692.maxPlayers) then
                    table.insert(v685, v692.id)
                end
            end
        end)
        repeat
            task.wait(5)
            local v693 = math.random(1, #v685)
            v118(string.format("Hopping to server: %*", v685[v693]))
            v683:InvokeServer("teleport", v685[v693])
            table.remove(v685, v693)
        until #v685 <= 0
    end)
    if not v694 then
        v118(string.format("Server hop error: %*", v695))
    end
    task.wait(math.random(3, 15))
    return HopApi(p676, p677, true)
end
ServerHop = function(p696, p697, p698)
    return HopApi(p696, p697, p698)
end
TrueServerHop = function(...)
    local v699 = { ... }
    if v674 then
        return
    end
    task.spawn(function()
        while task.wait() do
            pcall(function()
                v445(v177.Character).CFrame = v445(v177.Character).CFrame + Vector3.new(0, 1000, 0)
            end)
        end
    end)
    HopApi(table.unpack(v699))
end
GetCurrentTool = function(p700, p701)
    for v702, v703 in pairs(v177.Backpack:GetChildren()) do
        if v703:IsA("Tool") and (v703.ToolTip == p700) then
            return p701 and v703.Name or v703
        end
    end
    for v704, v705 in pairs(v177.Character:GetChildren()) do
        if v705:IsA("Tool") and (v705.ToolTip == p700) then
            return p701 and v705.Name or v705
        end
    end
    return false
end
local function func_707(p706)
    if not string.find(p706.Name, "Swing") and not string.find(p706.Name, "Melee") and not string.find(p706.Name, "SlimeString") and not string.find(p706.Name, "BodyVelocity") and not string.find(p706.Name, "BodyPosition") and not string.find(p706.Name, "BodyGyro") and not string.find(p706.Name, "TouchInterest") then
        return true
    end
    return false
end
CheckItem = function(p708)
    return v177.Character:FindFirstChild(p708) or v177.Backpack:FindFirstChild(p708)
end
Equip = function(p709)
    pcall(function()
        local v710 = v177.Backpack:FindFirstChild(p709)
        if v177.Character:FindFirstChild("Humanoid") and v710 then
            v177.Character:FindFirstChild("Humanoid"):EquipTool(v710)
            return true
        end
        if v177.Character:FindFirstChild(p709) then
            return true
        end
    end)
end
CanUseGate = function()
    local v711 = { "GetUnlockables" }
    return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v711)).DefeatedIndraTrueForm
end
GetNearestEntrance = function(p712)
    local v713 = math.huge
    local v714
    local v715
    if Sea3 then
        for v716, v717 in pairs(v235) do
            if (v717.Pos - p712).magnitude < v713 then
                v713 = (v717.Pos - p712).magnitude
                v714 = v717.Pos
                v715 = v716
            end
        end
    end
    return v715, v235[v715]
end
CheckNearestRequestIsland2 = function(p718)
    local v719 = nil
    local v720 = math.huge
    for v721, v722 in pairs({
    ["Castle on the sea"] = CFrame.new(-5075.50927734375, 314.5155029296875, -3150.0224609375),
    Mansion = CFrame.new(-12548.998046875, 332.40396118164, -7603.1865234375),
    ["Hydra Island"] = CFrame.new(5661.53027, 1013.38354, -334.961914),
    ["Temple Of Time"] = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875),
    ["Green Tree"] = CFrame.new(3028.84082, 2281.20264, -7324.7832)
}) do
        if v489(p718) < 500 or not checkcanentrance() then
            break
        end
        local v723 = v489(p718, v722)
        local v724 = v489(p718)
        if v723 < v720 and (v723 < v724) then
            v720 = v723
            v719 = v721
        end
    end
    return v719
end
rqentrance = function(p725)
    if tween then
        tween:Cancel()
    end
    if p725 ~= "Green Tree" then
        repeat
            CommF:InvokeServer("requestEntrance", Request_Places[p725].Position)
            wait(0.5)
        until v489(Request_Places[p725]) < 50
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(30, 50, 0)
    else
        if not workspace.NPCs:FindFirstChild("Mysterious Force") and not workspace.NPCs:FindFirstChild("Mysterious Force3") then
            repeat
                CommF:InvokeServer("requestEntrance", Request_Places["Temple Of Time"].Position)
                wait()
            until workspace.NPCs:FindFirstChild("Mysterious Force3")
        end
        if workspace.NPCs:FindFirstChild("Mysterious Force3") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28610.1328, 14896.8477, 105.67765, -0.0388384573, 6.65092799e-08, -0.999245524, -1.15718697e-08, 1, 6.70092675e-08, 0.999245524, 1.41656757e-08, -0.0388384573)
            repeat
                CommF:InvokeServer("RaceV4Progress", "TeleportBack")
                wait()
            until workspace.NPCs:FindFirstChild("Mysterious Force")
        end
    end
end
CanAwakenDough = function()
    local v726 = { "RaidsNpc", "Check" }
    local v727, v728 = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(v726))
    if type(v728) == "table" then
        return v728.Dough
    end
    return false
end
CheckFlower = function()
    local v729 = game:GetService("Players").LocalPlayer
    for v730, v731 in pairs(v729.Backpack:GetChildren()) do
        if string.find(v731.Name, "Flower") then
            return true
        end
    end
    local v732 = v729.Character:FindFirstChildOfClass("Tool")
    if v732 then
        if string.find(v732.Name, "Flower") then
            return true
        end
    end
    return false
end
GetNearSpawn = function(p733)
    while not Alive() do
        task.wait()
    end
    if CheckItem("Hallow Essence") or CheckItem("Fist of Darkness") or CheckItem("God's Chalice") or CheckItem("Sweet Chalice") or (Sea3 and CheckItem("Red Key") and not CanAwakenDough()) or ((Sea3 or Sea2) and CheckItem("Special Microchip")) or (Sea2 and CheckFlower()) or ((Sea3 or Sea2) and CheckItem("Microchip")) then
        return
    end
    local v734 = CFrame.new(p733)
    if v445(v177.Character) then
        if (v445(v177.Character).Position - p733).magnitude < 1000 then
            return nil
        end
    end
    return p733
end
local function v735(p736)
    if func_456(p736) and p736:FindFirstChild("RaceTransformed") and p736.RaceTransformed.Value then
        return true
    end
    return false
end
local v748 = {
    Mink = function(p737)
        return true
    end,
    Skypiea = function(p738)
        local v739 = p738 or function()
            return true
        end
        if func_456() and (v177.Character.Humanoid.Health <= v177.Character.Humanoid.MaxHealth * 80 / 100) and v739() then
            return true
        end
    end,
    Ghoul = function(p740)
        local v741 = p740 or function()
            return true
        end
        if func_456() and v741() then
            return true
        end
    end,
    Fishman = function(p742)
        local v743 = p742 or function()
            return true
        end
        if func_456() and (v177.Character.Humanoid.Health <= v177.Character.Humanoid.MaxHealth * 80 / 100) and v743() then
            return true
        end
    end,
    Cyborg = function(p744)
        local v745 = p744 or function()
            return true
        end
        if func_456() and v745() then
            return true
        end
    end,
    Human = function(p746)
        local v747 = p746 or function()
            return true
        end
        if func_456() and v747() and (v177.Character.Humanoid.Health <= v177.Character.Humanoid.MaxHealth * 70 / 100) then
            return true
        end
    end
}
local v749 = tick()
SmartAbilityUse = function(p750)
    if (v748[v177.Data.Race.Value] and v748[v177.Data.Race.Value]() or p750) and (tick() - v749 > 0.5) then
        game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
    end
end
local function v751(p752)
    local v753, v754 = p752[1], p752[2]
    pcall(function()
        if func_456() and game.Players.LocalPlayer.Character.HumanoidRootPart:GetAttributes().PortaledToAnotherDimension then
            return
        end
        if func_456() then
            if v177.Character:FindFirstChild("Humanoid").Health < v753 then
                func_462(true)
                RunningSafeMode = true
                pcall(function()
                    if tween then
                        tween:Cancel()
                        tween = nil
                    end
                    local v755 = v445(v177.Character).Position.Y
                    v177.Character.Humanoid:UnequipTools()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v445(v177.Character).Position.X, v755 + 2500, v445(v177.Character).Position.Z)
                    repeat
                        task.wait(0.1)
                        pcall(function()
                            v177.Character.Humanoid:UnequipTools()
                        end)
                        pcall(function()
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v445(v177.Character).CFrame + Vector3.new(0, 2500, 0)
                        end)
                    until v177.Character:FindFirstChild("Humanoid").Health > v177.Character:FindFirstChild("Humanoid").MaxHealth * v754 / 100
                    v445(v177.Character).CFrame = CFrame.new(v445(v177.Character).Position.X, v755, v445(v177.Character).Position.Z)
                end)
                RunningSafeMode = false
            end
        end
    end)
end
checkinv = function(p756)
    local v757 = false
    pcall(function()
        local v758 = game:GetService("ReplicatedStorage")
        local v759 = game:GetService("Players").LocalPlayer
        local v760 = v758:FindFirstChild("ItemReplicationService") and require(v758.ItemReplicationService)
        local v761 = v758:FindFirstChild("ItemConfig") and require(v758.ItemConfig)
        if v760 and v761 then
            local v762 = v760._UserCache and v760._UserCache[v759.UserId] or (v760.UserCache and v760.UserCache[v759.UserId])
            if v762 then
                local v763 = v762:GetItems("Quantity")
                if not v763 then
                    v763 = v762:GetItems("Inventory")
                end
                if v763 then
                    for v764, v765 in pairs(v763) do
                        local v766 = tonumber(v765.Value) or 1
                        if v766 > 0 then
                            local v767 = v761.match(v765.ItemId):unwrap()
                            if v767 and v767.Index then
                                local v768 = tostring(v767.Index.DebugLabel or v765.ItemId):gsub(" %[.-%]", "")
                                if v768 == p756 then
                                    v757 = true
                                    return
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
    return v757
end
checkcanentrance = function()
    return game.PlaceId ~= 7449423635 or checkinv("Valkyrie Helm")
end
local v769
DoTween = function(p770, p771, p772)
    if not p770 or not func_456() or RunningSafeMode then
        return
    end
    local v773 = v445(v177.Character)
    local v774 = v177.Character and v177.Character:FindFirstChildOfClass("Humanoid")
    if not v773 or not v774 or v774.Health <= 0 then
        return
    end
    if v773:GetAttribute("PortaledToAnotherDimension") then
        return
    end
    if v482(p770.Position.X) or v482(p770.Position.Y) or v482(p770.Position.Z) then
        return
    end
    if CancelingTween then
        if tween then
            tween:Cancel()
            tween = nil
        end
        CancelingTween = false
        return
    end
    if tween and (tween.PlaybackState == Enum.PlaybackState.Playing) and v769 and ((v769 - p770.Position).Magnitude < 3) then
        return
    end
    if tween then
        tween:Cancel()
        tween = nil
    end
    local v775 = (v773.Position - p770.Position).Magnitude
    if v775 < 0.5 then
        return
    end
    local v776 = getgenv().VapeHunterTweenSpeed(195)
    local v777 = game:GetService("TweenService"):Create(v773, TweenInfo.new(v775 / v776, Enum.EasingStyle.Linear), { CFrame = p770 })
    tween = v777
    v769 = p770.Position
    func_462(true)
    Tweening = true
    if not Noclipping then
        Noclipping = v175.Stepped:Connect(func_465)
    end
    local v778
    local function v779()
        if v778 then
            v778:Disconnect()
            v778 = nil
        end
        if tween == v777 then
            tween = nil
            v769 = nil
            Tweening = false
            if Noclipping then
                Noclipping:Disconnect()
                Noclipping = nil
            end
            func_462(false)
        end
    end
    v778 = v774.Died:Connect(function()
        v777:Cancel()
        v779()
    end)
    v777.Completed:Once(v779)
    v777:Play()
    if not p771 then
        v777.Completed:Wait()
    end
end
UseRaceV4 = function()
    if getgenv().PlayerSetting and game.Players.LocalPlayer.Character:FindFirstChild("RaceEnergy") and (game.Players.LocalPlayer.Character.RaceEnergy.Value >= 1) and not game.Players.LocalPlayer.Character.RaceTransformed.Value then
        local v780 = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Awakening") or v177.Character:FindFirstChild("Awakening")
        if v780 then
            v780.RemoteFunction:InvokeServer(true)
        end
    end
end
local v781, v782, v783 = {}, {}, {}
local function func_785(p784)
    if v177.Team.Name == "Marines" and (p784.Team.Name == "Marines") then
        return false
    end
    return true
end
local function func_787(p786)
    if table.find(v781, p786) then
        return true
    end
    if table.find(v782, p786) then
        return tick() - v783[p786].Start <= v783[p786].Time
    end
end
local function func_789(p788)
    if p788 and not table.find(v781, p788) then
        table.insert(v781, p788)
    end
end
local function func_792(p790, p791)
    if p790 then
        if not table.find(v782, p790) then
            table.insert(v782, p790)
            v783[p790] = {}
            v783[p790].Start = tick()
            v783[p790].Time = p791
        else
            v783[p790].Start = tick()
            v783[p790].Time = p791
        end
    end
end
local function v793(p794)
    local v795 = v445(p794.Character)
    if not v795 then
        return false
    end
    for v796, v797 in pairs(workspace._WorldOrigin.SafeZones:GetChildren()) do
        if (v795.Position - v797.Position).Magnitude < 350 then
            return true
        end
    end
    local v798 = {
        {
            pos = Vector3.new(-11557.365, 56.352, -7601.207),
            radius = 60
        },
        {
            pos = Vector3.new(29523.4844, 15094.6836, -87.5899963),
            radius = 1000
        },
        {
            pos = Vector3.new(-22737.6, 5119.99, 2234.63),
            radius = 300
        },
        {
            pos = Vector3.new(-22709.6426, 5258.98584, 3886.63745),
            radius = 300
        }
    }
    for v799, v800 in ipairs(v798) do
        if (v795.Position - v800.pos).Magnitude < v800.radius then
            return true
        end
    end
    return false
end
local function v801(p802)
    if not p802 then
        return false, "Cant Find Player"
    end
    if not p802.Team then
        func_792(p802, 60)
        return false, "Cant Find Player Team"
    end
    if not p802:FindFirstChild("Data") then
        func_792(p802, 60)
        return false, "Cant Find Player Data"
    end
    if table.find(v129.IgnoreFruitTarget, p802.Data.DevilFruit.Value) then
        func_789(p802)
        return false, "Blacklist Player Fruit Selected"
    end
    if p802.Data.DevilFruit.Value == "Portal-Portal" then
        func_789(p802)
        return false, "Blacklist Player Fruit Default"
    end
    if p802.Team.Name == "Neutral" then
        func_792(p802, 60)
        return false, "Blacklist Player Team"
    end
    if not func_785(p802) then
        func_792(p802, 60)
        return false, "Blacklist Player Team 2"
    end
    return true
end
local function v803(p804)
    local v805 = ""
    local v806 = math.huge
    if game:GetService("Workspace"):FindFirstChild("_WorldOrigin") and game:GetService("Workspace")._WorldOrigin:FindFirstChild("Locations") then
        for v807, v808 in pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren()) do
            if v808:IsA("BasePart") or v808:IsA("Model") then
                local v809 = (v808:GetPivot().Position - p804).Magnitude
                if v809 < v806 then
                    v806 = v809
                    v805 = v808.Name
                end
            end
        end
    end
    return v805
end
local function v810()
    while not func_456() do
        task.wait(0.1)
    end
    pcall(function()
        if game.Players.LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
            AttackableCount = 0
            Magic = nil
        end
    end)
    local v811 = false
    pcall(function()
        v811 = game.Players.LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible
    end)
    if v811 then
        return nil, 0
    end
    local v812 = math.huge
    local v813 = nil
    local v814 = 0
    getgenv().CurrentEnv = "MagicGetPlayer"
    v137("----------------Debug Manager---------------")
    for v815, v816 in pairs(game:GetService("Players"):GetPlayers()) do
        if v816 == v177 then
            continue
        end
        if not func_456(v816.Character) then
            v137(v816, "Died")
            func_789(v816)
            continue
        end
        local v817, v818 = v801(v816)
        if not v817 then
            v137(v816, "No Valid Stats: ", v818)
            continue
        end
        if math.abs(v816.Data.Level.Value - v177.Data.Level.Value) >= 550 then
            v137(v816, "Level Difference")
            func_789(v816)
            continue
        end
        if v793(v816) then
            v137(v816, "Safe Zone")
            func_792(v816, 20)
            continue
        end
        if func_787(v816) then
            v137(v816, "Blacklisted")
            continue
        end
        if v129.BlacklistIsland and (#v129.BlacklistIsland > 0) then
            local v819 = v803(v445(v816.Character).Position)
            if table.find(v129.BlacklistIsland, v819) then
                v137(v816, "Blacklist Island: " .. tostring(v819))
                func_792(v816, 60)
                continue
            end
        end
        if v494(v177.Character, v816.Character) >= 200000 then
            v137(v816, "Too Far")
            func_792(v816, 120)
            continue
        end
        if v445(v816.Character).Position.Y >= 3000 then
            v137(v816, "Too High")
            func_792(v816, 60)
            continue
        end
        if v816:GetAttribute("DangerLevel") >= 50 then
            v137(v816, "Living Sea")
            func_792(v816, 120)
            continue
        end
        if func_456() and v445(v816.Character) then
            v814 = v814 + 1
            local v820 = v489(v816.Character, v177.Character)
            if v820 < v812 then
                v813 = v816
                v812 = v820
            end
        end
    end
    v137("----------------Debug Manager---------------")
    getgenv().CurrentEnv = nil
    return v813, v814
end
local v821 = { "Melee", "Blox Fruit", "Sword", "Gun" }
local v822 = {
    Melee = { "Z", "X", "C" },
    ["Blox Fruit"] = {
        "Z",
        "X",
        "C",
        "V",
        "F"
    },
    Sword = { "Z", "X" },
    Gun = { "Z", "X" }
}
local v823 = {}
v823.CanUseSkill = false
v823.Method = "Normal"
local function v824(p825)
    for v826, v827 in pairs(v177.Backpack:GetChildren()) do
        if v827:IsA("Tool") and (v827.ToolTip == p825) then
            return v827
        end
    end
    for v828, v829 in pairs(v177.Character and v177.Character:GetChildren() or {}) do
        if v829:IsA("Tool") and (v829.ToolTip == p825) then
            return v829
        end
    end
end
local v830 = UDim2.new(0, 0, 1, -1)
NotCooldown = function(p831, p832)
    return v177.PlayerGui.Main.Skills:FindFirstChild(p832) and v177.PlayerGui.Main.Skills[p832]:FindFirstChild(p831) and (v177.PlayerGui.Main.Skills[p832][p831].Cooldown.Size == v830)
end
local function v833(p834, p835, p836)
    local v837 = tick()
    while task.wait(0.1) do
        if tick() - v837 >= p834 then
            break
        end
        if not p835(p836) then
            break
        end
    end
end
local function v838()
    if not v823.CanUseSkill then
        return
    end
    local v839 = getgenv().CurrentTarget
    if not v839 then
        return
    end
    if not func_456() then
        return
    end
    if not func_456(v839.Character) then
        return
    end
    return v489(v839.Character, v177.Character) <= 100
end
local function v840(p841, p842, ...)
    local v843 = getgenv().PlayerSetting or {}
    return v843[p841]
end
local function v844(p845, p846, ...)
    return v130[p845]
end
local function v847(p848, p849, ...)
    return v131[p848]
end
local function v850(p851, p852, p853)
    local v854 = tick()
    v115:SetCore("SendNotification", { Title = "Vape Hub", Text = "Pressing: " .. p851, Duration = 0.5 })
    v170:SendKeyEvent(true, p851, false, game)
    task.wait()
    if p852 then
        v833(p852, v838)
    else
        task.wait(math.random(0, 0.2))
    end
    v115:SetCore("SendNotification", { Title = "Vape Hub", Text = "Pressed: " .. p851, Duration = 0.5 })
    v170:SendKeyEvent(false, p851, false, game)
end
local function v855()
    return v823.Method == "Spam" or v823.Method == "SpamAll"
end
local function v856(p857, p858, ...)
    if p858 == "Equip" then
        return v823.Method == "SpamAll" or (v132[p857] and v132[p857].Enable)
    end
    if p858 == "Hold" then
        local v859 = ...
        return v855() and 0 or (v132[p857] and v132[p857].Skills and v132[p857].Skills[v859] and v132[p857].Skills[v859].HoldTime or 0)
    end
    if p858 == "NoPredict" then
        local v860 = ...
        return v132[p857] and v132[p857].Skills and v132[p857].Skills[v860] and v132[p857].Skills[v860].NoPredict
    end
    if p858 == "Next" then
        return v855() or (v132[p857] and v132[p857].SwitchNextWeaponIfCooldown)
    end
    if p858 == "NextWeapon" then
        return v132[p857] and v132[p857].Delay or 0
    end
end
local function v861(p862, p863)
    if tick() - p863 <= v856(p862, "NextWeapon") then
        return true
    end
    return false
end
local function v864(p865)
    return not v823.ForceMelee and v838() and func_456() and v177.Character:FindFirstChildOfClass("Tool") and (v177.Character:FindFirstChildOfClass("Tool").ToolTip == p865)
end
local function v866(p867, p868)
    local v869 = true
    for v870, v871 in pairs(v822[p868]) do
        if NotCooldown(v871, p867) then
            v869 = false
        end
    end
    return v869
end
spawn(function()
    while task.wait(0.1) do
        if v838() then
            if v823.ForceMelee then
                local v872 = v824("Melee")
                if v872 then
                    pcall(Equip, v872.Name)
                    getgenv().CurrentSkillWeapon = "Melee"
                    for v873, v874 in v822.Melee do
                        if NotCooldown(v874, v872.Name) then
                            local v875
                            pcall(function()
                                v875 = v856("Melee", "Hold", v874)
                            end)
                            getgenv().CurrentSkillName = v874
                            v850(v874, v875, v872.Name)
                            if v823.Method == "Normal" then
                                v833(task.wait(math.random(0.1, 0.3)), v838, "Melee")
                            end
                            getgenv().CurrentSkillName = nil
                        end
                        wait(0.3)
                    end
                    getgenv().CurrentSkillWeapon = nil
                end
            else
                for v876 = 1, #v821 do
                    local v877 = v821[v876]
                    local v878 = v824(v877)
                    if v878 and v856(v877, "Equip") then
                        v118("Equipped: " .. v878.Name)
                        pcall(Equip, v878.Name)
                        local v879 = tick()
                        v118("Starting SKill Controller")
                        getgenv().CurrentSkillWeapon = v877
                        while v861(v877, v879) do
                            local v880 = v866(v878.Name, v877)
                            if v880 and v856(v877, "Next") then
                                print("cant use skill")
                                break
                            end
                            for v881, v882 in pairs(v822[v877]) do
                                if v823.ForceMelee then
                                    break
                                end
                                if getgenv().MinWaitDmg and (tick() - getgenv().MinWaitDmg <= ((v847("LowHealthTargetCondition") or {}).WaitTime or 1.5)) and (v823.Method == "Normal") then
                                    print(tick() - getgenv().MinWaitDmg)
                                    v118("Wait Dmg", 1.5)
                                    print("[SKill Controller] Wait Damage")
                                    v833((v847("LowHealthTargetCondition") or {}).WaitTime or 1.5, v864, v877)
                                end
                                print(v882, v878.Name)
                                if v864(v877) and NotCooldown(v882, v878.Name) then
                                    local v883
                                    pcall(function()
                                        v883 = v856(v877, "Hold", v882)
                                    end)
                                    getgenv().CurrentSkillName = v882
                                    v850(v882, v883, v878.Name)
                                    if v823.Method == "Normal" then
                                        v833(0.3, v864, v877)
                                    end
                                    getgenv().CurrentSkillName = nil
                                end
                                wait(0.3)
                            end
                            task.wait()
                        end
                        getgenv().CurrentSkillWeapon = nil
                    end
                end
            end
        end
    end
end)
local function v884(p885)
    for v886, v887 in pairs(game:GetService("Workspace"):GetChildren()) do
        if v887.Name == "tempsafezone" then
            if v494(v887:GetPivot().Position, p885.Position) <= 5 then
                return true
            end
        end
    end
end
local function v888(p889, p890, p891)
    getgenv().CurrentEnv = "Mushroom"
    if func_456() and game.Players.LocalPlayer.Character.HumanoidRootPart:GetAttributes().PortaledToAnotherDimension then
        v118("Escape First", 2)
        return true
    end
    if not func_456() then
        return false
    end
    if not (p889 and p889.Character and func_456(p889.Character)) then
        v137("Not Alive Enemy")
        func_792(p889, 120)
        return false
    end
    if v884(v445(p889.Character):GetPivot()) then
        v137("Temp Safe Zone")
        func_792(p889, 120)
        return false
    end
    if v129.BlacklistIsland and (#v129.BlacklistIsland > 0) then
        local v892 = v803(v445(p889.Character).Position)
        if table.find(v129.BlacklistIsland, v892) then
            v137("Blacklist Island: " .. tostring(v892))
            func_792(p889, 120)
            return false
        end
    end
    if v445(p889.Character).Position.Y >= 3000 then
        v137("Heaven")
        func_789(p889)
        return false
    end
    if not p890 then
        return false
    end
    if tick() - p890 >= 120 then
        v137("Out of time")
        return false
    end
    if v494(p889.Character) >= 20000 then
        v137("Far", "LP: " .. tostring(v494(v234, v177.Character)), "Target: " .. tostring(v494(v234, p889.Character)))
        func_789(p889)
        return false
    end
    if p891 then
        if tick() - p891 >= 13 and not p889.Character:GetAttribute("InCombat") then
            v137("Not In Combat V2")
            func_789(p889)
            return false
        end
        if tick() - p891 >= 20 and (v236.InCombat.Visible == false) then
            v137("Not In Combat")
            func_789(p889)
            return false
        end
        if tick() - p891 >= 25 and (p889.Character.Humanoid.Health >= p889.Character.Humanoid.MaxHealth * 80 / 100) then
            v137("High Health")
            func_792(p889, 120)
            return false
        end
    end
    getgenv().CurrentEnv = nil
    return true
end
v175.RenderStepped:Connect(function()
    if not batken then
        batken = true
        game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true)
        wait(3)
        batken = false
    end
end)
local v893 = tick()
local v894 = {}
v175.RenderStepped:Connect(function()
    pcall(function()
        if game.Players.LocalPlayer.Character.HumanoidRootPart:GetAttributes().PortaledToAnotherDimension then
            v445(v177.Character).Size = Vector3.new(2, 2, 1)
        else
            v445(v177.Character).Size = Vector3.new(2, 1, 2)
        end
    end)
    pcall(function()
        v177.Character.Humanoid.Sit = false
    end)
    pcall(function()
        if tick() - v893 >= 5 then
            v893 = tick()
            func_462(false)
            task.wait(0.5)
        else
            func_462(true)
        end
        if v177.Character ~= nil then
            for v895, v896 in pairs(v177.Character:GetDescendants()) do
                if v896:IsA("BasePart") then
                    if not game.Players.LocalPlayer.Character.HumanoidRootPart:GetAttributes().PortaledToAnotherDimension then
                        if v896.CanCollide == true and (v896.Name ~= floatName) then
                            v894[v896] = true
                            v896.CanCollide = false
                        end
                    elseif v894[v896] then
                        v896.CanCollide = true
                    end
                end
            end
        end
    end)
    pcall(function()
        if not v177.Character:FindFirstChild("HasBuso") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
        end
    end)
    task.wait(0.1)
end)
local function v897()
    pcall(function()
        if func_456() then
            v169:CaptureController()
            v169:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
        end
    end)
end
local v898 = game:GetService("Players").LocalPlayer
getHits = function(p899)
    local v900 = {}
    local v901 = workspace.Characters:GetChildren()
    for v902 = 1, #v901 do
        local v903 = v901[v902]
        if v903 ~= game.Players.LocalPlayer.Character then
            local v904 = v903:FindFirstChildOfClass("Humanoid")
            if v904 and v904.RootPart and (v904.Health > 0) and (game.Players.LocalPlayer:DistanceFromCharacter(v904.RootPart.Position) < p899 + 55) then
                table.insert(v900, v904.RootPart)
            end
        end
    end
    return v900
end
local v905 = 0
local v906 = tick()
print("Attack No CD")
local v907 = Instance.new("Animation")
local function v908()
    if v907 then
        return v907
    else
        v907 = Instance.new("Animation")
        return v907
    end
end
local function v909()
    local v910 = {}
    local v911 = workspace.Characters:GetChildren()
    for v912 = 1, #v911 do
        local v913 = v911[v912]
        if v913 ~= game.Players.LocalPlayer.Character then
            local v914 = v913:FindFirstChildOfClass("Humanoid")
            if v914 and v914.RootPart and (v914.Health > 0) and (game.Players.LocalPlayer:DistanceFromCharacter(v914.RootPart.Position) < 120) then
                if getgenv().CurrentTarget and (getgenv().CurrentTarget.Character == v913) then
                    table.insert(v910, 1, { v913, v913.HumanoidRootPart })
                else
                    table.insert(v910, { v913, v913.HumanoidRootPart })
                end
            end
        end
    end
    return v910
end
FastAttack = loadstring("        local env=getgenv()\n        local token={}\n        env.VapeLegacyAttackWorker=token\n        local player=game:GetService(\"Players\").LocalPlayer\n        local net=game:GetService(\"ReplicatedStorage\"):WaitForChild(\"Modules\"):WaitForChild(\"Net\")\n        local attack=net:WaitForChild(\"RE/RegisterAttack\")\n        local hit=net:WaitForChild(\"RE/RegisterHit\")\n        local pulseUntil=0\n        env.Attack=function()\n            if env.VapeLegacyAttackWorker==token then pulseUntil=os.clock()+0.35 end\n        end\n        task.spawn(function()\n            while env.VapeLegacyAttackWorker==token do\n                task.wait(0.15)\n                local ok,err=pcall(function()\n                    if os.clock()>pulseUntil or env.Get6V3PvPActive then return end\n                    -- A shared lease prevents attack workers from different hubs firing together.\n                    local now=os.clock()\n                    if now<(env.VapeNextAttackPacket or 0) then return end\n                    local char=player.Character\n                    local root=char and char:FindFirstChild(\"HumanoidRootPart\")\n                    local health=char and char:FindFirstChildOfClass(\"Humanoid\")\n                    if not root or not health or health.Health<=0 or not char:FindFirstChildOfClass(\"Tool\") then return end\n                    local list={}\n                    for _,folderName in ipairs({\"Enemies\", \"Characters\"}) do\n                        local folder=workspace:FindFirstChild(folderName)\n                        if folder then\n                            for _,model in ipairs(folder:GetChildren()) do\n                                local hum=model:FindFirstChildOfClass(\"Humanoid\")\n                                local part=model:FindFirstChild(\"HumanoidRootPart\")\n                                if model~=char and hum and hum.Health>0 and part and (part.Position-root.Position).Magnitude<=65 then\n                                    list[#list+1]={model,part}\n                                    if #list>=3 then break end\n                                end\n                            end\n                        end\n                        if #list>=3 then break end\n                    end\n                    if #list==0 then return end\n                    env.VapeNextAttackPacket=now+0.15\n                    attack:FireServer(0)\n                    hit:FireServer(list[1][1]:FindFirstChild(\"Head\") or list[1][2],list,nil,\"078da341\")\n                end)\n                if not ok then token.Error=tostring(err) end\n            end\n        end)\n    ")
FastAttack()
if v844("FastAttack") then
    task.spawn(function()
        while wait(0.2) do
            getgenv().Attack()
        end
    end)
end
loadstring("\nlocal mt = getrawmetatable(game)\nlocal oldNamecall = mt.__namecall\n\nsetreadonly(mt, false)\n\nmt.__namecall = newcclosure(function(self, ...)\n    local method = getnamecallmethod()\n    local args = {...}\n\n    if method == \"FireServer\" then\n        if self.ClassName == \"RemoteEvent\" then\n            local HookPosition = getgenv().SilentAimPlayer\n            if HookPosition and typeof(HookPosition) == \"Vector3\" then\n                for i, v in ipairs(args) do\n                    if typeof(v) == \"Vector3\" then\n                        args[i] = HookPosition\n                    end\n                end\n            end\n        end\n    end\n\n    if method == \"InvokeServer\" then\n        if self.ClassName == \"RemoteFunction\" then\n            local HookPosition = getgenv().SilentAimPlayer\n            if HookPosition and typeof(HookPosition) == \"Vector3\" then\n                for i, v in ipairs(args) do\n                    if typeof(v) == \"Vector3\" then\n                        args[i] = HookPosition\n                    end\n                end\n            end\n        end\n    end\n\n    return oldNamecall(self, unpack(args))\nend)\n\nsetreadonly(mt, true)\n")()
local v915
print("Starting")
pcall(function()
    game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 113, 1000)
end)
local v916, v917 = nil, tick()
CalculateLast = function(p918)
    if not v916 then
        return Vector3.new(0, 0, 0)
    end
    if not p918 then
        return Vector3.new(0, 0, 0)
    end
    return p918 - v916
end
PredictTween = function(p919)
    if not p919 then
        return Vector3.new(0, 0, 0)
    end
    local v920 = CalculateLast(p919.Character.Head.Position)
    if tick() - v917 >= 0.5 then
        v917 = tick()
        v916 = p919.Character.Head.Position
    end
    return v920
end
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            v126()
            for v921, v922 in pairs(game.CoreGui:GetChildren()) do
                if v922:FindFirstChild("PropertiesFrame") then
                    if v922:FindFirstChild("ExplorerPanel") then
                        if v922:FindFirstChild("SideMenu") then
                            task.spawn(function()
                                while true do end
                            end)
                            game:Shutdown()
                        end
                    end
                end
            end
        end)
    end
end)
local v923 = Instance.new("Folder")
v923.Parent = game:GetService("ReplicatedStorage")
v923.Name = "StoredMap"
local v924 = Instance.new("Folder")
v924.Parent = game:GetService("ReplicatedStorage")
v924.Name = "StoredStone"
local function v925()
    repeat
        task.wait(0.1)
    until v236.InCombat.Visible == false or (v840("IgnoreInCombat") and (v236.InCombat.Visible == true and (v236.InCombatBottom.Visible == false)))
end
local function v926()
    local v927 = v847("LowHealthPlayerCondition")
    if v927 and v927.Enable then
        local v928 = v927.Health or 70
        if func_456() and (v177.Character:FindFirstChild("Humanoid").Health <= v177.Character:FindFirstChild("Humanoid").MaxHealth * v928 / 100) then
            return v927.Method
        end
    end
    return false
end
local function v929()
    local v930 = v847("LowHealthTargetCondition")
    if v930 and v930.Enable then
        local v931 = v930.Health or 30
        if getgenv().CurrentTarget and func_456(getgenv().CurrentTarget.Character) and (getgenv().CurrentTarget.Character.Humanoid.Health >= getgenv().CurrentTarget.Character.Humanoid.MaxHealth * v931 / 100) then
            return v930.Method
        end
    end
    return false
end
local function v932()
    if func_456() and game.Players.LocalPlayer.Character.HumanoidRootPart:GetAttributes().PortaledToAnotherDimension then
        task.wait(0.5)
        v118("Attemping To Escape", 2)
        for v933, v934 in pairs(game:GetService("Workspace")._WorldOrigin:GetChildren()) do
            if v934.Name == "VArenaDimension" and v934:FindFirstChild("PortalEye") then
                v118("Found Portal, Escaping", 2)
                print(v494(v934:FindFirstChild("PortalEye"), v177.Character))
                if v494(v934:FindFirstChild("PortalEye"), v177.Character) <= 1500 then
                    v177.Character.HumanoidRootPart.CFrame = v934:FindFirstChild("PortalEye").CFrame + Vector3.new(0, 7, 0)
                    v170:SendKeyEvent(true, "Space", false, game)
                    task.wait()
                    v170:SendKeyEvent(false, "Space", false, game)
                end
            end
        end
    end
end
if v840("IgnoreFriend") then
    for v935, v936 in pairs(v168:GetPlayers()) do
        pcall(function()
            if v936:IsFriendsWith(v168.LocalPlayer.UserId) then
                ForceStop = true
                v445(v177.Character).CFrame = v445(v177.Character).CFrame * CFrame.new(0, 10000, 0)
                v925()
                Notify({ Text = "Server Hopping", Type2 = "Paimon", Delay = 5 })
                TrueServerHop()
            end
        end)
    end
    v168.PlayerAdded:Connect(function(p937)
        pcall(function()
            if p937:IsFriendsWith(v168.LocalPlayer.UserId) then
                ForceStop = true
                v445(v177.Character).CFrame = v445(v177.Character).CFrame * CFrame.new(0, 10000, 0)
                v925()
                TrueServerHop()
            end
        end)
    end)
end
do
    getgenv().IsServerVip = nil
    spawn(function()
        local v938 = false
        while not v938 and task.wait(1) do
            local v939 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter", "Progress")
            if v939 == "Sorry, you must join a public server for PvP tasks." then
                getgenv().IsServerVip = true
                v938 = true
            end
            if tonumber(v939) then
                getgenv().IsServerVip = false
                v938 = true
            end
        end
    end)
    spawn(function()
        Encryptor = {}
        local v940 = {}
        for v941 = 0, 9 do
            v940[v941] = tostring(v941)
        end
        v940[10] = "A"
        v940[11] = "B"
        v940[12] = "C"
        v940[13] = "D"
        v940[14] = "E"
        v940[15] = "F"
        local v942 = {}
        for v943 = 0, 9 do
            v942[tostring(v943)] = v943
        end
        v942.A = 10
        v942.B = 11
        v942.C = 12
        v942.D = 13
        v942.E = 14
        v942.F = 15
        Encryptor.decToHex = function(p944)
            local v945 = ""
            while p944 > 0 do
                local v946 = p944 % 16
                v945 = v940[v946] .. v945
                p944 = math.floor(p944 / 16)
            end
            return v945
        end
        Encryptor.hexToDec = function(p947)
            local v948 = 0
            local v949 = string.len(p947)
            for v950 = 1, v949 do
                local v951 = v942[string.sub(p947, v950, v950)]
                v948 = v948 + (v951 * 16 ^ (v949 - v950))
            end
            return v948
        end
        Encryptor.GetUTF8Table = function()
            local v952 = {}
            local v953 = 1
            repeat
                table.insert(v952, { utf8.char(v953), v953 })
                wait()
                v953 = v953 + 1
            until v953 == 127
            return v952
        end
        Encryptor.UTF8Table = Encryptor.GetUTF8Table()
        Encryptor.GetUTF8Number = function(p954)
            local v955 = Encryptor.UTF8Table
            if string.len(p954) > 1 then
                warn("The input cannot be higher than one character")
            elseif string.len(p954) < 1 then
                warn("The input cannot be lower than one character")
            else
                for v956, v957 in pairs(v955) do
                    if p954 == v957[1] then
                        return v957[2]
                    end
                end
            end
        end
        Encryptor.Encrypt = function(p958, p959)
            local v960 = 0
            local v961 = 0
            local v962 = ""
            local v963 = {}
            for v964 = 1, string.len(p958) do
                table.insert(v963, {
                    Encryptor.GetUTF8Number(string.sub(p958, v964, v964))
                })
            end
            for v965 = 1, string.len(p959) do
                v961 = v961 + Encryptor.GetUTF8Number(string.sub(p959, v965, v965))
            end
            for v966, v967 in pairs(v963) do
                if v966 == 1 then
                    v962 = v962 .. Encryptor.decToHex(v967[1] * v961)
                else
                    v962 = v962 .. "-" .. Encryptor.decToHex(v967[1] * v961)
                end
            end
            return v962
        end
        Encryptor.Decrypt = function(p968, p969)
            local v970 = 0
            local v971 = {}
            local v972 = Encryptor.UTF8Table
            local v973 = string.split(p968, "-")
            local v974 = ""
            for v975 = 1, string.len(p969) do
                v970 = v970 + Encryptor.GetUTF8Number(string.sub(p969, v975, v975))
            end
            for v976, v977 in pairs(v973) do
                if v973[v976] ~= "" then
                    table.insert(v971, { Encryptor.hexToDec(v973[v976]) / v970 })
                end
            end
            for v978, v979 in pairs(v971) do
                for v980, v981 in pairs(v972) do
                    if v979[1] == v981[2] then
                        v974 = v974 .. v981[1]
                    end
                end
            end
            return v974
        end
        do
            local v982 = 2345242
            local v983 = 3223
            local v984
            encode = function(p985)
                if not v984 then
                    v984 = {}
                    for v986 = 0, 127 do
                        local v987 = -1
                        repeat
                            v987 = v987 + 2
                        until v987 * (2 * v986 + 1) % 256 == 1
                        v984[v986] = v987
                    end
                end
                local v988, v989 = v982, 16384 + v983
                return (p985:gsub(".", function(p990)
                    local v991 = v988 % 274877906944
                    local v992 = (v988 - v991) / 274877906944
                    local v993 = v992 % 128
                    p990 = p990:byte()
                    local v994 = (p990 * v984[v993] - ((v992 - v993) / 128)) % 256
                    v988 = v991 * v989 + v992 + v994 + p990
                    return ("%02x"):format(v994)
                end))
            end
            decode = function(p995)
                local v996, v997 = v982, 16384 + v983
                return (p995:gsub("%x%x", function(p998)
                    local v999 = v996 % 274877906944
                    local v1000 = (v996 - v999) / 274877906944
                    local v1001 = v1000 % 128
                    p998 = tonumber(p998, 16)
                    local v1002 = (p998 + ((v1000 - v1001) / 128)) * (2 * v1001 + 1) % 256
                    v996 = v999 * v997 + v1000 + p998 + v1002
                    return string.char(v1002)
                end))
            end
        end
        wait(5)
        local v1003 = debug.info or info or false
        local v1004 = false
        local v1005 = nil
        local v1006 = {
            ["0x00"] = "Access Url",
            ["0x01"] = "Dif Function",
            ["0x02"] = "Constant",
            ["0x03"] = "Source",
            ["0x04"] = "Pairs",
            ["0x05"] = "Fail",
            ["0x06"] = "Too Long",
            ["0x07"] = "No Headers",
            ["0x08"] = "No Requests Found"
        }
        local v1007 = getgenv().pairs or pairs
        local __tbl1008 = type(getgenv().table) == "table" and getgenv().table or table
        local v1008 = __tbl1008 and __tbl1008.foreach
        local v1009 = http_request or request or (http and http.request) or (game.HttpGet or httpget)
        if type(__tbl1008) == "table" and type(v1008) == "function" then
            pcall(function()
                setreadonly(__tbl1008, false)
                __tbl1008.foreach = function(p1010, p1011)
                    if checkcaller() then
                        if getmetatable(p1010) then
                            if getmetatable(p1010).__pairs then
                                for v1012, v1013 in getmetatable(p1010).__pairs(p1010) do
                                    p1011(v1012, v1013)
                                end
                            end
                        end
                    end
                    if typeof(p1010) == "table" and typeof(p1011) == "function" then
                        return v1008(p1010, p1011)
                    end
                end
                setreadonly(__tbl1008, true)
            end)
        end
        getgenv().pairs = function(p1014)
            if checkcaller() then
                if getmetatable(p1014) then
                    if getmetatable(p1014).__pairs then
                        return getmetatable(p1014).__pairs(p1014)
                    end
                end
            end
            if typeof(p1014) == "table" then
                return v1007(p1014)
            end
        end
        local function func_1019(p1015, p1016)
            for v1017, v1018 in next, p1015 do
                if v1018 == p1016 then
                    return true
                end
            end
            return false
        end
        local v1020 = {}
        local function v1021(p1022)
            if type(p1022) ~= "table" then
                return type(p1022)
            end
            local v1023 = 1
            for v1024 in pairs(p1022) do
                if p1022[v1023] ~= nil then
                    v1023 = v1023 + 1
                else
                    return "table"
                end
            end
            if v1023 == 1 then
                return "table"
            else
                return "array"
            end
        end
        local function v1025(p1026)
            local v1027 = {
                "\\",
                "\"",
                "/",
                "\b",
                "\f",
                "\n",
                "\r",
                "\t"
            }
            local v1028 = {
                "\\",
                "\"",
                "/",
                "b",
                "f",
                "n",
                "r",
                "t"
            }
            for v1029, v1030 in ipairs(v1027) do
                p1026 = p1026:gsub(v1030, "\\" .. v1028[v1029])
            end
            return p1026
        end
        local function v1031(p1032, p1033, p1034, p1035)
            p1033 = p1033 + #p1032:match("^%s*", p1033)
            if p1032:sub(p1033, p1033) ~= p1034 then
                if p1035 then
                    error("Expected " .. p1034 .. " near position " .. p1033)
                end
                return p1033, false
            end
            return p1033 + 1, true
        end
        local function v1036(p1037, p1038, p1039)
            p1039 = p1039 or ""
            local v1040 = "End of input found while parsing string."
            if p1038 > #p1037 then
                error(v1040)
            end
            local v1041 = p1037:sub(p1038, p1038)
            if v1041 == "\"" then
                return p1039, p1038 + 1
            end
            if v1041 ~= "\\" then
                return v1036(p1037, p1038 + 1, p1039 .. v1041)
            end
            local v1042 = {
                b = "\b",
                f = "\f",
                n = "\n",
                r = "\r",
                t = "\t"
            }
            local v1043 = p1037:sub(p1038 + 1, p1038 + 1)
            if not v1043 then
                error(v1040)
            end
            return v1036(p1037, p1038 + 2, p1039 .. (v1042[v1043] or v1043))
        end
        local function v1044(p1045, p1046)
            local v1047 = p1045:match("^-?%d+%.?%d*[eE]?[+-]?%d*", p1046)
            local v1048 = tonumber(v1047)
            if not v1048 then
                error("Error parsing number at position " .. p1046 .. ".")
            end
            return v1048, p1046 + #v1047
        end
        v1020.encode = function(p1049, p1050)
            local v1051 = {}
            local v1052 = v1021(p1049)
            if v1052 == "array" then
                if p1050 then
                    error("Can't encode array as key.")
                end
                v1051[#v1051 + 1] = "["
                for v1053, v1054 in ipairs(p1049) do
                    if v1053 > 1 then
                        v1051[#v1051 + 1] = ", "
                    end
                    v1051[#v1051 + 1] = v1020.encode(v1054)
                end
                v1051[#v1051 + 1] = "]"
            elseif v1052 == "table" then
                if p1050 then
                    error("Can't encode table as key.")
                end
                v1051[#v1051 + 1] = "{"
                for v1055, v1056 in pairs(p1049) do
                    if #v1051 > 1 then
                        v1051[#v1051 + 1] = ", "
                    end
                    v1051[#v1051 + 1] = v1020.encode(v1055, true)
                    v1051[#v1051 + 1] = ":"
                    v1051[#v1051 + 1] = v1020.encode(v1056)
                end
                v1051[#v1051 + 1] = "}"
            elseif v1052 == "string" then
                return "\"" .. v1025(p1049) .. "\""
            elseif v1052 == "number" then
                if p1050 then
                    return "\"" .. tostring(p1049) .. "\""
                end
                return tostring(p1049)
            elseif v1052 == "boolean" then
                return tostring(p1049)
            elseif v1052 == "nil" then
                return "null"
            else
                error("Unjsonifiable type: " .. v1052 .. ".")
            end
            return table.concat(v1051)
        end
        local function func_1074(p1057)
            if type(p1057) == "table" and tostring(p1057.Url):find("discord.com/api/webhooks", 1, true) and not ((getgenv().PlayerSetting or {}).WebHook or {}).Enable then
                return { StatusCode = 204, Body = "{}", Success = true }
            end
            local v1058 = 0
            local v1059, v1060, v1061, v1062 = p1057.Url, p1057.Method, p1057.Headers, p1057.Body
            local v1069 = setmetatable({}, {
                __index = function(p1063, ...)
                    do
                        local v1064 = v1003(2, "f")
                        if is_synapse_function and (v1064 ~= v1009) then
                        end
                    end
                    t = { ... }
                    if func_1019(t, "Url") then
                        v1058 = v1058 + 1
                        if v1005 and not SendingCrackLog then
                            return MyWebhook
                        end
                        if v1058 ~= 1 then
                            v1005 = v1006["0x00"]
                            while true do end
                            return
                        end
                        return v1059
                    end
                    if func_1019(t, "Method") then
                        return v1060
                    end
                    if func_1019(t, "Headers") and (v1060 == "POST") then
                        return v1061
                    end
                    if func_1019(t, "Body") and (v1060 == "POST") then
                        if v1005 and not SendingCrackLog then
                            return EncodedFakeData
                        end
                        return v1062
                    end
                end,
                __pairs = function(p1065)
                    v1005 = v1006["0x04"]
                    local v1066 = { "Url", "Method", "Headers", "Body" }
                    local v1067 = 0
                    return function()
                        v1067 = v1067 + 1
                        local v1068 = v1066[v1067]
                        if v1068 then
                            if v1068 == "Url" then
                                return v1068, MyWebhook
                            end
                            if v1068 == "Body" then
                                return v1068, EncodedFakeData
                            end
                            return v1068, p1065[v1068]
                        end
                    end
                end
            })
            local v1070 = tick()
            local v1071
            local v1072, v1073 = pcall(function()
                v1071 = v1009(v1069)
                if not v1071.Headers then
                    v1005 = v1006["0x07"]
                    while true do end
                    return
                end
            end)
            if not v1072 then
                v1005 = v1006["0x08"]
                while true do end
                return
            end
            if v1072 and (tick() - v1070 < 0.01) then
                v1005 = v1006["0x06"]
                while true do end
                return
            end
            return v1071
        end
        WebhookUrl = {
            Mirage = "https://discord.com/api/webhooks/1210618142984773712/d0SF7kfMddkJ1xK1sucW1pKpgozENWBMv07_rKRNBWfWAKPWTD8sFnLQa9pUaa6kxyZA",
            FullMoon = "https://discord.com/api/webhooks/1210617943595950180/bgdZdVq311huwR_Xc1LKnrIt_FqbY5Pzksn8iuyVtqJUeve0Gtrafps0wuDu8eZjzr-p",
            NearFullMoon = "https://discord.com/api/webhooks/1210618533638176868/IaIQbQw0e4OaKdYonJmEES2ASlWVhM85EF-cgl9cjvlgxxsjf6pXG2oZsFifFnOL5n-J",
            HakiColorNormal = "https://discord.com/api/webhooks/1210617882090803322/proKm0j22HMegsUrjng99Hpvgb4H2gNu5GLYJ-o90D-VO_5AkT-aM1C3kgINuyvWa8Dm",
            HakiColorLegend = "https://discord.com/api/webhooks/1210618667054927962/aWNiVClbo6_gPNN_0dWqkGHW2uiKkSJ0l-duAO-3099gFxz_VS0TNd7XckEFtav9Wekh",
            LegendarySword = "https://discord.com/api/webhooks/1210619434381742131/zHXxHbeGsgrLxYS7Bc9krfLHNJ3YJCGGvsggj8mJTsq_kBASVAiFf8Jk5e7oiOwLfRvg",
            BossPro = "https://discord.com/api/webhooks/1210620082107981855/bf7q7byzaf6Xs3Ln1JRjpRtV4TkQLvoZReo8-DoeO7q9JxC3WSLsE1lfuDQ0qX16AXb2",
            BossRaid = "https://discord.com/api/webhooks/1210620153939759164/ifvePG_Gwt5EVICq0j8-RjyVq_PBvONsmMGXp9ezsD39ChxG1FjneQ1kWUQaOkcFzYIK",
            Kistune = "https://discord.com/api/webhooks/1210620237334970368/U8_gSKtvgk6qvS0CqGlnS7jDrpKcRZL6UXZ8X1xw6wWyfquV_lRaOPZ3jZ9z4LEvD5Qy"
        }
        local v1075 = { "Dough King", "Darkbeard", "rip_indra True Form" }
        local v1076 = { "Cursed Captain", "Soul Reaper" }
        local v1077 = {}
        PingMirage = "<@&1061564724535382056>"
        PingHakiColor = "<@&1089099922277675008"
        SendMessage = function(p1078, p1079)
            local v1083, v1084 = pcall(function()
                local v1080 = Text
                local v1081 = { content = v1080 }
                local v1082 = func_1074({
                    Url = p1079,
                    Method = "POST",
                    Headers = { ["Content-Type"] = "application/json" },
                    Body = game:GetService("HttpService"):JSONEncode(v1081)
                })
            end)
        end
        TimeRemain = function()
            if IsNight() then
                local v1085 = 10
                if table.find(v238, tostring(game:GetService("Lighting").TimeOfDay:split(":")[1])) >= 6 then
                    v1085 = v1085 - table.find(v238, tostring(game:GetService("Lighting").TimeOfDay:split(":")[1])) + 1
                else
                    v1085 = v1085 - table.find(v238, tostring(game:GetService("Lighting").TimeOfDay:split(":")[1]))
                end
                return v1085
            end
        end
        EmbedColor = { White = 16777215, Red = 15548997, Pink = 16711862 }
        HakiToColor = { ["Snow White"] = EmbedColor.White, ["Pure Red"] = EmbedColor.Red, ["Winter Sky"] = EmbedColor.Pink }
        local function v1086(p1087, p1088)
            local v1089 = 0
            local v1090 = 1
            while p1087 > 0 and (p1088 > 0) do
                local v1091 = p1087 % 2 == 1
                local v1092 = p1088 % 2 == 1
                if v1091 ~= v1092 then
                    v1089 = v1089 + v1090
                end
                p1087 = math.floor(p1087 / 2)
                p1088 = math.floor(p1088 / 2)
                v1090 = v1090 * 2
            end
            v1089 = v1089 + ((p1087 + p1088) * v1090)
            return v1089
        end
        local v1093 = {
            "\001",
            "\002",
            "\003",
            "\004",
            "\005",
            "\006",
            "\a",
            "\b",
            "\t",
            "\n",
            "\v",
            "\f",
            "\r",
            "\014",
            "\015",
            "\016",
            "\017",
            "\018",
            "\019",
            "\020",
            "\021",
            "\022",
            "\023",
            "\024",
            "\025",
            "\026",
            "\027",
            "\028",
            "\029",
            "\030",
            "\031",
            " ",
            "!",
            "\"",
            "#",
            "$",
            "%",
            "&",
            "'",
            "(",
            ")",
            "*",
            "+",
            ",",
            "-",
            ".",
            "/",
            "0",
            "1",
            "2",
            "3",
            "4",
            "5",
            "6",
            "7",
            "8",
            "9",
            ":",
            ";",
            "<",
            "=",
            ">",
            "?",
            "@",
            "A",
            "B",
            "C",
            "D",
            "E",
            "F",
            "G",
            "H",
            "I",
            "J",
            "K",
            "L",
            "M",
            "N",
            "O",
            "P",
            "Q",
            "R",
            "S",
            "T",
            "U",
            "V",
            "W",
            "X",
            "Y",
            "Z",
            "[",
            "\\",
            "]",
            "^",
            "_",
            "`",
            "a",
            "b",
            "c",
            "d",
            "e",
            "f",
            "g",
            "h",
            "i",
            "j",
            "k",
            "l",
            "m",
            "n",
            "o",
            "p",
            "q",
            "r",
            "s",
            "t",
            "u",
            "v",
            "w",
            "x",
            "y",
            "z",
            "{",
            "|",
            "}",
            "~",
            "\127",
            "\128",
            "\129",
            "\130",
            "\131",
            "\132",
            "\133",
            "\134",
            "\135",
            "\136",
            "\137",
            "\138",
            "\139",
            "\140",
            "\141",
            "\142",
            "\143",
            "\144",
            "\145",
            "\146",
            "\147",
            "\148",
            "\149",
            "\150",
            "\151",
            "\152",
            "\153",
            "\154",
            "\155",
            "\156",
            "\157",
            "\158",
            "\159",
            "\160",
            "\161",
            "\162",
            "\163",
            "\164",
            "\165",
            "\166",
            "\167",
            "\168",
            "\169",
            "\170",
            "\171",
            "\172",
            "\173",
            "\174",
            "\175",
            "\176",
            "\177",
            "\178",
            "\179",
            "\180",
            "\181",
            "\182",
            "\183",
            "\184",
            "\185",
            "\186",
            "\187",
            "\188",
            "\189",
            "\190",
            "\191",
            "\192",
            "\193",
            "\194",
            "\195",
            "\196",
            "\197",
            "\198",
            "\199",
            "\200",
            "\201",
            "\202",
            "\203",
            "\204",
            "\205",
            "\206",
            "\207",
            "\208",
            "\209",
            "\210",
            "\211",
            "\212",
            "\213",
            "\214",
            "\215",
            "\216",
            "\217",
            "\218",
            "\219",
            "\220",
            "\221",
            "\222",
            "\223",
            "\224",
            "\225",
            "\226",
            "\227",
            "\228",
            "\229",
            "\230",
            "\231",
            "\232",
            "\233",
            "\234",
            "\235",
            "\236",
            "\237",
            "\238",
            "\239",
            "\240",
            "\241",
            "\242",
            "\243",
            "\244",
            "\245",
            "\246",
            "\247",
            "\248",
            "\249",
            "\250",
            "\251",
            "\252",
            "\253",
            "\254",
            "\255"
        }
        v1093[0] = "\000"
        local function v1094(...)
            local v1095 = ""
            local v1096 = { ... }
            for v1097 = 1, #v1096 do
                v1095 = v1095 .. v1093[v1096[v1097]]
            end
            return v1095
        end
        local function v1098(p1099)
            local v1100 = ""
            for v1101 = 1, #p1099 do
                local v1102 = string.byte(p1099, v1101)
                v1100 = v1100 .. string.format("%03d", v1102)
            end
            return v1100
        end
        local function v1103(p1104)
            local v1105 = tostring(p1104)
            local v1106 = ""
            for v1107 = 1, #v1105, 3 do
                local v1108 = tonumber(v1105:sub(v1107, v1107 + 2))
                v1106 = v1106 .. v1094(v1108)
            end
            return v1106
        end
        local function v1109(p1110, p1111)
            local v1112 = {}
            for v1113 = 1, #p1110 do
                local v1114 = v1086(string.byte(p1110, v1113), string.byte(p1111, (v1113 - 1) % #p1111 + 1))
                table.insert(v1112, v1094(v1114))
            end
            return table.concat(v1112)
        end
        local function v1115(p1116)
            local v1117 = ""
            for v1118, v1119 in pairs(p1116) do
                v1117 = v1117 .. v1118 .. "=" .. v1119 .. "&"
            end
            return v1117:sub(1, #v1117 - 1)
        end
        local function v1120(p1121, p1122)
            local v1123 = ""
            for v1124 = 1, #p1121 do
                local v1125 = string.byte(p1121, v1124)
                if v1125 >= 65 and (v1125 <= 90) then
                    v1125 = (v1125 - 65 + p1122) % 26 + 65
                elseif v1125 >= 97 and (v1125 <= 122) then
                    v1125 = (v1125 - 97 + p1122) % 26 + 97
                end
                v1123 = v1123 .. v1094(v1125)
            end
            return v1123
        end
        local function v1126()
            local v1127 = tostring({}) .. tostring(function() end)
            local v1128 = {}
            for v1129 in v1127:gmatch("%d+") do
                table.insert(v1128, v1129)
            end
            local v1130 = {
                "a",
                "b",
                "c",
                "d",
                "e",
                "f",
                "g",
                "h",
                "i",
                "j",
                "k"
            }
            local v1131 = ""
            local v1132 = 1
            for v1133, v1134 in ipairs(v1128) do
                for v1135 = 1, #v1134 do
                    v1131 = v1131 .. v1134:sub(v1135, v1135)
                    if v1132 <= #v1130 then
                        v1131 = v1131 .. v1130[v1132]
                        v1132 = v1132 + 1
                        if v1132 > #v1130 then
                            v1132 = 1
                        end
                    end
                end
            end
            return v1131
        end
        local function v1136()
            local v1137 = tostring({}) .. tostring(function() end) .. tostring(game:GetService("HttpService"):GenerateGUID(false)) .. tostring(math.random()) .. tostring(os.clock()) .. tostring(game.Workspace.DistributedGameTime)
            local v1138 = {}
            for v1139 in v1137:gmatch("%d+") do
                table.insert(v1138, v1139)
            end
            local v1140 = {
                "a",
                "b",
                "c",
                "d",
                "e",
                "f",
                "g",
                "h",
                "i",
                "j",
                "k",
                "l",
                "m",
                "n",
                "o",
                "p",
                "q",
                "r",
                "s",
                "t",
                "u",
                "v",
                "w",
                "x",
                "y",
                "z"
            }
            local v1141 = ""
            for v1142, v1143 in ipairs(v1138) do
                for v1144 = 1, #v1143 do
                    v1141 = v1141 .. v1143:sub(v1144, v1144)
                    v1141 = v1141 .. v1140[math.random(#v1140)]
                end
            end
            local v1145 = {}
            for v1146 = 1, #v1141 do
                table.insert(v1145, v1141:sub(v1146, v1146))
            end
            for v1147 = #v1145, 2, -1 do
                local v1148 = math.random(v1147)
                v1145[v1147], v1145[v1148] = v1145[v1148], v1145[v1147]
            end
            return table.concat(v1145)
        end
        local v1149 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
        enc = function(p1150)
            return (p1150:gsub(".", function(p1151)
                local v1152, v1153 = "", p1151:byte()
                for v1154 = 8, 1, -1 do
                    v1152 = v1152 .. (v1153 % 2 ^ v1154 - (v1153 % 2 ^ (v1154 - 1)) > 0 and "1" or "0")
                end
                return v1152
            end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(p1155)
                if #p1155 < 6 then
                    return ""
                end
                local v1156 = 0
                for v1157 = 1, 6 do
                    v1156 = v1156 + (p1155:sub(v1157, v1157) == "1" and 2 ^ (6 - v1157) or 0)
                end
                return v1149:sub(v1156 + 1, v1156 + 1)
            end) .. ({ "", "==", "=" })[#p1150 % 3 + 1]
        end
        dec = function(p1158)
            p1158 = string.gsub(p1158, "[^" .. v1149 .. "=]", "")
            return (p1158:gsub(".", function(p1159)
                if p1159 == "=" then
                    return ""
                end
                local v1160, v1161 = "", v1149:find(p1159) - 1
                for v1162 = 6, 1, -1 do
                    v1160 = v1160 .. (v1161 % 2 ^ v1162 - (v1161 % 2 ^ (v1162 - 1)) > 0 and "1" or "0")
                end
                return v1160
            end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(p1163)
                if #p1163 ~= 8 then
                    return ""
                end
                local v1164 = 0
                for v1165 = 1, 8 do
                    v1164 = v1164 + (p1163:sub(v1165, v1165) == "1" and 2 ^ (8 - v1165) or 0)
                end
                return v1094(v1164)
            end))
        end
        local function v1166()
            if not getgenv().AllowAutoBountyTelemetry then
                return
            end
            local v1167 = game:GetService("HttpService")
            local v1168 = game.Players.LocalPlayer
            local v1169 = game.Players.LocalPlayer.Data
            local v1170 = tostring(v1169.Level.Value)
            local v1171 = tostring(v1169.Beli.Value)
            local v1172 = tostring(v1169.Fragments.Value)
            local v1173 = tostring(v1168.Data.Race.Value) .. "[%s]"
            local v1174 = ""
            local v1175 = { "BlackLeg", "Electro", "FishmanKarate" }
            local v1176 = {
                "Superhuman",
                "SharkmanKarate",
                "DeathStep",
                "ElectricClaw",
                "Godhuman",
                "DragonTalon",
                "SanguineArt"
            }
            local v1177 = "%s / 6"
            local v1178 = 0
            local v1179 = Sea1 and "1" or (Sea2 and "2") or (Sea3 and "3")
            for v1180, v1181 in pairs(v1176) do
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buy" .. v1181, true) == 1 then
                    v1178 = v1178 + 1
                end
            end
            if v1178 == 7 then
                v1177 = "Sanguine Art"
            elseif v1178 == 6 then
                v1177 = "God Human"
            else
                v1177 = v1177:format(tostring(v1178))
            end
            local v1182 = {
                Mink = "Agility",
                Skypiea = "Heavenly Blood",
                Ghoul = "Heightened Senses",
                Fishman = "Water Body",
                Cyborg = "Energy Core",
                Human = "Last Resort"
            }
            v1168 = game.Players.LocalPlayer
            Type = ""
            local function v1183()
                for v1184, v1185 in pairs(v1168.Backpack:GetChildren()) do
                    if v1185:IsA("Tool") and (v1185.ToolTip == Type) and (v1185.Name == v1182[v1168.Data.Race.Value]) then
                        return true
                    end
                end
                for v1186, v1187 in pairs(v1168.Character:GetChildren()) do
                    if v1187:IsA("Tool") and (v1187.ToolTip == Type) and (v1187.Name == v1182[v1168.Data.Race.Value]) then
                        return true
                    end
                end
            end
            if v1183() then
                v1173 = v1173:format("V3")
            elseif v1168.Data.Race:FindFirstChild("Evolved") then
                v1173 = v1173:format("V2")
            else
                v1173 = v1173:format("V1")
            end
            v1174 = string.sub(v1174, 1, #v1174 > 2 and #v1174 - 2 or 1)
            local function v1188()
                return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getAwakenedAbilities")
            end
            local v1189 = ""
            local v1190 = {
                "Z",
                "X",
                "C",
                "V",
                "F",
                "TAP"
            }
            local v1191 = v1188()
            if not v1191 then
                v1189 = "Can't Awaken"
            else
                for v1192, v1193 in pairs(v1190) do
                    if v1191[v1193] and v1191[v1193].Awakened then
                        v1189 = v1189 .. v1193 .. ", "
                    end
                end
            end
            local v1194 = {
                Sword = {},
                Material = {},
                ["Blox Fruit"] = {},
                Wear = {},
                Gun = {}
            }
            local v1195 = {
                Sword = {},
                Material = {},
                ["Blox Fruit"] = {},
                Wear = {},
                Gun = {}
            }
            local v1196 = {}
            for v1197, v1198 in pairs(Returned) do
                if v1194[v1198.Type] then
                    table.insert(v1194[v1198.Type], v1198)
                end
            end
            local v1199 = {}
            local v1200 = { 3, 2, 1, 0 }
            for v1201, v1202 in pairs(v1194) do
                if v1201 == "Material" or v1201 == "Blox Fruit" then
                    continue
                end
                for v1203, v1204 in pairs(v1202) do
                    local v1205 = false
                    for v1206, v1207 in pairs(v1200) do
                        if v1204.Rarity == v1207 then
                            table.insert(v1195[v1201], v1204.Name)
                            v1205 = true
                        end
                    end
                    if v1205 then
                        continue
                    end
                    table.insert(v1199, v1204.Name)
                end
            end
            v1200 = {
                4,
                3,
                2,
                1,
                0
            }
            for v1208, v1209 in pairs(v1194) do
                if v1208 ~= "Material" and (v1208 ~= "Blox Fruit") then
                    continue
                end
                for v1210, v1211 in pairs(v1209) do
                    for v1212, v1213 in pairs(v1200) do
                        if v1211.Rarity == v1213 then
                            table.insert(v1195[v1208], v1211.Name)
                        end
                    end
                    if v1211.Rarity == 4 and (v1208 == "Blox Fruit") then
                        table.insert(v1196, v1211.Name)
                    end
                end
            end
            local v1214 = ""
            local v1215 = ""
            local v1216 = ""
            local v1217 = ""
            local v1218 = ""
            local v1219 = ""
            local v1220 = ""
            for v1221, v1222 in pairs(v1199) do
                v1214 = v1214 .. v1222 .. ", "
            end
            for v1223, v1224 in pairs(v1196) do
                v1220 = v1220 .. v1224 .. ", "
            end
            for v1225, v1226 in pairs(v1195.Sword) do
                v1215 = v1215 .. v1226 .. ", "
            end
            for v1227, v1228 in pairs(v1195.Material) do
                v1216 = v1216 .. v1228 .. ", "
            end
            for v1229, v1230 in pairs(v1195["Blox Fruit"]) do
                v1217 = v1217 .. v1230 .. ", "
            end
            for v1231, v1232 in pairs(v1195.Wear) do
                v1218 = v1218 .. v1232 .. ", "
            end
            for v1233, v1234 in pairs(v1195.Gun) do
                v1219 = v1219 .. v1234 .. ", "
            end
            v1215 = string.sub(v1215, 1, #v1215 - 2)
            local v1235 = {}
            local v1236 = ""
            if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") then
                table.insert(v1235, "Unlocked Entrance")
            else
                local v1237 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress", "Check")
                if v1237 and (type(v1237) == "number") then
                    table.insert(v1235, "Entrace Stage: " .. tostring(v1237))
                end
            end
            if string.find(v1216, "Mirror Fractal") then
                table.insert(v1235, "Mirror Fractal")
            end
            if string.find(v1218, "Valkyrie Helm") then
                table.insert(v1235, "Valkyrie Helm")
            end
            for v1238, v1239 in pairs(v1235) do
                v1236 = v1236 .. v1239 .. ", "
            end
            local v1240 = "Auto Bounty"
            local v1241 = "680712584286044182"
            Status = v1240 .. "[%s]"
            Status = Status:format(tostring(StatusFarming2))
            local v1242 = v1136()
            local v1243 = v1120("DitConMeMayNhinNhinCaiLonOcCacCutMeDi12312312313097473@@@", 1)
            local v1244 = { Client = v1242, Username = game.Players.LocalPlayer.Name, Discord = v1241 }
            local v1245 = func_1074({
                Url = "https://thetakenisland.xyz/api/script/diffhell.php",
                Method = "POST",
                headers = {
                    ["Content-Type"] = "application/x-www-form-urlencoded"
                },
                Body = v1115(v1244)
            })
            local v1246 = v1167:JSONDecode(v1245.Body).Server
            local v1247 = enc(v1109(v1242, v1246))
            local v1248 = "Hello from Lua!"
            EncryptAndToHex = function(p1249, p1250)
                p1249 = v1109(p1249, p1250)
                p1249 = p1249:gsub(".", function(p1251)
                    return string.format("%02X", string.byte(p1251))
                end)
                return p1249
            end
            EncryptTable = function(p1252, p1253)
                local v1254 = p1253 or {}
                for v1255, v1256 in pairs(p1252) do
                    if not table.find(v1254, v1255) then
                        p1252[v1255] = EncryptAndToHex(v1256, v1247 .. v1243)
                    end
                end
            end
            AddData = function(p1257)
                p1257.Message = v1248
                p1257.sharedSecret = v1098(v1247)
                p1257.JobId = game.JobId
                p1257.DeviceName = type(getgenv().DeviceName) == "string" and getgenv().DeviceName or "UnNamed"
                p1257.Username = game.Players.LocalPlayer.Name
                p1257.TimeStamp = tostring(os.time())
                p1257.Discord = v1241
            end
            local v1258 = {
                Username = v1168.Name,
                level = v1170,
                beli = v1171,
                fragment = v1172,
                bounty = tostring(game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value),
                sea = v1179,
                melee = v1177,
                mythicalweapon = v1214,
                mythicalfruit = v1220,
                sword = v1215,
                gun = v1219,
                wear = v1218,
                dfstored = v1217,
                miscinfo = v1236,
                dfs = v1169.DevilFruit.Value == "" and "Fruitless" or v1169.DevilFruit.Value,
                Awaken = v1189,
                CheckSum = "DitMeMaySpamDi?",
                Status = Status,
                Traffic = "Blox Fruit Panel",
                Race = v1173
            }
            AddData(v1258)
            EncryptTable(v1258, { "sharedSecret" })
            v1245 = func_1074({
                Url = "https://thetakenisland.xyz/api/script/diffhell.php",
                Method = "POST",
                headers = {
                    ["Content-Type"] = "application/x-www-form-urlencoded"
                },
                Body = v1115(v1258)
            })
            if true then
                print(v1245.Body)
            end
        end
        spawn(function()
            task.spawn(function()
                while task.wait(3) do
                    pcall(function()
                        local v1259 = getgenv().WeaponsSetting
                        if not v1259 then
                            return
                        end
                        local v1260 = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes") and game:GetService("ReplicatedStorage").Remotes:FindFirstChild("CommF_")
                        if not v1260 then
                            return
                        end
                        if v1259.Melee and v1259.Melee.Select and v1259.Melee.Select.Enable then
                            local v1261 = v1259.Melee.Select.Name
                            if v1261 then
                                local v1262 = v1261:gsub("-", "")
                                if v1261 == "God-Human" then
                                    v1262 = "Godhuman"
                                end
                                if v1261 == "SuperHuman" then
                                    v1262 = "Superhuman"
                                end
                                local v1263 = game:GetService("Players").LocalPlayer
                                local v1264 = v1263.Backpack:FindFirstChild(v1261) or (v1263.Character and v1263.Character:FindFirstChild(v1261))
                                if not v1264 then
                                    local v1265 = v1260:InvokeServer("Buy" .. v1262, true)
                                    if v1265 == 1 then
                                        local v1266 = {
                                            ["God-Human"] = "Ancient Monk",
                                            Godhuman = "Ancient Monk",
                                            ["Electric-Claw"] = "Previous Hero",
                                            ["Dragon-Talon"] = "Uzoth",
                                            ["Death-Step"] = "Phoeyu, the Reformed",
                                            SuperHuman = "Martial Arts Master",
                                            Superhuman = "Martial Arts Master",
                                            ["Sharkman-Karate"] = "Daigrock, the Sharkman",
                                            ["Dragon-Breath"] = "Sabi",
                                            ["Dark-Step"] = "Dark Step Teacher",
                                            ["Water-Kung-Fu"] = "Water Kung Fu Teacher",
                                            Electro = "Mad Scientist"
                                        }
                                        local v1267 = v1266[v1261]
                                        if v1267 then
                                            local v1268 = workspace.NPCs:FindFirstChild(v1267) or workspace.Map:FindFirstChild(v1267, true)
                                            if v1268 and v1268:FindFirstChild("HumanoidRootPart") and DoTween then
                                                local v1269 = (v1263.Character.HumanoidRootPart.Position - v1268.HumanoidRootPart.Position).Magnitude
                                                if v1269 > 15 then
                                                    DoTween(v1268.HumanoidRootPart.CFrame, true)
                                                else
                                                    v1260:InvokeServer("Buy" .. v1262)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        if v1259.Sword and v1259.Sword.Select and v1259.Sword.Select.Enable then
                            local v1270 = v1259.Sword.Select.Name
                            if v1270 then
                                local v1271 = game:GetService("Players").LocalPlayer
                                local v1272 = v1271.Backpack:FindFirstChild(v1270) or (v1271.Character and v1271.Character:FindFirstChild(v1270))
                                if not v1272 then
                                    if checkinv and checkinv(v1270) then
                                        v1260:InvokeServer("LoadItem", v1270)
                                    end
                                end
                            end
                        end
                        if v1259.Gun and v1259.Gun.Select and v1259.Gun.Select.Enable then
                            local v1273 = v1259.Gun.Select.Name
                            if v1273 then
                                local v1274 = game:GetService("Players").LocalPlayer
                                local v1275 = v1274.Backpack:FindFirstChild(v1273) or (v1274.Character and v1274.Character:FindFirstChild(v1273))
                                if not v1275 then
                                    if checkinv and checkinv(v1273) then
                                        v1260:InvokeServer("LoadItem", v1273)
                                    end
                                end
                            end
                        end
                    end)
                end
            end)
            while true do
                task.wait(60)
            end
        end)
    end)
end
local function v1276(p1277)
    if not p1277 or p1277 == "" then
        return
    end
    local v1278 = string.split(p1277, " ")
    if v1278[1] == "Earned" then
        local v1279 = v1278[#v1278]
        print(p1277, v1279)
        if v1279 then
            local v1280 = game.Players:FindFirstChild(v1279)
            if v1280 then
                func_789(v1280)
            end
        end
    end
    if string.find(p1277, "Cannot attack players in a Safe Zone") or string.find(p1277, "Player died recently") then
        pcall(function()
            print("Found ")
            SkipCurrentPlayer = true
        end)
    end
end
for v1281, v1282 in pairs(PlayerGui.Notifications:GetChildren()) do
    if v1281 and v1282:IsA("TextLabel") and v1282.Text then
        v1276(v1282.Text)
        textConn2 = v1282:GetPropertyChangedSignal("Text"):Connect(function()
            v1276(v1282.Text)
        end)
        v1282.AncestryChanged:Connect(function(p1283, p1284)
            if not p1284 and textConn2 then
                textConn2:Disconnect()
                textConn2 = nil
            end
        end)
    end
end
PlayerGui.Notifications.ChildAdded:Connect(function(p1285)
    if p1285 and p1285:IsA("TextLabel") then
        v1276(p1285.Text)
        local v1286
        v1286 = p1285:GetPropertyChangedSignal("Text"):Connect(function()
            v1276(p1285.Text)
        end)
        p1285.AncestryChanged:Connect(function(p1287, p1288)
            if not p1288 and v1286 then
                v1286:Disconnect()
                v1286 = nil
            end
        end)
    end
end)
local function v1289(p1290, p1291)
    local v1292 = v926()
    local v1293 = v929()
    local v1294 = "Normal"
    if v1292 then
        v1294 = v1292
    elseif v1293 then
        v1294 = v1293
    elseif p1290 and not v823.ForceMelee then
        v1294 = v847("MethodIfPlayerOnV4")
    elseif p1291 then
        v1294 = v847("MethodIfTargetOnV4")
    else
        v1294 = v847("NormalMethod")
    end
    return v1294
end
HealthChecking = Character.Humanoid.HealthChanged:Connect(function(p1295)
    local v1296 = typeof(v840("SafeModeHealth")) == "table" and v840("SafeModeHealth") or { 4000, 50 }
    v751(v1296)
end)
LocalPlayer.CharacterAdded:Connect(function(p1297)
    if HealthChecking then
        HealthChecking:Disconnect()
    end
    Character = p1297
    local v1298 = Character:WaitForChild("Humanoid")
    HealthChecking = v1298.HealthChanged:Connect(function(p1299)
        local v1300 = typeof(v840("SafeModeHealth")) == "table" and v840("SafeModeHealth") or { 4000, 50 }
        v751(v1300)
    end)
end)
local v1301 = Instance.new("ScreenGui")
v1301.Name = "AutoBountyToggleBtn"
pcall(function()
    v1301.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui", 3)
end)
if not v1301.Parent then
    v1301.Parent = game:GetService("CoreGui")
end
v1301.ResetOnSpawn = false
v1301.DisplayOrder = 99999
local v1302 = Instance.new("ImageButton")
v1302.Name = "ToggleBtn"
v1302.Parent = v1301
v1302.Size = UDim2.new(0, 45, 0, 45)
v1302.Position = UDim2.new(0, 15, 0.5, 0)
v1302.AnchorPoint = Vector2.new(0, 0.5)
v1302.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
v1302.BackgroundTransparency = 0
v1302.Image = "http://www.roblox.com/asset/?id=81869325929275"
local v1303 = Instance.new("UICorner")
v1303.CornerRadius = UDim.new(1, 0)
v1303.Parent = v1302
v1302.MouseButton1Click:Connect(function()
    local v1304 = game:GetService("CoreGui"):FindFirstChild("HUHU")
    if v1304 then
        v1304.Enabled = not v1304.Enabled
    end
    local v1305 = game:GetService("CoreGui"):FindFirstChild("Vape HubHubAutoBounty")
    if v1305 then
        v1305.Enabled = not v1305.Enabled
    end
end)
local v1306
while task.wait(0.1) do
    Target, AttackableCount = v810()
    v118("Attackable Player: " .. tostring(AttackableCount))
    if AttackableCount == 0 then
        v137("AttackableCount is 0 - Hopping")
        TrueServerHop(8, 12)
        task.wait(10)
        continue
    end
    getgenv().CurrentTarget = Target
    print(Target)
    StartAttack, StartAttackNear, LastDmg = tick(), nil, nil
    print(v801(Target), v888(Target, StartAttack, StartAttackNear))
    v123 = 0
    UpdatePosition = task.spawn(function()
        while task.wait() do
            if Target and func_456(Target.Character) then
                local v1307 = Target.Character.HumanoidRootPart.Position + (Target.Character.HumanoidRootPart.Velocity / 3)
                if getgenv().CurrentSkillWeapon and getgenv().CurrentSkillName and v856(getgenv().CurrentSkillWeapon, "NoPredict", getgenv().CurrentSkillName) then
                    v1307 = Target.Character.HumanoidRootPart.Position
                end
                getgenv().SilentAimPlayer = v1307
            end
        end
    end)
    CurrentTargetV4State, CurrentPlayerV4State = false, false
    UpdateCondition = task.spawn(function()
        while task.wait(0.5) do
            if StartAttackNear and not LastDmg and (tick() - StartAttackNear >= 15) then
                SkipCurrentPlayer = true
                v137("Timeout without damage - Hopping")
                TrueServerHop(8, 12)
                task.wait(10)
            end
            if func_456() then
                if v735(v177.Character) then
                    CurrentPlayerV4State = true
                end
            else
                CurrentPlayerV4State = false
            end
            if Target and func_456(Target.Character) then
                if v735(Target.Character) then
                    CurrentTargetV4State = true
                else
                    CurrentTargetV4State = false
                end
                if v844("ForceMelee") and (Target.Character.Humanoid.Health >= Target.Character.Humanoid.MaxHealth * 80 / 100) and (not StartAttackNear or tick() - StartAttackNear <= v844("ForceMeleeTime")) then
                    local v1308 = v824("Melee")
                    if v1308 then
                        pcall(Equip, v1308.Name)
                    end
                    v823.ForceMelee = true
                else
                    v823.ForceMelee = false
                end
            else
                SkipCurrentPlayer = true
            end
            v823.Method = v1289(CurrentPlayerV4State, CurrentTargetV4State)
        end
    end)
    if v1306 then
        pcall(task.cancel, v1306)
    end
    v1306 = task.spawn(function()
        local v1309 = game.Players.LocalPlayer.Character
        local v1310 = v1309 and v1309:FindFirstChild("HumanoidRootPart")
        if not v1310 then
            return
        end
        local v1311 = v1310.Position or Vector3.new(0, 0, 0)
        while task.wait(300) do
            if game.Players.LocalPlayer.Character ~= v1309 or not v1310.Parent then
                return
            end
            if (Vector3.new(v1310.Position.X, 0, v1310.Position.Z) - Vector3.new(v1311.X, 0, v1311.Z)).Magnitude <= 200 then
                TrueServerHop(8, 12)
            else
                v1311 = v1310.Position
            end
        end
    end)
    LastTargetHealth = 0
    if Target and func_456(Target.Character) then
        LastTargetHealth = Target.Character.Humanoid.Health
    end
    getgenv().MinWaitDmg = nil
    ComboConnection = game.ReplicatedStorage:WaitForChild("Remotes"):FindFirstChild("Combo").OnClientEvent:Connect(function(p1312)
        if Target and func_456(Target.Character) then
            LastDmg = tick()
            if LastTargetHealth - Target.Character.Humanoid.Health >= 1500 then
                LastTargetHealth = Target.Character.Humanoid.Health
                local v1313 = v847("LowHealthTargetCondition")
                if v1313 and v1313.Enable and (Target.Character.Humanoid.Health <= Target.Character.Humanoid.MaxHealth * (v1313.Health or 50) / 100) and func_456() and (v177.Character.Humanoid.Health >= v177.Character.Humanoid.MaxHealth * 70 / 100) then
                    print(p1312, "start waiting")
                    getgenv().MinWaitDmg = tick()
                end
            end
        end
    end)
    if ForceStop then
        break
    end
    if Target then
        print("Current target: ", Target)
        v823.Method = v847("NormalMethod") or "Normal"
        while v801(Target) and v888(Target, StartAttack, StartAttackNear) and not SkipCurrentPlayer and not ForceStop and task.wait() do
            _, err = pcall(function()
                v932()
                if Target and func_456(Target.Character) and func_456() then
                    if v177.PlayerGui.Main.PvpDisabled.Visible == true then
                        if not damopvp then
                            damopvp = true
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                            wait(6)
                            damopvp = false
                        end
                    end
                    if not RunningSafeMode then
                        if v494(Target.Character, v177.Character) <= 200 then
                            UseRaceV4()
                            if v840("UseRaceV3") then
                                pcall(SmartAbilityUse, not v840("SmartUseRaceV3"))
                            end
                            if not StartAttackNear then
                                StartAttackNear = tick()
                            end
                            v823.CanUseSkill = true
                        elseif v494(Target.Character, v177.Character) >= 1000 then
                            while not func_456() do
                                task.wait(0.1)
                            end
                        end
                        if v823.Method == "Normal" and getgenv().MinWaitDmg and (tick() - getgenv().MinWaitDmg <= ((v847("LowHealthTargetCondition") or {}).WaitTime or 1.5)) then
                            print(tick() - getgenv().MinWaitDmg)
                            DoTween(v445(Target.Character).CFrame + Vector3.new(0, 100, 0), true)
                        elseif v177.Character:FindFirstChild("Stun") then
                            if v823.ForceMelee and (v177.Character.Stun.Value == 0) then
                                DoTween(v445(Target.Character).CFrame + Vector3.new(0, 4, 0), true)
                            elseif v177.Character.Stun.Value == 0 then
                                if Target.Character.HumanoidRootPart.Velocity.Magnitude < 20 then
                                    DoTween(v445(Target.Character).CFrame + Vector3.new(0, 7, -2) + PredictTween(Target), true)
                                else
                                    DoTween(v445(Target.Character).CFrame + Vector3.new(0, 7, -2) + (Target.Character.HumanoidRootPart.Velocity / 3), true)
                                end
                            end
                        else
                            DoTween(v445(Target.Character).CFrame + Vector3.new(0, 100, 0), true)
                        end
                    else
                        v137("IN Safe Mode")
                    end
                end
            end)
            if err then
                print("Auto Bounty Error ", err)
            end
        end
    else
        v137("No Target Found")
        TrueServerHop(8, 12)
        task.wait(10)
    end
    print(Target)
    print(v801(Target), v888(Target, StartAttack, StartAttackNear), not SkipCurrentPlayer)
    getgenv().MinWaitDmg = nil
    getgenv().CurrentTarget = nil
    RunningSafeMode = false
    if v1306 then
        pcall(task.cancel, v1306)
        v1306 = nil
    end
    if ComboConnection then
        ComboConnection:Disconnect()
        ComboConnection = nil
    end
    if UpdateCondition then
        task.cancel(UpdateCondition)
        UpdateCondition = nil
    end
    if UpdatePosition then
        task.cancel(UpdatePosition)
        UpdatePosition = nil
    end
    if v915 then
        v137("Stopped Attack Checker")
        pcall(function()
            v915:Disconnect()
            v915 = nil
        end)
    end
    if Target ~= nil then
        print("Current target 2: ", Target)
        if SkipCurrentPlayer then
            func_789(Target)
        else
            func_792(Target, 120)
        end
        v137("Dropped target - Hopping to save time")
        TrueServerHop(8, 12)
        task.wait(10)
    else
        v137("No Target Found")
        TrueServerHop(8, 12)
        task.wait(10)
    end
    v823.CanUseSkill = nil
    getgenv().CurrentTarget = nil
    SkipCurrentPlayer = false
end
