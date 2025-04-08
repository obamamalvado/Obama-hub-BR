-- OBAMA HUB BR - By obamamalvado BR 😎🇧🇷
local ObamaGUI = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Tabs = {}
local Buttons = {}

ObamaGUI.Name = "ObamaHubBR"
ObamaGUI.Parent = game.CoreGui
ObamaGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ObamaGUI
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.BorderColor3 = Color3.fromRGB(255, 255, 0)
Frame.Position = UDim2.new(0.3, 0, 0.2, 0)
Frame.Size = UDim2.new(0, 580, 0, 360)

local function CreateTab(name)
    local Tab = Instance.new("Frame")
    Tab.Name = name
    Tab.Parent = Frame
    Tab.Size = UDim2.new(0, 580, 0, 360)
    Tab.BackgroundTransparency = 1
    Tab.Visible = false
    Tabs[name] = Tab
    return Tab
end

local function CreateButton(tab, text, func)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 200, 0, 40)
    Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Button.BorderColor3 = Color3.fromRGB(255, 255, 0)
    Button.Text = text
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Parent = tab
    Button.MouseButton1Click:Connect(func)
    table.insert(Buttons, Button)
    return Button
end

-- Tabs
local infoTab = CreateTab("Informations")
infoTab.Visible = true

local function switchTab(name)
    for i, v in pairs(Tabs) do
        v.Visible = false
    end
    Tabs[name].Visible = true
end

local y = 10
local tabNames = {
    "Informations", "Home", "Avatar", "Tool", "Animations", "Giant", "Skins",
    "Car", "Music", "Brookhaven Music", "Trolling", "Filings", "Anti Protection", "Credits"
}

for _, tabName in ipairs(tabNames) do
    local button = CreateButton(infoTab, tabName, function()
        switchTab(tabName)
    end)
    button.Position = UDim2.new(0, 10, 0, y)
    y = y + 45
end

-- Funções de cada aba
CreateButton(CreateTab("Home"), "Injetar SanderX", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/kigredns/SanderXV4.2.2/refs/heads/main/New.lua'))()
end)

CreateButton(CreateTab("Avatar"), "XScripts ShadowHub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xscripts7/XScripts/refs/heads/XScript/ShadowHub", true))()
end)

CreateButton(CreateTab("Tool"), "Tool Script", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/m0zjJLTv"))()
end)

CreateButton(CreateTab("Animations"), "Rael Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Laelmano24/Rael-Hub/main/main.txt"))()
end)

CreateButton(CreateTab("Skins"), "Redz Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Sxzayzsz/Redz-Hub/main/Script"))()
end)

CreateButton(CreateTab("Music"), "Tocar Música", function()
    -- Música test
    local sound = Instance.new("Sound", game.Workspace)
    sound.SoundId = "rbxassetid://1843529277"
    sound:Play()
end)

CreateButton(CreateTab("Brookhaven Music"), "Play Música 2", function()
    local sound = Instance.new("Sound", game.Workspace)
    sound.SoundId = "rbxassetid://1843529277"
    sound:Play()
end)

CreateButton(CreateTab("Giant"), "Ficar Gigante", function()
    game.Players.LocalPlayer.Character.Humanoid.BodyHeightScale.Value = 10
end)

CreateButton(CreateTab("Car"), "Spawn Carro", function()
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("spawn car", "All")
end)

CreateButton(CreateTab("Trolling"), "Explodir Mapinha 😈", function()
    while true do
        task.wait(0.1)
        game.Workspace:Destroy()
    end
end)

CreateButton(CreateTab("Filings"), "Zueira", function()
    for _, v in pairs(game.Players:GetChildren()) do
        v:Kick("Obama tá online 😎")
    end
end)

CreateButton(CreateTab("Anti Protection"), "Bypass Basic", function()
    setfflag("HumanoidParallelRemoveNoPhysics", "False")
    setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
end)

CreateButton(CreateTab("Credits"), "Feito por: obamamalvado BR", function()
    setclipboard("https://github.com/obamamalvado")
end)

print("✅ OBAMA HUB BR CARREGADO COM SUCESSO!")
