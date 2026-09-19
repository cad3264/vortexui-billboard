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
    Billboards[textID] = {
        origin = origin,
        blocks = {},
        text = text,
        size = size
    }
end

function billboardAPI.removeBillboard(textID)
    Billboards[textID] = nil
end

runService.Heartbeat:Connect(function()
	updateBillboards()
end)

return billboardAPI
