--[[
    ███████╗██╗  ██╗███████╗███╗   ██╗████████╗███████╗███╗   ██╗███████╗████████╗
    ██╔════╝██║  ██║██╔════╝████╗  ██║╚══██╔══╝██╔════╝████╗  ██║██╔════╝╚══██╔══╝
    █████╗  ███████║█████╗  ██╔██╗ ██║   ██║   █████╗  ██╔██╗ ██║███████╗   ██║   
    ██╔══╝  ██╔══██║██╔══╝  ██║╚██╗██║   ██║   ██╔══╝  ██║╚██╗██║╚════██║   ██║   
    ██║     ██║  ██║███████╗██║ ╚████║   ██║   ███████╗██║ ╚████║███████║   ██║   
    ╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═══╝╚══════╝   ╚═╝   
                                                                                    
    Minea Mountain Script v5
    Features: Auto Farm Rocks, Auto Sell, Auto Detect Shops, Discord Webhook
    Mobile-Friendly GUI with Minimize Button
    
    Usage: Execute this script in a Roblox executor (Delta, Synapse X, KRNL, Fluxus, etc.)
]]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")

-- // CONFIG // --
local Config = {
    AutoFarmEnabled = false,
    AutoSellEnabled = false,
    AutoDetectShops = true,
    FarmRadius = 150,
    SellRadius = 200,
    WalkSpeed = 20,
    FarmDelay = 0.1,
    SellDelay = 0.5,
    TeleportDelay = 0.05,
    MinimumRockHealth = 0,
    PriorityClosest = true,
    -- Discord Webhook Settings
    WebhookEnabled = false,
    WebhookURL = "",
    WebhookMinInterval = 5,
    WebhookSendStats = true,
    WebhookSendFarms = true,
    WebhookSendSells = true,
    WebhookSendErrors = true,
}

-- // STATE // --
local State = {
    FarmConnection = nil,
    SellConnection = nil,
    DetectedShops = {},
    DetectedRocks = {},
    IsMinimized = false,
    IsRunning = false,
    CurrentTarget = nil,
    Logs = {},
    FarmCount = 0,
    SellCount = 0,
    TotalEarnings = 0,
    -- Webhook State
    WebhookQueue = {},
    WebhookProcessing = false,
    LastWebhookSend = 0,
    WebhookCooldowns = {},
}

-- // DISCORD WEBHOOK SYSTEM // --
local function SendWebhook(payload)
    if not Config.WebhookEnabled or Config.WebhookURL == "" then return end
    
    local success, err = pcall(function()
        local jsonData = HttpService:JSONEncode(payload)
        HttpService:PostAsync(Config.WebhookURL, jsonData, Enum.HttpContentType.ApplicationJson, true)
    end)
    
    if not success and Config.WebhookSendErrors then
        AddLog("Webhook error: " .. tostring(err))
    end
    
    return success
end

local function ProcessWebhookQueue()
    if State.WebhookProcessing then return end
    State.WebhookProcessing = true
    
    while #State.WebhookQueue > 0 do
        local now = tick()
        local elapsed = now - State.LastWebhookSend
        if elapsed < Config.WebhookMinInterval then
            task.wait(Config.WebhookMinInterval - elapsed)
        end
        
        local payload = State.WebhookQueue[1]
        table.remove(State.WebhookQueue, 1)
        
        SendWebhook(payload)
        State.LastWebhookSend = tick()
    end
    
    State.WebhookProcessing = false
end

local function QueueWebhook(embed)
    if not Config.WebhookEnabled or Config.WebhookURL == "" then return end
    
    local payload = {
        username = "Minea Mountain",
        avatar_url = "https://i.imgur.com/mining_pickaxe.png",
        embeds = {embed}
    }
    
    table.insert(State.WebhookQueue, payload)
    task.spawn(ProcessWebhookQueue)
end

local function SendFarmLogToDiscord(rockName, farmCount)
    if not Config.WebhookSendFarms then return end
    local cooldownKey = "farm_" .. rockName
    if State.WebhookCooldowns[cooldownKey] and tick() - State.WebhookCooldowns[cooldownKey] < 30 then
        return
    end
    State.WebhookCooldowns[cooldownKey] = tick()
    
    QueueWebhook({
        title = "⛏️ Rock Mined",
        description = "Mined **" .. rockName .. "** successfully!",
        color = 5763719,
        fields = {
            {name = "Total Mined", value = tostring(farmCount), inline = true},
            {name = "Player", value = LocalPlayer.Name, inline = true},
        },
        footer = {text = "Minea Mountain v5"},
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
    })
end

local function SendSellLogToDiscord(shopName, sellCount)
    if not Config.WebhookSendSells then return end
    local cooldownKey = "sell_" .. shopName
    if State.WebhookCooldowns[cooldownKey] and tick() - State.WebhookCooldowns[cooldownKey] < 30 then
        return
    end
    State.WebhookCooldowns[cooldownKey] = tick()
    
    QueueWebhook({
        title = "💰 Items Sold",
        description = "Sold items at **" .. shopName .. "**",
        color = 16766720,
        fields = {
            {name = "Total Sells", value = tostring(sellCount), inline = true},
            {name = "Player", value = LocalPlayer.Name, inline = true},
        },
        footer = {text = "Minea Mountain v5"},
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
    })
end

