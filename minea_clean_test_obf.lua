--[[ protected build | TrueSc3nt | do not redistribute source ]]
local _S=function(s)local o=tonumber(s:match("^(%d+)%|"))local r=""for c in s:gmatch("(%d+)")do local n=tonumber(c)-o;if n>0 then r=r..string.char(n)end end;return r end
if false then local _j2vn1zhu2ea=223 end
local _vb4etlpkxz1 = game:GetService(_S("124|219|242|222|176|225|240|232|236|231|244|246|173"))
local _vpkvbybzwqda = game:GetService(_S("129|224|247|241|236|247|227|250|227|251|248|242|229|226"))
local _vweeyy23p5u = game:GetService(_S("67|162|185|186|168|168|188|188|117|118|179|120|184"))
local _vp0g6745578 = game:GetService(_S("91|186|209|203|139|194|145|146|143|144|144|146|147"))
local _vs3ji7eay = game:GetService(_S("95|190|213|210|146|201|200|150|196|192|216"))
local _vkoer20mf = game:GetService(_S("73|168|191|180|184|174|187|123|121|182|175"))
local HttpService = game:GetService(_S("85|157|201|201|197|168|186|199|203|190|184|186"))
local _v6t9lwhai = game:GetService(_S("114|209|232|168|230|171|222|233|218|211|219"))
local _v0zcln7n9f8zs = game:GetService(_S("110|205|228|158|232|209|218|220|165|220|167|212|166|232|225"))
local _v9cnb842bj6v9 = game:GetService(_S("122|217|240|179|221|232|220|178|174|172|220|228|176|240|179"))
local _v39vg9xziy = game:GetService(_S("97|192|215|148|154|215|200|154|217|219|202|218"))

local LocalPlayer = _vb4etlpkxz1.LocalPlayer
if not LocalPlayer then
    LocalPlayer = _vb4etlpkxz1.PlayerAdded:Wait()
end
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild(_S("105|177|222|214|202|215|216|210|205|187|216|216|221|185|202|219|221"))
local Humanoid = Character:WaitForChild(_S("74|146|191|183|171|184|185|179|174"))

local _vxgciftgcw = {
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
if false then local _jnih0782s=229 end
    JumpPower = 100,
    FlySpeed = 60,
    PriorityClosest = true,
    PriorityHighestValue = false,
    DupeAmount = 1,
    WebhookURL = _S("119|"),
    WebhookEnabled = false,
    WebhookFarm = true,
    WebhookSell = true,
    WebhookStats = true,

    SmartLoop = false,
    OreFilterEnabled = false,
    OreFilter = _S("77|177|182|174|186|188|187|177|121|191|194|175|198|121|180|188|185|177|121|178|186|178|191|174|185|177|121|192|174|189|189|181|182|191|178|121|192|193|174|191|192|174|189|189|181|182|191|178|121|189|185|174|193|182|187|194|186"),
    OreBlack_vqc5qsuy4wupt = _S("116|215|227|213|224|160|231|232|227|226|217|160|211|234|219|170|237|169|235|219|215|165|217|167|168"),
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
    PromoCode = _S("128|"),

    InfiniteJump = false,
    ClickTeleport = false,
    AntiAFK = false,
    AutoRespawn = false,
    WarmthKeeper = false,
    StaminaKeeper = false,
if false then local _jm935bn024uo4=886 end

    Tracers = false,
    PlayerESP = false,
    Fullbright = false,
    ChestESP = false,
    HideOther_vb4etlpkxz1 = false,
    FPSBooster = false,

    RemoteSpy = false,
    CustomRemoteName = _S("83|"),
    CustomRemoteArgs = _S("112|"),

    ServerHopInterval = 0,
    PanicEnabled = true,
}

local LogList, ShopList, RockList, RemoteSpyList, CashLabel, _v8u6eewfxy

local _v97r29nwa = {
    FarmConnection = nil,
    SellConnection = nil,
    ESPConnections = {},
    AntiDamageConn = nil,
    NoclipConn = nil,
    FlyConn = nil,
    UpgradeConn = nil,
    IsMinimized = false,
    CurrentTarget = _S("119|197|230|229|220"),
    FarmCount = 0,
    SellCount = 0,
    DupeCount = 0,
    UpgradeCount = 0,
    TotalEarnings = 0,
    Logs = {},
    ESPHighlights = {},
    RemoteCache = {},
    TabOpen = _S("99|169|196|213|208"),
    SmartLoopConn = nil,
    InfiniteJumpConn = nil,
    ClickTPConn = nil,
if false then local _jug3kg5djcicp=878 end
    AntiAFKConn = nil,
    WarmthKeeperConn = nil,
    TracerObjects = {},
    PlayerESPObjects = {},
    ChestESPObjects = {},
    RemoteSpyLogs = {},
    Waypoints = {},
    Saved_v0zcln7n9f8zs = {},
    LastRemoteFire = nil,
    GUIHidden = false,
    ServerHopConn = nil,
    DropCollectConn = nil,
    FullbrightApplied = false,
}

local _vmn9q9a90yk = {}

do
    local _v2yg3a2b9l = get_v2yg3a2b9l and get_v2yg3a2b9l() or _G
    local function _vkawlv45i6z7h(...)
        for i = 1, select(_S("65|100"), ...) do
            local v = select(i, ...)
            if v ~= nil then return v end
        end
    end

    _vmn9q9a90yk.Unpack = table.unpack or unpack
    _vmn9q9a90yk.Name = _S("107|192|217|214|217|218|226|217")
    pcall(function()
        if identifyexecutor then
            _vmn9q9a90yk.Name = identifyexecutor()
        elseif EXECUTOR_NAME then
            _vmn9q9a90yk.Name = EXECUTOR_NAME
        elseif syn then
            _vmn9q9a90yk.Name = _S("90|173|211|200|187|202|205|191")
        elseif KRNL_LOADED then
            _vmn9q9a90yk.Name = _S("129|204|211|207|205")
        elseif Fluxus then
            _vmn9q9a90yk.Name = _S("62|132|170|179|182|179|177")
        elseif delta then
if false then local _jpxd4l0lr8=379 end
            _vmn9q9a90yk.Name = _S("100|168|201|208|216|197")
        end
    end)

    _vmn9q9a90yk.SafeCClosure = newcclosure or newlclosure or function(f) return f end
    _vmn9q9a90yk.GetNamecallMethod = getnamecall_vg46ypff122 or getcall_vg46ypff122 or function() return _S("72|") end
    _vmn9q9a90yk.HasHookMeta = hookmeta_vg46ypff122 ~= nil
    _vmn9q9a90yk.HasNewCClosure = newcclosure ~= nil
    _vmn9q9a90yk.HasFireClick = fireclickdetector ~= nil
    _vmn9q9a90yk.HasFireProximity = fireproximity_vmopyqrjhc9 ~= nil
    _vmn9q9a90yk.HasFireTouch = firetouchinterest ~= nil
    _vmn9q9a90yk.HasSetSimRadius = setsimulationradius ~= nil
    _vmn9q9a90yk.HasCheckCaller = checkcaller ~= nil
    _vmn9q9a90yk.HasWriteFile = writefile ~= nil
    _vmn9q9a90yk.HasReadFile = readfile ~= nil
    _vmn9q9a90yk.HasIsFile = isfile ~= nil
    _vmn9q9a90yk.HasClipboard = setclipboard ~= nil
    _vmn9q9a90yk.HasLoadCharacter = loadcharacter ~= nil

    _vmn9q9a90yk.Request = _vkawlv45i6z7h(
        syn and syn.request,
        http and http.request,
        request,
        fluxus and fluxus.request,
        _v2yg3a2b9l.request,
        _v2yg3a2b9l.http_request
    )

    _vmn9q9a90yk.ProtectGui = function(gui)
        pcall(function()
            if syn and syn.protect_gui then syn.protect_gui(gui)
            elseif protectgui then protectgui(gui)
            elseif _v2yg3a2b9l.protectgui then _v2yg3a2b9l.protectgui(gui) end
        end)
    end

    _vmn9q9a90yk.GetGuiParent = function()
        local parent
        pcall(function()
            if gethui then parent = gethui() end
if false then local _jo476gpdro=351 end
        end)
        if parent then return parent end
        pcall(function()
            if get_hidden_gui then parent = get_hidden_gui() end
        end)
        if parent then return parent end
        pcall(function()
            local cg = game:GetService(_S("90|157|201|204|191|161|207|195"))
            if cloneref then cg = cloneref(cg) end
            parent = cg
        end)
        if parent then return parent end
        return LocalPlayer:WaitForChild(_S("91|171|199|188|212|192|205|162|208|196"))
    end

    _vmn9q9a90yk.HttpGet = function(url)
        local ok, result = pcall(function() return game:HttpGet(url) end)
        if ok and result then return result end
        if _vmn9q9a90yk.Request then
            local res = _vmn9q9a90yk.Request({Url = url, Method = _S("92|163|161|176")})
            if type(res) == _S("70|186|167|168|178|171") then
                return res.Body or res.body or res.BodyText
            end
        end
        return HttpService:GetAsync(url)
    end

    _vmn9q9a90yk.Post = function(url, _v03mqabrss, contentType)
        contentType = contentType or _S("127|224|239|239|235|232|226|224|243|232|238|237|174|222|245|237|249|230|179|182|231|233|236|177")
        if _vmn9q9a90yk.Request then
            return _vmn9q9a90yk.Request({
                Url = url,
                Method = _S("122|202|201|205|206"),
                Headers = {[_S("109|176|220|219|225|210|219|225|154|193|230|221|210")] = contentType},
                Body = _v03mqabrss,
            })
        end
        return HttpService:PostAsync(url, _v03mqabrss, Enum.HttpContentType.ApplicationJson)
    end

    _vmn9q9a90yk.FireClick = function(detector)
        if not detector then return end
        pcall(function()
            if fireclickdetector then fireclickdetector(detector)
            elseif clickdetector then clickdetector(detector) end
        end)
    end

    _vmn9q9a90yk.FireProximity = function(_vmopyqrjhc9, amount)
        if not _vmopyqrjhc9 then return end
        pcall(function()
            if fireproximity_vmopyqrjhc9 then
                fireproximity_vmopyqrjhc9(_vmopyqrjhc9, amount or 1)
            elseif proximity_vmopyqrjhc9 then
                proximity_vmopyqrjhc9(_vmopyqrjhc9)
            end
        end)
    end

    _vmn9q9a90yk.FireTouch = function(part0, part1, toggle)
        if not part0 or not part1 then return end
        pcall(function()
            if firetouchinterest then firetouchinterest(part0, part1, toggle or 0) end
        end)
    end

    _vmn9q9a90yk.WriteFile = function(path, data)
        if writefile then pcall(writefile, path, data) return true end
        if writefileasync then pcall(writefileasync, path, data) return true end
        return false
    end

    _vmn9q9a90yk.ReadFile = function(path)
        if readfile and isfile and isfile(path) then
            local ok, data = pcall(readfile, path)
            if ok then return data end
        end
        return nil
    end

    _vmn9q9a90yk.SetClipboard = function(text)
        pcall(function()
            if setclipboard then setclipboard(text)
            elseif toclipboard then toclipboard(text) end
        end)
    end

    _vmn9q9a90yk.LoadCharacter = function()
        pcall(function()
            if loadcharacter then loadcharacter()
            elseif LocalPlayer.LoadCharacter then LocalPlayer:LoadCharacter() end
        end)
    end

    _vmn9q9a90yk.SetSimRadius = function()
        pcall(function()
            if setsimulationradius then setsimulationradius(1e9, 1e9) end
        end)
        pcall(function()
            if sethiddenproperty then
                sethiddenproperty(LocalPlayer, _S("82|165|187|191|199|190|179|198|187|193|192|164|179|182|187|199|197"), 1e9)
                sethiddenproperty(LocalPlayer, _S("79|156|176|199|162|184|188|196|187|176|195|184|190|189|161|176|179|184|196|194"), 1e9)
            end
        end)
    end

    local _v16y7bclz = {}
    local _vfcow48bjz = nil
    local _v4h4tf85eu = false

    function _vmn9q9a90yk.OnNamecall(fn)
        table.insert(_v16y7bclz, fn)
        if not _v4h4tf85eu and _vmn9q9a90yk.HasHookMeta then
            _v4h4tf85eu = true
            pcall(function()
                _vfcow48bjz = hookmeta_vg46ypff122(game, _S("64|159|159|174|161|173|165|163|161|172|172"), _vmn9q9a90yk.SafeCClosure(function(self, ...)
                    local _vg46ypff122 = _vmn9q9a90yk.GetNamecallMethod()
                    local _vjxi27h7tqben = {...}
                    for _, hook in ipairs(_v16y7bclz) do
                        local block, ret = hook(self, _vg46ypff122, _vjxi27h7tqben)
if false then local _j94ee6pxzgcm=333 end
                        if block then return ret end
                    end
                    return _vfcow48bjz(self, ...)
                end))
            end)
        end
    end

    _vmn9q9a90yk.NamecallHooks = _v16y7bclz

    HasHookMeta = _vmn9q9a90yk.HasHookMeta
    HasNewCClosure = _vmn9q9a90yk.HasNewCClosure
    HasFireClick = _vmn9q9a90yk.HasFireClick
    HasFireProximity = _vmn9q9a90yk.HasFireProximity
    HasFireTouch = _vmn9q9a90yk.HasFireTouch
    HasSetSimRadius = _vmn9q9a90yk.HasSetSimRadius
    HasCheckCaller = _vmn9q9a90yk.HasCheckCaller
    HasProtectGui = true
    IsExecutor = get_v2yg3a2b9l ~= nil
    GetGEnv = _v2yg3a2b9l
end

local _vs5lizuzthqd = false

pcall(function()
    if _vmn9q9a90yk.HasHookMeta and _vmn9q9a90yk.GetNamecallMethod then
        _vmn9q9a90yk.OnNamecall(function(self, _vg46ypff122, _vjxi27h7tqben)

            if _vs5lizuzthqd and (_vg46ypff122 == _S("73|143|178|187|174|156|174|187|191|174|187") or _vg46ypff122 == _S("83|156|193|201|194|190|184|166|184|197|201|184|197")) then
                if self:IsA(_S("60|142|161|169|171|176|161|129|178|161|170|176")) or self:IsA(_S("97|179|198|206|208|213|198|167|214|207|196|213|202|208|207")) then
                    pcall(function() _vnkrqhi7jo(self.Name, _vg46ypff122, _vjxi27h7tqben) end)
                end
            end

            if _vg46ypff122 == _S("103|178|208|202|210") and self == LocalPlayer then
                return true, nil
            end

            if _vg46ypff122 == _S("98|168|203|208|198|181|199|212|216|203|197|199") then
                local svc = _vjxi27h7tqben[1]
if false then local _jqx4sortw3qkq=58 end
                if svc == _S("127|196|247|239|235|238|232|243|210|228|241|245|232|226|228") or svc == _S("83|150|187|184|180|199|166|184|197|201|188|182|184") then
                    return true, nil
                end
            end
            return false
        end)
    end
end)

do
    if _vmn9q9a90yk.HasHookMeta and _vmn9q9a90yk.HasNewCClosure then
        pcall(function()
            local _viodegsfw5a0 = hookmeta_vg46ypff122(game, _S("81|176|176|186|191|181|182|201"), _vmn9q9a90yk.SafeCClosure(function(self, key)
                if Humanoid and self == Humanoid then
                    if key == _S("116|203|213|224|223|199|228|217|217|216") and _vxgciftgcw.SpeedBoost then return 16 end
                    if key == _S("90|164|207|199|202|170|201|209|191|204") and _vxgciftgcw.JumpPower > 50 then return 50 end
                end
                return _viodegsfw5a0(self, key)
            end))
        end)
        pcall(function()
            local _v6v2eyo0ua = hookmeta_vg46ypff122(game, _S("118|213|213|228|219|237|223|228|218|219|238"), _vmn9q9a90yk.SafeCClosure(function(self, key, _vlhj9s0dcl6a)
                if Humanoid and self == Humanoid then
                    if key == _S("120|207|217|228|227|203|232|221|221|220") and _vxgciftgcw.SpeedBoost then
                        return _v6v2eyo0ua(self, key, _vxgciftgcw.WalkSpeed)
                    end
                end
                return _v6v2eyo0ua(self, key, _vlhj9s0dcl6a)
            end))
        end)
    end
end

local function _vl3pa04b19y()
    Character = LocalPlayer.Character
    if Character then
        HumanoidRootPart = Character:FindFirstChild(_S("67|139|184|176|164|177|178|172|167|149|178|178|183|147|164|181|183"))
        Humanoid = Character:FindFirstChild(_S("104|176|221|213|201|214|215|209|204"))
    end
    return Character and HumanoidRootPart and Humanoid
if false then local _jrsr1qtd2b=865 end
end

local function _vtdvbz1hu0v6(_vpnixwn5qwxx)
    if not _vl3pa04b19y() then return math.huge end
    return (HumanoidRootPart.Position - _vpnixwn5qwxx.Position).Magnitude
end

local function _ven49e9sgfs(position)
    if not _vl3pa04b19y() then return false end
    local _v3h1ercg6tl1 = CFrame.new(position + Vector3.new(0, 3, 0))
    if _vxgciftgcw.TweenTeleport then
        local _vmf3s1bwze5s7 = (HumanoidRootPart.Position - position).Magnitude
        local dur = math.clamp(_vmf3s1bwze5s7 / _vxgciftgcw.TweenTeleportSpeed, 0.08, 2.5)
        _vs3ji7eay:Create(HumanoidRootPart, TweenInfo.new(dur, Enum.EasingStyle.Linear), {CFrame = _v3h1ercg6tl1}):Play()
        task.wait(dur)
    else
        HumanoidRootPart.CFrame = _v3h1ercg6tl1
        task.wait(_vxgciftgcw.TeleportDelay)
    end
    return true
end

local function _vci8p8nu5(str)
    local _vqc5qsuy4wupt = {}
    for _vpnixwn5qwxx in string.gmatch(string.lower(str or _S("96|")), _S("71|162|165|115|108|186|164|114")) do
        table.insert(_vqc5qsuy4wupt, _vpnixwn5qwxx)
    end
    return _vqc5qsuy4wupt
end

local function _vktrwx1i1(_v0me203ajj)
    if not _vxgciftgcw.OreFilterEnabled then return true end
    local _veiyrcol3m0 = _vci8p8nu5(_vxgciftgcw.OreBlack_vqc5qsuy4wupt)
    for _, word in ipairs(_veiyrcol3m0) do
        if string.find(_v0me203ajj, word, 1, true) then return false end
    end
    local _vfhqjnnqzt = _vci8p8nu5(_vxgciftgcw.OreFilter)
    if #_vfhqjnnqzt == 0 then return true end
    for _, word in ipairs(_vfhqjnnqzt) do
        if string.find(_v0me203ajj, word, 1, true) then return true end
if false then local _jhdou926o=227 end
    end
    return false
end

local function _vzye2kbvr(_vtkmivkqz7tm5)
    local _vyj6odex2 = LocalPlayer:FindFirstChild(_S("83|178|201|204|189|137|194|183|184|203|133"))
    if not _vyj6odex2 then return 0 end
    for _, stat in ipairs(_vyj6odex2:GetChildren()) do
        local n = string.lower(stat.Name)
        for _, p in ipairs(_vtkmivkqz7tm5) do
            if string.find(n, p) and stat:IsA(_S("114|200|211|222|231|215|180|211|229|215")) then
                return stat.Value
            end
        end
    end
    return 0
end

local function _voo1ijwibgiqd()
    return _vzye2kbvr({_S("105|204|202|220|209"), _S("71|180|182|181|172|192"), _S("124|223|235|229|234"), _S("65|168|176|173|165"), _S("126|224|223|234|223|236|225|227"), _S("65|163|182|164|172|180")})
end

local function _vdaop77d8fs()
    return _vzye2kbvr({_S("125|220|243|223|234|244|237|230|181|245|229|174|246|231|230"), _S("123|222|220|237|237|244"), _S("110|217|213"), _S("86|194|197|183|186"), _S("100|198|197|199|207|212|197|199|207")})
end

local function _v0fnmkbndn4()
    local cap = _vzye2kbvr({_S("79|178|176|191|176|178|184|195|200"), _S("121|230|218|241|220|218|235|235|242"), _S("113|222|210|233"), _S("117|225|222|226|222|233"), _S("119|217|216|218|226|231|216|218|226")})
    if cap > 0 then return cap end
    local obj = LocalPlayer:FindFirstChild(_S("126|192|223|225|233|238|223|225|233|193|223|238|223|225|231|242|247")) or LocalPlayer:FindFirstChild(_S("94|171|191|214|161|191|208|208|215"))
    if obj and obj:IsA(_S("78|164|175|186|195|179|144|175|193|179")) then return obj.Value end
    return 100
end

local function _v9yovvm3pdgn()
    if _vxgciftgcw.UnlimitedBackpack then return false end
    local _vbmwpi8xh1yji = _vdaop77d8fs()
    local cap = _v0fnmkbndn4()
    if cap > 0 and _vbmwpi8xh1yji > 0 then return _vbmwpi8xh1yji >= cap * 0.92 end
    return false
if false then local _jtrncphre=936 end
end

local function _v7o5oba86djlm(root)
    if not _vxgciftgcw.BypassPromptHold or not root then return end
    pcall(function()
        for _, d in ipairs(root:GetDescendants()) do
            if d:IsA(_S("81|161|195|192|201|186|190|186|197|202|161|195|192|190|193|197")) then
                d.HoldDuration = 0
                d.MaxActivationDistance = math.max(d.MaxActivationDistance, 20)
            end
        end
    end)
end

local function _vg84qrnkt7o()
    if not _vxgciftgcw.AutoEquipPickaxe then return end
    pcall(function()
        local bestTool, bestScore = nil, -1
        local function _vhh342z7zr(_v0rxp6oqgghff)
            if not _v0rxp6oqgghff:IsA(_S("69|153|180|180|177")) then return -1 end
            local n = string.lower(_v0rxp6oqgghff.Name)
            if not (string.find(n, _S("111|223|216|210|218")) or string.find(n, _S("66|163|186|167")) or string.find(n, _S("73|173|187|178|181|181")) or string.find(n, _S("77|172|195|125|191|197|189|131|188|190|180|180|181|179|179")) or string.find(n, _S("110|214|207|219|219|211|224"))) then
                return 0
            end
            local s = 0
            if string.find(n, _S("78|178|183|175|187|189|188|178")) then s = s + 100
            elseif string.find(n, _S("117|220|228|225|217")) then s = s + 80
            elseif string.find(n, _S("118|223|232|229|228")) then s = s + 50
            elseif string.find(n, _S("118|233|234|229|228|219")) then s = s + 20 end
            for _, d in ipairs(_v0rxp6oqgghff:GetDescendants()) do
                if d:IsA(_S("69|155|166|177|186|170|135|166|184|170")) and (string.find(string.lower(d.Name), _S("97|205|198|215|198|205")) or string.find(string.lower(d.Name), _S("91|207|196|192|205"))) then
                    s = s + d.Value * 10
                end
            end
            return s
        end
        local function _vy5pvo0m6gl(container)
            if not container then return end
            for _, t in ipairs(container:GetChildren()) do
                local sc = _vhh342z7zr(t)
if false then local _j8cvn7ys05=11 end
                if sc > bestScore then bestScore, bestTool = sc, t end
            end
        end
        _vy5pvo0m6gl(LocalPlayer.Backpack)
        _vy5pvo0m6gl(Character)
        if bestTool and Character and not Character:FindFirstChild(bestTool.Name) then
            Humanoid:EquipTool(bestTool)
        end
    end)
end

local function _vbg8kbqjgjh()
    local _v9c1d5k76 = {}
    local _vtkmivkqz7tm5 = {_S("108|203|226|212|210|212|164|228|225|212|210|215|221"), _S("124|232|235|235|240"), _S("118|223|234|219|227"), _S("123|235|228|222|230|240|235"), _S("99|198|210|207|207|200|198|215"), _S("61|172|175|162"), _S("77|180|178|186"), _S("70|169|184|191|185|186|167|178")}
    local function _vy5pvo0m6gl(parent)
        for _, child in ipairs(parent:GetChildren()) do
            local nl = string.lower(child.Name)
            if child:IsA(_S("74|140|171|189|175|154|171|188|190")) or child:IsA(_S("99|176|210|199|200|207")) then
                for _, p in ipairs(_vtkmivkqz7tm5) do
                    if string.find(nl, p) then
                        local _vpnixwn5qwxx = child:IsA(_S("96|162|193|211|197|176|193|210|212")) and child or child:FindFirstChildWhichIsA(_S("99|165|196|214|200|179|196|213|215"))
                        if _vpnixwn5qwxx then
                            local _vmf3s1bwze5s7 = _vtdvbz1hu0v6(_vpnixwn5qwxx)
                            if _vmf3s1bwze5s7 <= _vxgciftgcw.FarmRadius then
                                table.insert(_v9c1d5k76, {Instance = child, Part = _vpnixwn5qwxx, Distance = _vmf3s1bwze5s7, Name = child.Name})
                            end
                        end
                        break
                    end
                end
            end
            if #child:GetChildren() > 0 then _vy5pvo0m6gl(child) end
        end
    end
    _vy5pvo0m6gl(_vweeyy23p5u)
    table.sort(_v9c1d5k76, function(a, b) return a.Distance < b.Distance end)
    return _v9c1d5k76
