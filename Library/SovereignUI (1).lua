--[[
    Sovereign UI Library  v1.0
    Compact dark hub UI: sidebar tabs, search, collapsible cards, toasts,
    shiny red accent (animated glow border + gloss sweep), live accent colors.

    local Library = loadstring(game:HttpGet("YOUR_RAW_LINK"))()
    local Window  = Library:CreateWindow({ Title = "Sovereign Hub", Subtitle = "v1.0 · By You" })
    local Tab     = Window:AddTab({ Name = "Home", Icon = "⌂" })
    local Card    = Tab:AddCard({ Title = "Quick Actions", Column = 2 })
    Card:AddToggle({ Title = "Auto Farm", Callback = function(v) print(v) end })
]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local LOGO = "rbxassetid://140460622905781"

local Library = {
    Version = "1.0",
    Accent = Color3.fromRGB(255, 31, 45),
    Windows = {},
    _binds = {},
    _conns = {},
}

local Theme = {
    Background = Color3.fromRGB(13, 5, 8),
    Sidebar = Color3.fromRGB(17, 7, 10),
    Card = Color3.fromRGB(22, 10, 14),
    Element = Color3.fromRGB(32, 15, 20),
    ElementHover = Color3.fromRGB(44, 20, 27),
    Stroke = Color3.fromRGB(64, 26, 34),
    Text = Color3.fromRGB(245, 240, 241),
    SubText = Color3.fromRGB(150, 128, 133),
}
Library.Theme = Theme

----------------------------------------------------------------------
-- helpers
----------------------------------------------------------------------
local function New(class, props, children)
    local o = Instance.new(class)
    local parent
    for k, v in pairs(props or {}) do
        if k == "Parent" then parent = v else o[k] = v end
    end
    for _, c in ipairs(children or {}) do c.Parent = o end
    if parent then o.Parent = parent end
    return o
end

local function Tween(o, props, t, style, dir)
    local tw = TweenService:Create(o, TweenInfo.new(t or 0.15, style or Enum.EasingStyle.Quad, dir or Enum.EasingDirection.Out), props)
    tw:Play()
    return tw
end

local function Corner(r) return New("UICorner", { CornerRadius = UDim.new(0, r or 6) }) end
local function Stroke(color, thickness, transparency)
    return New("UIStroke", {
        Color = color or Theme.Stroke, Thickness = thickness or 1,
        Transparency = transparency or 0, ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    })
end
local function Pad(l, t, r, b)
    return New("UIPadding", {
        PaddingLeft = UDim.new(0, l or 0), PaddingTop = UDim.new(0, t or 0),
        PaddingRight = UDim.new(0, r or 0), PaddingBottom = UDim.new(0, b or 0),
    })
end
local function CSK(t, c) return ColorSequenceKeypoint.new(t, c) end

local function BindAccent(fn)
    fn(Library.Accent)
    table.insert(Library._binds, fn)
end

function Library:SetAccent(color)
    self.Accent = color
    for _, fn in ipairs(self._binds) do pcall(fn, color) end
end

-- glossy accent gradient (light top -> accent -> dark bottom)
local function Shiny(inst, vertical)
    inst.BackgroundColor3 = Color3.new(1, 1, 1)
    local g = New("UIGradient", { Rotation = vertical == false and 0 or 90, Parent = inst })
    BindAccent(function(c)
        g.Color = ColorSequence.new({
            CSK(0, c:Lerp(Color3.new(1, 1, 1), 0.3)),
            CSK(0.5, c),
            CSK(1, c:Lerp(Color3.new(0, 0, 0), 0.45)),
        })
    end)
    return g
end

local function Fire(cb, ...)
    if not cb then return end
    task.spawn(function(...)
        local ok, err = pcall(cb, ...)
        if not ok then warn("[SovereignUI] " .. tostring(err)) end
    end, ...)
end

local function Connect(signal, fn)
    local c = signal:Connect(fn)
    table.insert(Library._conns, c)
    return c
end

local function MakeDraggable(handle, target)
    local dragging, startInput, startPos
    Connect(handle.InputBegan, function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            dragging, startInput, startPos = true, i.Position, target.Position
            local c
            c = i.Changed:Connect(function()
                if i.UserInputState == Enum.UserInputState.End then
                    dragging = false
                    c:Disconnect()
                end
            end)
        end
    end)
    Connect(UserInputService.InputChanged, function(i)
        if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
            local d = i.Position - startInput
            target.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
        end
    end)
end

local function Label(parent, text, size, color, font, align)
    return New("TextLabel", {
        BackgroundTransparency = 1, Text = text or "", TextSize = size or 12,
        TextColor3 = color or Theme.Text, Font = font or Enum.Font.GothamMedium,
        TextXAlignment = align or Enum.TextXAlignment.Left, Parent = parent,
    })
end

local function Row(parent, h)
    return New("Frame", {
        Size = UDim2.new(1, 0, 0, h), BackgroundColor3 = Theme.Element,
        BorderSizePixel = 0, Parent = parent,
    }, { Corner(6), Stroke(Theme.Stroke, 1, 0.6) })
end

local function IconLabel(parent, icon, size, pos, color)
    if type(icon) == "string" and icon:find("rbxassetid") then
        return New("ImageLabel", { BackgroundTransparency = 1, Image = icon, Size = size, Position = pos, ImageColor3 = color or Theme.Text, Parent = parent })
    end
    local l = Label(parent, icon or "◆", 13, color or Theme.SubText, Enum.Font.GothamBold, Enum.TextXAlignment.Center)
    l.Size, l.Position = size, pos
    return l
end

----------------------------------------------------------------------
-- window
----------------------------------------------------------------------
function Library:CreateWindow(opts)
    opts = opts or {}
    local logo = opts.Logo or LOGO
    local Window = { Tabs = {}, _order = 0, _query = "", Library = Library }

    local cam = workspace.CurrentCamera
    local vp = cam and cam.ViewportSize or Vector2.new(800, 400)
    local w = math.min(opts.Width or 560, vp.X - 24)
    local h = math.min(opts.Height or 330, vp.Y - 24)
    local sideW = w < 480 and 118 or 150

    -- gui root
    local gui = New("ScreenGui", {
        Name = "SovereignUI", ResetOnSpawn = false, IgnoreGuiInset = true,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, DisplayOrder = 999,
    })
    local ok = pcall(function()
        gui.Parent = (gethui and gethui()) or game:GetService("CoreGui")
    end)
    if not ok or not gui.Parent then gui.Parent = LocalPlayer:WaitForChild("PlayerGui") end
    Window.Gui = gui

    -- main frame
    local Main = New("Frame", {
        Name = "Main", Size = UDim2.fromOffset(w, h), Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = Theme.Background,
        BorderSizePixel = 0, ClipsDescendants = true, Parent = gui,
    }, { Corner(10) })
    Window.Main = Main

    -- animated glowing border
    local glow = Stroke(Color3.new(1, 1, 1), 1.6)
    glow.Parent = Main
    local glowGrad = New("UIGradient", { Parent = glow })
    BindAccent(function(c)
        glowGrad.Color = ColorSequence.new({ CSK(0, c), CSK(0.5, Color3.fromRGB(255, 195, 200)), CSK(1, c:Lerp(Color3.new(0, 0, 0), 0.55)) })
    end)

    -- background logo (faint)
    local Bg = New("ImageLabel", {
        Name = "Background", BackgroundTransparency = 1, Image = logo, ImageTransparency = opts.BackgroundTransparency or 0.92,
        Size = UDim2.fromScale(0.5, 0.85), AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.63, 0.55), ScaleType = Enum.ScaleType.Fit, Parent = Main,
    })
    function Window:SetBackground(image, transparency)
        if image then Bg.Image = image end
        if transparency then Bg.ImageTransparency = transparency end
    end

    ------------------------------------------------------------------
    -- sidebar
    ------------------------------------------------------------------
    local Sidebar = New("Frame", {
        Size = UDim2.new(0, sideW, 1, 0), BackgroundColor3 = Theme.Sidebar, BorderSizePixel = 0, ZIndex = 2, Parent = Main,
    })
    New("Frame", { Size = UDim2.new(0, 1, 1, 0), Position = UDim2.new(1, -1, 0, 0), BackgroundColor3 = Theme.Stroke, BorderSizePixel = 0, ZIndex = 2, Parent = Sidebar })

    local Brand = New("Frame", { Size = UDim2.new(1, 0, 0, 48), BackgroundTransparency = 1, ZIndex = 2, Parent = Sidebar })
    local LogoImg = New("ImageLabel", {
        Size = UDim2.fromOffset(30, 30), Position = UDim2.fromOffset(9, 9), BackgroundColor3 = Theme.Element,
        Image = logo, ZIndex = 2, Parent = Brand,
    }, { Corner(7) })
    local logoStroke = Stroke(Library.Accent, 1.2)
    logoStroke.Parent = LogoImg
    BindAccent(function(c) logoStroke.Color = c end)
    local TitleLbl = Label(Brand, opts.Title or "Sovereign Hub", 12, Theme.Text, Enum.Font.GothamBold)
    TitleLbl.Size, TitleLbl.Position, TitleLbl.ZIndex = UDim2.new(1, -48, 0, 16), UDim2.fromOffset(46, 10), 2
    TitleLbl.TextTruncate = Enum.TextTruncate.AtEnd
    BindAccent(function(c) TitleLbl.TextColor3 = c:Lerp(Color3.new(1, 1, 1), 0.78) end)
    local SubLbl = Label(Brand, opts.Subtitle or "v" .. Library.Version, 9, Theme.SubText)
    SubLbl.Size, SubLbl.Position, SubLbl.ZIndex = UDim2.new(1, -48, 0, 12), UDim2.fromOffset(46, 26), 2
    SubLbl.TextTruncate = Enum.TextTruncate.AtEnd
    function Window:SetTitle(t, s) TitleLbl.Text = t or TitleLbl.Text; SubLbl.Text = s or SubLbl.Text end

    local TabList = New("ScrollingFrame", {
        Position = UDim2.fromOffset(0, 50), Size = UDim2.new(1, 0, 1, -98), BackgroundTransparency = 1, BorderSizePixel = 0,
        ScrollBarThickness = 0, AutomaticCanvasSize = Enum.AutomaticSize.Y, CanvasSize = UDim2.new(), ZIndex = 2, Parent = Sidebar,
    }, { New("UIListLayout", { Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder }), Pad(8, 2, 8, 4) })

    -- footer (profile)
    local Footer = New("Frame", {
        Size = UDim2.new(1, 0, 0, 46), AnchorPoint = Vector2.new(0, 1), Position = UDim2.fromScale(0, 1),
        BackgroundTransparency = 1, ZIndex = 2, Parent = Sidebar,
    })
    New("Frame", { Size = UDim2.new(1, -16, 0, 1), Position = UDim2.fromOffset(8, 0), BackgroundColor3 = Theme.Stroke, BorderSizePixel = 0, ZIndex = 2, Parent = Footer })
    local Avatar = New("ImageLabel", {
        Size = UDim2.fromOffset(28, 28), Position = UDim2.fromOffset(9, 9), BackgroundColor3 = Theme.Element, ZIndex = 2, Parent = Footer,
    }, { Corner(14) })
    task.spawn(function()
        local okT, img = pcall(function()
            return Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
        end)
        if okT then Avatar.Image = img end
    end)
    local NameLbl = Label(Footer, LocalPlayer.DisplayName, 11, Theme.Text, Enum.Font.GothamBold)
    NameLbl.Size, NameLbl.Position, NameLbl.ZIndex = UDim2.new(1, -46, 0, 14), UDim2.fromOffset(44, 9), 2
    NameLbl.TextTruncate = Enum.TextTruncate.AtEnd
    local UserLbl = Label(Footer, "@" .. LocalPlayer.Name, 9, Theme.SubText)
    UserLbl.Size, UserLbl.Position, UserLbl.ZIndex = UDim2.new(1, -46, 0, 12), UDim2.fromOffset(44, 24), 2
    UserLbl.TextTruncate = Enum.TextTruncate.AtEnd

    ------------------------------------------------------------------
    -- top bar + pages
    ------------------------------------------------------------------
    local Content = New("Frame", {
        Position = UDim2.fromOffset(sideW, 0), Size = UDim2.new(1, -sideW, 1, 0), BackgroundTransparency = 1, Parent = Main,
    })
    local Top = New("Frame", { Size = UDim2.new(1, 0, 0, 40), BackgroundTransparency = 1, ZIndex = 3, Parent = Content })
    New("Frame", { Size = UDim2.new(1, 0, 0, 1), Position = UDim2.new(0, 0, 1, -1), BackgroundColor3 = Theme.Stroke, BorderSizePixel = 0, ZIndex = 3, Parent = Top })

    local SearchWrap = New("Frame", {
        Size = UDim2.new(0.4, 0, 0, 26), Position = UDim2.fromOffset(10, 7), BackgroundColor3 = Theme.Element, ZIndex = 3, Parent = Top,
    }, { Corner(6), Stroke(Theme.Stroke, 1, 0.5) })
    local mag = Label(SearchWrap, "⌕", 14, Theme.SubText, Enum.Font.GothamBold, Enum.TextXAlignment.Center)
    mag.Size, mag.ZIndex = UDim2.fromOffset(24, 26), 3
    local Search = New("TextBox", {
        Size = UDim2.new(1, -28, 1, 0), Position = UDim2.fromOffset(24, 0), BackgroundTransparency = 1, Text = "",
        PlaceholderText = "Search...", PlaceholderColor3 = Theme.SubText, TextColor3 = Theme.Text, TextSize = 11,
        Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left, ClearTextOnFocus = false, ZIndex = 3, Parent = SearchWrap,
    })

    local Crumb = Label(Top, "›  Home", 11, Theme.SubText)
    Crumb.Size, Crumb.Position, Crumb.ZIndex = UDim2.new(0.3, 0, 1, 0), UDim2.new(0.4, 22, 0, 0), 3
    Crumb.TextTruncate = Enum.TextTruncate.AtEnd

    local function HeaderButton(text, xOffset)
        local b = New("TextButton", {
            Size = UDim2.fromOffset(22, 22), Position = UDim2.new(1, xOffset, 0, 9), BackgroundColor3 = Theme.Element,
            Text = text, TextColor3 = Theme.SubText, TextSize = 13, Font = Enum.Font.GothamBold, AutoButtonColor = false, ZIndex = 3, Parent = Top,
        }, { Corner(5), Stroke(Theme.Stroke, 1, 0.5) })
        Connect(b.MouseEnter, function() Tween(b, { BackgroundColor3 = Theme.ElementHover, TextColor3 = Theme.Text }) end)
        Connect(b.MouseLeave, function() Tween(b, { BackgroundColor3 = Theme.Element, TextColor3 = Theme.SubText }) end)
        return b
    end
    local MinBtn = HeaderButton("–", -56)
    local CloseBtn = HeaderButton("×", -30)

    local Pages = New("Frame", {
        Position = UDim2.fromOffset(0, 41), Size = UDim2.new(1, 0, 1, -41), BackgroundTransparency = 1, ClipsDescendants = true, Parent = Content,
    })

    MakeDraggable(Top, Main)
    MakeDraggable(Brand, Main)

    -- shine: moving gloss sweep over the whole window
    local Gloss = New("Frame", {
        Name = "Gloss", Size = UDim2.fromScale(1, 1), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0, ZIndex = 60, Parent = Main,
    }, { Corner(10) })
    pcall(function() Gloss.Interactable = false end)
    local glossGrad = New("UIGradient", {
        Rotation = 25, Offset = Vector2.new(-1, 0), Parent = Gloss,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.42, 1), NumberSequenceKeypoint.new(0.5, 0.9),
            NumberSequenceKeypoint.new(0.58, 1), NumberSequenceKeypoint.new(1, 1),
        }),
    })
    task.spawn(function()
        while Main.Parent do
            glossGrad.Offset = Vector2.new(-1, 0)
            local tw = Tween(glossGrad, { Offset = Vector2.new(1, 0) }, 2, Enum.EasingStyle.Sine)
            tw.Completed:Wait()
            task.wait(4)
        end
    end)
    Connect(RunService.RenderStepped, function()
        glowGrad.Rotation = (os.clock() * 70) % 360
    end)

    ------------------------------------------------------------------
    -- toasts
    ------------------------------------------------------------------
    local Toasts = New("Frame", {
        Size = UDim2.fromOffset(240, 400), AnchorPoint = Vector2.new(1, 1), Position = UDim2.new(1, -12, 1, -12),
        BackgroundTransparency = 1, ZIndex = 100, Parent = gui,
    }, { New("UIListLayout", { Padding = UDim.new(0, 6), VerticalAlignment = Enum.VerticalAlignment.Bottom, SortOrder = Enum.SortOrder.LayoutOrder }) })

    function Window:Notify(o)
        o = type(o) == "string" and { Content = o } or (o or {})
        local dur = o.Duration or 4
        local t = New("CanvasGroup", {
            Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Theme.Card,
            GroupTransparency = 1, Parent = Toasts,
        }, { Corner(8), Stroke(Library.Accent, 1.2), New("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }), Pad(10, 8, 10, 0) })
        local head = Label(t, o.Title or "Sovereign", 11, Theme.Text, Enum.Font.GothamBold)
        head.Size, head.LayoutOrder = UDim2.new(1, 0, 0, 16), 1
        local body = Label(t, o.Content or "", 10, Theme.SubText, Enum.Font.Gotham)
        body.Size, body.AutomaticSize, body.TextWrapped, body.LayoutOrder = UDim2.new(1, 0, 0, 0), Enum.AutomaticSize.Y, true, 2
        body.TextYAlignment = Enum.TextYAlignment.Top
        local sp = New("Frame", { Size = UDim2.new(1, 0, 0, 8), BackgroundTransparency = 1, LayoutOrder = 3, Parent = t })
        local barBg = New("Frame", { Size = UDim2.new(1, 20, 0, 3), Position = UDim2.new(0, -10, 1, -3), BackgroundColor3 = Theme.Element, BorderSizePixel = 0, Parent = sp })
        local bar = New("Frame", { Size = UDim2.fromScale(1, 1), BorderSizePixel = 0, Parent = barBg })
        Shiny(bar, false)
        Tween(t, { GroupTransparency = 0 }, 0.2)
        Tween(bar, { Size = UDim2.fromScale(0, 1) }, dur, Enum.EasingStyle.Linear)
        task.delay(dur, function()
            if not t.Parent then return end
            Tween(t, { GroupTransparency = 1 }, 0.25).Completed:Wait()
            t:Destroy()
        end)
    end

    ------------------------------------------------------------------
    -- search
    ------------------------------------------------------------------
    function Window:_applySearch()
        local q = Window._query:lower()
        for _, tab in ipairs(Window.Tabs) do
            local tabHit = q == "" or tab.Name:lower():find(q, 1, true) ~= nil
            local any = tabHit
            for _, card in ipairs(tab.Cards) do
                local cardHit = q == "" or tabHit or card.Title:lower():find(q, 1, true) ~= nil
                local anyEl = false
                for _, el in ipairs(card.Elements) do
                    local hit = cardHit or el.Title:lower():find(q, 1, true) ~= nil
                    el.Frame.Visible = hit
                    if hit then anyEl = true end
                end
                card.Frame.Visible = cardHit or anyEl
                if card.Frame.Visible then any = true end
            end
            tab.Button.Visible = any
        end
    end
    Connect(Search:GetPropertyChangedSignal("Text"), function()
        Window._query = Search.Text
        Window:_applySearch()
    end)

    ------------------------------------------------------------------
    -- tabs
    ------------------------------------------------------------------
    function Window:AddGroup(name)
        Window._order += 1
        local l = Label(TabList, string.upper(name), 9, Theme.SubText, Enum.Font.GothamBold)
        l.Size, l.LayoutOrder, l.ZIndex = UDim2.new(1, 0, 0, 24), Window._order, 2
        l.TextYAlignment = Enum.TextYAlignment.Bottom
        return l
    end

    function Window:AddTab(o)
        o = type(o) == "string" and { Name = o } or (o or {})
        Window._order += 1
        local Tab = { Name = o.Name or "Tab", Cards = {}, Window = Window }

        local btn = New("TextButton", {
            Size = UDim2.new(1, 0, 0, 28), BackgroundColor3 = Theme.Element, BackgroundTransparency = 1, Text = "",
            AutoButtonColor = false, LayoutOrder = Window._order, ZIndex = 2, Parent = TabList,
        }, { Corner(6) })
        local bar = New("Frame", { Size = UDim2.fromOffset(3, 14), Position = UDim2.new(0, 1, 0.5, -7), BorderSizePixel = 0, BackgroundTransparency = 1, ZIndex = 2, Parent = btn }, { Corner(2) })
        Shiny(bar)
        local icon = IconLabel(btn, o.Icon, UDim2.fromOffset(18, 28), UDim2.fromOffset(8, 0))
        icon.ZIndex = 2
        local nameLbl = Label(btn, Tab.Name, 11, Theme.SubText, Enum.Font.GothamMedium)
        nameLbl.Size, nameLbl.Position, nameLbl.ZIndex = UDim2.new(1, -34, 1, 0), UDim2.fromOffset(30, 0), 2
        nameLbl.TextTruncate = Enum.TextTruncate.AtEnd
        Tab.Button = btn

        local page = New("ScrollingFrame", {
            Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false,
            ScrollBarThickness = 2, ScrollBarImageColor3 = Library.Accent, AutomaticCanvasSize = Enum.AutomaticSize.Y,
            CanvasSize = UDim2.new(), Parent = Pages,
        }, { Pad(10, 10, 10, 10) })
        BindAccent(function(c) page.ScrollBarImageColor3 = c end)
        local holder = New("Frame", {
            Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, Parent = page,
        }, { New("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0, 8), VerticalAlignment = Enum.VerticalAlignment.Top }) })
        Tab._cols = {}
        for i = 1, 2 do
            Tab._cols[i] = New("Frame", {
                Size = UDim2.new(0.5, -4, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, LayoutOrder = i, Parent = holder,
            }, { New("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }) })
        end
        Tab.Page = page

        function Tab:Select()
            for _, t in ipairs(Window.Tabs) do
                t.Page.Visible = false
                Tween(t.Button, { BackgroundTransparency = 1 })
                for _, d in ipairs(t.Button:GetChildren()) do
                    if d:IsA("TextLabel") then Tween(d, { TextColor3 = Theme.SubText }) end
                    if d:IsA("Frame") then Tween(d, { BackgroundTransparency = 1 }) end
                end
            end
            page.Visible = true
            Tween(btn, { BackgroundTransparency = 0.25 })
            bar.BackgroundTransparency = 0
            for _, d in ipairs(btn:GetChildren()) do
                if d:IsA("TextLabel") then Tween(d, { TextColor3 = Theme.Text }) end
            end
            Crumb.Text = "›  " .. Tab.Name
            Window.Current = Tab
        end
        Connect(btn.MouseButton1Click, function() Tab:Select() end)
        Connect(btn.MouseEnter, function()
            if Window.Current ~= Tab then Tween(btn, { BackgroundTransparency = 0.6 }) end
        end)
        Connect(btn.MouseLeave, function()
            if Window.Current ~= Tab then Tween(btn, { BackgroundTransparency = 1 }) end
        end)

        ------------------------------------------------------------------
        -- cards
        ------------------------------------------------------------------
        function Tab:AddCard(co)
            co = type(co) == "string" and { Title = co } or (co or {})
            local col = Tab._cols[co.Column or ((#Tab.Cards % 2) + 1)] or Tab._cols[1]
            local Card = { Title = co.Title or "Card", Elements = {} }

            local frame = New("Frame", {
                Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Theme.Card,
                BackgroundTransparency = 0.08, BorderSizePixel = 0, LayoutOrder = #Tab.Cards + 1, Parent = col,
            }, { Corner(8), Stroke(Theme.Stroke, 1, 0.3), New("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }) })
            Card.Frame = frame

            local head = New("TextButton", {
                Size = UDim2.new(1, 0, 0, 32), BackgroundTransparency = 1, Text = "", AutoButtonColor = false, LayoutOrder = 1, Parent = frame,
            })
            local hIcon = IconLabel(head, co.Icon or "✦", UDim2.fromOffset(18, 32), UDim2.fromOffset(8, 0))
            BindAccent(function(c) if hIcon:IsA("TextLabel") then hIcon.TextColor3 = c end end)
            local hTitle = Label(head, Card.Title, 11, Theme.Text, Enum.Font.GothamBold)
            hTitle.Size, hTitle.Position = UDim2.new(1, -52, 1, 0), UDim2.fromOffset(28, 0)
            local chev = Label(head, ">", 12, Theme.SubText, Enum.Font.GothamBold, Enum.TextXAlignment.Center)
            chev.Size, chev.Position, chev.Rotation = UDim2.fromOffset(20, 32), UDim2.new(1, -26, 0, 0), 90

            local body = New("Frame", {
                Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, LayoutOrder = 2, Parent = frame,
            }, { New("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder }), Pad(8, 0, 8, 8) })
            Card.Body = body

            local collapsed = co.Collapsed == true
            local function applyCollapse()
                body.Visible = not collapsed
                Tween(chev, { Rotation = collapsed and 0 or 90 })
            end
            applyCollapse()
            Connect(head.MouseButton1Click, function()
                collapsed = not collapsed
                applyCollapse()
            end)
            function Card:SetCollapsed(v) collapsed = v; applyCollapse() end

            local order = 0
            local function register(elFrame, title)
                order += 1
                elFrame.LayoutOrder = order
                table.insert(Card.Elements, { Frame = elFrame, Title = title or "" })
            end

            -- Label ------------------------------------------------------
            function Card:AddLabel(text)
                local l = Label(body, text, 10, Theme.SubText, Enum.Font.Gotham)
                l.Size, l.AutomaticSize, l.TextWrapped, l.TextYAlignment = UDim2.new(1, 0, 0, 0), Enum.AutomaticSize.Y, true, Enum.TextYAlignment.Top
                register(l, text)
                return { Set = function(_, t) l.Text = t end }
            end

            -- Info row ---------------------------------------------------
            function Card:AddInfo(name, value)
                local r = New("Frame", { Size = UDim2.new(1, 0, 0, 22), BackgroundTransparency = 1, Parent = body })
                local a = Label(r, name, 10, Theme.SubText, Enum.Font.Gotham)
                a.Size, a.Position = UDim2.new(0.5, 0, 1, 0), UDim2.fromOffset(2, 0)
                local b = Label(r, tostring(value or ""), 10, Theme.Text, Enum.Font.GothamMedium, Enum.TextXAlignment.Right)
                b.Size, b.Position = UDim2.new(0.5, -2, 1, 0), UDim2.fromScale(0.5, 0)
                b.TextTruncate = Enum.TextTruncate.AtEnd
                register(r, name)
                return { Set = function(_, v) b.Text = tostring(v) end }
            end

            -- Button -----------------------------------------------------
            function Card:AddButton(bo)
                bo = type(bo) == "string" and { Title = bo } or bo
                local b = New("TextButton", {
                    Size = UDim2.new(1, 0, 0, 30), BackgroundColor3 = Theme.Element, Text = "", AutoButtonColor = false, Parent = body,
                }, { Corner(6), Stroke(Theme.Stroke, 1, 0.6) })
                local t = Label(b, bo.Title, 11, Theme.Text, Enum.Font.GothamMedium, Enum.TextXAlignment.Center)
                t.Size = UDim2.fromScale(1, 1)
                if bo.Icon then
                    t.Size, t.Position = UDim2.new(1, -26, 1, 0), UDim2.fromOffset(26, 0)
                    local ic = IconLabel(b, bo.Icon, UDim2.fromOffset(16, 30), UDim2.fromOffset(10, 0))
                    if ic:IsA("TextLabel") then BindAccent(function(c) ic.TextColor3 = c end) end
                end
                Connect(b.MouseEnter, function() Tween(b, { BackgroundColor3 = Theme.ElementHover }) end)
                Connect(b.MouseLeave, function() Tween(b, { BackgroundColor3 = Theme.Element }) end)
                Connect(b.MouseButton1Click, function()
                    b.BackgroundColor3 = Library.Accent
                    Tween(b, { BackgroundColor3 = Theme.Element }, 0.35)
                    Fire(bo.Callback)
                end)
                register(b, bo.Title)
                return { SetTitle = function(_, s) t.Text = s end }
            end

            -- Toggle -----------------------------------------------------
            function Card:AddToggle(to)
                to = type(to) == "string" and { Title = to } or to
                local state = to.Default == true
                local r = Row(body, 30)
                local l = Label(r, to.Title, 11, Theme.Text)
                l.Size, l.Position = UDim2.new(1, -56, 1, 0), UDim2.fromOffset(10, 0)
                l.TextTruncate = Enum.TextTruncate.AtEnd
                local sw = New("Frame", {
                    Size = UDim2.fromOffset(34, 18), Position = UDim2.new(1, -44, 0.5, -9), BackgroundColor3 = Color3.fromRGB(52, 26, 32), Parent = r,
                }, { Corner(9) })
                local fill = New("Frame", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Parent = sw }, { Corner(9) })
                Shiny(fill)
                local knob = New("Frame", {
                    Size = UDim2.fromOffset(14, 14), Position = UDim2.fromOffset(2, 2), BackgroundColor3 = Color3.new(1, 1, 1), Parent = sw,
                }, { Corner(7) })
                local hit = New("TextButton", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = "", Parent = r })
                local obj = {}
                local function set(v, silent)
                    state = v
                    Tween(fill, { BackgroundTransparency = v and 0 or 1 })
                    Tween(knob, { Position = v and UDim2.fromOffset(18, 2) or UDim2.fromOffset(2, 2) })
                    if not silent then Fire(to.Callback, v) end
                end
                set(state, true)
                Connect(hit.MouseButton1Click, function() set(not state) end)
                function obj:Set(v, silent) set(v == true, silent) end
                function obj:Get() return state end
                register(r, to.Title)
                return obj
            end

            -- Slider -----------------------------------------------------
            function Card:AddSlider(so)
                local min, max, inc = so.Min or 0, so.Max or 100, so.Increment or 1
                local value = math.clamp(so.Default or min, min, max)
                local r = Row(body, 44)
                local l = Label(r, so.Title, 11, Theme.Text)
                l.Size, l.Position = UDim2.new(0.7, 0, 0, 22), UDim2.fromOffset(10, 2)
                local v = Label(r, "", 10, Theme.SubText, Enum.Font.GothamBold, Enum.TextXAlignment.Right)
                v.Size, v.Position = UDim2.new(0.3, -10, 0, 22), UDim2.new(0.7, 0, 0, 2)
                local track = New("Frame", {
                    Size = UDim2.new(1, -20, 0, 6), Position = UDim2.fromOffset(10, 29), BackgroundColor3 = Color3.fromRGB(52, 26, 32), Parent = r,
                }, { Corner(3) })
                local fill = New("Frame", { Size = UDim2.fromScale(0, 1), Parent = track }, { Corner(3) })
                Shiny(fill)
                local knob = New("Frame", {
                    Size = UDim2.fromOffset(12, 12), AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(1, 0.5),
                    BackgroundColor3 = Color3.new(1, 1, 1), Parent = fill,
                }, { Corner(6) })
                local hit = New("TextButton", {
                    Size = UDim2.new(1, 0, 0, 26), Position = UDim2.fromOffset(0, 18), BackgroundTransparency = 1, Text = "", Parent = r,
                })
                local obj = {}
                local function fmt(n) return inc < 1 and string.format("%.2f", n) or tostring(n) end
                local function set(n, silent)
                    n = math.clamp(math.floor((n - min) / inc + 0.5) * inc + min, min, max)
                    value = n
                    fill.Size = UDim2.fromScale((n - min) / math.max(max - min, 1e-9), 1)
                    v.Text = fmt(n) .. (so.Suffix or "")
                    if not silent then Fire(so.Callback, n) end
                end
                set(value, true)
                local dragging = false
                local function fromInput(pos)
                    set(min + (max - min) * math.clamp((pos.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1))
                end
                Connect(hit.InputBegan, function(i)
                    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
                        dragging = true
                        fromInput(i.Position)
                    end
                end)
                Connect(UserInputService.InputChanged, function(i)
                    if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
                        fromInput(i.Position)
                    end
                end)
                Connect(UserInputService.InputEnded, function(i)
                    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = false end
                end)
                function obj:Set(n, silent) set(n, silent) end
                function obj:Get() return value end
                register(r, so.Title)
                return obj
            end

            -- Dropdown ---------------------------------------------------
            function Card:AddDropdown(dopt)
                local values = dopt.Values or {}
                local multi = dopt.Multi == true
                local selected = multi and {} or dopt.Default
                if multi then for _, x in ipairs(dopt.Default or {}) do selected[x] = true end end

                local holder = New("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Theme.Element,
                    BorderSizePixel = 0, ClipsDescendants = true, Parent = body,
                }, { Corner(6), Stroke(Theme.Stroke, 1, 0.6), New("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }) })
                local headBtn = New("TextButton", {
                    Size = UDim2.new(1, 0, 0, 30), BackgroundTransparency = 1, Text = "", AutoButtonColor = false, LayoutOrder = 1, Parent = holder,
                })
                local l = Label(headBtn, dopt.Title, 11, Theme.Text)
                l.Size, l.Position = UDim2.new(0.5, 0, 1, 0), UDim2.fromOffset(10, 0)
                l.TextTruncate = Enum.TextTruncate.AtEnd
                local val = Label(headBtn, "", 10, Theme.SubText, Enum.Font.GothamMedium, Enum.TextXAlignment.Right)
                val.Size, val.Position = UDim2.new(0.5, -30, 1, 0), UDim2.fromScale(0.5, 0)
                val.TextTruncate = Enum.TextTruncate.AtEnd
                local arrow = Label(headBtn, ">", 11, Theme.SubText, Enum.Font.GothamBold, Enum.TextXAlignment.Center)
                arrow.Size, arrow.Position, arrow.Rotation = UDim2.fromOffset(18, 30), UDim2.new(1, -24, 0, 0), 90

                local list = New("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, Visible = false,
                    LayoutOrder = 2, Parent = holder,
                }, { New("UIListLayout", { Padding = UDim.new(0, 2) }), Pad(6, 0, 6, 6) })

                local obj = {}
                local function display()
                    if multi then
                        local t = {}
                        for _, x in ipairs(values) do if selected[x] then table.insert(t, tostring(x)) end end
                        val.Text = #t > 0 and table.concat(t, ", ") or "None"
                    else
                        val.Text = selected ~= nil and tostring(selected) or "None"
                    end
                end
                local buttons = {}
                local function paint()
                    for x, b in pairs(buttons) do
                        local on = multi and selected[x] or (not multi and selected == x)
                        b.BackgroundColor3 = on and Library.Accent or Theme.Card
                        b.TextColor3 = on and Color3.new(1, 1, 1) or Theme.SubText
                    end
                end
                local function build()
                    for _, c in ipairs(list:GetChildren()) do if c:IsA("TextButton") then c:Destroy() end end
                    buttons = {}
                    for _, x in ipairs(values) do
                        local b = New("TextButton", {
                            Size = UDim2.new(1, 0, 0, 24), BackgroundColor3 = Theme.Card, Text = tostring(x), TextSize = 10,
                            Font = Enum.Font.GothamMedium, TextColor3 = Theme.SubText, AutoButtonColor = false, Parent = list,
                        }, { Corner(5) })
                        buttons[x] = b
                        Connect(b.MouseButton1Click, function()
                            if multi then
                                selected[x] = not selected[x] or nil
                                Fire(dopt.Callback, selected)
                            else
                                selected = x
                                Fire(dopt.Callback, x)
                            end
                            display()
                            paint()
                        end)
                    end
                    paint()
                end
                build(); display()

                local open = false
                Connect(headBtn.MouseButton1Click, function()
                    open = not open
                    list.Visible = open
                    Tween(arrow, { Rotation = open and 270 or 90 })
                end)
                function obj:Set(v)
                    if multi then selected = {}; for _, x in ipairs(v or {}) do selected[x] = true end else selected = v end
                    display(); paint()
                    Fire(dopt.Callback, selected)
                end
                function obj:Get() return selected end
                function obj:Refresh(newValues)
                    values = newValues or {}
                    build(); display()
                end
                register(holder, dopt.Title)
                return obj
            end

            -- Input ------------------------------------------------------
            function Card:AddInput(io)
                local r = Row(body, 30)
                local l = Label(r, io.Title, 11, Theme.Text)
                l.Size, l.Position = UDim2.new(0.42, 0, 1, 0), UDim2.fromOffset(10, 0)
                l.TextTruncate = Enum.TextTruncate.AtEnd
                local box = New("TextBox", {
                    Size = UDim2.new(0.58, -16, 0, 22), Position = UDim2.new(0.42, 6, 0.5, -11), BackgroundColor3 = Theme.Card,
                    Text = io.Default or "", PlaceholderText = io.Placeholder or "...", PlaceholderColor3 = Theme.SubText,
                    TextColor3 = Theme.Text, TextSize = 10, Font = Enum.Font.Gotham, ClearTextOnFocus = false, Parent = r,
                }, { Corner(5), Stroke(Theme.Stroke, 1, 0.5), Pad(6, 0, 6, 0) })
                Connect(box.FocusLost, function(enter)
                    if enter or io.CallbackOnBlur then Fire(io.Callback, box.Text) end
                end)
                register(r, io.Title)
                return { Set = function(_, t) box.Text = t end, Get = function() return box.Text end }
            end

            table.insert(Tab.Cards, Card)
            return Card
        end

        table.insert(Window.Tabs, Tab)
        if #Window.Tabs == 1 then Tab:Select() end
        return Tab
    end

    ------------------------------------------------------------------
    -- minimize / restore / close
    ------------------------------------------------------------------
    local Float = New("ImageButton", {
        Name = "Float", Size = UDim2.fromOffset(44, 44), Position = UDim2.new(0, 14, 0.5, -22), BackgroundColor3 = Theme.Sidebar,
        Image = logo, AutoButtonColor = false, Visible = false, ZIndex = 80, Parent = gui,
    }, { Corner(22) })
    local fStroke = Stroke(Color3.new(1, 1, 1), 2)
    fStroke.Parent = Float
    local fGrad = New("UIGradient", { Parent = fStroke })
    BindAccent(function(c)
        fGrad.Color = ColorSequence.new({ CSK(0, c), CSK(0.5, Color3.fromRGB(255, 195, 200)), CSK(1, c:Lerp(Color3.new(0, 0, 0), 0.55)) })
    end)
    Connect(RunService.RenderStepped, function() fGrad.Rotation = (os.clock() * 90) % 360 end)
    MakeDraggable(Float, Float)

    function Window:Minimize() Main.Visible = false; Float.Visible = true end
    function Window:Restore() Main.Visible = true; Float.Visible = false end
    function Window:Toggle() if Main.Visible then Window:Minimize() else Window:Restore() end end
    function Window:Destroy()
        for _, c in ipairs(Library._conns) do pcall(function() c:Disconnect() end) end
        Library._conns, Library._binds = {}, {}
        gui:Destroy()
    end

    local downPos
    Connect(Float.InputBegan, function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then downPos = i.Position end
    end)
    Connect(Float.InputEnded, function(i)
        if downPos and (i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch) then
            if (i.Position - downPos).Magnitude < 6 then Window:Restore() end
            downPos = nil
        end
    end)
    Connect(MinBtn.MouseButton1Click, function() Window:Minimize() end)
    Connect(CloseBtn.MouseButton1Click, function() Window:Destroy() end)

    local toggleKey = opts.ToggleKey or Enum.KeyCode.RightShift
    Connect(UserInputService.InputBegan, function(i, gp)
        if not gp and i.KeyCode == toggleKey then Window:Toggle() end
    end)

    Library.Windows[#Library.Windows + 1] = Window
    Library._active = Window
    return Window
end

function Library:Notify(o)
    if self._active then self._active:Notify(o) end
end

return Library
