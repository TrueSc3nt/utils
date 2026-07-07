--[[
    ██╗███╗   ██╗██╗████████╗ █████╗ ██╗     ██╗███████╗██████╗ 
    ██║████╗  ██║██║╚══██╔══╝██╔══██╗██║     ██║██╔════╝██╔══██╗
    ██║██╔██╗ ██║██║   ██║   ███████║██║     ██║█████╗  ██║  ██║
    ██║██║╚██╗██║██║   ██║   ██╔══██║██║     ██║██╔══╝  ██║  ██║
    ██║██║ ╚████║██║   ██║   ██║  ██║███████╗██║███████╗██████╔╝
    ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝╚══════╝╚═════╝ 
    
    Mine a Mountain ULTIMATE v7
    Features: Smart Loop, Ore Filter, Remote Spy, ESP+, Waypoints,
              Auto Farm/Sell/Upgrade, Exploits, Config Save, Keybinds
    
    Compatible: Delta, Synapse X/Z, KRNL, Fluxus, Wave, Codex, Solara, Hydrogen
    Universal executor compatibility layer — auto-detects APIs per executor
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
local TeleportService = game:GetService("TeleportService")
local CollectionService = game:GetService("CollectionService")

-- ========== PLAYER ==========
local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then
    LocalPlayer = Players.PlayerAdded:Wait()
end
-- Don't block GUI load waiting for character (fixes "nothing happens" on slow spawns)
local Character = LocalPlayer.Character
local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
local Humanoid = Character and Character:FindFirstChild("Humanoid")
if not Character then
    task.spawn(function()
        local char = LocalPlayer.CharacterAdded:Wait()
        Character = char
        HumanoidRootPart = char:WaitForChild("HumanoidRootPart")
        Humanoid = char:WaitForChild("Humanoid")
    end)
end

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
    -- Smart automation
    SmartLoop = false,
    OreFilterEnabled = false,
    OreFilter = "diamond,ruby,gold,emerald,sapphire,starsapphire,platinum",
    OreBlacklist = "coal,stone,rock",
    RapidMine = false,
    RapidMineCount = 3,
    AutoEquipPickaxe = false,
    AutoCollectDrops = false,
    BypassPromptHold = true,
    TweenTeleport = false,
    TweenTeleportSpeed = 80,
    -- Sell / progression
    SellWhenFull = true,
    SellMinCash = 0,
    AutoBuyPickaxe = false,
    AutoBuyBackpack = false,
    AutoBuyLuck = false,
    AutoBuyWarmth = false,
    AutoRebirth = false,
    RebirthCashThreshold = 50000,
    AutoClaimDaily = false,
    PromoCode = "",
    -- Movement / QoL
    InfiniteJump = false,
    ClickTeleport = false,
    AntiAFK = false,
    AutoRespawn = false,
    WarmthKeeper = false,
    StaminaKeeper = false,
    -- Visual
    Tracers = false,
    PlayerESP = false,
    Fullbright = false,
    ChestESP = false,
    HideOtherPlayers = false,
    FPSBooster = false,
    -- Remote tools
    RemoteSpy = false,
    CustomRemoteName = "",
    CustomRemoteArgs = "",
    -- Settings
    ServerHopInterval = 0,
    PanicEnabled = true,
}

-- GUI theme (main chunk — shared by AddLog + GUI builders)
local Theme = {
    Bg = Color3.fromRGB(15, 15, 17),
    Panel = Color3.fromRGB(22, 22, 26),
    Sidebar = Color3.fromRGB(12, 12, 14),
    Input = Color3.fromRGB(30, 30, 34),
    Accent = Color3.fromRGB(0, 235, 120),
    AccentDark = Color3.fromRGB(0, 170, 88),
    Text = Color3.fromRGB(248, 248, 250),
    SubText = Color3.fromRGB(125, 125, 132),
    Muted = Color3.fromRGB(75, 75, 82),
}

-- ========== GUI REFERENCES (forward-declared) ==========
local LogList, ShopList, RockList, RemoteSpyList, CashLabel, StatsLabel

-- ========== STATE ==========
local State = {
    FarmConnection = nil,
    SellConnection = nil,
    ESPConnections = {},
    ESPRefreshThread = nil,
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
    SmartLoopConn = nil,
    InfiniteJumpConn = nil,
    ClickTPConn = nil,
    AntiAFKConn = nil,
    WarmthKeeperConn = nil,
    TracerObjects = {},
    PlayerESPObjects = {},
    ChestESPObjects = {},
    RemoteSpyLogs = {},
    Waypoints = {},
    SavedLighting = {},
    LastRemoteFire = nil,
    GUIHidden = false,
    ServerHopConn = nil,
    DropCollectConn = nil,
    FullbrightApplied = false,
}

-- ========== EXECUTOR COMPATIBILITY LAYER ==========
-- Works on: Delta, Synapse X/Z, KRNL, Fluxus, Wave, Codex, Solara, Hydrogen, etc.
local Exec = {}

do
    local genv = getgenv and getgenv() or _G
    local function first(...)
        for i = 1, select("#", ...) do
            local v = select(i, ...)
            if v ~= nil then return v end
        end
    end

    Exec.Unpack = table.unpack or unpack
    Exec.Name = "Unknown"
    pcall(function()
        if identifyexecutor then
            Exec.Name = identifyexecutor()
        elseif EXECUTOR_NAME then
            Exec.Name = EXECUTOR_NAME
        elseif syn then
            Exec.Name = "Synapse"
        elseif KRNL_LOADED then
            Exec.Name = "KRNL"
        elseif Fluxus then
            Exec.Name = "Fluxus"
        elseif delta then
            Exec.Name = "Delta"
        end
    end)

    Exec.SafeCClosure = newcclosure or newlclosure or function(f) return f end
    Exec.GetNamecallMethod = getnamecallmethod or getcallmethod or function() return "" end
    Exec.HasHookMeta = hookmetamethod ~= nil
    Exec.HasNewCClosure = newcclosure ~= nil
    Exec.HasFireClick = fireclickdetector ~= nil
    Exec.HasFireProximity = fireproximityprompt ~= nil
    Exec.HasFireTouch = firetouchinterest ~= nil
    Exec.HasSetSimRadius = setsimulationradius ~= nil
    Exec.HasCheckCaller = checkcaller ~= nil
    Exec.HasWriteFile = writefile ~= nil
    Exec.HasReadFile = readfile ~= nil
    Exec.HasIsFile = isfile ~= nil
    Exec.HasClipboard = setclipboard ~= nil
    Exec.HasLoadCharacter = loadcharacter ~= nil

    Exec.Request = first(
        syn and syn.request,
        http and http.request,
        request,
        fluxus and fluxus.request,
        genv.request,
        genv.http_request
    )

    Exec.ProtectGui = function(gui)
        pcall(function()
            if syn and syn.protect_gui then syn.protect_gui(gui)
            elseif protectgui then protectgui(gui)
            elseif genv.protectgui then genv.protectgui(gui) end
        end)
    end

    Exec.GetGuiParent = function()
        local parent
        pcall(function()
            if gethui then parent = gethui() end
        end)
        if parent then return parent end
        pcall(function()
            if get_hidden_gui then parent = get_hidden_gui() end
        end)
        if parent then return parent end
        pcall(function()
            local cg = game:GetService("CoreGui")
            if cloneref then cg = cloneref(cg) end
            parent = cg
        end)
        if parent then return parent end
        return LocalPlayer:WaitForChild("PlayerGui")
    end

    Exec.HttpGet = function(url)
        local ok, result = pcall(function() return game:HttpGet(url) end)
        if ok and result then return result end
        if Exec.Request then
            local res = Exec.Request({Url = url, Method = "GET"})
            if type(res) == "table" then
                return res.Body or res.body or res.BodyText
            end
        end
        return HttpService:GetAsync(url)
    end

    Exec.Post = function(url, body, contentType)
        contentType = contentType or "application/json"
        if Exec.Request then
            return Exec.Request({
                Url = url,
                Method = "POST",
                Headers = {["Content-Type"] = contentType},
                Body = body,
            })
        end
        return HttpService:PostAsync(url, body, Enum.HttpContentType.ApplicationJson)
    end

    Exec.FireClick = function(detector)
        if not detector then return end
        pcall(function()
            if fireclickdetector then fireclickdetector(detector)
            elseif clickdetector then clickdetector(detector) end
        end)
    end

    Exec.FireProximity = function(prompt, amount)
        if not prompt then return end
        pcall(function()
            if fireproximityprompt then
                fireproximityprompt(prompt, amount or 1)
            elseif proximityprompt then
                proximityprompt(prompt)
            end
        end)
    end

    Exec.FireTouch = function(part0, part1, toggle)
        if not part0 or not part1 then return end
        pcall(function()
            if firetouchinterest then firetouchinterest(part0, part1, toggle or 0) end
        end)
    end

    Exec.WriteFile = function(path, data)
        if writefile then pcall(writefile, path, data) return true end
        if writefileasync then pcall(writefileasync, path, data) return true end
        return false
    end

    Exec.ReadFile = function(path)
        if readfile and isfile and isfile(path) then
            local ok, data = pcall(readfile, path)
            if ok then return data end
        end
        return nil
    end

    Exec.SetClipboard = function(text)
        pcall(function()
            if setclipboard then setclipboard(text)
            elseif toclipboard then toclipboard(text) end
        end)
    end

    Exec.LoadCharacter = function()
        pcall(function()
            if loadcharacter then loadcharacter()
            elseif LocalPlayer.LoadCharacter then LocalPlayer:LoadCharacter() end
        end)
    end

    Exec.SetSimRadius = function()
        pcall(function()
            if setsimulationradius then setsimulationradius(1e9, 1e9) end
        end)
        pcall(function()
            if sethiddenproperty then
                sethiddenproperty(LocalPlayer, "SimulationRadius", 1e9)
                sethiddenproperty(LocalPlayer, "MaxSimulationRadius", 1e9)
            end
        end)
    end

    -- Single __namecall chain (anti-detection + remote spy) — avoids double-hook crashes
    local NamecallHooks = {}
    local OldNamecall = nil
    local NamecallInstalled = false

    function Exec.OnNamecall(fn)
        table.insert(NamecallHooks, fn)
        if not NamecallInstalled and Exec.HasHookMeta then
            pcall(function()
                OldNamecall = hookmetamethod(game, "__namecall", Exec.SafeCClosure(function(self, ...)
                    local method = Exec.GetNamecallMethod()
                    local args = {...}
                    for _, hook in ipairs(NamecallHooks) do
                        local block, ret = hook(self, method, args)
                        if block then return ret end
                    end
                    return OldNamecall(self, ...)
                end))
                NamecallInstalled = true
            end)
        end
    end

    Exec.NamecallHooks = NamecallHooks

    -- Legacy flags used throughout script
    HasHookMeta = Exec.HasHookMeta
    HasNewCClosure = Exec.HasNewCClosure
    HasFireClick = Exec.HasFireClick
    HasFireProximity = Exec.HasFireProximity
    HasFireTouch = Exec.HasFireTouch
    HasSetSimRadius = Exec.HasSetSimRadius
    HasCheckCaller = Exec.HasCheckCaller
    HasProtectGui = true
    IsExecutor = getgenv ~= nil
end

-- ========== ANTI-DETECTION + REMOTE SPY (unified hook) ==========
local RemoteSpyActive = false

-- WalkSpeed / JumpPower hooks (separate — optional, wrapped in pcall)
do
    if Exec.HasHookMeta and Exec.HasNewCClosure then
        pcall(function()
            local OldIndex = hookmetamethod(game, "__index", Exec.SafeCClosure(function(self, key)
                if Humanoid and self == Humanoid then
                    if key == "WalkSpeed" and Config.SpeedBoost then return 16 end
                    if key == "JumpPower" and Config.JumpPower > 50 then return 50 end
                end
                return OldIndex(self, key)
            end))
        end)
        pcall(function()
            local OldNewIndex = hookmetamethod(game, "__newindex", Exec.SafeCClosure(function(self, key, value)
                if Humanoid and self == Humanoid then
                    if key == "WalkSpeed" and Config.SpeedBoost then
                        return OldNewIndex(self, key, Config.WalkSpeed)
                    end
                    if key == "JumpPower" and Config.JumpPower > 50 then
                        return OldNewIndex(self, key, Config.JumpPower)
                    end
                end
                return OldNewIndex(self, key, value)
            end))
        end)
    end
end

-- ========== UTILITY FUNCTIONS (scope A — keeps main chunk under Luau 200-local limit) ==========
do
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
    local targetCF = CFrame.new(position + Vector3.new(0, 3, 0))
    if Config.TweenTeleport then
        local dist = (HumanoidRootPart.Position - position).Magnitude
        local dur = math.clamp(dist / Config.TweenTeleportSpeed, 0.08, 2.5)
        TweenService:Create(HumanoidRootPart, TweenInfo.new(dur, Enum.EasingStyle.Linear), {CFrame = targetCF}):Play()
        task.wait(dur)
    else
        HumanoidRootPart.CFrame = targetCF
        task.wait(Config.TeleportDelay)
    end
    return true
end

local function ParseCSVList(str)
    local list = {}
    for token in string.gmatch(string.lower(str or ""), "[^,%s]+") do
        table.insert(list, token)
    end
    return list
end

local function MatchesOreFilter(nameLower)
    if not Config.OreFilterEnabled then return true end
    local blacklist = ParseCSVList(Config.OreBlacklist)
    for _, word in ipairs(blacklist) do
        if string.find(nameLower, word, 1, true) then return false end
    end
    local whitelist = ParseCSVList(Config.OreFilter)
    if #whitelist == 0 then return true end
    for _, word in ipairs(whitelist) do
        if string.find(nameLower, word, 1, true) then return true end
    end
    return false
end

local function GetLeaderstatValue(patterns)
    local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
    if not leaderstats then return 0 end
    for _, stat in ipairs(leaderstats:GetChildren()) do
        local n = string.lower(stat.Name)
        for _, p in ipairs(patterns) do
            if string.find(n, p) and stat:IsA("ValueBase") then
                return stat.Value
            end
        end
    end
    return 0
end

local function GetPlayerCash()
    return GetLeaderstatValue({"cash", "money", "coin", "gold", "balance", "bucks"})
end

local function GetBackpackWeight()
    return GetLeaderstatValue({"weight", "carry", "kg", "load", "backpack"})
end

local function GetBackpackCapacity()
    local cap = GetLeaderstatValue({"capacity", "maxcarry", "max", "limit", "backpack"})
    if cap > 0 then return cap end
    local obj = LocalPlayer:FindFirstChild("BackpackCapacity") or LocalPlayer:FindFirstChild("MaxCarry")
    if obj and obj:IsA("ValueBase") then return obj.Value end
    return 100
end

local function IsBackpackFull()
    if Config.UnlimitedBackpack then return false end
    local weight = GetBackpackWeight()
    local cap = GetBackpackCapacity()
    if cap > 0 and weight > 0 then return weight >= cap * 0.92 end
    return false
end

local function BypassPromptsIn(root)
    if not Config.BypassPromptHold or not root then return end
    pcall(function()
        for _, d in ipairs(root:GetDescendants()) do
            if d:IsA("ProximityPrompt") then
                d.HoldDuration = 0
                d.MaxActivationDistance = math.max(d.MaxActivationDistance, 20)
            end
        end
    end)
end

local function EquipBestPickaxe()
    if not Config.AutoEquipPickaxe then return end
    pcall(function()
        local bestTool, bestScore = nil, -1
        local function scoreTool(tool)
            if not tool:IsA("Tool") then return -1 end
            local n = string.lower(tool.Name)
            if not (string.find(n, "pick") or string.find(n, "axe") or string.find(n, "drill") or string.find(n, "tool") or string.find(n, "hammer")) then
                return 0
            end
            local s = 0
            if string.find(n, "diamond") then s = s + 100
            elseif string.find(n, "gold") then s = s + 80
            elseif string.find(n, "iron") then s = s + 50
            elseif string.find(n, "stone") then s = s + 20 end
            for _, d in ipairs(tool:GetDescendants()) do
                if d:IsA("ValueBase") and (string.find(string.lower(d.Name), "level") or string.find(string.lower(d.Name), "tier")) then
                    s = s + d.Value * 10
                end
            end
            return s
        end
        local function scan(container)
            if not container then return end
            for _, t in ipairs(container:GetChildren()) do
                local sc = scoreTool(t)
                if sc > bestScore then bestScore, bestTool = sc, t end
            end
        end
        scan(LocalPlayer.Backpack)
        scan(Character)
        if bestTool and Character and not Character:FindFirstChild(bestTool.Name) then
            Humanoid:EquipTool(bestTool)
        end
    end)
end

local function GetDropItems()
    local drops = {}
    local patterns = {"drop", "loot", "item", "pickup", "collect", "ore", "gem", "crystal"}
    local function scan(parent)
        for _, child in ipairs(parent:GetChildren()) do
            local nl = string.lower(child.Name)
            if child:IsA("BasePart") or child:IsA("Model") then
                for _, p in ipairs(patterns) do
                    if string.find(nl, p) then
                        local part = child:IsA("BasePart") and child or child:FindFirstChildWhichIsA("BasePart")
                        if part then
                            local dist = GetDistance(part)
                            if dist <= Config.FarmRadius then
                                table.insert(drops, {Instance = child, Part = part, Distance = dist, Name = child.Name})
                            end
                        end
                        break
                    end
                end
            end
            if #child:GetChildren() > 0 then scan(child) end
        end
    end
    scan(Workspace)
    table.sort(drops, function(a, b) return a.Distance < b.Distance end)
    return drops
end

local function CollectNearbyDrops()
    if not Config.AutoCollectDrops then return end
    local drops = GetDropItems()
    for i = 1, math.min(3, #drops) do
        local drop = drops[i]
        TeleportTo(drop.Part.Position)
        if HasFireTouch then
            Exec.FireTouch(HumanoidRootPart, drop.Part, 0)
            task.wait(0.01)
            Exec.FireTouch(HumanoidRootPart, drop.Part, 1)
        end
        FireRemote("pickup")
        FireRemote("collect")
        FireRemote("loot")
    end
end

local function FireUpgradePurchases()
    if Config.AutoBuyPickaxe then
        FireRemote("pickaxe"); FireRemote("buy_pickaxe"); FireRemote("upgrade_pickaxe")
    end
    if Config.AutoBuyBackpack then
        FireRemote("backpack"); FireRemote("capacity"); FireRemote("upgrade_backpack")
    end
    if Config.AutoBuyLuck then
        FireRemote("luck"); FireRemote("dig_luck"); FireRemote("lucky")
    end
    if Config.AutoBuyWarmth then
        FireRemote("warmth"); FireRemote("heat"); FireRemote("campfire")
    end
    if Config.AutoUpgrade then
        FireRemote("upgrade"); FireRemote("buy"); FireRemote("purchase")
    end
end

local function TryAutoRebirth()
    if not Config.AutoRebirth then return end
    if GetPlayerCash() >= Config.RebirthCashThreshold then
        FireRemote("rebirth"); FireRemote("prestige"); FireRemote("reset"); FireRemote("ascend")
        AddLog("Auto rebirth attempted at " .. GetPlayerCash() .. " cash")
    end
end

local function TryAutoClaimDaily()
    if not Config.AutoClaimDaily then return end
    FireRemote("daily"); FireRemote("reward"); FireRemote("claim"); FireRemote("login")
    FireRemote("code"); FireRemote("redeem")
    if Config.PromoCode ~= "" then
        FireRemote("code", Config.PromoCode)
        FireRemote("redeem", Config.PromoCode)
    end
end

local function ShouldSellNow()
    if IsBackpackFull() and Config.SellWhenFull then return true end
    if Config.SellMinCash > 0 and GetPlayerCash() >= Config.SellMinCash then return true end
    return false
end

local function DupeViaDrop()
    AddLog("Drop dupe: pickup spam...")
    pcall(function()
        local tool = Character and Character:FindFirstChildOfClass("Tool")
        if tool then
            tool.Parent = LocalPlayer.Backpack
            task.wait(0.1)
            Humanoid:EquipTool(tool)
        end
        for i = 1, Config.DupeAmount do
            FireRemote("drop"); FireRemote("pickup"); FireRemote("collect")
            task.wait(0.05)
        end
    end)
end

local function TeleportToCFrame(cframe)
    if not GetCharacter() then return false end
    HumanoidRootPart.CFrame = cframe + Vector3.new(0, 3, 0)
    task.wait(Config.TeleportDelay)
    return true
end

local function ClearScrollList(scrollingFrame)
    for _, child in ipairs(scrollingFrame:GetChildren()) do
        if not child:IsA("UIListLayout") and not child:IsA("UIPadding") then
            child:Destroy()
        end
    end
end

local function AddLog(message)
    local timestamp = os.date("%H:%M:%S")
    table.insert(State.Logs, 1, "[" .. timestamp .. "] " .. message)
    if #State.Logs > 50 then
        table.remove(State.Logs)
    end
    if LogList then
        pcall(function()
            ClearScrollList(LogList)
            for i, log in ipairs(State.Logs) do
                if i > 15 then break end
                local label = Instance.new("TextLabel")
                label.Size = UDim2.new(1, 0, 0, 18)
                label.BackgroundTransparency = 1
                label.Text = log
                label.TextColor3 = Theme.SubText
                label.TextXAlignment = Enum.TextXAlignment.Left
                label.Font = Enum.Font.Gotham
                label.TextSize = 11
                label.LayoutOrder = i
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
                    remote.Instance:FireServer(Exec.Unpack(args))
                elseif remote.Type == "RemoteFunction" then
                    remote.Instance:InvokeServer(Exec.Unpack(args))
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
                    remote.Instance:FireServer(Exec.Unpack(args))
                elseif remote.Type == "RemoteFunction" then
                    remote.Instance:InvokeServer(Exec.Unpack(args))
                end
            end)
            return true
        end
    end
    return false
end

-- ========== DISCORD WEBHOOK ==========
local WebhookQueue = {}
local WebhookProcessing = false

local function SendWebhook(data)
    if not Config.WebhookEnabled or Config.WebhookURL == "" then return end
    pcall(function()
        local body = HttpService:JSONEncode(data)
        Exec.Post(Config.WebhookURL, body)
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
                if matched and MatchesOreFilter(nameLower) then
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
    
    EquipBestPickaxe()
    BypassPromptsIn(rock)
    
    AddLog("Mining: " .. rockData.Name)
    
    -- Teleport to rock
    TeleportTo(part.Position)
    task.wait(0.05)
    
    local function doMineOnce()
        -- Method 1: Fire click detector
        if HasFireClick then
            local clickDetector = rock:FindFirstChildOfClass("ClickDetector") or part:FindFirstChildOfClass("ClickDetector")
            if clickDetector then Exec.FireClick(clickDetector) end
        end
        if HasFireProximity then
            local prompt = rock:FindFirstChildOfClass("ProximityPrompt") or part:FindFirstChildOfClass("ProximityPrompt")
            if prompt then
                if Config.BypassPromptHold then prompt.HoldDuration = 0 end
                Exec.FireProximity(prompt)
            end
        end
        if HasFireTouch then
            Exec.FireTouch(HumanoidRootPart, part, 0)
            task.wait(0.01)
            Exec.FireTouch(HumanoidRootPart, part, 1)
        end
        -- Method 4: Use tool if equipped
        local tool = Character and Character:FindFirstChildOfClass("Tool")
        if tool then tool:Activate() end
        -- Method 5: Fire remote events for mining
        FireRemote("mine"); FireRemote("harvest"); FireRemote("collect")
        FireRemote("break"); FireRemote("gather"); FireRemote("dig")
        FireRemote("pick"); FireRemote("swing")
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
    end
    
    local hits = Config.RapidMine and Config.RapidMineCount or 1
    for _ = 1, hits do
        doMineOnce()
        if hits > 1 then task.wait(0.03) end
    end
    
    CollectNearbyDrops()
    State.FarmCount = State.FarmCount + 1
    pcall(function() SendFarmLog(rockData.Name) end)
    
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
        if clickDetector then Exec.FireClick(clickDetector) end
    end
    
    if HasFireProximity then
        local prompt = shop:FindFirstChildOfClass("ProximityPrompt") or part:FindFirstChildOfClass("ProximityPrompt")
        if prompt then Exec.FireProximity(prompt) end
    end
    
    if HasFireTouch then
        Exec.FireTouch(HumanoidRootPart, part, 0)
        task.wait(0.01)
        Exec.FireTouch(HumanoidRootPart, part, 1)
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
    
    State.FarmConnection = true
    task.spawn(function()
        while Config.AutoFarm and State.FarmConnection do
            if GetCharacter() then
                local rocks = GetAllRocks()
                if #rocks > 0 then
                    local target = rocks[1]
                    State.CurrentTarget = target.Name
                    MineRock(target)
                else
                    State.CurrentTarget = "Searching..."
                end
            end
            task.wait(Config.FarmDelay)
        end
    end)
end

local function StopAutoFarm()
    State.FarmConnection = nil
    State.CurrentTarget = "None"
    AddLog("Auto Farm STOPPED")
end

-- ========== AUTO SELL ==========
local function StartAutoSell()
    if State.SellConnection then return end
    AddLog("Auto Sell STARTED")
    
    State.SellConnection = true
    task.spawn(function()
        while Config.AutoSell and State.SellConnection do
            if GetCharacter() then
                local canSell = true
                if Config.SellWhenFull and not IsBackpackFull() then canSell = false end
                if Config.SellMinCash > 0 and GetPlayerCash() < Config.SellMinCash then canSell = false end
                if canSell then
                    local shops = GetAllShops()
                    if #shops > 0 then
                        SellItems(shops[1])
                        pcall(SendSellLog)
                    end
                end
            end
            task.wait(Config.SellDelay)
        end
    end)
end

local function StopAutoSell()
    State.SellConnection = nil
    AddLog("Auto Sell STOPPED")
end

-- ========== AUTO UPGRADE ==========
local function StartAutoUpgrade()
    if State.UpgradeConn then return end
    AddLog("Auto Upgrade STARTED")
    
    State.UpgradeConn = true
    task.spawn(function()
        while Config.AutoUpgrade and State.UpgradeConn do
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
        end
    end)
end

local function StopAutoUpgrade()
    State.UpgradeConn = nil
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
            label.Text = rock.Name .. " [" .. math.floor(rock.Distance) .. "m]" .. (rock.Value > 0 and (" | $" .. tostring(rock.Value)) or "")
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
        if State.ESPRefreshThread then
            task.cancel(State.ESPRefreshThread)
        end
        State.ESPRefreshThread = task.spawn(function()
            while Config.ESPEnabled do
                task.wait(5)
                if Config.ESPEnabled then
                    CreateESP()
                end
            end
            State.ESPRefreshThread = nil
        end)
    end
end

local function StopESP()
    if State.ESPRefreshThread then
        task.cancel(State.ESPRefreshThread)
        State.ESPRefreshThread = nil
    end
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

-- ========== CLEAR ESP / TRACERS (scope A — needed by PanicStopAll) ==========
local function ClearTracers()
    for _, obj in ipairs(State.TracerObjects) do
        pcall(function() obj:Destroy() end)
    end
    State.TracerObjects = {}
end

local function ClearPlayerESP()
    for _, obj in ipairs(State.PlayerESPObjects) do
        pcall(function() obj:Destroy() end)
    end
    State.PlayerESPObjects = {}
end

local function ClearChestESP()
    for _, obj in ipairs(State.ChestESPObjects) do
        pcall(function() obj:Destroy() end)
    end
    State.ChestESPObjects = {}
end

-- ========== STOP FUNCTIONS (scope A — needed by PanicStopAll) ==========
local function StopInfiniteJump()
    if State.InfiniteJumpConn then
        State.InfiniteJumpConn:Disconnect()
        State.InfiniteJumpConn = nil
    end
end

local function StopClickTeleport()
    if State.ClickTPConn then
        State.ClickTPConn:Disconnect()
        State.ClickTPConn = nil
    end
end

local function StopAntiAFK()
    if State.AntiAFKConn then
        State.AntiAFKConn:Disconnect()
        State.AntiAFKConn = nil
    end
end

local function StopWarmthKeeper()
    if State.WarmthKeeperConn then
        State.WarmthKeeperConn:Disconnect()
        State.WarmthKeeperConn = nil
    end
end

local function RestoreFullbright()
    if not State.FullbrightApplied then return end
    for k, v in pairs(State.SavedLighting) do
        pcall(function() Lighting[k] = v end)
    end
    State.FullbrightApplied = false
    AddLog("Fullbright OFF")
end

-- ========== PANIC / STOP ALL ==========
local function PanicStopAll()
    Config.AutoFarm = false
    Config.AutoSell = false
    Config.AutoUpgrade = false
    Config.SmartLoop = false
    Config.ESPEnabled = false
    Config.FlyEnabled = false
    Config.Noclip = false
    Config.RapidMine = false
    Config.RemoteSpy = false
    Config.InfiniteJump = false
    Config.ClickTeleport = false
    Config.AntiAFK = false
    Config.AntiDamage = false
    Config.AntiFreeze = false
    Config.UnlimitedBackpack = false
    Config.UnlimitedLuck = false
    Config.SpeedBoost = false
    Config.Tracers = false
    Config.PlayerESP = false
    Config.ChestESP = false
    Config.Fullbright = false
    Config.HideOtherPlayers = false
    Config.WarmthKeeper = false
    Config.StaminaKeeper = false
    Config.AutoCollectDrops = false
    Config.FPSBooster = false
    Config.WebhookEnabled = false
    StopAutoFarm()
    StopAutoSell()
    StopAutoUpgrade()
    State.SmartLoopConn = nil
    StopFly()
    StopNoclip()
    StopESP()
    ClearTracers()
    ClearPlayerESP()
    ClearChestESP()
    RestoreFullbright()
    if State.InfiniteJumpConn then State.InfiniteJumpConn:Disconnect() State.InfiniteJumpConn = nil end
    if State.ClickTPConn then State.ClickTPConn:Disconnect() State.ClickTPConn = nil end
    if State.WarmthKeeperConn then State.WarmthKeeperConn:Disconnect() State.WarmthKeeperConn = nil end
    if State.DropCollectConn then State.DropCollectConn = nil end
    if State.AntiAFKConn then State.AntiAFKConn:Disconnect() State.AntiAFKConn = nil end
    if State.AntiDamageConn then State.AntiDamageConn:Disconnect() State.AntiDamageConn = nil end
    StopAntiDamage()
    StopWarmthKeeper()
    StopInfiniteJump()
    StopClickTeleport()
    StopAntiAFK()
    AddLog("PANIC: All features stopped")
end

-- ========== SMART LOOP + GUI + RUNTIME (scope B) ==========
do
local ScreenGui, MainFrame, MinimizedFrame, IsMobile, ToggleGUI
local GUIWidth, MinimizedSize, MinimizedPosition, HeaderH, ContentTitle
local TabFrames, TabButtons, TabIndicators, MinimizeBtn, ExpandBtn
local Tabs, TabInfo, layoutOrder, Header, TitleLabel
IsMobile = UserInputService.TouchEnabled

local function StartSmartLoop()
    if State.SmartLoopConn then return end
    AddLog("Smart Loop STARTED (Farm → Sell → Upgrade)")
    State.SmartLoopConn = true
    task.spawn(function()
        while Config.SmartLoop and State.SmartLoopConn do
            if GetCharacter() then
                EquipBestPickaxe()
                BypassPromptsIn(Workspace)
                if ShouldSellNow() then
                    local shops = GetAllShops()
                    if #shops > 0 then
                        State.CurrentTarget = "Selling..."
                        SellItems(shops[1])
                        pcall(SendSellLog)
                        FireUpgradePurchases()
                        TryAutoRebirth()
                    end
                else
                    local rocks = GetAllRocks()
                    if #rocks > 0 then
                        State.CurrentTarget = rocks[1].Name
                        MineRock(rocks[1])
                    else
                        State.CurrentTarget = "Searching..."
                        CollectNearbyDrops()
                    end
                end
                TryAutoClaimDaily()
            end
            task.wait(Config.FarmDelay)
        end
    end)
end

local function StopSmartLoop()
    State.SmartLoopConn = nil
    AddLog("Smart Loop STOPPED")
end

-- ========== REMOTE SPY ==========
local function SerializeArg(arg)
    local t = typeof(arg)
    if t == "Instance" then return arg:GetFullName()
    elseif t == "Vector3" then return string.format("Vector3(%.1f,%.1f,%.1f)", arg.X, arg.Y, arg.Z)
    elseif t == "CFrame" then return "CFrame"
    elseif t == "table" then return "table"
    else return tostring(arg) end
end

local function AddRemoteSpyLog(remoteName, remoteType, args)
    local argStr = ""
    for i, a in ipairs(args) do
        argStr = argStr .. (i > 1 and ", " or "") .. SerializeArg(a)
    end
    local entry = os.date("%H:%M:%S") .. " | " .. remoteType .. " | " .. remoteName .. "(" .. argStr .. ")"
    table.insert(State.RemoteSpyLogs, 1, entry)
    if #State.RemoteSpyLogs > 40 then table.remove(State.RemoteSpyLogs) end
    State.LastRemoteFire = entry
    if RemoteSpyList then
        pcall(function()
            ClearScrollList(RemoteSpyList)
            for i, log in ipairs(State.RemoteSpyLogs) do
                if i > 20 then break end
                local lbl = Instance.new("TextLabel")
                lbl.Size = UDim2.new(1, 0, 0, 32)
                lbl.BackgroundTransparency = 1
                lbl.Text = log
                lbl.TextColor3 = Theme.Accent
                lbl.TextXAlignment = Enum.TextXAlignment.Left
                lbl.TextWrapped = true
                lbl.Font = Enum.Font.Code
                lbl.TextSize = 9
                lbl.LayoutOrder = i
                lbl.Parent = RemoteSpyList
            end
        end)
    end
end

pcall(function()
    if Exec.HasHookMeta and Exec.GetNamecallMethod then
        Exec.OnNamecall(function(self, method, args)
            if RemoteSpyActive and (method == "FireServer" or method == "InvokeServer") then
                if self:IsA("RemoteEvent") or self:IsA("RemoteFunction") then
                    pcall(function() AddRemoteSpyLog(self.Name, method, args) end)
                end
            end
            if method == "Kick" and self == LocalPlayer then
                return true, nil
            end
            if method == "FindService" then
                local svc = args[1]
                if svc == "ExploitService" or svc == "CheatService" then
                    return true, nil
                end
            end
            return false
        end)
    end
end)

local function StartRemoteSpy()
    if not Exec.HasHookMeta then
        AddLog("Remote Spy unavailable on this executor")
        return
    end
    RemoteSpyActive = true
    AddLog("Remote Spy ENABLED")
end

local function StopRemoteSpy()
    RemoteSpyActive = false
    Config.RemoteSpy = false
    AddLog("Remote Spy DISABLED")
end

local function FireCustomRemote()
    if Config.CustomRemoteName == "" then
        AddLog("Enter a remote name first")
        return
    end
    local args = {}
    if Config.CustomRemoteArgs ~= "" then
        for token in string.gmatch(Config.CustomRemoteArgs, "[^,]+") do
            local piece = string.gsub(token, "^%s*(.-)%s*$", "%1")
            local num = tonumber(piece)
            if num then
                table.insert(args, num)
            elseif piece == "true" then
                table.insert(args, true)
            elseif piece == "false" then
                table.insert(args, false)
            else
                table.insert(args, piece)
            end
        end
    end
    if FireRemoteExact(Config.CustomRemoteName, Exec.Unpack(args)) then
        AddLog("Fired exact: " .. Config.CustomRemoteName)
    else
        FireRemote(Config.CustomRemoteName, Exec.Unpack(args))
        AddLog("Fired pattern: " .. Config.CustomRemoteName)
    end
end

-- ========== INFINITE JUMP ==========
local function StartInfiniteJump()
    if State.InfiniteJumpConn then return end
    State.InfiniteJumpConn = UserInputService.JumpRequest:Connect(function()
        if Config.InfiniteJump and GetCharacter() and Humanoid then
            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
    AddLog("Infinite Jump ENABLED")
end

-- ========== CLICK TELEPORT ==========
local function StartClickTeleport()
    if State.ClickTPConn then return end
    State.ClickTPConn = UserInputService.InputBegan:Connect(function(input, processed)
        if processed or not Config.ClickTeleport then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1 and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            local cam = Workspace.CurrentCamera
            if not cam then return end
            local ray = cam:ScreenPointToRay(input.Position.X, input.Position.Y)
            local params = RaycastParams.new()
            if Character then params.FilterDescendantsInstances = {Character} end
            local usedExclude = pcall(function()
                params.FilterType = Enum.RaycastFilterType.Exclude
            end)
            if not usedExclude then
                params.FilterType = Enum.RaycastFilterType.Blacklist
            end
            local hit = Workspace:Raycast(ray.Origin, ray.Direction * 2000, params)
            if hit then
                TeleportTo(hit.Position)
                AddLog("Click TP → " .. math.floor(hit.Position.X) .. "," .. math.floor(hit.Position.Y))
            end
        end
    end)
    AddLog("Click TP ENABLED (Ctrl+Click)")
end

-- ========== WAYPOINTS ==========
local function SaveWaypoint(name)
    if not GetCharacter() then return end
    State.Waypoints[name] = HumanoidRootPart.Position
    AddLog("Saved waypoint: " .. name)
end

local function TeleportToWaypoint(name)
    local pos = State.Waypoints[name]
    if pos then
        TeleportTo(pos)
        AddLog("TP waypoint: " .. name)
    else
        AddLog("Waypoint not found: " .. name)
    end
end

-- ========== ANTI-AFK ==========
local function StartAntiAFK()
    if State.AntiAFKConn then return end
    local vu = game:GetService("VirtualUser")
    State.AntiAFKConn = LocalPlayer.Idled:Connect(function()
        if Config.AntiAFK then
            pcall(function() vu:CaptureController(); vu:ClickButton2(Vector2.new(0, 0)) end)
        end
    end)
    AddLog("Anti-AFK ENABLED")
end

-- ========== WARMTH / STAMINA KEEPER ==========
local function StartWarmthKeeper()
    if State.WarmthKeeperConn then return end
    State.WarmthKeeperConn = RunService.Heartbeat:Connect(function()
        if not Config.WarmthKeeper and not Config.StaminaKeeper then return end
        if not GetCharacter() then return end
        pcall(function()
            if Config.WarmthKeeper then
                for _, name in ipairs({"Warmth", "Temperature", "Cold", "Heat", "Warm"}) do
                    local v = Character:FindFirstChild(name) or LocalPlayer:FindFirstChild(name)
                    if v and v:IsA("ValueBase") then v.Value = 100 end
                end
                FireRemote("warmth"); FireRemote("heat"); FireRemote("campfire")
            end
            if Config.StaminaKeeper then
                for _, name in ipairs({"Stamina", "Energy", "Climb", "Oxygen", "Breath"}) do
                    local v = Character:FindFirstChild(name) or LocalPlayer:FindFirstChild(name)
                    if v and v:IsA("ValueBase") then v.Value = 100 end
                end
            end
        end)
    end)
    AddLog("Warmth/Stamina Keeper ENABLED")
end

-- ========== TRACERS ==========
local function UpdateTracers()
    if not Config.Tracers then ClearTracers() return end
    if not GetCharacter() then return end
    ClearTracers()
    local targets = {}
    for _, r in ipairs(GetAllRocks()) do
        if #targets >= 8 then break end
        table.insert(targets, {Part = r.Part, Color = Color3.fromRGB(100, 200, 255)})
    end
    for _, s in ipairs(GetAllShops()) do
        if #targets >= 10 then break end
        table.insert(targets, {Part = s.Part, Color = Color3.fromRGB(0, 255, 100)})
    end
    for _, t in ipairs(targets) do
        local att0 = Instance.new("Attachment")
        att0.Parent = HumanoidRootPart
        local att1 = Instance.new("Attachment")
        att1.Parent = t.Part
        local beam = Instance.new("Beam")
        beam.Attachment0 = att0
        beam.Attachment1 = att1
        beam.Color = ColorSequence.new(t.Color)
        beam.Width0 = 0.15
        beam.Width1 = 0.15
        beam.FaceCamera = true
        beam.Parent = HumanoidRootPart
        table.insert(State.TracerObjects, att0)
        table.insert(State.TracerObjects, att1)
        table.insert(State.TracerObjects, beam)
    end
end

-- ========== PLAYER ESP ==========
local function UpdatePlayerESP()
    if not Config.PlayerESP then ClearPlayerESP() return end
    ClearPlayerESP()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local hl = Instance.new("Highlight")
                hl.FillTransparency = 0.7
                hl.OutlineColor = Color3.fromRGB(255, 80, 80)
                hl.FillColor = Color3.fromRGB(255, 50, 50)
                hl.Parent = plr.Character
                local bb = Instance.new("BillboardGui")
                bb.Size = UDim2.new(0, 100, 0, 24)
                bb.StudsOffset = Vector3.new(0, 3, 0)
                bb.AlwaysOnTop = true
                bb.Parent = hrp
                local lbl = Instance.new("TextLabel")
                lbl.Size = UDim2.new(1, 0, 1, 0)
                lbl.BackgroundTransparency = 0.5
                lbl.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                lbl.Text = plr.Name .. " [" .. math.floor(GetDistance(hrp)) .. "m]"
                lbl.TextColor3 = Color3.fromRGB(255, 100, 100)
                lbl.Font = Enum.Font.GothamBold
                lbl.TextSize = 10
                lbl.Parent = bb
                table.insert(State.PlayerESPObjects, hl)
                table.insert(State.PlayerESPObjects, bb)
            end
        end
    end
end

-- ========== CHEST / EVENT ESP ==========
local function UpdateChestESP()
    if not Config.ChestESP then ClearChestESP() return end
    ClearChestESP()
    local patterns = {"chest", "crate", "event", "gift", "present", "treasure", "reward"}
    for _, d in ipairs(Workspace:GetDescendants()) do
        if d:IsA("Model") or d:IsA("BasePart") then
            local nl = string.lower(d.Name)
            for _, p in ipairs(patterns) do
                if string.find(nl, p) then
                    local part = d:IsA("BasePart") and d or d:FindFirstChildWhichIsA("BasePart")
                    if part then
                        local hl = Instance.new("Highlight")
                        hl.FillColor = Color3.fromRGB(255, 200, 50)
                        hl.OutlineColor = Color3.fromRGB(255, 215, 0)
                        hl.FillTransparency = 0.5
                        hl.Parent = d
                        table.insert(State.ChestESPObjects, hl)
                    end
                    break
                end
            end
        end
    end
end

-- ========== FULLBRIGHT ==========
local function ApplyFullbright()
    if State.FullbrightApplied then return end
    State.SavedLighting = {
        Brightness = Lighting.Brightness,
        ClockTime = Lighting.ClockTime,
        FogEnd = Lighting.FogEnd,
        GlobalShadows = Lighting.GlobalShadows,
        Ambient = Lighting.Ambient,
        OutdoorAmbient = Lighting.OutdoorAmbient,
    }
    Lighting.Brightness = 2
    Lighting.ClockTime = 14
    Lighting.FogEnd = 100000
    Lighting.GlobalShadows = false
    Lighting.Ambient = Color3.fromRGB(180, 180, 180)
    Lighting.OutdoorAmbient = Color3.fromRGB(180, 180, 180)
    State.FullbrightApplied = true
    AddLog("Fullbright ON")
end

-- ========== HIDE PLAYERS ==========
local function ApplyHidePlayers()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            for _, p in ipairs(plr.Character:GetDescendants()) do
                if p:IsA("BasePart") then p.LocalTransparencyModifier = Config.HideOtherPlayers and 1 or 0 end
            end
        end
    end
end

-- ========== FPS BOOSTER ==========
local function ApplyFPSBooster()
    if not Config.FPSBooster then return end
    pcall(function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        for _, d in ipairs(Workspace:GetDescendants()) do
            if d:IsA("ParticleEmitter") or d:IsA("Trail") or d:IsA("Smoke") or d:IsA("Fire") then
                d.Enabled = false
            end
        end
        Lighting.GlobalShadows = false
    end)
    AddLog("FPS Booster applied")
end

-- ========== CONFIG SAVE / LOAD ==========
local function ConfigToTable()
    local t = {}
    for k, v in pairs(Config) do t[k] = v end
    return t
end

local function ApplyConfigTable(t)
    if type(t) ~= "table" then return false end
    for k, v in pairs(t) do
        if Config[k] ~= nil then Config[k] = v end
    end
    return true
end

local function SaveConfig()
    local ok, json = pcall(function() return HttpService:JSONEncode(ConfigToTable()) end)
    if not ok then AddLog("Config save failed") return end
    if Exec.WriteFile("MineaMountain_Config.json", json) then
        AddLog("Config saved to file")
    elseif Exec.HasClipboard then
        Exec.SetClipboard(json)
        AddLog("Config copied to clipboard")
    else
        AddLog("Save unavailable (no writefile/clipboard)")
    end
end

local function LoadConfig()
    local json = Exec.ReadFile("MineaMountain_Config.json")
    if json then
        local ok, data = pcall(function() return HttpService:JSONDecode(json) end)
        if ok and ApplyConfigTable(data) then
            AddLog("Config loaded from file")
            return true
        end
    end
    AddLog("No saved config found")
    return false
end

-- ========== SERVER HOP ==========
local function DoServerHop()
    AddLog("Server hopping...")
    pcall(function()
        local body = Exec.HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
        if not body then error("HttpGet failed") end
        local servers = HttpService:JSONDecode(body)
        if servers and servers.data then
            for _, srv in ipairs(servers.data) do
                if srv.id ~= game.JobId and srv.playing < srv.maxPlayers then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, srv.id, LocalPlayer)
                    return
                end
            end
        end
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end)
end

local function StartServerHopTimer()
    if State.ServerHopConn then return end
    if Config.ServerHopInterval <= 0 then return end
    State.ServerHopConn = true
    task.spawn(function()
        while Config.ServerHopInterval > 0 and State.ServerHopConn do
            task.wait(Config.ServerHopInterval * 60)
            if Config.ServerHopInterval > 0 then DoServerHop() end
        end
    end)
end

local function StopServerHopTimer()
    State.ServerHopConn = nil
end

-- ========== AUTO DROP COLLECT LOOP ==========
local function StartDropCollectLoop()
    if State.DropCollectConn then return end
    State.DropCollectConn = true
    task.spawn(function()
        while Config.AutoCollectDrops and State.DropCollectConn do
            CollectNearbyDrops()
            task.wait(1.5)
        end
    end)
end

local function UpdateStats()
    if StatsLabel then
        StatsLabel.Text = "Mined: " .. State.FarmCount .. " | Sells: " .. State.SellCount .. " | Dupe: " .. State.DupeCount .. " | Target: " .. (State.CurrentTarget or "None")
    end
    if CashLabel then
        CashLabel.Text = "Cash: " .. GetPlayerCash() .. " | Weight: " .. math.floor(GetBackpackWeight()) .. "/" .. math.floor(GetBackpackCapacity())
    end
end

-- ========== GUI CREATION (scope C) ==========
do
local function BuildGUIShell()
    ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MineaMountainV7"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

ScreenGui.DisplayOrder = 999

Exec.ProtectGui(ScreenGui)
pcall(function() ScreenGui.Parent = Exec.GetGuiParent() end)
if not ScreenGui.Parent then
    pcall(function() ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end)
end

local Camera = Workspace.CurrentCamera or Workspace:WaitForChild("Camera", 10)
local ViewSize = Camera and Camera.ViewportSize or Vector2.new(428, 926)
IsMobile = UserInputService.TouchEnabled or ViewSize.X < 900
local SidebarW = IsMobile and 0 or 175
GUIWidth = IsMobile and UDim2.new(1, -20, 1, -36) or UDim2.new(0, 700, 0, 440)
MinimizedSize = UDim2.new(0, IsMobile and 140 or 160, 0, 44)
local GUIPosition = IsMobile and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0.5, -350, 0.5, -220)
MinimizedPosition = IsMobile and UDim2.new(1, -150, 1, -60) or GUIPosition
local MobileTabH = 56
HeaderH = IsMobile and 46 or 54

MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = GUIWidth
MainFrame.Position = GUIPosition
MainFrame.AnchorPoint = IsMobile and Vector2.new(0.5, 0.5) or Vector2.new(0, 0)
MainFrame.BackgroundColor3 = Theme.Bg
MainFrame.BackgroundTransparency = 0.05
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Theme.Accent
MainStroke.Thickness = 1
MainStroke.Transparency = 0.65
MainStroke.Parent = MainFrame

-- Top header bar
Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, HeaderH)
Header.BackgroundColor3 = Theme.Sidebar
Header.BorderSizePixel = 0
Header.ZIndex = 5
Header.Parent = MainFrame

local HeaderLine = Instance.new("Frame")
HeaderLine.Size = UDim2.new(1, 0, 0, 1)
HeaderLine.Position = UDim2.new(0, 0, 1, -1)
HeaderLine.BackgroundColor3 = Theme.Accent
HeaderLine.BackgroundTransparency = 0.5
HeaderLine.BorderSizePixel = 0
HeaderLine.ZIndex = 6
HeaderLine.Parent = Header

local LogoMark = Instance.new("TextLabel")
LogoMark.Size = UDim2.new(0, 36, 0, 36)
LogoMark.Position = UDim2.new(0, 14, 0.5, -18)
LogoMark.BackgroundColor3 = Theme.Accent
LogoMark.Text = "M"
LogoMark.TextColor3 = Color3.fromRGB(10, 10, 12)
LogoMark.Font = Enum.Font.GothamBlack
LogoMark.TextSize = 22
LogoMark.ZIndex = 6
LogoMark.Parent = Header
local logoC = Instance.new("UICorner")
logoC.CornerRadius = UDim.new(0, 8)
logoC.Parent = LogoMark

local EditionLabel = Instance.new("TextLabel")
EditionLabel.Size = UDim2.new(0, 100, 0, 14)
EditionLabel.Position = UDim2.new(0, 56, 0, 12)
EditionLabel.BackgroundTransparency = 1
EditionLabel.Text = "MINea EDITION"
EditionLabel.TextColor3 = Theme.Accent
EditionLabel.Font = Enum.Font.GothamBold
EditionLabel.TextSize = 10
EditionLabel.TextXAlignment = Enum.TextXAlignment.Left
EditionLabel.ZIndex = 6
EditionLabel.Parent = Header

EditionLabel.Visible = not IsMobile

TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(IsMobile and 0.62 or 0.55, 0, 0, 22)
TitleLabel.Position = UDim2.new(IsMobile and 0.18 or 0.28, 0, 0, IsMobile and 6 or 10)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Minea Hub [ v7 ]"
TitleLabel.TextColor3 = Theme.Text
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = IsMobile and 14 or 17
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.ZIndex = 6
TitleLabel.Parent = Header

local SubtitleLabel = Instance.new("TextLabel")
SubtitleLabel.Size = UDim2.new(0.55, 0, 0, 16)
SubtitleLabel.Position = UDim2.new(0.28, 0, 0, 32)
SubtitleLabel.BackgroundTransparency = 1
SubtitleLabel.Text = "Mine a Mountain · " .. os.date("%A, %B %d %Y")
SubtitleLabel.TextColor3 = Theme.SubText
SubtitleLabel.Font = Enum.Font.Gotham
SubtitleLabel.TextSize = 10
SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
SubtitleLabel.ZIndex = 6
SubtitleLabel.Parent = Header

SubtitleLabel.Visible = not IsMobile

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, IsMobile and 40 or 32, 0, IsMobile and 40 or 32)
CloseBtn.Position = UDim2.new(1, IsMobile and -46 or -42, 0.5, IsMobile and -20 or -16)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Theme.SubText
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16
CloseBtn.ZIndex = 6
CloseBtn.Parent = Header
CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    MinimizedFrame.Visible = false
    State.GUIHidden = true
    if not IsMobile then
        ScreenGui.Enabled = false
    end
