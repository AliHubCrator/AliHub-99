local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "AliHub | 99 Nights",
   LoadingTitle = "Загрузка AliHub...",
   LoadingStatus = "by Ali",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "AliHub",
      FileName = "99Nights"
   }
})

local Tab = Window:CreateTab("Главная", 4483345998)

Tab:CreateToggle({
   Name = "Бесконечный свет",
   CurrentValue = false,
   Flag = "FullBright",
   Callback = function(Value)
      if Value then
         game:GetService("Lighting").Brightness = 2
         game:GetService("Lighting").ClockTime = 14
         game:GetService("Lighting").GlobalShadows = false
      else
         game:GetService("Lighting").Brightness = 1
         game:GetService("Lighting").GlobalShadows = true
      end
   end,
})

Tab:CreateSlider({
   Name = "Скорость бега",
   Range = {16, 200},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "SpeedSlider",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

Rayfield:Notify({
   Title = "Успех!",
   Content = "AliHub загружен. Приятной игры!",
   Duration = 5,
   Image = 4483345998,
})
