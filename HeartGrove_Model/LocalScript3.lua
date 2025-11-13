-- Client LocalScript: listens for PlayVoiceEvent and plays the voice locally
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local event = ReplicatedStorage:WaitForChild("PlayVoiceEvent")

-- Plays a 2D/GUI sound for the local player
local function playVoice(soundId, volume)
	volume = volume or 3
	local playerGui = player:WaitForChild("PlayerGui")

	-- Create Sound and parent to PlayerGui so it's non-spatial (2D)
	local sound = Instance.new("Sound")
	sound.SoundId = soundId
	sound.Volume = volume
	sound.Looped = false
	sound.Parent = playerGui

	-- Play and clean up
	sound:Play()
	sound.Ended:Connect(function()
		sound:Destroy()
	end)
	-- Safety remove after 20s if something weird happens
	task.delay(20, function()
		if sound and sound.Parent then
			sound:Destroy()
		end
	end)
end

event.OnClientEvent:Connect(function(soundId, volume)
	if type(soundId) ~= "string" then return end
	playVoice(soundId, volume)
end)
