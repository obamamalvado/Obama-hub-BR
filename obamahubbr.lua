-- OBAMAHUB V2 by Lua God 💻
-- Estilo moderno, bordas arredondas, scroll, botão de voltar e minimizar

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local MinimizeButton = Instance.new("TextButton")
local Drag = false
local ScrollFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local ContentFrame = Instance.new("Frame")
local BackButton = Instance.new("TextButton")

-- 🖥️ Parent do GUI
ScreenGui.Name = "ObamaHub"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- 🎛️ Main Frame (menu principal)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 500, 0, 350)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

-- 🧱 Top bar com título e minimizar
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TopBar.Size = UDim2.new(1, 0, 0, 35)
TopBar.BorderSizePixel = 0

Title.Name = "Title"
Title.Parent = TopBar
Title.Text = "ObamaHub V2"
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 22
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.02, 0, 0, 0)
Title.Size = UDim2.new(0.9, 0, 1, 0)

MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = TopBar
MinimizeButton.Text = "-"
MinimizeButton.Font = Enum.Font.SourceSansBold
MinimizeButton.TextSize = 24
MinimizeButton.TextColor3 = Color3.fromRGB(255, 215, 0)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MinimizeButton.Position = UDim2.new(0.92, 0, 0, 0)
MinimizeButton.Size = UDim2.new(0.08, 0, 1, 0)

MinimizeButton.MouseButton1Click:Connect(function()
	MainFrame.Visible = false
	wait(0.5)
	MainFrame.Visible = true
end)

-- 📜 ScrollFrame com as abas
ScrollFrame.Name = "ScrollFrame"
ScrollFrame.Parent = MainFrame
ScrollFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
ScrollFrame.Position = UDim2.new(0, 0, 0.1, 0)
ScrollFrame.Size = UDim2.new(0.3, 0, 0.9, 0)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 2, 0)
ScrollFrame.ScrollBarThickness = 6
ScrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

UIListLayout.Parent = ScrollFrame
UIListLayout.Padding = UDim.new(0, 4)

-- 📂 ContentFrame onde aparece o conteúdo da aba
ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ContentFrame.Position = UDim2.new(0.3, 5, 0.1, 0)
ContentFrame.Size = UDim2.new(0.7, -5, 0.9, 0)
ContentFrame.BorderSizePixel = 0

-- 🔙 Botão de voltar
BackButton.Name = "BackButton"
BackButton.Parent = ContentFrame
BackButton.Text = "← Voltar"
BackButton.Font = Enum.Font.SourceSansBold
BackButton.TextSize = 18
BackButton.TextColor3 = Color3.fromRGB(255, 215, 0)
BackButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
BackButton.Position = UDim2.new(0, 10, 0, 10)
BackButton.Size = UDim2.new(0, 100, 0, 30)

BackButton.MouseButton1Click:Connect(function()
	ContentFrame:ClearAllChildren()
	BackButton.Parent = ContentFrame -- volta o botão
end)

-- 📁 Função pra criar botões no menu lateral
local function CreateTab(name, callback)
	local button = Instance.new("TextButton")
	button.Name = name
	button.Text = name
	button.Font = Enum.Font.SourceSansBold
	button.TextSize = 16
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	button.BorderColor3 = Color3.fromRGB(255, 215, 0)
	button.Size = UDim2.new(1, -10, 0, 35)
	button.Parent = ScrollFrame

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 6)
	corner.Parent = button

	button.MouseButton1Click:Connect(function()
		ContentFrame:ClearAllChildren()
		BackButton.Parent = ContentFrame
		callback(ContentFrame)
	end)
end

-- 🧪 Exemplo de aba
CreateTab("Home", function(frame)
	local text = Instance.new("TextLabel")
	text.Parent = frame
	text.Size = UDim2.new(1, 0, 0, 50)
	text.Position = UDim2.new(0, 0, 0.2, 0)
	text.Text = "Bem-vindo ao ObamaHub V2!"
	text.Font = Enum.Font.SourceSansBold
	text.TextSize = 22
	text.TextColor3 = Color3.fromRGB(255, 215, 0)
	text.BackgroundTransparency = 1
end)

-- 👇 ADICIONA AS ABAS AQUI (Ex: CreateTab("Avatar", function(frame) ... end))
CreateTab("Avatar", function(frame)
	local text = Instance.new("TextLabel")
	text.Parent = frame
	text.Size = UDim2.new(1, 0, 0, 50)
	text.Position = UDim2.new(0, 0, 0.2, 0)
	text.Text = "Editor de Avatar"
	text.Font = Enum.Font.SourceSansBold
	text.TextSize = 22
	text.TextColor3 = Color3.fromRGB(255, 255, 255)
	text.BackgroundTransparency = 1
end)

-- 👀 Pronto pra usar!
