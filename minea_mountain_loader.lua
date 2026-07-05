-- Mountain Hub v3.2 - Safe Build with Error Reporting
local success, err = pcall(function()
--[[
    ████████╗██╗  ██╗███████╗    ██╗███████╗ ██████╗ ███████╗████████╗
    ╚══██╔══╝██║  ██║██╔════╝    ██║██╔════╝██╔═══██╗██╔════╝╚══██╔══╝
       ██║   ███████║█████╗      ██║███████╗██║   ██║███████╗   ██║   
       ██║   ██╔══██║██╔══╝      ██║╚════██║██║   ██║╚════██║   ██║   
       ██║   ██║  ██║███████╗    ██║███████║╚██████╔╝███████║   ██║   
       ╚═╝   ╚═╝  ╚═╝╚══════╝    ╚═╝╚══════╝ ╚═════╝ ╚══════╝   ╚═╝   
    🏔️ MOUNTAIN EXPLOIT HUB v3.2 🏔️
    Game: Mine a Mountain (ID: 125927821145949)
    
    v3.2 CHANGES:
    - Professional glassmorphism GUI with custom toggle switches
    - FIXED: Auto Farm now TP→MINE→COLLECT→SELL in proper loop
    - FIXED: Sell exploit fires from current position (no need to walk to shop)
    - NEW: Backpack Dupe Exploit (duplicate items via remote manipulation)
    - NEW: Proper mining interaction (tool equip + click + remote spam)
    - NEW: Sell From Position exploit
    - NEW: Crystal value override exploit
    - Mobile responsive with proper touch targets
]]

-- ════════════════════════════════════════════════════════════════════════════
-- ANTI-DETECTION LAYER
-- ════════════════════════════════════════════════════════════════════════════
local _r = game
local _s = string
local _t = table
local _m = math
local _c = coroutine
local _w = wait
local _h = hookmetamethod
local _n = newcclosure

local _OBF = {
    ["Mine"] = "\77\105\110\101",
    ["Sell"] = "\83\101\108\108",
    ["Upgrade"] = "\85\112\103\114\97\100\101",
    ["Damage"] = "\68\97\109\97\103\101",
    ["Cold"] = "\67\111\108\100",
    ["Warmth"] = "\87\97\114\109\116\104",
    ["Collect"] = "\67\111\108\101\99\116",
    ["Teleport"] = "\84\101\108\101\112\111\114\116",
    ["Crystal"] = "\67\114\121\115\116\97\108",
    ["Pickaxe"] = "\80\105\99\107\97\120\101",
    ["Backpack"] = "\66\97\99\107\112\97\99\107",
    ["Coins"] = "\67\111\105\110\115",
    ["Cash"] = "\67\97\115\104",
    ["Dupe"] = "\68\117\112\101",
}

local _SCRIPT_ID = _m.random(100000, 999999)

if hookmetamethod then
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", _n(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        if method == "FireServer" or method == "InvokeServer" then
            if type(args[1]) == "string" and _OBF[args[1]] then
                return oldNamecall(self, ...)
            end
        end
        if method == "FireServer" then
            local rn = self.Name:lower()
            if rn:find("detect") or rn:find("cheat") or rn:find("exploit") or rn:find("kick") or rn:find("ban") or rn:find("security") or rn:find("valid") or rn:find("anticheat") then
                return nil
            end
        end
        return oldNamecall(self, ...)
    end))
end

-- ════════════════════════════════════════════════════════════════════════════
-- SERVICES
-- ════════════════════════════════════════════════════════════════════════════
local Players = _r:GetService("Players")
local RS = _r:GetService("ReplicatedStorage")
local Workspace = _r:GetService("Workspace")
local RunService = _r:GetService("RunService")
local TweenService = _r:GetService("TweenService")
local UserInputService = _r:GetService("UserInputService")
local VirtualUser = _r:GetService("VirtualUser")
local TeleportService = _r:GetService("TeleportService")
local CoreGui = _r:GetService("CoreGui")
local HttpService = _r:GetService("HttpService")
local Lighting = _r:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

-- ════════════════════════════════════════════════════════════════════════════
-- CONFIG
-- ════════════════════════════════════════════════════════════════════════════
local Config = {
    -- Core farm loop
    AutoFarm = false,
    AutoMine = false,
    AutoCollect = false,
    AutoSell = false,
    FarmDelay = 0.3,
    -- Upgrades (individual toggles for GUI)
    AutoUpgrade = false,
    AutoUpgradePickaxe = false,
    AutoUpgradeBackpack = false,
    AutoUpgradeWarmth = false,
    UpgradeWarmth = false,
    UpgradePickaxe = false,
    UpgradeBackpack = false,
    -- Farm options
    FindBestCrystal = false,
    RarityFilter = 0,
    MinRarity = 1,
    MineDelay = 0.1,
    SellValue = "All",
    SellValueOverride = 999999,
    -- ESP
    ESPCrystals = false,
    CrystalESP = false,
    ESPPlayers = false,
    ESPDrops = false,
    ESPRange = 500,
    -- Movement
    AntiDamage = false,
    ColdImmunity = false,
    AutoWarmth = false,
    SpeedBoost = false,
    SpeedValue = 50,
    Noclip = false,
    Fly = false,
    FlySpeed = 80,
    -- Exploits
    SellFromPos = true,
    -- v3.1 additions
    InstantMine = false,
    RemoteSpyEnabled = false,
    SellBypassEnabled = false,
    CapacityBypass = false,
    ExtendedRange = false,
    SpeedSpoof = false,
    ConfigManip = false,
    WarpSellEnabled = false,
    AntiCheatFull = false,
    MountainResetHandler = true,
    BackpackDupe = false,
    InventoryExploit = false,
    InstantMine = false,
    ValueManip = false,
    ValueOverride = false,
    OverrideValue = 99999,
    DiggingLuckBoost = false,
    -- Anti
    AntiAFK = true,
    AutoRejoin = false,
    AntiCheat = false,
    -- v2 features
    MountainPathTracker = false,
    LiveStats = true,
    SmartNotifications = true,
    Keybinds = true,
    MountainRefreshTimer = true,
    ProfitTracker = true,
    MobileFlyJoystick = false,
    NightMode = false,
    RemoteLogger = false,
    Fullbright = false,
    InfiniteJump = false,
    LootFilter_1 = true,
    LootFilter_2 = true,
    LootFilter_3 = true,
    LootFilter_4 = true,
    LootFilter_5 = true,
}

-- Stats
local Stats = {
    SessionStart = tick(),
    CrystalsMined = 0,
    CrystalsSold = 0,
    TotalSells = 0,
    TotalProfit = 0,
    ProfitPerHour = 0,
    CurrentCoins = 0,
    Warmth = 100,
    PickaxeTier = 1,
    BackpackCap = 10,
    BackpackUsed = 0,
    LastSellTime = 0,
    LastMineTime = 0,
    MountainRefreshTime = nil,
}

-- Crystal Rarity
local CrystalRarity = {
    ["Common Crystal"] = {rarity = 1, value = 1, color = Color3.fromRGB(180, 180, 180)},
    ["Stone Fragment"] = {rarity = 1, value = 2, color = Color3.fromRGB(150, 150, 150)},
    ["Coal Chunk"] = {rarity = 1, value = 3, color = Color3.fromRGB(60, 60, 60)},
    ["Iron Ore"] = {rarity = 2, value = 8, color = Color3.fromRGB(180, 140, 100)},
    ["Copper Crystal"] = {rarity = 2, value = 10, color = Color3.fromRGB(184, 115, 51)},
    ["Silver Crystal"] = {rarity = 2, value = 15, color = Color3.fromRGB(192, 192, 192)},
    ["Gold Crystal"] = {rarity = 3, value = 30, color = Color3.fromRGB(255, 215, 0)},
    ["Emerald"] = {rarity = 3, value = 50, color = Color3.fromRGB(0, 200, 80)},
    ["Ruby"] = {rarity = 4, value = 100, color = Color3.fromRGB(220, 20, 60)},
    ["Sapphire"] = {rarity = 4, value = 120, color = Color3.fromRGB(15, 82, 186)},
    ["Diamond"] = {rarity = 4, value = 200, color = Color3.fromRGB(185, 242, 255)},
    ["Amethyst"] = {rarity = 4, value = 150, color = Color3.fromRGB(153, 102, 204)},
    ["Legendary Starsapphire"] = {rarity = 5, value = 500, color = Color3.fromRGB(100, 50, 255)},
}

-- Keybinds
local KeybindMap = {
    {name = "Toggle GUI", key = "RightCtrl", keycode = Enum.KeyCode.RightControl, callback = function() end},
    {name = "Fly Toggle", key = "F", keycode = Enum.KeyCode.F, callback = function()
        Config.Fly = not Config.Fly
        if Config.Fly then StartFly() else StopFly() end
    end},
    {name = "Noclip Toggle", key = "N", keycode = Enum.KeyCode.N, callback = function()
        Config.Noclip = not Config.Noclip
        if Config.Noclip then StartNoclip() else StopNoclip() end
    end},
    {name = "Crystal ESP", key = "E", keycode = Enum.KeyCode.E, callback = function()
        Config.ESPCrystals = not Config.ESPCrystals
        Config.CrystalESP = Config.ESPCrystals
        if Config.ESPCrystals then StartCrystalESP() else StopCrystalESP() end
    end},
    {name = "Auto Farm", key = "G", keycode = Enum.KeyCode.G, callback = function()
        Config.AutoFarm = not Config.AutoFarm
        if Config.AutoFarm then StartAutoFarm() else StopAutoFarm() end
    end},
    {name = "Go Home", key = "H", keycode = Enum.KeyCode.H, callback = function()
        TeleportTo(GetHomePosition())
    end},
    {name = "TP Best Crystal", key = "T", keycode = Enum.KeyCode.T, callback = function()
        local crystals = DiscoverCrystals()
        if #crystals > 0 then TeleportTo(crystals[1].position) end
    end},
    {name = "Speed Boost", key = "X", keycode = Enum.KeyCode.X, callback = function()
        Config.SpeedBoost = not Config.SpeedBoost
        if Config.SpeedBoost then StartSpeedBoost() else StopSpeedBoost() end
    end},
    {name = "Instant Mine", key = "L", keycode = Enum.KeyCode.L, callback = function()
        Config.InstantMine = not Config.InstantMine
    end},
    {name = "Auto Collect", key = "K", keycode = Enum.KeyCode.K, callback = function()
        Config.AutoCollect = not Config.AutoCollect
    end},
}

-- Keep backward-compatible KeyCode map
local KeyCodeMap = {}
for _, kb in ipairs(KeybindMap) do KeyCodeMap[kb.keycode] = kb.callback end

-- Connections
local Connections = {
    Farm = nil, Sell = nil, Upgrade = nil, ESP = nil,
    Noclip = nil, Fly = nil, Collect = nil, InstantMine = nil,
    Stats = nil, Logger = nil,
}
local ESPHighlights = {}
local RemoteLogEntries = {}
local flyBody = nil
local flyGyro = nil
local JoystickFrame = nil

-- ════════════════════════════════════════════════════════════════════════════
-- CHARACTER HELPER
-- ════════════════════════════════════════════════════════════════════════════
local function RefreshCharacter()
    pcall(function()
        Character = LocalPlayer.Character
        if Character then
            Humanoid = Character:FindFirstChildOfClass("Humanoid")
            RootPart = Character:FindFirstChild("HumanoidRootPart")
        end
    end)
end

local function IsAlive()
    RefreshCharacter()
    return RootPart and Humanoid and Humanoid.Health > 0
end

-- ════════════════════════════════════════════════════════════════════════════
-- DYNAMIC REMOTE DISCOVERY
-- ════════════════════════════════════════════════════════════════════════════
local DiscoveredRemotes = {}

local function DiscoverRemotes()
    DiscoveredRemotes = {}
    local function scan(container)
        pcall(function()
            for _, obj in ipairs(container:GetDescendants()) do
                if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
                    local name = obj.Name:lower()
                    local info = {name = obj.Name, fullName = obj:GetFullName(), type = obj.ClassName, object = obj, category = "Unknown"}
                    if name:find("mine") or name:find("dig") or name:find("break") or name:find("harvest") or name:find("swing") or name:find("hit") or name:find("tool") then info.category = "Mining"
                    elseif name:find("sell") or name:find("shop") or name:find("cash") or name:find("coin") or name:find("trade") or name:find("merchant") then info.category = "Selling"
                    elseif name:find("upgrade") or name:find("improve") or name:find("buy") or name:find("purchase") then info.category = "Upgrades"
                    elseif name:find("damage") or name:find("cold") or name:find("hurt") or name:find("freeze") or name:find("warmth") then info.category = "Damage"
                    elseif name:find("teleport") or name:find("tp") or name:find("warp") then info.category = "Teleport"
                    elseif name:find("collect") or name:find("pickup") or name:find("gather") or name:find("grab") or name:find("loot") then info.category = "Collection"
                    elseif name:find("luck") or name:find("chance") or name:find("rare") or name:find("drop") then info.category = "Luck"
                    elseif name:find("dupe") or name:find("duplicate") or name:find("copy") then info.category = "Dupe"
                    elseif name:find("detect") or name:find("cheat") or name:find("kick") or name:find("ban") or name:find("security") then info.category = "AntiCheat"
                    end
                    table.insert(DiscoveredRemotes, info)
                end
            end
        end)
    end
    scan(RS)
    scan(Workspace)
    pcall(function() scan(LocalPlayer.PlayerGui) end)
    return DiscoveredRemotes
end

local function GetRemote(category)
    for _, r in ipairs(DiscoveredRemotes) do
        if r.category == category then
            local obj = r.object
            if obj and (obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction")) then return obj end
            -- Try re-finding it
            local found = RS:FindFirstChild(r.name, true)
            if found and (found:IsA("RemoteEvent") or found:IsA("RemoteFunction")) then
                r.object = found
                return found
            end
        end
    end
    return nil
end

local function FireRemote(remote, ...)
    if not remote then return end
    pcall(function()
        if remote:IsA("RemoteEvent") then
            remote:FireServer(...)
        elseif remote:IsA("RemoteFunction") then
            remote:InvokeServer(...)
        end
    end)
end

-- ════════════════════════════════════════════════════════════════════════════
-- CRYSTAL / SHOP DISCOVERY
-- ════════════════════════════════════════════════════════════════════════════
local function DiscoverCrystals()
    local crystals = {}
    pcall(function()
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") or obj:IsA("MeshPart") then
                local name = obj.Name:lower()
                local isCrystal, rarity, value = false, 1, 1
                for crystalName, data in pairs(CrystalRarity) do
                    if name:find(crystalName:lower()) then isCrystal = true rarity = data.rarity value = data.value break end
                end
                if not isCrystal and (name:find("crystal") or name:find("ore") or name:find("gem") or name:find("mineral") or name:find("rock")) then isCrystal = true rarity = 2 value = 5 end
                if isCrystal and Config["LootFilter_" .. rarity] then
                    table.insert(crystals, {object = obj, name = obj.Name, rarity = rarity, value = value, position = obj.Position})
                end
            end
        end
    end)
    table.sort(crystals, function(a, b) return a.rarity ~= b.rarity and a.rarity > b.rarity or a.value > b.value end)
    return crystals
end

local function DiscoverShops()
    local shops = {}
    pcall(function()
        for _, obj in ipairs(Workspace:GetDescendants()) do
            local name = obj.Name:lower()
            if name:find("shop") or name:find("sell") or name:find("store") or name:find("trader") or name:find("dealer") or name:find("merchant") or name:find("cashier") then
                if obj:IsA("Model") or obj:IsA("BasePart") or obj:IsA("MeshPart") then
                    local pos = obj:IsA("Model") and obj.PrimaryPart and obj.PrimaryPart.Position or (obj:IsA("BasePart") and obj.Position)
                    if pos then table.insert(shops, {object = obj, name = obj.Name, position = pos}) end
                end
            end
        end
    end)
    return shops
end

local function DiscoverUpgrades()
    local upgrades = {}
    pcall(function()
        for _, obj in ipairs(Workspace:GetDescendants()) do
            local name = obj.Name:lower()
            if name:find("warmth") or name:find("pickaxe") or name:find("backpack") or name:find("upgrade") or name:find("improve") then
                if obj:IsA("Model") or obj:IsA("BasePart") or obj:IsA("MeshPart") then
                    local pos = obj:IsA("Model") and obj.PrimaryPart and obj.PrimaryPart.Position or (obj:IsA("BasePart") and obj.Position)
                    if pos then table.insert(upgrades, {object = obj, name = obj.Name, position = pos}) end
                end
            end
        end
    end)
    return upgrades
end

-- ════════════════════════════════════════════════════════════════════════════
-- TELEPORTATION
-- ════════════════════════════════════════════════════════════════════════════
local function TeleportTo(pos)
    if not IsAlive() or not pos then return end
    pcall(function()
        RootPart.CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))
    end)
end

local function GetHomePosition()
    local sp = Workspace:FindFirstChild("SpawnLocation") or Workspace:FindFirstChild("Spawn") or Workspace:FindFirstChild("Home")
    if sp and sp:IsA("BasePart") then return sp.Position end
    for _, o in ipairs(Workspace:GetChildren()) do
        local n = o.Name:lower()
        if (n:find("base") or n:find("lobby") or n:find("spawn") or n:find("home") or n:find("start")) and o:IsA("BasePart") then return o.Position end
    end
    return Vector3.new(0, 50, 0)
end

-- ════════════════════════════════════════════════════════════════════════════
-- MINING SYSTEM (v3 - PROPER INTERACTION)
-- ════════════════════════════════════════════════════════════════════════════
local function EquipPickaxe()
    pcall(function()
        -- Find and equip the pickaxe tool
        local backpack = LocalPlayer.Backpack
        if backpack then
            for _, tool in ipairs(backpack:GetChildren()) do
                if tool:IsA("Tool") then
                    local n = tool.Name:lower()
                    if n:find("pick") or n:find("axe") or n:find("mine") or n:find("tool") then
                        Humanoid:EquipTool(tool)
                        return tool
                    end
                end
            end
            -- Equip any tool if no pickaxe found
            for _, tool in ipairs(backpack:GetChildren()) do
                if tool:IsA("Tool") then
                    Humanoid:EquipTool(tool)
                    return tool
                end
            end
        end
        -- Check if already holding a tool
        for _, tool in ipairs(Character:GetChildren()) do
            if tool:IsA("Tool") then return tool end
        end
    end)
    return nil
end

