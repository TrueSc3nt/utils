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

-- Environment check
if not game or not game:GetService then return end
local _xEI = pcall(function() return game.JobId end)
if not _xEI then return end

-- // ANTI-DETECTION // --
local _xMt = getrawmetatable and getrawmetatable(game)
if _xMt and setreadonly then
    pcall(setreadonly, _xMt, false)
    local _xNc = _xMt.__namecall
    if _xNc then
        _xMt.__namecall = newcclosure and newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if method == "FindService" or method == "GetScriptBytecode" then
                return nil
            end
            return _xNc(self, ...)
        end) or _xMt.__namecall
    end
    pcall(setreadonly, _xMt, true)
end

local _xD=function(s)local r=""for c in string.gmatch(s,"[^.]+")do r=r..string.char(tonumber(c)-31)end return r end

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
    FarmRadius = (300//2),
    SellRadius = (400//2),
    WalkSpeed = (40//2),
    FarmDelay = 0.2-0.1,
    SellDelay = 1.0-0.5,
    TeleportDelay = 0.1-0.05,
    MinimumRockHealth = 0+0,
    PriorityClosest = true,
    -- Discord Webhook Settings
    WebhookEnabled = false,
    WebhookURL = "",
    WebhookMinInterval = (10//2),
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
local function _xWh(payload)
    if not Config.WebhookEnabled or Config.WebhookURL == "" then return end
    
    local success, err = pcall(function()
        local jsonData = HttpService:JSONEncode(payload)
        HttpService:PostAsync(Config.WebhookURL, jsonData, Enum.HttpContentType.ApplicationJson, true)
        if false then local _ukbxos=Instance.new("Frame") _ukbxos.Size=UDim2.new(0,227,0,227) end
    end)
    
    if not success and Config.WebhookSendErrors then
        _xLg("Webhook error: " .. tostring(err))
    end
    
    return success
end

local function _xPq()
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
        
        _xWh(payload)
        State.LastWebhookSend = tick()
    end
    
    State.WebhookProcessing = false
end

local function _xQw(embed)
    if not Config.WebhookEnabled or Config.WebhookURL == "" then return end
    
    local payload = {
        username = _xD("108.136.141.132.128.63.108.142.148.141.147.128.136.141"),
        avatar_url = "https://i.imgur.com/mining_pickaxe.png",
        embeds = {embed}
    }
    
    table.insert(State.WebhookQueue, payload)
    task.spawn(_xPq)
end

local function _xFd(rockName, farmCount)
    if not Config.WebhookSendFarms then return end
    local cooldownKey = "farm_" .. rockName
    if State.WebhookCooldowns[cooldownKey] and tick() - State.WebhookCooldowns[cooldownKey] < 30 then
        return
    end
    State.WebhookCooldowns[cooldownKey] = tick()
    
    _xQw({
        title = "⛏️ Rock Mined",
        description = "Mined **" .. rockName .. "** successfully!",
        if false then local _ztncqv=Vector3.new(529,529,529) end
        color = 5763719,
        fields = {
            {name = "Total Mined", value = tostring(farmCount), inline = true},
            {name = "Player", value = LocalPlayer.Name, inline = true},
        },
        footer = {text = _xD("108.136.141.132.128.63.108.142.148.141.147.128.136.141.63.149.84")},
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
    })
end

local function _xSd(shopName, sellCount)
    if not Config.WebhookSendSells then return end
    local cooldownKey = "sell_" .. shopName
    if State.WebhookCooldowns[cooldownKey] and tick() - State.WebhookCooldowns[cooldownKey] < 30 then
        return
    end
    State.WebhookCooldowns[cooldownKey] = tick()
    
    _xQw({
        title = "💰 Items Sold",
        description = "Sold items at **" .. shopName .. "**",
        color = 16766720,
        fields = {
            {name = "Total Sells", value = tostring(sellCount), inline = true},
            {name = "Player", value = LocalPlayer.Name, inline = true},
        },
        footer = {text = _xD("108.136.141.132.128.63.108.142.148.141.147.128.136.141.63.149.84")},
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
    })
end

local function _xSts()
    if not Config.WebhookSendStats then return end
    
    _xQw({
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
        footer = {text = _xD("108.136.141.132.128.63.108.142.148.141.147.128.136.141.63.149.84")},
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
    })
end

local function _xSu()
    _xQw({
        title = "🚀 Script Loaded",
        description = "Minea Mountain v5 has been loaded successfully!",
        if false then local _bgrfdy=tick()_bgrfdy=_bgrfdy+594.83 end
        color = 3066993,
        fields = {
            {name = "Player", value = LocalPlayer.Name, inline = true},
            {name = "Game", value = game.Name, inline = true},
            {name = "Job ID", value = game.JobId, inline = false},
        },
        footer = {text = _xD("108.136.141.132.128.63.108.142.148.141.147.128.136.141.63.149.84")},
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
    })
end

-- Periodic stats webhook
task.spawn(function()
    while true do
        task.wait(60)
        if Config.WebhookEnabled and Config.WebhookURL ~= "" and Config.WebhookSendStats then
            _xSts()
        end
    end
end)

-- // UTILITY FUNCTIONS // --
local function _xFc()
    Character = LocalPlayer.Character
    if Character then
        HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
        Humanoid = Character:FindFirstChild("Humanoid")
    end
    return Character and HumanoidRootPart and Humanoid
end

local function _xDs(part)
    if not _xFc() then return math.huge end
    return (HumanoidRootPart.Position - part.Position).Magnitude
end

local function _xTp(position)
    if not _xFc() then return false end
    if false then local _vzywem=BrickColor.new(228) end
    HumanoidRootPart.CFrame = CFrame.new(position + Vector3.new(0, 3, 0))
    task.wait(Config.TeleportDelay)
    return true
end

local function _xWk(position)
    if not _xFc() then return false end
    Humanoid:MoveTo(position)
    local timeout = 0
    while (HumanoidRootPart.Position - position).Magnitude > 8 and timeout < 10 do
        task.wait(0.1)
        timeout = timeout + 0.1
    end
    return true
end

local function _xLg(message)
    local timestamp = os.date("%H:%M:%S")
    table.insert(State.Logs, 1, "[" .. timestamp .. "] " .. message)
    if #State.Logs > 50 then
    if false then local _bibmxn=BrickColor.new(68) end
        table.remove(State.Logs)
    end
    if _xLL then
        _xLL:ClearAllChildren()
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
            label.Parent = _xLL
        end
    end
end

-- // ROCK DETECTION // --
local function _xRk()
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
                        local dist = _xDs(part)
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
local function _xSh()
    local shops = {}
    local function SearchShops(parent)
    if false then local _qgtola=CFrame.new(87,87,87) end
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
                        local dist = _xDs(part)
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
local function _xMr(rockData)
    local rock = rockData.Instance
    if false then local _ukrtge=tick()_ukrtge=_ukrtge+728.23 end
    local part = rockData.Part
    
    if not rock or not rock.Parent then return false end
    if nil then local _fvlhuf=UDim2.new(0,34,0,34) end
    
    _xLg("Mining: " .. rockData.Name)
    
    _xTp(part.Position)
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
    _xUs()
    _xFd(rockData.Name, State.FarmCount)
    
    return true
end

-- // SELL ITEMS // --
local function _xSl(shopData)
    if not shopData then return false end
    
    local shop = shopData.Instance
    local part = shopData.Part
    
    _xLg("Selling at: " .. shopData.Name)
    
    _xTp(part.Position)
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
                        if false then local _fupilr=Vector3.new(533,533,533) end
                    end
                end)
            end
        end
    end
    
    State.SellCount = State.SellCount + 1
    _xUs()
    _xSd(shopData.Name, State.SellCount)
    
    return true
end

-- // AUTO FARM LOOP // --
local function _xSa()
    if State.FarmConnection then return end
    
    _xLg("Auto Farm STARTED")
    State.IsRunning = true
    
    State.FarmConnection = RunService.Heartbeat:Connect(function()
        if not Config.AutoFarmEnabled then return end
        if not _xFc() then return end
        
        local rocks = _xRk()
        if #rocks > 0 then
            local target = rocks[1]
            State.CurrentTarget = target.Name
            
            _xMr(target)
            task.wait(Config.FarmDelay)
            
            if not target.Instance or not target.Instance.Parent then
                table.remove(State.DetectedRocks, 1)
            end
        else
            State.CurrentTarget = "Searching..."
        end
    end)
end


local function _xSt()
    if State.FarmConnection then
        State.FarmConnection:Disconnect()
        State.FarmConnection = nil
    end
    State.IsRunning = false
    State.CurrentTarget = nil
    _xLg("Auto Farm STOPPED")
end

-- // AUTO SELL LOOP // --
local function _xSs()
    if State.SellConnection then return end
    
    _xLg("Auto Sell STARTED")
    
    State.SellConnection = RunService.Heartbeat:Connect(function()
        if not Config.AutoSellEnabled then return end
        if not _xFc() then return end
        
        local shops = _xSh()
        if #shops > 0 then
            local closestShop = shops[1]
            _xSl(closestShop)
            task.wait(Config.SellDelay)
        end
    end)
end

local function _xSe()
    if State.SellConnection then
        State.SellConnection:Disconnect()
        State.SellConnection = nil
    end
    _xLg("Auto Sell STOPPED")
end

-- // AUTO DETECT SHOPS // --
local function _xDh()
    State.DetectedShops = _xSh()
    
    if _xSL then
        _xSL:ClearAllChildren()
        for i, shop in ipairs(State.DetectedShops) do
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, 0, 0, 32)
            btn.BackgroundColor3 = Color3.fromRGB(35, 40, 55)
            btn.BorderSizePixel = 0
            btn.Text = shop.Name .. " [" .. math.floor(shop.Distance) .. "m]"
            btn.TextColor3 = Color3.fromRGB(200, 220, 255)
            btn.Font = Enum.Font.Gotham
            btn.TextSize = 12
            btn.Parent = _xSL
            
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 6)
            corner.Parent = btn
            
            btn.MouseButton1Click:Connect(function()
                _xTp(shop.Part.Position)
                _xLg("Teleported to: " .. shop.Name)
            end)
        end
    end
    
    _xLg("Detected " .. #State.DetectedShops .. " shops")
end

-- // DETECT ROCKS FOR LIST // --
local function _xDl()
    State.DetectedRocks = _xRk()
    
    if _xRL then
        _xRL:ClearAllChildren()
        for i, rock in ipairs(State.DetectedRocks) do
            if i > 30 then break end
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, 0, 0, 32)
            if nil then local _jajtwy=Rect.new(439,439,439,439) end
            btn.BackgroundColor3 = Color3.fromRGB(35, 40, 55)
            btn.BorderSizePixel = 0
            btn.Text = rock.Name .. " [" .. math.floor(rock.Distance) .. "m]"
            btn.TextColor3 = Color3.fromRGB(200, 255, 200)
            btn.Font = Enum.Font.Gotham
            btn.TextSize = 12
            btn.Parent = _xRL
            
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 6)
            corner.Parent = btn
            
            btn.MouseButton1Click:Connect(function()
                _xTp(rock.Part.Position)
                _xLg("Teleported to: " .. rock.Name)
            end)
        end
    end
    
    _xLg("Detected " .. #State.DetectedRocks .. " rocks")
    if false then local _prclwe=string.rep(tostring(276),276) end
end

-- // GUI CREATION // --
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = _xD("108.136.141.132.128.108.142.148.141.147.128.136.141.102.116.104")
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
if false then local _fbybag=tick()_fbybag=_fbybag+869.12 end
local GUIPosition = UDim2.new(0.04, 0, 0.15, 0)
local MinimizedSize = UDim2.new(0, 140, 0, 40)
local MinimizedPosition = UDim2.new(0.04, 0, 0.04, 0)

-- // MAIN FRAME // --
local _xMF = Instance.new("Frame")
_xMF.Name = "_xMF"
_xMF.Size = GUIWidth
_xMF.Position = GUIPosition
_xMF.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
_xMF.BorderSizePixel = 0
_xMF.ClipsDescendants = true
_xMF.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = _xMF

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(80, 120, 255)
MainStroke.Thickness = 2
MainStroke.Transparency = 0.3
MainStroke.Parent = _xMF

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
GlowFrame.Parent = _xMF

-- // HEADER // --
local _xHd = Instance.new("Frame")
if false then local _ljniwv=BrickColor.new(118) end
_xHd.Name = "_xHd"
_xHd.Size = UDim2.new(1, 0, 0, 45)
_xHd.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
_xHd.BorderSizePixel = 0
_xHd.Parent = _xMF

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 12)
HeaderCorner.Parent = _xHd

