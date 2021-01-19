--[[
  Instructions:
  Execute and Click the case bux button then enjoy!
]]

_G.Remote = nil
_G.RemoteKey = nil

local mt = getrawmetatable(game)
setreadonly(mt, false)
local old = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
    local args = {...}
    local method = getnamecallmethod()
    if not checkcaller() and method == "FireServer" and tostring(args[1]) == "Click" then
        _G.Remote = self
        _G.RemoteKey = args[3]
    end
    return old(self, ...)
end)

setreadonly(mt, true)

game:GetService("RunService").RenderStepped:Connect(function()
    if _G.Remote ~= nil and _G.RemoteKey ~= nil then
        _G.Remote:FireServer("Click", nil, _G.RemoteKey)
    end
end)