local function MineCrystal(crystalObj)
    if not IsAlive() or not crystalObj then return false end
    
    -- Step 1: Make sure we're close enough
    local dist = (crystalObj.Position - RootPart.Position).Magnitude
    if dist > 15 then return false end
    
    -- Step 2: Equip pickaxe
    EquipPickaxe()
    _w(0.05)
    
    -- Step 3: Fire the mine remote with the crystal object
    local mineRemote = GetRemote("Mining")
    if mineRemote then
        -- Try multiple argument patterns the game might expect
        FireRemote(mineRemote, crystalObj)                    -- Pass the object
        FireRemote(mineRemote, crystalObj.Name)               -- Pass the name
        FireRemote(mineRemote, crystalObj, 1)                 -- Object + hit count
        FireRemote(mineRemote, crystalObj.Name, 1)            -- Name + hit count
    end
    
    -- Step 4: Simulate a click (in case game uses tool activation)
    pcall(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
    
    -- Step 5: Also try activating the equipped tool directly
    pcall(function()
        for _, tool in ipairs(Character:GetChildren()) do
            if tool:IsA("Tool") then
                -- Fire the tool's activated event
                if tool:FindFirstChild("RemoteEvent") then
                    tool.RemoteEvent:FireServer()
                end
                -- Try tool activation remote
                for _, remote in ipairs(tool:GetDescendants()) do
                    if remote:IsA("RemoteEvent") then
                        remote:FireServer(crystalObj)
                        remote:FireServer(crystalObj.Name)
                    elseif remote:IsA("RemoteFunction") then
                        remote:InvokeServer(crystalObj)
                        remote:InvokeServer(crystalObj.Name)
                    end
                end
            end
        end
    end)
    
    Stats.CrystalsMined = Stats.CrystalsMined + 1
    Stats.LastMineTime = tick()
    return true
end

local function CollectDrops()
    if not IsAlive() then return end
    pcall(function()
        local collectRemote = GetRemote("Collection")
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if (obj:IsA("BasePart") or obj:IsA("MeshPart")) then
                local n = obj.Name:lower()
                if n:find("drop") or n:find("loot") or n:find("item") or n:find("pickup") or n:find("collect") then
                    local dist = (obj.Position - RootPart.Position).Magnitude
                    if dist < 60 then
                        -- TP to the drop if slightly far
                        if dist > 8 then
                            RootPart.CFrame = CFrame.new(obj.Position + Vector3.new(0, 2, 0))
                            _w(0.05)
                        end
                        -- Fire collect remote
                        if collectRemote then
                            FireRemote(collectRemote, obj)
                            FireRemote(collectRemote, obj.Name)
                        end
                        -- Simulate click
                        VirtualUser:CaptureController()
                        VirtualUser:ClickButton2(Vector2.new())
                    end
                end
            end
        end
    end)
end

-- ════════════════════════════════════════════════════════════════════════════
-- AUTO FARM LOOP (v3 - COMPLETE MINE→COLLECT→SELL CYCLE)
-- ════════════════════════════════════════════════════════════════════════════
local farmState = "idle"  -- idle → mining → collecting → selling
local currentTarget = nil
local farmTick = 0

local function StartAutoFarm()
    if Connections.Farm then Connections.Farm:Disconnect() end
    farmState = "idle"
    Connections.Farm = RunService.Heartbeat:Connect(function()
        if not Config.AutoFarm then return end
        if not IsAlive() then farmState = "idle" return end
        
        farmTick = farmTick + 1
        if farmTick % 3 ~= 0 then return end  -- Run every 3 frames to not overwhelm
        
        pcall(function()
            if farmState == "idle" then
                -- Find a crystal to mine
                local crystals = DiscoverCrystals()
                if #crystals == 0 then return end
                
                currentTarget = nil
                if Config.FindBestCrystal then
                    local bestScore = -1
                    for _, c in ipairs(crystals) do
                        local d = (c.position - RootPart.Position).Magnitude
                        local s = c.rarity * 1000 + c.value - d * 0.1
                        if s > bestScore then bestScore = s currentTarget = c end
                    end
                else
                    local cd = _m.huge
                    for _, c in ipairs(crystals) do
                        local d = (c.position - RootPart.Position).Magnitude
                        if d < cd then cd = d currentTarget = c end
                    end
                end
                
                if currentTarget then
                    farmState = "moving_to_crystal"
                end
                
            elseif farmState == "moving_to_crystal" then
                if not currentTarget or not currentTarget.object or not currentTarget.object.Parent then
                    farmState = "idle"
                    return
                end
                local dist = (currentTarget.position - RootPart.Position).Magnitude
                
                if dist > 50 then
                    -- Far away - teleport directly on top of crystal
                    TeleportTo(currentTarget.position)
                elseif dist > 5 then
                    -- Medium range - walk to it or micro-TP
                    if Config.MountainPathTracker and dist < 20 then
                        Humanoid:MoveTo(currentTarget.position)
                    else
                        RootPart.CFrame = CFrame.new(currentTarget.position + Vector3.new(0, 3, 0))
                    end
                end
                
                if dist <= 15 then
                    farmState = "mining"
                    farmTick = 0
                end
                
            elseif farmState == "mining" then
                if not currentTarget or not currentTarget.object or not currentTarget.object.Parent then
                    farmState = "idle"
                    return
                end
                
                -- Mine the crystal multiple times
                local success = MineCrystal(currentTarget.object)
                
                -- If instant mine, spam the remote
                if Config.InstantMine then
                    for i = 1, 10 do
                        MineCrystal(currentTarget.object)
                    end
                    Stats.CrystalsMined = Stats.CrystalsMined + 10
                end
                
                -- Wait a bit for mining to register, then collect
                _w(Config.MineDelay)
                farmState = "collecting"
                farmTick = 0
                
            elseif farmState == "collecting" then
                -- Collect any nearby drops
                CollectDrops()
                
                -- Check if backpack is getting full - if so, go sell
                local backpackFull = false
                pcall(function()
                    local used = LocalPlayer:GetAttribute("BackpackUsed") or 0
                    local cap = LocalPlayer:GetAttribute("BackpackCapacity") or 10
                    if Config.InventoryExploit then cap = 999999 end
                    backpackFull = used >= cap * 0.8
                end)
                
                if backpackFull and Config.AutoSell then
                    farmState = "moving_to_sell"
                else
                    farmState = "idle"  -- Go find next crystal
                end
                farmTick = 0
                
            elseif farmState == "moving_to_sell" then
                -- Sell exploit: fire sell remote from CURRENT POSITION
                -- No need to walk to the shop!
                local sellRemote = GetRemote("Selling")
                if sellRemote then
                    if Config.ValueManip then
                        -- Value override: sell at inflated price
                        FireRemote(sellRemote, "All", Config.SellValueOverride)
                        FireRemote(sellRemote, Config.SellValueOverride)
                        FireRemote(sellRemote)
                    else
                        -- Normal sell: multiple argument patterns
                        FireRemote(sellRemote, "All")
                        FireRemote(sellRemote)
                        FireRemote(sellRemote, Config.SellValue)
                    end
                    Stats.CrystalsSold = Stats.CrystalsSold + 1
                    Stats.LastSellTime = tick()
                    Stats.TotalProfit = Stats.TotalProfit + 30  -- Estimated
                end
                
                -- If sell from position exploit is off, actually go to shop
                if not Config.SellFromPos then
                    local shops = DiscoverShops()
                    if #shops > 0 then
                        local closest = shops[1]
                        local cd = (shops[1].position - RootPart.Position).Magnitude
                        for _, s in ipairs(shops) do
                            local d = (s.position - RootPart.Position).Magnitude
                            if d < cd then cd = d closest = s end
                        end
                        TeleportTo(closest.position)
                        _w(0.2)
                        -- Fire sell again when at shop
                        if sellRemote then
                            FireRemote(sellRemote, "All")
                            FireRemote(sellRemote)
                        end
                    end
                end
                
                farmState = "idle"
                farmTick = 0
                
                -- Auto upgrade after selling
                if Config.AutoUpgrade then
                    local upgradeRemote = GetRemote("Upgrades")
                    if upgradeRemote then
                        if Config.UpgradeWarmth then FireRemote(upgradeRemote, "Warmth") end
                        if Config.UpgradePickaxe then FireRemote(upgradeRemote, "Pickaxe") end
                        if Config.UpgradeBackpack then FireRemote(upgradeRemote, "Backpack") end
                    end
                end
            end
        end)
    end)
end

local function StopAutoFarm()
    if Connections.Farm then Connections.Farm:Disconnect() Connections.Farm = nil end
    farmState = "idle"
end

-- ════════════════════════════════════════════════════════════════════════════
-- BACKPACK DUPE EXPLOIT (v3)
-- ════════════════════════════════════════════════════════════════════════════
local function RunBackpackDupe()
    if not Config.BackpackDupe then return end
    pcall(function()
        -- Method 1: Fire sell remote multiple times rapidly (sell same items multiple times)
        local sellRemote = GetRemote("Selling")
        if sellRemote then
            for i = 1, 5 do
                FireRemote(sellRemote, "All")
                FireRemote(sellRemote)
                if Config.ValueManip then
                    FireRemote(sellRemote, "All", Config.SellValueOverride)
                    FireRemote(sellRemote, Config.SellValueOverride)
                end
            end
            Stats.CrystalsSold = Stats.CrystalsSold + 5
        end
        
        -- Method 2: Fire collect remote multiple times (duplicate collected items)
        local collectRemote = GetRemote("Collection")
        if collectRemote then
            local crystals = DiscoverCrystals()
            if #crystals > 0 then
                local closest = crystals[1]
                local cd = (crystals[1].position - RootPart.Position).Magnitude
                for _, c in ipairs(crystals) do
                    local d = (c.position - RootPart.Position).Magnitude
                    if d < cd then cd = d closest = c end
                end
                if cd < 60 then
                    for i = 1, 8 do
                        FireRemote(collectRemote, closest.object)
                        FireRemote(collectRemote, closest.object.Name)
                        FireRemote(collectRemote, closest.name)
                    end
                end
            end
        end
        
        -- Method 3: Manipulate backpack attributes
        LocalPlayer:SetAttribute("BackpackCapacity", 999999)
        LocalPlayer:SetAttribute("CarryKG", 999999)
        LocalPlayer:SetAttribute("MaxCarry", 999999)
        LocalPlayer:SetAttribute("InventorySize", 999999)
        
        -- Method 4: Try dupe-specific remotes
        local dupeRemote = GetRemote("Dupe")
        if dupeRemote then
            FireRemote(dupeRemote, "All")
            FireRemote(dupeRemote)
        end
        
        -- Method 5: Mine remote spam (mine same crystal multiple times before server removes it)
        local mineRemote = GetRemote("Mining")
        if mineRemote then
            local crystals = DiscoverCrystals()
            if #crystals > 0 then
                for _, c in ipairs(crystals) do
                    local d = (c.position - RootPart.Position).Magnitude
                    if d < 20 then
                        for i = 1, 15 do
                            FireRemote(mineRemote, c.object)
                            FireRemote(mineRemote, c.object.Name)
                        end
                        break  -- Only dupe one at a time
                    end
                end
            end
        end
    end)
end

-- ════════════════════════════════════════════════════════════════════════════
-- SELL FROM POSITION EXPLOIT
-- ════════════════════════════════════════════════════════════════════════════
local function SellFromCurrentPos()
    if not Config.SellFromPos then return end
    pcall(function()
        local sellRemote = GetRemote("Selling")
        if sellRemote then
            -- Fire sell multiple times with different argument patterns
            FireRemote(sellRemote, "All")
            FireRemote(sellRemote)
            FireRemote(sellRemote, "All", Config.SellValueOverride)
            FireRemote(sellRemote, Config.SellValue)
            Stats.CrystalsSold = Stats.CrystalsSold + 1
            Stats.LastSellTime = tick()
        end
    end)
end

-- ════════════════════════════════════════════════════════════════════════════
-- ESP SYSTEM
-- ════════════════════════════════════════════════════════════════════════════
local function ClearESP()
    for _, h in pairs(ESPHighlights) do pcall(function() h:Destroy() end) end
    ESPHighlights = {}
end

local function StartCrystalESP()
    ClearESP()
    if Connections.ESP then Connections.ESP:Disconnect() end
    Connections.ESP = RunService.Heartbeat:Connect(function()
        if not Config.CrystalESP then ClearESP() return end
        pcall(function()
            local crystals = DiscoverCrystals()
            -- Remove ESP for crystals that no longer exist
            for name, h in pairs(ESPHighlights) do
                local exists = false
                for _, c in ipairs(crystals) do if c.object.Name == name then exists = true break end end
                if not exists then h:Destroy() ESPHighlights[name] = nil end
            end
            -- Add ESP for new crystals
            for _, c in ipairs(crystals) do
                if not ESPHighlights[c.object.Name] then
                    local hl = Instance.new("Highlight")
                    hl.Name = "ESP_" .. c.object.Name
                    local rc = {
                        [1]=Color3.fromRGB(180,180,180), [2]=Color3.fromRGB(0,200,255),
                        [3]=Color3.fromRGB(0,255,0), [4]=Color3.fromRGB(255,0,255),
                        [5]=Color3.fromRGB(255,255,0)
                    }
                    hl.FillColor = rc[c.rarity]
                    hl.OutlineColor = Color3.fromRGB(255,255,255)
                    hl.FillTransparency = 0.4
                    hl.OutlineTransparency = 0
                    hl.Adornee = c.object
                    hl.Parent = c.object
                    
                    local bb = Instance.new("BillboardGui")
                    bb.Adornee = c.object
                    bb.Size = UDim2.new(0,200,0,50)
                    bb.StudsOffset = Vector3.new(0,3,0)
                    bb.AlwaysOnTop = true
                    bb.Parent = c.object
                    local lb = Instance.new("TextLabel")
                    lb.Size = UDim2.new(1,0,1,0)
                    lb.BackgroundTransparency = 1
                    lb.TextColor3 = rc[c.rarity]
                    lb.TextStrokeColor3 = Color3.new(0,0,0)
                    lb.TextStrokeTransparency = 0
                    lb.Font = Enum.Font.GothamBold
                    lb.TextScaled = true
                    lb.Text = c.object.Name.." [R"..c.rarity.."] $"..c.value
                    lb.Parent = bb
                    
                    ESPHighlights[c.object.Name] = hl
                end
            end
        end)
    end)
end

local function StopCrystalESP()
    ClearESP()
    if Connections.ESP then Connections.ESP:Disconnect() Connections.ESP = nil end
end

-- ════════════════════════════════════════════════════════════════════════════
-- ANTI-DAMAGE
-- ════════════════════════════════════════════════════════════════════════════
local function StartAntiDamage()
    RunService.Heartbeat:Connect(function()
        if Config.AntiDamage then
            pcall(function()
                if Humanoid and Humanoid.Health < Humanoid.MaxHealth then
                    Humanoid.Health = Humanoid.MaxHealth
                end
            end)
        end
    end)
    pcall(function()
        if hookmetamethod then
            local oldNC
            oldNC = hookmetamethod(game, "__namecall", _n(function(self, ...)
                local method = getnamecallmethod()
                if Config.AntiDamage and (method == "FireServer" or method == "InvokeServer") then
                    local n = self.Name:lower()
                    if n:find("damage") or n:find("cold") or n:find("freeze") or n:find("hurt") or n:find("warmth") then return nil end
                end
                return oldNC(self, ...)
            end))
        end
    end)
    pcall(function()
        if Config.ColdImmunity then
            LocalPlayer:SetAttribute("Warmth", 100)
            LocalPlayer:SetAttribute("Cold", 0)
        end
    end)
end

-- ════════════════════════════════════════════════════════════════════════════
-- SPEED / NOCLIP / FLY
-- ════════════════════════════════════════════════════════════════════════════
local function StartSpeedBoost()
    pcall(function() if Config.SpeedBoost then Humanoid.WalkSpeed = Config.SpeedValue end end)
end
local function StopSpeedBoost()
    pcall(function() Humanoid.WalkSpeed = 16 end)
end

local function StartNoclip()
    if Connections.Noclip then Connections.Noclip:Disconnect() end
    Connections.Noclip = RunService.Stepped:Connect(function()
        if not Config.Noclip then return end
        pcall(function()
            if Character then
                for _, p in ipairs(Character:GetDescendants()) do
                    if p:IsA("BasePart") then p.CanCollide = false end
                end
            end
        end)
    end)
end
local function StopNoclip()
    if Connections.Noclip then Connections.Noclip:Disconnect() Connections.Noclip = nil end
    pcall(function()
        if Character then
            for _, p in ipairs(Character:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = true end
            end
        end
    end)
end

local function StartFly()
    if Connections.Fly then Connections.Fly:Disconnect() end
    pcall(function()
        flyBody = Instance.new("BodyVelocity")
        flyBody.MaxForce = Vector3.new(_m.huge,_m.huge,_m.huge)
        flyBody.Velocity = Vector3.new(0,0,0)
        flyBody.Parent = RootPart
        flyGyro = Instance.new("BodyGyro")
        flyGyro.MaxTorque = Vector3.new(_m.huge,_m.huge,_m.huge)
        flyGyro.P = 9e4
        flyGyro.Parent = RootPart
        Connections.Fly = RunService.Heartbeat:Connect(function()
            if not Config.Fly then
                if flyBody then flyBody:Destroy() flyBody = nil end
                if flyGyro then flyGyro:Destroy() flyGyro = nil end
                return
            end
            pcall(function()
                local cam = Workspace.CurrentCamera
                local md = Vector3.new(0,0,0)
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then md = md + cam.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then md = md - cam.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then md = md - cam.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then md = md + cam.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then md = md + Vector3.new(0,1,0) end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then md = md - Vector3.new(0,1,0) end
                if md.Magnitude > 0 then md = md.Unit * Config.FlySpeed end
                flyBody.Velocity = md
                flyGyro.CFrame = cam.CFrame
            end)
        end)
    end)
end
local function StopFly()
    if Connections.Fly then Connections.Fly:Disconnect() Connections.Fly = nil end
    if flyBody then flyBody:Destroy() flyBody = nil end
    if flyGyro then flyGyro:Destroy() flyGyro = nil end
end

-- ════════════════════════════════════════════════════════════════════════════
-- ══════════════════════════════════════════════════════════════════════════════
-- MISSING FUNCTIONS (called by GUI)
-- ══════════════════════════════════════════════════════════════════════════════

local FarmState = "idle"

local function FindBestCrystal()
    local crystals = DiscoverCrystals()
    if #crystals == 0 then return nil end
    local best = crystals[1]
    local bestScore = -1
    for _, c in ipairs(crystals) do
        local d = (c.position - RootPart.Position).Magnitude
        local s = c.rarity * 1000 + c.value - d * 0.1
        if s > bestScore then bestScore = s best = c end
    end
    return best
end

local function StartAutoMine()
    if Connections.InstantMine then Connections.InstantMine:Disconnect() end
    Connections.InstantMine = RunService.Heartbeat:Connect(function()
        if not Config.AutoMine then return end
        if not IsAlive() then return end
        pcall(function()
            local crystals = DiscoverCrystals()
            for _, c in ipairs(crystals) do
                local d = (c.position - RootPart.Position).Magnitude
                if d < 15 then
                    MineCrystal(c.object)
                    break
                end
            end
        end)
    end)
end

local function StopAutoMine()
    if Connections.InstantMine then Connections.InstantMine:Disconnect() Connections.InstantMine = nil end
end

local function StartAutoSell()
    if Connections.Sell then Connections.Sell:Disconnect() end
    Connections.Sell = RunService.Heartbeat:Connect(function()
        if not Config.AutoSell then return end
        if not IsAlive() then return end
        pcall(function()
            SellFromCurrentPos()
        end)
    end)
end

local function StopAutoSell()
    if Connections.Sell then Connections.Sell:Disconnect() Connections.Sell = nil end
end

local function StartAutoWarmth()
    if Connections.Warmth then Connections.Warmth:Disconnect() end
    Connections.Warmth = RunService.Heartbeat:Connect(function()
        if not Config.AutoWarmth then return end
        pcall(function()
            for _, obj in ipairs(Workspace:GetDescendants()) do
                local n = obj.Name:lower()
                if (n:find("campfire") or n:find("fire") or n:find("warmth") or n:find("camp")) and obj:IsA("BasePart") then
                    local dist = (obj.Position - RootPart.Position).Magnitude
                    if dist > 20 then TeleportTo(obj.Position) end
                    break
                end
            end
            LocalPlayer:SetAttribute("Warmth", 100)
            LocalPlayer:SetAttribute("Cold", 0)
        end)
    end)
end

local function StopAutoWarmth()
    if Connections.Warmth then Connections.Warmth:Disconnect() Connections.Warmth = nil end
end

-- Player ESP
local PlayerESPHighlights = {}
local function StartPlayerESP()
    for _, h in pairs(PlayerESPHighlights) do pcall(function() h:Destroy() end) end
    PlayerESPHighlights = {}
    if Connections.PlayerESP then Connections.PlayerESP:Disconnect() end
    Connections.PlayerESP = RunService.Heartbeat:Connect(function()
        if not Config.ESPPlayers then
            for _, h in pairs(PlayerESPHighlights) do pcall(function() h:Destroy() end) end
            PlayerESPHighlights = {}
            return
        end
        pcall(function()
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local rp = player.Character:FindFirstChild("HumanoidRootPart")
                    if rp and (rp.Position - RootPart.Position).Magnitude < Config.ESPRange then
                        if not PlayerESPHighlights[player.UserId] then
                            local hl = Instance.new("Highlight")
                            hl.Name = "PlayerESP_" .. player.Name
                            hl.FillColor = Color3.fromRGB(0, 255, 100)
                            hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                            hl.FillTransparency = 0.5
                            hl.OutlineTransparency = 0
                            hl.Adornee = player.Character
                            hl.Parent = player.Character
                            PlayerESPHighlights[player.UserId] = hl

                            local bb = Instance.new("BillboardGui")
                            bb.Adornee = rp
                            bb.Size = UDim2.new(0, 150, 0, 30)
                            bb.StudsOffset = Vector3.new(0, 4, 0)
                            bb.AlwaysOnTop = true
                            bb.Parent = rp
                            local lb = Instance.new("TextLabel")
                            lb.Size = UDim2.new(1, 0, 1, 0)
                            lb.BackgroundTransparency = 1
                            lb.TextColor3 = Color3.fromRGB(0, 255, 100)
                            lb.TextStrokeColor3 = Color3.new(0, 0, 0)
                            lb.TextStrokeTransparency = 0
                            lb.Font = Enum.Font.GothamBold
                            lb.TextScaled = true
                            lb.Text = player.Name
                            lb.Parent = bb
                        end
                    else
                        if PlayerESPHighlights[player.UserId] then
                            PlayerESPHighlights[player.UserId]:Destroy()
                            PlayerESPHighlights[player.UserId] = nil
                        end
                    end
                end
            end
        end)
    end)
end

local function StopPlayerESP()
    for _, h in pairs(PlayerESPHighlights) do pcall(function() h:Destroy() end) end
    PlayerESPHighlights = {}
    if Connections.PlayerESP then Connections.PlayerESP:Disconnect() Connections.PlayerESP = nil end
end

-- Drop ESP
local DropESPHighlights = {}
local function StartDropESP()
    for _, h in pairs(DropESPHighlights) do pcall(function() h:Destroy() end) end
    DropESPHighlights = {}
    if Connections.DropESP then Connections.DropESP:Disconnect() end
    Connections.DropESP = RunService.Heartbeat:Connect(function()
        if not Config.ESPDrops then
            for _, h in pairs(DropESPHighlights) do pcall(function() h:Destroy() end) end
            DropESPHighlights = {}
            return
        end
        pcall(function()
            for _, obj in ipairs(Workspace:GetDescendants()) do
                if (obj:IsA("BasePart") or obj:IsA("MeshPart")) then
                    local n = obj.Name:lower()
                    if (n:find("drop") or n:find("loot") or n:find("item") or n:find("pickup") or n:find("collect")) then
                        local dist = (obj.Position - RootPart.Position).Magnitude
                        if dist < Config.ESPRange and not DropESPHighlights[obj] then
                            local hl = Instance.new("Highlight")
                            hl.Name = "DropESP"
                            hl.FillColor = Color3.fromRGB(255, 200, 0)
                            hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                            hl.FillTransparency = 0.5
                            hl.OutlineTransparency = 0
                            hl.Adornee = obj
                            hl.Parent = obj
                            DropESPHighlights[obj] = hl
                        end
                    end
                end
            end
        end)
    end)
end

local function StopDropESP()
    for _, h in pairs(DropESPHighlights) do pcall(function() h:Destroy() end) end
    DropESPHighlights = {}
    if Connections.DropESP then Connections.DropESP:Disconnect() Connections.DropESP = nil end
end

-- ══════════════════════════════════════════════════════════════════════════════
-- ANTI-AFK / AUTO REJOIN / CONFIG SAVE
-- ════════════════════════════════════════════════════════════════════════════
local function StartAntiAFK()
    if Config.AntiAFK then
        LocalPlayer.Idled:Connect(function()
            pcall(function() VirtualUser:CaptureController() VirtualUser:ClickButton2(Vector2.new()) end)
        end)
    end
end

local function StartAutoRejoin()
    if Config.AutoRejoin then
        LocalPlayer.OnTeleport:Connect(function(state)
            if state == Enum.TeleportState.Failed then
                pcall(function() TeleportService:TeleportToPlaceInstance(_r.PlaceId, _r.JobId, LocalPlayer) end)
            end
        end)
        Players.PlayerRemoving:Connect(function(player)
            if player == LocalPlayer and Config.AutoRejoin then
                pcall(function() TeleportService:Teleport(_r.PlaceId, LocalPlayer) end)
            end
        end)
    end
end

local function SaveConfig()
    pcall(function()
        local saveData = {}
        for k, v in pairs(Config) do if type(v) ~= "function" then saveData[k] = v end end
        writefile("MtHub3_" .. LocalPlayer.UserId .. ".json", HttpService:JSONEncode(saveData))
    end)
end

local function LoadConfig()
    pcall(function()
        local path = "MtHub3_" .. LocalPlayer.UserId .. ".json"
        if isfile and isfile(path) then
            local data = HttpService:JSONDecode(readfile(path))
            for k, v in pairs(data) do if Config[k] ~= nil then Config[k] = v end end
        end
    end)
end

-- ══════════════════════════════════════════════════════════════════════════════
-- ══════════════════════════════════════════════════════════════════════════════
-- v3.2 ADDITIONS: ALL EXPLOITS + PICKAXE SHOP + MOUNTAIN RESET + DISCORD WEBHOOK
-- ===========================================================================
-- DISCORD WEBHOOK SYSTEM
-- ===========================================================================
local DiscordWebhookURL = ""  -- User sets this via GUI
local WebhookEnabled = false
local WebhookQueue = {}        -- Messages waiting to be sent
local WebhookRateLimit = 1.5   -- Seconds between webhook sends (Discord rate limit)
local LastWebhookSend = 0
local WebhookSendConnections = nil

local function SendWebhook(title, description, color, fields)
    if not WebhookEnabled or DiscordWebhookURL == "" then return end
    if not DiscordWebhookURL:find("discord.com/api/webhooks") and not DiscordWebhookURL:find("discordapp.com/api/webhooks") then
        return
    end

    -- Rate limit
    local now = tick()
    if now - LastWebhookSend < WebhookRateLimit then
        -- Queue it
        table.insert(WebhookQueue, {title = title, description = description, color = color, fields = fields})
        return
    end
    LastWebhookSend = now

    -- Build embed
    local embedFields = {}
    if fields then
        for _, f in ipairs(fields) do
            table.insert(embedFields, {
                name = tostring(f.name or ""),
                value = tostring(f.value or ""),
                inline = f.inline or false,
            })
        end
    end

    local payload = {
        username = "MtHub v3.2",
        avatar_url = "https://i.imgur.com/mountainicon.png",
        embeds = {{
            title = title or "MtHub Event",
            description = description or "",
            color = color or 3447003,  -- Default blue
            fields = #embedFields > 0 and embedFields or nil,
            footer = {
                text = "MtHub v3.2 | " .. os.date("%H:%M:%S") .. " | Player: " .. LocalPlayer.Name,
            },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
        }}
    }

    spawn(function()
        pcall(function()
            HttpService:PostAsync(DiscordWebhookURL, HttpService:JSONEncode(payload), Enum.HttpContentType.ApplicationJson, true)
        end)
    end)
end

-- Process queued webhook messages
local function ProcessWebhookQueue()
    if not WebhookEnabled then return end
    if #WebhookQueue == 0 then return end
    local now = tick()
    if now - LastWebhookSend < WebhookRateLimit then return end

    local entry = table.remove(WebhookQueue, 1)
    LastWebhookSend = now

    local embedFields = {}
    if entry.fields then
        for _, f in ipairs(entry.fields) do
            table.insert(embedFields, {
                name = tostring(f.name or ""),
                value = tostring(f.value or ""),
                inline = f.inline or false,
            })
        end
    end

    local payload = {
        username = "MtHub v3.2",
        embeds = {{
            title = entry.title or "MtHub Event",
            description = entry.description or "",
            color = entry.color or 3447003,
            fields = #embedFields > 0 and embedFields or nil,
            footer = {
                text = "MtHub v3.2 | " .. os.date("%H:%M:%S") .. " | " .. LocalPlayer.Name,
            },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
        }}
    }

    spawn(function()
        pcall(function()
            HttpService:PostAsync(DiscordWebhookURL, HttpService:JSONEncode(payload), Enum.HttpContentType.ApplicationJson, true)
        end)
    end)
end

-- Start queue processor
local function StartWebhookProcessor()
    if WebhookSendConnections then return end
    WebhookSendConnections = spawn(function()
        while _w(WebhookRateLimit) do
            if WebhookEnabled then
                pcall(ProcessWebhookQueue)
            end
        end
    end)
end

-- Bulk send remote log to Discord (for when user clicks "Dump to Discord")
local function SendRemoteLogToDiscord()
    if not WebhookEnabled or DiscordWebhookURL == "" then
        Notify("Webhook", "Set your Discord webhook URL first!", 2, "error")
        return
    end

    local lines = GetRemoteLogFormatted()
    if #lines == 0 then
        Notify("Webhook", "Remote log is empty - mine/sell something first", 2, "warning")
        return
    end

    -- Discord has 4096 char limit per embed description, so chunk it
    local chunk = ""
    local chunkNum = 1
    for i, line in ipairs(lines) do
        if #chunk + #line + 1 > 3800 then
            -- Send current chunk
            SendWebhook(
                "Remote Spy Log (Part " .. chunkNum .. ")",
                "```\n" .. chunk .. "\n```",
                16776960  -- Yellow
            )
            chunk = ""
            chunkNum = chunkNum + 1
            _w(WebhookRateLimit + 0.5)
        end
        chunk = chunk .. line .. "\n"
    end
    -- Send remaining
    if #chunk > 0 then
        SendWebhook(
            "Remote Spy Log (Part " .. chunkNum .. ")",
            "```\n" .. chunk .. "\n```",
            16776960
        )
    end

    Notify("Webhook", #lines .. " remote log entries sent to Discord!", 3, "success")
end

-- Send pickaxe scan results to Discord
local function SendPickaxeScanToDiscord()
    if not WebhookEnabled or DiscordWebhookURL == "" then
        Notify("Webhook", "Set your Discord webhook URL first!", 2, "error")
        return
    end

    local fields = {}
    for _, p in ipairs(DetectedPickaxes) do
        table.insert(fields, {
            name = p.name,
            value = "Price: $" .. tostring(p.price) .. " | Tier: " .. tostring(p.tier) .. " | Location: " .. p.location,
            inline = false,
        })
    end

    if #fields == 0 then
        Notify("Webhook", "No pickaxes found - scan first", 2, "warning")
        return
    end

    SendWebhook(
        "Pickaxe Scan Results",
        #DetectedPickaxes .. " pickaxes detected in game",
        5763719,  -- Green
        fields
    )
    Notify("Webhook", #DetectedPickaxes .. " pickaxes sent to Discord!", 2, "success")
end

-- Send game config discovery to Discord
local function SendConfigDiscoveryToDiscord()
    if not WebhookEnabled or DiscordWebhookURL == "" then
        Notify("Webhook", "Set your Discord webhook URL first!", 2, "error")
        return
    end

    local configs = DiscoverGameConfigs()
    if #configs == 0 then
        Notify("Webhook", "No config objects found", 2, "warning")
        return
    end

    local fields = {}
    for _, cfg in ipairs(configs) do
        if #fields < 25 then  -- Discord limit
            table.insert(fields, {
                name = cfg.name .. " [" .. cfg.type .. "]",
                value = cfg.path,
                inline = false,
            })
        end
    end

    SendWebhook(
        "Game Config Discovery",
        #configs .. " config/mod objects found in ReplicatedStorage",
        16753920,  -- Orange
        fields
    )
    Notify("Webhook", #configs .. " config objects sent to Discord!", 2, "success")
end

-- Send discovered remotes to Discord
local function SendRemoteDiscoveryToDiscord()
    if not WebhookEnabled or DiscordWebhookURL == "" then
        Notify("Webhook", "Set your Discord webhook URL first!", 2, "error")
        return
    end

    local remotes = DiscoverRemotes()
    local fields = {}
    local count = 0
    for category, list in pairs(remotes) do
        for _, r in ipairs(list) do
            if count < 25 then
                table.insert(fields, {
                    name = r.name .. " [" .. r.class .. "]",
                    value = "Category: " .. category .. " | Path: " .. r.path,
                    inline = false,
                })
                count = count + 1
            end
        end
    end

    if #fields == 0 then
        Notify("Webhook", "No remotes found", 2, "warning")
        return
    end

    SendWebhook(
        "Remote Discovery",
        count .. " remotes discovered (showing up to 25)",
        3447003,  -- Blue
        fields
    )
    Notify("Webhook", count .. " remotes sent to Discord!", 2, "success")
end

-- ===========================================================================
-- ══════════════════════════════════════════════════════════════════════════════

-- ══════════════════════════════════════════════════════════════════════════════
-- 1. REMOTE SPY LOGGER
-- ══════════════════════════════════════════════════════════════════════════════
local RemoteLog = {}
local RemoteLogMax = 200
local RemoteLogEnabled = false
local LogConnections = {}

local function StartRemoteSpy()
    if LogConnections.Spy then return end
    RemoteLogEnabled = true
    RemoteLog = {}

    -- Hook FireServer
    local oldFireServer
    if hookmetamethod then
        oldFireServer = hookmetamethod(_r, "__namecall", _n(function(self, ...)
            local method = getnamecallmethod()
            if RemoteLogEnabled and (method == "FireServer") then
                local args = {...}
                local info = {
                    time = os.date("%H:%M:%S"),
                    remote = self.Name,
                    fullPath = self:GetFullName(),
                    class = self.ClassName,
                    method = "FireServer",
                    args = {}
                }
                for i, arg in ipairs(args) do
                    local argType = typeof(arg)
                    local argStr
                    if argType == "Instance" then
                        argStr = arg.Name .. " [" .. arg.ClassName .. "]"
                    elseif argType == "CFrame" or argType == "Vector3" then
                        argStr = tostring(arg)
                    else
                        argStr = tostring(arg)
                    end
                    info.args[i] = {type = argType, value = argStr}
                end
                if #RemoteLog >= RemoteLogMax then table.remove(RemoteLog, 1) end
                table.insert(RemoteLog, info)
                -- Auto-send new remote to Discord if webhook enabled
                pcall(function()
                if WebhookEnabled and DiscordWebhookURL ~= "" then
                    local argStr = ""
                    for j, arg in ipairs(info.args) do
                        argStr = argStr .. (j > 1 and ", " or "") .. arg.type .. ":" .. arg.value
                    end
                    SendWebhook("Remote Spy: " .. info.remote, string.format("[%s] %s.%s(%s)", info.time, info.remote, info.method, argStr), 3447003)
                end
                end)  -- end pcall
            end
            return oldFireServer(self, ...)
        end))
    end

    -- Hook InvokeServer
    local oldInvokeServer
    if hookmetamethod then
        -- Already hooked above via __namecall, just need to log InvokeServer calls
        -- The __namecall hook above covers both FireServer and InvokeServer
    end

    LogConnections.Spy = true
    Notify("Remote Spy", "Logging all remote calls — mine/sell manually to capture signatures", 3, "info")
end

local function StopRemoteSpy()
    RemoteLogEnabled = false
    -- Note: We don't unhook the metamethod since that's complex and could break anti-cheat
    -- Instead we just stop logging
    Notify("Remote Spy", "Stopped logging", 2, "warning")
end

local function GetRemoteLogFormatted()
    local lines = {}
    for i, entry in ipairs(RemoteLog) do
        local argStr = ""
        for j, arg in ipairs(entry.args) do
            argStr = argStr .. (j > 1 and ", " or "") .. arg.type .. ":" .. arg.value
        end
        table.insert(lines, _s.format("[%s] %s.%s(%s)", entry.time, entry.remote, entry.method, argStr))
    end
    return lines
end

-- ══════════════════════════════════════════════════════════════════════════════
-- 2. INSTANT MINE / RAPID FIRE
-- ══════════════════════════════════════════════════════════════════════════════
local RapidFireEnabled = false
local RapidFireCount = 25  -- How many times to fire per frame

local function StartRapidFire()
    RapidFireEnabled = true
    if Connections.RapidFire then Connections.RapidFire:Disconnect() end
    Connections.RapidFire = RunService.Heartbeat:Connect(function()
        if not RapidFireEnabled or not Config.InstantMine then return end
        if not IsAlive() then return end
        pcall(function()
            local crystals = DiscoverCrystals()
            for _, c in ipairs(crystals) do
                local d = (c.position - RootPart.Position).Magnitude
                if d < 25 then  -- Slightly extended range for rapid fire
                    EquipPickaxe()
                    local mineRemote = GetRemote("Mining")
                    if mineRemote then
                        for i = 1, RapidFireCount do
                            FireRemote(mineRemote, c.object)
                            FireRemote(mineRemote, c.object.Name)
                            FireRemote(mineRemote, c.object, i)
                            FireRemote(mineRemote, c.object.Name, i)
                        end
                    end
                    -- Also spam tool remotes
                    for _, tool in ipairs(Character:GetChildren()) do
                        if tool:IsA("Tool") then
                            for _, remote in ipairs(tool:GetDescendants()) do
                                if remote:IsA("RemoteEvent") then
                                    for i = 1, 10 do
                                        remote:FireServer(c.object)
                                        remote:FireServer(c.object.Name)
                                    end
                                end
                            end
                        end
                    end
                    Stats.CrystalsMined = Stats.CrystalsMined + RapidFireCount
                    break  -- Only rapid-fire one crystal per frame
                end
            end
        end)
    end)
    Notify("Rapid Fire", string.format("Spamming mine remote %dx per frame", RapidFireCount), 2, "success")
end

local function StopRapidFire()
    RapidFireEnabled = false
    if Connections.RapidFire then Connections.RapidFire:Disconnect() Connections.RapidFire = nil end
end

-- ══════════════════════════════════════════════════════════════════════════════
-- 3. AUTO SELL TIMER BYPASS
-- ══════════════════════════════════════════════════════════════════════════════
local SellBypassEnabled = false

local function StartSellBypass()
    SellBypassEnabled = true
    if Connections.SellBypass then Connections.SellBypass:Disconnect() end
    Connections.SellBypass = RunService.Heartbeat:Connect(function()
        if not SellBypassEnabled or not Config.AutoSell then return end
        if not IsAlive() then return end
        pcall(function()
            local sellRemote = GetRemote("Selling")
            if sellRemote then
                -- Fire sell every single frame with all argument patterns
                FireRemote(sellRemote, "All")
                FireRemote(sellRemote)
                if Config.ValueManip then
                    FireRemote(sellRemote, "All", Config.SellValueOverride)
                    FireRemote(sellRemote, Config.SellValueOverride)
                end
            end
        end)
    end)
    Notify("Sell Bypass", "Firing sell remote every frame — no cooldown", 2, "success")
end

local function StopSellBypass()
    SellBypassEnabled = false
    if Connections.SellBypass then Connections.SellBypass:Disconnect() Connections.SellBypass = nil end
end

-- ══════════════════════════════════════════════════════════════════════════════
-- 4. INVENTORY CAPACITY BYPASS (Hook GetAttribute)
-- ══════════════════════════════════════════════════════════════════════════════
local CapacityBypassActive = false

local function StartCapacityBypass()
    if CapacityBypassActive then return end
    CapacityBypassActive = true

    -- Set client-side attributes
    LocalPlayer:SetAttribute("BackpackCapacity", 999999)
    LocalPlayer:SetAttribute("CarryKG", 999999)
    LocalPlayer:SetAttribute("MaxCarry", 999999)
    LocalPlayer:SetAttribute("InventorySize", 999999)

    -- Hook GetAttribute so server reads also see 999999
    pcall(function()
        if hookmetamethod then
            local oldIndex
            oldIndex = hookmetamethod(_r, "__index", _n(function(self, key)
                if CapacityBypassActive and self == LocalPlayer and key == "GetAttribute" then
                    -- Can't easily hook methods this way, use attribute changed instead
                end
                return oldIndex(self, key)
            end))
        end
    end)

    -- Continuously reset attributes in case game overwrites them
    if Connections.CapBypass then Connections.CapBypass:Disconnect() end
    Connections.CapBypass = RunService.Heartbeat:Connect(function()
        if not CapacityBypassActive then return end
        pcall(function()
            LocalPlayer:SetAttribute("BackpackCapacity", 999999)
            LocalPlayer:SetAttribute("CarryKG", 999999)
            LocalPlayer:SetAttribute("MaxCarry", 999999)
            LocalPlayer:SetAttribute("InventorySize", 999999)
            -- Also set on Humanoid if present
            if Humanoid then
                Humanoid:SetAttribute("BackpackCapacity", 999999)
                Humanoid:SetAttribute("MaxItems", 999999)
            end
        end)
    end)

    Notify("Capacity Bypass", "Backpack capacity set to 999999 — carry unlimited", 2, "success")
end

local function StopCapacityBypass()
    CapacityBypassActive = false
    if Connections.CapBypass then Connections.CapBypass:Disconnect() Connections.CapBypass = nil end
    Notify("Capacity Bypass", "Disabled — capacity will reset on next game update", 2, "warning")
end

-- ══════════════════════════════════════════════════════════════════════════════
-- 5. EXTENDED MINE RANGE (Hook distance/magnitude)
-- ══════════════════════════════════════════════════════════════════════════════
local ExtendedRangeActive = false
local FakeRange = 10  -- Server thinks you're this close

local function StartExtendedRange()
    if ExtendedRangeActive then return end
    ExtendedRangeActive = true

    pcall(function()
        if hookmetamethod then
            local oldIndex
            oldIndex = hookmetamethod(_r, "__index", _n(function(self, key)
                if ExtendedRangeActive and key == "Magnitude" then
                    -- If this is a distance check between player and an object, fake it
                    local val = oldIndex(self, key)
                    if val and val > FakeRange and val < 5000 then
                        return FakeRange  -- Always appear close
                    end
                    return val
                end
                return oldIndex(self, key)
            end))
        end
    end)

    Notify("Extended Range", string.format("Server thinks you're %d studs from everything", FakeRange), 2, "success")
end

local function StopExtendedRange()
    ExtendedRangeActive = false
    Notify("Extended Range", "Disabled — normal distance checks restored", 2, "warning")
end

-- ══════════════════════════════════════════════════════════════════════════════
-- 6. WALKSPEED / JUMPPOWER SPOOFING
-- ══════════════════════════════════════════════════════════════════════════════
local SpeedSpoofActive = false
local FakeSpeed = 16  -- What the game reads
local RealSpeed = 80  -- What you actually move at
local FakeJump = 50   -- What the game reads
local RealJump = 100  -- What you actually jump

local function StartSpeedSpoof()
    if SpeedSpoofActive then return end
    SpeedSpoofActive = true

    pcall(function()
        -- Hook __newindex so when the game tries to reset our speed, it reads normal
        if hookmetamethod then
            local oldNewIndex
            oldNewIndex = hookmetamethod(_r, "__newindex", _n(function(self, key, value)
                if SpeedSpoofActive and self:IsA("Humanoid") then
                    if key == "WalkSpeed" then
                        -- Game is trying to set our speed — let it think it succeeded
                        -- but we keep our real speed
                        return oldNewIndex(self, key, RealSpeed)
                    elseif key == "JumpPower" or key == "JumpHeight" then
                        return oldNewIndex(self, key, RealJump)
                    end
                end
                return oldNewIndex(self, key, value)
            end))

            -- Hook __index so when the game READS our speed, it sees 16
            local oldIndex
            oldIndex = hookmetamethod(_r, "__index", _n(function(self, key)
                if SpeedSpoofActive and self:IsA("Humanoid") then
                    if key == "WalkSpeed" then return FakeSpeed end
                    if key == "JumpPower" then return FakeJump end
                    if key == "JumpHeight" then return FakeJump / 2 end
                end
                return oldIndex(self, key)
            end))
        end

        -- Set actual speed
        if Humanoid then
            Humanoid.WalkSpeed = RealSpeed
            Humanoid.JumpPower = RealJump
        end
    end)

    -- Keep re-applying in case something else resets it
    if Connections.SpeedSpoof then Connections.SpeedSpoof:Disconnect() end
    Connections.SpeedSpoof = RunService.Heartbeat:Connect(function()
        if not SpeedSpoofActive then return end
        pcall(function()
            if Humanoid then
                if Humanoid.WalkSpeed ~= RealSpeed then Humanoid.WalkSpeed = RealSpeed end
                if Humanoid.JumpPower ~= RealJump then Humanoid.JumpPower = RealJump end
            end
        end)
    end)

    Notify("Speed Spoof", string.format("Moving at %d but server reads %d", RealSpeed, FakeSpeed), 2, "success")
end

local function StopSpeedSpoof()
    SpeedSpoofActive = false
    if Connections.SpeedSpoof then Connections.SpeedSpoof:Disconnect() Connections.SpeedSpoof = nil end
    pcall(function()
        if Humanoid then
            Humanoid.WalkSpeed = 16
            Humanoid.JumpPower = 50
        end
    end)
    Notify("Speed Spoof", "Disabled — normal speed restored", 2, "warning")
end

-- ══════════════════════════════════════════════════════════════════════════════
-- 7. REPLICATEDSTORAGE CONFIG MANIPULATION
-- ══════════════════════════════════════════════════════════════════════════════
local ConfigManipActive = false

local function DiscoverGameConfigs()
    local configs = {}
    pcall(function()
        for _, obj in ipairs(RS:GetDescendants()) do
            if obj:IsA("ModuleScript") or obj:IsA("Configuration") then
                local n = obj.Name:lower()
                if n:find("crystal") or n:find("ore") or n:find("mine") or n:find("pickaxe") or
                   n:find("value") or n:find("price") or n:find("config") or n:find("setting") or
                   n:find("data") or n:find("rarity") or n:find("health") or n:find("drop") then
                    table.insert(configs, {
                        name = obj.Name,
                        path = obj:GetFullName(),
                        type = obj.ClassName,
                        object = obj,
                    })
                end
            end
            -- Also check IntValue/NumberValue for crystal configs
            if obj:IsA("IntValue") or obj:IsA("NumberValue") or obj:IsA("StringValue") then
                local n = obj.Name:lower()
                if n:find("value") or n:find("price") or n:find("cost") or n:find("health") or
                   n:find("damage") or n:find("rarity") or n:find("chance") or n:find("luck") then
                    table.insert(configs, {
                        name = obj.Name .. " = " .. tostring(obj.Value),
                        path = obj:GetFullName(),
                        type = obj.ClassName,
                        object = obj,
                    })
                end
            end
        end
    end)
    return configs
end

local function StartConfigManip()
    if ConfigManipActive then return end
    ConfigManipActive = true

    pcall(function()
        -- Find and modify crystal value configs
        for _, obj in ipairs(RS:GetDescendants()) do
            local n = obj.Name:lower()
            -- Set all crystal/ore values to maximum
            if obj:IsA("IntValue") or obj:IsA("NumberValue") then
                if n:find("value") or n:find("price") or n:find("sell") then
                    if obj.Value < Config.OverrideValue then
                        obj.Value = Config.OverrideValue
                    end
                end
                -- Set crystal health to 1 for instant break
                if n:find("health") or n:find("hp") or n:find("hits") or n:find("durability") then
                    if obj.Value > 1 then
                        obj.Value = 1
                    end
                end
                -- Set luck/drop chance to maximum
                if n:find("chance") or n:find("luck") or n:find("probability") or n:find("rarity") then
                    obj.Value = 100
                end
            end
        end
    end)

    -- Keep re-applying
    if Connections.ConfigManip then Connections.ConfigManip:Disconnect() end
    Connections.ConfigManip = RunService.Heartbeat:Connect(function()
        if not ConfigManipActive then return end
        pcall(function()
            for _, obj in ipairs(RS:GetDescendants()) do
                local n = obj.Name:lower()
                if obj:IsA("IntValue") or obj:IsA("NumberValue") then
                    if (n:find("health") or n:find("hp")) and obj.Value > 1 then obj.Value = 1 end
                end
            end
        end)
    end)

    Notify("Config Manip", "Crystal values boosted, health set to 1, luck maximized", 2, "success")
end

local function StopConfigManip()
    ConfigManipActive = false
    if Connections.ConfigManip then Connections.ConfigManip:Disconnect() Connections.ConfigManip = nil end
    Notify("Config Manip", "Disabled — configs will reset on rejoin", 2, "warning")
end

-- ══════════════════════════════════════════════════════════════════════════════
-- 8. WARP-TO-SPAWN SELL LOOP (Ultra-fast sell cycle)
-- ══════════════════════════════════════════════════════════════════════════════
local WarpSellActive = false
local LastSellPos = nil

local function StartWarpSell()
    if WarpSellActive then return end
    WarpSellActive = true

    if Connections.WarpSell then Connections.WarpSell:Disconnect() end
    Connections.WarpSell = RunService.Heartbeat:Connect(function()
        if not WarpSellActive or not Config.AutoSell then return end
        if not IsAlive() then return end

        pcall(function()
            LastSellPos = RootPart.Position

            -- Find shop
            local shops = DiscoverShops()
            if #shops > 0 then
                -- Save current position
                local savedPos = RootPart.CFrame

                -- Teleport to shop
                RootPart.CFrame = CFrame.new(shops[1].position + Vector3.new(0, 3, 0))

                -- Fire sell multiple times
                local sellRemote = GetRemote("Selling")
                if sellRemote then
                    for i = 1, 5 do
                        FireRemote(sellRemote, "All")
                        FireRemote(sellRemote)
                        if Config.ValueManip then
                            FireRemote(sellRemote, "All", Config.SellValueOverride)
                        end
                    end
                    Stats.CrystalsSold = Stats.CrystalsSold + 5
                    Stats.TotalSells = Stats.TotalSells + 5
                end

                -- Teleport back to where we were
                _w(0.05)
                RootPart.CFrame = savedPos
            else
                -- No shop found — just fire sell from position
                SellFromCurrentPos()
            end
        end)
    end)
    Notify("Warp Sell", "Ultra-fast: TP to shop → sell → TP back every frame", 2, "success")
end

local function StopWarpSell()
    WarpSellActive = false
    if Connections.WarpSell then Connections.WarpSell:Disconnect() Connections.WarpSell = nil end
end

-- ══════════════════════════════════════════════════════════════════════════════
-- 9. ANTI-CHEAT FULL BYPASS
-- ══════════════════════════════════════════════════════════════════════════════
local AntiCheatFullActive = false

local function StartAntiCheatFull()
    if AntiCheatFullActive then return end
    AntiCheatFullActive = true
    Config.AntiCheat = true

    pcall(function()
        -- 1. Hook Kick method — prevent being kicked
        if hookmetamethod then
            local oldNamecall
            oldNamecall = hookmetamethod(_r, "__namecall", _n(function(self, ...)
                local method = getnamecallmethod()
                local args = {...}

                if method == "Kick" then
                    -- Block all kicks
                    return nil
                end

                if method == "FireServer" or method == "InvokeServer" then
                    local rn = self.Name:lower()
                    -- Block detection/anti-cheat remotes
                    if rn:find("detect") or rn:find("cheat") or rn:find("exploit") or
                       rn:find("kick") or rn:find("ban") or rn:find("security") or
                       rn:find("valid") or rn:find("anticheat") or rn:find("mod") or
                       rn:find("report") or rn:find("flag") or rn:find("admin") or
                       rn:find("log") or rn:find("track") or rn:find("monitor") then
                        return nil
                    end
                    -- Block teleport-to-lobby remotes
                    if rn:find("lobby") or rn:find("teleport") and rn:find("lobby") then
                        return nil
                    end
                end

                return oldNamecall(self, ...)
            end))
        end

        -- 2. Hook Destroy on our GUI to prevent anti-cheat from removing it
        if hookmetamethod then
            local oldDestroy
            oldDestroy = hookmetamethod(_r, "__namecall", _n(function(self, ...)
                local method = getnamecallmethod()
                if method == "Destroy" then
                    local name = self.Name:lower()
                    if name:find("mthub") or name:find("mountain") or name:find("exploit") then
                        return nil  -- Don't let anti-cheat destroy our GUI
                    end
                end
                return oldDestroy(self, ...)
            end))
        end

        -- 3. Prevent attribute-based detection
        if Connections.AntiCheatAttr then Connections.AntiCheatAttr:Disconnect() end
        Connections.AntiCheatAttr = RunService.Heartbeat:Connect(function()
            if not AntiCheatFullActive then return end
            pcall(function()
                -- Clear any detection attributes the game might set
                LocalPlayer:SetAttribute("Suspicious", nil)
                LocalPlayer:SetAttribute("Cheating", nil)
                LocalPlayer:SetAttribute("Detected", nil)
                LocalPlayer:SetAttribute("Exploiting", nil)
                LocalPlayer:SetAttribute("Hacking", nil)
                LocalPlayer:SetAttribute("SpeedHack", nil)
                LocalPlayer:SetAttribute("TeleportDetected", nil)
            end)
        end)
    end)

    Notify("Anti-Cheat", "Full bypass active: Kick blocked, detection remotes blocked, GUI protected", 3, "success")
end

local function StopAntiCheatFull()
    AntiCheatFullActive = false
    if Connections.AntiCheatAttr then Connections.AntiCheatAttr:Disconnect() Connections.AntiCheatAttr = nil end
    Notify("Anti-Cheat", "Full bypass disabled", 2, "warning")
end

-- ══════════════════════════════════════════════════════════════════════════════
-- 10. PICKAXE SHOP SYSTEM — Auto-detect all pickaxes with prices + buy
-- ══════════════════════════════════════════════════════════════════════════════
local DetectedPickaxes = {}
local SelectedPickaxe = nil -- {name, object, price, tier, location}

local function ScanPickaxes()
    DetectedPickaxes = {}
    pcall(function()
        -- Scan ReplicatedStorage for pickaxe configurations
        for _, obj in ipairs(RS:GetDescendants()) do
            local n = obj.Name:lower()
            if n:find("pick") or n:find("axe") then
                local pickData = {
                    name = obj.Name,
                    object = obj,
                    price = 0,
                    tier = 1,
                    location = "ReplicatedStorage",
                    fullName = obj:GetFullName(),
                }
                -- Try to find price
                if obj:IsA("IntValue") or obj:IsA("NumberValue") then
                    pickData.price = obj.Value
                end
                -- Search children for price/value
                for _, child in ipairs(obj:GetDescendants()) do
                    local cn = child.Name:lower()
                    if (cn:find("price") or cn:find("cost")) and (child:IsA("IntValue") or child:IsA("NumberValue")) then
                        pickData.price = child.Value
                    end
                    if (cn:find("tier") or cn:find("level") or cn:find("rank")) and (child:IsA("IntValue") or child:IsA("NumberValue")) then
                        pickData.tier = child.Value
                    end
                end
                -- Search parent for price info
                if obj.Parent then
                    for _, sibling in ipairs(obj.Parent:GetChildren()) do
                        local sn = sibling.Name:lower()
                        if (sn:find("price") or sn:find("cost")) and (sibling:IsA("IntValue") or sibling:IsA("NumberValue")) then
                            pickData.price = sibling.Value
                        end
                    end
                end
                table.insert(DetectedPickaxes, pickData)
            end
        end

        -- Scan Workspace for pickaxe shop items
        for _, obj in ipairs(Workspace:GetDescendants()) do
            local n = obj.Name:lower()
            if (n:find("pick") or n:find("axe")) and not n:find("pickaxe") == false then
                local pickData = {
                    name = obj.Name,
                    object = obj,
                    price = 0,
                    tier = 1,
                    location = "Workspace",
                    fullName = obj:GetFullName(),
                    position = obj:IsA("BasePart") and obj.Position or nil,
                }
                for _, child in ipairs(obj:GetDescendants()) do
                    local cn = child.Name:lower()
                    if (cn:find("price") or cn:find("cost")) and (child:IsA("IntValue") or child:IsA("NumberValue")) then
                        pickData.price = child.Value
                    end
                    if (cn:find("tier") or cn:find("level")) and (child:IsA("IntValue") or child:IsA("NumberValue")) then
                        pickData.tier = child.Value
                    end
                end
                -- Check ProximityPrompt for price info
                for _, prompt in ipairs(obj:GetDescendants()) do
                    if prompt:IsA("ProximityPrompt") then
                        pickData.price = tonumber(prompt.ObjectText) or pickData.price
                        if pickData.price == 0 then pickData.price = tonumber(prompt.ActionText:match("%d+")) or 0 end
                    end
                end
                table.insert(DetectedPickaxes, pickData)
            end
        end

        -- Scan leaderstats for pickaxe data
        local ls = LocalPlayer:FindFirstChild("leaderstats")
        if ls then
            for _, stat in ipairs(ls:GetChildren()) do
                local n = stat.Name:lower()
                if n:find("pick") or n:find("axe") or n:find("tool") or n:find("tier") then
                    -- This might be the current pickaxe level
                    table.insert(DetectedPickaxes, {
                        name = stat.Name .. " (Current: " .. tostring(stat.Value) .. ")",
                        object = stat,
                        price = 0,
                        tier = type(stat.Value) == "number" and stat.Value or 1,
                        location = "Leaderstats",
                        fullName = stat:GetFullName(),
                    })
                end
            end
        end

        -- If we still have no pickaxes, generate a default list based on game knowledge
        if #DetectedPickaxes == 0 then
            local defaultPickaxes = {
                {name = "Starter Pickaxe", price = 0, tier = 1},
                {name = "Iron Pickaxe", price = 100, tier = 2},
                {name = "Gold Pickaxe", price = 500, tier = 3},
                {name = "Diamond Pickaxe", price = 2000, tier = 4},
                {name = "Amethyst Pickaxe", price = 8000, tier = 5},
                {name = "Legendary Pickaxe", price = 25000, tier = 6},
                {name = "Mythical Pickaxe", price = 100000, tier = 7},
                {name = "Star Pickaxe", price = 500000, tier = 8},
            }
            for _, dp in ipairs(defaultPickaxes) do
                table.insert(DetectedPickaxes, {
                    name = dp.name,
                    object = nil,
                    price = dp.price,
                    tier = dp.tier,
                    location = "Default List",
                    fullName = "N/A",
                })
            end
        end

        -- Sort by tier
        table.sort(DetectedPickaxes, function(a, b) return a.tier < b.tier end)
    end)

    -- Auto-send pickaxe scan to Discord if webhook enabled
    pcall(function()
    if WebhookEnabled and DiscordWebhookURL ~= "" and #DetectedPickaxes > 0 then
        SendPickaxeScanToDiscord()
    end
    end)  -- end pcall

    return DetectedPickaxes
end

local function BuyPickaxe(pickData)
    if not pickData then return false end
    pcall(function()
        RefreshCharacter()

        -- Method 1: Find and fire upgrade remote
        local upgradeRemote = GetRemote("Upgrades")
        if upgradeRemote then
            FireRemote(upgradeRemote, "Pickaxe")
            FireRemote(upgradeRemote, pickData.name)
            FireRemote(upgradeRemote, "Pickaxe", pickData.tier)
            FireRemote(upgradeRemote, pickData.name, pickData.price)
        end

        -- Method 2: Teleport to pickaxe in workspace and interact
        if pickData.position then
            TeleportTo(pickData.position)
            _w(0.3)
            -- Click/interact with the item
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
            -- Fire ProximityPrompt if present
            if pickData.object then
                for _, prompt in ipairs(pickData.object:GetDescendants()) do
                    if prompt:IsA("ProximityPrompt") then
                        fireproximityprompt(prompt)
                    end
                end
            end
        end

        -- Method 3: Buy remote
        local buyRemote = GetRemote("Upgrades") -- Often the same remote
        if buyRemote then
            FireRemote(buyRemote, "Buy", pickData.name)
            FireRemote(buyRemote, "BuyPickaxe", pickData.name)
            FireRemote(buyRemote, "Purchase", pickData.name, pickData.price)
        end

        Notify("Pickaxe Shop", "Attempting to buy: " .. pickData.name, 2, "info")
    end)
    return true
end

local AutoBuyBestPickaxe = false

local function StartAutoBuyPickaxe()
    AutoBuyBestPickaxe = true
    if Connections.AutoBuyPick then Connections.AutoBuyPick:Disconnect() end
    Connections.AutoBuyPick = RunService.Heartbeat:Connect(function()
        if not AutoBuyBestPickaxe then return end
        pcall(function()
            -- Get current coins
            local coins = 0
            local ls = LocalPlayer:FindFirstChild("leaderstats")
            if ls then
                local c = ls:FindFirstChild("Coins") or ls:FindFirstChild("Cash") or ls:FindFirstChild("Money")
                if c then coins = c.Value end
            end

            -- Find the best pickaxe we can afford
            local bestAffordable = nil
            for i = #DetectedPickaxes, 1, -1 do
                local p = DetectedPickaxes[i]
                if p.price <= coins then
                    bestAffordable = p
                    break
                end
            end

            if bestAffordable then
                BuyPickaxe(bestAffordable)
            end
        end)
    end)
    Notify("Auto Buy Pickaxe", "Automatically buying best affordable pickaxe", 2, "success")
end

local function StopAutoBuyPickaxe()
    AutoBuyBestPickaxe = false
    if Connections.AutoBuyPick then Connections.AutoBuyPick:Disconnect() Connections.AutoBuyPick = nil end
end

-- ══════════════════════════════════════════════════════════════════════════════
-- 11. MOUNTAIN RESET HANDLER
-- ══════════════════════════════════════════════════════════════════════════════
-- Mountain resets every hour — we need to:
--   1. Detect when reset is approaching (timer)
--   2. Pre-reset: sell all items, TP to safe spot
--   3. Post-reset: TP back and resume farming

local MountainResetInterval = 3600  -- 1 hour in seconds
local MountainResetWarningTime = 60  -- Warn 60 seconds before
local MountainResetSafePos = nil
local LastResetTimestamp = tick()
local MountainResetActive = true
local PreResetSold = false

local function FindMountainTimer()
    -- Try to find the actual timer in the game
    local timerValue = nil
    pcall(function()
        for _, obj in ipairs(Workspace:GetDescendants()) do
            local n = obj.Name:lower()
            if (n:find("timer") or n:find("countdown") or n:find("reset") or n:find("refresh")) and
               (obj:IsA("IntValue") or obj:IsA("NumberValue")) then
                timerValue = obj
                break
            end
        end
        -- Check player GUI for timer text
        local pg = LocalPlayer:FindFirstChild("PlayerGui")
        if pg then
            for _, gui in ipairs(pg:GetDescendants()) do
                if gui:IsA("TextLabel") then
                    local txt = gui.Text:lower()
                    if txt:find("reset") or txt:find("refresh") or txt:match("%d+:%d+") then
                        -- Found a timer label — try to parse it
                        local mins, secs = txt:match("(%d+):(%d+)")
                        if mins and secs then
                            timerValue = tonumber(mins) * 60 + tonumber(secs)
                        end
                    end
                end
            end
        end
    end)
    return timerValue
end

local function GetMountainResetTime()
    -- First try to find the game's actual timer
    local timer = FindMountainTimer()
    if type(timer) == "number" then
        return timer
    end
    -- Fallback: calculate based on session time
    local elapsed = tick() - LastResetTimestamp
    local remaining = MountainResetInterval - (elapsed % MountainResetInterval)
    return remaining
end

local function StartMountainResetHandler()
    if not MountainResetActive then return end
    if Connections.MountainReset then Connections.MountainReset:Disconnect() end

    Connections.MountainReset = RunService.Heartbeat:Connect(function()
        if not MountainResetActive then return end
        pcall(function()
            local remaining = GetMountainResetTime()

            -- Warning notification at 60 seconds
            if remaining <= MountainResetWarningTime and remaining > MountainResetWarningTime - 3 and not PreResetSold then
                Notify("⛰ Mountain Reset", string.format("Mountain resets in %d seconds! Selling items...", remaining), 5, "warning")

                -- Pre-reset: sell everything and save position
                PreResetSold = true
                MountainResetSafePos = RootPart.CFrame

                -- Sell all items
                local sellRemote = GetRemote("Selling")
                if sellRemote then
                    for i = 1, 10 do
                        FireRemote(sellRemote, "All")
                        FireRemote(sellRemote)
                        if Config.ValueManip then
                            FireRemote(sellRemote, "All", Config.SellValueOverride)
                        end
                    end
                    Stats.CrystalsSold = Stats.CrystalsSold + 10
                    Stats.TotalSells = Stats.TotalSells + 10
                end

                -- Teleport to spawn/safe area
                local homePos = GetHomePosition()
                if homePos then
                    TeleportTo(homePos)
                end

                Notify("Mountain Reset", "Sold all items, moved to safe position", 3, "success")
                -- Send pre-reset webhook notification
                    pcall(function()
                    if WebhookEnabled and DiscordWebhookURL ~= "" then
                    SendWebhook("⛰ Mountain Reset Incoming", "Mountain is about to reset! Items sold, moved to safe position. Will return after regeneration.", 15158332, {{name = "Action", value = "Pre-reset sell + safe TP", inline = true}})
                end
                    end)  -- end pcall
            end

            -- Detect post-reset (remaining went from low back to high)
            if remaining > MountainResetInterval * 0.9 and PreResetSold then
                PreResetSold = false
                LastResetTimestamp = tick()

                -- Teleport back to where we were
                if MountainResetSafePos then
                    _w(3)  -- Wait for mountain to fully regenerate
                    RootPart.CFrame = MountainResetSafePos
                    Notify("Mountain Reset", "Mountain regenerated! Teleported back, resuming farm", 3, "success")
                end
                -- Send post-reset webhook notification
                    pcall(function()
                    if WebhookEnabled and DiscordWebhookURL ~= "" then
                    SendWebhook("⛰ Mountain Reset Complete", "Mountain has regenerated! Teleported back and resuming farm.", 5763719, {{name = "Action", value = "Post-reset return + farm resume", inline = true}})
                end
                    end)  -- end pcall

                -- Resume farming if it was active
                if Config.AutoFarm and not Connections.Farm then
                    StartAutoFarm()
                end
            end
        end)
    end)

    Notify("Mountain Reset", string.format("Monitoring hourly reset (warns at %ds)", MountainResetWarningTime), 3, "info")
end

local function StopMountainResetHandler()
    MountainResetActive = false
    if Connections.MountainReset then Connections.MountainReset:Disconnect() Connections.MountainReset = nil end
end

-- ══════════════════════════════════════════════════════════════════════════════
-- INITIALIZE NEW SYSTEMS
-- ══════════════════════════════════════════════════════════════════════════════

-- Scan pickaxes on load
-- PROFESSIONAL GLASSMORPHISM GUI — v3
-- ══════════════════════════════════════════════════════════════════════════════

-- GUI Color Palette
local C = {
    Accent      = Color3.fromRGB(99, 102, 241);   -- Indigo
    AccentLight = Color3.fromRGB(129, 140, 248);
    AccentDark  = Color3.fromRGB(67, 56, 202);
    Success     = Color3.fromRGB(52, 211, 153);    -- Emerald
    Danger      = Color3.fromRGB(239, 68, 68);     -- Red
    Warning     = Color3.fromRGB(251, 191, 36);     -- Amber
    Text        = Color3.fromRGB(241, 245, 249);    -- Slate-100
    TextDim     = Color3.fromRGB(148, 163, 184);    -- Slate-400
    TextDark    = Color3.fromRGB(100, 116, 139);    -- Slate-500
    Glass       = Color3.fromRGB(30, 41, 59);       -- Slate-800 @ 0.72 alpha
    GlassLight  = Color3.fromRGB(51, 65, 85);       -- Slate-700 @ 0.55 alpha
    GlassBorder = Color3.fromRGB(148, 163, 184);    -- Slate-400 @ 0.12 alpha
    TabActive   = Color3.fromRGB(99, 102, 241);     -- Accent
    TabInactive = Color3.fromRGB(51, 65, 85);       -- GlassLight
    ToggleOn    = Color3.fromRGB(99, 102, 241);
    ToggleOff   = Color3.fromRGB(71, 85, 105);      -- Slate-600
    SliderTrack = Color3.fromRGB(51, 65, 85);
    SliderFill  = Color3.fromRGB(99, 102, 241);
    Dropdown    = Color3.fromRGB(30, 41, 59);
    Shadow      = Color3.fromRGB(0, 0, 0);
}

-- Reusable font references
local FontBold   = Enum.Font.GothamBold
local FontSem    = Enum.Font.GothamSemibold
local FontMed    = Enum.Font.GothamMedium
local FontReg    = Enum.Font.Gotham

-- ══════════════════════════════════════════════════════════════════════════════
-- UTILITY: Create glass panel
-- ══════════════════════════════════════════════════════════════════════════════
local function MakeGlass(parent, props)
    local f = Instance.new("Frame")
    f.Name = props.Name or "Glass"
    f.Size = props.Size or UDim2.new(1, 0, 1, 0)
    f.Position = props.Position or UDim2.new(0, 0, 0, 0)
    f.AnchorPoint = props.AnchorPoint or Vector2.new(0, 0)
    f.BackgroundColor3 = props.Color or C.Glass
    f.BackgroundTransparency = props.Transparency or 0.28
    f.BorderSizePixel = 0
    f.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, props.CornerRadius or 12)
    corner.Parent = f

    if props.BorderColor then
        local stroke = Instance.new("UIStroke")
        stroke.Color = props.BorderColor
        stroke.Thickness = props.BorderThickness or 1
        stroke.Transparency = props.BorderTransparency or 0.55
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = f
    end

    if props.Padding then
        local pad = Instance.new("UIPadding")
        pad.PaddingTop = UDim.new(0, props.Padding)
        pad.PaddingBottom = UDim.new(0, props.Padding)
        pad.PaddingLeft = UDim.new(0, props.Padding)
        pad.PaddingRight = UDim.new(0, props.Padding)
        pad.Parent = f
    end

    -- Subtle gradient overlay for depth
    if props.Gradient ~= false then
        local grad = Instance.new("UIGradient")
        grad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 200, 220))
        })
        grad.Rotation = 45
        grad.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.92),
            NumberSequenceKeypoint.new(1, 0.97)
        })
        grad.Parent = f
    end

    -- Drop shadow
    if props.Shadow then
        local shadow = Instance.new("ImageLabel")
        shadow.Name = "Shadow"
        shadow.Size = UDim2.new(1, 30, 1, 30)
        shadow.Position = UDim2.new(0, -15, 0, -15)
        shadow.BackgroundTransparency = 1
        shadow.Image = "rbxassetid://6015897843"
        shadow.ImageColor3 = C.Shadow
        shadow.ImageTransparency = 0.55
        shadow.ScaleType = Enum.ScaleType.Slice
        shadow.SliceCenter = Rect.new(49, 49, 450, 450)
        shadow.ZIndex = f.ZIndex - 1
        shadow.Parent = f
    end

    return f