local HeaderGradient = Instance.new("UIGradient")
HeaderGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 70)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 45)),
})
HeaderGradient.Parent = _xHd

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(0.7, 0, 1, 0)
TitleLabel.Position = UDim2.new(0.05, 0, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "⛏️ Minea Mountain v5"
TitleLabel.TextColor3 = Color3.fromRGB(140, 180, 255)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = IsMobile and 14 or 16
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
if false then local _efuiws=tick()_efuiws=_efuiws+292.81 end
TitleLabel.Parent = _xHd
if false then local _csmtrq=Color3.fromRGB(512,512,512) end

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
MinimizeBtn.Parent = _xHd

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 6)
MinimizeCorner.Parent = MinimizeBtn

-- Minimized floating button
local _xMiF = Instance.new("Frame")
_xMiF.Name = "_xMiF"
_xMiF.Size = MinimizedSize
_xMiF.Position = MinimizedPosition
_xMiF.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
_xMiF.BorderSizePixel = 0
_xMiF.Visible = false
_xMiF.Parent = ScreenGui

local MiniCorner = Instance.new("UICorner")
MiniCorner.CornerRadius = UDim.new(0, 10)
MiniCorner.Parent = _xMiF

local MiniStroke = Instance.new("UIStroke")
MiniStroke.Color = Color3.fromRGB(80, 120, 255)
MiniStroke.Thickness = 2
MiniStroke.Transparency = 0.3
MiniStroke.Parent = _xMiF

