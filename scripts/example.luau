-- Localscript, put Billboard, VortexFont, and Fonts as module scripts under the same object

local players = game:GetService("Players")
local billboardAPI = require(script.Parent:WaitForChild("Billboard"))

local player = players.LocalPlayer

billboardAPI.createNewBillboard("Hello world!","test",Vector3.new(0,5,5),0.0625)
billboardAPI.createNewBillboard("GOODBYE world!","test2",Vector3.new(0,5,-5),0.0625)