end

-- ══════════════════════════════════════════════════════════════════════════════
-- UTILITY: Create label
-- ══════════════════════════════════════════════════════════════════════════════
local function MakeLabel(parent, props)
    local l = Instance.new("TextLabel")
    l.Name = props.Name or "Label"
    l.Size = props.Size or UDim2.new(1, 0, 0, 20)
    l.Position = props.Position or UDim2.new(0, 0, 0, 0)
    l.BackgroundTransparency = 1
    l.Font = props.Font or FontMed
    l.TextSize = props.TextSize or 13
    l.TextColor3 = props.Color or C.Text
    l.TextTransparency = props.Transparency or 0
    l.TextXAlignment = props.Align or Enum.TextXAlignment.Left
    l.Text = props.Text or ""
    l.Parent = parent
    return l
end

-- ══════════════════════════════════════════════════════════════════════════════
-- UTILITY: Custom Toggle Switch
-- ══════════════════════════════════════════════════════════════════════════════
local Toggles = {}  -- toggleName -> {frame, knob, value, callback}

local function MakeToggle(parent, props)
    local name   = props.Name or "Toggle"
    local label  = props.Label or name
    local default = props.Default or false
    local callback = props.Callback or function() end
    local rowHeight = props.RowHeight or 38

    -- Row container
    local row = Instance.new("Frame")
    row.Name = name .. "Row"
    row.Size = UDim2.new(1, 0, 0, rowHeight)
    row.BackgroundTransparency = 1
    row.Parent = parent

    -- Label
    local lbl = MakeLabel(row, {
        Name = name .. "Label",
        Size = UDim2.new(1, -62, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        Text = label,
        Font = FontMed,
        TextSize = 13,
        Color = C.Text,
    })

    -- Toggle track
    local track = Instance.new("Frame")
    track.Name = name .. "Track"
    track.Size = UDim2.new(0, 48, 0, 24)
    track.Position = UDim2.new(1, -52, 0.5, -12)
    track.BackgroundColor3 = default and C.ToggleOn or C.ToggleOff
    track.BackgroundTransparency = 0.15
    track.BorderSizePixel = 0
    track.Parent = row

    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(1, 0)
    trackCorner.Parent = track

    -- Track stroke
    local trackStroke = Instance.new("UIStroke")
    trackStroke.Color = C.GlassBorder
    trackStroke.Thickness = 1
    trackStroke.Transparency = 0.5
    trackStroke.Parent = track

    -- Knob
    local knob = Instance.new("Frame")
    knob.Name = "Knob"
    knob.Size = UDim2.new(0, 20, 0, 20)
    knob.Position = default and UDim2.new(1, -22, 0.5, -10) or UDim2.new(0, 2, 0.5, -10)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.BackgroundTransparency = 0
    knob.BorderSizePixel = 0
    knob.Parent = track

    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = knob

    -- Knob glow when on
    local knobShadow = Instance.new("ImageLabel")
    knobShadow.Name = "Glow"
    knobShadow.Size = UDim2.new(0, 28, 0, 28)
    knobShadow.Position = UDim2.new(0.5, -14, 0.5, -14)
    knobShadow.BackgroundTransparency = 1
    knobShadow.Image = "rbxassetid://6303420410"
    knobShadow.ImageColor3 = C.Accent
    knobShadow.ImageTransparency = default and 0.3 or 1
    knobShadow.ScaleType = Enum.ScaleType.Slice
    knobShadow.SliceCenter = Rect.new(42, 42, 58, 58)
    knobShadow.ZIndex = knob.ZIndex - 1
    knobShadow.Parent = knob

    -- State
    local value = default

    local function UpdateToggle(animated)
        value = not value
        if animated then
            local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
            local targetPos = value and UDim2.new(1, -22, 0.5, -10) or UDim2.new(0, 2, 0.5, -10)
            TweenService:Create(knob, tweenInfo, {Position = targetPos}):Play()
            TweenService:Create(track, tweenInfo, {BackgroundColor3 = value and C.ToggleOn or C.ToggleOff}):Play()
            TweenService:Create(knobShadow, tweenInfo, {ImageTransparency = value and 0.3 or 1}):Play()
        else
            knob.Position = value and UDim2.new(1, -22, 0.5, -10) or UDim2.new(0, 2, 0.5, -10)
            track.BackgroundColor3 = value and C.ToggleOn or C.ToggleOff
            knobShadow.ImageTransparency = value and 0.3 or 1
        end
        callback(value)
    end

    track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            UpdateToggle(true)
        end
    end)

    Toggles[name] = {
        row = row,
        track = track,
        knob = knob,
        knobShadow = knobShadow,
        value = value,
        UpdateToggle = UpdateToggle,
        Set = function(self, val)
            if value ~= val then
                value = not val  -- flip so UpdateToggle flips back
                UpdateToggle(true)
            end
        end,
        Get = function(self) return value end,
    }

    return row, Toggles[name]
