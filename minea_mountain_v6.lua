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

-- Anti-Detection Layer
local _xE = (getgenv ~= nil)
local _xM = _xE and getgenv() or _G
local _xH = (hookmetamethod ~= nil)
local _xN = (newcclosure ~= nil)
local _xR = (getrawmetatable ~= nil)
local _xS = (setreadonly ~= nil)
local _xF = (fireclickdetector ~= nil)
local _xP = (fireproximityprompt ~= nil)
local _xT = (firetouchinterest ~= nil)
local _xV = (sethiddenproperty ~= nil)
local _xI = (setsimulationradius ~= nil)
local _xC = (checkcaller ~= nil)
local _xW = (syn ~= nil and syn.protect_gui ~= nil)

-- String decoder function
local function _xD(s, ...)
    local o = tonumber(s)
    if not o then return s end
    local r = ""
    local a = {...}
    for i = 1, #a do
        r = r .. string.char(tonumber(a[i]) - o)
    end
    return r
end

-- Hook __namecall to block security checks
if _xH and _xN and _xR and _xS then
    local _xO1
    _xO1 = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local _xMt = getnamecallmethod()
        if _xMt == "FindService" then
            local _xA = ...
            if _xA == _xD("47","149","202","205","206","209","158","201","222","210","206","215","218") then return nil end
            if _xA == _xD("43","162","213","206","210","209","158","201","222","210","206","215","218") then return nil end
        end
        if _xMt == "Kick" and self == game:GetService(_xD("54","174","209","222","206","222","158")) then
            return nil
        end
        return _xO1(self, ...)
    end))
    
    local _xO2
    _xO2 = hookmetamethod(game, "__index", newcclosure(function(self, key)
        return _xO2(self, key)
    end))
end

-- Anti-kick via metatable hook
if _xH and _xN then
    local _xK1
    _xK1 = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local _xMm = getnamecallmethod()
        if _xMm == _xD("50","190","206","215","217") and self == game:GetService(_xD("54","174","209","222","206","222","158")) then
            return nil
        end
        return _xK1(self, ...)
    end))
end

-- Simulation radius (see further)
if _xI then
    pcall(function() setsimulationradius(1e9, 1e9) end)
end



-- ========== SERVICES ==========
local Players = game:GetService(_xD("38".118.146.135.159.139.152.153))
local ReplicatedStorage = game:GetService(_xD("38".120.139.150.146.143.137.135.154.139.138.121.154.149.152.135.141.139))
local Workspace = game:GetService(_xD("50".137.161.164.157.165.162.147.149.151))
local RunService = game:GetService(_xD("16".98.133.126.99.117.130.134.121.115.117))
local TweenService = game:GetService(_xD("33".117.152.134.134.143.116.134.147.151.138.132.134))
local UserInputService = game:GetService(_xD("43".128.158.144.157.116.153.155.160.159.126.144.157.161.148.142.144))
local HttpService = game:GetService(_xD("53".125.169.169.165.136.154.167.171.158.152.154))
local StarterGui = game:GetService(_xD("48".131.164.145.162.164.149.162.119.165.153))
local Lighting = game:GetService(_xD("21".97.126.124.125.137.126.131.124))

-- ========== PLAYER ==========
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild(_xD("44".116.161.153.141.154.155.149.144.126.155.155.160.124.141.158.160))
local Humanoid = Character:WaitForChild(_xD("41".113.158.150.138.151.152.146.141))

-- ========== CONFIG ==========
local _rbVUbTc = {
    AutoFarm = false,
    AutoSell = false,
    AutoUpgrade = false,
    ESPEnabled = false,
    AntiDamage = false,
    AntiFreeze = false,
if false then
  local _mI7R4DP = Vector3.new(49,47,9)
end
    UnlimitedBackpack = false,
    UnlimitedLuck = false,
    SpeedBoost = false,
    Noclip = false,
    FlyEnabled = false,
    FarmRadius = (1371-871),
    SellRadius = (1285-985),
    FarmDelay = 0.05,
    SellDelay = 0.3,
    TeleportDelay = 0.03,
    WalkSpeed = (2*25),
    JumpPower = (119-19),
    FlySpeed = (487-427),
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
local _xMl8ItR = {
if false then
  local _ma3nRxD = Instance.new("Part")
  local _qeEzaG4 = Vector3.new(-75,90,48)
end
    FarmConnection = nil,
    SellConnection = nil,
    ESPConnections = {},
    AntiDamageConn = nil,
    NoclipConn = nil,
    FlyConn = nil,
    UpgradeConn = nil,
    IsMinimized = false,
    CurrentTarget = _xD("56".134.167.166.157),
    FarmCount = 0,
    SellCount = 0,
    DupeCount = 0,
    UpgradeCount = 0,
    TotalEarnings = 0,
    Logs = {},
    ESPHighlights = {},
    RemoteCache = {},
    TabOpen = _xD("25".95.122.139.134),
}

-- ========== ENVIRONMENT CHECK ==========
local _mVWc7qg = (getgenv ~= nil)
local _rhhNAUL = _mVWc7qg and getgenv() or _G
local _r9jJEiW = (hookmetamethod ~= nil)
local _zO3K5A7 = (newcclosure ~= nil)
local _mbKl3QF = (getrawmetatable ~= nil)
if false then
  local _m08e4Ri = CFrame.new(371,62,-177)
  local _rMLg14D = (60640-75)
  local _r7vNf6e = (71586-159)
end
local _mR4WM2d = (setreadonly ~= nil)
local _nnJnmyx = (fireclickdetector ~= nil)
local _z6bFhwr = (fireproximityprompt ~= nil)
local _tS8k84k = (firetouchinterest ~= nil)
local _qdzwwO7 = (sethiddenproperty ~= nil)
local _qPkUkI0 = (setsimulationradius ~= nil)
local _t9CtmrE = (getconnections ~= nil)
local _qrOesQS = (syn ~= nil and syn.protect_gui ~= nil)
local _v8N0L7K = (checkcaller ~= nil)

-- ========== ANTI-DETECTION ==========
local _n8ZHZK3 = {}

do
    -- Hook __namecall to intercept security checks
    if _r9jJEiW and _zO3K5A7 and _mbKl3QF and _mR4WM2d then
        local OldNamecall
        OldNamecall = hookmetamethod(game, _xD("26".121.121.136.123.135.127.125.123.134.134), newcclosure(function(self, ...)
            local method = getnamecallmethod()
            local args = {...}
            
            -- Block anti-exploit scripts from detecting us
            if method == _xD("26".96.131.136.126.109.127.140.144.131.125.127) then
                local serviceName = args[1]
                if serviceName == _xD("51".120.171.163.159.162.156.167.134.152.165.169.156.150.152) or serviceName == _xD("33".100.137.134.130.149.116.134.147.151.138.132.134) then
                    return nil
                end
            end
            
            -- Spoof GetScriptBytecode calls (some games check for injected scripts)
            if method == _xD("23".94.124.139.106.122.137.128.135.139.89.144.139.124.122.134.123.124) then
                if _v8N0L7K and checkcaller() then
                    return OldNamecall(self, ...)
                end
            end
            
            -- Prevent kick
            if method == _xD("26".101.131.125.133) and self == LocalPlayer then
                return nil
if false then
  local _mX4Nppy = CFrame.new(196,477,-379)
end
            end
            
            return OldNamecall(self, ...)
        end))
        
        -- Hook __index to spoof WalkSpeed and JumpPower checks
        local OldIndex
        OldIndex = hookmetamethod(game, _xD("29".124.124.134.139.129.130.149), newcclosure(function(self, key)
            if self == Humanoid then
                if key == _xD("36".123.133.144.143.119.148.137.137.136) and _rbVUbTc.SpeedBoost then
                    return 16
                end
                if key == _xD("37".111.154.146.149.117.148.156.138.151) and _rbVUbTc.JumpPower > 50 then
                    return 50
                end
            end
            return OldIndex(self, key)
        end))
        
        -- Hook __newindex to allow setting WalkSpeed/JumpPower without detection
        local OldNewIndex
        OldNewIndex = hookmetamethod(game, _xD("22".117.117.132.123.141.127.132.122.123.142), newcclosure(function(self, key, value)
            if self == Humanoid then
                if key == _xD("20".107.117.128.127.103.132.121.121.120) then
                    if _rbVUbTc.SpeedBoost then
                        return OldNewIndex(self, key, _rbVUbTc.WalkSpeed)
                    end
                end
                if key == _xD("25".99.142.134.137.105.136.144.126.139) then
                    return OldNewIndex(self, key, value)
                end
if false then
  local _vR8TY9i = CFrame.new(93,151,388)
  local _tD1RbeC = CFrame.new(-156,441,-403)
  local _qH233nu = CFrame.new(32,34,-356)
end
            end
            return OldNewIndex(self, key, value)
        end))
    end
    
    -- Anti-kick protection
    if _r9jJEiW and _zO3K5A7 then
        local oldKick
        oldKick = hookmetamethod(game, _xD("60".155.155.170.157.169.161.159.157.168.168), newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if method == _xD("52".127.157.151.159) and self == LocalPlayer then
                return nil
            end
            return oldKick(self, ...)
        end))
    end
end

-- ========== UTILITY FUNCTIONS ==========
local function _xu9yXEE()
    Character = LocalPlayer.Character
    if Character then
        HumanoidRootPart = Character:FindFirstChild(_xD("46".118.163.155.143.156.157.151.146.128.157.157.162.126.143.160.162))
        Humanoid = Character:FindFirstChild(_xD("18".90.135.127.115.128.129.123.118))
    end
    return Character and HumanoidRootPart and Humanoid
end

local function _x9ZzRpQ(part)
    if not _xu9yXEE() then return math.huge end
    return (HumanoidRootPart.Position - part.Position).Magnitude
end

if false then
  local _mj3WrI5 = CFrame.new(-283,366,-200)
end
local function _t4d0mEm(position)
    if not _xu9yXEE() then return false end
    HumanoidRootPart.CFrame = CFrame.new(position + Vector3.new(0, 3, 0))
    task.wait(_rbVUbTc.TeleportDelay)
    return true
end

local function _mxqxwJk(cframe)
    if not _xu9yXEE() then return false end
    HumanoidRootPart.CFrame = cframe + Vector3.new(0, 3, 0)
    task.wait(_rbVUbTc.TeleportDelay)
    return true
end

local function _mF8KVF0(message)
    local timestamp = os.date(_xD("42".79.114.100.79.119.100.79.125))
    table.insert(_xMl8ItR.Logs, 1, "[" .. timestamp .. "] " .. message)
    if #_xMl8ItR.Logs > 50 then
        table.remove(_xMl8ItR.Logs)
    end
    if _rcBYXEa then
        pcall(function()
            _rcBYXEa:ClearAllChildren()
            for i, log in ipairs(_xMl8ItR.Logs) do
                if i > 15 then break end
                local label = Instance.new(_xD("35".119.136.155.151.111.132.133.136.143))
                label.Size = UDim2.new(1, 0, 0, 18)
                label.BackgroundTransparency = 1
                label.Text = log
                label.TextColor3 = Color3.fromRGB(200, 200, 200)
                label.TextXAlignment = Enum.TextXAlignment.Left
if false then
  local _xh8rRyP = Instance.new("Part")
  local _xZEXLXR = CFrame.new(11,190,-342)
  local _mW9Xcpo = Color3.fromRGB(105,96,149)
end
                label.Font = Enum.Font.Gotham
                label.TextSize = (11+0)
                label.Parent = _rcBYXEa
            end
        end)
    end
end

