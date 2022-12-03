-- Gui to Lua
-- Version: 3.2

-- Instances:

local Gui_join = Instance.new("ScreenGui")
local Main_fram = Instance.new("Frame")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local btn_close = Instance.new("TextButton")
local btn_join = Instance.new("TextButton")
local btn_copy = Instance.new("TextButton")


local GuiService = game:GetService("StarterGui")
local TeleService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")


--Properties:
Gui_join.Name = "Gui_join"
Gui_join.Parent = CoreGui
Gui_join.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main_fram.Name = "Main_fram"
Main_fram.Parent = Gui_join
Main_fram.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
Main_fram.Position = UDim2.new(0.408231914, 0, 0.274314255, 0)
Main_fram.Size = UDim2.new(0, 267, 0, 114)
Main_fram.Active = true
Main_fram.Draggable = true

Frame.Parent = Main_fram
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.Size = UDim2.new(0, 267, 0, 32)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Size = UDim2.new(0, 267, 0, 32)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Join Server Tool"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Position = UDim2.new(0.0224719103, 0, 1.1875, 0)
TextBox.Size = UDim2.new(0, 253, 0, 28)
TextBox.Font = Enum.Font.SourceSans
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextSize = 14.000

btn_close.Name = "btn_close"
btn_close.Parent = Frame
btn_close.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
btn_close.Position = UDim2.new(0.921348333, 0, 0, 0)
btn_close.Size = UDim2.new(0, 21, 0, 18)
btn_close.Font = Enum.Font.SourceSans
btn_close.Text = "X"
btn_close.TextColor3 = Color3.fromRGB(255, 0, 0)
btn_close.TextSize = 14.000
btn_close.MouseButton1Down:connect(function()
	GuiService:SetCore("SendNotification", {Title = "Messages",Text = "Close Gui";})
	Gui_join:Destroy()
	end)

btn_join.Name = "btn_join"
btn_join.Parent = Frame
btn_join.BackgroundColor3 = Color3.fromRGB(31, 168, 52)
btn_join.Position = UDim2.new(0.546816468, 0, 2.3125, 0)
btn_join.Size = UDim2.new(0, 113, 0, 29)
btn_join.Font = Enum.Font.SourceSans
btn_join.Text = "Join Game"
btn_join.TextColor3 = Color3.fromRGB(255, 255, 255)
btn_join.TextScaled = true
btn_join.TextSize = 14.000
btn_join.TextWrapped = true
btn_join.MouseButton1Down:connect(function()
if CoreGui.RobloxPromptGui:FindFirstChild("promptOverlay") then
	CoreGui.RobloxPromptGui.promptOverlay.Visible = false
end
TeleService:TeleportToPlaceInstance(game.PlaceId,PasteJobID.Text,Players.LocalPlayer)
if CoreGui.RobloxPromptGui.promptOverlay:WaitForChild("ErrorPrompt") then
	if CoreGui.RobloxPromptGui.promptOverlay.ErrorPrompt.MessageArea.ErrorFrame.ButtonArea:FindFirstChild("OkButton") then
		game:GetService("GuiService"):ClearError()
		GuiService:SetCore("SendNotification", {Title = "Messages",Text = "Error, Invalid Job ID";})
	else
		GuiService:SetCore("SendNotification", {Title = "Messages",Text = "Successful, Joining Server";})  
	end
end
end)

btn_copy.Name = "btn_copy"
btn_copy.Parent = Frame
btn_copy.BackgroundColor3 = Color3.fromRGB(148, 127, 78)
btn_copy.Position = UDim2.new(0.0224719103, 0, 2.3125, 0)
btn_copy.Size = UDim2.new(0, 113, 0, 29)
btn_copy.Font = Enum.Font.SourceSans
btn_copy.Text = "Copy JobID"
btn_copy.TextColor3 = Color3.fromRGB(255, 255, 255)
btn_copy.TextScaled = true
btn_copy.TextSize = 14.000
btn_copy.TextWrapped = true
btn_copy.MouseButton1Down:connect(function()
	GuiService:SetCore("SendNotification", {Title = "Messages",Text = "Copied Job ID to Your Clipboard";})
	setclipboard(game.JobId)
	end)
