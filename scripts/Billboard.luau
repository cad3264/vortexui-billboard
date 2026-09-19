local runService = game:GetService("RunService")
local workspace = game:GetService("Workspace")
local VortexFont = require(script.Parent:WaitForChild("VortexFont"))

local billboardAPI = {}

local Billboards = {}

function updateBillboards()
    local camera = workspace.CurrentCamera
    for k, billboard in pairs(Billboards) do
        for i, v in ipairs(billboard.blocks) do
            v:Destroy()
        end
    	
    	local props: VortexFont.FontProps = {
    		origin = billboard.origin,
			pixelSize = billboard.size,
			rotation = Vector3.new(camera.CFrame:ToEulerAnglesXYZ())
		}
    	billboard.blocks = VortexFont:DisplayText(props,billboard.text)
    end
end

function billboardAPI.createNewBillboard(text,textID,origin,size)
    local existedBefore = Billboards[textID] ~= nil
    Billboards[textID] = {
        origin = origin,
        text = text,
        size = size,
        blocks = Billboards[textID].blocks or {}
    }
end

function billboardAPI.removeBillboard(textID)
    for i, v in ipairs(Billboards[textID].blocks) do
        v:Destroy()
    end
    Billboards[textID] = nil
end

runService.Heartbeat:Connect(function()
	updateBillboards()
end)

return billboardAPI