local function SendStatsToDiscord()
    if not Config.WebhookSendStats then return end
    
    QueueWebhook({
        title = "📊 Session Stats",
        description = "Current mining session statistics",
        color = 3447003,
        fields = {
            {name = "Rocks Mined", value = tostring(State.FarmCount), inline = true},
            {name = "Items Sold", value = tostring(State.SellCount), inline = true},
            {name = "Current Target", value = State.CurrentTarget or "None", inline = true},
            {name = "Auto Farm", value = Config.AutoFarmEnabled and "✅ ON" or "❌ OFF", inline = true},
            {name = "Auto Sell", value = Config.AutoSellEnabled and "✅ ON" or "❌ OFF", inline = true},
            {name = "Player", value = LocalPlayer.Name, inline = true},
        },
        footer = {text = "Minea Mountain v5"},
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
    })
end

local function SendStartupLogToDiscord()
    QueueWebhook({
        title = "🚀 Script Loaded",
        description = "Minea Mountain v5 has been loaded successfully!",
        color = 3066993,
        fields = {
            {name = "Player", value = LocalPlayer.Name, inline = true},
            {name = "Game", value = game.Name, inline = true},
            {name = "Job ID", value = game.JobId, inline = false},
        },
        footer = {text = "Minea Mountain v5"},
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
    })
end

-- Periodic stats webhook
task.spawn(function()
    while true do
        task.wait(60)
        if Config.WebhookEnabled and Config.WebhookURL ~= "" and Config.WebhookSendStats then
            SendStatsToDiscord()
        end
    end
end)

-- // UTILITY FUNCTIONS // --
local function GetCharacter()
    Character = LocalPlayer.Character
    if Character then
        HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
        Humanoid = Character:FindFirstChild("Humanoid")
    end
    return Character and HumanoidRootPart and Humanoid
end

local function GetDistance(part)
    if not GetCharacter() then return math.huge end
    return (HumanoidRootPart.Position - part.Position).Magnitude
end

local function TeleportTo(position)
    if not GetCharacter() then return false end
    HumanoidRootPart.CFrame = CFrame.new(position + Vector3.new(0, 3, 0))
    task.wait(Config.TeleportDelay)
    return true
end

local function WalkTo(position)
    if not GetCharacter() then return false end
    Humanoid:MoveTo(position)
    local timeout = 0
    while (HumanoidRootPart.Position - position).Magnitude > 8 and timeout < 10 do
        task.wait(0.1)
        timeout = timeout + 0.1
    end
    return true
end

local function AddLog(message)
    local timestamp = os.date("%H:%M:%S")
    table.insert(State.Logs, 1, "[" .. timestamp .. "] " .. message)
    if #State.Logs > 50 then
        table.remove(State.Logs)
    end
    if LogList then
        LogList:ClearAllChildren()
        for i, log in ipairs(State.Logs) do
            if i > 15 then break end
            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 0, 18)
            label.BackgroundTransparency = 1
            label.Text = log
            label.TextColor3 = Color3.fromRGB(200, 200, 200)
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.Font = Enum.Font.Gotham
            label.TextSize = 11
            label.Parent = LogList
        end
    end
end

-- // ROCK DETECTION // --
local function GetAllRocks()
    local rocks = {}
    local function SearchRocks(parent)
        for _, child in ipairs(parent:GetChildren()) do
            local nameLower = string.lower(child.Name)
            if child:IsA("BasePart") or child:IsA("Model") then
                if string.find(nameLower, "rock") or string.find(nameLower, "ore") or
                   string.find(nameLower, "stone") or string.find(nameLower, "mineral") or
                   string.find(nameLower, "crystal") or string.find(nameLower, "gem") or
                   string.find(nameLower, "coal") or string.find(nameLower, "iron") or
                   string.find(nameLower, "gold") or string.find(nameLower, "diamond") or
                   string.find(nameLower, "copper") or string.find(nameLower, "silver") or
                   string.find(nameLower, "ruby") or string.find(nameLower, "emerald") or
                   string.find(nameLower, "sapphire") or string.find(nameLower, "amethyst") or
                   string.find(nameLower, "node") or string.find(nameLower, "vein") or
                   string.find(nameLower, "deposit") or string.find(nameLower, "boulder") then
                    local part = child:IsA("BasePart") and child or child:FindFirstChildWhichIsA("BasePart")
                    if part then
                        local dist = GetDistance(part)
                        if dist <= Config.FarmRadius then
                            table.insert(rocks, {
                                Instance = child,
                                Part = part,
                                Distance = dist,
                                Name = child.Name,
                            })
                        end
                    end
                end
                if #child:GetChildren() > 0 then
                    SearchRocks(child)
                end
            end
        end
    end
    
    local searchAreas = {
        Workspace:FindFirstChild("Rocks"),
        Workspace:FindFirstChild("Ores"),
        Workspace:FindFirstChild("Minerals"),
        Workspace:FindFirstChild("Mines"),
        Workspace:FindFirstChild("Resources"),
        Workspace:FindFirstChild("Map"),
        Workspace:FindFirstChild("Terrain"),
        Workspace,
    }
    
    for _, area in ipairs(searchAreas) do
        if area then
            SearchRocks(area)
        end
    end
    
    if Config.PriorityClosest then
        table.sort(rocks, function(a, b) return a.Distance < b.Distance end)
    end
    
    return rocks
