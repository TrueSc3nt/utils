--[[
    ██╗███╗   ██╗██╗████████╗ █████╗ ██╗     ██╗███████╗██████╗ 
    ██║████╗  ██║██║╚══██╔══╝██╔══██╗██║     ██║██╔════╝██╔══██╗
    ██║██╔██╗ ██║██║   ██║   ███████║██║     ██║█████╗  ██║  ██║
    ██║██║╚██╗██║██║   ██║   ██╔══██║██║     ██║██╔══╝  ██║  ██║
    ██║██║ ╚████║██║   ██║   ██║  ██║███████╗██║███████╗██████╔╝
    ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝╚══════╝╚═════╝ 
    
    Mine a Mountain ULTIMATE v6
    Features: Auto Farm, Auto Sell, Auto Upgrade, ESP, Unlimited Backpack,
              Unlimited Luck, Remote Exploits, Item Dupe, Anti-Detection,
              Glassmorphism GUI, Mobile-First Design
    
    Compatible: Delta, Synapse X, KRNL, Fluxus, Wave, Codex
    Usage: Execute in any Roblox executor
]]

-- ========== SERVICES ==========
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local Lighting = game:GetService("Lighting")

-- ========== PLAYER ==========
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")

-- ========== CONFIG ==========
local Config = {
    AutoFarm = false,
    AutoSell = false,
    AutoUpgrade = false,
    ESPEnabled = false,
    AntiDamage = false,
    AntiFreeze = false,
    UnlimitedBackpack = false,
    UnlimitedLuck = false,
    SpeedBoost = false,
    Noclip = false,
    FlyEnabled = false,
    FarmRadius = 500,
    SellRadius = 300,
    FarmDelay = 0.05,
    SellDelay = 0.3,
    TeleportDelay = 0.03,
    WalkSpeed = 50,
    JumpPower = 100,
    FlySpeed = 60,
    PriorityClosest = true,
    PriorityHighestValue = false,
    DupeAmount = 1,
    WebhookURL = "",
    WebhookEnabled = false,
    WebhookFarm = true,
    WebhookSell = true,
    WebhookStats = true,
}

-- ========== STATE ==========
local State = {
    FarmConnection = nil,
    SellConnection = nil,
    ESPConnections = {},
    AntiDamageConn = nil,
    NoclipConn = nil,
    FlyConn = nil,
    UpgradeConn = nil,
    IsMinimized = false,
    CurrentTarget = "None",
    FarmCount = 0,
    SellCount = 0,
    DupeCount = 0,
    UpgradeCount = 0,
    TotalEarnings = 0,
    Logs = {},
    ESPHighlights = {},
    RemoteCache = {},
    TabOpen = "Farm",
}

-- ========== ENVIRONMENT CHECK ==========
local IsExecutor = (getgenv ~= nil)
local GetGEnv = IsExecutor and getgenv() or _G
local HasHookMeta = (hookmetamethod ~= nil)
local HasNewCClosure = (newcclosure ~= nil)
local HasRawMeta = (getrawmetatable ~= nil)
local HasSetReadonly = (setreadonly ~= nil)
local HasFireClick = (fireclickdetector ~= nil)
local HasFireProximity = (fireproximityprompt ~= nil)
local HasFireTouch = (firetouchinterest ~= nil)
local HasSetHidden = (sethiddenproperty ~= nil)
local HasSetSimRadius = (setsimulationradius ~= nil)
local HasGetConns = (getconnections ~= nil)
local HasProtectGui = (syn ~= nil and syn.protect_gui ~= nil)
local HasCheckCaller = (checkcaller ~= nil)

-- ========== ANTI-DETECTION ==========
local AntiDetection = {}

do
    -- Hook __namecall to intercept security checks
    if HasHookMeta and HasNewCClosure and HasRawMeta and HasSetReadonly then
        local OldNamecall
        OldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
            local method = getnamecallmethod()
            local args = {...}
            
            -- Block anti-exploit scripts from detecting us
            if method == "FindService" then
                local serviceName = args[1]
                if serviceName == "ExploitService" or serviceName == "CheatService" then
                    return nil
                end
            end
            
            -- Spoof GetScriptBytecode calls (some games check for injected scripts)
            if method == "GetScriptBytecode" then
                if HasCheckCaller and checkcaller() then
                    return OldNamecall(self, ...)
                end
            end
            
            -- Prevent kick
            if method == "Kick" and self == LocalPlayer then
                return nil
            end
            
            return OldNamecall(self, ...)
        end))
        
        -- Hook __index to spoof WalkSpeed and JumpPower checks
        local OldIndex
        OldIndex = hookmetamethod(game, "__index", newcclosure(function(self, key)
            if self == Humanoid then
                if key == "WalkSpeed" and Config.SpeedBoost then
                    return 16
                end
                if key == "JumpPower" and Config.JumpPower > 50 then
                    return 50
                end
            end
            return OldIndex(self, key)
        end))
        
        -- Hook __newindex to allow setting WalkSpeed/JumpPower without detection
        local OldNewIndex
        OldNewIndex = hookmetamethod(game, "__newindex", newcclosure(function(self, key, value)
            if self == Humanoid then
                if key == "WalkSpeed" then
                    if Config.SpeedBoost then
                        return OldNewIndex(self, key, Config.WalkSpeed)
                    end
                end
                if key == "JumpPower" then
                    return OldNewIndex(self, key, value)
                end
            end
            return OldNewIndex(self, key, value)
        end))
    end
    
    -- Anti-kick protection
    if HasHookMeta and HasNewCClosure then
        local oldKick
        oldKick = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if method == "Kick" and self == LocalPlayer then
                return nil
            end
            return oldKick(self, ...)
        end))
    end
end

-- ========== UTILITY FUNCTIONS ==========
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

local function TeleportToCFrame(cframe)
    if not GetCharacter() then return false end
    HumanoidRootPart.CFrame = cframe + Vector3.new(0, 3, 0)
    task.wait(Config.TeleportDelay)
    return true
end

local function AddLog(message)
    local timestamp = os.date("%H:%M:%S")
    table.insert(State.Logs, 1, "[" .. timestamp .. "] " .. message)
    if #State.Logs > 50 then
        table.remove(State.Logs)
    end
    if LogList then
        pcall(function()
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
        end)
    end
end