end)

local MinimizeBtnSmall = Instance.new("TextButton")
MinimizeBtnSmall.Size = UDim2.new(0, IsMobile and 40 or 32, 0, IsMobile and 40 or 32)
MinimizeBtnSmall.Position = UDim2.new(1, IsMobile and -90 or -78, 0.5, IsMobile and -20 or -16)
MinimizeBtnSmall.BackgroundTransparency = 1
MinimizeBtnSmall.Text = "—"
MinimizeBtnSmall.TextColor3 = Theme.SubText
MinimizeBtnSmall.Font = Enum.Font.GothamBold
MinimizeBtnSmall.TextSize = 18
MinimizeBtnSmall.ZIndex = 6
MinimizeBtnSmall.Parent = Header

MinimizeBtn = MinimizeBtnSmall

local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, SidebarW, 1, -(HeaderH + (IsMobile and MobileTabH or 0)))
Sidebar.Position = UDim2.new(0, 0, 0, HeaderH)
Sidebar.Visible = not IsMobile
Sidebar.BackgroundColor3 = Theme.Sidebar
Sidebar.BorderSizePixel = 0
Sidebar.ZIndex = 2
Sidebar.Parent = MainFrame

local SidebarLine = Instance.new("Frame")
SidebarLine.Size = UDim2.new(0, 1, 1, 0)
SidebarLine.Position = UDim2.new(1, -1, 0, 0)
SidebarLine.BackgroundColor3 = Theme.Accent
SidebarLine.BackgroundTransparency = 0.7
SidebarLine.BorderSizePixel = 0
SidebarLine.Parent = Sidebar