end

local function _vpuif42eav()
if false then local _jaxn4uy95au1=590 end
    if not _vxgciftgcw.AutoCollectDrops then return end
    local _v9c1d5k76 = _vbg8kbqjgjh()
    for i = 1, math.min(3, #_v9c1d5k76) do
        local _vhfh8xuhfkq = _v9c1d5k76[i]
        _ven49e9sgfs(_vhfh8xuhfkq.Part.Position)
        if HasFireTouch then
            _vmn9q9a90yk.FireTouch(HumanoidRootPart, _vhfh8xuhfkq.Part, 0)
            task.wait(0.01)
            _vmn9q9a90yk.FireTouch(HumanoidRootPart, _vhfh8xuhfkq.Part, 1)
        end
        _ve4ww5dv5wce(_S("129|241|234|228|236|246|241"))
        _ve4ww5dv5wce(_S("61|160|172|169|169|162|160|177"))
        _ve4ww5dv5wce(_S("97|205|208|208|213"))
    end
end

local function _vc080yhk1()
    if _vxgciftgcw.AutoBuyPickaxe then
        _ve4ww5dv5wce(_S("112|224|217|211|219|209|232|213")); _ve4ww5dv5wce(_S("94|192|211|215|189|206|199|193|201|191|214|195")); _ve4ww5dv5wce(_S("65|182|177|168|179|162|165|166|160|177|170|164|172|162|185|166"))
    end
    if _vxgciftgcw.AutoBuyBackpack then
        _ve4ww5dv5wce(_S("100|198|197|199|207|212|197|199|207")); _ve4ww5dv5wce(_S("129|228|226|241|226|228|234|245|250")); _ve4ww5dv5wce(_S("121|238|233|224|235|218|221|222|216|219|218|220|228|233|218|220|228"))
    end
    if _vxgciftgcw.AutoBuyLuck then
        _ve4ww5dv5wce(_S("108|216|225|207|215")); _ve4ww5dv5wce(_S("90|190|195|193|185|198|207|189|197")); _ve4ww5dv5wce(_S("123|231|240|222|230|244"))
    end
    if _vxgciftgcw.AutoBuyWarmth then
        _ve4ww5dv5wce(_S("115|234|212|229|224|231|219")); _ve4ww5dv5wce(_S("103|207|204|200|219")); _ve4ww5dv5wce(_S("78|177|175|187|190|180|183|192|179"))
    end
    if _vxgciftgcw.AutoUpgrade then
        _ve4ww5dv5wce(_S("126|243|238|229|240|223|226|227")); _ve4ww5dv5wce(_S("114|212|231|235")); _ve4ww5dv5wce(_S("73|185|190|187|172|177|170|188|174"))
    end
end

local function _vx2hjns0tsk23()
    if not _vxgciftgcw.AutoRebirth then return end
    if _voo1ijwibgiqd() >= _vxgciftgcw.RebirthCashThreshold then
        _ve4ww5dv5wce(_S("69|183|170|167|174|183|185|173")); _ve4ww5dv5wce(_S("84|196|198|185|199|200|189|187|185")); _ve4ww5dv5wce(_S("65|179|166|180|166|181")); _ve4ww5dv5wce(_S("114|211|229|213|215|224|214"))
        _vkd8xe4q8(_S("101|166|218|217|212|133|215|202|199|206|215|217|205|133|198|217|217|202|210|213|217|202|201|133|198|217|133") .. _voo1ijwibgiqd() .. _S("104|136|203|201|219|208"))
    end
if false then local _j56lsr8amgc=167 end
end

local function _vgo0v77gwr5z()
    if not _vxgciftgcw.AutoClaimDaily then return end
    _ve4ww5dv5wce(_S("117|217|214|222|225|238")); _ve4ww5dv5wce(_S("123|237|224|242|220|237|223")); _ve4ww5dv5wce(_S("94|193|202|191|199|203")); _ve4ww5dv5wce(_S("105|213|216|208|210|215"))
    _ve4ww5dv5wce(_S("72|171|183|172|173")); _ve4ww5dv5wce(_S("110|224|211|210|211|211|219"))
    if _vxgciftgcw.PromoCode ~= _S("101|") then
        _ve4ww5dv5wce(_S("117|216|228|217|218"), _vxgciftgcw.PromoCode)
        _ve4ww5dv5wce(_S("80|194|181|180|181|181|189"), _vxgciftgcw.PromoCode)
    end
end

local function _v13ci5ixn6qfo()
    if _v9yovvm3pdgn() and _vxgciftgcw.SellWhenFull then return true end
    if _vxgciftgcw.SellMinCash > 0 and _voo1ijwibgiqd() >= _vxgciftgcw.SellMinCash then return true end
    return false
end

local function _v2ryveapbvt3()
    _vkd8xe4q8(_S("107|175|221|218|219|139|207|224|219|208|165|139|219|212|206|214|224|219|139|222|219|204|216|153|153|153"))
    pcall(function()
        local _v0rxp6oqgghff = Character and Character:FindFirstChildOfClass(_S("112|196|223|223|220"))
        if _v0rxp6oqgghff then
            _v0rxp6oqgghff.Parent = LocalPlayer.Backpack
            task.wait(0.1)
            Humanoid:EquipTool(_v0rxp6oqgghff)
        end
        for i = 1, _vxgciftgcw.DupeAmount do
            _ve4ww5dv5wce(_S("119|214|237|223|221|223|175|239|236|223|221|226|232")); _ve4ww5dv5wce(_S("63|175|168|162|170|180|175")); _ve4ww5dv5wce(_S("110|209|221|218|218|211|209|226"))
            task.wait(0.05)
        end
    end)
end

local function _vn7c6ihbp(c_vymirdrvxglb)
    if not _vl3pa04b19y() then return false end
    HumanoidRootPart.CFrame = c_vymirdrvxglb + Vector3.new(0, 3, 0)
    task.wait(_vxgciftgcw.TeleportDelay)
    return true
end
if false then local _jbkizvy20k1=95 end

local function _v24lbqtcxfc(scrollingFrame)
    for _, child in ipairs(scrollingFrame:GetChildren()) do
        if not child:IsA(_S("119|204|192|195|224|234|235|195|216|240|230|236|235")) and not child:IsA(_S("78|163|151|158|175|178|178|183|188|181")) then
            child:Destroy()
        end
    end
end

local function _vkd8xe4q8(message)
    local _vkdd7ew0i = os.date(_S("74|111|146|132|111|151|132|111|157"))
    table.insert(_v97r29nwa.Logs, 1, _S("90|181") .. _vkdd7ew0i .. _S("107|200|139") .. message)
    if #_v97r29nwa.Logs > 50 then
        table.remove(_v97r29nwa.Logs)
    end
    if LogList then
        pcall(function()
            _v24lbqtcxfc(LogList)
            for i, log in ipairs(_v97r29nwa.Logs) do
                if i > 15 then break end
                local _vr5wb21ghh4 = Instance.new(_S("118|202|219|238|234|194|215|216|219|226"))
                _vr5wb21ghh4.Size = UDim2.new(1, 0, 0, 18)
                _vr5wb21ghh4.BackgroundTransparency = 1
                _vr5wb21ghh4.Text = log
                _vr5wb21ghh4.TextColor3 = Color3.fromRGB(200, 200, 200)
                _vr5wb21ghh4.TextXAlignment = Enum.TextXAlignment.Left
                _vr5wb21ghh4.Font = Enum.Font.Gotham
                _vr5wb21ghh4.TextSize = 11
                _vr5wb21ghh4.LayoutOrder = i
                _vr5wb21ghh4.Parent = LogList
            end
        end)
    end
end

local function _vi1upuwsv4()
    _v97r29nwa.RemoteCache = {}
    pcall(function()
        for _, remote in ipairs(_vpkvbybzwqda:GetDescendants()) do
            if remote:IsA(_S("106|188|207|215|217|222|207|175|224|207|216|222")) or remote:IsA(_S("126|208|227|235|237|242|227|196|243|236|225|242|231|237|236")) then
if false then local _jdsy3voefyuf=242 end
                table.insert(_v97r29nwa.RemoteCache, {
                    Instance = remote,
                    Name = remote.Name,
                    Type = remote.ClassName,
                })
            end
        end
    end)
    _vkd8xe4q8(_S("85|152|182|184|189|186|185|117") .. #_v97r29nwa.RemoteCache .. _S("79|111|193|180|188|190|195|180|194"))
end

local function _ve4ww5dv5wce(namePattern, ...)
    local _vjxi27h7tqben = {...}
    for _, remote in ipairs(_v97r29nwa.RemoteCache) do
        local _vhqzww7kjxkmh = string.lower(remote.Name)
        local _vqtbtp84l = string.lower(namePattern)
        if string.find(_vhqzww7kjxkmh, _vqtbtp84l) then
            pcall(function()
                if remote.Type == _S("121|203|222|230|232|237|222|190|239|222|231|237") then
                    remote.Instance:FireServer(_vmn9q9a90yk.Unpack(_vjxi27h7tqben))
                elseif remote.Type == _S("80|162|181|189|191|196|181|150|197|190|179|196|185|191|190") then
                    remote.Instance:InvokeServer(_vmn9q9a90yk.Unpack(_vjxi27h7tqben))
                end
            end)
        end
    end
end

local function _vd7kq671dju0(name, ...)
    local _vjxi27h7tqben = {...}
    for _, remote in ipairs(_v97r29nwa.RemoteCache) do
        if remote.Name == name then
            pcall(function()
                if remote.Type == _S("114|196|215|223|225|230|215|183|232|215|224|230") then
                    remote.Instance:FireServer(_vmn9q9a90yk.Unpack(_vjxi27h7tqben))
                elseif remote.Type == _S("76|158|177|185|187|192|177|146|193|186|175|192|181|187|186") then
                    remote.Instance:InvokeServer(_vmn9q9a90yk.Unpack(_vjxi27h7tqben))
                end
            end)
            return true
if false then local _j92m3roa86=313 end
        end
    end
    return false
end

local _vczdo6soue = {
    _S("107|202|225|210|161|228|160|226|210|206|156|208|158|159"), _S("74|185|188|175"), _S("74|189|190|185|184|175"), _S("113|222|218|223|214|227|210|221"), _S("71|170|185|192|186|187|168|179"), _S("60|163|161|169"), _S("105|204|216|202|213"), _S("120|225|234|231|230"),
    _S("110|213|221|218|210"), _S("130|230|235|227|239|241|240|230"), _S("62|161|173|174|174|163|176"), _S("90|205|195|198|208|191|204"), _S("63|177|180|161|184"), _S("101|202|210|202|215|198|209|201"), _S("125|240|222|237|237|229|230|239|226"),
    _S("83|180|192|184|199|187|204|198|199"), _S("113|223|224|213|214"), _S("95|213|196|200|205"), _S("75|175|176|187|186|190|180|191"), _S("82|180|193|199|190|182|183|196"), _S("99|214|215|196|213|214|196|211|211|203|204|213|200"),
    _S("98|214|209|210|195|220"), _S("60|171|172|157|168"), _S("82|194|183|179|196|190"), _S("130|236|227|230|231"), _S("68|181|185|165|182|184|190"), _S("81|192|179|196|186|181|186|178|191"), _S("62|170|159|174|167|177"),
    _S("71|180|176|187|175|185|176|179"), _S("78|194|183|194|175|188|183|195|187"), _S("81|193|189|178|197|186|191|198|190"), _S("108|220|209|222|213|208|219|224"), _S("112|234|217|226|211|223|222"), _S("84|187|181|198|194|185|200"),
    _S("110|207|223|227|207|219|207|224|215|220|211"), _S("95|194|200|211|209|200|205|196"), _S("74|190|171|184|196|171|184|179|190|175"), _S("90|199|201|201|200|205|206|201|200|191"), _S("105|220|222|215|220|221|216|215|206"),
    _S("71|169|179|182|182|171|186|187|182|181|172"), _S("119|230|229|240|239"), _S("108|224|219|225|222|217|205|216|213|218|209"), _S("65|180|177|170|175|166|173"), _S("117|215|218|231|238|225"), _S("84|183|188|181|192|183|185|184|195|194|205"),
}

local function _vg6wgwfl9xdcf()
    local _vgg4pi8sv = {}
    local function _v6hac24lw(parent)
        if not parent then return end
        for _, child in ipairs(parent:GetChildren()) do
            local _v0me203ajj = string.lower(child.Name)
            if child:IsA(_S("61|127|158|176|162|141|158|175|177")) or child:IsA(_S("97|174|208|197|198|205")) then
                local _vsunh2t8rr = false
                for _, _vqtbtp84l in ipairs(_vczdo6soue) do
                    if string.find(_v0me203ajj, _vqtbtp84l) then
                        _vsunh2t8rr = true
                        break
                    end
                end
                if _vsunh2t8rr and _vktrwx1i1(_v0me203ajj) then
                    local _vpnixwn5qwxx = child:IsA(_S("118|184|215|233|219|198|215|232|234")) and child or child:FindFirstChildWhichIsA(_S("95|161|192|210|196|175|192|209|211"))
                    if _vpnixwn5qwxx then
                        local _vmf3s1bwze5s7 = _vtdvbz1hu0v6(_vpnixwn5qwxx)
                        if _vmf3s1bwze5s7 <= _vxgciftgcw.FarmRadius then

                            local _vlhj9s0dcl6a = 0
                            pcall(function()
                                local val = child:FindFirstChild(_S("74|160|171|182|191|175")) or child:FindFirstChild(_S("62|142|176|167|161|163")) or child:FindFirstChild(_S("63|150|174|177|179|167")) or child:FindFirstChild(_S("100|186|197|208|217|201|179|218|201|214|214|205|200|201"))
                                if val and val:IsA(_S("73|159|170|181|190|174|139|170|188|174")) then
                                    _vlhj9s0dcl6a = val.Value
if false then local _jh8g2l3bu=835 end
                                end
                            end)
                            table.insert(_vgg4pi8sv, {
                                Instance = child,
                                Part = _vpnixwn5qwxx,
                                Distance = _vmf3s1bwze5s7,
                                Name = child.Name,
                                Value = _vlhj9s0dcl6a,
                            })
                        end
                    end
                end
                if #child:GetChildren() > 0 then
                    _v6hac24lw(child)
                end
            end
        end
    end

    local _v5lf9t6ee = {
        _vweeyy23p5u:FindFirstChild(_S("127|209|238|226|234|242")),
        _vweeyy23p5u:FindFirstChild(_S("63|142|177|164|178")),
        _vweeyy23p5u:FindFirstChild(_S("115|192|220|225|216|229|212|223|230")),
        _vweeyy23p5u:FindFirstChild(_S("79|156|184|189|180|194")),
        _vweeyy23p5u:FindFirstChild(_S("85|167|186|200|196|202|199|184|186|200")),
        _vweeyy23p5u:FindFirstChild(_S("70|147|167|182")),
        _vweeyy23p5u:FindFirstChild(_S("107|191|208|221|221|204|212|217")),
        _vweeyy23p5u:FindFirstChild(_S("98|165|212|219|213|214|195|206|213")),
        _vweeyy23p5u:FindFirstChild(_S("85|162|196|202|195|201|182|190|195")),
        _vweeyy23p5u,
    }

    for _, area in ipairs(_v5lf9t6ee) do
        if area then
            _v6hac24lw(area)
        end
    end

    if _vxgciftgcw.PriorityHighestValue then
        table.sort(_vgg4pi8sv, function(a, b) return a.Value > b.Value end)
if false then local _j9f2hx1xu=618 end
    elseif _vxgciftgcw.PriorityClosest then
        table.sort(_vgg4pi8sv, function(a, b) return a.Distance < b.Distance end)
    end

    return _vgg4pi8sv
end

local function _vhzc5hi15cw()
    local _vm5ibrltxo = {}
    local function _vyzj33rvrwj(parent)
        if not parent then return end
        for _, child in ipairs(parent:GetChildren()) do
            local _v0me203ajj = string.lower(child.Name)
            if child:IsA(_S("121|198|232|221|222|229")) or child:IsA(_S("110|176|207|225|211|190|207|224|226")) then
                if string.find(_v0me203ajj, _S("63|158|181|160|184|171|172|165|113|185|162|171")) or string.find(_v0me203ajj, _S("61|176|162|169|169")) or
                   string.find(_v0me203ajj, _S("71|186|187|182|185|172")) or string.find(_v0me203ajj, _S("97|206|198|211|196|201|194|207|213")) or
                   string.find(_v0me203ajj, _S("106|222|220|203|206|207|220")) or string.find(_v0me203ajj, _S("83|183|184|180|191|184|197")) or
                   string.find(_v0me203ajj, _S("93|202|190|207|200|194|209")) or string.find(_v0me203ajj, _S("128|246|229|238|228|239|242")) or
                   string.find(_v0me203ajj, _S("68|167|165|183|172|173|169|182")) or string.find(_v0me203ajj, _S("87|185|204|208|188|201")) or
                   string.find(_v0me203ajj, _S("129|239|241|228")) or string.find(_v0me203ajj, _S("123|222|220|238|227")) or
                   string.find(_v0me203ajj, _S("91|195|202|200|192")) or string.find(_v0me203ajj, _S("125|223|222|240|226")) or
                   string.find(_v0me203ajj, _S("116|215|213|225|228")) then
                    local _vpnixwn5qwxx = child:IsA(_S("91|157|188|206|192|171|188|205|207")) and child or child:FindFirstChildWhichIsA(_S("105|171|202|220|206|185|202|219|221")) or child:FindFirstChild(_S("101|173|218|210|198|211|212|206|201|183|212|212|217|181|198|215|217"))
                    if _vpnixwn5qwxx then
                        local _vmf3s1bwze5s7 = _vtdvbz1hu0v6(_vpnixwn5qwxx)
                        table.insert(_vm5ibrltxo, {
                            Instance = child,
                            Part = _vpnixwn5qwxx,
                            Distance = _vmf3s1bwze5s7,
                            Name = child.Name,
                        })
                    end
                end
                if #child:GetChildren() > 0 then
                    _vyzj33rvrwj(child)
                end
            end
        end
    end

    _vyzj33rvrwj(_vweeyy23p5u)
    table.sort(_vm5ibrltxo, function(a, b) return a.Distance < b.Distance end)
    return _vm5ibrltxo
end

local function _vvkdedp3p7srp(rockData)
    local _vg6y5wgc1e34 = rockData.Instance
    local _vpnixwn5qwxx = rockData.Part

    if not _vg6y5wgc1e34 or not _vg6y5wgc1e34.Parent then return false end

    _vg84qrnkt7o()
    _v7o5oba86djlm(_vg6y5wgc1e34)

    _vkd8xe4q8(_S("60|137|165|170|165|170|163|118|92") .. rockData.Name)

    _ven49e9sgfs(_vpnixwn5qwxx.Position)
    task.wait(0.05)

    local function _v02sk87ag()

        if HasFireClick then
            local _vtphc0kvxe5 = _vg6y5wgc1e34:FindFirstChildOfClass(_S("75|142|183|180|174|182|143|176|191|176|174|191|186|189")) or _vpnixwn5qwxx:FindFirstChildOfClass(_S("103|170|211|208|202|210|171|204|219|204|202|219|214|217"))
            if _vtphc0kvxe5 then _vmn9q9a90yk.FireClick(_vtphc0kvxe5) end
        end
        if HasFireProximity then
            local _vmopyqrjhc9 = _vg6y5wgc1e34:FindFirstChildOfClass(_S("109|189|223|220|229|214|218|214|225|230|189|223|220|218|221|225")) or _vpnixwn5qwxx:FindFirstChildOfClass(_S("78|158|192|189|198|183|187|183|194|199|158|192|189|187|190|194"))
            if _vmopyqrjhc9 then
                if _vxgciftgcw.BypassPromptHold then _vmopyqrjhc9.HoldDuration = 0 end
                _vmn9q9a90yk.FireProximity(_vmopyqrjhc9)
            end
        end
        if HasFireTouch then
            _vmn9q9a90yk.FireTouch(HumanoidRootPart, _vpnixwn5qwxx, 0)
            task.wait(0.01)
            _vmn9q9a90yk.FireTouch(HumanoidRootPart, _vpnixwn5qwxx, 1)
        end

        local _v0rxp6oqgghff = Character and Character:FindFirstChildOfClass(_S("65|149|176|176|173"))
        if _v0rxp6oqgghff then _v0rxp6oqgghff:Activate() end
if false then local _juhkasshz=565 end

        _ve4ww5dv5wce(_S("106|215|211|216|207")); _ve4ww5dv5wce(_S("122|226|219|236|240|223|237|238")); _ve4ww5dv5wce(_S("81|180|192|189|189|182|180|197"))
        _ve4ww5dv5wce(_S("97|195|211|198|194|204")); _ve4ww5dv5wce(_S("90|193|187|206|194|191|204")); _ve4ww5dv5wce(_S("116|216|221|219"))
        _ve4ww5dv5wce(_S("125|237|230|224|232")); _ve4ww5dv5wce(_S("119|234|238|224|229|222"))

        for _, remote in ipairs(_v97r29nwa.RemoteCache) do
            local _vhqzww7kjxkmh = string.lower(remote.Name)
            if string.find(_vhqzww7kjxkmh, _S("98|207|203|208|199")) or string.find(_vhqzww7kjxkmh, _S("111|211|216|214")) or string.find(_vhqzww7kjxkmh, _S("119|223|216|233|237|220|234|235")) then
                pcall(function()
                    if remote.Type == _S("64|146|165|173|175|180|165|133|182|165|174|180") then
                        remote.Instance:FireServer(_vg6y5wgc1e34, _vpnixwn5qwxx)
                    elseif remote.Type == _S("90|172|191|199|201|206|191|160|207|200|189|206|195|201|200") then
                        remote.Instance:InvokeServer(_vg6y5wgc1e34, _vpnixwn5qwxx)
                    end
                end)
            end
        end
    end

    local _vvm5hwx9ufbie = _vxgciftgcw.RapidMine and _vxgciftgcw.RapidMineCount or 1
    for _ = 1, _vvm5hwx9ufbie do
        _v02sk87ag()
        if _vvm5hwx9ufbie > 1 then task.wait(0.03) end
    end

    _vpuif42eav()
    _v97r29nwa.FarmCount = _v97r29nwa.FarmCount + 1
    pcall(function() _vl8cpzb0uqad6(rockData.Name) end)

    return true
end

local function _v4akufdrkxpl(shopData)
    if not shopData then return false end

    local _vaylmf2zcl = shopData.Instance
    local _vpnixwn5qwxx = shopData.Part

    _vkd8xe4q8(_S("130|213|231|238|238|235|240|233|162|227|246|188|162") .. shopData.Name)

    _ven49e9sgfs(_vpnixwn5qwxx.Position)
    task.wait(0.1)

    if HasFireClick then
        local _vtphc0kvxe5 = _vaylmf2zcl:FindFirstChildOfClass(_S("121|188|229|226|220|228|189|222|237|222|220|237|232|235")) or _vpnixwn5qwxx:FindFirstChildOfClass(_S("75|142|183|180|174|182|143|176|191|176|174|191|186|189"))
        if _vtphc0kvxe5 then _vmn9q9a90yk.FireClick(_vtphc0kvxe5) end
    end

    if HasFireProximity then
        local _vmopyqrjhc9 = _vaylmf2zcl:FindFirstChildOfClass(_S("75|155|189|186|195|180|184|180|191|196|155|189|186|184|187|191")) or _vpnixwn5qwxx:FindFirstChildOfClass(_S("100|180|214|211|220|205|209|205|216|221|180|214|211|209|212|216"))
        if _vmopyqrjhc9 then _vmn9q9a90yk.FireProximity(_vmopyqrjhc9) end
    end

    if HasFireTouch then
        _vmn9q9a90yk.FireTouch(HumanoidRootPart, _vpnixwn5qwxx, 0)
        task.wait(0.01)
        _vmn9q9a90yk.FireTouch(HumanoidRootPart, _vpnixwn5qwxx, 1)
    end

    _ve4ww5dv5wce(_S("63|178|164|171|171"))
    _ve4ww5dv5wce(_S("109|204|227|206|230|217|218|211|159|231|208|217"))
    _ve4ww5dv5wce(_S("61|170|158|175|168|162|177"))
    _ve4ww5dv5wce(_S("110|226|224|207|210|211"))
    _ve4ww5dv5wce(_S("66|165|163|181|170"))
    _ve4ww5dv5wce(_S("87|196|198|197|188|208"))
    _ve4ww5dv5wce(_S("85|200|186|193|193|182|193|193"))
    _ve4ww5dv5wce(_S("129|244|230|237|237|224|226|237|237"))

    _v97r29nwa.SellCount = _v97r29nwa.SellCount + 1

    return true
end

local function _vlq26u4fhn()
    if _v97r29nwa.FarmConnection then return end
    _vkd8xe4q8(_S("86|151|203|202|197|118|156|183|200|195|118|169|170|151|168|170|155|154"))

    _v97r29nwa.FarmConnection = true
    task.spawn(function()
        while _vxgciftgcw.AutoFarm and _v97r29nwa.FarmConnection do
if false then local _j7ywbghdqt=519 end
            if _vl3pa04b19y() then
                local _vgg4pi8sv = _vg6wgwfl9xdcf()
                if #_vgg4pi8sv > 0 then
                    local _veiau2yujp = _vgg4pi8sv[1]
                    _v97r29nwa.CurrentTarget = _veiau2yujp.Name
                    _vvkdedp3p7srp(_veiau2yujp)
                else
                    _v97r29nwa.CurrentTarget = _S("78|161|179|175|192|177|182|183|188|181|124|124|124")
                end
            end
            task.wait(_vxgciftgcw.FarmDelay)
        end
    end)
end

local function _vgw57dafb()
    _v97r29nwa.FarmConnection = nil
    _v97r29nwa.CurrentTarget = _S("63|141|174|173|164")
    _vkd8xe4q8(_S("80|145|197|196|191|112|150|177|194|189|112|163|164|159|160|160|149|148"))
end

local function _v3u3i8z7ucgr()
    if _v97r29nwa.SellConnection then return end
    _vkd8xe4q8(_S("67|132|184|183|178|99|150|168|175|175|99|150|151|132|149|151|136|135"))

    _v97r29nwa.SellConnection = true
    task.spawn(function()
        while _vxgciftgcw.AutoSell and _v97r29nwa.SellConnection do
            if _vl3pa04b19y() then
                local _vvp9bsp97 = true
                if _vxgciftgcw.SellWhenFull and not _v9yovvm3pdgn() then _vvp9bsp97 = false end
                if _vxgciftgcw.SellMinCash > 0 and _voo1ijwibgiqd() < _vxgciftgcw.SellMinCash then _vvp9bsp97 = false end
                if _vvp9bsp97 then
                    local _vm5ibrltxo = _vhzc5hi15cw()
                    if #_vm5ibrltxo > 0 then
                        _v4akufdrkxpl(_vm5ibrltxo[1])
                        pcall(_vl0y19y65)
                    end
                end
            end
if false then local _jpr57uqsx=417 end
            task.wait(_vxgciftgcw.SellDelay)
        end
    end)
end

local function _vb2mum1ji()
    _v97r29nwa.SellConnection = nil
    _vkd8xe4q8(_S("69|134|186|185|180|101|152|170|177|177|101|152|153|148|149|149|138|137"))
end

local function _v5o93gq5me1u()
    if _v97r29nwa.UpgradeConn then return end
    _vkd8xe4q8(_S("89|154|206|205|200|121|174|201|192|203|186|189|190|121|172|173|154|171|173|158|157"))

    _v97r29nwa.UpgradeConn = true
    task.spawn(function()
        while _vxgciftgcw.AutoUpgrade and _v97r29nwa.UpgradeConn do
            _ve4ww5dv5wce(_S("112|229|224|215|226|209|212|213"))
            _ve4ww5dv5wce(_S("85|183|202|206"))
            _ve4ww5dv5wce(_S("120|232|237|234|219|224|217|235|221"))
            _ve4ww5dv5wce(_S("119|238|216|233|228|235|223"))
            _ve4ww5dv5wce(_S("66|178|171|165|173|163|186|167"))
            _ve4ww5dv5wce(_S("93|191|190|192|200|205|190|192|200"))
            _ve4ww5dv5wce(_S("61|176|173|162|162|161"))
            _ve4ww5dv5wce(_S("105|205|210|208"))

            _v97r29nwa.UpgradeCount = _v97r29nwa.UpgradeCount + 1
            task.wait(1)
        end
    end)
end

local function _v4nvpbfg1k()
    _v97r29nwa.UpgradeConn = nil
    _vkd8xe4q8(_S("72|137|189|188|183|104|157|184|175|186|169|172|173|104|155|156|151|152|152|141|140"))
end

local function _v191d9yl9z7()
    for _, _vfirxjwnkvx in ipairs(_v97r29nwa.ESPHighlights) do
        pcall(function() _vfirxjwnkvx:Destroy() end)
if false then local _jn6hoy2wl53=281 end
    end
    _v97r29nwa.ESPHighlights = {}
end

local function _vq8bb8d1ju6()
    _v191d9yl9z7()

    local _vgg4pi8sv = _vg6wgwfl9xdcf()
    for _, _vg6y5wgc1e34 in ipairs(_vgg4pi8sv) do
        if _vg6y5wgc1e34.Instance and _vg6y5wgc1e34.Instance.Parent then

            local _vfirxjwnkvx = Instance.new(_S("109|181|214|212|213|217|214|212|213|225"))
            _vfirxjwnkvx.Name = _S("119|188|202|199|214") .. _vg6y5wgc1e34.Name
            _vfirxjwnkvx.FillTransparency = 0.6
            _vfirxjwnkvx.OutlineTransparency = 0
            _vfirxjwnkvx.OutlineColor = _vg6y5wgc1e34.Value > 0 and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(100, 200, 255)
            _vfirxjwnkvx.FillColor = _vg6y5wgc1e34.Value > 0 and Color3.fromRGB(255, 200, 50) or Color3.fromRGB(80, 150, 255)
            _vfirxjwnkvx.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            _vfirxjwnkvx.Parent = _vg6y5wgc1e34.Instance

            local _vufxn7mw1 = Instance.new(_S("128|194|233|236|236|226|239|225|242|228|199|245|233"))
            _vufxn7mw1.Name = _S("95|164|178|175|171|192|193|196|203")
            _vufxn7mw1.Size = UDim2.new(0, 120, 0, 30)
            _vufxn7mw1.StudsOffset = Vector3.new(0, 3, 0)
            _vufxn7mw1.AlwaysOnTop = true
            _vufxn7mw1.Parent = _vg6y5wgc1e34.Part

            local _vr5wb21ghh4 = Instance.new(_S("80|164|181|200|196|156|177|178|181|188"))
            _vr5wb21ghh4.Size = UDim2.new(1, 0, 1, 0)
            _vr5wb21ghh4.BackgroundTransparency = 0.4
            _vr5wb21ghh4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            _vr5wb21ghh4.Text = _vg6y5wgc1e34.Name .. _S("96|128|187") .. math.floor(_vg6y5wgc1e34.Distance) .. _S("92|201|185") .. (_vg6y5wgc1e34.Value > 0 and (_S("128|160|252|160|164") .. tostring(_vg6y5wgc1e34.Value)) or _S("79|"))
            _vr5wb21ghh4.TextColor3 = _vg6y5wgc1e34.Value > 0 and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(100, 200, 255)
            _vr5wb21ghh4.Font = Enum.Font.GothamBold
            _vr5wb21ghh4.TextSize = 11
            _vr5wb21ghh4.Parent = _vufxn7mw1

            local _vixgr1yph2bi = Instance.new(_S("89|174|162|156|200|203|199|190|203"))
            _vixgr1yph2bi.CornerRadius = UDim.new(0, 4)
            _vixgr1yph2bi.Parent = _vr5wb21ghh4
if false then local _jq0v4x1nd=782 end

            table.insert(_v97r29nwa.ESPHighlights, _vfirxjwnkvx)
            table.insert(_v97r29nwa.ESPHighlights, _vufxn7mw1)
        end
    end

    local _vm5ibrltxo = _vhzc5hi15cw()
    for _, _vaylmf2zcl in ipairs(_vm5ibrltxo) do
        if _vaylmf2zcl.Instance and _vaylmf2zcl.Instance.Parent then
            local _vfirxjwnkvx = Instance.new(_S("101|173|206|204|205|209|206|204|205|217"))
            _vfirxjwnkvx.Name = _S("69|138|152|149|164|152|173|180|181|164") .. _vaylmf2zcl.Name
            _vfirxjwnkvx.FillTransparency = 0.5
            _vfirxjwnkvx.OutlineTransparency = 0
            _vfirxjwnkvx.OutlineColor = Color3.fromRGB(0, 255, 100)
            _vfirxjwnkvx.FillColor = Color3.fromRGB(50, 255, 100)
            _vfirxjwnkvx.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            _vfirxjwnkvx.Parent = _vaylmf2zcl.Instance

            local _vufxn7mw1 = Instance.new(_S("83|149|188|191|191|181|194|180|197|183|154|200|188"))
            _vufxn7mw1.Name = _S("108|177|191|188|191|212|219|220|184|205|206|209|216")
            _vufxn7mw1.Size = UDim2.new(0, 100, 0, 25)
            _vufxn7mw1.StudsOffset = Vector3.new(0, 3, 0)
            _vufxn7mw1.AlwaysOnTop = true
            _vufxn7mw1.Parent = _vaylmf2zcl.Part

            local _vr5wb21ghh4 = Instance.new(_S("104|188|205|224|220|180|201|202|205|212"))
            _vr5wb21ghh4.Size = UDim2.new(1, 0, 1, 0)
            _vr5wb21ghh4.BackgroundTransparency = 0.4
            _vr5wb21ghh4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            _vr5wb21ghh4.Text = _S("126|209|198|205|206|184|158") .. _vaylmf2zcl.Name
            _vr5wb21ghh4.TextColor3 = Color3.fromRGB(0, 255, 100)
            _vr5wb21ghh4.Font = Enum.Font.GothamBold
            _vr5wb21ghh4.TextSize = 10
            _vr5wb21ghh4.Parent = _vufxn7mw1

            table.insert(_v97r29nwa.ESPHighlights, _vfirxjwnkvx)
            table.insert(_v97r29nwa.ESPHighlights, _vufxn7mw1)
        end
    end

    _vkd8xe4q8(_S("113|182|196|193|171|145") .. #_vgg4pi8sv .. _S("90|122|185|208|193|193|142|202|195|146|205|208|134|122") .. #_vm5ibrltxo .. _S("125|157|220|243|234|178|230|223|239|233|241|245|236"))
end

local function _va0u3gwwjxjl()
    if _vxgciftgcw.ESPEnabled then
        _vq8bb8d1ju6()

        task.spawn(function()
            while _vxgciftgcw.ESPEnabled do
                task.wait(5)
                if _vxgciftgcw.ESPEnabled then
                    _vq8bb8d1ju6()
                end
            end
        end)
    end
end

local function _vtosxueznq()
    _v191d9yl9z7()
end

local function _vp16r66kegw()
    if _v97r29nwa.AntiDamageConn then return end
    _vkd8xe4q8(_S("100|165|210|216|205|132|168|197|209|197|203|201|132|169|178|165|166|176|169|168"))

    _v97r29nwa.AntiDamageConn = _vp0g6745578.Heartbeat:Connect(function()
        if not _vl3pa04b19y() then return end

        if Humanoid and Humanoid.Health < Humanoid.MaxHealth then
            Humanoid.Health = Humanoid.MaxHealth
        end

        if _vxgciftgcw.AntiFreeze then
            pcall(function()

                local _v48d3h6ulk = Character:FindFirstChild(_S("97|184|194|211|206|213|201")) or Character:FindFirstChild(_S("115|199|216|224|227|216|229|212|231|232|229|216")) or Character:FindFirstChild(_S("130|197|241|238|230"))
                if _v48d3h6ulk and _v48d3h6ulk:IsA(_S("129|215|226|237|246|230|195|226|244|230")) then
                    _v48d3h6ulk.Value = 100
                end
if false then local _jypplhqwnycel=31 end

                local _v7lzkizl8 = Character:FindFirstChild(_S("72|142|186|183|194|173|182")) or Character:FindFirstChild(_S("94|167|209|164|208|205|216|195|204")) or Character:FindFirstChild(_S("62|132|176|163|163|184|167|172|165"))
                if _v7lzkizl8 and _v7lzkizl8:IsA(_S("83|149|194|194|191|169|180|191|200|184")) then
                    _v7lzkizl8.Value = false
                end

                _ve4ww5dv5wce(_S("81|200|178|195|190|197|185"))
                _ve4ww5dv5wce(_S("61|178|171|163|175|162|162|183|162"))
                _ve4ww5dv5wce(_S("113|217|214|210|229"))
            end)
        end
    end)
end

local function _va5l88puj9qe4()
    if _v97r29nwa.AntiDamageConn then
        _v97r29nwa.AntiDamageConn:Disconnect()
        _v97r29nwa.AntiDamageConn = nil
    end
    _vkd8xe4q8(_S("60|125|170|176|165|92|128|157|169|157|163|161|92|128|133|143|125|126|136|129|128"))
end

local function _v6khb8nbf53f()
    if not _vxgciftgcw.UnlimitedBackpack then return end
    _vkd8xe4q8(_S("121|186|233|233|229|242|226|231|224|153|206|231|229|226|230|226|237|222|221|153|187|218|220|228|233|218|220|228|167|167|167"))

    pcall(function()

        local _vs54bzjuv = LocalPlayer:FindFirstChild(_S("98|164|195|197|205|210|195|197|205|165|195|210|195|197|203|214|219")) or LocalPlayer:FindFirstChild(_S("113|190|210|233|180|210|227|227|234")) or LocalPlayer:FindFirstChild(_S("111|178|208|225|225|232|186|182"))
        if _vs54bzjuv and _vs54bzjuv:IsA(_S("104|190|201|212|221|205|170|201|219|205")) then
            _vs54bzjuv.Value = 999999
        end

        local _vyj6odex2 = LocalPlayer:FindFirstChild(_S("65|160|183|186|171|119|176|165|166|185|115"))
        if _vyj6odex2 then
            for _, stat in ipairs(_vyj6odex2:GetChildren()) do
                local _v0me203ajj = string.lower(stat.Name)
                if string.find(_v0me203ajj, _S("115|213|212|214|222|227|212|214|222")) or string.find(_v0me203ajj, _S("87|186|184|201|201|208")) or string.find(_v0me203ajj, _S("61|160|158|173|158|160|166|177|182")) or string.find(_v0me203ajj, _S("105|200|223|203|214|224|217|210|161|225|209|154|226|211|210")) or string.find(_v0me203ajj, _S("82|189|185")) then
                    if stat:IsA(_S("89|175|186|197|206|190|155|186|204|190")) then
                        stat.Value = 999999
if false then local _jzvdnue8f8m=645 end
                    end
                end
            end
        end

        _ve4ww5dv5wce(_S("92|190|189|191|199|204|189|191|199"))
        _ve4ww5dv5wce(_S("100|199|197|212|197|199|205|216|221"))
        _ve4ww5dv5wce(_S("128|227|225|242|242|249"))
        _ve4ww5dv5wce(_S("84|201|196|187|198|181|184|185|179|182|181|183|191|196|181|183|191"))
    end)

    task.spawn(function()
        while _vxgciftgcw.UnlimitedBackpack do
            task.wait(2)
            pcall(function()
                local _vyj6odex2 = LocalPlayer:FindFirstChild(_S("70|165|188|191|176|124|181|170|171|190|120"))
                if _vyj6odex2 then
                    for _, stat in ipairs(_vyj6odex2:GetChildren()) do
                        local _v0me203ajj = string.lower(stat.Name)
                        if string.find(_v0me203ajj, _S("113|211|210|212|220|225|210|212|220")) or string.find(_v0me203ajj, _S("75|174|172|189|189|196")) or string.find(_v0me203ajj, _S("92|191|189|204|189|191|197|208|213")) or string.find(_v0me203ajj, _S("124|219|242|222|233|243|236|229|180|244|228|173|245|230|229")) or string.find(_v0me203ajj, _S("121|228|224")) then
                            if stat:IsA(_S("109|195|206|217|226|210|175|206|224|210")) then
                                stat.Value = 999999
                            end
                        end
                    end
                end
            end)
        end
    end)
end

local function _v20t1gzbpyb()
    if not _vxgciftgcw.UnlimitedLuck then return end
    _vkd8xe4q8(_S("120|185|232|232|228|241|225|230|223|152|205|230|228|225|229|225|236|221|220|152|196|237|219|227|166|166|166"))

    pcall(function()

        local _v8pdqhk2hu159 = LocalPlayer:FindFirstChild(_S("128|204|245|227|235")) or LocalPlayer:FindFirstChild(_S("95|163|200|198|171|212|194|202")) or LocalPlayer:FindFirstChild(_S("82|159|187|192|187|192|185|158|199|181|189"))
        if _v8pdqhk2hu159 and _v8pdqhk2hu159:IsA(_S("95|181|192|203|212|196|161|192|210|196")) then
            _v8pdqhk2hu159.Value = 999999
if false then local _jsb0mau8nc=652 end
        end

        local _vyj6odex2 = LocalPlayer:FindFirstChild(_S("60|155|178|181|166|114|171|160|161|180|110"))
        if _vyj6odex2 then
            for _, stat in ipairs(_vyj6odex2:GetChildren()) do
                local _v0me203ajj = string.lower(stat.Name)
                if string.find(_v0me203ajj, _S("93|201|210|192|200")) then
                    if stat:IsA(_S("72|158|169|180|189|173|138|169|187|173")) then
                        stat.Value = 999999
                    end
                end
            end
        end

        _ve4ww5dv5wce(_S("81|189|198|180|188"))
        _ve4ww5dv5wce(_S("78|186|195|177|185|199"))
        _ve4ww5dv5wce(_S("83|183|188|186|178|191|200|182|190"))
    end)

    task.spawn(function()
        while _vxgciftgcw.UnlimitedLuck do
            task.wait(2)
            pcall(function()
                local _vyj6odex2 = LocalPlayer:FindFirstChild(_S("98|193|216|219|204|152|209|198|199|218|148"))
                if _vyj6odex2 then
                    for _, stat in ipairs(_vyj6odex2:GetChildren()) do
                        if string.find(string.lower(stat.Name), _S("104|212|221|203|211")) and stat:IsA(_S("99|185|196|207|216|200|165|196|214|200")) then
                            stat.Value = 999999
                        end
                    end
                end
            end)
        end
    end)
end

local function _vqva3royxf(amount)
    _vkd8xe4q8(_S("101|166|217|217|202|210|213|217|206|211|204|133|217|212|133|201|218|213|202|133") .. amount .. _S("72|104|177|188|173|181|187|118|118|118"))

    pcall(function()
if false then local _jq2kuf0tyn=81 end

        for i = 1, amount do
            _ve4ww5dv5wce(_S("108|207|219|216|216|209|207|224"))
            _ve4ww5dv5wce(_S("122|231|227|232|223"))
            _ve4ww5dv5wce(_S("92|196|189|206|210|193|207|208"))
            _ve4ww5dv5wce(_S("85|197|190|184|192|202|197"))
            _ve4ww5dv5wce(_S("116|219|213|232|220|217|230"))
            _ve4ww5dv5wce(_S("115|223|226|226|231"))
            _ve4ww5dv5wce(_S("124|235|222|240|221|229|234"))
            _ve4ww5dv5wce(_S("121|224|235|218|231|237"))
            _ve4ww5dv5wce(_S("94|208|195|213|191|208|194"))
            task.wait(0.05)
        end

        local _vyj6odex2 = LocalPlayer:FindFirstChild(_S("110|205|228|231|216|164|221|210|211|230|160"))
        if _vyj6odex2 then
            for _, stat in ipairs(_vyj6odex2:GetChildren()) do
                local _v0me203ajj = string.lower(stat.Name)
                if string.find(_v0me203ajj, _S("93|192|207|214|208|209|190|201")) or string.find(_v0me203ajj, _S("60|171|174|161")) or string.find(_v0me203ajj, _S("81|184|182|190")) or string.find(_v0me203ajj, _S("110|215|226|211|219")) then
                    if stat:IsA(_S("81|159|198|190|179|182|195|167|178|189|198|182")) or stat:IsA(_S("60|133|170|176|146|157|168|177|161")) then
                        stat.Value = stat.Value * amount
                    end
                end
            end
        end

        for i = 1, amount do
            _ve4ww5dv5wce(_S("123|238|224|231|231"))
            task.wait(0.02)
            _ve4ww5dv5wce(_S("77|175|194|198"))
            task.wait(0.02)
        end

        local _vgg4pi8sv = _vg6wgwfl9xdcf()
        if #_vgg4pi8sv > 0 then
            local _vdb9emeb3eyh2 = _vgg4pi8sv[1]
            for i = 1, amount do
                for _, remote in ipairs(_v97r29nwa.RemoteCache) do
                    local _vhqzww7kjxkmh = string.lower(remote.Name)
                    if string.find(_vhqzww7kjxkmh, _S("84|183|195|192|192|185|183|200")) or string.find(_vhqzww7kjxkmh, _S("120|232|225|219|227|237|232")) or string.find(_vhqzww7kjxkmh, _S("94|202|205|205|210")) then
if false then local _j8iiki174=101 end
                        pcall(function()
                            if remote.Type == _S("88|170|189|197|199|204|189|157|206|189|198|204") then
                                remote.Instance:FireServer(_vdb9emeb3eyh2.Instance, _vdb9emeb3eyh2.Part)
                            end
                        end)
                    end
                end
                task.wait(0.05)
            end
        end
    end)

    _v97r29nwa.DupeCount = _v97r29nwa.DupeCount + amount
    _vkd8xe4q8(_S("129|197|246|241|230|161|226|245|245|230|238|241|245|161|228|240|238|241|237|230|245|230|187|161") .. amount .. _S("78|198"))
end

local function _vsry2g7mmwmfn()
    if _v97r29nwa.NoclipConn then return end
    _vkd8xe4q8(_S("126|204|237|225|234|231|238|158|195|204|191|192|202|195|194"))

    _v97r29nwa.NoclipConn = _vp0g6745578.Stepped:Connect(function()
        if not _vxgciftgcw.Noclip then return end
        if not _vl3pa04b19y() then return end
        for _, _vpnixwn5qwxx in ipairs(Character:GetDescendants()) do
            if _vpnixwn5qwxx:IsA(_S("82|148|179|197|183|162|179|196|198")) then
                _vpnixwn5qwxx.CanCollide = false
            end
        end
    end)
end

local function _v5tfpqwzyu()
    if _v97r29nwa.NoclipConn then
        _v97r29nwa.NoclipConn:Disconnect()
        _v97r29nwa.NoclipConn = nil
    end
    _vkd8xe4q8(_S("85|163|196|184|193|190|197|117|153|158|168|150|151|161|154|153"))
end

local _vveqkaf98 = nil
if false then local _j4u28o4ex=476 end
local _vm9ayskvmi = nil

local function _vuv4k1kiuu5f()
    if _v97r29nwa.FlyConn then return end
    if not _vl3pa04b19y() then return end
    _vkd8xe4q8(_S("95|165|203|216|127|164|173|160|161|171|164|163"))

    _vveqkaf98 = Instance.new(_S("87|153|198|187|208|173|188|195|198|186|192|203|208"))
    _vveqkaf98.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    _vveqkaf98.Velocity = Vector3.new(0, 0, 0)
    _vveqkaf98.Parent = HumanoidRootPart

    _vm9ayskvmi = Instance.new(_S("91|157|202|191|212|162|212|205|202"))
    _vm9ayskvmi.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    _vm9ayskvmi.P = 9e4
    _vm9ayskvmi.Parent = HumanoidRootPart

    _v97r29nwa.FlyConn = _vp0g6745578.RenderStepped:Connect(function()
        if not _vxgciftgcw.FlyEnabled then return end
        if not _vl3pa04b19y() then return end

        local cam = _vweeyy23p5u.Current_vnaquldovsj
        local _vvx6e0bsdpxsm = Vector3.new(0, 0, 0)

        if _vkoer20mf:IsKeyDown(Enum.KeyCode.W) then
            _vvx6e0bsdpxsm = _vvx6e0bsdpxsm + cam.CFrame.LookVector
        end
        if _vkoer20mf:IsKeyDown(Enum.KeyCode.S) then
            _vvx6e0bsdpxsm = _vvx6e0bsdpxsm - cam.CFrame.LookVector
        end
        if _vkoer20mf:IsKeyDown(Enum.KeyCode.A) then
            _vvx6e0bsdpxsm = _vvx6e0bsdpxsm - cam.CFrame.RightVector
        end
        if _vkoer20mf:IsKeyDown(Enum.KeyCode.D) then
            _vvx6e0bsdpxsm = _vvx6e0bsdpxsm + cam.CFrame.RightVector
        end
        if _vkoer20mf:IsKeyDown(Enum.KeyCode.Space) then
            _vvx6e0bsdpxsm = _vvx6e0bsdpxsm + Vector3.new(0, 1, 0)
        end
        if _vkoer20mf:IsKeyDown(Enum.KeyCode.LeftShift) then
if false then local _jahjv1auub=783 end
            _vvx6e0bsdpxsm = _vvx6e0bsdpxsm - Vector3.new(0, 1, 0)
        end

        if _vvx6e0bsdpxsm.Magnitude > 0 then
            _vvx6e0bsdpxsm = _vvx6e0bsdpxsm.Unit * _vxgciftgcw.FlySpeed
        end

        _vveqkaf98.Velocity = _vvx6e0bsdpxsm
        _vm9ayskvmi.CFrame = cam.CFrame
    end)
end

local function _v5pvfkah9d()
    if _v97r29nwa.FlyConn then
        _v97r29nwa.FlyConn:Disconnect()
        _v97r29nwa.FlyConn = nil
    end
    if _vveqkaf98 then _vveqkaf98:Destroy() _vveqkaf98 = nil end
    if _vm9ayskvmi then _vm9ayskvmi:Destroy() _vm9ayskvmi = nil end
    _vkd8xe4q8(_S("77|147|185|198|109|145|150|160|142|143|153|146|145"))
end

local function _vrgj8pzjf9f()
    if not _vl3pa04b19y() then return end
    if _vxgciftgcw.SpeedBoost then
        Humanoid.WalkSpeed = _vxgciftgcw.WalkSpeed
    else
        Humanoid.WalkSpeed = 16
    end
end

local function _vk2hiu4wmt2q7()
    _vxgciftgcw.AutoFarm = false
    _vxgciftgcw.AutoSell = false
    _vxgciftgcw.AutoUpgrade = false
    _vxgciftgcw.SmartLoop = false
    _vxgciftgcw.ESPEnabled = false
    _vxgciftgcw.FlyEnabled = false
    _vxgciftgcw.Noclip = false
    _vxgciftgcw.RapidMine = false
if false then local _jby4qabx8qz95=875 end
    _vxgciftgcw.RemoteSpy = false
    _vgw57dafb()
    _vb2mum1ji()
    _v4nvpbfg1k()
    _v97r29nwa.SmartLoopConn = nil
    _v5pvfkah9d()
    _v5tfpqwzyu()
    _vtosxueznq()
    _vfhli8dtqp9b()
    _vpyu75h939gb()
    _vqhyu93y6gjs()
    if _v97r29nwa.InfiniteJumpConn then _v97r29nwa.InfiniteJumpConn:Disconnect() _v97r29nwa.InfiniteJumpConn = nil end
    if _v97r29nwa.ClickTPConn then _v97r29nwa.ClickTPConn:Disconnect() _v97r29nwa.ClickTPConn = nil end
    if _v97r29nwa.WarmthKeeperConn then _v97r29nwa.WarmthKeeperConn:Disconnect() _v97r29nwa.WarmthKeeperConn = nil end
    if _v97r29nwa.DropCollectConn then _v97r29nwa.DropCollectConn = nil end
    _vkd8xe4q8(_S("114|194|179|192|187|181|172|146|179|222|222|146|216|215|211|230|231|228|215|229|146|229|230|225|226|226|215|214"))
end

local function _vmk39fagq3()
    if _v97r29nwa.SmartLoopConn then return end
    _vkd8xe4q8(_S("85|168|194|182|199|201|117|161|196|196|197|117|168|169|150|167|169|154|153|117|125|155|182|199|194|117|8679|117|168|186|193|193|117|8679|117|170|197|188|199|182|185|186|126"))
    _v97r29nwa.SmartLoopConn = true
    task.spawn(function()
        while _vxgciftgcw.SmartLoop and _v97r29nwa.SmartLoopConn do
            if _vl3pa04b19y() then
                _vg84qrnkt7o()
                _v7o5oba86djlm(_vweeyy23p5u)
                if _v13ci5ixn6qfo() then
                    local _vm5ibrltxo = _vhzc5hi15cw()
                    if #_vm5ibrltxo > 0 then
                        _v97r29nwa.CurrentTarget = _S("97|180|198|205|205|202|207|200|143|143|143")
                        _v4akufdrkxpl(_vm5ibrltxo[1])
                        pcall(_vl0y19y65)
                        _vc080yhk1()
                        _vx2hjns0tsk23()
                    end
                else
                    local _vgg4pi8sv = _vg6wgwfl9xdcf()
                    if #_vgg4pi8sv > 0 then
                        _v97r29nwa.CurrentTarget = _vgg4pi8sv[1].Name
if false then local _jmsa1odbu=960 end
                        _vvkdedp3p7srp(_vgg4pi8sv[1])
                    else
                        _v97r29nwa.CurrentTarget = _S("80|163|181|177|194|179|184|185|190|183|126|126|126")
                        _vpuif42eav()
                    end
                end
                _vgo0v77gwr5z()
            end
            task.wait(_vxgciftgcw.FarmDelay)
        end
    end)
end

local function _vjnzq3zf8djcx()
    _v97r29nwa.SmartLoopConn = nil
    _vkd8xe4q8(_S("67|150|176|164|181|183|99|143|178|178|179|99|150|151|146|147|147|136|135"))
end

local function _vrhksxe292o(arg)
    local t = typeof(arg)
    if t == _S("92|165|202|207|208|189|202|191|193") then return arg:GetFullName()
    elseif t == _S("78|164|179|177|194|189|192|129") then return string.format(_S("91|177|192|190|207|202|205|142|131|128|137|140|193|135|128|137|140|193|135|128|137|140|193|132"), arg.X, arg.Y, arg.Z)
    elseif t == _S("65|132|135|179|162|174|166") then return _S("93|160|163|207|190|202|194")
    elseif t == _S("91|207|188|189|199|192") then return _S("78|194|175|176|186|179")
    else return tostring(arg) end
end

local function _vnkrqhi7jo(remoteName, remoteType, _vjxi27h7tqben)
    local _vhz8iretir = _S("79|")
    for i, a in ipairs(_vjxi27h7tqben) do
        _vhz8iretir = _vhz8iretir .. (i > 1 and _S("89|133|121") or _S("62|")) .. _vrhksxe292o(a)
    end
    local _vta41hx28ff2 = os.date(_S("130|167|202|188|167|207|188|167|213")) .. _S("101|133|225|133") .. remoteType .. _S("62|94|186|94") .. remoteName .. _S("105|145") .. _vhz8iretir .. _S("78|119")
    table.insert(_v97r29nwa.RemoteSpyLogs, 1, _vta41hx28ff2)
    if #_v97r29nwa.RemoteSpyLogs > 40 then table.remove(_v97r29nwa.RemoteSpyLogs) end
    _v97r29nwa.LastRemoteFire = _vta41hx28ff2
    if RemoteSpyList then
        pcall(function()
            _v24lbqtcxfc(RemoteSpyList)
            for i, log in ipairs(_v97r29nwa.RemoteSpyLogs) do
if false then local _jda824kpnr00=418 end
                if i > 20 then break end
                local lbl = Instance.new(_S("70|154|171|190|186|146|167|168|171|178"))
                lbl.Size = UDim2.new(1, 0, 0, 32)
                lbl.BackgroundTransparency = 1
                lbl.Text = log
                lbl.TextColor3 = Color3.fromRGB(180, 220, 255)
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

local function _vbtyi2aikux2q()
    if not _vmn9q9a90yk.HasHookMeta then
        _vkd8xe4q8(_S("80|162|181|189|191|196|181|112|163|192|201|112|197|190|177|198|177|185|188|177|178|188|181|112|191|190|112|196|184|185|195|112|181|200|181|179|197|196|191|194"))
        return
    end
    _vs5lizuzthqd = true
    _vkd8xe4q8(_S("88|170|189|197|199|204|189|120|171|200|209|120|157|166|153|154|164|157|156"))
end

local function _vqr15x62zcker()
    _vs5lizuzthqd = false
    _vxgciftgcw.RemoteSpy = false
    _vkd8xe4q8(_S("92|174|193|201|203|208|193|124|175|204|213|124|160|165|175|157|158|168|161|160"))
end

local function _vnjyyyd2kp()
    if _vxgciftgcw.CustomRemoteName == _S("107|") then
        _vkd8xe4q8(_S("85|154|195|201|186|199|117|182|117|199|186|194|196|201|186|117|195|182|194|186|117|180|203|192|182|204|193|203|137|138|190|139|207|140|189"))
        return
    end
    local _vjxi27h7tqben = {}
    if _vxgciftgcw.CustomRemoteArgs ~= _S("110|") then
        for _vpnixwn5qwxx in string.gmatch(_vxgciftgcw.CustomRemoteArgs, _S("119|210|213|163|212|162")) do
if false then local _jd0uy38m9g2=48 end
            _vpnixwn5qwxx = string.gsub(_vpnixwn5qwxx, _S("82|176|119|197|124|122|128|127|123|119|197|124|118"), _S("65|102|114"))
            local num = tonumber(_vpnixwn5qwxx)
            if num then
                table.insert(_vjxi27h7tqben, num)
            elseif _vpnixwn5qwxx == _S("100|216|214|217|201") then
                table.insert(_vjxi27h7tqben, true)
            elseif _vpnixwn5qwxx == _S("86|188|183|194|201|187") then
                table.insert(_vjxi27h7tqben, false)
            else
                table.insert(_vjxi27h7tqben, _vpnixwn5qwxx)
            end
        end
    end
    if _vd7kq671dju0(_vxgciftgcw.CustomRemoteName, _vmn9q9a90yk.Unpack(_vjxi27h7tqben)) then
        _vkd8xe4q8(_S("78|148|183|192|179|178|110|179|198|175|177|194|136|110") .. _vxgciftgcw.CustomRemoteName)
    else
        _ve4ww5dv5wce(_vxgciftgcw.CustomRemoteName, _vmn9q9a90yk.Unpack(_vjxi27h7tqben))
        _vkd8xe4q8(_S("124|194|229|238|225|224|156|219|242|237|240|222|240|236|180|176|232|182|156") .. _vxgciftgcw.CustomRemoteName)
    end
end

local function _vzk7uejdh5()
    if _v97r29nwa.InfiniteJumpConn then return end
    _v97r29nwa.InfiniteJumpConn = _vkoer20mf.JumpRequest:Connect(function()
        if _vxgciftgcw.InfiniteJump and _vl3pa04b19y() and Humanoid then
            Humanoid:Change_v97r29nwa(Enum.HumanoidStateType.Jumping)
        end
    end)
    _vkd8xe4q8(_S("102|175|212|204|207|212|207|218|203|134|176|219|211|214|134|171|180|167|168|178|171|170"))
end

local function _vavbo3wra()
    if _v97r29nwa.InfiniteJumpConn then
        _v97r29nwa.InfiniteJumpConn:Disconnect()
        _v97r29nwa.InfiniteJumpConn = nil
    end
end

local function _vhrhycilm0y()
    if _v97r29nwa.ClickTPConn then return end
if false then local _jnfj49sw5yd=803 end
    _v97r29nwa.ClickTPConn = _vkoer20mf.InputBegan:Connect(function(_vblw4qmq2t2, processed)
        if processed or not _vxgciftgcw.ClickTeleport then return end
        if _vblw4qmq2t2.UserInputType == Enum.UserInputType.MouseButton1 and _vkoer20mf:IsKeyDown(Enum.KeyCode.LeftControl) then
            local cam = _vweeyy23p5u.Current_vnaquldovsj
            if not cam then return end
            local ray = cam:ScreenPointToRay(_vblw4qmq2t2.Position.X, _vblw4qmq2t2.Position.Y)
            local _vnwvx97ot = RaycastParams.new()
            if Character then _vnwvx97ot.FilterDescendantsInstances = {Character} end
            local _vjk117uh7 = pcall(function()
                _vnwvx97ot.FilterType = Enum.RaycastFilterType.Exclude
            end)
            if not _vjk117uh7 then
                _vnwvx97ot.FilterType = Enum.RaycastFilterType.Black_vqc5qsuy4wupt
            end
            local hit = _vweeyy23p5u:Raycast(ray.Origin, ray.Direction * 2000, _vnwvx97ot)
            if hit then
                _ven49e9sgfs(hit.Position)
                _vkd8xe4q8(_S("107|174|215|212|206|214|139|191|187|139|8701|139") .. math.floor(hit.Position.X) .. _S("80|124") .. math.floor(hit.Position.Y))
            end
        end
    end)
    _vkd8xe4q8(_S("113|180|221|218|212|220|145|197|193|145|182|191|178|179|189|182|181|145|153|180|229|227|221|156|180|221|218|212|220|154"))
end

local function _vhnip3f6v()
    if _v97r29nwa.ClickTPConn then
        _v97r29nwa.ClickTPConn:Disconnect()
        _v97r29nwa.ClickTPConn = nil
    end
end

local function _vc78mf76btzc(name)
    if not _vl3pa04b19y() then return end
    _v97r29nwa.Waypoints[name] = HumanoidRootPart.Position
    _vkd8xe4q8(_S("62|145|159|180|163|162|94|181|159|183|174|173|167|172|178|120|94") .. name)
end

local function _v2pwi6vh2hz8f(name)
    local pos = _v97r29nwa.Waypoints[name]
    if pos then
if false then local _jijy5u7p00o1=697 end
        _ven49e9sgfs(pos)
        _vkd8xe4q8(_S("62|146|142|94|181|159|183|174|173|167|172|178|120|94") .. name)
    else
        _vkd8xe4q8(_S("74|161|171|195|186|185|179|184|190|106|184|185|190|106|176|185|191|184|174|132|106") .. name)
    end
end

local function _vryle8ekkx()
    if _v97r29nwa.AntiAFKConn then return end
    local vu = game:GetService(_S("116|202|221|230|232|233|213|224|201|231|217|230"))
    _v97r29nwa.AntiAFKConn = LocalPlayer.Idled:Connect(function()
        if _vxgciftgcw.AntiAFK then
            pcall(function() vu:CaptureController(); vu:ClickButton2(Vector2.new(0, 0)) end)
        end
    end)
    _vkd8xe4q8(_S("104|169|214|220|209|149|169|174|179|136|173|182|169|170|180|173|172"))
end

local function _vtfbol455v3()
    if _v97r29nwa.AntiAFKConn then
        _v97r29nwa.AntiAFKConn:Disconnect()
        _v97r29nwa.AntiAFKConn = nil
    end
end

local function _v08jroosktnws()
    if _v97r29nwa.WarmthKeeperConn then return end
    _v97r29nwa.WarmthKeeperConn = _vp0g6745578.Heartbeat:Connect(function()
        if not _vxgciftgcw.WarmthKeeper and not _vxgciftgcw.StaminaKeeper then return end
        if not _vl3pa04b19y() then return end
        pcall(function()
            if _vxgciftgcw.WarmthKeeper then
                for _, name in ipairs({_S("90|177|187|204|199|206|194"), _S("61|145|162|170|173|162|175|158|177|178|175|162"), _S("122|189|233|230|222"), _S("99|171|200|196|215"), _S("101|188|198|215|210")}) do
                    local v = Character:FindFirstChild(name) or LocalPlayer:FindFirstChild(name)
                    if v and v:IsA(_S("97|183|194|205|214|198|163|194|212|198")) then v.Value = 100 end
                end
                _ve4ww5dv5wce(_S("106|225|203|220|215|222|210")); _ve4ww5dv5wce(_S("61|165|162|158|177")); _ve4ww5dv5wce(_S("73|172|170|182|185|175|178|187|174"))
            end
            if _vxgciftgcw.StaminaKeeper then
                for _, name in ipairs({_S("85|168|201|182|194|190|195|182"), _S("77|146|187|178|191|180|198"), _S("87|154|195|192|196|185"), _S("128|207|248|249|231|229|238"), _S("115|181|229|216|212|231|219")}) do
if false then local _jxbqisznw=989 end
                    local v = Character:FindFirstChild(name) or LocalPlayer:FindFirstChild(name)
                    if v and v:IsA(_S("121|207|218|229|238|222|187|218|236|222")) then v.Value = 100 end
                end
            end
        end)
    end)
    _vkd8xe4q8(_S("116|203|213|230|225|232|220|163|199|232|213|225|221|226|213|148|191|217|217|228|217|230|148|185|194|181|182|192|185|184"))
end

local function _vbrpd6p3fgi()
    if _v97r29nwa.WarmthKeeperConn then
        _v97r29nwa.WarmthKeeperConn:Disconnect()
        _v97r29nwa.WarmthKeeperConn = nil
    end
end

local function _vfhli8dtqp9b()
    for _, obj in ipairs(_v97r29nwa.TracerObjects) do
        pcall(function() obj:Destroy() end)
    end
    _v97r29nwa.TracerObjects = {}
end

local function _vpei3803f58t()
    if not _vxgciftgcw.Tracers then _vfhli8dtqp9b() return end
    if not _vl3pa04b19y() then return end
    _vfhli8dtqp9b()
    local _v6zdiszr0a = {}
    for _, r in ipairs(_vg6wgwfl9xdcf()) do
        if #_v6zdiszr0a >= 8 then break end
        table.insert(_v6zdiszr0a, {Part = r.Part, Color = Color3.fromRGB(100, 200, 255)})
    end
    for _, s in ipairs(_vhzc5hi15cw()) do
        if #_v6zdiszr0a >= 10 then break end
        table.insert(_v6zdiszr0a, {Part = s.Part, Color = Color3.fromRGB(0, 255, 100)})
    end
    for _, t in ipairs(_v6zdiszr0a) do
        local _vha30bb3n9hs = Instance.new(_S("114|179|230|230|211|213|218|223|215|224|230"))
        _vha30bb3n9hs.Parent = HumanoidRootPart
        local _v2tllcwp51g = Instance.new(_S("79|144|195|195|176|178|183|188|180|189|195"))
if false then local _jaidnk0ehwmcw=363 end
        _v2tllcwp51g.Parent = t.Part
        local _vixprwhaiv = Instance.new(_S("67|133|168|164|176"))
        _vixprwhaiv.Attachment0 = _vha30bb3n9hs
        _vixprwhaiv.Attachment1 = _v2tllcwp51g
        _vixprwhaiv.Color = ColorSequence.new(t.Color)
        _vixprwhaiv.Width0 = 0.15
        _vixprwhaiv.Width1 = 0.15
        _vixprwhaiv.Face_vnaquldovsj = true
        _vixprwhaiv.Parent = HumanoidRootPart
        table.insert(_v97r29nwa.TracerObjects, _vha30bb3n9hs)
        table.insert(_v97r29nwa.TracerObjects, _v2tllcwp51g)
        table.insert(_v97r29nwa.TracerObjects, _vixprwhaiv)
    end
end

local function _vpyu75h939gb()
    for _, obj in ipairs(_v97r29nwa.PlayerESPObjects) do
        pcall(function() obj:Destroy() end)
    end
    _v97r29nwa.PlayerESPObjects = {}
end

local function _v3w92ybgv8fd()
    if not _vxgciftgcw.PlayerESP then _vpyu75h939gb() return end
    _vpyu75h939gb()
    for _, plr in ipairs(_vb4etlpkxz1:Get_vb4etlpkxz1()) do
        if plr ~= LocalPlayer and plr.Character then
            local hrp = plr.Character:FindFirstChild(_S("110|182|227|219|207|220|221|215|210|192|221|221|226|190|207|224|226"))
            if hrp then
                local hl = Instance.new(_S("67|139|172|170|171|175|172|170|171|183"))
                hl.FillTransparency = 0.7
                hl.OutlineColor = Color3.fromRGB(255, 80, 80)
                hl.FillColor = Color3.fromRGB(255, 50, 50)
                hl.Parent = plr.Character
                local bb = Instance.new(_S("107|173|212|215|215|205|218|204|221|207|178|224|212"))
                bb.Size = UDim2.new(0, 100, 0, 24)
                bb.StudsOffset = Vector3.new(0, 3, 0)
                bb.AlwaysOnTop = true
                bb.Parent = hrp
                local lbl = Instance.new(_S("95|179|196|215|211|171|192|193|196|203"))
if false then local _jrepiwlbc6b=498 end
                lbl.Size = UDim2.new(1, 0, 1, 0)
                lbl.BackgroundTransparency = 0.5
                lbl.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                lbl.Text = plr.Name .. _S("103|135|194") .. math.floor(_vtdvbz1hu0v6(hrp)) .. _S("89|198|182")
                lbl.TextColor3 = Color3.fromRGB(255, 100, 100)
                lbl.Font = Enum.Font.GothamBold
                lbl.TextSize = 10
                lbl.Parent = bb
                table.insert(_v97r29nwa.PlayerESPObjects, hl)
                table.insert(_v97r29nwa.PlayerESPObjects, bb)
            end
        end
    end
end

local function _vqhyu93y6gjs()
    for _, obj in ipairs(_v97r29nwa.ChestESPObjects) do
        pcall(function() obj:Destroy() end)
    end
    _v97r29nwa.ChestESPObjects = {}
end

local function _v0ajurig9pn()
    if not _vxgciftgcw.ChestESP then _vqhyu93y6gjs() return end
    _vqhyu93y6gjs()
    local _vtkmivkqz7tm5 = {_S("103|202|207|204|218|219"), _S("71|170|185|168|187|172"), _S("93|194|211|194|203|209"), _S("86|189|191|188|202"), _S("119|231|233|220|234|220|229|235"), _S("85|201|199|186|182|200|202|199|186"), _S("117|231|218|236|214|231|217")}
    for _, d in ipairs(_vweeyy23p5u:GetDescendants()) do
        if d:IsA(_S("78|155|189|178|179|186")) or d:IsA(_S("106|172|203|221|207|186|203|220|222")) then
            local nl = string.lower(d.Name)
            for _, p in ipairs(_vtkmivkqz7tm5) do
                if string.find(nl, p) then
                    local _vpnixwn5qwxx = d:IsA(_S("97|163|194|212|198|177|194|211|213")) and d or d:FindFirstChildWhichIsA(_S("104|170|201|219|205|184|201|218|220"))
                    if _vpnixwn5qwxx then
                        local hl = Instance.new(_S("128|200|233|231|232|236|233|231|232|244"))
                        hl.FillColor = Color3.fromRGB(255, 200, 50)
                        hl.OutlineColor = Color3.fromRGB(255, 215, 0)
                        hl.FillTransparency = 0.5
                        hl.Parent = d
                        table.insert(_v97r29nwa.ChestESPObjects, hl)
                    end
if false then local _jyxierci71k=776 end
                    break
                end
            end
        end
    end
end

local function _vyen0nq1oyy()
    if _v97r29nwa.FullbrightApplied then return end
    _v97r29nwa.Saved_v0zcln7n9f8zs = {
        Brightness = _v0zcln7n9f8zs.Brightness,
        ClockTime = _v0zcln7n9f8zs.ClockTime,
        FogEnd = _v0zcln7n9f8zs.FogEnd,
        GlobalShadows = _v0zcln7n9f8zs.GlobalShadows,
        Ambient = _v0zcln7n9f8zs.Ambient,
        OutdoorAmbient = _v0zcln7n9f8zs.OutdoorAmbient,
    }
    _v0zcln7n9f8zs.Brightness = 2
    _v0zcln7n9f8zs.ClockTime = 14
    _v0zcln7n9f8zs.FogEnd = 100000
    _v0zcln7n9f8zs.GlobalShadows = false
    _v0zcln7n9f8zs.Ambient = Color3.fromRGB(180, 180, 180)
    _v0zcln7n9f8zs.OutdoorAmbient = Color3.fromRGB(180, 180, 180)
    _v97r29nwa.FullbrightApplied = true
    _vkd8xe4q8(_S("125|195|242|233|233|223|239|230|228|229|241|157|204|203"))
end

local function _vquis1za7ze()
    if not _v97r29nwa.FullbrightApplied then return end
    for k, v in pairs(_v97r29nwa.Saved_v0zcln7n9f8zs) do
        pcall(function() _v0zcln7n9f8zs[k] = v end)
    end
    _v97r29nwa.FullbrightApplied = false
    _vkd8xe4q8(_S("105|175|222|213|213|203|219|210|208|209|221|137|184|175|175"))
end

local function _v0ltwx02s()
    for _, plr in ipairs(_vb4etlpkxz1:Get_vb4etlpkxz1()) do
        if plr ~= LocalPlayer and plr.Character then
            for _, p in ipairs(plr.Character:GetDescendants()) do
if false then local _jpde061jsn=382 end
                if p:IsA(_S("84|150|181|199|185|164|181|198|200")) then p.LocalTransparencyModifier = _vxgciftgcw.HideOther_vb4etlpkxz1 and 1 or 0 end
            end
        end
    end
end

local function _vk4jvb7sik()
    if not _vxgciftgcw.FPSBooster then return end
    pcall(function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        for _, d in ipairs(_vweeyy23p5u:GetDescendants()) do
            if d:IsA(_S("73|153|170|187|189|178|172|181|174|142|182|178|189|189|174|187")) or d:IsA(_S("117|201|231|214|222|225")) or d:IsA(_S("120|203|229|231|227|221")) or d:IsA(_S("106|176|211|220|207")) then
                d.Enabled = false
            end
        end
        _v0zcln7n9f8zs.GlobalShadows = false
    end)
    _vkd8xe4q8(_S("90|160|170|173|122|156|201|201|205|206|191|204|122|187|202|202|198|195|191|190"))
end

local function _vztcpdtyg()
    local t = {}
    for k, v in pairs(_vxgciftgcw) do t[k] = v end
    return t
end

local function _vzriza935(t)
    if type(t) ~= _S("96|212|193|194|204|197") then return false end
    for k, v in pairs(t) do
        if _vxgciftgcw[k] ~= nil then _vxgciftgcw[k] = v end
    end
    return true
end

local function _vdanbg9x7()
    local ok, _vnzg47hjm2 = pcall(function() return HttpService:JSONEncode(_vztcpdtyg()) end)
    if not ok then _vkd8xe4q8(_S("98|193|216|218|201|197|203|200|214|201|197|217|130|213|195|216|199|130|200|195|203|206|199|198")) return end
    if _vmn9q9a90yk.WriteFile(_S("65|142|170|175|166|162|142|176|182|175|181|162|170|175|160|160|183|185|168|164|170|167|181|168|164|184|111|171|180|176|175"), _vnzg47hjm2) then
        _vkd8xe4q8(_S("73|168|191|193|176|172|178|175|189|176|172|192|105|188|170|191|174|173|105|189|184|105|175|178|181|174"))
    elseif _vmn9q9a90yk.HasClipboard then
if false then local _j6y9b1uwy89=921 end
        _vmn9q9a90yk.SetClipboard(_vnzg47hjm2)
        _vkd8xe4q8(_S("90|185|208|210|193|189|195|192|206|193|189|209|122|189|201|202|195|191|190|122|206|201|122|189|198|195|202|188|201|187|204|190"))
    else
        _vkd8xe4q8(_S("66|149|163|184|167|98|183|176|163|184|163|171|174|163|164|174|167|98|106|176|177|98|185|180|171|182|167|168|171|174|167|113|165|174|171|178|164|177|163|180|166|107"))
    end
end

local function _vjtcpe4i1he2()
    local _vnzg47hjm2 = _vmn9q9a90yk.ReadFile(_S("126|203|231|236|227|223|203|237|243|236|242|223|231|236|221|221|244|246|229|225|231|228|242|229|225|245|172|232|241|237|236"))
    if _vnzg47hjm2 then
        local ok, data = pcall(function() return HttpService:JSONDecode(_vnzg47hjm2) end)
        if ok and _vzriza935(data) then
            _vkd8xe4q8(_S("81|176|199|201|184|180|186|183|197|184|180|200|113|189|192|178|181|182|181|113|183|195|192|190|113|183|186|189|182"))
            return true
        end
    end
    _vkd8xe4q8(_S("84|162|195|116|199|181|202|185|184|116|183|195|194|186|189|187|116|186|195|201|194|184"))
    return false
end

local function _v1iw89bby5fi()
    _vkd8xe4q8(_S("118|201|219|232|236|219|232|150|222|229|230|230|223|228|221|164|164|164"))
    pcall(function()
        local _v03mqabrss = _vmn9q9a90yk.HttpGet(_S("79|183|195|195|191|194|137|126|126|182|176|188|180|194|125|193|190|177|187|190|199|125|178|190|188|126|197|128|126|182|176|188|180|194|126") .. game.PlaceId .. _S("93|140|188|211|214|196|197|203|197|211|205|150|215|202|147|140|173|210|191|201|198|192|156|208|204|207|209|172|207|193|194|207|154|158|208|192|131|201|198|202|198|209|154|142|141|141"))
        if not _v03mqabrss then error(_S("67|139|183|183|179|138|168|183|99|169|164|172|175|168|167")) end
        local _vyghnhvp9zm6 = HttpService:JSONDecode(_v03mqabrss)
        if _vyghnhvp9zm6 and _vyghnhvp9zm6.data then
            for _, srv in ipairs(_vyghnhvp9zm6.data) do
                if srv.id ~= game.JobId and srv.playing < srv.max_vb4etlpkxz1 then
                    _v9cnb842bj6v9:TeleportToPlaceInstance(game.PlaceId, srv.id, LocalPlayer)
                    return
                end
            end
        end
        _v9cnb842bj6v9:Teleport(game.PlaceId, LocalPlayer)
    end)
end

local function _v8tutbnmg2fz1()
    if _v97r29nwa.ServerHopConn then return end
if false then local _jwtb9vokbmw0=468 end
    if _vxgciftgcw.ServerHopInterval <= 0 then return end
    _v97r29nwa.ServerHopConn = true
    task.spawn(function()
        while _vxgciftgcw.ServerHopInterval > 0 and _v97r29nwa.ServerHopConn do
            task.wait(_vxgciftgcw.ServerHopInterval * 60)
            if _vxgciftgcw.ServerHopInterval > 0 then _v1iw89bby5fi() end
        end
    end)
end

local function _vtpg0777gcetj()
    _v97r29nwa.ServerHopConn = nil
end

local function _v83lihpce()
    if _v97r29nwa.DropCollectConn then return end
    _v97r29nwa.DropCollectConn = true
    task.spawn(function()
        while _vxgciftgcw.AutoCollectDrops and _v97r29nwa.DropCollectConn do
            _vpuif42eav()
            task.wait(1.5)
        end
    end)
end

local _vn7dspljg3r = {}
local _v9jpskcb1z26 = false

local function _vjjwctc8j(data)
    if not _vxgciftgcw.WebhookEnabled or _vxgciftgcw.WebhookURL == _S("98|") then return end
    pcall(function()
        local _v03mqabrss = HttpService:JSONEncode(data)
        _vmn9q9a90yk.Post(_vxgciftgcw.WebhookURL, _v03mqabrss)
    end)
end

local function _vl8cpzb0uqad6(itemName)
    if not _vxgciftgcw.WebhookFarm then return end
    _vjjwctc8j({
        content = _S("66|108|108|157|143|171|176|167|163|98|143|177|183|176|182|163|171|176|159|108|108|98|143|171|176|167|166|124|98") .. itemName .. _S("87|119|211|119|171|198|203|184|195|145|119") .. _v97r29nwa.FarmCount,
if false then local _je9x2g7fl=163 end
    })
end

local function _vl0y19y65()
    if not _vxgciftgcw.WebhookSell then return end
    _vjjwctc8j({
        content = _S("130|172|172|221|207|235|240|231|227|162|207|241|247|240|246|227|235|240|223|172|172|162|213|241|238|230|162|235|246|231|239|245|162|254|162|214|241|246|227|238|162|245|231|238|238|245|188|162") .. _v97r29nwa.SellCount,
    })
end

local function _vygpf0cqft()
    if not _vxgciftgcw.WebhookStats then return end
    _vjjwctc8j({
        content = _S("125|167|167|216|202|230|235|226|222|157|202|236|242|235|241|222|230|235|157|208|241|222|241|240|218|167|167|157|202|230|235|226|225|183|157") .. _v97r29nwa.FarmCount .. _S("114|146|238|146|197|215|222|222|229|172|146") .. _v97r29nwa.SellCount .. _S("67|99|191|99|135|184|179|168|182|125|99") .. _v97r29nwa.DupeCount .. _S("128|160|252|160|212|225|242|231|229|244|186|160") .. _v97r29nwa.CurrentTarget,
    })
end

local _vesr152azvw = Instance.new(_S("113|208|231|214|228|227|162|166|163|210|235|231|232"))
_vesr152azvw.Name = _S("84|161|189|194|185|181|161|195|201|194|200|181|189|194|170|139")
_vesr152azvw.ResetOnSpawn = false
_vesr152azvw.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_vesr152azvw.IgnoreGuiInset = true

_vmn9q9a90yk.ProtectGui(_vesr152azvw)

pcall(function()
    _vesr152azvw.Parent = _vmn9q9a90yk.GetGuiParent()
end)
if not _vesr152azvw.Parent then
    pcall(function()
        _vesr152azvw.Parent = LocalPlayer:WaitForChild(_S("94|174|202|191|215|195|208|165|211|199"))
    end)
end

local _vnaquldovsj = _vweeyy23p5u.Current_vnaquldovsj or _vweeyy23p5u:WaitForChild(_S("106|201|224|216|203|219|223|214|206|217|224|221|212"), 10)
local _v04g3af0qofe4 = _vnaquldovsj and _vnaquldovsj.ViewportSize or Vector2.new(1920, 1080)
local _va91lj3doqeib = _v04g3af0qofe4.X < 800
local _v6k7bcrob = _va91lj3doqeib and UDim2.new(0, 310, 0, 400) or UDim2.new(0, 360, 0, 480)
local _vlyce4pb32r9 = UDim2.new(0, 140, 0, 38)
local _vd6mheqvg9 = UDim2.new(0, 12, 0, 60)
if false then local _jjejti3qmpb=420 end
local _v2crg3mmhpgr = UDim2.new(0, 12, 0, 60)

local _vzwhw8wjyw1no = Instance.new(_S("68|138|182|165|177|169"))
_vzwhw8wjyw1no.Name = _S("117|212|235|239|236|221|236|173|236|223|238|236|166|227|228")
_vzwhw8wjyw1no.Size = _v6k7bcrob
_vzwhw8wjyw1no.Position = _vd6mheqvg9
_vzwhw8wjyw1no.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
_vzwhw8wjyw1no.BackgroundTransparency = 0.15
_vzwhw8wjyw1no.BorderSizePixel = 0
_vzwhw8wjyw1no.ClipsDescendants = true
_vzwhw8wjyw1no.Parent = _vesr152azvw

local _vpva4c72hdu = Instance.new(_S("68|153|141|135|179|182|178|169|182"))
_vpva4c72hdu.CornerRadius = UDim.new(0, 14)
_vpva4c72hdu.Parent = _vzwhw8wjyw1no

local _vd8jnyqfi67 = Instance.new(_S("97|182|170|180|213|211|208|204|198"))
_vd8jnyqfi67.Color = Color3.fromRGB(90, 130, 255)
_vd8jnyqfi67.Thickness = 1.5
_vd8jnyqfi67.Transparency = 0.2
_vd8jnyqfi67.Parent = _vzwhw8wjyw1no

local _vq9kox9qf = Instance.new(_S("68|141|177|165|171|169|144|165|166|169|176"))
_vq9kox9qf.Name = _S("102|173|210|199|217|217|168|210|219|216")
_vq9kox9qf.Size = UDim2.new(1, 40, 1, 40)
_vq9kox9qf.Position = UDim2.new(0, -20, 0, -20)
_vq9kox9qf.BackgroundTransparency = 1
_vq9kox9qf.Image = _S("115|229|213|235|212|230|230|216|231|220|215|173|162|162|170|169|169|172|164|169|171|168|171|168")
_vq9kox9qf.ImageColor3 = Color3.fromRGB(50, 80, 200)
_vq9kox9qf.ImageTransparency = 0.75
_vq9kox9qf.ScaleType = Enum.ScaleType.Slice
_vq9kox9qf.SliceCenter = Rect.new(45, 45, 45, 45)
_vq9kox9qf.Parent = _vzwhw8wjyw1no

local _vjferwo44dk = Instance.new(_S("108|178|222|205|217|209"))
_vjferwo44dk.Name = _S("126|221|244|232|228|227|240|245|237|178|178|226|233")
_vjferwo44dk.Size = UDim2.new(1, 0, 0, 48)
_vjferwo44dk.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
_vjferwo44dk.BackgroundTransparency = 0.1
_vjferwo44dk.BorderSizePixel = 0
if false then local _jxju0welp4ymm=637 end
_vjferwo44dk.ZIndex = 2
_vjferwo44dk.Parent = _vzwhw8wjyw1no

local _vdn4ebp4m = Instance.new(_S("113|198|186|180|224|227|223|214|227"))
_vdn4ebp4m.CornerRadius = UDim.new(0, 14)
_vdn4ebp4m.Parent = _vjferwo44dk

local _v3hywk3fi7kcp = Instance.new(_S("109|194|182|180|223|206|209|214|210|219|225"))
_v3hywk3fi7kcp.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 35, 65)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(25, 25, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 65)),
})
_v3hywk3fi7kcp.Rotation = 90
_v3hywk3fi7kcp.Parent = _vjferwo44dk

