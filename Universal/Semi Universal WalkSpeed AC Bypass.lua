
-- >> Note: This will probably not work on all games therefor It's semi-universal. << --

_G.DefaultWalkSpeed = 16
_G.DesiredWalkSpeed = 100

local mt = getrawmetatable(game)
setreadonly(mt, false)
local oldIndex = mt.__index
local oldNewIndex = mt.__newindex

mt.__index = newcclosure(function(obj, idx)
if tostring(obj) == "Humanoid" and tostring(idx) == "WalkSpeed" then
      return _G.DefaultWalkSpeed
   end
  return oldIndex(obj, idx)
end)

mt.__newindex = newcclosure(function(obj, idx, val)
if tostring(obj) == "Humanoid" and tostring(idx) == "WalkSpeed" then
     return oldNewIndex(obj, idx, _G.DesiredWalkSpeed)
  end
 return oldNewIndex(obj, idx, val)
end)

setreadonly(mt, true)