end

-- // SHOP DETECTION // --
local function GetAllShops()
    local shops = {}
    local function SearchShops(parent)
        for _, child in ipairs(parent:GetChildren()) do
            local nameLower = string.lower(child.Name)
            if child:IsA("Model") or child:IsA("BasePart") then
                if string.find(nameLower, "shop") or string.find(nameLower, "sell") or
                   string.find(nameLower, "store") or string.find(nameLower, "merchant") or
                   string.find(nameLower, "trader") or string.find(nameLower, "dealer") or
                   string.find(nameLower, "market") or string.find(nameLower, "vendor") or
                   string.find(nameLower, "cashier") or string.find(nameLower, "buyer") or
                   string.find(nameLower, "npc") or string.find(nameLower, "cash") then
                    local part = child:IsA("BasePart") and child or child:FindFirstChildWhichIsA("BasePart") or child:FindFirstChild("HumanoidRootPart")
                    if part then
                        local dist = GetDistance(part)
                        table.insert(shops, {
                            Instance = child,
                            Part = part,
                            Distance = dist,
                            Name = child.Name,
                        })
                    end
                end
                if #child:GetChildren() > 0 then
                    SearchShops(child)
                end
            end
        end
    end
    
    SearchShops(Workspace)
    
    table.sort(shops, function(a, b) return a.Distance < b.Distance end)
    return shops
end

-- // MINE / HARVEST ROCK // --
local function MineRock(rockData)
    local rock = rockData.Instance
    local part = rockData.Part
    
    if not rock or not rock.Parent then return false end
    
    AddLog("Mining: " .. rockData.Name)
    
    TeleportTo(part.Position)
    task.wait(0.1)
    
    local clickDetector = rock:FindFirstChildOfClass("ClickDetector") or part:FindFirstChildOfClass("ClickDetector")
    if clickDetector then
        fireclickdetector(clickDetector)
    end
    
    local prompt = rock:FindFirstChildOfClass("ProximityPrompt") or part:FindFirstChildOfClass("ProximityPrompt")
    if prompt then
        fireproximityprompt(prompt)
    end
    
    local tool = Character and Character:FindFirstChildOfClass("Tool")
    if tool then
        tool:Activate()
    end
    
    for _, remote in ipairs(ReplicatedStorage:GetDescendants()) do
        if remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction") then
            local rName = string.lower(remote.Name)
            if string.find(rName, "mine") or string.find(rName, "harvest") or
               string.find(rName, "collect") or string.find(rName, "break") or
               string.find(rName, "gather") or string.find(rName, "dig") then
                pcall(function()
                    if remote:IsA("RemoteEvent") then
                        remote:FireServer(rock, part)
                    elseif remote:IsA("RemoteFunction") then
                        remote:InvokeServer(rock, part)
                    end
                end)
            end
        end
    end
    
    State.FarmCount = State.FarmCount + 1
    UpdateStats()
    SendFarmLogToDiscord(rockData.Name, State.FarmCount)
    
    return true
end

-- // SELL ITEMS // --
local function SellItems(shopData)
    if not shopData then return false end
    
    local shop = shopData.Instance
    local part = shopData.Part
    
    AddLog("Selling at: " .. shopData.Name)
    
    TeleportTo(part.Position)
    task.wait(0.2)
    
    local clickDetector = shop:FindFirstChildOfClass("ClickDetector") or part:FindFirstChildOfClass("ClickDetector")
    if clickDetector then
        fireclickdetector(clickDetector)
    end
    
    local prompt = shop:FindFirstChildOfClass("ProximityPrompt") or part:FindFirstChildOfClass("ProximityPrompt")
    if prompt then
        fireproximityprompt(prompt)
    end
    
    for _, remote in ipairs(ReplicatedStorage:GetDescendants()) do
        if remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction") then
            local rName = string.lower(remote.Name)
            if string.find(rName, "sell") or string.find(rName, "shop") or
               string.find(rName, "market") or string.find(rName, "trade") or
               string.find(rName, "cash") or string.find(rName, "money") then
                pcall(function()
                    if remote:IsA("RemoteEvent") then
                        remote:FireServer()
                    elseif remote:IsA("RemoteFunction") then
                        remote:InvokeServer()
                    end
                end)
            end
        end
    end
    
    State.SellCount = State.SellCount + 1
    UpdateStats()
    SendSellLogToDiscord(shopData.Name, State.SellCount)
    
    return true
end

-- // AUTO FARM LOOP // --
local function StartAutoFarm()
    if State.FarmConnection then return end
    
    AddLog("Auto Farm STARTED")
    State.IsRunning = true
    
    State.FarmConnection = RunService.Heartbeat:Connect(function()
        if not Config.AutoFarmEnabled then return end
        if not GetCharacter() then return end
        
        local rocks = GetAllRocks()
        if #rocks > 0 then
            local target = rocks[1]
            State.CurrentTarget = target.Name
            
            MineRock(target)
            task.wait(Config.FarmDelay)
            
            if not target.Instance or not target.Instance.Parent then
                table.remove(State.DetectedRocks, 1)
            end
        else
            State.CurrentTarget = "Searching..."
        end
    end)
end


local function StopAutoFarm()
    if State.FarmConnection then
        State.FarmConnection:Disconnect()
        State.FarmConnection = nil
    end
    State.IsRunning = false
    State.CurrentTarget = nil
    AddLog("Auto Farm STOPPED")
