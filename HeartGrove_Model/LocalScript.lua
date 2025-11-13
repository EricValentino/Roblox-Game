local TweenService = game:GetService("TweenService")
local messageEvent = game.ReplicatedStorage:WaitForChild("ShowLoveMessage")

messageEvent.OnClientEvent:Connect(function(message)
	local player = game.Players.LocalPlayer
	local gui = player:WaitForChild("PlayerGui")
	local messageGui = gui:WaitForChild("LoveLetterGui")
	local messageBox = messageGui:WaitForChild("MessageBox")

	messageBox.Text = message
	messageBox.Visible = true
	messageBox.Size = UDim2.new(0, 0, 0, 0)
	messageBox.TextTransparency = 1
	messageBox.BackgroundTransparency = 1

	-- Pop in with bounce
	local popTween = TweenService:Create(messageBox, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Size = UDim2.new(0.5, 0, 0.2, 0),
		TextTransparency = 0,
		BackgroundTransparency = 0.1
	})
	popTween:Play()
	popTween.Completed:Wait()

	-- Cute pulse animation (scale up and down once)
	local pulseUp = TweenService:Create(messageBox, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		Size = UDim2.new(0.53, 0, 0.22, 0)
	})
	local pulseDown = TweenService:Create(messageBox, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
		Size = UDim2.new(0.5, 0, 0.2, 0)
	})

	pulseUp:Play()
	pulseUp.Completed:Wait()
	pulseDown:Play()

	task.wait(3)

	-- Fade out
	local fadeTween = TweenService:Create(messageBox, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		TextTransparency = 1,
		BackgroundTransparency = 1
	})
	fadeTween:Play()
	fadeTween.Completed:Wait()

	messageBox.Visible = false
end)
