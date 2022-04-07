local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local venyx = library.new("Winnable Hub | Free", 5013109572)
 
 
 
local page = venyx:addPage("Auto Farm", 5012544693)
local farm = page:addSection("Auto Farm")
local theme = venyx:addPage("Theme", 5012544693)
local colors = theme:addSection("Colors")

mons = {}

for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
   table.insert(mons,v.Name)
end


farm:addToggle("Auto Farm", _G.Fa, function(value)
_G.Fa = value
end)

farm:addToggle("Auto Attack", _G.Fa2, function(value)
_G.Fa2 = value
end)

farm:addDropdown("Select Mons", mons, function(abc)
    Select = abc
end)

farm:addButton("Refresh", function()
        table.clear(mons)
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
   table.insert(mons,v.Name)
end
end)

farm:addButton("Quest Lv:2200", function()

local args = {
    [1] = "StartQuest",
    [2] = "CakeQuest1",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

end)

farm:addButton("Quest Lv:2225", function()

local args = {
    [1] = "StartQuest",
    [2] = "CakeQuest1",
    [3] = 2
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

end)

farm:addKeybind("Toggle Keybind", Enum.KeyCode.RightControl, function()
print("Activated Keybind")
venyx:toggle()
end, function()
print("Changed Keybind")
end)


spawn(function()
   game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.Fa then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies[Select].HumanoidRootPart.CFrame * CFrame.new(0,0,0)
        end
    end)
   end)
end)

spawn(function()
   game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.Fa then

for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    v.HumanoidRootPart.Size = Vector3.new(300,60,300)

v.HumanoidRootPart.CanCollide = false
end
end
end)
        end)
    end)

spawn(function()
   game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.Fa2 then
        game:GetService'VirtualUser':CaptureController()
        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
        local Cemara = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework.CameraShaker)
        Cemara.CameraShakeInstance.CameraShakeState = {FadingIn = 3, FadingOut = 2, Sustained = 0, Inactive = 1}
        end
    end)
end) 
end)


local themes = {
Background = Color3.fromRGB(24, 24, 24),
Glow = Color3.fromRGB(60, 0, 200),
Accent = Color3.fromRGB(10, 10, 10),
LightContrast = Color3.fromRGB(20, 20, 20),
DarkContrast = Color3.fromRGB(14, 14, 14),  
TextColor = Color3.fromRGB(241, 146, 255)
}
 
 
for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
colors:addColorPicker(theme, color, function(color3)
venyx:setTheme(theme, color3)
end)
end
 
-- load
venyx:SelectPage(venyx.pages[1], true)