end

-- // AUTO SELL LOOP // --
local function StartAutoSell()
    if State.SellConnection then return end
    
    AddLog("Auto Sell STARTED")
    
    State.SellConnection = RunService.Heartbeat:Connect(function()
        if not Config.AutoSellEnabled then return end
        if not GetCharacter() then return end
        
        local shops = GetAllShops()
        if #shops > 0 then
            local closestShop = shops[1]
            SellItems(closestShop)
            task.wait(Config.SellDelay)
        end
    end)
end

local function StopAutoSell()
    if State.SellConnection then
        State.SellConnection:Disconnect()
        State.SellConnection = nil
    end
    AddLog("Auto Sell STOPPED")
end

-- // AUTO DETECT SHOPS // --
local function DetectShops()
    State.DetectedShops = GetAllShops()
    
    if ShopList then
        ShopList:ClearAllChildren()
        for i, shop in ipairs(State.DetectedShops) do
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, 0, 0, 32)
            btn.BackgroundColor3 = Color3.fromRGB(35, 40, 55)
            btn.BorderSizePixel = 0
            btn.Text = shop.Name .. " [" .. math.floor(shop.Distance) .. "m]"
            btn.TextColor3 = Color3.fromRGB(200, 220, 255)
            btn.Font = Enum.Font.Gotham
            btn.TextSize = 12
            btn.Parent = ShopList
            
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 6)
            corner.Parent = btn
            
            btn.MouseButton1Click:Connect(function()
                TeleportTo(shop.Part.Position)
                AddLog("Teleported to: " .. shop.Name)
            end)
        end
    end
    
    AddLog("Detected " .. #State.DetectedShops .. " shops")
end

-- // DETECT ROCKS FOR LIST // --
local function DetectRocksForList()
    State.DetectedRocks = GetAllRocks()
    
    if RockList then
        RockList:ClearAllChildren()
        for i, rock in ipairs(State.DetectedRocks) do
            if i > 30 then break end
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, 0, 0, 32)
            btn.BackgroundColor3 = Color3.fromRGB(35, 40, 55)
            btn.BorderSizePixel = 0
            btn.Text = rock.Name .. " [" .. math.floor(rock.Distance) .. "m]"
            btn.TextColor3 = Color3.fromRGB(200, 255, 200)
            btn.Font = Enum.Font.Gotham
            btn.TextSize = 12
            btn.Parent = RockList
            
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 6)
            corner.Parent = btn
            
            btn.MouseButton1Click:Connect(function()
                TeleportTo(rock.Part.Position)
                AddLog("Teleported to: " .. rock.Name)
            end)
        end
    end
    
    AddLog("Detected " .. #State.DetectedRocks .. " rocks")
end

-- // GUI CREATION // --
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MineaMountainGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

if syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
end
ScreenGui.Parent = game:GetService("CoreGui")

local ViewSize = Workspace.CurrentCamera.ViewportSize
local IsMobile = ViewSize.X < 800
local GUIWidth = IsMobile and UDim2.new(0.92, 0, 0, 460) or UDim2.new(0, 340, 0, 520)
local GUIPosition = UDim2.new(0.04, 0, 0.15, 0)
local MinimizedSize = UDim2.new(0, 140, 0, 40)
local MinimizedPosition = UDim2.new(0.04, 0, 0.04, 0)

-- // MAIN FRAME // --
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = GUIWidth
MainFrame.Position = GUIPosition
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(80, 120, 255)
MainStroke.Thickness = 2
MainStroke.Transparency = 0.3
MainStroke.Parent = MainFrame

local GlowFrame = Instance.new("ImageLabel")
GlowFrame.Name = "Glow"
GlowFrame.Size = UDim2.new(1, 30, 1, 30)
GlowFrame.Position = UDim2.new(0, -15, 0, -15)
GlowFrame.BackgroundTransparency = 1
GlowFrame.Image = "rbxassetid://7669168585"
GlowFrame.ImageColor3 = Color3.fromRGB(60, 100, 255)
GlowFrame.ImageTransparency = 0.6
GlowFrame.ScaleType = Enum.ScaleType.Slice
GlowFrame.SliceCenter = Rect.new(45, 45, 45, 45)
GlowFrame.Parent = MainFrame

-- // HEADER // --
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 45)
Header.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 12)
HeaderCorner.Parent = Header

local HeaderGradient = Instance.new("UIGradient")
HeaderGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 70)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 45)),
})
HeaderGradient.Parent = Header

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(0.7, 0, 1, 0)
TitleLabel.Position = UDim2.new(0.05, 0, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "⛏️ Minea Mountain v5"
TitleLabel.TextColor3 = Color3.fromRGB(140, 180, 255)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = IsMobile and 14 or 16
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = Header

-- // MINIMIZE BUTTON // --
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Name = "MinimizeBtn"
MinimizeBtn.Size = UDim2.new(0, 36, 0, 28)
MinimizeBtn.Position = UDim2.new(1, -44, 0, 8)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
MinimizeBtn.BorderSizePixel = 0
MinimizeBtn.Text = "—"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.TextSize = 14
MinimizeBtn.Parent = Header

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 6)
MinimizeCorner.Parent = MinimizeBtn

