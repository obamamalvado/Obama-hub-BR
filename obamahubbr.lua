--[[ 
OBAMA HUB V2 - Estilo Hacker UI 
Desenvolvido por: Lua God para obamamalvado BR
Interface moderna: Preto e Amarelo Vibrante 🖤💛
]]

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "ObamaHubV2"

-- 🧱 Main frame da GUI
local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 600, 0, 400)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true

-- 🎨 Bordas arredondadas
local corner = Instance.new("UICorner", mainFrame)
corner.CornerRadius = UDim.new(0, 10)

-- 🧠 Header com título e botão de minimizar
local header = Instance.new("Frame", mainFrame)
header.Size = UDim2.new(1, 0, 0, 40)
header.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
header.BorderSizePixel = 0

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1, -40, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.Text = "OBAMA HUB V2 | estilo hacker"
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.TextSize = 18
title.Font = Enum.Font.GothamBold
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left

local minimize = Instance.new("TextButton", header)
minimize.Size = UDim2.new(0, 40, 1, 0)
minimize.Position = UDim2.new(1, -40, 0, 0)
minimize.Text = "-"
minimize.TextColor3 = Color3.fromRGB(255, 215, 0)
minimize.TextSize = 24
minimize.Font = Enum.Font.GothamBold
minimize.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
minimize.BorderSizePixel = 0

local content = Instance.new("Frame", mainFrame)
content.Size = UDim2.new(1, 0, 1, -40)
content.Position = UDim2.new(0, 0, 0, 40)
content.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
content.BorderSizePixel = 0

-- 🔂 Minimizar botão funcional
local minimized = false
minimize.MouseButton1Click:Connect(function()
	minimized = not minimized
	content.Visible = not minimized
end)

-- 📜 Sidebar com Scroll invisível (abas)
local sidebar = Instance.new("ScrollingFrame", content)
sidebar.Size = UDim2.new(0, 150, 1, 0)
sidebar.CanvasSize = UDim2.new(0, 0, 0, 0)
sidebar.ScrollBarThickness = 0
sidebar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
sidebar.BorderSizePixel = 0

local layout = Instance.new("UIListLayout", sidebar)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 4)

-- 📂 Área de conteúdo que muda com cada aba
local pages = Instance.new("Frame", content)
pages.Size = UDim2.new(1, -150, 1, 0)
pages.Position = UDim2.new(0, 150, 0, 0)
pages.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
pages.BorderSizePixel = 0
-- 🧠 Função para criar abas dinamicamente com botão no menu lateral
local function CreateTab(name, callback)
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(1, -10, 0, 35)
	button.Text = name
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.TextSize = 16
	button.Font = Enum.Font.GothamBold
	button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	button.BorderColor3 = Color3.fromRGB(255, 215, 0)
	button.Parent = sidebar

	local corner = Instance.new("UICorner", button)
	corner.CornerRadius = UDim.new(0, 6)

	button.MouseButton1Click:Connect(function()
		-- limpa o conteúdo da aba atual
		for _, v in pairs(pages:GetChildren()) do
			if v:IsA("GuiObject") then v:Destroy() end
		end
		-- executa a função de conteúdo da aba
		callback()
	end)

	-- ajusta scroll automaticamente
	task.wait()
	sidebar.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
end

-- 🔙 Botão de voltar
local function CreateBackButton()
	local back = Instance.new("TextButton")
	back.Size = UDim2.new(0, 100, 0, 30)
	back.Position = UDim2.new(0, 10, 0, 10)
	back.Text = "← Voltar"
	back.TextColor3 = Color3.fromRGB(255, 215, 0)
	back.TextSize = 16
	back.Font = Enum.Font.GothamBold
	back.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	back.Parent = pages
	back.MouseButton1Click:Connect(function()
		for _, v in pairs(pages:GetChildren()) do
			if v:IsA("GuiObject") then v:Destroy() end
		end
	end)
end
-- ✅ AVATAR
CreateTab("Avatar", function()
	CreateBackButton()

	local btn1 = Instance.new("TextButton", pages)
	btn1.Size = UDim2.new(0, 200, 0, 35)
	btn1.Position = UDim2.new(0, 10, 0, 50)
	btn1.Text = "Ficar Gigante 💪"
	btn1.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	btn1.TextColor3 = Color3.fromRGB(255, 255, 0)
	btn1.Font = Enum.Font.GothamBold
	btn1.TextSize = 14
	btn1.MouseButton1Click:Connect(function()
		for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
			if part:IsA("BasePart") then
				part.Size = Vector3.new(20, 20, 20)
			end
		end
	end)
end)

