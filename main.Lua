local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "AliHub | PRO Edition",
   LoadingTitle = "Загрузка AliHub v2.0",
   LoadingStatus = "by Ali (Security Specialist)",
   ConfigurationSaving = {Enabled = true, FolderName = "AliHub", FileName = "99Nights"}
})

-- ВКЛАДКА: ГЛАВНАЯ
local MainTab = Window:CreateTab("Движение", 4483345998)

MainTab:CreateSlider({
   Name = "Скорость бега",
   Range = {16, 300},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value end,
})

MainTab:CreateSlider({
   Name = "Сила прыжка",
   Range = {50, 500},
   Increment = 1,
   CurrentValue = 50,
   Callback = function(Value) game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value end,
})

MainTab:CreateToggle({
   Name = "Режим полета (Fly)",
   CurrentValue = false,
   Callback = function(Value)
      -- Логика полета (упрощенная)
      local lp = game.Players.LocalPlayer
      if Value then
          _G.Flying = true
          task.spawn(function()
              while _G.Flying do
                  lp.Character.HumanoidRootPart.Velocity = Vector3.new(0, 50, 0)
                  task.wait(0.1)
              end
          end)
      else
          _G.Flying = false
      end
   end,
})

-- ВКЛАДКА: ФАРМ (Дерево/Животные)
local FarmTab = Window:CreateTab("Авто-Фарм", 4483345998)

FarmTab:CreateToggle({
   Name = "Килаура на животных",
   CurrentValue = false,
   Callback = function(Value)
      _G.KillAura = Value
      task.spawn(function()
         while _G.KillAura do
            for _, v in pairs(game.Workspace:GetChildren()) do
               if v:FindFirstChild("Humanoid") and v.Name ~= game.Players.LocalPlayer.Name then
                  local distance = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                  if distance < 20 then
                     -- Здесь должна быть активация инструмента, если он в руках
                     game:GetService("VirtualUser"):ClickButton1(Vector2.new())
                  end
               end
            end
            task.wait(0.1)
         end
      end)
   end,
})

-- ВКЛАДКА: ТЕЛЕПОРТ
local TpTab = Window:CreateTab("Телепортация", 4483345998)

TpTab:CreateButton({
   Name = "Телепорт к ребенку",
   Callback = function()
      local child = game.Workspace:FindFirstChild("Child") or game.Workspace:FindFirstChild("Baby")
      if child then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = child.HumanoidRootPart.CFrame
      else
         Rayfield:Notify({Title = "Ошибка", Content = "Ребенок не найден на карте!", Duration = 3})
      end
   end,
})

-- ВКЛАДКА: МИР
local WorldTab = Window:CreateTab("Мир", 4483345998)

WorldTab:CreateToggle({
   Name = "Бесконечный свет",
   CurrentValue = false,
   Callback = function(Value)
      game:GetService("Lighting").Brightness = Value and 2 or 1
      game:GetService("Lighting").GlobalShadows = not Value
   end,
})

Rayfield:Notify({Title = "AliHub Готов!", Content = "Наслаждайся читами, бро!", Duration = 5})