-- Minimized floating button
local MinimizedFrame = Instance.new("Frame")
MinimizedFrame.Name = "MinimizedFrame"
MinimizedFrame.Size = MinimizedSize
MinimizedFrame.Position = MinimizedPosition
MinimizedFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
MinimizedFrame.BorderSizePixel = 0
MinimizedFrame.Visible = false
MinimizedFrame.Parent = ScreenGui

local MiniCorner = Instance.new("UICorner")
MiniCorner.CornerRadius = UDim.new(0, 10)
MiniCorner.Parent = MinimizedFrame

local MiniStroke = Instance.new("UIStroke")
MiniStroke.Color = Color3.fromRGB(80, 120, 255)
MiniStroke.Thickness = 2
MiniStroke.Transparency = 0.3
MiniStroke.Parent = MinimizedFrame

local MiniLabel = Instance.new("TextLabel")
MiniLabel.Size = UDim2.new(0.65, 0, 1, 0)
MiniLabel.Position = UDim2.new(0.05, 0, 0, 0)
MiniLabel.BackgroundTransparency = 1
MiniLabel.Text = "⛏️ Minea"
MiniLabel.TextColor3 = Color3.fromRGB(140, 180, 255)
MiniLabel.Font = Enum.Font.GothamBold
MiniLabel.TextSize = 13
MiniLabel.TextXAlignment = Enum.TextXAlignment.Left
MiniLabel.Parent = MinimizedFrame

local ExpandBtn = Instance.new("TextButton")
ExpandBtn.Size = UDim2.new(0, 36, 0, 28)
ExpandBtn.Position = UDim2.new(1, -44, 0, 6)
ExpandBtn.BackgroundColor3 = Color3.fromRGB(80, 200, 120)
ExpandBtn.BorderSizePixel = 0
ExpandBtn.Text = "□"
ExpandBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExpandBtn.Font = Enum.Font.GothamBold
ExpandBtn.TextSize = 14
ExpandBtn.Parent = MinimizedFrame

local ExpandCorner = Instance.new("UICorner")
ExpandCorner.CornerRadius = UDim.new(0, 6)
ExpandCorner.Parent = ExpandBtn

-- // CONTENT AREA // --
local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, -16, 1, -55)
Content.Position = UDim2.new(0, 8, 0, 50)
Content.BackgroundTransparency = 1
Content.Parent = MainFrame

local ContentScroll = Instance.new("ScrollingFrame")
ContentScroll.Name = "ContentScroll"
ContentScroll.Size = UDim2.new(1, 0, 1, 0)
ContentScroll.BackgroundTransparency = 1
ContentScroll.BorderSizePixel = 0
ContentScroll.ScrollBarThickness = 4
ContentScroll.ScrollBarImageColor3 = Color3.fromRGB(80, 120, 255)
ContentScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
ContentScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
ContentScroll.Parent = Content

local ContentLayout = Instance.new("UIListLayout")
ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
ContentLayout.Padding = UDim.new(0, 6)
ContentLayout.Parent = ContentScroll

-- // HELPER: Create Toggle Button // --
local function CreateToggle(name, order, default, callback)
    local frame = Instance.new("Frame")
    frame.Name = name .. "Frame"
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.BackgroundColor3 = Color3.fromRGB(28, 28, 42)
    frame.BorderSizePixel = 0
    frame.LayoutOrder = order
    frame.Parent = ContentScroll
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.6, 0, 1, 0)
    label.Position = UDim2.new(0.05, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(200, 210, 240)
    label.Font = Enum.Font.Gotham
    label.TextSize = IsMobile and 12 or 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Name = name .. "Toggle"
    toggleBtn.Size = UDim2.new(0, 56, 0, 26)
    toggleBtn.Position = UDim2.new(1, -66, 0.5, -13)
    toggleBtn.BackgroundColor3 = default and Color3.fromRGB(60, 180, 100) or Color3.fromRGB(60, 60, 80)
    toggleBtn.BorderSizePixel = 0
    toggleBtn.Text = default and "ON" or "OFF"
    toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.TextSize = 11
    toggleBtn.Parent = frame
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 13)
    toggleCorner.Parent = toggleBtn
    
    local toggled = default
    toggleBtn.MouseButton1Click:Connect(function()
        toggled = not toggled
        toggleBtn.BackgroundColor3 = toggled and Color3.fromRGB(60, 180, 100) or Color3.fromRGB(60, 60, 80)
        toggleBtn.Text = toggled and "ON" or "OFF"
        callback(toggled)
    end)
    
    return frame, toggleBtn
end

-- // HELPER: Create Section Header // --
local function CreateSectionHeader(title, order)
    local label = Instance.new("TextLabel")
    label.Name = title .. "Header"
    label.Size = UDim2.new(1, 0, 0, 28)
    label.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    label.BorderSizePixel = 0
    label.Text = "  " .. title
    label.TextColor3 = Color3.fromRGB(100, 150, 255)
    label.Font = Enum.Font.GothamBold
    label.TextSize = IsMobile and 11 or 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.LayoutOrder = order
    label.Parent = ContentScroll
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = label
    
    return label
end

-- // HELPER: Create Action Button // --
local function CreateActionButton(name, order, color, callback)
    local btn = Instance.new("TextButton")
    btn.Name = name .. "Btn"
    btn.Size = UDim2.new(1, 0, 0, 36)
    btn.BackgroundColor3 = color
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = IsMobile and 12 or 13
    btn.LayoutOrder = order
    btn.Parent = ContentScroll
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- // BUILD THE GUI SECTIONS // --