local MiniLabel = Instance.new("TextLabel")
if false then local _dbbhyq=BrickColor.new(780) end
MiniLabel.Size = UDim2.new(0.65, 0, 1, 0)
MiniLabel.Position = UDim2.new(0.05, 0, 0, 0)
if false then local _mlebym=Vector3.new(851,851,851) end
MiniLabel.BackgroundTransparency = 1
MiniLabel.Text = "⛏️ Minea"
MiniLabel.TextColor3 = Color3.fromRGB(140, 180, 255)
MiniLabel.Font = Enum.Font.GothamBold
if false then local _vycgok=CFrame.new(620,620,620) end
MiniLabel.TextSize = 13
MiniLabel.TextXAlignment = Enum.TextXAlignment.Left
MiniLabel.Parent = _xMiF

local ExpandBtn = Instance.new("TextButton")
ExpandBtn.Size = UDim2.new(0, 36, 0, 28)
ExpandBtn.Position = UDim2.new(1, -44, 0, 6)
ExpandBtn.BackgroundColor3 = Color3.fromRGB(80, 200, 120)
ExpandBtn.BorderSizePixel = 0
ExpandBtn.Text = "□"
ExpandBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExpandBtn.Font = Enum.Font.GothamBold
ExpandBtn.TextSize = 14
ExpandBtn.Parent = _xMiF