-- ========== REMOTE EVENT CACHE ==========
local function CacheRemotes()
    State.RemoteCache = {}
    pcall(function()
        for _, remote in ipairs(ReplicatedStorage:GetDescendants()) do
            if remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction") then
                table.insert(State.RemoteCache, {
                    Instance = remote,
                    Name = remote.Name,
                    Type = remote.ClassName,
                })
            end
        end
    end)
    AddLog("Cached " .. #State.RemoteCache .. " remotes")
end

local function FireRemote(namePattern, ...)
    local args = {...}
    for _, remote in ipairs(State.RemoteCache) do
        local rName = string.lower(remote.Name)
        local pattern = string.lower(namePattern)
        if string.find(rName, pattern) then
            pcall(function()
                if remote.Type == "RemoteEvent" then
                    remote.Instance:FireServer(unpack(args))
                elseif remote.Type == "RemoteFunction" then
                    remote.Instance:InvokeServer(unpack(args))
                end
            end)
        end
    end
end

local function FireRemoteExact(name, ...)
    local args = {...}
    for _, remote in ipairs(State.RemoteCache) do
        if remote.Name == name then
            pcall(function()
                if remote.Type == "RemoteEvent" then
                    remote.Instance:FireServer(unpack(args))
                elseif remote.Type == "RemoteFunction" then
                    remote.Instance:InvokeServer(unpack(args))
                end
            end)
            return true
        end
    end
    return false
end

-- ========== ROCK / CRYSTAL DETECTION ==========
local CrystalPatterns = {
    "rock", "ore", "stone", "mineral", "crystal", "gem", "coal", "iron",
    "gold", "diamond", "copper", "silver", "ruby", "emerald", "sapphire",
    "amethyst", "node", "vein", "deposit", "boulder", "starsapphire",
    "topaz", "opal", "pearl", "jade", "quartz", "obsidian", "lapis",
    "mithril", "titanium", "platinum", "peridot", "zircon", "garnet",
    "aquamarine", "citrine", "tanzanite", "moonstone", "sunstone",
    "bloodstone", "onyx", "tourmaline", "spinel", "beryl", "chalcedony",
}

local function GetAllRocks()
    local rocks = {}
    local function SearchRocks(parent)
        if not parent then return end
        for _, child in ipairs(parent:GetChildren()) do
            local nameLower = string.lower(child.Name)
            if child:IsA("BasePart") or child:IsA("Model") then
                local matched = false
                for _, pattern in ipairs(CrystalPatterns) do
                    if string.find(nameLower, pattern) then
                        matched = true
                        break
                    end
                end
                if matched then
                    local part = child:IsA("BasePart") and child or child:FindFirstChildWhichIsA("BasePart")
                    if part then
                        local dist = GetDistance(part)
                        if dist <= Config.FarmRadius then
                            -- Try to get value/price
                            local value = 0
                            pcall(function()
                                local val = child:FindFirstChild("Value") or child:FindFirstChild("Price") or child:FindFirstChild("Worth") or child:FindFirstChild("ValueOverride")
                                if val and val:IsA("ValueBase") then
                                    value = val.Value
                                end
                            end)
                            table.insert(rocks, {
                                Instance = child,
                                Part = part,
                                Distance = dist,
                                Name = child.Name,
                                Value = value,
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
        Workspace:FindFirstChild("Crystals"),
        Workspace:FindFirstChild("Mountain"),
        Workspace,
    }
    
    for _, area in ipairs(searchAreas) do
        if area then
            SearchRocks(area)
        end
    end
    
    -- Sort by priority
    if Config.PriorityHighestValue then
        table.sort(rocks, function(a, b) return a.Value > b.Value end)
    elseif Config.PriorityClosest then
        table.sort(rocks, function(a, b) return a.Distance < b.Distance end)
    end
    
    return rocks
end

-- ========== SHOP DETECTION ==========
local function GetAllShops()
    local shops = {}
    local function SearchShops(parent)
        if not parent then return end
        for _, child in ipairs(parent:GetChildren()) do
            local nameLower = string.lower(child.Name)
            if child:IsA("Model") or child:IsA("BasePart") then
                if string.find(nameLower, "shop") or string.find(nameLower, "sell") or
                   string.find(nameLower, "store") or string.find(nameLower, "merchant") or
                   string.find(nameLower, "trader") or string.find(nameLower, "dealer") or
                   string.find(nameLower, "market") or string.find(nameLower, "vendor") or
                   string.find(nameLower, "cashier") or string.find(nameLower, "buyer") or
                   string.find(nameLower, "npc") or string.find(nameLower, "cash") or
                   string.find(nameLower, "home") or string.find(nameLower, "base") or
                   string.find(nameLower, "camp") then
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

-- ========== MINE ROCK ==========
local function MineRock(rockData)
    local rock = rockData.Instance
    local part = rockData.Part
    
    if not rock or not rock.Parent then return false end
    
    AddLog("Mining: " .. rockData.Name)
    
    -- Teleport to rock
    TeleportTo(part.Position)
    task.wait(0.05)
    
    -- Method 1: Fire click detector
    if HasFireClick then
        local clickDetector = rock:FindFirstChildOfClass("ClickDetector") or part:FindFirstChildOfClass("ClickDetector")
        if clickDetector then
            fireclickdetector(clickDetector)
        end
    end
    
    -- Method 2: Fire proximity prompt
    if HasFireProximity then
        local prompt = rock:FindFirstChildOfClass("ProximityPrompt") or part:FindFirstChildOfClass("ProximityPrompt")
        if prompt then
            fireproximityprompt(prompt)
        end
    end
    
    -- Method 3: Fire touch interest
    if HasFireTouch then
        firetouchinterest(HumanoidRootPart, part, 0)
        task.wait(0.01)
        firetouchinterest(HumanoidRootPart, part, 1)
    end
    
    -- Method 4: Use tool if equipped
    local tool = Character and Character:FindFirstChildOfClass("Tool")
    if tool then
        tool:Activate()
    end
    
    -- Method 5: Fire remote events for mining
    FireRemote("mine")
    FireRemote("harvest")
    FireRemote("collect")
    FireRemote("break")
    FireRemote("gather")
    FireRemote("dig")
    FireRemote("pick")
    FireRemote("swing")
    
    -- Method 6: Direct remote with rock as argument
    for _, remote in ipairs(State.RemoteCache) do
        local rName = string.lower(remote.Name)
        if string.find(rName, "mine") or string.find(rName, "dig") or string.find(rName, "harvest") then
            pcall(function()
                if remote.Type == "RemoteEvent" then
                    remote.Instance:FireServer(rock, part)
                elseif remote.Type == "RemoteFunction" then
                    remote.Instance:InvokeServer(rock, part)
                end
            end)
        end
    end
    
    State.FarmCount = State.FarmCount + 1
    
    return true
end

-- ========== SELL ITEMS ==========
local function SellItems(shopData)
    if not shopData then return false end
    
    local shop = shopData.Instance
    local part = shopData.Part
    
    AddLog("Selling at: " .. shopData.Name)
    
    -- Teleport to shop
    TeleportTo(part.Position)
    task.wait(0.1)
    
    -- Method 1: Click detector
    if HasFireClick then
        local clickDetector = shop:FindFirstChildOfClass("ClickDetector") or part:FindFirstChildOfClass("ClickDetector")
        if clickDetector then
            fireclickdetector(clickDetector)
        end
    end
    
    -- Method 2: Proximity prompt
    if HasFireProximity then
        local prompt = shop:FindFirstChildOfClass("ProximityPrompt") or part:FindFirstChildOfClass("ProximityPrompt")
        if prompt then
            fireproximityprompt(prompt)
        end
    end
    
    -- Method 3: Touch interest
    if HasFireTouch then
        firetouchinterest(HumanoidRootPart, part, 0)
        task.wait(0.01)
        firetouchinterest(HumanoidRootPart, part, 1)
    end
    
    -- Method 4: Fire sell remotes
    FireRemote("sell")
    FireRemote("shop")
    FireRemote("market")
    FireRemote("trade")
    FireRemote("cash")
    FireRemote("money")
    FireRemote("sellall")
    FireRemote("sell_all")
    
    State.SellCount = State.SellCount + 1
    
    return true
end

-- ========== AUTO FARM ==========
local function StartAutoFarm()
    if State.FarmConnection then return end
    AddLog("Auto Farm STARTED")
    
    State.FarmConnection = RunService.Heartbeat:Connect(function()
        if not Config.AutoFarm then return end
        if not GetCharacter() then return end
        
        local rocks = GetAllRocks()
        if #rocks > 0 then
            local target = rocks[1]
            State.CurrentTarget = target.Name
            MineRock(target)
            task.wait(Config.FarmDelay)
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
    State.CurrentTarget = "None"
    AddLog("Auto Farm STOPPED")
end

-- ========== AUTO SELL ==========
local function StartAutoSell()
    if State.SellConnection then return end
    AddLog("Auto Sell STARTED")
    
    State.SellConnection = RunService.Heartbeat:Connect(function()
        if not Config.AutoSell then return end
        if not GetCharacter() then return end
        
        local shops = GetAllShops()
        if #shops > 0 then
            SellItems(shops[1])
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

-- ========== AUTO UPGRADE ==========
local function StartAutoUpgrade()
    if State.UpgradeConn then return end
    AddLog("Auto Upgrade STARTED")
    
    State.UpgradeConn = RunService.Heartbeat:Connect(function()
        if not Config.AutoUpgrade then return end
        
        -- Fire upgrade remotes
        FireRemote("upgrade")
        FireRemote("buy")
        FireRemote("purchase")
        FireRemote("warmth")
        FireRemote("pickaxe")
        FireRemote("backpack")
        FireRemote("speed")
        FireRemote("dig")
        
        State.UpgradeCount = State.UpgradeCount + 1
        task.wait(1)
    end)
end

local function StopAutoUpgrade()
    if State.UpgradeConn then
        State.UpgradeConn:Disconnect()
        State.UpgradeConn = nil
    end
    AddLog("Auto Upgrade STOPPED")
end

-- ========== ESP ==========
local function ClearESP()
    for _, highlight in ipairs(State.ESPHighlights) do
        pcall(function() highlight:Destroy() end)
    end
    State.ESPHighlights = {}
end

local function CreateESP()
    ClearESP()
    
    local rocks = GetAllRocks()
    for _, rock in ipairs(rocks) do
        if rock.Instance and rock.Instance.Parent then
            -- Highlight
            local highlight = Instance.new("Highlight")
            highlight.Name = "ESP_" .. rock.Name
            highlight.FillTransparency = 0.6
            highlight.OutlineTransparency = 0
            highlight.OutlineColor = rock.Value > 0 and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(100, 200, 255)
            highlight.FillColor = rock.Value > 0 and Color3.fromRGB(255, 200, 50) or Color3.fromRGB(80, 150, 255)
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = rock.Instance
            
            -- Billboard label with price
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "ESPLabel"
            billboard.Size = UDim2.new(0, 120, 0, 30)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = rock.Part
            
            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 0.4
            label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            label.Text = rock.Name .. (rock.Value > 0 and (" | $" .. tostring(rock.Value)) or "")
            label.TextColor3 = rock.Value > 0 and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(100, 200, 255)
            label.Font = Enum.Font.GothamBold
            label.TextSize = 11
            label.Parent = billboard
            
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 4)
            corner.Parent = label
            
            table.insert(State.ESPHighlights, highlight)
            table.insert(State.ESPHighlights, billboard)
        end
    end
    
    -- Shop ESP
    local shops = GetAllShops()
    for _, shop in ipairs(shops) do
        if shop.Instance and shop.Instance.Parent then
            local highlight = Instance.new("Highlight")
            highlight.Name = "ESP_Shop_" .. shop.Name
            highlight.FillTransparency = 0.5
            highlight.OutlineTransparency = 0
            highlight.OutlineColor = Color3.fromRGB(0, 255, 100)
            highlight.FillColor = Color3.fromRGB(50, 255, 100)
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = shop.Instance
            
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "ESPShopLabel"
            billboard.Size = UDim2.new(0, 100, 0, 25)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = shop.Part
            
            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 0.4
            label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            label.Text = "SHOP: " .. shop.Name
            label.TextColor3 = Color3.fromRGB(0, 255, 100)
            label.Font = Enum.Font.GothamBold
            label.TextSize = 10
            label.Parent = billboard
            
            table.insert(State.ESPHighlights, highlight)
            table.insert(State.ESPHighlights, billboard)
        end
    end
    
    AddLog("ESP: " .. #rocks .. " rocks, " .. #shops .. " shops")
end

local function StartESP()
    if Config.ESPEnabled then
        CreateESP()
        -- Refresh ESP periodically
        task.spawn(function()
            while Config.ESPEnabled do
                task.wait(5)
                if Config.ESPEnabled then
                    CreateESP()
                end
            end
        end)
    end
end

local function StopESP()
    ClearESP()
end

-- ========== ANTI DAMAGE / ANTI FREEZE ==========
local function StartAntiDamage()
    if State.AntiDamageConn then return end
    AddLog("Anti Damage ENABLED")
    
    State.AntiDamageConn = RunService.Heartbeat:Connect(function()
        if not GetCharacter() then return end
        
        -- Reset health
        if Humanoid and Humanoid.Health < Humanoid.MaxHealth then
            Humanoid.Health = Humanoid.MaxHealth
        end
        
        -- Anti-freeze: Reset warmth-related values
        if Config.AntiFreeze then
            pcall(function()
                -- Try to find warmth attribute or value
                local warmthVal = Character:FindFirstChild("Warmth") or Character:FindFirstChild("Temperature") or Character:FindFirstChild("Cold")
                if warmthVal and warmthVal:IsA("ValueBase") then
                    warmthVal.Value = 100
                end
                
                -- Check for freeze/debuff attributes
                local freezeVal = Character:FindFirstChild("Frozen") or Character:FindFirstChild("IsFrozen") or Character:FindFirstChild("Freezing")
                if freezeVal and freezeVal:IsA("BoolValue") then
                    freezeVal.Value = false
                end
                
                -- Fire anti-freeze remotes
                FireRemote("warmth")
                FireRemote("unfreeze")
                FireRemote("heat")
            end)
        end
    end)
end

local function StopAntiDamage()
    if State.AntiDamageConn then
        State.AntiDamageConn:Disconnect()
        State.AntiDamageConn = nil
    end
    AddLog("Anti Damage DISABLED")
end

-- ========== UNLIMITED BACKPACK ==========
local function ApplyUnlimitedBackpack()
    if not Config.UnlimitedBackpack then return end
    AddLog("Applying Unlimited Backpack...")
    
    pcall(function()
        -- Method 1: Modify backpack capacity values
        local backpackStats = LocalPlayer:FindFirstChild("BackpackCapacity") or LocalPlayer:FindFirstChild("MaxCarry") or LocalPlayer:FindFirstChild("CarryKG")
        if backpackStats and backpackStats:IsA("ValueBase") then
            backpackStats.Value = 999999
        end
        
        -- Method 2: Find in leaderstats
        local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
        if leaderstats then
            for _, stat in ipairs(leaderstats:GetChildren()) do
                local nameLower = string.lower(stat.Name)
                if string.find(nameLower, "backpack") or string.find(nameLower, "carry") or string.find(nameLower, "capacity") or string.find(nameLower, "weight") or string.find(nameLower, "kg") then
                    if stat:IsA("ValueBase") then
                        stat.Value = 999999
                    end
                end
            end
        end
        
        -- Method 3: Fire remotes
        FireRemote("backpack")
        FireRemote("capacity")
        FireRemote("carry")
        FireRemote("upgrade_backpack")
    end)
    
    -- Keep applying
    task.spawn(function()
        while Config.UnlimitedBackpack do
            task.wait(2)
            pcall(function()
                local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
                if leaderstats then
                    for _, stat in ipairs(leaderstats:GetChildren()) do
                        local nameLower = string.lower(stat.Name)
                        if string.find(nameLower, "backpack") or string.find(nameLower, "carry") or string.find(nameLower, "capacity") or string.find(nameLower, "weight") or string.find(nameLower, "kg") then
                            if stat:IsA("ValueBase") then
                                stat.Value = 999999
                            end
                        end
                    end
                end
            end)
        end
    end)
end

-- ========== UNLIMITED LUCK ==========
local function ApplyUnlimitedLuck()
    if not Config.UnlimitedLuck then return end
    AddLog("Applying Unlimited Luck...")
    
    pcall(function()
        -- Method 1: Modify luck values
        local luckVal = LocalPlayer:FindFirstChild("Luck") or LocalPlayer:FindFirstChild("DigLuck") or LocalPlayer:FindFirstChild("MiningLuck")
        if luckVal and luckVal:IsA("ValueBase") then
            luckVal.Value = 999999
        end
        
        -- Method 2: Find in leaderstats
        local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
        if leaderstats then
            for _, stat in ipairs(leaderstats:GetChildren()) do
                local nameLower = string.lower(stat.Name)
                if string.find(nameLower, "luck") then
                    if stat:IsA("ValueBase") then
                        stat.Value = 999999
                    end
                end
            end
        end
        
        -- Method 3: Fire luck remotes
        FireRemote("luck")
        FireRemote("lucky")
        FireRemote("dig_luck")
    end)
    
    -- Keep applying
    task.spawn(function()
        while Config.UnlimitedLuck do
            task.wait(2)
            pcall(function()
                local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
                if leaderstats then
                    for _, stat in ipairs(leaderstats:GetChildren()) do
                        if string.find(string.lower(stat.Name), "luck") and stat:IsA("ValueBase") then
                            stat.Value = 999999
                        end
                    end
                end
            end)
        end
    end)
end

-- ========== ITEM DUPE ==========
local function DupeItems(amount)
    AddLog("Attempting to dupe " .. amount .. " items...")
    
    pcall(function()
        -- Method 1: Fire collect remotes multiple times
        for i = 1, amount do
            FireRemote("collect")
            FireRemote("mine")
            FireRemote("harvest")
            FireRemote("pickup")
            FireRemote("gather")
            FireRemote("loot")
            FireRemote("obtain")
            FireRemote("grant")
            FireRemote("reward")
            task.wait(0.05)
        end
        
        -- Method 2: Direct inventory manipulation
        local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
        if leaderstats then
            for _, stat in ipairs(leaderstats:GetChildren()) do
                local nameLower = string.lower(stat.Name)
                if string.find(nameLower, "crystal") or string.find(nameLower, "ore") or string.find(nameLower, "gem") or string.find(nameLower, "item") then
                    if stat:IsA("NumberValue") or stat:IsA("IntValue") then
                        stat.Value = stat.Value * amount
                    end
                end
            end
        end
        
        -- Method 3: Re-fire sell remote then collect remote (sell-buy loop)
        for i = 1, amount do
            FireRemote("sell")
            task.wait(0.02)
            FireRemote("buy")
            task.wait(0.02)
        end
        
        -- Method 4: Fire with specific item arguments
        local rocks = GetAllRocks()
        if #rocks > 0 then
            local bestRock = rocks[1]
            for i = 1, amount do
                for _, remote in ipairs(State.RemoteCache) do
                    local rName = string.lower(remote.Name)
                    if string.find(rName, "collect") or string.find(rName, "pickup") or string.find(rName, "loot") then
                        pcall(function()
                            if remote.Type == "RemoteEvent" then
                                remote.Instance:FireServer(bestRock.Instance, bestRock.Part)
                            end
                        end)
                    end
                end
                task.wait(0.05)
            end
        end
    end)
    
    State.DupeCount = State.DupeCount + amount
    AddLog("Dupe attempt complete: " .. amount .. "x")
end

-- ========== NOCLIP ==========
local function StartNoclip()
    if State.NoclipConn then return end
    AddLog("Noclip ENABLED")
    
    State.NoclipConn = RunService.Stepped:Connect(function()
        if not Config.Noclip then return end
        if not GetCharacter() then return end
        for _, part in ipairs(Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end)
end

local function StopNoclip()
    if State.NoclipConn then
        State.NoclipConn:Disconnect()
        State.NoclipConn = nil
    end
    AddLog("Noclip DISABLED")
end

-- ========== FLY ==========
local flyBody = nil
local flySpeed = nil

local function StartFly()
    if State.FlyConn then return end
    if not GetCharacter() then return end
    AddLog("Fly ENABLED")
    
    -- Create fly body
    flyBody = Instance.new("BodyVelocity")
    flyBody.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    flyBody.Velocity = Vector3.new(0, 0, 0)
    flyBody.Parent = HumanoidRootPart
    
    flySpeed = Instance.new("BodyGyro")
    flySpeed.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    flySpeed.P = 9e4
    flySpeed.Parent = HumanoidRootPart
    
    State.FlyConn = RunService.RenderStepped:Connect(function()
        if not Config.FlyEnabled then return end
        if not GetCharacter() then return end
        
        local cam = Workspace.CurrentCamera
        local moveDir = Vector3.new(0, 0, 0)
        
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDir = moveDir + cam.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveDir = moveDir - cam.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveDir = moveDir - cam.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDir = moveDir + cam.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            moveDir = moveDir + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            moveDir = moveDir - Vector3.new(0, 1, 0)
        end
        
        if moveDir.Magnitude > 0 then
            moveDir = moveDir.Unit * Config.FlySpeed
        end
        
        flyBody.Velocity = moveDir
        flySpeed.CFrame = cam.CFrame
    end)
end

local function StopFly()
    if State.FlyConn then
        State.FlyConn:Disconnect()
        State.FlyConn = nil
    end
    if flyBody then flyBody:Destroy() flyBody = nil end
    if flySpeed then flySpeed:Destroy() flySpeed = nil end
    AddLog("Fly DISABLED")
end

-- ========== SPEED BOOST ==========
local function ApplySpeedBoost()
    if not GetCharacter() then return end
    if Config.SpeedBoost then
        Humanoid.WalkSpeed = Config.WalkSpeed
    else
        Humanoid.WalkSpeed = 16
    end
end

-- ========== DISCORD WEBHOOK ==========
local WebhookQueue = {}
local WebhookProcessing = false

local function SendWebhook(data)
    if not Config.WebhookEnabled or Config.WebhookURL == "" then return end
    pcall(function()
        HttpService:PostAsync(Config.WebhookURL, HttpService:JSONEncode(data))
    end)
end

local function SendFarmLog(itemName)
    if not Config.WebhookFarm then return end
    SendWebhook({
        content = "**[Minea Mountain]** Mined: " .. itemName .. " | Total: " .. State.FarmCount,
    })
end

local function SendSellLog()
    if not Config.WebhookSell then return end
    SendWebhook({
        content = "**[Minea Mountain]** Sold items | Total sells: " .. State.SellCount,
    })
end

local function SendStatsLog()
    if not Config.WebhookStats then return end
    SendWebhook({
        content = "**[Minea Mountain Stats]** Mined: " .. State.FarmCount .. " | Sells: " .. State.SellCount .. " | Dupes: " .. State.DupeCount .. " | Target: " .. State.CurrentTarget,
    })
end

-- ========== GUI CREATION ==========
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MineaMountainV6"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

if HasProtectGui then
    pcall(function() syn.protect_gui(ScreenGui) end)
end

-- Robust GUI parenting for all executors (Delta/Synapse/KRNL/Fluxus/etc.)
local guiParented = false
-- 1) Try gethui() (Delta, Synapse) - protected container
pcall(function()
    if gethui then
        ScreenGui.Parent = gethui()
        guiParented = true
    end
end)
-- 2) Fall back to CoreGui
if not guiParented then
    pcall(function()
        ScreenGui.Parent = game:GetService("CoreGui")
        guiParented = true
    end)
end
-- 3) Last resort: PlayerGui (always works)
if not guiParented then
    pcall(function()
        ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
        guiParented = true
    end)
end

-- Responsive sizing (compact)
local ViewSize = Workspace.CurrentCamera.ViewportSize
local IsMobile = ViewSize.X < 800
local GUIWidth = IsMobile and UDim2.new(0, 300, 0, 360) or UDim2.new(0, 340, 0, 440)
local MinimizedSize = UDim2.new(0, 140, 0, 38)
local GUIPosition = UDim2.new(0, 12, 0, 60)
local MinimizedPosition = UDim2.new(0, 12, 0, 60)

-- ========== MAIN FRAME (Glassmorphism) ==========
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = GUIWidth
MainFrame.Position = GUIPosition
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
MainFrame.BackgroundTransparency = 0.15
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

-- Glass border glow
local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(90, 130, 255)
MainStroke.Thickness = 1.5
MainStroke.Transparency = 0.2
MainStroke.Parent = MainFrame

-- Blur effect frame (glassmorphism simulation)
local BlurFrame = Instance.new("ImageLabel")
BlurFrame.Name = "GlassBlur"
BlurFrame.Size = UDim2.new(1, 40, 1, 40)
BlurFrame.Position = UDim2.new(0, -20, 0, -20)
BlurFrame.BackgroundTransparency = 1
BlurFrame.Image = "rbxassetid://7669168585"
BlurFrame.ImageColor3 = Color3.fromRGB(50, 80, 200)
BlurFrame.ImageTransparency = 0.75
BlurFrame.ScaleType = Enum.ScaleType.Slice
BlurFrame.SliceCenter = Rect.new(45, 45, 45, 45)
BlurFrame.Parent = MainFrame

-- ========== HEADER ==========
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 48)
Header.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
Header.BackgroundTransparency = 0.1
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 14)
HeaderCorner.Parent = Header

