--[[ Minea v7 protected | TrueSc3nt ]]
local _u=table.unpack or unpack
local function _S(s)
    local o=tonumber(s:match('^(%d+)|'))
    if not o then return '' end
    local t={}
    for c in s:gmatch('(%d+)') do
        local n=tonumber(c)-o
        if n>0 then t[#t+1]=n end
    end
    if utf8 and utf8.char then
        local ok,res=pcall(utf8.char,_u(t))
        if ok then return res end
    end
    local r=''
    for i=1,#t do
        if t[i]<=255 then r=r..string.char(t[i]) end
    end
    return r
end
if false then local _jn1o1i2gu=0 end
local Players = game:GetService(_S("103|183|211|200|224|204|217|218"))
local ReplicatedStorage = game:GetService(_S("117|199|218|229|225|222|216|214|233|218|217|200|233|228|231|214|220|218"))
local Workspace = game:GetService(_S("113|200|224|227|220|228|225|210|212|214"))
local RunService = game:GetService(_S("68|150|185|178|151|169|182|186|173|167|169"))
local TweenService = game:GetService(_S("68|152|187|169|169|178|151|169|182|186|173|167|169"))
local UserInputService = game:GetService(_S("92|177|207|193|206|165|202|204|209|208|175|193|206|210|197|191|193"))
local HttpService = game:GetService(_S("100|172|216|216|212|183|201|214|218|205|199|201"))
local StarterGui = game:GetService(_S("104|187|220|201|218|220|205|218|175|221|209"))
local Lighting = game:GetService(_S("78|154|183|181|182|194|183|188|181"))
local TeleportService = game:GetService(_S("108|192|209|216|209|220|219|222|224|191|209|222|226|213|207|209"))
local CollectionService = game:GetService(_S("107|174|218|215|215|208|206|223|212|218|217|190|208|221|225|212|206|208"))

local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then
    LocalPlayer = Players.PlayerAdded:Wait()
end

local Character = LocalPlayer.Character
local HumanoidRootPart = Character and Character:FindFirstChild(_S("118|190|235|227|215|228|229|223|218|200|229|229|234|198|215|232|234"))
local Humanoid = Character and Character:FindFirstChild(_S("77|149|194|186|174|187|188|182|177"))
if not Character then
    task.spawn(function()
        local char = LocalPlayer.CharacterAdded:Wait()
        Character = char
        HumanoidRootPart = char:WaitForChild(_S("74|146|191|183|171|184|185|179|174|156|185|185|190|154|171|188|190"))
        Humanoid = char:WaitForChild(_S("68|140|185|177|165|178|179|173|168"))
    end)
end

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

    SmartLoop = false,
    OreFilterEnabled = false,
    OreFilter = _S("106|206|211|203|215|217|216|206|150|220|223|204|227|150|209|217|214|206|150|207|215|207|220|203|214|206|150|221|203|218|218|210|211|220|207|150|221|222|203|220|221|203|218|218|210|211|220|207|150|218|214|203|222|211|216|223|215"),
    OreBlacklist = _S("61|160|172|158|169|105|176|177|172|171|162|105|175|172|160|168"),
    RapidMine = false,
    RapidMineCount = 3,
    AutoEquipPickaxe = false,
    AutoCollectDrops = false,
    BypassPromptHold = true,
    TweenTeleport = false,
    TweenTeleportSpeed = 80,

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

    InfiniteJump = false,
    ClickTeleport = false,
    AntiAFK = false,
    AutoRespawn = false,
    WarmthKeeper = false,
    StaminaKeeper = false,

    Tracers = false,
    PlayerESP = false,
    Fullbright = false,
    ChestESP = false,
    HideOtherPlayers = false,
    FPSBooster = false,

    RemoteSpy = false,
    CustomRemoteName = "",
    CustomRemoteArgs = "",

    ServerHopInterval = 0,
    PanicEnabled = true,
}

local LogList, ShopList, RockList, RemoteSpyList, CashLabel, StatsLabel