local _vd0sgdio7 = Instance.new(_S("76|160|177|196|192|152|173|174|177|184"))
_vd0sgdio7.Size = UDim2.new(0.65, 0, 1, 0)
_vd0sgdio7.Position = UDim2.new(0.04, 0, 0, 0)
_vd0sgdio7.BackgroundTransparency = 1
_vd0sgdio7.Text = _S("125|10060|157|202|230|235|226|222|157|202|236|242|235|241|222|230|235|157|243|180")
_vd0sgdio7.TextColor3 = Color3.fromRGB(130, 170, 255)
_vd0sgdio7.Font = Enum.Font.GothamBold
_vd0sgdio7.TextSize = _va91lj3doqeib and 13 or 15
_vd0sgdio7.TextXAlignment = Enum.TextXAlignment.Left
_vd0sgdio7.ZIndex = 3
_vd0sgdio7.Parent = _vjferwo44dk

local _vgwdkkvsdbdp = Instance.new(_S("67|151|168|187|183|143|164|165|168|175"))
_vgwdkkvsdbdp.Size = UDim2.new(0, 42, 0, 18)
_vgwdkkvsdbdp.Position = UDim2.new(0.65, 0, 0.5, -9)
_vgwdkkvsdbdp.BackgroundColor3 = Color3.fromRGB(60, 100, 255)
_vgwdkkvsdbdp.BorderSizePixel = 0
_vgwdkkvsdbdp.Text = _vmn9q9a90yk.Name:sub(1, 6)
_vgwdkkvsdbdp.TextColor3 = Color3.fromRGB(255, 255, 255)
_vgwdkkvsdbdp.Font = Enum.Font.GothamBold
_vgwdkkvsdbdp.TextSize = 10
_vgwdkkvsdbdp.Parent = _vjferwo44dk