-- ========== REMOTE EVENT CACHE ==========
local function _zATmjxM()
    _xMl8ItR.RemoteCache = {}
    pcall(function()
        for _, remote in ipairs(ReplicatedStorage:GetDescendants()) do
            if remote:IsA(_xD("11".93.112.120.122.127.112.80.129.112.121.127)) or remote:IsA(_xD("38".120.139.147.149.154.139.108.155.148.137.154.143.149.148)) then
                table.insert(_xMl8ItR.RemoteCache, {
                    Instance = remote,
                    Name = remote.Name,
                    Type = remote.ClassName,
                })
            end
        end
    end)
    _mF8KVF0(_xD("58".125.155.157.162.159.158.90) .. #_xMl8ItR.RemoteCache .. _xD("47".79.161.148.156.158.163.148.162))
end

local function _nKrwdQp(namePattern, ...)
    local args = {...}
    for _, remote in ipairs(_xMl8ItR.RemoteCache) do
        local rName = string.lower(remote.Name)
if false then
  local _tdpO3kL = (43626-231)
  local _zr7i4dl = Instance.new("Folder")
end
        local pattern = string.lower(namePattern)
        if string.find(rName, pattern) then
            pcall(function()
                if remote.Type == _xD("22".104.123.131.133.138.123.91.140.123.132.138) then
                    remote.Instance:FireServer(unpack(args))
                elseif remote.Type == _xD("55".137.156.164.166.171.156.125.172.165.154.171.160.166.165) then
                    remote.Instance:InvokeServer(unpack(args))
                end
            end)
        end
    end
end

local function _zbhSyr7(name, ...)
    local args = {...}
    for _, remote in ipairs(_xMl8ItR.RemoteCache) do
        if remote.Name == name then
            pcall(function()
                if remote.Type == _xD("31".113.132.140.142.147.132.100.149.132.141.147) then
                    remote.Instance:FireServer(unpack(args))
                elseif remote.Type == _xD("47".129.148.156.158.163.148.117.164.157.146.163.152.158.157) then
                    remote.Instance:InvokeServer(unpack(args))
                end
            end)
            return true
        end
    end
if false then
  local _xlDIRej = Instance.new("Folder")
end
    return false
end

-- ========== ROCK / CRYSTAL DETECTION ==========
local _tBdySe0 = {
    _xD("19".133.130.118.126), _xD("45".156.159.146), _xD("46".161.162.157.156.147), _xD("60".169.165.170.161.174.157.168), _xD("14".113.128.135.129.130.111.122), _xD("36".139.137.145), _xD("50".149.161.147.158), _xD("43".148.157.154.153),
    _xD("20".123.131.128.120), _xD("60".160.165.157.169.171.170.160), _xD("15".114.126.127.127.116.129), _xD("49".164.154.157.167.150.163), _xD("43".157.160.141.164), _xD("34".135.143.135.148.131.142.134), _xD("47".162.144.159.159.151.152.161.148),
    _xD("20".117.129.121.136.124.141.135.136), _xD("38".148.149.138.139), _xD("25".143.126.130.135), _xD("42".142.143.154.153.157.147.158), _xD("37".135.148.154.145.137.138.151), _xD("25".140.141.122.139.140.122.137.137.129.130.139.126),
    _xD("13".129.124.125.110.135), _xD("34".145.146.131.142), _xD("23".135.124.120.137.131), _xD("37".143.134.137.138), _xD("43".156.160.140.157.159.165), _xD("19".130.117.134.124.119.124.116.129), _xD("37".145.134.149.142.152),
    _xD("30".139.135.146.134.144.135.138), _xD("59".175.164.175.156.169.164.176.168), _xD("41".153.149.138.157.146.151.158.150), _xD("33".145.134.147.138.133.144.149), _xD("32".154.137.146.131.143.142), _xD("28".131.125.142.138.129.144),
    _xD("60".157.173.177.157.169.157.174.165.170.161), _xD("20".119.125.136.134.125.130.121), _xD("19".135.116.129.141.116.129.124.135.120), _xD("13".122.124.124.123.128.129.124.123.114), _xD("48".163.165.158.163.164.159.158.149),
    _xD("33".131.141.144.144.133.148.149.144.143.134), _xD("53".164.163.174.173), _xD("43".159.154.160.157.152.140.151.148.153.144), _xD("22".137.134.127.132.123.130), _xD("60".158.161.174.181.168), _xD("28".127.132.125.136.127.129.128.139.138.149),
}

local function _mfgTit1()
    local rocks = {}
    local function SearchRocks(parent)
        if not parent then return end
        for _, child in ipairs(parent:GetChildren()) do
            local nameLower = string.lower(child.Name)
            if child:IsA(_xD("20".86.117.135.121.100.117.134.136)) or child:IsA(_xD("43".120.154.143.144.151)) then
                local matched = false
                for _, pattern in ipairs(_tBdySe0) do
if false then
  local _xoIyxOS = Instance.new("Model")
  local _zh2gj3h = (72722-37)
  local _xSsKGne = Instance.new("Model")
end
                    if string.find(nameLower, pattern) then
                        matched = true
                        break
                    end
                end
                if matched then
                    local part = child:IsA(_xD("37".103.134.152.138.117.134.151.153)) and child or child:FindFirstChildWhichIsA(_xD("15".81.112.130.116.95.112.129.131))
                    if part then
                        local dist = _x9ZzRpQ(part)
                        if dist <= _rbVUbTc.FarmRadius then
                            -- Try to get value/price
                            local value = 0
                            pcall(function()
                                local val = child:FindFirstChild(_xD("20".106.117.128.137.121)) or child:FindFirstChild(_xD("50".130.164.155.149.151)) or child:FindFirstChild(_xD("10".97.121.124.126.114)) or child:FindFirstChild(_xD("14".100.111.122.131.115.93.132.115.128.128.119.114.115))
                                if val and val:IsA(_xD("50".136.147.158.167.151.116.147.165.151)) then
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
if false then
  local _qDOYfxY = CFrame.new(206,40,115)
  local _znZZu9P = Color3.fromRGB(176,172,64)
end
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
        Workspace:FindFirstChild(_xD("39".121.150.138.146.154)),
        Workspace:FindFirstChild(_xD("16".95.130.117.131)),
        Workspace:FindFirstChild(_xD("52".129.157.162.153.166.149.160.167)),
        Workspace:FindFirstChild(_xD("58".135.163.168.159.173)),
        Workspace:FindFirstChild(_xD("16".98.117.131.127.133.130.115.117.131)),
        Workspace:FindFirstChild(_xD("37".114.134.149)),
        Workspace:FindFirstChild(_xD("43".127.144.157.157.140.148.153)),
        Workspace:FindFirstChild(_xD("40".107.154.161.155.156.137.148.155)),
        Workspace:FindFirstChild(_xD("56".133.167.173.166.172.153.161.166)),
        Workspace,
    }
    
    for _, area in ipairs(searchAreas) do
        if area then
            SearchRocks(area)
        end
    end
    
    -- Sort by priority
    if _rbVUbTc.PriorityHighestValue then
        table.sort(rocks, function(a, b) return a.Value > b.Value end)
    elseif _rbVUbTc.PriorityClosest then
if false then
  local _z3Oxhq8 = Instance.new("Model")
  local _rfUg3Kj = Vector3.new(-42,14,-62)
end
        table.sort(rocks, function(a, b) return a.Distance < b.Distance end)
    end
    
    return rocks
end

-- ========== SHOP DETECTION ==========
local function _nkKO7xw()
    local shops = {}
    local function SearchShops(parent)
        if not parent then return end
        for _, child in ipairs(parent:GetChildren()) do
            local nameLower = string.lower(child.Name)
            if child:IsA(_xD("57".134.168.157.158.165)) or child:IsA(_xD("38".104.135.153.139.118.135.152.154)) then
                if string.find(nameLower, _xD("45".160.149.156.157)) or string.find(nameLower, _xD("12".127.113.120.120)) or
                   string.find(nameLower, _xD("50".165.166.161.164.151)) or string.find(nameLower, _xD("13".122.114.127.112.117.110.123.129)) or
                   string.find(nameLower, _xD("60".176.174.157.160.161.174)) or string.find(nameLower, _xD("20".120.121.117.128.121.134)) or
                   string.find(nameLower, _xD("27".136.124.141.134.128.143)) or string.find(nameLower, _xD("39".157.140.149.139.150.153)) or
                   string.find(nameLower, _xD("49".148.146.164.153.154.150.163)) or string.find(nameLower, _xD("35".133.152.156.136.149)) or
                   string.find(nameLower, _xD("41".151.153.140)) or string.find(nameLower, _xD("31".130.128.146.135)) or
                   string.find(nameLower, _xD("44".148.155.153.145)) or string.find(nameLower, _xD("56".154.153.171.157)) or
                   string.find(nameLower, _xD("36".135.133.145.148)) then
if false then
  local _nWfY5ak = CFrame.new(188,458,58)
  local _rxpQhOJ = (5*7915)
  local _mr4yGlp = Instance.new("Folder")
end
                    local part = child:IsA(_xD("54".120.151.169.155.134.151.168.170)) and child or child:FindFirstChildWhichIsA(_xD("41".107.138.156.142.121.138.155.157)) or child:FindFirstChild(_xD("39".111.156.148.136.149.150.144.139.121.150.150.155.119.136.153.155))
                    if part then
                        local dist = _x9ZzRpQ(part)
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
if false then
  local _ncLQcqb = Color3.fromRGB(109,22,55)
end
    return shops
end

-- ========== MINE ROCK ==========
local function _mawovYY(rockData)
    local rock = rockData.Instance
    local part = rockData.Part
    
    if not rock or not rock.Parent then return false end
    
    _mF8KVF0(_xD("56".133.161.166.161.166.159.114.88) .. rockData.Name)
    
    -- Teleport to rock
    _t4d0mEm(part.Position)
    task.wait(0.05)
    
    -- Method 1: Fire click detector
    if _nnJnmyx then
        local clickDetector = rock:FindFirstChildOfClass(_xD("11".78.119.116.110.118.79.112.127.112.110.127.122.125)) or part:FindFirstChildOfClass(_xD("44".111.152.149.143.151.112.145.160.145.143.160.155.158))
        if clickDetector then
            fireclickdetector(clickDetector)
        end
    end
    
    -- Method 2: Fire proximity prompt
    if _z6bFhwr then
        local prompt = rock:FindFirstChildOfClass(_xD("40".120.154.151.160.145.149.145.156.161.120.154.151.149.152.156)) or part:FindFirstChildOfClass(_xD("51".131.165.162.171.156.160.156.167.172.131.165.162.160.163.167))
        if prompt then
            fireproximityprompt(prompt)
        end
    end
    
    -- Method 3: Fire touch interest
    if _tS8k84k then
if false then
  local _xqLgd5R = Instance.new("Folder")
  local _vzAZWi3 = (9298-682)
  local _qoim07q = Instance.new("Part")
end
        firetouchinterest(HumanoidRootPart, part, 0)
        task.wait(0.01)
        firetouchinterest(HumanoidRootPart, part, 1)
    end
    
    -- Method 4: Use tool if equipped
    local tool = Character and Character:FindFirstChildOfClass(_xD("19".103.130.130.127))
    if tool then
        tool:Activate()
    end
    
    -- Method 5: Fire remote events for mining
    _nKrwdQp(_xD("37".146.142.147.138))
    _nKrwdQp(_xD("18".122.115.132.136.119.133.134))
    _nKrwdQp(_xD("33".132.144.141.141.134.132.149))
    _nKrwdQp(_xD("58".156.172.159.155.165))
    _nKrwdQp(_xD("47".150.144.163.151.148.161))
    _nKrwdQp(_xD("32".132.137.135))
    _nKrwdQp(_xD("15".127.120.114.122))
    _nKrwdQp(_xD("60".175.179.165.170.163))
    
    -- Method 6: Direct remote with rock as argument
    for _, remote in ipairs(_xMl8ItR.RemoteCache) do
        local rName = string.lower(remote.Name)
        if string.find(rName, _xD("55".164.160.165.156)) or string.find(rName, _xD("60".160.165.163)) or string.find(rName, _xD("37".141.134.151.155.138.152.153)) then
            pcall(function()
                if remote.Type == _xD("31".113.132.140.142.147.132.100.149.132.141.147) then
if false then
  local _tOrkS7d = Vector3.new(86,20,67)
  local _vRqbH0k = CFrame.new(56,436,-68)
end
                    remote.Instance:FireServer(rock, part)
                elseif remote.Type == _xD("18".100.119.127.129.134.119.88.135.128.117.134.123.129.128) then
                    remote.Instance:InvokeServer(rock, part)
                end
            end)
        end
    end
    
    _xMl8ItR.FarmCount = _xMl8ItR.FarmCount + 1
    
    return true
end

-- ========== SELL ITEMS ==========
local function _qE7C9eY(shopData)
    if not shopData then return false end
    
    local shop = shopData.Instance
    local part = shopData.Part
    
    _mF8KVF0(_xD("55".138.156.163.163.160.165.158.87.152.171.113.87) .. shopData.Name)
    
    -- Teleport to shop
    _t4d0mEm(part.Position)
    task.wait(0.1)
    
    -- Method 1: Click detector
    if _nnJnmyx then
        local clickDetector = shop:FindFirstChildOfClass(_xD("37".104.145.142.136.144.105.138.153.138.136.153.148.151)) or part:FindFirstChildOfClass(_xD("59".126.167.164.158.166.127.160.175.160.158.175.170.173))
        if clickDetector then
            fireclickdetector(clickDetector)
if false then
  local _mW3yuf4 = Instance.new("Folder")
  local _t8uMek0 = Instance.new("Part")
end
        end
    end
    
    -- Method 2: Proximity prompt
    if _z6bFhwr then
        local prompt = shop:FindFirstChildOfClass(_xD("38".118.152.149.158.143.147.143.154.159.118.152.149.147.150.154)) or part:FindFirstChildOfClass(_xD("48".128.162.159.168.153.157.153.164.169.128.162.159.157.160.164))
        if prompt then
            fireproximityprompt(prompt)
        end
    end
    
    -- Method 3: Touch interest
    if _tS8k84k then
        firetouchinterest(HumanoidRootPart, part, 0)
        task.wait(0.01)
        firetouchinterest(HumanoidRootPart, part, 1)
    end
    
    -- Method 4: Fire sell remotes
    _nKrwdQp(_xD("31".146.132.139.139))
    _nKrwdQp(_xD("49".164.153.160.161))
    _nKrwdQp(_xD("25".134.122.139.132.126.141))
    _nKrwdQp(_xD("37".153.151.134.137.138))
    _nKrwdQp(_xD("26".125.123.141.130))
    _nKrwdQp(_xD("33".142.144.143.134.154))
    _nKrwdQp(_xD("17".132.118.125.125.114.125.125))
    _nKrwdQp(_xD("36".151.137.144.144.131.133.144.144))
    
    _xMl8ItR.SellCount = _xMl8ItR.SellCount + 1
    
    return true
end

-- ========== AUTO FARM ==========
if false then
  local _zZnZBAy = CFrame.new(-356,39,485)
end
local function _rTZbSSM()
    if _xMl8ItR.FarmConnection then return end
    _mF8KVF0(_xD("32".97.149.148.143.64.102.129.146.141.64.115.116.97.114.116.101.100))
    
    _xMl8ItR.FarmConnection = RunService.Heartbeat:Connect(function()
        if not _rbVUbTc.AutoFarm then return end
        if not _xu9yXEE() then return end
        
        local rocks = _mfgTit1()
        if #rocks > 0 then
            local target = rocks[1]
            _xMl8ItR.CurrentTarget = target.Name
            _mawovYY(target)
            task.wait(_rbVUbTc.FarmDelay)
        else
            _xMl8ItR.CurrentTarget = _xD("45".128.146.142.159.144.149.150.155.148.91.91.91)
        end
    end)
end

local function _noNtzo1()
if false then
  local _zec3lbj = Instance.new("Folder")
end
    if _xMl8ItR.FarmConnection then
        _xMl8ItR.FarmConnection:Disconnect()
        _xMl8ItR.FarmConnection = nil
    end
    _xMl8ItR.CurrentTarget = _xD("57".135.168.167.158)
    _mF8KVF0(_xD("27".92.144.143.138.59.97.124.141.136.59.110.111.106.107.107.96.95))
end

-- ========== AUTO SELL ==========
local function _qtNcC2c()
    if _xMl8ItR.SellConnection then return end
    _mF8KVF0(_xD("58".123.175.174.169.90.141.159.166.166.90.141.142.123.140.142.127.126))
    
    _xMl8ItR.SellConnection = RunService.Heartbeat:Connect(function()
        if not _rbVUbTc.AutoSell then return end
        if not _xu9yXEE() then return end
        
        local shops = _nkKO7xw()
        if #shops > 0 then
            _qE7C9eY(shops[1])
            task.wait(_rbVUbTc.SellDelay)
        end
    end)
end

local function _xGt6SGx()
    if _xMl8ItR.SellConnection then
        _xMl8ItR.SellConnection:Disconnect()
        _xMl8ItR.SellConnection = nil
    end
if false then
  local _zIn6yOT = Vector3.new(97,84,43)
end
    _mF8KVF0(_xD("55".120.172.171.166.87.138.156.163.163.87.138.139.134.135.135.124.123))
end

-- ========== AUTO UPGRADE ==========
local function _xwOdYRt()
    if _xMl8ItR.UpgradeConn then return end
    _mF8KVF0(_xD("38".103.155.154.149.70.123.150.141.152.135.138.139.70.121.122.103.120.122.107.106))
    
    _xMl8ItR.UpgradeConn = RunService.Heartbeat:Connect(function()
        if not _rbVUbTc.AutoUpgrade then return end
        
        -- Fire upgrade remotes
        _nKrwdQp(_xD("15".132.127.118.129.112.115.116))
        _nKrwdQp(_xD("39".137.156.160))
        _nKrwdQp(_xD("50".162.167.164.149.154.147.165.151))
        _nKrwdQp(_xD("46".165.143.160.155.162.150))
        _nKrwdQp(_xD("59".171.164.158.166.156.179.160))
        _nKrwdQp(_xD("18".116.115.117.125.130.115.117.125))
        _nKrwdQp(_xD("18".133.130.119.119.118))
        _nKrwdQp(_xD("15".115.120.118))
        
        _xMl8ItR.UpgradeCount = _xMl8ItR.UpgradeCount + 1
        task.wait(1)
    end)
end

local function _nbsvfGr()
    if _xMl8ItR.UpgradeConn then
if false then
  local _nHjtaeo = Vector3.new(6,59,8)
  local _r26S9xg = Vector3.new(19,82,-86)
  local _nigPk8F = Instance.new("Folder")
end
        _xMl8ItR.UpgradeConn:Disconnect()
        _xMl8ItR.UpgradeConn = nil
    end
    _mF8KVF0(_xD("12".77.129.128.123.44.97.124.115.126.109.112.113.44.95.96.91.92.92.81.80))
end

-- ========== ESP ==========
local function _roLfT6l()
    for _, highlight in ipairs(_xMl8ItR.ESPHighlights) do
        pcall(function() highlight:Destroy() end)
    end
    _xMl8ItR.ESPHighlights = {}
end

local function _xKtSokD()
    _roLfT6l()
    
    local rocks = _mfgTit1()
    for _, rock in ipairs(rocks) do
        if rock.Instance and rock.Instance.Parent then
            -- Highlight
            local highlight = Instance.new(_xD("17".89.122.120.121.125.122.120.121.133))
            highlight.Name = _xD("49".118.132.129.144) .. rock.Name
            highlight.FillTransparency = 0.6
            highlight.OutlineTransparency = 0
            highlight.OutlineColor = rock.Value > 0 and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(100, 200, 255)
            highlight.FillColor = rock.Value > 0 and Color3.fromRGB(255, 200, 50) or Color3.fromRGB(80, 150, 255)
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = rock.Instance
            
            -- Billboard label with price
            local billboard = Instance.new(_xD("15".81.120.123.123.113.126.112.129.115.86.132.120))
            billboard.Name = _xD("15".84.98.95.91.112.113.116.123)
            billboard.Size = UDim2.new(0, 120, 0, 30)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = rock.Part
if false then
  local _qzH6393 = Instance.new("Model")
  local _q8WQnqN = Instance.new("Folder")
end
            
            local label = Instance.new(_xD("60".144.161.180.176.136.157.158.161.168))
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 0.4
            label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            label.Text = rock.Name .. (rock.Value > 0 and (_xD("21".53.145.53.57) .. tostring(rock.Value)) or "")
            label.TextColor3 = rock.Value > 0 and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(100, 200, 255)
            label.Font = Enum.Font.GothamBold
            label.TextSize = (11+0)
            label.Parent = billboard
            
            local corner = Instance.new(_xD("15".100.88.82.126.129.125.116.129))
            corner.CornerRadius = UDim.new(0, 4)
            corner.Parent = label
            
            table.insert(_xMl8ItR.ESPHighlights, highlight)
            table.insert(_xMl8ItR.ESPHighlights, billboard)
        end
    end
    
    -- Shop ESP
    local shops = _nkKO7xw()
    for _, shop in ipairs(shops) do
        if shop.Instance and shop.Instance.Parent then
            local highlight = Instance.new(_xD("14".86.119.117.118.122.119.117.118.130))
            highlight.Name = _xD("31".100.114.111.126.114.135.142.143.126) .. shop.Name
if false then
  local _ndl1THB = (281+1248)
end
            highlight.FillTransparency = 0.5
            highlight.OutlineTransparency = 0
            highlight.OutlineColor = Color3.fromRGB(0, 255, 100)
            highlight.FillColor = Color3.fromRGB(50, 255, 100)
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = shop.Instance
            
            local billboard = Instance.new(_xD("55".121.160.163.163.153.166.152.169.155.126.172.160))
            billboard.Name = _xD("57".126.140.137.140.161.168.169.133.154.155.158.165)
            billboard.Size = UDim2.new(0, 100, 0, 25)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = shop.Part
            
            local label = Instance.new(_xD("31".115.132.151.147.107.128.129.132.139))
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 0.4
            label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            label.Text = _xD("55".138.127.134.135.113.87) .. shop.Name
            label.TextColor3 = Color3.fromRGB(0, 255, 100)
            label.Font = Enum.Font.GothamBold
            label.TextSize = (517-507)
            label.Parent = billboard
            
            table.insert(_xMl8ItR.ESPHighlights, highlight)
            table.insert(_xMl8ItR.ESPHighlights, billboard)
        end
    end
    
    _mF8KVF0(_xD("56".125.139.136.114.88) .. #rocks .. _xD("36".68.150.147.135.143.151.80.68) .. #shops .. _xD("56".88.171.160.167.168.171))
end
if false then
  local _ntTUBvt = (308965//5)
end

local function _nPx0gJZ()
    if _rbVUbTc.ESPEnabled then
        _xKtSokD()
        -- Refresh ESP periodically
        task.spawn(function()
            while _rbVUbTc.ESPEnabled do
                task.wait(5)
                if _rbVUbTc.ESPEnabled then
                    _xKtSokD()
                end
            end
        end)
    end
end

local function _vpBH74r()
    _roLfT6l()
end

-- ========== ANTI DAMAGE / ANTI FREEZE ==========
local function _xmxMC4G()
    if _xMl8ItR.AntiDamageConn then return end
    _mF8KVF0(_xD("10".75.120.126.115.42.78.107.119.107.113.111.42.79.88.75.76.86.79.78))
    
    _xMl8ItR.AntiDamageConn = RunService.Heartbeat:Connect(function()
        if not _xu9yXEE() then return end
if false then
  local _qtouTb9 = CFrame.new(-76,404,-328)
  local _z83wKot = Color3.fromRGB(126,209,100)
  local _n1SEpTd = Vector3.new(40,25,73)
end
        
        -- Reset health
        if Humanoid and Humanoid.Health < Humanoid.MaxHealth then
            Humanoid.Health = Humanoid.MaxHealth
        end
        
        -- Anti-freeze: Reset warmth-related values
        if _rbVUbTc.AntiFreeze then
            pcall(function()
                -- Try to find warmth attribute or value
                local warmthVal = Character:FindFirstChild(_xD("18".105.115.132.127.134.122)) or Character:FindFirstChild(_xD("16".100.117.125.128.117.130.113.132.133.130.117)) or Character:FindFirstChild(_xD("18".85.129.126.118))
                if warmthVal and warmthVal:IsA(_xD("36".122.133.144.153.137.102.133.151.137)) then
                    warmthVal.Value = (200//2)
                end
                
                -- Check for freeze/debuff attributes
                local freezeVal = Character:FindFirstChild(_xD("49".119.163.160.171.150.159)) or Character:FindFirstChild(_xD("43".116.158.113.157.154.165.144.153)) or Character:FindFirstChild(_xD("31".101.145.132.132.153.136.141.134))
                if freezeVal and freezeVal:IsA(_xD("28".94.139.139.136.114.125.136.145.129)) then
                    freezeVal.Value = false
                end
                
                -- Fire anti-freeze remotes
                _nKrwdQp(_xD("43".162.140.157.152.159.147))
                _nKrwdQp(_xD("19".136.129.121.133.120.120.141.120))
                _nKrwdQp(_xD("53".157.154.150.169))
            end)
        end
    end)
end

local function _q59hFPv()
    if _xMl8ItR.AntiDamageConn then
        _xMl8ItR.AntiDamageConn:Disconnect()
        _xMl8ItR.AntiDamageConn = nil
if false then
  local _xXer9em = (2*40217)
  local _rtUrrrQ = CFrame.new(156,50,488)
  local _zhZf8U5 = CFrame.new(-78,437,-161)
end
    end
    _mF8KVF0(_xD("26".91.136.142.131.58.94.123.135.123.129.127.58.94.99.109.91.92.102.95.94))
end

-- ========== UNLIMITED BACKPACK ==========
local function _tJnrO57()
    if not _rbVUbTc.UnlimitedBackpack then return end
    _mF8KVF0(_xD("19".84.131.131.127.140.124.129.122.51.104.129.127.124.128.124.135.120.119.51.85.116.118.126.131.116.118.126.65.65.65))
    
    pcall(function()
        -- Method 1: Modify backpack capacity values
        local backpackStats = LocalPlayer:FindFirstChild(_xD("30".96.127.129.137.142.127.129.137.97.127.142.127.129.135.146.151)) or LocalPlayer:FindFirstChild(_xD("32".109.129.152.99.129.146.146.153)) or LocalPlayer:FindFirstChild(_xD("26".93.123.140.140.147.101.97))
        if backpackStats and backpackStats:IsA(_xD("39".125.136.147.156.140.105.136.154.140)) then
            backpackStats.Value = (850721+149278)
        end
        
        -- Method 2: Find in leaderstats
        local leaderstats = LocalPlayer:FindFirstChild(_xD("26".134.127.123.126.127.140.141.142.123.142.141))
        if leaderstats then
            for _, stat in ipairs(leaderstats:GetChildren()) do
                local nameLower = string.lower(stat.Name)
                if string.find(nameLower, _xD("54".152.151.153.161.166.151.153.161)) or string.find(nameLower, _xD("41".140.138.155.155.162)) or string.find(nameLower, _xD("32".131.129.144.129.131.137.148.153)) or string.find(nameLower, _xD("58".177.159.163.161.162.174)) or string.find(nameLower, "kg") then
                    if stat:IsA(_xD("49".135.146.157.166.150.115.146.164.150)) then
                        stat.Value = (1000138-139)
if false then
  local _mJPTjjL = Color3.fromRGB(224,249,42)
  local _z80kvQz = (14698-938)
  local _meyPOhT = (50590-90)
end
                    end
                end
            end
        end
        
        -- Method 3: Fire remotes
        _nKrwdQp(_xD("14".112.111.113.121.126.111.113.121))
        _nKrwdQp(_xD("25".124.122.137.122.124.130.141.146))
        _nKrwdQp(_xD("15".114.112.129.129.136))
        _nKrwdQp(_xD("43".160.155.146.157.140.143.144.138.141.140.142.150.155.140.142.150))
    end)
    
    -- Keep applying
    task.spawn(function()
        while _rbVUbTc.UnlimitedBackpack do
            task.wait(2)
            pcall(function()
                local leaderstats = LocalPlayer:FindFirstChild(_xD("59".167.160.156.159.160.173.174.175.156.175.174))
                if leaderstats then
                    for _, stat in ipairs(leaderstats:GetChildren()) do
                        local nameLower = string.lower(stat.Name)
                        if string.find(nameLower, _xD("43".141.140.142.150.155.140.142.150)) or string.find(nameLower, _xD("34".133.131.148.148.155)) or string.find(nameLower, _xD("45".144.142.157.142.144.150.161.166)) or string.find(nameLower, _xD("43".162.144.148.146.147.159)) or string.find(nameLower, "kg") then
                            if stat:IsA(_xD("60".146.157.168.177.161.126.157.175.161)) then
                                stat.Value = (1000087-88)
                            end
                        end
                    end
                end
            end)
        end
    end)
end

-- ========== UNLIMITED LUCK ==========
local function _n6KptIF()
if false then
  local _rHYY24l = CFrame.new(-67,109,-319)
  local _tHQYHms = Instance.new("Folder")
  local _tDthwTZ = Color3.fromRGB(24,196,202)
end
    if not _rbVUbTc.UnlimitedLuck then return end
    _mF8KVF0(_xD("49".114.161.161.157.170.154.159.152.81.134.159.157.154.158.154.165.150.149.81.125.166.148.156.95.95.95))
    
    pcall(function()
        -- Method 1: Modify luck values
        local luckVal = LocalPlayer:FindFirstChild(_xD("49".125.166.148.156)) or LocalPlayer:FindFirstChild(_xD("49".117.154.152.125.166.148.156)) or LocalPlayer:FindFirstChild(_xD("22".99.127.132.127.132.125.98.139.121.129))
        if luckVal and luckVal:IsA(_xD("29".115.126.137.146.130.95.126.144.130)) then
            luckVal.Value = (686665+313334)
        end
        
        -- Method 2: Find in leaderstats
        local leaderstats = LocalPlayer:FindFirstChild(_xD("18".126.119.115.118.119.132.133.134.115.134.133))
        if leaderstats then
            for _, stat in ipairs(leaderstats:GetChildren()) do
                local nameLower = string.lower(stat.Name)
                if string.find(nameLower, _xD("57".165.174.156.164)) then
                    if stat:IsA(_xD("56".142.153.164.173.157.122.153.171.157)) then
                        stat.Value = (1000034-35)
                    end
                end
            end
        end
        
        -- Method 3: Fire luck remotes
        _nKrwdQp(_xD("22".130.139.121.129))
if false then
  local _vpBRNdk = Instance.new("Part")
  local _r2D7roJ = CFrame.new(-226,306,-397)
  local _tq4lyxp = (13262+57387)
end
        _nKrwdQp(_xD("52".160.169.151.159.173))
        _nKrwdQp(_xD("11".111.116.114.106.119.128.110.118))
    end)
    
    -- Keep applying
    task.spawn(function()
        while _rbVUbTc.UnlimitedLuck do
            task.wait(2)
            pcall(function()
                local leaderstats = LocalPlayer:FindFirstChild(_xD("34".142.135.131.134.135.148.149.150.131.150.149))
                if leaderstats then
                    for _, stat in ipairs(leaderstats:GetChildren()) do
                        if string.find(string.lower(stat.Name), _xD("44".152.161.143.151)) and stat:IsA(_xD("24".110.121.132.141.125.90.121.139.125)) then
                            stat.Value = (3*333333)
                        end
                    end
                end
            end)
        end
    end)
end

-- ========== ITEM DUPE ==========
local function _rrXUXKe(amount)
    _mF8KVF0(_xD("49".114.165.165.150.158.161.165.154.159.152.81.165.160.81.149.166.161.150.81) .. amount .. _xD("59".91.164.175.160.168.174.105.105.105))
    
    pcall(function()
        -- Method 1: Fire collect remotes multiple times
        for i = 1, amount do
            _nKrwdQp(_xD("59".158.170.167.167.160.158.175))
            _nKrwdQp(_xD("53".162.158.163.154))
if false then
  local _xXHeMHU = (50300+34852)
  local _rTp5ssz = Color3.fromRGB(23,209,127)
end
            _nKrwdQp(_xD("18".122.115.132.136.119.133.134))
            _nKrwdQp(_xD("25".137.130.124.132.142.137))
            _nKrwdQp(_xD("22".125.119.138.126.123.136))
            _nKrwdQp(_xD("45".153.156.156.161))
            _nKrwdQp(_xD("39".150.137.155.136.144.149))
            _nKrwdQp(_xD("29".132.143.126.139.145))
            _nKrwdQp(_xD("36".150.137.155.133.150.136))
            task.wait(0.05)
        end
        
        -- Method 2: Direct inventory manipulation
        local leaderstats = LocalPlayer:FindFirstChild(_xD("18".126.119.115.118.119.132.133.134.115.134.133))
        if leaderstats then
            for _, stat in ipairs(leaderstats:GetChildren()) do
                local nameLower = string.lower(stat.Name)
                if string.find(nameLower, _xD("44".143.158.165.159.160.141.152)) or string.find(nameLower, _xD("24".135.138.125)) or string.find(nameLower, _xD("29".132.130.138)) or string.find(nameLower, _xD("55".160.171.156.164)) then
                    if stat:IsA(_xD("46".124.163.155.144.147.160.132.143.154.163.147)) or stat:IsA(_xD("49".122.159.165.135.146.157.166.150)) then
                        stat.Value = stat.Value * amount
                    end
                end
            end
        end
if false then
  local _vYf51NU = (2*3740)
  local _nOzFDCT = Instance.new("Folder")
  local _rO2IMas = CFrame.new(163,369,1)
end
        
        -- Method 3: Re-fire sell remote then collect remote (sell-buy loop)
        for i = 1, amount do
            _nKrwdQp(_xD("17".132.118.125.125))
            task.wait(0.02)
            _nKrwdQp(_xD("56".154.173.177))
            task.wait(0.02)
        end
        
        -- Method 4: Fire with specific item arguments
        local rocks = _mfgTit1()
        if #rocks > 0 then
            local bestRock = rocks[1]
            for i = 1, amount do
                for _, remote in ipairs(_xMl8ItR.RemoteCache) do
                    local rName = string.lower(remote.Name)
                    if string.find(rName, _xD("57".156.168.165.165.158.156.173)) or string.find(rName, _xD("51".163.156.150.158.168.163)) or string.find(rName, _xD("17".125.128.128.133)) then
                        pcall(function()
                            if remote.Type == _xD("17".99.118.126.128.133.118.86.135.118.127.133) then
                                remote.Instance:FireServer(bestRock.Instance, bestRock.Part)
                            end
                        end)
                    end
if false then
  local _q2YmY0V = Instance.new("Folder")
  local _tkLg7b5 = Color3.fromRGB(64,251,242)
end
                end
                task.wait(0.05)
            end
        end
    end)
    
    _xMl8ItR.DupeCount = _xMl8ItR.DupeCount + amount
    _mF8KVF0(_xD("53".121.170.165.154.85.150.169.169.154.162.165.169.85.152.164.162.165.161.154.169.154.111.85) .. amount .. "x")
end

-- ========== NOCLIP ==========
local function _nsZVFK0()
    if _xMl8ItR.NoclipConn then return end
    _mF8KVF0(_xD("11".89.122.110.119.116.123.43.80.89.76.77.87.80.79))
    
    _xMl8ItR.NoclipConn = RunService.Stepped:Connect(function()
        if not _rbVUbTc.Noclip then return end
        if not _xu9yXEE() then return end
        for _, part in ipairs(Character:GetDescendants()) do
            if part:IsA(_xD("31".97.128.146.132.111.128.145.147)) then
                part.CanCollide = false
            end
        end
    end)
end

local function _zU1WL32()
    if _xMl8ItR.NoclipConn then
        _xMl8ItR.NoclipConn:Disconnect()
        _xMl8ItR.NoclipConn = nil
    end
    _mF8KVF0(_xD("53".131.164.152.161.158.165.85.121.126.136.118.119.129.122.121))
if false then
  local _qpqvtT3 = Color3.fromRGB(71,14,190)
end
end

-- ========== FLY ==========
local _vwQJGvj = nil
local _nnlLESR = nil

local function _tVjV1V3()
    if _xMl8ItR.FlyConn then return end
    if not _xu9yXEE() then return end
    _mF8KVF0(_xD("27".97.135.148.59.96.105.92.93.103.96.95))
    
    -- Create fly body
    _vwQJGvj = Instance.new(_xD("54".120.165.154.175.140.155.162.165.153.159.170.175))
    _vwQJGvj.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    _vwQJGvj.Velocity = Vector3.new(0, 0, 0)
    _vwQJGvj.Parent = HumanoidRootPart
    
    _nnlLESR = Instance.new(_xD("31".97.142.131.152.102.152.145.142))
    _nnlLESR.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    _nnlLESR.P = 9e4
    _nnlLESR.Parent = HumanoidRootPart
    
    _xMl8ItR.FlyConn = RunService.RenderStepped:Connect(function()
if false then
  local _qJVUYSK = (52409-23)
  local _tPDzATW = (96219-6)
end
        if not _rbVUbTc.FlyEnabled then return end
        if not _xu9yXEE() then return end
        
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
if false then
  local _xm1aXYu = Instance.new("Part")
end
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            moveDir = moveDir - Vector3.new(0, 1, 0)
        end
        
        if moveDir.Magnitude > 0 then
            moveDir = moveDir.Unit * _rbVUbTc.FlySpeed
        end
        
        _vwQJGvj.Velocity = moveDir
        _nnlLESR.CFrame = cam.CFrame
    end)
end

local function _r5P0NsD()
    if _xMl8ItR.FlyConn then
        _xMl8ItR.FlyConn:Disconnect()
        _xMl8ItR.FlyConn = nil
    end
    if _vwQJGvj then _vwQJGvj:Destroy() _vwQJGvj = nil end
    if _nnlLESR then _nnlLESR:Destroy() _nnlLESR = nil end
    _mF8KVF0(_xD("31".101.139.152.63.99.104.114.96.97.107.100.99))
end

-- ========== SPEED BOOST ==========
local function _xHqG8pN()
    if not _xu9yXEE() then return end
    if _rbVUbTc.SpeedBoost then
        Humanoid.WalkSpeed = _rbVUbTc.WalkSpeed
if false then
  local _vdhONGt = Color3.fromRGB(82,57,7)
end
    else
        Humanoid.WalkSpeed = (8+8)
    end
end

-- ========== DISCORD WEBHOOK ==========
local _nyfXXty = {}
local _tfVqtIb = false

local function _nbsjroQ(data)
    if not _rbVUbTc.WebhookEnabled or _rbVUbTc.WebhookURL == "" then return end
    pcall(function()
        HttpService:PostAsync(_rbVUbTc.WebhookURL, HttpService:JSONEncode(data))
    end)
end

local function _z7qm0R0(itemName)
    if not _rbVUbTc.WebhookFarm then return end
    _nbsjroQ({
        content = _xD("46".88.88.137.123.151.156.147.143.78.123.157.163.156.162.143.151.156.139.88.88.78.123.151.156.147.146.104.78) .. itemName .. _xD("16".48.140.48.100.127.132.113.124.74.48) .. _xMl8ItR.FarmCount,
    })
end

local function _zRb1rxk()
    if not _rbVUbTc.WebhookSell then return end
    _nbsjroQ({
        content = _xD("60".102.102.151.137.165.170.161.157.92.137.171.177.170.176.157.165.170.153.102.102.92.143.171.168.160.92.165.176.161.169.175.92.184.92.144.171.176.157.168.92.175.161.168.168.175.118.92) .. _xMl8ItR.SellCount,
    })
end

local function _qHYpk1n()
    if not _rbVUbTc.WebhookStats then return end
    _nbsjroQ({
        content = _xD("57".99.99.148.134.162.167.158.154.89.134.168.174.167.173.154.162.167.89.140.173.154.173.172.150.99.99.89.134.162.167.158.157.115.89) .. _xMl8ItR.FarmCount .. _xD("11".43.135.43.94.112.119.119.126.69.43) .. _xMl8ItR.SellCount .. _xD("48".80.172.80.116.165.160.149.163.106.80) .. _xMl8ItR.DupeCount .. _xD("49".81.173.81.133.146.163.152.150.165.107.81) .. _xMl8ItR.CurrentTarget,
    })
if false then
  local _n7kIR1n = (57086-50)
  local _nlhLnEi = Color3.fromRGB(167,34,154)
  local _xT4V3Vr = Vector3.new(62,30,-98)
end
end

-- ========== GUI CREATION ==========
local _zysLXRI = Instance.new(_xD("44".139.166.165.159.120.132.126.117))
_zysLXRI.Name = _xD("32".109.137.142.133.129.109.143.149.142.148.129.137.142.118.86)
_zysLXRI.ResetOnSpawn = false
_zysLXRI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_zysLXRI.IgnoreGuiInset = true

if _qrOesQS then
    pcall(function() syn.protect_gui(_zysLXRI) end)
end
_zysLXRI.Parent = game:GetService(_xD("28".95.139.142.129.99.145.133))

-- Responsive sizing
local _qIfd3iE = Workspace.CurrentCamera.ViewportSize
local _riJfFPi = _qIfd3iE.X < 800
local _vHPsyih = _riJfFPi and UDim2.new(0.95, 0, 0, 480) or UDim2.new(0, 380, 0, 540)
local _xb6GkMv = UDim2.new(0, 150, 0, 42)
local _r6uNzcV = UDim2.new(0.025, 0, 0.08, 0)
local _mwrWqji = UDim2.new(0.025, 0, 0.03, 0)

-- ========== MAIN FRAME (Glassmorphism) ==========
local _zlCaaEj = Instance.new(_xD("23".93.137.120.132.124))
_zlCaaEj.Name = _xD("60".155.182.168.127.157.157.129.166)
_zlCaaEj.Size = _vHPsyih
if false then
  local _na2Xrr1 = (9233+20302)
  local _zn4TmWd = Vector3.new(75,39,96)
end
_zlCaaEj.Position = _r6uNzcV
_zlCaaEj.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
_zlCaaEj.BackgroundTransparency = 0.15
_zlCaaEj.BorderSizePixel = 0
_zlCaaEj.ClipsDescendants = true
_zlCaaEj.Parent = _zysLXRI

local MainCorner = Instance.new(_xD("36".121.109.103.147.150.146.137.150))
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = _zlCaaEj

-- Glass border glow
local MainStroke = Instance.new(_xD("10".95.83.93.126.124.121.117.111))
MainStroke.Color = Color3.fromRGB(90, 130, 255)
MainStroke.Thickness = 1.5
MainStroke.Transparency = 0.2
MainStroke.Parent = _zlCaaEj

-- Blur effect frame (glassmorphism simulation)
local _xK4HpUS = Instance.new(_xD("36".109.145.133.139.137.112.133.134.137.144))
_xK4HpUS.Name = _xD("36".107.144.133.151.151.102.144.153.150)
_xK4HpUS.Size = UDim2.new(1, 40, 1, 40)
_xK4HpUS.Position = UDim2.new(0, -20, 0, -20)
_xK4HpUS.BackgroundTransparency = 1
_xK4HpUS.Image = _xD("57".171.155.177.154.172.172.158.173.162.157.115.104.104.112.111.111.114.106.111.113.110.113.110)
_xK4HpUS.ImageColor3 = Color3.fromRGB(50, 80, 200)
_xK4HpUS.ImageTransparency = 0.75
_xK4HpUS.ScaleType = Enum.ScaleType.Slice
_xK4HpUS.SliceCenter = Rect.new(45, 45, 45, 45)
_xK4HpUS.Parent = _zlCaaEj

-- ========== HEADER ==========
if false then
  local _murMylW = Color3.fromRGB(139,151,243)
  local _nhApn5o = Vector3.new(60,75,31)
end
local _msRwi8J = Instance.new(_xD("24".94.138.121.133.125))
_msRwi8J.Name = _xD("20".115.129.135.102.139.125.76.94)
_msRwi8J.Size = UDim2.new(1, 0, 0, 48)
_msRwi8J.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
_msRwi8J.BackgroundTransparency = 0.1
_msRwi8J.BorderSizePixel = 0
_msRwi8J.Parent = _zlCaaEj

local HeaderCorner = Instance.new(_xD("11".96.84.78.122.125.121.112.125))
HeaderCorner.CornerRadius = UDim.new(0, 14)
HeaderCorner.Parent = _msRwi8J

local HeaderGradient = Instance.new(_xD("35".120.108.106.149.132.135.140.136.145.151))
HeaderGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 35, 65)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(25, 25, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 65)),
})
HeaderGradient.Rotation = (2*45)
HeaderGradient.Parent = _msRwi8J