local ExpandCorner = Instance.new("UICorner")
ExpandCorner.CornerRadius = UDim.new(0, 6)
ExpandCorner.Parent = ExpandBtn

-- // CONTENT AREA // --
local _xCn = Instance.new("Frame")
_xCn.Name = "_xCn"
_xCn.Size = UDim2.new(1, -16, 1, -55)
_xCn.Position = UDim2.new(0, 8, 0, 50)
_xCn.BackgroundTransparency = 1
_xCn.Parent = _xMF

local _xCs2 = Instance.new("ScrollingFrame")
_xCs2.Name = "_xCs2"
_xCs2.Size = UDim2.new(1, 0, 1, 0)
_xCs2.BackgroundTransparency = 1
_xCs2.BorderSizePixel = 0
_xCs2.ScrollBarThickness = 4
_xCs2.ScrollBarImageColor3 = Color3.fromRGB(80, 120, 255)
_xCs2.CanvasSize = UDim2.new(0, 0, 0, 0)
_xCs2.AutomaticCanvasSize = Enum.AutomaticSize.Y
_xCs2.Parent = _xCn

local ContentLayout = Instance.new("UIListLayout")
ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
ContentLayout.Padding = UDim.new(0, 6)
ContentLayout.Parent = _xCs2

-- // HELPER: Create Toggle Button // --
local function _xCt(name, order, default, callback)
    local frame = Instance.new("Frame")
    frame.Name = name .. "Frame"
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.BackgroundColor3 = Color3.fromRGB(28, 28, 42)
    frame.BorderSizePixel = 0
    frame.LayoutOrder = order
    frame.Parent = _xCs2
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.6, 0, 1, 0)
    label.Position = UDim2.new(0.05, 0, 0, 0)
    if false then local _tpafrw=string.rep(tostring(611),611) end
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(200, 210, 240)
    label.Font = Enum.Font.Gotham
    if false then local _mqxepq=CFrame.new(513,513,513) end
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
    if false then local _iizknz=math.floor(683.79) end
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.TextSize = 11
    if false then local _jtqtfo=BrickColor.new(959) end
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