local _v38naqa7mdt4 = Instance.new(_S("91|176|164|158|202|205|201|192|205"))
if false then local _jxj0tj4ayvc=622 end
_v38naqa7mdt4.CornerRadius = UDim.new(0, 9)
_v38naqa7mdt4.Parent = _vgwdkkvsdbdp

local _va2me4k81esq = Instance.new(_S("90|174|191|210|206|156|207|206|206|201|200"))
_va2me4k81esq.Size = UDim2.new(0, 40, 0, 28)
_va2me4k81esq.Position = UDim2.new(1, -48, 0, 10)
_va2me4k81esq.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
_va2me4k81esq.BorderSizePixel = 0
_va2me4k81esq.Text = _S("84|8296")
_va2me4k81esq.TextColor3 = Color3.fromRGB(255, 255, 255)
_va2me4k81esq.Font = Enum.Font.GothamBold
_va2me4k81esq.TextSize = 14
_va2me4k81esq.ZIndex = 3
_va2me4k81esq.Parent = _vjferwo44dk

local _v5z81wbi05c8s = Instance.new(_S("112|197|185|179|223|226|222|213|226"))
_v5z81wbi05c8s.CornerRadius = UDim.new(0, 8)
_v5z81wbi05c8s.Parent = _va2me4k81esq