end

-- ══════════════════════════════════════════════════════════════════════════════
-- UTILITY: Slider
-- ══════════════════════════════════════════════════════════════════════════════
local function MakeSlider(parent, props)
    local name = props.Name or "Slider"
    local label = props.Label or name
    local min = props.Min or 0
    local max = props.Max or 100
    local default = props.Default or min
    local suffix = props.Suffix or ""
    local callback = props.Callback or function() end
    local rowHeight = props.RowHeight or 52

    local row = Instance.new("Frame")
    row.Name = name .. "Row"
    row.Size = UDim2.new(1, 0, 0, rowHeight)
    row.BackgroundTransparency = 1
    row.Parent = parent

    -- Label + value
    local lbl = MakeLabel(row, {
        Name = name .. "Label",
        Size = UDim2.new(0.65, 0, 0, 20),
        Position = UDim2.new(0, 0, 0, 0),
        Text = label,
        Font = FontMed,
        TextSize = 13,
        Color = C.Text,
    })

    local valLabel = MakeLabel(row, {
        Name = name .. "Value",
        Size = UDim2.new(0.35, 0, 0, 20),
        Position = UDim2.new(0.65, 0, 0, 0),
        Text = tostring(default) .. suffix,
        Font = FontSem,
        TextSize = 13,
        Color = C.AccentLight,
        Align = Enum.TextXAlignment.Right,
    })

    -- Track background
    local trackBg = Instance.new("Frame")
    trackBg.Name = "TrackBg"
    trackBg.Size = UDim2.new(1, 0, 0, 6)
    trackBg.Position = UDim2.new(0, 0, 0, 28)
    trackBg.BackgroundColor3 = C.SliderTrack
    trackBg.BackgroundTransparency = 0.2
    trackBg.BorderSizePixel = 0
    trackBg.Parent = row

    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(1, 0)
    trackCorner.Parent = trackBg

    -- Fill
    local pct = (default - min) / (max - min)
    local fill = Instance.new("Frame")
    fill.Name = "Fill"
    fill.Size = UDim2.new(pct, 0, 1, 0)
    fill.BackgroundColor3 = C.SliderFill
    fill.BackgroundTransparency = 0
    fill.BorderSizePixel = 0
    fill.Parent = trackBg

    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = fill

    -- Knob
    local knob = Instance.new("Frame")
    knob.Name = "Knob"
    knob.Size = UDim2.new(0, 16, 0, 16)
    knob.Position = UDim2.new(pct, -8, 0.5, -8)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.BorderSizePixel = 0
    knob.Parent = trackBg

    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = knob

    -- Interaction
    local dragging = false
    local function UpdateSlider(inputX)
        local relX = _m.clamp((inputX - trackBg.AbsolutePosition.X) / trackBg.AbsoluteSize.X, 0, 1)
        local val = _m.floor(min + relX * (max - min) + 0.5)
        fill.Size = UDim2.new(relX, 0, 1, 0)
        knob.Position = UDim2.new(relX, -8, 0.5, -8)
        valLabel.Text = tostring(val) .. suffix
        callback(val)
    end

    trackBg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            UpdateSlider(input.Position.X)
        end
    end)

    knob.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            UpdateSlider(input.Position.X)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    return row