local TabList = Instance.new("Frame")
TabList.Size = UDim2.new(1, 0, 1, -8)
TabList.Position = UDim2.new(0, 0, 0, 4)
TabList.BackgroundTransparency = 1
TabList.Parent = Sidebar

local TabListLayout = Instance.new("UIListLayout")
TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabListLayout.Padding = UDim.new(0, 4)
TabListLayout.Parent = TabList

local TabPad = Instance.new("UIPadding")
TabPad.PaddingTop = UDim.new(0, 6)
TabPad.PaddingLeft = UDim.new(0, 6)
TabPad.PaddingRight = UDim.new(0, 6)
TabPad.Parent = TabList

-- Content header + scroll area
local ContentHeader = Instance.new("Frame")
ContentHeader.Size = IsMobile and UDim2.new(1, -16, 0, 28) or UDim2.new(1, -SidebarW - 16, 0, 36)
ContentHeader.Position = IsMobile and UDim2.new(0, 8, 0, HeaderH + 2) or UDim2.new(0, SidebarW + 8, 0, 62)
ContentHeader.BackgroundTransparency = 1
ContentHeader.Parent = MainFrame

ContentTitle = Instance.new("TextLabel")
ContentTitle.Size = UDim2.new(1, 0, 1, 0)
ContentTitle.BackgroundTransparency = 1
ContentTitle.Text = "General"
ContentTitle.TextColor3 = Theme.Text
ContentTitle.Font = Enum.Font.GothamBold
ContentTitle.TextSize = IsMobile and 14 or 15
ContentTitle.TextXAlignment = Enum.TextXAlignment.Left
ContentTitle.Parent = ContentHeader

