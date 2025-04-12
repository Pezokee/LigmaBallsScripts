local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Function to create highlight ESP
local function createHighlightESP(player, isPink)
    if player == LocalPlayer then return end
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    if player.Character:FindFirstChild("ESPHighlight") then return end

    local highlight = Instance.new("Highlight")
    highlight.Name = "ESPHighlight"
    highlight.FillTransparency = 1  -- No fill
    highlight.OutlineTransparency = 0.6  -- Make outline a little transparent (thinner effect)

    if isPink then
        highlight.OutlineColor = Color3.fromRGB(255, 105, 180)  -- Pink color for players with QueryHitbox or ExpressionHolder
    else
        highlight.OutlineColor = Color3.fromRGB(0, 0, 255)  -- Blue color for players without ExpressionHolder
    end

    highlight.Adornee = player.Character
    highlight.Parent = player.Character
end

-- Function to create nametag ESP
local function createNameTagESP(player, isPink)
    if player == LocalPlayer then return end
    if not player.Character or not player.Character:FindFirstChild("Head") then return end
    if player.Character:FindFirstChild("NameTagESP") then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "NameTagESP"
    billboard.Adornee = player.Character.Head
    billboard.Size = UDim2.new(0, 200, 0, 30)
    billboard.StudsOffset = Vector3.new(0, 3, 0)  -- Move it higher
    billboard.AlwaysOnTop = true

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    
    if isPink then
        textLabel.TextColor3 = Color3.fromRGB(255, 105, 180) -- Pink color
    else
        textLabel.TextColor3 = Color3.fromRGB(0, 0, 255) -- Blue color
    end

    textLabel.TextStrokeTransparency = 0.5
    textLabel.Text = player.Name
    textLabel.TextSize = 13  -- Set TextSize to 13
    textLabel.TextScaled = false
    textLabel.Font = Enum.Font.Code  -- Computery look
    textLabel.Parent = billboard

    billboard.Parent = player.Character
end

-- Continuously check all players in the game and apply ESP
while wait(1) do
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            -- Check if the player has "ExpressionHolder" and "QueryHitbox" in their character
            local hasExpressionHolder = player.Character:FindFirstChild("ExpressionHolder")
            local hasQueryHitbox = player.Character:FindFirstChild("QueryHitbox")

            -- Set isPink to true if the player does not have QueryHitbox or has both ExpressionHolder and QueryHitbox
            local isPink = not hasQueryHitbox or (hasExpressionHolder and hasQueryHitbox)

            -- Apply highlight ESP if needed
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                if not player.Character:FindFirstChild("ESPHighlight") then
                    createHighlightESP(player, isPink)
                end
            end

            -- Apply nametag ESP if needed
            if player.Character and player.Character:FindFirstChild("Head") then
                if not player.Character:FindFirstChild("NameTagESP") then
                    createNameTagESP(player, isPink)
                end
            end
        end
    end
end