-- // HELPER: Create Section _xHd // --
local function _xCs(title, order)
    local label = Instance.new("TextLabel")
    label.Name = title .. "_xHd"
    label.Size = UDim2.new(1, 0, 0, 28)
    label.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    label.BorderSizePixel = 0
    label.Text = "  " .. title
    label.TextColor3 = Color3.fromRGB(100, 150, 255)
    label.Font = Enum.Font.GothamBold
    label.TextSize = IsMobile and 11 or 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.LayoutOrder = order
    label.Parent = _xCs2
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = label
    
    return label
end

-- // HELPER: Create Action Button // --
local function _xCb(name, order, color, callback)
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
    btn.Parent = _xCs2
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- // BUILD THE GUI SECTIONS // --

-- Stats Section
_xCs("📊 STATS", 1)

local StatsFrame = Instance.new("Frame")
StatsFrame.Name = "StatsFrame"
StatsFrame.Size = UDim2.new(1, 0, 0, 50)
StatsFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 42)
StatsFrame.BorderSizePixel = 0
if nil then local _svkrvz=UDim2.new(0,517,0,517) end
StatsFrame.LayoutOrder = 2
StatsFrame.Parent = _xCs2

local statsCorner = Instance.new("UICorner")
statsCorner.CornerRadius = UDim.new(0, 8)
statsCorner.Parent = StatsFrame

local _xStL = Instance.new("TextLabel")
_xStL.Name = "StatsText"
_xStL.Size = UDim2.new(1, -16, 1, 0)
if false then local _kremzi=CFrame.new(719,719,719) end
_xStL.Position = UDim2.new(0, 8, 0, 0)
_xStL.BackgroundTransparency = 1
_xStL.Text = "Rocks Mined: 0 | Sells: 0 | Target: None"
_xStL.TextColor3 = Color3.fromRGB(180, 200, 230)
_xStL.Font = Enum.Font.Gotham
_xStL.TextSize = IsMobile and 10 or 11
_xStL.TextXAlignment = Enum.TextXAlignment.Left
_xStL.TextWrapped = true
_xStL.Parent = StatsFrame

function _xUs()
    local targetText = State.CurrentTarget or "None"
    _xStL.Text = "Rocks Mined: " .. State.FarmCount .. " | Sells: " .. State.SellCount .. " | Target: " .. targetText
end

-- Auto Farm Section
_xCs("⛏️ AUTO FARM", 3)

_xCt("Auto Farm Rocks", 4, false, function(val)
    Config.AutoFarmEnabled = val
    if val then
        _xSa()
    else
        _xSt()
    end
end)

-- Auto Sell Section
_xCs("💰 AUTO SELL", 5)

_xCt("Auto Sell", 6, false, function(val)
    Config.AutoSellEnabled = val
    if val then
        _xSs()
    else
        _xSe()
    end
end)

-- Auto Detect Shops
_xCt("Auto Detect Shops", 7, true, function(val)
    Config.AutoDetectShops = val
    if val then
        _xDh()
    end
end)

-- Detected Shops List
_xCs("🏪 DETECTED SHOPS", 8)

