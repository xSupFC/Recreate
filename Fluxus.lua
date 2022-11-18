--[[

  == Fluxus UI Library ==
  (-) Credits
  - SupLua#0945 ( Main Designer )

]]

pcall(function()
  game.CoreGui:FindFirstChild("FluxusLib"):Destroy()
end)

local Library = {}

local Starter = game.StarterGui
local NotifyIcon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"

function Library:Create(text)
local FluxusLib = Instance.new("ScreenGui")
local Container = Instance.new("Frame")
local Bar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Close = Instance.new("TextButton")
local Mini = Instance.new("TextButton")
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
Container.Size = UDim2.new(0, 452, 0, 300)

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
Title.Text = " "..text
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.TextSize = 15
Title.TextWrapped = false
Title.TextXAlignment = Enum.TextXAlignment.Left

Close.Name = "Close"
Close.Parent = Bar
Close.BackgroundColor3 = Color3.new(1, 1, 1)
Close.BackgroundTransparency = 1
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.940265477, 0, 0.0909090936, 0)
Close.Size = UDim2.new(0, 27, 0, 27)
Close.Text = "X"
Close.TextSize = 12
Close.TextColor3 = Color3.fromRGB(255,255,255)

Mini.Name = "Mini"
Mini.Parent = Bar
Mini.BackgroundColor3 = Color3.new(1, 1, 1)
Mini.BackgroundTransparency = 1
Mini.BorderSizePixel = 0
Mini.Position = UDim2.new(0.882743418, 0, 0.0909090936, 0)
Mini.Size = UDim2.new(0, 27, 0, 27)
Mini.Text = "-"
Mini.TextSize = 20
Mini.TextColor3 = Color3.fromRGB(255,255,255)
Mini.MouseButton1Down:connect(function()
 Container.Visible = false
 Toggle.Visible = true
end)

Categories.Name = "Categories"
Categories.Parent = Container
Categories.BackgroundColor3 = Color3.new(1, 1, 1)
Categories.BackgroundTransparency = 1
Categories.Position = UDim2.new(0, 0, 0.120437957, 0)
Categories.Size = UDim2.new(0, 452, 0, 999)

Category.Name = "Category"
Category.Parent = Categories
Category.Active = true
Category.BackgroundColor3 = Color3.new(1, 1, 1)
Category.BackgroundTransparency = 1
Category.BorderSizePixel = 0
Category.Size = UDim2.new(0, 452, 0, 270)
Category.ScrollBarThickness = 2

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

--// Notification

function Notification(text, desc, num)
Starter:SetCore("SendNotification",{
 Title = text;
 Text = desc;
 Icon = NotifyIcon;
 Duration = num;
}) 
end

--// Close

local function MVJQRKJ_fake_script() 
	local script = Instance.new('LocalScript', Close)

	script.Parent.MouseButton1Click:Connect(function()
		FluxusLib:Destroy()
	end)
end
coroutine.wrap(MVJQRKJ_fake_script)()

--// Dragging

local function DGZPFEN_fake_script() -- Container.LocalScript 
	local script = Instance.new('LocalScript', Container)

	local players = game:service('Players');
	local player = players.LocalPlayer;
	local mouse = player:GetMouse();
	local run = game:service('RunService');
	local stepped = run.Stepped;
	draggable = function(obj)
		spawn(function()
			obj.Active = true;
			local minitial;
			local initial;
			local isdragging;
			obj.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					isdragging = true;
					minitial = input.Position;
					initial = obj.Position;
					local con;
					con = stepped:Connect(function()
						if isdragging then
							local delta = Vector3.new(mouse.X, mouse.Y, 0) - minitial;
							obj.Position = UDim2.new(initial.X.Scale, initial.X.Offset + delta.X, initial.Y.Scale, initial.Y.Offset + delta.Y);
						else
							con:Disconnect();
						end;
					end);
					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							isdragging = false;
						end;
					end);
				end;
			end);
		end)
	end;
	
	draggable(script.Parent)
end
coroutine.wrap(DGZPFEN_fake_script)()


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
Button.AutoButtonColor = false

Instance.new("UICorner",Button)

Button.MouseButton1Click:Connect(function()
pcall(callback)
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