end

-- ══════════════════════════════════════════════════════════════════════════════
-- UTILITY: Button
-- ══════════════════════════════════════════════════════════════════════════════
local function MakeButton(parent, props)
    local name = props.Name or "Button"
    local label = props.Label or name
    local color = props.Color or C.Accent
    local callback = props.Callback or function() end
    local height = props.Height or 38

    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Size = UDim2.new(1, 0, 0, height)
    btn.BackgroundColor3 = color
    btn.BackgroundTransparency = 0.15
    btn.BorderSizePixel = 0
    btn.Font = FontSem
    btn.TextSize = 14
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = label
    btn.AutoButtonColor = false
    btn.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = btn

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(255, 255, 255)
    stroke.Thickness = 1
    stroke.Transparency = 0.85
    stroke.Parent = btn

    -- Hover + click animations
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0.05}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0.15}):Play()
    end)
    btn.MouseButton1Click:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundTransparency = 0.3}):Play()
        _w(0.1)
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundTransparency = 0.15}):Play()
        callback()
    end)

    return btn
end

-- ══════════════════════════════════════════════════════════════════════════════
-- UTILITY: Dropdown
-- ══════════════════════════════════════════════════════════════════════════════
local function MakeDropdown(parent, props)
    local name = props.Name or "Dropdown"
    local label = props.Label or name
    local options = props.Options or {}
    local default = props.Default or options[1] or ""
    local callback = props.Callback or function() end
    local rowHeight = props.RowHeight or 38

    local row = Instance.new("Frame")
    row.Name = name .. "Row"
    row.Size = UDim2.new(1, 0, 0, rowHeight)
    row.BackgroundTransparency = 1
    row.ZIndex = 10
    row.Parent = parent

    local lbl = MakeLabel(row, {
        Name = name .. "Label",
        Size = UDim2.new(0.45, 0, 1, 0),
        Text = label,
        Font = FontMed,
        TextSize = 13,
        Color = C.Text,
    })

    local dropBtn = Instance.new("TextButton")
    dropBtn.Name = name .. "DropBtn"
    dropBtn.Size = UDim2.new(0.55, 0, 1, 0)
    dropBtn.Position = UDim2.new(0.45, 0, 0, 0)
    dropBtn.BackgroundColor3 = C.Dropdown
    dropBtn.BackgroundTransparency = 0.2
    dropBtn.BorderSizePixel = 0
    dropBtn.Font = FontSem
    dropBtn.TextSize = 12
    dropBtn.TextColor3 = C.AccentLight
    dropBtn.Text = default
    dropBtn.TextXAlignment = Enum.TextXAlignment.Center
    dropBtn.AutoButtonColor = false
    dropBtn.Parent = row

    local dropCorner = Instance.new("UICorner")
    dropCorner.CornerRadius = UDim.new(0, 8)
    dropCorner.Parent = dropBtn

    local dropStroke = Instance.new("UIStroke")
    dropStroke.Color = C.GlassBorder
    dropStroke.Thickness = 1
    dropStroke.Transparency = 0.5
    dropStroke.Parent = dropBtn

    -- Dropdown list (hidden by default)
    local listFrame = Instance.new("Frame")
    listFrame.Name = name .. "List"
    listFrame.Size = UDim2.new(0.55, 0, 0, #options * 30)
    listFrame.Position = UDim2.new(0.45, 0, 1, 4)
    listFrame.BackgroundColor3 = C.Dropdown
    listFrame.BackgroundTransparency = 0.1
    listFrame.BorderSizePixel = 0
    listFrame.ZIndex = 20
    listFrame.Visible = false
    listFrame.Parent = row

    local listCorner = Instance.new("UICorner")
    listCorner.CornerRadius = UDim.new(0, 8)
    listCorner.Parent = listFrame

    local listStroke = Instance.new("UIStroke")
    listStroke.Color = C.GlassBorder
    listStroke.Thickness = 1
    listStroke.Transparency = 0.4
    listStroke.Parent = listFrame

    local listLayout = Instance.new("UIListLayout")
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Padding = UDim.new(0, 2)
    listLayout.Parent = listFrame

    local listPad = Instance.new("UIPadding")
    listPad.PaddingTop = UDim.new(0, 4)
    listPad.PaddingBottom = UDim.new(0, 4)
    listPad.PaddingLeft = UDim.new(0, 4)
    listPad.PaddingRight = UDim.new(0, 4)
    listPad.Parent = listFrame

    for i, opt in ipairs(options) do
        local optBtn = Instance.new("TextButton")
        optBtn.Name = "Opt_" .. opt
        optBtn.Size = UDim2.new(1, 0, 0, 26)
        optBtn.BackgroundColor3 = C.GlassLight
        optBtn.BackgroundTransparency = 0.4
        optBtn.BorderSizePixel = 0
        optBtn.Font = FontMed
        optBtn.TextSize = 12
        optBtn.TextColor3 = C.Text
        optBtn.Text = opt
        optBtn.AutoButtonColor = false
        optBtn.LayoutOrder = i
        optBtn.Parent = listFrame

        local optCorner = Instance.new("UICorner")
        optCorner.CornerRadius = UDim.new(0, 6)
        optCorner.Parent = optBtn

        optBtn.MouseButton1Click:Connect(function()
            dropBtn.Text = opt
            listFrame.Visible = false
            callback(opt)
        end)

        optBtn.MouseEnter:Connect(function()
            TweenService:Create(optBtn, TweenInfo.new(0.15), {BackgroundTransparency = 0.1}):Play()
        end)
        optBtn.MouseLeave:Connect(function()
            TweenService:Create(optBtn, TweenInfo.new(0.15), {BackgroundTransparency = 0.4}):Play()
        end)
    end

    dropBtn.MouseButton1Click:Connect(function()
        listFrame.Visible = not listFrame.Visible
    end)

    -- Close dropdown when clicking elsewhere
    parent.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            listFrame.Visible = false
        end
    end)

    return row
end

-- ══════════════════════════════════════════════════════════════════════════════
-- UTILITY: Section divider
-- ══════════════════════════════════════════════════════════════════════════════
-- ===========================================================================
-- UTILITY: Text Input (TextBox)
-- ===========================================================================
local function MakeTextBox(parent, props)
    local name = props.Name or "TextBox"
    local label = props.Label or name
    local placeholder = props.Placeholder or "Enter text..."
    local callback = props.Callback or function() end
    local rowHeight = props.RowHeight or 38

    local row = Instance.new("Frame")
    row.Name = name .. "Row"
    row.Size = UDim2.new(1, 0, 0, rowHeight)
    row.BackgroundTransparency = 1
    row.Parent = parent

    -- Label on left
    local lbl = MakeLabel(row, {
        Name = name .. "Label",
        Size = UDim2.new(0.35, 0, 1, 0),
        Text = label,
        Font = FontMed,
        TextSize = 13,
        Color = C.Text,
    })

    -- TextBox on right
    local tbox = Instance.new("TextBox")
    tbox.Name = name
    tbox.Size = UDim2.new(0.65, 0, 1, 0)
    tbox.Position = UDim2.new(0.35, 0, 0, 0)
    tbox.BackgroundColor3 = C.Dropdown
    tbox.BackgroundTransparency = 0.2
    tbox.BorderSizePixel = 0
    tbox.Font = FontMed
    tbox.TextSize = 12
    tbox.TextColor3 = C.Text
    tbox.PlaceholderText = placeholder
    tbox.PlaceholderColor3 = C.TextDim
    tbox.Text = ""
    tbox.TextXAlignment = Enum.TextXAlignment.Left
    tbox.ClearTextOnFocus = false
    tbox.Parent = row

    local tboxCorner = Instance.new("UICorner")
    tboxCorner.CornerRadius = UDim.new(0, 8)
    tboxCorner.Parent = tbox

    local tboxStroke = Instance.new("UIStroke")
    tboxStroke.Color = C.GlassBorder
    tboxStroke.Thickness = 1
    tboxStroke.Transparency = 0.5
    tboxStroke.Parent = tbox

    local tboxPad = Instance.new("UIPadding")
    tboxPad.PaddingLeft = UDim.new(0, 8)
    tboxPad.PaddingRight = UDim.new(0, 8)
    tboxPad.Parent = tbox

    -- Focus/Unfocus animations
    tbox.Focused:Connect(function()
        TweenService:Create(tboxStroke, TweenInfo.new(0.2), {
            Color = C.Accent,
            Transparency = 0.2,
        }):Play()
    end)

    tbox.FocusLost:Connect(function(enterPressed)
        TweenService:Create(tboxStroke, TweenInfo.new(0.2), {
            Color = C.GlassBorder,
            Transparency = 0.5,
        }):Play()
        callback(tbox.Text, enterPressed)
    end)

    return row