local _xnbTO6I = Instance.new(_xD("44".128.145.164.160.120.141.142.145.152))
_xnbTO6I.Size = UDim2.new(0.65, 0, 1, 0)
_xnbTO6I.Position = UDim2.new(0.04, 0, 0, 0)
_xnbTO6I.BackgroundTransparency = 1
_xnbTO6I.Text = _xD("27".9962.59.104.132.137.128.124.59.104.138.144.137.143.124.132.137.59.145.81)
_xnbTO6I.TextColor3 = Color3.fromRGB(130, 170, 255)
_xnbTO6I.Font = Enum.Font.GothamBold
_xnbTO6I.TextSize = _riJfFPi and 13 or 15
_xnbTO6I.TextXAlignment = Enum.TextXAlignment.Left
_xnbTO6I.Parent = _msRwi8J

-- Version badge
local _tnMjHN9 = Instance.new(_xD("50".134.151.170.166.126.147.148.151.158))
if false then
  local _nsou2wV = (59525-21)
  local _tTuZSxm = CFrame.new(-296,466,228)
end
_tnMjHN9.Size = UDim2.new(0, 28, 0, 18)
_tnMjHN9.Position = UDim2.new(0.65, 0, 0.5, -9)
_tnMjHN9.BackgroundColor3 = Color3.fromRGB(60, 100, 255)
_tnMjHN9.BorderSizePixel = 0
_tnMjHN9.Text = "v6"
_tnMjHN9.TextColor3 = Color3.fromRGB(255, 255, 255)
_tnMjHN9.Font = Enum.Font.GothamBold
_tnMjHN9.TextSize = (2*5)
_tnMjHN9.Parent = _msRwi8J

