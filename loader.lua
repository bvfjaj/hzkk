local LightingService = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
local BlurEffect = Instance.new("BlurEffect", LightingService)
local BackgroundFrame = Instance.new("Frame", ScreenGui)
local FrameGradient = Instance.new("UIGradient", BackgroundFrame)
local TitleLabel = Instance.new("TextLabel", ScreenGui)
local BarBackground = Instance.new("Frame", ScreenGui)
local ProgressBar = Instance.new("Frame", BarBackground)
local ProgressGradient = Instance.new("UIGradient", ProgressBar)
local SkipButton = Instance.new("TextButton", ScreenGui)
local ButtonGradient = Instance.new("UIGradient", SkipButton)

local FadeInInfo = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local LoadTween = TweenService:Create(ProgressBar, TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(1, 0, 1, 0) })

local function SetCornerRadius(TargetObject, Radius)
	local Corner = Instance.new("UICorner", TargetObject)
	Corner.CornerRadius = UDim.new(0, Radius)
end

local function CloseGui()
	local FadeOutInfo = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
	TweenService:Create(BlurEffect, FadeOutInfo, { Size = 0 }):Play()
	TweenService:Create(TitleLabel, FadeOutInfo, { TextTransparency = 1, TextStrokeTransparency = 1, Size = UDim2.new(1.2, 0, 1.2, 0), Position = UDim2.new(-0.1, 0, -0.1, 0) }):Play()
	TweenService:Create(BackgroundFrame, FadeOutInfo, { BackgroundTransparency = 1 }):Play()
	TweenService:Create(BarBackground, FadeOutInfo, { BackgroundTransparency = 1, Position = UDim2.new(0.5, -200, 0.8, 0) }):Play()
	TweenService:Create(ProgressBar, FadeOutInfo, { BackgroundTransparency = 1 }):Play()
	TweenService:Create(SkipButton, FadeOutInfo, { BackgroundTransparency = 1, TextTransparency = 1, Position = UDim2.new(0.5, -60, 0.9, 0) }):Play()
	task.delay(0.7, function()
		ScreenGui:Destroy()
		BlurEffect:Destroy()
	end)
end

ScreenGui.IgnoreGuiInset = true
BlurEffect.Size = 0

BackgroundFrame.Size = UDim2.new(1, 0, 1, 0)
BackgroundFrame.BackgroundTransparency = 1
BackgroundFrame.BackgroundColor3 = Color3.fromRGB(15, 10, 25)
BackgroundFrame.BorderSizePixel = 0

FrameGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 15, 60)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(15, 10, 25)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 25, 50))
})
FrameGradient.Transparency = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0.4),
	NumberSequenceKeypoint.new(0.5, 0.2),
	NumberSequenceKeypoint.new(1, 0.4)
})
FrameGradient.Rotation = 45

TitleLabel.Size = UDim2.new(0.8, 0, 0.8, 0)
TitleLabel.Position = UDim2.new(0.1, 0, 0.1, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "VEXAL SCRIPTS"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 120
TitleLabel.Font = Enum.Font.LuckiestGuy
TitleLabel.TextTransparency = 1
TitleLabel.TextStrokeTransparency = 1
TitleLabel.TextStrokeColor3 = Color3.fromRGB(25, 0, 50)

local TitleGradient = Instance.new("UIGradient", TitleLabel)
TitleGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 90, 200)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(150, 50, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 230, 255))
})
TitleGradient.Rotation = 90

BarBackground.Size = UDim2.new(0, 400, 0, 12)
BarBackground.Position = UDim2.new(0.5, -200, 0.8, 0)
BarBackground.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
BarBackground.BackgroundTransparency = 1
BarBackground.BorderSizePixel = 0
SetCornerRadius(BarBackground, 6)

ProgressBar.Size = UDim2.new(0, 0, 1, 0)
ProgressBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ProgressBar.BackgroundTransparency = 1
ProgressBar.BorderSizePixel = 0
SetCornerRadius(ProgressBar, 6)

ProgressGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 50, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 230, 255))
})

SkipButton.Size = UDim2.new(0, 140, 0, 45)
SkipButton.Position = UDim2.new(0.5, -70, 0.88, 0)
SkipButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SkipButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SkipButton.Text = "SKIP"
SkipButton.Font = Enum.Font.GothamBold
SkipButton.TextSize = 16
SkipButton.BackgroundTransparency = 1
SkipButton.TextTransparency = 1
SetCornerRadius(SkipButton, 22)

ButtonGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 30, 140)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 20, 80))
})

local ButtonStroke = Instance.new("UIStroke", SkipButton)
ButtonStroke.Thickness = 2
ButtonStroke.Color = Color3.fromRGB(150, 50, 255)
ButtonStroke.Transparency = 1

local StrokeGradient = Instance.new("UIGradient", ButtonStroke)
StrokeGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 90, 200)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 230, 255))
})

TweenService:Create(BlurEffect, FadeInInfo, { Size = 15 }):Play()
TweenService:Create(BackgroundFrame, FadeInInfo, { BackgroundTransparency = 0 }):Play()
TweenService:Create(TitleLabel, FadeInInfo, { TextTransparency = 0, TextStrokeTransparency = 0.2, Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0, 0, 0, 0) }):Play()
TweenService:Create(BarBackground, FadeInInfo, { BackgroundTransparency = 0, Position = UDim2.new(0.5, -200, 0.75, 0) }):Play()
TweenService:Create(ProgressBar, FadeInInfo, { BackgroundTransparency = 0 }):Play()
TweenService:Create(SkipButton, FadeInInfo, { BackgroundTransparency = 0, TextTransparency = 0, Position = UDim2.new(0.5, -70, 0.83, 0) }):Play()
TweenService:Create(ButtonStroke, FadeInInfo, { Transparency = 0 }):Play()

LoadTween:Play()

SkipButton.MouseEnter:Connect(function()
	TweenService:Create(SkipButton, TweenInfo.new(0.2), { Size = UDim2.new(0, 150, 0, 48), Position = UDim2.new(0.5, -75, 0.828, 0) }):Play()
	TweenService:Create(ButtonStroke, TweenInfo.new(0.2), { Thickness = 3 }):Play()
end)

SkipButton.MouseLeave:Connect(function()
	TweenService:Create(SkipButton, TweenInfo.new(0.2), { Size = UDim2.new(0, 140, 0, 45), Position = UDim2.new(0.5, -70, 0.83, 0) }):Play()
	TweenService:Create(ButtonStroke, TweenInfo.new(0.2), { Thickness = 2 }):Play()
end)

SkipButton.MouseButton1Down:Connect(function()
	TweenService:Create(SkipButton, TweenInfo.new(0.1), { Size = UDim2.new(0, 135, 0, 42), Position = UDim2.new(0.5, -67.5, 0.832, 0) }):Play()
end)

SkipButton.MouseButton1Click:Connect(CloseGui)
LoadTween.Completed:Connect(CloseGui)