local HeaderGradient = Instance.new("UIGradient")
HeaderGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 35, 65)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(25, 25, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 65)),
})
HeaderGradient.Rotation = 90
HeaderGradient.Parent = Header

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(0.65, 0, 1, 0)
TitleLabel.Position = UDim2.new(0.04, 0, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "⛏ Minea Mountain v6"
TitleLabel.TextColor3 = Color3.fromRGB(130, 170, 255)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = IsMobile and 13 or 15
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = Header

-- Version badge
local VersionBadge = Instance.new("TextLabel")
VersionBadge.Size = UDim2.new(0, 28, 0, 18)
VersionBadge.Position = UDim2.new(0.65, 0, 0.5, -9)
VersionBadge.BackgroundColor3 = Color3.fromRGB(60, 100, 255)
VersionBadge.BorderSizePixel = 0
VersionBadge.Text = "v6"
VersionBadge.TextColor3 = Color3.fromRGB(255, 255, 255)
VersionBadge.Font = Enum.Font.GothamBold
VersionBadge.TextSize = 10
VersionBadge.Parent = Header

local vCorner = Instance.new("UICorner")
vCorner.CornerRadius = UDim.new(0, 9)
vCorner.Parent = VersionBadge

-- Minimize button
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 40, 0, 28)
MinimizeBtn.Position = UDim2.new(1, -48, 0, 10)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
MinimizeBtn.BorderSizePixel = 0
MinimizeBtn.Text = "—"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.TextSize = 14
MinimizeBtn.Parent = Header

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(0, 8)
minCorner.Parent = MinimizeBtn

