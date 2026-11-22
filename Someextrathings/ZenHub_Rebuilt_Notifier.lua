--[[
    Zen Hub - Blox Fruits Event Notifier
    Rebuilt from the supplied deobfuscated file.

    Setup:
      1. Add your own Discord webhook URLs below.
      2. Run this in a Roblox executor that supports getgenv() and request().
      3. Keep the script running while you play.

    Security:
      - Do not paste someone else's webhook URL here.
      - Webhook URLs are credentials. Keep this file private.
      - Role mentions are disabled by default.
]]

local ENV = (getgenv and getgenv()) or _G

local Config = {
    Webhooks = {
        FruitSpawned = "",       -- Discord webhook URL
        BossSpawned = "",
        MirageIsland = "",
        FullMoon = "",
        KitsuneIsland = "",
        FrozenDimension = "",
        MasterOfEnhancement = "",
    },

    -- Set true only if you intentionally want Discord role/user pings.
    EnableMentions = false,
    Mentions = {
        FruitSpawned = "",
        BossSpawned = "",
        MirageIsland = "",
        FullMoon = "",
        KitsuneIsland = "",
        FrozenDimension = "",
        MasterOfEnhancement = "",
    },

    PollInterval = 10,
    SendStartupMessage = false,
    Debug = true,
}

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")

local PLACE_WORLDS = {
    [2753915549] = "World 1",
    [4442272183] = "World 2",
    [7449423635] = "World 3",
}

local MOON_TEXTURES = {
    ["http://www.roblox.com/asset/?id=9709149680"] = 1,
    ["http://www.roblox.com/asset/?id=9709150086"] = 2,
    ["http://www.roblox.com/asset/?id=9709139597"] = 3,
    ["http://www.roblox.com/asset/?id=9709135895"] = 4,
    ["http://www.roblox.com/asset/?id=9709150401"] = 5,
    ["http://www.roblox.com/asset/?id=9709143733"] = 6,
    ["http://www.roblox.com/asset/?id=9709149052"] = 7,
    ["http://www.roblox.com/asset/?id=9709149431"] = 8,
}

local MOON_EMOJI = {
    [1] = "🌑", [2] = "🌒", [3] = "🌓", [4] = "🌔",
    [5] = "🌕", [6] = "🌖", [7] = "🌗", [8] = "🌘",
}

local lastSent = {}
local running = true

local function log(...)
    if Config.Debug then
        print("[Zen Hub Notifier]", ...)
    end
end

local function getRequestFunction()
    return ENV.request or ENV.http_request or request
end

local function getWorld()
    return PLACE_WORLDS[game.PlaceId] or ("Unknown Place (" .. tostring(game.PlaceId) .. ")")
end

local function getPlayerCount()
    return #Players:GetPlayers()
end

local function getServerJoinInfo()
    return string.format(
        "PlaceId: %s\nJobId: %s",
        tostring(game.PlaceId),
        tostring(game.JobId)
    )
end

local function getWebhook(eventName)
    local url = Config.Webhooks[eventName]
    if type(url) == "string" and url:match("^https://discord%.com/api/webhooks/") then
        return url
    end
    return nil
end

local function postWebhook(eventName, description, fields)
    local url = getWebhook(eventName)
    if not url then
        return
    end

    local req = getRequestFunction()
    if type(req) ~= "function" then
        warn("[Zen Hub Notifier] No supported HTTP request function found.")
        return
    end

    local embed = {
        title = "Zen Hub | " .. eventName,
        description = description,
        color = 255,
        fields = fields or {},
        footer = { text = "Blox Fruits Event Notifier" },
        timestamp = DateTime.now():ToIsoDate(),
    }

    local payload = {
        username = "Zen Hub",
        embeds = { embed },
    }

    if Config.EnableMentions then
        local mention = Config.Mentions[eventName]
        if type(mention) == "string" and mention ~= "" then
            payload.content = mention
        end
    end

    local ok, response = pcall(function()
        return req({
            Url = url,
            URL = url,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = HttpService:JSONEncode(payload),
        })
    end)

    if not ok then
        warn("[Zen Hub Notifier] Webhook failed for " .. eventName .. ": " .. tostring(response))
    else
        log("Sent event:", eventName)
    end
end

local function makeFields(extraFields)
    local fields = {
        { name = "World", value = getWorld(), inline = true },
        { name = "Players", value = tostring(getPlayerCount()) .. "/12", inline = true },
        { name = "Server", value = getServerJoinInfo(), inline = false },
    }

    for _, field in ipairs(extraFields or {}) do
        table.insert(fields, field)
    end

    return fields
end

local function sendOnce(eventKey, eventName, description, extraFields)
    if lastSent[eventKey] then
        return
    end
    lastSent[eventKey] = true
    postWebhook(eventName, description, makeFields(extraFields))
end

