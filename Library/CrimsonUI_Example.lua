-- Example usage. Paste CrimsonUI.lua into a ModuleScript (or host it) and load it:
-- local Library = require(path.to.CrimsonUI)
-- local Library = loadstring(game:HttpGet("YOUR_RAW_URL/CrimsonUI.lua"))()

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/ghimireaniket31-max/Scripts/refs/heads/main/Library/crimsonui.lua"))()

local Window = Library:CreateWindow({
	Title = "Crimson Hub",
	Subtitle = "Controls, tabs, groups",
	Size = Vector2.new(700, 440),
	ToggleKey = Enum.KeyCode.RightShift, -- also toggles minimize/restore
})

-- Sidebar category -> tabs
local Core = Window:AddCategory("Core")
local Settings = Core:AddTab("Config")
local Main = Core:AddTab("Main")

-- Tab with sub tabs (shown as a bar at the top of the tab)
local General = Main:AddSubTab("General")
local Extra = Main:AddSubTab("Extra")

-- Sections (two columns, auto-balanced)
local s1 = General:AddSection("Section One")
s1:AddToggle({ Name = "Enable Feature", Default = true, Flag = "feature", Callback = function(v) print("Feature:", v) end })
s1:AddSlider({ Name = "Speed", Min = 0, Max = 100, Default = 25, Suffix = "%", Callback = function(v) print("Speed:", v) end })
s1:AddDropdown({ Name = "Mode", Options = { "Normal", "Fast", "Slow" }, Default = "Normal", Callback = print })
s1:AddButton({ Name = "Notify me", Callback = function()
	Library:Notify({ Title = "Crimson Hub", Content = "Button pressed!", Duration = 3 })
end })

-- Sub section inside a section
local sub = s1:AddSubSection("Advanced")
sub:AddToggle({ Name = "Debug Mode", Callback = print })
sub:AddTextbox({ Name = "Name", Placeholder = "type...", Callback = function(t) print("Text:", t) end })
sub:AddKeybind({ Name = "Action Key", Default = Enum.KeyCode.E, Callback = function() print("Key pressed") end })

local s2 = General:AddSection("Section Two")
s2:AddParagraph({ Title = "About", Content = "Red shiny UI with sub tabs, sub sections, minimize pill and animations." })
s2:AddDropdown({ Name = "Multi Select", Options = { "A", "B", "C", "D" }, Multi = true, Default = { "A" }, Callback = print })

local s3 = Extra:AddSection("Extra Section")
s3:AddLabel("This is the second sub tab.")
s3:AddToggle({ Name = "Another Toggle", Callback = print })

-- Another category
local Prog = Window:AddCategory("Progression")
local Quests = Prog:AddTab("Quests")
Quests:AddSection("Quests"):AddButton({ Name = "Hello", Callback = function() print("hi") end })

Library:Notify({ Title = "Loaded", Content = "Crimson UI ready. Press RightShift to minimize.", Duration = 4 })
