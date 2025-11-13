local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("PlayVoiceSound")

remote.OnClientEvent:Connect(function()
	print("Received PlayVoiceSound event, playing sound!")

	local player = game.Players.LocalPlayer
	local playerGui = player:WaitForChild("PlayerGui")

	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://118732920574239"  -- Your audio ID here
	sound.Volume = 1.5
	sound.Parent = playerGui

	sound:Play()

	sound.Ended:Connect(function()
		sound:Destroy()
	end)
end)
