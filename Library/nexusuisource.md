# Nexus UI Library Documentation

## Overview

Nexus UI is a Roblox Luau UI library for creating a polished script interface with tabs, grouped controls, notifications, configurable visuals, persistent configs, security validation, custom assets, video layers, and mobile support.

The library returns a single table, used as the main `NexusUI` API. Create one UI instance with `NexusUI.new(config)` and then add tabs, groups, and controls.

---

## Basic Usage

```lua
local NexusUI = loadstring(game:HttpGet("YOUR_LIBRARY_URL_HERE"))()

local UI = NexusUI.new({
    Name = "Nexus Hub",
    AccentColor = Color3.fromRGB(168, 85, 247),
    BackgroundColor = Color3.fromRGB(16, 16, 16),
    TextColor = Color3.fromRGB(255, 255, 255),
    SubTextColor = Color3.fromRGB(124, 124, 124),

    DynamicIslandTitle = "NEXUS",
    DynamicIslandLogoSource = "https://raw.githubusercontent.com/ryudacatt/assetsfora/main/logo.png",
    BackgroundImageSource = "https://raw.githubusercontent.com/ryudacatt/assetsfora/main/logo.png",
    BackgroundImageTransparency = 0.9,
})

local MainTab = UI:CreateSection("Main")
local MainGroup = MainTab:AddGroup("General")

MainGroup:AddButton({
    Text = "Run Action",
    Callback = function()
        print("Clicked")
    end
})

MainGroup:AddToggle({
    Text = "Auto Farm",
    Default = false,
    Callback = function(enabled)
        print("Auto Farm:", enabled)
    end
})
```

---

## Constructor

### `NexusUI.new(config)`

Creates a new UI instance. The library automatically destroys older active Nexus UI instances before creating a new one.

```lua
local UI = NexusUI.new({
    Name = "Nexus",
    AccentColor = Color3.fromRGB(168, 85, 247),
    BackgroundColor = Color3.fromRGB(16, 16, 16),
    SecondaryColor = Color3.fromRGB(18, 18, 18),
    TextColor = Color3.fromRGB(255, 255, 255),
    SubTextColor = Color3.fromRGB(124, 124, 124),
})
```

### Common Config Fields

| Field | Type | Description |
|---|---:|---|
| `Name` | `string` | Main UI name. |
| `AccentColor` | `Color3` | Primary accent color used by controls, scrollbars, highlights, etc. |
| `BackgroundColor` | `Color3` | Main background color. |
| `SecondaryColor` | `Color3` | Secondary panel/control background color. |
| `TextColor` | `Color3` | Main text color. |
| `SubTextColor` | `Color3` | Muted/secondary text color. |
| `DynamicIslandTitle` | `string` | Title shown on the dynamic island. |
| `DynamicIslandLogoSource` | `string/number` | Logo image source. Supports URL, local file path, `rbxassetid://`, or numeric asset ID. |
| `NotificationIconSource` | `string/number` | Notification icon image source. |
| `BackgroundImageSource` | `string/number` | Optional background image source. |
| `BackgroundImageTransparency` | `number` | Background image transparency from `0` to `1`. |
| `DynamicIslandClickable` | `boolean` | Whether clicking the dynamic island toggles the UI. |

---

## Security / Key System API

The library includes a client-side security configuration layer for API-key validation and heartbeat checks.

### `NexusUI.SetApiKey(apiKey)`

Stores the API key in the shared environment.

```lua
NexusUI.SetApiKey("USER_KEY_HERE")
```

Returns `true` if the key is not empty.

---

### `NexusUI.ConfigureSecurity(securityConfig)`

Sets multiple security values at once.

```lua
NexusUI.ConfigureSecurity({
    ApiKey = "USER_KEY_HERE",
    ApiBaseUrl = "https://keyserver.nexusdevs.fun/api/auth",
    ValidationUrl = "https://keyserver.nexusdevs.fun/api/auth/validate",
    HeartbeatUrl = "https://keyserver.nexusdevs.fun/api/auth/heartbeat",
    ClientVersion = "2.0.0",
    Product = "nexus_ui",
    ScriptId = "nexus_ui_v2"
})
```

Supported aliases:

