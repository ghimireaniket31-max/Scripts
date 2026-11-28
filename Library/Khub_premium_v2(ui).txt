local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

local Library = {
    Name = "Perplexity",
    Version = "3.1.0",
    Author = "@rainlover.r and Claude.AI",
    DefaultIconPack = "Lucide",
    IconSources = {
        Material = "https://raw.githubusercontent.com/Skinny-yz/NullUI-Assets/main/icons/MaterialIcons.luau",
        Lucide = "https://raw.githubusercontent.com/Skinny-yz/NullUI-Assets/main/icons/LucideIcons.luau",
        Phosphor = "https://raw.githubusercontent.com/Skinny-yz/NullUI-Assets/main/icons/Phosphor.luau",
        ["Phosphor-Filled"] = "https://raw.githubusercontent.com/Skinny-yz/NullUI-Assets/main/icons/Phosphor%20Filled.luau",
        SF = "https://raw.githubusercontent.com/Skinny-yz/NullUI-Assets/main/icons/SFSymbols.luau",
    },
}

local Window = {}
Window.__index = Window

local Tab = {}
Tab.__index = Tab

local Section = {}
Section.__index = Section

local INTER_FAMILY = "rbxassetid://12187365364"

local function sansFont(weight)
    return Font.new(INTER_FAMILY, weight, Enum.FontStyle.Normal)
end

local function monoFont(weight)
    local ok, font = pcall(function()
        return Font.fromName("RobotoMono", weight)
    end)
    if ok and font then
        return font
    end
    return Font.fromEnum(Enum.Font.Code)
end

local FontSets = {
    Sans = {
        Regular = sansFont(Enum.FontWeight.Regular),
        Medium = sansFont(Enum.FontWeight.Medium),
        Semi = sansFont(Enum.FontWeight.SemiBold),
        Bold = sansFont(Enum.FontWeight.Bold),
    },
    Mono = {
        Regular = monoFont(Enum.FontWeight.Regular),
        Medium = monoFont(Enum.FontWeight.Medium),
        Semi = monoFont(Enum.FontWeight.SemiBold),
        Bold = monoFont(Enum.FontWeight.Bold),
    },
}

local FONT_TOKENS = { Regular = "FontRegular", Medium = "FontMedium", Semi = "FontSemi", Bold = "FontBold" }

local function rgb(r, g, b)
    return Color3.fromRGB(r, g, b)
end

local Styles = {
    Perplexity = {
        Id = "Perplexity",
        Display = "Perplexity (Original)",
        Nav = "Sidebar",
        SingleColumn = true,
        RailFraction = 0.18,
        RailWidth = 170,
        RailWidthMobile = 100,
        ShowLabels = true,
        ShowIcons = true,
        Traffic = false,
        ToggleKind = "Switch",
        Terminal = false,
        Liquid = true,
        Border = true,
        Glow = false,
        Footer = true,
        Mono = false,
        Colors = {
            SurfaceHi = rgb(22, 28, 64), Dialog = rgb(30, 38, 92), DialogHi = rgb(44, 54, 120), LiquidA = rgb(8, 14, 56), LiquidB = rgb(40, 84, 235), LiquidC = rgb(96, 72, 230), LiquidSpec = rgb(150, 196, 255),
            Accent = rgb(79, 91, 255), AccentAlt = rgb(139, 92, 246), Background = rgb(7, 9, 24),
            Surface = rgb(14, 18, 44), SurfaceAlt = rgb(24, 30, 72), Outline = rgb(52, 62, 132),
            Text = rgb(236, 238, 255), Muted = rgb(138, 148, 198), Hover = rgb(34, 42, 96),
            ToggleOn = rgb(79, 91, 255), ToggleOff = rgb(74, 80, 124), Knob = rgb(176, 184, 232),
            Success = rgb(52, 211, 120), Warning = rgb(245, 176, 65), Danger = rgb(244, 86, 96),
        },
        Numbers = { TransWindow = 0.1, TransPanel = 0.4, TransCard = 0.5, TransField = 0.35, TransSheen = 0.94, TransStroke = 0.35, TransLine = 1, TransHeader = 0.72, TransRail = 0.8, TransPopup = 0.04, TransShadow = 0.9, TransRim = 0.8 },
        Radius = { RadWindow = 16, RadPanel = 12, RadCard = 10, RadControl = 8, RadIcon = 99, RadPill = UDim.new(1, 0), RadBlob = UDim.new(0.5, 0), RadCover = 8 },
    },
    MacLauncher = {
        Id = "MacLauncher",
        Display = "MacLauncher",
        Nav = "Dock",
        ShowLabels = false,
        ShowIcons = true,
        Traffic = true,
        ToggleKind = "Switch",
        Terminal = false,
        Liquid = true,
        Border = false,
        Glow = false,
        Footer = false,
        Mono = false,
        Colors = {
            SurfaceHi = rgb(60, 60, 64), Dialog = rgb(62, 62, 68), DialogHi = rgb(80, 80, 88), LiquidA = rgb(26, 30, 56), LiquidB = rgb(10, 132, 255), LiquidC = rgb(94, 92, 230), LiquidSpec = rgb(190, 215, 255),
            Accent = rgb(10, 132, 255), AccentAlt = rgb(94, 92, 230), Background = rgb(30, 30, 32),
            Surface = rgb(46, 46, 49), SurfaceAlt = rgb(62, 62, 66), Outline = rgb(84, 84, 88),
            Text = rgb(245, 245, 247), Muted = rgb(152, 152, 158), Hover = rgb(72, 72, 76),
            ToggleOn = rgb(48, 209, 88), ToggleOff = rgb(92, 92, 98), Knob = rgb(255, 255, 255),
            Success = rgb(48, 209, 88), Warning = rgb(255, 159, 10), Danger = rgb(255, 69, 58),
        },
        Numbers = { TransWindow = 0.16, TransPanel = 0.3, TransCard = 1, TransField = 0.4, TransSheen = 0.92, TransStroke = 0.55, TransLine = 0.82, TransHeader = 0.55, TransRail = 1, TransPopup = 0.04, TransShadow = 0.86, TransRim = 0.78 },
        Radius = { RadWindow = 14, RadPanel = 11, RadCard = 8, RadControl = 7, RadIcon = 8, RadPill = UDim.new(1, 0), RadBlob = UDim.new(0.5, 0), RadCover = 8 },
    },
    OperaGX = {
        Id = "OperaGX",
        Display = "OperaGX Browser",
        Nav = "Sidebar",
        RailWidth = 66,
        RailWidthMobile = 60,
        ShowLabels = false,
        ShowIcons = true,
        Traffic = false,
        ToggleKind = "Switch",
        Terminal = false,
        Liquid = true,
        Border = true,
        Glow = true,
        Footer = false,
        Mono = false,
        Gamer = true,
        Uppercase = true,
        Corner = true,
        BorderSpeed = 95,
        BorderThickness = 2,
        Colors = {
            SurfaceHi = rgb(30, 20, 36), Dialog = rgb(40, 24, 46), DialogHi = rgb(58, 30, 64),
            LiquidA = rgb(46, 4, 26), LiquidB = rgb(255, 26, 72), LiquidC = rgb(178, 0, 255), LiquidSpec = rgb(255, 150, 190),
            Accent = rgb(255, 26, 72), AccentAlt = rgb(178, 0, 255), Background = rgb(6, 6, 10),
            Surface = rgb(16, 14, 22), SurfaceAlt = rgb(30, 24, 40), Outline = rgb(96, 24, 56),
            Text = rgb(246, 240, 248), Muted = rgb(172, 148, 174), Hover = rgb(56, 26, 54),
            ToggleOn = rgb(255, 26, 72), ToggleOff = rgb(66, 56, 80), Knob = rgb(224, 208, 232),
            Success = rgb(60, 230, 140), Warning = rgb(255, 176, 50), Danger = rgb(255, 60, 84),
        },
        Numbers = { TransWindow = 0.04, TransPanel = 0.2, TransCard = 0.22, TransField = 0.2, TransSheen = 0.95, TransStroke = 0.15, TransLine = 1, TransHeader = 0.5, TransRail = 0.55, TransPopup = 0.04, TransShadow = 0.88, TransRim = 0.68 },
        Radius = { RadWindow = 0, RadPanel = 0, RadCard = 0, RadControl = 0, RadIcon = 0, RadPill = 0, RadBlob = 0, RadCover = 0 },
    },
    ClaudeCode = {
        Id = "ClaudeCode",
        Display = "Claude Code",
        Nav = "Sidebar",
        RailWidth = 132,
        RailWidthMobile = 96,
        ShowLabels = true,
        ShowIcons = false,
        Traffic = true,
        ToggleKind = "Text",
        Terminal = true,
        Liquid = false,
        Border = false,
        Glow = false,
        Footer = false,
        Mono = true,
        Colors = {
            SurfaceHi = rgb(42, 40, 37), Dialog = rgb(46, 44, 40), DialogHi = rgb(60, 57, 52), LiquidA = rgb(40, 26, 20), LiquidB = rgb(217, 119, 87), LiquidC = rgb(150, 90, 70), LiquidSpec = rgb(240, 200, 170),
            Accent = rgb(217, 119, 87), AccentAlt = rgb(236, 160, 120), Background = rgb(22, 21, 20),
            Surface = rgb(31, 30, 28), SurfaceAlt = rgb(42, 40, 37), Outline = rgb(78, 74, 68),
            Text = rgb(232, 228, 220), Muted = rgb(150, 144, 134), Hover = rgb(48, 46, 42),
            ToggleOn = rgb(217, 119, 87), ToggleOff = rgb(84, 80, 74), Knob = rgb(200, 194, 184),
            Success = rgb(126, 200, 120), Warning = rgb(230, 190, 90), Danger = rgb(232, 104, 92),
        },
        Numbers = { TransWindow = 0.02, TransPanel = 0.12, TransCard = 1, TransField = 0.2, TransSheen = 1, TransStroke = 0.45, TransLine = 0.8, TransHeader = 0.8, TransRail = 0.85, TransPopup = 0.04, TransShadow = 0.94, TransRim = 0.86 },
        Radius = { RadWindow = 9, RadPanel = 5, RadCard = 4, RadControl = 4, RadIcon = 4, RadPill = UDim.new(1, 0), RadBlob = UDim.new(0.5, 0), RadCover = 8 },
    },
}

local StyleOrder = { "Perplexity", "MacLauncher", "OperaGX", "ClaudeCode" }

local StyleKeys = {
    perplexity = "Perplexity", perplexityoriginal = "Perplexity", original = "Perplexity",
    maclauncher = "MacLauncher", mac = "MacLauncher", macos = "MacLauncher", launcher = "MacLauncher",
    operagx = "OperaGX", operagxbrowser = "OperaGX", gx = "OperaGX", opera = "OperaGX",
    claudecode = "ClaudeCode", claude = "ClaudeCode", terminal = "ClaudeCode",
}

local function resolveStyle(name)
    if type(name) ~= "string" then
        return nil
    end
    local key = string.lower(name):gsub("[^%w]", "")
    return StyleKeys[key]
end

local COLOR_TOKENS = {
    "Accent", "AccentAlt", "Background", "Surface", "SurfaceHi", "SurfaceAlt", "Dialog", "DialogHi", "Outline", "Text", "Muted",
    "Hover", "ToggleOn", "ToggleOff", "Knob", "Success", "Warning", "Danger",
    "LiquidA", "LiquidB", "LiquidC", "LiquidSpec",
}

local MOTION = {
    Hover = { 0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.Out },
    Press = { 0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out },
    Release = { 0.24, Enum.EasingStyle.Quint, Enum.EasingDirection.Out },
    Toggle = { 0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out },
    Tab = { 0.24, Enum.EasingStyle.Quint, Enum.EasingDirection.Out },
    Dialog = { 0.26, Enum.EasingStyle.Quint, Enum.EasingDirection.Out },
    DialogOut = { 0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.In },
    WindowIn = { 0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out },
    WindowOut = { 0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In },
    Toast = { 0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out },
    ToastOut = { 0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In },
    Popup = { 0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out },
    PopupOut = { 0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In },
    Page = { 0.28, Enum.EasingStyle.Quint, Enum.EasingDirection.Out },
    PageOut = { 0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.In },
    Collapse = { 0.26, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut },
    Sheet = { 0.32, Enum.EasingStyle.Quint, Enum.EasingDirection.Out },
    Pulse = { 0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out },
    Spring = { 0.32, Enum.EasingStyle.Back, Enum.EasingDirection.Out },
    Fade = { 0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out },
}

local QUALITY = {
    High = { Liquid = 40, LiquidTouch = 24, Blobs = 99, Border = 60, Rim = true, Shadow = true, Page = true, Decor = true },
    Medium = { Liquid = 24, LiquidTouch = 16, Blobs = 5, Border = 30, Rim = true, Shadow = true, Page = true, Decor = true },
    Low = { Liquid = 0, LiquidTouch = 0, Blobs = 3, Border = 0, Rim = false, Shadow = false, Page = false, Decor = false },
}

local TONES = { Text = "Text", Muted = "Muted", Success = "Success", Danger = "Danger", Warning = "Warning", Accent = "Accent" }
local TEXT_TONES = { Text = "Text", Muted = "Muted", Success = "Success", Danger = "Danger", Warning = "Warning", Accent = "AccentText" }

local RIM_MASK = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0),
    NumberSequenceKeypoint.new(0.35, 0.55),
    NumberSequenceKeypoint.new(0.65, 1),
    NumberSequenceKeypoint.new(1, 0.8),
})

local BORDER_SWEEP = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.05),
    NumberSequenceKeypoint.new(0.3, 0.8),
    NumberSequenceKeypoint.new(0.5, 0.9),
    NumberSequenceKeypoint.new(0.7, 0.8),
    NumberSequenceKeypoint.new(1, 0.05),
})

local QUALITY_ORDER = { "Low", "Medium", "High" }

local OPACITY_TOKENS = { "TransWindow", "TransPanel", "TransCard", "TransField", "TransHeader", "TransRail", "TransPopup" }

local COLOR_TOKEN_SET = {}
for _, token in ipairs(COLOR_TOKENS) do
    COLOR_TOKEN_SET[token] = true
end

local INK_DARK = Color3.fromRGB(22, 25, 38)
local INK_LIGHT = Color3.fromRGB(244, 245, 252)
local BLACK = Color3.new(0, 0, 0)
local WHITE = Color3.new(1, 1, 1)

local function linearChannel(value)
    if value <= 0.03928 then
        return value / 12.92
    end
    return ((value + 0.055) / 1.055) ^ 2.4
end

local function relativeLuminance(color)
    return 0.2126 * linearChannel(color.R) + 0.7152 * linearChannel(color.G) + 0.0722 * linearChannel(color.B)
end

local function contrastRatio(a, b)
    local la, lb = relativeLuminance(a), relativeLuminance(b)
    if la < lb then
        la, lb = lb, la
    end
    return (la + 0.05) / (lb + 0.05)
end

local function isBrightColor(color)
    return contrastRatio(INK_DARK, color) > contrastRatio(INK_LIGHT, color)
end

local function ensureContrast(color, background, minimum)
    if contrastRatio(color, background) >= minimum then
        return color
    end
    local target = isBrightColor(background) and BLACK or WHITE
    for step = 1, 14 do
        local candidate = color:Lerp(target, step / 16)
        if contrastRatio(candidate, background) >= minimum then
            return candidate
        end
    end
    return color:Lerp(target, 0.9)
end

local function inkOn(color)
    local white = contrastRatio(WHITE, color)
    return (white >= 3 or white >= contrastRatio(INK_DARK, color)) and WHITE or INK_DARK
end

local function ensureAgainst(color, surfaces, minimum)
    for _, surface in ipairs(surfaces) do
        color = ensureContrast(color, surface, minimum)
    end
    return color
end

local function worstContrast(color, surfaces)
    local worst = 21
    for _, surface in ipairs(surfaces) do
        worst = math.min(worst, contrastRatio(color, surface))
    end
    return worst
end

local function shiftHue(color, amount, saturation, value)
    local h, s, v = color:ToHSV()
    return Color3.fromHSV((h + amount) % 1, math.clamp(s * (saturation or 1), 0, 1), math.clamp(v * (value or 1), 0, 1))
end

local function toColor(value)
    if typeof(value) == "Color3" then
        return value
    end
    if type(value) == "string" then
        local cleaned = string.gsub(value, "[#%s]", "")
        if #cleaned == 6 and string.match(cleaned, "^%x+$") then
            local ok, color = pcall(Color3.fromHex, "#" .. cleaned)
            if ok and typeof(color) == "Color3" then
                return color
            end
        end
    end
    return nil
end

local BuiltinPresets = {
    Ocean = { Colors = { Accent = "#0A84FF", AccentAlt = "#5E5CE6" } },
    Crimson = { Colors = { Accent = "#FF1A48", AccentAlt = "#B200FF" } },
    Mint = { Colors = { Accent = "#34D399", AccentAlt = "#22D3EE" } },
    Amber = { Colors = { Accent = "#F59E0B", AccentAlt = "#F97316" } },
    Violet = { Colors = { Accent = "#8B5CF6", AccentAlt = "#D946EF" } },
    Rose = { Colors = { Accent = "#FB7185", AccentAlt = "#F472B6" } },
    Mono = { Colors = { Accent = "#E5E7EB", AccentAlt = "#9CA3AF" } },
    Daylight = {
        Opacity = 1.1,
        Colors = {
            Background = "#F2F4FA", Surface = "#FFFFFF", SurfaceAlt = "#E7EBF6", SurfaceHi = "#FFFFFF", Dialog = "#FFFFFF", DialogHi = "#EEF1FA",
            Outline = "#C6CDE2", Hover = "#DCE2F2", Text = "#151826", Muted = "#5B6279", ToggleOff = "#B6BED6", Knob = "#FFFFFF",
            Accent = "#4F5BFF", AccentAlt = "#8B5CF6", ToggleOn = "#4F5BFF",
        },
    },
}
Library.Presets = BuiltinPresets

local PRESET_ORDER = { "Ocean", "Crimson", "Mint", "Amber", "Violet", "Rose", "Mono", "Daylight" }

local function liquidBlob(x, y, w, h, alpha, rim, seed)
    return {
        X = x, Y = y, W = w, H = h,
        AX = 0.09 + 0.02 * (seed % 3), AY = 0.07 + 0.015 * (seed % 4), AX2 = 0.04, AY2 = 0.05,
        FX = 0.071 + 0.013 * seed, FY = 0.059 + 0.011 * seed, FX2 = 0.137 + 0.007 * seed, FY2 = 0.113 + 0.009 * seed,
        FW = 0.083 + 0.01 * seed, FH = 0.067 + 0.012 * seed, FW2 = 0.151 + 0.006 * seed, FH2 = 0.129 + 0.008 * seed,
        R = 20 * seed, FR = 0.05 + 0.007 * seed, Drift = 1.2 + 0.35 * seed, Flow = 6 + 2 * seed, Spin = 10 + 3 * seed,
        Alpha = alpha, Rim = rim, Phase = seed * 2.399,
    }
end

local LIQUID_WINDOW = {
    liquidBlob(0.22, 0.34, 1.15, 0.95, { 0.9, 0.8, 0.96 }, 1.5, 1),
    liquidBlob(0.8, 0.72, 1.05, 0.98, { 0.9, 0.78, 0.96 }, 1.5, 2),
    liquidBlob(0.52, 0.06, 0.85, 0.62, { 0.93, 0.84, 0.97 }, 1.2, 3),
    liquidBlob(0.12, 0.84, 0.58, 0.5, { 0.86, 0.72, 0.95 }, 1.5, 4),
    liquidBlob(0.88, 0.18, 0.52, 0.56, { 0.86, 0.72, 0.95 }, 1.5, 5),
    liquidBlob(0.62, 0.56, 0.34, 0.3, { 0.82, 0.62, 0.93 }, 2, 6),
    liquidBlob(0.3, 0.52, 0.28, 0.32, { 0.82, 0.62, 0.93 }, 2, 7),
}

local LIQUID_PROMO = {
    liquidBlob(0.0, 0.05, 0.75, 0.7, { 0.72, 0.55, 0.9 }, 1.5, 11),
    liquidBlob(1.0, 0.95, 0.75, 0.75, { 0.72, 0.55, 0.9 }, 1.5, 12),
    liquidBlob(0.96, 0.05, 0.42, 0.5, { 0.7, 0.5, 0.9 }, 2, 13),
    liquidBlob(0.04, 0.95, 0.4, 0.42, { 0.7, 0.5, 0.9 }, 2, 14),
}

local DesktopMetrics = {
    Touch = false, Size = Vector2.new(680, 410), Top = 36, Pad = 6, PanelPad = 10, Gap = 6, Row = 30, RowTall = 38,
    Text = 13, Small = 11, TabHeight = 30, IconSize = 15, Bubble = 26, ControlHeight = 22,
    CategoryHeight = 26, CardHeight = 96,
    ToggleWidth = 32, ToggleHeight = 18, DropdownWidth = 112, InputWidth = 120, SliderHeight = 40,
    SliderLabel = 18, TrackHeight = 5, KnobSize = 12, ItemHeight = 24, MaxDropdownItems = 6, ScrollBar = 3,
    BarHeight = 12, SwatchWidth = 26, SwatchHeight = 15, ButtonHeight = 26, MinColumn = 200, PopupWidth = 184,
    DockIcon = 38, DockHeight = 54, Traffic = 10,
}

local MobileMetrics = {
    Touch = true, Size = Vector2.new(540, 300), Top = 36, Pad = 7, PanelPad = 9, Gap = 7, Row = 36, RowTall = 44,
    Text = 13, Small = 11, TabHeight = 34, IconSize = 16, Bubble = 28, ControlHeight = 27,
    CategoryHeight = 30, CardHeight = 100,
    ToggleWidth = 38, ToggleHeight = 22, DropdownWidth = 124, InputWidth = 136, SliderHeight = 50,
    SliderLabel = 20, TrackHeight = 6, KnobSize = 18, ItemHeight = 32, MaxDropdownItems = 6, ScrollBar = 3,
    BarHeight = 18, SwatchWidth = 34, SwatchHeight = 21, ButtonHeight = 32, MinColumn = 236, PopupWidth = 196,
    DockIcon = 40, DockHeight = 56, Traffic = 11,
}

local filesSupported = writefile ~= nil and readfile ~= nil and isfile ~= nil and listfiles ~= nil and makefolder ~= nil and isfolder ~= nil
local clipboardWriter = setclipboard or toclipboard
local customAsset = getcustomasset or getsynasset

local TEXT_CLASSES = { TextLabel = true, TextButton = true, TextBox = true }

local function new(className, properties, parent)
    local instance = Instance.new(className)
    if instance:IsA("GuiObject") then
        instance.BorderSizePixel = 0
        instance.BackgroundTransparency = 1
    end
    if className == "TextButton" or className == "ImageButton" then
        instance.AutoButtonColor = false
    end
    if TEXT_CLASSES[className] then
        instance.Text = ""
    end
    if className == "TextBox" then
        instance.ClearTextOnFocus = false
    end
    if properties then
        for key, value in pairs(properties) do
            instance[key] = value
        end
        if properties.BackgroundColor3 ~= nil and properties.BackgroundTransparency == nil then
            instance.BackgroundTransparency = 0
        end
    end
    if parent then
        instance.Parent = parent
    end
    return instance
end

local function addList(parent, padding, direction)
    return new("UIListLayout", {
        Padding = UDim.new(0, padding or 0),
        FillDirection = direction or Enum.FillDirection.Vertical,
        SortOrder = Enum.SortOrder.LayoutOrder,
    }, parent)
end

local function addPadding(parent, top, right, bottom, left)
    return new("UIPadding", {
        PaddingTop = UDim.new(0, top),
        PaddingRight = UDim.new(0, right or top),
        PaddingBottom = UDim.new(0, bottom or top),
        PaddingLeft = UDim.new(0, left or right or top),
    }, parent)
end

local function slug(text)
    local value = string.lower(tostring(text or ""))
    value = value:gsub("[^%w]+", "_")
    value = value:gsub("^_+", ""):gsub("_+$", "")
    if value == "" then
        value = "feature"
    end
    return value
end

local function hashText(text)
    local value = 5381
    for index = 1, #text do
        value = (value * 33 + string.byte(text, index)) % 4294967296
    end
    return string.format("%08x", value)
end

local function escapeRich(text)
    local value = tostring(text):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")
    return value
end

local function hexOf(color)
    return "#" .. color:ToHex()
end

local function decodeJson(text)
    local ok, data = pcall(function()
        return HttpService:JSONDecode(text)
    end)
    if ok and type(data) == "table" then
        return data
    end
    return nil
end

local function sanitizeName(name)
    name = tostring(name or "")
    name = name:gsub("[^%w_%- ]", "")
    name = name:gsub("^%s+", ""):gsub("%s+$", "")
    return name
end

local function decimalsOf(step)
    local text = string.format("%.6f", step)
    text = text:gsub("0+$", "")
    local fraction = text:match("%.(%d*)$")
    return fraction and #fraction or 0
end

local MOUSE_NAMES = { MouseButton1 = "MB1", MouseButton2 = "MB2", MouseButton3 = "MB3" }

local function keyToText(key)
    if key == nil then
        return "None"
    end
    if key.EnumType == Enum.UserInputType then
        return MOUSE_NAMES[key.Name] or key.Name
    end
    return key.Name
end

local function serializeKey(key)
    if key == nil then
        return "None"
    end
    return tostring(key.EnumType) .. "." .. key.Name
end

local function deserializeKey(text)
    if type(text) ~= "string" or text == "None" then
        return nil
    end
    local kind, name = text:match("^(%w+)%.(%w+)$")
    if not kind then
        return nil
    end
    local ok, value = pcall(function()
        return Enum[kind][name]
    end)
    if ok then
        return value
    end
    return nil
end

local function keyFromName(text)
    text = tostring(text or "")
    if text == "" or string.lower(text) == "none" then
        return nil
    end
    local candidates = { text, string.upper(string.sub(text, 1, 1)) .. string.sub(text, 2), string.upper(text) }
    for _, candidate in ipairs(candidates) do
        local ok, value = pcall(function()
            return Enum.KeyCode[candidate]
        end)
        if ok and value then
            return value
        end
    end
    return nil
end

local function inputMatchesKey(input, key)
    if key == nil then
        return false
    end
    if key.EnumType == Enum.KeyCode then
        return input.KeyCode == key
    end
    return input.UserInputType == key
end

local function sameList(first, second)
    if #first ~= #second then
        return false
    end
    for index = 1, #first do
        if first[index] ~= second[index] then
            return false
        end
    end
    return true
end

local function dispatch(window, label, callback, arguments, count)
    task.spawn(function()
        if window then
            if not window.Destroyed then
                window:_safe(label, callback, table.unpack(arguments, 1, count))
            end
        else
            callback(table.unpack(arguments, 1, count))
        end
    end)
end

local function fire(element, ...)
    local window = element.Window
    if window and window.Destroyed then
        return
    end
    local count = select("#", ...) + 1
    local arguments = { ... }
    arguments[count] = element
    local label = tostring(element.Flag or element.CommandName or element.Type or "element")
    if element.Callback then
        dispatch(window, label, element.Callback, arguments, count)
    end
    for _, listener in ipairs(element._listeners) do
        dispatch(window, label, listener, arguments, count)
    end
    if window then
        window:_elementChanged(element, ...)
    end
end

local function httpGet(url)
    local ok, body = pcall(function()
        return game:HttpGet(url)
    end)
    if ok and type(body) == "string" and #body > 0 then
        return body
    end
    local requester = (syn and syn.request) or request or http_request or (http and http.request)
    if requester then
        local okRequest, response = pcall(requester, { Url = url, Method = "GET" })
        if okRequest and type(response) == "table" and type(response.Body) == "string" then
            return response.Body
        end
    end
    return nil
end

local function mountGui(gui)
    local protect = (syn and syn.protect_gui) or protect_gui
    if protect then
        pcall(protect, gui)
    end
    if gethui then
        local ok = pcall(function()
            gui.Parent = gethui()
        end)
        if ok and gui.Parent then
            return
        end
    end
    local ok = pcall(function()
        gui.Parent = game:GetService("CoreGui")
    end)
    if ok and gui.Parent then
        return
    end
    gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
end

local IconPacks = {}
local IconLoading = {}
local IconWaiters = {}
local ImageCache = {}

local function packKey(name)
    if type(name) ~= "string" then
        return nil
    end
    local wanted = string.lower(name):gsub("[^%w]", "")
    for key in pairs(Library.IconSources) do
        local normalized = string.lower(key):gsub("[^%w]", "")
        if normalized == wanted then
            return key
        end
    end
    return nil
end

local function githubRaw(url)
    local user, repo, rest = url:match("^https?://github%.com/([^/]+)/([^/]+)/blob/(.+)$")
    if user then
        return "https://raw.githubusercontent.com/" .. user .. "/" .. repo .. "/" .. rest
    end
    return url
end

local function imageExtension(url)
    local ext = url:match("%.(%a%a%a%a?)[%?#]") or url:match("%.(%a%a%a%a?)$")
    ext = ext and string.lower(ext)
    if ext == "png" or ext == "jpg" or ext == "jpeg" or ext == "webp" then
        return ext
    end
    return "png"
end

local function ensureFolders(path)
    if not filesSupported then
        return
    end
    local built = ""
    for part in string.gmatch(path, "[^/]+") do
        built = built == "" and part or (built .. "/" .. part)
        pcall(function()
            if not isfolder(built) then
                makefolder(built)
            end
        end)
    end
end

local function resolveImageProps(source, folder, callback)
    if type(source) == "number" then
        return { Image = "rbxassetid://" .. source }
    end
    if type(source) ~= "string" or source == "" then
        return false
    end
    if source:match("^rbxassetid://") or source:match("^rbxasset://") or source:match("^rbxthumb://") or source:match("^rbxgameasset://") then
        return { Image = source }
    end
    if source:match("^%d+$") then
        return { Image = "rbxassetid://" .. source }
    end
    if source:match("^https?://") then
        local url = githubRaw(source)
        if ImageCache[url] then
            return { Image = ImageCache[url] }
        end
        if not (customAsset and filesSupported) then
            return nil
        end
        task.spawn(function()
            local directory = folder .. "/images"
            ensureFolders(directory)
            local path = directory .. "/" .. hashText(url) .. "." .. imageExtension(url)
            local exists = false
            pcall(function()
                exists = isfile(path)
            end)
            if not exists then
                local body = httpGet(url)
                if body then
                    pcall(writefile, path, body)
                    pcall(function()
                        exists = isfile(path)
                    end)
                end
            end
            if exists then
                local ok, asset = pcall(customAsset, path)
                if ok and asset then
                    ImageCache[url] = asset
                    if callback then
                        callback({ Image = asset })
                    end
                end
            end
        end)
        return nil
    end
    return false
end

local function loadIconPack(pack, callback)
    if IconPacks[pack] then
        callback(IconPacks[pack])
        return
    end
    IconWaiters[pack] = IconWaiters[pack] or {}
    table.insert(IconWaiters[pack], callback)
    if IconLoading[pack] then
        return
    end
    IconLoading[pack] = true
    task.spawn(function()
        local data
        local url = Library.IconSources[pack]
        local body = url and httpGet(url)
        if body and loadstring then
            local ok, result = pcall(function()
                return loadstring(body)()
            end)
            if ok and type(result) == "table" then
                data = result
            end
        end
        IconPacks[pack] = data or {}
        local waiters = IconWaiters[pack] or {}
        IconWaiters[pack] = nil
        for _, waiter in ipairs(waiters) do
            pcall(waiter, IconPacks[pack])
        end
    end)
end

local function iconProperties(value)
    if type(value) == "number" then
        return { Image = "rbxassetid://" .. value }
    end
    if type(value) == "string" then
        if value:match("^%d+$") then
            return { Image = "rbxassetid://" .. value }
        end
        return { Image = value }
    end
    if type(value) == "table" then
        local image = value.Image or value.Id or value.Asset
        if type(image) == "number" then
            image = "rbxassetid://" .. image
        end
        if image then
            return {
                Image = image,
                ImageRectOffset = value.ImageRectOffset or value.RectOffset,
                ImageRectSize = value.ImageRectSize or value.RectSize,
            }
        end
    end
    return nil
end

local function iconEntry(data, name)
    local lowered = string.lower(name)
    local value = data[name] or data[lowered]
    if value == nil then
        local dashed = lowered:gsub("[%s_]+", "-")
        value = data[dashed]
    end
    return value
end

function Library.ResolveIcon(spec, folder, callback)
    if spec == nil or spec == "" then
        return nil
    end
    local direct = resolveImageProps(spec, folder, callback)
    if direct ~= false then
        return direct
    end
    if type(spec) ~= "string" then
        return nil
    end
    local packName, iconName = spec:match("^([%w%-]+)[:/](.+)$")
    local pack = packName and packKey(packName)
    if not pack then
        pack = packKey(Library.DefaultIconPack)
        iconName = spec
    end
    if not pack then
        return nil
    end
    local data = IconPacks[pack]
    if data then
        local value = iconEntry(data, iconName)
        if value ~= nil then
            return iconProperties(value)
        end
        for otherPack, otherData in pairs(IconPacks) do
            if otherPack ~= pack then
                local otherValue = iconEntry(otherData, iconName)
                if otherValue ~= nil then
                    return iconProperties(otherValue)
                end
            end
        end
        return nil
    end
    loadIconPack(pack, function(loaded)
        local value = iconEntry(loaded, iconName)
        local properties = value ~= nil and iconProperties(value)
        if properties and callback then
            callback(properties)
        end
    end)
    return nil
end

function Library:SetIconPack(name)
    local key = packKey(name)
    if key then
        self.DefaultIconPack = key
    end
    return key ~= nil
end

function Library:AddIconPack(name, url)
    self.IconSources[name] = url
end

function Library:PreloadIcons(...)
    for _, name in ipairs({ ... }) do
        local key = packKey(name)
        if key then
            loadIconPack(key, function() end)
        end
    end
end

function Library:GetVersion()
    local major, minor, patch = string.match(Library.Version, "^(%d+)%.(%d+)%.(%d+)")
    return Library.Version, { Major = tonumber(major), Minor = tonumber(minor), Patch = tonumber(patch) }
end

function Library:GetStyles()
    local list = {}
    for _, id in ipairs(StyleOrder) do
        table.insert(list, { Id = id, Display = Styles[id].Display })
    end
    return list
end
function Window:Connect(signal, callback)
    local connection = signal:Connect(callback)
    local list = self._connections
    list[#list + 1] = connection
    self._connectionCount = self._connectionCount + 1
    if self._connectionCount >= 256 then
        self._connectionCount = 0
        local alive = {}
        for _, entry in ipairs(list) do
            if entry.Connected then
                alive[#alive + 1] = entry
            end
        end
        self._connections = alive
    end
    return connection
end

function Window:Tween(instance, properties, duration, style, direction)
    if self.Destroyed then
        return nil
    end
    local motion = self.MotionState
    local seconds = (duration or 0.16) / motion.Speed
    local store = self._tweens[instance]
    if (motion.Reduce and style ~= Enum.EasingStyle.Linear) or seconds < 0.012 then
        if store then
            for property in pairs(properties) do
                local previous = store[property]
                if previous then
                    previous:Cancel()
                    store[property] = nil
                end
            end
        end
        for property, value in pairs(properties) do
            instance[property] = value
        end
        return nil
    end
    local info = TweenInfo.new(seconds, style or Enum.EasingStyle.Quad, direction or Enum.EasingDirection.Out)
    if not store then
        store = {}
        self._tweens[instance] = store
    end
    local last
    for property, value in pairs(properties) do
        local previous = store[property]
        if previous then
            previous:Cancel()
        end
        local tween = TweenService:Create(instance, info, { [property] = value })
        store[property] = tween
        local connection
        connection = tween.Completed:Connect(function()
            if store[property] == tween then
                store[property] = nil
            end
            if connection then
                connection:Disconnect()
            end
        end)
        tween:Play()
        last = tween
    end
    return last
end

function Window:Motion(name, instance, properties)
    local motion = MOTION[name] or MOTION.Hover
    return self:Tween(instance, properties, motion[1], motion[2], motion[3])
end

function Window:Release(instance)
    local function cancel(target)
        local store = self._tweens[target]
        if store then
            for property, tween in pairs(store) do
                pcall(function()
                    tween:Cancel()
                end)
                store[property] = nil
            end
            self._tweens[target] = nil
        end
    end
    cancel(instance)
    for _, descendant in ipairs(instance:GetDescendants()) do
        cancel(descendant)
    end
end

function Window:On(event, callback)
    local key = string.lower(tostring(event))
    local list = self._events[key]
    if not list then
        list = {}
        self._events[key] = list
    end
    local handle = { Callback = callback, Connected = true }
    function handle:Disconnect()
        self.Connected = false
    end
    table.insert(list, handle)
    return handle
end

function Window:Once(event, callback)
    local handle
    handle = self:On(event, function(...)
        handle:Disconnect()
        return callback(...)
    end)
    return handle
end

function Window:_emit(event, ...)
    local key = string.lower(event)
    local list = self._events[key]
    if not list or #list == 0 then
        return
    end
    local alive = {}
    for _, handle in ipairs(list) do
        if handle.Connected then
            table.insert(alive, handle)
        end
    end
    self._events[key] = alive
    local arguments = table.pack(...)
    for _, handle in ipairs(alive) do
        task.spawn(function()
            self:_safe("event " .. event, handle.Callback, table.unpack(arguments, 1, arguments.n))
        end)
    end
end

function Window:_reportError(label, message)
    local text = tostring(message)
    warn("[Perplexity] " .. label .. ": " .. text)
    if self._reporting then
        return
    end
    self._reporting = true
    pcall(function()
        local first = string.match(text, "^[^\n]+") or text
        self:TerminalPrint("! " .. label .. ": " .. first, "Danger")
        self:_emit("Error", label, text)
        if Library.OnError then
            Library.OnError(label, text, self)
        end
    end)
    self._reporting = false
end

function Window:_safe(label, callback, ...)
    if type(callback) ~= "function" then
        return false
    end
    local ok, result = xpcall(callback, function(message)
        return debug.traceback(tostring(message), 2)
    end, ...)
    if not ok then
        self:_reportError(label, result)
    end
    return ok, result
end

function Window:_cancelTweens()
    for _, store in pairs(self._tweens) do
        for _, tween in pairs(store) do
            pcall(function()
                tween:Cancel()
            end)
        end
    end
    self._tweens = setmetatable({}, { __mode = "k" })
end

function Window:Bind(instance, property, token)
    local value = self.Tokens[token]
    if value == nil then
        return
    end
    instance[property] = value
    local previous = self._boundTo[instance]
    if previous then
        local old = previous[property]
        if old and old ~= token then
            local oldRegistry = self._bindings[old]
            local oldProperties = oldRegistry and oldRegistry[instance]
            if oldProperties then
                oldProperties[property] = nil
            end
        end
    else
        previous = {}
        self._boundTo[instance] = previous
    end
    previous[property] = token
    local registry = self._bindings[token]
    if not registry then
        registry = setmetatable({}, { __mode = "k" })
        self._bindings[token] = registry
    end
    local properties = registry[instance]
    if not properties then
        properties = {}
        registry[instance] = properties
    end
    properties[property] = true
end

function Window:_applyGradientEntry(entry)
    local list = entry.List
    if list then
        local points = {}
        for index, token in ipairs(list) do
            points[index] = ColorSequenceKeypoint.new((index - 1) / (#list - 1), self.Tokens[token])
        end
        entry[1].Color = ColorSequence.new(points)
    else
        entry[1].Color = ColorSequence.new(self.Tokens[entry[2]], self.Tokens[entry[3]])
    end
end

function Window:_refreshGradients()
    local alive = {}
    for _, entry in ipairs(self._gradients) do
        if entry[1].Parent ~= nil then
            self:_applyGradientEntry(entry)
            table.insert(alive, entry)
        end
    end
    self._gradients = alive
end

function Window:_assignToken(token, value)
    self.Tokens[token] = value
    local registry = self._bindings[token]
    if registry then
        for instance, properties in pairs(registry) do
            if instance.Parent == nil then
                registry[instance] = nil
            else
                for property in pairs(properties) do
                    instance[property] = value
                end
            end
        end
    end
end

function Window:SetToken(token, value)
    self:_assignToken(token, value)
    if COLOR_TOKEN_SET[token] then
        self:_refreshGradients()
    end
end

function Window:SetTokens(values)
    local colors = false
    for token, value in pairs(values) do
        self:_assignToken(token, value)
        if COLOR_TOKEN_SET[token] then
            colors = true
        end
    end
    if colors then
        self:_refreshGradients()
    end
end

function Window:Make(className, properties, parent, binds)
    properties = properties or {}
    local instance = Instance.new(className)
    if className == "UIStroke" then
        self._strokes[instance] = true
        local role = binds and binds.Color
        if role == "RimColor" then
            self._rims[instance] = true
        end
        if self.Style and self.Style.Gamer then
            pcall(function()
                instance.LineJoinMode = Enum.LineJoinMode.Miter
            end)
        end
    end
    local isText = TEXT_CLASSES[className] == true
    if instance:IsA("GuiObject") then
        instance.BorderSizePixel = 0
        instance.BackgroundTransparency = 1
    end
    if className == "TextButton" or className == "ImageButton" then
        instance.AutoButtonColor = false
    end
    local bindings = {}
    if isText then
        instance.Text = ""
        instance.TextSize = self.Metrics.Text
        bindings.FontFace = FONT_TOKENS[properties.Font or "Medium"]
        local textToken = properties.Color
        if textToken == "Accent" then
            textToken = "AccentText"
        end
        bindings.TextColor3 = textToken or (properties.Muted and "Muted") or "Text"
        if className == "TextBox" then
            instance.ClearTextOnFocus = false
        end
    end
    if binds then
        for property, token in pairs(binds) do
            bindings[property] = token
        end
    end
    for key, value in pairs(properties) do
        if not (isText and (key == "Font" or key == "Color" or key == "Muted")) then
            instance[key] = value
            bindings[key] = nil
        end
    end
    if properties.BackgroundTransparency == nil and bindings.BackgroundTransparency == nil then
        if bindings.BackgroundColor3 ~= nil or properties.BackgroundColor3 ~= nil then
            instance.BackgroundTransparency = 0
        end
    end
    for property, token in pairs(bindings) do
        self:Bind(instance, property, token)
    end
    if parent then
        instance.Parent = parent
    end
    return instance
end

function Window:Corner(parent, token)
    return self:Make("UICorner", {}, parent, { CornerRadius = token or "RadControl" })
end

function Window:Stroke(parent, colorToken, transparencyToken, thickness)
    return self:Make("UIStroke", {
        Thickness = thickness or 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    }, parent, { Color = colorToken or "Outline", Transparency = transparencyToken or "TransStroke" })
end

function Window:_createLiquid(container, specs, options)
    options = options or {}
    local liquid = { Container = container, Page = options.Page, Blobs = {}, Bright = self._bright == true }
    local limit = self.Metrics.Touch and math.min(#specs, 5) or #specs
    for index = 1, limit do
        local spec = specs[index]
        local frame = new("Frame", {
            Name = "Blob",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(spec.X, spec.Y),
            Size = UDim2.fromScale(spec.W, spec.H),
            BackgroundColor3 = Color3.new(1, 1, 1),
            Active = false,
            ZIndex = 1,
        }, container)
        self:Corner(frame, "RadBlob")
        local fill = self:GradientList(frame, { "LiquidA", "LiquidB", "LiquidC", "LiquidA" }, 35)
        local rim = self:Make("UIStroke", {
            Thickness = spec.Rim,
            Transparency = 0.45,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        }, frame, { Color = "LiquidSpec" })
        local rimGradient = new("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.22, 0.2),
                NumberSequenceKeypoint.new(0.42, 0.85),
                NumberSequenceKeypoint.new(1, 1),
            }),
        }, rim)
        table.insert(liquid.Blobs, { Frame = frame, Fill = fill, Rim = rimGradient, Spec = spec })
    end
    function liquid:Shade()
        local k = self.Bright and 0.55 or 1
        for _, blob in ipairs(self.Blobs) do
            local alpha = blob.Spec.Alpha
            blob.Fill.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1 - (1 - alpha[1]) * k),
                NumberSequenceKeypoint.new(0.35, 1 - (1 - alpha[2]) * k),
                NumberSequenceKeypoint.new(0.7, 1 - (1 - alpha[3]) * k),
                NumberSequenceKeypoint.new(1, 1),
            })
        end
    end
    function liquid:SetBright(bright)
        if self.Bright ~= bright then
            self.Bright = bright
            self:Shade()
        end
    end
    function liquid:SetLimit(count)
        self.Limit = count
        for index, blob in ipairs(self.Blobs) do
            blob.Frame.Visible = index <= count
        end
    end
    function liquid:Update(t)
        for index = 1, math.min(#self.Blobs, self.Limit) do
            local blob = self.Blobs[index]
            local s = blob.Spec
            local p = s.Phase
            local x = s.X + s.AX * math.sin(t * s.FX + p) + s.AX2 * math.sin(t * s.FX2 + p * 1.7)
            local y = s.Y + s.AY * math.cos(t * s.FY + p * 0.8) + s.AY2 * math.sin(t * s.FY2 + p * 2.3)
            local w = s.W * (1 + 0.16 * math.sin(t * s.FW + p) + 0.06 * math.sin(t * s.FW2 + p * 2.1))
            local h = s.H * (1 + 0.16 * math.cos(t * s.FH + p * 1.3) + 0.06 * math.sin(t * s.FH2 + p * 0.7))
            local frame = blob.Frame
            frame.Position = UDim2.fromScale(x, y)
            frame.Size = UDim2.fromScale(w, h)
            frame.Rotation = (s.R + 28 * math.sin(t * s.FR + p) + t * s.Drift) % 360
            blob.Fill.Rotation = (t * s.Flow + p * 40) % 360
            blob.Rim.Rotation = (t * s.Spin + p * 60) % 360
        end
    end
    liquid.Limit = #liquid.Blobs
    liquid:Shade()
    liquid:SetLimit(QUALITY[self.Quality].Blobs)
    liquid:Update(self._time)
    table.insert(self._liquids, liquid)
    return liquid
end

function Window:Display(text)
    if self.Style and self.Style.Uppercase then
        return string.upper(text)
    end
    return text
end

function Window:_line(parent, properties, rotation)
    properties.BackgroundColor3 = Color3.new(1, 1, 1)
    local frame = self:Make("Frame", properties, parent, { BackgroundTransparency = "TransStroke" })
    local _, entry = self:Gradient(frame, "Outline", "Outline", rotation or 0)
    local gamer = self.Style.Gamer == true
    entry[2] = gamer and "Accent" or "Outline"
    entry[3] = gamer and "AccentAlt" or "Outline"
    self:_applyGradientEntry(entry)
    table.insert(self._lines, entry)
    return frame, entry
end

function Window:_applyLines()
    local gamer = self.Style.Gamer == true
    local alive = {}
    for _, entry in ipairs(self._lines) do
        if entry[1].Parent ~= nil then
            entry[2] = gamer and "Accent" or "Outline"
            entry[3] = gamer and "AccentAlt" or "Outline"
            self:_applyGradientEntry(entry)
            table.insert(alive, entry)
        end
    end
    self._lines = alive
end

function Window:GradientList(parent, tokenList, rotation)
    local gradient = new("UIGradient", { Rotation = rotation or 0 }, parent)
    local entry = { gradient, List = tokenList }
    table.insert(self._gradients, entry)
    self:_applyGradientEntry(entry)
    return gradient, entry
end

function Window:Gradient(parent, tokenA, tokenB, rotation)
    local gradient = new("UIGradient", { Rotation = rotation or 0 }, parent)
    gradient.Color = ColorSequence.new(self.Tokens[tokenA], self.Tokens[tokenB])
    local entry = { gradient, tokenA, tokenB }
    table.insert(self._gradients, entry)
    return gradient, entry
end

local GLASS = {
    Window = { "Background", "TransWindow", "RadWindow" },
    Panel = { "Surface", "TransPanel", "RadPanel" },
    Card = { "Surface", "TransCard", "RadCard" },
    Field = { "SurfaceAlt", "TransField", "RadControl" },
    Popup = { "Surface", "TransPopup", "RadPanel" },
}

local BRACKET_MASK = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0),
    NumberSequenceKeypoint.new(0.07, 0),
    NumberSequenceKeypoint.new(0.073, 1),
    NumberSequenceKeypoint.new(0.927, 1),
    NumberSequenceKeypoint.new(0.93, 0),
    NumberSequenceKeypoint.new(1, 0),
})

function Window:_syncGamerParts()
    local gamer = self.Style.Gamer == true
    for part in pairs(self._gamerParts) do
        if part.Parent == nil then
            self._gamerParts[part] = nil
        else
            part.Enabled = gamer
        end
    end
    local join = gamer and Enum.LineJoinMode.Miter or Enum.LineJoinMode.Round
    for stroke in pairs(self._strokes) do
        if stroke.Parent == nil then
            self._strokes[stroke] = nil
        else
            pcall(function()
                stroke.LineJoinMode = join
            end)
        end
    end
end

function Window:_bracket(frame)
    local stroke = self:Make("UIStroke", {
        Name = "Bracket",
        Thickness = 2,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Enabled = self.Style.Gamer == true,
    }, frame, { Color = "Accent" })
    new("UIGradient", { Rotation = 45, Transparency = BRACKET_MASK }, stroke)
    self._gamerParts[stroke] = true
    return stroke
end

function Window:Rim(parent)
    local stroke = self:Make("UIStroke", {
        Name = "Rim",
        Thickness = 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Enabled = QUALITY[self.Quality].Rim == true,
    }, parent, { Color = "RimColor", Transparency = "TransRim" })
    new("UIGradient", { Rotation = 35, Transparency = RIM_MASK }, stroke)
    return stroke
end

function Window:GlassEdge(stroke)
    return new("UIGradient", {
        Rotation = 45,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.5, 0.35),
            NumberSequenceKeypoint.new(1, 0.7),
        }),
    }, stroke)
end

function Window:Glass(parent, kind, properties, className)
    local spec = GLASS[kind]
    properties = properties or {}
    local layered = kind == "Panel" or kind == "Card" or kind == "Popup"
    local binds = { BackgroundTransparency = spec[2] }
    if layered then
        properties.BackgroundColor3 = Color3.new(1, 1, 1)
    else
        binds.BackgroundColor3 = spec[1]
    end
    local frame = self:Make(className or "Frame", properties, parent, binds)
    self:Corner(frame, spec[3])
    local fillEntry
    if layered then
        local _, entry = self:Gradient(frame, "SurfaceHi", "Surface", 90)
        fillEntry = entry
    end
    self:GlassEdge(self:Stroke(frame))
    if kind == "Panel" or kind == "Popup" or kind == "Card" then
        self:Rim(frame)
    end
    if kind == "Panel" or kind == "Popup" then
        self:_bracket(frame)
    end
    return frame, fillEntry
end

function Window:LoadImage(image, source, onState, timeout)
    local metrics = self.Metrics
    local placeholder = self:Make("Frame", {
        Name = "Placeholder",
        AnchorPoint = image.AnchorPoint,
        Position = image.Position,
        Size = image.Size,
        ZIndex = math.max(0, image.ZIndex - 1),
    }, image.Parent, { BackgroundColor3 = "SurfaceAlt", BackgroundTransparency = "TransField" })
    self:Corner(placeholder, "RadCard")
    local shimmer = new("UIGradient", {
        Rotation = 20,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.6),
            NumberSequenceKeypoint.new(0.5, 0),
            NumberSequenceKeypoint.new(1, 0.6),
        }),
    }, placeholder)
    local note = self:Make("TextLabel", {
        Name = "Note",
        Size = UDim2.fromScale(1, 1),
        TextSize = metrics.Small,
        Muted = true,
        ZIndex = math.max(0, image.ZIndex - 1),
    }, placeholder)
    local handle = { State = "Loading", Image = image }
    local shimmerEntry, watchEntry
    local function stop()
        if shimmerEntry then
            shimmerEntry.Dead = true
            shimmerEntry = nil
        end
        if watchEntry then
            watchEntry.Dead = true
            watchEntry = nil
        end
    end
    local function setState(state)
        handle.State = state
        if shimmerEntry then
            shimmerEntry.Dead = true
            shimmerEntry = nil
        end
        if state == "Loading" then
            placeholder.Visible = true
            note.Text = ""
            shimmer.Enabled = true
            self:Tween(placeholder, { BackgroundTransparency = self.Tokens.TransField }, 0)
            local entry
            entry = self:_animate({
                Interval = 0.05,
                Update = function(clock)
                    if not placeholder.Parent then
                        entry.Dead = true
                        return
                    end
                    shimmer.Offset = Vector2.new((clock * 0.9) % 2 - 1, 0)
                end,
            })
            shimmerEntry = entry
        elseif state == "Loaded" then
            shimmer.Enabled = false
            self:Motion("Fade", placeholder, { BackgroundTransparency = 1 })
            task.delay(0.22, function()
                if handle.State == "Loaded" and placeholder.Parent then
                    placeholder.Visible = false
                end
            end)
        else
            placeholder.Visible = true
            shimmer.Enabled = false
            note.Text = "Image unavailable"
            self:Tween(placeholder, { BackgroundTransparency = self.Tokens.TransField }, 0)
        end
        if onState then
            self:_safe("image state", onState, state, handle)
        end
    end
    function handle:Load(newSource)
        stop()
        setState("Loading")
        if newSource == nil or newSource == "" then
            setState("Error")
            return
        end
        self.Window:ApplyImage(image, newSource)
        local waited = 0
        local entry
        entry = self.Window:_animate({
            Interval = 0.2,
            Update = function(_, elapsed)
                if not image.Parent then
                    entry.Dead = true
                    return
                end
                waited = waited + elapsed
                if image.Image ~= "" and image.IsLoaded ~= false then
                    entry.Dead = true
                    setState("Loaded")
                elseif waited > (timeout or 10) then
                    entry.Dead = true
                    setState("Error")
                end
            end,
        })
        watchEntry = entry
    end
    function handle:GetState()
        return self.State
    end
    function handle:Destroy()
        stop()
        placeholder:Destroy()
    end
    handle.Window = self
    handle:Load(source)
    return handle
end

function Window:ApplyIcon(label, spec, colorToken, onApplied)
    label.Image = ""
    if colorToken then
        self:Bind(label, "ImageColor3", colorToken)
    end
    local function apply(properties)
        pcall(function()
            for key, value in pairs(properties) do
                if value ~= nil then
                    label[key] = value
                end
            end
        end)
        if onApplied then
            onApplied()
        end
    end
    local properties = Library.ResolveIcon(spec, self.Folder, apply)
    if properties then
        apply(properties)
        return true
    end
    return false
end

function Window:ApplyImage(label, source)
    label.ImageTransparency = 1
    local function apply(properties)
        pcall(function()
            label.Image = properties.Image
            self:Tween(label, { ImageTransparency = 0 }, 0.4)
        end)
    end
    local properties = resolveImageProps(source, self.Folder, apply)
    if properties then
        apply(properties)
    end
end

function Window:_styleTokens(style)
    local tokens = {}
    for key, value in pairs(style.Colors) do
        tokens[key] = value
    end
    for key, value in pairs(style.Numbers) do
        tokens[key] = value
    end
    for key, value in pairs(style.Radius) do
        tokens[key] = typeof(value) == "UDim" and value or UDim.new(0, value)
    end
    local fonts = style.Mono and FontSets.Mono or FontSets.Sans
    tokens.FontRegular = fonts.Regular
    tokens.FontMedium = fonts.Medium
    tokens.FontSemi = fonts.Semi
    tokens.FontBold = fonts.Bold
    tokens.FontMono = FontSets.Mono.Regular
    tokens.FontMonoSemi = FontSets.Mono.Semi
    return tokens
end

function Window:_themeTokens()
    local style = self.Style
    local tokens = self:_styleTokens(style)
    local theme = self.Theme
    local overrides = theme.Overrides
    local adaptive = theme.Adaptive ~= false
    if theme.Opacity ~= 1 then
        for _, key in ipairs(OPACITY_TOKENS) do
            local base = tokens[key]
            if base then
                tokens[key] = math.clamp(1 - (1 - base) * theme.Opacity, 0, 1)
            end
        end
    end
    for token, color in pairs(overrides) do
        if COLOR_TOKEN_SET[token] then
            tokens[token] = color
        end
    end
    local background = tokens.Background
    local bright = isBrightColor(background)
    if adaptive and (overrides.Accent or overrides.AccentAlt or overrides.Background) then
        local accent = tokens.Accent
        if overrides.Accent and not overrides.AccentAlt then
            tokens.AccentAlt = shiftHue(accent, 0.07, 1, 0.92)
        end
        local alt = tokens.AccentAlt
        if overrides.Accent and not overrides.ToggleOn and style.Colors.ToggleOn == style.Colors.Accent then
            tokens.ToggleOn = accent
        end
        if not overrides.LiquidB then
            tokens.LiquidB = accent
        end
        if not overrides.LiquidC then
            tokens.LiquidC = alt
        end
        if not overrides.LiquidA then
            tokens.LiquidA = background:Lerp(accent, bright and 0.1 or 0.24)
        end
        if not overrides.LiquidSpec then
            tokens.LiquidSpec = bright and accent:Lerp(BLACK, 0.12) or accent:Lerp(WHITE, 0.55)
        end
        if overrides.Accent and not overrides.Outline then
            tokens.Outline = tokens.Outline:Lerp(accent, 0.18)
        end
        if overrides.Accent and not overrides.Hover then
            tokens.Hover = tokens.Hover:Lerp(accent, 0.15)
        end
    end
    if adaptive and bright ~= isBrightColor(style.Colors.Background) then
        local derived
        if bright then
            derived = {
                Surface = background:Lerp(WHITE, 0.62),
                SurfaceAlt = background:Lerp(BLACK, 0.05),
                SurfaceHi = background:Lerp(WHITE, 0.82),
                Dialog = background:Lerp(WHITE, 0.78),
                DialogHi = background:Lerp(BLACK, 0.035),
                Hover = background:Lerp(BLACK, 0.09),
                Outline = background:Lerp(BLACK, 0.18),
                ToggleOff = background:Lerp(BLACK, 0.24),
                Knob = WHITE,
            }
        else
            derived = {
                Surface = background:Lerp(WHITE, 0.05),
                SurfaceAlt = background:Lerp(WHITE, 0.1),
                SurfaceHi = background:Lerp(WHITE, 0.08),
                Dialog = background:Lerp(WHITE, 0.12),
                DialogHi = background:Lerp(WHITE, 0.2),
                Hover = background:Lerp(WHITE, 0.15),
                Outline = background:Lerp(WHITE, 0.24),
                ToggleOff = background:Lerp(WHITE, 0.3),
                Knob = background:Lerp(WHITE, 0.75),
            }
        end
        for token, color in pairs(derived) do
            if not overrides[token] then
                tokens[token] = color
            end
        end
    end
    local surfaces = { tokens.Background, tokens.Surface, tokens.SurfaceHi, tokens.SurfaceAlt, tokens.Dialog }
    local textChanged = false
    if overrides.Text then
        if worstContrast(overrides.Text, { tokens.Background, tokens.Surface }) < 2.2 then
            tokens.Text = ensureContrast(overrides.Text, background, 4.5)
            textChanged = true
        end
    elseif worstContrast(tokens.Text, surfaces) < 4.5 then
        local matching = bright and background:Lerp(BLACK, 0.88) or background:Lerp(WHITE, 0.92)
        local opposite = bright and background:Lerp(WHITE, 0.92) or background:Lerp(BLACK, 0.88)
        tokens.Text = worstContrast(opposite, surfaces) > worstContrast(matching, surfaces) and opposite or matching
        textChanged = true
    end
    if not overrides.Muted then
        if textChanged or worstContrast(tokens.Muted, { tokens.Background, tokens.Surface }) < 3.2 then
            tokens.Muted = ensureContrast(tokens.Text:Lerp(background, 0.4), background, 3.4)
        end
    end
    local readable = { tokens.Background, tokens.Surface, tokens.SurfaceAlt, tokens.Dialog }
    for _, key in ipairs({ "Success", "Warning", "Danger" }) do
        if not overrides[key] then
            tokens[key] = ensureAgainst(tokens[key], readable, bright and 4.2 or 3)
        end
    end
    tokens.AccentText = ensureAgainst(tokens.Accent, readable, 3.4)
    tokens.ToggleText = ensureAgainst(tokens.ToggleOn, readable, 3.4)
    tokens.DockInk = WHITE
    for _, key in ipairs({ "Success", "Warning", "Danger", "Muted", "Text" }) do
        tokens["On" .. key] = inkOn(tokens[key])
    end
    tokens.OnAccent = inkOn(tokens.Accent)
    tokens.TransScrim = bright and 0.9 or 0.84
    tokens.TransCardLift = math.min(tokens.TransCard, 0.5)
    tokens.TransTerminal = tokens.TransPanel * 0.5
    tokens.RimColor = bright and BLACK or WHITE
    if bright then
        tokens.TransRim = math.min(1, (tokens.TransRim or 0.8) + 0.1)
        tokens.TransSheen = math.max(tokens.TransSheen or 1, 0.97)
    end
    return tokens
end

function Window:_applyLighting(force)
    local bright = isBrightColor(self.Tokens.Background)
    if bright == self._bright and not force then
        return
    end
    self._bright = bright
    self:SetToken("RimColor", bright and BLACK or WHITE)
    local strength = bright and 0.35 or 1
    for _, gradient in ipairs(self._vignettes) do
        gradient.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1 - 0.7 * strength),
            NumberSequenceKeypoint.new(0.5, 1),
            NumberSequenceKeypoint.new(1, 1 - 0.7 * strength),
        })
    end
    for _, liquid in ipairs(self._liquids) do
        liquid:SetBright(bright)
    end
    if self._cornerBig then
        self._cornerBig.BackgroundTransparency = bright and 0.5 or 0.18
        self._cornerSmall.BackgroundTransparency = bright and 0.62 or 0.35
    end
end

function Window:_persistTheme()
    local data = self.Prefs.Data
    local colors = {}
    local count = 0
    for token, color in pairs(self.Theme.Overrides) do
        colors[token] = "#" .. color:ToHex()
        count = count + 1
    end
    data.Colors = count > 0 and colors or nil
    data.ThemeStyle = self.StyleId
    data.Opacity = self.Theme.Opacity ~= 1 and self.Theme.Opacity or nil
    if self.Theme.Adaptive == false then
        data.Adaptive = false
    else
        data.Adaptive = nil
    end
    self:_saveSettings()
end

function Window:_applyTheme(silent)
    local tokens = self:_themeTokens()
    local changed = {}
    for token, value in pairs(tokens) do
        if self.Tokens[token] ~= value then
            changed[token] = value
        end
    end
    self:SetTokens(changed)
    self:_applyLighting()
    if next(changed) ~= nil then
        self:_refreshStyled()
    end
    for token, picker in pairs(self._colorPickers) do
        local target = self.Tokens[token]
        if target and picker.Value ~= target then
            picker:Set(target, true)
        end
    end
    if self._opacitySlider then
        local percent = math.floor(self.Theme.Opacity * 100 + 0.5)
        if self._opacitySlider.Value ~= percent then
            self._opacitySlider:Set(percent, true)
        end
    end
    if self._adaptiveToggle and self._adaptiveToggle.Value ~= self.Theme.Adaptive then
        self._adaptiveToggle:Set(self.Theme.Adaptive, true)
    end
    self:_persistTheme()
    if not silent then
        self:_emit("ThemeChanged", self:GetTheme())
    end
end

function Window:_refreshStyled()
    for _, hook in pairs(self._styleHooks) do
        pcall(hook)
    end
    for _, tab in ipairs(self.AllTabs) do
        tab:_applyLabel()
    end
end

function Window:_themeDirty()
    self._themeSerial = (self._themeSerial or 0) + 1
    local serial = self._themeSerial
    task.delay(0.15, function()
        if self._themeSerial == serial and not self.Destroyed then
            self:_applyTheme()
        end
    end)
end

function Window:SetAdaptive(enabled)
    self.Theme.Adaptive = enabled ~= false
    self:_applyTheme()
    return true
end

function Window:GetTheme()
    local colors = {}
    for _, token in ipairs(COLOR_TOKENS) do
        colors[token] = "#" .. self.Tokens[token]:ToHex()
    end
    return {
        Style = self.StyleId,
        Colors = colors,
        Opacity = self.Theme.Opacity,
        Adaptive = self.Theme.Adaptive,
        Quality = self.Quality,
        Speed = self.MotionState.Speed,
        ReduceMotion = self.MotionState.Reduce,
    }
end

function Window:SetThemeColor(token, color)
    color = toColor(color)
    if not (COLOR_TOKEN_SET[token] and color) then
        return false
    end
    self.Theme.Overrides[token] = color
    self:_applyTheme()
    return true
end

function Window:SetAccent(color, alternate)
    color = toColor(color)
    if not color then
        return false
    end
    self.Theme.Overrides.Accent = color
    local second = toColor(alternate)
    if second then
        self.Theme.Overrides.AccentAlt = second
    else
        self.Theme.Overrides.AccentAlt = nil
    end
    self.Theme.Overrides.ToggleOn = nil
    self:_applyTheme()
    return true
end

function Window:SetOpacity(value)
    value = tonumber(value)
    if not value then
        return false
    end
    self.Theme.Opacity = math.clamp(value, 0.3, 1.5)
    self:_applyTheme()
    return true
end

function Window:ResetTheme()
    self.Theme.Overrides = {}
    self.Theme.Opacity = 1
    self.Theme.Adaptive = true
    self:_applyTheme()
end

function Window:ExportTheme()
    local colors = {}
    for token, color in pairs(self.Theme.Overrides) do
        colors[token] = "#" .. color:ToHex()
    end
    return HttpService:JSONEncode({
        Version = 1,
        Style = self.StyleId,
        Colors = colors,
        Opacity = self.Theme.Opacity,
        Adaptive = self.Theme.Adaptive,
    })
end

function Window:ImportTheme(text)
    local data = type(text) == "table" and text or decodeJson(tostring(text))
    if not data then
        return false, "Invalid theme JSON"
    end
    return self:SetTheme(data)
end

function Window:ListPresets()
    local names = {}
    for _, name in ipairs(PRESET_ORDER) do
        table.insert(names, name)
    end
    local saved = {}
    for name in pairs(self.Prefs.Data.Presets or {}) do
        table.insert(saved, name)
    end
    table.sort(saved)
    for _, name in ipairs(saved) do
        if not BuiltinPresets[name] then
            table.insert(names, name)
        end
    end
    return names
end

function Window:_findPreset(name)
    local key = string.lower(tostring(name))
    for presetName, preset in pairs(self.Prefs.Data.Presets or {}) do
        if string.lower(presetName) == key then
            return preset, presetName
        end
    end
    for presetName, preset in pairs(BuiltinPresets) do
        if string.lower(presetName) == key then
            return preset, presetName
        end
    end
    return nil
end

function Window:SavePreset(name)
    name = sanitizeName(name)
    if name == "" then
        return false, "Enter a preset name"
    end
    local colors = {}
    for token, color in pairs(self.Theme.Overrides) do
        colors[token] = "#" .. color:ToHex()
    end
    local presets = self.Prefs.Data.Presets or {}
    presets[name] = { Style = self.StyleId, Colors = colors, Opacity = self.Theme.Opacity, Adaptive = self.Theme.Adaptive }
    self.Prefs.Data.Presets = presets
    self:_saveSettings()
    return true, name
end

function Window:ApplyPreset(name)
    local preset, found = self:_findPreset(name)
    if not preset then
        return false, "Preset not found"
    end
    self.Theme.Overrides = {}
    local copy = table.clone(preset)
    copy.Reset = false
    self:SetTheme(copy)
    return true, found
end

function Window:DeletePreset(name)
    local presets = self.Prefs.Data.Presets
    local preset, found = self:_findPreset(name)
    if not (presets and preset and presets[found]) then
        return false, "Only saved presets can be deleted"
    end
    presets[found] = nil
    self:_saveSettings()
    return true, found
end

function Window:SetTheme(theme, silent)
    if type(theme) == "string" then
        local preset = self:_findPreset(theme)
        if preset then
            return self:ApplyPreset(theme)
        end
        if resolveStyle(theme) then
            return self:SetStyle(theme, silent)
        end
        return false, "Unknown theme"
    end
    if type(theme) ~= "table" then
        return false, "Theme must be a name or a table"
    end
    local styleId = resolveStyle(theme.Style)
    if styleId and styleId ~= self.StyleId then
        self:SetStyle(styleId, true)
    end
    if theme.Reset == true then
        self.Theme.Overrides = {}
    end
    local overrides = self.Theme.Overrides
    if type(theme.Colors) == "table" then
        for token, value in pairs(theme.Colors) do
            local color = toColor(value)
            if color and COLOR_TOKEN_SET[token] then
                overrides[token] = color
            end
        end
    end
    local accent = toColor(theme.Accent)
    if accent then
        overrides.Accent = accent
    end
    if theme.Opacity ~= nil and tonumber(theme.Opacity) then
        self.Theme.Opacity = math.clamp(tonumber(theme.Opacity), 0.3, 1.5)
    end
    if theme.Adaptive ~= nil then
        self.Theme.Adaptive = theme.Adaptive ~= false
    end
    if theme.Quality then
        self:SetQuality(theme.Quality)
    end
    if theme.Speed ~= nil then
        self:SetAnimationSpeed(theme.Speed)
    end
    if theme.ReduceMotion ~= nil then
        self:SetReduceMotion(theme.ReduceMotion == true)
    end
    self:_applyTheme(silent)
    return true
end

function Window:SetQuality(name)
    local key = string.lower(tostring(name))
    for _, level in ipairs(QUALITY_ORDER) do
        if string.lower(level) == key then
            self.Quality = level
            self:_applyQuality()
            self:_setData("Quality", level)
            if self._qualityDropdown then
                self._qualityDropdown:Set(level, true)
            end
            self:_emit("QualityChanged", level)
            return true
        end
    end
    return false
end

function Window:_applyQuality()
    local profile = QUALITY[self.Quality]
    for rim in pairs(self._rims) do
        if rim.Parent == nil then
            self._rims[rim] = nil
        else
            rim.Enabled = profile.Rim
        end
    end
    self._shadowOn = profile.Shadow == true
    if self.CornerDecor then
        local decor = profile.Decor ~= false
        self.CornerDecor.Visible = self.Style.Corner == true and decor
        self.Sheen.Visible = self.Style.Numbers.TransSheen < 1 and decor
    end
    for shadow in pairs(self._shadows) do
        if shadow.Parent == nil then
            self._shadows[shadow] = nil
        elseif not self._shadowOn then
            shadow.Visible = false
        elseif self._popup and self._popupShadows[self._popup] == shadow then
            shadow.Visible = true
        end
    end
    for _, liquid in ipairs(self._liquids) do
        liquid:SetLimit(profile.Blobs)
        if (self.Metrics.Touch and profile.LiquidTouch or profile.Liquid) == 0 then
            liquid:Update(self._time)
        end
    end
end

function Window:SetScale(scale)
    scale = tonumber(scale)
    if not scale then
        return false
    end
    self.UserScale = math.clamp(scale, 0.5, 2)
    self:_setData("Scale", self.UserScale ~= 1 and self.UserScale or nil)
    self:_updateScale()
    if self._scaleSlider then
        self._scaleSlider:Set(math.floor(self.UserScale * 100 + 0.5), true)
    end
    return true
end

function Window:GetScale()
    return self._targetScale or self.Scale.Scale
end

function Window:SetPopupMode(mode)
    if mode ~= "Auto" and mode ~= "Sheet" and mode ~= "Anchored" then
        return false
    end
    self.PopupMode = mode
    self:_setData("PopupMode", mode ~= "Auto" and mode or nil)
    return true
end

function Window:SetAnimationSpeed(speed)
    speed = tonumber(speed)
    if not speed then
        return false
    end
    self.MotionState.Speed = math.clamp(speed, 0.25, 3)
    self:_setData("Speed", self.MotionState.Speed ~= 1 and self.MotionState.Speed or nil)
    if self._speedSlider then
        self._speedSlider:Set(math.floor(self.MotionState.Speed * 100 + 0.5), true)
    end
    return true
end

function Window:ResetMotion()
    self:SetAnimationSpeed(1)
    self:SetReduceMotion(false)
    return true
end

function Window:SetRememberTab(enabled)
    self._rememberTab = enabled ~= false
    if self._rememberTab then
        self:_setData("RememberTab", nil)
    else
        self:_setData("RememberTab", false)
    end
    if self._rememberToggle and self._rememberToggle.Value ~= self._rememberTab then
        self._rememberToggle:Set(self._rememberTab, true)
    end
    if self._rememberTab and self.SelectedTab and not self.SelectedTab.Hidden and not self.SelectedTab.Builtin then
        self:_setData("LastTab", self.SelectedTab.Title)
    end
    return true
end

function Window:ResetLayout()
    self:SetScale(1)
    self:SetPopupMode("Auto")
    self.AutoScale = true
    self:_updateScale()
    if self._autoScaleToggle then
        self._autoScaleToggle:Set(true, true)
    end
    if self._popupModeDropdown then
        self._popupModeDropdown:Set("Auto", true)
    end
    return true
end

function Window:ResetSetting(target)
    local element = target
    if type(target) == "string" then
        element = self.Flags[target] or self:FindElement(target)
    end
    if type(element) ~= "table" or type(element.Reset) ~= "function" then
        return false
    end
    return pcall(element.Reset, element)
end

function Window:SetReduceMotion(enabled)
    self.MotionState.Reduce = enabled == true
    self:_setData("Reduce", self.MotionState.Reduce or nil)
    if self._reduceToggle then
        self._reduceToggle:Set(self.MotionState.Reduce, true)
    end
    return true
end

function Window:_onStyle(owner, callback)
    self._styleHooks[owner] = callback
end

function Window:_offStyle(owner)
    self._styleHooks[owner] = nil
end

function Window:SetStyle(name, silent)
    local id = resolveStyle(name) or name
    local style = Styles[id]
    if not style then
        return false
    end
    self.StyleId = id
    self.Style = style
    self.Theme.Overrides = {}
    self:SetTokens(self:_themeTokens())
    self:_applyLighting()
    self:_persistTheme()
    if self.Effects.Rainbow then
        self.Effects.Rainbow = false
    end
    self.TerminalVisible = style.Terminal and not self.Metrics.Touch
    self:_applyStyleLayout()
    if self.TerminalVisible and self._terminalBanner then
        self._terminalBanner()
    end
    for token, picker in pairs(self._colorPickers) do
        picker:Set(self.Tokens[token], true)
    end
    if self._terminalToggle then
        self._terminalToggle:Set(self.TerminalVisible, true)
    end
    if self._styleDropdown then
        self._styleDropdown:Set(style.Display, true)
    end
    self:_saveSettings()
    self:_emit("StyleChanged", id)
    if not silent then
        self:Notify({ Title = "Style", Content = style.Display .. " applied", Type = "Success" })
    end
    return true
end

function Window:GetStyle()
    return self.StyleId
end

function Window:SetRainbow(enabled)
    self.Effects.Rainbow = enabled == true
    if not self.Effects.Rainbow then
        local colors = self.Style.Colors
        self:SetToken("Accent", colors.Accent)
        self:SetToken("AccentAlt", colors.AccentAlt)
        self:SetToken("ToggleOn", colors.ToggleOn)
        for token, picker in pairs(self._colorPickers) do
            picker:Set(self.Tokens[token], true)
        end
    end
end

function Window:_screenSize()
    local size = self.Gui.AbsoluteSize
    if size.X < 50 or size.Y < 50 then
        local camera = workspace.CurrentCamera
        size = camera and camera.ViewportSize or Vector2.new(1280, 720)
    end
    return size
end

function Window:_queue(kind, subject)
    local dirty = self._dirty
    if subject ~= nil then
        local set = dirty[kind]
        if not set then
            set = {}
            dirty[kind] = set
        end
        set[subject] = true
    else
        dirty[kind] = true
    end
    self._dirtyAny = true
end

function Window:_flush()
    local dirty = self._dirty
    self._dirty = {}
    self._dirtyAny = false
    if dirty.Scale then
        self:_updateScale()
    elseif dirty.Layout then
        self:_layout()
    end
    if dirty.Tabs then
        for tab in pairs(dirty.Tabs) do
            if tab.Page.Parent then
                tab:_updateLayout()
            end
        end
    end
    if dirty.Keyboard then
        self:_applyKeyboard()
    end
    if dirty.Favorites then
        self:_rebuildFavorites()
    end
end

function Window:_placeRoot()
    self.Root.Position = UDim2.new(self._center.X, 0, self._center.Y, -self._kbShift)
end

function Window:_applyKeyboard()
    if not self.Metrics.Touch then
        return
    end
    local shift = 0
    if UserInputService.OnScreenKeyboardVisible then
        local box = UserInputService:GetFocusedTextBox()
        if box and box:IsDescendantOf(self.Gui) then
            local keyboardTop = UserInputService.OnScreenKeyboardPosition.Y - self.Gui.AbsolutePosition.Y
            local bottom = box.AbsolutePosition.Y + box.AbsoluteSize.Y + self._kbShift
            local needed = bottom - (keyboardTop - 16)
            if needed > 0 then
                local room = math.max(0, self.Root.AbsolutePosition.Y + self._kbShift - self._topReserve)
                shift = math.min(needed, room)
            end
        end
    end
    local mover = self._movers.Keyboard
    if mover then
        mover.Target = Vector2.new(shift, 0)
        return
    end
    if math.abs(shift - self._kbShift) < 0.5 then
        return
    end
    self._movers.Keyboard = {
        Current = Vector2.new(self._kbShift, 0),
        Target = Vector2.new(shift, 0),
        Rate = 22,
        MaxSpeed = 6000,
        Apply = function(position)
            self._kbShift = position.X
            self:_placeRoot()
        end,
    }
end

function Window:_windowHeight()
    return self.Minimized and self.Metrics.Top or self.BaseSize.Y
end

function Window:_clampCenter(position)
    local screen = self:_screenSize()
    local scale = self._targetScale or self.Scale.Scale
    local half = Vector2.new(self.BaseSize.X * scale / 2, self:_windowHeight() * scale / 2)
    local top = self._topReserve
    local lowX, highX = half.X, screen.X - half.X
    local lowY, highY = half.Y + top, screen.Y - half.Y
    local x = lowX <= highX and math.clamp(position.X, lowX, highX) or screen.X / 2
    local y = lowY <= highY and math.clamp(position.Y, lowY, highY) or (screen.Y + top) / 2
    return Vector2.new(x, y)
end

function Window:_applyPosition()
    local screen = self:_screenSize()
    local clamped = self:_clampCenter(Vector2.new(self._center.X * screen.X, self._center.Y * screen.Y))
    self._center = Vector2.new(clamped.X / screen.X, clamped.Y / screen.Y)
    self:_placeRoot()
end

function Window:_menuLimits()
    local screen = self:_screenSize()
    local size = (self._menuHalf or 22) * 2
    local lowX = 8
    local lowY = self._topReserve + 8
    return lowX, lowY, math.max(lowX, screen.X - size - 8), math.max(lowY, screen.Y - size - 8)
end

function Window:_placeMenuButton(animate)
    local button = self.MenuButton
    if not button or not self._menuRel then
        return
    end
    local lowX, lowY, highX, highY = self:_menuLimits()
    local half = self._menuHalf or 22
    local target = Vector2.new(
        lowX + self._menuRel.X * (highX - lowX),
        lowY + self._menuRel.Y * (highY - lowY)
    )
    local mover = self._movers.Menu
    if animate and mover then
        mover.Target = target
        mover.Dragging = false
        mover.Rate = 16
        return
    end
    if mover then
        return
    end
    self._menuPos = target
    button.Position = UDim2.fromOffset(target.X + half, target.Y + half)
end

function Window:_clampMenuButton()
    self:_placeMenuButton(false)
end

function Window:_syncMenuDot()
    local dot = self._menuDot
    if not dot then
        return
    end
    local show = self._unread > 0 and not self.Visible
    dot.Visible = show
    if show and self._menuWake then
        self._menuWake()
    end
end

function Window:_applySize()
    self.Root.Size = UDim2.fromOffset(self.BaseSize.X, self:_windowHeight())
    self.Body.Visible = not self.Minimized
    if self.Grip then
        self.Grip.Visible = not self.Minimized
    end
end

function Window:_updateScale()
    local screen = self:_screenSize()
    local touch = self.Metrics.Touch
    local usable = Vector2.new(screen.X, math.max(screen.Y - self._topReserve, 120))
    local base = self.DesignSize
    local scale = 1
    if self.AutoScale then
        local fit = math.min(usable.X * 0.95 / base.X, usable.Y * 0.9 / base.Y)
        if touch then
            scale = math.clamp(fit * 0.92, 0.45, 1.3)
        else
            local reference = math.min(screen.X / self.ReferenceSize.X, screen.Y / self.ReferenceSize.Y)
            scale = math.min(reference, fit)
        end
    end
    scale = math.clamp(scale * self.UserScale, 0.4, 3)
    self._targetScale = scale
    if self.Visible then
        self.Scale.Scale = scale
    end
    self.ToastScale.Scale = scale
    local limit = usable * 0.98 / scale
    local preferred = self.PreferredSize
    local portrait = screen.Y > screen.X
    if self.SmartSize and not self._manualSize then
        preferred = Vector2.new(
            math.clamp(limit.X * 0.94, self.MinSize.X, portrait and 620 or 780),
            math.clamp(limit.Y * 0.92, self.MinSize.Y, portrait and 640 or 460)
        )
        self.PreferredSize = preferred
    end
    self.BaseSize = Vector2.new(math.min(preferred.X, limit.X), math.min(preferred.Y, limit.Y))
    local orientation = portrait and "Portrait" or "Landscape"
    local rotated = self._orientation ~= nil and self._orientation ~= orientation
    self._orientation = orientation
    if rotated then
        self:_closePopup()
    end
    self:_applySize()
    self:_layout()
    self:_applyPosition()
    self:_clampMenuButton()
    if self._lastScale ~= scale then
        self._lastScale = scale
        self:_emit("ScaleChanged", scale)
    end
    if rotated then
        self:_emit("OrientationChanged", orientation)
    end
end

function Window:_layout()
    local metrics = self.Metrics
    local style = self.Style
    local pad = metrics.Pad
    local sidebar = style.Nav == "Sidebar"
    local dock = style.Nav == "Dock"
    local railWidth = 0
    local compact = sidebar and self.BaseSize.X < 470
    if compact ~= self._compact then
        self._compact = compact
        for _, tab in ipairs(self.AllTabs) do
            tab:_applyNav()
        end
    end
    if sidebar then
        if compact then
            railWidth = metrics.Touch and 58 or 60
        elseif style.RailFraction and not metrics.Touch then
            railWidth = math.clamp(math.floor(self.BaseSize.X * style.RailFraction), 120, 170)
        else
            railWidth = (metrics.Touch and style.RailWidthMobile) or style.RailWidth
        end
    end
    local dockSpace = dock and (metrics.DockHeight + pad) or 0
    self.Rail.Visible = sidebar
    self.Rail.Position = UDim2.fromOffset(pad, pad)
    self.Rail.Size = UDim2.new(0, railWidth, 1, -pad * 2)
    self.RailDivider.Visible = sidebar
    self.RailDivider.Position = UDim2.fromOffset(pad + railWidth + math.floor(pad / 2), 0)
    self.Dock.Visible = dock
    self.Dock.Position = UDim2.new(0.5, 0, 1, -pad)
    local terminalWidth = 0
    local overlay = false
    if self.TerminalVisible then
        terminalWidth = math.clamp(self.BaseSize.X * 0.36, 170, 260)
        local remaining = self.BaseSize.X - railWidth - terminalWidth - pad * (sidebar and 4 or 3)
        if remaining < metrics.MinColumn then
            overlay = true
            terminalWidth = math.clamp(self.BaseSize.X * 0.62, 180, 300)
        end
    end
    local left = pad + (sidebar and (railWidth + pad) or 0)
    local right = pad + ((terminalWidth > 0 and not overlay) and (terminalWidth + pad) or 0)
    self.PageHolder.Position = UDim2.fromOffset(left, pad)
    self.PageHolder.Size = UDim2.new(1, -(left + right), 1, -(pad * 2 + dockSpace))
    self.Terminal.Visible = terminalWidth > 0
    self.Terminal.Size = UDim2.new(0, terminalWidth, 1, -(pad * 2 + dockSpace))
    self.Terminal.Position = UDim2.new(1, -pad, 0, pad)
    self.Terminal.ZIndex = overlay and 6 or 1
    self.Footer.Visible = sidebar and style.Footer == true and self.BaseSize.Y > 380
end

function Window:_trackDrag(target, onUpdate, onBegin, onFinish, options)
    options = options or {}
    local handle = { Target = target, Threshold = options.Threshold or 8 }
    handle.Connection = self:Connect(target.InputBegan, function(input)
        if self.Destroyed then
            return
        end
        local inputType = input.UserInputType
        if inputType ~= Enum.UserInputType.MouseButton1 and inputType ~= Enum.UserInputType.Touch then
            return
        end
        if handle.Record or self._claimed[input] then
            return
        end
        local record = {
            Handle = handle,
            Input = input,
            Update = onUpdate,
            Finish = onFinish,
            Start = Vector2.new(input.Position.X, input.Position.Y),
            Moved = false,
            Threshold = handle.Threshold,
        }
        handle.Record = record
        self._claimed[input] = record
        table.insert(self._drags, record)
        if onBegin then
            onBegin(input, record)
        end
        if handle.Record == record then
            onUpdate(input, record)
        end
    end)
    return handle
end

function Window:_finishDrag(record, cancelled)
    if not record or record.Done then
        return
    end
    record.Done = true
    local index = table.find(self._drags, record)
    if index then
        table.remove(self._drags, index)
    end
    self._claimed[record.Input] = nil
    if record.Handle.Record == record then
        record.Handle.Record = nil
    end
    if record.Finish then
        local ok, reason = pcall(record.Finish, cancelled == true, record)
        if not ok then
            warn("[Perplexity] drag finish error: " .. tostring(reason))
        end
    end
end

function Window:_cancelDrags(keep)
    for _, record in ipairs(table.clone(self._drags)) do
        if not (keep and keep(record)) then
            self:_finishDrag(record, true)
        end
    end
end

function Window:_dragInput(input)
    for _, record in ipairs(table.clone(self._drags)) do
        local original = record.Input
        local matches = input == original
            or (original.UserInputType == Enum.UserInputType.MouseButton1 and input.UserInputType == Enum.UserInputType.MouseMovement)
        if matches and not record.Done then
            if not record.Moved then
                local current = Vector2.new(input.Position.X, input.Position.Y)
                if (current - record.Start).Magnitude > record.Threshold then
                    record.Moved = true
                end
            end
            record.Update(input, record)
        end
    end
end

function Window:_dragEnded(input)
    for _, record in ipairs(table.clone(self._drags)) do
        local original = record.Input
        local matches = input == original
            or (original.UserInputType == Enum.UserInputType.MouseButton1 and input.UserInputType == Enum.UserInputType.MouseButton1)
        if matches then
            self:_finishDrag(record, false)
        end
    end
end

function Window:_watchDrags()
    for _, record in ipairs(table.clone(self._drags)) do
        local state = record.Input.UserInputState
        if state == Enum.UserInputState.End or state == Enum.UserInputState.Cancel then
            self:_finishDrag(record, state == Enum.UserInputState.Cancel)
        end
    end
end

function Window:_stepMovers(dt)
    local finished = {}
    for name, mover in pairs(self._movers) do
        local delta = mover.Target - mover.Current
        local distance = delta.Magnitude
        if distance > 0.2 then
            local alpha = 1 - math.exp(-dt * (mover.Rate or 30))
            local step = delta * alpha
            local limit = (mover.MaxSpeed or 12000) * dt
            if step.Magnitude > limit then
                step = step.Unit * limit
            end
            mover.Current = mover.Current + step
            mover.Apply(mover.Current)
        else
            if distance > 0 then
                mover.Current = mover.Target
                mover.Apply(mover.Current)
            end
            if not mover.Dragging then
                table.insert(finished, name)
            end
        end
    end
    for _, name in ipairs(finished) do
        self._movers[name] = nil
    end
end

function Window:_step(dt)
    if self._dirtyAny then
        self:_flush()
    end
    self._time = self._time + dt
    self:_watchDrags()
    self:_stepMovers(dt)
    if self._menuIdle then
        self._menuIdle()
    end
    if not self.Visible or self._focused == false then
        return
    end
    local clock = self._time
    local profile = QUALITY[self.Quality]
    if self.Effects.Liquid and self.Style.Liquid and not self.Minimized then
        local rate = self.Metrics.Touch and profile.LiquidTouch or profile.Liquid
        if rate > 0 then
            self._liquidClock = self._liquidClock + dt
            if self._liquidClock >= 1 / rate then
                self._liquidClock = 0
                for _, liquid in ipairs(self._liquids) do
                    if not liquid.Page or liquid.Page.Visible then
                        liquid:Update(clock)
                    end
                end
            end
        end
    end
    if self.BorderGradient and self.Effects.Border and self.Style.Border and profile.Border > 0 then
        self._borderClock = self._borderClock + dt
        if self._borderClock >= 1 / profile.Border then
            self._borderClock = 0
            self.BorderGradient.Rotation = (clock * (self.Style.BorderSpeed or 40)) % 360
        end
    end
    if self.Effects.Rainbow then
        self._rainbowClock = (self._rainbowClock or 0) + dt
        if self._rainbowClock > 0.08 then
            self._rainbowClock = 0
            local hue = (clock * 0.07) % 1
            local accent = Color3.fromHSV(hue, 0.72, 1)
            local values = { Accent = accent, AccentAlt = Color3.fromHSV((hue + 0.12) % 1, 0.72, 1) }
            if self.Style.Colors.ToggleOn == self.Style.Colors.Accent then
                values.ToggleOn = accent
            end
            self:SetTokens(values)
        end
    end
    if self.Style.Nav == "Dock" and not self.Metrics.Touch and (self._dockHover or self._dockActive) then
        local mouseX = UserInputService:GetMouseLocation().X
        local settled = true
        for _, tab in ipairs(self.AllTabs) do
            local slot = tab.Holder
            if tab.DockScale and slot.Parent == self.Dock then
                local width = math.max(slot.AbsoluteSize.X, 1)
                local distance = math.abs(mouseX - (slot.AbsolutePosition.X + width / 2)) / width
                local target = self._dockHover and (1 + 0.55 * math.exp(-(distance * distance) * 1.4)) or 1
                local current = tab.DockScale.Scale
                local nextScale = current + (target - current) * math.min(1, dt * 16)
                if math.abs(target - nextScale) < 0.002 then
                    nextScale = target
                else
                    settled = false
                end
                if nextScale ~= current then
                    tab.DockScale.Scale = nextScale
                end
            end
        end
        self._dockActive = not settled
    end
    if self._caret and self.TerminalVisible then
        local on = math.floor(clock * 2) % 2 == 0
        if on ~= self._caretOn then
            self._caretOn = on
            self._caret.Visible = on
        end
    end
    local animated = self._animated
    for index = #animated, 1, -1 do
        local entry = animated[index]
        if entry.Dead then
            table.remove(animated, index)
        elseif not entry.Gate or entry.Gate() then
            entry.Elapsed = (entry.Elapsed or 0) + dt
            if entry.Elapsed >= (entry.Interval or 0) then
                local elapsed = entry.Elapsed
                entry.Elapsed = 0
                entry.Update(clock, elapsed)
            end
        end
    end
end

function Window:_animate(entry)
    table.insert(self._animated, entry)
    return entry
end

function Window:_useSheet()
    local mode = self.PopupMode
    if mode == "Sheet" then
        return true
    end
    if mode == "Anchored" then
        return false
    end
    return self.Metrics.Touch == true and (self._orientation == "Portrait" or self.BaseSize.X < 560)
end

function Window:_makePopup(name, properties)
    properties = properties or {}
    properties.Name = name
    properties.Visible = false
    properties.ZIndex = 3
    properties.GroupTransparency = 1
    local shadow = self:Make("Frame", {
        Name = name .. "Shadow",
        BackgroundColor3 = Color3.new(0, 0, 0),
        Visible = false,
        ZIndex = 2,
    }, self.Overlay, { BackgroundTransparency = "TransShadow" })
    self:Corner(shadow, "RadPanel")
    self._shadows[shadow] = true
    local popup = self:Glass(self.Overlay, "Popup", properties, "CanvasGroup")
    new("UIScale", { Name = "PopupScale" }, popup)
    self._popupShadows[popup] = shadow
    return popup
end

function Window:_destroyPopup(popup)
    if not popup then
        return
    end
    if self._popup == popup then
        self:_closePopup(true)
    end
    local shadow = self._popupShadows[popup]
    self._popupShadows[popup] = nil
    self._popupState[popup] = nil
    self:Release(popup)
    if shadow then
        self._shadows[shadow] = nil
        shadow:Destroy()
    end
    popup:Destroy()
end

function Window:_showPopup(popup, anchor, size, sheet)
    self:_closePopup(true)
    sheet = sheet == true
    local scale = self.Scale.Scale
    local overlay = self.Overlay
    local available = overlay.AbsoluteSize / scale
    local origin = anchor and (anchor.AbsolutePosition - overlay.AbsolutePosition) / scale or Vector2.new(0, 0)
    local anchorSize = anchor and anchor.AbsoluteSize / scale or Vector2.new(0, 0)
    local width, height = size.X, size.Y
    local x, y
    local up = false
    if sheet then
        width = math.clamp(math.max(width, 300), 200, math.max(200, math.min(available.X - 16, 480)))
        height = math.min(height, math.max(120, available.Y * 0.64))
        x = (available.X - width) / 2
        y = available.Y - height - 8
    elseif anchor == nil then
        width = math.max(160, math.min(width, available.X - 16))
        height = math.max(120, math.min(height, available.Y - 16))
        x = (available.X - width) / 2
        y = math.max(8, math.min(available.Y * 0.08, available.Y - height - 8))
    else
        x = origin.X + anchorSize.X - width
        x = math.clamp(x, 4, math.max(4, available.X - width - 4))
        y = origin.Y + anchorSize.Y + 4
        if y + height > available.Y - 4 then
            local above = origin.Y - height - 4
            if above >= 4 then
                y = above
                up = true
            else
                y = math.max(4, available.Y - height - 4)
            end
        end
    end
    x = math.floor(x)
    y = math.floor(y)
    self._popupState[popup] = (self._popupState[popup] or 0) + 1
    local baseY = y + (up and height or 0)
    local popupScale = popup:FindFirstChild("PopupScale")
    local shadow = self._popupShadows[popup]
    popup.AnchorPoint = Vector2.new(0, up and 1 or 0)
    popup.Size = UDim2.fromOffset(width, height)
    self:Tween(popup, { GroupTransparency = 1 }, 0)
    if sheet then
        self:Tween(popup, { Position = UDim2.fromOffset(x, baseY + 36) }, 0)
        if popupScale then
            self:Tween(popupScale, { Scale = 1 }, 0)
        end
    else
        self:Tween(popup, { Position = UDim2.fromOffset(x, baseY) }, 0)
        if popupScale then
            self:Tween(popupScale, { Scale = 0.94 }, 0)
        end
    end
    popup.Visible = true
    if shadow then
        shadow.Size = UDim2.fromOffset(width + 10, height + 10)
        shadow.Position = UDim2.fromOffset(x - 5, y + 1)
        self:Tween(shadow, { BackgroundTransparency = 1 }, 0)
        shadow.Visible = self._shadowOn == true
    end
    self:Motion(sheet and "Sheet" or "Popup", popup, { GroupTransparency = 0 })
    if sheet then
        self:Motion("Sheet", popup, { Position = UDim2.fromOffset(x, baseY) })
    elseif popupScale then
        self:Motion("Popup", popupScale, { Scale = 1 })
    end
    if shadow and shadow.Visible then
        self:Motion("Popup", shadow, { BackgroundTransparency = self.Tokens.TransShadow })
    end
    local blocker = self.Blocker
    blocker.BackgroundColor3 = Color3.new(0, 0, 0)
    self:Tween(blocker, { BackgroundTransparency = 1 }, 0)
    blocker.Visible = true
    if sheet or anchor == nil then
        local scrim = self.Tokens.TransScrim
        self:Motion("Fade", blocker, { BackgroundTransparency = sheet and scrim or math.min(1, scrim + 0.04) })
    end
    self._popup = popup
    self._popupSheet = sheet
end

function Window:_hidePopup(popup, instant, sheet)
    local serial = (self._popupState[popup] or 0) + 1
    self._popupState[popup] = serial
    local shadow = self._popupShadows[popup]
    if instant or self.MotionState.Reduce or self.Destroyed then
        self:Tween(popup, { GroupTransparency = 1 }, 0)
        popup.Visible = false
        if shadow then
            shadow.Visible = false
        end
        return
    end
    self:Motion("PopupOut", popup, { GroupTransparency = 1 })
    if sheet then
        local position = popup.Position
        self:Motion("PopupOut", popup, { Position = UDim2.new(position.X.Scale, position.X.Offset, position.Y.Scale, position.Y.Offset + 28) })
    else
        local popupScale = popup:FindFirstChild("PopupScale")
        if popupScale then
            self:Motion("PopupOut", popupScale, { Scale = 0.96 })
        end
    end
    if shadow then
        self:Motion("PopupOut", shadow, { BackgroundTransparency = 1 })
    end
    task.delay(0.16, function()
        if self._popupState[popup] == serial and popup.Parent then
            popup.Visible = false
            if shadow then
                shadow.Visible = false
            end
        end
    end)
end

function Window:_closePopup(instant)
    local popup = self._popup
    if popup then
        self._popup = nil
        self:_hidePopup(popup, instant, self._popupSheet)
        if popup == self._palette then
            if self.PaletteBox then
                pcall(self.PaletteBox.ReleaseFocus, self.PaletteBox)
            end
            self:_emit("PaletteChanged", false)
        end
    end
    self._popupSheet = false
    local blocker = self.Blocker
    if blocker then
        blocker.Visible = false
        self:Tween(blocker, { BackgroundTransparency = 1 }, 0)
    end
end

function Window:_setBlur(show)
    if not self.BlurEffect then
        return
    end
    local size = (show and self.Effects.Blur) and 14 or 0
    self:Tween(self.BlurEffect, { Size = size }, 0.3)
end

function Window:SetVisible(visible)
    visible = visible == true
    if self.Visible == visible then
        return
    end
    self.Visible = visible
    self._visibleToken = (self._visibleToken or 0) + 1
    local token = self._visibleToken
    local target = self._targetScale or self.Scale.Scale
    self:_closePopup(true)
    self:_setBlur(visible)
    if visible then
        self.Root.Visible = true
        self.Root.GroupTransparency = 1
        self.Scale.Scale = target * 0.95
        self:_syncMenuDot()
        if self._menuWake then
            self._menuWake()
        end
        self:Motion("WindowIn", self.Root, { GroupTransparency = 0 })
        self:Motion("WindowIn", self.Scale, { Scale = target })
    else
        self:_cancelDrags(function(record)
            return record.Handle == self._menuHandle
        end)
        self:Motion("WindowOut", self.Root, { GroupTransparency = 1 })
        self:Motion("WindowOut", self.Scale, { Scale = target * 0.96 })
        self:_syncMenuDot()
        task.delay(0.22, function()
            if self._visibleToken == token and not self.Visible then
                self.Root.Visible = false
                self.Scale.Scale = target
            end
        end)
    end
end

function Window:Toggle()
    self:SetVisible(not self.Visible)
end

function Window:SetMinimized(minimized)
    self.Minimized = minimized == true
    self:_closePopup()
    self:_applySize()
    self:_applyPosition()
end

function Window:ToggleMaximize()
    local screen = self:_screenSize()
    local scale = self._targetScale or self.Scale.Scale
    if self._restoreSize then
        self.PreferredSize = self._restoreSize
        self._restoreSize = nil
    else
        self._restoreSize = self.PreferredSize
        self.PreferredSize = Vector2.new(screen.X * 0.98 / scale, screen.Y * 0.96 / scale)
    end
    self._center = Vector2.new(0.5, 0.5)
    self:_updateScale()
end

function Window:GetFlag(flag)
    local element = self.Flags[flag]
    return element and element.Value or nil
end

function Window:SetFlag(flag, value, silent)
    local element = self.Flags[flag]
    if element and element.Set then
        element:Set(value, silent)
    end
end

function Window:Notify(options)
    if type(options) == "string" then
        options = { Content = options }
    end
    options = options or {}
    local duration = options.Duration or 4
    if options.Log ~= false then
        self:_addHistory(options)
    end
    local typeToken = ({ Success = "Success", Warning = "Warning", Error = "Danger" })[options.Type] or "Accent"
    local wrapper = new("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
    }, self.ToastHolder)
    local card = self:Make("TextButton", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Position = UDim2.fromOffset(340, 0),
    }, wrapper, { BackgroundColor3 = "Surface" })
    card.BackgroundTransparency = 0.08
    self:Corner(card, "RadCard")
    self:GlassEdge(self:Stroke(card, typeToken, nil, 1))
    self:Rim(card)
    local bar = self:Make("Frame", { Size = UDim2.new(0, 3, 1, -12), Position = UDim2.fromOffset(6, 6) }, card, { BackgroundColor3 = typeToken })
    self:Corner(bar, "RadControl")
    local progress = self:Make("Frame", {
        Size = UDim2.new(1, -16, 0, 2),
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.new(0.5, 0, 1, -3),
    }, card, { BackgroundColor3 = typeToken })
    local body = new("Frame", { Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y }, card)
    addPadding(body, 9, 12, 12, 18)
    addList(body, 2)
    if options.Title and options.Title ~= "" then
        self:Make("TextLabel", {
            Size = UDim2.new(1, 0, 0, 18),
            Text = options.Title,
            Font = "Semi",
            TextSize = 14,
            TextXAlignment = Enum.TextXAlignment.Left,
            LayoutOrder = 1,
        }, body)
    end
    if options.Content and options.Content ~= "" then
        self:Make("TextLabel", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            Text = options.Content,
            TextSize = 13,
            TextWrapped = true,
            Muted = true,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
            LayoutOrder = 2,
        }, body)
    end
    local dismissed = false
    local function dismiss()
        if dismissed then
            return
        end
        dismissed = true
        local index = table.find(self._toasts, dismiss)
        if index then
            table.remove(self._toasts, index)
        end
        self:Motion("ToastOut", card, { Position = UDim2.fromOffset(340, 0) })
        local height = wrapper.AbsoluteSize.Y / math.max(self.ToastScale.Scale, 0.01)
        wrapper.AutomaticSize = Enum.AutomaticSize.None
        wrapper.Size = UDim2.new(1, 0, 0, height)
        task.delay(0.18, function()
            if wrapper.Parent and not self.Destroyed then
                wrapper.ClipsDescendants = true
                self:Motion("Collapse", wrapper, { Size = UDim2.new(1, 0, 0, 0) })
            end
        end)
        task.delay(0.5, function()
            wrapper:Destroy()
        end)
    end
    if #self._toasts >= 5 then
        self._toasts[1]()
    end
    table.insert(self._toasts, dismiss)
    card.Activated:Connect(dismiss)
    self:Motion("Toast", card, { Position = UDim2.fromOffset(0, 0) })
    self:Tween(progress, { Size = UDim2.new(0, 0, 0, 2) }, duration, Enum.EasingStyle.Linear)
    task.delay(duration, function()
        if not self.Destroyed then
            dismiss()
        end
    end)
    if self.TerminalPrint and options.Log ~= false then
        local tone = ({ Success = "Success", Warning = "Warning", Error = "Danger" })[options.Type] or "Muted"
        self:TerminalPrint((options.Title and (options.Title .. ": ") or "") .. (options.Content or ""), tone)
    end
    return { Dismiss = dismiss }
end

function Window:Dialog(options)
    options = options or {}
    if self._dialog then
        self._dialog.Close(true)
    end
    self:_closePopup()
    local dim = self:Make("TextButton", {
        Name = "Dialog",
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.new(0, 0, 0),
        BackgroundTransparency = 1,
        ZIndex = 100,
    }, self.Overlay)
    local card, cardFill = self:Glass(dim, "Panel", {
        Name = "DialogCard",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(0.8, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        GroupTransparency = 1,
    }, "CanvasGroup")
    cardFill[2] = "DialogHi"
    cardFill[3] = "Dialog"
    self:_applyGradientEntry(cardFill)
    card.BackgroundTransparency = 0.02
    new("UISizeConstraint", { MaxSize = Vector2.new(300, 10000) }, card)
    local pop = new("UIScale", { Scale = 0.95 }, card)
    addPadding(card, 14)
    addList(card, 8)
    self:Make("TextLabel", {
        Size = UDim2.new(1, 0, 0, 20),
        Text = options.Title or "Confirm",
        Font = "Bold",
        TextSize = self.Metrics.Text + 2,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = 1,
    }, card)
    if options.Content and options.Content ~= "" then
        self:Make("TextLabel", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            Text = options.Content,
            TextSize = self.Metrics.Text,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
            LayoutOrder = 2,
        }, card)
    end
    local handle = { Closed = false, Resolved = false }
    local elements = {}
    local function close(immediate)
        if handle.Closed then
            return
        end
        handle.Closed = true
        if self._dialog == handle then
            self._dialog = nil
        end
        if immediate then
            dim:Destroy()
            return
        end
        for _, element in ipairs(elements) do
            element.Button.Active = false
        end
        dim.Active = false
        self:Motion("DialogOut", dim, { BackgroundTransparency = 1 })
        self:Motion("DialogOut", card, { GroupTransparency = 1 })
        self:Motion("DialogOut", pop, { Scale = 0.96 })
        task.delay(0.2, function()
            dim:Destroy()
        end)
    end
    handle.Close = close
    local buttons = {}
    for index, definition in ipairs(options.Buttons or { { Text = "OK", Primary = true } }) do
        buttons[index] = {
            Text = definition.Text,
            Primary = definition.Primary,
            NoBind = true,
            Callback = function()
                if handle.Resolved or handle.Closed then
                    return
                end
                handle.Resolved = true
                close()
                if definition.Callback then
                    task.spawn(definition.Callback)
                end
            end,
        }
    end
    local _, created = self:_createButtonRow(card, buttons, 3, nil, true)
    elements = created
    self:Motion("Dialog", dim, { BackgroundTransparency = math.max(0, self.Tokens.TransScrim - 0.06) })
    self:Motion("Dialog", card, { GroupTransparency = 0 })
    self:Motion("Dialog", pop, { Scale = 1 })
    self._dialog = handle
    return handle
end

local DOCK_TOKENS = { "Accent", "Success", "Warning", "Danger", "AccentAlt" }

function Window:_iconButton(parent, order, icon, glyph, callback)
    local metrics = self.Metrics
    local size = metrics.Touch and 30 or 24
    local button = self:Make("TextButton", {
        Size = UDim2.fromOffset(size, size),
        LayoutOrder = order,
        ZIndex = 2,
    }, parent, { BackgroundColor3 = "SurfaceAlt", BackgroundTransparency = "TransField" })
    self:Corner(button, "RadControl")
    self:Stroke(button)
    local fallback = self:Make("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        Text = glyph or "",
        TextSize = 16,
        Font = "Semi",
        ZIndex = 3,
    }, button)
    local image = new("ImageLabel", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(16, 16),
        ZIndex = 4,
    }, button)
    self:ApplyIcon(image, icon, "Text", function()
        fallback.Visible = false
    end)
    self:Connect(button.MouseEnter, function()
        self:Tween(button, { BackgroundColor3 = self.Tokens.Hover })
    end)
    self:Connect(button.MouseLeave, function()
        self:Tween(button, { BackgroundColor3 = self.Tokens.SurfaceAlt })
    end)
    self:Connect(button.Activated, callback)
    return button
end

function Window:_buildGui(options)
    local metrics = self.Metrics
    local gui = new("ScreenGui", {
        Name = options.Name or "Perplexity",
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        IgnoreGuiInset = true,
        DisplayOrder = 1000,
        OnTopOfCoreBlur = true,
    })
    mountGui(gui)
    self.Gui = gui
    pcall(function()
        self.BlurEffect = new("BlurEffect", { Name = "PerplexityBlur", Size = 0 }, Lighting)
    end)
    local root = self:Make("CanvasGroup", {
        Name = "Window",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(self.BaseSize.X, self.BaseSize.Y),
        Active = true,
    }, gui, { BackgroundColor3 = "Background", BackgroundTransparency = "TransWindow" })
    self.Root = root
    self.Scale = new("UIScale", {}, root)
    self:Corner(root, "RadWindow")
    local border = self:Stroke(root, "Outline", "TransStroke", 1.5)
    self.BorderStroke = border
    self.BorderGradient = self:Gradient(border, "Accent", "AccentAlt", 0)
    self.BorderGradient.Transparency = BORDER_SWEEP
    local liquidLayer = new("Frame", { Name = "LiquidLayer", Size = UDim2.fromScale(1, 1), ClipsDescendants = true }, root)
    self.LiquidLayer = liquidLayer
    self:_createLiquid(liquidLayer, LIQUID_WINDOW)
    for _, rotation in ipairs({ 0, 90 }) do
        local shade = new("Frame", {
            Name = "Vignette",
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.new(0, 0, 0),
            ZIndex = 2,
        }, liquidLayer)
        local vignette = new("UIGradient", {
            Rotation = rotation,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.3),
                NumberSequenceKeypoint.new(0.5, 1),
                NumberSequenceKeypoint.new(1, 0.3),
            }),
        }, shade)
        table.insert(self._vignettes, vignette)
    end
    self:_applyLighting(true)
    local corners = new("Frame", { Name = "GamerCorners", Size = UDim2.fromScale(1, 1), ClipsDescendants = true }, root)
    self.CornerDecor = corners
    local bigCorner = new("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(1, 0),
        Size = UDim2.fromOffset(92, 92),
        Rotation = 45,
        BackgroundColor3 = Color3.new(1, 1, 1),
        BackgroundTransparency = self._bright and 0.5 or 0.18,
    }, corners)
    self._cornerBig = bigCorner
    self:Gradient(bigCorner, "Accent", "AccentAlt", 0)
    local smallCorner = new("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0, 1),
        Size = UDim2.fromOffset(62, 62),
        Rotation = 45,
        BackgroundColor3 = Color3.new(1, 1, 1),
        BackgroundTransparency = self._bright and 0.62 or 0.35,
    }, corners)
    self._cornerSmall = smallCorner
    self:Gradient(smallCorner, "AccentAlt", "Accent", 0)
    self.Sheen = self:Make("Frame", {
        Name = "Sheen",
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.new(1, 1, 1),
    }, root, { BackgroundTransparency = "TransSheen" })
    new("UIGradient", {
        Rotation = 90,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.55, 0.85),
            NumberSequenceKeypoint.new(1, 1),
        }),
    }, self.Sheen)
    local top = self:Make("Frame", {
        Name = "Top",
        Size = UDim2.new(1, 0, 0, metrics.Top),
    }, root, { BackgroundColor3 = "Surface", BackgroundTransparency = "TransHeader" })
    self.Top = top
    self:_line(top, {
        Size = UDim2.new(1, 0, 0, 1),
        Position = UDim2.new(0, 0, 1, -1),
    })
    local dragArea = new("Frame", { Name = "Drag", Size = UDim2.fromScale(1, 1), Active = true }, top)
    local trafficSize = metrics.Traffic
    local traffic = new("Frame", {
        Name = "Traffic",
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 14, 0.5, 0),
        Size = UDim2.fromOffset(trafficSize * 3 + 16, trafficSize),
        ZIndex = 2,
    }, top)
    self.TrafficFrame = traffic
    local glyphs = {}
    local trafficSpecs = {
        { Color = rgb(255, 95, 87), Glyph = "x", Action = function() self:SetVisible(false) end },
        { Color = rgb(254, 188, 46), Glyph = "-", Action = function() self:SetMinimized(not self.Minimized) end },
        { Color = rgb(40, 200, 64), Glyph = "+", Action = function() self:ToggleMaximize() end },
    }
    for index, spec in ipairs(trafficSpecs) do
        local dot = new("TextButton", {
            Size = UDim2.fromOffset(trafficSize, trafficSize),
            Position = UDim2.fromOffset((index - 1) * (trafficSize + 8), 0),
            BackgroundColor3 = spec.Color,
            ZIndex = 3,
        }, traffic)
        self:Corner(dot, "RadPill")
        local glyph = new("TextLabel", {
            Size = UDim2.fromScale(1, 1),
            Text = spec.Glyph,
            TextSize = 10,
            TextColor3 = Color3.fromRGB(60, 30, 20),
            FontFace = FontSets.Sans.Bold,
            TextTransparency = 1,
            ZIndex = 4,
        }, dot)
        table.insert(glyphs, glyph)
        self:Connect(dot.MouseEnter, function()
            for _, other in ipairs(glyphs) do
                self:Tween(other, { TextTransparency = 0.1 }, 0.1)
            end
        end)
        self:Connect(dot.MouseLeave, function()
            for _, other in ipairs(glyphs) do
                self:Tween(other, { TextTransparency = 1 }, 0.1)
            end
        end)
        self:Connect(dot.Activated, spec.Action)
    end
    local logo = self:Make("Frame", {
        Name = "Logo",
        AnchorPoint = Vector2.new(0, 0.5),
        Size = UDim2.fromOffset(22, 22),
        BackgroundColor3 = Color3.new(1, 1, 1),
        ZIndex = 2,
    }, top)
    self:Corner(logo, "RadIcon")
    self:Gradient(logo, "Accent", "AccentAlt", 45)
    local logoLetter = self:Make("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        Text = string.upper(string.sub(self.Title, 1, 1)),
        Font = "Bold",
        TextSize = 15,
        Color = "OnAccent",
        ZIndex = 3,
    }, logo)
    local logoImage = new("ImageLabel", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(16, 16),
        ImageColor3 = Color3.new(1, 1, 1),
        ZIndex = 4,
    }, logo)
    self:ApplyIcon(logoImage, self.Icon or "sparkles", nil, function()
        logoLetter.Visible = false
    end)
    self.LogoBox = logo
    local titleGroup = new("Frame", {
        Name = "TitleGroup",
        AnchorPoint = Vector2.new(0, 0.5),
        Size = UDim2.new(0, 0, 1, 0),
        AutomaticSize = Enum.AutomaticSize.X,
        ZIndex = 2,
    }, top)
    local titleLayout = addList(titleGroup, 8, Enum.FillDirection.Horizontal)
    titleLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    self.TitleGroup = titleGroup
    self.TitleLabel = self:Make("TextLabel", {
        Size = UDim2.fromOffset(0, 20),
        AutomaticSize = Enum.AutomaticSize.X,
        Text = self:Display(self.Title),
        Font = "Bold",
        TextSize = metrics.Text + 4,
        LayoutOrder = 1,
    }, titleGroup)
    self:_onStyle("title", function()
        self.TitleLabel.Text = self:Display(self.Title)
    end)
    if not metrics.Touch then
        local badge = self:Glass(titleGroup, "Field", {
            Size = UDim2.fromOffset(0, 20),
            AutomaticSize = Enum.AutomaticSize.X,
            LayoutOrder = 2,
        })
        addPadding(badge, 0, 8, 0, 8)
        self:Make("TextLabel", {
            Size = UDim2.fromOffset(0, 20),
            AutomaticSize = Enum.AutomaticSize.X,
            Text = options.Version or ("v" .. Library.Version),
            TextSize = metrics.Small,
            Muted = true,
        }, badge)
    end
    local actions = new("Frame", {
        Name = "Actions",
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -10, 0.5, 0),
        Size = UDim2.new(0, 0, 1, 0),
        AutomaticSize = Enum.AutomaticSize.X,
        ZIndex = 2,
    }, top)
    local actionsLayout = addList(actions, 6, Enum.FillDirection.Horizontal)
    actionsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    actionsLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    local searchSize = metrics.ControlHeight + 4
    local searchExpanded = metrics.Touch and 118 or 150
    local search = self:Glass(actions, "Field", {
        Name = "Search",
        Size = UDim2.fromOffset(searchSize, searchSize),
        LayoutOrder = 1,
        ClipsDescendants = true,
        ZIndex = 2,
    })
    local searchIcon = new("ImageLabel", {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, (searchSize - 14) / 2, 0.5, 0),
        Size = UDim2.fromOffset(14, 14),
        ZIndex = 3,
    }, search)
    local searchGlyph = self:Make("TextLabel", {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, (searchSize - 14) / 2, 0.5, 0),
        Size = UDim2.fromOffset(14, 14),
        Text = "?",
        TextSize = 12,
        Muted = true,
        ZIndex = 3,
    }, search)
    self:ApplyIcon(searchIcon, "search", "Muted", function()
        searchGlyph.Visible = false
    end)
    local searchBox = self:Make("TextBox", {
        Name = "Input",
        Position = UDim2.fromOffset(searchSize, 0),
        Size = UDim2.new(1, -(searchSize + 6), 1, 0),
        PlaceholderText = "Search...",
        TextSize = metrics.Text - 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        ClipsDescendants = true,
        Visible = false,
        ZIndex = 3,
    }, search, { PlaceholderColor3 = "Muted" })
    local searchHit = new("TextButton", { Name = "Hit", Size = UDim2.fromOffset(searchSize, searchSize), ZIndex = 4 }, search)
    local searchOpen = false
    local function setSearchOpen(open)
        searchOpen = open
        searchBox.Visible = open
        self:Motion("Tab", search, { Size = UDim2.fromOffset(open and searchExpanded or searchSize, searchSize) })
        if open then
            searchBox:CaptureFocus()
        end
    end
    self.SearchBox = searchBox
    self._setSearchOpen = setSearchOpen
    self:Connect(searchHit.Activated, function()
        if searchOpen then
            searchBox.Text = ""
            setSearchOpen(false)
        else
            setSearchOpen(true)
        end
    end)
    self:Connect(searchBox.FocusLost, function(enterPressed)
        if enterPressed and searchBox.Text ~= "" and self.PaletteEnabled then
            local query = searchBox.Text
            searchBox.Text = ""
            setSearchOpen(false)
            self:OpenPalette(query)
        elseif searchBox.Text == "" and searchOpen then
            setSearchOpen(false)
        end
    end)
    self:Connect(searchBox:GetPropertyChangedSignal("Text"), function()
        self:SetSearch(searchBox.Text)
    end)
    if self.PaletteEnabled then
        self.PaletteButton = self:_iconButton(actions, 2, "command", "K", function()
            self:TogglePalette()
        end)
    end
    self.BellButton = self:_iconButton(actions, 3, "bell", "!", function()
        self:ToggleNotifications()
    end)
    self._bellDot = self:Make("Frame", {
        Name = "Dot",
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -4, 0, 4),
        Size = UDim2.fromOffset(7, 7),
        Visible = false,
        ZIndex = 6,
    }, self.BellButton, { BackgroundColor3 = "Danger" })
    self:Corner(self._bellDot, "RadPill")
    self:_iconButton(actions, 4, "save", "S", function()
        self:FastSave()
    end)
    self._terminalButton = self:_iconButton(actions, 5, "terminal", ">", function()
        self:SetTerminalVisible(not self.TerminalVisible)
    end)
    local windowButtons = new("Frame", {
        Name = "WindowButtons",
        Size = UDim2.new(0, 0, 1, 0),
        AutomaticSize = Enum.AutomaticSize.X,
        LayoutOrder = 6,
        ZIndex = 2,
    }, actions)
    local windowLayout = addList(windowButtons, 6, Enum.FillDirection.Horizontal)
    windowLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    self:_iconButton(windowButtons, 1, "minus", "-", function()
        self:SetMinimized(not self.Minimized)
    end)
    self:_iconButton(windowButtons, 2, "x", "x", function()
        self:SetVisible(false)
    end)
    self.WindowButtons = windowButtons
    local dragCenter
    self._windowDrag = self:_trackDrag(dragArea, function(input, record)
        local mover = self._movers.Window
        if not mover or not dragCenter then
            return
        end
        local delta = Vector2.new(input.Position.X, input.Position.Y) - record.Start
        mover.Target = self:_clampCenter(dragCenter + delta)
    end, function()
        local screen = self:_screenSize()
        dragCenter = Vector2.new(self._center.X * screen.X, self._center.Y * screen.Y)
        self:_closePopup()
        self._movers.Window = {
            Current = dragCenter,
            Target = dragCenter,
            Dragging = true,
            Rate = metrics.Touch and 18 or 34,
            MaxSpeed = metrics.Touch and 3200 or 12000,
            Apply = function(position)
                local screen = self:_screenSize()
                self._center = Vector2.new(position.X / screen.X, position.Y / screen.Y)
                self:_placeRoot()
            end,
        }
    end, function()
        local mover = self._movers.Window
        if mover then
            mover.Dragging = false
            mover.Rate = 50
        end
    end)
    local body = new("Frame", {
        Name = "Body",
        Position = UDim2.fromOffset(0, metrics.Top),
        Size = UDim2.new(1, 0, 1, -metrics.Top),
    }, root)
    self.Body = body
    local rail = self:Make("Frame", { Name = "Rail" }, body, { BackgroundColor3 = "Surface", BackgroundTransparency = "TransRail" })
    self:Corner(rail, "RadPanel")
    self.Rail = rail
    self.RailDivider = self:_line(body, {
        Name = "RailDivider",
        Size = UDim2.new(0, 1, 1, 0),
    }, 90)
    self.RailList = self:Make("ScrollingFrame", {
        Name = "Tabs",
        Size = UDim2.fromScale(1, 1),
        CanvasSize = UDim2.new(),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        ScrollBarThickness = 0,
    }, rail)
    addList(self.RailList, 4)
    local tabDivider = new("Frame", {
        Name = "TabDivider",
        Size = UDim2.new(1, 0, 0, 9),
        LayoutOrder = 999,
        Visible = false,
    }, self.RailList)
    self:Make("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, -20, 0, 1),
    }, tabDivider, { BackgroundColor3 = "Outline", BackgroundTransparency = "TransStroke" })
    self.TabDivider = tabDivider
    local railBottom = new("Frame", {
        Name = "RailBottom",
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.fromScale(0, 1),
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
    }, rail)
    addList(railBottom, 6)
    self.RailBottom = railBottom
    local footer = self:Glass(railBottom, "Card", {
        Name = "Footer",
        Size = UDim2.new(1, 0, 0, 52),
        LayoutOrder = 2,
    })
    self.Footer = footer
    local footerLogo = self:Make("Frame", {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 6, 0.5, 0),
        Size = UDim2.fromOffset(30, 30),
        BackgroundColor3 = Color3.new(1, 1, 1),
    }, footer)
    self:Corner(footerLogo, "RadIcon")
    self:Gradient(footerLogo, "Accent", "AccentAlt", 45)
    local footerImage = new("ImageLabel", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(18, 18),
        ImageColor3 = Color3.new(1, 1, 1),
    }, footerLogo)
    local footerLetter = self:Make("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        Text = string.upper(string.sub(self.Title, 1, 1)),
        Font = "Bold",
        TextSize = 15,
        Color = "OnAccent",
    }, footerLogo)
    self:ApplyIcon(footerImage, self.Icon or "sparkles", nil, function()
        footerLetter.Visible = false
    end)
    self:Make("TextLabel", {
        Position = UDim2.fromOffset(42, 6),
        Size = UDim2.new(1, -46, 0, 14),
        Text = self.Title,
        Font = "Semi",
        TextSize = metrics.Small + 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
    }, footer)
    self:Make("TextLabel", {
        Position = UDim2.fromOffset(42, 20),
        Size = UDim2.new(1, -46, 0, 12),
        Text = options.Version or ("v" .. Library.Version),
        TextSize = metrics.Small - 1,
        Muted = true,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, footer)
    if options.Status ~= false then
        local pill = self:Make("Frame", {
            Position = UDim2.fromOffset(42, 33),
            Size = UDim2.fromOffset(0, 14),
            AutomaticSize = Enum.AutomaticSize.X,
        }, footer, { BackgroundColor3 = "Success" })
        pill.BackgroundTransparency = 0.8
        self:Corner(pill, "RadPill")
        addPadding(pill, 0, 8, 0, 18)
        local dot = self:Make("Frame", {
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.new(0, -12, 0.5, 0),
            Size = UDim2.fromOffset(6, 6),
        }, pill, { BackgroundColor3 = "Success" })
        self:Corner(dot, "RadPill")
        self:Make("TextLabel", {
            Size = UDim2.fromOffset(0, 14),
            AutomaticSize = Enum.AutomaticSize.X,
            Text = options.Status or "Supported",
            TextSize = metrics.Small - 1,
            Color = "Success",
        }, pill)
    end
    self:Connect(railBottom:GetPropertyChangedSignal("AbsoluteSize"), function()
        local height = railBottom.AbsoluteSize.Y / self.Scale.Scale
        self.RailList.Size = UDim2.new(1, 0, 1, -(height + 8))
    end)
    local dock = self:Glass(body, "Panel", {
        Name = "Dock",
        AnchorPoint = Vector2.new(0.5, 1),
        Size = UDim2.new(0, 0, 0, metrics.DockHeight),
        AutomaticSize = Enum.AutomaticSize.X,
    })
    addPadding(dock, 4, 10, 2, 10)
    local dockLayout = addList(dock, 2, Enum.FillDirection.Horizontal)
    dockLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    dockLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    self.Dock = dock
    self:Connect(dock.MouseEnter, function()
        self._dockHover = true
    end)
    self:Connect(dock.MouseLeave, function()
        self._dockHover = false
    end)
    self.PageHolder = new("Frame", { Name = "Pages", ClipsDescendants = true }, body)
    self:_buildTerminal(body)
    local gripSize = metrics.Touch and 28 or 16
    local grip = new("TextButton", {
        Name = "Resize",
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.fromScale(1, 1),
        Size = UDim2.fromOffset(gripSize, gripSize),
        ZIndex = 10,
    }, root)
    self.Grip = grip
    for _, dotSpec in ipairs({ { 1, 1 }, { 2, 1 }, { 3, 1 }, { 1, 2 }, { 2, 2 }, { 1, 3 } }) do
        self:Make("Frame", {
            Size = UDim2.fromOffset(2, 2),
            AnchorPoint = Vector2.new(1, 1),
            Position = UDim2.new(1, 3 - dotSpec[1] * 4, 1, 3 - dotSpec[2] * 4),
            ZIndex = 11,
        }, grip, { BackgroundColor3 = "Muted" })
    end
    local resizeStart, resizeSize, resizeCorner
    self:_trackDrag(grip, function(input)
        local scale = self._targetScale or self.Scale.Scale
        local screen = self:_screenSize()
        local slow = metrics.Touch and 0.7 or 1
        local delta = (Vector2.new(input.Position.X, input.Position.Y) - resizeStart) * slow / scale
        local maxWidth = math.max(self.MinSize.X, (screen.X - resizeCorner.X) / scale)
        local maxHeight = math.max(self.MinSize.Y, (screen.Y - resizeCorner.Y) / scale)
        local width = math.clamp(resizeSize.X + delta.X, self.MinSize.X, maxWidth)
        local height = math.clamp(resizeSize.Y + delta.Y, self.MinSize.Y, maxHeight)
        self.PreferredSize = Vector2.new(width, height)
        self.BaseSize = self.PreferredSize
        self:_applySize()
        self:_layout()
        local center = resizeCorner + self.BaseSize * scale / 2
        self._center = Vector2.new(center.X / screen.X, center.Y / screen.Y)
        self:_placeRoot()
    end, function(input)
        resizeStart = Vector2.new(input.Position.X, input.Position.Y)
        resizeSize = self.BaseSize
        self._manualSize = true
        local screen = self:_screenSize()
        local scale = self._targetScale or self.Scale.Scale
        resizeCorner = Vector2.new(
            self._center.X * screen.X - self.BaseSize.X * scale / 2,
            self._center.Y * screen.Y - self:_windowHeight() * scale / 2
        )
        self:_closePopup()
    end)
    self.Overlay = new("Frame", { Name = "Overlay", Size = UDim2.fromScale(1, 1), ZIndex = 50 }, root)
    self.Blocker = new("TextButton", {
        Name = "Blocker",
        Size = UDim2.fromScale(1, 1),
        Visible = false,
        ZIndex = 1,
    }, self.Overlay)
    self:Connect(self.Blocker.Activated, function()
        self:_closePopup()
    end)
    local toasts = new("Frame", {
        Name = "Toasts",
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.fromScale(1, 0),
        Size = UDim2.new(0, 250, 2, 0),
    }, gui)
    addPadding(toasts, 12)
    local toastLayout = addList(toasts, 8)
    toastLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    self.ToastHolder = toasts
    self.ToastScale = new("UIScale", {}, toasts)
    local showButton = options.ToggleButton
    if showButton == nil then
        showButton = metrics.Touch
    end
    if showButton then
        local buttonSize = metrics.Touch and 52 or 44
        local half = buttonSize / 2
        local menuButton = self:Glass(gui, "Panel", {
            Name = "MenuButton",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromOffset(16 + half, 80 + half),
            Size = UDim2.fromOffset(buttonSize, buttonSize),
            ZIndex = 5,
        }, "CanvasGroup")
        for _, child in ipairs(menuButton:GetChildren()) do
            if child:IsA("UICorner") then
                child:Destroy()
            end
        end
        self:Corner(menuButton, "RadPill")
        local menuLabel = self:Make("TextButton", {
            Size = UDim2.fromScale(1, 1),
            Text = string.upper(string.sub(self.Title, 1, 1)),
            Font = "Bold",
            TextSize = 20,
            Color = "Accent",
            ZIndex = 6,
        }, menuButton)
        local menuDot = self:Make("Frame", {
            Name = "Unread",
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.new(1, -6, 0, 6),
            Size = UDim2.fromOffset(10, 10),
            Visible = false,
            ZIndex = 7,
        }, menuButton, { BackgroundColor3 = "Danger" })
        self:Corner(menuDot, "RadPill")
        local menuScale = new("UIScale", {}, menuButton)
        local menuStart
        local snap = options.SnapToEdge ~= false
        local saved = self.Prefs.Data.MenuPos
        local rel = Vector2.new(0, 0.1)
        if type(saved) == "table" and tonumber(saved.x) and tonumber(saved.y) then
            rel = Vector2.new(math.clamp(saved.x, 0, 1), math.clamp(saved.y, 0, 1))
        end
        self._menuRel = rel
        self._menuHalf = half
        self._menuPos = Vector2.new(16, 80)
        self.MenuButton = menuButton
        self._menuDot = menuDot
        local lastTouch = 0
        local faded = false
        local function wake()
            lastTouch = self._time
            if faded then
                faded = false
                self:Motion("Fade", menuButton, { GroupTransparency = 0 })
            end
        end
        self._menuWake = wake
        self:Connect(menuLabel.MouseEnter, wake)
        self._menuIdle = function()
            if faded or self._movers.Menu or self._unread > 0 then
                return
            end
            if self._time - lastTouch > 3.5 then
                faded = true
                self:Motion("Fade", menuButton, { GroupTransparency = 0.5 })
            end
        end
        self._menuHandle = self:_trackDrag(menuLabel, function(input, record)
            local mover = self._movers.Menu
            if not mover or not menuStart then
                return
            end
            local delta = Vector2.new(input.Position.X, input.Position.Y) - record.Start
            local lowX, lowY, highX, highY = self:_menuLimits()
            mover.Target = Vector2.new(
                math.clamp(menuStart.X + delta.X, lowX, highX),
                math.clamp(menuStart.Y + delta.Y, lowY, highY)
            )
        end, function()
            wake()
            self:Motion("Press", menuScale, { Scale = 0.92 })
            menuStart = self._menuPos
            self._movers.Menu = {
                Current = menuStart,
                Target = menuStart,
                Dragging = true,
                Rate = metrics.Touch and 24 or 40,
                MaxSpeed = 5000,
                Apply = function(position)
                    self._menuPos = position
                    menuButton.Position = UDim2.fromOffset(position.X + half, position.Y + half)
                end,
            }
        end, function(cancelled, record)
            self:Motion("Spring", menuScale, { Scale = 1 })
            local mover = self._movers.Menu
            if mover then
                mover.Dragging = false
                mover.Rate = 50
            end
            lastTouch = self._time
            if not cancelled and not record.Moved then
                self:Toggle()
                return
            end
            local lowX, lowY, highX, highY = self:_menuLimits()
            local position = mover and mover.Target or self._menuPos
            local rx = highX > lowX and math.clamp((position.X - lowX) / (highX - lowX), 0, 1) or 0
            local ry = highY > lowY and math.clamp((position.Y - lowY) / (highY - lowY), 0, 1) or 0
            if snap then
                rx = (position.X + half) < self:_screenSize().X / 2 and 0 or 1
            end
            self._menuRel = Vector2.new(rx, ry)
            self:_placeMenuButton(true)
            self:_setData("MenuPos", { x = math.floor(rx * 1000 + 0.5) / 1000, y = math.floor(ry * 1000 + 0.5) / 1000 })
        end, { Threshold = 10 })
        self:_placeMenuButton(false)
    end
    self:Connect(gui:GetPropertyChangedSignal("AbsoluteSize"), function()
        self:_queue("Scale")
    end)
    local camera = workspace.CurrentCamera
    if camera then
        self:Connect(camera:GetPropertyChangedSignal("ViewportSize"), function()
            self:_queue("Scale")
        end)
    end
    if metrics.Touch then
        for _, name in ipairs({ "OnScreenKeyboardVisible", "OnScreenKeyboardSize", "OnScreenKeyboardPosition" }) do
            local ok, signal = pcall(function()
                return UserInputService:GetPropertyChangedSignal(name)
            end)
            if ok and signal then
                self:Connect(signal, function()
                    self:_queue("Keyboard")
                    task.delay(0.35, function()
                        if not self.Destroyed then
                            self:_queue("Keyboard")
                        end
                    end)
                end)
            end
        end
        for _, name in ipairs({ "TextBoxFocused", "TextBoxFocusReleased" }) do
            local signal = UserInputService[name]
            if signal then
                self:Connect(signal, function()
                    self:_queue("Keyboard")
                end)
            end
        end
    end
    if UserInputService.WindowFocused then
        self:Connect(UserInputService.WindowFocused, function()
            self._focused = true
        end)
    end
    self:Connect(UserInputService.InputBegan, function(input)
        self:_handleInputBegan(input)
    end)
    self:Connect(UserInputService.InputEnded, function(input)
        self:_handleInputEnded(input)
        self:_dragEnded(input)
    end)
    self:Connect(UserInputService.InputChanged, function(input)
        self:_dragInput(input)
    end)
    self:Connect(UserInputService.WindowFocusReleased, function()
        self._focused = false
        self:_cancelDrags()
    end)
    self:Connect(RunService.RenderStepped, function(dt)
        self:_step(dt)
    end)
    self:_applyStyleLayout()
    self:_updateScale()
end

function Window:_applyStyleLayout()
    local style = self.Style
    local metrics = self.Metrics
    self.TrafficFrame.Visible = style.Traffic
    self.WindowButtons.Visible = not style.Traffic
    local leftX = style.Traffic and (14 + metrics.Traffic * 3 + 16 + 14) or 14
    self.LogoBox.Position = UDim2.new(0, leftX, 0.5, 0)
    self.TitleGroup.Position = UDim2.new(0, leftX + 30, 0.5, 0)
    self.LiquidLayer.Visible = self.Effects.Liquid and style.Liquid
    self.BorderGradient.Enabled = self.Effects.Border and style.Border
    self.BorderStroke.Thickness = style.BorderThickness or 1.5
    local decor = QUALITY[self.Quality].Decor ~= false
    self.CornerDecor.Visible = style.Corner == true and decor
    self:_applyLines()
    self:_syncGamerParts()
    self.Sheen.Visible = style.Numbers.TransSheen < 1 and decor
    for _, tab in ipairs(self.AllTabs) do
        tab:_applyNav()
    end
    for _, hook in pairs(self._styleHooks) do
        pcall(hook)
    end
    self:_refreshGradients()
    self:_layout()
    for _, tab in ipairs(self.AllTabs) do
        tab:_updateLayout()
    end
end

function Window:SetTerminalVisible(visible)
    self.TerminalVisible = visible == true
    if self._terminalToggle then
        self._terminalToggle:Set(self.TerminalVisible, true)
    end
    self:_layout()
    if self.TerminalVisible and self._terminalBanner then
        self._terminalBanner()
    end
end

function Window:_playIntro()
    local splash = self:Make("CanvasGroup", {
        Name = "Intro",
        Size = UDim2.fromScale(1, 1),
        ZIndex = 200,
        Active = true,
    }, self.Overlay, { BackgroundColor3 = "Background" })
    splash.BackgroundTransparency = 0
    local center = new("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(260, 170),
    }, splash)
    local pop = new("UIScale", { Scale = 0.6 }, center)
    local logo = self:Make("Frame", {
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 0, 0),
        Size = UDim2.fromOffset(64, 64),
        BackgroundColor3 = Color3.new(1, 1, 1),
    }, center)
    self:Corner(logo, "RadPanel")
    self:Gradient(logo, "Accent", "AccentAlt", 45)
    local letter = self:Make("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        Text = string.upper(string.sub(self.Title, 1, 1)),
        Font = "Bold",
        TextSize = 34,
        Color = "OnAccent",
    }, logo)
    local image = new("ImageLabel", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(38, 38),
        ImageColor3 = Color3.new(1, 1, 1),
    }, logo)
    self:ApplyIcon(image, self.Icon or "sparkles", nil, function()
        letter.Visible = false
    end)
    self:Make("TextLabel", {
        Position = UDim2.fromOffset(0, 74),
        Size = UDim2.new(1, 0, 0, 28),
        Text = self.Title,
        Font = "Bold",
        TextSize = 24,
    }, center)
    self:Make("TextLabel", {
        Position = UDim2.fromOffset(0, 102),
        Size = UDim2.new(1, 0, 0, 16),
        Text = "v" .. Library.Version .. "  by " .. Library.Author,
        TextSize = 12,
        Muted = true,
    }, center)
    local track = self:Make("Frame", {
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 0, 134),
        Size = UDim2.fromOffset(180, 4),
    }, center, { BackgroundColor3 = "SurfaceAlt" })
    self:Corner(track, "RadPill")
    local fill = self:Make("Frame", { Size = UDim2.new(0, 0, 1, 0), BackgroundColor3 = Color3.new(1, 1, 1) }, track)
    self:Corner(fill, "RadPill")
    self:Gradient(fill, "Accent", "AccentAlt", 0)
    self:Tween(pop, { Scale = 1 }, 0.5, Enum.EasingStyle.Quint)
    self:Tween(fill, { Size = UDim2.new(1, 0, 1, 0) }, 1.0, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
    task.delay(1.15, function()
        if self.Destroyed then
            return
        end
        self:Tween(splash, { GroupTransparency = 1 }, 0.45)
        task.delay(0.5, function()
            splash:Destroy()
        end)
    end)
end

function Window:SelectTab(tab)
    self:_closePopup()
    if self.SelectedTab == tab then
        return
    end
    local previous = self.SelectedTab
    local direction = 1
    if previous then
        direction = tab.Index >= previous.Index and 1 or -1
        previous.Selected = false
        previous:_applySelected(true)
        previous.Page.Visible = false
        previous.Canvas.Visible = false
    end
    self.SelectedTab = tab
    tab.Selected = true
    tab.Page.Visible = true
    tab.Canvas.Visible = true
    if previous and QUALITY[self.Quality].Page then
        self:Tween(tab.Canvas, { GroupTransparency = 1, Position = UDim2.fromOffset(0, 14 * direction) }, 0)
        self:Motion("Page", tab.Canvas, { GroupTransparency = 0, Position = UDim2.fromOffset(0, 0) })
    else
        self:Tween(tab.Canvas, { GroupTransparency = 0, Position = UDim2.fromOffset(0, 0) }, 0)
    end
    tab:_applySelected(true)
    tab:_updateLayout()
    if self.SearchQuery ~= "" then
        tab:_updateEmpty(self.SearchQuery)
    end
    if self._rememberTab and not tab.Hidden then
        self:_setData("LastTab", tab.Title)
    end
    if not self._internalSelect then
        self._tabTouched = true
    end
    self:_emit("TabChanged", tab)
end

function Window:AddTab(options)
    if type(options) == "string" then
        options = { Title = options }
    end
    local tab = self:_createTab(options or {}, false)
    table.insert(self.Tabs, tab)
    if not self.SelectedTab then
        self._internalSelect = true
        self:SelectTab(tab)
        self._internalSelect = false
    end
    local remembered = self.Prefs.Data.LastTab
    if self._rememberTab and remembered == tab.Title and self.SelectedTab ~= tab then
        task.defer(function()
            if not self.Destroyed and not self._tabTouched then
                self._internalSelect = true
                self:SelectTab(tab)
                self._internalSelect = false
            end
        end)
    end
    return tab
end

function Window:_createTab(options, builtin)
    local metrics = self.Metrics
    local tab = setmetatable({
        Window = self,
        Title = options.Title or options.Name or "Tab",
        IconSpec = options.Icon,
        Builtin = builtin == true,
        Selected = false,
        Sections = { Left = {}, Right = {} },
        Index = #self.AllTabs + 1,
    }, Tab)
    table.insert(self.AllTabs, tab)
    tab.Holder = new("Frame", {
        Name = "TabItem",
        Size = UDim2.new(1, 0, 0, metrics.TabHeight),
        LayoutOrder = (builtin and 1000 or 0) + tab.Index,
    })
    tab.Button = self:Make("TextButton", { Name = "Tab" }, tab.Holder, { BackgroundColor3 = "SurfaceAlt" })
    tab.Button.BackgroundTransparency = 1
    tab.ButtonCorner = self:Corner(tab.Button, "RadControl")
    tab.Fill = self:Make("Frame", {
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BackgroundTransparency = 1,
    }, tab.Button)
    tab.FillCorner = self:Corner(tab.Fill, "RadControl")
    local _, entry = self:Gradient(tab.Fill, "Accent", "AccentAlt", 0)
    tab.FillEntry = entry
    tab.Glow = self:Make("UIStroke", { Thickness = 2, Transparency = 1, ApplyStrokeMode = Enum.ApplyStrokeMode.Border }, tab.Button, { Color = "Accent" })
    tab.Icon = new("ImageLabel", { Name = "Icon", AnchorPoint = Vector2.new(0, 0.5), ZIndex = 3 }, tab.Button)
    tab.IconFallback = self:Make("TextLabel", {
        Name = "Fallback",
        AnchorPoint = Vector2.new(0, 0.5),
        Text = string.upper(string.sub(tab.Title, 1, 1)),
        Font = "Bold",
        TextSize = metrics.Text,
        ZIndex = 3,
    }, tab.Button)
    self:ApplyIcon(tab.Icon, options.Icon, "Text", function()
        tab.IconFallback.Visible = false
    end)
    tab.Label = self:Make("TextLabel", {
        Name = "Label",
        AnchorPoint = Vector2.new(0, 0.5),
        Text = tab.Title,
        Font = "Semi",
        TextSize = metrics.Text,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        RichText = true,
        ZIndex = 3,
    }, tab.Button)
    tab.Bar = self:Make("Frame", {
        Name = "Bar",
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.new(0, 3, 0.2, 0),
        BackgroundTransparency = 1,
        ZIndex = 4,
    }, tab.Holder, { BackgroundColor3 = "Accent" })
    self:Corner(tab.Bar, "RadPill")
    tab.Dot = self:Make("Frame", {
        Name = "Dot",
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.new(0.5, 0, 1, 6),
        Size = UDim2.fromOffset(5, 5),
        BackgroundTransparency = 1,
    }, tab.Holder, { BackgroundColor3 = "Text" })
    self:Corner(tab.Dot, "RadPill")
    tab.DockScale = new("UIScale", {}, tab.Button)
    tab.Tip = self:Glass(tab.Holder, "Field", {
        Name = "Tip",
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.new(0.5, 0, 0, -4),
        Size = UDim2.fromOffset(0, 20),
        AutomaticSize = Enum.AutomaticSize.X,
        Visible = false,
        ZIndex = 20,
    })
    addPadding(tab.Tip, 0, 8, 0, 8)
    self:Make("TextLabel", {
        Size = UDim2.fromOffset(0, 20),
        AutomaticSize = Enum.AutomaticSize.X,
        Text = tab.Title,
        TextSize = metrics.Small,
        ZIndex = 21,
    }, tab.Tip)
    self:Connect(tab.Button.MouseEnter, function()
        if self.Style.Nav == "Dock" or not self:_showLabels() then
            tab.Tip.Visible = true
        end
    end)
    self:Connect(tab.Button.MouseLeave, function()
        tab.Tip.Visible = false
    end)
    tab.Canvas = new("CanvasGroup", { Name = "PageCanvas", Size = UDim2.fromScale(1, 1), Visible = false }, self.PageHolder)
    tab.Page = self:Make("ScrollingFrame", {
        Name = "Page",
        Size = UDim2.fromScale(1, 1),
        CanvasSize = UDim2.new(),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        ScrollBarThickness = metrics.ScrollBar,
        VerticalScrollBarInset = Enum.ScrollBarInset.None,
        Visible = false,
    }, tab.Canvas, { ScrollBarImageColor3 = "Accent" })
    addPadding(tab.Page, 2, metrics.ScrollBar + 4, 6, 2)
    tab.Layout = addList(tab.Page, metrics.Gap, Enum.FillDirection.Horizontal)
    tab.Left = new("Frame", {
        Name = "Left",
        Size = UDim2.new(0.5, -metrics.Gap / 2, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = 1,
        Visible = false,
    }, tab.Page)
    addList(tab.Left, metrics.Gap)
    tab.Right = new("Frame", {
        Name = "Right",
        Size = UDim2.new(0.5, -metrics.Gap / 2, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = 2,
        Visible = false,
    }, tab.Page)
    addList(tab.Right, metrics.Gap)
    self:Connect(tab.Button.Activated, function()
        self._tabTouched = true
        self:SelectTab(tab)
    end)
    self:Connect(tab.Button.MouseEnter, function()
        tab:_applyHover(true)
    end)
    self:Connect(tab.Button.MouseLeave, function()
        tab:_applyHover(false)
    end)
    self:Connect(tab.Page:GetPropertyChangedSignal("AbsoluteSize"), function()
        self:_queue("Tabs", tab)
    end)
    tab:_applyNav()
    tab:_applySelected(false)
    self:_syncTabDivider()
    return tab
end

function Tab:_applyLabel()
    local window = self.Window
    if window.StyleId == "ClaudeCode" then
        local marker = self.Selected and string.format('<font color="%s">&gt;</font> ', hexOf(window.Tokens.AccentText)) or "  "
        self.Label.Text = marker .. escapeRich(string.lower(self.Title))
    else
        self.Label.Text = escapeRich(window:Display(self.Title))
    end
end

function Window:_showLabels()
    return self.Style.ShowLabels == true and not self._compact
end

function Tab:_applyNav()
    local window = self.Window
    local metrics = window.Metrics
    local style = window.Style
    local holder, button, fill, icon, fallback, label = self.Holder, self.Button, self.Fill, self.Icon, self.IconFallback, self.Label
    local dock = style.Nav == "Dock"
    if dock then
        holder.Parent = window.Dock
    else
        holder.Parent = window.RailList
    end
    local iconSize = metrics.IconSize
    if dock then
        holder.Size = UDim2.fromOffset(metrics.DockIcon + 14, metrics.DockIcon + 16)
        button.AnchorPoint = Vector2.new(0.5, 1)
        button.Position = UDim2.new(0.5, 0, 1, -8)
        button.Size = UDim2.fromOffset(metrics.DockIcon, metrics.DockIcon)
        button.BackgroundTransparency = 1
        local token = DOCK_TOKENS[(self.Index - 1) % #DOCK_TOKENS + 1]
        self.FillEntry[2] = token
        self.FillEntry[3] = token
        self.FillCorner.CornerRadius = UDim.new(0, 12)
        self.ButtonCorner.CornerRadius = UDim.new(0, 12)
        fill.BackgroundTransparency = 0
        icon.Visible = true
        icon.AnchorPoint = Vector2.new(0.5, 0.5)
        icon.Position = UDim2.fromScale(0.5, 0.5)
        icon.Size = UDim2.fromOffset(metrics.DockIcon * 0.52, metrics.DockIcon * 0.52)
        fallback.AnchorPoint = Vector2.new(0.5, 0.5)
        fallback.Position = UDim2.fromScale(0.5, 0.5)
        fallback.Size = UDim2.fromOffset(metrics.DockIcon * 0.5, metrics.DockIcon * 0.5)
        label.Visible = false
    elseif window:_showLabels() then
        holder.Size = UDim2.new(1, 0, 0, metrics.TabHeight)
        button.AnchorPoint = Vector2.new(0, 0)
        button.Position = UDim2.fromOffset(0, 0)
        button.Size = UDim2.fromScale(1, 1)
        button.BackgroundTransparency = 1
        self.FillEntry[2] = "Accent"
        self.FillEntry[3] = "AccentAlt"
        self.FillCorner.CornerRadius = window.Tokens.RadControl
        self.ButtonCorner.CornerRadius = window.Tokens.RadControl
        local showIcon = style.ShowIcons
        icon.Visible = showIcon
        icon.AnchorPoint = Vector2.new(0, 0.5)
        icon.Position = UDim2.new(0, 12, 0.5, 0)
        icon.Size = UDim2.fromOffset(iconSize, iconSize)
        fallback.AnchorPoint = Vector2.new(0, 0.5)
        fallback.Position = UDim2.new(0, 12, 0.5, 0)
        fallback.Size = UDim2.fromOffset(iconSize, iconSize)
        label.Visible = true
        local textX = showIcon and (12 + iconSize + 10) or 10
        label.Position = UDim2.new(0, textX, 0.5, 0)
        label.Size = UDim2.new(1, -(textX + 8), 0, metrics.TabHeight - 8)
    else
        holder.Size = UDim2.new(1, 0, 0, metrics.TabHeight + 10)
        button.AnchorPoint = Vector2.new(0.5, 0.5)
        button.Position = UDim2.fromScale(0.5, 0.5)
        button.Size = UDim2.fromOffset(metrics.TabHeight + 4, metrics.TabHeight + 4)
        button.BackgroundTransparency = 0.3
        self.FillEntry[2] = "Accent"
        self.FillEntry[3] = "AccentAlt"
        self.FillCorner.CornerRadius = window.Tokens.RadPill
        self.ButtonCorner.CornerRadius = window.Tokens.RadPill
        icon.Visible = true
        icon.AnchorPoint = Vector2.new(0.5, 0.5)
        icon.Position = UDim2.fromScale(0.5, 0.5)
        icon.Size = UDim2.fromOffset(iconSize, iconSize)
        fallback.AnchorPoint = Vector2.new(0.5, 0.5)
        fallback.Position = UDim2.fromScale(0.5, 0.5)
        fallback.Size = UDim2.fromOffset(iconSize, iconSize)
        label.Visible = false
    end
    fallback.Visible = icon.Image == "" and (icon.Visible or dock or not window:_showLabels())
    window:_applyGradientEntry(self.FillEntry)
    self.Dot.Visible = dock
    self.Glow.Enabled = style.Glow
    self:_applyLabel()
    self:_applySelected(false)
    self:_refreshFallback()
end

function Tab:_applyHover(hovered)
    local window = self.Window
    local style = window.Style
    if self.Selected or style.Nav == "Dock" then
        return
    end
    local labels = window:_showLabels()
    local rest = labels and 1 or 0.3
    local lit = labels and 0.8 or 0.1
    window:Motion("Hover", self.Button, { BackgroundTransparency = hovered and lit or rest })
end

function Tab:_refreshFallback()
    if self.Icon.Image ~= "" then
        self.IconFallback.Visible = false
    end
end

function Tab:_applySelected(animate)
    local window = self.Window
    local style = window.Style
    local selected = self.Selected
    local function set(instance, properties)
        if animate then
            window:Motion("Tab", instance, properties)
        else
            for key, value in pairs(properties) do
                instance[key] = value
            end
        end
    end
    local function ink(instance, property, token)
        local before = instance[property]
        window:Bind(instance, property, token)
        local after = instance[property]
        if animate and before ~= after then
            instance[property] = before
            window:Motion("Tab", instance, { [property] = after })
        end
    end
    local tone
    if style.Nav == "Dock" then
        tone = "DockInk"
        set(self.Bar, { BackgroundTransparency = 1, Size = UDim2.new(0, 3, 0.2, 0) })
        set(self.Dot, { BackgroundTransparency = selected and 0 or 1 })
        set(self.Glow, { Transparency = 1 })
        set(self.Icon, { ImageTransparency = 0 })
        set(self.IconFallback, { TextTransparency = 0 })
    elseif window:_showLabels() then
        local filled = selected and style.Id ~= "ClaudeCode"
        tone = filled and "OnAccent" or (selected and "Text" or "Muted")
        set(self.Bar, { BackgroundTransparency = selected and 0 or 1, Size = UDim2.new(0, 3, selected and 0.55 or 0.2, 0) })
        set(self.Fill, { BackgroundTransparency = filled and 0 or 1 })
        set(self.Label, { TextTransparency = 0 })
        set(self.Icon, { ImageTransparency = 0 })
        set(self.IconFallback, { TextTransparency = 0 })
        set(self.Glow, { Transparency = 1 })
        set(self.Dot, { BackgroundTransparency = 1 })
    else
        tone = selected and "OnAccent" or "Muted"
        set(self.Bar, { BackgroundTransparency = selected and 0 or 1, Size = UDim2.new(0, 3, selected and 0.5 or 0.2, 0) })
        set(self.Fill, { BackgroundTransparency = selected and 0 or 1 })
        set(self.Icon, { ImageTransparency = 0 })
        set(self.IconFallback, { TextTransparency = 0 })
        set(self.Glow, { Transparency = (selected and style.Glow) and 0.35 or 1 })
        set(self.Dot, { BackgroundTransparency = 1 })
    end
    ink(self.Label, "TextColor3", tone)
    ink(self.Icon, "ImageColor3", tone)
    ink(self.IconFallback, "TextColor3", tone)
    self:_applyLabel()
end

function Tab:_updateLayout()
    local window = self.Window
    local metrics = window.Metrics
    local style = window.Style
    local pixels = self.Page.AbsoluteSize.X
    if pixels <= 0 then
        return
    end
    local width = pixels / window.Scale.Scale - metrics.ScrollBar - 6
    local hasLeft = #self.Sections.Left > 0 or self.CategoryPanel ~= nil
    local hasRight = #self.Sections.Right > 0
    local minimum = metrics.MinColumn * 2 + metrics.Gap
    local single = style.SingleColumn == true or width < minimum or not (hasLeft and hasRight)
    if single then
        self.Layout.FillDirection = Enum.FillDirection.Vertical
        self.Left.Size = UDim2.new(1, 0, 0, 0)
        self.Right.Size = UDim2.new(1, 0, 0, 0)
    else
        self.Layout.FillDirection = Enum.FillDirection.Horizontal
        local half = UDim2.new(0.5, -metrics.Gap / 2, 0, 0)
        self.Left.Size = half
        self.Right.Size = half
    end
end

local Category = {}
Category.__index = Category

function Tab:_buildCategoryPanel()
    local window = self.Window
    local metrics = window.Metrics
    local panel = window:Glass(self.Left, "Panel", {
        Name = "Categories",
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = 500,
    })
    addPadding(panel, metrics.PanelPad - 2)
    addList(panel, metrics.Gap)
    local strip = window:Make("ScrollingFrame", {
        Name = "Strip",
        Size = UDim2.new(1, 0, 0, metrics.CategoryHeight),
        CanvasSize = UDim2.new(),
        AutomaticCanvasSize = Enum.AutomaticSize.X,
        ScrollingDirection = Enum.ScrollingDirection.X,
        ScrollBarThickness = 0,
        LayoutOrder = 1,
    }, panel)
    addList(strip, 6, Enum.FillDirection.Horizontal)
    window:Make("Frame", {
        Name = "StripLine",
        Size = UDim2.new(1, 0, 0, 1),
        LayoutOrder = 2,
    }, panel, { BackgroundColor3 = "Outline", BackgroundTransparency = "TransStroke" })
    local content = new("Frame", {
        Name = "CategoryContent",
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = 3,
    }, panel)
    addList(content, metrics.Gap)
    self.CategoryPanel = panel
    self.CategoryStrip = strip
    self.CategoryContent = content
    self.Categories = {}
    self.Left.Visible = true
    self:_updateLayout()
end

function Tab:AddCategory(options)
    if type(options) == "string" then
        options = { Title = options }
    end
    options = options or {}
    if not self.CategoryPanel then
        self:_buildCategoryPanel()
    end
    local window = self.Window
    local metrics = window.Metrics
    local category = setmetatable({
        Window = window,
        Tab = self,
        Title = options.Title or options.Name or "Category",
        Selected = false,
    }, Category)
    local pill = window:Make("Frame", {
        Name = "Pill",
        Size = UDim2.fromOffset(0, metrics.CategoryHeight),
        AutomaticSize = Enum.AutomaticSize.X,
        LayoutOrder = #self.Categories + 1,
        ClipsDescendants = true,
    }, self.CategoryStrip, { BackgroundColor3 = "SurfaceAlt", BackgroundTransparency = "TransField" })
    window:Corner(pill, "RadControl")
    window:Stroke(pill)
    category.Pill = pill
    category.Fill = window:Make("Frame", {
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BackgroundTransparency = 1,
    }, pill)
    window:Corner(category.Fill, "RadControl")
    window:Gradient(category.Fill, "Accent", "AccentAlt", 0)
    category.Label = window:Make("TextLabel", {
        Size = UDim2.fromOffset(0, metrics.CategoryHeight),
        AutomaticSize = Enum.AutomaticSize.X,
        Text = window:Display(category.Title),
        Font = "Semi",
        TextSize = metrics.Text - 1,
        Muted = true,
        ZIndex = 2,
    }, pill)
    addPadding(category.Label, 0, 11, 0, 11)
    window:_onStyle(category, function()
        category.Label.Text = window:Display(category.Title)
    end)
    local hit = new("TextButton", { Name = "Hit", Size = UDim2.fromScale(1, 1), ZIndex = 3 }, pill)
    window:Connect(hit.Activated, function()
        self:SelectCategory(category)
    end)
    window:Connect(hit.MouseEnter, function()
        if not category.Selected then
            window:Motion("Hover", pill, { BackgroundColor3 = window.Tokens.Hover })
        end
    end)
    window:Connect(hit.MouseLeave, function()
        window:Motion("Hover", pill, { BackgroundColor3 = window.Tokens.SurfaceAlt })
    end)
    table.insert(self.Categories, category)
    pill.Visible = false
    if #self.Categories == 1 then
        self:SelectCategory(category)
    end
    return category
end

function Tab:_refreshCategories()
    local categories = self.Categories
    if not categories then
        return
    end
    local query = self.Window.SearchQuery
    local firstVisible, selectedVisible
    for _, category in ipairs(categories) do
        local count, matches = 0, 0
        for _, section in ipairs(self.Sections.Left) do
            if section.Category == category then
                count = count + 1
                if section._searchVisible ~= false then
                    matches = matches + 1
                end
            end
        end
        local show = not category.Hidden and count > 0 and (query == "" or matches > 0)
        category.Pill.Visible = show
        if show then
            firstVisible = firstVisible or category
            if category.Selected then
                selectedVisible = true
            end
        end
    end
    if query == "" and not selectedVisible and firstVisible then
        self:SelectCategory(firstVisible)
    end
end

function Category:SetBadge(value, tone)
    local window = self.Window
    if not self.BadgeLabel then
        local label = window:Make("TextLabel", {
            Name = "Badge",
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, -4, 0.5, 0),
            Size = UDim2.fromOffset(16, 14),
            AutomaticSize = Enum.AutomaticSize.X,
            Font = "Bold",
            TextSize = window.Metrics.Small - 1,
            BackgroundColor3 = Color3.new(0.9, 0.2, 0.2),
            BackgroundTransparency = 0,
            Visible = false,
            ZIndex = 5,
        }, self.Pill)
        window:Corner(label, "RadPill")
        addPadding(label, 0, 4, 0, 4)
        self.BadgeLabel = label
    end
    if value == nil or value == false or value == 0 or value == "" then
        self.BadgeLabel.Visible = false
        return
    end
    self.BadgeLabel.Text = type(value) == "number" and (value > 99 and "99+" or tostring(value)) or tostring(value)
    local badgeTone = TONES[tone or "Danger"] or "Danger"
    window:Bind(self.BadgeLabel, "BackgroundColor3", badgeTone)
    window:Bind(self.BadgeLabel, "TextColor3", "On" .. badgeTone)
    self.BadgeLabel.Visible = true
end

function Category:AddSection(options)
    if type(options) == "string" then
        options = { Title = options }
    end
    options = options or {}
    options.Category = self
    options.Side = "Left"
    return self.Tab:AddSection(options)
end

function Category:Select()
    self.Tab:SelectCategory(self)
end

function Tab:SelectCategory(category)
    local window = self.Window
    for _, other in ipairs(self.Categories) do
        local selected = other == category
        other.Selected = selected
        window:Motion("Tab", other.Fill, { BackgroundTransparency = selected and 0 or 1 })
        local before = other.Label.TextColor3
        window:Bind(other.Label, "TextColor3", selected and "OnAccent" or "Muted")
        local after = other.Label.TextColor3
        if before ~= after then
            other.Label.TextColor3 = before
            window:Motion("Tab", other.Label, { TextColor3 = after })
        end
    end
    for _, section in ipairs(self.Sections.Left) do
        if section.Category then
            section:_applyVisibility()
        end
    end
end

function Tab:AddSection(options)
    if type(options) == "string" then
        options = { Title = options }
    end
    options = options or {}
    local window = self.Window
    local metrics = window.Metrics
    local category = options.Category
    local bare = options.Bare == true
    local side = options.Side
    if side ~= "Left" and side ~= "Right" then
        side = (#self.Sections.Left <= #self.Sections.Right) and "Left" or "Right"
    end
    if category then
        side = "Left"
    end
    local column = side == "Left" and self.Left or self.Right
    if category then
        column = self.CategoryContent
    end
    local section = setmetatable({
        Window = window,
        Tab = self,
        Side = side,
        Category = category,
        Title = options.Title or options.Name,
        Collapsed = false,
        Columns = options.Columns or 1,
        _order = 0,
        _items = {},
        _grids = {},
        _searchVisible = true,
    }, Section)
    local frameProperties = {
        Name = "Section",
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = category and (#self.Sections.Left + 1) or (#self.Sections[side] + 1),
    }
    if bare or category then
        section.Frame = window:Make("Frame", frameProperties, column)
    else
        section.Frame = window:Glass(column, "Panel", frameProperties)
        addPadding(section.Frame, metrics.PanelPad)
    end
    addList(section.Frame, metrics.Gap)
    local title = section.Title
    if title and title ~= "" and not bare then
        local collapsible = options.Collapsible ~= false
        local header = window:Make(collapsible and "TextButton" or "Frame", {
            Name = "Header",
            Size = UDim2.new(1, 0, 0, metrics.Text + 10 + (metrics.Touch and 2 or 0)),
            LayoutOrder = 1,
        }, section.Frame)
        local textX = 0
        if options.Icon then
            local headerIcon = new("ImageLabel", {
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.new(0, 0, 0.5, 0),
                Size = UDim2.fromOffset(metrics.IconSize, metrics.IconSize),
            }, header)
            window:ApplyIcon(headerIcon, options.Icon, "Text")
            textX = metrics.IconSize + 8
        end
        section.HeaderLabel = window:Make("TextLabel", {
            Position = UDim2.fromOffset(textX, 0),
            Size = UDim2.new(1, -(textX + 20), 1, 0),
            Text = window:Display(title),
            Font = "Semi",
            TextSize = metrics.Text + 1,
            TextXAlignment = Enum.TextXAlignment.Left,
        }, header)
        window:_onStyle(section, function()
            section.HeaderLabel.Text = window:Display(title)
        end)
        if collapsible then
            section.Chevron = window:_chevron(header, 2)
            window:Connect(header.Activated, function()
                section:SetCollapsed(not section.Collapsed)
            end)
        end
        if not category then
            window:_line(section.Frame, {
                Name = "Separator",
                Size = UDim2.new(1, 0, 0, 1),
                LayoutOrder = 2,
            })
        end
    end
    section.Content = new("Frame", {
        Name = "Content",
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = 3,
    }, section.Frame)
    section.ContentList = addList(section.Content, metrics.Gap)
    window:Connect(section.Frame:GetPropertyChangedSignal("AbsoluteSize"), function()
        section:_applyColumns()
    end)
    column.Visible = true
    table.insert(self.Sections[side], section)
    self:_updateLayout()
    if options.Collapsed == true and title and not bare then
        section:SetCollapsed(true)
    end
    section:_applyVisibility()
    if category then
        self:_refreshCategories()
    end
    return section
end

function Window:_chevron(parent, rightOffset)
    local holder = new("Frame", {
        Size = UDim2.fromOffset(10, 6),
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -(rightOffset or 8), 0.5, 0),
    }, parent)
    self:Make("Frame", { Size = UDim2.fromOffset(7, 2), Position = UDim2.fromOffset(0, 2), Rotation = 40 }, holder, { BackgroundColor3 = "Muted" })
    self:Make("Frame", { Size = UDim2.fromOffset(7, 2), Position = UDim2.fromOffset(4, 2), Rotation = -40 }, holder, { BackgroundColor3 = "Muted" })
    return holder
end

function Section:_nextOrder(keepGrid)
    self._order = self._order + 1
    if not keepGrid then
        self._grid = nil
    end
    return self._order
end

function Section:_rowParent(gridItem)
    if not gridItem or self.Columns <= 1 then
        return self.Content
    end
    if not self._grid then
        local metrics = self.Window.Metrics
        local holder = new("Frame", {
            Name = "Grid",
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            LayoutOrder = self:_nextOrder(true),
        }, self.Content)
        local record = {
            Frame = holder,
            List = addList(holder, metrics.Gap),
            Grid = new("UIGridLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                CellPadding = UDim2.fromOffset(metrics.Gap, metrics.Gap),
                CellSize = UDim2.new(0.5, -metrics.Gap / 2, 0, metrics.RowTall),
            }),
        }
        table.insert(self._grids, record)
        self._grid = record
        self:_styleGrid(record, self._appliedColumns or 1)
    end
    return self._grid.Frame
end

function Section:_styleGrid(record, columns)
    local metrics = self.Window.Metrics
    if columns > 1 then
        local gap = metrics.Gap
        record.Grid.CellSize = UDim2.new(1 / columns, -math.ceil(gap * (columns - 1) / columns), 0, metrics.RowTall)
        record.List.Parent = nil
        record.Grid.Parent = record.Frame
    else
        record.Grid.Parent = nil
        record.List.Parent = record.Frame
    end
end

function Section:_applyColumns()
    local window = self.Window
    local metrics = window.Metrics
    local width = self.Frame.AbsoluteSize.X / window.Scale.Scale
    local minimum = metrics.Touch and 200 or 160
    local columns = 1
    if self.Columns > 1 and width - metrics.PanelPad * 2 >= minimum * self.Columns + metrics.Gap * (self.Columns - 1) then
        columns = self.Columns
    end
    if columns == self._appliedColumns then
        return
    end
    self._appliedColumns = columns
    for _, record in ipairs(self._grids) do
        self:_styleGrid(record, columns)
    end
end

function Section:_track(frame, getText)
    local item = { Frame = frame, GetText = getText, Hidden = false, Filtered = false, Section = self }
    function item:Refresh()
        local section = self.Section
        local collapsed = section.Collapsed and not section._holdOpen and section.Window.SearchQuery == ""
        self.Frame.Visible = not self.Hidden and not self.Filtered and not collapsed
    end
    table.insert(self._items, item)
    item:Refresh()
    return item
end

function Section:_untrack(item)
    local index = table.find(self._items, item)
    if index then
        table.remove(self._items, index)
    end
end

function Section:SetCollapsed(collapsed, instant)
    collapsed = collapsed == true
    if collapsed == self.Collapsed then
        return
    end
    local window = self.Window
    local content = self.Content
    self._collapseSerial = (self._collapseSerial or 0) + 1
    local serial = self._collapseSerial
    self.Collapsed = collapsed
    if self.Chevron then
        window:Motion("Toggle", self.Chevron, { Rotation = collapsed and -90 or 0 })
    end
    local scale = window.Scale.Scale
    local measured = content.AbsoluteSize.Y / scale
    local known = self._fullHeight or 0
    local animate = not instant
        and window.Visible
        and not window.MotionState.Reduce
        and window.SearchQuery == ""
        and self.Frame.Visible
        and (collapsed and measured > 4 or (not collapsed and known > 4))
    local function settle()
        if self._collapseSerial ~= serial or window.Destroyed then
            return
        end
        self._holdOpen = false
        self._animating = false
        content.AutomaticSize = Enum.AutomaticSize.Y
        content.Size = UDim2.new(1, 0, 0, 0)
        content.ClipsDescendants = false
        for _, item in ipairs(self._items) do
            item:Refresh()
        end
    end
    if not animate then
        self._holdOpen = false
        self._animating = false
        window:Tween(content, { Size = UDim2.new(1, 0, 0, 0) }, 0)
        content.AutomaticSize = Enum.AutomaticSize.Y
        content.Size = UDim2.new(1, 0, 0, 0)
        content.ClipsDescendants = false
        for _, item in ipairs(self._items) do
            item:Refresh()
        end
        return
    end
    if not self._animating then
        self._fullHeight = collapsed and measured or known
    end
    self._animating = true
    content.ClipsDescendants = true
    content.AutomaticSize = Enum.AutomaticSize.None
    content.Size = UDim2.new(1, 0, 0, measured)
    if collapsed then
        self._holdOpen = true
        window:Motion("Collapse", content, { Size = UDim2.new(1, 0, 0, 0) })
    else
        self._holdOpen = false
        for _, item in ipairs(self._items) do
            item:Refresh()
        end
        window:Motion("Collapse", content, { Size = UDim2.new(1, 0, 0, self._fullHeight) })
    end
    task.delay(MOTION.Collapse[1] / window.MotionState.Speed + 0.04, settle)
end

function Section:_applyVisibility()
    local visible = self._searchVisible ~= false and not self.Hidden
    if self.Category and not self.Category.Selected and self.Window.SearchQuery == "" then
        visible = false
    end
    self.Frame.Visible = visible
end

function Section:ApplySearch(query)
    local titleMatch = query ~= "" and self.Title ~= nil and string.find(string.lower(self.Title), query, 1, true) ~= nil
    local shown = 0
    for _, item in ipairs(self._items) do
        local match = query == "" or titleMatch
        if not match and item.GetText then
            local text = item.GetText()
            match = text ~= nil and string.find(string.lower(text), query, 1, true) ~= nil
        end
        item.Filtered = not match
        item:Refresh()
        if match and not item.Hidden then
            shown = shown + 1
        end
    end
    self._searchVisible = query == "" or shown > 0
    self:_applyVisibility()
end

function Tab:ApplySearch(query)
    for _, side in ipairs({ "Left", "Right" }) do
        for _, section in ipairs(self.Sections[side]) do
            section:ApplySearch(query)
        end
    end
    self:_refreshCategories()
    self:_updateEmpty(query)
end

function Tab:_updateEmpty(query)
    local window = self.Window
    local any = false
    for _, side in ipairs({ "Left", "Right" }) do
        for _, section in ipairs(self.Sections[side]) do
            if section._searchVisible ~= false then
                any = true
            end
        end
    end
    local show = query ~= "" and not any and self.Selected == true
    if show and not self.Empty then
        self.Empty = window:_emptyState(self.Canvas, {
            Name = "SearchEmpty",
            Title = "No results",
            Button = "Search all tabs",
            Callback = function()
                window:OpenPalette(window.SearchQuery)
            end,
            Glyph = "?",
        })
        self.Empty.Frame.Size = UDim2.fromScale(1, 1)
        self.Empty.Frame.ZIndex = 5
    end
    if self.Empty then
        self.Empty.Frame.Visible = show
        if show then
            self.Empty:Set("No results", 'Nothing on this tab matches "' .. query .. '"')
        end
    end
end

function Window:_syncTabDivider()
    local divider = self.TabDivider
    if not divider then
        return
    end
    local user, builtin = false, false
    for _, tab in ipairs(self.AllTabs) do
        if not tab.Hidden then
            if tab.Builtin then
                builtin = true
            else
                user = true
            end
        end
    end
    divider.Visible = user and builtin
end

function Tab:SetHidden(hidden)
    hidden = hidden == true
    if self.Hidden == hidden then
        return
    end
    local window = self.Window
    self.Hidden = hidden
    self.Holder.Visible = not hidden
    window:_syncTabDivider()
    if hidden and window.SelectedTab == self then
        local fallback = window.Tabs[1]
        if not fallback or fallback.Hidden then
            for _, other in ipairs(window.AllTabs) do
                if other ~= self and not other.Hidden then
                    fallback = other
                    break
                end
            end
        end
        if fallback and fallback ~= self then
            window:SelectTab(fallback)
        end
    end
    window:_emit("TabVisibilityChanged", self, not hidden)
end

function Tab:IsHidden()
    return self.Hidden == true
end

function Tab:SetBadge(value, tone)
    local window = self.Window
    if value == nil or value == false or value == 0 or value == "" then
        self.BadgeValue = nil
        if self.Badge then
            self.Badge.Visible = false
        end
        window:_emit("BadgeChanged", self, nil)
        return
    end
    if not self.Badge then
        local badge = window:Make("TextLabel", {
            Name = "Badge",
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.new(1, -2, 0, 2),
            Size = UDim2.fromOffset(16, 14),
            AutomaticSize = Enum.AutomaticSize.X,
            Font = "Bold",
            TextSize = window.Metrics.Small - 1,
            BackgroundTransparency = 0,
            ZIndex = 8,
            Visible = false,
        }, self.Holder, { BackgroundColor3 = "Danger" })
        window:Corner(badge, "RadPill")
        addPadding(badge, 0, 4, 0, 4)
        self.BadgeScale = new("UIScale", {}, badge)
        self.Badge = badge
    end
    self.BadgeValue = value
    self.Badge.Text = type(value) == "number" and (value > 99 and "99+" or tostring(value)) or tostring(value)
    local badgeTone = TONES[tone or "Danger"] or "Danger"
    window:Bind(self.Badge, "BackgroundColor3", badgeTone)
    window:Bind(self.Badge, "TextColor3", "On" .. badgeTone)
    if not self.Badge.Visible then
        self.Badge.Visible = true
        window:Tween(self.BadgeScale, { Scale = 0.6 }, 0)
        window:Motion("Spring", self.BadgeScale, { Scale = 1 })
    end
    window:_emit("BadgeChanged", self, value)
end

function Tab:GetBadge()
    return self.BadgeValue
end

function Window:SetBadge(name, value, tone)
    local tab = self:GetTab(name)
    if not tab then
        return false
    end
    tab:SetBadge(value, tone)
    return true
end

function Window:_addHistory(options)
    local history = self._notifHistory
    table.insert(history, 1, {
        Title = options.Title or "",
        Content = options.Content or "",
        Type = options.Type,
        Time = os.date("%H:%M"),
    })
    if #history > 30 then
        table.remove(history)
    end
    self._unread = self._unread + 1
    if self._bellDot then
        self._bellDot.Visible = true
    end
    self:_syncMenuDot()
end

function Window:_buildNotifications()
    local metrics = self.Metrics
    local panel = self:_makePopup("Notifications")
    local header = new("Frame", { Size = UDim2.new(1, 0, 0, 34) }, panel)
    self:Make("TextLabel", {
        Position = UDim2.fromOffset(12, 0),
        Size = UDim2.new(1, -80, 1, 0),
        Text = "Notifications",
        Font = "Semi",
        TextSize = metrics.Text,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, header)
    local clear = self:Make("TextButton", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -10, 0.5, 0),
        Size = UDim2.fromOffset(54, 22),
        Text = "Clear",
        Font = "Semi",
        TextSize = metrics.Small,
        Color = "Accent",
    }, header)
    self:Make("Frame", {
        Position = UDim2.fromOffset(0, 34),
        Size = UDim2.new(1, 0, 0, 1),
    }, panel, { BackgroundColor3 = "Outline", BackgroundTransparency = "TransStroke" })
    local list = self:Make("ScrollingFrame", {
        Position = UDim2.fromOffset(0, 36),
        Size = UDim2.new(1, 0, 1, -36),
        CanvasSize = UDim2.new(),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        ScrollBarThickness = metrics.ScrollBar,
    }, panel, { ScrollBarImageColor3 = "Accent" })
    addPadding(list, 8)
    addList(list, 6)
    self._notifPanel = panel
    self._notifList = list
    self:Connect(clear.Activated, function()
        self._notifHistory = {}
        self:_rebuildNotifications()
    end)
end

function Window:_rebuildNotifications()
    if not self._notifPanel then
        self:_buildNotifications()
    end
    local metrics = self.Metrics
    for _, child in ipairs(self._notifList:GetChildren()) do
        if child:IsA("GuiObject") then
            child:Destroy()
        end
    end
    if #self._notifHistory == 0 then
        self:Make("TextLabel", {
            Size = UDim2.new(1, 0, 0, 40),
            Text = "No notifications yet",
            TextSize = metrics.Small + 1,
            Muted = true,
        }, self._notifList)
        return
    end
    for index, entry in ipairs(self._notifHistory) do
        local typeToken = ({ Success = "Success", Warning = "Warning", Error = "Danger" })[entry.Type] or "Accent"
        local item = self:Glass(self._notifList, "Field", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            LayoutOrder = index,
        })
        local bar = self:Make("Frame", { Size = UDim2.new(0, 3, 1, -12), Position = UDim2.fromOffset(6, 6) }, item, { BackgroundColor3 = typeToken })
        new("UICorner", { CornerRadius = self.Tokens.RadPill }, bar)
        local body = new("Frame", { Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y }, item)
        addPadding(body, 7, 10, 8, 16)
        addList(body, 1)
        self:Make("TextLabel", {
            Size = UDim2.new(1, 0, 0, 16),
            Text = (entry.Title ~= "" and entry.Title or "Notice") .. "  " .. entry.Time,
            Font = "Semi",
            TextSize = metrics.Small + 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
            LayoutOrder = 1,
        }, body)
        if entry.Content ~= "" then
            self:Make("TextLabel", {
                Size = UDim2.new(1, 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                Text = entry.Content,
                TextSize = metrics.Small,
                TextWrapped = true,
                Muted = true,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
                LayoutOrder = 2,
            }, body)
        end
    end
end

function Window:ToggleNotifications()
    if self._notifPanel and self._popup == self._notifPanel then
        self:_closePopup()
        return
    end
    self:_rebuildNotifications()
    self._unread = 0
    if self._bellDot then
        self._bellDot.Visible = false
    end
    self:_syncMenuDot()
    self:_showPopup(self._notifPanel, self.BellButton, Vector2.new(self.Metrics.Touch and 230 or 240, 260), self:_useSheet())
end

function Window:SetSearch(text)
    self.SearchQuery = string.lower(tostring(text or ""))
    for _, tab in ipairs(self.AllTabs) do
        tab:ApplySearch(self.SearchQuery)
    end
end

local function attachControl(row, instance, order)
    if order then
        instance.LayoutOrder = order
    else
        instance.LayoutOrder = row.AttachOrder
        row.AttachOrder = row.AttachOrder - 1
    end
    instance.Parent = row.Attach
end

local function setRowLoading(row, loading)
    local window = row.Window
    loading = loading == true
    if not row.Busy then
        row.Busy = window:Make("TextButton", {
            Name = "Busy",
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.new(0, 0, 0),
            BackgroundTransparency = 0.6,
            Visible = false,
            ZIndex = 21,
            Font = "Semi",
            TextSize = window.Metrics.Text + 4,
            Color = "Accent",
        }, row.Frame)
        window:Corner(row.Busy, "RadCover")
    end
    if row.BusyEntry then
        row.BusyEntry.Dead = true
        row.BusyEntry = nil
    end
    row.Loading = loading
    row.Busy.Visible = loading
    if loading then
        local frame = 0
        row.Busy.Text = "."
        row.BusyEntry = window:_animate({
            Interval = 0.22,
            Update = function()
                frame = frame % 3 + 1
                row.Busy.Text = string.rep(".", frame)
            end,
        })
    end
end

local function setRowDisabled(row, disabled)
    if not row.Cover then
        row.Cover = row.Window:Make("TextButton", {
            Name = "Cover",
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.new(0, 0, 0),
            BackgroundTransparency = 0.5,
            ZIndex = 20,
            Visible = false,
        }, row.Frame)
        row.Window:Corner(row.Cover, "RadCover")
    end
    row.Cover.Visible = disabled == true
end

function Window:_ripple(frame, input, layer)
    if not self.Effects.Ripple then
        return
    end
    local scale = self.Scale.Scale
    local width = frame.AbsoluteSize.X / scale
    local height = frame.AbsoluteSize.Y / scale
    local x = math.clamp((input.Position.X - frame.AbsolutePosition.X) / scale, 0, width)
    local y = math.clamp((input.Position.Y - frame.AbsolutePosition.Y) / scale, 0, height)
    local sharp = self.Style.Gamer == true
    local reach = math.sqrt(math.max(x, width - x) ^ 2 + math.max(y, height - y) ^ 2)
    local ring = new("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromOffset(x, sharp and height / 2 or y),
        Size = UDim2.fromOffset(0, sharp and height or 0),
        BackgroundColor3 = self.Tokens.RimColor,
        BackgroundTransparency = 0.84,
        Active = false,
        ZIndex = layer or 2,
    }, frame)
    local target
    if sharp then
        target = UDim2.fromOffset(math.max(x, width - x) * 2 + 4, height)
    else
        new("UICorner", { CornerRadius = UDim.new(0.5, 0) }, ring)
        target = UDim2.fromOffset(reach * 2, reach * 2)
    end
    self:Tween(ring, { Size = target, BackgroundTransparency = 1 }, sharp and 0.36 or 0.5, Enum.EasingStyle.Quint)
    task.delay(0.55, function()
        ring:Destroy()
    end)
end

function Window:_wireRow(row)
    local frame = row.Frame
    local hovered = false
    local pressed = false
    local function apply()
        local tokens = self.Tokens
        local transparency = tokens.TransCard
        if pressed then
            transparency = math.min(transparency, 0.4)
        elseif hovered then
            transparency = math.min(transparency, 0.55)
        end
        self:Motion(pressed and "Press" or "Hover", frame, {
            BackgroundColor3 = (hovered or pressed) and tokens.Hover or tokens.Surface,
            BackgroundTransparency = transparency,
        })
        local strokeColor = tokens.Outline
        local strokeTransparency = tokens.TransStroke
        if row.Active then
            strokeColor = tokens.Accent
            strokeTransparency = 0.4
        end
        if hovered and self.Style.Glow then
            strokeColor = tokens.Accent
            strokeTransparency = 0.15
        end
        self:Motion("Hover", row.Stroke, { Color = strokeColor, Transparency = strokeTransparency })
        if row.Bar then
            self:Motion("Hover", row.Bar, { BackgroundTransparency = row.Active and 0 or (hovered and 0.2 or 0.55) })
        end
    end
    row.Refresh = apply
    self:Connect(row.Click.MouseEnter, function()
        hovered = true
        apply()
    end)
    self:Connect(row.Click.MouseLeave, function()
        hovered = false
        pressed = false
        apply()
    end)
    local function interactive()
        return row.Clickable == true or row.OnTap ~= nil
    end
    self:Connect(row.Click.MouseButton1Down, function()
        if interactive() then
            pressed = true
            apply()
        end
    end)
    self:Connect(row.Click.MouseButton1Up, function()
        if pressed then
            pressed = false
            apply()
        end
    end)
    local function pinFromRow()
        local feature = row.Element and row.Element._feature
        if not feature then
            return
        end
        local pinned = self:TogglePin(feature)
        self:Notify({
            Title = pinned and "Pinned" or "Unpinned",
            Content = feature.Text,
            Type = "Success",
            Duration = 1.6,
            Log = false,
        })
    end
    self:Connect(row.Click.InputBegan, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton3 then
            pinFromRow()
            return
        end
        if not interactive() then
            return
        end
        if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
            return
        end
        self:_ripple(frame, input)
        if input.UserInputType == Enum.UserInputType.Touch and not row.Plain and row.Element and row.Element._feature
            and not (row.Element.BindId and UserInputService.KeyboardEnabled) then
            local started = input.Position
            row._hold = (row._hold or 0) + 1
            local hold = row._hold
            task.delay(0.65, function()
                if row._hold ~= hold or self.Destroyed then
                    return
                end
                local state = input.UserInputState
                if state == Enum.UserInputState.End or state == Enum.UserInputState.Cancel then
                    return
                end
                local dx, dy = input.Position.X - started.X, input.Position.Y - started.Y
                if dx * dx + dy * dy > 144 then
                    return
                end
                row._suppress = true
                pinFromRow()
                task.delay(0.5, function()
                    row._suppress = false
                end)
            end)
        end
        if row.Element and row.Element.BindId and UserInputService.KeyboardEnabled then
            row._press = (row._press or 0) + 1
            local token = row._press
            task.delay(0.6, function()
                if row._press == token and not self.Destroyed then
                    row._suppress = true
                    self:_listen(row.Element)
                    task.delay(0.5, function()
                        row._suppress = false
                    end)
                end
            end)
        end
    end)
    self:Connect(row.Click.InputEnded, function()
        row._press = (row._press or 0) + 1
        row._hold = (row._hold or 0) + 1
    end)
    self:Connect(row.Click.Activated, function()
        if row.OnTap and not row._suppress then
            row.OnTap()
        end
    end)
end

local function createRow(section, options, mode, gridItem)
    local window = section.Window
    local metrics = window.Metrics
    local plain = mode == "Plain"
    local row = { Window = window, Section = section, Options = options, AttachOrder = 100, Plain = plain, TextX = 12 }
    local rowOrder = section:_nextOrder(gridItem == true)
    local frame = window:Make("Frame", {
        Name = "Row",
        Size = UDim2.new(1, 0, 0, plain and metrics.SliderHeight or metrics.Row),
        LayoutOrder = rowOrder,
        ClipsDescendants = true,
    }, section:_rowParent(gridItem == true), { BackgroundColor3 = "Surface", BackgroundTransparency = "TransCard" })
    window:Corner(frame, "RadCard")
    row.Stroke = window:Stroke(frame)
    window:GlassEdge(row.Stroke)
    window:Rim(frame)
    window:Make("Frame", {
        Name = "Line",
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.new(0, 10, 1, 0),
        Size = UDim2.new(1, -20, 0, 1),
    }, frame, { BackgroundColor3 = "Outline", BackgroundTransparency = "TransLine" })
    row.Frame = frame
    row.Item = section:_track(frame, function()
        return (row.Title and row.Title.Text or "") .. " " .. (options.Description or "")
    end)
    row.Click = new("TextButton", { Name = "Click", Size = UDim2.fromScale(1, 1) }, frame)
    row.Bar = window:Make("Frame", {
        Name = "Bar",
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.new(0, 3, 0.62, 0),
        BackgroundTransparency = 0.55,
        Visible = window.Style.Gamer == true,
        ZIndex = 3,
    }, frame, { BackgroundColor3 = "Accent" })
    if plain then
        window:_onStyle(row, function()
            row.Bar.Visible = window.Style.Gamer == true
        end)
        return row
    end
    local hasIcon = options.Icon ~= nil
    row.Bubble = window:Make("Frame", {
        Name = "Bubble",
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 10, 0.5, 0),
        Size = UDim2.fromOffset(metrics.Bubble, metrics.Bubble),
    }, frame, { BackgroundColor3 = "SurfaceAlt", BackgroundTransparency = "TransField" })
    window:Corner(row.Bubble, "RadIcon")
    window:Stroke(row.Bubble)
    row.Icon = new("ImageLabel", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(metrics.IconSize, metrics.IconSize),
    }, row.Bubble)
    if hasIcon then
        window:ApplyIcon(row.Icon, options.Icon, "Accent")
    end
    row.Attach = new("Frame", {
        Name = "Attach",
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -12, 0.5, 0),
        Size = UDim2.new(0, 0, 1, 0),
        AutomaticSize = Enum.AutomaticSize.X,
    }, frame)
    local attachLayout = addList(row.Attach, 6, Enum.FillDirection.Horizontal)
    attachLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    attachLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    row.Block = new("Frame", {
        Name = "Text",
        AnchorPoint = Vector2.new(0, 0.5),
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
    }, frame)
    local blockLayout = addList(row.Block, 1)
    blockLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    row.Title = window:Make("TextLabel", {
        Name = "Title",
        Size = UDim2.new(1, 0, 0, metrics.Text + 4),
        Text = options.Text or options.Title or "",
        Font = "Semi",
        TextSize = metrics.Text,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        LayoutOrder = 1,
    }, row.Block)
    local function makeDescription(text)
        return window:Make("TextLabel", {
            Name = "Description",
            Size = UDim2.new(1, 0, 0, metrics.Small + 4),
            Text = text,
            Font = "Regular",
            TextSize = metrics.Small,
            Muted = true,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
            LayoutOrder = 2,
        }, row.Block)
    end
    if options.Description then
        row.Desc = makeDescription(options.Description)
    end
    function row:SetNote(text, tone)
        if text == nil or text == "" then
            self.Note = nil
            if self.Desc then
                self.Desc.Text = options.Description or ""
                self.Desc.Visible = options.Description ~= nil
                window:Bind(self.Desc, "TextColor3", "Muted")
            end
        else
            self.Note = text
            if not self.Desc then
                self.Desc = makeDescription(text)
            end
            self.Desc.Visible = true
            self.Desc.Text = text
            window:Bind(self.Desc, "TextColor3", TEXT_TONES[tone or "Muted"] or "Muted")
        end
        self:Relayout()
    end
    function row:UpdateBlock()
        local attachWidth = self.Attach.AbsoluteSize.X / window.Scale.Scale
        self.Block.Position = UDim2.new(0, self.TextX, 0.5, 0)
        self.Block.Size = UDim2.new(1, -(self.TextX + attachWidth + 16), 0, 0)
    end
    function row:Relayout()
        local style = window.Style
        self.Bar.Visible = style.Gamer == true
        local showBubble = hasIcon and style.ShowIcons
        self.Bubble.Visible = showBubble
        local tall = options.Description ~= nil or showBubble or self.Note ~= nil
        self.Frame.Size = UDim2.new(1, 0, 0, tall and metrics.RowTall or metrics.Row)
        self.TextX = 12 + (showBubble and (metrics.Bubble + 10) or 0)
        self:UpdateBlock()
    end
    window:Connect(row.Attach:GetPropertyChangedSignal("AbsoluteSize"), function()
        row:UpdateBlock()
    end)
    window:_onStyle(row, function()
        row:Relayout()
    end)
    row:Relayout()
    window:_wireRow(row)
    return row
end

local function extendElement(element, row)
    element.Row = row
    row.Element = element
    element._listeners = element._listeners or {}
    function element:OnChanged(listener)
        table.insert(self._listeners, listener)
        return self
    end
    function element:SetVisible(visible)
        row.Item.Hidden = not visible
        row.Item:Refresh()
    end
    function element:SetDisabled(disabled)
        self.Disabled = disabled == true
        setRowDisabled(row, disabled)
    end
    function element:SetLoading(loading)
        self.Loading = loading == true
        setRowLoading(row, loading)
    end
    function element:IsBusy()
        return self.Loading == true or self.Disabled == true
    end
    function element:SetText(text)
        if row.Title then
            row.Title.Text = text
        end
    end
    function element:SetDescription(text)
        if row.Desc then
            row.Desc.Text = text
        end
    end
    function element:Destroy()
        local window = self.Window
        if self._onDestroy then
            pcall(self._onDestroy)
        end
        if row.BusyEntry then
            row.BusyEntry.Dead = true
        end
        if self.Flag then
            window.Flags[self.Flag] = nil
        end
        window:_unregisterCommand(self)
        window:_offStyle(row)
        window:_offStyle(self)
        if self.BindId then
            local index = table.find(window._quickbinds, self)
            if index then
                table.remove(window._quickbinds, index)
            end
        end
        row.Section:_untrack(row.Item)
        row.Frame:Destroy()
    end
    function element:AddKeybind(options)
        assert(row.Attach, "This element does not support attachments")
        return row.Window:_createKeybind(row, options or {})
    end
    function element:AddColorPicker(options)
        assert(row.Attach, "This element does not support attachments")
        return row.Window:_createColor(row, options or {})
    end
    return element
end

function Window:_makeBindable(row, element, id)
    local metrics = self.Metrics
    element.BindId = id
    element.BindKey = nil
    local chip = self:Make("TextButton", {
        Name = "BindChip",
        Size = UDim2.fromOffset(0, metrics.ControlHeight - 4),
        AutomaticSize = Enum.AutomaticSize.X,
        Visible = false,
        TextSize = metrics.Small,
        Font = "Semi",
        Muted = true,
    }, nil, { BackgroundColor3 = "SurfaceAlt", BackgroundTransparency = "TransField" })
    self:Corner(chip, "RadControl")
    addPadding(chip, 0, 7, 0, 7)
    attachControl(row, chip, 90)
    local function render()
        local listening = self._listening == element
        chip.Visible = listening or element.BindKey ~= nil
        chip.Text = listening and "press a key..." or ("[" .. keyToText(element.BindKey) .. "]")
    end
    element._render = render
    function element:SetKey(key, silent)
        if key ~= nil and typeof(key) ~= "EnumItem" then
            key = nil
        end
        self.BindKey = key
        render()
        self.Window:_emit("BindsChanged")
        if not silent then
            self.Window:_queueAutoSave()
            if key then
                self.Window:TerminalPrint("bound " .. (self.CommandName and ("/" .. self.CommandName) or id) .. " to [" .. keyToText(key) .. "]", "Accent")
            end
        end
    end
    self:Connect(chip.Activated, function()
        self:_listen(element)
    end)
    self:Connect(row.Click.MouseButton2Click, function()
        self:_listen(element)
    end)
    table.insert(self._quickbinds, element)
    local pending = self._pendingBinds[id]
    if pending ~= nil then
        self._pendingBinds[id] = nil
        task.defer(function()
            element:SetKey(deserializeKey(pending), true)
        end)
    end
end

function Window:_listen(element)
    local previous = self._listening
    if previous == element then
        self._listening = nil
        element._render()
        self:_emit("BindsChanged")
        return
    end
    self._listening = element
    if previous and previous._render then
        previous._render()
    end
    element._render()
    self:_emit("BindsChanged")
end

function Section:AddToggle(options)
    if type(options) == "string" then
        options = { Text = options }
    end
    options = options or {}
    local window = self.Window
    local metrics = window.Metrics
    local row = createRow(self, options, nil, true)
    row.Clickable = true
    local toggle = { Type = "Toggle", Window = window, Value = false, Callback = options.Callback }
    extendElement(toggle, row)
    local trackWidth, trackHeight = metrics.ToggleWidth, metrics.ToggleHeight
    local knobSize = trackHeight - 6
    local track = window:Make("Frame", {
        Name = "Switch",
        Size = UDim2.fromOffset(trackWidth, trackHeight),
    }, nil, { BackgroundColor3 = "ToggleOff" })
    window:Corner(track, "RadPill")
    local trackGlow = window:Make("UIStroke", { Thickness = 2, Transparency = 1, ApplyStrokeMode = Enum.ApplyStrokeMode.Border }, track, { Color = "ToggleOn" })
    local fill = window:Make("Frame", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1 }, track, { BackgroundColor3 = "ToggleOn" })
    fill.BackgroundTransparency = 1
    window:Corner(fill, "RadPill")
    local knob = window:Make("Frame", {
        Size = UDim2.fromOffset(knobSize, knobSize),
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 3, 0.5, 0),
    }, track, { BackgroundColor3 = "Knob" })
    window:Corner(knob, "RadPill")
    local stateText = window:Make("TextLabel", {
        Name = "State",
        Size = UDim2.fromOffset(0, trackHeight),
        AutomaticSize = Enum.AutomaticSize.X,
        Text = "[ ]",
        Font = "Semi",
        TextSize = metrics.Small + 1,
        Color = "ToggleText",
    }, nil)
    attachControl(row, track, 100)
    attachControl(row, stateText, 100)
    local function render(animate)
        local on = toggle.Value
        local style = window.Style
        local kind = style.ToggleKind
        row.Active = on
        if row.Refresh then
            row.Refresh()
        end
        track.Visible = kind == "Switch"
        stateText.Visible = kind == "Text"
        stateText.Text = on and "[x]" or "[ ]"
        local fillTransparency = on and 0 or 1
        local knobX = on and (trackWidth - knobSize - 3) or 3
        local knobColor = on and Color3.new(1, 1, 1) or window.Tokens.Knob
        local glowTransparency = (on and style.Glow) and 0.45 or 1
        local textTransparency = 0
        window:Bind(stateText, "TextColor3", on and "ToggleText" or "Muted")
        if animate then
            window:Tween(fill, { BackgroundTransparency = fillTransparency }, 0.2)
            window:Tween(knob, { Position = UDim2.new(0, knobX, 0.5, 0), BackgroundColor3 = knobColor }, 0.25, Enum.EasingStyle.Quint)
            window:Tween(trackGlow, { Transparency = glowTransparency }, 0.2)
            window:Tween(stateText, { TextTransparency = textTransparency }, 0.15)
            window:Tween(knob, { Size = UDim2.fromOffset(knobSize + 4, knobSize) }, 0.08)
            task.delay(0.1, function()
                if knob.Parent then
                    window:Tween(knob, { Size = UDim2.fromOffset(knobSize, knobSize) }, 0.15)
                end
            end)
        else
            fill.BackgroundTransparency = fillTransparency
            knob.Position = UDim2.new(0, knobX, 0.5, 0)
            knob.BackgroundColor3 = knobColor
            trackGlow.Transparency = glowTransparency
            stateText.TextTransparency = textTransparency
        end
    end
    function toggle:Set(value, silent, force)
        value = value == true
        if value == self.Value and not force then
            return
        end
        self.Value = value
        render(true)
        if not silent then
            fire(self, value)
        end
    end
    function toggle:Trigger()
        self:Set(not self.Value)
    end
    function toggle:Serialize()
        return self.Value
    end
    function toggle:Deserialize(value)
        self:Set(value == true, false, true)
    end
    window:Connect(row.Click.Activated, function()
        if row._suppress then
            row._suppress = false
            return
        end
        toggle:Set(not toggle.Value)
    end)
    toggle.Value = options.Default == true
    toggle.DefaultValue = toggle.Value
    function toggle:Reset()
        self:Set(self.DefaultValue, false, true)
    end
    window:_onStyle(toggle, function()
        render(false)
    end)
    render(false)
    if options.NoBind ~= true and options.Internal ~= true then
        window:_makeBindable(row, toggle, options.Flag or ("toggle_" .. slug(options.Text)))
    end
    return window:_register(toggle, options)
end

function Section:AddSlider(options)
    options = options or {}
    local window = self.Window
    local metrics = window.Metrics
    local minimum = options.Min or 0
    local maximum = options.Max or 100
    if maximum <= minimum then
        maximum = minimum + 1
    end
    local step = options.Step or options.Increment or 1
    local decimals = decimalsOf(step)
    local suffix = options.Suffix or ""
    local formatter = options.Format
    local row = createRow(self, options, "Plain")
    row.Click:Destroy()
    local slider = { Type = "Slider", Window = window, Min = minimum, Max = maximum, Step = step, Value = minimum, Callback = options.Callback }
    extendElement(slider, row)
    row.Title = window:Make("TextLabel", {
        Name = "Title",
        Position = UDim2.fromOffset(12, 4),
        Size = UDim2.new(1, -96, 0, metrics.SliderLabel),
        Text = options.Text or options.Title or "",
        Font = "Semi",
        TextSize = metrics.Text,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
    }, row.Frame)
    local valueBox = window:Make("TextBox", {
        Name = "Value",
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -12, 0, 4),
        Size = UDim2.fromOffset(80, metrics.SliderLabel),
        Font = "Semi",
        TextSize = metrics.Text - 1,
        TextXAlignment = Enum.TextXAlignment.Right,
    }, row.Frame, { TextColor3 = "AccentText" })
    local trackY = metrics.SliderHeight - metrics.TrackHeight - 10
    local track = window:Make("Frame", {
        Name = "Track",
        Position = UDim2.fromOffset(12, trackY),
        Size = UDim2.new(1, -24, 0, metrics.TrackHeight),
    }, row.Frame, { BackgroundColor3 = "ToggleOff" })
    window:Corner(track, "RadPill")
    local fill = new("Frame", { Size = UDim2.new(0, 0, 1, 0), BackgroundColor3 = Color3.new(1, 1, 1) }, track)
    window:Corner(fill, "RadPill")
    window:Gradient(fill, "Accent", "AccentAlt", 0)
    local knob = new("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.fromOffset(metrics.KnobSize, metrics.KnobSize),
        BackgroundColor3 = Color3.new(1, 1, 1),
        Rotation = window.Style.Gamer and 45 or 0,
        ZIndex = 2,
    }, track)
    window:Corner(knob, "RadPill")
    window:_onStyle(slider, function()
        knob.Rotation = window.Style.Gamer and 45 or 0
    end)
    local knobGlow = window:Make("UIStroke", { Thickness = 3, Transparency = 1, ApplyStrokeMode = Enum.ApplyStrokeMode.Border }, knob, { Color = "Accent" })
    local hitTop = metrics.Touch and (metrics.SliderLabel - 2) or (metrics.SliderLabel + 4)
    local hit = new("TextButton", {
        Position = UDim2.fromOffset(0, hitTop),
        Size = UDim2.new(1, 0, 1, -hitTop),
        ZIndex = 3,
    }, row.Frame)
    local function snap(value)
        value = math.clamp(value, minimum, maximum)
        value = minimum + math.floor((value - minimum) / step + 0.5) * step
        value = math.clamp(value, minimum, maximum)
        return tonumber(string.format("%." .. decimals .. "f", value))
    end
    local function describe(value)
        if formatter then
            local ok, text = pcall(formatter, value)
            if ok and text ~= nil then
                return tostring(text)
            end
        end
        return string.format("%." .. decimals .. "f", value) .. suffix
    end
    local function render()
        local ratio = (slider.Value - minimum) / (maximum - minimum)
        fill.Size = UDim2.new(ratio, 0, 1, 0)
        knob.Position = UDim2.fromScale(ratio, 0.5)
        valueBox.Text = describe(slider.Value)
    end
    function slider:SetRange(low, high, newStep)
        low = tonumber(low) or minimum
        high = tonumber(high) or maximum
        if high <= low then
            high = low + 1
        end
        minimum, maximum = low, high
        if tonumber(newStep) and newStep > 0 then
            step = newStep
            decimals = decimalsOf(step)
        end
        self.Min, self.Max, self.Step = minimum, maximum, step
        self.Value = snap(self.Value)
        render()
    end
    function slider:Set(value, silent, force)
        value = snap(tonumber(value) or self.Value)
        if value == self.Value and not force then
            return
        end
        self.Value = value
        render()
        if not silent then
            fire(self, value)
        end
    end
    function slider:Serialize()
        return self.Value
    end
    function slider:Deserialize(value)
        self:Set(value, false, true)
    end
    window:Connect(valueBox.Focused, function()
        valueBox.Text = string.format("%." .. decimals .. "f", slider.Value)
    end)
    window:Connect(valueBox.FocusLost, function()
        local typed = tonumber(string.match(valueBox.Text, "-?%d+%.?%d*"))
        if typed then
            slider:Set(typed)
        end
        render()
    end)
    local page = self.Tab.Page
    window:_trackDrag(hit, function(input)
        local width = track.AbsoluteSize.X
        if width <= 0 then
            return
        end
        local ratio = math.clamp((input.Position.X - track.AbsolutePosition.X) / width, 0, 1)
        slider:Set(minimum + (maximum - minimum) * ratio)
    end, function()
        page.ScrollingEnabled = false
        window:Tween(knob, { Size = UDim2.fromOffset(metrics.KnobSize + 6, metrics.KnobSize + 6) }, 0.12, Enum.EasingStyle.Quint)
        window:Tween(knobGlow, { Transparency = 0.5 }, 0.12)
    end, function()
        page.ScrollingEnabled = true
        window:Tween(knob, { Size = UDim2.fromOffset(metrics.KnobSize, metrics.KnobSize) }, 0.15)
        window:Tween(knobGlow, { Transparency = 1 }, 0.15)
        if options.OnRelease then
            window:_safe("slider release", options.OnRelease, slider.Value, slider)
        end
    end)
    slider.Value = snap(options.Default or minimum)
    slider.DefaultValue = slider.Value
    function slider:Reset()
        self:Set(self.DefaultValue, false, true)
    end
    render()
    return window:_register(slider, options)
end

function Window:_fieldButton(properties, binds)
    local metrics = self.Metrics
    properties.TextSize = properties.TextSize or (metrics.Text - 1)
    local button = self:Make("TextButton", properties, nil, binds or { BackgroundColor3 = "SurfaceAlt", BackgroundTransparency = "TransField" })
    self:Corner(button, "RadControl")
    self:Stroke(button)
    return button
end

function Section:AddDropdown(options)
    options = options or {}
    local window = self.Window
    local metrics = window.Metrics
    local multi = options.Multi == true
    local row = createRow(self, options)
    local dropdown = {
        Type = "Dropdown",
        Window = window,
        Multi = multi,
        Options = {},
        Value = multi and {} or nil,
        Callback = options.Callback,
    }
    extendElement(dropdown, row)
    local button = window:_fieldButton({
        Name = "Dropdown",
        Size = UDim2.fromOffset(metrics.DropdownWidth, metrics.ControlHeight),
        ClipsDescendants = true,
    })
    local valueLabel = window:Make("TextLabel", {
        Size = UDim2.new(1, -26, 1, 0),
        Position = UDim2.fromOffset(9, 0),
        TextSize = metrics.Text - 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
    }, button)
    window:_chevron(button, 8)
    attachControl(row, button)
    local popup = window:_makePopup("DropdownPopup")
    dropdown._onDestroy = function()
        window:_destroyPopup(popup)
    end
    local list = window:Make("ScrollingFrame", {
        Position = UDim2.fromOffset(0, 0),
        Size = UDim2.fromScale(1, 1),
        CanvasSize = UDim2.new(),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        ScrollBarThickness = metrics.ScrollBar,
    }, popup, { ScrollBarImageColor3 = "Accent" })
    addPadding(list, 4)
    addList(list, 2)
    local items = {}
    local searchBoxHeight = math.max(20, metrics.ItemHeight - 8)
    local searchBox = window:Make("TextBox", {
        Name = "Search",
        Position = UDim2.fromOffset(4, 4),
        Size = UDim2.new(1, -8, 0, searchBoxHeight),
        PlaceholderText = "Search...",
        TextSize = metrics.Small + 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Visible = false,
    }, popup, { BackgroundColor3 = "SurfaceAlt", BackgroundTransparency = "TransField", PlaceholderColor3 = "Muted" })
    window:Corner(searchBox, "RadControl")
    addPadding(searchBox, 0, 8, 0, 8)
    local emptyLabel = window:Make("TextLabel", {
        Name = "Empty",
        Size = UDim2.new(1, 0, 0, metrics.ItemHeight),
        Text = "No options",
        TextSize = metrics.Small + 1,
        Muted = true,
        Visible = false,
        LayoutOrder = 99999,
    }, list)
    window:Connect(searchBox:GetPropertyChangedSignal("Text"), function()
        local query = string.lower(searchBox.Text)
        local shown = 0
        for option, item in pairs(items) do
            local match = query == "" or string.find(string.lower(option), query, 1, true) ~= nil
            item.Button.Visible = match
            if match then
                shown = shown + 1
            end
        end
        emptyLabel.Text = #dropdown.Options == 0 and "No options" or "No matches"
        emptyLabel.Visible = shown == 0
    end)
    local function isSelected(option)
        if multi then
            return table.find(dropdown.Value, option) ~= nil
        end
        return dropdown.Value == option
    end
    local function updateText()
        local empty
        if multi then
            empty = #dropdown.Value == 0
            valueLabel.Text = empty and (options.Placeholder or "None") or table.concat(dropdown.Value, ", ")
        else
            empty = dropdown.Value == nil
            valueLabel.Text = dropdown.Value or options.Placeholder or "Select..."
        end
        window:Bind(valueLabel, "TextColor3", empty and "Muted" or "Text")
    end
    local function refreshItems()
        for option, item in pairs(items) do
            local selected = isSelected(option)
            window:Bind(item.Label, "TextColor3", selected and "AccentText" or "Text")
            item.Button.BackgroundTransparency = selected and 0.7 or 1
        end
    end
    local function choose(option)
        if multi then
            local selection = {}
            for _, candidate in ipairs(dropdown.Options) do
                local wasOn = table.find(dropdown.Value, candidate) ~= nil
                local isOn = wasOn
                if candidate == option then
                    isOn = not wasOn
                end
                if isOn then
                    table.insert(selection, candidate)
                end
            end
            dropdown:Set(selection)
        else
            dropdown:Set(option)
            window:_closePopup()
        end
    end
    local function rebuild()
        for _, item in pairs(items) do
            item.Button:Destroy()
        end
        items = {}
        for index, option in ipairs(dropdown.Options) do
            local itemButton = window:Make("TextButton", {
                Size = UDim2.new(1, 0, 0, metrics.ItemHeight),
                LayoutOrder = index,
            }, list, { BackgroundColor3 = "Hover" })
            itemButton.BackgroundTransparency = 1
            window:Corner(itemButton, "RadControl")
            local itemLabel = window:Make("TextLabel", {
                Size = UDim2.new(1, -16, 1, 0),
                Position = UDim2.fromOffset(8, 0),
                Text = option,
                TextSize = metrics.Text,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextTruncate = Enum.TextTruncate.AtEnd,
            }, itemButton)
            items[option] = { Button = itemButton, Label = itemLabel }
            itemButton.Activated:Connect(function()
                choose(option)
            end)
        end
        refreshItems()
    end
    function dropdown:SetOptions(newOptions)
        self.Options = {}
        for _, option in ipairs(newOptions or {}) do
            table.insert(self.Options, tostring(option))
        end
        if multi then
            local kept = {}
            for _, option in ipairs(self.Options) do
                if table.find(self.Value, option) then
                    table.insert(kept, option)
                end
            end
            self.Value = kept
        elseif self.Value ~= nil and not table.find(self.Options, self.Value) then
            self.Value = nil
        end
        rebuild()
        updateText()
    end
    function dropdown:AddOption(name)
        name = tostring(name)
        if table.find(self.Options, name) then
            return false
        end
        local list = table.clone(self.Options)
        table.insert(list, name)
        self:SetOptions(list)
        return true
    end
    function dropdown:RemoveOption(name)
        local index = table.find(self.Options, tostring(name))
        if not index then
            return false
        end
        local list = table.clone(self.Options)
        table.remove(list, index)
        self:SetOptions(list)
        return true
    end
    function dropdown:Clear()
        self:SetOptions({})
    end
    function dropdown:GetOptions()
        return table.clone(self.Options)
    end
    function dropdown:Set(value, silent, force)
        local newValue
        if multi then
            local lookup = {}
            if type(value) == "table" then
                for _, entry in ipairs(value) do
                    lookup[entry] = true
                end
            elseif type(value) == "string" then
                lookup[value] = true
            end
            newValue = {}
            for _, option in ipairs(self.Options) do
                if lookup[option] then
                    table.insert(newValue, option)
                end
            end
            if not force and sameList(newValue, self.Value) then
                return
            end
        else
            if value ~= nil and not table.find(self.Options, value) then
                return
            end
            if not force and value == self.Value then
                return
            end
            newValue = value
        end
        self.Value = newValue
        updateText()
        refreshItems()
        if not silent then
            fire(self, multi and table.clone(newValue) or newValue)
        end
    end
    function dropdown:Serialize()
        if multi then
            return table.clone(self.Value)
        end
        return self.Value
    end
    function dropdown:Deserialize(value)
        self:Set(value, false, true)
    end
    local function openDropdown()
        if window._popup == popup then
            window:_closePopup()
            return
        end
        local useSearch = options.Searchable == true or (options.Searchable == nil and #dropdown.Options > 8)
        local searchHeight = useSearch and (searchBoxHeight + 8) or 0
        searchBox.Visible = useSearch
        searchBox.Text = ""
        emptyLabel.Text = "No options"
        emptyLabel.Visible = #dropdown.Options == 0
        list.Position = UDim2.fromOffset(0, searchHeight)
        list.Size = UDim2.new(1, 0, 1, -searchHeight)
        local count = math.min(#dropdown.Options, metrics.MaxDropdownItems)
        local height = metrics.ItemHeight + 8
        if count > 0 then
            height = count * metrics.ItemHeight + (count - 1) * 2 + 8
        end
        height = height + searchHeight
        local longest = 0
        for _, option in ipairs(dropdown.Options) do
            longest = math.max(longest, #option)
        end
        local fit = longest * metrics.Text * 0.54 + 40
        local width = math.clamp(math.max(button.AbsoluteSize.X / window.Scale.Scale, 130, fit), 130, 300)
        refreshItems()
        window:_showPopup(popup, button, Vector2.new(width, height), window:_useSheet())
    end
    window:Connect(button.Activated, openDropdown)
    row.OnTap = openDropdown
    dropdown:SetOptions(options.Options)
    dropdown:Set(options.Default, true)
    dropdown.DefaultValue = multi and table.clone(dropdown.Value) or dropdown.Value
    function dropdown:Reset()
        self:Set(self.DefaultValue, false, true)
    end
    return window:_register(dropdown, options)
end

function Section:AddTextBox(options)
    options = options or {}
    local window = self.Window
    local metrics = window.Metrics
    local row = createRow(self, options)
    local textbox = { Type = "TextBox", Window = window, Value = options.Default or "", Callback = options.Callback, Invalid = false }
    extendElement(textbox, row)
    local box = window:Make("TextBox", {
        Name = "Input",
        Size = UDim2.fromOffset(metrics.InputWidth, metrics.ControlHeight),
        Text = textbox.Value,
        PlaceholderText = options.Placeholder or "",
        TextSize = metrics.Text - 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        ClipsDescendants = true,
    }, nil, { BackgroundColor3 = "SurfaceAlt", BackgroundTransparency = "TransField", PlaceholderColor3 = "Muted" })
    window:Corner(box, "RadControl")
    addPadding(box, 0, 8, 0, 8)
    local stroke = window:Stroke(box)
    attachControl(row, box)
    local maxLength = tonumber(options.MaxLength)
    local function check(text)
        if text == "" then
            if options.Required then
                return false, options.RequiredMessage or "Required"
            end
            return true
        end
        if maxLength and #text > maxLength then
            return false, "Max " .. maxLength .. " characters"
        end
        if options.Numeric then
            local number = tonumber(text)
            if not number then
                return false, "Enter a number"
            end
            if options.Min and number < options.Min then
                return false, "Minimum " .. tostring(options.Min)
            end
            if options.Max and number > options.Max then
                return false, "Maximum " .. tostring(options.Max)
            end
        end
        if options.Pattern and not string.match(text, options.Pattern) then
            return false, options.PatternMessage or "Invalid format"
        end
        if options.Validate then
            local ran, result, message = pcall(options.Validate, text)
            if not ran then
                window:_reportError("TextBox validate", result)
                return false, "Validation failed"
            end
            if result == false then
                return false, message or "Invalid"
            elseif type(result) == "string" then
                return false, result
            end
        end
        return true
    end
    local function paint(focused)
        local tokens = window.Tokens
        if textbox.Invalid then
            window:Motion("Hover", stroke, { Color = tokens.Danger, Transparency = 0.05 })
        elseif focused then
            window:Motion("Hover", stroke, { Color = tokens.Accent, Transparency = 0 })
        else
            window:Motion("Hover", stroke, { Color = tokens.Outline, Transparency = tokens.TransStroke })
        end
    end
    function textbox:SetError(message)
        self.Invalid = true
        paint(box:IsFocused())
        row:SetNote(message or "Invalid", "Danger")
    end
    function textbox:ClearError()
        if not self.Invalid then
            return
        end
        self.Invalid = false
        paint(box:IsFocused())
        row:SetNote(nil)
    end
    function textbox:IsValid()
        return (check(box.Text))
    end
    row.OnTap = function()
        box:CaptureFocus()
    end
    window:Connect(box.Focused, function()
        paint(true)
    end)
    window:Connect(box:GetPropertyChangedSignal("Text"), function()
        if maxLength and #box.Text > maxLength then
            box.Text = string.sub(box.Text, 1, maxLength)
            return
        end
        if textbox.Invalid and check(box.Text) then
            textbox:ClearError()
        end
    end)
    window:Connect(box.FocusLost, function(enterPressed)
        local text = box.Text
        local valid, message = check(text)
        if not valid then
            textbox:SetError(message)
            if options.OnInvalid then
                window:_safe("textbox invalid", options.OnInvalid, text, message, textbox)
            end
            paint(false)
            return
        end
        textbox:ClearError()
        paint(false)
        textbox.Value = text
        fire(textbox, text, enterPressed)
    end)
    function textbox:Set(text, silent)
        text = tostring(text or "")
        local valid, message = check(text)
        if not valid then
            self:SetError(message)
            return false
        end
        self:ClearError()
        self.Value = text
        box.Text = text
        if not silent then
            fire(self, text, false)
        end
        return true
    end
    function textbox:Serialize()
        return self.Value
    end
    function textbox:Deserialize(value)
        self:Set(value, false)
    end
    textbox.DefaultValue = textbox.Value
    function textbox:Reset()
        self:Set(self.DefaultValue, false)
    end
    return window:_register(textbox, options)
end

function Window:_createButtonRow(parent, buttons, layoutOrder, section, transient)
    local metrics = self.Metrics
    local count = #buttons
    local frame = new("Frame", {
        Name = "ButtonRow",
        Size = UDim2.new(1, 0, 0, metrics.ButtonHeight),
        LayoutOrder = layoutOrder or 0,
    }, parent)
    addList(frame, metrics.Gap, Enum.FillDirection.Horizontal)
    local created = {}
    local function connect(signal, callback)
        if transient then
            return signal:Connect(callback)
        end
        return self:Connect(signal, callback)
    end
    for index, definition in ipairs(buttons) do
        local label = definition.Text or definition.Title or "Button"
        local primary = definition.Primary == true
        local slot = new("Frame", {
            Name = "ButtonSlot",
            Size = UDim2.new(1 / count, -math.ceil(metrics.Gap * (count - 1) / count), 1, 0),
            LayoutOrder = index,
        }, frame)
        local holder = self:Make("Frame", {
            Name = "ButtonHolder",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
            ClipsDescendants = true,
            BackgroundColor3 = primary and Color3.new(1, 1, 1) or nil,
            BackgroundTransparency = primary and 0 or nil,
        }, slot, (not primary) and { BackgroundColor3 = "SurfaceAlt", BackgroundTransparency = "TransField" } or nil)
        self:Corner(holder, "RadControl")
        local stroke
        if primary then
            self:Gradient(holder, "Accent", "AccentAlt", 0)
            stroke = self:Stroke(holder, "AccentAlt", nil, 1)
        else
            stroke = self:Stroke(holder)
        end
        local shade = self:Make("Frame", {
            Name = "Shade",
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            Active = false,
            ZIndex = 1,
        }, holder, { BackgroundColor3 = "RimColor" })
        self:Corner(shade, "RadControl")
        local text = self:Make("TextLabel", {
            Name = "Label",
            Size = UDim2.fromScale(1, 1),
            Text = self:Display(label),
            Font = "Semi",
            TextSize = metrics.Text,
            Color = primary and "OnAccent" or nil,
            ZIndex = 2,
        }, holder)
        local hit = new("TextButton", { Name = "Hit", Size = UDim2.fromScale(1, 1), ZIndex = 3 }, holder)
        local pressScale = new("UIScale", {}, holder)
        local hovered = false
        local pressed = false
        local function settle(motionName)
            local tokens = self.Tokens
            if not primary then
                self:Motion(motionName, holder, {
                    BackgroundColor3 = hovered and tokens.Hover or tokens.SurfaceAlt,
                    BackgroundTransparency = tokens.TransField,
                })
                self:Motion(motionName, stroke, {
                    Color = hovered and tokens.Accent or tokens.Outline,
                    Transparency = hovered and 0.45 or tokens.TransStroke,
                })
            end
            local wash = 1
            if pressed then
                wash = primary and 0.8 or 0.86
            elseif hovered and primary then
                wash = 0.9
            end
            self:Motion(motionName, shade, { BackgroundTransparency = wash })
        end
        connect(hit.MouseEnter, function()
            hovered = true
            settle("Hover")
        end)
        connect(hit.MouseLeave, function()
            hovered = false
            pressed = false
            settle("Hover")
            self:Motion("Release", pressScale, { Scale = 1 })
        end)
        connect(hit.MouseButton1Down, function()
            pressed = true
            settle("Press")
            self:Motion("Press", pressScale, { Scale = 0.97 })
        end)
        connect(hit.MouseButton1Up, function()
            pressed = false
            settle("Release")
            self:Motion("Release", pressScale, { Scale = 1 })
        end)
        local element = {
            Type = "Button",
            Window = self,
            Callback = definition.Callback,
            _listeners = {},
            Text = label,
            Button = hit,
            Label = text,
            Holder = holder,
            Section = section,
        }
        element._render = function()
            local base = element.Text
            if self._listening == element then
                base = "press a key..."
            elseif element.BindKey then
                base = base .. "  [" .. keyToText(element.BindKey) .. "]"
            end
            text.Text = self:Display(base)
        end
        if not transient then
            self:_onStyle(element, element._render)
        end
        local function run()
            if definition.Callback then
                task.spawn(definition.Callback)
            end
            self:_elementChanged(element)
        end
        function element:Trigger()
            run()
        end
        function element:SetText(newText)
            self.Text = newText
            if self._render then
                self._render()
            else
                text.Text = newText
            end
        end
        local busyEntry
        function element:SetDisabled(disabled)
            self.Disabled = disabled == true
            hit.Active = not self.Disabled and not self.Loading
            self.Window:Motion("Fade", text, { TextTransparency = self.Disabled and 0.5 or 0 })
        end
        function element:SetLoading(loading, label)
            loading = loading == true
            if busyEntry then
                busyEntry.Dead = true
                busyEntry = nil
            end
            self.Loading = loading
            hit.Active = not loading and not self.Disabled
            if loading then
                local base = label or "Working"
                local frame = 0
                text.Text = base
                busyEntry = self.Window:_animate({
                    Interval = 0.3,
                    Update = function()
                        frame = frame % 4
                        text.Text = base .. string.rep(".", frame)
                        frame = frame + 1
                    end,
                })
                self.Window:Motion("Fade", text, { TextTransparency = 0.25 })
            else
                self.Window:Motion("Fade", text, { TextTransparency = self.Disabled and 0.5 or 0 })
                if self._render then
                    self._render()
                else
                    text.Text = self.Text
                end
            end
        end
        function element:IsBusy()
            return self.Loading == true or self.Disabled == true
        end
        function element:Run(work, label)
            if self:IsBusy() then
                return false
            end
            self:SetLoading(true, label)
            task.spawn(function()
                self.Window:_safe("Button " .. tostring(self.Text), work)
                if not self.Window.Destroyed then
                    self:SetLoading(false)
                end
            end)
            return true
        end
        connect(hit.Activated, function()
            if element._suppress then
                element._suppress = false
                return
            end
            if element:IsBusy() then
                return
            end
            run()
        end)
        connect(hit.InputBegan, function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                self:_ripple(holder, input, 1)
            end
        end)
        if definition.NoBind ~= true and definition.Internal ~= true then
            element.BindId = definition.Flag or ("button_" .. slug(label))
            element.BindKey = nil
            function element:SetKey(key, silent)
                if key ~= nil and typeof(key) ~= "EnumItem" then
                    key = nil
                end
                self.BindKey = key
                self._render()
                self.Window:_emit("BindsChanged")
                if not silent then
                    self.Window:_queueAutoSave()
                end
            end
            connect(hit.MouseButton2Click, function()
                self:_listen(element)
            end)
            table.insert(self._quickbinds, element)
            local pending = self._pendingBinds[element.BindId]
            if pending ~= nil then
                self._pendingBinds[element.BindId] = nil
                task.defer(function()
                    element:SetKey(deserializeKey(pending), true)
                end)
            end
        end
        if definition.Internal ~= true and definition.NoBind ~= true then
            self:_registerCommand(element, { Text = label })
        end
        created[index] = element
    end
    return frame, created
end

function Section:AddButtonRow(buttons)
    local frame, created = self.Window:_createButtonRow(self.Content, buttons, self:_nextOrder(), self)
    self:_track(frame, function()
        local parts = {}
        for _, definition in ipairs(buttons) do
            table.insert(parts, definition.Text or definition.Title or "")
        end
        return table.concat(parts, " ")
    end)
    return created
end

function Section:AddButton(options)
    if type(options) == "string" then
        options = { Text = options }
    end
    options = options or {}
    options.Primary = options.Primary
    return self:AddButtonRow({ options })[1]
end

function Section:AddLabel(options)
    if type(options) == "string" then
        options = { Text = options }
    end
    options = options or {}
    local row = createRow(self, options)
    return extendElement({ Type = "Label", Window = self.Window }, row)
end

function Section:AddParagraph(options)
    options = options or {}
    local window = self.Window
    local metrics = window.Metrics
    local function resolve(value)
        if type(value) == "table" then
            local lines = {}
            for _, line in ipairs(value) do
                table.insert(lines, tostring(line))
            end
            return table.concat(lines, "\n")
        end
        return tostring(value or "")
    end
    local alignments = { Left = Enum.TextXAlignment.Left, Center = Enum.TextXAlignment.Center, Right = Enum.TextXAlignment.Right }
    local frame = new("Frame", {
        Name = "Paragraph",
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = self:_nextOrder(),
    }, self.Content)
    addList(frame, 2)
    local title
    if options.Title and options.Title ~= "" then
        title = window:Make("TextLabel", {
            Size = UDim2.new(1, 0, 0, metrics.Text + 6),
            Text = options.Title,
            Font = "Semi",
            TextSize = metrics.Text,
            TextXAlignment = alignments[options.Align] or Enum.TextXAlignment.Left,
            LayoutOrder = 1,
        }, frame)
    end
    local content = window:Make("TextLabel", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Text = resolve(options.Content or options.Text),
        TextSize = metrics.Text - 1,
        TextWrapped = true,
        Color = TEXT_TONES[options.Tone or "Muted"] or "Muted",
        TextXAlignment = alignments[options.Align] or Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        RichText = options.RichText == true,
        LayoutOrder = 2,
    }, frame)
    local item = self:_track(frame, function()
        return (options.Title or "") .. " " .. content.Text
    end)
    local paragraph = { Type = "Paragraph", Window = window }
    function paragraph:SetText(text)
        content.Text = resolve(text)
    end
    function paragraph:GetText()
        return content.Text
    end
    function paragraph:SetTitle(text)
        if title then
            title.Text = text
        end
    end
    function paragraph:SetRichText(enabled)
        content.RichText = enabled == true
    end
    function paragraph:SetTone(tone)
        window:Bind(content, "TextColor3", TEXT_TONES[tone] or "Muted")
    end
    function paragraph:SetAlign(align)
        local value = alignments[align]
        if value then
            content.TextXAlignment = value
            if title then
                title.TextXAlignment = value
            end
        end
    end
    function paragraph:SetVisible(visible)
        item.Hidden = not visible
        item:Refresh()
    end
    local section = self
    function paragraph.Destroy()
        section:_untrack(item)
        frame:Destroy()
    end
    paragraph.Section = self
    return paragraph
end

function Window:Shimmer(frame)
    local window = self
    local gradient = new("UIGradient", {
        Rotation = 20,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.6),
            NumberSequenceKeypoint.new(0.5, 0),
            NumberSequenceKeypoint.new(1, 0.6),
        }),
        Enabled = false,
    }, frame)
    local handle = {}
    local entry
    function handle:Start()
        if entry then
            return
        end
        gradient.Enabled = true
        local current
        current = window:_animate({
            Interval = 0.05,
            Update = function(clock)
                if not frame.Parent then
                    current.Dead = true
                    return
                end
                gradient.Offset = Vector2.new((clock * 0.9) % 2 - 1, 0)
            end,
        })
        entry = current
    end
    function handle:Stop()
        if entry then
            entry.Dead = true
            entry = nil
        end
        gradient.Enabled = false
    end
    return handle
end

function Section:AddProgressBar(options)
    if type(options) == "string" then
        options = { Text = options }
    end
    options = options or {}
    local window = self.Window
    local metrics = window.Metrics
    local minimum = options.Min or 0
    local maximum = options.Max or 100
    if maximum <= minimum then
        maximum = minimum + 1
    end
    local row = createRow(self, options, "Plain")
    row.Click:Destroy()
    local bar = { Type = "ProgressBar", Window = window, Min = minimum, Max = maximum, Value = minimum, Indeterminate = false, Callback = options.Callback }
    extendElement(bar, row)
    row.Title = window:Make("TextLabel", {
        Name = "Title",
        Position = UDim2.fromOffset(12, 4),
        Size = UDim2.new(1, -96, 0, metrics.SliderLabel),
        Text = options.Text or options.Title or "",
        Font = "Semi",
        TextSize = metrics.Text,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
    }, row.Frame)
    local valueLabel = window:Make("TextLabel", {
        Name = "Value",
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -12, 0, 4),
        Size = UDim2.fromOffset(80, metrics.SliderLabel),
        Font = "Semi",
        TextSize = metrics.Text - 1,
        TextXAlignment = Enum.TextXAlignment.Right,
    }, row.Frame, { TextColor3 = "AccentText" })
    local track = window:Make("Frame", {
        Name = "Track",
        Position = UDim2.fromOffset(12, metrics.SliderHeight - metrics.TrackHeight - 10),
        Size = UDim2.new(1, -24, 0, metrics.TrackHeight),
        ClipsDescendants = true,
    }, row.Frame, { BackgroundColor3 = "ToggleOff" })
    window:Corner(track, "RadPill")
    local fill = new("Frame", { Name = "Fill", Size = UDim2.new(0, 0, 1, 0), BackgroundColor3 = Color3.new(1, 1, 1) }, track)
    window:Corner(fill, "RadPill")
    window:Gradient(fill, "Accent", "AccentAlt", 0)
    local segment = new("Frame", { Name = "Segment", Size = UDim2.new(0.3, 0, 1, 0), Visible = false, BackgroundColor3 = Color3.new(1, 1, 1) }, track)
    window:Corner(segment, "RadPill")
    window:Gradient(segment, "Accent", "AccentAlt", 0)
    local formatter = options.Format
    local sweep
    local function describe()
        if formatter then
            local ok, text = pcall(formatter, bar.Value, bar:GetRatio())
            if ok and text ~= nil then
                return tostring(text)
            end
        end
        return math.floor(bar:GetRatio() * 100 + 0.5) .. "%"
    end
    function bar:GetRatio()
        return math.clamp((self.Value - self.Min) / (self.Max - self.Min), 0, 1)
    end
    local function render(animate)
        local ratio = bar:GetRatio()
        if animate then
            window:Motion("Toggle", fill, { Size = UDim2.new(ratio, 0, 1, 0) })
        else
            window:Tween(fill, { Size = UDim2.new(ratio, 0, 1, 0) }, 0)
        end
        valueLabel.Text = bar.Indeterminate and "..." or describe()
    end
    function bar:Set(value, silent)
        value = math.clamp(tonumber(value) or self.Value, self.Min, self.Max)
        if value == self.Value then
            return
        end
        local previous = self.Value
        self.Value = value
        render(true)
        if not silent then
            fire(self, value)
            if value >= self.Max and previous < self.Max and options.OnComplete then
                window:_safe("progress complete", options.OnComplete, value, self)
            end
        end
    end
    function bar:Get()
        return self.Value
    end
    function bar:Increment(amount)
        self:Set(self.Value + (tonumber(amount) or 1))
    end
    function bar:SetRange(low, high)
        low = tonumber(low) or self.Min
        high = tonumber(high) or self.Max
        if high <= low then
            high = low + 1
        end
        self.Min, self.Max = low, high
        self.Value = math.clamp(self.Value, low, high)
        render(false)
    end
    function bar:SetIndeterminate(enabled)
        enabled = enabled == true
        if enabled == self.Indeterminate then
            return
        end
        self.Indeterminate = enabled
        segment.Visible = enabled
        fill.Visible = not enabled
        if sweep then
            sweep.Dead = true
            sweep = nil
        end
        if enabled then
            local current
            current = window:_animate({
                Interval = 0.03,
                Update = function(clock)
                    if not segment.Parent then
                        current.Dead = true
                        return
                    end
                    local phase = (clock * 0.7) % 1.3
                    segment.Position = UDim2.new(phase - 0.3, 0, 0, 0)
                end,
            })
            sweep = current
        end
        render(false)
    end
    function bar:Reset()
        self:SetIndeterminate(false)
        self:Set(self.DefaultValue or self.Min, true)
    end
    bar._onDestroy = function()
        if sweep then
            sweep.Dead = true
        end
    end
    bar.Value = math.clamp(options.Default or minimum, minimum, maximum)
    bar.DefaultValue = bar.Value
    render(false)
    if options.Indeterminate then
        bar:SetIndeterminate(true)
    end
    if options.Flag then
        return window:_register(bar, options)
    end
    return bar
end

function Section:AddStatus(options)
    if type(options) == "string" then
        options = { Text = options }
    end
    options = options or {}
    local window = self.Window
    local metrics = window.Metrics
    local row = createRow(self, options)
    local status = { Type = "Status", Window = window, Text = options.Status or options.Default or "Idle", Tone = options.Tone or "Muted" }
    extendElement(status, row)
    local chip = window:Make("Frame", {
        Name = "Status",
        Size = UDim2.fromOffset(0, metrics.ControlHeight - 4),
        AutomaticSize = Enum.AutomaticSize.X,
    }, nil, { BackgroundColor3 = "SurfaceAlt", BackgroundTransparency = "TransField" })
    window:Corner(chip, "RadPill")
    addPadding(chip, 0, 10, 0, 10)
    local layout = addList(chip, 6, Enum.FillDirection.Horizontal)
    layout.VerticalAlignment = Enum.VerticalAlignment.Center
    local dot = window:Make("Frame", { Name = "Dot", Size = UDim2.fromOffset(8, 8), LayoutOrder = 1 }, chip, { BackgroundColor3 = "Muted" })
    window:Corner(dot, "RadPill")
    local label = window:Make("TextLabel", {
        Name = "Label",
        Size = UDim2.fromOffset(0, metrics.ControlHeight - 4),
        AutomaticSize = Enum.AutomaticSize.X,
        TextSize = metrics.Small + 1,
        Font = "Semi",
        LayoutOrder = 2,
    }, chip)
    attachControl(row, chip)
    local pulse
    local function render()
        local token = TONES[status.Tone] or "Muted"
        window:Bind(dot, "BackgroundColor3", token)
        label.Text = tostring(status.Text)
    end
    function status:Pulse(enabled)
        if pulse then
            pulse.Dead = true
            pulse = nil
        end
        window:Tween(dot, { BackgroundTransparency = 0 }, 0)
        if enabled then
            local current
            current = window:_animate({
                Interval = 0.05,
                Update = function(clock)
                    if not dot.Parent then
                        current.Dead = true
                        return
                    end
                    dot.BackgroundTransparency = 0.6 * (0.5 + 0.5 * math.sin(clock * 5))
                end,
            })
            pulse = current
        end
    end
    function status:Set(text, tone, silent)
        self.Text = tostring(text)
        if tone ~= nil then
            self.Tone = tone
        end
        render()
        if not silent then
            fire(self, self.Text, self.Tone)
        end
    end
    function status:SetStatus(text, tone)
        self:Set(text, tone)
    end
    function status:Get()
        return self.Text, self.Tone
    end
    status._onDestroy = function()
        if pulse then
            pulse.Dead = true
        end
    end
    render()
    if options.Pulse then
        status:Pulse(true)
    end
    if options.Flag then
        return window:_register(status, options)
    end
    return status
end

function Section:AddKeybindList(options)
    options = options or {}
    local window = self.Window
    local metrics = window.Metrics
    local frame = window:Glass(self.Content, "Card", {
        Name = "KeybindList",
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = self:_nextOrder(),
    })
    addPadding(frame, 8)
    addList(frame, 6)
    local header = new("Frame", { Name = "Header", Size = UDim2.new(1, 0, 0, metrics.Text + 8), LayoutOrder = 1 }, frame)
    local titleLabel = window:Make("TextLabel", {
        Size = UDim2.new(1, -80, 1, 0),
        Text = options.Title or "Keybinds",
        Font = "Semi",
        TextSize = metrics.Text,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, header)
    local clear = window:Make("TextButton", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.fromScale(1, 0.5),
        Size = UDim2.fromOffset(70, metrics.Text + 8),
        Text = "Clear all",
        Font = "Semi",
        TextSize = metrics.Small,
        Color = "Accent",
    }, header)
    local list = new("Frame", { Name = "Items", Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, LayoutOrder = 2 }, frame)
    addList(list, 4)
    local function collect()
        local entries = {}
        for _, element in ipairs(window._keybinds) do
            if options.IncludeInternal or element.Internal ~= true then
                table.insert(entries, { Element = element, Name = window:_keyOwnerName(element), Key = element.Key })
            end
        end
        for _, element in ipairs(window._quickbinds) do
            if element.BindKey then
                table.insert(entries, { Element = element, Name = window:_keyOwnerName(element), Key = element.BindKey })
            end
        end
        table.sort(entries, function(a, b)
            return string.lower(a.Name) < string.lower(b.Name)
        end)
        return entries
    end
    local function refresh()
        for _, child in ipairs(list:GetChildren()) do
            if child:IsA("GuiObject") then
                child:Destroy()
            end
        end
        local entries = collect()
        titleLabel.Text = (options.Title or "Keybinds") .. "  (" .. #entries .. ")"
        if #entries == 0 then
            window:Make("TextLabel", {
                Size = UDim2.new(1, 0, 0, metrics.ItemHeight),
                Text = "No keybinds yet. Right-click a toggle or button to bind it.",
                TextSize = metrics.Small,
                TextWrapped = true,
                Muted = true,
            }, list)
            return
        end
        for index, entry in ipairs(entries) do
            local item = window:Glass(list, "Field", { Name = "Bind", Size = UDim2.new(1, 0, 0, metrics.ItemHeight), LayoutOrder = index })
            window:Make("TextLabel", {
                Position = UDim2.fromOffset(10, 0),
                Size = UDim2.new(1, -90, 1, 0),
                Text = entry.Name,
                TextSize = metrics.Text - 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextTruncate = Enum.TextTruncate.AtEnd,
            }, item)
            local listening = window._listening == entry.Element
            local chip = window:Make("TextButton", {
                Name = "Key",
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(1, -6, 0.5, 0),
                Size = UDim2.fromOffset(0, metrics.ItemHeight - 8),
                AutomaticSize = Enum.AutomaticSize.X,
                Text = listening and "press a key..." or ("[" .. keyToText(entry.Key) .. "]"),
                Font = "Semi",
                TextSize = metrics.Small,
                Color = listening and "Accent" or "Muted",
            }, item)
            addPadding(chip, 0, 6, 0, 6)
            window:Connect(chip.Activated, function()
                window:_listen(entry.Element)
            end)
        end
    end
    local pending = false
    local function schedule()
        if pending then
            return
        end
        pending = true
        task.defer(function()
            pending = false
            if frame.Parent and not window.Destroyed then
                refresh()
            end
        end)
    end
    local subscription = window:On("BindsChanged", schedule)
    window:Connect(clear.Activated, function()
        window:ClearBinds()
        for _, element in ipairs(table.clone(window._keybinds)) do
            if (options.IncludeInternal or element.Internal ~= true) and element.Key then
                element:SetKey(nil, true)
            end
        end
    end)
    local item = self:_track(frame, function()
        return (options.Title or "Keybinds") .. " keybinds"
    end)
    refresh()
    return {
        Type = "KeybindList",
        Window = window,
        Refresh = refresh,
        SetVisible = function(_, visible)
            item.Hidden = not visible
            item:Refresh()
        end,
        Destroy = function()
            subscription:Disconnect()
            self:_untrack(item)
            frame:Destroy()
        end,
    }
end

function Section:AddSearchableDropdown(options)
    options = options or {}
    options.Searchable = true
    return self:AddDropdown(options)
end

function Section:AddMultiDropdown(options)
    options = options or {}
    options.Multi = true
    return self:AddDropdown(options)
end

function Section:AddCodeBlock(options)
    if type(options) == "string" then
        options = { Code = options }
    end
    options = options or {}
    local window = self.Window
    local metrics = window.Metrics
    local headerHeight = metrics.Text + 14
    local height = options.Height or (metrics.Touch and 130 or 150)
    local frame = window:Glass(self.Content, "Field", {
        Name = "CodeBlock",
        Size = UDim2.new(1, 0, 0, height + headerHeight),
        LayoutOrder = self:_nextOrder(),
        ClipsDescendants = true,
    })
    window:Make("TextLabel", {
        Position = UDim2.fromOffset(10, 0),
        Size = UDim2.new(1, -90, 0, headerHeight),
        Text = options.Title or options.Language or "Code",
        Font = "Semi",
        TextSize = metrics.Small + 1,
        Muted = true,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, frame)
    local copy
    if options.Copy ~= false then
        copy = window:Make("TextButton", {
            Name = "Copy",
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.new(1, -6, 0, 3),
            Size = UDim2.fromOffset(64, headerHeight - 6),
            Text = "Copy",
            Font = "Semi",
            TextSize = metrics.Small + 1,
            Color = "Accent",
        }, frame)
    end
    window:_line(frame, { Position = UDim2.fromOffset(0, headerHeight), Size = UDim2.new(1, 0, 0, 1) })
    local body = window:Make("ScrollingFrame", {
        Name = "Body",
        Position = UDim2.fromOffset(0, headerHeight + 1),
        Size = UDim2.new(1, 0, 1, -(headerHeight + 1)),
        CanvasSize = UDim2.new(),
        AutomaticCanvasSize = Enum.AutomaticSize.XY,
        ScrollingDirection = Enum.ScrollingDirection.XY,
        ScrollBarThickness = metrics.ScrollBar,
    }, frame, { ScrollBarImageColor3 = "Accent" })
    addPadding(body, 8)
    local inner = new("Frame", { Size = UDim2.new(0, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.XY }, body)
    addList(inner, 10, Enum.FillDirection.Horizontal)
    local gutter
    if options.LineNumbers then
        gutter = window:Make("TextLabel", {
            Name = "Lines",
            Size = UDim2.new(0, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.XY,
            TextSize = metrics.Small + 1,
            Muted = true,
            TextXAlignment = Enum.TextXAlignment.Right,
            TextYAlignment = Enum.TextYAlignment.Top,
            LayoutOrder = 1,
        }, inner, { FontFace = "FontMono" })
    end
    local codeLabel = window:Make("TextLabel", {
        Name = "Code",
        Size = UDim2.new(0, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.XY,
        TextSize = metrics.Small + 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextWrapped = false,
        LayoutOrder = 2,
    }, inner, { FontFace = "FontMono" })
    local block = { Type = "CodeBlock", Window = window, Code = "" }
    function block:SetCode(code)
        self.Code = tostring(code or "")
        codeLabel.Text = self.Code
        if gutter then
            local _, count = string.gsub(self.Code, "\n", "\n")
            local numbers = {}
            for line = 1, count + 1 do
                numbers[line] = tostring(line)
            end
            gutter.Text = table.concat(numbers, "\n")
        end
    end
    function block:GetCode()
        return self.Code
    end
    local copyToken = 0
    function block:Copy()
        local ok = false
        if clipboardWriter then
            ok = pcall(clipboardWriter, self.Code)
        end
        if copy then
            copyToken = copyToken + 1
            local token = copyToken
            copy.Text = ok and "Copied" or "Unavailable"
            task.delay(1.2, function()
                if copyToken == token and copy.Parent then
                    copy.Text = "Copy"
                end
            end)
        end
        return ok
    end
    if copy then
        window:Connect(copy.Activated, function()
            block:Copy()
        end)
    end
    local item = self:_track(frame, function()
        return (options.Title or "") .. " " .. block.Code
    end)
    function block:SetVisible(visible)
        item.Hidden = not visible
        item:Refresh()
    end
    local section = self
    function block.Destroy()
        section:_untrack(item)
        frame:Destroy()
    end
    block:SetCode(options.Code or options.Text or "")
    return block
end

function Section:AddDataTable(options)
    options = options or {}
    local window = self.Window
    local metrics = window.Metrics
    local rowHeight = metrics.ItemHeight
    local headerHeight = rowHeight + 4
    local maxRows = options.MaxRows or 200
    local height = options.Height or (metrics.Touch and 180 or 200)
    local frame = window:Glass(self.Content, "Card", {
        Name = "DataTable",
        Size = UDim2.new(1, 0, 0, height),
        LayoutOrder = self:_nextOrder(),
        ClipsDescendants = true,
    })
    local header = new("Frame", { Name = "Header", Size = UDim2.new(1, 0, 0, headerHeight) }, frame)
    window:_line(frame, { Position = UDim2.fromOffset(0, headerHeight), Size = UDim2.new(1, 0, 0, 1) })
    local body = window:Make("ScrollingFrame", {
        Name = "Body",
        Position = UDim2.fromOffset(0, headerHeight + 1),
        Size = UDim2.new(1, 0, 1, -(headerHeight + 1)),
        CanvasSize = UDim2.new(),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        ScrollBarThickness = metrics.ScrollBar,
    }, frame, { ScrollBarImageColor3 = "Accent" })
    addPadding(body, 2)
    addList(body, 1)
    local grid = { Type = "DataTable", Window = window, Columns = {}, Rows = {}, SortKey = nil, Descending = false, FilterText = "", Selected = nil }
    local headerButtons = {}
    local function cell(row, column, index)
        local value = row[column.Key]
        if value == nil then
            value = row[index]
        end
        return value == nil and "" or tostring(value)
    end
    local function fractions()
        local total = 0
        for _, column in ipairs(grid.Columns) do
            total = total + (column.Width or 1)
        end
        local result, running = {}, 0
        for index, column in ipairs(grid.Columns) do
            local share = (column.Width or 1) / math.max(total, 0.001)
            result[index] = { running, share }
            running = running + share
        end
        return result
    end
    local function visibleRows()
        local list = {}
        local query = string.lower(grid.FilterText)
        for order, row in ipairs(grid.Rows) do
            local keep = query == ""
            if not keep then
                for index, column in ipairs(grid.Columns) do
                    if string.find(string.lower(cell(row, column, index)), query, 1, true) then
                        keep = true
                        break
                    end
                end
            end
            if keep then
                table.insert(list, { Row = row, Order = order })
            end
        end
        local key = grid.SortKey
        if key then
            local columnIndex
            for index, column in ipairs(grid.Columns) do
                if column.Key == key then
                    columnIndex = index
                end
            end
            table.sort(list, function(a, b)
                local left, right = a.Row[key], b.Row[key]
                if left == nil and columnIndex then
                    left = a.Row[columnIndex]
                end
                if right == nil and columnIndex then
                    right = b.Row[columnIndex]
                end
                local less
                if type(left) == "number" and type(right) == "number" then
                    if left == right then
                        return a.Order < b.Order
                    end
                    less = left < right
                else
                    local lowerLeft, lowerRight = string.lower(tostring(left)), string.lower(tostring(right))
                    if lowerLeft == lowerRight then
                        return a.Order < b.Order
                    end
                    less = lowerLeft < lowerRight
                end
                if grid.Descending then
                    return not less
                end
                return less
            end)
        end
        return list
    end
    local function renderHeader()
        for _, button in ipairs(headerButtons) do
            button:Destroy()
        end
        headerButtons = {}
        local spans = fractions()
        for index, column in ipairs(grid.Columns) do
            local arrow = ""
            if grid.SortKey == column.Key then
                arrow = grid.Descending and "  v" or "  ^"
            end
            local button = window:Make("TextButton", {
                Name = "Column",
                Position = UDim2.new(spans[index][1], 0, 0, 0),
                Size = UDim2.new(spans[index][2], 0, 1, 0),
                Text = (column.Title or column.Key) .. arrow,
                Font = "Semi",
                TextSize = metrics.Small + 1,
                TextXAlignment = column.Align == "Right" and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left,
                Color = grid.SortKey == column.Key and "Accent" or "Muted",
            }, header)
            addPadding(button, 0, 8, 0, 8)
            if options.Sortable ~= false and column.Sortable ~= false then
                window:Connect(button.Activated, function()
                    if grid.SortKey == column.Key then
                        grid.Descending = not grid.Descending
                    else
                        grid.SortKey = column.Key
                        grid.Descending = false
                    end
                    grid:Render()
                end)
            end
            table.insert(headerButtons, button)
        end
    end
    local footer
    function grid:Render()
        renderHeader()
        for _, child in ipairs(body:GetChildren()) do
            if child:IsA("GuiObject") then
                child:Destroy()
            end
        end
        footer = nil
        local list = visibleRows()
        local spans = fractions()
        local shown = math.min(#list, maxRows)
        for position = 1, shown do
            local entry = list[position]
            local selected = grid.Selected == entry.Row
            local line = window:Make("TextButton", {
                Name = "Row",
                Size = UDim2.new(1, 0, 0, rowHeight),
                LayoutOrder = position,
            }, body, { BackgroundColor3 = selected and "Accent" or "Hover" })
            line.BackgroundTransparency = selected and 0.75 or ((position % 2 == 0) and 0.9 or 1)
            window:Corner(line, "RadControl")
            for index, column in ipairs(grid.Columns) do
                window:Make("TextLabel", {
                    Position = UDim2.new(spans[index][1], 8, 0, 0),
                    Size = UDim2.new(spans[index][2], -16, 1, 0),
                    Text = cell(entry.Row, column, index),
                    TextSize = metrics.Small + 1,
                    TextXAlignment = column.Align == "Right" and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                }, line)
            end
            window:Connect(line.Activated, function()
                grid.Selected = entry.Row
                grid:Render()
                fire(grid, entry.Row, entry.Order)
                if options.OnSelect then
                    window:_safe("table select", options.OnSelect, entry.Row, entry.Order, grid)
                end
            end)
        end
        if #list == 0 then
            footer = window:Make("TextLabel", {
                Size = UDim2.new(1, 0, 0, rowHeight * 2),
                Text = grid.FilterText ~= "" and "No matching rows" or (options.EmptyText or "No data"),
                TextSize = metrics.Small + 1,
                Muted = true,
                LayoutOrder = 1,
            }, body)
        elseif #list > shown then
            footer = window:Make("TextLabel", {
                Size = UDim2.new(1, 0, 0, rowHeight),
                Text = "Showing " .. shown .. " of " .. #list,
                TextSize = metrics.Small,
                Muted = true,
                LayoutOrder = shown + 1,
            }, body)
        end
    end
    function grid:SetColumns(columns)
        self.Columns = {}
        for _, column in ipairs(columns or {}) do
            if type(column) == "string" then
                column = { Key = column, Title = column }
            end
            table.insert(self.Columns, column)
        end
        self:Render()
    end
    function grid:SetRows(rows)
        self.Rows = {}
        for _, row in ipairs(rows or {}) do
            table.insert(self.Rows, row)
        end
        if self.Selected and not table.find(self.Rows, self.Selected) then
            self.Selected = nil
        end
        self:Render()
    end
    function grid:AddRow(row)
        table.insert(self.Rows, row)
        self:Render()
    end
    function grid:RemoveRow(index)
        local removed = table.remove(self.Rows, index)
        if removed == self.Selected then
            self.Selected = nil
        end
        self:Render()
        return removed
    end
    function grid:Clear()
        self.Rows = {}
        self.Selected = nil
        self:Render()
    end
    function grid:Sort(key, descending)
        self.SortKey = key
        self.Descending = descending == true
        self:Render()
    end
    function grid:Filter(text)
        self.FilterText = tostring(text or "")
        self:Render()
    end
    function grid:GetRows()
        return table.clone(self.Rows)
    end
    function grid:GetSelected()
        return self.Selected
    end
    local item = self:_track(frame, function()
        return options.Title or "table"
    end)
    function grid:SetVisible(visible)
        item.Hidden = not visible
        item:Refresh()
    end
    function grid.Destroy()
        item.Section:_untrack(item)
        frame:Destroy()
    end
    grid.Callback = options.Callback
    grid._listeners = {}
    function grid:OnChanged(listener)
        table.insert(self._listeners, listener)
        return self
    end
    grid:SetColumns(options.Columns or {})
    grid:SetRows(options.Rows or {})
    return grid
end

function Window:_emptyState(parent, options)
    local metrics = self.Metrics
    local holder = new("Frame", {
        Name = options.Name or "EmptyState",
        Size = UDim2.new(1, 0, 0, options.Height or (metrics.Touch and 150 or 130)),
        LayoutOrder = options.LayoutOrder or 0,
    }, parent)
    local content = new("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, -24, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
    }, holder)
    local layout = addList(content, 4)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    local icon = new("ImageLabel", { Name = "Icon", Size = UDim2.fromOffset(metrics.IconSize + 10, metrics.IconSize + 10), LayoutOrder = 1 }, content)
    local iconGlyph = self:Make("TextLabel", {
        Name = "Glyph",
        Size = UDim2.fromOffset(metrics.IconSize + 10, metrics.IconSize + 10),
        Text = options.Glyph or "?",
        Font = "Bold",
        TextSize = metrics.Text + 10,
        Muted = true,
        LayoutOrder = 1,
    }, content)
    if options.Icon then
        iconGlyph.Visible = false
        self:ApplyIcon(icon, options.Icon, "Muted", function()
            icon.Visible = true
        end)
    else
        icon.Visible = false
    end
    local title = self:Make("TextLabel", {
        Name = "Title",
        Size = UDim2.new(1, 0, 0, metrics.Text + 6),
        Text = options.Title or "Nothing here",
        Font = "Semi",
        TextSize = metrics.Text + 1,
        LayoutOrder = 2,
    }, content)
    local description = self:Make("TextLabel", {
        Name = "Description",
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Text = options.Description or "",
        TextSize = metrics.Small + 1,
        TextWrapped = true,
        Muted = true,
        LayoutOrder = 3,
        Visible = options.Description ~= nil and options.Description ~= "",
    }, content)
    local state = { Frame = holder, Title = title, Description = description }
    if options.Button then
        local buttonHolder = new("Frame", { Name = "Action", Size = UDim2.fromOffset(metrics.Touch and 130 or 120, metrics.ButtonHeight), LayoutOrder = 4 }, content)
        local _, created = self:_createButtonRow(buttonHolder, {
            { Text = options.Button, Primary = true, Callback = options.Callback, NoBind = true, Internal = true },
        }, 1, options.Section)
        state.Button = created[1]
    end
    function state:Set(newTitle, newDescription)
        title.Text = newTitle or title.Text
        if newDescription ~= nil then
            description.Text = newDescription
            description.Visible = newDescription ~= ""
        end
    end
    return state
end

function Section:AddEmptyState(options)
    options = options or {}
    local window = self.Window
    options.LayoutOrder = self:_nextOrder()
    options.Section = self
    local state = window:_emptyState(self.Content, options)
    local item = self:_track(state.Frame, function()
        return (options.Title or "") .. " " .. (options.Description or "")
    end)
    return {
        Type = "EmptyState",
        Window = window,
        Button = state.Button,
        Set = function(_, title, description)
            state:Set(title, description)
        end,
        SetTitle = function(_, text)
            state:Set(text)
        end,
        SetDescription = function(_, text)
            state:Set(nil, text)
        end,
        SetVisible = function(_, visible)
            item.Hidden = not visible
            item:Refresh()
        end,
        Destroy = function()
            self:_untrack(item)
            state.Frame:Destroy()
        end,
    }
end

function Section:AddSkeleton(options)
    options = options or {}
    local window = self.Window
    local metrics = window.Metrics
    local frame = new("Frame", {
        Name = "Skeleton",
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = self:_nextOrder(),
    }, self.Content)
    addList(frame, 8)
    local shimmers = {}
    local widths = { 1, 0.92, 0.7, 0.84, 0.55 }
    local function build(count)
        for _, handle in ipairs(shimmers) do
            handle:Stop()
        end
        shimmers = {}
        for _, child in ipairs(frame:GetChildren()) do
            if child:IsA("GuiObject") then
                child:Destroy()
            end
        end
        for index = 1, count do
            local line = window:Make("Frame", {
                Name = "Line",
                Size = UDim2.new(widths[(index - 1) % #widths + 1], 0, 0, options.LineHeight or (metrics.Text + 2)),
                LayoutOrder = index,
                ClipsDescendants = true,
            }, frame, { BackgroundColor3 = "SurfaceAlt", BackgroundTransparency = "TransField" })
            window:Corner(line, "RadControl")
            local handle = window:Shimmer(line)
            handle:Start()
            table.insert(shimmers, handle)
        end
    end
    local skeleton = { Type = "Skeleton", Window = window, Loading = true }
    function skeleton:SetLines(count)
        build(math.clamp(math.floor(tonumber(count) or 3), 1, 12))
    end
    function skeleton:Show()
        self.Loading = true
        frame.Visible = true
        self:SetLines(options.Lines or 3)
    end
    function skeleton:Hide()
        self.Loading = false
        for _, handle in ipairs(shimmers) do
            handle:Stop()
        end
        frame.Visible = false
    end
    function skeleton:IsLoading()
        return self.Loading
    end
    local item = self:_track(frame, function()
        return ""
    end)
    function skeleton:SetVisible(visible)
        item.Hidden = not visible
        item:Refresh()
    end
    local section = self
    function skeleton.Destroy()
        for _, handle in ipairs(shimmers) do
            handle:Stop()
        end
        section:_untrack(item)
        frame:Destroy()
    end
    skeleton:Show()
    if options.Loading == false then
        skeleton:Hide()
    end
    return skeleton
end

function Section:AddDivider(options)
    if type(options) == "string" then
        options = { Text = options }
    end
    options = options or {}
    local window = self.Window
    local metrics = window.Metrics
    local hasText = options.Text and options.Text ~= ""
    local frame = new("Frame", {
        Name = "Divider",
        Size = UDim2.new(1, 0, 0, hasText and (metrics.Text + 8) or 6),
        LayoutOrder = self:_nextOrder(),
    }, self.Content)
    window:Make("Frame", {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.new(1, 0, 0, 1),
    }, frame, { BackgroundColor3 = "Outline", BackgroundTransparency = "TransStroke" })
    if hasText then
        local label = window:Make("TextLabel", {
            Position = UDim2.fromOffset(8, 0),
            Size = UDim2.new(0, 0, 1, 0),
            AutomaticSize = Enum.AutomaticSize.X,
            Text = options.Text,
            TextSize = metrics.Text - 1,
            Font = "Semi",
            Muted = true,
        }, frame, { BackgroundColor3 = "Surface" })
        label.BackgroundTransparency = 0
        addPadding(label, 0, 6, 0, 6)
    end
    local item = self:_track(frame, nil)
    return {
        Type = "Divider",
        SetVisible = function(_, visible)
            item.Hidden = not visible
            item:Refresh()
        end,
        Destroy = function()
            self:_untrack(item)
            frame:Destroy()
        end,
    }
end

function Section:AddImage(options)
    options = options or {}
    local window = self.Window
    local metrics = window.Metrics
    local height = options.Height or (metrics.Touch and 110 or 130)
    local frame = window:Glass(self.Content, "Card", {
        Name = "Image",
        Size = UDim2.new(1, 0, 0, height),
        LayoutOrder = self:_nextOrder(),
        ClipsDescendants = true,
    })
    local image = new("ImageLabel", {
        Size = UDim2.fromScale(1, 1),
        ScaleType = options.Fit and Enum.ScaleType.Fit or Enum.ScaleType.Crop,
        ZIndex = 1,
    }, frame)
    window:Corner(image, "RadCard")
    local loader = window:LoadImage(image, options.Image or options.Source, options.OnState, options.Timeout)
    local caption
    if options.Caption then
        local shade = window:Make("Frame", {
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.fromScale(0, 1),
            Size = UDim2.new(1, 0, 0, 40),
            BackgroundColor3 = Color3.new(0, 0, 0),
            BackgroundTransparency = 0.4,
            ZIndex = 2,
        }, frame)
        caption = window:Make("TextLabel", {
            Position = UDim2.fromOffset(12, 0),
            Size = UDim2.new(1, -24, 1, 0),
            Text = options.Caption,
            Font = "Semi",
            TextSize = metrics.Text + 1,
            TextColor3 = Color3.new(1, 1, 1),
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 3,
        }, shade)
    end
    local item = self:_track(frame, function()
        return options.Caption or ""
    end)
    return {
        Type = "Image",
        Window = window,
        SetImage = function(_, source)
            loader:Load(source)
        end,
        GetState = function()
            return loader.State
        end,
        SetCaption = function(_, text)
            if caption then
                caption.Text = text or ""
            end
        end,
        SetVisible = function(_, visible)
            item.Hidden = not visible
            item:Refresh()
        end,
        Destroy = function()
            loader:Destroy()
            self:_untrack(item)
            frame:Destroy()
        end,
    }
end

function Section:AddCard(options)
    options = options or {}
    local window = self.Window
    local metrics = window.Metrics
    local height = options.Height or metrics.CardHeight
    local imageShare = 0.42
    local buttonWidth = options.Button and (metrics.Touch and 92 or 76) or 0
    local frame = window:Glass(self.Content, "Card", {
        Name = "Card",
        Size = UDim2.new(1, 0, 0, height),
        LayoutOrder = self:_nextOrder(),
        ClipsDescendants = true,
    })
    window:Bind(frame, "BackgroundTransparency", "TransCardLift")
    if options.Build or options.Layout == "Custom" then
        local content = new("Frame", { Name = "CardContent", Size = UDim2.fromScale(1, 1) }, frame)
        addPadding(content, 10)
        addList(content, 6)
        if options.AutoHeight then
            frame.AutomaticSize = Enum.AutomaticSize.Y
            frame.Size = UDim2.new(1, 0, 0, 0)
            content.AutomaticSize = Enum.AutomaticSize.Y
            content.Size = UDim2.new(1, 0, 0, 0)
        end
        if options.Build then
            window:_safe("card build", options.Build, content, window)
        end
        local customItem = self:_track(frame, function()
            return (options.Title or "") .. " " .. (options.Description or "")
        end)
        return {
            Type = "Card",
            Window = window,
            Frame = frame,
            Content = content,
            SetVisible = function(_, visible)
                customItem.Hidden = not visible
                customItem:Refresh()
            end,
            Destroy = function()
                self:_untrack(customItem)
                frame:Destroy()
            end,
        }
    end
    local image = new("ImageLabel", {
        Size = UDim2.fromScale(imageShare, 1),
        ScaleType = Enum.ScaleType.Crop,
    }, frame)
    window:Corner(image, "RadCard")
    local loader = window:LoadImage(image, options.Image, options.OnState, options.Timeout)
    local fade = window:Make("Frame", {
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(imageShare, 0, 0, 0),
        Size = UDim2.new(0, 70, 1, 0),
        BackgroundColor3 = Color3.new(1, 1, 1),
    }, frame)
    local fadeGradient = window:Gradient(fade, "Surface", "Surface", 0)
    fadeGradient.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.05) })
    local text = new("Frame", {
        Position = UDim2.new(imageShare, 8, 0, 0),
        Size = UDim2.new(1 - imageShare, -20, 1, 0),
    }, frame)
    addPadding(text, 10, 0, 10, 0)
    addList(text, 3)
    window:Make("TextLabel", {
        Size = UDim2.new(1, 0, 0, metrics.Text + 6),
        Text = options.Title or "",
        Font = "Bold",
        TextSize = metrics.Text + 3,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        LayoutOrder = 1,
    }, text)
    window:Make("TextLabel", {
        Size = UDim2.new(1, 0, 0, (metrics.Small + 3) * 2),
        Text = options.Description or "",
        TextSize = metrics.Small,
        TextWrapped = true,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Muted = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        LayoutOrder = 2,
    }, text)
    if options.Tags and #options.Tags > 0 then
        local tagRow = new("Frame", { Size = UDim2.new(1, -(buttonWidth + 8), 0, 18), ClipsDescendants = true, LayoutOrder = 3 }, text)
        addList(tagRow, 6, Enum.FillDirection.Horizontal)
        for index, tag in ipairs(options.Tags) do
            local pill = window:Glass(tagRow, "Field", {
                Size = UDim2.fromOffset(0, 18),
                AutomaticSize = Enum.AutomaticSize.X,
                LayoutOrder = index,
            })
            window:Corner(pill, "RadPill")
            addPadding(pill, 0, 8, 0, 8)
            window:Make("TextLabel", {
                Size = UDim2.fromOffset(0, 18),
                AutomaticSize = Enum.AutomaticSize.X,
                Text = tag,
                TextSize = metrics.Small,
            }, pill)
        end
    end
    local button
    if options.Button then
        local holder = new("Frame", {
            AnchorPoint = Vector2.new(1, 1),
            Position = UDim2.new(1, -10, 1, -10),
            Size = UDim2.fromOffset(buttonWidth, metrics.ButtonHeight),
            ZIndex = 5,
        }, frame)
        local _, created = window:_createButtonRow(holder, {
            { Text = options.Button, Primary = true, Callback = options.Callback, NoBind = options.NoBind, Flag = options.Flag },
        }, 1, self)
        button = created[1]
    end
    local item = self:_track(frame, function()
        return (options.Title or "") .. " " .. (options.Description or "")
    end)
    return {
        Type = "Card",
        Window = window,
        Frame = frame,
        Button = button,
        SetImage = function(_, source)
            loader:Load(source)
        end,
        GetImageState = function()
            return loader.State
        end,
        SetVisible = function(_, visible)
            item.Hidden = not visible
            item:Refresh()
        end,
        Destroy = function()
            loader:Destroy()
            self:_untrack(item)
            frame:Destroy()
        end,
    }
end

function Section:AddChangelog(entries)
    local window = self.Window
    local metrics = window.Metrics
    local rowHeight = metrics.Small + 14
    local frame = new("Frame", {
        Name = "Changelog",
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = self:_nextOrder(),
    }, self.Content)
    addList(frame, 0)
    entries = entries or {}
    for index, entry in ipairs(entries) do
        local line = new("Frame", { Size = UDim2.new(1, 0, 0, rowHeight), LayoutOrder = index }, frame)
        window:Make("TextLabel", {
            Position = UDim2.fromOffset(2, 0),
            Size = UDim2.fromOffset(36, rowHeight),
            Text = entry.Version or "",
            Font = "Semi",
            TextSize = metrics.Text,
            TextXAlignment = Enum.TextXAlignment.Left,
        }, line)
        window:Make("TextLabel", {
            Position = UDim2.fromOffset(42, 0),
            Size = UDim2.new(1, -(42 + 62), 1, 0),
            Text = entry.Text or "",
            TextSize = metrics.Small,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
        }, line)
        window:Make("TextLabel", {
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.new(1, -2, 0, 0),
            Size = UDim2.fromOffset(60, rowHeight),
            Text = entry.Date or "",
            TextSize = metrics.Small - 1,
            Muted = true,
            TextXAlignment = Enum.TextXAlignment.Right,
        }, line)
        if index < #entries then
            window:Make("Frame", {
                AnchorPoint = Vector2.new(0, 1),
                Position = UDim2.fromScale(0, 1),
                Size = UDim2.new(1, 0, 0, 1),
            }, line, { BackgroundColor3 = "Outline", BackgroundTransparency = "TransStroke" })
        end
    end
    local item = self:_track(frame, nil)
    return {
        Type = "Changelog",
        Destroy = function()
            self:_untrack(item)
            frame:Destroy()
        end,
    }
end

function Section:AddPromo(options)
    options = options or {}
    local window = self.Window
    local metrics = window.Metrics
    local height = options.Height or (metrics.Touch and 112 or 118)
    local frame = window:Glass(self.Content, "Card", {
        Name = "Promo",
        Size = UDim2.new(1, 0, 0, height),
        LayoutOrder = self:_nextOrder(),
        ClipsDescendants = true,
    })
    local art = new("Frame", { Name = "Art", Size = UDim2.fromScale(1, 1), ClipsDescendants = true }, frame)
    window:_createLiquid(art, LIQUID_PROMO, { Page = self.Tab.Page })
    for _, rotation in ipairs({ 0, 90 }) do
        local shade = new("Frame", {
            Name = "Shade",
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.new(0, 0, 0),
            ZIndex = 2,
        }, art)
        new("UIGradient", {
            Rotation = rotation,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.5, 0.55),
                NumberSequenceKeypoint.new(1, 1),
            }),
        }, shade)
    end
    local content = new("Frame", { Name = "Content", Size = UDim2.fromScale(1, 1), ZIndex = 3 }, frame)
    local layout = addList(content, 4)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.VerticalAlignment = Enum.VerticalAlignment.Center
    local logo = window:Make("Frame", {
        Size = UDim2.fromOffset(34, 34),
        BackgroundColor3 = Color3.new(1, 1, 1),
        LayoutOrder = 1,
    }, content)
    window:Corner(logo, "RadControl")
    window:Gradient(logo, "Accent", "AccentAlt", 45)
    local letter = window:Make("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        Text = string.upper(string.sub(window.Title, 1, 1)),
        Font = "Bold",
        TextSize = 18,
        Color = "OnAccent",
    }, logo)
    local image = new("ImageLabel", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(20, 20),
        ImageColor3 = Color3.new(1, 1, 1),
    }, logo)
    window:ApplyIcon(image, options.Icon or window.Icon or "sparkles", nil, function()
        letter.Visible = false
    end)
    window:Make("TextLabel", {
        Size = UDim2.new(0.86, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Text = options.Title or "Built for a better experience.",
        Font = "Semi",
        TextSize = metrics.Text + 1,
        TextWrapped = true,
        LayoutOrder = 2,
    }, content)
    window:Make("TextLabel", {
        Size = UDim2.new(0.86, 0, 0, metrics.Small + 4),
        Text = options.Subtitle or window.Title,
        TextSize = metrics.Small,
        Muted = true,
        LayoutOrder = 3,
    }, content)
    local item = self:_track(frame, nil)
    return {
        Type = "Promo",
        SetVisible = function(_, visible)
            item.Hidden = not visible
            item:Refresh()
        end,
        Destroy = function()
            self:_untrack(item)
            frame:Destroy()
        end,
    }
end

function Section:AddKeybind(options)
    options = options or {}
    local row = createRow(self, options)
    local keybind = self.Window:_createKeybind(row, options)
    keybind.OwnsRow = true
    row.OnTap = function()
        keybind.Window:_listen(keybind)
    end
    return keybind
end

function Section:AddColorPicker(options)
    options = options or {}
    local row = createRow(self, options)
    local picker = self.Window:_createColor(row, options)
    picker.OwnsRow = true
    row.OnTap = function()
        picker:Toggle()
    end
    return picker
end

function Window:_createKeybind(row, options)
    local metrics = self.Metrics
    local keybind = {
        Type = "Keybind",
        Window = self,
        Row = row,
        Mode = options.Mode or "Press",
        State = false,
        Key = nil,
        Value = nil,
        Callback = options.Callback,
        _listeners = {},
        _changed = {},
        AllowDuplicate = options.AllowDuplicate == true,
    }
    if options.OnChanged then
        table.insert(keybind._changed, options.OnChanged)
    end
    local button = self:_fieldButton({
        Name = "Keybind",
        Size = UDim2.fromOffset(0, metrics.ControlHeight),
        AutomaticSize = Enum.AutomaticSize.X,
        Text = "None",
        TextSize = metrics.Text - 1,
    })
    addPadding(button, 0, 9, 0, 9)
    new("UISizeConstraint", { MinSize = Vector2.new(metrics.Touch and 58 or 48, 0) }, button)
    attachControl(row, button)
    keybind.Button = button
    local function render()
        local listening = self._listening == keybind
        button.Text = listening and "..." or keyToText(keybind.Key)
        self:Bind(button, "TextColor3", listening and "AccentText" or "Text")
    end
    keybind._render = render
    function keybind:SetKey(key, silent)
        if key ~= nil and typeof(key) ~= "EnumItem" then
            key = nil
        end
        self.Key = key
        self.Value = key
        self.State = false
        render()
        self.Window:_emit("BindsChanged")
        if not silent then
            for _, listener in ipairs(self._changed) do
                task.spawn(listener, key)
            end
            self.Window:_queueAutoSave()
        end
    end
    function keybind:OnChanged(listener)
        table.insert(self._changed, listener)
        return self
    end
    function keybind:Serialize()
        return serializeKey(self.Key)
    end
    function keybind:Deserialize(value)
        self:SetKey(deserializeKey(value))
    end
    function keybind:SetVisible(visible)
        if self.OwnsRow then
            row.Item.Hidden = not visible
            row.Item:Refresh()
        else
            button.Visible = visible
        end
    end
    function keybind:SetDisabled(disabled)
        setRowDisabled(row, disabled)
    end
    function keybind:SetText(text)
        if row.Title then
            row.Title.Text = text
        end
    end
    function keybind:Destroy()
        local index = table.find(self.Window._keybinds, self)
        if index then
            table.remove(self.Window._keybinds, index)
            self.Window:_emit("BindsChanged")
        end
        if self.Flag then
            self.Window.Flags[self.Flag] = nil
        end
        self.Window:_unregisterCommand(self)
        if self.OwnsRow then
            row.Section:_untrack(row.Item)
            row.Frame:Destroy()
        else
            button:Destroy()
        end
    end
    self:Connect(button.Activated, function()
        self:_listen(keybind)
    end)
    table.insert(self._keybinds, keybind)
    keybind.DefaultValue = options.Default
    function keybind:Reset()
        self:SetKey(self.DefaultValue)
    end
    if options.Default then
        keybind:SetKey(options.Default, true)
    else
        render()
    end
    return self:_register(keybind, options)
end

function Window:_createColor(row, options)
    local metrics = self.Metrics
    local default = options.Default or Color3.fromRGB(255, 255, 255)
    local picker = {
        Type = "ColorPicker",
        Window = self,
        Row = row,
        Value = default,
        Callback = options.Callback,
        _listeners = {},
    }
    local hue, saturation, value = default:ToHSV()
    local swatch = new("TextButton", {
        Name = "Swatch",
        Size = UDim2.fromOffset(metrics.SwatchWidth, metrics.SwatchHeight),
        BackgroundColor3 = default,
    }, nil)
    self:Corner(swatch, "RadControl")
    self:Stroke(swatch)
    attachControl(row, swatch)
    picker.Button = swatch
    local pad = metrics.Touch and 7 or 8
    local popupWidth = metrics.PopupWidth
    local popupHeight = pad * 2 + metrics.ControlHeight * 2 + metrics.BarHeight * 3 + pad * 4
    local popup = self:_makePopup("ColorPopup")
    addPadding(popup, pad)
    addList(popup, pad)
    local header = new("Frame", { Name = "Header", Size = UDim2.new(1, 0, 0, metrics.ControlHeight), LayoutOrder = 1 }, popup)
    local previewWidth = math.floor(metrics.ControlHeight * 1.7)
    local preview = new("Frame", { Name = "Preview", Size = UDim2.new(0, previewWidth, 1, 0), ClipsDescendants = true }, header)
    self:Corner(preview, "RadControl")
    self:Stroke(preview)
    local previewOld = new("Frame", { Name = "Old", Size = UDim2.fromScale(0.5, 1), BackgroundColor3 = default }, preview)
    local previewNew = new("Frame", { Name = "New", Position = UDim2.fromScale(0.5, 0), Size = UDim2.fromScale(0.5, 1), BackgroundColor3 = default }, preview)
    local hexBox = self:Make("TextBox", {
        Name = "Hex",
        Position = UDim2.fromOffset(previewWidth + 6, 0),
        Size = UDim2.new(1, -(previewWidth + 6), 1, 0),
        PlaceholderText = "#RRGGBB",
        TextSize = metrics.Text - 1,
    }, header, { BackgroundColor3 = "SurfaceAlt", BackgroundTransparency = "TransField", PlaceholderColor3 = "Muted" })
    self:Corner(hexBox, "RadControl")
    self:Stroke(hexBox)
    local rgbRow = new("Frame", { Name = "RGB", Size = UDim2.new(1, 0, 0, metrics.ControlHeight), LayoutOrder = 2 }, popup)
    addList(rgbRow, 6, Enum.FillDirection.Horizontal)
    local rgbBoxes = {}
    for index, letter in ipairs({ "R", "G", "B" }) do
        local channel = self:Make("TextBox", {
            Name = letter,
            Size = UDim2.new(1 / 3, -4, 1, 0),
            PlaceholderText = letter,
            TextSize = metrics.Text - 1,
            LayoutOrder = index,
        }, rgbRow, { BackgroundColor3 = "SurfaceAlt", BackgroundTransparency = "TransField", PlaceholderColor3 = "Muted" })
        self:Corner(channel, "RadControl")
        self:Stroke(channel)
        rgbBoxes[index] = channel
    end
    local function createBar(order)
        local bar = new("Frame", {
            Size = UDim2.new(1, 0, 0, metrics.BarHeight),
            LayoutOrder = order,
            BackgroundColor3 = Color3.new(1, 1, 1),
        }, popup)
        self:Corner(bar, "RadPill")
        local gradient = new("UIGradient", {}, bar)
        local marker = new("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.new(0, 6, 1, 6),
            BackgroundColor3 = Color3.new(1, 1, 1),
            ZIndex = 3,
        }, bar)
        self:Corner(marker, "RadPill")
        new("UIStroke", { Color = Color3.new(0, 0, 0), Thickness = 1, Transparency = 0.3 }, marker)
        local hit = new("TextButton", {
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.new(1, 0, 1, 10),
            ZIndex = 4,
        }, bar)
        return bar, gradient, marker, hit
    end
    local hueBar, hueGradient, hueMarker, hueHit = createBar(3)
    local saturationBar, saturationGradient, saturationMarker, saturationHit = createBar(4)
    local valueBar, valueGradient, valueMarker, valueHit = createBar(5)
    hueGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(1 / 6, Color3.fromRGB(255, 255, 0)),
        ColorSequenceKeypoint.new(2 / 6, Color3.fromRGB(0, 255, 0)),
        ColorSequenceKeypoint.new(3 / 6, Color3.fromRGB(0, 255, 255)),
        ColorSequenceKeypoint.new(4 / 6, Color3.fromRGB(0, 0, 255)),
        ColorSequenceKeypoint.new(5 / 6, Color3.fromRGB(255, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0)),
    })
    local function updateVisuals()
        local current = Color3.fromHSV(hue, saturation, value)
        picker.Value = current
        swatch.BackgroundColor3 = current
        hueMarker.Position = UDim2.fromScale(hue, 0.5)
        saturationMarker.Position = UDim2.fromScale(saturation, 0.5)
        valueMarker.Position = UDim2.fromScale(value, 0.5)
        saturationGradient.Color = ColorSequence.new(Color3.fromHSV(hue, 0, value), Color3.fromHSV(hue, 1, value))
        valueGradient.Color = ColorSequence.new(Color3.new(0, 0, 0), Color3.fromHSV(hue, saturation, 1))
        previewNew.BackgroundColor3 = current
        if not hexBox:IsFocused() then
            hexBox.Text = "#" .. current:ToHex():upper()
        end
        local channels = { current.R, current.G, current.B }
        for index, channel in ipairs(rgbBoxes) do
            if not channel:IsFocused() then
                channel.Text = tostring(math.floor(channels[index] * 255 + 0.5))
            end
        end
    end
    local function bindBar(hit, bar, apply)
        self:_trackDrag(hit, function(input)
            local width = bar.AbsoluteSize.X
            if width <= 0 then
                return
            end
            apply(math.clamp((input.Position.X - bar.AbsolutePosition.X) / width, 0, 1))
            updateVisuals()
            fire(picker, picker.Value)
        end)
    end
    bindBar(hueHit, hueBar, function(ratio)
        hue = ratio
    end)
    bindBar(saturationHit, saturationBar, function(ratio)
        saturation = ratio
    end)
    bindBar(valueHit, valueBar, function(ratio)
        value = ratio
    end)
    function picker:Set(color, silent)
        if typeof(color) ~= "Color3" then
            return
        end
        hue, saturation, value = color:ToHSV()
        updateVisuals()
        self.Value = color
        swatch.BackgroundColor3 = color
        if not silent then
            fire(self, color)
        end
    end
    function picker:Serialize()
        return self.Value:ToHex()
    end
    function picker:Deserialize(text)
        if type(text) ~= "string" then
            return
        end
        local cleaned = text:gsub("#", "")
        local ok, parsed = pcall(Color3.fromHex, "#" .. cleaned)
        if ok and typeof(parsed) == "Color3" then
            self:Set(parsed)
        end
    end
    function picker:OnChanged(listener)
        table.insert(self._listeners, listener)
        return self
    end
    function picker:SetVisible(visible)
        if self.OwnsRow then
            row.Item.Hidden = not visible
            row.Item:Refresh()
        else
            swatch.Visible = visible
        end
    end
    function picker:SetDisabled(disabled)
        setRowDisabled(row, disabled)
    end
    function picker:SetText(text)
        if row.Title then
            row.Title.Text = text
        end
    end
    function picker:Destroy()
        if self.Flag then
            self.Window.Flags[self.Flag] = nil
        end
        self.Window:_unregisterCommand(self)
        self.Window:_destroyPopup(popup)
        if self.OwnsRow then
            row.Section:_untrack(row.Item)
            row.Frame:Destroy()
        else
            swatch:Destroy()
        end
    end
    for index, channel in ipairs(rgbBoxes) do
        self:Connect(channel.FocusLost, function()
            local typed = tonumber(channel.Text)
            if typed then
                local parts = {
                    math.floor(picker.Value.R * 255 + 0.5),
                    math.floor(picker.Value.G * 255 + 0.5),
                    math.floor(picker.Value.B * 255 + 0.5),
                }
                parts[index] = math.clamp(math.floor(typed + 0.5), 0, 255)
                picker:Set(Color3.fromRGB(parts[1], parts[2], parts[3]))
                return
            end
            updateVisuals()
        end)
    end
    self:Connect(hexBox.FocusLost, function()
        local text = hexBox.Text:gsub("#", ""):gsub("%s", "")
        if #text == 3 and text:match("^%x+$") then
            text = text:gsub(".", "%0%0")
        end
        if #text == 6 and text:match("^%x+$") then
            local ok, parsed = pcall(Color3.fromHex, "#" .. text)
            if ok and typeof(parsed) == "Color3" then
                picker:Set(parsed)
                return
            end
        end
        updateVisuals()
    end)
    function picker:Toggle()
        if self.Window._popup == popup then
            self.Window:_closePopup()
            return
        end
        previewOld.BackgroundColor3 = self.Value
        self.Window:_showPopup(popup, swatch, Vector2.new(popupWidth, popupHeight), self.Window:_useSheet())
    end
    self:Connect(swatch.Activated, function()
        picker:Toggle()
    end)
    updateVisuals()
    picker.Value = default
    picker.DefaultValue = default
    function picker:Reset()
        self:Set(self.DefaultValue)
    end
    swatch.BackgroundColor3 = default
    return self:_register(picker, options)
end

function Window:_buildTerminal(body)
    local metrics = self.Metrics
    local terminal = self:Glass(body, "Panel", {
        Name = "Terminal",
        AnchorPoint = Vector2.new(1, 0),
        Visible = false,
    })
    self:Bind(terminal, "BackgroundTransparency", "TransTerminal")
    self.Terminal = terminal
    local mono = { FontFace = "FontMono" }
    local monoSemi = { FontFace = "FontMonoSemi" }
    local header = new("Frame", { Name = "Header", Size = UDim2.new(1, 0, 0, 30) }, terminal)
    self:Make("TextLabel", {
        Position = UDim2.fromOffset(10, 0),
        Size = UDim2.new(1, -80, 1, 0),
        Text = "* perplexity terminal",
        TextSize = metrics.Small + 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Color = "Accent",
    }, header, monoSemi)
    self._caret = self:Make("TextLabel", {
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -10, 0, 0),
        Size = UDim2.fromOffset(16, 30),
        Text = "_",
        TextSize = metrics.Small + 3,
        Color = "Accent",
    }, header, monoSemi)
    self:Make("Frame", {
        Position = UDim2.new(0, 8, 0, 30),
        Size = UDim2.new(1, -16, 0, 1),
    }, terminal, { BackgroundColor3 = "Outline", BackgroundTransparency = "TransStroke" })
    self.CommandScroll = self:Make("ScrollingFrame", {
        Name = "Commands",
        Position = UDim2.fromOffset(8, 34),
        Size = UDim2.new(1, -16, 0.4, -12),
        CanvasSize = UDim2.new(),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        ScrollBarThickness = metrics.ScrollBar,
    }, terminal, { ScrollBarImageColor3 = "Accent" })
    addList(self.CommandScroll, 1)
    self:Make("Frame", {
        Position = UDim2.new(0, 8, 0.4, 24),
        Size = UDim2.new(1, -16, 0, 1),
    }, terminal, { BackgroundColor3 = "Outline", BackgroundTransparency = "TransStroke" })
    self:Make("TextLabel", {
        Position = UDim2.new(0, 10, 0.4, 4),
        Size = UDim2.new(1, -20, 0, 18),
        Text = "output",
        TextSize = metrics.Small,
        Muted = true,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, terminal, mono)
    self.LogScroll = self:Make("ScrollingFrame", {
        Name = "Log",
        Position = UDim2.new(0, 8, 0.4, 30),
        Size = UDim2.new(1, -16, 0.6, -(30 + 42)),
        CanvasSize = UDim2.new(),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        ScrollBarThickness = metrics.ScrollBar,
    }, terminal, { ScrollBarImageColor3 = "Accent" })
    addList(self.LogScroll, 2)
    local prompt = self:Glass(terminal, "Field", {
        Name = "Prompt",
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.new(0, 8, 1, -8),
        Size = UDim2.new(1, -16, 0, metrics.ControlHeight + 6),
    })
    self:Make("TextLabel", {
        Position = UDim2.fromOffset(8, 0),
        Size = UDim2.fromOffset(14, metrics.ControlHeight + 6),
        Text = ">",
        TextSize = metrics.Text,
        Color = "Accent",
    }, prompt, monoSemi)
    self.PromptBox = self:Make("TextBox", {
        Position = UDim2.fromOffset(24, 0),
        Size = UDim2.new(1, -30, 1, 0),
        PlaceholderText = "/help",
        TextSize = metrics.Small + 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        ClipsDescendants = true,
    }, prompt, { FontFace = "FontMono", PlaceholderColor3 = "Muted" })
    self:Connect(self.PromptBox.FocusLost, function(enterPressed)
        local text = self.PromptBox.Text
        self.PromptBox.Text = ""
        if enterPressed and text ~= "" then
            self:RunCommand(text)
            if not metrics.Touch then
                self.PromptBox:CaptureFocus()
            end
        end
    end)
    local bannerShown = false
    self._terminalBanner = function()
        if bannerShown then
            return
        end
        bannerShown = true
        self:TerminalPrint("* Welcome to " .. self.Title .. "!", "Accent")
        self:TerminalPrint("  v" .. Library.Version .. "  " .. Library.Author, "Muted")
        self:TerminalPrint("  /help for commands, /list shows every feature", "Muted")
    end
    self:_onStyle("terminal", function()
        for _, entry in ipairs(self.CommandOrder) do
            self:_refreshCommand(entry)
        end
    end)
end

function Window:TerminalPrint(text, tone, rich)
    local scroll = self.LogScroll
    if not scroll or self.Destroyed then
        return
    end
    local token = TEXT_TONES[tone or "Text"] or "Text"
    local content = rich and text or tostring(text)
    local line = self:Make("TextLabel", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Text = content,
        TextSize = self.Metrics.Small + 1,
        TextWrapped = true,
        RichText = rich == true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        LayoutOrder = self._logCount,
    }, scroll, { FontFace = "FontMono", TextColor3 = token })
    self._logCount = self._logCount + 1
    table.insert(self._logLines, line)
    if #self._logLines > 140 then
        local oldest = table.remove(self._logLines, 1)
        oldest:Destroy()
    end
    if self.Effects.Typewriter and not rich then
        local total = utf8.len(content) or #content
        if total > 1 then
            line.MaxVisibleGraphemes = 0
            task.spawn(function()
                local step = math.max(1, math.floor(total / 22))
                local shown = step
                while shown < total and line.Parent do
                    line.MaxVisibleGraphemes = shown
                    task.wait(0.012)
                    shown = shown + step
                end
                if line.Parent then
                    line.MaxVisibleGraphemes = -1
                end
            end)
        end
    end
    task.defer(function()
        if scroll.Parent then
            scroll.CanvasPosition = Vector2.new(0, 100000)
        end
    end)
    return line
end

function Window:TerminalClear()
    for _, line in ipairs(self._logLines) do
        line:Destroy()
    end
    self._logLines = {}
end

function Window:_describe(element)
    local kind = element.Type
    if kind == "Toggle" then
        return element.Value and "on" or "off"
    elseif kind == "Slider" then
        return tostring(element.Value)
    elseif kind == "Dropdown" then
        if element.Multi then
            return #element.Value > 0 and table.concat(element.Value, ", ") or "none"
        end
        return tostring(element.Value or "none")
    elseif kind == "TextBox" then
        return '"' .. tostring(element.Value) .. '"'
    elseif kind == "ColorPicker" then
        return "#" .. element.Value:ToHex()
    elseif kind == "Keybind" then
        return keyToText(element.Key)
    elseif kind == "ProgressBar" then
        return element.Indeterminate and "working" or (math.floor(element:GetRatio() * 100 + 0.5) .. "%")
    elseif kind == "Status" then
        return tostring(element.Text)
    end
    return "run"
end

function Window:_commandText(entry)
    local accent = hexOf(self.Tokens.AccentText)
    local muted = hexOf(self.Tokens.Muted)
    local state = escapeRich(self:_describe(entry.Element))
    if #state > 18 then
        state = string.sub(state, 1, 17) .. "~"
    end
    return string.format('<font color="%s">/%s</font>  <font color="%s">%s</font>', accent, escapeRich(entry.Name), muted, state)
end

function Window:_refreshCommand(entry)
    if entry.Button then
        entry.Button.Text = self:_commandText(entry)
    end
end

function Window:_indexFeature(element, options)
    local row = element.Row
    local section = (row and row.Section) or element.Section
    local tab = section and section.Tab
    local text = tostring(options.Text or options.Title or options.Flag or element.Type or "Feature")
    local feature = {
        Element = element,
        Section = section,
        Tab = tab,
        Text = text,
        Description = options.Description,
        Keywords = options.Keywords,
        Type = element.Type,
        Flag = options.Flag,
        Icon = options.Icon,
        Id = options.Flag or ((tab and tab.Title or "") .. "/" .. (section and section.Title or "") .. "/" .. text),
    }
    element._feature = feature
    table.insert(self._features, feature)
    self:_queue("Favorites")
    return feature
end

function Window:_unindexFeature(element)
    local feature = element._feature
    if feature then
        local index = table.find(self._features, feature)
        if index then
            table.remove(self._features, index)
        end
        element._feature = nil
        self:_queue("Favorites")
    end
end

function Window:_rebuildFavorites()
    if self._favoritesRefresh then
        self._favoritesRefresh()
    end
end

function Window:_buildFavorites()
    local tab = self:_createTab({ Title = "Favorites", Icon = "star" }, true)
    self.FavoritesTab = tab
    local section = tab:AddSection({ Title = "Pinned", Collapsible = false })
    self._favSection = section
    section:AddParagraph({
        Text = "Pin a feature with the star in the command palette, a middle click, or press and hold on touch. Pinned items keep their live state here.",
    })
    tab:SetHidden(true)
    self._favoritesRefresh = function()
        self:_syncFavorites()
    end
end

function Window:_makeFavorite(feature)
    local section = self._favSection
    local metrics = self.Metrics
    local place = feature.Tab and feature.Tab.Title or ""
    if feature.Section and feature.Section.Title and feature.Section.Title ~= "" then
        place = place .. " / " .. feature.Section.Title
    end
    local row = createRow(section, { Text = feature.Text, Description = place })
    local element = extendElement({ Type = "Favorite", Window = self }, row)
    local entry = { Feature = feature, Row = row, Element = element }
    local unpin = self:Make("TextButton", {
        Name = "Unpin",
        Size = UDim2.fromOffset(metrics.ControlHeight - 4, metrics.ControlHeight - 4),
        Text = "x",
        Font = "Semi",
        TextSize = metrics.Text,
        Muted = true,
    }, nil)
    attachControl(row, unpin)
    local chip = self:Make("TextButton", {
        Name = "State",
        Size = UDim2.fromOffset(0, metrics.ControlHeight - 4),
        AutomaticSize = Enum.AutomaticSize.X,
        Font = "Semi",
        TextSize = metrics.Small + 1,
    }, nil, { BackgroundColor3 = "SurfaceAlt" })
    self:Corner(chip, "RadPill")
    addPadding(chip, 0, 10, 0, 10)
    attachControl(row, chip)
    local value = self:Make("TextLabel", {
        Name = "Value",
        Size = UDim2.fromOffset(0, metrics.ControlHeight - 4),
        AutomaticSize = Enum.AutomaticSize.X,
        TextSize = metrics.Small + 1,
        Muted = true,
    }, nil)
    attachControl(row, value)
    entry.Chip, entry.Value = chip, value
    row.OnTap = function()
        self:GoTo(feature)
    end
    self:Connect(unpin.Activated, function()
        self:Unpin(feature)
    end)
    self:Connect(chip.Activated, function()
        local target = feature.Element
        if target.Type == "Toggle" then
            target:Set(not target.Value)
        elseif target.Type == "Button" then
            target:Trigger()
        end
    end)
    return entry
end

function Window:_updateFavorite(entry)
    local target = entry.Feature.Element
    local text, actionable = self:_paletteChip(target)
    entry.Chip.Visible = actionable == true
    entry.Value.Visible = actionable ~= true and text ~= nil
    if actionable then
        entry.Chip.Text = text
        local lit = target.Type == "Button" or target.Value == true
        self:Bind(entry.Chip, "TextColor3", lit and "AccentText" or "Muted")
        self:Bind(entry.Chip, "BackgroundColor3", lit and "Accent" or "SurfaceAlt")
        entry.Chip.BackgroundTransparency = lit and 0.82 or 0.35
    elseif text then
        entry.Value.Text = text
    end
end

function Window:_dropFavorite(id)
    local entry = self._favRows[id]
    if not entry then
        return
    end
    self._favRows[id] = nil
    entry.Element:Destroy()
end

function Window:_syncFavorites()
    if self.Destroyed or not self._favSection then
        return
    end
    local pinned = {}
    for _, element in ipairs(self:GetPinned()) do
        if element._feature then
            table.insert(pinned, element._feature)
        end
    end
    local wanted = {}
    for index, feature in ipairs(pinned) do
        wanted[feature.Id] = true
        local entry = self._favRows[feature.Id]
        if entry and entry.Feature ~= feature then
            self:_dropFavorite(feature.Id)
            entry = nil
        end
        if not entry then
            entry = self:_makeFavorite(feature)
            self._favRows[feature.Id] = entry
        end
        entry.Row.Frame.LayoutOrder = 100 + index
        self:_updateFavorite(entry)
    end
    local stale = {}
    for id in pairs(self._favRows) do
        if not wanted[id] then
            table.insert(stale, id)
        end
    end
    for _, id in ipairs(stale) do
        self:_dropFavorite(id)
    end
    self.FavoritesTab:SetHidden(#pinned == 0)
end

function Window:_registerCommand(element, options)
    if options.Internal then
        if options.Searchable then
            self:_indexFeature(element, options)
        end
        return
    end
    self:_indexFeature(element, options)
    if not self.CommandScroll then
        return
    end
    local base = slug(options.Text or options.Title or options.Flag)
    local name = base
    local suffix = 2
    while self.Commands[name] do
        name = base .. "_" .. suffix
        suffix = suffix + 1
    end
    local entry = { Name = name, Element = element, Type = element.Type }
    self.Commands[name] = entry
    table.insert(self.CommandOrder, entry)
    element.CommandName = name
    element._commandEntry = entry
    entry.Button = self:Make("TextButton", {
        Name = name,
        Size = UDim2.new(1, 0, 0, self.Metrics.Small + 8),
        TextSize = self.Metrics.Small + 1,
        RichText = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = #self.CommandOrder,
    }, self.CommandScroll, { FontFace = "FontMono" })
    self:_refreshCommand(entry)
    self:Connect(entry.Button.Activated, function()
        local kind = element.Type
        if kind == "Toggle" or kind == "Button" then
            element:Trigger()
        else
            self.PromptBox.Text = "/" .. name .. " "
            if not self.Metrics.Touch then
                self.PromptBox:CaptureFocus()
            end
        end
    end)
end

function Window:_unregisterCommand(element)
    self:_unindexFeature(element)
    local entry = element._commandEntry
    if not entry then
        return
    end
    self.Commands[entry.Name] = nil
    local index = table.find(self.CommandOrder, entry)
    if index then
        table.remove(self.CommandOrder, index)
    end
    if entry.Button then
        entry.Button:Destroy()
    end
    element._commandEntry = nil
end

function Window:_register(element, options)
    local flag = options.Flag
    if flag ~= nil then
        if type(flag) ~= "string" or flag == "" then
            self:_reportError("Flag", "flag must be a non-empty string, got " .. typeof(flag))
            options.Flag = nil
        else
            local existing = self.Flags[flag]
            if existing and existing ~= element then
                self:_reportError("Flag", "duplicate flag '" .. flag .. "' replaced an earlier element")
            end
            if not string.match(flag, "^[%w_%.%-]+$") then
                warn("[Perplexity] flag '" .. flag .. "' should only use letters, numbers, _ . -")
            end
        end
    end
    element.Flag = options.Flag
    element.Internal = options.Internal == true
    if options.Flag then
        self.Flags[options.Flag] = element
        local pending = self._pending[options.Flag]
        if pending ~= nil then
            self._pending[options.Flag] = nil
            task.defer(function()
                pcall(element.Deserialize, element, pending)
            end)
        end
    end
    self:_registerCommand(element, options)
    return element
end

local PASSIVE_TYPES = { Keybind = true, ProgressBar = true, Status = true, DataTable = true }

function Window:_elementChanged(element, ...)
    if element.Type == nil or PASSIVE_TYPES[element.Type] then
        return
    end
    if element._feature and os.clock() >= self._quietUntil then
        self:_touchRecent(element._feature)
    end
    if element._feature and self._favRows then
        local favorite = self._favRows[element._feature.Id]
        if favorite then
            self:_updateFavorite(favorite)
        end
    end
    local entry = element._commandEntry
    if entry then
        self:_refreshCommand(entry)
    end
    if element.Flag then
        self:_queueAutoSave()
    end
    if entry then
        self._logTokens[element] = (self._logTokens[element] or 0) + 1
        local token = self._logTokens[element]
        local delay = element.Type == "Slider" and 0.45 or 0.05
        task.delay(delay, function()
            if self._logTokens[element] == token and not self.Destroyed then
                local detail = element.Type == "Button" and "executed" or ("-> " .. self:_describe(element))
                self:TerminalPrint("* /" .. entry.Name .. "  " .. detail, "Muted")
            end
        end)
    end
end

local function splitList(text)
    local parts = {}
    for part in string.gmatch(text, "[^,]+") do
        table.insert(parts, (part:gsub("^%s+", ""):gsub("%s+$", "")))
    end
    return parts
end

function Window:_runFeature(entry, argument)
    local element = entry.Element
    local kind = element.Type
    local lowered = string.lower(argument)
    if kind == "Toggle" then
        if lowered == "on" or lowered == "true" or lowered == "1" or lowered == "enable" then
            element:Set(true)
        elseif lowered == "off" or lowered == "false" or lowered == "0" or lowered == "disable" then
            element:Set(false)
        else
            element:Set(not element.Value)
        end
    elseif kind == "Button" then
        element:Trigger()
    elseif kind == "Slider" then
        local number = tonumber(argument)
        if not number then
            self:TerminalPrint("usage: /" .. entry.Name .. " <number>  (" .. element.Min .. " to " .. element.Max .. ")", "Danger")
            return
        end
        element:Set(number)
    elseif kind == "Dropdown" then
        local wanted = element.Multi and splitList(argument) or { argument }
        local matched = {}
        for _, text in ipairs(wanted) do
            for _, option in ipairs(element.Options) do
                if string.lower(option) == string.lower(text) then
                    table.insert(matched, option)
                end
            end
        end
        if #matched == 0 then
            self:TerminalPrint("options: " .. table.concat(element.Options, ", "), "Warning")
            return
        end
        element:Set(element.Multi and matched or matched[1])
    elseif kind == "TextBox" then
        element:Set(argument)
    elseif kind == "ColorPicker" then
        local cleaned = argument:gsub("#", "")
        local ok, color = pcall(Color3.fromHex, "#" .. cleaned)
        if not ok then
            self:TerminalPrint("usage: /" .. entry.Name .. " #RRGGBB", "Danger")
            return
        end
        element:Set(color)
    elseif kind == "Keybind" then
        element:SetKey(keyFromName(argument))
    end
    self:TerminalPrint("ok  /" .. entry.Name .. "  " .. self:_describe(element), "Success")
end

local PALETTE_LIMIT = 40
local PALETTE_PAD = 6
local PALETTE_ORDER = { Action = 1, Feature = 2, Tab = 3, Category = 4, Section = 5 }
local PALETTE_GLYPH = {
    Toggle = "T", Slider = "S", Dropdown = "D", Button = "B", TextBox = "I", Keybind = "K", ColorPicker = "C",
    Paragraph = "P", ProgressBar = "%", Status = "*", Tab = ">", Category = "#", Section = "=", Action = "!",
}

local function fuzzyScore(token, text)
    if text == nil or text == "" then
        return nil
    end
    local lowered = string.lower(text)
    local start = string.find(lowered, token, 1, true)
    if start then
        local score = 120 - math.min(start, 60)
        if start == 1 then
            score = score + 60
        elseif string.find(string.sub(lowered, start - 1, start - 1), "[%s%-_/%.>:]") then
            score = score + 30
        end
        if #lowered == #token then
            score = score + 60
        end
        return score
    end
    if #token < 3 then
        return nil
    end
    local lead = string.sub(token, 1, 1)
    local first
    local from = 1
    while true do
        local found = string.find(lowered, lead, from, true)
        if not found then
            return nil
        end
        if found == 1 or string.find(string.sub(lowered, found - 1, found - 1), "[%s%-_/%.>:]") then
            first = found
            break
        end
        from = found + 1
    end
    local index, run, bonus, gaps = first + 1, 0, 0, 0
    for position = 2, #token do
        local found = string.find(lowered, string.sub(token, position, position), index, true)
        if not found then
            return nil
        end
        if found == index then
            run = run + 1
            bonus = bonus + run * 4
        else
            run = 0
            gaps = gaps + (found - index)
        end
        index = found + 1
    end
    if gaps > #token * 3 then
        return nil
    end
    return math.max(5, 40 + bonus - gaps)
end

local function highlightText(text, tokens, accent)
    local lowered = string.lower(text)
    local marks = {}
    for _, token in ipairs(tokens) do
        local from, to = string.find(lowered, token, 1, true)
        if from then
            table.insert(marks, { from, to })
        end
    end
    if #marks == 0 then
        return escapeRich(text)
    end
    table.sort(marks, function(a, b)
        return a[1] < b[1]
    end)
    local merged = { marks[1] }
    for index = 2, #marks do
        local last = merged[#merged]
        if marks[index][1] <= last[2] + 1 then
            last[2] = math.max(last[2], marks[index][2])
        else
            table.insert(merged, marks[index])
        end
    end
    local out, cursor = {}, 1
    for _, mark in ipairs(merged) do
        if mark[1] > cursor then
            table.insert(out, escapeRich(string.sub(text, cursor, mark[1] - 1)))
        end
        table.insert(out, '<font color="' .. accent .. '">' .. escapeRich(string.sub(text, mark[1], mark[2])) .. "</font>")
        cursor = mark[2] + 1
    end
    if cursor <= #text then
        table.insert(out, escapeRich(string.sub(text, cursor)))
    end
    return table.concat(out)
end

local function keywordText(value)
    if type(value) == "table" then
        return table.concat(value, " ")
    end
    return value ~= nil and tostring(value) or nil
end

function Window:_modifierDown()
    for _, name in ipairs({ "LeftControl", "RightControl", "LeftMeta", "RightMeta" }) do
        local ok, down = pcall(function()
            return UserInputService:IsKeyDown(Enum.KeyCode[name])
        end)
        if ok and down then
            return true
        end
    end
    return false
end

function Window:_shiftDown()
    for _, name in ipairs({ "LeftShift", "RightShift" }) do
        local ok, down = pcall(function()
            return UserInputService:IsKeyDown(Enum.KeyCode[name])
        end)
        if ok and down then
            return true
        end
    end
    return false
end

function Window:AddAction(options)
    if type(options) == "string" then
        options = { Text = options }
    end
    options = options or {}
    local text = tostring(options.Text or options.Title or options.Name or "Action")
    local action = {
        Window = self,
        Text = text,
        Description = options.Description,
        Keywords = options.Keywords,
        Callback = options.Callback,
        Builtin = options.Builtin == true,
        Id = options.Id or ("action:" .. string.lower(text)),
    }
    for index, other in ipairs(self._actions) do
        if other.Id == action.Id then
            table.remove(self._actions, index)
            break
        end
    end
    function action:Run()
        self.Window:_runAction(self)
    end
    function action:Remove()
        local list = self.Window._actions
        local index = table.find(list, self)
        if index then
            table.remove(list, index)
        end
    end
    table.insert(self._actions, action)
    return action
end

function Window:RemoveAction(id)
    for index, action in ipairs(self._actions) do
        if action.Id == id or action.Id == "action:" .. string.lower(tostring(id)) or action == id then
            table.remove(self._actions, index)
            return true
        end
    end
    return false
end

function Window:GetActions()
    return table.clone(self._actions)
end

function Window:_runAction(action)
    if self.Destroyed then
        return
    end
    self:_safe("action " .. action.Text, action.Callback, self, action)
    self:_emit("ActionRun", action)
end

function Window:_registerDefaultActions()
    local function add(text, description, keywords, callback)
        self:AddAction({ Text = text, Description = description, Keywords = keywords, Callback = callback, Builtin = true })
    end
    add("Save config", "Write the current values to the active config", "store write", function()
        self:FastSave()
    end)
    add("Toggle terminal", "Show or hide the command terminal", "console commands", function()
        self:SetTerminalVisible(not self.TerminalVisible)
    end)
    add("Show notifications", "Open the notification list", "bell history", function()
        self:ToggleNotifications()
    end)
    add("Open settings", "Theme, effects and behavior", "appearance preferences options", function()
        self:GoTo(self.SettingsTab)
    end)
    add("Open about", "Version and changelog", "info credits", function()
        self:GoTo(self.AboutTab)
    end)
    add("Clear recent", "Forget recently used features", "history reset", function()
        self:ClearRecent()
    end)
    add("Hide window", "Close the window", "close minimize", function()
        self:SetVisible(false)
    end)
end

function Window:_featureVisible(feature)
    local element = feature.Element
    local row = element and element.Row
    if row and row.Item and row.Item.Hidden then
        return false
    end
    local tab = feature.Tab
    if tab and tab.Hidden then
        return false
    end
    local section = feature.Section
    if section and (section.Hidden or (section.Category and section.Category.Hidden)) then
        return false
    end
    return true
end

function Window:_paletteChip(element)
    local kind = element.Type
    if kind == "Toggle" then
        return element.Value and "On" or "Off", true
    elseif kind == "Button" then
        return "Run", true
    elseif kind == "Slider" or kind == "Dropdown" or kind == "ColorPicker" or kind == "Keybind" or kind == "TextBox" then
        local text = self:_describe(element)
        if #text > 12 then
            text = string.sub(text, 1, 11) .. "~"
        end
        return text, false
    end
    return nil, false
end

function Window:_paletteFeatureEntry(feature)
    local tab = feature.Tab
    local section = feature.Section
    local place = tab and tab.Title or ""
    if section and section.Title and section.Title ~= "" then
        place = place .. " / " .. section.Title
    end
    return {
        Kind = "Feature",
        Feature = feature,
        Title = feature.Text,
        Sub = place,
        Glyph = PALETTE_GLYPH[feature.Type] or "-",
    }
end

function Window:_paletteResults(raw)
    local text = tostring(raw or "")
    local mode
    local lead = string.sub(text, 1, 1)
    if lead == ">" or lead == "@" or lead == "#" then
        mode = lead
        text = string.sub(text, 2)
    end
    text = string.lower((text:gsub("^%s+", ""):gsub("%s+$", "")))
    local tokens = {}
    for word in string.gmatch(text, "%S+") do
        table.insert(tokens, word)
    end
    local entries = {}
    local sequence = 0
    local function consider(entry, fields)
        sequence = sequence + 1
        entry.Seq = sequence
        if #tokens == 0 then
            entry.Score = 0
            table.insert(entries, entry)
            return
        end
        local total = 0
        for _, token in ipairs(tokens) do
            local best
            for _, field in ipairs(fields) do
                local value = fuzzyScore(token, field[1])
                if value then
                    value = value * field[2]
                    if not best or value > best then
                        best = value
                    end
                end
            end
            if not best then
                return
            end
            total = total + best
        end
        entry.Score = total
        table.insert(entries, entry)
    end
    local function collectActions()
        for _, action in ipairs(self._actions) do
            consider({
                Kind = "Action",
                Action = action,
                Title = action.Text,
                Sub = action.Description or "Action",
                Glyph = PALETTE_GLYPH.Action,
            }, { { action.Text, 1 }, { keywordText(action.Keywords), 0.8 }, { action.Description, 0.5 } })
        end
    end
    local function collectPages()
        for _, tab in ipairs(self.AllTabs) do
            if not tab.Hidden then
                consider({ Kind = "Tab", Target = tab, Title = tab.Title, Sub = "Tab", Glyph = PALETTE_GLYPH.Tab }, { { tab.Title, 1 } })
                for _, category in ipairs(tab.Categories or {}) do
                    if not category.Hidden then
                        consider({
                            Kind = "Category",
                            Target = category,
                            Title = category.Title,
                            Sub = tab.Title .. " / Category",
                            Glyph = PALETTE_GLYPH.Category,
                        }, { { category.Title, 0.9 }, { tab.Title, 0.3 } })
                    end
                end
                for _, side in ipairs({ "Left", "Right" }) do
                    for _, section in ipairs(tab.Sections[side]) do
                        if section.Title and section.Title ~= "" and not section.Hidden and not (section.Category and section.Category.Hidden) then
                            consider({
                                Kind = "Section",
                                Target = section,
                                Title = section.Title,
                                Sub = tab.Title .. " / Section",
                                Glyph = PALETTE_GLYPH.Section,
                            }, { { section.Title, 0.9 }, { tab.Title, 0.3 } })
                        end
                    end
                end
            end
        end
    end
    if mode == nil and #tokens == 0 then
        local shown = {}
        local function group(title, list)
            if #list == 0 then
                return
            end
            table.insert(entries, { Kind = "Header", Header = true, Title = title })
            for _, entry in ipairs(list) do
                table.insert(entries, entry)
            end
        end
        local pinned = {}
        for _, element in ipairs(self:GetPinned()) do
            local feature = element._feature
            if feature and self:_featureVisible(feature) and #pinned < 8 then
                shown[feature] = true
                table.insert(pinned, self:_paletteFeatureEntry(feature))
            end
        end
        local recent = {}
        for _, element in ipairs(self:GetRecent(8)) do
            local feature = element._feature
            if feature and not shown[feature] and self:_featureVisible(feature) and #recent < 5 then
                table.insert(recent, self:_paletteFeatureEntry(feature))
            end
        end
        group("Pinned", pinned)
        group("Recent", recent)
        local grouped = entries
        entries = {}
        collectActions()
        local actions = {}
        for _, entry in ipairs(entries) do
            if #actions < 6 then
                table.insert(actions, entry)
            end
        end
        entries = {}
        collectPages()
        local pages = {}
        for _, entry in ipairs(entries) do
            if entry.Kind == "Tab" then
                table.insert(pages, entry)
            end
        end
        entries = grouped
        group("Actions", actions)
        group("Go to", pages)
        return entries, tokens
    end
    if mode == nil or mode == "#" then
        for _, feature in ipairs(self._features) do
            if self:_featureVisible(feature) and (mode == nil or feature.Tab == self.SettingsTab) then
                local entry = self:_paletteFeatureEntry(feature)
                consider(entry, {
                    { feature.Text, 1 },
                    { feature.Flag, 0.7 },
                    { keywordText(feature.Keywords), 0.8 },
                    { feature.Description, 0.5 },
                    { feature.Section and feature.Section.Title, 0.45 },
                    { feature.Tab and feature.Tab.Title, 0.35 },
                    { feature.Type, 0.3 },
                })
            end
        end
    end
    if mode ~= "@" and mode ~= "#" then
        collectActions()
    end
    if mode ~= ">" and mode ~= "#" then
        collectPages()
    end
    table.sort(entries, function(a, b)
        if a.Score ~= b.Score then
            return a.Score > b.Score
        end
        local first, second = PALETTE_ORDER[a.Kind] or 9, PALETTE_ORDER[b.Kind] or 9
        if first ~= second then
            return first < second
        end
        return a.Seq < b.Seq
    end)
    while #entries > PALETTE_LIMIT do
        table.remove(entries)
    end
    return entries, tokens
end

function Window:_buildPalette()
    local metrics = self.Metrics
    local touch = metrics.Touch
    local popup = self:_makePopup("Palette")
    local inputHeight = touch and 46 or 40
    local footerHeight = touch and 0 or 24
    local top = new("Frame", { Name = "Top", Size = UDim2.new(1, 0, 0, inputHeight) }, popup)
    local icon = new("ImageLabel", {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 14, 0.5, 0),
        Size = UDim2.fromOffset(16, 16),
        ZIndex = 3,
    }, top)
    local glyph = self:Make("TextLabel", {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 14, 0.5, 0),
        Size = UDim2.fromOffset(16, 16),
        Text = "?",
        TextSize = metrics.Text,
        Muted = true,
        ZIndex = 3,
    }, top)
    self:ApplyIcon(icon, "search", "Muted", function()
        glyph.Visible = false
    end)
    local box = self:Make("TextBox", {
        Name = "Input",
        Position = UDim2.fromOffset(40, 0),
        Size = UDim2.new(1, -84, 1, 0),
        PlaceholderText = "Search features, tabs and settings",
        Text = "",
        TextSize = metrics.Text + 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false,
        ClipsDescendants = true,
        ZIndex = 3,
    }, top, { PlaceholderColor3 = "Muted" })
    local close = self:Make("TextButton", {
        Name = "Close",
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -8, 0.5, 0),
        Size = UDim2.fromOffset(28, 28),
        Text = "x",
        Font = "Semi",
        TextSize = metrics.Text,
        Muted = true,
        ZIndex = 3,
    }, top)
    self:Make("Frame", {
        Name = "Divider",
        Position = UDim2.fromOffset(0, inputHeight),
        Size = UDim2.new(1, 0, 0, 1),
    }, popup, { BackgroundColor3 = "Outline", BackgroundTransparency = "TransStroke" })
    local list = self:Make("ScrollingFrame", {
        Name = "Results",
        Position = UDim2.fromOffset(0, inputHeight + 1),
        Size = UDim2.new(1, 0, 1, -(inputHeight + 1 + footerHeight)),
        CanvasSize = UDim2.new(),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        ScrollBarThickness = metrics.ScrollBar,
    }, popup, { ScrollBarImageColor3 = "Accent" })
    addPadding(list, PALETTE_PAD)
    addList(list, 0)
    local empty = self:Make("TextLabel", {
        Name = "Empty",
        Position = UDim2.fromOffset(0, inputHeight + 1),
        Size = UDim2.new(1, 0, 1, -(inputHeight + 1 + footerHeight)),
        Text = "",
        TextSize = metrics.Small + 1,
        TextWrapped = true,
        Muted = true,
        Visible = false,
        ZIndex = 2,
    }, popup)
    if footerHeight > 0 then
        local footer = new("Frame", {
            Name = "Footer",
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.fromScale(0, 1),
            Size = UDim2.new(1, 0, 0, footerHeight),
        }, popup)
        self:Make("Frame", { Size = UDim2.new(1, 0, 0, 1) }, footer, { BackgroundColor3 = "Outline", BackgroundTransparency = "TransStroke" })
        self:Make("TextLabel", {
            Position = UDim2.fromOffset(12, 1),
            Size = UDim2.new(1, -24, 1, -1),
            Text = "enter use   shift+enter show   esc close   > actions   @ pages   # settings",
            TextSize = metrics.Small - 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            Muted = true,
            Font = "FontMono",
        }, footer)
    end
    self._palette = popup
    self.PaletteBox = box
    self._paletteList = list
    self._paletteEmpty = empty
    self._paletteEntries = {}
    self:Connect(box:GetPropertyChangedSignal("Text"), function()
        if self._palette and self._popup == self._palette then
            self:_paletteRefresh()
        end
    end)
    self:Connect(box.FocusLost, function(enterPressed)
        if enterPressed and self._palette and self._popup == self._palette then
            self:_paletteActivate(self:_shiftDown())
        end
    end)
    self:Connect(close.Activated, function()
        self:ClosePalette()
    end)
end

function Window:_paletteRow(index)
    local rows = self._paletteRows
    if rows[index] then
        return rows[index]
    end
    local metrics = self.Metrics
    local touch = metrics.Touch
    local tileSize = touch and 30 or 26
    local row = { Index = index, TileSize = tileSize }
    row.Button = self:Make("TextButton", {
        Name = "Result",
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundTransparency = 1,
        Text = "",
        AutoButtonColor = false,
        LayoutOrder = index,
        Visible = false,
    }, self._paletteList)
    row.Fill = self:Make("Frame", {
        Name = "Fill",
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
    }, row.Button, { BackgroundColor3 = "Accent" })
    self:Corner(row.Fill, "RadControl")
    row.Head = self:Make("TextLabel", {
        Name = "Head",
        Position = UDim2.fromOffset(10, 0),
        Size = UDim2.new(1, -20, 1, 0),
        Font = "Semi",
        TextSize = metrics.Small - 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Muted = true,
        Visible = false,
        ZIndex = 2,
    }, row.Button)
    row.Tile = self:Make("Frame", {
        Name = "Tile",
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 8, 0.5, 0),
        Size = UDim2.fromOffset(tileSize, tileSize),
        ZIndex = 2,
    }, row.Button, { BackgroundColor3 = "SurfaceAlt", BackgroundTransparency = "TransField" })
    self:Corner(row.Tile, "RadControl")
    row.Glyph = self:Make("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        Font = "Bold",
        TextSize = metrics.Small,
        Color = "Accent",
        ZIndex = 3,
    }, row.Tile)
    row.Title = self:Make("TextLabel", {
        Name = "Title",
        Position = UDim2.fromOffset(tileSize + 16, touch and 7 or 6),
        Size = UDim2.new(1, -(tileSize + 24), 0, 17),
        Font = "Semi",
        TextSize = metrics.Text,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        RichText = true,
        ZIndex = 2,
    }, row.Button)
    row.Sub = self:Make("TextLabel", {
        Name = "Sub",
        Position = UDim2.fromOffset(tileSize + 16, touch and 26 or 23),
        Size = UDim2.new(1, -(tileSize + 24), 0, 14),
        TextSize = metrics.Small - 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Muted = true,
        ZIndex = 2,
    }, row.Button)
    row.Pin = self:Make("TextButton", {
        Name = "Pin",
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -6, 0.5, 0),
        Size = UDim2.fromOffset(26, 26),
        Text = "*",
        Font = "Bold",
        TextSize = metrics.Text + 3,
        Muted = true,
        ZIndex = 4,
    }, row.Button)
    row.Reveal = self:Make("TextButton", {
        Name = "Reveal",
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -34, 0.5, 0),
        Size = UDim2.fromOffset(24, 24),
        Text = ">",
        Font = "Bold",
        TextSize = metrics.Text,
        Muted = true,
        ZIndex = 4,
    }, row.Button)
    row.Chip = self:Make("TextButton", {
        Name = "Chip",
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -60, 0.5, 0),
        Size = UDim2.fromOffset(0, 22),
        AutomaticSize = Enum.AutomaticSize.X,
        Font = "Semi",
        TextSize = metrics.Small,
        ZIndex = 4,
    }, row.Button, { BackgroundColor3 = "SurfaceAlt" })
    self:Corner(row.Chip, "RadControl")
    addPadding(row.Chip, 0, 8, 0, 8)
    row.Value = self:Make("TextLabel", {
        Name = "Value",
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -34, 0.5, 0),
        Size = UDim2.fromOffset(0, 20),
        AutomaticSize = Enum.AutomaticSize.X,
        TextSize = metrics.Small,
        Muted = true,
        ZIndex = 3,
    }, row.Button)
    self:Connect(row.Button.Activated, function()
        local entry = row.Entry
        if entry and not entry.Header then
            self:_paletteSelect(entry.Index, false)
            self:_paletteActivate(false)
        end
    end)
    self:Connect(row.Button.MouseEnter, function()
        local entry = row.Entry
        if entry and not entry.Header and not touch then
            self:_paletteSelect(entry.Index, false)
        end
    end)
    self:Connect(row.Chip.Activated, function()
        local entry = row.Entry
        if entry then
            self:_paletteSelect(entry.Index, false)
            self:_paletteActivate(false)
        end
    end)
    self:Connect(row.Reveal.Activated, function()
        local entry = row.Entry
        if entry then
            self:_paletteSelect(entry.Index, false)
            self:_paletteActivate(true)
        end
    end)
    self:Connect(row.Pin.Activated, function()
        local entry = row.Entry
        if entry and entry.Feature then
            self:TogglePin(entry.Feature)
            self:_paletteFill(row, entry, self._paletteTokens or {})
        end
    end)
    rows[index] = row
    return row
end

function Window:_paletteFill(row, entry, tokens)
    row.Entry = entry
    entry.Row = row
    row.Button.Size = UDim2.new(1, 0, 0, entry.Height)
    row.Button.Visible = true
    self:Tween(row.Fill, { BackgroundTransparency = 1 }, 0)
    if entry.Header then
        row.Head.Visible = true
        row.Head.Text = string.upper(entry.Title)
        row.Tile.Visible = false
        row.Title.Visible = false
        row.Sub.Visible = false
        row.Pin.Visible = false
        row.Reveal.Visible = false
        row.Chip.Visible = false
        row.Value.Visible = false
        return
    end
    row.Head.Visible = false
    row.Tile.Visible = true
    row.Title.Visible = true
    row.Sub.Visible = true
    row.Glyph.Text = entry.Glyph or "-"
    row.Title.Text = highlightText(entry.Title, tokens, hexOf(self.Tokens.AccentText))
    row.Sub.Text = entry.Sub or ""
    local rightPad = 8
    local feature = entry.Feature
    row.Pin.Visible = feature ~= nil
    if feature then
        local pinned = self:IsPinned(feature)
        row.Pin.Text = "*"
        self:Bind(row.Pin, "TextColor3", pinned and "AccentText" or "Muted")
        rightPad = rightPad + 28
    end
    row.Chip.Visible = false
    row.Value.Visible = false
    row.Reveal.Visible = false
    if feature then
        local chip, actionable = self:_paletteChip(feature.Element)
        local kind = feature.Element.Type
        if actionable then
            row.Reveal.Visible = true
            row.Reveal.Position = UDim2.new(1, -rightPad, 0.5, 0)
            rightPad = rightPad + 26
            row.Chip.Visible = true
            row.Chip.Text = chip
            row.Chip.Position = UDim2.new(1, -rightPad, 0.5, 0)
            local lit = kind == "Toggle" and feature.Element.Value == true or kind == "Button"
            self:Bind(row.Chip, "TextColor3", lit and "AccentText" or "Muted")
            self:Bind(row.Chip, "BackgroundColor3", lit and "Accent" or "SurfaceAlt")
            row.Chip.BackgroundTransparency = lit and 0.82 or 0.35
            rightPad = rightPad + #chip * 7 + 24
        elseif chip then
            row.Value.Visible = true
            row.Value.Text = chip
            row.Value.Position = UDim2.new(1, -rightPad, 0.5, 0)
            rightPad = rightPad + #chip * 6 + 10
        end
    end
    row.Title.Size = UDim2.new(1, -(row.TileSize + 16 + rightPad), 0, 17)
    row.Sub.Size = UDim2.new(1, -(row.TileSize + 16 + rightPad), 0, 14)
end

function Window:_paletteRefresh()
    local box = self.PaletteBox
    if not box then
        return
    end
    local entries, tokens = self:_paletteResults(box.Text)
    self._paletteEntries = entries
    self._paletteTokens = tokens
    local rows = self._paletteRows
    local touch = self.Metrics.Touch
    local top = 0
    for index, entry in ipairs(entries) do
        entry.Index = index
        entry.Height = entry.Header and 26 or (touch and 50 or 42)
        entry.Top = top
        top = top + entry.Height
        self:_paletteFill(self:_paletteRow(index), entry, tokens)
        rows[index].Button.LayoutOrder = index
    end
    for index = #entries + 1, #rows do
        rows[index].Button.Visible = false
        rows[index].Entry = nil
    end
    local empty = self._paletteEmpty
    empty.Visible = #entries == 0
    if #entries == 0 then
        local text = box.Text
        empty.Text = text == "" and "Nothing to show yet" or ('No matches for "' .. text .. '"\nTry a feature name, > for actions, @ for pages or # for settings')
    end
    local first
    for index, entry in ipairs(entries) do
        if not entry.Header then
            first = index
            break
        end
    end
    self._paletteSel = nil
    self:_paletteSelect(first, false)
    self._paletteList.CanvasPosition = Vector2.new(0, 0)
end

function Window:_paletteEnsureVisible(entry)
    local list = self._paletteList
    local view = list.AbsoluteSize.Y / self.Scale.Scale
    if view <= 0 then
        return
    end
    local current = list.CanvasPosition.Y
    local top = entry.Top + PALETTE_PAD
    local bottom = top + entry.Height
    local previous = self._paletteEntries[entry.Index - 1]
    if previous and previous.Header then
        top = previous.Top + PALETTE_PAD
    end
    local target = current
    if top < current then
        target = top - PALETTE_PAD
    elseif bottom > current + view then
        target = bottom - view + PALETTE_PAD
    end
    if target ~= current then
        list.CanvasPosition = Vector2.new(0, math.max(0, target))
    end
end

function Window:_paletteSelect(index, scroll)
    local entries = self._paletteEntries or {}
    local previous = self._paletteSel and entries[self._paletteSel]
    if previous and previous.Row and previous.Row.Entry == previous then
        self:Motion("Hover", previous.Row.Fill, { BackgroundTransparency = 1 })
    end
    self._paletteSel = index
    local entry = index and entries[index]
    if entry and entry.Row then
        self:Motion("Hover", entry.Row.Fill, { BackgroundTransparency = 0.84 })
        if scroll then
            self:_paletteEnsureVisible(entry)
        end
    end
end

function Window:_paletteMove(direction)
    local entries = self._paletteEntries or {}
    local count = #entries
    if count == 0 then
        return
    end
    local index = self._paletteSel or (direction > 0 and 0 or count + 1)
    for _ = 1, count do
        index = index + direction
        if index > count then
            index = 1
        elseif index < 1 then
            index = count
        end
        if not entries[index].Header then
            self:_paletteSelect(index, true)
            return
        end
    end
end

function Window:_paletteActivate(reveal)
    local entries = self._paletteEntries
    local entry = entries and self._paletteSel and entries[self._paletteSel]
    if not entry or entry.Header then
        return false
    end
    local kind = entry.Kind
    if kind == "Action" then
        self:ClosePalette()
        entry.Action:Run()
        return true
    end
    if kind == "Feature" then
        local feature = entry.Feature
        local element = feature.Element
        if not reveal then
            if element.Type == "Toggle" then
                element:Set(not element.Value)
                if entry.Row and entry.Row.Entry == entry then
                    self:_paletteFill(entry.Row, entry, self._paletteTokens or {})
                end
                return true
            elseif element.Type == "Button" then
                self:ClosePalette()
                element:Trigger()
                return true
            end
        end
        self:ClosePalette()
        self:GoTo(feature)
        return true
    end
    self:ClosePalette()
    self:GoTo(entry.Target)
    return true
end

function Window:OpenPalette(query)
    if self.Destroyed or not self.PaletteEnabled then
        return false
    end
    if not self.Visible then
        self:SetVisible(true)
    end
    if not self._palette then
        self:_buildPalette()
    end
    local touch = self.Metrics.Touch
    if self._popup ~= self._palette then
        self:_showPopup(self._palette, nil, Vector2.new(touch and 380 or 520, touch and 340 or 390), false)
        self:_emit("PaletteChanged", true)
    end
    local box = self.PaletteBox
    box.Text = type(query) == "string" and query or ""
    self:_paletteRefresh()
    task.defer(function()
        if not self.Destroyed and self._popup == self._palette then
            box:CaptureFocus()
        end
    end)
    return true
end

function Window:ClosePalette()
    if self._palette and self._popup == self._palette then
        self:_closePopup()
    end
end

function Window:IsPaletteOpen()
    return self._palette ~= nil and self._popup == self._palette
end

function Window:TogglePalette(query)
    if self:IsPaletteOpen() then
        self:ClosePalette()
        return false
    end
    return self:OpenPalette(query)
end

function Window:_syncPaletteKeybind()
    local element = self._paletteKeybind
    if element and element.Key ~= self.PaletteKey then
        element:SetKey(self.PaletteKey, true)
    end
end

function Window:SetPaletteKey(key)
    if key == nil or key == false then
        self.PaletteKey = nil
        self:_setData("PaletteKey", false)
        self:_syncPaletteKeybind()
        return true
    end
    local resolved = type(key) == "string" and keyFromName(key) or (type(key) ~= "string" and key or nil)
    if not resolved then
        return false
    end
    self.PaletteKey = resolved
    self:_setData("PaletteKey", resolved.EnumType == Enum.KeyCode and resolved.Name or nil)
    self:_syncPaletteKeybind()
    return true
end

function Window:SearchSettings(query)
    return self:OpenPalette("#" .. tostring(query or ""))
end

function Window:_flash(frame)
    if not frame or not frame.Parent or self.Destroyed then
        return
    end
    local flash = frame:FindFirstChild("GoToFlash")
    if not flash then
        flash = self:Make("Frame", {
            Name = "GoToFlash",
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            ZIndex = 30,
        }, frame, { BackgroundColor3 = "Accent" })
        self:Corner(flash, "RadCover")
    end
    local serial = (self._flashSerials[flash] or 0) + 1
    self._flashSerials[flash] = serial
    self:Tween(flash, { BackgroundTransparency = 1 }, 0)
    self:Motion("Fade", flash, { BackgroundTransparency = 0.7 })
    task.delay(0.35, function()
        if flash.Parent and not self.Destroyed and self._flashSerials[flash] == serial then
            self:Motion("Fade", flash, { BackgroundTransparency = 1 })
        end
    end)
end

function Window:GoTo(target, options)
    if self.Destroyed then
        return false
    end
    options = options or {}
    if type(target) == "string" then
        target = self:GetTab(target) or self:FindElement(target)
    end
    if type(target) ~= "table" then
        return false
    end
    local feature = target._feature or (target.Element and target) or nil
    local tab, section, category, frame
    if feature then
        tab, section = feature.Tab, feature.Section
        local row = feature.Element.Row
        frame = row and row.Frame
    else
        local meta = getmetatable(target)
        if meta == Tab then
            tab = target
        elseif meta == Section then
            tab, section, frame = target.Tab, target, target.Frame
        elseif meta == Category then
            tab, category = target.Tab, target
        end
    end
    if not tab or tab.Hidden then
        return false
    end
    if section and section.Category then
        category = section.Category
    end
    if not self.Visible then
        self:SetVisible(true)
    end
    if self.SearchQuery ~= "" then
        if self.SearchBox then
            self.SearchBox.Text = ""
        end
        self:SetSearch("")
        if self._setSearchOpen then
            self._setSearchOpen(false)
        end
    end
    self._tabTouched = true
    if self.SelectedTab ~= tab then
        self:SelectTab(tab)
    end
    if category and not category.Selected then
        tab:SelectCategory(category)
    end
    if section and section.Collapsed then
        section:SetCollapsed(false, true)
    end
    if frame and options.Scroll ~= false then
        task.delay(0.08, function()
            if self.Destroyed or not frame.Parent or self.SelectedTab ~= tab then
                return
            end
            local page = tab.Page
            local scale = self.Scale.Scale
            local y = (frame.AbsolutePosition.Y - page.AbsolutePosition.Y) / scale + page.CanvasPosition.Y - 10
            self:Tween(page, { CanvasPosition = Vector2.new(0, math.max(0, y)) }, 0.34, Enum.EasingStyle.Quart)
            if options.Flash ~= false then
                self:_flash(frame)
            end
        end)
    end
    self:_emit("Navigated", target)
    return true
end

local Builtins = {}

function Builtins.help(self)
    self:TerminalPrint("commands:", "Accent")
    for _, line in ipairs({
        "/list              show every feature and its state",
        "/<feature> [value] run or change a feature",
        "/save [name]       save the config",
        "/load <name>       load a config",
        "/delete <name>     delete a config",
        "/configs           list saved configs",
        "/autosave [on|off] toggle auto save",
        "/style [name]      show or change the UI style",
        "/binds             list feature keybinds",
        "/palette [query]   open the command palette",
        "/reset <name>      reset a setting, theme, motion or layout",
        "/pin /unpin <name> pin or unpin a feature",
        "/pins  /recent     list pinned and recent features",
        "/clear  /version  /hide",
    }) do
        self:TerminalPrint("  " .. line, "Muted")
    end
end

function Builtins.list(self)
    if #self.CommandOrder == 0 then
        self:TerminalPrint("no features registered yet", "Muted")
        return
    end
    for _, entry in ipairs(self.CommandOrder) do
        self:TerminalPrint(string.format("  /%-18s %s", entry.Name, self:_describe(entry.Element)), "Text")
    end
end


function Builtins.reset(self, argument)
    if argument == "" then
        self:TerminalPrint("usage: /reset <setting>  |  /reset theme  |  /reset motion  |  /reset layout", "Danger")
        return
    end
    local lowered = string.lower(argument)
    if lowered == "theme" then
        self:ResetTheme()
    elseif lowered == "motion" then
        self:ResetMotion()
    elseif lowered == "layout" then
        self:ResetLayout()
    elseif not self:ResetSetting(argument) then
        self:TerminalPrint("nothing to reset for: " .. argument, "Danger")
        return
    end
    self:TerminalPrint("reset " .. argument, "Success")
end

function Builtins.palette(self, argument)
    self:OpenPalette(argument)
end

function Builtins.pin(self, argument)
    if argument == "" then
        self:TerminalPrint("usage: /pin <feature>", "Danger")
        return
    end
    if self:Pin(argument) then
        self:TerminalPrint("pinned " .. argument, "Success")
    else
        self:TerminalPrint("no feature matches: " .. argument, "Danger")
    end
end

function Builtins.unpin(self, argument)
    if argument == "" then
        self:TerminalPrint("usage: /unpin <feature>", "Danger")
        return
    end
    if self:Unpin(argument) then
        self:TerminalPrint("unpinned " .. argument, "Success")
    else
        self:TerminalPrint("no feature matches: " .. argument, "Danger")
    end
end

function Builtins.pins(self)
    local list = self:GetPinned()
    if #list == 0 then
        self:TerminalPrint("nothing pinned", "Muted")
        return
    end
    for _, element in ipairs(list) do
        self:TerminalPrint("  " .. element._feature.Text, "Text")
    end
end

function Builtins.recent(self)
    local list = self:GetRecent(8)
    if #list == 0 then
        self:TerminalPrint("nothing used yet", "Muted")
        return
    end
    for _, element in ipairs(list) do
        self:TerminalPrint("  " .. element._feature.Text, "Text")
    end
end

Builtins.features = Builtins.list

function Builtins.clear(self)
    self:TerminalClear()
end

function Builtins.version(self)
    self:TerminalPrint(Library.Name .. " v" .. Library.Version .. " by " .. Library.Author, "Accent")
end

function Builtins.hide(self)
    self:SetVisible(false)
end

function Builtins.save(self, argument)
    local name = argument ~= "" and argument or self.ActiveConfig or "default"
    local ok, result = self:SaveConfig(name)
    self:TerminalPrint(ok and ("saved " .. result) or result, ok and "Success" or "Danger")
    if ok and self._refreshConfigList then
        self._refreshConfigList(result)
    end
end

function Builtins.load(self, argument)
    local ok, result = self:LoadConfig(argument ~= "" and argument or (self.ActiveConfig or ""))
    self:TerminalPrint(ok and "config loaded" or result, ok and "Success" or "Danger")
end

function Builtins.delete(self, argument)
    local ok, result = self:DeleteConfig(argument)
    self:TerminalPrint(ok and ("deleted " .. result) or result, ok and "Success" or "Danger")
    if ok and self._refreshConfigList then
        self._refreshConfigList(nil)
    end
end

function Builtins.configs(self)
    local names = self:ListConfigs()
    self:TerminalPrint(#names > 0 and table.concat(names, ", ") or "no saved configs", "Text")
end

function Builtins.autosave(self, argument)
    local lowered = string.lower(argument)
    if lowered == "on" or lowered == "off" then
        self:SetAutoSave(lowered == "on")
    end
    self:TerminalPrint("auto save " .. (self.AutoSave and "on" or "off"), "Text")
end

function Builtins.style(self, argument)
    if argument == "" then
        for _, info in ipairs(Library:GetStyles()) do
            self:TerminalPrint((info.Id == self.StyleId and "> " or "  ") .. info.Id .. "  (" .. info.Display .. ")", "Text")
        end
        return
    end
    if not self:SetStyle(argument) then
        self:TerminalPrint("unknown style: " .. argument, "Danger")
    end
end

function Builtins.binds(self)
    local count = 0
    for _, element in ipairs(self._quickbinds) do
        if element.BindKey then
            count = count + 1
            self:TerminalPrint("  [" .. keyToText(element.BindKey) .. "]  " .. (element.CommandName and ("/" .. element.CommandName) or element.BindId), "Text")
        end
    end
    if count == 0 then
        self:TerminalPrint("no binds yet, right-click a toggle or button", "Muted")
    end
end

function Window:RunCommand(line)
    line = line:gsub("^%s+", ""):gsub("%s+$", "")
    if line == "" then
        return
    end
    self:TerminalPrint("> " .. line, "Accent")
    local body = line:gsub("^/", "")
    local name, argument = body:match("^(%S+)%s*(.*)$")
    if not name then
        return
    end
    name = string.lower(name)
    local builtin = Builtins[name]
    if builtin then
        builtin(self, argument)
        return
    end
    local entry = self.Commands[name]
    if not entry then
        self:TerminalPrint("unknown command: /" .. name .. "  (try /help)", "Danger")
        return
    end
    self:_runFeature(entry, argument)
end

function Window:_findKeyOwner(key, except)
    for _, other in ipairs(self._keybinds) do
        if other ~= except and other.Key == key then
            return other
        end
    end
    for _, other in ipairs(self._quickbinds) do
        if other ~= except and other.BindKey == key then
            return other
        end
    end
    return nil
end

function Window:_keyOwnerName(element)
    if element.CommandName then
        return "/" .. element.CommandName
    end
    local row = element.Row
    if row and row.Title and row.Title.Text ~= "" then
        return row.Title.Text
    end
    return tostring(element.Text or element.Flag or element.Type or "another bind")
end

function Window:_handleInputBegan(input)
    local listening = self._listening
    if listening then
        local key
        if input.UserInputType == Enum.UserInputType.Keyboard then
            if input.KeyCode == Enum.KeyCode.Escape then
                self._listening = nil
                if listening._render then
                    listening._render()
                end
                self:_emit("BindsChanged")
                return
            elseif input.KeyCode == Enum.KeyCode.Backspace then
                key = false
            else
                key = input.KeyCode
            end
        elseif input.UserInputType == Enum.UserInputType.MouseButton2 or input.UserInputType == Enum.UserInputType.MouseButton3 then
            key = input.UserInputType
        end
        if key ~= nil then
            self._listening = nil
            if key then
                local owner = self:_findKeyOwner(key, listening)
                if owner and not listening.AllowDuplicate then
                    if listening._render then
                        listening._render()
                    end
                    self:Notify({
                        Title = "Keybind",
                        Content = keyToText(key) .. " is already used by " .. self:_keyOwnerName(owner),
                        Type = "Warning",
                        Duration = 3,
                    })
                    return
                end
            end
            listening:SetKey(key or nil)
        end
        return
    end
    if self.PaletteEnabled and self.Visible and self.PaletteKey and inputMatchesKey(input, self.PaletteKey) and self:_modifierDown() then
        self:TogglePalette()
        return
    end
    if self._palette and self._popup == self._palette then
        local code = input.KeyCode
        if code == Enum.KeyCode.Down then
            self:_paletteMove(1)
            return
        elseif code == Enum.KeyCode.Up then
            self:_paletteMove(-1)
            return
        elseif code == Enum.KeyCode.Escape then
            self:ClosePalette()
            return
        end
    end
    if UserInputService:GetFocusedTextBox() then
        return
    end
    if input.KeyCode == Enum.KeyCode.Escape and (self._dialog or self._popup) then
        if self._dialog then
            self._dialog.Close()
        else
            self:_closePopup()
        end
        return
    end
    if self.MenuKey and inputMatchesKey(input, self.MenuKey) then
        self:Toggle()
    end
    for _, keybind in ipairs(table.clone(self._keybinds)) do
        if keybind.Key and inputMatchesKey(input, keybind.Key) then
            if keybind.Mode == "Hold" then
                keybind.State = true
                fire(keybind, true)
            elseif keybind.Mode == "Toggle" then
                keybind.State = not keybind.State
                fire(keybind, keybind.State)
            else
                fire(keybind)
            end
        end
    end
    for _, element in ipairs(table.clone(self._quickbinds)) do
        if element.BindKey and inputMatchesKey(input, element.BindKey) then
            element:Trigger()
        end
    end
end

function Window:_handleInputEnded(input)
    for _, keybind in ipairs(self._keybinds) do
        if keybind.Mode == "Hold" and keybind.State and inputMatchesKey(input, keybind.Key) then
            keybind.State = false
            fire(keybind, false)
        end
    end
end

function Window:ClearBinds()
    for _, element in ipairs(self._quickbinds) do
        if element.BindKey then
            element:SetKey(nil, true)
        end
    end
    self:_queueAutoSave()
end

function Window:ListBinds()
    local list = {}
    for _, element in ipairs(self._quickbinds) do
        if element.BindKey then
            list[element.BindId] = keyToText(element.BindKey)
        end
    end
    return list
end

function Window:_prepareStorage()
    self.CanSave = filesSupported
    if self.CanSave then
        ensureFolders(self.ConfigPath)
    end
end

function Window:_configFile(name)
    return self.ConfigPath .. "/" .. name .. ".json"
end

function Window:_readConfigText(name)
    if self.CanSave then
        local ok, content = pcall(function()
            local path = self:_configFile(name)
            if isfile(path) then
                return readfile(path)
            end
            return nil
        end)
        if ok then
            return content
        end
        return nil
    end
    return self._memoryConfigs[name]
end

function Window:_readSettings()
    self.Prefs = { Enabled = false, Config = nil, AutoSave = false, Active = nil, Style = nil, Intro = true, Data = {} }
    if not self.CanSave then
        return
    end
    local ok, text = pcall(function()
        local path = self.Folder .. "/settings.json"
        if isfile(path) then
            return readfile(path)
        end
        return nil
    end)
    if not ok or not text then
        return
    end
    local data = decodeJson(text)
    if not data then
        return
    end
    self.Prefs = {
        Enabled = data.Enabled == true,
        Config = type(data.Config) == "string" and data.Config or nil,
        AutoSave = data.AutoSave == true,
        Active = type(data.Active) == "string" and data.Active or nil,
        Style = type(data.Style) == "string" and data.Style or nil,
        Intro = data.Intro ~= false,
        Data = type(data.Data) == "table" and data.Data or {},
    }
end

function Window:_flushSettings()
    self._settingsQueued = false
    if not self.CanSave or not self.Prefs then
        return
    end
    local payload = HttpService:JSONEncode({
        Enabled = self.Prefs.Enabled,
        Config = self.Prefs.Config,
        AutoSave = self.Prefs.AutoSave,
        Active = self.Prefs.Active,
        Style = self.Prefs.Style,
        Intro = self.Prefs.Intro,
        Data = self.Prefs.Data,
    })
    pcall(writefile, self.Folder .. "/settings.json", payload)
end

function Window:_saveSettings(immediate)
    if not self.CanSave or not self.Prefs then
        return
    end
    self.Prefs.Style = self.StyleId
    self.Prefs.Active = self.ActiveConfig
    self.Prefs.AutoSave = self.AutoSave
    if immediate then
        self:_flushSettings()
        return
    end
    if self._settingsQueued then
        return
    end
    self._settingsQueued = true
    task.delay(0.4, function()
        if self._settingsQueued then
            self:_flushSettings()
        end
    end)
end

function Window:_setData(key, value)
    self.Prefs.Data[key] = value
    self:_saveSettings()
end

function Window:_loadAutoConfig()
    local prefs = self.Prefs
    if prefs.Enabled and prefs.Config then
        local content = self:_readConfigText(prefs.Config)
        local decoded = content and decodeJson(content)
        if decoded then
            self._pending = type(decoded.Flags) == "table" and decoded.Flags or {}
            self._pendingBinds = type(decoded.Binds) == "table" and decoded.Binds or {}
            self._autoloadApplied = prefs.Config
            self.ActiveConfig = prefs.Config
            if decoded.Style and resolveStyle(decoded.Style) then
                self._configStyle = resolveStyle(decoded.Style)
            end
        end
    end
end

function Window:ListConfigs()
    local names = {}
    if self.CanSave then
        local ok, files = pcall(listfiles, self.ConfigPath)
        if ok and type(files) == "table" then
            for _, path in ipairs(files) do
                local name = tostring(path):match("([^/\\]+)%.json$")
                if name then
                    table.insert(names, name)
                end
            end
        end
    else
        for name in pairs(self._memoryConfigs) do
            table.insert(names, name)
        end
    end
    table.sort(names)
    return names
end

function Window:ExportConfigTable()
    local flags = {}
    for flag, element in pairs(self.Flags) do
        if element.Serialize and not string.find(flag, "^__") then
            local value = element:Serialize()
            if value ~= nil then
                flags[flag] = value
            end
        end
    end
    local binds = {}
    for _, element in ipairs(self._quickbinds) do
        if element.BindKey and element.BindId then
            binds[element.BindId] = serializeKey(element.BindKey)
        end
    end
    local colors = {}
    for token, color in pairs(self.Theme.Overrides) do
        colors[token] = "#" .. color:ToHex()
    end
    return {
        Version = 3,
        Style = self.StyleId,
        Theme = { Style = self.StyleId, Colors = colors, Opacity = self.Theme.Opacity, Adaptive = self.Theme.Adaptive },
        Flags = flags,
        Binds = binds,
    }
end

function Window:ExportConfig()
    return HttpService:JSONEncode(self:ExportConfigTable())
end

function Window:ApplyConfig(data)
    self._quietUntil = os.clock() + 2.5
    local styleId = resolveStyle(data.Style)
    if styleId and styleId ~= self.StyleId then
        self:SetStyle(styleId, true)
    end
    if type(data.Theme) == "table" then
        local theme = table.clone(data.Theme)
        theme.Reset = true
        theme.Style = nil
        self:SetTheme(theme, true)
    end
    local flags = type(data.Flags) == "table" and data.Flags or {}
    for flag, value in pairs(flags) do
        local element = self.Flags[flag]
        if element and element.Deserialize then
            pcall(element.Deserialize, element, value)
        else
            self._pending[flag] = value
        end
    end
    local binds = type(data.Binds) == "table" and data.Binds or {}
    for id, keyText in pairs(binds) do
        local applied = false
        for _, element in ipairs(self._quickbinds) do
            if element.BindId == id then
                element:SetKey(deserializeKey(keyText), true)
                applied = true
            end
        end
        if not applied then
            self._pendingBinds[id] = keyText
        end
    end
end

function Window:ImportConfig(source)
    local data = type(source) == "table" and source or decodeJson(tostring(source or ""))
    if type(data) ~= "table" then
        return false, "Invalid JSON"
    end
    if type(data.Flags) ~= "table" and type(data.Binds) ~= "table" and type(data.Theme) ~= "table" then
        data = { Flags = data }
    end
    self:ApplyConfig(data)
    self:_emit("ConfigImported", data)
    return true
end

function Window:FindElement(name)
    if name == nil then
        return nil
    end
    local key = tostring(name)
    local element = self.Flags[key]
    if element then
        return element
    end
    local command = self.Commands[string.lower(key)] or self.Commands[slug(key)]
    if command then
        return command.Element
    end
    local lowered = string.lower(key)
    for _, feature in ipairs(self._features) do
        if string.lower(feature.Text) == lowered then
            return feature.Element
        end
    end
    return nil
end

function Window:FindElements(query)
    local lowered = string.lower(tostring(query or ""))
    local results = {}
    for _, feature in ipairs(self._features) do
        local haystack = string.lower(feature.Text .. " " .. (feature.Description or "") .. " " .. (feature.Flag or ""))
        if lowered == "" or string.find(haystack, lowered, 1, true) then
            table.insert(results, feature.Element)
        end
    end
    return results
end

function Window:GetTab(name)
    if type(name) == "number" then
        return self.AllTabs[name]
    end
    local lowered = string.lower(tostring(name or ""))
    for _, tab in ipairs(self.AllTabs) do
        if string.lower(tab.Title) == lowered then
            return tab
        end
    end
    return nil
end

function Window:Refresh()
    if self.Destroyed then
        return
    end
    self:_applyTheme(true)
    self:_updateScale()
    self:SetSearch(self.SearchQuery)
    self:_rebuildFavorites()
    self:_emit("Refreshed")
end

function Window:GetVersion()
    return Library.Version
end

function Window:Unload()
    self:Destroy()
end

function Window:_idList(key)
    local data = self.Prefs.Data
    if type(data[key]) ~= "table" then
        data[key] = {}
    end
    return data[key]
end

function Window:_resolveFeature(target)
    if type(target) == "table" then
        if target._feature then
            return target._feature
        end
        if target.Element then
            return target
        end
        return nil
    end
    if target == nil then
        return nil
    end
    local element = self:FindElement(target)
    return element and element._feature or nil
end

function Window:_featureById(id)
    for _, feature in ipairs(self._features) do
        if feature.Id == id then
            return feature
        end
    end
    return nil
end

function Window:IsPinned(target)
    local feature = self:_resolveFeature(target)
    return feature ~= nil and table.find(self:_idList("Pinned"), feature.Id) ~= nil
end

function Window:Pin(target)
    local feature = self:_resolveFeature(target)
    if not feature then
        return false
    end
    local list = self:_idList("Pinned")
    if not table.find(list, feature.Id) then
        table.insert(list, feature.Id)
        self:_saveSettings()
        self:_queue("Favorites")
        self:_emit("PinsChanged", self:GetPinned())
    end
    return true
end

function Window:Unpin(target)
    local feature = self:_resolveFeature(target)
    if not feature then
        return false
    end
    local list = self:_idList("Pinned")
    local index = table.find(list, feature.Id)
    if index then
        table.remove(list, index)
        self:_saveSettings()
        self:_queue("Favorites")
        self:_emit("PinsChanged", self:GetPinned())
    end
    return true
end

function Window:TogglePin(target)
    if self:IsPinned(target) then
        self:Unpin(target)
        return false
    end
    return self:Pin(target)
end

function Window:GetPinned()
    local result = {}
    for _, id in ipairs(self:_idList("Pinned")) do
        local feature = self:_featureById(id)
        if feature then
            table.insert(result, feature.Element)
        end
    end
    return result
end

function Window:_touchRecent(feature)
    local list = self:_idList("Recent")
    if list[1] == feature.Id then
        return
    end
    local index = table.find(list, feature.Id)
    if index then
        table.remove(list, index)
    end
    table.insert(list, 1, feature.Id)
    while #list > 8 do
        table.remove(list)
    end
    self:_saveSettings()
    self:_emit("RecentChanged")
end

function Window:GetRecent(limit)
    local result = {}
    for _, id in ipairs(self:_idList("Recent")) do
        local feature = self:_featureById(id)
        if feature then
            table.insert(result, feature.Element)
            if limit and #result >= limit then
                break
            end
        end
    end
    return result
end

function Window:ClearRecent()
    self.Prefs.Data.Recent = {}
    self:_saveSettings()
    self:_emit("RecentChanged")
end

function Window:SaveConfig(name)
    name = sanitizeName(name)
    if name == "" then
        return false, "Enter a config name"
    end
    local json = self:ExportConfig()
    if self.CanSave then
        local ok = pcall(writefile, self:_configFile(name), json)
        if not ok then
            return false, "Could not write the file"
        end
    else
        self._memoryConfigs[name] = json
    end
    self.ActiveConfig = name
    self:_saveSettings()
    return true, name
end

function Window:LoadConfig(name)
    name = sanitizeName(name)
    if name == "" then
        return false, "Select a config"
    end
    local text = self:_readConfigText(name)
    if not text then
        return false, "Config not found"
    end
    local ok, reason = self:ImportConfig(text)
    if ok then
        self.ActiveConfig = name
        self:_saveSettings()
    end
    return ok, reason
end

function Window:DeleteConfig(name)
    name = sanitizeName(name)
    if name == "" then
        return false, "Select a config"
    end
    if self.CanSave then
        local path = self:_configFile(name)
        local exists = false
        pcall(function()
            exists = isfile(path)
        end)
        if not exists then
            return false, "Config not found"
        end
        if not delfile then
            return false, "delfile is not supported"
        end
        if not pcall(delfile, path) then
            return false, "Could not delete the file"
        end
    else
        if not self._memoryConfigs[name] then
            return false, "Config not found"
        end
        self._memoryConfigs[name] = nil
    end
    if self.Prefs.Config == name then
        self:SetAutoLoad(false)
    end
    if self.ActiveConfig == name then
        self.ActiveConfig = nil
        self:_saveSettings()
    end
    return true, name
end

function Window:SetAutoLoad(enabled, name)
    if name ~= nil then
        self.Prefs.Config = sanitizeName(name)
    end
    local hasName = self.Prefs.Config ~= nil and self.Prefs.Config ~= ""
    self.Prefs.Enabled = enabled == true and hasName
    self:_saveSettings()
    return self.Prefs.Enabled
end

function Window:GetAutoLoad()
    return self.Prefs.Enabled, self.Prefs.Config
end

function Window:SetAutoSave(enabled)
    self.AutoSave = enabled == true
    if self._autoSaveToggle then
        self._autoSaveToggle:Set(self.AutoSave, true)
    end
    self:_saveSettings()
end

function Window:_queueAutoSave()
    if not self.AutoSave or self.Destroyed or os.clock() < self._quietUntil then
        return
    end
    self._autoSaveToken = (self._autoSaveToken or 0) + 1
    local token = self._autoSaveToken
    task.delay(2, function()
        if self._autoSaveToken == token and self.AutoSave and not self.Destroyed then
            local ok, name = self:SaveConfig(self.ActiveConfig or "autosave")
            if ok then
                self:Notify({ Title = "Auto Save", Content = name, Type = "Success", Duration = 1.5, Log = false })
                self:TerminalPrint("autosaved " .. name, "Muted")
            end
        end
    end)
end

function Window:FastSave()
    local ok, result = self:SaveConfig(self.ActiveConfig or "default")
    if ok then
        if self._refreshConfigList then
            self._refreshConfigList(result)
        end
        self:Notify({ Title = "Saved", Content = result, Type = "Success", Duration = 2 })
    else
        self:Notify({ Title = "Save failed", Content = result, Type = "Error" })
    end
    return ok, result
end
function Window:_applyEffects()
    self.LiquidLayer.Visible = self.Effects.Liquid and self.Style.Liquid
    self.BorderGradient.Enabled = self.Effects.Border and self.Style.Border
end

function Window:_buildSettings()
    local tab = self:_createTab({ Title = "Settings", Icon = "settings" }, true)
    self.SettingsTab = tab
    local function spec(options)
        options.Internal = true
        options.Searchable = true
        return options
    end
    local finder = tab:AddSection({ Bare = true, Side = "Left" })
    finder:AddButton({
        Text = "Search Settings",
        Primary = true,
        NoBind = true,
        Internal = true,
        Callback = function()
            self:SearchSettings()
        end,
    })
    local themeCategory = tab:AddCategory({ Title = "Theme" })
    local behaviorCategory = tab:AddCategory({ Title = "Behavior" })
    local configCategory = tab:AddCategory({ Title = "Config" })
    local advancedCategory = tab:AddCategory({ Title = "Advanced" })
    self._advancedCategory = advancedCategory

    local appearance = themeCategory:AddSection({ Title = "Appearance", Icon = "palette" })
    local displays = {}
    local displayToId = {}
    for _, info in ipairs(Library:GetStyles()) do
        table.insert(displays, info.Display)
        displayToId[info.Display] = info.Id
    end
    self._styleDropdown = appearance:AddDropdown(spec({
        Text = "UI Style",
        Description = "Switch between the 4 looks",
        Icon = "layout-dashboard",
        Options = displays,
        Default = self.Style.Display,
        Flag = "__Style",
        Callback = function(display)
            local id = displayToId[display]
            if id and id ~= self.StyleId then
                self:SetStyle(id)
            end
        end,
    }))
    local function presetNames()
        local names = { "Default" }
        for _, name in ipairs(self:ListPresets()) do
            table.insert(names, name)
        end
        return names
    end
    self._presetDropdown = appearance:AddDropdown(spec({
        Text = "Theme Preset",
        Description = "Colors, glass density and lighting in one pick",
        Icon = "bookmark",
        Options = presetNames(),
        Placeholder = "Choose a preset",
        Flag = "__Preset",
        Callback = function(name)
            if not name or name == "" then
                return
            end
            if name == "Default" then
                self:ResetTheme()
            else
                local ok, result = self:ApplyPreset(name)
                if not ok then
                    self:Notify({ Title = "Theme", Content = result, Type = "Error" })
                end
            end
            task.defer(function()
                if self._presetDropdown and not self.Destroyed then
                    self._presetDropdown:Set(nil, true)
                end
            end)
        end,
    }))
    self._presetRefresh = function()
        self._presetDropdown:SetOptions(presetNames())
        self._presetDropdown:Set(nil, true)
    end
    local function themeColor(token)
        return function(color)
            self.Theme.Overrides[token] = color
            self:SetToken(token, color)
            self:_themeDirty()
        end
    end
    local function colorPicker(section, token, label)
        self._colorPickers[token] = section:AddColorPicker(spec({
            Text = label,
            Default = self.Tokens[token],
            Flag = "__Color_" .. token,
            Callback = themeColor(token),
        }))
    end
    colorPicker(appearance, "Accent", "Accent Color")
    local lab = advancedCategory:AddSection({ Title = "Theme Lab", Icon = "palette" })
    colorPicker(lab, "AccentAlt", "Accent Highlight")
    self._opacitySlider = lab:AddSlider(spec({
        Text = "Surface Opacity",
        Description = "Lower is clearer glass",
        Icon = "contrast",
        Min = 30,
        Max = 150,
        Step = 5,
        Default = 100,
        Suffix = "%",
        Flag = "__Opacity",
        Callback = function(percent)
            self:SetOpacity(percent / 100)
        end,
    }))
    self._opacitySlider:Set(math.floor(self.Theme.Opacity * 100 + 0.5), true)
    self._adaptiveToggle = lab:AddToggle(spec({
        Text = "Adaptive Lighting",
        Description = "Tune glass and decor for bright themes",
        Icon = "sun",
        Default = true,
        Flag = "__Adaptive",
        Callback = function(enabled)
            self:SetAdaptive(enabled)
        end,
    }))
    self._adaptiveToggle:Set(self.Theme.Adaptive, true)
    lab:AddButton({
        Text = "Reset Theme",
        NoBind = true,
        Internal = true,
        Callback = function()
            self:ResetTheme()
            self:Notify({ Title = "Theme", Content = "Theme restored", Type = "Success", Duration = 2 })
        end,
    })

    local effects = advancedCategory:AddSection({ Title = "Effects", Icon = "sparkles", Collapsed = true })
    self._qualityDropdown = effects:AddDropdown(spec({
        Text = "Effect Quality",
        Description = "Lower is lighter on weak devices",
        Icon = "gauge",
        Options = { "High", "Medium", "Low" },
        Default = self.Metrics.Touch and "Medium" or "High",
        Flag = "__Quality",
        Callback = function(level)
            self:SetQuality(level)
        end,
    }))
    self._qualityDropdown:Set(self.Quality, true)
    local function effectToggle(text, icon, key, flag, after)
        effects:AddToggle(spec({
            Text = text,
            Icon = icon,
            Default = self.Effects[key],
            Flag = flag,
            Callback = function(enabled)
                self.Effects[key] = enabled
                if after then
                    after(enabled)
                end
            end,
        }))
    end
    effectToggle("Liquid Glass Background", "droplets", "Liquid", "__fx_liquid", function()
        self:_applyEffects()
    end)
    effectToggle("Animated Border", "zap", "Border", "__fx_border", function()
        self:_applyEffects()
    end)
    effectToggle("Click Ripple", "mouse-pointer-click", "Ripple", "__fx_ripple")
    effectToggle("Typewriter Terminal", "terminal", "Typewriter", "__fx_typewriter")
    effectToggle("Rainbow Accent", "rainbow", "Rainbow", "__fx_rainbow", function(enabled)
        self:SetRainbow(enabled)
    end)
    effects:AddToggle(spec({
        Text = "Background Blur",
        Description = "Frosted glass behind the menu",
        Icon = "droplets",
        Default = self.Effects.Blur,
        Flag = "__fx_blur",
        Callback = function(enabled)
            self.Effects.Blur = enabled
            self:_setBlur(self.Visible)
        end,
    }))

    local editor = advancedCategory:AddSection({ Title = "Live Theme Editor", Icon = "sliders-horizontal", Collapsed = true })
    for _, entry in ipairs({
        { "Background", "Background" }, { "Surface", "Surface" }, { "SurfaceAlt", "Surface Alt" }, { "Text", "Text" },
        { "Muted", "Muted Text" }, { "Outline", "Outline" }, { "ToggleOn", "Toggle On" }, { "Success", "Success" },
        { "Warning", "Warning" }, { "Danger", "Danger" },
    }) do
        colorPicker(editor, entry[1], entry[2])
    end
    editor:AddButton({
        Text = "Reset Colors",
        NoBind = true,
        Internal = true,
        Callback = function()
            self.Theme.Overrides = {}
            self:_applyTheme()
            self:Notify({ Title = "Theme", Content = "Colors restored", Type = "Success", Duration = 2 })
        end,
    })

    local presets = advancedCategory:AddSection({ Title = "Presets and Sharing", Icon = "share-2", Collapsed = true })
    local presetName = presets:AddTextBox({ Text = "Preset Name", Icon = "tag", Placeholder = "my_theme", Internal = true })
    presets:AddButtonRow({
        {
            Text = "Save Preset",
            Internal = true,
            Callback = function()
                local ok, result = self:SavePreset(presetName.Value)
                if ok then
                    self._presetRefresh(result)
                    self:Notify({ Title = "Theme", Content = "Saved preset " .. result, Type = "Success", Duration = 2 })
                else
                    self:Notify({ Title = "Theme", Content = result, Type = "Error" })
                end
            end,
        },
        {
            Text = "Delete Preset",
            Internal = true,
            Callback = function()
                local name = sanitizeName(presetName.Value)
                if name == "" then
                    name = tostring(self._presetDropdown.Value or "")
                end
                local ok, result = self:DeletePreset(name)
                if ok then
                    self._presetRefresh(nil)
                    self:Notify({ Title = "Theme", Content = "Deleted preset " .. result, Type = "Success", Duration = 2 })
                else
                    self:Notify({ Title = "Theme", Content = result, Type = "Error" })
                end
            end,
        },
    })
    presets:AddDivider({ Text = "Share" })
    local themeBox = presets:AddTextBox({ Text = "Theme JSON", Icon = "clipboard", Placeholder = "{ ... }", Internal = true })
    presets:AddButtonRow({
        {
            Text = "Copy Theme",
            NoBind = true,
            Internal = true,
            Callback = function()
                local json = self:ExportTheme()
                themeBox:Set(json, true)
                if clipboardWriter then
                    clipboardWriter(json)
                    self:Notify({ Title = "Theme", Content = "Theme JSON copied", Type = "Success", Duration = 2 })
                else
                    self:Notify({ Title = "Theme", Content = "Clipboard not supported, JSON placed in the box", Type = "Warning" })
                end
            end,
        },
        {
            Text = "Import Theme",
            NoBind = true,
            Internal = true,
            Callback = function()
                local ok, result = self:ImportTheme(themeBox.Value)
                if ok then
                    self:Notify({ Title = "Theme", Content = "Theme imported", Type = "Success", Duration = 2 })
                else
                    self:Notify({ Title = "Theme", Content = tostring(result), Type = "Error" })
                end
            end,
        },
    })

    local general = behaviorCategory:AddSection({ Title = "General", Icon = "sliders-horizontal" })
    self._scaleSlider = general:AddSlider(spec({
        Text = "UI Scale",
        Icon = "scaling",
        Min = 50,
        Max = 150,
        Step = 5,
        Default = 100,
        Suffix = "%",
        Flag = "__UIScale",
        Callback = function(percent)
            self:SetScale(percent / 100)
        end,
    }))
    self._scaleSlider:Set(math.floor(self.UserScale * 100 + 0.5), true)
    self._reduceToggle = general:AddToggle(spec({
        Text = "Reduce Motion",
        Description = "Skip transitions and animated decor",
        Icon = "accessibility",
        Default = false,
        Flag = "__Reduce",
        Callback = function(enabled)
            self:SetReduceMotion(enabled)
        end,
    }))
    self._reduceToggle:Set(self.MotionState.Reduce, true)
    general:AddKeybind(spec({
        Text = "Menu Key",
        Icon = "keyboard",
        Default = self.MenuKey,
        Flag = "__MenuKey",
        OnChanged = function(key)
            self.MenuKey = key
        end,
    }))
    self._rememberToggle = general:AddToggle(spec({
        Text = "Remember Last Tab",
        Description = "Reopen where you left off",
        Icon = "history",
        Default = true,
        Flag = "__Remember",
        Callback = function(enabled)
            self:SetRememberTab(enabled)
        end,
    }))
    self._rememberToggle:Set(self._rememberTab, true)

    local motion = advancedCategory:AddSection({ Title = "Motion", Icon = "timer", Collapsed = true })
    self._speedSlider = motion:AddSlider(spec({
        Text = "Animation Speed",
        Description = "Scales every transition",
        Icon = "gauge",
        Min = 25,
        Max = 300,
        Step = 5,
        Default = 100,
        Suffix = "%",
        Flag = "__Speed",
        Callback = function(percent)
            self:SetAnimationSpeed(percent / 100)
        end,
    }))
    self._speedSlider:Set(math.floor(self.MotionState.Speed * 100 + 0.5), true)
    motion:AddToggle(spec({
        Text = "Intro Animation",
        Icon = "play",
        Default = self.Prefs.Intro ~= false,
        Flag = "__Intro",
        Callback = function(enabled)
            self.Prefs.Intro = enabled
            self:_saveSettings()
        end,
    }))
    motion:AddButton({
        Text = "Reset Motion",
        NoBind = true,
        Internal = true,
        Callback = function()
            self:ResetMotion()
            self:Notify({ Title = "Motion", Content = "Motion restored", Type = "Success", Duration = 2 })
        end,
    })

    local layout = advancedCategory:AddSection({ Title = "Layout", Icon = "scaling", Collapsed = true })
    self._autoScaleToggle = layout:AddToggle(spec({
        Text = "Auto Scale",
        Description = "Scale from the screen size",
        Icon = "scaling",
        Default = true,
        Flag = "__AutoScale",
        Callback = function(enabled)
            self.AutoScale = enabled
            self:_updateScale()
        end,
    }))
    self._autoScaleToggle:Set(self.AutoScale, true)
    self._popupModeDropdown = layout:AddDropdown(spec({
        Text = "Popup Style",
        Description = "Sheets on phones, anchored menus on desktop",
        Icon = "layout-panel-top",
        Options = { "Auto", "Sheet", "Anchored" },
        Default = "Auto",
        Flag = "__PopupMode",
        Callback = function(mode)
            self:SetPopupMode(mode)
        end,
    }))
    self._popupModeDropdown:Set(self.PopupMode or "Auto", true)
    self._terminalToggle = layout:AddToggle(spec({
        Text = "Terminal Panel",
        Description = "Every feature as a command",
        Icon = "terminal",
        Default = self.TerminalVisible,
        Flag = "__Terminal",
        Callback = function(visible)
            self:SetTerminalVisible(visible)
        end,
    }))
    layout:AddButton({
        Text = "Reset Layout",
        NoBind = true,
        Internal = true,
        Callback = function()
            self:ResetLayout()
            self:Notify({ Title = "Layout", Content = "Layout restored", Type = "Success", Duration = 2 })
        end,
    })

    local input = advancedCategory:AddSection({ Title = "Input", Icon = "keyboard", Collapsed = true })
    self._paletteKeybind = input:AddKeybind(spec({
        Text = "Palette Key",
        Description = "Hold Ctrl and press this key",
        Icon = "command",
        Default = self.PaletteKey,
        Flag = "__PaletteKey",
        OnChanged = function(key)
            self:SetPaletteKey(key)
        end,
    }))

    local binds = advancedCategory:AddSection({ Title = "Keybinds", Icon = "keyboard", Collapsed = true })
    binds:AddParagraph({
        Content = "Right-click (or hold) any toggle or button, then press a key. Sliders and dropdowns can not be bound. Escape clears a bind.",
    })
    binds:AddButtonRow({
        {
            Text = "Show Binds",
            NoBind = true,
            Internal = true,
            Callback = function()
                self:SetTerminalVisible(true)
                self:RunCommand("/binds")
            end,
        },
        {
            Text = "Clear Binds",
            NoBind = true,
            Internal = true,
            Callback = function()
                self:ClearBinds()
                self:Notify({ Title = "Keybinds", Content = "All binds cleared", Type = "Success" })
            end,
        },
    })
    local config = configCategory:AddSection({ Title = "Configuration", Icon = "save" })
    local tools = advancedCategory:AddSection({ Title = "Config Tools", Icon = "folder", Collapsed = true })
    local folderPath = "workspace/" .. self.ConfigPath
    tools:AddParagraph({
        Title = "File location",
        Content = self.CanSave and folderPath or "File system not supported here. Configs stay in memory until the UI is unloaded.",
    })
    tools:AddButton({
        Text = "Copy Folder Path",
        NoBind = true,
        Internal = true,
        Callback = function()
            if clipboardWriter then
                clipboardWriter(folderPath)
                self:Notify({ Title = "Config", Content = "Folder path copied", Type = "Success" })
            else
                self:Notify({ Title = "Config", Content = folderPath, Type = "Warning" })
            end
        end,
    })
    local nameBox = config:AddTextBox({ Text = "Config Name", Icon = "file-text", Placeholder = "my_config", Internal = true })
    local list = config:AddDropdown({
        Text = "Saved Configs",
        Icon = "folder",
        Options = self:ListConfigs(),
        Default = self.ActiveConfig,
        Placeholder = "Select...",
        Internal = true,
    })
    local autoLabel
    local autoToggle
    local function refreshAutoLabel()
        local enabled, name = self:GetAutoLoad()
        autoLabel:SetText(enabled and ("Auto load: " .. name) or "Auto load: off")
    end
    local function refreshList(selected)
        list:SetOptions(self:ListConfigs())
        if selected then
            list:Set(selected, true)
        end
    end
    self._refreshConfigList = refreshList
    local function targetName(preferBox)
        local boxName = sanitizeName(nameBox.Value)
        if preferBox and boxName ~= "" then
            return boxName
        end
        return list.Value or (boxName ~= "" and boxName or nil)
    end
    local function deleteConfig(name)
        local ok, result = self:DeleteConfig(name)
        if ok then
            refreshList(nil)
            autoToggle:Set(self:GetAutoLoad(), true)
            refreshAutoLabel()
            self:Notify({ Title = "Config", Content = "Deleted " .. result, Type = "Success" })
        else
            self:Notify({ Title = "Config", Content = result, Type = "Error" })
        end
    end
    config:AddButtonRow({
        {
            Text = "Save",
            Internal = true,
            Callback = function()
                local ok, result = self:SaveConfig(targetName(true))
                if ok then
                    refreshList(result)
                    self:Notify({ Title = "Config", Content = "Saved " .. result, Type = "Success" })
                else
                    self:Notify({ Title = "Config", Content = result, Type = "Error" })
                end
            end,
        },
        {
            Text = "Load",
            Internal = true,
            Callback = function()
                local ok, result = self:LoadConfig(targetName(false))
                if ok then
                    self:Notify({ Title = "Config", Content = "Config loaded", Type = "Success" })
                else
                    self:Notify({ Title = "Config", Content = result, Type = "Error" })
                end
            end,
        },
    })
    config:AddButtonRow({
        {
            Text = "Delete",
            Internal = true,
            Callback = function()
                local name = targetName(false)
                if not name then
                    self:Notify({ Title = "Config", Content = "Select a saved config first", Type = "Warning" })
                    return
                end
                self:Dialog({
                    Title = "Delete config",
                    Content = "Delete " .. name .. " permanently?",
                    Buttons = {
                        { Text = "Cancel" },
                        {
                            Text = "Delete",
                            Primary = true,
                            Callback = function()
                                deleteConfig(name)
                            end,
                        },
                    },
                })
            end,
        },
        {
            Text = "Refresh",
            Internal = true,
            Callback = function()
                refreshList(list.Value)
            end,
        },
    })
    config:AddButton({
        Text = "Fast Save",
        Primary = true,
        Flag = "fast_save",
        Callback = function()
            self:FastSave()
        end,
    })
    self._autoSaveToggle = config:AddToggle({
        Text = "Auto Save",
        Description = "Save the active config after every change",
        Icon = "save",
        Default = self.AutoSave,
        Internal = true,
        Callback = function(enabled)
            self:SetAutoSave(enabled)
        end,
    })
    local autoEnabled = self:GetAutoLoad()
    autoToggle = config:AddToggle({
        Text = "Auto Load Config",
        Description = "Load the selected config on startup",
        Icon = "rotate-cw",
        Default = autoEnabled,
        Internal = true,
        Callback = function(enabled)
            if enabled then
                local name = targetName(false)
                if not name then
                    self:Notify({ Title = "Config", Content = "Select a saved config first", Type = "Warning" })
                    autoToggle:Set(false, true)
                    return
                end
                self:SetAutoLoad(true, name)
            else
                self:SetAutoLoad(false)
            end
            refreshAutoLabel()
        end,
    })
    autoLabel = config:AddLabel({ Text = "", Internal = true })
    refreshAutoLabel()
    tools:AddDivider({ Text = "Share" })
    tools:AddButton({
        Text = "Copy Config as JSON",
        NoBind = true,
        Internal = true,
        Callback = function()
            local json = self:ExportConfig()
            if clipboardWriter then
                clipboardWriter(json)
                self:Notify({ Title = "Config", Content = "Config JSON copied", Type = "Success" })
            else
                self:Notify({ Title = "Config", Content = "Clipboard not supported, JSON placed in the box below", Type = "Warning" })
            end
            self.ImportBox:Set(json, true)
        end,
    })
    self.ImportBox = tools:AddTextBox({ Text = "Paste JSON", Icon = "clipboard", Placeholder = "{ ... }", Internal = true })
    tools:AddButton({
        Text = "Import JSON",
        NoBind = true,
        Internal = true,
        Callback = function()
            local ok, result = self:ImportConfig(self.ImportBox.Value)
            if ok then
                self:Notify({ Title = "Config", Content = "Config imported", Type = "Success" })
            else
                self:Notify({ Title = "Config", Content = result, Type = "Error" })
            end
        end,
    })
    local window = configCategory:AddSection({ Title = "Window", Icon = "app-window" })
    window:AddButtonRow({
        {
            Text = "Reset Defaults",
            NoBind = true,
            Internal = true,
            Callback = function()
                self:Dialog({
                    Title = "Reset to defaults",
                    Content = "Every setting returns to its default value.",
                    Buttons = {
                        { Text = "Cancel" },
                        {
                            Text = "Reset",
                            Primary = true,
                            Callback = function()
                                self:ResetToDefaults()
                                self:Notify({ Title = "Settings", Content = "Defaults restored", Type = "Success" })
                            end,
                        },
                    },
                })
            end,
        },
        {
            Text = "Unload UI",
            NoBind = true,
            Internal = true,
            Callback = function()
                self:Dialog({
                    Title = "Unload UI",
                    Content = "Remove the UI and stop everything it controls?",
                    Buttons = {
                        { Text = "Cancel" },
                        {
                            Text = "Unload",
                            Primary = true,
                            Callback = function()
                                self:Destroy()
                            end,
                        },
                    },
                })
            end,
        },
    })
    self:SetAdvancedSettings(self._advancedSettings)
end

function Window:SetAdvancedSettings(enabled)
    enabled = enabled == true
    self._advancedSettings = enabled
    local category = self._advancedCategory
    local tab = self.SettingsTab
    if not (category and tab) then
        return false
    end
    category.Hidden = not enabled
    for _, section in ipairs(tab.Sections.Left) do
        if section.Category == category then
            section.Hidden = not enabled
            section:_applyVisibility()
        end
    end
    if not enabled and category.Selected then
        for _, other in ipairs(tab.Categories) do
            if other ~= category then
                tab:SelectCategory(other)
                break
            end
        end
    end
    tab:_refreshCategories()
    self:_queue("Favorites")
    return true
end

function Window:GetAdvancedSettings()
    return self._advancedSettings == true
end

function Window:ResetToDefaults()
    for _, element in pairs(self.Flags) do
        if element.Reset then
            pcall(element.Reset, element)
        end
    end
    self:ResetTheme()
    self:ResetMotion()
    self:ResetLayout()
end

function Window:_buildAbout(options)
    local tab = self:_createTab({ Title = "About", Icon = "info" }, true)
    self.AboutTab = tab
    local main = tab:AddSection({ Title = "Perplexity", Icon = "sparkles", Side = "Left", Collapsible = false })
    main:AddCard({
        Title = Library.Name,
        Description = "Liquid glass UI library with 4 styles, mobile-first layout, command palette, theme editor, built-in configs and a command terminal.",
        Tags = { "v" .. Library.Version, "Glass", "Mobile", "Palette" },
        Image = options.AboutImage,
        Button = "Copy Credits",
        NoBind = true,
        Callback = function()
            local credits = Library.Name .. " v" .. Library.Version .. " by " .. Library.Author
            if clipboardWriter then
                clipboardWriter(credits)
            end
            self:Notify({ Title = "Credits", Content = credits, Type = "Success" })
        end,
    })
    main:AddParagraph({
        Title = "Credits",
        Content = "Author and polish by " .. Library.Author .. ".",
    })
    local styles = tab:AddSection({ Title = "UI Styles", Icon = "layout-dashboard", Side = "Right" })
    local buttons = {}
    for _, info in ipairs(Library:GetStyles()) do
        table.insert(buttons, {
            Text = info.Display,
            NoBind = true,
            Internal = true,
            Callback = function()
                self:SetStyle(info.Id)
            end,
        })
    end
    styles:AddButtonRow({ buttons[1], buttons[2] })
    styles:AddButtonRow({ buttons[3], buttons[4] })
    local log = tab:AddSection({ Title = "Changelog", Icon = "file-text", Side = "Right" })
    log:AddChangelog({
        { Version = "v3.1.0", Text = "Liquid Glass 2.0, mobile layout, command palette, favorites, theme editor, adaptive light and dark text, 9 new widgets", Date = "11/1/2026" },
        { Version = "v2.0.0", Text = "Perplexity: 4 styles, icons, images, terminal", Date = "10/17/2026" },
        { Version = "v1.1.0", Text = "Search, dialogs, resize", Date = "10/16/2026" },
        { Version = "v1.0.0", Text = "UI source and example", Date = "10/15/2026" },
    })
end

function Window:Destroy()
    if self.Destroyed then
        return
    end
    self:_emit("Destroying")
    self.Destroyed = true
    self:_cancelDrags()
    self:_cancelTweens()
    self._movers = {}
    self._animated = {}
    self._dirty = {}
    self._events = {}
    self:_flushSettings()
    for _, connection in ipairs(self._connections) do
        pcall(function()
            connection:Disconnect()
        end)
    end
    self._connections = {}
    if self.BlurEffect then
        pcall(function()
            self.BlurEffect:Destroy()
        end)
    end
    if self.Gui then
        self.Gui:Destroy()
    end
    local environment = getgenv and getgenv() or _G
    if environment.__PerplexityWindow == self then
        environment.__PerplexityWindow = nil
    end
    if self.OnUnload then
        pcall(self.OnUnload)
    end
end

function Library:CreateWindow(options)
    options = options or {}
    local environment = getgenv and getgenv() or _G
    local previous = environment.__PerplexityWindow
    if previous and previous.Destroy then
        pcall(previous.Destroy, previous)
    end
    local touch = options.Mobile
    if touch == nil then
        touch = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
    end
    local metrics = touch and MobileMetrics or DesktopMetrics
    local self = setmetatable({
        Title = options.Title or Library.Name,
        Icon = options.Icon,
        Metrics = metrics,
        Tokens = {},
        Flags = {},
        Tabs = {},
        AllTabs = {},
        Commands = {},
        CommandOrder = {},
        Visible = true,
        Minimized = false,
        SearchQuery = "",
        AutoScale = options.AutoScale ~= false,
        UserScale = 1,
        PopupMode = options.PopupMode or "Auto",
        _popupShadows = setmetatable({}, { __mode = "k" }),
        _popupState = setmetatable({}, { __mode = "k" }),
        _shadowOn = true,
        ReferenceSize = options.ReferenceSize or Vector2.new(1920, 1080),
        MenuKey = options.MenuKey or Enum.KeyCode.RightShift,
        Folder = options.Folder or "Perplexity",
        OnUnload = options.OnUnload,
        SmartSize = options.SmartSize ~= false and options.Size == nil and touch == true,
        DesignSize = options.Size or metrics.Size,
        BaseSize = options.Size or metrics.Size,
        PreferredSize = options.Size or metrics.Size,
        MinSize = touch and Vector2.new(420, 240) or Vector2.new(480, 300),
        Effects = { Liquid = true, Border = true, Ripple = true, Typewriter = true, Rainbow = false, Blur = options.Blur ~= false },
        TerminalVisible = false,
        AutoSave = false,
        _connections = {},
        _events = {},
        _kbShift = 0,
        _topReserve = 0,
        _borderClock = 0,
        _focused = true,
        _vignettes = {},
        _rims = setmetatable({}, { __mode = "k" }),
        _shadows = setmetatable({}, { __mode = "k" }),
        _animated = {},
        _dirty = {},
        _connectionCount = 0,
        _bindings = {},
        _boundTo = setmetatable({}, { __mode = "k" }),
        _strokes = setmetatable({}, { __mode = "k" }),
        _gradients = {},
        _styleHooks = {},
        _keybinds = {},
        _quickbinds = {},
        _pending = {},
        _pendingBinds = {},
        _movers = {},
        _drags = {},
        _liquids = {},
        _lines = {},
        _gamerParts = setmetatable({}, { __mode = "k" }),
        _liquidClock = 0,
        _claimed = setmetatable({}, { __mode = "k" }),
        _tweens = setmetatable({}, { __mode = "k" }),
        _notifHistory = {},
        _unread = 0,
        _toasts = {},
        _colorPickers = {},
        _memoryConfigs = {},
        _logLines = {},
        _logCount = 1,
        _logTokens = {},
        _time = 0,
        _rememberTab = options.RememberTab ~= false,
        _features = {},
        _actions = {},
        _favRows = {},
        _flashSerials = setmetatable({}, { __mode = "k" }),
        _paletteRows = {},
        PaletteEnabled = options.Palette ~= false,
        _advancedSettings = options.AdvancedSettings == true,
        PaletteKey = keyFromName(options.PaletteKey) or Enum.KeyCode.K,
        _center = Vector2.new(0.5, 0.5),
        _quietUntil = os.clock() + 2.5,
    }, Window)
    self.ConfigPath = self.Folder .. "/configs"
    local topInset = 0
    if touch then
        pcall(function()
            topInset = game:GetService("GuiService"):GetGuiInset().Y
        end)
        self._topReserve = math.clamp(topInset, 0, 64)
    end
    self:_prepareStorage()
    self:_readSettings()
    self:_loadAutoConfig()
    if self.Prefs.Data.RememberTab == false then
        self._rememberTab = false
    end
    local savedKey = self.Prefs.Data.PaletteKey
    if savedKey == false then
        self.PaletteKey = nil
    elseif type(savedKey) == "string" then
        self.PaletteKey = keyFromName(savedKey) or self.PaletteKey
    end
    local forcedStyle = options.ForceStyle == true and resolveStyle(options.Style) or nil
    local styleId = forcedStyle or resolveStyle(self._configStyle) or resolveStyle(self.Prefs.Style) or resolveStyle(options.Style) or "Perplexity"
    self.StyleId = styleId
    self.Style = Styles[styleId]
    local data = self.Prefs.Data
    self.UserScale = math.clamp(tonumber(data.Scale) or tonumber(options.Scale) or 1, 0.5, 2)
    if data.PopupMode == "Sheet" or data.PopupMode == "Anchored" then
        self.PopupMode = data.PopupMode
    end
    self.MotionState = {
        Speed = math.clamp(tonumber(data.Speed) or tonumber(options.AnimationSpeed) or 1, 0.25, 3),
        Reduce = data.Reduce == true or (data.Reduce == nil and options.ReduceMotion == true),
    }
    local wantedQuality = data.Quality or options.Quality or (touch and "Medium" or "High")
    self.Quality = QUALITY[wantedQuality] and wantedQuality or "High"
    self._shadowOn = QUALITY[self.Quality].Shadow == true
    self.Theme = {
        Opacity = math.clamp(tonumber(data.Opacity) or 1, 0.3, 1.5),
        Adaptive = data.Adaptive ~= false,
        Overrides = {},
    }
    if type(options.Theme) == "table" then
        for token, value in pairs(options.Theme) do
            local color = toColor(value)
            if color and COLOR_TOKEN_SET[token] then
                self.Theme.Overrides[token] = color
            end
        end
    end
    if data.ThemeStyle == styleId and type(data.Colors) == "table" then
        for token, value in pairs(data.Colors) do
            local color = toColor(value)
            if color and COLOR_TOKEN_SET[token] then
                self.Theme.Overrides[token] = color
            end
        end
    end
    self.Tokens = self:_themeTokens()
    self._bright = isBrightColor(self.Tokens.Background)
    self.AutoSave = self.Prefs.AutoSave
    self.ActiveConfig = self.ActiveConfig or self.Prefs.Active
    self.TerminalVisible = self.Style.Terminal and not touch
    self:_buildGui(options)
    self:_buildFavorites()
    self:_buildSettings()
    self:_buildAbout(options)
    self:_registerDefaultActions()
    environment.__PerplexityWindow = self
    if self.TerminalVisible then
        self._terminalBanner()
    end
    if options.Intro ~= false and self.Prefs.Intro ~= false then
        self:_playIntro()
    end
    self:_setBlur(true)
    if self._autoloadApplied then
        task.delay(1.6, function()
            if not self.Destroyed then
                self:Notify({ Title = "Config", Content = "Auto loaded " .. self._autoloadApplied, Type = "Success" })
            end
        end)
    end
    return self
end

Library.new = Library.CreateWindow

return Library
