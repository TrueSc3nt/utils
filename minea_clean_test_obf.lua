--[[ Minea v7 protected | TrueSc3nt ]]
local _S=function(s)local o=tonumber(s:match("^(%d+)%|"))local r=""for c in s:gmatch("(%d+)")do local n=tonumber(c)-o;if n>0 then r=r..string.char(n)end end;return r end
if false then local _jdun6ctjx=0 end
local _vhttz78qdg8 = game:GetService(_S("107|187|215|204|228|208|221|222"))
local _v02othobmq8 = game:GetService(_S("107|189|208|219|215|212|206|204|223|208|207|190|223|218|221|204|210|208"))
local _v92gucjek3x = game:GetService(_S("121|208|232|235|228|236|233|218|220|222"))
local _v9vp3q2syfb = game:GetService(_S("127|209|244|237|210|228|241|245|232|226|228"))
local _vjsydjh79x2 = game:GetService(_S("109|193|228|210|210|219|192|210|223|227|214|208|210"))
local _vnqiki4fvlv = game:GetService(_S("114|199|229|215|228|187|224|226|231|230|197|215|228|232|219|213|215"))
local HttpService = game:GetService(_S("66|138|182|182|178|149|167|180|184|171|165|167"))
local _vua7rkk1iu0 = game:GetService(_S("68|151|184|165|182|184|169|182|139|185|173"))
local _v5l01vpqxkc = game:GetService(_S("84|160|189|187|188|200|189|194|187"))
local _v1vpimabutu = game:GetService(_S("84|168|185|192|185|196|195|198|200|167|185|198|202|189|183|185"))
local _vp9nq3ucmqn = game:GetService(_S("87|154|198|195|195|188|186|203|192|198|197|170|188|201|205|192|186|188"))

local _v9qqaid831c = _vhttz78qdg8.LocalPlayer
if not _v9qqaid831c then
    _v9qqaid831c = _vhttz78qdg8.PlayerAdded:Wait()
end
local Character = _v9qqaid831c.Character or _v9qqaid831c.CharacterAdded:Wait()
local _vqxyh6gcfta = Character:WaitForChild(_S("123|195|240|232|220|233|234|228|223|205|234|234|239|203|220|237|239"))
local _vkhkeyt0oao = Character:WaitForChild(_S("92|164|209|201|189|202|203|197|192"))

local _v7waz68vjhn = {
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
    WebhookURL = _S("115|"),
    WebhookEnabled = false,
    WebhookFarm = true,
    WebhookSell = true,
    WebhookStats = true,

    SmartLoop = false,
    OreFilterEnabled = false,
    OreFilter = _S("109|209|214|206|218|220|219|209|153|223|226|207|230|153|212|220|217|209|153|210|218|210|223|206|217|209|153|224|206|221|221|213|214|223|210|153|224|225|206|223|224|206|221|221|213|214|223|210|153|221|217|206|225|214|219|226|218"),
    OreBlacklist = _S("111|210|222|208|219|155|226|227|222|221|212|155|225|222|210|218"),
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
    PromoCode = _S("106|"),

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
    CustomRemoteName = _S("85|"),
    CustomRemoteArgs = _S("68|"),

    ServerHopInterval = 0,
    PanicEnabled = true,
}

local LogList, ShopList, RockList, RemoteSpyList, CashLabel, _vnsr1o0tdho

local State = {
    FarmConnection = nil,
    SellConnection = nil,
    ESPConnections = {},
    AntiDamageConn = nil,
    NoclipConn = nil,
    FlyConn = nil,
    UpgradeConn = nil,
    IsMinimized = false,
    CurrentTarget = _S("62|140|173|172|163"),
    FarmCount = 0,
    SellCount = 0,
    DupeCount = 0,
    UpgradeCount = 0,
    TotalEarnings = 0,
    Logs = {},
    ESPHighlights = {},
    RemoteCache = {},
    TabOpen = _S("94|164|191|208|203"),
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
        for i = 1, select(_S("81|116"), ...) do
            local v = select(i, ...)
            if v ~= nil then return v end
        end
    end

    Exec.Unpack = table.unpack or unpack
    Exec.Name = _S("101|186|211|208|211|212|220|211")
    pcall(function()
        if identifyexecutor then
            Exec.Name = identifyexecutor()
        elseif EXECUTOR_NAME then
            Exec.Name = EXECUTOR_NAME
        elseif syn then
            Exec.Name = _S("94|177|215|204|191|206|209|195")
        elseif KRNL_LOADED then
            Exec.Name = _S("76|151|158|154|152")
        elseif Fluxus then
            Exec.Name = _S("123|193|231|240|243|240|238")
        elseif delta then
            Exec.Name = _S("78|146|179|186|194|175")
        end
    end)

    Exec.SafeCClosure = newcclosure or newlclosure or function(f) return f end
    Exec.GetNamecallMethod = getnamecallmethod or getcallmethod or function() return _S("124|") end
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
            local cg = game:GetService(_S("82|149|193|196|183|153|199|187"))
            if cloneref then cg = cloneref(cg) end
            parent = cg
        end)
        if parent then return parent end
        return _v9qqaid831c:WaitForChild(_S("89|169|197|186|210|190|203|160|206|194"))
    end

    Exec.HttpGet = function(url)
        local ok, result = pcall(function() return game:HttpGet(url) end)
        if ok and result then return result end
        if Exec.Request then
            local res = Exec.Request({Url = url, Method = _S("102|173|171|186")})
            if type(res) == _S("65|181|162|163|173|166") then
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
                Method = _S("95|175|174|178|179"),
                Headers = {[_S("71|138|182|181|187|172|181|187|116|155|192|183|172")] = contentType},
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
            elseif _v9qqaid831c.LoadCharacter then _v9qqaid831c:LoadCharacter() end
        end)
    end

    Exec.SetSimRadius = function()
        pcall(function()
            if setsimulationradius then setsimulationradius(1e9, 1e9) end
        end)
        pcall(function()
            if sethiddenproperty then
                sethiddenproperty(_v9qqaid831c, _S("109|192|214|218|226|217|206|225|214|220|219|191|206|209|214|226|224"), 1e9)
                sethiddenproperty(_v9qqaid831c, _S("94|171|191|214|177|199|203|211|202|191|210|199|205|204|176|191|194|199|211|209"), 1e9)
            end
        end)
    end

    local _vqdmwp33ud3 = {}
    local _vkodccn4177 = nil
    local _veb6llnbyfg = false

    function Exec.OnNamecall(fn)
        table.insert(_vqdmwp33ud3, fn)
        if not _veb6llnbyfg and Exec.HasHookMeta then
            _veb6llnbyfg = true
            pcall(function()
                _vkodccn4177 = hookmetamethod(game, _S("84|179|179|194|181|193|185|183|181|192|192"), Exec.SafeCClosure(function(self, ...)
                    local method = Exec.GetNamecallMethod()
                    local args = {...}
                    for _, hook in ipairs(_vqdmwp33ud3) do
                        local block, ret = hook(self, method, args)
                        if block then return ret end
                    end
                    return _vkodccn4177(self, ...)
                end))
            end)
        end
    end

    Exec.NamecallHooks = _vqdmwp33ud3

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

local _vh72znc6c4p = false