local ContentArea = Instance.new("Frame")
ContentArea.Name = "ContentArea"
ContentArea.Size = IsMobile and UDim2.new(1, -16, 1, -(HeaderH + MobileTabH + 38)) or UDim2.new(1, -SidebarW - 16, 1, -108)
ContentArea.Position = IsMobile and UDim2.new(0, 8, 0, HeaderH + 32) or UDim2.new(0, SidebarW + 8, 0, 98)
ContentArea.BackgroundTransparency = 1
ContentArea.ClipsDescendants = true
ContentArea.Parent = MainFrame

Tabs = {"Farm", "Sell", "ESP", "Exploit", "Tools", "Misc"}
TabInfo = {
    Farm = {Icon = "⚙", Title = "General", Sub = "Auto mine & farm"},
    Sell = {Icon = "⚡", Title = "Automatic", Sub = "Sell & upgrades"},
    ESP = {Icon = "👁", Title = "Visuals", Sub = "ESP & tracers"},
    Exploit = {Icon = "🎭", Title = "Exploits", Sub = "Movement & dupes"},
    Tools = {Icon = "🔧", Title = "Tools", Sub = "Spy & waypoints"},
    Misc = {Icon = "⚙", Title = "Settings", Sub = "Config & misc"},
}
TabButtons = {}
TabFrames = {}
TabIndicators = {}