-- ========== MINIMIZED FRAME ==========
local MinimizedFrame = Instance.new("Frame")
MinimizedFrame.Size = MinimizedSize
MinimizedFrame.Position = MinimizedPosition
MinimizedFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
MinimizedFrame.BackgroundTransparency = 0.15
MinimizedFrame.BorderSizePixel = 0
MinimizedFrame.Visible = false
MinimizedFrame.Parent = ScreenGui

local miniCorner = Instance.new("UICorner")
miniCorner.CornerRadius = UDim.new(0, 12)
miniCorner.Parent = MinimizedFrame

local miniStroke = Instance.new("UIStroke")
miniStroke.Color = Color3.fromRGB(90, 130, 255)
miniStroke.Thickness = 1.5
miniStroke.Transparency = 0.2
miniStroke.Parent = MinimizedFrame

local MiniLabel = Instance.new("TextLabel")
MiniLabel.Size = UDim2.new(0.6, 0, 1, 0)
MiniLabel.Position = UDim2.new(0.06, 0, 0, 0)
MiniLabel.BackgroundTransparency = 1
MiniLabel.Text = "⛏ Minea"
MiniLabel.TextColor3 = Color3.fromRGB(130, 170, 255)
MiniLabel.Font = Enum.Font.GothamBold
MiniLabel.TextSize = 13
MiniLabel.TextXAlignment = Enum.TextXAlignment.Left
MiniLabel.Parent = MinimizedFrame