-- Stats Section
CreateSectionHeader("📊 STATS", 1)

local StatsFrame = Instance.new("Frame")
StatsFrame.Name = "StatsFrame"
StatsFrame.Size = UDim2.new(1, 0, 0, 50)
StatsFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 42)
StatsFrame.BorderSizePixel = 0
StatsFrame.LayoutOrder = 2
StatsFrame.Parent = ContentScroll

local statsCorner = Instance.new("UICorner")
statsCorner.CornerRadius = UDim.new(0, 8)
statsCorner.Parent = StatsFrame

local StatsLabel = Instance.new("TextLabel")
StatsLabel.Name = "StatsText"
StatsLabel.Size = UDim2.new(1, -16, 1, 0)
StatsLabel.Position = UDim2.new(0, 8, 0, 0)
StatsLabel.BackgroundTransparency = 1
StatsLabel.Text = "Rocks Mined: 0 | Sells: 0 | Target: None"
StatsLabel.TextColor3 = Color3.fromRGB(180, 200, 230)
StatsLabel.Font = Enum.Font.Gotham
StatsLabel.TextSize = IsMobile and 10 or 11
StatsLabel.TextXAlignment = Enum.TextXAlignment.Left
StatsLabel.TextWrapped = true
StatsLabel.Parent = StatsFrame

function UpdateStats()
    local targetText = State.CurrentTarget or "None"
    StatsLabel.Text = "Rocks Mined: " .. State.FarmCount .. " | Sells: " .. State.SellCount .. " | Target: " .. targetText
end

-- Auto Farm Section
CreateSectionHeader("⛏️ AUTO FARM", 3)

CreateToggle("Auto Farm Rocks", 4, false, function(val)
    Config.AutoFarmEnabled = val
    if val then
        StartAutoFarm()
    else
        StopAutoFarm()
    end
end)

-- Auto Sell Section
CreateSectionHeader("💰 AUTO SELL", 5)

CreateToggle("Auto Sell", 6, false, function(val)
    Config.AutoSellEnabled = val
    if val then
        StartAutoSell()
    else
        StopAutoSell()
    end
end)

-- Auto Detect Shops
CreateToggle("Auto Detect Shops", 7, true, function(val)
    Config.AutoDetectShops = val
    if val then
        DetectShops()
    end
end)

-- Detected Shops List
CreateSectionHeader("🏪 DETECTED SHOPS", 8)

ShopList = Instance.new("ScrollingFrame")
ShopList.Name = "ShopList"
ShopList.Size = UDim2.new(1, 0, 0, 100)
ShopList.BackgroundColor3 = Color3.fromRGB(22, 22, 35)
ShopList.BorderSizePixel = 0
ShopList.ScrollBarThickness = 3
ShopList.ScrollBarImageColor3 = Color3.fromRGB(80, 120, 255)
ShopList.CanvasSize = UDim2.new(0, 0, 0, 0)
ShopList.AutomaticCanvasSize = Enum.AutomaticSize.Y
ShopList.LayoutOrder = 9
ShopList.Parent = ContentScroll

local shopCorner = Instance.new("UICorner")
shopCorner.CornerRadius = UDim.new(0, 6)
shopCorner.Parent = ShopList

local shopLayout = Instance.new("UIListLayout")
shopLayout.SortOrder = Enum.SortOrder.LayoutOrder
shopLayout.Padding = UDim.new(0, 3)
shopLayout.Parent = ShopList

local shopPadding = Instance.new("UIPadding")
shopPadding.PaddingTop = UDim.new(0, 3)
shopPadding.PaddingBottom = UDim.new(0, 3)
shopPadding.PaddingLeft = UDim.new(0, 3)
shopPadding.PaddingRight = UDim.new(0, 3)
shopPadding.Parent = ShopList

-- Detected Rocks List
CreateSectionHeader("🪨 DETECTED ROCKS", 10)

RockList = Instance.new("ScrollingFrame")
RockList.Name = "RockList"
RockList.Size = UDim2.new(1, 0, 0, 100)
RockList.BackgroundColor3 = Color3.fromRGB(22, 22, 35)
RockList.BorderSizePixel = 0
RockList.ScrollBarThickness = 3
RockList.ScrollBarImageColor3 = Color3.fromRGB(80, 120, 255)
RockList.CanvasSize = UDim2.new(0, 0, 0, 0)
RockList.AutomaticCanvasSize = Enum.AutomaticSize.Y
RockList.LayoutOrder = 11
RockList.Parent = ContentScroll

local rockCorner = Instance.new("UICorner")
rockCorner.CornerRadius = UDim.new(0, 6)
rockCorner.Parent = RockList

local rockLayout = Instance.new("UIListLayout")
rockLayout.SortOrder = Enum.SortOrder.LayoutOrder
rockLayout.Padding = UDim.new(0, 3)
rockLayout.Parent = RockList

local rockPadding = Instance.new("UIPadding")
rockPadding.PaddingTop = UDim.new(0, 3)
rockPadding.PaddingBottom = UDim.new(0, 3)
rockPadding.PaddingLeft = UDim.new(0, 3)
rockPadding.PaddingRight = UDim.new(0, 3)
rockPadding.Parent = RockList

