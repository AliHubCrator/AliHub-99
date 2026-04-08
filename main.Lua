local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local Window = OrionLib:MakeWindow({Name = "AliHub | 99 Nights", HidePremium = false, SaveConfig = true, ConfigFolder = "AliHub99"})

local MainTab = Window:MakeTab({
 Name = "Главная",
 Icon = "rbxassetid://4483345998",
 PremiumOnly = false
})

MainTab:AddToggle({
 Name = "Бесконечный свет",
 Default = false,
 Callback = function(Value)
  if Value then
   game:GetService("Lighting").Brightness = 2
   game:GetService("Lighting").ClockTime = 14
   game:GetService("Lighting").FogEnd = 100000
   game:GetService("Lighting").GlobalShadows = false
  else
   game:GetService("Lighting").Brightness = 1
   game:GetService("Lighting").GlobalShadows = true
  end
 end
})

MainTab:AddSlider({
 Name = "Скорость бега",
 Min = 16,
 Max = 200,
 Default = 16,
 Color = Color3.fromRGB(255,255,255),
 Increment = 1,
 ValueName = "Speed",
 Callback = function(Value)
  game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
 end    
})

OrionLib:Init()
