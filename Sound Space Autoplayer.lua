_G.Enabled = true

local Client = workspace.Client
local Camera = workspace.CurrentCamera
local CameraPos = Client.CameraPos

local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()

function MoveMouseToObj(obj)
   local ObjVector = Camera:WorldToScreenPoint(obj.Position)
   mousemoverel(ObjVector.X - Mouse.X, ObjVector.Y - Mouse.Y)
end

function getClosestCube()
   local ClosestCube = nil
   local ClosestDistance = math.huge

   for i,  v in next, Client:GetChildren() do
      if v.Name == "Cube" then
         local magnitude = (v.Position - CameraPos.Position).magnitude
         if magnitude < ClosestDistance then
            ClosestCube = v
            ClosestDistance = magnitude
         end
      end
   end

   return ClosestCube
end

while wait() do
    local Cube = getClosestCube()
    if _G.Enabled and Cube then
       MoveMouseToObj(Cube)
    end
end
