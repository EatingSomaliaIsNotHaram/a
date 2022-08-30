
getgenv().values = {}
local library = {}
local Signal = loadstring(game:HttpGet("https://pastebin.com/raw/jexi9n1h"))()
local ConfigSave = Signal.new("ConfigSave")
local ConfigLoad = Signal.new("ConfigLoad")
local txt = game:GetService("TextService")
local TweenService = game:GetService("TweenService")
function library:Tween(...)
	TweenService:Create(...):Play()
end;
local cfglocation = "aristoiscfg/"
makefolder("aristoiscfg")
function rgbtotbl(rgb)
	return {
		R = rgb.R,
		G = rgb.G,
		B = rgb.B
	}
end;
function tbltorgb(tbl)
	return Color3.new(tbl.R, tbl.G, tbl.B)
end;
local function deepCopy(original)
	local copy = {}
	for k, v in pairs(original) do
		if type(v) == "table" then
			v = deepCopy(v)
		end;
		copy[k] = v
	end;
	return copy
end;
function library:ConfigFix(cfg)
	local copy = game:GetService("HttpService"):JSONDecode(readfile(cfglocation .. cfg .. ".txt"))
	for i, Tabs in pairs(copy) do
		for i, Sectors in pairs(Tabs) do
			for i, Elements in pairs(Sectors) do
				if Elements.Color ~= nil then
					local a = Elements.Color;
					Elements.Color = tbltorgb(a)
				end
			end
		end
	end;
	return copy
end;
function library:SaveConfig(cfg)
	local copy = deepCopy(values)
	for i, Tabs in pairs(copy) do
		for i, Sectors in pairs(Tabs) do
			for i, Elements in pairs(Sectors) do
				if Elements.Color ~= nil then
					Elements.Color = {
						R = Elements.Color.R,
						G = Elements.Color.G,
						B = Elements.Color.B
					}
				end
			end
		end
	end;
	writefile(cfglocation .. cfg .. ".txt", game:GetService("HttpService"):JSONEncode(copy))
end;
local MX_ONHIT = Instance.new("ScreenGui")
do
	local OnHitFrame = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local SampleFrame = Instance.new("Frame")
	local Grad = Instance.new("Frame")
	local SampleLabel = Instance.new("TextLabel")
	local UIGradient = Instance.new("UIGradient")
	MX_ONHIT.Name = "MX_ONHIT"
	MX_ONHIT.Parent = game.CoreGui;
	MX_ONHIT.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
	OnHitFrame.Name = "OnHitFrame"
	OnHitFrame.Parent = MX_ONHIT;
	OnHitFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	OnHitFrame.BackgroundTransparency = 1.000;
	OnHitFrame.Position = UDim2.new(0.0002182585, 0, 0.00001, 0)
	OnHitFrame.Size = UDim2.new(0, 300, 0, 500)
	UIListLayout.Parent = OnHitFrame;
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
	UIListLayout.Padding = UDim.new(0, 6)
	SampleFrame.Name = "SampleFrame"
	SampleFrame.Parent = OnHitFrame;
	SampleFrame.AutomaticSize = Enum.AutomaticSize.XY;
	SampleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SampleFrame.BackgroundTransparency = 1.000;
	SampleFrame.BorderColor3 = Color3.fromRGB(7, 0, 0)
	SampleFrame.Size = UDim2.new(0, 0, 0, 24)
	Grad.Name = "Grad"
	Grad.Parent = SampleFrame;
	Grad.BackgroundColor3 = Color3.fromRGB(222, 232, 255)
	Grad.BackgroundTransparency = 1.000;
	Grad.AutomaticSize = Enum.AutomaticSize.Y;
	Grad.BorderSizePixel = 0;
	Grad.Size = UDim2.new(0, 3, 0, 24)
	SampleLabel.Name = "SampleLabel"
	SampleLabel.Parent = Grad;
	SampleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SampleLabel.BackgroundTransparency = 1.000;
	SampleLabel.BorderSizePixel = 0;
	SampleLabel.Position = UDim2.new(1.97835922, 0, 0, 0)
	SampleLabel.Size = UDim2.new(0, 0, 0, 24)
	SampleLabel.Font = Enum.Font.Ubuntu;
	SampleLabel.Text = "TEST"
	SampleLabel.TextTruncate = Enum.TextTruncate.AtEnd;
	SampleLabel.AutomaticSize = Enum.AutomaticSize.XY;
	SampleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	SampleLabel.TextSize = 13.000;
	SampleLabel.TextStrokeTransparency = 0.000;
	SampleLabel.TextTransparency = 1.000;
	SampleLabel.TextXAlignment = Enum.TextXAlignment.Left;
	UIGradient.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0.00, Color3.fromRGB(49, 49, 49)),
		ColorSequenceKeypoint.new(0.41, Color3.fromRGB(25, 25, 25)),
		ColorSequenceKeypoint.new(1.00, Color3.fromRGB(25, 25, 25))
	}
	UIGradient.Rotation = 90;
	UIGradient.Parent = SampleFrame
end;
local function CreateHitElement(text, col, time, size, size2, size3, size4)
	spawn(function()
		local Frame = MX_ONHIT.OnHitFrame.SampleFrame:Clone()
		local Grad = Frame.Grad;
		local Label = Grad.SampleLabel;
		library:Tween(Frame, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Size = UDim2.new(size, size2, size3, size4)
		})
		library:Tween(Label, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Size = UDim2.new(size, size2, size3, size4)
		})
		library:Tween(Frame, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundTransparency = 0.000
		})
		library:Tween(Grad, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundTransparency = 0.000
		})
		library:Tween(Label, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			TextTransparency = 0.000
		})
		Frame.Parent = MX_ONHIT.OnHitFrame;
		Grad.Parent = Frame;
		Label.Parent = Grad;
		Label.TextColor3 = col;
		Label.Text = text;
		wait(time)
		library:Tween(Frame, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundTransparency = 1.000
		})
		library:Tween(Grad, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundTransparency = 1.000
		})
		library:Tween(Label, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			TextTransparency = 1.000
		})
		library:Tween(Label, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			TextStrokeTransparency = 1.000
		})
		library:Tween(Frame, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Size = UDim2.new(0, 0, size3, size4)
		})
		library:Tween(Label, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Size = UDim2.new(0, 0, size3, size4)
		})
		wait(0.8)
		Frame:Destroy()
		Grad:Destroy()
		Label:Destroy()
	end)
end;
function library:New(name)
	local menu = {}
	local floppa = Instance.new("ScreenGui")
	local Menu = Instance.new("ImageLabel")
	local TextLabel = Instance.new("TextLabel")
	local TabButtons = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local Tabs = Instance.new("Frame")
	local UIGradient = Instance.new("UIGradient")
	local gradient = Instance.new("Frame")
	local UIGradient_2 = Instance.new("UIGradient")
	local gradient2 = Instance.new("Frame")
	local UIGradient_3 = Instance.new("UIGradient")
	floppa.Name = "AshleyWasHere"
	floppa.ResetOnSpawn = false;
	floppa.ZIndexBehavior = "Global"
	floppa.DisplayOrder = 420133769;
	local but = Instance.new("TextButton")
	but.Modal = true;
	but.Text = ""
	but.BackgroundTransparency = 1;
	but.Parent = floppa;
	local cursor = Instance.new("ImageLabel")
	cursor.Name = "cursor"
	cursor.Parent = floppa;
	cursor.BackgroundTransparency = 1;
	cursor.Size = UDim2.new(0, 64, 0, 64)
	cursor.Image = "rbxassetid://7543116323"
	cursor.ZIndex = 1000;
	cursor.ImageColor3 = Color3.fromRGB(255, 255, 255)
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer;
	local Mouse = LocalPlayer:GetMouse()
	game:GetService("RunService").RenderStepped:connect(function()
		cursor.Visible = floppa.Enabled;
		cursor.Position = UDim2.new(0, Mouse.X - 32, 0, Mouse.Y - 28)
	end)
	local L_234_ = Instance.new("ScreenGui")
	do
		local L_239_ = Instance.new("TextLabel")
		local L_240_ = Instance.new("Frame")
		local L_241_ = Instance.new("UIListLayout")
		L_234_.Name = "KeybindList"
		L_234_.ZIndexBehavior = Enum.ZIndexBehavior.Global;
		L_234_.Enabled = false;
		L_239_.Parent = L_234_;
		L_239_.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		L_239_.BorderColor3 = Color3.fromRGB(145, 23, 195)
		L_239_.Position = UDim2.new(0, 1, 0.300000012, 0)
		L_239_.Size = UDim2.new(0, 200, 0, 20)
		L_239_.ZIndex = 2;
		L_239_.Font = Enum.Font.SourceSans;
		L_239_.Text = "keybinds"
		L_239_.TextColor3 = Color3.fromRGB(255, 255, 255)
		L_239_.TextSize = 14.000;
		L_240_.Parent = L_239_;
		L_240_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		L_240_.BackgroundTransparency = 1.000;
		L_240_.Position = UDim2.new(0, 0, 1, 1)
		L_240_.Size = UDim2.new(1, 0, 1, 0)
		L_241_.Parent = L_240_;
		L_241_.HorizontalAlignment = Enum.HorizontalAlignment.Center;
		L_241_.SortOrder = Enum.SortOrder.LayoutOrder;
		L_234_.Parent = game.CoreGui
	end;
	function keybindadd(L_242_arg0)
		if not L_234_.TextLabel.Frame:FindFirstChild(L_242_arg0) then
			local L_243_ = Instance.new("TextLabel")
			L_243_.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
			L_243_.BackgroundTransparency = 1.000;
			L_243_.BorderColor3 = Color3.fromRGB(145, 23, 195)
			L_243_.BorderSizePixel = 1;
			L_243_.Size = UDim2.new(0, 200, 0, 20)
			L_243_.ZIndex = 2;
			L_243_.Font = Enum.Font.SourceSans;
			L_243_.Text = L_242_arg0;
			L_243_.TextColor3 = Color3.fromRGB(255, 255, 255)
			L_243_.TextSize = 14.000;
			L_243_.TextStrokeTransparency = 0;
			L_243_.Name = L_242_arg0;
			L_243_.Parent = L_234_.TextLabel.Frame
		end
	end;
	function keybindremove(L_244_arg0)
		if L_234_.TextLabel.Frame:FindFirstChild(L_244_arg0) then
			L_234_.TextLabel.Frame:FindFirstChild(L_244_arg0):Destroy()
		end
	end;
	function library:SetKeybindVisible(L_245_arg0)
		L_234_.Enabled = L_245_arg0
	end;
	Menu.Name = "Menu"
	Menu.Parent = floppa;
	Menu.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Menu.BorderSizePixel = 0;
	Menu.Position = UDim2.new(0.5, -300, 0.5, -300)
	Menu.Size = UDim2.new(0, 578, 0, 600)
	Menu.Image = "rbxassetid://8702626168"
	gradient.Name = "gradient"
	gradient.Parent = Menu;
	gradient.Position = UDim2.new(0.022, 0, 0.035, 0)
	gradient.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	gradient.BorderSizePixel = 0;
	gradient.Position = UDim2.new(0.019, 0, 0.031, 0)
	gradient.Size = UDim2.new(0, 554, 0, 2)
	UIGradient_2.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0.00, Color3.fromRGB(124, 81, 149)),
		ColorSequenceKeypoint.new(0.50, Color3.fromRGB(109, 57, 142)),
		ColorSequenceKeypoint.new(1.00, Color3.fromRGB(79, 48, 112))
	}
	UIGradient_2.Rotation = 90;
	UIGradient_2.Parent = gradient;
	gradient2.Name = "gradient"
	gradient2.Parent = Menu;
	gradient2.Position = UDim2.new(0, 0, 0, 0)
	gradient2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	gradient2.BorderSizePixel = 0;
	gradient2.Position = UDim2.new(0, 2, 0, 596)
	gradient2.Size = UDim2.new(0, 574, 0, 2)
	UIGradient_3.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0.00, Color3.fromRGB(124, 81, 149)),
		ColorSequenceKeypoint.new(0.50, Color3.fromRGB(109, 57, 142)),
		ColorSequenceKeypoint.new(1.00, Color3.fromRGB(79, 48, 112))
	}
	UIGradient_3.Rotation = 90;
	UIGradient_3.Parent = gradient2;
	TextLabel.Position = UDim2.new(0, 18, 18, 16)
	library.uiopen = true;
	game:GetService("UserInputService").InputBegan:Connect(function(key)
		if key.KeyCode == Enum.KeyCode.Insert or key.KeyCode == Enum.KeyCode.Delete then
			floppa.Enabled = not floppa.Enabled;
			library.uiopen = floppa.Enabled
		end
	end)
	library.dragging = false;
	do
		local UserInputService = game:GetService("UserInputService")
		local a = Menu;
		local dragInput;
		local dragStart;
		local startPos;
		local function update(input)
			local delta = input.Position - dragStart;
			a.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end;
		a.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				library.dragging = true;
				dragStart = input.Position;
				startPos = a.Position;
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						library.dragging = false
					end
				end)
			end
		end)
		a.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and library.dragging then
				update(input)
			end
		end)
	end;
	TextLabel.Name = name;
	TextLabel.Parent = Menu;
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000;
	TextLabel.Position = UDim2.new(0.0119792828, 0, 0, 2)
	TextLabel.Size = UDim2.new(0, 564, 0, 14)
	TextLabel.Font = Enum.Font.Ubuntu;
	TextLabel.Text = name;
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 12.000;
	TextLabel.TextStrokeTransparency = 0.000;
	TextLabel.TextWrapped = true;
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
	TabButtons.Name = "TabButtons"
	TabButtons.Parent = Menu;
	TabButtons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabButtons.BorderColor3 = Color3.fromRGB(255, 25, 5255)
	TabButtons.BorderSizePixel = 0;
	TabButtons.Position = UDim2.new(0, 11, 0, 23)
	TabButtons.Size = UDim2.new(0, 554, 0, 31)
	UIGradient.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0.00, Color3.fromRGB(49, 49, 48)),
		ColorSequenceKeypoint.new(0.96, Color3.fromRGB(31, 31, 31)),
		ColorSequenceKeypoint.new(1.00, Color3.fromRGB(31, 31, 31))
	}
	UIGradient.Rotation = 90;
	UIGradient.Parent = TabButtons;
	UIListLayout.Parent = TabButtons;
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal;
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
	Tabs.Name = "Tabs"
	Tabs.Parent = Menu;
	Tabs.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
	Tabs.BackgroundTransparency = 1.000;
	Tabs.Position = UDim2.new(0, -9, 0, 58)
	Tabs.Size = UDim2.new(0, 600, 0, 528)
	local first = true;
	local currenttab;
	function menu:Tab(text)
		local tabname;
		tabname = text;
		local Tab = {}
		values[tabname] = {}
		local TextButton = Instance.new("TextButton")
		TextButton.Parent = TabButtons;
		TextButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		TextButton.BorderColor3 = Color3.fromRGB(20, 20, 20)
		TextButton.BorderSizePixel = 2;
		TextButton.AutoButtonColor = false;
		TextButton.Text = text;
		TextButton.Size = UDim2.new(0, 92, 0, 31)
		TextButton.Font = Enum.Font.Ubuntu;
		TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextButton.TextSize = 12.000;
		TextButton.TextStrokeTransparency = 0.000;
		local TabGui = Instance.new("ScrollingFrame")
		local Left = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")
		local Right = Instance.new("ScrollingFrame")
		local UIListLayout_2 = Instance.new("UIListLayout")
		TabGui.Name = "TabGui"
		TabGui.Parent = Tabs;
		TabGui.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabGui.BackgroundTransparency = 1.000;
		TabGui.Size = UDim2.new(1, 0, 1, 0)
		TabGui.Visible = false;
		TabGui.ScrollBarThickness = 0;
		Left.Name = "Left"
		Left.Parent = TabGui;
		Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Left.BackgroundTransparency = 1.000;
		Left.Position = UDim2.new(0, 15, 0, 11)
		Left.Size = UDim2.new(0, 279, 0, 543)
		Left.ScrollBarThickness = 0;
		UIListLayout.Parent = Left;
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
		UIListLayout.Padding = UDim.new(0, 10)
		Right.Name = "Right"
		Right.Parent = TabGui;
		Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Right.BackgroundTransparency = 1.000;
		Right.Position = UDim2.new(0, 303, 0, 11)
		Right.Size = UDim2.new(0, 279, 0, 543)
		Right.ScrollBarThickness = 0;
		UIListLayout_2.Parent = Right;
		UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center;
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder;
		UIListLayout_2.Padding = UDim.new(0, 10)
		if first then
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			currenttab = text;
			TabGui.Visible = true;
			first = false
		end;
		TextButton.MouseButton1Down:Connect(function()
			if currenttab ~= text then
				for i, v in pairs(TabButtons:GetChildren()) do
					if v:IsA("TextButton") then
						library:Tween(v, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							BackgroundTransparency = 0
						})
					end
				end;
				for i, v in pairs(Tabs:GetChildren()) do
					v.Visible = false
				end;
				library:Tween(TextButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					BackgroundTransparency = 1
				})
				currenttab = text;
				TabGui.Visible = true
			end
		end)
		function Tab:MSector(text, side)
			local sectorname = text;
			local MSector = {}
			values[tabname][text] = {}
			local Section = Instance.new("Frame")
			local SectionText = Instance.new("TextLabel")
			local Inner = Instance.new("Frame")
			local sectiontabs = Instance.new("Frame")
			local UIListLayout_2 = Instance.new("UIListLayout")
			local gradient = Instance.new("Frame")
			local UIGradient_2 = Instance.new("UIGradient")
			Section.Name = "Section"
			Section.Parent = TabGui[side]
			Section.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
			Section.BackgroundTransparency = 1.000;
			Section.BorderColor3 = Color3.fromRGB(18, 18, 16)
			Section.BorderSizePixel = 0;
			Section.Size = UDim2.new(1, 0, 0, 33)
			SectionText.Name = "SectionText"
			SectionText.Parent = Section;
			SectionText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SectionText.BackgroundTransparency = 1.000;
			SectionText.Position = UDim2.new(0, 7, 0, -4)
			SectionText.Size = UDim2.new(0, 270, 0, 19)
			SectionText.ZIndex = 2;
			SectionText.Font = Enum.Font.Ubuntu;
			SectionText.TextStrokeTransparency = 0.000;
			SectionText.Text = text;
			SectionText.TextColor3 = Color3.fromRGB(255, 255, 255)
			SectionText.TextSize = 12.000;
			SectionText.TextXAlignment = Enum.TextXAlignment.Left;
			Inner.Name = "Inner"
			Inner.Parent = Section;
			Inner.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
			Inner.BackgroundTransparency = 0.000;
			Inner.BorderColor3 = Color3.fromRGB(18, 18, 16)
			Inner.BorderSizePixel = 2;
			Inner.Position = UDim2.new(0, 1, 0, 1)
			Inner.Size = UDim2.new(1, -2, 1, -9)
			gradient.Name = "gradient"
			gradient.Parent = Section;
			gradient.Position = UDim2.new(0.022, 0, 0.035, 0)
			gradient.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			gradient.BorderSizePixel = 0;
			gradient.Position = UDim2.new(0, 0, 0, -3)
			gradient.Size = UDim2.new(0, 280, 0, 2)
			UIGradient_2.Color = ColorSequence.new{
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(124, 81, 149)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(109, 57, 142)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(79, 48, 112))
			}
			UIGradient_2.Rotation = 90;
			UIGradient_2.Parent = gradient;
			sectiontabs.Name = "sectiontabs"
			sectiontabs.Parent = Section;
			sectiontabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			sectiontabs.BackgroundTransparency = 1.000;
			sectiontabs.Position = UDim2.new(0, 0, 0, 6)
			sectiontabs.Size = UDim2.new(1, 0, 0, 22)
			UIListLayout_2.Parent = sectiontabs;
			UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal;
			UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center;
			UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder;
			UIListLayout_2.Padding = UDim.new(0, 2)
			local firs = true;
			local selected;
			function MSector:Tab(text)
				local tab = {}
				values[tabname][sectorname][text] = {}
				local tabtext = text;
				local tabsize = UDim2.new(1, 0, 0, 44)
				local tab1 = Instance.new("Frame")
				local UIPadding = Instance.new("UIPadding")
				local UIListLayout = Instance.new("UIListLayout")
				local TextButton = Instance.new("TextButton")
				tab1.Name = text;
				tab1.Parent = Inner;
				tab1.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
				tab1.BorderColor3 = Color3.fromRGB(18, 18, 16)
				tab1.BorderSizePixel = 0;
				tab1.BackgroundTransparency = 1.000;
				tab1.Position = UDim2.new(0, 0, 0, 30)
				tab1.Size = UDim2.new(1, 0, 1, -21)
				tab1.Name = text;
				tab1.Visible = false;
				UIPadding.Parent = tab1;
				UIPadding.PaddingTop = UDim.new(0, 0)
				UIListLayout.Parent = tab1;
				UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
				UIListLayout.Padding = UDim.new(0, 0)
				TextButton.Parent = sectiontabs;
				TextButton.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
				TextButton.BorderColor3 = Color3.fromRGB(23, 23, 23)
				TextButton.BackgroundTransparency = 1.000;
				TextButton.Size = UDim2.new(0, txt:GetTextSize(text, 14, Enum.Font.Ubuntu, Vector2.new(700, 700)).X + 0, 1, 0)
				TextButton.Font = Enum.Font.Ubuntu;
				TextButton.Text = text;
				TextButton.TextStrokeTransparency = 0.000;
				TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.TextSize = 10.000;
				TextButton.Name = text;
				TextButton.MouseButton1Down:Connect(function()
					for i, v in pairs(Inner:GetChildren()) do
						v.Visible = false
					end;
					for i, v in pairs(sectiontabs:GetChildren()) do
						if v:IsA('TextButton') then
							library:Tween(v, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								TextColor3 = Color3.fromRGB(255, 255, 255)
							})
						end
					end;
					Section.Size = tabsize;
					tab1.Visible = true;
					library:Tween(TextButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						TextColor3 = Color3.fromRGB(109, 57, 142)
					})
				end)
				function tab:Element(type, text, data, callback)
					local Element = {}
					data = data or {}
					callback = callback or function()
					end;
					values[tabname][sectorname][tabtext][text] = {}
					if type == "Jumbobox" then
						tabsize = tabsize + UDim2.new(0, 0, 0, 39)
						Element.value = {
							Jumbobox = {}
						}
						data.options = data.options or {}
						local Dropdown = Instance.new("Frame")
						local Button = Instance.new("TextButton")
						local TextLabel = Instance.new("TextLabel")
						local Drop = Instance.new("ScrollingFrame")
						local Button_2 = Instance.new("TextButton")
						local TextLabel_2 = Instance.new("TextLabel")
						local UIListLayout = Instance.new("UIListLayout")
						local ImageLabel = Instance.new("ImageLabel")
						local TextLabel_3 = Instance.new("TextLabel")
						Dropdown.Name = "Dropdown"
						Dropdown.Parent = tab1;
						Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Dropdown.BackgroundTransparency = 1.000;
						Dropdown.Position = UDim2.new(0, 0, 0.255102038, 0)
						Dropdown.Size = UDim2.new(1, 0, 0, 39)
						Button.Name = "Button"
						Button.Parent = Dropdown;
						Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Button.BorderColor3 = Color3.fromRGB(18, 18, 16)
						Button.Position = UDim2.new(0, 30, 0, 16)
						Button.Size = UDim2.new(0, 175, 0, 17)
						Button.AutoButtonColor = false;
						Button.Font = Enum.Font.Ubuntu;
						Button.Text = ""
						Button.TextColor3 = Color3.fromRGB(255, 255, 255)
						Button.TextSize = 10.000;
						local UIGradient = Instance.new("UIGradient")
						UIGradient.Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0.00, Color3.fromRGB(49, 49, 49)),
							ColorSequenceKeypoint.new(0.50, Color3.fromRGB(42, 42, 42)),
							ColorSequenceKeypoint.new(1.00, Color3.fromRGB(33, 33, 32))
						}
						UIGradient.Rotation = 90;
						UIGradient.Parent = Button;
						TextLabel.Parent = Button;
						TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel.BackgroundTransparency = 1.000;
						TextLabel.BorderColor3 = Color3.fromRGB(18, 18, 16)
						TextLabel.Position = UDim2.new(0, 5, 0, 0)
						TextLabel.Size = UDim2.new(-0.21714285, 208, 1, 0)
						TextLabel.Font = Enum.Font.Ubuntu;
						TextLabel.Text = "-"
						TextLabel.TextStrokeTransparency = 0.000;
						TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel.TextSize = 10.000;
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
						local abcd = TextLabel;
						Drop.Name = "Drop"
						Drop.Parent = Button;
						Drop.Active = true;
						Drop.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
						Drop.BorderColor3 = Color3.fromRGB(18, 18, 16)
						Drop.Position = UDim2.new(0, 0, 1, 1)
						Drop.Size = UDim2.new(1, 0, 0, 20)
						Drop.Visible = false;
						Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282"
						Drop.CanvasSize = UDim2.new(1, 1, 1, 1)
						Drop.ScrollBarThickness = 0;
						Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282"
						Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282"
						Drop.AutomaticCanvasSize = "Y"
						Drop.ZIndex = 5;
						Drop.ScrollBarImageColor3 = Color3.fromRGB(109, 57, 142)
						UIListLayout.Parent = Drop;
						UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
						UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
						values[tabname][sectorname][tabtext][text] = Element.value;
						local num = #data.options;
						if num > 5 then
							Drop.Size = UDim2.new(1, 0, 0, 85)
						else
							Drop.Size = UDim2.new(1, 0, 0, 17 * num)
						end;
						local first = true;
						local function updatetext()
							local old = {}
							for i, v in ipairs(data.options) do
								if table.find(Element.value.Jumbobox, v) then
									table.insert(old, v)
								else
								end
							end;
							local str = ""
							if #old == 0 then
								str = "..."
							else
								if #old == 1 then
									str = old[1]
								else
									for i, v in ipairs(old) do
										if i == 1 then
											str = v
										else
											if i > 2 then
												if i < 4 then
													str = str .. ",  ..."
												end
											else
												str = str .. ",  " .. v
											end
										end
									end
								end
							end;
							abcd.Text = str
						end;
						for i, v in ipairs(data.options) do
							do
								local Button = Instance.new("TextButton")
								local TextLabel = Instance.new("TextLabel")
								Button.Name = v;
								Button.Parent = Drop;
								Button.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
								Button.BorderColor3 = Color3.fromRGB(18, 18, 16)
								Button.Position = UDim2.new(0, 30, 0, 16)
								Button.Size = UDim2.new(0, 175, 0, 17)
								Button.AutoButtonColor = false;
								Button.Font = Enum.Font.Ubuntu;
								Button.Text = ""
								Button.TextColor3 = Color3.fromRGB(255, 255, 255)
								Button.TextSize = 10.000;
								Button.BorderSizePixel = 0;
								Button.ZIndex = 6;
								TextLabel.Parent = Button;
								TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								TextLabel.BackgroundTransparency = 1.000;
								TextLabel.BorderColor3 = Color3.fromRGB(25, 25, 25)
								TextLabel.Position = UDim2.new(0, 5, 0, -1)
								TextLabel.Size = UDim2.new(-0.21714285, 208, 1, 0)
								TextLabel.Font = Enum.Font.Ubuntu;
								TextLabel.Text = v;
								TextLabel.TextStrokeTransparency = 0.000;
								TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
								TextLabel.TextSize = 10.000;
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
								TextLabel.ZIndex = 6;
								Button.MouseButton1Down:Connect(function()
									if table.find(Element.value.Jumbobox, v) then
										for i, a in pairs(Element.value.Jumbobox) do
											if a == v then
												table.remove(Element.value.Jumbobox, i)
											end
										end;
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
											TextColor3 = Color3.fromRGB(255, 255, 255)
										})
									else
										table.insert(Element.value.Jumbobox, v)
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
											TextColor3 = Color3.fromRGB(255, 255, 255)
										})
									end;
									updatetext()
									values[tabname][sectorname][tabtext][text] = Element.value;
									callback(Element.value)
								end)
								Button.MouseEnter:Connect(function()
									if not table.find(Element.value.Jumbobox, v) then
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
											TextColor3 = Color3.fromRGB(255, 255, 255)
										})
									end
								end)
								Button.MouseLeave:Connect(function()
									if not table.find(Element.value.Jumbobox, v) then
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
											TextColor3 = Color3.fromRGB(255, 255, 255)
										})
									end
								end)
								first = false
							end
						end;
						function Element:SetValue(val)
							Element.value = val;
							for i, v in pairs(Drop:GetChildren()) do
								if v.Name ~= "UIListLayout" then
									if table.find(val.Jumbobox, v.Name) then
										v.TextLabel.TextColor3 = Color3.fromRGB(109, 57, 142)
									else
										v.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
									end
								end
							end;
							updatetext()
							values[tabname][sectorname][tabtext][text] = Element.value;
							callback(val)
						end;
						if data.default then
							Element:SetValue(data.default)
						end;
						ImageLabel.Parent = Button;
						ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						ImageLabel.BackgroundTransparency = 1.000;
						ImageLabel.Position = UDim2.new(0, 165, 0, 6)
						ImageLabel.Size = UDim2.new(0, 6, 0, 4)
						ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531"
						TextLabel_3.Parent = Dropdown;
						TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel_3.BackgroundTransparency = 1.000;
						TextLabel_3.Position = UDim2.new(0, 32, 0, -1)
						TextLabel_3.Size = UDim2.new(0.111913361, 208, 0.382215232, 0)
						TextLabel_3.Font = Enum.Font.Ubuntu;
						TextLabel_3.Text = text;
						TextLabel_3.TextStrokeTransparency = 0.000;
						TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel_3.TextSize = 10.000;
						TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left;
						Button.MouseButton1Down:Connect(function()
							Drop.Visible = not Drop.Visible;
							if not Drop.Visible then
								Drop.CanvasPosition = Vector2.new(0, 0)
							end
						end)
						local indrop = false;
						local ind = false;
						Drop.MouseEnter:Connect(function()
							indrop = true
						end)
						Drop.MouseLeave:Connect(function()
							indrop = false
						end)
						Button.MouseEnter:Connect(function()
							ind = true
						end)
						Button.MouseLeave:Connect(function()
							ind = false
						end)
						game:GetService("UserInputService").InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
								if Drop.Visible == true and not indrop and not ind then
									Drop.Visible = false;
									Drop.CanvasPosition = Vector2.new(0, 0)
								end
							end
						end)
					elseif type == "TextBox" then
					elseif type == "ToggleKeybind" then
						tabsize = tabsize + UDim2.new(0, 0, 0, 16)
						Element.value = {
							Toggle = data.default and data.default.Toggle or false,
							Key,
							Type = "Always",
							Active = true
						}
						local Toggle = Instance.new("Frame")
						local Button = Instance.new("TextButton")
						local Color = Instance.new("Frame")
						local TextLabel = Instance.new("TextLabel")
						Toggle.Name = "Toggle"
						Toggle.Parent = tab1;
						Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Toggle.BackgroundTransparency = 1.000;
						Toggle.Size = UDim2.new(1, 0, 0, 15)
						Button.Name = "Button"
						Button.Parent = Toggle;
						Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Button.BackgroundTransparency = 1.000;
						Button.Size = UDim2.new(1, 0, 1, 0)
						Button.Font = Enum.Font.Ubuntu;
						Button.Text = ""
						Button.TextColor3 = Color3.fromRGB(0, 0, 0)
						Button.TextSize = 10.000;
						Color.Name = "Color"
						Color.Parent = Button;
						Color.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Color.BorderColor3 = Color3.fromRGB(18, 18, 16)
						Color.Position = UDim2.new(0, 15, 0.5, -5)
						Color.Size = UDim2.new(0, 8, 0, 8)
						local binding = false;
						TextLabel.Parent = Button;
						TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel.BackgroundTransparency = 1.000;
						TextLabel.Position = UDim2.new(0, 32, 0, -1)
						TextLabel.Size = UDim2.new(0.111913361, 208, 1, 0)
						TextLabel.Font = Enum.Font.Ubuntu;
						TextLabel.Text = text;
						TextLabel.TextStrokeTransparency = 0.000;
						TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel.TextSize = 10.000;
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
						local function update()
							if Element.value.Toggle then
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									BackgroundColor3 = Color3.fromRGB(109, 57, 142)
								})
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									BorderColor3 = Color3.fromRGB(18, 18, 16)
								})
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									TextColor3 = Color3.fromRGB(255, 255, 255)
								})
							else
								keybindremove(text)
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									BackgroundColor3 = Color3.fromRGB(46, 46, 46)
								})
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									BorderColor3 = Color3.fromRGB(18, 18, 16)
								})
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									TextColor3 = Color3.fromRGB(255, 255, 255)
								})
							end;
							values[tabname][sectorname][tabtext][text] = Element.value;
							callback(Element.value)
						end;
						Button.MouseButton1Down:Connect(function()
							if not binding then
								Element.value.Toggle = not Element.value.Toggle;
								update()
								values[tabname][sectorname][tabtext][text] = Element.value;
								callback(Element.value)
							end
						end)
						if data.default then
							update()
						end;
						values[tabname][sectorname][tabtext][text] = Element.value;
						do
							local Keybind = Instance.new("TextButton")
							local Frame = Instance.new("Frame")
							local Always = Instance.new("TextButton")
							local UIListLayout = Instance.new("UIListLayout")
							local Hold = Instance.new("TextButton")
							local Toggle = Instance.new("TextButton")
							Keybind.Name = "Keybind"
							Keybind.Parent = Button;
							Keybind.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
							Keybind.BorderColor3 = Color3.fromRGB(18, 18, 16)
							Keybind.Position = UDim2.new(0, 270, 0.5, -6)
							Keybind.Text = "none"
							Keybind.BackgroundTransparency = 1.000;
							Keybind.Size = UDim2.new(0, 43, 0, 12)
							Keybind.Size = UDim2.new(0, txt:GetTextSize("none", 14, Enum.Font.Ubuntu, Vector2.new(700, 12)).X + 5, 0, 12)
							Keybind.AutoButtonColor = false;
							Keybind.Font = Enum.Font.Ubuntu;
							Keybind.TextColor3 = Color3.fromRGB(255, 255, 255)
							Keybind.TextSize = 10.000;
							Keybind.AnchorPoint = Vector2.new(1, 0)
							Keybind.ZIndex = 3;
							Frame.Parent = Keybind;
							Frame.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
							Frame.BorderColor3 = Color3.fromRGB(18, 18, 16)
							Frame.Position = UDim2.new(1, -49, 0, 1)
							Frame.Size = UDim2.new(0, 49, 0, 49)
							Frame.Visible = false;
							Frame.ZIndex = 3;
							Always.Name = "Always"
							Always.Parent = Frame;
							Always.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
							Always.BackgroundTransparency = 1.000;
							Always.BorderColor3 = Color3.fromRGB(18, 18, 16)
							Always.Position = UDim2.new(-3.03289485, 231, 0.115384616, -6)
							Always.Size = UDim2.new(1, 0, 0, 16)
							Always.AutoButtonColor = false;
							Always.Font = Enum.Font.Ubuntu;
							Always.Text = "Always"
							Always.TextStrokeTransparency = 0.000;
							Always.TextColor3 = Color3.fromRGB(109, 57, 142)
							Always.TextSize = 10.000;
							Always.ZIndex = 3;
							UIListLayout.Parent = Frame;
							UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
							UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
							Hold.Name = "Hold"
							Hold.Parent = Frame;
							Hold.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
							Hold.BackgroundTransparency = 1.000;
							Hold.BorderColor3 = Color3.fromRGB(18, 18, 16)
							Hold.Position = UDim2.new(-3.03289485, 231, 0.115384616, -6)
							Hold.Size = UDim2.new(1, 0, 0, 16)
							Hold.TextStrokeTransparency = 0.000;
							Hold.AutoButtonColor = false;
							Hold.Font = Enum.Font.Ubuntu;
							Hold.Text = "Hold"
							Hold.TextColor3 = Color3.fromRGB(255, 255, 255)
							Hold.TextSize = 10.000;
							Hold.ZIndex = 3;
							Toggle.Name = "Toggle"
							Toggle.Parent = Frame;
							Toggle.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
							Toggle.BackgroundTransparency = 1.000;
							Toggle.BorderColor3 = Color3.fromRGB(18, 18, 16)
							Toggle.Position = UDim2.new(-3.03289485, 231, 0.115384616, -6)
							Toggle.Size = UDim2.new(1, 0, 0, 16)
							Toggle.AutoButtonColor = false;
							Toggle.Font = Enum.Font.Ubuntu;
							Toggle.Text = "Toggle"
							Toggle.TextStrokeTransparency = 0.000;
							Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
							Toggle.TextSize = 10.000;
							Toggle.ZIndex = 3;
							for _, button in pairs(Frame:GetChildren()) do
								if button:IsA("TextButton") then
									button.MouseButton1Down:Connect(function()
										Element.value.Type = button.Text;
										Frame.Visible = false;
										Element.value.Active = Element.value.Type == "Always" and true or false;
										if Element.value.Type == "Always" then
											keybindremove(text)
										end;
										for _, button in pairs(Frame:GetChildren()) do
											if button:IsA("TextButton") and button.Text ~= Element.value.Type then
												button.Font = Enum.Font.Ubuntu;
												library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
													TextColor3 = Color3.fromRGB(255, 255, 255)
												})
											end
										end;
										button.Font = Enum.Font.Ubuntu;
										button.TextColor3 = Color3.fromRGB(109, 57, 142)
										values[tabname][sectorname][tabtext][text] = Element.value;
										callback(Element.value)
									end)
									button.MouseEnter:Connect(function()
										if Element.value.Type ~= button.Text then
											library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
												TextColor3 = Color3.fromRGB(255, 255, 255)
											})
										end
									end)
									button.MouseLeave:Connect(function()
										if Element.value.Type ~= button.Text then
											library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
												TextColor3 = Color3.fromRGB(255, 255, 255)
											})
										end
									end)
								end
							end;
							Keybind.MouseButton1Down:Connect(function()
								if not binding then
									wait()
									binding = true;
									Keybind.Text = "-"
									Keybind.Size = UDim2.new(0, txt:GetTextSize("-", 14, Enum.Font.Ubuntu, Vector2.new(700, 12)).X + 4, 0, 12)
								end
							end)
							Keybind.MouseButton2Down:Connect(function()
								if not binding then
									Frame.Visible = not Frame.Visible
								end
							end)
							local Player = game.Players.LocalPlayer;
							local Mouse = Player:GetMouse()
							local InFrame = false;
							Frame.MouseEnter:Connect(function()
								InFrame = true
							end)
							Frame.MouseLeave:Connect(function()
								InFrame = false
							end)
							local InFrame2 = false;
							Keybind.MouseEnter:Connect(function()
								InFrame2 = true
							end)
							Keybind.MouseLeave:Connect(function()
								InFrame2 = false
							end)
							game:GetService("UserInputService").InputBegan:Connect(function(input)
								if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 and not binding then
									if Frame.Visible == true and not InFrame and not InFrame2 then
										Frame.Visible = false
									end
								end;
								if binding then
									binding = false;
									Keybind.Text = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name:upper() or input.UserInputType.Name:upper()
									Keybind.Size = UDim2.new(0, txt:GetTextSize(Keybind.Text, 14, Enum.Font.Ubuntu, Vector2.new(700, 12)).X + 5, 0, 12)
									Element.value.Key = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name or input.UserInputType.Name;
									if input.KeyCode.Name == "Backspace" then
										Keybind.Text = "none"
										Keybind.Size = UDim2.new(0, txt:GetTextSize(Keybind.Text, 14, Enum.Font.Ubuntu, Vector2.new(700, 12)).X + 4, 0, 12)
										Element.value.Key = nil
									end
								else
									if Element.value.Key ~= nil then
										if string.find(Element.value.Key, "Mouse") then
											if input.UserInputType == Enum.UserInputType[Element.value.Key] then
												if Element.value.Type == "Hold" then
													Element.value.Active = true;
													if Element.value.Active and Element.value.Toggle then
														keybindhold(text)
													else
														keybindremove(text)
													end
												elseif Element.value.Type == "Toggle" then
													Element.value.Active = not Element.value.Active;
													if Element.value.Active and Element.value.Toggle then
														keybindadd(text)
													else
														keybindremove(text)
													end
												end
											end
										else
											if input.KeyCode == Enum.KeyCode[Element.value.Key] then
												if Element.value.Type == "Hold" then
													Element.value.Active = true;
													if Element.value.Active and Element.value.Toggle then
														keybindhold(text)
													else
														keybindremove(text)
													end
												elseif Element.value.Type == "Toggle" then
													Element.value.Active = not Element.value.Active;
													if Element.value.Active and Element.value.Toggle then
														keybindadd(text)
													else
														keybindremove(text)
													end
												end
											end
										end
									else
										Element.value.Active = true
									end
								end;
								values[tabname][sectorname][tabtext][text] = Element.value;
								callback(Element.value)
							end)
							game:GetService("UserInputService").InputEnded:Connect(function(input)
								if Element.value.Key ~= nil then
									if string.find(Element.value.Key, "Mouse") then
										if input.UserInputType == Enum.UserInputType[Element.value.Key] then
											if Element.value.Type == "Hold" then
												Element.value.Active = false;
												if Element.value.Active and Element.value.Toggle then
													keybindadd(text)
												else
													keybindremove(text)
												end
											end
										end
									else
										if input.KeyCode == Enum.KeyCode[Element.value.Key] then
											if Element.value.Type == "Hold" then
												Element.value.Active = false;
												if Element.value.Active and Element.value.Toggle then
													keybindhold(text)
												else
													keybindremove(text)
												end
											end
										end
									end
								end;
								values[tabname][sectorname][tabtext][text] = Element.value;
								callback(Element.value)
							end)
						end;
						function Element:SetValue(value)
							Element.value = value;
							update()
						end
					elseif type == "Toggle" then
						tabsize = tabsize + UDim2.new(0, 0, 0, 16)
						Element.value = {
							Toggle = data.default and data.default.Toggle or false
						}
						local Toggle = Instance.new("Frame")
						local Button = Instance.new("TextButton")
						local Color = Instance.new("Frame")
						local TextLabel = Instance.new("TextLabel")
						Toggle.Name = "Toggle"
						Toggle.Parent = tab1;
						Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Toggle.BackgroundTransparency = 1.000;
						Toggle.Size = UDim2.new(1, 0, 0, 15)
						Button.Name = "Button"
						Button.Parent = Toggle;
						Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Button.BackgroundTransparency = 1.000;
						Button.Size = UDim2.new(1, 0, 1, 0)
						Button.Font = Enum.Font.Ubuntu;
						Button.Text = ""
						Button.TextColor3 = Color3.fromRGB(0, 0, 0)
						Button.TextSize = 10.000;
						Color.Name = "Color"
						Color.Parent = Button;
						Color.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
						Color.BorderColor3 = Color3.fromRGB(18, 18, 16)
						Color.Position = UDim2.new(0, 15, 0.5, -5)
						Color.Size = UDim2.new(0, 8, 0, 8)
						TextLabel.Parent = Button;
						TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel.BackgroundTransparency = 1.000;
						TextLabel.Position = UDim2.new(0, 32, 0, -1)
						TextLabel.Size = UDim2.new(0.111913361, 208, 1, 0)
						TextLabel.Font = Enum.Font.Ubuntu;
						TextLabel.Text = text;
						TextLabel.TextStrokeTransparency = 0.000;
						TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel.TextSize = 10.000;
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
						local function update()
							if Element.value.Toggle then
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									BackgroundColor3 = Color3.fromRGB(109, 57, 142)
								})
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									BorderColor3 = Color3.fromRGB(18, 18, 16)
								})
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									TextColor3 = Color3.fromRGB(255, 255, 255)
								})
							else
								keybindremove(text)
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									BackgroundColor3 = Color3.fromRGB(46, 46, 46)
								})
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									BorderColor3 = Color3.fromRGB(18, 18, 16)
								})
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									TextColor3 = Color3.fromRGB(255, 255, 255)
								})
							end;
							values[tabname][sectorname][tabtext][text] = Element.value
						end;
						Button.MouseButton1Down:Connect(function()
							Element.value.Toggle = not Element.value.Toggle;
							update()
							values[tabname][sectorname][tabtext][text] = Element.value;
							callback(Element.value)
						end)
						if data.default then
							update()
						end;
						values[tabname][sectorname][tabtext][text] = Element.value;
						function Element:SetValue(value)
							Element.value = value;
							values[tabname][sectorname][tabtext][text] = Element.value;
							update()
							callback(Element.value)
						end
					elseif type == "ToggleColor" then
						tabsize = tabsize + UDim2.new(0, 0, 0, 16)
						Element.value = {
							Toggle = data.default and data.default.Toggle or false,
							Color = data.default and data.default.Color or Color3.fromRGB(255, 255, 255)
						}
						local Toggle = Instance.new("Frame")
						local Button = Instance.new("TextButton")
						local Color = Instance.new("Frame")
						local TextLabel = Instance.new("TextLabel")
						Toggle.Name = "Toggle"
						Toggle.Parent = tab1;
						Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Toggle.BackgroundTransparency = 1.000;
						Toggle.Size = UDim2.new(1, 0, 0, 15)
						Button.Name = "Button"
						Button.Parent = Toggle;
						Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Button.BackgroundTransparency = 1.000;
						Button.Size = UDim2.new(1, 0, 1, 0)
						Button.Font = Enum.Font.Ubuntu;
						Button.Text = ""
						Button.TextColor3 = Color3.fromRGB(0, 0, 0)
						Button.TextSize = 10.000;
						Color.Name = "Color"
						Color.Parent = Button;
						Color.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
						Color.BorderColor3 = Color3.fromRGB(18, 18, 16)
						Color.Position = UDim2.new(0, 15, 0.5, -5)
						Color.Size = UDim2.new(0, 8, 0, 8)
						TextLabel.Parent = Button;
						TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel.BackgroundTransparency = 1.000;
						TextLabel.Position = UDim2.new(0, 32, 0, -1)
						TextLabel.Size = UDim2.new(0.111913361, 208, 1, 0)
						TextLabel.Font = Enum.Font.Ubuntu;
						TextLabel.Text = text;
						TextLabel.TextStrokeTransparency = 0.000;
						TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel.TextSize = 10.000;
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
						local function update()
							if Element.value.Toggle then
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									BackgroundColor3 = Color3.fromRGB(109, 57, 142)
								})
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									BorderColor3 = Color3.fromRGB(18, 18, 16)
								})
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									TextColor3 = Color3.fromRGB(255, 255, 255)
								})
							else
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									BackgroundColor3 = Color3.fromRGB(46, 46, 46)
								})
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									BorderColor3 = Color3.fromRGB(18, 18, 16)
								})
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									TextColor3 = Color3.fromRGB(255, 255, 255)
								})
							end;
							values[tabname][sectorname][tabtext][text] = Element.value;
							callback(Element.value)
						end;
						local ColorH, ColorS, ColorV;
						local ColorP = Instance.new("TextButton")
						local Frame = Instance.new("Frame")
						local Colorpick = Instance.new("ImageButton")
						local ColorDrag = Instance.new("Frame")
						local Huepick = Instance.new("ImageButton")
						local Huedrag = Instance.new("Frame")
						ColorP.Name = "ColorP"
						ColorP.Parent = Button;
						ColorP.AnchorPoint = Vector2.new(1, 0)
						ColorP.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
						ColorP.BorderColor3 = Color3.fromRGB(18, 18, 16)
						ColorP.Position = UDim2.new(0, 270, 0.5, -4)
						ColorP.Size = UDim2.new(0, 18, 0, 8)
						ColorP.AutoButtonColor = false;
						ColorP.Font = Enum.Font.Ubuntu;
						ColorP.Text = ""
						ColorP.TextColor3 = Color3.fromRGB(255, 255, 255)
						ColorP.TextSize = 10.000;
						Frame.Parent = ColorP;
						Frame.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
						Frame.BorderColor3 = Color3.fromRGB(18, 18, 16)
						Frame.Position = UDim2.new(-0.666666687, -170, 1.375, 0)
						Frame.Size = UDim2.new(0, 200, 0, 170)
						Frame.Visible = false;
						Frame.ZIndex = 3;
						Colorpick.Name = "Colorpick"
						Colorpick.Parent = Frame;
						Colorpick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Colorpick.BorderColor3 = Color3.fromRGB(18, 18, 16)
						Colorpick.ClipsDescendants = false;
						Colorpick.Position = UDim2.new(0, 40, 0, 10)
						Colorpick.Size = UDim2.new(0, 150, 0, 150)
						Colorpick.AutoButtonColor = false;
						Colorpick.Image = "rbxassetid://4155801252"
						Colorpick.ImageColor3 = Color3.fromRGB(255, 0, 0)
						Colorpick.ZIndex = 3;
						ColorDrag.Name = "ColorDrag"
						ColorDrag.Parent = Colorpick;
						ColorDrag.AnchorPoint = Vector2.new(0.5, 0.5)
						ColorDrag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						ColorDrag.BorderColor3 = Color3.fromRGB(18, 18, 16)
						ColorDrag.Size = UDim2.new(0, 4, 0, 4)
						ColorDrag.ZIndex = 3;
						Huepick.Name = "Huepick"
						Huepick.Parent = Frame;
						Huepick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Huepick.BorderColor3 = Color3.fromRGB(18, 18, 16)
						Huepick.ClipsDescendants = false;
						Huepick.Position = UDim2.new(0, 10, 0, 10)
						Huepick.Size = UDim2.new(0, 20, 0, 150)
						Huepick.AutoButtonColor = false;
						Huepick.Image = "rbxassetid://3641079629"
						Huepick.ImageColor3 = Color3.fromRGB(255, 0, 0)
						Huepick.ImageTransparency = 1;
						Huepick.BackgroundTransparency = 0;
						Huepick.ZIndex = 3;
						local HueFrameGradient = Instance.new("UIGradient")
						HueFrameGradient.Rotation = 90;
						HueFrameGradient.Name = "HueFrameGradient"
						HueFrameGradient.Parent = Huepick;
						HueFrameGradient.Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
							ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 0, 255)),
							ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 0, 255)),
							ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)),
							ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 255, 0)),
							ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 255, 0)),
							ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))
						}
						Huedrag.Name = "Huedrag"
						Huedrag.Parent = Huepick;
						Huedrag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Huedrag.BorderColor3 = Color3.fromRGB(18, 18, 16)
						Huedrag.Size = UDim2.new(1, 0, 0, 2)
						Huedrag.ZIndex = 3;
						ColorP.MouseButton1Down:Connect(function()
							Frame.Visible = not Frame.Visible
						end)
						local abc = false;
						local inCP = false;
						ColorP.MouseEnter:Connect(function()
							abc = true
						end)
						ColorP.MouseLeave:Connect(function()
							abc = false
						end)
						Frame.MouseEnter:Connect(function()
							inCP = true
						end)
						Frame.MouseLeave:Connect(function()
							inCP = false
						end)
						ColorH = (math.clamp(Huedrag.AbsolutePosition.Y - Huepick.AbsolutePosition.Y, 0, Huepick.AbsoluteSize.Y) / Huepick.AbsoluteSize.Y)
						ColorS = 1 - (math.clamp(ColorDrag.AbsolutePosition.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X) / Colorpick.AbsoluteSize.X)
						ColorV = 1 - (math.clamp(ColorDrag.AbsolutePosition.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y) / Colorpick.AbsoluteSize.Y)
						if data.default.Color ~= nil then
							ColorH, ColorS, ColorV = data.default.Color:ToHSV()
							ColorH = math.clamp(ColorH, 0, 1)
							ColorS = math.clamp(ColorS, 0, 1)
							ColorV = math.clamp(ColorV, 0, 1)
							ColorDrag.Position = UDim2.new(1 - ColorS, 0, 1 - ColorV, 0)
							Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)
							ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
							Huedrag.Position = UDim2.new(0, 0, 1 - ColorH, -1)
						end;
						local mouse = LocalPlayer:GetMouse()
						game:GetService("UserInputService").InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
								if not dragging and not abc and not inCP then
									Frame.Visible = false
								end
							end
						end)
						local function updateColor()
							local ColorX = (math.clamp(mouse.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X) / Colorpick.AbsoluteSize.X)
							local ColorY = (math.clamp(mouse.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y) / Colorpick.AbsoluteSize.Y)
							ColorDrag.Position = UDim2.new(ColorX, 0, ColorY, 0)
							ColorS = 1 - ColorX;
							ColorV = 1 - ColorY;
							Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)
							ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
							values[tabname][sectorname][tabtext][text] = Element.value;
							Element.value.Color = Color3.fromHSV(ColorH, ColorS, ColorV)
							callback(Element.value)
						end;
						local function updateHue()
							local y = math.clamp(mouse.Y - Huepick.AbsolutePosition.Y, 0, 148)
							Huedrag.Position = UDim2.new(0, 0, 0, y)
							hue = y / 148;
							ColorH = 1 - hue;
							Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)
							ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
							values[tabname][sectorname][tabtext][text] = Element.value;
							Element.value.Color = Color3.fromHSV(ColorH, ColorS, ColorV)
							callback(Element.value)
						end;
						Colorpick.MouseButton1Down:Connect(function()
							updateColor()
							moveconnection = mouse.Move:Connect(function()
								updateColor()
							end)
							releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)
								if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
									updateColor()
									moveconnection:Disconnect()
									releaseconnection:Disconnect()
								end
							end)
						end)
						Huepick.MouseButton1Down:Connect(function()
							updateHue()
							moveconnection = mouse.Move:Connect(function()
								updateHue()
							end)
							releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)
								if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
									updateHue()
									moveconnection:Disconnect()
									releaseconnection:Disconnect()
								end
							end)
						end)
						Button.MouseButton1Down:Connect(function()
							Element.value.Toggle = not Element.value.Toggle;
							update()
							values[tabname][sectorname][tabtext][text] = Element.value;
							callback(Element.value)
						end)
						if data.default then
							update()
						end;
						values[tabname][sectorname][tabtext][text] = Element.value;
						function Element:SetValue(value)
							Element.value = value;
							local duplicate = Color3.new(value.Color.R, value.Color.G, value.Color.B)
							ColorH, ColorS, ColorV = duplicate:ToHSV()
							ColorH = math.clamp(ColorH, 0, 1)
							ColorS = math.clamp(ColorS, 0, 1)
							ColorV = math.clamp(ColorV, 0, 1)
							ColorDrag.Position = UDim2.new(1 - ColorS, 0, 1 - ColorV, 0)
							Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)
							ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
							update()
							Huedrag.Position = UDim2.new(0, 0, 1 - ColorH, -1)
						end
					elseif type == "ToggleTrans" then
						tabsize = tabsize + UDim2.new(0, 0, 0, 16)
						Element.value = {
							Toggle = data.default and data.default.Toggle or false,
							Color = data.default and data.default.Color or Color3.fromRGB(255, 255, 255),
							Transparency = data.default and data.default.Transparency or 0
						}
						local Toggle = Instance.new("Frame")
						local Button = Instance.new("TextButton")
						local Color = Instance.new("Frame")
						local TextLabel = Instance.new("TextLabel")
						Toggle.Name = "Toggle"
						Toggle.Parent = tab1;
						Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Toggle.BackgroundTransparency = 1.000;
						Toggle.Size = UDim2.new(1, 0, 0, 15)
						Button.Name = "Button"
						Button.Parent = Toggle;
						Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Button.BackgroundTransparency = 1.000;
						Button.Size = UDim2.new(1, 0, 1, 0)
						Button.Font = Enum.Font.Ubuntu;
						Button.Text = ""
						Button.TextColor3 = Color3.fromRGB(0, 0, 0)
						Button.TextSize = 10.000;
						Color.Name = "Color"
						Color.Parent = Button;
						Color.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
						Color.BorderColor3 = Color3.fromRGB(18, 18, 16)
						Color.Position = UDim2.new(0, 15, 0.5, -5)
						Color.Size = UDim2.new(0, 8, 0, 8)
						TextLabel.Parent = Button;
						TextLabel.BackgroundColor3 = Color3.fromRGB(109, 57, 142)
						TextLabel.BackgroundTransparency = 1.000;
						TextLabel.Position = UDim2.new(0, 32, 0, -1)
						TextLabel.Size = UDim2.new(0.111913361, 208, 1, 0)
						TextLabel.Font = Enum.Font.Ubuntu;
						TextLabel.Text = text;
						TextLabel.TextStrokeTransparency = 0.000;
						TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel.TextSize = 10.000;
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
						local function update()
							if Element.value.Toggle then
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									BackgroundColor3 = Color3.fromRGB(109, 57, 142)
								})
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									BorderColor3 = Color3.fromRGB(18, 18, 16)
								})
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									TextColor3 = Color3.fromRGB(255, 255, 255)
								})
							else
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									BackgroundColor3 = Color3.fromRGB(46, 46, 46)
								})
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									BorderColor3 = Color3.fromRGB(18, 18, 16)
								})
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									TextColor3 = Color3.fromRGB(255, 255, 255)
								})
							end;
							values[tabname][sectorname][tabtext][text] = Element.value;
							callback(Element.value)
						end;
						local ColorH, ColorS, ColorV;
						local ColorP = Instance.new("TextButton")
						local Frame = Instance.new("Frame")
						local Colorpick = Instance.new("ImageButton")
						local ColorDrag = Instance.new("Frame")
						local Huepick = Instance.new("ImageButton")
						local Huedrag = Instance.new("Frame")
						ColorP.Name = "ColorP"
						ColorP.Parent = Button;
						ColorP.AnchorPoint = Vector2.new(1, 0)
						ColorP.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
						ColorP.BorderColor3 = Color3.fromRGB(18, 18, 16)
						ColorP.Position = UDim2.new(0, 270, 0.5, -4)
						ColorP.Size = UDim2.new(0, 18, 0, 8)
						ColorP.AutoButtonColor = false;
						ColorP.Font = Enum.Font.Ubuntu;
						ColorP.Text = ""
						ColorP.TextColor3 = Color3.fromRGB(255, 255, 255)
						ColorP.TextSize = 10.000;
						Frame.Parent = ColorP;
						Frame.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
						Frame.BorderColor3 = Color3.fromRGB(18, 18, 16)
						Frame.Position = UDim2.new(-0.666666687, -170, 1.375, 0)
						Frame.Size = UDim2.new(0, 200, 0, 190)
						Frame.Visible = false;
						Frame.ZIndex = 3;
						Colorpick.Name = "Colorpick"
						Colorpick.Parent = Frame;
						Colorpick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Colorpick.BorderColor3 = Color3.fromRGB(18, 18, 16)
						Colorpick.ClipsDescendants = false;
						Colorpick.Position = UDim2.new(0, 40, 0, 10)
						Colorpick.Size = UDim2.new(0, 150, 0, 150)
						Colorpick.AutoButtonColor = false;
						Colorpick.Image = "rbxassetid://4155801252"
						Colorpick.ImageColor3 = Color3.fromRGB(255, 0, 0)
						Colorpick.ZIndex = 3;
						ColorDrag.Name = "ColorDrag"
						ColorDrag.Parent = Colorpick;
						ColorDrag.AnchorPoint = Vector2.new(0.5, 0.5)
						ColorDrag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						ColorDrag.BorderColor3 = Color3.fromRGB(25, 25, 25)
						ColorDrag.Size = UDim2.new(0, 4, 0, 4)
						ColorDrag.ZIndex = 3;
						Huepick.Name = "Huepick"
						Huepick.Parent = Frame;
						Huepick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Huepick.BorderColor3 = Color3.fromRGB(18, 18, 16)
						Huepick.ClipsDescendants = true;
						Huepick.Position = UDim2.new(0, 10, 0, 10)
						Huepick.Size = UDim2.new(0, 20, 0, 150)
						Huepick.AutoButtonColor = false;
						Huepick.Image = "rbxassetid://3641079629"
						Huepick.ImageColor3 = Color3.fromRGB(255, 0, 0)
						Huepick.ImageTransparency = 1;
						Huepick.BackgroundTransparency = 0;
						Huepick.ZIndex = 3;
						local HueFrameGradient = Instance.new("UIGradient")
						HueFrameGradient.Rotation = 90;
						HueFrameGradient.Name = "HueFrameGradient"
						HueFrameGradient.Parent = Huepick;
						HueFrameGradient.Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
							ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 0, 255)),
							ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 0, 255)),
							ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)),
							ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 255, 0)),
							ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 255, 0)),
							ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))
						}
						Huedrag.Name = "Huedrag"
						Huedrag.Parent = Huepick;
						Huedrag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Huedrag.BorderColor3 = Color3.fromRGB(18, 18, 16)
						Huedrag.Size = UDim2.new(1, 0, 0, 2)
						Huedrag.ZIndex = 3;
						local Transpick = Instance.new("ImageButton")
						local Transcolor = Instance.new("ImageLabel")
						local Transdrag = Instance.new("Frame")
						Transpick.Name = "Transpick"
						Transpick.Parent = Frame;
						Transpick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Transpick.BorderColor3 = Color3.fromRGB(18, 18, 16)
						Transpick.Position = UDim2.new(0, 10, 0, 167)
						Transpick.Size = UDim2.new(0, 180, 0, 15)
						Transpick.AutoButtonColor = false;
						Transpick.Image = "rbxassetid://3887014957"
						Transpick.ScaleType = Enum.ScaleType.Tile;
						Transpick.TileSize = UDim2.new(0, 10, 0, 10)
						Transpick.ZIndex = 3;
						Transcolor.Name = "Transcolor"
						Transcolor.Parent = Transpick;
						Transcolor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Transcolor.BackgroundTransparency = 1.000;
						Transcolor.Size = UDim2.new(1, 0, 1, 0)
						Transcolor.Image = "rbxassetid://3887017050"
						Transcolor.ImageColor3 = Color3.fromRGB(255, 0, 4)
						Transcolor.ZIndex = 3;
						Transdrag.Name = "Transdrag"
						Transdrag.Parent = Transcolor;
						Transdrag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Transdrag.BorderColor3 = Color3.fromRGB(18, 18, 16)
						Transdrag.Position = UDim2.new(0, -1, 0, 0)
						Transdrag.Size = UDim2.new(0, 2, 1, 0)
						Transdrag.ZIndex = 3;
						ColorP.MouseButton1Down:Connect(function()
							Frame.Visible = not Frame.Visible
						end)
						local abc = false;
						local inCP = false;
						ColorP.MouseEnter:Connect(function()
							abc = true
						end)
						ColorP.MouseLeave:Connect(function()
							abc = false
						end)
						Frame.MouseEnter:Connect(function()
							inCP = true
						end)
						Frame.MouseLeave:Connect(function()
							inCP = false
						end)
						ColorH = (math.clamp(Huedrag.AbsolutePosition.Y - Huepick.AbsolutePosition.Y, 0, Huepick.AbsoluteSize.Y) / Huepick.AbsoluteSize.Y)
						ColorS = 1 - (math.clamp(ColorDrag.AbsolutePosition.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X) / Colorpick.AbsoluteSize.X)
						ColorV = 1 - (math.clamp(ColorDrag.AbsolutePosition.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y) / Colorpick.AbsoluteSize.Y)
						if data.default.Color ~= nil then
							ColorH, ColorS, ColorV = data.default.Color:ToHSV()
							ColorH = math.clamp(ColorH, 0, 1)
							ColorS = math.clamp(ColorS, 0, 1)
							ColorV = math.clamp(ColorV, 0, 1)
							ColorDrag.Position = UDim2.new(1 - ColorS, 0, 1 - ColorV, 0)
							Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)
							Transcolor.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)
							ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
							Huedrag.Position = UDim2.new(0, 0, 1 - ColorH, -1)
						end;
						if data.default.Transparency ~= nil then
							Transdrag.Position = UDim2.new(data.default.Transparency, -1, 0, 0)
						end;
						local mouse = LocalPlayer:GetMouse()
						game:GetService("UserInputService").InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
								if not dragging and not abc and not inCP then
									Frame.Visible = false
								end
							end
						end)
						local function updateColor()
							local ColorX = (math.clamp(mouse.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X) / Colorpick.AbsoluteSize.X)
							local ColorY = (math.clamp(mouse.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y) / Colorpick.AbsoluteSize.Y)
							ColorDrag.Position = UDim2.new(ColorX, 0, ColorY, 0)
							ColorS = 1 - ColorX;
							ColorV = 1 - ColorY;
							Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)
							ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
							Transcolor.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)
							values[tabname][sectorname][tabtext][text] = Element.value;
							Element.value.Color = Color3.fromHSV(ColorH, ColorS, ColorV)
							callback(Element.value)
						end;
						local function updateHue()
							local y = math.clamp(mouse.Y - Huepick.AbsolutePosition.Y, 0, 148)
							Huedrag.Position = UDim2.new(0, 0, 0, y)
							hue = y / 148;
							ColorH = 1 - hue;
							Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)
							Transcolor.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)
							ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
							values[tabname][sectorname][tabtext][text] = Element.value;
							Element.value.Color = Color3.fromHSV(ColorH, ColorS, ColorV)
							callback(Element.value)
						end;
						local function updateTrans()
							local x = math.clamp(mouse.X - Transpick.AbsolutePosition.X, 0, 178)
							Transdrag.Position = UDim2.new(0, x, 0, 0)
							Element.value.Transparency = (x / 178)
							values[tabname][sectorname][tabtext][text] = Element.value;
							callback(Element.value)
						end;
						Transpick.MouseButton1Down:Connect(function()
							updateTrans()
							moveconnection = mouse.Move:Connect(function()
								updateTrans()
							end)
							releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)
								if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
									updateTrans()
									moveconnection:Disconnect()
									releaseconnection:Disconnect()
								end
							end)
						end)
						Colorpick.MouseButton1Down:Connect(function()
							updateColor()
							moveconnection = mouse.Move:Connect(function()
								updateColor()
							end)
							releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)
								if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
									updateColor()
									moveconnection:Disconnect()
									releaseconnection:Disconnect()
								end
							end)
						end)
						Huepick.MouseButton1Down:Connect(function()
							updateHue()
							moveconnection = mouse.Move:Connect(function()
								updateHue()
							end)
							releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)
								if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
									updateHue()
									moveconnection:Disconnect()
									releaseconnection:Disconnect()
								end
							end)
						end)
						Button.MouseButton1Down:Connect(function()
							Element.value.Toggle = not Element.value.Toggle;
							update()
							values[tabname][sectorname][tabtext][text] = Element.value;
							callback(Element.value)
						end)
						if data.default then
							update()
						end;
						values[tabname][sectorname][tabtext][text] = Element.value;
						function Element:SetValue(value)
							Element.value = value;
							local duplicate = Color3.new(value.Color.R, value.Color.G, value.Color.B)
							ColorH, ColorS, ColorV = duplicate:ToHSV()
							ColorH = math.clamp(ColorH, 0, 1)
							ColorS = math.clamp(ColorS, 0, 1)
							ColorV = math.clamp(ColorV, 0, 1)
							ColorDrag.Position = UDim2.new(1 - ColorS, 0, 1 - ColorV, 0)
							Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)
							ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
							update()
							Huedrag.Position = UDim2.new(0, 0, 1 - ColorH, -1)
						end
					elseif type == "Dropdown" then
						tabsize = tabsize + UDim2.new(0, 0, 0, 39)
						Element.value = {
							Dropdown = data.options[1]
						}
						local Dropdown = Instance.new("Frame")
						local Button = Instance.new("TextButton")
						local TextLabel = Instance.new("TextLabel")
						local Drop = Instance.new("ScrollingFrame")
						local Button_2 = Instance.new("TextButton")
						local TextLabel_2 = Instance.new("TextLabel")
						local UIListLayout = Instance.new("UIListLayout")
						local ImageLabel = Instance.new("ImageLabel")
						local TextLabel_3 = Instance.new("TextLabel")
						Dropdown.Name = "Dropdown"
						Dropdown.Parent = tab1;
						Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Dropdown.BackgroundTransparency = 1.000;
						Dropdown.Position = UDim2.new(0, 0, 0.255102038, 0)
						Dropdown.Size = UDim2.new(1, 0, 0, 39)
						Button.Name = "Button"
						Button.Parent = Dropdown;
						Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Button.BorderColor3 = Color3.fromRGB(18, 18, 16)
						Button.Position = UDim2.new(0, 30, 0, 16)
						Button.Size = UDim2.new(0, 175, 0, 17)
						Button.AutoButtonColor = false;
						Button.Font = Enum.Font.Ubuntu;
						Button.Text = ""
						Button.TextColor3 = Color3.fromRGB(0, 0, 0)
						Button.TextSize = 10.000;
						local UIGradient = Instance.new("UIGradient")
						UIGradient.Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0.00, Color3.fromRGB(49, 49, 49)),
							ColorSequenceKeypoint.new(0.50, Color3.fromRGB(42, 42, 42)),
							ColorSequenceKeypoint.new(1.00, Color3.fromRGB(33, 33, 32))
						}
						UIGradient.Rotation = 90;
						UIGradient.Parent = Button;
						TextLabel.Parent = Button;
						TextLabel.BackgroundColor3 = Color3.fromRGB(109, 57, 142)
						TextLabel.BackgroundTransparency = 1.000;
						TextLabel.BorderColor3 = Color3.fromRGB(18, 18, 16)
						TextLabel.Position = UDim2.new(0, 5, 0, 0)
						TextLabel.Size = UDim2.new(-0.21714285, 208, 1, 0)
						TextLabel.Font = Enum.Font.Ubuntu;
						TextLabel.Text = Element.value.Dropdown;
						TextLabel.TextStrokeTransparency = 0.000;
						TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel.TextSize = 10.000;
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
						local abcd = TextLabel;
						Drop.Name = "Drop"
						Drop.Parent = Button;
						Drop.Active = true;
						Drop.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
						Drop.BorderColor3 = Color3.fromRGB(18, 18, 16)
						Drop.Position = UDim2.new(0, 0, 1, 1)
						Drop.Size = UDim2.new(1, 0, 0, 20)
						Drop.Visible = false;
						Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282"
						Drop.CanvasSize = UDim2.new(1, 1, 1, 1)
						Drop.ScrollBarThickness = 0;
						Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282"
						Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282"
						Drop.AutomaticCanvasSize = "Y"
						Drop.ZIndex = 5;
						Drop.ScrollBarImageColor3 = Color3.fromRGB(109, 57, 142)
						UIListLayout.Parent = Drop;
						UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
						UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
						local num = #data.options;
						if num > 5 then
							Drop.Size = UDim2.new(1, 0, 0, 85)
						else
							Drop.Size = UDim2.new(1, 0, 0, 17 * num)
						end;
						Drop.CanvasSize = UDim2.new(1, 0, 0, 17 * num)
						local first = true;
						for i, v in ipairs(data.options) do
							do
								local Button = Instance.new("TextButton")
								local TextLabel = Instance.new("TextLabel")
								Button.Name = v;
								Button.Parent = Drop;
								Button.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
								Button.BorderColor3 = Color3.fromRGB(18, 18, 16)
								Button.Position = UDim2.new(0, 30, 0, 16)
								Button.Size = UDim2.new(0, 175, 0, 17)
								Button.AutoButtonColor = false;
								Button.Font = Enum.Font.Ubuntu;
								Button.Text = ""
								Button.TextColor3 = Color3.fromRGB(0, 0, 0)
								Button.TextSize = 10.000;
								Button.BorderSizePixel = 0;
								Button.ZIndex = 6;
								TextLabel.Parent = Button;
								TextLabel.BackgroundColor3 = Color3.fromRGB(109, 57, 142)
								TextLabel.BackgroundTransparency = 1.000;
								TextLabel.BorderColor3 = Color3.fromRGB(18, 18, 16)
								TextLabel.Position = UDim2.new(0, 5, 0, -1)
								TextLabel.Size = UDim2.new(-0.21714285, 208, 1, 0)
								TextLabel.Font = Enum.Font.Ubuntu;
								TextLabel.Text = v;
								TextLabel.TextStrokeTransparency = 0.000;
								TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
								TextLabel.TextSize = 10.000;
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
								TextLabel.ZIndex = 6;
								Button.MouseButton1Down:Connect(function()
									Drop.Visible = false;
									Element.value.Dropdown = v;
									abcd.Text = v;
									values[tabname][sectorname][tabtext][text] = Element.value;
									callback(Element.value)
									Drop.CanvasPosition = Vector2.new(0, 0)
								end)
								Button.MouseEnter:Connect(function()
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
										TextColor3 = Color3.fromRGB(124, 81, 149)
									})
								end)
								Button.MouseLeave:Connect(function()
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
										TextColor3 = Color3.fromRGB(255, 255, 255)
									})
								end)
								first = false
							end
						end;
						function Element:SetValue(val)
							Element.value = val;
							abcd.Text = val.Dropdown;
							values[tabname][sectorname][tabtext][text] = Element.value;
							callback(val)
						end;
						ImageLabel.Parent = Button;
						ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						ImageLabel.BackgroundTransparency = 1.000;
						ImageLabel.Position = UDim2.new(0, 165, 0, 6)
						ImageLabel.Size = UDim2.new(0, 6, 0, 4)
						ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531"
						TextLabel_3.Parent = Dropdown;
						TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel_3.BackgroundTransparency = 1.000;
						TextLabel_3.Position = UDim2.new(0, 32, 0, -1)
						TextLabel_3.Size = UDim2.new(0.111913361, 208, 0.382215232, 0)
						TextLabel_3.Font = Enum.Font.Ubuntu;
						TextLabel_3.Text = text;
						TextLabel_3.TextStrokeTransparency = 0.000;
						TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel_3.TextSize = 10.000;
						TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left;
						Button.MouseButton1Down:Connect(function()
							Drop.Visible = not Drop.Visible;
							if not Drop.Visible then
								Drop.CanvasPosition = Vector2.new(0, 0)
							end
						end)
						local indrop = false;
						local ind = false;
						Drop.MouseEnter:Connect(function()
							indrop = true
						end)
						Drop.MouseLeave:Connect(function()
							indrop = false
						end)
						Button.MouseEnter:Connect(function()
							ind = true
						end)
						Button.MouseLeave:Connect(function()
							ind = false
						end)
						game:GetService("UserInputService").InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
								if Drop.Visible == true and not indrop and not ind then
									Drop.Visible = false;
									Drop.CanvasPosition = Vector2.new(0, 0)
								end
							end
						end)
						values[tabname][sectorname][tabtext][text] = Element.value
					elseif type == "Slider" then
						tabsize = tabsize + UDim2.new(0, 0, 0, 25)
						local Slider = Instance.new("Frame")
						local TextLabel = Instance.new("TextLabel")
						local Button = Instance.new("TextButton")
						local Frame = Instance.new("Frame")
						local UIGradient = Instance.new("UIGradient")
						local UIGradient2 = Instance.new("UIGradient")
						local Value = Instance.new("TextLabel")
						Slider.Name = "Slider"
						Slider.Parent = tab1;
						Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Slider.BackgroundTransparency = 1.000;
						Slider.Position = UDim2.new(0, 0, 0.653061211, 0)
						Slider.Size = UDim2.new(1, 0, 0, 25)
						TextLabel.Parent = Slider;
						TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel.BackgroundTransparency = 1.000;
						TextLabel.Position = UDim2.new(0, 32, 0, -2)
						TextLabel.Size = UDim2.new(0, 100, 0, 15)
						TextLabel.Font = Enum.Font.Ubuntu;
						TextLabel.Text = text;
						TextLabel.TextStrokeTransparency = 0.000;
						TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel.TextSize = 10.000;
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
						Button.Name = "Button"
						Button.Parent = Slider;
						Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Button.BorderColor3 = Color3.fromRGB(18, 18, 16)
						Button.Position = UDim2.new(0, 30, 0, 15)
						Button.Size = UDim2.new(0, 175, 0, 5)
						Button.AutoButtonColor = false;
						Button.Font = Enum.Font.Ubuntu;
						Button.Text = ""
						Button.TextColor3 = Color3.fromRGB(0, 0, 0)
						Button.TextSize = 10.000;
						UIGradient2.Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0.00, Color3.fromRGB(49, 49, 49)),
							ColorSequenceKeypoint.new(0.50, Color3.fromRGB(42, 42, 42)),
							ColorSequenceKeypoint.new(1.00, Color3.fromRGB(33, 33, 32))
						}
						UIGradient2.Rotation = 90;
						UIGradient2.Parent = Button;
						Frame.Parent = Button;
						Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Frame.BorderSizePixel = 0;
						Frame.Size = UDim2.new(0.5, 0, 1, 0)
						UIGradient.Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0.00, Color3.fromRGB(123, 81, 153)),
							ColorSequenceKeypoint.new(1.00, Color3.fromRGB(77, 39, 109))
						}
						UIGradient.Rotation = 90;
						UIGradient.Parent = Frame;
						Value.Name = "Value"
						Value.Parent = Slider;
						Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Value.BackgroundTransparency = 1.000;
						Value.Position = UDim2.new(0, 30, 0, 15)
						Value.Size = UDim2.new(0, 175, 0, 5)
						Value.Font = Enum.Font.Ubuntu;
						Value.Text = "50"
						Value.TextStrokeTransparency = 0.000;
						Value.TextColor3 = Color3.fromRGB(255, 255, 255)
						Value.TextSize = 10.000;
						local min, max, default = data.min or 0, data.max or 100, data.default or 0;
						Element.value = {
							Slider = default
						}
						function Element:SetValue(value)
							Element.value = value;
							local a;
							if min > 0 then
								a = ((Element.value.Slider - min)) / (max - min)
							else
								a = (Element.value.Slider - min) / (max - min)
							end;
							Value.Text = Element.value.Slider;
							Frame.Size = UDim2.new(a, 0, 1, 0)
							values[tabname][sectorname][tabtext][text] = Element.value;
							callback(value)
						end;
						local a;
						if min > 0 then
							a = ((Element.value.Slider - min)) / (max - min)
						else
							a = (Element.value.Slider - min) / (max - min)
						end;
						Value.Text = Element.value.Slider;
						Frame.Size = UDim2.new(a, 0, 1, 0)
						values[tabname][sectorname][tabtext][text] = Element.value;
						local uis = game:GetService("UserInputService")
						local mouse = game.Players.LocalPlayer:GetMouse()
						local val;
						Button.MouseButton1Down:Connect(function()
							Frame.Size = UDim2.new(0, math.clamp(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5)
							val = math.floor((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min)) or 0;
							Value.Text = val;
							Element.value.Slider = val;
							values[tabname][sectorname][tabtext][text] = Element.value;
							callback(Element.value)
							moveconnection = mouse.Move:Connect(function()
								Frame.Size = UDim2.new(0, math.clamp(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5)
								val = math.floor((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min))
								Value.Text = val;
								Element.value.Slider = val;
								values[tabname][sectorname][tabtext][text] = Element.value;
								callback(Element.value)
							end)
							releaseconnection = uis.InputEnded:Connect(function(Mouse)
								if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
									Frame.Size = UDim2.new(0, math.clamp(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5)
									val = math.floor((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min))
									values[tabname][sectorname][tabtext][text] = Element.value;
									callback(Element.value)
									moveconnection:Disconnect()
									releaseconnection:Disconnect()
								end
							end)
						end)
					elseif type == "Button" then
						tabsize = tabsize + UDim2.new(0, 0, 0, 24)
						local Button = Instance.new("Frame")
						local Button_2 = Instance.new("TextButton")
						local UIGradient = Instance.new("UIGradient")
						local TextLabel = Instance.new("TextLabel")
						Button.Name = "Button"
						Button.Parent = tab1;
						Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Button.BackgroundTransparency = 1.000;
						Button.Position = UDim2.new(0, 0, 0.236059487, 0)
						Button.Size = UDim2.new(1, 0, 0, 24)
						Button_2.Name = "Button"
						Button_2.Parent = Button;
						Button_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Button_2.BorderColor3 = Color3.fromRGB(18, 18, 16)
						Button_2.Position = UDim2.new(0, 30, 0.5, -9)
						Button_2.Size = UDim2.new(0, 175, 0, 18)
						Button_2.AutoButtonColor = false;
						Button_2.Font = Enum.Font.Ubuntu;
						Button_2.Text = ""
						Button_2.TextColor3 = Color3.fromRGB(0, 0, 0)
						Button_2.TextSize = 10.000;
						UIGradient.Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0.00, Color3.fromRGB(49, 49, 49)),
							ColorSequenceKeypoint.new(0.50, Color3.fromRGB(42, 42, 42)),
							ColorSequenceKeypoint.new(1.00, Color3.fromRGB(33, 33, 32))
						}
						UIGradient.Rotation = 90;
						UIGradient.Parent = Button_2;
						TextLabel.Parent = Button_2;
						TextLabel.BackgroundColor3 = Color3.fromRGB(109, 57, 142)
						TextLabel.BackgroundTransparency = 1.000;
						TextLabel.BorderColor3 = Color3.fromRGB(18, 18, 16)
						TextLabel.Size = UDim2.new(1, 0, 1, 0)
						TextLabel.Font = Enum.Font.Ubuntu;
						TextLabel.Text = text;
						TextLabel.TextStrokeTransparency = 0.000;
						TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel.TextSize = 10.000;
						function Element:SetValue()
						end;
						Button_2.MouseButton1Down:Connect(function()
							TextLabel.TextColor3 = Color3.fromRGB(109, 57, 142)
							library:Tween(TextLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								TextColor3 = Color3.fromRGB(109, 57, 142)
							})
							callback()
						end)
						Button_2.MouseEnter:Connect(function()
							library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								TextColor3 = Color3.fromRGB(124, 81, 149)
							})
						end)
						Button_2.MouseLeave:Connect(function()
							library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								TextColor3 = Color3.fromRGB(255, 255, 255)
							})
						end)
					end;
					ConfigLoad:Connect(function(cfg)
						local fix = library:ConfigFix(cfg)
						if fix[tabname][sectorname][tabtext][text] ~= nil then
							Element:SetValue(fix[tabname][sectorname][tabtext][text])
						end
					end)
					return Element
				end;
				if firs then
					coroutine.wrap(function()
						game:GetService("RunService").RenderStepped:Wait()
						Section.Size = tabsize
					end)()
					selected = text;
					TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
					tab1.Visible = true;
					firs = false
				end;
				return tab
			end;
			return MSector
		end;
		function Tab:Sector(text, side)
			local sectorname = text;
			local Sector = {}
			values[tabname][text] = {}
			local Section = Instance.new("Frame")
			local SectionText = Instance.new("TextLabel")
			local Inner = Instance.new("Frame")
			local UIListLayout = Instance.new("UIListLayout")
			local gradient = Instance.new("Frame")
			local UIGradient_2 = Instance.new("UIGradient")
			Section.Name = "Section"
			Section.Parent = TabGui[side]
			Section.BackgroundTransparency = 1.000;
			Section.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
			Section.BorderColor3 = Color3.fromRGB(18, 18, 16)
			Section.BorderSizePixel = 0;
			Section.Position = UDim2.new(0.00358422939, 0, 0, 0)
			Section.Size = UDim2.new(1, 0, 0, 22)
			SectionText.Name = "SectionText"
			SectionText.Parent = Section;
			SectionText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SectionText.BackgroundTransparency = 1.000;
			SectionText.Position = UDim2.new(0, 7, 0, -4)
			SectionText.Size = UDim2.new(0, 270, 0, 19)
			SectionText.ZIndex = 2;
			SectionText.Font = Enum.Font.Ubuntu;
			SectionText.Text = text;
			SectionText.TextStrokeTransparency = 0.000;
			SectionText.TextColor3 = Color3.fromRGB(255, 255, 255)
			SectionText.TextSize = 12.000;
			SectionText.TextXAlignment = Enum.TextXAlignment.Left;
			gradient.Name = "gradient"
			gradient.Parent = Section;
			gradient.Position = UDim2.new(0.022, 0, 0.035, 0)
			gradient.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			gradient.BorderSizePixel = 0;
			gradient.Position = UDim2.new(0, 0, 0, -3)
			gradient.Size = UDim2.new(0, 280, 0, 2)
			UIGradient_2.Color = ColorSequence.new{
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(124, 81, 149)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(109, 57, 142)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(79, 48, 112))
			}
			UIGradient_2.Rotation = 90;
			UIGradient_2.Parent = gradient;
			Inner.Name = "Inner"
			Inner.Parent = Section;
			Inner.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
			Inner.BackgroundTransparency = 0.000;
			Inner.BorderColor3 = Color3.fromRGB(18, 18, 16)
			Inner.BorderSizePixel = 2;
			Inner.Position = UDim2.new(0, 1, 0, 1)
			Inner.Size = UDim2.new(1, -2, 1, -2)
			local UIPadding = Instance.new("UIPadding")
			UIPadding.Parent = Inner;
			UIPadding.PaddingTop = UDim.new(0, 10)
			UIListLayout.Parent = Inner;
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
			UIListLayout.Padding = UDim.new(0, 1)
			function Sector:Element(type, text, data, callback)
				local Element = {}
				data = data or {}
				callback = callback or function()
				end;
				values[tabname][sectorname][text] = {}
				if type == "ScrollDrop" then
					Section.Size = Section.Size + UDim2.new(0, 0, 0, 39)
					Element.value = {
						Scroll = {},
						Dropdown = ""
					}
					for i, v in pairs(data.options) do
						Element.value.Scroll[i] = v[1]
					end;
					local joe = {}
					if data.alphabet then
						local copy = {}
						for i, v in pairs(data.options) do
							table.insert(copy, i)
						end;
						table.sort(copy, function(a, b)
							return a < b
						end)
						joe = copy
					else
						for i, v in pairs(data.options) do
							table.insert(joe, i)
						end
					end;
					local Dropdown = Instance.new("Frame")
					local Button = Instance.new("TextButton")
					local TextLabel = Instance.new("TextLabel")
					local Drop = Instance.new("ScrollingFrame")
					local Button_2 = Instance.new("TextButton")
					local TextLabel_2 = Instance.new("TextLabel")
					local UIListLayout = Instance.new("UIListLayout")
					local ImageLabel = Instance.new("ImageLabel")
					local TextLabel_3 = Instance.new("TextLabel")
					Dropdown.Name = "Dropdown"
					Dropdown.Parent = Inner;
					Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Dropdown.BackgroundTransparency = 1.000;
					Dropdown.Position = UDim2.new(0, 0, 0, 0)
					Dropdown.Size = UDim2.new(1, 0, 0, 39)
					Button.Name = "Button"
					Button.Parent = Dropdown;
					Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Button.BorderColor3 = Color3.fromRGB(18, 18, 16)
					Button.Position = UDim2.new(0, 30, 0, 16)
					Button.Size = UDim2.new(0, 175, 0, 17)
					Button.AutoButtonColor = false;
					Button.Font = Enum.Font.Ubuntu;
					Button.Text = ""
					Button.TextColor3 = Color3.fromRGB(0, 0, 0)
					Button.TextSize = 10.000;
					local UIGradient = Instance.new("UIGradient")
					UIGradient.Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0.00, Color3.fromRGB(49, 49, 49)),
						ColorSequenceKeypoint.new(0.50, Color3.fromRGB(42, 42, 42)),
						ColorSequenceKeypoint.new(1.00, Color3.fromRGB(33, 33, 32))
					}
					UIGradient.Rotation = 90;
					UIGradient.Parent = Button;
					local TextLabel = Instance.new("TextLabel")
					TextLabel.Parent = Button;
					TextLabel.BackgroundColor3 = Color3.fromRGB(109, 57, 142)
					TextLabel.BackgroundTransparency = 1.000;
					TextLabel.BorderColor3 = Color3.fromRGB(18, 18, 16)
					TextLabel.Position = UDim2.new(0, 5, 0, 0)
					TextLabel.Size = UDim2.new(-0.21714285, 208, 1, 0)
					TextLabel.Font = Enum.Font.Ubuntu;
					TextLabel.Text = "lol"
					TextLabel.TextStrokeTransparency = 0.000;
					TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.TextSize = 10.000;
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
					local abcd = TextLabel;
					Drop.Name = "Drop"
					Drop.Parent = Button;
					Drop.Active = true;
					Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Button.BorderColor3 = Color3.fromRGB(18, 18, 16)
					Drop.Position = UDim2.new(0, 0, 1, 1)
					Drop.Size = UDim2.new(1, 0, 0, 20)
					Drop.Visible = false;
					Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282"
					Drop.CanvasSize = UDim2.new(1, 1, 1, 1)
					Drop.ScrollBarThickness = 0;
					Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282"
					Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282"
					Drop.AutomaticCanvasSize = "Y"
					Drop.ZIndex = 5;
					Drop.ScrollBarImageColor3 = Color3.fromRGB(109, 57, 142)
					local UIGradient2 = Instance.new("UIGradient")
					UIGradient2.Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0.00, Color3.fromRGB(49, 49, 49)),
						ColorSequenceKeypoint.new(0.50, Color3.fromRGB(42, 42, 42)),
						ColorSequenceKeypoint.new(1.00, Color3.fromRGB(33, 33, 32))
					}
					UIGradient2.Rotation = 90;
					UIGradient2.Parent = Drop;
					UIListLayout.Parent = Drop;
					UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
					local amount = data.Amount or 6;
					Section.Size = Section.Size + UDim2.new(0, 0, 0, amount * 16 + 8)
					local num = #joe;
					if num > 5 then
						Drop.Size = UDim2.new(1, 0, 0, 85)
					else
						Drop.Size = UDim2.new(1, 0, 0, 17 * num)
					end;
					local first = true;
					for i, v in ipairs(joe) do
						do
							local joell = v;
							local Scroll = Instance.new("Frame")
							local joe2 = data.options[v]
							local Button = Instance.new("TextButton")
							local TextLabel = Instance.new("TextLabel")
							Button.Name = v;
							Button.Parent = Drop;
							Button.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
							Button.BorderColor3 = Color3.fromRGB(18, 18, 16)
							Button.Position = UDim2.new(0, 30, 0, 16)
							Button.Size = UDim2.new(0, 175, 0, 17)
							Button.AutoButtonColor = false;
							Button.Font = Enum.Font.Ubuntu;
							Button.Text = ""
							Button.TextColor3 = Color3.fromRGB(0, 0, 0)
							Button.TextSize = 10.000;
							Button.BorderSizePixel = 0;
							Button.ZIndex = 6;
							TextLabel.Parent = Button;
							TextLabel.BackgroundColor3 = Color3.fromRGB(109, 57, 142)
							TextLabel.BackgroundTransparency = 1.000;
							TextLabel.BorderColor3 = Color3.fromRGB(18, 18, 16)
							TextLabel.Position = UDim2.new(0, 5, 0, -1)
							TextLabel.Size = UDim2.new(-0.21714285, 208, 1, 0)
							TextLabel.Font = Enum.Font.Ubuntu;
							TextLabel.Text = v;
							TextLabel.TextStrokeTransparency = 0.000;
							TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
							TextLabel.TextSize = 10.000;
							TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
							TextLabel.ZIndex = 6;
							Button.MouseButton1Down:Connect(function()
								Drop.Visible = false;
								Drop.CanvasPosition = Vector2.new(0, 0)
								abcd.Text = v;
								for i, v in pairs(Scroll.Parent:GetChildren()) do
									if v:IsA("Frame") then
										v.Visible = false
									end
								end;
								Element.value.Dropdown = v;
								Scroll.Visible = true;
								callback(Element.value)
							end)
							Button.MouseEnter:Connect(function()
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									TextColor3 = Color3.fromRGB(255, 255, 255)
								})
							end)
							Button.MouseLeave:Connect(function()
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									TextColor3 = Color3.fromRGB(255, 255, 255)
								})
							end)
							if first then
								abcd.Text = v;
								Element.value.Dropdown = v
							end;
							local Frame = Instance.new("ScrollingFrame")
							local UIListLayout = Instance.new("UIListLayout")
							Scroll.Name = "Scroll"
							Scroll.Parent = Dropdown;
							Scroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
							Scroll.BackgroundTransparency = 1.000;
							Scroll.Position = UDim2.new(0, 0, 0, 0)
							Scroll.Size = UDim2.new(1, 0, 0, amount * 16 + 8)
							Scroll.Visible = first;
							Scroll.Name = v;
							Frame.Name = "Frame"
							Frame.Parent = Scroll;
							Frame.Active = true;
							Frame.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
							Frame.BorderColor3 = Color3.fromRGB(18, 18, 16)
							Frame.Position = UDim2.new(0, 30, 0, 40)
							Frame.Size = UDim2.new(0, 175, 0, 16 * amount)
							Frame.BottomImage = "http://www.roblox.com/asset/?id=6724808282"
							Frame.CanvasSize = UDim2.new(0, 0, 0, 0)
							Frame.MidImage = "http://www.roblox.com/asset/?id=6724808282"
							Frame.ScrollBarThickness = 4;
							Frame.TopImage = "http://www.roblox.com/asset/?id=6724808282"
							Frame.AutomaticCanvasSize = "Y"
							Frame.ScrollBarImageColor3 = Color3.fromRGB(109, 57, 142)
							UIListLayout.Parent = Frame;
							UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
							UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
							local joll = true;
							for i, v in ipairs(joe2) do
								local Button = Instance.new("TextButton")
								local TextLabel = Instance.new("TextLabel")
								Button.Name = v;
								Button.Parent = Frame;
								Button.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
								Button.BorderColor3 = Color3.fromRGB(18, 18, 16)
								Button.BorderSizePixel = 0;
								Button.Position = UDim2.new(0, 30, 0, 16)
								Button.Size = UDim2.new(1, 0, 0, 16)
								Button.AutoButtonColor = false;
								Button.Font = Enum.Font.Ubuntu;
								Button.Text = ""
								Button.TextColor3 = Color3.fromRGB(0, 0, 0)
								Button.TextSize = 10.000;
								TextLabel.Parent = Button;
								TextLabel.BackgroundColor3 = Color3.fromRGB(109, 57, 142)
								TextLabel.BackgroundTransparency = 1.000;
								TextLabel.BorderColor3 = Color3.fromRGB(18, 18, 16)
								TextLabel.Position = UDim2.new(0, 4, 0, -1)
								TextLabel.Size = UDim2.new(1, 1, 1, 1)
								TextLabel.Font = Enum.Font.Ubuntu;
								TextLabel.Text = v;
								TextLabel.TextStrokeTransparency = 0.000;
								TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
								TextLabel.TextSize = 10.000;
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
								if joll then
									joll = false;
									TextLabel.TextColor3 = Color3.fromRGB(135, 25, 255)
								end;
								Button.MouseButton1Down:Connect(function()
									for i, v in pairs(Frame:GetChildren()) do
										if v:IsA("TextButton") then
											library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
												TextColor3 = Color3.fromRGB(255, 255, 255)
											})
										end
									end;
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
										TextColor3 = Color3.fromRGB(109, 57, 142)
									})
									Element.value.Scroll[joell] = v;
									values[tabname][sectorname][text] = Element.value;
									callback(Element.value)
								end)
								Button.MouseEnter:Connect(function()
									if Element.value.Scroll[joell] ~= v then
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
											TextColor3 = Color3.fromRGB(255, 255, 255)
										})
									end
								end)
								Button.MouseLeave:Connect(function()
									if Element.value.Scroll[joell] ~= v then
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
											TextColor3 = Color3.fromRGB(255, 255, 255)
										})
									end
								end)
							end;
							first = false
						end
					end;
					ImageLabel.Parent = Button;
					ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ImageLabel.BackgroundTransparency = 1.000;
					ImageLabel.Position = UDim2.new(0, 165, 0, 6)
					ImageLabel.Size = UDim2.new(0, 6, 0, 4)
					ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531"
					TextLabel_3.Parent = Dropdown;
					TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel_3.BackgroundTransparency = 1.000;
					TextLabel_3.Position = UDim2.new(0, 32, 0, -1)
					TextLabel_3.Size = UDim2.new(0.111913361, 208, 0.382215232, 0)
					TextLabel_3.Font = Enum.Font.Ubuntu;
					TextLabel_3.Text = text;
					TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel_3.TextSize = 10.000;
					TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left;
					Button.MouseButton1Down:Connect(function()
						Drop.Visible = not Drop.Visible;
						if not Drop.Visible then
							Drop.CanvasPosition = Vector2.new(0, 0)
						end
					end)
					local indrop = false;
					local ind = false;
					Drop.MouseEnter:Connect(function()
						indrop = true
					end)
					Drop.MouseLeave:Connect(function()
						indrop = false
					end)
					Button.MouseEnter:Connect(function()
						ind = true
					end)
					Button.MouseLeave:Connect(function()
						ind = false
					end)
					game:GetService("UserInputService").InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
							if Drop.Visible == true and not indrop and not ind then
								Drop.Visible = false;
								Drop.CanvasPosition = Vector2.new(0, 0)
							end
						end
					end)
					function Element:SetValue(tbl)
						Element.value = tbl;
						abcd.Text = tbl.Dropdown;
						values[tabname][sectorname][text] = Element.value;
						for i, v in pairs(Dropdown:GetChildren()) do
							if v:IsA("Frame") then
								if v.Name == Element.value.Dropdown then
									v.Visible = true
								else
									v.Visible = false
								end;
								for _, bad in pairs(v.Frame:GetChildren()) do
									if bad:IsA("TextButton") then
										bad.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
										if bad.Name == Element.value.Scroll[v.Name] then
											bad.TextLabel.TextColor3 = Color3.fromRGB(109, 57, 142)
										end
									end
								end
							end
						end
					end;
					if data.default then
						Element:SetValue(data.default)
					end;
					values[tabname][sectorname][text] = Element.value
				elseif type == "Scroll" then
					local amount = data.Amount or 6;
					Section.Size = Section.Size + UDim2.new(0, 0, 0, amount * 16 + 8)
					if data.alphabet then
						table.sort(data.options, function(a, b)
							return a < b
						end)
					end;
					Element.value = {
						Scroll = data.default and data.default.Scroll or data.options[1]
					}
					local Scroll = Instance.new("Frame")
					local Frame = Instance.new("ScrollingFrame")
					local UIListLayout = Instance.new("UIListLayout")
					Scroll.Name = "Scroll"
					Scroll.Parent = Inner;
					Scroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Scroll.BackgroundTransparency = 1.000;
					Scroll.Position = UDim2.new(0, 0, 00, 0)
					Scroll.Size = UDim2.new(1, 0, 0, amount * 16 + 8)
					Frame.Name = "Frame"
					Frame.Parent = Scroll;
					Frame.Active = true;
					Frame.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
					Frame.BorderColor3 = Color3.fromRGB(18, 18, 16)
					Frame.Position = UDim2.new(0, 30, 0, 0)
					Frame.Size = UDim2.new(0, 175, 0, 16 * amount)
					Frame.BottomImage = "http://www.roblox.com/asset/?id=6724808282"
					Frame.CanvasSize = UDim2.new(0, 0, 0, 0)
					Frame.MidImage = "http://www.roblox.com/asset/?id=6724808282"
					Frame.ScrollBarThickness = 4;
					Frame.TopImage = "http://www.roblox.com/asset/?id=6724808282"
					Frame.AutomaticCanvasSize = "Y"
					Frame.ScrollBarImageColor3 = Color3.fromRGB(109, 57, 142)
					UIListLayout.Parent = Frame;
					UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
					local first = true;
					for i, v in ipairs(data.options) do
						local Button = Instance.new("TextButton")
						local TextLabel = Instance.new("TextLabel")
						Button.Name = v;
						Button.Parent = Frame;
						Button.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
						Button.BorderColor3 = Color3.fromRGB(18, 18, 16)
						Button.BorderSizePixel = 0;
						Button.Position = UDim2.new(0, 30, 0, 16)
						Button.Size = UDim2.new(1, 0, 0, 16)
						Button.AutoButtonColor = false;
						Button.Font = Enum.Font.Ubuntu;
						Button.Text = ""
						Button.TextColor3 = Color3.fromRGB(0, 0, 0)
						Button.TextSize = 10.000;
						TextLabel.Parent = Button;
						TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel.BackgroundTransparency = 1.000;
						TextLabel.BorderColor3 = Color3.fromRGB(18, 18, 16)
						TextLabel.Position = UDim2.new(0, 4, 0, -1)
						TextLabel.Size = UDim2.new(1, 1, 1, 1)
						TextLabel.Font = Enum.Font.Ubuntu;
						TextLabel.Text = v;
						TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel.TextSize = 10.000;
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
						if first then
							first = false;
							TextLabel.TextColor3 = Color3.fromRGB(109, 57, 142)
						end;
						Button.MouseButton1Down:Connect(function()
							for i, v in pairs(Frame:GetChildren()) do
								if v:IsA("TextButton") then
									library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
										TextColor3 = Color3.fromRGB(255, 255, 255)
									})
								end
							end;
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								TextColor3 = Color3.fromRGB(109, 57, 142)
							})
							Element.value.Scroll = v;
							values[tabname][sectorname][text] = Element.value;
							callback(Element.value)
						end)
						Button.MouseEnter:Connect(function()
							if Element.value.Scroll ~= v then
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									TextColor3 = Color3.fromRGB(255, 255, 255)
								})
							end
						end)
						Button.MouseLeave:Connect(function()
							if Element.value.Scroll ~= v then
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									TextColor3 = Color3.fromRGB(255, 255, 255)
								})
							end
						end)
					end;
					function Element:SetValue(val)
						Element.value = val;
						for i, v in pairs(Frame:GetChildren()) do
							if v:IsA("TextButton") then
								library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									TextColor3 = Color3.fromRGB(255, 255, 255)
								})
							end
						end;
						library:Tween(Frame[Element.value.Scroll].TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							TextColor3 = Color3.fromRGB(255, 255, 255)
						})
						values[tabname][sectorname][text] = Element.value;
						callback(Element.value)
					end;
					values[tabname][sectorname][text] = Element.value
				elseif type == "Jumbobox" then
					Section.Size = Section.Size + UDim2.new(0, 0, 0, 39)
					Element.value = {
						Jumbobox = {}
					}
					data.options = data.options or {}
					local Dropdown = Instance.new("Frame")
					local Button = Instance.new("TextButton")
					local TextLabel = Instance.new("TextLabel")
					local Drop = Instance.new("ScrollingFrame")
					local Button_2 = Instance.new("TextButton")
					local TextLabel_2 = Instance.new("TextLabel")
					local UIListLayout = Instance.new("UIListLayout")
					local ImageLabel = Instance.new("ImageLabel")
					local TextLabel_3 = Instance.new("TextLabel")
					Dropdown.Name = "Dropdown"
					Dropdown.Parent = Inner;
					Dropdown.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
					Dropdown.BackgroundTransparency = 1.000;
					Dropdown.Position = UDim2.new(0, 0, 0.255102038, 0)
					Dropdown.Size = UDim2.new(1, 0, 0, 39)
					Button.Name = "Button"
					Button.Parent = Dropdown;
					Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Button.BorderColor3 = Color3.fromRGB(18, 18, 16)
					Button.Position = UDim2.new(0, 30, 0, 16)
					Button.Size = UDim2.new(0, 175, 0, 17)
					Button.AutoButtonColor = false;
					Button.Font = Enum.Font.Ubuntu;
					Button.Text = ""
					Button.TextColor3 = Color3.fromRGB(0, 0, 0)
					Button.TextSize = 10.000;
					local UIGradient = Instance.new("UIGradient")
					UIGradient.Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0.00, Color3.fromRGB(49, 49, 49)),
						ColorSequenceKeypoint.new(0.50, Color3.fromRGB(42, 42, 42)),
						ColorSequenceKeypoint.new(1.00, Color3.fromRGB(33, 33, 32))
					}
					UIGradient.Rotation = 90;
					UIGradient.Parent = Button;
					TextLabel.Parent = Button;
					TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000;
					TextLabel.BorderColor3 = Color3.fromRGB(18, 18, 16)
					TextLabel.Position = UDim2.new(0, 5, 0, 0)
					TextLabel.Size = UDim2.new(-0.21714285, 208, 1, 0)
					TextLabel.Font = Enum.Font.Ubuntu;
					TextLabel.Text = "-"
					TextLabel.TextStrokeTransparency = 0.000;
					TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.TextSize = 10.000;
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
					local abcd = TextLabel;
					Drop.Name = "Drop"
					Drop.Parent = Button;
					Drop.Active = true;
					Drop.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
					Drop.BorderColor3 = Color3.fromRGB(18, 18, 16)
					Drop.Position = UDim2.new(0, 0, 1, 1)
					Drop.Size = UDim2.new(1, 0, 0, 20)
					Drop.Visible = false;
					Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282"
					Drop.CanvasSize = UDim2.new(1, 1, 1, 1)
					Drop.ScrollBarThickness = 0;
					Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282"
					Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282"
					for i, v in pairs(data.options) do
						Drop.CanvasSize = Drop.CanvasSize + UDim2.new(0, 0, 0, 17)
					end;
					Drop.ZIndex = 5;
					Drop.ScrollBarImageColor3 = Color3.fromRGB(109, 57, 142)
					UIListLayout.Parent = Drop;
					UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
					values[tabname][sectorname][text] = Element.value;
					local num = #data.options;
					if num > 5 then
						Drop.Size = UDim2.new(1, 0, 0, 85)
					else
						Drop.Size = UDim2.new(1, 0, 0, 17 * num)
					end;
					local first = true;
					local function updatetext()
						local old = {}
						for i, v in ipairs(data.options) do
							if table.find(Element.value.Jumbobox, v) then
								table.insert(old, v)
							else
							end
						end;
						local str = ""
						if #old == 0 then
							str = "..."
						else
							if #old == 1 then
								str = old[1]
							else
								for i, v in ipairs(old) do
									if i == 1 then
										str = v
									else
										if i > 2 then
											if i < 4 then
												str = str .. ",  ..."
											end
										else
											str = str .. ",  " .. v
										end
									end
								end
							end
						end;
						abcd.Text = str
					end;
					for i, v in ipairs(data.options) do
						do
							local Button = Instance.new("TextButton")
							local TextLabel = Instance.new("TextLabel")
							Button.Name = v;
							Button.Parent = Drop;
							Button.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
							Button.BorderColor3 = Color3.fromRGB(18, 18, 16)
							Button.Position = UDim2.new(0, 30, 0, 16)
							Button.Size = UDim2.new(0, 175, 0, 17)
							Button.AutoButtonColor = false;
							Button.Font = Enum.Font.Ubuntu;
							Button.Text = ""
							Button.TextColor3 = Color3.fromRGB(0, 0, 0)
							Button.TextSize = 10.000;
							Button.BorderSizePixel = 0;
							Button.ZIndex = 6;
							TextLabel.Parent = Button;
							TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
							TextLabel.BackgroundTransparency = 1.000;
							TextLabel.BorderColor3 = Color3.fromRGB(18, 18, 16)
							TextLabel.Position = UDim2.new(0, 5, 0, -1)
							TextLabel.Size = UDim2.new(-0.21714285, 208, 1, 0)
							TextLabel.Font = Enum.Font.Ubuntu;
							TextLabel.Text = v;
							TextLabel.TextStrokeTransparency = 0.000;
							TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
							TextLabel.TextSize = 10.000;
							TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
							TextLabel.ZIndex = 6;
							Button.MouseButton1Down:Connect(function()
								if table.find(Element.value.Jumbobox, v) then
									for i, a in pairs(Element.value.Jumbobox) do
										if a == v then
											table.remove(Element.value.Jumbobox, i)
										end
									end;
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
										TextColor3 = Color3.fromRGB(255, 255, 255)
									})
								else
									table.insert(Element.value.Jumbobox, v)
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
										TextColor3 = Color3.fromRGB(255, 255, 255)
									})
								end;
								updatetext()
								values[tabname][sectorname][text] = Element.value;
								callback(Element.value)
							end)
							Button.MouseEnter:Connect(function()
								if not table.find(Element.value.Jumbobox, v) then
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
										TextColor3 = Color3.fromRGB(255, 255, 255)
									})
								end
							end)
							Button.MouseLeave:Connect(function()
								if not table.find(Element.value.Jumbobox, v) then
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
										TextColor3 = Color3.fromRGB(255, 255, 255)
									})
								end
							end)
							first = false
						end
					end;
					function Element:SetValue(val)
						Element.value = val;
						for i, v in pairs(Drop:GetChildren()) do
							if v.Name ~= "UIListLayout" then
								if table.find(val.Jumbobox, v.Name) then
									v.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
								else
									v.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
								end
							end
						end;
						updatetext()
						values[tabname][sectorname][text] = Element.value;
						callback(val)
					end;
					if data.default then
						Element:SetValue(data.default)
					end;
					ImageLabel.Parent = Button;
					ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ImageLabel.BackgroundTransparency = 1.000;
					ImageLabel.Position = UDim2.new(0, 165, 0, 6)
					ImageLabel.Size = UDim2.new(0, 6, 0, 4)
					ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531"
					TextLabel_3.Parent = Dropdown;
					TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel_3.BackgroundTransparency = 1.000;
					TextLabel_3.Position = UDim2.new(0, 32, 0, -1)
					TextLabel_3.Size = UDim2.new(0.111913361, 208, 0.382215232, 0)
					TextLabel_3.Font = Enum.Font.Ubuntu;
					TextLabel_3.Text = text;
					TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel_3.TextSize = 10.000;
					TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left;
					Button.MouseButton1Down:Connect(function()
						Drop.Visible = not Drop.Visible;
						if not Drop.Visible then
							Drop.CanvasPosition = Vector2.new(0, 0)
						end
					end)
					local indrop = false;
					local ind = false;
					Drop.MouseEnter:Connect(function()
						indrop = true
					end)
					Drop.MouseLeave:Connect(function()
						indrop = false
					end)
					Button.MouseEnter:Connect(function()
						ind = true
					end)
					Button.MouseLeave:Connect(function()
						ind = false
					end)
					game:GetService("UserInputService").InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
							if Drop.Visible == true and not indrop and not ind then
								Drop.Visible = false;
								Drop.CanvasPosition = Vector2.new(0, 0)
							end
						end
					end)
				elseif type == "ToggleKeybind" then
					Section.Size = Section.Size + UDim2.new(0, 0, 0, 16)
					Element.value = {
						Toggle = data.default and data.default.Toggle or false,
						Key,
						Type = "Always",
						Active = true
					}
					local Toggle = Instance.new("Frame")
					local Button = Instance.new("TextButton")
					local Color = Instance.new("Frame")
					local TextLabel = Instance.new("TextLabel")
					Toggle.Name = "Toggle"
					Toggle.Parent = Inner;
					Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Toggle.BackgroundTransparency = 1.000;
					Toggle.Size = UDim2.new(1, 0, 0, 15)
					Button.Name = "Button"
					Button.Parent = Toggle;
					Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Button.BackgroundTransparency = 1.000;
					Button.Size = UDim2.new(1, 0, 1, 0)
					Button.Font = Enum.Font.Ubuntu;
					Button.Text = ""
					Button.TextColor3 = Color3.fromRGB(0, 0, 0)
					Button.TextSize = 10.000;
					Color.Name = "Color"
					Color.Parent = Button;
					Color.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
					Color.BorderColor3 = Color3.fromRGB(18, 18, 16)
					Color.Position = UDim2.new(0, 15, 0.5, -5)
					Color.Size = UDim2.new(0, 8, 0, 8)
					local binding = false;
					TextLabel.Parent = Button;
					TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000;
					TextLabel.Position = UDim2.new(0, 32, 0, -1)
					TextLabel.Size = UDim2.new(0.111913361, 208, 1, 0)
					TextLabel.Font = Enum.Font.Ubuntu;
					TextLabel.Text = text;
					TextLabel.TextStrokeTransparency = 0.000;
					TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.TextSize = 10.000;
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
					local function update()
						if Element.value.Toggle then
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								BackgroundColor3 = Color3.fromRGB(109, 57, 142)
							})
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								BorderColor3 = Color3.fromRGB(18, 18, 16)
							})
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								TextColor3 = Color3.fromRGB(255, 255, 255)
							})
						else
							keybindremove(text)
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								BackgroundColor3 = Color3.fromRGB(46, 46, 46)
							})
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								BorderColor3 = Color3.fromRGB(18, 18, 16)
							})
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								TextColor3 = Color3.fromRGB(255, 255, 255)
							})
						end;
						values[tabname][sectorname][text] = Element.value;
						callback(Element.value)
					end;
					Button.MouseButton1Down:Connect(function()
						if not binding then
							Element.value.Toggle = not Element.value.Toggle;
							update()
							values[tabname][sectorname][text] = Element.value;
							callback(Element.value)
						end
					end)
					if data.default then
						update()
					end;
					values[tabname][sectorname][text] = Element.value;
					do
						local Keybind = Instance.new("TextButton")
						local Frame = Instance.new("Frame")
						local Always = Instance.new("TextButton")
						local UIListLayout = Instance.new("UIListLayout")
						local Hold = Instance.new("TextButton")
						local Toggle = Instance.new("TextButton")
						Keybind.Name = "Keybind"
						Keybind.Parent = Button;
						Keybind.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
						Keybind.BorderColor3 = Color3.fromRGB(18, 18, 16)
						Keybind.Position = UDim2.new(0, 270, 0.5, -6)
						Keybind.Text = "none"
						Keybind.BackgroundTransparency = 1.000;
						Keybind.Size = UDim2.new(0, 43, 0, 12)
						Keybind.Size = UDim2.new(0, txt:GetTextSize("none", 14, Enum.Font.Ubuntu, Vector2.new(700, 12)).X + 5, 0, 12)
						Keybind.AutoButtonColor = false;
						Keybind.TextStrokeTransparency = 0.000;
						Keybind.Font = Enum.Font.Ubuntu;
						Keybind.TextColor3 = Color3.fromRGB(255, 255, 255)
						Keybind.TextSize = 10.000;
						Keybind.AnchorPoint = Vector2.new(1, 0)
						Keybind.ZIndex = 3;
						Frame.Parent = Keybind;
						Frame.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
						Frame.BorderColor3 = Color3.fromRGB(18, 18, 16)
						Frame.Position = UDim2.new(1, -49, 0, 1)
						Frame.Size = UDim2.new(0, 49, 0, 49)
						Frame.Visible = false;
						Frame.ZIndex = 3;
						Always.Name = "Always"
						Always.Parent = Frame;
						Always.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
						Always.BackgroundTransparency = 1.000;
						Always.BorderColor3 = Color3.fromRGB(18, 18, 16)
						Always.Position = UDim2.new(-3.03289485, 231, 0.115384616, -6)
						Always.Size = UDim2.new(1, 0, 0, 16)
						Always.AutoButtonColor = false;
						Always.Font = Enum.Font.Ubuntu;
						Always.Text = "Always"
						Always.TextStrokeTransparency = 0.000;
						Always.TextColor3 = Color3.fromRGB(109, 57, 142)
						Always.TextSize = 10.000;
						Always.ZIndex = 3;
						UIListLayout.Parent = Frame;
						UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
						UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
						Hold.Name = "Hold"
						Hold.Parent = Frame;
						Hold.BackgroundColor3 = Color3.fromRGB(146, 46, 46)
						Hold.BackgroundTransparency = 1.000;
						Hold.BorderColor3 = Color3.fromRGB(18, 18, 16)
						Hold.Position = UDim2.new(-3.03289485, 231, 0.115384616, -6)
						Hold.Size = UDim2.new(1, 0, 0, 16)
						Hold.AutoButtonColor = false;
						Hold.Font = Enum.Font.Ubuntu;
						Hold.Text = "Hold"
						Hold.TextStrokeTransparency = 0.000;
						Hold.TextColor3 = Color3.fromRGB(255, 255, 255)
						Hold.TextSize = 10.000;
						Hold.ZIndex = 3;
						Toggle.Name = "Toggle"
						Toggle.Parent = Frame;
						Toggle.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
						Toggle.BackgroundTransparency = 1.000;
						Toggle.BorderColor3 = Color3.fromRGB(18, 18, 16)
						Toggle.Position = UDim2.new(-3.03289485, 231, 0.115384616, -6)
						Toggle.Size = UDim2.new(1, 0, 0, 16)
						Toggle.AutoButtonColor = false;
						Toggle.Font = Enum.Font.Ubuntu;
						Toggle.Text = "Toggle"
						Toggle.TextStrokeTransparency = 0.000;
						Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
						Toggle.TextSize = 10.000;
						Toggle.ZIndex = 3;
						for _, button in pairs(Frame:GetChildren()) do
							if button:IsA("TextButton") then
								button.MouseButton1Down:Connect(function()
									Element.value.Type = button.Text;
									Frame.Visible = false;
									if Element.value.Active ~= (Element.value.Type == "Always" and true or false) then
										Element.value.Active = Element.value.Type == "Always" and true or false;
										callback(Element.value)
									end;
									if button.Text == "Always" then
										keybindremove(text)
									end;
									for _, button in pairs(Frame:GetChildren()) do
										if button:IsA("TextButton") and button.Text ~= Element.value.Type then
											button.Font = Enum.Font.Ubuntu;
											library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
												TextColor3 = Color3.fromRGB(255, 255, 255)
											})
										end
									end;
									button.Font = Enum.Font.Ubuntu;
									button.TextColor3 = Color3.fromRGB(109, 57, 142)
									values[tabname][sectorname][text] = Element.value
								end)
								button.MouseEnter:Connect(function()
									if Element.value.Type ~= button.Text then
										library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
											TextColor3 = Color3.fromRGB(155, 155, 155)
										})
									end
								end)
								button.MouseLeave:Connect(function()
									if Element.value.Type ~= button.Text then
										library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
											TextColor3 = Color3.fromRGB(155, 155, 155)
										})
									end
								end)
							end
						end;
						Keybind.MouseButton1Down:Connect(function()
							if not binding then
								wait()
								binding = true;
								Keybind.Text = "-"
								Keybind.Size = UDim2.new(0, txt:GetTextSize("-", 14, Enum.Font.Ubuntu, Vector2.new(700, 12)).X + 4, 0, 12)
							end
						end)
						Keybind.MouseButton2Down:Connect(function()
							if not binding then
								Frame.Visible = not Frame.Visible
							end
						end)
						local Player = game.Players.LocalPlayer;
						local Mouse = Player:GetMouse()
						local InFrame = false;
						Frame.MouseEnter:Connect(function()
							InFrame = true
						end)
						Frame.MouseLeave:Connect(function()
							InFrame = false
						end)
						local InFrame2 = false;
						Keybind.MouseEnter:Connect(function()
							InFrame2 = true
						end)
						Keybind.MouseLeave:Connect(function()
							InFrame2 = false
						end)
						game:GetService("UserInputService").InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 and not binding then
								if Frame.Visible == true and not InFrame and not InFrame2 then
									Frame.Visible = false
								end
							end;
							if binding then
								binding = false;
								Keybind.Text = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name:upper() or input.UserInputType.Name:upper()
								Keybind.Size = UDim2.new(0, txt:GetTextSize(Keybind.Text, 14, Enum.Font.Ubuntu, Vector2.new(700, 12)).X + 5, 0, 12)
								Element.value.Key = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name or input.UserInputType.Name;
								if input.KeyCode.Name == "Backspace" then
									Keybind.Text = "none"
									Keybind.Size = UDim2.new(0, txt:GetTextSize(Keybind.Text, 14, Enum.Font.Ubuntu, Vector2.new(700, 12)).X + 4, 0, 12)
									Element.value.Key = nil;
									Element.value.Active = true
								end;
								callback(Element.value)
							else
								if Element.value.Key ~= nil then
									if string.find(Element.value.Key, "Mouse") then
										if input.UserInputType == Enum.UserInputType[Element.value.Key] then
											if Element.value.Type == "Hold" then
												Element.value.Active = true;
												callback(Element.value)
												if Element.value.Active and Element.value.Toggle then
													keybindhold(text)
												else
													keybindremove(text)
												end
											elseif Element.value.Type == "Toggle" then
												Element.value.Active = not Element.value.Active;
												callback(Element.value)
												if Element.value.Active and Element.value.Toggle then
													keybindadd(text)
												else
													keybindremove(text)
												end
											end
										end
									else
										if input.KeyCode == Enum.KeyCode[Element.value.Key] then
											if Element.value.Type == "Hold" then
												Element.value.Active = true;
												callback(Element.value)
												if Element.value.Active and Element.value.Toggle then
													keybindhold(text)
												else
													keybindremove(text)
												end
											elseif Element.value.Type == "Toggle" then
												Element.value.Active = not Element.value.Active;
												callback(Element.value)
												if Element.value.Active and Element.value.Toggle then
													keybindadd(text)
												else
													keybindremove(text)
												end
											end
										end
									end
								else
									Element.value.Active = true
								end
							end;
							values[tabname][sectorname][text] = Element.value
						end)
						game:GetService("UserInputService").InputEnded:Connect(function(input)
							if Element.value.Key ~= nil then
								if string.find(Element.value.Key, "Mouse") then
									if input.UserInputType == Enum.UserInputType[Element.value.Key] then
										if Element.value.Type == "Hold" then
											Element.value.Active = false;
											callback(Element.value)
											if Element.value.Active then
												keybindhold(text)
											else
												keybindremove(text)
											end
										end
									end
								else
									if input.KeyCode == Enum.KeyCode[Element.value.Key] then
										if Element.value.Type == "Hold" then
											Element.value.Active = false;
											callback(Element.value)
											if Element.value.Active then
												keybindhold(text)
											else
												keybindremove(text)
											end
										end
									end
								end
							end;
							values[tabname][sectorname][text] = Element.value
						end)
					end;
					function Element:SetValue(value)
						Element.value = value;
						update()
					end
				elseif type == "Toggle" then
					Section.Size = Section.Size + UDim2.new(0, 0, 0, 16)
					Element.value = {
						Toggle = data.default and data.default.Toggle or false
					}
					local Toggle = Instance.new("Frame")
					local Button = Instance.new("TextButton")
					local Color = Instance.new("Frame")
					local TextLabel = Instance.new("TextLabel")
					Toggle.Name = "Toggle"
					Toggle.Parent = Inner;
					Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Toggle.BackgroundTransparency = 1.000;
					Toggle.Size = UDim2.new(1, 0, 0, 15)
					Button.Name = "Button"
					Button.Parent = Toggle;
					Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Button.BackgroundTransparency = 1.000;
					Button.Size = UDim2.new(1, 0, 1, 0)
					Button.Font = Enum.Font.Ubuntu;
					Button.Text = ""
					Button.TextColor3 = Color3.fromRGB(0, 0, 0)
					Button.TextSize = 10.000;
					Color.Name = "Color"
					Color.Parent = Button;
					Color.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
					Color.BorderColor3 = Color3.fromRGB(18, 18, 16)
					Color.Position = UDim2.new(0, 15, 0.5, -5)
					Color.Size = UDim2.new(0, 8, 0, 8)
					TextLabel.Parent = Button;
					TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000;
					TextLabel.Position = UDim2.new(0, 32, 0, -1)
					TextLabel.Size = UDim2.new(0.111913361, 208, 1, 0)
					TextLabel.Font = Enum.Font.Ubuntu;
					TextLabel.Text = text;
					TextLabel.TextStrokeTransparency = 0.000;
					TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.TextSize = 10.000;
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
					local function update()
						if Element.value.Toggle then
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								BackgroundColor3 = Color3.fromRGB(109, 57, 142)
							})
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								BorderColor3 = Color3.fromRGB(18, 18, 16)
							})
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								TextColor3 = Color3.fromRGB(255, 255, 255)
							})
						else
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								BackgroundColor3 = Color3.fromRGB(46, 46, 46)
							})
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								BorderColor3 = Color3.fromRGB(18, 18, 16)
							})
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								TextColor3 = Color3.fromRGB(255, 255, 255)
							})
						end;
						values[tabname][sectorname][text] = Element.value
					end;
					Button.MouseButton1Down:Connect(function()
						Element.value.Toggle = not Element.value.Toggle;
						update()
						values[tabname][sectorname][text] = Element.value;
						callback(Element.value)
					end)
					if data.default then
						update()
					end;
					values[tabname][sectorname][text] = Element.value;
					function Element:SetValue(value)
						Element.value = value;
						values[tabname][sectorname][text] = Element.value;
						update()
						callback(Element.value)
					end
				elseif type == "ToggleColor" then
					Section.Size = Section.Size + UDim2.new(0, 0, 0, 16)
					Element.value = {
						Toggle = data.default and data.default.Toggle or false,
						Color = data.default and data.default.Color or Color3.fromRGB(255, 255, 255)
					}
					local Toggle = Instance.new("Frame")
					local Button = Instance.new("TextButton")
					local Color = Instance.new("Frame")
					local TextLabel = Instance.new("TextLabel")
					Toggle.Name = "Toggle"
					Toggle.Parent = Inner;
					Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Toggle.BackgroundTransparency = 1.000;
					Toggle.Size = UDim2.new(1, 0, 0, 15)
					Button.Name = "Button"
					Button.Parent = Toggle;
					Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Button.BackgroundTransparency = 1.000;
					Button.Size = UDim2.new(1, 0, 1, 0)
					Button.Font = Enum.Font.Ubuntu;
					Button.Text = ""
					Button.TextColor3 = Color3.fromRGB(0, 0, 0)
					Button.TextSize = 10.000;
					Color.Name = "Color"
					Color.Parent = Button;
					Color.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
					Color.BorderColor3 = Color3.fromRGB(18, 18, 16)
					Color.Position = UDim2.new(0, 15, 0.5, -5)
					Color.Size = UDim2.new(0, 8, 0, 8)
					TextLabel.Parent = Button;
					TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000;
					TextLabel.Position = UDim2.new(0, 32, 0, -1)
					TextLabel.Size = UDim2.new(0.111913361, 208, 1, 0)
					TextLabel.Font = Enum.Font.Ubuntu;
					TextLabel.Text = text;
					TextLabel.TextStrokeTransparency = 0.000;
					TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.TextSize = 10.000;
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
					local function update()
						if Element.value.Toggle then
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								BackgroundColor3 = Color3.fromRGB(109, 57, 142)
							})
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								BorderColor3 = Color3.fromRGB(18, 18, 16)
							})
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								TextColor3 = Color3.fromRGB(255, 255, 255)
							})
						else
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								BackgroundColor3 = Color3.fromRGB(46, 46, 46)
							})
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								BorderColor3 = Color3.fromRGB(18, 18, 16)
							})
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								TextColor3 = Color3.fromRGB(255, 255, 255)
							})
						end;
						values[tabname][sectorname][text] = Element.value
					end;
					local ColorH, ColorS, ColorV;
					local ColorP = Instance.new("TextButton")
					local Frame = Instance.new("Frame")
					local Colorpick = Instance.new("ImageButton")
					local ColorDrag = Instance.new("Frame")
					local Huepick = Instance.new("ImageButton")
					local Huedrag = Instance.new("Frame")
					ColorP.Name = "ColorP"
					ColorP.Parent = Button;
					ColorP.AnchorPoint = Vector2.new(1, 0)
					ColorP.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
					ColorP.BorderColor3 = Color3.fromRGB(18, 18, 16)
					ColorP.Position = UDim2.new(0, 270, 0.5, -4)
					ColorP.Size = UDim2.new(0, 18, 0, 8)
					ColorP.AutoButtonColor = false;
					ColorP.Font = Enum.Font.Ubuntu;
					ColorP.Text = ""
					ColorP.TextColor3 = Color3.fromRGB(255, 255, 255)
					ColorP.TextSize = 10.000;
					Frame.Parent = ColorP;
					Frame.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
					Frame.BorderColor3 = Color3.fromRGB(18, 18, 16)
					Frame.Position = UDim2.new(-0.666666687, -170, 1.375, 0)
					Frame.Size = UDim2.new(0, 200, 0, 170)
					Frame.Visible = false;
					Frame.ZIndex = 3;
					Colorpick.Name = "Colorpick"
					Colorpick.Parent = Frame;
					Colorpick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Colorpick.BorderColor3 = Color3.fromRGB(18, 18, 16)
					Colorpick.ClipsDescendants = false;
					Colorpick.Position = UDim2.new(0, 40, 0, 10)
					Colorpick.Size = UDim2.new(0, 150, 0, 150)
					Colorpick.AutoButtonColor = false;
					Colorpick.Image = "rbxassetid://4155801252"
					Colorpick.ImageColor3 = Color3.fromRGB(255, 0, 0)
					Colorpick.ZIndex = 3;
					ColorDrag.Name = "ColorDrag"
					ColorDrag.Parent = Colorpick;
					ColorDrag.AnchorPoint = Vector2.new(0.5, 0.5)
					ColorDrag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ColorDrag.BorderColor3 = Color3.fromRGB(18, 18, 16)
					ColorDrag.Size = UDim2.new(0, 4, 0, 4)
					ColorDrag.ZIndex = 3;
					Huepick.Name = "Huepick"
					Huepick.Parent = Frame;
					Huepick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Huepick.BorderColor3 = Color3.fromRGB(18, 18, 16)
					Huepick.ClipsDescendants = false;
					Huepick.Position = UDim2.new(0, 10, 0, 10)
					Huepick.Size = UDim2.new(0, 20, 0, 150)
					Huepick.AutoButtonColor = false;
					Huepick.Image = "rbxassetid://3641079629"
					Huepick.ImageColor3 = Color3.fromRGB(255, 0, 0)
					Huepick.ImageTransparency = 1;
					Huepick.BackgroundTransparency = 0;
					Huepick.ZIndex = 3;
					local HueFrameGradient = Instance.new("UIGradient")
					HueFrameGradient.Rotation = 90;
					HueFrameGradient.Name = "HueFrameGradient"
					HueFrameGradient.Parent = Huepick;
					HueFrameGradient.Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
						ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 0, 255)),
						ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 0, 255)),
						ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)),
						ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 255, 0)),
						ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 255, 0)),
						ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))
					}
					Huedrag.Name = "Huedrag"
					Huedrag.Parent = Huepick;
					Huedrag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Huedrag.BorderColor3 = Color3.fromRGB(18, 18, 16)
					Huedrag.Size = UDim2.new(1, 0, 0, 2)
					Huedrag.ZIndex = 3;
					ColorP.MouseButton1Down:Connect(function()
						Frame.Visible = not Frame.Visible
					end)
					local abc = false;
					local inCP = false;
					ColorP.MouseEnter:Connect(function()
						abc = true
					end)
					ColorP.MouseLeave:Connect(function()
						abc = false
					end)
					Frame.MouseEnter:Connect(function()
						inCP = true
					end)
					Frame.MouseLeave:Connect(function()
						inCP = false
					end)
					ColorH = (math.clamp(Huedrag.AbsolutePosition.Y - Huepick.AbsolutePosition.Y, 0, Huepick.AbsoluteSize.Y) / Huepick.AbsoluteSize.Y)
					ColorS = 1 - (math.clamp(ColorDrag.AbsolutePosition.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X) / Colorpick.AbsoluteSize.X)
					ColorV = 1 - (math.clamp(ColorDrag.AbsolutePosition.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y) / Colorpick.AbsoluteSize.Y)
					if data.default and data.default.Color ~= nil then
						ColorH, ColorS, ColorV = data.default.Color:ToHSV()
						ColorH = math.clamp(ColorH, 0, 1)
						ColorS = math.clamp(ColorS, 0, 1)
						ColorV = math.clamp(ColorV, 0, 1)
						ColorDrag.Position = UDim2.new(1 - ColorS, 0, 1 - ColorV, 0)
						Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)
						ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
						Huedrag.Position = UDim2.new(0, 0, 1 - ColorH, -1)
						values[tabname][sectorname][text] = data.default.Color
					end;
					local mouse = LocalPlayer:GetMouse()
					game:GetService("UserInputService").InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
							if not dragging and not abc and not inCP then
								Frame.Visible = false
							end
						end
					end)
					local function updateColor()
						local ColorX = (math.clamp(mouse.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X) / Colorpick.AbsoluteSize.X)
						local ColorY = (math.clamp(mouse.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y) / Colorpick.AbsoluteSize.Y)
						ColorDrag.Position = UDim2.new(ColorX, 0, ColorY, 0)
						ColorS = 1 - ColorX;
						ColorV = 1 - ColorY;
						Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)
						ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
						values[tabname][sectorname][text] = Element.value;
						Element.value.Color = Color3.fromHSV(ColorH, ColorS, ColorV)
						callback(Element.value)
					end;
					local function updateHue()
						local y = math.clamp(mouse.Y - Huepick.AbsolutePosition.Y, 0, 148)
						Huedrag.Position = UDim2.new(0, 0, 0, y)
						hue = y / 148;
						ColorH = 1 - hue;
						Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)
						ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
						values[tabname][sectorname][text] = Element.value;
						Element.value.Color = Color3.fromHSV(ColorH, ColorS, ColorV)
						callback(Element.value)
					end;
					Colorpick.MouseButton1Down:Connect(function()
						updateColor()
						moveconnection = mouse.Move:Connect(function()
							updateColor()
						end)
						releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)
							if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
								updateColor()
								moveconnection:Disconnect()
								releaseconnection:Disconnect()
							end
						end)
					end)
					Huepick.MouseButton1Down:Connect(function()
						updateHue()
						moveconnection = mouse.Move:Connect(function()
							updateHue()
						end)
						releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)
							if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
								updateHue()
								moveconnection:Disconnect()
								releaseconnection:Disconnect()
							end
						end)
					end)
					Button.MouseButton1Down:Connect(function()
						Element.value.Toggle = not Element.value.Toggle;
						update()
						values[tabname][sectorname][text] = Element.value;
						callback(Element.value)
					end)
					if data.default then
						update()
					end;
					values[tabname][sectorname][text] = Element.value;
					function Element:SetValue(value)
						Element.value = value;
						local duplicate = Color3.new(value.Color.R, value.Color.G, value.Color.B)
						ColorH, ColorS, ColorV = duplicate:ToHSV()
						ColorH = math.clamp(ColorH, 0, 1)
						ColorS = math.clamp(ColorS, 0, 1)
						ColorV = math.clamp(ColorV, 0, 1)
						ColorDrag.Position = UDim2.new(1 - ColorS, 0, 1 - ColorV, 0)
						Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)
						ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
						update()
						Huedrag.Position = UDim2.new(0, 0, 1 - ColorH, -1)
						callback(value)
					end
				elseif type == "ToggleTrans" then
					Section.Size = Section.Size + UDim2.new(0, 0, 0, 16)
					Element.value = {
						Toggle = data.default and data.default.Toggle or false,
						Color = data.default and data.default.Color or Color3.fromRGB(255, 255, 255),
						Transparency = data.default and data.default.Transparency or 0
					}
					local Toggle = Instance.new("Frame")
					local Button = Instance.new("TextButton")
					local Color = Instance.new("Frame")
					local TextLabel = Instance.new("TextLabel")
					Toggle.Name = "Toggle"
					Toggle.Parent = Inner;
					Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Toggle.BackgroundTransparency = 1.000;
					Toggle.Size = UDim2.new(1, 0, 0, 15)
					Button.Name = "Button"
					Button.Parent = Toggle;
					Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Button.BackgroundTransparency = 1.000;
					Button.Size = UDim2.new(1, 0, 1, 0)
					Button.Font = Enum.Font.Ubuntu;
					Button.Text = ""
					Button.TextColor3 = Color3.fromRGB(0, 0, 0)
					Button.TextSize = 10.000;
					Color.Name = "Color"
					Color.Parent = Button;
					Color.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
					Color.BorderColor3 = Color3.fromRGB(18, 18, 16)
					Color.Position = UDim2.new(0, 15, 0.5, -5)
					Color.Size = UDim2.new(0, 8, 0, 8)
					TextLabel.Parent = Button;
					TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000;
					TextLabel.Position = UDim2.new(0, 32, 0, -1)
					TextLabel.Size = UDim2.new(0.111913361, 208, 1, 0)
					TextLabel.Font = Enum.Font.Ubuntu;
					TextLabel.Text = text;
					TextLabel.TextStrokeTransparency = 0.000;
					TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.TextSize = 10.000;
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
					local function update()
						if Element.value.Toggle then
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								BackgroundColor3 = Color3.fromRGB(109, 57, 142)
							})
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								BorderColor3 = Color3.fromRGB(18, 18, 16)
							})
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								TextColor3 = Color3.fromRGB(255, 255, 255)
							})
						else
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								BackgroundColor3 = Color3.fromRGB(46, 46, 46)
							})
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								BorderColor3 = Color3.fromRGB(18, 18, 16)
							})
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								TextColor3 = Color3.fromRGB(255, 255, 255)
							})
						end;
						values[tabname][sectorname][text] = Element.value;
						callback(Element.value)
					end;
					local ColorH, ColorS, ColorV;
					local ColorP = Instance.new("TextButton")
					local Frame = Instance.new("Frame")
					local Colorpick = Instance.new("ImageButton")
					local ColorDrag = Instance.new("Frame")
					local Huepick = Instance.new("ImageButton")
					local Huedrag = Instance.new("Frame")
					ColorP.Name = "ColorP"
					ColorP.Parent = Button;
					ColorP.AnchorPoint = Vector2.new(1, 0)
					ColorP.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
					ColorP.BorderColor3 = Color3.fromRGB(18, 18, 16)
					ColorP.Position = UDim2.new(0, 270, 0.5, -4)
					ColorP.Size = UDim2.new(0, 18, 0, 8)
					ColorP.AutoButtonColor = false;
					ColorP.Font = Enum.Font.Ubuntu;
					ColorP.Text = ""
					ColorP.TextColor3 = Color3.fromRGB(255, 255, 255)
					ColorP.TextSize = 10.000;
					Frame.Parent = ColorP;
					Frame.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
					Frame.BorderColor3 = Color3.fromRGB(18, 18, 16)
					Frame.Position = UDim2.new(-0.666666687, -170, 1.375, 0)
					Frame.Size = UDim2.new(0, 200, 0, 190)
					Frame.Visible = false;
					Frame.ZIndex = 3;
					Colorpick.Name = "Colorpick"
					Colorpick.Parent = Frame;
					Colorpick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Colorpick.BorderColor3 = Color3.fromRGB(18, 18, 16)
					Colorpick.ClipsDescendants = false;
					Colorpick.Position = UDim2.new(0, 40, 0, 10)
					Colorpick.Size = UDim2.new(0, 150, 0, 150)
					Colorpick.AutoButtonColor = false;
					Colorpick.Image = "rbxassetid://4155801252"
					Colorpick.ImageColor3 = Color3.fromRGB(255, 0, 0)
					Colorpick.ZIndex = 3;
					ColorDrag.Name = "ColorDrag"
					ColorDrag.Parent = Colorpick;
					ColorDrag.AnchorPoint = Vector2.new(0.5, 0.5)
					ColorDrag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ColorDrag.BorderColor3 = Color3.fromRGB(18, 18, 16)
					ColorDrag.Size = UDim2.new(0, 4, 0, 4)
					ColorDrag.ZIndex = 3;
					Huepick.Name = "Huepick"
					Huepick.Parent = Frame;
					Huepick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Huepick.BorderColor3 = Color3.fromRGB(18, 18, 16)
					Huepick.ClipsDescendants = true;
					Huepick.Position = UDim2.new(0, 10, 0, 10)
					Huepick.Size = UDim2.new(0, 20, 0, 150)
					Huepick.AutoButtonColor = false;
					Huepick.Image = "rbxassetid://3641079629"
					Huepick.ImageColor3 = Color3.fromRGB(255, 0, 0)
					Huepick.ImageTransparency = 1;
					Huepick.BackgroundTransparency = 0;
					Huepick.ZIndex = 3;
					local HueFrameGradient = Instance.new("UIGradient")
					HueFrameGradient.Rotation = 90;
					HueFrameGradient.Name = "HueFrameGradient"
					HueFrameGradient.Parent = Huepick;
					HueFrameGradient.Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
						ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 0, 255)),
						ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 0, 255)),
						ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)),
						ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 255, 0)),
						ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 255, 0)),
						ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))
					}
					Huedrag.Name = "Huedrag"
					Huedrag.Parent = Huepick;
					Huedrag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Huedrag.BorderColor3 = Color3.fromRGB(18, 18, 16)
					Huedrag.Size = UDim2.new(1, 0, 0, 2)
					Huedrag.ZIndex = 3;
					local Transpick = Instance.new("ImageButton")
					local Transcolor = Instance.new("ImageLabel")
					local Transdrag = Instance.new("Frame")
					Transpick.Name = "Transpick"
					Transpick.Parent = Frame;
					Transpick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Transpick.BorderColor3 = Color3.fromRGB(18, 18, 16)
					Transpick.Position = UDim2.new(0, 10, 0, 167)
					Transpick.Size = UDim2.new(0, 180, 0, 15)
					Transpick.AutoButtonColor = false;
					Transpick.Image = "rbxassetid://3887014957"
					Transpick.ScaleType = Enum.ScaleType.Tile;
					Transpick.TileSize = UDim2.new(0, 10, 0, 10)
					Transpick.ZIndex = 3;
					Transcolor.Name = "Transcolor"
					Transcolor.Parent = Transpick;
					Transcolor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Transcolor.BackgroundTransparency = 1.000;
					Transcolor.Size = UDim2.new(1, 0, 1, 0)
					Transcolor.Image = "rbxassetid://3887017050"
					Transcolor.ImageColor3 = Color3.fromRGB(255, 0, 4)
					Transcolor.ZIndex = 3;
					Transdrag.Name = "Transdrag"
					Transdrag.Parent = Transcolor;
					Transdrag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Transdrag.BorderColor3 = Color3.fromRGB(18, 18, 16)
					Transdrag.Position = UDim2.new(0, -1, 0, 0)
					Transdrag.Size = UDim2.new(0, 2, 1, 0)
					Transdrag.ZIndex = 3;
					ColorP.MouseButton1Down:Connect(function()
						Frame.Visible = not Frame.Visible
					end)
					local abc = false;
					local inCP = false;
					ColorP.MouseEnter:Connect(function()
						abc = true
					end)
					ColorP.MouseLeave:Connect(function()
						abc = false
					end)
					Frame.MouseEnter:Connect(function()
						inCP = true
					end)
					Frame.MouseLeave:Connect(function()
						inCP = false
					end)
					ColorH = (math.clamp(Huedrag.AbsolutePosition.Y - Huepick.AbsolutePosition.Y, 0, Huepick.AbsoluteSize.Y) / Huepick.AbsoluteSize.Y)
					ColorS = 1 - (math.clamp(ColorDrag.AbsolutePosition.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X) / Colorpick.AbsoluteSize.X)
					ColorV = 1 - (math.clamp(ColorDrag.AbsolutePosition.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y) / Colorpick.AbsoluteSize.Y)
					if data.default and data.default.Color ~= nil then
						ColorH, ColorS, ColorV = data.default.Color:ToHSV()
						ColorH = math.clamp(ColorH, 0, 1)
						ColorS = math.clamp(ColorS, 0, 1)
						ColorV = math.clamp(ColorV, 0, 1)
						ColorDrag.Position = UDim2.new(1 - ColorS, 0, 1 - ColorV, 0)
						Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)
						Transcolor.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)
						ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
						Huedrag.Position = UDim2.new(0, 0, 1 - ColorH, -1)
					end;
					if data.default and data.default.Transparency ~= nil then
						Transdrag.Position = UDim2.new(data.default.Transparency, -1, 0, 0)
					end;
					local mouse = LocalPlayer:GetMouse()
					game:GetService("UserInputService").InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
							if not dragging and not abc and not inCP then
								Frame.Visible = false
							end
						end
					end)
					local function updateColor()
						local ColorX = (math.clamp(mouse.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X) / Colorpick.AbsoluteSize.X)
						local ColorY = (math.clamp(mouse.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y) / Colorpick.AbsoluteSize.Y)
						ColorDrag.Position = UDim2.new(ColorX, 0, ColorY, 0)
						ColorS = 1 - ColorX;
						ColorV = 1 - ColorY;
						Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)
						ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
						Transcolor.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)
						values[tabname][sectorname][text] = Element.value;
						Element.value.Color = Color3.fromHSV(ColorH, ColorS, ColorV)
						callback(Element.value)
					end;
					local function updateHue()
						local y = math.clamp(mouse.Y - Huepick.AbsolutePosition.Y, 0, 148)
						Huedrag.Position = UDim2.new(0, 0, 0, y)
						hue = y / 148;
						ColorH = 1 - hue;
						Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)
						Transcolor.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)
						ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
						values[tabname][sectorname][text] = Element.value;
						Element.value.Color = Color3.fromHSV(ColorH, ColorS, ColorV)
						callback(Element.value)
					end;
					local function updateTrans()
						local x = math.clamp(mouse.X - Transpick.AbsolutePosition.X, 0, 178)
						Transdrag.Position = UDim2.new(0, x, 0, 0)
						Element.value.Transparency = (x / 178)
						values[tabname][sectorname][text] = Element.value;
						callback(Element.value)
					end;
					Transpick.MouseButton1Down:Connect(function()
						updateTrans()
						moveconnection = mouse.Move:Connect(function()
							updateTrans()
						end)
						releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)
							if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
								updateTrans()
								moveconnection:Disconnect()
								releaseconnection:Disconnect()
							end
						end)
					end)
					Colorpick.MouseButton1Down:Connect(function()
						updateColor()
						moveconnection = mouse.Move:Connect(function()
							updateColor()
						end)
						releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)
							if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
								updateColor()
								moveconnection:Disconnect()
								releaseconnection:Disconnect()
							end
						end)
					end)
					Huepick.MouseButton1Down:Connect(function()
						updateHue()
						moveconnection = mouse.Move:Connect(function()
							updateHue()
						end)
						releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)
							if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
								updateHue()
								moveconnection:Disconnect()
								releaseconnection:Disconnect()
							end
						end)
					end)
					Button.MouseButton1Down:Connect(function()
						Element.value.Toggle = not Element.value.Toggle;
						update()
						values[tabname][sectorname][text] = Element.value;
						callback(Element.value)
					end)
					if data.default then
						if Element.value.Toggle then
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								BackgroundColor3 = Color3.fromRGB(109, 57, 142)
							})
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								TextColor3 = Color3.fromRGB(255, 255, 255)
							})
						else
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								BackgroundColor3 = Color3.fromRGB(46, 46, 46)
							})
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								TextColor3 = Color3.fromRGB(255, 255, 255)
							})
						end;
						values[tabname][sectorname][text] = Element.value
					end;
					values[tabname][sectorname][text] = Element.value;
					function Element:SetValue(value)
						Element.value = value;
						local duplicate = Color3.new(value.Color.R, value.Color.G, value.Color.B)
						ColorH, ColorS, ColorV = duplicate:ToHSV()
						ColorH = math.clamp(ColorH, 0, 1)
						ColorS = math.clamp(ColorS, 0, 1)
						ColorV = math.clamp(ColorV, 0, 1)
						ColorDrag.Position = UDim2.new(1 - ColorS, 0, 1 - ColorV, 0)
						Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)
						ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
						update()
						Huedrag.Position = UDim2.new(0, 0, 1 - ColorH, -1)
					end
				elseif type == "TextBox" then
					Section.Size = Section.Size + UDim2.new(0, 0, 0, 30)
					Element.value = {
						Text = data.default and data.default.text or ""
					}
					local Box = Instance.new("Frame")
					local TextBox = Instance.new("TextBox")
					Box.Name = "Box"
					Box.Parent = Inner;
					Box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Box.BackgroundTransparency = 1.000;
					Box.Position = UDim2.new(0, 0, 0.542059898, 0)
					Box.Size = UDim2.new(1, 0, 0, 30)
					TextBox.Parent = Box;
					TextBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
					TextBox.BorderColor3 = Color3.fromRGB(18, 18, 16)
					TextBox.Position = UDim2.new(0.108303241, 0, 0.224465579, 0)
					TextBox.Size = UDim2.new(0, 175, 0, 20)
					TextBox.Font = Enum.Font.Ubuntu;
					TextBox.PlaceholderText = data.placeholder;
					TextBox.Text = Element.value.Text;
					TextBox.TextTruncate = 1;
					TextBox.MultiLine = true;
					TextBox.ClearTextOnFocus = false;
					TextBox.TextStrokeTransparency = 0.000;
					TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextBox.TextSize = 10.000;
					values[tabname][sectorname][text] = Element.value;
					TextBox:GetPropertyChangedSignal("Text"):Connect(function()
						Element.value.Text = TextBox.Text;
						values[tabname][sectorname][text] = Element.value;
						callback(Element.value)
					end)
					function Element:SetValue(value)
						Element.value = value;
						values[tabname][sectorname][text] = Element.value;
						TextBox.Text = Element.value.Text
					end
				elseif type == "Dropdown" then
					Section.Size = Section.Size + UDim2.new(0, 0, 0, 39)
					Element.value = {
						Dropdown = data.options[1]
					}
					local Dropdown = Instance.new("Frame")
					local Button = Instance.new("TextButton")
					local TextLabel = Instance.new("TextLabel")
					local Drop = Instance.new("ScrollingFrame")
					local Button_2 = Instance.new("TextButton")
					local TextLabel_2 = Instance.new("TextLabel")
					local UIListLayout = Instance.new("UIListLayout")
					local ImageLabel = Instance.new("ImageLabel")
					local TextLabel_3 = Instance.new("TextLabel")
					Dropdown.Name = "Dropdown"
					Dropdown.Parent = Inner;
					Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Dropdown.BackgroundTransparency = 1.000;
					Dropdown.Position = UDim2.new(0, 0, 0.255102038, 0)
					Dropdown.Size = UDim2.new(1, 0, 0, 39)
					Button.Name = "Button"
					Button.Parent = Dropdown;
					Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Button.BorderColor3 = Color3.fromRGB(18, 18, 16)
					Button.Position = UDim2.new(0, 30, 0, 16)
					Button.Size = UDim2.new(0, 175, 0, 17)
					Button.AutoButtonColor = false;
					Button.Font = Enum.Font.Ubuntu;
					Button.Text = ""
					Button.TextColor3 = Color3.fromRGB(0, 0, 0)
					Button.TextSize = 10.000;
					local UIGradient = Instance.new("UIGradient")
					UIGradient.Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0.00, Color3.fromRGB(49, 49, 49)),
						ColorSequenceKeypoint.new(0.50, Color3.fromRGB(42, 42, 42)),
						ColorSequenceKeypoint.new(1.00, Color3.fromRGB(33, 33, 32))
					}
					UIGradient.Rotation = 90;
					UIGradient.Parent = Button;
					TextLabel.Parent = Button;
					TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000;
					TextLabel.BorderColor3 = Color3.fromRGB(18, 18, 16)
					TextLabel.Position = UDim2.new(0, 5, 0, 0)
					TextLabel.Size = UDim2.new(-0.21714285, 208, 1, 0)
					TextLabel.Font = Enum.Font.Ubuntu;
					TextLabel.Text = Element.value.Dropdown;
					TextLabel.TextStrokeTransparency = 0.000;
					TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.TextSize = 10.000;
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
					local abcd = TextLabel;
					Drop.Name = "Drop"
					Drop.Parent = Button;
					Drop.Active = true;
					Drop.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
					Drop.BorderColor3 = Color3.fromRGB(18, 18, 16)
					Drop.Position = UDim2.new(0, 0, 1, 1)
					Drop.Size = UDim2.new(1, 0, 0, 20)
					Drop.Visible = false;
					Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282"
					Drop.CanvasSize = UDim2.new(1, 1, 1, 1)
					Drop.ScrollBarThickness = 4;
					Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282"
					Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282"
					Drop.AutomaticCanvasSize = "Y"
					Drop.ZIndex = 5;
					Drop.ScrollBarImageColor3 = Color3.fromRGB(109, 57, 142)
					UIListLayout.Parent = Drop;
					UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
					local num = #data.options;
					if num > 5 then
						Drop.Size = UDim2.new(1, 0, 0, 85)
					else
						Drop.Size = UDim2.new(1, 0, 0, 17 * num)
					end;
					local first = true;
					for i, v in ipairs(data.options) do
						do
							local Button = Instance.new("TextButton")
							local TextLabel = Instance.new("TextLabel")
							Button.Name = v;
							Button.Parent = Drop;
							Button.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
							Button.BorderColor3 = Color3.fromRGB(18, 18, 16)
							Button.Position = UDim2.new(0, 30, 0, 16)
							Button.Size = UDim2.new(0, 175, 0, 17)
							Button.AutoButtonColor = false;
							Button.Font = Enum.Font.Ubuntu;
							Button.Text = ""
							Button.TextColor3 = Color3.fromRGB(0, 0, 0)
							Button.TextSize = 10.000;
							Button.BorderSizePixel = 0;
							Button.ZIndex = 6;
							TextLabel.Parent = Button;
							TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
							TextLabel.BackgroundTransparency = 1.000;
							TextLabel.BorderColor3 = Color3.fromRGB(18, 18, 16)
							TextLabel.Position = UDim2.new(0, 5, 0, -1)
							TextLabel.Size = UDim2.new(-0.21714285, 208, 1, 0)
							TextLabel.Font = Enum.Font.Ubuntu;
							TextLabel.Text = v;
							TextLabel.TextStrokeTransparency = 0.000;
							TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
							TextLabel.TextSize = 10.000;
							TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
							TextLabel.ZIndex = 6;
							Button.MouseButton1Down:Connect(function()
								Drop.Visible = false;
								Element.value.Dropdown = v;
								abcd.Text = v;
								values[tabname][sectorname][text] = Element.value;
								callback(Element.value)
								Drop.CanvasPosition = Vector2.new(0, 0)
							end)
							Button.MouseEnter:Connect(function()
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									TextColor3 = Color3.fromRGB(109, 57, 142)
								})
							end)
							Button.MouseLeave:Connect(function()
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									TextColor3 = Color3.fromRGB(255, 255, 255)
								})
							end)
							first = false
						end
					end;
					function Element:SetValue(val)
						Element.value = val;
						abcd.Text = val.Dropdown;
						values[tabname][sectorname][text] = Element.value;
						callback(val)
					end;
					ImageLabel.Parent = Button;
					ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ImageLabel.BackgroundTransparency = 1.000;
					ImageLabel.Position = UDim2.new(0, 165, 0, 6)
					ImageLabel.Size = UDim2.new(0, 6, 0, 4)
					ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531"
					TextLabel_3.Parent = Dropdown;
					TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel_3.BackgroundTransparency = 1.000;
					TextLabel_3.Position = UDim2.new(0, 32, 0, -1)
					TextLabel_3.Size = UDim2.new(0.111913361, 208, 0.382215232, 0)
					TextLabel_3.Font = Enum.Font.Ubuntu;
					TextLabel_3.Text = text;
					TextLabel_3.TextStrokeTransparency = 0.000;
					TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel_3.TextSize = 10.000;
					TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left;
					Button.MouseButton1Down:Connect(function()
						Drop.Visible = not Drop.Visible;
						if not Drop.Visible then
							Drop.CanvasPosition = Vector2.new(0, 0)
						end
					end)
					local indrop = false;
					local ind = false;
					Drop.MouseEnter:Connect(function()
						indrop = true
					end)
					Drop.MouseLeave:Connect(function()
						indrop = false
					end)
					Button.MouseEnter:Connect(function()
						ind = true
					end)
					Button.MouseLeave:Connect(function()
						ind = false
					end)
					game:GetService("UserInputService").InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
							if Drop.Visible == true and not indrop and not ind then
								Drop.Visible = false;
								Drop.CanvasPosition = Vector2.new(0, 0)
							end
						end
					end)
					values[tabname][sectorname][text] = Element.value
				elseif type == "Slider" then
					Section.Size = Section.Size + UDim2.new(0, 0, 0, 25)
					local Slider = Instance.new("Frame")
					local TextLabel = Instance.new("TextLabel")
					local Button = Instance.new("TextButton")
					local Frame = Instance.new("Frame")
					local UIGradient = Instance.new("UIGradient")
					local UIGradient2 = Instance.new("UIGradient")
					local Value = Instance.new("TextLabel")
					Slider.Name = "Slider"
					Slider.Parent = Inner;
					Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Slider.BackgroundTransparency = 1.000;
					Slider.Position = UDim2.new(0, 0, 0.653061211, 0)
					Slider.Size = UDim2.new(1, 0, 0, 25)
					TextLabel.Parent = Slider;
					TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000;
					TextLabel.Position = UDim2.new(0, 32, 0, -2)
					TextLabel.Size = UDim2.new(0, 100, 0, 15)
					TextLabel.Font = Enum.Font.Ubuntu;
					TextLabel.TextStrokeTransparency = 0.000;
					TextLabel.Text = text;
					TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.TextSize = 10.000;
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
					Button.Name = "Button"
					Button.Parent = Slider;
					Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Button.BorderColor3 = Color3.fromRGB(18, 18, 16)
					Button.Position = UDim2.new(0, 30, 0, 15)
					Button.Size = UDim2.new(0, 175, 0, 5)
					Button.AutoButtonColor = false;
					Button.Font = Enum.Font.Ubuntu;
					Button.Text = ""
					Button.TextColor3 = Color3.fromRGB(0, 0, 0)
					Button.TextSize = 10.000;
					UIGradient2.Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0.00, Color3.fromRGB(49, 49, 49)),
						ColorSequenceKeypoint.new(0.50, Color3.fromRGB(42, 42, 42)),
						ColorSequenceKeypoint.new(1.00, Color3.fromRGB(33, 33, 32))
					}
					UIGradient2.Rotation = 90;
					UIGradient2.Parent = Button;
					Frame.Parent = Button;
					Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Frame.BorderSizePixel = 0;
					Frame.Size = UDim2.new(0.5, 0, 1, 0)
					UIGradient.Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0.00, Color3.fromRGB(123, 81, 153)),
						ColorSequenceKeypoint.new(1.00, Color3.fromRGB(77, 39, 109))
					}
					UIGradient.Rotation = 90;
					UIGradient.Parent = Frame;
					Value.Name = "Value"
					Value.Parent = Slider;
					Value.TextStrokeTransparency = 0.000;
					Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Value.BackgroundTransparency = 1.000;
					Value.Position = UDim2.new(0, 30, 0, 15)
					Value.Size = UDim2.new(0, 175, 0, 5)
					Value.Font = Enum.Font.Ubuntu;
					Value.Text = "50"
					Value.TextColor3 = Color3.fromRGB(255, 255, 255)
					Value.TextSize = 10.000;
					local min, max, default = data.min or 0, data.max or 100, data.default or 0;
					Element.value = {
						Slider = default
					}
					function Element:SetValue(value)
						Element.value = value;
						local a;
						if min > 0 then
							a = ((Element.value.Slider - min)) / (max - min)
						else
							a = (Element.value.Slider - min) / (max - min)
						end;
						Value.Text = Element.value.Slider;
						Frame.Size = UDim2.new(a, 0, 1, 0)
						values[tabname][sectorname][text] = Element.value;
						callback(value)
					end;
					local a;
					if min > 0 then
						a = ((Element.value.Slider - min)) / (max - min)
					else
						a = (Element.value.Slider - min) / (max - min)
					end;
					Value.Text = Element.value.Slider;
					Frame.Size = UDim2.new(a, 0, 1, 0)
					values[tabname][sectorname][text] = Element.value;
					local uis = game:GetService("UserInputService")
					local mouse = game.Players.LocalPlayer:GetMouse()
					local val;
					Button.MouseButton1Down:Connect(function()
						Frame.Size = UDim2.new(0, math.clamp(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5)
						val = math.floor((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min)) or 0;
						Value.Text = val;
						Element.value.Slider = val;
						values[tabname][sectorname][text] = Element.value;
						callback(Element.value)
						moveconnection = mouse.Move:Connect(function()
							Frame.Size = UDim2.new(0, math.clamp(mouse.X - Frame.AbsolutePosition.X, 0, 180), 0, 5)
							val = math.floor((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min))
							Value.Text = val;
							Element.value.Slider = val;
							values[tabname][sectorname][text] = Element.value;
							callback(Element.value)
						end)
						releaseconnection = uis.InputEnded:Connect(function(Mouse)
							if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
								Frame.Size = UDim2.new(0, math.clamp(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5)
								val = math.floor((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min))
								values[tabname][sectorname][text] = Element.value;
								callback(Element.value)
								moveconnection:Disconnect()
								releaseconnection:Disconnect()
							end
						end)
					end)
				elseif type == "Button" then
					Section.Size = Section.Size + UDim2.new(0, 0, 0, 24)
					local Button = Instance.new("Frame")
					local Button_2 = Instance.new("TextButton")
					local TextLabel = Instance.new("TextLabel")
					local UIGradient = Instance.new("UIGradient")
					Button.Name = "Button"
					Button.Parent = Inner;
					Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Button.BackgroundTransparency = 1.000;
					Button.Position = UDim2.new(0, 0, 0.236059487, 0)
					Button.Size = UDim2.new(1, 0, 0, 24)
					Button_2.Name = "Button"
					Button_2.Parent = Button;
					Button_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Button_2.BorderColor3 = Color3.fromRGB(18, 18, 16)
					Button_2.Position = UDim2.new(0, 30, 0.5, -9)
					Button_2.Size = UDim2.new(0, 175, 0, 18)
					Button_2.AutoButtonColor = false;
					Button_2.Font = Enum.Font.Ubuntu;
					Button_2.Text = ""
					Button_2.TextColor3 = Color3.fromRGB(0, 0, 0)
					Button_2.TextSize = 10.000;
					UIGradient.Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0.00, Color3.fromRGB(46, 43, 44)),
						ColorSequenceKeypoint.new(1.00, Color3.fromRGB(25, 24, 24))
					}
					UIGradient.Rotation = 90;
					UIGradient.Parent = Button_2;
					TextLabel.Parent = Button_2;
					TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000;
					TextLabel.BorderColor3 = Color3.fromRGB(18, 18, 16)
					TextLabel.Size = UDim2.new(1, 0, 1, 0)
					TextLabel.Font = Enum.Font.Ubuntu;
					TextLabel.Text = text;
					TextLabel.TextStrokeTransparency = 0.000;
					TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.TextSize = 10.000;
					function Element:SetValue()
					end;
					Button_2.MouseButton1Down:Connect(function()
						TextLabel.TextColor3 = Color3.fromRGB(97, 59, 227)
						library:Tween(TextLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							TextColor3 = Color3.fromRGB(109, 57, 142)
						})
						callback()
					end)
					Button_2.MouseEnter:Connect(function()
						library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							TextColor3 = Color3.fromRGB(124, 81, 149)
						})
					end)
					Button_2.MouseLeave:Connect(function()
						library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							TextColor3 = Color3.fromRGB(255, 255, 255)
						})
					end)
				end;
				ConfigLoad:Connect(function(cfg)
					pcall(function()
						local fix = library:ConfigFix(cfg)
						if fix[tabname][sectorname][text] ~= nil then
							Element:SetValue(fix[tabname][sectorname][text])
						end
					end)
				end)
				return Element
			end;
			return Sector
		end;
		return Tab
	end;
	floppa.Parent = game.CoreGui;
	return menu
end;
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer;
local PlayerGui = LocalPlayer.PlayerGui;
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera;
local Client = getsenv(LocalPlayer.PlayerGui.Client)
local Crosshairs = PlayerGui.GUI.Crosshairs;
local Crosshair = PlayerGui.GUI.Crosshairs.Crosshair;
local oldcreatebullethole = Client.createbullethole;
local LGlove, RGlove, LSleeve, RSleeve, RArm, LArm;
local WeaponObj = {}
local SelfObj = {}
local Viewmodels = ReplicatedStorage.Viewmodels;
local Weapons = ReplicatedStorage.Weapons;
local ViewmodelOffset = CFrame.new(0, 0, 0)
local Smokes = {}
local Mollies = {}
local RayIgnore = workspace.Ray_Ignore;
local RageTarget;
local GetIcon = require(game.ReplicatedStorage.GetIcon)
local BodyVelocity = Instance.new("BodyVelocity")
BodyVelocity.MaxForce = Vector3.new(math.huge, 0, math.huge)
local Collision = {
	Camera,
	workspace.Ray_Ignore,
	workspace.Debris
}
local FakelagFolder = Instance.new("Folder", workspace)
FakelagFolder.Name = "Fakelag"
local FakeAnim = Instance.new("Animation", workspace)
FakeAnim.AnimationId = "rbxassetid://0"
local Gloves = ReplicatedStorage.Gloves;
if Gloves:FindFirstChild("ImageLabel") then
	Gloves.ImageLabel:Destroy()
end;
local GloveModels = Gloves.Models;
local Multipliers = {
	["Head"] = 4,
	["FakeHead"] = 4,
	["HeadHB"] = 4,
	["UpperTorso"] = 1,
	["LowerTorso"] = 1.25,
	["LeftUpperArm"] = 1,
	["LeftLowerArm"] = 1,
	["LeftHand"] = 1,
	["RightUpperArm"] = 1,
	["RightLowerArm"] = 1,
	["RightHand"] = 1,
	["LeftUpperLeg"] = 0.75,
	["LeftLowerLeg"] = 0.75,
	["LeftFoot"] = 0.75,
	["RightUpperLeg"] = 0.75,
	["RightLowerLeg"] = 0.75,
	["RightFoot"] = 0.75
}
local ChamItems = {}
local Skyboxes = {
	["nebula"] = {
		SkyboxLf = "rbxassetid://159454286",
		SkyboxBk = "rbxassetid://159454299",
		SkyboxDn = "rbxassetid://159454296",
		SkyboxFt = "rbxassetid://159454293",
		SkyboxLf = "rbxassetid://159454286",
		SkyboxRt = "rbxassetid://159454300",
		SkyboxUp = "rbxassetid://159454288"
	},
	["pink vision"] = {
		["SkyboxBk"] = "http://www.roblox.com/asset/?id=6593929026",
		["SkyboxDn"] = "http://www.roblox.com/asset/?id=6593930140",
		["SkyboxFt"] = "http://www.roblox.com/asset/?id=6593931249",
		["SkyboxLf"] = "http://www.roblox.com/asset/?id=6593932587",
		["SkyboxRt"] = "http://www.roblox.com/asset/?id=6593933789",
		["SkyboxUp"] = "http://www.roblox.com/asset/?id=6593935319"
	},
	["vaporwave"] = {
		SkyboxLf = "rbxassetid://1417494402",
		SkyboxBk = "rbxassetid://1417494030",
		SkyboxDn = "rbxassetid://1417494146",
		SkyboxFt = "rbxassetid://1417494253",
		SkyboxLf = "rbxassetid://1417494402",
		SkyboxRt = "rbxassetid://1417494499",
		SkyboxUp = "rbxassetid://1417494643"
	},
	["clouds"] = {
		SkyboxLf = "rbxassetid://570557620",
		SkyboxBk = "rbxassetid://570557514",
		SkyboxDn = "rbxassetid://570557775",
		SkyboxFt = "rbxassetid://570557559",
		SkyboxLf = "rbxassetid://570557620",
		SkyboxRt = "rbxassetid://570557672",
		SkyboxUp = "rbxassetid://570557727"
	},
	["twilight"] = {
		SkyboxLf = "rbxassetid://264909758",
		SkyboxBk = "rbxassetid://264908339",
		SkyboxDn = "rbxassetid://264907909",
		SkyboxFt = "rbxassetid://264909420",
		SkyboxLf = "rbxassetid://264909758",
		SkyboxRt = "rbxassetid://264908886",
		SkyboxUp = "rbxassetid://264907379"
	}
}
local NewScope;
do
	local ScreenGui = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local Frame_2 = Instance.new("Frame")
	ScreenGui.Enabled = false;
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global;
	ScreenGui.IgnoreGuiInset = true;
	Frame.Parent = ScreenGui;
	Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0;
	Frame.Position = UDim2.new(0, 0, 0.5, 0)
	Frame.Size = UDim2.new(1, 0, 0, 1)
	Frame_2.Parent = ScreenGui;
	Frame_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Frame_2.BorderSizePixel = 0;
	Frame_2.Position = UDim2.new(0.5, 0, 0, 0)
	Frame_2.Size = UDim2.new(0, 1, 1, 0)
	ScreenGui.Parent = game.CoreGui;
	NewScope = ScreenGui
end;
local oldSkybox;
local function VectorRGB(RGB)
	return Vector3.new(RGB.R, RGB.G, RGB.B)
end;
local function new(name, prop)
	local obj = Instance.new(name)
	for i, v in pairs(prop) do
		if i ~= "Parent" then
			obj[i] = v
		end
	end;
	if prop["Parent"] ~= nil then
		obj.Parent = prop["Parent"]
	end
end;
local function UpdateAccessory(Accessory)
	Accessory.Material = values.visuals.effects["accessory material"].Dropdown == "Smooth" and "SmoothPlastic" or "ForceField"
	Accessory.Mesh.VertexColor = VectorRGB(values.visuals.effects["accessory chams"].Color)
	Accessory.Color = values.visuals.effects["accessory chams"].Color;
	Accessory.Transparency = values.visuals.effects["accessory chams"].Transparency;
	if values.visuals.effects["accessory material"].Dropdown ~= "ForceField" then
		Accessory.Mesh.TextureId = ""
	else
		Accessory.Mesh.TextureId = Accessory.StringValue.Value
	end
end;
local function ReverseAccessory(Accessory)
	Accessory.Material = "SmoothPlastic"
	Accessory.Mesh.VertexColor = Vector3.new(1, 1, 1)
	Accessory.Mesh.TextureId = Accessory.StringValue.Value;
	Accessory.Transparency = 0
end;
local function UpdateWeapon(obj)
	local selected = values.visuals.effects["weapon material"].Dropdown;
	if obj:IsA("MeshPart") then
		obj.TextureID = ""
	end;
	if obj:IsA("Part") and obj:FindFirstChild("Mesh") and not obj:IsA("BlockMesh") then
		obj.Mesh.VertexColor = VectorRGB(values.visuals.effects["weapon chams"].Color)
		if selected == "Smooth" or selected == "Glass" then
			obj.Mesh.TextureId = ""
		else
			pcall(function()
				obj.Mesh.TextureId = obj.Mesh.OriginalTexture.Value;
				obj.Mesh.TextureID = obj.Mesh.OriginalTexture.Value
			end)
		end
	end;
	obj.Color = values.visuals.effects["weapon chams"].Color;
	obj.Material = selected == "Smooth" and "SmoothPlastic" or selected == "Flat" and "Neon" or selected == "ForceField" and "ForceField" or "Glass"
	obj.Reflectance = values.visuals.effects["reflectance"].Slider / 10;
	obj.Transparency = values.visuals.effects["weapon chams"].Transparency
end;
local Skins = ReplicatedStorage.Skins;
local function MapSkin(Gun, Skin, CustomSkin)
	if CustomSkin ~= nil then
		for _, Data in pairs(CustomSkin) do
			local Obj = Camera.Arms:FindFirstChild(Data.Name)
			if Obj ~= nil and Obj.Transparency ~= 1 then
				Obj.TextureId = Data.Value
			end
		end
	else
		local SkinData = Skins:FindFirstChild(Gun):FindFirstChild(Skin)
		if not SkinData:FindFirstChild("Animated") then
			for _, Data in pairs(SkinData:GetChildren()) do
				local Obj = Camera.Arms:FindFirstChild(Data.Name)
				if Obj ~= nil and Obj.Transparency ~= 1 then
					if Obj:FindFirstChild("Mesh") then
						Obj.Mesh.TextureId = v.Value
					elseif not Obj:FindFirstChild("Mesh") then
						Obj.TextureID = Data.Value
					end
				end
			end
		end
	end
end;
local function ChangeCharacter(NewCharacter)
	for _, Part in pairs(LocalPlayer.Character:GetChildren()) do
		if Part:IsA("Accessory") then
			Part:Destroy()
		end;
		if Part:IsA("BasePart") then
			if NewCharacter:FindFirstChild(Part.Name) then
				Part.Color = NewCharacter:FindFirstChild(Part.Name).Color;
				Part.Transparency = NewCharacter:FindFirstChild(Part.Name).Transparency
			end;
			if Part.Name == "FakeHead" then
				Part.Color = NewCharacter:FindFirstChild("Head").Color;
				Part.Transparency = NewCharacter:FindFirstChild("Head").Transparency
			end
		end;
		if (Part.Name == "Head" or Part.Name == "FakeHead") and Part:FindFirstChildOfClass("Decal") and NewCharacter.Head:FindFirstChildOfClass("Decal") then
			Part:FindFirstChildOfClass("Decal").Texture = NewCharacter.Head:FindFirstChildOfClass("Decal").Texture
		end
	end;
	if NewCharacter:FindFirstChildOfClass("Shirt") then
		if LocalPlayer.Character:FindFirstChildOfClass("Shirt") then
			LocalPlayer.Character:FindFirstChildOfClass("Shirt"):Destroy()
		end;
		local Clone = NewCharacter:FindFirstChildOfClass("Shirt"):Clone()
		Clone.Parent = LocalPlayer.Character
	end;
	if NewCharacter:FindFirstChildOfClass("Pants") then
		if LocalPlayer.Character:FindFirstChildOfClass("Pants") then
			LocalPlayer.Character:FindFirstChildOfClass("Pants"):Destroy()
		end;
		local Clone = NewCharacter:FindFirstChildOfClass("Pants"):Clone()
		Clone.Parent = LocalPlayer.Character
	end;
	for _, Part in pairs(NewCharacter:GetChildren()) do
		if Part:IsA("Accessory") then
			local Clone = Part:Clone()
			for _, Weld in pairs(Clone.Handle:GetChildren()) do
				if Weld:IsA("Weld") and Weld.Part1 ~= nil then
					Weld.Part1 = LocalPlayer.Character[Weld.Part1.Name]
				end
			end;
			Clone.Parent = LocalPlayer.Character
		end
	end;
	if LocalPlayer.Character:FindFirstChildOfClass("Shirt") then
		local String = Instance.new("StringValue")
		String.Name = "OriginalTexture"
		String.Value = LocalPlayer.Character:FindFirstChildOfClass("Shirt").ShirtTemplate;
		String.Parent = LocalPlayer.Character:FindFirstChildOfClass("Shirt")
		if table.find(values.visuals.effects.removals.Jumbobox, "clothes") then
			LocalPlayer.Character:FindFirstChildOfClass("Shirt").ShirtTemplate = ""
		end
	end;
	if LocalPlayer.Character:FindFirstChildOfClass("Pants") then
		local String = Instance.new("StringValue")
		String.Name = "OriginalTexture"
		String.Value = LocalPlayer.Character:FindFirstChildOfClass("Pants").PantsTemplate;
		String.Parent = LocalPlayer.Character:FindFirstChildOfClass("Pants")
		if table.find(values.visuals.effects.removals.Jumbobox, "clothes") then
			LocalPlayer.Character:FindFirstChildOfClass("Pants").PantsTemplate = ""
		end
	end;
	for i, v in pairs(LocalPlayer.Character:GetChildren()) do
		if v:IsA("BasePart") and v.Transparency ~= 1 then
			table.insert(SelfObj, v)
			local Color = Instance.new("Color3Value")
			Color.Name = "OriginalColor"
			Color.Value = v.Color;
			Color.Parent = v;
			local String = Instance.new("StringValue")
			String.Name = "OriginalMaterial"
			String.Value = v.Material.Name;
			String.Parent = v
		elseif v:IsA("Accessory") and v.Handle.Transparency ~= 1 then
			table.insert(SelfObj, v.Handle)
			local Color = Instance.new("Color3Value")
			Color.Name = "OriginalColor"
			Color.Value = v.Handle.Color;
			Color.Parent = v.Handle;
			local String = Instance.new("StringValue")
			String.Name = "OriginalMaterial"
			String.Value = v.Handle.Material.Name;
			String.Parent = v.Handle
		end
	end
end;
local function GetDeg(pos1, pos2)
	local start = pos1.LookVector;
	local vector = CFrame.new(pos1.Position, pos2).LookVector;
	local angle = math.acos(start:Dot(vector))
	local deg = math.deg(angle)
	return deg
end;
local Ping = game.Stats.PerformanceStats.Ping:GetValue()
for i, v in pairs(Viewmodels:GetChildren()) do
	if v:FindFirstChild("HumanoidRootPart") and v.HumanoidRootPart.Transparency ~= 1 then
		v.HumanoidRootPart.Transparency = 1
	end
end;
local Models = game:GetObjects("rbxassetid://6708336356")[1]
repeat
	wait()
until Models ~= nil;
local ChrModels = game:GetObjects("rbxassetid://7265740528")[1]
repeat
	wait()
until ChrModels ~= nil;
local AllKnives = {
	"CT Knife",
	"T Knife",
	"Banana",
	"Bayonet",
	"Bearded Axe",
	"Butterfly Knife",
	"Cleaver",
	"Crowbar",
	"Falchion Knife",
	"Flip Knife",
	"Gut Knife",
	"Huntsman Knife",
	"Karambit",
	"Sickle"
}
local AllGloves = {}
for _, fldr in pairs(Gloves:GetChildren()) do
	if fldr ~= GloveModels and fldr.Name ~= "Racer" then
		AllGloves[fldr.Name] = {}
		for _2, modl in pairs(fldr:GetChildren()) do
			table.insert(AllGloves[fldr.Name], modl.Name)
		end
	end
end;
for i, v in pairs(Models.Knives:GetChildren()) do
	table.insert(AllKnives, v.Name)
end;
local AllSkins = {}
local AllWeapons = {}
local AllCharacters = {}
for i, v in pairs(ChrModels:GetChildren()) do
	table.insert(AllCharacters, v.Name)
end;
for i, v in pairs(Skins:GetChildren()) do
	table.insert(AllWeapons, v.Name)
end;
table.sort(AllWeapons, function(a, b)
	return a < b
end)
for i, v in ipairs(AllWeapons) do
	AllSkins[v] = {}
	table.insert(AllSkins[v], "Inventory")
	for _, v2 in pairs(Skins[v]:GetChildren()) do
		if not v2:FindFirstChild("Animated") then
			table.insert(AllSkins[v], v2.Name)
		end
	end
end;
local cuteware = {
	"cuteware.xyz",
	"cuteware! cuteware! cuteware! cuteware! cuteware! cuteware! cuteware! cuteware! cuteware! cuteware! cuteware! cuteware!",
	"who? who? who? who? who? who? who? who? who? who? who? who?",
	"1 sit nn 1 sit nn 1 sit nn 1 sit nn 1 sit nn 1 sit nn",
	"sit nn dog",
	"1 sit nn",
	"who?",
	"$$$"
}
local L_140_ = {
	"1 Chronicles 28:20 David also said to Solomon his son, Be strong and courageous and do the work. Do not be afraid or discouraged, for the LORD God, my God is with you. He will not fail you or forsake you until all the work for the service of the temple of the LORD is finished.",
	"Ephesians 6:10 Finally, be strong in the Lord and in his mighty power.",
	"saiah 54:4 Do not be afraid; you will not be put to shame. Do not fear disgrace; you will not be humiliated. You will forget the shame of your youth and remember no more the reproach of your widowhood.",
	"John 14:27 Peace I leave with you; my peace I give you. I do not give to you as the world gives. Do not let your hearts be troubled and do not be afraid.",
	"2 Timothy 1:7 For the Spirit God gave us does not make us timid, but gives us power, love, and self-discipline.",
	"1 Corinthians 16:13 Be on your guard; stand firm in the faith; be courageous; be strong.",
	"Mark 5:36 Overhearing what they said, Jesus told him, Don't be afraid; just believe.",
	"John 10:10 The thief comes only to steal and kill and destroy. I came that they may have life and have it abundantly.",
	"Psalm 16:11 You make known to me the path of life, you will fill me with joy in your presence.",
	"29:11 For I know the plans I have for you, 'declares the Lord, 'plans to prosper you and not to harm you, plans to give you hope and a future.",
	"John 3:16 For God so loved the world, that he gave his only Son, that whoever believes in him should not perish but have eternal life.",
	"19:21 Many are the plans in a man's heart, but it is the Lord's purpose that prevails"
}
local L_141_ = {
	"1 by bloxsense.gay",
	"1'd by bloxsense.gay",
	"you just got beamed bloxsense.gay",
	"im sorry thats a 1, bloxsense.gay on top",
	"thats a 1 right there, could not have done it without bloxsense.gay"
}
local L_142_ = {
	"Want to get better? Are you tired of standing while gaming? We represent you the one and only 0.99$ chair, Hurry up! This deal will expire by the next two days.",
	"What's here? What's theres? bro It's just a damn chair.",
	"Today, We represent you the cheapest and the only foldable chair in the world! Costing you 5$ and is sold separately.",
	"Dear santa, What am I getting for christmas? Chairs!",
	"Dear orphans, This chair is the best one that we made yet, Costing you only 12.99$ It also comes with cookies! Buy now! Now available in Pastahook!!",
	"Man I'm done playing this game my legs are tired! Today, We represent you the one and only 2.99$ gaming chair! Hurry up!",
	"God I love Italian cuisines, But my legs are teared apart because I have no chair to sit in! Tired of eating without chairs? Get one in Pastahook!!",
	"Do you love cats? Today we have created a chair with cats! only 1.99$ today! Now in Pastahook!!"
}
makefolder("aristoislua")
local allluas = {}
for _, lua in pairs(listfiles("aristoislua")) do
	local luaname = string.gsub(lua, "aristoislua\\", "")
	table.insert(allluas, luaname)
end;
RunService.RenderStepped:Wait()
local gui = library:New("Voidclient Public")
local legit = gui:Tab("legit")
local rage = gui:Tab("rage")
local visuals = gui:Tab("visuals")
local misc = gui:Tab("misc")
local skins = gui:Tab("skins")
local luas = gui:Tab("luas")
getgenv().api = {}
api.newtab = function(name)
	return gui:Tab(name)
end;
api.newsection = function(tab, name, side)
	return tab:Sector(name, side)
end;
api.newelement = function(section, type, name, data, callback)
	section:Element(type, name, data, callback)
end;
local luascripts = luas:Sector("lua scripts", "Left")
luascripts:Element("Scroll", "lua", {
	options = allluas,
	Amount = 5
})
luascripts:Element("Button", "load", {}, function()
	loadstring(readfile("aristoislua\\" .. values.luas["lua scripts"].lua.Scroll))()
end)
local knife = skins:Sector("knife", "Left")
knife:Element("Toggle", "knife changer")
knife:Element("Scroll", "model", {
	options = AllKnives,
	Amount = 15
})
local glove = skins:Sector("glove", "Left")
glove:Element("Toggle", "glove changer")
glove:Element("ScrollDrop", "model", {
	options = AllGloves,
	Amount = 9
})
local skin = skins:Sector("skins", "Right")
skin:Element("Toggle", "skin changer")
skin:Element("ScrollDrop", "skin", {
	options = AllSkins,
	Amount = 15,
	alphabet = true
})
local characters = skins:Sector("characters", "Right")
characters:Element("Toggle", "character changer", nil, function(tbl)
	if tbl.Toggle then
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Gun") then
			ChangeCharacter(ChrModels:FindFirstChild(values.skins.characters.skin.Scroll))
		end
	end
end)
characters:Element("Scroll", "skin", {
	options = AllCharacters,
	Amount = 9,
	alphabet = true
}, function(tbl)
	if values.skins.characters["character changer"].Toggle then
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Gun") then
			ChangeCharacter(ChrModels:FindFirstChild(tbl.Scroll))
		end
	end
end)
local aimbot = legit:Sector("aimbot", "Left")
aimbot:Element("ToggleKeybind", "aim assist")
aimbot:Element("ToggleKeybind", "silent aim")
aimbot:Element("ToggleKeybind", "triggerbot")
local main = legit:MSector("main", "Left")
local default = main:Tab("default")
local pistol = main:Tab("pistol")
local smg = main:Tab("smg")
local rifle = main:Tab("rifle")
local sniper = main:Tab("sniper")
local function AddLegit(Tab)
	Tab:Element("Jumbobox", "conditions", {
		options = {
			"visible",
			"standing",
			"blind",
			"smoke"
		}
	})
	Tab:Element("Dropdown", "target", {
		options = {
			"crosshair",
			"health",
			"distance"
		}
	})
	Tab:Element("Dropdown", "hitbox", {
		options = {
			"closest",
			"head",
			"chest"
		}
	})
	Tab:Element("Slider", "field of view", {
		min = 30,
		max = 420,
		default = 120
	})
	Tab:Element("Slider", "smoothing", {
		min = 1,
		max = 50,
		default = 1
	})
	Tab:Element("Toggle", "silent aim")
	Tab:Element("Slider", "hitchance", {
		min = 1,
		max = 100,
		default = 100
	})
	Tab:Element("Dropdown", "priority", {
		options = {
			"closest",
			"head",
			"chest"
		}
	})
	Tab:Element("Toggle", "triggerbot")
	Tab:Element("Slider", "delay (ms)", {
		min = 0,
		max = 300,
		default = 200
	})
	Tab:Element("Slider", "minimum dmg", {
		min = 0,
		max = 100,
		default = 15
	})
end;
AddLegit(default)
pistol:Element("Toggle", "override default")
AddLegit(pistol)
smg:Element("Toggle", "override default")
AddLegit(smg)
rifle:Element("Toggle", "override default")
AddLegit(rifle)
sniper:Element("Toggle", "override default")
AddLegit(sniper)
local settings = legit:Sector("settings", "Right")
settings:Element("Toggle", "free for all")
settings:Element("Toggle", "forcefield check")
settings:Element("ToggleColor", "draw fov")
local function IsAlive(plr)
	if plr and plr.Character and plr.Character.FindFirstChild(plr.Character, "Humanoid") and plr.Character.Humanoid.Health > 0 then
		return true
	end;
	return false
end;
local aimbot = rage:Sector("aimbot", "Left")
aimbot:Element("Toggle", "enabled")
aimbot:Element("Dropdown", "origin", {
	options = {
		"character",
		"camera"
	}
})
aimbot:Element("Toggle", "silent aim")
aimbot:Element("Dropdown", "automatic fire", {
	options = {
		"off",
		"standard",
		"Hit"
	}
})
aimbot:Element("Toggle", "automatic penetration")
aimbot:Element("Toggle", "delay shot")
aimbot:Element("Toggle", "gun manipulation")
aimbot:Element("Toggle", "force hit")
aimbot:Element("Toggle", "forward track")
aimbot:Element("Slider", "multiplier", {
	min = 1,
	max = 85,
	default = 25
})
game:GetService("RunService").RenderStepped:Connect(function()
	for i, v in pairs(game:GetService("Players"):GetChildren()) do
		if values.rage.aimbot["forward track"].Toggle then
			if IsAlive(v) and v.Team ~= game.Players.LocalPlayer.Team and v ~= game.Players.LocalPlayer then
				v.Character.Head.Position = v.Character.HumanoidRootPart.Position + v.Character.HumanoidRootPart.Velocity * values.rage.aimbot.multiplier.Slider / 1 / 100
			end
		end
	end
end)
aimbot:Element("Toggle", "old ray method")
aimbot:Element("Dropdown", "prediction", {
	options = {
		"off",
		"performance",
		"old",
		"adaptive"
	}
})
aimbot:Element("Slider", "amount", {
	min = 1,
	max = 100,
	default = 10
})
aimbot:Element("Toggle", "teammates")
aimbot:Element("Toggle", "auto baim")
aimbot:Element("Toggle", "force headshots")
aimbot:Element("Toggle", "compromise shooting point")
aimbot:Element("Slider", "distance", {
	min = 1,
	max = 20,
	default = 5
})
aimbot:Element("Toggle", "knifebot")
aimbot:Element("Toggle", "aura")
aimbot:Element("Toggle", "knifebot on crack")
aimbot:Element("Slider", "melee distance", {
	min = 1,
	max = 250,
	default = 20
})
local weapons = rage:MSector("weapons", "Left")
local default = weapons:Tab("default")
local pistol = weapons:Tab("pistol")
local rifle = weapons:Tab("rifle")
local scout = weapons:Tab("scout")
local awp = weapons:Tab("awp")
local auto = weapons:Tab("auto")
local function AddRage(Tab)
	Tab:Element("Jumbobox", "hitboxes", {
		options = {
			"head",
			"torso",
			"pelvis"
		}
	})
	Tab:Element("Toggle", "prefer body")
	Tab:Element("Slider", "minimum damage", {
		min = 1,
		max = 100,
		default = 20
	})
	Tab:Element("Slider", "max fov", {
		min = 1,
		max = 180,
		default = 180
	})
end;
AddRage(default)
pistol:Element("Toggle", "override default")
AddRage(pistol)
rifle:Element("Toggle", "override default")
AddRage(rifle)
scout:Element("Toggle", "override default")
AddRage(scout)
awp:Element("Toggle", "override default")
AddRage(awp)
auto:Element("Toggle", "override default")
AddRage(auto)
local antiaim = rage:Sector("angles", "Right")
antiaim:Element("Toggle", "enabled")
antiaim:Element("Dropdown", "yaw base", {
	options = {
		"camera",
		"targets",
		"spin",
		"random"
	}
})
antiaim:Element("Slider", "yaw offset", {
	min = -180,
	max = 180,
	default = 0
})
antiaim:Element("Toggle", "jitter")
antiaim:Element("Slider", "jitter offset", {
	min = -180,
	max = 180,
	default = 0
})
antiaim:Element("Dropdown", "pitch", {
	options = {
		"none",
		"up",
		"down",
		"zero",
		"180",
		"random"
	}
})
antiaim:Element("Toggle", "extend pitch")
antiaim:Element("Dropdown", "body roll", {
	options = {
		"off",
		"180"
	}
})
antiaim:Element("Slider", "spin speed", {
	min = 1,
	max = 48,
	default = 4
})
local others = rage:Sector("others", "Right")
others:Element("Toggle", "remove head")
others:Element("Toggle", "no animations")
others:Element("ToggleColor", "hitlogs", nil, function(tbl)
	if tbl.Toggle then
		for i, v in pairs(game:GetService("CoreGui")["MX_ONHIT"].OnHitFrame:GetChildren()) do
			if v:IsA("Frame") then
				v.Grad.BackgroundColor3 = tbl.Color
			end
		end
	else
		for i, v in pairs(game:GetService("CoreGui")["MX_ONHIT"].OnHitFrame:GetChildren()) do
			if v:IsA("Frame") then
				v.Grad.BackgroundColor3 = Color3.fromRGB(172, 208, 255)
			end
		end
	end
end)
others:Element("Dropdown", "leg movement", {
	options = {
		"off",
		"slide"
	}
})
local LagTick = 0;
local fakelag = rage:Sector("fakelag", "Right")
fakelag:Element("Toggle", "enabled", {
	default = {
		Toggle = false
	}
}, function(tbl)
	if tbl.Toggle then
	else
		FakelagFolder:ClearAllChildren()
		game:GetService("NetworkClient"):SetOutgoingKBPSLimit(9e9)
	end
end)
fakelag:Element("Dropdown", "amount", {
	options = {
		"static",
		"dynamic"
	}
})
fakelag:Element("Slider", "limit", {
	min = 1,
	max = 16,
	default = 8
})
fakelag:Element("ToggleColor", "visualize lag", {
	default = {
		Toggle = false,
		Color = Color3.fromRGB(255, 255, 255)
	}
}, function(tbl)
	if tbl.Toggle then
		for _, obj in pairs(FakelagFolder:GetChildren()) do
			obj.Color = tbl.Color
		end
	else
		FakelagFolder:ClearAllChildren()
	end
end)
fakelag:Element("ToggleKeybind", "ping spike")
coroutine.wrap(function()
	while wait(1 / 16) do
		LagTick = math.clamp(LagTick + 1, 0, values.rage.fakelag.limit.Slider)
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("UpperTorso") and values.rage.fakelag.enabled.Toggle then
			if LagTick == (values.rage.fakelag.amount.Dropdown == "static" and values.rage.fakelag.limit.Slider or math.random(1, values.rage.fakelag.limit.Slider)) then
				game:GetService("NetworkClient"):SetOutgoingKBPSLimit(9e9)
				FakelagFolder:ClearAllChildren()
				LagTick = 0;
				if values.rage.fakelag["visualize lag"].Toggle then
					for _, hitbox in pairs(LocalPlayer.Character:GetChildren()) do
						if hitbox:IsA("BasePart") and hitbox.Name ~= "HumanoidRootPart" then
							local part = Instance.new("Part")
							part.CFrame = hitbox.CFrame;
							part.Anchored = true;
							part.CanCollide = false;
							part.Material = Enum.Material.ForceField;
							part.Color = values.rage.fakelag["visualize lag"].Color;
							part.Name = hitbox.Name;
							part.Transparency = 0;
							part.Size = hitbox.Size;
							part.Parent = FakelagFolder
						end
					end
				end
			else
				if values.rage.fakelag.enabled.Toggle then
					game:GetService("NetworkClient"):SetOutgoingKBPSLimit(1)
				end
			end
		else
			FakelagFolder:ClearAllChildren()
			game:GetService("NetworkClient"):SetOutgoingKBPSLimit(9e9)
		end
	end
end)()
local exploits = rage:Sector("exploits", "Left")
exploits:Element("Toggle", "double tap")
exploits:Element("ToggleKeybind", "kill all")
exploits:Element("Toggle", "Hit say")
local tQ = false;
local sQ = getsenv(game:GetService("Players").LocalPlayer.PlayerGui.Client)
local uw = sQ.firebullet;
sQ.firebullet = function(ux, ...)
	local uy = {
		...
	}
	if uy[1] == true or not uy[1] then
		tQ = true
	elseif uy[1] == "dt" and tQ then
		tQ = false
	end;
	if tQ and values.rage.exploits["double tap"].Toggle then
		uw("dt")
	end;
	return uw(ux, unpack(uy))
end;
local players = visuals:Sector("players", "Left")
players:Element("Toggle", "teammates")
players:Element("ToggleColor", "box", {
	default = {
		Color = Color3.fromRGB(255, 255, 255)
	}
})
players:Element("ToggleColor", "name", {
	default = {
		Color = Color3.fromRGB(255, 255, 255)
	}
})
players:Element("Toggle", "health")
players:Element("ToggleColor", "health color", {
	default = {
		Color = Color3.fromRGB(255, 255, 255)
	}
})
players:Element("ToggleColor", "weapon", {
	default = {
		Color = Color3.fromRGB(255, 255, 255)
	}
})
players:Element("ToggleColor", "weapon icon", {
	default = {
		Color = Color3.fromRGB(255, 255, 255)
	}
})
players:Element("Jumbobox", "indicators", {
	options = {
		"armor"
	}
})
players:Element("ToggleColor", "indicator color", {
	default = {
		Color = Color3.fromRGB(255, 255, 255)
	}
})
players:Element("Jumbobox", "outlines", {
	options = {
		"drawings",
		"text"
	},
	default = {
		Jumbobox = {
			"drawings",
			"text"
		}
	}
})
players:Element("Dropdown", "font", {
	options = {
		"Plex",
		"Monospace",
		"System",
		"UI"
	}
})
players:Element("Slider", "size", {
	min = 12,
	max = 16,
	default = 13
})
players:Element("ToggleTrans", "chams", {
	default = {
		Color = Color3.fromRGB(255, 255, 255)
	}
}, function(tbl)
	for _, Player in pairs(Players:GetPlayers()) do
		if Player.Character then
			for _2, Obj in pairs(Player.Character:GetDescendants()) do
				if Obj.Name == "WallCham" then
					if tbl.Toggle then
						if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
							Obj.Visible = true
						else
							Obj.Visible = false
						end
					else
						Obj.Visible = false
					end;
					Obj.Color3 = tbl.Color
				end
			end
		end
	end
end)
local oof = visuals:Sector("out of fov", "Left")
oof:Element("ToggleColor", "enabled", {
	default = {
		Color = Color3.fromRGB(255, 255, 255)
	}
})
oof:Element("Toggle", "filled")
oof:Element("Slider", "offset", {
	min = 50,
	max = 700,
	default = 450
})
oof:Element("Slider", "size", {
	min = 10,
	max = 15,
	default = 15
})
local PlayerDrawings = {}
local Utility = {}
Utility.Settings = {
	Line = {
		Thickness = 1,
		Color = Color3.fromRGB(0, 255, 0)
	},
	Text = {
		Size = 13,
		Center = true,
		Outline = true,
		Font = Drawing.Fonts.Plex,
		Color = Color3.fromRGB(255, 255, 255)
	},
	Square = {
		Thickness = 1,
		Color = Color3.fromRGB(255, 255, 255),
		Filled = false
	},
	Triangle = {
		Color = Color3.fromRGB(255, 255, 255),
		Filled = true,
		Visible = false,
		Thickness = 1
	}
}
function Utility.New(Type, Outline, Name)
	local drawing = Drawing.new(Type)
	for i, v in pairs(Utility.Settings[Type]) do
		drawing[i] = v
	end;
	if Outline then
		drawing.Color = Color3.new(0, 0, 0)
		drawing.Thickness = 3
	end;
	return drawing
end;
function Utility.Add(Player)
	if not PlayerDrawings[Player] then
		PlayerDrawings[Player] = {
			Offscreen = Utility.New("Triangle", nil, "Offscreen"),
			Name = Utility.New("Text", nil, "Name"),
			Tool = Utility.New("Text", nil, "Tool"),
			BoxOutline = Utility.New("Square", true, "BoxOutline"),
			Box = Utility.New("Square", nil, "Box"),
			HealthOutline = Utility.New("Line", true, "HealthOutline"),
			Health = Utility.New("Line", nil, "Health")
		}
	end
end;
for _, Player in pairs(Players:GetPlayers()) do
	if Player ~= LocalPlayer then
		Utility.Add(Player)
	end
end;
Players.PlayerAdded:Connect(Utility.Add)
Players.PlayerRemoving:Connect(function(Player)
	if PlayerDrawings[Player] then
		for i, v in pairs(PlayerDrawings[Player]) do
			if v then
				v:Remove()
			end
		end;
		PlayerDrawings[Player] = nil
	end
end)
game:GetService("RunService").RenderStepped:Connect(function()
	for _, Player in pairs(Players:GetPlayers()) do
		local PlayerDrawing = PlayerDrawings[Player]
		if not PlayerDrawing then
			continue
		end;
		for _, Drawing in pairs(PlayerDrawing) do
			Drawing.Visible = false
		end;
		local Character = Player.Character;
		local RootPart, Humanoid = Character and Character:FindFirstChild("HumanoidRootPart"), Character and Character:FindFirstChildOfClass("Humanoid")
		if not Character or not RootPart or not Humanoid then
			continue
		end;
		local DistanceFromCharacter = (Camera.CFrame.Position - RootPart.Position).Magnitude;
		if 1000 < DistanceFromCharacter then
			continue
		end;
		local Pos, OnScreen = Camera:WorldToViewportPoint(RootPart.Position)
		if not OnScreen then
			if Player.Team == LocalPlayer.Team then
				continue
			end;
			if not values.visuals["out of fov"].enabled.Toggle then
				continue
			end;
			local RootPos = RootPart.Position;
			local CameraVector = Camera.CFrame.Position;
			local LookVector = Camera.CFrame.LookVector;
			local Dot = LookVector:Dot(RootPart.Position - Camera.CFrame.Position)
			if Dot <= 0 then
				RootPos = (CameraVector + ((RootPos - CameraVector) - ((LookVector * Dot) * 1.01)))
			end;
			local ScreenPos, OnScreen = Camera:WorldToScreenPoint(RootPos)
			if not OnScreen then
				local Drawing = PlayerDrawing.Offscreen;
				local FOV = 800 - values.visuals["out of fov"].offset.Slider;
				local Size = values.visuals["out of fov"].size.Slider;
				local Center = (Camera.ViewportSize / 2)
				local Direction = (Vector2.new(ScreenPos.X, ScreenPos.Y) - Center).Unit;
				local Radian = math.atan2(Direction.X, Direction.Y)
				local Angle = (((math.pi * 2) / FOV) * Radian)
				local ClampedPosition = (Center + (Direction * math.min(math.abs(((Center.Y - FOV) / math.sin(Angle)) * FOV), math.abs((Center.X - FOV) / (math.cos(Angle)) / 2))))
				local Point = Vector2.new(math.floor(ClampedPosition.X - (Size / 2)), math.floor((ClampedPosition.Y - (Size / 2) - 15)))
				local function Rotate(point, center, angle)
					angle = math.rad(angle)
					local rotatedX = math.cos(angle) * (point.X - center.X) - math.sin(angle) * (point.Y - center.Y) + center.X;
					local rotatedY = math.sin(angle) * (point.X - center.X) + math.cos(angle) * (point.Y - center.Y) + center.Y;
					return Vector2.new(math.floor(rotatedX), math.floor(rotatedY))
				end;
				local Rotation = math.floor(-math.deg(Radian)) - 47;
				Drawing.PointA = Rotate(Point + Vector2.new(Size, Size), Point, Rotation)
				Drawing.PointB = Rotate(Point + Vector2.new(-Size, -Size), Point, Rotation)
				Drawing.PointC = Rotate(Point + Vector2.new(-Size, Size), Point, Rotation)
				Drawing.Color = values.visuals["out of fov"].enabled.Color;
				Drawing.Filled = values.visuals["out of fov"].filled.Toggle;
				Drawing.Transparency = 1;
				Drawing.Visible = true
			end
		end
	end
end)
players:Element("ToggleTrans", "visible chams", {
	default = {
		Color = Color3.fromRGB(255, 255, 255)
	}
}, function(tbl)
	for _, Player in pairs(Players:GetPlayers()) do
		if Player.Character then
			for _2, Obj in pairs(Player.Character:GetDescendants()) do
				if Obj.Name == "VisibleCham" then
					if tbl.Toggle then
						if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
							Obj.Visible = true
						else
							Obj.Visible = false
						end
					else
						Obj.Visible = false
					end;
					Obj.Color3 = tbl.Color
				end
			end
		end
	end
end)
local effects = visuals:Sector("effects", "Right")
effects:Element("ToggleTrans", "weapon chams", {
	default = {
		Color = Color3.fromRGB(255, 255, 255),
		Transparency = 0
	}
}, function(tbl)
	if WeaponObj == nil then
		return
	end;
	if tbl.Toggle then
		for i, v in pairs(WeaponObj) do
			UpdateWeapon(v)
		end
	else
		for i, v in pairs(WeaponObj) do
			if v:IsA("MeshPart") then
				v.TextureID = v.OriginalTexture.Value
			end;
			if v:IsA("Part") and v:FindFirstChild("Mesh") and not v:IsA("BlockMesh") then
				v.Mesh.TextureId = v.Mesh.OriginalTexture.Value;
				v.Mesh.VertexColor = Vector3.new(1, 1, 1)
			end;
			v.Color = v.OriginalColor.Value;
			v.Material = v.OriginalMaterial.Value;
			v.Transparency = 0
		end
	end
end)
effects:Element("Dropdown", "weapon material", {
	options = {
		"Smooth",
		"Flat",
		"ForceField",
		"Glass"
	}
}, function(tbl)
	if WeaponObj == nil then
		return
	end;
	if values.visuals.effects["weapon chams"].Toggle then
		for i, v in pairs(WeaponObj) do
			UpdateWeapon(v)
		end
	end
end)
effects:Element("Slider", "reflectance", {
	min = 0,
	max = 100,
	default = 0
}, function(tbl)
	if values.visuals.effects["weapon chams"].Toggle then
		for i, v in pairs(WeaponObj) do
			UpdateWeapon(v)
		end
	end
end)
effects:Element("ToggleTrans", "accessory chams", {
	default = {
		Color = Color3.fromRGB(255, 255, 255)
	}
}, function(val)
	if RArm == nil or LArm == nil then
		return
	end;
	if val.Toggle then
		if RGlove ~= nil then
			UpdateAccessory(RGlove)
		end;
		if RSleeve ~= nil then
			UpdateAccessory(RSleeve)
		end;
		if LGlove ~= nil then
			UpdateAccessory(LGlove)
		end;
		if LSleeve ~= nil then
			UpdateAccessory(LSleeve)
		end
	else
		if RGlove then
			ReverseAccessory(RGlove)
		end;
		if LGlove then
			ReverseAccessory(LGlove)
		end;
		if RSleeve then
			ReverseAccessory(RSleeve)
		end;
		if LSleeve then
			ReverseAccessory(LSleeve)
		end
	end
end)
effects:Element("Dropdown", "accessory material", {
	options = {
		"Smooth",
		"ForceField"
	}
}, function(val)
	if RArm == nil or LArm == nil then
		return
	end;
	if values.visuals.effects["accessory chams"].Toggle then
		if RGlove ~= nil then
			UpdateAccessory(RGlove)
		end;
		if RSleeve ~= nil then
			UpdateAccessory(RSleeve)
		end;
		if LGlove ~= nil then
			UpdateAccessory(LGlove)
		end;
		if LSleeve ~= nil then
			UpdateAccessory(LSleeve)
		end
	end
end)
effects:Element("ToggleTrans", "arm chams", {
	default = {
		Color = Color3.fromRGB(255, 255, 255)
	}
}, function(val)
	if RArm == nil then
		return
	end;
	if LArm == nil then
		return
	end;
	if val.Toggle then
		RArm.Color = val.Color;
		LArm.Color = val.Color;
		RArm.Transparency = val.Transparency;
		LArm.Transparency = val.Transparency
	else
		RArm.Color = RArm.Color3Value.Value;
		LArm.Color = RArm.Color3Value.Value;
		RArm.Transparency = 0;
		LArm.Transparency = 0
	end
end)
effects:Element("Dropdown", "arm material", {
	options = {
		"ForceField",
		"Flat",
		"Wood"
	}
})
effects:Element("Jumbobox", "removals", {
	options = {
		"scope",
		"scope lines",
		"flash",
		"smoke",
		"decals",
		"shadows",
		"clothes"
	}
}, function(val)
	local tbl = val.Jumbobox;
	if table.find(tbl, "decals") then
		Client.createbullethole = function()
		end;
		for i, v in pairs(workspace.Debris:GetChildren()) do
			if v.Name == "Bullet" or v.Name == "SurfaceGui" then
				v:Destroy()
			end
		end
	else
		Client.createbullethole = oldcreatebullethole
	end;
	if table.find(tbl, "clothes") then
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("UpperTorso") then
			if LocalPlayer.Character:FindFirstChild("Shirt") then
				LocalPlayer.Character:FindFirstChild("Shirt").ShirtTemplate = ""
			end;
			if LocalPlayer.Character:FindFirstChild("Pants") then
				LocalPlayer.Character:FindFirstChild("Pants").PantsTemplate = ""
			end
		end
	else
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("UpperTorso") then
			if LocalPlayer.Character:FindFirstChild("Shirt") then
				LocalPlayer.Character:FindFirstChild("Shirt").ShirtTemplate = LocalPlayer.Character:FindFirstChild("Shirt").OriginalTexture.Value
			end;
			if LocalPlayer.Character:FindFirstChild("Pants") then
				LocalPlayer.Character:FindFirstChild("Pants").PantsTemplate = LocalPlayer.Character:FindFirstChild("Pants").OriginalTexture.Value
			end
		end
	end;
	if table.find(tbl, "scope") then
		Crosshairs.Scope.ImageTransparency = 1;
		Crosshairs.Scope.Scope.ImageTransparency = 1;
		Crosshairs.Frame1.Transparency = 1;
		Crosshairs.Frame2.Transparency = 1;
		Crosshairs.Frame3.Transparency = 1;
		Crosshairs.Frame4.Transparency = 1
	else
		Crosshairs.Scope.ImageTransparency = 0;
		Crosshairs.Scope.Scope.ImageTransparency = 0;
		Crosshairs.Frame1.Transparency = 0;
		Crosshairs.Frame2.Transparency = 0;
		Crosshairs.Frame3.Transparency = 0;
		Crosshairs.Frame4.Transparency = 0
	end;
	PlayerGui.Blnd.Enabled = not table.find(tbl, "flash") and true or false;
	Lighting.GlobalShadows = not table.find(tbl, "shadows") and true or false;
	if RayIgnore:FindFirstChild("Smokes") then
		if table.find(tbl, "smoke") then
			for i, smoke in pairs(RayIgnore.Smokes:GetChildren()) do
				smoke.ParticleEmitter.Rate = 0
			end
		else
			for i, smoke in pairs(RayIgnore.Smokes:GetChildren()) do
				smoke.ParticleEmitter.Rate = smoke.OriginalRate.Value
			end
		end
	end
end)
effects:Element("Toggle", "hide sleeves")
effects:Element("Toggle", "force crosshair")
effects:Element("ToggleColor", "world color", {
	default = {
		Color = Color3.fromRGB(255, 255, 255)
	}
}, function(val)
	if val.Toggle then
		Camera.ColorCorrection.TintColor = val.Color
	else
		Camera.ColorCorrection.TintColor = Color3.fromRGB(255, 255, 255)
	end
end)
effects:Element("Slider", "Time Changer", {
	min = 1,
	max = 12,
	default = 12
}, function(T)
	game.Lighting.ClockTime = T.Slider
end)
effects:Element("ToggleColor", "Ambience", nil, function(tbl)
	game:GetService("RunService").RenderStepped:Connect(function()
		if not tbl.Toggle then
			game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
			game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
		else
			game.Lighting.Ambient = tbl.Color;
			game.Lighting.OutdoorAmbient = tbl.Color
		end
	end)
end)
effects:Element("Toggle", "Contrast", nil, function()
	local n_ = Instance.new("ColorCorrectionEffect")
	n_.Parent = game.Lighting;
	n_.Name = "xdlmao2"
	while wait() do
		if not values.visuals.effects.Contrast then
			for o0, o1 in pairs(game.Lighting:GetChildren()) do
				if o1:IsA("ColorCorrectionEffect") then
					if o1.Name == "xdlmao2" then
						o1:Destroy()
					end
				end
			end
		else
			for o2, o3 in pairs(game.Lighting:GetChildren()) do
				if o3:IsA("ColorCorrectionEffect") then
					if o3.Name == "xdlmao2" then
						o3.Contrast = values.visuals.effects["Contrast Amount"].Slider / 100
					end
				end
			end
		end
	end
end)
effects:Element("Slider", "Contrast Amount")
effects:Element("Toggle", "Saturation", nil, function(tbl)
	local nP = Instance.new("ColorCorrectionEffect")
	nP.Parent = game.Lighting;
	nP.Name = "xdlmao"
	while wait() do
		if not tbl.Toggle then
			for nQ, nR in pairs(game.Lighting:GetChildren()) do
				if nR:IsA("ColorCorrectionEffect") then
					if nR.Name == "xdlmao" then
						nR:Destroy()
					end
				end
			end
		else
			for nS, nT in pairs(game.Lighting:GetChildren()) do
				if nT:IsA("ColorCorrectionEffect") then
					if nT.Name == "xdlmao" then
						nT.Saturation = values.visuals.effects["Saturation Amount"].Slider / 50 - 0.5
					end
				end
			end
		end
	end
end)
effects:Element("Slider", "Saturation Amount")
effects:Element("ToggleColor", "Fog effects", nil, function(tbl)
	local mR = false;
	local mS = game.Lighting;
	game:GetService("RunService").RenderStepped:Connect(function()
		if not tbl.Toggle then
			mS.FogEnd = 100000000000000000;
			mS.FogStart = 100000000000000000000;
			mS.FogColor = Color3.fromRGB(255, 255, 255)
		else
			mS.FogEnd = 1000;
			mS.FogStart = 0;
			mS.FogColor = tbl.Color
		end
	end)
end)
effects:Element("Toggle", "shadowmap technology", nil, function(val)
	sethiddenproperty(Lighting, "Technology", val.Toggle and "ShadowMap" or "Legacy")
end)
local self = visuals:Sector("self", "Right")
self:Element("ToggleKeybind", "third person", {}, function(tbl)
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
		if tbl.Toggle then
			if tbl.Active then
				LocalPlayer.CameraMaxZoomDistance = values.visuals.self.distance.Slider;
				LocalPlayer.CameraMinZoomDistance = values.visuals.self.distance.Slider;
				LocalPlayer.CameraMaxZoomDistance = values.visuals.self.distance.Slider;
				LocalPlayer.CameraMinZoomDistance = values.visuals.self.distance.Slider
			else
				LocalPlayer.CameraMaxZoomDistance = 0;
				LocalPlayer.CameraMinZoomDistance = 0;
				LocalPlayer.CameraMaxZoomDistance = 0;
				LocalPlayer.CameraMinZoomDistance = 0
			end
		else
			LocalPlayer.CameraMaxZoomDistance = 0;
			LocalPlayer.CameraMinZoomDistance = 0
		end
	end
end)
self:Element("Slider", "distance", {
	min = 6,
	max = 18,
	default = 12
}, function(tbl)
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
		if values.visuals.self["third person"].Toggle then
			if values.visuals.self["third person"].Active then
				LocalPlayer.CameraMaxZoomDistance = tbl.Slider;
				LocalPlayer.CameraMinZoomDistance = tbl.Slider;
				LocalPlayer.CameraMaxZoomDistance = tbl.Slider;
				LocalPlayer.CameraMinZoomDistance = tbl.Slider
			else
				LocalPlayer.CameraMaxZoomDistance = 0;
				LocalPlayer.CameraMinZoomDistance = 0
			end
		else
			LocalPlayer.CameraMaxZoomDistance = 0;
			LocalPlayer.CameraMinZoomDistance = 0
		end
	end
end)
LocalPlayer:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(function(current)
	if values.visuals.self["third person"].Toggle then
		if values.visuals.self["third person"].Active then
			if current ~= values.visuals.self.distance.Slider then
				LocalPlayer.CameraMinZoomDistance = values.visuals.self.distance.Slider
			end
		end
	end
end)
self:Element("Slider", "fov changer", {
	min = 0,
	max = 120,
	default = 80
}, function(value)
	RunService.RenderStepped:Connect(function()
		RunService.RenderStepped:Wait()
		if LocalPlayer.Character == nil then
			return
		end;
		if fov == value.Slider then
			return
		end;
		if values.visuals.self["on scope"].Toggle or not LocalPlayer.Character:FindFirstChild("AIMING") then
			Camera.FieldOfView = value.Slider
		end
	end)
end)
self:Element("Toggle", "visualize silent angle")
self:Element("Slider", "silent angle speed", {
	min = 0,
	max = 10,
	default = 5
})
self:Element("Toggle", "on scope")
self:Element("Toggle", "viewmodel changer")
self:Element("Slider", "viewmodel x", {
	min = -30,
	max = 30
}, function(val)
	ViewmodelOffset = CFrame.new(values.visuals.self["viewmodel x"].Slider / 7, values.visuals.self["viewmodel y"].Slider / 7, values.visuals.self["viewmodel z"].Slider / 7) * CFrame.Angles(0, 0, values.visuals.self.roll.Slider / 50)
end)
self:Element("Slider", "viewmodel y", {
	min = -30,
	max = 30
}, function(val)
	ViewmodelOffset = CFrame.new(values.visuals.self["viewmodel x"].Slider / 7, values.visuals.self["viewmodel y"].Slider / 7, values.visuals.self["viewmodel z"].Slider / 7) * CFrame.Angles(0, 0, values.visuals.self.roll.Slider / 50)
end)
self:Element("Slider", "viewmodel z", {
	min = -30,
	max = 30
}, function(val)
	ViewmodelOffset = CFrame.new(values.visuals.self["viewmodel x"].Slider / 7, values.visuals.self["viewmodel y"].Slider / 7, values.visuals.self["viewmodel z"].Slider / 7) * CFrame.Angles(0, 0, values.visuals.self.roll.Slider / 50)
end)
self:Element("Slider", "roll", {
	min = -100,
	max = 100
}, function(val)
	ViewmodelOffset = CFrame.new(values.visuals.self["viewmodel x"].Slider / 7, values.visuals.self["viewmodel y"].Slider / 7, values.visuals.self["viewmodel z"].Slider / 7) * CFrame.Angles(0, 0, values.visuals.self.roll.Slider / 50)
end)
self:Element("ToggleColor", "self chams", {
	default = {
		Color = Color3.fromRGB(255, 255, 255)
	}
})
self:Element("Slider", "scope blend", {
	min = 0,
	max = 100,
	default = 0
})
local function IsAlive(plr)
	if plr and plr.Character and plr.Character.FindFirstChild(plr.Character, "Humanoid") and plr.Character.Humanoid.Health > 0 then
		return true
	end;
	return false
end;
local LocalPlayer = game:GetService("Players").LocalPlayer;
game:GetService("RunService").RenderStepped:Connect(function()
	if values.visuals.self["self chams"].Toggle and IsAlive(LocalPlayer) then
		for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Material = Enum.Material.ForceField;
				v.Color = values.visuals.self["self chams"].Color;
				if v:IsA("MeshPart") then
					v.TextureID = "rbxassetid://0"
				end;
				if v.Name == "FakeHead" then
					v.Transparency = 1
				elseif v.Name == "Head" then
					v.Transparency = 1
				end
			end
		end
	end
end)
local ads = Client.updateads;
Client.updateads = function(self, ...)
	local args = {
		...
	}
	coroutine.wrap(function()
		wait()
		if LocalPlayer.Character ~= nil then
			for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
				if part:IsA("Part") or part:IsA("MeshPart") then
					if part.Transparency ~= 1 then
						part.Transparency = LocalPlayer.Character:FindFirstChild("AIMING") and values.visuals.self["scope blend"].Slider / 100 or 0
					end
				end;
				if part:IsA("Accessory") then
					part.Handle.Transparency = LocalPlayer.Character:FindFirstChild("AIMING") and values.visuals.self["scope blend"].Slider / 100 or 0
				end
			end
		end
	end)()
	return ads(self, ...)
end;
local world = visuals:Sector("world", "Left")
world:Element("ToggleTrans", "molly radius", {
	default = {
		Color = Color3.fromRGB(255, 0, 0)
	}
}, function(tbl)
	if RayIgnore:FindFirstChild("Fires") == nil then
		return
	end;
	if tbl.Toggle then
		for i, fire in pairs(RayIgnore:FindFirstChild("Fires"):GetChildren()) do
			fire.Transparency = tbl.Transparency;
			fire.Color = tbl.Color
		end
	else
		for i, fire in pairs(RayIgnore:FindFirstChild("Fires"):GetChildren()) do
			fire.Transparency = 1
		end
	end
end)
world:Element("ToggleColor", "smoke radius", {
	default = {
		Color = Color3.fromRGB(0, 255, 0)
	}
}, function(tbl)
	if RayIgnore:FindFirstChild("Smokes") == nil then
		return
	end;
	if tbl.Toggle then
		for i, smoke in pairs(RayIgnore:FindFirstChild("Smokes"):GetChildren()) do
			smoke.Transparency = 0;
			smoke.Color = tbl.Color
		end
	else
		for i, smoke in pairs(RayIgnore:FindFirstChild("Smokes"):GetChildren()) do
			smoke.Transparency = 1
		end
	end
end)
function createbullettracer(te, tf, tg, th)
	local ti = Instance.new("Part", workspace.Debris)
	ti.Size = Vector3.new(0.0001, 0.0001, 0.0001)
	ti.Transparency = 1;
	ti.CanCollide = false;
	ti.CFrame = CFrame.new(te)
	ti.Anchored = true;
	local tj = Instance.new("Attachment", ti)
	local tk = Instance.new("Part", workspace.Debris)
	tk.Size = Vector3.new(0.0001, 0.0001, 0.0001)
	tk.Transparency = 1;
	tk.CanCollide = false;
	tk.CFrame = CFrame.new(tf)
	tk.Anchored = true;
	local tl = Instance.new("Attachment", tk)
	local tm = Instance.new("Beam", ti)
	tm.FaceCamera = true;
	tm.Texture = "rbxassetid://1825953680"
	tm.TextureLength = 18;
	tm.TextureMode = Enum.TextureMode.Static;
	tm.TextureSpeed = -0.2;
	tm.Transparency = NumberSequence.new(0.663, 0)
	tm.Attachment0 = tj;
	tm.Attachment1 = tl;
	tm.LightEmission = 1;
	tm.LightInfluence = 0;
	tm.Segments = 10;
	tm.Color = ColorSequence.new(tg, tg)
	tm.Width0 = 0.125;
	tm.Width1 = 0.125;
	local tn = Instance.new("Beam", ti)
	tn.FaceCamera = true;
	tn.TextureLength = 18;
	tn.TextureMode = Enum.TextureMode.Static;
	tn.TextureSpeed = 0;
	tn.Transparency = NumberSequence.new(0.663, 0)
	tn.Attachment0 = tj;
	tn.Attachment1 = tl;
	tn.LightEmission = 1;
	tn.LightInfluence = 0;
	tn.Segments = 10;
	tn.Color = ColorSequence.new(th, th)
	tn.Width0 = 0.01;
	tn.Width1 = 0.01;
	spawn(function()
		wait(2)
		for to = 1, 100 * 5 do
			wait()
			tn.Transparency = NumberSequence.new(to / (60 * 1), to / (60 * 1))
			tm.Transparency = NumberSequence.new(to / (60 * 1), to / (60 * 1))
		end
	end)
end;
world:Element("ToggleColor", "bullet tracer", {
	default = {
		Color = Color3.fromRGB(255, 255, 255)
	}
})
world:Element("Dropdown", "bullet tracer type", {
	options = {
		"forcefield",
		"bloxsense.gay",
		"lightning"
	}
})
function createforcefieldtracer(te, tf, tg, th)
	local ti = Instance.new("Part", workspace.Debris)
	ti.Size = Vector3.new(0.0001, 0.0001, 0.0001)
	ti.Transparency = 1;
	ti.CanCollide = false;
	ti.CFrame = CFrame.new(te)
	ti.Anchored = true;
	local tj = Instance.new("Attachment", ti)
	local tk = Instance.new("Part", workspace.Debris)
	tk.Size = Vector3.new(0.0001, 0.0001, 0.0001)
	tk.Transparency = 1;
	tk.CanCollide = false;
	tk.CFrame = CFrame.new(tf)
	tk.Anchored = true;
	local tl = Instance.new("Attachment", tk)
	local tm = Instance.new("Beam", ti)
	tm.FaceCamera = true;
	tm.Texture = "ForceField"
	tm.TextureLength = 18;
	tm.TextureMode = Enum.TextureMode.Static;
	tm.TextureSpeed = -0.2;
	tm.Transparency = NumberSequence.new(0.663, 0)
	tm.Attachment0 = tj;
	tm.Attachment1 = tl;
	tm.LightEmission = 1;
	tm.LightInfluence = 0;
	tm.Segments = 10;
	tm.Color = ColorSequence.new(tg, tg)
	tm.Width0 = 0.125;
	tm.Width1 = 0.125;
	local tn = Instance.new("Beam", ti)
	tn.FaceCamera = true;
	tn.TextureLength = 18;
	tn.TextureMode = Enum.TextureMode.Static;
	tn.TextureSpeed = 0;
	tn.Transparency = NumberSequence.new(1, 0)
	tn.Attachment0 = tj;
	tn.Attachment1 = tl;
	tn.LightEmission = 1;
	tn.LightInfluence = 0;
	tn.Segments = 10;
	tn.Color = ColorSequence.new(th, th)
	tn.Width0 = 0.01;
	tn.Width1 = 0.01;
	spawn(function()
		wait(2)
		for to = 1, 100 * 5 do
			wait()
			tn.Transparency = NumberSequence.new(to / (60 * 1), to / (60 * 1))
			tm.Transparency = NumberSequence.new(to / (60 * 1), to / (60 * 1))
		end
	end)
end;
local Other = {
	Camera = workspace.CurrentCamera,
	BeamPart = Instance.new("Part", workspace)
}
Other.BeamPart.Name = "BeamPart"
Other.BeamPart.Transparency = 1;
function circlebeam(v1, v2, v3, v4)
	local colorSequence = ColorSequence.new({
		ColorSequenceKeypoint.new(0, v3),
		ColorSequenceKeypoint.new(1, v4)
	})
	local Part = Instance.new("Part", Other.BeamPart)
	Part.Size = Vector3.new(1, 1, 1)
	Part.Transparency = 1;
	Part.CanCollide = false;
	Part.CFrame = CFrame.new(v1)
	Part.Anchored = true;
	local Attachment = Instance.new("Attachment", Part)
	local Part2 = Instance.new("Part", Other.BeamPart)
	Part2.Size = Vector3.new(1, 1, 1)
	Part2.Transparency = 1;
	Part2.CanCollide = false;
	Part2.CFrame = CFrame.new(v2)
	Part2.Anchored = true;
	Part2.Color = Color3.fromRGB(255, 255, 255)
	local Attachment2 = Instance.new("Attachment", Part2)
	local Beam = Instance.new("Beam", Part)
	Beam.FaceCamera = true;
	Beam.Color = colorSequence;
	Beam.Attachment0 = Attachment;
	Beam.Attachment1 = Attachment2;
	Beam.LightEmission = 1;
	Beam.LightInfluence = 0;
	Beam.Width0 = 0.78;
	Beam.Width1 = 0.6;
	Beam.Texture = "rbxassetid://446111271"
	Beam.LightEmission = 1;
	Beam.LightInfluence = 0;
	Beam.TextureMode = Enum.TextureMode.Wrap;
	Beam.TextureLength = 15;
	Beam.TextureSpeed = 1.4;
	delay(2, function()
		for i = 0.5, 1, 0.02 do
			wait()
			Beam.Transparency = NumberSequence.new(i)
		end;
		Part:Destroy()
		Part2:Destroy()
	end)
end;
local mt = getrawmetatable(game)
local old = mt.__namecall;
local lp = game:GetService("Players").LocalPlayer;
local rs = game:GetService("RunService").RenderStepped;
local lasthittick = tick()
local lifetime = 5;
local L_176_ = getrawmetatable(game)
local L_177_ = L_176_.__namecall;
local L_178_ = L_176_.__index;
local L_179_ = L_176_.__newindex;
setreadonly(L_176_, false)
L_176_.__namecall = function(L_1441_arg0, ...)
	local L_1442_ = tostring(getnamecallmethod())
	local L_1443_ = {
		...
	}
	if L_1442_ == "FireServer" and L_1441_arg0.Name == "Hit" and tick() - lasthittick > 0.005 then
		if values.visuals.world["bullet tracer"].Toggle then
			lasthittick = tick()
			spawn(function()
				local pos;
				if values.visuals.self["third person"].Toggle and values.visuals.self["third person"].Active then
					pos = game:GetService("Players").LocalPlayer.Character.Gun.Flash.CFrame.p
				elseif game.Workspace.Camera:FindFirstChild("Arms") then
					pos = game.Workspace.Camera.Arms.Flash.CFrame.p
				end;
				if values.visuals.world["bullet tracer type"].Dropdown == "forcefield" then
					createforcefieldtracer(pos, L_1443_[2], values.visuals.world["bullet tracer"].Color, values.visuals.world["bullet tracer"].Color)
				elseif values.visuals.world["bullet tracer type"].Dropdown == "bloxsense.gay" then
					createbullettracer(pos, L_1443_[2], values.visuals.world["bullet tracer"].Color, values.visuals.world["bullet tracer"].Color)
				else
					circlebeam(pos, L_1443_[2], values.visuals.world["bullet tracer"].Color, values.visuals.world["bullet tracer"].Color)
				end
			end)
		end
	end;
	return L_177_(L_1441_arg0, unpack(L_1443_))
end;
world:Element("ToggleColor", "impacts", {
	default = {
		Color = Color3.fromRGB(255, 0, 0)
	}
})
world:Element("ToggleColor", "hit chams", {
	default = {
		Color = Color3.fromRGB(0, 0, 255)
	}
})
world:Element("Toggle", "stable hitsounds")
world:Element("Dropdown", "hitsound", {
	options = {
		"Bameware",
		"Bell",
		"Bubble",
		"Pick",
		"Pop",
		"Rust",
		"Skeet",
		"Neverlose",
		"Minecraft",
		"Jowatt"
	}
})
world:Element("Slider", "sound volume", {
	min = 1,
	max = 5,
	default = 3
})
world:Element("Dropdown", "skybox", {
	options = {
		"none",
		"nebula",
		"vaporwave",
		"clouds",
		"pink vision"
	}
}, function(tbl)
	local sky = tbl.Dropdown;
	if sky ~= "none" then
		if Lighting:FindFirstChildOfClass("Sky") then
			Lighting:FindFirstChildOfClass("Sky"):Destroy()
		end;
		local skybox = Instance.new("Sky")
		skybox.SkyboxLf = Skyboxes[sky].SkyboxLf;
		skybox.SkyboxBk = Skyboxes[sky].SkyboxBk;
		skybox.SkyboxDn = Skyboxes[sky].SkyboxDn;
		skybox.SkyboxFt = Skyboxes[sky].SkyboxFt;
		skybox.SkyboxRt = Skyboxes[sky].SkyboxRt;
		skybox.SkyboxUp = Skyboxes[sky].SkyboxUp;
		skybox.Name = "override"
		skybox.Parent = Lighting
	else
		if Lighting:FindFirstChildOfClass("Sky") then
			Lighting:FindFirstChildOfClass("Sky"):Destroy()
		end;
		if oldSkybox ~= nil then
			oldSkybox:Clone().Parent = Lighting
		end
	end
end)
world:Element("ToggleColor", "item esp", {
	default = {
		Color = Color3.fromRGB(255, 255, 255)
	}
}, function(tbl)
	for i, weapon in pairs(workspace.Debris:GetChildren()) do
		if weapon:IsA("BasePart") and Weapons:FindFirstChild(weapon.Name) then
			weapon.BillboardGui.ImageLabel.Visible = tbl.Toggle and table.find(values.visuals.world["types"].Jumbobox, "icon") and true or false
		end
	end
end)
world:Element("Jumbobox", "types", {
	options = {
		"icon"
	}
}, function(tbl)
	for i, weapon in pairs(workspace.Debris:GetChildren()) do
		if weapon:IsA("BasePart") and Weapons:FindFirstChild(weapon.Name) then
			weapon.BillboardGui.ImageLabel.Visible = values.visuals.world["item esp"].Toggle and table.find(tbl.Jumbobox, "icon") and true or false;
			weapon.BillboardGui.ImageLabel.ImageColor3 = values.visuals.world["item esp"].Color
		end
	end
end)
local L_150_ = Instance.new("ScreenGui")
do
	local L_1237_ = Instance.new("Frame")
	local L_1238_ = Instance.new("UIGradient")
	local L_1239_ = Instance.new("Frame")
	local L_1240_ = Instance.new("TextLabel")
	L_150_.Name = "watermark2"
	L_150_.Parent = game.CoreGui;
	L_150_.Enabled = false;
	L_150_.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
	L_1237_.Parent = L_150_;
	L_1237_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	L_1237_.BorderColor3 = Color3.fromRGB(7, 0, 0)
	L_1237_.AutomaticSize = Enum.AutomaticSize.XY;
	L_1237_.Position = UDim2.new(0, 1610, 0, -30)
	L_1237_.Size = UDim2.new(0, 210, 0, 12)
	L_1238_.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0.00, Color3.fromRGB(49, 49, 49)),
		ColorSequenceKeypoint.new(0.41, Color3.fromRGB(25, 25, 25)),
		ColorSequenceKeypoint.new(1.00, Color3.fromRGB(25, 25, 25))
	}
	L_1238_.Rotation = 90;
	L_1238_.Parent = L_1237_;
	L_1239_.Parent = L_1237_;
	L_1239_.AutomaticSize = Enum.AutomaticSize.X;
	L_1239_.BackgroundColor3 = Color3.fromRGB(222, 232, 255)
	L_1239_.BorderSizePixel = 0;
	L_1239_.Size = UDim2.new(0, 248, 0, 1)
	L_1240_.Parent = L_1239_;
	L_1240_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	L_1240_.BackgroundTransparency = 1.000;
	L_1240_.BorderSizePixel = 0;
	L_1240_.Position = UDim2.new(0, 0, 1, 0)
	L_1240_.Size = UDim2.new(0, 1, 0, 20)
	L_1240_.AutomaticSize = Enum.AutomaticSize.XY;
	L_1240_.Font = Enum.Font.Ubuntu;
	L_1240_.Text = ""
	L_1240_.TextColor3 = Color3.fromRGB(255, 255, 255)
	L_1240_.TextSize = 11.000;
	L_1240_.TextStrokeTransparency = 0.000;
	local L_1241_ = "Private Build"
	local function L_1242_func()
		local L_1244_ = Instance.new('LocalScript', L_1240_)
		local L_1245_ = tick()
		game:GetService('RunService').RenderStepped:Connect(function(L_1246_arg0)
			if (tick() - L_1245_) * 1000 > 25 then
				L_1245_ = tick()
				L_1244_.Parent.Text = "   " .. game.Players.LocalPlayer.Name .. "  |  " .. getgenv().User .. "  |  " .. L_1241_ .. "  |  " .. math.floor(1 / L_1246_arg0) .. " fps | " .. math.floor(game:GetService('Stats').Network.ServerStatsItem["Data Ping"]:GetValue()) .. "ms   "
			end
		end)
	end;
	coroutine.wrap(L_1242_func)()
	local function L_1243_func()
		local L_1247_ = Instance.new('LocalScript', L_1237_)
		L_1247_.Parent.Draggable = true;
		L_1247_.Parent.Active = true
	end;
	coroutine.wrap(L_1243_func)()
end;
function library:SetWaterVisible(L_1248_arg0)
	L_150_.Enabled = L_1248_arg0
end;
local configs = misc:Sector("configs", "Left")
configs:Element("TextBox", "config", {
	placeholder = "config name"
})
configs:Element("Button", "save", {}, function()
	if values.misc.configs.config.Text ~= "" then
		library:SaveConfig(values.misc.configs.config.Text)
	end
end)
configs:Element("Button", "load", {}, function()
	if values.misc.configs.config.Text ~= "" then
		ConfigLoad:Fire(values.misc.configs.config.Text)
	end
end)
configs:Element("ToggleColor", "watermark", nil, function(tbl)
	if tbl.Toggle then
		library:SetWaterVisible(tbl.Toggle)
		game:GetService("CoreGui").watermark2.Frame.Frame.BackgroundColor3 = tbl.Color
	else
		L_150_.Enabled = false
	end
end)
configs:Element("ToggleColor", "keybind list", nil, function(tbl)
	game.CoreGui.KeybindList.TextLabel.BorderColor3 = tbl.Color;
	library:SetKeybindVisible(tbl.Toggle)
end)
configs:Element("ToggleColor", "spectators list", {}, function(L_958_arg0)
	if L_958_arg0.Toggle then
		local L_959_ = Instance.new("ScreenGui")
		local L_960_ = Instance.new("Frame")
		local L_961_ = Instance.new("Frame")
		local L_962_ = Instance.new("UIPadding")
		local L_963_ = Instance.new("TextLabel")
		local L_964_ = Instance.new("TextLabel")
		local L_965_ = Instance.new("Frame")
		local L_966_ = Instance.new("UIGradient")
		local L_967_ = Instance.new("Frame")
		local L_968_ = Instance.new("UIGradient")
		L_959_.Parent = game.CoreGui;
		L_959_.Name = "SpectatorsList"
		L_959_.Enabled = false;
		L_960_.Name = "Spectators"
		L_960_.Parent = L_959_;
		L_960_.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		L_960_.BackgroundTransparency = 1.000;
		L_960_.BorderColor3 = Color3.fromRGB(0, 0, 0)
		L_960_.Position = UDim2.new(0, 1, 0.400000006, 49)
		L_960_.Size = UDim2.new(0, 200, 0, 20)
		L_961_.Name = "Container"
		L_961_.Parent = L_960_;
		L_961_.BackgroundTransparency = 1.000;
		L_961_.BorderSizePixel = 1;
		L_961_.Position = UDim2.new(0, 0, 0, 4)
		L_961_.Size = UDim2.new(0, 200, 0, 20)
		L_961_.ZIndex = 3;
		L_962_.Parent = L_961_;
		L_962_.PaddingLeft = UDim.new(0, 4)
		L_963_.Name = "Text"
		L_963_.Parent = L_961_;
		L_963_.BackgroundTransparency = 1.000;
		L_963_.Position = UDim2.new(0, 0, 0, -5.5)
		L_963_.Size = UDim2.new(0, 200, 0, 20)
		L_963_.ZIndex = 4;
		L_963_.Font = Enum.Font.SourceSans;
		L_963_.Text = "spectators"
		L_963_.TextColor3 = Color3.fromRGB(255, 255, 255)
		L_963_.TextSize = 14;
		L_963_.TextStrokeTransparency = 0.000;
		L_964_.Name = "Players"
		L_964_.Parent = L_961_;
		L_964_.BackgroundTransparency = 1.000;
		L_964_.Position = UDim2.new(0.0196080022, 0, 0.79285719, 0)
		L_964_.Size = UDim2.new(0, 200, 0, 20)
		L_964_.ZIndex = 4;
		L_964_.Font = Enum.Font.SourceSans;
		L_964_.Text = "loading.."
		L_964_.TextColor3 = Color3.fromRGB(255, 255, 255)
		L_964_.TextSize = 14.000;
		L_964_.TextStrokeTransparency = 0.000;
		L_964_.TextYAlignment = Enum.TextYAlignment.Top;
		L_965_.Name = "Background"
		L_965_.Parent = L_960_;
		L_965_.BackgroundColor3 = Color3.fromRGB(0, 0, 0, 0)
		L_965_.BorderColor3 = Color3.fromRGB(255, 255, 255)
		L_965_.BorderSizePixel = 1;
		L_965_.Size = UDim2.new(0, 200, 0, 20)
		function GetSpectators()
			local L_970_ = ""
			for L_971_forvar0, L_972_forvar1 in pairs(game.Players:GetChildren()) do
				pcall(function()
					if L_972_forvar1 ~= game.Players.LocalPlayer then
						if not L_972_forvar1.Character then
							if (L_972_forvar1.CameraCF.Value.p - game.Workspace.CurrentCamera.CFrame.p).Magnitude < 10 then
								if L_970_ == "" then
									L_970_ = L_972_forvar1.Name
								else
									L_970_ = L_970_ .. "\n" .. L_972_forvar1.Name
								end
							end
						end
					end
				end)
			end;
			return L_970_
		end;
		spawn(function()
			while wait(0.2) do
				if L_959_.Enabled then
					L_964_.Text = GetSpectators()
				end
			end
		end)
		local function L_969_func()
			local L_973_ = Instance.new('LocalScript', L_960_)
			local L_974_ = L_973_.Parent;
			L_974_.Draggable = false;
			L_974_.Active = true
		end;
		coroutine.wrap(L_969_func)()
		game.CoreGui.SpectatorsList.Enabled = L_958_arg0.Toggle;
		game.CoreGui.SpectatorsList.Spectators.Background.BorderColor3 = L_958_arg0.Color
	else
		game.CoreGui.SpectatorsList.Enabled = false
	end
end)
peektimewait = 0;
local exploits = misc:Sector('exploits', 'Right')
exploits:Element('ToggleKeybind', 'quick peek')
exploits:Element('Slider', 'wbr', {
	min = 1,
	max = 100,
	default = 1
})
exploits:Element('ToggleTrans', 'visualize circle', {
	default = {
		Color = Color3.fromRGB(255, 255, 255)
	}
})
exploits:Element('Toggle', 'unfreeze shoot')
exploits:Element('Dropdown', 'peek method', {
	options = {
		'fhrp',
		'teleport',
		'tween'
	}
})
exploits:Element('Slider', 'tween speed', {
	min = 1,
	max = 100,
	default = 1
})
exploits:Element('Toggle', 'limit peek')
exploits:Element('Slider', 'limit distance', {
	min = 1,
	max = 200,
	default = 10
})
exploits:Element('Toggle', 'time limit')
exploits:Element('Slider', 'time duration', {
	min = 1,
	max = 85,
	default = 5
})
local players = misc:Sector("players", "Right")
local list = {}
function update()
	local value = 0;
	list = {}
	for i, v in pairs(game.Players:GetPlayers()) do
		value = value + 1;
		table.insert(list, v.Name)
	end
	return list
end;
game.Players.PlayerAdded:connect(update)
game.Players.PlayerRemoving:connect(update)
players:Element("Dropdown", "Player", {
	options = update()
})
players:Element("Toggle", "Loop Kill", nil, function()
	if values.misc.players["Loop Kill"].Toggle and LocalPlayer.Character:FindFirstChild("Gun") then
		_G.DisableLoopKill = false;
		local loopkill;
		loopkill = game:GetService("RunService").Heartbeat:Connect(function()
			if _G.DisableLoopKill then
				loopkill:Disconnect()
				return
			end;
			if Players[values.misc.players.Player.Dropdown].Character and Players[values.misc.players.Player.Dropdown].Team ~= LocalPlayer.Team and Players[values.misc.players.Player.Dropdown].Character:FindFirstChild("UpperTorso") and LocalPlayer.Character:FindFirstChild("UpperTorso") then
				local Arguments = {
					[1] = Players[values.misc.players.Player.Dropdown].Character.Head,
					[2] = Players[values.misc.players.Player.Dropdown].Character.Head.Position,
					[3] = Client.gun.Name,
					[4] = 4096,
					[5] = Client.gun,
					[6] = Vector3.new(),
					[7] = Vector3.new(),
					[8] = 10,
					[9] = false,
					[10] = true,
					[11] = Vector3.new(),
					[12] = 16868,
					[13] = Vector3.new()
				}
				for i = 1, 1, 1 do
					game:GetService("ReplicatedStorage").Events.Hit:FireServer(unpack(Arguments))
				end
			end
		end)
	else
		_G.DisableLoopKill = true
	end
end)
players:Element("Button", "Kick Player", nil, function()
	game.ReplicatedStorage.Events.Vote:FireServer(values.misc.players.Player.Dropdown)
end)
local crosshaireditor = misc:Sector("crosshair editor", "Right")
local function UpdateCrosshair()
	if values.misc["crosshair editor"].enabled.Toggle then
		local length = values.misc["crosshair editor"].length.Slider;
		Crosshair.LeftFrame.Size = UDim2.new(0, length, 0, 2)
		Crosshair.RightFrame.Size = UDim2.new(0, length, 0, 2)
		Crosshair.TopFrame.Size = UDim2.new(0, 2, 0, length)
		Crosshair.BottomFrame.Size = UDim2.new(0, 2, 0, length)
		for _, frame in pairs(Crosshair:GetChildren()) do
			if string.find(frame.Name, "Frame") then
				frame.BorderColor3 = Color3.new(0, 0, 0)
				if values.misc["crosshair editor"].border.Toggle then
					frame.BorderSizePixel = 1
				else
					frame.BorderSizePixel = 0
				end
			end
		end
	else
		Crosshair.LeftFrame.Size = UDim2.new(0, 10, 0, 2)
		Crosshair.RightFrame.Size = UDim2.new(0, 10, 0, 2)
		Crosshair.TopFrame.Size = UDim2.new(0, 2, 0, 10)
		Crosshair.BottomFrame.Size = UDim2.new(0, 2, 0, 10)
		for _, frame in pairs(Crosshair:GetChildren()) do
			if string.find(frame.Name, "Frame") then
				frame.BorderSizePixel = 0
			end
		end
	end
end;
crosshaireditor:Element("Toggle", "enabled", nil, UpdateCrosshair)
crosshaireditor:Element("Slider", "length", {
	min = 1,
	max = 15,
	default = 10
}, UpdateCrosshair)
crosshaireditor:Element("Toggle", "border", nil, UpdateCrosshair)
local client = misc:Sector("client", "Right")
client:Element("Toggle", "anti kick", nil, function()
	if values.misc.client["anti kick"].Toggle then
		game.ReplicatedStorage.Events.SendMsg.OnClientEvent:Connect(function(message)
			local msg = string.split(message, " ")
			if game.Players:FindFirstChild(msg[1]) and msg[7] == "1" and msg[12] == game.Players.LocalPlayer.Name then
				game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
			end
		end)
	end
end)
client:Element("Toggle", "old gun sounds", nil, function()
	if values.misc.client["old gun sounds"].Toggle then
		OldGunSounds = game:GetService("RunService").RenderStepped:Connect(function()
			pcall(function()
				local L_1158_ = game:GetService("Players").LocalPlayer.Character;
				if L_1158_.EquippedTool.Value == "AK47" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://1112730119"
				end;
				if L_1158_.EquippedTool.Value == "M4A1" then
					L_1158_.Gun.SShoot.SoundId = "rbxassetid://1665639883"
				end;
				if L_1158_.EquippedTool.Value == "Glock" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://1665635507"
				end;
				if L_1158_.EquippedTool.Value == "M4A1" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://223013951"
				end;
				if L_1158_.EquippedTool.Value == "Galil" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://344800912"
				end;
				if L_1158_.EquippedTool.Value == "USP" then
					L_1158_.Gun.SShoot.SoundId = "rbxassetid://1112952739"
				end;
				if L_1158_.EquippedTool.Value == "USP" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://1665652648"
				end;
				if L_1158_.EquippedTool.Value == "DualBerettas" then
					L_1158_.Gun1.Shoot.SoundId = "rbxassetid://251030881"
					L_1158_.Gun2.Shoot.SoundId = "rbxassetid://251030881"
				end;
				if L_1158_.EquippedTool.Value == "P250" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://340365431"
				end;
				if L_1158_.EquippedTool.Value == "DesertEagle" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://202918645"
				end;
				if L_1158_.EquippedTool.Value == "M249" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://193868290"
				end;
				if L_1158_.EquippedTool.Value == "MP9" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://222888810"
				end;
				if L_1158_.EquippedTool.Value == "MP7-SD" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://2794150850"
				end;
				if L_1158_.EquippedTool.Value == "UMP" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://206953341"
				end;
				if L_1158_.EquippedTool.Value == "P90" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://1665644012"
				end;
				if L_1158_.EquippedTool.Value == "Bizon" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://485606203"
				end;
				if L_1158_.EquippedTool.Value == "Famas" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://206953280"
				end;
				if L_1158_.EquippedTool.Value == "Scout" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://1112858108"
					L_1158_.Gun.Zoom.SoundId = "rbxassetid://2862871544"
					L_1158_.Gun.Zoom.PlaybackSpeed = 1
				end;
				if L_1158_.EquippedTool.Value == "AUG" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://1657593449"
					L_1158_.Gun.Zoom.SoundId = "rbxassetid://297606725"
				end;
				if L_1158_.EquippedTool.Value == "AWP" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://202918637"
					L_1158_.Gun.Zoom.SoundId = "rbxassetid://2862871544"
					L_1158_.Gun.Zoom.PlaybackSpeed = 1
				end;
				if L_1158_.EquippedTool.Value == "G3SG1" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://340365815"
				end;
				if L_1158_.EquippedTool.Value == "MAC10" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://242422782"
				end;
				if L_1158_.EquippedTool.Value == "SawedOff" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://1158047483"
				end;
				if L_1158_.EquippedTool.Value == "CZ" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://458727115"
				end;
				if L_1158_.EquippedTool.Value == "Nova" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://206953213"
				end;
				if L_1158_.EquippedTool.Value == "XM" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://202918888"
				end;
				if L_1158_.EquippedTool.Value == "MAG7" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://395724758"
				end;
				if L_1158_.EquippedTool.Value == "Negev" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://396243767"
				end;
				if L_1158_.EquippedTool.Value == "SG" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://347270113"
				end;
				if L_1158_.EquippedTool.Value == "T Knife" then
					L_1158_.Gun.Shoot1.SoundId = "rbxassetid://1665637464"
					L_1158_.Gun.Shoot2.SoundId = "rbxassetid://1665637740"
				end;
				if L_1158_.EquippedTool.Value == "CT Knife" then
					L_1158_.Gun.Shoot1.SoundId = "rbxassetid://1665637464"
					L_1158_.Gun.Shoot2.SoundId = "rbxassetid://1665637740"
				end;
				if L_1158_.EquippedTool.Value == "M4A4" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://202918741"
				end;
				if L_1158_.EquippedTool.Value == "FiveSevenMoment" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://212374232"
				end;
				if L_1158_.EquippedTool.Value == "FiveSeven" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://212374232"
				end;
				if L_1158_.EquippedTool.Value == "Tec9" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://206953317"
				end;
				if L_1158_.EquippedTool.Value == "P2000" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://263589107"
				end;
				if L_1158_.EquippedTool.Value == "MP7" then
					L_1158_.Gun.Shoot.SoundId = "rbxassetid://2752835613"
				end
			end)
		end)
	else
		OldGunSounds:Disconnect()
	end
end)
client:Element("Toggle", "infinite cash", nil, function(tbl)
	if tbl.Toggle then
		LocalPlayer.Cash.Value = 8000
	end
end)
client:Element("Toggle", "infinite crouch")
client:Element("Jumbobox", "damage bypass", {
	options = {
		"fire",
		"fall"
	}
})
client:Element("Jumbobox", "gun modifiers", {
	options = {
		"recoil",
		"spread",
		"reload",
		"equip",
		"ammo",
		"automatic",
		"penetration",
		"firerate"
	}
})
client:Element("Toggle", "remove killers", {}, function(tbl)
	if tbl.Toggle then
		if workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("Killers") then
			local clone = workspace:FindFirstChild("Map"):FindFirstChild("Killers"):Clone()
			clone.Name = "KillersClone"
			clone.Parent = workspace:FindFirstChild("Map")
			workspace:FindFirstChild("Map"):FindFirstChild("Killers"):Destroy()
		end
	else
		if workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("KillersClone") then
			workspace:FindFirstChild("Map"):FindFirstChild("KillersClone").Name = "Killers"
		end
	end
end)
client:Element("ToggleColor", "hitmarker", {
	default = {
		Color = Color3.fromRGB(255, 255, 255)
	}
})
client:Element("Toggle", "buy any grenade")
client:Element("Toggle", "chat alive")
client:Element("Jumbobox", "shop", {
	options = {
		"inf time",
		"anywhere"
	}
})
client:Element("Toggle", "anti spectate")
local oldgrenadeallowed = Client.grenadeallowed;
Client.grenadeallowed = function(...)
	if values.misc.client["buy any grenade"].Toggle then
		return true
	end;
	return oldgrenadeallowed(...)
end;
local autobuy = misc:Sector("Shop", "Right")
autobuy:Element("Button", "Buy Gun", {}, function(tbl)
	local GunName = values.misc.Shop["Primary Options"].Dropdown;
	local gun;
	for i, v in pairs(getgc()) do
		local raw = rawget(getfenv(v), "script")
		if type(v) == "function" and raw == game:GetService("Players").LocalPlayer.PlayerGui.Client and islclosure(v) and debug.getinfo(v).name == "giveTool" then
			gun = v;
			break
		end
	end;
	if not values.misc.Shop["Prefer on Secondary"].Toggle then
		debug.setupvalue(gun, 8, GunName)
	else
		debug.setupvalue(gun, 7, GunName)
	end
end)
autobuy:Element("Toggle", "Prefer on Secondary")
autobuy:Element("Dropdown", "Primary Options", {
	options = {
		"G3SG1",
		"AWP",
		"M4A4",
		"Scout",
		"AK47",
		"SG"
	}
})
local movement = misc:Sector("movement", "Left")
movement:Element("Toggle", "bunny hop")
movement:Element("Dropdown", "direction", {
	options = {
		"forward",
		"directional",
		"directional 2"
	}
})
movement:Element("Dropdown", "type", {
	options = {
		"gyro",
		"cframe"
	}
})
movement:Element("Slider", "speed", {
	min = 5,
	max = 150,
	default = 40
})
movement:Element("ToggleKeybind", "jump bug")
movement:Element("ToggleKeybind", "edge jump")
movement:Element("ToggleKeybind", "edge bug")
local chat = misc:Sector("chat", "Left")
chat:Element("Toggle", "chat spam", nil, function(L_1208_arg0)
	if L_1208_arg0.Toggle then
		while values.misc.chat["chat spam"].Toggle do
			if values.misc.chat.type.Dropdown == "cuteware" then
				wait(values.misc.chat["speed (ms)"].Slider / 1000)
				local L_1209_ = cuteware[math.random(1, table.getn(cuteware))]
				local L_1210_ = false;
				local L_1211_ = "Innocent"
				local L_1212_ = false;
				local L_1213_ = false;
				local L_1214_ = game:GetService("ReplicatedStorage").Events.PlayerChatted;
				L_1214_:FireServer(L_1209_, L_1210_, L_1211_, L_1212_, L_1213_)
			end;
			if values.misc.chat.type.Dropdown == "Bible Verses" then
				wait(values.misc.chat["speed (ms)"].Slider / 1000)
				local L_1215_ = L_140_[math.random(1, table.getn(L_140_))]
				local L_1216_ = false;
				local L_1217_ = "Innocent"
				local L_1218_ = false;
				local L_1219_ = false;
				local L_1220_ = game:GetService("ReplicatedStorage").Events.PlayerChatted;
				L_1220_:FireServer(L_1215_, L_1216_, L_1217_, L_1218_, L_1219_)
			else
				if values.misc.chat.type.Dropdown == "Standard" then
					wait(values.misc.chat["speed (ms)"].Slider / 1000)
					local L_1221_ = L_142_[math.random(1, table.getn(L_142_))]
					local L_1222_ = false;
					local L_1223_ = "Innocent"
					local L_1224_ = false;
					local L_1225_ = false;
					local L_1226_ = game:GetService("ReplicatedStorage").Events.PlayerChatted;
					L_1226_:FireServer(L_1221_, L_1222_, L_1223_, L_1224_, L_1225_)
				end
			end
		end
	end
end)
chat:Element("Dropdown", "type", {
	options = {
		"Standard",
		"Bible Verses",
		"cuteware"
	}
})
chat:Element("Slider", "speed (ms)", {
	min = 150,
	max = 1000,
	default = 500
})
chat:Element("Toggle", "kill say", {}, function(tbl)
	if not tbl.Toggle then
		EnabledKillSay = false
	else
		EnabledKillSay = true
	end
end)
chat:Element("Dropdown", "Kill Say Type", {
	options = {
		"Standard",
		"Bible Verses",
		"Bloxsense.gay"
	}
})
chat:Element("TextBox", "Text", {
	placeholder = "Custom Killsay text"
})
game.Players.LocalPlayer.Status.Kills:GetPropertyChangedSignal("Value"):Connect(function()
	if EnabledKillSay == true then
		local L_1529_;
		if values.misc.chat["Kill Say Type"].Dropdown == "Standard" then
			L_1529_ = "Fratello, smetti di giocare senza sedia, prendi una sedia decente con pastahook - https://discord.gg/PKJ53Hyvqk"
		elseif values.misc.chat["Kill Say Type"].Dropdown == "Bible Verses" then
			L_1529_ = L_140_[math.random(1, table.getn(L_140_))]
		else
			L_1529_ = L_141_[math.random(1, table.getn(L_141_))]
		end;
		local L_1530_ = false;
		local L_1531_ = "Innocent"
		local L_1532_ = false;
		local L_1533_ = false;
		local L_1534_ = game:GetService("ReplicatedStorage").Events.PlayerChatted;
		L_1534_:FireServer(L_1529_, L_1530_, L_1531_, L_1532_, L_1533_)
	end
end)
chat:Element("Toggle", "no filter")
local grenades = misc:Sector("grenades", "Left")
grenades:Element("ToggleKeybind", "spam grenades")
coroutine.wrap(function()
	while true do
		wait(0.5)
		if values.misc.grenades["spam grenades"].Toggle and values.misc.grenades["spam grenades"].Active then
			local oh1 = game:GetService("ReplicatedStorage").Weapons[values.misc.grenades.grenade.Dropdown].Model;
			local oh3 = 25;
			local oh4 = 35;
			local oh6 = ""
			local oh7 = ""
			game:GetService("ReplicatedStorage").Events.ThrowGrenade:FireServer(oh1, nil, oh3, oh4, Vector3.new(0, -100, 0), oh6, oh7)
		end
	end
end)()
grenades:Element("Dropdown", "grenade", {
	options = {
		"Flashbang",
		"Smoke Grenade",
		"Molotov",
		"HE Grenade",
		"Decoy Grenade"
	}
})
grenades:Element("Button", "crash server", {}, function()
	while RunService.RenderStepped:Wait() do
		for i = 1, 20 do
			pcall(function()
				game:GetService("ReplicatedStorage").Events.DropMag:FireServer(LocalPlayer.Character.Gun.Mag)
			end)
		end
	end
end)
local Dance = Instance.new("Animation")
Dance.AnimationId = "rbxassetid://5917459365"
local LoadedAnim;
local animations = misc:Sector("animations", "Left")
animations:Element("ToggleKeybind", "enabled", nil, function(tbl)
	if not tbl.Toggle or tbl.Toggle and not tbl.Active then
		pcall(function()
			LoadedAnim:Stop()
		end)
	else
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
			LoadedAnim = LocalPlayer.Character.Humanoid:LoadAnimation(Dance)
			LoadedAnim.Priority = Enum.AnimationPriority.Action;
			LoadedAnim:Play()
		end
	end
end)
animations:Element("Dropdown", "animation", {
	options = {
		"floss",
		"default"
	}
}, function(tbl)
	Dance.AnimationId = tbl.Dropdown == "floss" and "rbxassetid://5917459365" or tbl.Dropdown == "default" and "rbxassetid://3732699835"
	pcall(function()
		LoadedAnim:Stop()
	end)
	if values.misc.animations.enabled.Toggle and values.misc.animations.enabled.Active then
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
			LoadedAnim = LocalPlayer.Character.Humanoid:LoadAnimation(Dance)
			LoadedAnim.Priority = Enum.AnimationPriority.Action;
			LoadedAnim:Play()
		end
	end
end)
local objects = {}
local utility = {}
do
	utility.default = {
		Line = {
			Thickness = 0.5,
			Color = Color3.fromRGB(255, 255, 255),
			Visible = false
		},
		Text = {
			Size = 13,
			Center = true,
			Outline = true,
			Font = Drawing.Fonts.Plex,
			Color = Color3.fromRGB(255, 255, 255),
			Visible = false
		},
		Square = {
			Thickness = 1.2,
			Filled = false,
			Color = Color3.fromRGB(255, 255, 255),
			Visible = false
		}
	}
	function utility.create(type, isOutline)
		local drawing = Drawing.new(type)
		for i, v in pairs(utility.default[type]) do
			drawing[i] = v
		end;
		if isOutline then
			drawing.Color = Color3.new(0, 0, 0)
			drawing.Thickness = 3
		end;
		return drawing
	end;
	function utility.add(plr)
		if not objects[plr] then
			objects[plr] = {
				Name = utility.create("Text"),
				Weapon = utility.create("Text"),
				Armor = utility.create("Text"),
				BoxOutline = utility.create("Square", true),
				Box = utility.create("Square"),
				HealthOutline = utility.create("Line", true),
				Health = utility.create("Line")
			}
		end
	end;
	for _, plr in pairs(Players:GetPlayers()) do
		if Player ~= LocalPlayer then
			utility.add(plr)
		end
	end;
	Players.PlayerAdded:Connect(utility.add)
	Players.PlayerRemoving:Connect(function(plr)
		wait()
		if objects[plr] then
			for i, v in pairs(objects[plr]) do
				if type(v) == "userdata" then
					v:Remove()
				end
			end;
			objects[plr] = nil
		end
	end)
end;
local Items = Instance.new("ScreenGui")
Items.Name = "Items"
Items.Parent = game.CoreGui;
Items.ResetOnSpawn = false;
Items.ZIndexBehavior = "Global"
do
	function add(plr)
		local ImageLabel = Instance.new("ImageLabel")
		ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ImageLabel.BackgroundTransparency = 1.000;
		ImageLabel.Size = UDim2.new(0, 62, 0, 25)
		ImageLabel.Visible = false;
		ImageLabel.Image = "rbxassetid://1784884358"
		ImageLabel.ScaleType = Enum.ScaleType.Fit;
		ImageLabel.Name = plr.Name;
		ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		ImageLabel.Parent = Items
	end;
	for _, plr in pairs(Players:GetPlayers()) do
		if Player ~= LocalPlayer then
			add(plr)
		end
	end;
	Players.PlayerAdded:Connect(add)
	Players.PlayerRemoving:Connect(function(plr)
		wait()
		Items[plr.Name]:Destroy()
	end)
end;
local debrisitems = {}
workspace.Debris.ChildAdded:Connect(function(obj)
	if obj:IsA("BasePart") and Weapons:FindFirstChild(obj.Name) then
		RunService.RenderStepped:Wait()
		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.AlwaysOnTop = true;
		BillboardGui.Size = UDim2.new(0, 40, 0, 40)
		BillboardGui.Adornee = obj;
		local ImageLabel = Instance.new("ImageLabel")
		ImageLabel.Parent = BillboardGui;
		ImageLabel.BackgroundTransparency = 1;
		ImageLabel.Size = UDim2.new(1, 0, 1, 0)
		ImageLabel.ImageColor3 = values.visuals.world["item esp"].Color;
		ImageLabel.Image = GetIcon.getWeaponOfKiller(obj.Name)
		ImageLabel.ScaleType = Enum.ScaleType.Fit;
		ImageLabel.Visible = values.visuals.world["item esp"].Toggle and table.find(values.visuals.world["types"].Jumbobox, "icon") and true or false;
		BillboardGui.Parent = obj
	end
end)
for _, obj in pairs(workspace.Debris:GetChildren()) do
	if obj:IsA("BasePart") and Weapons:FindFirstChild(obj.Name) then
		RunService.RenderStepped:Wait()
		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.AlwaysOnTop = true;
		BillboardGui.Size = UDim2.new(0, 40, 0, 40)
		BillboardGui.Adornee = obj;
		local ImageLabel = Instance.new("ImageLabel")
		ImageLabel.Parent = BillboardGui;
		ImageLabel.BackgroundTransparency = 1;
		ImageLabel.Size = UDim2.new(1, 0, 1, 0)
		ImageLabel.ImageColor3 = values.visuals.world["item esp"].Color;
		ImageLabel.Image = GetIcon.getWeaponOfKiller(obj.Name)
		ImageLabel.ScaleType = Enum.ScaleType.Fit;
		ImageLabel.Visible = values.visuals.world["item esp"].Toggle and table.find(values.visuals.world["types"].Jumbobox, "icon") and true or false;
		BillboardGui.Parent = obj
	end
end;
local function YROTATION(cframe)
	local x, y, z = cframe:ToOrientation()
	return CFrame.new(cframe.Position) * CFrame.Angles(0, y, 0)
end;
local function XYROTATION(cframe)
	local x, y, z = cframe:ToOrientation()
	return CFrame.new(cframe.Position) * CFrame.Angles(x, y, 0)
end;
local weps = {
	Pistol = {
		"USP",
		"P2000",
		"Glock",
		"DualBerettas",
		"P250",
		"FiveSeven",
		"Tec9",
		"CZ",
		"DesertEagle",
		"R8"
	},
	SMG = {
		"MP9",
		"MAC10",
		"MP7",
		"UMP",
		"P90",
		"Bizon"
	},
	Rifle = {
		"M4A4",
		"M4A1",
		"AK47",
		"Famas",
		"Galil",
		"AUG",
		"SG"
	},
	Sniper = {
		"AWP",
		"Scout",
		"G3SG1"
	}
}
local weps2 = {
	Pistol = {
		"USP",
		"P2000",
		"Glock",
		"DualBerettas",
		"P250",
		"FiveSeven",
		"Tec9",
		"CZ",
		"DesertEagle",
		"R8"
	},
	SMG = {
		"MP9",
		"MAC10",
		"MP7",
		"UMP",
		"P90",
		"Bizon"
	},
	Rifle = {
		"M4A4",
		"M4A1",
		"AK47",
		"Famas",
		"Galil",
		"AUG",
		"SG"
	},
	Sniper = {
		"AWP",
		"Scout",
		"G3SG1"
	}
}
local function GetWeaponRage(weapon)
	return table.find(weps.Pistol, weapon) and "pistol" or table.find(weps.Rifle, weapon) and "rifle" or weapon == "AWP" and "awp" or weapon == "G3SG1" and "auto" or weapon == "Scout" and "scout" or "default"
end;
local function GetStatsRage(weapon)
	if weapon == "default" then
		return values.rage.weapons.default
	else
		if values.rage.weapons[weapon]["override default"].Toggle then
			return values.rage.weapons[weapon]
		else
			return values.rage.weapons.default
		end
	end
end;
local function GetWeaponLegit(weapon)
	return table.find(weps2.Pistol, weapon) and "pistol" or table.find(weps2.Rifle, weapon) and "rifle" or table.find(weps2.SMG, weapon) and "smg" or table.find(weps2.Sniper, weapon) and "sniper" or "default"
end;
local function GetStatsLegit(weapon)
	if weapon == "default" then
		return values.legit.main.default
	else
		if values.legit.main[weapon]["override default"].Toggle then
			return values.legit.main[weapon]
		else
			return values.legit.main.default
		end
	end
end;
function rapeniggas(Amount)
	if LocalPlayer.Character:FindFirstChild("UpperTorso") and LocalPlayer.Character:FindFirstChild("Gun") then
		for _, Player in pairs(Players:GetPlayers()) do
			if Player.Character and Player.Team ~= LocalPlayer.Team and Player.Character:FindFirstChild("UpperTorso") then
				local oh1 = Player.Character.Head;
				local oh2 = Player.Character.Head.CFrame.p;
				local oh3 = Client.gun.Name;
				local oh4 = 9e9;
				local oh5 = LocalPlayer.Character.Gun;
				local oh8 = math.random(50, 100)
				local oh9 = false;
				local oh10 = true;
				local oh11 = Vector3.new(0, 0, 0)
				local oh12 = 3200000;
				local oh13 = Vector3.new(0, 0, 0)
				for i = 1, Amount do
					game:GetService("ReplicatedStorage").Events.Hit:FireServer(oh1, oh2, oh3, oh4, oh5, oh6, oh7, oh8, oh9, oh10, oh11, oh12, oh13)
				end
			end
		end
	end
end;
local Jitter = false;
local Spin = 0;
allowedtofreeze = true;
local RageTarget;
local Filter = false;
local LastStep;
local TriggerDebounce = false;
local DisableAA = false;
RunService.RenderStepped:Connect(function(step)
	LastStep = step;
	Ping = game.Stats.PerformanceStats.Ping:GetValue()
	RageTarget = nil;
	local CamCFrame = Camera.CFrame;
	local CamLook = CamCFrame.LookVector;
	local PlayerIsAlive = false;
	local Character = LocalPlayer.Character;
	RageTarget = nil;
	Spin = math.clamp(Spin + values.rage.angles["spin speed"].Slider, 0, 360)
	if Spin == 360 then
		Spin = 0
	end;
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and LocalPlayer.Character:FindFirstChild("UpperTorso") then
		PlayerIsAlive = true
	end;
	for i, v in pairs(ChamItems) do
		if v.Parent == nil then
			table.remove(ChamItems, i)
		end
	end;
	if PlayerIsAlive then
		local SelfVelocity = LocalPlayer.Character.HumanoidRootPart.Velocity;
		if values.rage.fakelag["ping spike"].Toggle and values.rage.fakelag["ping spike"].Active then
			for count = 1, 20 do
				game:GetService("ReplicatedStorage").Events.RemoteEvent:FireServer({
					[1] = "createparticle",
					[2] = "bullethole",
					[3] = LocalPlayer.Character.Head,
					[4] = Vector3.new(0, 0, 0)
				})
			end
		end;
		local Root = LocalPlayer.Character.HumanoidRootPart;
		Root = LocalPlayer.Character.HumanoidRootPart;
		frchr = workspace:FindFirstChild('FreezeCharacter2') or workspace:FindFirstChild('FreezeCharacter')
		if frchr and frchr.Size.x >= 5 then
			Root = frchr
		end;
		peektimewait = peektimewait + 1;
		if values.misc.exploits['quick peek'].Toggle and allowedtofreeze then
			if values.misc.exploits['quick peek'].Active then
				if not workspace:FindFirstChild('FreezeCharacter') then
					local part = Instance.new('Part', workspace)
					if values.misc.exploits['peek method'].Dropdown == 'fhrp' then
						part.Size = Vector3.new(15, 1, 15)
					else
						part.Size = Vector3.new(0, 0, 0)
					end;
					part.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
					part.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity;
					part.CanCollide = false;
					part.Transparency = 1;
					part.Name = 'FreezeCharacter'
					local weld = Instance.new('Weld', part)
					weld.Part0 = part;
					weld.Part1 = game.Players.LocalPlayer.Character.HumanoidRootPart;
					local visualize = Instance.new('MeshPart', part)
					visualize.Size = Vector3.new(0.5, 0.2, 0.5)
					visualize.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, -3, 0)
					visualize.CanCollide = false;
					visualize.Anchored = true;
					visualize.MeshId = 'rbxassetid://5536195161'
					visualize.Material = 'Neon'
					visualize.Color = values.misc.exploits['visualize circle'].Color;
					visualize.Name = 'no'
					if values.misc.exploits['visualize circle'].Toggle then
						visualize.Transparency = values.misc.exploits['visualize circle'].Transparency
					else
						visualize.Transparency = 1
					end
				else
					if not freezebusy2 and values.misc.exploits['time limit'].Toggle then
						if peektimewait >= values.misc.exploits['time duration'].Slider then
							peektimewait = 0;
							freezebusy2 = true;
							wait(0.2)
							pcall(function()
								workspace.FreezeCharacter.Size = Vector3.new(0, 0, 0)
								wait(values.misc.exploits['wbr'].Slider / 100)
								workspace.FreezeCharacter:Remove()
							end)
							freezebusy2 = false
						end
					end;
					if not freezebusy1 and values.misc.exploits['limit peek'].Toggle then
						if workspace:FindFirstChild('FreezeCharacter') and (workspace.FreezeCharacter.no.Position - workspace.Camera.Focus.p).Magnitude > values.misc.exploits['limit distance'].Slider then
							freezebusy1 = true;
							wait(0.2)
							pcall(function()
								workspace.FreezeCharacter.Size = Vector3.new(0, 0, 0)
								wait(values.misc.exploits['wbr'].Slider / 100)
								workspace.FreezeCharacter:Remove()
							end)
							freezebusy1 = false
						end
					end
				end
			else
				peektimewait = 0;
				if workspace:FindFirstChild('FreezeCharacter') then
					workspace:FindFirstChild('FreezeCharacter'):Remove()
				end
			end
		else
			peektimewait = 0;
			if workspace:FindFirstChild('FreezeCharacter') then
				workspace:FindFirstChild('FreezeCharacter'):Remove()
			end
		end;
		if values.misc.client["infinite crouch"].Toggle then
			Client.crouchcooldown = 0
		end;
		if table.find(values.misc.client["gun modifiers"].Jumbobox, "firerate") then
			Client.DISABLED = false
		end;
		if values.rage.exploits["kill all"].Toggle and values.rage.exploits["kill all"].Active then
			for i = 1, 2 do
				for i = 1, 2 do
					rapeniggas(i)
					rapeniggas(i)
					rapeniggas(i)
					rapeniggas(i)
				end
			end
		end
		if table.find(values.visuals.effects.removals.Jumbobox, "scope lines") then
			NewScope.Enabled = LocalPlayer.Character:FindFirstChild("AIMING") and true or false;
			Crosshairs.Scope.Visible = false
		else
			NewScope.Enabled = false
		end;
		local RageGuy;
		if workspace:FindFirstChild("Map") and Client.gun ~= "none" and Client.gun.Name ~= "C4" then
			if values.rage.aimbot.enabled.Toggle then
				local Origin;
				if not values.rage.aimbot["compromise shooting point"].Toggle then
					Origin = values.rage.aimbot.origin.Dropdown == "character" and LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 1.4, 0) or CamCFrame.p
				else
					Origin = values.rage.aimbot.origin.Dropdown == "character" and LocalPlayer.Character.HumanoidRootPart.Position + LocalPlayer.Character.HumanoidRootPart.Velocity * values.rage.aimbot.distance.Slider / 1 / 100 or CamCFrame.p
				end;
				local Stats = GetStatsRage(GetWeaponRage(Client.gun.Name))
				for _, Player in pairs(Players:GetPlayers()) do
					if table.find(values.misc.client["gun modifiers"].Jumbobox, "firerate") then
						Client.DISABLED = false
					end;
					if Player.Character and Player.Character:FindFirstChild("Humanoid") and not Client.DISABLED and Player.Character:FindFirstChild("Humanoid").Health > 0 and Player.Team ~= "TTT" and GetDeg(CamCFrame, Player.Character.Head.Position) <= Stats["max fov"].Slider and Player ~= LocalPlayer then
						if Player.Team ~= LocalPlayer.Team or values.rage.aimbot.teammates.Toggle and Player:FindFirstChild("Status") and Player.Status.Team.Value ~= LocalPlayer.Status.Team.Value and Player.Status.Alive.Value then
							if Client.gun:FindFirstChild("Melee") and values.rage.aimbot["knifebot"].Toggle then
								local Ignore = {
									unpack(Collision)
								}
								table.insert(Ignore, workspace.Map.Clips)
								table.insert(Ignore, workspace.Map.SpawnPoints)
								table.insert(Ignore, LocalPlayer.Character)
								table.insert(Ignore, Player.Character.HumanoidRootPart)
								if Player.Character:FindFirstChild("BackC4") then
									table.insert(Ignore, Player.Character.BackC4)
								end;
								if Player.Character:FindFirstChild("Gun") then
									table.insert(Ignore, Player.Character.Gun)
								end;
								if values.rage.aimbot["knifebot on crack"].Toggle then
									Client.DISABLED = false
								end;
								local Ray = Ray.new(Origin, (Player.Character.Head.Position - Origin).unit * values.rage.aimbot["melee distance"].Slider)
								local Hit, Pos = workspace:FindPartOnRayWithIgnoreList(Ray, Ignore, false, true)
								if Hit and Hit.Parent == Player.Character then
									RageGuy = Hit;
									RageTarget = Hit;
									if not values.rage.aimbot["silent aim"].Toggle then
										Camera.CFrame = CFrame.new(CamCFrame.Position, Hit.Position)
									end;
									Filter = true;
									spawn(function()
										wait(0.9)
										Filter = false
									end)
									if not values.rage.aimbot.aura.Toggle then
										local Arguments = {
											[1] = Hit,
											[2] = Hit.Position,
											[3] = Client.gun.Name,
											[4] = 4096,
											[5] = LocalPlayer.Character.Gun,
											[8] = 1,
											[9] = false,
											[10] = false,
											[11] = Vector3.new(),
											[12] = 16868,
											[13] = Vector3.new()
										}
										game.ReplicatedStorage.Events.Hit:FireServer(unpack(Arguments))
									else
										local Arguments = {
											[1] = Hit,
											[2] = Hit.Position,
											[3] = "Flip Knife",
											[4] = 9e9,
											[5] = LocalPlayer.Character.Gun,
											[8] = math.random(1, 10),
											[9] = false,
											[10] = false,
											[11] = Vector3.new(),
											[12] = 16868,
											[13] = Vector3.new()
										}
										for i = 1, 1, 1 do
											game.ReplicatedStorage.Events.Hit:FireServer(unpack(Arguments))
										end
									end
								end
							else
								local Ignore = {
									unpack(Collision)
								}
								table.insert(Ignore, workspace.Map.Clips)
								table.insert(Ignore, workspace.Map.SpawnPoints)
								table.insert(Ignore, LocalPlayer.Character)
								table.insert(Ignore, Player.Character.HumanoidRootPart)
								if Player.Character:FindFirstChild("BackC4") then
									table.insert(Ignore, Player.Character.BackC4)
								end;
								if Player.Character:FindFirstChild("Gun") then
									table.insert(Ignore, Player.Character.Gun)
								end;
								local Hitboxes = {}
								for _, Hitbox in ipairs(Stats.hitboxes.Jumbobox) do
									if Stats["prefer body"].Toggle then
										if Hitbox == "head" and (not values.rage.aimbot["auto baim"].Toggle or Player.Character:FindFirstChild("FakeHead")) then
											table.insert(Hitboxes, Player.Character.Head)
										elseif Hitbox == "torso" then
											table.insert(Hitboxes, Player.Character.UpperTorso)
										else
											table.insert(Hitboxes, Player.Character.LowerTorso)
										end
									else
										if Hitbox == "torso" then
											table.insert(Hitboxes, Player.Character.UpperTorso)
										elseif Hitbox == "pelvis" then
											table.insert(Hitboxes, Player.Character.LowerTorso)
										elseif not values.rage.aimbot["auto baim"].Toggle or Player.Character:FindFirstChild("FakeHead") then
											table.insert(Hitboxes, Player.Character.Head)
										end
									end
								end;
								for _, Hitbox in ipairs(Hitboxes) do
									local Ignore2 = {
										unpack(Ignore)
									}
									local WallbangValue = false;
									for _, Part in pairs(Player.Character:GetChildren()) do
										if Part ~= Hitbox then
											table.insert(Ignore2, Part)
										end
									end;
									if values.rage.aimbot["automatic penetration"].Toggle then
										local Hits = {}
										local EndHit, Hit, Pos;
										local Penetration = Client.gun.Penetration.Value * 0.01;
										local Ray1 = Ray.new(Origin, (Hitbox.Position - Origin).unit * (Hitbox.Position - Origin).magnitude)
										repeat
											Hit, Pos = workspace:FindPartOnRayWithIgnoreList(Ray1, Ignore2, false, true)
											if Hit ~= nil and Hit.Parent ~= nil then
												if Hit and Multipliers[Hit.Name] ~= nil then
													EndHit = Hit
												else
													table.insert(Ignore2, Hit)
													table.insert(Hits, {
														["Position"] = Pos,
														["Hit"] = Hit
													})
												end
											end
										until EndHit ~= nil or #Hits >= 4 or Hit == nil;
										if EndHit ~= nil and Multipliers[EndHit.Name] ~= nil and #Hits <= 4 then
											if #Hits == 0 then
												local Damage = Client.gun.DMG.Value * Multipliers[EndHit.Name]
												if Player:FindFirstChild("Kevlar") then
													if string.find(EndHit.Name, "Head") then
														if Player:FindFirstChild("Helmet") then
															Damage = (Damage / 100) * Client.gun.ArmorPenetration.Value
														end
													else
														Damage = (Damage / 100) * Client.gun.ArmorPenetration.Value
													end
												end;
                                                Damage = Damage * (Client.gun.RangeModifier.Value / 100 ^ ((Origin - EndHit.Position).Magnitude / 500)) / 100;
                                                if not values.rage.aimbot["old ray method"].Toggle then
													Damage = Damage * (Client.gun.RangeModifier.Value / 100 ^ ((Origin - EndHit.Position).Magnitude / 500)) / 100;
												else
													Damage = (Damage / 100) * Client.gun.ArmorPenetration.Value
												end
												if Damage >= Stats["minimum damage"].Slider then
													RageGuy = EndHit;
													RageTarget = EndHit;
													if not values.rage.aimbot["silent aim"].Toggle then
														Camera.CFrame = CFrame.new(CamCFrame.Position, EndHit.Position)
													end;
													Filter = true;
													if values.rage.aimbot["automatic fire"].Dropdown == "standard" then
														Client.firebullet()
														if values.rage.others.hitlogs.Toggle then
															CreateHitElement(" Hit " .. EndHit.Parent.Name .. " in the " .. EndHit.Name .. "  ", Color3.new(1, 1, 1), 1 * 5, 0, 280, 0, 22)
														end;
														if values.rage.exploits["Hit say"].Toggle then
															game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(" Hit " .. EndHit.Parent.Name .. " in the " .. EndHit.Name .. "  ", false, "Innocent", false, true)
														end
													elseif values.rage.aimbot["automatic fire"].Dropdown == "Hit" then
														if values.rage.others.hitlogs.Toggle then
															CreateHitElement(" Hit " .. EndHit.Parent.Name .. " in the " .. EndHit.Name .. "  ", Color3.new(1, 1, 1), 1 * 5, 0, 280, 0, 22)
														end;
														if values.rage.exploits["Hit say"].Toggle then
															game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(" Hit " .. EndHit.Parent.Name .. " in the " .. EndHit.Name .. "  ", false, "Innocent", false, true)
														end;
														Client.firebullet()
														local Arguments = {
															[1] = EndHit,
															[2] = EndHit.Position,
															[3] = LocalPlayer.Character.EquippedTool.Value,
															[4] = 100,
															[5] = LocalPlayer.Character.Gun,
															[8] = 1,
															[9] = false,
															[10] = false,
															[11] = Vector3.new(),
															[12] = 100,
															[13] = Vector3.new()
														}
														game.ReplicatedStorage.Events.Hit:FireServer(unpack(Arguments))
													end;
													Filter = false;
													break
												end
											else
												local penetration = Client.gun.Penetration.Value * 0.01;
												local dont_use_modded_pen = "if move a thing in here then fuck you"
												local limit = 0;
												local dmgmodifier = 1;
												for i = 1, #Hits do
													local data = Hits[i]
													local part = data["Hit"]
													local pos = data["Position"]
													local modifier = 1;
													if part.Material == Enum.Material.DiamondPlate then
														modifier = 3
													end;
													if part.Material == Enum.Material.CorrodedMetal or part.Material == Enum.Material.Metal or part.Material == Enum.Material.Concrete or part.Material == Enum.Material.Brick then
														modifier = 2
													end;
													if part.Name == "Grate" or part.Material == Enum.Material.Wood or part.Material == Enum.Material.WoodPlanks then
														modifier = 0.1
													end;
													if part.Name == "nowallbang" then
														modifier = 100
													end;
													if part:FindFirstChild("PartModifier") then
														modifier = part.PartModifier.Value
													end;
													if part.Transparency == 1 or part.CanCollide == false or part.Name == "Glass" or part.Name == "Cardboard" then
														modifier = 0
													end;
													local direction = (Hitbox.Position - pos).unit * math.clamp(Client.gun.Range.Value, 1, 100)
													local ray = Ray.new(pos + direction * 1, direction * -2)
													local _, endpos = workspace:FindPartOnRayWithWhitelist(ray, {
														part
													}, true)
													local thickness = (endpos - pos).Magnitude;
													thickness = thickness * modifier;
													limit = math.min(penetration, limit + thickness)
													dmgmodifier = 1 - limit / penetration;
													WallbangValue = true
												end;
												local Damage = Client.gun.DMG.Value * Multipliers[EndHit.Name] * dmgmodifier;
												if Player:FindFirstChild("Kevlar") then
													if string.find(EndHit.Name, "Head") then
														if Player:FindFirstChild("Helmet") then
															Damage = (Damage / 100) * Client.gun.ArmorPenetration.Value
														end
													else
														Damage = (Damage / 100) * Client.gun.ArmorPenetration.Value
													end
												end;
												Damage = Damage * (Client.gun.RangeModifier.Value / 100 ^ ((Origin - EndHit.Position).Magnitude / 500)) / 100;
												if Damage >= Stats["minimum damage"].Slider then
													RageGuy = EndHit;
													RageTarget = EndHit;
													if not values.rage.aimbot["silent aim"].Toggle then
														Camera.CFrame = CFrame.new(CamCFrame.Position, EndHit.Position)
													end;
													Filter = true;
													if values.rage.aimbot["automatic fire"].Dropdown == "standard" then
														if values.rage.others.hitlogs.Toggle then
															CreateHitElement(" Hit " .. EndHit.Parent.Name .. " in the " .. EndHit.Name .. "  ", Color3.new(1, 1, 1), 1 * 5, 0, 280, 0, 22)
														end;
														if values.rage.exploits["Hit say"].Toggle then
															game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(" Hit " .. EndHit.Parent.Name .. " in the " .. EndHit.Name .. "  ", false, "Innocent", false, true)
														end;
														Client.firebullet()
													elseif values.rage.aimbot["automatic fire"].Dropdown == "Hit" then
														if values.rage.others.hitlogs.Toggle then
															CreateHitElement(" Hit " .. EndHit.Parent.Name .. " in the " .. EndHit.Name .. "  ", Color3.new(1, 1, 1), 1 * 5, 0, 280, 0, 22)
														end;
														if values.rage.exploits["Hit say"].Toggle then
															game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(" Hit " .. EndHit.Parent.Name .. " in the " .. EndHit.Name .. "  ", false, "Innocent", false, true)
														end;
														Client.firebullet()
														local Arguments = {
															[1] = EndHit,
															[2] = EndHit.Position,
															[3] = LocalPlayer.Character.EquippedTool.Value,
															[4] = 100,
															[5] = LocalPlayer.Character.Gun,
															[8] = 1,
															[9] = false,
															[10] = WallbangValue,
															[11] = Vector3.new(),
															[12] = 100,
															[13] = Vector3.new()
														}
														game.ReplicatedStorage.Events.Hit:FireServer(unpack(Arguments))
													end;
													Filter = false;
													break
												end
											end
										end
									else
										local Ray = Ray.new(Origin, (Hitbox.Position - Origin).unit * (Hitbox.Position - Origin).magnitude)
										local Hit, Pos = workspace:FindPartOnRayWithIgnoreList(Ray, Ignore2, false, true)
										if Hit and Multipliers[Hit.Name] ~= nil then
											local Damage = Client.gun.DMG.Value * Multipliers[Hit.Name]
											if Player:FindFirstChild("Kevlar") then
												if string.find(Hit.Name, "Head") then
													if Player:FindFirstChild("Helmet") then
														Damage = (Damage / 100) * Client.gun.ArmorPenetration.Value
													end
												else
													Damage = (Damage / 100) * Client.gun.ArmorPenetration.Value
												end
											end;
											if Damage >= Stats["minimum damage"].Slider then
												RageGuy = Hit;
												RageTarget = Hit;
												if not values.rage.aimbot["silent aim"].Toggle then
													Camera.CFrame = CFrame.new(CamCFrame.Position, Hit.Position)
												end;
												Filter = true;
												if values.rage.aimbot["automatic fire"].Dropdown == "standard" then
													if values.rage.others.hitlogs.Toggle then
														CreateHitElement(" Hit " .. EndHit.Parent.Name .. " in the " .. EndHit.Name .. "  ", Color3.new(1, 1, 1), 1 * 5, 0, 280, 0, 22)
													end;
													if values.rage.exploits["Hit say"].Toggle then
														game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(" Hit " .. EndHit.Parent.Name .. " in the " .. EndHit.Name .. "  ", false, "Innocent", false, true)
													end;
													Client.firebullet()
												elseif values.rage.aimbot["automatic fire"].Dropdown == "Hit" then
													if values.rage.others.hitlogs.Toggle then
														CreateHitElement(" Hit " .. EndHit.Parent.Name .. " in the " .. EndHit.Name .. "  ", Color3.new(1, 1, 1), 1 * 5, 0, 280, 0, 22)
													end;
													if values.rage.exploits["Hit say"].Toggle then
														game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(" Hit " .. EndHit.Parent.Name .. " in the " .. EndHit.Name .. "  ", false, "Innocent", false, true)
													end;
													Client.firebullet()
													local Arguments = {
														[1] = EndHit,
														[2] = EndHit.Position,
														[3] = LocalPlayer.Character.EquippedTool.Value,
														[4] = 100,
														[5] = LocalPlayer.Character.Gun,
														[8] = 1,
														[9] = false,
														[10] = WallbangValue,
														[11] = Vector3.new(),
														[12] = 100,
														[13] = Vector3.new()
													}
													game.ReplicatedStorage.Events.Hit:FireServer(unpack(Arguments))
												end;
												Filter = false;
												break
											end
										end
									end
								end
							end
						end
					end
				end
			elseif values.legit.aimbot["aim assist"].Toggle and values.legit.aimbot["aim assist"].Active and not library.uiopen then
				local Stats = GetStatsLegit(GetWeaponLegit(Client.gun.Name))
				local Ignore = {
					LocalPlayer.Character,
					Camera,
					workspace.Map.Clips,
					workspace.Map.SpawnPoints,
					workspace.Debris
				}
				local Closest = 9999;
				local Target;
				if not table.find(Stats.conditions.Jumbobox, "smoke") then
					table.insert(Ignore, workspace.Ray_Ignore)
				end;
				if not table.find(Stats.conditions.Jumbobox, "blind") or LocalPlayer.PlayerGui.Blnd.Blind.BackgroundTransparency > 0.9 then
					if not table.find(Stats.conditions.Jumbobox, "standing") or SelfVelocity < 3 then
						for _, Player in pairs(Players:GetPlayers()) do
							if Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character:FindFirstChild("Humanoid").Health > 0 then
								if not values.legit.settings["forcefield check"].Toggle or not Player.Character:FindFirstChildOfClass("ForceField") then
									if Player.Team ~= LocalPlayer.Team or values.legit.settings["free for all"].Toggle then
										local Pos, onScreen = Camera:WorldToViewportPoint(Player.Character.HumanoidRootPart.Position)
										if onScreen then
											local Magnitude = (Vector2.new(Pos.X, Pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude;
											if Magnitude < Stats["field of view"].Slider then
												local Hitbox = Stats.hitbox.Dropdown == "head" and Player.Character.Head or Stats.hitbox.Dropdown == "chest" and Player.Character.UpperTorso;
												if Stats.hitbox.Dropdown == "closest" then
													local HeadPos = Camera:WorldToViewportPoint(Player.Character.Head.Position)
													local TorsoPos = Camera:WorldToViewportPoint(Player.Character.UpperTorso.Position)
													local HeadDistance = (Vector2.new(HeadPos.X, HeadPos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude;
													local TorsoDistance = (Vector2.new(TorsoPos.X, TorsoPos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude;
													if HeadDistance < TorsoDistance then
														Hitbox = Player.Character.Head
													else
														Hitbox = Player.Character.UpperTorso
													end
												end;
												if Hitbox ~= nil then
													if not table.find(Stats.conditions.Jumbobox, "visible") then
														Target = Hitbox
													else
														local Ray1 = Ray.new(Camera.CFrame.Position, (Hitbox.Position - Camera.CFrame.Position).unit * (Hitbox.Position - Camera.CFrame.Position).magnitude)
														local Hit, Pos = workspace:FindPartOnRayWithIgnoreList(Ray1, Ignore, false, true)
														if Hit and Hit:FindFirstAncestor(Player.Name) then
															Target = Hitbox
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end;
				if Target ~= nil then
					local Pos = Camera:WorldToScreenPoint(Target.Position)
					local Magnitude = Vector2.new(Pos.X - Mouse.X, Pos.Y - Mouse.Y)
					mousemoverel(Magnitude.x / Stats.smoothing.Slider, Magnitude.y / Stats.smoothing.Slider)
				end
			end;
			if not values.rage.aimbot.enabled.Toggle and values.legit.aimbot["triggerbot"].Toggle and values.legit.aimbot["triggerbot"].Active and not TriggerDebounce then
				local Stats = GetStatsLegit(GetWeaponLegit(Client.gun.Name))
				if Stats.triggerbot.Toggle then
					if not table.find(Stats.conditions.Jumbobox, "blind") or LocalPlayer.PlayerGui.Blnd.Blind.BackgroundTransparency > 0.9 then
						if not table.find(Stats.conditions.Jumbobox, "standing") or SelfVelocity < 3 then
							if Mouse.Target and Mouse.Target.Parent and Players:GetPlayerFromCharacter(Mouse.Target.Parent) and Multipliers[Mouse.Target.Name] ~= nil and Client.gun.DMG.Value * Multipliers[Mouse.Target.Name] >= Stats["minimum dmg"].Slider then
								local OldTarget = Mouse.Target;
								local Player = Players:GetPlayerFromCharacter(Mouse.Target.Parent)
								if Player.Team ~= LocalPlayer.Team or values.legit.settings["free for all"].Toggle then
									coroutine.wrap(function()
										TriggerDebounce = true;
										wait(Stats["delay (ms)"].Slider / 1000)
										repeat
											RunService.RenderStepped:Wait()
											if not Client.DISABLED then
												Client.firebullet()
											end
										until Mouse.Target == nil or Player ~= Players:GetPlayerFromCharacter(Mouse.Target.Parent)
										TriggerDebounce = false
									end)()
								end
							end
						end
					end
				end
			end
		end;
		BodyVelocity:Destroy()
		BodyVelocity = Instance.new("BodyVelocity")
		BodyVelocity.MaxForce = Vector3.new(300000, 0, 300000)
		if UserInputService:IsKeyDown("Space") and values.misc.movement["bunny hop"].Toggle then
			local add = 0;
			if values.misc.movement.direction.Dropdown == "directional" or values.misc.movement.direction.Dropdown == "directional 2" then
				if UserInputService:IsKeyDown("A") then
					add = 90
				end;
				if UserInputService:IsKeyDown("S") then
					add = 180
				end;
				if UserInputService:IsKeyDown("D") then
					add = 270
				end;
				if UserInputService:IsKeyDown("A") and UserInputService:IsKeyDown("W") then
					add = 45
				end;
				if UserInputService:IsKeyDown("D") and UserInputService:IsKeyDown("W") then
					add = 315
				end;
				if UserInputService:IsKeyDown("D") and UserInputService:IsKeyDown("S") then
					add = 225
				end;
				if UserInputService:IsKeyDown("A") and UserInputService:IsKeyDown("S") then
					add = 145
				end
			end;
			if game.Players.LocalPlayer.Character:FindFirstChild("jumpcd") then
				game.Players.LocalPlayer.Character.jumpcd:Destroy()
			end;
			local rot = YROTATION(CamCFrame) * CFrame.Angles(0, math.rad(add), 0)
			BodyVelocity.Parent = LocalPlayer.Character.UpperTorso;
			LocalPlayer.Character.Humanoid.Jump = true;
			BodyVelocity.Velocity = Vector3.new(rot.LookVector.X, 0, rot.LookVector.Z) * (values.misc.movement["speed"].Slider * 2)
			if add == 0 and values.misc.movement.direction.Dropdown == "directional" and not UserInputService:IsKeyDown("W") then
				BodyVelocity:Destroy()
			else
				if values.misc.movement.type.Dropdown == "cframe" then
					BodyVelocity:Destroy()
					Root.CFrame = Root.CFrame + Vector3.new(rot.LookVector.X, 0, rot.LookVector.Z) * values.misc.movement["speed"].Slider / 15
				end
			end
		end;
		if values.misc.movement["edge jump"].Toggle and values.misc.movement["edge jump"].Active then
			if LocalPlayer.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Freefall and LocalPlayer.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then
				coroutine.wrap(function()
					RunService.RenderStepped:Wait()
					if LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall and LocalPlayer.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then
						LocalPlayer.Character.Humanoid:ChangeState("Jumping")
					end
				end)()
			end
		end;
		Jitter = not Jitter;
		LocalPlayer.Character.Humanoid.AutoRotate = false;
		if values.rage.angles.enabled.Toggle and not DisableAA then
			local Angle = -math.atan2(CamLook.Z, CamLook.X) + math.rad(-90)
			if values.rage.angles["yaw base"].Dropdown == "spin" then
				Angle = Angle + math.rad(Spin)
			end;
			if values.rage.angles["yaw base"].Dropdown == "random" then
				Angle = Angle + math.rad(math.random(0, 360))
			end;
			local Offset = math.rad(-values.rage.angles["yaw offset"].Slider - (values.rage.angles.jitter.Toggle and Jitter and values.rage.angles["jitter offset"].Slider or 0))
			local CFramePos = CFrame.new(Root.Position) * CFrame.Angles(0, Angle + Offset, 0)
			if values.rage.angles["yaw base"].Dropdown == "targets" then
				local part;
				local closest = 9999;
				for _, plr in pairs(Players:GetPlayers()) do
					if plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character:FindFirstChild("Humanoid").Health > 0 and plr.Team ~= LocalPlayer.Team then
						local pos, onScreen = Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
						local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude;
						if closest > magnitude then
							part = plr.Character.HumanoidRootPart;
							closest = magnitude
						end
					end
				end;
				if part ~= nil then
					CFramePos = CFrame.new(Root.Position, part.Position) * CFrame.Angles(0, Offset, 0)
				end
			end;
			Root.CFrame = YROTATION(CFramePos)
			if values.rage.angles["body roll"].Dropdown == "180" then
				Root.CFrame = Root.CFrame * CFrame.Angles(values.rage.angles["body roll"].Dropdown == "180" and math.rad(180) or 0, 1, 0)
				LocalPlayer.Character.Humanoid.HipHeight = 4
			else
				LocalPlayer.Character.Humanoid.HipHeight = 2
			end;
			local Pitch = values.rage.angles["pitch"].Dropdown == "none" and CamLook.Y or values.rage.angles["pitch"].Dropdown == "up" and 1 or values.rage.angles["pitch"].Dropdown == "down" and -1 or values.rage.angles["pitch"].Dropdown == "zero" and 0 or values.rage.angles["pitch"].Dropdown == "random" and math.random(-10, 10) / 10 or 2.5;
			if values.rage.angles["extend pitch"].Toggle and (values.rage.angles["pitch"].Dropdown == "up" or values.rage.angles["pitch"].Dropdown == "down") then
				Pitch = (Pitch * 2) / 1.6
			end;
			game.ReplicatedStorage.Events.ControlTurn:FireServer(Pitch, LocalPlayer.Character:FindFirstChild("Climbing") and true or false)
		else
			LocalPlayer.Character.Humanoid.HipHeight = 2;
			Root.CFrame = CFrame.new(Root.Position) * CFrame.Angles(0, -math.atan2(CamLook.Z, CamLook.X) + math.rad(270), 0)
			game.ReplicatedStorage.Events.ControlTurn:FireServer(CamLook.Y, LocalPlayer.Character:FindFirstChild("Climbing") and true or false)
		end;
		if values.rage.others["remove head"].Toggle then
			if LocalPlayer.Character:FindFirstChild("FakeHead") then
				LocalPlayer.Character.FakeHead:Destroy()
			end;
			if LocalPlayer.Character:FindFirstChild("HeadHB") then
				LocalPlayer.Character.HeadHB:Destroy()
			end
		end;
		if table.find(values.misc.client["gun modifiers"].Jumbobox, "recoil") then
			Client.resetaccuracy()
			Client.RecoilX = 0;
			Client.RecoilY = 0
		end
	else
		pcall(function()
			workspace:FindFirstChild('FreezeCharacter'):Remove()
		end)
	end;
	for _, Player in pairs(Players:GetPlayers()) do
		if Player.Character and Player ~= LocalPlayer and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character.HumanoidRootPart:FindFirstChild("OldPosition") then
			coroutine.wrap(function()
				local Position = Player.Character.HumanoidRootPart.Position;
				RunService.RenderStepped:Wait()
				if Player.Character and Player ~= LocalPlayer and Player.Character:FindFirstChild("HumanoidRootPart") then
					if Player.Character.HumanoidRootPart:FindFirstChild("OldPosition") then
						Player.Character.HumanoidRootPart.OldPosition.Value = Position
					else
						local Value = Instance.new("Vector3Value")
						Value.Name = "OldPosition"
						Value.Value = Position;
						Value.Parent = Player.Character.HumanoidRootPart
					end
				end
			end)()
		end
	end;
	for _, Player in pairs(Players:GetPlayers()) do
		local tbl = objects[Player]
		if tbl == nil then
			return
		end;
		if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Team ~= "TTT" and (Player.Team ~= LocalPlayer.Team or values.visuals.players.teammates.Toggle) and Player.Character:FindFirstChild("Gun") and Player.Character:FindFirstChild("Humanoid") and Player ~= LocalPlayer then
			local HumanoidRootPart = Player.Character.HumanoidRootPart;
			local RootPosition = HumanoidRootPart.Position;
			local Pos, OnScreen = Camera:WorldToViewportPoint(RootPosition)
			local Size = (Camera:WorldToViewportPoint(RootPosition - Vector3.new(0, 3, 0)).Y - Camera:WorldToViewportPoint(RootPosition + Vector3.new(0, 2.6, 0)).Y) / 2;
			local Drawings, Text = table.find(values.visuals.players.outlines.Jumbobox, "drawings") ~= nil, table.find(values.visuals.players.outlines.Jumbobox, "text") ~= nil;
			tbl.Box.Color = values.visuals.players.box.Color;
			tbl.Box.Size = Vector2.new(Size * 1.1, Size * 1.9)
			tbl.Box.Position = Vector2.new(Pos.X - Size * 1.1 / 2, (Pos.Y - Size * 1.6 / 2))
			if values.visuals.players.box.Toggle then
				tbl.Box.Visible = OnScreen;
				if Drawings then
					tbl.BoxOutline.Size = tbl.Box.Size;
					tbl.BoxOutline.Position = tbl.Box.Position;
					tbl.BoxOutline.Visible = OnScreen
				else
					tbl.BoxOutline.Visible = false
				end
			else
				tbl.Box.Visible = false;
				tbl.BoxOutline.Visible = false
			end;
			if values.visuals.players.health.Toggle then
				if not values.visuals.players["health color"].Toggle then
					tbl.Health.Color = Color3.new(0, 1, 0)
				else
					tbl.Health.Color = values.visuals.players["health color"].Color
				end;
				tbl.Health.From = Vector2.new((tbl.Box.Position.X - 5), tbl.Box.Position.Y + tbl.Box.Size.Y)
				tbl.Health.To = Vector2.new(tbl.Health.From.X, tbl.Health.From.Y - (Player.Character.Humanoid.Health / Player.Character.Humanoid.MaxHealth) * tbl.Box.Size.Y)
				tbl.Health.Visible = OnScreen;
				if Drawings then
					tbl.HealthOutline.From = Vector2.new(tbl.Health.From.X, tbl.Box.Position.Y + tbl.Box.Size.Y + 1)
					tbl.HealthOutline.To = Vector2.new(tbl.Health.From.X, (tbl.Health.From.Y - 1 * tbl.Box.Size.Y) - 1)
					tbl.HealthOutline.Visible = OnScreen
				else
					tbl.HealthOutline.Visible = false
				end
			else
				tbl.Health.Visible = false;
				tbl.HealthOutline.Visible = false
			end;
			if values.visuals.players.weapon.Toggle then
				tbl.Weapon.Color = values.visuals.players.weapon.Color;
				tbl.Weapon.Text = Player.Character.EquippedTool.Value;
				tbl.Weapon.Position = Vector2.new(tbl.Box.Size.X / 2 + tbl.Box.Position.X, tbl.Box.Size.Y + tbl.Box.Position.Y + 1)
				tbl.Weapon.Font = Drawing.Fonts[values.visuals.players.font.Dropdown]
				tbl.Weapon.Outline = Text;
				tbl.Weapon.Size = values.visuals.players.size.Slider;
				tbl.Weapon.Visible = OnScreen
			else
				tbl.Weapon.Visible = false
			end;
			if values.visuals.players["weapon icon"].Toggle then
				Items[Player.Name].ImageColor3 = values.visuals.players["weapon icon"].Color;
				Items[Player.Name].Image = GetIcon.getWeaponOfKiller(Player.Character.EquippedTool.Value)
				Items[Player.Name].Position = UDim2.new(0, tbl.Box.Size.X / 2 + tbl.Box.Position.X, 0, tbl.Box.Size.Y + tbl.Box.Position.Y + (values.visuals.players.weapon.Toggle and -10 or -22))
				Items[Player.Name].Visible = OnScreen
			else
				Items[Player.Name].Visible = false
			end;
			if values.visuals.players.name.Toggle then
				tbl.Name.Color = values.visuals.players.name.Color;
				tbl.Name.Text = Player.Name;
				tbl.Name.Position = Vector2.new(tbl.Box.Size.X / 2 + tbl.Box.Position.X, tbl.Box.Position.Y - 16)
				tbl.Name.Font = Drawing.Fonts[values.visuals.players.font.Dropdown]
				tbl.Name.Outline = Text;
				tbl.Name.Size = values.visuals.players.size.Slider;
				tbl.Name.Visible = OnScreen
			else
				tbl.Name.Visible = false
			end;
			local LastInfoPos = tbl.Box.Position.Y - 1;
			if table.find(values.visuals.players.indicators.Jumbobox, "armor") and Player:FindFirstChild("Kevlar") then
				if not values.visuals.players["indicator color"].Toggle then
					tbl.Armor.Color = Color3.fromRGB(0, 150, 255)
				else
					tbl.Armor.Color = values.visuals.players["indicator color"].Color
				end;
				tbl.Armor.Text = Player:FindFirstChild("Helmet") and "HK" or "K"
				tbl.Armor.Position = Vector2.new(tbl.Box.Size.X + tbl.Box.Position.X + 12, LastInfoPos)
				tbl.Armor.Font = Drawing.Fonts[values.visuals.players.font.Dropdown]
				tbl.Armor.Outline = Text;
				tbl.Armor.Size = values.visuals.players.size.Slider;
				tbl.Armor.Visible = OnScreen;
				LastInfoPos = LastInfoPos + values.visuals.players.size.Slider
			else
				tbl.Armor.Visible = false
			end
		else
			if Player.Name ~= LocalPlayer.Name then
				Items[Player.Name].Visible = false;
				for i, v in pairs(tbl) do
					v.Visible = false
				end
			end
		end
	end
end)
local L_172_ = nil;
local L_173_ = values.visuals.self["silent angle speed"].Slider / 10;
local L_174_ = tick()
RunService.RenderStepped:Connect(function()
	if RageTarget then
		L_172_ = RageTarget.Position;
		L_174_ = tick()
	else
		if tick() - L_174_ > L_173_ then
			L_172_ = nil
		end
	end
end)
local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall;
local oldIndex = mt.__index;
local oldNewIndex = mt.__newindex;
setreadonly(mt, false)
mt.__namecall = function(self, ...)
	local method = tostring(getnamecallmethod())
	local args = {
		...
	}
	if method == "SetPrimaryPartCFrame" and self.Name == "Arms" then
		if values.visuals.self["third person"].Toggle and values.visuals.self["third person"].Active and LocalPlayer.Character then
			args[1] = args[1] * CFrame.new(99, 99, 99)
		else
			if values.visuals.self["viewmodel changer"].Toggle then
				args[1] = args[1] * ViewmodelOffset
			end;
			if values.visuals.self["visualize silent angle"].Toggle and L_172_ then
				args[1] = CFrame.lookAt(args[1].p, L_172_)
			end
		end
	end;
	if method == "SetPrimaryPartCFrame" and self.Name ~= "Arms" then
		args[1] = args[1] + Vector3.new(0, 3, 0)
		coroutine.wrap(function()
			DisableAA = true;
			wait(2)
			DisableAA = false
		end)()
	end;
	if method == "Kick" then
		return
	end;
	if method == "FireServer" then
		if string.len(self.Name) == 38 then
			return
		elseif self.Name == "FallDamage" and table.find(values.misc.client["damage bypass"].Jumbobox, "fall") or values.misc.movement["jump bug"].Toggle and values.misc.movement["jump bug"].Active then
			return
		elseif self.Name == "BURNME" and table.find(values.misc.client["damage bypass"].Jumbobox, "fire") then
			return
		elseif self.Name == "ControlTurn" and not checkcaller() then
			return
		end;
		if self.Name == "PlayerChatted" and values.misc.client["chat alive"].Toggle then
			args[2] = false;
			args[3] = "Innocent"
			args[4] = false;
			args[5] = false
		end;
		if self.Name == "ReplicateCamera" and values.misc.client["anti spectate"].Toggle then
			args[1] = CFrame.new()
		end
	end;
	if method == "FindPartOnRayWithWhitelist" and not checkcaller() and Client.gun ~= "none" and Client.gun.Name ~= "C4" then
		if #args[2] == 1 and args[2][1].Name == "SpawnPoints" then
			local Team = LocalPlayer.Status.Team.Value;
			if table.find(values.misc.client.shop.Jumbobox, "anywhere") then
				return Team == "T" and args[2][1].BuyArea or args[2][1].BuyArea2
			end
		end
	end;
	if method == "FindPartOnRayWithIgnoreList" and args[2][1] == workspace.Debris then
		if not checkcaller() or Filter then
			if table.find(values.misc.client["gun modifiers"].Jumbobox, "penetration") then
				table.insert(args[2], workspace.Map)
			end;
			if table.find(values.misc.client["gun modifiers"].Jumbobox, "spread") then
				args[1] = Ray.new(Camera.CFrame.p, Camera.CFrame.LookVector * Client.gun.Range.Value)
			end;
			if values.legit.aimbot["silent aim"].Toggle then
				local Stats = GetStatsLegit(GetWeaponLegit(Client.gun.Name))
				local Ignore = {
					LocalPlayer.Character,
					Camera,
					workspace.Map.Clips,
					workspace.Map.SpawnPoints,
					workspace.Debris
				}
				local Closest = 9999;
				local Target;
				if not table.find(Stats.conditions.Jumbobox, "smoke") then
					table.insert(Ignore, workspace.Ray_Ignore)
				end;
				coroutine.wrap(function()
					if not table.find(Stats.conditions.Jumbobox, "blind") or LocalPlayer.PlayerGui.Blnd.Blind.BackgroundTransparency > 0.9 then
						if not table.find(Stats.conditions.Jumbobox, "blind") or SelfVelocity < 3 then
							for _, Player in pairs(Players:GetPlayers()) do
								if Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character:FindFirstChild("Humanoid").Health > 0 then
									if not values.legit.settings["forcefield check"].Toggle or not Player.Character:FindFirstChildOfClass("ForceField") then
										if Player.Team ~= LocalPlayer.Team or values.legit.settings["free for all"].Toggle then
											local Pos, onScreen = Camera:WorldToViewportPoint(Player.Character.HumanoidRootPart.Position)
											if onScreen then
												local Magnitude = (Vector2.new(Pos.X, Pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude;
												if Magnitude < Stats["field of view"].Slider then
													local Hitbox = Stats.priority.Dropdown == "head" and Player.Character.Head or Stats.priority.Dropdown == "chest" and Player.Character.UpperTorso;
													if Stats.priority.Dropdown == "closest" then
														local HeadPos = Camera:WorldToViewportPoint(Player.Character.Head.Position)
														local TorsoPos = Camera:WorldToViewportPoint(Player.Character.UpperTorso.Position)
														local HeadDistance = (Vector2.new(HeadPos.X, HeadPos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude;
														local TorsoDistance = (Vector2.new(TorsoPos.X, TorsoPos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude;
														if HeadDistance < TorsoDistance then
															Hitbox = Player.Character.Head
														else
															Hitbox = Player.Character.UpperTorso
														end
													end;
													if Hitbox ~= nil then
														if not table.find(Stats.conditions.Jumbobox, "visible") then
															Target = Hitbox
														else
															local Ray1 = Ray.new(Camera.CFrame.Position, (Hitbox.Position - Camera.CFrame.Position).unit * (Hitbox.Position - Camera.CFrame.Position).magnitude)
															local Hit, Pos = workspace:FindPartOnRayWithIgnoreList(Ray1, Ignore, false, true)
															if Hit and Hit:FindFirstAncestor(Player.Name) then
																Target = Hitbox
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end;
					local Hit = math.random(1, 100) <= Stats.hitchance.Slider;
					if Target ~= nil and Hit then
						args[1] = Ray.new(Camera.CFrame.Position, (Target.Position - Camera.CFrame.Position).unit * (Target.Position - Camera.CFrame.Position).magnitude)
					end
				end)()
			end;
			if RageTarget ~= nil then
				local Origin = values.rage.aimbot.origin.Dropdown == "character" and LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 1.4, 0) or Camera.CFrame.p;
				if values.rage.aimbot["delay shot"].Toggle then
					spawn(function()
						args[1] = Ray.new(Origin, (RageTarget.Position - Origin).unit * (RageTarget.Position - Origin).magnitude)
					end)
				else
					args[1] = Ray.new(Origin, (RageTarget.Position - Origin).unit * (RageTarget.Position - Origin).magnitude)
				end
			end
		end
	end;
	if method == "InvokeServer" then
		if self.Name == "Moolah" then
			return
		elseif self.Name == "Hugh" then
			return
		elseif self.Name == "Filter" and values.misc.chat["no filter"].Toggle then
			return args[1]
		end
	end;
	if method == "LoadAnimation" and self.Name == "Humanoid" then
		if values.rage.others["leg movement"].Dropdown == "slide" then
			if string.find(args[1].Name, "Jump") or string.find(args[1].Name, "Run") then
				args[1] = FakeAnim
			end
		end;
		if values.rage.others["no animations"].Toggle then
			args[1] = FakeAnim
		end
	end;
	if method == "FireServer" and self.Name == "Hit" then
		if values.rage.aimbot["force hit"].Toggle and RageTarget ~= nil then
			args[1] = RageTarget;
			args[2] = RageTarget.Position
		end;
		if values.rage.aimbot["force headshots"].Toggle and RageTarget ~= nil then
			args[1] = RageTarget.Parent.Head
		end;
		spawn(function()
			if values.visuals.world["stable hitsounds"].Toggle and args[1].Parent ~= nil and args[1].Parent.Parent == workspace then
				local L_1496_ = Instance.new("Sound", workspace)
				L_1496_.SoundId = values.visuals.world.hitsound.Dropdown == "Jowatt" and "rbxassetid://7741067881" or values.visuals.world.hitsound.Dropdown == "Skeet" and "rbxassetid://5633695679" or values.visuals.world.hitsound.Dropdown == "Neverlose" and "rbxassetid://6534948092" or values.visuals.world.hitsound.Dropdown == "Minecraft" and "rbxassetid://4018616850" or values.visuals.world.hitsound.Dropdown == "Rust" and "rbxassetid://1255040462" or values.visuals.world.hitsound.Dropdown == "Pop" and "rbxassetid://198598793" or values.visuals.world.hitsound.Dropdown == "Pick" and "rbxassetid://1347140027" or values.visuals.world.hitsound.Dropdown == "Bubble" and "rbxassetid://6534947588" or values.visuals.world.hitsound.Dropdown == "Bell" and "rbxassetid://6534947240" or "rbxassetid://3124331820"
				L_1496_.PlayOnRemove = true;
				L_1496_.Volume = values.visuals.world["sound volume"].Slider;
				L_1496_:Destroy()
			end
		end)
		local prediction = Vector3.new(0, 0, 0)
		if values.rage.aimbot["prediction"].Dropdown ~= "off" and RageTarget ~= nil then
			prediction = Vector3.new(0, 0, 0)
			spawn(function()
				coroutine.wrap(function()
					if args[1] == RageTarget and args[1].Parent.Parent == workspace then
						args[2] = args[2] + prediction;
						prediction = Vector3.new(0, 0, 0)
						args[4] = 0;
						args[12] = args[12] - 512
					end
				end)()
			end)
			pcall(function()
				if args[1].Parent ~= nil and args[1].Parent.Parent == workspace then
					if values.rage.aimbot["prediction"].Dropdown == "old" then
						local L_1466_ = RageTarget.Parent.HumanoidRootPart.Position;
						local L_1467_ = RageTarget.Parent.HumanoidRootPart.Velocity - L_1466 / RageTarget.Parent.HumanoidRootPart.Velocity.magnitude;
						local L_1468_ = (Vector3.new(L_1467_.X, 0, L_1466_.Z))
						local L_1490_ = game.Stats.PerformanceStats.Ping:GetValue()
						local L_1491_ = L_1490_ / 1000 * 2 * L_1468_.Magnitude;
						local L_1492_ = L_1490_ / 1000 * 2 * (L_1468_.Magnitude - L_1491_)
						prediction = L_1467_ + L_1468_.Unit * L_1492_
					elseif values.rage.aimbot.prediction.Dropdown == "performance" then
						local L_1467_ = RageTarget.Parent.HumanoidRootPart.Velocity - RageTarget.Parent.HumanoidRootPart.Position / RageTarget.Parent.HumanoidRootPart.Velocity.magnitude;
						local L_1468_ = (Vector3.new(L_1467_.X, 0, L_1467_.Z))
						local L_1469_ = Vector3.new(L_1468_.X / L_1468_.magnitude, 0, L_1468_.Z / L_1468_.magnitude)
						prediction = L_1469_ / L_1467_ * Ping / math.pow(Ping, 1.5) * L_1469_ / (L_1469_ / 2) / L_1467_
					else
						local L_1466_ = RageTarget.Parent.HumanoidRootPart.Position;
						local vel = RageTarget.Parent.HumanoidRootPart.Velocity - L_1466 / RageTarget.Parent.HumanoidRootPart.Velocity.magnitude;
						local L_1468_ = (Vector3.new(L_1466_.X, 0, L_1467_.Z) - Vector3.new(L_1467_.X, 0, L_1466_.Z))
						local dir = Vector3.new(L_1468_.X / L_1468_.magnitude, 0, L_1468_.Z / L_1468_.magnitude)
						prediction = dir * Ping / math.pow(Ping, (values.rage.aimbot["amount"].Slider / 5)) * dir / (dir / 2) / vel
					end
				end
			end)
		end;
		spawn(function()
			if values.misc.exploits['peek method'].Dropdown == 'teleport' then
				if workspace:FindFirstChild('FreezeCharacter') then
					LocalPlayer.Character.PrimaryPart.CFrame = workspace.FreezeCharacter.no.CFrame + Vector3.new(0, 3, 0)
				end
			end;
			if values.misc.exploits['peek method'].Dropdown == 'tween' then
				if workspace:FindFirstChild('FreezeCharacter') then
					F_Tween(LocalPlayer.Character.PrimaryPart, 'CFrame', CFrame.new(workspace.FreezeCharacter.no.CFrame.x, LocalPlayer.Character.PrimaryPart.CFrame.y, workspace.FreezeCharacter.no.CFrame.z), 1 / values.misc.exploits['tween speed'].Slider, 0, 0, false)
				end
			end;
			if values.misc.exploits['peek method'].Dropdown == 'fhrp' and values.misc.exploits['unfreeze shoot'].Toggle then
				pcall(function()
					workspace.FreezeCharacter.Size = Vector3.new(0, 0, 0)
					wait(0.1)
					workspace.FreezeCharacter:Remove()
				end)
			end
		end)
		if tick() - lasthittick > 0.005 then
			if values.visuals.world["bullet tracer"].Toggle then
				lasthittick = tick()
				spawn(function()
					local pos;
					if values.visuals.self["third person"].Toggle and values.visuals.self["third person"].Active then
						pos = game:GetService("Players").LocalPlayer.Character.Gun.Flash.CFrame.p
					elseif game.Workspace.Camera:FindFirstChild("Arms") then
						pos = game.Workspace.Camera.Arms.Flash.CFrame.p
					end;
					if values.visuals.world["bullet tracer type"].Dropdown == "forcefield" then
						createforcefieldtracer(pos, args[2], values.visuals.world["bullet tracer"].Color, values.visuals.world["bullet tracer"].Color)
					elseif values.visuals.world["bullet tracer type"].Dropdown == "bloxsense.gay" then
						createbullettracer(pos, args[2], values.visuals.world["bullet tracer"].Color, values.visuals.world["bullet tracer"].Color)
					else
						circlebeam(pos, args[2], values.visuals.world["bullet tracer"].Color, values.visuals.world["bullet tracer"].Color)
					end
				end)
			end;
			if values.visuals.world["impacts"].Toggle then
				coroutine.wrap(function()
					local hit = Instance.new("Part")
					hit.Transparency = 1;
					hit.Anchored = true;
					hit.CanCollide = false;
					hit.Size = Vector3.new(0.3, 0.3, 0.3)
					hit.Position = args[2]
					local selection = Instance.new("SelectionBox")
					selection.LineThickness = 0;
					selection.SurfaceTransparency = 0.5;
					selection.Color3 = values.visuals.world["impacts"].Color;
					selection.SurfaceColor3 = values.visuals.world["impacts"].Color;
					selection.Parent = hit;
					selection.Adornee = hit;
					hit.Parent = workspace.Debris;
					wait(5.9)
					library:Tween(selection, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						SurfaceTransparency = 1
					})
					hit:Destroy()
				end)()
				if values.visuals.world["hit chams"].Toggle then
					coroutine.wrap(function()
						if Players:GetPlayerFromCharacter(args[1].Parent) and Players:GetPlayerFromCharacter(args[1].Parent).Team ~= LocalPlayer.Team then
							for _, hitbox in pairs(args[1].Parent:GetChildren()) do
								if hitbox:IsA("BasePart") or hitbox.Name == "Head" then
									coroutine.wrap(function()
										local part = Instance.new("Part")
										part.CFrame = hitbox.CFrame;
										part.Anchored = true;
										part.CanCollide = false;
										part.Material = Enum.Material.ForceField;
										part.Color = values.visuals.world["hit chams"].Color;
										part.Size = hitbox.Size;
										part.Parent = workspace.Debris;
										library:Tween(part, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
											Transparency = 1
										})
										wait(2)
										part:Destroy()
									end)()
								end
							end
						end
					end)()
				end
			end
		end
	end;
	return oldNamecall(self, unpack(args))
end;
local mt = getrawmetatable(game)
local oldNameCall = mt.__namecall;
local newIndex = mt.__index;
mt.__index = newcclosure(function(self, key)
	local CallingScript = getcallingscript()
	if not checkcaller() and self == Viewmodels and LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChild("UpperTorso") then
		local WeaponName = string.gsub(key, "v_", "")
		if not string.find(WeaponName, "Arms") then
			if Weapons[WeaponName]:FindFirstChild("Melee") and values.skins.knife["knife changer"].Toggle then
				if Viewmodels:FindFirstChild("v_" .. values.skins.knife.model.Scroll) then
					return Viewmodels:FindFirstChild("v_" .. values.skins.knife.model.Scroll)
				else
					local Cloned = Models.Knives[values.skins.knife.model.Scroll]:Clone()
					return Cloned
				end
			end
		end
	end;
	if key == "Value" then
		if self.Name == "FireRate" and values.rage.aimbot["gun manipulation"].Toggle then
			return 0.001 * 200
		end
	end;
	return newIndex(self, key)
end)
mt.__newindex = function(self, i, v)
	if self:IsA("Humanoid") and i == "JumpPower" and not checkcaller() then
		if values.misc.movement["jump bug"].Toggle and values.misc.movement["jump bug"].Active then
			v = 24
		end;
		if values.misc.movement["edge bug"].Toggle and values.misc.movement["edge bug"].Active then
			v = 0
		end
	end;
	if self:IsA("Humanoid") and i == "CameraOffset" then
		if values.rage.angles.enabled.Toggle and values.rage.angles["body roll"].Dropdown == "180" and not DisableAA then
			v = v + Vector3.new(0, -3.5, 0)
		end
	end;
	return oldNewIndex(self, i, v)
end;
Crosshairs.Scope:GetPropertyChangedSignal("Visible"):Connect(function(current)
	if not table.find(values.visuals.effects.removals.Jumbobox, "scope lines") then
		return
	end;
	if current ~= false then
		Crosshairs.Scope.Visible = false
	end
end)
Crosshair:GetPropertyChangedSignal("Visible"):Connect(function(current)
	if not LocalPlayer.Character then
		return
	end;
	if not values.visuals.effects["force crosshair"].Toggle then
		return
	end;
	if LocalPlayer.Character:FindFirstChild("AIMING") then
		return
	end;
	Crosshair.Visible = true
end)
LocalPlayer.Additionals.TotalDamage:GetPropertyChangedSignal("Value"):Connect(function(current)
	if current == 0 then
		return
	end;
	coroutine.wrap(function()
		if values.misc.client.hitmarker.Toggle then
			local Line = Drawing.new("Line")
			local Line2 = Drawing.new("Line")
			local Line3 = Drawing.new("Line")
			local Line4 = Drawing.new("Line")
			local x, y = Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2;
			Line.From = Vector2.new(x + 4, y + 4)
			Line.To = Vector2.new(x + 10, y + 10)
			Line.Color = values.misc.client.hitmarker.Color;
			Line.Visible = true;
			Line2.From = Vector2.new(x + 4, y - 4)
			Line2.To = Vector2.new(x + 10, y - 10)
			Line2.Color = values.misc.client.hitmarker.Color;
			Line2.Visible = true;
			Line3.From = Vector2.new(x - 4, y - 4)
			Line3.To = Vector2.new(x - 10, y - 10)
			Line3.Color = values.misc.client.hitmarker.Color;
			Line3.Visible = true;
			Line4.From = Vector2.new(x - 4, y + 4)
			Line4.To = Vector2.new(x - 10, y + 10)
			Line4.Color = values.misc.client.hitmarker.Color;
			Line4.Visible = true;
			Line.Transparency = 1;
			Line2.Transparency = 1;
			Line3.Transparency = 1;
			Line4.Transparency = 1;
			Line.Thickness = 1;
			Line2.Thickness = 1;
			Line3.Thickness = 1;
			Line4.Thickness = 1;
			wait(0.3)
			for i = 1, 0, -0.1 do
				wait()
				Line.Transparency = i;
				Line2.Transparency = i;
				Line3.Transparency = i;
				Line4.Transparency = i
			end;
			Line:Remove()
			Line2:Remove()
			Line3:Remove()
			Line4:Remove()
		end
	end)()
end)
RayIgnore.ChildAdded:Connect(function(obj)
	if obj.Name == "Fires" then
		obj.ChildAdded:Connect(function(fire)
			if values.visuals.world["molly radius"].Toggle then
				fire.Transparency = values.visuals.world["molly radius"].Transparency;
				fire.Color = values.visuals.world["molly radius"].Color
			end
		end)
	end;
	if obj.Name == "Smokes" then
		obj.ChildAdded:Connect(function(smoke)
			RunService.RenderStepped:Wait()
			local OriginalRate = Instance.new("NumberValue")
			OriginalRate.Value = smoke.ParticleEmitter.Rate;
			OriginalRate.Name = "OriginalRate"
			OriginalRate.Parent = smoke;
			if table.find(values.visuals.effects.removals.Jumbobox, "smokes") then
				smoke.ParticleEmitter.Rate = 0
			end;
			smoke.Material = Enum.Material.ForceField;
			if values.visuals.world["smoke radius"].Toggle then
				smoke.Transparency = 0;
				smoke.Color = values.visuals.world["smoke radius"].Color
			end
		end)
	end
end)
if RayIgnore:FindFirstChild("Fires") then
	RayIgnore:FindFirstChild("Fires").ChildAdded:Connect(function(fire)
		if values.visuals.world["molly radius"].Toggle then
			fire.Transparency = values.visuals.world["molly radius"].Transparency;
			fire.Color = values.visuals.world["molly radius"].Color
		end
	end)
end;
if RayIgnore:FindFirstChild("Smokes") then
	for _, smoke in pairs(RayIgnore:FindFirstChild("Smokes"):GetChildren()) do
		local OriginalRate = Instance.new("NumberValue")
		OriginalRate.Value = smoke.ParticleEmitter.Rate;
		OriginalRate.Name = "OriginalRate"
		OriginalRate.Parent = smoke;
		smoke.Material = Enum.Material.ForceField
	end;
	RayIgnore:FindFirstChild("Smokes").ChildAdded:Connect(function(smoke)
		RunService.RenderStepped:Wait()
		local OriginalRate = Instance.new("NumberValue")
		OriginalRate.Value = smoke.ParticleEmitter.Rate;
		OriginalRate.Name = "OriginalRate"
		OriginalRate.Parent = smoke;
		if table.find(values.visuals.effects.removals.Jumbobox, "smokes") then
			smoke.ParticleEmitter.Rate = 0
		end;
		smoke.Material = Enum.Material.ForceField;
		if values.visuals.world["smoke radius"].Toggle then
			smoke.Transparency = 0;
			smoke.Color = values.visuals.world["smoke radius"].Color
		end
	end)
end;
Camera.ChildAdded:Connect(function(obj)
	if table.find(values.misc.client["gun modifiers"].Jumbobox, "ammo") then
		Client.ammocount = 999999;
		Client.primarystored = 999999;
		Client.ammocount2 = 999999;
		Client.secondarystored = 999999
	end;
	RunService.RenderStepped:Wait()
	if obj.Name ~= "Arms" then
		return
	end;
	local Model;
	for i, v in pairs(obj:GetChildren()) do
		if v:IsA("Model") and (v:FindFirstChild("Right Arm") or v:FindFirstChild("Left Arm")) then
			Model = v
		end
	end;
	if Model == nil then
		return
	end;
	for i, v in pairs(obj:GetChildren()) do
		if (v:IsA("BasePart") or v:IsA("Part")) and v.Transparency ~= 1 and v.Name ~= "Flash" then
			local valid = true;
			if v:IsA("Part") and v:FindFirstChild("Mesh") and not v:IsA("BlockMesh") then
				valid = false;
				local success, err = pcall(function()
					local OriginalTexture = Instance.new("StringValue")
					OriginalTexture.Value = v.Mesh.TextureId;
					OriginalTexture.Name = "OriginalTexture"
					OriginalTexture.Parent = v.Mesh
				end)
				local success2, err2 = pcall(function()
					local OriginalTexture = Instance.new("StringValue")
					OriginalTexture.Value = v.Mesh.TextureID;
					OriginalTexture.Name = "OriginalTexture"
					OriginalTexture.Parent = v.Mesh
				end)
				if success or success2 then
					valid = true
				end
			end;
			for i2, v2 in pairs(v:GetChildren()) do
				if (v2:IsA("BasePart") or v2:IsA("Part")) then
					table.insert(WeaponObj, v2)
				end
			end;
			if valid then
				table.insert(WeaponObj, v)
			end
		end
	end;
	local gunname = Client.gun ~= "none" and values.skins.knife["knife changer"].Toggle and Client.gun:FindFirstChild("Melee") and values.skins.knife.model.Scroll or Client.gun ~= "none" and Client.gun.Name;
	if values.skins.skins["skin changer"].Toggle and gunname ~= nil and Skins:FindFirstChild(gunname) then
		if values.skins.skins.skin.Scroll[gunname] ~= "Inventory" then
			MapSkin(gunname, values.skins.skins.skin.Scroll[gunname])
		end
	end;
	for _, v in pairs(WeaponObj) do
		if v:IsA("MeshPart") then
			local OriginalTexture = Instance.new("StringValue")
			OriginalTexture.Value = v.TextureID;
			OriginalTexture.Name = "OriginalTexture"
			OriginalTexture.Parent = v
		end;
		local OriginalColor = Instance.new("Color3Value")
		OriginalColor.Value = v.Color;
		OriginalColor.Name = "OriginalColor"
		OriginalColor.Parent = v;
		local OriginalMaterial = Instance.new("StringValue")
		OriginalMaterial.Value = v.Material.Name;
		OriginalMaterial.Name = "OriginalMaterial"
		OriginalMaterial.Parent = v;
		if values.visuals.effects["weapon chams"].Toggle then
			UpdateWeapon(v)
		end
	end;
	RArm = Model:FindFirstChild("Right Arm")
	LArm = Model:FindFirstChild("Left Arm")
	if RArm then
		local OriginalColor = Instance.new("Color3Value")
		OriginalColor.Value = RArm.Color;
		OriginalColor.Name = "Color3Value"
		OriginalColor.Parent = RArm;
		if values.visuals.effects["arm chams"].Toggle then
			RArm.Mesh.TextureId = "rbxassetid://0"
			yo_omgr = "pasting is bad nigga"
			RArm.Material = values.visuals.effects["arm material"].Dropdown;
			RArm.Color = values.visuals.effects["arm chams"].Color;
			RArm.Transparency = values.visuals.effects["arm chams"].Transparency
		end;
		RGlove = RArm:FindFirstChild("Glove") or RArm:FindFirstChild("RGlove")
		if values.skins.glove["glove changer"].Toggle and Client.gun ~= "none" then
			if RGlove then
				RGlove:Destroy()
			end;
			RGlove = GloveModels[values.skins.glove.model.Dropdown].RGlove:Clone()
			RGlove.Mesh.TextureId = Gloves[values.skins.glove.model.Dropdown][values.skins.glove.model.Dropdown[values.skins.glove.model.Dropdown]].Textures.TextureId;
			RGlove.Parent = RArm;
			RGlove.Transparency = 0;
			RGlove.Welded.Part0 = RArm
		end;
		if RGlove.Transparency == 1 then
			RGlove:Destroy()
			RGlove = nil
		else
			local GloveTexture = Instance.new("StringValue")
			GloveTexture.Value = RGlove.Mesh.TextureId;
			GloveTexture.Name = "StringValue"
			GloveTexture.Parent = RGlove;
			if values.visuals.effects["accessory chams"].Toggle then
				UpdateAccessory(RGlove)
			end
		end;
		RSleeve = RArm:FindFirstChild("Sleeve")
		if RSleeve ~= nil then
			local SleeveTexture = Instance.new("StringValue")
			SleeveTexture.Value = RSleeve.Mesh.TextureId;
			SleeveTexture.Name = "StringValue"
			SleeveTexture.Parent = RSleeve;
			if values.visuals.effects["arm chams"].Toggle then
				LArm.Color = values.visuals.effects["arm chams"].Color
			end;
			if values.visuals.effects["accessory chams"].Toggle then
				UpdateAccessory(RSleeve)
			end;
			if values.visuals.effects["hide sleeves"].Toggle then
				RSleeve.Transparency = 1
			end
		end
	end;
	if LArm then
		local OriginalColor = Instance.new("Color3Value")
		OriginalColor.Value = LArm.Color;
		OriginalColor.Name = "Color3Value"
		OriginalColor.Parent = LArm;
		if values.visuals.effects["arm chams"].Toggle then
			LArm.Mesh.TextureId = "rbxassetid://0"
			yo_omgr1 = "pasting is bad nigga"
			LArm.Material = values.visuals.effects["arm material"].Dropdown;
			LArm.Color = values.visuals.effects["arm chams"].Color;
			LArm.Transparency = values.visuals.effects["arm chams"].Transparency
		end;
		LGlove = LArm:FindFirstChild("Glove") or LArm:FindFirstChild("LGlove")
		if values.skins.glove["glove changer"].Toggle and Client.gun ~= "none" then
			if LGlove then
				LGlove:Destroy()
			end;
			LGlove = GloveModels[values.skins.glove.model.Dropdown].LGlove:Clone()
			LGlove.Mesh.TextureId = Gloves[values.skins.glove.model.Dropdown][values.skins.glove.model.Scroll[values.skins.glove.model.Dropdown]].Textures.TextureId;
			LGlove.Transparency = 0;
			LGlove.Parent = LArm;
			LGlove.Welded.Part0 = LArm
		end;
		if LGlove.Transparency == 1 then
			LGlove:Destroy()
			LGlove = nil
		else
			local GloveTexture = Instance.new("StringValue")
			GloveTexture.Value = LGlove.Mesh.TextureId;
			GloveTexture.Name = "StringValue"
			GloveTexture.Parent = LGlove;
			if values.visuals.effects["accessory chams"].Toggle then
				UpdateAccessory(LGlove)
			end
		end;
		LSleeve = LArm:FindFirstChild("Sleeve")
		if LSleeve ~= nil then
			local SleeveTexture = Instance.new("StringValue")
			SleeveTexture.Value = LSleeve.Mesh.TextureId;
			SleeveTexture.Name = "StringValue"
			SleeveTexture.Parent = LSleeve;
			if values.visuals.effects["accessory chams"].Toggle then
				UpdateAccessory(LSleeve)
			end;
			if values.visuals.effects["hide sleeves"].Toggle then
				LSleeve.Transparency = 1
			end
		end
	end
end)
Camera.ChildAdded:Connect(function(obj)
	if obj.Name == "Arms" then
		RArm, LArm, RGlove, RSleeve, LGlove, LSleeve = nil, nil, nil, nil, nil, nil;
		WeaponObj = {}
	end
end)
Camera:GetPropertyChangedSignal("FieldOfView"):Connect(function(fov)
	if LocalPlayer.Character == nil then
		return
	end;
	if fov == values.visuals.self["fov changer"].Slider then
		return
	end;
	if values.visuals.self["on scope"].Toggle or not LocalPlayer.Character:FindFirstChild("AIMING") then
		Camera.FieldOfView = values.visuals.self["fov changer"].Slider
	end
end)
LocalPlayer.Cash:GetPropertyChangedSignal("Value"):Connect(function(cash)
	if values.misc.client["infinite cash"].Toggle and cash ~= 8000 then
		LocalPlayer.Cash.Value = 8000
	end
end)
if workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("Origin") then
	if workspace.Map.Origin.Value == "de_cache" or workspace.Map.Origin.Value == "de_vertigo" or workspace.Map.Origin.Value == "de_nuke" or workspace.Map.Origin.Value == "de_aztec" then
		oldSkybox = Lighting:FindFirstChildOfClass("Sky"):Clone()
	end
end;
workspace.ChildAdded:Connect(function(obj)
	if obj.Name == "Map" then
		wait(5)
		if values.misc.client["remove killers"].Toggle then
			if workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("Killers") then
				local clone = workspace:FindFirstChild("Map"):FindFirstChild("Killers"):Clone()
				clone.Name = "KillersClone"
				clone.Parent = workspace:FindFirstChild("Map")
				workspace:FindFirstChild("Map"):FindFirstChild("Killers"):Destroy()
			end
		end;
		if oldSkybox ~= nil then
			oldSkybox:Destroy()
			oldSkybox = nil
		end;
		local Origin = workspace.Map:WaitForChild("Origin")
		if workspace.Map.Origin.Value == "de_cache" or workspace.Map.Origin.Value == "de_vertigo" or workspace.Map.Origin.Value == "de_nuke" or workspace.Map.Origin.Value == "de_aztec" then
			oldSkybox = Lighting:FindFirstChildOfClass("Sky"):Clone()
			local sky = values.visuals.world.skybox.Dropdown;
			if sky ~= "none" then
				Lighting:FindFirstChildOfClass("Sky"):Destroy()
				local skybox = Instance.new("Sky")
				skybox.SkyboxLf = Skyboxes[sky].SkyboxLf;
				skybox.SkyboxBk = Skyboxes[sky].SkyboxBk;
				skybox.SkyboxDn = Skyboxes[sky].SkyboxDn;
				skybox.SkyboxFt = Skyboxes[sky].SkyboxFt;
				skybox.SkyboxRt = Skyboxes[sky].SkyboxRt;
				skybox.SkyboxUp = Skyboxes[sky].SkyboxUp;
				skybox.Name = "override"
				skybox.Parent = Lighting
			end
		else
			local sky = values.visuals.world.skybox.Dropdown;
			if sky ~= "none" then
				local skybox = Instance.new("Sky")
				skybox.SkyboxLf = Skyboxes[sky].SkyboxLf;
				skybox.SkyboxBk = Skyboxes[sky].SkyboxBk;
				skybox.SkyboxDn = Skyboxes[sky].SkyboxDn;
				skybox.SkyboxFt = Skyboxes[sky].SkyboxFt;
				skybox.SkyboxRt = Skyboxes[sky].SkyboxRt;
				skybox.SkyboxUp = Skyboxes[sky].SkyboxUp;
				skybox.Name = "override"
				skybox.Parent = Lighting
			end
		end
	end
end)
Lighting.ChildAdded:Connect(function(obj)
	if obj:IsA("Sky") and obj.Name ~= "override" then
		oldSkybox = obj:Clone()
	end
end)
local function CollisionTBL(obj)
	if obj:IsA("Accessory") then
		table.insert(Collision, obj)
	end;
	if obj:IsA("Part") then
		if obj.Name == "HeadHB" or obj.Name == "FakeHead" then
			table.insert(Collision, obj)
		end
	end
end;
LocalPlayer.CharacterAdded:Connect(function(char)
	repeat
		RunService.RenderStepped:Wait()
	until char:FindFirstChild("Gun")
	SelfObj = {}
	if values.skins.characters["character changer"].Toggle then
		ChangeCharacter(ChrModels:FindFirstChild(values.skins.characters.skin.Scroll))
	end;
	if char:FindFirstChildOfClass("Shirt") then
		local String = Instance.new("StringValue")
		String.Name = "OriginalTexture"
		String.Value = char:FindFirstChildOfClass("Shirt").ShirtTemplate;
		String.Parent = char:FindFirstChildOfClass("Shirt")
		if table.find(values.visuals.effects.removals.Jumbobox, "clothes") then
			char:FindFirstChildOfClass("Shirt").ShirtTemplate = ""
		end
	end;
	if char:FindFirstChildOfClass("Pants") then
		local String = Instance.new("StringValue")
		String.Name = "OriginalTexture"
		String.Value = char:FindFirstChildOfClass("Pants").PantsTemplate;
		String.Parent = char:FindFirstChildOfClass("Pants")
		if table.find(values.visuals.effects.removals.Jumbobox, "clothes") then
			char:FindFirstChildOfClass("Pants").PantsTemplate = ""
		end
	end;
	for i, v in pairs(char:GetChildren()) do
		if v:IsA("BasePart") and v.Transparency ~= 1 then
			table.insert(SelfObj, v)
			local Color = Instance.new("Color3Value")
			Color.Name = "OriginalColor"
			Color.Value = v.Color;
			Color.Parent = v;
			local String = Instance.new("StringValue")
			String.Name = "OriginalMaterial"
			String.Value = v.Material.Name;
			String.Parent = v
		elseif v:IsA("Accessory") and v.Handle.Transparency ~= 1 then
			table.insert(SelfObj, v.Handle)
			local Color = Instance.new("Color3Value")
			Color.Name = "OriginalColor"
			Color.Value = v.Handle.Color;
			Color.Parent = v.Handle;
			local String = Instance.new("StringValue")
			String.Name = "OriginalMaterial"
			String.Value = v.Handle.Material.Name;
			String.Parent = v.Handle
		end
	end;
	LocalPlayer.Character.ChildAdded:Connect(function(Child)
		if Child:IsA("Accessory") and Child.Handle.Transparency ~= 1 then
			table.insert(SelfObj, Child.Handle)
			local Color = Instance.new("Color3Value")
			Color.Name = "OriginalColor"
			Color.Value = Child.Handle.Color;
			Color.Parent = Child.Handle;
			local String = Instance.new("StringValue")
			String.Name = "OriginalMaterial"
			String.Value = Child.Handle.Material.Name;
			String.Parent = Child.Handle
		end
	end)
	if values.misc.animations.enabled.Toggle and values.misc.animations.enabled.Active then
		LoadedAnim = LocalPlayer.Character.Humanoid:LoadAnimation(Dance)
		LoadedAnim.Priority = Enum.AnimationPriority.Action;
		LoadedAnim:Play()
	end
end)
if LocalPlayer.Character ~= nil then
	for i, v in pairs(LocalPlayer.Character:GetChildren()) do
		if v:IsA("BasePart") and v.Transparency ~= 1 then
			table.insert(SelfObj, v)
			local Color = Instance.new("Color3Value")
			Color.Name = "OriginalColor"
			Color.Value = v.Color;
			Color.Parent = v;
			local String = Instance.new("StringValue")
			String.Name = "OriginalMaterial"
			String.Value = v.Material.Name;
			String.Parent = v
		elseif v:IsA("Accessory") and v.Handle.Transparency ~= 1 then
			table.insert(SelfObj, v.Handle)
			local Color = Instance.new("Color3Value")
			Color.Name = "OriginalColor"
			Color.Value = v.Handle.Color;
			Color.Parent = v.Handle;
			local String = Instance.new("StringValue")
			String.Name = "OriginalMaterial"
			String.Value = v.Handle.Material.Name;
			String.Parent = v.Handle
		end
	end;
	LocalPlayer.Character.ChildAdded:Connect(function(Child)
		if Child:IsA("Accessory") and Child.Handle.Transparency ~= 1 then
			table.insert(SelfObj, Child.Handle)
			local Color = Instance.new("Color3Value")
			Color.Name = "OriginalColor"
			Color.Value = Child.Handle.Color;
			Color.Parent = Child.Handle;
			local String = Instance.new("StringValue")
			String.Name = "OriginalMaterial"
			String.Value = Child.Handle.Material.Name;
			String.Parent = Child.Handle
		end
	end)
end;
Players.PlayerAdded:Connect(function(Player)
	Player:GetPropertyChangedSignal("Team"):Connect(function(new)
		wait()
		if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
			for _2, Obj in pairs(Player.Character:GetDescendants()) do
				if Obj.Name == "VisibleCham" then
					if values.visuals.players["visible chams"].Toggle then
						if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
							Obj.Visible = true
						else
							Obj.Visible = false
						end
					else
						Obj.Visible = false
					end;
					Obj.Color3 = values.visuals.players["visible chams"].Color
				end
			end
		end
	end)
	Player.CharacterAdded:Connect(function(Character)
		Character.ChildAdded:Connect(function(obj)
			wait(1)
			CollisionTBL(obj)
		end)
		wait(1)
		if Character ~= nil then
			local Value = Instance.new("Vector3Value")
			Value.Name = "OldPosition"
			Value.Value = Character.HumanoidRootPart.Position;
			Value.Parent = Character.HumanoidRootPart;
			for _, obj in pairs(Character:GetChildren()) do
				if obj:IsA("BasePart") and Player ~= LocalPlayer and obj.Name ~= "HumanoidRootPart" and obj.Name ~= "Head" and obj.Name ~= "BackC4" and obj.Name ~= "HeadHB" then
					local VisibleCham = Instance.new("BoxHandleAdornment")
					VisibleCham.Name = "VisibleCham"
					VisibleCham.AlwaysOnTop = false;
					VisibleCham.ZIndex = 8;
					VisibleCham.Size = obj.Size + Vector3.new(0.18, 0.18, 0.18)
					VisibleCham.AlwaysOnTop = false;
					VisibleCham.Transparency = 0.05;
					if values.visuals.players["visible chams"].Toggle then
						if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
							VisibleCham.Visible = true
						else
							VisibleCham.Visible = false
						end
					else
						VisibleCham.Visible = false
					end;
					table.insert(ChamItems, VisibleCham)
					VisibleCham.Color3 = values.visuals.players["visible chams"].Color;
					VisibleCham.AdornCullingMode = "Never"
					VisibleCham.Adornee = obj;
					VisibleCham.Parent = obj
				end
			end
		end
	end)
end)
for _, Player in pairs(Players:GetPlayers()) do
	if Player ~= LocalPlayer then
		Player:GetPropertyChangedSignal("Team"):Connect(function(new)
			wait()
			if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
				for _2, Obj in pairs(Player.Character:GetDescendants()) do
					if Obj.Name == "VisibleCham" then
						if values.visuals.players["visible chams"].Toggle then
							if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
								Obj.Visible = true
							else
								Obj.Visible = false
							end
						else
							Obj.Visible = false
						end;
						Obj.Color3 = values.visuals.players["visible chams"].Color
					end
				end
			end
		end)
	else
		LocalPlayer:GetPropertyChangedSignal("Team"):Connect(function(new)
			wait()
			for _, Player in pairs(Players:GetPlayers()) do
				if Player.Character then
					for _2, Obj in pairs(Player.Character:GetDescendants()) do
						if Obj.Name == "VisibleCham" then
							if values.visuals.players["visible chams"].Toggle then
								if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
									Obj.Visible = true
								else
									Obj.Visible = false
								end
							else
								Obj.Visible = false
							end;
							Obj.Color3 = values.visuals.players["visible chams"].Color
						end
					end
				end
			end
		end)
	end;
	Player.CharacterAdded:Connect(function(Character)
		Character.ChildAdded:Connect(function(obj)
			wait(1)
			CollisionTBL(obj)
		end)
		wait(1)
		if Player.Character ~= nil and Player.Character:FindFirstChild("HumanoidRootPart") then
			local Value = Instance.new("Vector3Value")
			Value.Value = Player.Character.HumanoidRootPart.Position;
			Value.Name = "OldPosition"
			Value.Parent = Player.Character.HumanoidRootPart;
			for _, obj in pairs(Player.Character:GetChildren()) do
				if obj:IsA("BasePart") and Player ~= LocalPlayer and obj.Name ~= "HumanoidRootPart" and obj.Name ~= "Head" and obj.Name ~= "BackC4" and obj.Name ~= "HeadHB" then
					local VisibleCham = Instance.new("BoxHandleAdornment")
					VisibleCham.Name = "VisibleCham"
					VisibleCham.AlwaysOnTop = false;
					VisibleCham.ZIndex = 5;
					VisibleCham.Size = obj.Size + Vector3.new(0.18, 0.18, 0.18)
					VisibleCham.AlwaysOnTop = false;
					VisibleCham.Transparency = 0.05;
					if values.visuals.players["visible chams"].Toggle then
						if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
							VisibleCham.Visible = true
						else
							VisibleCham.Visible = false
						end
					else
						VisibleCham.Visible = false
					end;
					table.insert(ChamItems, VisibleCham)
					VisibleCham.Color3 = values.visuals.players["visible chams"].Color;
					VisibleCham.AdornCullingMode = "Never"
					VisibleCham.Adornee = obj;
					VisibleCham.Parent = obj
				end
			end
		end
	end)
	if Player.Character ~= nil and Player.Character:FindFirstChild("UpperTorso") then
		local Value = Instance.new("Vector3Value")
		Value.Name = "OldPosition"
		Value.Value = Player.Character.HumanoidRootPart.Position;
		Value.Parent = Player.Character.HumanoidRootPart;
		for _, obj in pairs(Player.Character:GetChildren()) do
			CollisionTBL(obj)
			if obj:IsA("BasePart") and Player ~= LocalPlayer and obj.Name ~= "HumanoidRootPart" and obj.Name ~= "Head" and obj.Name ~= "BackC4" and obj.Name ~= "HeadHB" then
				local VisibleCham = Instance.new("BoxHandleAdornment")
				VisibleCham.Name = "VisibleCham"
				VisibleCham.AlwaysOnTop = false;
				VisibleCham.ZIndex = 5;
				VisibleCham.Size = obj.Size + Vector3.new(0.18, 0.18, 0.18)
				VisibleCham.AlwaysOnTop = false;
				VisibleCham.Transparency = 0.05;
				if values.visuals.players["visible chams"].Toggle then
					if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
						VisibleCham.Visible = true
					else
						VisibleCham.Visible = false
					end
				else
					VisibleCham.Visible = false
				end;
				table.insert(ChamItems, VisibleCham)
				VisibleCham.Color3 = values.visuals.players["visible chams"].Color;
				VisibleCham.AdornCullingMode = "Never"
				VisibleCham.Adornee = obj;
				VisibleCham.Parent = obj
			end
		end
	end
end;
Players.PlayerAdded:Connect(function(Player)
	Player:GetPropertyChangedSignal("Team"):Connect(function(new)
		wait()
		if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
			for _2, Obj in pairs(Player.Character:GetDescendants()) do
				if Obj.Name == "WallCham" then
					if values.visuals.players["chams"].Toggle then
						if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
							Obj.Visible = true
						else
							Obj.Visible = false
						end
					else
						Obj.Visible = false
					end;
					Obj.Color3 = values.visuals.players["chams"].Color
				end
			end
		end
	end)
	Player.CharacterAdded:Connect(function(Character)
		Character.ChildAdded:Connect(function(obj)
			wait(1)
			CollisionTBL(obj)
		end)
		wait(1)
		if Character ~= nil then
			local Value = Instance.new("Vector3Value")
			Value.Name = "OldPosition"
			Value.Value = Character.HumanoidRootPart.Position;
			Value.Parent = Character.HumanoidRootPart;
			for _, obj in pairs(Character:GetChildren()) do
				if obj:IsA("BasePart") and Player ~= LocalPlayer and obj.Name ~= "HumanoidRootPart" and obj.Name ~= "Head" and obj.Name ~= "BackC4" and obj.Name ~= "HeadHB" then
					local WallCham = Instance.new("BoxHandleAdornment")
					WallCham.Name = "WallCham"
					WallCham.AlwaysOnTop = true;
					WallCham.ZIndex = 5;
					WallCham.Size = obj.Size + Vector3.new(0.08, 0.08, 0.08)
					WallCham.AlwaysOnTop = true;
					WallCham.Transparency = 0.7;
					if values.visuals.players["chams"].Toggle then
						if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
							WallCham.Visible = true
						else
							WallCham.Visible = false
						end
					else
						WallCham.Visible = false
					end;
					table.insert(ChamItems, WallCham)
					WallCham.Color3 = values.visuals.players["chams"].Color;
					WallCham.AdornCullingMode = "Never"
					WallCham.Adornee = obj;
					WallCham.Parent = obj
				end
			end
		end
	end)
end)
for _, Player in pairs(Players:GetPlayers()) do
	if Player ~= LocalPlayer then
		Player:GetPropertyChangedSignal("Team"):Connect(function(new)
			wait()
			if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
				for _2, Obj in pairs(Player.Character:GetDescendants()) do
					if Obj.Name == "WallCham" then
						if values.visuals.players["chams"].Toggle then
							if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
								Obj.Visible = true
							else
								Obj.Visible = false
							end
						else
							Obj.Visible = false
						end;
						Obj.Color3 = values.visuals.players["chams"].Color
					end
				end
			end
		end)
	else
		LocalPlayer:GetPropertyChangedSignal("Team"):Connect(function(new)
			wait()
			for _, Player in pairs(Players:GetPlayers()) do
				if Player.Character then
					for _2, Obj in pairs(Player.Character:GetDescendants()) do
						if Obj.Name == "WallCham" then
							if values.visuals.players["chams"].Toggle then
								if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
									Obj.Visible = true
								else
									Obj.Visible = false
								end
							else
								Obj.Visible = false
							end;
							Obj.Color3 = values.visuals.players["chams"].Color
						end
					end
				end
			end
		end)
	end;
	Player.CharacterAdded:Connect(function(Character)
		Character.ChildAdded:Connect(function(obj)
			wait(1)
			CollisionTBL(obj)
		end)
		wait(1)
		if Player.Character ~= nil and Player.Character:FindFirstChild("HumanoidRootPart") then
			local Value = Instance.new("Vector3Value")
			Value.Value = Player.Character.HumanoidRootPart.Position;
			Value.Name = "OldPosition"
			Value.Parent = Player.Character.HumanoidRootPart;
			for _, obj in pairs(Player.Character:GetChildren()) do
				if obj:IsA("BasePart") and Player ~= LocalPlayer and obj.Name ~= "HumanoidRootPart" and obj.Name ~= "Head" and obj.Name ~= "BackC4" and obj.Name ~= "HeadHB" then
					local WallCham = Instance.new("BoxHandleAdornment")
					WallCham.Name = "WallCham"
					WallCham.AlwaysOnTop = true;
					WallCham.ZIndex = 5;
					WallCham.Size = obj.Size + Vector3.new(0.08, 0.08, 0.08)
					WallCham.AlwaysOnTop = true;
					WallCham.Transparency = 0.7;
					if values.visuals.players["chams"].Toggle then
						if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
							WallCham.Visible = true
						else
							WallCham.Visible = false
						end
					else
						WallCham.Visible = false
					end;
					table.insert(ChamItems, WallCham)
					WallCham.Color3 = values.visuals.players["chams"].Color;
					WallCham.AdornCullingMode = "Never"
					WallCham.Adornee = obj;
					WallCham.Parent = obj
				end
			end
		end
	end)
	if Player.Character ~= nil and Player.Character:FindFirstChild("UpperTorso") then
		local Value = Instance.new("Vector3Value")
		Value.Name = "OldPosition"
		Value.Value = Player.Character.HumanoidRootPart.Position;
		Value.Parent = Player.Character.HumanoidRootPart;
		for _, obj in pairs(Player.Character:GetChildren()) do
			CollisionTBL(obj)
			if obj:IsA("BasePart") and Player ~= LocalPlayer and obj.Name ~= "HumanoidRootPart" and obj.Name ~= "Head" and obj.Name ~= "BackC4" and obj.Name ~= "HeadHB" then
				local WallCham = Instance.new("BoxHandleAdornment")
				WallCham.Name = "WallCham"
				WallCham.AlwaysOnTop = true;
				WallCham.ZIndex = 5;
				WallCham.Size = obj.Size + Vector3.new(0.08, 0.08, 0.08)
				WallCham.AlwaysOnTop = true;
				WallCham.Transparency = 0.7;
				if values.visuals.players["chams"].Toggle then
					if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
						WallCham.Visible = true
					else
						WallCham.Visible = false
					end
				else
					WallCham.Visible = false
				end;
				table.insert(ChamItems, WallCham)
				WallCham.Color3 = values.visuals.players["chams"].Color;
				WallCham.AdornCullingMode = "Never"
				WallCham.Adornee = obj;
				WallCham.Parent = obj
			end
		end
	end
end