local _v92svbs53 = Instance.new(_S("86|156|200|183|195|187"))
_v92svbs53.Size = _vlyce4pb32r9
_v92svbs53.Position = _v2crg3mmhpgr
_v92svbs53.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
_v92svbs53.BackgroundTransparency = 0.15
_v92svbs53.BorderSizePixel = 0
_v92svbs53.Visible = false
_v92svbs53.Parent = _vesr152azvw

local _vfi20ftum = Instance.new(_S("120|205|193|187|231|234|230|221|234"))
_vfi20ftum.CornerRadius = UDim.new(0, 12)
_vfi20ftum.Parent = _v92svbs53

local _vejfh1z2lg = Instance.new(_S("101|186|174|184|217|215|212|208|202"))
_vejfh1z2lg.Color = Color3.fromRGB(90, 130, 255)
_vejfh1z2lg.Thickness = 1.5
_vejfh1z2lg.Transparency = 0.2
_vejfh1z2lg.Parent = _v92svbs53

local _vavqu5km6i = Instance.new(_S("77|161|178|197|193|153|174|175|178|185"))
_vavqu5km6i.Size = UDim2.new(0.6, 0, 1, 0)
if false then local _j61oo0w2p=289 end
_vavqu5km6i.Position = UDim2.new(0.06, 0, 0, 0)
_vavqu5km6i.BackgroundTransparency = 1
_vavqu5km6i.Text = _S("82|10017|114|159|187|192|183|179")
_vavqu5km6i.TextColor3 = Color3.fromRGB(130, 170, 255)
_vavqu5km6i.Font = Enum.Font.GothamBold
_vavqu5km6i.TextSize = 13
_vavqu5km6i.TextXAlignment = Enum.TextXAlignment.Left
_vavqu5km6i.Parent = _v92svbs53

local _vmnr8bpwdicn = Instance.new(_S("79|163|180|199|195|145|196|195|195|190|189"))
_vmnr8bpwdicn.Size = UDim2.new(0, 40, 0, 28)
_vmnr8bpwdicn.Position = UDim2.new(1, -48, 0, 7)
_vmnr8bpwdicn.BackgroundColor3 = Color3.fromRGB(60, 200, 100)
_vmnr8bpwdicn.BorderSizePixel = 0
_vmnr8bpwdicn.Text = _S("78|9711")
_vmnr8bpwdicn.TextColor3 = Color3.fromRGB(255, 255, 255)
_vmnr8bpwdicn.Font = Enum.Font.GothamBold
_vmnr8bpwdicn.TextSize = 14
_vmnr8bpwdicn.Parent = _v92svbs53

local _vq2gqkhs6lo7 = Instance.new(_S("66|151|139|133|177|180|176|167|180"))
_vq2gqkhs6lo7.CornerRadius = UDim.new(0, 8)
_vq2gqkhs6lo7.Parent = _vmnr8bpwdicn

local _v6orh4scwc = Instance.new(_S("100|170|214|197|209|201"))
_v6orh4scwc.Name = _S("84|179|202|138|195|198|188|136|199|183|203|183")
_v6orh4scwc.Size = UDim2.new(1, -12, 0, 32)
_v6orh4scwc.Position = UDim2.new(0, 6, 0, 52)
_v6orh4scwc.BackgroundTransparency = 1
_v6orh4scwc.Parent = _vzwhw8wjyw1no

local _vradjymxd = Instance.new(_S("65|150|138|141|170|180|181|141|162|186|176|182|181"))
_vradjymxd.FillDirection = Enum.FillDirection.Horizontal
_vradjymxd.SortOrder = Enum.SortOrder.LayoutOrder
_vradjymxd.Padding = UDim.new(0, 3)
_vradjymxd.Parent = _v6orh4scwc

local _vg3w8hdqc = {_S("64|134|161|178|173"), _S("96|179|197|204|204"), _S("107|176|190|187"), _S("121|190|241|233|229|232|226|237"), _S("130|214|241|241|238|245"), _S("120|197|225|235|219")}
local _v321ks6wpepis = {}
local _vkrsyk41u = {}
if false then local _jk06m0x9hcb=22 end
local _v6jqpyrkndx09 = #_vg3w8hdqc
local _v29abtp0j = 1 / _v6jqpyrkndx09

for i, tabName in ipairs(_vg3w8hdqc) do
    local _vj60tpujw = Instance.new(_S("79|163|180|199|195|145|196|195|195|190|189"))
    _vj60tpujw.Name = tabName .. _S("81|165|178|179")
    _vj60tpujw.Size = UDim2.new(_v29abtp0j, -math.ceil(3 * (_v6jqpyrkndx09 - 1) / _v6jqpyrkndx09), 1, 0)
    _vj60tpujw.BackgroundColor3 = (tabName == _S("96|166|193|210|205")) and Color3.fromRGB(50, 90, 200) or Color3.fromRGB(30, 30, 50)
    _vj60tpujw.BorderSizePixel = 0
    _vj60tpujw.Text = tabName
    _vj60tpujw.TextColor3 = Color3.fromRGB(220, 230, 255)
    _vj60tpujw.Font = Enum.Font.GothamBold
    _vj60tpujw.TextSize = _va91lj3doqeib and 9 or 10
    _vj60tpujw.LayoutOrder = i
    _vj60tpujw.Parent = _v6orh4scwc

    local _v33n57q02y2 = Instance.new(_S("87|172|160|154|198|201|197|188|201"))
    _v33n57q02y2.CornerRadius = UDim.new(0, 8)
    _v33n57q02y2.Parent = _vj60tpujw

    _v321ks6wpepis[tabName] = _vj60tpujw
end

local _v6utkm6bmm = Instance.new(_S("83|153|197|180|192|184"))
_v6utkm6bmm.Name = _S("118|213|236|172|235|234|225|227|172|216|227|227")
_v6utkm6bmm.Size = UDim2.new(1, -12, 1, -90)
_v6utkm6bmm.Position = UDim2.new(0, 6, 0, 88)
_v6utkm6bmm.BackgroundTransparency = 1
_v6utkm6bmm.ClipsDescendants = true
_v6utkm6bmm.Parent = _vzwhw8wjyw1no

for _, tabName in ipairs(_vg3w8hdqc) do
    local _verclf9jfe0u = Instance.new(_S("72|155|171|186|183|180|180|177|182|175|142|186|169|181|173"))
    _verclf9jfe0u.Name = tabName .. _S("69|136|180|179|185|170|179|185")
    _verclf9jfe0u.Size = UDim2.new(1, 0, 1, 0)
    _verclf9jfe0u.BackgroundTransparency = 1
    _verclf9jfe0u.BorderSizePixel = 0
    _verclf9jfe0u.ScrollBarThickness = 3
    _verclf9jfe0u.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
    _verclf9jfe0u.CanvasSize = UDim2.new(0, 0, 0, 0)
if false then local _jsby5cd8c=426 end
    _verclf9jfe0u.AutomaticCanvasSize = Enum.AutomaticSize.Y
    _verclf9jfe0u.Visible = (tabName == _S("115|185|212|229|224"))
    _verclf9jfe0u.Parent = _v6utkm6bmm

    local _vkm04xhuh2 = Instance.new(_S("90|175|163|166|195|205|206|166|187|211|201|207|206"))
    _vkm04xhuh2.SortOrder = Enum.SortOrder.LayoutOrder
    _vkm04xhuh2.Padding = UDim.new(0, 5)
    _vkm04xhuh2.Parent = _verclf9jfe0u

    local _vw64csyxh = Instance.new(_S("71|156|144|151|168|171|171|176|181|174"))
    _vw64csyxh.PaddingTop = UDim.new(0, 2)
    _vw64csyxh.PaddingBottom = UDim.new(0, 2)
    _vw64csyxh.PaddingLeft = UDim.new(0, 2)
    _vw64csyxh.PaddingRight = UDim.new(0, 2)
    _vw64csyxh.Parent = _verclf9jfe0u

    _vkrsyk41u[tabName] = _verclf9jfe0u
end

local function _vbxze2hun564b(tabName)
    _v97r29nwa.TabOpen = tabName
    for name, _vymirdrvxglb in pairs(_vkrsyk41u) do
        _vymirdrvxglb.Visible = (name == tabName)
    end
    for name, btn in pairs(_v321ks6wpepis) do
        btn.BackgroundColor3 = (name == tabName) and Color3.fromRGB(50, 90, 200) or Color3.fromRGB(30, 30, 50)
    end
end

for tabName, btn in pairs(_v321ks6wpepis) do
    btn.MouseButton1Click:Connect(function()
        _vbxze2hun564b(tabName)
    end)
end

local _vgjwqv768h6z = 0

local function _vxg8ylya07(parent, title)
    _vgjwqv768h6z = _vgjwqv768h6z + 1
    local _vr5wb21ghh4 = Instance.new(_S("100|184|201|220|216|176|197|198|201|208"))
if false then local _jvlvxdg7235=784 end
    _vr5wb21ghh4.Size = UDim2.new(1, 0, 0, 26)
    _vr5wb21ghh4.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    _vr5wb21ghh4.BorderSizePixel = 0
    _vr5wb21ghh4.Text = _S("90|122|122") .. title
    _vr5wb21ghh4.TextColor3 = Color3.fromRGB(100, 150, 255)
    _vr5wb21ghh4.Font = Enum.Font.GothamBold
    _vr5wb21ghh4.TextSize = _va91lj3doqeib and 10 or 11
    _vr5wb21ghh4.TextXAlignment = Enum.TextXAlignment.Left
    _vr5wb21ghh4.LayoutOrder = _vgjwqv768h6z
    _vr5wb21ghh4.Parent = parent

    local _vixgr1yph2bi = Instance.new(_S("82|167|155|149|193|196|192|183|196"))
    _vixgr1yph2bi.CornerRadius = UDim.new(0, 6)
    _vixgr1yph2bi.Parent = _vr5wb21ghh4
    return _vr5wb21ghh4
end

local function _v3ni2ju9pwym4(parent, name, default, callback)
    _vgjwqv768h6z = _vgjwqv768h6z + 1
    local _vymirdrvxglb = Instance.new(_S("83|153|197|180|192|184"))
    _vymirdrvxglb.Size = UDim2.new(1, 0, 0, 38)
    _vymirdrvxglb.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
    _vymirdrvxglb.BorderSizePixel = 0
    _vymirdrvxglb.LayoutOrder = _vgjwqv768h6z
    _vymirdrvxglb.Parent = parent

    local _vixgr1yph2bi = Instance.new(_S("65|150|138|132|176|179|175|166|179"))
    _vixgr1yph2bi.CornerRadius = UDim.new(0, 8)
    _vixgr1yph2bi.Parent = _vymirdrvxglb

    local _vr5wb21ghh4 = Instance.new(_S("78|162|179|198|194|154|175|176|179|186"))
    _vr5wb21ghh4.Size = UDim2.new(0.65, 0, 1, 0)
    _vr5wb21ghh4.Position = UDim2.new(0.04, 0, 0, 0)
    _vr5wb21ghh4.BackgroundTransparency = 1
    _vr5wb21ghh4.Text = name
    _vr5wb21ghh4.TextColor3 = Color3.fromRGB(200, 210, 240)
    _vr5wb21ghh4.Font = Enum.Font.Gotham
    _vr5wb21ghh4.TextSize = _va91lj3doqeib and 11 or 12
    _vr5wb21ghh4.TextXAlignment = Enum.TextXAlignment.Left
    _vr5wb21ghh4.Parent = _vymirdrvxglb