for i, tabName in ipairs(Tabs) do
    local info = TabInfo[tabName]
    local tabBtn = Instance.new("TextButton")
    tabBtn.Name = tabName .. "Tab"
    tabBtn.Size = IsMobile and UDim2.new(1 / #Tabs, -3, 1, -4) or UDim2.new(1, 0, 0, 52)
    tabBtn.BackgroundColor3 = Theme.Panel
    tabBtn.BackgroundTransparency = tabName == "Farm" and 0 or 0.35
    tabBtn.BorderSizePixel = 0
    tabBtn.Text = ""
    tabBtn.AutoButtonColor = false
    tabBtn.LayoutOrder = i
    tabBtn.Parent = TabList

    local tCorner = Instance.new("UICorner")
    tCorner.CornerRadius = UDim.new(0, 8)
    tCorner.Parent = tabBtn

    local icon = Instance.new("TextLabel")
    icon.Size = UDim2.new(0, 28, 0, 28)
    icon.Position = UDim2.new(0, 8, 0.5, -14)
    icon.BackgroundTransparency = 1
    icon.Text = info.Icon
    icon.TextColor3 = Theme.Accent
    icon.TextSize = 16
    icon.Font = Enum.Font.GothamBold
    icon.Parent = tabBtn

    local tTitle = Instance.new("TextLabel")
    tTitle.Size = UDim2.new(1, -44, 0, 18)
    tTitle.Position = UDim2.new(0, 38, 0, IsMobile and 6 or 8)
    tTitle.BackgroundTransparency = 1
    tTitle.Text = info.Title
    tTitle.TextColor3 = Theme.Text
    tTitle.Font = Enum.Font.GothamBold
    tTitle.TextSize = IsMobile and 10 or 12
    tTitle.TextXAlignment = Enum.TextXAlignment.Left
    tTitle.Parent = tabBtn

    local tSub = Instance.new("TextLabel")
    tSub.Size = UDim2.new(1, -44, 0, 14)
    tSub.Position = UDim2.new(0, 38, 0, IsMobile and 24 or 28)
    tSub.BackgroundTransparency = 1
    tSub.Text = info.Sub
    tSub.TextColor3 = Theme.SubText
    tSub.Font = Enum.Font.Gotham
    tSub.TextSize = 9
    tSub.TextXAlignment = Enum.TextXAlignment.Left
    tSub.Parent = tabBtn
    if IsMobile then
        tTitle.Visible = false
        tSub.Visible = false
        icon.Size = UDim2.new(0, 30, 0, 30)
        icon.Position = UDim2.new(0.5, -15, 0.5, -15)
        icon.AnchorPoint = Vector2.new(0.5, 0.5)
    end

    local indicator = Instance.new("Frame")
    indicator.Size = IsMobile and UDim2.new(0.65, 0, 0, 3) or UDim2.new(0, 3, 0.7, 0)
    indicator.Position = IsMobile and UDim2.new(0.175, 0, 0, 2) or UDim2.new(1, -4, 0.15, 0)
    indicator.BackgroundColor3 = Theme.Accent
    indicator.BorderSizePixel = 0
    indicator.Visible = (tabName == "Farm")
    indicator.Parent = tabBtn
    local iC = Instance.new("UICorner")
    iC.CornerRadius = UDim.new(1, 0)
    iC.Parent = indicator

    TabButtons[tabName] = tabBtn
    TabIndicators[tabName] = indicator

    local tabFrame = Instance.new("ScrollingFrame")
    tabFrame.Name = tabName .. "Content"
    tabFrame.Size = UDim2.new(1, 0, 1, 0)
    tabFrame.BackgroundTransparency = 1
    tabFrame.BorderSizePixel = 0
    tabFrame.ScrollBarThickness = IsMobile and 6 or 3
    tabFrame.ScrollBarImageColor3 = Theme.Accent
    tabFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    tabFrame.Visible = (tabName == "Farm")
    tabFrame.Parent = ContentArea

    local tabLayout = Instance.new("UIListLayout")
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabLayout.Padding = UDim.new(0, 6)
    tabLayout.Parent = tabFrame

    local tabPad = Instance.new("UIPadding")
    tabPad.PaddingTop = UDim.new(0, 4)
    tabPad.PaddingBottom = UDim.new(0, 8)
    tabPad.PaddingLeft = UDim.new(0, 2)
    tabPad.PaddingRight = UDim.new(0, 6)
    tabPad.Parent = tabFrame

    TabFrames[tabName] = tabFrame
end

-- Mobile: bottom tab bar (sidebar hidden — no room on phone screens)
local BottomBar
if IsMobile then
    BottomBar = Instance.new("Frame")
    BottomBar.Name = "BottomTabBar"
    BottomBar.Size = UDim2.new(1, 0, 0, MobileTabH)
    BottomBar.Position = UDim2.new(0, 0, 1, -MobileTabH)
    BottomBar.BackgroundColor3 = Theme.Sidebar
    BottomBar.BorderSizePixel = 0
    BottomBar.ZIndex = 4
    BottomBar.Parent = MainFrame

    local bottomLine = Instance.new("Frame")
    bottomLine.Size = UDim2.new(1, 0, 0, 1)
    bottomLine.BackgroundColor3 = Theme.Accent
    bottomLine.BackgroundTransparency = 0.5
    bottomLine.BorderSizePixel = 0
    bottomLine.Parent = BottomBar

    TabList.Parent = BottomBar
    TabList.Size = UDim2.new(1, -8, 1, -6)
    TabList.Position = UDim2.new(0, 4, 0, 4)
    TabListLayout.FillDirection = Enum.FillDirection.Horizontal
    TabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TabListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    TabListLayout.Padding = UDim.new(0, 3)
    TabPad.PaddingTop = UDim.new(0, 2)
    TabPad.PaddingLeft = UDim.new(0, 2)
    TabPad.PaddingRight = UDim.new(0, 2)
end

ToggleGUI = function()
    if IsMobile then
        MainFrame.Visible = not MainFrame.Visible
        State.GUIHidden = not MainFrame.Visible
        MinimizedFrame.Visible = false
        ScreenGui.Enabled = true
    else
        ScreenGui.Enabled = not ScreenGui.Enabled
        State.GUIHidden = not ScreenGui.Enabled
        if ScreenGui.Enabled then
            MainFrame.Visible = true
            MinimizedFrame.Visible = false
        end
    end
end

-- Floating M button for mobile (RightShift doesn't exist on phone)
if IsMobile then
    local ToggleGui = Instance.new("ScreenGui")
    ToggleGui.Name = "MineaMobileToggle"
    ToggleGui.ResetOnSpawn = false
    ToggleGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ToggleGui.IgnoreGuiInset = true
    ToggleGui.DisplayOrder = 1000
    Exec.ProtectGui(ToggleGui)
    pcall(function() ToggleGui.Parent = Exec.GetGuiParent() end)
    if not ToggleGui.Parent then
        ToggleGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end

    local MobileToggleBtn = Instance.new("TextButton")
    MobileToggleBtn.Name = "MobileToggle"
    MobileToggleBtn.Size = UDim2.new(0, 54, 0, 54)
    MobileToggleBtn.Position = UDim2.new(1, -64, 0.5, 0)
    MobileToggleBtn.AnchorPoint = Vector2.new(0, 0.5)
    MobileToggleBtn.BackgroundColor3 = Theme.Accent
    MobileToggleBtn.BorderSizePixel = 0
    MobileToggleBtn.Text = "M"
    MobileToggleBtn.TextColor3 = Color3.fromRGB(10, 10, 12)
    MobileToggleBtn.Font = Enum.Font.GothamBlack
    MobileToggleBtn.TextSize = 24
    MobileToggleBtn.ZIndex = 20
    MobileToggleBtn.Parent = ToggleGui
    local mtC = Instance.new("UICorner")
    mtC.CornerRadius = UDim.new(1, 0)
    mtC.Parent = MobileToggleBtn
    local mtS = Instance.new("UIStroke")
    mtS.Color = Theme.Accent
    mtS.Thickness = 2
    mtS.Transparency = 0.3
    mtS.Parent = MobileToggleBtn
    MobileToggleBtn.MouseButton1Click:Connect(function()
        if ToggleGUI then ToggleGUI() end
    end)
end

MinimizedFrame = Instance.new("Frame")
MinimizedFrame.Size = MinimizedSize
MinimizedFrame.Position = MinimizedPosition
MinimizedFrame.BackgroundColor3 = Theme.Bg
MinimizedFrame.BorderSizePixel = 0
MinimizedFrame.Visible = false
MinimizedFrame.Parent = ScreenGui
do
    local miniC = Instance.new("UICorner")
    miniC.CornerRadius = UDim.new(0, 10)
    miniC.Parent = MinimizedFrame
    local miniS = Instance.new("UIStroke")
    miniS.Color = Theme.Accent
    miniS.Thickness = 1
    miniS.Transparency = 0.5
    miniS.Parent = MinimizedFrame
    local MiniLabel = Instance.new("TextLabel")
    MiniLabel.Size = UDim2.new(0.65, 0, 1, 0)
    MiniLabel.Position = UDim2.new(0.08, 0, 0, 0)
    MiniLabel.BackgroundTransparency = 1
    MiniLabel.Text = "⛏ Minea Hub"
    MiniLabel.TextColor3 = Theme.Accent
    MiniLabel.Font = Enum.Font.GothamBold
    MiniLabel.TextSize = 12
    MiniLabel.TextXAlignment = Enum.TextXAlignment.Left
    MiniLabel.Parent = MinimizedFrame
end

ExpandBtn = Instance.new("TextButton")
ExpandBtn.Size = UDim2.new(0, 36, 0, 26)
ExpandBtn.Position = UDim2.new(1, -42, 0.5, -13)
ExpandBtn.BackgroundColor3 = Theme.Accent
ExpandBtn.Text = "□"
ExpandBtn.TextColor3 = Color3.fromRGB(10, 10, 12)
ExpandBtn.Font = Enum.Font.GothamBold
ExpandBtn.TextSize = 14
ExpandBtn.Parent = MinimizedFrame
do
    local expC = Instance.new("UICorner")
    expC.CornerRadius = UDim.new(0, 6)
    expC.Parent = ExpandBtn
end
end

local function SwitchTab(tabName)
    State.TabOpen = tabName
    local info = TabInfo[tabName]
    if info then ContentTitle.Text = info.Title end
    for name, frame in pairs(TabFrames) do
        frame.Visible = (name == tabName)
    end
    for name, btn in pairs(TabButtons) do
        btn.BackgroundTransparency = (name == tabName) and 0 or 0.35
        if TabIndicators[name] then
            TabIndicators[name].Visible = (name == tabName)
        end
    end
end

-- ========== GUI HELPERS ==========
layoutOrder = 0

local function CreateSectionHeader(parent, title)
    layoutOrder = layoutOrder + 1
    local wrap = Instance.new("Frame")
    wrap.Size = UDim2.new(1, 0, 0, 32)
    wrap.BackgroundTransparency = 1
    wrap.LayoutOrder = layoutOrder
    wrap.Parent = parent

    local line = Instance.new("Frame")
    line.Size = UDim2.new(1, 0, 0, 1)
    line.Position = UDim2.new(0, 0, 0, 0)
    line.BackgroundColor3 = Theme.Accent
    line.BackgroundTransparency = 0.35
    line.BorderSizePixel = 0
    line.Parent = wrap

    local keyIcon = Instance.new("TextLabel")
    keyIcon.Size = UDim2.new(0, 18, 0, 18)
    keyIcon.Position = UDim2.new(0, 0, 0, 8)
    keyIcon.BackgroundTransparency = 1
    keyIcon.Text = "🔑"
    keyIcon.TextSize = 12
    keyIcon.Parent = wrap

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -24, 0, 20)
    label.Position = UDim2.new(0, 22, 0, 8)
    label.BackgroundTransparency = 1
    label.Text = title
    label.TextColor3 = Theme.Text
    label.Font = Enum.Font.GothamBold
    label.TextSize = IsMobile and 11 or 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = wrap
    return wrap
end

local function CreateToggle(parent, name, default, callback)
    layoutOrder = layoutOrder + 1
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, IsMobile and 44 or 36)
    frame.BackgroundColor3 = Theme.Panel
    frame.BackgroundTransparency = 0.15
    frame.BorderSizePixel = 0
    frame.LayoutOrder = layoutOrder
    frame.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    local stroke = Instance.new("UIStroke")
    stroke.Color = Theme.Accent
    stroke.Thickness = 1
    stroke.Transparency = 0.85
    stroke.Parent = frame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.Text
    label.Font = Enum.Font.Gotham
    label.TextSize = IsMobile and 11 or 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local check = Instance.new("TextButton")
    check.Size = IsMobile and UDim2.new(0, 32, 0, 32) or UDim2.new(0, 20, 0, 20)
    check.Position = IsMobile and UDim2.new(1, -40, 0.5, -16) or UDim2.new(1, -30, 0.5, -10)
    check.BackgroundColor3 = default and Theme.Accent or Theme.Input
    check.BorderSizePixel = 0
    check.Text = default and "✓" or ""
    check.TextColor3 = Color3.fromRGB(10, 10, 12)
    check.Font = Enum.Font.GothamBold
    check.TextSize = 14
    check.Parent = frame
    local cC = Instance.new("UICorner")
    cC.CornerRadius = UDim.new(0, 4)
    cC.Parent = check

    local toggled = default
    check.MouseButton1Click:Connect(function()
        toggled = not toggled
        check.BackgroundColor3 = toggled and Theme.Accent or Theme.Input
        check.Text = toggled and "✓" or ""
        callback(toggled)
    end)
    return frame, check