-- // DISCORD WEBHOOK GUI SECTION // --
CreateSectionHeader("🔔 DISCORD WEBHOOK", 20)

-- Webhook Enable Toggle
CreateToggle("Webhook Enabled", 21, false, function(val)
    Config.WebhookEnabled = val
    if val and Config.WebhookURL ~= "" then
        AddLog("Discord webhook enabled!")
    elseif val and Config.WebhookURL == "" then
        AddLog("Set webhook URL first!")
    else
        AddLog("Discord webhook disabled")
    end
end)

-- Webhook URL Input
local WebhookURLFrame = Instance.new("Frame")
WebhookURLFrame.Name = "WebhookURLFrame"
WebhookURLFrame.Size = UDim2.new(1, 0, 0, 40)
WebhookURLFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 42)
WebhookURLFrame.BorderSizePixel = 0
WebhookURLFrame.LayoutOrder = 22
WebhookURLFrame.Parent = ContentScroll

local webhookCorner = Instance.new("UICorner")
webhookCorner.CornerRadius = UDim.new(0, 8)
webhookCorner.Parent = WebhookURLFrame

local WebhookURLLabel = Instance.new("TextLabel")
WebhookURLLabel.Size = UDim2.new(0.3, 0, 1, 0)
WebhookURLLabel.Position = UDim2.new(0.03, 0, 0, 0)
WebhookURLLabel.BackgroundTransparency = 1
WebhookURLLabel.Text = "URL:"
WebhookURLLabel.TextColor3 = Color3.fromRGB(200, 210, 240)
WebhookURLLabel.Font = Enum.Font.Gotham
WebhookURLLabel.TextSize = IsMobile and 11 or 12
WebhookURLLabel.TextXAlignment = Enum.TextXAlignment.Left
WebhookURLLabel.Parent = WebhookURLFrame

local WebhookURLBox = Instance.new("TextBox")
WebhookURLBox.Name = "WebhookURLBox"
WebhookURLBox.Size = UDim2.new(0.65, 0, 0.7, 0)
WebhookURLBox.Position = UDim2.new(0.32, 0, 0.15, 0)
WebhookURLBox.BackgroundColor3 = Color3.fromRGB(18, 18, 30)
WebhookURLBox.BorderSizePixel = 0
WebhookURLBox.PlaceholderText = "https://discord.com/api/webhooks/..."
WebhookURLBox.Text = ""
WebhookURLBox.TextColor3 = Color3.fromRGB(200, 200, 200)
WebhookURLBox.PlaceholderColor3 = Color3.fromRGB(80, 80, 100)
WebhookURLBox.Font = Enum.Font.Gotham
WebhookURLBox.TextSize = IsMobile and 9 or 10
WebhookURLBox.TextXAlignment = Enum.TextXAlignment.Left
WebhookURLBox.ClearTextOnFocus = false
WebhookURLBox.Parent = WebhookURLFrame

local urlBoxCorner = Instance.new("UICorner")
urlBoxCorner.CornerRadius = UDim.new(0, 6)
urlBoxCorner.Parent = WebhookURLBox

WebhookURLBox.FocusLost:Connect(function()
    Config.WebhookURL = WebhookURLBox.Text
    if Config.WebhookURL ~= "" then
        AddLog("Webhook URL saved!")
    end
end)

-- Webhook toggle options
CreateToggle("Send Farm Logs", 23, true, function(val)
    Config.WebhookSendFarms = val
end)

CreateToggle("Send Sell Logs", 24, true, function(val)
    Config.WebhookSendSells = val
end)

CreateToggle("Send Periodic Stats", 25, true, function(val)
    Config.WebhookSendStats = val
end)

-- Webhook action buttons
CreateActionButton("🧪 Test Webhook", 26, Color3.fromRGB(88, 101, 242), function()
    if Config.WebhookURL == "" then
        AddLog("Set webhook URL first!")
        return
    end
    Config.WebhookEnabled = true
    QueueWebhook({
        title = "🧪 Test Webhook",
        description = "Minea Mountain v5 webhook connection successful!",
        color = 5763719,
        fields = {
            {name = "Player", value = LocalPlayer.Name, inline = true},
            {name = "Game", value = game.Name, inline = true},
        },
        footer = {text = "Minea Mountain v5"},
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
    })
    AddLog("Test webhook sent!")
end)

CreateActionButton("📊 Send Stats Now", 27, Color3.fromRGB(3447003), function()
    if Config.WebhookURL == "" then
        AddLog("Set webhook URL first!")
        return
    end
    Config.WebhookEnabled = true
    SendStatsToDiscord()
    AddLog("Stats sent to Discord!")
end)

-- Build / Action Buttons Section
CreateSectionHeader("🔨 ACTIONS", 30)

CreateActionButton("🔍 Scan Rocks & Shops", 31, Color3.fromRGB(50, 90, 160), function()
    DetectRocksForList()
    DetectShops()
end)

CreateActionButton("⛏️ Farm Nearest Rock", 32, Color3.fromRGB(40, 120, 70), function()
    local rocks = GetAllRocks()
    if #rocks > 0 then
        MineRock(rocks[1])
    else
        AddLog("No rocks found nearby!")
    end
end)