local vCorner = Instance.new(_xD("24".109.97.91.135.138.134.125.138))
vCorner.CornerRadius = UDim.new(0, 9)
vCorner.Parent = _tnMjHN9

-- Minimize button
local _rCksEI9 = Instance.new(_xD("19".103.120.139.135.85.136.135.135.130.129))
_rCksEI9.Size = UDim2.new(0, 40, 0, 28)
_rCksEI9.Position = UDim2.new(1, -48, 0, 10)
_rCksEI9.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
_rCksEI9.BorderSizePixel = 0
_rCksEI9.Text = "—"
_rCksEI9.TextColor3 = Color3.fromRGB(255, 255, 255)
_rCksEI9.Font = Enum.Font.GothamBold
_rCksEI9.TextSize = (84-70)
_rCksEI9.Parent = _msRwi8J
if false then
  local _zGxrp94 = Color3.fromRGB(92,149,85)
end

local minCorner = Instance.new(_xD("54".139.127.121.165.168.164.155.168))
minCorner.CornerRadius = UDim.new(0, 8)
minCorner.Parent = _rCksEI9

-- ========== MINIMIZED FRAME ==========
local _mtXVzFm = Instance.new(_xD("50".120.164.147.159.151))
_mtXVzFm.Size = _xb6GkMv
_mtXVzFm.Position = _mwrWqji
_mtXVzFm.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
_mtXVzFm.BackgroundTransparency = 0.15
_mtXVzFm.BorderSizePixel = 0
_mtXVzFm.Visible = false
_mtXVzFm.Parent = _zysLXRI