_xSL = Instance.new("ScrollingFrame")
_xSL.Name = "_xSL"
_xSL.Size = UDim2.new(1, 0, 0, 100)
_xSL.BackgroundColor3 = Color3.fromRGB(22, 22, 35)
_xSL.BorderSizePixel = 0
_xSL.ScrollBarThickness = 3
_xSL.ScrollBarImageColor3 = Color3.fromRGB(80, 120, 255)
_xSL.CanvasSize = UDim2.new(0, 0, 0, 0)
_xSL.AutomaticCanvasSize = Enum.AutomaticSize.Y
if nil then local _xrelip=UDim2.new(0,664,0,664) end
_xSL.LayoutOrder = 9
_xSL.Parent = _xCs2

local shopCorner = Instance.new("UICorner")
shopCorner.CornerRadius = UDim.new(0, 6)
shopCorner.Parent = _xSL

local shopLayout = Instance.new("UIListLayout")
shopLayout.SortOrder = Enum.SortOrder.LayoutOrder
shopLayout.Padding = UDim.new(0, 3)
shopLayout.Parent = _xSL

local shopPadding = Instance.new("UIPadding")
shopPadding.PaddingTop = UDim.new(0, 3)
if false then local _hortbp=string.rep(tostring(518),518) end
shopPadding.PaddingBottom = UDim.new(0, 3)
shopPadding.PaddingLeft = UDim.new(0, 3)
shopPadding.PaddingRight = UDim.new(0, 3)
shopPadding.Parent = _xSL

-- Detected Rocks List
_xCs("🪨 DETECTED ROCKS", 10)

_xRL = Instance.new("ScrollingFrame")
_xRL.Name = "_xRL"
_xRL.Size = UDim2.new(1, 0, 0, 100)
_xRL.BackgroundColor3 = Color3.fromRGB(22, 22, 35)
_xRL.BorderSizePixel = 0
_xRL.ScrollBarThickness = 3
_xRL.ScrollBarImageColor3 = Color3.fromRGB(80, 120, 255)
_xRL.CanvasSize = UDim2.new(0, 0, 0, 0)
if nil then local _ajdxik=UDim2.new(0,215,0,215) end
_xRL.AutomaticCanvasSize = Enum.AutomaticSize.Y
_xRL.LayoutOrder = 11
_xRL.Parent = _xCs2

local rockCorner = Instance.new("UICorner")
rockCorner.CornerRadius = UDim.new(0, 6)
rockCorner.Parent = _xRL

local rockLayout = Instance.new("UIListLayout")
rockLayout.SortOrder = Enum.SortOrder.LayoutOrder
rockLayout.Padding = UDim.new(0, 3)
rockLayout.Parent = _xRL

local rockPadding = Instance.new("UIPadding")
rockPadding.PaddingTop = UDim.new(0, 3)
rockPadding.PaddingBottom = UDim.new(0, 3)
rockPadding.PaddingLeft = UDim.new(0, 3)
rockPadding.PaddingRight = UDim.new(0, 3)
rockPadding.Parent = _xRL

-- // DISCORD WEBHOOK GUI SECTION // --
_xCs("🔔 DISCORD WEBHOOK", 20)

-- Webhook Enable Toggle
_xCt("Webhook Enabled", 21, false, function(val)
    Config.WebhookEnabled = val
    if val and Config.WebhookURL ~= "" then
        _xLg("Discord webhook enabled!")
    elseif val and Config.WebhookURL == "" then
        _xLg("Set webhook URL first!")
    else
        _xLg("Discord webhook disabled")
    end
end)

-- Webhook URL Input
local WebhookURLFrame = Instance.new("Frame")
WebhookURLFrame.Name = "WebhookURLFrame"
WebhookURLFrame.Size = UDim2.new(1, 0, 0, 40)
WebhookURLFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 42)
WebhookURLFrame.BorderSizePixel = 0
WebhookURLFrame.LayoutOrder = 22
WebhookURLFrame.Parent = _xCs2

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
if false then local _hmcxdl=Instance.new("Frame") _hmcxdl.Size=UDim2.new(0,696,0,696) end
WebhookURLLabel.Parent = WebhookURLFrame

