# # sacred code   
  
local function __run()  
    -- Lee la config del usuario desde getgenv().SacredBountyConfig  
    -- Si el usuario no la define, usa estos valores por defecto  
    local _user = getgenv and getgenv().SacredBountyConfig or {}  
    local CONFIG = {  
        Team           = _user.Team           or 'Pirates',  
        Weapon         = _user.Weapon         or 'Melee',  
        MinLevel       = _user.MinLevel       or 100,  
        NoHitTimeout   = _user.NoHitTimeout   or 15,  
        HopMinPlayers  = _user.HopMinPlayers  or 6,  
        HopMaxPlayers  = _user.HopMaxPlayers  or 10,  
        HopRegion      = _user.HopRegion,  
        HopFallbackAny = (_user.HopFallbackAny ~= nil) and _user.HopFallbackAny or true,  
        MaxServerTime  = _user.MaxServerTime  or 0,  
        Theme          = _user.Theme          or 'Default',  
    }  
    local Players = game:GetService('Players')  
    local ReplicatedStorage = game:GetService('ReplicatedStorage')  
    local RunService = game:GetService('RunService')  
    local HttpService = game:GetService('HttpService')  
    local TweenService = game:GetService('TweenService')  
    local VIM = game:GetService('VirtualInputManager')  
    local player = Players.LocalPlayer  
    local UP_SPEED = 1e35  
    local orbitSpeed = 500  
    local angle = 0  
    local State = {  
        active = false,  
        enabledCielo = false,  
        autoHaki = false,  
        respawnAbuse = false,  
        lastHitTime = os.clock(),  
        lastZTime = 0,  
        serverJoinTime = os.clock(),  
        sessionEarned = 0,  
        startBounty = 0,  
        currentBounty = 0,  
        kills = 0,  
        status = 'Esperando fraccion...',  
        factionOK = false,  
    }  
  
    local function fmt(n)  
        if not n then  
            return '0'  
        end  
  
        n = math.floor(n)  
  
        if n >= 1e9 then  
            return string.format('%.2fB', n / 1e9)  
        elseif n >= 1e6 then  
            return string.format('%.2fM', n / 1e6)  
        elseif n >= 1e3 then  
            return string.format('%.1fK', n / 1e3)  
        end  
  
        return tostring(n)  
    end  
    local function getBounty()  
        local val = 0  
  
        pcall(function()  
            local d = player:FindFirstChild('Data')  
  
            if d then  
                local b = d:FindFirstChild('Bounty') or d:FindFirstChild('Honor') or d:FindFirstChild('Rep')  
  
                if b and type(b.Value) == 'number' then  
                    val = b.Value  
  
                    return  
                end  
            end  
  
            local ls = player:FindFirstChild('leaderstats')  
  
            if ls then  
                local b = ls:FindFirstChild('Bounty/Honor') or ls:FindFirstChild('Bounty') or ls:FindFirstChild('Honor')  
  
                if b and type(b.Value) == 'number' then  
                    val = b.Value  
                end  
            end  
        end)  
  
        return val  
    end  
  
    local SAVE_FILE = 'zbounty_save.json'  
  
    local function saveData()  
        pcall(function()  
            writefile(SAVE_FILE, HttpService:JSONEncode({  
                sessionEarned = State.sessionEarned,  
                startBounty = State.startBounty,  
                kills = State.kills,  
            }))  
        end)  
    end  
    local function loadData()  
        pcall(function()  
            if isfile and isfile(SAVE_FILE) then  
                local d = HttpService:JSONDecode(readfile(SAVE_FILE))  
  
                if d then  
                    State.sessionEarned = d.sessionEarned or 0  
                    State.startBounty = d.startBounty or getBounty()  
                    State.kills = d.kills or 0  
  
                    return  
                end  
            end  
  
            State.startBounty = getBounty()  
        end)  
    end  
    local function findChooseTeam()  
        for _, gui in ipairs(player.PlayerGui:GetChildren())do  
            local ct = gui:FindFirstChild('ChooseTeam', true)  
  
            if ct then  
                return ct  
            end  
        end  
  
        return nil  
    end  
    local function hasValidTargets()  
        for _, pl in pairs(Players:GetPlayers())do  
            if pl ~= player then  
                local level = 0  
  
                pcall(function()  
                    local d = pl:FindFirstChild('Data')  
  
                    if d then  
                        local lv = d:FindFirstChild('Level')  
  
                        if lv then  
                            level = lv.Value  
                        end  
                    end  
                end)  
  
                if level >= CONFIG.MinLevel then  
                    return true  
                end  
            end  
        end  
  
        return false  
    end  
    local function selectFaction(faction)  
        pcall(function()  
            local remotes = ReplicatedStorage:FindFirstChild('Remotes')  
  
            if not remotes then  
                return  
            end  
  
            local activity = remotes:FindFirstChild('RE/OnEventServiceActivity')  
            local commF = remotes:FindFirstChild('CommF_')  
  
            if not activity or not commF then  
                for _, v in pairs(ReplicatedStorage:GetDescendants())do  
                    if v:IsA('RemoteEvent') and v.Name == 'RE/OnEventServiceActivity' then  
                        activity = v  
                    end  
                    if v:IsA('RemoteFunction') and v.Name == 'CommF_' then  
                        commF = v  
                    end  
                end  
            end  
            if activity then  
                activity:FireServer('TeamSelect/Team/' .. faction)  
            end  
  
            task.wait(0.05)  
  
            if commF then  
                commF:InvokeServer('SetTeam', faction)  
            end  
        end)  
    end  
  
    local _place = game.PlaceId  
    local _id = game.JobId  
    local browser = ReplicatedStorage:FindFirstChild('__ServerBrowser')  
  
    local _isHopping = false  
    local _lastHopTime = 0  
    local HOP_COOLDOWN = 8  -- segundos minimos entre hops  
  
    local function Hop()  
        -- Evitar teleport doble  
        if _isHopping then return false end  
        -- Cooldown entre hops para evitar IsTeleporting error  
        if os.clock() - _lastHopTime < HOP_COOLDOWN then return false end  
        _isHopping = true  
        _lastHopTime = os.clock()  
  
        -- Auto-reset por si el teleport se queda colgado  
        task.delay(12, function()  
            _isHopping = false  
        end)  
  
        State.respawnAbuse = false  
        State.enabledCielo = false  
  
        local allServers = {}  
        local foundData = false  
        local pendingCount = 0  
  
        for page = 1, 100 do  
            if foundData then  
                break  
            end  
  
            pendingCount += 1  
  
            task.spawn(function()  
                local ok, result = pcall(function()  
                    return browser:InvokeServer(page)  
                end)  
  
                if ok and type(result) == 'table' then  
                    local valid = 0  
  
                    for uuid, info in pairs(result)do  
                        if type(info) == 'table' and info.Count then  
                            allServers[uuid] = info  
  
                            valid += 1  
                        end  
                    end  
  
                    if valid > 0 and not foundData then  
                        foundData = true  
  
                        print('[ZBounty] ServerBrowser: ' .. valid .. ' servers')  
                    end  
                end  
  
                pendingCount -= 1  
            end)  
        end  
  
        local waited = 0  
  
        while pendingCount > 0 and waited < 6 do  
            task.wait(0.2)  
  
            waited += 0.2  
  
            if foundData and waited > 1 then  
                break  
            end  
        end  
  
        local apiServers = {}  
  
        if not foundData then  
            for _, ord in ipairs({  
                'Desc',  
                'Asc',  
            })do  
                pcall(function()  
                    local r = HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. _place .. '/servers/Public?sortOrder=' .. ord .. '&limit=100'))  
  
                    if r and r.data then  
                        for _, sv in ipairs(r.data)do  
                            table.insert(apiServers, sv)  
                        end  
                    end  
                end)  
            end  
  
            if #apiServers == 0 then  
                return false  
            end  
        end  
  
        local seen, matched, anyValid = {}, {}, {}  
  
        if foundData then  
            for uuid, info in pairs(allServers)do  
                if uuid ~= _id then  
                    local count = info.Count or 0  
                    local bounty = info.Bounty or 0  
                    local region = info.Region or ''  
                    local entry = {  
                        uuid = uuid,  
                        count = count,  
                        bounty = bounty,  
                        region = region,  
                    }  
  
                    table.insert(anyValid, entry)  
  
                    local ok2 = true  
  
                    if CONFIG.HopMinPlayers and count < CONFIG.HopMinPlayers then  
                        ok2 = false  
                    end  
                    if CONFIG.HopMaxPlayers and count > CONFIG.HopMaxPlayers then  
                        ok2 = false  
                    end  
                    if CONFIG.HopRegion and CONFIG.HopRegion ~= '' then  
                        if not string.find(string.lower(region), string.lower(CONFIG.HopRegion), 1, true) then  
                            ok2 = false  
                        end  
                    end  
                    if ok2 then  
                        table.insert(matched, entry)  
                    end  
                end  
            end  
        else  
            for _, sv in ipairs(apiServers)do  
                if sv.id and sv.id ~= _id and not seen[sv.id] and sv.playing and sv.maxPlayers and sv.playing < sv.maxPlayers then  
                    seen[sv.id] = true  
  
                    local entry = {  
                        uuid = sv.id,  
                        count = sv.playing,  
                        bounty = 0,  
                        region = '?',  
                    }  
  
                    table.insert(anyValid, entry)  
  
                    local ok2 = true  
  
                    if CONFIG.HopMinPlayers and sv.playing < CONFIG.HopMinPlayers then  
                        ok2 = false  
                    end  
                    if CONFIG.HopMaxPlayers and sv.playing > CONFIG.HopMaxPlayers then  
                        ok2 = false  
                    end  
                    if ok2 then  
                        table.insert(matched, entry)  
                    end  
                end  
            end  
        end  
        if #matched == 0 then  
            if not CONFIG.HopFallbackAny or #anyValid == 0 then  
                return false  
            end  
  
            matched = anyValid  
        end  
  
        table.sort(matched, function(a, b)  
            return a.count > b.count  
        end)  
  
        local chosen = matched[math.random(1, math.min(10, #matched))]  
  
        print(string.format('[ZBounty] Hop → %d jugadores | region=%s', chosen.count, chosen.region))  
  
        local ok, err = pcall(function()  
            browser:InvokeServer('teleport', chosen.uuid)  
        end)  
  
        print('[ZBounty] Hop: ok=' .. tostring(ok))  
  
        if not ok then  
            -- Teleport fallo — liberar flag para poder reintentar  
            _isHopping = false  
            _lastHopTime = os.clock() - HOP_COOLDOWN + 3  -- esperar 3s antes del siguiente intento  
        end  
        -- Si ok=true el juego nos teleporta — el auto-reset de 12s cubre si algo falla  
  
        return ok  
    end  
  
    local CommF_ = ReplicatedStorage:WaitForChild('Remotes'):WaitForChild('CommF_')  
  
    local function down(key)  
        pcall(function()  
            local hrp = player.Character and player.Character:FindFirstChild('HumanoidRootPart')  
  
            if not hrp then  
                return  
            end  
  
            VIM:SendKeyEvent(true, key, false, hrp)  
            task.wait(0.15)  
            VIM:SendKeyEvent(false, key, false, hrp)  
        end)  
    end  
    local function equip(tooltip)  
        if not tooltip then  
            return  
        end  
  
        pcall(function()  
            local char = player.Character or player.CharacterAdded:Wait()  
            local hum = char:FindFirstChildOfClass('Humanoid')  
  
            if not hum then  
                return  
            end  
  
            for _, tool in pairs(player.Backpack:GetChildren())do  
                if tool:IsA('Tool') and tool.ToolTip == tooltip then  
                    if not hum:IsDescendantOf(tool) then  
                        hum:EquipTool(tool)  
  
                        return  
                    end  
                end  
            end  
        end)  
    end  
    local function buso()  
        pcall(function()  
            CommF_:InvokeServer('Buso')  
        end)  
    end  
  
    task.spawn(function()  
        while task.wait(0.5) do  
            if State.autoHaki then  
                buso()  
            end  
        end  
    end)  
    task.spawn(function()  
        while task.wait() do  
            if not State.respawnAbuse then  
                continue  
            end  
  
            local char = player.Character  
            local root = char and char:FindFirstChild('HumanoidRootPart')  
  
            if root then  
                angle += math.rad(orbitSpeed)  
  
                root.CFrame = root.CFrame * CFrame.new(math.cos(angle) * 3, 0, math.sin(angle) * 3)  
            end  
            if State.autoHaki then  
                buso()  
            end  
            if CONFIG.Weapon == 'funcion' then  
                equip('Sword')  
                task.wait(0.15)  
                down('Z')  
  
                State.lastZTime = os.clock()  
  
                task.wait(0.3)  
                equip('Melee')  
                task.wait(0.15)  
                down('Z')  
  
                State.lastZTime = os.clock()  
  
                task.wait(0.3)  
            else  
                equip(CONFIG.Weapon)  
                task.wait(0.15)  
                down('Z')  
  
                State.lastZTime = os.clock()  
  
                task.wait(0.5)  
            end  
            if char and char:FindFirstChild('Humanoid') then  
                char.Humanoid.Health = 0  
            end  
  
            player.CharacterAdded:Wait()  
            task.wait(0.5)  
        end  
    end)  
    RunService.RenderStepped:Connect(function(dt)  
        if not State.enabledCielo then  
            return  
        end  
  
        local root = player.Character and player.Character:FindFirstChild('HumanoidRootPart')  
  
        if root then  
            root.CFrame = root.CFrame + Vector3.new(0, UP_SPEED * dt, 0)  
        end  
    end)  
    pcall(function()  
        local CommE = ReplicatedStorage:WaitForChild('Remotes', 5):WaitForChild('CommE', 5)  
  
        CommE.OnClientEvent:Connect(function(event, ...)  
            if not State.active then  
                return  
            end  
            if event ~= 'Notify' then  
                return  
            end  
  
            local msg = select(1, ...) or ''  
  
            if msg:find('Bounty<Color=/> from') or msg:find('Honor<Color=/> from') then  
                local earned = tonumber(string.match(msg, '>(%d+)')) or 0  
  
                State.sessionEarned += earned  
                State.kills += 1  
  
                State.lastHitTime = os.clock()  
                State.currentBounty = getBounty()  
  
                saveData()  
            end  
        end)  
    end)  
  
    local function getEquipped()  
        local char = player.Character  
  
        if not char then  
            return nil  
        end  
  
        for _, tool in ipairs(char:GetChildren())do  
            if tool:IsA('Tool') then  
                return tool  
            end  
        end  
  
        return nil  
    end  
    local function watchPlayer(p)  
        if p == player then  
            return  
        end  
  
        local function watchEnemy(char, name)  
            local hum = char:FindFirstChildOfClass('Humanoid')  
  
            if not hum then  
                return  
            end  
  
            local last = hum.Health  
  
            hum:GetPropertyChangedSignal('Health'):Connect(function()  
                local now = hum.Health  
                local delta = last - now  
  
                last = now  
  
                -- Solo resetear si nosotros causamos el daño:  
                -- 1) Bajada de vida real (no regen)  
                -- 2) Tenemos tool equipada  
                -- 3) El creator tag del Humanoid apunta a nosotros  
                if delta > 1 and State.active then  
                    local equipped = getEquipped()  
  
                    if equipped then  
                        -- Verificar el creator tag (Roblox lo agrega cuando alguien hace dano)  
                        local isOurDamage = false  
  
                        local creator = hum:FindFirstChild('creator')  
                        if creator and creator:IsA('ObjectValue') and creator.Value == player then  
                            isOurDamage = true  
                        end  
  
                        -- Fallback: revisar tags en el humanoid  
                        if not isOurDamage then  
                            for _, tag in ipairs(hum:GetChildren()) do  
                                if tag:IsA('ObjectValue') and tag.Value == player then  
                                    isOurDamage = true  
                                    break  
                                end  
                            end  
                        end  
  
                        if isOurDamage then  
                            State.lastHitTime = os.clock()  
                        end  
                    end  
                end  
            end)  
        end  
  
        p.CharacterAdded:Connect(function(c)  
            task.wait(0.5)  
            watchEnemy(c, p.Name)  
        end)  
  
        if p.Character then  
            watchEnemy(p.Character, p.Name)  
        end  
    end  
  
    for _, p in ipairs(Players:GetPlayers())do  
        watchPlayer(p)  
    end  
  
    Players.PlayerAdded:Connect(watchPlayer)  
  
    local _prevBounty = 0  
  
    task.spawn(function()  
        task.wait(10)  
  
        _prevBounty = getBounty()  
  
        while true do  
            task.wait(3)  
  
            if not State.active then  
                continue  
            end  
  
            local cur = getBounty()  
  
            if _prevBounty > 0 and cur < _prevBounty then  
                print('[ZBounty] Bounty perdido! \u{2192} Hopeando')  
  
                State.status = 'Bounty perdido \u{2192} Hop'  
                State.lastHitTime = os.clock() - CONFIG.NoHitTimeout - 1  
            end  
  
            _prevBounty = cur  
        end  
    end)  
    task.spawn(function()  
        while task.wait(1) do  
            if not State.active then  
                continue  
            end  
  
            -- Check tiempo maximo en el server  
            if CONFIG.MaxServerTime and CONFIG.MaxServerTime > 0 then  
                local timeInServer = os.clock() - State.serverJoinTime  
                if timeInServer >= CONFIG.MaxServerTime then  
                    print('[ZBounty] Tiempo maximo del server alcanzado (' .. CONFIG.MaxServerTime .. 's) → Hopeando')  
  
                    State.status = 'Tiempo limite → Hop'  
                    saveData()  
  
                    for attempt = 1, 5 do  
                        print('[ZBounty] Hop por tiempo, intento ' .. attempt .. '/5')  
  
                        if Hop() then  
                            break  
                        end  
  
                        task.wait(4)  
                    end  
  
                    task.wait(3)  
                    State.serverJoinTime = os.clock()  
                    State.lastHitTime = os.clock()  
                    State.status = 'Activo'  
                    continue  
                end  
            end  
  
            if not hasValidTargets() then  
                print('[ZBounty] Sin targets \u{2192} Hopeando')  
  
                State.status = 'Sin targets → Hop'  
  
                task.wait(1)  
  
                for attempt = 1, 5 do  
                    print('[ZBounty] Hop sin targets, intento ' .. attempt .. '/5')  
  
                    if Hop() then  
                        break  
                    end  
  
                    task.wait(4)  
                end  
  
                task.wait(2)  
  
                State.serverJoinTime = os.clock()  
                State.lastHitTime = os.clock()  
                State.status = 'Activo'  
  
                continue  
            end  
  
            local sinceHit = os.clock() - State.lastHitTime  
  
            if sinceHit >= CONFIG.NoHitTimeout then  
                print('[ZBounty] ' .. CONFIG.NoHitTimeout .. 's sin kill → Hopeando')  
  
                State.status = 'Hopeando...'  
  
                saveData()  
  
                local hopped = false  
  
                for attempt = 1, 5 do  
                    print('[ZBounty] Hop intento ' .. attempt .. '/5')  
  
                    hopped = Hop()  
  
                    if hopped then  
                        break  
                    end  
  
                    task.wait(4)  
                end  
  
                if hopped then  
                    task.wait(3)  
                end  
  
                State.serverJoinTime = os.clock()  
                State.lastHitTime = os.clock()  
                State.status = 'Activo'  
            end  
        end  
    end)  
  
    local guiReady = false  
    local StatusLbl, EarnedLbl, StartLbl, CurrLbl, KillLbl, TimerBar, TimerLbl, StatBadge  
  
    local function startAll()  
        loadData()  
  
        State.active = true  
        State.enabledCielo = true  
        State.autoHaki = true  
        State.respawnAbuse = true  
        State.lastHitTime = os.clock()  
        State.currentBounty = getBounty()  
        State.status = 'Activo'  
  
        print('[ZBounty] ACTIVO \u{2014} ' .. CONFIG.Team .. ' / ' .. CONFIG.Weapon)  
    end  
  
    local THEMES = {  
        Default = {  
            accent = Color3.fromRGB(210, 215, 225),  
            bg = Color3.fromRGB(9, 9, 11),  
            panel = Color3.fromRGB(14, 14, 16),  
            card = Color3.fromRGB(17, 17, 20),  
            logoTint = Color3.fromRGB(255, 255, 255),  
        },  
        Red = {  
            accent = Color3.fromRGB(230, 60, 60),  
            bg = Color3.fromRGB(14, 7, 7),  
            panel = Color3.fromRGB(18, 10, 10),  
            card = Color3.fromRGB(20, 12, 12),  
            logoTint = Color3.fromRGB(230, 80, 80),  
        },  
        Orange = {  
            accent = Color3.fromRGB(240, 130, 40),  
            bg = Color3.fromRGB(14, 10, 6),  
            panel = Color3.fromRGB(18, 13, 8),  
            card = Color3.fromRGB(20, 15, 9),  
            logoTint = Color3.fromRGB(240, 150, 60),  
        },  
        Yellow = {  
            accent = Color3.fromRGB(240, 210, 40),  
            bg = Color3.fromRGB(13, 12, 6),  
            panel = Color3.fromRGB(17, 16, 8),  
            card = Color3.fromRGB(19, 18, 9),  
            logoTint = Color3.fromRGB(240, 220, 60),  
        },  
        Green = {  
            accent = Color3.fromRGB(50, 220, 100),  
            bg = Color3.fromRGB(7, 13, 8),  
            panel = Color3.fromRGB(9, 17, 10),  
            card = Color3.fromRGB(10, 19, 12),  
            logoTint = Color3.fromRGB(60, 220, 110),  
        },  
        Cyan = {  
            accent = Color3.fromRGB(0, 190, 240),  
            bg = Color3.fromRGB(8, 10, 20),  
            panel = Color3.fromRGB(10, 13, 25),  
            card = Color3.fromRGB(12, 15, 28),  
            logoTint = Color3.fromRGB(0, 200, 255),  
        },  
        Blue = {  
            accent = Color3.fromRGB(60, 120, 255),  
            bg = Color3.fromRGB(7, 8, 18),  
            panel = Color3.fromRGB(9, 10, 22),  
            card = Color3.fromRGB(11, 12, 26),  
            logoTint = Color3.fromRGB(80, 140, 255),  
        },  
        Purple = {  
            accent = Color3.fromRGB(170, 80, 255),  
            bg = Color3.fromRGB(11, 7, 18),  
            panel = Color3.fromRGB(14, 9, 22),  
            card = Color3.fromRGB(16, 11, 26),  
            logoTint = Color3.fromRGB(180, 100, 255),  
        },  
        Pink = {  
            accent = Color3.fromRGB(240, 60, 180),  
            bg = Color3.fromRGB(14, 7, 13),  
            panel = Color3.fromRGB(18, 9, 16),  
            card = Color3.fromRGB(20, 10, 18),  
            logoTint = Color3.fromRGB(245, 80, 190),  
        },  
    }  
    local THEME = THEMES[CONFIG.Theme] or THEMES.Cyan  
    local T_ACCENT = THEME.accent  
    local T_BG = THEME.bg  
    local T_PANEL = THEME.panel  
    local T_CARD = THEME.card  
    local C = {  
        bg = T_BG,  
        panel = T_PANEL,  
        card = T_CARD,  
        border = T_ACCENT:Lerp(Color3.fromRGB(5, 5, 10), 0.75),  
        cyan = Color3.fromRGB(0, 190, 240),  
        green = Color3.fromRGB(45, 210, 110),  
        red = Color3.fromRGB(215, 60, 60),  
        gold = Color3.fromRGB(240, 185, 55),  
        text = Color3.fromRGB(220, 225, 245),  
        muted = Color3.fromRGB(90, 100, 135),  
        pirate = Color3.fromRGB(190, 50, 50),  
        marine = Color3.fromRGB(40, 110, 200),  
        discord = Color3.fromRGB(88, 101, 242),  
    }  
  
    local function addStroke(p, color, thick, trans)  
        local s = Instance.new('UIStroke', p)  
  
        s.Color = color or C.border  
        s.Thickness = thick or 1  
        s.Transparency = trans or 0  
  
        return s  
    end  
    local function mkFrame(parent, size, pos, bg, trans)  
        local f = Instance.new('Frame', parent)  
  
        f.Size = size  
        f.Position = pos or UDim2.new(0, 0, 0, 0)  
        f.BackgroundColor3 = bg or C.card  
        f.BackgroundTransparency = trans or 0  
        f.BorderSizePixel = 0  
        Instance.new('UICorner', f).CornerRadius = UDim.new(0, 8)  
  
        return f  
    end  
    local function mkLabel(parent, size, pos, text, font, textSize, color, xAlign)  
        local l = Instance.new('TextLabel', parent)  
  
        l.Size = size  
        l.Position = pos or UDim2.new(0, 0, 0, 0)  
        l.BackgroundTransparency = 1  
        l.Text = text or ''  
        l.Font = font or Enum.Font.Gotham  
        l.TextSize = textSize or 11  
        l.TextColor3 = color or C.text  
        l.TextXAlignment = xAlign or Enum.TextXAlignment.Center  
        l.TextTruncate = Enum.TextTruncate.AtEnd  
  
        return l  
    end  
  
    for _, parent in ipairs({  
        player.PlayerGui,  
        game:GetService('CoreGui'),  
    })do  
        pcall(function()  
            local old = parent:FindFirstChild('ZBountyUI')  
  
            if old then  
                old:Destroy()  
            end  
        end)  
    end  
  
    local ScreenGui = Instance.new('ScreenGui')  
  
    ScreenGui.Name = 'ZBountyUI'  
    ScreenGui.ResetOnSpawn = false  
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling  
    ScreenGui.DisplayOrder = 999  
  
    local ok2 = pcall(function()  
        ScreenGui.Parent = game:GetService('CoreGui')  
    end)  
  
    if not ok2 then  
        ScreenGui.Parent = player:WaitForChild('PlayerGui')  
    end  
  
    local ToggleBtn = Instance.new('TextButton', ScreenGui)  
  
    ToggleBtn.Size = UDim2.new(0, 38, 0, 38)  
    ToggleBtn.Position = UDim2.new(0, 8, 0, 8)  
    ToggleBtn.BackgroundColor3 = T_BG  
    ToggleBtn.Text = ''  
    ToggleBtn.BorderSizePixel = 0  
    ToggleBtn.AutoButtonColor = false  
    Instance.new('UICorner', ToggleBtn).CornerRadius = UDim.new(0, 10)  
  
    addStroke(ToggleBtn, T_ACCENT, 1, 0.3)  
  
    local toggleLogoImg = Instance.new('ImageLabel', ToggleBtn)  
  
    toggleLogoImg.Size = UDim2.new(1, -6, 1, -6)  
    toggleLogoImg.Position = UDim2.new(0, 3, 0, 3)  
    toggleLogoImg.BackgroundTransparency = 1  
    toggleLogoImg.ScaleType = Enum.ScaleType.Fit  
    toggleLogoImg.Image = 'rbxassetid://125174382377001'  
    toggleLogoImg.ImageColor3 = T_ACCENT  
  
    local Main = Instance.new('Frame', ScreenGui)  
  
    Main.Name = 'ZBountyMain'  
    Main.Size = UDim2.new(0, 580, 0, 340)  
    Main.Position = UDim2.new(0, 52, 0, 8)  
    Main.BackgroundColor3 = T_BG  
    Main.BackgroundTransparency = 0  
    Main.BorderSizePixel = 0  
    Main.Active = true  
    Main.Draggable = true  
    Main.Visible = false  
    Instance.new('UICorner', Main).CornerRadius = UDim.new(0, 10)  
  
    local mainStroke = addStroke(Main, T_ACCENT, 1, 0.6)  
  
    task.spawn(function()  
        local t = 0  
  
        while true do  
            task.wait(0.06)  
  
            t += 0.06  
  
            if mainStroke and mainStroke.Parent then  
                mainStroke.Transparency = 0.45 + 0.3 * math.abs(math.sin(t * 0.8))  
            end  
        end  
    end)  
  
    local left = Instance.new('Frame', Main)  
  
    left.Size = UDim2.new(0, 168, 1, 0)  
    left.Position = UDim2.new(0, 0, 0, 0)  
    left.BackgroundColor3 = C.panel  
    left.BackgroundTransparency = 0.3  
    left.BorderSizePixel = 0  
    Instance.new('UICorner', left).CornerRadius = UDim.new(0, 10)  
  
    addStroke(left, T_ACCENT, 1, 0.55)  
  
    local lFix = Instance.new('Frame', left)  
  
    lFix.Size = UDim2.new(0, 12, 1, 0)  
    lFix.Position = UDim2.new(1, -12, 0, 0)  
    lFix.BackgroundColor3 = T_PANEL  
    lFix.BackgroundTransparency = 0.3  
    lFix.BorderSizePixel = 0  
  
    local function lDiv(y)  
        local d = Instance.new('Frame', left)  
  
        d.Size = UDim2.new(0.75, 0, 0, 1)  
        d.Position = UDim2.new(0.125, 0, 0, y)  
        d.BackgroundColor3 = T_ACCENT  
        d.BackgroundTransparency = 0.75  
        d.BorderSizePixel = 0  
    end  
  
    local logoFrame = Instance.new('Frame', left)  
  
    logoFrame.Size = UDim2.new(0, 80, 0, 80)  
    logoFrame.Position = UDim2.new(0.5, -40, 0, 10)  
    logoFrame.BackgroundTransparency = 1  
    logoFrame.BorderSizePixel = 0  
  
    local logoImg = Instance.new('ImageLabel', logoFrame)  
  
    logoImg.Size = UDim2.new(1, 0, 1, 0)  
    logoImg.BackgroundTransparency = 1  
    logoImg.Image = 'rbxassetid://125174382377001'  
    logoImg.ScaleType = Enum.ScaleType.Fit  
    logoImg.ImageColor3 = T_ACCENT  
  
    local avOuter = Instance.new('Frame', left)  
  
    avOuter.Size = UDim2.new(0, 70, 0, 70)  
    avOuter.Position = UDim2.new(0.5, -35, 0, 98)  
    avOuter.BackgroundColor3 = T_BG  
    avOuter.BorderSizePixel = 0  
    Instance.new('UICorner', avOuter).CornerRadius = UDim.new(1, 0)  
  
    addStroke(avOuter, T_ACCENT, 2, 0.2)  
  
    local avImg = Instance.new('ImageLabel', avOuter)  
  
    avImg.Size = UDim2.new(1, -4, 1, -4)  
    avImg.Position = UDim2.new(0, 2, 0, 2)  
    avImg.BackgroundTransparency = 1  
    avImg.ScaleType = Enum.ScaleType.Crop  
    Instance.new('UICorner', avImg).CornerRadius = UDim.new(1, 0)  
  
    task.spawn(function()  
        local ok3, url = pcall(function()  
            return Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)  
        end)  
  
        if ok3 and url then  
            avImg.Image = url  
        end  
    end)  
  
    local nameLbl = mkLabel(left, UDim2.new(1, -8, 0, 15), UDim2.new(0, 4, 0, 172), player.Name, Enum.Font.GothamBlack, 12, C.text)  
  
    nameLbl.TextTruncate = Enum.TextTruncate.AtEnd  
  
    local lvlLbl = mkLabel(left, UDim2.new(1, -8, 0, 12), UDim2.new(0, 4, 0, 189), 'Lv. ---', Enum.Font.GothamBold, 10, C.muted)  
  
    lDiv(208)  
  
    local bountyBg = mkFrame(left, UDim2.new(0.88, 0, 0, 24), UDim2.new(0.06, 0, 0, 213), T_BG, 0)  
  
    addStroke(bountyBg, T_ACCENT, 1, 0.5)  
  
    CurrLbl = mkLabel(bountyBg, UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), '0', Enum.Font.GothamBlack, 14, C.green)  
  
    lDiv(241)  
    mkLabel(left, UDim2.new(0.88, 0, 0, 10), UDim2.new(0.06, 0, 0, 244), 'TIEMPO ACTIVO', Enum.Font.Gotham, 8, C.muted, Enum.TextXAlignment.Left)  
  
    local premBadge = mkFrame(left, UDim2.new(0.88, 0, 0, 22), UDim2.new(0.06, 0, 0, 255), T_CARD, 0)  
  
    addStroke(premBadge, T_ACCENT, 1, 0.6)  
  
    StatBadge = mkLabel(premBadge, UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), '00:00', Enum.Font.GothamBold, 13, Color3.fromRGB(130, 142, 178))  
  
    local _sessionStart = os.clock()  
  
    task.spawn(function()  
        while true do  
            task.wait(1)  
  
            if not State or not State.active then  
                continue  
            end  
  
            local elapsed = math.floor(os.clock() - _sessionStart)  
  
            StatBadge.Text = string.format('%02d:%02d', math.floor(elapsed / 60), elapsed % 60)  
        end  
    end)  
    lDiv(281)  
  
    local factionBg = mkFrame(left, UDim2.new(0.88, 0, 0, 24), UDim2.new(0.06, 0, 0, 285), CONFIG.Team == 'Pirates' and Color3.fromRGB(100, 22, 22) or Color3.fromRGB(20, 55, 110), 0)  
  
    addStroke(factionBg, CONFIG.Team == 'Pirates' and Color3.fromRGB(210, 80, 80) or Color3.fromRGB(80, 150, 230), 1, 0.35)  
    mkLabel(factionBg, UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), CONFIG.Team == 'Pirates' and '\u{1f3f4} PIRATAS' or '\u{2693} MARINES', Enum.Font.GothamBlack, 12, Color3.new(1, 1, 1))  
    lDiv(313)  
  
    local regionLbl = mkLabel(left, UDim2.new(1, -8, 0, 14), UDim2.new(0, 4, 0, 317), '? / 12 jugadores', Enum.Font.Gotham, 9, C.muted)  
    local right = Instance.new('Frame', Main)  
  
    right.Size = UDim2.new(1, -170, 1, 0)  
    right.Position = UDim2.new(0, 170, 0, 0)  
    right.BackgroundColor3 = T_BG  
    right.BackgroundTransparency = 0.45  
    right.BorderSizePixel = 0  
    Instance.new('UICorner', right).CornerRadius = UDim.new(0, 10)  
  
    local headerBar = mkFrame(right, UDim2.new(1, -6, 0, 32), UDim2.new(0, 3, 0, 4), T_CARD, 0)  
  
    addStroke(headerBar, T_ACCENT, 1, 0.6)  
  
    local hFix = Instance.new('Frame', headerBar)  
  
    hFix.Size = UDim2.new(1, 0, 0, 10)  
    hFix.Position = UDim2.new(0, 0, 1, -10)  
    hFix.BackgroundColor3 = T_CARD  
    hFix.BorderSizePixel = 0  
  
    local statusDot = Instance.new('Frame', headerBar)  
  
    statusDot.Size = UDim2.new(0, 7, 0, 7)  
    statusDot.Position = UDim2.new(0, 8, 0.5, -3.5)  
    statusDot.BackgroundColor3 = C.green  
    statusDot.BorderSizePixel = 0  
    Instance.new('UICorner', statusDot).CornerRadius = UDim.new(1, 0)  
  
    mkLabel(headerBar, UDim2.new(0, 95, 1, 0), UDim2.new(0, 18, 0, 0), 'Sacred Bounty', Enum.Font.GothamBlack, 13, C.text, Enum.TextXAlignment.Left)  
  
    TimerLbl = mkLabel(headerBar, UDim2.new(0, 65, 1, 0), UDim2.new(0, 116, 0, 0), '\u{23f1} 0s', Enum.Font.GothamBold, 12, C.muted)  
  
    local hActivoBadge = mkFrame(headerBar, UDim2.new(0, 72, 0, 20), UDim2.new(0, 186, 0.5, -10), T_BG:Lerp(T_ACCENT, 0.15), 0)  
  
    addStroke(hActivoBadge, T_ACCENT, 1, 0.5)  
  
    local hActivoLbl = mkLabel(hActivoBadge, UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), '\u{25cf} CARGANDO', Enum.Font.GothamBold, 9, C.green)  
    local discordBtn = Instance.new('TextButton', headerBar)  
  
    discordBtn.Size = UDim2.new(0, 74, 0, 22)  
    discordBtn.Position = UDim2.new(0, 263, 0.5, -11)  
    discordBtn.BackgroundColor3 = Color3.fromRGB(40, 46, 120)  
    discordBtn.BorderSizePixel = 0  
    discordBtn.Text = '\u{1f4ac} Discord'  
    discordBtn.Font = Enum.Font.GothamBold  
    discordBtn.TextSize = 9  
    discordBtn.TextColor3 = Color3.new(1, 1, 1)  
    discordBtn.AutoButtonColor = false  
    Instance.new('UICorner', discordBtn).CornerRadius = UDim.new(0, 5)  
  
    addStroke(discordBtn, Color3.fromRGB(110, 120, 235), 1, 0.3)  
    discordBtn.MouseButton1Click:Connect(function()  
        pcall(function()  
            setclipboard('https://discord.gg/NYJC6WfVsJ')  
        end)  
  
        local old = discordBtn.Text  
  
        discordBtn.Text = '\u{2713} Copiado!'  
  
        task.wait(2)  
  
        discordBtn.Text = old  
    end)  
  
    local minBtn = Instance.new('TextButton', headerBar)  
  
    minBtn.Size = UDim2.new(0, 24, 0, 20)  
    minBtn.Position = UDim2.new(1, -28, 0.5, -10)  
    minBtn.BackgroundColor3 = Color3.fromRGB(80, 20, 20)  
    minBtn.Text = '\u{2212}'  
    minBtn.TextColor3 = Color3.new(1, 1, 1)  
    minBtn.Font = Enum.Font.GothamBlack  
    minBtn.TextSize = 14  
    minBtn.BorderSizePixel = 0  
    minBtn.AutoButtonColor = false  
    Instance.new('UICorner', minBtn).CornerRadius = UDim.new(0, 5)  
  
    addStroke(minBtn, Color3.fromRGB(200, 70, 70), 1, 0.4)  
  
    local statsRow = mkFrame(right, UDim2.new(1, -6, 0, 42), UDim2.new(0, 3, 0, 40), T_CARD, 0)  
  
    addStroke(statsRow, T_ACCENT, 1, 0.55)  
  
    local function statCell(parent, label, idx, total, valColor)  
        local w = 1 / total  
        local cell = Instance.new('Frame', parent)  
  
        cell.Size = UDim2.new(w, 0, 1, 0)  
        cell.Position = UDim2.new(w * idx, 0, 0, 0)  
        cell.BackgroundTransparency = 1  
        cell.BorderSizePixel = 0  
  
        if idx > 0 then  
            local sep = Instance.new('Frame', cell)  
  
            sep.Size = UDim2.new(0, 1, 0.45, 0)  
            sep.Position = UDim2.new(0, 0, 0.275, 0)  
            sep.BackgroundColor3 = T_ACCENT  
            sep.BackgroundTransparency = 0.7  
            sep.BorderSizePixel = 0  
        end  
  
        mkLabel(cell, UDim2.new(1, 0, 0, 13), UDim2.new(0, 0, 0, 3), label, Enum.Font.Gotham, 8, C.muted)  
  
        local val = mkLabel(cell, UDim2.new(1, 0, 0, 22), UDim2.new(0, 0, 0, 16), '\u{2014}', Enum.Font.GothamBlack, 15, valColor or C.text)  
  
        return val  
    end  
  
    KillLbl = statCell(statsRow, 'KILLS', 0, 4, C.red)  
    EarnedLbl = statCell(statsRow, 'BOUNTY GANADO', 1, 4, C.green)  
    StartLbl = statCell(statsRow, 'BOUNTY INICIAL', 2, 4, C.text)  
  
    local pingVal = statCell(statsRow, 'PING', 3, 4, T_ACCENT)  
    local islandLbl = mkLabel(right, UDim2.new(1, -6, 0, 20), UDim2.new(0, 3, 0, 86), '< Buscando... >', Enum.Font.GothamBold, 14, T_ACCENT, Enum.TextXAlignment.Left)  
  
    mkLabel(right, UDim2.new(0.5, -3, 0, 11), UDim2.new(0, 3, 0, 108), 'SERVER PROGRESS', Enum.Font.GothamBold, 8, C.muted, Enum.TextXAlignment.Left)  
  
    StatusLbl = mkLabel(right, UDim2.new(0.5, -3, 0, 11), UDim2.new(0.5, 0, 0, 108), '0 kills', Enum.Font.Gotham, 8, C.muted, Enum.TextXAlignment.Right)  
  
    local barBg = mkFrame(right, UDim2.new(1, -6, 0, 16), UDim2.new(0, 3, 0, 121), T_BG, 0)  
  
    addStroke(barBg, T_ACCENT, 1, 0.65)  
  
    TimerBar = Instance.new('Frame', barBg)  
    TimerBar.Size = UDim2.new(0, 0, 1, 0)  
    TimerBar.BackgroundColor3 = T_ACCENT  
    TimerBar.BorderSizePixel = 0  
    Instance.new('UICorner', TimerBar).CornerRadius = UDim.new(0, 5)  
  
    local tgrad = Instance.new('UIGradient', TimerBar)  
  
    tgrad.Color = ColorSequence.new({  
        ColorSequenceKeypoint.new(0, T_ACCENT),  
        ColorSequenceKeypoint.new(1, T_ACCENT:Lerp(Color3.new(1, 1, 1), 0.3)),  
    })  
  
    local barPctLbl = mkLabel(barBg, UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), '0s', Enum.Font.GothamBold, 9, C.text)  
  
    barPctLbl.ZIndex = 2  
  
    local tlHdr = mkFrame(right, UDim2.new(1, -6, 0, 16), UDim2.new(0, 3, 0, 141), T_CARD, 0)  
  
    addStroke(tlHdr, T_ACCENT, 1, 0.6)  
  
    local function tlHead(txt, xs, ws, align)  
        mkLabel(tlHdr, UDim2.new(ws, 0, 1, 0), UDim2.new(xs, 0, 0, 0), txt, Enum.Font.GothamBold, 8, C.gold, align or Enum.TextXAlignment.Left)  
    end  
  
    tlHead('TARGET LIST', 0, 0.42)  
    tlHead('HP BAR', 0.42, 0.3, Enum.TextXAlignment.Center)  
    tlHead('BOUNTY GAIN', 0.72, 0.28, Enum.TextXAlignment.Right)  
  
    local targetScroll = Instance.new('ScrollingFrame', right)  
  
    targetScroll.Size = UDim2.new(1, -6, 1, -161)  
    targetScroll.Position = UDim2.new(0, 3, 0, 159)  
    targetScroll.BackgroundTransparency = 1  
    targetScroll.BorderSizePixel = 0  
    targetScroll.ScrollBarThickness = 2  
    targetScroll.ScrollBarImageColor3 = T_ACCENT  
    targetScroll.CanvasSize = UDim2.new(0, 0, 0, 0)  
    targetScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y  
  
    local tlLayout = Instance.new('UIListLayout', targetScroll)  
  
    tlLayout.SortOrder = Enum.SortOrder.LayoutOrder  
    tlLayout.Padding = UDim.new(0, 2)  
  
    local lastDamagedPlayer = nil  
  
    local function hookHP(pl)  
        if pl == player then  
            return  
        end  
  
        local function hookChar(char)  
            pcall(function()  
                local hum = char:WaitForChild('Humanoid', 5)  
  
                if not hum then  
                    return  
                end  
  
                local last = hum.Health  
  
                hum:GetPropertyChangedSignal('Health'):Connect(function()  
                    if hum.Health < last and State and State.active then  
                        if Players:FindFirstChild(pl.Name) then  
                            lastDamagedPlayer = pl  
                        end  
                    end  
  
                    last = hum.Health  
                end)  
            end)  
        end  
  
        pl.CharacterAdded:Connect(hookChar)  
  
        if pl.Character then  
            hookChar(pl.Character)  
        end  
    end  
  
    for _, pl in ipairs(Players:GetPlayers())do  
        hookHP(pl)  
    end  
  
    Players.PlayerAdded:Connect(hookHP)  
  
    local targetRows = {}  
  
    local function rebuildTargetList()  
        for _, ch in pairs(targetScroll:GetChildren())do  
            if ch:IsA('Frame') then  
                ch:Destroy()  
            end  
        end  
  
        targetRows = {}  
  
        local list = {}  
  
        for _, pl in ipairs(Players:GetPlayers())do  
            if pl == player then  
                continue  
            end  
            if not pl.Character then  
                continue  
            end  
  
            local hum = pl.Character:FindFirstChild('Humanoid')  
  
            if not hum or hum.Health <= 0 then  
                continue  
            end  
  
            table.insert(list, pl)  
        end  
  
        table.sort(list, function(a, b)  
            if a == lastDamagedPlayer then  
                return true  
            end  
            if b == lastDamagedPlayer then  
                return false  
            end  
  
            local la, lb = 0, 0  
  
            pcall(function()  
                la = a.Data.Level.Value  
            end)  
            pcall(function()  
                lb = b.Data.Level.Value  
            end)  
  
            return la > lb  
        end)  
  
        for order, pl in ipairs(list)do  
            if order > 7 then  
                break  
            end  
  
            local hum = pl.Character:FindFirstChild('Humanoid')  
            local isActive = (pl == lastDamagedPlayer)  
            local row = Instance.new('Frame', targetScroll)  
  
            row.LayoutOrder = order  
            row.Size = UDim2.new(1, 0, 0, 32)  
            row.BackgroundColor3 = isActive and T_BG:Lerp(T_ACCENT, 0.08) or T_CARD  
            row.BackgroundTransparency = 0  
            row.BorderSizePixel = 0  
            Instance.new('UICorner', row).CornerRadius = UDim.new(0, 6)  
  
            addStroke(row, T_ACCENT, 1, isActive and 0.2 or 0.75)  
            mkLabel(row, UDim2.new(0.38, 0, 0.5, 0), UDim2.new(0, 8, 0, 0), pl.Name, Enum.Font.GothamBold, 11, isActive and C.text or Color3.fromRGB(165, 175, 205), Enum.TextXAlignment.Left)  
  
            local lvVal = 0  
  
            pcall(function()  
                lvVal = pl.Data.Level.Value  
            end)  
            mkLabel(row, UDim2.new(0.38, 0, 0.45, 0), UDim2.new(0, 8, 0.52, 0), 'Lv. ' .. lvVal, Enum.Font.Gotham, 9, lvVal < CONFIG.MinLevel and C.red or C.muted, Enum.TextXAlignment.Left)  
  
            local hpBg = Instance.new('Frame', row)  
  
            hpBg.Size = UDim2.new(0.28, 0, 0, 10)  
            hpBg.Position = UDim2.new(0.42, 0, 0.5, -5)  
            hpBg.BackgroundColor3 = T_BG  
            hpBg.BorderSizePixel = 0  
            Instance.new('UICorner', hpBg).CornerRadius = UDim.new(0, 3)  
  
            addStroke(hpBg, T_ACCENT, 1, 0.6)  
  
            local hpFill = Instance.new('Frame', hpBg)  
  
            hpFill.Name = 'HPFill'  
            hpFill.Size = UDim2.new(1, 0, 1, 0)  
            hpFill.BackgroundColor3 = C.green  
            hpFill.BorderSizePixel = 0  
            Instance.new('UICorner', hpFill).CornerRadius = UDim.new(0, 3)  
  
            local hpPct = mkLabel(hpBg, UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), '100%', Enum.Font.GothamBold, 7, Color3.new(1, 1, 1))  
  
            hpPct.Name = 'HPPct'  
            hpPct.ZIndex = 2  
  
            mkLabel(row, UDim2.new(0.26, 0, 1, 0), UDim2.new(0.74, 0, 0, 0), isActive and 'ACTIVE' or 'queued', isActive and Enum.Font.GothamBlack or Enum.Font.Gotham, isActive and 10 or 9, isActive and C.green or C.muted, Enum.TextXAlignment.Right)  
  
            targetRows[pl.Name] = {  
                fill = hpFill,  
                pct = hpPct,  
                hum = hum,  
            }  
        end  
    end  
  
    task.spawn(function()  
        local rebuildT = 0  
  
        while true do  
            task.wait(0.25)  
  
            rebuildT += 0.25  
  
            if rebuildT >= 3 then  
                rebuildT = 0  
  
                pcall(rebuildTargetList)  
            end  
  
            for _, data in pairs(targetRows)do  
                pcall(function()  
                    local hum = data.hum  
  
                    if not hum or not hum.Parent then  
                        return  
                    end  
  
                    local pct = math.clamp(hum.Health / math.max(hum.MaxHealth, 1), 0, 1)  
  
                    data.fill.Size = UDim2.new(pct, 0, 1, 0)  
                    data.pct.Text = math.floor(pct * 100) .. '%'  
                    data.fill.BackgroundColor3 = pct > 0.55 and C.green or (pct > 0.25 and C.gold or C.red)  
                end)  
            end  
  
            pcall(function()  
                local hrp = player.Character and player.Character:FindFirstChild('HumanoidRootPart')  
  
                if not hrp then  
                    return  
                end  
  
                local locs = workspace:FindFirstChild('_WorldOrigin')  
  
                if locs then  
                    locs = locs:FindFirstChild('Locations')  
                end  
                if not locs then  
                    return  
                end  
  
                local best, bestD = nil, math.huge  
  
                for _, loc in pairs(locs:GetChildren())do  
                    local d = (loc.Position - hrp.Position).Magnitude  
  
                    if d < bestD then  
                        best = loc  
                        bestD = d  
                    end  
                end  
  
                if best then  
                    islandLbl.Text = '< ' .. best.Name .. ' >'  
                    islandLbl.TextColor3 = T_ACCENT  
                end  
            end)  
            pcall(function()  
                local p = math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())  
  
                pingVal.Text = p .. 'ms'  
                pingVal.TextColor3 = p < 100 and C.green or (p < 250 and C.gold or C.red)  
            end)  
            pcall(function()  
                local lv = 0  
  
                pcall(function()  
                    lv = player.Data.Level.Value  
                end)  
  
                lvlLbl.Text = 'Lv. ' .. lv  
            end)  
            pcall(function()  
                regionLbl.Text = #Players:GetPlayers() .. ' / 12 jugadores'  
            end)  
        end  
    end)  
    rebuildTargetList()  
  
    local miniBar = Instance.new('Frame', ScreenGui)  
  
    miniBar.Name = 'ZBountyMini'  
    miniBar.Size = UDim2.new(0, 400, 0, 30)  
    miniBar.Position = UDim2.new(0.5, -200, 0, 10)  
    miniBar.BackgroundColor3 = T_BG  
    miniBar.BackgroundTransparency = 0.1  
    miniBar.BorderSizePixel = 0  
    miniBar.Visible = false  
    miniBar.Active = true  
    miniBar.Draggable = true  
    Instance.new('UICorner', miniBar).CornerRadius = UDim.new(0, 15)  
  
    addStroke(miniBar, T_ACCENT, 1, 0.3)  
  
    local miniLogoImg = Instance.new('ImageLabel', miniBar)  
  
    miniLogoImg.Size = UDim2.new(0, 24, 0, 24)  
    miniLogoImg.Position = UDim2.new(0, 4, 0.5, -12)  
    miniLogoImg.BackgroundTransparency = 1  
    miniLogoImg.ScaleType = Enum.ScaleType.Fit  
    miniLogoImg.Image = 'rbxassetid://125174382377001'  
    miniLogoImg.ImageColor3 = T_ACCENT  
  
    mkLabel(miniBar, UDim2.new(0, 100, 1, 0), UDim2.new(0, 30, 0, 0), 'Sacred Bounty', Enum.Font.GothamBlack, 10, T_ACCENT, Enum.TextXAlignment.Left)  
  
    local function mSep(x)  
        local s = Instance.new('Frame', miniBar)  
  
        s.Size = UDim2.new(0, 1, 0.4, 0)  
        s.Position = UDim2.new(0, x, 0.3, 0)  
        s.BackgroundColor3 = T_ACCENT  
        s.BackgroundTransparency = 0.7  
        s.BorderSizePixel = 0  
    end  
    local function mStat(x, w, color)  
        return mkLabel(miniBar, UDim2.new(0, w, 1, 0), UDim2.new(0, x, 0, 0), '\u{2014}', Enum.Font.GothamBold, 11, color)  
    end  
  
    mSep(125)  
  
    local mKills = mStat(129, 65, C.text)  
  
    mSep(196)  
  
    local mBounty = mStat(200, 80, C.green)  
  
    mSep(282)  
  
    local mPing = mStat(286, 60, T_ACCENT)  
  
    mSep(348)  
  
    local mFPS = mStat(352, 55, C.gold)  
    local _fc, _fv, _fl = 0, 0, tick()  
  
    RunService.RenderStepped:Connect(function()  
        _fc += 1  
  
        local n = tick()  
  
        if n - _fl >= 1 then  
            _fv = _fc  
            _fc = 0  
            _fl = n  
        end  
    end)  
    task.spawn(function()  
        while true do  
            task.wait(0.5)  
  
            if not miniBar.Visible then  
                continue  
            end  
  
            pcall(function()  
                mKills.Text = (State and State.kills or 0) .. 'K'  
                mBounty.Text = '+' .. fmt(State and State.sessionEarned or 0)  
  
                local p = 0  
  
                pcall(function()  
                    p = math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())  
                end)  
  
                mPing.Text = p .. 'ms'  
                mPing.TextColor3 = p < 100 and C.green or (p < 250 and C.gold or C.red)  
                mFPS.Text = _fv .. ' FPS'  
                mFPS.TextColor3 = _fv >= 50 and C.green or (_fv >= 30 and C.gold or C.red)  
            end)  
        end  
    end)  
  
    local minimized = false  
  
    local function openMain()  
        miniBar.Visible = false  
        minimized = false  
        minBtn.Text = '\u{2212}'  
        Main.Visible = true  
        Main.BackgroundTransparency = 1  
        Main.Size = UDim2.new(0, 580, 0, 0)  
        Main.Position = UDim2.new(0, 52, 0, -10)  
        Main.BackgroundColor3 = T_BG  
  
        TweenService:Create(Main, TweenInfo.new(0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {  
            Size = UDim2.new(0, 580, 0, 340),  
            BackgroundTransparency = 0,  
            Position = UDim2.new(0, 52, 0, 8),  
        }):Play()  
    end  
    local function closeMain(showMini)  
        TweenService:Create(Main, TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {  
            Size = UDim2.new(0, 580, 0, 0),  
            BackgroundTransparency = 1,  
            Position = UDim2.new(0, 52, 0, -10),  
        }):Play()  
        task.wait(0.18)  
  
        Main.Visible = false  
        Main.Size = UDim2.new(0, 580, 0, 340)  
        Main.BackgroundTransparency = 0  
        Main.Position = UDim2.new(0, 52, 0, 8)  
  
        if showMini then  
            miniBar.Visible = true  
        end  
    end  
  
    miniBar.InputBegan:Connect(function(inp)  
        if inp.UserInputType == Enum.UserInputType.Touch or inp.UserInputType == Enum.UserInputType.MouseButton1 then  
            openMain()  
        end  
    end)  
    minBtn.MouseButton1Click:Connect(function()  
        minimized = not minimized  
  
        if minimized then  
            minBtn.Text = '+'  
  
            task.spawn(function()  
                closeMain(true)  
            end)  
        else  
            openMain()  
        end  
    end)  
    ToggleBtn.MouseButton1Click:Connect(function()  
        if miniBar.Visible then  
            openMain()  
        elseif Main.Visible then  
            minimized = true  
            minBtn.Text = '+'  
  
            task.spawn(function()  
                closeMain(false)  
            end)  
        else  
            openMain()  
        end  
    end)  
    task.spawn(function()  
        while true do  
            task.wait(0.5)  
            pcall(function()  
                if not guiReady then  
                    return  
                end  
  
                State.currentBounty = getBounty()  
                StartLbl.Text = fmt(State.startBounty)  
                EarnedLbl.Text = '+' .. fmt(State.sessionEarned)  
                CurrLbl.Text = fmt(State.currentBounty)  
                KillLbl.Text = tostring(State.kills)  
  
                if State.active then  
                    local sinceHit = os.clock() - State.lastHitTime  
                    local remaining = math.max(0, CONFIG.NoHitTimeout - sinceHit)  
                    local pct = remaining / CONFIG.NoHitTimeout  
  
                    TimerBar.Size = UDim2.new(pct, 0, 1, 0)  
                    barPctLbl.Text = math.ceil(remaining) .. 's'  
                    tgrad.Color = ColorSequence.new({  
                        ColorSequenceKeypoint.new(0, pct > 0.4 and T_ACCENT or C.red),  
                        ColorSequenceKeypoint.new(1, pct > 0.4 and T_ACCENT:Lerp(Color3.new(1, 1, 1), 0.25) or C.gold),  
                    })  
  
                    if remaining > 0 then  
                        TimerLbl.Text = '\u{23f1} ' .. math.ceil(remaining) .. 's'  
                        TimerLbl.TextColor3 = pct > 0.4 and C.muted or C.gold  
                    else  
                        TimerLbl.Text = '\u{23f1} Hop'  
                        TimerLbl.TextColor3 = C.red  
                    end  
  
                    StatusLbl.Text = State.kills .. ' kills'  
  
                    local isActivo = State.status == 'Activo'  
  
                    statusDot.BackgroundColor3 = isActivo and C.green or C.gold  
                    hActivoLbl.Text = '\u{25cf} ' .. string.upper(State.status)  
                    hActivoBadge.BackgroundColor3 = isActivo and T_BG:Lerp(T_ACCENT, 0.2) or Color3.fromRGB(90, 55, 10)  
                end  
            end)  
        end  
    end)  
  
    Main.Visible = true  
    guiReady = true  
  
    task.spawn(function()  
        print('[ZBounty] Iniciando \u{2014} Team=' .. CONFIG.Team .. ' Weapon=' .. CONFIG.Weapon)  
  
        local confirmed = false  
        local elapsed = 0  
  
        if player.Team and player.Team.Name == CONFIG.Team then  
            print('[ZBounty] Ya somos ' .. CONFIG.Team)  
  
            confirmed = true  
        elseif player.Team then  
            print('[ZBounty] Team actual: ' .. player.Team.Name)  
        else  
            print('[ZBounty] Sin team \u{2014} intentando...')  
        end  
  
        while not confirmed do  
            task.wait(0.3)  
  
            elapsed += 0.3  
  
            selectFaction(CONFIG.Team)  
            task.wait(0.5)  
  
            if player.Team and player.Team.Name == CONFIG.Team then  
                print('[ZBounty] Faccion confirmada: ' .. CONFIG.Team)  
  
                confirmed = true  
  
                break  
            end  
            if elapsed >= 30 then  
                print('[ZBounty] Timeout \u{2014} arrancando')  
  
                confirmed = true  
            end  
        end  
  
        local ok3 = player.Team and player.Team.Name == CONFIG.Team  
  
        premBadge.BackgroundColor3 = T_CARD  
        hActivoLbl.Text = ok3 and '\u{25cf} ACTIVO' or '\u{25cf} SIN TEAM'  
        hActivoBadge.BackgroundColor3 = ok3 and T_BG:Lerp(T_ACCENT, 0.2) or Color3.fromRGB(80, 55, 10)  
        statusDot.BackgroundColor3 = ok3 and C.green or C.gold  
  
        startAll()  
        task.wait(2)  
  
        if not hasValidTargets() then  
            print('[ZBounty] Sin targets Lv.' .. CONFIG.MinLevel .. '+ \u{2192} Hopeando')  
  
            State.status = 'Sin targets'  
  
            task.wait(2)  
            Hop()  
            task.wait(5)  
  
            State.lastHitTime = os.clock()  
            State.status = 'Activo'  
        end  
    end)  
    task.spawn(function()  
        local lastVis = false  
  
        while true do  
            task.wait(0.5)  
  
            if not State.active then  
                continue  
            end  
  
            local ct = findChooseTeam()  
            local vis = ct and ct.Visible or false  
  
            if vis and not lastVis then  
                print('[ZBounty] Nuevo server \u{2192} seleccionando ' .. CONFIG.Team)  
                task.wait(0.4)  
  
                for i = 1, 5 do  
                    selectFaction(CONFIG.Team)  
                    task.wait(1.2)  
  
                    if player.Team and player.Team.Name == CONFIG.Team then  
                        break  
                    end  
                end  
            end  
  
            lastVis = vis  
        end  
    end)  
    print('[ZBounty] Loaded \u{2014} Team=' .. CONFIG.Team .. ' Weapon=' .. CONFIG.Weapon)  
end  
  
__run()  
