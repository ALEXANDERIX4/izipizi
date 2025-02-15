-- UI Setup
local ScreenGui = Instance.new("ScreenGui")
local Button = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
Button.Parent = ScreenGui

Button.Size = UDim2.new(0, 150, 0, 50)
Button.Position = UDim2.new(0.5, -75, 0.8, 0) -- Centered at the bottom
Button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Text = "FLING"
Button.Font = Enum.Font.GothamBold
Button.TextSize = 20
Button.BorderSizePixel = 0

-- Fling Function
Button.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local hrp = character.HumanoidRootPart

        -- Anti-Ragdoll (Prevents weird character behavior)
        for _, v in pairs(character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
            end
        end

        -- Massive fling force
        hrp.Velocity = Vector3.new(0, 200, 0) -- Lift up
        wait(0.1)
        hrp.Velocity = Vector3.new(math.random(-50000, 50000), 50000, math.random(-50000, 50000)) -- Fling in a random direction
    end
end)
