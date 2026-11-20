-- AutoBounty Loader

local ScriptURL = "https://raw.githubusercontent.com/ghimireaniket31-max/Scripts/refs/heads/main/Games/Autobounty.luau"

local Success, Error = pcall(function()
    local Script = game:HttpGet(ScriptURL)
    loadstring(Script)()
end)

if not Success then
    warn("[AutoBounty Loader] Failed to load: " .. tostring(Error))
else
    print("[AutoBounty Loader] Successfully loaded!")
end