| Main Field | Aliases |
|---|---|
| `ApiKey` | `Key` |
| `ApiBaseUrl` | `BaseUrl` |
| `ValidationUrl` | `Url`, `AuthUrl` |
| `ClientVersion` | `Version` |
| `Product` | none |
| `ScriptId` | none |

---

### `NexusUI.SetValidationUrl(validationUrl, heartbeatUrl)`

Overrides the validation and heartbeat endpoints.

```lua
NexusUI.SetValidationUrl(
    "https://keyserver.nexusdevs.fun/api/auth/validate",
    "https://keyserver.nexusdevs.fun/api/auth/heartbeat"
)
```

---

### `NexusUI.SetClientVersion(version)`

Sets the client version used in validation requests.

```lua
NexusUI.SetClientVersion("2.0.0")
```

---

### `NexusUI.SetClientProduct(product, scriptId)`

Sets product/script identifiers.

```lua
NexusUI.SetClientProduct("nexus_ui", "nexus_ui_v2")
```

---

### Secure Key Storage

These methods use executor file APIs when available.

#### `NexusUI.SaveSecureKey(scope, apiKey)`

```lua
local ok, result = NexusUI.SaveSecureKey("ui_v2", "USER_KEY_HERE")
print(ok, result)
```

Stores an encoded key in the Nexus config folder.

#### `NexusUI.LoadSecureKey(scope)`

```lua
local key, pathOrError = NexusUI.LoadSecureKey("ui_v2")
if key then
    NexusUI.SetApiKey(key)
end
```

#### `NexusUI.ClearSecureKey(scope)`

```lua
local ok, result = NexusUI.ClearSecureKey("ui_v2")
```

#### `NexusUI.GetStoredKeyPath(scope)`

```lua
local path = NexusUI.GetStoredKeyPath("ui_v2")
```

---

## UI Lifecycle Methods

### `UI:ToggleUI()`

Opens or closes the UI.

```lua
UI:ToggleUI()
```

### `UI:SetToggleButtonVisible(visible)`

Shows or hides the mobile/floating toggle button.

```lua
UI:SetToggleButtonVisible(true)
```

### `UI:SetToggleKey(keyCode)`

Changes the keyboard toggle key.

```lua
UI:SetToggleKey(Enum.KeyCode.RightControl)
```

### `UI:Destroy()`

Destroys the UI, disconnects tracked connections, and cleans up runtime state.

```lua
UI:Destroy()
```

---

## Tabs / Sections

### `UI:CreateSection(name)`

Creates a tab/section.

```lua
local MainTab = UI:CreateSection("Main")
```

Returned tab object methods:

| Method | Description |
|---|---|
| `tab:Activate()` | Opens/focuses the tab. |
| `tab:Deactivate()` | Deactivates the tab. |
| `tab:FocusSearchEntry()` | Focuses this tab from search. |
| `tab:AddGroup(name)` | Creates a group inside the tab. |

---

## Groups

### `tab:AddGroup(name)`

Creates a collapsible group/container inside a tab.

```lua
local CombatGroup = MainTab:AddGroup("Combat")
```

Group methods:

| Method | Description |
|---|---|
| `group:SetCollapsed(state)` | Sets collapsed/expanded state. |
| `group:Collapse()` | Collapses the group. |
| `group:Expand()` | Expands the group. |
| `group:AddToggle(config)` | Adds a toggle. |
| `group:AddSlider(config)` | Adds a slider. |
| `group:AddButton(config)` | Adds a button. |
| `group:AddKeybind(config)` | Adds a keybind picker. |
| `group:AddKeybindToggle(config)` | Adds a toggle with keybind support. |
| `group:AddDropdown(config)` | Adds a single-select dropdown. |
| `group:AddMultiDropdown(config)` | Adds a multi-select dropdown. |
| `group:AddDivider()` | Adds a visual divider. |
| `group:AddLabel(config/string)` | Adds static text. |
| `group:AddTextInput(config)` | Adds text input. |
| `group:AddTextbox(config)` | Alias for text input. |
| `group:AddTextBox(config)` | Alias for text input. |
| `group:AddColorPicker(config)` | Adds a color picker. |

---

## Controls

## Button

### `group:AddButton(config)`

