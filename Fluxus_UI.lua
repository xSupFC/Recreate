pcall(function()
game.CoreGui:FindFirstChild("FluxusLib"):Destroy()
end)

local Library = {}

--// Notificaton Value
local Starter = game.StarterGui
local NotifyIcon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"

--// Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

function Library:DragUI(frame, parent)
	parent = parent or frame
	
	local gui = parent
	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		game:GetService("TweenService"):Create(gui,TweenInfo.new(0.25), {
			Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		}):Play()
		--gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end

function Key_Textbox(text,func)
local TextBox2 = Instance.new("TextBox")

TextBox2.Name = "TextBox2"
TextBox2.Parent = Category
TextBox2.BackgroundColor3 = Color3.fromRGB(203, 145, 242)
TextBox2.Size = UDim2.new(0, 200, 0, 50)
TextBox2.Font = Enum.Font.ArialBold
TextBox2.TextColor3 = Color3.new(0.921569, 0.921569, 0.921569)
TextBox2.TextSize = 15
TextBox2.Text = text
TextBox2.TextScaled = true

Instance.new("UICorner",TextBox2)

TextBox2.FocusLost:Connect(function()
	pcall(function()
		 func(TextBox2.Text)
	 end)
 end)
end

function Key_Button(text, callback)

callback = callback or function() end

local Button2 = Instance.new("TextButton")

Button2.Name = "Button2"
Button2.Parent = Category
Button2.BackgroundColor3 = Color3.fromRGB(203, 145, 242)
Button2.Size = UDim2.new(0, 200, 0, 50)
Button2.Font = Enum.Font.ArialBold
Button2.TextColor3 = Color3.new(0.921569, 0.921569, 0.921569)
Button2.TextSize = 15
Button2.Text = text or "Button2"
Button2.AutoButtonColor = false

Instance.new("UICorner",Button2)

Button2.MouseButton1Click:Connect(function()
pcall(callback)
 end)
end

function Library:Tab(System)
local name = System.Name
local detect = System.GameName

local FluxusLib = Instance.new("ScreenGui")
local Container = Instance.new("Frame")
local Bar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Close = Instance.new("ImageButton")
local Mini = Instance.new("ImageButton")
local Categories = Instance.new("Frame")
local Category = Instance.new("ScrollingFrame")
local UIPadding = Instance.new("UIPadding")
local UIGridLayout = Instance.new("UIGridLayout")
local Toggle = Instance.new("TextButton")

FluxusLib.Name = "FluxusLib"
FluxusLib.Parent = game.CoreGui

Container.Name = "Container"
Container.Parent = FluxusLib
Container.BackgroundColor3 = Color3.fromRGB(50,50,70)
Container.BorderColor3 = Color3.new(255, 255, 255)
Container.Position = UDim2.new(0.299270064, 0, 0.328075707, 0)
Container.Size = UDim2.new(0, 452, 0, 274)

Instance.new("UICorner",Container)

Bar.Name = "Bar"
Bar.Parent = Container
Bar.BackgroundColor3 = Color3.fromRGB(40,40,60)
Bar.BorderColor3 = Color3.new(255, 255, 255)
Bar.Size = UDim2.new(0, 452, 0, 33)

Instance.new("UICorner",Bar)

Title.Name = "Title"
Title.Parent = Bar
Title.BackgroundColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(0, 124, 0, 33)
Title.Font = Enum.Font.ArialBold
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.TextSize = 15
Title.TextWrapped = false
Title.TextXAlignment = Enum.TextXAlignment.Left

if detect == true then
 Title.Text = " "..name.." | "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
elseif detect == false then
 Title.Text = " "..name
end

Close.Name = "Close"
Close.Parent = Bar
Close.BackgroundColor3 = Color3.new(1, 1, 1)
Close.BackgroundTransparency = 1
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.940265477, 0, 0.0909090936, 0)
Close.Size = UDim2.new(0, 27, 0, 27)
Close.Image = "http://www.roblox.com/asset/?id=117959738"
Close.MouseButton1Down:connect(function()
 FluxusLib:Destroy()
end)

Mini.Name = "Mini"
Mini.Parent = Bar
Mini.BackgroundColor3 = Color3.new(1, 1, 1)
Mini.BackgroundTransparency = 1
Mini.BorderSizePixel = 0
Mini.Position = UDim2.new(0.882743418, 0, 0.0909090936, 0)
Mini.Size = UDim2.new(0, 27, 0, 27)
Mini.Image = "http://www.roblox.com/asset/?id=118129065"
Mini.MouseButton1Down:connect(function()
 Container.Visible = false
 Toggle.Visible = true
end)