local ExpandBtn = Instance.new("TextButton")
ExpandBtn.Size = UDim2.new(0, 40, 0, 28)
ExpandBtn.Position = UDim2.new(1, -48, 0, 7)
ExpandBtn.BackgroundColor3 = Color3.fromRGB(60, 200, 100)
ExpandBtn.BorderSizePixel = 0
ExpandBtn.Text = "□"
ExpandBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExpandBtn.Font = Enum.Font.GothamBold
ExpandBtn.TextSize = 14
ExpandBtn.Parent = MinimizedFrame

local expCorner = Instance.new("UICorner")
expCorner.CornerRadius = UDim.new(0, 8)
expCorner.Parent = ExpandBtn

-- ========== TAB BAR ==========
local TabBar = Instance.new("Frame")
TabBar.Name = "TabBar"
TabBar.Size = UDim2.new(1, -12, 0, 32)
TabBar.Position = UDim2.new(0, 6, 0, 52)
TabBar.BackgroundTransparency = 1
TabBar.Parent = MainFrame

local TabLayout = Instance.new("UIListLayout")
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.Padding = UDim.new(0, 3)
TabLayout.Parent = TabBar

local Tabs = {"Farm", "Sell", "ESP", "Exploit", "Misc"}
local TabButtons = {}
local TabFrames = {}

for i, tabName in ipairs(Tabs) do
    local tabBtn = Instance.new("TextButton")
    tabBtn.Name = tabName .. "Tab"
    tabBtn.Size = UDim2.new(0.2, 0, 1, 0)
    tabBtn.BackgroundColor3 = (tabName == "Farm") and Color3.fromRGB(50, 90, 200) or Color3.fromRGB(30, 30, 50)
    tabBtn.BorderSizePixel = 0
    tabBtn.Text = tabName
    tabBtn.TextColor3 = Color3.fromRGB(220, 230, 255)
    tabBtn.Font = Enum.Font.GothamBold
    tabBtn.TextSize = IsMobile and 10 or 11
    tabBtn.LayoutOrder = i
    tabBtn.Parent = TabBar
    
    local tCorner = Instance.new("UICorner")
    tCorner.CornerRadius = UDim.new(0, 8)
    tCorner.Parent = tabBtn
    
    TabButtons[tabName] = tabBtn
end

-- ========== CONTENT AREA ==========
local ContentArea = Instance.new("Frame")
ContentArea.Name = "ContentArea"
ContentArea.Size = UDim2.new(1, -12, 1, -90)
ContentArea.Position = UDim2.new(0, 6, 0, 88)
ContentArea.BackgroundTransparency = 1
ContentArea.ClipsDescendants = true
ContentArea.Parent = MainFrame

-- Create tab frames
for _, tabName in ipairs(Tabs) do
    local tabFrame = Instance.new("ScrollingFrame")
    tabFrame.Name = tabName .. "Content"
    tabFrame.Size = UDim2.new(1, 0, 1, 0)
    tabFrame.BackgroundTransparency = 1
    tabFrame.BorderSizePixel = 0
    tabFrame.ScrollBarThickness = 3
    tabFrame.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
    tabFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    tabFrame.Visible = (tabName == "Farm")
    tabFrame.Parent = ContentArea
    
    local tabLayout = Instance.new("UIListLayout")
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabLayout.Padding = UDim.new(0, 5)
    tabLayout.Parent = tabFrame
    
    local tabPad = Instance.new("UIPadding")
    tabPad.PaddingTop = UDim.new(0, 2)
    tabPad.PaddingBottom = UDim.new(0, 2)
    tabPad.PaddingLeft = UDim.new(0, 2)
    tabPad.PaddingRight = UDim.new(0, 2)
    tabPad.Parent = tabFrame
    
    TabFrames[tabName] = tabFrame
end

-- ========== TAB SWITCHING ==========
local function SwitchTab(tabName)
    State.TabOpen = tabName
    for name, frame in pairs(TabFrames) do
        frame.Visible = (name == tabName)
    end
    for name, btn in pairs(TabButtons) do
        btn.BackgroundColor3 = (name == tabName) and Color3.fromRGB(50, 90, 200) or Color3.fromRGB(30, 30, 50)
    end
end

for tabName, btn in pairs(TabButtons) do
    btn.MouseButton1Click:Connect(function()
        SwitchTab(tabName)
    end)
end

-- ========== GUI HELPERS ==========
local layoutOrder = 0

local function CreateSectionHeader(parent, title)
    layoutOrder = layoutOrder + 1
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 26)
    label.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    label.BorderSizePixel = 0
    label.Text = "  " .. title
    label.TextColor3 = Color3.fromRGB(100, 150, 255)
    label.Font = Enum.Font.GothamBold
    label.TextSize = IsMobile and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.LayoutOrder = layoutOrder
    label.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = label
    return label
end

local function CreateToggle(parent, name, default, callback)
    layoutOrder = layoutOrder + 1
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 38)
    frame.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
    frame.BorderSizePixel = 0
    frame.LayoutOrder = layoutOrder
    frame.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.65, 0, 1, 0)
    label.Position = UDim2.new(0.04, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(200, 210, 240)
    label.Font = Enum.Font.Gotham
    label.TextSize = IsMobile and 11 or 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 52, 0, 24)
    toggleBtn.Position = UDim2.new(1, -60, 0.5, -12)
    toggleBtn.BackgroundColor3 = default and Color3.fromRGB(50, 180, 90) or Color3.fromRGB(50, 50, 70)
    toggleBtn.BorderSizePixel = 0
    toggleBtn.Text = default and "ON" or "OFF"
    toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.TextSize = 10
    toggleBtn.Parent = frame
    
    local tCorner = Instance.new("UICorner")
    tCorner.CornerRadius = UDim.new(0, 12)
    tCorner.Parent = toggleBtn
    
    local toggled = default
    toggleBtn.MouseButton1Click:Connect(function()
        toggled = not toggled
        toggleBtn.BackgroundColor3 = toggled and Color3.fromRGB(50, 180, 90) or Color3.fromRGB(50, 50, 70)
        toggleBtn.Text = toggled and "ON" or "OFF"
        callback(toggled)
    end)
    
    return frame, toggleBtn
end