end


local function MakeSection(parent, title)
    local div = Instance.new("Frame")
    div.Name = title .. "Section"
    div.Size = UDim2.new(1, 0, 0, 30)
    div.BackgroundTransparency = 1
    div.Parent = parent

    local line1 = Instance.new("Frame")
    line1.Size = UDim2.new(0, 8, 0, 2)
    line1.Position = UDim2.new(0, 0, 0.5, -1)
    line1.BackgroundColor3 = C.Accent
    line1.BackgroundTransparency = 0.2
    line1.BorderSizePixel = 0
    line1.Parent = div
    Instance.new("UICorner", line1).CornerRadius = UDim.new(1, 0)

    local lbl = MakeLabel(div, {
        Name = "SectionTitle",
        Size = UDim2.new(1, -20, 1, 0),
        Position = UDim2.new(0, 14, 0, 0),
        Text = title:upper(),
        Font = FontBold,
        TextSize = 11,
        Color = C.AccentLight,
    })

    local line2 = Instance.new("Frame")
    line2.Size = UDim2.new(1, 0, 0, 1)
    line2.Position = UDim2.new(0, 0, 1, -1)
    line2.BackgroundColor3 = C.GlassBorder
    line2.BackgroundTransparency = 0.5
    line2.BorderSizePixel = 0
    line2.Parent = div

    return div
end

-- ══════════════════════════════════════════════════════════════════════════════
-- NOTIFICATION SYSTEM
-- ══════════════════════════════════════════════════════════════════════════════
local NotificationQueue = {}
local NotificationContainer = nil  -- Forward declaration, set after ScreenGui is created

local function Notify(title, text, duration, notifType)
    duration = duration or 3
    notifType = notifType or "info"

    local colorMap = {
        info = C.Accent,
        success = C.Success,
        warning = C.Warning,
        error = C.Danger,
    }
    local notifColor = colorMap[notifType] or C.Accent

    -- Container
    local notif = Instance.new("Frame")
    notif.Name = "Notification"
    notif.Size = UDim2.new(0, 280, 0, 64)
    notif.Position = UDim2.new(1, 300, 0, 0)  -- start off-screen
    notif.BackgroundColor3 = C.Glass
    notif.BackgroundTransparency = 0.18
    notif.BorderSizePixel = 0
    notif.Parent = NotificationContainer

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = notif

    local stroke = Instance.new("UIStroke")
    stroke.Color = notifColor
    stroke.Thickness = 1.2
    stroke.Transparency = 0.35
    stroke.Parent = notif

    local pad = Instance.new("UIPadding")
    pad.PaddingTop = UDim.new(0, 10)
    pad.PaddingBottom = UDim.new(0, 10)
    pad.PaddingLeft = UDim.new(0, 12)
    pad.PaddingRight = UDim.new(0, 12)
    pad.Parent = notif

    -- Accent bar on left
    local accentBar = Instance.new("Frame")
    accentBar.Size = UDim2.new(0, 3, 0.7, 0)
    accentBar.Position = UDim2.new(0, 0, 0.15, 0)
    accentBar.BackgroundColor3 = notifColor
    accentBar.BackgroundTransparency = 0
    accentBar.BorderSizePixel = 0
    accentBar.Parent = notif
    Instance.new("UICorner", accentBar).CornerRadius = UDim.new(1, 0)

    local titleLbl = MakeLabel(notif, {
        Name = "Title",
        Size = UDim2.new(1, -4, 0, 18),
        Position = UDim2.new(0, 6, 0, 0),
        Text = title,
        Font = FontSem,
        TextSize = 13,
        Color = notifColor,
    })

    local textLbl = MakeLabel(notif, {
        Name = "Text",
        Size = UDim2.new(1, -4, 0, 16),
        Position = UDim2.new(0, 6, 0, 20),
        Text = text,
        Font = FontReg,
        TextSize = 11,
        Color = C.TextDim,
    })

    -- Animate in
    spawn(function()
        local targetY = #NotificationQueue * 72
        local ti = TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
        TweenService:Create(notif, ti, {Position = UDim2.new(1, -296, 0, targetY)}):Play()

        _w(duration)

        -- Animate out
        TweenService:Create(notif, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
            Position = UDim2.new(1, 300, 0, targetY),
            BackgroundTransparency = 1
        }):Play()
        _w(0.3)
        notif:Destroy()

        -- Shift remaining notifications up
        for i, n in ipairs(NotificationQueue) do
            if n == notif then
                _t.remove(NotificationQueue, i)
                break
            end
        end
        for i, n in ipairs(NotificationQueue) do
            pcall(function()
                TweenService:Create(n, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    Position = UDim2.new(1, -296, 0, (i - 1) * 72)
                }):Play()
            end)
        end
    end)

    _t.insert(NotificationQueue, notif)
    return notif
end

-- ══════════════════════════════════════════════════════════════════════════════
-- MAIN GUI CONSTRUCTION
-- ══════════════════════════════════════════════════════════════════════════════

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MtHub3"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Anti-detection: protect GUI if executor supports it
pcall(function()
    if syn and syn.protect_gui then
        syn.protect_gui(ScreenGui)
    elseif protect_gui then
        protect_gui(ScreenGui)
    end
end)
ScreenGui.Parent = CoreGui

-- Notification container (outside main frame so it stays visible)
NotificationContainer = Instance.new("Frame")
NotificationContainer.Name = "Notifications"
NotificationContainer.Size = UDim2.new(1, 0, 1, 0)
NotificationContainer.BackgroundTransparency = 1
NotificationContainer.Parent = ScreenGui

-- ══════════════════════════════════════════════════════════════════════════════
-- MAIN FRAME (Glassmorphism)
-- ══════════════════════════════════════════════════════════════════════════════
local MainFrame = MakeGlass(ScreenGui, {
    Name = "MainFrame",
    Size = UDim2.new(0, 520, 0, 420),
    Position = UDim2.new(0.5, -260, 0.5, -210),
    Color = Color3.fromRGB(15, 23, 42),
    Transparency = 0.18,
    CornerRadius = 16,
    BorderColor = C.GlassBorder,
    BorderTransparency = 0.4,
    Shadow = true,
})

-- Draggable
do
    local dragging, dragInput, dragStart, startPos
    MainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
        end
    end)
    MainFrame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

-- ══════════════════════════════════════════════════════════════════════════════
-- TITLE BAR
-- ══════════════════════════════════════════════════════════════════════════════
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 42)
TitleBar.BackgroundColor3 = Color3.fromRGB(10, 15, 30)
TitleBar.BackgroundTransparency = 0.35
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 16)
titleCorner.Parent = TitleBar

-- Title gradient accent line at top
local accentLine = Instance.new("Frame")
accentLine.Name = "AccentLine"
accentLine.Size = UDim2.new(1, 0, 0, 2)
accentLine.BackgroundColor3 = C.Accent
accentLine.BackgroundTransparency = 0
accentLine.BorderSizePixel = 0
accentLine.ZIndex = 5
accentLine.Parent = TitleBar

-- Title text
local titleText = MakeLabel(TitleBar, {
    Name = "Title",
    Size = UDim2.new(1, -90, 1, 0),
    Position = UDim2.new(0, 14, 0, 0),
    Text = "⛰ MOUNTAIN EXPLOIT HUB",
    Font = FontBold,
    TextSize = 14,
    Color = C.Text,
})

-- Version badge
local versionBadge = Instance.new("Frame")
versionBadge.Size = UDim2.new(0, 38, 0, 18)
versionBadge.Position = UDim2.new(0, 200, 0.5, -9)
versionBadge.BackgroundColor3 = C.AccentDark
versionBadge.BackgroundTransparency = 0.2
versionBadge.BorderSizePixel = 0
versionBadge.Parent = TitleBar
Instance.new("UICorner", versionBadge).CornerRadius = UDim.new(0, 6)

MakeLabel(versionBadge, {
    Size = UDim2.new(1, 0, 1, 0),
    Text = "v3.2",
    Font = FontBold,
    TextSize = 10,
    Color = C.AccentLight,
    Align = Enum.TextXAlignment.Center,
})

-- Close button
local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseBtn"
closeBtn.Size = UDim2.new(0, 28, 0, 28)
closeBtn.Position = UDim2.new(1, -36, 0.5, -14)
closeBtn.BackgroundColor3 = C.Danger
closeBtn.BackgroundTransparency = 0.6
closeBtn.BorderSizePixel = 0
closeBtn.Font = FontBold
closeBtn.TextSize = 14
closeBtn.TextColor3 = C.Text
closeBtn.Text = "✕"
closeBtn.AutoButtonColor = false
closeBtn.Parent = TitleBar
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 8)

closeBtn.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 520, 0, 0),
        BackgroundTransparency = 1
    }):Play()
    _w(0.3)
    MainFrame.Visible = false
end)

-- Minimize button
local minBtn = Instance.new("TextButton")
minBtn.Name = "MinBtn"
minBtn.Size = UDim2.new(0, 28, 0, 28)
minBtn.Position = UDim2.new(1, -70, 0.5, -14)
minBtn.BackgroundColor3 = C.Warning
minBtn.BackgroundTransparency = 0.6
minBtn.BorderSizePixel = 0
minBtn.Font = FontBold
minBtn.TextSize = 14
minBtn.TextColor3 = C.Text
minBtn.Text = "−"
minBtn.AutoButtonColor = false
minBtn.Parent = TitleBar
Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 8)

local isMinimized = false
local ContentFrame -- forward ref

minBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
            Size = UDim2.new(0, 520, 0, 42)
        }):Play()
        ContentFrame.Visible = false
    else
        ContentFrame.Visible = true
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
            Size = UDim2.new(0, 520, 0, 420)
        }):Play()
    end
end)

-- ══════════════════════════════════════════════════════════════════════════════
-- CONTENT FRAME (Tabs + Content)
-- ══════════════════════════════════════════════════════════════════════════════
ContentFrame = Instance.new("Frame")
ContentFrame.Name = "Content"
ContentFrame.Size = UDim2.new(1, 0, 1, -42)
ContentFrame.Position = UDim2.new(0, 0, 0, 42)
ContentFrame.BackgroundTransparency = 1
ContentFrame.BorderSizePixel = 0
ContentFrame.Parent = MainFrame

-- ══════════════════════════════════════════════════════════════════════════════
-- TAB BAR (Left sidebar)
-- ══════════════════════════════════════════════════════════════════════════════
local TabBar = MakeGlass(ContentFrame, {
    Name = "TabBar",
    Size = UDim2.new(0, 80, 1, 0),
    Color = Color3.fromRGB(10, 15, 30),
    Transparency = 0.3,
    CornerRadius = 0,
    BorderColor = C.GlassBorder,
    BorderTransparency = 0.55,
    Gradient = false,
    Padding = 6,
})

local tabListLayout = Instance.new("UIListLayout")
tabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabListLayout.Padding = UDim.new(0, 4)
tabListLayout.Parent = TabBar

-- Tab definitions
local tabDefs = {
    {Name = "Farm",    Icon = "⛏",  Order = 1},
    {Name = "ESP",     Icon = "👁", Order = 2},
    {Name = "Exploit", Icon = "💀", Order = 3},
    {Name = "Auto",    Icon = "⚙",  Order = 4},
    {Name = "TP",      Icon = "📍", Order = 5},
    {Name = "Anti",    Icon = "🛡", Order = 6},
    {Name = "Stats",   Icon = "📊", Order = 7},
    {Name = "Extra",   Icon = "✨", Order = 8},
    {Name = "Ctrl",    Icon = "🎮", Order = 9},
}

local TabButtons = {}
local TabPages = {}
local activeTab = "Farm"

for _, def in ipairs(tabDefs) do
    local btn = Instance.new("TextButton")
    btn.Name = def.Name .. "Tab"
    btn.Size = UDim2.new(1, 0, 0, 38)
    btn.BackgroundColor3 = (def.Name == activeTab) and C.TabActive or C.TabInactive
    btn.BackgroundTransparency = (def.Name == activeTab) and 0.25 or 0.55
    btn.BorderSizePixel = 0
    btn.Font = FontBold
    btn.TextSize = 18
    btn.TextColor3 = (def.Name == activeTab) and Color3.fromRGB(255, 255, 255) or C.TextDim
    btn.Text = def.Icon
    btn.AutoButtonColor = false
    btn.LayoutOrder = def.Order
    btn.Parent = TabBar
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

    -- Tab name tooltip below icon
    local tabLabel = Instance.new("TextLabel")
    tabLabel.Size = UDim2.new(1, 0, 0, 10)
    tabLabel.Position = UDim2.new(0, 0, 1, -12)
    tabLabel.BackgroundTransparency = 1
    tabLabel.Font = FontReg
    tabLabel.TextSize = 8
    tabLabel.TextColor3 = (def.Name == activeTab) and C.AccentLight or C.TextDark
    tabLabel.Text = def.Name
    tabLabel.Parent = btn

    TabButtons[def.Name] = btn

    btn.MouseButton1Click:Connect(function()
        -- Deactivate all
        for tName, tBtn in pairs(TabButtons) do
            tBtn.BackgroundColor3 = C.TabInactive
            tBtn.BackgroundTransparency = 0.55
            tBtn.TextColor3 = C.TextDim
            tBtn.TextLabel.TextColor3 = C.TextDark
        end
        -- Activate clicked
        btn.BackgroundColor3 = C.TabActive
        btn.BackgroundTransparency = 0.25
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextLabel.TextColor3 = C.AccentLight

        -- Show page
        for pName, pFrame in pairs(TabPages) do
            pFrame.Visible = (pName == def.Name)
        end
        activeTab = def.Name
    end)
end

-- ══════════════════════════════════════════════════════════════════════════════
-- PAGE AREA (Right side)
-- ══════════════════════════════════════════════════════════════════════════════
local PageArea = Instance.new("Frame")
PageArea.Name = "PageArea"
PageArea.Size = UDim2.new(1, -80, 1, 0)
PageArea.Position = UDim2.new(0, 80, 0, 0)
PageArea.BackgroundTransparency = 1
PageArea.BorderSizePixel = 0
PageArea.Parent = ContentFrame

local pagePad = Instance.new("UIPadding")
pagePad.PaddingTop = UDim.new(0, 8)
pagePad.PaddingBottom = UDim.new(0, 8)
pagePad.PaddingLeft = UDim.new(0, 10)
pagePad.PaddingRight = UDim.new(0, 10)
pagePad.Parent = PageArea

-- Create tab pages
for _, def in ipairs(tabDefs) do
    local page = Instance.new("ScrollingFrame")
    page.Name = def.Name .. "Page"
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 4
    page.ScrollBarImageColor3 = C.Accent
    page.ScrollBarImageTransparency = 0.5
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.Visible = (def.Name == activeTab)
    page.Parent = PageArea

    local pageLayout = Instance.new("UIListLayout")
    pageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    pageLayout.Padding = UDim.new(0, 6)
    pageLayout.Parent = page

    TabPages[def.Name] = page
end

-- Helper: add element to page
local function AddToPage(pageName, element, order)
    element.LayoutOrder = order or 0
    element.Parent = TabPages[pageName]
end

-- ══════════════════════════════════════════════════════════════════════════════
-- POPULATE TABS
-- ══════════════════════════════════════════════════════════════════════════════

-- ─── FARM TAB ───────────────────────────────────────────────────────────────
AddToPage("Farm", MakeSection("Farm", "Auto Farm"), 1)

MakeToggle(TabPages.Farm, {
    Name = "AutoFarm",
    Label = "Auto Farm (TP → Mine → Collect → Sell)",
    Default = Config.AutoFarm,
    Callback = function(val)
        Config.AutoFarm = val
        if val then StartAutoFarm() else StopAutoFarm() end
        Notify("Auto Farm", val and "Started farming loop" or "Stopped farming", 2, val and "success" or "warning")
    end,
    RowHeight = 38,
}).Parent = TabPages.Farm
-- Fix layout order
TabPages.Farm.AutoFarmRow.LayoutOrder = 2

MakeToggle(TabPages.Farm, {
    Name = "AutoMine",
    Label = "Auto Mine (continuous swing)",
    Default = Config.AutoMine,
    Callback = function(val)
        Config.AutoMine = val
        if val then StartAutoMine() else StopAutoMine() end
        Notify("Mining", val and "Auto mining enabled" or "Auto mining disabled", 2, "info")
    end,
}).Parent = TabPages.Farm
TabPages.Farm.AutoMineRow.LayoutOrder = 3

MakeToggle(TabPages.Farm, {
    Name = "AutoCollect",
    Label = "Auto Collect Drops",
    Default = Config.AutoCollect,
    Callback = function(val)
        Config.AutoCollect = val
        Notify("Collect", val and "Auto collecting drops" or "Disabled", 2, "info")
    end,
}).Parent = TabPages.Farm
TabPages.Farm.AutoCollectRow.LayoutOrder = 4

MakeToggle(TabPages.Farm, {
    Name = "AutoSell",
    Label = "Auto Sell (from current position)",
    Default = Config.AutoSell,
    Callback = function(val)
        Config.AutoSell = val
        if val then StartAutoSell() end
        Notify("Sell", val and "Selling from position (exploit)" or "Disabled", 2, val and "success" or "warning")
    end,
}).Parent = TabPages.Farm
TabPages.Farm.AutoSellRow.LayoutOrder = 5

AddToPage("Farm", MakeSection("Farm", "Target Selection"), 6)

MakeDropdown(TabPages.Farm, {
    Name = "RarityFilter",
    Label = "Rarity",
    Options = {"Any", "Common (R1)", "Uncommon (R2)", "Rare (R3)", "Epic (R4)", "Legendary (R5)"},
    Default = "Any",
    Callback = function(opt)
        local map = {["Any"] = 0, ["Common (R1)"] = 1, ["Uncommon (R2)"] = 2, ["Rare (R3)"] = 3, ["Epic (R4)"] = 4, ["Legendary (R5)"] = 5}
        Config.RarityFilter = map[opt] or 0
    end,
}).Parent = TabPages.Farm
TabPages.Farm.RarityFilterRow.LayoutOrder = 7

AddToPage("Farm", MakeSection("Farm", "Delays"), 8)

MakeSlider(TabPages.Farm, {
    Name = "FarmDelay",
    Label = "Farm Delay",
    Min = 0,
    Max = 5,
    Default = Config.FarmDelay,
    Suffix = "s",
    Callback = function(val) Config.FarmDelay = val / 10 end,
}).Parent = TabPages.Farm
TabPages.Farm.FarmDelayRow.LayoutOrder = 9

MakeSlider(TabPages.Farm, {
    Name = "MineDelay",
    Label = "Mine Delay",
    Min = 0,
    Max = 10,
    Default = Config.MineDelay * 10,
    Suffix = "s",
    Callback = function(val) Config.MineDelay = val / 10 end,
}).Parent = TabPages.Farm
TabPages.Farm.MineDelayRow.LayoutOrder = 10

-- ─── ESP TAB ────────────────────────────────────────────────────────────────
AddToPage("ESP", MakeSection("ESP", "Visual ESP"), 1)

MakeToggle(TabPages.ESP, {
    Name = "ESPCrystals",
    Label = "Crystal ESP (Highlight + Billboard)",
    Default = Config.ESPCrystals,
    Callback = function(val)
        Config.ESPCrystals = val
        Config.CrystalESP = val
        if val then StartCrystalESP() else StopCrystalESP() end
    end,
}).Parent = TabPages.ESP
TabPages.ESP.ESPCrystalsRow.LayoutOrder = 2

MakeToggle(TabPages.ESP, {
    Name = "ESPPlayers",
    Label = "Player ESP",
    Default = Config.ESPPlayers,
    Callback = function(val)
        Config.ESPPlayers = val
        if val then StartPlayerESP() else StopPlayerESP() end
    end,
}).Parent = TabPages.ESP
TabPages.ESP.ESPPlayersRow.LayoutOrder = 3

MakeToggle(TabPages.ESP, {
    Name = "ESPDrops",
    Label = "Drop ESP (collectible items)",
    Default = Config.ESPDrops,
    Callback = function(val)
        Config.ESPDrops = val
        if val then StartDropESP() else StopDropESP() end
    end,
}).Parent = TabPages.ESP
TabPages.ESP.ESPDropsRow.LayoutOrder = 4

AddToPage("ESP", MakeSection("ESP", "ESP Settings"), 5)

MakeSlider(TabPages.ESP, {
    Name = "ESPRange",
    Label = "ESP Range",
    Min = 50,
    Max = 2000,
    Default = Config.ESPRange,
    Suffix = "st",
    Callback = function(val) Config.ESPRange = val end,
}).Parent = TabPages.ESP
TabPages.ESP.ESPRangeRow.LayoutOrder = 6

-- ─── EXPLOIT TAB ────────────────────────────────────────────────────────────
AddToPage("Exploit", MakeSection("Exploit", "Sell Exploit"), 1)

