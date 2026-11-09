local Loaders = {
    ["Blox Fruits"] = "https://api.aurorax.site/files/v5/loaders/b06ce6081ee515fed63b38dc5decd287",
}

local SelectedGame = "Blox Fruits"

getgenv().Key = "YOUR-KEY"

local URL = Loaders[SelectedGame]

if URL then
    loadstring(game:HttpGet(URL))()
else
    warn("Game loader not found!")
end
