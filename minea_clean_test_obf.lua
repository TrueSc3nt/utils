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
if false then local _j8u9t7ng2=0 end
local Players = game:GetService(_S("105|185|213|202|226|206|219|220"))
local ReplicatedStorage = game:GetService(_S("79|161|180|191|187|184|178|176|195|180|179|162|195|190|193|176|182|180"))
local Workspace = game:GetService(_S("124|211|235|238|231|239|236|221|223|225"))
local RunService = game:GetService(_S("110|192|227|220|193|211|224|228|215|209|211"))
local TweenService = game:GetService(_S("97|181|216|198|198|207|180|198|211|215|202|196|198"))
local UserInputService = game:GetService(_S("102|187|217|203|216|175|212|214|219|218|185|203|216|220|207|201|203"))
local HttpService = game:GetService(_S("116|188|232|232|228|199|217|230|234|221|215|217"))
local StarterGui = game:GetService(_S("124|207|240|221|238|240|225|238|195|241|229"))
local Lighting = game:GetService(_S("83|159|188|186|187|199|188|193|186"))
local TeleportService = game:GetService(_S("117|201|218|225|218|229|228|231|233|200|218|231|235|222|216|218"))
local CollectionService = game:GetService(_S("128|195|239|236|236|229|227|244|233|239|238|211|229|242|246|233|227|229"))

local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then
    LocalPlayer = Players.PlayerAdded:Wait()
end