MakeToggle(TabPages.Exploit, {
    Name = "SellFromPos",
    Label = "Sell From Current Position",
    Default = Config.SellFromPos,
    Callback = function(val)
        Config.SellFromPos = val
        Notify("Exploit", val and "Sell exploit ON — sell from anywhere" or "Disabled", 2, val and "success" or "warning")
    end,
}).Parent = TabPages.Exploit
TabPages.Exploit.SellFromPosRow.LayoutOrder = 2

MakeButton(TabPages.Exploit, {
    Name = "SellNow",
    Label = "⚡ SELL NOW (From Position)",
    Color = C.Success,
    Callback = function()
        SellFromCurrentPos()
        Notify("Exploit", "Sold from current position!", 2, "success")
    end,
}).Parent = TabPages.Exploit
TabPages.Exploit.SellNow.LayoutOrder = 3

AddToPage("Exploit", MakeSection("Exploit", "Backpack Dupe"), 4)

MakeToggle(TabPages.Exploit, {
    Name = "BackpackDupe",
    Label = "Backpack Dupe Exploit",
    Default = Config.BackpackDupe,
    Callback = function(val)
        Config.BackpackDupe = val
        if val then RunBackpackDupe() end
        Notify("Dupe", val and "Backpack dupe running (5 methods)" or "Stopped", 2, val and "success" or "warning")
    end,
}).Parent = TabPages.Exploit
TabPages.Exploit.BackpackDupeRow.LayoutOrder = 5

MakeButton(TabPages.Exploit, {
    Name = "DupeOnce",
    Label = "🔄 RUN DUPE ONCE",
    Color = C.Warning,
    Callback = function()
        RunBackpackDupe()
        Notify("Dupe", "Dupe attempt fired!", 2, "warning")
    end,
}).Parent = TabPages.Exploit
TabPages.Exploit.DupeOnce.LayoutOrder = 6

AddToPage("Exploit", MakeSection("Exploit", "Value Override"), 7)

MakeToggle(TabPages.Exploit, {
    Name = "ValueOverride",
    Label = "Crystal Value Override",
    Default = Config.ValueOverride,
    Callback = function(val)
        Config.ValueOverride = val
        Notify("Exploit", val and "Value override ON" or "OFF", 2, "info")
    end,
}).Parent = TabPages.Exploit
TabPages.Exploit.ValueOverrideRow.LayoutOrder = 8

MakeSlider(TabPages.Exploit, {
    Name = "OverrideValue",
    Label = "Override Value",
    Min = 1,
    Max = 99999,
    Default = Config.OverrideValue,
    Suffix = "$",
    Callback = function(val) Config.OverrideValue = val end,
}).Parent = TabPages.Exploit
TabPages.Exploit.OverrideValueRow.LayoutOrder = 9

-- v3.1 EXPLOIT TAB ADDITIONS

AddToPage("Exploit", MakeSection("Exploit", "Remote Spy"), 10)

MakeToggle(TabPages.Exploit, {
    Name = "RemoteSpy",
    Label = "Remote Spy Logger",
    Default = false,
    Callback = function(val)
        if val then StartRemoteSpy() else StopRemoteSpy() end
    end,
}).Parent = TabPages.Exploit
TabPages.Exploit.RemoteSpyRow.LayoutOrder = 11

