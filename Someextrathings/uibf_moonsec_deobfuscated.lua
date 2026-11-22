-- Lynd Deobfuscator & Dumper | https://discord.gg/SRvRc2XF6s
-- processed in 6728ms

local v1 = game:GetService("Players")
local v2 = game:GetService("TextService")
local v3 = game:GetService("TweenService")
local v4 = game:GetService("UserInputService")
local v5 = game:GetService("HttpService")
local v6 = game:GetService("CoreGui")
local v7 = game:GetService("Players")
local v8 = game:GetService("UserInputService")
local v9 = game:GetService("TweenService")
local v10 = game:GetService("RunService")
local v11 = v7.LocalPlayer:GetMouse()
local v12 = game:GetService("VirtualInputManager")
local v13 = game:GetService("VirtualUser")
local v14 = game:GetService("HttpService")
local v15 = game:GetService("Lighting")
local v16 = game:GetService("ReplicatedStorage")
local v17 = game:GetService("TeleportService")
local v18 = game:GetService("StarterGui")

local function v19()
	if _u0.Character then
		local v20 = _u0.CharacterAdded:Wait()
	end

	return v20
end

local function v21()
	local v22 = _u0()
	return v22:FindFirstChild(v22, "Humanoid")
	return v22:FindFirstChild
end

local function v23()
	local v24 = _u0()
	return v24:FindFirstChild(v24, "HumanoidRootPart")
	return v24:FindFirstChild
end

local function v25(a, b, c)
	_u0:SetCore("SendNotification", { Title = a, Text = b, Duration = c })
end

local v26 = game:GetService("Players")
local v27 = game:GetService("TextService")
local v28 = game:GetService("TweenService")
local v29 = game:GetService("UserInputService")
local v30 = game:GetService("HttpService")
local v31 = game:GetService("CoreGui")
local v32 = game:GetService("Players")
local v33 = game:GetService("UserInputService")
local v34 = game:GetService("TweenService")
local v35 = game:GetService("RunService")
local v36 = v32.LocalPlayer:GetMouse()
local v37 = game:GetService("VirtualInputManager")
local v38 = game:GetService("VirtualUser")
local v39 = game:GetService("HttpService")
local v40 = game:GetService("Lighting")
local v41 = game:GetService("ReplicatedStorage")
local v42 = game:GetService("TeleportService")
local v43 = game:GetService("StarterGui")

local function v44()
	if _u0.Character then
		local v45 = _u0.CharacterAdded:Wait()
	end

	return v45
end

local function v46()
	local v47 = _u0()
	return v47:FindFirstChild(v47, "Humanoid")
	return v47:FindFirstChild
end

local function v48()
	local v49 = _u0()
	return v49:FindFirstChild(v49, "HumanoidRootPart")
	return v49:FindFirstChild
end

local function v50(a, b, c)
	_u0:SetCore("SendNotification", { Title = a, Text = b, Duration = c })
end

local v51 = identifyexecutor()
local v53 = loadstring(game:HttpGet("https://raw.githubusercontent.com/zenhutest/moon/refs/heads/main/testingg"))
v53 = v53()
local v52 = loadstring(game:HttpGet("https://raw.githubusercontent.com/ZenHubbScript/Main/refs/heads/main/log"))
v52()
local v54 = game:GetService("MarketplaceService")
v54 = v54:GetProductInfo(game.PlaceId)
_G.Title = v54.Name
v52 = v53:NewWindow("", "Executor : " .. v51, "rbxassetid://17775417459")
v54 = v52:AddMenu("" .. _G.Title, "", "ticket", "tab")
local v55 = v54:AddTab("Information", 10723415903, "changelog,credits,etc..")
local v56 = v54:AddTab("Configs Farm", 10734950020, "distance,bringmob")
local v57 = v54:AddTab("Main Farm", 10723407389, "farm,bossess,etc.")
local v58 = v54:AddTab("Items Farm", 15557776256, "items,swords.etc..")
local v59 = v54:AddTab("Local Player", 10709770431, "stats,fake,etc")
local v60 = v54:AddTab("Sea Events", 10734941354, "mirrage,auto boat")
local v61 = v54:AddTab("Dragon Events", 105643281470017, "auto dojo,belt,etc")
local v62 = v54:AddTab("Race V4", 14477517268, "racev4,moons,etc.")
local v63 = v54:AddTab("Dungeon Raid", 10734932295, "autoraid,boss")
local v64 = v54:AddTab("Island Travel", 10734886004, "teleport,hop,etc..")
local v65 = v54:AddTab("Stores", 10734952479, "melee,swords,guns")
local v66 = v54:AddTab("Miscellaneous", 10734949856, "auto open,auto switch")
local v67 = v54:AddTab("Fun Visual", 6034467796, "auto v4 any race,rainfruit")
local v68 = game:GetService("Players")
local v69, v70 = v68:GetUserThumbnailAsync(v68.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
local v71 = v55:AddSection("Info", "" .. v68.LocalPlayer.Name .. "  [ User Id : " .. v68.LocalPlayer.UserId .. " ]", "Join Zen Hub Discord For Updates! \nuse at your own risk.", "" .. v69)
local v72 = v55:AddSection("Changelog", "Script Made By jay#0050 Fix By Imrane", "Join Zen Hub Discord For Updates! \nuse at your own risk.", "http://www.roblox.com/asset/?id=6031233840")
local v73 = v72:AddLabel("Time")

function UpdateTime()
	local v74 = math.floor(workspace.DistributedGameTime + 0.5)
	local v75 = math.floor(v74 / 3600)
	local v76 = math.floor(v74 / 60)
	local v77 = math.floor(v74 / 1)
	local v78 = string.format("%02d.%02d.%02d", v75 % 24, v76 % 60, v77 % 60)
	_u0:Set("Game Time : " .. v78)
end

spawn(function()
	while true do
		local v79 = task.wait()

		if not v79 then
			UpdateTime()
		end

	end
end)
local v80 = v72:AddLabel("Players")
spawn(function()
	while true do
		pcall(function()
			local v81 = _u0:GetPlayers()

			if #v81 == 12 then
				_u1:Set("Players: " .. #v81 .. " / " .. 12 .. " (Max)")
			else

				if #v81 == 1 then
					_u1:Set("Player: " .. #v81 .. " / " .. 12)
				else
					_u1:Set("Players: " .. #v81 .. " / " .. 12)
				end

			end
		end)
		task.wait(1)
	end
end)
local v82 = v72:AddLabel("")
local v83 = v72:AddLabel("Frozen Dimension")
spawn(function()
	pcall(function()
		while true do
			local v84 = task.wait()

			if not v84 then
				v84 = game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island")

				if not v84 then
					_u0:Set("Mirage Island Status :  Found")
				end

			end

			_u0:Set("Mirage Island Status : Not Found")
		end

	end
	end)
end)
spawn(function()
	pcall(function()
		while true do
			local v85 = task.wait()

			if not v85 then
				v85 = game.Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension")

				if not v85 then
					_u0:Set("Frozen Dimension Status : Found")
				end

			end

			_u0:Set("Frozen Dimension Status : Not Found")
		end

	end
	end)
end)
local v86 = v72:AddLabel("Kitsune Island Status : Not Found")
task.spawn(function()
	while true do
		local v87 = task.wait()

		if not v87 then
			pcall(function()
				local v88 = game.Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island")

				if not v88 then
					_u0:Set("Kitsune Island Status : Found")
				else
					_u0:Set("Kitsune Island Status : Not Found")
				end
			end)
		end

	end
end)
local v89 = v72:AddLabel("Third World")
task.spawn(function()
	while true do
		local v90 = task.wait()

		if not v90 then
			pcall(function()
				if _u0.Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
					_u1:Set("Full Moon Status : 100%")
				else

					if _u0.Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
						_u1:Set("Full Moon Status : 75%")
					else

						if _u0.Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709143733" then
							_u1:Set("Full Moon Status : 50%")
						else

							if _u0.Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709150401" then
								_u1:Set("Full Moon Status : 25%")
							else

								if _u0.Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149680" then
									_u1:Set("Full Moon Status : 15%")
								else
									_u1:Set("Wait For Moon")
								end

							end

						end

					end

				end
			end)
		end

	end
end)
local v91 = v72:AddLabel("Status")
spawn(function()
	while true do
		local v92 = task.wait()

		if not v92 then
			pcall(function()
				local v93 = _u0:FindFirstChild("Diablo")

				if v93 then
					v93 = _u0:FindFirstChild("Deandre")

					if v93 then
						v93 = _u0:FindFirstChild("Urban")

						if v93 then
							v93 = game:GetService("Workspace")
							v93 = v93.Enemies:FindFirstChild("Diablo")

							if v93 then
								v93 = game:GetService("Workspace")
								v93 = v93.Enemies:FindFirstChild("Deandre")

								if v93 then
									v93 = game:GetService("Workspace")
									v93 = v93.Enemies:FindFirstChild("Urban")

									if not v93 then
									else
									else
									else
									else
									else
										_u1:Set("Elite Status : Spawn")
									end

								end

							end

						end

					end

				else
					_u1:Set("Elite Status : Not Found")
				end
			end)
		end

	end
end)
local v94 = v72:AddLabel("")
spawn(function()
	while true do
		local v95 = task.wait()

		if not v95 then
			pcall(function()
				local v97 = string.len(_u0.Remotes.CommF_:InvokeServer("CakePrinceSpawner"))

				if v97 == 88 then
					local v98 = _u0.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
					local v99 = string.sub(v98, 39, 41)
					_u1:Set(_u1, "Dimension Kill : " .. v99)
				else
					v97 = string.len(_u0.Remotes.CommF_:InvokeServer("CakePrinceSpawner"))

					if v97 == 87 then
						v98 = _u0.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
						v99 = string.sub(v98, 39, 40)
						_u1:Set(_u1, "Dimension Kill : " .. v99)
					else
						v97 = string.len(_u0.Remotes.CommF_:InvokeServer("CakePrinceSpawner"))

						if v97 == 86 then
							v98 = _u0.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
							v99 = string.sub(v98, 39, 39)
							_u1:Set(_u1, "Dimension Kill : " .. v99)
						else
							_u1:Set("Dimension Boss Is Spawning")
						end

					end

				end
			end)
		end

	end
end)
v71:Button("Copy Zen Hub Discord Link", function(a) end)
local v100 = v55:AddSection("Changelog", "Update Log", "all the update in zen hub", "rbxassetid://6034467796")
v100:AddLabel("- Fixed Some bug issued")
v100:AddLabel("- Fix Auto Collect Amber")
v100:AddLabel("- Fixed Level Auto Farms")
v100:AddLabel("- Fixed Auto Sea Events")
v100:AddLabel("- Improve Functions")
v100:AddLabel("- Fixed Some bug issued")
v100:AddLabel("- Fix Auto Sail Boat")
local v101 = v56:AddSection("Tabs", "Weapons Setting", "Select Weapons, Adjust fast attack,skills.etc..", "rbxassetid://10734975692")
spawn(function()
	while true do
		local v102 = task.wait()

		if not v102 then
			local v102, v103, v104 = _u0(_u1.Backpack:GetChildren())

			while true do

				if v105.ToolTip == SelectWeaponFarm then
					SelectWeaponFarm = v105.Name
				end

				for v106, v105 in v102, v103, v104 do
				end

			end

		end
end)
spawn(function()
	while true do
		local v107 = task.wait()

		if not v107 then

			if _u0 == "Above" then
				v107 = CFrame.new(0, _u1, 0)
				local v108 = math.rad(-90)
				local v109 = CFrame.Angles(v108, 0, 0)
				Farm_Mode = v107 * v109
			end

		end

		if _u0 == "Beside" then
			v107 = CFrame.new(0, 2, _u1)
			v109 = CFrame.Angles(0, 0, 0)
			Farm_Mode = v107 * v109
		end

	end

	if _u0 == "Lower" then
	end

	v107 = CFrame.new(_u1, 2, 0)
	v109 = CFrame.Angles(0, 0, 0)
	Farm_Mode = v107 * v109
end

end
end)
spawn(function()
	while true do
		local v110 = task.wait()

		if not v110 then
			v110 = tonumber(_u1)

			if v110 then
			end

			_u0 = 20
		end

	end
end)
v101:AddDropdown("Farm Position", v111, "Above", function(a)
	_u0 = a
	print(a)
end)
v101:AddDropdown("Farm Distance", { "5", "10", "15", "20", "25", "30" }, "20", function(a) _u0 = a end)
v101:AddDropdown("Select Weapon", v112, "Melee", function(a)
	SelectWeaponFarm = a
	print(a)
end)

function getTargets()
	local v113 = game:GetService("Players")
	local v114 = game:GetService("Workspace")
	v114 = v114:FindFirstChild("Enemies")

	if v114 then
		do return {} end
	end

	local v116, v115, v117 = _u0(v114:GetChildren())

	while true do
		local v119 = v118:FindFirstChild("Humanoid")
		local v120 = v118:FindFirstChild("Head")

		if not v119 then

			if 0 < v119.Health then

				if not v120 then

					if (v120.Position - v113.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 70 then
						table.insert(v121, v118.HumanoidRootPart)
					end

				end

			end

		end

		for v122, v118 in v116, v115, v117 do
		end

		return v121
end

function attackEnemies(a)
	local v123 = game:GetService("Players")
	local v124 = game:GetService("ReplicatedStorage")
	local v125 = game:GetService("ReplicatedStorage")
	local v126 = game:GetService("ReplicatedStorage")
	local v127 = game:GetService("ReplicatedStorage")
	local v128 = v123.LocalPlayer.Character:FindFirstChildOfClass("Tool")

	if not a then

		if (a.Position - v123.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 60 then

			if v128.ToolTip ~= "Melee" then

				if v128.ToolTip == "Sword" then
				else

					if RaidAura then
						(v124.Modules.Net["RE/RegisterAttack"]):FireServer(0)
						(v125.Modules.Net["RE/RegisterHit"]):FireServer(a, {})
						(v126.Modules.Net["RE/ReceivedHit"]):FireServer(a, {})
					end

				end

			end

			if v128.ToolTip == "Gun" then

				if RaidAura then
					(v127.Modules.Net["RE/ShootGunEvent"]):FireServer(a.Position, { [1] = a })
				end

			end

		end

	end
end

function FastAttacked()
	local v129 = game:GetService("Players")
	local v130 = game:GetService("Workspace")
	local v131, v130, v132 = _u0(v130.Enemies:GetChildren())

	while true do
		attackEnemies(v133.Head)
		attackEnemies(v133.HumanoidRootPart)

		for v134, v133 in v131, v130, v132 do
		end

		v130 = game:GetService("Workspace")
		local v131, v130, v132 = _u0(v130.SeaBeasts:GetChildren())

		while true do
			local v135 = v133:FindFirstChild("HumanoidRootPart")

			if not v135 then
				attackEnemies(v133.HumanoidRootPart)
			end

			for v134, v133 in v131, v130, v132 do
			end

			v130 = game:GetService("Workspace")
			local v131, v130, v132 = _u0(v130.Characters:GetChildren())

			while true do

				if v133 ~= v129.LocalPlayer.Character then
					attackEnemies(v133.Head)
				end

				for v134, v133 in v131, v130, v132 do
				end
end

function FastShooted()
	local v136 = game:GetService("Players")
	local v137 = game:GetService("ReplicatedStorage")
	local v138 = game:GetService("Workspace")
	local v139, v138, v140 = _u0(v138.Enemies:GetChildren())

	while true do
		local v142 = v141:FindFirstChild("Humanoid")

		if not v142 then
			v142 = v141:FindFirstChild("Humanoid")

			if 0 < v142.Health then
				v142 = v136.LocalPlayer.Character:FindFirstChildOfClass("Tool")

				if (v141.HumanoidRootPart.Position - v136.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 50 then
					local v143 = v136.LocalPlayer.Character:FindFirstChildOfClass("Tool")

					if v143.ToolTip == "Gun" then

						if RaidAura == false then
							(v137.Modules.Net["RE/ShootGunEvent"]):FireServer(v141.HumanoidRootPart.Position, { [1] = v141.HumanoidRootPart })
						end

					end

				end

			end

		end

		for v144, v141 in v139, v138, v140 do
		end
end

FastAttack = true
v101:AddToggle("Fast Attack", FastAttack, function(a) FastAttack = a end)
task.spawn(function()
	while true do
		local v145 = task.wait()

		if not v145 then

			if not FastAttack then
			end

			pcall(function()
				while true do
					task.wait()
					FastAttacked()
					CameraShakerR:Stop()

					if FastAttack then
					end
			end)
		end

	end
end)
v101:AddToggle("Fast Shot Gun", FastShot, function(a) FastShot = a end)
spawn(function()
	while true do
		local v146 = task.wait()

		if not v146 then

			if not FastShot then
			end

			pcall(function()
				local v147 = game:GetService("Players")
				local v148 = require(game.ReplicatedStorage.Util.CameraShaker)

				while true do
					task.wait()
					FastShooted()
					v148:Stop()

					if FastShot then
					end
			end)
		end

	end
end)

function AttackToPlayers()
	local v149 = game:GetService("Players")
	local v150 = game:GetService("ReplicatedStorage")
	local v151 = game:GetService("ReplicatedStorage")
	local v153, v152, v154 = _u0(game.Players:GetChildren())

	while true do
		local v156 = v155.Character:FindFirstChild("Humanoid")

		if not v156 then
			v156 = v155.Character:FindFirstChild("Humanoid")

			if 0 < v156.Health then

				if (v155.Character.HumanoidRootPart.Position - v149.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 50 then
					v156 = v149.LocalPlayer.Character:FindFirstChildOfClass("Tool")

					if v156.ToolTip ~= "Melee" then

						if v156.ToolTip == "Sword" then
						else
							(v150.Modules.Net["RE/RegisterAttack"]):FireServer(0.1)
							(v151.Modules.Net["RE/RegisterHit"]):FireServer(v155.Character.Head, {})
						end

					end

				end

			end

		end

		for v157, v155 in v153, v152, v154 do
		end
end

v101:AddToggle("Attack Player (Disturb Farming)", AttackToPlayersNow, function(a) AttackToPlayersNow = a end)
spawn(function()
	while true do
		local v158 = task.wait()

		if not v158 then

			if not AttackToPlayersNow then
			end

			v158 = require(game.ReplicatedStorage.Util.CameraShaker)
			v158:Stop()
			pcall(function()
				while true do
					task.wait()
					AttackToPlayers()

					if AttackToPlayersNow then
					end
			end)
		end

	end
end)

function InstancePos(a)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = a
end

function TP3(a)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = a
end

spawn(function()
	local v159 = game:GetService("RunService")
	v159.RenderStepped:Connect(function()
		if _G.AutoClick then

			if not Fastattack then
			else
				pcall(function()
					local v160 = game:GetService("VirtualUser")
					v160:CaptureController()
					v160 = game:GetService("VirtualUser")
					v160:Button1Down(v160)
				end)
			end

		end
	end)
end)
task.spawn(function()
	while true do
		local v162 = wait()

		if not v162 then
			pcall(function()
				if _G.SelectWeaponFarm == "Melee" then
					local v164, v163, v165 = _u0(game.Players.LocalPlayer.Backpack:GetChildren())

					while true do

						if v166.ToolTip == "Melee" then
							local v168 = game.Players.LocalPlayer.Backpack:FindFirstChild(game.Players.LocalPlayer.Backpack)

							if not v168 then
								_G.SelectWeapon = v166.Name
							end

						end

						for v169, v166 in v164, v163, v165 do
						end

					else

						if _G.SelectWeaponFarm == "Sword" then
							local v164, v163, v165 = _u0(game.Players.LocalPlayer.Backpack:GetChildren())

							while true do

								if v166.ToolTip == "Sword" then
									v168 = game.Players.LocalPlayer.Backpack:FindFirstChild(game.Players.LocalPlayer.Backpack)

									if not v168 then
										_G.SelectWeapon = v166.Name
									end

								end

								for v169, v166 in v164, v163, v165 do
								end

							else

								if _G.SelectWeaponFarm == "Blox Fruit" then
									local v164, v163, v165 = _u0(game.Players.LocalPlayer.Backpack:GetChildren())

									while true do

										if v166.ToolTip == "Blox Fruit" then
											v168 = game.Players.LocalPlayer.Backpack:FindFirstChild(game.Players.LocalPlayer.Backpack)

											if not v168 then
												_G.SelectWeapon = v166.Name
											end

										end

										for v169, v166 in v164, v163, v165 do
										end

									end

								end

							end
			end)
		end

	end
end)

function BringMonster(a, b)
	local v170 = game:GetService("Workspace")
	local v171, v170, v172 = _u0(v170.Enemies:GetChildren())

	while true do

		if v173.Name == a then
			local v174 = v173:FindFirstChild("Humanoid")

			if not v174 then

				if 0 < v173.Humanoid.Health then
					local v175 = _u1()
					v175 = tonumber(bringfrec)

					if (v173.HumanoidRootPart.Position - v175.Position).Magnitude < v175 then
						v173.HumanoidRootPart.CFrame = b
						v173.HumanoidRootPart.CanCollide = false
						v175 = Vector3.new(60, 60, 60)
						v173.HumanoidRootPart.Size = v175
						v173.HumanoidRootPart.Transparency = 1
						v174 = v173.Humanoid:FindFirstChild("Animator")

						if not v174 then
							v173.Humanoid.Animator:Destroy()
						end

						sethiddenproperty(_u2, "SimulationRadius", math.huge)
					end

				end

			end

		end

		for v176, v173 in v171, v170, v172 do
		end
end

bringfrec = 250
v101:AddToggle("Bring Mob", true, function(a) _u0 = a end)
spawn(function()
	while true do
		local v177 = task.wait()

		if not v177 then

			if not _u0 then

				if LevelFarmQuest then

					if not LevelFarmNoQuest then
					else
						pcall(function() BringMonster(Level_Farm_Name, Level_Farm_CFrame) end)
					end

				end

			end

		end

		if not _u0 then

			if not Farm_Bone then
				pcall(function() BringMonster(Bone_Farm_Name, Bone_Farm_CFrame) end)
			end

		end

	end

	if not _u0 then

		if not Farm_Ectoplasm then
			pcall(function() BringMonster(Ecto_Farm_Name, Ecto_Farm_CFrame) end)
		end

	end

end

if not _u0 then

	if not _G.AutoPirateRaid then
		pcall(function() BringMonster(piratename, pirateframe) end)
	end

end

end

if not _u0 then

	if not Nearest_Farm then
		pcall(function() BringMonster(Nearest_Farm_Name, Nearest_Farm_CFrame) end)
	end

end

end

if not _u0 then

	if SelectMonster_Quest_Farm then

		if not SelectMonster_NoQuest_Farm then
		else
			pcall(function() BringMonster(SelectMonster_Farm_Name, SelectMonster_Farm_CFrame) end)
		end

	end

end

end

if not _u0 then

	if not Auto_Farm_Material then
		pcall(function() BringMonster(Material_Farm_Name, Material_Farm_CFrame) end)
	end

end

end

if not _u0 then

	if GunMastery_Farm then

		if not DevilMastery_Farm then
		else
			pcall(function() BringMonster(Mastery_Farm_Name, Mastery_Farm_CFrame) end)
		end

	end

end

end

if not _u0 then

	if not AutoRengoku then
		pcall(function() BringMonster(Rengoku_Farm_Name, Rengoku_Farm_CFrame) end)
	end

end

end

if not _u0 then

	if not AutoCakePrince then
		pcall(function() BringMonster(CakePrince_Farm_Name, CakePrince_Farm_CFrame) end)
	end

end

end

if not _u0 then

	if not _G.AutoDoughKing then
		pcall(function() BringMonster(DoughKing_Farm_Name, DoughKing_Farm_CFrame) end)
	end

end

end

if not _u0 then

	if not AutoCitizen then
		pcall(function() BringMonster(Citizen_Farm_Name, Citizen_Farm_CFrame) end)
	end

end

end

if not _u0 then

	if not AutoEvoRace then
		pcall(function() BringMonster(EvoV2_Farm_Name, EvoV2_Farm_CFrame) end)
	end

end

end

if not _u0 then

	if not AutoBartilo then
		pcall(function() BringMonster(Bartilo_Farm_Name, Bartilo_Farm_CFrame) end)
	end

end

end

if not _u0 then

	if not AutoSoulGuitar then
		pcall(function() BringMonster(SoulGuitar_Farm_Name, SoulGuitar_Farm_CFrame) end)
	end

end

end

if not _u0 then
end

if not AutoMusketeer then
end

pcall(function() BringMonster(Musketere_Farm_Name, Musketere_Farm_CFrame) end)
end

end
end)
v101:AddToggle("Bypass Teleport", true, function(a) _u0 = a end)
v101:AddToggle("Set Spawn Point", true, function(a) _u0 = a end)
spawn(function()
	while true do
		local v178 = task.wait()

		if not v178 then

			if not _u0 then
			end

			_u1.Remotes.CommF_:InvokeServer("SetSpawnPoint")
		end

	end
end)
local v179 = v56:AddSection("", "Mob Misc", "remove animation,hides ui", "rbxassetid://10723396107")
v179:AddToggle("Buso Haki", true, function(a) _u0 = a end)
spawn(function()
	while true do
		local v180 = task.wait()

		if not v180 then

			if not _u0 then
			end

			v180 = _u1()
			v180 = v180:FindFirstChild("HasBuso")

			if v180 then
			end

			_u2.Remotes.CommF_:InvokeServer("Buso")
		end

	end
end)
v179:AddToggle("Disable Audio Effect", DeleteAudioEffect, function(a) DeleteAudioEffect = a end)
spawn(function()
	while true do
		local v181 = task.wait()

		if not v181 then

			if not DeleteAudioEffect then
			end

			local v182 = game:GetService("Workspace")
			local v181, v182, v183 = _u0(v182._WorldOrigin:GetChildren())

			while true do

				if v184.Name == "Sounds" then
					local v186, v185, v187 = _u0(v184:GetChildren())

					while true do
						local v189 = v188:IsA("Part")

						if not v189 then
							v188:Destroy()
						end

						for v190, v188 in v186, v185, v187 do
						end

					end

					if v184.Name ~= "CurvedRing" then

						if v184.Name ~= "SlashHit" then

							if v184.Name ~= "SwordSlash" then

								if v184.Name == "SlashTail" then
								else
								else
								else
									v184:Destroy()
								end

							end

						end

					end

					for v191, v184 in v181, v182, v183 do
					end

				end

			end
end)
v179:AddToggle("Hide Notification", HideNotification, function(a) HideNotification = a end)
spawn(function()
	while true do
		local v192 = task.wait()

		if not v192 then

			if not HideNotification then
				_u0.PlayerGui.Notifications.Enabled = false
			end

		end

		_u0.PlayerGui.Notifications.Enabled = true
	end

end
end)
v179:AddToggle("Hide Text Damage", _G.KobenHeegeen, function(a) _G.KobenHeegeen = a end)
spawn(function()
	while true do
		local v193 = wait()

		if not v193 then

			if not _G.KobenHeegeen then
				v193 = game:GetService("ReplicatedStorage")
				v193.Assets.GUI.DamageCounter.Enabled = false
			end

		end

		v193 = game:GetService("ReplicatedStorage")
		v193.Assets.GUI.DamageCounter.Enabled = true
	end

end
end)
v179:AddToggle("Destroy Effect Animation", false, function()
	_u0.Assets.Models:Destroy()
	_u0.Assets.GUI:Destroy()
	_u0.Assets.SlashHit:Destroy()
	local v195, v194, v196 = _u1(_u0.Effect.Container.Death:GetChildren())

	while true do
		v197:Destroy()

		for v198, v197 in v195, v194, v196 do
		end

		local v195, v194, v196 = _u1(_u0.Effect.Container.Respawn:GetChildren())

		while true do
			v197:Destroy()

			for v198, v197 in v195, v194, v196 do
			end
end)
v179:AddToggle("Black Screen", false, function(a)
	_G.StartBlackScreen = a
	print(a)
end)
spawn(function()
	while true do
		local v199 = wait()

		if not v199 then

			if not _G.StartBlackScreen then
				v199 = game:GetService("Players")
				local v200 = UDim2.new(500, 0, 500, 500)
				v199.LocalPlayer.PlayerGui.Main.Blackscreen.Size = v200
			end

		end

		v199 = game:GetService("Players")
		v200 = UDim2.new(1, 0, 500, 500)
		v199.LocalPlayer.PlayerGui.Main.Blackscreen.Size = v200
	end

end
end)

if _G.WhiteScreen == true then
	local v201 = game:GetService("RunService")
	v201:Set3dRenderingEnabled(false)
else

	if _G.WhiteScreen == false then
		v201 = game:GetService("RunService")
		v201:Set3dRenderingEnabled(true)
	end

end

v201 = v56:AddSection("", "Skill Seetings", "auto use skill z,x.c.v", "rbxassetid://10709770431")
_G.SkillZ = true
v201:AddToggle("Use Skill Z", _G.SkillZ, function(a) _G.SkillZ = a end)
_G.SkillX = true
v201:AddToggle("Use Skill X", _G.SkillX, function(a) _G.SkillX = a end)
_G.SkillC = true
v201:AddToggle("Use Skill C", _G.SkillC, function(a) _G.SkillC = a end)
_G.SkillV = true
v201:AddToggle("Use Skill V", _G.SkillV, function(a) _G.SkillV = a end)
_G.SkillF = true
v201:AddToggle("Use Skill F", _G.SkillF, function(a) _G.SkillF = a end)
local v202 = v32.LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam")

if not v202 then

	while true do
		task.wait()
		v202 = v32.LocalPlayer.PlayerGui:WaitForChild("Main")

		if v202.ChooseTeam.Visible == true then

			if _G.Team == "Pirate" then
				local v202, v203, v204 = pairs(getconnections(v32.LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Activated))

				while true do
					(function(a) _G.SkillF = a end).Function()

					for v205, v206 in v202, v203, v204 do
					end

				else

					if _G.Team == "Marine" then
						local v202, v203, v204 = pairs(getconnections(v32.LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Activated))

						while true do
							(function(a) _G.SkillF = a end).Function()

							for v205, v206 in v202, v203, v204 do
							end

						else
							local v202, v203, v204 = pairs(getconnections(v32.LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Activated))

							while true do
								(function(a) _G.SkillF = a end).Function()

								for v205, v206 in v202, v203, v204 do
								end

							end

						end

					end

					if v32.LocalPlayer.Team ~= nil then
					end

					v202 = game:IsLoaded()

					if not v202 then
					end

				end

				First_Sea = false
				Second_Sea = false
				Third_Sea = false

				if game.PlaceId == 2753915549 then
					First_Sea = true
				else

					if game.PlaceId == 4442272183 then
						Second_Sea = true
					else

						if game.PlaceId == 7449423635 then
							Third_Sea = true
						end

					end

				end

				function CheckLevel()
					local v207 = game:GetService("Players")

					if not First_Sea then

						if v207.LocalPlayer.Data.Level.Value ~= 1 then

							if v207.LocalPlayer.Data.Level.Value > 9 then

								if _G.SelectMonster == "Bandit [Lv. 5]" then
								else
								else
									Ms = "Bandit"
									NameQuest = "BanditQuest1"
									QuestLv = 1
									NameMon = "Bandit"
									local v208 = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875)
									CFrameQ = v208
									v208 = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)
									CFrameMon = v208
								end

							end

						else

							if v207.LocalPlayer.Data.Level.Value ~= 10 then

								if v207.LocalPlayer.Data.Level.Value > 14 then

									if _G.SelectMonster == "Monkey [Lv. 14]" then
									else
									else
										Ms = "Monkey"
										NameQuest = "JungleQuest"
										QuestLv = 1
										NameMon = "Monkey"
										v208 = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
										CFrameQ = v208
										v208 = CFrame.new(-1448.1446533203, 50.851993560791, 63.60718536377)
										CFrameMon = v208
									end

								end

							else

								if v207.LocalPlayer.Data.Level.Value ~= 15 then

									if v207.LocalPlayer.Data.Level.Value > 29 then

										if _G.SelectMonster == "Gorilla [Lv. 20]" then
										else
										else
											Ms = "Gorilla"
											NameQuest = "JungleQuest"
											QuestLv = 2
											NameMon = "Gorilla"
											v208 = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
											CFrameQ = v208
											v208 = CFrame.new(-1142.6488037109, 40.462348937988, -515.39227294922)
											CFrameMon = v208
										end

									end

								else

									if v207.LocalPlayer.Data.Level.Value ~= 30 then

										if v207.LocalPlayer.Data.Level.Value > 39 then

											if _G.SelectMonster == "Pirate [Lv. 35]" then
											else
											else
												Ms = "Pirate"
												NameQuest = "BuggyQuest1"
												QuestLv = 1
												NameMon = "Pirate"
												v208 = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
												CFrameQ = v208
												v208 = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875)
												CFrameMon = v208
											end

										end

									else

										if v207.LocalPlayer.Data.Level.Value ~= 40 then

											if v207.LocalPlayer.Data.Level.Value > 59 then

												if _G.SelectMonster == "Brute [Lv. 45]" then
												else
												else
													Ms = "Brute"
													NameQuest = "BuggyQuest1"
													QuestLv = 2
													NameMon = "Brute"
													v208 = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
													CFrameQ = v208
													v208 = CFrame.new(-1387.5324707031, 24.592035293579, 4100.9575195313)
													CFrameMon = v208
												end

											end

										else

											if v207.LocalPlayer.Data.Level.Value ~= 60 then

												if v207.LocalPlayer.Data.Level.Value > 74 then

													if _G.SelectMonster == "Desert Bandit [Lv. 60]" then
													else
													else
														Ms = "Desert Bandit"
														NameQuest = "DesertQuest"
														QuestLv = 1
														NameMon = "Desert Bandit"
														v208 = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
														CFrameQ = v208
														v208 = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)
														CFrameMon = v208
													end

												end

											else

												if v207.LocalPlayer.Data.Level.Value ~= 75 then

													if v207.LocalPlayer.Data.Level.Value > 89 then

														if _G.SelectMonster == "Desert Officer [Lv. 70]" then
														else
														else
															Ms = "Desert Officer"
															NameQuest = "DesertQuest"
															QuestLv = 2
															NameMon = "Desert Officer"
															v208 = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
															CFrameQ = v208
															v208 = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)
															CFrameMon = v208
														end

													end

												else

													if v207.LocalPlayer.Data.Level.Value ~= 90 then

														if v207.LocalPlayer.Data.Level.Value > 99 then

															if _G.SelectMonster == "Snow Bandit [Lv. 90]" then
															else
															else
																Ms = "Snow Bandit"
																NameQuest = "SnowQuest"
																QuestLv = 1
																NameMon = "Snow Bandit"
																v208 = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
																CFrameQ = v208
																v208 = CFrame.new(1356.3028564453, 105.76865386963, -1328.2418212891)
																CFrameMon = v208
															end

														end

													else

														if v207.LocalPlayer.Data.Level.Value ~= 100 then

															if v207.LocalPlayer.Data.Level.Value > 119 then

																if _G.SelectMonster == "Snowman [Lv. 100]" then
																else
																else
																	Ms = "Snowman"
																	NameQuest = "SnowQuest"
																	QuestLv = 2
																	NameMon = "Snowman"
																	v208 = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
																	CFrameQ = v208
																	v208 = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
																	CFrameMon = v208
																end

															end

														else

															if v207.LocalPlayer.Data.Level.Value ~= 120 then

																if v207.LocalPlayer.Data.Level.Value > 149 then

																	if _G.SelectMonster == "Chief Petty Officer [Lv. 120]" then
																	else
																	else
																		Ms = "Chief Petty Officer"
																		NameQuest = "MarineQuest2"
																		QuestLv = 1
																		NameMon = "Chief Petty Officer"
																		v208 = CFrame.new(-5035.49609375, 28.677835464478, 4324.1840820313)
																		CFrameQ = v208
																		v208 = CFrame.new(-4931.1552734375, 65.793113708496, 4121.8393554688)
																		CFrameMon = v208
																	end

																end

															else

																if v207.LocalPlayer.Data.Level.Value ~= 150 then

																	if v207.LocalPlayer.Data.Level.Value > 174 then

																		if _G.SelectMonster == "Sky Bandit [Lv. 150]" then
																		else
																		else
																			Ms = "Sky Bandit"
																			NameQuest = "SkyQuest"
																			QuestLv = 1
																			NameMon = "Sky Bandit"
																			v208 = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
																			CFrameQ = v208
																			v208 = CFrame.new(-4955.6411132813, 365.46365356445, -2908.1865234375)
																			CFrameMon = v208
																		end

																	end

																else

																	if v207.LocalPlayer.Data.Level.Value ~= 175 then

																		if v207.LocalPlayer.Data.Level.Value > 189 then

																			if _G.SelectMonster == "Dark Master [Lv. 175]" then
																			else
																			else
																				Ms = "Dark Master"
																				NameQuest = "SkyQuest"
																				QuestLv = 2
																				NameMon = "Dark Master"
																				v208 = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
																				CFrameQ = v208
																				v208 = CFrame.new(-5148.1650390625, 439.04571533203, -2332.9611816406)
																				CFrameMon = v208
																			end

																		end

																	else

																		if v207.LocalPlayer.Data.Level.Value ~= 190 then

																			if v207.LocalPlayer.Data.Level.Value > 209 then

																				if _G.SelectMonster == "Prisoner [Lv. 190]" then
																				else
																				else
																					Ms = "Prisoner"
																					NameQuest = "PrisonerQuest"
																					QuestLv = 1
																					NameMon = "Prisoner"
																					v208 = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
																					CFrameQ = v208
																					v208 = CFrame.new(4937.31885, 0.332031399, 649.574524, 0.694649816, 0, -0.719348073, 0, 1, 0, 0.719348073, 0, 0.694649816)
																					CFrameMon = v208
																				end

																			end

																		else

																			if v207.LocalPlayer.Data.Level.Value ~= 210 then

																				if v207.LocalPlayer.Data.Level.Value > 249 then

																					if _G.SelectMonster == "Dangerous Prisoner [Lv. 210]" then
																					else
																					else
																						Ms = "Dangerous Prisoner"
																						NameQuest = "PrisonerQuest"
																						QuestLv = 2
																						NameMon = "Dangerous Prisoner"
																						v208 = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
																						CFrameQ = v208
																						v208 = CFrame.new(5099.6626, 0.351562679, 1055.7583, 0.898906827, 0, -0.438139856, 0, 1, 0, 0.438139856, 0, 0.898906827)
																						CFrameMon = v208
																					end

																				end

																			else

																				if v207.LocalPlayer.Data.Level.Value ~= 250 then

																					if v207.LocalPlayer.Data.Level.Value > 274 then

																						if _G.SelectMonster == "Toga Warrior [Lv. 250]" then
																						else
																						else
																							Ms = "Toga Warrior"
																							NameQuest = "ColosseumQuest"
																							QuestLv = 1
																							NameMon = "Toga Warrior"
																							v208 = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
																							CFrameQ = v208
																							v208 = CFrame.new(-1872.5166015625, 49.080215454102, -2913.810546875)
																							CFrameMon = v208
																						end

																					end

																				else

																					if v207.LocalPlayer.Data.Level.Value ~= 275 then

																						if v207.LocalPlayer.Data.Level.Value > 299 then

																							if _G.SelectMonster == "Gladiator [Lv. 275]" then
																							else
																							else
																								Ms = "Gladiator"
																								NameQuest = "ColosseumQuest"
																								QuestLv = 2
																								NameMon = "Gladiator"
																								v208 = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
																								CFrameQ = v208
																								v208 = CFrame.new(-1521.3740234375, 81.203170776367, -3066.3139648438)
																								CFrameMon = v208
																							end

																						end

																					else

																						if v207.LocalPlayer.Data.Level.Value ~= 300 then

																							if v207.LocalPlayer.Data.Level.Value > 324 then

																								if _G.SelectMonster == "Military Soldier [Lv. 300]" then
																								else
																								else
																									Ms = "Military Soldier"
																									NameQuest = "MagmaQuest"
																									QuestLv = 1
																									NameMon = "Military Soldier"
																									v208 = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
																									CFrameQ = v208
																									v208 = CFrame.new(-5369.0004882813, 61.24352645874, 8556.4921875)
																									CFrameMon = v208
																								end

																							end

																						else

																							if v207.LocalPlayer.Data.Level.Value ~= 325 then

																								if v207.LocalPlayer.Data.Level.Value > 374 then

																									if _G.SelectMonster == "Military Spy [Lv. 325]" then
																									else
																									else
																										Ms = "Military Spy"
																										NameQuest = "MagmaQuest"
																										QuestLv = 2
																										NameMon = "Military Spy"
																										v208 = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
																										CFrameQ = v208
																										v208 = CFrame.new(-5787.00293, 75.8262634, 8651.69922, 0.838590562, 0, -0.544762194, 0, 1, 0, 0.544762194, 0, 0.838590562)
																										CFrameMon = v208
																									end

																								end

																							else

																								if v207.LocalPlayer.Data.Level.Value ~= 375 then

																									if v207.LocalPlayer.Data.Level.Value > 399 then

																										if _G.SelectMonster == "Fishman Warrior [Lv. 375]" then
																										else
																										else
																											Ms = "Fishman Warrior"
																											NameQuest = "FishmanQuest"
																											QuestLv = 1
																											NameMon = "Fishman Warrior"
																											v208 = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
																											CFrameQ = v208
																											v208 = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)
																											CFrameMon = v208

																											if LevelFarmQuest then

																												if LevelFarmNoQuest then

																													if SelectMonster_Quest_Farm then

																														if SelectMonster_NoQuest_Farm then

																															if not DevilMastery_Farm then
																															else
																															else
																															else
																															else

																																if 3000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
																																	v208 = game:GetService("ReplicatedStorage")
																																	v208.Remotes.CommF_:InvokeServer(v208.Remotes.CommF_)
																																end

																															end

																														else

																															if v207.LocalPlayer.Data.Level.Value ~= 400 then

																																if v207.LocalPlayer.Data.Level.Value > 449 then

																																	if _G.SelectMonster == "Fishman Commando [Lv. 400]" then
																																	else
																																	else
																																		Ms = "Fishman Commando"
																																		NameQuest = "FishmanQuest"
																																		QuestLv = 2
																																		NameMon = "Fishman Commando"
																																		v208 = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
																																		CFrameQ = v208
																																		v208 = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
																																		CFrameMon = v208

																																		if LevelFarmQuest then

																																			if LevelFarmNoQuest then

																																				if SelectMonster_Quest_Farm then

																																					if SelectMonster_NoQuest_Farm then

																																						if not DevilMastery_Farm then
																																						else
																																						else
																																						else
																																						else

																																							if 3000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
																																								v208 = game:GetService("ReplicatedStorage")
																																								v208.Remotes.CommF_:InvokeServer(v208.Remotes.CommF_)
																																							end

																																						end

																																					else

																																						if v207.LocalPlayer.Data.Level.Value ~= 450 then

																																							if v207.LocalPlayer.Data.Level.Value > 474 then

																																								if _G.SelectMonster == "God's Guard [Lv. 450]" then
																																								else
																																								else
																																									Ms = "God's Guard"
																																									NameQuest = "SkyExp1Quest"
																																									QuestLv = 1
																																									NameMon = "God's Guard"
																																									v208 = CFrame.new(-4721.8603515625, 845.30297851563, -1953.8489990234)
																																									CFrameQ = v208
																																									v208 = CFrame.new(-4628.0498046875, 866.92877197266, -1931.2352294922)
																																									CFrameMon = v208

																																									if LevelFarmQuest then

																																										if LevelFarmNoQuest then

																																											if SelectMonster_Quest_Farm then

																																												if SelectMonster_NoQuest_Farm then

																																													if not DevilMastery_Farm then
																																													else
																																													else
																																													else
																																													else

																																														if 3000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
																																															v208 = game:GetService("ReplicatedStorage")
																																															v208.Remotes.CommF_:InvokeServer(v208.Remotes.CommF_)
																																														end

																																													end

																																												else

																																													if v207.LocalPlayer.Data.Level.Value ~= 475 then

																																														if v207.LocalPlayer.Data.Level.Value > 524 then

																																															if _G.SelectMonster == "Shanda [Lv. 475]" then
																																															else
																																															else
																																																Ms = "Shanda"
																																																NameQuest = "SkyExp1Quest"
																																																QuestLv = 2
																																																NameMon = "Shanda"
																																																v208 = CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703)
																																																CFrameQ = v208
																																																v208 = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)
																																																CFrameMon = v208

																																																if LevelFarmQuest then

																																																	if LevelFarmNoQuest then

																																																		if SelectMonster_Quest_Farm then

																																																			if SelectMonster_NoQuest_Farm then

																																																				if not DevilMastery_Farm then
																																																				else
																																																				else
																																																				else
																																																				else

																																																					if 3000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
																																																						v208 = game:GetService("ReplicatedStorage")
																																																						v208.Remotes.CommF_:InvokeServer(v208.Remotes.CommF_)
																																																					end

																																																				end

																																																			else

																																																				if v207.LocalPlayer.Data.Level.Value ~= 525 then

																																																					if v207.LocalPlayer.Data.Level.Value > 549 then

																																																						if _G.SelectMonster == "Royal Squad [Lv. 525]" then
																																																						else
																																																						else
																																																							Ms = "Royal Squad"
																																																							NameQuest = "SkyExp2Quest"
																																																							QuestLv = 1
																																																							NameMon = "Royal Squad"
																																																							v208 = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
																																																							CFrameQ = v208
																																																							v208 = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)
																																																							CFrameMon = v208
																																																						end

																																																					end

																																																				else

																																																					if v207.LocalPlayer.Data.Level.Value ~= 550 then

																																																						if v207.LocalPlayer.Data.Level.Value > 624 then

																																																							if _G.SelectMonster == "Royal Soldier [Lv. 550]" then
																																																							else
																																																							else
																																																								Ms = "Royal Soldier"
																																																								NameQuest = "SkyExp2Quest"
																																																								QuestLv = 2
																																																								NameMon = "Royal Soldier"
																																																								v208 = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
																																																								CFrameQ = v208
																																																								v208 = CFrame.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)
																																																								CFrameMon = v208
																																																							end

																																																						end

																																																					else

																																																						if v207.LocalPlayer.Data.Level.Value ~= 625 then

																																																							if v207.LocalPlayer.Data.Level.Value > 649 then

																																																								if _G.SelectMonster == "Galley Pirate [Lv. 625]" then
																																																								else
																																																								else
																																																									Ms = "Galley Pirate"
																																																									NameQuest = "FountainQuest"
																																																									QuestLv = 1
																																																									NameMon = "Galley Pirate"
																																																									v208 = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
																																																									CFrameQ = v208
																																																									v208 = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)
																																																									CFrameMon = v208
																																																								end

																																																							end

																																																						else

																																																							if 650 > v207.LocalPlayer.Data.Level.Value then

																																																								if _G.SelectMonster == "Galley Captain [Lv. 650]" then
																																																								else
																																																									Ms = "Galley Captain"
																																																									NameQuest = "FountainQuest"
																																																									QuestLv = 2
																																																									NameMon = "Galley Captain"
																																																									v208 = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
																																																									CFrameQ = v208
																																																									v208 = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
																																																									CFrameMon = v208
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

					if not Second_Sea then

						if v207.LocalPlayer.Data.Level.Value ~= 700 then

							if v207.LocalPlayer.Data.Level.Value > 724 then

								if _G.SelectMonster == "Raider [Lv. 700]" then
								else
								else
									Ms = "Raider"
									NameQuest = "Area1Quest"
									QuestLv = 1
									NameMon = "Raider"
									v208 = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
									CFrameQ = v208
									v208 = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688)
									CFrameMon = v208
								end

							end

						else

							if v207.LocalPlayer.Data.Level.Value ~= 725 then

								if v207.LocalPlayer.Data.Level.Value > 774 then

									if _G.SelectMonster == "Mercenary [Lv. 725]" then
									else
									else
										Ms = "Mercenary"
										NameQuest = "Area1Quest"
										QuestLv = 2
										NameMon = "Mercenary"
										v208 = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
										CFrameQ = v208
										v208 = CFrame.new(-864.85009765625, 122.47104644775, 1453.1505126953)
										CFrameMon = v208
									end

								end

							else

								if v207.LocalPlayer.Data.Level.Value ~= 775 then

									if v207.LocalPlayer.Data.Level.Value > 799 then

										if _G.SelectMonster == "Swan Pirate [Lv. 775]" then
										else
										else
											Ms = "Swan Pirate"
											NameQuest = "Area2Quest"
											QuestLv = 1
											NameMon = "Swan Pirate"
											v208 = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
											CFrameQ = v208
											v208 = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125)
											CFrameMon = v208
										end

									end

								else

									if v207.LocalPlayer.Data.Level.Value ~= 800 then

										if v207.LocalPlayer.Data.Level.Value > 874 then

											if _G.SelectMonster == "Factory Staff [Lv. 800]" then
											else
											else
												Ms = "Factory Staff"
												NameQuest = "Area2Quest"
												QuestLv = 2
												NameMon = "Factory Staff"
												v208 = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
												CFrameQ = v208
												v208 = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797)
												CFrameMon = v208
											end

										end

									else

										if v207.LocalPlayer.Data.Level.Value ~= 875 then

											if v207.LocalPlayer.Data.Level.Value > 899 then

												if _G.SelectMonster == "Marine Lieutenant [Lv. 875]" then
												else
												else
													Ms = "Marine Lieutenant"
													NameQuest = "MarineQuest3"
													QuestLv = 1
													NameMon = "Marine Lieutenant"
													v208 = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
													CFrameQ = v208
													v208 = CFrame.new(-2489.2622070313, 84.613594055176, -3151.8830566406)
													CFrameMon = v208
												end

											end

										else

											if v207.LocalPlayer.Data.Level.Value ~= 900 then

												if v207.LocalPlayer.Data.Level.Value > 949 then

													if _G.SelectMonster == "Marine Captain [Lv. 900]" then
													else
													else
														Ms = "Marine Captain"
														NameQuest = "MarineQuest3"
														QuestLv = 2
														NameMon = "Marine Captain"
														v208 = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
														CFrameQ = v208
														v208 = CFrame.new(-2335.2026367188, 79.786659240723, -3245.8674316406)
														CFrameMon = v208
													end

												end

											else

												if v207.LocalPlayer.Data.Level.Value ~= 950 then

													if v207.LocalPlayer.Data.Level.Value > 974 then

														if _G.SelectMonster == "Zombie [Lv. 950]" then
														else
														else
															Ms = "Zombie"
															NameQuest = "ZombieQuest"
															QuestLv = 1
															NameMon = "Zombie"
															v208 = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
															CFrameQ = v208
															v208 = CFrame.new(-5536.4970703125, 101.08577728271, -835.59075927734)
															CFrameMon = v208
														end

													end

												else

													if v207.LocalPlayer.Data.Level.Value ~= 975 then

														if v207.LocalPlayer.Data.Level.Value > 999 then

															if _G.SelectMonster == "Vampire [Lv. 975]" then
															else
															else
																Ms = "Vampire"
																NameQuest = "ZombieQuest"
																QuestLv = 2
																NameMon = "Vampire"
																v208 = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
																CFrameQ = v208
																v208 = CFrame.new(-5806.1098632813, 16.722528457642, -1164.4384765625)
																CFrameMon = v208
															end

														end

													else

														if v207.LocalPlayer.Data.Level.Value ~= 1000 then

															if v207.LocalPlayer.Data.Level.Value > 1049 then

																if _G.SelectMonster == "Snow Trooper [Lv. 1000]" then
																else
																else
																	Ms = "Snow Trooper"
																	NameQuest = "SnowMountainQuest"
																	QuestLv = 1
																	NameMon = "Snow Trooper"
																	v208 = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
																	CFrameQ = v208
																	v208 = CFrame.new(535.21051025391, 432.74209594727, -5484.9165039063)
																	CFrameMon = v208
																end

															end

														else

															if v207.LocalPlayer.Data.Level.Value ~= 1050 then

																if v207.LocalPlayer.Data.Level.Value > 1099 then

																	if _G.SelectMonster == "Winter Warrior [Lv. 1050]" then
																	else
																	else
																		Ms = "Winter Warrior"
																		NameQuest = "SnowMountainQuest"
																		QuestLv = 2
																		NameMon = "Winter Warrior"
																		v208 = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
																		CFrameQ = v208
																		v208 = CFrame.new(1234.4449462891, 456.95419311523, -5174.130859375)
																		CFrameMon = v208
																	end

																end

															else

																if v207.LocalPlayer.Data.Level.Value ~= 1100 then

																	if v207.LocalPlayer.Data.Level.Value > 1124 then

																		if _G.SelectMonster == "Lab Subordinate [Lv. 1100]" then
																		else
																		else
																			Ms = "Lab Subordinate"
																			NameQuest = "IceSideQuest"
																			QuestLv = 1
																			NameMon = "Lab Subordinate"
																			v208 = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
																			CFrameQ = v208
																			v208 = CFrame.new(-5720.5576171875, 63.309471130371, -4784.6103515625)
																			CFrameMon = v208
																		end

																	end

																else

																	if v207.LocalPlayer.Data.Level.Value ~= 1125 then

																		if v207.LocalPlayer.Data.Level.Value > 1174 then

																			if _G.SelectMonster == "Horned Warrior [Lv. 1125]" then
																			else
																			else
																				Ms = "Horned Warrior"
																				NameQuest = "IceSideQuest"
																				QuestLv = 2
																				NameMon = "Horned Warrior"
																				v208 = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
																				CFrameQ = v208
																				v208 = CFrame.new(-6292.751953125, 91.181983947754, -5502.6499023438)
																				CFrameMon = v208
																			end

																		end

																	else

																		if v207.LocalPlayer.Data.Level.Value ~= 1175 then

																			if v207.LocalPlayer.Data.Level.Value > 1199 then

																				if _G.SelectMonster == "Magma Ninja [Lv. 1175]" then
																				else
																				else
																					Ms = "Magma Ninja"
																					NameQuest = "FireSideQuest"
																					QuestLv = 1
																					NameMon = "Magma Ninja"
																					v208 = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
																					CFrameQ = v208
																					v208 = CFrame.new(-5461.8388671875, 130.36347961426, -5836.4702148438)
																					CFrameMon = v208
																				end

																			end

																		else

																			if v207.LocalPlayer.Data.Level.Value ~= 1200 then

																				if v207.LocalPlayer.Data.Level.Value > 1249 then

																					if _G.SelectMonster == "Lava Pirate [Lv. 1200]" then
																					else
																					else
																						Ms = "Lava Pirate"
																						NameQuest = "FireSideQuest"
																						QuestLv = 2
																						NameMon = "Lava Pirate"
																						v208 = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
																						CFrameQ = v208
																						v208 = CFrame.new(-5251.1889648438, 55.164535522461, -4774.4096679688)
																						CFrameMon = v208
																					end

																				end

																			else

																				if v207.LocalPlayer.Data.Level.Value ~= 1250 then

																					if v207.LocalPlayer.Data.Level.Value > 1274 then

																						if _G.SelectMonster == "Ship Deckhand [Lv. 1250]" then
																						else
																						else
																							Ms = "Ship Deckhand"
																							NameQuest = "ShipQuest1"
																							QuestLv = 1
																							NameMon = "Ship Deckhand"
																							v208 = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
																							CFrameQ = v208
																							v208 = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
																							CFrameMon = v208

																							if LevelFarmQuest then

																								if LevelFarmNoQuest then

																									if SelectMonster_Quest_Farm then

																										if SelectMonster_NoQuest_Farm then

																											if not DevilMastery_Farm then
																											else
																											else
																											else
																											else

																												if 20000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
																													v208 = game:GetService("ReplicatedStorage")
																													v208.Remotes.CommF_:InvokeServer(v208.Remotes.CommF_)
																												end

																											end

																										else

																											if v207.LocalPlayer.Data.Level.Value ~= 1275 then

																												if v207.LocalPlayer.Data.Level.Value > 1299 then

																													if _G.SelectMonster == "Ship Engineer [Lv. 1275]" then
																													else
																													else
																														Ms = "Ship Engineer"
																														NameQuest = "ShipQuest1"
																														QuestLv = 2
																														NameMon = "Ship Engineer"
																														v208 = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
																														CFrameQ = v208
																														v208 = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)
																														CFrameMon = v208

																														if LevelFarmQuest then

																															if LevelFarmNoQuest then

																																if SelectMonster_Quest_Farm then

																																	if SelectMonster_NoQuest_Farm then

																																		if not DevilMastery_Farm then
																																		else
																																		else
																																		else
																																		else

																																			if 20000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
																																				v208 = game:GetService("ReplicatedStorage")
																																				v208.Remotes.CommF_:InvokeServer(v208.Remotes.CommF_)
																																			end

																																		end

																																	else

																																		if v207.LocalPlayer.Data.Level.Value ~= 1300 then

																																			if v207.LocalPlayer.Data.Level.Value > 1324 then

																																				if _G.SelectMonster == "Ship Steward [Lv. 1300]" then
																																				else
																																				else
																																					Ms = "Ship Steward"
																																					NameQuest = "ShipQuest2"
																																					QuestLv = 1
																																					NameMon = "Ship Steward"
																																					v208 = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
																																					CFrameQ = v208
																																					v208 = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
																																					CFrameMon = v208

																																					if LevelFarmQuest then

																																						if LevelFarmNoQuest then

																																							if SelectMonster_Quest_Farm then

																																								if SelectMonster_NoQuest_Farm then

																																									if not DevilMastery_Farm then
																																									else
																																									else
																																									else
																																									else

																																										if 20000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
																																											v208 = game:GetService("ReplicatedStorage")
																																											v208.Remotes.CommF_:InvokeServer(v208.Remotes.CommF_)
																																										end

																																									end

																																								else

																																									if v207.LocalPlayer.Data.Level.Value ~= 1325 then

																																										if v207.LocalPlayer.Data.Level.Value > 1349 then

																																											if _G.SelectMonster == "Ship Officer [Lv. 1325]" then
																																											else
																																											else
																																												Ms = "Ship Officer"
																																												NameQuest = "ShipQuest2"
																																												QuestLv = 2
																																												NameMon = "Ship Officer"
																																												v208 = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
																																												CFrameQ = v208
																																												v208 = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
																																												CFrameMon = v208

																																												if LevelFarmQuest then

																																													if LevelFarmNoQuest then

																																														if SelectMonster_Quest_Farm then

																																															if SelectMonster_NoQuest_Farm then

																																																if not DevilMastery_Farm then
																																																else
																																																else
																																																else
																																																else

																																																	if 20000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
																																																		v208 = game:GetService("ReplicatedStorage")
																																																		v208.Remotes.CommF_:InvokeServer(v208.Remotes.CommF_)
																																																	end

																																																end

																																															else

																																																if v207.LocalPlayer.Data.Level.Value ~= 1350 then

																																																	if v207.LocalPlayer.Data.Level.Value > 1374 then

																																																		if _G.SelectMonster == "Arctic Warrior [Lv. 1350]" then
																																																		else
																																																		else
																																																			Ms = "Arctic Warrior"
																																																			NameQuest = "FrostQuest"
																																																			QuestLv = 1
																																																			NameMon = "Arctic Warrior"
																																																			v208 = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
																																																			CFrameQ = v208
																																																			v208 = CFrame.new(5935.4541015625, 77.26016998291, -6472.7568359375)
																																																			CFrameMon = v208

																																																			if LevelFarmQuest then

																																																				if LevelFarmNoQuest then

																																																					if SelectMonster_Quest_Farm then

																																																						if SelectMonster_NoQuest_Farm then

																																																							if not DevilMastery_Farm then
																																																							else
																																																							else
																																																							else
																																																							else

																																																								if 20000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
																																																									v208 = game:GetService("ReplicatedStorage")
																																																									v208.Remotes.CommF_:InvokeServer(v208.Remotes.CommF_)
																																																								end

																																																							end

																																																						else

																																																							if v207.LocalPlayer.Data.Level.Value ~= 1375 then

																																																								if v207.LocalPlayer.Data.Level.Value > 1424 then

																																																									if _G.SelectMonster == "Snow Lurker [Lv. 1375]" then
																																																									else
																																																									else
																																																										Ms = "Snow Lurker"
																																																										NameQuest = "FrostQuest"
																																																										QuestLv = 2
																																																										NameMon = "Snow Lurker"
																																																										v208 = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
																																																										CFrameQ = v208
																																																										v208 = CFrame.new(5628.482421875, 57.574996948242, -6618.3481445313)
																																																										CFrameMon = v208
																																																									end

																																																								end

																																																							else

																																																								if v207.LocalPlayer.Data.Level.Value ~= 1425 then

																																																									if v207.LocalPlayer.Data.Level.Value > 1449 then

																																																										if _G.SelectMonster == "Sea Soldier [Lv. 1425]" then
																																																										else
																																																										else
																																																											Ms = "Sea Soldier"
																																																											NameQuest = "ForgottenQuest"
																																																											QuestLv = 1
																																																											NameMon = "Sea Soldier"
																																																											v208 = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
																																																											CFrameQ = v208
																																																											v208 = CFrame.new(-3185.0153808594, 58.789089202881, -9663.6064453125)
																																																											CFrameMon = v208
																																																										end

																																																									end

																																																								else

																																																									if 1450 > v207.LocalPlayer.Data.Level.Value then

																																																										if _G.SelectMonster == "Water Fighter [Lv. 1450]" then
																																																										else
																																																											Ms = "Water Fighter"
																																																											NameQuest = "ForgottenQuest"
																																																											QuestLv = 2
																																																											NameMon = "Water Fighter"
																																																											v208 = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
																																																											CFrameQ = v208
																																																											v208 = CFrame.new(-3262.9301757813, 298.69036865234, -10552.529296875)
																																																											CFrameMon = v208
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

					if not Third_Sea then

						if v207.LocalPlayer.Data.Level.Value ~= 1500 then

							if v207.LocalPlayer.Data.Level.Value > 1524 then

								if _G.SelectMonster == "Pirate Millionaire [Lv. 1500]" then
								else
								else
									Ms = "Pirate Millionaire"
									NameQuest = "PiratePortQuest"
									QuestLv = 1
									NameMon = "Pirate Millionaire"
									v208 = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
									CFrameQ = v208
									v208 = CFrame.new(-435.68109130859, 189.69866943359, 5551.0756835938)
									CFrameMon = v208
								end

							end

						else

							if v207.LocalPlayer.Data.Level.Value ~= 1525 then

								if v207.LocalPlayer.Data.Level.Value > 1574 then

									if _G.SelectMonster == "Pistol Billionaire [Lv. 1525]" then
									else
									else
										Ms = "Pistol Billionaire"
										NameQuest = "PiratePortQuest"
										QuestLv = 2
										NameMon = "Pistol Billionaire"
										v208 = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
										CFrameQ = v208
										v208 = CFrame.new(-236.53652954102, 217.46676635742, 6006.0883789063)
										CFrameMon = v208
									end

								end

							else

								if v207.LocalPlayer.Data.Level.Value ~= 1575 then

									if v207.LocalPlayer.Data.Level.Value > 1599 then

										if _G.SelectMonster == "Dragon Crew Warrior [Lv. 1575]" then
										else
										else
											Ms = "Dragon Crew Warrior"
											NameQuest = "Dragon Crew Warrior"
											QuestLv = 1
											NameMon = "Dragon Crew Warrior"
											v208 = CFrame.new(6735.11083984375, 126.99000549316406, -711.0980224609375)
											CFrameQ = v208
											v208 = CFrame.new(6709.76416015625, 52.343994140625, -1139.030029296875)
											CFrameMon = v208
										end

									end

								else

									if v207.LocalPlayer.Data.Level.Value ~= 1600 then

										if v207.LocalPlayer.Data.Level.Value > 1624 then

											if _G.SelectMonster == "Dragon Crew Archer [Lv. 1600]" then
											else
											else
												Ms = "Dragon Crew Archer"
												NameQuest = "AmazonQuest"
												QuestLv = 2
												NameMon = "Dragon Crew Archer"
												v208 = CFrame.new(6735.11083984375, 126.99000549316406, -711.0980224609375)
												CFrameQ = v208
												v208 = CFrame.new(6818.5888671875, 482.87899780273438, 512.72698974609375)
												CFrameMon = v208
											end

										end

									else

										if v207.LocalPlayer.Data.Level.Value ~= 1625 then

											if v207.LocalPlayer.Data.Level.Value > 1649 then

												if _G.SelectMonster == "Female Islander [Lv. 1625]" then
												else
												else
													Ms = "Female Islander"
													NameQuest = "AmazonQuest"
													QuestLv = 1
													NameMon = "Female Islander"
													v208 = CFrame.new(5214.3388671875, 1000.468017578125, 759.50701904296875)
													CFrameQ = v208
													v208 = CFrame.new(4462.65283203125, 1005.1019897460938, 551.0059814453125)
													CFrameMon = v208
												end

											end

										else

											if v207.LocalPlayer.Data.Level.Value ~= 1650 then

												if v207.LocalPlayer.Data.Level.Value > 1699 then

													if _G.SelectMonster == "Giant Islander [Lv. 1650]" then
													else
													else
														Ms = "Giant Islander"
														NameQuest = "AmazonQuest"
														QuestLv = 2
														NameMon = "Giant Islander"
														v208 = CFrame.new(5214.3388671875, 1000.468017578125, 759.50701904296875)
														CFrameQ = v208
														v208 = CFrame.new(4637.8837890625, 1078.7860107421875, 882.41998291015625)
														CFrameMon = v208
													end

												end

											else

												if v207.LocalPlayer.Data.Level.Value ~= 1700 then

													if v207.LocalPlayer.Data.Level.Value > 1724 then

														if _G.SelectMonster == "Marine Commodore [Lv. 1700]" then
														else
														else
															Ms = "Marine Commodore"
															NameQuest = "MarineTreeIsland"
															QuestLv = 1
															NameMon = "Marine Commodore"
															v208 = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
															CFrameQ = v208
															v208 = CFrame.new(2198.0063476563, 128.71075439453, -7109.5043945313)
															CFrameMon = v208
														end

													end

												else

													if v207.LocalPlayer.Data.Level.Value ~= 1725 then

														if v207.LocalPlayer.Data.Level.Value > 1774 then

															if _G.SelectMonster == "Marine Rear Admiral [Lv. 1725]" then
															else
															else
																Ms = "Marine Rear Admiral"
																NameQuest = "MarineTreeIsland"
																QuestLv = 2
																NameMon = "Marine Rear Admiral"
																v208 = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
																CFrameQ = v208
																v208 = CFrame.new(3294.3142089844, 385.41125488281, -7048.6342773438)
																CFrameMon = v208
															end

														end

													else

														if v207.LocalPlayer.Data.Level.Value ~= 1775 then

															if v207.LocalPlayer.Data.Level.Value > 1799 then

																if _G.SelectMonster == "Fishman Raider [Lv. 1775]" then
																else
																else
																	Ms = "Fishman Raider"
																	NameQuest = "DeepForestIsland3"
																	QuestLv = 1
																	NameMon = "Fishman Raider"
																	v208 = CFrame.new(-10582.759765625, 331.78845214844, -8757.666015625)
																	CFrameQ = v208
																	v208 = CFrame.new(-10553.268554688, 521.38439941406, -8176.9458007813)
																	CFrameMon = v208
																end

															end

														else

															if v207.LocalPlayer.Data.Level.Value ~= 1800 then

																if v207.LocalPlayer.Data.Level.Value > 1824 then

																	if _G.SelectMonster == "Fishman Captain [Lv. 1800]" then
																	else
																	else
																		Ms = "Fishman Captain"
																		NameQuest = "DeepForestIsland3"
																		QuestLv = 2
																		NameMon = "Fishman Captain"
																		v208 = CFrame.new(-10583.099609375, 331.78845214844, -8759.4638671875)
																		CFrameQ = v208
																		v208 = CFrame.new(-10789.401367188, 427.18637084961, -9131.4423828125)
																		CFrameMon = v208
																	end

																end

															else

																if v207.LocalPlayer.Data.Level.Value ~= 1825 then

																	if v207.LocalPlayer.Data.Level.Value > 1849 then

																		if _G.SelectMonster == "Forest Pirate [Lv. 1825]" then
																		else
																		else
																			Ms = "Forest Pirate"
																			NameQuest = "DeepForestIsland"
																			QuestLv = 1
																			NameMon = "Forest Pirate"
																			v208 = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
																			CFrameQ = v208
																			v208 = CFrame.new(-13489.397460938, 400.30349731445, -7770.251953125)
																			CFrameMon = v208
																		end

																	end

																else

																	if v207.LocalPlayer.Data.Level.Value ~= 1850 then

																		if v207.LocalPlayer.Data.Level.Value > 1899 then

																			if _G.SelectMonster == "Mythological Pirate [Lv. 1850]" then
																			else
																			else
																				Ms = "Mythological Pirate"
																				NameQuest = "DeepForestIsland"
																				QuestLv = 2
																				NameMon = "Mythological Pirate"
																				v208 = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
																				CFrameQ = v208
																				v208 = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)
																				CFrameMon = v208
																			end

																		end

																	else

																		if v207.LocalPlayer.Data.Level.Value ~= 1900 then

																			if v207.LocalPlayer.Data.Level.Value > 1924 then

																				if _G.SelectMonster == "Jungle Pirate [Lv. 1900]" then
																				else
																				else
																					Ms = "Jungle Pirate"
																					NameQuest = "DeepForestIsland2"
																					QuestLv = 1
																					NameMon = "Jungle Pirate"
																					v208 = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
																					CFrameQ = v208
																					v208 = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313)
																					CFrameMon = v208
																				end

																			end

																		else

																			if v207.LocalPlayer.Data.Level.Value ~= 1925 then

																				if v207.LocalPlayer.Data.Level.Value > 1974 then

																					if _G.SelectMonster == "Musketeer Pirate [Lv. 1925]" then
																					else
																					else
																						Ms = "Musketeer Pirate"
																						NameQuest = "DeepForestIsland2"
																						QuestLv = 2
																						NameMon = "Musketeer Pirate"
																						v208 = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
																						CFrameQ = v208
																						v208 = CFrame.new(-13291.5078125, 520.47338867188, -9904.638671875)
																						CFrameMon = v208
																					end

																				end

																			else

																				if v207.LocalPlayer.Data.Level.Value ~= 1975 then

																					if v207.LocalPlayer.Data.Level.Value > 1999 then

																						if _G.SelectMonster == "Reborn Skeleton [Lv. 1975]" then
																						else
																						else
																							Ms = "Reborn Skeleton"
																							NameQuest = "HauntedQuest1"
																							QuestLv = 1
																							NameMon = "Reborn Skeleton"
																							v208 = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-08, -0.999978542, 2.04920472e-08, 1, 4.51620679e-08, 0.999978542, -2.01955679e-08, -0.00655503059)
																							CFrameQ = v208
																							v208 = CFrame.new(-8761.77148, 183.431747, 6168.33301, 0.978073597, -1.3950732e-05, -0.208259016, -1.08073925e-06, 1, -7.20630269e-05, 0.208259016, 7.07080399e-05, 0.978073597)
																							CFrameMon = v208
																						end

																					end

																				else

																					if v207.LocalPlayer.Data.Level.Value ~= 2000 then

																						if v207.LocalPlayer.Data.Level.Value > 2024 then

																							if _G.SelectMonster == "Living Zombie [Lv. 2000]" then
																							else
																							else
																								Ms = "Living Zombie"
																								NameQuest = "HauntedQuest1"
																								QuestLv = 2
																								NameMon = "Living Zombie"
																								v208 = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-08, -0.999978542, 2.04920472e-08, 1, 4.51620679e-08, 0.999978542, -2.01955679e-08, -0.00655503059)
																								CFrameQ = v208
																								v208 = CFrame.new(-10103.7529, 238.565979, 6179.75977, 0.999474227, 2.77547141e-08, 0.0324240364, -2.58006327e-08, 1, -6.06848474e-08, -0.0324240364, 5.98163865e-08, 0.999474227)
																								CFrameMon = v208
																							end

																						end

																					else

																						if v207.LocalPlayer.Data.Level.Value ~= 2025 then

																							if v207.LocalPlayer.Data.Level.Value > 2049 then

																								if _G.SelectMonster == "Demonic Soul [Lv. 2025]" then
																								else
																								else
																									Ms = "Demonic Soul"
																									NameQuest = "HauntedQuest2"
																									QuestLv = 1
																									NameMon = "Demonic Soul"
																									v208 = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
																									CFrameQ = v208
																									v208 = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)
																									CFrameMon = v208
																								end

																							end

																						else

																							if v207.LocalPlayer.Data.Level.Value ~= 2050 then

																								if v207.LocalPlayer.Data.Level.Value > 2074 then

																									if _G.SelectMonster == "Posessed Mummy [Lv. 2050]" then
																									else
																									else
																										Ms = "Posessed Mummy"
																										NameQuest = "HauntedQuest2"
																										QuestLv = 2
																										NameMon = "Posessed Mummy"
																										v208 = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
																										CFrameQ = v208
																										v208 = CFrame.new(-9545.7763671875, 69.619895935059, 6339.5615234375)
																										CFrameMon = v208
																									end

																								end

																							else

																								if v207.LocalPlayer.Data.Level.Value ~= 2075 then

																									if v207.LocalPlayer.Data.Level.Value > 2099 then

																										if _G.SelectMonster == "Peanut Scout [Lv. 2075]" then
																										else
																										else
																											Ms = "Peanut Scout"
																											NameQuest = "NutsIslandQuest"
																											QuestLv = 1
																											NameMon = "Peanut Scout"
																											v208 = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
																											CFrameQ = v208
																											v208 = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
																											CFrameMon = v208
																										end

																									end

																								else

																									if v207.LocalPlayer.Data.Level.Value ~= 2100 then

																										if v207.LocalPlayer.Data.Level.Value > 2124 then

																											if _G.SelectMonster == "Peanut President [Lv. 2100]" then
																											else
																											else
																												Ms = "Peanut President"
																												NameQuest = "NutsIslandQuest"
																												QuestLv = 2
																												NameMon = "Peanut President"
																												v208 = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
																												CFrameQ = v208
																												v208 = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
																												CFrameMon = v208
																											end

																										end

																									else

																										if v207.LocalPlayer.Data.Level.Value ~= 2125 then

																											if v207.LocalPlayer.Data.Level.Value > 2149 then

																												if _G.SelectMonster == "Ice Cream Chef [Lv. 2125]" then
																												else
																												else
																													Ms = "Ice Cream Chef"
																													NameQuest = "IceCreamIslandQuest"
																													QuestLv = 1
																													NameMon = "Ice Cream Chef"
																													v208 = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
																													CFrameQ = v208
																													v208 = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, 0, -0.997525156, 0, 1.00000012, 0, 0.997525275, 0, -0.0703101456)
																													CFrameMon = v208
																												end

																											end

																										else

																											if v207.LocalPlayer.Data.Level.Value ~= 2150 then

																												if v207.LocalPlayer.Data.Level.Value > 2199 then

																													if _G.SelectMonster == "Ice Cream Commander [Lv. 2150]" then
																													else
																													else
																														Ms = "Ice Cream Commander"
																														NameQuest = "IceCreamIslandQuest"
																														QuestLv = 2
																														NameMon = "Ice Cream Commander"
																														v208 = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
																														CFrameQ = v208
																														v208 = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, 0, -0.997525156, 0, 1.00000012, 0, 0.997525275, 0, -0.0703101456)
																														CFrameMon = v208
																													end

																												end

																											else

																												if v207.LocalPlayer.Data.Level.Value ~= 2200 then

																													if v207.LocalPlayer.Data.Level.Value > 2224 then

																														if _G.SelectMonster == "Cookie Crafter [Lv. 2200]" then
																														else
																														else
																															Ms = "Cookie Crafter"
																															NameQuest = "CakeQuest1"
																															QuestLv = 1
																															NameMon = "Cookie Crafter"
																															v208 = CFrame.new(-2022.29858, 36.9275894, -12030.9766, -0.961273909, 0, -0.275594592, 0, 1, 0, 0.275594592, 0, -0.961273909)
																															CFrameQ = v208
																															v208 = CFrame.new(-2321.71216, 36.699482, -12216.7871, -0.780074954, 0, 0.625686109, 0, 1, 0, -0.625686109, 0, -0.780074954)
																															CFrameMon = v208
																														end

																													end

																												else

																													if v207.LocalPlayer.Data.Level.Value ~= 2225 then

																														if v207.LocalPlayer.Data.Level.Value > 2249 then

																															if _G.SelectMonster == "Cake Guard [Lv. 2225]" then
																															else
																															else
																																Ms = "Cake Guard"
																																NameQuest = "CakeQuest1"
																																QuestLv = 2
																																NameMon = "Cake Guard"
																																v208 = CFrame.new(-2022.29858, 36.9275894, -12030.9766, -0.961273909, 0, -0.275594592, 0, 1, 0, 0.275594592, 0, -0.961273909)
																																CFrameQ = v208
																																v208 = CFrame.new(-1418.11011, 36.6718941, -12255.7324, 0.0677844882, 0, 0.997700036, 0, 1, 0, -0.997700036, 0, 0.0677844882)
																																CFrameMon = v208
																															end

																														end

																													else

																														if v207.LocalPlayer.Data.Level.Value ~= 2250 then

																															if v207.LocalPlayer.Data.Level.Value > 2274 then

																																if _G.SelectMonster == "Baking Staff [Lv. 2250]" then
																																else
																																else
																																	Ms = "Baking Staff"
																																	NameQuest = "CakeQuest2"
																																	QuestLv = 1
																																	NameMon = "Baking Staff"
																																	v208 = CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, 0, -0.308980465, 0, 1, 0, 0.308980465, 0, 0.951068401)
																																	CFrameQ = v208
																																	v208 = CFrame.new(-1980.43848, 36.6716766, -12983.8418, -0.254443765, 0, -0.967087567, 0, 1, 0, 0.967087567, 0, -0.254443765)
																																	CFrameMon = v208
																																end

																															end

																														else

																															if v207.LocalPlayer.Data.Level.Value ~= 2275 then

																																if v207.LocalPlayer.Data.Level.Value > 2299 then

																																	if _G.SelectMonster == "Head Baker [Lv. 2275]" then
																																	else
																																	else
																																		Ms = "Head Baker"
																																		NameQuest = "CakeQuest2"
																																		QuestLv = 2
																																		NameMon = "Head Baker"
																																		v208 = CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, 0, -0.308980465, 0, 1, 0, 0.308980465, 0, 0.951068401)
																																		CFrameQ = v208
																																		v208 = CFrame.new(-2251.5791, 52.2714615, -13033.3965, -0.991971016, 0, -0.126466095, 0, 1, 0, 0.126466095, 0, -0.991971016)
																																		CFrameMon = v208
																																	end

																																end

																															else

																																if v207.LocalPlayer.Data.Level.Value ~= 2300 then

																																	if v207.LocalPlayer.Data.Level.Value > 2324 then

																																		if _G.SelectMonster == "Cocoa Warrior [Lv. 2300]" then
																																		else
																																		else
																																			Ms = "Cocoa Warrior"
																																			NameQuest = "ChocQuest1"
																																			QuestLv = 1
																																			NameMon = "Cocoa Warrior"
																																			v208 = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
																																			CFrameQ = v208
																																			v208 = CFrame.new(167.978516, 26.2254658, -12238.874, -0.939700961, 0, 0.341998369, 0, 1, 0, -0.341998369, 0, -0.939700961)
																																			CFrameMon = v208
																																		end

																																	end

																																else

																																	if v207.LocalPlayer.Data.Level.Value ~= 2325 then

																																		if v207.LocalPlayer.Data.Level.Value > 2349 then

																																			if _G.SelectMonster == "Chocolate Bar Battler [Lv. 2325]" then
																																			else
																																			else
																																				Ms = "Chocolate Bar Battler"
																																				NameQuest = "ChocQuest1"
																																				QuestLv = 2
																																				NameMon = "Chocolate Bar Battler"
																																				v208 = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
																																				CFrameQ = v208
																																				v208 = CFrame.new(701.312073, 25.5824986, -12708.2148, -0.342042685, 0, -0.939684391, 0, 1, 0, 0.939684391, 0, -0.342042685)
																																				CFrameMon = v208
																																			end

																																		end

																																	else

																																		if v207.LocalPlayer.Data.Level.Value ~= 2350 then

																																			if v207.LocalPlayer.Data.Level.Value > 2374 then

																																				if _G.SelectMonster == "Sweet Thief [Lv. 2350]" then
																																				else
																																				else
																																					Ms = "Sweet Thief"
																																					NameQuest = "ChocQuest2"
																																					QuestLv = 1
																																					NameMon = "Sweet Thief"
																																					v208 = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)
																																					CFrameQ = v208
																																					v208 = CFrame.new(-140.258301, 25.5824986, -12652.3115, 0.173624337, 0, -0.984811902, 0, 1, 0, 0.984811902, 0, 0.173624337)
																																					CFrameMon = v208
																																				end

																																			end

																																		else

																																			if v207.LocalPlayer.Data.Level.Value ~= 2375 then

																																				if v207.LocalPlayer.Data.Level.Value > 2400 then

																																					if _G.SelectMonster == "Candy Rebel [Lv. 2375]" then
																																					else
																																					else
																																						Ms = "Candy Rebel"
																																						NameQuest = "ChocQuest2"
																																						QuestLv = 2
																																						NameMon = "Candy Rebel"
																																						v208 = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)
																																						CFrameQ = v208
																																						v208 = CFrame.new(47.9231453, 25.5824986, -13029.2402, -0.819156051, 0, -0.573571265, 0, 1, 0, 0.573571265, 0, -0.819156051)
																																						CFrameMon = v208
																																					end

																																				end

																																			else

																																				if v207.LocalPlayer.Data.Level.Value ~= 2400 then

																																					if v207.LocalPlayer.Data.Level.Value > 2424 then

																																						if _G.SelectMonster == "Candy Pirate [Lv. 2400]" then
																																						else
																																						else
																																							Ms = "Candy Pirate"
																																							NameQuest = "CandyQuest1"
																																							QuestLv = 1
																																							NameMon = "Candy Pirate"
																																							v208 = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
																																							CFrameQ = v208
																																							v208 = CFrame.new(-1437.56348, 17.1481285, -14385.6934, 0.173624337, 0, -0.984811902, 0, 1, 0, 0.984811902, 0, 0.173624337)
																																							CFrameMon = v208
																																						end

																																					end

																																				else

																																					if v207.LocalPlayer.Data.Level.Value ~= 2425 then

																																						if v207.LocalPlayer.Data.Level.Value > 2449 then

																																							if _G.SelectMonster == "Snow Demon [Lv. 2425]" then
																																							else
																																							else
																																								Ms = "Snow Demon"
																																								NameQuest = "CandyQuest1"
																																								QuestLv = 2
																																								NameMon = "Snow Demon"
																																								v208 = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
																																								CFrameQ = v208
																																								v208 = CFrame.new(-916.222656, 17.1481285, -14638.8125, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
																																								CFrameMon = v208
																																							end

																																						end

																																					else

																																						if v207.LocalPlayer.Data.Level.Value ~= 2450 then

																																							if v207.LocalPlayer.Data.Level.Value > 2474 then

																																								if _G.SelectMonster == "Isle Outlaw [Lv. 2450]" then
																																								else
																																								else
																																									Ms = "Isle Outlaw"
																																									NameQuest = "TikiQuest1"
																																									QuestLv = 1
																																									NameMon = "Isle Outlaw"
																																									v208 = CFrame.new(-16548.8164, 55.6059914, -172.8125, 0.213092566, 0, -0.977032006, 0, 1, 0, 0.977032006, 0, 0.213092566)
																																									CFrameQ = v208
																																									v208 = CFrame.new(-16122.4062, 10.6328173, -257.351685, -0.630029082, 0, 0.776571631, 0, 1, 0, -0.776571631, 0, -0.630029082)
																																									CFrameMon = v208
																																								end

																																							end

																																						else

																																							if v207.LocalPlayer.Data.Level.Value ~= 2475 then

																																								if v207.LocalPlayer.Data.Level.Value > 2499 then

																																									if _G.SelectMonster == "Island Boy [2475]" then
																																									else
																																									else
																																										Ms = "Island Boy"
																																										NameQuest = "TikiQuest1"
																																										QuestLv = 2
																																										NameMon = "Island Boy"
																																										v208 = CFrame.new(-16548.8164, 55.6059914, -172.8125, 0.213092566, 0, -0.977032006, 0, 1, 0, 0.977032006, 0, 0.213092566)
																																										CFrameQ = v208
																																										v208 = CFrame.new(-16736.2266, 20.533947, -131.718811, 0.546393692, 0, 0.837528467, 0, 1, 0, -0.837528467, 0, 0.546393692)
																																										CFrameMon = v208
																																									end

																																								end

																																							else

																																								if v207.LocalPlayer.Data.Level.Value ~= 2500 then

																																									if v207.LocalPlayer.Data.Level.Value > 2524 then

																																										if _G.SelectMonster == "Sun-kissed Warrior [Lv. 2500]" then
																																										else
																																										else
																																											Ms = "Sun-kissed Warrior"
																																											NameQuest = "TikiQuest2"
																																											QuestLv = 1
																																											NameMon = "Sun-"
																																											v208 = CFrame.new(-16541.0215, 54.770813, 1051.46118, 0.0410757065, 0, -0.999156058, 0, 1, 0, 0.999156058, 0, 0.0410757065)
																																											CFrameQ = v208
																																											v208 = CFrame.new(-16413.5078, 54.6350479, 1054.43555, -0.999391913, 0, -0.034868788, 0, 1, 0, 0.034868788, 0, -0.999391913)
																																											CFrameMon = v208
																																										end

																																									end

																																								else

																																									if v207.LocalPlayer.Data.Level.Value ~= 2525 then

																																										if v207.LocalPlayer.Data.Level.Value > 2549 then

																																											if _G.SelectMonster == "Isle Champion [Lv. 2525]" then
																																											else
																																											else
																																												Ms = "Isle Champion"
																																												NameQuest = "TikiQuest2"
																																												QuestLv = 2
																																												NameMon = "Isle Champion"
																																												v208 = CFrame.new(-16541.0215, 54.770813, 1051.46118, 0.0410757065, 0, -0.999156058, 0, 1, 0, 0.999156058, 0, 0.0410757065)
																																												CFrameQ = v208
																																												v208 = CFrame.new(-16787.3203, 20.6350517, 992.131836, -0.775471091, 0, 0.631383121, 0, 1, 0, -0.631383121, 0, -0.775471091)
																																												CFrameMon = v208
																																											end

																																										end

																																									else

																																										if v207.LocalPlayer.Data.Level.Value ~= 2550 then

																																											if v207.LocalPlayer.Data.Level.Value > 2574 then

																																												if _G.SelectMonster == "Serpent Hunter [Lv. 2550]" then
																																												else
																																												else
																																													Ms = "Serpent Hunter"
																																													NameQuest = "TikiQuest3"
																																													QuestLv = 1
																																													NameMon = "Serpent Hunter"
																																													v208 = CFrame.new(-16665.1914, 104.596405, 1579.69434, 0.951068401, 0, -0.308980465, 0, 1, 0, 0.308980465, 0, 0.951068401)
																																													CFrameQ = v208
																																													v208 = CFrame.new(-16654.7754, 105.286232, 1579.67444, 0.999096751, 4.45934489e-08, 0.0424928814, -4.38822667e-08, 1, -1.76692847e-08, -0.0424928814, 1.57886415e-08, 0.999096751)
																																													CFrameMon = v208
																																												end

																																											end

																																										else

																																											if 2575 > v207.LocalPlayer.Data.Level.Value then

																																												if _G.SelectMonster == "Skull Slayer [Lv. 2575]" then
																																												else
																																													Ms = "Skull Slayer"
																																													NameQuest = "TikiQuest3"
																																													QuestLv = 2
																																													NameMon = "Skull Slayer"
																																													v208 = CFrame.new(-16665.1914, 104.596405, 1579.69434, 0.951068401, 0, -0.308980465, 0, 1, 0, 0.308980465, 0, 0.951068401)
																																													CFrameQ = v208
																																													v208 = CFrame.new(-16654.7754, 105.286232, 1579.67444, 0.999096751, 4.45934489e-08, 0.0424928814, -4.38822667e-08, 1, -1.76692847e-08, -0.0424928814, 1.57886415e-08, 0.999096751)
																																													CFrameMon = v208
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

				if not First_Sea then
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
						"Galley Captain [Lv. 650]",
					}
				else

					if not Second_Sea then
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
							"Water Fighter [Lv. 1450]",
						}
					else

						if not Third_Sea then
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
								"Isle Champion [Lv. 2525]",
								"Serpent Hunter [Lv. 2550]",
								"Skull Slayer [Lv. 2575]",
							}
						end

					end

				end

				function CheckBossQuest()
					if not First_Sea then

						if SelectBoss == "The Gorilla King" then
							BossMon = "The Gorilla King [Lv. 25] [Boss]"
							NameBoss = "The Gorrila King"
							NameQuestBoss = "JungleQuest"
							QuestLvBoss = 3
							RewardBoss = "Reward:\n$2,000\n7,000 Exp."
							local v210 = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
							CFrameQBoss = v210
							v210 = CFrame.new(-1088.75977, 8.13463783, -488.559906, -0.707134247, 0, 0.707079291, 0, 1, 0, -0.707079291, 0, -0.707134247)
							CFrameBoss = v210
						else

							if SelectBoss == "Bobby" then
								BossMon = "Bobby [Lv. 55] [Boss]"
								NameBoss = "Bobby"
								NameQuestBoss = "BuggyQuest1"
								QuestLvBoss = 3
								RewardBoss = "Reward:\n$8,000\n35,000 Exp."
								v210 = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
								CFrameQBoss = v210
								v210 = CFrame.new(-1087.3760986328, 46.949409484863, 4040.1462402344)
								CFrameBoss = v210
							else

								if SelectBoss == "The Saw" then
									BossMon = "The Saw [Lv. 100] [Boss]"
									NameBoss = "The Saw"
									v210 = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906)
									CFrameBoss = v210
								else

									if SelectBoss == "Yeti" then
										BossMon = "Yeti [Lv. 110] [Boss]"
										NameBoss = "Yeti"
										NameQuestBoss = "SnowQuest"
										QuestLvBoss = 3
										RewardBoss = "Reward:\n$10,000\n180,000 Exp."
										v210 = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
										CFrameQBoss = v210
										v210 = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
										CFrameBoss = v210
									else

										if SelectBoss == "Mob Leader" then
											BossMon = "Mob Leader [Lv. 120] [Boss]"
											NameBoss = "Mob Leader"
											v210 = CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813)
											CFrameBoss = v210
										else

											if SelectBoss == "Vice Admiral" then
												BossMon = "Vice Admiral [Lv. 130] [Boss]"
												NameBoss = "Vice Admiral"
												NameQuestBoss = "MarineQuest2"
												QuestLvBoss = 2
												RewardBoss = "Reward:\n$10,000\n180,000 Exp."
												v210 = CFrame.new(-5036.2465820313, 28.677835464478, 4324.56640625)
												CFrameQBoss = v210
												v210 = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)
												CFrameBoss = v210
											else

												if SelectBoss == "Saber Expert" then
													NameBoss = "Saber Expert"
													BossMon = "Saber Expert [Lv. 200] [Boss]"
													v210 = CFrame.new(-1458.89502, 29.8870335, -50.633564)
													CFrameBoss = v210
												else

													if SelectBoss == "Warden" then
														BossMon = "Warden [Lv. 220] [Boss]"
														NameBoss = "Warden"
														NameQuestBoss = "ImpelQuest"
														QuestLvBoss = 1
														RewardBoss = "Reward:\n$6,000\n850,000 Exp."
														v210 = CFrame.new(5278.04932, 2.15167475, 944.101929, 0.220546961, -4.49946401e-06, 0.975376427, -1.95412576e-05, 1, 9.03162072e-06, -0.975376427, -2.10519756e-05, 0.220546961)
														CFrameBoss = v210
														v210 = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
														CFrameQBoss = v210
													else

														if SelectBoss == "Chief Warden" then
															BossMon = "Chief Warden [Lv. 230] [Boss]"
															NameBoss = "Chief Warden"
															NameQuestBoss = "ImpelQuest"
															QuestLvBoss = 2
															RewardBoss = "Reward:\n$10,000\n1,000,000 Exp."
															v210 = CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, -0.00062915677, 0.939684749, 0.00191645394, 0.999998152, -2.80422337e-05, -0.939682961, 0.00181045406, 0.342041939)
															CFrameBoss = v210
															v210 = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
															CFrameQBoss = v210
														else

															if SelectBoss == "Swan" then
																BossMon = "Swan [Lv. 240] [Boss]"
																NameBoss = "Swan"
																NameQuestBoss = "ImpelQuest"
																QuestLvBoss = 3
																RewardBoss = "Reward:\n$15,000\n1,600,000 Exp."
																v210 = CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812)
																CFrameBoss = v210
																v210 = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
																CFrameQBoss = v210
															else

																if SelectBoss == "Magma Admiral" then
																	BossMon = "Magma Admiral [Lv. 350] [Boss]"
																	NameBoss = "Magma Admiral"
																	NameQuestBoss = "MagmaQuest"
																	QuestLvBoss = 3
																	RewardBoss = "Reward:\n$15,000\n2,800,000 Exp."
																	v210 = CFrame.new(-5314.6220703125, 12.262420654297, 8517.279296875)
																	CFrameQBoss = v210
																	v210 = CFrame.new(-5765.8969726563, 82.92064666748, 8718.3046875)
																	CFrameBoss = v210
																else

																	if SelectBoss == "Fishman Lord" then
																		BossMon = "Fishman Lord [Lv. 425] [Boss]"
																		NameBoss = "Fishman Lord"
																		NameQuestBoss = "FishmanQuest"
																		QuestLvBoss = 3
																		RewardBoss = "Reward:\n$15,000\n4,000,000 Exp."
																		v210 = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
																		CFrameQBoss = v210
																		v210 = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
																		CFrameBoss = v210
																	else

																		if SelectBoss == "Wysper" then
																			BossMon = "Wysper [Lv. 500] [Boss]"
																			NameBoss = "Wysper"
																			NameQuestBoss = "SkyExp1Quest"
																			QuestLvBoss = 3
																			RewardBoss = "Reward:\n$15,000\n4,800,000 Exp."
																			v210 = CFrame.new(-7861.947265625, 5545.517578125, -379.85974121094)
																			CFrameQBoss = v210
																			v210 = CFrame.new(-7866.1333007813, 5576.4311523438, -546.74816894531)
																			CFrameBoss = v210
																		else

																			if SelectBoss == "Thunder God" then
																				BossMon = "Thunder God [Lv. 575] [Boss]"
																				NameBoss = "Thunder God"
																				NameQuestBoss = "SkyExp2Quest"
																				QuestLvBoss = 3
																				RewardBoss = "Reward:\n$20,000\n5,800,000 Exp."
																				v210 = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
																				CFrameQBoss = v210
																				v210 = CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188)
																				CFrameBoss = v210
																			else

																				if SelectBoss == "Cyborg" then
																					BossMon = "Cyborg [Lv. 675] [Boss]"
																					NameBoss = "Cyborg"
																					NameQuestBoss = "FountainQuest"
																					QuestLvBoss = 3
																					RewardBoss = "Reward:\n$20,000\n7,500,000 Exp."
																					v210 = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
																					CFrameQBoss = v210
																					v210 = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)
																					CFrameBoss = v210
																				else

																					if SelectBoss == "Ice Admiral" then
																						BossMon = "Ice Admiral [Lv. 700] [Boss]"
																						NameBoss = "Ice Admiral"
																						v210 = CFrame.new(1266.08948, 26.1757946, -1399.57678, -0.573599219, 0, -0.81913656, 0, 1, 0, 0.81913656, 0, -0.573599219)
																						CFrameBoss = v210
																					else

																						if SelectBoss == "Greybeard" then
																							BossMon = "Greybeard [Lv. 750] [Raid Boss]"
																							NameBoss = "Greybeard"
																							v210 = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
																							CFrameBoss = v210
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

					if not Second_Sea then

						if SelectBoss == "Diamond" then
							BossMon = "Diamond [Lv. 750] [Boss]"
							NameBoss = "Diamond"
							NameQuestBoss = "Area1Quest"
							QuestLvBoss = 3
							RewardBoss = "Reward:\n$25,000\n9,000,000 Exp."
							v210 = CFrame.new(-427.5666809082, 73.313781738281, 1835.4208984375)
							CFrameQBoss = v210
							v210 = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)
							CFrameBoss = v210
						else

							if SelectBoss == "Jeremy" then
								BossMon = "Jeremy [Lv. 850] [Boss]"
								NameBoss = "Jeremy"
								NameQuestBoss = "Area2Quest"
								QuestLvBoss = 3
								RewardBoss = "Reward:\n$25,000\n11,500,000 Exp."
								v210 = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063)
								CFrameQBoss = v210
								v210 = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
								CFrameBoss = v210
							else

								if SelectBoss == "Fajita" then
									BossMon = "Fajita [Lv. 925] [Boss]"
									NameBoss = "Fajita"
									NameQuestBoss = "MarineQuest3"
									QuestLvBoss = 3
									RewardBoss = "Reward:\n$25,000\n15,000,000 Exp."
									v210 = CFrame.new(-2441.986328125, 73.359344482422, -3217.5324707031)
									CFrameQBoss = v210
									v210 = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)
									CFrameBoss = v210
								else

									if SelectBoss == "Don Swan" then
										BossMon = "Don Swan [Lv. 1000] [Boss]"
										NameBoss = "Don Swan"
										v210 = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875)
										CFrameBoss = v210
									else

										if SelectBoss == "Smoke Admiral" then
											BossMon = "Smoke Admiral [Lv. 1150] [Boss]"
											NameBoss = "Smoke Admiral"
											NameQuestBoss = "IceSideQuest"
											QuestLvBoss = 3
											RewardBoss = "Reward:\n$20,000\n25,000,000 Exp."
											v210 = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
											CFrameQBoss = v210
											v210 = CFrame.new(-5275.1987304688, 20.757257461548, -5260.6669921875)
											CFrameBoss = v210
										else

											if SelectBoss == "Awakened Ice Admiral" then
												BossMon = "Awakened Ice Admiral [Lv. 1400] [Boss]"
												NameBoss = "Awakened Ice Admiral"
												NameQuestBoss = "FrostQuest"
												QuestLvBoss = 3
												RewardBoss = "Reward:\n$20,000\n36,000,000 Exp."
												v210 = CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813)
												CFrameQBoss = v210
												v210 = CFrame.new(6403.5439453125, 340.29766845703, -6894.5595703125)
												CFrameBoss = v210
											else

												if SelectBoss == "Tide Keeper" then
													BossMon = "Tide Keeper [Lv. 1475] [Boss]"
													NameBoss = "Tide Keeper"
													NameQuestBoss = "ForgottenQuest"
													QuestLvBoss = 3
													RewardBoss = "Reward:\n$12,500\n38,000,000 Exp."
													v210 = CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625)
													CFrameQBoss = v210
													v210 = CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188)
													CFrameBoss = v210
												else

													if SelectBoss == "Darkbeard" then
														BossMon = "Darkbeard [Lv. 1000] [Raid Boss]"
														NameBoss = "Darkbeard"
														v210 = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
														CFrameMon = v210
													else

														if SelectBoss == "Cursed Captain" then
															BossMon = "Cursed Captain [Lv. 1325] [Raid Boss]"
															NameBoss = "Cursed Captain"
															v210 = CFrame.new(916.928589, 181.092773, 33422)
															CFrameBoss = v210
														else

															if SelectBoss == "Order" then
																BossMon = "Order [Lv. 1250] [Raid Boss]"
																NameBoss = "Order"
																v210 = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
																CFrameBoss = v210
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

					if not Third_Sea then

						if SelectBoss == "Stone" then
							BossMon = "Stone [Lv. 1550] [Boss]"
							NameBoss = "Stone"
							NameQuestBoss = "PiratePortQuest"
							QuestLvBoss = 3
							RewardBoss = "Reward:\n$25,000\n40,000,000 Exp."
							v210 = CFrame.new(-289.76705932617, 43.819011688232, 5579.9384765625)
							CFrameQBoss = v210
							v210 = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)
							CFrameBoss = v210
						else

							if SelectBoss == "Island Empress" then
								BossMon = "Island Empress [Lv. 1675] [Boss]"
								NameBoss = "Island Empress"
								NameQuestBoss = "AmazonQuest2"
								QuestLvBoss = 3
								RewardBoss = "Reward:\n$30,000\n52,000,000 Exp."
								v210 = CFrame.new(5445.9541015625, 601.62945556641, 751.43792724609)
								CFrameQBoss = v210
								v210 = CFrame.new(5543.86328125, 668.97399902344, 199.0341796875)
								CFrameBoss = v210
							else

								if SelectBoss == "Kilo Admiral" then
									BossMon = "Kilo Admiral [Lv. 1750] [Boss]"
									NameBoss = "Kilo Admiral"
									NameQuestBoss = "MarineTreeIsland"
									QuestLvBoss = 3
									RewardBoss = "Reward:\n$35,000\n56,000,000 Exp."
									v210 = CFrame.new(2179.3010253906, 28.731239318848, -6739.9741210938)
									CFrameQBoss = v210
									v210 = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)
									CFrameBoss = v210
								else

									if SelectBoss == "Captain Elephant" then
										BossMon = "Captain Elephant [Lv. 1875] [Boss]"
										NameBoss = "Captain Elephant"
										NameQuestBoss = "DeepForestIsland"
										QuestLvBoss = 3
										RewardBoss = "Reward:\n$40,000\n67,000,000 Exp."
										v210 = CFrame.new(-13232.682617188, 332.40396118164, -7626.01171875)
										CFrameQBoss = v210
										v210 = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
										CFrameBoss = v210
									else

										if SelectBoss == "Beautiful Pirate" then
											BossMon = "Beautiful Pirate [Lv. 1950] [Boss]"
											NameBoss = "Beautiful Pirate"
											NameQuestBoss = "DeepForestIsland2"
											QuestLvBoss = 3
											RewardBoss = "Reward:\n$50,000\n70,000,000 Exp."
											v210 = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
											CFrameQBoss = v210
											v210 = CFrame.new(5283.609375, 22.56223487854, -110.78285217285)
											CFrameBoss = v210
										else

											if SelectBoss == "Cake Queen" then
												BossMon = "Cake Queen [Lv. 2175] [Boss]"
												NameBoss = "Cake Queen"
												NameQuestBoss = "IceCreamIslandQuest"
												QuestLvBoss = 3
												RewardBoss = "Reward:\n$30,000\n112,500,000 Exp."
												v210 = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
												CFrameQBoss = v210
												v210 = CFrame.new(-678.648804, 381.353943, -11114.2012, -0.908641815, 0.00149294338, 0.41757378, 0.00837114919, 0.999857843, 0.0146408929, -0.417492568, 0.0167988986, -0.90852499)
												CFrameBoss = v210
											else

												if SelectBoss == "Longma" then
													BossMon = "Longma [Lv. 2000] [Boss]"
													NameBoss = "Longma"
													v210 = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
													CFrameBoss = v210
												else

													if SelectBoss == "Soul Reaper" then
														BossMon = "Soul Reaper [Lv. 2100] [Raid Boss]"
														NameBoss = "Soul Reaper"
														v210 = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
														CFrameBoss = v210
													else

														if SelectBoss == "rip_indra True Form" then
															BossMon = "rip_indra True Form [Lv. 5000] [Raid Boss]"
															NameBoss = "rip_indra True Form"
															v210 = CFrame.new(-5415.3920898438, 505.74133300781, -2814.0166015625)
															CFrameBoss = v210
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

				function MaterialMon()
					if SelectMaterial == "Radioactive Material" then
						MMon = "Factory Staff"
						local v211 = CFrame.new(295, 73, -56)
						MPos = v211
						SP = "Default"
					else

						if SelectMaterial == "Mirage Droplet" then
							MMon = "Water Fighter"
							v211 = CFrame.new(-3385, 239, -10542)
							MPos = v211
							SP = "Default"
						else

							if SelectMaterial == "Magma Ore" then

								if not First_Sea then
									MMon = "Military Spy"
									v211 = CFrame.new(-5815, 84, 8820)
									MPos = v211
									SP = "Default"
								else

									if not Second_Sea then
										MMon = "Magma Ninja"
										v211 = CFrame.new(-5428, 78, -5959)
										MPos = v211
										SP = "Default"
									else

										if SelectMaterial == "Angel Wings" then
											MMon = "God's Guard"
											v211 = CFrame.new(-4698, 845, -1912)
											MPos = v211
											SP = "Default"
											v211 = _u0()
											local v212 = Vector3.new(-7859.09814, 5544.19043, -381.476196)

											if 5000 <= (v211.Position - v212).Magnitude then
												_u1.Remotes.CommF_:InvokeServer(_u1.Remotes.CommF_)
											else

												if SelectMaterial == "Leather" then

													if not First_Sea then
														MMon = "Brute"
														v211 = CFrame.new(-1145, 15, 4350)
														MPos = v211
														SP = "Default"
													else

														if not Second_Sea then
															MMon = "Marine Captain"
															v211 = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375)
															MPos = v211
															SP = "Default"
														else

															if not Third_Sea then
																MMon = "Jungle Pirate"
																v211 = CFrame.new(-11975.78515625, 331.77340698242188, -10620.0302734375)
																MPos = v211
																SP = "Default"
															else

																if SelectMaterial == "Scrap Metal" then

																	if not First_Sea then
																		MMon = "Brute"
																		v211 = CFrame.new(-1145, 15, 4350)
																		MPos = v211
																		SP = "Default"
																	else

																		if not Second_Sea then
																			MMon = "Swan Pirate"
																			v211 = CFrame.new(878, 122, 1235)
																			MPos = v211
																			SP = "Default"
																		else

																			if not Third_Sea then
																				MMon = "Jungle Pirate"
																				v211 = CFrame.new(-12107, 332, -10549)
																				MPos = v211
																				SP = "Default"
																			else

																				if SelectMaterial == "Fish Tail" then

																					if not Third_Sea then
																						MMon = "Fishman Raider"
																						v211 = CFrame.new(-10993, 332, -8940)
																						MPos = v211
																						SP = "Default"
																					else

																						if not First_Sea then
																							MMon = "Fishman Warrior"
																							v211 = CFrame.new(61123, 19, 1569)
																							MPos = v211
																							SP = "Default"
																							v211 = _u0()
																							v212 = Vector3.new(61163.8515625, 5.3423423767089844, 1819.7841796875)

																							if 17000 <= (v211.Position - v212).Magnitude then
																								_u1.Remotes.CommF_:InvokeServer(_u1.Remotes.CommF_)
																							else

																								if SelectMaterial == "Demonic Wisp" then
																									MMon = "Demonic Soul"
																									v211 = CFrame.new(-9507, 172, 6158)
																									MPos = v211
																									SP = "Default"
																								else

																									if SelectMaterial == "Vampire Fang" then
																										MMon = "Vampire"
																										v211 = CFrame.new(-6033, 7, -1317)
																										MPos = v211
																										SP = "Default"
																									else

																										if SelectMaterial == "Conjured Cocoa" then
																											MMon = "Chocolate Bar Battler"
																											v211 = CFrame.new(620.63446044921875, 78.936447143554688, -12581.369140625)
																											MPos = v211
																											SP = "Default"
																										else

																											if SelectMaterial == "Dragon Scale" then
																												MMon = "Dragon Crew Archer"
																												v211 = CFrame.new(6594, 383, 139)
																												MPos = v211
																												SP = "Default"
																											else

																												if SelectMaterial == "Gunpowder" then
																													MMon = "Pistol Billionaire"
																													v211 = CFrame.new(-469, 74, 5904)
																													MPos = v211
																													SP = "Default"
																												else

																													if SelectMaterial == "Mini Tusk" then
																														MMon = "Mythological Pirate"
																														v211 = CFrame.new(-13545, 470, -6917)
																														MPos = v211
																														SP = "Default"
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

				function EquipTool(a)
					pcall(function()
						local v213 = _u0()
						v213:EquipTool(_u1.Backpack[_u2])
					end)
				end

				function topos(a)
					Distance = (a.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
					local v214 = game:GetService("TweenService")
					local v215 = game:GetService("Players")
					local v216 = TweenInfo.new(Distance / TweenSpeed, Enum.EasingStyle.Linear)
					v214 = v214:Create(v214, v215.LocalPlayer.Character.HumanoidRootPart, v216, { CFrame = a })
					v214 = v214:Play()
					tween = v214
					_u0.Stop = function(a) tween:Cancel() end
					return _u0
				end

				function fastpos(a)
					Distance = (a.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
					Speed = 1000
					local v217 = game:GetService("TweenService")
					local v218 = game:GetService("Players")
					local v219 = TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear)
					v217 = v217:Create(v217, v218.LocalPlayer.Character.HumanoidRootPart, v219, { CFrame = a })
					v217:Play()
				end

				function slowpos(a)
					Distance = (a.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
					Speed = 150
					local v220 = game:GetService("TweenService")
					local v221 = game:GetService("Players")
					local v222 = TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear)
					v220 = v220:Create(v220, v221.LocalPlayer.Character.HumanoidRootPart, v222, { CFrame = a })
					v220:Play()
				end

				function TPB(a, b)
					local v223 = game:service("TweenService")
					local v224 = TweenInfo.new(((b.CFrame.Position - a.Position).Magnitude) / BoatSpeed, Enum.EasingStyle.Linear)
					local v225 = v223:Create(b, v224, { CFrame = a })
					tween = v225

					if (b.CFrame.Position - a.Position).Magnitude <= 25 then
						tween:Cancel()
					else
						tween:Play()
					end

					_u0.Stop = function(a) tween:Cancel() end
					return _u0
				end

				function TPP(a)
					local v226 = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")

					if v226.Health > 0 then
						v226 = game:GetService("Players")
						v226 = v226.LocalPlayer.Character:WaitForChild("Humanoid")

						if v226 then
						else
							tween:Cancel()

							while true do
								wait()
								v226 = game:GetService("Players")
								v226 = v226.LocalPlayer.Character:WaitForChild("Humanoid")

								if not v226 then
								end

								v226 = game:GetService("Players")
								v226 = v226.LocalPlayer.Character:WaitForChild("Humanoid")

								if 0 < v226.Health then
								end

								wait(7)
								do return end
							end

						end

						v226 = game:service("TweenService")
						local v227 = game:GetService("Players")
						local v228 = TweenInfo.new(((v227.LocalPlayer.Character.HumanoidRootPart.Position - a.Position).Magnitude) / TweenSpeed, Enum.EasingStyle.Linear)
						v227 = v226:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, v228, { CFrame = a })
						tween = v227
						tween:Play()
						return {
							Stop = function(a) tween:Cancel() end,
						}
				end

				function Tween(a)
					if 1 < (a.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
						Speed = 350
					end

					local v229 = game:GetService("TweenService")
					local v230 = v229:Create(Enum.EasingStyle.Linear)
					v229 = v229:Create(v229, game.Players.LocalPlayer.Character.HumanoidRootPart, v230, { CFrame = a })
					v229:Play()

					if not _G.StopTween then
						v229 = game:GetService("TweenService")
						v230 = v229:Create(Enum.EasingStyle.Linear)
						v229 = v229:Create(v229, game.Players.LocalPlayer.Character.HumanoidRootPart, v230, { CFrame = a })
						v229:Cancel()
					end
				end

				function TP2(a)
					if 1 < (a.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
						Speed = 350
					end

					local v231 = game:GetService("TweenService")
					local v232 = v231:Create(Enum.EasingStyle.Linear)
					v231 = v231:Create(v231, game.Players.LocalPlayer.Character.HumanoidRootPart, v232, { CFrame = a })
					v231:Play()

					if not _G.StopTween2 then
						v231 = game:GetService("TweenService")
						v232 = v231:Create(Enum.EasingStyle.Linear)
						v231 = v231:Create(v231, game.Players.LocalPlayer.Character.HumanoidRootPart, v232, { CFrame = a })
						v231:Cancel()
					end

					_G.Clip2 = true
					wait(((a.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude) / Speed)
					_G.Clip2 = false
				end

				function CancelTween(a)
					if a then
						_G.StopTween = true
						wait(0.1)
						local v233 = game:GetService("Players")
						Tween(v233.LocalPlayer.Character.HumanoidRootPart.CFrame)
						wait(0.1)
						_G.StopTween = false
					end
				end

				function BTP(a)
					if 2000 < (a.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
						game.Players.LocalPlayer.Character.Head:Destroy()
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = a
						local v234 = game:GetService("ReplicatedStorage")
						v234.Remotes.CommF_:InvokeServer("SetSpawnPoint")
						wait(1)
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = a
						v234 = game:GetService("ReplicatedStorage")
						v234.Remotes.CommF_:InvokeServer("SetSpawnPoint")
						wait(7)
					else

						if (a.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
							Tween(a)
						end

					end
				end

				function AutoClick()
					local v235 = game:GetService("VirtualUser")
					v235:CaptureController()
					v235 = game:GetService("VirtualUser")
					v235:Button1Down(v235)
				end

				function AutoClick2()
					local v237 = game:GetService("VirtualUser")
					v237:CaptureController()
					v237 = game:GetService("VirtualUser")
					v237:Button1Down(v237)
				end

				task.spawn(function()
					while true do
						local v239 = wait()

						if not v239 then
							v239 = require(game.ReplicatedStorage.Util.CameraShaker)
							v239:Stop()
						end

					end
				end)
				spawn(function()
					while true do
						local v240 = task.wait()

						if not v240 then
							pcall(function()
								if EventLocation then

									if DragonTalonUpgrade then

										if TreeDestroyFarm then

											if TeleportPrehistoric then

												if PurpleBeltF then

													if WhiteBeltF then

														if BlazeEmberFarm then

															if AttackFish then

																if AttackTerrorshark then

																	if AttackGhostship then

																		if AutoSeabeastFarm then

																			if AutoSeaFarm then

																				if DojoClaimQuest then

																					if DojoRequestQuest then

																						if DojoQuestEnable then

																							if AutoSTartRaids then

																								if TeleporttoFruitDealer then

																									if _G.TeleportFruit then

																										if TeleporttoKitsune then

																											if CollectAzureAmber then

																												if AutoTrain then

																													if AutoKillHuman then

																														if AutoPirateCastle then

																															if TweenToPlayer then

																																if AutoSail then

																																	if AutoFarmTerrorShark then

																																		if AutoFarmFish then

																																			if AutoFarmSeaBeast then

																																				if AutoFarmGhostBoats then

																																					if LevelFarmNoQuest then

																																						if LevelFarmQuest then

																																							if Farm_Bone then

																																								if Farm_Ectoplasm then

																																									if Nearest_Farm then

																																										if SelectMonster_Quest_Farm then

																																											if SelectMonster_NoQuest_Farm then

																																												if Auto_Farm_Material then

																																													if AutoFarmBossNoQuest then

																																														if AutoFarmBossQuest then

																																															if GunMastery_Farm then

																																																if DevilMastery_Farm then

																																																	if AutoKenV2 then

																																																		if AutoFarmKen then

																																																			if AutoNextIsland then

																																																				if BossRaid then

																																																					if _G.Teleport_to_Player then

																																																						if _G.Clip then

																																																							if _G.Auto_Kill_Player_Melee then

																																																								if _G.Auto_Kill_Player_Gun then

																																																									if TeleporttoMirage then

																																																										if TeleporttoGear then

																																																											if _G.Auto_Teleport_Fruit then

																																																												if AutoSecondWorld then

																																																													if AutoThirdWorld then

																																																														if AutoDeathStep then

																																																															if AutoSuperhuman then

																																																																if AutoSharkman then

																																																																	if AutoElectricClaw then

																																																																		if AutoDragonTalon then

																																																																			if AutoGodhuman then

																																																																				if AutoSaber then

																																																																					if AutoRengoku then

																																																																						if AutoBuddySword then

																																																																							if AutoPole then

																																																																								if AutoYama then

																																																																									if AutoCavander then

																																																																										if AutoTushita then

																																																																											if Auto_Cursed_Dual_Katana then

																																																																												if Auto_Quest_Yama_1 then

																																																																													if Auto_Quest_Yama_2 then

																																																																														if Auto_Quest_Yama_3 then

																																																																															if Auto_Quest_Tushita_1 then

																																																																																if Auto_Quest_Tushita_2 then

																																																																																	if Auto_Quest_Tushita_3 then

																																																																																		if AutoEliteHunter then

																																																																																			if AutoCakePrince then

																																																																																				if _G.AutoDoughKing then

																																																																																					if AutoDarkDagger then

																																																																																						if AutoHallowSycthe then

																																																																																							if AutoCitizen then

																																																																																								if AutoEvoRace then

																																																																																									if AutoBartilo then

																																																																																										if AutoFactory then

																																																																																											if _G.SwanGlasses then

																																																																																												if RipIndra then

																																																																																													if AutoRainbowHaki then

																																																																																														if AutoTorch then

																																																																																															if AutoSoulGuitar then

																																																																																																if AutoTryLuck then

																																																																																																	if AutoPray then

																																																																																																		if AutoAdvanceDungeon then

																																																																																																			if AutoMusketeer then

																																																																																																				if not Auto_Serpent_Bow then
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																				else
																																																																																																					local v241 = game:GetService("Players")
																																																																																																					v241 = v241.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip")

																																																																																																					if v241 then
																																																																																																						v241 = Instance.new("BodyVelocity")
																																																																																																						v241.Name = "BodyClip"
																																																																																																						local v242 = game:GetService("Players")
																																																																																																						v241.Parent = v242.LocalPlayer.Character.HumanoidRootPart
																																																																																																						v242 = Vector3.new(100000, 100000, 100000)
																																																																																																						v241.MaxForce = v242
																																																																																																						v242 = Vector3.new(0, 0, 0)
																																																																																																						v241.Velocity = v242
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

																	end

																end

															end

														end

													end

												end

											end

										end

									else
										v241 = game:GetService("Players")
										v241 = v241.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip")

										if not v241 then
											v241 = game:GetService("Players")
											v241 = v241.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip")
											v241:Destroy()
										end

									end

								end
							end)
						end

					end
				end)
				spawn(function()
					pcall(function()
						local v243 = game:GetService("RunService")
						v243.Stepped:Connect(function()
							if EventLocation then

								if DragonTalonUpgrade then

									if TreeDestroyFarm then

										if TeleportPrehistoric then

											if PurpleBeltF then

												if WhiteBeltF then

													if BlazeEmberFarm then

														if AttackFish then

															if AttackTerrorshark then

																if AttackGhostship then

																	if AutoSeabeastFarm then

																		if AutoSeaFarm then

																			if DojoClaimQuest then

																				if DojoRequestQuest then

																					if DojoQuestEnable then

																						if AutoSTartRaids then

																							if TeleporttoFruitDealer then

																								if _G.TeleportFruit then

																									if TeleporttoKitsune then

																										if CollectAzureAmber then

																											if AutoTrain then

																												if AutoKillHuman then

																													if AutoPirateCastle then

																														if TweenToPlayer then

																															if AutoSail then

																																if AutoFarmTerrorShark then

																																	if AutoFarmFish then

																																		if AutoFarmSeaBeast then

																																			if AutoFarmGhostBoats then

																																				if LevelFarmNoQuest then

																																					if LevelFarmQuest then

																																						if Farm_Bone then

																																							if Farm_Ectoplasm then

																																								if Nearest_Farm then

																																									if SelectMonster_Quest_Farm then

																																										if SelectMonster_NoQuest_Farm then

																																											if Auto_Farm_Material then

																																												if AutoFarmBossNoQuest then

																																													if AutoFarmBossQuest then

																																														if GunMastery_Farm then

																																															if DevilMastery_Farm then

																																																if AutoKenV2 then

																																																	if AutoFarmKen then

																																																		if AutoNextIsland then

																																																			if BossRaid then

																																																				if _G.Teleport_to_Player then

																																																					if _G.Clip then

																																																						if _G.Auto_Kill_Player_Melee then

																																																							if _G.Auto_Kill_Player_Gun then

																																																								if TeleporttoMirage then

																																																									if TeleporttoGear then

																																																										if _G.Auto_Teleport_Fruit then

																																																											if AutoSecondWorld then

																																																												if AutoThirdWorld then

																																																													if AutoDeathStep then

																																																														if AutoSuperhuman then

																																																															if AutoSharkman then

																																																																if AutoElectricClaw then

																																																																	if AutoDragonTalon then

																																																																		if AutoGodhuman then

																																																																			if AutoSaber then

																																																																				if AutoRengoku then

																																																																					if AutoBuddySword then

																																																																						if AutoPole then

																																																																							if AutoYama then

																																																																								if AutoCavander then

																																																																									if AutoTushita then

																																																																										if Auto_Cursed_Dual_Katana then

																																																																											if Auto_Quest_Yama_1 then

																																																																												if Auto_Quest_Yama_2 then

																																																																													if Auto_Quest_Yama_3 then

																																																																														if Auto_Quest_Tushita_1 then

																																																																															if Auto_Quest_Tushita_2 then

																																																																																if Auto_Quest_Tushita_3 then

																																																																																	if AutoEliteHunter then

																																																																																		if AutoCakePrince then

																																																																																			if _G.AutoDoughKing then

																																																																																				if AutoDarkDagger then

																																																																																					if AutoHallowSycthe then

																																																																																						if AutoCitizen then

																																																																																							if AutoEvoRace then

																																																																																								if AutoBartilo then

																																																																																									if AutoFactory then

																																																																																										if _G.SwanGlasses then

																																																																																											if RipIndra then

																																																																																												if AutoRainbowHaki then

																																																																																													if AutoTorch then

																																																																																														if AutoSoulGuitar then

																																																																																															if AutoTryLuck then

																																																																																																if AutoPray then

																																																																																																	if AutoAdvanceDungeon then

																																																																																																		if AutoMusketeer then

																																																																																																			if not Auto_Serpent_Bow then
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																			else
																																																																																																				local v244 = game:GetService("Players")
																																																																																																				local v245, v244, v246 = _u0(v244.LocalPlayer.Character:GetDescendants())

																																																																																																				while true do
																																																																																																					local v248 = v247:IsA("BasePart")

																																																																																																					if not v248 then
																																																																																																						v247.CanCollide = false
																																																																																																					end

																																																																																																					for v249, v247 in v245, v244, v246 do
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
				end)

				function fastpos(a)
					Distance = (a.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
					Speed = 1000
					local v250 = game:GetService("TweenService")
					local v251 = game:GetService("Players")
					local v252 = TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear)
					v250 = v250:Create(v250, v251.LocalPlayer.Character.HumanoidRootPart, v252, { CFrame = a })
					v250:Play()
				end

				function slowpos(a)
					Distance = (a.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
					Speed = 150
					local v253 = game:GetService("TweenService")
					local v254 = game:GetService("Players")
					local v255 = TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear)
					v253 = v253:Create(v253, v254.LocalPlayer.Character.HumanoidRootPart, v255, { CFrame = a })
					v253:Play()
				end

				function TPB(a, b)
					local v256 = game:service("TweenService")
					local v257 = TweenInfo.new(((b.CFrame.Position - a.Position).Magnitude) / BoatSpeed, Enum.EasingStyle.Linear)
					local v258 = v256:Create(b, v257, { CFrame = a })
					tween = v258

					if (b.CFrame.Position - a.Position).Magnitude <= 25 then
						tween:Cancel()
					else
						tween:Play()
					end

					_u0.Stop = function(a) tween:Cancel() end
					return _u0
				end

				function TPP(a)
					local v259 = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")

					if v259.Health > 0 then
						v259 = game:GetService("Players")
						v259 = v259.LocalPlayer.Character:WaitForChild("Humanoid")

						if v259 then
						else
							tween:Cancel()

							while true do
								wait()
								v259 = game:GetService("Players")
								v259 = v259.LocalPlayer.Character:WaitForChild("Humanoid")

								if not v259 then
								end

								v259 = game:GetService("Players")
								v259 = v259.LocalPlayer.Character:WaitForChild("Humanoid")

								if 0 < v259.Health then
								end

								wait(7)
								do return end
							end

						end

						v259 = game:service("TweenService")
						local v260 = game:GetService("Players")
						local v261 = TweenInfo.new(((v260.LocalPlayer.Character.HumanoidRootPart.Position - a.Position).Magnitude) / TweenSpeed, Enum.EasingStyle.Linear)
						v260 = v259:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, v261, { CFrame = a })
						tween = v260
						tween:Play()
						return {
							Stop = function(a) tween:Cancel() end,
						}
				end

				function AutoClick()
					_u0:CaptureController()
					_u0:Button1Down(_u0)
				end

				function AutoHaki()
					local v263 = game:GetService("Players")
					v263 = v263.LocalPlayer.Character:FindFirstChild("HasBuso")

					if v263 then
						v263 = game:GetService("ReplicatedStorage")
						v263.Remotes.CommF_:InvokeServer("Buso")
					end
				end

				function UnEquipWeapon(a)
					local v264 = game.Players.LocalPlayer.Character:FindFirstChild(a)

					if not v264 then
						_G.NotAutoEquip = true
						wait(0.5)
						v264 = game.Players.LocalPlayer.Character:FindFirstChild(a)
						v264.Parent = game.Players.LocalPlayer.Backpack
						wait(0.1)
						_G.NotAutoEquip = false
					end
				end

				function EquipWeapon(a)
					if _G.NotAutoEquip then
						local v265 = game.Players.LocalPlayer.Backpack:FindFirstChild(a)

						if not v265 then
							v265 = game.Players.LocalPlayer.Backpack:FindFirstChild(a)
							Tool = v265
							wait(0.1)
							game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
						end

					end
				end

				local function v206()
					if BlazeEmberFarm then

						if AttackFish then

							if AttackTerrorshark then

								if AttackGhostship then

									if AutoSeabeastFarm then

										if AutoSeaFarm then

											if DojoClaimQuest then

												if DojoRequestQuest then

													if DojoQuestEnable then

														if AutoSTartRaids then

															if TeleporttoFruitDealer then

																if _G.TeleportFruit then

																	if TeleporttoKitsune then

																		if CollectAzureAmber then

																			if AutoTrain then

																				if AutoKillHuman then

																					if AutoPirateCastle then

																						if TweenToPlayer then

																							if AutoSail then

																								if AutoFarmTerrorShark then

																									if AutoFarmFish then

																										if AutoFarmSeaBeast then

																											if AutoFarmGhostBoats then

																												if LevelFarmNoQuest then

																													if LevelFarmQuest then

																														if Farm_Bone then

																															if Farm_Ectoplasm then

																																if Nearest_Farm then

																																	if SelectMonster_Quest_Farm then

																																		if SelectMonster_NoQuest_Farm then

																																			if Auto_Farm_Material then

																																				if AutoFarmBossNoQuest then

																																					if AutoFarmBossQuest then

																																						if GunMastery_Farm then

																																							if DevilMastery_Farm then

																																								if AutoKenV2 then

																																									if AutoFarmKen then

																																										if AutoNextIsland then

																																											if BossRaid then

																																												if _G.Teleport_to_Player then

																																													if _G.Clip then

																																														if _G.Auto_Kill_Player_Melee then

																																															if _G.Auto_Kill_Player_Gun then

																																																if TeleporttoMirage then

																																																	if TeleporttoGear then

																																																		if _G.Auto_Teleport_Fruit then

																																																			if AutoSecondWorld then

																																																				if AutoThirdWorld then

																																																					if AutoDeathStep then

																																																						if AutoSuperhuman then

																																																							if AutoSharkman then

																																																								if AutoElectricClaw then

																																																									if AutoDragonTalon then

																																																										if AutoGodhuman then

																																																											if AutoSaber then

																																																												if AutoRengoku then

																																																													if AutoBuddySword then

																																																														if AutoPole then

																																																															if AutoYama then

																																																																if AutoCavander then

																																																																	if AutoTushita then

																																																																		if Auto_Cursed_Dual_Katana then

																																																																			if Auto_Quest_Yama_1 then

																																																																				if Auto_Quest_Yama_2 then

																																																																					if Auto_Quest_Yama_3 then

																																																																						if Auto_Quest_Tushita_1 then

																																																																							if Auto_Quest_Tushita_2 then

																																																																								if Auto_Quest_Tushita_3 then

																																																																									if AutoEliteHunter then

																																																																										if AutoCakePrince then

																																																																											if _G.AutoDoughKing then

																																																																												if AutoDarkDagger then

																																																																													if AutoHallowSycthe then

																																																																														if AutoCitizen then

																																																																															if AutoEvoRace then

																																																																																if AutoBartilo then

																																																																																	if AutoFactory then

																																																																																		if _G.SwanGlasses then

																																																																																			if RipIndra then

																																																																																				if AutoRainbowHaki then

																																																																																					if AutoTorch then

																																																																																						if AutoSoulGuitar then

																																																																																							if AutoTryLuck then

																																																																																								if AutoPray then

																																																																																									if AutoAdvanceDungeon then

																																																																																										if AutoMusketeer then
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

						end

					end

					return Auto_Serpent_Bow
				end

				local function v266()
					local v267 = game:GetService("Players")
					local v268 = _u0()

					if not v268 then
						v268 = v267.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip")

						if v268 then
							v268 = Instance.new("BodyVelocity")
							v268.Name = "BodyClip"
							v268.Parent = v267.LocalPlayer.Character.HumanoidRootPart
							local v269 = Vector3.new(100000, 100000, 100000)
							v268.MaxForce = v269
							v269 = Vector3.new(0, 0, 0)
							v268.Velocity = v269
						else
							v268 = v267.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip")

							if not v268 then
								v268 = v267.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip")
								v268:Destroy()
							end

						end

					end
				end

				spawn(function()
					while true do
						local v270 = wait()

						if not v270 then
							pcall(_u0)
						end

					end
				end)
				spawn(function()
					pcall(function()
						local v271 = game:GetService("RunService")
						v271.Stepped:Connect(function()
							local v272 = _u0()

							if not v272 then
								local v273 = game:GetService("Players")
								local v272, v273, v274 = _u1(v273.LocalPlayer.Character:GetDescendants())

								while true do
									local v276 = v275:IsA("BasePart")

									if not v276 then
										v275.CanCollide = false
									end

									for v277, v275 in v272, v273, v274 do
									end

								end
						end)
					end)
				end)
				spawn(function()
					while true do
						local v278 = task.wait()

						if not v278 then
							pcall(function() _u0() end)
						end

					end
				end)
				spawn(function()
					pcall(function()
						local v279 = game:GetService("RunService")
						v279.Stepped:Connect(function()
							local v280 = _u0()

							if not v280 then
								local v281 = game:GetService("Players")
								local v280, v281, v282 = _u1(v281.LocalPlayer.Character:GetDescendants())

								while true do
									local v284 = v283:IsA("BasePart")

									if not v284 then
										v283.CanCollide = false
									end

									for v285, v283 in v280, v281, v282 do
									end

								end
						end)
					end)
				end)
				spawn(function()
					while true do
						local v286 = task.wait()

						if not v286 then

							if _G.Auto_StartRaid then

								if AutoNextIsland then

									if AutoSTartRaids then

										if _G.Auto_Next_Island then

											if AutoKillTial then

												if _G.Farmfast then

													if _G.AutoFarmAllBoss then

														if _G.AutoPirateRaid then

															if AutoQuestRace then

																if StardFarm then

																	if _G.TeleportKitsune then

																		if _G.Kill_Aura then

																			if _G.Auto_Start_Law_Dungeon then

																				if _G.AutoHakiSpam then

																					if LevelFarmQuest then

																						if LevelFarmQuestFruitMastery then

																							if LevelFarmQuestSwanGlasses then

																								if LevelFarmQuestBossHallow then

																									if _G.AutoRaid then

																										if _G.BoneFarm then

																											if _G.AutoRemover then

																												if _G.AutoSail then

																													if _G.TerShark then

																														if _G.Sharky then

																															if _G.Piranas then

																																if _G.FishBoat then

																																	if _G.BrigadeShip then

																																		if _G.BrigadeShips then

																																			if not _G.Beast then
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

							end

							pcall(function() AutoHaki() end)
						end

					end
				end)
				spawn(function()
					pcall(function()
						local v287 = game:GetService("RunService")
						v287.Stepped:Connect(function()
							if _G.Auto_StartRaid then

								if AutoNextIsland then

									if AutoSTartRaids then

										if _G.Auto_Next_Island then

											if _G.Kill_Aura then

												if _G.Farmfast then

													if _G.AutoFarmAllBoss then

														if _G.SailBoat then

															if _G.AutoPirateRaid then

																if AutoKillTial then

																	if AutoQuestRace then

																		if StardFarm then

																			if _G.TeleportKitsune then

																				if _G.Auto_Start_Law_Dungeon then

																					if _G.BoneFarm then

																						if _G.AutoRemover then

																							if _G.AutoSail then

																								if _G.TerShark then

																									if _G.Sharky then

																										if _G.Piranas then

																											if _G.FishBoat then

																												if _G.BrigadeShip then

																													if _G.BrigadeShips then

																														if not _G.Beast then
																														else
																														else
																														else
																														else
																														else
																														else
																														else
																														else
																														else
																														else
																														else
																														else
																														else
																														else
																														else
																														else
																														else
																														else
																														else
																														else
																														else
																														else
																														else
																															local v288 = game:GetService("Players")
																															v288 = v288.LocalPlayer.Character:FindFirstChild("Humanoid")

																															if v288 then
																																setfflag("HumanoidParallelRemoveNoPhysics", "False")
																																setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
																																setfflag("CrashPadUploadToBacktraceToBacktraceBaseUrl", "")
																																setfflag("CrashUploadToBacktracePercentage", "0")
																																setfflag("CrashUploadToBacktraceBlackholeToken", "")
																																setfflag("CrashUploadToBacktraceWindowsPlayerToken", "")
																																v288 = _u0()
																																v288:ChangeState(11)
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
					end)
				end)
				local v289 = v57:AddSection("", "Main Farm", "auto farm level,auto sea,farm near, etc..", "rbxassetid://10734975692")
				v289:AddToggle("Auto Farm Level", LevelFarmQuest, function(a)
					LevelFarmQuest = a
					_G.SelectMonster = nil
					CancelTween(LevelFarmQuest)
				end)
				v289:AddToggle("Auto Farm Level No Quest", LevelFarmNoQuest, function(a)
					LevelFarmNoQuest = a
					_G.SelectMonster = nil
					CancelTween(LevelFarmNoQuest)
				end)
				v289:AddToggle("Farm Near Monster", Nearest_Farm, function(a)
					Nearest_Farm = a
					CancelTween(Nearest_Farm)
				end)

				if not First_Sea then
					v289:AddToggle("Auto Second World [Lv. 700]", AutoSecondWorld, function(a)
						AutoSecondWorld = a
						CancelTween(AutoSecondWorld)
					end)
				else

					if not Second_Sea then
						v289:AddToggle("Auto Third World [Lv. 1500]", AutoThirdWorld, function(a)
							AutoThirdWorld = a
							CancelTween(AutoThirdWorld)
						end)
					end

				end

				if not Third_Sea then
					v289:AddToggle("Auto Pirate Raid", _G["AutoPirateRaid"], function(a)
						_G.AutoPirateRaid = a
						CancelTween(_G.AutoPirateRaid)
					end)
				end

				spawn(function()
					while true do
						local v290 = wait()

						if not v290 then

							if not _G.AutoPirateRaid then
							end

							pcall(function()
								local v291 = CFrame.new(-5496.17432, 313.768921, -2841.53027, 0.924894512, 7.37058015e-09, 0.380223751, 3.5881019e-08, 1, -1.06665446e-07, -0.380223751, 1.12297109e-07, 0.924894512)
								local v292 = CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125)

								if (v292.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
									local v293 = game:GetService("Workspace")
									local v292, v293, v294 = _u0(v293.Enemies:GetChildren())

									while true do

										if not _G.AutoPirateRaid then
											local v295 = 7.37058015e-09:FindFirstChild("HumanoidRootPart")

											if not v295 then
												v295 = 7.37058015e-09:FindFirstChild("Humanoid")

												if not v295 then

													if 0 < 7.37058015e-09.Humanoid.Health then

														if (7.37058015e-09.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then

															while true do
																wait()

																if (_u1.LocalPlayer.Character.HumanoidRootPart.Position - 7.37058015e-09.HumanoidRootPart.Position).Magnitude <= 100 then
																	EquipTool(SelectWeaponFarm)
																end

																Tween(7.37058015e-09.HumanoidRootPart.CFrame * Farm_Mode)
																7.37058015e-09.HumanoidRootPart.CanCollide = false
																local v296 = Vector3.new(60, 60, 60)
																7.37058015e-09.HumanoidRootPart.Size = v296
																7.37058015e-09.HumanoidRootPart.Transparency = 1
																7.37058015e-09.Humanoid:ChangeState(11)
																7.37058015e-09.Humanoid:ChangeState(14)
																piratename = 7.37058015e-09.Name
																pirateframe = 7.37058015e-09.HumanoidRootPart.CFrame
																AutoClick()

																if 7.37058015e-09.Humanoid.Health > 0 then

																	if not 7.37058015e-09.Parent then

																		if _G.AutoPirateRaid == false then
																		end

																	end

																end

															end

														end

													end

												end

											end

											for v297, v298 in v292, v293, v294 do
											end

										else

											if (v291.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 1500 then
												Tween(v291)
											else
												BTP(v291)
											end

										end
							end)
						end

					end
				end)
				spawn(function()
					while true do
						local v299 = task.wait()

						if not v299 then

							if not LevelFarmQuest then
							end

							pcall(function()
								CheckLevel()
								local v300 = game:GetService("Players")
								local v301 = string.find(v300.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon)

								if not v301 then
									v301 = game:GetService("Players")

									if v301.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
									else
										v301 = game:GetService("ReplicatedStorage")
										v301.Remotes.CommF_:InvokeServer("AbandonQuest")

										if not _u0 then
											BTP(CFrameQ)
										else

											if _u0 then
												Tween(CFrameQ)
											end

										end

										if (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
											wait(1)
											v301 = game:GetService("ReplicatedStorage")
											v301.Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
										end

									else
										v300 = game:GetService("Players")
										v301 = string.find(v300.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon)

										if v301 then
											v301 = game:GetService("Players")

											if v301.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
											else
												v301 = game:GetService("Workspace")
												v301 = v301.Enemies:FindFirstChild(Ms)

												if not v301 then
													v300 = game:GetService("Workspace")
													local v301, v300, v302 = _u1(v300.Enemies:GetChildren())

													while true do
														local v303 = QuestLv:FindFirstChild("Humanoid")

														if not v303 then
															v303 = QuestLv:FindFirstChild("HumanoidRootPart")

															if not v303 then

																if 0 < QuestLv.Humanoid.Health then

																	if QuestLv.Name == Ms then

																		while true do
																			v303 = game:GetService("RunService")
																			v303.Heartbeat:wait()
																			EquipTool(SelectWeapon)
																			Tween(QuestLv.HumanoidRootPart.CFrame * Farm_Mode)
																			QuestLv.HumanoidRootPart.CanCollide = false
																			local v304 = Vector3.new(60, 60, 60)
																			QuestLv.HumanoidRootPart.Size = v304
																			QuestLv.HumanoidRootPart.Transparency = 1
																			Level_Farm_Name = QuestLv.Name
																			Level_Farm_CFrame = QuestLv.HumanoidRootPart.CFrame
																			AutoClick()

																			if not LevelFarmQuest then

																				if not QuestLv.Parent then

																					if QuestLv.Humanoid.Health > 0 then
																						v303 = game:GetService("Workspace")
																						v303 = v303.Enemies:FindFirstChild(QuestLv.Name)

																						if not v303 then

																							if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
																							end

																						end

																					end

																				end

																			end

																		end

																	end

																end

															end

															for v305, v306 in v301, v300, v302 do
															end

														else
															Tween(CFrameMon)
														end

													end

												end

											end

										end
							end)
						end

					end
				end)
				spawn(function()
					while true do
						local v307 = task.wait()

						if not v307 then

							if not LevelFarmNoQuest then
							end

							pcall(function()
								CheckLevel()
								local v308 = game.Workspace.Enemies:FindFirstChild(Ms)

								if not v308 then
									local v308, v309, v310 = _u0(game.Workspace.Enemies:GetChildren())

									while true do

										if v311.Name == Ms then
											local v312 = v311:FindFirstChild("Humanoid")

											if not v312 then
												v312 = v311:FindFirstChild("HumanoidRootPart")

												if not v312 then

													if 0 < v311.Humanoid.Health then

														while true do
															v312 = game:GetService("RunService")
															v312.Heartbeat:wait()
															EquipTool(SelectWeapon)
															Tween(v311.HumanoidRootPart.CFrame * Farm_Mode)
															v311.HumanoidRootPart.CanCollide = false
															local v313 = Vector3.new(60, 60, 60)
															v311.HumanoidRootPart.Size = v313
															v311.HumanoidRootPart.Transparency = 1
															Level_Farm_Name = v311.Name
															Level_Farm_CFrame = v311.HumanoidRootPart.CFrame
															AutoClick()

															if not LevelFarmNoQuest then

																if not v311.Parent then

																	if v311.Humanoid.Health > 0 then
																		v312 = game:GetService("Workspace")
																		v312 = v312.Enemies:FindFirstChild(v311.Name)

																		if v312 then
																		end

																	end

																end

															end

														end

													end

												end

											end

											for v314, v311 in v308, v309, v310 do
											end

										else

											if not _u1 then
												BTP(CFrameMon)
											else

												if _u1 then
													Tween(CFrameMon)
												end

											end

										end
							end)
						end

					end
				end)
				local v315 = v57:AddSection("", "Christmas Event", "Auto collect gifts,auto buy", "rbxassetid://79775211258613")
				local v316 = v315:AddLabel("")
				spawn(function()
					while true do
						local v317 = task.wait()

						if not v317 then
							local v318 = _u0:Set()
							_u0:Set(_u0, "Event Countdown : " .. v318)
						end

					end
				end)
				v315:AddToggle("Auto Claim Gift", AutoClaimGift, function() AutoClaimGift = Value end)
				spawn(function()
					while true do
						local v319 = task.wait()

						if not v319 then

							if not AutoClaimGift then
							end

							pcall(function()
								local v321, v320, v322 = _u0(game.Workspace._WorldOrigin:GetChildren())

								while true do

									if v323.Name == "Present" then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v323.Root.CFrame
										wait(0.1)
										local v324 = game:service("VirtualInputManager")
										v324:SendKeyEvent(true, "E", false, game)
										wait(0.1)
										v324 = game:service("VirtualInputManager")
										v324:SendKeyEvent(false, "E", false, game)
									end

									for v325, v323 in v321, v320, v322 do
									end
							end)
						end

					end
				end)
				v315:AddToggle("Auto Store Gift", AutoStoreGift, function() AutoStoreGift = Value end)
				spawn(function()
					while true do
						local v326 = task.wait()

						if not v326 then

							if not AutoStoreGift then
							end

							pcall(function()
								function EquipTool(a)
									pcall(function()
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack[_u0])
									end)
								end

								local v328, v327, v329 = _u0(game.Players.LocalPlayer.Backpack:GetChildren())

								while true do
									local v331 = v330:IsA("Tool")

									if not v331 then
										v331 = string.find(v330.Name, "Gift")

										if not v331 then
											EquipTool(v330.Name)
										end

									end

									for v332, v330 in v328, v327, v329 do
									end

									wait(0.1)
									local v328, v327, v329 = _u0(game.Players.LocalPlayer.Character:GetChildren())

									while true do
										v331 = v330:IsA("Tool")

										if not v331 then
											v331 = string.find(v330.Name, "Gift")

											if not v331 then
												v331 = game.Players.LocalPlayer.Character:FindFirstChild(v330.Name)
												v331.ConsumeEvent:InvokeServer("Display")
												wait(0.1)
												v331 = game:GetService("ReplicatedStorage")
												v331.Remotes.CommF_:InvokeServer("StoreHolidayGift")
											end

										end

										for v332, v330 in v328, v327, v329 do
										end
							end)
						end

					end
				end)
				v315:AddToggle("Auto Buy 2x Candies", false, function(a)
					autoBuyX2 = a

					if not autoBuyX2 then
						spawn(function()
							while true do

								if not autoBuyX2 then
									local v333 = game:GetService("ReplicatedStorage")
									v333 = v333:WaitForChild("Remotes")
									v333 = v333:WaitForChild("CommF_")
									v333:InvokeServer(v333)
									task.wait(1)
								end

							end
						end)
					end
				end)
				v315:AddToggle("Auto Buy 200 Fragments", false, function(a)
					autoBuyFragments = a

					if not autoBuyFragments then
						spawn(function()
							while true do

								if not autoBuyFragments then
									local v336 = game:GetService("ReplicatedStorage")
									v336 = v336:WaitForChild("Remotes")
									v336 = v336:WaitForChild("CommF_")
									v336:InvokeServer(v336)
									task.wait(1)
								end

							end
						end)
					end
				end)
				v315:Button("Teleport to Events", function()
					Tween(CFrame.new(-1095.96472, 64.4006958, -14519.3809, 0.763202608, 7.23753928e-08, 0.646159291, -2.14145039e-08, 1, -8.671514e-08, -0.646159291, 5.23440384e-08, 0.763202608))
				end)
				v315:AddLabel("Shops")
				v315:Button("Buy 2xp [50 Candy]", function(a)
					local v340 = game:GetService("ReplicatedStorage")
					v340 = v340:WaitForChild("Remotes")
					v340 = v340:WaitForChild("CommF_")
					v340:InvokeServer(v340)
				end)
				v315:Button("Buy Stat Reset [75 Candy]", function(a)
					local v343 = game:GetService("ReplicatedStorage")
					v343 = v343:WaitForChild("Remotes")
					v343 = v343:WaitForChild("CommF_")
					v343:InvokeServer(v343)
				end)
				v315:Button("Race Reroll [100 Candy]", function(a)
					local v346 = game:GetService("ReplicatedStorage")
					v346 = v346:WaitForChild("Remotes")
					v346 = v346:WaitForChild("CommF_")
					v346:InvokeServer(v346)
				end)
				v315:Button("200 Fragments [50 Candy]", function(a)
					local v349 = game:GetService("ReplicatedStorage")
					v349 = v349:WaitForChild("Remotes")
					v349 = v349:WaitForChild("CommF_")
					v349:InvokeServer(v349)
				end)
				v315:Button("500 Fragments [100 Candy]", function(a)
					local v352 = game:GetService("ReplicatedStorage")
					v352 = v352:WaitForChild("Remotes")
					v352 = v352:WaitForChild("CommF_")
					v352:InvokeServer(v352)
				end)
				v315:Button("Elf Hat [250 Candy]", function(a)
					local v355 = game:GetService("ReplicatedStorage")
					v355 = v355:WaitForChild("Remotes")
					v355 = v355:WaitForChild("CommF_")
					v355:InvokeServer(v355)
				end)
				v315:Button("Santa Hat [500 Candy]", function(a)
					local v358 = game:GetService("ReplicatedStorage")
					v358 = v358:WaitForChild("Remotes")
					v358 = v358:WaitForChild("CommF_")
					v358:InvokeServer(v358)
				end)
				v315:Button("Sleigh [1000 Candy]", function(a)
					local v361 = game:GetService("ReplicatedStorage")
					v361 = v361:WaitForChild("Remotes")
					v361 = v361:WaitForChild("CommF_")
					v361:InvokeServer(v361)
				end)
				local v364 = v57:AddSection("", "Other Farm", "Auto Bones,Ectoplasm", "rbxassetid://10709781605")

				if not Third_Sea then
					local v365 = v364:AddLabel("Your Bone: Third World ")
					BoneCheck = v365
					spawn(function()
						while true do
							local v366 = task.wait()

							if not v366 then
								pcall(function()
									local v367 = _u0.Remotes.CommF_:InvokeServer("Bones", "Check")
									BoneCheck:Set(BoneCheck, "Your Bone: " .. v367)
								end)
							end

						end
					end)
					v364:AddToggle("Buy Random Surprise (Bone)", Auto_Trade_Bone, function(a)
						Auto_Trade_Bone = a

						while true do

							if not Auto_Trade_Bone then
								task.wait()
								_u0.Remotes.CommF_:InvokeServer(_u0.Remotes.CommF_)
							end

						end
					end)
					v364:AddToggle("Auto Farm Bones", Farm_Bone, function(a)
						Farm_Bone = a
						CancelTween(Farm_Bone)
					end)
				end

				spawn(function()
					while true do
						local v370 = task.wait()

						if not v370 then

							if not Farm_Bone then
							end

							pcall(function()
								local v371 = CFrame.new(-9508.5673828125, 142.13984680175781, 5737.3603515625)

								if not _u0 then
									BTP(v371)
								else

									if _u0 then
										Tween(v371)
									end

								end

								local v373, v372, v374 = _u1(game.Workspace.Enemies:GetChildren())

								while true do
									local v376 = v375:FindFirstChild("Humanoid")

									if not v376 then
										v376 = v375:FindFirstChild("HumanoidRootPart")

										if not v376 then

											if 0 < v375.Humanoid.Health then

												if v375.Name ~= "Reborn Skeleton" then

													if v375.Name ~= "Living Zombie" then

														if v375.Name ~= "Demonic Soul" then

															if v375.Name == "Posessed Mummy" then
															else
															else
															else

																while true do
																	task.wait()
																	EquipTool(SelectWeaponFarm)
																	Tween(v375.HumanoidRootPart.CFrame * Farm_Mode)
																	v375.HumanoidRootPart.CanCollide = false
																	local v377 = Vector3.new(60, 60, 60)
																	v375.HumanoidRootPart.Size = v377
																	v375.HumanoidRootPart.Transparency = 1
																	v375.Humanoid:ChangeState(11)
																	v375.Humanoid:ChangeState(14)
																	Bone_Farm_Name = v375.Name
																	Bone_Farm_CFrame = v375.HumanoidRootPart.CFrame
																	AutoClick()

																	if not Farm_Bone then

																		if not v375.Parent then

																			if v375.Humanoid.Health > 0 then
																				v376 = game.Workspace.Enemies:FindFirstChild(v375.Name)

																				if v376 then
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

										for v378, v375 in v373, v372, v374 do
										end

										local v373, v372, v374 = _u1(_u2:GetChildren())

										while true do

											if v375.Name == "Reborn Skeleton" then
												Tween(v375.HumanoidRootPart.CFrame * Farm_Mode)
											else

												if v375.Name == "Living Zombie" then
													Tween(v375.HumanoidRootPart.CFrame * Farm_Mode)
												else

													if v375.Name == "Demonic Soul" then
														Tween(v375.HumanoidRootPart.CFrame * Farm_Mode)
													else

														if v375.Name == "Posessed Mummy" then
															Tween(v375.HumanoidRootPart.CFrame * Farm_Mode)
														end

													end

												end

											end

											for v378, v375 in v373, v372, v374 do
											end
							end)
						end

					end
				end)

				if not Second_Sea then
					v365 = v364:AddLabel("Your Ectoplasm: ")
					Ectoplasm12 = v365
					spawn(function()
						while true do
							local v379 = task.wait()

							if not v379 then
								pcall(function()
									local v380 = _u0.Remotes.CommF_:InvokeServer("Ectoplasm", "Check")
									Ectoplasm12:Set(Ectoplasm12, "Your Ectoplasm: " .. v380)
								end)
							end

						end
					end)
					v364:AddToggle("Auto Farm Ectoplasm", Farm_Ectoplasm, function(a)
						Farm_Ectoplasm = a
						CancelTween(Farm_Ectoplasm)
					end)
					v364:Button("Auto Buy Midnight Blade [100 Ectoplasm]", function()
						local v381 = game:GetService("ReplicatedStorage")
						v381.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 3)
					end)
					v364:Button("Auto Buy Ghoul Mask [50 Ectoplasm]", function()
						local v382 = game:GetService("ReplicatedStorage")
						v382.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 2)
					end)
					v364:Button("Auto Buy Bizzare Rifle [100 Ectoplasm]", function()
						local v383 = game:GetService("ReplicatedStorage")
						v383.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 1)
					end)
				end

				spawn(function()
					while true do
						local v384 = task.wait()

						if not v384 then

							if not Farm_Ectoplasm then
							end

							pcall(function()
								local v385 = CFrame.new(904.4072265625, 181.05767822266, 33341.38671875)

								if not _u0 then
									BTP(v385)
								else

									if _u0 then
										Tween(v385)
									end

								end

								local v386 = Vector3.new(904.4072265625, 181.05767822266, 33341.38671875)
								local v387 = _u1()

								if 20000 < (v386 - v387.Position).Magnitude then
									_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
								end

								local v388 = game:GetService("Workspace")
								local v387, v388, v389 = _u3(v388.Enemies:GetChildren())

								while true do
									local v390 = 923.21252441406:FindFirstChild("Humanoid")

									if not v390 then
										v390 = 923.21252441406:FindFirstChild("HumanoidRootPart")

										if not v390 then

											if 0 < 923.21252441406.Humanoid.Health then

												if 923.21252441406.Name ~= "Ship Steward" then

													if 923.21252441406.Name ~= "Ship Engineer" then

														if 923.21252441406.Name ~= "Ship Deckhand" then

															if 923.21252441406.Name == "Ship Officer" then
															else
															else
															else

																while true do
																	task.wait()
																	EquipTool(SelectWeaponFarm)
																	Tween(923.21252441406.HumanoidRootPart.CFrame * Farm_Mode)
																	923.21252441406.HumanoidRootPart.CanCollide = false
																	local v391 = Vector3.new(60, 60, 60)
																	923.21252441406.HumanoidRootPart.Size = v391
																	923.21252441406.HumanoidRootPart.Transparency = 1
																	923.21252441406.Humanoid:ChangeState(11)
																	923.21252441406.Humanoid:ChangeState(14)
																	Ecto_Farm_Name = 923.21252441406.Name
																	Ecto_Farm_CFrame = 923.21252441406.HumanoidRootPart.CFrame
																	AutoClick()

																	if not Farm_Ectoplasm then

																		if not 923.21252441406.Parent then

																			if 923.21252441406.Humanoid.Health > 0 then
																				v390 = game:GetService("Workspace")
																				v390 = v390.Enemies:FindFirstChild(923.21252441406.Name)

																				if v390 then
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

										for v392, v393 in v387, v388, v389 do
										end

										local v387, v388, v389 = _u3(_u2:GetChildren())

										while true do

											if 923.21252441406.Name == "Ship Steward" then
												Tween(923.21252441406.HumanoidRootPart.CFrame * Farm_Mode)
											else

												if 923.21252441406.Name == "Ship Engineer" then
													Tween(923.21252441406.HumanoidRootPart.CFrame * Farm_Mode)
												else

													if 923.21252441406.Name == "Ship Deckhand" then
														Tween(923.21252441406.HumanoidRootPart.CFrame * Farm_Mode)
													else

														if 923.21252441406.Name == "Ship Officer" then
															Tween(923.21252441406.HumanoidRootPart.CFrame * Farm_Mode)
														end

													end

												end

											end

											for v392, v393 in v387, v388, v389 do
											end
							end)
						end

					end
				end)
				spawn(function()
					while true do
						local v394 = task.wait()

						if not v394 then

							if not Nearest_Farm then
							end

							pcall(function()
								local v396, v395, v397 = _u0(game.Workspace.Enemies:GetChildren())

								while true do
									local v399 = v398:FindFirstChild("Humanoid")

									if not v399 then
										v399 = v398:FindFirstChild("HumanoidRootPart")

										if not v399 then

											if 0 < v398.Humanoid.Health then

												if not v398.Name then
													v399 = _u1()

													if (v399.Position - v398.HumanoidRootPart.Position).Magnitude <= 1000 then

														while true do
															task.wait()
															EquipTool(SelectWeaponFarm)
															Tween(v398.HumanoidRootPart.CFrame * Farm_Mode)
															v398.HumanoidRootPart.CanCollide = false
															local v400 = Vector3.new(60, 60, 60)
															v398.HumanoidRootPart.Size = v400
															v398.HumanoidRootPart.Transparency = 1
															v398.Humanoid:ChangeState(11)
															v398.Humanoid:ChangeState(14)
															Nearest_Farm_Name = v398.Name
															Nearest_Farm_CFrame = v398.HumanoidRootPart.CFrame
															AutoClick()

															if not Nearest_Farm then

																if not v398.Parent then

																	if v398.Humanoid.Health > 0 then
																		v399 = game.Workspace.Enemies:FindFirstChild(v398.Name)

																		if v399 then
																		end

																	end

																end

															end

														end

													end

												end

											end

										end

										for v401, v398 in v396, v395, v397 do
										end
							end)
						end

					end
				end)
				v365 = v57:AddSection("", "Mob Farm", "auto farm select monster quest/no quest", "rbxassetid://10747372992")
				v365:AddDropdown("Select Monster", tableMon, "", function(a) _G.SelectMonster = a end)
				v365:AddToggle("Auto Farm Select (Quest)", SelectMonster_Quest_Farm, function(a)
					SelectMonster_Quest_Farm = a
					CancelTween(SelectMonster_Quest_Farm)
				end)
				spawn(function()
					while true do
						local v402 = task.wait()

						if not v402 then

							if not SelectMonster_Quest_Farm then
							end

							pcall(function()
								CheckLevel(_G.SelectMonster)
								local v403 = string.find(_u0.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon)

								if not v403 then

									if _u0.PlayerGui.Main.Quest.Visible == false then
									else
										_u1.Remotes.CommF_:InvokeServer("AbandonQuest")

										if not _u2 then
											BTP(CFrameQ)
										else

											if _u2 then
												Tween(CFrameQ)
											end

										end

										local v404 = _u3()

										if (CFrameQ.Position - v404.Position).Magnitude <= 5 then
											_u1.Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
										end

									else
										v403 = string.find(_u0.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon)

										if v403 then

											if _u0.PlayerGui.Main.Quest.Visible == true then
											else
												v403 = game:GetService("Workspace")
												v403 = v403.Enemies:FindFirstChild(Ms)

												if not v403 then
													v404 = game:GetService("Workspace")
													local v403, v404, v405 = _u4(v404.Enemies:GetChildren())

													while true do
														local v406 = QuestLv:FindFirstChild("Humanoid")

														if not v406 then
															v406 = QuestLv:FindFirstChild("HumanoidRootPart")

															if not v406 then

																if 0 < QuestLv.Humanoid.Health then

																	if QuestLv.Name == Ms then

																		while true do
																			task.wait()
																			EquipTool(SelectWeaponFarm)
																			Tween(QuestLv.HumanoidRootPart.CFrame * Farm_Mode)
																			QuestLv.HumanoidRootPart.CanCollide = false
																			local v407 = Vector3.new(60, 60, 60)
																			QuestLv.HumanoidRootPart.Size = v407
																			QuestLv.HumanoidRootPart.Transparency = 1
																			QuestLv.Humanoid:ChangeState(11)
																			QuestLv.Humanoid:ChangeState(14)
																			SelectMonster_Farm_Name = QuestLv.Name
																			SelectMonster_Farm_CFrame = QuestLv.HumanoidRootPart.CFrame
																			AutoClick()

																			if not SelectMonster_Quest_Farm then

																				if not QuestLv.Parent then

																					if QuestLv.Humanoid.Health > 0 then
																						v406 = game:GetService("Workspace")
																						v406 = v406.Enemies:FindFirstChild(QuestLv.Name)

																						if not v406 then

																							if _u0.PlayerGui.Main.Quest.Visible == false then
																							end

																						end

																					end

																				end

																			end

																		end

																	end

																end

															end

															for v408, v409 in v403, v404, v405 do
															end

														else
															Tween(CFrameMon)
														end

													end

												end

											end

										end
							end)
						end

					end
				end)
				v365:AddToggle("Auto Farm Select (No Quest)", SelectMonster_NoQuest_Farm, function(a)
					SelectMonster_NoQuest_Farm = a
					CancelTween(SelectMonster_NoQuest_Farm)
				end)
				spawn(function()
					while true do
						local v410 = task.wait()

						if not v410 then

							if not SelectMonster_NoQuest_Farm then
							end

							pcall(function()
								CheckLevel(_G.SelectMonster)

								if not _u0 then
									BTP(CFrameQ)
								else

									if _u0 then
										Tween(CFrameQ)
									end

								end

								local v411 = game:GetService("Workspace")
								v411 = v411.Enemies:FindFirstChild(Ms)

								if not v411 then
									local v412 = game:GetService("Workspace")
									local v411, v412, v413 = _u1(v412.Enemies:GetChildren())

									while true do
										local v415 = v414:FindFirstChild("Humanoid")

										if not v415 then
											v415 = v414:FindFirstChild("HumanoidRootPart")

											if not v415 then

												if 0 < v414.Humanoid.Health then

													if v414.Name == Ms then

														while true do
															task.wait()
															EquipTool(SelectWeaponFarm)
															Tween(v414.HumanoidRootPart.CFrame * Farm_Mode)
															v414.HumanoidRootPart.CanCollide = false
															local v416 = Vector3.new(60, 60, 60)
															v414.HumanoidRootPart.Size = v416
															v414.HumanoidRootPart.Transparency = 1
															v414.Humanoid:ChangeState(11)
															v414.Humanoid:ChangeState(14)
															SelectMonster_Farm_Name = v414.Name
															SelectMonster_Farm_CFrame = v414.HumanoidRootPart.CFrame
															AutoClick()

															if not SelectMonster_NoQuest_Farm then

																if not v414.Parent then

																	if v414.Humanoid.Health > 0 then
																		v415 = game:GetService("Workspace")
																		v415 = v415.Enemies:FindFirstChild(v414.Name)

																		if v415 then
																		end

																	end

																end

															end

														end

													end

												end

											end

											for v417, v414 in v411, v412, v413 do
											end

										else
											Tween(CFrameMon)
										end
							end)
						end

					end
				end)
				local v418 = v57:AddSection("", "Material Farm", "auto farm any materials any sea", "rbxassetid://10734907933")

				if not First_Sea then
					MaterialList = { "Scrap Metal", "Leather", "Angel Wings", "Magma Ore", "Fish Tail" }
				else

					if not Second_Sea then
						MaterialList = { "Scrap Metal", "Leather", "Radioactive Material", "Mirage Droplet", "Magma Ore", "Vampire Fang" }
					else

						if not Third_Sea then
							MaterialList = {
								"Scrap Metal",
								"Leather",
								"Demonic Wisp",
								"Conjured Cocoa",
								"Dragon Scale",
								"Gunpowder",
								"Fish Tail",
								"Mini Tusk",
							}
						end

					end

				end

				v418:AddDropdown("Select Material", MaterialList, "", function(a) SelectMaterial = a end)
				v418:AddToggle("Auto Farm Material", Auto_Farm_Material, function(a)
					Auto_Farm_Material = a
					CancelTween(Auto_Farm_Material)
				end)
				spawn(function()
					while true do
						local v419 = task.wait()

						if not v419 then

							if not Auto_Farm_Material then
							end

							pcall(function()
								MaterialMon(SelectMaterial)

								if not _u0 then
									BTP(MPos)
								else

									if _u0 then
										Tween(MPos)
									end

								end

								local v421, v420, v422 = _u1(game.Workspace.Enemies:GetChildren())

								while true do
									local v424 = v423:FindFirstChild("Humanoid")

									if not v424 then
										v424 = v423:FindFirstChild("HumanoidRootPart")

										if not v424 then

											if 0 < v423.Humanoid.Health then

												if v423.Name == MMon then

													while true do
														task.wait()
														EquipTool(SelectWeaponFarm)
														Tween(v423.HumanoidRootPart.CFrame * Farm_Mode)
														v423.HumanoidRootPart.CanCollide = false
														local v425 = Vector3.new(60, 60, 60)
														v423.HumanoidRootPart.Size = v425
														v423.HumanoidRootPart.Transparency = 1
														v423.Humanoid:ChangeState(11)
														v423.Humanoid:ChangeState(14)
														Material_Farm_Name = v423.Name
														Material_Farm_CFrame = v423.HumanoidRootPart.CFrame
														AutoClick()

														if not Auto_Farm_Material then

															if not v423.Parent then

																if v423.Humanoid.Health > 0 then
																	v424 = game:GetService("Workspace")
																	v424 = v424.Enemies:FindFirstChild(v423.Name)

																	if v424 then
																	end

																end

															end

														end

													end

												end

											end

										end

										for v426, v423 in v421, v420, v422 do
										end
							end)
						end

					end
				end)
				local v427 = v57:AddSection("", "Mastery Farm", "auto mastery gun and fruit", "rbxassetid://10734932295")
				v427["Slider"]("Health To Kill", 0, 100, 25, function(a) _u0 = a end)
				SelectedMethodMastery = "Quest"
				v427:AddDropdown("Select Method", v428, "Quest", function(a) SelectedMethodMastery = a end)
				v427:AddToggle("Auto Farm Devil Mastery", DevilMastery_Farm, function(a)
					DevilMastery_Farm = a
					CancelTween(DevilMastery_Farm)
				end)
				spawn(function()
					while true do
						local v429 = task.wait()

						if not v429 then

							if not UseSkill then
							end

							pcall(function()
								local v430 = game:GetService("Workspace")
								local v431, v430, v432 = _u0(v430.Enemies:GetChildren())

								while true do

									if v433.Name == Mastery_Farm_Name then
										local v434 = v433:FindFirstChild("Humanoid")

										if not v434 then
											v434 = v433:FindFirstChild("HumanoidRootPart")

											if not v434 then

												if v433.Humanoid.Health <= v433.Humanoid.MaxHealth * _u1 / 100 then

													while true do
														task.wait()
														EquipTool(_u2.Data.DevilFruit.Value)
														PositionSkillMasteryDevilFruit = v433.HumanoidRootPart.Position
														v434 = _u3()
														v434 = v434:FindFirstChild(_u2.Data.DevilFruit.Value)

														if not v434 then
															v434 = _u3()
															v434 = v434:FindFirstChild(_u2.Data.DevilFruit.Value)
															v434.MousePos.Value = PositionSkillMasteryDevilFruit
															v434 = _u3()
															v434 = v434:FindFirstChild(_u2.Data.DevilFruit.Value)

															if not _G.SkillZ then

																if 1 <= v434.Level.Value then
																	_u4:SendKeyEvent(true, "Z", false, game)
																	task.wait(0.1)
																	_u4:SendKeyEvent(false, "Z", false, game)
																end

															end

															if not _G.SkillX then

																if 1 <= v434.Level.Value then
																	_u4:SendKeyEvent(true, "X", false, game)
																	task.wait(0.1)
																	_u4:SendKeyEvent(false, "X", false, game)
																end

															end

															if not _G.SkillC then

																if 1 <= v434.Level.Value then
																	_u4:SendKeyEvent(true, "C", false, game)
																	task.wait(0.1)
																	_u4:SendKeyEvent(false, "C", false, game)
																end

															end

															if not _G.SkillV then

																if 1 <= v434.Level.Value then
																	_u4:SendKeyEvent(true, "V", false, game)
																	task.wait(0.1)
																	_u4:SendKeyEvent(false, "V", false, game)
																end

															end

															if not _G.SkillF then

																if 1 <= v434.Level.Value then
																	_u4:SendKeyEvent(true, "F", false, game)
																	task.wait(0.1)
																	_u4:SendKeyEvent(false, "F", false, game)
																end

															end

														end

														if not DevilMastery_Farm then

															if not UseSkill then

																if v433.Humanoid.Health == 0 then
																end

															end

														end

													end

												end

											end

										end

										for v435, v433 in v431, v430, v432 do
										end
							end)
						end

					end
				end)
				spawn(function()
					while true do
						local v436 = task.wait()

						if not v436 then

							if not DevilMastery_Farm then

								if SelectedMethodMastery == "Quest" then
									pcall(function()
										CheckLevel()
										local v437 = string.find(_u0.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon)

										if not v437 then

											if _u0.PlayerGui.Main.Quest.Visible == false then
											else
												UseSkill = false
												_u1.Remotes.CommF_:InvokeServer("AbandonQuest")

												if not _u2 then
													BTP(CFrameQ)
												else

													if _u2 then
														Tween(CFrameQ)
													end

												end

												local v438 = _u3()

												if (CFrameQ.Position - v438.Position).Magnitude <= 5 then
													_u1.Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
												end

											else
												v437 = string.find(_u0.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon)

												if v437 then

													if _u0.PlayerGui.Main.Quest.Visible == true then
													else
														v437 = game:GetService("Workspace")
														v437 = v437.Enemies:FindFirstChild(Ms)

														if not v437 then
															v438 = game:GetService("Workspace")
															local v437, v438, v439 = _u4(v438.Enemies:GetChildren())

															while true do
																local v440 = QuestLv:FindFirstChild("Humanoid")

																if not v440 then
																	v440 = QuestLv:FindFirstChild("HumanoidRootPart")

																	if not v440 then

																		if QuestLv.Name == Ms then

																			while true do
																				task.wait()

																				if QuestLv.Humanoid.Health <= QuestLv.Humanoid.MaxHealth * _u5 / 100 then
																					UseSkill = true
																				else
																					UseSkill = false
																					EquipTool(SelectWeaponFarm)
																					Tween(QuestLv.HumanoidRootPart.CFrame * Farm_Mode)
																					QuestLv.HumanoidRootPart.CanCollide = false
																					local v441 = Vector3.new(60, 60, 60)
																					QuestLv.HumanoidRootPart.Size = v441
																					QuestLv.HumanoidRootPart.Transparency = 1
																					QuestLv.Humanoid:ChangeState(11)
																					QuestLv.Humanoid:ChangeState(14)
																					Mastery_Farm_Name = QuestLv.Name
																					Mastery_Farm_CFrame = QuestLv.HumanoidRootPart.CFrame
																					AutoClick()
																				end

																				if not DevilMastery_Farm then

																					if not SelectedMethodMastery ~= "Quest" then

																						if not QuestLv.Parent then

																							if QuestLv.Humanoid.Health ~= 0 then

																								if _u0.PlayerGui.Main.Quest.Visible ~= false then
																									v440 = game:GetService("Workspace")
																									v440 = v440.Enemies:FindFirstChild(QuestLv.Name)

																									if v440 then
																									end

																								end

																							end

																						end

																					end

																				end

																			end

																		end

																	end

																	for v442, v443 in v437, v438, v439 do
																	end

																else
																	Tween(CFrameMon)
																end

															end

														end

													end

												end
									end)
								end

							end

						end

						if not DevilMastery_Farm then

							if SelectedMethodMastery == "No Quest" then
								UseSkill = false
								pcall(function()
									CheckLevel()

									if not _u0 then
										BTP(CFrameQ)
									else

										if _u0 then
											Tween(CFrameQ)
										end

									end

									local v445, v444, v446 = _u1(game.Workspace.Enemies:GetChildren())

									while true do
										local v448 = v447:FindFirstChild("Humanoid")

										if not v448 then
											v448 = v447:FindFirstChild("HumanoidRootPart")

											if not v448 then

												if v447.Name == Ms then

													while true do
														task.wait()

														if v447.Humanoid.Health <= v447.Humanoid.MaxHealth * _u2 / 100 then
															UseSkill = true
														else
															UseSkill = false
															EquipTool(SelectWeaponFarm)
															Tween(v447.HumanoidRootPart.CFrame * Farm_Mode)
															v447.HumanoidRootPart.CanCollide = false
															local v449 = Vector3.new(60, 60, 60)
															v447.HumanoidRootPart.Size = v449
															v447.HumanoidRootPart.Transparency = 1
															v447.Humanoid:ChangeState(11)
															v447.Humanoid:ChangeState(14)
															Mastery_Farm_Name = v447.Name
															Mastery_Farm_CFrame = v447.HumanoidRootPart.CFrame
															AutoClick()
														end

														if not DevilMastery_Farm then

															if not SelectedMethodMastery ~= "Quest" then

																if not v447.Parent then

																	if v447.Humanoid.Health ~= 0 then
																		v448 = game:GetService("Workspace")
																		v448 = v448.Enemies:FindFirstChild(v447.Name)

																		if v448 then
																		end

																	end

																end

															end

														end

													end

												end

											end

											for v450, v447 in v445, v444, v446 do
											end
								end)
							end

						end

					end

					if not DevilMastery_Farm then

						if SelectedMethodMastery == "Nearest" then
							UseSkill = false
							pcall(function()
								local v452, v451, v453 = _u0(game.Workspace.Enemies:GetChildren())

								while true do

									if not v454.Name then
										local v455 = v454:FindFirstChild("Humanoid")

										if not v455 then
											v455 = v454:FindFirstChild("HumanoidRootPart")

											if not v455 then
												v455 = _u1()
												local v456 = v454:FindFirstChild("HumanoidRootPart")

												if (v455.Position - v456.Position).Magnitude <= 2000 then

													while true do
														task.wait()

														if v454.Humanoid.Health <= v454.Humanoid.MaxHealth * _u2 / 100 then
															UseSkill = true
														else
															UseSkill = false
															EquipTool(SelectWeaponFarm)
															Tween(v454.HumanoidRootPart.CFrame * Farm_Mode)
															v454.HumanoidRootPart.CanCollide = false
															v456 = Vector3.new(60, 60, 60)
															v454.HumanoidRootPart.Size = v456
															v454.HumanoidRootPart.Transparency = 1
															v454.Humanoid:ChangeState(11)
															v454.Humanoid:ChangeState(14)
															Mastery_Farm_Name = v454.Name
															Mastery_Farm_CFrame = v454.HumanoidRootPart.CFrame
															AutoClick()
														end

														if not DevilMastery_Farm then

															if not SelectedMethodMastery ~= "Nearest" then

																if not v454.Parent then

																	if v454.Humanoid.Health ~= 0 then
																		v455 = game:GetService("Workspace")
																		v455 = v455.Enemies:FindFirstChild(v454.Name)

																		if v455 then
																		end

																	end

																end

															end

														end

													end

												end

											end

										end

										for v457, v454 in v452, v451, v453 do
										end
							end)
						end

					end

				end

				UseSkill = false
			end

		end
				end)
				v427:AddToggle("Auto Farm Gun Mastery", GunMastery_Farm, function(a)
					GunMastery_Farm = a
					CancelTween(GunMastery_Farm)
				end)
				spawn(function()
					pcall(function()
						while true do
							local v458 = task.wait()

							if not v458 then
								local v458, v459, v460 = _u0(_u1.Backpack:GetChildren())

								while true do
									local v462 = v461:IsA("Tool")

									if not v462 then
										v462 = v461:FindFirstChild("RemoteFunctionShoot")

										if not v462 then
											CurrentEquipGun = v461.Name
										end

									end

									for v463, v461 in v458, v459, v460 do
									end

								end

							end
					end)
				end)
				spawn(function()
					_u0.RenderStepped:Connect(function()
						if not UseGunMastery then
							pcall(function()
								CheckLevel()
								local v464 = game:GetService("Workspace")
								local v465, v464, v466 = _u0(v464.Enemies:GetChildren())

								while true do

									if v467.Name == Ms then
										local v468 = _u1()
										v468[CurrentEquipGun].RemoteFunctionShoot:InvokeServer(v467.HumanoidRootPart.Position, v467.HumanoidRootPart)
										v468 = _u1()
										v468[CurrentEquipGun].Cooldown.Value = 0
									end

									if v467.Name == _G.SelectMonster then
										v468 = _u1()
										v468[CurrentEquipGun].RemoteFunctionShoot:InvokeServer(v467.HumanoidRootPart.Position, v467.HumanoidRootPart)
										v468 = _u1()
										v468[CurrentEquipGun].Cooldown.Value = 0
									end

									for v469, v467 in v465, v464, v466 do
									end
							end)
						end
					end)
				end)
				spawn(function()
					while true do
						local v470 = task.wait()

						if not v470 then

							if not GunMastery_Farm then

								if SelectedMethodMastery == "Quest" then
									pcall(function()
										CheckLevel()
										local v471 = string.find(_u0.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon)

										if not v471 then

											if _u0.PlayerGui.Main.Quest.Visible == false then
											else
												UseGunMastery = false
												_u1.Remotes.CommF_:InvokeServer("AbandonQuest")

												if not _u2 then
													BTP(CFrameQ)
												else

													if _u2 then
														Tween(CFrameQ)
													end

												end

												local v472 = _u3()

												if (CFrameQ.Position - v472.Position).Magnitude <= 5 then
													_u1.Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
												end

											else
												v471 = string.find(_u0.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon)

												if v471 then

													if _u0.PlayerGui.Main.Quest.Visible == true then
													else
														v471 = game:GetService("Workspace")
														v471 = v471.Enemies:FindFirstChild(Ms)

														if not v471 then
															v472 = game:GetService("Workspace")
															local v471, v472, v473 = _u4(v472.Enemies:GetChildren())

															while true do
																local v474 = QuestLv:FindFirstChild("Humanoid")

																if not v474 then
																	v474 = QuestLv:FindFirstChild("HumanoidRootPart")

																	if not v474 then

																		if QuestLv.Name == Ms then

																			while true do
																				task.wait()

																				if QuestLv.Humanoid.Health <= QuestLv.Humanoid.MaxHealth * _u5 / 100 then
																					EquipTool(CurrentEquipGun)
																					v474 = _u6()
																					v474[CurrentEquipGun].Cooldown.Value = 0
																					UseGunMastery = true
																					AutoClick()
																				else
																					UseGunMastery = false
																					EquipTool(SelectWeaponFarm)
																					Tween(QuestLv.HumanoidRootPart.CFrame * Farm_Mode)
																					QuestLv.HumanoidRootPart.CanCollide = false
																					local v475 = Vector3.new(60, 60, 60)
																					QuestLv.HumanoidRootPart.Size = v475
																					QuestLv.HumanoidRootPart.Transparency = 1
																					QuestLv.Humanoid:ChangeState(11)
																					QuestLv.Humanoid:ChangeState(14)
																					Mastery_Farm_Name = QuestLv.Name
																					Mastery_Farm_CFrame = QuestLv.HumanoidRootPart.CFrame
																					AutoClick()
																				end

																				if not GunMastery_Farm then

																					if not SelectedMethodMastery ~= "Quest" then

																						if not QuestLv.Parent then

																							if QuestLv.Humanoid.Health ~= 0 then

																								if _u0.PlayerGui.Main.Quest.Visible ~= false then
																									v474 = game:GetService("Workspace")
																									v474 = v474.Enemies:FindFirstChild(QuestLv.Name)

																									if v474 then
																									end

																								end

																							end

																						end

																					end

																				end

																			end

																		end

																	end

																	for v476, v477 in v471, v472, v473 do
																	end

																else
																	Tween(CFrameMon)
																end

															end

														end

													end

												end
									end)
								end

							end

						end

						if not GunMastery_Farm then

							if SelectedMethodMastery == "No Quest" then
								UseGunMastery = false
								pcall(function()
									CheckLevel()

									if not _u0 then
										BTP(CFrameQ)
									else

										if _u0 then
											Tween(CFrameQ)
										end

									end

									local v479, v478, v480 = _u1(game.Workspace.Enemies:GetChildren())

									while true do
										local v482 = v481:FindFirstChild("Humanoid")

										if not v482 then
											v482 = v481:FindFirstChild("HumanoidRootPart")

											if not v482 then

												if v481.Name == Ms then

													while true do
														task.wait()

														if v481.Humanoid.Health <= v481.Humanoid.MaxHealth * _u2 / 100 then
															EquipTool(CurrentEquipGun)
															v482 = _u3()
															v482[CurrentEquipGun].Cooldown.Value = 0
															UseGunMastery = true
															AutoClick()
														else
															UseGunMastery = false
															EquipTool(SelectWeaponFarm)
															Tween(v481.HumanoidRootPart.CFrame * Farm_Mode)
															v481.HumanoidRootPart.CanCollide = false
															local v483 = Vector3.new(60, 60, 60)
															v481.HumanoidRootPart.Size = v483
															v481.HumanoidRootPart.Transparency = 1
															v481.Humanoid:ChangeState(11)
															v481.Humanoid:ChangeState(14)
															Mastery_Farm_Name = v481.Name
															Mastery_Farm_CFrame = v481.HumanoidRootPart.CFrame
															AutoClick()
														end

														if not GunMastery_Farm then

															if not SelectedMethodMastery ~= "Quest" then

																if not v481.Parent then

																	if v481.Humanoid.Health ~= 0 then
																		v482 = game:GetService("Workspace")
																		v482 = v482.Enemies:FindFirstChild(v481.Name)

																		if v482 then
																		end

																	end

																end

															end

														end

													end

												end

											end

											for v484, v481 in v479, v478, v480 do
											end
								end)
							end

						end

					end

					if not GunMastery_Farm then

						if SelectedMethodMastery == "Nearest" then
							UseGunMastery = false
							pcall(function()
								local v486, v485, v487 = _u0(game.Workspace.Enemies:GetChildren())

								while true do

									if not v488.Name then
										local v489 = v488:FindFirstChild("Humanoid")

										if not v489 then
											v489 = v488:FindFirstChild("HumanoidRootPart")

											if not v489 then
												v489 = _u1()
												local v490 = v488:FindFirstChild("HumanoidRootPart")

												if (v489.Position - v490.Position).Magnitude <= 2000 then

													while true do
														task.wait()

														if v488.Humanoid.Health <= v488.Humanoid.MaxHealth * _u2 / 100 then
															EquipTool(CurrentEquipGun)
															v489 = _u3()
															v489[CurrentEquipGun].Cooldown.Value = 0
															UseGunMastery = true
															AutoClick()
														else
															UseGunMastery = false
															EquipTool(SelectWeaponFarm)
															Tween(v488.HumanoidRootPart.CFrame * Farm_Mode)
															v488.HumanoidRootPart.CanCollide = false
															v490 = Vector3.new(60, 60, 60)
															v488.HumanoidRootPart.Size = v490
															v488.HumanoidRootPart.Transparency = 1
															v488.Humanoid:ChangeState(11)
															v488.Humanoid:ChangeState(14)
															Mastery_Farm_Name = v488.Name
															Mastery_Farm_CFrame = v488.HumanoidRootPart.CFrame
															AutoClick()
														end

														if not GunMastery_Farm then

															if not SelectedMethodMastery ~= "Nearest" then

																if not v488.Parent then

																	if v488.Humanoid.Health ~= 0 then
																		v489 = game:GetService("Workspace")
																		v489 = v489.Enemies:FindFirstChild(v488.Name)

																		if v489 then
																		end

																	end

																end

															end

														end

													end

												end

											end

										end

										for v491, v488 in v486, v485, v487 do
										end
							end)
						end

					end

				end

				UseGunMastery = false
			end

		end
				end)
				local v492 = v57:AddSection("", "Bosses", "auto farms boss in any sea", "rbxassetid://10734962068")
				local v494, v493, v495 = pairs(v41["GetChildren"]())

				while true do
					local v497 = table["find"](v496, "Vice Admiral".Name)

					if not v497 then
						table["insert"](v498, "Vice Admiral".Name)
					end

					for v499, v500 in v494, v493, v495 do
					end

					v494 = v492:AddDropdown("Select Boss", v498, "", function(a) SelectBoss = a end)
					v492:Button("Refresh Boss", function()
						local v502, v501, v503 = _u0(_u1:GetChildren())

						while true do
							local v505 = table.find(_u2, v504.Name)

							if not v505 then
								table.insert(v506, v504.Name)
							end

							for v507, v504 in v502, v501, v503 do
							end

							_u3:Clear()
							local v502, v501, v503 = _u4(v506)

							while true do
								_u3:Add(v504)

								for v507, v504 in v502, v501, v503 do
								end
					end)
					v492:AddToggle("Auto Farm Boss (Quest)", AutoFarmBossQuest, function(a)
						AutoFarmBossQuest = a
						CancelTween(AutoFarmBossQuest)
					end)
					spawn(function()
						while true do
							local v508 = task.wait()

							if not v508 then

								if not AutoFarmBossQuest then
								end

								pcall(function()
									CheckBossQuest(SelectBoss)
									local v509 = string.find(_u0.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss)

									if not v509 then

										if _u0.PlayerGui.Main.Quest.Visible then
										else
											_u1.Remotes.CommF_:InvokeServer("AbandonQuest")

											if not _u2 then
												BTP(CFrameQBoss)
											else
												Tween(CFrameQBoss)
											end

											local v510 = _u3()

											if (CFrameQBoss.Position - v510.Position).Magnitude <= 5 then
												_u1.Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, QuestLvBoss)
											end

										else
											v509 = string.find(_u0.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss)

											if v509 then

												if not _u0.PlayerGui.Main.Quest.Visible then
												else
													v509 = game:GetService("Workspace")
													v509 = v509.Enemies:FindFirstChild(SelectBoss)

													if not v509 then
														v509 = game:GetService("Workspace")
														v509 = v509.Enemies:FindFirstChild(SelectBoss)

														if not v509 then
															v510 = v509:FindFirstChild("Humanoid")

															if not v510 then

																if 0 < v509.Humanoid.Health then

																	while true do
																		task.wait()
																		EquipTool(SelectWeaponFarm)
																		Tween(v509.HumanoidRootPart.CFrame * Farm_Mode)
																		v509.HumanoidRootPart.CanCollide = false
																		local v511 = Vector3.new(60, 60, 60)
																		v509.HumanoidRootPart.Size = v511
																		v509.HumanoidRootPart.Transparency = 1
																		v509.Humanoid:ChangeState(11)
																		v509.Humanoid:ChangeState(14)
																		AutoClick()

																		if not AutoFarmBossQuest then

																			if not v509.Parent then

																				if v509.Humanoid.Health <= 0 then
																				end

																			else
																				Tween(CFrameBoss)
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
					end)
					v492:AddToggle("Auto Farm Boss (No Quest)", AutoFarmBossNoQuest, function(a)
						AutoFarmBossNoQuest = a
						CancelTween(AutoFarmBossNoQuest)
					end)
					spawn(function()
						while true do
							local v512 = task.wait()

							if not v512 then

								if not AutoFarmBossNoQuest then
								end

								pcall(function()
									CheckBossQuest(SelectBoss)

									if not _u0 then
										BTP(CFrameBoss)
									else
										Tween(CFrameBoss)
									end

									local v513 = game:GetService("Workspace")
									v513 = v513.Enemies:FindFirstChild(SelectBoss)

									if not v513 then
										local v514 = v513:FindFirstChild("Humanoid")

										if not v514 then

											if 0 < v513.Humanoid.Health then

												while true do
													task.wait()
													EquipTool(SelectWeaponFarm)
													Tween(v513.HumanoidRootPart.CFrame * Farm_Mode)
													v513.HumanoidRootPart.CanCollide = false
													local v515 = Vector3.new(60, 60, 60)
													v513.HumanoidRootPart.Size = v515
													v513.HumanoidRootPart.Transparency = 1
													v513.Humanoid:ChangeState(11)
													v513.Humanoid:ChangeState(14)
													AutoClick()

													if not AutoFarmBossNoQuest then

														if not v513.Parent then

															if v513.Humanoid.Health <= 0 then
															end

														end

													end

												end

											end

										end
								end)
							end

						end
					end)
					_G["AutoFarmAllBoss"] = false
					v492:AddToggle("Auto Farm All Boss", false, function(a) _G.AutoFarmAllBoss = a end)
					spawn(function()
						while true do
							local v516 = task.wait(1)

							if not v516 then

								if not _G.AutoFarmAllBoss then
								end

								local v516, v517, v518 = _u0(_u1)

								while true do
									local v519 = game:GetService("Workspace")
									v519 = v519.Enemies:FindFirstChild(v520)

									if not v519 then
										local v521 = v519:FindFirstChild("Humanoid")

										if not v521 then

											if 0 < v519.Humanoid.Health then
												task.wait()
												EquipTool(SelectWeaponFarm)
												v519.HumanoidRootPart.CanCollide = false
												local v522 = Vector3.new(60, 60, 60)
												v519.HumanoidRootPart.Size = v522
												v519.HumanoidRootPart.Transparency = 1
												v519.Humanoid:ChangeState(11)
												v519.Humanoid:ChangeState(14)
												Tween(v519.HumanoidRootPart.CFrame * Farm_Mode)
												AutoClick()

												if v519.Humanoid.Health > 0 then

													if not _G.AutoFarmAllBoss then
													else
														v521 = _u2:FindFirstChild(v520)

														if not v521 then
														end

														if not _u2[v520].HumanoidRootPart.CFrame then
															local v523 = CFrame.new(5, 10, 2)
															Tween(_u2[v520].HumanoidRootPart.CFrame * v523)
														end

													end

												end

											end

										end

									end

									for v524, v520 in v516, v517, v518 do
									end

								end

							end
					end)
					v495 = v57:AddSection("", "Chest Farm", "auto teleport to chest [no kick]", "rbxassetid://10709782582")

					function AutoGrabChest()
						local v525 = game:GetService("Workspace")
						local v526, v525, v527 = _u0(v525.ChestModels:GetChildren())

						while true do

							if v528.Name ~= "SilverChest" then

								if v528.Name ~= "GoldChest" then

									if v528.Name ~= "DiamondChest" then

										if v528.Name ~= "FragmentChest" then

											if v528.Name == "MirageChest" then
											else
											else
											else
											else
												game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v528.PushBox.CFrame
												wait(0.15)
											end

										end

									end

								end

							end

							for v529, v528 in v526, v525, v527 do
							end

							local v526, v525, v527 = _u0(game.Workspace.ChestModels:GetDescendants())

							while true do
								local v530 = v528:IsA("TouchTransmitter")

								if not v530 then
									wait(0.15)
									firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v528.Parent, 0)
									wait(0.15)
									firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v528.Parent, 1)
								end

								for v529, v528 in v526, v525, v527 do
								end
					end

					function CooldownDeath(a)
						wait(a)
						game.Players.LocalPlayer.Character.Head:Destroy()
						wait(a)
					end

					v495:AddToggle("Auto Grab Chest (Stop if have items)", _G["GrabChested"], function(a) _G.GrabChested = a end)
					spawn(function()
						while true do
							local v531 = task.wait()

							if not v531 then

								if not _G.GrabChested then
								end

								pcall(function()
									local v532 = game:GetService("Players")
									v532 = v532.LocalPlayer.Backpack:FindFirstChild("God's Chalice")

									if not v532 then
										v532 = game:GetService("Players")
										v532 = v532.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness")

										if v532 then
										else
											pcall(function() AutoGrabChest() end)
										end

									end
								end)
							end

						end
					end)
					spawn(function()
						while true do
							local v533 = task.wait()

							if not v533 then

								if not _G.GrabChested then
								end

								pcall(function() CooldownDeath(10) end)
							end

						end
					end)
					v495:AddToggle("Auto Grab Chest + Hop (Stop if have items)", _G["GrabChestedHop"], function(a) _G.GrabChestedHop = a end)
					spawn(function()
						while true do
							local v534 = wait()

							if not v534 then

								if not _G.GrabChestedHop then
								end

								pcall(function()
									local v535 = game.Workspace:FindFirstChild("SilverChest")

									if v535 then
										v535 = game.Workspace:FindFirstChild("DiamondChest")

										if v535 then
											v535 = game.Workspace:FindFirstChild("GoldChest")

											if v535 then
												v535 = game.Workspace:FindFirstChild("FragmentChest")

												if v535 then
													v535 = game.Workspace:FindFirstChild("MirageChest")

													if not v535 then
													else
													else
													else
													else
														v535 = game:GetService("Players")
														v535 = v535.LocalPlayer.Backpack:FindFirstChild("God's Chalice")

														if not v535 then
															v535 = game:GetService("Players")
															v535 = v535.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness")

															if v535 then
															else
																pcall(function() AutoGrabChest() end)
															end

														end

													end

												end

											else
												pcall(function() Hop() end)
											end

										end

									end
								end)
							end

						end
					end)
					spawn(function()
						while true do
							local v536 = task.wait()

							if not v536 then

								if not _G.GrabChestedHop then
								end

								pcall(function() CooldownDeath(10) end)
							end

						end
					end)
					v499 = v57:AddSection("", "Observation Farm", "auto increase observation", "rbxassetid://10734974689")
					v500 = v499:AddLabel("")
					spawn(function()
						while true do
							local v537 = wait()

							if not v537 then
								pcall(function()
									local v538 = game:GetService("Players")
									local v539 = math.floor(v538.LocalPlayer.VisionRadius.Value)
									_u0:Set(_u0, "Observation Range : " .. v539)
								end)
							end

						end
					end)
					v499:AddToggle("Auto Farm Observation", AutoFarmKen, function(a)
						AutoFarmKen = a
						CancelTween(AutoFarmKen)
					end)
					spawn(function()
						while true do
							local v540 = task.wait()

							if not v540 then

								if not AutoFarmKen then
								end

								pcall(function()
									if 3000 <= _u0.VisionRadius.Value then
										_u1("Observation", "Your points observation is max.", 3)
									else

										if not Second_Sea then
											local v541 = game:GetService("Workspace")
											v541 = v541.Enemies:FindFirstChild("Lava Pirate [Lv. 1200]")

											if not v541 then
												v541 = _u0.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")

												if not v541 then

													while true do
														task.wait()
														v541 = _u2()
														local v542 = game:GetService("Workspace")
														v542 = v542.Enemies:FindFirstChild("Lava Pirate")
														local v543 = CFrame.new(3, 0, 0)
														v541.CFrame = v542.HumanoidRootPart.CFrame * v543

														if AutoFarmKen ~= false then
															v541 = _u0.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")

															if v541 then
															end

														else

															while true do
																task.wait()
																v541 = _u2()
																v542 = game:GetService("Workspace")
																v542 = v542.Enemies:FindFirstChild("Lava Pirate")
																v543 = CFrame.new(0, 50, 0)
																v543 = task.wait(1)
																v541.CFrame = v542.HumanoidRootPart.CFrame * v543 + v543
																v541 = _u0.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")

																if v541 then
																	_u3:Teleport(game.PlaceId, _u0)
																end

																if AutoFarmKen ~= false then
																	v541 = _u0.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")

																	if not v541 then
																	end

																else
																	Tween(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
																else

																	if not First_Sea then
																		v541 = game:GetService("Workspace")
																		v541 = v541.Enemies:FindFirstChild("Galley Captain [Lv. 650]")

																		if not v541 then
																			v541 = _u0.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")

																			if not v541 then
																				task.wait()
																				v541 = _u2()
																				v542 = game:GetService("Workspace")
																				v542 = v542.Enemies:FindFirstChild("Galley Captain")
																				v543 = CFrame.new(3, 0, 0)
																				v541.CFrame = v542.HumanoidRootPart.CFrame * v543

																				if AutoFarmKen ~= false then
																					v541 = _u0.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")

																					if not v541 then
																					else

																						while true do
																							task.wait()
																							v541 = _u2()
																							v542 = game:GetService("Workspace")
																							v542 = v542.Enemies:FindFirstChild("Galley Captain")
																							v543 = CFrame.new(0, 50, 0)
																							v541.CFrame = v542.HumanoidRootPart.CFrame * v543
																							task.wait(1)
																							v541 = _u0.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")

																							if v541 then
																								_u3:Teleport(game.PlaceId, _u0)
																							end

																							if AutoFarmKen ~= false then
																								v541 = _u0.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")

																								if not v541 then
																								end

																							else
																								Tween(CFrame.new(5533.29785, 88.1079102, 4852.3916))
																							else

																								if not Third_Sea then
																									v541 = game:GetService("Workspace")
																									v541 = v541.Enemies:FindFirstChild("Giant Islander [Lv. 1650]")

																									if not v541 then
																										v541 = _u0.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")

																										if not v541 then
																											task.wait()
																											v541 = _u2()
																											v542 = game:GetService("Workspace")
																											v542 = v542.Enemies:FindFirstChild("Giant Islander")
																											v543 = CFrame.new(3, 0, 0)
																											v541.CFrame = v542.HumanoidRootPart.CFrame * v543

																											if AutoFarmKen ~= false then
																												v541 = _u0.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")

																												if not v541 then
																												else
																													task.wait()
																													v541 = _u2()
																													v542 = game:GetService("Workspace")
																													v542 = v542.Enemies:FindFirstChild("Giant Islander")
																													v543 = CFrame.new(0, 50, 0)
																													v541.CFrame = v542.HumanoidRootPart.CFrame * v543
																													task.wait(1)
																													v541 = _u0.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")

																													if v541 then
																														_u3:Teleport(game.PlaceId, _u0)
																													end

																													if AutoFarmKen ~= false then
																														v541 = _u0.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")

																														if v541 then
																														else
																															Tween(CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789))
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
							end

						end
					end)
					v499:AddToggle("Auto Observation V2", AutoKenV2, function(a)
						AutoKenV2 = a
						CancelTween(AutoKenV2)
					end)
					spawn(function()
						while true do
							local v544 = task.wait()

							if not v544 then

								if not AutoKenV2 then
								end

								pcall(function()
									local v545 = _u0.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")

									if v545 == 3 then
										v545 = _u1.Backpack:FindFirstChild("Banana")

										if not v545 then
											v545 = _u1.Backpack:FindFirstChild("Apple")

											if not v545 then
												v545 = _u1.Backpack:FindFirstChild("Pineapple")

												if not v545 then

													while true do
														task.wait()
														Tween(CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625))

														if not AutoKenV2 then
															v545 = _u2()
															local v546 = Vector3.new(-12444.78515625, 332.40396118164, -7673.1806640625)

															if (v545.Position - v546).Magnitude <= 10 then
															end

														end

														task.wait(0.5)
														_u0.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
													else
													else
													else
														v545 = _u1.Backpack:FindFirstChild("Fruit Bowl")

														if v545 then
															v545 = _u3()
															v545 = v545:FindFirstChild("Fruit Bowl")

															if not v545 then
															else

																while true do
																	task.wait()
																	Tween(CFrame.new(-10920.125, 624.20275878906, -10266.995117188))

																	if not AutoKenV2 then
																		v545 = _u2()
																		v546 = Vector3.new(-10920.125, 624.20275878906, -10266.995117188)

																		if (v545.Position - v546).Magnitude <= 10 then
																		end

																	end

																	task.wait(0.5)
																	_u0.Remotes.CommF_:InvokeServer("KenTalk2", "Start")
																	task.wait(1)
																	_u0.Remotes.CommF_:InvokeServer("KenTalk2", "Buy")
																end

															else
																v546 = game:GetService("Workspace")
																local v545, v546, v547 = _u4(v546:GetDescendants())

																while true do

																	if -10266.995117188.Name ~= "Apple" then

																		if -10266.995117188.Name ~= "Banana" then

																			if -10266.995117188.Name == "Pineapple" then
																			else
																			else
																				local v548 = _u2()
																				local v549 = CFrame.new(0, 1, 10)
																				-10266.995117188.Handle.CFrame = v548.CFrame * v549
																				task.wait()
																				v548 = _u2()
																				firetouchinterest(v548, -10266.995117188.Handle, 0)
																				task.wait()
																			end

																		end

																	end

																	for v550, v551 in v545, v546, v547 do
																	end

																end

															end

														end

													end

												end
								end)
							end

						end
					end)
					spawn(function()
						while true do
							local v552 = task.wait()

							if not v552 then

								if not AutoSecondWorld then
								end

								pcall(function()
									if 700 <= _u0.Data.Level.Value then
										local v553 = _u1.Remotes.CommF_:InvokeServer("DressrosaQuestProgress")

										if v553.UsedKey == false then
											v553 = _u0.Backpack:FindFirstChild("Key")

											if not v553 then
												v553 = _u2()
												v553 = v553:FindFirstChild("Key")

												if v553 then
												else
													_u1.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective")
												end

											else
												v553 = _u0.Backpack:FindFirstChild("Key")

												if v553 then
													v553 = _u2()
													v553 = v553:FindFirstChild("Key")

													if not v553 then
													else
														v553 = _u3()
														v553:EquipTool(_u0.Backpack.Key)

														if not _u4 then
															BTP(CFrame.new(1349.697265625, 37.349285125732422, -1328.8309326171875))
															v553 = game:GetService("Workspace")
															local v554 = Vector3.new(30, 30, 30)
															v553.Map.Ice.Door.Size = v554
														else

															if _u4 then
																Tween(CFrame.new(1349.697265625, 37.349285125732422, -1328.8309326171875))
																v553 = game:GetService("Workspace")
																v554 = Vector3.new(30, 30, 30)
																v553.Map.Ice.Door.Size = v554
															else
																v553 = _u1.Remotes.CommF_:InvokeServer("DressrosaQuestProgress")

																if v553.UsedKey == true then
																	v553 = _u1.Remotes.CommF_:InvokeServer("DressrosaQuestProgress")

																	if v553.KilledIceBoss == false then
																		local v553, v554, v555 = _u5(game.Workspace.Enemies:GetChildren())

																		while true do

																			if 30.Name == "Ice Admiral" then
																				EquipTool(SelectWeaponFarm)
																				Tween(30.HumanoidRootPart.CFrame * Farm_Mode)
																				30.HumanoidRootPart.CanCollide = false
																				local v556 = Vector3.new(60, 60, 60)
																				30.HumanoidRootPart.Size = v556
																				30.HumanoidRootPart.Transparency = 1
																				30.Humanoid:ChangeState(11)
																				30.Humanoid:ChangeState(14)
																				AutoClick()
																			end

																			for v557, v558 in v553, v554, v555 do
																			end

																			local v553, v554, v555 = _u5(_u1:GetChildren())

																			while true do

																				if 30.Name == "Ice Admiral" then
																					Tween(30.HumanoidRootPart.CFrame * Farm_Mode)
																				end

																				for v557, v558 in v553, v554, v555 do
																				end

																			else
																				v553 = _u1.Remotes.CommF_:InvokeServer("DressrosaQuestProgress")

																				if v553.KilledIceBoss == true then
																					_u1.Remotes.CommF_:InvokeServer("TravelDressrosa")
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
					end)
					spawn(function()
						while true do
							local v559 = task.wait()

							if not v559 then

								if not AutoThirdWorld then
								end

								pcall(function()
									if 1500 <= _u0.Data.Level.Value then
										local v560 = _u1.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")

										if v560 == 3 then
											v560 = _u1.Remotes.CommF_:InvokeServer("GetUnlockables")

											if v560.FlamingoAccess == nil then
												v560 = _u1.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check")

												if v560 == nil then
													v560 = game.Workspace.Enemies:FindFirstChild("rip_indra")

													if not v560 then
														local v560, v561, v562 = _u2(game.Workspace.Enemies:GetChildren())

														while true do

															if v563.Name == "rip_indra" then
																local v564 = v563:FindFirstChild("Humanoid")

																if not v564 then
																	v564 = v563:FindFirstChild("HumanoidRootPart")

																	if not v564 then

																		if 0 < v563.Humanoid.Health then

																			while true do
																				task.wait()
																				EquipTool(SelectWeaponFarm)
																				Tween(v563.HumanoidRootPart.CFrame * Farm_Mode)
																				v563.HumanoidRootPart.CanCollide = false
																				local v565 = Vector3.new(60, 60, 60)
																				v563.HumanoidRootPart.Size = v565
																				v563.HumanoidRootPart.Transparency = 1
																				v563.Humanoid:ChangeState(11)
																				v563.Humanoid:ChangeState(14)
																				AutoClick()

																				if not v563.Parent then

																					if v563.Humanoid.Health > 0 then

																						if AutoThirdWorld then
																						end

																					end

																				end

																			end

																		end

																	end

																end

																for v566, v563 in v560, v561, v562 do
																end

															else
																Tween(CFrame.new(-26952.2891, 21.5294781, 329.351562, -0.453972578, 0, -0.891015649, 0, 1, 0, 0.891015649, 0, -0.453972578))
															else
																v560 = _u1.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check")

																if v560 == 1 then
																	v560 = game.Workspace.Enemies:FindFirstChild("Don Swan")

																	if not v560 then
																		local v560, v561, v562 = _u2(game.Workspace.Enemies:GetChildren())

																		while true do

																			if 329.351562.Name == "Don Swan" then
																				v564 = 329.351562:FindFirstChild("Humanoid")

																				if not v564 then
																					v564 = 329.351562:FindFirstChild("HumanoidRootPart")

																					if not v564 then

																						if 0 < 329.351562.Humanoid.Health then

																							while true do
																								task.wait()
																								EquipTool(SelectWeaponFarm)
																								Tween(329.351562.HumanoidRootPart.CFrame * Farm_Mode)
																								329.351562.HumanoidRootPart.CanCollide = false
																								v565 = Vector3.new(60, 60, 60)
																								329.351562.HumanoidRootPart.Size = v565
																								329.351562.HumanoidRootPart.Transparency = 1
																								329.351562.Humanoid:ChangeState(11)
																								329.351562.Humanoid:ChangeState(14)
																								AutoClick()

																								if not 329.351562.Parent then

																									if 329.351562.Humanoid.Health > 0 then

																										if AutoThirdWorld then
																										end

																									end

																								end

																							end

																						end

																					end

																				end

																				for v566, v563 in v560, v561, v562 do
																				end

																			else

																				if not _u3 then
																					BTP(CFrame.new(2288.802, 15.1870775, 863.034607))
																				else
																					Tween(CFrame.new(2288.802, 15.1870775, 863.034607))
																				end

																			end

																		end

																	end

																end

																TabelDevilFruitStore = {}
																TabelDevilFruitOpen = {}
																local v560, v561, v562 = _u2(_u1.Remotes.CommF_:InvokeServer("getInventoryFruits"))

																while true do
																	local v564, v565, v567 = _u2(863.034607)

																	while true do

																		if 60 == "Name" then
																			table.insert(TabelDevilFruitStore, 60)
																		end

																		for v568, v569 in v564, v565, v567 do
																		end

																		for v566, v563 in v560, v561, v562 do
																		end

																		v561 = _u1:WaitForChild("Remotes")
																		local v561, v562 = v561.CommF_:InvokeServer("GetFruits")

																		while true do

																			if 1000000 <= 863.034607.Price then
																				table.insert(TabelDevilFruitOpen, 863.034607.Name)
																			end

																			for v566, v563 in next, v561, v562 do
																			end

																			local v560, v561, v562 = _u2(TabelDevilFruitOpen)

																			while true do
																				local v564, v565, v567 = _u2(TabelDevilFruitStore)

																				while true do

																					if 863.034607 == 60 then
																						local v570 = _u1.Remotes.CommF_:InvokeServer("GetUnlockables")

																						if v570.FlamingoAccess == nil then
																							v570 = _u0.Backpack:FindFirstChild(60)

																							if v570 then
																								_u1.Remotes.CommF_:InvokeServer("LoadFruit", 60)
																							else
																								_u1.Remotes.CommF_:InvokeServer("TalkTrevor", "1")
																								_u1.Remotes.CommF_:InvokeServer("TalkTrevor", "2")
																								_u1.Remotes.CommF_:InvokeServer("TalkTrevor", "3")
																							end

																						end

																					end

																					for v568, v569 in v564, v565, v567 do
																					end

																					for v566, v563 in v560, v561, v562 do
																					end

																					_u1.Remotes.CommF_:InvokeServer("TalkTrevor", "1")
																					_u1.Remotes.CommF_:InvokeServer("TalkTrevor", "2")
																					_u1.Remotes.CommF_:InvokeServer("TalkTrevor", "3")
																				else
																					v560 = _u1.Remotes.CommF_:InvokeServer("GetUnlockables")

																					if v560.FlamingoAccess == true then
																						_u1.Remotes.CommF_:InvokeServer("TravelZou")
																					else
																						v560 = _u1.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")

																						if v560 == 0 then
																							v560 = string.find(_u0.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates")

																							if not v560 then
																								v560 = string.find(_u0.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50")

																								if not v560 then

																									if _u0.PlayerGui.Main.Quest.Visible == true then
																										v560 = game:GetService("Workspace")
																										v560 = v560.Enemies:FindFirstChild("Swan Pirate")

																										if not v560 then
																											v561 = game:GetService("Workspace")
																											local v560, v561, v562 = _u2(v561.Enemies:GetChildren())

																											while true do

																												if 863.034607.Name == "Swan Pirate" then

																													while true do
																														task.wait()
																														EquipTool(SelectWeaponFarm)
																														Tween(863.034607.HumanoidRootPart.CFrame * Farm_Mode)
																														863.034607.HumanoidRootPart.CanCollide = false
																														v565 = Vector3.new(60, 60, 60)
																														863.034607.HumanoidRootPart.Size = v565
																														863.034607.HumanoidRootPart.Transparency = 1
																														863.034607.Humanoid:ChangeState(11)
																														863.034607.Humanoid:ChangeState(14)
																														AutoClick()

																														if not 863.034607.Parent then

																															if 863.034607.Humanoid.Health > 0 then

																																if _u0.PlayerGui.Main.Quest.Visible ~= false then

																																	if AutoThirdWorld then
																																	end

																																end

																															end

																														end

																													end

																													for v566, v563 in v560, v561, v562 do
																													end

																												else

																													if not _u3 then
																														BTP(CFrame.new(1057.92761, 137.614319, 1242.08069))
																													else
																														Tween(CFrame.new(1057.92761, 137.614319, 1242.08069))
																													else
																													else
																													else
																														_u1.Remotes.CommF_:InvokeServer("StartQuest", "BartiloQuest", 1)
																													else
																														v560 = _u1.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")

																														if v560 == 1 then
																															_u1.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")
																															v560 = game.Workspace.Enemies:FindFirstChild("Jeremy")

																															if not v560 then
																																local v560, v561, v562 = _u2(game.Workspace.Enemies:GetChildren())

																																while true do
																																	v564 = 1:FindFirstChild("Humanoid")

																																	if not v564 then
																																		v564 = 1:FindFirstChild("HumanoidRootPart")

																																		if not v564 then

																																			if 0 < 1.Humanoid.Health then

																																				if 1.Name == "Jeremy" then

																																					while true do
																																						task.wait()
																																						EquipTool(SelectWeaponFarm)
																																						Tween(1.HumanoidRootPart.CFrame * Farm_Mode)
																																						1.HumanoidRootPart.CanCollide = false
																																						v565 = Vector3.new(60, 60, 60)
																																						1.HumanoidRootPart.Size = v565
																																						1.HumanoidRootPart.Transparency = 1
																																						1.Humanoid:ChangeState(11)
																																						1.Humanoid:ChangeState(14)
																																						AutoClick()

																																						if not 1.Parent then

																																							if 1.Humanoid.Health > 0 then

																																								if AutoThirdWorld then
																																								end

																																							end

																																						end

																																					end

																																				end

																																			end

																																		end

																																		for v566, v563 in v560, v561, v562 do
																																		end

																																	else

																																		if not _u3 then
																																			BTP(CFrame.new(2099.88159, 448.931, 648.997375))
																																		else
																																			Tween(CFrame.new(2099.88159, 448.931, 648.997375))
																																		else
																																			v560 = _u1.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")

																																			if v560 == 2 then
																																				v560 = _u4()

																																				if 1500 < (v560.Position - CFrameThird.Position).Magnitude then

																																					if not _u3 then
																																						BTP(CFrame.new(-1836.1412353515625, 10.458294868469238, 1692.491943359375))
																																					else
																																						Tween(CFrame.new(-1836.1412353515625, 10.458294868469238, 1692.491943359375))
																																					else
																																						task.wait(1)
																																						v560 = _u4()
																																						v561 = CFrame.new(-1850.49329, 13.1789551, 1750.89685)
																																						v560.CFrame = v561
																																						task.wait(1)
																																						v560 = _u4()
																																						v561 = CFrame.new(-1858.87305, 19.3777466, 1712.01807)
																																						v560.CFrame = v561
																																						task.wait(1)
																																						v560 = _u4()
																																						v561 = CFrame.new(-1803.94324, 16.5789185, 1750.89685)
																																						v560.CFrame = v561
																																						task.wait(1)
																																						v560 = _u4()
																																						v561 = CFrame.new(-1858.55835, 16.8604317, 1724.79541)
																																						v560.CFrame = v561
																																						task.wait(1)
																																						v560 = _u4()
																																						v561 = CFrame.new(-1869.54224, 15.987854, 1681.00659)
																																						v560.CFrame = v561
																																						task.wait(1)
																																						v560 = _u4()
																																						v561 = CFrame.new(-1800.0979, 16.4978027, 1684.52368)
																																						v560.CFrame = v561
																																						task.wait(1)
																																						v560 = _u4()
																																						v561 = CFrame.new(-1819.26343, 14.795166, 1717.90625)
																																						v560.CFrame = v561
																																						task.wait(1)
																																						v560 = _u4()
																																						v561 = CFrame.new(-1813.51843, 14.8604736, 1724.79541)
																																						v560.CFrame = v561
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
							end

						end
					end)

					if not First_Sea then
						_G["sesas"] = "First Sea"
					else

						if not Second_Sea then
							_G["sesas"] = "Second Sea"
						else

							if not Third_Sea then
								_G["sesas"] = "Third Sea"
							end

						end

					end

					v497 = v58:AddSection("", _G["sesas"] .. " Farms", "auto quest swords, items, boss, etc..", "rbxassetid://6034744057")

					if not First_Sea then
						v497:AddToggle("Auto Trident Sword", false, function(a)
							_G.Auto_Trident = a
							CancelTween(_G.Auto_Trident)
							print(a)
						end)
						v497:AddToggle("Auto Shark Saw", false, function(a)
							_G.Autosaw = a
							CancelTween(_G.Autosaw)
							print(a)
						end)
						v497:AddToggle("Auto Warden Sword", false, function(a)
							_G.Autowaden = a
							CancelTween(_G.Autowaden)
							print(a)
						end)
						v497:AddToggle("Auto Graybeard", false, function(a)
							_G.Autogay = a
							CancelTween(_G.Autogay)
							print(a)
						end)
						v497:AddToggle("Auto Saber [Fully]", AutoSaber, function(a)
							AutoSaber = a
							CancelTween(AutoSaber)
						end)
					end

					spawn(function()
						while true do
							local v571 = task.wait()

							if not v571 then

								if not AutoSaber then
								end

								if 200 <= _u0.Data.Level.Value then
								end

								v571 = _u0.Backpack:FindFirstChild("Saber")

								if v571 then
								end

								v571 = _u1()
								v571 = v571:FindFirstChild("Saber")

								if v571 then
								end

								pcall(function()
									local v572 = game:GetService("Workspace")

									if v572.Map.Jungle.Final.Part.Transparency == 0 then
										v572 = game:GetService("Workspace")

										if v572.Map.Jungle.QuestPlates.Door.Transparency == 0 then
											v572 = CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279)
											local v573 = _u0()

											if (v572.Position - v573.Position).Magnitude <= 100 then
												v573 = _u0()
												Tween(v573.CFrame)
												task.wait(1)
												v572 = _u0()
												v573 = game:GetService("Workspace")
												v572.CFrame = v573.Map.Jungle.QuestPlates.Plate1.Button.CFrame
												task.wait(1)
												v572 = _u0()
												v573 = game:GetService("Workspace")
												v572.CFrame = v573.Map.Jungle.QuestPlates.Plate2.Button.CFrame
												task.wait(1)
												v572 = _u0()
												v573 = game:GetService("Workspace")
												v572.CFrame = v573.Map.Jungle.QuestPlates.Plate3.Button.CFrame
												task.wait(1)
												v572 = _u0()
												v573 = game:GetService("Workspace")
												v572.CFrame = v573.Map.Jungle.QuestPlates.Plate4.Button.CFrame
												task.wait(1)
												v572 = _u0()
												v573 = game:GetService("Workspace")
												v572.CFrame = v573.Map.Jungle.QuestPlates.Plate5.Button.CFrame
												task.wait(1)
											else
												Tween(CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279))
											else
												v572 = game:GetService("Workspace")

												if v572.Map.Desert.Burn.Part.Transparency == 0 then
													v572 = _u1.Backpack:FindFirstChild("Torch")

													if v572 then
														v572 = _u2()
														v572 = v572:FindFirstChild("Torch")

														if not v572 then
														else
															EquipTool("Torch")
															Tween(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094e-09, 0.761243105, -5.70652914e-10, 1, 1.20584542e-09, -0.761243105, 3.47544882e-10, -0.648466587))
														end

													else
														Tween(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 3.42372805e-05, -0.258850515, 0.965917408))
													else
														v572 = _u3.Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan")

														if v572 ~= 0 then
															_u3.Remotes.CommF_:InvokeServer("ProQuestProgress", "GetCup")
															task.wait(0.5)
															EquipTool("Cup")
															task.wait(0.5)
															local v574 = _u3.Remotes.CommF_:InvokeServer()
															_u3.Remotes.CommF_:InvokeServer(_u3.Remotes.CommF_, "ProQuestProgress", "FillCup", v574.Cup)
															task.wait(0)
															_u3.Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan")
														else
															v572 = _u3.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")

															if v572 == nil then
																_u3.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
															else
																v572 = _u3.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")

																if v572 == 0 then
																	v572 = game:GetService("Workspace")
																	v572 = v572.Enemies:FindFirstChild("Mob Leader")

																	if not v572 then
																		local v572, v573, v575 = _u4(game.Workspace.Enemies:GetChildren())

																		while true do
																			local v576 = v574.Cup:FindFirstChild("Humanoid")

																			if not v576 then
																				v576 = v574.Cup:FindFirstChild("HumanoidRootPart")

																				if not v576 then

																					if 0 < v574.Cup.Humanoid.Health then

																						if v574.Cup.Name == "Mob Leader" then

																							while true do
																								task.wait()
																								EquipTool(SelectWeaponFarm)
																								Tween(v574.Cup.HumanoidRootPart.CFrame * Farm_Mode)
																								v574.Cup.HumanoidRootPart.CanCollide = false
																								local v577 = Vector3.new(60, 60, 60)
																								v574.Cup.HumanoidRootPart.Size = v577
																								v574.Cup.HumanoidRootPart.Transparency = 1
																								v574.Cup.Humanoid:ChangeState(11)
																								v574.Cup.Humanoid:ChangeState(14)
																								AutoClick()

																								if v574.Cup.Humanoid.Health > 0 then

																									if AutoSaber ~= false then

																										if v574.Cup.Parent then
																										end

																									end

																								end

																							end

																						end

																					end

																				end

																				for v578, v574 in v572, v573, v575 do
																				end

																			else
																				v573 = _u3:FindFirstChild("Mob Leader")
																				Tween(v573.HumanoidRootPart.CFrame)
																			else
																				v572 = _u3.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")

																				if v572 == 1 then
																					_u3.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
																					task.wait(0.5)
																					EquipTool("Relic")
																					task.wait(0.5)
																					Tween(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-09, 0.481375456, 2.53851997e-08, 1, -5.79995607e-08, -0.481375456, 6.30572643e-08, 0.876514494))
																				else
																					v572 = game:GetService("Workspace")
																					v572 = v572.Enemies:FindFirstChild("Saber Expert")

																					if not v572 then
																						v573 = game:GetService("Workspace")
																						local v572, v573, v575 = _u4(v573.Enemies:GetChildren())

																						while true do
																							v576 = 3.80598116:FindFirstChild("Humanoid")

																							if not v576 then
																								v576 = 3.80598116:FindFirstChild("HumanoidRootPart")

																								if not v576 then

																									if 0 < 3.80598116.Humanoid.Health then

																										if 3.80598116.Name == "Saber Expert" then

																											while true do
																												task.wait()
																												EquipTool(SelectWeaponFarm)
																												Tween(3.80598116.HumanoidRootPart.CFrame * Farm_Mode)
																												3.80598116.HumanoidRootPart.CanCollide = false
																												v577 = Vector3.new(60, 60, 60)
																												3.80598116.HumanoidRootPart.Size = v577
																												3.80598116.HumanoidRootPart.Transparency = 1
																												3.80598116.Humanoid:ChangeState(11)
																												3.80598116.Humanoid:ChangeState(14)
																												AutoClick()

																												if 3.80598116.Humanoid.Health > 0 then

																													if AutoSaber == false then
																													end

																												end

																												if 3.80598116.Humanoid.Health <= 0 then
																													_u3.Remotes.CommF_:InvokeServer("ProQuestProgress", "PlaceRelic")
																												end

																											end

																										end

																									end

																								end

																								for v578, v574 in v572, v573, v575 do
																								end

																							else
																								v573 = _u3:FindFirstChild("Saber Expert")
																								Tween(v573.HumanoidRootPart.CFrame)
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

						end
					end)
					local v579 = CFrame["new"](3993.227783203125, -1.3182750940322876, -1835.6097412109375)
					spawn(function()
						while true do
							local v580 = wait()

							if not v580 then

								if not _G.Auto_Trident then
								end

								pcall(function()
									local v581 = game:GetService("Workspace")
									v581 = v581.Enemies:FindFirstChild("Fishman Lord")

									if not v581 then
										local v582 = game:GetService("Workspace")
										local v581, v582, v583 = _u0(v582.Enemies:GetChildren())

										while true do

											if v584.Name == "Fishman Lord" then
												local v585 = v584:FindFirstChild("Humanoid")

												if not v585 then
													v585 = v584:FindFirstChild("HumanoidRootPart")

													if not v585 then

														if 0 < v584.Humanoid.Health then

															while true do
																task.wait()
																AutoHaki()
																EquipTool(SelectWeaponFarm)
																v584.HumanoidRootPart.CanCollide = false
																v584.Humanoid.WalkSpeed = 0
																local v586 = Vector3.new(50, 50, 50)
																v584.HumanoidRootPart.Size = v586
																Tween(v584.HumanoidRootPart.CFrame * Farm_Mode)
																AutoClick()

																if not _G.Auto_Trident then

																	if not v584.Parent then

																		if v584.Humanoid.Health <= 0 then
																		end

																	end

																end

															end

														end

													end

												end

												for v587, v584 in v581, v582, v583 do
												end

											else

												if not BypassTP then

													if 1500 < (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _u1.Position).Magnitude then
														BTP(_u1)
													else

														if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _u1.Position).Magnitude < 1500 then
															Tween(_u1)
														else
															Tween(_u1)
														end

													end

												end

												Tween(CFrame.new(-3914.830322265625, 123.29389190673828, -11516.8642578125))
												v581 = game:GetService("ReplicatedStorage")
												v581 = v581:FindFirstChild("Fishman Lord")

												if not v581 then
													v582 = game:GetService("ReplicatedStorage")
													v582 = v582:FindFirstChild("Fishman Lord")
													v583 = CFrame.new(2, 20, 2)
													Tween(v582.HumanoidRootPart.CFrame * v583)
												end

											end
								end)
							end

						end
					end)
					local v588 = CFrame["new"](5186.14697265625, 24.866842269897461, 832.18853759765625)
					spawn(function()
						while true do
							local v589 = wait()

							if not v589 then

								if not _G.Autowaden then
								end

								if not First_Sea then
								end

								pcall(function()
									local v590 = game:GetService("Workspace")
									v590 = v590.Enemies:FindFirstChild("Chief Warden")

									if not v590 then
										local v591 = game:GetService("Workspace")
										local v590, v591, v592 = _u0(v591.Enemies:GetChildren())

										while true do

											if v593.Name == "Chief Warden" then
												local v594 = v593:FindFirstChild("Humanoid")

												if not v594 then
													v594 = v593:FindFirstChild("HumanoidRootPart")

													if not v594 then

														if 0 < v593.Humanoid.Health then

															while true do
																task.wait()
																AutoHaki()
																EquipTool(SelectWeaponFarm)
																v593.HumanoidRootPart.CanCollide = false
																v593.Humanoid.WalkSpeed = 0
																local v595 = Vector3.new(50, 50, 50)
																v593.HumanoidRootPart.Size = v595
																Tween(v593.HumanoidRootPart.CFrame * Farm_Mode)
																AutoClick()

																if not _G.Autowaden then

																	if not v593.Parent then

																		if v593.Humanoid.Health <= 0 then
																		end

																	end

																end

															end

														end

													end

												end

												for v596, v593 in v590, v591, v592 do
												end

											else

												if not BypassTP then

													if 1500 < (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - TridentPos.Position).Magnitude then
														BTP(TridentPos)
													else

														if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - TridentPos.Position).Magnitude < 1500 then
															Tween(TridentPos)
														else
															Tween(TridentPos)
														end

													end

												end

												Tween(CFrame.new(5186.14697265625, 24.866842269897461, 832.18853759765625))
												v590 = game:GetService("ReplicatedStorage")
												v590 = v590:FindFirstChild("Chief Warden")

												if not v590 then
													v591 = game:GetService("ReplicatedStorage")
													v591 = v591:FindFirstChild("Chief Warden")
													v592 = CFrame.new(2, 20, 2)
													Tween(v591.HumanoidRootPart.CFrame * v592)
												end

											end
								end)
							end

						end
					end)
					local v597 = CFrame["new"](-5023.38330078125, 28.652032852172852, 4332.3818359375)
					spawn(function()
						while true do
							local v598 = wait()

							if not v598 then

								if not _G.Autogay then
								end

								if not First_Sea then
								end

								pcall(function()
									local v599 = game:GetService("Workspace")
									v599 = v599.Enemies:FindFirstChild("Greybeard")

									if not v599 then
										local v600 = game:GetService("Workspace")
										local v599, v600, v601 = _u0(v600.Enemies:GetChildren())

										while true do

											if v602.Name == "Greybeard" then
												local v603 = v602:FindFirstChild("Humanoid")

												if not v603 then
													v603 = v602:FindFirstChild("HumanoidRootPart")

													if not v603 then

														if 0 < v602.Humanoid.Health then

															while true do
																task.wait()
																AutoHaki()
																EquipTool(SelectWeaponFarm)
																v602.HumanoidRootPart.CanCollide = false
																v602.Humanoid.WalkSpeed = 0
																local v604 = Vector3.new(50, 50, 50)
																v602.HumanoidRootPart.Size = v604
																Tween(v602.HumanoidRootPart.CFrame * Farm_Mode)
																AutoClick()

																if not _G.Autogay then

																	if not v602.Parent then

																		if v602.Humanoid.Health <= 0 then
																		end

																	end

																end

															end

														end

													end

												end

												for v605, v602 in v599, v600, v601 do
												end

											else

												if not BypassTP then

													if 1500 < (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _u1.Position).Magnitude then
														BTP(_u1)
													else

														if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _u1.Position).Magnitude < 1500 then
															Tween(_u1)
														else
															Tween(_u1)
														end

													end

												end

												Tween(CFrame.new(-5023.38330078125, 28.652032852172852, 4332.3818359375))
												v599 = game:GetService("ReplicatedStorage")
												v599 = v599:FindFirstChild("Greybeard")

												if not v599 then
													v600 = game:GetService("ReplicatedStorage")
													v600 = v600:FindFirstChild("Greybeard")
													v601 = CFrame.new(2, 20, 2)
													Tween(v600.HumanoidRootPart.CFrame * v601)
												end

											end
								end)
							end

						end
					end)
					local v606 = CFrame["new"](-7748.0185546875, 5606.80615234375, -2305.898681640625)
					spawn(function()
						while true do
							local v607 = wait()

							if not v607 then

								if not _G.Autopole then
								end

								if not First_Sea then
								end

								pcall(function()
									local v608 = game:GetService("Workspace")
									v608 = v608.Enemies:FindFirstChild("Thunder God")

									if not v608 then
										local v609 = game:GetService("Workspace")
										local v608, v609, v610 = _u0(v609.Enemies:GetChildren())

										while true do

											if v611.Name == "Thunder God" then
												local v612 = v611:FindFirstChild("Humanoid")

												if not v612 then
													v612 = v611:FindFirstChild("HumanoidRootPart")

													if not v612 then

														if 0 < v611.Humanoid.Health then

															while true do
																task.wait()
																AutoHaki()
																EquipTool(SelectWeaponFarm)
																v611.HumanoidRootPart.CanCollide = false
																v611.Humanoid.WalkSpeed = 0
																local v613 = Vector3.new(50, 50, 50)
																v611.HumanoidRootPart.Size = v613
																Tween(v611.HumanoidRootPart.CFrame * Farm_Mode)
																AutoClick()

																if not _G.Autopole then

																	if not v611.Parent then

																		if v611.Humanoid.Health <= 0 then
																		end

																	end

																end

															end

														end

													end

												end

												for v614, v611 in v608, v609, v610 do
												end

											else

												if not BypassTP then

													if 1500 < (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _u1.Position).Magnitude then
														BTP(_u1)
													else

														if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _u1.Position).Magnitude < 1500 then
															Tween(_u1)
														else
															Tween(TridentPos)
														end

													end

												end

												Tween(CFrame.new(-7748.0185546875, 5606.80615234375, -2305.898681640625))
												v608 = game:GetService("ReplicatedStorage")
												v608 = v608:FindFirstChild("Thunder God")

												if not v608 then
													v609 = game:GetService("ReplicatedStorage")
													v609 = v609:FindFirstChild("Thunder God")
													v610 = CFrame.new(2, 20, 2)
													Tween(v609.HumanoidRootPart.CFrame * v610)
												end

											end
								end)
							end

						end
					end)

					if not Second_Sea then
						v497:AddToggle("Auto Buy Legendary Sword", AutoLegendarySword, function(a) AutoLegendarySword = a end)
						spawn(function()
							while true do
								local v615 = task.wait()

								if not v615 then

									if not AutoLegendarySword then
									end

									pcall(function()
										_u0.Remotes.CommF_:InvokeServer("LegendarySworldDealer", "1")
										_u0.Remotes.CommF_:InvokeServer("LegendarySworldDealer", "2")
										_u0.Remotes.CommF_:InvokeServer("LegendarySworldDealer", "2")
									end)
								end

							end
						end)
						v497:AddToggle("Auto Rengoku", AutoRengoku, function(a)
							AutoRengoku = a
							CancelTween(AutoRengoku)
						end)
						spawn(function()
							while true do
								local v616 = task.wait()

								if not v616 then

									if not AutoRengoku then
										pcall(function()
											local v617 = _u0.Backpack:FindFirstChild("Hidden Key")

											if v617 then
												v617 = _u1()
												v617 = v617:FindFirstChild("Hidden Key")

												if not v617 then
												else
													EquipTool("Hidden Key")
													v617 = CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875)
													loc1 = v617

													if not _u2 then
														BTP(loc1)
													else
														Tween(loc1)
													end

												else
													v617 = game:GetService("Workspace")
													v617 = v617.Enemies:FindFirstChild("Snow Lurker")

													if v617 then
														v617 = game:GetService("Workspace")
														v617 = v617.Enemies:FindFirstChild("Arctic Warrior")

														if not v617 then
														else
															local v618 = game:GetService("Workspace")
															local v617, v618, v619 = _u3(v618.Enemies:GetChildren())

															while true do
																local v621 = v620:FindFirstChild("Humanoid")

																if not v621 then
																	v621 = v620:FindFirstChild("HumanoidRootPart")

																	if not v621 then

																		if 0 < v620.Humanoid.Health then

																			if v620.Name ~= "Snow Lurker" then

																				if v620.Name == "Arctic Warrior" then
																				else

																					while true do
																						task.wait()
																						EquipTool(SelectWeaponFarm)
																						Tween(v620.HumanoidRootPart.CFrame * Farm_Mode)
																						v620.HumanoidRootPart.CanCollide = false
																						local v622 = Vector3.new(60, 60, 60)
																						v620.HumanoidRootPart.Size = v622
																						v620.HumanoidRootPart.Transparency = 1
																						v620.Humanoid:ChangeState(11)
																						v620.Humanoid:ChangeState(14)
																						Rengoku_Farm_Name = v620.Name
																						Rengoku_Farm_CFrame = v620.HumanoidRootPart.CFrame
																						AutoClick()
																						v621 = _u0.Backpack:FindFirstChild("Hidden Key")

																						if v621 then

																							if AutoRengoku ~= false then

																								if not v620.Parent then

																									if v620.Humanoid.Health <= 0 then
																									end

																								end

																							end

																						end

																					end

																				end

																			end

																		end

																	end

																	for v623, v620 in v617, v618, v619 do
																	end

																end

															else
																Tween(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188))
															end

														end

													end
										end)
									end

								end

								RengokuMagnet = false
							end

						end
						end)
						v497:AddToggle("Auto Evo Race V2", AutoEvoRace, function(a)
							AutoEvoRace = a
							CancelTween(AutoEvoRace)
						end)
						spawn(function()
							while true do
								local v624 = task.wait()

								if not v624 then

									if not AutoEvoRace then
									end

									pcall(function()
										local v625 = _u0.Data.Race:FindFirstChild("Evolved")

										if v625 then
											v625 = _u1.Remotes.CommF_:InvokeServer("Alchemist", "1")

											if v625 == 0 then
												Tween(CFrame.new(-2779.83521, 72.9661407, -3574.02002, -0.730484903, 6.39014104e-08, -0.68292886, 3.59963224e-08, 1, 5.50667032e-08, 0.68292886, 1.56424669e-08, -0.730484903))
												v625 = Vector3.new(-2779.83521, 72.9661407, -3574.02002)
												local v626 = _u2()

												if (v625 - v626.Position).Magnitude <= 4 then
													task.wait(1.1)
													_u1.Remotes.CommF_:InvokeServer("Alchemist", "2")
												else
													v625 = _u1.Remotes.CommF_:InvokeServer("Alchemist", "1")

													if v625 == 1 then
														v625 = _u0.Backpack:FindFirstChild("Flower 1")

														if v625 then
															v625 = _u3()
															v625 = v625:FindFirstChild("Flower 1")

															if v625 then
																Tween(game.Workspace.Flower1.CFrame)
															else
															else
																v625 = _u0.Backpack:FindFirstChild("Flower 2")

																if v625 then
																	v625 = _u3()
																	v625 = v625:FindFirstChild("Flower 2")

																	if v625 then
																		Tween(game.Workspace.Flower2.CFrame)
																	else
																	else
																		v625 = _u0.Backpack:FindFirstChild("Flower 3")

																		if v625 then
																			v625 = _u3()
																			v625 = v625:FindFirstChild("Flower 3")

																			if v625 then
																				v625 = game:GetService("Workspace")
																				v625 = v625.Enemies:FindFirstChild("Zombie")

																				if not v625 then
																					v626 = game:GetService("Workspace")
																					local v625, v626, v627 = _u4(v626.Enemies:GetChildren())

																					while true do

																						if -3574.02002.Name == "Zombie" then

																							while true do
																								task.wait()
																								EquipTool(SelectWeaponFarm)
																								Tween(-3574.02002.HumanoidRootPart.CFrame * Farm_Mode)
																								-3574.02002.HumanoidRootPart.CanCollide = false
																								local v628 = Vector3.new(60, 60, 60)
																								-3574.02002.HumanoidRootPart.Size = v628
																								-3574.02002.HumanoidRootPart.Transparency = 1
																								-3574.02002.Humanoid:ChangeState(11)
																								-3574.02002.Humanoid:ChangeState(14)
																								EvoV2_Farm_Name = -3574.02002.Name
																								EvoV2_Farm_CFrame = -3574.02002.HumanoidRootPart.CFrame
																								AutoClick()
																								local v629 = _u0.Backpack:FindFirstChild("Flower 3")

																								if v629 then

																									if not -3574.02002.Parent then

																										if -3574.02002.Humanoid.Health > 0 then

																											if AutoEvoRace ~= false then
																												v629 = game:GetService("Workspace")
																												v629 = v629.Enemies:FindFirstChild(-3574.02002.Name)

																												if v629 then
																												end

																											end

																										end

																									end

																								end

																							end

																							for v630, v631 in v625, v626, v627 do
																							end

																						else

																							if not _u5 then
																								BTP(CFrame.new(-5854.39014, 145.093857, -686.942017, 0.379233211, -1.41975844e-08, -0.925301135, -3.77265719e-10, 1, -1.5498367e-08, 0.925301135, 6.2265797e-09, 0.379233211))
																							else
																								Tween(CFrame.new(-5854.39014, 145.093857, -686.942017, 0.379233211, -1.41975844e-08, -0.925301135, -3.77265719e-10, 1, -1.5498367e-08, 0.925301135, 6.2265797e-09, 0.379233211))
																							else
																								v625 = _u1.Remotes.CommF_:InvokeServer("Alchemist", "1")

																								if v625 == 2 then
																									_u1.Remotes.CommF_:InvokeServer("Alchemist", "3")
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
								end

							end
						end)
						v497:AddToggle("Auto Bartilo", AutoBartilo, function(a)
							AutoBartilo = a
							CancelTween(AutoBartilo)
							local v632 = _u0.Backpack:FindFirstChild("Warrior Helmet")

							if not v632 then
								Success = true
							else
								v632 = _u1()
								v632 = v632:FindFirstChild("Warrior Helmet")

								if not v632 then
									Success = true
								end

							end
						end)
						spawn(function()
							while true do
								local v633 = task.wait()

								if not v633 then

									if not AutoBartilo then
									end

									pcall(function()
										if 850 <= _u0.Data.Level.Value then
											local v634 = _u1.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")

											if v634 == 0 then
												v634 = string.find(_u0.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates")

												if not v634 then
													v634 = string.find(_u0.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50")

													if not v634 then

														if _u0.PlayerGui.Main.Quest.Visible == true then
															v634 = game:GetService("Workspace")
															v634 = v634.Enemies:FindFirstChild("Swan Pirate")

															if not v634 then
																local v635 = game:GetService("Workspace")
																local v634, v635, v636 = _u2(v635.Enemies:GetChildren())

																while true do

																	if v637.Name == "Swan Pirate" then

																		while true do
																			task.wait()
																			EquipTool(SelectWeaponFarm)
																			Tween(v637.HumanoidRootPart.CFrame * Farm_Mode)
																			v637.HumanoidRootPart.CanCollide = false
																			local v638 = Vector3.new(60, 60, 60)
																			v637.HumanoidRootPart.Size = v638
																			v637.HumanoidRootPart.Transparency = 1
																			v637.Humanoid:ChangeState(11)
																			v637.Humanoid:ChangeState(14)
																			Bartilo_Farm_Name = v637.Name
																			Bartilo_Farm_CFrame = v637.HumanoidRootPart.CFrame
																			AutoClick()

																			if not v637.Parent then

																				if v637.Humanoid.Health > 0 then

																					if AutoBartilo ~= false then

																						if _u0.PlayerGui.Main.Quest.Visible ~= false then
																							local v639 = game:GetService("Workspace")
																							v639 = v639.Enemies:FindFirstChild(v637.Name)

																							if v639 then
																							end

																						end

																					end

																				end

																			end

																		end

																		for v640, v637 in v634, v635, v636 do
																		end

																	else

																		if not _u3 then
																			BTP(CFrame.new(1057.92761, 137.614319, 1242.08069))
																		else
																			Tween(CFrame.new(1057.92761, 137.614319, 1242.08069))
																		else
																		else
																		else
																			Tween(CFrame.new(-456.28952, 73.0200958, 299.895966))
																			v634 = Vector3.new(-456.28952, 73.0200958, 299.895966)
																			v635 = _u4()

																			if (v634 - v635.Position).Magnitude <= 30 then
																				task.wait(1.1)
																				_u1.Remotes.CommF_:InvokeServer("StartQuest", "BartiloQuest", 1)
																			else
																			else

																				if 850 <= _u0.Data.Level.Value then
																					v634 = _u1.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")

																					if v634 == 1 then

																						if QuestBartilo == nil then
																							Tween(CFrame.new(-456.28952, 73.0200958, 299.895966))
																						end

																						v634 = Vector3.new(-456.28952, 73.0200958, 299.895966)
																						v635 = _u4()

																						if (v634 - v635.Position).Magnitude <= 30 then
																							task.wait(1.1)
																							_u1.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")
																							QuestBartilo = 1
																						end

																						v634 = game.Workspace.Enemies:FindFirstChild("Jeremy")

																						if not v634 then
																							local v634, v635, v636 = _u2(game.Workspace.Enemies:GetChildren())

																							while true do

																								if 299.895966.Name == "Jeremy" then

																									while true do
																										task.wait()
																										EquipTool(SelectWeaponFarm)
																										Tween(299.895966.HumanoidRootPart.CFrame * Farm_Mode)
																										299.895966.HumanoidRootPart.CanCollide = false
																										v638 = Vector3.new(60, 60, 60)
																										299.895966.HumanoidRootPart.Size = v638
																										299.895966.HumanoidRootPart.Transparency = 1
																										299.895966.Humanoid:ChangeState(11)
																										299.895966.Humanoid:ChangeState(14)
																										AutoClick()

																										if not 299.895966.Parent then

																											if 299.895966.Humanoid.Health > 0 then

																												if AutoBartilo ~= false then
																													v639 = game:GetService("Workspace")
																													v639 = v639.Enemies:FindFirstChild(299.895966.Name)

																													if v639 then
																													end

																												end

																											end

																										end

																									end

																									for v640, v637 in v634, v635, v636 do
																									end

																								else
																									Tween(CFrame.new(1931.5931396484, 402.67391967773, 956.52215576172))

																									if QuestBartilo == 1 then
																										Tween(CFrame.new(1931.5931396484, 402.67391967773, 956.52215576172))
																									else
																									else

																										if 850 <= _u0.Data.Level.Value then
																											v634 = _u1.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")

																											if v634 == 2 then
																												v635 = game:GetService("Workspace")
																												Tween(v635.Map.Dressrosa.BartiloPlates.Plate1.CFrame)
																												task.wait(1)
																												v634 = _u4()
																												v635 = game:GetService("Workspace")
																												v634.CFrame = v635.Map.Dressrosa.BartiloPlates.Plate2.CFrame
																												task.wait(1)
																												v634 = _u4()
																												v635 = game:GetService("Workspace")
																												v634.CFrame = v635.Map.Dressrosa.BartiloPlates.Plate3.CFrame
																												task.wait(1)
																												v634 = _u4()
																												v635 = game:GetService("Workspace")
																												v634.CFrame = v635.Map.Dressrosa.BartiloPlates.Plate4.CFrame
																												task.wait(1)
																												v634 = _u4()
																												v635 = game:GetService("Workspace")
																												v634.CFrame = v635.Map.Dressrosa.BartiloPlates.Plate5.CFrame
																												task.wait(1)
																												v634 = _u4()
																												v635 = game:GetService("Workspace")
																												v634.CFrame = v635.Map.Dressrosa.BartiloPlates.Plate6.CFrame
																												task.wait(1)
																												v634 = _u4()
																												v635 = game:GetService("Workspace")
																												v634.CFrame = v635.Map.Dressrosa.BartiloPlates.Plate7.CFrame
																												task.wait(1)
																												v634 = _u4()
																												v635 = game:GetService("Workspace")
																												v634.CFrame = v635.Map.Dressrosa.BartiloPlates.Plate8.CFrame
																												task.wait(1)
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
								end

							end
						end)
						v497:AddToggle("Auto Factory", AutoFactory, function(a)
							AutoFactory = a
							CancelTween(AutoFactory)
						end)
						spawn(function()
							while true do
								local v641 = task.wait()

								if not v641 then

									if not AutoFactory then
									end

									v641 = game.Workspace.Enemies:FindFirstChild("Core")

									if not v641 then
										local v641, v642, v643 = _u0(game.Workspace.Enemies:GetChildren())

										while true do

											if v644.Name == "Core" then

												if 0 < v644.Humanoid.Health then

													while true do
														task.wait()
														Tween(CFrame.new(448.46756, 199.356781, -441.389252))
														EquipTool(SelectWeaponFarm)
														AutoClick()

														if not v644.Parent then

															if v644.Humanoid.Health > 0 then

																if AutoFactory == false then
																end

															end

														end

													end

												end

												for v646, v644 in v641, v642, v643 do
												end

											end

										end

										v641 = _u1:FindFirstChild("Core")

										if not v641 then
										end

										Tween(CFrame.new(448.46756, 199.356781, -441.389252))
										task.wait()

										if not AutoFactory then
										end

										v641 = _u2()
										v642 = Vector3.new(448.46756, 199.356781, -441.389252)

										if (v641.Position - v642).Magnitude > 10 then
										end

									end
						end)
						v497:AddToggle("Auto Don Swan", _G["SwanGlasses"], function(a)
							_G.SwanGlasses = a
							CancelTween(_G.SwanGlasses)
						end)
						spawn(function()
							while true do
								local v647 = task.wait()

								if not v647 then

									if not _G.SwanGlasses then
									end

									v647 = game:GetService("Workspace")
									v647 = v647.Enemies:FindFirstChild("Don Swan")

									if not v647 then
										local v648 = game:GetService("Workspace")
										local v647, v648, v649 = _u0(v648.Enemies:GetChildren())

										while true do

											if v650.Name == "Don Swan" then

												if 0 < v650.Humanoid.Health then
													local v651 = v650:IsA("Model")

													if not v651 then
														v651 = v650:FindFirstChild("Humanoid")

														if not v651 then
															v651 = v650:FindFirstChild("HumanoidRootPart")

															if not v651 then

																while true do
																	task.wait()
																	EquipTool(SelectWeaponFarm)
																	Tween(v650.HumanoidRootPart.CFrame * Farm_Mode)
																	v650.HumanoidRootPart.CanCollide = false
																	local v652 = Vector3.new(60, 60, 60)
																	v650.HumanoidRootPart.Size = v652
																	v650.HumanoidRootPart.Transparency = 1
																	v650.Humanoid:ChangeState(11)
																	v650.Humanoid:ChangeState(14)
																	AutoClick()

																	if _G.SwanGlasses ~= false then

																		if v650.Humanoid.Health > 0 then

																			if v650.Parent then
																			end

																		end

																	end

																end

															end

														end

													end

												end

												for v653, v650 in v647, v648, v649 do
												end

											end

										end

										if not _u1 then
											BTP(CFrame.new(2191.1674804688, 15.177842140198, 694.69873046875))
										end

									end

									Tween(CFrame.new(2191.1674804688, 15.177842140198, 694.69873046875))
								end

							end
						end)
						v497:AddToggle("Auto Buy Haki Color", AutoColorHaki, function(a) AutoColorHaki = a end)
						spawn(function()
							while true do
								local v654 = task.wait()

								if not v654 then

									if not AutoColorHaki then
									end

									pcall(function() _u0.Remotes.CommF_:InvokeServer("ColorsDealer", "2") end)
								end

							end
						end)
					end

					if not Third_Sea then
						v497:AddToggle("Auto Citizen", AutoCitizen, function(a)
							AutoCitizen = a
							CancelTween(AutoCitizen)
							local v655 = _u0.Backpack:FindFirstChild("Musketeer Hat")

							if not v655 then
								CTCH = true
							else
								v655 = _u1()
								v655 = v655:FindFirstChild("Musketeer Hat")

								if not v655 then
									CTCH = true
								end

							end

							if not CTCH then

								if not CheckCitizen then
									_u2("Auto Quest Citizen", "Musketeer Hat Successfully", 3)
								else
								else
									v655 = _u3.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")

									if v655 == 3 then

										if not CheckCitizen then
											_u2("Auto Quest Citizen", "Citizen Quest Completed", 3)
										end

									end

								end

							end
						end)
						spawn(function()
							while true do
								local v656 = task.wait()

								if not v656 then

									if not AutoCitizen then
									end

									pcall(function()
										if 1800 <= _u0.Data.Level.Value then
											local v657 = _u1.Remotes.CommF_:InvokeServer("CitizenQuestProgress")

											if v657.KilledBandits == false then
												v657 = string.find(_u0.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate")

												if not v657 then
													v657 = string.find(_u0.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50")

													if not v657 then

														if _u0.PlayerGui.Main.Quest.Visible == true then
															v657 = game:GetService("Workspace")
															v657 = v657.Enemies:FindFirstChild("Forest Pirate")

															if not v657 then
																local v658 = game:GetService("Workspace")
																local v657, v658, v659 = _u2(v658.Enemies:GetChildren())

																while true do

																	if v660.Name == "Forest Pirate" then

																		while true do
																			task.wait()
																			EquipTool(SelectWeaponFarm)
																			Tween(v660.HumanoidRootPart.CFrame * Farm_Mode)
																			v660.HumanoidRootPart.CanCollide = false
																			local v661 = Vector3.new(60, 60, 60)
																			v660.HumanoidRootPart.Size = v661
																			v660.HumanoidRootPart.Transparency = 1
																			v660.Humanoid:ChangeState(11)
																			v660.Humanoid:ChangeState(14)
																			Citizen_Farm_Name = v660.Name
																			Citizen_Farm_CFrame = v660.HumanoidRootPart.CFrame
																			AutoClick()

																			if AutoCitizen ~= false then

																				if not v660.Parent then

																					if v660.Humanoid.Health > 0 then

																						if _u0.PlayerGui.Main.Quest.Visible ~= false then
																							local v662 = game:GetService("Workspace")
																							v662 = v662.Enemies:FindFirstChild(v660.Name)

																							if v662 then
																							end

																						end

																					end

																				end

																			end

																		end

																		for v663, v660 in v657, v658, v659 do
																		end

																	else

																		if not _u3 then
																			BTP(CFrame.new(-13459.065429688, 412.68927001953, -7783.1860351563))
																		else
																			Tween(CFrame.new(-13459.065429688, 412.68927001953, -7783.1860351563))
																		else
																		else
																		else
																			Tween(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
																			v657 = Vector3.new(-12443.8671875, 332.40396118164, -7675.4892578125)
																			v658 = _u4()

																			if (v657 - v658.Position).Magnitude <= 30 then
																				task.wait(1.5)
																				_u1.Remotes.CommF_:InvokeServer("StartQuest", "CitizenQuest", 1)
																			else
																			else

																				if 1800 <= _u0.Data.Level.Value then
																					v657 = _u1.Remotes.CommF_:InvokeServer("CitizenQuestProgress")

																					if v657.KilledBoss == false then

																						if not _u0.PlayerGui.Main.Quest.Visible then
																							v657 = string.find(_u0.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant")

																							if not v657 then

																								if _u0.PlayerGui.Main.Quest.Visible == true then
																									v657 = game:GetService("Workspace")
																									v657 = v657.Enemies:FindFirstChild("Captain Elephant")

																									if not v657 then
																										v658 = game:GetService("Workspace")
																										local v657, v658, v659 = _u2(v658.Enemies:GetChildren())

																										while true do

																											if 1.Name == "Captain Elephant" then

																												while true do
																													task.wait()
																													EquipTool(SelectWeaponFarm)
																													Tween(1.HumanoidRootPart.CFrame * Farm_Mode)
																													1.HumanoidRootPart.CanCollide = false
																													v661 = Vector3.new(60, 60, 60)
																													1.HumanoidRootPart.Size = v661
																													1.HumanoidRootPart.Transparency = 1
																													1.Humanoid:ChangeState(11)
																													1.Humanoid:ChangeState(14)
																													AutoClick()

																													if AutoCitizen ~= false then

																														if 1.Humanoid.Health > 0 then

																															if not 1.Parent then

																																if _u0.PlayerGui.Main.Quest.Visible ~= false then
																																	v662 = gamr:GetService("Workspace")
																																	v662 = v662.Enemies:FindFirstChild(1.Name)

																																	if v662 then
																																	end

																																end

																															end

																														end

																													end

																												end

																												for v663, v660 in v657, v658, v659 do
																												end

																											else

																												if not _u3 then
																													BTP(CFrame.new(-13459.065429688, 412.68927001953, -7783.1860351563))
																												else
																													Tween(CFrame.new(-13459.065429688, 412.68927001953, -7783.1860351563))
																												else
																												else
																												else
																													Tween(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
																													v657 = CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125)
																													v658 = _u4()

																													if (v657.Position - v658.Position).Magnitude <= 4 then
																														task.wait(1.5)
																														_u1.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
																													else
																													else

																														if 1800 <= _u0.Data.Level.Value then
																															v657 = _u1.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")

																															if v657 == 2 then
																																Tween(CFrame.new(-12512.138671875, 340.39279174805, -9872.8203125))
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
								end

							end
						end)
						v497:AddToggle("Auto Buy Haki Color", AutoColorHaki, function(a) AutoColorHaki = a end)
						spawn(function()
							while true do
								local v664 = task.wait()

								if not v664 then

									if not AutoColorHaki then
									end

									pcall(function() _u0.Remotes.CommF_:InvokeServer("ColorsDealer", "2") end)
								end

							end
						end)
						v497:AddToggle("Auto Musketer", AutoMusketeer, function(a)
							AutoMusketeer = a
							CancelTween(AutoMusketeer)
						end)
						spawn(function()
							while true do
								local v665 = task.wait()

								if not v665 then
									pcall(function()
										if not AutoMusketeer then

											if _u0.PlayerGui.Main.Quest.Visible == false then

												while true do
													Tween(CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625))
													task.wait(2)

													if not AutoMusketeer then
														local v667 = _u1()
														local v666 = Vector3.new(-12444.78515625, 332.40396118164, -7673.1806640625)

														if (v667.Position - v666).Magnitude <= 10 then
														end

													end

													task.wait(0.5)
													_u2.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
													task.wait(1)
													_u2.Remotes.CommF_:InvokeServer("StartQuest", "CitizenQuest", 1)
												else
													v667 = string.find(_u0.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Defeat 50 Forest Pirates")

													if not v667 then
														v667 = game:GetService("Workspace")
														v667 = v667.Enemies:FindFirstChild("Forest Pirate")

														if not v667 then
															v666 = game:GetService("Workspace")
															local v667, v666, v668 = _u3(v666.Enemies:GetChildren())

															while true do

																if 1.Name == "Forest Pirate" then

																	while true do
																		task.wait()
																		EquipTool(SelectWeaponFarm)
																		Tween(1.HumanoidRootPart.CFrame * Farm_Mode)
																		1.HumanoidRootPart.CanCollide = false
																		local v669 = Vector3.new(60, 60, 60)
																		1.HumanoidRootPart.Size = v669
																		1.HumanoidRootPart.Transparency = 1
																		1.Humanoid:ChangeState(11)
																		1.Humanoid:ChangeState(14)
																		Musketere_Farm_Name = 1.Name
																		Musketere_Farm_CFrame = 1.HumanoidRootPart.CFrame
																		AutoClick()

																		if not AutoMusketeer then

																			if 1.Humanoid.Health > 0 then

																				if 1.Parent then
																				end

																			end

																		end

																	end

																	for v670, v671 in v667, v666, v668 do
																	end

																else
																	v666 = _u2:FindFirstChild("Forest Pirate")
																	Tween(v666.HumanoidRootPart.CFram)
																end

															end

														end

													end
									end)
								end

							end
						end)
						v497:AddToggle("Auto Serpent Bow", Auto_Serpent_Bow, function(a)
							Auto_Serpent_Bow = a
							CancelTween(Auto_Serpent_Bow)
						end)
						spawn(function()
							while true do
								local v672 = task.wait()

								if not v672 then
									pcall(function()
										if not Auto_Serpent_Bow then
											local v673 = game.Workspace.Enemies:FindFirstChild("Island Empress")

											if not v673 then
												local v673, v674, v675 = _u0(game.Workspace.Enemies:GetChildren())

												while true do
													local v677 = v676:FindFirstChild("Humanoid")

													if not v677 then
														v677 = v676:FindFirstChild("HumanoidRootPart")

														if not v677 then

															if 0 < v676.Humanoid.Health then

																if v676.Name == "Island Empress" then

																	while true do
																		task.wait()
																		EquipTool(SelectWeaponFarm)
																		Tween(v676.HumanoidRootPart.CFrame * Farm_Mode)
																		v676.HumanoidRootPart.CanCollide = false
																		local v678 = Vector3.new(60, 60, 60)
																		v676.HumanoidRootPart.Size = v678
																		v676.HumanoidRootPart.Transparency = 1
																		v676.Humanoid:ChangeState(11)
																		v676.Humanoid:ChangeState(14)
																		AutoClick()

																		if v676.Humanoid.Health > 0 then

																			if not v676.Parent then

																				if Auto_Serpent_Bow then
																				end

																			end

																		end

																	end

																end

															end

														end

														for v679, v676 in v673, v674, v675 do
														end

													else
														v674 = _u1:FindFirstChild("Island Empress")
														Tween(v674.HumanoidRootPart.CFrame)
													end

												end
									end)
								end

							end
						end)
						v497:AddToggle("Auto ArenaTrainer", false, function(a)
							_G.Namfon = a
							CancelTween(_G.Namfon)
							print(a)
						end)
						local v680 = CFrame["new"](3757.732421875, 91.995407104492188, 253.65066528320312)
						spawn(function()
							while true do
								local v681 = wait()

								if not v681 then

									if not _G.Namfon then
									end

									if not Third_Sea then
									end

									pcall(function()
										local v682 = game:GetService("Players")

										if v682.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
											local v683 = game:GetService("Players")
											v682 = string.find(v683.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Training Dummy")

											if v682 then
												v683 = game:GetService("Players")
												v682 = string.find(v683.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Training Dummy")

												if v682 then
													v683 = game:GetService("Players")
													v682 = string.find(v683.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Training Dummy")

													if not v682 then
													else
													else
														v682 = game:GetService("Workspace")
														v682 = v682.Enemies:FindFirstChild("Training Dummy")

														if v682 then
															v682 = game:GetService("Workspace")
															v682 = v682.Enemies:FindFirstChild("Training Dummy")

															if v682 then
																v682 = game:GetService("Workspace")
																v682 = v682.Enemies:FindFirstChild("Training Dummy")

																if not v682 then
																else
																else
																	v683 = game:GetService("Workspace")
																	local v682, v683, v684 = _u0(v683.Enemies:GetChildren())

																	while true do

																		if v685.Name ~= "Training Dummy" then

																			if v685.Name ~= "Training Dummy" then

																				if v685.Name == "Training Dummy" then
																				else
																				else
																					local v686 = v685:FindFirstChild("Humanoid")

																					if not v686 then
																						v686 = v685:FindFirstChild("HumanoidRootPart")

																						if not v686 then

																							if 0 < v685.Humanoid.Health then

																								while true do
																									wait()
																									AutoHaki()
																									EquipTool(SelectWeaponFarm)
																									Fastattack = true
																									v685.HumanoidRootPart.CanCollide = false
																									v685.Humanoid.WalkSpeed = 0
																									local v687 = Vector3.new(50, 50, 50)
																									v685.HumanoidRootPart.Size = v687
																									Tween(v685.HumanoidRootPart.CFrame * Farm_Mode)
																									AutoClick()

																									if _G.Namfon ~= false then

																										if v685.Humanoid.Health > 0 then

																											if v685.Parent then
																											end

																										end

																									end

																									Fastattack = false
																								end

																							end

																						end

																					end

																				end

																			end

																			for v688, v685 in v682, v683, v684 do
																			end

																		end

																	end

																else

																	if not BypassTP then

																		if 1500 < (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _u1.Position).Magnitude then
																			BTP(_u1)
																		else

																			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _u1.Position).Magnitude < 1500 then
																				Tween(_u1)
																			else
																				Tween(_u1)
																			end

																		end

																	end

																	Tween(CFrame.new(3757.732421875, 91.995407104492188, 253.65066528320312))
																	v682 = game:GetService("ReplicatedStorage")
																	v682 = v682:FindFirstChild("Training Dummy")

																	if not v682 then
																		v683 = game:GetService("ReplicatedStorage")
																		v683 = v683:FindFirstChild("Training Dummy")
																		Tween(v683.HumanoidRootPart.CFrame * MethodFarm)
																	else
																		v682 = game:GetService("ReplicatedStorage")
																		v682 = v682:FindFirstChild("Training Dummy")

																		if not v682 then
																			v683 = game:GetService("ReplicatedStorage")
																			v683 = v683:FindFirstChild("Training Dummy")
																			Tween(v683.HumanoidRootPart.CFrame * MethodFarm)
																		else
																			v682 = game:GetService("ReplicatedStorage")
																			v682 = v682:FindFirstChild("Training Dummy")

																			if not v682 then
																				v683 = game:GetService("ReplicatedStorage")
																				v683 = v683:FindFirstChild("Training Dummy")
																				Tween(v683.HumanoidRootPart.CFrame * MethodFarm)
																			else

																				if not _G.AutoArenaTrainerHop then
																					v682 = game:GetService("ReplicatedStorage")
																					v682 = v682.Remotes.CommF_:InvokeServer("ArenaTrainer")

																					if v682 == "I don't have anything for you right now. Come back later." then
																						hop()
																					else
																					else
																						v682 = game:GetService("ReplicatedStorage")
																						v682.Remotes.CommF_:InvokeServer("ArenaTrainer")
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
						end)
						v497:AddToggle("Auto Press Haki Color Button", false, function(a)
							Open_Color_Haki = a
							CancelTween(Open_Color_Haki)
							print(a)
						end)
						spawn(function()
							while true do
								local v689 = wait(0.3)

								if not v689 then
									pcall(function()
										if not Open_Color_Haki then
											local v690 = game:GetService("ReplicatedStorage")
											v690.Remotes.CommF_:InvokeServer("activateColor", "Winter Sky")
											wait(0.5)

											while true do
												Tween(CFrame.new(-5420.16602, 1084.9657, -2666.8208))
												wait()

												if _G.CancelTween ~= true then

													if Open_Color_Haki ~= false then
														local v691 = Vector3.new(-5420.16602, 1084.9657, -2666.8208)

														if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v691).Magnitude <= 10 then
														end

													end

												end

												wait(0.5)
												v690 = game:GetService("ReplicatedStorage")
												v690.Remotes.CommF_:InvokeServer("activateColor", "Pure Red")
												wait(0.5)

												while true do
													Tween(CFrame.new(-5414.41357, 309.865753, -2212.45776))
													wait()

													if _G.CancelTween ~= true then

														if Open_Color_Haki ~= false then
															v691 = Vector3.new(-5414.41357, 309.865753, -2212.45776)

															if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v691).Magnitude <= 10 then
															end

														end

													end

													wait(0.5)
													v690 = game:GetService("ReplicatedStorage")
													v690.Remotes.CommF_:InvokeServer("activateColor", "Snow White")
													wait(0.5)

													while true do
														Tween(CFrame.new(-4971.47559, 331.565765, -3720.02954))
														wait()

														if _G.CancelTween ~= true then

															if Open_Color_Haki ~= false then
																v691 = Vector3.new(-4971.47559, 331.565765, -3720.02954)

																if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v691).Magnitude <= 10 then
																end

															end

														end

														wait(0.5)
														v690 = game:GetService("VirtualUser")
														v690:Button1Down(v690)
														wait(3)
														v690 = game:GetService("VirtualUser")
														v690:Button1Down(v690)
													end
									end)
								end

							end
						end)
						v497:AddToggle("Auto Yama", AutoYama, function(a)
							AutoYama = a
							CancelTween(AutoYama)
						end)
						spawn(function()
							while true do
								local v692 = task.wait()

								if not v692 then

									if not AutoYama then
									end

									v692 = _u0.Remotes.CommF_:InvokeServer("EliteHunter", "Progress")

									if 30 <= v692 then
									end

									while true do
										task.wait()
										local v693 = game:GetService("Workspace")
										fireclickdetector(v693.Map.Waterfall.SealedKatana.Handle.ClickDetector)
										v692 = _u1.Backpack:FindFirstChild("Yama")

										if v692 then
										end

										if AutoYama then
										end

									end

								end
						end)
						v497:AddToggle("Auto Dark Dagger", AutoDarkDagger, function(a)
							AutoDarkDagger = a
							CancelTween(AutoDarkDagger)
						end)
						spawn(function()
							while true do
								local v694 = task.wait()

								if not v694 then

									if not AutoDarkDagger then
									end

									pcall(function()
										local v695 = game:GetService("Workspace")
										v695 = v695.Enemies:FindFirstChild("rip_indra True Form")

										if not v695 then
											local v696 = game:GetService("Workspace")
											local v695, v696, v697 = _u0(v696.Enemies:GetChildren())

											while true do
												local v699 = v698:FindFirstChild("Humanoid")

												if not v699 then
													v699 = v698:FindFirstChild("HumanoidRootPart")

													if not v699 then

														if 0 < v698.Humanoid.Health then

															if v698.Name == "rip_indra True Form" then

																while true do
																	task.wait()
																	EquipTool(SelectWeaponFarm)
																	Tween(v698.HumanoidRootPart.CFrame * Farm_Mode)
																	v698.HumanoidRootPart.CanCollide = false
																	local v700 = Vector3.new(60, 60, 60)
																	v698.HumanoidRootPart.Size = v700
																	v698.HumanoidRootPart.Transparency = 1
																	v698.Humanoid:ChangeState(11)
																	v698.Humanoid:ChangeState(14)
																	AutoClick()

																	if not AutoDarkDagger then

																		if not v698.Parent then

																			if v698.Humanoid.Health <= 0 then
																			end

																		end

																	end

																end

															end

														end

													end

													for v701, v698 in v695, v696, v697 do
													end

												else
													v696 = _u1:FindFirstChild("rip_indra True Form")
													Tween(v696.HumanoidRootPart.CFrame)
												end
									end)
								end

							end
						end)
						v497:AddToggle("Auto Hallow Sycthe", AutoHallowSycthe, function(a)
							AutoHallowSycthe = a
							CancelTween(AutoHallowSycthe)
						end)
						spawn(function()
							while true do
								local v702 = task.wait()

								if not v702 then

									if not AutoHallowSycthe then
									end

									pcall(function()
										local v703 = game:GetService("Workspace")
										v703 = v703.Enemies:FindFirstChild("Soul Reaper")

										if not v703 then
											local v704 = game:GetService("Workspace")
											local v703, v704, v705 = _u0(v704.Enemies:GetChildren())

											while true do
												local v707 = v706:FindFirstChild("Humanoid")

												if not v707 then
													v707 = v706:FindFirstChild("HumanoidRootPart")

													if not v707 then

														if 0 < v706.Humanoid.Health then

															if v706.Name == "Soul Reaper" then

																while true do
																	task.wait()
																	EquipTool(SelectWeaponFarm)
																	Tween(v706.HumanoidRootPart.CFrame * Farm_Mode)
																	v706.HumanoidRootPart.CanCollide = false
																	local v708 = Vector3.new(60, 60, 60)
																	v706.HumanoidRootPart.Size = v708
																	v706.HumanoidRootPart.Transparency = 1
																	v706.Humanoid:ChangeState(11)
																	v706.Humanoid:ChangeState(14)
																	AutoClick()

																	if v706.Humanoid.Health > 0 then

																		if not AutoHallowSycthe then

																			if v706.Parent then
																			end

																		end

																	end

																end

															end

														end

													end

													for v709, v706 in v703, v704, v705 do
													end

												else
													v703 = CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125)
													loc3 = v703
													v703 = _u1.Backpack:FindFirstChild("Hallow Essence")

													if v703 then
														v703 = _u2()
														v703 = v703:FindFirstChild("Hallow Essence")

														if not v703 then
														else

															while true do
																task.wait()
																Tween(loc3)
																task.wait()
																v704 = _u3()

																if (loc3.Position - v704.Position).Magnitude <= 8 then
																end

																EquipTool("Hallow Essence")
															end

														else
															v704 = _u4:FindFirstChild("Soul Reaper")
															Tween(v704.HumanoidRootPart.CFrame)
														end

													end
									end)
								end

							end
						end)
						v497:AddToggle("Auto Cavander", AutoCavander, function(a)
							AutoCavander = a
							CancelTween(AutoCavander)
						end)
						spawn(function()
							while true do
								local v710 = task.wait()

								if not v710 then

									if not AutoCavander then
									end

									pcall(function()
										local v711 = game:GetService("Workspace")
										v711 = v711.Enemies:FindFirstChild("Beautiful Pirate")

										if not v711 then
											local v712 = game:GetService("Workspace")
											local v711, v712, v713 = _u0(v712.Enemies:GetChildren())

											while true do
												local v715 = v714:FindFirstChild("Humanoid")

												if not v715 then
													v715 = v714:FindFirstChild("HumanoidRootPart")

													if not v715 then

														if 0 < v714.Humanoid.Health then

															if v714.Name == "Beautiful Pirate" then

																while true do
																	task.wait()
																	EquipTool(SelectWeaponFarm)
																	Tween(v714.HumanoidRootPart.CFrame * Farm_Mode)
																	v714.HumanoidRootPart.CanCollide = false
																	local v716 = Vector3.new(60, 60, 60)
																	v714.HumanoidRootPart.Size = v716
																	v714.HumanoidRootPart.Transparency = 1
																	v714.Humanoid:ChangeState(11)
																	v714.Humanoid:ChangeState(14)
																	AutoClick()

																	if not AutoCavander then

																		if not v714.Parent then

																			if v714.Humanoid.Health <= 0 then
																			end

																		end

																	end

																end

															end

														end

													end

													for v717, v714 in v711, v712, v713 do
													end

												else

													if not _u1 then
														v712 = _u2:FindFirstChild("Beautiful Pirate")
														BTP(v712.HumanoidRootPart.CFrame)
													else
														v712 = _u2:FindFirstChild("Beautiful Pirate")
														Tween(v712.HumanoidRootPart.CFrame)
													end

												end
									end)
								end

							end
						end)
						v497:AddToggle("Auto Tushita", AutoTushita, function(a)
							AutoTushita = a
							CancelTween(AutoTushita)
						end)

						function enemyrip()
							Tween(CFrame.new(-5332.30371, 423.985413, -2673.48218))
							task.wait()
							local v719 = game.Workspace.Enemies:FindFirstChild("rip_indra True Form")

							if not v719 then
								v719 = game.Workspace.Enemies:GetChildren()
								local v718, v720, v721 = _u0(v719)

								while true do

									if v722.Name == "rip_indra True Form" then
										local v723 = v722:IsA("Model")

										if not v723 then
											v723 = v722:FindFirstChild("Humanoid")

											if not v723 then
												v723 = v722:FindFirstChild("HumanoidRootPart")

												if not v723 then

													if 0 < v722.Humanoid.Health then
														do return v722 end
													end

												end

											end

										end

									end

									for v724, v722 in v718, v720, v721 do
									end

								end

								return _u1:FindFirstChild(_u1, "rip_indra True Form [Lv. 5000] [Raid Boss]")
								return _u1:FindFirstChild
						end

						function enemyEliteBoss()
							local v725 = game.Workspace.Enemies:FindFirstChild("Deandre")

							if v725 then
								v725 = game.Workspace.Enemies:FindFirstChild("Urban")

								if v725 then
									v725 = game.Workspace.Enemies:FindFirstChild("Diablo")

									if not v725 then
									else
									else
										v725 = game.Workspace.Enemies:GetChildren()
										local v726, v727, v728 = _u0(v725)

										while true do

											if v729.Name ~= "Deandre" then

												if v729.Name ~= "Diablo" then

													if v729.Name == "Urban" then
														local v730 = v729:FindFirstChild("Humanoid")

														if not v730 then
															v730 = v729:FindFirstChild("HumanoidRootPart")

															if not v730 then

																if 0 < v729.Humanoid.Health then
																else
																else
																	do return v729 end
																end

															end

														end

													end

												end

											end

											for v731, v729 in v726, v727, v728 do
											end

										end

									end

								end

								v725 = _u1:FindFirstChild("Deandre")

								if v725 then
									v725 = _u1:FindFirstChild("Urban")

									if v725 then
										v725 = _u1:FindFirstChild("Diablo")
									end

								end

								return v725
						end

						function enemylongma()
							Tween(CFrame.new(-10171.7051, 406.981995, -9552.31738))
							local v733 = game.Workspace.Enemies:FindFirstChild("Longma")

							if not v733 then
								v733 = game.Workspace.Enemies:GetChildren()
								local v732, v734, v735 = _u0(v733)

								while true do

									if v736.Name == "Longma" then
										local v737 = v736:FindFirstChild("Humanoid")

										if not v737 then
											v737 = v736:FindFirstChild("HumanoidRootPart")

											if not v737 then

												if 0 < v736.Humanoid.Health then
													do return v736 end
												end

											end

										end

									end

									for v738, v736 in v732, v734, v735 do
									end

								end

								return _u1:FindFirstChild(_u1, "Longma")
								return _u1:FindFirstChild
						end

						function autoTushita()
							local v739 = _u0.Backpack:FindFirstChild("God's Chalice")

							if v739 then
								v739 = _u1()
								v739 = v739:FindFirstChild("God's Chalice")

								if v739 then
									v739 = game.Workspace.Enemies:FindFirstChild("Deandre")

									if v739 then
										v739 = game.Workspace.Enemies:FindFirstChild("Urban")

										if v739 then
											v739 = game.Workspace.Enemies:FindFirstChild("Diablo")

											if v739 then
												v739 = _u2:FindFirstChild("Deandre")

												if v739 then
													v739 = _u2:FindFirstChild("Urban")

													if v739 then
														v739 = _u2:FindFirstChild("Diablo")

														if not v739 then
														else
														else
														else
														else
														else

															if _u0.PlayerGui.Main.Quest.Visible == false then

																while true do
																	Tween(CFrame.new(5420.49219, 314.446045, -2823.07373))
																	task.wait()

																	if not AutoTushita then
																		v739 = _u3()
																		local v740 = Vector3.new(5420.49219, 314.446045, -2823.07373)

																		if (v739.Position - v740).Magnitude <= 10 then
																		end

																	end

																	task.wait(1)

																	while true do
																		Tween(CFrame.new(5420.49219, 314.446045, -2823.07373))
																		task.wait()

																		if not AutoTushita then
																			v739 = _u3()
																			v740 = Vector3.new(5420.49219, 314.446045, -2823.07373)

																			if (v739.Position - v740).Magnitude <= 10 then
																			end

																		end

																		task.wait(1.1)
																		_u2.Remotes.CommF_:InvokeServer("EliteHunter")
																		task.wait(1)
																	else

																		if _u0.PlayerGui.Main.Quest.Visible == true then
																			CheckLevel()
																			pcall(function()
																				local v741 = enemyEliteBoss()
																				v741.HumanoidRootPart.CanCollide = false
																				local v742 = Vector3.new(50, 50, 50)
																				v741.HumanoidRootPart.Size = v742
																				EquipTool(SelectWeaponFarm)
																				Tween(v741.HumanoidRootPart.CFrame * Farm_Mode)
																				AutoClick()
																			end)
																		end

																	end

																end

															end

														end

													else
														Tween(CFrame.new(-12554.9443, 337.194092, -7501.44727))
													else
													else
														v739 = _u0.Backpack:FindFirstChild("God's Chalice")

														if v739 then
															v739 = _u1()
															v739 = v739:FindFirstChild("God's Chalice")

															if not v739 then
															else
																_u2.Remotes.CommF_:InvokeServer("activateColor", "Winter Sky")
																task.wait(0.5)

																while true do
																	Tween(CFrame.new(-5420.16602, 1084.9657, -2666.8208))
																	task.wait()

																	if not AutoTushita then
																		v739 = _u3()
																		v740 = Vector3.new(-5420.16602, 1084.9657, -2666.8208)

																		if (v739.Position - v740).Magnitude <= 10 then
																		end

																	end

																	task.wait(0.5)
																	_u2.Remotes.CommF_:InvokeServer("activateColor", "Pure Red")
																	task.wait(0.5)

																	while true do
																		Tween(CFrame.new(-5414.41357, 309.865753, -2212.45776))
																		task.wait()

																		if not AutoTushita then
																			v739 = _u3()
																			v740 = Vector3.new(-5414.41357, 309.865753, -2212.45776)

																			if (v739.Position - v740).Magnitude <= 10 then
																			end

																		end

																		task.wait(0.5)
																		_u2.Remotes.CommF_:InvokeServer("activateColor", "Snow White")
																		task.wait(0.5)

																		while true do
																			Tween(CFrame.new(-4971.47559, 331.565765, -3720.02954))
																			task.wait()

																			if not AutoTushita then
																				v739 = _u3()
																				v740 = Vector3.new(-4971.47559, 331.565765, -3720.02954)

																				if (v739.Position - v740).Magnitude <= 10 then
																				end

																			end

																			task.wait(0.5)
																			EquipTool("God's Chalice")
																			task.wait(0.5)

																			while true do
																				Tween(CFrame.new(-5560.27295, 313.915466, -2663.89795))
																				task.wait()

																				if not AutoTushita then
																					v739 = _u3()
																					v740 = Vector3.new(-5560.27295, 313.915466, -2663.89795)

																					if (v739.Position - v740).Magnitude <= 10 then
																					end

																				end

																				task.wait(0.5)

																				while true do
																					Tween(CFrame.new(-5561.37451, 313.342529, -2663.4948))
																					task.wait()

																					if not AutoTushita then
																						v739 = _u3()
																						v740 = Vector3.new(5420.49219, 314.446045, -2823.07373)

																						if (v739.Position - v740).Magnitude <= 10 then
																						end

																					end

																					task.wait(1)

																					while true do
																						Tween(CFrame.new(5154.17676, 141.786423, 911.046326))
																						task.wait()

																						if not AutoTushita then
																							v739 = _u3()
																							v740 = Vector3.new(5420.49219, 314.446045, -2823.07373)

																							if (v739.Position - v740).Magnitude <= 10 then
																							end

																						end

																						task.wait(0.2)

																						while true do
																							Tween(CFrame.new(5148.03613, 162.352493, 910.548218))
																							task.wait()

																							if not AutoTushita then
																								v739 = _u3()
																								v740 = Vector3.new(5420.49219, 314.446045, -2823.07373)

																								if (v739.Position - v740).Magnitude <= 10 then
																								end

																							end

																							task.wait(1)
																							EquipTool("Holy Torch")
																							task.wait(1)
																							task.wait(0.4)

																							while true do
																								Tween(CFrame.new(-10752.7695, 412.229523, -9366.36328))
																								task.wait()

																								if not AutoTushita then
																									v739 = _u3()
																									v740 = Vector3.new(5420.49219, 314.446045, -2823.07373)

																									if (v739.Position - v740).Magnitude <= 10 then
																									end

																								end

																								task.wait(0.4)

																								while true do
																									Tween(CFrame.new(-11673.4111, 331.749023, -9474.34668))
																									task.wait()

																									if not AutoTushita then
																										v739 = _u3()
																										v740 = Vector3.new(5420.49219, 314.446045, -2823.07373)

																										if (v739.Position - v740).Magnitude <= 10 then
																										end

																									end

																									task.wait(0.4)

																									while true do
																										Tween(CFrame.new(-12133.3389, 519.47522, -10653.1904))
																										task.wait()

																										if not AutoTushita then
																											v739 = _u3()
																											v740 = Vector3.new(5420.49219, 314.446045, -2823.07373)

																											if (v739.Position - v740).Magnitude <= 10 then
																											end

																										end

																										task.wait(0.4)

																										while true do
																											Tween(CFrame.new(-13336.5, 485.280396, -6983.35254))
																											task.wait()

																											if not AutoTushita then
																												v739 = _u3()
																												v740 = Vector3.new(5420.49219, 314.446045, -2823.07373)

																												if (v739.Position - v740).Magnitude <= 10 then
																												end

																											end

																											task.wait(0.4)

																											while true do
																												Tween(CFrame.new(-13487.4131, 334.84845, -7926.34863))
																												task.wait()

																												if not AutoTushita then
																													v739 = _u3()
																													v740 = Vector3.new(5420.49219, 314.446045, -2823.07373)

																													if (v739.Position - v740).Magnitude <= 10 then
																													end

																												end

																												task.wait(1)
																											end

																										else
																											v739 = game.Workspace.Enemies:FindFirstChild("Longma")

																											if v739 then
																												v739 = _u2:FindFirstChild("Longma")

																												if not v739 then
																												else
																													pcall(function()
																														local v743 = enemylongma()
																														v743.HumanoidRootPart.CanCollide = false
																														local v744 = Vector3.new(50, 50, 50)
																														v743.HumanoidRootPart.Size = v744
																														EquipTool(SelectWeaponFarm)
																														Tween(v743.HumanoidRootPart.CFrame * Farm_Mode)
																														Click()
																													end)
																												end

																											else
																												v739 = game.Workspace.Enemies:FindFirstChild("rip_indra True Form")

																												if v739 then
																													v739 = _u2:FindFirstChild("rip_indra True Form")

																													if not v739 then
																													else
																														pcall(function()
																															local v745 = enemyrip()
																															v745.HumanoidRootPart.CanCollide = false
																															local v746 = Vector3.new(50, 50, 50)
																															v745.HumanoidRootPart.Size = v746
																															EquipTool(SelectWeaponFarm)
																															Tween(v745.HumanoidRootPart.CFrame * Farm_Mode)
																															AutoClick()
																														end)
																													end

																												else
																													Tween(CFrame.new(-12554.9443, 337.194092, -7501.44727))
																												end

																											end

																										end

																									end

																								end

																							end

																						end

																					end
						end

						spawn(function()
							while true do
								local v747 = task.wait()

								if not v747 then

									if not AutoTushita then
									end

									pcall(function() autoTushita() end)
								end

							end
						end)

						function GetWeaponInventory(a)
							local v749, v748, v750 = _u0(_u1.Remotes.CommF_:InvokeServer("getInventory"))

							while true do
								local v752 = type(v751)

								if v752 == "table" then

									if v751.Type == "Sword" then

										if v751.Name == a then
											do return true end
										end

									end

								end

								for v753, v751 in v749, v748, v750 do
								end

								return false
						end

						v497:AddToggle("Auto CDK", Auto_Cursed_Dual_Katana, function(a)
							Auto_Cursed_Dual_Katana = a
							CancelTween(Auto_Cursed_Dual_Katana)
						end)
						spawn(function()
							while true do
								local v754 = task.wait()

								if not v754 then
									pcall(function()
										if not Auto_Cursed_Dual_Katana then
											local v755 = _u0()
											v755 = v755:FindFirstChild("Tushita")

											if v755 then
												v755 = _u1.Backpack:FindFirstChild("Tushita")

												if v755 then
													v755 = _u0()
													v755 = v755:FindFirstChild("Yama")

													if v755 then
														v755 = _u1.Backpack:FindFirstChild("Yama")

														if not v755 then
														else
														else
														else
															v755 = _u0()
															v755 = v755:FindFirstChild("Tushita")

															if v755 then
																v755 = _u1.Backpack:FindFirstChild("Tushita")

																if not v755 then
																else
																	v755 = _u1.Backpack:FindFirstChild("Tushita")

																	if not v755 then
																		EquipTool("Tushita")
																	end

																else
																	v755 = _u0()
																	v755 = v755:FindFirstChild("Yama")

																	if v755 then
																		v755 = _u1.Backpack:FindFirstChild("Yama")

																		if not v755 then
																		else
																			v755 = _u1.Backpack:FindFirstChild("Yama")

																			if not v755 then
																				EquipTool("Yama")
																			end

																		end

																	end

																else
																	_u2.Remotes.CommF_:InvokeServer("LoadItem", "Tushita")
																end

															end

														end

													end

												end

											end

											v755 = CheckMaterial("Alucard Fragment")

											if v755 == 0 then
												Auto_Quest_Yama_1 = true
												Auto_Quest_Yama_2 = false
												Auto_Quest_Yama_3 = false
												Auto_Quest_Tushita_1 = false
												Auto_Quest_Tushita_2 = false
												Auto_Quest_Tushita_3 = false
												_u2.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
												_u2.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
											else
												v755 = CheckMaterial("Alucard Fragment")

												if v755 == 1 then
													Auto_Quest_Yama_1 = false
													Auto_Quest_Yama_2 = true
													Auto_Quest_Yama_3 = false
													Auto_Quest_Tushita_1 = false
													Auto_Quest_Tushita_2 = false
													Auto_Quest_Tushita_3 = false
													_u2.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
													_u2.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
												else
													v755 = CheckMaterial("Alucard Fragment")

													if v755 == 2 then
														Auto_Quest_Yama_1 = false
														Auto_Quest_Yama_2 = false
														Auto_Quest_Yama_3 = true
														Auto_Quest_Tushita_1 = false
														Auto_Quest_Tushita_2 = false
														Auto_Quest_Tushita_3 = false
														_u2.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
														_u2.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
													else
														v755 = CheckMaterial("Alucard Fragment")

														if v755 == 3 then
															Auto_Quest_Yama_1 = false
															Auto_Quest_Yama_2 = false
															Auto_Quest_Yama_3 = false
															Auto_Quest_Tushita_1 = true
															Auto_Quest_Tushita_2 = false
															Auto_Quest_Tushita_3 = false
															_u2.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
															_u2.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
														else
															v755 = CheckMaterial("Alucard Fragment")

															if v755 == 4 then
																Auto_Quest_Yama_1 = false
																Auto_Quest_Yama_2 = false
																Auto_Quest_Yama_3 = false
																Auto_Quest_Tushita_1 = false
																Auto_Quest_Tushita_2 = true
																Auto_Quest_Tushita_3 = false
																_u2.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
																_u2.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
															else
																v755 = CheckMaterial("Alucard Fragment")

																if v755 == 5 then
																	Auto_Quest_Yama_1 = false
																	Auto_Quest_Yama_2 = false
																	Auto_Quest_Yama_3 = false
																	Auto_Quest_Tushita_1 = false
																	Auto_Quest_Tushita_2 = false
																	Auto_Quest_Tushita_3 = true
																	_u2.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
																	_u2.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
																else
																	v755 = CheckMaterial("Alucard Fragment")

																	if v755 == 6 then
																		v755 = game:GetService("Workspace")
																		v755 = v755.Enemies:FindFirstChild("Cursed Skeleton Boss")

																		if v755 then
																			v755 = game:GetService("Workspace")
																			v755 = v755.ReplicatedStorage:FindFirstChild("Cursed Skeleton Boss")

																			if not v755 then
																			else
																				Auto_Quest_Yama_1 = false
																				Auto_Quest_Yama_2 = false
																				Auto_Quest_Yama_3 = false
																				Auto_Quest_Tushita_1 = false
																				Auto_Quest_Tushita_2 = false
																				Auto_Quest_Tushita_3 = false
																				v755 = game:GetService("Workspace")
																				v755 = v755.Enemies:FindFirstChild("Cursed Skeleton Boss")

																				if v755 then
																					v755 = game:GetService("Workspace")
																					v755 = v755.Enemies:FindFirstChild("Cursed Skeleton")

																					if not v755 then
																					else
																						local v756 = game:GetService("Workspace")
																						local v755, v756, v757 = _u3(v756.Enemies:GetChildren())

																						while true do

																							if "Good".Name ~= "Cursed Skeleton Boss" then

																								if "Good".Name == "Cursed Skeleton" then
																								else

																									while true do
																										task.wait()
																										EquipTool(SelectWeaponFarm)
																										Tween("Good".HumanoidRootPart.CFrame * Farm_Mode)
																										"Good".HumanoidRootPart.CanCollide = false
																										local v758 = Vector3.new(60, 60, 60)
																										"Good".HumanoidRootPart.Size = v758
																										"Good".HumanoidRootPart.Transparency = 1
																										"Good".Humanoid:ChangeState(11)
																										"Good".Humanoid:ChangeState(14)
																										AutoClick()

																										if not Auto_Cursed_Dual_Katana then

																											if not "Good".Parent then

																												if "Good".Humanoid.Health <= 0 then
																												end

																											end

																										end

																									end

																								end

																								for v759, v760 in v755, v756, v757 do
																								end

																							end

																						else
																							v755 = CFrame.new(-12361.7060546875, 603.35479736328125, -6550.5341796875)
																							v756 = _u4()

																							if (v755.Position - v756.Position).Magnitude <= 100 then
																								_u2.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
																								task.wait(1)
																								_u2.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
																								task.wait(1)
																								Tween(CFrame.new(-12361.7060546875, 603.35479736328125, -6550.5341796875))
																								task.wait(1.5)
																								_u5:SendKeyEvent(true, "E", false, game)
																								task.wait(1.5)
																								Tween(CFrame.new(-12253.5419921875, 598.89996337890625, -6546.8388671875))
																							else
																								Tween(CFrame.new(-12361.7060546875, 603.35479736328125, -6550.5341796875))
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

							end
						end)
						spawn(function()
							while true do
								local v761 = task.wait()

								if not v761 then

									if not Auto_Quest_Yama_1 then
									end

									pcall(function()
										local v762 = game:GetService("Workspace")
										v762 = v762.Enemies:FindFirstChild("Mythological Pirate")

										if not v762 then
											local v763 = game:GetService("Workspace")
											local v762, v763, v764 = _u0(v763.Enemies:GetChildren())

											while true do

												if v765.Name == "Mythological Pirate" then

													while true do
														task.wait()
														EquipTool(SelectWeaponFarm)
														Tween(v765.HumanoidRootPart.CFrame * Farm_Mode)
														v765.HumanoidRootPart.CanCollide = false
														local v766 = Vector3.new(60, 60, 60)
														v765.HumanoidRootPart.Size = v766
														v765.HumanoidRootPart.Transparency = 1
														v765.Humanoid:ChangeState(11)
														v765.Humanoid:ChangeState(14)
														AutoClick()

														if Auto_Cursed_Dual_Katana ~= false then

															if Auto_Quest_Yama_1 == false then
															end

														end

														_u1.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
													end

													for v767, v765 in v762, v763, v764 do
													end

												else
													Tween(CFrame.new(-13451.46484375, 543.712890625, -6961.0029296875))
												end
									end)
								end

							end
						end)
						spawn(function()
							while true do
								local v768 = task.wait()

								if not v768 then

									if not Auto_Quest_Yama_2 then
									end

									pcall(function()
										local v769 = game:GetService("Workspace")
										local v770, v769, v771 = _u0(v769.Enemies:GetChildren())

										while true do
											local v773 = v772:FindFirstChild("HazeESP")

											if not v773 then
												local v774 = UDim2.new(50, 50, 50, 50)
												v772.HazeESP.Size = v774
												v772.HazeESP.MaxDistance = "inf"
											end

											for v775, v772 in v770, v769, v771 do
											end

											local v770, v769, v771 = _u0(_u1:GetChildren())

											while true do
												v773 = v772:FindFirstChild("HazeESP")

												if not v773 then
													v774 = UDim2.new(50, 50, 50, 50)
													v772.HazeESP.Size = v774
													v772.HazeESP.MaxDistance = "inf"
												end

												for v775, v772 in v770, v769, v771 do
												end

												v769 = game:GetService("Workspace")
												local v770, v769, v771 = _u0(v769.Enemies:GetChildren())

												while true do
													v773 = v772:FindFirstChild("HazeESP")

													if not v773 then

														if (v772.HumanoidRootPart.Position - PosMonsEsp.Position).magnitude <= 300 then
															v772.HumanoidRootPart.CFrame = PosMonsEsp
															v772.HumanoidRootPart.CanCollide = false
															v774 = Vector3.new(50, 50, 50)
															v772.HumanoidRootPart.Size = v774
															v773 = v772.HumanoidRootPart:FindFirstChild("BodyVelocity")

															if v773 then
																v773 = Instance.new("BodyVelocity", v772.HumanoidRootPart)
																v774 = Vector3.new(1, 1, 1)
																v773.MaxForce = v774 * math.huge
																v774 = Vector3.new(0, 0, 0)
																v773.Velocity = v774
															end

														end

													end

													for v775, v772 in v770, v769, v771 do
													end
									end)
								end

							end
						end)
						spawn(function()
							while true do
								local v776 = task.wait()

								if not v776 then

									if not Auto_Quest_Yama_2 then
									end

									pcall(function()
										local v777 = game:GetService("Workspace")
										local v778, v777, v779 = _u0(v777.Enemies:GetChildren())

										while true do
											local v781 = v780:FindFirstChild("HazeESP")

											if not v781 then
												task.wait()
												EquipTool(SelectWeaponFarm)
												Tween(v780.HumanoidRootPart.CFrame * Farm_Mode)
												v780.HumanoidRootPart.CanCollide = false
												local v782 = Vector3.new(60, 60, 60)
												v780.HumanoidRootPart.Size = v782
												v780.HumanoidRootPart.Transparency = 1
												v780.Humanoid:ChangeState(11)
												v780.Humanoid:ChangeState(14)
												AutoClick()

												if Auto_Cursed_Dual_Katana ~= false then

													if Auto_Quest_Yama_2 ~= false then

														if not v780.Parent then

															if v780.Humanoid.Health > 0 then
																v781 = v780:FindFirstChild("HazeESP")

																if not v781 then
																else
																	local v781, v782, v783 = _u0(_u1:GetChildren())

																	while true do
																		local v784 = 60:FindFirstChild("HazeESP")

																		if not v784 then
																			local v785 = _u2()

																			if 2000 < (60.HumanoidRootPart.Position - v785.Position).Magnitude then
																				BTP(60.HumanoidRootPart.CFrameMon * Farm_Mode)
																			else
																				Tween(60.HumanoidRootPart.CFrame * Farm_Mode)
																			end

																		end

																		for v786, v787 in v781, v782, v783 do
																		end

																	end

																end

															end

														end

													end

												end

												for v788, v780 in v778, v777, v779 do
												end
									end)
								end

							end
						end)
						spawn(function()
							while true do
								local v789 = task.wait()

								if not v789 then

									if not Auto_Quest_Yama_3 then
									end

									pcall(function()
										local v790 = _u0.Backpack:FindFirstChild("Hallow Essence")

										if not v790 then
											local v791 = game:GetService("Workspace")
											Tween((((v791.Map["Haunted Castle"]).Summoner).Detection).CFrame)
										else
											v790 = game:GetService("Workspace")
											v790 = v790.Map:FindFirstChild("HellDimension")

											if not v790 then

												while true do
													task.wait()
													v790 = game:GetService("Workspace")
													v790 = v790.Enemies:FindFirstChild("Cursed Skeleton")

													if v790 then
														v790 = game:GetService("Workspace")
														v790 = v790.Enemies:FindFirstChild("Hell's Messenger")

														if not v790 then
														else
															v791 = game:GetService("Workspace")
															local v790, v791, v792 = _u1(v791.Enemies:GetChildren())

															while true do

																if v793.Name ~= "Cursed Skeleton" then

																	if v793.Name == "Hell's Messenger" then
																	else

																		if 0 < v793.Humanoid.Health then

																			while true do
																				task.wait()
																				EquipTool(SelectWeaponFarm)
																				Tween(v793.HumanoidRootPart.CFrame * Farm_Mode)
																				v793.HumanoidRootPart.CanCollide = false
																				local v794 = Vector3.new(60, 60, 60)
																				v793.HumanoidRootPart.Size = v794
																				v793.HumanoidRootPart.Transparency = 1
																				v793.Humanoid:ChangeState(11)
																				v793.Humanoid:ChangeState(14)
																				AutoClick()

																				if v793.Humanoid.Health > 0 then

																					if not v793.Parent then

																						if Auto_Quest_Yama_3 == false then
																						end

																					end

																				end

																			end

																		end

																	end

																	for v795, v793 in v790, v791, v792 do
																	end

																end

															else
																task.wait(5)
																v791 = game:GetService("Workspace")
																Tween(v791.Map.HellDimension.Torch1.CFrame)
																task.wait(1.5)
																_u2:SendKeyEvent(true, "E", false, game)
																task.wait(1.5)
																v791 = game:GetService("Workspace")
																Tween(v791.Map.HellDimension.Torch2.CFrame)
																task.wait(1.5)
																_u2:SendKeyEvent(true, "E", false, game)
																task.wait(1.5)
																v791 = game:GetService("Workspace")
																Tween(v791.Map.HellDimension.Torch3.CFrame)
																task.wait(1.5)
																_u2:SendKeyEvent(true, "E", false, game)
																task.wait(1.5)
																v791 = game:GetService("Workspace")
																Tween(v791.Map.HellDimension.Exit.CFrame)
															end

															if Auto_Cursed_Dual_Katana ~= false then

																if Auto_Quest_Yama_3 ~= false then
																	v790 = CheckMaterial("Alucard Fragment")

																	if v790 == 3 then
																	end

																else
																	v790 = game:GetService("Workspace")
																	v790 = v790.Enemies:FindFirstChild("Soul Reaper")

																	if v790 then
																		v790 = _u3:FindFirstChild("Soul Reaper")

																		if not v790 then
																		else
																			v790 = game:GetService("Workspace")
																			v790 = v790.Enemies:FindFirstChild("Soul Reaper")

																			if not v790 then
																				v791 = game:GetService("Workspace")
																				local v790, v791, v792 = _u1(v791.Enemies:GetChildren())

																				while true do

																					if false.Name == "Soul Reaper" then

																						if 0 < false.Humanoid.Health then

																							while true do
																								task.wait()
																								EquipTool(SelectWeaponFarm)
																								Tween(false.HumanoidRootPart.CFrame * Farm_Mode)
																								false.HumanoidRootPart.CanCollide = false
																								v794 = Vector3.new(60, 60, 60)
																								false.HumanoidRootPart.Size = v794
																								false.HumanoidRootPart.Transparency = 1
																								false.Humanoid:ChangeState(11)
																								false.Humanoid:ChangeState(14)
																								AutoClick()

																								if Auto_Cursed_Dual_Katana ~= false then

																									if Auto_Quest_Yama_3 ~= false then
																										local v796 = game:GetService("Workspace")
																										v796 = v796.Map:FindFirstChild("HellDimension")

																										if not v796 then
																										end

																									end

																								end

																							end

																						end

																						for v795, v793 in v790, v791, v792 do
																						end

																					else
																						Tween(CFrame.new(-9570.033203125, 315.9346923828125, 6726.89306640625))
																					end

																				else
																					_u3.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
																				end

																			end

																		end

																	end

																end

															end
									end)
								end

							end
						end)
						spawn(function()
							while true do
								local v797 = task.wait()

								if not v797 then

									if not Auto_Quest_Tushita_1 then
									end

									Tween(CFrame.new(-9546.990234375, 21.139892578125, 4686.1142578125))
									task.wait(5)
									Tween(CFrame.new(-6120.0576171875, 16.455780029296875, -2250.697265625))
									task.wait(5)
									Tween(CFrame.new(-9533.2392578125, 7.2544455528259277, -8372.69921875))
									task.wait(5)
								end

							end
						end)
						spawn(function()
							while true do
								local v799 = task.wait()

								if not v799 then

									if not Auto_Quest_Tushita_2 then
									end

									pcall(function()
										local v800 = CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125)
										local v801 = _u0()

										if (v800.Position - v801.Position).Magnitude <= 500 then
											Tween(CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125))
											v801 = game:GetService("Workspace")
											local v800, v801, v802 = _u1(v801.Enemies:GetChildren())

											while true do

												if not Auto_Quest_Tushita_2 then
													local v803 = -2972.372314453125:FindFirstChild("HumanoidRootPart")

													if not v803 then
														v803 = -2972.372314453125:FindFirstChild("Humanoid")

														if not v803 then

															if 0 < -2972.372314453125.Humanoid.Health then
																local v804 = _u0()

																if (-2972.372314453125.HumanoidRootPart.Position - v804.Position).Magnitude < 2000 then

																	while true do
																		task.wait()
																		EquipTool(SelectWeaponFarm)
																		Tween(-2972.372314453125.HumanoidRootPart.CFrame * Farm_Mode)
																		-2972.372314453125.HumanoidRootPart.CanCollide = false
																		v804 = Vector3.new(60, 60, 60)
																		-2972.372314453125.HumanoidRootPart.Size = v804
																		-2972.372314453125.HumanoidRootPart.Transparency = 1
																		-2972.372314453125.Humanoid:ChangeState(11)
																		-2972.372314453125.Humanoid:ChangeState(14)
																		AutoClick()

																		if -2972.372314453125.Humanoid.Health > 0 then

																			if not -2972.372314453125.Parent then

																				if Auto_Quest_Tushita_2 == false then
																				end

																			end

																		end

																	end

																end

															end

														end

													end

													for v805, v806 in v800, v801, v802 do
													end

												end
									end)
								end

							end
						end)
						spawn(function()
							while true do
								local v807 = task.wait()

								if not v807 then

									if not Auto_Quest_Tushita_3 then
									end

									pcall(function()
										local v808 = game:GetService("Workspace")
										v808 = v808.Enemies:FindFirstChild("Cake Queen")

										if v808 then
											v808 = _u0:FindFirstChild("Cake Queen")

											if not v808 then
											else
												local v809 = game:GetService("Workspace")
												local v808, v809, v810 = _u1(v809.Enemies:GetChildren())

												while true do

													if v811.Name == "Cake Queen" then

														if 0 < v811.Humanoid.Health then

															while true do
																task.wait()
																EquipTool(SelectWeaponFarm)
																Tween(v811.HumanoidRootPart.CFrame * Farm_Mode)
																v811.HumanoidRootPart.CanCollide = false
																local v812 = Vector3.new(60, 60, 60)
																v811.HumanoidRootPart.Size = v812
																v811.HumanoidRootPart.Transparency = 1
																v811.Humanoid:ChangeState(11)
																v811.Humanoid:ChangeState(14)
																AutoClick()

																if Auto_Cursed_Dual_Katana ~= false then

																	if Auto_Quest_Tushita_3 ~= false then
																		local v813 = game:GetService("Workspace")
																		v813 = v813.Map:FindFirstChild("HeavenlyDimension")

																		if not v813 then
																		end

																	end

																end

															end

														end

														for v814, v811 in v808, v809, v810 do
														end

														Tween(CFrame.new(-709.31329345703125, 381.6005859375, -11011.396484375))
													end

												else
													v808 = game:GetService("Workspace")
													v808 = v808.Map:FindFirstChild("HeavenlyDimension")

													if not v808 then

														while true do
															task.wait()
															v808 = game:GetService("Workspace")
															v808 = v808.Enemies:FindFirstChild("Cursed Skeleton")

															if v808 then
																v808 = game:GetService("Workspace")
																v808 = v808.Enemies:FindFirstChild("Heaven's Guardian")

																if not v808 then
																else
																	v809 = game:GetService("Workspace")
																	local v808, v809, v810 = _u1(v809.Enemies:GetChildren())

																	while true do

																		if -11011.396484375.Name ~= "Cursed Skeleton" then

																			if -11011.396484375.Name == "Heaven's Guardian" then
																			else

																				if 0 < -11011.396484375.Humanoid.Health then

																					while true do
																						task.wait()
																						EquipTool(SelectWeaponFarm)
																						Tween(-11011.396484375.HumanoidRootPart.CFrame * Farm_Mode)
																						-11011.396484375.HumanoidRootPart.CanCollide = false
																						v812 = Vector3.new(60, 60, 60)
																						-11011.396484375.HumanoidRootPart.Size = v812
																						-11011.396484375.HumanoidRootPart.Transparency = 1
																						-11011.396484375.Humanoid:ChangeState(11)
																						-11011.396484375.Humanoid:ChangeState(14)
																						AutoClick()

																						if -11011.396484375.Humanoid.Health > 0 then

																							if not -11011.396484375.Parent then

																								if Auto_Quest_Tushita_3 == false then
																								end

																							end

																						end

																					end

																				end

																			end

																			for v814, v811 in v808, v809, v810 do
																			end

																		end

																	else
																		task.wait(5)
																		v809 = game:GetService("Workspace")
																		Tween(v809.Map.HeavenlyDimension.Torch1.CFrame)
																		task.wait(1.5)
																		_u2:SendKeyEvent(true, "E", false, game)
																		task.wait(1.5)
																		v809 = game:GetService("Workspace")
																		Tween(v809.Map.HeavenlyDimension.Torch2.CFrame)
																		task.wait(1.5)
																		_u2:SendKeyEvent(true, "E", false, game)
																		task.wait(1.5)
																		v809 = game:GetService("Workspace")
																		Tween(v809.Map.HeavenlyDimension.Torch3.CFrame)
																		task.wait(1.5)
																		_u2:SendKeyEvent(true, "E", false, game)
																		task.wait(1.5)
																		v809 = game:GetService("Workspace")
																		Tween(v809.Map.HeavenlyDimension.Exit.CFrame)
																	end

																	if Auto_Cursed_Dual_Katana ~= false then

																		if Auto_Quest_Tushita_3 ~= false then
																			v808 = CheckMaterial("Alucard Fragment")

																			if v808 == 6 then
																			end

																		end

																	end

																end

															end
									end)
								end

							end
						end)
						v497:AddToggle("Auto Buddy Sword", AutoBuddySword, function(a)
							AutoBuddySword = a
							CancelTween(AutoBuddySword)
						end)
						spawn(function()
							while true do
								local v815 = task.wait()

								if not v815 then

									if not AutoBuddySword then
									end

									pcall(function()
										local v816 = game:GetService("Workspace")
										v816 = v816.Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]")

										if not v816 then
											local v817 = game:GetService("Workspace")
											local v816, v817, v818 = _u0(v817.Enemies:GetChildren())

											while true do
												local v820 = v819:FindFirstChild("Humanoid")

												if not v820 then
													v820 = v819:FindFirstChild("HumanoidRootPart")

													if not v820 then

														if 0 < v819.Humanoid.Health then

															if v819.Name == "Cake Queen [Lv. 2175] [Boss]" then

																while true do
																	v820 = game:GetService("RunService")
																	v820.Heartbeat:wait()
																	EquipTool(SelectWeapon)
																	Tween(v819.HumanoidRootPart.CFrame * Farm_Mode)
																	v819.HumanoidRootPart.CanCollide = false
																	local v821 = Vector3.new(60, 60, 60)
																	v819.HumanoidRootPart.Size = v821
																	v819.HumanoidRootPart.Transparency = 1
																	v819.Humanoid:ChangeState(11)
																	v819.Humanoid:ChangeState(14)
																	AutoClick()

																	if not AutoBuddySword then

																		if not v819.Parent then

																			if v819.Humanoid.Health <= 0 then
																			end

																		end

																	end

																end

															end

														end

													end

													for v822, v819 in v816, v817, v818 do
													end

												else
													v817 = game:GetService("ReplicatedStorage")
													v817 = v817:FindFirstChild("Cake Queen [Lv. 2175] [Boss]")
													Tween(v817.HumanoidRootPart.CFrame)
												end
									end)
								end

							end
						end)
						v497:AddToggle("Auto Pole", AutoPole, function(a)
							AutoPole = a
							CancelTween(AutoPole)
						end)
						spawn(function()
							while true do
								local v823 = task.wait()

								if not v823 then

									if not AutoPole then
									end

									pcall(function()
										local v824 = game:GetService("Workspace")
										v824 = v824.Enemies:FindFirstChild("Thunder God")

										if not v824 then
											local v825 = game:GetService("Workspace")
											local v824, v825, v826 = _u0(v825.Enemies:GetChildren())

											while true do
												local v828 = v827:FindFirstChild("Humanoid")

												if not v828 then
													v828 = v827:FindFirstChild("HumanoidRootPart")

													if not v828 then

														if 0 < v827.Humanoid.Health then

															if v827.Name == "Thunder God" then

																while true do
																	v828 = game:GetService("RunService")
																	v828.Heartbeat:wait()
																	EquipTool(SelectWeapon)
																	Tween(v827.HumanoidRootPart.CFrame * Farm_Mode)
																	v827.HumanoidRootPart.CanCollide = false
																	local v829 = Vector3.new(60, 60, 60)
																	v827.HumanoidRootPart.Size = v829
																	v827.HumanoidRootPart.Transparency = 1
																	v827.Humanoid:ChangeState(11)
																	v827.Humanoid:ChangeState(14)
																	AutoClick()

																	if not AutoPole then

																		if not v827.Parent then

																			if v827.Humanoid.Health <= 0 then
																			end

																		end

																	end

																end

															end

														end

													end

													for v830, v827 in v824, v825, v826 do
													end

												else

													if not _u1 then
														v825 = game:GetService("ReplicatedStorage")
														v825 = v825:FindFirstChild("Thunder God")
														BTP(v825.HumanoidRootPart.CFrame)
													else
														v825 = game:GetService("ReplicatedStorage")
														v825 = v825:FindFirstChild("Thunder God")
														Tween(v825.HumanoidRootPart.CFrame)
													end

												end
									end)
								end

							end
						end)
						local v831 = v58:AddSection("", "Elite Hunter", "Auto kill elite hunter when its spawn", "rbxassetid://10747375281")
						local v832 = v831:AddLabel("")
						local v833 = v831:AddLabel("")
						spawn(function()
							while true do
								local v834 = task.wait()

								if not v834 then
									v834 = _u0.Remotes.CommF_:InvokeServer("EliteHunter", "Progress")
									_u1:Set("Elite Boss Killed : " .. v834)
									local v835 = _u0:FindFirstChild("Diablo")

									if v835 then
									end

									v835 = _u0:FindFirstChild("Deandre")

									if v835 then
									end

									v835 = _u0:FindFirstChild("Urban")

									if not v835 then
									end

								end

								v835 = _u0:FindFirstChild("Diablo")

								if not v835 then
								end

								v835 = _u0:FindFirstChild("Deandre")

								if not v835 then
								end

								v835 = _u0:FindFirstChild("Urban")

								if v835 then
								end

							end

						end
						end)
						spawn(function()
							while true do
								local v836 = wait()

								if not v836 then
									pcall(function()
										local v837 = game:GetService("ReplicatedStorage")
										v837 = v837:FindFirstChild("Diablo")

										if v837 then
											v837 = game:GetService("ReplicatedStorage")
											v837 = v837:FindFirstChild("Deandre")

											if v837 then
												v837 = game:GetService("ReplicatedStorage")
												v837 = v837:FindFirstChild("Urban")

												if v837 then
													v837 = game:GetService("Workspace")
													v837 = v837.Enemies:FindFirstChild("Diablo")

													if v837 then
														v837 = game:GetService("Workspace")
														v837 = v837.Enemies:FindFirstChild("Deandre")

														if v837 then
															v837 = game:GetService("Workspace")
															v837 = v837.Enemies:FindFirstChild("Urban")

															if not v837 then
															else
															else
															else
															else
															else
																_u0:Set("Status : Elite Spawn!")
															end

														end

													end

												end

											end

										else
											_u0:Set("Status : Elite Not Spawn")
										end
									end)
								end

							end
						end)
						v831:AddToggle("Auto Elite Hunter", AutoEliteHunter, function(a)
							AutoEliteHunter = a
							CancelTween(AutoEliteHunter)
						end)
						spawn(function()
							while true do
								local v838 = task.wait()

								if not v838 then

									if not AutoEliteHunter then
									end

									pcall(function()
										if _u0.PlayerGui.Main.Quest.Visible == true then
											local v839 = string.find(_u0.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo")

											if v839 then
												v839 = string.find(_u0.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre")

												if v839 then
													v839 = string.find(_u0.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban")

													if not v839 then
													else
													else
														v839 = game:GetService("Workspace")
														v839 = v839.Enemies:FindFirstChild("Diablo")

														if v839 then
															v839 = game:GetService("Workspace")
															v839 = v839.Enemies:FindFirstChild("Deandre")

															if v839 then
																v839 = game:GetService("Workspace")
																v839 = v839.Enemies:FindFirstChild("Urban")

																if not v839 then
																else
																else
																	local v840 = game:GetService("Workspace")
																	local v839, v840, v841 = _u1(v840.Enemies:GetChildren())

																	while true do
																		local v843 = v842:FindFirstChild("Humanoid")

																		if not v843 then
																			v843 = v842:FindFirstChild("HumanoidRootPart")

																			if not v843 then

																				if 0 < v842.Humanoid.Health then

																					if v842.Name ~= "Diablo" then

																						if v842.Name ~= "Deandre" then

																							if v842.Name == "Urban" then
																							else
																							else

																								while true do
																									task.wait()
																									EquipTool(SelectWeaponFarm)
																									Tween(v842.HumanoidRootPart.CFrame * Farm_Mode)
																									v842.HumanoidRootPart.CanCollide = false
																									local v844 = Vector3.new(60, 60, 60)
																									v842.HumanoidRootPart.Size = v844
																									v842.HumanoidRootPart.Transparency = 1
																									v842.Humanoid:ChangeState(11)
																									v842.Humanoid:ChangeState(14)
																									AutoClick()

																									if AutoEliteHunter ~= false then

																										if v842.Humanoid.Health > 0 then

																											if v842.Parent then
																											end

																										end

																									end

																								end

																							end

																						end

																					end

																				end

																			end

																			for v845, v842 in v839, v840, v841 do
																			end

																		end

																	end

																else
																	v839 = _u2:FindFirstChild("Diablo")

																	if not v839 then

																		if not _u3 then
																			v840 = _u2:FindFirstChild("Diablo")
																			BTP(v840.HumanoidRootPart.CFrame)
																		else
																			v840 = _u2:FindFirstChild("Diablo")
																			Tween(v840.HumanoidRootPart.CFrame)
																		else
																			v839 = _u2:FindFirstChild("Deandre")

																			if not v839 then

																				if not _u3 then
																					v840 = _u2:FindFirstChild("Deandre")
																					BTP(v840.HumanoidRootPart.CFrame)
																				else
																					v840 = _u2:FindFirstChild("Deandre")
																					Tween(v840.HumanoidRootPart.CFrame)
																				else
																					v839 = _u2:FindFirstChild("Urban")

																					if not v839 then

																						if not _u3 then
																							v840 = _u2:FindFirstChild("Urban")
																							BTP(v840.HumanoidRootPart.CFrame)
																						else
																							v840 = _u2:FindFirstChild("Urban")
																							Tween(v840.HumanoidRootPart.CFrame)
																						else
																							_u2.Remotes.CommF_:InvokeServer("EliteHunter")
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

							end
						end)
						local v846 = v58:AddSection("", "Dought King", "auto do quest to kill cake prince", "rbxassetid://6034467796")
						local v847 = v846:AddLabel("��อปคิวอีดี")
						MobKilled = v847
						spawn(function()
							while true do
								local v848 = wait()

								if not v848 then
									pcall(function()
										local v849 = game:GetService("ReplicatedStorage")
										local v850 = string.len(v849.Remotes.CommF_:InvokeServer("CakePrinceSpawner"))

										if v850 == 88 then
											local v851 = game:GetService("ReplicatedStorage")
											v851 = v851.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
											v850 = tonumber(string.sub(v851, 39, 41))
											KillMob = v850 - 500
										else
											v849 = game:GetService("ReplicatedStorage")
											v850 = string.len(v849.Remotes.CommF_:InvokeServer("CakePrinceSpawner"))

											if v850 == 87 then
												v851 = game:GetService("ReplicatedStorage")
												v851 = v851.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
												v850 = tonumber(string.sub(v851, 40, 41))
												KillMob = v850 - 500
											else
												v849 = game:GetService("ReplicatedStorage")
												v850 = string.len(v849.Remotes.CommF_:InvokeServer("CakePrinceSpawner"))

												if v850 == 86 then
													v851 = game:GetService("ReplicatedStorage")
													v851 = v851.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
													v850 = tonumber(string.sub(v851, 41, 41))
													KillMob = v850 - 500
												end

											end

										end
									end)
								end

							end
						end)
						spawn(function()
							while true do
								local v852 = wait()

								if not v852 then
									pcall(function()
										local v853 = game:GetService("ReplicatedStorage")
										local v854 = string.len(v853.Remotes.CommF_:InvokeServer("CakePrinceSpawner"))

										if v854 == 88 then
											local v855 = game:GetService("ReplicatedStorage")
											v855 = v855.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
											local v856 = string.sub(v855, 39, 41)
											MobKilled:Set(MobKilled, "You Need to Defeat : " .. v856)
										else
											v853 = game:GetService("ReplicatedStorage")
											v854 = string.len(v853.Remotes.CommF_:InvokeServer("CakePrinceSpawner"))

											if v854 == 87 then
												v855 = game:GetService("ReplicatedStorage")
												v855 = v855.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
												v856 = string.sub(v855, 39, 40)
												MobKilled:Set(MobKilled, "You Need to Defeat : " .. v856)
											else
												v853 = game:GetService("ReplicatedStorage")
												v854 = string.len(v853.Remotes.CommF_:InvokeServer("CakePrinceSpawner"))

												if v854 == 86 then
													v855 = game:GetService("ReplicatedStorage")
													v855 = v855.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
													v856 = string.sub(v855, 39, 39)
													MobKilled:Set(MobKilled, "You Need to Defeat : " .. v856)
												else
													MobKilled:Set("Boss Is Spawning")
												end

											end

										end
									end)
								end

							end
						end)
						v846:AddToggle("Auto Cake Prince", AutoCakePrince, function(a)
							AutoCakePrince = a
							CancelTween(AutoCakePrince)
						end)
						spawn(function()
							while true do
								local v857 = task.wait()

								if not v857 then

									if not AutoCakePrince then
									end

									pcall(function()
										_u0.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
										local v858 = _u0:FindFirstChild("Cake Prince")

										if v858 then
											v858 = game:GetService("Workspace")
											v858 = v858.Enemies:FindFirstChild("Cake Prince")

											if not v858 then
											else
												v858 = game:GetService("Workspace")
												v858 = v858.Enemies:FindFirstChild("Cake Prince")

												if not v858 then
													local v858, v859, v860 = _u1(game.Workspace.Enemies:GetChildren())

													while true do

														if not AutoCakePrince then

															if v861.Name == "Cake Prince" then
																local v862 = v861:FindFirstChild("HumanoidRootPart")

																if not v862 then
																	v862 = v861:FindFirstChild("Humanoid")

																	if not v862 then

																		if 0 < v861.Humanoid.Health then

																			while true do
																				task.wait()
																				EquipTool(SelectWeaponFarm)
																				Tween(v861.HumanoidRootPart.CFrame * Farm_Mode)
																				v861.HumanoidRootPart.CanCollide = false
																				local v863 = Vector3.new(60, 60, 60)
																				v861.HumanoidRootPart.Size = v863
																				v861.HumanoidRootPart.Transparency = 1
																				v861.Humanoid:ChangeState(11)
																				v861.Humanoid:ChangeState(14)
																				AutoClick()

																				if not AutoCakePrince then

																					if not v861.Parent then

																						if v861.Humanoid.Health <= 0 then
																						end

																					end

																				end

																			end

																		end

																	end

																end

															end

															for v864, v861 in v858, v859, v860 do
															end

														else
															v858 = game:GetService("Workspace")

															if v858.Map.CakeLoaf.BigMirror.Other.Transparency == 0 then
																v858 = CFrame.new(-1990.672607421875, 4532.99951171875, -14973.6748046875)
																v859 = _u2()

																if 2000 <= (v858.Position - v859.Position).Magnitude then
																	Tween(CFrame.new(-2151.82153, 149.315704, -12404.9053))
																end

															else
																v858 = game:GetService("Workspace")
																v858 = v858.Enemies:FindFirstChild("Cookie Crafter")

																if v858 then
																	v858 = game:GetService("Workspace")
																	v858 = v858.Enemies:FindFirstChild("Cake Guard")

																	if v858 then
																		v858 = game:GetService("Workspace")
																		v858 = v858.Enemies:FindFirstChild("Baking Staff")

																		if v858 then
																			v858 = game:GetService("Workspace")
																			v858 = v858.Enemies:FindFirstChild("Head Baker")

																			if not v858 then
																			else
																			else
																			else
																				local v858, v859, v860 = _u1(game.Workspace.Enemies:GetChildren())

																				while true do
																					v862 = -12404.9053:FindFirstChild("Humanoid")

																					if not v862 then
																						v862 = -12404.9053:FindFirstChild("HumanoidRootPart")

																						if not v862 then

																							if 0 < -12404.9053.Humanoid.Health then

																								if -12404.9053.Name ~= "Cookie Crafter" then

																									if -12404.9053.Name ~= "Cake Guard" then

																										if -12404.9053.Name ~= "Baking Staff" then

																											if -12404.9053.Name == "Head Baker" then
																											else
																											else
																											else
																												v862 = -12404.9053:FindFirstChild("HumanoidRootPart")

																												if not v862 then
																													v862 = -12404.9053:FindFirstChild("Humanoid")

																													if not v862 then

																														if 0 < -12404.9053.Humanoid.Health then

																															while true do
																																task.wait()
																																EquipTool(SelectWeaponFarm)
																																Tween(-12404.9053.HumanoidRootPart.CFrame * Farm_Mode)
																																-12404.9053.HumanoidRootPart.CanCollide = false
																																v863 = Vector3.new(60, 60, 60)
																																-12404.9053.HumanoidRootPart.Size = v863
																																-12404.9053.HumanoidRootPart.Transparency = 1
																																-12404.9053.Humanoid:ChangeState(11)
																																-12404.9053.Humanoid:ChangeState(14)
																																CakePrince_Farm_Name = -12404.9053.Name
																																CakePrince_Farm_CFrame = -12404.9053.HumanoidRootPart.CFrame
																																AutoClick()

																																if not AutoCakePrince then

																																	if not -12404.9053.Parent then

																																		if -12404.9053.Humanoid.Health <= 0 then
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

																						for v864, v861 in v858, v859, v860 do
																						end

																					end

																				end

																			end

																		else
																			v858 = CFrame.new(-2077, 252, -12373)

																			if not _u3 then
																				BTP(v858)
																			else
																				Tween(v858)
																			end

																		end

																	end

																end

															end

														end
									end)
								end

							end
						end)
						v846:AddToggle("Auto Dough King (Need Sweet Chalice)", _G["AutoDoughKing"], function(a)
							_G.AutoDoughKing = a
							CancelTween(_G.AutoDoughKing)
						end)
						spawn(function()
							while true do
								local v865 = task.wait(0.1)

								if not v865 then

									if not _G.AutoDoughKing then
									end

									v865 = CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -1.87902192e-08, 0.98883605, 3.60619588e-08, 1, 1.35681812e-08, -0.98883605, 3.36376011e-08, 0.149007782)
									pcall(function()
										local v866 = game:GetService("Workspace")
										v866 = v866.Map.CakeLoaf:FindFirstChild("RedDoor")

										if not v866 then
											v866 = _u0()
											v866 = v866:FindFirstChild("Red Key")

											if v866 then
												v866 = _u1.Backpack:FindFirstChild("Red Key")

												if not v866 then
												else
													_u2.Remotes.CommF_:InvokeServer("CakeScientist", "Check")
													task.wait(1)
													_u2.Remotes.CommF_:InvokeServer("RaidsNpc", "Check")
													Tween(_u3)
													local v867 = _u4()

													if (_u3.Position - v867.Position).magnitude <= 5 then
														v866 = _u4()
														v867 = CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -1.87902192e-08, 0.98883605, 3.60619588e-08, 1, 1.35681812e-08, -0.98883605, 3.36376011e-08, 0.149007782)
														v866.CFrame = v867
														task.wait(0.5)
														EquipTool("Red Key")
														task.wait(0.5)
													end

												else
													v866 = game.Workspace:FindFirstChild("Enemies")
													v866 = v866:FindFirstChild("Dough King")

													if v866 then
														v866 = _u2:FindFirstChild("Dough King")

														if not v866 then
														else
															v866 = game:GetService("Workspace")
															v866 = v866.Enemies:FindFirstChild("Dough King")

															if not v866 then
																local v866, v867, v868 = _u5(game.Workspace.Enemies:GetChildren())

																while true do

																	if -12853.7363.Name == "Dough King" then
																		local v869 = -12853.7363:FindFirstChild("HumanoidRootPart")

																		if not v869 then
																			v869 = -12853.7363:FindFirstChild("Humanoid")

																			if not v869 then

																				if 0 < -12853.7363.Humanoid.Health then

																					while true do
																						task.wait()
																						EquipTool(SelectWeaponFarm)
																						Tween(-12853.7363.HumanoidRootPart.CFrame * Farm_Mode)
																						-12853.7363.HumanoidRootPart.CanCollide = false
																						local v870 = Vector3.new(60, 60, 60)
																						-12853.7363.HumanoidRootPart.Size = v870
																						-12853.7363.HumanoidRootPart.Transparency = 1
																						-12853.7363.Humanoid:ChangeState(11)
																						-12853.7363.Humanoid:ChangeState(14)
																						AutoClick()

																						if not _G.AutoDoughKing then

																							if not -12853.7363.Parent then

																								if -12853.7363.Humanoid.Health > 0 then
																									v869 = game:GetService("Workspace")
																									v869 = v869.Enemies:FindFirstChild(-12853.7363.Name)

																									if not v869 then
																									end

																								end

																							end

																						end

																					end

																				end

																			end

																		end

																		for v871, v872 in v866, v867, v868 do
																		end

																	else
																		v866 = game:GetService("Workspace")

																		if v866.Map.CakeLoaf.BigMirror.Other.Transparency == 0 then
																			v866 = CFrame.new(-2151.82153, 149.315704, -12404.9053)
																			Tween(v866)
																			v868 = _u4()

																			if (v866.Position - v868.Position).magnitude <= 300 then
																				v867 = _u4()
																				v868 = CFrame.new(-2151.82153, 149.315704, -12404.9053)
																				v867.CFrame = v868
																				task.wait(1)
																			end

																		else
																			v866 = _u0()
																			v866 = v866:FindFirstChild("Sweet Chalice")

																			if v866 then
																				v866 = _u1.Backpack:FindFirstChild("Sweet Chalice")

																				if not v866 then
																				else
																					v866 = game:GetService("Workspace")
																					v866 = v866.Enemies:FindFirstChild("Cookie Crafter")

																					if v866 then
																						v866 = game:GetService("Workspace")
																						v866 = v866.Enemies:FindFirstChild("Cake Guard")

																						if v866 then
																							v866 = game:GetService("Workspace")
																							v866 = v866.Enemies:FindFirstChild("Baking Staff")

																							if v866 then
																								v866 = game:GetService("Workspace")
																								v866 = v866.Enemies:FindFirstChild("Head Baker")

																								if not v866 then
																								else
																								else
																								else
																									local v866, v867, v868 = _u5(game.Workspace.Enemies:GetChildren())

																									while true do

																										if 149.315704.Name ~= "Cookie Crafter" then

																											if 149.315704.Name ~= "Cake Guard" then

																												if 149.315704.Name ~= "Baking Staff" then

																													if 149.315704.Name == "Head Baker" then
																													else
																													else
																													else
																														v869 = 149.315704:FindFirstChild("HumanoidRootPart")

																														if not v869 then
																															v869 = 149.315704:FindFirstChild("Humanoid")

																															if not v869 then

																																if 0 < 149.315704.Humanoid.Health then

																																	while true do
																																		task.wait()
																																		EquipTool(SelectWeaponFarm)
																																		Tween(149.315704.HumanoidRootPart.CFrame * Farm_Mode)
																																		149.315704.HumanoidRootPart.CanCollide = false
																																		v870 = Vector3.new(60, 60, 60)
																																		149.315704.HumanoidRootPart.Size = v870
																																		149.315704.HumanoidRootPart.Transparency = 1
																																		149.315704.Humanoid:ChangeState(11)
																																		149.315704.Humanoid:ChangeState(14)
																																		DoughKing_Farm_Name = 149.315704.Name
																																		DoughKing_Farm_CFrame = 149.315704.HumanoidRootPart.CFrame
																																		AutoClick()
																																		_u2.Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
																																		_u2.Remotes.CommF_:InvokeServer("CakePrinceSpawner")

																																		if not _G.AutoDoughKing then

																																			if not 149.315704.Parent then

																																				if 149.315704.Humanoid.Health > 0 then
																																					v869 = game:GetService("Workspace")
																																					v869 = v869.Enemies:FindFirstChild(149.315704.Name)

																																					if not v869 then
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

																											for v871, v872 in v866, v867, v868 do
																											end

																										end

																									end

																								end

																							else
																								Tween(CFrame.new(-2077, 252, -12373))
																								v866 = CFrame.new(-2077, 252, -12373)
																								v867 = _u4()

																								if (v866.Position - v867.Position).magnitude <= 300 then
																									v866 = _u4()
																									v867 = CFrame.new(-2077, 252, -12373)
																									v866.CFrame = v867
																								end

																							else
																								v866 = _u1.Backpack:FindFirstChild("God's Chalice")

																								if v866 then
																									v866 = _u0()
																									v866 = v866:FindFirstChild("God's Chalice")

																									if not v866 then
																									else
																										v866 = GetMaterial("Conjured Cocoa")

																										if 10 <= v866 then
																											_u2.Remotes.CommF_:InvokeServer("SweetChaliceNpc")
																											task.wait(0.2)
																										end

																									else
																									else
																										v866 = _u1.Backpack:FindFirstChild("God's Chalice")

																										if v866 then
																											v866 = _u0()
																											v866 = v866:FindFirstChild("God's Chalice")

																											if v866 then
																												v866 = game.Workspace.Enemies:FindFirstChild("Deandre")

																												if v866 then
																													v866 = game.Workspace.Enemies:FindFirstChild("Urban")

																													if v866 then
																														v866 = game.Workspace.Enemies:FindFirstChild("Diablo")

																														if v866 then
																															v866 = _u2:FindFirstChild("Deandre")

																															if v866 then
																																v866 = _u2:FindFirstChild("Urban")

																																if v866 then
																																	v866 = _u2:FindFirstChild("Diablo")

																																	if not v866 then
																																	else
																																	else
																																	else
																																	else
																																	else

																																		if _u1.PlayerGui.Main.Quest.Visible == true then
																																			v866 = string.find(_u1.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo")

																																			if v866 then
																																				v866 = string.find(_u1.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban")

																																				if v866 then
																																					v866 = string.find(_u1.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre")

																																					if not v866 then
																																					else
																																					else
																																						v866 = game:GetService("Workspace")
																																						v866 = v866.Enemies:FindFirstChild("Diablo")

																																						if v866 then
																																							v866 = game:GetService("Workspace")
																																							v866 = v866.Enemies:FindFirstChild("Deandre")

																																							if v866 then
																																								v866 = game:GetService("Workspace")
																																								v866 = v866.Enemies:FindFirstChild("Urban")

																																								if not v866 then
																																								else
																																								else
																																									local v866, v867, v868 = _u5(game.Workspace.Enemies:GetChildren())

																																									while true do

																																										if -12373.Name ~= "Diablo" then

																																											if -12373.Name ~= "Urban" then

																																												if -12373.Name == "Deandre" then
																																												else
																																												else
																																													v869 = -12373:FindFirstChild("HumanoidRootPart")

																																													if not v869 then
																																														v869 = -12373:FindFirstChild("Humanoid")

																																														if not v869 then

																																															if 0 < -12373.Humanoid.Health then

																																																while true do
																																																	task.wait()
																																																	EquipTool(SelectWeaponFarm)
																																																	Tween(-12373.HumanoidRootPart.CFrame * Farm_Mode)
																																																	-12373.HumanoidRootPart.CanCollide = false
																																																	v870 = Vector3.new(60, 60, 60)
																																																	-12373.HumanoidRootPart.Size = v870
																																																	-12373.HumanoidRootPart.Transparency = 1
																																																	-12373.Humanoid:ChangeState(11)
																																																	-12373.Humanoid:ChangeState(14)
																																																	AutoClick()

																																																	if not _G.AutoDoughKing then

																																																		if not -12373.Parent then

																																																			if -12373.Humanoid.Health > 0 then
																																																				v869 = game:GetService("Workspace")
																																																				v869 = v869.Enemies:FindFirstChild(-12373.Name)

																																																				if not v869 then
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

																																											for v871, v872 in v866, v867, v868 do
																																											end

																																										end

																																									end

																																								else
																																									v866 = _u2:FindFirstChild("Diablo")

																																									if not v866 then

																																										if not _u6 then
																																											v867 = _u2:FindFirstChild("Diablo")
																																											BTP(v867.HumanoidRootPart.CFrame)
																																										else
																																											v867 = _u2:FindFirstChild("Diablo")
																																											Tween(v867.HumanoidRootPart.CFrame)
																																										else
																																											v866 = _u2:FindFirstChild("Deandre")

																																											if not v866 then

																																												if not _u6 then
																																													v867 = _u2:FindFirstChild("Deandre")
																																													BTP(v867.HumanoidRootPart.CFrame)
																																												else
																																													v867 = _u2:FindFirstChild("Deandre")
																																													Tween(v867.HumanoidRootPart.CFrame)
																																												else
																																													v866 = _u2:FindFirstChild("Urban")

																																													if not v866 then

																																														if not _u6 then
																																															v867 = _u2:FindFirstChild("Urban")
																																															BTP(v867.HumanoidRootPart.CFrame)
																																														else
																																															v867 = _u2:FindFirstChild("Urban")
																																															Tween(v867.HumanoidRootPart.CFrame)
																																														else
																																															_u2.Remotes.CommF_:InvokeServer("EliteHunter")
																																														else
																																														else
																																														end

																																													end

																																												end

																																											end

																																										end

																																									else
																																										v866 = game:GetService("Workspace")
																																										v866 = v866.Enemies:FindFirstChild("Candy Rebel")

																																										if v866 then
																																											v866 = game:GetService("Workspace")
																																											v866 = v866.Enemies:FindFirstChild("Sweet Thief")

																																											if v866 then
																																												v866 = game:GetService("Workspace")
																																												v866 = v866.Enemies:FindFirstChild("Chocolate Bar Battler")

																																												if v866 then
																																													v866 = game:GetService("Workspace")
																																													v866 = v866.Enemies:FindFirstChild("Cocoa Warrior")

																																													if not v866 then
																																													else
																																													else
																																													else
																																														local v866, v867, v868 = _u5(game.Workspace.Enemies:GetChildren())

																																														while true do

																																															if -12373.Name ~= "Candy Rebel" then

																																																if -12373.Name ~= "Sweet Thief" then

																																																	if -12373.Name ~= "Chocolate Bar Battler" then

																																																		if -12373.Name == "Cocoa Warrior" then
																																																		else
																																																		else
																																																		else
																																																			v869 = -12373:FindFirstChild("HumanoidRootPart")

																																																			if not v869 then
																																																				v869 = -12373:FindFirstChild("Humanoid")

																																																				if not v869 then

																																																					if 0 < -12373.Humanoid.Health then

																																																						while true do
																																																							task.wait()
																																																							EquipTool(SelectWeaponFarm)
																																																							Tween(-12373.HumanoidRootPart.CFrame * Farm_Mode)
																																																							-12373.HumanoidRootPart.CanCollide = false
																																																							v870 = Vector3.new(60, 60, 60)
																																																							-12373.HumanoidRootPart.Size = v870
																																																							-12373.HumanoidRootPart.Transparency = 1
																																																							-12373.Humanoid:ChangeState(11)
																																																							-12373.Humanoid:ChangeState(14)
																																																							DoughKing_Farm_Name = -12373.Name
																																																							DoughKing_Farm_CFrame = -12373.HumanoidRootPart.CFrame
																																																							AutoClick()

																																																							if not _G.AutoDoughKing then

																																																								if not -12373.Parent then

																																																									if -12373.Humanoid.Health <= 0 then
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

																																																for v871, v872 in v866, v867, v868 do
																																																end

																																															end

																																														end

																																													end

																																												else
																																													Tween(CFrame.new(620.63446044921875, 78.936447143554688, -12581.369140625))
																																													v866 = CFrame.new(620.63446044921875, 78.936447143554688, -12581.369140625)
																																													v867 = _u4()

																																													if (v866.Position - v867.Position).magnitude <= 150 then
																																														v866 = _u4()
																																														v867 = CFrame.new(620.63446044921875, 78.936447143554688, -12581.369140625)
																																														v866.CFrame = v867
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
								end

							end
						end)
					end

					v680 = v58:AddSection("", "Auto FightingStyle", "auto get any fightingstyle", "rbxassetid://6031233841")
					v680:AddToggle("Auto DeathStep", AutoDeathStep, function(a)
						AutoDeathStep = a
						CancelTween(AutoDeathStep)

						if not AutoDeathStep then
							_u0.Remotes.CommF_:InvokeServer("BuyBlackLeg")
						end
					end)
					spawn(function()
						while true do
							local v873 = task.wait()

							if not v873 then
								pcall(function()
									if not AutoDeathStep then
										local v874 = _u0()
										v874 = v874:FindFirstChild("Black Leg")

										if not v874 then
											v874 = _u0()
											v874 = v874:FindFirstChild("Black Leg")

											if 400 > v874.Level.Value then
											else
												v874 = _u1.Backpack:FindFirstChild("Black Leg")

												if not v874 then
													v874 = _u1.Backpack:FindFirstChild("Black Leg")

													if 400 <= v874.Level.Value then
													end

												else
													v874 = game:GetService("Workspace")

													if v874.Map.IceCastle.Hall.LibraryDoor.PhoeyuDoor.Transparency == 0 then
														Tween(CFrame.new(6372.57275, 302.194611, -6838.97461, 0.838541508, -8.27643453e-05, 0.544837654, 8.27643453e-05, 1, 2.45265783e-05, -0.544837654, 2.45265783e-05, 0.838541508))
														_u2.Remotes.CommF_:InvokeServer("BuyDeathStep")
														v874 = _u0()
														v874 = v874:FindFirstChild("Library Key")

														if v874 then
															v874 = _u1.Backpack:FindFirstChild("Library Key")

															if not v874 then
															else
																EquipTool("Library Key")

																while true do
																	task.wait()

																	if not _u3 then
																		BTP(CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375))
																	else
																		Tween(CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375))
																	end

																	v874 = CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375)
																	local v875 = _u4()

																	if (v874.Position - v875.Position).Magnitude > 3 then

																		if AutoDeathStep then
																		end

																	end

																	v874 = CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375)
																	v875 = _u4()

																	if (v874.Position - v875.Position).Magnitude <= 3 then
																		task.wait(1.2)
																		_u2.Remotes.CommF_:InvokeServer("BuyDeathStep")
																		task.wait(0.5)
																	end

																else
																	v874 = _u2:FindFirstChild("Awakened Ice Admiral")

																	if v874 then
																		v874 = game:GetService("Workspace")
																		v874 = v874.Enemies:FindFirstChild("Awakened Ice Admiral")

																		if not v874 then
																		else
																			v874 = game:GetService("Workspace")
																			v874 = v874.Enemies:FindFirstChild("Awakened Ice Admiral")

																			if not v874 then
																				v875 = game:GetService("Workspace")
																				local v874, v875, v876 = _u5(v875.Enemies:GetChildren())

																				while true do
																					local v877 = -6841.18115234375:FindFirstChild("Humanoid")

																					if not v877 then
																						v877 = -6841.18115234375:FindFirstChild("HumanoidRootPart")

																						if not v877 then

																							if 0 < -6841.18115234375.Humanoid.Health then

																								if -6841.18115234375.Name == "Awakened Ice Admiral" then

																									while true do
																										task.wait()
																										EquipTool(SelectWeaponFarm)
																										Tween(-6841.18115234375.HumanoidRootPart.CFrame * Farm_Mode)
																										-6841.18115234375.HumanoidRootPart.CanCollide = false
																										local v878 = Vector3.new(60, 60, 60)
																										-6841.18115234375.HumanoidRootPart.Size = v878
																										-6841.18115234375.HumanoidRootPart.Transparency = 1
																										-6841.18115234375.Humanoid:ChangeState(11)
																										-6841.18115234375.Humanoid:ChangeState(14)
																										AutoClick()

																										if not -6841.18115234375.Parent then

																											if -6841.18115234375.Humanoid.Health > 0 then

																												if AutoDeathStep ~= false then
																													v877 = _u0()
																													v877 = v877:FindFirstChild("Library Key")

																													if v877 then
																														v877 = _u1.Backpack:FindFirstChild("Library Key")

																														if not v877 then
																														end

																													end

																												end

																											end

																										end

																									end

																								end

																							end

																						end

																						for v879, v880 in v874, v875, v876 do
																						end

																					end

																				else

																					if not _u3 then
																						v875 = _u2:FindFirstChild("Awakened Ice Admiral [Lv. 1400] [Boss]")
																						BTP(v875.HumanoidRootPart.CFrame)
																					else
																						v875 = _u2:FindFirstChild("Awakened Ice Admiral [Lv. 1400] [Boss]")
																						Tween(v875.HumanoidRootPart.CFrame)
																					end

																				else
																				else
																					_u2.Remotes.CommF_:InvokeServer("BuyBlackLeg")
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
					end)
					v680:AddToggle("Auto SuperHuman", AutoSuperhuman, function(a)
						AutoSuperhuman = a
						CancelTween(AutoSuperhuman)

						if not AutoSuperhuman then
							_u0.Remotes.CommF_:InvokeServer("BuySuperhuman")
						end
					end)
					spawn(function()
						while true do
							local v881 = task.wait()

							if not v881 then

								if not AutoSuperhuman then
								end

								pcall(function()
									local v882 = _u0:FindFirstChild("WeaponAssetCache")

									if not v882 then
										v882 = _u0.Backpack:FindFirstChild("Combat")

										if v882 then
											v882 = _u1()
											v882 = v882:FindFirstChild("Combat")

											if not v882 then

												if 150000 <= _u0.Data.Beli.Value then
												else
													_u2.Remotes.CommF_:InvokeServer("BuyBlackLeg")
												end

											end

										end

										v882 = _u1()
										v882 = v882:FindFirstChild("Superhuman")

										if v882 then
											v882 = _u0.Backpack:FindFirstChild("Superhuman")

											if not v882 then
											else
												SelectWeapon = "Superhuman"
												EquipTool(SelectWeapon)
											end

										end

										v882 = _u0.Backpack:FindFirstChild("Black Leg")

										if v882 then
											v882 = _u1()
											v882 = v882:FindFirstChild("Black Leg")

											if v882 then
												v882 = _u0.Backpack:FindFirstChild("Electro")

												if v882 then
													v882 = _u1()
													v882 = v882:FindFirstChild("Electro")

													if v882 then
														v882 = _u0.Backpack:FindFirstChild("Fishman Karate")

														if v882 then
															v882 = _u1()
															v882 = v882:FindFirstChild("Fishman Karate")

															if v882 then
																v882 = _u0.Backpack:FindFirstChild("Dragon Claw")

																if v882 then
																	v882 = _u1()
																	v882 = v882:FindFirstChild("Dragon Claw")

																	if not v882 then
																	else
																	else
																	else
																	else
																	else
																	else
																	else
																		v882 = _u0.Backpack:FindFirstChild("Black Leg")

																		if not v882 then
																			v882 = _u0.Backpack:FindFirstChild("Black Leg")

																			if v882.Level.Value <= 299 then
																				SelectWeapon = "Black Leg"
																				EquipTool(SelectWeapon)
																			end

																		end

																		v882 = _u0.Backpack:FindFirstChild("Electro")

																		if not v882 then
																			v882 = _u0.Backpack:FindFirstChild("Electro")

																			if v882.Level.Value <= 299 then
																				SelectWeapon = "Electro"
																				EquipTool(SelectWeapon)
																			end

																		end

																		v882 = _u0.Backpack:FindFirstChild("Fishman Karate")

																		if not v882 then
																			v882 = _u0.Backpack:FindFirstChild("Fishman Karate")

																			if v882.Level.Value <= 299 then
																				SelectWeapon = "Fishman Karate"
																				EquipTool(SelectWeapon)
																			end

																		end

																		v882 = _u0.Backpack:FindFirstChild("Dragon Claw")

																		if not v882 then
																			v882 = _u0.Backpack:FindFirstChild("Dragon Claw")

																			if v882.Level.Value <= 299 then
																				SelectWeapon = "Dragon Claw"
																				EquipTool(SelectWeapon)
																			end

																		end

																		v882 = _u0.Backpack:FindFirstChild("Black Leg")

																		if not v882 then
																			v882 = _u0.Backpack:FindFirstChild("Black Leg")

																			if 300 <= v882.Level.Value then

																				if 300000 <= _u0.Data.Beli.Value then
																					_u2.Remotes.CommF_:InvokeServer("BuyElectro")
																				end

																			end

																		end

																		v882 = _u1()
																		v882 = v882:FindFirstChild("Black Leg")

																		if not v882 then
																			v882 = _u1()
																			v882 = v882:FindFirstChild("Black Leg")

																			if 300 <= v882.Level.Value then

																				if 300000 <= _u0.Data.Beli.Value then
																					_u2.Remotes.CommF_:InvokeServer("BuyElectro")
																				end

																			end

																		end

																		v882 = _u0.Backpack:FindFirstChild("Electro")

																		if not v882 then
																			v882 = _u0.Backpack:FindFirstChild("Electro")

																			if 300 <= v882.Level.Value then

																				if 750000 <= _u0.Data.Beli.Value then
																					_u2.Remotes.CommF_:InvokeServer("BuyFishmanKarate")
																				end

																			end

																		end

																		v882 = _u1()
																		v882 = v882:FindFirstChild("Electro")

																		if not v882 then
																			v882 = _u1()
																			v882 = v882:FindFirstChild("Electro")

																			if 300 <= v882.Level.Value then

																				if 750000 <= _u0.Data.Beli.Value then
																					_u2.Remotes.CommF_:InvokeServer("BuyFishmanKarate")
																				end

																			end

																		end

																		v882 = _u0.Backpack:FindFirstChild("Fishman Karate")

																		if not v882 then
																			v882 = _u0.Backpack:FindFirstChild("Fishman Karate")

																			if 300 <= v882.Level.Value then

																				if 1500 <= _u0.Data.Fragments.Value then
																					_u2.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
																					_u2.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
																				end

																			end

																		end

																		v882 = _u1()
																		v882 = v882:FindFirstChild("Fishman Karate")

																		if not v882 then
																			v882 = _u1()
																			v882 = v882:FindFirstChild("Fishman Karate")

																			if 300 <= v882.Level.Value then

																				if 1500 <= _u0.Data.Fragments.Value then
																					_u2.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
																					_u2.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
																				else
																				else
																				else

																					if _u0.Data.Fragments.Value <= 1499 then
																						AutoSuperhuman = true
																					else
																						AutoSuperhuman = false
																					end

																				end

																			end

																		end

																		v882 = _u0.Backpack:FindFirstChild("Dragon Claw")

																		if not v882 then
																			v882 = _u0.Backpack:FindFirstChild("Dragon Claw")

																			if 300 <= v882.Level.Value then

																				if 3000000 <= _u0.Data.Beli.Value then
																					_u2.Remotes.CommF_:InvokeServer("BuySuperhuman")
																				end

																			end

																		end

																		v882 = _u1()
																		v882 = v882:FindFirstChild("Dragon Claw")

																		if not v882 then
																			v882 = _u1()
																			v882 = v882:FindFirstChild("Dragon Claw")

																			if 300 <= v882.Level.Value then

																				if 3000000 <= _u0.Data.Beli.Value then
																					_u2.Remotes.CommF_:InvokeServer("BuySuperhuman")
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

						end
					end)
					v680:AddToggle("Auto Sharkman Karate", AutoSharkman, function(a)
						AutoSharkman = a
						CancelTween(AutoSharkman)

						if not AutoSharkman then
							_u0.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
						end
					end)
					spawn(function()
						while true do
							local v883 = task.wait()

							if not v883 then
								pcall(function()
									if not AutoSharkman then
										local v884 = _u0()
										v884 = v884:FindFirstChild("Fishman Karate")

										if not v884 then
											v884 = _u0()
											v884 = v884:FindFirstChild("Fishman Karate")

											if 400 > v884.Level.Value then
											else
												v884 = _u1.Backpack:FindFirstChild("Fishman Karate")

												if not v884 then
													v884 = _u1.Backpack:FindFirstChild("Fishman Karate")

													if 400 <= v884.Level.Value then
													end

												else
													Tween(CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365))
													_u2.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
													v884 = _u0()
													v884 = v884:FindFirstChild("Water Key")

													if v884 then
														v884 = _u1.Backpack:FindFirstChild("Water Key")

														if not v884 then
														else

															while true do
																task.wait()
																Tween(CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365))
																v884 = CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365)
																local v885 = _u3()

																if (v884.Position - v885.Position).Magnitude > 3 then

																	if AutoSharkman then
																	end

																end

																v884 = CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365)
																v885 = _u3()

																if (v884.Position - v885.Position).Magnitude <= 3 then
																	task.wait(1.2)
																	_u2.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
																	task.wait(0.5)
																end

															else
																v884 = game:GetService("Workspace")
																v884 = v884.Enemies:FindFirstChild("Tide Keeper")

																if not v884 then
																	v885 = game:GetService("Workspace")
																	local v884, v885, v886 = _u4(v885.Enemies:GetChildren())

																	while true do
																		local v887 = 0.0425701365:FindFirstChild("Humanoid")

																		if not v887 then
																			v887 = 0.0425701365:FindFirstChild("HumanoidRootPart")

																			if not v887 then

																				if 0 < 0.0425701365.Humanoid.Health then

																					if 0.0425701365.Name == "Tide Keeper" then

																						while true do
																							task.wait()
																							EquipTool(SelectWeaponFarm)
																							Tween(0.0425701365.HumanoidRootPart.CFrame * Farm_Mode)
																							0.0425701365.HumanoidRootPart.CanCollide = false
																							local v888 = Vector3.new(60, 60, 60)
																							0.0425701365.HumanoidRootPart.Size = v888
																							0.0425701365.HumanoidRootPart.Transparency = 1
																							0.0425701365.Humanoid:ChangeState(11)
																							0.0425701365.Humanoid:ChangeState(14)
																							AutoClick()

																							if not 0.0425701365.Parent then

																								if 0.0425701365.Humanoid.Health > 0 then

																									if AutoSharkman ~= false then
																										v887 = _u0()
																										v887 = v887:FindFirstChild("Library Key")

																										if v887 then
																											v887 = _u1.Backpack:FindFirstChild("Library Key")

																											if not v887 then
																											end

																										end

																									end

																								end

																							end

																						end

																					end

																				end

																			end

																			for v889, v890 in v884, v885, v886 do
																			end

																		else

																			if not _u5 then
																				v885 = _u2:FindFirstChild("Tide Keeper")
																				BTP(v885.HumanoidRootPart.CFrame)
																			else
																				v885 = _u2:FindFirstChild("Tide Keeper")
																				Tween(v885.HumanoidRootPart.CFrame)
																			end

																		else
																		else
																			_u2.Remotes.CommF_:InvokeServer("BuyFishmanKarate")
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
					end)
					v680:AddToggle("Auto Electric Claw", AutoElectricClaw, function(a)
						AutoElectricClaw = a
						CancelTween(AutoElectricClaw)

						if not AutoElectricClaw then
							_u0.Remotes.CommF_:InvokeServer("BuyElectro")
						end
					end)
					spawn(function()
						while true do
							local v891 = task.wait(0.1)

							if not v891 then

								if not AutoElectricClaw then
								end

								pcall(function()
									local v892 = _u0.Backpack:FindFirstChild("Electro")

									if v892 then
										v892 = _u1()
										v892 = v892:FindFirstChild("Electro")

										if not v892 then
										else
											v892 = _u0.Backpack:FindFirstChild("Electro")

											if v892 then
												v892 = _u1()
												v892 = v892:FindFirstChild("Electro")

												if not v892 then
													v892 = _u0.Backpack:FindFirstChild("Electro")

													if 400 > v892.Level.Value then
													else
														v892 = _u1()
														v892 = v892:FindFirstChild("Electro")

														if 400 <= v892.Level.Value then
														else
														end

													else
														Tween(CFrame.new(-10371.4717, 330.764496, -10131.4199))
														v892 = CFrame.new(-10371.4717, 330.764496, -10131.4199)
														local v893 = _u2()

														if (v892.Position - v893.Position).Magnitude <= 10 then
															_u3.Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start")
															task.wait(2)
														end

														task.wait(1)
														Tween(CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438))
														v892 = CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438)
														v893 = _u2()

														if (v892.Position - v893.Position).Magnitude <= 10 then
															task.wait(1)
														end

														task.wait(1)
														Tween(CFrame.new(-10371.4717, 330.764496, -10131.4199))
														v892 = CFrame.new(-10371.4717, 330.764496, -10131.4199)
														v893 = _u2()

														if (v892.Position - v893.Position).Magnitude <= 10 then
															task.wait(1)
															_u3.Remotes.CommF_:InvokeServer("BuyElectricClaw")
														end

														task.wait(1)
														Tween(CFrame.new(-10371.4717, 330.764496, -10131.4199))
														v892 = CFrame.new(-10371.4717, 330.764496, -10131.4199)
														v893 = _u2()

														if (v892.Position - v893.Position).Magnitude <= 10 then
															task.wait(1)
															_u3.Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start")
														end

														task.wait(1)
														Tween(CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438))
														v892 = CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438)
														v893 = _u2()

														if (v892.Position - v893.Position).Magnitude <= 10 then
															task.wait(1)
														end

														task.wait(1)
														Tween(CFrame.new(-10371.4717, 330.764496, -10131.4199))
														v892 = CFrame.new(-10371.4717, 330.764496, -10131.4199)
														v893 = _u2()

														if (v892.Position - v893.Position).Magnitude <= 10 then
															task.wait(1)
															_u3.Remotes.CommF_:InvokeServer("BuyElectricClaw")
														end

														SelectWeapon = "Electric Claw"
														EquipTool(SelectWeapon)
														task.wait(0.1)
													end

												end

											end

										end

									end
								end)
							end

						end
					end)
					v680:AddToggle("Auto Dragon Talon", AutoDragonTalon, function(a)
						AutoDragonTalon = a
						CancelTween(AutoDragonTalon)

						if not AutoDragonTalon then
							_u0.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
							_u0.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
						end
					end)
					spawn(function()
						while true do
							local v894 = task.wait(0.1)

							if not v894 then

								if not AutoDragonTalon then
								end

								pcall(function()
									local v895 = _u0:FindFirstChild("WeaponAssetCache")

									if not v895 then
										v895 = _u0.Backpack:FindFirstChild("Dragon Claw")

										if not v895 then
											v895 = _u0.Backpack:FindFirstChild("Dragon Claw")

											if v895.Level.Value <= 399 then
												v895 = _u1()

												if 0 < v895.Health then
													SelectWeapon = "Dragon Claw"
													EquipTool(SelectWeapon)
												end

											end

										end

										v895 = _u2()
										v895 = v895:FindFirstChild("Dragon Claw")

										if not v895 then
											v895 = _u2()
											v895 = v895:FindFirstChild("Dragon Claw")

											if v895.Level.Value <= 399 then
												v895 = _u1()

												if 0 < v895.Health then
													SelectWeapon = "Dragon Claw"
													EquipTool(SelectWeapon)
												end

											end

										end

										v895 = _u0.Backpack:FindFirstChild("Dragon Claw")

										if not v895 then
											v895 = _u0.Backpack:FindFirstChild("Dragon Claw")

											if 400 <= v895.Level.Value then
												v895 = _u1()

												if 0 < v895.Health then
													SelectWeapon = "Dragon Claw"
													EquipTool(SelectWeapon)
													v895 = _u3.Remotes.CommF_:InvokeServer("BuyDragonTalon", true)

													if v895 == 3 then
														_u3.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
														_u3.Remotes.CommF_:InvokeServer("BuyDragonTalon", true)
													else
														v895 = _u3.Remotes.CommF_:InvokeServer("BuyDragonTalon", true)

														if v895 == 1 then
															_u3.Remotes.CommF_:InvokeServer("BuyDragonTalon")
														else
															_u3.Remotes.CommF_:InvokeServer("BuyDragonTalon", true)
															_u3.Remotes.CommF_:InvokeServer("BuyDragonTalon")
														end

													end

												end

											end

										end

										v895 = _u2()
										v895 = v895:FindFirstChild("Dragon Claw")

										if not v895 then
											v895 = _u2()
											v895 = v895:FindFirstChild("Dragon Claw")

											if 400 <= v895.Level.Value then
												v895 = _u1()

												if 0 < v895.Health then
													SelectWeapon = "Dragon Claw"
													EquipTool(SelectWeapon)
													v895 = _u3.Remotes.CommF_:InvokeServer("BuyDragonTalon", true)

													if v895 == 3 then
														_u3.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
														_u3.Remotes.CommF_:InvokeServer("BuyDragonTalon", true)
													else
														v895 = _u3.Remotes.CommF_:InvokeServer("BuyDragonTalon", true)

														if v895 == 1 then
															_u3.Remotes.CommF_:InvokeServer("BuyDragonTalon")
														else
															_u3.Remotes.CommF_:InvokeServer("BuyDragonTalon", true)
															_u3.Remotes.CommF_:InvokeServer("BuyDragonTalon")
														end

													end

												end

											end

										end

									end
								end)
							end

						end
					end)
					v680:AddToggle("Auto God Human", AutoGodhuman, function(a)
						AutoGodhuman = a
						CancelTween(AutoGodhuman)

						if not AutoGodhuman then
							_u0.Remotes.CommF_:InvokeServer("BuyGodhuman")
						end
					end)
					v680:AddToggle("Auto Sanguine Art [Beta]", false, function(a) print("auto Sanguine Art still in progress!") end)

					function CheckMaterial(a)
						local v897, v896, v898 = _u0(_u1.Remotes.CommF_:InvokeServer("getInventory"))

						while true do
							local v900 = type(v899)

							if v900 == "table" then

								if v899.Type == "Material" then

									if v899.Name == a then
										do return v899.Count end
									end

								end

							end

							for v901, v899 in v897, v896, v898 do
							end
					end

					spawn(function()
						while true do
							local v902 = task.wait(0.1)

							if not v902 then

								if not AutoGodhuman then
								end

								pcall(function()
									local v903 = _u0()
									v903 = v903:FindFirstChild("Superhuman")

									if v903 then
										v903 = _u1.Backpack:FindFirstChild("Superhuman")

										if v903 then
											v903 = _u1.Backpack:FindFirstChild("Black Leg")

											if v903 then
												v903 = _u0()
												v903 = v903:FindFirstChild("Black Leg")

												if v903 then
													v903 = _u1.Backpack:FindFirstChild("Death Step")

													if v903 then
														v903 = _u0()
														v903 = v903:FindFirstChild("Death Step")

														if v903 then
															v903 = _u1.Backpack:FindFirstChild("Fishman Karate")

															if v903 then
																v903 = _u0()
																v903 = v903:FindFirstChild("Fishman Karate")

																if v903 then
																	v903 = _u1.Backpack:FindFirstChild("Sharkman Karate")

																	if v903 then
																		v903 = _u0()
																		v903 = v903:FindFirstChild("Sharkman Karate")

																		if v903 then
																			v903 = _u1.Backpack:FindFirstChild("Electro")

																			if v903 then
																				v903 = _u0()
																				v903 = v903:FindFirstChild("Electro")

																				if v903 then
																					v903 = _u1.Backpack:FindFirstChild("Electric Claw")

																					if v903 then
																						v903 = _u0()
																						v903 = v903:FindFirstChild("Electric Claw")

																						if v903 then
																							v903 = _u1.Backpack:FindFirstChild("Dragon Claw")

																							if v903 then
																								v903 = _u0()
																								v903 = v903:FindFirstChild("Dragon Claw")

																								if v903 then
																									v903 = _u1.Backpack:FindFirstChild("Dragon Talon")

																									if v903 then
																										v903 = _u0()
																										v903 = v903:FindFirstChild("Dragon Talon")

																										if v903 then
																											v903 = _u0()
																											v903 = v903:FindFirstChild("Godhuman")

																											if v903 then
																												v903 = _u1.Backpack:FindFirstChild("Godhuman")

																												if not v903 then
																												else
																												else
																												else
																												else
																												else
																												else
																												else
																												else
																												else
																												else
																												else
																												else
																												else
																												else
																												else
																												else
																												else
																												else
																												else
																													v903 = _u2.Remotes.CommF_:InvokeServer("BuySuperhuman", true)

																													if v903 == 1 then
																														v903 = _u1.Backpack:FindFirstChild("Superhuman")

																														if not v903 then
																															v903 = _u1.Backpack:FindFirstChild("Superhuman")

																															if 400 > v903.Level.Value then
																															else
																																v903 = _u0()
																																v903 = v903:FindFirstChild("Superhuman")

																																if not v903 then
																																	v903 = _u0()
																																	v903 = v903:FindFirstChild("Superhuman")

																																	if 400 <= v903.Level.Value then
																																	end

																																else
																																	_u2.Remotes.CommF_:InvokeServer("BuyDeathStep")
																																else
																																	_u3("Notification", "Not Have Superhuman", 3)
																																end

																															end

																														end

																													end

																													v903 = _u2.Remotes.CommF_:InvokeServer("BuyDeathStep", true)

																													if v903 == 1 then
																														v903 = _u1.Backpack:FindFirstChild("Death Step")

																														if not v903 then
																															v903 = _u1.Backpack:FindFirstChild("Death Step")

																															if 400 > v903.Level.Value then
																															else
																																v903 = _u0()
																																v903 = v903:FindFirstChild("Death Step")

																																if not v903 then
																																	v903 = _u0()
																																	v903 = v903:FindFirstChild("Death Step")

																																	if 400 <= v903.Level.Value then
																																	end

																																else
																																	_u2.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
																																else
																																	_u3("Notification", "Not Have Death Step", 3)
																																end

																															end

																														end

																													end

																													v903 = _u2.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)

																													if v903 == 1 then
																														v903 = _u1.Backpack:FindFirstChild("Sharkman Karate")

																														if not v903 then
																															v903 = _u1.Backpack:FindFirstChild("Sharkman Karate")

																															if 400 > v903.Level.Value then
																															else
																																v903 = _u0()
																																v903 = v903:FindFirstChild("Sharkman Karate")

																																if not v903 then
																																	v903 = _u0()
																																	v903 = v903:FindFirstChild("Sharkman Karate")

																																	if 400 <= v903.Level.Value then
																																	end

																																else
																																	_u2.Remotes.CommF_:InvokeServer("BuyElectricClaw")
																																else
																																	_u3("Notification", "Not Have SharkMan Karate", 3)
																																end

																															end

																														end

																													end

																													v903 = _u2.Remotes.CommF_:InvokeServer("BuyElectricClaw", true)

																													if v903 == 1 then
																														v903 = _u1.Backpack:FindFirstChild("Electric Claw")

																														if not v903 then
																															v903 = _u1.Backpack:FindFirstChild("Electric Claw")

																															if 400 > v903.Level.Value then
																															else
																																v903 = _u0()
																																v903 = v903:FindFirstChild("Electric Claw")

																																if not v903 then
																																	v903 = _u0()
																																	v903 = v903:FindFirstChild("Electric Claw")

																																	if 400 <= v903.Level.Value then
																																	end

																																else
																																	_u2.Remotes.CommF_:InvokeServer("BuyDragonTalon")
																																else
																																	_u3("Notification", "Not Have Electric Claw", 3)
																																end

																															end

																														end

																													end

																													v903 = _u2.Remotes.CommF_:InvokeServer("BuyDragonTalon", true)

																													if v903 == 1 then
																														v903 = _u1.Backpack:FindFirstChild("Dragon Talon")

																														if not v903 then
																															v903 = _u1.Backpack:FindFirstChild("Dragon Talon")

																															if 400 > v903.Level.Value then
																															else
																																v903 = _u0()
																																v903 = v903:FindFirstChild("Dragon Talon")

																																if not v903 then
																																	v903 = _u0()
																																	v903 = v903:FindFirstChild("Dragon Talon")

																																	if 400 <= v903.Level.Value then
																																	end

																																else
																																	local v904 = _u2.Remotes.CommF_:InvokeServer("BuyGodhuman", true)
																																	v903 = string.find(v904, "Bring")

																																	if not v903 then
																																		_u3("Notification", "Not Have Enough Material", 3)
																																	else
																																		_u2.Remotes.CommF_:InvokeServer("BuyGodhuman")
																																	else
																																		_u3("Notification", "Not Have Dragon Talon", 3)
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

														else
															_u2.Remotes.CommF_:InvokeServer("BuySuperhuman")
														end

													end

												end

											end

										end

									end
								end)
							end

						end
					end)
					v831 = v59:AddSection("", "Combat", "auto teleport/kill player/bounty", "rbxassetid://6022668882")
					v832 = v831:AddLabel("Players")
					spawn(function()
						while true do
							local v905 = task.wait()

							if not v905 then
								pcall(function()
									local v907, v906, v908 = _u0(_u1:GetPlayers())

									while true do

										if v909 == 12 then
											_u2:Set("Players :" .. " " .. v909 .. " " .. "/" .. " " .. "12" .. " " .. "(Max)")
										else

											if v909 == 1 then
												_u2:Set("Player :" .. " " .. v909 .. " " .. "/" .. " " .. "12")
											else
												_u2:Set("Players :" .. " " .. v909 .. " " .. "/" .. " " .. "12")
											end

										end

										for v909, v910 in v907, v906, v908 do
										end
								end)
							end

						end
					end)
					Playerslist = {}
					local v833, v846, v847 = pairs(v32["GetChildren"]())

					while true do
						table["insert"](Playerslist, "Auto Dough King (Need Sweet Chalice)".Name)

						for v911, v912 in v833, v846, v847 do
						end

						v833 = v831:AddDropdown("Select Players", Playerslist, "", function(a) _G.SelectPly = a end)
						v831:Button("Refresh Player", function()
							Playerslist = {}
							_u0:Clear()
							local v914, v913, v915 = _u1(_u2:GetChildren())

							while true do
								_u0:Add(v916.Name)

								for v917, v916 in v914, v913, v915 do
								end
						end)
						v831:AddToggle("Spectate Player", false, function(a)
							SpectatePlys = a
							local v918 = _u0()
							local v919 = _u1:FindFirstChild(_G.SelectPly)

							while true do
								task.wait(0.1)
								local v920 = game:GetService("Workspace")
								local v921 = _u1:FindFirstChild(_G.SelectPly)
								v920.Camera.CameraSubject = v921.Character.Humanoid

								if SpectatePlys == false then
								end

								v920 = game:GetService("Workspace")
								v921 = _u0()
								v920.Camera.CameraSubject = v921
						end)
						v831:AddToggle("Teleport", false, function(a)
							_G.TeleportPly = a
							pcall(function()
								if not _G.TeleportPly then

									while true do
										Tween(_u0[_G.SelectPly].Character.HumanoidRootPart.CFrame)
										task.wait()

										if _G.TeleportPly == false then
										end

									end

									CancelTween(_G.TeleportPly)
							end)
						end)
						v831:AddToggle("Auto Farm Player", false, function(a)
							_G.Auto_Kill_Ply = a
							CancelTween(_G.Auto_Kill_Ply)
						end)
						spawn(function()
							while true do
								local v922 = task.wait()

								if not v922 then

									if not _G.Auto_Kill_Ply then
									end

									pcall(function()
										if _G.SelectPly ~= nil then
											local v923 = _u0:FindFirstChild(_G.SelectPly)

											if not v923 then
												v923 = _u0:FindFirstChild(_G.SelectPly)

												if 0 < v923.Character.Humanoid.Health then

													while true do
														task.wait()
														EquipTool(SelectWeaponFarm)
														v923 = _u0:FindFirstChild(_G.SelectPly)
														v923.Character.HumanoidRootPart.CanCollide = false
														local v924 = _u0:FindFirstChild(_G.SelectPly)
														local v925 = CFrame.new(0, 35, 0)
														Tween(v924.Character.HumanoidRootPart.CFrame * v925)
														spawn(function()
															pcall(function()
																if SelectWeaponFarm == SelectWeaponSword then
																	local v926 = _u0:FindFirstChild(_G.SelectPly)
																	v926 = _u0:FindFirstChild(_G.SelectPly)
																	v926 = _u1()
																	v926[SelectWeaponMelee].RemoteFunctionShoot:InvokeServer(v926[SelectWeaponMelee].RemoteFunctionShoot)
																else
																	_u2:CaptureController()
																	_u2:Button1Down(_u2)
																end
															end)
														end)
														v923 = _u0:FindFirstChild(_G.SelectPly)

														if v923.Character.Humanoid.Health > 0 then
															v923 = _u0:FindFirstChild(_G.SelectPly)

															if not v923 then

																if _G.Auto_Kill_Ply then
																end

															end

														end

													end

												end

											end
									end)
								end

							end
						end)
						spawn(function()
							while true do
								local v929 = task.wait()

								if not v929 then
									pcall(function()
										local v931, v930, v932 = _u0(_u1:GetPlayers())

										while true do

											if v933.Name ~= _u2.Name then
												local v934 = v933:DistanceFromCharacter()
												local v935 = v933:DistanceFromCharacter(v933, v934.Position)

												if v935 < math.huge then
													PlayerSelectAimbot = v933.Name
												end

											end

											for v936, v933 in v931, v930, v932 do
											end
									end)
								end

							end
						end)
						v831:AddToggle("Aimbot Gun", false, function(a) _G.Aimbot_Gun = a end)
						spawn(function()
							while true do
								local v937 = task.wait()

								if not v937 then

									if not _G.Aimbot_Gun then
									end

									v937 = _u0()
									v937 = v937:FindFirstChild(SelectWeaponMelee)

									if not v937 then
									end

									pcall(function()
										local v938 = _u0()
										v938[SelectWeaponMelee].Cooldown.Value = 0
										local v939 = _u1:FindFirstChild(PlayerSelectAimbot)
										v939 = _u1:FindFirstChild(PlayerSelectAimbot)
										v939 = _u0()
										v939[SelectWeaponMelee].RemoteFunctionShoot:InvokeServer(v939[SelectWeaponMelee].RemoteFunctionShoot)
										_u2:CaptureController()
										_u2:Button1Down(_u2)
									end)
								end

							end
						end)
						v831:AddToggle("Aimbot Skill", false, function(a) _G.Aimbot_Skill = a end)
						spawn(function()
							pcall(function()
								while true do
									local v941 = task.wait()

									if not v941 then

										if not _G.Aimbot_Skill then
										end

										if PlayerSelectAimbot ~= nil then
										end

										v941 = _u0()
										v941 = v941:FindFirstChildOfClass("Tool")

										if not v941 then
										end

										v941 = _u0()
										local v942 = _u0()
										v942 = v942:FindFirstChildOfClass("Tool")
										v941 = v941[v942.Name]:FindFirstChild("MousePos")

										if not v941 then
										end

										v942 = _u1:FindFirstChild(PlayerSelectAimbot)
										v942 = _u0()
										local v943 = v942:FindFirstChild()
										v943 = v943:FindFirstChildOfClass("Tool")
										v942 = v942:FindFirstChild(v942, v943.Name)
										v942.RemoteEvent:FireServer(v942.RemoteEvent)
									end

								end
							end)
						end)
						v831:AddToggle("Enabled PvP", false, function(a) _G.EnabledPvP = a end)
						spawn(function()
							pcall(function()
								while true do
									local v945 = task.wait(0.1)

									if not v945 then

										if not _G.EnabledPvP then
										end

										if _u0.PlayerGui.Main.PvpDisabled.Visible == true then
										end

										_u1.Remotes.CommF_:InvokeServer("EnablePvp")
									end

								end
							end)
						end)
						v831:AddToggle("Safe Mode", false, function(a)
							_G.Safe_Mode = a
							CancelTween(_G.Safe_Mode)
						end)
						spawn(function()
							pcall(function()
								while true do
									local v946 = task.wait()

									if not v946 then

										if not _G.Safe_Mode then
										end

										v946 = _u0()
										local v947 = _u0()
										v946.CFrame = v947.CFrame
									end

								end
							end)
						end)
						v831:Button("Respawn", function()
							_u0.Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
							task.wait()
						end)
						v846 = v831:AddLabel("Current Bounties :")
						v847 = tostring((v32.LocalPlayer["leaderstats"]["Bounty/Honor"])["Value"])
						spawn(function()
							while true do
								local v948 = task.wait()

								if not v948 then
									pcall(function()
										local v949 = _u0(_u1)

										if v949 == 4 then
											v949 = _u2(_u1, 1, 1)
											local v950 = _u2(_u1, 2, 3)
											Bounty1 = v949 .. "." .. v950 .. "K"
										else
											v949 = _u0(_u1)

											if v949 == 5 then
												v949 = _u2(_u1, 1, 2)
												v950 = _u2(_u1, 3, 4)
												Bounty1 = v949 .. "." .. v950 .. "K"
											else
												v949 = _u0(_u1)

												if v949 == 6 then
													v949 = _u2(_u1, 1, 3)
													v950 = _u2(_u1, 4, 5)
													Bounty1 = v949 .. "." .. v950 .. "K"
												else
													v949 = _u0(_u1)

													if v949 == 7 then
														v949 = _u2(_u1, 1, 1)
														v950 = _u2(_u1, 2, 3)
														Bounty1 = v949 .. "." .. v950 .. "M"
													else
														v949 = _u0(_u1)

														if v949 == 8 then
															v949 = _u2(_u1, 1, 2)
															v950 = _u2(_u1, 3, 4)
															Bounty1 = v949 .. "." .. v950 .. "M"
														else
															v949 = _u0(_u1)

															if v949 <= 3 then
																Bounty1 = _u1
															end

														end

													end

												end

											end

										end

										v949 = tonumber(_u1)

										if v949 == 25000000 then
											_u3:Set("Current Bounties : " .. Bounty1 .. " [ Max ]")
										else
											v949 = tonumber(_u1)

											if v949 < 25000000 then
												_u3:Set("Current Bounties : " .. Bounty1)
											end

										end
									end)
								end

							end
						end)
						local v951 = v831:AddLabel("Earned")
						local v952 = tostring((v32.LocalPlayer["leaderstats"]["Bounty/Honor"])["Value"])
						local v953 = tostring((v32.LocalPlayer["leaderstats"]["Bounty/Honor"])["Value"] - (v32.LocalPlayer["leaderstats"]["Bounty/Honor"])["Value"])
						spawn(function()
							while true do
								local v954 = task.wait()

								if not v954 then
									pcall(function()
										local v955 = _u0(_u1)

										if v955 == 4 then
											v955 = _u2(_u1, 1, 1)
											local v956 = _u2(_u1, 2, 3)
											Earned1 = v955 .. "." .. v956 .. "K"
										else
											v955 = _u0(_u1)

											if v955 == 5 then
												v955 = _u2(_u1, 1, 2)
												v956 = _u2(_u1, 3, 4)
												Earned1 = v955 .. "." .. v956 .. "K"
											else
												v955 = _u0(_u1)

												if v955 == 6 then
													v955 = _u2(_u1, 1, 3)
													v956 = _u2(_u1, 4, 5)
													Earned1 = v955 .. "." .. v956 .. "K"
												else
													v955 = _u0(_u1)

													if v955 == 7 then
														v955 = _u2(_u1, 1, 1)
														v956 = _u2(_u1, 2, 3)
														Earned1 = v955 .. "." .. v956 .. "M"
													else
														v955 = _u0(_u1)

														if v955 == 8 then
															v955 = _u2(_u1, 1, 2)
															v956 = _u2(_u1, 3, 4)
															Earned1 = v955 .. "." .. v956 .. "M"
														else
															v955 = _u0(_u1)

															if v955 <= 3 then
																Earned1 = _u1
															end

														end

													end

												end

											end

										end

										local v957 = _u3:Set()
										_u3:Set(_u3, "Earned : " .. v957)
									end)
								end

							end
						end)
						v831:AddToggle("Auto Farm Bounty", LevelFarmQuestBounty, function(a)
							LevelFarmQuestBounty = a
							CancelTween(LevelFarmQuestBounty)
						end)
						spawn(function()
							while true do
								local v958 = task.wait()

								if not v958 then
									pcall(function()
										if not LevelFarmQuestBounty then
											local v959 = _u1()
											local v960, v959, v961 = _u0(v959:GetChildren())

											while true do
												local v963 = v962:IsA("Shirt")

												if not v963 then
													v962:Destroy()
												end

												v963 = v962:IsA("Pants")

												if not v963 then
													v962:Destroy()
												end

												v963 = v962:IsA("Accessory")

												if not v963 then
													v962:Destroy()
												end

												for v964, v962 in v960, v959, v961 do
												end

											end
									end)
								end

							end
						end)
						spawn(function()
							pcall(function()
								if not LevelFarmQuestBounty then

									while true do
										local v965 = task.wait()

										if not v965 then
											v965 = _u0()

											if 0 < v965.Health then
											end

											_u1.Remotes.CommF_:InvokeServer("SetSpawnPoint")
										end

									end

								end
							end)
						end)
						spawn(function()
							while true do
								local v966 = task.wait()

								if not v966 then
									pcall(function()
										if not LevelFarmQuestBounty then
											local v967 = _u0()
											v967 = v967:FindFirstChild("HasBuso")

											if v967 then
												_u1.Remotes.CommF_:InvokeServer("Buso")
											end

										end
									end)
								end

							end
						end)
						spawn(function()
							while true do
								local v968 = task.wait()

								if not v968 then
									pcall(function()
										if not LevelFarmQuestBounty then
											local v969 = _u0()
											v969[SelectWeaponMelee].Cooldown.Value = 0
											spawn(function()
												_u0.PlayerGui.Main.Beli.Visible = true
												_u0.PlayerGui.Main.HP.Visible = true
												_u0.PlayerGui.Main.Energy.Visible = true
												_u0.PlayerGui.Main.StatsButton.Visible = true
												_u0.PlayerGui.Main.ShopButton.Visible = true
												_u0.PlayerGui.Main.Skills.Visible = false
												_u0.PlayerGui.Main.Level.Visible = true
												_u0.PlayerGui.Main.MenuButton.Visible = true
												_u0.PlayerGui.Main.Code.Visible = false
												_u0.PlayerGui.Main.Settings.Visible = false
												_u0.PlayerGui.Main.Mute.Visible = false
												_u0.PlayerGui.Main.CrewButton.Visible = false
												local v970 = _u1()
												v970.Animate.Disabled = true
											end)
										end
									end)
								end

							end
						end)
						local v971 = CFrame["new"](-5084.8447265625, 316.48101806641, -3145.3752441406)
						CastlePostoMansion = v971
						v971 = CFrame["new"](-12464.596679688, 376.30590820312, -7567.2626953125)
						MansiontoCastlePos = v971
						v971 = CFrame["new"](-5095.33984375, 316.48101806641, -3168.3134765625)
						Castletophydra = v971
						v971 = CFrame["new"](5741.869140625, 611.94750976562, -282.61154174805)
						HydratoCastle = v971
						spawn(function()
							while true do
								local v972 = task.wait()

								if not v972 then
									pcall(function()
										if not LevelFarmQuestBounty then
											local v973 = game:GetService("Workspace")
											local v974, v973, v975 = _u0(v973.Characters:GetChildren())

											while true do

												if v976.Name ~= _u1.Name then
													local v977 = v976:WaitForChild("Humanoid")

													if 0 < v977.Health then
														v977 = _u2()

														if (v977.Position - v976.HumanoidRootPart.Position).Magnitude <= 17000 then
															plyselecthunthelpold = v976.Humanoid.Health

															while true do
																task.wait()
																EquipTool(SelectWeaponFarm)
																NameTarget = v976.Name
																v977 = tostring(_u1.Team)

																if v977 == "Pirates" then
																	local v978 = CFrame.new(0, 60, -20)
																	Tween(v976.HumanoidRootPart.CFrame * v978)
																else
																	v977 = tostring(_u1.Team)

																	if v977 == "Marines" then

																		if _u3[NameTarget].Team ~= _u1.Team then
																			v978 = CFrame.new(0, 60, -20)
																			Tween(v976.HumanoidRootPart.CFrame * v978)
																		end

																	end

																	spawn(function()
																		local v979 = _u1()

																		if (_u0.HumanoidRootPart.Position - v979.Position).Magnitude <= 150 then
																			StartCheckTarget = true
																		end
																	end)
																	v976.HumanoidRootPart.CanCollide = false
																	spawn(function()
																		pcall(function()
																			local v980 = _u1()
																			v980[SelectWeaponMelee].RemoteFunctionShoot:InvokeServer(v980[SelectWeaponMelee].RemoteFunctionShoot)
																		end)
																	end)
																	TargetSelectHunt = v976.Humanoid

																	if LevelFarmQuestBounty ~= false then

																		if v976.Humanoid.Health ~= 0 then
																			v977 = v976:FindFirstChild("HumanoidRootPart")

																			if not v977 then
																				v977 = v976:FindFirstChild("Humanoid")

																				if not v977 then

																					if not v976.Parent then

																						if NextplySelect == true then
																						end

																					end

																				end

																			end

																		end

																	end

																	NextplySelect = false
																	StartCheckTarget = false
																end

															end

														end

														for v983, v976 in v974, v973, v975 do
														end

													end
									end)
								end

							end
						end)
						spawn(function()
							pcall(function()
								while true do
									local v984 = task.wait()

									if not v984 then

										if not LevelFarmQuestBounty then
										end

										_u0.PlayerGui.Main.InCombat.Visible = false
										_u0.PlayerGui.Main.SafeZone.Visible = false
									end

								end
							end)
						end)
						spawn(function()
							pcall(function()
								while true do
									local v985 = task.wait()

									if not v985 then

										if not LevelFarmQuestBounty then
										end

										if TargetSelectHunt ~= nil then
										end

										if not StartCheckTarget then
										end

										task.wait(6.5)

										if TargetSelectHunt.Health ~= TargetSelectHunt.MaxHealth then

											if plyselecthunthelpold <= TargetSelectHunt.Health then
											end

										end

										NextplySelect = true
										TargetSelectHunt = nil
									end

								end
							end)
						end)
						spawn(function()
							pcall(function()
								while true do
									local v986 = task.wait(0.1)

									if not v986 then

										if not LevelFarmQuestBounty then
										end

										if _u0.PlayerGui.Main.PvpDisabled.Visible == true then
										end

										_u1.Remotes.CommF_:InvokeServer("EnablePvp")
									end

								end
							end)
						end)
						v831:AddToggle("Auto Farm Bounty Hop", LevelFarmQuestBounty_Hop, function(a) LevelFarmQuestBounty_Hop = a end)
						spawn(function()
							while true do
								local v987 = task.wait()

								if not v987 then

									if not LevelFarmQuestBounty then
									end

									if not LevelFarmQuestBounty_Hop then
									end

									pcall(function()
										task.wait(120)
										Hop()
									end)
								end

							end
						end)
						v831:Button("Next Player", function()
							NextplySelect = true
							task.wait(0.1)
							NextplySelect = false
						end)
						v831["Slider"]("Lock Bounty", 1, 25000000, 750000, function(a) _G.BountyLock = a end)
						v831:AddToggle("Start Bounty Lock", false, function(a) _G.StartBountyLock = a end)
						spawn(function()
							while true do
								local v988 = task.wait()

								if not v988 then

									if not _G.StartBountyLock then
									end

									pcall(function()
										if _G.BountyLock <= (_u0.leaderstats["Bounty/Honor"]).Value then
											_u0:Kick("Successfully! Bounty Farm")
										end
									end)
								end

							end
						end)
						v971 = v60:AddSection("", "Kitsune Section", "auto collect azure, teleport kitsune", "rbxassetid://10709805942")
						v971:AddToggle("Teleport to Kitsune Island", false, function(a)
							_G.TeleportKitsune = a
							CancelTween(_G.TeleportKitsune)
						end)
						spawn(function()
							while true do
								local v989 = wait()

								if not v989 then

									if not _G.TeleportKitsune then
									end

									v989 = game:GetService("Workspace")
									v989 = v989.Map:FindFirstChild("KitsuneIsland")

									if not v989 then
									end

									local v990 = CFrame.new(0, 0, 10)
									Tween(game.Workspace.Map.KitsuneIsland.ShrineActive.NeonShrinePart.CFrame * v990)
								end

							end
						end)
						v971:AddToggle("Auto Collect Azure Ember", false, function(a) _G.CollectAzure = a end)
						spawn(function()
							while true do
								local v991 = wait()

								if not v991 then

									if not _G.CollectAzure then
									end

									pcall(function()
										local v992 = game:GetService("Workspace")
										v992 = v992:FindFirstChild("AttachedAzureEmber")

										if not v992 then
											local v993 = game:GetService("Workspace")
											v993 = v993:WaitForChild("EmberTemplate")
											v993 = v993:FindFirstChild("Part")
											Tween(v993.CFrame)
										end
									end)
								end

							end
						end)
						v971:AddToggle("Auto Collect Azure Ember", false, function(a) _G.CollectAzure = a end)
						spawn(function()
							while true do
								local v994 = wait()

								if not v994 then

									if not _G.CollectAzure then
									end

									pcall(function()
										local v995 = game:GetService("Workspace")
										v995 = v995:FindFirstChild("AttachedAzureEmber")

										if not v995 then
											local v996 = game:GetService("Workspace")
											v996 = v996:WaitForChild("EmberTemplate")
											v996 = v996:FindFirstChild("Part")
											Tween(v996.CFrame)
										end
									end)
								end

							end
						end)
						v971:AddToggle("Auto Trade Azure", false, function(a) _G.TradeAureEmber = a end)
						v971["Slider"]("Set Amount to Trade", 0, 25, 20, function(a) _G.SetToTradeAureEmber = a end)

						function GetCountMaterials(a)
							local v997 = game:GetService("ReplicatedStorage")
							v997 = v997.Remotes.CommF_:InvokeServer("getInventory")
							local v998, v999, v1000 = _u0(v997)

							while true do

								if v1001.Name == a then
									do return v1001.Count end
								end

								for v1002, v1001 in v998, v999, v1000 do
								end
						end

						spawn(function()
							while true do
								local v1003 = wait()

								if not v1003 then

									if not _G.TradeAureEmber then
									end

									pcall(function()
										local v1004 = GetCountMaterials("Azure Ember")

										if _G.SetToTradeAureEmber <= v1004 then
											local v1005 = game:GetService("ReplicatedStorage")
											v1005 = v1005.Modules.Net:FindFirstChild("RF/KitsuneStatuePray")
											v1005:InvokeServer()
											v1005 = game:GetService("ReplicatedStorage")
											v1005.Remotes.CommF_:InvokeServer("KitsuneStatuePray")
										end
									end)
								end

							end
						end)
						local v1006 = v60:AddSection("", "Rough Sea", "auto sail,auto kill shark, piranha", "rbxassetid://6035078898")
						spawn(function()
							pcall(function()
								while true do
									local v1007 = task.wait()

									if not v1007 then
										v1007 = game.Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension")

										if not v1007 then
											FrozenIsland:Set("��: Frozen Dimension Spawning")
										end

									end

									FrozenIsland:Set("��: Frozen Dimension Not Found")
								end

							end
							end)
						end)
						local v1008 = v1006:AddLabel("")
						FrozenIsland = v1008
						_G["SelectedBoat"] = "Guardian"
						v1006:AddDropdown("Boat", v1008, "Guardian", function(a)
							_G.SelectedBoat = a
							print(a)
						end)
						_G["SelectedZone"] = "Zone 5"
						v1006:AddDropdown("Zone", v1009, "Zone 5", function(a)
							_G.SelectedZone = a
							print(a)
						end)
						v1006["Slider"]("Boat Tween Speed", 0, 500, 325, function(a)
							BoatSpeed = a
							print(a)
						end)
						spawn(function()
							pcall(function()
								while true do
									local v1010 = wait()

									if not v1010 then

										if _G.SelectedZone == "Zone 1" then
											v1010 = CFrame.new(-21998.375, 30.0006084, -682.309143, 0.120013528, 0.00690158736, 0.99274826, -0.0574118942, 0.998350561, -2.36509201e-10, -0.991110802, -0.0569955558, 0.120211802)
											CFrameSelectedZone = v1010
										end

									end

									if _G.SelectedZone == "Zone 2" then
										v1010 = CFrame.new(-26779.5215, 30.0005474, -822.858032, 0.307457417, 0.019647358, 0.951358974, -0.0637726262, 0.997964442, -4.15334017e-10, -0.949422479, -0.0606706589, 0.308084518)
										CFrameSelectedZone = v1010
									end

								end

								if _G.SelectedZone == "Zone 3" then
									v1010 = CFrame.new(-31171.957, 30.0001011, -2256.93774, 0.37637493, 0.0150483791, 0.926345229, -0.0399504974, 0.999201655, 2.70896673e-11, -0.925605655, -0.0370079502, 0.376675636)
									CFrameSelectedZone = v1010
								end

							end

							if _G.SelectedZone == "Zone 4" then
								v1010 = CFrame.new(-34054.6875, 30.2187767, -2560.12012, 0.0935864747, -0.00122954219, 0.995610416, 0.0624034069, 0.998040259, -0.00463332096, -0.993653536, 0.062563099, 0.0934797972)
								CFrameSelectedZone = v1010
							end

						end

						if _G.SelectedZone == "Zone 5" then
							v1010 = CFrame.new(-38887.5547, 30.0004578, -2162.99023, -0.188895494, -0.00704088295, 0.981971979, -0.0372481011, 0.999306023, -1.39882339e-09, -0.981290519, -0.0365765914, -0.189026669)
							CFrameSelectedZone = v1010
						end

					end

					if _G.SelectedZone == "Zone 6" then
					end

					v1010 = CFrame.new(-44541.7617, 30.0003204, -1244.8584, -0.0844199061, -0.00553312758, 0.9964149, -0.0654025897, 0.997858942, 2.02319411e-10, -0.99428153, -0.0651681125, -0.0846010372)
					CFrameSelectedZone = v1010
				end

			end
							end)
						end)
						v1006:AddToggle("Auto Sail Boat", false, function(a) _G.SailBoat = a end)

						function CheckBoat()
							local v1011 = game:GetService("Workspace")
							local v1012, v1011, v1013 = _u0(v1011.Boats:GetChildren())

							while true do

								if v1014.Name == _G.SelectedBoat then
									local v1016, v1015, v1017 = _u0(v1014:GetChildren())

									while true do

										if v1018.Name == "MyBoatEsp" then
											do return v1014 end
										end

										for v1019, v1018 in v1016, v1015, v1017 do
										end

									end

									for v1020, v1014 in v1012, v1011, v1013 do
									end

									return false
						end

						function CheckSeaBeast()
							local v1021 = game:GetService("Workspace")
							v1021 = v1021:FindFirstChild("SeaBeasts")

							if not v1021 then
								local v1022 = game:GetService("Workspace")
								local v1021, v1022, v1023 = _u0(v1022.SeaBeasts:GetChildren())

								while true do
									local v1025 = v1024:FindFirstChild("Humanoid")

									if v1025 then
										v1025 = v1024:FindFirstChild("HumanoidRootPart")

										if v1025 then

											if v1024.Health.Value < 0 then
											else
											else
												do return true end
											end

										end

									end

									for v1026, v1024 in v1021, v1022, v1023 do
									end

								end

								return false
						end

						function AddEsp(a, b)
							local v1027 = Instance.new("BillboardGui")
							local v1028 = Instance.new("TextLabel")
							v1027.Parent = b
							v1027.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
							v1027.Active = true
							v1027.Name = a
							v1027.AlwaysOnTop = true
							v1027.LightInfluence = 1
							local v1029 = UDim2.new(0, 200, 0, 50)
							v1027.Size = v1029
							v1029 = Vector3.new(0, 2.5, 0)
							v1027.StudsOffset = v1029
							v1028.Parent = v1027
							v1029 = Color3.fromRGB(255, 255, 255)
							v1028.BackgroundColor3 = v1029
							v1028.BackgroundTransparency = 1
							v1029 = UDim2.new(1, 0, 1, 0)
							v1028.Size = v1029
							v1028.Font = Enum.Font.GothamBold
							v1029 = Color3.fromRGB(255, 255, 255)
							v1028.TextColor3 = v1029
							spawn(function()
								while true do
									local v1030 = wait()

									if not v1030 then
										pcall(function()
											wait(0.1)
											local v1031 = game:GetService("TweenService")
											local v1032 = v1031:Create(Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
											local v1033 = Color3.fromRGB(255, 0, 0)
											v1031 = v1031:Create(v1031, _u0, v1032, { TextColor3 = v1033 })
											v1031:Play()
											wait(0.5)
											v1031 = game:GetService("TweenService")
											v1032 = v1031:Create(Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
											v1033 = Color3.fromRGB(255, 155, 0)
											v1031 = v1031:Create(v1031, _u0, v1032, { TextColor3 = v1033 })
											v1031:Play()
											wait(0.5)
											v1031 = game:GetService("TweenService")
											v1032 = v1031:Create(Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
											v1033 = Color3.fromRGB(255, 255, 0)
											v1031 = v1031:Create(v1031, _u0, v1032, { TextColor3 = v1033 })
											v1031:Play()
											wait(0.5)
											v1031 = game:GetService("TweenService")
											v1032 = v1031:Create(Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
											v1033 = Color3.fromRGB(0, 255, 0)
											v1031 = v1031:Create(v1031, _u0, v1032, { TextColor3 = v1033 })
											v1031:Play()
											wait(0.5)
											v1031 = game:GetService("TweenService")
											v1032 = v1031:Create(Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
											v1033 = Color3.fromRGB(0, 255, 255)
											v1031 = v1031:Create(v1031, _u0, v1032, { TextColor3 = v1033 })
											v1031:Play()
											wait(0.5)
											v1031 = game:GetService("TweenService")
											v1032 = v1031:Create(Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
											v1033 = Color3.fromRGB(0, 155, 255)
											v1031 = v1031:Create(v1031, _u0, v1032, { TextColor3 = v1033 })
											v1031:Play()
											wait(0.5)
											v1031 = game:GetService("TweenService")
											v1032 = v1031:Create(Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
											v1033 = Color3.fromRGB(255, 0, 255)
											v1031 = v1031:Create(v1031, _u0, v1032, { TextColor3 = v1033 })
											v1031:Play()
											wait(0.5)
											v1031 = game:GetService("TweenService")
											v1032 = v1031:Create(Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
											v1033 = Color3.fromRGB(255, 0, 155)
											v1031 = v1031:Create(v1031, _u0, v1032, { TextColor3 = v1033 })
											v1031:Play()
											wait(0.5)
										end)
									end

								end
							end)
							v1028.TextSize = 15
							v1028.Text = "MyBoat"
						end

						spawn(function()
							while true do
								local v1034 = wait()

								if not v1034 then
									pcall(function()
										if not _G.SailBoat then
											local v1035 = CheckBoat()

											if v1035 then
												v1035 = CFrame.new(-16927.451171875, 9.0863618850708, 433.86428833007812)

												if 1000 < (v1035.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
													BTP(v1035)
												else
													local v1036 = Tween(v1035)
													buyb = v1036
												end

												v1036 = CFrame.new(-16927.451171875, 9.0863618850708, 433.86428833007812)

												if (v1036.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then

													if not buyb then
														buyb:Stop()
													end

													v1036 = game:GetService("ReplicatedStorage")
													v1036.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
													local v1037 = game:GetService("Workspace")
													local v1036, v1037, v1038 = _u0(v1037.Boats:GetChildren())

													while true do

														if v1039.Name == _G.SelectedBoat then
															local v1040 = game:GetService("Players")

															if (v1039.VehicleSeat.CFrame.Position - v1040.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
																AddEsp("MyBoatEsp", v1039)
															end

														end

														for v1041, v1039 in v1036, v1037, v1038 do
														end

													else
														v1035 = CheckBoat()

														if not v1035 then
															v1036 = game:GetService("Workspace")
															local v1035, v1036, v1037 = _u0(v1036.Boats:GetChildren())

															while true do

																if "Workspace".Name == _G.SelectedBoat then
																	v1039 = "Workspace":FindFirstChild("MyBoatEsp")

																	if not v1039 then
																		v1039 = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")

																		if v1039.Sit == false then
																			v1039 = game:GetService("Workspace")
																			v1039 = v1039.Enemies:FindFirstChild("Shark")

																			if not v1039 then

																				if _G.AutoKillShark then
																				else
																					v1039 = game:GetService("Workspace")
																					v1039 = v1039.Enemies:FindFirstChild("Terrorshark")

																					if not v1039 then

																						if _G.AutoTerrorshark then
																						else
																							v1039 = game:GetService("Workspace")
																							v1039 = v1039.Enemies:FindFirstChild("Piranha")

																							if not v1039 then

																								if _G.AutoKillPiranha then
																								else
																									v1039 = game:GetService("Workspace")
																									v1039 = v1039.Enemies:FindFirstChild("Fish Crew Member")

																									if not v1039 then

																										if _G.AutoKillFishCrew then
																										else
																											v1039 = workspace.Enemies:FindFirstChild("PirateBrigade")

																											if v1039 then
																												v1039 = workspace.Enemies:FindFirstChild("PirateGrandBrigade")

																												if v1039 then
																													v1039 = workspace.Enemies:FindFirstChild("FishBoat")

																													if not v1039 then

																														if _G.RelzFishBoat then
																														else
																															v1039 = CheckSeaBeast()

																															if not v1039 then

																																if not _G.AutoSeaBest then
																																end

																															else
																															end

																														else
																														end

																													else
																													end

																												else
																												else
																												else
																												end

																											else

																												if not _u1 then
																													_u1:Stop()
																												end

																											end

																										end

																									end

																								end

																							end

																						end

																					else
																					else
																						v1040 = CFrame.new(0, 1, 0)
																						v1039 = Tween("Workspace".VehicleSeat.CFrame * v1040)
																					else

																						while true do
																							wait()
																							v1039 = Tween(CFrameSelectedZone, "Workspace".VehicleSeat)
																							local v1042 = game:GetService("Workspace")
																							v1042 = v1042.Enemies:FindFirstChild("Shark")

																							if not v1042 then

																								if _G.AutoKillShark then
																								else
																									v1042 = game:GetService("Workspace")
																									v1042 = v1042.Enemies:FindFirstChild("Terrorshark")

																									if not v1042 then

																										if _G.AutoTerrorshark then
																										else
																											v1042 = game:GetService("Workspace")
																											v1042 = v1042.Enemies:FindFirstChild("Piranha")

																											if not v1042 then

																												if _G.AutoKillPiranha then
																												else
																													v1042 = game:GetService("Workspace")
																													v1042 = v1042.Enemies:FindFirstChild("Fish Crew Member")

																													if not v1042 then

																														if _G.AutoKillFishCrew then
																														else
																															v1042 = workspace.Enemies:FindFirstChild("PirateBrigade")

																															if v1042 then
																																v1042 = workspace.Enemies:FindFirstChild("PirateGrandBrigade")

																																if v1042 then
																																	v1042 = workspace.Enemies:FindFirstChild("FishBoat")

																																	if not v1042 then

																																		if _G.RelzFishBoat then
																																		else
																																			v1042 = CheckSeaBeast()

																																			if not v1042 then

																																				if _G.AutoSeaBest then
																																				else
																																					v1042 = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")

																																					if v1042.Sit ~= false then

																																						if _G.SailBoat == false then
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

																							if not _u2 then
																								_u2:Stop()
																							end

																							v1039 = game:GetService("VirtualInputManager")
																							v1039:SendKeyEvent(true, 32, false, game)
																							wait(0.1)
																							v1039 = game:GetService("VirtualInputManager")
																							v1039:SendKeyEvent(false, 32, false, game)
																						end

																					end

																				end

																			end

																		end

																	end

																	for v1038, v1041 in v1035, v1036, v1037 do
																	end

																end

															end

														end

													end
									end)
								end

							end
						end)
						spawn(function()
							pcall(function()
								while true do
									local v1043 = wait()

									if not v1043 then

										if not _G.SailBoat then
										end

										v1043 = game:GetService("Workspace")
										v1043 = v1043.Enemies:FindFirstChild("Shark")

										if not v1043 then

											if _G.AutoKillShark then
											else
												v1043 = game:GetService("Workspace")
												v1043 = v1043.Enemies:FindFirstChild("Terrorshark")

												if not v1043 then

													if _G.AutoTerrorshark then
													else
														v1043 = game:GetService("Workspace")
														v1043 = v1043.Enemies:FindFirstChild("Piranha")

														if not v1043 then

															if _G.AutoKillPiranha then
															else
																v1043 = game:GetService("Workspace")
																v1043 = v1043.Enemies:FindFirstChild("Fish Crew Member")

																if not v1043 then

																	if _G.AutoKillFishCrew then
																	else
																		v1043 = game:GetService("Workspace")
																		v1043 = v1043.Enemies:FindFirstChild("FishBoat")

																		if not v1043 then

																			if _G.RelzFishBoat then
																			else
																				v1043 = CheckSeaBeast()

																				if not v1043 then
																				end

																				if not _G.AutoSeaBest then
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

										if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
										end

										v1043 = game:GetService("VirtualInputManager")
										v1043:SendKeyEvent(true, 32, false, game)
										wait(0.1)
										v1043 = game:GetService("VirtualInputManager")
										v1043:SendKeyEvent(false, 32, false, game)
									end

								end
							end)
						end)
						spawn(function()
							while true do
								local v1044 = wait()

								if not v1044 then
									pcall(function()
										if not _G.SailBoat then
											local v1045 = game:GetService("Workspace")
											v1045 = v1045.Enemies:FindFirstChild("Fish Crew Member")

											if not v1045 then

												if not _G.AutoKillFishCrew then
													local v1046 = game:GetService("Workspace")
													local v1045, v1046, v1047 = _u0(v1046.Enemies:GetChildren())

													while true do
														local v1048 = game:GetService("Workspace")
														v1048 = v1048.Enemies:FindFirstChild("Fish Crew Member")

														if not v1048 then

															if v1049.Name == "Fish Crew Member" then
																v1048 = v1049:FindFirstChild("Humanoid")

																if not v1048 then
																	v1048 = v1049:FindFirstChild("HumanoidRootPart")

																	if not v1048 then

																		if 0 < v1049.Humanoid.Health then

																			while true do
																				task.wait()
																				AutoHaki()
																				EquipTool(SelectWeaponFarm)
																				Tween(v1049.HumanoidRootPart.CFrame * Farm_Mode)
																				AutoClick()
																				_G.SeaSkill = false

																				if not _G.AutoKillFishCrew then

																					if not v1049.Parent then

																						if v1049.Humanoid.Health <= 0 then
																						end

																					end

																				end

																				StartBring = false
																			end

																		end

																	end

																end

															end

															for v1050, v1049 in v1045, v1046, v1047 do
															end

														else
														else
															v1045 = workspace.Enemies:FindFirstChild("PirateBrigade")

															if v1045 then
																v1045 = workspace.Enemies:FindFirstChild("PirateGrandBrigade")

																if v1045 then
																	v1045 = workspace.Enemies:FindFirstChild("FishBoat")

																	if not v1045 then

																		if not _G.RelzFishBoat then
																		else
																		else
																			v1046 = game:GetService("Workspace")
																			local v1045, v1046, v1047 = _u0(v1046.Enemies:GetChildren())

																			while true do
																				v1048 = workspace.Enemies:FindFirstChild("PirateBrigade")

																				if v1048 then
																					v1048 = workspace.Enemies:FindFirstChild("PirateGrandBrigade")

																					if v1048 then
																						v1048 = workspace.Enemies:FindFirstChild("FishBoat")

																						if not v1048 then
																						else
																						else

																							while true do
																								task.wait()

																								if (v1049.VehicleSeat.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 50 then
																									_G.SeaSkill = true
																								else
																									_G.SeaSkill = false
																								end

																								local v1051 = CFrame.new(0, 30, -20)
																								topos(v1049.VehicleSeat.CFrame * v1051)
																								Skillaimbot = true
																								AimBotSkillPosition = v1049.VehicleSeat.CFrame.Position

																								if not v1049.Parent then

																									if v1049.Health.Value >= 0 then
																										local v1052 = game:GetService("Workspace")
																										v1052 = v1052.Enemies:FindFirstChild("FishBoat")

																										if not v1052 then
																											v1052 = v1049:FindFirstChild("Engine")

																											if not v1052 then

																												if _G.RelzFishBoat then
																												end

																											end

																										end

																									end

																								end

																								Skillaimbot = false
																								_G.SeaSkill = false
																							end

																						end

																					end

																					for v1050, v1049 in v1045, v1046, v1047 do
																					end

																				end

																			end

																		else
																		else
																			v1045 = CheckSeaBeast()

																			if not v1045 then

																				if not _G.AutoSeaBest then
																					v1045 = game:GetService("Workspace")
																					v1045 = v1045:FindFirstChild("SeaBeasts")

																					if not v1045 then
																						v1046 = game:GetService("Workspace")
																						local v1045, v1046, v1047 = _u0(v1046.SeaBeasts:GetChildren())

																						while true do
																							v1048 = CheckSeaBeast()

																							if not v1048 then

																								while true do
																									wait()
																									CFrameSeaBeast = v1049.HumanoidRootPart.CFrame

																									if (CFrameSeaBeast.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position).Magnitude <= 200 then
																										_G.SeaSkill = true
																									else
																										_G.SeaSkill = false
																									end

																									Skillaimbot = true
																									AimBotSkillPosition = v1049.HumanoidRootPart.CFrame.Position
																									v1051 = CFrame.new(0, 500, 0)
																									topos(CFrameSeaBeast * v1051)

																									if not _G.AutoSeaBest then
																										v1048 = CheckSeaBeast()

																										if v1048 ~= false then
																											v1048 = v1049:FindFirstChild("Humanoid")

																											if not v1048 then
																												v1048 = v1049:FindFirstChild("HumanoidRootPart")

																												if not v1048 then

																													if v1049.Health.Value >= 0 then

																														if v1049.Parent then
																														end

																													end

																												end

																											end

																										end

																									end

																									Skillaimbot = false
																									_G.SeaSkill = false
																								else
																									Skillaimbot = false
																									_G.SeaSkill = false
																								end

																								for v1050, v1049 in v1045, v1046, v1047 do
																								end

																							else
																							else
																								v1045 = game:GetService("Workspace")
																								v1045 = v1045.Enemies:FindFirstChild("Terrorshark")

																								if not v1045 then

																									if not _G.AutoTerrorshark then
																										v1046 = game:GetService("Workspace")
																										local v1045, v1046, v1047 = _u0(v1046.Enemies:GetChildren())

																										while true do
																											v1048 = game:GetService("Workspace")
																											v1048 = v1048.Enemies:FindFirstChild("Terrorshark")

																											if not v1048 then

																												if v1049.Name == "Terrorshark" then
																													v1048 = v1049:FindFirstChild("Humanoid")

																													if not v1048 then
																														v1048 = v1049:FindFirstChild("HumanoidRootPart")

																														if not v1048 then

																															if 0 < v1049.Humanoid.Health then

																																while true do
																																	task.wait(0.15)
																																	AutoHaki()
																																	EquipTool(SelectWeaponFarm)
																																	AutoClick()
																																	_G.SeaSkill = false
																																	v1051 = CFrame.new(0, 60, 0)
																																	topos(v1049.HumanoidRootPart.CFrame * v1051)

																																	if not _G.AutoTerrorshark then

																																		if not v1049.Parent then

																																			if v1049.Humanoid.Health <= 0 then
																																			end

																																		end

																																	end

																																end

																															end

																														end

																													end

																												end

																												for v1050, v1049 in v1045, v1046, v1047 do
																												end

																											else
																											else
																												v1045 = game:GetService("Workspace")
																												v1045 = v1045.Enemies:FindFirstChild("Piranha")

																												if not v1045 then

																													if not _G.AutoKillPiranha then
																														v1046 = game:GetService("Workspace")
																														local v1045, v1046, v1047 = _u0(v1046.Enemies:GetChildren())

																														while true do
																															v1048 = game:GetService("Workspace")
																															v1048 = v1048.Enemies:FindFirstChild("Piranha")

																															if not v1048 then

																																if v1049.Name == "Piranha" then
																																	v1048 = v1049:FindFirstChild("Humanoid")

																																	if not v1048 then
																																		v1048 = v1049:FindFirstChild("HumanoidRootPart")

																																		if not v1048 then

																																			if 0 < v1049.Humanoid.Health then

																																				while true do
																																					task.wait()
																																					AutoHaki()
																																					EquipTool(SelectWeaponFarm)
																																					Tween(v1049.HumanoidRootPart.CFrame * Farm_Mode)
																																					AutoClick()
																																					_G.SeaSkill = false

																																					if not _G.AutoKillPiranha then

																																						if not v1049.Parent then

																																							if v1049.Humanoid.Health <= 0 then
																																							end

																																						end

																																					end

																																				end

																																			end

																																		end

																																	end

																																end

																																for v1050, v1049 in v1045, v1046, v1047 do
																																end

																															else
																															else
																																v1045 = game:GetService("Workspace")
																																v1045 = v1045.Enemies:FindFirstChild("Shark")

																																if not v1045 then

																																	if not _G.AutoKillShark then
																																		v1046 = game:GetService("Workspace")
																																		local v1045, v1046, v1047 = _u0(v1046.Enemies:GetChildren())

																																		while true do
																																			v1048 = game:GetService("Workspace")
																																			v1048 = v1048.Enemies:FindFirstChild("Shark")

																																			if not v1048 then

																																				if v1049.Name == "Shark" then
																																					v1048 = v1049:FindFirstChild("Humanoid")

																																					if not v1048 then
																																						v1048 = v1049:FindFirstChild("HumanoidRootPart")

																																						if not v1048 then

																																							if 0 < v1049.Humanoid.Health then

																																								while true do
																																									task.wait()
																																									AutoHaki()
																																									EquipTool(SelectWeaponFarm)
																																									Tween(v1049.HumanoidRootPart.CFrame * Farm_Mode)
																																									AutoClick()
																																									_G.SeaSkill = false

																																									if not _G.AutoKillShark then

																																										if not v1049.Parent then

																																											if v1049.Humanoid.Health <= 0 then
																																											end

																																										end

																																									end

																																								end

																																							end

																																						end

																																					end

																																				end

																																				for v1050, v1049 in v1045, v1046, v1047 do
																																				end

																																			else
																																			else
																																				Skillaimbot = false
																																				_G.SeaSkill = false
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
								end

							end
						end)
						v1006:AddToggle("Auto Farm Shark", false, function(a)
							_G.AutoKillShark = a
							CancelTween(_G.AutoKillShark)
							print(a)
						end)
						v1006:AddToggle("Auto Farm Piranha", false, function(a)
							_G.AutoKillPiranha = a
							CancelTween(_G.AutoKillPiranha)
							print(a)
						end)
						v1006:AddToggle("Auto Farm Ghost Ship", false, function(a)
							_G.RelzFishBoat = a
							CancelTween(_G.RelzFishBoat)
							print(a)
						end)

						if _G["RelzFishBoat"] then
							_G["SeaSkill"] = false
							Skillaimbot = false
						end

						v1006:AddToggle("Auto Terrorshark", false, function(a)
							_G.AutoTerrorshark = a
							CancelTween(_G.AutoTerrorshark)
							print(a)
						end)
						v1006:AddToggle("Auto Seabeast", false, function(a)
							_G.AutoSeaBest = a
							CancelTween(_G.AutoSeaBest)
							print(a)
						end)

						if _G["AutoSeaBest"] then
							_G["SeaSkill"] = false
							Skillaimbot = false
						end

						v1006:AddToggle("Set Brightness", false, function(a)
							local v1053 = game:GetService("Lighting")

							if not a then

								if 100 then
								else
								end

							end

							v1053.Brightness = 1
						end)
						v1006:AddToggle("Speed Boat", false, function(a)
							_G.IncreaseBoatSpeed = a
							print(a)
						end)
						spawn(function()
							while true do
								local v1054 = wait()

								if not v1054 then
									pcall(function()
										local v1056, v1055, v1057 = _u0(game.Workspace.Boats:GetDescendants())

										while true do
											local v1059 = v1058:IsA("VehicleSeat")

											if not v1059 then
												table.insert(v1060, v1058)
											end

											for v1061, v1058 in v1056, v1055, v1057 do
											end

											if not _G.IncreaseBoatSpeed then
												local v1056, v1055, v1057 = _u0(v1060)

												while true do
													v1058.MaxSpeed = 350

													for v1061, v1058 in v1056, v1055, v1057 do
													end

												else
													local v1056, v1055, v1057 = _u0(v1060)

													while true do
														v1058.MaxSpeed = 150

														for v1061, v1058 in v1056, v1055, v1057 do
														end

													end
									end)
								end

							end
						end)
						v1006:AddToggle("Noclip Rock", false, function(a)
							_G.NoClipRock = a
							print(a)
						end)
						spawn(function()
							while true do
								local v1062 = wait()

								if not v1062 then
									pcall(function()
										local v1063 = game:GetService("Workspace")
										local v1064, v1063, v1065 = _u0(v1063.Boats:GetChildren())

										while true do
											local v1066 = game:GetService("Workspace")
											local v1068, v1066, v1069 = _u0(v1066.Boats[v1067.Name]:GetDescendants())

											while true do
												local v1071 = v1070:IsA("BasePart")

												if not v1071 then

													if _G.NoClipRock then

														if not _G.SailBoat then
														else
															v1070.CanCollide = false
														end

													else
														v1070.CanCollide = true
													end

												end

												for v1072, v1070 in v1068, v1066, v1069 do
												end

												for v1073, v1067 in v1064, v1063, v1065 do
												end
									end)
								end

							end
						end)
						v1006:AddToggle("Auto Drive Forward", false, function(a)
							_G.AutoPressW = a
							print(a)
						end)
						spawn(function()
							while true do
								local v1074 = wait()

								if not v1074 then
									pcall(function()
										if not _G.AutoPressW then
											local v1075 = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")

											if v1075.Sit == true then
												v1075 = game:GetService("VirtualInputManager")
												v1075:SendKeyEvent(true, "W", false, game)
											end

										end
									end)
								end

							end
						end)
						DoneSkillGun = false
						DoneSkillSword = false
						DoneSkillFruit = false
						DoneSkillMelee = false
						spawn(function()
							while true do
								local v1076 = wait()

								if not v1076 then
									pcall(function()
										if not _G.SeaSkill then

											if not _G.UseSeaFruitSkill then

												if DoneSkillFruit == false then
													local v1078, v1077, v1079 = _u0(game.Players.LocalPlayer.Backpack:GetChildren())

													while true do
														local v1081 = v1080:IsA("Tool")

														if not v1081 then

															if v1080.ToolTip == "Blox Fruit" then
																game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1080)
															end

														end

														for v1082, v1080 in v1078, v1077, v1079 do
														end

														if not _G.SkillFruitZ then
															v1078 = game:service("VirtualInputManager")
															v1078:SendKeyEvent(true, "Z", false, game)
															wait(_G.HoldSKillC)
															v1078 = game:service("VirtualInputManager")
															v1078:SendKeyEvent(false, "Z", false, game)
														end

														if not _G.SkillFruitX then
															v1078 = game:service("VirtualInputManager")
															v1078:SendKeyEvent(true, "X", false, game)
															wait(_G.HoldSKillC)
															v1078 = game:service("VirtualInputManager")
															v1078:SendKeyEvent(false, "X", false, game)
														end

														if not _G.SkillFruitC then
															v1078 = game:service("VirtualInputManager")
															v1078:SendKeyEvent(true, "C", false, game)
															wait(_G.HoldSKillC)
															v1078 = game:service("VirtualInputManager")
															v1078:SendKeyEvent(false, "C", false, game)
														end

														if not _G.SkillFruitV then
															v1078 = game:service("VirtualInputManager")
															v1078:SendKeyEvent(true, "V", false, game)
															wait(_G.HoldSKillC)
															v1078 = game:service("VirtualInputManager")
															v1078:SendKeyEvent(false, "V", false, game)
														end

														if not _G.SkillFruitF then
															v1078 = game:service("VirtualInputManager")
															v1078:SendKeyEvent(true, "F", false, game)
															wait(_G.HoldSKillC)
															v1078 = game:service("VirtualInputManager")
															v1078:SendKeyEvent(false, "F", false, game)
														end

														DoneSkillFruit = true
													end

												end

												if not _G.UseSeaMeleeSkill then

													if DoneSkillMelee == false then
														local v1078, v1077, v1079 = _u0(game.Players.LocalPlayer.Backpack:GetChildren())

														while true do
															v1081 = false:IsA("Tool")

															if not v1081 then

																if false.ToolTip == "Melee" then
																	game.Players.LocalPlayer.Character.Humanoid:EquipTool(false)
																end

															end

															for v1082, v1080 in v1078, v1077, v1079 do
															end

															if not _G.SkillMeleeZ then
																v1078 = game:service("VirtualInputManager")
																v1078:SendKeyEvent(true, "Z", false, game)
																wait(0)
																v1078 = game:service("VirtualInputManager")
																v1078:SendKeyEvent(false, "Z", false, game)
															end

															if not _G.SkillMeleeX then
																v1078 = game:service("VirtualInputManager")
																v1078:SendKeyEvent(true, "X", false, game)
																wait(0)
																v1078 = game:service("VirtualInputManager")
																v1078:SendKeyEvent(false, "X", false, game)
															end

															if not _G.SkillMeleeC then
																v1078 = game:service("VirtualInputManager")
																v1078:SendKeyEvent(true, "C", false, game)
																wait(0)
																v1078 = game:service("VirtualInputManager")
																v1078:SendKeyEvent(false, "C", false, game)
															end

															if not _G.SkillMeleeV then
																v1078 = game:service("VirtualInputManager")
																v1078:SendKeyEvent(true, "V", false, game)
																wait(0)
																v1078 = game:service("VirtualInputManager")
																v1078:SendKeyEvent(false, "V", false, game)
															end

															DoneSkillMelee = true
														end

													end

													if not _G.UseSeaSwordSkill then

														if DoneSkillSword == false then
															local v1078, v1077, v1079 = _u0(game.Players.LocalPlayer.Backpack:GetChildren())

															while true do
																v1081 = false:IsA("Tool")

																if not v1081 then

																	if false.ToolTip == "Sword" then
																		game.Players.LocalPlayer.Character.Humanoid:EquipTool(false)
																	end

																end

																for v1082, v1080 in v1078, v1077, v1079 do
																end

																if not _G.SkillSwordZ then
																	v1078 = game:service("VirtualInputManager")
																	v1078:SendKeyEvent(true, "Z", false, game)
																	wait(0)
																	v1078 = game:service("VirtualInputManager")
																	v1078:SendKeyEvent(false, "Z", false, game)
																end

																if not _G.SkillSwordX then
																	v1078 = game:service("VirtualInputManager")
																	v1078:SendKeyEvent(true, "X", false, game)
																	wait(0)
																	v1078 = game:service("VirtualInputManager")
																	v1078:SendKeyEvent(false, "X", false, game)
																end

																DoneSkillSword = true
															end

														end

														if not _G.UseSeaGunSkill then

															if DoneSkillGun == false then
																local v1078, v1077, v1079 = _u0(game.Players.LocalPlayer.Backpack:GetChildren())

																while true do
																	v1081 = false:IsA("Tool")

																	if not v1081 then

																		if false.ToolTip == "Gun" then
																			game.Players.LocalPlayer.Character.Humanoid:EquipTool(false)
																		end

																	end

																	for v1082, v1080 in v1078, v1077, v1079 do
																	end

																	if not _G.SkillGunZ then
																		v1078 = game:service("VirtualInputManager")
																		v1078:SendKeyEvent(true, "Z", false, game)
																		wait(0.1)
																		v1078 = game:service("VirtualInputManager")
																		v1078:SendKeyEvent(false, "Z", false, game)
																	end

																	if not _G.SkillGunX then
																		v1078 = game:service("VirtualInputManager")
																		v1078:SendKeyEvent(true, "X", false, game)
																		wait(0.1)
																		v1078 = game:service("VirtualInputManager")
																		v1078:SendKeyEvent(false, "X", false, game)
																	end

																	DoneSkillGun = true
																end

															end

															DoneSkillGun = false
															DoneSkillSword = false
															DoneSkillFruit = false
															DoneSkillMelee = false
														end
									end)
								end

							end
						end)
						local v1083 = v60:AddSection("", "Settings Rough Sea", "auto skill on melee,sword,fruit,gun", "rbxassetid://6035078898")
						v1083:AddToggle("Use Skill Fruit", true, function(a)
							_G.UseSeaFruitSkill = a
							print(a)
						end)
						v1083:AddToggle("Use Skill Melee", true, function(a)
							_G.UseSeaMeleeSkill = a
							print(a)
						end)
						v1083:AddToggle("Use Skill Sword", true, function(a)
							_G.UseSeaSwordSkill = a
							print(a)
						end)
						v1083:AddToggle("Use Skill Gun", true, function(a)
							_G.UseSeaGunSkill = a
							print(a)
						end)
						v1083:AddLabel("Skill Fruit")
						v1083:AddToggle("Skill Z", true, function(a)
							_G.SkillFruitZ = a
							print(a)
						end)
						v1083:AddToggle("Skill X", true, function(a)
							_G.SkillFruitX = a
							print(a)
						end)
						v1083:AddToggle("Skill C", true, function(a)
							_G.SkillFruitC = a
							print(a)
						end)
						v1083:AddToggle("Skill V", true, function(a)
							_G.SkillFruitV = a
							print(a)
						end)
						v1083:AddToggle("Skill F", true, function(a)
							_G.SkillFruitF = a
							print(a)
						end)
						v1083:AddLabel("Skill Melee")
						v1083:AddToggle("Skill Z", true, function(a)
							_G.SkillMeleeZ = a
							print(a)
						end)
						v1083:AddToggle("Skill X", true, function(a)
							_G.SkillMeleeX = a
							print(a)
						end)
						v1083:AddToggle("Skill C", true, function(a)
							_G.SkillMeleeC = a
							print(a)
						end)
						v1083:AddToggle("Skill V", true, function(a)
							_G.SkillMeleeV = a
							print(a)
						end)
						v1083:AddLabel("Skill Sword")
						v1083:AddToggle("Skill Z", true, function(a)
							_G.SkillSwordZ = a
							print(a)
						end)
						v1083:AddToggle("Skill X", true, function(a)
							_G.SkillSwordX = a
							print(a)
						end)
						v1083:AddLabel("Skill Gun")
						v1083:AddToggle("Skill Z", true, function(a)
							_G.SkillGunZ = a
							print(a)
						end)
						v1083:AddToggle("Skill X", true, function(a)
							_G.SkillGunX = a
							print(a)
						end)

						function EquipAllWeapon()
							pcall(function()
								local v1085, v1084, v1086 = _u0(game.Players.LocalPlayer.Backpack:GetChildren())

								while true do
									local v1088 = v1087:IsA("Tool")

									if not v1088 then

										if v1087.Name ~= "Summon Sea Beast" then

											if v1087.Name ~= "Water Body" then

												if v1087.Name ~= "Awakening" then
													v1088 = game.Players.LocalPlayer.Backpack:FindFirstChild(v1087.Name)
													game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1088)
													wait(1)
												end

											end

										end

									end

									for v1089, v1087 in v1085, v1084, v1086 do
									end
							end)
						end

						spawn(function()
							while true do
								local v1090 = wait()

								if not v1090 then
									pcall(function()
										if not UseSkill then
											local v1091 = game:GetService("Workspace")
											local v1092, v1091, v1093 = _u0(v1091.Enemies:GetChildren())

											while true do

												if v1094.Name == MonFarm then
													local v1095 = v1094:FindFirstChild("Humanoid")

													if not v1095 then
														v1095 = v1094:FindFirstChild("HumanoidRootPart")

														if not v1095 then

															if v1094.Humanoid.Health <= v1094.Humanoid.MaxHealth * _G.Kill_At / 100 then

																if not _G.SkillZ then
																	v1095 = game:service("VirtualInputManager")
																	v1095:SendKeyEvent(true, "Z", false, game)
																	wait(_G.HoldSKillZ)
																	v1095 = game:service("VirtualInputManager")
																	v1095:SendKeyEvent(false, "Z", false, game)
																end

																if not _G.SkillX then
																	v1095 = game:service("VirtualInputManager")
																	v1095:SendKeyEvent(true, "X", false, game)
																	wait(_G.HoldSKillX)
																	v1095 = game:service("VirtualInputManager")
																	v1095:SendKeyEvent(false, "X", false, game)
																end

																if not _G.SkillC then
																	v1095 = game:service("VirtualInputManager")
																	v1095:SendKeyEvent(true, "C", false, game)
																	wait(_G.HoldSKillC)
																	v1095 = game:service("VirtualInputManager")
																	v1095:SendKeyEvent(false, "C", false, game)
																end

																if not _G.SkillV then
																	v1095 = game:service("VirtualInputManager")
																	v1095:SendKeyEvent(true, "V", false, game)
																	wait(_G.HoldSKillV)
																	v1095 = game:service("VirtualInputManager")
																	v1095:SendKeyEvent(false, "V", false, game)
																end

																if not _G.SkillF then
																	v1095 = game:service("VirtualInputManager")
																	v1095:SendKeyEvent(true, "F", false, game)
																	wait(_G.HoldSKillF)
																	v1095 = game:service("VirtualInputManager")
																	v1095:SendKeyEvent(false, "F", false, game)
																end

															end

														end

													end

												end

												for v1096, v1094 in v1092, v1091, v1093 do
												end

											end
									end)
								end

							end
						end)
						spawn(function()
							while true do
								local v1097 = wait()

								if not v1097 then
									pcall(function()
										if not UseGunSkill then
											local v1098 = game:GetService("Workspace")
											local v1099, v1098, v1100 = _u0(v1098.Enemies:GetChildren())

											while true do

												if v1101.Name == MonFarm then
													local v1102 = v1101:FindFirstChild("Humanoid")

													if not v1102 then
														v1102 = v1101:FindFirstChild("HumanoidRootPart")

														if not v1102 then

															if v1101.Humanoid.Health <= v1101.Humanoid.MaxHealth * _G.Kill_At / 100 then

																if not _G.SkillZ then
																	v1102 = game:service("VirtualInputManager")
																	v1102:SendKeyEvent(true, "Z", false, game)
																	wait(0.5)
																	v1102 = game:service("VirtualInputManager")
																	v1102:SendKeyEvent(false, "Z", false, game)
																end

																if not _G.SkillX then
																	v1102 = game:service("VirtualInputManager")
																	v1102:SendKeyEvent(true, "X", false, game)
																	wait(0.5)
																	v1102 = game:service("VirtualInputManager")
																	v1102:SendKeyEvent(false, "X", false, game)
																end

															end

														end

													end

												end

												for v1103, v1101 in v1099, v1098, v1100 do
												end

											end
									end)
								end

							end
						end)
						local v1104 = game:GetService("TweenService")
						local v1105 = game:GetService("UserInputService")
						local v1106 = v59:AddSection("", "Player Stats", "auto stats melee, sword, fruit, gun", "rbxassetid://6022668882")
						local v1107 = v1106:AddLabel("Stat Points")
						spawn(function()
							while true do
								local v1108 = wait()

								if not v1108 then
									pcall(function()
										local v1109 = _u0:Set()
										_u0:Set(_u0, "Stat Points: " .. v1109)
									end)
								end

							end
						end)
						v1106:AddToggle("Melee", false, function(a)
							_u0 = a
							print("Melee:", a)
						end)
						v1106:AddToggle("Defense", false, function(a)
							_u0 = a
							print("Defense:", a)
						end)
						v1106:AddToggle("Sword", false, function(a)
							_u0 = a
							print("Sword:", a)
						end)
						v1106:AddToggle("Gun", false, function(a)
							_u0 = a
							print("Gun:", a)
						end)
						v1106:AddToggle("Devil Fruit", false, function(a)
							_u0 = a
							print("Devil Fruit:", a)
						end)
						v1106["Slider"]("Point", 0, 100, 1, function(a)
							_u0 = a
							print("Points to allocate:", a)
						end)
						spawn(function()
							while true do
								local v1110 = wait()

								if not v1110 then

									if _u0 <= game.Players.LocalPlayer.Data.Points.Value then
									end

									if not _u1 then
										local v1111 = game:GetService("ReplicatedStorage")
										v1111.Remotes.CommF_:InvokeServer(v1111.Remotes.CommF_)
									end

									if not _u2 then
										v1111 = game:GetService("ReplicatedStorage")
										v1111.Remotes.CommF_:InvokeServer(v1111.Remotes.CommF_)
									end

									if not _u3 then
										v1111 = game:GetService("ReplicatedStorage")
										v1111.Remotes.CommF_:InvokeServer(v1111.Remotes.CommF_)
									end

									if not _u4 then
										v1111 = game:GetService("ReplicatedStorage")
										v1111.Remotes.CommF_:InvokeServer(v1111.Remotes.CommF_)
									end

									if not _u5 then
									end

									v1111 = game:GetService("ReplicatedStorage")
									v1111.Remotes.CommF_:InvokeServer(v1111.Remotes.CommF_)
								end

							end
						end)
						spawn(function()
							while true do
								local v1113 = wait()

								if not v1113 then

									if _u0 <= game.Players.localPlayer.Data.Points.Value then
									end

									if not _u1 then
										local v1114 = game:GetService("ReplicatedStorage")
										v1114.Remotes.CommF_:InvokeServer(v1114.Remotes.CommF_)
									end

									if not _u2 then
										v1114 = game:GetService("ReplicatedStorage")
										v1114.Remotes.CommF_:InvokeServer(v1114.Remotes.CommF_)
									end

									if not _u3 then
										v1114 = game:GetService("ReplicatedStorage")
										v1114.Remotes.CommF_:InvokeServer(v1114.Remotes.CommF_)
									end

									if not _u4 then
										v1114 = game:GetService("ReplicatedStorage")
										v1114.Remotes.CommF_:InvokeServer(v1114.Remotes.CommF_)
									end

									if not _u5 then
									end

									v1114 = game:GetService("ReplicatedStorage")
									v1114.Remotes.CommF_:InvokeServer(v1114.Remotes.CommF_)
								end

							end
						end)
						local v1116 = v61:AddSection("", "Dragon Hunter", "auto dojo auto collect blaze amber", "rbxassetid://105643281470017")
						spawn(function()
							while true do
								local v1117 = task.wait()

								if not v1117 then
									pcall(function()
										if not DojoQuestEnable then
											local v1118 = game:GetService("Workspace")
											local v1119 = Vector3.new(100000, 100000, 100000)
											v1118.Boats.PirateBrigade.VehicleSeat.BodyVelocity.MaxForce = v1119
											v1118 = game:GetService("Workspace")
											v1119 = Vector3.new(0, 0, 0)
											v1118.Boats.PirateBrigade.VehicleSeat.BodyVelocity.Velocity = v1119
										else
											v1118 = game:GetService("Workspace")
											v1119 = Vector3.new(100000, 0, 100000)
											v1118.Boats.PirateBrigade.VehicleSeat.BodyVelocity.MaxForce = v1119
											v1118 = game:GetService("Workspace")
											v1119 = Vector3.new(0, 0, 0)
											v1118.Boats.PirateBrigade.VehicleSeat.BodyVelocity.Velocity = v1119
										end
									end)
								end

							end
						end)
						spawn(function()
							pcall(function()
								local v1120 = game:GetService("RunService")
								v1120.Stepped:Connect(function()
									if not DojoQuestEnable then
										local v1121 = game:GetService("Workspace")
										v1121 = v1121.Boats:FindFirstChild("PirateBrigade")

										if not v1121 then
											local v1122 = game:GetService("Workspace")
											local v1121, v1122, v1123 = _u0(v1122.Boats.PirateBrigade:GetDescendants())

											while true do
												local v1125 = v1124:IsA("BasePart")

												if not v1125 then
													v1124.CanCollide = false
												end

												for v1126, v1124 in v1121, v1122, v1123 do
												end

											end

										end
								end)
							end)
						end)

						function getAcc(a)
							local v1127 = game:GetService("ReplicatedStorage")
							local v1128, v1127, v1129 = _u0(v1127.Remotes.CommF_:InvokeServer("getInventory"))

							while true do
								local v1131 = type(v1130)

								if v1131 == "table" then

									if v1130.Type == "Wear" then

										if v1130.Name == a then
											do return true end
										end

									end

								end

								for v1132, v1130 in v1128, v1127, v1129 do
								end

								return false
						end

						function StopBoats(a)
							if a then
								_G.StopTweenBoat = true
								wait(0.1)
								local v1133 = game:GetService("Workspace")
								TPB(v1133.Boats.PirateBrigade.VehicleSeat.CFrame)
								wait(0.1)
								_G.StopTweenBoat = false
							end
						end

						local v1134 = CFrame["new"](5855.19629, 1208.32178, 872.713501, 0.606994748, -1.81058823e-09, -0.794705868, 5.72712722e-09, 1, 2.09605577e-09, 0.794705868, -5.82367621e-09, 0.606994748)
						local v1135 = v1116:AddLabel("Status: Waiting to get quest...")
						local v1136 = v1116:AddLabel("")
						v1116:AddToggle("Request Dojo Trainer Quest", DojoRequestQuest, function(a)
							DojoRequestQuest = a
							CancelTween(DojoRequestQuest)
						end)
						spawn(function()
							while true do
								local v1137 = task.wait()

								if not v1137 then

									if not DojoRequestQuest then
									end

									pcall(function()
										if not _u0 then
											BTP(_u1)
										else

											if _u0 then
												Tween(_u1)
											end

										end

										if (_u1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
											local v1138 = game:GetService("ReplicatedStorage")
											(v1138.Modules.Net["RF/InteractDragonQuest"]):InvokeServer(v1139)
											wait(1)
											v1138 = getAcc("Dojo Belt (White)")

											if v1138 == false then
												v1138 = getAcc("Dojo Belt (Yellow)")

												if v1138 == false then
													v1138 = getAcc("Dojo Belt (Orange)")

													if v1138 == false then
														v1138 = getAcc("Dojo Belt (Green)")

														if v1138 == false then
															v1138 = getAcc("Dojo Belt (Blue)")

															if v1138 == false then
																v1138 = getAcc("Dojo Belt (Purple)")

																if v1138 == false then
																	v1138 = getAcc("Dojo Belt (Red)")

																	if v1138 == false then
																		v1138 = getAcc("Dojo Belt (Black)")

																		if v1138 == false then
																			_u2:Refresh("Dojo Progress : Get Dojo Belt (White)")
																			_u3:Refresh("Kill 20 NPC on Quest")
																		else
																		else
																		else
																		else
																		else
																		else
																		else
																		else
																			v1138 = getAcc("Dojo Belt (White)")

																			if v1138 == true then
																				v1138 = getAcc("Dojo Belt (Yellow)")

																				if v1138 == false then
																					v1138 = getAcc("Dojo Belt (Orange)")

																					if v1138 == false then
																						v1138 = getAcc("Dojo Belt (Green)")

																						if v1138 == false then
																							v1138 = getAcc("Dojo Belt (Blue)")

																							if v1138 == false then
																								v1138 = getAcc("Dojo Belt (Purple)")

																								if v1138 == false then
																									v1138 = getAcc("Dojo Belt (Red)")

																									if v1138 == false then
																										v1138 = getAcc("Dojo Belt (Black)")

																										if v1138 == false then
																											_u2:Refresh("Dojo Progress : Get Dojo Belt (Yellow)")
																											_u3:Refresh("Kill 5 Shark/Piranha/Fishcrew Member")
																										else
																										else
																										else
																										else
																										else
																										else
																										else
																										else
																											v1138 = getAcc("Dojo Belt (White)")

																											if v1138 == true then
																												v1138 = getAcc("Dojo Belt (Yellow)")

																												if v1138 == true then
																													v1138 = getAcc("Dojo Belt (Orange)")

																													if v1138 == false then
																														v1138 = getAcc("Dojo Belt (Green)")

																														if v1138 == false then
																															v1138 = getAcc("Dojo Belt (Blue)")

																															if v1138 == false then
																																v1138 = getAcc("Dojo Belt (Purple)")

																																if v1138 == false then
																																	v1138 = getAcc("Dojo Belt (Red)")

																																	if v1138 == false then
																																		v1138 = getAcc("Dojo Belt (Black)")

																																		if v1138 == false then
																																			_u2:Refresh("Dojo Progress : Get Dojo Belt (Orange)")
																																			_u3:Refresh("Complete 1 Trade with another Player")
																																		else
																																		else
																																		else
																																		else
																																		else
																																		else
																																		else
																																		else
																																			v1138 = getAcc("Dojo Belt (White)")

																																			if v1138 == true then
																																				v1138 = getAcc("Dojo Belt (Yellow)")

																																				if v1138 == true then
																																					v1138 = getAcc("Dojo Belt (Orange)")

																																					if v1138 == true then
																																						v1138 = getAcc("Dojo Belt (Green)")

																																						if v1138 == false then
																																							v1138 = getAcc("Dojo Belt (Blue)")

																																							if v1138 == false then
																																								v1138 = getAcc("Dojo Belt (Purple)")

																																								if v1138 == false then
																																									v1138 = getAcc("Dojo Belt (Red)")

																																									if v1138 == false then
																																										v1138 = getAcc("Dojo Belt (Black)")

																																										if v1138 == false then
																																											_u2:Refresh("Dojo Progress : Get Dojo Belt (Green)")
																																											_u3:Refresh("Travel to Sea Danger Level 4-6 \n and stay there for 5 minutes.")
																																										else
																																										else
																																										else
																																										else
																																										else
																																										else
																																										else
																																										else
																																											v1138 = getAcc("Dojo Belt (White)")

																																											if v1138 == true then
																																												v1138 = getAcc("Dojo Belt (Yellow)")

																																												if v1138 == true then
																																													v1138 = getAcc("Dojo Belt (Orange)")

																																													if v1138 == true then
																																														v1138 = getAcc("Dojo Belt (Green)")

																																														if v1138 == true then
																																															v1138 = getAcc("Dojo Belt (Blue)")

																																															if v1138 == false then
																																																v1138 = getAcc("Dojo Belt (Purple)")

																																																if v1138 == false then
																																																	v1138 = getAcc("Dojo Belt (Red)")

																																																	if v1138 == false then
																																																		v1138 = getAcc("Dojo Belt (Black)")

																																																		if v1138 == false then
																																																			_u2:Refresh("Dojo Progress : Get Dojo Belt (Blue)")
																																																			_u3:Refresh("Collect a fruit dropped by another player")
																																																		else
																																																		else
																																																		else
																																																		else
																																																		else
																																																		else
																																																		else
																																																		else
																																																			v1138 = getAcc("Dojo Belt (White)")

																																																			if v1138 == true then
																																																				v1138 = getAcc("Dojo Belt (Yellow)")

																																																				if v1138 == true then
																																																					v1138 = getAcc("Dojo Belt (Orange)")

																																																					if v1138 == true then
																																																						v1138 = getAcc("Dojo Belt (Green)")

																																																						if v1138 == true then
																																																							v1138 = getAcc("Dojo Belt (Blue)")

																																																							if v1138 == true then
																																																								v1138 = getAcc("Dojo Belt (Purple)")

																																																								if v1138 == false then
																																																									v1138 = getAcc("Dojo Belt (Red)")

																																																									if v1138 == false then
																																																										v1138 = getAcc("Dojo Belt (Black)")

																																																										if v1138 == false then
																																																											_u2:Refresh("Dojo Progress : Get Dojo Belt (Purple)")
																																																											_u3:Refresh("Kill 3 Elite Pirates")
																																																										else
																																																										else
																																																										else
																																																										else
																																																										else
																																																										else
																																																										else
																																																										else
																																																											v1138 = getAcc("Dojo Belt (White)")

																																																											if v1138 == true then
																																																												v1138 = getAcc("Dojo Belt (Yellow)")

																																																												if v1138 == true then
																																																													v1138 = getAcc("Dojo Belt (Orange)")

																																																													if v1138 == true then
																																																														v1138 = getAcc("Dojo Belt (Green)")

																																																														if v1138 == true then
																																																															v1138 = getAcc("Dojo Belt (Blue)")

																																																															if v1138 == true then
																																																																v1138 = getAcc("Dojo Belt (Purple)")

																																																																if v1138 == true then
																																																																	v1138 = getAcc("Dojo Belt (Red)")

																																																																	if v1138 == false then
																																																																		v1138 = getAcc("Dojo Belt (Black)")

																																																																		if v1138 == false then
																																																																			_u2:Refresh("Dojo Progress : Get Dojo Belt (Red)")
																																																																			_u3:Refresh("Defeat a Terrorshark or Rumbling Waters Sea Event.")
																																																																		else
																																																																		else
																																																																		else
																																																																		else
																																																																		else
																																																																		else
																																																																		else
																																																																		else
																																																																			v1138 = getAcc("Dojo Belt (White)")

																																																																			if v1138 == true then
																																																																				v1138 = getAcc("Dojo Belt (Yellow)")

																																																																				if v1138 == true then
																																																																					v1138 = getAcc("Dojo Belt (Orange)")

																																																																					if v1138 == true then
																																																																						v1138 = getAcc("Dojo Belt (Green)")

																																																																						if v1138 == true then
																																																																							v1138 = getAcc("Dojo Belt (Blue)")

																																																																							if v1138 == true then
																																																																								v1138 = getAcc("Dojo Belt (Purple)")

																																																																								if v1138 == true then
																																																																									v1138 = getAcc("Dojo Belt (Red)")

																																																																									if v1138 == true then
																																																																										v1138 = getAcc("Dojo Belt (Black)")

																																																																										if v1138 == false then
																																																																											_u2:Refresh("Dojo Progress : Get Dojo Belt (Black)")
																																																																											_u3:Refresh("Complete Prehistoric Island event \n and collect 3 Dinosaur bones")
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
						end)
						v1116:AddToggle("Claim Dojo Trainer Quest", DojoClaimQuest, function(a)
							DojoClaimQuest = a
							CancelTween(DojoClaimQuest)
						end)
						spawn(function()
							while true do
								local v1140 = task.wait()

								if not v1140 then

									if not DojoClaimQuest then
									end

									pcall(function()
										if not _u0 then
											BTP(_u1)
										else

											if _u0 then
												Tween(_u1)
											end

										end

										if (_u1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
											local v1141 = game:GetService("ReplicatedStorage")
											(v1141.Modules.Net["RF/InteractDragonQuest"]):InvokeServer(v1142)
										end
									end)
								end

							end
						end)
						v1116:AddToggle("Start Dojo Trainer Quest", DojoQuestEnable, function(a)
							DojoQuestEnable = a
							StopBoats(DojoQuestEnable)
							CancelTween(DojoQuestEnable)
						end)
						spawn(function()
							while true do
								local v1143 = task.wait()

								if not v1143 then

									if not DojoQuestEnable then
									end

									pcall(function()
										local v1144 = getAcc("Dojo Belt (White)")

										if v1144 == false then
											v1144 = getAcc("Dojo Belt (Yellow)")

											if v1144 == false then
												v1144 = getAcc("Dojo Belt (Orange)")

												if v1144 == false then
													v1144 = getAcc("Dojo Belt (Green)")

													if v1144 == false then
														v1144 = getAcc("Dojo Belt (Blue)")

														if v1144 == false then
															v1144 = getAcc("Dojo Belt (Purple)")

															if v1144 == false then
																v1144 = getAcc("Dojo Belt (Red)")

																if v1144 == false then
																	v1144 = getAcc("Dojo Belt (Black)")

																	if v1144 == false then
																		CheckLevel()
																		local v1145 = game:GetService("Players")
																		v1144 = string.find(v1145.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon)

																		if not v1144 then
																			v1144 = game:GetService("Players")

																			if v1144.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
																			else
																				v1144 = game:GetService("ReplicatedStorage")
																				v1144.Remotes.CommF_:InvokeServer("AbandonQuest")

																				if not _u0 then
																					BTP(CFrameQ)
																				else

																					if _u0 then
																						Tween(CFrameQ)
																					end

																				end

																				if (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
																					wait(1)
																					v1144 = game:GetService("ReplicatedStorage")
																					v1144.Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
																				end

																			else
																				v1145 = game:GetService("Players")
																				v1144 = string.find(v1145.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon)

																				if v1144 then
																					v1144 = game:GetService("Players")

																					if v1144.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
																					else
																						v1144 = game:GetService("Workspace")
																						v1144 = v1144.Enemies:FindFirstChild(Ms)

																						if not v1144 then
																							v1145 = game:GetService("Workspace")
																							local v1144, v1145, v1146 = _u1(v1145.Enemies:GetChildren())

																							while true do
																								local v1147 = QuestLv:FindFirstChild("Humanoid")

																								if not v1147 then
																									v1147 = QuestLv:FindFirstChild("HumanoidRootPart")

																									if not v1147 then

																										if 0 < QuestLv.Humanoid.Health then

																											if QuestLv.Name == Ms then

																												while true do
																													v1147 = game:GetService("RunService")
																													v1147.Heartbeat:wait()
																													EquipTool(SelectWeapon)
																													Tween(QuestLv.HumanoidRootPart.CFrame * Farm_Mode)
																													QuestLv.HumanoidRootPart.CanCollide = false
																													local v1148 = Vector3.new(60, 60, 60)
																													QuestLv.HumanoidRootPart.Size = v1148
																													QuestLv.HumanoidRootPart.Transparency = 1
																													Dojo_Farm_Name = QuestLv.Name
																													Dojo_Farm_CFrame = QuestLv.HumanoidRootPart.CFrame

																													if not DojoQuestEnable then

																														if not QuestLv.Parent then

																															if QuestLv.Humanoid.Health > 0 then
																																v1147 = game:GetService("Workspace")
																																v1147 = v1147.Enemies:FindFirstChild(QuestLv.Name)

																																if not v1147 then

																																	if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
																																	end

																																end

																															end

																														end

																													end

																												end

																											end

																										end

																									end

																									for v1149, v1150 in v1144, v1145, v1146 do
																									end

																								else
																									Tween(CFrameMon)
																								else
																								else
																								else
																								else
																								else
																								else
																								else
																								else
																									v1144 = getAcc("Dojo Belt (White)")

																									if v1144 == true then
																										v1144 = getAcc("Dojo Belt (Yellow)")

																										if v1144 == true then
																											v1144 = getAcc("Dojo Belt (Orange)")

																											if v1144 == false then
																												v1144 = getAcc("Dojo Belt (Green)")

																												if v1144 == false then
																													v1144 = getAcc("Dojo Belt (Blue)")

																													if v1144 == false then
																														v1144 = getAcc("Dojo Belt (Purple)")

																														if v1144 == false then
																															v1144 = getAcc("Dojo Belt (Red)")

																															if v1144 == false then
																																v1144 = getAcc("Dojo Belt (Black)")

																																if v1144 == false then
																																	Tween(CFrame.new(-12575.7666, 336.955719, -7556.80029, 0.0528766066, -7.96442023e-08, -0.998601079, 2.11768718e-08, 1, -7.86344501e-08, 0.998601079, -1.69893237e-08, 0.0528766066))
																																else
																																else
																																else
																																else
																																else
																																else
																																else
																																else
																																	v1144 = getAcc("Dojo Belt (White)")

																																	if v1144 == true then
																																		v1144 = getAcc("Dojo Belt (Yellow)")

																																		if v1144 == true then
																																			v1144 = getAcc("Dojo Belt (Orange)")

																																			if v1144 == true then
																																				v1144 = getAcc("Dojo Belt (Green)")

																																				if v1144 == true then
																																					v1144 = getAcc("Dojo Belt (Blue)")

																																					if v1144 == true then
																																						v1144 = getAcc("Dojo Belt (Purple)")

																																						if v1144 == false then
																																							v1144 = getAcc("Dojo Belt (Red)")

																																							if v1144 == false then
																																								v1144 = getAcc("Dojo Belt (Black)")

																																								if v1144 == false then
																																									v1144 = game:GetService("Workspace")
																																									v1144 = v1144.Enemies:FindFirstChild("Diablo")

																																									if v1144 then
																																										v1144 = game:GetService("Workspace")
																																										v1144 = v1144.Enemies:FindFirstChild("Deandre")

																																										if v1144 then
																																											v1144 = game:GetService("Workspace")
																																											v1144 = v1144.Enemies:FindFirstChild("Urban")

																																											if not v1144 then
																																											else
																																											else
																																												v1145 = game:GetService("Workspace")
																																												local v1144, v1145, v1146 = _u1(v1145.Enemies:GetChildren())

																																												while true do
																																													v1147 = -7556.80029:FindFirstChild("Humanoid")

																																													if not v1147 then
																																														v1147 = -7556.80029:FindFirstChild("HumanoidRootPart")

																																														if not v1147 then

																																															if 0 < -7556.80029.Humanoid.Health then

																																																if -7556.80029.Name ~= "Diablo" then

																																																	if -7556.80029.Name ~= "Deandre" then

																																																		if -7556.80029.Name == "Urban" then
																																																		else
																																																		else

																																																			while true do
																																																				v1147 = game:GetService("RunService")
																																																				v1147.Heartbeat:wait()
																																																				EquipTool(SelectWeapon)
																																																				Tween(-7556.80029.HumanoidRootPart.CFrame * Farm_Mode)
																																																				-7556.80029.HumanoidRootPart.CanCollide = false
																																																				v1148 = Vector3.new(60, 60, 60)
																																																				-7556.80029.HumanoidRootPart.Size = v1148
																																																				-7556.80029.HumanoidRootPart.Transparency = 1

																																																				if DojoQuestEnable ~= false then

																																																					if -7556.80029.Humanoid.Health > 0 then

																																																						if -7556.80029.Parent then
																																																						end

																																																					end

																																																				end

																																																			end

																																																		end

																																																	end

																																																end

																																															end

																																														end

																																														for v1149, v1150 in v1144, v1145, v1146 do
																																														end

																																													end

																																												end

																																											else
																																												v1144 = game:GetService("ReplicatedStorage")
																																												v1144 = v1144:FindFirstChild("Diablo")

																																												if not v1144 then

																																													if not _u0 then
																																														v1145 = game:GetService("ReplicatedStorage")
																																														v1145 = v1145:FindFirstChild("Diablo")
																																														BTP(v1145.HumanoidRootPart.CFrame)
																																													else
																																														v1145 = game:GetService("ReplicatedStorage")
																																														v1145 = v1145:FindFirstChild("Diablo")
																																														Tween(v1145.HumanoidRootPart.CFrame)
																																													else
																																														v1144 = game:GetService("ReplicatedStorage")
																																														v1144 = v1144:FindFirstChild("Deandre")

																																														if not v1144 then

																																															if not _u0 then
																																																v1145 = game:GetService("ReplicatedStorage")
																																																v1145 = v1145:FindFirstChild("Deandre")
																																																BTP(v1145.HumanoidRootPart.CFrame)
																																															else
																																																v1145 = game:GetService("ReplicatedStorage")
																																																v1145 = v1145:FindFirstChild("Deandre")
																																																Tween(v1145.HumanoidRootPart.CFrame)
																																															else
																																																v1144 = game:GetService("ReplicatedStorage")
																																																v1144 = v1144:FindFirstChild("Urban")

																																																if not v1144 then

																																																	if not _u0 then
																																																		v1145 = game:GetService("ReplicatedStorage")
																																																		v1145 = v1145:FindFirstChild("Urban")
																																																		BTP(v1145.HumanoidRootPart.CFrame)
																																																	else
																																																		v1145 = game:GetService("ReplicatedStorage")
																																																		v1145 = v1145:FindFirstChild("Urban")
																																																		Tween(v1145.HumanoidRootPart.CFrame)
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
						end)
						v1116:AddToggle("Auto Kill Ghost/Hydra/Venomous", BlazeEmberFarm, function(a)
							BlazeEmberFarm = a
							CancelTween(BlazeEmberFarm)
						end)
						spawn(function()
							while true do
								local v1151 = task.wait()

								if not v1151 then

									if not BlazeEmberFarm then
									end

									pcall(function()
										local v1152 = game:GetService("Workspace")
										v1152 = v1152.Enemies:FindFirstChild("Ghost")

										if v1152 then
											v1152 = game:GetService("Workspace")
											v1152 = v1152.Enemies:FindFirstChild("Hydra Enforcer")

											if v1152 then
												v1152 = game:GetService("Workspace")
												v1152 = v1152.Enemies:FindFirstChild("Venomous Assailant")

												if not v1152 then
												else
												else
													local v1153 = game:GetService("Workspace")
													local v1152, v1153, v1154 = _u0(v1153.Enemies:GetChildren())

													while true do

														if v1155.Name ~= "Ghost" then

															if v1155.Name ~= "Hydra Enforcer" then

																if v1155.Name == "Venomous Assailant" then
																else
																else
																	local v1156 = v1155:FindFirstChild("Humanoid")

																	if not v1156 then
																		v1156 = v1155:FindFirstChild("HumanoidRootPart")

																		if not v1156 then

																			if 0 < v1155.Humanoid.Health then

																				while true do
																					v1156 = game:GetService("RunService")
																					v1156.Heartbeat:wait()
																					EquipTool(SelectWeapon)
																					Tween(v1155.HumanoidRootPart.CFrame * Farm_Mode)
																					v1155.HumanoidRootPart.CanCollide = false
																					local v1157 = Vector3.new(60, 60, 60)
																					v1155.HumanoidRootPart.Size = v1157
																					v1155.HumanoidRootPart.Transparency = 1
																					BlazeEmber_Farm_Name = v1155.Name
																					BlazeEmber_Farm_CFrame = v1155.HumanoidRootPart.CFrame

																					if not BlazeEmberFarm then

																						if not v1155.Parent then

																							if v1155.Humanoid.Health > 0 then
																								v1156 = game:GetService("Workspace")
																								v1156 = v1156.Enemies:FindFirstChild(v1155.Name)

																								if v1156 then
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

															for v1158, v1155 in v1152, v1153, v1154 do
															end

														end

													end

												else
													Tween(CFrame.new(5394.36475, 1082.71057, 561.993958, -0.62453711, 3.17826405e-08, -0.780995131, 6.77530991e-08, 1, -1.34849545e-08, 0.780995131, -6.13366922e-08, -0.62453711))
												end
									end)
								end

							end
						end)
						v1116:AddToggle("Auto Collect Blaze Ember", ColectBlazeEmber, function(a) ColectBlazeEmber = a end)
						spawn(function()
							while true do
								local v1159 = task.wait()

								if not v1159 then

									if not ColectBlazeEmber then
									end

									pcall(function()
										local v1160 = game:GetService("Workspace")
										local v1161, v1160, v1162 = _u0(v1160:GetChildren())

										while true do

											if v1163.Name == "EmberTemplate" then
												v1163.Part.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
											end

											for v1164, v1163 in v1161, v1160, v1162 do
											end
									end)
								end

							end
						end)
						v1116:Button("Teleport to Dragon Hunter", function()
							Tween(CFrame.new(5865.80811, 1209.50269, 811.746582, -0.675207436, -6.76664627e-08, 0.737627923, 8.33632186e-09, 1, 9.93661047e-08, -0.737627923, 7.32418357e-08, -0.675207436))
						end)
						v1116:Button("Teleport to Dragon Wizard", function()
							Tween(CFrame.new(5775.35059, 1209.50269, 805.679993, -0.696588516, -7.57756808e-08, 0.717470825, -7.6549334e-08, 1, 3.12936663e-08, -0.717470825, -3.31231078e-08, -0.696588516))
						end)
						local v1167 = v62:AddSection("", "Races", "auto compplte race quest/teleport", "rbxassetid://14477517268")
						_G["SelectIslandRace"] = nil
						v1167:AddDropdown("Select Place", v1168, "", function(a) _G.SelectIslandRace = a end)
						v1167:Button("Teleport", function()
							local v1169 = CFrame.new(2947.56, 2281.63, -7213.55)
							v1169 = CFrame.new(28286.36, 14895.3, 102.62)
							v1169 = CFrame.new(28575.18, 14936.63, 72.32)
							v1169 = CFrame.new(28981.55, 14888.43, -120.25)
							v1169 = CFrame.new(28492.41, 14894.43, -422.11)
							v1169 = CFrame.new(28224.06, 14889.43, -210.59)
							v1169 = CFrame.new(28672.72, 14889.13, 454.6)
							v1169 = CFrame.new(29237.29, 14889.43, -206.95)
							v1169 = CFrame.new(29020.66, 14889.43, -379.27)
							v1169 = CFrame.new(28967.41, 14918.08, 234.31)

							if not _G.SelectIslandRace then
								Tween(v1170[_G.SelectIslandRace])
							else
								print("Please select a place to teleport.")
							end
						end)
						v1167:AddToggle("Clock Access", false, function()
							local v1171 = game:GetService("Workspace")
							((v1171.Map["Temple of Time"]).DoNotEnter):Remove()
							((v1171.Map["Temple of Time"]).ClockRoomExit):Remove()
						end)
						v1167:AddToggle("Auto Buy Gear", false, function(a)
							_G.Auto_Farm_Bone4 = a
							print(a)
						end)
						v1167:AddToggle("Auto Look Moon", false, function(a)
							_G.AutoDooHee = a
							print(a)
						end)
						v1167:AddToggle("Auto Active Race v3", false, function(a)
							_G.AutoAgility = a
							print(a)
						end)
						v1167:AddToggle("Auto Ancient One Quest", false, function(a)
							_G.AutoRace = a
							StardFarm = a
							CancelTween(_G.AutoRace)
							print(a)
						end)
						v1167:AddToggle("Auto Kill Player", false, function(a)
							_G.AutoKillTial = a
							CancelTween(_G.AutoKillTial)
							print(a)
						end)

						local function v1172()
							if not StardFarm then

								if not World3 then
									local v1173 = game:GetService("Workspace")
									local v1174, v1173, v1175 = _u0(v1173.Enemies:GetChildren())

									while true do

										if v1176.Name ~= "Cocoa Warrior" then

											if v1176.Name ~= "Chocolate Bar Battler" then

												if v1176.Name ~= "Sweet Thief" then

													if v1176.Name == "Candy Rebel" then
													else
													else
													else
														local v1177 = v1176:FindFirstChild("Humanoid")

														if not v1177 then
															v1177 = v1176:FindFirstChild("HumanoidRootPart")

															if not v1177 then

																if 0 < v1176.Humanoid.Health then

																	while true do
																		task.wait()
																		AutoHaki()
																		EquipTool(SelectWeaponFarm)
																		v1176.HumanoidRootPart.CanCollide = false
																		v1176.Humanoid.WalkSpeed = 0
																		v1176.Head.CanCollide = false
																		StartBring = true
																		PosMon = v1176.HumanoidRootPart.CFrame
																		MonFarm = v1176.Name
																		Tween(v1176.HumanoidRootPart.CFrame * Farm_Mode)
																		AutoClick()

																		if not StardFarm then

																			if not v1176.Parent then

																				if v1176.Humanoid.Health <= 0 then
																				end

																			end

																		end

																		StartBring = false
																	end

																end

															end

														end

													end

												end

											end

											for v1178, v1176 in v1174, v1173, v1175 do
											end

										end

									end
						end

						spawn(function()
							while true do
								local v1179 = wait()

								if not v1179 then

									if not _G.AutoRace then
									end

									if not game.Players.LocalPlayer.Character.RaceTransformed.Value then
										StardFarm = false
										Tween(CFrame.new(216.21, 126.94, -12599.07))
									end

								end

								StardFarm = true
							end

						end
						end)
						spawn(function()
							while true do
								local v1181 = wait()

								if not v1181 then

									if not _G.AutoQuestRace then
									end

									v1181 = game:GetService("Players")

									if v1181.LocalPlayer.Data.Race.Value == "Human" then
										local v1183, v1182, v1184 = _u0(game.Workspace.Enemies:GetDescendants())

										while true do
											local v1186 = v1185:FindFirstChild("Humanoid")

											if not v1186 then
												v1186 = v1185:FindFirstChild("HumanoidRootPart")

												if not v1186 then

													if 0 < v1185.Humanoid.Health then

														while true do
															wait(0.1)
															v1185.Humanoid.Health = 0
															v1185.HumanoidRootPart.CanCollide = false

															if not _G.AutoQuestRace then

																if not v1185.Parent then

																	if v1185.Humanoid.Health <= 0 then
																	end

																end

															end

														end

													end

												end

												for v1187, v1185 in v1183, v1182, v1184 do
												end

											end

										end

										if v1181.LocalPlayer.Data.Race.Value ~= "Skypiea" then
										end

										if v1181.LocalPlayer.Data.Race.Value ~= "Fishman" then
										end

										if v1181.LocalPlayer.Data.Race.Value == "Cyborg" then
											Tween(CFrame.new(28654, 14898.78, -30))
										end

									end

									if v1181.LocalPlayer.Data.Race.Value == "Ghoul" then
									end

								end

								if v1181.LocalPlayer.Data.Race.Value == "Mink" then
								end

							end

						end
						end)
						v1167:Button("Complete Angel Trial", function() Tween(game.Workspace.Map.SkyTrial.Model.FinishPart.CFrame) end)
						v1167:Button("Complete Rabit Trial", function()
							local v1188 = game:GetService("Workspace")
							local v1189 = CFrame.new(0, -5, 0)
							Tween(v1188.Map.MinkTrial.Ceiling.CFrame * v1189)
						end)
						v1167:Button("Complete Cyborg Trial", function() Tween(CFrame.new(0, 300, 0)) end)
						spawn(function()
							while true do
								local v1191 = wait()

								if not v1191 then

									if not _G.AutoKillTial then
									end

									local v1192 = game:GetService("Players")
									local v1191, v1192, v1193 = _u0(v1192:GetChildren())

									while true do

										if v1194.Name ~= game.Players.LocalPlayer.Name then

											if (v1194.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then

												if 0 < v1194.Character.Humanoid.Health then

													while true do
														wait()
														EquipTool(SelectWeaponFarm)
														Tween(v1194.HumanoidRootPart.CFrame * Farm_Mode)
														v1194.HumanoidRootPart.CanCollide = false
														local v1195 = Vector3.new(60, 60, 60)
														v1194.HumanoidRootPart.Size = v1195
														v1194.HumanoidRootPart.Transparency = 1
														v1194.Humanoid:ChangeState(11)
														v1194.Humanoid:ChangeState(14)

														if not _G.AutoKillTial then

															if not v1194.Parent then

																if v1194.Humanoid.Health <= 0 then
																end

															end

														end

													end

												end

											end

											for v1196, v1194 in v1191, v1192, v1193 do
											end

										end

									end
						end)
						spawn(function()
							while true do
								local v1197 = wait()

								if not v1197 then

									if not UseskillKill then
									end

									local v1197, v1198, v1199 = _u0({ "Z", "X", "C", "V" })

									while true do
										local v1200 = game:GetService("VirtualInputManager")
										v1200:SendKeyEvent(true, "C", false, game)
										wait(0.1)
										v1200 = game:GetService("VirtualInputManager")
										v1200:SendKeyEvent(false, "C", false, game)

										for v1201, v1202 in v1197, v1198, v1199 do
										end

									end

								end
						end)
						local v1203 = v63:AddSection("", "Dungeon Raid", "auto raid, auto awake, auto buy chip", "rbxassetid://10734932295")
						v1203:AddDropdown("Select Chips", v1204, "", function(a) SelectChip = a end)
						v1203:AddToggle("Auto Buy Microchips", AutoBuySpecialChip, function(a) AutoBuySpecialChip = a end)
						spawn(function()
							while true do
								local v1205 = task.wait()

								if not v1205 then

									if not AutoBuySpecialChip then
									end

									v1205 = game:GetService("Players")
									v1205 = v1205.LocalPlayer.Character:FindFirstChild("Microchip")

									if not v1205 then
										v1205 = game:GetService("Players")
										v1205 = v1205.LocalPlayer.Backpack:FindFirstChild("Microchip")

										if not v1205 then
											v1205 = game:GetService("Players")
											v1205 = v1205.LocalPlayer.Character:FindFirstChild("Special Microchip")

											if not v1205 then
												v1205 = game:GetService("Players")
												v1205 = v1205.LocalPlayer.Backpack:FindFirstChild("Special Microchip")

												if v1205 then
												end

											end

										end

									end

									v1205 = game:GetService("ReplicatedStorage")
									v1205.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", SelectChip)
								end

							end
						end)
						v1203:AddToggle("Auto Start Raids", AutoSTartRaids, function(a) AutoSTartRaids = a end)
						spawn(function()
							while true do
								local v1206 = task.wait()

								if not v1206 then

									if not AutoSTartRaids then
									end

									v1206 = game:GetService("Players")
									v1206 = v1206.LocalPlayer.Character:FindFirstChild("Microchip")

									if v1206 then
										v1206 = game:GetService("Players")
										v1206 = v1206.LocalPlayer.Backpack:FindFirstChild("Microchip")

										if v1206 then
											v1206 = game:GetService("Players")
											v1206 = v1206.LocalPlayer.Character:FindFirstChild("Special Microchip")

											if v1206 then
												v1206 = game:GetService("Players")
												v1206 = v1206.LocalPlayer.Backpack:FindFirstChild("Special Microchip")

												if not v1206 then
												end

											end

										end

									end

									if not Second_Sea then
										fireclickdetector(game.Workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
									end

								end

								if not Third_Sea then
								end

								v1206 = game:GetService("Players")
								local v1207 = CFrame.new(-5057.146484375, 314.54132080078, -2934.7995605469)

								if 10 < (v1207.Position - v1206.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
									Tween(v1207)
								end

							end

							if (v1207.Position - v1206.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
							end

							wait(1)
							fireclickdetector(((((game.Workspace.Map["Boat Castle"]).RaidSummon2).Button).Main).ClickDetector)
						end

					end
						end)
						v1203:AddToggle("Kill Raid Aura", RaidAura, function(a) RaidAura = a end)
						spawn(function()
							local v1208 = game:GetService("RunService")
							v1208.Heartbeat:Connect(function()
								if not RaidAura then
									local v1209 = game:GetService("ReplicatedStorage")
									local v1210 = game:GetService("ReplicatedStorage")
									local v1211 = game:GetService("Players")

									if v1211.LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible == true then
										pcall(function()
											local v1213, v1212, v1214 = _u0(game.Workspace.Enemies:GetDescendants())

											while true do
												local v1216 = v1215:FindFirstChild("Humanoid")

												if not v1216 then
													v1216 = v1215:FindFirstChild("HumanoidRootPart")

													if not v1216 then

														if 0 < v1215.Humanoid.Health then

															if not v1215.Name then

																while true do
																	v1216 = game:GetService("RunService")
																	v1216.Heartbeat:wait()
																	EquipTool(SelectWeaponRaid)
																	v1215.Humanoid.Health = 0
																	v1215.HumanoidRootPart.CanCollide = false
																	local v1217 = game:GetService("Players")
																	sethiddenproperty(v1217.LocalPlayer, "SimulationRadius", math.huge)

																	if not RaidAura then

																		if not v1215.Parent then
																			v1216 = game.Workspace.Enemies:FindFirstChild(v1215.Name)

																			if v1216 then
																			end

																		end

																	end

																end

															end

														end

													end

													for v1218, v1215 in v1213, v1212, v1214 do
													end
										end)
									end

								end
							end)
						end)
						v1203:AddToggle("Auto Next Island", AutoNextIsland, function(a)
							AutoNextIsland = a
							CancelTween(AutoNextIsland)
						end)
						spawn(function()
							while true do
								local v1219 = wait()

								if not v1219 then

									if not AutoNextIsland then
									end

									v1219 = game:GetService("Players")

									if v1219.LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible == true then
									end

									v1219 = game:GetService("Workspace")
									v1219 = v1219._WorldOrigin.Locations:FindFirstChild("Island 5")

									if not v1219 then
										v1219 = game:GetService("Workspace")
										v1219 = v1219._WorldOrigin.Locations:FindFirstChild("Island 5")
										local v1220 = game:GetService("Players")

										if (v1219.CFrame.Position - v1220.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
										end

										v1220 = game:GetService("Workspace")
										v1220 = v1220._WorldOrigin.Locations:FindFirstChild("Island 5")
										local v1221 = CFrame.new(0, DisRaid, 0)
										Tween(v1220.CFrame * v1221)
									end

								end

								v1219 = game:GetService("Workspace")
								v1219 = v1219._WorldOrigin.Locations:FindFirstChild("Island 4")

								if not v1219 then
									v1219 = game:GetService("Workspace")
									v1219 = v1219._WorldOrigin.Locations:FindFirstChild("Island 4")
									v1220 = game:GetService("Players")

									if (v1219.CFrame.Position - v1220.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
									end

									v1220 = game:GetService("Workspace")
									v1220 = v1220._WorldOrigin.Locations:FindFirstChild("Island 4")
									v1221 = CFrame.new(0, DisRaid, 0)
									Tween(v1220.CFrame * v1221)
								end

							end

							v1219 = game:GetService("Workspace")
							v1219 = v1219._WorldOrigin.Locations:FindFirstChild("Island 3")

							if not v1219 then
								v1219 = game:GetService("Workspace")
								v1219 = v1219._WorldOrigin.Locations:FindFirstChild("Island 3")
								v1220 = game:GetService("Players")

								if (v1219.CFrame.Position - v1220.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
								end

								v1220 = game:GetService("Workspace")
								v1220 = v1220._WorldOrigin.Locations:FindFirstChild("Island 3")
								v1221 = CFrame.new(0, DisRaid, 0)
								Tween(v1220.CFrame * v1221)
							end

						end

						v1219 = game:GetService("Workspace")
						v1219 = v1219._WorldOrigin.Locations:FindFirstChild("Island 2")

						if not v1219 then
							v1219 = game:GetService("Workspace")
							v1219 = v1219._WorldOrigin.Locations:FindFirstChild("Island 2")
							v1220 = game:GetService("Players")

							if (v1219.CFrame.Position - v1220.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
							end

							v1220 = game:GetService("Workspace")
							v1220 = v1220._WorldOrigin.Locations:FindFirstChild("Island 2")
							v1221 = CFrame.new(0, DisRaid, 0)
							Tween(v1220.CFrame * v1221)
						end

					end

					v1219 = game:GetService("Workspace")
					v1219 = v1219._WorldOrigin.Locations:FindFirstChild("Island 1")

					if not v1219 then
					end

					v1219 = game:GetService("Workspace")
					v1219 = v1219._WorldOrigin.Locations:FindFirstChild("Island 1")
					v1220 = game:GetService("Players")

					if (v1219.CFrame.Position - v1220.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
					end

					v1220 = game:GetService("Workspace")
					v1220 = v1220._WorldOrigin.Locations:FindFirstChild("Island 1")
					v1221 = CFrame.new(0, DisRaid, 0)
					Tween(v1220.CFrame * v1221)
				end

			end
						end)
						v1203:AddToggle("Auto Awaken", AutoAwakenAbilities, function(a) AutoAwakenAbilities = a end)
						spawn(function()
							while true do
								local v1222 = wait()

								if not v1222 then

									if not AutoAwakenAbilities then
									end

									local v1223 = game:GetService("ReplicatedStorage")
									v1223.Remotes.CommF_:InvokeServer(v1223.Remotes.CommF_)
									local v1224 = game:GetService("ReplicatedStorage")
									v1224.Remotes.CommF_:InvokeServer(v1224.Remotes.CommF_)
								end

							end
						end)
						v1203:Button("Teleport to Raid Lab", function()
							if not Second_Sea then
								Tween(CFrame.new(-6449.68896, 249.56958, -4497.59326, 0.69785428, 5.60444446e-09, -0.71623975, -2.18662333e-09, 1, 5.69432235e-09, 0.71623975, -2.40766074e-09, 0.69785428))
							else

								if not Third_Sea then
									Tween(CFrame.new(-5057.146484375, 314.54132080078, -2934.7995605469))
								end

							end
						end)
						v1203["Slider"]("Set low price Fruit", 0, 1000000, 5000, function(a) _G.UnstoreFruitPrice = a end)
						v1203:AddToggle("Auto Unstore Fruit", false, function(a) _G.UnstoreBadFruit = a end)

						function HasFruits()
							local function v1227(a)
								local v1229, v1228, v1230 = _u0(a:GetChildren())

								while true do
									local v1232 = string.find(v1231.Name, "Fruit")

									if not v1232 then
										do return true end
									end

									for v1233, v1231 in v1229, v1228, v1230 do
									end

									return false
							end

							local v1234 = game:GetService("Players")
							local v1235 = v1227(v1234.LocalPlayer.Backpack)

							if v1235 then
								v1235 = v1227(v1234.LocalPlayer.Character)
							end

							return v1235
						end

						spawn(function()
							while true do
								local v1236 = wait()

								if not v1236 then
									pcall(function()
										local v1237 = getgenv()

										if not v1237.UnstoreBadFruit then
											v1237 = game:GetService("ReplicatedStorage")
											v1237 = v1237.Remotes.CommF_:InvokeServer("getInventoryFruits")
											local v1238, v1239, v1240 = _u0(v1237)

											while true do
												local v1242 = getgenv()

												if v1241.Price < v1242.UnstoreFruitPrice then
													local v1243 = HasFruits()

													if v1243 then
														v1243 = game:GetService("ReplicatedStorage")
														v1243.Remotes.CommF_:InvokeServer("LoadFruit", v1241.Name)
													end

												end

												for v1244, v1241 in v1238, v1239, v1240 do
												end

											end
									end)
								end

							end
						end)
						local v1245 = v63:AddSection("", "Law Raid", "auto law Raid,auto buy chip", "rbxassetid://10709753149")
						local v1247, v1246, v1248 = pairs(v32.LocalPlayer["Backpack"]["GetChildren"]())

						while true do
							local v1249 = (function(a) _G.UnstoreFruitPrice = a end)["IsA"]("Tool")

							if not v1249 then
								table["insert"](v1250, (function(a) _G.UnstoreFruitPrice = a end).Name)
							end

							for v1251, v1252 in v1247, v1246, v1248 do
							end

							v1247 = v1245:AddDropdown("Select Weapon Law", v1250, "", function(a) Select_Weapon_Law_Raid = a end)
							v1245:Button("Refresh Weapon Law", function()
								local v1254, v1253, v1255 = _u0(_u1.Backpack:GetChildren())

								while true do
									local v1257 = v1256:IsA("Tool")

									if not v1257 then
										table.insert(v1256.Name)
									end

									for v1258, v1256 in v1254, v1253, v1255 do
									end

									Select_Weapon_Law_Raid:Clear()
									local v1254, v1253, v1255 = _u0(_u1.Backpack:GetChildren())

									while true do
										v1257 = v1256:IsA("Tool")

										if not v1257 then
											Select_Weapon_Law_Raid:Add(v1259, v1256.Name)
										end

										for v1258, v1256 in v1254, v1253, v1255 do
										end
							end)
							v1245:AddToggle("Buy Law Chips", Auto_Buy_Law_Chip, function(a) Auto_Buy_Law_Chip = a end)
							spawn(function()
								while true do
									local v1260 = task.wait()

									if not v1260 then

										if not Auto_Buy_Law_Chip then
										end

										v1260 = _u0.Backpack:FindFirstChild("Microchip")

										if v1260 then
										end

										v1260 = _u1()
										v1260 = v1260:FindFirstChild("Microchip")

										if v1260 then
										end

										v1260 = game:GetService("Workspace")
										v1260 = v1260.Enemies:FindFirstChild("Order")

										if v1260 then
										end

										v1260 = _u2:FindFirstChild("Order")

										if not v1260 then
										end

									end

									_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
								end

							end
							end)
							v1245:AddToggle("Start Law Raid", Auto_Start_Law_Dungeon, function(a) Auto_Start_Law_Dungeon = a end)
							spawn(function()
								while true do
									local v1262 = task.wait()

									if not v1262 then

										if not Auto_Start_Law_Dungeon then
										end

										pcall(function()
											local v1263 = _u0()
											v1263 = v1263:FindFirstChild("Microchip")

											if v1263 then
												v1263 = _u1.Backpack:FindFirstChild("Microchip")

												if not v1263 then
												else
													local v1264 = game:GetService("Workspace")
													fireclickdetector(v1264.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
												end

											end
										end)
									end

								end
							end)
							v1245:AddToggle("Auto Kill Law Raid", BossRaid, function(a)
								BossRaid = a
								CancelTween(BossRaid)
							end)
							spawn(function()
								while true do
									local v1265 = task.wait()

									if not v1265 then

										if not BossRaid then
										end

										pcall(function()
											local v1267, v1266, v1268 = _u0(game.Workspace.Enemies:GetChildren())

											while true do

												if v1269.Name == "Order" then
													local v1270 = v1269:FindFirstChild("HumanoidRootPart")

													if not v1270 then
														v1270 = v1269:FindFirstChild("Humanoid")

														if not v1270 then

															if 0 < v1269.Humanoid.Health then

																while true do
																	task.wait()
																	EquipTool(Select_Weapon_Law_Raid)
																	v1269.HumanoidRootPart.CanCollide = false
																	local v1271 = Vector3.new(50, 50, 50)
																	v1269.HumanoidRootPart.Size = v1271
																	local v1272 = CFrame.new(0, 30, 0)
																	Tween(v1269.HumanoidRootPart.CFrame * v1272)
																	_u1:CaptureController()
																	_u1:Button1Down(_u1)

																	if not BossRaid then

																		if v1269.Humanoid.Health > 0 then

																			if v1269.Parent then
																			end

																		end

																	end

																end

															end

														end

													end

													for v1273, v1269 in v1267, v1266, v1268 do
													end

													local v1267, v1266, v1268 = _u0(_u2:GetChildren())

													while true do

														if v1269.Name == "Order" then
															v1272 = CFrame.new(0, 30, 0)
															Tween(v1269.HumanoidRootPart.CFrame * v1272)
														end

														for v1273, v1269 in v1267, v1266, v1268 do
														end
										end)
									end

								end
							end)
							v1246 = v64:AddSection("", "Island Travel", "travel any islands on every sea", "rbxassetid://6034407069")
							v1246:Button("Travel to First Sea", function() _u0.Remotes.CommF_:InvokeServer("TravelMain") end)
							v1246:Button("Travel to Second Sea", function() _u0.Remotes.CommF_:InvokeServer("TravelDressrosa") end)
							v1246:Button("Travel to Third Sea", function() _u0.Remotes.CommF_:InvokeServer("TravelZou") end)

							if not First_Sea then
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
									"Sea Beast",
								}
							else

								if not Second_Sea then
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
										"Sea Beast",
									}
								else

									if not Third_Sea then
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
											"Sea Beast",
										}
									end

								end

							end

							v1246:AddDropdown("Select Island", IslandCheck, "", function(a) SelectedIsland = a end)
							v1246:Button("Teleport to Island", function()
								if SelectedIsland == "Start Island" then

									if not BypassTeleport then
										BTP(CFrame.new(1071.2832, 16.3085976, 1426.86792))
									else
										Tween(CFrame.new(1071.2832, 16.3085976, 1426.86792))
									else

										if SelectedIsland == "Marine Start" then

											if not BypassTeleport then
												BTP(CFrame.new(-2573.3374, 6.88881969, 2046.99817))
											else
												Tween(CFrame.new(-2573.3374, 6.88881969, 2046.99817))
											else

												if SelectedIsland == "Middle Town" then

													if not BypassTeleport then
														BTP(CFrame.new(-655.824158, 7.88708115, 1436.67908))
													else
														Tween(CFrame.new(-655.824158, 7.88708115, 1436.67908))
													else

														if SelectedIsland == "Jungle" then

															if not BypassTeleport then
																BTP(CFrame.new(-1249.77222, 11.8870859, 341.356476))
															else
																Tween(CFrame.new(-1249.77222, 11.8870859, 341.356476))
															else

																if SelectedIsland == "Pirate Village" then

																	if not BypassTeleport then
																		BTP(CFrame.new(-1122.34998, 4.78708982, 3855.91992))
																	else
																		Tween(CFrame.new(-1122.34998, 4.78708982, 3855.91992))
																	else

																		if SelectedIsland == "Desert" then

																			if not BypassTeleport then
																				BTP(CFrame.new(1094.14587, 6.47350502, 4192.88721))
																			else
																				Tween(CFrame.new(1094.14587, 6.47350502, 4192.88721))
																			else

																				if SelectedIsland == "Frozen Village" then

																					if not BypassTeleport then
																						BTP(CFrame.new(1198.00928, 27.0074959, -1211.73376))
																					else
																						Tween(CFrame.new(1198.00928, 27.0074959, -1211.73376))
																					else

																						if SelectedIsland == "Marine Ford" then

																							if not BypassTeleport then
																								BTP(CFrame.new(-4505.375, 20.687294, 4260.55908))
																							else
																								Tween(CFrame.new(-4505.375, 20.687294, 4260.55908))
																							else

																								if SelectedIsland == "Colosseum 1" then

																									if not BypassTeleport then
																										BTP(CFrame.new(-1428.35474, 7.38933945, -3014.37305))
																									else
																										Tween(CFrame.new(-1428.35474, 7.38933945, -3014.37305))
																									else

																										if SelectedIsland == "Sky island 1" then

																											if not BypassTeleport then
																												BTP(CFrame.new(-4970.21875, 717.707275, -2622.35449))
																											else
																												Tween(CFrame.new(-4970.21875, 717.707275, -2622.35449))
																											else

																												if SelectedIsland == "Sky island 2" then

																													if not BypassTeleport then
																														BTP(CFrame.new(-4813.0249, 903.708557, -1912.69055))
																													else
																														Tween(CFrame.new(-4813.0249, 903.708557, -1912.69055))
																													else

																														if SelectedIsland == "Sky island 3" then

																															if not BypassTeleport then
																																BTP(CFrame.new(-7952.31006, 5545.52832, -320.704956))
																															else
																																Tween(CFrame.new(-7952.31006, 5545.52832, -320.704956))
																															else

																																if SelectedIsland == "Sky island 4" then

																																	if not BypassTeleport then
																																		BTP(CFrame.new(-7793.43896, 5607.22168, -2016.58362))
																																	else
																																		Tween(CFrame.new(-7793.43896, 5607.22168, -2016.58362))
																																	else

																																		if SelectedIsland == "Prison" then

																																			if not BypassTeleport then
																																				BTP(CFrame.new(4854.16455, 5.68742752, 740.194641))
																																			else
																																				Tween(CFrame.new(4854.16455, 5.68742752, 740.194641))
																																			else

																																				if SelectedIsland == "Magma Village" then

																																					if not BypassTeleport then
																																						BTP(CFrame.new(-5231.75879, 8.61593437, 8467.87695))
																																					else
																																						Tween(CFrame.new(-5231.75879, 8.61593437, 8467.87695))
																																					else

																																						if SelectedIsland == "UndeyWater City" then

																																							if not BypassTeleport then
																																								BTP(CFrame.new(61163.8516, 11.7796879, 1819.78418))
																																							else
																																								Tween(CFrame.new(61163.8516, 11.7796879, 1819.78418))
																																							else

																																								if SelectedIsland == "Fountain City" then

																																									if not BypassTeleport then
																																										TP2(CFrame.new(5132.7124, 4.53632832, 4037.8562))
																																									else
																																										Tween(CFrame.new(5132.7124, 4.53632832, 4037.8562))
																																									else

																																										if SelectedIsland == "House Cyborgs" then

																																											if not BypassTeleport then
																																												BTP(CFrame.new(6262.72559, 71.3003616, 3998.23047))
																																											else
																																												Tween(CFrame.new(6262.72559, 71.3003616, 3998.23047))
																																											else

																																												if SelectedIsland == "Shanks Room" then

																																													if not BypassTeleport then
																																														BTP(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
																																													else
																																														Tween(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
																																													else

																																														if SelectedIsland == "Mob Island" then

																																															if not BypassTeleport then
																																																BTP(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
																																															else
																																																Tween(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
																																															else

																																																if SelectedIsland == "Dock" then

																																																	if not BypassTeleport then
																																																		BTP(CFrame.new(82.9490662, 18.0710983, 2834.98779))
																																																	else
																																																		Tween(CFrame.new(82.9490662, 18.0710983, 2834.98779))
																																																	else

																																																		if SelectedIsland == "Kingdom of Rose" then

																																																			if not BypassTeleport then
																																																				BTP(CFrame.new(-394.983521, 118.503128, 1245.8446))
																																																			else
																																																				Tween(CFrame.new(-394.983521, 118.503128, 1245.8446))
																																																			else

																																																				if SelectedIsland == "Mansion 1" then

																																																					if not BypassTeleport then
																																																						BTP(CFrame.new(-390.096313, 331.886475, 673.464966))
																																																					else
																																																						Tween(CFrame.new(-390.096313, 331.886475, 673.464966))
																																																					else

																																																						if SelectedIsland == "Flamingo Room" then

																																																							if not BypassTeleport then
																																																								BTP(CFrame.new(2302.19019, 15.1778421, 663.811035))
																																																							else
																																																								Tween(CFrame.new(2302.19019, 15.1778421, 663.811035))
																																																							else

																																																								if SelectedIsland == "Green Zone" then

																																																									if not BypassTeleport then
																																																										BTP(CFrame.new(-2372.14697, 72.9919434, -3166.51416))
																																																									else
																																																										Tween(CFrame.new(-2372.14697, 72.9919434, -3166.51416))
																																																									else

																																																										if SelectedIsland == "Cafe" then

																																																											if not BypassTeleport then
																																																												BTP(CFrame.new(-385.250916, 73.0458984, 297.388397))
																																																											else
																																																												Tween(CFrame.new(-385.250916, 73.0458984, 297.388397))
																																																											else

																																																												if SelectedIsland == "Factory" then

																																																													if not BypassTeleport then
																																																														BTP(CFrame.new(430.42569, 210.019623, -432.504791))
																																																													else
																																																														Tween(CFrame.new(430.42569, 210.019623, -432.504791))
																																																													else

																																																														if SelectedIsland == "Colosseum 2" then

																																																															if not BypassTeleport then
																																																																BTP(CFrame.new(-1836.58191, 44.5890656, 1360.30652))
																																																															else
																																																																Tween(CFrame.new(-1836.58191, 44.5890656, 1360.30652))
																																																															else

																																																																if SelectedIsland == "Grave Island" then

																																																																	if not BypassTeleport then
																																																																		BTP(CFrame.new(-5411.47607, 48.8234024, -721.272522))
																																																																	else
																																																																		Tween(CFrame.new(-5411.47607, 48.8234024, -721.272522))
																																																																	else

																																																																		if SelectedIsland == "Snow Mountain" then

																																																																			if not BypassTeleport then
																																																																				BTP(CFrame.new(511.825226, 401.765198, -5380.396))
																																																																			else
																																																																				Tween(CFrame.new(511.825226, 401.765198, -5380.396))
																																																																			else

																																																																				if SelectedIsland == "Cold Island" then

																																																																					if not BypassTeleport then
																																																																						BTP(CFrame.new(-6026.96484, 14.7461271, -5071.96338))
																																																																					else
																																																																						Tween(CFrame.new(-6026.96484, 14.7461271, -5071.96338))
																																																																					else

																																																																						if SelectedIsland == "Hot Island" then

																																																																							if not BypassTeleport then
																																																																								BTP(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
																																																																							else
																																																																								Tween(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
																																																																							else

																																																																								if SelectedIsland == "Cursed Ship" then

																																																																									if not BypassTeleport then
																																																																										BTP(CFrame.new(902.059143, 124.752518, 33071.8125))
																																																																									else
																																																																										Tween(CFrame.new(902.059143, 124.752518, 33071.8125))
																																																																									else

																																																																										if SelectedIsland == "Ice Castle" then

																																																																											if not BypassTeleport then
																																																																												BTP(CFrame.new(5400.40381, 28.21698, -6236.99219))
																																																																											else
																																																																												Tween(CFrame.new(5400.40381, 28.21698, -6236.99219))
																																																																											else

																																																																												if SelectedIsland == "Forgotten Island" then

																																																																													if not BypassTeleport then
																																																																														BTP(CFrame.new(-3043.31543, 238.881271, -10191.5791))
																																																																													else
																																																																														Tween(CFrame.new(-3043.31543, 238.881271, -10191.5791))
																																																																													else

																																																																														if SelectedIsland == "Usoapp Island" then

																																																																															if not BypassTeleport then
																																																																																BTP(CFrame.new(4748.78857, 8.35370827, 2849.57959))
																																																																															else
																																																																																Tween(CFrame.new(4748.78857, 8.35370827, 2849.57959))
																																																																															else

																																																																																if SelectedIsland == "Minisky Island" then

																																																																																	if not BypassTeleport then
																																																																																		BTP(CFrame.new(-260.358917, 49325.7031, -35259.3008))
																																																																																	else
																																																																																		Tween(CFrame.new(-260.358917, 49325.7031, -35259.3008))
																																																																																	else

																																																																																		if SelectedIsland == "Port Town" then

																																																																																			if not BypassTeleport then
																																																																																				BTP(CFrame.new(-610.309692, 57.8323097, 6436.33594))
																																																																																			else
																																																																																				Tween(CFrame.new(-610.309692, 57.8323097, 6436.33594))
																																																																																			else

																																																																																				if SelectedIsland == "Hydra Island" then

																																																																																					if not BypassTeleport then
																																																																																						BTP(CFrame.new(5404.4541015625, 1003.4010009765625, 506.20697021484375))
																																																																																					else
																																																																																						Tween(CFrame.new(5404.4541015625, 1003.4010009765625, 506.20697021484375))
																																																																																					else

																																																																																						if SelectedIsland == "Great Tree" then

																																																																																							if not BypassTeleport then
																																																																																								BTP(CFrame.new(2174.94873, 28.7312393, -6728.83154))
																																																																																							else
																																																																																								Tween(CFrame.new(2174.94873, 28.7312393, -6728.83154))
																																																																																							else

																																																																																								if SelectedIsland == "Castle on the Sea" then

																																																																																									if not BypassTeleport then
																																																																																										BTP(CFrame.new(-5477.62842, 313.794739, -2808.4585))
																																																																																									else
																																																																																										Tween(CFrame.new(-5477.62842, 313.794739, -2808.4585))
																																																																																									else

																																																																																										if SelectedIsland == "Floating Turtle" then

																																																																																											if not BypassTeleport then
																																																																																												BTP(CFrame.new(-10919.2998, 331.788452, -8637.57227))
																																																																																											else
																																																																																												Tween(CFrame.new(-10919.2998, 331.788452, -8637.57227))
																																																																																											else

																																																																																												if SelectedIsland == "Mansion 2" then

																																																																																													if not BypassTeleport then
																																																																																														BTP(CFrame.new(-12553.8125, 332.403961, -7621.91748))
																																																																																													else
																																																																																														Tween(CFrame.new(-12553.8125, 332.403961, -7621.91748))
																																																																																													else

																																																																																														if SelectedIsland == "Secret Temple" then

																																																																																															if not BypassTeleport then
																																																																																																BTP(CFrame.new(5217.35693, 6.56511116, 1100.88159))
																																																																																															else
																																																																																																Tween(CFrame.new(5217.35693, 6.56511116, 1100.88159))
																																																																																															else

																																																																																																if SelectedIsland == "Friendly Arena" then

																																																																																																	if not BypassTeleport then
																																																																																																		BTP(CFrame.new(5220.28955, 72.8193436, -1450.86304))
																																																																																																	else
																																																																																																		Tween(CFrame.new(5220.28955, 72.8193436, -1450.86304))
																																																																																																	else

																																																																																																		if SelectedIsland == "Beautiful Pirate Domain" then

																																																																																																			if not BypassTeleport then
																																																																																																				BTP(CFrame.new(5310.8095703125, 21.594484329224, 129.39053344727))
																																																																																																			else
																																																																																																				Tween(CFrame.new(5310.8095703125, 21.594484329224, 129.39053344727))
																																																																																																			else

																																																																																																				if SelectedIsland == "Teler Park" then

																																																																																																					if not BypassTeleport then
																																																																																																						BTP(CFrame.new(-9512.3623046875, 142.13258361816, 5548.845703125))
																																																																																																					else
																																																																																																						Tween(CFrame.new(-9512.3623046875, 142.13258361816, 5548.845703125))
																																																																																																					else

																																																																																																						if SelectedIsland == "Peanut Island" then

																																																																																																							if not BypassTeleport then
																																																																																																								BTP(CFrame.new(-2142, 48, -10031))
																																																																																																							else
																																																																																																								Tween(CFrame.new(-2142, 48, -10031))
																																																																																																							else

																																																																																																								if SelectedIsland == "Chocolate Island" then

																																																																																																									if not BypassTeleport then
																																																																																																										BTP(CFrame.new(156.896484, 30.5935211, -12662.7031, -0.573599219, 0, 0.81913656, 0, 1, 0, -0.81913656, 0, -0.573599219))
																																																																																																									else
																																																																																																										Tween(CFrame.new(156.896484, 30.5935211, -12662.7031, -0.573599219, 0, 0.81913656, 0, 1, 0, -0.81913656, 0, -0.573599219))
																																																																																																									else

																																																																																																										if SelectedIsland == "Ice Cream Island" then

																																																																																																											if not BypassTeleport then
																																																																																																												BTP(CFrame.new(-949, 59, -10907))
																																																																																																											else
																																																																																																												Tween(CFrame.new(-949, 59, -10907))
																																																																																																											else

																																																																																																												if SelectedIsland == "Haunted Castle" then

																																																																																																													if not BypassTeleport then
																																																																																																														BTP(CFrame.new(-9530.61035, -132.860657, 5763.13477))
																																																																																																													else
																																																																																																														Tween(CFrame.new(-9530.61035, -132.860657, 5763.13477))
																																																																																																													else

																																																																																																														if SelectedIsland == "Cake Loaf" then

																																																																																																															if not BypassTeleport then
																																																																																																																BTP(CFrame.new(-2099.33154, 66.9970703, -12128.585, 0.997561574, 0, 0.0697919354, 0, 1, 0, -0.0697919354, 0, 0.997561574))
																																																																																																															else
																																																																																																																Tween(CFrame.new(-2099.33154, 66.9970703, -12128.585, 0.997561574, 0, 0.0697919354, 0, 1, 0, -0.0697919354, 0, 0.997561574))
																																																																																																															else

																																																																																																																if SelectedIsland == "Candy Cane" then

																																																																																																																	if not BypassTeleport then
																																																																																																																		BTP(CFrame.new(-1530.97144, 13.728817, -14770.0889, 0.898790359, 0, -0.438378751, 0, 1, 0, 0.438378751, 0, 0.898790359))
																																																																																																																	else
																																																																																																																		Tween(CFrame.new(-1530.97144, 13.728817, -14770.0889, 0.898790359, 0, -0.438378751, 0, 1, 0, 0.438378751, 0, 0.898790359))
																																																																																																																	else

																																																																																																																		if SelectedIsland == "Tiki Outpost" then

																																																																																																																			if not BypassTeleport then
																																																																																																																				BTP(CFrame.new(-16548.8164, 55.6059914, -172.8125, 0.213092566, 0, -0.977032006, 0, 1, 0, 0.977032006, 0, 0.213092566))
																																																																																																																			else
																																																																																																																				Tween(CFrame.new(-16548.8164, 55.6059914, -172.8125, 0.213092566, 0, -0.977032006, 0, 1, 0, 0.977032006, 0, 0.213092566))
																																																																																																																			else

																																																																																																																				if SelectedIsland == "Raid Lab" then

																																																																																																																					if not BypassTeleport then
																																																																																																																						BTP(CFrame.new(-5057.146484375, 314.54132080078, -2934.7995605469))
																																																																																																																					else
																																																																																																																						Tween(CFrame.new(-5057.146484375, 314.54132080078, -2934.7995605469))
																																																																																																																					else

																																																																																																																						if SelectedIsland == "Mini Sky" then

																																																																																																																							if not BypassTeleport then
																																																																																																																								BTP(CFrame.new(-263.66668701172, 49325.49609375, -35260))
																																																																																																																							else
																																																																																																																								Tween(CFrame.new(-263.66668701172, 49325.49609375, -35260))
																																																																																																																							else

																																																																																																																								if SelectedIsland == "Sea Beast" then
																																																																																																																									local v1274 = game:GetService("Workspace")
																																																																																																																									Tween((v1274._WorldOrigin.Locations["Sea of Treats"]).CFrame)
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

								end
							end)
							v1246:AddToggle("Bypass Teleport", BypassTeleport, function(a) BypassTeleport = a end)
							v1248 = v64:AddSection("", "NPC TELEPORT", "auto teleport to any npc and every sea", "rbxassetid://10723396542")

							if not First_Sea then
								v1248:AddDropdown("Select NPC", {
									"Random Devil Fruit",
									"Blox Fruits Dealer",
									"Remove Devil Fruit",
									"Ability Teacher",
									"Dark Step",
									"Electro",
									"Fishman Karate",
								}, "", function(a) _G.SelectNPC = a end)
							end

							if not Second_Sea then
								v1248:AddDropdown("Select NPC", {
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
									"Arowe",
								}, "", function(a) _G.SelectNPC = a end)
							end

							if not Third_Sea then
								v1248:AddDropdown("Select NPC", {
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
									"Uzoth",
								}, "", function(a) _G.SelectNPC = a end)
							end

							v1248:AddToggle("Teleport", _G["TeleportNPC"], "Teleport to npc selected", function(a)
								_G.TeleportNPC = a

								if _G.TeleportNPC == true then

									while true do
										task.wait()

										if _G.SelectNPC == "Dargon Berath" then
											Tween(CFrame.new(703.372986, 186.985519, 654.522034, 1, 0, 0, 0, 1, 0, 0, 0, 1))
										else

											if _G.SelectNPC == "Mtsterious Man" then
												Tween(CFrame.new(-2574.43335, 1627.92371, -3739.35767, 0.378697902, -9.06400288e-09, 0.92552036, -8.95582009e-09, 1, 1.34578926e-08, -0.92552036, -1.33852689e-08, 0.378697902))
											else

												if _G.SelectNPC == "Mysterious Scientist" then
													Tween(CFrame.new(-6437.87793, 250.645355, -4498.92773, 0.502376854, -1.01223634e-08, -0.864648759, 2.34106086e-08, 1, 1.89508653e-09, 0.864648759, -2.11940012e-08, 0.502376854))
												else

													if _G.SelectNPC == "Awakening Expert" then
														Tween(CFrame.new(-408.098846, 16.0459061, 247.432846, 0.028394036, 6.17599138e-10, 0.999596894, -5.57905944e-09, 1, -4.59372484e-10, -0.999596894, -5.56376767e-09, 0.028394036))
													else

														if _G.SelectNPC == "Nerd" then
															Tween(CFrame.new(-401.783722, 73.0859299, 262.306702, 1, 0, 0, 0, 1, 0, 0, 0, 1))
														else

															if _G.SelectNPC == "Bar Manager" then
																Tween(CFrame.new(-385.84726, 73.0458984, 316.088806, 1, 0, 0, 0, 1, 0, 0, 0, 1))
															else

																if _G.SelectNPC == "Blox Fruits Dealer" then
																	Tween(CFrame.new(-450.725464, 73.0458984, 355.636902, -0.780352175, -2.7266168e-08, 0.625340283, 9.78516468e-09, 1, 5.58128797e-08, -0.625340283, 4.96727601e-08, -0.780352175))
																else

																	if _G.SelectNPC == "Trevor" then
																		Tween(CFrame.new(-341.498322, 331.886444, 643.024963, 1, 0, 0, 0, 1, 0, 0, 0, 1))
																	else

																		if _G.SelectNPC == "Plokster" then
																			Tween(CFrame.new(-1885.16016, 88.3838196, -1912.28723, -0.513468027, 0, 0.858108759, 0, 1, 0, -0.858108759, 0, -0.513468027))
																		else

																			if _G.SelectNPC == "Enhancement Editor" then
																				Tween(CFrame.new(-346.820221, 72.9856339, 1194.36218, 1, 0, 0, 0, 1, 0, 0, 0, 1))
																			else

																				if _G.SelectNPC == "Pirate Recruiter" then
																					Tween(CFrame.new(-428.072998, 72.9495239, 1445.32422, 1, 0, 0, 0, 1, 0, 0, 0, 1))
																				else

																					if _G.SelectNPC == "Marines Recruiter" then
																						Tween(CFrame.new(-1349.77295, 72.9853363, -1045.12964, 0.866493046, 0, -0.499189168, 0, 1, 0, 0.499189168, 0, 0.866493046))
																					else

																						if _G.SelectNPC == "Chemist" then
																							Tween(CFrame.new(-2777.45288, 72.9919434, -3572.25732, 1, 0, 0, 0, 1, 0, 0, 0, 1))
																						else

																							if _G.SelectNPC == "Ghoul Mark" then
																								Tween(CFrame.new(635.172546, 125.976357, 33219.832, 1, 0, 0, 0, 1, 0, 0, 0, 1))
																							else

																								if _G.SelectNPC == "Cyborg" then
																									Tween(CFrame.new(629.146851, 312.307373, -531.624146, 1, 0, 0, 0, 1, 0, 0, 0, 1))
																								else

																									if _G.SelectNPC == "Guashiem" then
																										Tween(CFrame.new(937.953003, 181.083359, 33277.9297, 1, -8.60126406e-08, 3.81773896e-17, 8.60126406e-08, 1, -1.89969598e-16, -3.8177373e-17, 1.89969598e-16, 1))
																									else

																										if _G.SelectNPC == "El Admin" then
																											Tween(CFrame.new(1322.80835, 126.345039, 33135.8789, 0.988783717, -8.69797603e-08, -0.149354503, 8.62223786e-08, 1, -1.15461916e-08, 0.149354503, -1.46101409e-09, 0.988783717))
																										else

																											if _G.SelectNPC == "El Rodolfo" then
																												Tween(CFrame.new(941.228699, 40.4686775, 32778.9922, -0.818029106, -1.19524382e-08, 0.575176775, -1.28741648e-08, 1, 2.47053866e-09, -0.575176775, -5.38394795e-09, -0.818029106))
																											else

																												if _G.SelectNPC == "Arowe" then
																													Tween(CFrame.new(-1994.51038, 125.519142, -72.2622986, -0.16715166, -6.55417338e-08, -0.985931218, -7.13315558e-08, 1, -5.43836585e-08, 0.985931218, 6.12376851e-08, -0.16715166))
																												else

																													if _G.SelectNPC == "Random Devil Fruit" then
																														Tween(CFrame.new(-1436.19727, 61.8777695, 4.75247526, -0.557794094, 2.74216543e-08, 0.829979479, 5.83273234e-08, 1, 6.16037932e-09, -0.829979479, 5.18467118e-08, -0.557794094))
																													else

																														if _G.SelectNPC == "Blox Fruits Dealer" then
																															Tween(CFrame.new(-923.255066, 7.67800522, 1608.61011, 1, 0, 0, 0, 1, 0, 0, 0, 1))
																														else

																															if _G.SelectNPC == "Remove Devil Fruit" then
																																Tween(CFrame.new(5664.80469, 64.677681, 867.85907, 1, 0, 0, 0, 1, 0, 0, 0, 1))
																															else

																																if _G.SelectNPC == "Ability Teacher" then
																																	Tween(CFrame.new(-1057.67822, 9.65220833, 1799.49146, -0.865874112, -9.26330159e-08, 0.500262439, -7.33759435e-08, 1, 5.816689e-08, -0.500262439, 1.36579752e-08, -0.865874112))
																																else

																																	if _G.SelectNPC == "Dark Step" then
																																		Tween(CFrame.new(-987.873047, 13.7778397, 3989.4978, 1, 0, 0, 0, 1, 0, 0, 0, 1))
																																	else

																																		if _G.SelectNPC == "Electro" then
																																			Tween(CFrame.new(-5389.49561, 13.283, -2149.80151, 1, 0, 0, 0, 1, 0, 0, 0, 1))
																																		else

																																			if _G.SelectNPC == "Fishman Karate" then
																																				Tween(CFrame.new(61581.8047, 18.8965912, 987.832703, 1, 0, 0, 0, 1, 0, 0, 0, 1))
																																			else

																																				if _G.SelectNPC == "Random Devil Fruit" then
																																					Tween(CFrame.new(-12491, 337, -7449))
																																				else

																																					if _G.SelectNPC == "Blox Fruits Dealer" then
																																						Tween(CFrame.new(-12511, 337, -7448))
																																					else

																																						if _G.SelectNPC == "Remove Devil Fruit" then
																																							Tween(CFrame.new(-5571, 1089, -2661))
																																						else

																																							if _G.SelectNPC == "Horned Man" then
																																								Tween(CFrame.new(-11890, 931, -8760))
																																							else

																																								if _G.SelectNPC == "Hungey Man" then
																																									Tween(CFrame.new(-10919, 624, -10268))
																																								else

																																									if _G.SelectNPC == "Previous Hero" then
																																										Tween(CFrame.new(-10368, 332, -10128))
																																									else

																																										if _G.SelectNPC == "Butler" then
																																											Tween(CFrame.new(-5125, 316, -3130))
																																										else

																																											if _G.SelectNPC == "Lunoven" then
																																												Tween(CFrame.new(-5117, 316, -3093))
																																											else

																																												if _G.SelectNPC == "Elite Hunter" then
																																													Tween(CFrame.new(-5420, 314, -2828))
																																												else

																																													if _G.SelectNPC == "Player Hunter" then
																																														Tween(CFrame.new(-5559, 314, -2840))
																																													else

																																														if _G.SelectNPC == "Uzoth" then
																																															Tween(CFrame.new(-9785, 852, 6667))
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

																		end

																	end

																end

															end

														end

													end

												end

											end

										end

										if _G.TeleportNPC then
										end

									end
							end)
							v1251 = v64:AddSection("", "Mirage Islands", "auto summon,teleport,auto advance fruit dealer", "rbxassetid://10734897665")
							spawn(function()
								pcall(function()
									while true do
										local v1276 = task.wait()

										if not v1276 then
											v1276 = game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island")

											if not v1276 then
												Mirragecheck:Set("�����️: Mirage Island Spawning")
											end

										end

										Mirragecheck:Set("��: Mirage Island Not Found ")
									end

								end
								end)
							end)
							v1252 = v1251:AddLabel("")
							Mirragecheck = v1252
							v1251:AddToggle("Teleport to Mirage", TeleporttoMirage, function(a)
								TeleporttoMirage = a
								CancelTween(TeleporttoMirage)
							end)
							spawn(function()
								while true do
									local v1277 = task.wait()

									if not v1277 then

										if not TeleporttoMirage then
										end

										v1277 = game:GetService("Workspace")
										v1277 = v1277.Map:FindFirstChild("MirageIsland")

										if not v1277 then
										end

										local v1278 = game:GetService("Workspace")
										_G.CenterMI = v1278.Map.MirageIsland.Center.Position
										Tween(CFrame.new(_G.CenterMI))
									end

								end
							end)
							v1251:AddToggle("Teleport to Gear", TeleporttoGear, function(a)
								TeleporttoGear = a
								CancelTween(TeleporttoGear)
							end)
							spawn(function()
								while true do
									local v1279 = task.wait()

									if not v1279 then

										if not TeleporttoGear then
										end

										v1279 = game:GetService("Workspace")
										v1279 = v1279.Map:FindFirstChild("MirageIsland")

										if not v1279 then
										end

										local v1280 = game:GetService("Workspace")
										local v1279, v1280, v1281 = _u0(v1280.Map.MirageIsland:GetChildren())

										while true do
											local v1283 = v1282:IsA("MeshPart")

											if not v1283 then

												if v1282.Material == Enum.Material.Neon then
													Tween(v1282.CFrame)
												end

											end

											for v1284, v1282 in v1279, v1280, v1281 do
											end

										end

									end
							end)
							v1251:AddToggle("Teleport to Advance Fruit Dealer", TeleporttoFruitDealer, function(a)
								TeleporttoFruitDealer = a
								CancelTween(TeleporttoFruitDealer)
							end)
							spawn(function()
								while true do
									local v1285 = wait()

									if not v1285 then

										if not TeleporttoFruitDealer then
										end

										v1285 = game:GetService("Workspace")
										v1285 = v1285.NPCs:FindFirstChild("Advanced Fruit Dealer")

										if not v1285 then
										end

										local v1286 = game:GetService("Workspace")
										Tween(CFrame.new(((v1286.NPCs["Advanced Fruit Dealer"]).HumanoidRootPart).CFrame))
									end

								end
							end)
							v1251:AddToggle("Summon Mirage Island", _G["dao"], function(a)
								if not a then
									_G.dao = true
								else
									_G.dao = false
								end

								if not _G.dao then
									local v1288 = Vector3.new(-12463.6025390625, 378.32705688476562, -7566.0830078125)
									_u0.Remotes.CommF_:InvokeServer(_u0.Remotes.CommF_)
									task.wait(1)
									v1288 = _u1()
									local v1290 = CFrame.new(-5411.22021, 778.609863, -2682.27759, 0.927179396, 0, 0.374617696, 0, 1, 0, -0.374617696, 0, 0.927179396)
									v1288.CFrame = v1290
									task.wait(2)
									v1288 = _u1()
									v1290 = CFrame.new(-4526.32177734375, 16.446531295776367, -2648.96484375)
									v1288.CFrame = v1290
									task.wait(2)
									_u0.Remotes.CommF_:InvokeServer(_u0.Remotes.CommF_)

									function two(a)
										pcall(function()
											local v1292 = _u0()
											v1292.Sit = false
											v1292 = _u1()
											v1292.Anchored = false
										end)
										local v1293 = _u1()

										if (v1293.Position - a.Position).Magnitude <= 200 then
											pcall(function() tweenz:Cancel() end)
											v1293 = _u1()
											v1293.CFrame = a
										else
											v1293 = game:service("TWS")
											local v1294 = _u1()
											local v1295 = TweenInfo.new(((v1294.Position - a.Position).Magnitude) / 325, Enum.EasingStyle.Linear)
											local v1294, v1298 = pcall(function()
												local v1296 = _u0:Create()
												local v1297 = _u0:Create(_u0, v1296.HumanoidRootPart, _u2, { CFrame = _u3 })
												tweenz = v1297
												tweenz:Play()
											end)
											err = v1298
											tween = v1294

											if tween then
												do return err end
											end

										end

										function _TweenCanCle()
											tweenz:Cancel()
										end
									end

									two(CFrame.new(-5100.7085, 29.968586, -6792.45459, -0.33648631, -0.0396691673, 0.940852463, -6.40461678e-07, 0.999112308, 0.0421253517, -0.941688359, 0.0141740013, -0.336187631))
									task.wait(13)
									local v1291, v1299 = workspace.Boats.PirateBrigade:GetDescendants()

									while true do
										local v1300 = -6792.45459.Name:find("VehicleSeat")

										if not v1300 then
											v1300 = _u1()
											v1300.CFrame = -6792.45459.CFrame
											v1300 = game:GetService("Workspace")
											v1300 = v1300.Map:FindFirstChild("MirageIsland")

											if not v1300 then
												local v1301 = game:GetService("Workspace")
												v1301 = v1301.Map:FindFirstChild("MirageIsland")
												local v1302 = CFrame.new(0, 500, -100)
												HyperCahaya(v1301.HumanoidRootPart.CFrame * v1302)
											end

										end

										for v1303, v1304 in next, v1291, v1299 do
										end

									end
							end)
							spawn(function()
								while true do
									local v1305 = task.wait()

									if not v1305 then
										pcall(function()
											if not _G.dao then
												local v1307, v1306, v1308 = _u0(workspace:GetChildren())

												while true do
													local v1310 = table.find(v1309, "Large".Name)

													if not v1310 then
														v1310 = "Large":IsA("Model")

														if not v1310 then
															local v1310, v1311, v1312 = _u0("Large":GetDescendants())

															while true do
																local v1314 = v1313:IsA("BasePart")

																if not v1314 then
																	v1313.CanCollide = false
																end

																for v1315, v1313 in v1310, v1311, v1312 do
																end

															end

														end

														for v1316, v1317 in v1307, v1306, v1308 do
														end

													end
										end)
									end

								end
							end)
							spawn(function()
								while true do
									local v1318 = task.wait()

									if not v1318 then
										pcall(function()
											if not _G.dao then
												task.wait(0.5)

												if not workspace.Boats.PirateBrigade then

													while true do

														if 0.1 < (workspace.Boats.PirateBrigade.PrimaryPart.Position - (workspace.Boats.PirateBrigade.PrimaryPart.Position + workspace.Boats.PirateBrigade.PrimaryPart.CFrame.lookVector * 10)).Magnitude then
															workspace.Boats.PirateBrigade:SetPrimaryPartCFrame(workspace.Boats.PirateBrigade.PrimaryPart.CFrame + workspace.Boats.PirateBrigade.PrimaryPart.CFrame.lookVector * 11)
															task.wait()

															if _G.BiirTrax then
															end

															break
														end

													end

												end

											end
										end)
									end

								end
							end)
							spawn(function()
								while true do
									local v1319 = task.wait()

									if not v1319 then
										pcall(function()
											if not _G.dao then
												local v1320 = game:GetService("Workspace")
												v1320 = v1320.Map:FindFirstChild("MirageIsland")

												if not v1320 then
													HyperCahaya(CFrame.new(game.Workspace.Map.MirageIsland.BigTree.Part.Position))

													while true do
														task.wait()
														local v1322 = _u0()
														v1322 = v1322:FindFirstChild("HumanoidRootPart")

														if (v1322.Position - game.Workspace.Map.MirageIsland.BigTree.Part.Position).Magnitude < 5 then
														end

														_G.LockCamToMoon = true
														task.wait(5)
														v1322 = game:GetService("Workspace")
														v1322 = v1322.Map:FindFirstChild("MirageIsland")

														if not v1322 then
															local v1321 = game:GetService("Workspace")
															local v1322, v1321, v1323 = _u1(v1321.Map.MirageIsland:GetChildren())

															while true do
																local v1325 = v1324:IsA("MeshPart")

																if not v1325 then

																	if v1324.Material == Enum.Material.Neon then
																		HyperCahaya(v1324.CFrame)
																	end

																end

																for v1326, v1324 in v1322, v1321, v1323 do
																end

															end

														end

													end
										end)
									end

								end
							end)
							v1252 = v65:AddSection("", "Devil Fruits", "auto buy fruit on sale, auto bring fruit", "rbxassetid://10709790875")
							v1249 = v41:FindFirstChild("Remotes")
							v1249 = v1249["CommF_"]["InvokeServer"]("GetFruits")

							while true do

								if not "Previous Hero"["OnSale"] then
									table["insert"](v1327, "Previous Hero".Name .. " [ " .. "Previous Hero"["Price"] .. " Beli ]")
								end

								for v1328, v1329 in next, v1249, nil do
								end

								local v1330 = v1252:AddDropdown("Devil Fruit on Sale", v1327, "", function(a) Select_Devil_Fruit = a end)
								v1252:Button("Refresh Fruit on Sale", function()
									while true do

										if not v1331.OnSale then
											table.insert(v1332, v1331.Name .. " [ " .. v1331.Price .. " Beli ]")
										end

										for v1333, v1331 in next, _u0, nil do
										end

										Select_Devil_Fruit:Clear()

										while true do

											if not table.insert.OnSale then
												Select_Devil_Fruit:Add(table.insert.Name .. " [ " .. table.insert.Price .. " Beli ]")
											end

											for v1331, v1334 in next, _u0, nil do
											end
								end)
								v1252:Button("Buy Devil Fruit on Sale", function()
									_u0.Remotes.CommF_:InvokeServer("GetFruits")
									_u0.Remotes.CommF_:InvokeServer("PurchaseRawFruit", Select_Devil_Fruit)
								end)
								v1252:AddToggle("Buy Random Fruit", AutoBuyFruitZioles, function(a) AutoBuyFruitZioles = a end)
								spawn(function()
									while true do
										local v1335 = task.wait()

										if not v1335 then

											if not AutoBuyFruitZioles then
											end

											pcall(function() _u0.Remotes.CommF_:InvokeServer("Cousin", "Buy") end)
										end

									end
								end)
								v1252:AddToggle("Auto Bring Fruit", AutoBringFruit, function(a) AutoBringFruit = a end)
								spawn(function()
									while true do
										local v1336 = task.wait()

										if not v1336 then

											if not AutoBringFruit then
											end

											pcall(function()
												local v1337 = game:GetService("Workspace")
												local v1338, v1337, v1339 = _u0(v1337:GetChildren())

												while true do
													local v1341 = v1340:IsA("Tool")

													if not v1341 then
														v1341 = string.find(v1340.Name, "Fruit")

														if not v1341 then
															task.wait(2)
															local v1342 = _u1()
															firetouchinterest(v1342, v1340.Handle, 0)
															task.wait()
															v1342 = _u1()
															firetouchinterest(v1342, v1340.Handle, 1)
														end

													end

													for v1343, v1340 in v1338, v1337, v1339 do
													end
											end)
										end

									end
								end)
								_G["Sele_Teleport_Fruit"] = "Tween"
								v1252:AddToggle("Teleport to Fruit", _G["Auto_Teleport_Fruit"], function(a)
									_G.Auto_Teleport_Fruit = a
									CancelTween(_G.Auto_Teleport_Fruit)
								end)
								spawn(function()
									while true do
										local v1344 = task.wait()

										if not v1344 then

											if not _G.Auto_Teleport_Fruit then
											end

											pcall(function()
												local v1346, v1345, v1347 = _u0(game.Workspace:GetChildren())

												while true do
													local v1349 = v1348:IsA("Tool")

													if not v1349 then
														v1349 = v1348:FindFirstChild("Handle")

														if not v1349 then

															if _G.Sele_Teleport_Fruit == "Bring" then

																if not _G.Auto_Teleport_Fruit then
																	local v1350 = _u1()
																	firetouchinterest(v1350, v1348.Handle, 0)
																	v1350 = _u1()
																	firetouchinterest(v1350, v1348.Handle, 1)
																end

															end

															if _G.Sele_Teleport_Fruit == "Tween" then

																if not (_G.Settings.Devil_Fruit["Bring Fruit"]) then
																	_G.BringFound = true
																	Tween(v1348.Handle.CFrame)
																end

															end

														end

													end

													if v1348.Name == "Fruit " then
														v1349 = v1348:FindFirstChild("Handle")

														if not v1349 then

															if _G.Sele_Teleport_Fruit == "Bring" then

																if not _G.Auto_Teleport_Fruit then
																	v1350 = _u1()
																	firetouchinterest(v1350, v1348.Handle, 0)
																	v1350 = _u1()
																	firetouchinterest(v1350, v1348.Handle, 1)
																	v1349 = _u1()
																	v1349.CFrame = v1348.Handle.CFrame
																end

															end

															if _G.Sele_Teleport_Fruit == "Tween" then

																if not _G.Auto_Teleport_Fruit then
																	Tween(v1348.Handle.CFrame)
																end

															end

														end

													end

													for v1351, v1348 in v1346, v1345, v1347 do
													end

													v1346 = game.Workspace:FindFirstChildOfClass("Tool")

													if not _G.BringFound then

														if v1346 then
															_G.BringFound = false
														end

													end
											end)
										end

									end
								end)
								v1252:AddToggle("Auto Stored Fruit", AutoStoreFruit, function(a) AutoStoreFruit = a end)
								spawn(function()
									while true do
										local v1352 = task.wait()

										if not v1352 then

											if not AutoStoreFruit then
											end

											pcall(function()
												local v1353 = _u0()
												v1353 = v1353:FindFirstChild("Bomb Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Bomb Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Spike Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Spike Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Chop Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Chop Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Spring Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Spring Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Kilo Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Kilo Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Smoke Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Smoke Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Spin Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Spin Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Flame Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Flame Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Bird: Falcon Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Bird: Falcon Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Ice Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Ice Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Sand Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Sand Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Dark Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Dark Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Revive Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Revive Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Revive Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Revive Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Diamond Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Diamond Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Light Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Light Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Love Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Love Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Rubber Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Rubber Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Barrier Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Barrier Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Magma Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Magma Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Quake Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Quake Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Human: Buddha Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Human: Buddha Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("String Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("String Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Bird: Phoenix Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Bird: Phoenix Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Portal Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Portal Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Rumble Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Rumble Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Paw Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Paw Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Blizzard Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Blizzard Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Gravity Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Gravity Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Dough Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Dough Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Shadow Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Shadow Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Venom Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Venom Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Control Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Control Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Spirit Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Spirit Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Dragon Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Dragon Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end

												v1353 = _u0()
												v1353 = v1353:FindFirstChild("Leopard Fruit")

												if v1353 then
													v1353 = _u1.Backpack:FindFirstChild("Leopard Fruit")

													if not v1353 then
													else
														_u2.Remotes.CommF_:InvokeServer(_u2.Remotes.CommF_)
													end

												end
											end)
										end

									end
								end)
								local v1355 = v65:AddSection("", "Shop", "auto buy abilities, fighting style, swords", "rbxassetid://10734952479")
								v1355:AddLabel("Abilities")
								v1328 = v1355:AddDropdown("Select Ability", v1356, "", function(a) _G.BuyAbility = a end)
								v1355:Button("Buy Abilities", function()
									if _G.BuyAbility == "Geppo ($10,000)" then
										local v1357 = game:GetService("ReplicatedStorage")
										v1357.Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
									else

										if _G.BuyAbility == "Buso Haki ($25,000)" then
											v1357 = game:GetService("ReplicatedStorage")
											v1357.Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
										else

											if _G.BuyAbility == "Soru ($100,000)" then
												v1357 = game:GetService("ReplicatedStorage")
												v1357.Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
											else

												if _G.BuyAbility == "Observation Haki ($750,000)" then
													v1357 = game:GetService("ReplicatedStorage")
													v1357.Remotes.CommF_:InvokeServer("KenTalk", "Buy")
												end

											end

										end

									end
								end)
								v1355:AddLabel("Fighting Styles")
								local v1358 = v1355:AddDropdown("Select Fighting", v1329, "", function(a) _G.BuyFighting = a end)
								v1355:Button("Buy Fighting Style", function()
									if _G.BuyFighting == "Black Leg ($150,000)" then
										wait(0.5)
										local v1359 = game:GetService("ReplicatedStorage")
										v1359.Remotes.CommF_:InvokeServer("BuyBlackLeg")
									else

										if _G.BuyFighting == "Electro ($500,000)" then
											wait(0.5)
											v1359 = game:GetService("ReplicatedStorage")
											v1359.Remotes.CommF_:InvokeServer("BuyElectro")
										else

											if _G.BuyFighting == "Water Kung Fu ($750,000)" then
												wait(0.5)
												v1359 = game:GetService("ReplicatedStorage")
												v1359.Remotes.CommF_:InvokeServer("BuyFishmanKarate")
											else

												if _G.BuyFighting == "Dragon Claw ($1,500,000)" then
													wait(0.5)
													v1359 = game:GetService("ReplicatedStorage")
													v1359.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
													v1359 = game:GetService("ReplicatedStorage")
													v1359.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
												else

													if _G.BuyFighting == "Death Step ($2,500,000)" then
														wait(0.5)
														v1359 = game:GetService("ReplicatedStorage")
														v1359.Remotes.CommF_:InvokeServer("BuyDeathStep")
													else

														if _G.BuyFighting == "Sharkman Karate ($3,000,000)" then
															wait(0.5)
															v1359 = game:GetService("ReplicatedStorage")
															v1359.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
															v1359 = game:GetService("ReplicatedStorage")
															v1359.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
														else

															if _G.BuyFighting == "Electric Claw ($3,500,000)" then
																wait(0.5)
																v1359 = game:GetService("ReplicatedStorage")
																v1359.Remotes.CommF_:InvokeServer("BuyElectricClaw")
															else

																if _G.BuyFighting == "Dragon Talon ($4,500,000)" then
																	wait(0.5)
																	v1359 = game:GetService("ReplicatedStorage")
																	v1359.Remotes.CommF_:InvokeServer("BuyDragonTalon")
																else

																	if _G.BuyFighting == "Superhuman ($5,000,000)" then
																		wait(0.5)
																		v1359 = game:GetService("ReplicatedStorage")
																		v1359.Remotes.CommF_:InvokeServer("BuySuperhuman")
																	else

																		if _G.BuyFighting == "God Human ($5,000,000)" then
																			wait(0.5)
																			v1359 = game:GetService("ReplicatedStorage")
																			v1359.Remotes.CommF_:InvokeServer("BuyGodhuman")
																		else

																			if _G.BuyFighting == "Sanguine Art ($6,000,000)" then
																				wait(0.5)
																				v1359 = game:GetService("ReplicatedStorage")
																				v1359.Remotes.CommF_:InvokeServer("BuySanguineArt", true)
																				v1359 = game:GetService("ReplicatedStorage")
																				v1359.Remotes.CommF_:InvokeServer("BuySanguineArt")
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
								v1355:AddLabel("Swords")
								local v1361 = v1355:AddDropdown("Select Sword", v1360, "", function(a) _G.BuySwordSE = a end)
								v1355:Button("Buy Sword", function()
									if _G.BuySwordSE == "Cutlass ($5,000)" then
										wait(0.5)
										local v1362 = game:GetService("ReplicatedStorage")
										v1362.Remotes.CommF_:InvokeServer("BuyItem", "Cutlass")
									else

										if _G.BuySwordSE == "Katana ($10,000)" then
											wait(0.5)
											v1362 = game:GetService("ReplicatedStorage")
											v1362.Remotes.CommF_:InvokeServer("BuyItem", "Katana")
										else

											if _G.BuySwordSE == "Iron Mace ($25,000)" then
												wait(0.5)
												v1362 = game:GetService("ReplicatedStorage")
												v1362.Remotes.CommF_:InvokeServer("BuyItem", "Iron Mace")
											else

												if _G.BuySwordSE == "Dual Katana ($30,000)" then
													wait(0.5)
													v1362 = game:GetService("ReplicatedStorage")
													v1362.Remotes.CommF_:InvokeServer("BuyItem", "Duel Katana")
												else

													if _G.BuySwordSE == "Triple Katana ($50,000)" then
														wait(0.5)
														v1362 = game:GetService("ReplicatedStorage")
														v1362.Remotes.CommF_:InvokeServer("BuyItem", "Triple Katana")
													else

														if _G.BuySwordSE == "Pipe ($100,000)" then
															wait(0.5)
															v1362 = game:GetService("ReplicatedStorage")
															v1362.Remotes.CommF_:InvokeServer("BuyItem", "Pipe")
														else

															if _G.BuySwordSE == "Dual-Headed Blade ($200,000)" then
																wait(0.5)
																v1362 = game:GetService("ReplicatedStorage")
																v1362.Remotes.CommF_:InvokeServer("BuyItem", "Dual-Headed Blade")
															else

																if _G.BuySwordSE == "Bisento ($1,000,000)" then
																	wait(0.5)
																	v1362 = game:GetService("ReplicatedStorage")
																	v1362.Remotes.CommF_:InvokeServer("BuyItem", "Bisento")
																else

																	if _G.BuySwordSE == "Soul Cane ($750,000)" then
																		wait(0.5)
																		v1362 = game:GetService("ReplicatedStorage")
																		v1362.Remotes.CommF_:InvokeServer("BuyItem", "Soul Cane")
																	else

																		if _G.BuySwordSE == "Pole v.2 ($2,000,000)" then
																			wait(0.5)
																			game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ThunderGodTalk")
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
								v1355:AddLabel("Guns")
								local v1364 = v1355:AddDropdown("Select Gun", v1363, "", function(a) _G.GunSelect = a end)
								v1355:Button("Buy Gun", function()
									if _G.GunSelect == "Slingshot ($5,000)" then
										wait(0.5)
										local v1365 = game:GetService("ReplicatedStorage")
										v1365.Remotes.CommF_:InvokeServer("BuyItem", "Slingshot")
									else

										if _G.GunSelect == "Musket ($10,000)" then
											wait(0.5)
											v1365 = game:GetService("ReplicatedStorage")
											v1365.Remotes.CommF_:InvokeServer("BuyItem", "Musket")
										else

											if _G.GunSelect ~= "Flintlock ($25,000)" then

												if _G.GunSelect == "Flintlock ($25,000)" then
													wait(0.5)
													v1365 = game:GetService("ReplicatedStorage")
													v1365.Remotes.CommF_:InvokeServer("BuyItem", "Flintlock")
												else

													if _G.GunSelect == "Refined Slingshot ($50,000)" then
														wait(0.5)
														v1365 = game:GetService("ReplicatedStorage")
														v1365.Remotes.CommF_:InvokeServer("BuyItem", "Refined Slingshot")
													else

														if _G.GunSelect == "Refined Flintlock ($75,000)" then
															wait(0.5)
															v1365 = game:GetService("ReplicatedStorage")
															v1365.Remotes.CommF_:InvokeServer("BuyItem", "Refined Flintlock")
														else

															if _G.GunSelect == "Cannon ($100,000)" then
																wait(0.5)
																v1365 = game:GetService("ReplicatedStorage")
																v1365.Remotes.CommF_:InvokeServer("BuyItem", "Cannon")
															else

																if _G.GunSelect == "Kabucha ($500,000)" then
																	wait(0.5)
																	v1365 = game:GetService("ReplicatedStorage")
																	v1365.Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "1")
																	v1365 = game:GetService("ReplicatedStorage")
																	v1365.Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "2")
																else

																	if _G.GunSelect == "Bizarre Rifle (100 Ectoplasm)" then
																		wait(0.5)
																		local v1366 = game:GetService("ReplicatedStorage")
																		v1366.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 1)
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
								v1355:AddLabel("Accessories")
								local v1367 = v1355:AddDropdown("Select Accessory", { "Black Cape ($100,000)", "Swordsman Hat ($150,000)", "Tomoe Ring ($250,000)" }, "", function(a) _G.BuyAccessories = a end)
								v1355:Button("Buy Accessory", function()
									if _G.BuyAccessories == "Black Cape ($100,000)" then
										local v1368 = game:GetService("ReplicatedStorage")
										v1368.Remotes.CommF_:InvokeServer(v1368.Remotes.CommF_)
									else

										if _G.BuyAccessories == "Swordsman Hat ($150,000)" then
											v1368 = game:GetService("ReplicatedStorage")
											v1368.Remotes.CommF_:InvokeServer(v1368.Remotes.CommF_)
										else

											if _G.BuyAccessories == "Tomoe Ring ($250,000)" then
												v1368 = game:GetService("ReplicatedStorage")
												v1368.Remotes.CommF_:InvokeServer(v1368.Remotes.CommF_)
											end

										end

									end
								end)
								v1355:AddLabel("Others")
								local v1371 = v1355:AddToggle("Auto Buy Legendary Sword", false, function(a) _G.BuyLegendSword = a end)
								task.spawn(function()
									while true do
										local v1372 = wait()

										if not v1372 then
											pcall(function()
												if not _G.BuyLegendSword then
													local v1373 = game:GetService("ReplicatedStorage")
													v1373.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")
													v1373 = game:GetService("ReplicatedStorage")
													v1373.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2")
													v1373 = game:GetService("ReplicatedStorage")
													v1373.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3")
												end
											end)
										end

									end
								end)
								local v1374 = v1355:AddToggle("Buy True Triple Katana", false, function(a) _G.BuyTTK = a end)
								task.spawn(function()
									while true do
										local v1375 = wait()

										if not v1375 then
											pcall(function()
												if not _G.BuyTTK then
													local v1376 = game:GetService("ReplicatedStorage")
													v1376.Remotes.CommF_:InvokeServer("MysteriousMan", "2")
												end
											end)
										end

									end
								end)
								local v1377 = v66:AddSection("", "Misc", "infinite geppo,soru MIGHT LAG", "rbxassetid://10723396542")
								v1377:AddToggle("Infinite Geppo", InfiniteGeppo, function(a) InfiniteGeppo = a end)
								spawn(function()
									while true do
										local v1378 = task.wait(1)

										if not v1378 then

											if not InfiniteGeppo then
											end

											pcall(function()
												local v1379, v1380 = getgc()

												while true do
													local v1382 = getfenv(v1381)
													local v1383 = _u0()
													v1383 = v1383:WaitForChild("Geppo")

													if v1382.script == v1383 then
														local v1383, v1384 = getupvalues(v1381)

														while true do
															local v1386 = tostring(v1385)

															if v1386 == "0" then

																while true do
																	task.wait(0.1)
																	setupvalue(v1381, "Geppo", 0)

																	if not InfiniteGeppo then
																		v1386 = _u1()

																		if v1386.Health <= 0 then
																		end

																	end

																end

																for v1387, v1385 in next, v1383, v1384 do
																end

															end

															for v1388, v1381 in next, v1379, v1380 do
															end
											end)
										end

									end
								end)
								v1377:AddToggle("Infinite Soru", InfiniteSoru, function(a) InfiniteSoru = a end)
								spawn(function()
									while true do
										local v1389 = task.wait(1)

										if not v1389 then

											if not InfiniteSoru then
											end

											v1389 = _u0()
											v1389 = v1389:FindFirstChild("HumanoidRootPart")

											if v1389 ~= nil then
											end

											pcall(function()
												local v1390, v1391 = getgc()

												while true do
													local v1393 = getfenv(v1392)
													local v1394 = _u0()
													v1394 = v1394:WaitForChild("Soru")

													if v1393.script == v1394 then
														local v1393, v1394, v1395 = _u1(debug.getupvalues(v1392))

														while true do
															local v1397 = type(v1396)

															if v1397 == "table" then

																if not v1396.LastUse then

																	while true do
																		task.wait(0.1)
																		setupvalue(v1392, "Soru", { LastAfter = 0, LastUse = 0 })

																		if not InfiniteSoru then
																			v1397 = _u2()

																			if v1397.Health <= 0 then
																			end

																		end

																	end

																end

																for v1398, v1396 in v1393, v1394, v1395 do
																end

															end

															for v1399, v1392 in next, v1390, v1391 do
															end
											end)
										end

									end
								end)
								v1377:AddToggle("Walk on Water", true, function(a) WalkOnWater = a end)
								spawn(function()
									while true do
										local v1400 = task.wait(1)

										if not v1400 then

											if not WalkOnWater then
											end

											pcall(function()
												if nelzkie then
													local v1401 = game:GetService("Workspace")
													local v1402 = Vector3.new(1000, 112, 1000)
													(v1401.Map["WaterBase-Plane"]).Size = v1402
												else
													v1401 = game:GetService("Workspace")
													v1402 = Vector3.new(1000, 80, 1000)
													(v1401.Map["WaterBase-Plane"]).Size = v1402
												end
											end)
										end

									end
								end)
								v1377:AddToggle("Remove Fog", _G["Remove_Fog"], function(a)
									_G.Remove_Fog = a

									if _G.Remove_Fog then
										do return end
									end

									while true do

										if not _G.Remove_Fog then
											task.wait()
											game.Lighting.FogEnd = 9000000000

											if _G.Remove_Fog then
											end

											game.Lighting.FogEnd = 2500
										end

									end
								end)
								v1377:AddToggle("White Screen", _G["White_Screen"], function(a)
									_G.White_Screen = a

									if not _G.White_Screen then
										_u0:Set3dRenderingEnabled(false)
									else
										_u0:Set3dRenderingEnabled(true)
									end
								end)
								v1377:Button("Inventory", function()
									_u0.Remotes.CommF_:InvokeServer("getInventoryWeapons")
									_u1.PlayerGui.Main.Inventory.Visible = true
								end)
								v1377:Button("Devil Fruit Inventory", function()
									_u0.Remotes.CommF_:InvokeServer("getInventoryFruits")
									_u1.PlayerGui.Main.FruitInventory.Visible = true
								end)
								v1377:Button("Title Name", function()
									_u0.Remotes.CommF_:InvokeServer("getTitles")
									_u1.PlayerGui.Main.Titles.Visible = true
								end)
								v1377:Button("Color Haki", function() _u0.PlayerGui.Main.Colors.Visible = true end)
								v1377:Button("Join Pirates Team", function() _u0.Remotes.CommF_:InvokeServer("SetTeam", "Pirates") end)
								v1377:Button("Join Marines Team", function() _u0.Remotes.CommF_:InvokeServer("SetTeam", "Marines") end)
								local v1403 = v66:AddSection("", "Other Misc", "esp island,fruit,player,flower", "rbxassetid://6031233840")
								v1403:AddToggle("Chest ESP", ChestESP, function(a) ChestESP = a end)
								spawn(function()
									while true do
										local v1404 = task.wait()

										if not v1404 then
											pcall(function()
												if not ChestESP then
													local v1406, v1405, v1407 = _u0(game.Workspace:GetChildren())

													while true do

														if v1408.Name ~= "GoldChest" then

															if v1408.Name ~= "DiamondChest" then

																if v1408.Name == "SilverChest" then
																else
																else
																	local v1409 = v1408:FindFirstChild("ChestESP")

																	if v1409 then
																		v1409 = Instance.new("BillboardGui")
																		local v1410 = Instance.new("TextLabel")
																		v1409.Parent = v1408
																		v1409.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
																		v1409.Active = true
																		v1409.Name = "ChestESP"
																		v1409.AlwaysOnTop = true
																		v1409.LightInfluence = 1
																		local v1411 = UDim2.new(0, 200, 0, 50)
																		v1409.Size = v1411
																		v1411 = Vector3.new(0, 2.5, 0)
																		v1409.StudsOffset = v1411
																		v1410.Parent = v1409
																		v1411 = Color3.fromRGB(255, 255, 255)
																		v1410.BackgroundColor3 = v1411
																		v1410.BackgroundTransparency = 1
																		v1411 = UDim2.new(0, 200, 0, 50)
																		v1410.Size = v1411
																		v1410.Font = Enum.Font.GothamMedium
																		v1411 = Color3.fromRGB(255, 255, 255)
																		v1410.TextColor3 = v1411
																		v1410.Text.Size = 35
																		v1410.TextStrokeTransparency = 0
																		v1410.TextWrapped = true
																	end

																	v1410 = _u1()
																	v1409 = math.floor((v1410.Position - v1408.Position).Magnitude)
																	v1408.ChestESP.TextLabel.Text = v1408.Name .. "\n" .. v1409 .. " M."

																	if v1408.Name == "GoldChest" then
																		v1410 = v1408:FindFirstChild("ChestESP")
																		v1411 = Color3.new(255, 255, 255)
																		v1410.TextLabel.TextColor3 = v1411
																	else

																		if v1408.Name == "DiamondChest" then
																			v1410 = v1408:FindFirstChild("ChestESP")
																			v1411 = Color3.new(255, 255, 255)
																			v1410.TextLabel.TextColor3 = v1411
																		else

																			if v1408.Name == "SilverChest" then
																				v1410 = v1408:FindFirstChild("ChestESP")
																				v1411 = Color3.new(255, 255, 255)
																				v1410.TextLabel.TextColor3 = v1411
																			end

																		end

																	end

																end

															end

														end

														for v1412, v1408 in v1406, v1405, v1407 do
														end

													else
														local v1406, v1405, v1407 = _u0(game.Workspace:GetChildren())

														while true do

															if v1408.Name ~= "GoldChest" then

																if v1408.Name ~= "DiamondChest" then

																	if v1408.Name == "SilverChest" then
																	else
																	else
																		v1409 = v1408:FindFirstChild("ChestESP")

																		if not v1409 then
																			v1408.ChestESP:Destroy()
																		end

																	end

																end

															end

															for v1412, v1408 in v1406, v1405, v1407 do
															end

														end
											end)
										end

									end
								end)
								v1403:AddToggle("Devil Fruit ESP", _G["ESPDF"], function(a) _G.ESPDF = a end)
								spawn(function()
									while true do
										local v1413 = task.wait()

										if not v1413 then

											if not _G.ESPDF then
												pcall(function()
													local v1415, v1414, v1416 = _u0(game.Workspace:GetChildren())

													while true do
														local v1418 = v1417:IsA("Tool")

														if not v1418 then
															v1418 = v1417:FindFirstChild("Handle")

															if not v1418 then
																v1418 = v1417.Handle:FindFirstChild("DFESP")

																if v1418 then
																	v1418 = Instance.new("BillboardGui")
																	local v1419 = Instance.new("TextLabel")
																	v1418.Parent = v1417.Handle
																	v1418.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
																	v1418.Active = true
																	v1418.Name = "DFESP"
																	v1418.AlwaysOnTop = true
																	v1418.LightInfluence = 1
																	local v1420 = UDim2.new(0, 200, 0, 50)
																	v1418.Size = v1420
																	v1420 = Vector3.new(0, 2.5, 0)
																	v1418.StudsOffset = v1420
																	v1419.Parent = v1418
																	v1420 = Color3.fromRGB(255, 255, 255)
																	v1419.BackgroundColor3 = v1420
																	v1419.BackgroundTransparency = 1
																	v1420 = UDim2.new(0, 200, 0, 50)
																	v1419.Size = v1420
																	v1419.Font = Enum.Font.GothamMedium
																	v1420 = Color3.fromRGB(255, 255, 0)
																	v1419.TextColor3 = v1420
																	v1419.Text.Size = 35
																	v1419.TextStrokeTransparency = 0
																	v1419.TextWrapped = true
																end

																v1419 = _u1()
																v1418 = math.floor((v1419.Position - v1417.Handle.Position).Magnitude)
																Dis = v1418
																v1417.Handle.DFESP.TextLabel.Text = v1417.Name .. "\n" .. Dis .. " M."
															end

														end

														for v1421, v1417 in v1415, v1414, v1416 do
														end
												end)
											end

										end

										local v1413, v1422, v1423 = _u0(game.Workspace:GetChildren())

										while true do
											local v1425 = v1424:IsA("Tool")

											if not v1425 then
												v1425 = v1424:FindFirstChild("Handle")

												if not v1425 then
													v1425 = v1424.Handle:FindFirstChild("DFESP")

													if not v1425 then
														v1424:Destroy()
													end

												end

											end

											for v1426, v1424 in v1413, v1422, v1423 do
											end

										end

									end
								end)
								v1403:AddToggle("Fruit ESP", FruitESPe, function(a) FruitESPe = a end)
								spawn(function()
									while true do
										local v1427 = task.wait()

										if not v1427 then

											if not FruitESPe then
												pcall(function()
													local v1429, v1428, v1430 = _u0(game.Workspace:GetChildren())

													while true do

														if v1431.Name ~= "PineappleSpawner" then

															if v1431.Name ~= "BananaSpawner" then

																if v1431.Name == "AppleSpawner" then
																else
																else
																	local v1433, v1432, v1434 = _u0(v1431:GetChildren())

																	while true do
																		local v1436 = v1435:IsA("Tool")

																		if not v1436 then
																			v1436 = v1435:FindFirstChild("Handle")

																			if not v1436 then

																				while true do
																					task.wait(0.1)
																					v1436 = v1435.Handle:FindFirstChild("FruitESP")

																					if v1436 then
																						v1436 = Instance.new("BillboardGui")
																						local v1437 = Instance.new("TextLabel")
																						v1436.Parent = v1435.Handle
																						v1436.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
																						v1436.Active = true
																						v1436.Name = "FruitESP"
																						v1436.AlwaysOnTop = true
																						v1436.LightInfluence = 1
																						local v1438 = UDim2.new(0, 200, 0, 50)
																						v1436.Size = v1438
																						v1438 = Vector3.new(0, 2.5, 0)
																						v1436.StudsOffset = v1438
																						v1437.Parent = v1436
																						v1438 = Color3.fromRGB(255, 255, 255)
																						v1437.BackgroundColor3 = v1438
																						v1437.BackgroundTransparency = 1
																						v1438 = UDim2.new(0, 200, 0, 50)
																						v1437.Size = v1438
																						v1437.Font = Enum.Font.GothamMedium
																						v1438 = Color3.fromRGB(255, 255, 0)
																						v1437.TextColor3 = v1438
																						v1437.Text.Size = 35
																						v1437.TextStrokeTransparency = 0
																						v1437.TextWrapped = true
																					end

																					v1437 = _u1()
																					v1436 = math.floor((v1437.Position - v1435.Handle.Position).Magnitude)
																					v1435.Handle.FruitESP.TextLabel.Text = v1435.Name .. "\n" .. v1436 .. " M."

																					if FruitESPe then
																					end

																				end

																			end

																			for v1439, v1435 in v1433, v1432, v1434 do
																			end

																		end

																	end

																end

																for v1440, v1431 in v1429, v1428, v1430 do
																end
												end)
											end

										end

										local v1427, v1441, v1442 = _u0(game.Workspace:GetChildren())

										while true do

											if v1443.Name ~= "PineappleSpawner" then

												if v1443.Name ~= "BananaSpawner" then

													if v1443.Name == "AppleSpawner" then
													else
													else
														local v1445, v1444, v1446 = _u0(v1443:GetChildren())

														while true do
															local v1448 = v1447:IsA("Tool")

															if not v1448 then
																v1448 = v1447:FindFirstChild("Handle")

																if not v1448 then
																	v1448 = v1447.Handle:FindFirstChild("FruitESP")

																	if not v1448 then
																		v1447.Handle.FruitESP:Destroy()
																	end

																end

															end

															for v1449, v1447 in v1445, v1444, v1446 do
															end

														end

													end

												end

												for v1450, v1443 in v1427, v1441, v1442 do
												end

											end

										end
								end)
								v1403:AddToggle("Flower ESP", FlowerESP, function(a) FlowerESP = a end)
								spawn(function()
									while true do
										local v1451 = task.wait()

										if not v1451 then

											if not FlowerESP then
												pcall(function()
													local v1453, v1452, v1454 = _u0(game.Workspace:GetChildren())

													while true do

														if v1455.Name ~= "Flower2" then

															if v1455.Name == "Flower1" then
															else
																local v1456 = v1455:FindFirstChild("FindFlower")

																if v1456 then
																	v1456 = Instance.new("BillboardGui")
																	local v1457 = Instance.new("TextLabel")
																	v1456.Parent = v1455
																	v1456.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
																	v1456.Active = true
																	v1456.Name = "FindFlower"
																	v1456.AlwaysOnTop = true
																	v1456.LightInfluence = 1
																	local v1458 = UDim2.new(0, 200, 0, 50)
																	v1456.Size = v1458
																	v1458 = Vector3.new(0, 2.5, 0)
																	v1456.StudsOffset = v1458
																	v1457.Parent = v1456
																	v1458 = Color3.fromRGB(255, 255, 255)
																	v1457.BackgroundColor3 = v1458
																	v1457.BackgroundTransparency = 1
																	v1458 = UDim2.new(0, 200, 0, 50)
																	v1457.Size = v1458
																	v1457.Font = Enum.Font.GothamMedium
																	v1458 = Color3.fromRGB(250, 250, 30)
																	v1457.TextColor3 = v1458
																	v1457.Text.Size = 75
																	v1457.TextStrokeTransparency = 0
																	v1457.TextWrapped = true
																end

																v1457 = _u1()
																v1456 = math.floor((v1457.Position - v1455.Position).Magnitude)
																v1455.FindFlower.TextLabel.Text = v1455.Name .. " - [" .. v1456 .. " M]"

																if v1455.Name == "Flower1" then
																	v1458 = Color3.new(255, 120, 120)
																	v1455.FindFlower.TextLabel.TextColor3 = v1458
																else

																	if v1455.Name == "Flower2" then
																		v1458 = Color3.new(120, 120, 255)
																		v1455.FindFlower.TextLabel.TextColor3 = v1458
																	end

																end

															end

														end

														for v1459, v1455 in v1453, v1452, v1454 do
														end
												end)
											end

										end

										local v1460 = game:GetService("Workspace")
										local v1451, v1460, v1461 = _u0(v1460:GetChildren())

										while true do
											local v1463 = v1462:FindFirstChild("FindFlower")

											if not v1463 then
												v1462.FindFlower:Destroy()
											end

											for v1464, v1462 in v1451, v1460, v1461 do
											end

										end

									end
								end)
								v1403:AddToggle("Island ESP", IslandESP, function(a) IslandESP = a end)
								spawn(function()
									while true do
										local v1465 = task.wait()

										if not v1465 then

											if not IslandESP then
												pcall(function()
													local v1466 = game:GetService("Workspace")
													local v1467, v1466, v1468 = _u0(v1466._WorldOrigin.Locations:GetChildren())

													while true do
														local v1470 = v1469:FindFirstChild("IslandEsp")

														if v1470 then
															v1470 = Instance.new("BillboardGui")
															local v1471 = Instance.new("TextLabel")
															v1470.Parent = v1469
															v1470.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
															v1470.Active = true
															v1470.Name = "IslandEsp"
															v1470.AlwaysOnTop = true
															v1470.LightInfluence = 1
															local v1472 = UDim2.new(0, 200, 0, 50)
															v1470.Size = v1472
															v1472 = Vector3.new(0, 2.5, 0)
															v1470.StudsOffset = v1472
															v1471.Parent = v1470
															v1472 = Color3.fromRGB(255, 255, 255)
															v1471.BackgroundColor3 = v1472
															v1471.BackgroundTransparency = 1
															v1472 = UDim2.new(0, 200, 0, 50)
															v1471.Size = v1472
															v1471.Font = Enum.Font.GothamMedium
															v1472 = Color3.fromRGB(255, 0, 255)
															v1471.TextColor3 = v1472
															v1471.Text.Size = 75
															v1471.TextStrokeTransparency = 0
															v1471.TextWrapped = true
														end

														v1471 = _u1()
														v1470 = math.floor(((v1471.Position - v1469.Position).Magnitude) / 10)
														v1469.IslandEsp.TextLabel.Text = v1469.Name .. "\n" .. "[" .. v1470 .. "]"

														for v1473, v1469 in v1467, v1466, v1468 do
														end
												end)
											end

										end

										local v1474 = game:GetService("Workspace")
										local v1465, v1474, v1475 = _u0(v1474._WorldOrigin.Locations:GetChildren())

										while true do
											local v1477 = v1476:FindFirstChild("IslandEsp")

											if not v1477 then
												v1476.IslandEsp:Destroy()
											end

											for v1478, v1476 in v1465, v1474, v1475 do
											end

										end

									end
								end)
								v1403:AddToggle("Npc ESP", NpcESP, function(a) NpcESP = a end)
								spawn(function()
									while true do
										local v1479 = task.wait()

										if not v1479 then

											if not NpcESP then
												pcall(function()
													local v1480 = game:GetService("Workspace")
													local v1481, v1480, v1482 = _u0(v1480.NPCs:GetChildren())

													while true do
														local v1484 = v1483:FindFirstChild("HumanoidRootPart")

														if not v1484 then
															v1484 = v1483:FindFirstChild("NpcEspes")

															if v1484 then
																v1484 = Instance.new("BillboardGui")
																local v1485 = Instance.new("TextLabel")
																v1484.Parent = v1483
																v1484.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
																v1484.Active = true
																v1484.Name = "NpcEspes"
																v1484.AlwaysOnTop = true
																v1484.LightInfluence = 1
																local v1486 = UDim2.new(0, 200, 0, 50)
																v1484.Size = v1486
																v1486 = Vector3.new(0, 2.5, 0)
																v1484.StudsOffset = v1486
																v1485.Parent = v1484
																v1486 = Color3.fromRGB(255, 255, 255)
																v1485.BackgroundColor3 = v1486
																v1485.BackgroundTransparency = 1
																v1486 = UDim2.new(0, 200, 0, 50)
																v1485.Size = v1486
																v1485.Font = Enum.Font.GothamMedium
																v1486 = Color3.fromRGB(0, 255, 255)
																v1485.TextColor3 = v1486
																v1485.Text.Size = 35
															end

															v1485 = _u1()
															v1484 = math.floor((v1485.Position - v1483.HumanoidRootPart.Position).Magnitude)
															v1483.NpcEspes.TextLabel.Text = v1483.Name .. " - [" .. v1484 .. " M]"
														end

														for v1487, v1483 in v1481, v1480, v1482 do
														end
												end)
											end

										end

										local v1488 = game:GetService("Workspace")
										local v1479, v1488, v1489 = _u0(v1488.NPCs:GetChildren())

										while true do
											local v1491 = v1490:FindFirstChild("NpcEspes")

											if not v1491 then
												v1490.NpcEspes:Destroy()
											end

											for v1492, v1490 in v1479, v1488, v1489 do
											end

										end

									end
								end)
								v1403:AddToggle("ESP Player", _G["ESPPlayer"], function(a) _G.ESPPlayer = a end)
								spawn(function()
									while true do
										local v1493 = task.wait()

										if not v1493 then
											pcall(function()
												if not _G.ESPPlayer then
													local v1495, v1494, v1496 = _u0(_u1:GetChildren())

													while true do

														if v1497.Name ~= _u2.Name then
															local v1498 = v1497.Character.HumanoidRootPart:FindFirstChild("PlayerESP")

															if v1498 then
																v1498 = Instance.new("BillboardGui")
																local v1499 = Instance.new("TextLabel")
																v1498.Parent = v1497.Character.HumanoidRootPart
																v1498.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
																v1498.Active = true
																v1498.Name = "PlayerESP"
																v1498.AlwaysOnTop = true
																v1498.LightInfluence = 1
																local v1500 = UDim2.new(0, 200, 0, 50)
																v1498.Size = v1500
																v1500 = Vector3.new(0, 2.5, 0)
																v1498.StudsOffset = v1500
																v1499.Parent = v1498
																v1500 = Color3.fromRGB(255, 255, 255)
																v1499.BackgroundColor3 = v1500
																v1499.BackgroundTransparency = 1
																v1500 = UDim2.new(0, 200, 0, 50)
																v1499.Size = v1500
																v1499.Font = Enum.Font.GothamMedium
																v1500 = Color3.fromRGB(255, 255, 255)
																v1499.TextColor3 = v1500
																v1499.Text.Size = 35
																v1499.TextStrokeTransparency = 0
																v1499.TextWrapped = true
															end

															v1499 = _u3()
															v1498 = math.floor((v1499.Position - v1497.Character.HumanoidRootPart.Position).Magnitude)
															v1499 = v1497.Character.HumanoidRootPart:FindFirstChild("PlayerESP")
															v1499.TextLabel.Text = v1497.Name .. "\n\n" .. v1498 .. " M."

															if v1497.Team == _u2.Team then
																v1499 = v1497.Character.HumanoidRootPart:FindFirstChild("PlayerESP")
																v1500 = Color3.new(255, 0, 0)
																v1499.TextLabel.TextColor3 = v1500
															else
																v1499 = v1497.Character.HumanoidRootPart:FindFirstChild("PlayerESP")
																v1500 = Color3.new(0, 255, 0)
																v1499.TextLabel.TextColor3 = v1500
															end

														end

														for v1501, v1497 in v1495, v1494, v1496 do
														end

													else
														local v1495, v1494, v1496 = _u0(_u1:GetChildren())

														while true do

															if v1497.Name ~= _u2.Name then
																v1498 = v1497.Character.HumanoidRootPart:FindFirstChild("PlayerESP")

																if not v1498 then
																	v1497.Character.HumanoidRootPart.PlayerESP:Destroy()
																end

															end

															for v1501, v1497 in v1495, v1494, v1496 do
															end

														end
											end)
										end

									end
								end)
								v1403:AddToggle("Currently Broken", DodgewithoutCool, function(a) print("What Did i just say") end)
								v1403:Button("Redeem X2 Code", function()
									local function v1502(a)
										_u0.Remotes.Redeem:InvokeServer(a)
									end

									local v1503, v1504, v1505 = _u1(_u2)

									while true do
										v1502(v1506)

										for v1507, v1506 in v1503, v1504, v1505 do
										end
								end)
								v1403:Button("Always Day", function()
									while true do
										local v1508 = task.wait()

										if not v1508 then
											_u0.ClockTime = 12
										end

									end
								end)
								v1403:Button("Remove Lave", function()
									local v1510, v1509, v1511 = _u0(game.Workspace:GetDescendants())

									while true do

										if v1512.Name == "Lava" then
											v1512:Destroy()
										end

										for v1513, v1512 in v1510, v1509, v1511 do
										end

										local v1510, v1509, v1511 = _u0(_u1:GetDescendants())

										while true do

											if v1512.Name == "Lava" then
												v1512:Destroy()
											end

											for v1513, v1512 in v1510, v1509, v1511 do
											end
								end)
								local v1514 = v67:AddSection("", "Fun Visual", "auto transform v4 any race visual only,auto max all", "rbxassetid://6034467796")
								v1514:Button("Rain Fruit", function()
									local v1515 = game:GetObjects("rbxassetid://14759368201")
									local v1516, v1515, v1517 = _u0(v1515[1]:GetChildren())

									while true do
										v1518.Parent = game.Workspace.Map
										local v1519 = v1518:MoveTo(50)
										local v1520 = Vector3.new()
										v1518:MoveTo(v1518, game.Players.LocalPlayer.Character.PrimaryPart.Position + v1520)
										local v1521 = v1518.Fruit:FindFirstChild("AnimationController")

										if not v1521 then
											v1521 = v1518.Fruit:FindFirstChild("AnimationController")
											v1521 = v1521:LoadAnimation(v1521)
											v1521:Play()
										end

										v1518.Handle.Touched:Connect(function(a)
											if a.Parent == game.Players.LocalPlayer.Character then
												_u0.Parent = game.Players.LocalPlayer.Backpack
												game.Players.LocalPlayer.Character.Humanoid:EquipTool(_u0)
											end
										end)

										for v1523, v1518 in v1516, v1515, v1517 do
										end
								end)
								v1514:Button("Instant Max All Beli, Level, Exp", function()
									local v1524 = game:GetService("Players")
									local v1525 = game:GetService("ReplicatedStorage")
									local v1526 = require(v1525.Notification)
									v1525 = v1524.LocalPlayer:WaitForChild("Data")
									local v1528 = require(game.ReplicatedStorage:WaitForChild("EXPFunction"))
									local v1529 = game:GetService("ReplicatedStorage")
									local v1527 = require(v1529.Effect.Container.LevelUp)
									local v1530 = game:GetService("ReplicatedStorage")
									v1529 = require(v1530.Util.Sound)
									v1530 = game:GetService("ReplicatedStorage")
									v1530 = v1530.Util.Sound.Storage.Other:FindFirstChild("LevelUp_Proxy")

									if v1530 then
										v1530 = game:GetService("ReplicatedStorage")
										v1530 = v1530.Util.Sound.Storage.Other:FindFirstChild("LevelUp")
									end

									function v129(a)
										while true do
											local v1531, v1532 = string.gsub(a, "^(-?%d+)(%d%d%d)", "%1,%2")

											if v1532 == 0 then
											end

											break
										end

										return v1531
									end

									local v1533 = v1526.new("<Color=Yellow>QUEST COMPLETED!<Color=/>")
									v1533:Display()
									v1533 = v1526.new("Earned <Color=Yellow>9,999,999,999,999 Exp.<Color=/> (+ None)")
									v1533:Display()
									v1533 = v1526.new("Earned <Color=Green>$9,999,999,999,999<Color=/>")
									v1533:Display()
									v1524.LocalPlayer.Data.Exp.Value = 999999999999
									v1524.LocalPlayer.Data.Beli.Value = v1524.LocalPlayer.Data.Beli.Value + 999999999999
									delay = 0
									count = 0

									while true do
										local v1534 = v1528(v1525.Level.Value)

										if 0 < v1524.LocalPlayer.Data.Exp.Value - v1534 then
											local v1535 = v1528(v1525.Level.Value)
											v1524.LocalPlayer.Data.Exp.Value = v1524.LocalPlayer.Data.Exp.Value - v1535
											v1524.LocalPlayer.Data.Level.Value = v1524.LocalPlayer.Data.Level.Value + 1
											v1524.LocalPlayer.Data.Points.Value = v1524.LocalPlayer.Data.Points.Value + 3
											v1527({ v1524.LocalPlayer })
											v1529.Play(v1529, v1530.Value)
											v1533 = v1526.new("<Color=Green>LEVEL UP!<Color=/> (" .. v1524.LocalPlayer.Data.Level.Value .. ")")
											v1533:Display()
											count = count + 1

											if 10 <= count then
											end

											v1533 = tick()
											delay = v1533
											count = 0
											wait(1)
										end

									end
								end)
								v1514:Button("Human V4 Transformation", function()
									local v1536 = game:GetService("ReplicatedStorage")
									local v1537 = require(v1536.Notification)
									v1537 = v1537.new("Human V4 Transformation!")
									v1537:Display()
									wait()
									setthreadcontext(5)
									v1537 = game:GetService("ReplicatedStorage")
									v1536 = game:GetService("Players")
									local v1538 = Color3.fromRGB(166, 0, 0)
									v1538 = Color3.fromRGB(166, 0, 0)
									v1538 = Color3.fromRGB(166, 0, 0)
									v1538 = v1536.LocalPlayer.Character.Humanoid:LoadAnimation(v1537.Util.Anims.Storage["2"].RaceTransform)
									v1538:Play()
									delay(1, function()
										pcall(function()
											local v1539 = require(_u0.Effect.Container.RaceTransformation.Main)
											v1539(_u1)
										end)
									end)
								end)
								v1514:Button("Mink V4 Transformation", function()
									local v1540 = game:GetService("ReplicatedStorage")
									local v1541 = require(v1540.Notification)
									v1541 = v1541.new("Mink V4 Transformation!")
									v1541:Display()
									wait()
									setthreadcontext(5)
									v1541 = game:GetService("ReplicatedStorage")
									v1540 = game:GetService("Players")
									local v1542 = Color3.fromRGB(102, 255, 153)
									v1542 = Color3.fromRGB(102, 255, 153)
									v1542 = Color3.fromRGB(102, 255, 153)
									v1542 = v1540.LocalPlayer.Character.Humanoid:LoadAnimation(v1541.Util.Anims.Storage["2"].RaceTransform)
									v1542:Play()
									delay(1, function()
										pcall(function()
											local v1543 = require(_u0.Effect.Container.RaceTransformation.Main)
											v1543(_u1)
										end)
									end)
								end)
								v1514:Button("Fishman V4 Transformation", function()
									local v1544 = game:GetService("ReplicatedStorage")
									local v1545 = require(v1544.Notification)
									v1545 = v1545.new("Fishman V4 Transformation!")
									v1545:Display()
									wait()
									setthreadcontext(5)
									v1545 = game:GetService("ReplicatedStorage")
									v1544 = game:GetService("Players")
									local v1546 = Color3.fromRGB(5, 115, 166)
									v1546 = Color3.fromRGB(5, 115, 166)
									v1546 = Color3.fromRGB(5, 115, 166)
									v1546 = v1544.LocalPlayer.Character.Humanoid:LoadAnimation(v1545.Util.Anims.Storage["2"].RaceTransform)
									v1546:Play()
									delay(1, function()
										pcall(function()
											local v1547 = require(_u0.Effect.Container.RaceTransformation.Main)
											v1547(_u1)
										end)
									end)
								end)
								v1514:Button("Skypiean V4 Transformation", function()
									local v1548 = game:GetService("ReplicatedStorage")
									local v1549 = require(v1548.Notification)
									v1549 = v1549.new("Skypeian V4 Transformation!")
									v1549:Display()
									wait()
									setthreadcontext(5)
									v1549 = game:GetService("ReplicatedStorage")
									v1548 = game:GetService("Players")
									local v1550 = Color3.fromRGB(222, 222, 0)
									v1550 = Color3.fromRGB(222, 222, 0)
									v1550 = Color3.fromRGB(222, 222, 0)
									v1550 = v1548.LocalPlayer.Character.Humanoid:LoadAnimation(v1549.Util.Anims.Storage["2"].RaceTransform)
									v1550:Play()
									delay(1, function()
										pcall(function()
											local v1551 = require(_u0.Effect.Container.RaceTransformation.Main)
											v1551(_u1)
										end)
									end)
								end)
								v1514:Button("Ghoul V4 Transformation", function()
									local v1552 = game:GetService("ReplicatedStorage")
									local v1553 = require(v1552.Notification)
									v1553 = v1553.new("Ghoul V4 Transformation!")
									v1553:Display()
									wait()
									setthreadcontext(5)
									v1553 = game:GetService("ReplicatedStorage")
									v1552 = game:GetService("Players")
									local v1554 = Color3.fromRGB(155, 155, 155)
									v1554 = Color3.fromRGB(0, 0, 0)
									v1554 = Color3.fromRGB(155, 155, 155)
									v1554 = v1552.LocalPlayer.Character.Humanoid:LoadAnimation(v1553.Util.Anims.Storage["2"].RaceTransform)
									v1554:Play()
									delay(1, function()
										pcall(function()
											local v1555 = require(_u0.Effect.Container.RaceTransformation.Main)
											v1555(_u1)
										end)
									end)
								end)
								v1514:Button("Cyborg V4 Transformation", function()
									local v1556 = game:GetService("ReplicatedStorage")
									local v1557 = require(v1556.Notification)
									v1557 = v1557.new("Cyborg V4 Transformation!")
									v1557:Display()
									wait()
									setthreadcontext(5)
									v1557 = game:GetService("ReplicatedStorage")
									v1556 = game:GetService("Players")
									local v1558 = Color3.fromRGB(166, 0, 111)
									v1558 = Color3.fromRGB(166, 0, 111)
									v1558 = Color3.fromRGB(166, 0, 111)
									v1558 = v1556.LocalPlayer.Character.Humanoid:LoadAnimation(v1557.Util.Anims.Storage["2"].RaceTransform)
									v1558:Play()
									delay(1, function()
										pcall(function()
											local v1559 = require(_u0.Effect.Container.RaceTransformation.Main)
											v1559(_u1)
										end)
									end)
								end)
								spawn(function()
									local v1560 = getrawmetatable(game)
									setreadonly(v1560, false)
									local v1565 = newcclosure(function(...)
										local v1561 = getnamecallmethod()
										local v1562 = tostring(v1561)

										if v1562 == "FireServer" then
											v1562 = tostring(v1563[1])

											if v1562 == "RemoteEvent" then

												if not UseSkill then
													local v1564 = type(v1563[2])

													if v1564 == "vector" then
													else
														v1564 = type(v1563[2])

														if v1564 == "CFrame" then
															v1564 = CFrame.new(PositionSkillMasteryDevilFruit)
														end

													end

													return _u0()
													do return _u0 end
												end

											end

										end

										return _u0()
										return _u0
									end)
									v1560.__namecall = v1565
									setreadonly(v1560, true)
								end)
								local v1566 = getrawmetatable(game)
								setreadonly(v1566, false)
								local v1570 = newcclosure(function(...)
									local v1567 = getnamecallmethod()
									local v1568 = tostring(v1567)

									if v1568 == "FireServer" then
										v1568 = tostring(v1569[1])

										if v1568 == "RemoteEvent" then
											v1568 = tostring(v1569[2])

											if v1568 ~= "true" then
												v1568 = tostring(v1569[2])

												if v1568 ~= "false" then

													if not Skillaimbot then
														return _u0()
														do return _u0 end
													end

												end

											end

										end

									end

									return _u0()
									return _u0
								end)
								v1566["__namecall"] = v1570