local State = {
    FarmConnection = nil,
    SellConnection = nil,
    ESPConnections = {},
    AntiDamageConn = nil,
    NoclipConn = nil,
    FlyConn = nil,
    UpgradeConn = nil,
    IsMinimized = false,
    CurrentTarget = _S("76|154|187|186|177"),
    FarmCount = 0,
    SellCount = 0,
    DupeCount = 0,
    UpgradeCount = 0,
    TotalEarnings = 0,
    Logs = {},
    ESPHighlights = {},
    RemoteCache = {},
    TabOpen = _S("124|194|221|238|233"),
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
    Exec.Name = _S("85|170|195|192|195|196|204|195")
    pcall(function()
        if identifyexecutor then
            Exec.Name = identifyexecutor()
        elseif EXECUTOR_NAME then
            Exec.Name = EXECUTOR_NAME
        elseif syn then
            Exec.Name = _S("109|192|230|219|206|221|224|210")
        elseif KRNL_LOADED then
            Exec.Name = _S("110|185|192|188|186")
        elseif Fluxus then
            Exec.Name = _S("63|133|171|180|183|180|178")
        elseif delta then
            Exec.Name = _S("117|185|218|225|233|214")
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
            local cg = game:GetService(_S("123|190|234|237|224|194|240|228"))
            if cloneref then cg = cloneref(cg) end
            parent = cg
        end)
        if parent then return parent end
        return LocalPlayer:WaitForChild(_S("86|166|194|183|207|187|200|157|203|191"))
    end

    Exec.HttpGet = function(url)
        local ok, result = pcall(function() return game:HttpGet(url) end)
        if ok and result then return result end
        if Exec.Request then
            local res = Exec.Request({Url = url, Method = _S("108|179|177|192")})
            if type(res) == _S("94|210|191|192|202|195") then
                return res.Body or res.body or res.BodyText
            end
        end
        return HttpService:GetAsync(url)
    end

    Exec.Post = function(url, body, contentType)
        contentType = contentType or _S("108|205|220|220|216|213|207|205|224|213|219|218|155|214|223|219|218")
        if Exec.Request then
            return Exec.Request({
                Url = url,
                Method = _S("123|203|202|206|207"),
                Headers = {[_S("102|169|213|212|218|203|212|218|147|186|223|214|203")] = contentType},
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
                sethiddenproperty(LocalPlayer, _S("108|191|213|217|225|216|205|224|213|219|218|190|205|208|213|225|223"), 1e9)
                sethiddenproperty(LocalPlayer, _S("100|177|197|220|183|205|209|217|208|197|216|205|211|210|182|197|200|205|217|215"), 1e9)
            end
        end)
    end

    local NamecallHooks = {}
    local OldNamecall = nil
    local NamecallInstalled = false

    function Exec.OnNamecall(fn)
        table.insert(NamecallHooks, fn)
        if not NamecallInstalled and Exec.HasHookMeta then
            NamecallInstalled = true
            pcall(function()
                OldNamecall = hookmetamethod(game, _S("114|209|209|224|211|223|215|213|211|222|222"), Exec.SafeCClosure(function(self, ...)
                    local method = Exec.GetNamecallMethod()
                    local args = {...}
                    for _, hook in ipairs(NamecallHooks) do
                        local block, ret = hook(self, method, args)
                        if block then return ret end
                    end
                    return OldNamecall(self, ...)
                end))
            end)
        end
    end

    Exec.NamecallHooks = NamecallHooks

    HasHookMeta = Exec.HasHookMeta
    HasNewCClosure = Exec.HasNewCClosure
    HasFireClick = Exec.HasFireClick
    HasFireProximity = Exec.HasFireProximity
    HasFireTouch = Exec.HasFireTouch
    HasSetSimRadius = Exec.HasSetSimRadius
    HasCheckCaller = Exec.HasCheckCaller
    HasProtectGui = true
    IsExecutor = getgenv ~= nil
    GetGEnv = genv
end

local RemoteSpyActive = false

pcall(function()
    if Exec.HasHookMeta and Exec.GetNamecallMethod then
        Exec.OnNamecall(function(self, method, args)

            if RemoteSpyActive and (method == _S("106|176|211|220|207|189|207|220|224|207|220") or method == _S("127|200|237|245|238|234|228|210|228|241|245|228|241")) then
                if self:IsA(_S("70|152|171|179|181|186|171|139|188|171|180|186")) or self:IsA(_S("128|210|229|237|239|244|229|198|245|238|227|244|233|239|238")) then
                    pcall(function() AddRemoteSpyLog(self.Name, method, args) end)
                end
            end

            if method == _S("94|169|199|193|201") and self == LocalPlayer then
                return true, nil
            end

            if method == _S("75|145|180|185|175|158|176|189|193|180|174|176") then
                local svc = args[1]
                if svc == _S("129|198|249|241|237|240|234|245|212|230|243|247|234|228|230") or svc == _S("99|166|203|200|196|215|182|200|213|217|204|198|200") then
                    return true, nil
                end
            end
            return false
        end)
    end
end)

do
    if Exec.HasHookMeta and Exec.HasNewCClosure then
        pcall(function()
            local OldIndex = hookmetamethod(game, _S("124|219|219|229|234|224|225|244"), Exec.SafeCClosure(function(self, key)
                if Humanoid and self == Humanoid then
                    if key == _S("63|150|160|171|170|146|175|164|164|163") and Config.SpeedBoost then return 16 end
                    if key == _S("91|165|208|200|203|171|202|210|192|205") and Config.JumpPower > 50 then return 50 end
                end
                return OldIndex(self, key)
            end))
        end)
        pcall(function()
            local OldNewIndex = hookmetamethod(game, _S("114|209|209|224|215|233|219|224|214|215|234"), Exec.SafeCClosure(function(self, key, value)
                if Humanoid and self == Humanoid then
                    if key == _S("77|164|174|185|184|160|189|178|178|177") and Config.SpeedBoost then
                        return OldNewIndex(self, key, Config.WalkSpeed)
                    end
                end
                return OldNewIndex(self, key, value)
            end))
        end)
    end
end

local function GetCharacter()
    Character = LocalPlayer.Character
    if Character then
        HumanoidRootPart = Character:FindFirstChild(_S("96|168|213|205|193|206|207|201|196|178|207|207|212|176|193|210|212"))
        Humanoid = Character:FindFirstChild(_S("124|196|241|233|221|234|235|229|224"))
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
    for token in string.gmatch(string.lower(str or ""), _S("101|192|195|145|138|216|194|144")) do
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
    local leaderstats = LocalPlayer:FindFirstChild(_S("106|214|207|203|206|207|220|221|222|203|222|221"))
    if not leaderstats then return 0 end
    for _, stat in ipairs(leaderstats:GetChildren()) do
        local n = string.lower(stat.Name)
        for _, p in ipairs(patterns) do
            if string.find(n, p) and stat:IsA(_S("78|164|175|186|195|179|144|175|193|179")) then
                return stat.Value
            end
        end
    end
    return 0
end

local function GetPlayerCash()
    return GetLeaderstatValue({_S("130|229|227|245|234"), _S("95|204|206|205|196|216"), _S("98|197|209|203|208"), _S("64|167|175|172|164"), _S("60|158|157|168|157|170|159|161"), _S("104|202|221|203|211|219")})
end

local function GetBackpackWeight()
    return GetLeaderstatValue({_S("67|186|168|172|170|171|183"), _S("107|206|204|221|221|228"), "kg", _S("71|179|182|168|171"), _S("108|206|205|207|215|220|205|207|215")})
end

local function GetBackpackCapacity()
    local cap = GetLeaderstatValue({_S("84|183|181|196|181|183|189|200|205"), _S("122|231|219|242|221|219|236|236|243"), _S("60|169|157|180"), _S("83|191|188|192|188|199"), _S("114|212|211|213|221|226|211|213|221")})
    if cap > 0 then return cap end
    local obj = LocalPlayer:FindFirstChild(_S("63|129|160|162|170|175|160|162|170|130|160|175|160|162|168|179|184")) or LocalPlayer:FindFirstChild(_S("86|163|183|206|153|183|200|200|207"))
    if obj and obj:IsA(_S("126|212|223|234|243|227|192|223|241|227")) then return obj.Value end
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
            if d:IsA(_S("77|157|191|188|197|182|186|182|193|198|157|191|188|186|189|193")) then
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
            if not tool:IsA(_S("61|145|172|172|169")) then return -1 end
            local n = string.lower(tool.Name)
            if not (string.find(n, _S("95|207|200|194|202")) or string.find(n, _S("89|186|209|190")) or string.find(n, _S("64|164|178|169|172|172")) or string.find(n, _S("130|246|241|241|238")) or string.find(n, _S("85|189|182|194|194|186|199"))) then
                return 0
            end
            local s = 0
            if string.find(n, _S("130|230|235|227|239|241|240|230")) then s = s + 100
            elseif string.find(n, _S("67|170|178|175|167")) then s = s + 80
            elseif string.find(n, _S("101|206|215|212|211")) then s = s + 50
            elseif string.find(n, _S("101|216|217|212|211|202")) then s = s + 20 end
            for _, d in ipairs(tool:GetDescendants()) do
                if d:IsA(_S("119|205|216|227|236|220|185|216|234|220")) and (string.find(string.lower(d.Name), _S("62|170|163|180|163|170")) or string.find(string.lower(d.Name), _S("104|220|209|205|218"))) then
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
    local patterns = {_S("110|210|224|221|222"), _S("90|198|201|201|206"), _S("87|192|203|188|196"), _S("111|223|216|210|218|228|223"), _S("127|226|238|235|235|228|226|243"), _S("72|183|186|173"), _S("67|170|168|176"), _S("85|184|199|206|200|201|182|193")}
    local function scan(parent)
        for _, child in ipairs(parent:GetChildren()) do
            local nl = string.lower(child.Name)
            if child:IsA(_S("104|170|201|219|205|184|201|218|220")) or child:IsA(_S("104|181|215|204|205|212")) then
                for _, p in ipairs(patterns) do
                    if string.find(nl, p) then
                        local part = child:IsA(_S("100|166|197|215|201|180|197|214|216")) and child or child:FindFirstChildWhichIsA(_S("123|189|220|238|224|203|220|237|239"))
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
        FireRemote(_S("121|233|226|220|228|238|233"))
        FireRemote(_S("103|202|214|211|211|204|202|219"))
        FireRemote(_S("124|232|235|235|240"))
    end
end

local function FireUpgradePurchases()
    if Config.AutoBuyPickaxe then
        FireRemote(_S("64|176|169|163|171|161|184|165")); FireRemote(_S("98|196|215|219|193|210|203|197|205|195|218|199")); FireRemote(_S("82|199|194|185|196|179|182|183|177|194|187|181|189|179|202|183"))
    end
    if Config.AutoBuyBackpack then
        FireRemote(_S("60|158|157|159|167|172|157|159|167")); FireRemote(_S("66|165|163|178|163|165|171|182|187")); FireRemote(_S("118|235|230|221|232|215|218|219|213|216|215|217|225|230|215|217|225"))
    end
    if Config.AutoBuyLuck then
        FireRemote(_S("68|176|185|167|175")); FireRemote(_S("127|227|232|230|222|235|244|226|234")); FireRemote(_S("61|169|178|160|168|182"))
    end
    if Config.AutoBuyWarmth then
        FireRemote(_S("100|219|197|214|209|216|204")); FireRemote(_S("108|212|209|205|224")); FireRemote(_S("121|220|218|230|233|223|226|235|222"))
    end
    if Config.AutoUpgrade then
        FireRemote(_S("72|189|184|175|186|169|172|173")); FireRemote(_S("82|180|199|203")); FireRemote(_S("75|187|192|189|174|179|172|190|176"))
    end
end

local function TryAutoRebirth()
    if not Config.AutoRebirth then return end
    if GetPlayerCash() >= Config.RebirthCashThreshold then
        FireRemote(_S("67|181|168|165|172|181|183|171")); FireRemote(_S("96|208|210|197|211|212|201|199|197")); FireRemote(_S("60|174|161|175|161|176")); FireRemote(_S("87|184|202|186|188|197|187"))
        AddLog(_S("101|166|218|217|212|133|215|202|199|206|215|217|205|133|198|217|217|202|210|213|217|202|201|133|198|217|133") .. GetPlayerCash() .. _S("93|125|192|190|208|197"))
    end
end

local function TryAutoClaimDaily()
    if not Config.AutoClaimDaily then return end
    FireRemote(_S("71|171|168|176|179|192")); FireRemote(_S("85|199|186|204|182|199|185")); FireRemote(_S("118|217|226|215|223|227")); FireRemote(_S("105|213|216|208|210|215"))
    FireRemote(_S("73|172|184|173|174")); FireRemote(_S("107|221|208|207|208|208|216"))
    if Config.PromoCode ~= "" then
        FireRemote(_S("130|229|241|230|231"), Config.PromoCode)
        FireRemote(_S("97|211|198|197|198|198|206"), Config.PromoCode)
    end
end

local function ShouldSellNow()
    if IsBackpackFull() and Config.SellWhenFull then return true end
    if Config.SellMinCash > 0 and GetPlayerCash() >= Config.SellMinCash then return true end
    return false
end

local function DupeViaDrop()
    AddLog(_S("86|154|200|197|198|118|186|203|198|187|144|118|198|191|185|193|203|198|118|201|198|183|195|132|132|132"))
    pcall(function()
        local tool = Character and Character:FindFirstChildOfClass(_S("94|178|205|205|202"))
        if tool then
            tool.Parent = LocalPlayer.Backpack
            task.wait(0.1)
            Humanoid:EquipTool(tool)
        end
        for i = 1, Config.DupeAmount do
            FireRemote(_S("107|207|221|218|219")); FireRemote(_S("62|174|167|161|169|179|174")); FireRemote(_S("116|215|227|224|224|217|215|232"))
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
        if not child:IsA(_S("74|159|147|150|179|189|190|150|171|195|185|191|190")) and not child:IsA(_S("99|184|172|179|196|199|199|204|209|202")) then
            child:Destroy()
        end
    end
end

local function AddLog(message)
    local timestamp = os.date(_S("69|106|141|127|106|146|127|106|152"))
    table.insert(State.Logs, 1, "[" .. timestamp .. "] " .. message)
    if #State.Logs > 50 then
        table.remove(State.Logs)
    end
    if LogList then
        pcall(function()
            ClearScrollList(LogList)
            for i, log in ipairs(State.Logs) do
                if i > 15 then break end
                local label = Instance.new(_S("100|184|201|220|216|176|197|198|201|208"))
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

local function CacheRemotes()
    State.RemoteCache = {}
    pcall(function()
        for _, remote in ipairs(ReplicatedStorage:GetDescendants()) do
            if remote:IsA(_S("103|185|204|212|214|219|204|172|221|204|213|219")) or remote:IsA(_S("105|187|206|214|216|221|206|175|222|215|204|221|210|216|215")) then
                table.insert(State.RemoteCache, {
                    Instance = remote,
                    Name = remote.Name,
                    Type = remote.ClassName,
                })
            end
        end
    end)
    AddLog(_S("79|146|176|178|183|180|179|111") .. #State.RemoteCache .. _S("80|112|194|181|189|191|196|181|195"))
end

local function FireRemote(namePattern, ...)
    local args = {...}
    for _, remote in ipairs(State.RemoteCache) do
        local rName = string.lower(remote.Name)
        local pattern = string.lower(namePattern)
        if string.find(rName, pattern) then
            pcall(function()
                if remote.Type == _S("69|151|170|178|180|185|170|138|187|170|179|185") then
                    remote.Instance:FireServer(Exec.Unpack(args))
                elseif remote.Type == _S("90|172|191|199|201|206|191|160|207|200|189|206|195|201|200") then
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
                if remote.Type == _S("61|143|162|170|172|177|162|130|179|162|171|177") then
                    remote.Instance:FireServer(Exec.Unpack(args))
                elseif remote.Type == _S("129|211|230|238|240|245|230|199|246|239|228|245|234|240|239") then
                    remote.Instance:InvokeServer(Exec.Unpack(args))
                end
            end)
            return true
        end
    end
    return false
end

local CrystalPatterns = {
    _S("123|237|234|222|230"), _S("122|233|236|223"), _S("114|229|230|225|224|215"), _S("108|217|213|218|209|222|205|216"), _S("126|225|240|247|241|242|223|234"), _S("127|230|228|236"), _S("97|196|208|194|205"), _S("79|184|193|190|189"),
    _S("130|233|241|238|230"), _S("77|177|182|174|186|188|187|177"), _S("88|187|199|200|200|189|202"), _S("127|242|232|235|245|228|241"), _S("108|222|225|206|229"), _S("61|162|170|162|175|158|169|161"), _S("102|217|199|214|214|206|207|216|203"),
    _S("70|167|179|171|186|174|191|185|186"), _S("92|202|203|192|193"), _S("108|226|209|213|218"), _S("113|213|214|225|224|228|218|229"), _S("122|220|233|239|230|222|223|236"), _S("88|203|204|185|202|203|185|200|200|192|193|202|189"),
    _S("126|242|237|238|223|248"), _S("89|200|201|186|197"), _S("124|236|225|221|238|232"), _S("78|184|175|178|179"), _S("82|195|199|179|196|198|204"), _S("121|232|219|236|226|221|226|218|231"), _S("95|203|192|207|200|210"),
    _S("77|186|182|193|181|191|182|185"), _S("121|237|226|237|218|231|226|238|230"), _S("61|173|169|158|177|166|171|178|170"), _S("89|201|190|203|194|189|200|205"), _S("67|189|172|181|166|178|177"), _S("93|196|190|207|203|194|209"),
    _S("118|215|231|235|215|227|215|232|223|228|219"), _S("124|223|229|240|238|229|234|225"), _S("77|193|174|187|199|174|187|182|193|178"), _S("110|219|221|221|220|225|226|221|220|211"), _S("113|228|230|223|228|229|224|223|214"),
    _S("104|202|212|215|215|204|219|220|215|214|205"), _S("94|205|204|215|214"), _S("107|223|218|224|221|216|204|215|212|217|208"), _S("120|235|232|225|230|221|228"), _S("127|225|228|241|248|235"), _S("126|225|230|223|234|225|227|226|237|236|247"),
}

local function GetAllRocks()
    local rocks = {}
    local function SearchRocks(parent)
        if not parent then return end
        for _, child in ipairs(parent:GetChildren()) do
            local nameLower = string.lower(child.Name)
            if child:IsA(_S("98|164|195|213|199|178|195|212|214")) or child:IsA(_S("122|199|233|222|223|230")) then
                local matched = false
                for _, pattern in ipairs(CrystalPatterns) do
                    if string.find(nameLower, pattern) then
                        matched = true
                        break
                    end
                end
                if matched and MatchesOreFilter(nameLower) then
                    local part = child:IsA(_S("124|190|221|239|225|204|221|238|240")) and child or child:FindFirstChildWhichIsA(_S("75|141|172|190|176|155|172|189|191"))
                    if part then
                        local dist = GetDistance(part)
                        if dist <= Config.FarmRadius then

                            local value = 0
                            pcall(function()
                                local val = child:FindFirstChild(_S("95|181|192|203|212|196")) or child:FindFirstChild(_S("72|152|186|177|171|173")) or child:FindFirstChild(_S("112|199|223|226|228|216")) or child:FindFirstChild(_S("103|189|200|211|220|204|182|221|204|217|217|208|203|204"))
                                if val and val:IsA(_S("80|166|177|188|197|181|146|177|195|181")) then
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
        Workspace:FindFirstChild(_S("116|198|227|215|223|231")),
        Workspace:FindFirstChild(_S("115|194|229|216|230")),
        Workspace:FindFirstChild(_S("61|138|166|171|162|175|158|169|176")),
        Workspace:FindFirstChild(_S("94|171|199|204|195|209")),
        Workspace:FindFirstChild(_S("90|172|191|205|201|207|204|189|191|205")),
        Workspace:FindFirstChild(_S("86|163|183|198")),
        Workspace:FindFirstChild(_S("69|153|170|183|183|166|174|179")),
        Workspace:FindFirstChild(_S("84|151|198|205|199|200|181|192|199")),
        Workspace:FindFirstChild(_S("86|163|197|203|196|202|183|191|196")),
        Workspace,
    }

    for _, area in ipairs(searchAreas) do
        if area then
            SearchRocks(area)
        end
    end

    if Config.PriorityHighestValue then
        table.sort(rocks, function(a, b) return a.Value > b.Value end)
    elseif Config.PriorityClosest then
        table.sort(rocks, function(a, b) return a.Distance < b.Distance end)
    end

    return rocks
end

local function GetAllShops()
    local shops = {}
    local function SearchShops(parent)
        if not parent then return end
        for _, child in ipairs(parent:GetChildren()) do
            local nameLower = string.lower(child.Name)
            if child:IsA(_S("89|166|200|189|190|197")) or child:IsA(_S("60|126|157|175|161|140|157|174|176")) then
                if string.find(nameLower, _S("117|232|221|228|229")) or string.find(nameLower, _S("67|182|168|175|175")) or
                   string.find(nameLower, _S("66|181|182|177|180|167")) or string.find(nameLower, _S("64|173|165|178|163|168|161|174|180")) or
                   string.find(nameLower, _S("73|189|187|170|173|174|187")) or string.find(nameLower, _S("117|217|218|214|225|218|231")) or
                   string.find(nameLower, _S("103|212|200|217|210|204|219")) or string.find(nameLower, _S("102|220|203|212|202|213|216")) or
                   string.find(nameLower, _S("87|186|184|202|191|192|188|201")) or string.find(nameLower, _S("68|166|185|189|169|182")) or
                   string.find(nameLower, _S("67|177|179|166")) or string.find(nameLower, _S("127|226|224|242|231")) or
                   string.find(nameLower, _S("80|184|191|189|181")) or string.find(nameLower, _S("122|220|219|237|223")) or
                   string.find(nameLower, _S("79|178|176|188|191")) then
                    local part = child:IsA(_S("113|179|210|228|214|193|210|227|229")) and child or child:FindFirstChildWhichIsA(_S("79|145|176|194|180|159|176|193|195")) or child:FindFirstChild(_S("104|176|221|213|201|214|215|209|204|186|215|215|220|184|201|218|220"))
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

local function MineRock(rockData)
    local rock = rockData.Instance
    local part = rockData.Part

    if not rock or not rock.Parent then return false end

    EquipBestPickaxe()
    BypassPromptsIn(rock)

    AddLog(_S("67|144|172|177|172|177|170|125|99") .. rockData.Name)

    TeleportTo(part.Position)
    task.wait(0.05)

    local function doMineOnce()

        if HasFireClick then
            local clickDetector = rock:FindFirstChildOfClass(_S("107|174|215|212|206|214|175|208|223|208|206|223|218|221")) or part:FindFirstChildOfClass(_S("64|131|172|169|163|171|132|165|180|165|163|180|175|178"))
            if clickDetector then Exec.FireClick(clickDetector) end
        end
        if HasFireProximity then
            local prompt = rock:FindFirstChildOfClass(_S("130|210|244|241|250|235|239|235|246|251|210|244|241|239|242|246")) or part:FindFirstChildOfClass(_S("76|156|190|187|196|181|185|181|192|197|156|190|187|185|188|192"))
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

        local tool = Character and Character:FindFirstChildOfClass(_S("120|204|231|231|228"))
        if tool then tool:Activate() end

        FireRemote(_S("119|228|224|229|220")); FireRemote(_S("73|177|170|187|191|174|188|189")); FireRemote(_S("76|175|187|184|184|177|175|192"))
        FireRemote(_S("98|196|212|199|195|205")); FireRemote(_S("96|199|193|212|200|197|210")); FireRemote(_S("65|165|170|168"))
        FireRemote(_S("76|188|181|175|183")); FireRemote(_S("102|217|221|207|212|205"))

        for _, remote in ipairs(State.RemoteCache) do
            local rName = string.lower(remote.Name)
            if string.find(rName, _S("84|193|189|194|185")) or string.find(rName, _S("71|171|176|174")) or string.find(rName, _S("94|198|191|208|212|195|209|210")) then
                pcall(function()
                    if remote.Type == _S("112|194|213|221|223|228|213|181|230|213|222|228") then
                        remote.Instance:FireServer(rock, part)
                    elseif remote.Type == _S("123|205|224|232|234|239|224|193|240|233|222|239|228|234|233") then
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

local function SellItems(shopData)
    if not shopData then return false end

    local shop = shopData.Instance
    local part = shopData.Part

    AddLog(_S("128|211|229|236|236|233|238|231|160|225|244|186|160") .. shopData.Name)

    TeleportTo(part.Position)
    task.wait(0.1)

    if HasFireClick then
        local clickDetector = shop:FindFirstChildOfClass(_S("77|144|185|182|176|184|145|178|193|178|176|193|188|191")) or part:FindFirstChildOfClass(_S("99|166|207|204|198|206|167|200|215|200|198|215|210|213"))
        if clickDetector then Exec.FireClick(clickDetector) end
    end

    if HasFireProximity then
        local prompt = shop:FindFirstChildOfClass(_S("82|162|196|193|202|187|191|187|198|203|162|196|193|191|194|198")) or part:FindFirstChildOfClass(_S("89|169|203|200|209|194|198|194|205|210|169|203|200|198|201|205"))
        if prompt then Exec.FireProximity(prompt) end
    end

    if HasFireTouch then
        Exec.FireTouch(HumanoidRootPart, part, 0)
        task.wait(0.01)
        Exec.FireTouch(HumanoidRootPart, part, 1)
    end

    FireRemote(_S("101|216|202|209|209"))
    FireRemote(_S("111|226|215|222|223"))
    FireRemote(_S("70|179|167|184|177|171|186"))
    FireRemote(_S("106|222|220|203|206|207"))
    FireRemote(_S("90|189|187|205|194"))
    FireRemote(_S("73|182|184|183|174|194"))
    FireRemote(_S("93|208|194|201|201|190|201|201"))
    FireRemote(_S("111|226|212|219|219|206|208|219|219"))

    State.SellCount = State.SellCount + 1

    return true
end

local function StartAutoFarm()
    if State.FarmConnection then return end
    AddLog(_S("112|177|229|228|223|144|182|209|226|221|144|195|196|177|194|196|181|180"))

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
                    State.CurrentTarget = _S("72|155|173|169|186|171|176|177|182|175|118|118|118")
                end
            end
            task.wait(Config.FarmDelay)
        end
    end)
end

local function StopAutoFarm()
    State.FarmConnection = nil
    State.CurrentTarget = _S("95|173|206|205|196")
    AddLog(_S("80|145|197|196|191|112|150|177|194|189|112|163|164|159|160|160|149|148"))
end

local function StartAutoSell()
    if State.SellConnection then return end
    AddLog(_S("77|142|194|193|188|109|160|178|185|185|109|160|161|142|159|161|146|145"))

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
    AddLog(_S("92|157|209|208|203|124|175|193|200|200|124|175|176|171|172|172|161|160"))
end

local function StartAutoUpgrade()
    if State.UpgradeConn then return end
    AddLog(_S("101|166|218|217|212|133|186|213|204|215|198|201|202|133|184|185|166|183|185|170|169"))

    State.UpgradeConn = true
    task.spawn(function()
        while Config.AutoUpgrade and State.UpgradeConn do
            FireRemote(_S("105|222|217|208|219|202|205|206"))
            FireRemote(_S("68|166|185|189"))
            FireRemote(_S("87|199|204|201|186|191|184|202|188"))
            FireRemote(_S("88|207|185|202|197|204|192"))
            FireRemote(_S("92|204|197|191|199|189|212|193"))
            FireRemote(_S("110|208|207|209|217|222|207|209|217"))
            FireRemote(_S("82|197|194|183|183|182"))
            FireRemote(_S("93|193|198|196"))

            State.UpgradeCount = State.UpgradeCount + 1
            task.wait(1)
        end
    end)
end

local function StopAutoUpgrade()
    State.UpgradeConn = nil
    AddLog(_S("65|130|182|181|176|97|150|177|168|179|162|165|166|97|148|149|144|145|145|134|133"))
end

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

            local highlight = Instance.new(_S("128|200|233|231|232|236|233|231|232|244"))
            highlight.Name = _S("95|164|178|175|190") .. rock.Name
            highlight.FillTransparency = 0.6
            highlight.OutlineTransparency = 0
            highlight.OutlineColor = rock.Value > 0 and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(100, 200, 255)
            highlight.FillColor = rock.Value > 0 and Color3.fromRGB(255, 200, 50) or Color3.fromRGB(80, 150, 255)
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = rock.Instance

            local billboard = Instance.new(_S("76|142|181|184|184|174|187|173|190|176|147|193|181"))
            billboard.Name = _S("103|172|186|183|179|200|201|204|211")
            billboard.Size = UDim2.new(0, 120, 0, 30)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = rock.Part

            local label = Instance.new(_S("126|210|227|246|242|202|223|224|227|234"))
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 0.4
            label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            label.Text = rock.Name .. " [" .. math.floor(rock.Distance) .. "m]" .. (rock.Value > 0 and (_S("127|159|251|159|163") .. tostring(rock.Value)) or "")
            label.TextColor3 = rock.Value > 0 and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(100, 200, 255)
            label.Font = Enum.Font.GothamBold
            label.TextSize = 11
            label.Parent = billboard

            local corner = Instance.new(_S("101|186|174|168|212|215|211|202|215"))
            corner.CornerRadius = UDim.new(0, 4)
            corner.Parent = label

            table.insert(State.ESPHighlights, highlight)
            table.insert(State.ESPHighlights, billboard)
        end
    end

    local shops = GetAllShops()
    for _, shop in ipairs(shops) do
        if shop.Instance and shop.Instance.Parent then
            local highlight = Instance.new(_S("60|132|165|163|164|168|165|163|164|176"))
            highlight.Name = _S("89|158|172|169|184|172|193|200|201|184") .. shop.Name
            highlight.FillTransparency = 0.5
            highlight.OutlineTransparency = 0
            highlight.OutlineColor = Color3.fromRGB(0, 255, 100)
            highlight.FillColor = Color3.fromRGB(50, 255, 100)
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = shop.Instance

            local billboard = Instance.new(_S("116|182|221|224|224|214|227|213|230|216|187|233|221"))
            billboard.Name = _S("129|198|212|209|212|233|240|241|205|226|227|230|237")
            billboard.Size = UDim2.new(0, 100, 0, 25)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = shop.Part

            local label = Instance.new(_S("66|150|167|186|182|142|163|164|167|174"))
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 0.4
            label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            label.Text = _S("124|207|196|203|204|182|156") .. shop.Name
            label.TextColor3 = Color3.fromRGB(0, 255, 100)
            label.Font = Enum.Font.GothamBold
            label.TextSize = 10
            label.Parent = billboard

            table.insert(State.ESPHighlights, highlight)
            table.insert(State.ESPHighlights, billboard)
        end
    end

    AddLog(_S("85|154|168|165|143|117") .. #rocks .. _S("127|159|241|238|226|234|242|171|159") .. #shops .. _S("92|124|207|196|203|204|207"))
end

local function StartESP()
    if Config.ESPEnabled then
        CreateESP()

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

local function StartAntiDamage()
    if State.AntiDamageConn then return end
    AddLog(_S("105|170|215|221|210|137|173|202|214|202|208|206|137|174|183|170|171|181|174|173"))

    State.AntiDamageConn = RunService.Heartbeat:Connect(function()
        if not GetCharacter() then return end

        if Humanoid and Humanoid.Health < Humanoid.MaxHealth then
            Humanoid.Health = Humanoid.MaxHealth
        end

        if Config.AntiFreeze then
            pcall(function()

                local warmthVal = Character:FindFirstChild(_S("76|163|173|190|185|192|180")) or Character:FindFirstChild(_S("124|208|225|233|236|225|238|221|240|241|238|225")) or Character:FindFirstChild(_S("75|142|186|183|175"))
                if warmthVal and warmthVal:IsA(_S("108|194|205|216|225|209|174|205|223|209")) then
                    warmthVal.Value = 100
                end

                local freezeVal = Character:FindFirstChild(_S("85|155|199|196|207|186|195")) or Character:FindFirstChild(_S("80|153|195|150|194|191|202|181|190")) or Character:FindFirstChild(_S("69|139|183|170|170|191|174|179|172"))
                if freezeVal and freezeVal:IsA(_S("66|132|177|177|174|152|163|174|183|167")) then
                    freezeVal.Value = false
                end

                FireRemote(_S("90|209|187|204|199|206|194"))
                FireRemote(_S("60|177|170|162|174|161|161|182|161"))
                FireRemote(_S("104|208|205|201|220"))
            end)
        end
    end)
end

local function StopAntiDamage()
    if State.AntiDamageConn then
        State.AntiDamageConn:Disconnect()
        State.AntiDamageConn = nil
    end
    AddLog(_S("81|146|191|197|186|113|149|178|190|178|184|182|113|149|154|164|146|147|157|150|149"))
end

local function ApplyUnlimitedBackpack()
    if not Config.UnlimitedBackpack then return end
    AddLog(_S("120|185|232|232|228|241|225|230|223|152|205|230|228|225|229|225|236|221|220|152|186|217|219|227|232|217|219|227|166|166|166"))

    pcall(function()

        local backpackStats = LocalPlayer:FindFirstChild(_S("86|152|183|185|193|198|183|185|193|153|183|198|183|185|191|202|207")) or LocalPlayer:FindFirstChild(_S("89|166|186|209|156|186|203|203|210")) or LocalPlayer:FindFirstChild(_S("128|195|225|242|242|249|203|199"))
        if backpackStats and backpackStats:IsA(_S("98|184|195|206|215|199|164|195|213|199")) then
            backpackStats.Value = 999999
        end

        local leaderstats = LocalPlayer:FindFirstChild(_S("70|178|171|167|170|171|184|185|186|167|186|185"))
        if leaderstats then
            for _, stat in ipairs(leaderstats:GetChildren()) do
                local nameLower = string.lower(stat.Name)
                if string.find(nameLower, _S("122|220|219|221|229|234|219|221|229")) or string.find(nameLower, _S("129|228|226|243|243|250")) or string.find(nameLower, _S("82|181|179|194|179|181|187|198|203")) or string.find(nameLower, _S("86|205|187|191|189|190|202")) or string.find(nameLower, "kg") then
                    if stat:IsA(_S("74|160|171|182|191|175|140|171|189|175")) then
                        stat.Value = 999999
                    end
                end
            end
        end

        FireRemote(_S("122|220|219|221|229|234|219|221|229"))
        FireRemote(_S("123|222|220|235|220|222|228|239|244"))
        FireRemote(_S("78|177|175|192|192|199"))
        FireRemote(_S("121|238|233|224|235|218|221|222|216|219|218|220|228|233|218|220|228"))
    end)

    task.spawn(function()
        while Config.UnlimitedBackpack do
            task.wait(2)
            pcall(function()
                local leaderstats = LocalPlayer:FindFirstChild(_S("110|218|211|207|210|211|224|225|226|207|226|225"))
                if leaderstats then
                    for _, stat in ipairs(leaderstats:GetChildren()) do
                        local nameLower = string.lower(stat.Name)
                        if string.find(nameLower, _S("60|158|157|159|167|172|157|159|167")) or string.find(nameLower, _S("74|173|171|188|188|195")) or string.find(nameLower, _S("92|191|189|204|189|191|197|208|213")) or string.find(nameLower, _S("117|236|218|222|220|221|233")) or string.find(nameLower, "kg") then
                            if stat:IsA(_S("69|155|166|177|186|170|135|166|184|170")) then
                                stat.Value = 999999
                            end
                        end
                    end
                end
            end)
        end
    end)
end

local function ApplyUnlimitedLuck()
    if not Config.UnlimitedLuck then return end
    AddLog(_S("73|138|185|185|181|194|178|183|176|105|158|183|181|178|182|178|189|174|173|105|149|190|172|180|119|119|119"))

    pcall(function()

        local luckVal = LocalPlayer:FindFirstChild(_S("87|163|204|186|194")) or LocalPlayer:FindFirstChild(_S("79|147|184|182|155|196|178|186")) or LocalPlayer:FindFirstChild(_S("85|162|190|195|190|195|188|161|202|184|192"))
        if luckVal and luckVal:IsA(_S("129|215|226|237|246|230|195|226|244|230")) then
            luckVal.Value = 999999
        end

        local leaderstats = LocalPlayer:FindFirstChild(_S("85|193|186|182|185|186|199|200|201|182|201|200"))
        if leaderstats then
            for _, stat in ipairs(leaderstats:GetChildren()) do
                local nameLower = string.lower(stat.Name)
                if string.find(nameLower, _S("61|169|178|160|168")) then
                    if stat:IsA(_S("129|215|226|237|246|230|195|226|244|230")) then
                        stat.Value = 999999
                    end
                end
            end
        end

        FireRemote(_S("79|187|196|178|186"))
        FireRemote(_S("96|204|213|195|203|217"))
        FireRemote(_S("110|210|215|213|205|218|227|209|217"))
    end)

    task.spawn(function()
        while Config.UnlimitedLuck do
            task.wait(2)
            pcall(function()
                local leaderstats = LocalPlayer:FindFirstChild(_S("99|207|200|196|199|200|213|214|215|196|215|214"))
                if leaderstats then
                    for _, stat in ipairs(leaderstats:GetChildren()) do
                        if string.find(string.lower(stat.Name), _S("99|207|216|198|206")) and stat:IsA(_S("74|160|171|182|191|175|140|171|189|175")) then
                            stat.Value = 999999
                        end
                    end
                end
            end)
        end
    end)
end

local function DupeItems(amount)
    AddLog(_S("107|172|223|223|208|216|219|223|212|217|210|139|223|218|139|207|224|219|208|139") .. amount .. _S("88|120|193|204|189|197|203|134|134|134"))

    pcall(function()

        for i = 1, amount do
            FireRemote(_S("72|171|183|180|180|173|171|188"))
            FireRemote(_S("122|231|227|232|223"))
            FireRemote(_S("74|178|171|188|192|175|189|190"))
            FireRemote(_S("73|185|178|172|180|190|185"))
            FireRemote(_S("84|187|181|200|188|185|198"))
            FireRemote(_S("64|172|175|175|180"))
            FireRemote(_S("66|177|164|182|163|171|176"))
            FireRemote(_S("95|198|209|192|205|211"))
            FireRemote(_S("94|208|195|213|191|208|194"))
            task.wait(0.05)
        end

        local leaderstats = LocalPlayer:FindFirstChild(_S("122|230|223|219|222|223|236|237|238|219|238|237"))
        if leaderstats then
            for _, stat in ipairs(leaderstats:GetChildren()) do
                local nameLower = string.lower(stat.Name)
                if string.find(nameLower, _S("121|220|235|242|236|237|218|229")) or string.find(nameLower, _S("109|220|223|210")) or string.find(nameLower, _S("66|169|167|175")) or string.find(nameLower, _S("72|177|188|173|181")) then
                    if stat:IsA(_S("123|201|240|232|221|224|237|209|220|231|240|224")) or stat:IsA(_S("86|159|196|202|172|183|194|203|187")) then
                        stat.Value = stat.Value * amount
                    end
                end
            end
        end

        for i = 1, amount do
            FireRemote(_S("119|234|220|227|227"))
            task.wait(0.02)
            FireRemote(_S("69|167|186|190"))
            task.wait(0.02)
        end

        local rocks = GetAllRocks()
        if #rocks > 0 then
            local bestRock = rocks[1]
            for i = 1, amount do
                for _, remote in ipairs(State.RemoteCache) do
                    local rName = string.lower(remote.Name)
                    if string.find(rName, _S("122|221|233|230|230|223|221|238")) or string.find(rName, _S("130|242|235|229|237|247|242")) or string.find(rName, _S("122|230|233|233|238")) then
                        pcall(function()
                            if remote.Type == _S("128|210|229|237|239|244|229|197|246|229|238|244") then
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
    AddLog(_S("98|166|215|210|199|130|195|214|214|199|207|210|214|130|197|209|207|210|206|199|214|199|156|130") .. amount .. "x")
end

local function StartNoclip()
    if State.NoclipConn then return end
    AddLog(_S("94|172|205|193|202|199|206|126|163|172|159|160|170|163|162"))

    State.NoclipConn = RunService.Stepped:Connect(function()
        if not Config.Noclip then return end
        if not GetCharacter() then return end
        for _, part in ipairs(Character:GetDescendants()) do
            if part:IsA(_S("127|193|224|242|228|207|224|241|243")) then
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
    AddLog(_S("76|154|187|175|184|181|188|108|144|149|159|141|142|152|145|144"))
end

local flyBody = nil
local flySpeed = nil

local function StartFly()
    if State.FlyConn then return end
    if not GetCharacter() then return end
    AddLog(_S("87|157|195|208|119|156|165|152|153|163|156|155"))

    flyBody = Instance.new(_S("71|137|182|171|192|157|172|179|182|170|176|187|192"))
    flyBody.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    flyBody.Velocity = Vector3.new(0, 0, 0)
    flyBody.Parent = HumanoidRootPart

    flySpeed = Instance.new(_S("72|138|183|172|193|143|193|186|183"))
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
    AddLog(_S("103|173|211|224|135|171|176|186|168|169|179|172|171"))
end

local function ApplySpeedBoost()
    if not GetCharacter() then return end
    if Config.SpeedBoost then
        Humanoid.WalkSpeed = Config.WalkSpeed
    else
        Humanoid.WalkSpeed = 16
    end
end

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
    if State.InfiniteJumpConn then State.InfiniteJumpConn:Disconnect() State.InfiniteJumpConn = nil end
    if State.ClickTPConn then State.ClickTPConn:Disconnect() State.ClickTPConn = nil end
    if State.WarmthKeeperConn then State.WarmthKeeperConn:Disconnect() State.WarmthKeeperConn = nil end
    if State.DropCollectConn then State.DropCollectConn = nil end
    AddLog(_S("70|150|135|148|143|137|128|102|135|178|178|102|172|171|167|186|187|184|171|185|102|185|186|181|182|182|171|170"))
end

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
                        State.CurrentTarget = _S("123|206|224|231|231|228|233|226|169|169|169")
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
                        State.CurrentTarget = _S("114|197|215|211|228|213|218|219|224|217|160|160|160")
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
    AddLog(_S("96|179|205|193|210|212|128|172|207|207|208|128|179|180|175|176|176|165|164"))
end

local function SerializeArg(arg)
    local t = typeof(arg)
    if t == _S("65|138|175|180|181|162|175|164|166") then return arg:GetFullName()
    elseif t == _S("75|161|176|174|191|186|189|126") then return string.format(_S("88|174|189|187|204|199|202|139|128|125|134|137|190|132|125|134|137|190|132|125|134|137|190|129"), arg.X, arg.Y, arg.Z)
    elseif t == _S("87|154|157|201|184|196|188") then return _S("126|193|196|240|223|235|227")
    elseif t == _S("63|179|160|161|171|164") then return _S("97|213|194|195|205|198")
    else return tostring(arg) end
end

local function AddRemoteSpyLog(remoteName, remoteType, args)
    local argStr = ""
    for i, a in ipairs(args) do
        argStr = argStr .. (i > 1 and ", " or "") .. SerializeArg(a)
    end
    local entry = os.date(_S("113|150|185|171|150|190|171|150|196")) .. _S("69|101|193|101") .. remoteType .. _S("108|140|232|140") .. remoteName .. "(" .. argStr .. ")"
    table.insert(State.RemoteSpyLogs, 1, entry)
    if #State.RemoteSpyLogs > 40 then table.remove(State.RemoteSpyLogs) end
    State.LastRemoteFire = entry
    if RemoteSpyList then
        pcall(function()
            ClearScrollList(RemoteSpyList)
            for i, log in ipairs(State.RemoteSpyLogs) do
                if i > 20 then break end
                local lbl = Instance.new(_S("90|174|191|210|206|166|187|188|191|198"))
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

local function StartRemoteSpy()
    if not Exec.HasHookMeta then
        AddLog(_S("80|162|181|189|191|196|181|112|163|192|201|112|197|190|177|198|177|185|188|177|178|188|181|112|191|190|112|196|184|185|195|112|181|200|181|179|197|196|191|194"))
        return
    end
    RemoteSpyActive = true
    AddLog(_S("65|147|166|174|176|181|166|97|148|177|186|97|134|143|130|131|141|134|133"))
end

local function StopRemoteSpy()
    RemoteSpyActive = false
    Config.RemoteSpy = false
    AddLog(_S("86|168|187|195|197|202|187|118|169|198|207|118|154|159|169|151|152|162|155|154"))
end

local function FireCustomRemote()
    if Config.CustomRemoteName == "" then
        AddLog(_S("66|135|176|182|167|180|98|163|98|180|167|175|177|182|167|98|176|163|175|167|98|168|171|180|181|182"))
        return
    end
    local args = {}
    if Config.CustomRemoteArgs ~= "" then
        for token in string.gmatch(Config.CustomRemoteArgs, _S("121|212|215|165|214|164")) do
            local piece = string.gsub(token, _S("111|205|148|226|153|151|157|156|152|148|226|153|147"), "%1")
            local num = tonumber(piece)
            if num then
                table.insert(args, num)
            elseif piece == _S("70|186|184|187|171") then
                table.insert(args, true)
            elseif piece == _S("104|206|201|212|219|205") then
                table.insert(args, false)
            else
                table.insert(args, piece)
            end
        end
    end
    if FireRemoteExact(Config.CustomRemoteName, Exec.Unpack(args)) then
        AddLog(_S("93|163|198|207|194|193|125|194|213|190|192|209|151|125") .. Config.CustomRemoteName)
    else
        FireRemote(Config.CustomRemoteName, Exec.Unpack(args))
        AddLog(_S("60|130|165|174|161|160|92|172|157|176|176|161|174|170|118|92") .. Config.CustomRemoteName)
    end
end

local function StartInfiniteJump()
    if State.InfiniteJumpConn then return end
    State.InfiniteJumpConn = UserInputService.JumpRequest:Connect(function()
        if Config.InfiniteJump and GetCharacter() and Humanoid then
            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
    AddLog(_S("118|191|228|220|223|228|223|234|219|150|192|235|227|230|150|187|196|183|184|194|187|186"))
end

local function StopInfiniteJump()
    if State.InfiniteJumpConn then
        State.InfiniteJumpConn:Disconnect()
        State.InfiniteJumpConn = nil
    end
end

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
    AddLog(_S("76|143|184|181|175|183|108|160|156|108|145|154|141|142|152|145|144|108|116|143|192|190|184|119|143|184|181|175|183|117"))
end

local function StopClickTeleport()
    if State.ClickTPConn then
        State.ClickTPConn:Disconnect()
        State.ClickTPConn = nil
    end
end

local function SaveWaypoint(name)
    if not GetCharacter() then return end
    State.Waypoints[name] = HumanoidRootPart.Position
    AddLog(_S("122|205|219|240|223|222|154|241|219|243|234|233|227|232|238|180|154") .. name)
end

local function TeleportToWaypoint(name)
    local pos = State.Waypoints[name]
    if pos then
        TeleportTo(pos)
        AddLog(_S("129|213|209|161|248|226|250|241|240|234|239|245|187|161") .. name)
    else
        AddLog(_S("81|168|178|202|193|192|186|191|197|113|191|192|197|113|183|192|198|191|181|139|113") .. name)
    end
end

local function StartAntiAFK()
    if State.AntiAFKConn then return end
    local vu = game:GetService(_S("101|187|206|215|217|218|198|209|186|216|202|215"))
    State.AntiAFKConn = LocalPlayer.Idled:Connect(function()
        if Config.AntiAFK then
            pcall(function() vu:CaptureController(); vu:ClickButton2(Vector2.new(0, 0)) end)
        end
    end)
    AddLog(_S("93|158|203|209|198|138|158|163|168|125|162|171|158|159|169|162|161"))
end

local function StopAntiAFK()
    if State.AntiAFKConn then
        State.AntiAFKConn:Disconnect()
        State.AntiAFKConn = nil
    end
end

local function StartWarmthKeeper()
    if State.WarmthKeeperConn then return end
    State.WarmthKeeperConn = RunService.Heartbeat:Connect(function()
        if not Config.WarmthKeeper and not Config.StaminaKeeper then return end
        if not GetCharacter() then return end
        pcall(function()
            if Config.WarmthKeeper then
                for _, name in ipairs({_S("98|185|195|212|207|214|202"), _S("84|168|185|193|196|185|198|181|200|201|198|185"), _S("119|186|230|227|219"), _S("117|189|218|214|233"), _S("110|197|207|224|219")}) do
                    local v = Character:FindFirstChild(name) or LocalPlayer:FindFirstChild(name)
                    if v and v:IsA(_S("82|168|179|190|199|183|148|179|197|183")) then v.Value = 100 end
                end
                FireRemote(_S("125|244|222|239|234|241|229")); FireRemote(_S("77|181|178|174|193")); FireRemote(_S("66|165|163|175|178|168|171|180|167"))
            end
            if Config.StaminaKeeper then
                for _, name in ipairs({_S("69|152|185|166|178|174|179|166"), _S("121|190|231|222|235|224|242"), _S("66|133|174|171|175|164"), _S("80|159|200|201|183|181|190"), _S("62|128|176|163|159|178|166")}) do
                    local v = Character:FindFirstChild(name) or LocalPlayer:FindFirstChild(name)
                    if v and v:IsA(_S("102|188|199|210|219|203|168|199|217|203")) then v.Value = 100 end
                end
            end
        end)
    end)
    AddLog(_S("127|214|224|241|236|243|231|174|210|243|224|236|232|237|224|159|202|228|228|239|228|241|159|196|205|192|193|203|196|195"))
end

local function StopWarmthKeeper()
    if State.WarmthKeeperConn then
        State.WarmthKeeperConn:Disconnect()
        State.WarmthKeeperConn = nil
    end
end

local function ClearTracers()
    for _, obj in ipairs(State.TracerObjects) do
        pcall(function() obj:Destroy() end)
    end
    State.TracerObjects = {}
end

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
        local att0 = Instance.new(_S("123|188|239|239|220|222|227|232|224|233|239"))
        att0.Parent = HumanoidRootPart
        local att1 = Instance.new(_S("89|154|205|205|186|188|193|198|190|199|205"))
        att1.Parent = t.Part
        local beam = Instance.new(_S("72|138|173|169|181"))
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

local function ClearPlayerESP()
    for _, obj in ipairs(State.PlayerESPObjects) do
        pcall(function() obj:Destroy() end)
    end
    State.PlayerESPObjects = {}
end

local function UpdatePlayerESP()
    if not Config.PlayerESP then ClearPlayerESP() return end
    ClearPlayerESP()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local hrp = plr.Character:FindFirstChild(_S("114|186|231|223|211|224|225|219|214|196|225|225|230|194|211|228|230"))
            if hrp then
                local hl = Instance.new(_S("63|135|168|166|167|171|168|166|167|179"))
                hl.FillTransparency = 0.7
                hl.OutlineColor = Color3.fromRGB(255, 80, 80)
                hl.FillColor = Color3.fromRGB(255, 50, 50)
                hl.Parent = plr.Character
                local bb = Instance.new(_S("66|132|171|174|174|164|177|163|180|166|137|183|171"))
                bb.Size = UDim2.new(0, 100, 0, 24)
                bb.StudsOffset = Vector3.new(0, 3, 0)
                bb.AlwaysOnTop = true
                bb.Parent = hrp
                local lbl = Instance.new(_S("84|168|185|204|200|160|181|182|185|192"))
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

local function ClearChestESP()
    for _, obj in ipairs(State.ChestESPObjects) do
        pcall(function() obj:Destroy() end)
    end
    State.ChestESPObjects = {}
end

local function UpdateChestESP()
    if not Config.ChestESP then ClearChestESP() return end
    ClearChestESP()
    local patterns = {_S("123|222|227|224|238|239"), _S("69|168|183|166|185|170"), _S("121|222|239|222|231|237"), _S("63|166|168|165|179"), _S("118|230|232|219|233|219|228|234"), _S("117|233|231|218|214|232|234|231|218"), _S("107|221|208|226|204|221|207")}
    for _, d in ipairs(Workspace:GetDescendants()) do
        if d:IsA(_S("129|206|240|229|230|237")) or d:IsA(_S("82|148|179|197|183|162|179|196|198")) then
            local nl = string.lower(d.Name)
            for _, p in ipairs(patterns) do
                if string.find(nl, p) then
                    local part = d:IsA(_S("123|189|220|238|224|203|220|237|239")) and d or d:FindFirstChildWhichIsA(_S("72|138|169|187|173|152|169|186|188"))
                    if part then
                        local hl = Instance.new(_S("87|159|192|190|191|195|192|190|191|203"))
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
    AddLog(_S("102|172|219|210|210|200|216|207|205|206|218|134|181|180"))
end

local function RestoreFullbright()
    if not State.FullbrightApplied then return end
    for k, v in pairs(State.SavedLighting) do
        pcall(function() Lighting[k] = v end)
    end
    State.FullbrightApplied = false
    AddLog(_S("62|132|179|170|170|160|176|167|165|166|178|94|141|132|132"))
end

local function ApplyHidePlayers()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            for _, p in ipairs(plr.Character:GetDescendants()) do
                if p:IsA(_S("93|159|190|208|194|173|190|207|209")) then p.LocalTransparencyModifier = Config.HideOtherPlayers and 1 or 0 end
            end
        end
    end
end

local function ApplyFPSBooster()
    if not Config.FPSBooster then return end
    pcall(function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        for _, d in ipairs(Workspace:GetDescendants()) do
            if d:IsA(_S("115|195|212|229|231|220|214|223|216|184|224|220|231|231|216|229")) or d:IsA(_S("61|145|175|158|166|169")) or d:IsA(_S("102|185|211|213|209|203")) or d:IsA(_S("93|163|198|207|194")) then
                d.Enabled = false
            end
        end
        Lighting.GlobalShadows = false
    end)
    AddLog(_S("76|146|156|159|108|142|187|187|191|192|177|190|108|173|188|188|184|181|177|176"))
end

local function ConfigToTable()
    local t = {}
    for k, v in pairs(Config) do t[k] = v end
    return t
end

local function ApplyConfigTable(t)
    if type(t) ~= _S("102|218|199|200|210|203") then return false end
    for k, v in pairs(t) do
        if Config[k] ~= nil then Config[k] = v end
    end
    return true
end

local function SaveConfig()
    local ok, json = pcall(function() return HttpService:JSONEncode(ConfigToTable()) end)
    if not ok then AddLog(_S("117|184|228|227|219|222|220|149|232|214|235|218|149|219|214|222|225|218|217")) return end
    if Exec.WriteFile(_S("107|184|212|217|208|204|184|218|224|217|223|204|212|217|202|174|218|217|209|212|210|153|213|222|218|217"), json) then
        AddLog(_S("111|178|222|221|213|216|214|143|226|208|229|212|211|143|227|222|143|213|216|219|212"))
    elseif Exec.HasClipboard then
        Exec.SetClipboard(json)
        AddLog(_S("113|180|224|223|215|218|216|145|212|224|225|218|214|213|145|229|224|145|212|221|218|225|211|224|210|227|213"))
    else
        AddLog(_S("63|146|160|181|164|95|180|173|160|181|160|168|171|160|161|171|164|95|103|173|174|95|182|177|168|179|164|165|168|171|164|110|162|171|168|175|161|174|160|177|163|104"))
    end
end

local function LoadConfig()
    local json = Exec.ReadFile(_S("74|151|179|184|175|171|151|185|191|184|190|171|179|184|169|141|185|184|176|179|177|120|180|189|185|184"))
    if json then
        local ok, data = pcall(function() return HttpService:JSONDecode(json) end)
        if ok and ApplyConfigTable(data) then
            AddLog(_S("114|181|225|224|216|219|217|146|222|225|211|214|215|214|146|216|228|225|223|146|216|219|222|215"))
            return true
        end
    end
    AddLog(_S("75|153|186|107|190|172|193|176|175|107|174|186|185|177|180|178|107|177|186|192|185|175"))
    return false
end

local function DoServerHop()
    AddLog(_S("126|209|227|240|244|227|240|158|230|237|238|238|231|236|229|172|172|172"))
    pcall(function()
        local body = Exec.HttpGet(_S("125|229|241|241|237|240|183|172|172|228|222|234|226|240|171|239|236|223|233|236|245|171|224|236|234|172|243|174|172|228|222|234|226|240|172") .. game.PlaceId .. _S("90|137|205|191|204|208|191|204|205|137|170|207|188|198|195|189|153|205|201|204|206|169|204|190|191|204|151|155|205|189|128|198|195|199|195|206|151|139|138|138"))
        if not body then error(_S("101|173|217|217|213|172|202|217|133|203|198|206|209|202|201")) end
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
        content = _S("108|150|150|199|185|213|218|209|205|140|185|219|225|218|224|205|213|218|201|150|150|140|185|213|218|209|208|166|140") .. itemName .. _S("115|147|239|147|199|226|231|212|223|173|147") .. State.FarmCount,
    })
end

local function SendSellLog()
    if not Config.WebhookSell then return end
    SendWebhook({
        content = _S("124|166|166|215|201|229|234|225|221|156|201|235|241|234|240|221|229|234|217|166|166|156|207|235|232|224|156|229|240|225|233|239|156|248|156|208|235|240|221|232|156|239|225|232|232|239|182|156") .. State.SellCount,
    })
end

local function SendStatsLog()
    if not Config.WebhookStats then return end
    SendWebhook({
        content = _S("127|169|169|218|204|232|237|228|224|159|204|238|244|237|243|224|232|237|159|210|243|224|243|242|220|169|169|159|204|232|237|228|227|185|159") .. State.FarmCount .. _S("78|110|202|110|161|179|186|186|193|136|110") .. State.SellCount .. _S("85|117|209|117|153|202|197|186|200|143|117") .. State.DupeCount .. _S("100|132|224|132|184|197|214|203|201|216|158|132") .. State.CurrentTarget,
    })
end

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

local ScreenGui, MainFrame, MinimizedFrame, IsMobile, ToggleGUI
local GUIWidth, MinimizedSize, MinimizedPosition, HeaderH, ContentTitle
local TabFrames, TabButtons, TabIndicators, MinimizeBtn, ExpandBtn
local Tabs, TabInfo, layoutOrder

local function BuildGUIShell()
    ScreenGui = Instance.new(_S("69|152|168|183|170|170|179|140|186|174"))
ScreenGui.Name = _S("75|152|180|185|176|172|152|186|192|185|191|172|180|185|161|130")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

ScreenGui.DisplayOrder = 999

Exec.ProtectGui(ScreenGui)
pcall(function() ScreenGui.Parent = Exec.GetGuiParent() end)
if not ScreenGui.Parent then
    pcall(function() ScreenGui.Parent = LocalPlayer:WaitForChild(_S("79|159|187|176|200|180|193|150|196|184")) end)
end

local Camera = Workspace.CurrentCamera or Workspace:WaitForChild(_S("122|189|219|231|223|236|219"), 10)
local ViewSize = Camera and Camera.ViewportSize or Vector2.new(428, 926)
IsMobile = UserInputService.TouchEnabled or ViewSize.X < 900
local SidebarW = IsMobile and 0 or 175
GUIWidth = IsMobile and UDim2.new(1, -20, 1, -36) or UDim2.new(0, 700, 0, 440)
MinimizedSize = UDim2.new(0, IsMobile and 140 or 160, 0, 44)
local GUIPosition = IsMobile and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0.5, -350, 0.5, -220)
MinimizedPosition = IsMobile and UDim2.new(1, -150, 1, -60) or GUIPosition
local MobileTabH = 56
HeaderH = IsMobile and 46 or 54

MainFrame = Instance.new(_S("106|176|220|203|215|207"))
MainFrame.Name = _S("72|149|169|177|182|142|186|169|181|173")
MainFrame.Size = GUIWidth
MainFrame.Position = GUIPosition
MainFrame.AnchorPoint = IsMobile and Vector2.new(0.5, 0.5) or Vector2.new(0, 0)
MainFrame.BackgroundColor3 = Theme.Bg
MainFrame.BackgroundTransparency = 0.05
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new(_S("123|208|196|190|234|237|233|224|237"))
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new(_S("119|204|192|202|235|233|230|226|220"))
MainStroke.Color = Theme.Accent
MainStroke.Thickness = 1
MainStroke.Transparency = 0.65
MainStroke.Parent = MainFrame

local Header = Instance.new(_S("84|154|198|181|193|185"))
Header.Name = _S("93|165|194|190|193|194|207")
Header.Size = UDim2.new(1, 0, 0, HeaderH)
Header.BackgroundColor3 = Theme.Sidebar
Header.BorderSizePixel = 0
Header.ZIndex = 5
Header.Parent = MainFrame

local HeaderLine = Instance.new(_S("101|171|215|198|210|202"))
HeaderLine.Size = UDim2.new(1, 0, 0, 1)
HeaderLine.Position = UDim2.new(0, 0, 1, -1)
HeaderLine.BackgroundColor3 = Theme.Accent
HeaderLine.BackgroundTransparency = 0.5
HeaderLine.BorderSizePixel = 0
HeaderLine.ZIndex = 6
HeaderLine.Parent = Header

local LogoMark = Instance.new(_S("74|158|175|194|190|150|171|172|175|182"))
LogoMark.Size = UDim2.new(0, 36, 0, 36)
LogoMark.Position = UDim2.new(0, 14, 0.5, -18)
LogoMark.BackgroundColor3 = Theme.Accent
LogoMark.Text = "M"
LogoMark.TextColor3 = Color3.fromRGB(10, 10, 12)
LogoMark.Font = Enum.Font.GothamBlack
LogoMark.TextSize = 22
LogoMark.ZIndex = 6
LogoMark.Parent = Header
local logoC = Instance.new(_S("72|157|145|139|183|186|182|173|186"))
logoC.CornerRadius = UDim.new(0, 8)
logoC.Parent = LogoMark

local EditionLabel = Instance.new(_S("68|152|169|188|184|144|165|166|169|176"))
EditionLabel.Size = UDim2.new(0, 100, 0, 14)
EditionLabel.Position = UDim2.new(0, 56, 0, 12)
EditionLabel.BackgroundTransparency = 1
EditionLabel.Text = _S("60|137|133|138|161|157|92|129|128|133|144|133|139|138")
EditionLabel.TextColor3 = Theme.Accent
EditionLabel.Font = Enum.Font.GothamBold
EditionLabel.TextSize = 10
EditionLabel.TextXAlignment = Enum.TextXAlignment.Left
EditionLabel.ZIndex = 6
EditionLabel.Parent = Header

EditionLabel.Visible = not IsMobile

local TitleLabel = Instance.new(_S("71|155|172|191|187|147|168|169|172|179"))
TitleLabel.Size = UDim2.new(IsMobile and 0.62 or 0.55, 0, 0, 22)
TitleLabel.Position = UDim2.new(IsMobile and 0.18 or 0.28, 0, 0, IsMobile and 6 or 10)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = _S("78|155|183|188|179|175|110|150|195|176|110|169|110|196|133|110|171")
TitleLabel.TextColor3 = Theme.Text
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = IsMobile and 14 or 17
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.ZIndex = 6
TitleLabel.Parent = Header

local SubtitleLabel = Instance.new(_S("114|198|215|234|230|190|211|212|215|222"))
SubtitleLabel.Size = UDim2.new(0.55, 0, 0, 16)
SubtitleLabel.Position = UDim2.new(0.28, 0, 0, 32)
SubtitleLabel.BackgroundTransparency = 1
SubtitleLabel.Text = "Mine a Mountain · " .. os.date(_S("98|135|163|142|130|135|164|130|135|198|130|135|187"))
SubtitleLabel.TextColor3 = Theme.SubText
SubtitleLabel.Font = Enum.Font.Gotham
SubtitleLabel.TextSize = 10
SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
SubtitleLabel.ZIndex = 6
SubtitleLabel.Parent = Header

SubtitleLabel.Visible = not IsMobile

local CloseBtn = Instance.new(_S("76|160|177|196|192|142|193|192|192|187|186"))
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

local MinimizeBtnSmall = Instance.new(_S("128|212|229|248|244|194|245|244|244|239|238"))
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

local Sidebar = Instance.new(_S("120|190|234|217|229|221"))
Sidebar.Name = _S("76|159|181|176|177|174|173|190")
Sidebar.Size = UDim2.new(0, SidebarW, 1, -(HeaderH + (IsMobile and MobileTabH or 0)))
Sidebar.Position = UDim2.new(0, 0, 0, HeaderH)
Sidebar.Visible = not IsMobile
Sidebar.BackgroundColor3 = Theme.Sidebar
Sidebar.BorderSizePixel = 0
Sidebar.ZIndex = 2
Sidebar.Parent = MainFrame

local SidebarLine = Instance.new(_S("62|132|176|159|171|163"))
SidebarLine.Size = UDim2.new(0, 1, 1, 0)
SidebarLine.Position = UDim2.new(1, -1, 0, 0)
SidebarLine.BackgroundColor3 = Theme.Accent
SidebarLine.BackgroundTransparency = 0.7
SidebarLine.BorderSizePixel = 0
SidebarLine.Parent = Sidebar

local TabList = Instance.new(_S("62|132|176|159|171|163"))
TabList.Size = UDim2.new(1, 0, 1, -8)
TabList.Position = UDim2.new(0, 0, 0, 4)
TabList.BackgroundTransparency = 1
TabList.Parent = Sidebar

local TabListLayout = Instance.new(_S("79|164|152|155|184|194|195|155|176|200|190|196|195"))
TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabListLayout.Padding = UDim.new(0, 4)
TabListLayout.Parent = TabList

local TabPad = Instance.new(_S("114|199|187|194|211|214|214|219|224|217"))
TabPad.PaddingTop = UDim.new(0, 6)
TabPad.PaddingLeft = UDim.new(0, 6)
TabPad.PaddingRight = UDim.new(0, 6)
TabPad.Parent = TabList

local ContentHeader = Instance.new(_S("80|150|194|177|189|181"))
ContentHeader.Size = IsMobile and UDim2.new(1, -16, 0, 28) or UDim2.new(1, -SidebarW - 16, 0, 36)
ContentHeader.Position = IsMobile and UDim2.new(0, 8, 0, HeaderH + 2) or UDim2.new(0, SidebarW + 8, 0, 62)
ContentHeader.BackgroundTransparency = 1
ContentHeader.Parent = MainFrame

ContentTitle = Instance.new(_S("70|154|171|190|186|146|167|168|171|178"))
ContentTitle.Size = UDim2.new(1, 0, 1, 0)
ContentTitle.BackgroundTransparency = 1
ContentTitle.Text = _S("65|136|166|175|166|179|162|173")
ContentTitle.TextColor3 = Theme.Text
ContentTitle.Font = Enum.Font.GothamBold
ContentTitle.TextSize = IsMobile and 14 or 15
ContentTitle.TextXAlignment = Enum.TextXAlignment.Left
ContentTitle.Parent = ContentHeader

local ContentArea = Instance.new(_S("106|176|220|203|215|207"))
ContentArea.Name = _S("92|159|203|202|208|193|202|208|157|206|193|189")
ContentArea.Size = IsMobile and UDim2.new(1, -16, 1, -(HeaderH + MobileTabH + 38)) or UDim2.new(1, -SidebarW - 16, 1, -108)
ContentArea.Position = IsMobile and UDim2.new(0, 8, 0, HeaderH + 32) or UDim2.new(0, SidebarW + 8, 0, 98)
ContentArea.BackgroundTransparency = 1
ContentArea.ClipsDescendants = true
ContentArea.Parent = MainFrame

Tabs = {_S("80|150|177|194|189"), _S("113|196|214|221|221"), _S("103|172|186|183"), _S("65|134|185|177|173|176|170|181"), _S("61|145|172|172|169|176"), _S("64|141|169|179|163")}
TabInfo = {
    Farm = {Icon = "⚙", Title = _S("69|140|170|179|170|183|166|177"), Sub = _S("102|167|219|218|213|134|211|207|212|203|134|140|134|204|199|216|211")},
    Sell = {Icon = "⚡", Title = _S("110|175|227|226|221|219|207|226|215|209"), Sub = _S("68|151|169|176|176|100|106|100|185|180|171|182|165|168|169|183")},
    ESP = {Icon = "👁", Title = _S("110|196|215|225|227|207|218|225"), Sub = _S("61|130|144|141|93|99|93|177|175|158|160|162|175|176")},
    Exploit = {Icon = "🎭", Title = _S("127|196|247|239|235|238|232|243|242"), Sub = _S("123|200|234|241|224|232|224|233|239|155|161|155|223|240|235|224|238")},
    Tools = {Icon = "🔧", Title = _S("108|192|219|219|216|223"), Sub = _S("88|171|200|209|120|126|120|207|185|209|200|199|193|198|204|203")},
    Misc = {Icon = "⚙", Title = _S("90|173|191|206|206|195|200|193|205"), Sub = _S("91|158|202|201|193|196|194|123|129|123|200|196|206|190")},
}
TabButtons = {}
TabFrames = {}
TabIndicators = {}

for i, tabName in ipairs(Tabs) do
    local info = TabInfo[tabName]
    local tabBtn = Instance.new(_S("99|183|200|219|215|165|216|215|215|210|209"))
    tabBtn.Name = tabName .. _S("124|208|221|222")
    tabBtn.Size = IsMobile and UDim2.new(1 / #Tabs, -3, 1, -4) or UDim2.new(1, 0, 0, 52)
    tabBtn.BackgroundColor3 = Theme.Panel
    tabBtn.BackgroundTransparency = tabName == _S("99|169|196|213|208") and 0 or 0.35
    tabBtn.BorderSizePixel = 0
    tabBtn.Text = ""
    tabBtn.AutoButtonColor = false
    tabBtn.LayoutOrder = i
    tabBtn.Parent = TabList

    local tCorner = Instance.new(_S("111|196|184|178|222|225|221|212|225"))
    tCorner.CornerRadius = UDim.new(0, 8)
    tCorner.Parent = tabBtn

    local icon = Instance.new(_S("103|187|204|223|219|179|200|201|204|211"))
    icon.Size = UDim2.new(0, 28, 0, 28)
    icon.Position = UDim2.new(0, 8, 0.5, -14)
    icon.BackgroundTransparency = 1
    icon.Text = info.Icon
    icon.TextColor3 = Theme.Accent
    icon.TextSize = 16
    icon.Font = Enum.Font.GothamBold
    icon.Parent = tabBtn

    local tTitle = Instance.new(_S("126|210|227|246|242|202|223|224|227|234"))
    tTitle.Size = UDim2.new(1, -44, 0, 18)
    tTitle.Position = UDim2.new(0, 38, 0, IsMobile and 6 or 8)
    tTitle.BackgroundTransparency = 1
    tTitle.Text = info.Title
    tTitle.TextColor3 = Theme.Text
    tTitle.Font = Enum.Font.GothamBold
    tTitle.TextSize = IsMobile and 10 or 12
    tTitle.TextXAlignment = Enum.TextXAlignment.Left
    tTitle.Parent = tabBtn

    local tSub = Instance.new(_S("112|196|213|232|228|188|209|210|213|220"))
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

    local indicator = Instance.new(_S("60|130|174|157|169|161"))
    indicator.Size = IsMobile and UDim2.new(0.65, 0, 0, 3) or UDim2.new(0, 3, 0.7, 0)
    indicator.Position = IsMobile and UDim2.new(0.175, 0, 0, 2) or UDim2.new(1, -4, 0.15, 0)
    indicator.BackgroundColor3 = Theme.Accent
    indicator.BorderSizePixel = 0
    indicator.Visible = (tabName == _S("75|145|172|189|184"))
    indicator.Parent = tabBtn
    local iC = Instance.new(_S("76|161|149|143|187|190|186|177|190"))
    iC.CornerRadius = UDim.new(1, 0)
    iC.Parent = indicator

    TabButtons[tabName] = tabBtn
    TabIndicators[tabName] = indicator

    local tabFrame = Instance.new(_S("105|188|204|219|216|213|213|210|215|208|175|219|202|214|206"))
    tabFrame.Name = tabName .. _S("115|182|226|225|231|216|225|231")
    tabFrame.Size = UDim2.new(1, 0, 1, 0)
    tabFrame.BackgroundTransparency = 1
    tabFrame.BorderSizePixel = 0
    tabFrame.ScrollBarThickness = IsMobile and 6 or 3
    tabFrame.ScrollBarImageColor3 = Theme.Accent
    tabFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    tabFrame.Visible = (tabName == _S("98|168|195|212|207"))
    tabFrame.Parent = ContentArea

    local tabLayout = Instance.new(_S("128|213|201|204|233|243|244|204|225|249|239|245|244"))
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabLayout.Padding = UDim.new(0, 6)
    tabLayout.Parent = tabFrame

    local tabPad = Instance.new(_S("68|153|141|148|165|168|168|173|178|171"))
    tabPad.PaddingTop = UDim.new(0, 4)
    tabPad.PaddingBottom = UDim.new(0, 8)
    tabPad.PaddingLeft = UDim.new(0, 2)
    tabPad.PaddingRight = UDim.new(0, 6)
    tabPad.Parent = tabFrame

    TabFrames[tabName] = tabFrame
end

local BottomBar
if IsMobile then
    BottomBar = Instance.new(_S("113|183|227|210|222|214"))
    BottomBar.Name = _S("120|186|231|236|236|231|229|204|217|218|186|217|234")
    BottomBar.Size = UDim2.new(1, 0, 0, MobileTabH)
    BottomBar.Position = UDim2.new(0, 0, 1, -MobileTabH)
    BottomBar.BackgroundColor3 = Theme.Sidebar
    BottomBar.BorderSizePixel = 0
    BottomBar.ZIndex = 4
    BottomBar.Parent = MainFrame

    local bottomLine = Instance.new(_S("130|200|244|227|239|231"))
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

if IsMobile then
    local ToggleGui = Instance.new(_S("64|147|163|178|165|165|174|135|181|169"))
    ToggleGui.Name = _S("72|149|177|182|173|169|149|183|170|177|180|173|156|183|175|175|180|173")
    ToggleGui.ResetOnSpawn = false
    ToggleGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ToggleGui.IgnoreGuiInset = true
    ToggleGui.DisplayOrder = 1000
    Exec.ProtectGui(ToggleGui)
    pcall(function() ToggleGui.Parent = Exec.GetGuiParent() end)
    if not ToggleGui.Parent then
        ToggleGui.Parent = LocalPlayer:WaitForChild(_S("82|162|190|179|203|183|196|153|199|187"))
    end

    local MobileToggleBtn = Instance.new(_S("75|159|176|195|191|141|192|191|191|186|185"))
    MobileToggleBtn.Name = _S("117|194|228|215|222|225|218|201|228|220|220|225|218")
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
    local mtC = Instance.new(_S("120|205|193|187|231|234|230|221|234"))
    mtC.CornerRadius = UDim.new(1, 0)
    mtC.Parent = MobileToggleBtn
    local mtS = Instance.new(_S("107|192|180|190|223|221|218|214|208"))
    mtS.Color = Theme.Accent
    mtS.Thickness = 2
    mtS.Transparency = 0.3
    mtS.Parent = MobileToggleBtn
    MobileToggleBtn.MouseButton1Click:Connect(ToggleGUI)
end

MinimizedFrame = Instance.new(_S("72|142|186|169|181|173"))
MinimizedFrame.Size = MinimizedSize
MinimizedFrame.Position = MinimizedPosition
MinimizedFrame.BackgroundColor3 = Theme.Bg
MinimizedFrame.BorderSizePixel = 0
MinimizedFrame.Visible = false
MinimizedFrame.Parent = ScreenGui
do
    local miniC = Instance.new(_S("129|214|202|196|240|243|239|230|243"))
    miniC.CornerRadius = UDim.new(0, 10)
    miniC.Parent = MinimizedFrame
    local miniS = Instance.new(_S("77|162|150|160|193|191|188|184|178"))
    miniS.Color = Theme.Accent
    miniS.Thickness = 1
    miniS.Transparency = 0.5
    miniS.Parent = MinimizedFrame
    local MiniLabel = Instance.new(_S("89|173|190|209|205|165|186|187|190|197"))
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

ExpandBtn = Instance.new(_S("112|196|213|232|228|178|229|228|228|223|222"))
ExpandBtn.Size = UDim2.new(0, 36, 0, 26)
ExpandBtn.Position = UDim2.new(1, -42, 0.5, -13)
ExpandBtn.BackgroundColor3 = Theme.Accent
ExpandBtn.Text = "□"
ExpandBtn.TextColor3 = Color3.fromRGB(10, 10, 12)
ExpandBtn.Font = Enum.Font.GothamBold
ExpandBtn.TextSize = 14
ExpandBtn.Parent = MinimizedFrame
do
    local expC = Instance.new(_S("109|194|182|176|220|223|219|210|223"))
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

layoutOrder = 0

local function CreateSectionHeader(parent, title)
    layoutOrder = layoutOrder + 1
    local wrap = Instance.new(_S("78|148|192|175|187|179"))
    wrap.Size = UDim2.new(1, 0, 0, 32)
    wrap.BackgroundTransparency = 1
    wrap.LayoutOrder = layoutOrder
    wrap.Parent = parent

    local line = Instance.new(_S("70|140|184|167|179|171"))
    line.Size = UDim2.new(1, 0, 0, 1)
    line.Position = UDim2.new(0, 0, 0, 0)
    line.BackgroundColor3 = Theme.Accent
    line.BackgroundTransparency = 0.35
    line.BorderSizePixel = 0
    line.Parent = wrap

    local keyIcon = Instance.new(_S("81|165|182|201|197|157|178|179|182|189"))
    keyIcon.Size = UDim2.new(0, 18, 0, 18)
    keyIcon.Position = UDim2.new(0, 0, 0, 8)
    keyIcon.BackgroundTransparency = 1
    keyIcon.Text = "🔑"
    keyIcon.TextSize = 12
    keyIcon.Parent = wrap

    local label = Instance.new(_S("91|175|192|211|207|167|188|189|192|199"))
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
    local frame = Instance.new(_S("107|177|221|204|216|208"))
    frame.Size = UDim2.new(1, 0, 0, IsMobile and 44 or 36)
    frame.BackgroundColor3 = Theme.Panel
    frame.BackgroundTransparency = 0.15
    frame.BorderSizePixel = 0
    frame.LayoutOrder = layoutOrder
    frame.Parent = parent

    local corner = Instance.new(_S("113|198|186|180|224|227|223|214|227"))
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    local stroke = Instance.new(_S("60|145|133|143|176|174|171|167|161"))
    stroke.Color = Theme.Accent
    stroke.Thickness = 1
    stroke.Transparency = 0.85
    stroke.Parent = frame

    local label = Instance.new(_S("97|181|198|217|213|173|194|195|198|205"))
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.Text
    label.Font = Enum.Font.Gotham
    label.TextSize = IsMobile and 11 or 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local check = Instance.new(_S("120|204|221|240|236|186|237|236|236|231|230"))
    check.Size = IsMobile and UDim2.new(0, 32, 0, 32) or UDim2.new(0, 20, 0, 20)
    check.Position = IsMobile and UDim2.new(1, -40, 0.5, -16) or UDim2.new(1, -30, 0.5, -10)
    check.BackgroundColor3 = default and Theme.Accent or Theme.Input
    check.BorderSizePixel = 0
    check.Text = default and "✓" or ""
    check.TextColor3 = Color3.fromRGB(10, 10, 12)
    check.Font = Enum.Font.GothamBold
    check.TextSize = 14
    check.Parent = frame
    local cC = Instance.new(_S("114|199|187|181|225|228|224|215|228"))
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
    local btn = Instance.new(_S("100|184|201|220|216|166|217|216|216|211|210"))
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

    local corner = Instance.new(_S("120|205|193|187|231|234|230|221|234"))
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    local stroke = Instance.new(_S("118|203|191|201|234|232|229|225|219"))
    stroke.Color = Theme.Accent
    stroke.Thickness = 1
    stroke.Transparency = 0.55
    stroke.Parent = btn

    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Theme.Input
        stroke.Transparency = 0.2
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Theme.Panel
        btn.BackgroundTransparency = 0.1
        stroke.Transparency = 0.55
    end)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

local function CreateSlider(parent, name, minVal, maxVal, defaultVal, callback)
    layoutOrder = layoutOrder + 1
    local frame = Instance.new(_S("112|182|226|209|221|213"))
    frame.Size = UDim2.new(1, 0, 0, IsMobile and 56 or 48)
    frame.BackgroundColor3 = Theme.Panel
    frame.BackgroundTransparency = 0.15
    frame.BorderSizePixel = 0
    frame.LayoutOrder = layoutOrder
    frame.Parent = parent

    local corner = Instance.new(_S("95|180|168|162|206|209|205|196|209"))
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    local label = Instance.new(_S("72|156|173|192|188|148|169|170|173|180"))
    label.Size = UDim2.new(0.7, 0, 0, 18)
    label.Position = UDim2.new(0, 12, 0, 6)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.SubText
    label.Font = Enum.Font.Gotham
    label.TextSize = IsMobile and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local valLabel = Instance.new(_S("92|176|193|212|208|168|189|190|193|200"))
    valLabel.Size = UDim2.new(0, 50, 0, 18)
    valLabel.Position = UDim2.new(1, -58, 0, 6)
    valLabel.BackgroundTransparency = 1
    valLabel.Text = tostring(defaultVal)
    valLabel.TextColor3 = Theme.Accent
    valLabel.Font = Enum.Font.GothamBold
    valLabel.TextSize = 11
    valLabel.TextXAlignment = Enum.TextXAlignment.Right
    valLabel.Parent = frame

    local sliderFrame = Instance.new(_S("87|157|201|184|196|188"))
    sliderFrame.Size = UDim2.new(1, -24, 0, 8)
    sliderFrame.Position = UDim2.new(0, 12, 0, 30)
    sliderFrame.BackgroundColor3 = Theme.Input
    sliderFrame.BorderSizePixel = 0
    sliderFrame.Parent = frame

    local sCorner = Instance.new(_S("84|169|157|151|195|198|194|185|198"))
    sCorner.CornerRadius = UDim.new(1, 0)
    sCorner.Parent = sliderFrame

    local pct = (defaultVal - minVal) / (maxVal - minVal)
    local fillBar = Instance.new(_S("125|195|239|222|234|226"))
    fillBar.Size = UDim2.new(pct, 0, 1, 0)
    fillBar.BackgroundColor3 = Theme.Accent
    fillBar.BorderSizePixel = 0
    fillBar.Parent = sliderFrame
    local fCorner = Instance.new(_S("125|210|198|192|236|239|235|226|239"))
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
    local frame = Instance.new(_S("118|188|232|215|227|219"))
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.BackgroundColor3 = Theme.Panel
    frame.BackgroundTransparency = 0.15
    frame.BorderSizePixel = 0
    frame.LayoutOrder = layoutOrder
    frame.Parent = parent

    local corner = Instance.new(_S("93|178|166|160|204|207|203|194|207"))
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    local label = Instance.new(_S("90|174|191|210|206|166|187|188|191|198"))
    label.Size = UDim2.new(0.38, 0, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.SubText
    label.Font = Enum.Font.Gotham
    label.TextSize = IsMobile and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local input = Instance.new(_S("125|209|226|245|241|191|236|245"))
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

    local iCorner = Instance.new(_S("67|152|140|134|178|181|177|168|181"))
    iCorner.CornerRadius = UDim.new(0, 6)
    iCorner.Parent = input

    local iStroke = Instance.new(_S("72|157|145|155|188|186|183|179|173"))
    iStroke.Color = Theme.Accent
    iStroke.Thickness = 1
    iStroke.Transparency = 0.75
    iStroke.Parent = input

    input.FocusLost:Connect(function()
        callback(input.Text)
    end)
    return frame, input
end

local function ResetLayoutOrder()
    layoutOrder = 0
end

local function UpdateStats()
    if StatsLabel then
        StatsLabel.Text = _S("95|172|200|205|196|195|153|127") .. State.FarmCount .. _S("83|115|207|115|166|184|191|191|198|141|115") .. State.SellCount .. _S("81|113|205|113|149|198|193|182|139|113") .. State.DupeCount .. _S("115|147|239|147|199|212|229|218|216|231|173|147") .. (State.CurrentTarget or _S("110|188|221|220|211"))
    end
    if CashLabel then
        CashLabel.Text = _S("75|142|172|190|179|133|107") .. GetPlayerCash() .. _S("78|110|202|110|165|179|183|181|182|194|136|110") .. math.floor(GetBackpackWeight()) .. "/" .. math.floor(GetBackpackCapacity())
    end
end

local function BuildFarmTab()
local farmTab = TabFrames[_S("121|191|218|235|230")]
ResetLayoutOrder()

CreateSectionHeader(farmTab, "📊 STATS")
layoutOrder = layoutOrder + 1
local StatsFrame = Instance.new(_S("109|179|223|206|218|210"))
StatsFrame.Size = UDim2.new(1, 0, 0, 52)
StatsFrame.BackgroundColor3 = Theme.Panel
StatsFrame.BackgroundTransparency = 0.1
StatsFrame.BorderSizePixel = 0
StatsFrame.LayoutOrder = layoutOrder
StatsFrame.Parent = farmTab

do
    local statsCorner = Instance.new(_S("74|159|147|141|185|188|184|175|188"))
    statsCorner.CornerRadius = UDim.new(0, 8)
    statsCorner.Parent = StatsFrame
    local statsStroke = Instance.new(_S("73|158|146|156|189|187|184|180|174"))
    statsStroke.Color = Theme.Accent
    statsStroke.Thickness = 1
    statsStroke.Transparency = 0.8
    statsStroke.Parent = StatsFrame
end

StatsLabel = Instance.new(_S("71|155|172|191|187|147|168|169|172|179"))
StatsLabel.Name = _S("116|199|232|213|232|231|200|217|236|232")
StatsLabel.Size = UDim2.new(1, -12, 0, 28)
StatsLabel.Position = UDim2.new(0, 10, 0, 4)
StatsLabel.BackgroundTransparency = 1
StatsLabel.Text = _S("102|179|207|212|203|202|160|134|150|134|226|134|185|203|210|210|217|160|134|150|134|226|134|186|199|216|205|203|218|160|134|180|213|212|203")
StatsLabel.TextColor3 = Theme.SubText
StatsLabel.Font = Enum.Font.Gotham
StatsLabel.TextSize = IsMobile and 9 or 10
StatsLabel.TextXAlignment = Enum.TextXAlignment.Left
StatsLabel.TextWrapped = true
StatsLabel.Parent = StatsFrame

CashLabel = Instance.new(_S("60|144|161|180|176|136|157|158|161|168"))
CashLabel.Name = _S("62|129|159|177|166|146|163|182|178")
CashLabel.Size = UDim2.new(1, -12, 0, 18)
CashLabel.Position = UDim2.new(0, 10, 0, 30)
CashLabel.BackgroundTransparency = 1
CashLabel.Text = _S("114|181|211|229|218|172|146|162|146|238|146|201|215|219|217|218|230|172|146|162|161|163|162|162")
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

CreateToggle(farmTab, _S("117|182|234|233|228|149|186|230|234|222|229|149|183|218|232|233|149|197|222|216|224|214|237|218"), false, function(val)
    Config.AutoEquipPickaxe = val
end)

CreateToggle(farmTab, _S("118|200|215|230|223|218|150|195|223|228|219|150|158|227|235|226|234|223|163|222|223|234|159"), false, function(val)
    Config.RapidMine = val
end)

CreateSlider(farmTab, _S("86|168|183|198|191|186|118|163|191|196|187|118|158|191|202|201"), 1, 10, 3, function(val)
    Config.RapidMineCount = val
end)

CreateToggle(farmTab, _S("107|172|224|223|218|139|174|218|215|215|208|206|223|139|175|221|218|219|222"), false, function(val)
    Config.AutoCollectDrops = val
    if val then StartDropCollectLoop() else State.DropCollectConn = nil end
end)

CreateToggle(farmTab, _S("60|126|181|172|157|175|175|92|140|174|171|169|172|176|92|132|171|168|160"), true, function(val)
    Config.BypassPromptHold = val
end)

CreateToggle(farmTab, _S("116|200|235|217|217|226|148|200|217|224|217|228|227|230|232"), false, function(val)
    Config.TweenTeleport = val
end)

CreateSectionHeader(farmTab, "🎯 ORE FILTER")

CreateToggle(farmTab, _S("63|132|173|160|161|171|164|95|142|177|164|95|133|168|171|179|164|177"), false, function(val)
    Config.OreFilterEnabled = val
end)

CreateInput(farmTab, _S("119|206|223|224|235|220|227|224|234|235|151|198|233|220|234"), Config.OreFilter, function(text)
    Config.OreFilter = text
end)

CreateInput(farmTab, _S("69|135|177|166|168|176|177|174|184|185|101|148|183|170|184"), Config.OreBlacklist, function(text)
    Config.OreBlacklist = text
end)

CreateSectionHeader(farmTab, "⛏ AUTO FARM")

CreateToggle(farmTab, _S("76|141|193|192|187|108|146|173|190|185|108|158|187|175|183|191|123|143|190|197|191|192|173|184|191"), false, function(val)
    Config.AutoFarm = val
    if val then StartAutoFarm() else StopAutoFarm() end
end)

CreateToggle(farmTab, _S("105|185|219|210|216|219|210|221|226|137|177|210|208|209|206|220|221|137|191|202|213|222|206"), false, function(val)
    Config.PriorityHighestValue = val
    if val then Config.PriorityClosest = false end
end)

CreateToggle(farmTab, _S("127|207|241|232|238|241|232|243|248|159|194|235|238|242|228|242|243"), true, function(val)
    Config.PriorityClosest = val
    if val then Config.PriorityHighestValue = false end
end)

CreateSlider(farmTab, _S("78|148|175|192|187|110|160|175|178|183|195|193"), 50, 2000, 500, function(val)
    Config.FarmRadius = val
end)

CreateSlider(farmTab, _S("72|142|169|186|181|104|140|173|180|169|193"), 1, 100, 5, function(val)
    Config.FarmDelay = val / 100
end)

CreateButton(farmTab, "🔍 Scan Rocks Now", Color3.fromRGB(40, 80, 160), function()
    local rocks = GetAllRocks()
    AddLog(_S("124|194|235|241|234|224|156") .. #rocks .. _S("86|118|200|197|185|193|201|133|185|200|207|201|202|183|194|201"))
end)

CreateButton(farmTab, "⛏ Mine Nearest Rock", Color3.fromRGB(40, 120, 60), function()
    local rocks = GetAllRocks()
    if #rocks > 0 then
        MineRock(rocks[1])
    else
        AddLog(_S("60|138|171|92|174|171|159|167|175|92|162|171|177|170|160|93"))
    end
end)

CreateButton(farmTab, "⚡ Cache Remotes", Color3.fromRGB(100, 50, 150), function()
    CacheRemotes()
end)
end

local function BuildSellTab()
local sellTab = TabFrames[_S("94|177|195|202|202")]
ResetLayoutOrder()

CreateSectionHeader(sellTab, "💰 AUTO SELL")

CreateToggle(sellTab, _S("76|159|177|184|184|108|163|180|177|186|108|142|173|175|183|188|173|175|183|108|146|193|184|184"), true, function(val)
    Config.SellWhenFull = val
end)

CreateSlider(sellTab, _S("85|168|186|193|193|117|162|190|195|117|152|182|200|189|117|169|189|199|186|200|189|196|193|185"), 0, 500000, 0, function(val)
    Config.SellMinCash = val
end)

CreateToggle(sellTab, _S("84|149|201|200|195|116|167|185|192|192"), false, function(val)
    Config.AutoSell = val
    if val then StartAutoSell() else StopAutoSell() end
end)

CreateSlider(sellTab, _S("77|160|178|185|185|109|159|174|177|182|194|192"), 50, 1000, 300, function(val)
    Config.SellRadius = val
end)

CreateSlider(sellTab, _S("127|210|228|235|235|159|195|228|235|224|248"), 1, 50, 3, function(val)
    Config.SellDelay = val / 10
end)

CreateButton(sellTab, "💰 Sell at Nearest Shop", Color3.fromRGB(140, 100, 30), function()
    local shops = GetAllShops()
    if #shops > 0 then
        SellItems(shops[1])
    else
        AddLog(_S("72|150|183|104|187|176|183|184|187|104|174|183|189|182|172|105"))
    end
end)

CreateButton(sellTab, "🏠 Go Home / Teleport to Shop", Color3.fromRGB(80, 50, 150), function()
    local shops = GetAllShops()
    if #shops > 0 then
        TeleportTo(shops[1].Part.Position)
        AddLog(_S("65|149|166|173|166|177|176|179|181|166|165|97|181|176|123|97") .. shops[1].Name)
    end
end)

CreateSectionHeader(sellTab, "🛒 AUTO BUY UPGRADES")

CreateToggle(sellTab, _S("112|177|229|228|223|144|178|229|233|144|192|217|211|219|209|232|213"), false, function(val) Config.AutoBuyPickaxe = val end)
CreateToggle(sellTab, _S("112|177|229|228|223|144|178|229|233|144|178|209|211|219|224|209|211|219"), false, function(val) Config.AutoBuyBackpack = val end)
CreateToggle(sellTab, _S("86|151|203|202|197|118|152|203|207|118|162|203|185|193"), false, function(val) Config.AutoBuyLuck = val end)
CreateToggle(sellTab, _S("125|190|242|241|236|157|191|242|246|157|212|222|239|234|241|229"), false, function(val) Config.AutoBuyWarmth = val end)

CreateToggle(sellTab, _S("116|181|233|232|227|148|198|217|214|221|230|232|220"), false, function(val) Config.AutoRebirth = val end)

CreateSlider(sellTab, _S("72|154|173|170|177|186|188|176|104|139|169|187|176|104|156|176|186|173|187|176|183|180|172"), 1000, 1000000, 50000, function(val)
    Config.RebirthCashThreshold = val
end)

CreateToggle(sellTab, _S("76|141|193|192|187|108|143|184|173|181|185|108|144|173|181|184|197|123|143|187|176|177"), false, function(val) Config.AutoClaimDaily = val end)

CreateInput(sellTab, _S("88|168|202|199|197|199|120|155|199|188|189"), "", function(text) Config.PromoCode = text end)

CreateButton(sellTab, "🎁 Claim Daily Now", Color3.fromRGB(180, 130, 40), function()
    TryAutoClaimDaily()
    AddLog(_S("62|129|170|159|167|171|163|162|94|162|159|167|170|183|94|176|163|181|159|176|162|177"))
end)

CreateSectionHeader(sellTab, "🔄 AUTO UPGRADE")

CreateToggle(sellTab, _S("88|153|205|204|199|120|173|200|191|202|185|188|189"), false, function(val)
    Config.AutoUpgrade = val
    if val then StartAutoUpgrade() else StopAutoUpgrade() end
end)

CreateButton(sellTab, "⬆ Upgrade All", Color3.fromRGB(50, 130, 180), function()
    FireRemote(_S("86|203|198|189|200|183|186|187"))
    FireRemote(_S("98|196|215|219"))
    FireRemote(_S("76|188|193|190|175|180|173|191|177"))
    FireRemote(_S("122|241|219|236|231|238|226"))
    FireRemote(_S("60|172|165|159|167|157|180|161"))
    FireRemote(_S("61|159|158|160|168|173|158|160|168"))
    FireRemote(_S("104|219|216|205|205|204"))
    AddLog(_S("65|135|170|179|166|165|97|182|177|168|179|162|165|166|97|179|166|174|176|181|166|180"))
end)

CreateSectionHeader(sellTab, "🏪 DETECTED SHOPS")

local shopListFrame = Instance.new(_S("80|163|179|194|191|188|188|185|190|183|150|194|177|189|181"))
ShopList = shopListFrame
ShopList.Name = _S("72|155|176|183|184|148|177|187|188")
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

local shopLCorner = Instance.new(_S("109|194|182|176|220|223|219|210|223"))
shopLCorner.CornerRadius = UDim.new(0, 6)
shopLCorner.Parent = ShopList

local shopLLayout = Instance.new(_S("118|203|191|194|223|233|234|194|215|239|229|235|234"))
shopLLayout.SortOrder = Enum.SortOrder.LayoutOrder
shopLLayout.Padding = UDim.new(0, 2)
shopLLayout.Parent = ShopList

local shopLPad = Instance.new(_S("111|196|184|191|208|211|211|216|221|214"))
shopLPad.PaddingTop = UDim.new(0, 2)
shopLPad.PaddingBottom = UDim.new(0, 2)
shopLPad.PaddingLeft = UDim.new(0, 2)
shopLPad.PaddingRight = UDim.new(0, 2)
shopLPad.Parent = ShopList
end

local function BuildESPTab()
local espTab = TabFrames[_S("84|153|167|164")]
ResetLayoutOrder()

CreateSectionHeader(espTab, "👁 ESP / VISUALS")

CreateToggle(espTab, _S("60|127|174|181|175|176|157|168|92|107|92|142|171|159|167|92|129|143|140"), false, function(val)
    Config.ESPEnabled = val
    if val then StartESP() else StopESP() end
end)

CreateToggle(espTab, _S("112|196|226|209|211|213|226|227|144|152|194|223|211|219|227|159|195|216|223|224|227|153"), false, function(val)
    Config.Tracers = val
    if not val then ClearTracers() end
end)

CreateToggle(espTab, _S("105|185|213|202|226|206|219|137|174|188|185"), false, function(val)
    Config.PlayerESP = val
    if not val then ClearPlayerESP() end
end)

CreateToggle(espTab, _S("79|146|183|180|194|195|111|126|111|148|197|180|189|195|111|148|162|159"), false, function(val)
    Config.ChestESP = val
    if not val then ClearChestESP() end
end)

CreateToggle(espTab, _S("111|181|228|219|219|209|225|216|214|215|227"), false, function(val)
    Config.Fullbright = val
    if val then ApplyFullbright() else RestoreFullbright() end
end)

CreateToggle(espTab, _S("128|200|233|228|229|160|207|244|232|229|242|160|208|236|225|249|229|242|243"), false, function(val)
    Config.HideOtherPlayers = val
    ApplyHidePlayers()
end)

CreateButton(espTab, "🔄 Refresh ESP", Color3.fromRGB(50, 90, 160), function()
    if Config.ESPEnabled then
        CreateESP()
    else
        AddLog(_S("101|170|211|198|199|209|202|133|170|184|181|133|203|206|215|216|217|134"))
    end
end)

CreateButton(espTab, "❌ Clear ESP", Color3.fromRGB(150, 50, 50), function()
    StopESP()
end)

CreateSectionHeader(espTab, "🪨 DETECTED ROCKS")

local rockListFrame = Instance.new(_S("102|185|201|216|213|210|210|207|212|205|172|216|199|211|203"))
RockList = rockListFrame
RockList.Name = _S("99|181|210|198|206|175|204|214|215")
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

local rLCorner = Instance.new(_S("120|205|193|187|231|234|230|221|234"))
rLCorner.CornerRadius = UDim.new(0, 6)
rLCorner.Parent = RockList

local rLLayout = Instance.new(_S("125|210|198|201|230|240|241|201|222|246|236|242|241"))
rLLayout.SortOrder = Enum.SortOrder.LayoutOrder
rLLayout.Padding = UDim.new(0, 2)
rLLayout.Parent = RockList

local rLPad = Instance.new(_S("130|215|203|210|227|230|230|235|240|233"))
rLPad.PaddingTop = UDim.new(0, 2)
rLPad.PaddingBottom = UDim.new(0, 2)
rLPad.PaddingLeft = UDim.new(0, 2)
rLPad.PaddingRight = UDim.new(0, 2)
rLPad.Parent = RockList
end

local function BuildExploitTab()
local exploitTab = TabFrames[_S("83|152|203|195|191|194|188|199")]
ResetLayoutOrder()

CreateSectionHeader(exploitTab, "🎒 EXPLOITS")

CreateToggle(exploitTab, _S("75|160|185|183|180|184|180|191|176|175|107|141|172|174|182|187|172|174|182"), false, function(val)
    Config.UnlimitedBackpack = val
    if val then ApplyUnlimitedBackpack() end
end)

CreateToggle(exploitTab, _S("63|148|173|171|168|172|168|179|164|163|95|139|180|162|170"), false, function(val)
    Config.UnlimitedLuck = val
    if val then ApplyUnlimitedLuck() end
end)

CreateToggle(exploitTab, _S("88|153|198|204|193|120|156|185|197|185|191|189"), false, function(val)
    Config.AntiDamage = val
    if val then StartAntiDamage() else StopAntiDamage() end
end)

CreateToggle(exploitTab, _S("112|177|222|228|217|144|182|226|213|213|234|213|144|152|199|209|226|221|228|216|153"), false, function(val)
    Config.AntiFreeze = val
    if val and not Config.AntiDamage then
        Config.AntiDamage = true
        StartAntiDamage()
    end
end)

CreateToggle(exploitTab, _S("92|179|189|206|201|208|196|124|167|193|193|204|193|206"), false, function(val)
    Config.WarmthKeeper = val
    if val or Config.StaminaKeeper then StartWarmthKeeper() else StopWarmthKeeper() end
end)

CreateToggle(exploitTab, _S("90|173|206|187|199|195|200|187|122|165|191|191|202|191|204"), false, function(val)
    Config.StaminaKeeper = val
    if val or Config.WarmthKeeper then StartWarmthKeeper() else StopWarmthKeeper() end
end)

CreateSectionHeader(exploitTab, "🎭 MOVEMENT")

CreateToggle(exploitTab, _S("86|169|198|187|187|186|118|152|197|197|201|202"), false, function(val)
    Config.SpeedBoost = val
    ApplySpeedBoost()
end)

CreateSlider(exploitTab, _S("83|170|180|191|190|115|166|195|184|184|183"), 16, 200, 50, function(val)
    Config.WalkSpeed = val
    if Config.SpeedBoost then ApplySpeedBoost() end
end)

CreateToggle(exploitTab, _S("120|198|231|219|228|225|232"), false, function(val)
    Config.Noclip = val
    if val then StartNoclip() else StopNoclip() end
end)

CreateToggle(exploitTab, _S("81|151|189|202"), false, function(val)
    Config.FlyEnabled = val
    if val then StartFly() else StopFly() end
end)

CreateSlider(exploitTab, _S("78|148|186|199|110|161|190|179|179|178"), 10, 200, 60, function(val)
    Config.FlySpeed = val
end)

CreateToggle(exploitTab, _S("124|197|234|226|229|234|229|240|225|156|198|241|233|236"), false, function(val)
    Config.InfiniteJump = val
    if val then StartInfiniteJump() else StopInfiniteJump() end
end)

CreateToggle(exploitTab, _S("67|134|175|172|166|174|99|151|168|175|168|179|178|181|183|99|107|134|183|181|175|110|134|175|172|166|174|108"), false, function(val)
    Config.ClickTeleport = val
    if val then StartClickTeleport() else StopClickTeleport() end
end)

CreateSectionHeader(exploitTab, "📦 ITEM DUPE")

local dupeInput, dupeTextBox
dupeInput, dupeTextBox = CreateInput(exploitTab, _S("62|130|179|174|163|94|143|178|183"), "1", function(text)
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
    FireRemote(_S("111|220|216|221|212"))
    FireRemote(_S("115|215|220|218"))
    FireRemote(_S("117|221|214|231|235|218|232|233"))
    FireRemote(_S("103|202|214|211|211|204|202|219"))
    FireRemote(_S("64|162|178|165|161|171"))
    AddLog(_S("81|151|186|195|182|181|113|190|186|191|182|113|195|182|190|192|197|182|196"))
end)

CreateButton(exploitTab, "💰 Fire All Sell Remotes", Color3.fromRGB(40, 140, 40), function()
    FireRemote(_S("123|238|224|231|231"))
    FireRemote(_S("95|210|196|203|203|192|203|203"))
    FireRemote(_S("90|189|187|205|194"))
    FireRemote(_S("101|210|212|211|202|222"))
    FireRemote(_S("77|193|191|174|177|178"))
    AddLog(_S("116|186|221|230|217|216|148|231|217|224|224|148|230|217|225|227|232|217|231"))
end)

CreateButton(exploitTab, "⬆ Fire All Upgrade Remotes", Color3.fromRGB(40, 100, 160), function()
    FireRemote(_S("102|219|214|205|216|199|202|203"))
    FireRemote(_S("68|166|185|189"))
    FireRemote(_S("111|223|228|225|210|215|208|226|212"))
    FireRemote(_S("78|197|175|192|187|194|182"))
    FireRemote(_S("102|214|207|201|209|199|222|203"))
    FireRemote(_S("72|170|169|171|179|184|169|171|179"))
    AddLog(_S("123|193|228|237|224|223|155|240|235|226|237|220|223|224|155|237|224|232|234|239|224|238"))
end)

CreateButton(exploitTab, "🎲 Fire All Luck Remotes", Color3.fromRGB(140, 140, 40), function()
    FireRemote(_S("117|225|234|216|224"))
    FireRemote(_S("119|227|236|218|226|240"))
    FireRemote(_S("109|211|220|223|225|226|219|210"))
    FireRemote(_S("73|171|181|174|188|188|178|183|176"))
    AddLog(_S("73|143|178|187|174|173|105|181|190|172|180|105|187|174|182|184|189|174|188"))
end)

CreateButton(exploitTab, "💣 Fire ALL Remotes (Nuke)", Color3.fromRGB(200, 50, 50), function()
    for _, remote in ipairs(State.RemoteCache) do
        pcall(function()
            if remote.Type == _S("79|161|180|188|190|195|180|148|197|180|189|195") then
                remote.Instance:FireServer()
            elseif remote.Type == _S("95|177|196|204|206|211|196|165|212|205|194|211|200|206|205") then
                remote.Instance:InvokeServer()
            end
        end)
    end
    AddLog(_S("69|147|154|144|138|137|101|166|177|177|101") .. #State.RemoteCache .. _S("97|129|211|198|206|208|213|198|212|130"))
end)
end

local function BuildToolsTab()
local toolsTab = TabFrames[_S("102|186|213|213|210|217")]
ResetLayoutOrder()

CreateSectionHeader(toolsTab, "📡 REMOTE SPY")

CreateToggle(toolsTab, _S("82|164|183|191|193|198|183|114|165|194|203|114|122|158|193|185|114|152|187|196|183|165|183|196|200|183|196|123"), false, function(val)
    Config.RemoteSpy = val
    if val then StartRemoteSpy() else StopRemoteSpy() end
end)

layoutOrder = layoutOrder + 1
local spyListFrame = Instance.new(_S("92|175|191|206|203|200|200|197|202|195|162|206|189|201|193"))
RemoteSpyList = spyListFrame
RemoteSpyList.Name = _S("102|184|203|211|213|218|203|185|214|223|178|207|217|218")
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

local spyCorner = Instance.new(_S("124|209|197|191|235|238|234|225|238"))
spyCorner.CornerRadius = UDim.new(0, 6)
spyCorner.Parent = RemoteSpyList

local spyLayout = Instance.new(_S("126|211|199|202|231|241|242|202|223|247|237|243|242"))
spyLayout.SortOrder = Enum.SortOrder.LayoutOrder
spyLayout.Padding = UDim.new(0, 2)
spyLayout.Parent = RemoteSpyList

local spyPad = Instance.new(_S("72|157|145|152|169|172|172|177|182|175"))
spyPad.PaddingTop = UDim.new(0, 2)
spyPad.PaddingLeft = UDim.new(0, 2)
spyPad.PaddingRight = UDim.new(0, 2)
spyPad.Parent = RemoteSpyList

CreateButton(toolsTab, "🗑 Clear Spy Log", Color3.fromRGB(100, 50, 50), function()
    State.RemoteSpyLogs = {}
    if RemoteSpyList then ClearScrollList(RemoteSpyList) end
end)

CreateSectionHeader(toolsTab, "🎯 CUSTOM REMOTE")

CreateInput(toolsTab, _S("116|198|217|225|227|232|217|148|194|213|225|217"), "", function(text)
    Config.CustomRemoteName = text
end)

CreateInput(toolsTab, _S("87|152|201|190|202|119|127|186|198|196|196|184|119|202|188|199|184|201|184|203|188|187|128"), "", function(text)
    Config.CustomRemoteArgs = text
end)

CreateButton(toolsTab, "🚀 Fire Custom Remote", Color3.fromRGB(160, 80, 40), function()
    FireCustomRemote()
end)

CreateSectionHeader(toolsTab, "📍 WAYPOINTS")

CreateButton(toolsTab, "💾 Save: Shop", Color3.fromRGB(50, 100, 160), function()
    SaveWaypoint(_S("87|170|191|198|199"))
end)

CreateButton(toolsTab, "💾 Save: Farm Spot", Color3.fromRGB(50, 130, 80), function()
    SaveWaypoint(_S("71|141|168|185|180"))
end)

CreateButton(toolsTab, "💾 Save: Spawn", Color3.fromRGB(80, 80, 140), function()
    SaveWaypoint(_S("90|173|202|187|209|200"))
end)

CreateButton(toolsTab, "📍 TP → Shop", Color3.fromRGB(40, 90, 140), function()
    TeleportToWaypoint(_S("116|199|220|227|228"))
end)

CreateButton(toolsTab, "📍 TP → Farm Spot", Color3.fromRGB(40, 120, 70), function()
    TeleportToWaypoint(_S("89|159|186|203|198"))
end)

CreateButton(toolsTab, "📍 TP → Spawn", Color3.fromRGB(70, 70, 130), function()
    TeleportToWaypoint(_S("95|178|207|192|214|205"))
end)
end

local function BuildMiscTab()
local miscTab = TabFrames[_S("107|184|212|222|206")]
ResetLayoutOrder()

CreateSectionHeader(miscTab, "⚙ SETTINGS")

CreateToggle(miscTab, _S("102|167|212|218|207|147|167|172|177"), false, function(val)
    Config.AntiAFK = val
    if val then StartAntiAFK() else StopAntiAFK() end
end)

CreateToggle(miscTab, _S("126|191|243|242|237|158|208|227|241|238|223|245|236|158|169|158|208|227|223|238|238|234|247"), false, function(val)
    Config.AutoRespawn = val
end)

CreateToggle(miscTab, _S("60|130|140|143|92|126|171|171|175|176|161|174"), false, function(val)
    Config.FPSBooster = val
    if val then ApplyFPSBooster() end
end)

CreateSlider(miscTab, _S("76|159|177|190|194|177|190|108|148|187|188|108|116|185|181|186|120|108|124|137|187|178|178|117"), 0, 120, 0, function(val)
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
local keybindInfo = Instance.new(_S("102|186|203|222|218|178|199|200|203|210"))
keybindInfo.Size = UDim2.new(1, 0, 0, IsMobile and 56 or 70)
keybindInfo.BackgroundColor3 = Theme.Panel
keybindInfo.BackgroundTransparency = 0.1
keybindInfo.BorderSizePixel = 0
keybindInfo.Text = IsMobile and _S("117|201|214|229|149|220|231|218|218|227|149|194|149|215|234|233|233|228|227|149|178|149|201|228|220|220|225|218|149|188|202|190|149|241|149|202|232|218|149|233|228|220|220|225|218|232|149|222|227|149|233|214|215|232") or _S("129|211|234|232|233|245|212|233|234|231|245|161|190|161|213|240|232|232|237|230|161|200|214|202|161|253|161|199|161|190|161|199|237|250|161|253|161|200|161|190|161|194|246|245|240|161|199|226|243|238|161|253|161|201|161|190|161|212|238|226|243|245|161|205|240|240|241|161|253|161|209|161|190|161|209|226|239|234|228|161|253|161|196|245|243|237|172|196|237|234|228|236|161|190|161|196|237|234|228|236|161|213|209")
keybindInfo.TextColor3 = Theme.SubText
keybindInfo.Font = Enum.Font.Gotham
keybindInfo.TextSize = IsMobile and 9 or 10
keybindInfo.TextXAlignment = Enum.TextXAlignment.Left
keybindInfo.TextYAlignment = Enum.TextYAlignment.Top
keybindInfo.TextWrapped = true
keybindInfo.LayoutOrder = layoutOrder
keybindInfo.Parent = miscTab
local kbCorner = Instance.new(_S("62|147|135|129|173|176|172|163|176"))
kbCorner.CornerRadius = UDim.new(0, 6)
kbCorner.Parent = keybindInfo

CreateSectionHeader(miscTab, "📋 LOG")

local logListFrame = Instance.new(_S("110|193|209|224|221|218|218|215|220|213|180|224|207|219|211"))
LogList = logListFrame
LogList.Name = _S("93|169|204|196|169|198|208|209")
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

local logCorner = Instance.new(_S("82|167|155|149|193|196|192|183|196"))
logCorner.CornerRadius = UDim.new(0, 6)
logCorner.Parent = LogList

local logLayout = Instance.new(_S("91|176|164|167|196|206|207|167|188|212|202|208|207"))
logLayout.SortOrder = Enum.SortOrder.LayoutOrder
logLayout.Parent = LogList

local logPad = Instance.new(_S("98|183|171|178|195|198|198|203|208|201"))
logPad.PaddingTop = UDim.new(0, 3)
logPad.PaddingLeft = UDim.new(0, 3)
logPad.PaddingRight = UDim.new(0, 3)
logPad.Parent = LogList

CreateSectionHeader(miscTab, "🔗 DISCORD WEBHOOK")

CreateToggle(miscTab, _S("118|187|228|215|216|226|219|150|205|219|216|222|229|229|225"), false, function(val)
    Config.WebhookEnabled = val
end)

CreateInput(miscTab, _S("110|197|211|208|214|221|221|217|142|195|192|186"), "", function(text)
    Config.WebhookURL = text
end)

CreateToggle(miscTab, _S("71|141|168|185|180|103|147|182|174|186"), true, function(val)
    Config.WebhookFarm = val
end)

CreateToggle(miscTab, _S("68|151|169|176|176|100|144|179|171|183"), true, function(val)
    Config.WebhookSell = val
end)

CreateToggle(miscTab, _S("94|177|210|191|210|209|126|170|205|197|209"), true, function(val)
    Config.WebhookStats = val
end)

CreateButton(miscTab, "📨 Send Stats Now", Color3.fromRGB(50, 90, 160), function()
    SendStatsLog()
    AddLog(_S("92|175|193|202|208|124|207|208|189|208|207|124|208|203|124|211|193|190|196|203|203|199"))
end)

CreateButton(miscTab, "🧪 Test Webhook", Color3.fromRGB(90, 60, 140), function()
    SendWebhook({content = "**[Minea Mountain v7]** Webhook test successful! ✅"})
    AddLog(_S("81|165|182|196|197|182|181|113|200|182|179|185|192|192|188"))
end)

CreateSectionHeader(miscTab, "🔧 UTILITIES")

CreateButton(miscTab, "🏠 Teleport to Spawn", Color3.fromRGB(60, 90, 140), function()
    local spawns = Workspace:FindFirstChild(_S("103|186|215|200|222|213|179|214|202|200|219|208|214|213")) or Workspace:FindFirstChild(_S("72|155|184|169|191|182|187")) or Workspace:FindFirstChild(_S("92|168|203|190|190|213"))
    if spawns then
        if spawns:IsA(_S("100|166|197|215|201|180|197|214|216")) then
            TeleportTo(spawns.Position)
        else
            local spawn = spawns:FindFirstChildWhichIsA(_S("97|163|194|212|198|177|194|211|213"))
            if spawn then TeleportTo(spawn.Position) end
        end
    else
        AddLog(_S("91|169|202|123|206|203|188|210|201|123|193|202|208|201|191|124"))
    end
end)

CreateButton(miscTab, "🏔 Teleport to Mountain Top", Color3.fromRGB(100, 60, 140), function()
    if GetCharacter() then
        local highestY = HumanoidRootPart.Position.Y
        local highestPart = nil
        for _, part in ipairs(Workspace:GetDescendants()) do
            if part:IsA(_S("87|153|184|202|188|167|184|201|203")) and part.Position.Y > highestY then
                highestY = part.Position.Y
                highestPart = part
            end
        end
        if highestPart then
            TeleportTo(highestPart.Position + Vector3.new(0, 10, 0))
            AddLog(_S("99|183|200|207|200|211|210|213|215|200|199|131|215|210|131|203|204|202|203|200|214|215|131|211|210|204|209|215|157|131") .. math.floor(highestY))
        end
    end
end)

CreateButton(miscTab, "🔄 Rejoin Server", Color3.fromRGB(100, 100, 50), function()
    pcall(function()
        LocalPlayer:Kick(_S("104|186|205|210|215|209|214|209|214|207|150|150|150"))
        task.wait(1)
        game:GetService(_S("105|189|206|213|206|217|216|219|221|188|206|219|223|210|204|206")):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end)
end)

CreateSectionHeader(miscTab, "ℹ INFO")

layoutOrder = layoutOrder + 1
local infoLabel = Instance.new(_S("71|155|172|191|187|147|168|169|172|179"))
infoLabel.Size = UDim2.new(1, 0, 0, 50)
infoLabel.BackgroundColor3 = Theme.Panel
infoLabel.BackgroundTransparency = 0.1
infoLabel.Text = _S("92|169|197|202|193|189|124|164|209|190|124|210|147|124|216|124") .. Exec.Name .. "\nSmart Loop · Remote Spy · ESP+ · Waypoints"
infoLabel.TextColor3 = Theme.SubText
infoLabel.Font = Enum.Font.Gotham
infoLabel.TextSize = IsMobile and 9 or 10
infoLabel.TextWrapped = true
infoLabel.LayoutOrder = layoutOrder
infoLabel.Parent = miscTab

local infoCorner = Instance.new(_S("111|196|184|178|222|225|221|212|225"))
infoCorner.CornerRadius = UDim.new(0, 6)
infoCorner.Parent = infoLabel
end

BuildGUIShell()
for tabName, btn in pairs(TabButtons) do
    btn.MouseButton1Click:Connect(function()
        SwitchTab(tabName)
    end)
end
BuildFarmTab()
BuildSellTab()
BuildESPTab()
BuildExploitTab()
BuildToolsTab()
BuildMiscTab()

local function SetupGUIControls()

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
end

SetupGUIControls()
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

task.spawn(function()
    while true do
        task.wait(10)
        pcall(function()
            local shops = GetAllShops()
            if ShopList then
                ClearScrollList(ShopList)
                for i, shop in ipairs(shops) do
                    if i > 15 then break end
                    local btn = Instance.new(_S("102|186|203|222|218|168|219|218|218|213|212"))
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Theme.Input
                    btn.BorderSizePixel = 0
                    btn.Text = shop.Name .. " [" .. math.floor(shop.Distance) .. "m]"
                    btn.TextColor3 = Theme.Text
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = 11
                    btn.LayoutOrder = i
                    btn.Parent = ShopList
                    local bCorner = Instance.new(_S("108|193|181|175|219|222|218|209|222"))
                    bCorner.CornerRadius = UDim.new(0, 5)
                    bCorner.Parent = btn
                    btn.MouseButton1Click:Connect(function()
                        TeleportTo(shop.Part.Position)
                        AddLog(_S("115|199|216|223|216|227|226|229|231|216|215|147|231|226|173|147") .. shop.Name)
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
                    local btn = Instance.new(_S("83|167|184|203|199|149|200|199|199|194|193"))
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Theme.Input
                    btn.BorderSizePixel = 0
                    btn.Text = rock.Name .. " [" .. math.floor(rock.Distance) .. "m]" .. (rock.Value > 0 and (" $" .. rock.Value) or "")
                    btn.TextColor3 = rock.Value > 0 and Theme.Accent or Theme.SubText
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = 11
                    btn.LayoutOrder = i
                    btn.Parent = RockList
                    local bCorner = Instance.new(_S("129|214|202|196|240|243|239|230|243"))
                    bCorner.CornerRadius = UDim.new(0, 5)
                    bCorner.Parent = btn
                    btn.MouseButton1Click:Connect(function()
                        TeleportTo(rock.Part.Position)
                        AddLog(_S("80|164|181|188|181|192|191|194|196|181|180|112|196|191|138|112") .. rock.Name)
                    end)
                end
            end
        end)
    end
end)

UserInputService.InputBegan:Connect(function(input, processed)
    if processed or IsMobile then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        ToggleGUI()
    elseif input.KeyCode == Enum.KeyCode.F then
        Config.FlyEnabled = not Config.FlyEnabled
        if Config.FlyEnabled then StartFly() else StopFly() end
        AddLog(_S("76|146|184|197|134|108") .. (Config.FlyEnabled and "ON" or _S("113|192|183|183")))
    elseif input.KeyCode == Enum.KeyCode.G then
        Config.AutoFarm = not Config.AutoFarm
        if Config.AutoFarm then StartAutoFarm() else StopAutoFarm() end
        AddLog(_S("92|157|209|208|203|124|162|189|206|201|150|124") .. (Config.AutoFarm and "ON" or _S("62|141|132|132")))
    elseif input.KeyCode == Enum.KeyCode.H then
        Config.SmartLoop = not Config.SmartLoop
        if Config.SmartLoop then StartSmartLoop() else StopSmartLoop() end
        AddLog(_S("123|206|232|220|237|239|155|199|234|234|235|181|155") .. (Config.SmartLoop and "ON" or _S("61|140|131|131")))
    elseif input.KeyCode == Enum.KeyCode.P and Config.PanicEnabled then
        PanicStopAll()
        ScreenGui.Enabled = false
        State.GUIHidden = true
    end
end)

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

LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    HumanoidRootPart = char:WaitForChild(_S("107|179|224|216|204|217|218|212|207|189|218|218|223|187|204|221|223"))
    Humanoid = char:WaitForChild(_S("83|155|200|192|180|193|194|188|183"))
    AddLog(_S("74|141|178|171|188|171|173|190|175|188|106|188|175|189|186|171|193|184|175|174"))

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

if Camera then
    Camera:GetPropertyChangedSignal(_S("113|199|218|214|232|225|224|227|229|196|218|235|214")):Connect(function()
        local newSize = Camera.ViewportSize
        local isMob = UserInputService.TouchEnabled or newSize.X < 900
        GUIWidth = isMob and UDim2.new(1, -20, 1, -36) or UDim2.new(0, 700, 0, 440)
        if not State.IsMinimized then
            MainFrame.Size = GUIWidth
            MainFrame.AnchorPoint = isMob and Vector2.new(0.5, 0.5) or Vector2.new(0, 0)
            MainFrame.Position = isMob and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0.5, -350, 0.5, -220)
        end
        TitleLabel.TextSize = isMob and 14 or 17
    end)
end

Exec.SetSimRadius()

pcall(function()
    AddLog(_S("72|149|177|182|173|169|104|144|189|170|104|190|127|104|180|183|169|172|173|172|104|183|182|104") .. Exec.Name)
    AddLog(_S("103|172|223|204|202|220|219|214|217|135|168|183|176|218|161|135|175|187|187|183|164") .. tostring(Exec.Request ~= nil) .. _S("123|155|195|234|234|230|184") .. tostring(Exec.HasHookMeta) .. _S("95|127|162|203|200|194|202|156") .. tostring(Exec.HasFireClick))
    AddLog(IsMobile and _S("110|194|207|222|142|213|224|211|211|220|142|187|142|208|227|226|226|221|220|142|226|221|142|226|221|213|213|218|211|142|181|195|183") or _S("79|161|184|182|183|195|162|183|184|181|195|111|140|111|150|164|152|111|203|111|146|176|178|183|180|111|193|180|188|190|195|180|194|111|181|184|193|194|195|112"))
    BypassPromptsIn(Workspace)
    StarterGui:SetCore(_S("61|144|162|171|161|139|172|177|166|163|166|160|158|177|166|172|171"), {
        Title = _S("117|194|222|227|218|214|149|189|234|215|149|235|172"),
        Text = IsMobile and _S("78|154|189|175|178|179|178|111|110|162|175|190|110|194|182|179|110|181|192|179|179|188|110|155|110|176|195|194|194|189|188|110|189|188|110|194|182|179|110|192|183|181|182|194|124") or _S("63|139|174|160|163|164|163|96|95|143|177|164|178|178|95|145|168|166|167|179|146|167|168|165|179|95|179|174|95|179|174|166|166|171|164|95|134|148|136|109"),
        Duration = 6,
    })
end)

task.delay(3, function()
    pcall(CacheRemotes)
end)