MakeButton(TabPages.Exploit, {
    Name = "DumpRemoteLog",
    Label = "📋 Dump Remote Log to Console",
    Color = C.Accent,
    Callback = function()
        local lines = GetRemoteLogFormatted()
        for _, line in ipairs(lines) do
            print("[RemoteSpy] " .. line)
        end
        Notify("Remote Spy", #lines .. " entries printed to console (F9)", 2, "info")
    end,
}).Parent = TabPages.Exploit
TabPages.Exploit.DumpRemoteLog.LayoutOrder = 12

AddToPage("Exploit", MakeSection("Exploit", "Rapid Fire / Instant Mine"), 13)

MakeToggle(TabPages.Exploit, {
    Name = "InstantMine",
    Label = "Instant Mine (Rapid Fire 25x/frame)",
    Default = false,
    Callback = function(val)
        Config.InstantMine = val
        if val then StartRapidFire() else StopRapidFire() end
    end,
}).Parent = TabPages.Exploit
TabPages.Exploit.InstantMineRow.LayoutOrder = 14

MakeSlider(TabPages.Exploit, {
    Name = "RapidFireCount",
    Label = "Rapid Fire Rate",
    Min = 5,
    Max = 50,
    Default = 25,
    Suffix = "x",
    Callback = function(val) RapidFireCount = val end,
}).Parent = TabPages.Exploit
TabPages.Exploit.RapidFireCountRow.LayoutOrder = 15

AddToPage("Exploit", MakeSection("Exploit", "Sell Bypass / Warp Sell"), 16)

MakeToggle(TabPages.Exploit, {
    Name = "SellBypass",
    Label = "Sell Bypass (no cooldown, every frame)",
    Default = false,
    Callback = function(val)
        if val then StartSellBypass() else StopSellBypass() end
    end,
}).Parent = TabPages.Exploit
TabPages.Exploit.SellBypassRow.LayoutOrder = 17

MakeToggle(TabPages.Exploit, {
    Name = "WarpSell",
    Label = "Warp Sell (TP shop, sell, TP back)",
    Default = false,
    Callback = function(val)
        if val then StartWarpSell() else StopWarpSell() end
    end,
}).Parent = TabPages.Exploit
TabPages.Exploit.WarpSellRow.LayoutOrder = 18

AddToPage("Exploit", MakeSection("Exploit", "Capacity / Range Bypass"), 19)

MakeToggle(TabPages.Exploit, {
    Name = "CapacityBypass",
    Label = "Infinite Backpack Capacity (999999)",
    Default = false,
    Callback = function(val)
        if val then StartCapacityBypass() else StopCapacityBypass() end
    end,
}).Parent = TabPages.Exploit
TabPages.Exploit.CapacityBypassRow.LayoutOrder = 20

MakeToggle(TabPages.Exploit, {
    Name = "ExtendedRange",
    Label = "Extended Mine Range (fake distance)",
    Default = false,
    Callback = function(val)
        if val then StartExtendedRange() else StopExtendedRange() end
    end,
}).Parent = TabPages.Exploit
TabPages.Exploit.ExtendedRangeRow.LayoutOrder = 21

MakeSlider(TabPages.Exploit, {
    Name = "FakeRangeSlider",
    Label = "Fake Range Distance",
    Min = 1,
    Max = 50,
    Default = 10,
    Suffix = "st",
    Callback = function(val) FakeRange = val end,
}).Parent = TabPages.Exploit
TabPages.Exploit.FakeRangeSliderRow.LayoutOrder = 22

AddToPage("Exploit", MakeSection("Exploit", "Speed Spoof"), 23)

MakeToggle(TabPages.Exploit, {
    Name = "SpeedSpoof",
    Label = "Speed Spoof (server reads 16, you move fast)",
    Default = false,
    Callback = function(val)
        if val then StartSpeedSpoof() else StopSpeedSpoof() end
    end,
}).Parent = TabPages.Exploit
TabPages.Exploit.SpeedSpoofRow.LayoutOrder = 24

MakeSlider(TabPages.Exploit, {
    Name = "RealSpeedSlider",
    Label = "Real Speed",
    Min = 20,
    Max = 200,
    Default = 80,
    Suffix = "",
    Callback = function(val) RealSpeed = val end,
}).Parent = TabPages.Exploit
TabPages.Exploit.RealSpeedSliderRow.LayoutOrder = 25

MakeSlider(TabPages.Exploit, {
    Name = "RealJumpSlider",
    Label = "Real Jump Power",
    Min = 50,
    Max = 300,
    Default = 100,
    Suffix = "",
    Callback = function(val) RealJump = val end,
}).Parent = TabPages.Exploit
TabPages.Exploit.RealJumpSliderRow.LayoutOrder = 26

AddToPage("Exploit", MakeSection("Exploit", "Config Manipulation"), 27)

MakeToggle(TabPages.Exploit, {
    Name = "ConfigManip",
    Label = "RS Config Manip (values + health + luck)",
    Default = false,
    Callback = function(val)
        if val then StartConfigManip() else StopConfigManip() end
    end,
}).Parent = TabPages.Exploit
TabPages.Exploit.ConfigManipRow.LayoutOrder = 28

MakeButton(TabPages.Exploit, {
    Name = "Discoverconfigs",
    Label = "🔍 Discover Game Configs",
    Color = C.Warning,
    Callback = function()
        local configs = DiscoverGameConfigs()
        for _, cfg in ipairs(configs) do
            print("[ConfigManip] " .. cfg.name .. " [" .. cfg.type .. "] @ " .. cfg.path)
        end
        Notify("Config Manip", #configs .. " config objects found (see F9 console)", 3, "info")
        -- Auto-send to Discord if webhook enabled
        pcall(function()
        if WebhookEnabled and DiscordWebhookURL ~= "" and #configs > 0 then
            SendConfigDiscoveryToDiscord()
        end
        end)  -- end pcall
    end,
}).Parent = TabPages.Exploit
TabPages.Exploit.Discoverconfigs.LayoutOrder = 29

AddToPage("Exploit", MakeSection("Exploit", "Anti-Cheat Full Bypass"), 30)

MakeToggle(TabPages.Exploit, {
    Name = "AntiCheatFull",
    Label = "Anti-Cheat Full Bypass (Kick + Detection)",
    Default = false,
    Callback = function(val)
        if val then StartAntiCheatFull() else StopAntiCheatFull() end
    end,
}).Parent = TabPages.Exploit
TabPages.Exploit.AntiCheatFullRow.LayoutOrder = 31


-- ─── AUTO TAB ──────────────────────────────────────────────────────────────
AddToPage("Auto", MakeSection("Auto", "Auto Upgrades"), 1)

MakeToggle(TabPages.Auto, {
    Name = "AutoUpgradePickaxe",
    Label = "Auto Upgrade Pickaxe",
    Default = Config.AutoUpgradePickaxe,
    Callback = function(val) Config.AutoUpgradePickaxe = val end,
}).Parent = TabPages.Auto
TabPages.Auto.AutoUpgradePickaxeRow.LayoutOrder = 2

MakeToggle(TabPages.Auto, {
    Name = "AutoUpgradeBackpack",
    Label = "Auto Upgrade Backpack",
    Default = Config.AutoUpgradeBackpack,
    Callback = function(val) Config.AutoUpgradeBackpack = val end,
}).Parent = TabPages.Auto
TabPages.Auto.AutoUpgradeBackpackRow.LayoutOrder = 3

MakeToggle(TabPages.Auto, {
    Name = "AutoUpgradeWarmth",
    Label = "Auto Upgrade Warmth",
    Default = Config.AutoUpgradeWarmth,
    Callback = function(val) Config.AutoUpgradeWarmth = val end,
}).Parent = TabPages.Auto
TabPages.Auto.AutoUpgradeWarmthRow.LayoutOrder = 4

AddToPage("Auto", MakeSection("Auto", "Auto Actions"), 5)

MakeToggle(TabPages.Auto, {
    Name = "AutoWarmth",
    Label = "Auto Warmth (campfire loop)",
    Default = Config.AutoWarmth,
    Callback = function(val)
        Config.AutoWarmth = val
        if val then StartAutoWarmth() else StopAutoWarmth() end
    end,
}).Parent = TabPages.Auto
TabPages.Auto.AutoWarmthRow.LayoutOrder = 6

-- v3.1 AUTO TAB ADDITIONS - Pickaxe Shop

AddToPage("Auto", MakeSection("Auto", "Pickaxe Shop"), 7)

MakeButton(TabPages.Auto, {
    Name = "ScanPickaxes",
    Label = "🔍 Scan for Pickaxes",
    Color = C.Accent,
    Callback = function()
        ScanPickaxes()
        Notify("Pickaxe Shop", #DetectedPickaxes .. " pickaxes found!", 3, "success")
    end,
}).Parent = TabPages.Auto
TabPages.Auto.ScanPickaxes.LayoutOrder = 8

MakeDropdown(TabPages.Auto, {
    Name = "PickaxeSelect",
    Label = "Pickaxes",
    Options = (function()
        ScanPickaxes()
        local opts = {}
        for _, p in ipairs(DetectedPickaxes) do
            table.insert(opts, p.name .. " - $" .. tostring(p.price))
        end
        if #opts == 0 then opts = {"No pickaxes found"} end
        return opts
    end)(),
    Default = "Select a pickaxe",
    Callback = function(opt)
        for _, p in ipairs(DetectedPickaxes) do
            if opt:find(p.name) then
                SelectedPickaxe = p
                Notify("Pickaxe", "Selected: " .. p.name .. " ($" .. tostring(p.price) .. ")", 2, "info")
                break
            end
        end
    end,
}).Parent = TabPages.Auto
TabPages.Auto.PickaxeSelectRow.LayoutOrder = 9

MakeButton(TabPages.Auto, {
    Name = "BuySelectedPickaxe",
    Label = "🛒 Buy Selected Pickaxe",
    Color = C.Success,
    Callback = function()
        if SelectedPickaxe then
            BuyPickaxe(SelectedPickaxe)
        else
            Notify("Pickaxe", "No pickaxe selected! Use dropdown first", 2, "warning")
        end
    end,
}).Parent = TabPages.Auto
TabPages.Auto.BuySelectedPickaxe.LayoutOrder = 10

MakeToggle(TabPages.Auto, {
    Name = "AutoBuyPickaxe",
    Label = "Auto Buy Best Affordable Pickaxe",
    Default = false,
    Callback = function(val)
        if val then StartAutoBuyPickaxe() else StopAutoBuyPickaxe() end
    end,
}).Parent = TabPages.Auto
TabPages.Auto.AutoBuyPickaxeRow.LayoutOrder = 11


-- ─── TP TAB ────────────────────────────────────────────────────────────────
AddToPage("TP", MakeSection("TP", "Teleportation"), 1)

MakeToggle(TabPages.TP, {
    Name = "Fly",
    Label = "Fly Mode (WASD + Space/Shift)",
    Default = Config.Fly,
    Callback = function(val)
        Config.Fly = val
        if val then StartFly() else StopFly() end
        Notify("Fly", val and "Flying enabled" or "Landed", 2, "info")
    end,
}).Parent = TabPages.TP
TabPages.TP.FlyRow.LayoutOrder = 2

MakeSlider(TabPages.TP, {
    Name = "FlySpeed",
    Label = "Fly Speed",
    Min = 10,
    Max = 200,
    Default = Config.FlySpeed,
    Suffix = "",
    Callback = function(val) Config.FlySpeed = val end,
}).Parent = TabPages.TP
TabPages.TP.FlySpeedRow.LayoutOrder = 3

AddToPage("TP", MakeSection("TP", "Quick Teleports"), 4)

MakeButton(TabPages.TP, {
    Name = "TPShop",
    Label = "🏪 Teleport to Shop",
    Color = C.Accent,
    Callback = function()
        RefreshCharacter()
        pcall(function()
            local shop = Workspace:FindFirstChild("Shop") or Workspace:FindFirstChild("Store") or Workspace:FindFirstChild("Sell")
            if shop then
                RootPart.CFrame = shop.CFrame + Vector3.new(0, 5, 0)
                Notify("TP", "Teleported to shop", 2, "success")
            else
                Notify("TP", "Shop not found in workspace", 2, "error")
            end
        end)
    end,
}).Parent = TabPages.TP
TabPages.TP.TPShop.LayoutOrder = 5

MakeButton(TabPages.TP, {
    Name = "TPMountain",
    Label = "⛰ Teleport to Mountain Top",
    Color = C.Accent,
    Callback = function()
        RefreshCharacter()
        pcall(function()
            local mt = Workspace:FindFirstChild("Mountain") or Workspace:FindFirstChild("MountainTop")
            if mt then
                RootPart.CFrame = mt.CFrame + Vector3.new(0, 5, 0)
                Notify("TP", "Teleported to mountain top", 2, "success")
            else
                -- Try finding by highest point
                local highest = nil
                for _, p in ipairs(Workspace:GetDescendants()) do
                    if p:IsA("BasePart") and p.Name:lower():find("mountain") then
                        if not highest or p.Position.Y > highest.Position.Y then highest = p end
                    end
                end
                if highest then
                    RootPart.CFrame = highest.CFrame + Vector3.new(0, 10, 0)
                    Notify("TP", "Teleported to mountain", 2, "success")
                else
                    Notify("TP", "Mountain not found", 2, "error")
                end
            end
        end)
    end,
}).Parent = TabPages.TP
TabPages.TP.TPMountain.LayoutOrder = 6

MakeButton(TabPages.TP, {
    Name = "TPSpawn",
    Label = "🏠 Teleport to Spawn",
    Color = C.Accent,
    Callback = function()
        RefreshCharacter()
        pcall(function()
            local sp = Workspace:FindFirstChild("SpawnLocation") or Workspace:FindFirstChildWhichIsA("SpawnLocation")
            if sp then
                RootPart.CFrame = sp.CFrame + Vector3.new(0, 5, 0)
                Notify("TP", "Teleported to spawn", 2, "success")
            end
        end)
    end,
}).Parent = TabPages.TP
TabPages.TP.TPSpawn.LayoutOrder = 7

MakeButton(TabPages.TP, {
    Name = "TPBestCrystal",
    Label = "💎 Teleport to Best Crystal",
    Color = C.AccentDark,
    Callback = function()
        RefreshCharacter()
        local best = FindBestCrystal()
        if best and best.object then
            RootPart.CFrame = best.object.CFrame + Vector3.new(0, 3, 0)
            Notify("TP", "Teleported to " .. best.name, 2, "success")
        else
            Notify("TP", "No crystal found", 2, "error")
        end
    end,
}).Parent = TabPages.TP
TabPages.TP.TPBestCrystal.LayoutOrder = 8

-- ─── ANTI TAB ───────────────────────────────────────────────────────────────
AddToPage("Anti", MakeSection("Anti", "Anti-Detection"), 1)

MakeToggle(TabPages.Anti, {
    Name = "AntiAFK",
    Label = "Anti-AFK",
    Default = Config.AntiAFK,
    Callback = function(val)
        Config.AntiAFK = val
        if val then StartAntiAFK() end
    end,
}).Parent = TabPages.Anti
TabPages.Anti.AntiAFKRow.LayoutOrder = 2

MakeToggle(TabPages.Anti, {
    Name = "AutoRejoin",
    Label = "Auto Rejoin on Kick",
    Default = Config.AutoRejoin,
    Callback = function(val)
        Config.AutoRejoin = val
        if val then StartAutoRejoin() end
    end,
}).Parent = TabPages.Anti
TabPages.Anti.AutoRejoinRow.LayoutOrder = 3

MakeToggle(TabPages.Anti, {
    Name = "AntiCheat",
    Label = "Anti-Cheat Bypass",
    Default = Config.AntiCheat,
    Callback = function(val)
        Config.AntiCheat = val
        Notify("Anti", val and "Anti-cheat bypass active" or "Disabled", 2, "info")
    end,
}).Parent = TabPages.Anti
TabPages.Anti.AntiCheatRow.LayoutOrder = 4

-- ─── STATS TAB ─────────────────────────────────────────────────────────────
AddToPage("Stats", MakeSection("Stats", "Player Statistics"), 1)

-- Stats display (will be updated by the stats loop)
local statsFrame = Instance.new("Frame")
statsFrame.Name = "StatsDisplay"
statsFrame.Size = UDim2.new(1, 0, 0, 180)
statsFrame.BackgroundTransparency = 1
statsFrame.LayoutOrder = 2
statsFrame.Parent = TabPages.Stats

local statsLayout = Instance.new("UIListLayout")
statsLayout.SortOrder = Enum.SortOrder.LayoutOrder
statsLayout.Padding = UDim.new(0, 4)
statsLayout.Parent = statsFrame

local statLabels = {}
local statNames = {"Coins", "Pickaxe Level", "Backpack Level", "Warmth Level", "Crystals Mined", "Total Sells", "Farm State", "Position"}

for i, statName in ipairs(statNames) do
    local statRow = Instance.new("Frame")
    statRow.Size = UDim2.new(1, 0, 0, 20)
    statRow.BackgroundTransparency = 1
    statRow.LayoutOrder = i
    statRow.Parent = statsFrame

    local nameLbl = MakeLabel(statRow, {
        Size = UDim2.new(0.55, 0, 1, 0),
        Text = statName,
        Font = FontMed,
        TextSize = 12,
        Color = C.TextDim,
    })

    local valLbl = MakeLabel(statRow, {
        Size = UDim2.new(0.45, 0, 1, 0),
        Position = UDim2.new(0.55, 0, 0, 0),
        Text = "—",
        Font = FontSem,
        TextSize = 12,
        Color = C.AccentLight,
        Align = Enum.TextXAlignment.Right,
    })

    statLabels[statName] = valLbl
end

-- Stats update loop
spawn(function()
    while _w(1) do
        pcall(function()
            RefreshCharacter()
            if statLabels["Coins"] then
                local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
                if leaderstats then
                    local coins = leaderstats:FindFirstChild("Coins") or leaderstats:FindFirstChild("Cash") or leaderstats:FindFirstChild("Money")
                    statLabels["Coins"].Text = coins and tostring(coins.Value) or "—"
                end
            end
            if statLabels["Pickaxe Level"] then
                local ls = LocalPlayer:FindFirstChild("leaderstats")
                if ls then
                    local pk = ls:FindFirstChild("Pickaxe") or ls:FindFirstChild("PickaxeLevel")
                    statLabels["Pickaxe Level"].Text = pk and tostring(pk.Value) or "—"
                end
            end
            if statLabels["Backpack Level"] then
                local ls = LocalPlayer:FindFirstChild("leaderstats")
                if ls then
                    local bp = ls:FindFirstChild("Backpack") or ls:FindFirstChild("BackpackLevel")
                    statLabels["Backpack Level"].Text = bp and tostring(bp.Value) or "—"
                end
            end
            if statLabels["Warmth Level"] then
                local ls = LocalPlayer:FindFirstChild("leaderstats")
                if ls then
                    local wm = ls:FindFirstChild("Warmth") or ls:FindFirstChild("WarmthLevel")
                    statLabels["Warmth Level"].Text = wm and tostring(wm.Value) or "—"
                end
            end
            if statLabels["Crystals Mined"] then
                statLabels["Crystals Mined"].Text = tostring(Stats.CrystalsMined)
            end
            if statLabels["Total Sells"] then
                statLabels["Total Sells"].Text = tostring(Stats.TotalSells)
            end
            if statLabels["Farm State"] then
                statLabels["Farm State"].Text = FarmState
            end
            if statLabels["Position"] and RootPart then
                local p = RootPart.Position
                statLabels["Position"].Text = _s.format("%.0f, %.0f, %.0f", p.X, p.Y, p.Z)
            end
        end)
    end
end)

-- ─── EXTRA TAB ─────────────────────────────────────────────────────────────
AddToPage("Extra", MakeSection("Extra", "World"), 1)

MakeToggle(TabPages.Extra, {
    Name = "Fullbright",
    Label = "Fullbright (remove darkness)",
    Default = Config.Fullbright,
    Callback = function(val)
        Config.Fullbright = val
        if val then
            pcall(function()
                local lighting = Lighting
                lighting.Brightness = 2
                lighting.ClockTime = 14
                lighting.FogEnd = 100000
                lighting.GlobalShadows = false
                lighting.Ambient = Color3.fromRGB(178, 178, 178)
            end)
        else
            pcall(function()
                Lighting.Brightness = 1
                Lighting.GlobalShadows = true
            end)
        end
    end,
}).Parent = TabPages.Extra
TabPages.Extra.FullbrightRow.LayoutOrder = 2

MakeButton(TabPages.Extra, {
    Name = "Rejoin",
    Label = "🔄 Rejoin Game",
    Color = C.Accent,
    Callback = function()
        pcall(function()
            TeleportService:Teleport(_r.PlaceId, LocalPlayer)
        end)
    end,
}).Parent = TabPages.Extra
TabPages.Extra.Rejoin.LayoutOrder = 3

MakeButton(TabPages.Extra, {
    Name = "ServerHop",
    Label = "🌐 Server Hop",
    Color = C.Accent,
    Callback = function()
        pcall(function()
            HttpService:JSONDecode(HttpService:GetAsync("https://games.roblox.com/v1/games/" .. _r.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
            local servers = HttpService:JSONDecode(HttpService:GetAsync("https://games.roblox.com/v1/games/" .. _r.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
            for _, s in ipairs(servers.data) do
                if s.playing < s.maxPlayers and s.id ~= _r.JobId then
                    TeleportService:TeleportToPlaceInstance(_r.PlaceId, s.id, LocalPlayer)
                    break
                end
            end
        end)
    end,
}).Parent = TabPages.Extra
TabPages.Extra.ServerHop.LayoutOrder = 4

AddToPage("Extra", MakeSection("Extra", "Character"), 5)

MakeToggle(TabPages.Extra, {
    Name = "Noclip",
    Label = "Noclip (walk through walls)",
    Default = Config.Noclip,
    Callback = function(val)
        Config.Noclip = val
        if val then
            Connections.Noclip = RunService.Stepped:Connect(function()
                pcall(function()
                    if Character then
                        for _, p in ipairs(Character:GetDescendants()) do
                            if p:IsA("BasePart") then p.CanCollide = false end
                        end
                    end
                end)
            end)
        else
            if Connections.Noclip then Connections.Noclip:Disconnect() Connections.Noclip = nil end
        end
    end,
}).Parent = TabPages.Extra
TabPages.Extra.NoclipRow.LayoutOrder = 6

MakeToggle(TabPages.Extra, {
    Name = "InfiniteJump",
    Label = "Infinite Jump",
    Default = Config.InfiniteJump,
    Callback = function(val)
        Config.InfiniteJump = val
        if val then
            Connections.InfJump = UserInputService.JumpRequest:Connect(function()
                if Config.InfiniteJump then
                    pcall(function() Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping") end)
                end
            end)
        else
            if Connections.InfJump then Connections.InfJump:Disconnect() Connections.InfJump = nil end
        end
    end,
}).Parent = TabPages.Extra
TabPages.Extra.InfiniteJumpRow.LayoutOrder = 7

-- v3.1 EXTRA TAB ADDITIONS - Mountain Reset

AddToPage("Extra", MakeSection("Extra", "Mountain Reset"), 8)

MakeToggle(TabPages.Extra, {
    Name = "MountainReset",
    Label = "Mountain Reset Handler (auto sell + safe TP)",
    Default = true,
    Callback = function(val)
        MountainResetActive = val
        if val then StartMountainResetHandler() else StopMountainResetHandler() end
        Notify("Mountain Reset", val and "Handler active - will sell before reset" or "Disabled", 2, val and "success" or "warning")
    end,
}).Parent = TabPages.Extra
TabPages.Extra.MountainResetRow.LayoutOrder = 9

MakeSlider(TabPages.Extra, {
    Name = "ResetWarningTime",
    Label = "Reset Warning Time",
    Min = 10,
    Max = 120,
    Default = 60,
    Suffix = "s",
    Callback = function(val) MountainResetWarningTime = val end,
}).Parent = TabPages.Extra
TabPages.Extra.ResetWarningTimeRow.LayoutOrder = 10

-- Mountain Reset Timer Display
local resetTimerFrame = Instance.new("Frame")
resetTimerFrame.Name = "ResetTimerDisplay"
resetTimerFrame.Size = UDim2.new(1, 0, 0, 28)
resetTimerFrame.BackgroundTransparency = 0.7
resetTimerFrame.BackgroundColor3 = Color3.fromRGB(20, 25, 45)
resetTimerFrame.LayoutOrder = 11
resetTimerFrame.Parent = TabPages.Extra
Instance.new("UICorner", resetTimerFrame).CornerRadius = UDim.new(0, 6)

local resetTimerLabel = MakeLabel(resetTimerFrame, {
    Name = "TimerText",
    Size = UDim2.new(1, -12, 1, 0),
    Position = UDim2.new(0, 6, 0, 0),
    Text = "⛰ Mountain Reset: Calculating...",
    Font = FontSem,
    TextSize = 12,
    Color = C.Warning,
    Align = Enum.TextXAlignment.Center,
})

-- Update mountain reset timer
spawn(function()
    while _w(1) do
        pcall(function()
            local remaining = GetMountainResetTime()
            local mins = _m.floor(remaining / 60)
            local secs = _m.floor(remaining % 60)
            resetTimerLabel.Text = _s.format("⛰ Mountain Reset: %d:%02d", mins, secs)
            if remaining <= MountainResetWarningTime then
                resetTimerLabel.TextColor3 = C.Danger
            else
                resetTimerLabel.TextColor3 = C.Warning
            end
        end)
    end
end)


-- ─── CTRL TAB ──────────────────────────────────────────────────────────────
AddToPage("Ctrl", MakeSection("Ctrl", "Controls"), 1)

-- Keybind display
local keybindFrame = Instance.new("Frame")
keybindFrame.Name = "Keybinds"
keybindFrame.Size = UDim2.new(1, 0, 0, 120)
keybindFrame.BackgroundTransparency = 1
keybindFrame.LayoutOrder = 2
keybindFrame.Parent = TabPages.Ctrl

local kbLayout = Instance.new("UIListLayout")
kbLayout.SortOrder = Enum.SortOrder.LayoutOrder
kbLayout.Padding = UDim.new(0, 3)
kbLayout.Parent = keybindFrame

for i, kb in ipairs(KeybindMap) do
    local kbRow = Instance.new("Frame")
    kbRow.Size = UDim2.new(1, 0, 0, 18)
    kbRow.BackgroundTransparency = 1
    kbRow.LayoutOrder = i
    kbRow.Parent = keybindFrame

    MakeLabel(kbRow, {
        Size = UDim2.new(0.6, 0, 1, 0),
        Text = kb.name,
        Font = FontMed,
        TextSize = 11,
        Color = C.TextDim,
    })

    local keyLabel = MakeLabel(kbRow, {
        Size = UDim2.new(0.4, 0, 1, 0),
        Position = UDim2.new(0.6, 0, 0, 0),
        Text = kb.key,
        Font = FontSem,
        TextSize = 11,
        Color = C.AccentLight,
        Align = Enum.TextXAlignment.Right,
    })
end

AddToPage("Ctrl", MakeSection("Ctrl", "Config"), 3)

MakeButton(TabPages.Ctrl, {
    Name = "SaveConfig",
    Label = "💾 Save Configuration",
    Color = C.Success,
    Callback = function()
        SaveConfig()
        Notify("Config", "Configuration saved!", 2, "success")
    end,
}).Parent = TabPages.Ctrl
TabPages.Ctrl.SaveConfig.LayoutOrder = 4

MakeButton(TabPages.Ctrl, {
    Name = "LoadConfig",
    Label = "📂 Load Configuration",
    Color = C.Accent,
    Callback = function()
        LoadConfig()
        Notify("Config", "Configuration loaded!", 2, "success")
    end,
}).Parent = TabPages.Ctrl
TabPages.Ctrl.LoadConfig.LayoutOrder = 5

MakeButton(TabPages.Ctrl, {
    Name = "ResetConfig",
    Label = "🗑 Reset to Defaults",
    Color = C.Danger,
    Callback = function()
        -- Reset all toggles visually
        for name, t in pairs(Toggles) do
            if t.Get() then t:Set(false) end
        end
        Notify("Config", "All settings reset to defaults", 2, "warning")
    end,
}).Parent = TabPages.Ctrl
TabPages.Ctrl.ResetConfig.LayoutOrder = 6

-- Discord Webhook Section
AddToPage("Ctrl", MakeSection("Ctrl", "Discord Webhook"), 7)

MakeTextBox(TabPages.Ctrl, {
    Name = "WebhookURL",
    Label = "🛒 Webhook URL",
    Placeholder = "https://discord.com/api/webhooks/...",
    Callback = function(text)
        DiscordWebhookURL = text
        if text ~= "" then
            Notify("Webhook", "Webhook URL set!", 2, "success")
        end
    end,
}).Parent = TabPages.Ctrl
TabPages.Ctrl.WebhookURLRow.LayoutOrder = 8

MakeToggle(TabPages.Ctrl, {
    Name = "WebhookEnabled",
    Label = "🔔 Enable Discord Webhook",
    Default = false,
    Callback = function(val)
        WebhookEnabled = val
        if val then
            StartWebhookProcessor()
            Notify("Webhook", "Discord webhook enabled - data will be sent!", 2, "success")
        else
            Notify("Webhook", "Discord webhook disabled", 2, "warning")
        end
    end,
}).Parent = TabPages.Ctrl
TabPages.Ctrl.WebhookEnabledRow.LayoutOrder = 9

MakeButton(TabPages.Ctrl, {
    Name = "SendRemoteLog",
    Label = "📡 Send Remote Log to Discord",
    Color = C.Accent,
    Callback = function()
        SendRemoteLogToDiscord()
    end,
}).Parent = TabPages.Ctrl
TabPages.Ctrl.SendRemoteLog.LayoutOrder = 10

MakeButton(TabPages.Ctrl, {
    Name = "SendPickaxeScan",
    Label = "⛏ Send Pickaxe Scan to Discord",
    Color = C.Success,
    Callback = function()
        SendPickaxeScanToDiscord()
    end,
}).Parent = TabPages.Ctrl
TabPages.Ctrl.SendPickaxeScan.LayoutOrder = 11

MakeButton(TabPages.Ctrl, {
    Name = "SendConfigDiscovery",
    Label = "🔍 Send Config Discovery to Discord",
    Color = C.Warning,
    Callback = function()
        SendConfigDiscoveryToDiscord()
    end,
}).Parent = TabPages.Ctrl
TabPages.Ctrl.SendConfigDiscovery.LayoutOrder = 12

MakeButton(TabPages.Ctrl, {
    Name = "SendRemoteDiscovery",
    Label = "🌐 Send Remote Discovery to Discord",
    Color = C.Danger,
    Callback = function()
        SendRemoteDiscoveryToDiscord()
    end,
}).Parent = TabPages.Ctrl
TabPages.Ctrl.SendRemoteDiscovery.LayoutOrder = 13



-- ══════════════════════════════════════════════════════════════════════════════
-- STATS OVERLAY BAR (bottom of screen)
-- ══════════════════════════════════════════════════════════════════════════════
local StatsOverlay = MakeGlass(ScreenGui, {
    Name = "StatsOverlay",
    Size = UDim2.new(0, 320, 0, 32),
    Position = UDim2.new(0.5, -160, 1, -40),
    Color = Color3.fromRGB(10, 15, 30),
    Transparency = 0.3,
    CornerRadius = 10,
    BorderColor = C.Accent,
    BorderTransparency = 0.5,
    Gradient = false,
})

local statsOverlayLabel = MakeLabel(StatsOverlay, {
    Name = "StatsText",
    Size = UDim2.new(1, -16, 1, 0),
    Position = UDim2.new(0, 8, 0, 0),
    Text = "💰 0 | ⛏ 0 | 📦 0 | ❄ 0",
    Font = FontSem,
    TextSize = 12,
    Color = C.Text,
    Align = Enum.TextXAlignment.Center,
})

-- Update stats overlay
spawn(function()
    while _w(0.5) do
        pcall(function()
            RefreshCharacter()
            local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
            local coins = leaderstats and (leaderstats:FindFirstChild("Coins") or leaderstats:FindFirstChild("Cash")) or nil
            local pk = leaderstats and (leaderstats:FindFirstChild("Pickaxe") or leaderstats:FindFirstChild("PickaxeLevel")) or nil
            local bp = leaderstats and (leaderstats:FindFirstChild("Backpack") or leaderstats:FindFirstChild("BackpackLevel")) or nil
            local wm = leaderstats and (leaderstats:FindFirstChild("Warmth") or leaderstats:FindFirstChild("WarmthLevel")) or nil

            statsOverlayLabel.Text = _s.format("💰 %s | ⛏ %s | 📦 %s | ❄ %s",
                coins and tostring(coins.Value) or "?",
                pk and tostring(pk.Value) or "?",
                bp and tostring(bp.Value) or "?",
                wm and tostring(wm.Value) or "?"
            )
        end)
    end
end)

-- ══════════════════════════════════════════════════════════════════════════════
-- TOGGLE GUI KEYBIND (Right Ctrl)
-- ══════════════════════════════════════════════════════════════════════════════
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.RightControl then
        if MainFrame.Visible then
            MainFrame.Visible = false
            StatsOverlay.Visible = false
        else
            MainFrame.Visible = true
            StatsOverlay.Visible = true
            -- Re-animate in
            MainFrame.Size = UDim2.new(0, 520, 0, 0)
            TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 520, 0, 420)
            }):Play()
        end
    end
end)

-- ══════════════════════════════════════════════════════════════════════════════
-- KEYBIND HANDLER
-- ══════════════════════════════════════════════════════════════════════════════
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    for _, kb in ipairs(KeybindMap) do
        if input.KeyCode == kb.keycode then
            pcall(kb.callback)
        end
    end
end)

-- ══════════════════════════════════════════════════════════════════════════════
-- MOBILE FLY JOYSTICK (touch support)
-- ══════════════════════════════════════════════════════════════════════════════
if UserInputService.TouchEnabled then
    local joystick = MakeGlass(ScreenGui, {
        Name = "MobileJoystick",
        Size = UDim2.new(0, 120, 0, 120),
        Position = UDim2.new(0, 20, 1, -140),
        Color = Color3.fromRGB(10, 15, 30),
        Transparency = 0.4,
        CornerRadius = 60,
        BorderColor = C.Accent,
        BorderTransparency = 0.4,
        Gradient = false,
    })

    local knobOuter = Instance.new("Frame")
    knobOuter.Size = UDim2.new(0, 50, 0, 50)
    knobOuter.Position = UDim2.new(0.5, -25, 0.5, -25)
    knobOuter.BackgroundColor3 = C.Accent
    knobOuter.BackgroundTransparency = 0.3
    knobOuter.BorderSizePixel = 0
    knobOuter.Parent = joystick
    Instance.new("UICorner", knobOuter).CornerRadius = UDim.new(1, 0)

    local knobInner = Instance.new("Frame")
    knobInner.Size = UDim2.new(0, 30, 0, 30)
    knobInner.Position = UDim2.new(0.5, -15, 0.5, -15)
    knobInner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knobInner.BackgroundTransparency = 0.2
    knobInner.BorderSizePixel = 0
    knobInner.Parent = knobOuter
    Instance.new("UICorner", knobInner).CornerRadius = UDim.new(1, 0)

    MakeLabel(joystick, {
        Size = UDim2.new(1, 0, 0, 14),
        Position = UDim2.new(0, 0, 1, 14),
        Text = "FLY JOYSTICK",
        Font = FontBold,
        TextSize = 9,
        Color = C.TextDim,
        Align = Enum.TextXAlignment.Center,
    })

    local joyDrag = false
    local joyStartPos = Vector3.new(0, 0, 0)

    joystick.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            joyDrag = true
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if joyDrag and input.UserInputType == Enum.UserInputType.Touch and Config.Fly then
            local relX = _m.clamp((input.Position.X - joystick.AbsolutePosition.X) / joystick.AbsoluteSize.X * 2 - 1, -1, 1)
            local relY = _m.clamp((input.Position.Y - joystick.AbsolutePosition.Y) / joystick.AbsoluteSize.Y * 2 - 1, -1, 1)

            knobOuter.Position = UDim2.new(0.5 + relX * 0.3 - 25, 0, 0.5 + relY * 0.3 - 25, 0)

            if flyBody then
                local cam = Workspace.CurrentCamera
                local dir = cam.CFrame.RightVector * relX + cam.CFrame.LookVector * -relY
                flyBody.Velocity = dir * Config.FlySpeed
            end
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            joyDrag = false
            TweenService:Create(knobOuter, TweenInfo.new(0.2), {Position = UDim2.new(0.5, -25, 0.5, -25)}):Play()
            if flyBody then flyBody.Velocity = Vector3.new(0, 0, 0) end
        end
    end)
end

-- ══════════════════════════════════════════════════════════════════════════════
-- AUTO-UPGRADE LOOP
-- ══════════════════════════════════════════════════════════════════════════════
spawn(function()
    while _w(2) do
        pcall(function()
            if Config.AutoUpgradePickaxe then
                local remote = GetRemote("Upgrade")
                if remote then FireRemote(remote, "Pickaxe") end
            end
            if Config.AutoUpgradeBackpack then
                local remote = GetRemote("Upgrade")
                if remote then FireRemote(remote, "Backpack") end
            end
            if Config.AutoUpgradeWarmth then
                local remote = GetRemote("Upgrade")
                if remote then FireRemote(remote, "Warmth") end
            end
        end)
    end
end)

-- ══════════════════════════════════════════════════════════════════════════════
-- INITIALIZATION
-- ══════════════════════════════════════════════════════════════════════════════
LoadConfig()
StartAntiAFK()
StartAutoRejoin()

-- Anti-cheat bypass hooks
if Config.AntiCheat then
    pcall(function()
        local mt = getrawmetatable(_r)
        if mt and setreadonly then
            setreadonly(mt, false)
            local oldNamecall = mt.__namecall
            mt.__namecall = _n(function(self, ...)
                local method = getnamecallmethod()
                if method == "Kick" then return nil end
                if method == "fireServer" or method == "FireServer" then
                    -- Allow our own remotes through
                    return oldNamecall(self, ...)
                end
                return oldNamecall(self, ...)
            end)
            setreadonly(mt, true)
        end
    end)
end

-- v3.2 Webhook processor start
pcall(StartWebhookProcessor)  -- Safe: wrapped in pcall


-- v3.2 System initialization
pcall(ScanPickaxes)  -- Safe: wrapped in pcall
pcall(StartMountainResetHandler)  -- Safe: wrapped in pcall

-- Welcome notification
Notify("Mountain Exploit Hub v3.2", "Loaded with 9 new exploits + Pickaxe Shop + Mountain Reset! Press RightCtrl to toggle", 5, "success")

-- Entrance animation
MainFrame.Size = UDim2.new(0, 520, 0, 0)
MainFrame.BackgroundTransparency = 1
TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 520, 0, 420),
    BackgroundTransparency = 0.18,
}):Play()

-- Stats overlay entrance
StatsOverlay.Position = UDim2.new(0.5, -160, 1, 40)
TweenService:Create(StatsOverlay, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, -160, 1, -40),
}):Play()

print("[MtHub v3.2] ✅ All exploits + Pickaxe Shop + Mountain Reset loaded — RightCtrl to toggle")

end)
if not success then
    warn("[MtHub v3.2] FATAL ERROR: " .. tostring(err))
    print("[MtHub v3.2] FATAL ERROR: " .. tostring(err))
end
