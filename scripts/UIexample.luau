-- Localscript, put Billboard, VortexFont, and Fonts as module scripts under the same object

local players = game:GetService("Players")
local billboardAPI = require(script.Parent:WaitForChild("Billboard"))
local runService = game:GetService("RunService")
local workspace = game:GetService("Workspace")
local players = game:GetService("Players")

local player = players.LocalPlayer

runService.Heartbeat:Connect(function()
    local camera = workspace.CurrentCamera
    local playerPos = player.Character.Position
	billboardAPI.createNewBillboard(tostring(math.floor(playerPos.X)) .. ", " .. tostring(math.floor(playerPos.Y)) .. ", " .. tostring(math.floor(playerPos.Z)),"pos",camera.CFrame * Vector3.new(-3,-1,-3),0.05)
end)
