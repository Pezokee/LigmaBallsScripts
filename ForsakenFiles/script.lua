
local library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local forsaken = library:NewWindow("forsaken")

local player = forsaken:NewSection("player")

player:CreateButton("infinite stamina", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Pezokee/LigmaBallsScripts/refs/heads/main/ForsakenFiles/infstam"))()
end)

local esp = forsaken:NewSection("esp")

esp:CreateButton("nametag", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Pezokee/LigmaBallsScripts/refs/heads/main/ForsakenFiles/nametag"))()
end)

esp:CreateButton("outline", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Pezokee/LigmaBallsScripts/refs/heads/main/ForsakenFiles/highlight"))()
end)

player:CreateSlider("fov", 70, 120, 70, false, function(value)
    game:GetService("Players").LocalPlayer.PlayerData.Settings.Game.FieldOfView.Value = value
end)
