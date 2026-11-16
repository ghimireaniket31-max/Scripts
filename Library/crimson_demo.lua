--[[
	CrimsonUI demo
	Structure shown:
	  Category  ->  Tab  ->  Sub Tab  ->  Section  ->  Sub Section  ->  Elements
	Toggle the window with RightShift (or click the minimize pill).
]]

local Library = loadstring(game:HttpGet(
	"https://raw.githubusercontent.com/ghimireaniket31-max/Scripts/refs/heads/main/Library/crimsonui.lua"
))()

local Window = Library:CreateWindow({
	Title = "Crimson Hub",
	Subtitle = "UI library demo  v1.0",
	Size = Vector2.new(720, 460),
	ToggleKey = Enum.KeyCode.RightShift,
})

---------------------------------------------------------------------
-- CATEGORY 1: Main
---------------------------------------------------------------------
local Main = Window:AddCategory("Main")

-- Tab with SUB TABS ---------------------------------------------------
local Player = Main:AddTab("Player")

local Movement = Player:AddSubTab("Movement")
do
	local speed = Movement:AddSection("Speed", "Left")
	speed:AddToggle({
		Name = "Enable Speed", Flag = "SpeedEnabled", Default = false,
		Callback = function(v) print("Speed enabled:", v) end,
	})
	speed:AddSlider({
		Name = "Walk Speed", Flag = "WalkSpeed", Min = 16, Max = 120, Default = 16, Increment = 1, Suffix = " st/s",
		Callback = function(v) print("Walk speed:", v) end,
	})
	speed:AddSlider({
		Name = "Jump Power", Flag = "JumpPower", Min = 50, Max = 250, Default = 50, Increment = 5,
		Callback = function(v) print("Jump power:", v) end,
	})

	-- Sub section nested inside a section
	local adv = speed:AddSubSection("Advanced")
	adv:AddDropdown({
		Name = "Speed Mode", Flag = "SpeedMode", Options = { "Normal", "Smooth", "Burst" }, Default = "Normal",
		Callback = function(v) print("Speed mode:", v) end,
	})
	adv:AddSlider({ Name = "Smoothing", Flag = "Smoothing", Min = 0, Max = 1, Default = 0.25, Increment = 0.05 })

	local fly = Movement:AddSection("Flight", "Right")
	fly:AddToggle({ Name = "Enable Flight", Flag = "FlyEnabled", Callback = function(v) print("Flight:", v) end })
	fly:AddKeybind({
		Name = "Flight Key", Default = Enum.KeyCode.F,
		Callback = function() print("Flight key pressed") end,
		Changed = function(k) print("Flight key bound to", k and k.Name or "None") end,
	})
	fly:AddSlider({ Name = "Flight Speed", Flag = "FlySpeed", Min = 10, Max = 200, Default = 60, Increment = 5 })
	fly:AddDivider()
	fly:AddLabel("Flight uses the keybind above to toggle.")
end

local Character = Player:AddSubTab("Character")
do
	local body = Character:AddSection("Body", "Left")
	body:AddToggle({ Name = "Infinite Jump", Flag = "InfJump" })
	body:AddToggle({ Name = "No Clip", Flag = "NoClip" })
	body:AddSlider({ Name = "Gravity", Flag = "Gravity", Min = 50, Max = 300, Default = 196, Increment = 2 })

	local look = Character:AddSection("Appearance", "Right")
	look:AddDropdown({
		Name = "Accessories", Flag = "Accessories", Multi = true,
		Options = { "Hat", "Glasses", "Wings", "Backpack", "Cape" }, Default = { "Hat" },
		Callback = function(list) print("Accessories:", table.concat(list, ", ")) end,
	})
	look:AddTextbox({
		Name = "Display Name", Flag = "DisplayName", Placeholder = "Enter name...",
		Callback = function(text, enter) print("Display name:", text, enter) end,
	})
	look:AddButton({
		Name = "Reset Character",
		Callback = function()
			Window:Notify({ Title = "Character", Content = "Character reset requested.", Duration = 3 })
		end,
	})
end

local Teleport = Player:AddSubTab("Teleport")
do
	local spots = Teleport:AddSection("Locations", "Left")
	local chosen
	local dd = spots:AddDropdown({
		Name = "Destination", Flag = "Destination", Options = { "Spawn", "Shop", "Arena", "Secret Room" },
		Callback = function(v) chosen = v end,
	})
	spots:AddButton({
		Name = "Teleport",
		Callback = function()
			Window:Notify({ Title = "Teleport", Content = "Going to: " .. tostring(chosen or "nowhere"), Duration = 3 })
		end,
	})
	spots:AddButton({
		Name = "Refresh Locations",
		Callback = function() dd:Refresh({ "Spawn", "Shop", "Arena", "Secret Room", "Rooftop" }) end,
	})

	local info = Teleport:AddSection("Info", "Right")
	info:AddParagraph({
		Title = "How it works",
		Content = "Pick a destination from the dropdown and press Teleport. Use Refresh to reload the list of locations.",
	})
end

-- Tab with SUB TABS (second one) --------------------------------------
local Combat = Main:AddTab("Combat")

