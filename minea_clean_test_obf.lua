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
if false then local _j2r91edd0=0 end
local _vucu8xrin82 = game:GetService(_S("102|182|210|199|223|203|216|217"))
local _vzsy132cush = game:GetService(_S("115|197|216|227|223|220|214|212|231|216|215|198|231|226|229|212|218|216"))
local _vtz2kf5z6jx = game:GetService(_S("111|198|222|225|218|226|223|208|210|212"))
local _vwgqjmt2dvj = game:GetService(_S("60|142|177|170|143|161|174|178|165|159|161"))
local _vb5dopfzp45 = game:GetService(_S("117|201|236|218|218|227|200|218|231|235|222|216|218"))
local _vig1weh01jf = game:GetService(_S("86|171|201|187|200|159|196|198|203|202|169|187|200|204|191|185|187"))
local HttpService = game:GetService(_S("104|176|220|220|216|187|205|218|222|209|203|205"))
local _v56wtv8ret8 = game:GetService(_S("125|208|241|222|239|241|226|239|196|242|230"))
local _v46ma49f5gf = game:GetService(_S("70|146|175|173|174|186|175|180|173"))
local _vdd6avlxrqk = game:GetService(_S("100|184|201|208|201|212|211|214|216|183|201|214|218|205|199|201"))
local _v8ilm71bl62 = game:GetService(_S("122|189|233|230|230|223|221|238|227|233|232|205|223|236|240|227|221|223"))

local _vx06boh6bcr = _vucu8xrin82.LocalPlayer
if not _vx06boh6bcr then
    _vx06boh6bcr = _vucu8xrin82.PlayerAdded:Wait()
end

local Character = _vx06boh6bcr.Character
local _vel45wbkgbl = Character and Character:FindFirstChild(_S("90|162|207|199|187|200|201|195|190|172|201|201|206|170|187|204|206"))
local _v59l4xsoenu = Character and Character:FindFirstChild(_S("116|188|233|225|213|226|227|221|216"))
if not Character then
    task.spawn(function()
        local char = _vx06boh6bcr.CharacterAdded:Wait()
        Character = char
        _vel45wbkgbl = char:WaitForChild(_S("81|153|198|190|178|191|192|186|181|163|192|192|197|161|178|195|197"))
        _v59l4xsoenu = char:WaitForChild(_S("63|135|180|172|160|173|174|168|163"))
    end)
end