end

local function CreateButton(parent, name, _, callback)
    layoutOrder = layoutOrder + 1
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, IsMobile and 44 or 34)
    btn.BackgroundColor3 = Theme.Panel
    btn.BackgroundTransparency = 0.1
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.TextColor3 = Theme.Text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = IsMobile and 11 or 12
    btn.LayoutOrder = layoutOrder
    btn.AutoButtonColor = false
    btn.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    local stroke = Instance.new("UIStroke")
    stroke.Color = Theme.Accent
    stroke.Thickness = 1
    stroke.Transparency = 0.55
    stroke.Parent = btn

    btn.MouseButton1Click:Connect(callback)
    pcall(function()
        btn.MouseEnter:Connect(function()
            btn.BackgroundColor3 = Theme.Input
            stroke.Transparency = 0.2
        end)
        btn.MouseLeave:Connect(function()
            btn.BackgroundColor3 = Theme.Panel
            btn.BackgroundTransparency = 0.1
            stroke.Transparency = 0.55
        end)
    end)
    return btn
end

local function CreateSlider(parent, name, minVal, maxVal, defaultVal, callback)
    layoutOrder = layoutOrder + 1
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, IsMobile and 56 or 48)
    frame.BackgroundColor3 = Theme.Panel
    frame.BackgroundTransparency = 0.15
    frame.BorderSizePixel = 0
    frame.LayoutOrder = layoutOrder
    frame.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 0, 18)
    label.Position = UDim2.new(0, 12, 0, 6)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.SubText
    label.Font = Enum.Font.Gotham
    label.TextSize = IsMobile and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local valLabel = Instance.new("TextLabel")
    valLabel.Size = UDim2.new(0, 50, 0, 18)
    valLabel.Position = UDim2.new(1, -58, 0, 6)
    valLabel.BackgroundTransparency = 1
    valLabel.Text = tostring(defaultVal)
    valLabel.TextColor3 = Theme.Accent
    valLabel.Font = Enum.Font.GothamBold
    valLabel.TextSize = 11
    valLabel.TextXAlignment = Enum.TextXAlignment.Right
    valLabel.Parent = frame

    local sliderFrame = Instance.new("Frame")
    sliderFrame.Size = UDim2.new(1, -24, 0, 8)
    sliderFrame.Position = UDim2.new(0, 12, 0, 30)
    sliderFrame.BackgroundColor3 = Theme.Input
    sliderFrame.BorderSizePixel = 0
    sliderFrame.Parent = frame

    local sCorner = Instance.new("UICorner")
    sCorner.CornerRadius = UDim.new(1, 0)
    sCorner.Parent = sliderFrame

    local range = maxVal - minVal
    local pct = range > 0 and (defaultVal - minVal) / range or 0
    local fillBar = Instance.new("Frame")
    fillBar.Size = UDim2.new(pct, 0, 1, 0)
    fillBar.BackgroundColor3 = Theme.Accent
    fillBar.BorderSizePixel = 0
    fillBar.Parent = sliderFrame
    local fCorner = Instance.new("UICorner")
    fCorner.CornerRadius = UDim.new(1, 0)
    fCorner.Parent = fillBar

    local sliding = false
    local function updateSlider(input)
        local relX = math.clamp((input.Position.X - sliderFrame.AbsolutePosition.X) / sliderFrame.AbsoluteSize.X, 0, 1)
        local val = math.floor(minVal + (maxVal - minVal) * relX)
        fillBar.Size = UDim2.new(relX, 0, 1, 0)
        valLabel.Text = tostring(val)
        callback(val)
    end

    sliderFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            sliding = true
            updateSlider(input)
        end
    end)
    local changedConn = UserInputService.InputChanged:Connect(function(input)
        if sliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateSlider(input)
        end
    end)
    local endedConn = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            sliding = false
        end
    end)
    frame.Destroying:Connect(function()
        changedConn:Disconnect()
        endedConn:Disconnect()
    end)
    return frame
end

local function CreateInput(parent, name, defaultText, callback)
    layoutOrder = layoutOrder + 1
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.BackgroundColor3 = Theme.Panel
    frame.BackgroundTransparency = 0.15
    frame.BorderSizePixel = 0
    frame.LayoutOrder = layoutOrder
    frame.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.38, 0, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.SubText
    label.Font = Enum.Font.Gotham
    label.TextSize = IsMobile and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local input = Instance.new("TextBox")
    input.Size = UDim2.new(0.55, 0, 0, 26)
    input.Position = UDim2.new(0.42, 0, 0.5, -13)
    input.BackgroundColor3 = Theme.Input
    input.BorderSizePixel = 0
    input.Text = defaultText
    input.PlaceholderText = name
    input.TextColor3 = Theme.Text
    input.PlaceholderColor3 = Theme.Muted
    input.Font = Enum.Font.Gotham
    input.TextSize = IsMobile and 10 or 11
    input.ClearTextOnFocus = false
    input.Parent = frame

    local iCorner = Instance.new("UICorner")
    iCorner.CornerRadius = UDim.new(0, 6)
    iCorner.Parent = input

    local iStroke = Instance.new("UIStroke")
    iStroke.Color = Theme.Accent
    iStroke.Thickness = 1
    iStroke.Transparency = 0.75
    iStroke.Parent = input

    input.FocusLost:Connect(function()
        callback(input.Text)
    end)
    return frame, input
end

-- Reset layout order per tab so items sort correctly within each tab
local function ResetLayoutOrder()
    layoutOrder = 0
end

-- ========== BUILD FARM TAB ==========
local function BuildFarmTab()
local farmTab = TabFrames["Farm"]
ResetLayoutOrder()

CreateSectionHeader(farmTab, "📊 STATS")
layoutOrder = layoutOrder + 1
local StatsFrame = Instance.new("Frame")
StatsFrame.Size = UDim2.new(1, 0, 0, 52)
StatsFrame.BackgroundColor3 = Theme.Panel
StatsFrame.BackgroundTransparency = 0.1
StatsFrame.BorderSizePixel = 0
StatsFrame.LayoutOrder = layoutOrder
StatsFrame.Parent = farmTab