local function CreateButton(parent, name, color, callback)
    layoutOrder = layoutOrder + 1
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 34)
    btn.BackgroundColor3 = color
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = IsMobile and 11 or 12
    btn.LayoutOrder = layoutOrder
    btn.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    
    btn.MouseButton1Click:Connect(callback)
    return btn
end

local function CreateSlider(parent, name, minVal, maxVal, defaultVal, callback)
    layoutOrder = layoutOrder + 1
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 50)
    frame.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
    frame.BorderSizePixel = 0
    frame.LayoutOrder = layoutOrder
    frame.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -12, 0, 20)
    label.Position = UDim2.new(0, 6, 0, 2)
    label.BackgroundTransparency = 1
    label.Text = name .. ": " .. tostring(defaultVal)
    label.TextColor3 = Color3.fromRGB(180, 195, 230)
    label.Font = Enum.Font.Gotham
    label.TextSize = IsMobile and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Size = UDim2.new(1, -12, 0, 14)
    sliderFrame.Position = UDim2.new(0, 6, 0, 28)
    sliderFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    sliderFrame.BorderSizePixel = 0
    sliderFrame.Parent = frame
    
    local sCorner = Instance.new("UICorner")
    sCorner.CornerRadius = UDim.new(0, 7)
    sCorner.Parent = sliderFrame
    
    local fillBar = Instance.new("Frame")
    local pct = (defaultVal - minVal) / (maxVal - minVal)
    fillBar.Size = UDim2.new(pct, 0, 1, 0)
    fillBar.BackgroundColor3 = Color3.fromRGB(70, 130, 255)
    fillBar.BorderSizePixel = 0
    fillBar.Parent = sliderFrame
    
    local fCorner = Instance.new("UICorner")
    fCorner.CornerRadius = UDim.new(0, 7)
    fCorner.Parent = fillBar
    
    local sliding = false
    local function updateSlider(input)
        local relX = math.clamp((input.Position.X - sliderFrame.AbsolutePosition.X) / sliderFrame.AbsoluteSize.X, 0, 1)
        local val = math.floor(minVal + (maxVal - minVal) * relX)
        fillBar.Size = UDim2.new(relX, 0, 1, 0)
        label.Text = name .. ": " .. tostring(val)
        callback(val)
    end
    
    sliderFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            sliding = true
            updateSlider(input)
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if sliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateSlider(input)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            sliding = false
        end
    end)
    
    return frame
end