```lua
local Button = group:AddButton({
    Text = "Execute",
    Callback = function()
        print("Button clicked")
    end
})
```

Common fields:

| Field | Type | Description |
|---|---:|---|
| `Text` | `string` | Button label. |
| `Callback` | `function` | Runs when clicked. |

---

## Toggle

### `group:AddToggle(config)`

```lua
local Toggle = group:AddToggle({
    Text = "Auto Farm",
    Default = false,
    Callback = function(value)
        print("Enabled:", value)
    end
})
```

Returned methods:

```lua
Toggle:Set(true)
local enabled = Toggle:Get()
```

Common fields:

| Field | Type | Description |
|---|---:|---|
| `Text` | `string` | Toggle label. |
| `Default` | `boolean` | Starting value. |
| `Callback` | `function(value)` | Runs when value changes. |
| `Flag` | `string` | Optional config-save key. |

---

## Slider

### `group:AddSlider(config)`

```lua
local Slider = group:AddSlider({
    Text = "Walk Speed",
    Min = 16,
    Max = 100,
    Default = 16,
    Increment = 1,
    Callback = function(value)
        print("Speed:", value)
    end
})
```

Returned methods:

```lua
Slider:Set(50)
local value = Slider:Get()
```

Common fields:

| Field | Type | Description |
|---|---:|---|
| `Text` | `string` | Slider label. |
| `Min` | `number` | Minimum value. |
| `Max` | `number` | Maximum value. |
| `Default` | `number` | Starting value. |
| `Increment` | `number` | Snap step. Supports decimals. |
| `Callback` | `function(value)` | Runs when value changes. |
| `Flag` | `string` | Optional config-save key. |

---

## Keybind

### `group:AddKeybind(config)`

```lua
local Keybind = group:AddKeybind({
    Text = "Open Menu",
    Default = Enum.KeyCode.RightControl,
    Mode = "Toggle",
    Callback = function(key)
        print("Keybind changed:", key)
    end
})
```

Returned methods:

```lua
Keybind:Set(Enum.KeyCode.F)
local key = Keybind:Get()

Keybind:SetMode("Hold")
local mode = Keybind:GetMode()

Keybind:Close()
```

---

## Keybind Toggle

### `group:AddKeybindToggle(config)`

Creates a toggle with an attached keybind.

```lua
local FlyBind = group:AddKeybindToggle({
    Text = "Fly",
    Default = false,
    Key = Enum.KeyCode.F,
    Callback = function(enabled)
        print("Fly:", enabled)
    end
})
```

Returned methods:

```lua
FlyBind:SetToggle(true)
FlyBind:SetKey(Enum.KeyCode.G)

local key = FlyBind:GetKey()
local enabled = FlyBind:GetToggle()
```

---

## Dropdown

### `group:AddDropdown(config)`

```lua
local Dropdown = group:AddDropdown({
    Text = "Weapon",
    Options = {"Sword", "Gun", "Melee"},
    Default = "Sword",
    Search = true,
    Callback = function(selected)
        print("Selected:", selected)
    end
})
```

Returned methods:

```lua
Dropdown:Set("Gun")
local selected = Dropdown:Get()

Dropdown:UpdateOptions({"Sword", "Gun", "Melee", "Fruit"})
Dropdown:Close()
```

---

## Multi Dropdown

### `group:AddMultiDropdown(config)`

```lua
local Multi = group:AddMultiDropdown({
    Text = "Targets",
    Options = {"Players", "NPCs", "Bosses"},
    Default = {"Players"},
    Callback = function(selectedTable)
        print(selectedTable)
    end
})
```

Returned methods:

```lua
Multi:Set({"Players", "Bosses"})
local values = Multi:Get()

Multi:UpdateOptions({"Players", "NPCs", "Bosses", "Raid Bosses"})
Multi:Close()
```

---

## Text Input / Textbox

### `group:AddTextInput(config)`

Aliases: `AddTextbox`, `AddTextBox`

```lua
local Input = group:AddTextInput({
    Text = "Webhook URL",
    Placeholder = "https://discord.com/api/webhooks/...",
    Default = "",
    Callback = function(value)
        print("Input:", value)
    end
})
```

Returned methods:

```lua
Input:Set("hello")
local value = Input:Get()

Input:SetValue("new value")
local value2 = Input:GetValue()

Input:ResetValue()
```

---

## Color Picker

### `group:AddColorPicker(config)`

```lua
local Picker = group:AddColorPicker({
    Text = "ESP Color",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(color)
        print(color)
    end
})
```

Returned methods:

```lua
Picker:Set(Color3.fromRGB(0, 255, 0))
local color = Picker:Get()
Picker:Close()
```

---

## Label and Divider

```lua
group:AddLabel("Status: Ready")
group:AddDivider()
```

---

## Notifications

### `UI:Notify(config)`

Shows a notification.

```lua
UI:Notify({
    Title = "Nexus",
    Content = "Loaded successfully",
    Duration = 5
})
```

Common fields:

| Field | Type | Description |
|---|---:|---|
| `Title` | `string` | Notification title. |
| `Content` | `string` | Notification body. |
| `Duration` | `number` | How long it stays visible. |
| `Icon` | `string/number` | Optional custom icon. |

---

## Config Saving / Loading

The library supports persistent control values through flags and config files.

### `UI:SaveConfig(configName)`

```lua
local ok, result = UI:SaveConfig("default")
print(ok, result)
```

### `UI:LoadConfig(configName)`

```lua
local ok, result = UI:LoadConfig("default")
print(ok, result)
```

### Control Flags

Use `Flag` on controls that should be saved.

```lua
group:AddToggle({
    Text = "Auto Farm",
    Flag = "auto_farm",
    Default = false,
    Callback = function(value)
        _G.AutoFarm = value
    end
})

group:AddSlider({
    Text = "Speed",
    Flag = "speed",
    Min = 16,
    Max = 100,
    Default = 16,
    Callback = function(value)
        _G.Speed = value
    end
})
```

Config files are saved in the Nexus config folder when executor file APIs are available.

---

## Visual Customization

### `UI:SetAccentColor(color)`

```lua
UI:SetAccentColor(Color3.fromRGB(0, 170, 255))
```

### `UI:SetBackgroundImage(source)`

```lua
UI:SetBackgroundImage("https://raw.githubusercontent.com/ryudacatt/assetsfora/main/logo.png")
```

Supported image sources:

- `rbxassetid://123456789`
- Numeric asset ID, for example `123456789`
- Remote image URL
- Local file path, when executor asset APIs are available

### `UI:SetBackgroundOverlayOpacity(opacity)`

```lua
UI:SetBackgroundOverlayOpacity(0.55)
```

### `UI:SetOverlayPhysicsEnabled(enabled)`

```lua
UI:SetOverlayPhysicsEnabled(true)
```

### `UI:ApplyFontPreset(preset)`

Applies a font preset to the UI.

```lua
UI:ApplyFontPreset("Default")
```

---

## Search / Filtering

The library includes internal search registration and filtering.

### `UI:ApplySearchFilter(query)`

```lua
UI:ApplySearchFilter("auto farm")
```

This filters/highlights registered controls and groups based on fuzzy search scoring.

---

## Smooth Scrolling

### `UI:EnableSmoothScrolling()`

```lua
UI:EnableSmoothScrolling()
```

Enables smoother scrolling behavior on supported scroll containers.

---

## Video Layers

The library supports animated/video-style image sequences from manifests.

### `UI:CreateVideoLayer(videoConfig)`

```lua
local layer = UI:CreateVideoLayer({
    Name = "BackgroundVideo",
    Target = "Background",
    Manifest = "https://example.com/video/manifest.json",
    FPS = 30,
    Loop = true,
    PreloadBeforeUI = true,
    BackgroundTransparency = 1
})
```

### Helpers

```lua
UI:SetBackgroundVideo({
    Manifest = "https://example.com/background/manifest.json",
    FPS = 30,
    Loop = true
})

UI:SetIntroVideo({
    Manifest = "https://example.com/intro/manifest.json",
    FPS = 30,
    Loop = false
})

UI:SetLoadingVideo({
    Manifest = "https://example.com/loading/manifest.json",
    FPS = 30,
    Loop = true
})
```

### Video Layer Methods

The created video controller supports:

| Method | Description |
|---|---|
| `Play()` | Starts playback. |
| `Pause()` | Pauses playback. |
| `Restart()` | Restarts from the beginning. |
| `Seek(frame)` | Moves to a specific frame. |
| `SetVisible(state)` | Shows/hides the layer. |
| `SetPosition(position)` | Changes layer position. |
| `SetSize(size)` | Changes layer size. |
| `SetTransparency(value)` | Sets frame/background transparency. |
| `SetImageTransparency(value)` | Sets image transparency. |
| `SetZIndex(value)` | Sets z-index. |
| `SetPlaybackRate(rate)` | Changes speed multiplier. |
| `Destroy()` | Removes the layer. |

### Other Video Methods

```lua
local layer = UI:GetVideoLayer("BackgroundVideo")
UI:DestroyVideoLayer("BackgroundVideo")
```

---

## ESP Preview API

The library includes an ESP preview panel system.

### `UI:SetESPPreviewEnabled(enabled)`

```lua
UI:SetESPPreviewEnabled(true)
```

### `UI:SetESPPreviewData(data)`

```lua
UI:SetESPPreviewData({
    Enabled = true,
    Box = true,
    Name = true,
    Health = true,
    Distance = true,
    Color = Color3.fromRGB(255, 0, 0)
})
```

### `UI:SetESPPreviewProvider(callback)`

```lua
UI:SetESPPreviewProvider(function()
    return {
        Enabled = true,
        Box = true,
        Name = true,
        Health = true,
        Distance = true,
        Color = Color3.fromRGB(168, 85, 247)
    }
end)
```

---

## Complete Example

```lua
local NexusUI = loadstring(game:HttpGet("YOUR_LIBRARY_URL_HERE"))()

NexusUI.ConfigureSecurity({
    ApiKey = "USER_KEY_HERE",
    ValidationUrl = "https://keyserver.nexusdevs.fun/api/auth/validate",
    HeartbeatUrl = "https://keyserver.nexusdevs.fun/api/auth/heartbeat",
    ClientVersion = "2.0.0",
    Product = "nexus_hub",
    ScriptId = "nexus_main"
})

local UI = NexusUI.new({
    Name = "Nexus Hub",
    AccentColor = Color3.fromRGB(168, 85, 247),
    DynamicIslandTitle = "NEXUS",
    DynamicIslandLogoSource = "https://raw.githubusercontent.com/ryudacatt/assetsfora/main/logo.png",
    BackgroundImageSource = "https://raw.githubusercontent.com/ryudacatt/assetsfora/main/logo.png",
    BackgroundImageTransparency = 0.9,
})

UI:SetToggleKey(Enum.KeyCode.RightControl)
UI:EnableSmoothScrolling()

local Main = UI:CreateSection("Main")
local Farming = Main:AddGroup("Farming")

Farming:AddToggle({
    Text = "Auto Farm",
    Flag = "auto_farm",
    Default = false,
    Callback = function(value)
        _G.AutoFarm = value
    end
})

Farming:AddSlider({
    Text = "Farm Distance",
    Flag = "farm_distance",
    Min = 5,
    Max = 100,
    Default = 25,
    Increment = 1,
    Callback = function(value)
        _G.FarmDistance = value
    end
})

Farming:AddDropdown({
    Text = "Farm Mode",
    Flag = "farm_mode",
    Options = {"Nearest", "Highest Level", "Bosses"},
    Default = "Nearest",
    Search = true,
    Callback = function(mode)
        _G.FarmMode = mode
    end
})

local Settings = UI:CreateSection("Settings")
local UISettings = Settings:AddGroup("UI")

UISettings:AddColorPicker({
    Text = "Accent Color",
    Flag = "accent_color",
    Default = Color3.fromRGB(168, 85, 247),
    Callback = function(color)
        UI:SetAccentColor(color)
    end
})

UISettings:AddButton({
    Text = "Save Config",
    Callback = function()
        local ok, result = UI:SaveConfig("default")
        UI:Notify({
            Title = "Config",
            Content = ok and "Saved successfully" or tostring(result),
            Duration = 4
        })
    end
})

UISettings:AddButton({
    Text = "Load Config",
    Callback = function()
        local ok, result = UI:LoadConfig("default")
        UI:Notify({
            Title = "Config",
            Content = ok and "Loaded successfully" or tostring(result),
            Duration = 4
        })
    end
})

UI:Notify({
    Title = "Nexus Hub",
    Content = "UI loaded successfully",
    Duration = 5
})
```