CreateActionButton("💰 Sell at Nearest Shop", 33, Color3.fromRGB(140, 100, 40), function()
    local shops = GetAllShops()
    if #shops > 0 then
        SellItems(shops[1])
    else
        AddLog("No shops found!")
    end
end)

CreateActionButton("🏪 Teleport to Nearest Shop", 34, Color3.fromRGB(100, 50, 150), function()
    local shops = GetAllShops()
    if #shops > 0 then
        TeleportTo(shops[1].Part.Position)
        AddLog("Teleported to: " .. shops[1].Name)
    else
        AddLog("No shops found!")
    end
end)

CreateActionButton("🪨 Teleport to Nearest Rock", 35, Color3.fromRGB(50, 80, 50), function()
    local rocks = GetAllRocks()
    if #rocks > 0 then
        TeleportTo(rocks[1].Part.Position)
        AddLog("Teleported to: " .. rocks[1].Name)
    else
        AddLog("No rocks found nearby!")
    end
end)

-- Log Section
CreateSectionHeader("📋 LOG", 40)

LogList = Instance.new("ScrollingFrame")
LogList.Name = "LogList"
LogList.Size = UDim2.new(1, 0, 0, 110)
LogList.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
LogList.BorderSizePixel = 0
LogList.ScrollBarThickness = 3
LogList.ScrollBarImageColor3 = Color3.fromRGB(80, 120, 255)
LogList.CanvasSize = UDim2.new(0, 0, 0, 0)
LogList.AutomaticCanvasSize = Enum.AutomaticSize.Y
LogList.LayoutOrder = 41
LogList.Parent = ContentScroll

local logCorner = Instance.new("UICorner")
logCorner.CornerRadius = UDim.new(0, 6)
logCorner.Parent = LogList

local logLayout = Instance.new("UIListLayout")
logLayout.SortOrder = Enum.SortOrder.LayoutOrder
logLayout.Parent = LogList

local logPadding = Instance.new("UIPadding")
logPadding.PaddingTop = UDim.new(0, 4)
logPadding.PaddingLeft = UDim.new(0, 4)
logPadding.PaddingRight = UDim.new(0, 4)
logPadding.Parent = LogList

-- // MINIMIZE / EXPAND LOGIC // --
MinimizeBtn.MouseButton1Click:Connect(function()
    State.IsMinimized = true
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local tween = TweenService:Create(MainFrame, tweenInfo, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.04, 0, 0.04, 0),
    })
    tween:Play()
    tween.Completed:Connect(function()
        MainFrame.Visible = false
        MinimizedFrame.Visible = true
        
        MinimizedFrame.Size = UDim2.new(0, 0, 0, 0)
        local expandTween = TweenService:Create(MinimizedFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = MinimizedSize,
        })
        expandTween:Play()
    end)
end)

ExpandBtn.MouseButton1Click:Connect(function()
    State.IsMinimized = false
    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local tween = TweenService:Create(MinimizedFrame, tweenInfo, {
        Size = UDim2.new(0, 0, 0, 0),
    })
    tween:Play()
    tween.Completed:Connect(function()
        MinimizedFrame.Visible = false
        MainFrame.Visible = true
        
        MainFrame.Size = UDim2.new(0, 0, 0, 0)
        local expandTween = TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = GUIWidth,
        })
        expandTween:Play()
    end)
end)

-- // DRAGGING (Mobile + Desktop) // --
local dragging = false
local dragInput
local dragStart
local startPos

local function UpdateDrag(input)
    local delta = input.Position - dragStart
    local target = State.IsMinimized and MinimizedFrame or MainFrame
    target.Position = UDim2.new(
        startPos.X.Scale, startPos.X.Offset + delta.X,
        startPos.Y.Scale, startPos.Y.Offset + delta.Y
    )
end

local function SetupDrag(frame)
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            UpdateDrag(input)
        end
    end)
end

SetupDrag(Header)
SetupDrag(MinimizedFrame)

-- // AUTO DETECT SHOPS PERIODICALLY // --
task.spawn(function()
    while true do
        task.wait(10)
        if Config.AutoDetectShops then
            pcall(DetectShops)
        end
        pcall(DetectRocksForList)
    end
end)

-- // HANDLE RESPAWN // --
LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    HumanoidRootPart = char:WaitForChild("HumanoidRootPart")
    Humanoid = char:WaitForChild("Humanoid")
    AddLog("Character respawned")
end)

-- // HANDLE SCREEN RESIZE (Mobile rotation etc.) // --
Workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
    local newSize = Workspace.CurrentCamera.ViewportSize
    local isMob = newSize.X < 800
    GUIWidth = isMob and UDim2.new(0.92, 0, 0, 460) or UDim2.new(0, 340, 0, 520)
    if not State.IsMinimized then
        MainFrame.Size = GUIWidth
    end
end)

-- // INITIAL LOG // --
AddLog("Minea Mountain v5 Loaded!")
AddLog("Discord Webhook section added")
AddLog("Tap 'Scan Rocks & Shops' to start")
AddLog("Or enable Auto Farm toggles")

-- Initial scan
task.delay(2, function()
    pcall(DetectShops)
    pcall(DetectRocksForList)
end)

-- Send startup notification to Discord
task.delay(3, function()
    if Config.WebhookEnabled and Config.WebhookURL ~= "" then
        SendStartupLogToDiscord()
    end
end)