-- ✅ TOOLS
CreateTab("Tool", function()
	CreateBackButton()

	local toolBtn = Instance.new("TextButton", pages)
	toolBtn.Size = UDim2.new(0, 200, 0, 35)
	toolBtn.Position = UDim2.new(0, 10, 0, 50)
	toolBtn.Text = "Dar arma (taser)"
	toolBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	toolBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	toolBtn.Font = Enum.Font.GothamBold
	toolBtn.TextSize = 14
	toolBtn.MouseButton1Click:Connect(function()
		game:GetService("ReplicatedStorage").GiveTool:FireServer("taser")
	end)
end)
-- ✅ ANIMATIONS
CreateTab("Animations", function()
	CreateBackButton()

	local animBtn = Instance.new("TextButton", pages)
	animBtn.Size = UDim2.new(0, 200, 0, 35)
	animBtn.Position = UDim2.new(0, 10, 0, 50)
	animBtn.Text = "Loop Dança 💃"
	animBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	animBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	animBtn.Font = Enum.Font.GothamBold
	animBtn.TextSize = 14
	animBtn.MouseButton1Click:Connect(function()
		local anim = Instance.new("Animation")
		anim.AnimationId = "rbxassetid://3189773368"
		game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim):Play()
	end)
end)

-- ✅ CAR
CreateTab("Car", function()
	CreateBackButton()

	local carBtn = Instance.new("TextButton", pages)
	carBtn.Size = UDim2.new(0, 200, 0, 35)
	carBtn.Position = UDim2.new(0, 10, 0, 50)
	carBtn.Text = "Spawn Carro 🚗"
	carBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	carBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	carBtn.Font = Enum.Font.GothamBold
	carBtn.TextSize = 14
	carBtn.MouseButton1Click:Connect(function()
		game:GetService("ReplicatedStorage").LoadCar:FireServer("jeep")
	end)
end)

-- ✅ SKINS (Redz Style)
CreateTab("Skins", function()
	CreateBackButton()

	local redz = Instance.new("TextButton", pages)
	redz.Size = UDim2.new(0, 200, 0, 35)
	redz.Position = UDim2.new(0, 10, 0, 50)
	redz.Text = "Abrir Redz Hub"
	redz.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	redz.TextColor3 = Color3.fromRGB(255, 255, 255)
	redz.Font = Enum.Font.GothamBold
	redz.TextSize = 14
	redz.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Sxzayzsz/Redz-Hub/main/Script"))()
	end)
end)
-- ✅ TROLLING
CreateTab("Trolling", function()
	CreateBackButton()

	local explode = Instance.new("TextButton", pages)
	explode.Size = UDim2.new(0, 200, 0, 35)
	explode.Position = UDim2.new(0, 10, 0, 50)
	explode.Text = "Explodir mapa 💣"
	explode.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	explode.TextColor3 = Color3.fromRGB(255, 255, 255)
	explode.Font = Enum.Font.GothamBold
	explode.TextSize = 14
	explode.MouseButton1Click:Connect(function()
		game.Workspace:Destroy()
	end)
end)

-- ✅ MUSIC
CreateTab("Music", function()
	CreateBackButton()

	local music = Instance.new("TextButton", pages)
	music.Size = UDim2.new(0, 200, 0, 35)
	music.Position = UDim2.new(0, 10, 0, 50)
	music.Text = "Tocar Música 🎵"
	music.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	music.TextColor3 = Color3.fromRGB(255, 255, 255)
	music.Font = Enum.Font.GothamBold
	music.TextSize = 14
	music.MouseButton1Click:Connect(function()
		local sound = Instance.new("Sound", game.Workspace)
		sound.SoundId = "rbxassetid://1843529277"
		sound.Volume = 5
		sound:Play()
	end)
end)

-- ✅ CREDITS
CreateTab("Credits", function()
	CreateBackButton()

	local label = Instance.new("TextLabel", pages)
	label.Size = UDim2.new(0, 400, 0, 60)
	label.Position = UDim2.new(0, 10, 0, 50)
	label.Text = "OBAMAHUB V2 criado por obamamalvado BR 🇧🇷\nUI por LUA GOD 👑"
	label.TextColor3 = Color3.fromRGB(255, 215, 0)
	label.Font = Enum.Font.GothamBold
	label.TextSize = 16
	label.BackgroundTransparency = 1
end)
