-- Ken Hub direct loader
-- Fetches and runs the Ken Hub UI script directly (no separate loader window).

local URL = "https://api.aurorax.site/files/v5/loaders/babc9729b2fce8d6a321d6968cf502b3"

local ok, err = pcall(function()
    local source = game:HttpGet(URL)
    assert(type(source) == "string" and #source > 0, "Loader URL returned an empty response")

    local chunk, compileError = loadstring(source)
    assert(type(chunk) == "function", compileError or "Could not compile Loader.luau")

    chunk()
end)

if not ok then
    warn("[Ken Hub] Failed to load UI: " .. tostring(err))
end