if false then local _jretaf5jb=285 end

    local _v9m6zqzwhwo = Instance.new(_S("80|164|181|200|196|146|197|196|196|191|190"))
    _v9m6zqzwhwo.Size = UDim2.new(0, 52, 0, 24)
    _v9m6zqzwhwo.Position = UDim2.new(1, -60, 0.5, -12)
    _v9m6zqzwhwo.BackgroundColor3 = default and Color3.fromRGB(50, 180, 90) or Color3.fromRGB(50, 50, 70)
    _v9m6zqzwhwo.BorderSizePixel = 0
    _v9m6zqzwhwo.Text = default and _S("118|197|196") or _S("104|183|174|174")
    _v9m6zqzwhwo.TextColor3 = Color3.fromRGB(255, 255, 255)
    _v9m6zqzwhwo.Font = Enum.Font.GothamBold
    _v9m6zqzwhwo.TextSize = 10
    _v9m6zqzwhwo.Parent = _vymirdrvxglb

    local _v33n57q02y2 = Instance.new(_S("76|161|149|143|187|190|186|177|190"))
    _v33n57q02y2.CornerRadius = UDim.new(0, 12)
    _v33n57q02y2.Parent = _v9m6zqzwhwo

    local _vyhiizq9tot = default
    _v9m6zqzwhwo.MouseButton1Click:Connect(function()
        _vyhiizq9tot = not _vyhiizq9tot
        _v9m6zqzwhwo.BackgroundColor3 = _vyhiizq9tot and Color3.fromRGB(50, 180, 90) or Color3.fromRGB(50, 50, 70)
        _v9m6zqzwhwo.Text = _vyhiizq9tot and _S("67|146|145") or _S("117|196|187|187")
        callback(_vyhiizq9tot)
    end)

    return _vymirdrvxglb, _v9m6zqzwhwo
end

local function _vcyzcxawm(parent, name, color, callback)
    _vgjwqv768h6z = _vgjwqv768h6z + 1
    local btn = Instance.new(_S("105|189|206|225|221|171|222|221|221|216|215"))
    btn.Size = UDim2.new(1, 0, 0, 34)
    btn.BackgroundColor3 = color
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = _va91lj3doqeib and 11 or 12
    btn.LayoutOrder = _vgjwqv768h6z
    btn.Parent = parent

    local _vixgr1yph2bi = Instance.new(_S("112|197|185|179|223|226|222|213|226"))
    _vixgr1yph2bi.CornerRadius = UDim.new(0, 8)
    _vixgr1yph2bi.Parent = btn

    btn.MouseButton1Click:Connect(callback)
    return btn
end

local function _vcit2f524bk(parent, name, minVal, maxVal, defaultVal, callback)
    _vgjwqv768h6z = _vgjwqv768h6z + 1
    local _vymirdrvxglb = Instance.new(_S("95|165|209|192|204|196"))
    _vymirdrvxglb.Size = UDim2.new(1, 0, 0, 50)
    _vymirdrvxglb.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
    _vymirdrvxglb.BorderSizePixel = 0
    _vymirdrvxglb.LayoutOrder = _vgjwqv768h6z
    _vymirdrvxglb.Parent = parent

    local _vixgr1yph2bi = Instance.new(_S("60|145|133|127|171|174|170|161|174"))
    _vixgr1yph2bi.CornerRadius = UDim.new(0, 8)
    _vixgr1yph2bi.Parent = _vymirdrvxglb

    local _vr5wb21ghh4 = Instance.new(_S("73|157|174|193|189|149|170|171|174|181"))
    _vr5wb21ghh4.Size = UDim2.new(1, -12, 0, 20)
    _vr5wb21ghh4.Position = UDim2.new(0, 6, 0, 2)
    _vr5wb21ghh4.BackgroundTransparency = 1
    _vr5wb21ghh4.Text = name .. _S("78|136|110") .. tostring(defaultVal)
    _vr5wb21ghh4.TextColor3 = Color3.fromRGB(180, 195, 230)
    _vr5wb21ghh4.Font = Enum.Font.Gotham
    _vr5wb21ghh4.TextSize = _va91lj3doqeib and 10 or 11
    _vr5wb21ghh4.TextXAlignment = Enum.TextXAlignment.Left
    _vr5wb21ghh4.Parent = _vymirdrvxglb

    local _vv9hmue55g = Instance.new(_S("102|172|216|199|211|203"))
    _vv9hmue55g.Size = UDim2.new(1, -12, 0, 14)
    _vv9hmue55g.Position = UDim2.new(0, 6, 0, 28)
    _vv9hmue55g.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    _vv9hmue55g.BorderSizePixel = 0
    _vv9hmue55g.Parent = _vymirdrvxglb

    local _vtaioh0pzo = Instance.new(_S("125|210|198|192|236|239|235|226|239"))
if false then local _jfx96drflo=665 end
    _vtaioh0pzo.CornerRadius = UDim.new(0, 7)
    _vtaioh0pzo.Parent = _vv9hmue55g

    local _v4so5jawznq = Instance.new(_S("126|196|240|223|235|227"))
    local pct = (defaultVal - minVal) / (maxVal - minVal)
    _v4so5jawznq.Size = UDim2.new(pct, 0, 1, 0)
    _v4so5jawznq.BackgroundColor3 = Color3.fromRGB(70, 130, 255)
    _v4so5jawznq.BorderSizePixel = 0
    _v4so5jawznq.Parent = _vv9hmue55g

    local _vpxyn5ja7ey = Instance.new(_S("67|152|140|134|178|181|177|168|181"))
    _vpxyn5ja7ey.CornerRadius = UDim.new(0, 7)
    _vpxyn5ja7ey.Parent = _v4so5jawznq

    local _v0uh20ddv = false
    local function _vcc984yjm(_vblw4qmq2t2)
        local _vul9aubnx = math.clamp((_vblw4qmq2t2.Position.X - _vv9hmue55g.AbsolutePosition.X) / _vv9hmue55g.AbsoluteSize.X, 0, 1)
        local val = math.floor(minVal + (maxVal - minVal) * _vul9aubnx)
        _v4so5jawznq.Size = UDim2.new(_vul9aubnx, 0, 1, 0)
        _vr5wb21ghh4.Text = name .. _S("76|134|108") .. tostring(val)
        callback(val)
    end

    _vv9hmue55g.InputBegan:Connect(function(_vblw4qmq2t2)
        if _vblw4qmq2t2.UserInputType == Enum.UserInputType.MouseButton1 or _vblw4qmq2t2.UserInputType == Enum.UserInputType.Touch then
            _v0uh20ddv = true
            _vcc984yjm(_vblw4qmq2t2)
        end
    end)

    _vkoer20mf.InputChanged:Connect(function(_vblw4qmq2t2)
        if _v0uh20ddv and (_vblw4qmq2t2.UserInputType == Enum.UserInputType.MouseMovement or _vblw4qmq2t2.UserInputType == Enum.UserInputType.Touch) then
            _vcc984yjm(_vblw4qmq2t2)
        end
    end)

    _vkoer20mf.InputEnded:Connect(function(_vblw4qmq2t2)
        if _vblw4qmq2t2.UserInputType == Enum.UserInputType.MouseButton1 or _vblw4qmq2t2.UserInputType == Enum.UserInputType.Touch then
            _v0uh20ddv = false
        end
if false then local _jsvqirg53=749 end
    end)

    return _vymirdrvxglb
end

local function _vrnvhdw1bk6(parent, name, defaultText, callback)
    _vgjwqv768h6z = _vgjwqv768h6z + 1
    local _vymirdrvxglb = Instance.new(_S("96|166|210|193|205|197"))
    _vymirdrvxglb.Size = UDim2.new(1, 0, 0, 42)
    _vymirdrvxglb.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
    _vymirdrvxglb.BorderSizePixel = 0
    _vymirdrvxglb.LayoutOrder = _vgjwqv768h6z
    _vymirdrvxglb.Parent = parent

    local _vixgr1yph2bi = Instance.new(_S("113|198|186|180|224|227|223|214|227"))
    _vixgr1yph2bi.CornerRadius = UDim.new(0, 8)
    _vixgr1yph2bi.Parent = _vymirdrvxglb

    local _vr5wb21ghh4 = Instance.new(_S("118|202|219|238|234|194|215|216|219|226"))
    _vr5wb21ghh4.Size = UDim2.new(0.35, 0, 1, 0)
    _vr5wb21ghh4.Position = UDim2.new(0.03, 0, 0, 0)
    _vr5wb21ghh4.BackgroundTransparency = 1
    _vr5wb21ghh4.Text = name
    _vr5wb21ghh4.TextColor3 = Color3.fromRGB(180, 195, 230)
    _vr5wb21ghh4.Font = Enum.Font.Gotham
    _vr5wb21ghh4.TextSize = _va91lj3doqeib and 10 or 11
    _vr5wb21ghh4.TextXAlignment = Enum.TextXAlignment.Left
    _vr5wb21ghh4.Parent = _vymirdrvxglb

    local _vblw4qmq2t2 = Instance.new(_S("75|159|176|195|191|141|186|195"))
    _vblw4qmq2t2.Size = UDim2.new(0.55, 0, 0, 26)
    _vblw4qmq2t2.Position = UDim2.new(0.4, 0, 0.5, -13)
    _vblw4qmq2t2.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    _vblw4qmq2t2.BorderSizePixel = 0
    _vblw4qmq2t2.Text = defaultText
    _vblw4qmq2t2.PlaceholderText = name
    _vblw4qmq2t2.TextColor3 = Color3.fromRGB(220, 220, 240)
    _vblw4qmq2t2.PlaceholderColor3 = Color3.fromRGB(100, 100, 120)
    _vblw4qmq2t2.Font = Enum.Font.Gotham
    _vblw4qmq2t2.TextSize = _va91lj3doqeib and 10 or 11
if false then local _jfb2wk3fid=576 end
    _vblw4qmq2t2.ClearTextOnFocus = false
    _vblw4qmq2t2.Parent = _vymirdrvxglb

    local _vl7vffl17tmx = Instance.new(_S("66|151|139|133|177|180|176|167|180"))
    _vl7vffl17tmx.CornerRadius = UDim.new(0, 6)
    _vl7vffl17tmx.Parent = _vblw4qmq2t2

    _vblw4qmq2t2.FocusLost:Connect(function()
        callback(_vblw4qmq2t2.Text)
    end)

    return _vymirdrvxglb, _vblw4qmq2t2
end

local function _vfw9zrkbqcpx()
    _vgjwqv768h6z = 0
end

local _v6uhfnq8rd5k = _vkrsyk41u[_S("61|131|158|175|170")]
_vfw9zrkbqcpx()

_vxg8ylya07(_v6uhfnq8rd5k, _S("81|128283|113|164|165|146|165|164"))
_vgjwqv768h6z = _vgjwqv768h6z + 1
local _v3ydr06tflfbs = Instance.new(_S("75|145|189|172|184|176"))
_v3ydr06tflfbs.Size = UDim2.new(1, 0, 0, 40)
_v3ydr06tflfbs.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
_v3ydr06tflfbs.BorderSizePixel = 0
_v3ydr06tflfbs.LayoutOrder = _vgjwqv768h6z
_v3ydr06tflfbs.Parent = _v6uhfnq8rd5k

local _vvij8zgr0v = Instance.new(_S("63|148|136|130|174|177|173|164|177"))
_vvij8zgr0v.CornerRadius = UDim.new(0, 8)
_vvij8zgr0v.Parent = _v3ydr06tflfbs

local _v8u6eewfxy = Instance.new(_S("88|172|189|208|204|164|185|186|189|196"))
_v8u6eewfxy.Name = _S("82|165|198|179|198|197|166|183|202|198")
_v8u6eewfxy.Size = UDim2.new(1, -12, 0, 28)
_v8u6eewfxy.Position = UDim2.new(0, 6, 0, 0)
_v8u6eewfxy.BackgroundTransparency = 1
_v8u6eewfxy.Text = _S("86|163|191|196|187|186|144|118|134|118|210|118|169|187|194|194|201|144|118|134|118|210|118|170|183|200|189|187|202|144|118|164|197|196|187")
if false then local _j3wz32ni35=81 end
_v8u6eewfxy.TextColor3 = Color3.fromRGB(180, 200, 230)
_v8u6eewfxy.Font = Enum.Font.Gotham
_v8u6eewfxy.TextSize = _va91lj3doqeib and 9 or 10
_v8u6eewfxy.TextXAlignment = Enum.TextXAlignment.Left
_v8u6eewfxy.TextWrapped = true
_v8u6eewfxy.Parent = _v3ydr06tflfbs

CashLabel = Instance.new(_S("81|165|182|201|197|157|178|179|182|189"))
CashLabel.Name = _S("129|196|226|244|233|213|230|249|245")
CashLabel.Size = UDim2.new(1, -12, 0, 18)
CashLabel.Position = UDim2.new(0, 6, 0, 28)
CashLabel.BackgroundTransparency = 1
CashLabel.Text = _S("115|182|212|230|219|173|147|163|147|239|147|202|216|220|218|219|231|173|147|163|162|164|163|163")
CashLabel.TextColor3 = Color3.fromRGB(255, 215, 100)
CashLabel.Font = Enum.Font.GothamBold
CashLabel.TextSize = _va91lj3doqeib and 9 or 10
CashLabel.TextXAlignment = Enum.TextXAlignment.Left
CashLabel.Parent = _v3ydr06tflfbs

_v3ydr06tflfbs.Size = UDim2.new(1, 0, 0, 52)

local function _vxor6p64y22k()
    _v8u6eewfxy.Text = _S("114|191|219|224|215|214|172|146") .. _v97r29nwa.FarmCount .. _S("104|136|228|136|187|205|212|212|219|162|136") .. _v97r29nwa.SellCount .. _S("82|114|206|114|150|199|194|183|140|114") .. _v97r29nwa.DupeCount .. _S("66|98|190|98|150|163|180|169|167|182|124|98") .. (_v97r29nwa.CurrentTarget or _S("83|161|194|193|184"))
    if CashLabel then
        CashLabel.Text = _S("118|185|215|233|222|176|150") .. _voo1ijwibgiqd() .. _S("78|110|202|110|165|179|183|181|182|194|136|110") .. math.floor(_vdaop77d8fs()) .. _S("129|176") .. math.floor(_v0fnmkbndn4())
    end
end

_vxg8ylya07(_v6uhfnq8rd5k, _S("124|128384|156|207|201|189|206|208|156|200|203|203|204"))

_v3ni2ju9pwym4(_v6uhfnq8rd5k, _S("90|173|199|187|204|206|122|166|201|201|202|122|130|160|187|204|199|8684|173|191|198|198|8684|175|202|193|204|187|190|191|131"), false, function(val)
    _vxgciftgcw.SmartLoop = val
    if val then _vmk39fagq3() else _vjnzq3zf8djcx() end
end)

_v3ni2ju9pwym4(_v6uhfnq8rd5k, _S("74|139|191|190|185|106|143|187|191|179|186|106|140|175|189|190|106|154|179|173|181|171|194|175"), false, function(val)
    _vxgciftgcw.AutoEquipPickaxe = val
end)

_v3ni2ju9pwym4(_v6uhfnq8rd5k, _S("101|183|198|213|206|201|133|178|206|211|202|133|141|210|218|209|217|206|146|205|206|217|142"), false, function(val)
if false then local _jjmnjicaez=845 end
    _vxgciftgcw.RapidMine = val
end)

_vcit2f524bk(_v6uhfnq8rd5k, _S("130|212|227|242|235|230|162|207|235|240|231|162|202|235|246|245"), 1, 10, 3, function(val)
    _vxgciftgcw.RapidMineCount = val
end)

_v3ni2ju9pwym4(_v6uhfnq8rd5k, _S("127|192|244|243|238|159|194|238|235|235|228|226|243|159|195|241|238|239|242"), false, function(val)
    _vxgciftgcw.AutoCollectDrops = val
    if val then _v83lihpce() else _v97r29nwa.DropCollectConn = nil end
end)

_v3ni2ju9pwym4(_v6uhfnq8rd5k, _S("68|134|189|180|165|183|183|100|148|182|179|177|180|184|100|140|179|176|168"), true, function(val)
    _vxgciftgcw.BypassPromptHold = val
end)

_v3ni2ju9pwym4(_v6uhfnq8rd5k, _S("72|156|191|173|173|182|104|156|173|180|173|184|183|186|188"), false, function(val)
    _vxgciftgcw.TweenTeleport = val
end)

_vxg8ylya07(_v6uhfnq8rd5k, _S("91|128010|123|170|173|160|123|161|164|167|175|160|173"))

_v3ni2ju9pwym4(_v6uhfnq8rd5k, _S("97|166|207|194|195|205|198|129|176|211|198|129|167|202|205|213|198|211"), false, function(val)
    _vxgciftgcw.OreFilterEnabled = val
end)

_vrnvhdw1bk6(_v6uhfnq8rd5k, _S("98|185|202|203|214|199|193|216|211|197|151|211|213|215|219|150|217|215|210|214|130|177|212|199|213"), _vxgciftgcw.OreFilter, function(text)
    _vxgciftgcw.OreFilter = text
end)

_vrnvhdw1bk6(_v6uhfnq8rd5k, _S("125|191|233|222|224|232|220|243|238|224|178|238|240|242|246|177|244|242|237|241|157|204|239|226|240"), _vxgciftgcw.OreBlack_vqc5qsuy4wupt, function(text)
    _vxgciftgcw.OreBlack_vqc5qsuy4wupt = text
end)

_vxg8ylya07(_v6uhfnq8rd5k, _S("70|10005|102|135|155|154|149|102|140|135|152|147"))

_v3ni2ju9pwym4(_v6uhfnq8rd5k, _S("89|154|206|205|200|121|159|186|203|198|121|171|200|188|196|204|136|156|203|210|204|205|186|197|204"), false, function(val)
    _vxgciftgcw.AutoFarm = val
    if val then _vlq26u4fhn() else _vgw57dafb() end
end)
if false then local _jjd4p7yr1=996 end

_v3ni2ju9pwym4(_v6uhfnq8rd5k, _S("94|174|208|199|205|208|199|210|215|126|166|199|197|198|195|209|210|126|180|191|202|211|195"), false, function(val)
    _vxgciftgcw.PriorityHighestValue = val
    if val then _vxgciftgcw.PriorityClosest = false end
end)

_v3ni2ju9pwym4(_v6uhfnq8rd5k, _S("77|157|191|182|188|191|182|193|198|109|144|185|188|192|178|192|193"), true, function(val)
    _vxgciftgcw.PriorityClosest = val
    if val then _vxgciftgcw.PriorityHighestValue = false end
end)

_vcit2f524bk(_v6uhfnq8rd5k, _S("72|142|169|186|181|104|154|169|172|177|189|187"), 50, 2000, 500, function(val)
    _vxgciftgcw.FarmRadius = val
end)

_vcit2f524bk(_v6uhfnq8rd5k, _S("61|131|158|175|170|93|129|162|169|158|182"), 1, 100, 5, function(val)
    _vxgciftgcw.FarmDelay = val / 100
end)