local Aim = Combat:AddSubTab("Aim Assist")
do
	local core = Aim:AddSection("Core", "Left")
	core:AddToggle({ Name = "Enabled", Flag = "AimEnabled" })
	core:AddKeybind({ Name = "Aim Key", Default = Enum.KeyCode.E })
	core:AddDropdown({ Name = "Target Part", Flag = "AimPart", Options = { "Head", "Torso", "Random" }, Default = "Head" })

	local fov = Aim:AddSection("Field of View", "Right")
	fov:AddToggle({ Name = "Show FOV Circle", Flag = "ShowFov", Default = true })
	fov:AddSlider({ Name = "FOV Radius", Flag = "FovRadius", Min = 30, Max = 500, Default = 150, Increment = 5, Suffix = " px" })

	local sub = fov:AddSubSection("Filters")
	sub:AddToggle({ Name = "Team Check", Flag = "TeamCheck", Default = true })
	sub:AddToggle({ Name = "Visible Only", Flag = "VisibleOnly" })
end

local Misc = Combat:AddSubTab("Extras")
do
	local s = Misc:AddSection("Extras", "Left")
	s:AddToggle({ Name = "Auto Click", Flag = "AutoClick" })
	s:AddSlider({ Name = "Click Delay", Flag = "ClickDelay", Min = 0.01, Max = 1, Default = 0.1, Increment = 0.01, Suffix = "s" })
end

-- Tab WITHOUT sub tabs (sections directly) ----------------------------
local Home = Main:AddTab("Home")
do
	local welcome = Home:AddSection("Welcome", "Left")
	welcome:AddParagraph({
		Title = "CrimsonUI Demo",
		Content = "Categories on the left group your tabs. Tabs can hold sections directly, or sub tabs that each hold their own sections.",
	})
	welcome:AddButton({
		Name = "Show Notification",
		Callback = function()
			Window:Notify({ Title = "Hello!", Content = "Notifications slide in from the corner.", Duration = 4 })
		end,
	})

	local tips = Home:AddSection("Tips", "Right")
	tips:AddLabel("• Press RightShift to hide / show the window")
	tips:AddLabel("• Use the search bar to filter controls and tabs")
	tips:AddLabel("• Click a section header to collapse it")
end

---------------------------------------------------------------------
-- CATEGORY 2: Visuals
---------------------------------------------------------------------
local Visuals = Window:AddCategory("Visuals")

local ESP = Visuals:AddTab("ESP")

local Players = ESP:AddSubTab("Players")
do
	local box = Players:AddSection("Boxes", "Left")
	box:AddToggle({ Name = "Box ESP", Flag = "BoxEsp" })
	box:AddDropdown({ Name = "Box Style", Flag = "BoxStyle", Options = { "2D", "Corner", "3D" }, Default = "2D" })
	box:AddToggle({ Name = "Filled", Flag = "BoxFilled" })

	local text = Players:AddSection("Labels", "Right")
	text:AddToggle({ Name = "Names", Flag = "EspNames", Default = true })
	text:AddToggle({ Name = "Health Bar", Flag = "EspHealth" })
	text:AddToggle({ Name = "Distance", Flag = "EspDistance" })
	text:AddSlider({ Name = "Max Distance", Flag = "EspMaxDist", Min = 100, Max = 3000, Default = 1000, Increment = 50, Suffix = " st" })
end

local Objects = ESP:AddSubTab("Objects")
do
	local s = Objects:AddSection("Items", "Left")
	s:AddToggle({ Name = "Item ESP", Flag = "ItemEsp" })
	s:AddDropdown({
		Name = "Item Types", Flag = "ItemTypes", Multi = true,
		Options = { "Weapons", "Health", "Ammo", "Keys", "Chests" },
	})
end

local World = Visuals:AddTab("World")

local Lighting = World:AddSubTab("Lighting")
do
	local s = Lighting:AddSection("Lighting", "Left")
	s:AddSlider({ Name = "Brightness", Flag = "Brightness", Min = 0, Max = 5, Default = 2, Increment = 0.1 })
	s:AddSlider({ Name = "Time of Day", Flag = "ClockTime", Min = 0, Max = 24, Default = 14, Increment = 0.5, Suffix = "h" })
	s:AddToggle({ Name = "Remove Fog", Flag = "NoFog" })
end

local Camera = World:AddSubTab("Camera")
do
	local s = Camera:AddSection("Camera", "Left")
	s:AddSlider({ Name = "Field of View", Flag = "CamFov", Min = 40, Max = 120, Default = 70, Increment = 1 })
	s:AddToggle({ Name = "Third Person", Flag = "ThirdPerson" })
	s:AddKeybind({ Name = "Zoom Key", Default = Enum.KeyCode.Z })
end

---------------------------------------------------------------------
-- CATEGORY 3: Settings
---------------------------------------------------------------------
local Settings = Window:AddCategory("Settings")

local UI = Settings:AddTab("Interface")
do
	local s = UI:AddSection("Window", "Left")
	s:AddKeybind({
		Name = "Toggle UI", Default = Enum.KeyCode.RightShift,
		Changed = function(k) print("Note: set ToggleKey in CreateWindow to change the real hotkey ->", k and k.Name) end,
	})
	s:AddButton({ Name = "Minimize", Callback = function() Window:Minimize() end })
	s:AddButton({ Name = "Print All Flags", Callback = function()
		for flag, value in pairs(Library.Flags) do
			print(flag, typeof(value) == "table" and table.concat(value, ", ") or tostring(value))
		end
	end })

	local d = UI:AddSection("Danger Zone", "Right")
	d:AddButton({
		Name = "Unload UI",
		Callback = function()
			Window:Notify({ Title = "Goodbye", Content = "Unloading CrimsonUI...", Duration = 2 })
			task.wait(1)
			Window:Destroy()
		end,
	})
end

Window:Notify({ Title = "Crimson Hub", Content = "Demo loaded. Press RightShift to toggle.", Duration = 5 })