local Character = LocalPlayer.Character
local HumanoidRootPart = Character and Character:FindFirstChild(_S("83|155|200|192|180|193|194|188|183|165|194|194|199|163|180|197|199"))
local Humanoid = Character and Character:FindFirstChild(_S("115|187|232|224|212|225|226|220|215"))
if not Character then
    task.spawn(function()
        local char = LocalPlayer.CharacterAdded:Wait()
        Character = char
        HumanoidRootPart = char:WaitForChild(_S("78|150|195|187|175|188|189|183|178|160|189|189|194|158|175|192|194"))
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
    OreFilter = _S("124|224|229|221|233|235|234|224|168|238|241|222|245|168|227|235|232|224|168|225|233|225|238|221|232|224|168|239|221|236|236|228|229|238|225|168|239|240|221|238|239|221|236|236|228|229|238|225|168|236|232|221|240|229|234|241|233"),
    OreBlacklist = _S("77|176|188|174|185|121|192|193|188|187|178|121|191|188|176|184"),
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
    CurrentTarget = _S("66|144|177|176|167"),
    FarmCount = 0,
    SellCount = 0,
    DupeCount = 0,
    UpgradeCount = 0,
    TotalEarnings = 0,
    Logs = {},
    ESPHighlights = {},
    RemoteCache = {},
    TabOpen = _S("86|156|183|200|195"),
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
    Exec.Name = _S("107|192|217|214|217|218|226|217")
    pcall(function()
        if identifyexecutor then
            Exec.Name = identifyexecutor()
        elseif EXECUTOR_NAME then
            Exec.Name = EXECUTOR_NAME
        elseif syn then
            Exec.Name = _S("63|146|184|173|160|175|178|164")
        elseif KRNL_LOADED then
            Exec.Name = _S("112|187|194|190|188")
        elseif Fluxus then
            Exec.Name = _S("100|170|208|217|220|217|215")
        elseif delta then
            Exec.Name = _S("60|128|161|168|176|157")
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
            local cg = game:GetService(_S("77|144|188|191|178|148|194|182"))
            if cloneref then cg = cloneref(cg) end
            parent = cg
        end)
        if parent then return parent end
        return LocalPlayer:WaitForChild(_S("65|145|173|162|186|166|179|136|182|170"))
    end

    Exec.HttpGet = function(url)
        local ok, result = pcall(function() return game:HttpGet(url) end)
        if ok and result then return result end
        if Exec.Request then
            local res = Exec.Request({Url = url, Method = _S("95|166|164|179")})
            if type(res) == _S("115|231|212|213|223|216") then
                return res.Body or res.body or res.BodyText
            end
        end
        return HttpService:GetAsync(url)
    end

    Exec.Post = function(url, body, contentType)
        contentType = contentType or _S("115|212|227|227|223|220|214|212|231|220|226|225|162|221|230|226|225")
        if Exec.Request then
            return Exec.Request({
                Url = url,
                Method = _S("121|201|200|204|205"),
                Headers = {[_S("63|130|174|173|179|164|173|179|108|147|184|175|164")] = contentType},
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
                sethiddenproperty(LocalPlayer, _S("115|198|220|224|232|223|212|231|220|226|225|197|212|215|220|232|230"), 1e9)
                sethiddenproperty(LocalPlayer, _S("78|155|175|198|161|183|187|195|186|175|194|183|189|188|160|175|178|183|195|193"), 1e9)
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
                OldNamecall = hookmetamethod(game, _S("84|179|179|194|181|193|185|183|181|192|192"), Exec.SafeCClosure(function(self, ...)
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

            if RemoteSpyActive and (method == _S("115|185|220|229|216|198|216|229|233|216|229") or method == _S("81|154|191|199|192|188|182|164|182|195|199|182|195")) then
                if self:IsA(_S("85|167|186|194|196|201|186|154|203|186|195|201")) or self:IsA(_S("123|205|224|232|234|239|224|193|240|233|222|239|228|234|233")) then
                    pcall(function() AddRemoteSpyLog(self.Name, method, args) end)
                end
            end

            if method == _S("86|161|191|185|193") and self == LocalPlayer then
                return true, nil
            end

            if method == _S("129|199|234|239|229|212|230|243|247|234|228|230") then
                local svc = args[1]
                if svc == _S("77|146|197|189|185|188|182|193|160|178|191|195|182|176|178") or svc == _S("123|190|227|224|220|239|206|224|237|241|228|222|224") then
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
            local OldIndex = hookmetamethod(game, _S("83|178|178|188|193|183|184|203"), Exec.SafeCClosure(function(self, key)
                if Humanoid and self == Humanoid then
                    if key == _S("79|166|176|187|186|162|191|180|180|179") and Config.SpeedBoost then return 16 end
                    if key == _S("100|174|217|209|212|180|211|219|201|214") and Config.JumpPower > 50 then return 50 end
                end
                return OldIndex(self, key)
            end))
        end)
        pcall(function()
            local OldNewIndex = hookmetamethod(game, _S("83|178|178|193|184|202|188|193|183|184|203"), Exec.SafeCClosure(function(self, key, value)
                if Humanoid and self == Humanoid then
                    if key == _S("70|157|167|178|177|153|182|171|171|170") and Config.SpeedBoost then
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
        HumanoidRootPart = Character:FindFirstChild(_S("90|162|207|199|187|200|201|195|190|172|201|201|206|170|187|204|206"))
        Humanoid = Character:FindFirstChild(_S("120|192|237|229|217|230|231|225|220"))
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
    for token in string.gmatch(string.lower(str or ""), _S("74|165|168|118|111|189|167|117")) do
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
    local leaderstats = LocalPlayer:FindFirstChild(_S("112|220|213|209|212|213|226|227|228|209|228|227"))
    if not leaderstats then return 0 end
    for _, stat in ipairs(leaderstats:GetChildren()) do
        local n = string.lower(stat.Name)
        for _, p in ipairs(patterns) do
            if string.find(n, p) and stat:IsA(_S("67|153|164|175|184|168|133|164|182|168")) then
                return stat.Value
            end
        end
    end
    return 0
end

local function GetPlayerCash()
    return GetLeaderstatValue({_S("129|228|226|244|233"), _S("103|212|214|213|204|224"), _S("81|180|192|186|191"), _S("92|195|203|200|192"), _S("114|212|211|222|211|224|213|215"), _S("91|189|208|190|198|206")})
end

local function GetBackpackWeight()
    return GetLeaderstatValue({_S("104|223|205|209|207|208|220"), _S("108|207|205|222|222|229"), "kg", _S("68|176|179|165|168"), _S("97|195|194|196|204|209|194|196|204")})
end

local function GetBackpackCapacity()
    local cap = GetLeaderstatValue({_S("70|169|167|182|167|169|175|186|191"), _S("117|226|214|237|216|214|231|231|238"), _S("90|199|187|210"), _S("93|201|198|202|198|209"), _S("79|177|176|178|186|191|176|178|186")})
    if cap > 0 then return cap end
    local obj = LocalPlayer:FindFirstChild(_S("96|162|193|195|203|208|193|195|203|163|193|208|193|195|201|212|217")) or LocalPlayer:FindFirstChild(_S("113|190|210|233|180|210|227|227|234"))
    if obj and obj:IsA(_S("105|191|202|213|222|206|171|202|220|206")) then return obj.Value end
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
            if d:IsA(_S("72|152|186|183|192|177|181|177|188|193|152|186|183|181|184|188")) then
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
            if not tool:IsA(_S("111|195|222|222|219")) then return -1 end
            local n = string.lower(tool.Name)
            if not (string.find(n, _S("98|210|203|197|205")) or string.find(n, _S("63|160|183|164")) or string.find(n, _S("81|181|195|186|189|189")) or string.find(n, _S("70|186|181|181|178")) or string.find(n, _S("64|168|161|173|173|165|178"))) then
                return 0
            end
            local s = 0
            if string.find(n, _S("121|221|226|218|230|232|231|221")) then s = s + 100
            elseif string.find(n, _S("116|219|227|224|216")) then s = s + 80
            elseif string.find(n, _S("93|198|207|204|203")) then s = s + 50
            elseif string.find(n, _S("75|190|191|186|185|176")) then s = s + 20 end
            for _, d in ipairs(tool:GetDescendants()) do
                if d:IsA(_S("87|173|184|195|204|188|153|184|202|188")) and (string.find(string.lower(d.Name), _S("76|184|177|194|177|184")) or string.find(string.lower(d.Name), _S("70|186|175|171|184"))) then
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
    local patterns = {_S("96|196|210|207|208"), _S("89|197|200|200|205"), _S("126|231|242|227|235"), _S("99|211|204|198|206|216|211"), _S("99|198|210|207|207|200|198|215"), _S("67|178|181|168"), _S("104|207|205|213"), _S("74|173|188|195|189|190|171|182")}
    local function scan(parent)
        for _, child in ipairs(parent:GetChildren()) do
            local nl = string.lower(child.Name)
            if child:IsA(_S("112|178|209|227|213|192|209|226|228")) or child:IsA(_S("70|147|181|170|171|178")) then
                for _, p in ipairs(patterns) do
                    if string.find(nl, p) then
                        local part = child:IsA(_S("124|190|221|239|225|204|221|238|240")) and child or child:FindFirstChildWhichIsA(_S("66|132|163|181|167|146|163|180|182"))
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
        FireRemote(_S("93|205|198|192|200|210|205"))
        FireRemote(_S("63|162|174|171|171|164|162|179"))
        FireRemote(_S("63|171|174|174|179"))
    end
end

local function FireUpgradePurchases()
    if Config.AutoBuyPickaxe then
        FireRemote(_S("103|215|208|202|210|200|223|204")); FireRemote(_S("118|216|235|239|213|230|223|217|225|215|238|219")); FireRemote(_S("60|177|172|163|174|157|160|161|155|172|165|159|167|157|180|161"))
    end
    if Config.AutoBuyBackpack then
        FireRemote(_S("96|194|193|195|203|208|193|195|203")); FireRemote(_S("60|159|157|172|157|159|165|176|181")); FireRemote(_S("104|221|216|207|218|201|204|205|199|202|201|203|211|216|201|203|211"))
    end
    if Config.AutoBuyLuck then
        FireRemote(_S("125|233|242|224|232")); FireRemote(_S("71|171|176|174|166|179|188|170|178")); FireRemote(_S("107|215|224|206|214|228"))
    end
    if Config.AutoBuyWarmth then
        FireRemote(_S("68|187|165|182|177|184|172")); FireRemote(_S("65|169|166|162|181")); FireRemote(_S("129|228|226|238|241|231|234|243|230"))
    end
    if Config.AutoUpgrade then
        FireRemote(_S("90|207|202|193|204|187|190|191")); FireRemote(_S("90|188|207|211")); FireRemote(_S("99|211|216|213|198|203|196|214|200"))
    end
end

local function TryAutoRebirth()
    if not Config.AutoRebirth then return end
    if GetPlayerCash() >= Config.RebirthCashThreshold then
        FireRemote(_S("68|182|169|166|173|182|184|172")); FireRemote(_S("115|227|229|216|230|231|220|218|216")); FireRemote(_S("87|201|188|202|188|203")); FireRemote(_S("101|198|216|200|202|211|201"))
        AddLog(_S("88|153|205|204|199|120|202|189|186|193|202|204|192|120|185|204|204|189|197|200|204|189|188|120|185|204|120") .. GetPlayerCash() .. _S("104|136|203|201|219|208"))
    end
end

local function TryAutoClaimDaily()
    if not Config.AutoClaimDaily then return end
    FireRemote(_S("65|165|162|170|173|186")); FireRemote(_S("110|224|211|229|207|224|210")); FireRemote(_S("81|180|189|178|186|190")); FireRemote(_S("115|223|226|218|220|225"))
    FireRemote(_S("109|208|220|209|210")); FireRemote(_S("101|215|202|201|202|202|210"))
    if Config.PromoCode ~= "" then
        FireRemote(_S("126|225|237|226|227"), Config.PromoCode)
        FireRemote(_S("104|218|205|204|205|205|213"), Config.PromoCode)
    end
end

local function ShouldSellNow()
    if IsBackpackFull() and Config.SellWhenFull then return true end
    if Config.SellMinCash > 0 and GetPlayerCash() >= Config.SellMinCash then return true end
    return false
end

local function DupeViaDrop()
    AddLog(_S("109|177|223|220|221|141|209|226|221|210|167|141|221|214|208|216|226|221|141|224|221|206|218|155|155|155"))
    pcall(function()
        local tool = Character and Character:FindFirstChildOfClass(_S("77|161|188|188|185"))
        if tool then
            tool.Parent = LocalPlayer.Backpack
            task.wait(0.1)
            Humanoid:EquipTool(tool)
        end
        for i = 1, Config.DupeAmount do
            FireRemote(_S("67|167|181|178|179")); FireRemote(_S("111|223|216|210|218|228|223")); FireRemote(_S("76|175|187|184|184|177|175|192"))
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
        if not child:IsA(_S("89|174|162|165|194|204|205|165|186|210|200|206|205")) and not child:IsA(_S("84|169|157|164|181|184|184|189|194|187")) then
            child:Destroy()
        end
    end
end

local function AddLog(message)
    local timestamp = os.date(_S("64|101|136|122|101|141|122|101|147"))
    table.insert(State.Logs, 1, "[" .. timestamp .. "] " .. message)
    if #State.Logs > 50 then
        table.remove(State.Logs)
    end
    if LogList then
        pcall(function()
            ClearScrollList(LogList)
            for i, log in ipairs(State.Logs) do
                if i > 15 then break end
                local label = Instance.new(_S("98|182|199|218|214|174|195|196|199|206"))
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
            if remote:IsA(_S("110|192|211|219|221|226|211|179|228|211|220|226")) or remote:IsA(_S("113|195|214|222|224|229|214|183|230|223|212|229|218|224|223")) then
                table.insert(State.RemoteCache, {
                    Instance = remote,
                    Name = remote.Name,
                    Type = remote.ClassName,
                })
            end
        end
    end)
    AddLog(_S("105|172|202|204|209|206|205|137") .. #State.RemoteCache .. _S("97|129|211|198|206|208|213|198|212"))
end

local function FireRemote(namePattern, ...)
    local args = {...}
    for _, remote in ipairs(State.RemoteCache) do
        local rName = string.lower(remote.Name)
        local pattern = string.lower(namePattern)
        if string.find(rName, pattern) then
            pcall(function()
                if remote.Type == _S("111|193|212|220|222|227|212|180|229|212|221|227") then
                    remote.Instance:FireServer(Exec.Unpack(args))
                elseif remote.Type == _S("77|159|178|186|188|193|178|147|194|187|176|193|182|188|187") then
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
                if remote.Type == _S("121|203|222|230|232|237|222|190|239|222|231|237") then
                    remote.Instance:FireServer(Exec.Unpack(args))
                elseif remote.Type == _S("86|168|187|195|197|202|187|156|203|196|185|202|191|197|196") then
                    remote.Instance:InvokeServer(Exec.Unpack(args))
                end
            end)
            return true
        end
    end
    return false
end

local CrystalPatterns = {
    _S("67|181|178|166|174"), _S("116|227|230|217"), _S("96|211|212|207|206|197"), _S("96|205|201|206|197|210|193|204"), _S("108|207|222|229|223|224|205|216"), _S("116|219|217|225"), _S("116|215|227|213|224"), _S("62|167|176|173|172"),
    _S("86|189|197|194|186"), _S("85|185|190|182|194|196|195|185"), _S("130|229|241|242|242|231|244"), _S("77|192|182|185|195|178|191"), _S("130|244|247|228|251"), _S("69|170|178|170|183|166|177|169"), _S("98|213|195|210|210|202|203|212|199"),
    _S("111|208|220|212|227|215|232|226|227"), _S("78|188|189|178|179"), _S("80|198|181|185|190"), _S("103|203|204|215|214|218|208|219"), _S("112|210|223|229|220|212|213|226"), _S("128|243|244|225|242|243|225|240|240|232|233|242|229"),
    _S("62|178|173|174|159|184"), _S("95|206|207|192|203"), _S("95|207|196|192|209|203"), _S("84|190|181|184|185"), _S("109|222|226|206|223|225|231"), _S("82|193|180|197|187|182|187|179|192"), _S("62|170|159|174|167|177"),
    _S("108|217|213|224|212|222|213|216"), _S("75|191|180|191|172|185|180|192|184"), _S("81|193|189|178|197|186|191|198|190"), _S("97|209|198|211|202|197|208|213"), _S("81|203|186|195|180|192|191"), _S("100|203|197|214|210|201|216"),
    _S("81|178|194|198|178|190|178|195|186|191|182"), _S("67|166|172|183|181|172|177|168"), _S("71|187|168|181|193|168|181|176|187|172"), _S("61|170|172|172|171|176|177|172|171|162"), _S("104|219|221|214|219|220|215|214|205"),
    _S("113|211|221|224|224|213|228|229|224|223|214"), _S("101|212|211|222|221"), _S("69|185|180|186|183|178|166|177|174|179|170"), _S("102|217|214|207|212|203|210"), _S("106|204|207|220|227|214"), _S("120|219|224|217|228|219|221|220|231|230|241"),
}

local function GetAllRocks()
    local rocks = {}
    local function SearchRocks(parent)
        if not parent then return end
        for _, child in ipairs(parent:GetChildren()) do
            local nameLower = string.lower(child.Name)
            if child:IsA(_S("117|183|214|232|218|197|214|231|233")) or child:IsA(_S("105|182|216|205|206|213")) then
                local matched = false
                for _, pattern in ipairs(CrystalPatterns) do
                    if string.find(nameLower, pattern) then
                        matched = true
                        break
                    end
                end
                if matched and MatchesOreFilter(nameLower) then
                    local part = child:IsA(_S("60|126|157|175|161|140|157|174|176")) and child or child:FindFirstChildWhichIsA(_S("106|172|203|221|207|186|203|220|222"))
                    if part then
                        local dist = GetDistance(part)
                        if dist <= Config.FarmRadius then

                            local value = 0
                            pcall(function()
                                local val = child:FindFirstChild(_S("61|147|158|169|178|162")) or child:FindFirstChild(_S("126|206|240|231|225|227")) or child:FindFirstChild(_S("112|199|223|226|228|216")) or child:FindFirstChild(_S("126|212|223|234|243|227|205|244|227|240|240|231|226|227"))
                                if val and val:IsA(_S("126|212|223|234|243|227|192|223|241|227")) then
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
        Workspace:FindFirstChild(_S("118|200|229|217|225|233")),
        Workspace:FindFirstChild(_S("118|197|232|219|233")),
        Workspace:FindFirstChild(_S("80|157|185|190|181|194|177|188|195")),
        Workspace:FindFirstChild(_S("65|142|170|175|166|180")),
        Workspace:FindFirstChild(_S("113|195|214|228|224|230|227|212|214|228")),
        Workspace:FindFirstChild(_S("96|173|193|208")),
        Workspace:FindFirstChild(_S("84|168|185|198|198|181|189|194")),
        Workspace:FindFirstChild(_S("94|161|208|215|209|210|191|202|209")),
        Workspace:FindFirstChild(_S("110|187|221|227|220|226|207|215|220")),
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
            if child:IsA(_S("124|201|235|224|225|232")) or child:IsA(_S("62|128|159|177|163|142|159|176|178")) then
                if string.find(nameLower, _S("72|187|176|183|184")) or string.find(nameLower, _S("114|229|215|222|222")) or
                   string.find(nameLower, _S("120|235|236|231|234|221")) or string.find(nameLower, _S("108|217|209|222|207|212|205|218|224")) or
                   string.find(nameLower, _S("68|184|182|165|168|169|182")) or string.find(nameLower, _S("122|222|223|219|230|223|236")) or
                   string.find(nameLower, _S("64|173|161|178|171|165|180")) or string.find(nameLower, _S("124|242|225|234|224|235|238")) or
                   string.find(nameLower, _S("62|161|159|177|166|167|163|176")) or string.find(nameLower, _S("74|172|191|195|175|188")) or
                   string.find(nameLower, _S("124|234|236|223")) or string.find(nameLower, _S("90|189|187|205|194")) or
                   string.find(nameLower, _S("80|184|191|189|181")) or string.find(nameLower, _S("85|183|182|200|186")) or
                   string.find(nameLower, _S("112|211|209|221|224")) then
                    local part = child:IsA(_S("105|171|202|220|206|185|202|219|221")) and child or child:FindFirstChildWhichIsA(_S("118|184|215|233|219|198|215|232|234")) or child:FindFirstChild(_S("63|135|180|172|160|173|174|168|163|145|174|174|179|143|160|177|179"))
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

    AddLog(_S("118|195|223|228|223|228|221|176|150") .. rockData.Name)

    TeleportTo(part.Position)
    task.wait(0.05)

    local function doMineOnce()

        if HasFireClick then
            local clickDetector = rock:FindFirstChildOfClass(_S("65|132|173|170|164|172|133|166|181|166|164|181|176|179")) or part:FindFirstChildOfClass(_S("70|137|178|175|169|177|138|171|186|171|169|186|181|184"))
            if clickDetector then Exec.FireClick(clickDetector) end
        end
        if HasFireProximity then
            local prompt = rock:FindFirstChildOfClass(_S("130|210|244|241|250|235|239|235|246|251|210|244|241|239|242|246")) or part:FindFirstChildOfClass(_S("71|151|185|182|191|176|180|176|187|192|151|185|182|180|183|187"))
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

        local tool = Character and Character:FindFirstChildOfClass(_S("77|161|188|188|185"))
        if tool then tool:Activate() end

        FireRemote(_S("60|169|165|170|161")); FireRemote(_S("78|182|175|192|196|179|193|194")); FireRemote(_S("109|208|220|217|217|210|208|225"))
        FireRemote(_S("111|209|225|212|208|218")); FireRemote(_S("106|209|203|222|210|207|220")); FireRemote(_S("98|198|203|201"))
        FireRemote(_S("118|230|223|217|225")); FireRemote(_S("119|234|238|224|229|222"))

        for _, remote in ipairs(State.RemoteCache) do
            local rName = string.lower(remote.Name)
            if string.find(rName, _S("106|215|211|216|207")) or string.find(rName, _S("118|218|223|221")) or string.find(rName, _S("96|200|193|210|214|197|211|212")) then
                pcall(function()
                    if remote.Type == _S("126|208|227|235|237|242|227|195|244|227|236|242") then
                        remote.Instance:FireServer(rock, part)
                    elseif remote.Type == _S("74|156|175|183|185|190|175|144|191|184|173|190|179|185|184") then
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

    AddLog(_S("123|206|224|231|231|228|233|226|155|220|239|181|155") .. shopData.Name)

    TeleportTo(part.Position)
    task.wait(0.1)

    if HasFireClick then
        local clickDetector = shop:FindFirstChildOfClass(_S("122|189|230|227|221|229|190|223|238|223|221|238|233|236")) or part:FindFirstChildOfClass(_S("106|173|214|211|205|213|174|207|222|207|205|222|217|220"))
        if clickDetector then Exec.FireClick(clickDetector) end
    end

    if HasFireProximity then
        local prompt = shop:FindFirstChildOfClass(_S("113|193|227|224|233|218|222|218|229|234|193|227|224|222|225|229")) or part:FindFirstChildOfClass(_S("116|196|230|227|236|221|225|221|232|237|196|230|227|225|228|232"))
        if prompt then Exec.FireProximity(prompt) end
    end

    if HasFireTouch then
        Exec.FireTouch(HumanoidRootPart, part, 0)
        task.wait(0.01)
        Exec.FireTouch(HumanoidRootPart, part, 1)
    end

    FireRemote(_S("122|237|223|230|230"))
    FireRemote(_S("121|236|225|232|233"))
    FireRemote(_S("110|219|207|224|217|211|226"))
    FireRemote(_S("102|218|216|199|202|203"))
    FireRemote(_S("84|183|181|199|188"))
    FireRemote(_S("76|185|187|186|177|197"))
    FireRemote(_S("120|235|221|228|228|217|228|228"))
    FireRemote(_S("125|240|226|233|233|220|222|233|233"))

    State.SellCount = State.SellCount + 1

    return true
end

local function StartAutoFarm()
    if State.FarmConnection then return end
    AddLog(_S("128|193|245|244|239|160|198|225|242|237|160|211|212|193|210|212|197|196"))

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
                    State.CurrentTarget = _S("65|148|166|162|179|164|169|170|175|168|111|111|111")
                end
            end
            task.wait(Config.FarmDelay)
        end
    end)
end

local function StopAutoFarm()
    State.FarmConnection = nil
    State.CurrentTarget = _S("88|166|199|198|189")
    AddLog(_S("64|129|181|180|175|96|134|161|178|173|96|147|148|143|144|144|133|132"))
end

local function StartAutoSell()
    if State.SellConnection then return end
    AddLog(_S("60|125|177|176|171|92|143|161|168|168|92|143|144|125|142|144|129|128"))

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
    AddLog(_S("100|165|217|216|211|132|183|201|208|208|132|183|184|179|180|180|169|168"))
end

local function StartAutoUpgrade()
    if State.UpgradeConn then return end
    AddLog(_S("128|193|245|244|239|160|213|240|231|242|225|228|229|160|211|212|193|210|212|197|196"))

    State.UpgradeConn = true
    task.spawn(function()
        while Config.AutoUpgrade and State.UpgradeConn do
            FireRemote(_S("101|218|213|204|215|198|201|202"))
            FireRemote(_S("71|169|188|192"))
            FireRemote(_S("88|200|205|202|187|192|185|203|189"))
            FireRemote(_S("102|221|199|216|211|218|206"))
            FireRemote(_S("79|191|184|178|186|176|199|180"))
            FireRemote(_S("89|187|186|188|196|201|186|188|196"))
            FireRemote(_S("101|216|213|202|202|201"))
            FireRemote(_S("92|192|197|195"))

            State.UpgradeCount = State.UpgradeCount + 1
            task.wait(1)
        end
    end)
end

local function StopAutoUpgrade()
    State.UpgradeConn = nil
    AddLog(_S("84|149|201|200|195|116|169|196|187|198|181|184|185|116|167|168|163|164|164|153|152"))
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

            local highlight = Instance.new(_S("107|179|212|210|211|215|212|210|211|223"))
            highlight.Name = _S("114|183|197|194|209") .. rock.Name
            highlight.FillTransparency = 0.6
            highlight.OutlineTransparency = 0
            highlight.OutlineColor = rock.Value > 0 and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(100, 200, 255)
            highlight.FillColor = rock.Value > 0 and Color3.fromRGB(255, 200, 50) or Color3.fromRGB(80, 150, 255)
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = rock.Instance

            local billboard = Instance.new(_S("94|160|199|202|202|192|205|191|208|194|165|211|199"))
            billboard.Name = _S("79|148|162|159|155|176|177|180|187")
            billboard.Size = UDim2.new(0, 120, 0, 30)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = rock.Part

            local label = Instance.new(_S("65|149|166|185|181|141|162|163|166|173"))
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 0.4
            label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            label.Text = rock.Name .. " [" .. math.floor(rock.Distance) .. "m]" .. (rock.Value > 0 and (_S("118|150|242|150|154") .. tostring(rock.Value)) or "")
            label.TextColor3 = rock.Value > 0 and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(100, 200, 255)
            label.Font = Enum.Font.GothamBold
            label.TextSize = 11
            label.Parent = billboard

            local corner = Instance.new(_S("80|165|153|147|191|194|190|181|194"))
            corner.CornerRadius = UDim.new(0, 4)
            corner.Parent = label

            table.insert(State.ESPHighlights, highlight)
            table.insert(State.ESPHighlights, billboard)
        end
    end

    local shops = GetAllShops()
    for _, shop in ipairs(shops) do
        if shop.Instance and shop.Instance.Parent then
            local highlight = Instance.new(_S("91|163|196|194|195|199|196|194|195|207"))
            highlight.Name = _S("68|137|151|148|163|151|172|179|180|163") .. shop.Name
            highlight.FillTransparency = 0.5
            highlight.OutlineTransparency = 0
            highlight.OutlineColor = Color3.fromRGB(0, 255, 100)
            highlight.FillColor = Color3.fromRGB(50, 255, 100)
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = shop.Instance

            local billboard = Instance.new(_S("60|126|165|168|168|158|171|157|174|160|131|177|165"))
            billboard.Name = _S("113|182|196|193|196|217|224|225|189|210|211|214|221")
            billboard.Size = UDim2.new(0, 100, 0, 25)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = shop.Part

            local label = Instance.new(_S("106|190|207|226|222|182|203|204|207|214"))
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

    AddLog(_S("77|146|160|157|135|109") .. #rocks .. _S("101|133|215|212|200|208|216|145|133") .. #shops .. _S("77|109|192|181|188|189|192"))
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
    AddLog(_S("74|139|184|190|179|106|142|171|183|171|177|175|106|143|152|139|140|150|143|142"))

    State.AntiDamageConn = RunService.Heartbeat:Connect(function()
        if not GetCharacter() then return end

        if Humanoid and Humanoid.Health < Humanoid.MaxHealth then
            Humanoid.Health = Humanoid.MaxHealth
        end

        if Config.AntiFreeze then
            pcall(function()

                local warmthVal = Character:FindFirstChild(_S("130|217|227|244|239|246|234")) or Character:FindFirstChild(_S("61|145|162|170|173|162|175|158|177|178|175|162")) or Character:FindFirstChild(_S("106|173|217|214|206"))
                if warmthVal and warmthVal:IsA(_S("79|165|176|187|196|180|145|176|194|180")) then
                    warmthVal.Value = 100
                end

                local freezeVal = Character:FindFirstChild(_S("67|137|181|178|189|168|177")) or Character:FindFirstChild(_S("129|202|244|199|243|240|251|230|239")) or Character:FindFirstChild(_S("71|141|185|172|172|193|176|181|174"))
                if freezeVal and freezeVal:IsA(_S("72|138|183|183|180|158|169|180|189|173")) then
                    freezeVal.Value = false
                end

                FireRemote(_S("116|235|213|230|225|232|220"))
                FireRemote(_S("60|177|170|162|174|161|161|182|161"))
                FireRemote(_S("99|203|200|196|215"))
            end)
        end
    end)
end

local function StopAntiDamage()
    if State.AntiDamageConn then
        State.AntiDamageConn:Disconnect()
        State.AntiDamageConn = nil
    end
    AddLog(_S("113|178|223|229|218|145|181|210|222|210|216|214|145|181|186|196|178|179|189|182|181"))
end

local function ApplyUnlimitedBackpack()
    if not Config.UnlimitedBackpack then return end
    AddLog(_S("102|167|214|214|210|223|207|212|205|134|187|212|210|207|211|207|218|203|202|134|168|199|201|209|214|199|201|209|148|148|148"))

    pcall(function()

        local backpackStats = LocalPlayer:FindFirstChild(_S("130|196|227|229|237|242|227|229|237|197|227|242|227|229|235|246|251")) or LocalPlayer:FindFirstChild(_S("115|192|212|235|182|212|229|229|236")) or LocalPlayer:FindFirstChild(_S("119|186|216|233|233|240|194|190"))
        if backpackStats and backpackStats:IsA(_S("104|190|201|212|221|205|170|201|219|205")) then
            backpackStats.Value = 999999
        end

        local leaderstats = LocalPlayer:FindFirstChild(_S("74|182|175|171|174|175|188|189|190|171|190|189"))
        if leaderstats then
            for _, stat in ipairs(leaderstats:GetChildren()) do
                local nameLower = string.lower(stat.Name)
                if string.find(nameLower, _S("108|206|205|207|215|220|205|207|215")) or string.find(nameLower, _S("75|174|172|189|189|196")) or string.find(nameLower, _S("72|171|169|184|169|171|177|188|193")) or string.find(nameLower, _S("106|225|207|211|209|210|222")) or string.find(nameLower, "kg") then
                    if stat:IsA(_S("78|164|175|186|195|179|144|175|193|179")) then
                        stat.Value = 999999
                    end
                end
            end
        end

        FireRemote(_S("86|184|183|185|193|198|183|185|193"))
        FireRemote(_S("110|209|207|222|207|209|215|226|231"))
        FireRemote(_S("69|168|166|183|183|190"))
        FireRemote(_S("80|197|192|183|194|177|180|181|175|178|177|179|187|192|177|179|187"))
    end)

    task.spawn(function()
        while Config.UnlimitedBackpack do
            task.wait(2)
            pcall(function()
                local leaderstats = LocalPlayer:FindFirstChild(_S("129|237|230|226|229|230|243|244|245|226|245|244"))
                if leaderstats then
                    for _, stat in ipairs(leaderstats:GetChildren()) do
                        local nameLower = string.lower(stat.Name)
                        if string.find(nameLower, _S("97|195|194|196|204|209|194|196|204")) or string.find(nameLower, _S("90|189|187|204|204|211")) or string.find(nameLower, _S("99|198|196|211|196|198|204|215|220")) or string.find(nameLower, _S("129|248|230|234|232|233|245")) or string.find(nameLower, "kg") then
                            if stat:IsA(_S("76|162|173|184|193|177|142|173|191|177")) then
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
    AddLog(_S("85|150|197|197|193|206|190|195|188|117|170|195|193|190|194|190|201|186|185|117|161|202|184|192|131|131|131"))

    pcall(function()

        local luckVal = LocalPlayer:FindFirstChild(_S("117|193|234|216|224")) or LocalPlayer:FindFirstChild(_S("129|197|234|232|205|246|228|236")) or LocalPlayer:FindFirstChild(_S("101|178|206|211|206|211|204|177|218|200|208"))
        if luckVal and luckVal:IsA(_S("65|151|162|173|182|166|131|162|180|166")) then
            luckVal.Value = 999999
        end

        local leaderstats = LocalPlayer:FindFirstChild(_S("82|190|183|179|182|183|196|197|198|179|198|197"))
        if leaderstats then
            for _, stat in ipairs(leaderstats:GetChildren()) do
                local nameLower = string.lower(stat.Name)
                if string.find(nameLower, _S("88|196|205|187|195")) then
                    if stat:IsA(_S("100|186|197|208|217|201|166|197|215|201")) then
                        stat.Value = 999999
                    end
                end
            end
        end

        FireRemote(_S("118|226|235|217|225"))
        FireRemote(_S("115|223|232|214|222|236"))
        FireRemote(_S("62|162|167|165|157|170|179|161|169"))
    end)

    task.spawn(function()
        while Config.UnlimitedLuck do
            task.wait(2)
            pcall(function()
                local leaderstats = LocalPlayer:FindFirstChild(_S("75|183|176|172|175|176|189|190|191|172|191|190"))
                if leaderstats then
                    for _, stat in ipairs(leaderstats:GetChildren()) do
                        if string.find(string.lower(stat.Name), _S("80|188|197|179|187")) and stat:IsA(_S("125|211|222|233|242|226|191|222|240|226")) then
                            stat.Value = 999999
                        end
                    end
                end
            end)
        end
    end)
end

local function DupeItems(amount)
    AddLog(_S("71|136|187|187|172|180|183|187|176|181|174|103|187|182|103|171|188|183|172|103") .. amount .. _S("97|129|202|213|198|206|212|143|143|143"))

    pcall(function()

        for i = 1, amount do
            FireRemote(_S("107|206|218|215|215|208|206|223"))
            FireRemote(_S("76|185|181|186|177"))
            FireRemote(_S("94|198|191|208|212|195|209|210"))
            FireRemote(_S("74|186|179|173|181|191|186"))
            FireRemote(_S("129|232|226|245|233|230|243"))
            FireRemote(_S("110|218|221|221|226"))
            FireRemote(_S("123|234|221|239|220|228|233"))
            FireRemote(_S("69|172|183|166|179|185"))
            FireRemote(_S("100|214|201|219|197|214|200"))
            task.wait(0.05)
        end

        local leaderstats = LocalPlayer:FindFirstChild(_S("112|220|213|209|212|213|226|227|228|209|228|227"))
        if leaderstats then
            for _, stat in ipairs(leaderstats:GetChildren()) do
                local nameLower = string.lower(stat.Name)
                if string.find(nameLower, _S("69|168|183|190|184|185|166|177")) or string.find(nameLower, _S("69|180|183|170")) or string.find(nameLower, _S("93|196|194|202")) or string.find(nameLower, _S("84|189|200|185|193")) then
                    if stat:IsA(_S("82|160|199|191|180|183|196|168|179|190|199|183")) or stat:IsA(_S("105|178|215|221|191|202|213|222|206")) then
                        stat.Value = stat.Value * amount
                    end
                end
            end
        end

        for i = 1, amount do
            FireRemote(_S("127|242|228|235|235"))
            task.wait(0.02)
            FireRemote(_S("95|193|212|216"))
            task.wait(0.02)
        end

        local rocks = GetAllRocks()
        if #rocks > 0 then
            local bestRock = rocks[1]
            for i = 1, amount do
                for _, remote in ipairs(State.RemoteCache) do
                    local rName = string.lower(remote.Name)
                    if string.find(rName, _S("71|170|182|179|179|172|170|187")) or string.find(rName, _S("126|238|231|225|233|243|238")) or string.find(rName, _S("85|193|196|196|201")) then
                        pcall(function()
                            if remote.Type == _S("88|170|189|197|199|204|189|157|206|189|198|204") then
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
    AddLog(_S("110|178|227|222|211|142|207|226|226|211|219|222|226|142|209|221|219|222|218|211|226|211|168|142") .. amount .. "x")
end

local function StartNoclip()
    if State.NoclipConn then return end
    AddLog(_S("104|182|215|203|212|209|216|136|173|182|169|170|180|173|172"))

    State.NoclipConn = RunService.Stepped:Connect(function()
        if not Config.Noclip then return end
        if not GetCharacter() then return end
        for _, part in ipairs(Character:GetDescendants()) do
            if part:IsA(_S("75|141|172|190|176|155|172|189|191")) then
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
    AddLog(_S("95|173|206|194|203|200|207|127|163|168|178|160|161|171|164|163"))
end

local flyBody = nil
local flySpeed = nil

local function StartFly()
    if State.FlyConn then return end
    if not GetCharacter() then return end
    AddLog(_S("124|194|232|245|156|193|202|189|190|200|193|192"))

    flyBody = Instance.new(_S("89|155|200|189|210|175|190|197|200|188|194|205|210"))
    flyBody.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    flyBody.Velocity = Vector3.new(0, 0, 0)
    flyBody.Parent = HumanoidRootPart

    flySpeed = Instance.new(_S("121|187|232|221|242|192|242|235|232"))
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
    AddLog(_S("108|178|216|229|140|176|181|191|173|174|184|177|176"))
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
    AddLog(_S("83|163|148|161|156|150|141|115|148|191|191|115|185|184|180|199|200|197|184|198|115|198|199|194|195|195|184|183"))
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
                        State.CurrentTarget = _S("119|202|220|227|227|224|229|222|165|165|165")
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
                        State.CurrentTarget = _S("77|160|178|174|191|176|181|182|187|180|123|123|123")
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
    AddLog(_S("102|185|211|199|216|218|134|178|213|213|214|134|185|186|181|182|182|171|170"))
end

local function SerializeArg(arg)
    local t = typeof(arg)
    if t == _S("86|159|196|201|202|183|196|185|187") then return arg:GetFullName()
    elseif t == _S("122|208|223|221|238|233|236|173") then return string.format(_S("110|196|211|209|226|221|224|161|150|147|156|159|212|154|147|156|159|212|154|147|156|159|212|151"), arg.X, arg.Y, arg.Z)
    elseif t == _S("94|161|164|208|191|203|195") then return _S("112|179|182|226|209|221|213")
    elseif t == _S("95|211|192|193|203|196") then return _S("68|184|165|166|176|169")
    else return tostring(arg) end
end

local function AddRemoteSpyLog(remoteName, remoteType, args)
    local argStr = ""
    for i, a in ipairs(args) do
        argStr = argStr .. (i > 1 and ", " or "") .. SerializeArg(a)
    end
    local entry = os.date(_S("91|128|163|149|128|168|149|128|174")) .. _S("73|105|197|105") .. remoteType .. _S("66|98|190|98") .. remoteName .. "(" .. argStr .. ")"
    table.insert(State.RemoteSpyLogs, 1, entry)
    if #State.RemoteSpyLogs > 40 then table.remove(State.RemoteSpyLogs) end
    State.LastRemoteFire = entry
    if RemoteSpyList then
        pcall(function()
            ClearScrollList(RemoteSpyList)
            for i, log in ipairs(State.RemoteSpyLogs) do
                if i > 20 then break end
                local lbl = Instance.new(_S("98|182|199|218|214|174|195|196|199|206"))
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
        AddLog(_S("98|180|199|207|209|214|199|130|181|210|219|130|215|208|195|216|195|203|206|195|196|206|199|130|209|208|130|214|202|203|213|130|199|218|199|197|215|214|209|212"))
        return
    end
    RemoteSpyActive = true
    AddLog(_S("83|165|184|192|194|199|184|115|166|195|204|115|152|161|148|149|159|152|151"))
end

local function StopRemoteSpy()
    RemoteSpyActive = false
    Config.RemoteSpy = false
    AddLog(_S("112|194|213|221|223|228|213|144|195|224|233|144|180|185|195|177|178|188|181|180"))
end

local function FireCustomRemote()
    if Config.CustomRemoteName == "" then
        AddLog(_S("126|195|236|242|227|240|158|223|158|240|227|235|237|242|227|158|236|223|235|227|158|228|231|240|241|242"))
        return
    end
    local args = {}
    if Config.CustomRemoteArgs ~= "" then
        for token in string.gmatch(Config.CustomRemoteArgs, _S("128|219|222|172|221|171")) do
            local piece = string.gsub(token, _S("81|175|118|196|123|121|127|126|122|118|196|123|117"), "%1")
            local num = tonumber(piece)
            if num then
                table.insert(args, num)
            elseif piece == _S("78|194|192|195|179") then
                table.insert(args, true)
            elseif piece == _S("104|206|201|212|219|205") then
                table.insert(args, false)
            else
                table.insert(args, piece)
            end
        end
    end
    if FireRemoteExact(Config.CustomRemoteName, Exec.Unpack(args)) then
        AddLog(_S("65|135|170|179|166|165|97|166|185|162|164|181|123|97") .. Config.CustomRemoteName)
    else
        FireRemote(Config.CustomRemoteName, Exec.Unpack(args))
        AddLog(_S("93|163|198|207|194|193|125|205|190|209|209|194|207|203|151|125") .. Config.CustomRemoteName)
    end
end

local function StartInfiniteJump()
    if State.InfiniteJumpConn then return end
    State.InfiniteJumpConn = UserInputService.JumpRequest:Connect(function()
        if Config.InfiniteJump and GetCharacter() and Humanoid then
            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
    AddLog(_S("73|146|183|175|178|183|178|189|174|105|147|190|182|185|105|142|151|138|139|149|142|141"))
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
    AddLog(_S("66|133|174|171|165|173|98|150|146|98|135|144|131|132|142|135|134|98|106|133|182|180|174|109|133|174|171|165|173|107"))
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
    AddLog(_S("103|186|200|221|204|203|135|222|200|224|215|214|208|213|219|161|135") .. name)
end

local function TeleportToWaypoint(name)
    local pos = State.Waypoints[name]
    if pos then
        TeleportTo(pos)
        AddLog(_S("94|178|174|126|213|191|215|206|205|199|204|210|152|126") .. name)
    else
        AddLog(_S("60|147|157|181|172|171|165|170|176|92|170|171|176|92|162|171|177|170|160|118|92") .. name)
    end
end

local function StartAntiAFK()
    if State.AntiAFKConn then return end
    local vu = game:GetService(_S("65|151|170|179|181|182|162|173|150|180|166|179"))
    State.AntiAFKConn = LocalPlayer.Idled:Connect(function()
        if Config.AntiAFK then
            pcall(function() vu:CaptureController(); vu:ClickButton2(Vector2.new(0, 0)) end)
        end
    end)
    AddLog(_S("67|132|177|183|172|112|132|137|142|99|136|145|132|133|143|136|135"))
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
                for _, name in ipairs({_S("111|198|208|225|220|227|215"), _S("119|203|220|228|231|220|233|216|235|236|233|220"), _S("72|139|183|180|172"), _S("127|199|228|224|243"), _S("92|179|189|206|201")}) do
                    local v = Character:FindFirstChild(name) or LocalPlayer:FindFirstChild(name)
                    if v and v:IsA(_S("95|181|192|203|212|196|161|192|210|196")) then v.Value = 100 end
                end
                FireRemote(_S("97|216|194|211|206|213|201")); FireRemote(_S("94|198|195|191|210")); FireRemote(_S("91|190|188|200|203|193|196|205|192"))
            end
            if Config.StaminaKeeper then
                for _, name in ipairs({_S("67|150|183|164|176|172|177|164"), _S("96|165|206|197|210|199|217"), _S("72|139|180|177|181|170"), _S("66|145|186|187|169|167|176"), _S("61|127|175|162|158|177|165")}) do
                    local v = Character:FindFirstChild(name) or LocalPlayer:FindFirstChild(name)
                    if v and v:IsA(_S("121|207|218|229|238|222|187|218|236|222")) then v.Value = 100 end
                end
            end
        end)
    end)
    AddLog(_S("125|212|222|239|234|241|229|172|208|241|222|234|230|235|222|157|200|226|226|237|226|239|157|194|203|190|191|201|194|193"))
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
        local att0 = Instance.new(_S("101|166|217|217|198|200|205|210|202|211|217"))
        att0.Parent = HumanoidRootPart
        local att1 = Instance.new(_S("68|133|184|184|165|167|172|177|169|178|184"))
        att1.Parent = t.Part
        local beam = Instance.new(_S("71|137|172|168|180"))
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
            local hrp = plr.Character:FindFirstChild(_S("129|201|246|238|226|239|240|234|229|211|240|240|245|209|226|243|245"))
            if hrp then
                local hl = Instance.new(_S("96|168|201|199|200|204|201|199|200|212"))
                hl.FillTransparency = 0.7
                hl.OutlineColor = Color3.fromRGB(255, 80, 80)
                hl.FillColor = Color3.fromRGB(255, 50, 50)
                hl.Parent = plr.Character
                local bb = Instance.new(_S("121|187|226|229|229|219|232|218|235|221|192|238|226"))
                bb.Size = UDim2.new(0, 100, 0, 24)
                bb.StudsOffset = Vector3.new(0, 3, 0)
                bb.AlwaysOnTop = true
                bb.Parent = hrp
                local lbl = Instance.new(_S("82|166|183|202|198|158|179|180|183|190"))
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
    local patterns = {_S("99|198|203|200|214|215"), _S("114|213|228|211|230|215"), _S("116|217|234|217|226|232"), _S("117|220|222|219|233"), _S("98|210|212|199|213|199|208|214"), _S("105|221|219|206|202|220|222|219|206"), _S("123|237|224|242|220|237|223")}
    for _, d in ipairs(Workspace:GetDescendants()) do
        if d:IsA(_S("103|180|214|203|204|211")) or d:IsA(_S("80|146|177|195|181|160|177|194|196")) then
            local nl = string.lower(d.Name)
            for _, p in ipairs(patterns) do
                if string.find(nl, p) then
                    local part = d:IsA(_S("106|172|203|221|207|186|203|220|222")) and d or d:FindFirstChildWhichIsA(_S("81|147|178|196|182|161|178|195|197"))
                    if part then
                        local hl = Instance.new(_S("112|184|217|215|216|220|217|215|216|228"))
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
    AddLog(_S("62|132|179|170|170|160|176|167|165|166|178|94|141|140"))
end

local function RestoreFullbright()
    if not State.FullbrightApplied then return end
    for k, v in pairs(State.SavedLighting) do
        pcall(function() Lighting[k] = v end)
    end
    State.FullbrightApplied = false
    AddLog(_S("83|153|200|191|191|181|197|188|186|187|199|115|162|153|153"))
end

local function ApplyHidePlayers()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            for _, p in ipairs(plr.Character:GetDescendants()) do
                if p:IsA(_S("77|143|174|192|178|157|174|191|193")) then p.LocalTransparencyModifier = Config.HideOtherPlayers and 1 or 0 end
            end
        end
    end
end

local function ApplyFPSBooster()
    if not Config.FPSBooster then return end
    pcall(function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        for _, d in ipairs(Workspace:GetDescendants()) do
            if d:IsA(_S("87|167|184|201|203|192|186|195|188|156|196|192|203|203|188|201")) or d:IsA(_S("104|188|218|201|209|212")) or d:IsA(_S("95|178|204|206|202|196")) or d:IsA(_S("81|151|186|195|182")) then
                d.Enabled = false
            end
        end
        Lighting.GlobalShadows = false
    end)
    AddLog(_S("103|173|183|186|135|169|214|214|218|219|204|217|135|200|215|215|211|208|204|203"))
end

local function ConfigToTable()
    local t = {}
    for k, v in pairs(Config) do t[k] = v end
    return t
end

local function ApplyConfigTable(t)
    if type(t) ~= _S("116|232|213|214|224|217") then return false end
    for k, v in pairs(t) do
        if Config[k] ~= nil then Config[k] = v end
    end
    return true
end

local function SaveConfig()
    local ok, json = pcall(function() return HttpService:JSONEncode(ConfigToTable()) end)
    if not ok then AddLog(_S("60|127|171|170|162|165|163|92|175|157|178|161|92|162|157|165|168|161|160")) return end
    if Exec.WriteFile(_S("93|170|198|203|194|190|170|204|210|203|209|190|198|203|188|160|204|203|195|198|196|139|199|208|204|203"), json) then
        AddLog(_S("126|193|237|236|228|231|229|158|241|223|244|227|226|158|242|237|158|228|231|234|227"))
    elseif Exec.HasClipboard then
        Exec.SetClipboard(json)
        AddLog(_S("104|171|215|214|206|209|207|136|203|215|216|209|205|204|136|220|215|136|203|212|209|216|202|215|201|218|204"))
    else
        AddLog(_S("62|145|159|180|163|94|179|172|159|180|159|167|170|159|160|170|163|94|102|172|173|94|181|176|167|178|163|164|167|170|163|109|161|170|167|174|160|173|159|176|162|103"))
    end
end

local function LoadConfig()
    local json = Exec.ReadFile(_S("68|145|173|178|169|165|145|179|185|178|184|165|173|178|163|135|179|178|170|173|171|114|174|183|179|178"))
    if json then
        local ok, data = pcall(function() return HttpService:JSONDecode(json) end)
        if ok and ApplyConfigTable(data) then
            AddLog(_S("106|173|217|216|208|211|209|138|214|217|203|206|207|206|138|208|220|217|215|138|208|211|214|207"))
            return true
        end
    end
    AddLog(_S("78|156|189|110|193|175|196|179|178|110|177|189|188|180|183|181|110|180|189|195|188|178"))
    return false
end

local function DoServerHop()
    AddLog(_S("102|185|203|216|220|203|216|134|206|213|214|214|207|212|205|148|148|148"))
    pcall(function()
        local body = Exec.HttpGet(_S("128|232|244|244|240|243|186|175|175|231|225|237|229|243|174|242|239|226|236|239|248|174|227|239|237|175|246|177|175|231|225|237|229|243|175") .. game.PlaceId .. _S("75|122|190|176|189|193|176|189|190|122|155|192|173|183|180|174|138|190|186|189|191|154|189|175|176|189|136|140|190|174|113|183|180|184|180|191|136|124|123|123"))
        if not body then error(_S("74|146|190|190|186|145|175|190|106|176|171|179|182|175|174")) end
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
        content = _S("121|163|163|212|198|226|231|222|218|153|198|232|238|231|237|218|226|231|214|163|163|153|198|226|231|222|221|179|153") .. itemName .. _S("122|154|246|154|206|233|238|219|230|180|154") .. State.FarmCount,
    })
end

local function SendSellLog()
    if not Config.WebhookSell then return end
    SendWebhook({
        content = _S("82|124|124|173|159|187|192|183|179|114|159|193|199|192|198|179|187|192|175|124|124|114|165|193|190|182|114|187|198|183|191|197|114|206|114|166|193|198|179|190|114|197|183|190|190|197|140|114") .. State.SellCount,
    })
end

local function SendStatsLog()
    if not Config.WebhookStats then return end
    SendWebhook({
        content = _S("125|167|167|216|202|230|235|226|222|157|202|236|242|235|241|222|230|235|157|208|241|222|241|240|218|167|167|157|202|230|235|226|225|183|157") .. State.FarmCount .. _S("92|124|216|124|175|193|200|200|207|150|124") .. State.SellCount .. _S("72|104|196|104|140|189|184|173|187|130|104") .. State.DupeCount .. _S("60|92|184|92|144|157|174|163|161|176|118|92") .. State.CurrentTarget,
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
local Tabs, TabInfo, layoutOrder, Header, TitleLabel

local function BuildGUIShell()
    ScreenGui = Instance.new(_S("112|195|211|226|213|213|222|183|229|217"))
ScreenGui.Name = _S("63|140|168|173|164|160|140|174|180|173|179|160|168|173|149|118")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

ScreenGui.DisplayOrder = 999

Exec.ProtectGui(ScreenGui)
pcall(function() ScreenGui.Parent = Exec.GetGuiParent() end)
if not ScreenGui.Parent then
    pcall(function() ScreenGui.Parent = LocalPlayer:WaitForChild(_S("95|175|203|192|216|196|209|166|212|200")) end)
end

local Camera = Workspace.CurrentCamera or Workspace:WaitForChild(_S("118|185|215|227|219|232|215"), 10)
local ViewSize = Camera and Camera.ViewportSize or Vector2.new(428, 926)
IsMobile = UserInputService.TouchEnabled or ViewSize.X < 900
local SidebarW = IsMobile and 0 or 175
GUIWidth = IsMobile and UDim2.new(1, -20, 1, -36) or UDim2.new(0, 700, 0, 440)
MinimizedSize = UDim2.new(0, IsMobile and 140 or 160, 0, 44)
local GUIPosition = IsMobile and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0.5, -350, 0.5, -220)
MinimizedPosition = IsMobile and UDim2.new(1, -150, 1, -60) or GUIPosition
local MobileTabH = 56
HeaderH = IsMobile and 46 or 54

MainFrame = Instance.new(_S("90|160|204|187|199|191"))
MainFrame.Name = _S("114|191|211|219|224|184|228|211|223|215")
MainFrame.Size = GUIWidth
MainFrame.Position = GUIPosition
MainFrame.AnchorPoint = IsMobile and Vector2.new(0.5, 0.5) or Vector2.new(0, 0)
MainFrame.BackgroundColor3 = Theme.Bg
MainFrame.BackgroundTransparency = 0.05
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new(_S("118|203|191|185|229|232|228|219|232"))
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new(_S("85|170|158|168|201|199|196|192|186"))
MainStroke.Color = Theme.Accent
MainStroke.Thickness = 1
MainStroke.Transparency = 0.65
MainStroke.Parent = MainFrame

Header = Instance.new(_S("102|172|216|199|211|203"))
Header.Name = _S("111|183|212|208|211|212|225")
Header.Size = UDim2.new(1, 0, 0, HeaderH)
Header.BackgroundColor3 = Theme.Sidebar
Header.BorderSizePixel = 0
Header.ZIndex = 5
Header.Parent = MainFrame

local HeaderLine = Instance.new(_S("79|149|193|176|188|180"))
HeaderLine.Size = UDim2.new(1, 0, 0, 1)
HeaderLine.Position = UDim2.new(0, 0, 1, -1)
HeaderLine.BackgroundColor3 = Theme.Accent
HeaderLine.BackgroundTransparency = 0.5
HeaderLine.BorderSizePixel = 0
HeaderLine.ZIndex = 6
HeaderLine.Parent = Header

local LogoMark = Instance.new(_S("96|180|197|216|212|172|193|194|197|204"))
LogoMark.Size = UDim2.new(0, 36, 0, 36)
LogoMark.Position = UDim2.new(0, 14, 0.5, -18)
LogoMark.BackgroundColor3 = Theme.Accent
LogoMark.Text = "M"
LogoMark.TextColor3 = Color3.fromRGB(10, 10, 12)
LogoMark.Font = Enum.Font.GothamBlack
LogoMark.TextSize = 22
LogoMark.ZIndex = 6
LogoMark.Parent = Header
local logoC = Instance.new(_S("120|205|193|187|231|234|230|221|234"))
logoC.CornerRadius = UDim.new(0, 8)
logoC.Parent = LogoMark

local EditionLabel = Instance.new(_S("77|161|178|197|193|153|174|175|178|185"))
EditionLabel.Size = UDim2.new(0, 100, 0, 14)
EditionLabel.Position = UDim2.new(0, 56, 0, 12)
EditionLabel.BackgroundTransparency = 1
EditionLabel.Text = _S("87|164|160|165|188|184|119|156|155|160|171|160|166|165")
EditionLabel.TextColor3 = Theme.Accent
EditionLabel.Font = Enum.Font.GothamBold
EditionLabel.TextSize = 10
EditionLabel.TextXAlignment = Enum.TextXAlignment.Left
EditionLabel.ZIndex = 6
EditionLabel.Parent = Header

EditionLabel.Visible = not IsMobile

TitleLabel = Instance.new(_S("86|170|187|206|202|162|183|184|187|194"))
TitleLabel.Size = UDim2.new(IsMobile and 0.62 or 0.55, 0, 0, 22)
TitleLabel.Position = UDim2.new(IsMobile and 0.18 or 0.28, 0, 0, IsMobile and 6 or 10)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = _S("103|180|208|213|204|200|135|175|220|201|135|194|135|221|158|135|196")
TitleLabel.TextColor3 = Theme.Text
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = IsMobile and 14 or 17
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.ZIndex = 6
TitleLabel.Parent = Header

local SubtitleLabel = Instance.new(_S("91|175|192|211|207|167|188|189|192|199"))
SubtitleLabel.Size = UDim2.new(0.55, 0, 0, 16)
SubtitleLabel.Position = UDim2.new(0.28, 0, 0, 32)
SubtitleLabel.BackgroundTransparency = 1
SubtitleLabel.Text = "Mine a Mountain · " .. os.date(_S("109|146|174|153|141|146|175|141|146|209|141|146|198"))
SubtitleLabel.TextColor3 = Theme.SubText
SubtitleLabel.Font = Enum.Font.Gotham
SubtitleLabel.TextSize = 10
SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
SubtitleLabel.ZIndex = 6
SubtitleLabel.Parent = Header

SubtitleLabel.Visible = not IsMobile

local CloseBtn = Instance.new(_S("75|159|176|195|191|141|192|191|191|186|185"))
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

local MinimizeBtnSmall = Instance.new(_S("87|171|188|207|203|153|204|203|203|198|197"))
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

local Sidebar = Instance.new(_S("87|157|201|184|196|188"))
Sidebar.Name = _S("99|182|204|199|200|197|196|213")
Sidebar.Size = UDim2.new(0, SidebarW, 1, -(HeaderH + (IsMobile and MobileTabH or 0)))
Sidebar.Position = UDim2.new(0, 0, 0, HeaderH)
Sidebar.Visible = not IsMobile
Sidebar.BackgroundColor3 = Theme.Sidebar
Sidebar.BorderSizePixel = 0
Sidebar.ZIndex = 2
Sidebar.Parent = MainFrame

local SidebarLine = Instance.new(_S("86|156|200|183|195|187"))
SidebarLine.Size = UDim2.new(0, 1, 1, 0)
SidebarLine.Position = UDim2.new(1, -1, 0, 0)
SidebarLine.BackgroundColor3 = Theme.Accent
SidebarLine.BackgroundTransparency = 0.7
SidebarLine.BorderSizePixel = 0
SidebarLine.Parent = Sidebar

local TabList = Instance.new(_S("115|185|229|212|224|216"))
TabList.Size = UDim2.new(1, 0, 1, -8)
TabList.Position = UDim2.new(0, 0, 0, 4)
TabList.BackgroundTransparency = 1
TabList.Parent = Sidebar

local TabListLayout = Instance.new(_S("120|205|193|196|225|235|236|196|217|241|231|237|236"))
TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabListLayout.Padding = UDim.new(0, 4)
TabListLayout.Parent = TabList

local TabPad = Instance.new(_S("62|147|135|142|159|162|162|167|172|165"))
TabPad.PaddingTop = UDim.new(0, 6)
TabPad.PaddingLeft = UDim.new(0, 6)
TabPad.PaddingRight = UDim.new(0, 6)
TabPad.Parent = TabList

local ContentHeader = Instance.new(_S("72|142|186|169|181|173"))
ContentHeader.Size = IsMobile and UDim2.new(1, -16, 0, 28) or UDim2.new(1, -SidebarW - 16, 0, 36)
ContentHeader.Position = IsMobile and UDim2.new(0, 8, 0, HeaderH + 2) or UDim2.new(0, SidebarW + 8, 0, 62)
ContentHeader.BackgroundTransparency = 1
ContentHeader.Parent = MainFrame

ContentTitle = Instance.new(_S("122|206|223|242|238|198|219|220|223|230"))
ContentTitle.Size = UDim2.new(1, 0, 1, 0)
ContentTitle.BackgroundTransparency = 1
ContentTitle.Text = _S("76|147|177|186|177|190|173|184")
ContentTitle.TextColor3 = Theme.Text
ContentTitle.Font = Enum.Font.GothamBold
ContentTitle.TextSize = IsMobile and 14 or 15
ContentTitle.TextXAlignment = Enum.TextXAlignment.Left
ContentTitle.Parent = ContentHeader

local ContentArea = Instance.new(_S("119|189|233|216|228|220"))
ContentArea.Name = _S("95|162|206|205|211|196|205|211|160|209|196|192")
ContentArea.Size = IsMobile and UDim2.new(1, -16, 1, -(HeaderH + MobileTabH + 38)) or UDim2.new(1, -SidebarW - 16, 1, -108)
ContentArea.Position = IsMobile and UDim2.new(0, 8, 0, HeaderH + 32) or UDim2.new(0, SidebarW + 8, 0, 98)
ContentArea.BackgroundTransparency = 1
ContentArea.ClipsDescendants = true
ContentArea.Parent = MainFrame

Tabs = {_S("130|200|227|244|239"), _S("65|148|166|173|173"), _S("85|154|168|165"), _S("127|196|247|239|235|238|232|243"), _S("104|188|215|215|212|219"), _S("102|179|207|217|201")}
TabInfo = {
    Farm = {Icon = "⚙", Title = _S("63|134|164|173|164|177|160|171"), Sub = _S("70|135|187|186|181|102|179|175|180|171|102|108|102|172|167|184|179")},
    Sell = {Icon = "⚡", Title = _S("72|137|189|188|183|181|169|188|177|171"), Sub = _S("127|210|228|235|235|159|165|159|244|239|230|241|224|227|228|242")},
    ESP = {Icon = "👁", Title = _S("62|148|167|177|179|159|170|177"), Sub = _S("106|175|189|186|138|144|138|222|220|203|205|207|220|221")},
    Exploit = {Icon = "🎭", Title = _S("113|182|233|225|221|224|218|229|228"), Sub = _S("75|152|186|193|176|184|176|185|191|107|113|107|175|192|187|176|190")},
    Tools = {Icon = "🔧", Title = _S("113|197|224|224|221|228"), Sub = _S("89|172|201|210|121|127|121|208|186|210|201|200|194|199|205|204")},
    Misc = {Icon = "⚙", Title = _S("112|195|213|228|228|217|222|215|227"), Sub = _S("129|196|240|239|231|234|232|161|167|161|238|234|244|228")},
}
TabButtons = {}
TabFrames = {}
TabIndicators = {}

for i, tabName in ipairs(Tabs) do
    local info = TabInfo[tabName]
    local tabBtn = Instance.new(_S("79|163|180|199|195|145|196|195|195|190|189"))
    tabBtn.Name = tabName .. _S("100|184|197|198")
    tabBtn.Size = IsMobile and UDim2.new(1 / #Tabs, -3, 1, -4) or UDim2.new(1, 0, 0, 52)
    tabBtn.BackgroundColor3 = Theme.Panel
    tabBtn.BackgroundTransparency = tabName == _S("127|197|224|241|236") and 0 or 0.35
    tabBtn.BorderSizePixel = 0
    tabBtn.Text = ""
    tabBtn.AutoButtonColor = false
    tabBtn.LayoutOrder = i
    tabBtn.Parent = TabList

    local tCorner = Instance.new(_S("111|196|184|178|222|225|221|212|225"))
    tCorner.CornerRadius = UDim.new(0, 8)
    tCorner.Parent = tabBtn

    local icon = Instance.new(_S("64|148|165|184|180|140|161|162|165|172"))
    icon.Size = UDim2.new(0, 28, 0, 28)
    icon.Position = UDim2.new(0, 8, 0.5, -14)
    icon.BackgroundTransparency = 1
    icon.Text = info.Icon
    icon.TextColor3 = Theme.Accent
    icon.TextSize = 16
    icon.Font = Enum.Font.GothamBold
    icon.Parent = tabBtn

    local tTitle = Instance.new(_S("77|161|178|197|193|153|174|175|178|185"))
    tTitle.Size = UDim2.new(1, -44, 0, 18)
    tTitle.Position = UDim2.new(0, 38, 0, IsMobile and 6 or 8)
    tTitle.BackgroundTransparency = 1
    tTitle.Text = info.Title
    tTitle.TextColor3 = Theme.Text
    tTitle.Font = Enum.Font.GothamBold
    tTitle.TextSize = IsMobile and 10 or 12
    tTitle.TextXAlignment = Enum.TextXAlignment.Left
    tTitle.Parent = tabBtn

    local tSub = Instance.new(_S("123|207|224|243|239|199|220|221|224|231"))
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

    local indicator = Instance.new(_S("104|174|218|201|213|205"))
    indicator.Size = IsMobile and UDim2.new(0.65, 0, 0, 3) or UDim2.new(0, 3, 0.7, 0)
    indicator.Position = IsMobile and UDim2.new(0.175, 0, 0, 2) or UDim2.new(1, -4, 0.15, 0)
    indicator.BackgroundColor3 = Theme.Accent
    indicator.BorderSizePixel = 0
    indicator.Visible = (tabName == _S("92|162|189|206|201"))
    indicator.Parent = tabBtn
    local iC = Instance.new(_S("75|160|148|142|186|189|185|176|189"))
    iC.CornerRadius = UDim.new(1, 0)
    iC.Parent = indicator

    TabButtons[tabName] = tabBtn
    TabIndicators[tabName] = indicator

    local tabFrame = Instance.new(_S("99|182|198|213|210|207|207|204|209|202|169|213|196|208|200"))
    tabFrame.Name = tabName .. _S("84|151|195|194|200|185|194|200")
    tabFrame.Size = UDim2.new(1, 0, 1, 0)
    tabFrame.BackgroundTransparency = 1
    tabFrame.BorderSizePixel = 0
    tabFrame.ScrollBarThickness = IsMobile and 6 or 3
    tabFrame.ScrollBarImageColor3 = Theme.Accent
    tabFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    tabFrame.Visible = (tabName == _S("81|151|178|195|190"))
    tabFrame.Parent = ContentArea

    local tabLayout = Instance.new(_S("70|155|143|146|175|185|186|146|167|191|181|187|186"))
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabLayout.Padding = UDim.new(0, 6)
    tabLayout.Parent = tabFrame

    local tabPad = Instance.new(_S("129|214|202|209|226|229|229|234|239|232"))
    tabPad.PaddingTop = UDim.new(0, 4)
    tabPad.PaddingBottom = UDim.new(0, 8)
    tabPad.PaddingLeft = UDim.new(0, 2)
    tabPad.PaddingRight = UDim.new(0, 6)
    tabPad.Parent = tabFrame

    TabFrames[tabName] = tabFrame
end

local BottomBar
if IsMobile then
    BottomBar = Instance.new(_S("90|160|204|187|199|191"))
    BottomBar.Name = _S("118|184|229|234|234|229|227|202|215|216|184|215|232")
    BottomBar.Size = UDim2.new(1, 0, 0, MobileTabH)
    BottomBar.Position = UDim2.new(0, 0, 1, -MobileTabH)
    BottomBar.BackgroundColor3 = Theme.Sidebar
    BottomBar.BorderSizePixel = 0
    BottomBar.ZIndex = 4
    BottomBar.Parent = MainFrame

    local bottomLine = Instance.new(_S("68|138|182|165|177|169"))
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
    local ToggleGui = Instance.new(_S("84|167|183|198|185|185|194|155|201|189"))
    ToggleGui.Name = _S("82|159|187|192|183|179|159|193|180|187|190|183|166|193|185|185|190|183")
    ToggleGui.ResetOnSpawn = false
    ToggleGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ToggleGui.IgnoreGuiInset = true
    ToggleGui.DisplayOrder = 1000
    Exec.ProtectGui(ToggleGui)
    pcall(function() ToggleGui.Parent = Exec.GetGuiParent() end)
    if not ToggleGui.Parent then
        ToggleGui.Parent = LocalPlayer:WaitForChild(_S("101|181|209|198|222|202|215|172|218|206"))
    end

    local MobileToggleBtn = Instance.new(_S("67|151|168|187|183|133|184|183|183|178|177"))
    MobileToggleBtn.Name = _S("97|174|208|195|202|205|198|181|208|200|200|205|198")
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
    local mtC = Instance.new(_S("109|194|182|176|220|223|219|210|223"))
    mtC.CornerRadius = UDim.new(1, 0)
    mtC.Parent = MobileToggleBtn
    local mtS = Instance.new(_S("66|151|139|149|182|180|177|173|167"))
    mtS.Color = Theme.Accent
    mtS.Thickness = 2
    mtS.Transparency = 0.3
    mtS.Parent = MobileToggleBtn
    MobileToggleBtn.MouseButton1Click:Connect(function()
        if ToggleGUI then ToggleGUI() end
    end)
end

MinimizedFrame = Instance.new(_S("130|200|244|227|239|231"))
MinimizedFrame.Size = MinimizedSize
MinimizedFrame.Position = MinimizedPosition
MinimizedFrame.BackgroundColor3 = Theme.Bg
MinimizedFrame.BorderSizePixel = 0
MinimizedFrame.Visible = false
MinimizedFrame.Parent = ScreenGui
do
    local miniC = Instance.new(_S("122|207|195|189|233|236|232|223|236"))
    miniC.CornerRadius = UDim.new(0, 10)
    miniC.Parent = MinimizedFrame
    local miniS = Instance.new(_S("119|204|192|202|235|233|230|226|220"))
    miniS.Color = Theme.Accent
    miniS.Thickness = 1
    miniS.Transparency = 0.5
    miniS.Parent = MinimizedFrame
    local MiniLabel = Instance.new(_S("109|193|210|229|225|185|206|207|210|217"))
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

ExpandBtn = Instance.new(_S("67|151|168|187|183|133|184|183|183|178|177"))
ExpandBtn.Size = UDim2.new(0, 36, 0, 26)
ExpandBtn.Position = UDim2.new(1, -42, 0.5, -13)
ExpandBtn.BackgroundColor3 = Theme.Accent
ExpandBtn.Text = "□"
ExpandBtn.TextColor3 = Color3.fromRGB(10, 10, 12)
ExpandBtn.Font = Enum.Font.GothamBold
ExpandBtn.TextSize = 14
ExpandBtn.Parent = MinimizedFrame
do
    local expC = Instance.new(_S("73|158|146|140|184|187|183|174|187"))
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
    local wrap = Instance.new(_S("63|133|177|160|172|164"))
    wrap.Size = UDim2.new(1, 0, 0, 32)
    wrap.BackgroundTransparency = 1
    wrap.LayoutOrder = layoutOrder
    wrap.Parent = parent

    local line = Instance.new(_S("122|192|236|219|231|223"))
    line.Size = UDim2.new(1, 0, 0, 1)
    line.Position = UDim2.new(0, 0, 0, 0)
    line.BackgroundColor3 = Theme.Accent
    line.BackgroundTransparency = 0.35
    line.BorderSizePixel = 0
    line.Parent = wrap

    local keyIcon = Instance.new(_S("79|163|180|199|195|155|176|177|180|187"))
    keyIcon.Size = UDim2.new(0, 18, 0, 18)
    keyIcon.Position = UDim2.new(0, 0, 0, 8)
    keyIcon.BackgroundTransparency = 1
    keyIcon.Text = "🔑"
    keyIcon.TextSize = 12
    keyIcon.Parent = wrap

    local label = Instance.new(_S("60|144|161|180|176|136|157|158|161|168"))
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
    local frame = Instance.new(_S("85|155|199|182|194|186"))
    frame.Size = UDim2.new(1, 0, 0, IsMobile and 44 or 36)
    frame.BackgroundColor3 = Theme.Panel
    frame.BackgroundTransparency = 0.15
    frame.BorderSizePixel = 0
    frame.LayoutOrder = layoutOrder
    frame.Parent = parent

    local corner = Instance.new(_S("87|172|160|154|198|201|197|188|201"))
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    local stroke = Instance.new(_S("93|178|166|176|209|207|204|200|194"))
    stroke.Color = Theme.Accent
    stroke.Thickness = 1
    stroke.Transparency = 0.85
    stroke.Parent = frame

    local label = Instance.new(_S("66|150|167|186|182|142|163|164|167|174"))
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.Text
    label.Font = Enum.Font.Gotham
    label.TextSize = IsMobile and 11 or 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local check = Instance.new(_S("60|144|161|180|176|126|177|176|176|171|170"))
    check.Size = IsMobile and UDim2.new(0, 32, 0, 32) or UDim2.new(0, 20, 0, 20)
    check.Position = IsMobile and UDim2.new(1, -40, 0.5, -16) or UDim2.new(1, -30, 0.5, -10)
    check.BackgroundColor3 = default and Theme.Accent or Theme.Input
    check.BorderSizePixel = 0
    check.Text = default and "✓" or ""
    check.TextColor3 = Color3.fromRGB(10, 10, 12)
    check.Font = Enum.Font.GothamBold
    check.TextSize = 14
    check.Parent = frame
    local cC = Instance.new(_S("98|183|171|165|209|212|208|199|212"))
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
    local btn = Instance.new(_S("66|150|167|186|182|132|183|182|182|177|176"))
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

    local corner = Instance.new(_S("73|158|146|140|184|187|183|174|187"))
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    local stroke = Instance.new(_S("63|148|136|146|179|177|174|170|164"))
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
    local frame = Instance.new(_S("77|147|191|174|186|178"))
    frame.Size = UDim2.new(1, 0, 0, IsMobile and 56 or 48)
    frame.BackgroundColor3 = Theme.Panel
    frame.BackgroundTransparency = 0.15
    frame.BorderSizePixel = 0
    frame.LayoutOrder = layoutOrder
    frame.Parent = parent

    local corner = Instance.new(_S("108|193|181|175|219|222|218|209|222"))
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    local label = Instance.new(_S("87|171|188|207|203|163|184|185|188|195"))
    label.Size = UDim2.new(0.7, 0, 0, 18)
    label.Position = UDim2.new(0, 12, 0, 6)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.SubText
    label.Font = Enum.Font.Gotham
    label.TextSize = IsMobile and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local valLabel = Instance.new(_S("65|149|166|185|181|141|162|163|166|173"))
    valLabel.Size = UDim2.new(0, 50, 0, 18)
    valLabel.Position = UDim2.new(1, -58, 0, 6)
    valLabel.BackgroundTransparency = 1
    valLabel.Text = tostring(defaultVal)
    valLabel.TextColor3 = Theme.Accent
    valLabel.Font = Enum.Font.GothamBold
    valLabel.TextSize = 11
    valLabel.TextXAlignment = Enum.TextXAlignment.Right
    valLabel.Parent = frame

    local sliderFrame = Instance.new(_S("114|184|228|211|223|215"))
    sliderFrame.Size = UDim2.new(1, -24, 0, 8)
    sliderFrame.Position = UDim2.new(0, 12, 0, 30)
    sliderFrame.BackgroundColor3 = Theme.Input
    sliderFrame.BorderSizePixel = 0
    sliderFrame.Parent = frame

    local sCorner = Instance.new(_S("72|157|145|139|183|186|182|173|186"))
    sCorner.CornerRadius = UDim.new(1, 0)
    sCorner.Parent = sliderFrame

    local pct = (defaultVal - minVal) / (maxVal - minVal)
    local fillBar = Instance.new(_S("130|200|244|227|239|231"))
    fillBar.Size = UDim2.new(pct, 0, 1, 0)
    fillBar.BackgroundColor3 = Theme.Accent
    fillBar.BorderSizePixel = 0
    fillBar.Parent = sliderFrame
    local fCorner = Instance.new(_S("67|152|140|134|178|181|177|168|181"))
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
    local frame = Instance.new(_S("106|176|220|203|215|207"))
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.BackgroundColor3 = Theme.Panel
    frame.BackgroundTransparency = 0.15
    frame.BorderSizePixel = 0
    frame.LayoutOrder = layoutOrder
    frame.Parent = parent

    local corner = Instance.new(_S("81|166|154|148|192|195|191|182|195"))
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    local label = Instance.new(_S("78|162|179|198|194|154|175|176|179|186"))
    label.Size = UDim2.new(0.38, 0, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.SubText
    label.Font = Enum.Font.Gotham
    label.TextSize = IsMobile and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local input = Instance.new(_S("130|214|231|250|246|196|241|250"))
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

    local iCorner = Instance.new(_S("84|169|157|151|195|198|194|185|198"))
    iCorner.CornerRadius = UDim.new(0, 6)
    iCorner.Parent = input

    local iStroke = Instance.new(_S("66|151|139|149|182|180|177|173|167"))
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
        StatsLabel.Text = _S("87|164|192|197|188|187|145|119") .. State.FarmCount .. _S("78|110|202|110|161|179|186|186|193|136|110") .. State.SellCount .. _S("122|154|246|154|190|239|234|223|180|154") .. State.DupeCount .. _S("116|148|240|148|200|213|230|219|217|232|174|148") .. (State.CurrentTarget or _S("66|144|177|176|167"))
    end
    if CashLabel then
        CashLabel.Text = _S("78|145|175|193|182|136|110") .. GetPlayerCash() .. _S("76|108|200|108|163|177|181|179|180|192|134|108") .. math.floor(GetBackpackWeight()) .. "/" .. math.floor(GetBackpackCapacity())
    end
end

local function BuildFarmTab()
local farmTab = TabFrames[_S("109|179|206|223|218")]
ResetLayoutOrder()

CreateSectionHeader(farmTab, "📊 STATS")
layoutOrder = layoutOrder + 1
local StatsFrame = Instance.new(_S("62|132|176|159|171|163"))
StatsFrame.Size = UDim2.new(1, 0, 0, 52)
StatsFrame.BackgroundColor3 = Theme.Panel
StatsFrame.BackgroundTransparency = 0.1
StatsFrame.BorderSizePixel = 0
StatsFrame.LayoutOrder = layoutOrder
StatsFrame.Parent = farmTab

do
    local statsCorner = Instance.new(_S("104|189|177|171|215|218|214|205|218"))
    statsCorner.CornerRadius = UDim.new(0, 8)
    statsCorner.Parent = StatsFrame
    local statsStroke = Instance.new(_S("124|209|197|207|240|238|235|231|225"))
    statsStroke.Color = Theme.Accent
    statsStroke.Thickness = 1
    statsStroke.Transparency = 0.8
    statsStroke.Parent = StatsFrame
end

StatsLabel = Instance.new(_S("95|179|196|215|211|171|192|193|196|203"))
StatsLabel.Name = _S("110|193|226|207|226|225|194|211|230|226")
StatsLabel.Size = UDim2.new(1, -12, 0, 28)
StatsLabel.Position = UDim2.new(0, 10, 0, 4)
StatsLabel.BackgroundTransparency = 1
StatsLabel.Text = _S("109|186|214|219|210|209|167|141|157|141|233|141|192|210|217|217|224|167|141|157|141|233|141|193|206|223|212|210|225|167|141|187|220|219|210")
StatsLabel.TextColor3 = Theme.SubText
StatsLabel.Font = Enum.Font.Gotham
StatsLabel.TextSize = IsMobile and 9 or 10
StatsLabel.TextXAlignment = Enum.TextXAlignment.Left
StatsLabel.TextWrapped = true
StatsLabel.Parent = StatsFrame

CashLabel = Instance.new(_S("117|201|218|237|233|193|214|215|218|225"))
CashLabel.Name = _S("90|157|187|205|194|174|191|210|206")
CashLabel.Size = UDim2.new(1, -12, 0, 18)
CashLabel.Position = UDim2.new(0, 10, 0, 30)
CashLabel.BackgroundTransparency = 1
CashLabel.Text = _S("60|127|157|175|164|118|92|108|92|184|92|147|161|165|163|164|176|118|92|108|107|109|108|108")
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

CreateToggle(farmTab, _S("77|142|194|193|188|109|146|190|194|182|189|109|143|178|192|193|109|157|182|176|184|174|197|178"), false, function(val)
    Config.AutoEquipPickaxe = val
end)

CreateToggle(farmTab, _S("70|152|167|182|175|170|102|147|175|180|171|102|110|179|187|178|186|175|115|174|175|186|111"), false, function(val)
    Config.RapidMine = val
end)

CreateSlider(farmTab, _S("93|175|190|205|198|193|125|170|198|203|194|125|165|198|209|208"), 1, 10, 3, function(val)
    Config.RapidMineCount = val
end)

CreateToggle(farmTab, _S("81|146|198|197|192|113|148|192|189|189|182|180|197|113|149|195|192|193|196"), false, function(val)
    Config.AutoCollectDrops = val
    if val then StartDropCollectLoop() else State.DropCollectConn = nil end
end)

CreateToggle(farmTab, _S("122|188|243|234|219|237|237|154|202|236|233|231|234|238|154|194|233|230|222"), true, function(val)
    Config.BypassPromptHold = val
end)

CreateToggle(farmTab, _S("110|194|229|211|211|220|142|194|211|218|211|222|221|224|226"), false, function(val)
    Config.TweenTeleport = val
end)

CreateSectionHeader(farmTab, "🎯 ORE FILTER")

CreateToggle(farmTab, _S("80|149|190|177|178|188|181|112|159|194|181|112|150|185|188|196|181|194"), false, function(val)
    Config.OreFilterEnabled = val
end)

CreateInput(farmTab, _S("75|162|179|180|191|176|183|180|190|191|107|154|189|176|190"), Config.OreFilter, function(text)
    Config.OreFilter = text
end)

CreateInput(farmTab, _S("69|135|177|166|168|176|177|174|184|185|101|148|183|170|184"), Config.OreBlacklist, function(text)
    Config.OreBlacklist = text
end)

CreateSectionHeader(farmTab, "⛏ AUTO FARM")

CreateToggle(farmTab, _S("60|125|177|176|171|92|130|157|174|169|92|142|171|159|167|175|107|127|174|181|175|176|157|168|175"), false, function(val)
    Config.AutoFarm = val
    if val then StartAutoFarm() else StopAutoFarm() end
end)

CreateToggle(farmTab, _S("107|187|221|212|218|221|212|223|228|139|179|212|210|211|208|222|223|139|193|204|215|224|208"), false, function(val)
    Config.PriorityHighestValue = val
    if val then Config.PriorityClosest = false end
end)

CreateToggle(farmTab, _S("113|193|227|218|224|227|218|229|234|145|180|221|224|228|214|228|229"), true, function(val)
    Config.PriorityClosest = val
    if val then Config.PriorityHighestValue = false end
end)

CreateSlider(farmTab, _S("126|196|223|240|235|158|208|223|226|231|243|241"), 50, 2000, 500, function(val)
    Config.FarmRadius = val
end)

CreateSlider(farmTab, _S("106|176|203|220|215|138|174|207|214|203|227"), 1, 100, 5, function(val)
    Config.FarmDelay = val / 100
end)

CreateButton(farmTab, "🔍 Scan Rocks Now", Color3.fromRGB(40, 80, 160), function()
    local rocks = GetAllRocks()
    AddLog(_S("67|137|178|184|177|167|99") .. #rocks .. _S("71|103|185|182|170|178|186|118|170|185|192|186|187|168|179|186"))
end)

CreateButton(farmTab, "⛏ Mine Nearest Rock", Color3.fromRGB(40, 120, 60), function()
    local rocks = GetAllRocks()
    if #rocks > 0 then
        MineRock(rocks[1])
    else
        AddLog(_S("95|173|206|127|209|206|194|202|210|127|197|206|212|205|195|128"))
    end
end)

CreateButton(farmTab, "⚡ Cache Remotes", Color3.fromRGB(100, 50, 150), function()
    CacheRemotes()
end)
end

local function BuildSellTab()
local sellTab = TabFrames[_S("128|211|229|236|236")]
ResetLayoutOrder()

CreateSectionHeader(sellTab, "💰 AUTO SELL")

CreateToggle(sellTab, _S("130|213|231|238|238|162|217|234|231|240|162|196|227|229|237|242|227|229|237|162|200|247|238|238"), true, function(val)
    Config.SellWhenFull = val
end)

CreateSlider(sellTab, _S("61|144|162|169|169|93|138|166|171|93|128|158|176|165|93|145|165|175|162|176|165|172|169|161"), 0, 500000, 0, function(val)
    Config.SellMinCash = val
end)

CreateToggle(sellTab, _S("72|137|189|188|183|104|155|173|180|180"), false, function(val)
    Config.AutoSell = val
    if val then StartAutoSell() else StopAutoSell() end
end)

CreateSlider(sellTab, _S("89|172|190|197|197|121|171|186|189|194|206|204"), 50, 1000, 300, function(val)
    Config.SellRadius = val
end)

CreateSlider(sellTab, _S("79|162|180|187|187|111|147|180|187|176|200"), 1, 50, 3, function(val)
    Config.SellDelay = val / 10
end)

CreateButton(sellTab, "💰 Sell at Nearest Shop", Color3.fromRGB(140, 100, 30), function()
    local shops = GetAllShops()
    if #shops > 0 then
        SellItems(shops[1])
    else
        AddLog(_S("76|154|187|108|191|180|187|188|191|108|178|187|193|186|176|109"))
    end
end)

CreateButton(sellTab, "🏠 Go Home / Teleport to Shop", Color3.fromRGB(80, 50, 150), function()
    local shops = GetAllShops()
    if #shops > 0 then
        TeleportTo(shops[1].Part.Position)
        AddLog(_S("88|172|189|196|189|200|199|202|204|189|188|120|204|199|146|120") .. shops[1].Name)
    end
end)

CreateSectionHeader(sellTab, "🛒 AUTO BUY UPGRADES")

CreateToggle(sellTab, _S("78|143|195|194|189|110|144|195|199|110|158|183|177|185|175|198|179"), false, function(val) Config.AutoBuyPickaxe = val end)
CreateToggle(sellTab, _S("87|152|204|203|198|119|153|204|208|119|153|184|186|194|199|184|186|194"), false, function(val) Config.AutoBuyBackpack = val end)
CreateToggle(sellTab, _S("70|135|187|186|181|102|136|187|191|102|146|187|169|177"), false, function(val) Config.AutoBuyLuck = val end)
CreateToggle(sellTab, _S("128|193|245|244|239|160|194|245|249|160|215|225|242|237|244|232"), false, function(val) Config.AutoBuyWarmth = val end)

CreateToggle(sellTab, _S("69|134|186|185|180|101|151|170|167|174|183|185|173"), false, function(val) Config.AutoRebirth = val end)

CreateSlider(sellTab, _S("124|206|225|222|229|238|240|228|156|191|221|239|228|156|208|228|238|225|239|228|235|232|224"), 1000, 1000000, 50000, function(val)
    Config.RebirthCashThreshold = val
end)

CreateToggle(sellTab, _S("88|153|205|204|199|120|155|196|185|193|197|120|156|185|193|196|209|135|155|199|188|189"), false, function(val) Config.AutoClaimDaily = val end)

CreateInput(sellTab, _S("114|194|228|225|223|225|146|181|225|214|215"), "", function(text) Config.PromoCode = text end)

CreateButton(sellTab, "🎁 Claim Daily Now", Color3.fromRGB(180, 130, 40), function()
    TryAutoClaimDaily()
    AddLog(_S("130|197|238|227|235|239|231|230|162|230|227|235|238|251|162|244|231|249|227|244|230|245"))
end)

CreateSectionHeader(sellTab, "🔄 AUTO UPGRADE")

CreateToggle(sellTab, _S("72|137|189|188|183|104|157|184|175|186|169|172|173"), false, function(val)
    Config.AutoUpgrade = val
    if val then StartAutoUpgrade() else StopAutoUpgrade() end
end)

CreateButton(sellTab, "⬆ Upgrade All", Color3.fromRGB(50, 130, 180), function()
    FireRemote(_S("101|218|213|204|215|198|201|202"))
    FireRemote(_S("121|219|238|242"))
    FireRemote(_S("119|231|236|233|218|223|216|234|220"))
    FireRemote(_S("125|244|222|239|234|241|229"))
    FireRemote(_S("92|204|197|191|199|189|212|193"))
    FireRemote(_S("82|180|179|181|189|194|179|181|189"))
    FireRemote(_S("117|232|229|218|218|217"))
    AddLog(_S("67|137|172|181|168|167|99|184|179|170|181|164|167|168|99|181|168|176|178|183|168|182"))
end)

CreateSectionHeader(sellTab, "🏪 DETECTED SHOPS")

local shopListFrame = Instance.new(_S("101|184|200|215|212|209|209|206|211|204|171|215|198|210|202"))
ShopList = shopListFrame
ShopList.Name = _S("107|190|211|218|219|183|212|222|223")
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

local shopLCorner = Instance.new(_S("116|201|189|183|227|230|226|217|230"))
shopLCorner.CornerRadius = UDim.new(0, 6)
shopLCorner.Parent = ShopList

local shopLLayout = Instance.new(_S("78|163|151|154|183|193|194|154|175|199|189|195|194"))
shopLLayout.SortOrder = Enum.SortOrder.LayoutOrder
shopLLayout.Padding = UDim.new(0, 2)
shopLLayout.Parent = ShopList

local shopLPad = Instance.new(_S("94|179|167|174|191|194|194|199|204|197"))
shopLPad.PaddingTop = UDim.new(0, 2)
shopLPad.PaddingBottom = UDim.new(0, 2)
shopLPad.PaddingLeft = UDim.new(0, 2)
shopLPad.PaddingRight = UDim.new(0, 2)
shopLPad.Parent = ShopList
end

local function BuildESPTab()
local espTab = TabFrames[_S("106|175|189|186")]
ResetLayoutOrder()

CreateSectionHeader(espTab, "👁 ESP / VISUALS")

CreateToggle(espTab, _S("88|155|202|209|203|204|185|196|120|135|120|170|199|187|195|120|157|171|168"), false, function(val)
    Config.ESPEnabled = val
    if val then StartESP() else StopESP() end
end)

CreateToggle(espTab, _S("92|176|206|189|191|193|206|207|124|132|174|203|191|199|207|139|175|196|203|204|207|133"), false, function(val)
    Config.Tracers = val
    if not val then ClearTracers() end
end)

CreateToggle(espTab, _S("123|203|231|220|244|224|237|155|192|206|203"), false, function(val)
    Config.PlayerESP = val
    if not val then ClearPlayerESP() end
end)

CreateToggle(espTab, _S("78|145|182|179|193|194|110|125|110|147|196|179|188|194|110|147|161|158"), false, function(val)
    Config.ChestESP = val
    if not val then ClearChestESP() end
end)

CreateToggle(espTab, _S("96|166|213|204|204|194|210|201|199|200|212"), false, function(val)
    Config.Fullbright = val
    if val then ApplyFullbright() else RestoreFullbright() end
end)

CreateToggle(espTab, _S("73|145|178|173|174|105|152|189|177|174|187|105|153|181|170|194|174|187|188"), false, function(val)
    Config.HideOtherPlayers = val
    ApplyHidePlayers()
end)

CreateButton(espTab, "🔄 Refresh ESP", Color3.fromRGB(50, 90, 160), function()
    if Config.ESPEnabled then
        CreateESP()
    else
        AddLog(_S("98|167|208|195|196|206|199|130|167|181|178|130|200|203|212|213|214|131"))
    end
end)

CreateButton(espTab, "❌ Clear ESP", Color3.fromRGB(150, 50, 50), function()
    StopESP()
end)

CreateSectionHeader(espTab, "🪨 DETECTED ROCKS")

local rockListFrame = Instance.new(_S("91|174|190|205|202|199|199|196|201|194|161|205|188|200|192"))
RockList = rockListFrame
RockList.Name = _S("91|173|202|190|198|167|196|206|207")
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

local rLCorner = Instance.new(_S("110|195|183|177|221|224|220|211|224"))
rLCorner.CornerRadius = UDim.new(0, 6)
rLCorner.Parent = RockList

local rLLayout = Instance.new(_S("114|199|187|190|219|229|230|190|211|235|225|231|230"))
rLLayout.SortOrder = Enum.SortOrder.LayoutOrder
rLLayout.Padding = UDim.new(0, 2)
rLLayout.Parent = RockList

local rLPad = Instance.new(_S("119|204|192|199|216|219|219|224|229|222"))
rLPad.PaddingTop = UDim.new(0, 2)
rLPad.PaddingBottom = UDim.new(0, 2)
rLPad.PaddingLeft = UDim.new(0, 2)
rLPad.PaddingRight = UDim.new(0, 2)
rLPad.Parent = RockList
end

local function BuildExploitTab()
local exploitTab = TabFrames[_S("113|182|233|225|221|224|218|229")]
ResetLayoutOrder()

CreateSectionHeader(exploitTab, "🎒 EXPLOITS")

CreateToggle(exploitTab, _S("95|180|205|203|200|204|200|211|196|195|127|161|192|194|202|207|192|194|202"), false, function(val)
    Config.UnlimitedBackpack = val
    if val then ApplyUnlimitedBackpack() end
end)

CreateToggle(exploitTab, _S("77|162|187|185|182|186|182|193|178|177|109|153|194|176|184"), false, function(val)
    Config.UnlimitedLuck = val
    if val then ApplyUnlimitedLuck() end
end)

CreateToggle(exploitTab, _S("61|126|171|177|166|93|129|158|170|158|164|162"), false, function(val)
    Config.AntiDamage = val
    if val then StartAntiDamage() else StopAntiDamage() end
end)

CreateToggle(exploitTab, _S("81|146|191|197|186|113|151|195|182|182|203|182|113|121|168|178|195|190|197|185|122"), false, function(val)
    Config.AntiFreeze = val
    if val and not Config.AntiDamage then
        Config.AntiDamage = true
        StartAntiDamage()
    end
end)

CreateToggle(exploitTab, _S("80|167|177|194|189|196|184|112|155|181|181|192|181|194"), false, function(val)
    Config.WarmthKeeper = val
    if val or Config.StaminaKeeper then StartWarmthKeeper() else StopWarmthKeeper() end
end)

CreateToggle(exploitTab, _S("100|183|216|197|209|205|210|197|132|175|201|201|212|201|214"), false, function(val)
    Config.StaminaKeeper = val
    if val or Config.WarmthKeeper then StartWarmthKeeper() else StopWarmthKeeper() end
end)

CreateSectionHeader(exploitTab, "🎭 MOVEMENT")

CreateToggle(exploitTab, _S("102|185|214|203|203|202|134|168|213|213|217|218"), false, function(val)
    Config.SpeedBoost = val
    ApplySpeedBoost()
end)

CreateSlider(exploitTab, _S("111|198|208|219|218|143|194|223|212|212|211"), 16, 200, 50, function(val)
    Config.WalkSpeed = val
    if Config.SpeedBoost then ApplySpeedBoost() end
end)

CreateToggle(exploitTab, _S("88|166|199|187|196|193|200"), false, function(val)
    Config.Noclip = val
    if val then StartNoclip() else StopNoclip() end
end)

CreateToggle(exploitTab, _S("73|143|181|194"), false, function(val)
    Config.FlyEnabled = val
    if val then StartFly() else StopFly() end
end)

CreateSlider(exploitTab, _S("102|172|210|223|134|185|214|203|203|202"), 10, 200, 60, function(val)
    Config.FlySpeed = val
end)

CreateToggle(exploitTab, _S("64|137|174|166|169|174|169|180|165|96|138|181|173|176"), false, function(val)
    Config.InfiniteJump = val
    if val then StartInfiniteJump() else StopInfiniteJump() end
end)

CreateToggle(exploitTab, _S("103|170|211|208|202|210|135|187|204|211|204|215|214|217|219|135|143|170|219|217|211|146|170|211|208|202|210|144"), false, function(val)
    Config.ClickTeleport = val
    if val then StartClickTeleport() else StopClickTeleport() end
end)

CreateSectionHeader(exploitTab, "📦 ITEM DUPE")

local dupeInput, dupeTextBox
dupeInput, dupeTextBox = CreateInput(exploitTab, _S("109|177|226|221|210|141|190|225|230"), "1", function(text)
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
    FireRemote(_S("78|187|183|188|179"))
    FireRemote(_S("66|166|171|169"))
    FireRemote(_S("101|205|198|215|219|202|216|217"))
    FireRemote(_S("104|203|215|212|212|205|203|220"))
    FireRemote(_S("125|223|239|226|222|232"))
    AddLog(_S("97|167|202|211|198|197|129|206|202|207|198|129|211|198|206|208|213|198|212"))
end)

CreateButton(exploitTab, "💰 Fire All Sell Remotes", Color3.fromRGB(40, 140, 40), function()
    FireRemote(_S("121|236|222|229|229"))
    FireRemote(_S("126|241|227|234|234|223|234|234"))
    FireRemote(_S("112|211|209|227|216"))
    FireRemote(_S("89|198|200|199|190|210"))
    FireRemote(_S("102|218|216|199|202|203"))
    AddLog(_S("124|194|229|238|225|224|156|239|225|232|232|156|238|225|233|235|240|225|239"))
end)

CreateButton(exploitTab, "⬆ Fire All Upgrade Remotes", Color3.fromRGB(40, 100, 160), function()
    FireRemote(_S("79|196|191|182|193|176|179|180"))
    FireRemote(_S("130|228|247|251"))
    FireRemote(_S("128|240|245|242|227|232|225|243|229"))
    FireRemote(_S("102|221|199|216|211|218|206"))
    FireRemote(_S("126|238|231|225|233|223|246|227"))
    FireRemote(_S("76|174|173|175|183|188|173|175|183"))
    AddLog(_S("118|188|223|232|219|218|150|235|230|221|232|215|218|219|150|232|219|227|229|234|219|233"))
end)

CreateButton(exploitTab, "🎲 Fire All Luck Remotes", Color3.fromRGB(140, 140, 40), function()
    FireRemote(_S("87|195|204|186|194"))
    FireRemote(_S("124|232|241|223|231|245"))
    FireRemote(_S("110|212|221|224|226|227|220|211"))
    FireRemote(_S("93|191|201|194|208|208|198|203|196"))
    AddLog(_S("99|169|204|213|200|199|131|207|216|198|206|131|213|200|208|210|215|200|214"))
end)

CreateButton(exploitTab, "💣 Fire ALL Remotes (Nuke)", Color3.fromRGB(200, 50, 50), function()
    for _, remote in ipairs(State.RemoteCache) do
        pcall(function()
            if remote.Type == _S("119|201|220|228|230|235|220|188|237|220|229|235") then
                remote.Instance:FireServer()
            elseif remote.Type == _S("126|208|227|235|237|242|227|196|243|236|225|242|231|237|236") then
                remote.Instance:InvokeServer()
            end
        end)
    end
    AddLog(_S("78|156|163|153|147|146|110|175|186|186|110") .. #State.RemoteCache .. _S("117|149|231|218|226|228|233|218|232|150"))
end)
end

local function BuildToolsTab()
local toolsTab = TabFrames[_S("118|202|229|229|226|233")]
ResetLayoutOrder()

CreateSectionHeader(toolsTab, "📡 REMOTE SPY")

CreateToggle(toolsTab, _S("101|183|202|210|212|217|202|133|184|213|222|133|141|177|212|204|133|171|206|215|202|184|202|215|219|202|215|142"), false, function(val)
    Config.RemoteSpy = val
    if val then StartRemoteSpy() else StopRemoteSpy() end
end)

layoutOrder = layoutOrder + 1
local spyListFrame = Instance.new(_S("95|178|194|209|206|203|203|200|205|198|165|209|192|204|196"))
RemoteSpyList = spyListFrame
RemoteSpyList.Name = _S("118|200|219|227|229|234|219|201|230|239|194|223|233|234")
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

local spyCorner = Instance.new(_S("116|201|189|183|227|230|226|217|230"))
spyCorner.CornerRadius = UDim.new(0, 6)
spyCorner.Parent = RemoteSpyList

local spyLayout = Instance.new(_S("96|181|169|172|201|211|212|172|193|217|207|213|212"))
spyLayout.SortOrder = Enum.SortOrder.LayoutOrder
spyLayout.Padding = UDim.new(0, 2)
spyLayout.Parent = RemoteSpyList

local spyPad = Instance.new(_S("115|200|188|195|212|215|215|220|225|218"))
spyPad.PaddingTop = UDim.new(0, 2)
spyPad.PaddingLeft = UDim.new(0, 2)
spyPad.PaddingRight = UDim.new(0, 2)
spyPad.Parent = RemoteSpyList

CreateButton(toolsTab, "🗑 Clear Spy Log", Color3.fromRGB(100, 50, 50), function()
    State.RemoteSpyLogs = {}
    if RemoteSpyList then ClearScrollList(RemoteSpyList) end
end)

CreateSectionHeader(toolsTab, "🎯 CUSTOM REMOTE")

CreateInput(toolsTab, _S("84|166|185|193|195|200|185|116|162|181|193|185"), "", function(text)
    Config.CustomRemoteName = text
end)

CreateInput(toolsTab, _S("63|128|177|166|178|95|103|162|174|172|172|160|95|178|164|175|160|177|160|179|164|163|104"), "", function(text)
    Config.CustomRemoteArgs = text
end)

CreateButton(toolsTab, "🚀 Fire Custom Remote", Color3.fromRGB(160, 80, 40), function()
    FireCustomRemote()
end)

CreateSectionHeader(toolsTab, "📍 WAYPOINTS")

CreateButton(toolsTab, "💾 Save: Shop", Color3.fromRGB(50, 100, 160), function()
    SaveWaypoint(_S("85|168|189|196|197"))
end)

CreateButton(toolsTab, "💾 Save: Farm Spot", Color3.fromRGB(50, 130, 80), function()
    SaveWaypoint(_S("101|171|198|215|210"))
end)

CreateButton(toolsTab, "💾 Save: Spawn", Color3.fromRGB(80, 80, 140), function()
    SaveWaypoint(_S("122|205|234|219|241|232"))
end)

CreateButton(toolsTab, "📍 TP → Shop", Color3.fromRGB(40, 90, 140), function()
    TeleportToWaypoint(_S("87|170|191|198|199"))
end)

CreateButton(toolsTab, "📍 TP → Farm Spot", Color3.fromRGB(40, 120, 70), function()
    TeleportToWaypoint(_S("112|182|209|226|221"))
end)

CreateButton(toolsTab, "📍 TP → Spawn", Color3.fromRGB(70, 70, 130), function()
    TeleportToWaypoint(_S("129|212|241|226|248|239"))
end)
end

local function BuildMiscTab()
local miscTab = TabFrames[_S("111|188|216|226|210")]
ResetLayoutOrder()

CreateSectionHeader(miscTab, "⚙ SETTINGS")

CreateToggle(miscTab, _S("91|156|201|207|196|136|156|161|166"), false, function(val)
    Config.AntiAFK = val
    if val then StartAntiAFK() else StopAntiAFK() end
end)

CreateToggle(miscTab, _S("114|179|231|230|225|146|196|215|229|226|211|233|224|146|157|146|196|215|211|226|226|222|235"), false, function(val)
    Config.AutoRespawn = val
end)

CreateToggle(miscTab, _S("107|177|187|190|139|173|218|218|222|223|208|221"), false, function(val)
    Config.FPSBooster = val
    if val then ApplyFPSBooster() end
end)

CreateSlider(miscTab, _S("116|199|217|230|234|217|230|148|188|227|228|148|156|225|221|226|160|148|164|177|227|218|218|157"), 0, 120, 0, function(val)
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
local keybindInfo = Instance.new(_S("92|176|193|212|208|168|189|190|193|200"))
keybindInfo.Size = UDim2.new(1, 0, 0, IsMobile and 56 or 70)
keybindInfo.BackgroundColor3 = Theme.Panel
keybindInfo.BackgroundTransparency = 0.1
keybindInfo.BorderSizePixel = 0
keybindInfo.Text = IsMobile and _S("109|193|206|221|141|212|223|210|210|219|141|186|141|207|226|225|225|220|219|141|170|141|193|220|212|212|217|210|141|180|194|182|141|233|141|194|224|210|141|225|220|212|212|217|210|224|141|214|219|141|225|206|207|224") or _S("111|193|216|214|215|227|194|215|216|213|227|143|172|143|195|222|214|214|219|212|143|182|196|184|143|235|143|181|143|172|143|181|219|232|143|235|143|182|143|172|143|176|228|227|222|143|181|208|225|220|143|235|143|183|143|172|143|194|220|208|225|227|143|187|222|222|223|143|235|143|191|143|172|143|191|208|221|216|210|143|235|143|178|227|225|219|154|178|219|216|210|218|143|172|143|178|219|216|210|218|143|195|191")
keybindInfo.TextColor3 = Theme.SubText
keybindInfo.Font = Enum.Font.Gotham
keybindInfo.TextSize = IsMobile and 9 or 10
keybindInfo.TextXAlignment = Enum.TextXAlignment.Left
keybindInfo.TextYAlignment = Enum.TextYAlignment.Top
keybindInfo.TextWrapped = true
keybindInfo.LayoutOrder = layoutOrder
keybindInfo.Parent = miscTab
local kbCorner = Instance.new(_S("101|186|174|168|212|215|211|202|215"))
kbCorner.CornerRadius = UDim.new(0, 6)
kbCorner.Parent = keybindInfo

CreateSectionHeader(miscTab, "📋 LOG")

local logListFrame = Instance.new(_S("91|174|190|205|202|199|199|196|201|194|161|205|188|200|192"))
LogList = logListFrame
LogList.Name = _S("88|164|199|191|164|193|203|204")
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

local logCorner = Instance.new(_S("123|208|196|190|234|237|233|224|237"))
logCorner.CornerRadius = UDim.new(0, 6)
logCorner.Parent = LogList

local logLayout = Instance.new(_S("126|211|199|202|231|241|242|202|223|247|237|243|242"))
logLayout.SortOrder = Enum.SortOrder.LayoutOrder
logLayout.Parent = LogList

local logPad = Instance.new(_S("104|189|177|184|201|204|204|209|214|207"))
logPad.PaddingTop = UDim.new(0, 3)
logPad.PaddingLeft = UDim.new(0, 3)
logPad.PaddingRight = UDim.new(0, 3)
logPad.Parent = LogList

CreateSectionHeader(miscTab, "🔗 DISCORD WEBHOOK")

CreateToggle(miscTab, _S("91|160|201|188|189|199|192|123|178|192|189|195|202|202|198"), false, function(val)
    Config.WebhookEnabled = val
end)

CreateInput(miscTab, _S("120|207|221|218|224|231|231|227|152|205|202|196"), "", function(text)
    Config.WebhookURL = text
end)

CreateToggle(miscTab, _S("89|159|186|203|198|121|165|200|192|204"), true, function(val)
    Config.WebhookFarm = val
end)

CreateToggle(miscTab, _S("85|168|186|193|193|117|161|196|188|200"), true, function(val)
    Config.WebhookSell = val
end)

CreateToggle(miscTab, _S("86|169|202|183|202|201|118|162|197|189|201"), true, function(val)
    Config.WebhookStats = val
end)

CreateButton(miscTab, "📨 Send Stats Now", Color3.fromRGB(50, 90, 160), function()
    SendStatsLog()
    AddLog(_S("65|148|166|175|181|97|180|181|162|181|180|97|181|176|97|184|166|163|169|176|176|172"))
end)

CreateButton(miscTab, "🧪 Test Webhook", Color3.fromRGB(90, 60, 140), function()
    SendWebhook({content = "**[Minea Mountain v7]** Webhook test successful! ✅"})
    AddLog(_S("116|200|217|231|232|217|216|148|235|217|214|220|227|227|223"))
end)

CreateSectionHeader(miscTab, "🔧 UTILITIES")

CreateButton(miscTab, "🏠 Teleport to Spawn", Color3.fromRGB(60, 90, 140), function()
    local spawns = Workspace:FindFirstChild(_S("92|175|204|189|211|202|168|203|191|189|208|197|203|202")) or Workspace:FindFirstChild(_S("117|200|229|214|236|227|232")) or Workspace:FindFirstChild(_S("98|174|209|196|196|219"))
    if spawns then
        if spawns:IsA(_S("81|147|178|196|182|161|178|195|197")) then
            TeleportTo(spawns.Position)
        else
            local spawn = spawns:FindFirstChildWhichIsA(_S("65|131|162|180|166|145|162|179|181"))
            if spawn then TeleportTo(spawn.Position) end
        end
    else
        AddLog(_S("130|208|241|162|245|242|227|249|240|162|232|241|247|240|230|163"))
    end
end)

CreateButton(miscTab, "🏔 Teleport to Mountain Top", Color3.fromRGB(100, 60, 140), function()
    if GetCharacter() then
        local highestY = HumanoidRootPart.Position.Y
        local highestPart = nil
        for _, part in ipairs(Workspace:GetDescendants()) do
            if part:IsA(_S("82|148|179|197|183|162|179|196|198")) and part.Position.Y > highestY then
                highestY = part.Position.Y
                highestPart = part
            end
        end
        if highestPart then
            TeleportTo(highestPart.Position + Vector3.new(0, 10, 0))
            AddLog(_S("87|171|188|195|188|199|198|201|203|188|187|119|203|198|119|191|192|190|191|188|202|203|119|199|198|192|197|203|145|119") .. math.floor(highestY))
        end
    end
end)

CreateButton(miscTab, "🔄 Rejoin Server", Color3.fromRGB(100, 100, 50), function()
    pcall(function()
        LocalPlayer:Kick(_S("107|189|208|213|218|212|217|212|217|210|153|153|153"))
        task.wait(1)
        game:GetService(_S("61|145|162|169|162|173|172|175|177|144|162|175|179|166|160|162")):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end)
end)

CreateSectionHeader(miscTab, "ℹ INFO")

layoutOrder = layoutOrder + 1
local infoLabel = Instance.new(_S("106|190|207|226|222|182|203|204|207|214"))
infoLabel.Size = UDim2.new(1, 0, 0, 50)
infoLabel.BackgroundColor3 = Theme.Panel
infoLabel.BackgroundTransparency = 0.1
infoLabel.Text = _S("90|167|195|200|191|187|122|162|207|188|122|208|145|122|214|122") .. Exec.Name .. "\nSmart Loop · Remote Spy · ESP+ · Waypoints"
infoLabel.TextColor3 = Theme.SubText
infoLabel.Font = Enum.Font.Gotham
infoLabel.TextSize = IsMobile and 9 or 10
infoLabel.TextWrapped = true
infoLabel.LayoutOrder = layoutOrder
infoLabel.Parent = miscTab

local infoCorner = Instance.new(_S("127|212|200|194|238|241|237|228|241"))
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

BuildGUIShell()
for tabName, btn in pairs(TabButtons or {}) do
    btn.MouseButton1Click:Connect(function()
        SwitchTab(tabName)
    end)
end
local guiOk, guiErr = xpcall(function()
    BuildFarmTab()
    BuildSellTab()
    BuildESPTab()
    BuildExploitTab()
    BuildToolsTab()
    BuildMiscTab()
    SetupGUIControls()
end, debug.traceback)
if not guiOk then
    warn(_S("102|193|179|207|212|203|199|134|174|219|200|195|134|173|187|175|134|203|216|216|213|216|160"), guiErr)
    pcall(function()
        StarterGui:SetCore(_S("90|173|191|200|190|168|201|206|195|192|195|189|187|206|195|201|200"), {
            Title = _S("107|184|212|217|208|204|139|179|224|205|139|178|192|180|139|176|221|221|218|221"),
            Text = tostring(guiErr):sub(1, 200),
            Duration = 12,
        })
    end)
end

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
                    local btn = Instance.new(_S("77|161|178|197|193|143|194|193|193|188|187"))
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Theme.Input
                    btn.BorderSizePixel = 0
                    btn.Text = shop.Name .. " [" .. math.floor(shop.Distance) .. "m]"
                    btn.TextColor3 = Theme.Text
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = 11
                    btn.LayoutOrder = i
                    btn.Parent = ShopList
                    local bCorner = Instance.new(_S("86|171|159|153|197|200|196|187|200"))
                    bCorner.CornerRadius = UDim.new(0, 5)
                    bCorner.Parent = btn
                    btn.MouseButton1Click:Connect(function()
                        TeleportTo(shop.Part.Position)
                        AddLog(_S("79|163|180|187|180|191|190|193|195|180|179|111|195|190|137|111") .. shop.Name)
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
                    local btn = Instance.new(_S("127|211|228|247|243|193|244|243|243|238|237"))
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Theme.Input
                    btn.BorderSizePixel = 0
                    btn.Text = rock.Name .. " [" .. math.floor(rock.Distance) .. "m]" .. (rock.Value > 0 and (" $" .. rock.Value) or "")
                    btn.TextColor3 = rock.Value > 0 and Theme.Accent or Theme.SubText
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = 11
                    btn.LayoutOrder = i
                    btn.Parent = RockList
                    local bCorner = Instance.new(_S("80|165|153|147|191|194|190|181|194"))
                    bCorner.CornerRadius = UDim.new(0, 5)
                    bCorner.Parent = btn
                    btn.MouseButton1Click:Connect(function()
                        TeleportTo(rock.Part.Position)
                        AddLog(_S("67|151|168|175|168|179|178|181|183|168|167|99|183|178|125|99") .. rock.Name)
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
        AddLog(_S("89|159|197|210|147|121") .. (Config.FlyEnabled and "ON" or _S("70|149|140|140")))
    elseif input.KeyCode == Enum.KeyCode.G then
        Config.AutoFarm = not Config.AutoFarm
        if Config.AutoFarm then StartAutoFarm() else StopAutoFarm() end
        AddLog(_S("106|171|223|222|217|138|176|203|220|215|164|138") .. (Config.AutoFarm and "ON" or _S("121|200|191|191")))
    elseif input.KeyCode == Enum.KeyCode.H then
        Config.SmartLoop = not Config.SmartLoop
        if Config.SmartLoop then StartSmartLoop() else StopSmartLoop() end
        AddLog(_S("98|181|207|195|212|214|130|174|209|209|210|156|130") .. (Config.SmartLoop and "ON" or _S("103|182|173|173")))
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
    HumanoidRootPart = char:WaitForChild(_S("102|174|219|211|199|212|213|207|202|184|213|213|218|182|199|216|218"))
    Humanoid = char:WaitForChild(_S("70|142|187|179|167|180|181|175|170"))
    AddLog(_S("110|177|214|207|224|207|209|226|211|224|142|224|211|225|222|207|229|220|211|210"))

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

local resizeCamera = Workspace.CurrentCamera
if resizeCamera then
    resizeCamera:GetPropertyChangedSignal(_S("101|187|206|202|220|213|212|215|217|184|206|223|202")):Connect(function()
        local newSize = resizeCamera.ViewportSize
        local isMob = UserInputService.TouchEnabled or newSize.X < 900
        GUIWidth = isMob and UDim2.new(1, -20, 1, -36) or UDim2.new(0, 700, 0, 440)
        if not State.IsMinimized then
            MainFrame.Size = GUIWidth
            MainFrame.AnchorPoint = isMob and Vector2.new(0.5, 0.5) or Vector2.new(0, 0)
            MainFrame.Position = isMob and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0.5, -350, 0.5, -220)
        end
        if TitleLabel then
            TitleLabel.TextSize = isMob and 14 or 17
        end
    end)
end

Exec.SetSimRadius()

pcall(function()
    AddLog(_S("78|155|183|188|179|175|110|150|195|176|110|196|133|110|186|189|175|178|179|178|110|189|188|110") .. Exec.Name)
    AddLog(_S("78|147|198|179|177|195|194|189|192|110|143|158|151|193|136|110|150|162|162|158|139") .. tostring(Exec.Request ~= nil) .. _S("85|117|157|196|196|192|146") .. tostring(Exec.HasHookMeta) .. _S("98|130|165|206|203|197|205|159") .. tostring(Exec.HasFireClick))
    AddLog(IsMobile and _S("85|169|182|197|117|188|199|186|186|195|117|162|117|183|202|201|201|196|195|117|201|196|117|201|196|188|188|193|186|117|156|170|158") or _S("115|197|220|218|219|231|198|219|220|217|231|147|176|147|186|200|188|147|239|147|182|212|214|219|216|147|229|216|224|226|231|216|230|147|217|220|229|230|231|148"))
    BypassPromptsIn(Workspace)
    StarterGui:SetCore(_S("124|207|225|234|224|202|235|240|229|226|229|223|221|240|229|235|234"), {
        Title = _S("118|195|223|228|219|215|150|190|235|216|150|236|173"),
        Text = IsMobile and _S("65|141|176|162|165|166|165|98|97|149|162|177|97|181|169|166|97|168|179|166|166|175|97|142|97|163|182|181|181|176|175|97|176|175|97|181|169|166|97|179|170|168|169|181|111") or _S("83|159|194|180|183|184|183|116|115|163|197|184|198|198|115|165|188|186|187|199|166|187|188|185|199|115|199|194|115|199|194|186|186|191|184|115|154|168|156|129"),
        Duration = 6,
    })
end)

task.delay(3, function()
    pcall(CacheRemotes)
end)
