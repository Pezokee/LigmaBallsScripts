-- Settings for ESP
local fontType = Enum.Font.Code
local textSize = 14
local textColor = Color3.fromRGB(255, 255, 255) -- White color
local outlineColor = Color3.fromRGB(0, 0, 0) -- Black outline
local espName = "TextESP"

-- Function to calculate distance
local function calculateDistance(localPlayer, targetRoot)
    local localCharacter = localPlayer.Character
    local localRoot = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart")
    if localRoot and targetRoot then
        return math.floor((localRoot.Position - targetRoot.Position).Magnitude) -- Distance in studs
    end
    return "Unknown"
end

-- Function to retrieve health
local function getHealth(target)
    local humanoid = target:FindFirstChild("Humanoid")
    if humanoid then
        return math.floor(humanoid.Health) -- Current health
    end
    return "Unknown"
end

-- Function to create ESP text
local function createTextESP(target, displayName, localPlayer)
    if target:FindFirstChild(espName) then
        return -- Prevent duplicate ESP
    end

    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Name = espName
    billboardGui.Parent = target
    billboardGui.Size = UDim2.new(0, 200, 0, 50) -- Fixed size in pixels
    billboardGui.AlwaysOnTop = true
    billboardGui.StudsOffset = Vector3.new(0, 3, 0) -- Position above the target

    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = billboardGui
    textLabel.Size = UDim2.new(1, 0, 1, 0) -- Fill the billboard
    textLabel.BackgroundTransparency = 1
    textLabel.Font = fontType
    textLabel.TextSize = textSize -- Fixed text size
    textLabel.TextColor3 = textColor
    textLabel.TextStrokeTransparency = 0 -- Fully visible outline
    textLabel.TextStrokeColor3 = outlineColor -- Black outline

    -- Initial text setup
    local distance = calculateDistance(localPlayer, target)
    local health = getHealth(target.Parent)
    textLabel.Text = displayName .. " | Distance: " .. tostring(distance) .. " studs | Health: " .. tostring(health)

    -- Continuously update distance and health
    spawn(function()
        while wait(0.1) do
            if textLabel.Parent and localPlayer.Character then
                distance = calculateDistance(localPlayer, target)
                health = getHealth(target.Parent)
                textLabel.Text = displayName .. " | Distance: " .. tostring(distance) .. " studs | Health: " .. tostring(health)
            else
                break -- Stop updating if the target is removed
            end
        end
    end)
end

-- Function to handle ESP for a single player
local function applyESPToPlayer(player, localPlayer)
    player.CharacterAdded:Connect(function(character)
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        createTextESP(humanoidRootPart, player.DisplayName, localPlayer)

        -- Remove ESP on death
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.Died:Connect(function()
            if character:FindFirstChild(espName) then
                character:FindFirstChild(espName):Destroy()
            end
        end)
    end)

    -- Add ESP if character already exists
    if player.Character then
        local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            createTextESP(humanoidRootPart, player.DisplayName, localPlayer)
        end
    end
end

-- Apply ESP to all players and handle new players or leaving players
local function applyESPToPlayers()
    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer -- Reference for distance calculation

    for _, player in pairs(players:GetPlayers()) do
        applyESPToPlayer(player, localPlayer)
    end

    -- Handle player added
    players.PlayerAdded:Connect(function(player)
        applyESPToPlayer(player, localPlayer)
    end)

    -- Handle player removal
    players.PlayerRemoving:Connect(function(player)
        if player.Character and player.Character:FindFirstChild(espName) then
            player.Character:FindFirstChild(espName):Destroy()
        end
    end)
end

-- Initial application
applyESPToPlayers()