local function resetWhenGone(eventKey, condition)
    if not condition then
        lastSent[eventKey] = nil
    end
end

local function findLocationsFolder()
    local worldOrigin = Workspace:FindFirstChild("_WorldOrigin")
    return worldOrigin and worldOrigin:FindFirstChild("Locations")
end

local function hasLocation(locationName)
    local locations = findLocationsFolder()
    return locations ~= nil and locations:FindFirstChild(locationName) ~= nil
end

local function getMoonInfo()
    local sky = Lighting:FindFirstChildOfClass("Sky") or Lighting:FindFirstChild("Sky")
    if not sky then
        return nil, nil
    end

    local texture = sky.MoonTextureId
    local phase = MOON_TEXTURES[texture]
    if not phase then
        -- Asset IDs may be represented with a different URL prefix.
        local id = tostring(texture):match("id=(%d+)")
        if id then
            for knownTexture, knownPhase in pairs(MOON_TEXTURES) do
                if knownTexture:match("id=(%d+)") == id then
                    phase = knownPhase
                    break
                end
            end
        end
    end

    return phase, MOON_EMOJI[phase]
end

local function scanFruit()
    local containers = {
        Workspace,
        Players.LocalPlayer and Players.LocalPlayer:FindFirstChild("Backpack"),
    }

    for _, container in ipairs(containers) do
        if container then
            for _, item in ipairs(container:GetChildren()) do
                if item:IsA("Tool") and item.Name:lower():find("fruit", 1, true) then
                    return item.Name
                end
            end
        end
    end
    return nil
end

local function scanBosses()
    local found = {}
    local folders = {
        ReplicatedStorage,
        Workspace:FindFirstChild("Enemies"),
        Workspace:FindFirstChild("NPCs"),
    }

    for _, folder in ipairs(folders) do
        if folder then
            for _, item in ipairs(folder:GetChildren()) do
                local name = item.Name
                if name:lower():find("boss", 1, true) or name:lower():find("beautiful pirate", 1, true)
                    or name:lower():find("rip_indra", 1, true) or name:lower():find(" dough king", 1, true) then
                    table.insert(found, name)
                end
            end
        end
    end

    table.sort(found)
    return found
end

local function hasMasterOfEnhancement()
    local npcs = Workspace:FindFirstChild("NPCs")
    return npcs ~= nil and npcs:FindFirstChild("Master of Enhancement") ~= nil
end

local function monitor()
    local fruit = scanFruit()
    if fruit then
        sendOnce("fruit:" .. fruit, "FruitSpawned", "A fruit tool was detected.", {
            { name = "Fruit", value = fruit, inline = true },
        })
    end

    local bosses = scanBosses()
    local bossKey = table.concat(bosses, "|")
    if #bosses > 0 then
        sendOnce("bosses:" .. bossKey, "BossSpawned", "A boss-related model was detected.", {
            { name = "Detected", value = table.concat(bosses, ", "), inline = false },
        })
    else
        for key in pairs(lastSent) do
            if key:sub(1, 7) == "bosses:" then
                lastSent[key] = nil
            end
        end
    end

    local mirage = hasLocation("Mirage Island")
    if mirage then
        sendOnce("mirage", "MirageIsland", "Mirage Island has appeared.")
    else
        resetWhenGone("mirage", false)
    end

    local kitsune = hasLocation("Kitsune Island")
    if kitsune then
        sendOnce("kitsune", "KitsuneIsland", "Kitsune Island has appeared.")
    else
        resetWhenGone("kitsune", false)
    end

    local frozen = hasLocation("Frozen Dimension")
    if frozen then
        sendOnce("frozen", "FrozenDimension", "Frozen Dimension has appeared.")
    else
        resetWhenGone("frozen", false)
    end

    local master = hasMasterOfEnhancement()
    if master then
        sendOnce("master", "MasterOfEnhancement", "Master of Enhancement was detected.")
    else
        resetWhenGone("master", false)
    end

    local phase, emoji = getMoonInfo()
    local fullMoon = phase == 5
    if fullMoon then
        sendOnce("fullmoon", "FullMoon", "Full Moon detected.", {
            { name = "Moon Phase", value = (emoji or "🌕") .. " Full Moon", inline = true },
        })
    else
        resetWhenGone("fullmoon", false)
    end
end

if not PLACE_WORLDS[game.PlaceId] then
    warn("[Zen Hub Notifier] This place ID is not a recognized Blox Fruits world.")
end

if Config.SendStartupMessage then
    postWebhook("Startup", "Notifier started.", makeFields())
end

log("Started in", getWorld(), "| polling every", Config.PollInterval, "seconds")

while running do
    local ok, err = pcall(monitor)
    if not ok then
        warn("[Zen Hub Notifier] Monitor error: " .. tostring(err))
    end
    task.wait(math.max(3, tonumber(Config.PollInterval) or 10))
end