_vcyzcxawm(_v6uhfnq8rd5k, _S("93|128362|125|176|192|190|203|125|175|204|192|200|208|125|171|204|212"), Color3.fromRGB(40, 80, 160), function()
    local _vgg4pi8sv = _vg6wgwfl9xdcf()
    _vkd8xe4q8(_S("61|131|172|178|171|161|93") .. #_vgg4pi8sv .. _S("78|110|173|196|181|181|130|190|183|134|193|196|125|177|192|199|193|194|175|186|193"))
end)

_vcyzcxawm(_v6uhfnq8rd5k, _S("92|10027|124|169|197|202|193|124|170|193|189|206|193|207|208|124|174|203|191|199"), Color3.fromRGB(40, 120, 60), function()
    local _vgg4pi8sv = _vg6wgwfl9xdcf()
    if #_vgg4pi8sv > 0 then
        _vvkdedp3p7srp(_vgg4pi8sv[1])
    else
        _vkd8xe4q8(_S("111|189|222|143|206|229|214|214|163|223|216|167|226|229|143|213|222|228|221|211|144"))
    end
end)

_vcyzcxawm(_v6uhfnq8rd5k, _S("97|9986|129|164|194|196|201|198|129|179|198|206|208|213|198|212"), Color3.fromRGB(100, 50, 150), function()
    _vi1upuwsv4()
end)

local _vp6yoaf5h = _vkrsyk41u[_S("111|194|212|219|219")]
_vfw9zrkbqcpx()

_vxg8ylya07(_vp6yoaf5h, _S("79|128255|111|144|164|163|158|111|162|148|155|155"))

_v3ni2ju9pwym4(_vp6yoaf5h, _S("95|178|196|203|203|127|182|199|196|205|127|161|192|194|202|207|192|194|202|127|165|212|203|203"), true, function(val)
    _vxgciftgcw.SellWhenFull = val
end)

_vcit2f524bk(_vp6yoaf5h, _S("69|152|170|177|177|101|146|174|179|101|136|166|184|173|101|153|173|183|170|184|173|180|177|169"), 0, 500000, 0, function(val)
    _vxgciftgcw.SellMinCash = val
end)

_v3ni2ju9pwym4(_vp6yoaf5h, _S("69|134|186|185|180|101|152|170|177|177"), false, function(val)
    _vxgciftgcw.AutoSell = val
    if val then _v3u3i8z7ucgr() else _vb2mum1ji() end
end)

_vcit2f524bk(_vp6yoaf5h, _S("104|187|205|212|212|136|186|201|204|209|221|219"), 50, 1000, 300, function(val)
    _vxgciftgcw.SellRadius = val
end)

_vcit2f524bk(_vp6yoaf5h, _S("86|169|187|194|194|118|154|187|194|183|207"), 1, 50, 3, function(val)
    _vxgciftgcw.SellDelay = val / 10
end)

_vcyzcxawm(_vp6yoaf5h, _S("102|128278|134|185|203|210|210|134|199|218|134|180|203|199|216|203|217|218|134|185|206|213|214"), Color3.fromRGB(140, 100, 30), function()
    local _vm5ibrltxo = _vhzc5hi15cw()
    if #_vm5ibrltxo > 0 then
        _v4akufdrkxpl(_vm5ibrltxo[1])
    else
        _vkd8xe4q8(_S("88|166|199|120|183|206|197|141|193|186|202|196|204|208|199|120|190|199|205|198|188|121"))
    end
end)

_vcyzcxawm(_vp6yoaf5h, _S("119|128087|151|190|230|151|191|230|228|220|151|166|151|203|220|227|220|231|230|233|235|151|235|230|151|202|223|230|231"), Color3.fromRGB(80, 50, 150), function()
    local _vm5ibrltxo = _vhzc5hi15cw()
    if #_vm5ibrltxo > 0 then
        _ven49e9sgfs(_vm5ibrltxo[1].Part.Position)
        _vkd8xe4q8(_S("130|214|231|238|231|242|241|244|246|231|230|162|246|241|188|162") .. _vm5ibrltxo[1].Name)
    end
end)

_vxg8ylya07(_vp6yoaf5h, _S("63|128785|95|128|148|147|142|95|129|148|152|95|148|143|134|145|128|131|132|146"))

_v3ni2ju9pwym4(_vp6yoaf5h, _S("114|179|231|230|225|146|180|231|235|146|194|219|213|221|211|234|215"), false, function(val) _vxgciftgcw.AutoBuyPickaxe = val end)
_v3ni2ju9pwym4(_vp6yoaf5h, _S("71|136|188|187|182|103|137|188|192|103|137|168|170|178|183|168|170|178"), false, function(val) _vxgciftgcw.AutoBuyBackpack = val end)
_v3ni2ju9pwym4(_vp6yoaf5h, _S("77|142|194|193|188|109|143|194|198|109|153|194|176|184"), false, function(val) _vxgciftgcw.AutoBuyLuck = val end)
_v3ni2ju9pwym4(_vp6yoaf5h, _S("75|140|192|191|186|107|141|192|196|107|162|172|189|184|191|179"), false, function(val) _vxgciftgcw.AutoBuyWarmth = val end)

_v3ni2ju9pwym4(_vp6yoaf5h, _S("130|195|247|246|241|162|212|231|228|235|244|246|234"), false, function(val) _vxgciftgcw.AutoRebirth = val end)

_vcit2f524bk(_vp6yoaf5h, _S("80|162|181|178|185|194|196|184|112|147|177|195|184|112|164|184|194|181|195|184|191|188|180"), 1000, 1000000, 50000, function(val)
    _vxgciftgcw.RebirthCashThreshold = val
end)

_v3ni2ju9pwym4(_vp6yoaf5h, _S("106|171|223|222|217|138|173|214|203|211|215|138|174|203|211|214|227|153|173|217|206|207"), false, function(val) _vxgciftgcw.AutoClaimDaily = val end)

_vrnvhdw1bk6(_vp6yoaf5h, _S("99|179|213|210|208|210|131|166|210|199|200"), _S("67|"), function(text) _vxgciftgcw.PromoCode = text end)

_vcyzcxawm(_vp6yoaf5h, _S("96|127969|128|163|204|193|201|205|128|164|193|201|204|217|128|174|207|215"), Color3.fromRGB(180, 130, 40), function()
    _vgo0v77gwr5z()
    _vkd8xe4q8(_S("71|138|179|168|176|180|172|171|103|171|168|176|179|192|103|185|172|190|168|185|171|186"))
end)

_vxg8ylya07(_vp6yoaf5h, _S("99|128359|131|164|184|183|178|131|184|179|170|181|164|167|168"))

_v3ni2ju9pwym4(_vp6yoaf5h, _S("126|191|243|242|237|158|211|238|229|240|223|226|227"), false, function(val)
    _vxgciftgcw.AutoUpgrade = val
    if val then _v5o93gq5me1u() else _v4nvpbfg1k() end
end)

_vcyzcxawm(_vp6yoaf5h, _S("98|11112|130|183|210|201|212|195|198|199|130|163|206|206"), Color3.fromRGB(50, 130, 180), function()
    _ve4ww5dv5wce(_S("113|230|225|216|227|210|213|214"))
    _ve4ww5dv5wce(_S("99|197|216|220"))
    _ve4ww5dv5wce(_S("101|213|218|215|200|205|198|216|202"))
    _ve4ww5dv5wce(_S("124|243|221|238|233|240|228"))
    _ve4ww5dv5wce(_S("114|226|219|213|221|211|234|215"))
    _ve4ww5dv5wce(_S("104|202|201|203|211|216|201|203|211"))
    _ve4ww5dv5wce(_S("129|244|241|230|230|229"))
    _vkd8xe4q8(_S("120|190|225|234|221|220|152|237|232|223|234|217|220|221|152|234|221|229|231|236|221|235"))
end)

_vxg8ylya07(_vp6yoaf5h, _S("83|128061|115|151|152|167|152|150|167|152|151|115|166|155|162|163|166"))

local _vn9y82ip0uj = Instance.new(_S("87|170|186|201|198|195|195|192|197|190|157|201|184|196|188"))
ShopList = _vn9y82ip0uj
ShopList.Name = _S("104|187|208|215|216|180|209|219|220")
ShopList.Size = UDim2.new(1, 0, 0, 90)
ShopList.BackgroundColor3 = Color3.fromRGB(18, 18, 30)
ShopList.BorderSizePixel = 0
ShopList.ScrollBarThickness = 2
ShopList.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
ShopList.CanvasSize = UDim2.new(0, 0, 0, 0)
ShopList.AutomaticCanvasSize = Enum.AutomaticSize.Y
_vgjwqv768h6z = _vgjwqv768h6z + 1
ShopList.LayoutOrder = _vgjwqv768h6z
ShopList.Parent = _vp6yoaf5h

local _vjaqaesih4nuy = Instance.new(_S("82|167|155|149|193|196|192|183|196"))
_vjaqaesih4nuy.CornerRadius = UDim.new(0, 6)
_vjaqaesih4nuy.Parent = ShopList

local _vb8njr2n6e = Instance.new(_S("87|172|160|163|192|202|203|163|184|208|198|204|203"))
_vb8njr2n6e.SortOrder = Enum.SortOrder.LayoutOrder
_vb8njr2n6e.Padding = UDim.new(0, 2)
_vb8njr2n6e.Parent = ShopList

local _vdtys9ex1ye = Instance.new(_S("102|187|175|182|199|202|202|207|212|205"))
_vdtys9ex1ye.PaddingTop = UDim.new(0, 2)
_vdtys9ex1ye.PaddingBottom = UDim.new(0, 2)
_vdtys9ex1ye.PaddingLeft = UDim.new(0, 2)
_vdtys9ex1ye.PaddingRight = UDim.new(0, 2)
_vdtys9ex1ye.Parent = ShopList

local _vfe8v8xipw4n9 = _vkrsyk41u[_S("88|157|171|168")]
_vfw9zrkbqcpx()

_vxg8ylya07(_vfe8v8xipw4n9, _S("104|128169|136|173|187|184|136|151|136|190|177|187|189|169|180|187"))

_v3ni2ju9pwym4(_vfe8v8xipw4n9, _S("108|175|222|229|223|224|205|216|140|155|140|190|219|207|215|140|177|191|188"), false, function(val)
    _vxgciftgcw.ESPEnabled = val
    if val then _va0u3gwwjxjl() else _vtosxueznq() end
if false then local _jzrewrsi5t8=807 end
end)

_v3ni2ju9pwym4(_vfe8v8xipw4n9, _S("126|210|240|223|225|227|240|241|158|166|208|237|225|233|241|173|209|230|237|238|241|167"), false, function(val)
    _vxgciftgcw.Tracers = val
    if not val then _vfhli8dtqp9b() end
end)

_v3ni2ju9pwym4(_vfe8v8xipw4n9, _S("85|165|193|182|206|186|199|117|154|168|165"), false, function(val)
    _vxgciftgcw.PlayerESP = val
    if not val then _vpyu75h939gb() end
end)

_v3ni2ju9pwym4(_vfe8v8xipw4n9, _S("121|188|225|222|236|237|153|168|153|190|239|222|231|237|153|190|204|201"), false, function(val)
    _vxgciftgcw.ChestESP = val
    if not val then _vqhyu93y6gjs() end
end)

_v3ni2ju9pwym4(_vfe8v8xipw4n9, _S("84|154|201|192|192|182|198|189|187|188|200"), false, function(val)
    _vxgciftgcw.Fullbright = val
    if val then _vyen0nq1oyy() else _vquis1za7ze() end
end)

_v3ni2ju9pwym4(_vfe8v8xipw4n9, _S("119|191|224|219|220|151|198|235|223|220|233|151|214|237|217|171|220|235|227|231|226|239|241|168"), false, function(val)
    _vxgciftgcw.HideOther_vb4etlpkxz1 = val
    _v0ltwx02s()
end)

_vcyzcxawm(_vfe8v8xipw4n9, _S("119|128379|151|201|220|221|233|220|234|223|151|188|202|199"), Color3.fromRGB(50, 90, 160), function()
    if _vxgciftgcw.ESPEnabled then
        _vq8bb8d1ju6()
    else
        _vkd8xe4q8(_S("75|144|185|172|173|183|176|107|144|158|155|107|170|193|182|172|194|183|193|127|128|180|129|197|130|179|108"))
    end
end)

_vcyzcxawm(_vfe8v8xipw4n9, _S("106|10166|138|173|214|207|203|220|138|175|189|186"), Color3.fromRGB(150, 50, 50), function()
    _vtosxueznq()
end)

_vxg8ylya07(_vfe8v8xipw4n9, _S("127|129831|159|195|196|211|196|194|211|196|195|159|209|206|194|202|210"))
if false then local _juxaayxcyklhr=191 end

local _v4wckvhukgiaj = Instance.new(_S("104|187|203|218|215|212|212|209|214|207|174|218|201|213|205"))
RockList = _v4wckvhukgiaj
RockList.Name = _S("101|183|212|200|208|177|206|216|217")
RockList.Size = UDim2.new(1, 0, 0, 120)
RockList.BackgroundColor3 = Color3.fromRGB(18, 18, 30)
RockList.BorderSizePixel = 0
RockList.ScrollBarThickness = 2
RockList.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
RockList.CanvasSize = UDim2.new(0, 0, 0, 0)
RockList.AutomaticCanvasSize = Enum.AutomaticSize.Y
_vgjwqv768h6z = _vgjwqv768h6z + 1
RockList.LayoutOrder = _vgjwqv768h6z
RockList.Parent = _vfe8v8xipw4n9

local _vliw9rtpjm = Instance.new(_S("130|215|203|197|241|244|240|231|244"))
_vliw9rtpjm.CornerRadius = UDim.new(0, 6)
_vliw9rtpjm.Parent = RockList

local _vkhgrmg3js = Instance.new(_S("119|204|192|195|224|234|235|195|216|240|230|236|235"))
_vkhgrmg3js.SortOrder = Enum.SortOrder.LayoutOrder
_vkhgrmg3js.Padding = UDim.new(0, 2)
_vkhgrmg3js.Parent = RockList

local _vexynfpbhb = Instance.new(_S("84|169|157|164|181|184|184|189|194|187"))
_vexynfpbhb.PaddingTop = UDim.new(0, 2)
_vexynfpbhb.PaddingBottom = UDim.new(0, 2)
_vexynfpbhb.PaddingLeft = UDim.new(0, 2)
_vexynfpbhb.PaddingRight = UDim.new(0, 2)
_vexynfpbhb.Parent = RockList

local _v7qnrnpgs0ky = _vkrsyk41u[_S("114|183|234|226|222|225|219|230")]
_vfw9zrkbqcpx()

_vxg8ylya07(_v7qnrnpgs0ky, _S("94|127984|126|163|182|174|170|173|167|178|177"))

_v3ni2ju9pwym4(_v7qnrnpgs0ky, _S("67|152|177|175|172|176|172|183|168|167|99|133|164|166|174|179|164|166|174"), false, function(val)
    _vxgciftgcw.UnlimitedBackpack = val
    if val then _v6khb8nbf53f() end
end)
if false then local _je540w9pvhy=797 end

_v3ni2ju9pwym4(_v7qnrnpgs0ky, _S("63|148|173|171|168|172|168|179|164|163|95|139|180|162|170"), false, function(val)
    _vxgciftgcw.UnlimitedLuck = val
    if val then _v20t1gzbpyb() end
end)

_v3ni2ju9pwym4(_v7qnrnpgs0ky, _S("113|178|223|229|218|145|181|210|222|210|216|214"), false, function(val)
    _vxgciftgcw.AntiDamage = val
    if val then _vp16r66kegw() else _va5l88puj9qe4() end
end)

_v3ni2ju9pwym4(_v7qnrnpgs0ky, _S("119|184|229|235|224|151|189|233|220|220|241|220|151|159|206|216|233|228|235|223|160"), false, function(val)
    _vxgciftgcw.AntiFreeze = val
    if val and not _vxgciftgcw.AntiDamage then
        _vxgciftgcw.AntiDamage = true
        _vp16r66kegw()
    end
end)

_v3ni2ju9pwym4(_v7qnrnpgs0ky, _S("65|152|162|179|174|181|169|97|140|166|166|177|166|179"), false, function(val)
    _vxgciftgcw.WarmthKeeper = val
    if val or _vxgciftgcw.StaminaKeeper then _v08jroosktnws() else _vbrpd6p3fgi() end
end)

_v3ni2ju9pwym4(_v7qnrnpgs0ky, _S("77|160|193|174|186|182|187|174|109|152|178|178|189|178|191"), false, function(val)
    _vxgciftgcw.StaminaKeeper = val
    if val or _vxgciftgcw.WarmthKeeper then _v08jroosktnws() else _vbrpd6p3fgi() end
end)

_vxg8ylya07(_v7qnrnpgs0ky, _S("88|128005|120|165|167|174|157|165|157|166|172"))

_v3ni2ju9pwym4(_v7qnrnpgs0ky, _S("102|185|214|203|203|202|134|168|213|213|217|218"), false, function(val)
    _vxgciftgcw.SpeedBoost = val
    _vrgj8pzjf9f()
end)

_vcit2f524bk(_v7qnrnpgs0ky, _S("93|180|190|201|200|125|176|205|194|194|193"), 16, 200, 50, function(val)
    _vxgciftgcw.WalkSpeed = val
    if _vxgciftgcw.SpeedBoost then _vrgj8pzjf9f() end
end)
if false then local _jad8md0wwj=580 end

_v3ni2ju9pwym4(_v7qnrnpgs0ky, _S("85|163|196|184|193|190|197"), false, function(val)
    _vxgciftgcw.Noclip = val
    if val then _vsry2g7mmwmfn() else _v5tfpqwzyu() end
end)

_v3ni2ju9pwym4(_v7qnrnpgs0ky, _S("114|184|222|235"), false, function(val)
    _vxgciftgcw.FlyEnabled = val
    if val then _vuv4k1kiuu5f() else _v5pvfkah9d() end
end)

_vcit2f524bk(_v7qnrnpgs0ky, _S("101|171|209|222|133|184|213|202|202|201"), 10, 200, 60, function(val)
    _vxgciftgcw.FlySpeed = val
end)

_v3ni2ju9pwym4(_v7qnrnpgs0ky, _S("126|199|236|228|231|236|231|242|227|158|200|243|235|238"), false, function(val)
    _vxgciftgcw.InfiniteJump = val
    if val then _vzk7uejdh5() else _vavbo3wra() end
end)

_v3ni2ju9pwym4(_v7qnrnpgs0ky, _S("130|197|238|235|229|237|162|214|231|238|231|242|241|244|246|162|170|197|246|244|238|173|197|238|235|229|237|171"), false, function(val)
    _vxgciftgcw.ClickTeleport = val
    if val then _vhrhycilm0y() else _vhnip3f6v() end
end)

_vxg8ylya07(_v7qnrnpgs0ky, _S("102|128332|134|175|186|171|179|134|170|187|182|171"))

local dupeInput, dupeTextBox
dupeInput, dupeTextBox = _vrnvhdw1bk6(_v7qnrnpgs0ky, _S("117|185|234|229|218|149|198|233|238"), _S("103|152"), function(text)
    local num = tonumber(text)
    if num and num > 0 then
        _vxgciftgcw.DupeAmount = math.floor(num)
    end
end)

_vcyzcxawm(_v7qnrnpgs0ky, _S("86|128316|118|154|203|198|187|118|159|202|187|195|201|118|126") .. _vxgciftgcw.DupeAmount .. _S("98|218|139"), Color3.fromRGB(180, 60, 180), function()
    _vqva3royxf(_vxgciftgcw.DupeAmount)
end)

_vcyzcxawm(_v7qnrnpgs0ky, _S("129|128359|161|197|243|240|241|161|197|246|241|230|161|206|230|245|233|240|229"), Color3.fromRGB(140, 50, 140), function()
if false then local _jqj4s2h7xz35=989 end
    _v2ryveapbvt3()
end)

_vxg8ylya07(_v7qnrnpgs0ky, _S("88|128313|120|170|157|165|167|172|157|120|157|176|168|164|167|161|172|171"))

_vcyzcxawm(_v7qnrnpgs0ky, _S("106|128399|138|176|211|220|207|138|171|214|214|138|183|211|216|207|138|188|207|215|217|222|207|221"), Color3.fromRGB(160, 40, 40), function()
    _ve4ww5dv5wce(_S("87|196|192|197|188"))
    _ve4ww5dv5wce(_S("76|176|181|179"))
    _ve4ww5dv5wce(_S("87|191|184|201|205|188|202|203"))
    _ve4ww5dv5wce(_S("79|178|190|187|187|180|178|195"))
    _ve4ww5dv5wce(_S("87|185|201|188|184|194"))
    _vkd8xe4q8(_S("100|170|205|214|201|200|132|209|205|210|201|132|214|201|209|211|216|201|215"))
end)

_vcyzcxawm(_v7qnrnpgs0ky, _S("79|128255|111|149|184|193|180|111|144|187|187|111|162|180|187|187|111|161|180|188|190|195|180|194"), Color3.fromRGB(40, 140, 40), function()
    _ve4ww5dv5wce(_S("85|200|186|193|193"))
    _ve4ww5dv5wce(_S("120|235|221|228|228|217|228|228"))
    _ve4ww5dv5wce(_S("76|175|173|191|180"))
    _ve4ww5dv5wce(_S("102|211|213|212|203|223"))
    _ve4ww5dv5wce(_S("73|189|187|170|173|174"))
    _vkd8xe4q8(_S("119|189|224|233|220|219|151|234|220|227|227|151|233|220|228|230|235|220|234"))
end)

_vcyzcxawm(_v7qnrnpgs0ky, _S("72|11086|104|142|177|186|173|104|137|180|180|104|157|184|175|186|169|172|173|104|154|173|181|183|188|173|187"), Color3.fromRGB(40, 100, 160), function()
    _ve4ww5dv5wce(_S("112|229|224|215|226|209|212|213"))
    _ve4ww5dv5wce(_S("104|202|221|225"))
    _ve4ww5dv5wce(_S("68|180|185|182|167|172|165|183|169"))
    _ve4ww5dv5wce(_S("103|222|200|217|212|219|207"))
    _ve4ww5dv5wce(_S("88|200|193|187|195|185|208|189"))
    _ve4ww5dv5wce(_S("69|167|166|168|176|181|166|168|176"))
    _vkd8xe4q8(_S("93|163|198|207|194|193|125|210|205|196|207|190|193|194|125|207|194|202|204|209|194|208"))
end)

_vcyzcxawm(_v7qnrnpgs0ky, _S("112|128034|144|182|217|226|213|144|177|220|220|144|188|229|211|219|144|194|213|221|223|228|213|227"), Color3.fromRGB(140, 140, 40), function()
    _ve4ww5dv5wce(_S("86|194|203|185|193"))
    _ve4ww5dv5wce(_S("123|231|240|222|230|244"))
    _ve4ww5dv5wce(_S("128|230|239|242|244|245|238|229"))
    _ve4ww5dv5wce(_S("66|164|174|167|181|181|171|176|169"))
    _vkd8xe4q8(_S("78|148|183|192|179|178|110|186|195|177|185|110|192|179|187|189|194|179|193"))
end)
if false then local _j4vcpmr56pjhp=170 end

_vcyzcxawm(_v7qnrnpgs0ky, _S("114|128277|146|184|219|228|215|146|179|190|190|146|196|215|223|225|230|215|229|146|154|192|231|221|215|155"), Color3.fromRGB(200, 50, 50), function()
    for _, remote in ipairs(_v97r29nwa.RemoteCache) do
        pcall(function()
            if remote.Type == _S("71|153|172|180|182|187|172|140|189|172|181|187") then
                remote.Instance:FireServer()
            elseif remote.Type == _S("71|153|172|180|182|187|172|141|188|181|170|187|176|182|181") then
                remote.Instance:InvokeServer()
            end
        end)
    end
    _vkd8xe4q8(_S("64|142|149|139|133|132|96|161|172|172|96") .. #_v97r29nwa.RemoteCache .. _S("115|147|229|216|224|226|231|216|230|148"))
end)

local _v2v3dv1lkcdr = _vkrsyk41u[_S("80|164|191|191|188|195")]
_vfw9zrkbqcpx()

_vxg8ylya07(_v2v3dv1lkcdr, _S("76|128301|108|158|145|153|155|160|145|108|159|156|165"))

_v3ni2ju9pwym4(_v2v3dv1lkcdr, _S("116|198|217|225|227|232|217|148|199|228|237|148|156|192|227|219|148|186|221|230|217|199|217|230|234|217|230|157"), false, function(val)
    _vxgciftgcw.RemoteSpy = val
    if val then _vbtyi2aikux2q() else _vqr15x62zcker() end
end)

_vgjwqv768h6z = _vgjwqv768h6z + 1
local _v1fnqa6sgjjb = Instance.new(_S("104|187|203|218|215|212|212|209|214|207|174|218|201|213|205"))
RemoteSpyList = _v1fnqa6sgjjb
RemoteSpyList.Name = _S("64|146|165|173|175|180|165|147|176|185|140|169|179|180")
RemoteSpyList.Size = UDim2.new(1, 0, 0, 100)
RemoteSpyList.BackgroundColor3 = Color3.fromRGB(12, 12, 22)
RemoteSpyList.BorderSizePixel = 0
RemoteSpyList.ScrollBarThickness = 2
RemoteSpyList.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
RemoteSpyList.CanvasSize = UDim2.new(0, 0, 0, 0)
RemoteSpyList.AutomaticCanvasSize = Enum.AutomaticSize.Y
RemoteSpyList.LayoutOrder = _vgjwqv768h6z
RemoteSpyList.Parent = _v2v3dv1lkcdr

local _vmrimo1ei = Instance.new(_S("78|163|151|145|189|192|188|179|192"))
_vmrimo1ei.CornerRadius = UDim.new(0, 6)
if false then local _j8ebh90xywgcx=44 end
_vmrimo1ei.Parent = RemoteSpyList

local _vnnnxhrua5v5 = Instance.new(_S("118|203|191|194|223|233|234|194|215|239|229|235|234"))
_vnnnxhrua5v5.SortOrder = Enum.SortOrder.LayoutOrder
_vnnnxhrua5v5.Padding = UDim.new(0, 2)
_vnnnxhrua5v5.Parent = RemoteSpyList

local _vj4j2hhtmgxgy = Instance.new(_S("129|214|202|209|226|229|229|234|239|232"))
_vj4j2hhtmgxgy.PaddingTop = UDim.new(0, 2)
_vj4j2hhtmgxgy.PaddingLeft = UDim.new(0, 2)
_vj4j2hhtmgxgy.PaddingRight = UDim.new(0, 2)
_vj4j2hhtmgxgy.Parent = RemoteSpyList

_vcyzcxawm(_v2v3dv1lkcdr, _S("98|128563|130|165|206|199|195|212|130|181|210|219|130|174|209|201"), Color3.fromRGB(100, 50, 50), function()
    _v97r29nwa.RemoteSpyLogs = {}
    if RemoteSpyList then _v24lbqtcxfc(RemoteSpyList) end
end)

_vxg8ylya07(_v2v3dv1lkcdr, _S("114|128033|146|181|199|197|198|193|191|146|196|183|191|193|198|183"))

_vrnvhdw1bk6(_v2v3dv1lkcdr, _S("117|199|218|226|228|233|218|149|195|214|226|218"), _S("118|"), function(text)
    _vxgciftgcw.CustomRemoteName = text
end)

_vrnvhdw1bk6(_v2v3dv1lkcdr, _S("121|186|235|224|236|153|161|220|232|230|230|218|153|236|222|233|218|235|218|237|222|221|162"), _S("74|"), function(text)
    _vxgciftgcw.CustomRemoteArgs = text
end)

_vcyzcxawm(_v2v3dv1lkcdr, _S("93|128733|125|163|198|207|194|125|160|210|208|209|204|202|125|175|194|202|204|209|194"), Color3.fromRGB(160, 80, 40), function()
    _vnjyyyd2kp()
end)

_vxg8ylya07(_v2v3dv1lkcdr, _S("106|128311|138|193|171|195|186|185|179|184|190|189"))

_vcyzcxawm(_v2v3dv1lkcdr, _S("130|128320|162|213|227|248|231|188|162|213|234|241|242"), Color3.fromRGB(50, 100, 160), function()
    _vc78mf76btzc(_S("61|144|165|172|173"))
end)

_vcyzcxawm(_v2v3dv1lkcdr, _S("90|128280|122|173|187|208|191|148|122|160|187|204|199|122|173|202|201|206"), Color3.fromRGB(50, 130, 80), function()
    _vc78mf76btzc(_S("60|130|157|174|169"))
if false then local _jpiuvcwjzrc=112 end
end)

_vcyzcxawm(_v2v3dv1lkcdr, _S("117|128307|149|200|214|235|218|175|149|200|229|214|236|227"), Color3.fromRGB(80, 80, 140), function()
    _vc78mf76btzc(_S("80|163|192|177|199|190"))
end)

_vcyzcxawm(_v2v3dv1lkcdr, _S("63|128268|95|147|143|95|8657|95|146|167|174|175"), Color3.fromRGB(40, 90, 140), function()
    _v2pwi6vh2hz8f(_S("87|170|191|198|199"))
end)

_vcyzcxawm(_v2v3dv1lkcdr, _S("86|128291|118|170|166|118|8680|118|156|183|200|195|118|169|198|197|202"), Color3.fromRGB(40, 120, 70), function()
    _v2pwi6vh2hz8f(_S("105|175|202|219|214"))
end)

_vcyzcxawm(_v2v3dv1lkcdr, _S("79|128284|111|163|159|111|8673|111|162|191|176|198|189"), Color3.fromRGB(70, 70, 130), function()
    _v2pwi6vh2hz8f(_S("108|191|220|205|227|218"))
end)

local _vebcm6zf2f = _vkrsyk41u[_S("110|187|215|225|209")]
_vfw9zrkbqcpx()

_vxg8ylya07(_vebcm6zf2f, _S("88|9969|120|171|157|172|172|161|166|159|171"))

_v3ni2ju9pwym4(_vebcm6zf2f, _S("125|190|235|241|230|170|190|195|200"), false, function(val)
    _vxgciftgcw.AntiAFK = val
    if val then _vryle8ekkx() else _vtfbol455v3() end
end)

_v3ni2ju9pwym4(_vebcm6zf2f, _S("86|151|203|202|197|118|168|187|201|198|183|205|196|118|129|118|168|187|183|198|198|194|207"), false, function(val)
    _vxgciftgcw.AutoRespawn = val
end)

_v3ni2ju9pwym4(_vebcm6zf2f, _S("92|162|172|175|124|158|203|203|207|208|193|206"), false, function(val)
    _vxgciftgcw.FPSBooster = val
    if val then _vk4jvb7sik() end
end)

_vcit2f524bk(_vebcm6zf2f, _S("130|213|231|244|248|231|244|162|202|241|242|162|170|239|235|240|174|162|178|191|241|232|232|171"), 0, 120, 0, function(val)
    _vxgciftgcw.ServerHopInterval = val
    _vtpg0777gcetj()
if false then local _jirke3r9x46u=46 end
    if val > 0 then _v8tutbnmg2fz1() end
end)

_vcyzcxawm(_vebcm6zf2f, _S("96|127856|128|179|197|210|214|197|210|128|168|207|208|128|174|207|215"), Color3.fromRGB(60, 100, 160), function()
    _v1iw89bby5fi()
end)

_vcyzcxawm(_vebcm6zf2f, _S("93|128283|125|176|190|211|194|125|188|211|213|196|192|198|195|209|196|192|212"), Color3.fromRGB(50, 120, 80), function()
    _vdanbg9x7()
end)

_vcyzcxawm(_vebcm6zf2f, _S("84|128278|116|160|195|181|184|116|179|202|204|187|183|189|186|200|187|183|203"), Color3.fromRGB(80, 100, 160), function()
    _vjtcpe4i1he2()
end)

_vcyzcxawm(_vebcm6zf2f, _S("94|128774|126|174|159|172|167|161|126|134|177|210|205|206|126|159|202|202|135"), Color3.fromRGB(200, 40, 40), function()
    _vk2hiu4wmt2q7()
end)

_vxg8ylya07(_vebcm6zf2f, _S("60|9060|92|135|129|149|126|133|138|128|143"))
_vgjwqv768h6z = _vgjwqv768h6z + 1
local _v800u6kbe = Instance.new(_S("104|188|205|224|220|180|201|202|205|212"))
_v800u6kbe.Size = UDim2.new(1, 0, 0, 70)
_v800u6kbe.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
_v800u6kbe.BorderSizePixel = 0
_v800u6kbe.Text = _S("115|147|147|197|220|218|219|231|198|219|220|217|231|147|176|147|199|226|218|218|223|216|147|186|200|188|207|225|147|147|185|147|176|147|199|226|218|218|223|216|147|185|223|236|207|225|147|147|186|147|176|147|199|226|218|218|223|216|147|180|232|231|226|147|185|212|229|224|207|225|147|147|187|147|176|147|199|226|218|218|223|216|147|198|224|212|229|231|147|191|226|226|227|207|225|147|147|195|147|176|147|195|212|225|220|214|147|198|231|226|227|147|180|223|223|207|225|147|147|182|231|229|223|158|182|223|220|214|222|147|176|147|182|223|220|214|222|147|199|195|147|155|220|217|147|216|225|212|213|223|216|215|156")
_v800u6kbe.TextColor3 = Color3.fromRGB(160, 180, 210)
_v800u6kbe.Font = Enum.Font.Gotham
_v800u6kbe.TextSize = _va91lj3doqeib and 9 or 10
_v800u6kbe.TextXAlignment = Enum.TextXAlignment.Left
_v800u6kbe.TextYAlignment = Enum.TextYAlignment.Top
_v800u6kbe.TextWrapped = true
_v800u6kbe.LayoutOrder = _vgjwqv768h6z
_v800u6kbe.Parent = _vebcm6zf2f
local _vzzldscpi55u = Instance.new(_S("75|160|148|142|186|189|185|176|189"))
_vzzldscpi55u.CornerRadius = UDim.new(0, 6)
_vzzldscpi55u.Parent = _v800u6kbe

_vxg8ylya07(_vebcm6zf2f, _S("129|128332|161|205|208|200"))

local _vqt3n2xk8ys6i = Instance.new(_S("115|198|214|229|226|223|223|220|225|218|185|229|212|224|216"))
LogList = _vqt3n2xk8ys6i
LogList.Name = _S("62|138|173|165|138|167|177|178")
LogList.Size = UDim2.new(1, 0, 0, 100)
LogList.BackgroundColor3 = Color3.fromRGB(12, 12, 20)
LogList.BorderSizePixel = 0
LogList.ScrollBarThickness = 2
LogList.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
LogList.CanvasSize = UDim2.new(0, 0, 0, 0)
LogList.AutomaticCanvasSize = Enum.AutomaticSize.Y
_vgjwqv768h6z = _vgjwqv768h6z + 1
LogList.LayoutOrder = _vgjwqv768h6z
LogList.Parent = _vebcm6zf2f

local _vbp9a9ntu27 = Instance.new(_S("120|205|193|187|231|234|230|221|234"))
_vbp9a9ntu27.CornerRadius = UDim.new(0, 6)
_vbp9a9ntu27.Parent = LogList

local _voo3bwkl28 = Instance.new(_S("61|146|134|137|166|176|177|137|158|182|172|178|177"))
_voo3bwkl28.SortOrder = Enum.SortOrder.LayoutOrder
_voo3bwkl28.Parent = LogList

local _v4p8z3ccko0 = Instance.new(_S("75|160|148|155|172|175|175|180|185|178"))
_v4p8z3ccko0.PaddingTop = UDim.new(0, 3)
_v4p8z3ccko0.PaddingLeft = UDim.new(0, 3)
_v4p8z3ccko0.PaddingRight = UDim.new(0, 3)
_v4p8z3ccko0.Parent = LogList

_vxg8ylya07(_vebcm6zf2f, _S("82|128361|114|150|155|165|149|161|164|150|114|169|151|148|154|161|161|157"))

_v3ni2ju9pwym4(_vebcm6zf2f, _S("100|169|210|197|198|208|201|132|187|201|198|204|211|211|207"), false, function(val)
    _vxgciftgcw.WebhookEnabled = val
end)

_vrnvhdw1bk6(_vebcm6zf2f, _S("114|201|215|212|218|225|225|221|146|199|196|190"), _S("60|"), function(text)
    _vxgciftgcw.WebhookURL = text
end)

_v3ni2ju9pwym4(_vebcm6zf2f, _S("103|173|200|217|212|135|179|214|206|218"), true, function(val)
    _vxgciftgcw.WebhookFarm = val
if false then local _jacttaa56=543 end
end)

_v3ni2ju9pwym4(_vebcm6zf2f, _S("73|156|174|181|181|105|149|184|176|188"), true, function(val)
    _vxgciftgcw.WebhookSell = val
end)

_v3ni2ju9pwym4(_vebcm6zf2f, _S("108|191|224|205|224|223|140|184|219|211|223"), true, function(val)
    _vxgciftgcw.WebhookStats = val
end)

_vcyzcxawm(_vebcm6zf2f, _S("111|128343|143|194|212|221|211|143|194|227|208|227|226|143|189|222|230"), Color3.fromRGB(50, 90, 160), function()
    _vygpf0cqft()
    _vkd8xe4q8(_S("111|194|212|221|227|143|226|227|208|227|226|143|227|222|143|230|212|209|215|222|222|218"))
end)

_vcyzcxawm(_vebcm6zf2f, _S("93|129607|125|177|194|208|209|125|180|194|191|197|204|204|200"), Color3.fromRGB(90, 60, 140), function()
    _vjjwctc8j({content = _S("65|107|107|156|142|170|175|166|162|97|142|176|182|175|181|162|170|175|97|183|120|158|107|107|97|152|166|163|169|176|176|172|97|181|166|180|181|97|180|182|164|164|166|180|180|167|182|173|98|97|10054")})
    _vkd8xe4q8(_S("89|173|190|204|205|190|189|121|208|190|187|193|200|200|196"))
end)

_vxg8ylya07(_vebcm6zf2f, _S("75|128370|107|160|159|148|151|148|159|148|144|158"))

_vcyzcxawm(_vebcm6zf2f, _S("87|128055|119|171|188|195|188|199|198|201|203|119|203|198|119|170|199|184|206|197"), Color3.fromRGB(60, 90, 140), function()
    local _vkx2q3u0y9ch = _vweeyy23p5u:FindFirstChild(_S("97|180|209|194|216|207|173|208|196|194|213|202|208|207")) or _vweeyy23p5u:FindFirstChild(_S("92|175|204|189|211|202|207")) or _vweeyy23p5u:FindFirstChild(_S("105|181|216|203|203|226"))
    if _vkx2q3u0y9ch then
        if _vkx2q3u0y9ch:IsA(_S("128|194|225|243|229|208|225|242|244")) then
            _ven49e9sgfs(_vkx2q3u0y9ch.Position)
        else
            local spawn = _vkx2q3u0y9ch:FindFirstChildWhichIsA(_S("84|150|181|199|185|164|181|198|200"))
            if spawn then _ven49e9sgfs(spawn.Position) end
        end
    else
        _vkd8xe4q8(_S("62|140|173|94|177|174|159|181|172|94|164|173|179|172|162|95"))
    end
end)

_vcyzcxawm(_vebcm6zf2f, _S("121|128077|153|205|222|229|222|233|232|235|237|153|237|232|153|198|232|238|231|237|218|226|231|153|205|232|233"), Color3.fromRGB(100, 60, 140), function()
    if _vl3pa04b19y() then
        local _vnp5qbxls4ak = HumanoidRootPart.Position.Y
        local _vq9p4j0tc89jf = nil
if false then local _j981ey5rs=959 end
        for _, _vpnixwn5qwxx in ipairs(_vweeyy23p5u:GetDescendants()) do
            if _vpnixwn5qwxx:IsA(_S("125|191|222|240|226|205|222|239|241")) and _vpnixwn5qwxx.Position.Y > _vnp5qbxls4ak then
                _vnp5qbxls4ak = _vpnixwn5qwxx.Position.Y
                _vq9p4j0tc89jf = _vpnixwn5qwxx
            end
        end
        if _vq9p4j0tc89jf then
            _ven49e9sgfs(_vq9p4j0tc89jf.Position + Vector3.new(0, 10, 0))
            _vkd8xe4q8(_S("100|184|201|208|201|212|211|214|216|201|200|132|216|211|132|204|205|203|204|201|215|216|132|212|211|205|210|216|158|132") .. math.floor(_vnp5qbxls4ak))
        end
    end
end)

_vcyzcxawm(_vebcm6zf2f, _S("68|128328|100|150|169|174|179|173|178|100|151|169|182|186|169|182"), Color3.fromRGB(100, 100, 50), function()
    pcall(function()
        LocalPlayer:Kick(_S("61|143|162|167|172|166|171|166|171|164|107|107|107"))
        task.wait(1)
        game:GetService(_S("90|185|208|147|189|200|188|146|142|140|188|196|144|208|147")):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end)
end)

_vxg8ylya07(_vebcm6zf2f, _S("113|8618|145|186|191|183|192"))

_vgjwqv768h6z = _vgjwqv768h6z + 1
local _vt57cmaj5viv = Instance.new(_S("83|167|184|203|199|159|180|181|184|191"))
_vt57cmaj5viv.Size = UDim2.new(1, 0, 0, 50)
_vt57cmaj5viv.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
_vt57cmaj5viv.BorderSizePixel = 0
_vt57cmaj5viv.Text = _S("94|171|199|204|195|191|126|171|205|211|204|210|191|199|204|126|212|149|126|218|126|163|214|195|193|211|210|205|208|152|126") .. _vmn9q9a90yk.Name .. _S("97|189|207|180|206|194|211|213|129|173|208|208|209|129|221|129|179|198|206|208|213|198|129|180|209|218|129|221|129|166|180|177|140|129|221|129|184|194|218|209|208|202|207|213|212|189|207|165|198|205|213|194|129|280|129|180|218|207|194|209|212|198|129|280|129|172|179|175|173|129|280|129|167|205|214|217|214|212|129|280|129|184|194|215|198|129|280|129|164|208|197|198|217")
_vt57cmaj5viv.TextColor3 = Color3.fromRGB(140, 160, 200)
_vt57cmaj5viv.Font = Enum.Font.Gotham
_vt57cmaj5viv.TextSize = _va91lj3doqeib and 9 or 10
_vt57cmaj5viv.TextWrapped = true
_vt57cmaj5viv.LayoutOrder = _vgjwqv768h6z
_vt57cmaj5viv.Parent = _vebcm6zf2f

local _vojajbjyw1wpr = Instance.new(_S("112|197|185|179|223|226|222|213|226"))
_vojajbjyw1wpr.CornerRadius = UDim.new(0, 6)
_vojajbjyw1wpr.Parent = _vt57cmaj5viv

_va2me4k81esq.MouseButton1Click:Connect(function()
    _v97r29nwa.IsMinimized = true
    local _vhq4iphpiz8k9 = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local _vdln4qdqicv1d = _vs3ji7eay:Create(_vzwhw8wjyw1no, _vhq4iphpiz8k9, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = _v2crg3mmhpgr,
    })
    _vdln4qdqicv1d:Play()
    _vdln4qdqicv1d.Completed:Connect(function()
        _vzwhw8wjyw1no.Visible = false
        _v92svbs53.Visible = true
        _v92svbs53.Size = UDim2.new(0, 0, 0, 0)
        local _vmr2qrh7n = _vs3ji7eay:Create(_v92svbs53, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = _vlyce4pb32r9,
        })
        _vmr2qrh7n:Play()
    end)
end)