pcall(function()
    if Exec.HasHookMeta and Exec.GetNamecallMethod then
        Exec.OnNamecall(function(self, method, args)

            if _vh72znc6c4p and (method == _S("101|171|206|215|202|184|202|215|219|202|215") or method == _S("64|137|174|182|175|171|165|147|165|178|182|165|178")) then
                if self:IsA(_S("94|176|195|203|205|210|195|163|212|195|204|210")) or self:IsA(_S("63|145|164|172|174|179|164|133|180|173|162|179|168|174|173")) then
                    pcall(function() _vjx4rzwyfi1(self.Name, method, args) end)
                end
            end

            if method == _S("109|184|214|208|216") and self == _v9qqaid831c then
                return true, nil
            end

            if method == _S("103|173|208|213|203|186|204|217|221|208|202|204") then
                local svc = args[1]
                if svc == _S("107|176|227|219|215|218|212|223|190|208|221|225|212|206|208") or svc == _S("88|155|192|189|185|204|171|189|202|206|193|187|189") then
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
            local _vq1bfutrp6j = hookmetamethod(game, _S("124|219|219|229|234|224|225|244"), Exec.SafeCClosure(function(self, key)
                if _vkhkeyt0oao and self == _vkhkeyt0oao then
                    if key == _S("75|162|172|183|182|158|187|176|176|175") and _v7waz68vjhn.SpeedBoost then return 16 end
                    if key == _S("94|168|211|203|206|174|205|213|195|208") and _v7waz68vjhn.JumpPower > 50 then return 50 end
                end
                return _vq1bfutrp6j(self, key)
            end))
        end)
        pcall(function()
            local _vkwh39wfrmh = hookmetamethod(game, _S("64|159|159|174|165|183|169|174|164|165|184"), Exec.SafeCClosure(function(self, key, value)
                if _vkhkeyt0oao and self == _vkhkeyt0oao then
                    if key == _S("101|188|198|209|208|184|213|202|202|201") and _v7waz68vjhn.SpeedBoost then
                        return _vkwh39wfrmh(self, key, _v7waz68vjhn.WalkSpeed)
                    end
                end
                return _vkwh39wfrmh(self, key, value)
            end))
        end)
    end
end

local function _vjwpa6b4z60()
    Character = _v9qqaid831c.Character
    if Character then
        _vqxyh6gcfta = Character:FindFirstChild(_S("122|194|239|231|219|232|233|227|222|204|233|233|238|202|219|236|238"))
        _vkhkeyt0oao = Character:FindFirstChild(_S("117|189|234|226|214|227|228|222|217"))
    end
    return Character and _vqxyh6gcfta and _vkhkeyt0oao
end

local function _vbymtkx7r65(part)
    if not _vjwpa6b4z60() then return math.huge end
    return (_vqxyh6gcfta.Position - part.Position).Magnitude
end

local function _vmax6nag1aa(position)
    if not _vjwpa6b4z60() then return false end
    local _vcglntyzqn8 = CFrame.new(position + Vector3.new(0, 3, 0))
    if _v7waz68vjhn.TweenTeleport then
        local dist = (_vqxyh6gcfta.Position - position).Magnitude
        local dur = math.clamp(dist / _v7waz68vjhn.TweenTeleportSpeed, 0.08, 2.5)
        _vjsydjh79x2:Create(_vqxyh6gcfta, TweenInfo.new(dur, Enum.EasingStyle.Linear), {CFrame = _vcglntyzqn8}):Play()
        task.wait(dur)
    else
        _vqxyh6gcfta.CFrame = _vcglntyzqn8
        task.wait(_v7waz68vjhn.TeleportDelay)
    end
    return true
end

local function _vo9oggedhoo(str)
    local list = {}
    for part in string.gmatch(string.lower(str or _S("81|")), _S("69|160|163|113|106|184|162|112")) do
        table.insert(list, part)
    end
    return list
end

local function _v93vjgcq0ie(_v55wabs4dz5)
    if not _v7waz68vjhn.OreFilterEnabled then return true end
    local _vl1lmpkibhy = _vo9oggedhoo(_v7waz68vjhn.OreBlacklist)
    for _, word in ipairs(_vl1lmpkibhy) do
        if string.find(_v55wabs4dz5, word, 1, true) then return false end
    end
    local _v21tumxakw8 = _vo9oggedhoo(_v7waz68vjhn.OreFilter)
    if #_v21tumxakw8 == 0 then return true end
    for _, word in ipairs(_v21tumxakw8) do
        if string.find(_v55wabs4dz5, word, 1, true) then return true end
    end
    return false
end

local function _vyltw0hfh8c(_ves4lobcryw)
    local _v75o3cg5yaq = _v9qqaid831c:FindFirstChild(_S("60|168|161|157|160|161|174|175|176|157|176|175"))
    if not _v75o3cg5yaq then return 0 end
    for _, stat in ipairs(_v75o3cg5yaq:GetChildren()) do
        local n = string.lower(stat.Name)
        for _, p in ipairs(_ves4lobcryw) do
            if string.find(n, p) and stat:IsA(_S("97|183|194|205|214|198|163|194|212|198")) then
                return stat.Value
            end
        end
    end
    return 0
end

local function _vkd8xnh0cyx()
    return _vyltw0hfh8c({_S("124|223|221|239|228"), _S("68|177|179|178|169|189"), _S("106|205|217|211|216"), _S("111|214|222|219|211"), _S("118|216|215|226|215|228|217|219"), _S("67|165|184|166|174|182")})
end

local function _v03c4c37rjx()
    return _vyltw0hfh8c({_S("122|241|223|227|225|226|238"), _S("80|179|177|194|194|201"), _S("84|191|187"), _S("102|210|213|199|202"), _S("88|186|185|187|195|200|185|187|195")})
end

local function _vrbly5rkwrv()
    local cap = _vyltw0hfh8c({_S("83|182|180|195|180|182|188|199|204"), _S("123|232|220|243|222|220|237|237|244"), _S("99|208|196|219"), _S("113|221|218|222|218|229"), _S("116|214|213|215|223|228|213|215|223")})
    if cap > 0 then return cap end
    local obj = _v9qqaid831c:FindFirstChild(_S("82|148|179|181|189|194|179|181|189|149|179|194|179|181|187|198|203")) or _v9qqaid831c:FindFirstChild(_S("82|159|179|202|149|179|196|196|203"))
    if obj and obj:IsA(_S("99|185|196|207|216|200|165|196|214|200")) then return obj.Value end
    return 100
end

local function _va4u7o7xobt()
    if _v7waz68vjhn.UnlimitedBackpack then return false end
    local _vawz9g9w6qk = _v03c4c37rjx()
    local cap = _vrbly5rkwrv()
    if cap > 0 and _vawz9g9w6qk > 0 then return _vawz9g9w6qk >= cap * 0.92 end
    return false
end

local function _v19dcvsp9hu(root)
    if not _v7waz68vjhn.BypassPromptHold or not root then return end
    pcall(function()
        for _, d in ipairs(root:GetDescendants()) do
            if d:IsA(_S("64|144|178|175|184|169|173|169|180|185|144|178|175|173|176|180")) then
                d.HoldDuration = 0
                d.MaxActivationDistance = math.max(d.MaxActivationDistance, 20)
            end
        end
    end)
end

local function _v4l7y64k05o()
    if not _v7waz68vjhn.AutoEquipPickaxe then return end
    pcall(function()
        local bestTool, bestScore = nil, -1
        local function _vqu4gvgxalz(tool)
            if not tool:IsA(_S("87|171|198|198|195")) then return -1 end
            local n = string.lower(tool.Name)
            if not (string.find(n, _S("60|172|165|159|167")) or string.find(n, _S("96|193|216|197")) or string.find(n, _S("67|167|181|172|175|175")) or string.find(n, _S("127|243|238|238|235")) or string.find(n, _S("122|226|219|231|231|223|236"))) then
                return 0
            end
            local s = 0
            if string.find(n, _S("122|222|227|219|231|233|232|222")) then s = s + 100
            elseif string.find(n, _S("108|211|219|216|208")) then s = s + 80
            elseif string.find(n, _S("75|180|189|186|185")) then s = s + 50
            elseif string.find(n, _S("102|217|218|213|212|203")) then s = s + 20 end
            for _, d in ipairs(tool:GetDescendants()) do
                if d:IsA(_S("84|170|181|192|201|185|150|181|199|185")) and (string.find(string.lower(d.Name), _S("127|235|228|245|228|235")) or string.find(string.lower(d.Name), _S("84|200|189|185|198"))) then
                    s = s + d.Value * 10
                end
            end
            return s
        end
        local function scan(container)
            if not container then return end
            for _, t in ipairs(container:GetChildren()) do
                local sc = _vqu4gvgxalz(t)
                if sc > bestScore then bestScore, bestTool = sc, t end
            end
        end
        scan(_v9qqaid831c.Backpack)
        scan(Character)
        if bestTool and Character and not Character:FindFirstChild(bestTool.Name) then
            _vkhkeyt0oao:EquipTool(bestTool)
        end
    end)
end

local function _vfjjw0v3xxq()
    local drops = {}
    local _ves4lobcryw = {_S("106|206|220|217|218"), _S("116|224|227|227|232"), _S("65|170|181|166|174"), _S("69|181|174|168|176|186|181"), _S("91|190|202|199|199|192|190|207"), _S("102|213|216|203"), _S("82|185|183|191"), _S("87|186|201|208|202|203|184|195")}
    local function scan(parent)
        for _, child in ipairs(parent:GetChildren()) do
            local nl = string.lower(child.Name)
            if child:IsA(_S("78|144|175|193|179|158|175|192|194")) or child:IsA(_S("108|185|219|208|209|216")) then
                for _, p in ipairs(_ves4lobcryw) do
                    if string.find(nl, p) then
                        local part = child:IsA(_S("66|132|163|181|167|146|163|180|182")) and child or child:FindFirstChildWhichIsA(_S("118|184|215|233|219|198|215|232|234"))
                        if part then
                            local dist = _vbymtkx7r65(part)
                            if dist <= _v7waz68vjhn.FarmRadius then
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
    scan(_v92gucjek3x)
    table.sort(drops, function(a, b) return a.Distance < b.Distance end)
    return drops
end

local function _vpphc2k00e4()
    if not _v7waz68vjhn.AutoCollectDrops then return end
    local drops = _vfjjw0v3xxq()
    for i = 1, math.min(3, #drops) do
        local drop = drops[i]
        _vmax6nag1aa(drop.Part.Position)
        if HasFireTouch then
            Exec.FireTouch(_vqxyh6gcfta, drop.Part, 0)
            task.wait(0.01)
            Exec.FireTouch(_vqxyh6gcfta, drop.Part, 1)
        end
        _vme4qihhqx7(_S("89|201|194|188|196|206|201"))
        _vme4qihhqx7(_S("69|168|180|177|177|170|168|185"))
        _vme4qihhqx7(_S("68|176|179|179|184"))
    end
end

local function _vw5uvufjbnw()
    if _v7waz68vjhn.AutoBuyPickaxe then
        _vme4qihhqx7(_S("60|172|165|159|167|157|180|161")); _vme4qihhqx7(_S("84|182|201|205|179|196|189|183|191|181|204|185")); _vme4qihhqx7(_S("106|223|218|209|220|203|206|207|201|218|211|205|213|203|226|207"))
    end
    if _v7waz68vjhn.AutoBuyBackpack then
        _vme4qihhqx7(_S("130|228|227|229|237|242|227|229|237")); _vme4qihhqx7(_S("70|169|167|182|167|169|175|186|191")); _vme4qihhqx7(_S("85|202|197|188|199|182|185|186|180|183|182|184|192|197|182|184|192"))
    end
    if _v7waz68vjhn.AutoBuyLuck then
        _vme4qihhqx7(_S("122|230|239|221|229")); _vme4qihhqx7(_S("100|200|205|203|195|208|217|199|207")); _vme4qihhqx7(_S("83|191|200|182|190|204"))
    end
    if _v7waz68vjhn.AutoBuyWarmth then
        _vme4qihhqx7(_S("115|234|212|229|224|231|219")); _vme4qihhqx7(_S("110|214|211|207|226")); _vme4qihhqx7(_S("115|214|212|224|227|217|220|229|216"))
    end
    if _v7waz68vjhn.AutoUpgrade then
        _vme4qihhqx7(_S("107|224|219|210|221|204|207|208")); _vme4qihhqx7(_S("118|216|235|239")); _vme4qihhqx7(_S("73|185|190|187|172|177|170|188|174"))
    end
end

local function _vdsr858u45u()
    if not _v7waz68vjhn.AutoRebirth then return end
    if _vkd8xnh0cyx() >= _v7waz68vjhn.RebirthCashThreshold then
        _vme4qihhqx7(_S("64|178|165|162|169|178|180|168")); _vme4qihhqx7(_S("113|225|227|214|228|229|218|216|214")); _vme4qihhqx7(_S("114|228|215|229|215|230")); _vme4qihhqx7(_S("94|191|209|193|195|204|194"))
        _vv6vvad4d9h(_S("74|139|191|190|185|106|188|175|172|179|188|190|178|106|171|190|190|175|183|186|190|175|174|106|171|190|106") .. _vkd8xnh0cyx() .. _S("88|120|187|185|203|192"))
    end
end

local function _vsz5u8329xb()
    if not _v7waz68vjhn.AutoClaimDaily then return end
    _vme4qihhqx7(_S("77|177|174|182|185|198")); _vme4qihhqx7(_S("80|194|181|199|177|194|180")); _vme4qihhqx7(_S("114|213|222|211|219|223")); _vme4qihhqx7(_S("62|170|173|165|167|172"))
    _vme4qihhqx7(_S("82|181|193|182|183")); _vme4qihhqx7(_S("63|177|164|163|164|164|172"))
    if _v7waz68vjhn.PromoCode ~= _S("110|") then
        _vme4qihhqx7(_S("101|200|212|201|202"), _v7waz68vjhn.PromoCode)
        _vme4qihhqx7(_S("69|183|170|169|170|170|178"), _v7waz68vjhn.PromoCode)
    end
end

local function _vg5aeo4t6xb()
    if _va4u7o7xobt() and _v7waz68vjhn.SellWhenFull then return true end
    if _v7waz68vjhn.SellMinCash > 0 and _vkd8xnh0cyx() >= _v7waz68vjhn.SellMinCash then return true end
    return false
end

local function _vz1pixo5q1v()
    _vv6vvad4d9h(_S("125|193|239|236|237|157|225|242|237|226|183|157|237|230|224|232|242|237|157|240|237|222|234|171|171|171"))
    pcall(function()
        local tool = Character and Character:FindFirstChildOfClass(_S("60|144|171|171|168"))
        if tool then
            tool.Parent = _v9qqaid831c.Backpack
            task.wait(0.1)
            _vkhkeyt0oao:EquipTool(tool)
        end
        for i = 1, _v7waz68vjhn.DupeAmount do
            _vme4qihhqx7(_S("105|205|219|216|217")); _vme4qihhqx7(_S("90|202|195|189|197|207|202")); _vme4qihhqx7(_S("82|181|193|190|190|183|181|198"))
            task.wait(0.05)
        end
    end)
end

local function _vx96k21ecg0(cframe)
    if not _vjwpa6b4z60() then return false end
    _vqxyh6gcfta.CFrame = cframe + Vector3.new(0, 3, 0)
    task.wait(_v7waz68vjhn.TeleportDelay)
    return true
end

local function _vdmb3sdada7(scrollingFrame)
    for _, child in ipairs(scrollingFrame:GetChildren()) do
        if not child:IsA(_S("121|206|194|197|226|236|237|197|218|242|232|238|237")) and not child:IsA(_S("75|160|148|155|172|175|175|180|185|178")) then
            child:Destroy()
        end
    end
end

local function _vv6vvad4d9h(message)
    local _vf0gjb0rnau = os.date(_S("128|165|200|186|165|205|186|165|211"))
    table.insert(State.Logs, 1, _S("63|154") .. _vf0gjb0rnau .. _S("99|192|131") .. message)
    if #State.Logs > 50 then
        table.remove(State.Logs)
    end
    if LogList then
        pcall(function()
            _vdmb3sdada7(LogList)
            for i, log in ipairs(State.Logs) do
                if i > 15 then break end
                local label = Instance.new(_S("127|211|228|247|243|203|224|225|228|235"))
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

local function _v9ohaz27yl5()
    State.RemoteCache = {}
    pcall(function()
        for _, remote in ipairs(_v02othobmq8:GetDescendants()) do
            if remote:IsA(_S("73|155|174|182|184|189|174|142|191|174|183|189")) or remote:IsA(_S("85|167|186|194|196|201|186|155|202|195|184|201|190|196|195")) then
                table.insert(State.RemoteCache, {
                    Instance = remote,
                    Name = remote.Name,
                    Type = remote.ClassName,
                })
            end
        end
    end)
    _vv6vvad4d9h(_S("76|143|173|175|180|177|176|108") .. #State.RemoteCache .. _S("95|127|209|196|204|206|211|196|210"))
end

local function _vme4qihhqx7(namePattern, ...)
    local args = {...}
    for _, remote in ipairs(State.RemoteCache) do
        local rName = string.lower(remote.Name)
        local _v3a4tabkuce = string.lower(namePattern)
        if string.find(rName, _v3a4tabkuce) then
            pcall(function()
                if remote.Type == _S("113|195|214|222|224|229|214|182|231|214|223|229") then
                    remote.Instance:FireServer(Exec.Unpack(args))
                elseif remote.Type == _S("97|179|198|206|208|213|198|167|214|207|196|213|202|208|207") then
                    remote.Instance:InvokeServer(Exec.Unpack(args))
                end
            end)
        end
    end
end

local function _vxjcv8bvu2o(name, ...)
    local args = {...}
    for _, remote in ipairs(State.RemoteCache) do
        if remote.Name == name then
            pcall(function()
                if remote.Type == _S("110|192|211|219|221|226|211|179|228|211|220|226") then
                    remote.Instance:FireServer(Exec.Unpack(args))
                elseif remote.Type == _S("101|183|202|210|212|217|202|171|218|211|200|217|206|212|211") then
                    remote.Instance:InvokeServer(Exec.Unpack(args))
                end
            end)
            return true
        end
    end
    return false
end

local _v1rz5rex4bw = {
    _S("67|181|178|166|174"), _S("89|200|203|190"), _S("116|231|232|227|226|217"), _S("112|221|217|222|213|226|209|220"), _S("122|221|236|243|237|238|219|230"), _S("70|173|171|179"), _S("112|211|223|209|220"), _S("76|181|190|187|186"),
    _S("96|199|207|204|196"), _S("105|205|210|202|214|216|215|205"), _S("76|175|187|188|188|177|190"), _S("110|225|215|218|228|211|224"), _S("70|184|187|168|191"), _S("95|196|204|196|209|192|203|195"), _S("61|176|158|173|173|165|166|175|162"),
    _S("62|159|171|163|178|166|183|177|178"), _S("62|172|173|162|163"), _S("124|242|225|229|234"), _S("89|189|190|201|200|204|194|205"), _S("107|205|218|224|215|207|208|221"), _S("69|184|185|166|183|184|166|181|181|173|174|183|170"),
    _S("73|189|184|185|170|195"), _S("71|182|183|168|179"), _S("97|209|198|194|211|205"), _S("121|227|218|221|222"), _S("70|183|187|167|184|186|192"), _S("82|193|180|197|187|182|187|179|192"), _S("122|230|219|234|227|237"),
    _S("122|231|227|238|226|236|227|230"), _S("127|243|232|243|224|237|232|244|236"), _S("86|198|194|183|202|191|196|203|195"), _S("129|241|230|243|234|229|240|245"), _S("114|236|219|228|213|225|224"), _S("127|230|224|241|237|228|243"),
    _S("111|208|224|228|208|220|208|225|216|221|212"), _S("60|159|165|176|174|165|170|161"), _S("63|179|160|173|185|160|173|168|179|164"), _S("97|206|208|208|207|212|213|208|207|198"), _S("95|210|212|205|210|211|206|205|196"),
    _S("95|193|203|206|206|195|210|211|206|205|196"), _S("119|230|229|240|239"), _S("69|185|180|186|183|178|166|177|174|179|170"), _S("93|208|205|198|203|194|201"), _S("107|205|208|221|228|215"), _S("119|218|223|216|227|218|220|219|230|229|240"),
}

local function _v1y2wurcl0l()
    local rocks = {}
    local function _v8oyas05wlq(parent)
        if not parent then return end
        for _, child in ipairs(parent:GetChildren()) do
            local _v55wabs4dz5 = string.lower(child.Name)
            if child:IsA(_S("127|193|224|242|228|207|224|241|243")) or child:IsA(_S("116|193|227|216|217|224")) then
                local _v893hmsa2la = false
                for _, _v3a4tabkuce in ipairs(_v1rz5rex4bw) do
                    if string.find(_v55wabs4dz5, _v3a4tabkuce) then
                        _v893hmsa2la = true
                        break
                    end
                end
                if _v893hmsa2la and _v93vjgcq0ie(_v55wabs4dz5) then
                    local part = child:IsA(_S("100|166|197|215|201|180|197|214|216")) and child or child:FindFirstChildWhichIsA(_S("84|150|181|199|185|164|181|198|200"))
                    if part then
                        local dist = _vbymtkx7r65(part)
                        if dist <= _v7waz68vjhn.FarmRadius then

                            local value = 0
                            pcall(function()
                                local val = child:FindFirstChild(_S("65|151|162|173|182|166")) or child:FindFirstChild(_S("120|200|234|225|219|221")) or child:FindFirstChild(_S("99|186|210|213|215|203")) or child:FindFirstChild(_S("88|174|185|196|205|189|167|206|189|202|202|193|188|189"))
                                if val and val:IsA(_S("121|207|218|229|238|222|187|218|236|222")) then
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
                    _v8oyas05wlq(child)
                end
            end
        end
    end

    local _vaijhvg0wuh = {
        _v92gucjek3x:FindFirstChild(_S("91|173|202|190|198|206")),
        _v92gucjek3x:FindFirstChild(_S("97|176|211|198|212")),
        _v92gucjek3x:FindFirstChild(_S("66|143|171|176|167|180|163|174|181")),
        _v92gucjek3x:FindFirstChild(_S("124|201|229|234|225|239")),
        _v92gucjek3x:FindFirstChild(_S("91|173|192|206|202|208|205|190|192|206")),
        _v92gucjek3x:FindFirstChild(_S("89|166|186|201")),
        _v92gucjek3x:FindFirstChild(_S("119|203|220|233|233|216|224|229")),
        _v92gucjek3x:FindFirstChild(_S("92|159|206|213|207|208|189|200|207")),
        _v92gucjek3x:FindFirstChild(_S("109|186|220|226|219|225|206|214|219")),
        _v92gucjek3x,
    }

    for _, area in ipairs(_vaijhvg0wuh) do
        if area then
            _v8oyas05wlq(area)
        end
    end

    if _v7waz68vjhn.PriorityHighestValue then
        table.sort(rocks, function(a, b) return a.Value > b.Value end)
    elseif _v7waz68vjhn.PriorityClosest then
        table.sort(rocks, function(a, b) return a.Distance < b.Distance end)
    end

    return rocks
end

local function _vwi0vrnlz4s()
    local shops = {}
    local function _vqua9hnz1zl(parent)
        if not parent then return end
        for _, child in ipairs(parent:GetChildren()) do
            local _v55wabs4dz5 = string.lower(child.Name)
            if child:IsA(_S("104|181|215|204|205|212")) or child:IsA(_S("68|134|165|183|169|148|165|182|184")) then
                if string.find(_v55wabs4dz5, _S("98|213|202|209|210")) or string.find(_v55wabs4dz5, _S("122|237|223|230|230")) or
                   string.find(_v55wabs4dz5, _S("82|197|198|193|196|183")) or string.find(_v55wabs4dz5, _S("89|198|190|203|188|193|186|199|205")) or
                   string.find(_v55wabs4dz5, _S("121|237|235|218|221|222|235")) or string.find(_v55wabs4dz5, _S("78|178|179|175|186|179|192")) or
                   string.find(_v55wabs4dz5, _S("64|173|161|178|171|165|180")) or string.find(_v55wabs4dz5, _S("102|220|203|212|202|213|216")) or
                   string.find(_v55wabs4dz5, _S("118|217|215|233|222|223|219|232")) or string.find(_v55wabs4dz5, _S("91|189|208|212|192|205")) or
                   string.find(_v55wabs4dz5, _S("107|217|219|206")) or string.find(_v55wabs4dz5, _S("87|186|184|202|191")) or
                   string.find(_v55wabs4dz5, _S("83|187|194|192|184")) or string.find(_v55wabs4dz5, _S("108|206|205|223|209")) or
                   string.find(_v55wabs4dz5, _S("104|203|201|213|216")) then
                    local part = child:IsA(_S("115|181|212|230|216|195|212|229|231")) and child or child:FindFirstChildWhichIsA(_S("96|162|193|211|197|176|193|210|212")) or child:FindFirstChild(_S("103|175|220|212|200|213|214|208|203|185|214|214|219|183|200|217|219"))
                    if part then
                        local dist = _vbymtkx7r65(part)
                        table.insert(shops, {
                            Instance = child,
                            Part = part,
                            Distance = dist,
                            Name = child.Name,
                        })
                    end
                end
                if #child:GetChildren() > 0 then
                    _vqua9hnz1zl(child)
                end
            end
        end
    end

    _vqua9hnz1zl(_v92gucjek3x)
    table.sort(shops, function(a, b) return a.Distance < b.Distance end)
    return shops
end

local function _vf37ku9f4vl(rockData)
    local rock = rockData.Instance
    local part = rockData.Part

    if not rock or not rock.Parent then return false end

    _v4l7y64k05o()
    _v19dcvsp9hu(rock)

    _vv6vvad4d9h(_S("115|192|220|225|220|225|218|173|147") .. rockData.Name)

    _vmax6nag1aa(part.Position)
    task.wait(0.05)

    local function _vf3velzzetg()

        if HasFireClick then
            local clickDetector = rock:FindFirstChildOfClass(_S("78|145|186|183|177|185|146|179|194|179|177|194|189|192")) or part:FindFirstChildOfClass(_S("83|150|191|188|182|190|151|184|199|184|182|199|194|197"))
            if clickDetector then Exec.FireClick(clickDetector) end
        end
        if HasFireProximity then
            local prompt = rock:FindFirstChildOfClass(_S("67|147|181|178|187|172|176|172|183|188|147|181|178|176|179|183")) or part:FindFirstChildOfClass(_S("129|209|243|240|249|234|238|234|245|250|209|243|240|238|241|245"))
            if prompt then
                if _v7waz68vjhn.BypassPromptHold then prompt.HoldDuration = 0 end
                Exec.FireProximity(prompt)
            end
        end
        if HasFireTouch then
            Exec.FireTouch(_vqxyh6gcfta, part, 0)
            task.wait(0.01)
            Exec.FireTouch(_vqxyh6gcfta, part, 1)
        end

        local tool = Character and Character:FindFirstChildOfClass(_S("105|189|216|216|213"))
        if tool then tool:Activate() end

        _vme4qihhqx7(_S("83|192|188|193|184")); _vme4qihhqx7(_S("106|210|203|220|224|207|221|222")); _vme4qihhqx7(_S("109|208|220|217|217|210|208|225"))
        _vme4qihhqx7(_S("112|210|226|213|209|219")); _vme4qihhqx7(_S("95|198|192|211|199|196|209")); _vme4qihhqx7(_S("116|216|221|219"))
        _vme4qihhqx7(_S("127|239|232|226|234")); _vme4qihhqx7(_S("84|199|203|189|194|187"))

        for _, remote in ipairs(State.RemoteCache) do
            local rName = string.lower(remote.Name)
            if string.find(rName, _S("119|228|224|229|220")) or string.find(rName, _S("128|228|233|231")) or string.find(rName, _S("86|190|183|200|204|187|201|202")) then
                pcall(function()
                    if remote.Type == _S("114|196|215|223|225|230|215|183|232|215|224|230") then
                        remote.Instance:FireServer(rock, part)
                    elseif remote.Type == _S("129|211|230|238|240|245|230|199|246|239|228|245|234|240|239") then
                        remote.Instance:InvokeServer(rock, part)
                    end
                end)
            end
        end
    end

    local hits = _v7waz68vjhn.RapidMine and _v7waz68vjhn.RapidMineCount or 1
    for _ = 1, hits do
        _vf3velzzetg()
        if hits > 1 then task.wait(0.03) end
    end

    _vpphc2k00e4()
    State.FarmCount = State.FarmCount + 1
    pcall(function() _vvcghtq480v(rockData.Name) end)

    return true
end

local function _vfklcf8eoiw(shopData)
    if not shopData then return false end

    local shop = shopData.Instance
    local part = shopData.Part

    _vv6vvad4d9h(_S("123|206|224|231|231|228|233|226|155|220|239|181|155") .. shopData.Name)

    _vmax6nag1aa(part.Position)
    task.wait(0.1)

    if HasFireClick then
        local clickDetector = shop:FindFirstChildOfClass(_S("62|129|170|167|161|169|130|163|178|163|161|178|173|176")) or part:FindFirstChildOfClass(_S("83|150|191|188|182|190|151|184|199|184|182|199|194|197"))
        if clickDetector then Exec.FireClick(clickDetector) end
    end

    if HasFireProximity then
        local prompt = shop:FindFirstChildOfClass(_S("125|205|239|236|245|230|234|230|241|246|205|239|236|234|237|241")) or part:FindFirstChildOfClass(_S("111|191|225|222|231|216|220|216|227|232|191|225|222|220|223|227"))
        if prompt then Exec.FireProximity(prompt) end
    end

    if HasFireTouch then
        Exec.FireTouch(_vqxyh6gcfta, part, 0)
        task.wait(0.01)
        Exec.FireTouch(_vqxyh6gcfta, part, 1)
    end

    _vme4qihhqx7(_S("88|203|189|196|196"))
    _vme4qihhqx7(_S("74|189|178|185|186"))
    _vme4qihhqx7(_S("97|206|194|211|204|198|213"))
    _vme4qihhqx7(_S("107|223|221|204|207|208"))
    _vme4qihhqx7(_S("78|177|175|193|182"))
    _vme4qihhqx7(_S("127|236|238|237|228|248"))
    _vme4qihhqx7(_S("101|216|202|209|209|198|209|209"))
    _vme4qihhqx7(_S("105|220|206|213|213|200|202|213|213"))

    State.SellCount = State.SellCount + 1

    return true
end

local function _vmxf3w0runt()
    if State.FarmConnection then return end
    _vv6vvad4d9h(_S("81|146|198|197|192|113|151|178|195|190|113|164|165|146|163|165|150|149"))

    State.FarmConnection = true
    task.spawn(function()
        while _v7waz68vjhn.AutoFarm and State.FarmConnection do
            if _vjwpa6b4z60() then
                local rocks = _v1y2wurcl0l()
                if #rocks > 0 then
                    local _vcr62f7vct7 = rocks[1]
                    State.CurrentTarget = _vcr62f7vct7.Name
                    _vf37ku9f4vl(_vcr62f7vct7)
                else
                    State.CurrentTarget = _S("69|152|170|166|183|168|173|174|179|172|115|115|115")
                end
            end
            task.wait(_v7waz68vjhn.FarmDelay)
        end
    end)
end

local function _vg3ft1nprj0()
    State.FarmConnection = nil
    State.CurrentTarget = _S("78|156|189|188|179")
    _vv6vvad4d9h(_S("86|151|203|202|197|118|156|183|200|195|118|169|170|165|166|166|155|154"))
end

local function _vfe6auuyq2a()
    if State.SellConnection then return end
    _vv6vvad4d9h(_S("62|127|179|178|173|94|145|163|170|170|94|145|146|127|144|146|131|130"))

    State.SellConnection = true
    task.spawn(function()
        while _v7waz68vjhn.AutoSell and State.SellConnection do
            if _vjwpa6b4z60() then
                local _vgpg9gakq1x = true
                if _v7waz68vjhn.SellWhenFull and not _va4u7o7xobt() then _vgpg9gakq1x = false end
                if _v7waz68vjhn.SellMinCash > 0 and _vkd8xnh0cyx() < _v7waz68vjhn.SellMinCash then _vgpg9gakq1x = false end
                if _vgpg9gakq1x then
                    local shops = _vwi0vrnlz4s()
                    if #shops > 0 then
                        _vfklcf8eoiw(shops[1])
                        pcall(_vj7ry4jdtkk)
                    end
                end
            end
            task.wait(_v7waz68vjhn.SellDelay)
        end
    end)
end

local function _v6ljjlim2a7()
    State.SellConnection = nil
    _vv6vvad4d9h(_S("73|138|190|189|184|105|156|174|181|181|105|156|157|152|153|153|142|141"))
end

local function _v976re6fk96()
    if State.UpgradeConn then return end
    _vv6vvad4d9h(_S("118|183|235|234|229|150|203|230|221|232|215|218|219|150|201|202|183|200|202|187|186"))

    State.UpgradeConn = true
    task.spawn(function()
        while _v7waz68vjhn.AutoUpgrade and State.UpgradeConn do
            _vme4qihhqx7(_S("118|235|230|221|232|215|218|219"))
            _vme4qihhqx7(_S("117|215|234|238"))
            _vme4qihhqx7(_S("124|236|241|238|223|228|221|239|225"))
            _vme4qihhqx7(_S("108|227|205|222|217|224|212"))
            _vme4qihhqx7(_S("122|234|227|221|229|219|242|223"))
            _vme4qihhqx7(_S("95|193|192|194|202|207|192|194|202"))
            _vme4qihhqx7(_S("67|182|179|168|168|167"))
            _vme4qihhqx7(_S("99|199|204|202"))

            State.UpgradeCount = State.UpgradeCount + 1
            task.wait(1)
        end
    end)
end

local function _va469as3ox3()
    State.UpgradeConn = nil
    _vv6vvad4d9h(_S("105|170|222|221|216|137|190|217|208|219|202|205|206|137|188|189|184|185|185|174|173"))
end

local function _vpkh13lg7pm()
    for _, _vdppl3gxrr7 in ipairs(State.ESPHighlights) do
        pcall(function() _vdppl3gxrr7:Destroy() end)
    end
    State.ESPHighlights = {}
end

local function _v8vr1101p6x()
    _vpkh13lg7pm()

    local rocks = _v1y2wurcl0l()
    for _, rock in ipairs(rocks) do
        if rock.Instance and rock.Instance.Parent then

            local _vdppl3gxrr7 = Instance.new(_S("94|166|199|197|198|202|199|197|198|210"))
            _vdppl3gxrr7.Name = _S("81|150|164|161|176") .. rock.Name
            _vdppl3gxrr7.FillTransparency = 0.6
            _vdppl3gxrr7.OutlineTransparency = 0
            _vdppl3gxrr7.OutlineColor = rock.Value > 0 and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(100, 200, 255)
            _vdppl3gxrr7.FillColor = rock.Value > 0 and Color3.fromRGB(255, 200, 50) or Color3.fromRGB(80, 150, 255)
            _vdppl3gxrr7.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            _vdppl3gxrr7.Parent = rock.Instance

            local _vc3vykb332t = Instance.new(_S("114|180|219|222|222|212|225|211|228|214|185|231|219"))
            _vc3vykb332t.Name = _S("67|136|150|147|143|164|165|168|175")
            _vc3vykb332t.Size = UDim2.new(0, 120, 0, 30)
            _vc3vykb332t.StudsOffset = Vector3.new(0, 3, 0)
            _vc3vykb332t.AlwaysOnTop = true
            _vc3vykb332t.Parent = rock.Part

            local label = Instance.new(_S("93|177|194|213|209|169|190|191|194|201"))
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 0.4
            label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            label.Text = rock.Name .. _S("64|96|155") .. math.floor(rock.Distance) .. _S("94|203|187") .. (rock.Value > 0 and (_S("120|152|244|152|156") .. tostring(rock.Value)) or _S("112|"))
            label.TextColor3 = rock.Value > 0 and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(100, 200, 255)
            label.Font = Enum.Font.GothamBold
            label.TextSize = 11
            label.Parent = _vc3vykb332t

            local _vsr6fg33r69 = Instance.new(_S("81|166|154|148|192|195|191|182|195"))
            _vsr6fg33r69.CornerRadius = UDim.new(0, 4)
            _vsr6fg33r69.Parent = label

            table.insert(State.ESPHighlights, _vdppl3gxrr7)
            table.insert(State.ESPHighlights, _vc3vykb332t)
        end
    end

    local shops = _vwi0vrnlz4s()
    for _, shop in ipairs(shops) do
        if shop.Instance and shop.Instance.Parent then
            local _vdppl3gxrr7 = Instance.new(_S("108|180|213|211|212|216|213|211|212|224"))
            _vdppl3gxrr7.Name = _S("89|158|172|169|184|172|193|200|201|184") .. shop.Name
            _vdppl3gxrr7.FillTransparency = 0.5
            _vdppl3gxrr7.OutlineTransparency = 0
            _vdppl3gxrr7.OutlineColor = Color3.fromRGB(0, 255, 100)
            _vdppl3gxrr7.FillColor = Color3.fromRGB(50, 255, 100)
            _vdppl3gxrr7.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            _vdppl3gxrr7.Parent = shop.Instance

            local _vc3vykb332t = Instance.new(_S("92|158|197|200|200|190|203|189|206|192|163|209|197"))
            _vc3vykb332t.Name = _S("81|150|164|161|164|185|192|193|157|178|179|182|189")
            _vc3vykb332t.Size = UDim2.new(0, 100, 0, 25)
            _vc3vykb332t.StudsOffset = Vector3.new(0, 3, 0)
            _vc3vykb332t.AlwaysOnTop = true
            _vc3vykb332t.Parent = shop.Part

            local label = Instance.new(_S("104|188|205|224|220|180|201|202|205|212"))
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 0.4
            label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            label.Text = _S("129|212|201|208|209|187|161") .. shop.Name
            label.TextColor3 = Color3.fromRGB(0, 255, 100)
            label.Font = Enum.Font.GothamBold
            label.TextSize = 10
            label.Parent = _vc3vykb332t

            table.insert(State.ESPHighlights, _vdppl3gxrr7)
            table.insert(State.ESPHighlights, _vc3vykb332t)
        end
    end

    _vv6vvad4d9h(_S("72|141|155|152|130|104") .. #rocks .. _S("130|162|244|241|229|237|245|174|162") .. #shops .. _S("73|105|188|177|184|185|188"))
end

local function _viqkdi2an3c()
    if _v7waz68vjhn.ESPEnabled then
        _v8vr1101p6x()

        task.spawn(function()
            while _v7waz68vjhn.ESPEnabled do
                task.wait(5)
                if _v7waz68vjhn.ESPEnabled then
                    _v8vr1101p6x()
                end
            end
        end)
    end
end

local function _vcjbsky4wca()
    _vpkh13lg7pm()
end

local function _vbw4lcu8jky()
    if State.AntiDamageConn then return end
    _vv6vvad4d9h(_S("73|138|183|189|178|105|141|170|182|170|176|174|105|142|151|138|139|149|142|141"))

    State.AntiDamageConn = _v9vp3q2syfb.Heartbeat:Connect(function()
        if not _vjwpa6b4z60() then return end

        if _vkhkeyt0oao and _vkhkeyt0oao.Health < _vkhkeyt0oao.MaxHealth then
            _vkhkeyt0oao.Health = _vkhkeyt0oao.MaxHealth
        end

        if _v7waz68vjhn.AntiFreeze then
            pcall(function()

                local _vwxk2kkc0o8 = Character:FindFirstChild(_S("86|173|183|200|195|202|190")) or Character:FindFirstChild(_S("76|160|177|185|188|177|190|173|192|193|190|177")) or Character:FindFirstChild(_S("94|161|205|202|194"))
                if _vwxk2kkc0o8 and _vwxk2kkc0o8:IsA(_S("127|213|224|235|244|228|193|224|242|228")) then
                    _vwxk2kkc0o8.Value = 100
                end

                local _v5yv76p0q7c = Character:FindFirstChild(_S("102|172|216|213|224|203|212")) or Character:FindFirstChild(_S("119|192|234|189|233|230|241|220|229")) or Character:FindFirstChild(_S("106|176|220|207|207|228|211|216|209"))
                if _v5yv76p0q7c and _v5yv76p0q7c:IsA(_S("129|195|240|240|237|215|226|237|246|230")) then
                    _v5yv76p0q7c.Value = false
                end

                _vme4qihhqx7(_S("68|187|165|182|177|184|172"))
                _vme4qihhqx7(_S("79|196|189|181|193|180|180|201|180"))
                _vme4qihhqx7(_S("123|227|224|220|239"))
            end)
        end
    end)
end

local function _v38vluifqi9()
    if State.AntiDamageConn then
        State.AntiDamageConn:Disconnect()
        State.AntiDamageConn = nil
    end
    _vv6vvad4d9h(_S("68|133|178|184|173|100|136|165|177|165|171|169|100|136|141|151|133|134|144|137|136"))
end

local function _v2w74nz9wje()
    if not _v7waz68vjhn.UnlimitedBackpack then return end
    _vv6vvad4d9h(_S("88|153|200|200|196|209|193|198|191|120|173|198|196|193|197|193|204|189|188|120|154|185|187|195|200|185|187|195|134|134|134"))

    pcall(function()

        local _v3yty6a2syl = _v9qqaid831c:FindFirstChild(_S("66|132|163|165|173|178|163|165|173|133|163|178|163|165|171|182|187")) or _v9qqaid831c:FindFirstChild(_S("61|138|158|181|128|158|175|175|182")) or _v9qqaid831c:FindFirstChild(_S("107|174|204|221|221|228|182|178"))
        if _v3yty6a2syl and _v3yty6a2syl:IsA(_S("79|165|176|187|196|180|145|176|194|180")) then
            _v3yty6a2syl.Value = 999999
        end

        local _v75o3cg5yaq = _v9qqaid831c:FindFirstChild(_S("104|212|205|201|204|205|218|219|220|201|220|219"))
        if _v75o3cg5yaq then
            for _, stat in ipairs(_v75o3cg5yaq:GetChildren()) do
                local _v55wabs4dz5 = string.lower(stat.Name)
                if string.find(_v55wabs4dz5, _S("130|228|227|229|237|242|227|229|237")) or string.find(_v55wabs4dz5, _S("65|164|162|179|179|186")) or string.find(_v55wabs4dz5, _S("90|189|187|202|187|189|195|206|211")) or string.find(_v55wabs4dz5, _S("73|192|174|178|176|177|189")) or string.find(_v55wabs4dz5, _S("112|219|215")) then
                    if stat:IsA(_S("67|153|164|175|184|168|133|164|182|168")) then
                        stat.Value = 999999
                    end
                end
            end
        end

        _vme4qihhqx7(_S("117|215|214|216|224|229|214|216|224"))
        _vme4qihhqx7(_S("60|159|157|172|157|159|165|176|181"))
        _vme4qihhqx7(_S("123|222|220|237|237|244"))
        _vme4qihhqx7(_S("77|194|189|180|191|174|177|178|172|175|174|176|184|189|174|176|184"))
    end)

    task.spawn(function()
        while _v7waz68vjhn.UnlimitedBackpack do
            task.wait(2)
            pcall(function()
                local _v75o3cg5yaq = _v9qqaid831c:FindFirstChild(_S("83|191|184|180|183|184|197|198|199|180|199|198"))
                if _v75o3cg5yaq then
                    for _, stat in ipairs(_v75o3cg5yaq:GetChildren()) do
                        local _v55wabs4dz5 = string.lower(stat.Name)
                        if string.find(_v55wabs4dz5, _S("79|177|176|178|186|191|176|178|186")) or string.find(_v55wabs4dz5, _S("80|179|177|194|194|201")) or string.find(_v55wabs4dz5, _S("112|211|209|224|209|211|217|228|233")) or string.find(_v55wabs4dz5, _S("96|215|197|201|199|200|212")) or string.find(_v55wabs4dz5, _S("70|177|173")) then
                            if stat:IsA(_S("86|172|183|194|203|187|152|183|201|187")) then
                                stat.Value = 999999
                            end
                        end
                    end
                end
            end)
        end
    end)
end

local function _viozocvluoe()
    if not _v7waz68vjhn.UnlimitedLuck then return end
    _vv6vvad4d9h(_S("124|189|236|236|232|245|229|234|227|156|209|234|232|229|233|229|240|225|224|156|200|241|223|231|170|170|170"))

    pcall(function()

        local _vty8mniecl8 = _v9qqaid831c:FindFirstChild(_S("64|140|181|163|171")) or _v9qqaid831c:FindFirstChild(_S("98|166|203|201|174|215|197|205")) or _v9qqaid831c:FindFirstChild(_S("116|193|221|226|221|226|219|192|233|215|223"))
        if _vty8mniecl8 and _vty8mniecl8:IsA(_S("112|198|209|220|229|213|178|209|227|213")) then
            _vty8mniecl8.Value = 999999
        end

        local _v75o3cg5yaq = _v9qqaid831c:FindFirstChild(_S("61|169|162|158|161|162|175|176|177|158|177|176"))
        if _v75o3cg5yaq then
            for _, stat in ipairs(_v75o3cg5yaq:GetChildren()) do
                local _v55wabs4dz5 = string.lower(stat.Name)
                if string.find(_v55wabs4dz5, _S("110|218|227|209|217")) then
                    if stat:IsA(_S("127|213|224|235|244|228|193|224|242|228")) then
                        stat.Value = 999999
                    end
                end
            end
        end

        _vme4qihhqx7(_S("90|198|207|189|197"))
        _vme4qihhqx7(_S("91|199|208|190|198|212"))
        _vme4qihhqx7(_S("74|174|179|177|169|182|191|173|181"))
    end)

    task.spawn(function()
        while _v7waz68vjhn.UnlimitedLuck do
            task.wait(2)
            pcall(function()
                local _v75o3cg5yaq = _v9qqaid831c:FindFirstChild(_S("91|199|192|188|191|192|205|206|207|188|207|206"))
                if _v75o3cg5yaq then
                    for _, stat in ipairs(_v75o3cg5yaq:GetChildren()) do
                        if string.find(string.lower(stat.Name), _S("63|171|180|162|170")) and stat:IsA(_S("90|176|187|198|207|191|156|187|205|191")) then
                            stat.Value = 999999
                        end
                    end
                end
            end)
        end
    end)
end

local function _vdxokk31e4o(amount)
    _vv6vvad4d9h(_S("61|126|177|177|162|170|173|177|166|171|164|93|177|172|93|161|178|173|162|93") .. amount .. _S("113|145|218|229|214|222|228|159|159|159"))

    pcall(function()

        for i = 1, amount do
            _vme4qihhqx7(_S("70|169|181|178|178|171|169|186"))
            _vme4qihhqx7(_S("96|205|201|206|197"))
            _vme4qihhqx7(_S("110|214|207|224|228|211|225|226"))
            _vme4qihhqx7(_S("86|198|191|185|193|203|198"))
            _vme4qihhqx7(_S("78|181|175|194|182|179|192"))
            _vme4qihhqx7(_S("108|216|219|219|224"))
            _vme4qihhqx7(_S("104|215|202|220|201|209|214"))
            _vme4qihhqx7(_S("67|170|181|164|177|183"))
            _vme4qihhqx7(_S("104|218|205|223|201|218|204"))
            task.wait(0.05)
        end

        local _v75o3cg5yaq = _v9qqaid831c:FindFirstChild(_S("77|185|178|174|177|178|191|192|193|174|193|192"))
        if _v75o3cg5yaq then
            for _, stat in ipairs(_v75o3cg5yaq:GetChildren()) do
                local _v55wabs4dz5 = string.lower(stat.Name)
                if string.find(_v55wabs4dz5, _S("101|200|215|222|216|217|198|209")) or string.find(_v55wabs4dz5, _S("119|230|233|220")) or string.find(_v55wabs4dz5, _S("86|189|187|195")) or string.find(_v55wabs4dz5, _S("124|229|240|225|233")) then
                    if stat:IsA(_S("81|159|198|190|179|182|195|167|178|189|198|182")) or stat:IsA(_S("63|136|173|179|149|160|171|180|164")) then
                        stat.Value = stat.Value * amount
                    end
                end
            end
        end

        for i = 1, amount do
            _vme4qihhqx7(_S("71|186|172|179|179"))
            task.wait(0.02)
            _vme4qihhqx7(_S("84|182|201|205"))
            task.wait(0.02)
        end

        local rocks = _v1y2wurcl0l()
        if #rocks > 0 then
            local _vf54ujy5ydw = rocks[1]
            for i = 1, amount do
                for _, remote in ipairs(State.RemoteCache) do
                    local rName = string.lower(remote.Name)
                    if string.find(rName, _S("125|224|236|233|233|226|224|241")) or string.find(rName, _S("84|196|189|183|191|201|196")) or string.find(rName, _S("94|202|205|205|210")) then
                        pcall(function()
                            if remote.Type == _S("130|212|231|239|241|246|231|199|248|231|240|246") then
                                remote.Instance:FireServer(_vf54ujy5ydw.Instance, _vf54ujy5ydw.Part)
                            end
                        end)
                    end
                end
                task.wait(0.05)
            end
        end
    end)

    State.DupeCount = State.DupeCount + amount
    _vv6vvad4d9h(_S("86|154|203|198|187|118|183|202|202|187|195|198|202|118|185|197|195|198|194|187|202|187|144|118") .. amount .. _S("121|241"))
end

local function _vkm9n5mxhp2()
    if State.NoclipConn then return end
    _vv6vvad4d9h(_S("76|154|187|175|184|181|188|108|145|154|141|142|152|145|144"))

    State.NoclipConn = _v9vp3q2syfb.Stepped:Connect(function()
        if not _v7waz68vjhn.Noclip then return end
        if not _vjwpa6b4z60() then return end
        for _, part in ipairs(Character:GetDescendants()) do
            if part:IsA(_S("70|136|167|185|171|150|167|184|186")) then
                part.CanCollide = false
            end
        end
    end)
end

local function _vqulkb5gnc2()
    if State.NoclipConn then
        State.NoclipConn:Disconnect()
        State.NoclipConn = nil
    end
    _vv6vvad4d9h(_S("121|199|232|220|229|226|233|153|189|194|204|186|187|197|190|189"))
end

local _vkm8z4l1xwo = nil
local _vyh3myy6je2 = nil

local function _v1vyt4wih0r()
    if State.FlyConn then return end
    if not _vjwpa6b4z60() then return end
    _vv6vvad4d9h(_S("112|182|220|233|144|181|190|177|178|188|181|180"))

    _vkm8z4l1xwo = Instance.new(_S("88|154|199|188|209|174|189|196|199|187|193|204|209"))
    _vkm8z4l1xwo.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    _vkm8z4l1xwo.Velocity = Vector3.new(0, 0, 0)
    _vkm8z4l1xwo.Parent = _vqxyh6gcfta

    _vyh3myy6je2 = Instance.new(_S("82|148|193|182|203|153|203|196|193"))
    _vyh3myy6je2.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    _vyh3myy6je2.P = 9e4
    _vyh3myy6je2.Parent = _vqxyh6gcfta

    State.FlyConn = _v9vp3q2syfb.RenderStepped:Connect(function()
        if not _v7waz68vjhn.FlyEnabled then return end
        if not _vjwpa6b4z60() then return end

        local cam = _v92gucjek3x.CurrentCamera
        local _v8s0ucu6ccd = Vector3.new(0, 0, 0)

        if _vnqiki4fvlv:IsKeyDown(Enum.KeyCode.W) then
            _v8s0ucu6ccd = _v8s0ucu6ccd + cam.CFrame.LookVector
        end
        if _vnqiki4fvlv:IsKeyDown(Enum.KeyCode.S) then
            _v8s0ucu6ccd = _v8s0ucu6ccd - cam.CFrame.LookVector
        end
        if _vnqiki4fvlv:IsKeyDown(Enum.KeyCode.A) then
            _v8s0ucu6ccd = _v8s0ucu6ccd - cam.CFrame.RightVector
        end
        if _vnqiki4fvlv:IsKeyDown(Enum.KeyCode.D) then
            _v8s0ucu6ccd = _v8s0ucu6ccd + cam.CFrame.RightVector
        end
        if _vnqiki4fvlv:IsKeyDown(Enum.KeyCode.Space) then
            _v8s0ucu6ccd = _v8s0ucu6ccd + Vector3.new(0, 1, 0)
        end
        if _vnqiki4fvlv:IsKeyDown(Enum.KeyCode.LeftShift) then
            _v8s0ucu6ccd = _v8s0ucu6ccd - Vector3.new(0, 1, 0)
        end

        if _v8s0ucu6ccd.Magnitude > 0 then
            _v8s0ucu6ccd = _v8s0ucu6ccd.Unit * _v7waz68vjhn.FlySpeed
        end

        _vkm8z4l1xwo.Velocity = _v8s0ucu6ccd
        _vyh3myy6je2.CFrame = cam.CFrame
    end)
end

local function _vjnercdb1pz()
    if State.FlyConn then
        State.FlyConn:Disconnect()
        State.FlyConn = nil
    end
    if _vkm8z4l1xwo then _vkm8z4l1xwo:Destroy() _vkm8z4l1xwo = nil end
    if _vyh3myy6je2 then _vyh3myy6je2:Destroy() _vyh3myy6je2 = nil end
    _vv6vvad4d9h(_S("79|149|187|200|111|147|152|162|144|145|155|148|147"))
end

local function _vb0zw0tduye()
    if not _vjwpa6b4z60() then return end
    if _v7waz68vjhn.SpeedBoost then
        _vkhkeyt0oao.WalkSpeed = _v7waz68vjhn.WalkSpeed
    else
        _vkhkeyt0oao.WalkSpeed = 16
    end
end

local function _vb1z9ofns0r()
    _v7waz68vjhn.AutoFarm = false
    _v7waz68vjhn.AutoSell = false
    _v7waz68vjhn.AutoUpgrade = false
    _v7waz68vjhn.SmartLoop = false
    _v7waz68vjhn.ESPEnabled = false
    _v7waz68vjhn.FlyEnabled = false
    _v7waz68vjhn.Noclip = false
    _v7waz68vjhn.RapidMine = false
    _v7waz68vjhn.RemoteSpy = false
    _vg3ft1nprj0()
    _v6ljjlim2a7()
    _va469as3ox3()
    State.SmartLoopConn = nil
    _vjnercdb1pz()
    _vqulkb5gnc2()
    _vcjbsky4wca()
    _vzfgkygt8d4()
    _vgi705eg68c()
    _vjpa1gixp55()
    if State.InfiniteJumpConn then State.InfiniteJumpConn:Disconnect() State.InfiniteJumpConn = nil end
    if State.ClickTPConn then State.ClickTPConn:Disconnect() State.ClickTPConn = nil end
    if State.WarmthKeeperConn then State.WarmthKeeperConn:Disconnect() State.WarmthKeeperConn = nil end
    if State.DropCollectConn then State.DropCollectConn = nil end
    _vv6vvad4d9h(_S("92|172|157|170|165|159|150|124|157|200|200|124|194|193|189|208|209|206|193|207|124|207|208|203|204|204|193|192"))
end

local function _v1yqj5byw0q()
    if State.SmartLoopConn then return end
    _vv6vvad4d9h(_S("62|145|171|159|176|178|94|138|173|173|174|94|145|146|127|144|146|131|130|94|102|132|159|176|171|94|8656|94|145|163|170|170|94|8656|94|147|174|165|176|159|162|163|103"))
    State.SmartLoopConn = true
    task.spawn(function()
        while _v7waz68vjhn.SmartLoop and State.SmartLoopConn do
            if _vjwpa6b4z60() then
                _v4l7y64k05o()
                _v19dcvsp9hu(_v92gucjek3x)
                if _vg5aeo4t6xb() then
                    local shops = _vwi0vrnlz4s()
                    if #shops > 0 then
                        State.CurrentTarget = _S("77|160|178|185|185|182|187|180|123|123|123")
                        _vfklcf8eoiw(shops[1])
                        pcall(_vj7ry4jdtkk)
                        _vw5uvufjbnw()
                        _vdsr858u45u()
                    end
                else
                    local rocks = _v1y2wurcl0l()
                    if #rocks > 0 then
                        State.CurrentTarget = rocks[1].Name
                        _vf37ku9f4vl(rocks[1])
                    else
                        State.CurrentTarget = _S("123|206|224|220|237|222|227|228|233|226|169|169|169")
                        _vpphc2k00e4()
                    end
                end
                _vsz5u8329xb()
            end
            task.wait(_v7waz68vjhn.FarmDelay)
        end
    end)
end

local function _vjrd7o2l9jf()
    State.SmartLoopConn = nil
    _vv6vvad4d9h(_S("127|210|236|224|241|243|159|203|238|238|239|159|210|211|206|207|207|196|195"))
end

local function _vd33k9iz6j5(arg)
    local t = typeof(arg)
    if t == _S("72|145|182|187|188|169|182|171|173") then return arg:GetFullName()
    elseif t == _S("87|173|188|186|203|198|201|138") then return string.format(_S("74|160|175|173|190|185|188|125|114|111|120|123|176|118|111|120|123|176|118|111|120|123|176|115"), arg.X, arg.Y, arg.Z)
    elseif t == _S("115|182|185|229|212|224|216") then return _S("70|137|140|184|167|179|171")
    elseif t == _S("82|198|179|180|190|183") then return _S("113|229|210|211|221|214")
    else return tostring(arg) end
end

local function _vjx4rzwyfi1(remoteName, remoteType, args)
    local _v9uagk4mty3 = _S("117|")
    for i, a in ipairs(args) do
        _v9uagk4mty3 = _v9uagk4mty3 .. (i > 1 and _S("98|142|130") or _S("86|")) .. _vd33k9iz6j5(a)
    end
    local entry = os.date(_S("81|118|153|139|118|158|139|118|164")) .. _S("119|151|243|151") .. remoteType .. _S("70|102|194|102") .. remoteName .. _S("123|163") .. _v9uagk4mty3 .. _S("75|116")
    table.insert(State.RemoteSpyLogs, 1, entry)
    if #State.RemoteSpyLogs > 40 then table.remove(State.RemoteSpyLogs) end
    State.LastRemoteFire = entry
    if RemoteSpyList then
        pcall(function()
            _vdmb3sdada7(RemoteSpyList)
            for i, log in ipairs(State.RemoteSpyLogs) do
                if i > 20 then break end
                local lbl = Instance.new(_S("120|204|221|240|236|196|217|218|221|228"))
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

local function _vz6wlv6t48l()
    if not Exec.HasHookMeta then
        _vv6vvad4d9h(_S("60|142|161|169|171|176|161|92|143|172|181|92|177|170|157|178|157|165|168|157|158|168|161|92|171|170|92|176|164|165|175|92|161|180|161|159|177|176|171|174"))
        return
    end
    _vh72znc6c4p = true
    _vv6vvad4d9h(_S("99|181|200|208|210|215|200|131|182|211|220|131|168|177|164|165|175|168|167"))
end

local function _v4u1wr7tpmt()
    _vh72znc6c4p = false
    _v7waz68vjhn.RemoteSpy = false
    _vv6vvad4d9h(_S("113|195|214|222|224|229|214|145|196|225|234|145|181|186|196|178|179|189|182|181"))
end

local function _va9h0k3xui8()
    if _v7waz68vjhn.CustomRemoteName == _S("99|") then
        _vv6vvad4d9h(_S("110|179|220|226|211|224|142|207|142|224|211|219|221|226|211|142|220|207|219|211|142|212|215|224|225|226"))
        return
    end
    local args = {}
    if _v7waz68vjhn.CustomRemoteArgs ~= _S("67|") then
        for part in string.gmatch(_v7waz68vjhn.CustomRemoteArgs, _S("61|152|155|105|154|104")) do
            part = string.gsub(part, _S("88|182|125|203|130|128|134|133|129|125|203|130|124"), _S("97|134|146"))
            local num = tonumber(part)
            if num then
                table.insert(args, num)
            elseif part == _S("124|240|238|241|225") then
                table.insert(args, true)
            elseif part == _S("88|190|185|196|203|189") then
                table.insert(args, false)
            else
                table.insert(args, part)
            end
        end
    end
    if _vxjcv8bvu2o(_v7waz68vjhn.CustomRemoteName, Exec.Unpack(args)) then
        _vv6vvad4d9h(_S("119|189|224|233|220|219|151|220|239|216|218|235|177|151") .. _v7waz68vjhn.CustomRemoteName)
    else
        _vme4qihhqx7(_v7waz68vjhn.CustomRemoteName, Exec.Unpack(args))
        _vv6vvad4d9h(_S("78|148|183|192|179|178|110|190|175|194|194|179|192|188|136|110") .. _v7waz68vjhn.CustomRemoteName)
    end
end

local function _vkhvmp0vzuf()
    if State.InfiniteJumpConn then return end
    State.InfiniteJumpConn = _vnqiki4fvlv.JumpRequest:Connect(function()
        if _v7waz68vjhn.InfiniteJump and _vjwpa6b4z60() and _vkhkeyt0oao then
            _vkhkeyt0oao:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
    _vv6vvad4d9h(_S("67|140|177|169|172|177|172|183|168|99|141|184|176|179|99|136|145|132|133|143|136|135"))
end

local function _v9iyu3x3m2k()
    if State.InfiniteJumpConn then
        State.InfiniteJumpConn:Disconnect()
        State.InfiniteJumpConn = nil
    end
end

local function _voygtbe4zr9()
    if State.ClickTPConn then return end
    State.ClickTPConn = _vnqiki4fvlv.InputBegan:Connect(function(input, processed)
        if processed or not _v7waz68vjhn.ClickTeleport then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1 and _vnqiki4fvlv:IsKeyDown(Enum.KeyCode.LeftControl) then
            local cam = _v92gucjek3x.CurrentCamera
            if not cam then return end
            local ray = cam:ScreenPointToRay(input.Position.X, input.Position.Y)
            local _viy816kasxu = RaycastParams.new()
            if Character then _viy816kasxu.FilterDescendantsInstances = {Character} end
            local _vb263bzitde = pcall(function()
                _viy816kasxu.FilterType = Enum.RaycastFilterType.Exclude
            end)
            if not _vb263bzitde then
                _viy816kasxu.FilterType = Enum.RaycastFilterType.Blacklist
            end
            local hit = _v92gucjek3x:Raycast(ray.Origin, ray.Direction * 2000, _viy816kasxu)
            if hit then
                _vmax6nag1aa(hit.Position)
                _vv6vvad4d9h(_S("64|131|172|169|163|171|96|148|144|96|8658|96") .. math.floor(hit.Position.X) .. _S("91|135") .. math.floor(hit.Position.Y))
            end
        end
    end)
    _vv6vvad4d9h(_S("113|180|221|218|212|220|145|197|193|145|182|191|178|179|189|182|181|145|153|180|229|227|221|156|180|221|218|212|220|154"))
end

local function _vyqgv4evc1t()
    if State.ClickTPConn then
        State.ClickTPConn:Disconnect()
        State.ClickTPConn = nil
    end
end

local function _v5edf1wp9gy(name)
    if not _vjwpa6b4z60() then return end
    State.Waypoints[name] = _vqxyh6gcfta.Position
    _vv6vvad4d9h(_S("110|193|207|228|211|210|142|229|207|231|222|221|215|220|226|168|142") .. name)
end

local function _v3e5sqvvzg4(name)
    local pos = State.Waypoints[name]
    if pos then
        _vmax6nag1aa(pos)
        _vv6vvad4d9h(_S("90|174|170|122|209|187|211|202|201|195|200|206|148|122") .. name)
    else
        _vv6vvad4d9h(_S("86|173|183|207|198|197|191|196|202|118|196|197|202|118|188|197|203|196|186|144|118") .. name)
    end
end

local function _vzj5rgcjfn3()
    if State.AntiAFKConn then return end
    local vu = game:GetService(_S("61|147|166|175|177|178|158|169|146|176|162|175"))
    State.AntiAFKConn = _v9qqaid831c.Idled:Connect(function()
        if _v7waz68vjhn.AntiAFK then
            pcall(function() vu:CaptureController(); vu:ClickButton2(Vector2.new(0, 0)) end)
        end
    end)
    _vv6vvad4d9h(_S("120|185|230|236|225|165|185|190|195|152|189|198|185|186|196|189|188"))
end

local function _v8dxpvy8aqj()
    if State.AntiAFKConn then
        State.AntiAFKConn:Disconnect()
        State.AntiAFKConn = nil
    end
end

local function _vyknuy031k5()
    if State.WarmthKeeperConn then return end
    State.WarmthKeeperConn = _v9vp3q2syfb.Heartbeat:Connect(function()
        if not _v7waz68vjhn.WarmthKeeper and not _v7waz68vjhn.StaminaKeeper then return end
        if not _vjwpa6b4z60() then return end
        pcall(function()
            if _v7waz68vjhn.WarmthKeeper then
                for _, name in ipairs({_S("130|217|227|244|239|246|234"), _S("72|156|173|181|184|173|186|169|188|189|186|173"), _S("108|175|219|216|208"), _S("111|183|212|208|227"), _S("125|212|222|239|234")}) do
                    local v = Character:FindFirstChild(name) or _v9qqaid831c:FindFirstChild(name)
                    if v and v:IsA(_S("74|160|171|182|191|175|140|171|189|175")) then v.Value = 100 end
                end
                _vme4qihhqx7(_S("122|241|219|236|231|238|226")); _vme4qihhqx7(_S("84|188|185|181|200")); _vme4qihhqx7(_S("65|164|162|174|177|167|170|179|166"))
            end
            if _v7waz68vjhn.StaminaKeeper then
                for _, name in ipairs({_S("115|198|231|212|224|220|225|212"), _S("92|161|202|193|206|195|213"), _S("68|135|176|173|177|166"), _S("107|186|227|228|210|208|217"), _S("105|171|219|206|202|221|209")}) do
                    local v = Character:FindFirstChild(name) or _v9qqaid831c:FindFirstChild(name)
                    if v and v:IsA(_S("121|207|218|229|238|222|187|218|236|222")) then v.Value = 100 end
                end
            end
        end)
    end)
    _vv6vvad4d9h(_S("116|203|213|230|225|232|220|163|199|232|213|225|221|226|213|148|191|217|217|228|217|230|148|185|194|181|182|192|185|184"))
end

local function _vio6kma08xn()
    if State.WarmthKeeperConn then
        State.WarmthKeeperConn:Disconnect()
        State.WarmthKeeperConn = nil
    end
end

local function _vzfgkygt8d4()
    for _, obj in ipairs(State.TracerObjects) do
        pcall(function() obj:Destroy() end)
    end
    State.TracerObjects = {}
end

local function _vfyh1s9eesc()
    if not _v7waz68vjhn.Tracers then _vzfgkygt8d4() return end
    if not _vjwpa6b4z60() then return end
    _vzfgkygt8d4()
    local _vnkpsmjgb04 = {}
    for _, r in ipairs(_v1y2wurcl0l()) do
        if #_vnkpsmjgb04 >= 8 then break end
        table.insert(_vnkpsmjgb04, {Part = r.Part, Color = Color3.fromRGB(100, 200, 255)})
    end
    for _, s in ipairs(_vwi0vrnlz4s()) do
        if #_vnkpsmjgb04 >= 10 then break end
        table.insert(_vnkpsmjgb04, {Part = s.Part, Color = Color3.fromRGB(0, 255, 100)})
    end
    for _, t in ipairs(_vnkpsmjgb04) do
        local att0 = Instance.new(_S("106|171|222|222|203|205|210|215|207|216|222"))
        att0.Parent = _vqxyh6gcfta
        local att1 = Instance.new(_S("81|146|197|197|178|180|185|190|182|191|197"))
        att1.Parent = t.Part
        local beam = Instance.new(_S("93|159|194|190|202"))
        beam.Attachment0 = att0
        beam.Attachment1 = att1
        beam.Color = ColorSequence.new(t.Color)
        beam.Width0 = 0.15
        beam.Width1 = 0.15
        beam.FaceCamera = true
        beam.Parent = _vqxyh6gcfta
        table.insert(State.TracerObjects, att0)
        table.insert(State.TracerObjects, att1)
        table.insert(State.TracerObjects, beam)
    end
end

local function _vgi705eg68c()
    for _, obj in ipairs(State.PlayerESPObjects) do
        pcall(function() obj:Destroy() end)
    end
    State.PlayerESPObjects = {}
end

local function _vwnlqp7zj6f()
    if not _v7waz68vjhn.PlayerESP then _vgi705eg68c() return end
    _vgi705eg68c()
    for _, plr in ipairs(_vhttz78qdg8:GetPlayers()) do
        if plr ~= _v9qqaid831c and plr.Character then
            local hrp = plr.Character:FindFirstChild(_S("129|201|246|238|226|239|240|234|229|211|240|240|245|209|226|243|245"))
            if hrp then
                local hl = Instance.new(_S("102|174|207|205|206|210|207|205|206|218"))
                hl.FillTransparency = 0.7
                hl.OutlineColor = Color3.fromRGB(255, 80, 80)
                hl.FillColor = Color3.fromRGB(255, 50, 50)
                hl.Parent = plr.Character
                local bb = Instance.new(_S("66|132|171|174|174|164|177|163|180|166|137|183|171"))
                bb.Size = UDim2.new(0, 100, 0, 24)
                bb.StudsOffset = Vector3.new(0, 3, 0)
                bb.AlwaysOnTop = true
                bb.Parent = hrp
                local lbl = Instance.new(_S("106|190|207|226|222|182|203|204|207|214"))
                lbl.Size = UDim2.new(1, 0, 1, 0)
                lbl.BackgroundTransparency = 0.5
                lbl.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                lbl.Text = plr.Name .. _S("102|134|193") .. math.floor(_vbymtkx7r65(hrp)) .. _S("113|222|206")
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

local function _vjpa1gixp55()
    for _, obj in ipairs(State.ChestESPObjects) do
        pcall(function() obj:Destroy() end)
    end
    State.ChestESPObjects = {}
end

local function _v0cz2jcife5()
    if not _v7waz68vjhn.ChestESP then _vjpa1gixp55() return end
    _vjpa1gixp55()
    local _ves4lobcryw = {_S("115|214|219|216|230|231"), _S("112|211|226|209|228|213"), _S("127|228|245|228|237|243"), _S("64|167|169|166|180"), _S("102|214|216|203|217|203|212|218"), _S("108|224|222|209|205|223|225|222|209"), _S("79|193|180|198|176|193|179")}
    for _, d in ipairs(_v92gucjek3x:GetDescendants()) do
        if d:IsA(_S("91|168|202|191|192|199")) or d:IsA(_S("100|166|197|215|201|180|197|214|216")) then
            local nl = string.lower(d.Name)
            for _, p in ipairs(_ves4lobcryw) do
                if string.find(nl, p) then
                    local part = d:IsA(_S("110|176|207|225|211|190|207|224|226")) and d or d:FindFirstChildWhichIsA(_S("82|148|179|197|183|162|179|196|198"))
                    if part then
                        local hl = Instance.new(_S("105|177|210|208|209|213|210|208|209|221"))
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

local function _vwlliduxaxp()
    if State.FullbrightApplied then return end
    State.SavedLighting = {
        Brightness = _v5l01vpqxkc.Brightness,
        ClockTime = _v5l01vpqxkc.ClockTime,
        FogEnd = _v5l01vpqxkc.FogEnd,
        GlobalShadows = _v5l01vpqxkc.GlobalShadows,
        Ambient = _v5l01vpqxkc.Ambient,
        OutdoorAmbient = _v5l01vpqxkc.OutdoorAmbient,
    }
    _v5l01vpqxkc.Brightness = 2
    _v5l01vpqxkc.ClockTime = 14
    _v5l01vpqxkc.FogEnd = 100000
    _v5l01vpqxkc.GlobalShadows = false
    _v5l01vpqxkc.Ambient = Color3.fromRGB(180, 180, 180)
    _v5l01vpqxkc.OutdoorAmbient = Color3.fromRGB(180, 180, 180)
    State.FullbrightApplied = true
    _vv6vvad4d9h(_S("70|140|187|178|178|168|184|175|173|174|186|102|149|148"))
end

local function _vnp38yekj16()
    if not State.FullbrightApplied then return end
    for k, v in pairs(State.SavedLighting) do
        pcall(function() _v5l01vpqxkc[k] = v end)
    end
    State.FullbrightApplied = false
    _vv6vvad4d9h(_S("63|133|180|171|171|161|177|168|166|167|179|95|142|133|133"))
end

local function _vlijjol47uc()
    for _, plr in ipairs(_vhttz78qdg8:GetPlayers()) do
        if plr ~= _v9qqaid831c and plr.Character then
            for _, p in ipairs(plr.Character:GetDescendants()) do
                if p:IsA(_S("71|137|168|186|172|151|168|185|187")) then p.LocalTransparencyModifier = _v7waz68vjhn.HideOtherPlayers and 1 or 0 end
            end
        end
    end
end

local function _vuu45qgitw3()
    if not _v7waz68vjhn.FPSBooster then return end
    pcall(function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        for _, d in ipairs(_v92gucjek3x:GetDescendants()) do
            if d:IsA(_S("79|159|176|193|195|184|178|187|180|148|188|184|195|195|180|193")) or d:IsA(_S("88|172|202|185|193|196")) or d:IsA(_S("81|164|190|192|188|182")) or d:IsA(_S("96|166|201|210|197")) then
                d.Enabled = false
            end
        end
        _v5l01vpqxkc.GlobalShadows = false
    end)
    _vv6vvad4d9h(_S("104|174|184|187|136|170|215|215|219|220|205|218|136|201|216|216|212|209|205|204"))
end

local function _vhe532db45f()
    local t = {}
    for k, v in pairs(_v7waz68vjhn) do t[k] = v end
    return t
end

local function _vwyex5ywgqr(t)
    if type(t) ~= _S("67|183|164|165|175|168") then return false end
    for k, v in pairs(t) do
        if _v7waz68vjhn[k] ~= nil then _v7waz68vjhn[k] = v end
    end
    return true
end

local function _vf3t8kn2cud()
    local ok, json = pcall(function() return HttpService:JSONEncode(_vhe532db45f()) end)
    if not ok then _vv6vvad4d9h(_S("116|183|227|226|218|221|219|148|231|213|234|217|148|218|213|221|224|217|216")) return end
    if Exec.WriteFile(_S("93|170|198|203|194|190|170|204|210|203|209|190|198|203|188|160|204|203|195|198|196|139|199|208|204|203"), json) then
        _vv6vvad4d9h(_S("121|188|232|231|223|226|224|153|236|218|239|222|221|153|237|232|153|223|226|229|222"))
    elseif Exec.HasClipboard then
        Exec.SetClipboard(json)
        _vv6vvad4d9h(_S("115|182|226|225|217|220|218|147|214|226|227|220|216|215|147|231|226|147|214|223|220|227|213|226|212|229|215"))
    else
        _vv6vvad4d9h(_S("104|187|201|222|205|136|221|214|201|222|201|209|212|201|202|212|205|136|144|214|215|136|223|218|209|220|205|206|209|212|205|151|203|212|209|216|202|215|201|218|204|145"))
    end
end

local function _v0lkfk91e2o()
    local json = Exec.ReadFile(_S("90|167|195|200|191|187|167|201|207|200|206|187|195|200|185|157|201|200|192|195|193|136|196|205|201|200"))
    if json then
        local ok, data = pcall(function() return HttpService:JSONDecode(json) end)
        if ok and _vwyex5ywgqr(data) then
            _vv6vvad4d9h(_S("71|138|182|181|173|176|174|103|179|182|168|171|172|171|103|173|185|182|180|103|173|176|179|172"))
            return true
        end
    end
    _vv6vvad4d9h(_S("130|208|241|162|245|227|248|231|230|162|229|241|240|232|235|233|162|232|241|247|240|230"))
    return false
end

local function _v2m06cb8caz()
    _vv6vvad4d9h(_S("116|199|217|230|234|217|230|148|220|227|228|228|221|226|219|162|162|162"))
    pcall(function()
        local body = Exec.HttpGet(_S("61|165|177|177|173|176|119|108|108|164|158|170|162|176|107|175|172|159|169|172|181|107|160|172|170|108|179|110|108|164|158|170|162|176|108") .. game.PlaceId .. _S("76|123|191|177|190|194|177|190|191|123|156|193|174|184|181|175|139|191|187|190|192|155|190|176|177|190|137|141|191|175|114|184|181|185|181|192|137|125|124|124"))
        if not body then error(_S("112|184|228|228|224|183|213|228|144|214|209|217|220|213|212")) end
        local _v5cnqcmhrjg = HttpService:JSONDecode(body)
        if _v5cnqcmhrjg and _v5cnqcmhrjg.data then
            for _, srv in ipairs(_v5cnqcmhrjg.data) do
                if srv.id ~= game.JobId and srv.playing < srv.maxPlayers then
                    _v1vpimabutu:TeleportToPlaceInstance(game.PlaceId, srv.id, _v9qqaid831c)
                    return
                end
            end
        end
        _v1vpimabutu:Teleport(game.PlaceId, _v9qqaid831c)
    end)
end

local function _v8s0ld9io6n()
    if State.ServerHopConn then return end
    if _v7waz68vjhn.ServerHopInterval <= 0 then return end
    State.ServerHopConn = true
    task.spawn(function()
        while _v7waz68vjhn.ServerHopInterval > 0 and State.ServerHopConn do
            task.wait(_v7waz68vjhn.ServerHopInterval * 60)
            if _v7waz68vjhn.ServerHopInterval > 0 then _v2m06cb8caz() end
        end
    end)
end

local function _v1gykbuih0y()
    State.ServerHopConn = nil
end

local function _v0ngom9zhsp()
    if State.DropCollectConn then return end
    State.DropCollectConn = true
    task.spawn(function()
        while _v7waz68vjhn.AutoCollectDrops and State.DropCollectConn do
            _vpphc2k00e4()
            task.wait(1.5)
        end
    end)
end

local _verl1cyci2z = {}
local _vxyn8edivmk = false

local function _vwpuc45t3bj(data)
    if not _v7waz68vjhn.WebhookEnabled or _v7waz68vjhn.WebhookURL == _S("77|") then return end
    pcall(function()
        local body = HttpService:JSONEncode(data)
        Exec.Post(_v7waz68vjhn.WebhookURL, body)
    end)
end

local function _vvcghtq480v(itemName)
    if not _v7waz68vjhn.WebhookFarm then return end
    _vwpuc45t3bj({
        content = _S("109|151|151|200|186|214|219|210|206|141|186|220|226|219|225|206|214|219|202|151|151|141|186|214|219|210|209|167|141") .. itemName .. _S("116|148|240|148|200|227|232|213|224|174|148") .. State.FarmCount,
    })
end

local function _vj7ry4jdtkk()
    if not _v7waz68vjhn.WebhookSell then return end
    _vwpuc45t3bj({
        content = _S("92|134|134|183|169|197|202|193|189|124|169|203|209|202|208|189|197|202|185|134|134|124|175|203|200|192|124|197|208|193|201|207|124|216|124|176|203|208|189|200|124|207|193|200|200|207|150|124") .. State.SellCount,
    })
end

local function _vzdu6ihz2jk()
    if not _v7waz68vjhn.WebhookStats then return end
    _vwpuc45t3bj({
        content = _S("77|119|119|168|154|182|187|178|174|109|154|188|194|187|193|174|182|187|109|160|193|174|193|192|170|119|119|109|154|182|187|178|177|135|109") .. State.FarmCount .. _S("122|154|246|154|205|223|230|230|237|180|154") .. State.SellCount .. _S("110|142|234|142|178|227|222|211|225|168|142") .. State.DupeCount .. _S("62|94|186|94|146|159|176|165|163|178|120|94") .. State.CurrentTarget,
    })
end

local Theme = {
    Bg = Color3.fromRGB(15, 15, 17),
    Panel = Color3.fromRGB(22, 22, 26),
    _v5n8u6uij7w = Color3.fromRGB(12, 12, 14),
    Input = Color3.fromRGB(30, 30, 34),
    Accent = Color3.fromRGB(0, 235, 120),
    AccentDark = Color3.fromRGB(0, 170, 88),
    Text = Color3.fromRGB(248, 248, 250),
    SubText = Color3.fromRGB(125, 125, 132),
    Muted = Color3.fromRGB(75, 75, 82),
}

local _v63jbp5gyvx = Instance.new(_S("102|185|201|216|203|203|212|173|219|207"))
_v63jbp5gyvx.Name = _S("93|170|198|203|194|190|170|204|210|203|209|190|198|203|179|148")
_v63jbp5gyvx.ResetOnSpawn = false
_v63jbp5gyvx.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_v63jbp5gyvx.IgnoreGuiInset = true

Exec.ProtectGui(_v63jbp5gyvx)
pcall(function() _v63jbp5gyvx.Parent = Exec.GetGuiParent() end)
if not _v63jbp5gyvx.Parent then
    pcall(function() _v63jbp5gyvx.Parent = _v9qqaid831c:WaitForChild(_S("119|199|227|216|240|220|233|190|236|224")) end)
end

local _vhr6gh6h8s0 = _v92gucjek3x.CurrentCamera or _v92gucjek3x:WaitForChild(_S("93|160|190|202|194|207|190"), 10)
local _v45biysu9ko = _vhr6gh6h8s0 and _vhr6gh6h8s0.ViewportSize or Vector2.new(1920, 1080)
local _vgle8yoef1q = _v45biysu9ko.X < 800
local _v9edvrg50xl = _vgle8yoef1q and 130 or 175
local _vwwfao1t8dm = _vgle8yoef1q and UDim2.new(0, 340, 0, 420) or UDim2.new(0, 700, 0, 440)
local _vee2umr3ro9 = UDim2.new(0, 160, 0, 40)
local _v9gz4xmf9bh = UDim2.new(0.5, _vgle8yoef1q and -170 or -350, 0.5, _vgle8yoef1q and -210 or -220)
local _v9a482le31k = _v9gz4xmf9bh

local _vw5uhdt5rf2 = Instance.new(_S("111|181|225|208|220|212"))
_vw5uhdt5rf2.Name = _S("115|192|212|220|225|185|229|212|224|216")
_vw5uhdt5rf2.Size = _vwwfao1t8dm
_vw5uhdt5rf2.Position = _v9gz4xmf9bh
_vw5uhdt5rf2.BackgroundColor3 = Theme.Bg
_vw5uhdt5rf2.BackgroundTransparency = 0.05
_vw5uhdt5rf2.BorderSizePixel = 0
_vw5uhdt5rf2.ClipsDescendants = true
_vw5uhdt5rf2.Parent = _v63jbp5gyvx

local _v15ulpemfhz = Instance.new(_S("117|202|190|184|228|231|227|218|231"))
_v15ulpemfhz.CornerRadius = UDim.new(0, 12)
_v15ulpemfhz.Parent = _vw5uhdt5rf2

local _vd6lgjm09gm = Instance.new(_S("101|186|174|184|217|215|212|208|202"))
_vd6lgjm09gm.Color = Theme.Accent
_vd6lgjm09gm.Thickness = 1
_vd6lgjm09gm.Transparency = 0.65
_vd6lgjm09gm.Parent = _vw5uhdt5rf2

local _v37qpihrw43 = Instance.new(_S("101|171|215|198|210|202"))
_v37qpihrw43.Name = _S("108|180|209|205|208|209|222")
_v37qpihrw43.Size = UDim2.new(1, 0, 0, 54)
_v37qpihrw43.BackgroundColor3 = Theme.Sidebar
_v37qpihrw43.BorderSizePixel = 0
_v37qpihrw43.ZIndex = 5
_v37qpihrw43.Parent = _vw5uhdt5rf2

local _v7mxbpu5dzp = Instance.new(_S("69|139|183|166|178|170"))
_v7mxbpu5dzp.Size = UDim2.new(1, 0, 0, 1)
_v7mxbpu5dzp.Position = UDim2.new(0, 0, 1, -1)
_v7mxbpu5dzp.BackgroundColor3 = Theme.Accent
_v7mxbpu5dzp.BackgroundTransparency = 0.5
_v7mxbpu5dzp.BorderSizePixel = 0
_v7mxbpu5dzp.ZIndex = 6
_v7mxbpu5dzp.Parent = _v37qpihrw43

local _vwr5gc4zz8d = Instance.new(_S("63|147|164|183|179|139|160|161|164|171"))
_vwr5gc4zz8d.Size = UDim2.new(0, 36, 0, 36)
_vwr5gc4zz8d.Position = UDim2.new(0, 14, 0.5, -18)
_vwr5gc4zz8d.BackgroundColor3 = Theme.Accent
_vwr5gc4zz8d.Text = _S("111|188")
_vwr5gc4zz8d.TextColor3 = Color3.fromRGB(10, 10, 12)
_vwr5gc4zz8d.Font = Enum.Font.GothamBlack
_vwr5gc4zz8d.TextSize = 22
_vwr5gc4zz8d.ZIndex = 6
_vwr5gc4zz8d.Parent = _v37qpihrw43
local logoC = Instance.new(_S("125|210|198|192|236|239|235|226|239"))
logoC.CornerRadius = UDim.new(0, 8)
logoC.Parent = _vwr5gc4zz8d

local _vq6z7irognd = Instance.new(_S("115|199|216|235|231|191|212|213|216|223"))
_vq6z7irognd.Size = UDim2.new(0, 100, 0, 14)
_vq6z7irognd.Position = UDim2.new(0, 56, 0, 12)
_vq6z7irognd.BackgroundTransparency = 1
_vq6z7irognd.Text = _S("129|206|202|207|230|226|161|198|197|202|213|202|208|207")
_vq6z7irognd.TextColor3 = Theme.Accent
_vq6z7irognd.Font = Enum.Font.GothamBold
_vq6z7irognd.TextSize = 10
_vq6z7irognd.TextXAlignment = Enum.TextXAlignment.Left
_vq6z7irognd.ZIndex = 6
_vq6z7irognd.Parent = _v37qpihrw43

local _vc29xemk97d = Instance.new(_S("105|189|206|225|221|181|202|203|206|213"))
_vc29xemk97d.Size = UDim2.new(0.55, 0, 0, 22)
_vc29xemk97d.Position = UDim2.new(0.28, 0, 0, 10)
_vc29xemk97d.BackgroundTransparency = 1
_vc29xemk97d.Text = _S("67|144|172|177|168|164|99|139|184|165|99|158|99|185|122|99|160")
_vc29xemk97d.TextColor3 = Theme.Text
_vc29xemk97d.Font = Enum.Font.GothamBold
_vc29xemk97d.TextSize = _vgle8yoef1q and 14 or 17
_vc29xemk97d.TextXAlignment = Enum.TextXAlignment.Left
_vc29xemk97d.ZIndex = 6
_vc29xemk97d.Parent = _v37qpihrw43

local _v3aa1a1wwb3 = Instance.new(_S("90|174|191|210|206|166|187|188|191|198"))
_v3aa1a1wwb3.Size = UDim2.new(0.55, 0, 0, 16)
_v3aa1a1wwb3.Position = UDim2.new(0.28, 0, 0, 32)
_v3aa1a1wwb3.BackgroundTransparency = 1
_v3aa1a1wwb3.Text = _S("69|146|174|179|170|101|166|101|146|180|186|179|185|166|174|179|101|252|101") .. os.date(_S("80|117|145|124|112|117|146|112|117|180|112|117|169"))
_v3aa1a1wwb3.TextColor3 = Theme.SubText
_v3aa1a1wwb3.Font = Enum.Font.Gotham
_v3aa1a1wwb3.TextSize = 10
_v3aa1a1wwb3.TextXAlignment = Enum.TextXAlignment.Left
_v3aa1a1wwb3.ZIndex = 6
_v3aa1a1wwb3.Parent = _v37qpihrw43

local _vsim8nr64dk = Instance.new(_S("93|177|194|213|209|159|210|209|209|204|203"))
_vsim8nr64dk.Size = UDim2.new(0, 32, 0, 32)
_vsim8nr64dk.Position = UDim2.new(1, -42, 0.5, -16)
_vsim8nr64dk.BackgroundTransparency = 1
_vsim8nr64dk.Text = _S("81|10086")
_vsim8nr64dk.TextColor3 = Theme.SubText
_vsim8nr64dk.Font = Enum.Font.GothamBold
_vsim8nr64dk.TextSize = 16
_vsim8nr64dk.ZIndex = 6
_vsim8nr64dk.Parent = _v37qpihrw43
_vsim8nr64dk.MouseButton1Click:Connect(function()
    _v63jbp5gyvx.Enabled = false
    State.GUIHidden = true
end)

local _vz9lnqvrntq = Instance.new(_S("68|152|169|188|184|134|185|184|184|179|178"))
_vz9lnqvrntq.Size = UDim2.new(0, 32, 0, 32)
_vz9lnqvrntq.Position = UDim2.new(1, -78, 0.5, -16)
_vz9lnqvrntq.BackgroundTransparency = 1
_vz9lnqvrntq.Text = _S("71|8283")
_vz9lnqvrntq.TextColor3 = Theme.SubText
_vz9lnqvrntq.Font = Enum.Font.GothamBold
_vz9lnqvrntq.TextSize = 18
_vz9lnqvrntq.ZIndex = 6
_vz9lnqvrntq.Parent = _v37qpihrw43

local _veotsgdmeuc = _vz9lnqvrntq

local _v5n8u6uij7w = Instance.new(_S("93|163|207|190|202|194"))
_v5n8u6uij7w.Name = _S("106|189|211|206|207|204|203|220")
_v5n8u6uij7w.Size = UDim2.new(0, _v9edvrg50xl, 1, -54)
_v5n8u6uij7w.Position = UDim2.new(0, 0, 0, 54)
_v5n8u6uij7w.BackgroundColor3 = Theme.Sidebar
_v5n8u6uij7w.BorderSizePixel = 0
_v5n8u6uij7w.ZIndex = 2
_v5n8u6uij7w.Parent = _vw5uhdt5rf2

local _v34iehsuane = Instance.new(_S("110|180|224|207|219|211"))
_v34iehsuane.Size = UDim2.new(0, 1, 1, 0)
_v34iehsuane.Position = UDim2.new(1, -1, 0, 0)
_v34iehsuane.BackgroundColor3 = Theme.Accent
_v34iehsuane.BackgroundTransparency = 0.7
_v34iehsuane.BorderSizePixel = 0
_v34iehsuane.Parent = _v5n8u6uij7w

local _vmapy982gog = Instance.new(_S("124|194|238|221|233|225"))
_vmapy982gog.Size = UDim2.new(1, 0, 1, -8)
_vmapy982gog.Position = UDim2.new(0, 0, 0, 4)
_vmapy982gog.BackgroundTransparency = 1
_vmapy982gog.Parent = _v5n8u6uij7w

local _v1to1wrmx4m = Instance.new(_S("72|157|145|148|177|187|188|148|169|193|183|189|188"))
_v1to1wrmx4m.SortOrder = Enum.SortOrder.LayoutOrder
_v1to1wrmx4m.Padding = UDim.new(0, 4)
_v1to1wrmx4m.Parent = _vmapy982gog

local _ve3dnga961i = Instance.new(_S("63|148|136|143|160|163|163|168|173|166"))
_ve3dnga961i.PaddingTop = UDim.new(0, 6)
_ve3dnga961i.PaddingLeft = UDim.new(0, 6)
_ve3dnga961i.PaddingRight = UDim.new(0, 6)
_ve3dnga961i.Parent = _vmapy982gog

local _ven1ll52zg1 = Instance.new(_S("129|199|243|226|238|230"))
_ven1ll52zg1.Size = UDim2.new(1, -_v9edvrg50xl - 16, 0, 36)
_ven1ll52zg1.Position = UDim2.new(0, _v9edvrg50xl + 8, 0, 62)
_ven1ll52zg1.BackgroundTransparency = 1
_ven1ll52zg1.Parent = _vw5uhdt5rf2

local _v6av4al7oa2 = Instance.new(_S("87|171|188|207|203|163|184|185|188|195"))
_v6av4al7oa2.Size = UDim2.new(1, 0, 1, 0)
_v6av4al7oa2.BackgroundTransparency = 1
_v6av4al7oa2.Text = _S("100|171|201|210|201|214|197|208")
_v6av4al7oa2.TextColor3 = Theme.Text
_v6av4al7oa2.Font = Enum.Font.GothamBold
_v6av4al7oa2.TextSize = 15
_v6av4al7oa2.TextXAlignment = Enum.TextXAlignment.Left
_v6av4al7oa2.Parent = _ven1ll52zg1

local _vcl1nazmotj = Instance.new(_S("92|162|206|189|201|193"))
_vcl1nazmotj.Name = _S("111|178|222|221|227|212|221|227|176|225|212|208")
_vcl1nazmotj.Size = UDim2.new(1, -_v9edvrg50xl - 16, 1, -108)
_vcl1nazmotj.Position = UDim2.new(0, _v9edvrg50xl + 8, 0, 98)
_vcl1nazmotj.BackgroundTransparency = 1
_vcl1nazmotj.ClipsDescendants = true
_vcl1nazmotj.Parent = _vw5uhdt5rf2

local Tabs = {_S("125|195|222|239|234"), _S("96|179|197|204|204"), _S("101|170|184|181"), _S("63|132|183|175|171|174|168|179"), _S("102|186|213|213|210|217"), _S("127|204|232|242|226")}
local _vhw2b6jg8if = {
    Farm = {Icon = _S("107|9988"), Title = _S("72|143|173|182|173|186|169|180"), Sub = _S("77|142|194|193|188|109|186|182|187|178|109|115|109|179|174|191|186")},
    Sell = {Icon = _S("64|9953"), Title = _S("65|130|182|181|176|174|162|181|170|164"), Sub = _S("98|181|199|206|206|130|136|130|215|210|201|212|195|198|199|213")},
    ESP = {Icon = _S("82|128147"), Title = _S("111|197|216|226|228|208|219|226"), Sub = _S("112|181|195|192|144|150|144|228|226|209|211|213|226|227")},
    Exploit = {Icon = _S("80|127997"), Title = _S("78|147|198|190|186|189|183|194|193"), Sub = _S("66|143|177|184|167|175|167|176|182|98|104|98|166|183|178|167|181")},
    Tools = {Icon = _S("115|128410"), Title = _S("104|188|215|215|212|219"), Sub = _S("114|197|226|235|146|152|146|233|211|235|226|225|219|224|230|229")},
    Misc = {Icon = _S("63|9944"), Title = _S("107|190|208|223|223|212|217|210|222"), Sub = _S("60|127|171|170|162|165|163|92|98|92|169|165|175|159")},
}
local _veegirac8r7 = {}
local _vrbcwulrfru = {}
local _v1zbmpbrx3u = {}

for i, tabName in ipairs(Tabs) do
    local info = _vhw2b6jg8if[tabName]
    local _v7ejhz8jgmt = Instance.new(_S("61|145|162|181|177|127|178|177|177|172|171"))
    _v7ejhz8jgmt.Name = tabName .. _S("86|170|183|184")
    _v7ejhz8jgmt.Size = UDim2.new(1, 0, 0, _vgle8yoef1q and 44 or 52)
    _v7ejhz8jgmt.BackgroundColor3 = Theme.Panel
    _v7ejhz8jgmt.BackgroundTransparency = tabName == _S("102|172|199|216|211") and 0 or 0.35
    _v7ejhz8jgmt.BorderSizePixel = 0
    _v7ejhz8jgmt.Text = _S("85|")
    _v7ejhz8jgmt.AutoButtonColor = false
    _v7ejhz8jgmt.LayoutOrder = i
    _v7ejhz8jgmt.Parent = _vmapy982gog

    local _vjsdh4h27q9 = Instance.new(_S("79|164|152|146|190|193|189|180|193"))
    _vjsdh4h27q9.CornerRadius = UDim.new(0, 8)
    _vjsdh4h27q9.Parent = _v7ejhz8jgmt

    local icon = Instance.new(_S("70|154|171|190|186|146|167|168|171|178"))
    icon.Size = UDim2.new(0, 28, 0, 28)
    icon.Position = UDim2.new(0, 8, 0.5, -14)
    icon.BackgroundTransparency = 1
    icon.Text = info.Icon
    icon.TextColor3 = Theme.Accent
    icon.TextSize = 16
    icon.Font = Enum.Font.GothamBold
    icon.Parent = _v7ejhz8jgmt

    local _vlrih9bd06z = Instance.new(_S("129|213|230|249|245|205|226|227|230|237"))
    _vlrih9bd06z.Size = UDim2.new(1, -44, 0, 18)
    _vlrih9bd06z.Position = UDim2.new(0, 38, 0, _vgle8yoef1q and 6 or 8)
    _vlrih9bd06z.BackgroundTransparency = 1
    _vlrih9bd06z.Text = info.Title
    _vlrih9bd06z.TextColor3 = Theme.Text
    _vlrih9bd06z.Font = Enum.Font.GothamBold
    _vlrih9bd06z.TextSize = _vgle8yoef1q and 10 or 12
    _vlrih9bd06z.TextXAlignment = Enum.TextXAlignment.Left
    _vlrih9bd06z.Parent = _v7ejhz8jgmt

    local tSub = Instance.new(_S("114|198|215|234|230|190|211|212|215|222"))
    tSub.Size = UDim2.new(1, -44, 0, 14)
    tSub.Position = UDim2.new(0, 38, 0, _vgle8yoef1q and 24 or 28)
    tSub.BackgroundTransparency = 1
    tSub.Text = info.Sub
    tSub.TextColor3 = Theme.SubText
    tSub.Font = Enum.Font.Gotham
    tSub.TextSize = 9
    tSub.TextXAlignment = Enum.TextXAlignment.Left
    tSub.Parent = _v7ejhz8jgmt

    local _v4yryx7ctqh = Instance.new(_S("124|194|238|221|233|225"))
    _v4yryx7ctqh.Size = UDim2.new(0, 3, 0.7, 0)
    _v4yryx7ctqh.Position = UDim2.new(1, -4, 0.15, 0)
    _v4yryx7ctqh.BackgroundColor3 = Theme.Accent
    _v4yryx7ctqh.BorderSizePixel = 0
    _v4yryx7ctqh.Visible = (tabName == _S("87|157|184|201|196"))
    _v4yryx7ctqh.Parent = _v7ejhz8jgmt
    local iC = Instance.new(_S("79|164|152|146|190|193|189|180|193"))
    iC.CornerRadius = UDim.new(1, 0)
    iC.Parent = _v4yryx7ctqh

    _veegirac8r7[tabName] = _v7ejhz8jgmt
    _v1zbmpbrx3u[tabName] = _v4yryx7ctqh

    local _vt7osl30v02 = Instance.new(_S("114|197|213|228|225|222|222|219|224|217|184|228|211|223|215"))
    _vt7osl30v02.Name = tabName .. _S("84|151|195|194|200|185|194|200")
    _vt7osl30v02.Size = UDim2.new(1, 0, 1, 0)
    _vt7osl30v02.BackgroundTransparency = 1
    _vt7osl30v02.BorderSizePixel = 0
    _vt7osl30v02.ScrollBarThickness = 3
    _vt7osl30v02.ScrollBarImageColor3 = Theme.Accent
    _vt7osl30v02.CanvasSize = UDim2.new(0, 0, 0, 0)
    _vt7osl30v02.AutomaticCanvasSize = Enum.AutomaticSize.Y
    _vt7osl30v02.Visible = (tabName == _S("89|159|186|203|198"))
    _vt7osl30v02.Parent = _vcl1nazmotj

    local _vkelwshjc9m = Instance.new(_S("73|158|146|149|178|188|189|149|170|194|184|190|189"))
    _vkelwshjc9m.SortOrder = Enum.SortOrder.LayoutOrder
    _vkelwshjc9m.Padding = UDim.new(0, 6)
    _vkelwshjc9m.Parent = _vt7osl30v02

    local _vtyirahfyca = Instance.new(_S("82|167|155|162|179|182|182|187|192|185"))
    _vtyirahfyca.PaddingTop = UDim.new(0, 4)
    _vtyirahfyca.PaddingBottom = UDim.new(0, 8)
    _vtyirahfyca.PaddingLeft = UDim.new(0, 2)
    _vtyirahfyca.PaddingRight = UDim.new(0, 6)
    _vtyirahfyca.Parent = _vt7osl30v02

    _vrbcwulrfru[tabName] = _vt7osl30v02
end

local function _vnkycx3xa95(tabName)
    State.TabOpen = tabName
    local info = _vhw2b6jg8if[tabName]
    if info then _v6av4al7oa2.Text = info.Title end
    for name, frame in pairs(_vrbcwulrfru) do
        frame.Visible = (name == tabName)
    end
    for name, btn in pairs(_veegirac8r7) do
        btn.BackgroundTransparency = (name == tabName) and 0 or 0.35
        if _v1zbmpbrx3u[name] then
            _v1zbmpbrx3u[name].Visible = (name == tabName)
        end
    end
end

for tabName, btn in pairs(_veegirac8r7) do
    btn.MouseButton1Click:Connect(function()
        _vnkycx3xa95(tabName)
    end)
end

local _v1hazk9pc0f = Instance.new(_S("101|171|215|198|210|202"))
_v1hazk9pc0f.Size = _vee2umr3ro9
_v1hazk9pc0f.Position = _v9a482le31k
_v1hazk9pc0f.BackgroundColor3 = Theme.Bg
_v1hazk9pc0f.BorderSizePixel = 0
_v1hazk9pc0f.Visible = false
_v1hazk9pc0f.Parent = _v63jbp5gyvx
local miniC = Instance.new(_S("92|177|165|159|203|206|202|193|206"))
miniC.CornerRadius = UDim.new(0, 10)
miniC.Parent = _v1hazk9pc0f
local miniS = Instance.new(_S("105|190|178|188|221|219|216|212|206"))
miniS.Color = Theme.Accent
miniS.Thickness = 1
miniS.Transparency = 0.5
miniS.Parent = _v1hazk9pc0f

local _vwoycwkldub = Instance.new(_S("85|169|186|205|201|161|182|183|186|193"))
_vwoycwkldub.Size = UDim2.new(0.65, 0, 1, 0)
_vwoycwkldub.Position = UDim2.new(0.08, 0, 0, 0)
_vwoycwkldub.BackgroundTransparency = 1
_vwoycwkldub.Text = _S("126|10061|158|203|231|236|227|223|158|198|243|224")
_vwoycwkldub.TextColor3 = Theme.Accent
_vwoycwkldub.Font = Enum.Font.GothamBold
_vwoycwkldub.TextSize = 12
_vwoycwkldub.TextXAlignment = Enum.TextXAlignment.Left
_vwoycwkldub.Parent = _v1hazk9pc0f

local _vx49tv4cbul = Instance.new(_S("65|149|166|185|181|131|182|181|181|176|175"))
_vx49tv4cbul.Size = UDim2.new(0, 36, 0, 26)
_vx49tv4cbul.Position = UDim2.new(1, -42, 0.5, -13)
_vx49tv4cbul.BackgroundColor3 = Theme.Accent
_vx49tv4cbul.Text = _S("125|9758")
_vx49tv4cbul.TextColor3 = Color3.fromRGB(10, 10, 12)
_vx49tv4cbul.Font = Enum.Font.GothamBold
_vx49tv4cbul.TextSize = 14
_vx49tv4cbul.Parent = _v1hazk9pc0f
local expC = Instance.new(_S("101|186|174|168|212|215|211|202|215"))
expC.CornerRadius = UDim.new(0, 6)
expC.Parent = _vx49tv4cbul

local _vzqzu0pk5no = 0

local function _vem71kuorez(parent, title)
    _vzqzu0pk5no = _vzqzu0pk5no + 1
    local wrap = Instance.new(_S("115|185|229|212|224|216"))
    wrap.Size = UDim2.new(1, 0, 0, 32)
    wrap.BackgroundTransparency = 1
    wrap.LayoutOrder = _vzqzu0pk5no
    wrap.Parent = parent

    local line = Instance.new(_S("110|180|224|207|219|211"))
    line.Size = UDim2.new(1, 0, 0, 1)
    line.Position = UDim2.new(0, 0, 0, 0)
    line.BackgroundColor3 = Theme.Accent
    line.BackgroundTransparency = 0.35
    line.BorderSizePixel = 0
    line.Parent = wrap

    local _v7mtusf3cmo = Instance.new(_S("123|207|224|243|239|199|220|221|224|231"))
    _v7mtusf3cmo.Size = UDim2.new(0, 18, 0, 18)
    _v7mtusf3cmo.Position = UDim2.new(0, 0, 0, 8)
    _v7mtusf3cmo.BackgroundTransparency = 1
    _v7mtusf3cmo.Text = _S("117|128390")
    _v7mtusf3cmo.TextSize = 12
    _v7mtusf3cmo.Parent = wrap

    local label = Instance.new(_S("130|214|231|250|246|206|227|228|231|238"))
    label.Size = UDim2.new(1, -24, 0, 20)
    label.Position = UDim2.new(0, 22, 0, 8)
    label.BackgroundTransparency = 1
    label.Text = title
    label.TextColor3 = Theme.Text
    label.Font = Enum.Font.GothamBold
    label.TextSize = _vgle8yoef1q and 11 or 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = wrap
    return wrap
end

local function _vj8fij4gt5t(parent, name, default, callback)
    _vzqzu0pk5no = _vzqzu0pk5no + 1
    local frame = Instance.new(_S("89|159|203|186|198|190"))
    frame.Size = UDim2.new(1, 0, 0, 36)
    frame.BackgroundColor3 = Theme.Panel
    frame.BackgroundTransparency = 0.15
    frame.BorderSizePixel = 0
    frame.LayoutOrder = _vzqzu0pk5no
    frame.Parent = parent

    local _vsr6fg33r69 = Instance.new(_S("119|204|192|186|230|233|229|220|233"))
    _vsr6fg33r69.CornerRadius = UDim.new(0, 8)
    _vsr6fg33r69.Parent = frame

    local _v8imqiz25wt = Instance.new(_S("67|152|140|150|183|181|178|174|168"))
    _v8imqiz25wt.Color = Theme.Accent
    _v8imqiz25wt.Thickness = 1
    _v8imqiz25wt.Transparency = 0.85
    _v8imqiz25wt.Parent = frame

    local label = Instance.new(_S("111|195|212|231|227|187|208|209|212|219"))
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.Text
    label.Font = Enum.Font.Gotham
    label.TextSize = _vgle8yoef1q and 11 or 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local check = Instance.new(_S("84|168|185|204|200|150|201|200|200|195|194"))
    check.Size = UDim2.new(0, 20, 0, 20)
    check.Position = UDim2.new(1, -30, 0.5, -10)
    check.BackgroundColor3 = default and Theme.Accent or Theme.Input
    check.BorderSizePixel = 0
    check.Text = default and _S("126|10129") or _S("129|")
    check.TextColor3 = Color3.fromRGB(10, 10, 12)
    check.Font = Enum.Font.GothamBold
    check.TextSize = 14
    check.Parent = frame
    local cC = Instance.new(_S("70|155|143|137|181|184|180|171|184"))
    cC.CornerRadius = UDim.new(0, 4)
    cC.Parent = check

    local _v2cf4uf95au = default
    check.MouseButton1Click:Connect(function()
        _v2cf4uf95au = not _v2cf4uf95au
        check.BackgroundColor3 = _v2cf4uf95au and Theme.Accent or Theme.Input
        check.Text = _v2cf4uf95au and _S("72|10075") or _S("83|")
        callback(_v2cf4uf95au)
    end)
    return frame, check
end

local function _vnblxjh1qhs(parent, name, _, callback)
    _vzqzu0pk5no = _vzqzu0pk5no + 1
    local btn = Instance.new(_S("92|176|193|212|208|158|209|208|208|203|202"))
    btn.Size = UDim2.new(1, 0, 0, 34)
    btn.BackgroundColor3 = Theme.Panel
    btn.BackgroundTransparency = 0.1
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.TextColor3 = Theme.Text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = _vgle8yoef1q and 11 or 12
    btn.LayoutOrder = _vzqzu0pk5no
    btn.AutoButtonColor = false
    btn.Parent = parent

    local _vsr6fg33r69 = Instance.new(_S("92|177|165|159|203|206|202|193|206"))
    _vsr6fg33r69.CornerRadius = UDim.new(0, 8)
    _vsr6fg33r69.Parent = btn

    local _v8imqiz25wt = Instance.new(_S("93|178|166|176|209|207|204|200|194"))
    _v8imqiz25wt.Color = Theme.Accent
    _v8imqiz25wt.Thickness = 1
    _v8imqiz25wt.Transparency = 0.55
    _v8imqiz25wt.Parent = btn

    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Theme.Input
        _v8imqiz25wt.Transparency = 0.2
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Theme.Panel
        btn.BackgroundTransparency = 0.1
        _v8imqiz25wt.Transparency = 0.55
    end)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

local function _vjx3w9kzjl8(parent, name, minVal, maxVal, defaultVal, callback)
    _vzqzu0pk5no = _vzqzu0pk5no + 1
    local frame = Instance.new(_S("108|178|222|205|217|209"))
    frame.Size = UDim2.new(1, 0, 0, 48)
    frame.BackgroundColor3 = Theme.Panel
    frame.BackgroundTransparency = 0.15
    frame.BorderSizePixel = 0
    frame.LayoutOrder = _vzqzu0pk5no
    frame.Parent = parent

    local _vsr6fg33r69 = Instance.new(_S("119|204|192|186|230|233|229|220|233"))
    _vsr6fg33r69.CornerRadius = UDim.new(0, 8)
    _vsr6fg33r69.Parent = frame

    local label = Instance.new(_S("74|158|175|194|190|150|171|172|175|182"))
    label.Size = UDim2.new(0.7, 0, 0, 18)
    label.Position = UDim2.new(0, 12, 0, 6)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.SubText
    label.Font = Enum.Font.Gotham
    label.TextSize = _vgle8yoef1q and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local _v52gkckjilb = Instance.new(_S("125|209|226|245|241|201|222|223|226|233"))
    _v52gkckjilb.Size = UDim2.new(0, 50, 0, 18)
    _v52gkckjilb.Position = UDim2.new(1, -58, 0, 6)
    _v52gkckjilb.BackgroundTransparency = 1
    _v52gkckjilb.Text = tostring(defaultVal)
    _v52gkckjilb.TextColor3 = Theme.Accent
    _v52gkckjilb.Font = Enum.Font.GothamBold
    _v52gkckjilb.TextSize = 11
    _v52gkckjilb.TextXAlignment = Enum.TextXAlignment.Right
    _v52gkckjilb.Parent = frame

    local _v0dur5vvlx5 = Instance.new(_S("130|200|244|227|239|231"))
    _v0dur5vvlx5.Size = UDim2.new(1, -24, 0, 8)
    _v0dur5vvlx5.Position = UDim2.new(0, 12, 0, 30)
    _v0dur5vvlx5.BackgroundColor3 = Theme.Input
    _v0dur5vvlx5.BorderSizePixel = 0
    _v0dur5vvlx5.Parent = frame

    local _vdh1rkfzg2j = Instance.new(_S("88|173|161|155|199|202|198|189|202"))
    _vdh1rkfzg2j.CornerRadius = UDim.new(1, 0)
    _vdh1rkfzg2j.Parent = _v0dur5vvlx5

    local pct = (defaultVal - minVal) / (maxVal - minVal)
    local _v4nep7hp53m = Instance.new(_S("96|166|210|193|205|197"))
    _v4nep7hp53m.Size = UDim2.new(pct, 0, 1, 0)
    _v4nep7hp53m.BackgroundColor3 = Theme.Accent
    _v4nep7hp53m.BorderSizePixel = 0
    _v4nep7hp53m.Parent = _v0dur5vvlx5
    local _vmmy29f5ec8 = Instance.new(_S("77|162|150|144|188|191|187|178|191"))
    _vmmy29f5ec8.CornerRadius = UDim.new(1, 0)
    _vmmy29f5ec8.Parent = _v4nep7hp53m

    local _v7wmes7fzk8 = false
    local function _v4knuqjv62r(input)
        local relX = math.clamp((input.Position.X - _v0dur5vvlx5.AbsolutePosition.X) / _v0dur5vvlx5.AbsoluteSize.X, 0, 1)
        local val = math.floor(minVal + (maxVal - minVal) * relX)
        _v4nep7hp53m.Size = UDim2.new(relX, 0, 1, 0)
        _v52gkckjilb.Text = tostring(val)
        callback(val)
    end

    _v0dur5vvlx5.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            _v7wmes7fzk8 = true
            _v4knuqjv62r(input)
        end
    end)
    _vnqiki4fvlv.InputChanged:Connect(function(input)
        if _v7wmes7fzk8 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            _v4knuqjv62r(input)
        end
    end)
    _vnqiki4fvlv.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            _v7wmes7fzk8 = false
        end
    end)
    return frame
end

local function _v6z8s0kx4p9(parent, name, defaultText, callback)
    _vzqzu0pk5no = _vzqzu0pk5no + 1
    local frame = Instance.new(_S("114|184|228|211|223|215"))
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.BackgroundColor3 = Theme.Panel
    frame.BackgroundTransparency = 0.15
    frame.BorderSizePixel = 0
    frame.LayoutOrder = _vzqzu0pk5no
    frame.Parent = parent

    local _vsr6fg33r69 = Instance.new(_S("81|166|154|148|192|195|191|182|195"))
    _vsr6fg33r69.CornerRadius = UDim.new(0, 8)
    _vsr6fg33r69.Parent = frame

    local label = Instance.new(_S("121|205|222|241|237|197|218|219|222|229"))
    label.Size = UDim2.new(0.38, 0, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.SubText
    label.Font = Enum.Font.Gotham
    label.TextSize = _vgle8yoef1q and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local input = Instance.new(_S("83|167|184|203|199|149|194|203"))
    input.Size = UDim2.new(0.55, 0, 0, 26)
    input.Position = UDim2.new(0.42, 0, 0.5, -13)
    input.BackgroundColor3 = Theme.Input
    input.BorderSizePixel = 0
    input.Text = defaultText
    input.PlaceholderText = name
    input.TextColor3 = Theme.Text
    input.PlaceholderColor3 = Theme.Muted
    input.Font = Enum.Font.Gotham
    input.TextSize = _vgle8yoef1q and 10 or 11
    input.ClearTextOnFocus = false
    input.Parent = frame

    local _vvaxkw7ic9u = Instance.new(_S("68|153|141|135|179|182|178|169|182"))
    _vvaxkw7ic9u.CornerRadius = UDim.new(0, 6)
    _vvaxkw7ic9u.Parent = input

    local _vf2lplfv921 = Instance.new(_S("73|158|146|156|189|187|184|180|174"))
    _vf2lplfv921.Color = Theme.Accent
    _vf2lplfv921.Thickness = 1
    _vf2lplfv921.Transparency = 0.75
    _vf2lplfv921.Parent = input

    input.FocusLost:Connect(function()
        callback(input.Text)
    end)
    return frame, input
end

local function _ve3tsiui727()
    _vzqzu0pk5no = 0
end

local _vhx920me9zg = _vrbcwulrfru[_S("101|171|198|215|210")]
_ve3tsiui727()

_vem71kuorez(_vhx920me9zg, _S("111|128313|143|194|195|176|195|194"))
_vzqzu0pk5no = _vzqzu0pk5no + 1
local _vrf3wm1ksn3 = Instance.new(_S("76|146|190|173|185|177"))
_vrf3wm1ksn3.Size = UDim2.new(1, 0, 0, 52)
_vrf3wm1ksn3.BackgroundColor3 = Theme.Panel
_vrf3wm1ksn3.BackgroundTransparency = 0.1
_vrf3wm1ksn3.BorderSizePixel = 0
_vrf3wm1ksn3.LayoutOrder = _vzqzu0pk5no
_vrf3wm1ksn3.Parent = _vhx920me9zg

local _vjb01t391ji = Instance.new(_S("111|196|184|178|222|225|221|212|225"))
_vjb01t391ji.CornerRadius = UDim.new(0, 8)
_vjb01t391ji.Parent = _vrf3wm1ksn3

local _vtiu8c369hs = Instance.new(_S("63|148|136|146|179|177|174|170|164"))
_vtiu8c369hs.Color = Theme.Accent
_vtiu8c369hs.Thickness = 1
_vtiu8c369hs.Transparency = 0.8
_vtiu8c369hs.Parent = _vrf3wm1ksn3

local _vnsr1o0tdho = Instance.new(_S("118|202|219|238|234|194|215|216|219|226"))
_vnsr1o0tdho.Name = _S("92|175|208|189|208|207|176|193|212|208")
_vnsr1o0tdho.Size = UDim2.new(1, -12, 0, 28)
_vnsr1o0tdho.Position = UDim2.new(0, 10, 0, 4)
_vnsr1o0tdho.BackgroundTransparency = 1
_vnsr1o0tdho.Text = _S("89|166|194|199|190|189|147|121|137|121|213|121|172|190|197|197|204|147|121|137|121|213|121|173|186|203|192|190|205|147|121|167|200|199|190")
_vnsr1o0tdho.TextColor3 = Theme.SubText
_vnsr1o0tdho.Font = Enum.Font.Gotham
_vnsr1o0tdho.TextSize = _vgle8yoef1q and 9 or 10
_vnsr1o0tdho.TextXAlignment = Enum.TextXAlignment.Left
_vnsr1o0tdho.TextWrapped = true
_vnsr1o0tdho.Parent = _vrf3wm1ksn3

CashLabel = Instance.new(_S("77|161|178|197|193|153|174|175|178|185"))
CashLabel.Name = _S("111|178|208|226|215|195|212|231|227")
CashLabel.Size = UDim2.new(1, -12, 0, 18)
CashLabel.Position = UDim2.new(0, 10, 0, 30)
CashLabel.BackgroundTransparency = 1
CashLabel.Text = _S("82|149|179|197|186|140|114|130|114|206|114|169|183|187|185|186|198|140|114|130|129|131|130|130")
CashLabel.TextColor3 = Theme.Accent
CashLabel.Font = Enum.Font.GothamBold
CashLabel.TextSize = _vgle8yoef1q and 9 or 10
CashLabel.TextXAlignment = Enum.TextXAlignment.Left
CashLabel.Parent = _vrf3wm1ksn3

local function _vykn7t4hb8g()
    _vnsr1o0tdho.Text = _S("97|174|202|207|198|197|155|129") .. State.FarmCount .. _S("92|124|216|124|175|193|200|200|207|150|124") .. State.SellCount .. _S("97|129|221|129|165|214|209|198|155|129") .. State.DupeCount .. _S("82|114|206|114|166|179|196|185|183|198|140|114") .. (State.CurrentTarget or _S("108|186|219|218|209"))
    if CashLabel then
        CashLabel.Text = _S("76|143|173|191|180|134|108") .. _vkd8xnh0cyx() .. _S("66|98|190|98|153|167|171|169|170|182|124|98") .. math.floor(_v03c4c37rjx()) .. _S("63|110") .. math.floor(_vrbly5rkwrv())
    end
end

_vem71kuorez(_vhx920me9zg, _S("122|128382|154|205|199|187|204|206|154|198|201|201|202"))

_vj8fij4gt5t(_vhx920me9zg, _S("92|175|201|189|206|208|124|168|203|203|204|124|132|162|189|206|201|8686|175|193|200|200|8686|177|204|195|206|189|192|193|133"), false, function(val)
    _v7waz68vjhn.SmartLoop = val
    if val then _v1yqj5byw0q() else _vjrd7o2l9jf() end
end)

_vj8fij4gt5t(_vhx920me9zg, _S("113|178|230|229|224|145|182|226|230|218|225|145|179|214|228|229|145|193|218|212|220|210|233|214"), false, function(val)
    _v7waz68vjhn.AutoEquipPickaxe = val
end)

_vj8fij4gt5t(_vhx920me9zg, _S("94|176|191|206|199|194|126|171|199|204|195|126|134|203|211|202|210|199|139|198|199|210|135"), false, function(val)
    _v7waz68vjhn.RapidMine = val
end)

_vjx3w9kzjl8(_vhx920me9zg, _S("108|190|205|220|213|208|140|185|213|218|209|140|180|213|224|223"), 1, 10, 3, function(val)
    _v7waz68vjhn.RapidMineCount = val
end)

_vj8fij4gt5t(_vhx920me9zg, _S("96|161|213|212|207|128|163|207|204|204|197|195|212|128|164|210|207|208|211"), false, function(val)
    _v7waz68vjhn.AutoCollectDrops = val
    if val then _v0ngom9zhsp() else State.DropCollectConn = nil end
end)

_vj8fij4gt5t(_vhx920me9zg, _S("113|179|234|225|210|228|228|145|193|227|224|222|225|229|145|185|224|221|213"), true, function(val)
    _v7waz68vjhn.BypassPromptHold = val
end)

_vj8fij4gt5t(_vhx920me9zg, _S("127|211|246|228|228|237|159|211|228|235|228|239|238|241|243"), false, function(val)
    _v7waz68vjhn.TweenTeleport = val
end)

_vem71kuorez(_vhx920me9zg, _S("100|128019|132|179|182|169|132|170|173|176|184|169|182"))

_vj8fij4gt5t(_vhx920me9zg, _S("107|176|217|204|205|215|208|139|186|221|208|139|177|212|215|223|208|221"), false, function(val)
    _v7waz68vjhn.OreFilterEnabled = val
end)

_v6z8s0kx4p9(_vhx920me9zg, _S("107|194|211|212|223|208|215|212|222|223|139|186|221|208|222"), _v7waz68vjhn.OreFilter, function(text)
    _v7waz68vjhn.OreFilter = text
end)

_v6z8s0kx4p9(_vhx920me9zg, _S("91|157|199|188|190|198|199|196|206|207|123|170|205|192|206"), _v7waz68vjhn.OreBlacklist, function(text)
    _v7waz68vjhn.OreBlacklist = text
end)

_vem71kuorez(_vhx920me9zg, _S("75|10010|107|140|160|159|154|107|145|140|157|152"))

_vj8fij4gt5t(_vhx920me9zg, _S("130|195|247|246|241|162|200|227|244|239|162|212|241|229|237|245|177|197|244|251|245|246|227|238|245"), false, function(val)
    _v7waz68vjhn.AutoFarm = val
    if val then _vmxf3w0runt() else _vg3ft1nprj0() end
end)

_vj8fij4gt5t(_vhx920me9zg, _S("109|189|223|214|220|223|214|225|230|141|181|214|212|213|210|224|225|141|195|206|217|226|210"), false, function(val)
    _v7waz68vjhn.PriorityHighestValue = val
    if val then _v7waz68vjhn.PriorityClosest = false end
end)

_vj8fij4gt5t(_vhx920me9zg, _S("115|195|229|220|226|229|220|231|236|147|182|223|226|230|216|230|231"), true, function(val)
    _v7waz68vjhn.PriorityClosest = val
    if val then _v7waz68vjhn.PriorityHighestValue = false end
end)

_vjx3w9kzjl8(_vhx920me9zg, _S("119|189|216|233|228|151|201|216|219|224|236|234"), 50, 2000, 500, function(val)
    _v7waz68vjhn.FarmRadius = val
end)

_vjx3w9kzjl8(_vhx920me9zg, _S("86|156|183|200|195|118|154|187|194|183|207"), 1, 100, 5, function(val)
    _v7waz68vjhn.FarmDelay = val / 100
end)

_vnblxjh1qhs(_vhx920me9zg, _S("86|128355|118|169|185|183|196|118|168|197|185|193|201|118|164|197|205"), Color3.fromRGB(40, 80, 160), function()
    local rocks = _v1y2wurcl0l()
    _vv6vvad4d9h(_S("60|130|171|177|170|160|92") .. #rocks .. _S("87|119|201|198|186|194|202|134|186|201|208|202|203|184|195|202"))
end)

_vnblxjh1qhs(_vhx920me9zg, _S("108|10043|140|185|213|218|209|140|186|209|205|222|209|223|224|140|190|219|207|215"), Color3.fromRGB(40, 120, 60), function()
    local rocks = _v1y2wurcl0l()
    if #rocks > 0 then
        _vf37ku9f4vl(rocks[1])
    else
        _vv6vvad4d9h(_S("82|160|193|114|196|193|181|189|197|114|184|193|199|192|182|115"))
    end
end)

_vnblxjh1qhs(_vhx920me9zg, _S("120|10009|152|187|217|219|224|221|152|202|221|229|231|236|221|235"), Color3.fromRGB(100, 50, 150), function()
    _v9ohaz27yl5()
end)

local _vo7q1f12spj = _vrbcwulrfru[_S("125|208|226|233|233")]
_ve3tsiui727()

_vem71kuorez(_vo7q1f12spj, _S("101|128277|133|166|186|185|180|133|184|170|177|177"))

_vj8fij4gt5t(_vo7q1f12spj, _S("74|157|175|182|182|106|161|178|175|184|106|140|171|173|181|186|171|173|181|106|144|191|182|182"), true, function(val)
    _v7waz68vjhn.SellWhenFull = val
end)

_vjx3w9kzjl8(_vo7q1f12spj, _S("119|202|220|227|227|151|196|224|229|151|186|216|234|223|151|203|223|233|220|234|223|230|227|219"), 0, 500000, 0, function(val)
    _v7waz68vjhn.SellMinCash = val
end)

_vj8fij4gt5t(_vo7q1f12spj, _S("85|150|202|201|196|117|168|186|193|193"), false, function(val)
    _v7waz68vjhn.AutoSell = val
    if val then _vfe6auuyq2a() else _v6ljjlim2a7() end
end)

_vjx3w9kzjl8(_vo7q1f12spj, _S("81|164|182|189|189|113|163|178|181|186|198|196"), 50, 1000, 300, function(val)
    _v7waz68vjhn.SellRadius = val
end)

_vjx3w9kzjl8(_vo7q1f12spj, _S("91|174|192|199|199|123|159|192|199|188|212"), 1, 50, 3, function(val)
    _v7waz68vjhn.SellDelay = val / 10
end)

_vnblxjh1qhs(_vo7q1f12spj, _S("84|128260|116|167|185|192|192|116|181|200|116|162|185|181|198|185|199|200|116|167|188|195|196"), Color3.fromRGB(140, 100, 30), function()
    local shops = _vwi0vrnlz4s()
    if #shops > 0 then
        _vfklcf8eoiw(shops[1])
    else
        _vv6vvad4d9h(_S("122|200|233|154|237|226|233|234|237|154|224|233|239|232|222|155"))
    end
end)

_vnblxjh1qhs(_vo7q1f12spj, _S("82|128050|114|153|193|114|154|193|191|183|114|129|114|166|183|190|183|194|193|196|198|114|198|193|114|165|186|193|194"), Color3.fromRGB(80, 50, 150), function()
    local shops = _vwi0vrnlz4s()
    if #shops > 0 then
        _vmax6nag1aa(shops[1].Part.Position)
        _vv6vvad4d9h(_S("78|162|179|186|179|190|189|192|194|179|178|110|194|189|136|110") .. shops[1].Name)
    end
end)

_vem71kuorez(_vo7q1f12spj, _S("76|128798|108|141|161|160|155|108|142|161|165|108|161|156|147|158|141|144|145|159"))

_vj8fij4gt5t(_vo7q1f12spj, _S("82|147|199|198|193|114|148|199|203|114|162|187|181|189|179|202|183"), false, function(val) _v7waz68vjhn.AutoBuyPickaxe = val end)
_vj8fij4gt5t(_vo7q1f12spj, _S("124|189|241|240|235|156|190|241|245|156|190|221|223|231|236|221|223|231"), false, function(val) _v7waz68vjhn.AutoBuyBackpack = val end)
_vj8fij4gt5t(_vo7q1f12spj, _S("107|172|224|223|218|139|173|224|228|139|183|224|206|214"), false, function(val) _v7waz68vjhn.AutoBuyLuck = val end)
_vj8fij4gt5t(_vo7q1f12spj, _S("72|137|189|188|183|104|138|189|193|104|159|169|186|181|188|176"), false, function(val) _v7waz68vjhn.AutoBuyWarmth = val end)

_vj8fij4gt5t(_vo7q1f12spj, _S("76|141|193|192|187|108|158|177|174|181|190|192|180"), false, function(val) _v7waz68vjhn.AutoRebirth = val end)

_vjx3w9kzjl8(_vo7q1f12spj, _S("95|177|196|193|200|209|211|199|127|162|192|210|199|127|179|199|209|196|210|199|206|203|195"), 1000, 1000000, 50000, function(val)
    _v7waz68vjhn.RebirthCashThreshold = val
end)

_vj8fij4gt5t(_vo7q1f12spj, _S("120|185|237|236|231|152|187|228|217|225|229|152|188|217|225|228|241|167|187|231|220|221"), false, function(val) _v7waz68vjhn.AutoClaimDaily = val end)

_v6z8s0kx4p9(_vo7q1f12spj, _S("107|187|221|218|216|218|139|174|218|207|208"), _S("103|"), function(text) _v7waz68vjhn.PromoCode = text end)

_vnblxjh1qhs(_vo7q1f12spj, _S("75|127948|107|142|183|172|180|184|107|143|172|180|183|196|107|153|186|194"), Color3.fromRGB(180, 130, 40), function()
    _vsz5u8329xb()
    _vv6vvad4d9h(_S("84|151|192|181|189|193|185|184|116|184|181|189|192|205|116|198|185|203|181|198|184|199"))
end)

_vem71kuorez(_vo7q1f12spj, _S("116|128376|148|181|201|200|195|148|201|196|187|198|181|184|185"))

_vj8fij4gt5t(_vo7q1f12spj, _S("111|176|228|227|222|143|196|223|214|225|208|211|212"), false, function(val)
    _v7waz68vjhn.AutoUpgrade = val
    if val then _v976re6fk96() else _va469as3ox3() end
end)

_vnblxjh1qhs(_vo7q1f12spj, _S("73|11087|105|158|185|176|187|170|173|174|105|138|181|181"), Color3.fromRGB(50, 130, 180), function()
    _vme4qihhqx7(_S("122|239|234|225|236|219|222|223"))
    _vme4qihhqx7(_S("117|215|234|238"))
    _vme4qihhqx7(_S("111|223|228|225|210|215|208|226|212"))
    _vme4qihhqx7(_S("114|233|211|228|223|230|218"))
    _vme4qihhqx7(_S("81|193|186|180|188|178|201|182"))
    _vme4qihhqx7(_S("86|184|183|185|193|198|183|185|193"))
    _vme4qihhqx7(_S("78|193|190|179|179|178"))
    _vv6vvad4d9h(_S("88|158|193|202|189|188|120|205|200|191|202|185|188|189|120|202|189|197|199|204|189|203"))
end)

_vem71kuorez(_vo7q1f12spj, _S("109|128087|141|177|178|193|178|176|193|178|177|141|192|181|188|189|192"))

local _vxwofmh1l5l = Instance.new(_S("127|210|226|241|238|235|235|232|237|230|197|241|224|236|228"))
ShopList = _vxwofmh1l5l
ShopList.Name = _S("69|152|173|180|181|145|174|184|185")
ShopList.Size = UDim2.new(1, 0, 0, 90)
ShopList.BackgroundColor3 = Theme.Panel
ShopList.BackgroundTransparency = 0.15
ShopList.BorderSizePixel = 0
ShopList.ScrollBarThickness = 3
ShopList.ScrollBarImageColor3 = Theme.Accent
ShopList.CanvasSize = UDim2.new(0, 0, 0, 0)
ShopList.AutomaticCanvasSize = Enum.AutomaticSize.Y
_vzqzu0pk5no = _vzqzu0pk5no + 1
ShopList.LayoutOrder = _vzqzu0pk5no
ShopList.Parent = _vo7q1f12spj

local _vfxjbuv4ng8 = Instance.new(_S("129|214|202|196|240|243|239|230|243"))
_vfxjbuv4ng8.CornerRadius = UDim.new(0, 6)
_vfxjbuv4ng8.Parent = ShopList

local _valfvg67soy = Instance.new(_S("105|190|178|181|210|220|221|181|202|226|216|222|221"))
_valfvg67soy.SortOrder = Enum.SortOrder.LayoutOrder
_valfvg67soy.Padding = UDim.new(0, 2)
_valfvg67soy.Parent = ShopList

local _v9bbt0c7zxj = Instance.new(_S("128|213|201|208|225|228|228|233|238|231"))
_v9bbt0c7zxj.PaddingTop = UDim.new(0, 2)
_v9bbt0c7zxj.PaddingBottom = UDim.new(0, 2)
_v9bbt0c7zxj.PaddingLeft = UDim.new(0, 2)
_v9bbt0c7zxj.PaddingRight = UDim.new(0, 2)
_v9bbt0c7zxj.Parent = ShopList

local _v1hgjw3rj9e = _vrbcwulrfru[_S("95|164|178|175")]
_ve3tsiui727()

_vem71kuorez(_v1hgjw3rj9e, _S("110|128175|142|179|193|190|142|157|142|196|183|193|195|175|186|193"))

_vj8fij4gt5t(_v1hgjw3rj9e, _S("81|148|195|202|196|197|178|189|113|128|113|163|192|180|188|113|150|164|161"), false, function(val)
    _v7waz68vjhn.ESPEnabled = val
    if val then _viqkdi2an3c() else _vcjbsky4wca() end
end)

_vj8fij4gt5t(_v1hgjw3rj9e, _S("116|200|230|213|215|217|230|231|148|156|198|227|215|223|231|163|199|220|227|228|231|157"), false, function(val)
    _v7waz68vjhn.Tracers = val
    if not val then _vzfgkygt8d4() end
end)

_vj8fij4gt5t(_v1hgjw3rj9e, _S("67|147|175|164|188|168|181|99|136|150|147"), false, function(val)
    _v7waz68vjhn.PlayerESP = val
    if not val then _vgi705eg68c() end
end)

_vj8fij4gt5t(_v1hgjw3rj9e, _S("67|134|171|168|182|183|99|114|99|136|185|168|177|183|99|136|150|147"), false, function(val)
    _v7waz68vjhn.ChestESP = val
    if not val then _vjpa1gixp55() end
end)

_vj8fij4gt5t(_v1hgjw3rj9e, _S("129|199|246|237|237|227|243|234|232|233|245"), false, function(val)
    _v7waz68vjhn.Fullbright = val
    if val then _vwlliduxaxp() else _vnp38yekj16() end
end)

_vj8fij4gt5t(_v1hgjw3rj9e, _S("80|152|185|180|181|112|159|196|184|181|194|112|160|188|177|201|181|194|195"), false, function(val)
    _v7waz68vjhn.HideOtherPlayers = val
    _vlijjol47uc()
end)

_vnblxjh1qhs(_v1hgjw3rj9e, _S("122|128382|154|204|223|224|236|223|237|226|154|191|205|202"), Color3.fromRGB(50, 90, 160), function()
    if _v7waz68vjhn.ESPEnabled then
        _v8vr1101p6x()
    else
        _vv6vvad4d9h(_S("102|171|212|199|200|210|203|134|171|185|182|134|204|207|216|217|218|135"))
    end
end)

_vnblxjh1qhs(_v1hgjw3rj9e, _S("129|10189|161|196|237|230|226|243|161|198|212|209"), Color3.fromRGB(150, 50, 50), function()
    _vcjbsky4wca()
end)

_vem71kuorez(_v1hgjw3rj9e, _S("120|129824|152|188|189|204|189|187|204|189|188|152|202|199|187|195|203"))

local _vjco266pr9b = Instance.new(_S("62|145|161|176|173|170|170|167|172|165|132|176|159|171|163"))
RockList = _vjco266pr9b
RockList.Name = _S("78|160|189|177|185|154|183|193|194")
RockList.Size = UDim2.new(1, 0, 0, 120)
RockList.BackgroundColor3 = Theme.Panel
RockList.BackgroundTransparency = 0.15
RockList.BorderSizePixel = 0
RockList.ScrollBarThickness = 3
RockList.ScrollBarImageColor3 = Theme.Accent
RockList.CanvasSize = UDim2.new(0, 0, 0, 0)
RockList.AutomaticCanvasSize = Enum.AutomaticSize.Y
_vzqzu0pk5no = _vzqzu0pk5no + 1
RockList.LayoutOrder = _vzqzu0pk5no
RockList.Parent = _v1hgjw3rj9e

local _v75gpiscnzr = Instance.new(_S("129|214|202|196|240|243|239|230|243"))
_v75gpiscnzr.CornerRadius = UDim.new(0, 6)
_v75gpiscnzr.Parent = RockList

local _vaaeazrwpxe = Instance.new(_S("127|212|200|203|232|242|243|203|224|248|238|244|243"))
_vaaeazrwpxe.SortOrder = Enum.SortOrder.LayoutOrder
_vaaeazrwpxe.Padding = UDim.new(0, 2)
_vaaeazrwpxe.Parent = RockList

local rLPad = Instance.new(_S("101|186|174|181|198|201|201|206|211|204"))
rLPad.PaddingTop = UDim.new(0, 2)
rLPad.PaddingBottom = UDim.new(0, 2)
rLPad.PaddingLeft = UDim.new(0, 2)
rLPad.PaddingRight = UDim.new(0, 2)
rLPad.Parent = RockList

local _vydd8r2lfni = _vrbcwulrfru[_S("88|157|208|200|196|199|193|204")]
_ve3tsiui727()

_vem71kuorez(_vydd8r2lfni, _S("93|127983|125|162|181|173|169|172|166|177|176"))

_vj8fij4gt5t(_vydd8r2lfni, _S("122|207|232|230|227|231|227|238|223|222|154|188|219|221|229|234|219|221|229"), false, function(val)
    _v7waz68vjhn.UnlimitedBackpack = val
    if val then _v2w74nz9wje() end
end)

_vj8fij4gt5t(_vydd8r2lfni, _S("99|184|209|207|204|208|204|215|200|199|131|175|216|198|206"), false, function(val)
    _v7waz68vjhn.UnlimitedLuck = val
    if val then _viozocvluoe() end
end)

_vj8fij4gt5t(_vydd8r2lfni, _S("71|136|181|187|176|103|139|168|180|168|174|172"), false, function(val)
    _v7waz68vjhn.AntiDamage = val
    if val then _vbw4lcu8jky() else _v38vluifqi9() end
end)

_vj8fij4gt5t(_vydd8r2lfni, _S("97|162|207|213|202|129|167|211|198|198|219|198|129|137|184|194|211|206|213|201|138"), false, function(val)
    _v7waz68vjhn.AntiFreeze = val
    if val and not _v7waz68vjhn.AntiDamage then
        _v7waz68vjhn.AntiDamage = true
        _vbw4lcu8jky()
    end
end)

_vj8fij4gt5t(_vydd8r2lfni, _S("93|180|190|207|202|209|197|125|168|194|194|205|194|207"), false, function(val)
    _v7waz68vjhn.WarmthKeeper = val
    if val or _v7waz68vjhn.StaminaKeeper then _vyknuy031k5() else _vio6kma08xn() end
end)

_vj8fij4gt5t(_vydd8r2lfni, _S("117|200|233|214|226|222|227|214|149|192|218|218|229|218|231"), false, function(val)
    _v7waz68vjhn.StaminaKeeper = val
    if val or _v7waz68vjhn.WarmthKeeper then _vyknuy031k5() else _vio6kma08xn() end
end)

_vem71kuorez(_vydd8r2lfni, _S("109|128026|141|186|188|195|178|186|178|187|193"))

_vj8fij4gt5t(_vydd8r2lfni, _S("79|162|191|180|180|179|111|145|190|190|194|195"), false, function(val)
    _v7waz68vjhn.SpeedBoost = val
    _vb0zw0tduye()
end)

_vjx3w9kzjl8(_vydd8r2lfni, _S("65|152|162|173|172|97|148|177|166|166|165"), 16, 200, 50, function(val)
    _v7waz68vjhn.WalkSpeed = val
    if _v7waz68vjhn.SpeedBoost then _vb0zw0tduye() end
end)

_vj8fij4gt5t(_vydd8r2lfni, _S("92|170|203|191|200|197|204"), false, function(val)
    _v7waz68vjhn.Noclip = val
    if val then _vkm9n5mxhp2() else _vqulkb5gnc2() end
end)

_vj8fij4gt5t(_vydd8r2lfni, _S("130|200|238|251"), false, function(val)
    _v7waz68vjhn.FlyEnabled = val
    if val then _v1vyt4wih0r() else _vjnercdb1pz() end
end)

_vjx3w9kzjl8(_vydd8r2lfni, _S("95|165|203|216|127|178|207|196|196|195"), 10, 200, 60, function(val)
    _v7waz68vjhn.FlySpeed = val
end)

_vj8fij4gt5t(_vydd8r2lfni, _S("74|147|184|176|179|184|179|190|175|106|148|191|183|186"), false, function(val)
    _v7waz68vjhn.InfiniteJump = val
    if val then _vkhvmp0vzuf() else _v9iyu3x3m2k() end
end)

_vj8fij4gt5t(_vydd8r2lfni, _S("82|149|190|187|181|189|114|166|183|190|183|194|193|196|198|114|122|149|198|196|190|125|149|190|187|181|189|123"), false, function(val)
    _v7waz68vjhn.ClickTeleport = val
    if val then _voygtbe4zr9() else _vyqgv4evc1t() end
end)

_vem71kuorez(_vydd8r2lfni, _S("77|128307|109|150|161|146|154|109|145|162|157|146"))

local dupeInput, dupeTextBox
dupeInput, dupeTextBox = _v6z8s0kx4p9(_vydd8r2lfni, _S("127|195|244|239|228|159|208|243|248"), _S("102|151"), function(text)
    local num = tonumber(text)
    if num and num > 0 then
        _v7waz68vjhn.DupeAmount = math.floor(num)
    end
end)

_vnblxjh1qhs(_vydd8r2lfni, _S("97|128327|129|165|214|209|198|129|170|213|198|206|212|129|137") .. _v7waz68vjhn.DupeAmount .. _S("61|181|102"), Color3.fromRGB(180, 60, 180), function()
    _vdxokk31e4o(_v7waz68vjhn.DupeAmount)
end)

_vnblxjh1qhs(_vydd8r2lfni, _S("61|128291|93|129|175|172|173|93|129|178|173|162|93|138|162|177|165|172|161"), Color3.fromRGB(140, 50, 140), function()
    _vz1pixo5q1v()
end)

_vem71kuorez(_vydd8r2lfni, _S("111|128336|143|193|180|188|190|195|180|143|180|199|191|187|190|184|195|194"))

_vnblxjh1qhs(_vydd8r2lfni, _S("113|128406|145|183|218|227|214|145|178|221|221|145|190|218|223|214|145|195|214|222|224|229|214|228"), Color3.fromRGB(160, 40, 40), function()
    _vme4qihhqx7(_S("92|201|197|202|193"))
    _vme4qihhqx7(_S("83|183|188|186"))
    _vme4qihhqx7(_S("74|178|171|188|192|175|189|190"))
    _vme4qihhqx7(_S("88|187|199|196|196|189|187|204"))
    _vme4qihhqx7(_S("79|177|193|180|176|186"))
    _vv6vvad4d9h(_S("119|189|224|233|220|219|151|228|224|229|220|151|233|220|228|230|235|220|234"))
end)

_vnblxjh1qhs(_vydd8r2lfni, _S("65|128241|97|135|170|179|166|97|130|173|173|97|148|166|173|173|97|147|166|174|176|181|166|180"), Color3.fromRGB(40, 140, 40), function()
    _vme4qihhqx7(_S("119|234|220|227|227"))
    _vme4qihhqx7(_S("66|181|167|174|174|163|174|174"))
    _vme4qihhqx7(_S("103|202|200|218|207"))
    _vme4qihhqx7(_S("106|215|217|216|207|227"))
    _vme4qihhqx7(_S("63|179|177|160|163|164"))
    _vv6vvad4d9h(_S("99|169|204|213|200|199|131|214|200|207|207|131|213|200|208|210|215|200|214"))
end)

_vnblxjh1qhs(_vydd8r2lfni, _S("85|11099|117|155|190|199|186|117|150|193|193|117|170|197|188|199|182|185|186|117|167|186|194|196|201|186|200"), Color3.fromRGB(40, 100, 160), function()
    _vme4qihhqx7(_S("117|234|229|220|231|214|217|218"))
    _vme4qihhqx7(_S("92|190|209|213"))
    _vme4qihhqx7(_S("105|217|222|219|204|209|202|220|206"))
    _vme4qihhqx7(_S("98|217|195|212|207|214|202"))
    _vme4qihhqx7(_S("81|193|186|180|188|178|201|182"))
    _vme4qihhqx7(_S("105|203|202|204|212|217|202|204|212"))
    _vv6vvad4d9h(_S("98|168|203|212|199|198|130|215|210|201|212|195|198|199|130|212|199|207|209|214|199|213"))
end)

_vnblxjh1qhs(_vydd8r2lfni, _S("101|128023|133|171|206|215|202|133|166|209|209|133|177|218|200|208|133|183|202|210|212|217|202|216"), Color3.fromRGB(140, 140, 40), function()
    _vme4qihhqx7(_S("122|230|239|221|229"))
    _vme4qihhqx7(_S("122|230|239|221|229|243"))
    _vme4qihhqx7(_S("90|192|201|204|206|207|200|191"))
    _vme4qihhqx7(_S("89|187|197|190|204|204|194|199|192"))
    _vv6vvad4d9h(_S("63|133|168|177|164|163|95|171|180|162|170|95|177|164|172|174|179|164|178"))
end)

_vnblxjh1qhs(_vydd8r2lfni, _S("87|128250|119|157|192|201|188|119|152|163|163|119|169|188|196|198|203|188|202|119|127|165|204|194|188|128"), Color3.fromRGB(200, 50, 50), function()
    for _, remote in ipairs(State.RemoteCache) do
        pcall(function()
            if remote.Type == _S("112|194|213|221|223|228|213|181|230|213|222|228") then
                remote.Instance:FireServer()
            elseif remote.Type == _S("110|192|211|219|221|226|211|180|227|220|209|226|215|221|220") then
                remote.Instance:InvokeServer()
            end
        end)
    end
    _vv6vvad4d9h(_S("129|207|214|204|198|197|161|226|237|237|161") .. #State.RemoteCache .. _S("76|108|190|177|185|187|192|177|191|109"))
end)

local _v9v21o7qb0g = _vrbcwulrfru[_S("66|150|177|177|174|181")]
_ve3tsiui727()

_vem71kuorez(_v9v21o7qb0g, _S("84|128309|116|166|153|161|163|168|153|116|167|164|173"))

_vj8fij4gt5t(_v9v21o7qb0g, _S("113|195|214|222|224|229|214|145|196|225|234|145|153|189|224|216|145|183|218|227|214|196|214|227|231|214|227|154"), false, function(val)
    _v7waz68vjhn.RemoteSpy = val
    if val then _vz6wlv6t48l() else _v4u1wr7tpmt() end
end)

_vzqzu0pk5no = _vzqzu0pk5no + 1
local _vgjzz1489ki = Instance.new(_S("126|209|225|240|237|234|234|231|236|229|196|240|223|235|227"))
RemoteSpyList = _vgjzz1489ki
RemoteSpyList.Name = _S("72|154|173|181|183|188|173|155|184|193|148|177|187|188")
RemoteSpyList.Size = UDim2.new(1, 0, 0, 100)
RemoteSpyList.BackgroundColor3 = Theme.Panel
RemoteSpyList.BackgroundTransparency = 0.15
RemoteSpyList.BorderSizePixel = 0
RemoteSpyList.ScrollBarThickness = 3
RemoteSpyList.ScrollBarImageColor3 = Theme.Accent
RemoteSpyList.CanvasSize = UDim2.new(0, 0, 0, 0)
RemoteSpyList.AutomaticCanvasSize = Enum.AutomaticSize.Y
RemoteSpyList.LayoutOrder = _vzqzu0pk5no
RemoteSpyList.Parent = _v9v21o7qb0g

local _v119n5ywm33 = Instance.new(_S("63|148|136|130|174|177|173|164|177"))
_v119n5ywm33.CornerRadius = UDim.new(0, 6)
_v119n5ywm33.Parent = RemoteSpyList

local _v53t0sacv6y = Instance.new(_S("117|202|190|193|222|232|233|193|214|238|228|234|233"))
_v53t0sacv6y.SortOrder = Enum.SortOrder.LayoutOrder
_v53t0sacv6y.Padding = UDim.new(0, 2)
_v53t0sacv6y.Parent = RemoteSpyList

local _v1s7qkopwtw = Instance.new(_S("126|211|199|206|223|226|226|231|236|229"))
_v1s7qkopwtw.PaddingTop = UDim.new(0, 2)
_v1s7qkopwtw.PaddingLeft = UDim.new(0, 2)
_v1s7qkopwtw.PaddingRight = UDim.new(0, 2)
_v1s7qkopwtw.Parent = RemoteSpyList

_vnblxjh1qhs(_v9v21o7qb0g, _S("62|128527|94|129|170|163|159|176|94|145|174|183|94|138|173|165"), Color3.fromRGB(100, 50, 50), function()
    State.RemoteSpyLogs = {}
    if RemoteSpyList then _vdmb3sdada7(RemoteSpyList) end
end)

_vem71kuorez(_v9v21o7qb0g, _S("121|128040|153|188|206|204|205|200|198|153|203|190|198|200|205|190"))

_v6z8s0kx4p9(_v9v21o7qb0g, _S("72|154|173|181|183|188|173|104|150|169|181|173"), _S("66|"), function(text)
    _v7waz68vjhn.CustomRemoteName = text
end)

_v6z8s0kx4p9(_v9v21o7qb0g, _S("103|168|217|206|218|135|143|202|214|212|212|200|135|218|204|215|200|217|200|219|204|203|144"), _S("83|"), function(text)
    _v7waz68vjhn.CustomRemoteArgs = text
end)

_vnblxjh1qhs(_v9v21o7qb0g, _S("72|128712|104|142|177|186|173|104|139|189|187|188|183|181|104|154|173|181|183|188|173"), Color3.fromRGB(160, 80, 40), function()
    _va9h0k3xui8()
end)

_vem71kuorez(_v9v21o7qb0g, _S("120|128325|152|207|185|209|200|199|193|198|204|203"))

_vnblxjh1qhs(_v9v21o7qb0g, _S("97|128287|129|180|194|215|198|155|129|180|201|208|209"), Color3.fromRGB(50, 100, 160), function()
    _v5edf1wp9gy(_S("111|194|215|222|223"))
end)

_vnblxjh1qhs(_v9v21o7qb0g, _S("66|128256|98|149|163|184|167|124|98|136|163|180|175|98|149|178|177|182"), Color3.fromRGB(50, 130, 80), function()
    _v5edf1wp9gy(_S("94|164|191|208|203"))
end)

_vnblxjh1qhs(_v9v21o7qb0g, _S("64|128254|96|147|161|182|165|122|96|147|176|161|183|174"), Color3.fromRGB(80, 80, 140), function()
    _v5edf1wp9gy(_S("117|200|229|214|236|227"))
end)

_vnblxjh1qhs(_v9v21o7qb0g, _S("75|128280|107|159|155|107|8669|107|158|179|186|187"), Color3.fromRGB(40, 90, 140), function()
    _v3e5sqvvzg4(_S("87|170|191|198|199"))
end)

_vnblxjh1qhs(_v9v21o7qb0g, _S("128|128333|160|212|208|160|8722|160|198|225|242|237|160|211|240|239|244"), Color3.fromRGB(40, 120, 70), function()
    _v3e5sqvvzg4(_S("129|199|226|243|238"))
end)

_vnblxjh1qhs(_v9v21o7qb0g, _S("103|128308|135|187|183|135|8697|135|186|215|200|222|213"), Color3.fromRGB(70, 70, 130), function()
    _v3e5sqvvzg4(_S("67|150|179|164|186|177"))
end)

local _vttew3stu6x = _vrbcwulrfru[_S("86|163|191|201|185")]
_ve3tsiui727()

_vem71kuorez(_vttew3stu6x, _S("122|10003|154|205|191|206|206|195|200|193|205"))

_vj8fij4gt5t(_vttew3stu6x, _S("88|153|198|204|193|133|153|158|163"), false, function(val)
    _v7waz68vjhn.AntiAFK = val
    if val then _vzj5rgcjfn3() else _v8dxpvy8aqj() end
end)

_vj8fij4gt5t(_vttew3stu6x, _S("124|189|241|240|235|156|206|225|239|236|221|243|234|156|167|156|206|225|221|236|236|232|245"), false, function(val)
    _v7waz68vjhn.AutoRespawn = val
end)

_vj8fij4gt5t(_vttew3stu6x, _S("110|180|190|193|142|176|221|221|225|226|211|224"), false, function(val)
    _v7waz68vjhn.FPSBooster = val
    if val then _vuu45qgitw3() end
end)

_vjx3w9kzjl8(_vttew3stu6x, _S("112|195|213|226|230|213|226|144|184|223|224|144|152|221|217|222|156|144|160|173|223|214|214|153"), 0, 120, 0, function(val)
    _v7waz68vjhn.ServerHopInterval = val
    _v1gykbuih0y()
    if val > 0 then _v8s0ld9io6n() end
end)

_vnblxjh1qhs(_vttew3stu6x, _S("92|127852|124|175|193|206|210|193|206|124|164|203|204|124|170|203|211"), Color3.fromRGB(60, 100, 160), function()
    _v2m06cb8caz()
end)

_vnblxjh1qhs(_vttew3stu6x, _S("77|128267|109|160|174|195|178|109|144|188|187|179|182|180"), Color3.fromRGB(50, 120, 80), function()
    _vf3t8kn2cud()
end)

_vnblxjh1qhs(_vttew3stu6x, _S("74|128268|106|150|185|171|174|106|141|185|184|176|179|177"), Color3.fromRGB(80, 100, 160), function()
    _v0lkfk91e2o()
end)

_vnblxjh1qhs(_vttew3stu6x, _S("85|128765|117|165|150|163|158|152|117|125|168|201|196|197|117|150|193|193|126"), Color3.fromRGB(200, 40, 40), function()
    _vb1z9ofns0r()
end)

_vem71kuorez(_vttew3stu6x, _S("118|9118|150|193|187|207|184|191|196|186|201"))
_vzqzu0pk5no = _vzqzu0pk5no + 1
local _v8j858qis8r = Instance.new(_S("105|189|206|225|221|181|202|203|206|213"))
_v8j858qis8r.Size = UDim2.new(1, 0, 0, 70)
_v8j858qis8r.BackgroundColor3 = Theme.Panel
_v8j858qis8r.BackgroundTransparency = 0.1
_v8j858qis8r.BorderSizePixel = 0
_v8j858qis8r.Text = _S("85|117|117|167|190|188|189|201|168|189|190|187|201|117|146|117|169|196|188|188|193|186|117|156|170|158|177|195|117|117|155|117|146|117|169|196|188|188|193|186|117|155|193|206|177|195|117|117|156|117|146|117|169|196|188|188|193|186|117|150|202|201|196|117|155|182|199|194|177|195|117|117|157|117|146|117|169|196|188|188|193|186|117|168|194|182|199|201|117|161|196|196|197|177|195|117|117|165|117|146|117|165|182|195|190|184|117|168|201|196|197|117|150|193|193|177|195|117|117|152|201|199|193|128|152|193|190|184|192|117|146|117|152|193|190|184|192|117|169|165|117|125|190|187|117|186|195|182|183|193|186|185|126")
_v8j858qis8r.TextColor3 = Theme.SubText
_v8j858qis8r.Font = Enum.Font.Gotham
_v8j858qis8r.TextSize = _vgle8yoef1q and 9 or 10
_v8j858qis8r.TextXAlignment = Enum.TextXAlignment.Left
_v8j858qis8r.TextYAlignment = Enum.TextYAlignment.Top
_v8j858qis8r.TextWrapped = true
_v8j858qis8r.LayoutOrder = _vzqzu0pk5no
_v8j858qis8r.Parent = _vttew3stu6x
local _v1st5fcg2n3 = Instance.new(_S("62|147|135|129|173|176|172|163|176"))
_v1st5fcg2n3.CornerRadius = UDim.new(0, 6)
_v1st5fcg2n3.Parent = _v8j858qis8r

_vem71kuorez(_vttew3stu6x, _S("102|128305|134|178|181|173"))

local _v4hyo7m1qa6 = Instance.new(_S("117|200|216|231|228|225|225|222|227|220|187|231|214|226|218"))
LogList = _v4hyo7m1qa6
LogList.Name = _S("81|157|192|184|157|186|196|197")
LogList.Size = UDim2.new(1, 0, 0, 100)
LogList.BackgroundColor3 = Theme.Panel
LogList.BackgroundTransparency = 0.15
LogList.BorderSizePixel = 0
LogList.ScrollBarThickness = 3
LogList.ScrollBarImageColor3 = Theme.Accent
LogList.CanvasSize = UDim2.new(0, 0, 0, 0)
LogList.AutomaticCanvasSize = Enum.AutomaticSize.Y
_vzqzu0pk5no = _vzqzu0pk5no + 1
LogList.LayoutOrder = _vzqzu0pk5no
LogList.Parent = _vttew3stu6x

local _vum76xaz2dg = Instance.new(_S("64|149|137|131|175|178|174|165|178"))
_vum76xaz2dg.CornerRadius = UDim.new(0, 6)
_vum76xaz2dg.Parent = LogList

local _v1w9dgvwzz1 = Instance.new(_S("126|211|199|202|231|241|242|202|223|247|237|243|242"))
_v1w9dgvwzz1.SortOrder = Enum.SortOrder.LayoutOrder
_v1w9dgvwzz1.Parent = LogList

local _vmtp4bd9bk1 = Instance.new(_S("109|194|182|189|206|209|209|214|219|212"))
_vmtp4bd9bk1.PaddingTop = UDim.new(0, 3)
_vmtp4bd9bk1.PaddingLeft = UDim.new(0, 3)
_vmtp4bd9bk1.PaddingRight = UDim.new(0, 3)
_vmtp4bd9bk1.Parent = LogList

_vem71kuorez(_vttew3stu6x, _S("116|128395|148|184|189|199|183|195|198|184|148|203|185|182|188|195|195|191"))

_vj8fij4gt5t(_vttew3stu6x, _S("97|166|207|194|195|205|198|129|184|198|195|201|208|208|204"), false, function(val)
    _v7waz68vjhn.WebhookEnabled = val
end)

_v6z8s0kx4p9(_vttew3stu6x, _S("118|205|219|216|222|229|229|225|150|203|200|194"), _S("98|"), function(text)
    _v7waz68vjhn.WebhookURL = text
end)

_vj8fij4gt5t(_vttew3stu6x, _S("127|197|224|241|236|159|203|238|230|242"), true, function(val)
    _v7waz68vjhn.WebhookFarm = val
end)

_vj8fij4gt5t(_vttew3stu6x, _S("127|210|228|235|235|159|203|238|230|242"), true, function(val)
    _v7waz68vjhn.WebhookSell = val
end)

_vj8fij4gt5t(_vttew3stu6x, _S("116|199|232|213|232|231|148|192|227|219|231"), true, function(val)
    _v7waz68vjhn.WebhookStats = val
end)

_vnblxjh1qhs(_vttew3stu6x, _S("114|128346|146|197|215|224|214|146|197|230|211|230|229|146|192|225|233"), Color3.fromRGB(50, 90, 160), function()
    _vzdu6ihz2jk()
    _vv6vvad4d9h(_S("97|180|198|207|213|129|212|213|194|213|212|129|213|208|129|216|198|195|201|208|208|204"))
end)

_vnblxjh1qhs(_vttew3stu6x, _S("62|129576|94|146|163|177|178|94|149|163|160|166|173|173|169"), Color3.fromRGB(90, 60, 140), function()
    _vwpuc45t3bj({content = _S("95|137|137|186|172|200|205|196|192|127|172|206|212|205|211|192|200|205|127|213|150|188|137|137|127|182|196|193|199|206|206|202|127|211|196|210|211|127|210|212|194|194|196|210|210|197|212|203|128|127|10084")})
    _vv6vvad4d9h(_S("87|171|188|202|203|188|187|119|206|188|185|191|198|198|194"))
end)

_vem71kuorez(_vttew3stu6x, _S("100|128395|132|185|184|173|176|173|184|173|169|183"))

_vnblxjh1qhs(_vttew3stu6x, _S("66|128034|98|150|167|174|167|178|177|180|182|98|182|177|98|149|178|163|185|176"), Color3.fromRGB(60, 90, 140), function()
    local _vpsezwq2uxx = _v92gucjek3x:FindFirstChild(_S("67|150|179|164|186|177|143|178|166|164|183|172|178|177")) or _v92gucjek3x:FindFirstChild(_S("109|192|221|206|228|219|224")) or _v92gucjek3x:FindFirstChild(_S("82|158|193|180|180|203"))
    if _vpsezwq2uxx then
        if _vpsezwq2uxx:IsA(_S("107|173|204|222|208|187|204|221|223")) then
            _vmax6nag1aa(_vpsezwq2uxx.Position)
        else
            local spawn = _vpsezwq2uxx:FindFirstChildWhichIsA(_S("93|159|190|208|194|173|190|207|209"))
            if spawn then _vmax6nag1aa(spawn.Position) end
        end
    else
        _vv6vvad4d9h(_S("130|208|241|162|245|242|227|249|240|162|232|241|247|240|230|163"))
    end
end)

_vnblxjh1qhs(_vttew3stu6x, _S("85|128041|117|169|186|193|186|197|196|199|201|117|201|196|117|162|196|202|195|201|182|190|195|117|169|196|197"), Color3.fromRGB(100, 60, 140), function()
    if _vjwpa6b4z60() then
        local _vwwjgp0112u = _vqxyh6gcfta.Position.Y
        local _v5j9o3b4u2o = nil
        for _, part in ipairs(_v92gucjek3x:GetDescendants()) do
            if part:IsA(_S("78|144|175|193|179|158|175|192|194")) and part.Position.Y > _vwwjgp0112u then
                _vwwjgp0112u = part.Position.Y
                _v5j9o3b4u2o = part
            end
        end
        if _v5j9o3b4u2o then
            _vmax6nag1aa(_v5j9o3b4u2o.Position + Vector3.new(0, 10, 0))
            _vv6vvad4d9h(_S("126|210|227|234|227|238|237|240|242|227|226|158|242|237|158|230|231|229|230|227|241|242|158|238|237|231|236|242|184|158") .. math.floor(_vwwjgp0112u))
        end
    end
end)

_vnblxjh1qhs(_vttew3stu6x, _S("116|128376|148|198|217|222|227|221|226|148|199|217|230|234|217|230"), Color3.fromRGB(100, 100, 50), function()
    pcall(function()
        _v9qqaid831c:Kick(_S("83|165|184|189|194|188|193|188|193|186|129|129|129"))
        task.wait(1)
        game:GetService(_S("95|179|196|203|196|207|206|209|211|178|196|209|213|200|194|196")):TeleportToPlaceInstance(game.PlaceId, game.JobId, _v9qqaid831c)
    end)
end)

_vem71kuorez(_vttew3stu6x, _S("101|8606|133|174|179|171|180"))

_vzqzu0pk5no = _vzqzu0pk5no + 1
local _vwplr3ka02r = Instance.new(_S("110|194|211|230|226|186|207|208|211|218"))
_vwplr3ka02r.Size = UDim2.new(1, 0, 0, 50)
_vwplr3ka02r.BackgroundColor3 = Theme.Panel
_vwplr3ka02r.BackgroundTransparency = 0.1
_vwplr3ka02r.Text = _S("95|172|200|205|196|192|127|167|212|193|127|213|150|127|219|127") .. Exec.Name .. _S("120|212|230|203|229|217|234|236|152|196|231|231|232|152|303|152|202|221|229|231|236|221|152|203|232|241|152|303|152|189|203|200|163|152|303|152|207|217|241|232|231|225|230|236|235")
_vwplr3ka02r.TextColor3 = Theme.SubText
_vwplr3ka02r.Font = Enum.Font.Gotham
_vwplr3ka02r.TextSize = _vgle8yoef1q and 9 or 10
_vwplr3ka02r.TextWrapped = true
_vwplr3ka02r.LayoutOrder = _vzqzu0pk5no
_vwplr3ka02r.Parent = _vttew3stu6x

local _v31jslx8qby = Instance.new(_S("87|172|160|154|198|201|197|188|201"))
_v31jslx8qby.CornerRadius = UDim.new(0, 6)
_v31jslx8qby.Parent = _vwplr3ka02r

_veotsgdmeuc.MouseButton1Click:Connect(function()
    State.IsMinimized = true
    local _vqr2bvow3cx = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local tween = _vjsydjh79x2:Create(_vw5uhdt5rf2, _vqr2bvow3cx, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = _v9a482le31k,
    })
    tween:Play()
    tween.Completed:Connect(function()
        _vw5uhdt5rf2.Visible = false
        _v1hazk9pc0f.Visible = true
        _v1hazk9pc0f.Size = UDim2.new(0, 0, 0, 0)
        local _vz0v0k60iuv = _vjsydjh79x2:Create(_v1hazk9pc0f, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = _vee2umr3ro9,
        })
        _vz0v0k60iuv:Play()
    end)
end)

_vx49tv4cbul.MouseButton1Click:Connect(function()
    State.IsMinimized = false
    local _vqr2bvow3cx = TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local tween = _vjsydjh79x2:Create(_v1hazk9pc0f, _vqr2bvow3cx, {
        Size = UDim2.new(0, 0, 0, 0),
    })
    tween:Play()
    tween.Completed:Connect(function()
        _v1hazk9pc0f.Visible = false
        _vw5uhdt5rf2.Visible = true
        _vw5uhdt5rf2.Size = UDim2.new(0, 0, 0, 0)
        local _vz0v0k60iuv = _vjsydjh79x2:Create(_vw5uhdt5rf2, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = _vwwfao1t8dm,
        })
        _vz0v0k60iuv:Play()
    end)
end)

local _vgno681vslf = false
local dragInput
local dragStart
local startPos

local function _vcb7cyy7ji9(input)
    local delta = input.Position - dragStart
    local _vcr62f7vct7 = State.IsMinimized and _v1hazk9pc0f or _vw5uhdt5rf2
    _vcr62f7vct7.Position = UDim2.new(
        startPos.X.Scale, startPos.X.Offset + delta.X,
        startPos.Y.Scale, startPos.Y.Offset + delta.Y
    )
end

local function _v4uzyy4uzhz(frame)
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            _vgno681vslf = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    _vgno681vslf = false
                end
            end)
        end
    end)
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    _vnqiki4fvlv.InputChanged:Connect(function(input)
        if input == dragInput and _vgno681vslf then
            _vcb7cyy7ji9(input)
        end
    end)
end

_v4uzyy4uzhz(_v37qpihrw43)
_v4uzyy4uzhz(_v1hazk9pc0f)

local _vt75nyp0tgx = 0
task.spawn(function()
    while true do
        task.wait(1)
        pcall(_vykn7t4hb8g)
        if _v7waz68vjhn.WebhookEnabled and _v7waz68vjhn.WebhookStats then
            local now = tick()
            if now - _vt75nyp0tgx >= 30 then
                _vt75nyp0tgx = now
                pcall(_vzdu6ihz2jk)
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(10)
        pcall(function()
            local shops = _vwi0vrnlz4s()
            if ShopList then
                _vdmb3sdada7(ShopList)
                for i, shop in ipairs(shops) do
                    if i > 15 then break end
                    local btn = Instance.new(_S("128|212|229|248|244|194|245|244|244|239|238"))
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Theme.Input
                    btn.BorderSizePixel = 0
                    btn.Text = shop.Name .. _S("122|154|213") .. math.floor(shop.Distance) .. _S("82|191|175")
                    btn.TextColor3 = Theme.Text
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = 11
                    btn.LayoutOrder = i
                    btn.Parent = ShopList
                    local _v4opdtp2xv4 = Instance.new(_S("113|198|186|180|224|227|223|214|227"))
                    _v4opdtp2xv4.CornerRadius = UDim.new(0, 5)
                    _v4opdtp2xv4.Parent = btn
                    btn.MouseButton1Click:Connect(function()
                        _vmax6nag1aa(shop.Part.Position)
                        _vv6vvad4d9h(_S("107|191|208|215|208|219|218|221|223|208|207|139|223|218|165|139") .. shop.Name)
                    end)
                end
            end
        end)

        pcall(function()
            local rocks = _v1y2wurcl0l()
            if RockList then
                _vdmb3sdada7(RockList)
                for i, rock in ipairs(rocks) do
                    if i > 20 then break end
                    local btn = Instance.new(_S("124|208|225|244|240|190|241|240|240|235|234"))
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Theme.Input
                    btn.BorderSizePixel = 0
                    btn.Text = rock.Name .. _S("65|97|156") .. math.floor(rock.Distance) .. _S("126|235|219") .. (rock.Value > 0 and (_S("122|154|158") .. rock.Value) or _S("89|"))
                    btn.TextColor3 = rock.Value > 0 and Theme.Accent or Theme.SubText
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = 11
                    btn.LayoutOrder = i
                    btn.Parent = RockList
                    local _v4opdtp2xv4 = Instance.new(_S("107|192|180|174|218|221|217|208|221"))
                    _v4opdtp2xv4.CornerRadius = UDim.new(0, 5)
                    _v4opdtp2xv4.Parent = btn
                    btn.MouseButton1Click:Connect(function()
                        _vmax6nag1aa(rock.Part.Position)
                        _vv6vvad4d9h(_S("107|191|208|215|208|219|218|221|223|208|207|139|223|218|165|139") .. rock.Name)
                    end)
                end
            end
        end)
    end
end)

_vnqiki4fvlv.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        _v63jbp5gyvx.Enabled = not _v63jbp5gyvx.Enabled
        State.GUIHidden = not _v63jbp5gyvx.Enabled
        if _v63jbp5gyvx.Enabled then
            _vw5uhdt5rf2.Visible = true
            _v1hazk9pc0f.Visible = false
        end
    elseif input.KeyCode == Enum.KeyCode.F then
        _v7waz68vjhn.FlyEnabled = not _v7waz68vjhn.FlyEnabled
        if _v7waz68vjhn.FlyEnabled then _v1vyt4wih0r() else _vjnercdb1pz() end
        _vv6vvad4d9h(_S("103|173|211|224|161|135") .. (_v7waz68vjhn.FlyEnabled and _S("86|165|164") or _S("89|168|159|159")))
    elseif input.KeyCode == Enum.KeyCode.G then
        _v7waz68vjhn.AutoFarm = not _v7waz68vjhn.AutoFarm
        if _v7waz68vjhn.AutoFarm then _vmxf3w0runt() else _vg3ft1nprj0() end
        _vv6vvad4d9h(_S("69|134|186|185|180|101|139|166|183|178|127|101") .. (_v7waz68vjhn.AutoFarm and _S("103|182|181") or _S("90|169|160|160")))
    elseif input.KeyCode == Enum.KeyCode.H then
        _v7waz68vjhn.SmartLoop = not _v7waz68vjhn.SmartLoop
        if _v7waz68vjhn.SmartLoop then _v1yqj5byw0q() else _vjrd7o2l9jf() end
        _vv6vvad4d9h(_S("71|154|180|168|185|187|103|147|182|182|183|129|103") .. (_v7waz68vjhn.SmartLoop and _S("84|163|162") or _S("78|157|148|148")))
    elseif input.KeyCode == Enum.KeyCode.P and _v7waz68vjhn.PanicEnabled then
        _vb1z9ofns0r()
        _v63jbp5gyvx.Enabled = false
        State.GUIHidden = true
    end
end)

task.spawn(function()
    while true do
        task.wait(3)
        pcall(function()
            if _v7waz68vjhn.Tracers then _vfyh1s9eesc() end
            if _v7waz68vjhn.PlayerESP then _vwnlqp7zj6f() end
            if _v7waz68vjhn.ChestESP then _v0cz2jcife5() end
            if _v7waz68vjhn.HideOtherPlayers then _vlijjol47uc() end
            if _v7waz68vjhn.BypassPromptHold then _v19dcvsp9hu(_v92gucjek3x) end
        end)
    end
end)

_v9qqaid831c.CharacterAdded:Connect(function(char)
    Character = char
    _vqxyh6gcfta = char:WaitForChild(_S("122|194|239|231|219|232|233|227|222|204|233|233|238|202|219|236|238"))
    _vkhkeyt0oao = char:WaitForChild(_S("72|144|189|181|169|182|183|177|172"))
    _vv6vvad4d9h(_S("116|183|220|213|230|213|215|232|217|230|148|230|217|231|228|213|235|226|217|216"))

    task.delay(1, function()
        if _v7waz68vjhn.SpeedBoost then _vb0zw0tduye() end
        if _v7waz68vjhn.FlyEnabled then _vjnercdb1pz() _v1vyt4wih0r() end
        if _v7waz68vjhn.InfiniteJump then _v9iyu3x3m2k() _vkhvmp0vzuf() end
        if _v7waz68vjhn.AutoEquipPickaxe then _v4l7y64k05o() end
        if _v7waz68vjhn.AutoFarm and not State.FarmConnection then _vmxf3w0runt() end
        if _v7waz68vjhn.SmartLoop and not State.SmartLoopConn then _v1yqj5byw0q() end
        if _v7waz68vjhn.WarmthKeeper or _v7waz68vjhn.StaminaKeeper then _vyknuy031k5() end
    end)
end)

_v9qqaid831c.CharacterRemoving:Connect(function()
    if _v7waz68vjhn.AutoRespawn then
        task.delay(3, function()
            pcall(function()
                if not _v9qqaid831c.Character then
                    Exec.LoadCharacter()
                end
            end)
        end)
    end
end)

if _vhr6gh6h8s0 then
    _vhr6gh6h8s0:GetPropertyChangedSignal(_S("125|211|230|226|244|237|236|239|241|208|230|247|226")):Connect(function()
        local _vjmzg0q7k7n = _vhr6gh6h8s0.ViewportSize
        local isMob = _vjmzg0q7k7n.X < 800
        _vwwfao1t8dm = isMob and UDim2.new(0, 340, 0, 420) or UDim2.new(0, 700, 0, 440)
        if not State.IsMinimized then
            _vw5uhdt5rf2.Size = _vwwfao1t8dm
        end
        _vc29xemk97d.TextSize = isMob and 13 or 15
    end)
end

Exec.SetSimRadius()

pcall(function()
    _vv6vvad4d9h(_S("61|138|166|171|162|158|93|138|172|178|171|177|158|166|171|93|179|116|93|169|172|158|161|162|161|93|172|171|93") .. Exec.Name)
    _vv6vvad4d9h(_S("78|147|198|179|177|195|194|189|192|110|143|158|151|193|136|110|150|162|162|158|139") .. tostring(Exec.Request ~= nil) .. _S("74|106|146|185|185|181|135") .. tostring(Exec.HasHookMeta) .. _S("108|140|175|216|213|207|215|169") .. tostring(Exec.HasFireClick))
    _vv6vvad4d9h(_S("67|149|172|170|171|183|150|171|172|169|183|99|128|99|138|152|140|99|191|99|134|164|166|171|168|99|181|168|176|178|183|168|182|99|169|172|181|182|183|100"))
    _v19dcvsp9hu(_v92gucjek3x)
end)

task.delay(3, function()
    pcall(_v9ohaz27yl5)
end)
