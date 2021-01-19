_G.Enabled = true -- // Change true to false to disable it.

_G.RemoteKey = nil -- // Don't touch.

function killAllZombies()
  if _G.RemoteKey ~= nil then
    for i, v in next, game:GetService("Workspace").Baddies:GetChildren() do
      if v ~= nil then
        if v:FindFirstChild("HeadBox") then
          local A_1 = 
          {
              ["BodyPart"] = v:WaitForChild("HeadBox"), 
              ["Force"] = 8, 
              ["GibPower"] = 80, 
              ["Damage"] = 9e9
          }
          local A_2 = _G.RemoteKey
          local Event = v.Humanoid.Damage
          Event:FireServer(A_1, A_2)
        end;
      end;
    end;
  end;
end;


local mt = getrawmetatable(game);
local oldNameCall = mt.__namecall;

setreadonly(mt, false);

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    if not checkcaller() and method == "InvokeServer" and self.Name == "UpdateDamageKey" then
       _G.RemoteKey = args[1]
    elseif not checkcaller() and not _G.RemoteKey and method == "FireServer" and self.Name == "Damage" then
        _G.RemoteKey = args[2]
    end;
    return oldNameCall(self, ...)
end);

setreadonly(mt, true)

game:GetService("RunService").Stepped:Connect(function()
  if _G.Enabled then
    killAllZombies()
   end;
end);

-- // Throws some error about the zombie being nil which isnt a problem but it just exists too lazy to fix