---

## Best Practices

1. Always use `Flag` for controls that should be saved to config.
2. Use `pcall` around risky callbacks if your callback touches game objects that may be missing.
3. Keep remote image/video assets small enough to cache quickly.
4. Use `SetToggleKey` so desktop users can open/close the UI easily.
5. Use `SetToggleButtonVisible(true)` for mobile users.
6. Do not store plain sensitive keys in public scripts. Use server-side validation and rotate keys when needed.
7. Use `Destroy()` before reloading if you manually manage UI instances, although the constructor already cleans older Nexus UI roots.
8. Avoid creating too many video layers at once because preloading many frames can be slow.

---

## Public API Summary

### Static API

```lua
NexusUI.SetApiKey(apiKey)
NexusUI.GetStoredKeyPath(scope)
NexusUI.SaveSecureKey(scope, apiKey)
NexusUI.LoadSecureKey(scope)
NexusUI.ClearSecureKey(scope)
NexusUI.SetValidationUrl(validationUrl, heartbeatUrl)
NexusUI.SetClientVersion(version)
NexusUI.SetClientProduct(product, scriptId)
NexusUI.ConfigureSecurity(config)
NexusUI.new(config)
```

### UI Instance API

```lua
UI:ToggleUI()
UI:SetToggleButtonVisible(visible)
UI:SetToggleKey(keyCode)
UI:SetUserCustomizationEnabled(enabled)
UI:CreateMobileToggleButton()
UI:CreateWatermarkBecauseWeCool()
UI:Notify(config)
UI:CreateSection(name)
UI:SetAccentColor(color)
UI:SetBackgroundImage(source)
UI:SetBackgroundOverlayOpacity(opacity)
UI:SetOverlayPhysicsEnabled(enabled)
UI:ApplyFontPreset(preset)
UI:ApplySearchFilter(query)
UI:SaveConfig(name)
UI:LoadConfig(name)
UI:EnableSmoothScrolling()
UI:CreateVideoLayer(config)
UI:GetVideoLayer(name)
UI:DestroyVideoLayer(name)
UI:SetBackgroundVideo(config)
UI:SetIntroVideo(config)
UI:SetLoadingVideo(config)
UI:SetESPPreviewProvider(callback)
UI:SetESPPreviewData(data)
UI:SetESPPreviewEnabled(enabled)
UI:Destroy()
```

### Tab API

```lua
tab:Activate()
tab:Deactivate()
tab:FocusSearchEntry()
tab:AddGroup(name)
```

### Group API

```lua
group:SetCollapsed(state)
group:Collapse()
group:Expand()
group:AddToggle(config)
group:AddSlider(config)
group:AddButton(config)
group:AddKeybind(config)
group:AddKeybindToggle(config)
group:AddDropdown(config)
group:AddMultiDropdown(config)
group:AddDivider()
group:AddLabel(configOrText)
group:AddTextInput(config)
group:AddTextbox(config)
group:AddTextBox(config)
group:AddColorPicker(config)
```

### Control Return API

```lua
Toggle:Set(value)
Toggle:Get()

Slider:Set(value)
Slider:Get()

Keybind:Set(keyCode)
Keybind:Get()
Keybind:SetMode(mode)
Keybind:GetMode()
Keybind:Close()

KeybindToggle:SetToggle(value)
KeybindToggle:SetKey(keyCode)
KeybindToggle:GetKey()
KeybindToggle:GetToggle()

Dropdown:Set(value)
Dropdown:Get()
Dropdown:UpdateOptions(options)
Dropdown:Close()

MultiDropdown:Set(values)
MultiDropdown:Get()
MultiDropdown:UpdateOptions(options)
MultiDropdown:Close()

TextInput:Set(value)
TextInput:Get()
TextInput:GetValue()
TextInput:SetValue(value)
TextInput:ResetValue()

ColorPicker:Set(color)
ColorPicker:Get()
ColorPicker:Close()
```