do
    local statsCorner = Instance.new("UICorner")
    statsCorner.CornerRadius = UDim.new(0, 8)
    statsCorner.Parent = StatsFrame
    local statsStroke = Instance.new("UIStroke")
    statsStroke.Color = Theme.Accent
    statsStroke.Thickness = 1
    statsStroke.Transparency = 0.8
    statsStroke.Parent = StatsFrame
end

StatsLabel = Instance.new("TextLabel")
StatsLabel.Name = "StatsText"
StatsLabel.Size = UDim2.new(1, -12, 0, 28)
StatsLabel.Position = UDim2.new(0, 10, 0, 4)
StatsLabel.BackgroundTransparency = 1
StatsLabel.Text = "Mined: 0 | Sells: 0 | Target: None"
StatsLabel.TextColor3 = Theme.SubText
StatsLabel.Font = Enum.Font.Gotham
StatsLabel.TextSize = IsMobile and 9 or 10
StatsLabel.TextXAlignment = Enum.TextXAlignment.Left
StatsLabel.TextWrapped = true
StatsLabel.Parent = StatsFrame

CashLabel = Instance.new("TextLabel")
CashLabel.Name = "CashText"
CashLabel.Size = UDim2.new(1, -12, 0, 18)
CashLabel.Position = UDim2.new(0, 10, 0, 30)
CashLabel.BackgroundTransparency = 1
CashLabel.Text = "Cash: 0 | Weight: 0/100"
CashLabel.TextColor3 = Theme.Accent
CashLabel.Font = Enum.Font.GothamBold
CashLabel.TextSize = IsMobile and 9 or 10
CashLabel.TextXAlignment = Enum.TextXAlignment.Left
CashLabel.Parent = StatsFrame

CreateSectionHeader(farmTab, "🔄 SMART LOOP")

CreateToggle(farmTab, "Smart Loop (Farm→Sell→Upgrade)", false, function(val)
    Config.SmartLoop = val
    if val then StartSmartLoop() else StopSmartLoop() end
end)

CreateToggle(farmTab, "Auto Equip Best Pickaxe", false, function(val)
    Config.AutoEquipPickaxe = val
end)

CreateToggle(farmTab, "Rapid Mine (multi-hit)", false, function(val)
    Config.RapidMine = val
end)

CreateSlider(farmTab, "Rapid Mine Hits", 1, 10, 3, function(val)
    Config.RapidMineCount = val
end)

CreateToggle(farmTab, "Auto Collect Drops", false, function(val)
    Config.AutoCollectDrops = val
    if val then StartDropCollectLoop() else State.DropCollectConn = nil end
end)

CreateToggle(farmTab, "Bypass Prompt Hold", true, function(val)
    Config.BypassPromptHold = val
end)

CreateToggle(farmTab, "Tween Teleport", false, function(val)
    Config.TweenTeleport = val
end)

CreateSectionHeader(farmTab, "🎯 ORE FILTER")

CreateToggle(farmTab, "Enable Ore Filter", false, function(val)
    Config.OreFilterEnabled = val
end)

CreateInput(farmTab, "Whitelist Ores", Config.OreFilter, function(text)
    Config.OreFilter = text
end)

CreateInput(farmTab, "Blacklist Ores", Config.OreBlacklist, function(text)
    Config.OreBlacklist = text
end)

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
end

-- ========== BUILD SELL TAB ==========
local function BuildSellTab()
local sellTab = TabFrames["Sell"]
ResetLayoutOrder()

CreateSectionHeader(sellTab, "💰 AUTO SELL")

CreateToggle(sellTab, "Sell When Backpack Full", true, function(val)
    Config.SellWhenFull = val
end)

CreateSlider(sellTab, "Sell Min Cash Threshold", 0, 500000, 0, function(val)
    Config.SellMinCash = val
end)

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

CreateSectionHeader(sellTab, "🛒 AUTO BUY UPGRADES")

CreateToggle(sellTab, "Auto Buy Pickaxe", false, function(val) Config.AutoBuyPickaxe = val end)
CreateToggle(sellTab, "Auto Buy Backpack", false, function(val) Config.AutoBuyBackpack = val end)
CreateToggle(sellTab, "Auto Buy Luck", false, function(val) Config.AutoBuyLuck = val end)
CreateToggle(sellTab, "Auto Buy Warmth", false, function(val) Config.AutoBuyWarmth = val end)

CreateToggle(sellTab, "Auto Rebirth", false, function(val) Config.AutoRebirth = val end)

CreateSlider(sellTab, "Rebirth Cash Threshold", 1000, 1000000, 50000, function(val)
    Config.RebirthCashThreshold = val
end)

CreateToggle(sellTab, "Auto Claim Daily/Code", false, function(val) Config.AutoClaimDaily = val end)

CreateInput(sellTab, "Promo Code", "", function(text) Config.PromoCode = text end)