local function CreateInput(parent, name, defaultText, callback)
    layoutOrder = layoutOrder + 1
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 42)
    frame.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
    frame.BorderSizePixel = 0
    frame.LayoutOrder = layoutOrder
    frame.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.35, 0, 1, 0)
    label.Position = UDim2.new(0.03, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(180, 195, 230)
    label.Font = Enum.Font.Gotham
    label.TextSize = IsMobile and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local input = Instance.new("TextBox")
    input.Size = UDim2.new(0.55, 0, 0, 26)
    input.Position = UDim2.new(0.4, 0, 0.5, -13)
    input.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    input.BorderSizePixel = 0
    input.Text = defaultText
    input.PlaceholderText = name
    input.TextColor3 = Color3.fromRGB(220, 220, 240)
    input.PlaceholderText3 = Color3.fromRGB(100, 100, 120)
    input.Font = Enum.Font.Gotham
    input.TextSize = IsMobile and 10 or 11
    input.ClearTextOnFocus = false
    input.Parent = frame
    
    local iCorner = Instance.new("UICorner")
    iCorner.CornerRadius = UDim.new(0, 6)
    iCorner.Parent = input
    
    input.FocusLost:Connect(function()
        callback(input.Text)
    end)
    
    return frame, input
end

-- ========== BUILD FARM TAB ==========
local farmTab = TabFrames["Farm"]

CreateSectionHeader(farmTab, "📊 STATS")
layoutOrder = layoutOrder + 1
local StatsFrame = Instance.new("Frame")
StatsFrame.Size = UDim2.new(1, 0, 0, 40)
StatsFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
StatsFrame.BorderSizePixel = 0
StatsFrame.LayoutOrder = layoutOrder
StatsFrame.Parent = farmTab

local statsCorner = Instance.new("UICorner")
statsCorner.CornerRadius = UDim.new(0, 8)
statsCorner.Parent = StatsFrame

local StatsLabel = Instance.new("TextLabel")
StatsLabel.Name = "StatsText"
StatsLabel.Size = UDim2.new(1, -12, 1, 0)
StatsLabel.Position = UDim2.new(0, 6, 0, 0)
StatsLabel.BackgroundTransparency = 1
StatsLabel.Text = "Mined: 0 | Sells: 0 | Target: None"
StatsLabel.TextColor3 = Color3.fromRGB(180, 200, 230)
StatsLabel.Font = Enum.Font.Gotham
StatsLabel.TextSize = IsMobile and 9 or 10
StatsLabel.TextXAlignment = Enum.TextXAlignment.Left
StatsLabel.TextWrapped = true
StatsLabel.Parent = StatsFrame

local function UpdateStats()
    StatsLabel.Text = "Mined: " .. State.FarmCount .. " | Sells: " .. State.SellCount .. " | Dupe: " .. State.DupeCount .. " | Target: " .. (State.CurrentTarget or "None")
end

CreateSectionHeader(farmTab, "⛏ AUTO FARM")

CreateToggle(farmTab, "Auto Farm Rocks/Crystals", false, function(val)
    Config.AutoFarm = val
    if val then StartAutoFarm() else StopAutoFarm() end
end)

CreateToggle(farmTab, "Priority Highest Value", false, function(val)
    Config.PriorityHighestValue = val
    if val then Config.PriorityClosest = false end
end)

CreateToggle(farmTab, "Priority Closest", true, function(val)
    Config.PriorityClosest = val
    if val then Config.PriorityHighestValue = false end
end)

CreateSlider(farmTab, "Farm Radius", 50, 2000, 500, function(val)
    Config.FarmRadius = val
end)

CreateSlider(farmTab, "Farm Delay", 1, 100, 5, function(val)
    Config.FarmDelay = val / 100
end)

CreateButton(farmTab, "🔍 Scan Rocks Now", Color3.fromRGB(40, 80, 160), function()
    local rocks = GetAllRocks()
    AddLog("Found " .. #rocks .. " rocks/crystals")
end)

CreateButton(farmTab, "⛏ Mine Nearest Rock", Color3.fromRGB(40, 120, 60), function()
    local rocks = GetAllRocks()
    if #rocks > 0 then
        MineRock(rocks[1])
    else
        AddLog("No rocks found!")
    end
end)

CreateButton(farmTab, "⚡ Cache Remotes", Color3.fromRGB(100, 50, 150), function()
    CacheRemotes()
end)

-- ========== BUILD SELL TAB ==========
local sellTab = TabFrames["Sell"]

CreateSectionHeader(sellTab, "💰 AUTO SELL")

CreateToggle(sellTab, "Auto Sell", false, function(val)
    Config.AutoSell = val
    if val then StartAutoSell() else StopAutoSell() end
end)

CreateSlider(sellTab, "Sell Radius", 50, 1000, 300, function(val)
    Config.SellRadius = val
end)

CreateSlider(sellTab, "Sell Delay", 1, 50, 3, function(val)
    Config.SellDelay = val / 10
end)

CreateButton(sellTab, "💰 Sell at Nearest Shop", Color3.fromRGB(140, 100, 30), function()
    local shops = GetAllShops()
    if #shops > 0 then
        SellItems(shops[1])
    else
        AddLog("No shops found!")
    end
end)

CreateButton(sellTab, "🏠 Go Home / Teleport to Shop", Color3.fromRGB(80, 50, 150), function()
    local shops = GetAllShops()
    if #shops > 0 then
        TeleportTo(shops[1].Part.Position)
        AddLog("Teleported to: " .. shops[1].Name)
    end
end)

CreateSectionHeader(sellTab, "🔄 AUTO UPGRADE")

CreateToggle(sellTab, "Auto Upgrade", false, function(val)
    Config.AutoUpgrade = val
    if val then StartAutoUpgrade() else StopAutoUpgrade() end
end)

CreateButton(sellTab, "⬆ Upgrade All", Color3.fromRGB(50, 130, 180), function()
    FireRemote("upgrade")
    FireRemote("buy")
    FireRemote("purchase")
    FireRemote("warmth")
    FireRemote("pickaxe")
    FireRemote("backpack")
    FireRemote("speed")
    AddLog("Fired upgrade remotes")
end)

CreateSectionHeader(sellTab, "🏪 DETECTED SHOPS")

ShopList = Instance.new("ScrollingFrame")
ShopList.Name = "ShopList"
ShopList.Size = UDim2.new(1, 0, 0, 90)
ShopList.BackgroundColor3 = Color3.fromRGB(18, 18, 30)
ShopList.BorderSizePixel = 0
ShopList.ScrollBarThickness = 2
ShopList.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
ShopList.CanvasSize = UDim2.new(0, 0, 0, 0)
ShopList.AutomaticCanvasSize = Enum.AutomaticSize.Y
layoutOrder = layoutOrder + 1
ShopList.LayoutOrder = layoutOrder
ShopList.Parent = sellTab

local shopLCorner = Instance.new("UICorner")
shopLCorner.CornerRadius = UDim.new(0, 6)
shopLCorner.Parent = ShopList

local shopLLayout = Instance.new("UIListLayout")
shopLLayout.SortOrder = Enum.SortOrder.LayoutOrder
shopLLayout.Padding = UDim.new(0, 2)
shopLLayout.Parent = ShopList

local shopLPad = Instance.new("UIPadding")
shopLPad.PaddingTop = UDim.new(0, 2)
shopLPad.PaddingBottom = UDim.new(0, 2)
shopLPad.PaddingLeft = UDim.new(0, 2)
shopLPad.PaddingRight = UDim.new(0, 2)
shopLPad.Parent = ShopList

-- ========== BUILD ESP TAB ==========
local espTab = TabFrames["ESP"]

CreateSectionHeader(espTab, "👁 ESP / VISUALS")

CreateToggle(espTab, "Crystal / Rock ESP", false, function(val)
    Config.ESPEnabled = val
    if val then StartESP() else StopESP() end
end)

CreateButton(espTab, "🔄 Refresh ESP", Color3.fromRGB(50, 90, 160), function()
    if Config.ESPEnabled then
        CreateESP()
    else
        AddLog("Enable ESP first!")
    end
end)

CreateButton(espTab, "❌ Clear ESP", Color3.fromRGB(150, 50, 50), function()
    StopESP()
end)

CreateSectionHeader(espTab, "🪨 DETECTED ROCKS")

RockList = Instance.new("ScrollingFrame")
RockList.Name = "RockList"
RockList.Size = UDim2.new(1, 0, 0, 120)
RockList.BackgroundColor3 = Color3.fromRGB(18, 18, 30)
RockList.BorderSizePixel = 0
RockList.ScrollBarThickness = 2
RockList.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
RockList.CanvasSize = UDim2.new(0, 0, 0, 0)
RockList.AutomaticCanvasSize = Enum.AutomaticSize.Y
layoutOrder = layoutOrder + 1
RockList.LayoutOrder = layoutOrder
RockList.Parent = espTab

local rLCorner = Instance.new("UICorner")
rLCorner.CornerRadius = UDim.new(0, 6)
rLCorner.Parent = RockList

local rLLayout = Instance.new("UIListLayout")
rLLayout.SortOrder = Enum.SortOrder.LayoutOrder
rLLayout.Padding = UDim.new(0, 2)
rLLayout.Parent = RockList

local rLPad = Instance.new("UIPadding")
rLPad.PaddingTop = UDim.new(0, 2)
rLPad.PaddingBottom = UDim.new(0, 2)
rLPad.PaddingLeft = UDim.new(0, 2)
rLPad.PaddingRight = UDim.new(0, 2)
rLPad.Parent = RockList

-- ========== BUILD EXPLOIT TAB ==========
local exploitTab = TabFrames["Exploit"]

CreateSectionHeader(exploitTab, "🎒 EXPLOITS")

CreateToggle(exploitTab, "Unlimited Backpack", false, function(val)
    Config.UnlimitedBackpack = val
    if val then ApplyUnlimitedBackpack() end
end)

CreateToggle(exploitTab, "Unlimited Luck", false, function(val)
    Config.UnlimitedLuck = val
    if val then ApplyUnlimitedLuck() end
end)

CreateToggle(exploitTab, "Anti Damage", false, function(val)
    Config.AntiDamage = val
    if val then StartAntiDamage() else StopAntiDamage() end
end)

CreateToggle(exploitTab, "Anti Freeze (Warmth)", false, function(val)
    Config.AntiFreeze = val
    if val and not Config.AntiDamage then
        Config.AntiDamage = true
        StartAntiDamage()
    end
end)

CreateSectionHeader(exploitTab, "🎭 MOVEMENT")

CreateToggle(exploitTab, "Speed Boost", false, function(val)
    Config.SpeedBoost = val
    ApplySpeedBoost()
end)

CreateSlider(exploitTab, "Walk Speed", 16, 200, 50, function(val)
    Config.WalkSpeed = val
    if Config.SpeedBoost then ApplySpeedBoost() end
end)

CreateToggle(exploitTab, "Noclip", false, function(val)
    Config.Noclip = val
    if val then StartNoclip() else StopNoclip() end
end)

CreateToggle(exploitTab, "Fly", false, function(val)
    Config.FlyEnabled = val
    if val then StartFly() else StopFly() end
end)

CreateSlider(exploitTab, "Fly Speed", 10, 200, 60, function(val)
    Config.FlySpeed = val
end)

CreateSectionHeader(exploitTab, "📦 ITEM DUPE")

local dupeInput, dupeTextBox
dupeInput, dupeTextBox = CreateInput(exploitTab, "Dupe Qty", "1", function(text)
    local num = tonumber(text)
    if num and num > 0 then
        Config.DupeAmount = math.floor(num)
    end
end)

CreateButton(exploitTab, "📦 Dupe Items (" .. Config.DupeAmount .. "x)", Color3.fromRGB(180, 60, 180), function()
    DupeItems(Config.DupeAmount)
end)

CreateSectionHeader(exploitTab, "📡 REMOTE EXPLOITS")

CreateButton(exploitTab, "🔥 Fire All Mine Remotes", Color3.fromRGB(160, 40, 40), function()
    FireRemote("mine")
    FireRemote("dig")
    FireRemote("harvest")
    FireRemote("collect")
    FireRemote("break")
    AddLog("Fired mine remotes")
end)

CreateButton(exploitTab, "💰 Fire All Sell Remotes", Color3.fromRGB(40, 140, 40), function()
    FireRemote("sell")
    FireRemote("sellall")
    FireRemote("cash")
    FireRemote("money")
    FireRemote("trade")
    AddLog("Fired sell remotes")
end)

CreateButton(exploitTab, "⬆ Fire All Upgrade Remotes", Color3.fromRGB(40, 100, 160), function()
    FireRemote("upgrade")
    FireRemote("buy")
    FireRemote("purchase")
    FireRemote("warmth")
    FireRemote("pickaxe")
    FireRemote("backpack")
    AddLog("Fired upgrade remotes")
end)

CreateButton(exploitTab, "🎲 Fire All Luck Remotes", Color3.fromRGB(140, 140, 40), function()
    FireRemote("luck")
    FireRemote("lucky")
    FireRemote("fortune")
    FireRemote("blessing")
    AddLog("Fired luck remotes")
end)

CreateButton(exploitTab, "💣 Fire ALL Remotes (Nuke)", Color3.fromRGB(200, 50, 50), function()
    for _, remote in ipairs(State.RemoteCache) do
        pcall(function()
            if remote.Type == "RemoteEvent" then
                remote.Instance:FireServer()
            elseif remote.Type == "RemoteFunction" then
                remote.Instance:InvokeServer()
            end
        end)
    end
    AddLog("NUKED all " .. #State.RemoteCache .. " remotes!")
end)

-- ========== BUILD MISC TAB ==========
local miscTab = TabFrames["Misc"]

CreateSectionHeader(miscTab, "📋 LOG")

LogList = Instance.new("ScrollingFrame")
LogList.Name = "LogList"
LogList.Size = UDim2.new(1, 0, 0, 100)
LogList.BackgroundColor3 = Color3.fromRGB(12, 12, 20)
LogList.BorderSizePixel = 0
LogList.ScrollBarThickness = 2
LogList.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
LogList.CanvasSize = UDim2.new(0, 0, 0, 0)
LogList.AutomaticCanvasSize = Enum.AutomaticSize.Y
layoutOrder = layoutOrder + 1
LogList.LayoutOrder = layoutOrder
LogList.Parent = miscTab

local logCorner = Instance.new("UICorner")
logCorner.CornerRadius = UDim.new(0, 6)
logCorner.Parent = LogList

local logLayout = Instance.new("UIListLayout")
logLayout.SortOrder = Enum.SortOrder.LayoutOrder
logLayout.Parent = LogList

local logPad = Instance.new("UIPadding")
logPad.PaddingTop = UDim.new(0, 3)
logPad.PaddingLeft = UDim.new(0, 3)
logPad.PaddingRight = UDim.new(0, 3)
logPad.Parent = LogList

CreateSectionHeader(miscTab, "🔗 DISCORD WEBHOOK")

CreateToggle(miscTab, "Enable Webhook", false, function(val)
    Config.WebhookEnabled = val
end)

CreateInput(miscTab, "Webhook URL", "", function(text)
    Config.WebhookURL = text
end)

CreateToggle(miscTab, "Farm Logs", true, function(val)
    Config.WebhookFarm = val
end)

CreateToggle(miscTab, "Sell Logs", true, function(val)
    Config.WebhookSell = val
end)

CreateToggle(miscTab, "Stats Logs", true, function(val)
    Config.WebhookStats = val
end)

CreateButton(miscTab, "📨 Send Stats Now", Color3.fromRGB(50, 90, 160), function()
    SendStatsLog()
    AddLog("Sent stats to webhook")
end)

CreateButton(miscTab, "🧪 Test Webhook", Color3.fromRGB(90, 60, 140), function()
    SendWebhook({content = "**[Minea Mountain v6]** Webhook test successful! ✅"})
    AddLog("Tested webhook")
end)

CreateSectionHeader(miscTab, "🔧 UTILITIES")

CreateButton(miscTab, "🏠 Teleport to Spawn", Color3.fromRGB(60, 90, 140), function()
    local spawns = Workspace:FindFirstChild("SpawnLocation") or Workspace:FindFirstChild("Spawns") or Workspace:FindFirstChild("Lobby")
    if spawns then
        if spawns:IsA("BasePart") then
            TeleportTo(spawns.Position)
        else
            local spawn = spawns:FindFirstChildWhichIsA("BasePart")
            if spawn then TeleportTo(spawn.Position) end
        end
    else
        AddLog("No spawn found!")
    end
end)

CreateButton(miscTab, "🏔 Teleport to Mountain Top", Color3.fromRGB(100, 60, 140), function()
    if GetCharacter() then
        local highestY = HumanoidRootPart.Position.Y
        local highestPart = nil
        for _, part in ipairs(Workspace:GetDescendants()) do
            if part:IsA("BasePart") and part.Position.Y > highestY then
                highestY = part.Position.Y
                highestPart = part
            end
        end
        if highestPart then
            TeleportTo(highestPart.Position + Vector3.new(0, 10, 0))
            AddLog("Teleported to highest point: " .. math.floor(highestY))
        end
    end
end)

CreateButton(miscTab, "🔄 Rejoin Server", Color3.fromRGB(100, 100, 50), function()
    pcall(function()
        LocalPlayer:Kick("Rejoining...")
        task.wait(1)
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end)
end)

CreateSectionHeader(miscTab, "ℹ INFO")

layoutOrder = layoutOrder + 1
local infoLabel = Instance.new("TextLabel")
infoLabel.Size = UDim2.new(1, 0, 0, 50)
infoLabel.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
infoLabel.BorderSizePixel = 0
infoLabel.Text = "Minea Mountain v6 Ultimate\nAuto Farm | ESP | Exploits | Dupe\nWorks on Delta, Synapse, KRNL, Fluxus"
infoLabel.TextColor3 = Color3.fromRGB(140, 160, 200)
infoLabel.Font = Enum.Font.Gotham
infoLabel.TextSize = IsMobile and 9 or 10
infoLabel.LayoutOrder = layoutOrder
infoLabel.Parent = miscTab

local infoCorner = Instance.new("UICorner")
infoCorner.CornerRadius = UDim.new(0, 6)
infoCorner.Parent = infoLabel

-- ========== MINIMIZE / EXPAND LOGIC ==========
MinimizeBtn.MouseButton1Click:Connect(function()
    State.IsMinimized = true
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local tween = TweenService:Create(MainFrame, tweenInfo, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = MinimizedPosition,
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

-- ========== DRAGGING ==========
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

-- ========== PERIODIC UPDATES ==========
task.spawn(function()
    while true do
        task.wait(5)
        if Config.AutoSell or Config.AutoFarm then
            UpdateStats()
        end
        -- Periodic webhook stats
        if Config.WebhookEnabled and Config.WebhookStats then
            pcall(SendStatsLog)
        end
    end
end)

-- Auto-detect shops and rocks periodically
task.spawn(function()
    while true do
        task.wait(10)
        pcall(function()
            local shops = GetAllShops()
            if ShopList then
                ShopList:ClearAllChildren()
                for i, shop in ipairs(shops) do
                    if i > 15 then break end
                    local btn = Instance.new("TextButton")
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Color3.fromRGB(30, 35, 50)
                    btn.BorderSizePixel = 0
                    btn.Text = shop.Name .. " [" .. math.floor(shop.Distance) .. "m]"
                    btn.TextColor3 = Color3.fromRGB(200, 220, 255)
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = 11
                    btn.Parent = ShopList
                    local bCorner = Instance.new("UICorner")
                    bCorner.CornerRadius = UDim.new(0, 5)
                    bCorner.Parent = btn
                    btn.MouseButton1Click:Connect(function()
                        TeleportTo(shop.Part.Position)
                        AddLog("Teleported to: " .. shop.Name)
                    end)
                end
            end
        end)
        
        pcall(function()
            local rocks = GetAllRocks()
            if RockList then
                RockList:ClearAllChildren()
                for i, rock in ipairs(rocks) do
                    if i > 20 then break end
                    local btn = Instance.new("TextButton")
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Color3.fromRGB(30, 35, 50)
                    btn.BorderSizePixel = 0
                    btn.Text = rock.Name .. " [" .. math.floor(rock.Distance) .. "m]" .. (rock.Value > 0 and (" $" .. rock.Value) or "")
                    btn.TextColor3 = rock.Value > 0 and Color3.fromRGB(255, 215, 100) or Color3.fromRGB(200, 255, 200)
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = 11
                    btn.Parent = RockList
                    local bCorner = Instance.new("UICorner")
                    bCorner.CornerRadius = UDim.new(0, 5)
                    bCorner.Parent = btn
                    btn.MouseButton1Click:Connect(function()
                        TeleportTo(rock.Part.Position)
                        AddLog("Teleported to: " .. rock.Name)
                    end)
                end
            end
        end)
    end
end)

-- ========== HANDLE RESPAWN ==========
LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    HumanoidRootPart = char:WaitForChild("HumanoidRootPart")
    Humanoid = char:WaitForChild("Humanoid")
    AddLog("Character respawned")
    
    -- Re-apply speed boost if enabled
    if Config.SpeedBoost then
        task.delay(1, function()
            ApplySpeedBoost()
        end)
    end
end)

-- ========== HANDLE SCREEN RESIZE ==========
Workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
    local newSize = Workspace.CurrentCamera.ViewportSize
    local isMob = newSize.X < 800
    GUIWidth = isMob and UDim2.new(0, 300, 0, 360) or UDim2.new(0, 340, 0, 440)
    if not State.IsMinimized then
        MainFrame.Size = GUIWidth
    end
end)

-- ========== SIMULATION RADIUS (see further) ==========
if HasSetSimRadius then
    pcall(function()
        setsimulationradius(1e9, 1e9)
    end)
end

-- ========== STARTUP ==========
AddLog("Minea Mountain v6 ULTIMATE Loaded!")
AddLog("Auto Farm | ESP | Exploits | Dupe")
AddLog("Cache remotes first for best results!")

-- Initial remote cache
task.delay(3, function()
    CacheRemotes()
end)
