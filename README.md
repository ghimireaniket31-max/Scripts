# Darling X

Lightweight, modular Roblox script architecture featuring a liquid glass interface, dynamic theme engine, animated MP4 video background with wallpaper fallback, and WindUI Lucide icons.

## Architecture

- **UI Framework**: Liquid glass design (440x300 compact, mobile-responsive UIScale).
- **Icons**: WindUI Lucide icon engine with verified Roblox asset fallbacks.
- **Media Engine**: Local MP4 video frame with high-resolution image fallback and asset caching.
- **Visuals**: Cyber neon rain particle layer and live dynamic accent manager.
- **Navigation**: Side capsule dock supporting smooth scrolling and tab transitions.
- **Tabs**:
  - `Home`: Player status, quick actions, and architecture summary.
  - `Combat`: Isolated combat features (ready for modular development).
  - `Mobility`: Movement enhancements, flight, and tween systems.
  - `Soru`: Infinite Soru, cooldown bypass, and dash utilities.
  - `Esp`: Visual entity indicators and highlights.
  - `Misc`: Server utilities and client optimizations.
  - `Themes`: Live color themes (9 presets + animated Rainbow), fonts, scale, and wallpaper selector.

## Loader

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/instagramusa/D/main/main.lua"))()
```

## Structure

```text
DarlingX/
├── assets/
│   ├── backgrounds/
│   └── darling_logo.png
├── modules/
│   ├── combat/
│   ├── mobility/
│   ├── soru/
│   ├── esp/
│   └── misc/
├── main.lua
└── README.md
```