Categories.Name = "Categories"
Categories.Parent = Container
Categories.BackgroundColor3 = Color3.new(1, 1, 1)
Categories.BackgroundTransparency = 1
Categories.Position = UDim2.new(0, 0, 0.120437957, 0)
Categories.Size = UDim2.new(0, 452, 0, 241)

Category.Name = "Category"
Category.Parent = Categories
Category.Active = true
Category.BackgroundColor3 = Color3.new(1, 1, 1)
Category.BackgroundTransparency = 1
Category.BorderSizePixel = 0
Category.Size = UDim2.new(0, 452, 0, 241)
Category.ScrollBarThickness = 10

UIPadding.Parent = Category
UIPadding.PaddingLeft = UDim.new(0, 15)
UIPadding.PaddingTop = UDim.new(0, 10)

UIGridLayout.Parent = Category
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0, 135, 0, 35)
    
Toggle.Name = "Toggle"
Toggle.Parent = FluxusLib
Toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
Toggle.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
Toggle.Size = UDim2.new(0, 50, 0, 50)
Toggle.Font = Enum.Font.Code
Toggle.Text = "F"
Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle.TextScaled = true
Toggle.Visible = false
Toggle.AutoButtonColor = false

Instance.new("UICorner",Toggle)

Toggle.MouseButton1Down:connect(function()
    Container.Visible = true
    Toggle.Visible = false
end)

Library:DragUI(Bar, Container)

--// Notification
function Notification(text, desc, num)
Starter:SetCore("SendNotification",{
 Title = text;
 Text = desc;
 Icon = NotifyIcon;
 Duration = num;
}) 
end

local Menus = {}
function Menus:Button(text, callback)

callback = callback or function() end

local Button = Instance.new("TextButton")

Button.Name = "Button"
Button.Parent = Category
Button.BackgroundColor3 = Color3.fromRGB(203, 145, 242)
Button.Size = UDim2.new(0, 200, 0, 50)
Button.Font = Enum.Font.ArialBold
Button.TextColor3 = Color3.new(0.921569, 0.921569, 0.921569)
Button.TextSize = 15
Button.Text = text or "Button"
Button.TextScaled = false
Button.AutoButtonColor = false

Instance.new("UICorner",Button)

Button.MouseButton1Click:Connect(function()
pcall(callback)
 end)
end

function Menus:Textbox(text, func)

local TextBox = Instance.new("TextBox")

TextBox.Name = "TextBox"
TextBox.Parent = Category
TextBox.BackgroundColor3 = Color3.fromRGB(203, 145, 242)
TextBox.Size = UDim2.new(0, 200, 0, 50)
TextBox.Font = Enum.Font.ArialBold
TextBox.TextColor3 = Color3.new(0.921569, 0.921569, 0.921569)
TextBox.TextSize = 15
TextBox.Text = text or "TextBox"
TextBox.TextScaled = false

Instance.new("UICorner",TextBox)

TextBox.FocusLost:Connect(function()
		pcall(function()
			func(TextBox.Text)
		end)
	end)
end

function Menus:Toggle(text, state, func)

local ClickThis = Instance.new("TextButton")

ClickThis.Name = "ClickThis"
ClickThis.Parent = Category
ClickThis.BackgroundColor3 = Color3.fromRGB(203, 145, 242)
ClickThis.Size = UDim2.new(0, 200, 0, 50)
ClickThis.Font = Enum.Font.ArialBold
ClickThis.TextColor3 = Color3.new(0.921569, 0.921569, 0.921569)
ClickThis.TextSize = 15
ClickThis.Text = "❎ "..text or "ClickThis"
ClickThis.AutoButtonColor = false
ClickThis.TextScaled = false

Instance.new("UICorner",ClickThis)

			local toggled = state or false
			if toggled == true then
				ClickThis.Text = "✅ "..text
			end
			ClickThis.MouseButton1Click:Connect(function()
				if toggled == true then
					toggled = false
					pcall(function()
						func(toggled)
					end)
					ClickThis.Text = "❎ "..text
				else
					toggled = true
					pcall(function()
						func(toggled)
					end)
					ClickThis.Text = "✅ "..text
			  	end
  		end)
  end
 return Menus
end
return Library
