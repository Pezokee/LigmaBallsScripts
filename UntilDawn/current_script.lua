local library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local untildawn = library:NewWindow("shuchloxia: until dawn")

local player = untildawn:NewSection("player")
local camera = untildawn:NewSection("camera")
local visuals = untildawn:NewSection("visuals")

visuals:CreateButton("nametag & health + distance", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Pezokee/LigmaBallsScripts/refs/heads/main/ForsakenFiles/nametag"))()
end)

visuals:CreateButton("outline", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Pezokee/LigmaBallsScripts/refs/heads/main/ForsakenFiles/highlight"))()
end)

local currentFOV = 70

player:CreateSlider("fov", 70, 120, 70, false, function(value)
    currentFOV = value
end)

-- Continuously apply FOV
task.spawn(function()
    while true do
        workspace.CurrentCamera.FieldOfView = currentFOV
        task.wait() -- every frame
    end
end)