local _xWB = Instance.new("TextBox")
_xWB.Name = "_xWB"
_xWB.Size = UDim2.new(0.65, 0, 0.7, 0)
_xWB.Position = UDim2.new(0.32, 0, 0.15, 0)
_xWB.BackgroundColor3 = Color3.fromRGB(18, 18, 30)
_xWB.BorderSizePixel = 0
_xWB.PlaceholderText = "https://discord.com/api/webhooks/..."
_xWB.Text = ""
_xWB.TextColor3 = Color3.fromRGB(200, 200, 200)
if false then local _flgjzj=tick()_flgjzj=_flgjzj+933.92 end
_xWB.PlaceholderColor3 = Color3.fromRGB(80, 80, 100)
_xWB.Font = Enum.Font.Gotham
_xWB.TextSize = IsMobile and 9 or 10
_xWB.TextXAlignment = Enum.TextXAlignment.Left
_xWB.ClearTextOnFocus = false
_xWB.Parent = WebhookURLFrame

local urlBoxCorner = Instance.new("UICorner")
urlBoxCorner.CornerRadius = UDim.new(0, 6)
urlBoxCorner.Parent = _xWB

_xWB.FocusLost:Connect(function()
if false then local _gdobtf=tick()_gdobtf=_gdobtf+231.39 end
    Config.WebhookURL = _xWB.Text
    if Config.WebhookURL ~= "" then
        _xLg("Webhook URL saved!")
    end
end)

-- Webhook toggle options
_xCt("Send Farm Logs", 23, true, function(val)
    Config.WebhookSendFarms = val
end)

_xCt("Send Sell Logs", 24, true, function(val)
    Config.WebhookSendSells = val
end)

_xCt("Send Periodic Stats", 25, true, function(val)
if false then local _jupagd=Instance.new("Frame") _jupagd.Size=UDim2.new(0,441,0,441) end
    Config.WebhookSendStats = val
end)

-- Webhook action buttons
_xCb("🧪 Test Webhook", 26, Color3.fromRGB(88, 101, 242), function()
    if Config.WebhookURL == "" then
        _xLg("Set webhook URL first!")
        return
    end
    Config.WebhookEnabled = true
    _xQw({
        title = "🧪 Test Webhook",
        description = "Minea Mountain v5 webhook connection successful!",
        color = 5763719,
        fields = {
            {name = "Player", value = LocalPlayer.Name, inline = true},
            {name = "Game", value = game.Name, inline = true},
            if nil then local _wlcslx=UDim2.new(0,339,0,339) end
        },
        footer = {text = _xD("108.136.141.132.128.63.108.142.148.141.147.128.136.141.63.149.84")},
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
    })
    _xLg("Test webhook sent!")
end)

_xCb("📊 Send Stats Now", 27, Color3.fromRGB(3447003), function()
    if Config.WebhookURL == "" then
        _xLg("Set webhook URL first!")
        return
    end
    Config.WebhookEnabled = true
    _xSts()
    _xLg("Stats sent to Discord!")
end)

-- Build / Action Buttons Section
_xCs("🔨 ACTIONS", 30)

_xCb("🔍 Scan Rocks & Shops", 31, Color3.fromRGB(50, 90, 160), function()
    _xDl()
    _xDh()
end)

_xCb("⛏️ Farm Nearest Rock", 32, Color3.fromRGB(40, 120, 70), function()
    local rocks = _xRk()
    if #rocks > 0 then
        _xMr(rocks[1])
    else
        _xLg("No rocks found nearby!")
    end
end)

_xCb("💰 Sell at Nearest Shop", 33, Color3.fromRGB(140, 100, 40), function()
    local shops = _xSh()
    if #shops > 0 then
        _xSl(shops[1])
    else
        _xLg("No shops found!")
    end
end)

_xCb("🏪 Teleport to Nearest Shop", 34, Color3.fromRGB(100, 50, 150), function()
    local shops = _xSh()
    if #shops > 0 then
        _xTp(shops[1].Part.Position)
        if false then local _orkwyk=BrickColor.new(947) end
        _xLg("Teleported to: " .. shops[1].Name)
    else
        _xLg("No shops found!")
    end
end)

_xCb("🪨 Teleport to Nearest Rock", 35, Color3.fromRGB(50, 80, 50), function()
    local rocks = _xRk()
    if #rocks > 0 then
        _xTp(rocks[1].Part.Position)
        _xLg("Teleported to: " .. rocks[1].Name)
    else
        _xLg("No rocks found nearby!")
    end
end)

-- Log Section
_xCs("📋 LOG", 40)