local miniCorner = Instance.new(_xD("43".128.116.110.154.157.153.144.157))
miniCorner.CornerRadius = UDim.new(0, 12)
miniCorner.Parent = _mtXVzFm

local miniStroke = Instance.new(_xD("12".97.85.95.128.126.123.119.113))
miniStroke.Color = Color3.fromRGB(90, 130, 255)
if false then
  local _rkMIeFQ = Vector3.new(4,80,-67)
  local _rsZ3rZN = CFrame.new(-113,254,-139)
  local _rrO91Ub = (118386//3)
end
miniStroke.Thickness = 1.5
miniStroke.Transparency = 0.2
miniStroke.Parent = _mtXVzFm

local MiniLabel = Instance.new(_xD("16".100.117.136.132.92.113.114.117.124))
MiniLabel.Size = UDim2.new(0.6, 0, 1, 0)
MiniLabel.Position = UDim2.new(0.06, 0, 0, 0)
MiniLabel.BackgroundTransparency = 1
MiniLabel.Text = _xD("44".9979.76.121.149.154.145.141)
MiniLabel.TextColor3 = Color3.fromRGB(130, 170, 255)
MiniLabel.Font = Enum.Font.GothamBold
MiniLabel.TextSize = (39//3)
MiniLabel.TextXAlignment = Enum.TextXAlignment.Left
MiniLabel.Parent = _mtXVzFm

local _zDw4pFl = Instance.new(_xD("52".136.153.172.168.118.169.168.168.163.162))
_zDw4pFl.Size = UDim2.new(0, 40, 0, 28)
_zDw4pFl.Position = UDim2.new(1, -48, 0, 7)
_zDw4pFl.BackgroundColor3 = Color3.fromRGB(60, 200, 100)
_zDw4pFl.BorderSizePixel = 0
_zDw4pFl.Text = "□"
_zDw4pFl.TextColor3 = Color3.fromRGB(255, 255, 255)
if false then
  local _tNZxOO1 = Vector3.new(30,19,30)
end
_zDw4pFl.Font = Enum.Font.GothamBold
_zDw4pFl.TextSize = (79-65)
_zDw4pFl.Parent = _mtXVzFm

local expCorner = Instance.new(_xD("54".139.127.121.165.168.164.155.168))
expCorner.CornerRadius = UDim.new(0, 8)
expCorner.Parent = _zDw4pFl

-- ========== TAB BAR ==========
local _qXNCMGD = Instance.new(_xD("39".109.153.136.148.140))
_qXNCMGD.Name = _xD("53".148.166.141.131.120.130.124.121)
_qXNCMGD.Size = UDim2.new(1, -12, 0, 32)
_qXNCMGD.Position = UDim2.new(0, 6, 0, 52)
_qXNCMGD.BackgroundTransparency = 1
_qXNCMGD.Parent = _zlCaaEj

local TabLayout = Instance.new(_xD("52".137.125.128.157.167.168.128.149.173.163.169.168))
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.Padding = UDim.new(0, 3)
TabLayout.Parent = _qXNCMGD

local _mGCmrWr = {_xD("52".122.149.166.161), _xD("60".143.161.168.168), _xD("29".98.112.109), _xD("42".111.162.154.150.153.147.158), _xD("59".136.164.174.158)}
local _vXNjJMB = {}
local _qseCDwH = {}

for i, tabName in ipairs(_mGCmrWr) do
    local tabBtn = Instance.new(_xD("54".138.155.174.170.120.171.170.170.165.164))
    tabBtn.Name = tabName .. _xD("14".98.111.112)
    tabBtn.Size = UDim2.new(0.2, 0, 1, 0)
    tabBtn.BackgroundColor3 = (tabName == _xD("32".102.129.146.141)) and Color3.fromRGB(50, 90, 200) or Color3.fromRGB(30, 30, 50)
if false then
  local _zj3qBoV = CFrame.new(-352,355,-176)
  local _nXTTVaD = CFrame.new(281,465,426)
  local _xg7hlWL = (18089+7265)
end
    tabBtn.BorderSizePixel = 0
    tabBtn.Text = tabName
    tabBtn.TextColor3 = Color3.fromRGB(220, 230, 255)
    tabBtn.Font = Enum.Font.GothamBold
    tabBtn.TextSize = _riJfFPi and 10 or 11
    tabBtn.LayoutOrder = i
    tabBtn.Parent = _qXNCMGD
    
    local tCorner = Instance.new(_xD("13".98.86.80.124.127.123.114.127))
    tCorner.CornerRadius = UDim.new(0, 8)
    tCorner.Parent = tabBtn
    
    _vXNjJMB[tabName] = tabBtn
end

-- ========== CONTENT AREA ==========
local _qZUnCPi = Instance.new(_xD("16".86.130.113.125.117))
_qZUnCPi.Name = _xD("38".133.151.128.123.148.105.118.143)
_qZUnCPi.Size = UDim2.new(1, -12, 1, -90)
_qZUnCPi.Position = UDim2.new(0, 6, 0, 88)
_qZUnCPi.BackgroundTransparency = 1
_qZUnCPi.ClipsDescendants = true
_qZUnCPi.Parent = _zlCaaEj

-- Create tab frames
for _, tabName in ipairs(_mGCmrWr) do
    local tabFrame = Instance.new(_xD("52".135.151.166.163.160.160.157.162.155.122.166.149.161.153))
    tabFrame.Name = tabName .. _xD("30".97.141.140.146.131.140.146)
if false then
  local _mC3RdXp = CFrame.new(-417,368,294)
end
    tabFrame.Size = UDim2.new(1, 0, 1, 0)
    tabFrame.BackgroundTransparency = 1
    tabFrame.BorderSizePixel = 0
    tabFrame.ScrollBarThickness = 3
    tabFrame.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
    tabFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    tabFrame.Visible = (tabName == _xD("21".91.118.135.130))
    tabFrame.Parent = _qZUnCPi
    
    local tabLayout = Instance.new(_xD("36".121.109.112.141.151.152.112.133.157.147.153.152))
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabLayout.Padding = UDim.new(0, 5)
    tabLayout.Parent = tabFrame
    
    local tabPad = Instance.new(_xD("57".142.130.137.154.157.157.162.167.160))
    tabPad.PaddingTop = UDim.new(0, 2)
    tabPad.PaddingBottom = UDim.new(0, 2)
    tabPad.PaddingLeft = UDim.new(0, 2)
    tabPad.PaddingRight = UDim.new(0, 2)
    tabPad.Parent = tabFrame
    
    _qseCDwH[tabName] = tabFrame
end

-- ========== TAB SWITCHING ==========
local function _tL982WT(tabName)
    _xMl8ItR.TabOpen = tabName
    for name, frame in pairs(_qseCDwH) do
        frame.Visible = (name == tabName)
    end
if false then
  local _rBlBgPr = Instance.new("Model")
end
    for name, btn in pairs(_vXNjJMB) do
        btn.BackgroundColor3 = (name == tabName) and Color3.fromRGB(50, 90, 200) or Color3.fromRGB(30, 30, 50)
    end
end

for tabName, btn in pairs(_vXNjJMB) do
    btn.MouseButton1Click:Connect(function()
        _tL982WT(tabName)
    end)
end

-- ========== GUI HELPERS ==========
local _qs5b7VW = 0

local function _tdDfe2l(parent, title)
    _qs5b7VW = _qs5b7VW + 1
    local label = Instance.new(_xD("30".114.131.150.146.106.127.128.131.138))
    label.Size = UDim2.new(1, 0, 0, 26)
    label.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    label.BorderSizePixel = 0
    label.Text = "  " .. title
    label.TextColor3 = Color3.fromRGB(100, 150, 255)
    label.Font = Enum.Font.GothamBold
if false then
  local _tsUBxhn = CFrame.new(465,214,459)
  local _vebWpXP = CFrame.new(-260,360,43)
  local _nCvGlWu = CFrame.new(-307,329,-108)
end
    label.TextSize = _riJfFPi and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.LayoutOrder = _qs5b7VW
    label.Parent = parent
    
    local corner = Instance.new(_xD("13".98.86.80.124.127.123.114.127))
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = label
    return label
end

local function _r4pPn0H(parent, name, default, callback)
    _qs5b7VW = _qs5b7VW + 1
    local frame = Instance.new(_xD("25".95.139.122.134.126))
    frame.Size = UDim2.new(1, 0, 0, 38)
    frame.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
    frame.BorderSizePixel = 0
    frame.LayoutOrder = _qs5b7VW
    frame.Parent = parent
    
    local corner = Instance.new(_xD("14".99.87.81.125.128.124.115.128))
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    local label = Instance.new(_xD("22".106.123.142.138.98.119.120.123.130))
    label.Size = UDim2.new(0.65, 0, 1, 0)
    label.Position = UDim2.new(0.04, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(200, 210, 240)
    label.Font = Enum.Font.Gotham
    label.TextSize = _riJfFPi and 11 or 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
if false then
  local _qEbIVpB = (9651-3)
  local _qRTG7T5 = (23794-509)
  local _xnmBEDd = Color3.fromRGB(7,180,243)
end
    
    local toggleBtn = Instance.new(_xD("34".118.135.154.150.100.151.150.150.145.144))
    toggleBtn.Size = UDim2.new(0, 52, 0, 24)
    toggleBtn.Position = UDim2.new(1, -60, 0.5, -12)
    toggleBtn.BackgroundColor3 = default and Color3.fromRGB(50, 180, 90) or Color3.fromRGB(50, 50, 70)
    toggleBtn.BorderSizePixel = 0
    toggleBtn.Text = default and "ON" or _xD("57".136.127.127)
    toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.TextSize = (35-25)
    toggleBtn.Parent = frame
    
    local tCorner = Instance.new(_xD("54".139.127.121.165.168.164.155.168))
    tCorner.CornerRadius = UDim.new(0, 12)
    tCorner.Parent = toggleBtn
    
    local toggled = default
    toggleBtn.MouseButton1Click:Connect(function()
        toggled = not toggled
        toggleBtn.BackgroundColor3 = toggled and Color3.fromRGB(50, 180, 90) or Color3.fromRGB(50, 50, 70)
        toggleBtn.Text = toggled and "ON" or _xD("37".116.107.107)
        callback(toggled)
    end)
    
    return frame, toggleBtn
end

local function _mRt0wMZ(parent, name, color, callback)
    _qs5b7VW = _qs5b7VW + 1
    local btn = Instance.new(_xD("51".135.152.171.167.117.168.167.167.162.161))
if false then
  local _xS0d60N = Vector3.new(40,58,-75)
  local _q8o3GdQ = Vector3.new(-55,53,44)
end
    btn.Size = UDim2.new(1, 0, 0, 34)
    btn.BackgroundColor3 = color
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = _riJfFPi and 11 or 12
    btn.LayoutOrder = _qs5b7VW
    btn.Parent = parent
    
    local corner = Instance.new(_xD("33".118.106.100.144.147.143.134.147))
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    
    btn.MouseButton1Click:Connect(callback)
    return btn
end

local function _rUx8uwh(parent, name, minVal, maxVal, defaultVal, callback)
    _qs5b7VW = _qs5b7VW + 1
    local frame = Instance.new(_xD("12".82.126.109.121.113))
    frame.Size = UDim2.new(1, 0, 0, 50)
    frame.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
    frame.BorderSizePixel = 0
    frame.LayoutOrder = _qs5b7VW
    frame.Parent = parent
    
if false then
  local _zMwGcl2 = Instance.new("Folder")
end
    local corner = Instance.new(_xD("42".127.115.109.153.156.152.143.156))
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    local label = Instance.new(_xD("20".104.121.140.136.96.117.118.121.128))
    label.Size = UDim2.new(1, -12, 0, 20)
    label.Position = UDim2.new(0, 6, 0, 2)
    label.BackgroundTransparency = 1
    label.Text = name .. ": " .. tostring(defaultVal)
    label.TextColor3 = Color3.fromRGB(180, 195, 230)
    label.Font = Enum.Font.Gotham
    label.TextSize = _riJfFPi and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local sliderFrame = Instance.new(_xD("38".108.152.135.147.139))
    sliderFrame.Size = UDim2.new(1, -12, 0, 14)
    sliderFrame.Position = UDim2.new(0, 6, 0, 28)
    sliderFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    sliderFrame.BorderSizePixel = 0
    sliderFrame.Parent = frame
    
    local sCorner = Instance.new(_xD("60".145.133.127.171.174.170.161.174))
    sCorner.CornerRadius = UDim.new(0, 7)
    sCorner.Parent = sliderFrame
    
    local fillBar = Instance.new(_xD("20".90.134.117.129.121))
    local pct = (defaultVal - minVal) / (maxVal - minVal)
    fillBar.Size = UDim2.new(pct, 0, 1, 0)
    fillBar.BackgroundColor3 = Color3.fromRGB(70, 130, 255)
if false then
  local _rXEYiYi = Vector3.new(-65,61,41)
  local _xyNNDsQ = (35663-975)
  local _t9dKCA9 = Instance.new("Part")
end
    fillBar.BorderSizePixel = 0
    fillBar.Parent = sliderFrame
    
    local fCorner = Instance.new(_xD("33".118.106.100.144.147.143.134.147))
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
    
if false then
  local _nRauD1R = Color3.fromRGB(1,20,127)
  local _rvCrVZZ = CFrame.new(-495,337,320)
end
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

local function _nwW5L8L(parent, name, defaultText, callback)
    _qs5b7VW = _qs5b7VW + 1
    local frame = Instance.new(_xD("25".95.139.122.134.126))
    frame.Size = UDim2.new(1, 0, 0, 42)
    frame.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
    frame.BorderSizePixel = 0
    frame.LayoutOrder = _qs5b7VW
    frame.Parent = parent
    
    local corner = Instance.new(_xD("43".128.116.110.154.157.153.144.157))
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    local label = Instance.new(_xD("51".135.152.171.167.127.148.149.152.159))
    label.Size = UDim2.new(0.35, 0, 1, 0)
    label.Position = UDim2.new(0.03, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(180, 195, 230)
if false then
  local _qNtYO0C = Instance.new("Part")
  local _xd4TzNw = Vector3.new(69,93,-57)
  local _rC6kNZc = Instance.new("Folder")
end
    label.Font = Enum.Font.Gotham
    label.TextSize = _riJfFPi and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local input = Instance.new(_xD("54".138.155.174.170.120.165.174))
    input.Size = UDim2.new(0.55, 0, 0, 26)
    input.Position = UDim2.new(0.4, 0, 0.5, -13)
    input.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    input.BorderSizePixel = 0
    input.Text = defaultText
    input.PlaceholderText = name
    input.TextColor3 = Color3.fromRGB(220, 220, 240)
    input.PlaceholderText3 = Color3.fromRGB(100, 100, 120)
    input.Font = Enum.Font.Gotham
    input.TextSize = _riJfFPi and 10 or 11
    input.ClearTextOnFocus = false
    input.Parent = frame
    
    local iCorner = Instance.new(_xD("30".115.103.97.141.144.140.131.144))
    iCorner.CornerRadius = UDim.new(0, 6)
    iCorner.Parent = input
    
    input.FocusLost:Connect(function()
        callback(input.Text)
    end)
    
    return frame, input
if false then
  local _zE1LMQQ = Color3.fromRGB(113,16,28)
end
end

-- ========== BUILD FARM TAB ==========
local _xbRZCsD = _qseCDwH[_xD("29".99.126.143.138)]

_tdDfe2l(_xbRZCsD, _xD("26".128228.58.109.110.91.110.109))
_qs5b7VW = _qs5b7VW + 1
local _nsPqwnZ = Instance.new(_xD("44".114.158.141.153.145))
_nsPqwnZ.Size = UDim2.new(1, 0, 0, 40)
_nsPqwnZ.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
_nsPqwnZ.BorderSizePixel = 0
_nsPqwnZ.LayoutOrder = _qs5b7VW
_nsPqwnZ.Parent = _xbRZCsD

local statsCorner = Instance.new(_xD("27".112.100.94.138.141.137.128.141))
statsCorner.CornerRadius = UDim.new(0, 8)
statsCorner.Parent = _nsPqwnZ

local _qgAgTnd = Instance.new(_xD("55".139.156.175.171.131.152.153.156.163))
_qgAgTnd.Name = _xD("42".125.158.139.158.157.126.143.162.158)
_qgAgTnd.Size = UDim2.new(1, -12, 1, 0)
_qgAgTnd.Position = UDim2.new(0, 6, 0, 0)
_qgAgTnd.BackgroundTransparency = 1
_qgAgTnd.Text = _xD("43".120.148.153.144.143.101.75.91.75.167.75.126.144.151.151.158.101.75.91.75.167.75.127.140.157.146.144.159.101.75.121.154.153.144)
_qgAgTnd.TextColor3 = Color3.fromRGB(180, 200, 230)
_qgAgTnd.Font = Enum.Font.Gotham
_qgAgTnd.TextSize = _riJfFPi and 9 or 10
_qgAgTnd.TextXAlignment = Enum.TextXAlignment.Left
_qgAgTnd.TextWrapped = true
_qgAgTnd.Parent = _nsPqwnZ
if false then
  local _tzCa3bQ = CFrame.new(298,476,-399)
end

local function _vsBCx9N()
    _qgAgTnd.Text = _xD("54".131.159.164.155.154.112.86) .. _xMl8ItR.FarmCount .. _xD("52".84.176.84.135.153.160.160.167.110.84) .. _xMl8ItR.SellCount .. _xD("43".75.167.75.111.160.155.144.101.75) .. _xMl8ItR.DupeCount .. _xD("60".92.184.92.144.157.174.163.161.176.118.92) .. (_xMl8ItR.CurrentTarget or _xD("26".104.137.136.127))
end

_tdDfe2l(_xbRZCsD, _xD("16".9951.48.81.101.100.95.48.86.81.98.93))

_r4pPn0H(_xbRZCsD, _xD("29".94.146.145.140.61.99.126.143.138.61.111.140.128.136.144.76.96.143.150.144.145.126.137.144), false, function(val)
    _rbVUbTc.AutoFarm = val
    if val then _rTZbSSM() else _noNtzo1() end
end)

_r4pPn0H(_xbRZCsD, _xD("10".90.124.115.121.124.115.126.131.42.82.115.113.114.111.125.126.42.96.107.118.127.111), false, function(val)
    _rbVUbTc.PriorityHighestValue = val
    if val then _rbVUbTc.PriorityClosest = false end
end)

_r4pPn0H(_xbRZCsD, _xD("41".121.155.146.152.155.146.157.162.73.108.149.152.156.142.156.157), true, function(val)
    _rbVUbTc.PriorityClosest = val
    if val then _rbVUbTc.PriorityHighestValue = false end
end)

_rUx8uwh(_xbRZCsD, _xD("12".82.109.126.121.44.94.109.112.117.129.127), 50, 2000, 500, function(val)
    _rbVUbTc.FarmRadius = val
if false then
  local _v3hRcOO = Color3.fromRGB(50,235,217)
  local _rlnCwy4 = Vector3.new(26,26,11)
end
end)

_rUx8uwh(_xbRZCsD, _xD("40".110.137.154.149.72.108.141.148.137.161), 1, 100, 5, function(val)
    _rbVUbTc.FarmDelay = val / 100
end)

_mRt0wMZ(_xbRZCsD, _xD("23".128292.55.106.122.120.133.55.105.134.122.130.138.55.101.134.142), Color3.fromRGB(40, 80, 160), function()
    local rocks = _mfgTit1()
    _mF8KVF0(_xD("22".92.133.139.132.122.54) .. #rocks .. _xD("40".72.154.151.139.147.155.87.139.154.161.155.156.137.148.155))
end)

_mRt0wMZ(_xbRZCsD, _xD("28".9963.60.105.133.138.129.60.106.129.125.142.129.143.144.60.110.139.127.135), Color3.fromRGB(40, 120, 60), function()
    local rocks = _mfgTit1()
    if #rocks > 0 then
        _mawovYY(rocks[1])
    else
        _mF8KVF0(_xD("12".90.123.44.126.123.111.119.127.44.114.123.129.122.112.45))
    end
end)

if false then
  local _qhnqXNa = Vector3.new(45,41,38)
end
_mRt0wMZ(_xbRZCsD, _xD("21".9910.53.88.118.120.125.122.53.103.122.130.132.137.122.136), Color3.fromRGB(100, 50, 150), function()
    _zATmjxM()
end)

-- ========== BUILD SELL TAB ==========
local _rOGJFpq = _qseCDwH[_xD("24".107.125.132.132)]

_tdDfe2l(_rOGJFpq, _xD("52".128228.84.117.137.136.131.84.135.121.128.128))

_r4pPn0H(_rOGJFpq, _xD("30".95.147.146.141.62.113.131.138.138), false, function(val)
    _rbVUbTc.AutoSell = val
    if val then _qtNcC2c() else _xGt6SGx() end
end)

_rUx8uwh(_rOGJFpq, _xD("19".102.120.127.127.51.101.116.119.124.136.134), 50, 1000, 300, function(val)
    _rbVUbTc.SellRadius = val
end)

_rUx8uwh(_rOGJFpq, _xD("33".116.134.141.141.65.101.134.141.130.154), 1, 50, 3, function(val)
    _rbVUbTc.SellDelay = val / 10
end)

_mRt0wMZ(_rOGJFpq, _xD("26".128202.58.109.127.134.134.58.123.142.58.104.127.123.140.127.141.142.58.109.130.137.138), Color3.fromRGB(140, 100, 30), function()
    local shops = _nkKO7xw()
    if #shops > 0 then
        _qE7C9eY(shops[1])
    else
        _mF8KVF0(_xD("42".120.153.74.157.146.153.154.157.74.144.153.159.152.142.75))
if false then
  local _nrt458C = Vector3.new(-73,82,96)
  local _xNjfNng = (279426//3)
end
    end
end)

_mRt0wMZ(_rOGJFpq, _xD("37".128005.69.108.148.69.109.148.146.138.69.84.69.121.138.145.138.149.148.151.153.69.153.148.69.120.141.148.149), Color3.fromRGB(80, 50, 150), function()
    local shops = _nkKO7xw()
    if #shops > 0 then
        _t4d0mEm(shops[1].Part.Position)
        _mF8KVF0(_xD("30".114.131.138.131.142.141.144.146.131.130.62.146.141.88.62) .. shops[1].Name)
    end
end)

_tdDfe2l(_rOGJFpq, _xD("36".128296.68.101.121.120.115.68.121.116.107.118.101.104.105))

_r4pPn0H(_rOGJFpq, _xD("43".108.160.159.154.75.128.155.146.157.140.143.144), false, function(val)
    _rbVUbTc.AutoUpgrade = val
    if val then _xwOdYRt() else _nbsvfGr() end
end)

_mRt0wMZ(_rOGJFpq, _xD("48".11062.80.133.160.151.162.145.148.149.80.113.156.156), Color3.fromRGB(50, 130, 180), function()
    _nKrwdQp(_xD("33".150.145.136.147.130.133.134))
    _nKrwdQp(_xD("52".150.169.173))
    _nKrwdQp(_xD("23".135.140.137.122.127.120.138.124))
    _nKrwdQp(_xD("50".169.147.164.159.166.154))
    _nKrwdQp(_xD("57".169.162.156.164.154.177.158))
    _nKrwdQp(_xD("20".118.117.119.127.132.117.119.127))
    _nKrwdQp(_xD("26".141.138.127.127.126))
if false then
  local _mSBWQKd = Vector3.new(63,8,-28)
  local _n5YdUzG = Color3.fromRGB(66,84,151)
end
    _mF8KVF0(_xD("59".129.164.173.160.159.91.176.171.162.173.156.159.160.91.173.160.168.170.175.160.174))
end)

_tdDfe2l(_rOGJFpq, _xD("26".128004.58.94.95.110.95.93.110.95.94.58.109.98.105.106.109))

_nhHhpmM = Instance.new(_xD("29".112.128.143.140.137.137.134.139.132.99.143.126.138.130))
_nhHhpmM.Name = _xD("16".111.126.120.88.120.128.125.93)
_nhHhpmM.Size = UDim2.new(1, 0, 0, 90)
_nhHhpmM.BackgroundColor3 = Color3.fromRGB(18, 18, 30)
_nhHhpmM.BorderSizePixel = 0
_nhHhpmM.ScrollBarThickness = 2
_nhHhpmM.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
_nhHhpmM.CanvasSize = UDim2.new(0, 0, 0, 0)
_nhHhpmM.AutomaticCanvasSize = Enum.AutomaticSize.Y
_qs5b7VW = _qs5b7VW + 1
_nhHhpmM.LayoutOrder = _qs5b7VW
_nhHhpmM.Parent = _rOGJFpq

local shopLCorner = Instance.new(_xD("22".107.95.89.133.136.132.123.136))
shopLCorner.CornerRadius = UDim.new(0, 6)
shopLCorner.Parent = _nhHhpmM

local shopLLayout = Instance.new(_xD("39".124.112.115.144.154.155.115.136.160.150.156.155))
shopLLayout.SortOrder = Enum.SortOrder.LayoutOrder
shopLLayout.Padding = UDim.new(0, 2)
shopLLayout.Parent = _nhHhpmM

local shopLPad = Instance.new(_xD("56".141.129.136.153.156.156.161.166.159))
shopLPad.PaddingTop = UDim.new(0, 2)
shopLPad.PaddingBottom = UDim.new(0, 2)
if false then
  local _zXaeEt3 = Vector3.new(-84,66,23)
end
shopLPad.PaddingLeft = UDim.new(0, 2)
shopLPad.PaddingRight = UDim.new(0, 2)
shopLPad.Parent = _nhHhpmM

-- ========== BUILD ESP TAB ==========
local _xwpumvm = _qseCDwH[_xD("18".87.101.98)]

_tdDfe2l(_xwpumvm, _xD("35".128100.67.104.118.115.67.82.67.121.108.118.120.100.111.118))

_r4pPn0H(_xwpumvm, _xD("54".121.168.175.169.170.151.162.86.101.86.136.165.153.161.86.123.137.134), false, function(val)
    _rbVUbTc.ESPEnabled = val
    if val then _nPx0gJZ() else _vpBH74r() end
end)

_mRt0wMZ(_xwpumvm, _xD("19".128279.51.101.120.121.133.120.134.123.51.88.102.99), Color3.fromRGB(50, 90, 160), function()
    if _rbVUbTc.ESPEnabled then
        _xKtSokD()
    else
        _mF8KVF0(_xD("46".115.156.143.144.154.147.78.115.129.126.78.148.151.160.161.162.79))
    end
end)

_mRt0wMZ(_xwpumvm, _xD("13".10073.45.80.121.114.110.127.45.82.96.93), Color3.fromRGB(150, 50, 50), function()
    _vpBH74r()
end)

_tdDfe2l(_xwpumvm, _xD("39".129743.71.107.108.123.108.106.123.108.107.71.121.118.106.114.122))

_z23pExj = Instance.new(_xD("13".96.112.127.124.121.121.118.123.116.83.127.110.122.114))
_z23pExj.Name = _xD("27".122.149.77.78.139.96.147.133)
_z23pExj.Size = UDim2.new(1, 0, 0, 120)
_z23pExj.BackgroundColor3 = Color3.fromRGB(18, 18, 30)
_z23pExj.BorderSizePixel = 0
_z23pExj.ScrollBarThickness = 2
_z23pExj.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
if false then
  local _qWujdOn = (11128-31)
  local _qmOpZem = Instance.new("Model")
end
_z23pExj.CanvasSize = UDim2.new(0, 0, 0, 0)
_z23pExj.AutomaticCanvasSize = Enum.AutomaticSize.Y
_qs5b7VW = _qs5b7VW + 1
_z23pExj.LayoutOrder = _qs5b7VW
_z23pExj.Parent = _xwpumvm

local rLCorner = Instance.new(_xD("59".144.132.126.170.173.169.160.173))
rLCorner.CornerRadius = UDim.new(0, 6)
rLCorner.Parent = _z23pExj

local rLLayout = Instance.new(_xD("53".138.126.129.158.168.169.129.150.174.164.170.169))
rLLayout.SortOrder = Enum.SortOrder.LayoutOrder
rLLayout.Padding = UDim.new(0, 2)
rLLayout.Parent = _z23pExj

local rLPad = Instance.new(_xD("41".126.114.121.138.141.141.146.151.144))
rLPad.PaddingTop = UDim.new(0, 2)
rLPad.PaddingBottom = UDim.new(0, 2)
rLPad.PaddingLeft = UDim.new(0, 2)
rLPad.PaddingRight = UDim.new(0, 2)
rLPad.Parent = _z23pExj

-- ========== BUILD EXPLOIT TAB ==========
local _nY2DZML = _qseCDwH[_xD("37".106.157.149.145.148.142.153)]

_tdDfe2l(_nY2DZML, _xD("58".127948.90.127.146.138.134.137.131.142.141))

_r4pPn0H(_nY2DZML, _xD("18".103.128.126.123.127.123.134.119.118.50.84.115.117.125.130.115.117.125), false, function(val)
    _rbVUbTc.UnlimitedBackpack = val
if false then
  local _x1as5lm = Color3.fromRGB(99,23,96)
  local _tOXo5Vj = Vector3.new(-80,90,82)
end
    if val then _tJnrO57() end
end)

_r4pPn0H(_nY2DZML, _xD("45".130.155.153.150.154.150.161.146.145.77.121.162.144.152), false, function(val)
    _rbVUbTc.UnlimitedLuck = val
    if val then _n6KptIF() end
end)

_r4pPn0H(_nY2DZML, _xD("58".123.168.174.163.90.126.155.167.155.161.159), false, function(val)
    _rbVUbTc.AntiDamage = val
    if val then _xmxMC4G() else _q59hFPv() end
end)

_r4pPn0H(_nY2DZML, _xD("18".83.128.134.123.50.88.132.119.119.140.119.50.58.105.115.132.127.134.122.59), false, function(val)
    _rbVUbTc.AntiFreeze = val
    if val and not _rbVUbTc.AntiDamage then
        _rbVUbTc.AntiDamage = true
        _xmxMC4G()
    end
end)

if false then
  local _rwwijMI = Color3.fromRGB(66,101,15)
  local _rek5ZeV = (38109-16)
  local _qDHLkVr = Vector3.new(-68,69,60)
end
_tdDfe2l(_nY2DZML, _xD("22".127939.54.99.101.108.91.99.91.100.106))

_r4pPn0H(_nY2DZML, _xD("17".100.129.118.118.117.49.83.128.128.132.133), false, function(val)
    _rbVUbTc.SpeedBoost = val
    _xHqG8pN()
end)

_rUx8uwh(_nY2DZML, _xD("51".138.148.159.158.83.134.163.152.152.151), 16, 200, 50, function(val)
    _rbVUbTc.WalkSpeed = val
    if _rbVUbTc.SpeedBoost then _xHqG8pN() end
end)

_r4pPn0H(_nY2DZML, _xD("35".113.146.134.143.140.147), false, function(val)
    _rbVUbTc.Noclip = val
    if val then _nsZVFK0() else _zU1WL32() end
end)

_r4pPn0H(_nY2DZML, _xD("31".101.139.152), false, function(val)
    _rbVUbTc.FlyEnabled = val
    if val then _tVjV1V3() else _r5P0NsD() end
end)

_rUx8uwh(_nY2DZML, _xD("51".121.159.172.83.134.163.152.152.151), 10, 200, 60, function(val)
    _rbVUbTc.FlySpeed = val
end)

if false then
  local _mTwCbUv = Vector3.new(55,45,81)
  local _nxlBjNm = Color3.fromRGB(26,46,87)
end
_tdDfe2l(_nY2DZML, _xD("56".128286.88.129.140.125.133.88.124.141.136.125))

local _nB7XiB2, _xMgs3R2
_nB7XiB2, _xMgs3R2 = _nwW5L8L(_nY2DZML, _xD("57".125.174.169.158.89.138.173.178), "1", function(text)
    local num = tonumber(text)
    if num and num > 0 then
        _rbVUbTc.DupeAmount = math.floor(num)
    end
end)

_mRt0wMZ(_nY2DZML, _xD("16".128246.48.84.133.128.117.48.89.132.117.125.131.48.56) .. _rbVUbTc.DupeAmount .. "x)", Color3.fromRGB(180, 60, 180), function()
    _rrXUXKe(_rbVUbTc.DupeAmount)
end)

_tdDfe2l(_nY2DZML, _xD("46".128271.78.128.115.123.125.130.115.78.115.134.126.122.125.119.130.129))

_mRt0wMZ(_nY2DZML, _xD("34".128327.66.104.139.148.135.66.99.142.142.66.111.139.144.135.66.116.135.143.145.150.135.149), Color3.fromRGB(160, 40, 40), function()
    _nKrwdQp(_xD("23".132.128.133.124))
    _nKrwdQp(_xD("50".150.155.153))
    _nKrwdQp(_xD("47".151.144.161.165.148.162.163))
    _nKrwdQp(_xD("44".143.155.152.152.145.143.160))
if false then
  local _n9xb7kA = CFrame.new(-489,437,-212)
end
    _nKrwdQp(_xD("29".127.143.130.126.136))
    _mF8KVF0(_xD("42".112.147.156.143.142.74.151.147.152.143.74.156.143.151.153.158.143.157))
end)

_mRt0wMZ(_nY2DZML, _xD("17".128193.49.87.122.131.118.49.82.125.125.49.100.118.125.125.49.99.118.126.128.133.118.132), Color3.fromRGB(40, 140, 40), function()
    _nKrwdQp(_xD("27".142.128.135.135))
    _nKrwdQp(_xD("53".168.154.161.161.150.161.161))
    _nKrwdQp(_xD("55".154.152.170.159))
    _nKrwdQp(_xD("32".141.143.142.133.153))
    _nKrwdQp(_xD("14".130.128.111.114.115))
    _mF8KVF0(_xD("35".105.140.149.136.135.67.150.136.143.143.67.149.136.144.146.151.136.150))
end)

_mRt0wMZ(_nY2DZML, _xD("56".11070.88.126.161.170.157.88.121.164.164.88.141.168.159.170.153.156.157.88.138.157.165.167.172.157.171), Color3.fromRGB(40, 100, 160), function()
    _nKrwdQp(_xD("57".174.169.160.171.154.157.158))
    _nKrwdQp(_xD("53".151.170.174))
    _nKrwdQp(_xD("42".154.159.156.141.146.139.157.143))
    _nKrwdQp(_xD("34".153.131.148.143.150.138))
    _nKrwdQp(_xD("20".132.125.119.127.117.140.121))
    _nKrwdQp(_xD("34".132.131.133.141.146.131.133.141))
    _mF8KVF0(_xD("55".125.160.169.156.155.87.172.167.158.169.152.155.156.87.169.156.164.166.171.156.170))
end)

_mRt0wMZ(_nY2DZML, _xD("27".127949.59.97.132.141.128.59.92.135.135.59.103.144.126.134.59.109.128.136.138.143.128.142), Color3.fromRGB(140, 140, 40), function()
    _nKrwdQp(_xD("59".167.176.158.166))
    _nKrwdQp(_xD("44".152.161.143.151.165))
    _nKrwdQp(_xD("38".140.149.152.154.155.148.139))
    _nKrwdQp(_xD("49".147.157.150.164.164.154.159.152))
    _mF8KVF0(_xD("59".129.164.173.160.159.91.167.176.158.166.91.173.160.168.170.175.160.174))
if false then
  local _qFuUVwo = Vector3.new(68,65,2)
end
end)

_mRt0wMZ(_nY2DZML, _xD("48".128211.80.118.153.162.149.80.113.124.124.80.130.149.157.159.164.149.163.80.88.126.165.155.149.89), Color3.fromRGB(200, 50, 50), function()
    for _, remote in ipairs(_xMl8ItR.RemoteCache) do
        pcall(function()
            if remote.Type == _xD("43".125.144.152.154.159.144.112.161.144.153.159) then
                remote.Instance:FireServer()
            elseif remote.Type == _xD("39".121.140.148.150.155.140.109.156.149.138.155.144.150.149) then
                remote.Instance:InvokeServer()
            end
        end)
    end
    _mF8KVF0(_xD("26".104.111.101.95.94.58.123.134.134.58) .. #_xMl8ItR.RemoteCache .. _xD("13".45.127.114.122.124.129.114.128.46))
end)

-- ========== BUILD MISC TAB ==========
local _mblcaPn = _qseCDwH[_xD("40".117.145.155.139)]

_tdDfe2l(_mblcaPn, _xD("27".128230.59.103.106.98))

_rcBYXEa = Instance.new(_xD("40".123.139.154.151.148.148.145.150.143.110.154.137.149.141))
_rcBYXEa.Name = _xD("40".135.154.139.106.129.128.109.137)
_rcBYXEa.Size = UDim2.new(1, 0, 0, 100)
_rcBYXEa.BackgroundColor3 = Color3.fromRGB(12, 12, 20)
_rcBYXEa.BorderSizePixel = 0
_rcBYXEa.ScrollBarThickness = 2
_rcBYXEa.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
_rcBYXEa.CanvasSize = UDim2.new(0, 0, 0, 0)
_rcBYXEa.AutomaticCanvasSize = Enum.AutomaticSize.Y
_qs5b7VW = _qs5b7VW + 1
_rcBYXEa.LayoutOrder = _qs5b7VW
_rcBYXEa.Parent = _mblcaPn

if false then
  local _tHQI0kT = (161138//2)
end
local logCorner = Instance.new(_xD("47".132.120.114.158.161.157.148.161))
logCorner.CornerRadius = UDim.new(0, 6)
logCorner.Parent = _rcBYXEa

local logLayout = Instance.new(_xD("24".109.97.100.129.139.140.100.121.145.135.141.140))
logLayout.SortOrder = Enum.SortOrder.LayoutOrder
logLayout.Parent = _rcBYXEa

local logPad = Instance.new(_xD("54".139.127.134.151.154.154.159.164.157))
logPad.PaddingTop = UDim.new(0, 3)
logPad.PaddingLeft = UDim.new(0, 3)
logPad.PaddingRight = UDim.new(0, 3)
logPad.Parent = _rcBYXEa

_tdDfe2l(_mblcaPn, _xD("14".128293.46.82.87.97.81.93.96.82.46.101.83.80.86.93.93.89))

_r4pPn0H(_mblcaPn, _xD("56".125.166.153.154.164.157.88.143.157.154.160.167.167.163), false, function(val)
    _rbVUbTc.WebhookEnabled = val
end)

_nwW5L8L(_mblcaPn, _xD("26".113.127.124.130.137.137.133.58.111.108.102), "", function(text)
    _rbVUbTc.WebhookURL = text
end)

_r4pPn0H(_mblcaPn, _xD("28".98.125.142.137.60.104.139.131.143), true, function(val)
    _rbVUbTc.WebhookFarm = val
end)

_r4pPn0H(_mblcaPn, _xD("26".109.127.134.134.58.102.137.129.141), true, function(val)
    _rbVUbTc.WebhookSell = val
end)
if false then
  local _q4jpajV = CFrame.new(103,296,-200)
  local _qG41mBz = (22828-853)
  local _q2Do8TN = Color3.fromRGB(68,27,206)
end

_r4pPn0H(_mblcaPn, _xD("36".119.152.133.152.151.68.112.147.139.151), true, function(val)
    _rbVUbTc.WebhookStats = val
end)

_mRt0wMZ(_mblcaPn, _xD("25".128257.57.108.126.135.125.57.108.141.122.141.140.57.103.136.144), Color3.fromRGB(50, 90, 160), function()
    _qHYpk1n()
    _mF8KVF0(_xD("39".122.140.149.155.71.154.155.136.155.154.71.155.150.71.158.140.137.143.150.150.146))
end)

_mRt0wMZ(_mblcaPn, _xD("54".129568.86.138.155.169.170.86.141.155.152.158.165.165.161), Color3.fromRGB(90, 60, 140), function()
    _nbsjroQ({content = _xD("60".102.102.151.137.165.170.161.157.92.137.171.177.170.176.157.165.170.92.178.114.153.102.102.92.147.161.158.164.171.171.167.92.176.161.175.176.92.175.177.159.159.161.175.175.162.177.168.93.92.10049)})
    _mF8KVF0(_xD("49".133.150.164.165.150.149.81.168.150.147.153.160.160.156))
end)

_tdDfe2l(_mblcaPn, _xD("43".128338.75.128.127.116.119.116.127.116.112.126))

_mRt0wMZ(_mblcaPn, _xD("26".127994.58.110.127.134.127.138.137.140.142.58.142.137.58.109.138.123.145.136), Color3.fromRGB(60, 90, 140), function()
    local spawns = Workspace:FindFirstChild(_xD("45".128.157.142.164.155.121.156.144.142.161.150.156.155)) or Workspace:FindFirstChild(_xD("41".124.153.138.160.151.156)) or Workspace:FindFirstChild(_xD("10".86.121.108.108.131))
    if spawns then
        if spawns:IsA(_xD("56".122.153.171.157.136.153.170.172)) then
            _t4d0mEm(spawns.Position)
        else
            local spawn = spawns:FindFirstChildWhichIsA(_xD("42".108.139.157.143.122.139.156.158))
            if spawn then _t4d0mEm(spawn.Position) end
        end
    else
        _mF8KVF0(_xD("16".94.127.48.131.128.113.135.126.48.118.127.133.126.116.49))
    end
end)

_mRt0wMZ(_mblcaPn, _xD("45".128001.77.129.146.153.146.157.156.159.161.77.161.156.77.122.156.162.155.161.142.150.155.77.129.156.157), Color3.fromRGB(100, 60, 140), function()
    if _xu9yXEE() then
        local highestY = HumanoidRootPart.Position.Y
if false then
  local _ncgGLlc = Color3.fromRGB(25,19,210)
  local _vJly1v6 = Vector3.new(41,0,89)
end
        local highestPart = nil
        for _, part in ipairs(Workspace:GetDescendants()) do
            if part:IsA(_xD("22".88.119.137.123.102.119.136.138)) and part.Position.Y > highestY then
                highestY = part.Position.Y
                highestPart = part
            end
        end
        if highestPart then
            _t4d0mEm(highestPart.Position + Vector3.new(0, 10, 0))
            _mF8KVF0(_xD("26".110.127.134.127.138.137.140.142.127.126.58.142.137.58.130.131.129.130.127.141.142.58.138.137.131.136.142.84.58) .. math.floor(highestY))
        end
    end
end)

_mRt0wMZ(_mblcaPn, _xD("60".128320.92.142.161.166.171.165.170.92.143.161.174.178.161.174), Color3.fromRGB(100, 100, 50), function()
    pcall(function()
        LocalPlayer:Kick(_xD("28".110.129.134.139.133.138.133.138.131.74.74.74))
        task.wait(1)
        game:GetService(_xD("56".140.157.164.157.168.167.170.172.139.157.170.174.161.155.157)):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end)
end)

_tdDfe2l(_mblcaPn, _xD("10".8515.42.83.88.80.89))

if false then
  local _qPxzMEw = Color3.fromRGB(58,85,192)
  local _zwh3THg = Instance.new("Model")
end
_qs5b7VW = _qs5b7VW + 1
local infoLabel = Instance.new(_xD("13".97.114.133.129.89.110.111.114.121))
infoLabel.Size = UDim2.new(1, 0, 0, 50)
infoLabel.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
infoLabel.BorderSizePixel = 0
infoLabel.Text = _xD("49".126.154.159.150.146.81.126.160.166.159.165.146.154.159.81.167.103.81.134.157.165.154.158.146.165.150.141.159.114.166.165.160.81.119.146.163.158.81.173.81.118.132.129.81.173.81.118.169.161.157.160.154.165.164.81.173.81.117.166.161.150.141.159.136.160.163.156.164.81.160.159.81.117.150.157.165.146.93.81.132.170.159.146.161.164.150.93.81.124.131.127.125.93.81.119.157.166.169.166.164)
infoLabel.TextColor3 = Color3.fromRGB(140, 160, 200)
infoLabel.Font = Enum.Font.Gotham
infoLabel.TextSize = _riJfFPi and 9 or 10
infoLabel.LayoutOrder = _qs5b7VW
infoLabel.Parent = _mblcaPn

local infoCorner = Instance.new(_xD("10".95.83.77.121.124.120.111.124))
infoCorner.CornerRadius = UDim.new(0, 6)
infoCorner.Parent = infoLabel

-- ========== MINIMIZE / EXPAND LOGIC ==========
_rCksEI9.MouseButton1Click:Connect(function()
    _xMl8ItR.IsMinimized = true
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local tween = TweenService:Create(_zlCaaEj, tweenInfo, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.025, 0, 0.03, 0),
    })
    tween:Play()
    tween.Completed:Connect(function()
        _zlCaaEj.Visible = false
        _mtXVzFm.Visible = true
        _mtXVzFm.Size = UDim2.new(0, 0, 0, 0)
        local expandTween = TweenService:Create(_mtXVzFm, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = _xb6GkMv,
        })
        expandTween:Play()
    end)
end)

if false then
  local _n17WjrB = Vector3.new(88,71,-64)
  local _vsq5rHi = Instance.new("Model")
  local _zYb7pfJ = Instance.new("Folder")
end
_zDw4pFl.MouseButton1Click:Connect(function()
    _xMl8ItR.IsMinimized = false
    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local tween = TweenService:Create(_mtXVzFm, tweenInfo, {
        Size = UDim2.new(0, 0, 0, 0),
    })
    tween:Play()
    tween.Completed:Connect(function()
        _mtXVzFm.Visible = false
        _zlCaaEj.Visible = true
        _zlCaaEj.Size = UDim2.new(0, 0, 0, 0)
        local expandTween = TweenService:Create(_zlCaaEj, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = _vHPsyih,
        })
        expandTween:Play()
    end)
end)

-- ========== DRAGGING ==========
local _nUbjNC9 = false
local _nkoncuK
local _tsq3ex2
local _tSFNfr6

local function _xn7SrB2(input)
    local delta = input.Position - _tsq3ex2
    local target = _xMl8ItR.IsMinimized and _mtXVzFm or _zlCaaEj
    target.Position = UDim2.new(
        _tSFNfr6.X.Scale, _tSFNfr6.X.Offset + delta.X,
        _tSFNfr6.Y.Scale, _tSFNfr6.Y.Offset + delta.Y
    )
end
if false then
  local _tzevAJ6 = Instance.new("Folder")
  local _nGJe6qs = Vector3.new(-79,26,-98)
end

local function _t9J3xzu(frame)
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            _nUbjNC9 = true
            _tsq3ex2 = input.Position
            _tSFNfr6 = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    _nUbjNC9 = false
                end
            end)
        end
    end)
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            _nkoncuK = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == _nkoncuK and _nUbjNC9 then
            _xn7SrB2(input)
        end
    end)
end

_t9J3xzu(_msRwi8J)
_t9J3xzu(_mtXVzFm)

-- ========== PERIODIC UPDATES ==========
if false then
  local _noRVXOI = Instance.new("Folder")
  local _vWgBdQ9 = Color3.fromRGB(82,246,69)
  local _znYgGE7 = Vector3.new(85,86,-11)
end
task.spawn(function()
    while true do
        task.wait(5)
        if _rbVUbTc.AutoSell or _rbVUbTc.AutoFarm then
            _vsBCx9N()
        end
        -- Periodic webhook stats
        if _rbVUbTc.WebhookEnabled and _rbVUbTc.WebhookStats then
            pcall(_qHYpk1n)
        end
    end
end)

-- Auto-detect shops and rocks periodically
task.spawn(function()
    while true do
        task.wait(10)
        pcall(function()
            local shops = _nkKO7xw()
            if _nhHhpmM then
                _nhHhpmM:ClearAllChildren()
                for i, shop in ipairs(shops) do
                    if i > 15 then break end
                    local btn = Instance.new(_xD("48".132.149.168.164.114.165.164.164.159.158))
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Color3.fromRGB(30, 35, 50)
                    btn.BorderSizePixel = 0
                    btn.Text = shop.Name .. " [" .. math.floor(shop.Distance) .. "m]"
                    btn.TextColor3 = Color3.fromRGB(200, 220, 255)
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = (6+5)
                    btn.Parent = _nhHhpmM
if false then
  local _t7qTNfV = (2*11150)
  local _qlAOEst = Color3.fromRGB(3,115,87)
  local _x6SVh1k = CFrame.new(-36,299,-146)
end
                    local bCorner = Instance.new(_xD("21".106.94.88.132.135.131.122.135))
                    bCorner.CornerRadius = UDim.new(0, 5)
                    bCorner.Parent = btn
                    btn.MouseButton1Click:Connect(function()
                        _t4d0mEm(shop.Part.Position)
                        _mF8KVF0(_xD("27".111.128.135.128.139.138.141.143.128.127.59.143.138.85.59) .. shop.Name)
                    end)
                end
            end
        end)
        
        pcall(function()
            local rocks = _mfgTit1()
            if _z23pExj then
                _z23pExj:ClearAllChildren()
                for i, rock in ipairs(rocks) do
                    if i > 20 then break end
                    local btn = Instance.new(_xD("38".122.139.158.154.104.155.154.154.149.148))
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Color3.fromRGB(30, 35, 50)
                    btn.BorderSizePixel = 0
if false then
  local _qBedEpF = Vector3.new(46,84,-26)
end
                    btn.Text = rock.Name .. " [" .. math.floor(rock.Distance) .. "m]" .. (rock.Value > 0 and (" $" .. rock.Value) or "")
                    btn.TextColor3 = rock.Value > 0 and Color3.fromRGB(255, 215, 100) or Color3.fromRGB(200, 255, 200)
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = (7+4)
                    btn.Parent = _z23pExj
                    local bCorner = Instance.new(_xD("55".140.128.122.166.169.165.156.169))
                    bCorner.CornerRadius = UDim.new(0, 5)
                    bCorner.Parent = btn
                    btn.MouseButton1Click:Connect(function()
                        _t4d0mEm(rock.Part.Position)
                        _mF8KVF0(_xD("10".94.111.118.111.122.121.124.126.111.110.42.126.121.68.42) .. rock.Name)
                    end)
                end
            end
        end)
    end
end)

-- ========== HANDLE RESPAWN ==========
LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    HumanoidRootPart = char:WaitForChild(_xD("57".129.174.166.154.167.168.162.157.139.168.168.173.137.154.171.173))
    Humanoid = char:WaitForChild(_xD("58".130.175.167.155.168.169.163.158))
    _mF8KVF0(_xD("15".82.119.112.129.112.114.131.116.129.47.129.116.130.127.112.134.125.116.115))
if false then
  local _xysT4ak = Color3.fromRGB(232,225,111)
end
    
    -- Re-apply speed boost if enabled
    if _rbVUbTc.SpeedBoost then
        task.delay(1, function()
            _xHqG8pN()
        end)
    end
end)

