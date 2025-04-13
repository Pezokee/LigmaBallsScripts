local Sprinting = game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting
local m = require(Sprinting)

while wait() do
    m.MaxStamina = 110
    m.StaminaGain = 25
    m.StaminaLoss = 0
    m.SprintSpeed = 27.45
end