_vmnr8bpwdicn.MouseButton1Click:Connect(function()
    _v97r29nwa.IsMinimized = false
    local _vhq4iphpiz8k9 = TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local _vdln4qdqicv1d = _vs3ji7eay:Create(_v92svbs53, _vhq4iphpiz8k9, {
        Size = UDim2.new(0, 0, 0, 0),
    })
    _vdln4qdqicv1d:Play()
    _vdln4qdqicv1d.Completed:Connect(function()
        _v92svbs53.Visible = false
        _vzwhw8wjyw1no.Visible = true
        _vzwhw8wjyw1no.Size = UDim2.new(0, 0, 0, 0)
        local _vmr2qrh7n = _vs3ji7eay:Create(_vzwhw8wjyw1no, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = _v6k7bcrob,
        })
        _vmr2qrh7n:Play()
    end)
end)

local _vbnptwp6vj = false
local dragInput
local dragStart
if false then local _jpnu0zw9xxlxw=826 end
local startPos

local function _v5khpggb2wj(_vblw4qmq2t2)
    local delta = _vblw4qmq2t2.Position - dragStart
    local _veiau2yujp = _v97r29nwa.IsMinimized and _v92svbs53 or _vzwhw8wjyw1no
    _veiau2yujp.Position = UDim2.new(
        startPos.X.Scale, startPos.X.Offset + delta.X,
        startPos.Y.Scale, startPos.Y.Offset + delta.Y
    )
end

local function _v1eg3s79d4b3s(_vymirdrvxglb)
    _vymirdrvxglb.InputBegan:Connect(function(_vblw4qmq2t2)
        if _vblw4qmq2t2.UserInputType == Enum.UserInputType.MouseButton1 or _vblw4qmq2t2.UserInputType == Enum.UserInputType.Touch then
            _vbnptwp6vj = true
            dragStart = _vblw4qmq2t2.Position
            startPos = _vymirdrvxglb.Position
            _vblw4qmq2t2.Changed:Connect(function()
                if _vblw4qmq2t2.UserInput_v97r29nwa == Enum.UserInput_v97r29nwa.End then
                    _vbnptwp6vj = false
                end
            end)
        end
    end)
    _vymirdrvxglb.InputChanged:Connect(function(_vblw4qmq2t2)
        if _vblw4qmq2t2.UserInputType == Enum.UserInputType.MouseMovement or _vblw4qmq2t2.UserInputType == Enum.UserInputType.Touch then
            dragInput = _vblw4qmq2t2
        end
    end)
    _vkoer20mf.InputChanged:Connect(function(_vblw4qmq2t2)
        if _vblw4qmq2t2 == dragInput and _vbnptwp6vj then
            _v5khpggb2wj(_vblw4qmq2t2)
        end
    end)
end

_v1eg3s79d4b3s(_vjferwo44dk)
_v1eg3s79d4b3s(_v92svbs53)

local _v1istpimwrfm = 0
if false then local _jem8yrqa4r=164 end
task.spawn(function()
    while true do
        task.wait(1)
        pcall(_vxor6p64y22k)
        if _vxgciftgcw.WebhookEnabled and _vxgciftgcw.WebhookStats then
            local now = tick()
            if now - _v1istpimwrfm >= 30 then
                _v1istpimwrfm = now
                pcall(_vygpf0cqft)
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(10)
        pcall(function()
            local _vm5ibrltxo = _vhzc5hi15cw()
            if ShopList then
                _v24lbqtcxfc(ShopList)
                for i, _vaylmf2zcl in ipairs(_vm5ibrltxo) do
                    if i > 15 then break end
                    local btn = Instance.new(_S("94|178|195|214|210|160|211|210|210|205|204"))
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Color3.fromRGB(30, 35, 50)
                    btn.BorderSizePixel = 0
                    btn.Text = _vaylmf2zcl.Name .. _S("87|119|178") .. math.floor(_vaylmf2zcl.Distance) .. _S("93|202|186")
                    btn.TextColor3 = Color3.fromRGB(200, 220, 255)
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = 11
                    btn.LayoutOrder = i
                    btn.Parent = ShopList
                    local _vstorryylqlj = Instance.new(_S("117|202|190|184|228|231|227|218|231"))
                    _vstorryylqlj.CornerRadius = UDim.new(0, 5)
                    _vstorryylqlj.Parent = btn
                    btn.MouseButton1Click:Connect(function()
                        _ven49e9sgfs(_vaylmf2zcl.Part.Position)
                        _vkd8xe4q8(_S("122|206|223|230|223|234|233|236|238|223|222|154|238|233|180|154") .. _vaylmf2zcl.Name)
                    end)
if false then local _j1wyqux0l=564 end
                end
            end
        end)

        pcall(function()
            local _vgg4pi8sv = _vg6wgwfl9xdcf()
            if RockList then
                _v24lbqtcxfc(RockList)
                for i, _vg6y5wgc1e34 in ipairs(_vgg4pi8sv) do
                    if i > 20 then break end
                    local btn = Instance.new(_S("93|177|194|213|209|159|210|209|209|204|203"))
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Color3.fromRGB(30, 35, 50)
                    btn.BorderSizePixel = 0
                    btn.Text = _vg6y5wgc1e34.Name .. _S("63|95|154") .. math.floor(_vg6y5wgc1e34.Distance) .. _S("116|225|209") .. (_vg6y5wgc1e34.Value > 0 and (_S("77|109|113") .. _vg6y5wgc1e34.Value) or _S("125|"))
                    btn.TextColor3 = _vg6y5wgc1e34.Value > 0 and Color3.fromRGB(255, 215, 100) or Color3.fromRGB(200, 255, 200)
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = 11
                    btn.LayoutOrder = i
                    btn.Parent = RockList
                    local _vstorryylqlj = Instance.new(_S("111|196|184|178|222|225|221|212|225"))
                    _vstorryylqlj.CornerRadius = UDim.new(0, 5)
                    _vstorryylqlj.Parent = btn
                    btn.MouseButton1Click:Connect(function()
                        _ven49e9sgfs(_vg6y5wgc1e34.Part.Position)
                        _vkd8xe4q8(_S("67|151|168|175|168|179|178|181|183|168|167|99|183|178|125|99") .. _vg6y5wgc1e34.Name)
                    end)
                end
            end
        end)
    end
end)

_vkoer20mf.InputBegan:Connect(function(_vblw4qmq2t2, processed)
    if processed then return end
    if _vblw4qmq2t2.KeyCode == Enum.KeyCode.RightShift then
        _vesr152azvw.Enabled = not _vesr152azvw.Enabled
        _v97r29nwa.GUIHidden = not _vesr152azvw.Enabled
    elseif _vblw4qmq2t2.KeyCode == Enum.KeyCode.F then
        _vxgciftgcw.FlyEnabled = not _vxgciftgcw.FlyEnabled
if false then local _jtm0lxbmbn=54 end
        if _vxgciftgcw.FlyEnabled then _vuv4k1kiuu5f() else _v5pvfkah9d() end
        _vkd8xe4q8(_S("126|196|234|247|184|158") .. (_vxgciftgcw.FlyEnabled and _S("118|197|196") or _S("130|209|200|200")))
    elseif _vblw4qmq2t2.KeyCode == Enum.KeyCode.G then
        _vxgciftgcw.AutoFarm = not _vxgciftgcw.AutoFarm
        if _vxgciftgcw.AutoFarm then _vlq26u4fhn() else _vgw57dafb() end
        _vkd8xe4q8(_S("91|156|208|207|202|123|161|188|205|200|149|123") .. (_vxgciftgcw.AutoFarm and _S("105|184|183") or _S("126|205|196|196")))
    elseif _vblw4qmq2t2.KeyCode == Enum.KeyCode.H then
        _vxgciftgcw.SmartLoop = not _vxgciftgcw.SmartLoop
        if _vxgciftgcw.SmartLoop then _vmk39fagq3() else _vjnzq3zf8djcx() end
        _vkd8xe4q8(_S("73|156|182|170|187|189|105|149|184|184|185|131|105") .. (_vxgciftgcw.SmartLoop and _S("104|183|182") or _S("79|158|149|149")))
    elseif _vblw4qmq2t2.KeyCode == Enum.KeyCode.P and _vxgciftgcw.PanicEnabled then
        _vk2hiu4wmt2q7()
        _vesr152azvw.Enabled = false
        _v97r29nwa.GUIHidden = true
    end
end)

task.spawn(function()
    while true do
        task.wait(3)
        pcall(function()
            if _vxgciftgcw.Tracers then _vpei3803f58t() end
            if _vxgciftgcw.PlayerESP then _v3w92ybgv8fd() end
            if _vxgciftgcw.ChestESP then _v0ajurig9pn() end
            if _vxgciftgcw.HideOther_vb4etlpkxz1 then _v0ltwx02s() end
            if _vxgciftgcw.BypassPromptHold then _v7o5oba86djlm(_vweeyy23p5u) end
        end)
    end
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    HumanoidRootPart = char:WaitForChild(_S("68|140|185|177|165|178|179|173|168|150|179|179|184|148|165|182|184"))
    Humanoid = char:WaitForChild(_S("100|172|217|209|197|210|211|205|200"))
    _vkd8xe4q8(_S("71|138|175|168|185|168|170|187|172|185|103|185|172|186|183|168|190|181|172|171"))

    task.delay(1, function()
        if _vxgciftgcw.SpeedBoost then _vrgj8pzjf9f() end
        if _vxgciftgcw.FlyEnabled then _v5pvfkah9d() _vuv4k1kiuu5f() end
        if _vxgciftgcw.InfiniteJump then _vavbo3wra() _vzk7uejdh5() end
if false then local _jcrctrohnef1c=84 end
        if _vxgciftgcw.AutoEquipPickaxe then _vg84qrnkt7o() end
        if _vxgciftgcw.AutoFarm and not _v97r29nwa.FarmConnection then _vlq26u4fhn() end
        if _vxgciftgcw.SmartLoop and not _v97r29nwa.SmartLoopConn then _vmk39fagq3() end
        if _vxgciftgcw.WarmthKeeper or _vxgciftgcw.StaminaKeeper then _v08jroosktnws() end
    end)
end)

LocalPlayer.CharacterRemoving:Connect(function()
    if _vxgciftgcw.AutoRespawn then
        task.delay(3, function()
            pcall(function()
                if not LocalPlayer.Character then
                    _vmn9q9a90yk.LoadCharacter()
                end
            end)
        end)
    end
end)

if _vnaquldovsj then
    _vnaquldovsj:GetPropertyChangedSignal(_S("101|187|206|202|220|213|212|215|217|184|206|223|202")):Connect(function()
        local _vrmwu5xqku9 = _vnaquldovsj.ViewportSize
        local _v6w0ms86mkuq = _vrmwu5xqku9.X < 800
        _v6k7bcrob = _v6w0ms86mkuq and UDim2.new(0, 310, 0, 400) or UDim2.new(0, 360, 0, 480)
        if not _v97r29nwa.IsMinimized then
            _vzwhw8wjyw1no.Size = _v6k7bcrob
        end
        _vd0sgdio7.TextSize = _v6w0ms86mkuq and 13 or 15
    end)
end

_vmn9q9a90yk.SetSimRadius()

pcall(function()
    _vkd8xe4q8(_S("124|201|229|234|225|221|156|201|235|241|234|240|221|229|234|156|242|179|156|232|235|221|224|225|224|156|235|234|156") .. _vmn9q9a90yk.Name)
    _vkd8xe4q8(_S("97|166|217|198|196|214|213|208|211|129|162|177|170|212|155|129|169|181|181|177|158") .. tostring(_vmn9q9a90yk.Request ~= nil) .. _S("94|126|166|205|205|201|155") .. tostring(_vmn9q9a90yk.HasHookMeta) .. _S("70|102|137|178|175|169|177|131") .. tostring(_vmn9q9a90yk.HasFireClick))
    _vkd8xe4q8(_S("66|148|171|169|170|182|149|170|171|168|182|98|127|98|137|151|139|98|190|98|133|163|165|170|167|98|180|167|175|177|182|167|181|98|161|184|173|163|185|174|184|118|119|171|120|188|121|170|99"))
    _v7o5oba86djlm(_vweeyy23p5u)
end)

task.delay(3, function()
    pcall(_vi1upuwsv4)
end)
