local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "AliHub | 99 Nights", HidePremium = false, SaveConfig = true, ConfigFolder = "AliHub99"})

-- Вкладка "Главная"
local MainTab = Window:MakeTab({
 Name = "Main",
 Icon = "rbxassetid://4483345998",
 PremiumOnly = false
})

-- Функция Бесконечного Света
MainTab:AddToggle({
 Name = "Infinite FullBright",
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

-- Регулировка скорости
MainTab:AddSlider({
 Name = "WalkSpeed",
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