CreateButton(sellTab, "🎁 Claim Daily Now", Color3.fromRGB(180, 130, 40), function()
    TryAutoClaimDaily()
    AddLog("Claimed daily rewards")
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

local shopListFrame = Instance.new("ScrollingFrame")
ShopList = shopListFrame
ShopList.Name = "ShopList"
ShopList.Size = UDim2.new(1, 0, 0, 90)
ShopList.BackgroundColor3 = Theme.Panel
ShopList.BackgroundTransparency = 0.15
ShopList.BorderSizePixel = 0
ShopList.ScrollBarThickness = 3
ShopList.ScrollBarImageColor3 = Theme.Accent
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
end

-- ========== BUILD ESP TAB ==========
local function BuildESPTab()
local espTab = TabFrames["ESP"]
ResetLayoutOrder()

CreateSectionHeader(espTab, "👁 ESP / VISUALS")

CreateToggle(espTab, "Crystal / Rock ESP", false, function(val)
    Config.ESPEnabled = val
    if val then StartESP() else StopESP() end
end)

CreateToggle(espTab, "Tracers (Rocks/Shops)", false, function(val)
    Config.Tracers = val
    if not val then ClearTracers() end
end)

CreateToggle(espTab, "Player ESP", false, function(val)
    Config.PlayerESP = val
    if not val then ClearPlayerESP() end
end)

CreateToggle(espTab, "Chest / Event ESP", false, function(val)
    Config.ChestESP = val
    if not val then ClearChestESP() end
end)

CreateToggle(espTab, "Fullbright", false, function(val)
    Config.Fullbright = val
    if val then ApplyFullbright() else RestoreFullbright() end
end)

CreateToggle(espTab, "Hide Other Players", false, function(val)
    Config.HideOtherPlayers = val
    ApplyHidePlayers()
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

local rockListFrame = Instance.new("ScrollingFrame")
RockList = rockListFrame
RockList.Name = "RockList"
RockList.Size = UDim2.new(1, 0, 0, 120)
RockList.BackgroundColor3 = Theme.Panel
RockList.BackgroundTransparency = 0.15
RockList.BorderSizePixel = 0
RockList.ScrollBarThickness = 3
RockList.ScrollBarImageColor3 = Theme.Accent
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
end

-- ========== BUILD EXPLOIT TAB ==========
local function BuildExploitTab()
local exploitTab = TabFrames["Exploit"]
ResetLayoutOrder()

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

CreateToggle(exploitTab, "Warmth Keeper", false, function(val)
    Config.WarmthKeeper = val
    if val or Config.StaminaKeeper then StartWarmthKeeper() else StopWarmthKeeper() end
end)

CreateToggle(exploitTab, "Stamina Keeper", false, function(val)
    Config.StaminaKeeper = val
    if val or Config.WarmthKeeper then StartWarmthKeeper() else StopWarmthKeeper() end
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

CreateToggle(exploitTab, "Infinite Jump", false, function(val)
    Config.InfiniteJump = val
    if val then StartInfiniteJump() else StopInfiniteJump() end
end)

CreateToggle(exploitTab, "Click Teleport (Ctrl+Click)", false, function(val)
    Config.ClickTeleport = val
    if val then StartClickTeleport() else StopClickTeleport() end
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

CreateButton(exploitTab, "📦 Drop Dupe Method", Color3.fromRGB(140, 50, 140), function()
    DupeViaDrop()
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
end

-- ========== BUILD TOOLS TAB ==========
local function BuildToolsTab()
local toolsTab = TabFrames["Tools"]
ResetLayoutOrder()

CreateSectionHeader(toolsTab, "📡 REMOTE SPY")

CreateToggle(toolsTab, "Remote Spy (Log FireServer)", false, function(val)
    Config.RemoteSpy = val
    if val then StartRemoteSpy() else StopRemoteSpy() end
end)

layoutOrder = layoutOrder + 1
local spyListFrame = Instance.new("ScrollingFrame")
RemoteSpyList = spyListFrame
RemoteSpyList.Name = "RemoteSpyList"
RemoteSpyList.Size = UDim2.new(1, 0, 0, 100)
RemoteSpyList.BackgroundColor3 = Theme.Panel
RemoteSpyList.BackgroundTransparency = 0.15
RemoteSpyList.BorderSizePixel = 0
RemoteSpyList.ScrollBarThickness = 3
RemoteSpyList.ScrollBarImageColor3 = Theme.Accent
RemoteSpyList.CanvasSize = UDim2.new(0, 0, 0, 0)
RemoteSpyList.AutomaticCanvasSize = Enum.AutomaticSize.Y
RemoteSpyList.LayoutOrder = layoutOrder
RemoteSpyList.Parent = toolsTab

local spyCorner = Instance.new("UICorner")
spyCorner.CornerRadius = UDim.new(0, 6)
spyCorner.Parent = RemoteSpyList

local spyLayout = Instance.new("UIListLayout")
spyLayout.SortOrder = Enum.SortOrder.LayoutOrder
spyLayout.Padding = UDim.new(0, 2)
spyLayout.Parent = RemoteSpyList

local spyPad = Instance.new("UIPadding")
spyPad.PaddingTop = UDim.new(0, 2)
spyPad.PaddingLeft = UDim.new(0, 2)
spyPad.PaddingRight = UDim.new(0, 2)
spyPad.Parent = RemoteSpyList

CreateButton(toolsTab, "🗑 Clear Spy Log", Color3.fromRGB(100, 50, 50), function()
    State.RemoteSpyLogs = {}
    if RemoteSpyList then ClearScrollList(RemoteSpyList) end
end)

CreateSectionHeader(toolsTab, "🎯 CUSTOM REMOTE")

CreateInput(toolsTab, "Remote Name", "", function(text)
    Config.CustomRemoteName = text
end)

CreateInput(toolsTab, "Args (comma separated)", "", function(text)
    Config.CustomRemoteArgs = text
end)

CreateButton(toolsTab, "🚀 Fire Custom Remote", Color3.fromRGB(160, 80, 40), function()
    FireCustomRemote()
end)

CreateSectionHeader(toolsTab, "📍 WAYPOINTS")

CreateButton(toolsTab, "💾 Save: Shop", Color3.fromRGB(50, 100, 160), function()
    SaveWaypoint("Shop")
end)

CreateButton(toolsTab, "💾 Save: Farm Spot", Color3.fromRGB(50, 130, 80), function()
    SaveWaypoint("Farm")
end)

CreateButton(toolsTab, "💾 Save: Spawn", Color3.fromRGB(80, 80, 140), function()
    SaveWaypoint("Spawn")
end)

CreateButton(toolsTab, "📍 TP → Shop", Color3.fromRGB(40, 90, 140), function()
    TeleportToWaypoint("Shop")
end)

CreateButton(toolsTab, "📍 TP → Farm Spot", Color3.fromRGB(40, 120, 70), function()
    TeleportToWaypoint("Farm")
end)

CreateButton(toolsTab, "📍 TP → Spawn", Color3.fromRGB(70, 70, 130), function()
    TeleportToWaypoint("Spawn")
end)
end

-- ========== BUILD MISC TAB ==========
local function BuildMiscTab()
local miscTab = TabFrames["Misc"]
ResetLayoutOrder()

CreateSectionHeader(miscTab, "⚙ SETTINGS")

CreateToggle(miscTab, "Anti-AFK", false, function(val)
    Config.AntiAFK = val
    if val then StartAntiAFK() else StopAntiAFK() end
end)

CreateToggle(miscTab, "Auto Respawn + Reapply", false, function(val)
    Config.AutoRespawn = val
end)

CreateToggle(miscTab, "FPS Booster", false, function(val)
    Config.FPSBooster = val
    if val then ApplyFPSBooster() end
end)

CreateSlider(miscTab, "Server Hop (min, 0=off)", 0, 120, 0, function(val)
    Config.ServerHopInterval = val
    StopServerHopTimer()
    if val > 0 then StartServerHopTimer() end
end)

CreateButton(miscTab, "🌐 Server Hop Now", Color3.fromRGB(60, 100, 160), function()
    DoServerHop()
end)

CreateButton(miscTab, "💾 Save Config", Color3.fromRGB(50, 120, 80), function()
    SaveConfig()
end)

CreateButton(miscTab, "📂 Load Config", Color3.fromRGB(80, 100, 160), function()
    LoadConfig()
end)

CreateButton(miscTab, "🚨 PANIC (Stop All)", Color3.fromRGB(200, 40, 40), function()
    PanicStopAll()
end)

CreateSectionHeader(miscTab, "⌨ KEYBINDS")
layoutOrder = layoutOrder + 1
local keybindInfo = Instance.new("TextLabel")
keybindInfo.Size = UDim2.new(1, 0, 0, IsMobile and 56 or 70)
keybindInfo.BackgroundColor3 = Theme.Panel
keybindInfo.BackgroundTransparency = 0.1
keybindInfo.BorderSizePixel = 0
keybindInfo.Text = IsMobile and "Tap green M button = Toggle GUI | Use toggles in tabs" or "RightShift = Toggle GUI | F = Fly | G = Auto Farm | H = Smart Loop | P = Panic | Ctrl+Click = Click TP"
keybindInfo.TextColor3 = Theme.SubText
keybindInfo.Font = Enum.Font.Gotham
keybindInfo.TextSize = IsMobile and 9 or 10
keybindInfo.TextXAlignment = Enum.TextXAlignment.Left
keybindInfo.TextYAlignment = Enum.TextYAlignment.Top
keybindInfo.TextWrapped = true
keybindInfo.LayoutOrder = layoutOrder
keybindInfo.Parent = miscTab
local kbCorner = Instance.new("UICorner")
kbCorner.CornerRadius = UDim.new(0, 6)
kbCorner.Parent = keybindInfo

CreateSectionHeader(miscTab, "📋 LOG")

local logListFrame = Instance.new("ScrollingFrame")
LogList = logListFrame
LogList.Name = "LogList"
LogList.Size = UDim2.new(1, 0, 0, 100)
LogList.BackgroundColor3 = Theme.Panel
LogList.BackgroundTransparency = 0.15
LogList.BorderSizePixel = 0
LogList.ScrollBarThickness = 3
LogList.ScrollBarImageColor3 = Theme.Accent
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
    SendWebhook({content = "**[Minea Mountain v7]** Webhook test successful! ✅"})
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
infoLabel.BackgroundColor3 = Theme.Panel
infoLabel.BackgroundTransparency = 0.1
infoLabel.Text = "Minea Hub v7 | " .. Exec.Name .. "\nSmart Loop · Remote Spy · ESP+ · Waypoints"
infoLabel.TextColor3 = Theme.SubText
infoLabel.Font = Enum.Font.Gotham
infoLabel.TextSize = IsMobile and 9 or 10
infoLabel.TextWrapped = true
infoLabel.LayoutOrder = layoutOrder
infoLabel.Parent = miscTab

local infoCorner = Instance.new("UICorner")
infoCorner.CornerRadius = UDim.new(0, 6)
infoCorner.Parent = infoLabel
end

local function SetupGUIControls()
    if not MinimizeBtn or not ExpandBtn then return end
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

    local dragging = false
    local dragInput, dragStart, startPos

    local function updateDrag(input)
        local delta = input.Position - dragStart
        local target = State.IsMinimized and MinimizedFrame or MainFrame
        target.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end

    local function setupDrag(frame)
        if not frame then return end
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
    end

    setupDrag(Header)
    setupDrag(MinimizedFrame)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            updateDrag(input)
        end
    end)
end

local _traceback = (debug and debug.traceback) or function(e) return tostring(e) end

local guiOk, guiErr = xpcall(function()
    BuildGUIShell()
    if not TabFrames or not TabFrames.Farm then
        error("GUI shell failed — tab frames missing")
    end
    for tabName, btn in pairs(TabButtons or {}) do
        btn.MouseButton1Click:Connect(function()
            SwitchTab(tabName)
        end)
    end
    local tabBuilders = {
        Farm = BuildFarmTab,
        Sell = BuildSellTab,
        ESP = BuildESPTab,
        Exploit = BuildExploitTab,
        Tools = BuildToolsTab,
        Misc = BuildMiscTab,
    }
    for tabName, buildFn in pairs(tabBuilders) do
        local ok, err = xpcall(buildFn, _traceback)
        if not ok then
            error("Tab " .. tabName .. ": " .. tostring(err))
        end
    end
    SetupGUIControls()
    if ScreenGui then
        ScreenGui.Enabled = true
        if MainFrame then MainFrame.Visible = true end
        State.GUIHidden = false
    end
end, _traceback)
if not guiOk then
    warn("[Minea Hub] GUI error:", guiErr)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "Minea Hub GUI Error",
            Text = tostring(guiErr):sub(1, 200),
            Duration = 12,
        })
    end)
    pcall(function()
        local errGui = Instance.new("ScreenGui")
        errGui.Name = "MineaError"
        errGui.ResetOnSpawn = false
        errGui.DisplayOrder = 9999
        errGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
        local errLabel = Instance.new("TextLabel")
        errLabel.Size = UDim2.new(0, 500, 0, 80)
        errLabel.Position = UDim2.new(0.5, -250, 0, 20)
        errLabel.AnchorPoint = Vector2.new(0, 0)
        errLabel.BackgroundColor3 = Color3.fromRGB(40, 10, 10)
        errLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
        errLabel.Font = Enum.Font.Code
        errLabel.TextSize = 12
        errLabel.TextWrapped = true
        errLabel.Text = "[Minea Hub] GUI Error:\n" .. tostring(guiErr):sub(1, 300)
        errLabel.Parent = errGui
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = errLabel
        task.delay(15, function() errGui:Destroy() end)
    end)
end
end -- GUI scope C

local lastWebhookTime = 0
task.spawn(function()
    while true do
        task.wait(1)
        pcall(UpdateStats)
        if Config.WebhookEnabled and Config.WebhookStats then
            local now = tick()
            if now - lastWebhookTime >= 30 then
                lastWebhookTime = now
                pcall(SendStatsLog)
            end
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
                ClearScrollList(ShopList)
                for i, shop in ipairs(shops) do
                    if i > 15 then break end
                    local btn = Instance.new("TextButton")
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Theme.Input
                    btn.BorderSizePixel = 0
                    btn.Text = shop.Name .. " [" .. math.floor(shop.Distance) .. "m]"
                    btn.TextColor3 = Theme.Text
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = 11
                    btn.LayoutOrder = i
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
                ClearScrollList(RockList)
                for i, rock in ipairs(rocks) do
                    if i > 20 then break end
                    local btn = Instance.new("TextButton")
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Theme.Input
                    btn.BorderSizePixel = 0
                    btn.Text = rock.Name .. " [" .. math.floor(rock.Distance) .. "m]" .. (rock.Value > 0 and (" $" .. rock.Value) or "")
                    btn.TextColor3 = rock.Value > 0 and Theme.Accent or Theme.SubText
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = 11
                    btn.LayoutOrder = i
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

-- ========== KEYBINDS (desktop only — mobile uses M button) ==========
UserInputService.InputBegan:Connect(function(input, processed)
    if processed or IsMobile then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        if ToggleGUI then ToggleGUI() end
    elseif input.KeyCode == Enum.KeyCode.F then
        Config.FlyEnabled = not Config.FlyEnabled
        if Config.FlyEnabled then StartFly() else StopFly() end
        AddLog("Fly: " .. (Config.FlyEnabled and "ON" or "OFF"))
    elseif input.KeyCode == Enum.KeyCode.G then
        Config.AutoFarm = not Config.AutoFarm
        if Config.AutoFarm then StartAutoFarm() else StopAutoFarm() end
        AddLog("Auto Farm: " .. (Config.AutoFarm and "ON" or "OFF"))
    elseif input.KeyCode == Enum.KeyCode.H then
        Config.SmartLoop = not Config.SmartLoop
        if Config.SmartLoop then StartSmartLoop() else StopSmartLoop() end
        AddLog("Smart Loop: " .. (Config.SmartLoop and "ON" or "OFF"))
    elseif input.KeyCode == Enum.KeyCode.P and Config.PanicEnabled then
        PanicStopAll()
        if ScreenGui then ScreenGui.Enabled = false end
        State.GUIHidden = true
    end
end)

-- ========== VISUAL UPDATE LOOP ==========
task.spawn(function()
    while true do
        task.wait(3)
        pcall(function()
            if Config.Tracers then UpdateTracers() end
            if Config.PlayerESP then UpdatePlayerESP() end
            if Config.ChestESP then UpdateChestESP() end
            if Config.HideOtherPlayers then ApplyHidePlayers() end
            if Config.BypassPromptHold then BypassPromptsIn(Workspace) end
        end)
    end
end)

-- ========== HANDLE RESPAWN ==========
LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    HumanoidRootPart = char:WaitForChild("HumanoidRootPart")
    Humanoid = char:WaitForChild("Humanoid")
    AddLog("Character respawned")
    
    task.delay(1, function()
        if Config.SpeedBoost then ApplySpeedBoost() end
        if Config.FlyEnabled then StopFly() StartFly() end
        if Config.InfiniteJump then StopInfiniteJump() StartInfiniteJump() end
        if Config.AutoEquipPickaxe then EquipBestPickaxe() end
        if Config.AutoFarm and not State.FarmConnection then StartAutoFarm() end
        if Config.SmartLoop and not State.SmartLoopConn then StartSmartLoop() end
        if Config.WarmthKeeper or Config.StaminaKeeper then StartWarmthKeeper() end
    end)
end)

LocalPlayer.CharacterRemoving:Connect(function()
    if Config.AutoRespawn then
        task.delay(3, function()
            pcall(function()
                if not LocalPlayer.Character then
                    Exec.LoadCharacter()
                end
            end)
        end)
    end
end)

-- ========== HANDLE SCREEN RESIZE ==========
local resizeCamera = Workspace.CurrentCamera
if resizeCamera then
    resizeCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        local newSize = resizeCamera.ViewportSize
        local isMob = UserInputService.TouchEnabled or newSize.X < 900
        GUIWidth = isMob and UDim2.new(1, -20, 1, -36) or UDim2.new(0, 700, 0, 440)
        if not State.IsMinimized and MainFrame then
            MainFrame.Size = GUIWidth
            MainFrame.AnchorPoint = isMob and Vector2.new(0.5, 0.5) or Vector2.new(0, 0)
            MainFrame.Position = isMob and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0.5, -350, 0.5, -220)
        end
        if TitleLabel then
            TitleLabel.TextSize = isMob and 14 or 17
        end
    end)
end

-- ========== SIMULATION RADIUS (see further) ==========
Exec.SetSimRadius()

-- ========== STARTUP ==========
pcall(function()
    AddLog("Minea Hub v7 loaded on " .. Exec.Name)
    AddLog("Executor APIs: HTTP=" .. tostring(Exec.Request ~= nil) .. " Hook=" .. tostring(Exec.HasHookMeta) .. " Click=" .. tostring(Exec.HasFireClick))
    AddLog(IsMobile and "Tap green M button to toggle GUI" or "RightShift = GUI | Cache remotes first!")
    BypassPromptsIn(Workspace)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "Minea Hub v7",
            Text = IsMobile and "Loaded! Tap the green M button on the right." or "Loaded! Press RightShift to toggle GUI.",
            Duration = 6,
        })
    end)
end)

-- Visible startup flash (fallback if SetCore notifications don't work)
pcall(function()
    local splash = Instance.new("ScreenGui")
    splash.Name = "MineaSplash"
    splash.ResetOnSpawn = false
    splash.DisplayOrder = 10000
    splash.Parent = LocalPlayer:WaitForChild("PlayerGui")
    local splashLabel = Instance.new("TextLabel")
    splashLabel.Size = UDim2.new(0, 220, 0, 40)
    splashLabel.Position = UDim2.new(0.5, 0, 0, 12)
    splashLabel.AnchorPoint = Vector2.new(0.5, 0)
    splashLabel.BackgroundColor3 = Theme.Bg
    splashLabel.TextColor3 = Theme.Accent
    splashLabel.Font = Enum.Font.GothamBold
    splashLabel.TextSize = 14
    splashLabel.Text = "Minea Hub v7 — Loaded"
    splashLabel.Parent = splash
    local sc = Instance.new("UICorner")
    sc.CornerRadius = UDim.new(0, 8)
    sc.Parent = splashLabel
    local ss = Instance.new("UIStroke")
    ss.Color = Theme.Accent
    ss.Thickness = 1
    ss.Transparency = 0.4
    ss.Parent = splashLabel
    task.delay(3, function()
        pcall(function()
            local ts = TweenService:Create(splashLabel, TweenInfo.new(0.5), {BackgroundTransparency = 1, TextTransparency = 1})
            ss.Transparency = 1
            ts:Play()
            ts.Completed:Wait()
            splash:Destroy()
        end)
    end)
end)

-- Initial remote cache
task.delay(3, function()
    pcall(CacheRemotes)
end)

end -- scope B
end -- scope A