local _vsmeofirta7 = {
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
    OreFilter = _S("119|219|224|216|228|230|229|219|163|233|236|217|240|163|222|230|227|219|163|220|228|220|233|216|227|219|163|234|216|231|231|223|224|233|220|163|234|235|216|233|234|216|231|231|223|224|233|220|163|231|227|216|235|224|229|236|228"),
    OreBlacklist = _S("74|173|185|171|182|118|189|190|185|184|175|118|188|185|173|181"),
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

local LogList, ShopList, RockList, RemoteSpyList, CashLabel, _vk0vk15tvv8

local State = {
    FarmConnection = nil,
    SellConnection = nil,
    ESPConnections = {},
    AntiDamageConn = nil,
    NoclipConn = nil,
    FlyConn = nil,
    UpgradeConn = nil,
    IsMinimized = false,
    CurrentTarget = _S("75|153|186|185|176"),
    FarmCount = 0,
    SellCount = 0,
    DupeCount = 0,
    UpgradeCount = 0,
    TotalEarnings = 0,
    Logs = {},
    ESPHighlights = {},
    RemoteCache = {},
    TabOpen = _S("115|185|212|229|224"),
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
    Exec.Name = _S("110|195|220|217|220|221|229|220")
    pcall(function()
        if identifyexecutor then
            Exec.Name = identifyexecutor()
        elseif EXECUTOR_NAME then
            Exec.Name = EXECUTOR_NAME
        elseif syn then
            Exec.Name = _S("129|212|250|239|226|241|244|230")
        elseif KRNL_LOADED then
            Exec.Name = _S("115|190|197|193|191")
        elseif Fluxus then
            Exec.Name = _S("106|176|214|223|226|223|221")
        elseif delta then
            Exec.Name = _S("96|164|197|204|212|193")
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
            local cg = game:GetService(_S("63|130|174|177|164|134|180|168"))
            if cloneref then cg = cloneref(cg) end
            parent = cg
        end)
        if parent then return parent end
        return _vx06boh6bcr:WaitForChild(_S("81|161|189|178|202|182|195|152|198|186"))
    end

    Exec.HttpGet = function(url)
        local ok, result = pcall(function() return game:HttpGet(url) end)
        if ok and result then return result end
        if Exec.Request then
            local res = Exec.Request({Url = url, Method = _S("61|132|130|145")})
            if type(res) == _S("124|240|221|222|232|225") then
                return res.Body or res.body or res.BodyText
            end
        end
        return HttpService:GetAsync(url)
    end

    Exec.Post = function(url, body, contentType)
        contentType = contentType or _S("96|193|208|208|204|201|195|193|212|201|207|206|143|202|211|207|206")
        if Exec.Request then
            return Exec.Request({
                Url = url,
                Method = _S("97|177|176|180|181"),
                Headers = {[_S("110|177|221|220|226|211|220|226|155|194|231|222|211")] = contentType},
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
            elseif _vx06boh6bcr.LoadCharacter then _vx06boh6bcr:LoadCharacter() end
        end)
    end

    Exec.SetSimRadius = function()
        pcall(function()
            if setsimulationradius then setsimulationradius(1e9, 1e9) end
        end)
        pcall(function()
            if sethiddenproperty then
                sethiddenproperty(_vx06boh6bcr, _S("101|184|206|210|218|209|198|217|206|212|211|183|198|201|206|218|216"), 1e9)
                sethiddenproperty(_vx06boh6bcr, _S("96|173|193|216|179|201|205|213|204|193|212|201|207|206|178|193|196|201|213|211"), 1e9)
            end
        end)
    end

    local _vzspuf29hqh = {}
    local _vom6vwka9oj = nil
    local _v1ci4e9j7pm = false

    function Exec.OnNamecall(fn)
        table.insert(_vzspuf29hqh, fn)
        if not _v1ci4e9j7pm and Exec.HasHookMeta then
            _v1ci4e9j7pm = true
            pcall(function()
                _vom6vwka9oj = hookmetamethod(game, _S("83|178|178|193|180|192|184|182|180|191|191"), Exec.SafeCClosure(function(self, ...)
                    local method = Exec.GetNamecallMethod()
                    local args = {...}
                    for _, hook in ipairs(_vzspuf29hqh) do
                        local block, ret = hook(self, method, args)
                        if block then return ret end
                    end
                    return _vom6vwka9oj(self, ...)
                end))
            end)
        end
    end

    Exec.NamecallHooks = _vzspuf29hqh

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

local _v3pnatp12am = false

pcall(function()
    if Exec.HasHookMeta and Exec.GetNamecallMethod then
        Exec.OnNamecall(function(self, method, args)

            if _v3pnatp12am and (method == _S("75|145|180|189|176|158|176|189|193|176|189") or method == _S("83|156|193|201|194|190|184|166|184|197|201|184|197")) then
                if self:IsA(_S("129|211|230|238|240|245|230|198|247|230|239|245")) or self:IsA(_S("63|145|164|172|174|179|164|133|180|173|162|179|168|174|173")) then
                    pcall(function() _vmdatjk78dx(self.Name, method, args) end)
                end
            end

            if method == _S("80|155|185|179|187") and self == _vx06boh6bcr then
                return true, nil
            end

            if method == _S("71|141|176|181|171|154|172|185|189|176|170|172") then
                local svc = args[1]
                if svc == _S("78|147|198|190|186|189|183|194|161|179|192|196|183|177|179") or svc == _S("60|127|164|161|157|176|143|161|174|178|165|159|161") then
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
            local _vwvl2cmn2d5 = hookmetamethod(game, _S("80|175|175|185|190|180|181|200"), Exec.SafeCClosure(function(self, key)
                if _v59l4xsoenu and self == _v59l4xsoenu then
                    if key == _S("122|209|219|230|229|205|234|223|223|222") and _vsmeofirta7.SpeedBoost then return 16 end
                    if key == _S("97|171|214|206|209|177|208|216|198|211") and _vsmeofirta7.JumpPower > 50 then return 50 end
                end
                return _vwvl2cmn2d5(self, key)
            end))
        end)
        pcall(function()
            local _vrv4rfdwvrq = hookmetamethod(game, _S("107|202|202|217|208|226|212|217|207|208|227"), Exec.SafeCClosure(function(self, key, value)
                if _v59l4xsoenu and self == _v59l4xsoenu then
                    if key == _S("126|213|223|234|233|209|238|227|227|226") and _vsmeofirta7.SpeedBoost then
                        return _vrv4rfdwvrq(self, key, _vsmeofirta7.WalkSpeed)
                    end
                end
                return _vrv4rfdwvrq(self, key, value)
            end))
        end)
    end
end

local function _vbbnplrdpcz()
    Character = _vx06boh6bcr.Character
    if Character then
        _vel45wbkgbl = Character:FindFirstChild(_S("82|154|199|191|179|192|193|187|182|164|193|193|198|162|179|196|198"))
        _v59l4xsoenu = Character:FindFirstChild(_S("126|198|243|235|223|236|237|231|226"))
    end
    return Character and _vel45wbkgbl and _v59l4xsoenu
end

local function _vjkfw6dexbg(part)
    if not _vbbnplrdpcz() then return math.huge end
    return (_vel45wbkgbl.Position - part.Position).Magnitude
end

local function _v227syc5l79(position)
    if not _vbbnplrdpcz() then return false end
    local _vorip427dep = CFrame.new(position + Vector3.new(0, 3, 0))
    if _vsmeofirta7.TweenTeleport then
        local dist = (_vel45wbkgbl.Position - position).Magnitude
        local dur = math.clamp(dist / _vsmeofirta7.TweenTeleportSpeed, 0.08, 2.5)
        _vb5dopfzp45:Create(_vel45wbkgbl, TweenInfo.new(dur, Enum.EasingStyle.Linear), {CFrame = _vorip427dep}):Play()
        task.wait(dur)
    else
        _vel45wbkgbl.CFrame = _vorip427dep
        task.wait(_vsmeofirta7.TeleportDelay)
    end
    return true
end

local function _v8bogu0v7h5(str)
    local list = {}
    for token in string.gmatch(string.lower(str or ""), _S("121|212|215|165|158|236|214|164")) do
        table.insert(list, token)
    end
    return list
end

local function _v45b4qojrot(_v23xerysggr)
    if not _vsmeofirta7.OreFilterEnabled then return true end
    local _vj8b7n63mth = _v8bogu0v7h5(_vsmeofirta7.OreBlacklist)
    for _, word in ipairs(_vj8b7n63mth) do
        if string.find(_v23xerysggr, word, 1, true) then return false end
    end
    local _v2707yr15b4 = _v8bogu0v7h5(_vsmeofirta7.OreFilter)
    if #_v2707yr15b4 == 0 then return true end
    for _, word in ipairs(_v2707yr15b4) do
        if string.find(_v23xerysggr, word, 1, true) then return true end
    end
    return false
end

local function _vwmgl7t279v(_vsu88gzvxn2)
    local _vc6fyn0wo88 = _vx06boh6bcr:FindFirstChild(_S("70|178|171|167|170|171|184|185|186|167|186|185"))
    if not _vc6fyn0wo88 then return 0 end
    for _, stat in ipairs(_vc6fyn0wo88:GetChildren()) do
        local n = string.lower(stat.Name)
        for _, p in ipairs(_vsu88gzvxn2) do
            if string.find(n, p) and stat:IsA(_S("123|209|220|231|240|224|189|220|238|224")) then
                return stat.Value
            end
        end
    end
    return 0
end

local function _vze9z0i2h17()
    return _vwmgl7t279v({_S("94|193|191|209|198"), _S("124|233|235|234|225|245"), _S("113|212|224|218|223"), _S("81|184|192|189|181"), _S("124|222|221|232|221|234|223|225"), _S("67|165|184|166|174|182")})
end

local function _vj5d9fbfg8v()
    return _vwmgl7t279v({_S("64|183|165|169|167|168|180"), _S("119|218|216|233|233|240"), "kg", _S("92|200|203|189|192"), _S("78|176|175|177|185|190|175|177|185")})
end

local function _vriuf5arb8y()
    local cap = _vwmgl7t279v({_S("87|186|184|199|184|186|192|203|208"), _S("114|223|211|234|213|211|228|228|235"), _S("110|219|207|230"), _S("76|184|181|185|181|192"), _S("64|162|161|163|171|176|161|163|171")})
    if cap > 0 then return cap end
    local obj = _vx06boh6bcr:FindFirstChild(_S("100|166|197|199|207|212|197|199|207|167|197|212|197|199|205|216|221")) or _vx06boh6bcr:FindFirstChild(_S("63|140|160|183|130|160|177|177|184"))
    if obj and obj:IsA(_S("72|158|169|180|189|173|138|169|187|173")) then return obj.Value end
    return 100
end

local function _vj2ov12zgt0()
    if _vsmeofirta7.UnlimitedBackpack then return false end
    local _v5gicn62bvj = _vj5d9fbfg8v()
    local cap = _vriuf5arb8y()
    if cap > 0 and _v5gicn62bvj > 0 then return _v5gicn62bvj >= cap * 0.92 end
    return false
end

local function _v8fyegonyjz(root)
    if not _vsmeofirta7.BypassPromptHold or not root then return end
    pcall(function()
        for _, d in ipairs(root:GetDescendants()) do
            if d:IsA(_S("117|197|231|228|237|222|226|222|233|238|197|231|228|226|229|233")) then
                d.HoldDuration = 0
                d.MaxActivationDistance = math.max(d.MaxActivationDistance, 20)
            end
        end
    end)
end

local function _vctvsiqh9rz()
    if not _vsmeofirta7.AutoEquipPickaxe then return end
    pcall(function()
        local bestTool, bestScore = nil, -1
        local function _vhvbaxt7r72(tool)
            if not tool:IsA(_S("104|188|215|215|212")) then return -1 end
            local n = string.lower(tool.Name)
            if not (string.find(n, _S("64|176|169|163|171")) or string.find(n, _S("94|191|214|195")) or string.find(n, _S("117|217|231|222|225|225")) or string.find(n, _S("65|181|176|176|173")) or string.find(n, _S("70|174|167|179|179|171|184"))) then
                return 0
            end
            local s = 0
            if string.find(n, _S("109|209|214|206|218|220|219|209")) then s = s + 100
            elseif string.find(n, _S("106|209|217|214|206")) then s = s + 80
            elseif string.find(n, _S("127|232|241|238|237")) then s = s + 50
            elseif string.find(n, _S("69|184|185|180|179|170")) then s = s + 20 end
            for _, d in ipairs(tool:GetDescendants()) do
                if d:IsA(_S("76|162|173|184|193|177|142|173|191|177")) and (string.find(string.lower(d.Name), _S("102|210|203|220|203|210")) or string.find(string.lower(d.Name), _S("93|209|198|194|207"))) then
                    s = s + d.Value * 10
                end
            end
            return s
        end
        local function scan(container)
            if not container then return end
            for _, t in ipairs(container:GetChildren()) do
                local sc = _vhvbaxt7r72(t)
                if sc > bestScore then bestScore, bestTool = sc, t end
            end
        end
        scan(_vx06boh6bcr.Backpack)
        scan(Character)
        if bestTool and Character and not Character:FindFirstChild(bestTool.Name) then
            _v59l4xsoenu:EquipTool(bestTool)
        end
    end)
end

local function _vlxa99ji0h0()
    local drops = {}
    local _vsu88gzvxn2 = {_S("68|168|182|179|180"), _S("110|218|221|221|226"), _S("110|215|226|211|219"), _S("70|182|175|169|177|187|182"), _S("102|201|213|210|210|203|201|218"), _S("73|184|187|174"), _S("62|165|163|171"), _S("75|174|189|196|190|191|172|183")}
    local function scan(parent)
        for _, child in ipairs(parent:GetChildren()) do
            local nl = string.lower(child.Name)
            if child:IsA(_S("107|173|204|222|208|187|204|221|223")) or child:IsA(_S("113|190|224|213|214|221")) then
                for _, p in ipairs(_vsu88gzvxn2) do
                    if string.find(nl, p) then
                        local part = child:IsA(_S("76|142|173|191|177|156|173|190|192")) and child or child:FindFirstChildWhichIsA(_S("76|142|173|191|177|156|173|190|192"))
                        if part then
                            local dist = _vjkfw6dexbg(part)
                            if dist <= _vsmeofirta7.FarmRadius then
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
    scan(_vtz2kf5z6jx)
    table.sort(drops, function(a, b) return a.Distance < b.Distance end)
    return drops
end

local function _vsomwy5u569()
    if not _vsmeofirta7.AutoCollectDrops then return end
    local drops = _vlxa99ji0h0()
    for i = 1, math.min(3, #drops) do
        local drop = drops[i]
        _v227syc5l79(drop.Part.Position)
        if HasFireTouch then
            Exec.FireTouch(_vel45wbkgbl, drop.Part, 0)
            task.wait(0.01)
            Exec.FireTouch(_vel45wbkgbl, drop.Part, 1)
        end
        _vi7orqo253n(_S("121|233|226|220|228|238|233"))
        _vi7orqo253n(_S("88|187|199|196|196|189|187|204"))
        _vi7orqo253n(_S("75|183|186|186|191"))
    end
end

local function _vqcki4c7afw()
    if _vsmeofirta7.AutoBuyPickaxe then
        _vi7orqo253n(_S("84|196|189|183|191|181|204|185")); _vi7orqo253n(_S("80|178|197|201|175|192|185|179|187|177|200|181")); _vi7orqo253n(_S("101|218|213|204|215|198|201|202|196|213|206|200|208|198|221|202"))
    end
    if _vsmeofirta7.AutoBuyBackpack then
        _vi7orqo253n(_S("84|182|181|183|191|196|181|183|191")); _vi7orqo253n(_S("106|205|203|218|203|205|211|222|227")); _vi7orqo253n(_S("77|194|189|180|191|174|177|178|172|175|174|176|184|189|174|176|184"))
    end
    if _vsmeofirta7.AutoBuyLuck then
        _vi7orqo253n(_S("104|212|221|203|211")); _vi7orqo253n(_S("73|173|178|176|168|181|190|172|180")); _vi7orqo253n(_S("77|185|194|176|184|198"))
    end
    if _vsmeofirta7.AutoBuyWarmth then
        _vi7orqo253n(_S("64|183|161|178|173|180|168")); _vi7orqo253n(_S("108|212|209|205|224")); _vi7orqo253n(_S("71|170|168|180|183|173|176|185|172"))
    end
    if _vsmeofirta7.AutoUpgrade then
        _vi7orqo253n(_S("115|232|227|218|229|212|215|216")); _vi7orqo253n(_S("76|174|193|197")); _vi7orqo253n(_S("71|183|188|185|170|175|168|186|172"))
    end
end

local function _vrmllf5cso2()
    if not _vsmeofirta7.AutoRebirth then return end
    if _vze9z0i2h17() >= _vsmeofirta7.RebirthCashThreshold then
        _vi7orqo253n(_S("111|225|212|209|216|225|227|215")); _vi7orqo253n(_S("84|196|198|185|199|200|189|187|185")); _vi7orqo253n(_S("121|235|222|236|222|237")); _vi7orqo253n(_S("99|196|214|198|200|209|199"))
        _vrt94ifoowp(_S("112|177|229|228|223|144|226|213|210|217|226|228|216|144|209|228|228|213|221|224|228|213|212|144|209|228|144") .. _vze9z0i2h17() .. _S("117|149|216|214|232|221"))
    end
end

local function _vbi8cpg1csu()
    if not _vsmeofirta7.AutoClaimDaily then return end
    _vi7orqo253n(_S("123|223|220|228|231|244")); _vi7orqo253n(_S("72|186|173|191|169|186|172")); _vi7orqo253n(_S("130|229|238|227|235|239")); _vi7orqo253n(_S("68|176|179|171|173|178"))
    _vi7orqo253n(_S("65|164|176|165|166")); _vi7orqo253n(_S("129|243|230|229|230|230|238"))
    if _vsmeofirta7.PromoCode ~= "" then
        _vi7orqo253n(_S("92|191|203|192|193"), _vsmeofirta7.PromoCode)
        _vi7orqo253n(_S("98|212|199|198|199|199|207"), _vsmeofirta7.PromoCode)
    end
end

local function _vh2lkeun35k()
    if _vj2ov12zgt0() and _vsmeofirta7.SellWhenFull then return true end
    if _vsmeofirta7.SellMinCash > 0 and _vze9z0i2h17() >= _vsmeofirta7.SellMinCash then return true end
    return false
end

local function _v3qkrkdrh4c()
    _vrt94ifoowp(_S("124|192|238|235|236|156|224|241|236|225|182|156|236|229|223|231|241|236|156|239|236|221|233|170|170|170"))
    pcall(function()
        local tool = Character and Character:FindFirstChildOfClass(_S("94|178|205|205|202"))
        if tool then
            tool.Parent = _vx06boh6bcr.Backpack
            task.wait(0.1)
            _v59l4xsoenu:EquipTool(tool)
        end
        for i = 1, _vsmeofirta7.DupeAmount do
            _vi7orqo253n(_S("113|213|227|224|225")); _vi7orqo253n(_S("104|216|209|203|211|221|216")); _vi7orqo253n(_S("66|165|177|174|174|167|165|182"))
            task.wait(0.05)
        end
    end)
end

local function _v34z1aqe1cr(cframe)
    if not _vbbnplrdpcz() then return false end
    _vel45wbkgbl.CFrame = cframe + Vector3.new(0, 3, 0)
    task.wait(_vsmeofirta7.TeleportDelay)
    return true
end

local function _vchfhds1sze(scrollingFrame)
    for _, child in ipairs(scrollingFrame:GetChildren()) do
        if not child:IsA(_S("81|166|154|157|186|196|197|157|178|202|192|198|197")) and not child:IsA(_S("125|210|198|205|222|225|225|230|235|228")) then
            child:Destroy()
        end
    end
end

local function _vrt94ifoowp(message)
    local _v9l3tbsgjet = os.date(_S("94|131|166|152|131|171|152|131|177"))
    table.insert(State.Logs, 1, "[" .. _v9l3tbsgjet .. "] " .. message)
    if #State.Logs > 50 then
        table.remove(State.Logs)
    end
    if LogList then
        pcall(function()
            _vchfhds1sze(LogList)
            for i, log in ipairs(State.Logs) do
                if i > 15 then break end
                local label = Instance.new(_S("112|196|213|232|228|188|209|210|213|220"))
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

local function _vb3f0c4qsg1()
    State.RemoteCache = {}
    pcall(function()
        for _, remote in ipairs(_vzsy132cush:GetDescendants()) do
            if remote:IsA(_S("130|212|231|239|241|246|231|199|248|231|240|246")) or remote:IsA(_S("101|183|202|210|212|217|202|171|218|211|200|217|206|212|211")) then
                table.insert(State.RemoteCache, {
                    Instance = remote,
                    Name = remote.Name,
                    Type = remote.ClassName,
                })
            end
        end
    end)
    _vrt94ifoowp(_S("65|132|162|164|169|166|165|97") .. #State.RemoteCache .. _S("83|115|197|184|192|194|199|184|198"))
end

local function _vi7orqo253n(namePattern, ...)
    local args = {...}
    for _, remote in ipairs(State.RemoteCache) do
        local rName = string.lower(remote.Name)
        local _vp1l3t7h8c2 = string.lower(namePattern)
        if string.find(rName, _vp1l3t7h8c2) then
            pcall(function()
                if remote.Type == _S("80|162|181|189|191|196|181|149|198|181|190|196") then
                    remote.Instance:FireServer(Exec.Unpack(args))
                elseif remote.Type == _S("91|173|192|200|202|207|192|161|208|201|190|207|196|202|201") then
                    remote.Instance:InvokeServer(Exec.Unpack(args))
                end
            end)
        end
    end
end

local function _vk7oxugk3rw(name, ...)
    local args = {...}
    for _, remote in ipairs(State.RemoteCache) do
        if remote.Name == name then
            pcall(function()
                if remote.Type == _S("90|172|191|199|201|206|191|159|208|191|200|206") then
                    remote.Instance:FireServer(Exec.Unpack(args))
                elseif remote.Type == _S("79|161|180|188|190|195|180|149|196|189|178|195|184|190|189") then
                    remote.Instance:InvokeServer(Exec.Unpack(args))
                end
            end)
            return true
        end
    end
    return false
end

local _vd29ebaemm5 = {
    _S("129|243|240|228|236"), _S("113|224|227|214"), _S("65|180|181|176|175|166"), _S("100|209|205|210|201|214|197|208"), _S("83|182|197|204|198|199|180|191"), _S("108|211|209|217"), _S("84|183|195|181|192"), _S("79|184|193|190|189"),
    _S("88|191|199|196|188"), _S("66|166|171|163|175|177|176|166"), _S("94|193|205|206|206|195|208"), _S("110|225|215|218|228|211|224"), _S("95|209|212|193|216"), _S("105|206|214|206|219|202|213|205"), _S("130|245|227|242|242|234|235|244|231"),
    _S("96|193|205|197|212|200|217|211|212"), _S("128|238|239|228|229"), _S("88|206|189|193|198"), _S("96|196|197|208|207|211|201|212"), _S("84|182|195|201|192|184|185|198"), _S("101|216|217|198|215|216|198|213|213|205|206|215|202"),
    _S("114|230|225|226|211|236"), _S("104|215|216|201|212"), _S("113|225|214|210|227|221"), _S("115|221|212|215|216"), _S("67|180|184|164|181|183|189"), _S("100|211|198|215|205|200|205|197|210"), _S("66|174|163|178|171|181"),
    _S("71|180|176|187|175|185|176|179"), _S("93|209|198|209|190|203|198|210|202"), _S("126|238|234|223|242|231|236|243|235"), _S("87|199|188|201|192|187|198|203"), _S("116|238|221|230|215|227|226"), _S("66|169|163|180|176|167|182"),
    _S("129|226|242|246|226|238|226|243|234|239|230"), _S("112|211|217|228|226|217|222|213"), _S("67|183|164|177|189|164|177|172|183|168"), _S("74|183|185|185|184|189|190|185|184|175"), _S("106|221|223|216|221|222|217|216|207"),
    _S("83|181|191|194|194|183|198|199|194|193|184"), _S("123|234|233|244|243"), _S("114|230|225|231|228|223|211|222|219|224|215"), _S("79|194|191|184|189|180|187"), _S("104|202|205|218|225|212"), _S("127|226|231|224|235|226|228|227|238|237|248"),
}

local function _vvobjxev3un()
    local rocks = {}
    local function _vf6y0ex0cav(parent)
        if not parent then return end
        for _, child in ipairs(parent:GetChildren()) do
            local _v23xerysggr = string.lower(child.Name)
            if child:IsA(_S("66|132|163|181|167|146|163|180|182")) or child:IsA(_S("68|145|179|168|169|176")) then
                local _vqfrkwo0gry = false
                for _, _vp1l3t7h8c2 in ipairs(_vd29ebaemm5) do
                    if string.find(_v23xerysggr, _vp1l3t7h8c2) then
                        _vqfrkwo0gry = true
                        break
                    end
                end
                if _vqfrkwo0gry and _v45b4qojrot(_v23xerysggr) then
                    local part = child:IsA(_S("94|160|191|209|195|174|191|208|210")) and child or child:FindFirstChildWhichIsA(_S("101|167|198|216|202|181|198|215|217"))
                    if part then
                        local dist = _vjkfw6dexbg(part)
                        if dist <= _vsmeofirta7.FarmRadius then

                            local value = 0
                            pcall(function()
                                local val = child:FindFirstChild(_S("112|198|209|220|229|213")) or child:FindFirstChild(_S("95|175|209|200|194|196")) or child:FindFirstChild(_S("115|202|226|229|231|219")) or child:FindFirstChild(_S("108|194|205|216|225|209|187|226|209|222|222|213|208|209"))
                                if val and val:IsA(_S("76|162|173|184|193|177|142|173|191|177")) then
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
                    _vf6y0ex0cav(child)
                end
            end
        end
    end

    local _vf3f40nta0l = {
        _vtz2kf5z6jx:FindFirstChild(_S("127|209|238|226|234|242")),
        _vtz2kf5z6jx:FindFirstChild(_S("87|166|201|188|202")),
        _vtz2kf5z6jx:FindFirstChild(_S("76|153|181|186|177|190|173|184|191")),
        _vtz2kf5z6jx:FindFirstChild(_S("113|190|218|223|214|228")),
        _vtz2kf5z6jx:FindFirstChild(_S("76|158|177|191|187|193|190|175|177|191")),
        _vtz2kf5z6jx:FindFirstChild(_S("117|194|214|229")),
        _vtz2kf5z6jx:FindFirstChild(_S("127|211|228|241|241|224|232|237")),
        _vtz2kf5z6jx:FindFirstChild(_S("92|159|206|213|207|208|189|200|207")),
        _vtz2kf5z6jx:FindFirstChild(_S("110|187|221|227|220|226|207|215|220")),
        _vtz2kf5z6jx,
    }

    for _, area in ipairs(_vf3f40nta0l) do
        if area then
            _vf6y0ex0cav(area)
        end
    end

    if _vsmeofirta7.PriorityHighestValue then
        table.sort(rocks, function(a, b) return a.Value > b.Value end)
    elseif _vsmeofirta7.PriorityClosest then
        table.sort(rocks, function(a, b) return a.Distance < b.Distance end)
    end

    return rocks
end

local function _v2e183n3k8o()
    local shops = {}
    local function _v8dsepcs6to(parent)
        if not parent then return end
        for _, child in ipairs(parent:GetChildren()) do
            local _v23xerysggr = string.lower(child.Name)
            if child:IsA(_S("117|194|228|217|218|225")) or child:IsA(_S("73|139|170|188|174|153|170|187|189")) then
                if string.find(_v23xerysggr, _S("129|244|233|240|241")) or string.find(_v23xerysggr, _S("72|187|173|180|180")) or
                   string.find(_v23xerysggr, _S("97|212|213|208|211|198")) or string.find(_v23xerysggr, _S("98|207|199|212|197|202|195|208|214")) or
                   string.find(_v23xerysggr, _S("79|195|193|176|179|180|193")) or string.find(_v23xerysggr, _S("88|188|189|185|196|189|202")) or
                   string.find(_v23xerysggr, _S("107|216|204|221|214|208|223")) or string.find(_v23xerysggr, _S("127|245|228|237|227|238|241")) or
                   string.find(_v23xerysggr, _S("77|176|174|192|181|182|178|191")) or string.find(_v23xerysggr, _S("68|166|185|189|169|182")) or
                   string.find(_v23xerysggr, _S("91|201|203|190")) or string.find(_v23xerysggr, _S("122|221|219|237|226")) or
                   string.find(_v23xerysggr, _S("102|206|213|211|203")) or string.find(_v23xerysggr, _S("80|178|177|195|181")) or
                   string.find(_v23xerysggr, _S("91|190|188|200|203")) then
                    local part = child:IsA(_S("95|161|192|210|196|175|192|209|211")) and child or child:FindFirstChildWhichIsA(_S("120|186|217|235|221|200|217|234|236")) or child:FindFirstChild(_S("87|159|204|196|184|197|198|192|187|169|198|198|203|167|184|201|203"))
                    if part then
                        local dist = _vjkfw6dexbg(part)
                        table.insert(shops, {
                            Instance = child,
                            Part = part,
                            Distance = dist,
                            Name = child.Name,
                        })
                    end
                end
                if #child:GetChildren() > 0 then
                    _v8dsepcs6to(child)
                end
            end
        end
    end

    _v8dsepcs6to(_vtz2kf5z6jx)
    table.sort(shops, function(a, b) return a.Distance < b.Distance end)
    return shops
end

local function _viazvpfsl4r(rockData)
    local rock = rockData.Instance
    local part = rockData.Part

    if not rock or not rock.Parent then return false end

    _vctvsiqh9rz()
    _v8fyegonyjz(rock)

    _vrt94ifoowp(_S("108|185|213|218|213|218|211|166|140") .. rockData.Name)

    _v227syc5l79(part.Position)
    task.wait(0.05)

    local function _ve45xk2cjbf()

        if HasFireClick then
            local clickDetector = rock:FindFirstChildOfClass(_S("122|189|230|227|221|229|190|223|238|223|221|238|233|236")) or part:FindFirstChildOfClass(_S("70|137|178|175|169|177|138|171|186|171|169|186|181|184"))
            if clickDetector then Exec.FireClick(clickDetector) end
        end
        if HasFireProximity then
            local prompt = rock:FindFirstChildOfClass(_S("67|147|181|178|187|172|176|172|183|188|147|181|178|176|179|183")) or part:FindFirstChildOfClass(_S("78|158|192|189|198|183|187|183|194|199|158|192|189|187|190|194"))
            if prompt then
                if _vsmeofirta7.BypassPromptHold then prompt.HoldDuration = 0 end
                Exec.FireProximity(prompt)
            end
        end
        if HasFireTouch then
            Exec.FireTouch(_vel45wbkgbl, part, 0)
            task.wait(0.01)
            Exec.FireTouch(_vel45wbkgbl, part, 1)
        end

        local tool = Character and Character:FindFirstChildOfClass(_S("100|184|211|211|208"))
        if tool then tool:Activate() end

        _vi7orqo253n(_S("91|200|196|201|192")); _vi7orqo253n(_S("128|232|225|242|246|229|243|244")); _vi7orqo253n(_S("92|191|203|200|200|193|191|208"))
        _vi7orqo253n(_S("91|189|205|192|188|198")); _vi7orqo253n(_S("104|207|201|220|208|205|218")); _vi7orqo253n(_S("88|188|193|191"))
        _vi7orqo253n(_S("130|242|235|229|237")); _vi7orqo253n(_S("66|181|185|171|176|169"))

        for _, remote in ipairs(State.RemoteCache) do
            local rName = string.lower(remote.Name)
            if string.find(rName, _S("75|184|180|185|176")) or string.find(rName, _S("111|211|216|214")) or string.find(rName, _S("111|215|208|225|229|212|226|227")) then
                pcall(function()
                    if remote.Type == _S("76|158|177|185|187|192|177|145|194|177|186|192") then
                        remote.Instance:FireServer(rock, part)
                    elseif remote.Type == _S("126|208|227|235|237|242|227|196|243|236|225|242|231|237|236") then
                        remote.Instance:InvokeServer(rock, part)
                    end
                end)
            end
        end
    end

    local hits = _vsmeofirta7.RapidMine and _vsmeofirta7.RapidMineCount or 1
    for _ = 1, hits do
        _ve45xk2cjbf()
        if hits > 1 then task.wait(0.03) end
    end

    _vsomwy5u569()
    State.FarmCount = State.FarmCount + 1
    pcall(function() _vmeukg1injd(rockData.Name) end)

    return true
end

local function _vzv4nm24j68(shopData)
    if not shopData then return false end

    local shop = shopData.Instance
    local part = shopData.Part

    _vrt94ifoowp(_S("99|182|200|207|207|204|209|202|131|196|215|157|131") .. shopData.Name)

    _v227syc5l79(part.Position)
    task.wait(0.1)

    if HasFireClick then
        local clickDetector = shop:FindFirstChildOfClass(_S("106|173|214|211|205|213|174|207|222|207|205|222|217|220")) or part:FindFirstChildOfClass(_S("66|133|174|171|165|173|134|167|182|167|165|182|177|180"))
        if clickDetector then Exec.FireClick(clickDetector) end
    end

    if HasFireProximity then
        local prompt = shop:FindFirstChildOfClass(_S("88|168|202|199|208|193|197|193|204|209|168|202|199|197|200|204")) or part:FindFirstChildOfClass(_S("95|175|209|206|215|200|204|200|211|216|175|209|206|204|207|211"))
        if prompt then Exec.FireProximity(prompt) end
    end

    if HasFireTouch then
        Exec.FireTouch(_vel45wbkgbl, part, 0)
        task.wait(0.01)
        Exec.FireTouch(_vel45wbkgbl, part, 1)
    end

    _vi7orqo253n(_S("94|209|195|202|202"))
    _vi7orqo253n(_S("67|182|171|178|179"))
    _vi7orqo253n(_S("103|212|200|217|210|204|219"))
    _vi7orqo253n(_S("78|194|192|175|178|179"))
    _vi7orqo253n(_S("75|174|172|190|179"))
    _vi7orqo253n(_S("67|176|178|177|168|188"))
    _vi7orqo253n(_S("92|207|193|200|200|189|200|200"))
    _vi7orqo253n(_S("127|242|228|235|235|222|224|235|235"))

    State.SellCount = State.SellCount + 1

    return true
end

local function _vqm4vfjxvqc()
    if State.FarmConnection then return end
    _vrt94ifoowp(_S("87|152|204|203|198|119|157|184|201|196|119|170|171|152|169|171|156|155"))

    State.FarmConnection = true
    task.spawn(function()
        while _vsmeofirta7.AutoFarm and State.FarmConnection do
            if _vbbnplrdpcz() then
                local rocks = _vvobjxev3un()
                if #rocks > 0 then
                    local _vhols2g7hng = rocks[1]
                    State.CurrentTarget = _vhols2g7hng.Name
                    _viazvpfsl4r(_vhols2g7hng)
                else
                    State.CurrentTarget = _S("121|204|222|218|235|220|225|226|231|224|167|167|167")
                end
            end
            task.wait(_vsmeofirta7.FarmDelay)
        end
    end)
end

local function _vdvnank3aq7()
    State.FarmConnection = nil
    State.CurrentTarget = _S("128|206|239|238|229")
    _vrt94ifoowp(_S("108|173|225|224|219|140|178|205|222|217|140|191|192|187|188|188|177|176"))
end

local function _vwt78vhjd68()
    if State.SellConnection then return end
    _vrt94ifoowp(_S("61|126|178|177|172|93|144|162|169|169|93|144|145|126|143|145|130|129"))

    State.SellConnection = true
    task.spawn(function()
        while _vsmeofirta7.AutoSell and State.SellConnection do
            if _vbbnplrdpcz() then
                local _varx5m4o26m = true
                if _vsmeofirta7.SellWhenFull and not _vj2ov12zgt0() then _varx5m4o26m = false end
                if _vsmeofirta7.SellMinCash > 0 and _vze9z0i2h17() < _vsmeofirta7.SellMinCash then _varx5m4o26m = false end
                if _varx5m4o26m then
                    local shops = _v2e183n3k8o()
                    if #shops > 0 then
                        _vzv4nm24j68(shops[1])
                        pcall(_vcyzz459a6u)
                    end
                end
            end
            task.wait(_vsmeofirta7.SellDelay)
        end
    end)
end

local function _vjh4g4kgmcj()
    State.SellConnection = nil
    _vrt94ifoowp(_S("83|148|200|199|194|115|166|184|191|191|115|166|167|162|163|163|152|151"))
end

local function _vktf3lx0p2j()
    if State.UpgradeConn then return end
    _vrt94ifoowp(_S("62|127|179|178|173|94|147|174|165|176|159|162|163|94|145|146|127|144|146|131|130"))

    State.UpgradeConn = true
    task.spawn(function()
        while _vsmeofirta7.AutoUpgrade and State.UpgradeConn do
            _vi7orqo253n(_S("90|207|202|193|204|187|190|191"))
            _vi7orqo253n(_S("82|180|199|203"))
            _vi7orqo253n(_S("72|184|189|186|171|176|169|187|173"))
            _vi7orqo253n(_S("67|186|164|181|176|183|171"))
            _vi7orqo253n(_S("89|201|194|188|196|186|209|190"))
            _vi7orqo253n(_S("105|203|202|204|212|217|202|204|212"))
            _vi7orqo253n(_S("117|232|229|218|218|217"))
            _vi7orqo253n(_S("69|169|174|172"))

            State.UpgradeCount = State.UpgradeCount + 1
            task.wait(1)
        end
    end)
end

local function _v1e2061dn0o()
    State.UpgradeConn = nil
    _vrt94ifoowp(_S("122|187|239|238|233|154|207|234|225|236|219|222|223|154|205|206|201|202|202|191|190"))
end

local function _vqwrb1dvkio()
    for _, _vunaj09hri2 in ipairs(State.ESPHighlights) do
        pcall(function() _vunaj09hri2:Destroy() end)
    end
    State.ESPHighlights = {}
end

local function _v0jmlrogbik()
    _vqwrb1dvkio()

    local rocks = _vvobjxev3un()
    for _, rock in ipairs(rocks) do
        if rock.Instance and rock.Instance.Parent then

            local _vunaj09hri2 = Instance.new(_S("127|199|232|230|231|235|232|230|231|243"))
            _vunaj09hri2.Name = _S("79|148|162|159|174") .. rock.Name
            _vunaj09hri2.FillTransparency = 0.6
            _vunaj09hri2.OutlineTransparency = 0
            _vunaj09hri2.OutlineColor = rock.Value > 0 and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(100, 200, 255)
            _vunaj09hri2.FillColor = rock.Value > 0 and Color3.fromRGB(255, 200, 50) or Color3.fromRGB(80, 150, 255)
            _vunaj09hri2.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            _vunaj09hri2.Parent = rock.Instance

            local _v66ogxjka3p = Instance.new(_S("113|179|218|221|221|211|224|210|227|213|184|230|218"))
            _v66ogxjka3p.Name = _S("115|184|198|195|191|212|213|216|223")
            _v66ogxjka3p.Size = UDim2.new(0, 120, 0, 30)
            _v66ogxjka3p.StudsOffset = Vector3.new(0, 3, 0)
            _v66ogxjka3p.AlwaysOnTop = true
            _v66ogxjka3p.Parent = rock.Part

            local label = Instance.new(_S("108|192|209|228|224|184|205|206|209|216"))
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 0.4
            label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            label.Text = rock.Name .. " [" .. math.floor(rock.Distance) .. "m]" .. (rock.Value > 0 and (_S("67|99|191|99|103") .. tostring(rock.Value)) or "")
            label.TextColor3 = rock.Value > 0 and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(100, 200, 255)
            label.Font = Enum.Font.GothamBold
            label.TextSize = 11
            label.Parent = _v66ogxjka3p

            local _vk8zjwr4xmy = Instance.new(_S("126|211|199|193|237|240|236|227|240"))
            _vk8zjwr4xmy.CornerRadius = UDim.new(0, 4)
            _vk8zjwr4xmy.Parent = label

            table.insert(State.ESPHighlights, _vunaj09hri2)
            table.insert(State.ESPHighlights, _v66ogxjka3p)
        end
    end

    local shops = _v2e183n3k8o()
    for _, shop in ipairs(shops) do
        if shop.Instance and shop.Instance.Parent then
            local _vunaj09hri2 = Instance.new(_S("71|143|176|174|175|179|176|174|175|187"))
            _vunaj09hri2.Name = _S("101|170|184|181|196|184|205|212|213|196") .. shop.Name
            _vunaj09hri2.FillTransparency = 0.5
            _vunaj09hri2.OutlineTransparency = 0
            _vunaj09hri2.OutlineColor = Color3.fromRGB(0, 255, 100)
            _vunaj09hri2.FillColor = Color3.fromRGB(50, 255, 100)
            _vunaj09hri2.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            _vunaj09hri2.Parent = shop.Instance

            local _v66ogxjka3p = Instance.new(_S("87|153|192|195|195|185|198|184|201|187|158|204|192"))
            _v66ogxjka3p.Name = _S("88|157|171|168|171|192|199|200|164|185|186|189|196")
            _v66ogxjka3p.Size = UDim2.new(0, 100, 0, 25)
            _v66ogxjka3p.StudsOffset = Vector3.new(0, 3, 0)
            _v66ogxjka3p.AlwaysOnTop = true
            _v66ogxjka3p.Parent = shop.Part

            local label = Instance.new(_S("92|176|193|212|208|168|189|190|193|200"))
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 0.4
            label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            label.Text = _S("79|162|151|158|159|137|111") .. shop.Name
            label.TextColor3 = Color3.fromRGB(0, 255, 100)
            label.Font = Enum.Font.GothamBold
            label.TextSize = 10
            label.Parent = _v66ogxjka3p

            table.insert(State.ESPHighlights, _vunaj09hri2)
            table.insert(State.ESPHighlights, _v66ogxjka3p)
        end
    end

    _vrt94ifoowp(_S("110|179|193|190|168|142") .. #rocks .. _S("109|141|223|220|208|216|224|153|141") .. #shops .. _S("111|143|226|215|222|223|226"))
end

local function _vny6s7oqta2()
    if _vsmeofirta7.ESPEnabled then
        _v0jmlrogbik()

        task.spawn(function()
            while _vsmeofirta7.ESPEnabled do
                task.wait(5)
                if _vsmeofirta7.ESPEnabled then
                    _v0jmlrogbik()
                end
            end
        end)
    end
end

local function _v7m2pu549r4()
    _vqwrb1dvkio()
end

local function _vf3ja8z4q71()
    if State.AntiDamageConn then return end
    _vrt94ifoowp(_S("87|152|197|203|192|119|155|184|196|184|190|188|119|156|165|152|153|163|156|155"))

    State.AntiDamageConn = _vwgqjmt2dvj.Heartbeat:Connect(function()
        if not _vbbnplrdpcz() then return end

        if _v59l4xsoenu and _v59l4xsoenu.Health < _v59l4xsoenu.MaxHealth then
            _v59l4xsoenu.Health = _v59l4xsoenu.MaxHealth
        end

        if _vsmeofirta7.AntiFreeze then
            pcall(function()

                local _vt2yr5hy474 = Character:FindFirstChild(_S("60|147|157|174|169|176|164")) or Character:FindFirstChild(_S("102|186|203|211|214|203|216|199|218|219|216|203")) or Character:FindFirstChild(_S("87|154|198|195|187"))
                if _vt2yr5hy474 and _vt2yr5hy474:IsA(_S("60|146|157|168|177|161|126|157|175|161")) then
                    _vt2yr5hy474.Value = 100
                end

                local _vn1wjl8zdfu = Character:FindFirstChild(_S("91|161|205|202|213|192|201")) or Character:FindFirstChild(_S("98|171|213|168|212|209|220|199|208")) or Character:FindFirstChild(_S("104|174|218|205|205|226|209|214|207"))
                if _vn1wjl8zdfu and _vn1wjl8zdfu:IsA(_S("72|138|183|183|180|158|169|180|189|173")) then
                    _vn1wjl8zdfu.Value = false
                end

                _vi7orqo253n(_S("124|243|221|238|233|240|228"))
                _vi7orqo253n(_S("77|194|187|179|191|178|178|199|178"))
                _vi7orqo253n(_S("94|198|195|191|210"))
            end)
        end
    end)
end

local function _v9ns80d8eqi()
    if State.AntiDamageConn then
        State.AntiDamageConn:Disconnect()
        State.AntiDamageConn = nil
    end
    _vrt94ifoowp(_S("82|147|192|198|187|114|150|179|191|179|185|183|114|150|155|165|147|148|158|151|150"))
end

local function _vo4cwbuvgdi()
    if not _vsmeofirta7.UnlimitedBackpack then return end
    _vrt94ifoowp(_S("118|183|230|230|226|239|223|228|221|150|203|228|226|223|227|223|234|219|218|150|184|215|217|225|230|215|217|225|164|164|164"))

    pcall(function()

        local _v76v7qqlbdm = _vx06boh6bcr:FindFirstChild(_S("94|160|191|193|201|206|191|193|201|161|191|206|191|193|199|210|215")) or _vx06boh6bcr:FindFirstChild(_S("104|181|201|224|171|201|218|218|225")) or _vx06boh6bcr:FindFirstChild(_S("91|158|188|205|205|212|166|162"))
        if _v76v7qqlbdm and _v76v7qqlbdm:IsA(_S("125|211|222|233|242|226|191|222|240|226")) then
            _v76v7qqlbdm.Value = 999999
        end

        local _vc6fyn0wo88 = _vx06boh6bcr:FindFirstChild(_S("96|204|197|193|196|197|210|211|212|193|212|211"))
        if _vc6fyn0wo88 then
            for _, stat in ipairs(_vc6fyn0wo88:GetChildren()) do
                local _v23xerysggr = string.lower(stat.Name)
                if string.find(_v23xerysggr, _S("122|220|219|221|229|234|219|221|229")) or string.find(_v23xerysggr, _S("91|190|188|205|205|212")) or string.find(_v23xerysggr, _S("90|189|187|202|187|189|195|206|211")) or string.find(_v23xerysggr, _S("76|195|177|181|179|180|192")) or string.find(_v23xerysggr, "kg") then
                    if stat:IsA(_S("128|214|225|236|245|229|194|225|243|229")) then
                        stat.Value = 999999
                    end
                end
            end
        end

        _vi7orqo253n(_S("115|213|212|214|222|227|212|214|222"))
        _vi7orqo253n(_S("69|168|166|181|166|168|174|185|190"))
        _vi7orqo253n(_S("116|215|213|230|230|237"))
        _vi7orqo253n(_S("63|180|175|166|177|160|163|164|158|161|160|162|170|175|160|162|170"))
    end)

    task.spawn(function()
        while _vsmeofirta7.UnlimitedBackpack do
            task.wait(2)
            pcall(function()
                local _vc6fyn0wo88 = _vx06boh6bcr:FindFirstChild(_S("71|179|172|168|171|172|185|186|187|168|187|186"))
                if _vc6fyn0wo88 then
                    for _, stat in ipairs(_vc6fyn0wo88:GetChildren()) do
                        local _v23xerysggr = string.lower(stat.Name)
                        if string.find(_v23xerysggr, _S("114|212|211|213|221|226|211|213|221")) or string.find(_v23xerysggr, _S("88|187|185|202|202|209")) or string.find(_v23xerysggr, _S("105|204|202|217|202|204|210|221|226")) or string.find(_v23xerysggr, _S("85|204|186|190|188|189|201")) or string.find(_v23xerysggr, "kg") then
                            if stat:IsA(_S("112|198|209|220|229|213|178|209|227|213")) then
                                stat.Value = 999999
                            end
                        end
                    end
                end
            end)
        end
    end)
end

local function _v5jle2kjnso()
    if not _vsmeofirta7.UnlimitedLuck then return end
    _vrt94ifoowp(_S("100|165|212|212|208|221|205|210|203|132|185|210|208|205|209|205|216|201|200|132|176|217|199|207|146|146|146"))

    pcall(function()

        local _vwjzpvixuj2 = _vx06boh6bcr:FindFirstChild(_S("128|204|245|227|235")) or _vx06boh6bcr:FindFirstChild(_S("94|162|199|197|170|211|193|201")) or _vx06boh6bcr:FindFirstChild(_S("78|155|183|188|183|188|181|154|195|177|185"))
        if _vwjzpvixuj2 and _vwjzpvixuj2:IsA(_S("97|183|194|205|214|198|163|194|212|198")) then
            _vwjzpvixuj2.Value = 999999
        end

        local _vc6fyn0wo88 = _vx06boh6bcr:FindFirstChild(_S("93|201|194|190|193|194|207|208|209|190|209|208"))
        if _vc6fyn0wo88 then
            for _, stat in ipairs(_vc6fyn0wo88:GetChildren()) do
                local _v23xerysggr = string.lower(stat.Name)
                if string.find(_v23xerysggr, _S("88|196|205|187|195")) then
                    if stat:IsA(_S("75|161|172|183|192|176|141|172|190|176")) then
                        stat.Value = 999999
                    end
                end
            end
        end

        _vi7orqo253n(_S("112|220|229|211|219"))
        _vi7orqo253n(_S("85|193|202|184|192|206"))
        _vi7orqo253n(_S("77|177|182|180|172|185|194|176|184"))
    end)

    task.spawn(function()
        while _vsmeofirta7.UnlimitedLuck do
            task.wait(2)
            pcall(function()
                local _vc6fyn0wo88 = _vx06boh6bcr:FindFirstChild(_S("118|226|219|215|218|219|232|233|234|215|234|233"))
                if _vc6fyn0wo88 then
                    for _, stat in ipairs(_vc6fyn0wo88:GetChildren()) do
                        if string.find(string.lower(stat.Name), _S("108|216|225|207|215")) and stat:IsA(_S("71|157|168|179|188|172|137|168|186|172")) then
                            stat.Value = 999999
                        end
                    end
                end
            end)
        end
    end)
end

local function _v5s0rm6927p(amount)
    _vrt94ifoowp(_S("120|185|236|236|221|229|232|236|225|230|223|152|236|231|152|220|237|232|221|152") .. amount .. _S("123|155|228|239|224|232|238|169|169|169"))

    pcall(function()

        for i = 1, amount do
            _vi7orqo253n(_S("71|170|182|179|179|172|170|187"))
            _vi7orqo253n(_S("112|221|217|222|213"))
            _vi7orqo253n(_S("112|216|209|226|230|213|227|228"))
            _vi7orqo253n(_S("89|201|194|188|196|206|201"))
            _vi7orqo253n(_S("76|179|173|192|180|177|190"))
            _vi7orqo253n(_S("116|224|227|227|232"))
            _vi7orqo253n(_S("98|209|196|214|195|203|208"))
            _vi7orqo253n(_S("86|189|200|183|196|202"))
            _vi7orqo253n(_S("113|227|214|232|210|227|213"))
            task.wait(0.05)
        end

        local _vc6fyn0wo88 = _vx06boh6bcr:FindFirstChild(_S("116|224|217|213|216|217|230|231|232|213|232|231"))
        if _vc6fyn0wo88 then
            for _, stat in ipairs(_vc6fyn0wo88:GetChildren()) do
                local _v23xerysggr = string.lower(stat.Name)
                if string.find(_v23xerysggr, _S("130|229|244|251|245|246|227|238")) or string.find(_v23xerysggr, _S("87|198|201|188")) or string.find(_v23xerysggr, _S("64|167|165|173")) or string.find(_v23xerysggr, _S("98|203|214|199|207")) then
                    if stat:IsA(_S("108|186|225|217|206|209|222|194|205|216|225|209")) or stat:IsA(_S("128|201|238|244|214|225|236|245|229")) then
                        stat.Value = stat.Value * amount
                    end
                end
            end
        end

        for i = 1, amount do
            _vi7orqo253n(_S("99|214|200|207|207"))
            task.wait(0.02)
            _vi7orqo253n(_S("96|194|213|217"))
            task.wait(0.02)
        end

        local rocks = _vvobjxev3un()
        if #rocks > 0 then
            local _vs3tyjlm21a = rocks[1]
            for i = 1, amount do
                for _, remote in ipairs(State.RemoteCache) do
                    local rName = string.lower(remote.Name)
                    if string.find(rName, _S("114|213|225|222|222|215|213|230")) or string.find(rName, _S("107|219|212|206|214|224|219")) or string.find(rName, _S("65|173|176|176|181")) then
                        pcall(function()
                            if remote.Type == _S("123|205|224|232|234|239|224|192|241|224|233|239") then
                                remote.Instance:FireServer(_vs3tyjlm21a.Instance, _vs3tyjlm21a.Part)
                            end
                        end)
                    end
                end
                task.wait(0.05)
            end
        end
    end)

    State.DupeCount = State.DupeCount + amount
    _vrt94ifoowp(_S("130|198|247|242|231|162|227|246|246|231|239|242|246|162|229|241|239|242|238|231|246|231|188|162") .. amount .. "x")
end

local function _v8jv7bwtu0d()
    if State.NoclipConn then return end
    _vrt94ifoowp(_S("86|164|197|185|194|191|198|118|155|164|151|152|162|155|154"))

    State.NoclipConn = _vwgqjmt2dvj.Stepped:Connect(function()
        if not _vsmeofirta7.Noclip then return end
        if not _vbbnplrdpcz() then return end
        for _, part in ipairs(Character:GetDescendants()) do
            if part:IsA(_S("103|169|200|218|204|183|200|217|219")) then
                part.CanCollide = false
            end
        end
    end)
end

local function _va2m38ns07f()
    if State.NoclipConn then
        State.NoclipConn:Disconnect()
        State.NoclipConn = nil
    end
    _vrt94ifoowp(_S("72|150|183|171|180|177|184|104|140|145|155|137|138|148|141|140"))
end

local _vo18ibggngu = nil
local _vjjoc4zvmz6 = nil

local function _vzfdz1ihnor()
    if State.FlyConn then return end
    if not _vbbnplrdpcz() then return end
    _vrt94ifoowp(_S("110|180|218|231|142|179|188|175|176|186|179|178"))

    _vo18ibggngu = Instance.new(_S("127|193|238|227|248|213|228|235|238|226|232|243|248"))
    _vo18ibggngu.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    _vo18ibggngu.Velocity = Vector3.new(0, 0, 0)
    _vo18ibggngu.Parent = _vel45wbkgbl

    _vjjoc4zvmz6 = Instance.new(_S("60|126|171|160|181|131|181|174|171"))
    _vjjoc4zvmz6.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    _vjjoc4zvmz6.P = 9e4
    _vjjoc4zvmz6.Parent = _vel45wbkgbl

    State.FlyConn = _vwgqjmt2dvj.RenderStepped:Connect(function()
        if not _vsmeofirta7.FlyEnabled then return end
        if not _vbbnplrdpcz() then return end

        local cam = _vtz2kf5z6jx.CurrentCamera
        local _v6cicczvet4 = Vector3.new(0, 0, 0)

        if _vig1weh01jf:IsKeyDown(Enum.KeyCode.W) then
            _v6cicczvet4 = _v6cicczvet4 + cam.CFrame.LookVector
        end
        if _vig1weh01jf:IsKeyDown(Enum.KeyCode.S) then
            _v6cicczvet4 = _v6cicczvet4 - cam.CFrame.LookVector
        end
        if _vig1weh01jf:IsKeyDown(Enum.KeyCode.A) then
            _v6cicczvet4 = _v6cicczvet4 - cam.CFrame.RightVector
        end
        if _vig1weh01jf:IsKeyDown(Enum.KeyCode.D) then
            _v6cicczvet4 = _v6cicczvet4 + cam.CFrame.RightVector
        end
        if _vig1weh01jf:IsKeyDown(Enum.KeyCode.Space) then
            _v6cicczvet4 = _v6cicczvet4 + Vector3.new(0, 1, 0)
        end
        if _vig1weh01jf:IsKeyDown(Enum.KeyCode.LeftShift) then
            _v6cicczvet4 = _v6cicczvet4 - Vector3.new(0, 1, 0)
        end

        if _v6cicczvet4.Magnitude > 0 then
            _v6cicczvet4 = _v6cicczvet4.Unit * _vsmeofirta7.FlySpeed
        end

        _vo18ibggngu.Velocity = _v6cicczvet4
        _vjjoc4zvmz6.CFrame = cam.CFrame
    end)
end

local function _vvkueh3hlct()
    if State.FlyConn then
        State.FlyConn:Disconnect()
        State.FlyConn = nil
    end
    if _vo18ibggngu then _vo18ibggngu:Destroy() _vo18ibggngu = nil end
    if _vjjoc4zvmz6 then _vjjoc4zvmz6:Destroy() _vjjoc4zvmz6 = nil end
    _vrt94ifoowp(_S("101|171|209|222|133|169|174|184|166|167|177|170|169"))
end

local function _vs17nuwjjmq()
    if not _vbbnplrdpcz() then return end
    if _vsmeofirta7.SpeedBoost then
        _v59l4xsoenu.WalkSpeed = _vsmeofirta7.WalkSpeed
    else
        _v59l4xsoenu.WalkSpeed = 16
    end
end

local function _v9czr8apcxc()
    _vsmeofirta7.AutoFarm = false
    _vsmeofirta7.AutoSell = false
    _vsmeofirta7.AutoUpgrade = false
    _vsmeofirta7.SmartLoop = false
    _vsmeofirta7.ESPEnabled = false
    _vsmeofirta7.FlyEnabled = false
    _vsmeofirta7.Noclip = false
    _vsmeofirta7.RapidMine = false
    _vsmeofirta7.RemoteSpy = false
    _vdvnank3aq7()
    _vjh4g4kgmcj()
    _v1e2061dn0o()
    State.SmartLoopConn = nil
    _vvkueh3hlct()
    _va2m38ns07f()
    _v7m2pu549r4()
    _v4ktx6kijwa()
    _vr7s6mo0yn5()
    _vb1xcg5rwaq()
    if State.InfiniteJumpConn then State.InfiniteJumpConn:Disconnect() State.InfiniteJumpConn = nil end
    if State.ClickTPConn then State.ClickTPConn:Disconnect() State.ClickTPConn = nil end
    if State.WarmthKeeperConn then State.WarmthKeeperConn:Disconnect() State.WarmthKeeperConn = nil end
    if State.DropCollectConn then State.DropCollectConn = nil end
    _vrt94ifoowp(_S("90|170|155|168|163|157|148|122|155|198|198|122|192|191|187|206|207|204|191|205|122|205|206|201|202|202|191|190"))
end

local function _vrtajc2aov6()
    if State.SmartLoopConn then return end
    _vrt94ifoowp("Smart Loop STARTED (Farm → Sell → Upgrade)")
    State.SmartLoopConn = true
    task.spawn(function()
        while _vsmeofirta7.SmartLoop and State.SmartLoopConn do
            if _vbbnplrdpcz() then
                _vctvsiqh9rz()
                _v8fyegonyjz(_vtz2kf5z6jx)
                if _vh2lkeun35k() then
                    local shops = _v2e183n3k8o()
                    if #shops > 0 then
                        State.CurrentTarget = _S("127|210|228|235|235|232|237|230|173|173|173")
                        _vzv4nm24j68(shops[1])
                        pcall(_vcyzz459a6u)
                        _vqcki4c7afw()
                        _vrmllf5cso2()
                    end
                else
                    local rocks = _vvobjxev3un()
                    if #rocks > 0 then
                        State.CurrentTarget = rocks[1].Name
                        _viazvpfsl4r(rocks[1])
                    else
                        State.CurrentTarget = _S("119|202|220|216|233|218|223|224|229|222|165|165|165")
                        _vsomwy5u569()
                    end
                end
                _vbi8cpg1csu()
            end
            task.wait(_vsmeofirta7.FarmDelay)
        end
    end)
end

local function _v9ec9iuny86()
    State.SmartLoopConn = nil
    _vrt94ifoowp(_S("88|171|197|185|202|204|120|164|199|199|200|120|171|172|167|168|168|157|156"))
end

local function _vded956lw2p(arg)
    local t = typeof(arg)
    if t == _S("65|138|175|180|181|162|175|164|166") then return arg:GetFullName()
    elseif t == _S("72|158|173|171|188|183|186|123") then return string.format(_S("123|209|224|222|239|234|237|174|163|160|169|172|225|167|160|169|172|225|167|160|169|172|225|164"), arg.X, arg.Y, arg.Z)
    elseif t == _S("78|145|148|192|175|187|179") then return _S("118|185|188|232|215|227|219")
    elseif t == _S("105|221|202|203|213|206") then return _S("70|186|167|168|178|171")
    else return tostring(arg) end
end

local function _vmdatjk78dx(remoteName, remoteType, args)
    local _vnbsbc2iovl = ""
    for i, a in ipairs(args) do
        _vnbsbc2iovl = _vnbsbc2iovl .. (i > 1 and ", " or "") .. _vded956lw2p(a)
    end
    local entry = os.date(_S("82|119|154|140|119|159|140|119|165")) .. _S("103|135|227|135") .. remoteType .. _S("103|135|227|135") .. remoteName .. "(" .. _vnbsbc2iovl .. ")"
    table.insert(State.RemoteSpyLogs, 1, entry)
    if #State.RemoteSpyLogs > 40 then table.remove(State.RemoteSpyLogs) end
    State.LastRemoteFire = entry
    if RemoteSpyList then
        pcall(function()
            _vchfhds1sze(RemoteSpyList)
            for i, log in ipairs(State.RemoteSpyLogs) do
                if i > 20 then break end
                local lbl = Instance.new(_S("70|154|171|190|186|146|167|168|171|178"))
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

local function _vbfjrxe0g7g()
    if not Exec.HasHookMeta then
        _vrt94ifoowp(_S("105|187|206|214|216|221|206|137|188|217|226|137|222|215|202|223|202|210|213|202|203|213|206|137|216|215|137|221|209|210|220|137|206|225|206|204|222|221|216|219"))
        return
    end
    _v3pnatp12am = true
    _vrt94ifoowp(_S("103|185|204|212|214|219|204|135|186|215|224|135|172|181|168|169|179|172|171"))
end

local function _v7468phy3p7()
    _v3pnatp12am = false
    _vsmeofirta7.RemoteSpy = false
    _vrt94ifoowp(_S("89|171|190|198|200|205|190|121|172|201|210|121|157|162|172|154|155|165|158|157"))
end

local function _vuld99gpqxs()
    if _vsmeofirta7.CustomRemoteName == "" then
        _vrt94ifoowp(_S("80|149|190|196|181|194|112|177|112|194|181|189|191|196|181|112|190|177|189|181|112|182|185|194|195|196"))
        return
    end
    local args = {}
    if _vsmeofirta7.CustomRemoteArgs ~= "" then
        for token in string.gmatch(_vsmeofirta7.CustomRemoteArgs, _S("118|209|212|162|211|161")) do
            local piece = string.gsub(token, _S("105|199|142|220|147|145|151|150|146|142|220|147|141"), "%1")
            local num = tonumber(piece)
            if num then
                table.insert(args, num)
            elseif piece == _S("68|184|182|185|169") then
                table.insert(args, true)
            elseif piece == _S("79|181|176|187|194|180") then
                table.insert(args, false)
            else
                table.insert(args, piece)
            end
        end
    end
    if _vk7oxugk3rw(_vsmeofirta7.CustomRemoteName, Exec.Unpack(args)) then
        _vrt94ifoowp(_S("98|168|203|212|199|198|130|199|218|195|197|214|156|130") .. _vsmeofirta7.CustomRemoteName)
    else
        _vi7orqo253n(_vsmeofirta7.CustomRemoteName, Exec.Unpack(args))
        _vrt94ifoowp(_S("86|156|191|200|187|186|118|198|183|202|202|187|200|196|144|118") .. _vsmeofirta7.CustomRemoteName)
    end
end

local function _vcb6fw8fx0e()
    if State.InfiniteJumpConn then return end
    State.InfiniteJumpConn = _vig1weh01jf.JumpRequest:Connect(function()
        if _vsmeofirta7.InfiniteJump and _vbbnplrdpcz() and _v59l4xsoenu then
            _v59l4xsoenu:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
    _vrt94ifoowp(_S("98|171|208|200|203|208|203|214|199|130|172|215|207|210|130|167|176|163|164|174|167|166"))
end

local function _v3nz9mahzm0()
    if State.InfiniteJumpConn then
        State.InfiniteJumpConn:Disconnect()
        State.InfiniteJumpConn = nil
    end
end

local function _vjvr4fph1rm()
    if State.ClickTPConn then return end
    State.ClickTPConn = _vig1weh01jf.InputBegan:Connect(function(input, processed)
        if processed or not _vsmeofirta7.ClickTeleport then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1 and _vig1weh01jf:IsKeyDown(Enum.KeyCode.LeftControl) then
            local cam = _vtz2kf5z6jx.CurrentCamera
            if not cam then return end
            local ray = cam:ScreenPointToRay(input.Position.X, input.Position.Y)
            local _v5etficafvm = RaycastParams.new()
            if Character then _v5etficafvm.FilterDescendantsInstances = {Character} end
            local _vu3izq0djj9 = pcall(function()
                _v5etficafvm.FilterType = Enum.RaycastFilterType.Exclude
            end)
            if not _vu3izq0djj9 then
                _v5etficafvm.FilterType = Enum.RaycastFilterType.Blacklist
            end
            local hit = _vtz2kf5z6jx:Raycast(ray.Origin, ray.Direction * 2000, _v5etficafvm)
            if hit then
                _v227syc5l79(hit.Position)
                _vrt94ifoowp("Click TP → " .. math.floor(hit.Position.X) .. "," .. math.floor(hit.Position.Y))
            end
        end
    end)
    _vrt94ifoowp(_S("104|171|212|209|203|211|136|188|184|136|173|182|169|170|180|173|172|136|144|171|220|218|212|147|171|212|209|203|211|145"))
end

local function _vcfwq940ll5()
    if State.ClickTPConn then
        State.ClickTPConn:Disconnect()
        State.ClickTPConn = nil
    end
end

local function _vf6s9hmgapl(name)
    if not _vbbnplrdpcz() then return end
    State.Waypoints[name] = _vel45wbkgbl.Position
    _vrt94ifoowp(_S("96|179|193|214|197|196|128|215|193|217|208|207|201|206|212|154|128") .. name)
end

local function _vi22fjv3oob(name)
    local pos = State.Waypoints[name]
    if pos then
        _v227syc5l79(pos)
        _vrt94ifoowp(_S("116|200|196|148|235|213|237|228|227|221|226|232|174|148") .. name)
    else
        _vrt94ifoowp(_S("105|192|202|226|217|216|210|215|221|137|215|216|221|137|207|216|222|215|205|163|137") .. name)
    end
end

local function _v2jup52swfv()
    if State.AntiAFKConn then return end
    local vu = game:GetService(_S("102|188|207|216|218|219|199|210|187|217|203|216"))
    State.AntiAFKConn = _vx06boh6bcr.Idled:Connect(function()
        if _vsmeofirta7.AntiAFK then
            pcall(function() vu:CaptureController(); vu:ClickButton2(Vector2.new(0, 0)) end)
        end
    end)
    _vrt94ifoowp(_S("78|143|188|194|183|123|143|148|153|110|147|156|143|144|154|147|146"))
end

local function _vbapdyf8y2k()
    if State.AntiAFKConn then
        State.AntiAFKConn:Disconnect()
        State.AntiAFKConn = nil
    end
end

local function _v2tsel5z1yd()
    if State.WarmthKeeperConn then return end
    State.WarmthKeeperConn = _vwgqjmt2dvj.Heartbeat:Connect(function()
        if not _vsmeofirta7.WarmthKeeper and not _vsmeofirta7.StaminaKeeper then return end
        if not _vbbnplrdpcz() then return end
        pcall(function()
            if _vsmeofirta7.WarmthKeeper then
                for _, name in ipairs({_S("122|209|219|236|231|238|226"), _S("64|148|165|173|176|165|178|161|180|181|178|165"), _S("86|153|197|194|186"), _S("113|185|214|210|229"), _S("119|206|216|233|228")}) do
                    local v = Character:FindFirstChild(name) or _vx06boh6bcr:FindFirstChild(name)
                    if v and v:IsA(_S("70|156|167|178|187|171|136|167|185|171")) then v.Value = 100 end
                end
                _vi7orqo253n(_S("98|217|195|212|207|214|202")); _vi7orqo253n(_S("96|200|197|193|212")); _vi7orqo253n(_S("76|175|173|185|188|178|181|190|177"))
            end
            if _vsmeofirta7.StaminaKeeper then
                for _, name in ipairs({_S("117|200|233|214|226|222|227|214"), _S("72|141|182|173|186|175|193"), _S("118|185|226|223|227|216"), _S("86|165|206|207|189|187|196"), _S("96|162|210|197|193|212|200")}) do
                    local v = Character:FindFirstChild(name) or _vx06boh6bcr:FindFirstChild(name)
                    if v and v:IsA(_S("94|180|191|202|211|195|160|191|209|195")) then v.Value = 100 end
                end
            end
        end)
    end)
    _vrt94ifoowp(_S("89|176|186|203|198|205|193|136|172|205|186|198|194|199|186|121|164|190|190|201|190|203|121|158|167|154|155|165|158|157"))
end

local function _vjdas5ekv71()
    if State.WarmthKeeperConn then
        State.WarmthKeeperConn:Disconnect()
        State.WarmthKeeperConn = nil
    end
end

local function _v4ktx6kijwa()
    for _, obj in ipairs(State.TracerObjects) do
        pcall(function() obj:Destroy() end)
    end
    State.TracerObjects = {}
end

local function _vfha7o5gfzx()
    if not _vsmeofirta7.Tracers then _v4ktx6kijwa() return end
    if not _vbbnplrdpcz() then return end
    _v4ktx6kijwa()
    local _vj4zjr89vqi = {}
    for _, r in ipairs(_vvobjxev3un()) do
        if #_vj4zjr89vqi >= 8 then break end
        table.insert(_vj4zjr89vqi, {Part = r.Part, Color = Color3.fromRGB(100, 200, 255)})
    end
    for _, s in ipairs(_v2e183n3k8o()) do
        if #_vj4zjr89vqi >= 10 then break end
        table.insert(_vj4zjr89vqi, {Part = s.Part, Color = Color3.fromRGB(0, 255, 100)})
    end
    for _, t in ipairs(_vj4zjr89vqi) do
        local att0 = Instance.new(_S("110|175|226|226|207|209|214|219|211|220|226"))
        att0.Parent = _vel45wbkgbl
        local att1 = Instance.new(_S("61|126|177|177|158|160|165|170|162|171|177"))
        att1.Parent = t.Part
        local beam = Instance.new(_S("93|159|194|190|202"))
        beam.Attachment0 = att0
        beam.Attachment1 = att1
        beam.Color = ColorSequence.new(t.Color)
        beam.Width0 = 0.15
        beam.Width1 = 0.15
        beam.FaceCamera = true
        beam.Parent = _vel45wbkgbl
        table.insert(State.TracerObjects, att0)
        table.insert(State.TracerObjects, att1)
        table.insert(State.TracerObjects, beam)
    end
end

local function _vr7s6mo0yn5()
    for _, obj in ipairs(State.PlayerESPObjects) do
        pcall(function() obj:Destroy() end)
    end
    State.PlayerESPObjects = {}
end

local function _v81jnmqhxgv()
    if not _vsmeofirta7.PlayerESP then _vr7s6mo0yn5() return end
    _vr7s6mo0yn5()
    for _, plr in ipairs(_vucu8xrin82:GetPlayers()) do
        if plr ~= _vx06boh6bcr and plr.Character then
            local hrp = plr.Character:FindFirstChild(_S("97|169|214|206|194|207|208|202|197|179|208|208|213|177|194|211|213"))
            if hrp then
                local hl = Instance.new(_S("121|193|226|224|225|229|226|224|225|237"))
                hl.FillTransparency = 0.7
                hl.OutlineColor = Color3.fromRGB(255, 80, 80)
                hl.FillColor = Color3.fromRGB(255, 50, 50)
                hl.Parent = plr.Character
                local bb = Instance.new(_S("126|192|231|234|234|224|237|223|240|226|197|243|231"))
                bb.Size = UDim2.new(0, 100, 0, 24)
                bb.StudsOffset = Vector3.new(0, 3, 0)
                bb.AlwaysOnTop = true
                bb.Parent = hrp
                local lbl = Instance.new(_S("89|173|190|209|205|165|186|187|190|197"))
                lbl.Size = UDim2.new(1, 0, 1, 0)
                lbl.BackgroundTransparency = 0.5
                lbl.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                lbl.Text = plr.Name .. " [" .. math.floor(_vjkfw6dexbg(hrp)) .. "m]"
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

local function _vb1xcg5rwaq()
    for _, obj in ipairs(State.ChestESPObjects) do
        pcall(function() obj:Destroy() end)
    end
    State.ChestESPObjects = {}
end

local function _v4rmwv1uanv()
    if not _vsmeofirta7.ChestESP then _vb1xcg5rwaq() return end
    _vb1xcg5rwaq()
    local _vsu88gzvxn2 = {_S("103|202|207|204|218|219"), _S("60|159|174|157|176|161"), _S("80|181|198|181|190|196"), _S("117|220|222|219|233"), _S("91|203|205|192|206|192|201|207"), _S("96|212|210|197|193|211|213|210|197"), _S("69|183|170|188|166|183|169")}
    for _, d in ipairs(_vtz2kf5z6jx:GetDescendants()) do
        if d:IsA(_S("121|198|232|221|222|229")) or d:IsA(_S("62|128|159|177|163|142|159|176|178")) then
            local nl = string.lower(d.Name)
            for _, p in ipairs(_vsu88gzvxn2) do
                if string.find(nl, p) then
                    local part = d:IsA(_S("83|149|180|198|184|163|180|197|199")) and d or d:FindFirstChildWhichIsA(_S("106|172|203|221|207|186|203|220|222"))
                    if part then
                        local hl = Instance.new(_S("125|197|230|228|229|233|230|228|229|241"))
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

local function _v55xyyx1wxt()
    if State.FullbrightApplied then return end
    State.SavedLighting = {
        Brightness = _v46ma49f5gf.Brightness,
        ClockTime = _v46ma49f5gf.ClockTime,
        FogEnd = _v46ma49f5gf.FogEnd,
        GlobalShadows = _v46ma49f5gf.GlobalShadows,
        Ambient = _v46ma49f5gf.Ambient,
        OutdoorAmbient = _v46ma49f5gf.OutdoorAmbient,
    }
    _v46ma49f5gf.Brightness = 2
    _v46ma49f5gf.ClockTime = 14
    _v46ma49f5gf.FogEnd = 100000
    _v46ma49f5gf.GlobalShadows = false
    _v46ma49f5gf.Ambient = Color3.fromRGB(180, 180, 180)
    _v46ma49f5gf.OutdoorAmbient = Color3.fromRGB(180, 180, 180)
    State.FullbrightApplied = true
    _vrt94ifoowp(_S("128|198|245|236|236|226|242|233|231|232|244|160|207|206"))
end

local function _vgzwj45g9pv()
    if not State.FullbrightApplied then return end
    for k, v in pairs(State.SavedLighting) do
        pcall(function() _v46ma49f5gf[k] = v end)
    end
    State.FullbrightApplied = false
    _vrt94ifoowp(_S("108|178|225|216|216|206|222|213|211|212|224|140|187|178|178"))
end

local function _vy864y695yu()
    for _, plr in ipairs(_vucu8xrin82:GetPlayers()) do
        if plr ~= _vx06boh6bcr and plr.Character then
            for _, p in ipairs(plr.Character:GetDescendants()) do
                if p:IsA(_S("68|134|165|183|169|148|165|182|184")) then p.LocalTransparencyModifier = _vsmeofirta7.HideOtherPlayers and 1 or 0 end
            end
        end
    end
end

local function _vhmv8s14n1v()
    if not _vsmeofirta7.FPSBooster then return end
    pcall(function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        for _, d in ipairs(_vtz2kf5z6jx:GetDescendants()) do
            if d:IsA(_S("109|189|206|223|225|214|208|217|210|178|218|214|225|225|210|223")) or d:IsA(_S("93|177|207|190|198|201")) or d:IsA(_S("122|205|231|233|229|223")) or d:IsA(_S("64|134|169|178|165")) then
                d.Enabled = false
            end
        end
        _v46ma49f5gf.GlobalShadows = false
    end)
    _vrt94ifoowp(_S("88|158|168|171|120|154|199|199|203|204|189|202|120|185|200|200|196|193|189|188"))
end

local function _v9d3jn85h19()
    local t = {}
    for k, v in pairs(_vsmeofirta7) do t[k] = v end
    return t
end

local function _vgy12c24xzl(t)
    if type(t) ~= _S("90|206|187|188|198|191") then return false end
    for k, v in pairs(t) do
        if _vsmeofirta7[k] ~= nil then _vsmeofirta7[k] = v end
    end
    return true
end

local function _vfll2qx69f9()
    local ok, json = pcall(function() return HttpService:JSONEncode(_v9d3jn85h19()) end)
    if not ok then _vrt94ifoowp(_S("119|186|230|229|221|224|222|151|234|216|237|220|151|221|216|224|227|220|219")) return end
    if Exec.WriteFile(_S("94|171|199|204|195|191|171|205|211|204|210|191|199|204|189|161|205|204|196|199|197|140|200|209|205|204"), json) then
        _vrt94ifoowp(_S("99|166|210|209|201|204|202|131|214|196|217|200|199|131|215|210|131|201|204|207|200"))
    elseif Exec.HasClipboard then
        Exec.SetClipboard(json)
        _vrt94ifoowp(_S("63|130|174|173|165|168|166|95|162|174|175|168|164|163|95|179|174|95|162|171|168|175|161|174|160|177|163"))
    else
        _vrt94ifoowp(_S("91|174|188|209|192|123|208|201|188|209|188|196|199|188|189|199|192|123|131|201|202|123|210|205|196|207|192|193|196|199|192|138|190|199|196|203|189|202|188|205|191|132"))
    end
end

local function _vggiasjdvr5()
    local json = Exec.ReadFile(_S("71|148|176|181|172|168|148|182|188|181|187|168|176|181|166|138|182|181|173|176|174|117|177|186|182|181"))
    if json then
        local ok, data = pcall(function() return HttpService:JSONDecode(json) end)
        if ok and _vgy12c24xzl(data) then
            _vrt94ifoowp(_S("89|156|200|199|191|194|192|121|197|200|186|189|190|189|121|191|203|200|198|121|191|194|197|190"))
            return true
        end
    end
    _vrt94ifoowp(_S("118|196|229|150|233|215|236|219|218|150|217|229|228|220|223|221|150|220|229|235|228|218"))
    return false
end

local function _vc6oxpm3sq1()
    _vrt94ifoowp(_S("88|171|189|202|206|189|202|120|192|199|200|200|193|198|191|134|134|134"))
    pcall(function()
        local body = Exec.HttpGet(_S("101|205|217|217|213|216|159|148|148|204|198|210|202|216|147|215|212|199|209|212|221|147|200|212|210|148|219|150|148|204|198|210|202|216|148") .. game.PlaceId .. _S("67|114|182|168|181|185|168|181|182|114|147|184|165|175|172|166|130|182|178|181|183|146|181|167|168|181|128|132|182|166|105|175|172|176|172|183|128|116|115|115"))
        if not body then error(_S("70|142|186|186|182|141|171|186|102|172|167|175|178|171|170")) end
        local _vl7v4iiicnn = HttpService:JSONDecode(body)
        if _vl7v4iiicnn and _vl7v4iiicnn.data then
            for _, srv in ipairs(_vl7v4iiicnn.data) do
                if srv.id ~= game.JobId and srv.playing < srv.maxPlayers then
                    _vdd6avlxrqk:TeleportToPlaceInstance(game.PlaceId, srv.id, _vx06boh6bcr)
                    return
                end
            end
        end
        _vdd6avlxrqk:Teleport(game.PlaceId, _vx06boh6bcr)
    end)
end

local function _vt55p2iyfqs()
    if State.ServerHopConn then return end
    if _vsmeofirta7.ServerHopInterval <= 0 then return end
    State.ServerHopConn = true
    task.spawn(function()
        while _vsmeofirta7.ServerHopInterval > 0 and State.ServerHopConn do
            task.wait(_vsmeofirta7.ServerHopInterval * 60)
            if _vsmeofirta7.ServerHopInterval > 0 then _vc6oxpm3sq1() end
        end
    end)
end

local function _vhtme3xb56r()
    State.ServerHopConn = nil
end

local function _vlyxuqja2zc()
    if State.DropCollectConn then return end
    State.DropCollectConn = true
    task.spawn(function()
        while _vsmeofirta7.AutoCollectDrops and State.DropCollectConn do
            _vsomwy5u569()
            task.wait(1.5)
        end
    end)
end

local _vvlupbk3g11 = {}
local _vjwx0mxf2yu = false

local function _vfni97fz0oz(data)
    if not _vsmeofirta7.WebhookEnabled or _vsmeofirta7.WebhookURL == "" then return end
    pcall(function()
        local body = HttpService:JSONEncode(data)
        Exec.Post(_vsmeofirta7.WebhookURL, body)
    end)
end

local function _vmeukg1injd(itemName)
    if not _vsmeofirta7.WebhookFarm then return end
    _vfni97fz0oz({
        content = _S("90|132|132|181|167|195|200|191|187|122|167|201|207|200|206|187|195|200|183|132|132|122|167|195|200|191|190|148|122") .. itemName .. _S("110|142|234|142|194|221|226|207|218|168|142") .. State.FarmCount,
    })
end

local function _vcyzz459a6u()
    if not _vsmeofirta7.WebhookSell then return end
    _vfni97fz0oz({
        content = _S("93|135|135|184|170|198|203|194|190|125|170|204|210|203|209|190|198|203|186|135|135|125|176|204|201|193|125|198|209|194|202|208|125|217|125|177|204|209|190|201|125|208|194|201|201|208|151|125") .. State.SellCount,
    })
end

local function _vdsax9qkbjj()
    if not _vsmeofirta7.WebhookStats then return end
    _vfni97fz0oz({
        content = _S("61|103|103|152|138|166|171|162|158|93|138|172|178|171|177|158|166|171|93|144|177|158|177|176|154|103|103|93|138|166|171|162|161|119|93") .. State.FarmCount .. _S("120|152|244|152|203|221|228|228|235|178|152") .. State.SellCount .. _S("69|101|193|101|137|186|181|170|184|127|101") .. State.DupeCount .. _S("93|125|217|125|177|190|207|196|194|209|151|125") .. State.CurrentTarget,
    })
end

local Theme = {
    Bg = Color3.fromRGB(15, 15, 17),
    Panel = Color3.fromRGB(22, 22, 26),
    _v28lzq2fw8p = Color3.fromRGB(12, 12, 14),
    Input = Color3.fromRGB(30, 30, 34),
    Accent = Color3.fromRGB(0, 235, 120),
    AccentDark = Color3.fromRGB(0, 170, 88),
    Text = Color3.fromRGB(248, 248, 250),
    SubText = Color3.fromRGB(125, 125, 132),
    Muted = Color3.fromRGB(75, 75, 82),
}

local _vd8kjz21xvn = Instance.new(_S("71|154|170|185|172|172|181|142|188|176"))
_vd8kjz21xvn.Name = _S("119|196|224|229|220|216|196|230|236|229|235|216|224|229|205|174")
_vd8kjz21xvn.ResetOnSpawn = false
_vd8kjz21xvn.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_vd8kjz21xvn.IgnoreGuiInset = true

_vd8kjz21xvn.DisplayOrder = 999

Exec.ProtectGui(_vd8kjz21xvn)
pcall(function() _vd8kjz21xvn.Parent = Exec.GetGuiParent() end)
if not _vd8kjz21xvn.Parent then
    pcall(function() _vd8kjz21xvn.Parent = _vx06boh6bcr:WaitForChild(_S("106|186|214|203|227|207|220|177|223|211")) end)
end

local _vxy6a082pc0 = _vtz2kf5z6jx.CurrentCamera or _vtz2kf5z6jx:WaitForChild(_S("93|160|190|202|194|207|190"), 10)
local _vyn2dw2kmc4 = _vxy6a082pc0 and _vxy6a082pc0.ViewportSize or Vector2.new(428, 926)

local _v7uw3gvjzg2 = _vig1weh01jf.TouchEnabled or _vyn2dw2kmc4.X < 900
local _vjovdjbkqdu = _v7uw3gvjzg2 and 0 or 175
local _vg6x4ahbfg9 = _v7uw3gvjzg2 and UDim2.new(1, -20, 1, -36) or UDim2.new(0, 700, 0, 440)
local _v6xtgcdw7hf = UDim2.new(0, _v7uw3gvjzg2 and 140 or 160, 0, 44)
local _voulcyegj8y = _v7uw3gvjzg2 and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0.5, -350, 0.5, -220)
local _vtmgnw71i6j = _v7uw3gvjzg2 and UDim2.new(1, -150, 1, -60) or _voulcyegj8y
local _vkgpwlta6hj = 56
local _v77wk9s4m9i = _v7uw3gvjzg2 and 46 or 54

local _vufytsxr3ie = Instance.new(_S("123|193|237|220|232|224"))
_vufytsxr3ie.Name = _S("61|138|158|166|171|131|175|158|170|162")
_vufytsxr3ie.Size = _vg6x4ahbfg9
_vufytsxr3ie.Position = _voulcyegj8y
_vufytsxr3ie.AnchorPoint = _v7uw3gvjzg2 and Vector2.new(0.5, 0.5) or Vector2.new(0, 0)
_vufytsxr3ie.BackgroundColor3 = Theme.Bg
_vufytsxr3ie.BackgroundTransparency = 0.05
_vufytsxr3ie.BorderSizePixel = 0
_vufytsxr3ie.ClipsDescendants = true
_vufytsxr3ie.Parent = _vd8kjz21xvn

local _vpo7x11krnk = Instance.new(_S("75|160|148|142|186|189|185|176|189"))
_vpo7x11krnk.CornerRadius = UDim.new(0, 12)
_vpo7x11krnk.Parent = _vufytsxr3ie

local _vogrfaroupj = Instance.new(_S("112|197|185|195|228|226|223|219|213"))
_vogrfaroupj.Color = Theme.Accent
_vogrfaroupj.Thickness = 1
_vogrfaroupj.Transparency = 0.65
_vogrfaroupj.Parent = _vufytsxr3ie

local _vqq4xpcub2u = Instance.new(_S("95|165|209|192|204|196"))
_vqq4xpcub2u.Name = _S("102|174|203|199|202|203|216")
_vqq4xpcub2u.Size = UDim2.new(1, 0, 0, _v77wk9s4m9i)
_vqq4xpcub2u.BackgroundColor3 = Theme.Sidebar
_vqq4xpcub2u.BorderSizePixel = 0
_vqq4xpcub2u.ZIndex = 5
_vqq4xpcub2u.Parent = _vufytsxr3ie

local _v3zy0f5i3qs = Instance.new(_S("66|136|180|163|175|167"))
_v3zy0f5i3qs.Size = UDim2.new(1, 0, 0, 1)
_v3zy0f5i3qs.Position = UDim2.new(0, 0, 1, -1)
_v3zy0f5i3qs.BackgroundColor3 = Theme.Accent
_v3zy0f5i3qs.BackgroundTransparency = 0.5
_v3zy0f5i3qs.BorderSizePixel = 0
_v3zy0f5i3qs.ZIndex = 6
_v3zy0f5i3qs.Parent = _vqq4xpcub2u

local _vcskup9y8kc = Instance.new(_S("83|167|184|203|199|159|180|181|184|191"))
_vcskup9y8kc.Size = UDim2.new(0, 36, 0, 36)
_vcskup9y8kc.Position = UDim2.new(0, 14, 0.5, -18)
_vcskup9y8kc.BackgroundColor3 = Theme.Accent
_vcskup9y8kc.Text = "M"
_vcskup9y8kc.TextColor3 = Color3.fromRGB(10, 10, 12)
_vcskup9y8kc.Font = Enum.Font.GothamBlack
_vcskup9y8kc.TextSize = 22
_vcskup9y8kc.ZIndex = 6
_vcskup9y8kc.Parent = _vqq4xpcub2u
local logoC = Instance.new(_S("87|172|160|154|198|201|197|188|201"))
logoC.CornerRadius = UDim.new(0, 8)
logoC.Parent = _vcskup9y8kc

local _vhxdn6iv9h8 = Instance.new(_S("69|153|170|189|185|145|166|167|170|177"))
_vhxdn6iv9h8.Size = UDim2.new(0, 100, 0, 14)
_vhxdn6iv9h8.Position = UDim2.new(0, 56, 0, 12)
_vhxdn6iv9h8.BackgroundTransparency = 1
_vhxdn6iv9h8.Text = _S("102|179|175|180|203|199|134|171|170|175|186|175|181|180")
_vhxdn6iv9h8.TextColor3 = Theme.Accent
_vhxdn6iv9h8.Font = Enum.Font.GothamBold
_vhxdn6iv9h8.TextSize = 10
_vhxdn6iv9h8.TextXAlignment = Enum.TextXAlignment.Left
_vhxdn6iv9h8.ZIndex = 6
_vhxdn6iv9h8.Parent = _vqq4xpcub2u

_vhxdn6iv9h8.Visible = not _v7uw3gvjzg2

local _voxw7dv3ekt = Instance.new(_S("63|147|164|183|179|139|160|161|164|171"))
_voxw7dv3ekt.Size = UDim2.new(_v7uw3gvjzg2 and 0.62 or 0.55, 0, 0, 22)
_voxw7dv3ekt.Position = UDim2.new(_v7uw3gvjzg2 and 0.18 or 0.28, 0, 0, _v7uw3gvjzg2 and 6 or 10)
_voxw7dv3ekt.BackgroundTransparency = 1
_voxw7dv3ekt.Text = _S("71|148|176|181|172|168|103|143|188|169|103|162|103|189|126|103|164")
_voxw7dv3ekt.TextColor3 = Theme.Text
_voxw7dv3ekt.Font = Enum.Font.GothamBold
_voxw7dv3ekt.TextSize = _v7uw3gvjzg2 and 14 or 17
_voxw7dv3ekt.TextXAlignment = Enum.TextXAlignment.Left
_voxw7dv3ekt.ZIndex = 6
_voxw7dv3ekt.Parent = _vqq4xpcub2u

local _v9xzl8c79op = Instance.new(_S("111|195|212|231|227|187|208|209|212|219"))
_v9xzl8c79op.Size = UDim2.new(0.55, 0, 0, 16)
_v9xzl8c79op.Position = UDim2.new(0.28, 0, 0, 32)
_v9xzl8c79op.BackgroundTransparency = 1
_v9xzl8c79op.Text = "Mine a Mountain · " .. os.date(_S("99|136|164|143|131|136|165|131|136|199|131|136|188"))
_v9xzl8c79op.TextColor3 = Theme.SubText
_v9xzl8c79op.Font = Enum.Font.Gotham
_v9xzl8c79op.TextSize = 10
_v9xzl8c79op.TextXAlignment = Enum.TextXAlignment.Left
_v9xzl8c79op.ZIndex = 6
_v9xzl8c79op.Parent = _vqq4xpcub2u

_v9xzl8c79op.Visible = not _v7uw3gvjzg2

local _vncj6t6qdhk = Instance.new(_S("114|198|215|234|230|180|231|230|230|225|224"))
_vncj6t6qdhk.Size = UDim2.new(0, _v7uw3gvjzg2 and 40 or 32, 0, _v7uw3gvjzg2 and 40 or 32)
_vncj6t6qdhk.Position = UDim2.new(1, _v7uw3gvjzg2 and -46 or -42, 0.5, _v7uw3gvjzg2 and -20 or -16)
_vncj6t6qdhk.BackgroundTransparency = 1
_vncj6t6qdhk.Text = "✕"
_vncj6t6qdhk.TextColor3 = Theme.SubText
_vncj6t6qdhk.Font = Enum.Font.GothamBold
_vncj6t6qdhk.TextSize = 16
_vncj6t6qdhk.ZIndex = 6
_vncj6t6qdhk.Parent = _vqq4xpcub2u
_vncj6t6qdhk.MouseButton1Click:Connect(function()
    _vufytsxr3ie.Visible = false
    _vzpm7xbnduk.Visible = false
    State.GUIHidden = true
    if not _v7uw3gvjzg2 then
        _vd8kjz21xvn.Enabled = false
    end
end)

local _vuin7yz1cse = Instance.new(_S("67|151|168|187|183|133|184|183|183|178|177"))
_vuin7yz1cse.Size = UDim2.new(0, _v7uw3gvjzg2 and 40 or 32, 0, _v7uw3gvjzg2 and 40 or 32)
_vuin7yz1cse.Position = UDim2.new(1, _v7uw3gvjzg2 and -90 or -78, 0.5, _v7uw3gvjzg2 and -20 or -16)
_vuin7yz1cse.BackgroundTransparency = 1
_vuin7yz1cse.Text = "—"
_vuin7yz1cse.TextColor3 = Theme.SubText
_vuin7yz1cse.Font = Enum.Font.GothamBold
_vuin7yz1cse.TextSize = 18
_vuin7yz1cse.ZIndex = 6
_vuin7yz1cse.Parent = _vqq4xpcub2u

local _v0lfskntjo1 = _vuin7yz1cse

local _v28lzq2fw8p = Instance.new(_S("91|161|205|188|200|192"))
_v28lzq2fw8p.Name = _S("99|182|204|199|200|197|196|213")
_v28lzq2fw8p.Size = UDim2.new(0, _vjovdjbkqdu, 1, -(_v77wk9s4m9i + (_v7uw3gvjzg2 and _vkgpwlta6hj or 0)))
_v28lzq2fw8p.Position = UDim2.new(0, 0, 0, _v77wk9s4m9i)
_v28lzq2fw8p.Visible = not _v7uw3gvjzg2
_v28lzq2fw8p.BackgroundColor3 = Theme.Sidebar
_v28lzq2fw8p.BorderSizePixel = 0
_v28lzq2fw8p.ZIndex = 2
_v28lzq2fw8p.Parent = _vufytsxr3ie

local _vqxapf0zprd = Instance.new(_S("101|171|215|198|210|202"))
_vqxapf0zprd.Size = UDim2.new(0, 1, 1, 0)
_vqxapf0zprd.Position = UDim2.new(1, -1, 0, 0)
_vqxapf0zprd.BackgroundColor3 = Theme.Accent
_vqxapf0zprd.BackgroundTransparency = 0.7
_vqxapf0zprd.BorderSizePixel = 0
_vqxapf0zprd.Parent = _v28lzq2fw8p

local _vb2nnnin798 = Instance.new(_S("71|141|185|168|180|172"))
_vb2nnnin798.Size = UDim2.new(1, 0, 1, -8)
_vb2nnnin798.Position = UDim2.new(0, 0, 0, 4)
_vb2nnnin798.BackgroundTransparency = 1
_vb2nnnin798.Parent = _v28lzq2fw8p

local _vl5jtmb9euf = Instance.new(_S("67|152|140|143|172|182|183|143|164|188|178|184|183"))
_vl5jtmb9euf.SortOrder = Enum.SortOrder.LayoutOrder
_vl5jtmb9euf.Padding = UDim.new(0, 4)
_vl5jtmb9euf.Parent = _vb2nnnin798

local _vps90szey0a = Instance.new(_S("118|203|191|198|215|218|218|223|228|221"))
_vps90szey0a.PaddingTop = UDim.new(0, 6)
_vps90szey0a.PaddingLeft = UDim.new(0, 6)
_vps90szey0a.PaddingRight = UDim.new(0, 6)
_vps90szey0a.Parent = _vb2nnnin798

local _vtfhlllh9ze = Instance.new(_S("113|183|227|210|222|214"))
_vtfhlllh9ze.Size = _v7uw3gvjzg2 and UDim2.new(1, -16, 0, 28) or UDim2.new(1, -_vjovdjbkqdu - 16, 0, 36)
_vtfhlllh9ze.Position = _v7uw3gvjzg2 and UDim2.new(0, 8, 0, _v77wk9s4m9i + 2) or UDim2.new(0, _vjovdjbkqdu + 8, 0, 62)
_vtfhlllh9ze.BackgroundTransparency = 1
_vtfhlllh9ze.Parent = _vufytsxr3ie

local _vs0ah14ya5f = Instance.new(_S("106|190|207|226|222|182|203|204|207|214"))
_vs0ah14ya5f.Size = UDim2.new(1, 0, 1, 0)
_vs0ah14ya5f.BackgroundTransparency = 1
_vs0ah14ya5f.Text = _S("89|160|190|199|190|203|186|197")
_vs0ah14ya5f.TextColor3 = Theme.Text
_vs0ah14ya5f.Font = Enum.Font.GothamBold
_vs0ah14ya5f.TextSize = _v7uw3gvjzg2 and 14 or 15
_vs0ah14ya5f.TextXAlignment = Enum.TextXAlignment.Left
_vs0ah14ya5f.Parent = _vtfhlllh9ze

local _vqrp2ds6k11 = Instance.new(_S("128|198|242|225|237|229"))
_vqrp2ds6k11.Name = _S("129|196|240|239|245|230|239|245|194|243|230|226")
_vqrp2ds6k11.Size = _v7uw3gvjzg2 and UDim2.new(1, -16, 1, -(_v77wk9s4m9i + _vkgpwlta6hj + 38)) or UDim2.new(1, -_vjovdjbkqdu - 16, 1, -108)
_vqrp2ds6k11.Position = _v7uw3gvjzg2 and UDim2.new(0, 8, 0, _v77wk9s4m9i + 32) or UDim2.new(0, _vjovdjbkqdu + 8, 0, 98)
_vqrp2ds6k11.BackgroundTransparency = 1
_vqrp2ds6k11.ClipsDescendants = true
_vqrp2ds6k11.Parent = _vufytsxr3ie

local Tabs = {_S("102|172|199|216|211"), _S("92|175|193|200|200"), _S("94|163|177|174"), _S("60|129|180|172|168|171|165|176"), _S("67|151|178|178|175|182"), _S("64|141|169|179|163")}
local _vohrvr2eoym = {
    Farm = {Icon = "⚙", Title = _S("104|175|205|214|205|218|201|212"), Sub = _S("96|161|213|212|207|128|205|201|206|197|128|134|128|198|193|210|205")},
    Sell = {Icon = "⚡", Title = _S("125|190|242|241|236|234|222|241|230|224"), Sub = _S("104|187|205|212|212|136|142|136|221|216|207|218|201|204|205|219")},
    ESP = {Icon = "👁", Title = _S("87|173|192|202|204|184|195|202"), Sub = _S("81|150|164|161|113|119|113|197|195|178|180|182|195|196")},
    Exploit = {Icon = "🎭", Title = _S("96|165|216|208|204|207|201|212|211"), Sub = _S("107|184|218|225|208|216|208|217|223|139|145|139|207|224|219|208|222")},
    Tools = {Icon = "🔧", Title = _S("129|213|240|240|237|244"), Sub = _S("73|156|185|194|105|111|105|192|170|194|185|184|178|183|189|188")},
    Misc = {Icon = "⚙", Title = _S("86|169|187|202|202|191|196|189|201"), Sub = _S("102|169|213|212|204|207|205|134|140|134|211|207|217|201")},
}
local _vwv1r1mrneq = {}
local _vkwowivmglz = {}
local _vpzq5mwhpha = {}

for i, tabName in ipairs(Tabs) do
    local info = _vohrvr2eoym[tabName]
    local _vu89mxax3rz = Instance.new(_S("69|153|170|189|185|135|186|185|185|180|179"))
    _vu89mxax3rz.Name = tabName .. _S("84|168|181|182")
    _vu89mxax3rz.Size = _v7uw3gvjzg2 and UDim2.new(1 / #Tabs, -3, 1, -4) or UDim2.new(1, 0, 0, 52)
    _vu89mxax3rz.BackgroundColor3 = Theme.Panel
    _vu89mxax3rz.BackgroundTransparency = tabName == _S("97|167|194|211|206") and 0 or 0.35
    _vu89mxax3rz.BorderSizePixel = 0
    _vu89mxax3rz.Text = ""
    _vu89mxax3rz.AutoButtonColor = false
    _vu89mxax3rz.LayoutOrder = i
    _vu89mxax3rz.Parent = _vb2nnnin798

    local _vqjrdb4eldg = Instance.new(_S("94|179|167|161|205|208|204|195|208"))
    _vqjrdb4eldg.CornerRadius = UDim.new(0, 8)
    _vqjrdb4eldg.Parent = _vu89mxax3rz

    local icon = Instance.new(_S("109|193|210|229|225|185|206|207|210|217"))
    icon.Size = UDim2.new(0, 28, 0, 28)
    icon.Position = UDim2.new(0, 8, 0.5, -14)
    icon.BackgroundTransparency = 1
    icon.Text = info.Icon
    icon.TextColor3 = Theme.Accent
    icon.TextSize = 16
    icon.Font = Enum.Font.GothamBold
    icon.Parent = _vu89mxax3rz

    local _vxcl8g0e1nf = Instance.new(_S("111|195|212|231|227|187|208|209|212|219"))
    _vxcl8g0e1nf.Size = UDim2.new(1, -44, 0, 18)
    _vxcl8g0e1nf.Position = UDim2.new(0, 38, 0, _v7uw3gvjzg2 and 6 or 8)
    _vxcl8g0e1nf.BackgroundTransparency = 1
    _vxcl8g0e1nf.Text = info.Title
    _vxcl8g0e1nf.TextColor3 = Theme.Text
    _vxcl8g0e1nf.Font = Enum.Font.GothamBold
    _vxcl8g0e1nf.TextSize = _v7uw3gvjzg2 and 10 or 12
    _vxcl8g0e1nf.TextXAlignment = Enum.TextXAlignment.Left
    _vxcl8g0e1nf.Parent = _vu89mxax3rz

    local tSub = Instance.new(_S("102|186|203|222|218|178|199|200|203|210"))
    tSub.Size = UDim2.new(1, -44, 0, 14)
    tSub.Position = UDim2.new(0, 38, 0, _v7uw3gvjzg2 and 24 or 28)
    tSub.BackgroundTransparency = 1
    tSub.Text = info.Sub
    tSub.TextColor3 = Theme.SubText
    tSub.Font = Enum.Font.Gotham
    tSub.TextSize = 9
    tSub.TextXAlignment = Enum.TextXAlignment.Left
    tSub.Parent = _vu89mxax3rz
    if _v7uw3gvjzg2 then
        _vxcl8g0e1nf.Visible = false
        tSub.Visible = false
        icon.Size = UDim2.new(0, 30, 0, 30)
        icon.Position = UDim2.new(0.5, -15, 0.5, -15)
        icon.AnchorPoint = Vector2.new(0.5, 0.5)
    end

    local _vjy5uq78wsw = Instance.new(_S("67|137|181|164|176|168"))
    _vjy5uq78wsw.Size = _v7uw3gvjzg2 and UDim2.new(0.65, 0, 0, 3) or UDim2.new(0, 3, 0.7, 0)
    _vjy5uq78wsw.Position = _v7uw3gvjzg2 and UDim2.new(0.175, 0, 0, 2) or UDim2.new(1, -4, 0.15, 0)
    _vjy5uq78wsw.BackgroundColor3 = Theme.Accent
    _vjy5uq78wsw.BorderSizePixel = 0
    _vjy5uq78wsw.Visible = (tabName == _S("118|188|215|232|227"))
    _vjy5uq78wsw.Parent = _vu89mxax3rz
    local iC = Instance.new(_S("113|198|186|180|224|227|223|214|227"))
    iC.CornerRadius = UDim.new(1, 0)
    iC.Parent = _vjy5uq78wsw

    _vwv1r1mrneq[tabName] = _vu89mxax3rz
    _vpzq5mwhpha[tabName] = _vjy5uq78wsw

    local _vo9n1r0c4w0 = Instance.new(_S("76|159|175|190|187|184|184|181|186|179|146|190|173|185|177"))
    _vo9n1r0c4w0.Name = tabName .. _S("96|163|207|206|212|197|206|212")
    _vo9n1r0c4w0.Size = UDim2.new(1, 0, 1, 0)
    _vo9n1r0c4w0.BackgroundTransparency = 1
    _vo9n1r0c4w0.BorderSizePixel = 0
    _vo9n1r0c4w0.ScrollBarThickness = _v7uw3gvjzg2 and 6 or 3
    _vo9n1r0c4w0.ScrollBarImageColor3 = Theme.Accent
    _vo9n1r0c4w0.CanvasSize = UDim2.new(0, 0, 0, 0)
    _vo9n1r0c4w0.AutomaticCanvasSize = Enum.AutomaticSize.Y
    _vo9n1r0c4w0.Visible = (tabName == _S("97|167|194|211|206"))
    _vo9n1r0c4w0.Parent = _vqrp2ds6k11

    local _v5bj3cusnz5 = Instance.new(_S("100|185|173|176|205|215|216|176|197|221|211|217|216"))
    _v5bj3cusnz5.SortOrder = Enum.SortOrder.LayoutOrder
    _v5bj3cusnz5.Padding = UDim.new(0, 6)
    _v5bj3cusnz5.Parent = _vo9n1r0c4w0

    local _vzer9rzdls9 = Instance.new(_S("61|146|134|141|158|161|161|166|171|164"))
    _vzer9rzdls9.PaddingTop = UDim.new(0, 4)
    _vzer9rzdls9.PaddingBottom = UDim.new(0, 8)
    _vzer9rzdls9.PaddingLeft = UDim.new(0, 2)
    _vzer9rzdls9.PaddingRight = UDim.new(0, 6)
    _vzer9rzdls9.Parent = _vo9n1r0c4w0

    _vkwowivmglz[tabName] = _vo9n1r0c4w0
end

local BottomBar
if _v7uw3gvjzg2 then
    BottomBar = Instance.new(_S("123|193|237|220|232|224"))
    BottomBar.Name = _S("111|177|222|227|227|222|220|195|208|209|177|208|225")
    BottomBar.Size = UDim2.new(1, 0, 0, _vkgpwlta6hj)
    BottomBar.Position = UDim2.new(0, 0, 1, -_vkgpwlta6hj)
    BottomBar.BackgroundColor3 = Theme.Sidebar
    BottomBar.BorderSizePixel = 0
    BottomBar.ZIndex = 4
    BottomBar.Parent = _vufytsxr3ie

    local _vqrea854mxu = Instance.new(_S("130|200|244|227|239|231"))
    _vqrea854mxu.Size = UDim2.new(1, 0, 0, 1)
    _vqrea854mxu.BackgroundColor3 = Theme.Accent
    _vqrea854mxu.BackgroundTransparency = 0.5
    _vqrea854mxu.BorderSizePixel = 0
    _vqrea854mxu.Parent = BottomBar

    _vb2nnnin798.Parent = BottomBar
    _vb2nnnin798.Size = UDim2.new(1, -8, 1, -6)
    _vb2nnnin798.Position = UDim2.new(0, 4, 0, 4)
    _vl5jtmb9euf.FillDirection = Enum.FillDirection.Horizontal
    _vl5jtmb9euf.HorizontalAlignment = Enum.HorizontalAlignment.Center
    _vl5jtmb9euf.VerticalAlignment = Enum.VerticalAlignment.Center
    _vl5jtmb9euf.Padding = UDim.new(0, 3)
    _vps90szey0a.PaddingTop = UDim.new(0, 2)
    _vps90szey0a.PaddingLeft = UDim.new(0, 2)
    _vps90szey0a.PaddingRight = UDim.new(0, 2)
end

local function _vh6p0m8zw5e()
    if _v7uw3gvjzg2 then
        _vufytsxr3ie.Visible = not _vufytsxr3ie.Visible
        State.GUIHidden = not _vufytsxr3ie.Visible
        _vzpm7xbnduk.Visible = false
        _vd8kjz21xvn.Enabled = true
    else
        _vd8kjz21xvn.Enabled = not _vd8kjz21xvn.Enabled
        State.GUIHidden = not _vd8kjz21xvn.Enabled
        if _vd8kjz21xvn.Enabled then
            _vufytsxr3ie.Visible = true
            _vzpm7xbnduk.Visible = false
        end
    end
end

if _v7uw3gvjzg2 then
    local _vxzdzmyj71n = Instance.new(_S("128|211|227|242|229|229|238|199|245|233"))
    _vxzdzmyj71n.Name = _S("67|144|172|177|168|164|144|178|165|172|175|168|151|178|170|170|175|168")
    _vxzdzmyj71n.ResetOnSpawn = false
    _vxzdzmyj71n.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    _vxzdzmyj71n.IgnoreGuiInset = true
    _vxzdzmyj71n.DisplayOrder = 1000
    Exec.ProtectGui(_vxzdzmyj71n)
    pcall(function() _vxzdzmyj71n.Parent = Exec.GetGuiParent() end)
    if not _vxzdzmyj71n.Parent then
        _vxzdzmyj71n.Parent = _vx06boh6bcr:WaitForChild(_S("76|156|184|173|197|177|190|147|193|181"))
    end

    local _vgl3xajj2fe = Instance.new(_S("78|162|179|198|194|144|195|194|194|189|188"))
    _vgl3xajj2fe.Name = _S("82|159|193|180|187|190|183|166|193|185|185|190|183")
    _vgl3xajj2fe.Size = UDim2.new(0, 54, 0, 54)
    _vgl3xajj2fe.Position = UDim2.new(1, -64, 0.5, 0)
    _vgl3xajj2fe.AnchorPoint = Vector2.new(0, 0.5)
    _vgl3xajj2fe.BackgroundColor3 = Theme.Accent
    _vgl3xajj2fe.BorderSizePixel = 0
    _vgl3xajj2fe.Text = "M"
    _vgl3xajj2fe.TextColor3 = Color3.fromRGB(10, 10, 12)
    _vgl3xajj2fe.Font = Enum.Font.GothamBlack
    _vgl3xajj2fe.TextSize = 24
    _vgl3xajj2fe.ZIndex = 20
    _vgl3xajj2fe.Parent = _vxzdzmyj71n
    local mtC = Instance.new(_S("117|202|190|184|228|231|227|218|231"))
    mtC.CornerRadius = UDim.new(1, 0)
    mtC.Parent = _vgl3xajj2fe
    local mtS = Instance.new(_S("89|174|162|172|205|203|200|196|190"))
    mtS.Color = Theme.Accent
    mtS.Thickness = 2
    mtS.Transparency = 0.3
    mtS.Parent = _vgl3xajj2fe
    _vgl3xajj2fe.MouseButton1Click:Connect(_vh6p0m8zw5e)
end

local function _vrwfxvhbity(tabName)
    State.TabOpen = tabName
    local info = _vohrvr2eoym[tabName]
    if info then _vs0ah14ya5f.Text = info.Title end
    for name, frame in pairs(_vkwowivmglz) do
        frame.Visible = (name == tabName)
    end
    for name, btn in pairs(_vwv1r1mrneq) do
        btn.BackgroundTransparency = (name == tabName) and 0 or 0.35
        if _vpzq5mwhpha[name] then
            _vpzq5mwhpha[name].Visible = (name == tabName)
        end
    end
end

for tabName, btn in pairs(_vwv1r1mrneq) do
    btn.MouseButton1Click:Connect(function()
        _vrwfxvhbity(tabName)
    end)
end

local _vzpm7xbnduk = Instance.new(_S("93|163|207|190|202|194"))
_vzpm7xbnduk.Size = _v6xtgcdw7hf
_vzpm7xbnduk.Position = _vtmgnw71i6j
_vzpm7xbnduk.BackgroundColor3 = Theme.Bg
_vzpm7xbnduk.BorderSizePixel = 0
_vzpm7xbnduk.Visible = false
_vzpm7xbnduk.Parent = _vd8kjz21xvn
local miniC = Instance.new(_S("90|175|163|157|201|204|200|191|204"))
miniC.CornerRadius = UDim.new(0, 10)
miniC.Parent = _vzpm7xbnduk
local miniS = Instance.new(_S("95|180|168|178|211|209|206|202|196"))
miniS.Color = Theme.Accent
miniS.Thickness = 1
miniS.Transparency = 0.5
miniS.Parent = _vzpm7xbnduk

local _vuvtg78njjm = Instance.new(_S("122|206|223|242|238|198|219|220|223|230"))
_vuvtg78njjm.Size = UDim2.new(0.65, 0, 1, 0)
_vuvtg78njjm.Position = UDim2.new(0.08, 0, 0, 0)
_vuvtg78njjm.BackgroundTransparency = 1
_vuvtg78njjm.Text = "⛏ Minea Hub"
_vuvtg78njjm.TextColor3 = Theme.Accent
_vuvtg78njjm.Font = Enum.Font.GothamBold
_vuvtg78njjm.TextSize = 12
_vuvtg78njjm.TextXAlignment = Enum.TextXAlignment.Left
_vuvtg78njjm.Parent = _vzpm7xbnduk

local _v4iq3n8pegb = Instance.new(_S("79|163|180|199|195|145|196|195|195|190|189"))
_v4iq3n8pegb.Size = UDim2.new(0, 36, 0, 26)
_v4iq3n8pegb.Position = UDim2.new(1, -42, 0.5, -13)
_v4iq3n8pegb.BackgroundColor3 = Theme.Accent
_v4iq3n8pegb.Text = "□"
_v4iq3n8pegb.TextColor3 = Color3.fromRGB(10, 10, 12)
_v4iq3n8pegb.Font = Enum.Font.GothamBold
_v4iq3n8pegb.TextSize = 14
_v4iq3n8pegb.Parent = _vzpm7xbnduk
local expC = Instance.new(_S("89|174|162|156|200|203|199|190|203"))
expC.CornerRadius = UDim.new(0, 6)
expC.Parent = _v4iq3n8pegb

local _vhzdtx290kg = 0

local function _v3prdue8pwa(parent, title)
    _vhzdtx290kg = _vhzdtx290kg + 1
    local wrap = Instance.new(_S("74|144|188|171|183|175"))
    wrap.Size = UDim2.new(1, 0, 0, 32)
    wrap.BackgroundTransparency = 1
    wrap.LayoutOrder = _vhzdtx290kg
    wrap.Parent = parent

    local line = Instance.new(_S("83|153|197|180|192|184"))
    line.Size = UDim2.new(1, 0, 0, 1)
    line.Position = UDim2.new(0, 0, 0, 0)
    line.BackgroundColor3 = Theme.Accent
    line.BackgroundTransparency = 0.35
    line.BorderSizePixel = 0
    line.Parent = wrap

    local _vnadfgzum2q = Instance.new(_S("61|145|162|181|177|137|158|159|162|169"))
    _vnadfgzum2q.Size = UDim2.new(0, 18, 0, 18)
    _vnadfgzum2q.Position = UDim2.new(0, 0, 0, 8)
    _vnadfgzum2q.BackgroundTransparency = 1
    _vnadfgzum2q.Text = "🔑"
    _vnadfgzum2q.TextSize = 12
    _vnadfgzum2q.Parent = wrap

    local label = Instance.new(_S("73|157|174|193|189|149|170|171|174|181"))
    label.Size = UDim2.new(1, -24, 0, 20)
    label.Position = UDim2.new(0, 22, 0, 8)
    label.BackgroundTransparency = 1
    label.Text = title
    label.TextColor3 = Theme.Text
    label.Font = Enum.Font.GothamBold
    label.TextSize = _v7uw3gvjzg2 and 11 or 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = wrap
    return wrap
end

local function _vs0txs7j9rj(parent, name, default, callback)
    _vhzdtx290kg = _vhzdtx290kg + 1
    local frame = Instance.new(_S("129|199|243|226|238|230"))
    frame.Size = UDim2.new(1, 0, 0, _v7uw3gvjzg2 and 44 or 36)
    frame.BackgroundColor3 = Theme.Panel
    frame.BackgroundTransparency = 0.15
    frame.BorderSizePixel = 0
    frame.LayoutOrder = _vhzdtx290kg
    frame.Parent = parent

    local _vk8zjwr4xmy = Instance.new(_S("96|181|169|163|207|210|206|197|210"))
    _vk8zjwr4xmy.CornerRadius = UDim.new(0, 8)
    _vk8zjwr4xmy.Parent = frame

    local _v97t1u9zf68 = Instance.new(_S("103|188|176|186|219|217|214|210|204"))
    _v97t1u9zf68.Color = Theme.Accent
    _v97t1u9zf68.Thickness = 1
    _v97t1u9zf68.Transparency = 0.85
    _v97t1u9zf68.Parent = frame

    local label = Instance.new(_S("61|145|162|181|177|137|158|159|162|169"))
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.Text
    label.Font = Enum.Font.Gotham
    label.TextSize = _v7uw3gvjzg2 and 11 or 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local check = Instance.new(_S("100|184|201|220|216|166|217|216|216|211|210"))
    check.Size = _v7uw3gvjzg2 and UDim2.new(0, 32, 0, 32) or UDim2.new(0, 20, 0, 20)
    check.Position = _v7uw3gvjzg2 and UDim2.new(1, -40, 0.5, -16) or UDim2.new(1, -30, 0.5, -10)
    check.BackgroundColor3 = default and Theme.Accent or Theme.Input
    check.BorderSizePixel = 0
    check.Text = default and "✓" or ""
    check.TextColor3 = Color3.fromRGB(10, 10, 12)
    check.Font = Enum.Font.GothamBold
    check.TextSize = 14
    check.Parent = frame
    local cC = Instance.new(_S("101|186|174|168|212|215|211|202|215"))
    cC.CornerRadius = UDim.new(0, 4)
    cC.Parent = check

    local _vpkug4vsg5d = default
    check.MouseButton1Click:Connect(function()
        _vpkug4vsg5d = not _vpkug4vsg5d
        check.BackgroundColor3 = _vpkug4vsg5d and Theme.Accent or Theme.Input
        check.Text = _vpkug4vsg5d and "✓" or ""
        callback(_vpkug4vsg5d)
    end)
    return frame, check
end

local function _vd1myvockm6(parent, name, _, callback)
    _vhzdtx290kg = _vhzdtx290kg + 1
    local btn = Instance.new(_S("120|204|221|240|236|186|237|236|236|231|230"))
    btn.Size = UDim2.new(1, 0, 0, _v7uw3gvjzg2 and 44 or 34)
    btn.BackgroundColor3 = Theme.Panel
    btn.BackgroundTransparency = 0.1
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.TextColor3 = Theme.Text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = _v7uw3gvjzg2 and 11 or 12
    btn.LayoutOrder = _vhzdtx290kg
    btn.AutoButtonColor = false
    btn.Parent = parent

    local _vk8zjwr4xmy = Instance.new(_S("62|147|135|129|173|176|172|163|176"))
    _vk8zjwr4xmy.CornerRadius = UDim.new(0, 8)
    _vk8zjwr4xmy.Parent = btn

    local _v97t1u9zf68 = Instance.new(_S("68|153|141|151|184|182|179|175|169"))
    _v97t1u9zf68.Color = Theme.Accent
    _v97t1u9zf68.Thickness = 1
    _v97t1u9zf68.Transparency = 0.55
    _v97t1u9zf68.Parent = btn

    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Theme.Input
        _v97t1u9zf68.Transparency = 0.2
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Theme.Panel
        btn.BackgroundTransparency = 0.1
        _v97t1u9zf68.Transparency = 0.55
    end)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

local function _vekefw23g16(parent, name, minVal, maxVal, defaultVal, callback)
    _vhzdtx290kg = _vhzdtx290kg + 1
    local frame = Instance.new(_S("94|164|208|191|203|195"))
    frame.Size = UDim2.new(1, 0, 0, _v7uw3gvjzg2 and 56 or 48)
    frame.BackgroundColor3 = Theme.Panel
    frame.BackgroundTransparency = 0.15
    frame.BorderSizePixel = 0
    frame.LayoutOrder = _vhzdtx290kg
    frame.Parent = parent

    local _vk8zjwr4xmy = Instance.new(_S("65|150|138|132|176|179|175|166|179"))
    _vk8zjwr4xmy.CornerRadius = UDim.new(0, 8)
    _vk8zjwr4xmy.Parent = frame

    local label = Instance.new(_S("103|187|204|223|219|179|200|201|204|211"))
    label.Size = UDim2.new(0.7, 0, 0, 18)
    label.Position = UDim2.new(0, 12, 0, 6)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.SubText
    label.Font = Enum.Font.Gotham
    label.TextSize = _v7uw3gvjzg2 and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local _v23erge8a3t = Instance.new(_S("113|197|214|233|229|189|210|211|214|221"))
    _v23erge8a3t.Size = UDim2.new(0, 50, 0, 18)
    _v23erge8a3t.Position = UDim2.new(1, -58, 0, 6)
    _v23erge8a3t.BackgroundTransparency = 1
    _v23erge8a3t.Text = tostring(defaultVal)
    _v23erge8a3t.TextColor3 = Theme.Accent
    _v23erge8a3t.Font = Enum.Font.GothamBold
    _v23erge8a3t.TextSize = 11
    _v23erge8a3t.TextXAlignment = Enum.TextXAlignment.Right
    _v23erge8a3t.Parent = frame

    local _vhux666bbvb = Instance.new(_S("89|159|203|186|198|190"))
    _vhux666bbvb.Size = UDim2.new(1, -24, 0, 8)
    _vhux666bbvb.Position = UDim2.new(0, 12, 0, 30)
    _vhux666bbvb.BackgroundColor3 = Theme.Input
    _vhux666bbvb.BorderSizePixel = 0
    _vhux666bbvb.Parent = frame

    local _vox81uyfo3v = Instance.new(_S("124|209|197|191|235|238|234|225|238"))
    _vox81uyfo3v.CornerRadius = UDim.new(1, 0)
    _vox81uyfo3v.Parent = _vhux666bbvb

    local pct = (defaultVal - minVal) / (maxVal - minVal)
    local _v4ky1lg2brm = Instance.new(_S("93|163|207|190|202|194"))
    _v4ky1lg2brm.Size = UDim2.new(pct, 0, 1, 0)
    _v4ky1lg2brm.BackgroundColor3 = Theme.Accent
    _v4ky1lg2brm.BorderSizePixel = 0
    _v4ky1lg2brm.Parent = _vhux666bbvb
    local _voc1d6vypd0 = Instance.new(_S("104|189|177|171|215|218|214|205|218"))
    _voc1d6vypd0.CornerRadius = UDim.new(1, 0)
    _voc1d6vypd0.Parent = _v4ky1lg2brm

    local _vyarp4ns6l7 = false
    local function _vsu5d6gb6gg(input)
        local relX = math.clamp((input.Position.X - _vhux666bbvb.AbsolutePosition.X) / _vhux666bbvb.AbsoluteSize.X, 0, 1)
        local val = math.floor(minVal + (maxVal - minVal) * relX)
        _v4ky1lg2brm.Size = UDim2.new(relX, 0, 1, 0)
        _v23erge8a3t.Text = tostring(val)
        callback(val)
    end

    _vhux666bbvb.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            _vyarp4ns6l7 = true
            _vsu5d6gb6gg(input)
        end
    end)
    _vig1weh01jf.InputChanged:Connect(function(input)
        if _vyarp4ns6l7 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            _vsu5d6gb6gg(input)
        end
    end)
    _vig1weh01jf.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            _vyarp4ns6l7 = false
        end
    end)
    return frame
end

local function _v7mks517xou(parent, name, defaultText, callback)
    _vhzdtx290kg = _vhzdtx290kg + 1
    local frame = Instance.new(_S("121|191|235|218|230|222"))
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.BackgroundColor3 = Theme.Panel
    frame.BackgroundTransparency = 0.15
    frame.BorderSizePixel = 0
    frame.LayoutOrder = _vhzdtx290kg
    frame.Parent = parent

    local _vk8zjwr4xmy = Instance.new(_S("96|181|169|163|207|210|206|197|210"))
    _vk8zjwr4xmy.CornerRadius = UDim.new(0, 8)
    _vk8zjwr4xmy.Parent = frame

    local label = Instance.new(_S("103|187|204|223|219|179|200|201|204|211"))
    label.Size = UDim2.new(0.38, 0, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.SubText
    label.Font = Enum.Font.Gotham
    label.TextSize = _v7uw3gvjzg2 and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local input = Instance.new(_S("126|210|227|246|242|192|237|246"))
    input.Size = UDim2.new(0.55, 0, 0, 26)
    input.Position = UDim2.new(0.42, 0, 0.5, -13)
    input.BackgroundColor3 = Theme.Input
    input.BorderSizePixel = 0
    input.Text = defaultText
    input.PlaceholderText = name
    input.TextColor3 = Theme.Text
    input.PlaceholderColor3 = Theme.Muted
    input.Font = Enum.Font.Gotham
    input.TextSize = _v7uw3gvjzg2 and 10 or 11
    input.ClearTextOnFocus = false
    input.Parent = frame

    local _va6htmk013j = Instance.new(_S("95|180|168|162|206|209|205|196|209"))
    _va6htmk013j.CornerRadius = UDim.new(0, 6)
    _va6htmk013j.Parent = input

    local _vck2dp95np7 = Instance.new(_S("88|173|161|171|204|202|199|195|189"))
    _vck2dp95np7.Color = Theme.Accent
    _vck2dp95np7.Thickness = 1
    _vck2dp95np7.Transparency = 0.75
    _vck2dp95np7.Parent = input

    input.FocusLost:Connect(function()
        callback(input.Text)
    end)
    return frame, input
end

local function _vqkat7qqxka()
    _vhzdtx290kg = 0
end

local _vg5xrn9mwxy = _vkwowivmglz[_S("112|182|209|226|221")]
_vqkat7qqxka()

_v3prdue8pwa(_vg5xrn9mwxy, "📊 STATS")
_vhzdtx290kg = _vhzdtx290kg + 1
local _vix3xhgzy8a = Instance.new(_S("60|130|174|157|169|161"))
_vix3xhgzy8a.Size = UDim2.new(1, 0, 0, 52)
_vix3xhgzy8a.BackgroundColor3 = Theme.Panel
_vix3xhgzy8a.BackgroundTransparency = 0.1
_vix3xhgzy8a.BorderSizePixel = 0
_vix3xhgzy8a.LayoutOrder = _vhzdtx290kg
_vix3xhgzy8a.Parent = _vg5xrn9mwxy

local _vbf6v3axuze = Instance.new(_S("67|152|140|134|178|181|177|168|181"))
_vbf6v3axuze.CornerRadius = UDim.new(0, 8)
_vbf6v3axuze.Parent = _vix3xhgzy8a

local _vyi83lq3d0b = Instance.new(_S("107|192|180|190|223|221|218|214|208"))
_vyi83lq3d0b.Color = Theme.Accent
_vyi83lq3d0b.Thickness = 1
_vyi83lq3d0b.Transparency = 0.8
_vyi83lq3d0b.Parent = _vix3xhgzy8a

local _vk0vk15tvv8 = Instance.new(_S("68|152|169|188|184|144|165|166|169|176"))
_vk0vk15tvv8.Name = _S("63|146|179|160|179|178|147|164|183|179")
_vk0vk15tvv8.Size = UDim2.new(1, -12, 0, 28)
_vk0vk15tvv8.Position = UDim2.new(0, 10, 0, 4)
_vk0vk15tvv8.BackgroundTransparency = 1
_vk0vk15tvv8.Text = _S("106|183|211|216|207|206|164|138|154|138|230|138|189|207|214|214|221|164|138|154|138|230|138|190|203|220|209|207|222|164|138|184|217|216|207")
_vk0vk15tvv8.TextColor3 = Theme.SubText
_vk0vk15tvv8.Font = Enum.Font.Gotham
_vk0vk15tvv8.TextSize = _v7uw3gvjzg2 and 9 or 10
_vk0vk15tvv8.TextXAlignment = Enum.TextXAlignment.Left
_vk0vk15tvv8.TextWrapped = true
_vk0vk15tvv8.Parent = _vix3xhgzy8a

CashLabel = Instance.new(_S("85|169|186|205|201|161|182|183|186|193"))
CashLabel.Name = _S("92|159|189|207|196|176|193|212|208")
CashLabel.Size = UDim2.new(1, -12, 0, 18)
CashLabel.Position = UDim2.new(0, 10, 0, 30)
CashLabel.BackgroundTransparency = 1
CashLabel.Text = _S("70|137|167|185|174|128|102|118|102|194|102|157|171|175|173|174|186|128|102|118|117|119|118|118")
CashLabel.TextColor3 = Theme.Accent
CashLabel.Font = Enum.Font.GothamBold
CashLabel.TextSize = _v7uw3gvjzg2 and 9 or 10
CashLabel.TextXAlignment = Enum.TextXAlignment.Left
CashLabel.Parent = _vix3xhgzy8a

local function _vv38khu11us()
    _vk0vk15tvv8.Text = _S("64|141|169|174|165|164|122|96") .. State.FarmCount .. _S("103|135|227|135|186|204|211|211|218|161|135") .. State.SellCount .. _S("90|122|214|122|158|207|202|191|148|122") .. State.DupeCount .. _S("65|97|189|97|149|162|179|168|166|181|123|97") .. (State.CurrentTarget or _S("112|190|223|222|213"))
    if CashLabel then
        CashLabel.Text = _S("84|151|181|199|188|142|116") .. _vze9z0i2h17() .. _S("72|104|196|104|159|173|177|175|176|188|130|104") .. math.floor(_vj5d9fbfg8v()) .. "/" .. math.floor(_vriuf5arb8y())
    end
end

_v3prdue8pwa(_vg5xrn9mwxy, "🔄 SMART LOOP")

_vs0txs7j9rj(_vg5xrn9mwxy, "Smart Loop (Farm→Sell→Upgrade)", false, function(val)
    _vsmeofirta7.SmartLoop = val
    if val then _vrtajc2aov6() else _v9ec9iuny86() end
end)

_vs0txs7j9rj(_vg5xrn9mwxy, _S("103|168|220|219|214|135|172|216|220|208|215|135|169|204|218|219|135|183|208|202|210|200|223|204"), false, function(val)
    _vsmeofirta7.AutoEquipPickaxe = val
end)

_vs0txs7j9rj(_vg5xrn9mwxy, _S("72|154|169|184|177|172|104|149|177|182|173|104|112|181|189|180|188|177|117|176|177|188|113"), false, function(val)
    _vsmeofirta7.RapidMine = val
end)

_vekefw23g16(_vg5xrn9mwxy, _S("62|144|159|174|167|162|94|139|167|172|163|94|134|167|178|177"), 1, 10, 3, function(val)
    _vsmeofirta7.RapidMineCount = val
end)

_vs0txs7j9rj(_vg5xrn9mwxy, _S("122|187|239|238|233|154|189|233|230|230|223|221|238|154|190|236|233|234|237"), false, function(val)
    _vsmeofirta7.AutoCollectDrops = val
    if val then _vlyxuqja2zc() else State.DropCollectConn = nil end
end)

_vs0txs7j9rj(_vg5xrn9mwxy, _S("69|135|190|181|166|184|184|101|149|183|180|178|181|185|101|141|180|177|169"), true, function(val)
    _vsmeofirta7.BypassPromptHold = val
end)

_vs0txs7j9rj(_vg5xrn9mwxy, _S("124|208|243|225|225|234|156|208|225|232|225|236|235|238|240"), false, function(val)
    _vsmeofirta7.TweenTeleport = val
end)

_v3prdue8pwa(_vg5xrn9mwxy, "🎯 ORE FILTER")

_vs0txs7j9rj(_vg5xrn9mwxy, _S("118|187|228|215|216|226|219|150|197|232|219|150|188|223|226|234|219|232"), false, function(val)
    _vsmeofirta7.OreFilterEnabled = val
end)

_v7mks517xou(_vg5xrn9mwxy, _S("92|179|196|197|208|193|200|197|207|208|124|171|206|193|207"), _vsmeofirta7.OreFilter, function(text)
    _vsmeofirta7.OreFilter = text
end)

_v7mks517xou(_vg5xrn9mwxy, _S("86|152|194|183|185|193|194|191|201|202|118|165|200|187|201"), _vsmeofirta7.OreBlacklist, function(text)
    _vsmeofirta7.OreBlacklist = text
end)

_v3prdue8pwa(_vg5xrn9mwxy, "⛏ AUTO FARM")

_vs0txs7j9rj(_vg5xrn9mwxy, _S("66|131|183|182|177|98|136|163|180|175|98|148|177|165|173|181|113|133|180|187|181|182|163|174|181"), false, function(val)
    _vsmeofirta7.AutoFarm = val
    if val then _vqm4vfjxvqc() else _vdvnank3aq7() end
end)

_vs0txs7j9rj(_vg5xrn9mwxy, _S("69|149|183|174|180|183|174|185|190|101|141|174|172|173|170|184|185|101|155|166|177|186|170"), false, function(val)
    _vsmeofirta7.PriorityHighestValue = val
    if val then _vsmeofirta7.PriorityClosest = false end
end)

_vs0txs7j9rj(_vg5xrn9mwxy, _S("107|187|221|212|218|221|212|223|228|139|174|215|218|222|208|222|223"), true, function(val)
    _vsmeofirta7.PriorityClosest = val
    if val then _vsmeofirta7.PriorityHighestValue = false end
end)

_vekefw23g16(_vg5xrn9mwxy, _S("117|187|214|231|226|149|199|214|217|222|234|232"), 50, 2000, 500, function(val)
    _vsmeofirta7.FarmRadius = val
end)

_vekefw23g16(_vg5xrn9mwxy, _S("106|176|203|220|215|138|174|207|214|203|227"), 1, 100, 5, function(val)
    _vsmeofirta7.FarmDelay = val / 100
end)

_vd1myvockm6(_vg5xrn9mwxy, "🔍 Scan Rocks Now", Color3.fromRGB(40, 80, 160), function()
    local rocks = _vvobjxev3un()
    _vrt94ifoowp(_S("98|168|209|215|208|198|130") .. #rocks .. _S("130|162|244|241|229|237|245|177|229|244|251|245|246|227|238|245"))
end)

_vd1myvockm6(_vg5xrn9mwxy, "⛏ Mine Nearest Rock", Color3.fromRGB(40, 120, 60), function()
    local rocks = _vvobjxev3un()
    if #rocks > 0 then
        _viazvpfsl4r(rocks[1])
    else
        _vrt94ifoowp(_S("91|169|202|123|205|202|190|198|206|123|193|202|208|201|191|124"))
    end
end)

_vd1myvockm6(_vg5xrn9mwxy, "⚡ Cache Remotes", Color3.fromRGB(100, 50, 150), function()
    _vb3f0c4qsg1()
end)

local _vpbdmbjnkzh = _vkwowivmglz[_S("83|166|184|191|191")]
_vqkat7qqxka()

_v3prdue8pwa(_vpbdmbjnkzh, "💰 AUTO SELL")

_vs0txs7j9rj(_vpbdmbjnkzh, _S("82|165|183|190|190|114|169|186|183|192|114|148|179|181|189|194|179|181|189|114|152|199|190|190"), true, function(val)
    _vsmeofirta7.SellWhenFull = val
end)

_vekefw23g16(_vpbdmbjnkzh, _S("111|194|212|219|219|143|188|216|221|143|178|208|226|215|143|195|215|225|212|226|215|222|219|211"), 0, 500000, 0, function(val)
    _vsmeofirta7.SellMinCash = val
end)

_vs0txs7j9rj(_vpbdmbjnkzh, _S("85|150|202|201|196|117|168|186|193|193"), false, function(val)
    _vsmeofirta7.AutoSell = val
    if val then _vwt78vhjd68() else _vjh4g4kgmcj() end
end)

_vekefw23g16(_vpbdmbjnkzh, _S("63|146|164|171|171|95|145|160|163|168|180|178"), 50, 1000, 300, function(val)
    _vsmeofirta7.SellRadius = val
end)

_vekefw23g16(_vpbdmbjnkzh, _S("62|145|163|170|170|94|130|163|170|159|183"), 1, 50, 3, function(val)
    _vsmeofirta7.SellDelay = val / 10
end)

_vd1myvockm6(_vpbdmbjnkzh, "💰 Sell at Nearest Shop", Color3.fromRGB(140, 100, 30), function()
    local shops = _v2e183n3k8o()
    if #shops > 0 then
        _vzv4nm24j68(shops[1])
    else
        _vrt94ifoowp(_S("78|156|189|110|193|182|189|190|193|110|180|189|195|188|178|111"))
    end
end)

_vd1myvockm6(_vpbdmbjnkzh, "🏠 Go Home / Teleport to Shop", Color3.fromRGB(80, 50, 150), function()
    local shops = _v2e183n3k8o()
    if #shops > 0 then
        _v227syc5l79(shops[1].Part.Position)
        _vrt94ifoowp(_S("83|167|184|191|184|195|194|197|199|184|183|115|199|194|141|115") .. shops[1].Name)
    end
end)

_v3prdue8pwa(_vpbdmbjnkzh, "🛒 AUTO BUY UPGRADES")

_vs0txs7j9rj(_vpbdmbjnkzh, _S("126|191|243|242|237|158|192|243|247|158|206|231|225|233|223|246|227"), false, function(val) _vsmeofirta7.AutoBuyPickaxe = val end)
_vs0txs7j9rj(_vpbdmbjnkzh, _S("127|192|244|243|238|159|193|244|248|159|193|224|226|234|239|224|226|234"), false, function(val) _vsmeofirta7.AutoBuyBackpack = val end)
_vs0txs7j9rj(_vpbdmbjnkzh, _S("116|181|233|232|227|148|182|233|237|148|192|233|215|223"), false, function(val) _vsmeofirta7.AutoBuyLuck = val end)
_vs0txs7j9rj(_vpbdmbjnkzh, _S("128|193|245|244|239|160|194|245|249|160|215|225|242|237|244|232"), false, function(val) _vsmeofirta7.AutoBuyWarmth = val end)

_vs0txs7j9rj(_vpbdmbjnkzh, _S("127|192|244|243|238|159|209|228|225|232|241|243|231"), false, function(val) _vsmeofirta7.AutoRebirth = val end)

_vekefw23g16(_vpbdmbjnkzh, _S("112|194|213|210|217|226|228|216|144|179|209|227|216|144|196|216|226|213|227|216|223|220|212"), 1000, 1000000, 50000, function(val)
    _vsmeofirta7.RebirthCashThreshold = val
end)

_vs0txs7j9rj(_vpbdmbjnkzh, _S("116|181|233|232|227|148|183|224|213|221|225|148|184|213|221|224|237|163|183|227|216|217"), false, function(val) _vsmeofirta7.AutoClaimDaily = val end)

_v7mks517xou(_vpbdmbjnkzh, _S("83|163|197|194|192|194|115|150|194|183|184"), "", function(text) _vsmeofirta7.PromoCode = text end)

_vd1myvockm6(_vpbdmbjnkzh, "🎁 Claim Daily Now", Color3.fromRGB(180, 130, 40), function()
    _vbi8cpg1csu()
    _vrt94ifoowp(_S("116|183|224|213|221|225|217|216|148|216|213|221|224|237|148|230|217|235|213|230|216|231"))
end)

_v3prdue8pwa(_vpbdmbjnkzh, "🔄 AUTO UPGRADE")

_vs0txs7j9rj(_vpbdmbjnkzh, _S("64|129|181|180|175|96|149|176|167|178|161|164|165"), false, function(val)
    _vsmeofirta7.AutoUpgrade = val
    if val then _vktf3lx0p2j() else _v1e2061dn0o() end
end)

_vd1myvockm6(_vpbdmbjnkzh, "⬆ Upgrade All", Color3.fromRGB(50, 130, 180), function()
    _vi7orqo253n(_S("93|210|205|196|207|190|193|194"))
    _vi7orqo253n(_S("106|204|223|227"))
    _vi7orqo253n(_S("83|195|200|197|182|187|180|198|184"))
    _vi7orqo253n(_S("78|197|175|192|187|194|182"))
    _vi7orqo253n(_S("74|186|179|173|181|171|194|175"))
    _vi7orqo253n(_S("123|221|220|222|230|235|220|222|230"))
    _vi7orqo253n(_S("105|220|217|206|206|205"))
    _vrt94ifoowp(_S("129|199|234|243|230|229|161|246|241|232|243|226|229|230|161|243|230|238|240|245|230|244"))
end)

_v3prdue8pwa(_vpbdmbjnkzh, "🏪 DETECTED SHOPS")

local _v34od3rytdn = Instance.new(_S("107|190|206|221|218|215|215|212|217|210|177|221|204|216|208"))
ShopList = _v34od3rytdn
ShopList.Name = _S("127|210|231|238|239|203|232|242|243")
ShopList.Size = UDim2.new(1, 0, 0, 90)
ShopList.BackgroundColor3 = Theme.Panel
ShopList.BackgroundTransparency = 0.15
ShopList.BorderSizePixel = 0
ShopList.ScrollBarThickness = 3
ShopList.ScrollBarImageColor3 = Theme.Accent
ShopList.CanvasSize = UDim2.new(0, 0, 0, 0)
ShopList.AutomaticCanvasSize = Enum.AutomaticSize.Y
_vhzdtx290kg = _vhzdtx290kg + 1
ShopList.LayoutOrder = _vhzdtx290kg
ShopList.Parent = _vpbdmbjnkzh

local _vbu6im6rsjg = Instance.new(_S("71|156|144|138|182|185|181|172|185"))
_vbu6im6rsjg.CornerRadius = UDim.new(0, 6)
_vbu6im6rsjg.Parent = ShopList

local _v7w2enbkuwc = Instance.new(_S("71|156|144|147|176|186|187|147|168|192|182|188|187"))
_v7w2enbkuwc.SortOrder = Enum.SortOrder.LayoutOrder
_v7w2enbkuwc.Padding = UDim.new(0, 2)
_v7w2enbkuwc.Parent = ShopList

local _v7mjd8huw9j = Instance.new(_S("119|204|192|199|216|219|219|224|229|222"))
_v7mjd8huw9j.PaddingTop = UDim.new(0, 2)
_v7mjd8huw9j.PaddingBottom = UDim.new(0, 2)
_v7mjd8huw9j.PaddingLeft = UDim.new(0, 2)
_v7mjd8huw9j.PaddingRight = UDim.new(0, 2)
_v7mjd8huw9j.Parent = ShopList

local _v079m7b6df8 = _vkwowivmglz[_S("62|131|145|142")]
_vqkat7qqxka()

_v3prdue8pwa(_v079m7b6df8, "👁 ESP / VISUALS")

_vs0txs7j9rj(_v079m7b6df8, _S("93|160|207|214|208|209|190|201|125|140|125|175|204|192|200|125|162|176|173"), false, function(val)
    _vsmeofirta7.ESPEnabled = val
    if val then _vny6s7oqta2() else _v7m2pu549r4() end
end)

_vs0txs7j9rj(_v079m7b6df8, _S("103|187|217|200|202|204|217|218|135|143|185|214|202|210|218|150|186|207|214|215|218|144"), false, function(val)
    _vsmeofirta7.Tracers = val
    if not val then _v4ktx6kijwa() end
end)

_vs0txs7j9rj(_v079m7b6df8, _S("82|162|190|179|203|183|196|114|151|165|162"), false, function(val)
    _vsmeofirta7.PlayerESP = val
    if not val then _vr7s6mo0yn5() end
end)

_vs0txs7j9rj(_v079m7b6df8, _S("65|132|169|166|180|181|97|112|97|134|183|166|175|181|97|134|148|145"), false, function(val)
    _vsmeofirta7.ChestESP = val
    if not val then _vb1xcg5rwaq() end
end)

_vs0txs7j9rj(_v079m7b6df8, _S("78|148|195|186|186|176|192|183|181|182|194"), false, function(val)
    _vsmeofirta7.Fullbright = val
    if val then _v55xyyx1wxt() else _vgzwj45g9pv() end
end)

_vs0txs7j9rj(_v079m7b6df8, _S("65|137|170|165|166|97|144|181|169|166|179|97|145|173|162|186|166|179|180"), false, function(val)
    _vsmeofirta7.HideOtherPlayers = val
    _vy864y695yu()
end)

_vd1myvockm6(_v079m7b6df8, "🔄 Refresh ESP", Color3.fromRGB(50, 90, 160), function()
    if _vsmeofirta7.ESPEnabled then
        _v0jmlrogbik()
    else
        _vrt94ifoowp(_S("123|192|233|220|221|231|224|155|192|206|203|155|225|228|237|238|239|156"))
    end
end)

_vd1myvockm6(_v079m7b6df8, "❌ Clear ESP", Color3.fromRGB(150, 50, 50), function()
    _v7m2pu549r4()
end)

_v3prdue8pwa(_v079m7b6df8, "🪨 DETECTED ROCKS")

local _vlst2hh5aqr = Instance.new(_S("99|182|198|213|210|207|207|204|209|202|169|213|196|208|200"))
RockList = _vlst2hh5aqr
RockList.Name = _S("89|171|200|188|196|165|194|204|205")
RockList.Size = UDim2.new(1, 0, 0, 120)
RockList.BackgroundColor3 = Theme.Panel
RockList.BackgroundTransparency = 0.15
RockList.BorderSizePixel = 0
RockList.ScrollBarThickness = 3
RockList.ScrollBarImageColor3 = Theme.Accent
RockList.CanvasSize = UDim2.new(0, 0, 0, 0)
RockList.AutomaticCanvasSize = Enum.AutomaticSize.Y
_vhzdtx290kg = _vhzdtx290kg + 1
RockList.LayoutOrder = _vhzdtx290kg
RockList.Parent = _v079m7b6df8

local _v1ml02nc2tu = Instance.new(_S("66|151|139|133|177|180|176|167|180"))
_v1ml02nc2tu.CornerRadius = UDim.new(0, 6)
_v1ml02nc2tu.Parent = RockList

local _vdfehwtunvj = Instance.new(_S("93|178|166|169|198|208|209|169|190|214|204|210|209"))
_vdfehwtunvj.SortOrder = Enum.SortOrder.LayoutOrder
_vdfehwtunvj.Padding = UDim.new(0, 2)
_vdfehwtunvj.Parent = RockList

local rLPad = Instance.new(_S("101|186|174|181|198|201|201|206|211|204"))
rLPad.PaddingTop = UDim.new(0, 2)
rLPad.PaddingBottom = UDim.new(0, 2)
rLPad.PaddingLeft = UDim.new(0, 2)
rLPad.PaddingRight = UDim.new(0, 2)
rLPad.Parent = RockList

local _vut5lzp3qvq = _vkwowivmglz[_S("62|131|182|174|170|173|167|178")]
_vqkat7qqxka()

_v3prdue8pwa(_vut5lzp3qvq, "🎒 EXPLOITS")

_vs0txs7j9rj(_vut5lzp3qvq, _S("97|182|207|205|202|206|202|213|198|197|129|163|194|196|204|209|194|196|204"), false, function(val)
    _vsmeofirta7.UnlimitedBackpack = val
    if val then _vo4cwbuvgdi() end
end)

_vs0txs7j9rj(_vut5lzp3qvq, _S("88|173|198|196|193|197|193|204|189|188|120|164|205|187|195"), false, function(val)
    _vsmeofirta7.UnlimitedLuck = val
    if val then _v5jle2kjnso() end
end)

_vs0txs7j9rj(_vut5lzp3qvq, _S("97|162|207|213|202|129|165|194|206|194|200|198"), false, function(val)
    _vsmeofirta7.AntiDamage = val
    if val then _vf3ja8z4q71() else _v9ns80d8eqi() end
end)

_vs0txs7j9rj(_vut5lzp3qvq, _S("77|142|187|193|182|109|147|191|178|178|199|178|109|117|164|174|191|186|193|181|118"), false, function(val)
    _vsmeofirta7.AntiFreeze = val
    if val and not _vsmeofirta7.AntiDamage then
        _vsmeofirta7.AntiDamage = true
        _vf3ja8z4q71()
    end
end)

_vs0txs7j9rj(_vut5lzp3qvq, _S("64|151|161|178|173|180|168|96|139|165|165|176|165|178"), false, function(val)
    _vsmeofirta7.WarmthKeeper = val
    if val or _vsmeofirta7.StaminaKeeper then _v2tsel5z1yd() else _vjdas5ekv71() end
end)

_vs0txs7j9rj(_vut5lzp3qvq, _S("102|185|218|199|211|207|212|199|134|177|203|203|214|203|216"), false, function(val)
    _vsmeofirta7.StaminaKeeper = val
    if val or _vsmeofirta7.WarmthKeeper then _v2tsel5z1yd() else _vjdas5ekv71() end
end)

_v3prdue8pwa(_vut5lzp3qvq, "🎭 MOVEMENT")

_vs0txs7j9rj(_vut5lzp3qvq, _S("106|189|218|207|207|206|138|172|217|217|221|222"), false, function(val)
    _vsmeofirta7.SpeedBoost = val
    _vs17nuwjjmq()
end)

_vekefw23g16(_vut5lzp3qvq, _S("94|181|191|202|201|126|177|206|195|195|194"), 16, 200, 50, function(val)
    _vsmeofirta7.WalkSpeed = val
    if _vsmeofirta7.SpeedBoost then _vs17nuwjjmq() end
end)

_vs0txs7j9rj(_vut5lzp3qvq, _S("127|205|238|226|235|232|239"), false, function(val)
    _vsmeofirta7.Noclip = val
    if val then _v8jv7bwtu0d() else _va2m38ns07f() end
end)

_vs0txs7j9rj(_vut5lzp3qvq, _S("89|159|197|210"), false, function(val)
    _vsmeofirta7.FlyEnabled = val
    if val then _vzfdz1ihnor() else _vvkueh3hlct() end
end)

_vekefw23g16(_vut5lzp3qvq, _S("73|143|181|194|105|156|185|174|174|173"), 10, 200, 60, function(val)
    _vsmeofirta7.FlySpeed = val
end)

_vs0txs7j9rj(_vut5lzp3qvq, _S("84|157|194|186|189|194|189|200|185|116|158|201|193|196"), false, function(val)
    _vsmeofirta7.InfiniteJump = val
    if val then _vcb6fw8fx0e() else _v3nz9mahzm0() end
end)

_vs0txs7j9rj(_vut5lzp3qvq, _S("95|162|203|200|194|202|127|179|196|203|196|207|206|209|211|127|135|162|211|209|203|138|162|203|200|194|202|136"), false, function(val)
    _vsmeofirta7.ClickTeleport = val
    if val then _vjvr4fph1rm() else _vcfwq940ll5() end
end)

_v3prdue8pwa(_vut5lzp3qvq, "📦 ITEM DUPE")

local dupeInput, dupeTextBox
dupeInput, dupeTextBox = _v7mks517xou(_vut5lzp3qvq, _S("81|149|198|193|182|113|162|197|202"), "1", function(text)
    local num = tonumber(text)
    if num and num > 0 then
        _vsmeofirta7.DupeAmount = math.floor(num)
    end
end)

_vd1myvockm6(_vut5lzp3qvq, "📦 Dupe Items (" .. _vsmeofirta7.DupeAmount .. "x)", Color3.fromRGB(180, 60, 180), function()
    _v5s0rm6927p(_vsmeofirta7.DupeAmount)
end)

_vd1myvockm6(_vut5lzp3qvq, "📦 Drop Dupe Method", Color3.fromRGB(140, 50, 140), function()
    _v3qkrkdrh4c()
end)

_v3prdue8pwa(_vut5lzp3qvq, "📡 REMOTE EXPLOITS")

_vd1myvockm6(_vut5lzp3qvq, "🔥 Fire All Mine Remotes", Color3.fromRGB(160, 40, 40), function()
    _vi7orqo253n(_S("115|224|220|225|216"))
    _vi7orqo253n(_S("101|201|206|204"))
    _vi7orqo253n(_S("118|222|215|232|236|219|233|234"))
    _vi7orqo253n(_S("112|211|223|220|220|213|211|228"))
    _vi7orqo253n(_S("102|200|216|203|199|209"))
    _vrt94ifoowp(_S("99|169|204|213|200|199|131|208|204|209|200|131|213|200|208|210|215|200|214"))
end)

_vd1myvockm6(_vut5lzp3qvq, "💰 Fire All Sell Remotes", Color3.fromRGB(40, 140, 40), function()
    _vi7orqo253n(_S("121|236|222|229|229"))
    _vi7orqo253n(_S("87|202|188|195|195|184|195|195"))
    _vi7orqo253n(_S("127|226|224|242|231"))
    _vi7orqo253n(_S("64|173|175|174|165|185"))
    _vi7orqo253n(_S("83|199|197|180|183|184"))
    _vrt94ifoowp(_S("88|158|193|202|189|188|120|203|189|196|196|120|202|189|197|199|204|189|203"))
end)

_vd1myvockm6(_vut5lzp3qvq, "⬆ Fire All Upgrade Remotes", Color3.fromRGB(40, 100, 160), function()
    _vi7orqo253n(_S("62|179|174|165|176|159|162|163"))
    _vi7orqo253n(_S("72|170|189|193"))
    _vi7orqo253n(_S("66|178|183|180|165|170|163|181|167"))
    _vi7orqo253n(_S("120|239|217|234|229|236|224"))
    _vi7orqo253n(_S("105|217|210|204|212|202|225|206"))
    _vi7orqo253n(_S("106|204|203|205|213|218|203|205|213"))
    _vrt94ifoowp(_S("94|164|199|208|195|194|126|211|206|197|208|191|194|195|126|208|195|203|205|210|195|209"))
end)

_vd1myvockm6(_vut5lzp3qvq, "🎲 Fire All Luck Remotes", Color3.fromRGB(140, 140, 40), function()
    _vi7orqo253n(_S("95|203|212|194|202"))
    _vi7orqo253n(_S("74|182|191|173|181|195"))
    _vi7orqo253n(_S("110|212|221|224|226|227|220|211"))
    _vi7orqo253n(_S("90|188|198|191|205|205|195|200|193"))
    _vrt94ifoowp(_S("119|189|224|233|220|219|151|227|236|218|226|151|233|220|228|230|235|220|234"))
end)

_vd1myvockm6(_vut5lzp3qvq, "💣 Fire ALL Remotes (Nuke)", Color3.fromRGB(200, 50, 50), function()
    for _, remote in ipairs(State.RemoteCache) do
        pcall(function()
            if remote.Type == _S("121|203|222|230|232|237|222|190|239|222|231|237") then
                remote.Instance:FireServer()
            elseif remote.Type == _S("110|192|211|219|221|226|211|180|227|220|209|226|215|221|220") then
                remote.Instance:InvokeServer()
            end
        end)
    end
    _vrt94ifoowp(_S("129|207|214|204|198|197|161|226|237|237|161") .. #State.RemoteCache .. _S("67|99|181|168|176|178|183|168|182|100"))
end)

local _vek5e4ym5kq = _vkwowivmglz[_S("60|144|171|171|168|175")]
_vqkat7qqxka()

_v3prdue8pwa(_vek5e4ym5kq, "📡 REMOTE SPY")

_vs0txs7j9rj(_vek5e4ym5kq, _S("94|176|195|203|205|210|195|126|177|206|215|126|134|170|205|197|126|164|199|208|195|177|195|208|212|195|208|135"), false, function(val)
    _vsmeofirta7.RemoteSpy = val
    if val then _vbfjrxe0g7g() else _v7468phy3p7() end
end)

_vhzdtx290kg = _vhzdtx290kg + 1
local _vzhl6482kyc = Instance.new(_S("77|160|176|191|188|185|185|182|187|180|147|191|174|186|178"))
RemoteSpyList = _vzhl6482kyc
RemoteSpyList.Name = _S("92|174|193|201|203|208|193|175|204|213|168|197|207|208")
RemoteSpyList.Size = UDim2.new(1, 0, 0, 100)
RemoteSpyList.BackgroundColor3 = Theme.Panel
RemoteSpyList.BackgroundTransparency = 0.15
RemoteSpyList.BorderSizePixel = 0
RemoteSpyList.ScrollBarThickness = 3
RemoteSpyList.ScrollBarImageColor3 = Theme.Accent
RemoteSpyList.CanvasSize = UDim2.new(0, 0, 0, 0)
RemoteSpyList.AutomaticCanvasSize = Enum.AutomaticSize.Y
RemoteSpyList.LayoutOrder = _vhzdtx290kg
RemoteSpyList.Parent = _vek5e4ym5kq

local _v8txx7er4vr = Instance.new(_S("109|194|182|176|220|223|219|210|223"))
_v8txx7er4vr.CornerRadius = UDim.new(0, 6)
_v8txx7er4vr.Parent = RemoteSpyList

local _vkbk4j9enyd = Instance.new(_S("106|191|179|182|211|221|222|182|203|227|217|223|222"))
_vkbk4j9enyd.SortOrder = Enum.SortOrder.LayoutOrder
_vkbk4j9enyd.Padding = UDim.new(0, 2)
_vkbk4j9enyd.Parent = RemoteSpyList

local _v03xxcmignw = Instance.new(_S("106|191|179|186|203|206|206|211|216|209"))
_v03xxcmignw.PaddingTop = UDim.new(0, 2)
_v03xxcmignw.PaddingLeft = UDim.new(0, 2)
_v03xxcmignw.PaddingRight = UDim.new(0, 2)
_v03xxcmignw.Parent = RemoteSpyList

_vd1myvockm6(_vek5e4ym5kq, "🗑 Clear Spy Log", Color3.fromRGB(100, 50, 50), function()
    State.RemoteSpyLogs = {}
    if RemoteSpyList then _vchfhds1sze(RemoteSpyList) end
end)

_v3prdue8pwa(_vek5e4ym5kq, "🎯 CUSTOM REMOTE")

_v7mks517xou(_vek5e4ym5kq, _S("89|171|190|198|200|205|190|121|167|186|198|190"), "", function(text)
    _vsmeofirta7.CustomRemoteName = text
end)

_v7mks517xou(_vek5e4ym5kq, _S("63|128|177|166|178|95|103|162|174|172|172|160|95|178|164|175|160|177|160|179|164|163|104"), "", function(text)
    _vsmeofirta7.CustomRemoteArgs = text
end)

_vd1myvockm6(_vek5e4ym5kq, "🚀 Fire Custom Remote", Color3.fromRGB(160, 80, 40), function()
    _vuld99gpqxs()
end)

_v3prdue8pwa(_vek5e4ym5kq, "📍 WAYPOINTS")

_vd1myvockm6(_vek5e4ym5kq, "💾 Save: Shop", Color3.fromRGB(50, 100, 160), function()
    _vf6s9hmgapl(_S("123|206|227|234|235"))
end)

_vd1myvockm6(_vek5e4ym5kq, "💾 Save: Farm Spot", Color3.fromRGB(50, 130, 80), function()
    _vf6s9hmgapl(_S("65|135|162|179|174"))
end)

_vd1myvockm6(_vek5e4ym5kq, "💾 Save: Spawn", Color3.fromRGB(80, 80, 140), function()
    _vf6s9hmgapl(_S("122|205|234|219|241|232"))
end)

_vd1myvockm6(_vek5e4ym5kq, "📍 TP → Shop", Color3.fromRGB(40, 90, 140), function()
    _vi22fjv3oob(_S("96|179|200|207|208"))
end)

_vd1myvockm6(_vek5e4ym5kq, "📍 TP → Farm Spot", Color3.fromRGB(40, 120, 70), function()
    _vi22fjv3oob(_S("118|188|215|232|227"))
end)

_vd1myvockm6(_vek5e4ym5kq, "📍 TP → Spawn", Color3.fromRGB(70, 70, 130), function()
    _vi22fjv3oob(_S("120|203|232|217|239|230"))
end)

local _vr67lryzj3m = _vkwowivmglz[_S("84|161|189|199|183")]
_vqkat7qqxka()

_v3prdue8pwa(_vr67lryzj3m, "⚙ SETTINGS")

_vs0txs7j9rj(_vr67lryzj3m, _S("120|185|230|236|225|165|185|190|195"), false, function(val)
    _vsmeofirta7.AntiAFK = val
    if val then _v2jup52swfv() else _vbapdyf8y2k() end
end)

_vs0txs7j9rj(_vr67lryzj3m, _S("104|169|221|220|215|136|186|205|219|216|201|223|214|136|147|136|186|205|201|216|216|212|225"), false, function(val)
    _vsmeofirta7.AutoRespawn = val
end)

_vs0txs7j9rj(_vr67lryzj3m, _S("114|184|194|197|146|180|225|225|229|230|215|228"), false, function(val)
    _vsmeofirta7.FPSBooster = val
    if val then _vhmv8s14n1v() end
end)

_vekefw23g16(_vr67lryzj3m, _S("124|207|225|238|242|225|238|156|196|235|236|156|164|233|229|234|168|156|172|185|235|226|226|165"), 0, 120, 0, function(val)
    _vsmeofirta7.ServerHopInterval = val
    _vhtme3xb56r()
    if val > 0 then _vt55p2iyfqs() end
end)

_vd1myvockm6(_vr67lryzj3m, "🌐 Server Hop Now", Color3.fromRGB(60, 100, 160), function()
    _vc6oxpm3sq1()
end)

_vd1myvockm6(_vr67lryzj3m, "💾 Save _vsmeofirta7", Color3.fromRGB(50, 120, 80), function()
    _vfll2qx69f9()
end)

_vd1myvockm6(_vr67lryzj3m, "📂 Load _vsmeofirta7", Color3.fromRGB(80, 100, 160), function()
    _vggiasjdvr5()
end)

_vd1myvockm6(_vr67lryzj3m, "🚨 PANIC (Stop All)", Color3.fromRGB(200, 40, 40), function()
    _v9czr8apcxc()
end)

_v3prdue8pwa(_vr67lryzj3m, "⌨ KEYBINDS")
_vhzdtx290kg = _vhzdtx290kg + 1
local _vufs48c76wy = Instance.new(_S("121|205|222|241|237|197|218|219|222|229"))
_vufs48c76wy.Size = UDim2.new(1, 0, 0, _v7uw3gvjzg2 and 56 or 70)
_vufs48c76wy.BackgroundColor3 = Theme.Panel
_vufs48c76wy.BackgroundTransparency = 0.1
_vufs48c76wy.BorderSizePixel = 0
_vufs48c76wy.Text = _v7uw3gvjzg2 and _S("128|212|225|240|160|231|242|229|229|238|160|205|160|226|245|244|244|239|238|160|189|160|212|239|231|231|236|229|160|199|213|201|160|252|160|213|243|229|160|244|239|231|231|236|229|243|160|233|238|160|244|225|226|243") or _S("125|207|230|228|229|241|208|229|230|227|241|157|186|157|209|236|228|228|233|226|157|196|210|198|157|249|157|195|157|186|157|195|233|246|157|249|157|196|157|186|157|190|242|241|236|157|195|222|239|234|157|249|157|197|157|186|157|208|234|222|239|241|157|201|236|236|237|157|249|157|205|157|186|157|205|222|235|230|224|157|249|157|192|241|239|233|168|192|233|230|224|232|157|186|157|192|233|230|224|232|157|209|205")
_vufs48c76wy.TextColor3 = Theme.SubText
_vufs48c76wy.Font = Enum.Font.Gotham
_vufs48c76wy.TextSize = _v7uw3gvjzg2 and 9 or 10
_vufs48c76wy.TextXAlignment = Enum.TextXAlignment.Left
_vufs48c76wy.TextYAlignment = Enum.TextYAlignment.Top
_vufs48c76wy.TextWrapped = true
_vufs48c76wy.LayoutOrder = _vhzdtx290kg
_vufs48c76wy.Parent = _vr67lryzj3m
local _vosjtl83dz7 = Instance.new(_S("91|176|164|158|202|205|201|192|205"))
_vosjtl83dz7.CornerRadius = UDim.new(0, 6)
_vosjtl83dz7.Parent = _vufs48c76wy

_v3prdue8pwa(_vr67lryzj3m, "📋 LOG")

local _vm9f57o6y55 = Instance.new(_S("105|188|204|219|216|213|213|210|215|208|175|219|202|214|206"))
LogList = _vm9f57o6y55
LogList.Name = _S("73|149|184|176|149|178|188|189")
LogList.Size = UDim2.new(1, 0, 0, 100)
LogList.BackgroundColor3 = Theme.Panel
LogList.BackgroundTransparency = 0.15
LogList.BorderSizePixel = 0
LogList.ScrollBarThickness = 3
LogList.ScrollBarImageColor3 = Theme.Accent
LogList.CanvasSize = UDim2.new(0, 0, 0, 0)
LogList.AutomaticCanvasSize = Enum.AutomaticSize.Y
_vhzdtx290kg = _vhzdtx290kg + 1
LogList.LayoutOrder = _vhzdtx290kg
LogList.Parent = _vr67lryzj3m

local _vwc7vbxgqye = Instance.new(_S("84|169|157|151|195|198|194|185|198"))
_vwc7vbxgqye.CornerRadius = UDim.new(0, 6)
_vwc7vbxgqye.Parent = LogList

local _vw8aza8qy6o = Instance.new(_S("127|212|200|203|232|242|243|203|224|248|238|244|243"))
_vw8aza8qy6o.SortOrder = Enum.SortOrder.LayoutOrder
_vw8aza8qy6o.Parent = LogList

local _vmfoost23tg = Instance.new(_S("81|166|154|161|178|181|181|186|191|184"))
_vmfoost23tg.PaddingTop = UDim.new(0, 3)
_vmfoost23tg.PaddingLeft = UDim.new(0, 3)
_vmfoost23tg.PaddingRight = UDim.new(0, 3)
_vmfoost23tg.Parent = LogList

_v3prdue8pwa(_vr67lryzj3m, "🔗 DISCORD WEBHOOK")

_vs0txs7j9rj(_vr67lryzj3m, _S("81|150|191|178|179|189|182|113|168|182|179|185|192|192|188"), false, function(val)
    _vsmeofirta7.WebhookEnabled = val
end)

_v7mks517xou(_vr67lryzj3m, _S("75|162|176|173|179|186|186|182|107|160|157|151"), "", function(text)
    _vsmeofirta7.WebhookURL = text
end)

_vs0txs7j9rj(_vr67lryzj3m, _S("107|177|204|221|216|139|183|218|210|222"), true, function(val)
    _vsmeofirta7.WebhookFarm = val
end)

_vs0txs7j9rj(_vr67lryzj3m, _S("95|178|196|203|203|127|171|206|198|210"), true, function(val)
    _vsmeofirta7.WebhookSell = val
end)

_vs0txs7j9rj(_vr67lryzj3m, _S("66|149|182|163|182|181|98|142|177|169|181"), true, function(val)
    _vsmeofirta7.WebhookStats = val
end)

_vd1myvockm6(_vr67lryzj3m, "📨 Send Stats Now", Color3.fromRGB(50, 90, 160), function()
    _vdsax9qkbjj()
    _vrt94ifoowp(_S("74|157|175|184|190|106|189|190|171|190|189|106|190|185|106|193|175|172|178|185|185|181"))
end)

_vd1myvockm6(_vr67lryzj3m, "🧪 Test Webhook", Color3.fromRGB(90, 60, 140), function()
    _vfni97fz0oz({content = "**[Minea Mountain v7]** Webhook test successful! ✅"})
    _vrt94ifoowp(_S("97|181|198|212|213|198|197|129|216|198|195|201|208|208|204"))
end)

_v3prdue8pwa(_vr67lryzj3m, "🔧 UTILITIES")

_vd1myvockm6(_vr67lryzj3m, "🏠 Teleport to Spawn", Color3.fromRGB(60, 90, 140), function()
    local _v67uh97ulow = _vtz2kf5z6jx:FindFirstChild(_S("128|211|240|225|247|238|204|239|227|225|244|233|239|238")) or _vtz2kf5z6jx:FindFirstChild(_S("78|161|190|175|197|188|193")) or _vtz2kf5z6jx:FindFirstChild(_S("99|175|210|197|197|220"))
    if _v67uh97ulow then
        if _v67uh97ulow:IsA(_S("128|194|225|243|229|208|225|242|244")) then
            _v227syc5l79(_v67uh97ulow.Position)
        else
            local spawn = _v67uh97ulow:FindFirstChildWhichIsA(_S("71|137|168|186|172|151|168|185|187"))
            if spawn then _v227syc5l79(spawn.Position) end
        end
    else
        _vrt94ifoowp(_S("83|161|194|115|198|195|180|202|193|115|185|194|200|193|183|116"))
    end
end)

_vd1myvockm6(_vr67lryzj3m, "🏔 Teleport to Mountain Top", Color3.fromRGB(100, 60, 140), function()
    if _vbbnplrdpcz() then
        local _vroaxy0tedh = _vel45wbkgbl.Position.Y
        local _v2k96uacsni = nil
        for _, part in ipairs(_vtz2kf5z6jx:GetDescendants()) do
            if part:IsA(_S("85|151|182|200|186|165|182|199|201")) and part.Position.Y > _vroaxy0tedh then
                _vroaxy0tedh = part.Position.Y
                _v2k96uacsni = part
            end
        end
        if _v2k96uacsni then
            _v227syc5l79(_v2k96uacsni.Position + Vector3.new(0, 10, 0))
            _vrt94ifoowp(_S("107|191|208|215|208|219|218|221|223|208|207|139|223|218|139|211|212|210|211|208|222|223|139|219|218|212|217|223|165|139") .. math.floor(_vroaxy0tedh))
        end
    end
end)

_vd1myvockm6(_vr67lryzj3m, "🔄 Rejoin Server", Color3.fromRGB(100, 100, 50), function()
    pcall(function()
        _vx06boh6bcr:Kick(_S("92|174|193|198|203|197|202|197|202|195|138|138|138"))
        task.wait(1)
        game:GetService(_S("67|151|168|175|168|179|178|181|183|150|168|181|185|172|166|168")):TeleportToPlaceInstance(game.PlaceId, game.JobId, _vx06boh6bcr)
    end)
end)

_v3prdue8pwa(_vr67lryzj3m, "ℹ INFO")

_vhzdtx290kg = _vhzdtx290kg + 1
local _vd1kp3hlzwn = Instance.new(_S("125|209|226|245|241|201|222|223|226|233"))
_vd1kp3hlzwn.Size = UDim2.new(1, 0, 0, 50)
_vd1kp3hlzwn.BackgroundColor3 = Theme.Panel
_vd1kp3hlzwn.BackgroundTransparency = 0.1
_vd1kp3hlzwn.Text = _S("112|189|217|222|213|209|144|184|229|210|144|230|167|144|236|144") .. Exec.Name .. "\nSmart Loop · Remote Spy · ESP+ · Waypoints"
_vd1kp3hlzwn.TextColor3 = Theme.SubText
_vd1kp3hlzwn.Font = Enum.Font.Gotham
_vd1kp3hlzwn.TextSize = _v7uw3gvjzg2 and 9 or 10
_vd1kp3hlzwn.TextWrapped = true
_vd1kp3hlzwn.LayoutOrder = _vhzdtx290kg
_vd1kp3hlzwn.Parent = _vr67lryzj3m

local _v6q17r98bu8 = Instance.new(_S("98|183|171|165|209|212|208|199|212"))
_v6q17r98bu8.CornerRadius = UDim.new(0, 6)
_v6q17r98bu8.Parent = _vd1kp3hlzwn

_v0lfskntjo1.MouseButton1Click:Connect(function()
    State.IsMinimized = true
    local _vdm3l6oiilf = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local tween = _vb5dopfzp45:Create(_vufytsxr3ie, _vdm3l6oiilf, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = _vtmgnw71i6j,
    })
    tween:Play()
    tween.Completed:Connect(function()
        _vufytsxr3ie.Visible = false
        _vzpm7xbnduk.Visible = true
        _vzpm7xbnduk.Size = UDim2.new(0, 0, 0, 0)
        local _vdn2eww5wbx = _vb5dopfzp45:Create(_vzpm7xbnduk, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = _v6xtgcdw7hf,
        })
        _vdn2eww5wbx:Play()
    end)
end)

_v4iq3n8pegb.MouseButton1Click:Connect(function()
    State.IsMinimized = false
    local _vdm3l6oiilf = TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local tween = _vb5dopfzp45:Create(_vzpm7xbnduk, _vdm3l6oiilf, {
        Size = UDim2.new(0, 0, 0, 0),
    })
    tween:Play()
    tween.Completed:Connect(function()
        _vzpm7xbnduk.Visible = false
        _vufytsxr3ie.Visible = true
        _vufytsxr3ie.Size = UDim2.new(0, 0, 0, 0)
        local _vdn2eww5wbx = _vb5dopfzp45:Create(_vufytsxr3ie, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = _vg6x4ahbfg9,
        })
        _vdn2eww5wbx:Play()
    end)
end)

local _vnln83vyd0q = false
local dragInput
local dragStart
local startPos

local function _vqs85vcl3r5(input)
    local delta = input.Position - dragStart
    local _vhols2g7hng = State.IsMinimized and _vzpm7xbnduk or _vufytsxr3ie
    _vhols2g7hng.Position = UDim2.new(
        startPos.X.Scale, startPos.X.Offset + delta.X,
        startPos.Y.Scale, startPos.Y.Offset + delta.Y
    )
end

local function _v6wv6pi4ku4(frame)
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            _vnln83vyd0q = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    _vnln83vyd0q = false
                end
            end)
        end
    end)
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    _vig1weh01jf.InputChanged:Connect(function(input)
        if input == dragInput and _vnln83vyd0q then
            _vqs85vcl3r5(input)
        end
    end)
end

_v6wv6pi4ku4(_vqq4xpcub2u)
_v6wv6pi4ku4(_vzpm7xbnduk)

local _v8rn5vd4skd = 0
task.spawn(function()
    while true do
        task.wait(1)
        pcall(_vv38khu11us)
        if _vsmeofirta7.WebhookEnabled and _vsmeofirta7.WebhookStats then
            local now = tick()
            if now - _v8rn5vd4skd >= 30 then
                _v8rn5vd4skd = now
                pcall(_vdsax9qkbjj)
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(10)
        pcall(function()
            local shops = _v2e183n3k8o()
            if ShopList then
                _vchfhds1sze(ShopList)
                for i, shop in ipairs(shops) do
                    if i > 15 then break end
                    local btn = Instance.new(_S("60|144|161|180|176|126|177|176|176|171|170"))
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Theme.Input
                    btn.BorderSizePixel = 0
                    btn.Text = shop.Name .. " [" .. math.floor(shop.Distance) .. "m]"
                    btn.TextColor3 = Theme.Text
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = 11
                    btn.LayoutOrder = i
                    btn.Parent = ShopList
                    local _v8sjyfbknmf = Instance.new(_S("125|210|198|192|236|239|235|226|239"))
                    _v8sjyfbknmf.CornerRadius = UDim.new(0, 5)
                    _v8sjyfbknmf.Parent = btn
                    btn.MouseButton1Click:Connect(function()
                        _v227syc5l79(shop.Part.Position)
                        _vrt94ifoowp(_S("99|183|200|207|200|211|210|213|215|200|199|131|215|210|157|131") .. shop.Name)
                    end)
                end
            end
        end)

        pcall(function()
            local rocks = _vvobjxev3un()
            if RockList then
                _vchfhds1sze(RockList)
                for i, rock in ipairs(rocks) do
                    if i > 20 then break end
                    local btn = Instance.new(_S("128|212|229|248|244|194|245|244|244|239|238"))
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Theme.Input
                    btn.BorderSizePixel = 0
                    btn.Text = rock.Name .. " [" .. math.floor(rock.Distance) .. "m]" .. (rock.Value > 0 and (" $" .. rock.Value) or "")
                    btn.TextColor3 = rock.Value > 0 and Theme.Accent or Theme.SubText
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = 11
                    btn.LayoutOrder = i
                    btn.Parent = RockList
                    local _v8sjyfbknmf = Instance.new(_S("90|175|163|157|201|204|200|191|204"))
                    _v8sjyfbknmf.CornerRadius = UDim.new(0, 5)
                    _v8sjyfbknmf.Parent = btn
                    btn.MouseButton1Click:Connect(function()
                        _v227syc5l79(rock.Part.Position)
                        _vrt94ifoowp(_S("85|169|186|193|186|197|196|199|201|186|185|117|201|196|143|117") .. rock.Name)
                    end)
                end
            end
        end)
    end
end)

_vig1weh01jf.InputBegan:Connect(function(input, processed)
    if processed or _v7uw3gvjzg2 then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        _vh6p0m8zw5e()
    elseif input.KeyCode == Enum.KeyCode.F then
        _vsmeofirta7.FlyEnabled = not _vsmeofirta7.FlyEnabled
        if _vsmeofirta7.FlyEnabled then _vzfdz1ihnor() else _vvkueh3hlct() end
        _vrt94ifoowp(_S("87|157|195|208|145|119") .. (_vsmeofirta7.FlyEnabled and "ON" or _S("68|147|138|138")))
    elseif input.KeyCode == Enum.KeyCode.G then
        _vsmeofirta7.AutoFarm = not _vsmeofirta7.AutoFarm
        if _vsmeofirta7.AutoFarm then _vqm4vfjxvqc() else _vdvnank3aq7() end
        _vrt94ifoowp(_S("105|170|222|221|216|137|175|202|219|214|163|137") .. (_vsmeofirta7.AutoFarm and "ON" or _S("103|182|173|173")))
    elseif input.KeyCode == Enum.KeyCode.H then
        _vsmeofirta7.SmartLoop = not _vsmeofirta7.SmartLoop
        if _vsmeofirta7.SmartLoop then _vrtajc2aov6() else _v9ec9iuny86() end
        _vrt94ifoowp(_S("69|152|178|166|183|185|101|145|180|180|181|127|101") .. (_vsmeofirta7.SmartLoop and "ON" or _S("102|181|172|172")))
    elseif input.KeyCode == Enum.KeyCode.P and _vsmeofirta7.PanicEnabled then
        _v9czr8apcxc()
        _vd8kjz21xvn.Enabled = false
        State.GUIHidden = true
    end
end)

task.spawn(function()
    while true do
        task.wait(3)
        pcall(function()
            if _vsmeofirta7.Tracers then _vfha7o5gfzx() end
            if _vsmeofirta7.PlayerESP then _v81jnmqhxgv() end
            if _vsmeofirta7.ChestESP then _v4rmwv1uanv() end
            if _vsmeofirta7.HideOtherPlayers then _vy864y695yu() end
            if _vsmeofirta7.BypassPromptHold then _v8fyegonyjz(_vtz2kf5z6jx) end
        end)
    end
end)

_vx06boh6bcr.CharacterAdded:Connect(function(char)
    Character = char
    _vel45wbkgbl = char:WaitForChild(_S("77|149|194|186|174|187|188|182|177|159|188|188|193|157|174|191|193"))
    _v59l4xsoenu = char:WaitForChild(_S("84|156|201|193|181|194|195|189|184"))
    _vrt94ifoowp(_S("117|184|221|214|231|214|216|233|218|231|149|231|218|232|229|214|236|227|218|217"))

    task.delay(1, function()
        if _vsmeofirta7.SpeedBoost then _vs17nuwjjmq() end
        if _vsmeofirta7.FlyEnabled then _vvkueh3hlct() _vzfdz1ihnor() end
        if _vsmeofirta7.InfiniteJump then _v3nz9mahzm0() _vcb6fw8fx0e() end
        if _vsmeofirta7.AutoEquipPickaxe then _vctvsiqh9rz() end
        if _vsmeofirta7.AutoFarm and not State.FarmConnection then _vqm4vfjxvqc() end
        if _vsmeofirta7.SmartLoop and not State.SmartLoopConn then _vrtajc2aov6() end
        if _vsmeofirta7.WarmthKeeper or _vsmeofirta7.StaminaKeeper then _v2tsel5z1yd() end
    end)
end)

_vx06boh6bcr.CharacterRemoving:Connect(function()
    if _vsmeofirta7.AutoRespawn then
        task.delay(3, function()
            pcall(function()
                if not _vx06boh6bcr.Character then
                    Exec.LoadCharacter()
                end
            end)
        end)
    end
end)

if _vxy6a082pc0 then
    _vxy6a082pc0:GetPropertyChangedSignal(_S("103|189|208|204|222|215|214|217|219|186|208|225|204")):Connect(function()
        local _vaw65raex47 = _vxy6a082pc0.ViewportSize
        local isMob = _vig1weh01jf.TouchEnabled or _vaw65raex47.X < 900
        _vg6x4ahbfg9 = isMob and UDim2.new(1, -20, 1, -36) or UDim2.new(0, 700, 0, 440)
        if not State.IsMinimized then
            _vufytsxr3ie.Size = _vg6x4ahbfg9
            _vufytsxr3ie.AnchorPoint = isMob and Vector2.new(0.5, 0.5) or Vector2.new(0, 0)
            _vufytsxr3ie.Position = isMob and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0.5, -350, 0.5, -220)
        end
        _voxw7dv3ekt.TextSize = isMob and 14 or 17
    end)
end

Exec.SetSimRadius()

pcall(function()
    _vrt94ifoowp(_S("68|145|173|178|169|165|100|140|185|166|100|186|123|100|176|179|165|168|169|168|100|179|178|100") .. Exec.Name)
    _vrt94ifoowp(_S("115|184|235|216|214|232|231|226|229|147|180|195|188|230|173|147|187|199|199|195|176") .. tostring(Exec.Request ~= nil) .. _S("78|110|150|189|189|185|139") .. tostring(Exec.HasHookMeta) .. _S("91|123|158|199|196|190|198|152") .. tostring(Exec.HasFireClick))
    _vrt94ifoowp(_v7uw3gvjzg2 and _S("124|208|221|236|156|227|238|225|225|234|156|201|156|222|241|240|240|235|234|156|240|235|156|240|235|227|227|232|225|156|195|209|197") or _S("82|164|187|185|186|198|165|186|187|184|198|114|143|114|153|167|155|114|206|114|149|179|181|186|183|114|196|183|191|193|198|183|197|114|184|187|196|197|198|115"))
    _v8fyegonyjz(_vtz2kf5z6jx)
    _v56wtv8ret8:SetCore(_S("91|174|192|201|191|169|202|207|196|193|196|190|188|207|196|202|201"), {
        Title = _S("92|169|197|202|193|189|124|164|209|190|124|210|147"),
        Text = _v7uw3gvjzg2 and _S("102|178|213|199|202|203|202|135|134|186|199|214|134|218|206|203|134|205|216|203|203|212|134|179|134|200|219|218|218|213|212|134|213|212|134|218|206|203|134|216|207|205|206|218|148") or _S("63|139|174|160|163|164|163|96|95|143|177|164|178|178|95|145|168|166|167|179|146|167|168|165|179|95|179|174|95|179|174|166|166|171|164|95|134|148|136|109"),
        Duration = 6,
    })
end)

task.delay(3, function()
    pcall(_vb3f0c4qsg1)
end)