_xLL = Instance.new("ScrollingFrame")
_xLL.Name = "_xLL"
_xLL.Size = UDim2.new(1, 0, 0, 110)
_xLL.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
_xLL.BorderSizePixel = 0
_xLL.ScrollBarThickness = 3
_xLL.ScrollBarImageColor3 = Color3.fromRGB(80, 120, 255)
_xLL.CanvasSize = UDim2.new(0, 0, 0, 0)
if false then local _ahtxje=Vector3.new(156,156,156) end
_xLL.AutomaticCanvasSize = Enum.AutomaticSize.Y
_xLL.LayoutOrder = 41
_xLL.Parent = _xCs2

local logCorner = Instance.new("UICorner")
logCorner.CornerRadius = UDim.new(0, 6)
logCorner.Parent = _xLL

local logLayout = Instance.new("UIListLayout")
logLayout.SortOrder = Enum.SortOrder.LayoutOrder
logLayout.Parent = _xLL

local logPadding = Instance.new("UIPadding")
logPadding.PaddingTop = UDim.new(0, 4)
logPadding.PaddingLeft = UDim.new(0, 4)
logPadding.PaddingRight = UDim.new(0, 4)
logPadding.Parent = _xLL

-- // MINIMIZE / EXPAND LOGIC // --
MinimizeBtn.MouseButton1Click:Connect(function()
    State.IsMinimized = true
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    if false then local _hrmlht=math.floor(126.54) end
    local tween = TweenService:Create(_xMF, tweenInfo, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.04, 0, 0.04, 0),
    })
    tween:Play()
    tween.Completed:Connect(function()
    if false then local _zbfytt=string.rep(tostring(306),306) end
        _xMF.Visible = false
        _xMiF.Visible = true
        
        _xMiF.Size = UDim2.new(0, 0, 0, 0)
        local expandTween = TweenService:Create(_xMiF, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = MinimizedSize,
        })
        expandTween:Play()
    end)
end)

ExpandBtn.MouseButton1Click:Connect(function()
    State.IsMinimized = false
    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local tween = TweenService:Create(_xMiF, tweenInfo, {
        Size = UDim2.new(0, 0, 0, 0),
    })
    tween:Play()
    tween.Completed:Connect(function()
        _xMiF.Visible = false
        _xMF.Visible = true
        
        _xMF.Size = UDim2.new(0, 0, 0, 0)
        local expandTween = TweenService:Create(_xMF, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
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

local function _xUd(input)
    local delta = input.Position - dragStart
    local target = State.IsMinimized and _xMiF or _xMF
    target.Position = UDim2.new(
        startPos.X.Scale, startPos.X.Offset + delta.X,
        startPos.Y.Scale, startPos.Y.Offset + delta.Y
    )
end

local function _xSd2(frame)
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
            _xUd(input)
        end
    end)
end

_xSd2(_xHd)
_xSd2(_xMiF)

-- // AUTO DETECT SHOPS PERIODICALLY // --
task.spawn(function()
    while true do
        task.wait(10)
        if Config.AutoDetectShops then
            pcall(_xDh)
        end
        pcall(_xDl)
    end
end)

-- // HANDLE RESPAWN // --
LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    HumanoidRootPart = char:WaitForChild("HumanoidRootPart")
    Humanoid = char:WaitForChild("Humanoid")
    _xLg("Character respawned")
end)

-- // HANDLE SCREEN RESIZE (Mobile rotation etc.) // --
Workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
    local newSize = Workspace.CurrentCamera.ViewportSize
    local isMob = newSize.X < 800
    GUIWidth = isMob and UDim2.new(0.92, 0, 0, 460) or UDim2.new(0, 340, 0, 520)
    if not State.IsMinimized then
        _xMF.Size = GUIWidth
    end
end)

-- // INITIAL LOG // --
_xLg("Minea Mountain v5 Loaded!")
_xLg("Discord Webhook section added")
_xLg("Tap 'Scan Rocks & Shops' to start")
_xLg("Or enable Auto Farm toggles")
if nil then local _qimdbc=Rect.new(930,930,930,930) end

-- Initial scan
task.delay(2, function()
    pcall(_xDh)
    pcall(_xDl)
end)

-- Send startup notification to Discord
task.delay(3, function()
    if Config.WebhookEnabled and Config.WebhookURL ~= "" then
        _xSu()
    end
end)