-- ========== HANDLE SCREEN RESIZE ==========
Workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
    local newSize = Workspace.CurrentCamera.ViewportSize
    local isMob = newSize.X < 800
    _vHPsyih = isMob and UDim2.new(0.95, 0, 0, 480) or UDim2.new(0, 380, 0, 540)
    if not _xMl8ItR.IsMinimized then
        _zlCaaEj.Size = _vHPsyih
    end
end)

-- ========== SIMULATION RADIUS (see further) ==========
if _qPkUkI0 then
    pcall(function()
        setsimulationradius(1e9, 1e9)
    end)
end

-- ========== STARTUP ==========
_mF8KVF0(_xD("30".107.135.140.131.127.62.107.141.147.140.146.127.135.140.62.148.84.62.115.106.114.103.107.95.114.99.62.106.141.127.130.131.130.63))
_mF8KVF0(_xD("26".91.143.142.137.58.96.123.140.135.58.150.58.95.109.106.58.150.58.95.146.138.134.137.131.142.141.58.150.58.94.143.138.127))
_mF8KVF0(_xD("44".111.141.143.148.145.76.158.145.153.155.160.145.159.76.146.149.158.159.160.76.146.155.158.76.142.145.159.160.76.158.145.159.161.152.160.159.77))

-- Initial remote cache
task.delay(3, function()
    _zATmjxM()
if false then
  local _qLWVoi0 = Instance.new("Part")
  local _qZrIY1W = CFrame.new(-448,73,58)
  local _qSkXCky = (3*29669)
end
end)
