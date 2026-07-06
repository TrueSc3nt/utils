--[[ Minea v7 protected | TrueSc3nt ]]
local _S=function(s)local o=tonumber(s:match("^(%d+)%|"))local r=""for c in s:gmatch("(%d+)")do local n=tonumber(c)-o;if n>0 then r=r..string.char(n)end end;return r end
if false then local _j1ppya2zc=0 end
local _v581eeprxvz = game:GetService(_S("72|152|180|169|193|173|186|187"))
local _vwdjigbauma = game:GetService(_S("100|182|201|212|208|205|199|197|216|201|200|183|216|211|214|197|203|201"))
local _vni9dzwsam5 = game:GetService(_S("108|195|219|222|215|223|220|205|207|209"))
local _vdwtr2fwsxq = game:GetService(_S("111|193|228|221|194|212|225|229|216|210|212"))
local _vbksmzikq46 = game:GetService(_S("90|174|209|191|191|200|173|191|204|208|195|189|191"))
local _vyqj56q1cez = game:GetService(_S("101|186|216|202|215|174|211|213|218|217|184|202|215|219|206|200|202"))
local HttpService = game:GetService(_S("73|145|189|189|185|156|174|187|191|178|172|174"))
local _v526y6dm742 = game:GetService(_S("81|164|197|178|195|197|182|195|152|198|186"))
local _vgknonsic2y = game:GetService(_S("83|159|188|186|187|199|188|193|186"))
local _vx8xddv5dy3 = game:GetService(_S("104|188|205|212|205|216|215|218|220|187|205|218|222|209|203|205"))
local _v8wnd36qiio = game:GetService(_S("83|150|194|191|191|184|182|199|188|194|193|166|184|197|201|188|182|184"))

local _vudw9qq35re = _v581eeprxvz.LocalPlayer
if not _vudw9qq35re then
    _vudw9qq35re = _v581eeprxvz.PlayerAdded:Wait()
end
local Character = _vudw9qq35re.Character or _vudw9qq35re.CharacterAdded:Wait()
local _vqzsv3795w7 = Character:WaitForChild(_S("100|172|217|209|197|210|211|205|200|182|211|211|216|180|197|214|216"))
local _vktnt2yiuxx = Character:WaitForChild(_S("130|202|247|239|227|240|241|235|230"))

local _v0boleg0gr6 = {
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
    WebhookURL = _S("105|"),
    WebhookEnabled = false,
    WebhookFarm = true,
    WebhookSell = true,
    WebhookStats = true,

    SmartLoop = false,
    OreFilterEnabled = false,
    OreFilter = _S("69|169|174|166|178|180|179|169|113|183|186|167|190|113|172|180|177|169|113|170|178|170|183|166|177|169|113|184|166|181|181|173|174|183|170|113|184|185|166|183|184|166|181|181|173|174|183|170|113|181|177|166|185|174|179|186|178"),
    OreBlacklist = _S("64|163|175|161|172|108|179|180|175|174|165|108|178|175|163|171"),
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
    PromoCode = _S("75|"),

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
    CustomRemoteName = _S("98|"),
    CustomRemoteArgs = _S("105|"),

    ServerHopInterval = 0,
    PanicEnabled = true,
}

local LogList, ShopList, RockList, RemoteSpyList, CashLabel, _v6oxy9cn8oo

local State = {
    FarmConnection = nil,
    SellConnection = nil,
    ESPConnections = {},
    AntiDamageConn = nil,
    NoclipConn = nil,
    FlyConn = nil,
    UpgradeConn = nil,
    IsMinimized = false,
    CurrentTarget = _S("122|200|233|232|223"),
    FarmCount = 0,
    SellCount = 0,
    DupeCount = 0,
    UpgradeCount = 0,
    TotalEarnings = 0,
    Logs = {},
    ESPHighlights = {},
    RemoteCache = {},
    TabOpen = _S("78|148|175|192|187"),
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
        for i = 1, select(_S("78|113"), ...) do
            local v = select(i, ...)
            if v ~= nil then return v end
        end
    end

    Exec.Unpack = table.unpack or unpack
    Exec.Name = _S("115|200|225|222|225|226|234|225")
    pcall(function()
        if identifyexecutor then
            Exec.Name = identifyexecutor()
        elseif EXECUTOR_NAME then
            Exec.Name = EXECUTOR_NAME
        elseif syn then
            Exec.Name = _S("114|197|235|224|211|226|229|215")
        elseif KRNL_LOADED then
            Exec.Name = _S("95|170|177|173|171")
        elseif Fluxus then
            Exec.Name = _S("74|144|182|191|194|191|189")
        elseif delta then
            Exec.Name = _S("67|135|168|175|183|164")
        end
    end)

    Exec.SafeCClosure = newcclosure or newlclosure or function(f) return f end
    Exec.GetNamecallMethod = getnamecallmethod or getcallmethod or function() return _S("92|") end
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
            local cg = game:GetService(_S("81|148|192|195|182|152|198|186"))
            if cloneref then cg = cloneref(cg) end
            parent = cg
        end)
        if parent then return parent end
        return _vudw9qq35re:WaitForChild(_S("126|206|234|223|247|227|240|197|243|231"))
    end

    Exec.HttpGet = function(url)
        local ok, result = pcall(function() return game:HttpGet(url) end)
        if ok and result then return result end
        if Exec.Request then
            local res = Exec.Request({Url = url, Method = _S("118|189|187|202")})
            if type(res) == _S("73|189|170|171|181|174") then
                return res.Body or res.body or res.BodyText
            end
        end
        return HttpService:GetAsync(url)
    end

    Exec.Post = function(url, body, contentType)
        contentType = contentType or _S("95|192|207|207|203|200|194|192|211|200|206|205|142|201|210|206|205")
        if Exec.Request then
            return Exec.Request({
                Url = url,
                Method = _S("118|198|197|201|202"),
                Headers = {[_S("84|151|195|194|200|185|194|200|129|168|205|196|185")] = contentType},
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
            elseif _vudw9qq35re.LoadCharacter then _vudw9qq35re:LoadCharacter() end
        end)
    end

    Exec.SetSimRadius = function()
        pcall(function()
            if setsimulationradius then setsimulationradius(1e9, 1e9) end
        end)
        pcall(function()
            if sethiddenproperty then
                sethiddenproperty(_vudw9qq35re, _S("85|168|190|194|202|193|182|201|190|196|195|167|182|185|190|202|200"), 1e9)
                sethiddenproperty(_vudw9qq35re, _S("109|186|206|229|192|214|218|226|217|206|225|214|220|219|191|206|209|214|226|224"), 1e9)
            end
        end)
    end

    local _v1v66vmts0v = {}
    local _v29mkcyly69 = nil
    local _vhj0b513djp = false

    function Exec.OnNamecall(fn)
        table.insert(_v1v66vmts0v, fn)
        if not _vhj0b513djp and Exec.HasHookMeta then
            _vhj0b513djp = true
            pcall(function()
                _v29mkcyly69 = hookmetamethod(game, _S("95|190|190|205|192|204|196|194|192|203|203"), Exec.SafeCClosure(function(self, ...)
                    local method = Exec.GetNamecallMethod()
                    local args = {...}
                    for _, hook in ipairs(_v1v66vmts0v) do
                        local block, ret = hook(self, method, args)
                        if block then return ret end
                    end
                    return _v29mkcyly69(self, ...)
                end))
            end)
        end
    end

    Exec.NamecallHooks = _v1v66vmts0v

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

local _v1chfeijrmq = false

pcall(function()
    if Exec.HasHookMeta and Exec.GetNamecallMethod then
        Exec.OnNamecall(function(self, method, args)

            if _v1chfeijrmq and (method == _S("71|141|176|185|172|154|172|185|189|172|185") or method == _S("102|175|212|220|213|209|203|185|203|216|220|203|216")) then
                if self:IsA(_S("67|149|168|176|178|183|168|136|185|168|177|183")) or self:IsA(_S("99|181|200|208|210|215|200|169|216|209|198|215|204|210|209")) then
                    pcall(function() _vf05m7wa9z5(self.Name, method, args) end)
                end
            end

            if method == _S("94|169|199|193|201") and self == _vudw9qq35re then
                return true, nil
            end

            if method == _S("104|174|209|214|204|187|205|218|222|209|203|205") then
                local svc = args[1]
                if svc == _S("103|172|223|215|211|214|208|219|186|204|217|221|208|202|204") or svc == _S("92|159|196|193|189|208|175|193|206|210|197|191|193") then
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
            local _v5prskm51uy = hookmetamethod(game, _S("108|203|203|213|218|208|209|228"), Exec.SafeCClosure(function(self, key)
                if _vktnt2yiuxx and self == _vktnt2yiuxx then
                    if key == _S("110|197|207|218|217|193|222|211|211|210") and _v0boleg0gr6.SpeedBoost then return 16 end
                    if key == _S("105|179|222|214|217|185|216|224|206|219") and _v0boleg0gr6.JumpPower > 50 then return 50 end
                end
                return _v5prskm51uy(self, key)
            end))
        end)
        pcall(function()
            local _vnxyw8d2ml0 = hookmetamethod(game, _S("69|164|164|179|170|188|174|179|169|170|189"), Exec.SafeCClosure(function(self, key, value)
                if _vktnt2yiuxx and self == _vktnt2yiuxx then
                    if key == _S("123|210|220|231|230|206|235|224|224|223") and _v0boleg0gr6.SpeedBoost then
                        return _vnxyw8d2ml0(self, key, _v0boleg0gr6.WalkSpeed)
                    end
                end
                return _vnxyw8d2ml0(self, key, value)
            end))
        end)
    end
end

local function _vwnfy35wc3s()
    Character = _vudw9qq35re.Character
    if Character then
        _vqzsv3795w7 = Character:FindFirstChild(_S("105|177|222|214|202|215|216|210|205|187|216|216|221|185|202|219|221"))
        _vktnt2yiuxx = Character:FindFirstChild(_S("69|141|186|178|166|179|180|174|169"))
    end
    return Character and _vqzsv3795w7 and _vktnt2yiuxx
end

local function _vui69yjfcls(part)
    if not _vwnfy35wc3s() then return math.huge end
    return (_vqzsv3795w7.Position - part.Position).Magnitude
end

local function _vgxe7cwo18s(position)
    if not _vwnfy35wc3s() then return false end
    local _vlu7yuzcf25 = CFrame.new(position + Vector3.new(0, 3, 0))
    if _v0boleg0gr6.TweenTeleport then
        local dist = (_vqzsv3795w7.Position - position).Magnitude
        local dur = math.clamp(dist / _v0boleg0gr6.TweenTeleportSpeed, 0.08, 2.5)
        _vbksmzikq46:Create(_vqzsv3795w7, TweenInfo.new(dur, Enum.EasingStyle.Linear), {CFrame = _vlu7yuzcf25}):Play()
        task.wait(dur)
    else
        _vqzsv3795w7.CFrame = _vlu7yuzcf25
        task.wait(_v0boleg0gr6.TeleportDelay)
    end
    return true
end

local function _vpu8yblb7ij(str)
    local list = {}
    for part in string.gmatch(string.lower(str or _S("80|")), _S("106|197|200|150|143|221|199|149")) do
        table.insert(list, part)
    end
    return list
end

local function _vi8e4ae4f7j(_vpg6fk7h49d)
    if not _v0boleg0gr6.OreFilterEnabled then return true end
    local _vy5itbl64p9 = _vpu8yblb7ij(_v0boleg0gr6.OreBlacklist)
    for _, word in ipairs(_vy5itbl64p9) do
        if string.find(_vpg6fk7h49d, word, 1, true) then return false end
    end
    local _v0run8puvng = _vpu8yblb7ij(_v0boleg0gr6.OreFilter)
    if #_v0run8puvng == 0 then return true end
    for _, word in ipairs(_v0run8puvng) do
        if string.find(_vpg6fk7h49d, word, 1, true) then return true end
    end
    return false
end

local function _v2pk2qa0xxu(_v27wchai28g)
    local _vlnywpawei1 = _vudw9qq35re:FindFirstChild(_S("115|223|216|212|215|216|229|230|231|212|231|230"))
    if not _vlnywpawei1 then return 0 end
    for _, stat in ipairs(_vlnywpawei1:GetChildren()) do
        local n = string.lower(stat.Name)
        for _, p in ipairs(_v27wchai28g) do
            if string.find(n, p) and stat:IsA(_S("61|147|158|169|178|162|127|158|176|162")) then
                return stat.Value
            end
        end
    end
    return 0
end

local function _vefflc828k2()
    return _v2pk2qa0xxu({_S("98|197|195|213|202"), _S("83|192|194|193|184|204"), _S("82|181|193|187|192"), _S("88|191|199|196|188"), _S("77|175|174|185|174|187|176|178"), _S("83|181|200|182|190|198")})
end

local function _vt34emstibn()
    return _v2pk2qa0xxu({_S("104|223|205|209|207|208|220"), _S("104|203|201|218|218|225"), _S("76|183|179"), _S("121|229|232|218|221"), _S("70|168|167|169|177|182|167|169|177")})
end

local function _v3l5jm5jkyq()
    local cap = _v2pk2qa0xxu({_S("69|168|166|181|166|168|174|185|190"), _S("68|177|165|188|167|165|182|182|189"), _S("61|170|158|181"), _S("84|192|189|193|189|200"), _S("86|184|183|185|193|198|183|185|193")})
    if cap > 0 then return cap end
    local obj = _vudw9qq35re:FindFirstChild(_S("103|169|200|202|210|215|200|202|210|170|200|215|200|202|208|219|224")) or _vudw9qq35re:FindFirstChild(_S("80|157|177|200|147|177|194|194|201"))
    if obj and obj:IsA(_S("61|147|158|169|178|162|127|158|176|162")) then return obj.Value end
    return 100
end

local function _v9bmq9tepiv()
    if _v0boleg0gr6.UnlimitedBackpack then return false end
    local _vx6a8s00jaw = _vt34emstibn()
    local cap = _v3l5jm5jkyq()
    if cap > 0 and _vx6a8s00jaw > 0 then return _vx6a8s00jaw >= cap * 0.92 end
    return false
end

local function _ve9naqto4ue(root)
    if not _v0boleg0gr6.BypassPromptHold or not root then return end
    pcall(function()
        for _, d in ipairs(root:GetDescendants()) do
            if d:IsA(_S("98|178|212|209|218|203|207|203|214|219|178|212|209|207|210|214")) then
                d.HoldDuration = 0
                d.MaxActivationDistance = math.max(d.MaxActivationDistance, 20)
            end
        end
    end)
end

local function _voalq60ytij()
    if not _v0boleg0gr6.AutoEquipPickaxe then return end
    pcall(function()
        local bestTool, bestScore = nil, -1
        local function _vb3ow4f0zc7(tool)
            if not tool:IsA(_S("119|203|230|230|227")) then return -1 end
            local n = string.lower(tool.Name)
            if not (string.find(n, _S("110|222|215|209|217")) or string.find(n, _S("109|206|229|210")) or string.find(n, _S("95|195|209|200|203|203")) or string.find(n, _S("120|236|231|231|228")) or string.find(n, _S("89|193|186|198|198|190|203"))) then
                return 0
            end
            local s = 0
            if string.find(n, _S("95|195|200|192|204|206|205|195")) then s = s + 100
            elseif string.find(n, _S("83|186|194|191|183")) then s = s + 80
            elseif string.find(n, _S("104|209|218|215|214")) then s = s + 50
            elseif string.find(n, _S("69|184|185|180|179|170")) then s = s + 20 end
            for _, d in ipairs(tool:GetDescendants()) do
                if d:IsA(_S("109|195|206|217|226|210|175|206|224|210")) and (string.find(string.lower(d.Name), _S("117|225|218|235|218|225")) or string.find(string.lower(d.Name), _S("80|196|185|181|194"))) then
                    s = s + d.Value * 10
                end
            end
            return s
        end
        local function scan(container)
            if not container then return end
            for _, t in ipairs(container:GetChildren()) do
                local sc = _vb3ow4f0zc7(t)
                if sc > bestScore then bestScore, bestTool = sc, t end
            end
        end
        scan(_vudw9qq35re.Backpack)
        scan(Character)
        if bestTool and Character and not Character:FindFirstChild(bestTool.Name) then
            _vktnt2yiuxx:EquipTool(bestTool)
        end
    end)
end

local function _vo4pt5bxps2()
    local drops = {}
    local _v27wchai28g = {_S("63|163|177|174|175"), _S("100|208|211|211|216"), _S("95|200|211|196|204"), _S("102|214|207|201|209|219|214"), _S("103|202|214|211|211|204|202|219"), _S("119|230|233|220"), _S("85|188|186|194"), _S("116|215|230|237|231|232|213|224")}
    local function scan(parent)
        for _, child in ipairs(parent:GetChildren()) do
            local nl = string.lower(child.Name)
            if child:IsA(_S("122|188|219|237|223|202|219|236|238")) or child:IsA(_S("111|188|222|211|212|219")) then
                for _, p in ipairs(_v27wchai28g) do
                    if string.find(nl, p) then
                        local part = child:IsA(_S("119|185|216|234|220|199|216|233|235")) and child or child:FindFirstChildWhichIsA(_S("96|162|193|211|197|176|193|210|212"))
                        if part then
                            local dist = _vui69yjfcls(part)
                            if dist <= _v0boleg0gr6.FarmRadius then
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
    scan(_vni9dzwsam5)
    table.sort(drops, function(a, b) return a.Distance < b.Distance end)
    return drops
end

local function _v18tymw5j2o()
    if not _v0boleg0gr6.AutoCollectDrops then return end
    local drops = _vo4pt5bxps2()
    for i = 1, math.min(3, #drops) do
        local drop = drops[i]
        _vgxe7cwo18s(drop.Part.Position)
        if HasFireTouch then
            Exec.FireTouch(_vqzsv3795w7, drop.Part, 0)
            task.wait(0.01)
            Exec.FireTouch(_vqzsv3795w7, drop.Part, 1)
        end
        _vy1k1bkblg5(_S("127|239|232|226|234|244|239"))
        _vy1k1bkblg5(_S("85|184|196|193|193|186|184|201"))
        _vy1k1bkblg5(_S("103|211|214|214|219"))
    end
end

local function _vswxglooah6()
    if _v0boleg0gr6.AutoBuyPickaxe then
        _vy1k1bkblg5(_S("69|181|174|168|176|166|189|170")); _vy1k1bkblg5(_S("72|170|189|193|167|184|177|171|179|169|192|173")); _vy1k1bkblg5(_S("126|243|238|229|240|223|226|227|221|238|231|225|233|223|246|227"))
    end
    if _v0boleg0gr6.AutoBuyBackpack then
        _vy1k1bkblg5(_S("82|180|179|181|189|194|179|181|189")); _vy1k1bkblg5(_S("87|186|184|199|184|186|192|203|208")); _vy1k1bkblg5(_S("94|211|206|197|208|191|194|195|189|192|191|193|201|206|191|193|201"))
    end
    if _v0boleg0gr6.AutoBuyLuck then
        _vy1k1bkblg5(_S("116|224|233|215|223")); _vy1k1bkblg5(_S("116|216|221|219|211|224|233|215|223")); _vy1k1bkblg5(_S("79|187|196|178|186|200"))
    end
    if _v0boleg0gr6.AutoBuyWarmth then
        _vy1k1bkblg5(_S("98|217|195|212|207|214|202")); _vy1k1bkblg5(_S("81|185|182|178|197")); _vy1k1bkblg5(_S("87|186|184|196|199|189|192|201|188"))
    end
    if _v0boleg0gr6.AutoUpgrade then
        _vy1k1bkblg5(_S("86|203|198|189|200|183|186|187")); _vy1k1bkblg5(_S("124|222|241|245")); _vy1k1bkblg5(_S("110|222|227|224|209|214|207|225|211"))
    end
end

local function _v0pzi33l53w()
    if not _v0boleg0gr6.AutoRebirth then return end
    if _vefflc828k2() >= _v0boleg0gr6.RebirthCashThreshold then
        _vy1k1bkblg5(_S("129|243|230|227|234|243|245|233")); _vy1k1bkblg5(_S("88|200|202|189|203|204|193|191|189")); _vy1k1bkblg5(_S("95|209|196|210|196|211")); _vy1k1bkblg5(_S("81|178|196|180|182|191|181"))
        _vr7cusucn10(_S("66|131|183|182|177|98|180|167|164|171|180|182|170|98|163|182|182|167|175|178|182|167|166|98|163|182|98") .. _vefflc828k2() .. _S("78|110|177|175|193|182"))
    end
end

local function _va932p0e0eg()
    if not _v0boleg0gr6.AutoClaimDaily then return end
    _vy1k1bkblg5(_S("64|164|161|169|172|185")); _vy1k1bkblg5(_S("93|207|194|212|190|207|193")); _vy1k1bkblg5(_S("92|191|200|189|197|201")); _vy1k1bkblg5(_S("64|172|175|167|169|174"))
    _vy1k1bkblg5(_S("104|203|215|204|205")); _vy1k1bkblg5(_S("111|225|212|211|212|212|220"))
    if _v0boleg0gr6.PromoCode ~= _S("81|") then
        _vy1k1bkblg5(_S("125|224|236|225|226"), _v0boleg0gr6.PromoCode)
        _vy1k1bkblg5(_S("109|223|210|209|210|210|218"), _v0boleg0gr6.PromoCode)
    end
end

local function _v6j7kx0uulv()
    if _v9bmq9tepiv() and _v0boleg0gr6.SellWhenFull then return true end
    if _v0boleg0gr6.SellMinCash > 0 and _vefflc828k2() >= _v0boleg0gr6.SellMinCash then return true end
    return false
end

local function _vob6o6zcmt3()
    _vr7cusucn10(_S("127|195|241|238|239|159|227|244|239|228|185|159|239|232|226|234|244|239|159|242|239|224|236|173|173|173"))
    pcall(function()
        local tool = Character and Character:FindFirstChildOfClass(_S("99|183|210|210|207"))
        if tool then
            tool.Parent = _vudw9qq35re.Backpack
            task.wait(0.1)
            _vktnt2yiuxx:EquipTool(tool)
        end
        for i = 1, _v0boleg0gr6.DupeAmount do
            _vy1k1bkblg5(_S("93|193|207|204|205")); _vy1k1bkblg5(_S("94|206|199|193|201|211|206")); _vy1k1bkblg5(_S("98|197|209|206|206|199|197|214"))
            task.wait(0.05)
        end
    end)
end

local function _vt6o6qnrq4a(cframe)
    if not _vwnfy35wc3s() then return false end
    _vqzsv3795w7.CFrame = cframe + Vector3.new(0, 3, 0)
    task.wait(_v0boleg0gr6.TeleportDelay)
    return true
end

local function _v60o6fmnvwr(scrollingFrame)
    for _, child in ipairs(scrollingFrame:GetChildren()) do
        if not child:IsA(_S("112|197|185|188|217|227|228|188|209|233|223|229|228")) and not child:IsA(_S("98|183|171|178|195|198|198|203|208|201")) then
            child:Destroy()
        end
    end
end

local function _vr7cusucn10(message)
    local _vda5872me5u = os.date(_S("76|113|148|134|113|153|134|113|159"))
    table.insert(State.Logs, 1, _S("103|194") .. _vda5872me5u .. _S("98|191|130") .. message)
    if #State.Logs > 50 then
        table.remove(State.Logs)
    end
    if LogList then
        pcall(function()
            _v60o6fmnvwr(LogList)
            for i, log in ipairs(State.Logs) do
                if i > 15 then break end
                local label = Instance.new(_S("61|145|162|181|177|137|158|159|162|169"))
                label.Size = UDim2.new(1, 0, 0, 18)
                label.BackgroundTransparency = 1
                label.Text = log
                label.TextColor3 = Color3.fromRGB(200, 200, 200)
                label.TextXAlignment = Enum.TextXAlignment.Left
                label.Font = Enum.Font.Gotham
                label.TextSize = 11
                label.LayoutOrder = i
                label.Parent = LogList
            end
        end)
    end
end

local function _vui0mhnvd62()
    State.RemoteCache = {}
    pcall(function()
        for _, remote in ipairs(_vwdjigbauma:GetDescendants()) do
            if remote:IsA(_S("127|209|228|236|238|243|228|196|245|228|237|243")) or remote:IsA(_S("65|147|166|174|176|181|166|135|182|175|164|181|170|176|175")) then
                table.insert(State.RemoteCache, {
                    Instance = remote,
                    Name = remote.Name,
                    Type = remote.ClassName,
                })
            end
        end
    end)
    _vr7cusucn10(_S("76|143|173|175|180|177|176|108") .. #State.RemoteCache .. _S("129|161|243|230|238|240|245|230|244"))
end

local function _vy1k1bkblg5(namePattern, ...)
    local args = {...}
    for _, remote in ipairs(State.RemoteCache) do
        local rName = string.lower(remote.Name)
        local _v4xm7t0l1yv = string.lower(namePattern)
        if string.find(rName, _v4xm7t0l1yv) then
            pcall(function()
                if remote.Type == _S("71|153|172|180|182|187|172|140|189|172|181|187") then
                    remote.Instance:FireServer(Exec.Unpack(args))
                elseif remote.Type == _S("105|187|206|214|216|221|206|175|222|215|204|221|210|216|215") then
                    remote.Instance:InvokeServer(Exec.Unpack(args))
                end
            end)
        end
    end
end

local function _vokpez8uavz(name, ...)
    local args = {...}
    for _, remote in ipairs(State.RemoteCache) do
        if remote.Name == name then
            pcall(function()
                if remote.Type == _S("82|164|183|191|193|198|183|151|200|183|192|198") then
                    remote.Instance:FireServer(Exec.Unpack(args))
                elseif remote.Type == _S("109|191|210|218|220|225|210|179|226|219|208|225|214|220|219") then
                    remote.Instance:InvokeServer(Exec.Unpack(args))
                end
            end)
            return true
        end
    end
    return false
end

local _vks80qokiai = {
    _S("108|222|219|207|215"), _S("83|194|197|184"), _S("118|233|234|229|228|219"), _S("129|238|234|239|230|243|226|237"), _S("116|215|230|237|231|232|213|224"), _S("60|163|161|169"), _S("106|205|217|203|214"), _S("88|193|202|199|198"),
    _S("86|189|197|194|186"), _S("78|178|183|175|187|189|188|178"), _S("60|159|171|172|172|161|174"), _S("60|175|165|168|178|161|174"), _S("77|191|194|175|198"), _S("114|215|223|215|228|211|222|214"), _S("62|177|159|174|174|166|167|176|163"),
    _S("74|171|183|175|190|178|195|189|190"), _S("81|191|192|181|182"), _S("66|184|167|171|176"), _S("81|181|182|193|192|196|186|197"), _S("73|171|184|190|181|173|174|187"), _S("93|208|209|190|207|208|190|205|205|197|198|207|194"),
    _S("74|190|185|186|171|196"), _S("68|179|180|165|176"), _S("122|234|223|219|236|230"), _S("72|178|169|172|173"), _S("70|183|187|167|184|186|192"), _S("67|178|165|182|172|167|172|164|177"), _S("71|179|168|183|176|186"),
    _S("111|220|216|227|215|225|216|219"), _S("103|219|208|219|200|213|208|220|212"), _S("61|173|169|158|177|166|171|178|170"), _S("128|240|229|242|233|228|239|244"), _S("64|186|169|178|163|175|174"), _S("95|198|192|209|205|196|211"),
    _S("103|200|216|220|200|212|200|217|208|213|204"), _S("61|160|166|177|175|166|171|162"), _S("65|181|162|175|187|162|175|170|181|166"), _S("94|203|205|205|204|209|210|205|204|195"), _S("74|189|191|184|189|190|185|184|175"),
    _S("87|185|195|198|198|187|202|203|198|197|188"), _S("73|184|183|194|193"), _S("115|231|226|232|229|224|212|223|220|225|216"), _S("111|226|223|216|221|212|219"), _S("87|185|188|201|208|195"), _S("122|221|226|219|230|221|223|222|233|232|243"),
}

local function _v9c3jduvi10()
    local rocks = {}
    local function _vc5znbtvuus(parent)
        if not parent then return end
        for _, child in ipairs(parent:GetChildren()) do
            local _vpg6fk7h49d = string.lower(child.Name)
            if child:IsA(_S("87|153|184|202|188|167|184|201|203")) or child:IsA(_S("107|184|218|207|208|215")) then
                local _vt2ie14idt3 = false
                for _, _v4xm7t0l1yv in ipairs(_vks80qokiai) do
                    if string.find(_vpg6fk7h49d, _v4xm7t0l1yv) then
                        _vt2ie14idt3 = true
                        break
                    end
                end
                if _vt2ie14idt3 and _vi8e4ae4f7j(_vpg6fk7h49d) then
                    local part = child:IsA(_S("99|165|196|214|200|179|196|213|215")) and child or child:FindFirstChildWhichIsA(_S("63|129|160|178|164|143|160|177|179"))
                    if part then
                        local dist = _vui69yjfcls(part)
                        if dist <= _v0boleg0gr6.FarmRadius then

                            local value = 0
                            pcall(function()
                                local val = child:FindFirstChild(_S("116|202|213|224|233|217")) or child:FindFirstChild(_S("112|192|226|217|211|213")) or child:FindFirstChild(_S("94|181|205|208|210|198")) or child:FindFirstChild(_S("77|163|174|185|194|178|156|195|178|191|191|182|177|178"))
                                if val and val:IsA(_S("88|174|185|196|205|189|154|185|203|189")) then
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
                    _vc5znbtvuus(child)
                end
            end
        end
    end

    local _vm6yeq4eb7p = {
        _vni9dzwsam5:FindFirstChild(_S("127|209|238|226|234|242")),
        _vni9dzwsam5:FindFirstChild(_S("127|206|241|228|242")),
        _vni9dzwsam5:FindFirstChild(_S("60|137|165|170|161|174|157|168|175")),
        _vni9dzwsam5:FindFirstChild(_S("69|146|174|179|170|184")),
        _vni9dzwsam5:FindFirstChild(_S("68|150|169|183|179|185|182|167|169|183")),
        _vni9dzwsam5:FindFirstChild(_S("90|167|187|202")),
        _vni9dzwsam5:FindFirstChild(_S("116|200|217|230|230|213|221|226")),
        _vni9dzwsam5:FindFirstChild(_S("118|185|232|239|233|234|215|226|233")),
        _vni9dzwsam5:FindFirstChild(_S("99|176|210|216|209|215|196|204|209")),
        _vni9dzwsam5,
    }

    for _, area in ipairs(_vm6yeq4eb7p) do
        if area then
            _vc5znbtvuus(area)
        end
    end

    if _v0boleg0gr6.PriorityHighestValue then
        table.sort(rocks, function(a, b) return a.Value > b.Value end)
    elseif _v0boleg0gr6.PriorityClosest then
        table.sort(rocks, function(a, b) return a.Distance < b.Distance end)
    end

    return rocks
end

local function _vdiud8l85fq()
    local shops = {}
    local function _vq6ypiuo4rp(parent)
        if not parent then return end
        for _, child in ipairs(parent:GetChildren()) do
            local _vpg6fk7h49d = string.lower(child.Name)
            if child:IsA(_S("92|169|203|192|193|200")) or child:IsA(_S("73|139|170|188|174|153|170|187|189")) then
                if string.find(_vpg6fk7h49d, _S("105|220|209|216|217")) or string.find(_vpg6fk7h49d, _S("130|245|231|238|238")) or
                   string.find(_vpg6fk7h49d, _S("96|211|212|207|210|197")) or string.find(_vpg6fk7h49d, _S("109|218|210|223|208|213|206|219|225")) or
                   string.find(_vpg6fk7h49d, _S("76|192|190|173|176|177|190")) or string.find(_vpg6fk7h49d, _S("61|161|162|158|169|162|175")) or
                   string.find(_vpg6fk7h49d, _S("111|220|208|225|218|212|227")) or string.find(_vpg6fk7h49d, _S("78|196|179|188|178|189|192")) or
                   string.find(_vpg6fk7h49d, _S("122|221|219|237|226|227|223|236")) or string.find(_vpg6fk7h49d, _S("71|169|188|192|172|185")) or
                   string.find(_vpg6fk7h49d, _S("71|181|183|170")) or string.find(_vpg6fk7h49d, _S("116|215|213|231|220")) or
                   string.find(_vpg6fk7h49d, _S("87|191|198|196|188")) or string.find(_vpg6fk7h49d, _S("98|196|195|213|199")) or
                   string.find(_vpg6fk7h49d, _S("83|182|180|192|195")) then
                    local part = child:IsA(_S("111|177|208|226|212|191|208|225|227")) and child or child:FindFirstChildWhichIsA(_S("95|161|192|210|196|175|192|209|211")) or child:FindFirstChild(_S("126|198|243|235|223|236|237|231|226|208|237|237|242|206|223|240|242"))
                    if part then
                        local dist = _vui69yjfcls(part)
                        table.insert(shops, {
                            Instance = child,
                            Part = part,
                            Distance = dist,
                            Name = child.Name,
                        })
                    end
                end
                if #child:GetChildren() > 0 then
                    _vq6ypiuo4rp(child)
                end
            end
        end
    end

    _vq6ypiuo4rp(_vni9dzwsam5)
    table.sort(shops, function(a, b) return a.Distance < b.Distance end)
    return shops
end

local function _vbq9btuy6nn(rockData)
    local rock = rockData.Instance
    local part = rockData.Part

    if not rock or not rock.Parent then return false end

    _voalq60ytij()
    _ve9naqto4ue(rock)

    _vr7cusucn10(_S("114|191|219|224|219|224|217|172|146") .. rockData.Name)

    _vgxe7cwo18s(part.Position)
    task.wait(0.05)

    local function _vdq5gsizfda()

        if HasFireClick then
            local clickDetector = rock:FindFirstChildOfClass(_S("116|183|224|221|215|223|184|217|232|217|215|232|227|230")) or part:FindFirstChildOfClass(_S("109|176|217|214|208|216|177|210|225|210|208|225|220|223"))
            if clickDetector then Exec.FireClick(clickDetector) end
        end
        if HasFireProximity then
            local prompt = rock:FindFirstChildOfClass(_S("85|165|199|196|205|190|194|190|201|206|165|199|196|194|197|201")) or part:FindFirstChildOfClass(_S("118|198|232|229|238|223|227|223|234|239|198|232|229|227|230|234"))
            if prompt then
                if _v0boleg0gr6.BypassPromptHold then prompt.HoldDuration = 0 end
                Exec.FireProximity(prompt)
            end
        end
        if HasFireTouch then
            Exec.FireTouch(_vqzsv3795w7, part, 0)
            task.wait(0.01)
            Exec.FireTouch(_vqzsv3795w7, part, 1)
        end

        local tool = Character and Character:FindFirstChildOfClass(_S("103|187|214|214|211"))
        if tool then tool:Activate() end

        _vy1k1bkblg5(_S("86|195|191|196|187")); _vy1k1bkblg5(_S("84|188|181|198|202|185|199|200")); _vy1k1bkblg5(_S("94|193|205|202|202|195|193|210"))
        _vy1k1bkblg5(_S("124|222|238|225|221|231")); _vy1k1bkblg5(_S("65|168|162|181|169|166|179")); _vy1k1bkblg5(_S("69|169|174|172"))
        _vy1k1bkblg5(_S("105|217|210|204|212")); _vy1k1bkblg5(_S("130|245|249|235|240|233"))

        for _, remote in ipairs(State.RemoteCache) do
            local rName = string.lower(remote.Name)
            if string.find(rName, _S("61|170|166|171|162")) or string.find(rName, _S("72|172|177|175")) or string.find(rName, _S("106|210|203|220|224|207|221|222")) then
                pcall(function()
                    if remote.Type == _S("63|145|164|172|174|179|164|132|181|164|173|179") then
                        remote.Instance:FireServer(rock, part)
                    elseif remote.Type == _S("83|165|184|192|194|199|184|153|200|193|182|199|188|194|193") then
                        remote.Instance:InvokeServer(rock, part)
                    end
                end)
            end
        end
    end

    local hits = _v0boleg0gr6.RapidMine and _v0boleg0gr6.RapidMineCount or 1
    for _ = 1, hits do
        _vdq5gsizfda()
        if hits > 1 then task.wait(0.03) end
    end

    _v18tymw5j2o()
    State.FarmCount = State.FarmCount + 1
    pcall(function() _vqnugautdni(rockData.Name) end)

    return true
end

local function _vvtwdchtwpc(shopData)
    if not shopData then return false end

    local shop = shopData.Instance
    local part = shopData.Part

    _vr7cusucn10(_S("87|170|188|195|195|192|197|190|119|184|203|145|119") .. shopData.Name)

    _vgxe7cwo18s(part.Position)
    task.wait(0.1)

    if HasFireClick then
        local clickDetector = shop:FindFirstChildOfClass(_S("102|169|210|207|201|209|170|203|218|203|201|218|213|216")) or part:FindFirstChildOfClass(_S("99|166|207|204|198|206|167|200|215|200|198|215|210|213"))
        if clickDetector then Exec.FireClick(clickDetector) end
    end

    if HasFireProximity then
        local prompt = shop:FindFirstChildOfClass(_S("123|203|237|234|243|228|232|228|239|244|203|237|234|232|235|239")) or part:FindFirstChildOfClass(_S("67|147|181|178|187|172|176|172|183|188|147|181|178|176|179|183"))
        if prompt then Exec.FireProximity(prompt) end
    end

    if HasFireTouch then
        Exec.FireTouch(_vqzsv3795w7, part, 0)
        task.wait(0.01)
        Exec.FireTouch(_vqzsv3795w7, part, 1)
    end

    _vy1k1bkblg5(_S("63|178|164|171|171"))
    _vy1k1bkblg5(_S("125|240|229|236|237"))
    _vy1k1bkblg5(_S("78|187|175|192|185|179|194"))
    _vy1k1bkblg5(_S("99|215|213|196|199|200"))
    _vy1k1bkblg5(_S("93|192|190|208|197"))
    _vy1k1bkblg5(_S("74|183|185|184|175|195"))
    _vy1k1bkblg5(_S("85|200|186|193|193|182|193|193"))
    _vy1k1bkblg5(_S("97|212|198|205|205|192|194|205|205"))

    State.SellCount = State.SellCount + 1

    return true
end

local function _v9lpbo0nirm()
    if State.FarmConnection then return end
    _vr7cusucn10(_S("86|151|203|202|197|118|156|183|200|195|118|169|170|151|168|170|155|154"))

    State.FarmConnection = true
    task.spawn(function()
        while _v0boleg0gr6.AutoFarm and State.FarmConnection do
            if _vwnfy35wc3s() then
                local rocks = _v9c3jduvi10()
                if #rocks > 0 then
                    local _vqrwpfsjjad = rocks[1]
                    State.CurrentTarget = _vqrwpfsjjad.Name
                    _vbq9btuy6nn(_vqrwpfsjjad)
                else
                    State.CurrentTarget = _S("86|169|187|183|200|185|190|191|196|189|132|132|132")
                end
            end
            task.wait(_v0boleg0gr6.FarmDelay)
        end
    end)
end

local function _vjvdni0h55i()
    State.FarmConnection = nil
    State.CurrentTarget = _S("74|152|185|184|175")
    _vr7cusucn10(_S("129|194|246|245|240|161|199|226|243|238|161|212|213|208|209|209|198|197"))
end

local function _v6fno2723ag()
    if State.SellConnection then return end
    _vr7cusucn10(_S("112|177|229|228|223|144|195|213|220|220|144|195|196|177|194|196|181|180"))

    State.SellConnection = true
    task.spawn(function()
        while _v0boleg0gr6.AutoSell and State.SellConnection do
            if _vwnfy35wc3s() then
                local _v22ra2cqycj = true
                if _v0boleg0gr6.SellWhenFull and not _v9bmq9tepiv() then _v22ra2cqycj = false end
                if _v0boleg0gr6.SellMinCash > 0 and _vefflc828k2() < _v0boleg0gr6.SellMinCash then _v22ra2cqycj = false end
                if _v22ra2cqycj then
                    local shops = _vdiud8l85fq()
                    if #shops > 0 then
                        _vvtwdchtwpc(shops[1])
                        pcall(_vldc01eci5h)
                    end
                end
            end
            task.wait(_v0boleg0gr6.SellDelay)
        end
    end)
end

local function _v79fac7g8tn()
    State.SellConnection = nil
    _vr7cusucn10(_S("77|142|194|193|188|109|160|178|185|185|109|160|161|156|157|157|146|145"))
end

local function _vdyz378ekxg()
    if State.UpgradeConn then return end
    _vr7cusucn10(_S("127|192|244|243|238|159|212|239|230|241|224|227|228|159|210|211|192|209|211|196|195"))

    State.UpgradeConn = true
    task.spawn(function()
        while _v0boleg0gr6.AutoUpgrade and State.UpgradeConn do
            _vy1k1bkblg5(_S("127|244|239|230|241|224|227|228"))
            _vy1k1bkblg5(_S("129|227|246|250"))
            _vy1k1bkblg5(_S("124|236|241|238|223|228|221|239|225"))
            _vy1k1bkblg5(_S("106|225|203|220|215|222|210"))
            _vy1k1bkblg5(_S("69|181|174|168|176|166|189|170"))
            _vy1k1bkblg5(_S("74|172|171|173|181|186|171|173|181"))
            _vy1k1bkblg5(_S("107|222|219|208|208|207"))
            _vy1k1bkblg5(_S("78|178|183|181"))

            State.UpgradeCount = State.UpgradeCount + 1
            task.wait(1)
        end
    end)
end

local function _v472c5i11kp()
    State.UpgradeConn = nil
    _vr7cusucn10(_S("112|177|229|228|223|144|197|224|215|226|209|212|213|144|195|196|191|192|192|181|180"))
end

local function _vo0mvmx5f8h()
    for _, _vvdfxwyprvf in ipairs(State.ESPHighlights) do
        pcall(function() _vvdfxwyprvf:Destroy() end)
    end
    State.ESPHighlights = {}
end

local function _vlu1zgh3mow()
    _vo0mvmx5f8h()

    local rocks = _v9c3jduvi10()
    for _, rock in ipairs(rocks) do
        if rock.Instance and rock.Instance.Parent then

            local _vvdfxwyprvf = Instance.new(_S("90|162|195|193|194|198|195|193|194|206"))
            _vvdfxwyprvf.Name = _S("97|166|180|177|192") .. rock.Name
            _vvdfxwyprvf.FillTransparency = 0.6
            _vvdfxwyprvf.OutlineTransparency = 0
            _vvdfxwyprvf.OutlineColor = rock.Value > 0 and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(100, 200, 255)
            _vvdfxwyprvf.FillColor = rock.Value > 0 and Color3.fromRGB(255, 200, 50) or Color3.fromRGB(80, 150, 255)
            _vvdfxwyprvf.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            _vvdfxwyprvf.Parent = rock.Instance

            local _vqcllhre0ef = Instance.new(_S("123|189|228|231|231|221|234|220|237|223|194|240|228"))
            _vqcllhre0ef.Name = _S("70|139|153|150|146|167|168|171|178")
            _vqcllhre0ef.Size = UDim2.new(0, 120, 0, 30)
            _vqcllhre0ef.StudsOffset = Vector3.new(0, 3, 0)
            _vqcllhre0ef.AlwaysOnTop = true
            _vqcllhre0ef.Parent = rock.Part

            local label = Instance.new(_S("85|169|186|205|201|161|182|183|186|193"))
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 0.4
            label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            label.Text = rock.Name .. _S("119|151|210") .. math.floor(rock.Distance) .. _S("60|169|153") .. (rock.Value > 0 and (_S("77|109|201|109|113") .. tostring(rock.Value)) or _S("127|"))
            label.TextColor3 = rock.Value > 0 and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(100, 200, 255)
            label.Font = Enum.Font.GothamBold
            label.TextSize = 11
            label.Parent = _vqcllhre0ef

            local _vi7ksmogfeo = Instance.new(_S("125|210|198|192|236|239|235|226|239"))
            _vi7ksmogfeo.CornerRadius = UDim.new(0, 4)
            _vi7ksmogfeo.Parent = label

            table.insert(State.ESPHighlights, _vvdfxwyprvf)
            table.insert(State.ESPHighlights, _vqcllhre0ef)
        end
    end

    local shops = _vdiud8l85fq()
    for _, shop in ipairs(shops) do
        if shop.Instance and shop.Instance.Parent then
            local _vvdfxwyprvf = Instance.new(_S("108|180|213|211|212|216|213|211|212|224"))
            _vvdfxwyprvf.Name = _S("77|146|160|157|172|160|181|188|189|172") .. shop.Name
            _vvdfxwyprvf.FillTransparency = 0.5
            _vvdfxwyprvf.OutlineTransparency = 0
            _vvdfxwyprvf.OutlineColor = Color3.fromRGB(0, 255, 100)
            _vvdfxwyprvf.FillColor = Color3.fromRGB(50, 255, 100)
            _vvdfxwyprvf.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            _vvdfxwyprvf.Parent = shop.Instance

            local _vqcllhre0ef = Instance.new(_S("99|165|204|207|207|197|210|196|213|199|170|216|204"))
            _vqcllhre0ef.Name = _S("127|196|210|207|210|231|238|239|203|224|225|228|235")
            _vqcllhre0ef.Size = UDim2.new(0, 100, 0, 25)
            _vqcllhre0ef.StudsOffset = Vector3.new(0, 3, 0)
            _vqcllhre0ef.AlwaysOnTop = true
            _vqcllhre0ef.Parent = shop.Part

            local label = Instance.new(_S("85|169|186|205|201|161|182|183|186|193"))
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 0.4
            label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            label.Text = _S("94|177|166|173|174|152|126") .. shop.Name
            label.TextColor3 = Color3.fromRGB(0, 255, 100)
            label.Font = Enum.Font.GothamBold
            label.TextSize = 10
            label.Parent = _vqcllhre0ef

            table.insert(State.ESPHighlights, _vvdfxwyprvf)
            table.insert(State.ESPHighlights, _vqcllhre0ef)
        end
    end

    _vr7cusucn10(_S("87|156|170|167|145|119") .. #rocks .. _S("129|161|243|240|228|236|244|173|161") .. #shops .. _S("127|159|242|231|238|239|242"))
end

local function _v1ewlw47rnd()
    if _v0boleg0gr6.ESPEnabled then
        _vlu1zgh3mow()

        task.spawn(function()
            while _v0boleg0gr6.ESPEnabled do
                task.wait(5)
                if _v0boleg0gr6.ESPEnabled then
                    _vlu1zgh3mow()
                end
            end
        end)
    end
end

local function _vkgp2o1gzvi()
    _vo0mvmx5f8h()
end

local function _vpnmzxaalc3()
    if State.AntiDamageConn then return end
    _vr7cusucn10(_S("72|137|182|188|177|104|140|169|181|169|175|173|104|141|150|137|138|148|141|140"))

    State.AntiDamageConn = _vdwtr2fwsxq.Heartbeat:Connect(function()
        if not _vwnfy35wc3s() then return end

        if _vktnt2yiuxx and _vktnt2yiuxx.Health < _vktnt2yiuxx.MaxHealth then
            _vktnt2yiuxx.Health = _vktnt2yiuxx.MaxHealth
        end

        if _v0boleg0gr6.AntiFreeze then
            pcall(function()

                local _vurnhbfsz06 = Character:FindFirstChild(_S("73|160|170|187|182|189|177")) or Character:FindFirstChild(_S("115|199|216|224|227|216|229|212|231|232|229|216")) or Character:FindFirstChild(_S("120|187|231|228|220"))
                if _vurnhbfsz06 and _vurnhbfsz06:IsA(_S("68|154|165|176|185|169|134|165|183|169")) then
                    _vurnhbfsz06.Value = 100
                end

                local _vf99hxemegq = Character:FindFirstChild(_S("117|187|231|228|239|218|227")) or Character:FindFirstChild(_S("93|166|208|163|207|204|215|194|203")) or Character:FindFirstChild(_S("125|195|239|226|226|247|230|235|228"))
                if _vf99hxemegq and _vf99hxemegq:IsA(_S("90|156|201|201|198|176|187|198|207|191")) then
                    _vf99hxemegq.Value = false
                end

                _vy1k1bkblg5(_S("120|239|217|234|229|236|224"))
                _vy1k1bkblg5(_S("104|221|214|206|218|205|205|226|205"))
                _vy1k1bkblg5(_S("90|194|191|187|206"))
            end)
        end
    end)
end

local function _vbvmf71nvg1()
    if State.AntiDamageConn then
        State.AntiDamageConn:Disconnect()
        State.AntiDamageConn = nil
    end
    _vr7cusucn10(_S("115|180|225|231|220|147|183|212|224|212|218|216|147|183|188|198|180|181|191|184|183"))
end

local function _vntduntx90g()
    if not _v0boleg0gr6.UnlimitedBackpack then return end
    _vr7cusucn10(_S("65|130|177|177|173|186|170|175|168|97|150|175|173|170|174|170|181|166|165|97|131|162|164|172|177|162|164|172|111|111|111"))

    pcall(function()

        local _vfvl0rdvgne = _vudw9qq35re:FindFirstChild(_S("115|181|212|214|222|227|212|214|222|182|212|227|212|214|220|231|236")) or _vudw9qq35re:FindFirstChild(_S("114|191|211|234|181|211|228|228|235")) or _vudw9qq35re:FindFirstChild(_S("129|196|226|243|243|250|204|200"))
        if _vfvl0rdvgne and _vfvl0rdvgne:IsA(_S("73|159|170|181|190|174|139|170|188|174")) then
            _vfvl0rdvgne.Value = 999999
        end

        local _vlnywpawei1 = _vudw9qq35re:FindFirstChild(_S("122|230|223|219|222|223|236|237|238|219|238|237"))
        if _vlnywpawei1 then
            for _, stat in ipairs(_vlnywpawei1:GetChildren()) do
                local _vpg6fk7h49d = string.lower(stat.Name)
                if string.find(_vpg6fk7h49d, _S("75|173|172|174|182|187|172|174|182")) or string.find(_vpg6fk7h49d, _S("70|169|167|184|184|191")) or string.find(_vpg6fk7h49d, _S("79|178|176|191|176|178|184|195|200")) or string.find(_vpg6fk7h49d, _S("80|199|181|185|183|184|196")) or string.find(_vpg6fk7h49d, _S("85|192|188")) then
                    if stat:IsA(_S("117|203|214|225|234|218|183|214|232|218")) then
                        stat.Value = 999999
                    end
                end
            end
        end

        _vy1k1bkblg5(_S("100|198|197|199|207|212|197|199|207"))
        _vy1k1bkblg5(_S("60|159|157|172|157|159|165|176|181"))
        _vy1k1bkblg5(_S("111|210|208|225|225|232"))
        _vy1k1bkblg5(_S("110|227|222|213|224|207|210|211|205|208|207|209|217|222|207|209|217"))
    end)

    task.spawn(function()
        while _v0boleg0gr6.UnlimitedBackpack do
            task.wait(2)
            pcall(function()
                local _vlnywpawei1 = _vudw9qq35re:FindFirstChild(_S("75|183|176|172|175|176|189|190|191|172|191|190"))
                if _vlnywpawei1 then
                    for _, stat in ipairs(_vlnywpawei1:GetChildren()) do
                        local _vpg6fk7h49d = string.lower(stat.Name)
                        if string.find(_vpg6fk7h49d, _S("90|188|187|189|197|202|187|189|197")) or string.find(_vpg6fk7h49d, _S("126|225|223|240|240|247")) or string.find(_vpg6fk7h49d, _S("111|210|208|223|208|210|216|227|232")) or string.find(_vpg6fk7h49d, _S("104|223|205|209|207|208|220")) or string.find(_vpg6fk7h49d, _S("123|230|226")) then
                            if stat:IsA(_S("95|181|192|203|212|196|161|192|210|196")) then
                                stat.Value = 999999
                            end
                        end
                    end
                end
            end)
        end
    end)
end

local function _vxxxvr0z7ro()
    if not _v0boleg0gr6.UnlimitedLuck then return end
    _vr7cusucn10(_S("95|160|207|207|203|216|200|205|198|127|180|205|203|200|204|200|211|196|195|127|171|212|194|202|141|141|141"))

    pcall(function()

        local _v0dm1wjv2ez = _vudw9qq35re:FindFirstChild(_S("126|202|243|225|233")) or _vudw9qq35re:FindFirstChild(_S("86|154|191|189|162|203|185|193")) or _vudw9qq35re:FindFirstChild(_S("105|182|210|215|210|215|208|181|222|204|212"))
        if _v0dm1wjv2ez and _v0dm1wjv2ez:IsA(_S("68|154|165|176|185|169|134|165|183|169")) then
            _v0dm1wjv2ez.Value = 999999
        end

        local _vlnywpawei1 = _vudw9qq35re:FindFirstChild(_S("79|187|180|176|179|180|193|194|195|176|195|194"))
        if _vlnywpawei1 then
            for _, stat in ipairs(_vlnywpawei1:GetChildren()) do
                local _vpg6fk7h49d = string.lower(stat.Name)
                if string.find(_vpg6fk7h49d, _S("129|237|246|228|236")) then
                    if stat:IsA(_S("78|164|175|186|195|179|144|175|193|179")) then
                        stat.Value = 999999
                    end
                end
            end
        end

        _vy1k1bkblg5(_S("67|175|184|166|174"))
        _vy1k1bkblg5(_S("77|185|194|176|184|198"))
        _vy1k1bkblg5(_S("78|178|183|181|173|186|195|177|185"))
    end)

    task.spawn(function()
        while _v0boleg0gr6.UnlimitedLuck do
            task.wait(2)
            pcall(function()
                local _vlnywpawei1 = _vudw9qq35re:FindFirstChild(_S("106|214|207|203|206|207|220|221|222|203|222|221"))
                if _vlnywpawei1 then
                    for _, stat in ipairs(_vlnywpawei1:GetChildren()) do
                        if string.find(string.lower(stat.Name), _S("63|171|180|162|170")) and stat:IsA(_S("101|187|198|209|218|202|167|198|216|202")) then
                            stat.Value = 999999
                        end
                    end
                end
            end)
        end
    end)
end

local function _vh7eyuxnr23(amount)
    _vr7cusucn10(_S("76|141|192|192|177|185|188|192|181|186|179|108|192|187|108|176|193|188|177|108") .. amount .. _S("126|158|231|242|227|235|241|172|172|172"))

    pcall(function()

        for i = 1, amount do
            _vy1k1bkblg5(_S("64|163|175|172|172|165|163|180"))
            _vy1k1bkblg5(_S("88|197|193|198|189"))
            _vy1k1bkblg5(_S("73|177|170|187|191|174|188|189"))
            _vy1k1bkblg5(_S("85|197|190|184|192|202|197"))
            _vy1k1bkblg5(_S("77|180|174|193|181|178|191"))
            _vy1k1bkblg5(_S("113|221|224|224|229"))
            _vy1k1bkblg5(_S("103|214|201|219|200|208|213"))
            _vy1k1bkblg5(_S("80|183|194|177|190|196"))
            _vy1k1bkblg5(_S("109|223|210|228|206|223|209"))
            task.wait(0.05)
        end

        local _vlnywpawei1 = _vudw9qq35re:FindFirstChild(_S("65|173|166|162|165|166|179|180|181|162|181|180"))
        if _vlnywpawei1 then
            for _, stat in ipairs(_vlnywpawei1:GetChildren()) do
                local _vpg6fk7h49d = string.lower(stat.Name)
                if string.find(_vpg6fk7h49d, _S("130|229|244|251|245|246|227|238")) or string.find(_vpg6fk7h49d, _S("117|228|231|218")) or string.find(_vpg6fk7h49d, _S("100|203|201|209")) or string.find(_vpg6fk7h49d, _S("88|193|204|189|197")) then
                    if stat:IsA(_S("125|203|242|234|223|226|239|211|222|233|242|226")) or stat:IsA(_S("88|161|198|204|174|185|196|205|189")) then
                        stat.Value = stat.Value * amount
                    end
                end
            end
        end

        for i = 1, amount do
            _vy1k1bkblg5(_S("111|226|212|219|219"))
            task.wait(0.02)
            _vy1k1bkblg5(_S("93|191|210|214"))
            task.wait(0.02)
        end

        local rocks = _v9c3jduvi10()
        if #rocks > 0 then
            local _vr96ejvnabv = rocks[1]
            for i = 1, amount do
                for _, remote in ipairs(State.RemoteCache) do
                    local rName = string.lower(remote.Name)
                    if string.find(rName, _S("80|179|191|188|188|181|179|196")) or string.find(rName, _S("60|172|165|159|167|177|172")) or string.find(rName, _S("67|175|178|178|183")) then
                        pcall(function()
                            if remote.Type == _S("72|154|173|181|183|188|173|141|190|173|182|188") then
                                remote.Instance:FireServer(_vr96ejvnabv.Instance, _vr96ejvnabv.Part)
                            end
                        end)
                    end
                end
                task.wait(0.05)
            end
        end
    end)

    State.DupeCount = State.DupeCount + amount
    _vr7cusucn10(_S("115|183|232|227|216|147|212|231|231|216|224|227|231|147|214|226|224|227|223|216|231|216|173|147") .. amount .. _S("127|247"))
end

local function _v02whttlhhw()
    if State.NoclipConn then return end
    _vr7cusucn10(_S("128|206|239|227|236|233|240|160|197|206|193|194|204|197|196"))

    State.NoclipConn = _vdwtr2fwsxq.Stepped:Connect(function()
        if not _v0boleg0gr6.Noclip then return end
        if not _vwnfy35wc3s() then return end
        for _, part in ipairs(Character:GetDescendants()) do
            if part:IsA(_S("61|127|158|176|162|141|158|175|177")) then
                part.CanCollide = false
            end
        end
    end)
end

local function _v5ycq2f481o()
    if State.NoclipConn then
        State.NoclipConn:Disconnect()
        State.NoclipConn = nil
    end
    _vr7cusucn10(_S("91|169|202|190|199|196|203|123|159|164|174|156|157|167|160|159"))
end

local _vqfhayh6e3f = nil
local _vtqc7f0it3b = nil

local function _vpvz48rnfwo()
    if State.FlyConn then return end
    if not _vwnfy35wc3s() then return end
    _vr7cusucn10(_S("74|144|182|195|106|143|152|139|140|150|143|142"))

    _vqfhayh6e3f = Instance.new(_S("94|160|205|194|215|180|195|202|205|193|199|210|215"))
    _vqfhayh6e3f.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    _vqfhayh6e3f.Velocity = Vector3.new(0, 0, 0)
    _vqfhayh6e3f.Parent = _vqzsv3795w7

    _vtqc7f0it3b = Instance.new(_S("84|150|195|184|205|155|205|198|195"))
    _vtqc7f0it3b.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    _vtqc7f0it3b.P = 9e4
    _vtqc7f0it3b.Parent = _vqzsv3795w7

    State.FlyConn = _vdwtr2fwsxq.RenderStepped:Connect(function()
        if not _v0boleg0gr6.FlyEnabled then return end
        if not _vwnfy35wc3s() then return end

        local cam = _vni9dzwsam5.CurrentCamera
        local _v11m1qissgm = Vector3.new(0, 0, 0)

        if _vyqj56q1cez:IsKeyDown(Enum.KeyCode.W) then
            _v11m1qissgm = _v11m1qissgm + cam.CFrame.LookVector
        end
        if _vyqj56q1cez:IsKeyDown(Enum.KeyCode.S) then
            _v11m1qissgm = _v11m1qissgm - cam.CFrame.LookVector
        end
        if _vyqj56q1cez:IsKeyDown(Enum.KeyCode.A) then
            _v11m1qissgm = _v11m1qissgm - cam.CFrame.RightVector
        end
        if _vyqj56q1cez:IsKeyDown(Enum.KeyCode.D) then
            _v11m1qissgm = _v11m1qissgm + cam.CFrame.RightVector
        end
        if _vyqj56q1cez:IsKeyDown(Enum.KeyCode.Space) then
            _v11m1qissgm = _v11m1qissgm + Vector3.new(0, 1, 0)
        end
        if _vyqj56q1cez:IsKeyDown(Enum.KeyCode.LeftShift) then
            _v11m1qissgm = _v11m1qissgm - Vector3.new(0, 1, 0)
        end

        if _v11m1qissgm.Magnitude > 0 then
            _v11m1qissgm = _v11m1qissgm.Unit * _v0boleg0gr6.FlySpeed
        end

        _vqfhayh6e3f.Velocity = _v11m1qissgm
        _vtqc7f0it3b.CFrame = cam.CFrame
    end)
end

local function _vmvvnsrxdd2()
    if State.FlyConn then
        State.FlyConn:Disconnect()
        State.FlyConn = nil
    end
    if _vqfhayh6e3f then _vqfhayh6e3f:Destroy() _vqfhayh6e3f = nil end
    if _vtqc7f0it3b then _vtqc7f0it3b:Destroy() _vtqc7f0it3b = nil end
    _vr7cusucn10(_S("91|161|199|212|123|159|164|174|156|157|167|160|159"))
end

local function _v72n95m3eih()
    if not _vwnfy35wc3s() then return end
    if _v0boleg0gr6.SpeedBoost then
        _vktnt2yiuxx.WalkSpeed = _v0boleg0gr6.WalkSpeed
    else
        _vktnt2yiuxx.WalkSpeed = 16
    end
end

local function _vw93xyforzm()
    _v0boleg0gr6.AutoFarm = false
    _v0boleg0gr6.AutoSell = false
    _v0boleg0gr6.AutoUpgrade = false
    _v0boleg0gr6.SmartLoop = false
    _v0boleg0gr6.ESPEnabled = false
    _v0boleg0gr6.FlyEnabled = false
    _v0boleg0gr6.Noclip = false
    _v0boleg0gr6.RapidMine = false
    _v0boleg0gr6.RemoteSpy = false
    _vjvdni0h55i()
    _v79fac7g8tn()
    _v472c5i11kp()
    State.SmartLoopConn = nil
    _vmvvnsrxdd2()
    _v5ycq2f481o()
    _vkgp2o1gzvi()
    _vqgrmy63pns()
    _vco2fxbpbyy()
    _vrd0nr6m06z()
    if State.InfiniteJumpConn then State.InfiniteJumpConn:Disconnect() State.InfiniteJumpConn = nil end
    if State.ClickTPConn then State.ClickTPConn:Disconnect() State.ClickTPConn = nil end
    if State.WarmthKeeperConn then State.WarmthKeeperConn:Disconnect() State.WarmthKeeperConn = nil end
    if State.DropCollectConn then State.DropCollectConn = nil end
    _vr7cusucn10(_S("101|181|166|179|174|168|159|133|166|209|209|133|203|202|198|217|218|215|202|216|133|216|217|212|213|213|202|201"))
end

local function _v5fbsz8bp5c()
    if State.SmartLoopConn then return end
    _vr7cusucn10(_S("96|179|205|193|210|212|128|172|207|207|208|128|179|180|161|178|180|165|164|128|136|166|193|210|205|128|8690|128|179|197|204|204|128|8690|128|181|208|199|210|193|196|197|137"))
    State.SmartLoopConn = true
    task.spawn(function()
        while _v0boleg0gr6.SmartLoop and State.SmartLoopConn do
            if _vwnfy35wc3s() then
                _voalq60ytij()
                _ve9naqto4ue(_vni9dzwsam5)
                if _v6j7kx0uulv() then
                    local shops = _vdiud8l85fq()
                    if #shops > 0 then
                        State.CurrentTarget = _S("105|188|206|213|213|210|215|208|151|151|151")
                        _vvtwdchtwpc(shops[1])
                        pcall(_vldc01eci5h)
                        _vswxglooah6()
                        _v0pzi33l53w()
                    end
                else
                    local rocks = _v9c3jduvi10()
                    if #rocks > 0 then
                        State.CurrentTarget = rocks[1].Name
                        _vbq9btuy6nn(rocks[1])
                    else
                        State.CurrentTarget = _S("105|188|206|202|219|204|209|210|215|208|151|151|151")
                        _v18tymw5j2o()
                    end
                end
                _va932p0e0eg()
            end
            task.wait(_v0boleg0gr6.FarmDelay)
        end
    end)
end

local function _vzhf8a5i9le()
    State.SmartLoopConn = nil
    _vr7cusucn10(_S("105|188|214|202|219|221|137|181|216|216|217|137|188|189|184|185|185|174|173"))
end

local function _vd41op2fgzp(arg)
    local t = typeof(arg)
    if t == _S("100|173|210|215|216|197|210|199|201") then return arg:GetFullName()
    elseif t == _S("73|159|174|172|189|184|187|124") then return string.format(_S("82|168|183|181|198|193|196|133|122|119|128|131|184|126|119|128|131|184|126|119|128|131|184|123"), arg.X, arg.Y, arg.Z)
    elseif t == _S("111|178|181|225|208|220|212") then return _S("101|168|171|215|198|210|202")
    elseif t == _S("76|192|173|174|184|177") then return _S("92|208|189|190|200|193")
    else return tostring(arg) end
end

local function _vf05m7wa9z5(remoteName, remoteType, args)
    local _vne4yqe0hca = _S("75|")
    for i, a in ipairs(args) do
        _vne4yqe0hca = _vne4yqe0hca .. (i > 1 and _S("98|142|130") or _S("95|")) .. _vd41op2fgzp(a)
    end
    local entry = os.date(_S("124|161|196|182|161|201|182|161|207")) .. _S("100|132|224|132") .. remoteType .. _S("113|145|237|145") .. remoteName .. _S("74|114") .. _vne4yqe0hca .. _S("62|103")
    table.insert(State.RemoteSpyLogs, 1, entry)
    if #State.RemoteSpyLogs > 40 then table.remove(State.RemoteSpyLogs) end
    State.LastRemoteFire = entry
    if RemoteSpyList then
        pcall(function()
            _v60o6fmnvwr(RemoteSpyList)
            for i, log in ipairs(State.RemoteSpyLogs) do
                if i > 20 then break end
                local lbl = Instance.new(_S("107|191|208|227|223|183|204|205|208|215"))
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

local function _v83d6ky6izd()
    if not Exec.HasHookMeta then
        _vr7cusucn10(_S("117|199|218|226|228|233|218|149|200|229|238|149|234|227|214|235|214|222|225|214|215|225|218|149|228|227|149|233|221|222|232|149|218|237|218|216|234|233|228|231"))
        return
    end
    _v1chfeijrmq = true
    _vr7cusucn10(_S("89|171|190|198|200|205|190|121|172|201|210|121|158|167|154|155|165|158|157"))
end

local function _vy26ugtwp50()
    _v1chfeijrmq = false
    _v0boleg0gr6.RemoteSpy = false
    _vr7cusucn10(_S("112|194|213|221|223|228|213|144|195|224|233|144|180|185|195|177|178|188|181|180"))
end

local function _vi09gjpb41y()
    if _v0boleg0gr6.CustomRemoteName == _S("101|") then
        _vr7cusucn10(_S("90|159|200|206|191|204|122|187|122|204|191|199|201|206|191|122|200|187|199|191|122|192|195|204|205|206"))
        return
    end
    local args = {}
    if _v0boleg0gr6.CustomRemoteArgs ~= _S("93|") then
        for part in string.gmatch(_v0boleg0gr6.CustomRemoteArgs, _S("119|210|213|163|212|162")) do
            part = string.gsub(part, _S("82|176|119|197|124|122|128|127|123|119|197|124|118"), _S("129|166|178"))
            local num = tonumber(part)
            if num then
                table.insert(args, num)
            elseif part == _S("63|179|177|180|164") then
                table.insert(args, true)
            elseif part == _S("121|223|218|229|236|222") then
                table.insert(args, false)
            else
                table.insert(args, part)
            end
        end
    end
    if _vokpez8uavz(_v0boleg0gr6.CustomRemoteName, Exec.Unpack(args)) then
        _vr7cusucn10(_S("98|168|203|212|199|198|130|199|218|195|197|214|156|130") .. _v0boleg0gr6.CustomRemoteName)
    else
        _vy1k1bkblg5(_v0boleg0gr6.CustomRemoteName, Exec.Unpack(args))
        _vr7cusucn10(_S("123|193|228|237|224|223|155|235|220|239|239|224|237|233|181|155") .. _v0boleg0gr6.CustomRemoteName)
    end
end

local function _vugxsy603hp()
    if State.InfiniteJumpConn then return end
    State.InfiniteJumpConn = _vyqj56q1cez.JumpRequest:Connect(function()
        if _v0boleg0gr6.InfiniteJump and _vwnfy35wc3s() and _vktnt2yiuxx then
            _vktnt2yiuxx:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
    _vr7cusucn10(_S("64|137|174|166|169|174|169|180|165|96|138|181|173|176|96|133|142|129|130|140|133|132"))
end

local function _vrwaicuffkp()
    if State.InfiniteJumpConn then
        State.InfiniteJumpConn:Disconnect()
        State.InfiniteJumpConn = nil
    end
end

local function _vxmbj27hqip()
    if State.ClickTPConn then return end
    State.ClickTPConn = _vyqj56q1cez.InputBegan:Connect(function(input, processed)
        if processed or not _v0boleg0gr6.ClickTeleport then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1 and _vyqj56q1cez:IsKeyDown(Enum.KeyCode.LeftControl) then
            local cam = _vni9dzwsam5.CurrentCamera
            if not cam then return end
            local ray = cam:ScreenPointToRay(input.Position.X, input.Position.Y)
            local _vwriq3a67r4 = RaycastParams.new()
            if Character then _vwriq3a67r4.FilterDescendantsInstances = {Character} end
            local _vfvoruaayjl = pcall(function()
                _vwriq3a67r4.FilterType = Enum.RaycastFilterType.Exclude
            end)
            if not _vfvoruaayjl then
                _vwriq3a67r4.FilterType = Enum.RaycastFilterType.Blacklist
            end
            local hit = _vni9dzwsam5:Raycast(ray.Origin, ray.Direction * 2000, _vwriq3a67r4)
            if hit then
                _vgxe7cwo18s(hit.Position)
                _vr7cusucn10(_S("72|139|180|177|171|179|104|156|152|104|8666|104") .. math.floor(hit.Position.X) .. _S("114|158") .. math.floor(hit.Position.Y))
            end
        end
    end)
    _vr7cusucn10(_S("104|171|212|209|203|211|136|188|184|136|173|182|169|170|180|173|172|136|144|171|220|218|212|147|171|212|209|203|211|145"))
end

local function _vm9qdwwlk52()
    if State.ClickTPConn then
        State.ClickTPConn:Disconnect()
        State.ClickTPConn = nil
    end
end

local function _vxfyiwl16qj(name)
    if not _vwnfy35wc3s() then return end
    State.Waypoints[name] = _vqzsv3795w7.Position
    _vr7cusucn10(_S("74|157|171|192|175|174|106|193|171|195|186|185|179|184|190|132|106") .. name)
end

local function _v4ghacq4rpo(name)
    local pos = State.Waypoints[name]
    if pos then
        _vgxe7cwo18s(pos)
        _vr7cusucn10(_S("89|173|169|121|208|186|210|201|200|194|199|205|147|121") .. name)
    else
        _vr7cusucn10(_S("129|216|226|250|241|240|234|239|245|161|239|240|245|161|231|240|246|239|229|187|161") .. name)
    end
end

local function _v7eh98094s3()
    if State.AntiAFKConn then return end
    local vu = game:GetService(_S("124|210|229|238|240|241|221|232|209|239|225|238"))
    State.AntiAFKConn = _vudw9qq35re.Idled:Connect(function()
        if _v0boleg0gr6.AntiAFK then
            pcall(function() vu:CaptureController(); vu:ClickButton2(Vector2.new(0, 0)) end)
        end
    end)
    _vr7cusucn10(_S("99|164|209|215|204|144|164|169|174|131|168|177|164|165|175|168|167"))
end

local function _v6ssxtr51p4()
    if State.AntiAFKConn then
        State.AntiAFKConn:Disconnect()
        State.AntiAFKConn = nil
    end
end

local function _vp8yiekuy38()
    if State.WarmthKeeperConn then return end
    State.WarmthKeeperConn = _vdwtr2fwsxq.Heartbeat:Connect(function()
        if not _v0boleg0gr6.WarmthKeeper and not _v0boleg0gr6.StaminaKeeper then return end
        if not _vwnfy35wc3s() then return end
        pcall(function()
            if _v0boleg0gr6.WarmthKeeper then
                for _, name in ipairs({_S("96|183|193|210|205|212|200"), _S("124|208|225|233|236|225|238|221|240|241|238|225"), _S("77|144|188|185|177"), _S("115|187|216|212|231"), _S("124|211|221|238|233")}) do
                    local v = Character:FindFirstChild(name) or _vudw9qq35re:FindFirstChild(name)
                    if v and v:IsA(_S("116|202|213|224|233|217|182|213|231|217")) then v.Value = 100 end
                end
                _vy1k1bkblg5(_S("60|179|157|174|169|176|164")); _vy1k1bkblg5(_S("112|216|213|209|228")); _vy1k1bkblg5(_S("61|160|158|170|173|163|166|175|162"))
            end
            if _v0boleg0gr6.StaminaKeeper then
                for _, name in ipairs({_S("104|187|220|201|213|209|214|201"), _S("103|172|213|204|217|206|224"), _S("73|140|181|178|182|171"), _S("102|181|222|223|205|203|212"), _S("92|158|206|193|189|208|196")}) do
                    local v = Character:FindFirstChild(name) or _vudw9qq35re:FindFirstChild(name)
                    if v and v:IsA(_S("93|179|190|201|210|194|159|190|208|194")) then v.Value = 100 end
                end
            end
        end)
    end)
    _vr7cusucn10(_S("75|162|172|189|184|191|179|122|158|191|172|184|180|185|172|107|150|176|176|187|176|189|107|144|153|140|141|151|144|143"))
end

local function _vsx7owh6039()
    if State.WarmthKeeperConn then
        State.WarmthKeeperConn:Disconnect()
        State.WarmthKeeperConn = nil
    end
end

local function _vqgrmy63pns()
    for _, obj in ipairs(State.TracerObjects) do
        pcall(function() obj:Destroy() end)
    end
    State.TracerObjects = {}
end

local function _v06wr2sk1s4()
    if not _v0boleg0gr6.Tracers then _vqgrmy63pns() return end
    if not _vwnfy35wc3s() then return end
    _vqgrmy63pns()
    local _vwqr8gbravz = {}
    for _, r in ipairs(_v9c3jduvi10()) do
        if #_vwqr8gbravz >= 8 then break end
        table.insert(_vwqr8gbravz, {Part = r.Part, Color = Color3.fromRGB(100, 200, 255)})
    end
    for _, s in ipairs(_vdiud8l85fq()) do
        if #_vwqr8gbravz >= 10 then break end
        table.insert(_vwqr8gbravz, {Part = s.Part, Color = Color3.fromRGB(0, 255, 100)})
    end
    for _, t in ipairs(_vwqr8gbravz) do
        local att0 = Instance.new(_S("63|128|179|179|160|162|167|172|164|173|179"))
        att0.Parent = _vqzsv3795w7
        local att1 = Instance.new(_S("95|160|211|211|192|194|199|204|196|205|211"))
        att1.Parent = t.Part
        local beam = Instance.new(_S("129|195|230|226|238"))
        beam.Attachment0 = att0
        beam.Attachment1 = att1
        beam.Color = ColorSequence.new(t.Color)
        beam.Width0 = 0.15
        beam.Width1 = 0.15
        beam.FaceCamera = true
        beam.Parent = _vqzsv3795w7
        table.insert(State.TracerObjects, att0)
        table.insert(State.TracerObjects, att1)
        table.insert(State.TracerObjects, beam)
    end
end

local function _vco2fxbpbyy()
    for _, obj in ipairs(State.PlayerESPObjects) do
        pcall(function() obj:Destroy() end)
    end
    State.PlayerESPObjects = {}
end

local function _vdc4ulrk87i()
    if not _v0boleg0gr6.PlayerESP then _vco2fxbpbyy() return end
    _vco2fxbpbyy()
    for _, plr in ipairs(_v581eeprxvz:GetPlayers()) do
        if plr ~= _vudw9qq35re and plr.Character then
            local hrp = plr.Character:FindFirstChild(_S("86|158|203|195|183|196|197|191|186|168|197|197|202|166|183|200|202"))
            if hrp then
                local hl = Instance.new(_S("80|152|185|183|184|188|185|183|184|196"))
                hl.FillTransparency = 0.7
                hl.OutlineColor = Color3.fromRGB(255, 80, 80)
                hl.FillColor = Color3.fromRGB(255, 50, 50)
                hl.Parent = plr.Character
                local bb = Instance.new(_S("115|181|220|223|223|213|226|212|229|215|186|232|220"))
                bb.Size = UDim2.new(0, 100, 0, 24)
                bb.StudsOffset = Vector3.new(0, 3, 0)
                bb.AlwaysOnTop = true
                bb.Parent = hrp
                local lbl = Instance.new(_S("76|160|177|196|192|152|173|174|177|184"))
                lbl.Size = UDim2.new(1, 0, 1, 0)
                lbl.BackgroundTransparency = 0.5
                lbl.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                lbl.Text = plr.Name .. _S("64|96|155") .. math.floor(_vui69yjfcls(hrp)) .. _S("68|177|161")
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

local function _vrd0nr6m06z()
    for _, obj in ipairs(State.ChestESPObjects) do
        pcall(function() obj:Destroy() end)
    end
    State.ChestESPObjects = {}
end

local function _vvqm5jpqluf()
    if not _v0boleg0gr6.ChestESP then _vrd0nr6m06z() return end
    _vrd0nr6m06z()
    local _v27wchai28g = {_S("60|159|164|161|175|176"), _S("62|161|176|159|178|163"), _S("75|176|193|176|185|191"), _S("92|195|197|194|208"), _S("85|197|199|186|200|186|195|201"), _S("113|229|227|214|210|228|230|227|214"), _S("68|182|169|187|165|182|168")}
    for _, d in ipairs(_vni9dzwsam5:GetDescendants()) do
        if d:IsA(_S("81|158|192|181|182|189")) or d:IsA(_S("89|155|186|204|190|169|186|203|205")) then
            local nl = string.lower(d.Name)
            for _, p in ipairs(_v27wchai28g) do
                if string.find(nl, p) then
                    local part = d:IsA(_S("103|169|200|218|204|183|200|217|219")) and d or d:FindFirstChildWhichIsA(_S("74|140|171|189|175|154|171|188|190"))
                    if part then
                        local hl = Instance.new(_S("94|166|199|197|198|202|199|197|198|210"))
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

local function _vjzha7219yk()
    if State.FullbrightApplied then return end
    State.SavedLighting = {
        Brightness = _vgknonsic2y.Brightness,
        ClockTime = _vgknonsic2y.ClockTime,
        FogEnd = _vgknonsic2y.FogEnd,
        GlobalShadows = _vgknonsic2y.GlobalShadows,
        Ambient = _vgknonsic2y.Ambient,
        OutdoorAmbient = _vgknonsic2y.OutdoorAmbient,
    }
    _vgknonsic2y.Brightness = 2
    _vgknonsic2y.ClockTime = 14
    _vgknonsic2y.FogEnd = 100000
    _vgknonsic2y.GlobalShadows = false
    _vgknonsic2y.Ambient = Color3.fromRGB(180, 180, 180)
    _vgknonsic2y.OutdoorAmbient = Color3.fromRGB(180, 180, 180)
    State.FullbrightApplied = true
    _vr7cusucn10(_S("107|177|224|215|215|205|221|212|210|211|223|139|186|185"))
end

local function _vy6ht3x13qu()
    if not State.FullbrightApplied then return end
    for k, v in pairs(State.SavedLighting) do
        pcall(function() _vgknonsic2y[k] = v end)
    end
    State.FullbrightApplied = false
    _vr7cusucn10(_S("102|172|219|210|210|200|216|207|205|206|218|134|181|172|172"))
end

local function _vcuspak1b50()
    for _, plr in ipairs(_v581eeprxvz:GetPlayers()) do
        if plr ~= _vudw9qq35re and plr.Character then
            for _, p in ipairs(plr.Character:GetDescendants()) do
                if p:IsA(_S("108|174|205|223|209|188|205|222|224")) then p.LocalTransparencyModifier = _v0boleg0gr6.HideOtherPlayers and 1 or 0 end
            end
        end
    end
end

local function _vln19kjm9vj()
    if not _v0boleg0gr6.FPSBooster then return end
    pcall(function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        for _, d in ipairs(_vni9dzwsam5:GetDescendants()) do
            if d:IsA(_S("118|198|215|232|234|223|217|226|219|187|227|223|234|234|219|232")) or d:IsA(_S("71|155|185|168|176|179")) or d:IsA(_S("99|182|208|210|206|200")) or d:IsA(_S("78|148|183|192|179")) then
                d.Enabled = false
            end
        end
        _vgknonsic2y.GlobalShadows = false
    end)
    _vr7cusucn10(_S("88|158|168|171|120|154|199|199|203|204|189|202|120|185|200|200|196|193|189|188"))
end

local function _vfjcwsnmmnt()
    local t = {}
    for k, v in pairs(_v0boleg0gr6) do t[k] = v end
    return t
end

local function _vyppy2dauyg(t)
    if type(t) ~= _S("96|212|193|194|204|197") then return false end
    for k, v in pairs(t) do
        if _v0boleg0gr6[k] ~= nil then _v0boleg0gr6[k] = v end
    end
    return true
end

local function _v15t6fbkr59()
    local ok, json = pcall(function() return HttpService:JSONEncode(_vfjcwsnmmnt()) end)
    if not ok then _vr7cusucn10(_S("110|177|221|220|212|215|213|142|225|207|228|211|142|212|207|215|218|211|210")) return end
    if Exec.WriteFile(_S("119|196|224|229|220|216|196|230|236|229|235|216|224|229|214|186|230|229|221|224|222|165|225|234|230|229"), json) then
        _vr7cusucn10(_S("85|152|196|195|187|190|188|117|200|182|203|186|185|117|201|196|117|187|190|193|186"))
    elseif Exec.HasClipboard then
        Exec.SetClipboard(json)
        _vr7cusucn10(_S("110|177|221|220|212|215|213|142|209|221|222|215|211|210|142|226|221|142|209|218|215|222|208|221|207|224|210"))
    else
        _vr7cusucn10(_S("78|161|175|196|179|110|195|188|175|196|175|183|186|175|176|186|179|110|118|188|189|110|197|192|183|194|179|180|183|186|179|125|177|186|183|190|176|189|175|192|178|119"))
    end
end

local function _v13y8wdiwqv()
    local json = Exec.ReadFile(_S("98|175|203|208|199|195|175|209|215|208|214|195|203|208|193|165|209|208|200|203|201|144|204|213|209|208"))
    if json then
        local ok, data = pcall(function() return HttpService:JSONDecode(json) end)
        if ok and _vyppy2dauyg(data) then
            _vr7cusucn10(_S("115|182|226|225|217|220|218|147|223|226|212|215|216|215|147|217|229|226|224|147|217|220|223|216"))
            return true
        end
    end
    _vr7cusucn10(_S("109|187|220|141|224|206|227|210|209|141|208|220|219|211|214|212|141|211|220|226|219|209"))
    return false
end

local function _vwyoqlk0j4a()
    _vr7cusucn10(_S("88|171|189|202|206|189|202|120|192|199|200|200|193|198|191|134|134|134"))
    pcall(function()
        local body = Exec.HttpGet(_S("91|195|207|207|203|206|149|138|138|194|188|200|192|206|137|205|202|189|199|202|211|137|190|202|200|138|209|140|138|194|188|200|192|206|138") .. game.PlaceId .. _S("119|166|234|220|233|237|220|233|234|166|199|236|217|227|224|218|182|234|230|233|235|198|233|219|220|233|180|184|234|218|157|227|224|228|224|235|180|168|167|167"))
        if not body then error(_S("120|192|236|236|232|191|221|236|152|222|217|225|228|221|220")) end
        local _v98vbeg0pt7 = HttpService:JSONDecode(body)
        if _v98vbeg0pt7 and _v98vbeg0pt7.data then
            for _, srv in ipairs(_v98vbeg0pt7.data) do
                if srv.id ~= game.JobId and srv.playing < srv.maxPlayers then
                    _vx8xddv5dy3:TeleportToPlaceInstance(game.PlaceId, srv.id, _vudw9qq35re)
                    return
                end
            end
        end
        _vx8xddv5dy3:Teleport(game.PlaceId, _vudw9qq35re)
    end)
end

local function _vzgkchttcjn()
    if State.ServerHopConn then return end
    if _v0boleg0gr6.ServerHopInterval <= 0 then return end
    State.ServerHopConn = true
    task.spawn(function()
        while _v0boleg0gr6.ServerHopInterval > 0 and State.ServerHopConn do
            task.wait(_v0boleg0gr6.ServerHopInterval * 60)
            if _v0boleg0gr6.ServerHopInterval > 0 then _vwyoqlk0j4a() end
        end
    end)
end

local function _v74qcmqphbz()
    State.ServerHopConn = nil
end

local function _vkwg3ulgcee()
    if State.DropCollectConn then return end
    State.DropCollectConn = true
    task.spawn(function()
        while _v0boleg0gr6.AutoCollectDrops and State.DropCollectConn do
            _v18tymw5j2o()
            task.wait(1.5)
        end
    end)
end

local _vci6bjb019k = {}
local _vgnh8wxoj0j = false

local function _vx0wseiwry8(data)
    if not _v0boleg0gr6.WebhookEnabled or _v0boleg0gr6.WebhookURL == _S("91|") then return end
    pcall(function()
        local body = HttpService:JSONEncode(data)
        Exec.Post(_v0boleg0gr6.WebhookURL, body)
    end)
end

local function _vqnugautdni(itemName)
    if not _v0boleg0gr6.WebhookFarm then return end
    _vx0wseiwry8({
        content = _S("109|151|151|200|186|214|219|210|206|141|186|220|226|219|225|206|214|219|202|151|151|141|186|214|219|210|209|167|141") .. itemName .. _S("122|154|246|154|206|233|238|219|230|180|154") .. State.FarmCount,
    })
end

local function _vldc01eci5h()
    if not _v0boleg0gr6.WebhookSell then return end
    _vx0wseiwry8({
        content = _S("75|117|117|166|152|180|185|176|172|107|152|186|192|185|191|172|180|185|168|117|117|107|158|186|183|175|107|180|191|176|184|190|107|199|107|159|186|191|172|183|107|190|176|183|183|190|133|107") .. State.SellCount,
    })
end

local function _vo9omc9lkcd()
    if not _v0boleg0gr6.WebhookStats then return end
    _vx0wseiwry8({
        content = _S("69|111|111|160|146|174|179|170|166|101|146|180|186|179|185|166|174|179|101|152|185|166|185|184|162|111|111|101|146|174|179|170|169|127|101") .. State.FarmCount .. _S("72|104|196|104|155|173|180|180|187|130|104") .. State.SellCount .. _S("118|150|242|150|186|235|230|219|233|176|150") .. State.DupeCount .. _S("86|118|210|118|170|183|200|189|187|202|144|118") .. State.CurrentTarget,
    })
end

local _vf46h0npein = Instance.new(_S("78|161|177|192|179|179|188|149|195|183"))
_vf46h0npein.Name = _S("126|203|231|236|227|223|203|237|243|236|242|223|231|236|212|181")
_vf46h0npein.ResetOnSpawn = false
_vf46h0npein.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_vf46h0npein.IgnoreGuiInset = true

Exec.ProtectGui(_vf46h0npein)

pcall(function()
    _vf46h0npein.Parent = Exec.GetGuiParent()
end)
if not _vf46h0npein.Parent then
    pcall(function()
        _vf46h0npein.Parent = _vudw9qq35re:WaitForChild(_S("127|207|235|224|248|228|241|198|244|232"))
    end)
end

local _v4mvpykouqg = _vni9dzwsam5.CurrentCamera or _vni9dzwsam5:WaitForChild(_S("128|195|225|237|229|242|225"), 10)
local _vzs3jdcj4qk = _v4mvpykouqg and _v4mvpykouqg.ViewportSize or Vector2.new(1920, 1080)
local _v4zeoxluz6v = _vzs3jdcj4qk.X < 800
local _veqp7tbafrq = _v4zeoxluz6v and UDim2.new(0, 310, 0, 400) or UDim2.new(0, 360, 0, 480)
local _vgd1bcsnpe1 = UDim2.new(0, 140, 0, 38)
local _vlo08kn7kc4 = UDim2.new(0, 12, 0, 60)
local _vry77uep8b0 = UDim2.new(0, 12, 0, 60)

local _vsghk88e6xf = Instance.new(_S("65|135|179|162|174|166"))
_vsghk88e6xf.Name = _S("114|191|211|219|224|184|228|211|223|215")
_vsghk88e6xf.Size = _veqp7tbafrq
_vsghk88e6xf.Position = _vlo08kn7kc4
_vsghk88e6xf.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
_vsghk88e6xf.BackgroundTransparency = 0.15
_vsghk88e6xf.BorderSizePixel = 0
_vsghk88e6xf.ClipsDescendants = true
_vsghk88e6xf.Parent = _vf46h0npein

local _v4fqjoncgep = Instance.new(_S("128|213|201|195|239|242|238|229|242"))
_v4fqjoncgep.CornerRadius = UDim.new(0, 14)
_v4fqjoncgep.Parent = _vsghk88e6xf

local _vral5d4doj9 = Instance.new(_S("122|207|195|205|238|236|233|229|223"))
_vral5d4doj9.Color = Color3.fromRGB(90, 130, 255)
_vral5d4doj9.Thickness = 1.5
_vral5d4doj9.Transparency = 0.2
_vral5d4doj9.Parent = _vsghk88e6xf

local _vzx9h2h6xk5 = Instance.new(_S("61|134|170|158|164|162|137|158|159|162|169"))
_vzx9h2h6xk5.Name = _S("89|160|197|186|204|204|155|197|206|203")
_vzx9h2h6xk5.Size = UDim2.new(1, 40, 1, 40)
_vzx9h2h6xk5.Position = UDim2.new(0, -20, 0, -20)
_vzx9h2h6xk5.BackgroundTransparency = 1
_vzx9h2h6xk5.Image = _S("113|227|211|233|210|228|228|214|229|218|213|171|160|160|168|167|167|170|162|167|169|166|169|166")
_vzx9h2h6xk5.ImageColor3 = Color3.fromRGB(50, 80, 200)
_vzx9h2h6xk5.ImageTransparency = 0.75
_vzx9h2h6xk5.ScaleType = Enum.ScaleType.Slice
_vzx9h2h6xk5.SliceCenter = Rect.new(45, 45, 45, 45)
_vzx9h2h6xk5.Parent = _vsghk88e6xf

local _v1j8ojnurb3 = Instance.new(_S("121|191|235|218|230|222"))
_v1j8ojnurb3.Name = _S("119|191|220|216|219|220|233")
_v1j8ojnurb3.Size = UDim2.new(1, 0, 0, 48)
_v1j8ojnurb3.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
_v1j8ojnurb3.BackgroundTransparency = 0.1
_v1j8ojnurb3.BorderSizePixel = 0
_v1j8ojnurb3.ZIndex = 2
_v1j8ojnurb3.Parent = _vsghk88e6xf

local _vg9zvrw9bw0 = Instance.new(_S("92|177|165|159|203|206|202|193|206"))
_vg9zvrw9bw0.CornerRadius = UDim.new(0, 14)
_vg9zvrw9bw0.Parent = _v1j8ojnurb3

local _vutni0jrmar = Instance.new(_S("63|148|136|134|177|160|163|168|164|173|179"))
_vutni0jrmar.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 35, 65)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(25, 25, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 65)),
})
_vutni0jrmar.Rotation = 90
_vutni0jrmar.Parent = _v1j8ojnurb3

local _vsbtb4fcrcb = Instance.new(_S("80|164|181|200|196|156|177|178|181|188"))
_vsbtb4fcrcb.Size = UDim2.new(0.65, 0, 1, 0)
_vsbtb4fcrcb.Position = UDim2.new(0.04, 0, 0, 0)
_vsbtb4fcrcb.BackgroundTransparency = 1
_vsbtb4fcrcb.Text = _S("77|10012|109|154|182|187|178|174|109|154|188|194|187|193|174|182|187|109|195|132")
_vsbtb4fcrcb.TextColor3 = Color3.fromRGB(130, 170, 255)
_vsbtb4fcrcb.Font = Enum.Font.GothamBold
_vsbtb4fcrcb.TextSize = _v4zeoxluz6v and 13 or 15
_vsbtb4fcrcb.TextXAlignment = Enum.TextXAlignment.Left
_vsbtb4fcrcb.ZIndex = 3
_vsbtb4fcrcb.Parent = _v1j8ojnurb3

local _vlx1zfu6am4 = Instance.new(_S("127|211|228|247|243|203|224|225|228|235"))
_vlx1zfu6am4.Size = UDim2.new(0, 42, 0, 18)
_vlx1zfu6am4.Position = UDim2.new(0.65, 0, 0.5, -9)
_vlx1zfu6am4.BackgroundColor3 = Color3.fromRGB(60, 100, 255)
_vlx1zfu6am4.BorderSizePixel = 0
_vlx1zfu6am4.Text = Exec.Name:sub(1, 6)
_vlx1zfu6am4.TextColor3 = Color3.fromRGB(255, 255, 255)
_vlx1zfu6am4.Font = Enum.Font.GothamBold
_vlx1zfu6am4.TextSize = 10
_vlx1zfu6am4.Parent = _v1j8ojnurb3

local _vw5daf5wrdc = Instance.new(_S("72|157|145|139|183|186|182|173|186"))
_vw5daf5wrdc.CornerRadius = UDim.new(0, 9)
_vw5daf5wrdc.Parent = _vlx1zfu6am4

local _vij6nc3x023 = Instance.new(_S("76|160|177|196|192|142|193|192|192|187|186"))
_vij6nc3x023.Size = UDim2.new(0, 40, 0, 28)
_vij6nc3x023.Position = UDim2.new(1, -48, 0, 10)
_vij6nc3x023.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
_vij6nc3x023.BorderSizePixel = 0
_vij6nc3x023.Text = _S("64|8276")
_vij6nc3x023.TextColor3 = Color3.fromRGB(255, 255, 255)
_vij6nc3x023.Font = Enum.Font.GothamBold
_vij6nc3x023.TextSize = 14
_vij6nc3x023.ZIndex = 3
_vij6nc3x023.Parent = _v1j8ojnurb3

local _vbsdi14y1vs = Instance.new(_S("86|171|159|153|197|200|196|187|200"))
_vbsdi14y1vs.CornerRadius = UDim.new(0, 8)
_vbsdi14y1vs.Parent = _vij6nc3x023

local _vxfabeob23l = Instance.new(_S("83|153|197|180|192|184"))
_vxfabeob23l.Size = _vgd1bcsnpe1
_vxfabeob23l.Position = _vry77uep8b0
_vxfabeob23l.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
_vxfabeob23l.BackgroundTransparency = 0.15
_vxfabeob23l.BorderSizePixel = 0
_vxfabeob23l.Visible = false
_vxfabeob23l.Parent = _vf46h0npein

local _v9sklvri1md = Instance.new(_S("120|205|193|187|231|234|230|221|234"))
_v9sklvri1md.CornerRadius = UDim.new(0, 12)
_v9sklvri1md.Parent = _vxfabeob23l

local _vfvwac84dm0 = Instance.new(_S("130|215|203|213|246|244|241|237|231"))
_vfvwac84dm0.Color = Color3.fromRGB(90, 130, 255)
_vfvwac84dm0.Thickness = 1.5
_vfvwac84dm0.Transparency = 0.2
_vfvwac84dm0.Parent = _vxfabeob23l

local _vqodjlr06dh = Instance.new(_S("81|165|182|201|197|157|178|179|182|189"))
_vqodjlr06dh.Size = UDim2.new(0.6, 0, 1, 0)
_vqodjlr06dh.Position = UDim2.new(0.06, 0, 0, 0)
_vqodjlr06dh.BackgroundTransparency = 1
_vqodjlr06dh.Text = _S("86|10021|118|163|191|196|187|183")
_vqodjlr06dh.TextColor3 = Color3.fromRGB(130, 170, 255)
_vqodjlr06dh.Font = Enum.Font.GothamBold
_vqodjlr06dh.TextSize = 13
_vqodjlr06dh.TextXAlignment = Enum.TextXAlignment.Left
_vqodjlr06dh.Parent = _vxfabeob23l

local _v0dtxxyd7x1 = Instance.new(_S("77|161|178|197|193|143|194|193|193|188|187"))
_v0dtxxyd7x1.Size = UDim2.new(0, 40, 0, 28)
_v0dtxxyd7x1.Position = UDim2.new(1, -48, 0, 7)
_v0dtxxyd7x1.BackgroundColor3 = Color3.fromRGB(60, 200, 100)
_v0dtxxyd7x1.BorderSizePixel = 0
_v0dtxxyd7x1.Text = _S("109|9742")
_v0dtxxyd7x1.TextColor3 = Color3.fromRGB(255, 255, 255)
_v0dtxxyd7x1.Font = Enum.Font.GothamBold
_v0dtxxyd7x1.TextSize = 14
_v0dtxxyd7x1.Parent = _vxfabeob23l

local _vu9k7n22m3b = Instance.new(_S("116|201|189|183|227|230|226|217|230"))
_vu9k7n22m3b.CornerRadius = UDim.new(0, 8)
_vu9k7n22m3b.Parent = _v0dtxxyd7x1

local _vp0fh66uuv7 = Instance.new(_S("102|172|216|199|211|203"))
_vp0fh66uuv7.Name = _S("116|200|213|214|182|213|230")
_vp0fh66uuv7.Size = UDim2.new(1, -12, 0, 32)
_vp0fh66uuv7.Position = UDim2.new(0, 6, 0, 52)
_vp0fh66uuv7.BackgroundTransparency = 1
_vp0fh66uuv7.Parent = _vsghk88e6xf

local _vz8pbikvgup = Instance.new(_S("116|201|189|192|221|231|232|192|213|237|227|233|232"))
_vz8pbikvgup.FillDirection = Enum.FillDirection.Horizontal
_vz8pbikvgup.SortOrder = Enum.SortOrder.LayoutOrder
_vz8pbikvgup.Padding = UDim.new(0, 3)
_vz8pbikvgup.Parent = _vp0fh66uuv7

local Tabs = {_S("91|161|188|205|200"), _S("98|181|199|206|206"), _S("76|145|159|156"), _S("107|176|227|219|215|218|212|223"), _S("72|156|183|183|180|187"), _S("98|175|203|213|197")}
local _vjuqlo8vb13 = {}
local _vk8rzgd44g7 = {}
local _v7n6khai3qz = #Tabs
local _vimycj3luvo = 1 / _v7n6khai3qz

for i, tabName in ipairs(Tabs) do
    local _vo6i0bzol9f = Instance.new(_S("86|170|187|206|202|152|203|202|202|197|196"))
    _vo6i0bzol9f.Name = tabName .. _S("84|168|181|182")
    _vo6i0bzol9f.Size = UDim2.new(_vimycj3luvo, -math.ceil(3 * (_v7n6khai3qz - 1) / _v7n6khai3qz), 1, 0)
    _vo6i0bzol9f.BackgroundColor3 = (tabName == _S("129|199|226|243|238")) and Color3.fromRGB(50, 90, 200) or Color3.fromRGB(30, 30, 50)
    _vo6i0bzol9f.BorderSizePixel = 0
    _vo6i0bzol9f.Text = tabName
    _vo6i0bzol9f.TextColor3 = Color3.fromRGB(220, 230, 255)
    _vo6i0bzol9f.Font = Enum.Font.GothamBold
    _vo6i0bzol9f.TextSize = _v4zeoxluz6v and 9 or 10
    _vo6i0bzol9f.LayoutOrder = i
    _vo6i0bzol9f.Parent = _vp0fh66uuv7

    local _v80iq32lvux = Instance.new(_S("69|154|142|136|180|183|179|170|183"))
    _v80iq32lvux.CornerRadius = UDim.new(0, 8)
    _v80iq32lvux.Parent = _vo6i0bzol9f

    _vjuqlo8vb13[tabName] = _vo6i0bzol9f
end

local _vbo4n714vqd = Instance.new(_S("67|137|181|164|176|168"))
_vbo4n714vqd.Name = _S("115|182|226|225|231|216|225|231|180|229|216|212")
_vbo4n714vqd.Size = UDim2.new(1, -12, 1, -90)
_vbo4n714vqd.Position = UDim2.new(0, 6, 0, 88)
_vbo4n714vqd.BackgroundTransparency = 1
_vbo4n714vqd.ClipsDescendants = true
_vbo4n714vqd.Parent = _vsghk88e6xf

for _, tabName in ipairs(Tabs) do
    local _vp0l8nv1hdy = Instance.new(_S("129|212|228|243|240|237|237|234|239|232|199|243|226|238|230"))
    _vp0l8nv1hdy.Name = tabName .. _S("62|129|173|172|178|163|172|178")
    _vp0l8nv1hdy.Size = UDim2.new(1, 0, 1, 0)
    _vp0l8nv1hdy.BackgroundTransparency = 1
    _vp0l8nv1hdy.BorderSizePixel = 0
    _vp0l8nv1hdy.ScrollBarThickness = 3
    _vp0l8nv1hdy.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
    _vp0l8nv1hdy.CanvasSize = UDim2.new(0, 0, 0, 0)
    _vp0l8nv1hdy.AutomaticCanvasSize = Enum.AutomaticSize.Y
    _vp0l8nv1hdy.Visible = (tabName == _S("102|172|199|216|211"))
    _vp0l8nv1hdy.Parent = _vbo4n714vqd

    local _vey63bhf42g = Instance.new(_S("108|193|181|184|213|223|224|184|205|229|219|225|224"))
    _vey63bhf42g.SortOrder = Enum.SortOrder.LayoutOrder
    _vey63bhf42g.Padding = UDim.new(0, 5)
    _vey63bhf42g.Parent = _vp0l8nv1hdy

    local _vkgzbpy8i8k = Instance.new(_S("103|188|176|183|200|203|203|208|213|206"))
    _vkgzbpy8i8k.PaddingTop = UDim.new(0, 2)
    _vkgzbpy8i8k.PaddingBottom = UDim.new(0, 2)
    _vkgzbpy8i8k.PaddingLeft = UDim.new(0, 2)
    _vkgzbpy8i8k.PaddingRight = UDim.new(0, 2)
    _vkgzbpy8i8k.Parent = _vp0l8nv1hdy

    _vk8rzgd44g7[tabName] = _vp0l8nv1hdy
end

local function _vhk8nzqej6a(tabName)
    State.TabOpen = tabName
    for name, frame in pairs(_vk8rzgd44g7) do
        frame.Visible = (name == tabName)
    end
    for name, btn in pairs(_vjuqlo8vb13) do
        btn.BackgroundColor3 = (name == tabName) and Color3.fromRGB(50, 90, 200) or Color3.fromRGB(30, 30, 50)
    end
end

for tabName, btn in pairs(_vjuqlo8vb13) do
    btn.MouseButton1Click:Connect(function()
        _vhk8nzqej6a(tabName)
    end)
end

local _vriaxtvu37e = 0

local function _vj4wh40mirs(parent, title)
    _vriaxtvu37e = _vriaxtvu37e + 1
    local label = Instance.new(_S("119|203|220|239|235|195|216|217|220|227"))
    label.Size = UDim2.new(1, 0, 0, 26)
    label.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    label.BorderSizePixel = 0
    label.Text = _S("60|92|92") .. title
    label.TextColor3 = Color3.fromRGB(100, 150, 255)
    label.Font = Enum.Font.GothamBold
    label.TextSize = _v4zeoxluz6v and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.LayoutOrder = _vriaxtvu37e
    label.Parent = parent

    local _vi7ksmogfeo = Instance.new(_S("97|182|170|164|208|211|207|198|211"))
    _vi7ksmogfeo.CornerRadius = UDim.new(0, 6)
    _vi7ksmogfeo.Parent = label
    return label
end

local function _vaxim674uba(parent, name, default, callback)
    _vriaxtvu37e = _vriaxtvu37e + 1
    local frame = Instance.new(_S("119|189|233|216|228|220"))
    frame.Size = UDim2.new(1, 0, 0, 38)
    frame.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
    frame.BorderSizePixel = 0
    frame.LayoutOrder = _vriaxtvu37e
    frame.Parent = parent

    local _vi7ksmogfeo = Instance.new(_S("85|170|158|152|196|199|195|186|199"))
    _vi7ksmogfeo.CornerRadius = UDim.new(0, 8)
    _vi7ksmogfeo.Parent = frame

    local label = Instance.new(_S("126|210|227|246|242|202|223|224|227|234"))
    label.Size = UDim2.new(0.65, 0, 1, 0)
    label.Position = UDim2.new(0.04, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(200, 210, 240)
    label.Font = Enum.Font.Gotham
    label.TextSize = _v4zeoxluz6v and 11 or 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local _vzcqn4d13fy = Instance.new(_S("129|213|230|249|245|195|246|245|245|240|239"))
    _vzcqn4d13fy.Size = UDim2.new(0, 52, 0, 24)
    _vzcqn4d13fy.Position = UDim2.new(1, -60, 0.5, -12)
    _vzcqn4d13fy.BackgroundColor3 = default and Color3.fromRGB(50, 180, 90) or Color3.fromRGB(50, 50, 70)
    _vzcqn4d13fy.BorderSizePixel = 0
    _vzcqn4d13fy.Text = default and _S("120|199|198") or _S("92|171|162|162")
    _vzcqn4d13fy.TextColor3 = Color3.fromRGB(255, 255, 255)
    _vzcqn4d13fy.Font = Enum.Font.GothamBold
    _vzcqn4d13fy.TextSize = 10
    _vzcqn4d13fy.Parent = frame

    local _v80iq32lvux = Instance.new(_S("78|163|151|145|189|192|188|179|192"))
    _v80iq32lvux.CornerRadius = UDim.new(0, 12)
    _v80iq32lvux.Parent = _vzcqn4d13fy

    local _vc0c9kbg6oa = default
    _vzcqn4d13fy.MouseButton1Click:Connect(function()
        _vc0c9kbg6oa = not _vc0c9kbg6oa
        _vzcqn4d13fy.BackgroundColor3 = _vc0c9kbg6oa and Color3.fromRGB(50, 180, 90) or Color3.fromRGB(50, 50, 70)
        _vzcqn4d13fy.Text = _vc0c9kbg6oa and _S("100|179|178") or _S("104|183|174|174")
        callback(_vc0c9kbg6oa)
    end)

    return frame, _vzcqn4d13fy
end

local function _vg9hp9sppst(parent, name, color, callback)
    _vriaxtvu37e = _vriaxtvu37e + 1
    local btn = Instance.new(_S("78|162|179|198|194|144|195|194|194|189|188"))
    btn.Size = UDim2.new(1, 0, 0, 34)
    btn.BackgroundColor3 = color
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = _v4zeoxluz6v and 11 or 12
    btn.LayoutOrder = _vriaxtvu37e
    btn.Parent = parent

    local _vi7ksmogfeo = Instance.new(_S("112|197|185|179|223|226|222|213|226"))
    _vi7ksmogfeo.CornerRadius = UDim.new(0, 8)
    _vi7ksmogfeo.Parent = btn

    btn.MouseButton1Click:Connect(callback)
    return btn
end

local function _vsflv52lm7x(parent, name, minVal, maxVal, defaultVal, callback)
    _vriaxtvu37e = _vriaxtvu37e + 1
    local frame = Instance.new(_S("78|148|192|175|187|179"))
    frame.Size = UDim2.new(1, 0, 0, 50)
    frame.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
    frame.BorderSizePixel = 0
    frame.LayoutOrder = _vriaxtvu37e
    frame.Parent = parent

    local _vi7ksmogfeo = Instance.new(_S("79|164|152|146|190|193|189|180|193"))
    _vi7ksmogfeo.CornerRadius = UDim.new(0, 8)
    _vi7ksmogfeo.Parent = frame

    local label = Instance.new(_S("110|194|211|230|226|186|207|208|211|218"))
    label.Size = UDim2.new(1, -12, 0, 20)
    label.Position = UDim2.new(0, 6, 0, 2)
    label.BackgroundTransparency = 1
    label.Text = name .. _S("75|133|107") .. tostring(defaultVal)
    label.TextColor3 = Color3.fromRGB(180, 195, 230)
    label.Font = Enum.Font.Gotham
    label.TextSize = _v4zeoxluz6v and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local _vgiiufb77n5 = Instance.new(_S("121|191|235|218|230|222"))
    _vgiiufb77n5.Size = UDim2.new(1, -12, 0, 14)
    _vgiiufb77n5.Position = UDim2.new(0, 6, 0, 28)
    _vgiiufb77n5.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    _vgiiufb77n5.BorderSizePixel = 0
    _vgiiufb77n5.Parent = frame

    local _vd1n95s6aom = Instance.new(_S("67|152|140|134|178|181|177|168|181"))
    _vd1n95s6aom.CornerRadius = UDim.new(0, 7)
    _vd1n95s6aom.Parent = _vgiiufb77n5

    local _va4v78uz5pe = Instance.new(_S("79|149|193|176|188|180"))
    local pct = (defaultVal - minVal) / (maxVal - minVal)
    _va4v78uz5pe.Size = UDim2.new(pct, 0, 1, 0)
    _va4v78uz5pe.BackgroundColor3 = Color3.fromRGB(70, 130, 255)
    _va4v78uz5pe.BorderSizePixel = 0
    _va4v78uz5pe.Parent = _vgiiufb77n5

    local _vsim3njiv7w = Instance.new(_S("116|201|189|183|227|230|226|217|230"))
    _vsim3njiv7w.CornerRadius = UDim.new(0, 7)
    _vsim3njiv7w.Parent = _va4v78uz5pe

    local _vfk0x2wmtnj = false
    local function _vbdo0jduwno(input)
        local relX = math.clamp((input.Position.X - _vgiiufb77n5.AbsolutePosition.X) / _vgiiufb77n5.AbsoluteSize.X, 0, 1)
        local val = math.floor(minVal + (maxVal - minVal) * relX)
        _va4v78uz5pe.Size = UDim2.new(relX, 0, 1, 0)
        label.Text = name .. _S("98|156|130") .. tostring(val)
        callback(val)
    end

    _vgiiufb77n5.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            _vfk0x2wmtnj = true
            _vbdo0jduwno(input)
        end
    end)

    _vyqj56q1cez.InputChanged:Connect(function(input)
        if _vfk0x2wmtnj and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            _vbdo0jduwno(input)
        end
    end)

    _vyqj56q1cez.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            _vfk0x2wmtnj = false
        end
    end)

    return frame
end

local function _vrtwjaqschu(parent, name, defaultText, callback)
    _vriaxtvu37e = _vriaxtvu37e + 1
    local frame = Instance.new(_S("77|147|191|174|186|178"))
    frame.Size = UDim2.new(1, 0, 0, 42)
    frame.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
    frame.BorderSizePixel = 0
    frame.LayoutOrder = _vriaxtvu37e
    frame.Parent = parent

    local _vi7ksmogfeo = Instance.new(_S("79|164|152|146|190|193|189|180|193"))
    _vi7ksmogfeo.CornerRadius = UDim.new(0, 8)
    _vi7ksmogfeo.Parent = frame

    local label = Instance.new(_S("130|214|231|250|246|206|227|228|231|238"))
    label.Size = UDim2.new(0.35, 0, 1, 0)
    label.Position = UDim2.new(0.03, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(180, 195, 230)
    label.Font = Enum.Font.Gotham
    label.TextSize = _v4zeoxluz6v and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local input = Instance.new(_S("88|172|189|208|204|154|199|208"))
    input.Size = UDim2.new(0.55, 0, 0, 26)
    input.Position = UDim2.new(0.4, 0, 0.5, -13)
    input.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    input.BorderSizePixel = 0
    input.Text = defaultText
    input.PlaceholderText = name
    input.TextColor3 = Color3.fromRGB(220, 220, 240)
    input.PlaceholderColor3 = Color3.fromRGB(100, 100, 120)
    input.Font = Enum.Font.Gotham
    input.TextSize = _v4zeoxluz6v and 10 or 11
    input.ClearTextOnFocus = false
    input.Parent = frame

    local _vfbrni2hizj = Instance.new(_S("66|151|139|133|177|180|176|167|180"))
    _vfbrni2hizj.CornerRadius = UDim.new(0, 6)
    _vfbrni2hizj.Parent = input

    input.FocusLost:Connect(function()
        callback(input.Text)
    end)

    return frame, input
end

local function _vjpmky5qv5g()
    _vriaxtvu37e = 0
end

local _vhkkn3400r6 = _vk8rzgd44g7[_S("91|161|188|205|200")]
_vjpmky5qv5g()

_vj4wh40mirs(_vhkkn3400r6, _S("64|128266|96|147|148|129|148|147"))
_vriaxtvu37e = _vriaxtvu37e + 1
local _vdig56m9r7c = Instance.new(_S("120|190|234|217|229|221"))
_vdig56m9r7c.Size = UDim2.new(1, 0, 0, 40)
_vdig56m9r7c.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
_vdig56m9r7c.BorderSizePixel = 0
_vdig56m9r7c.LayoutOrder = _vriaxtvu37e
_vdig56m9r7c.Parent = _vhkkn3400r6

local _v9fmxawthas = Instance.new(_S("69|154|142|136|180|183|179|170|183"))
_v9fmxawthas.CornerRadius = UDim.new(0, 8)
_v9fmxawthas.Parent = _vdig56m9r7c

local _v6oxy9cn8oo = Instance.new(_S("64|148|165|184|180|140|161|162|165|172"))
_v6oxy9cn8oo.Name = _S("83|166|199|180|199|198|167|184|203|199")
_v6oxy9cn8oo.Size = UDim2.new(1, -12, 0, 28)
_v6oxy9cn8oo.Position = UDim2.new(0, 6, 0, 0)
_v6oxy9cn8oo.BackgroundTransparency = 1
_v6oxy9cn8oo.Text = _S("108|185|213|218|209|208|166|140|156|140|232|140|191|209|216|216|223|166|140|156|140|232|140|192|205|222|211|209|224|166|140|186|219|218|209")
_v6oxy9cn8oo.TextColor3 = Color3.fromRGB(180, 200, 230)
_v6oxy9cn8oo.Font = Enum.Font.Gotham
_v6oxy9cn8oo.TextSize = _v4zeoxluz6v and 9 or 10
_v6oxy9cn8oo.TextXAlignment = Enum.TextXAlignment.Left
_v6oxy9cn8oo.TextWrapped = true
_v6oxy9cn8oo.Parent = _vdig56m9r7c

CashLabel = Instance.new(_S("103|187|204|223|219|179|200|201|204|211"))
CashLabel.Name = _S("69|136|166|184|173|153|170|189|185")
CashLabel.Size = UDim2.new(1, -12, 0, 18)
CashLabel.Position = UDim2.new(0, 6, 0, 28)
CashLabel.BackgroundTransparency = 1
CashLabel.Text = _S("73|140|170|188|177|131|105|121|105|197|105|160|174|178|176|177|189|131|105|121|120|122|121|121")
CashLabel.TextColor3 = Color3.fromRGB(255, 215, 100)
CashLabel.Font = Enum.Font.GothamBold
CashLabel.TextSize = _v4zeoxluz6v and 9 or 10
CashLabel.TextXAlignment = Enum.TextXAlignment.Left
CashLabel.Parent = _vdig56m9r7c

_vdig56m9r7c.Size = UDim2.new(1, 0, 0, 52)

local function _vapyizqoder()
    _v6oxy9cn8oo.Text = _S("126|203|231|236|227|226|184|158") .. State.FarmCount .. _S("122|154|246|154|205|223|230|230|237|180|154") .. State.SellCount .. _S("71|103|195|103|139|188|183|172|129|103") .. State.DupeCount .. _S("94|126|218|126|178|191|208|197|195|210|152|126") .. (State.CurrentTarget or _S("75|153|186|185|176"))
    if CashLabel then
        CashLabel.Text = _S("94|161|191|209|198|152|126") .. _vefflc828k2() .. _S("81|113|205|113|168|182|186|184|185|197|139|113") .. math.floor(_vt34emstibn()) .. _S("96|143") .. math.floor(_v3l5jm5jkyq())
    end
end

_vj4wh40mirs(_vhkkn3400r6, _S("72|128332|104|155|149|137|154|156|104|148|151|151|152"))

_vaxim674uba(_vhkkn3400r6, _S("123|206|232|220|237|239|155|199|234|234|235|155|163|193|220|237|232|8717|206|224|231|231|8717|208|235|226|237|220|223|224|164"), false, function(val)
    _v0boleg0gr6.SmartLoop = val
    if val then _v5fbsz8bp5c() else _vzhf8a5i9le() end
end)

_vaxim674uba(_vhkkn3400r6, _S("106|171|223|222|217|138|175|219|223|211|218|138|172|207|221|222|138|186|211|205|213|203|226|207"), false, function(val)
    _v0boleg0gr6.AutoEquipPickaxe = val
end)

_vaxim674uba(_vhkkn3400r6, _S("129|211|226|241|234|229|161|206|234|239|230|161|169|238|246|237|245|234|174|233|234|245|170"), false, function(val)
    _v0boleg0gr6.RapidMine = val
end)

_vsflv52lm7x(_vhkkn3400r6, _S("98|180|195|210|203|198|130|175|203|208|199|130|170|203|214|213"), 1, 10, 3, function(val)
    _v0boleg0gr6.RapidMineCount = val
end)

_vaxim674uba(_vhkkn3400r6, _S("124|189|241|240|235|156|191|235|232|232|225|223|240|156|192|238|235|236|239"), false, function(val)
    _v0boleg0gr6.AutoCollectDrops = val
    if val then _vkwg3ulgcee() else State.DropCollectConn = nil end
end)

_vaxim674uba(_vhkkn3400r6, _S("113|179|234|225|210|228|228|145|193|227|224|222|225|229|145|185|224|221|213"), true, function(val)
    _v0boleg0gr6.BypassPromptHold = val
end)

_vaxim674uba(_vhkkn3400r6, _S("111|195|230|212|212|221|143|195|212|219|212|223|222|225|227"), false, function(val)
    _v0boleg0gr6.TweenTeleport = val
end)

_vj4wh40mirs(_vhkkn3400r6, _S("80|127999|112|159|162|149|112|150|153|156|164|149|162"))

_vaxim674uba(_vhkkn3400r6, _S("106|175|216|203|204|214|207|138|185|220|207|138|176|211|214|222|207|220"), false, function(val)
    _v0boleg0gr6.OreFilterEnabled = val
end)

_vrtwjaqschu(_vhkkn3400r6, _S("120|207|224|225|236|221|228|225|235|236|152|199|234|221|235"), _v0boleg0gr6.OreFilter, function(text)
    _v0boleg0gr6.OreFilter = text
end)

_vrtwjaqschu(_vhkkn3400r6, _S("61|127|169|158|160|168|169|166|176|177|93|140|175|162|176"), _v0boleg0gr6.OreBlacklist, function(text)
    _v0boleg0gr6.OreBlacklist = text
end)

_vj4wh40mirs(_vhkkn3400r6, _S("81|10016|113|146|166|165|160|113|151|146|163|158"))

_vaxim674uba(_vhkkn3400r6, _S("78|143|195|194|189|110|148|175|192|187|110|160|189|177|185|193|125|145|192|199|193|194|175|186|193"), false, function(val)
    _v0boleg0gr6.AutoFarm = val
    if val then _v9lpbo0nirm() else _vjvdni0h55i() end
end)

_vaxim674uba(_vhkkn3400r6, _S("93|173|207|198|204|207|198|209|214|125|165|198|196|197|194|208|209|125|179|190|201|210|194"), false, function(val)
    _v0boleg0gr6.PriorityHighestValue = val
    if val then _v0boleg0gr6.PriorityClosest = false end
end)

_vaxim674uba(_vhkkn3400r6, _S("83|163|197|188|194|197|188|199|204|115|150|191|194|198|184|198|199"), true, function(val)
    _v0boleg0gr6.PriorityClosest = val
    if val then _v0boleg0gr6.PriorityHighestValue = false end
end)

_vsflv52lm7x(_vhkkn3400r6, _S("62|132|159|176|171|94|144|159|162|167|179|177"), 50, 2000, 500, function(val)
    _v0boleg0gr6.FarmRadius = val
end)

_vsflv52lm7x(_vhkkn3400r6, _S("110|180|207|224|219|142|178|211|218|207|231"), 1, 100, 5, function(val)
    _v0boleg0gr6.FarmDelay = val / 100
end)

_vg9hp9sppst(_vhkkn3400r6, _S("70|128339|102|153|169|167|180|102|152|181|169|177|185|102|148|181|189"), Color3.fromRGB(40, 80, 160), function()
    local rocks = _v9c3jduvi10()
    _vr7cusucn10(_S("82|152|193|199|192|182|114") .. #rocks .. _S("108|140|222|219|207|215|223|155|207|222|229|223|224|205|216|223"))
end)

_vg9hp9sppst(_vhkkn3400r6, _S("120|10055|152|197|225|230|221|152|198|221|217|234|221|235|236|152|202|231|219|227"), Color3.fromRGB(40, 120, 60), function()
    local rocks = _v9c3jduvi10()
    if #rocks > 0 then
        _vbq9btuy6nn(rocks[1])
    else
        _vr7cusucn10(_S("97|175|208|129|211|208|196|204|212|129|199|208|214|207|197|130"))
    end
end)

_vg9hp9sppst(_vhkkn3400r6, _S("109|9998|141|176|206|208|213|210|141|191|210|218|220|225|210|224"), Color3.fromRGB(100, 50, 150), function()
    _vui0mhnvd62()
end)

local _vexyajw3mdk = _vk8rzgd44g7[_S("73|156|174|181|181")]
_vjpmky5qv5g()

_vj4wh40mirs(_vexyajw3mdk, _S("74|128250|106|139|159|158|153|106|157|143|150|150"))

_vaxim674uba(_vexyajw3mdk, _S("70|153|171|178|178|102|157|174|171|180|102|136|167|169|177|182|167|169|177|102|140|187|178|178"), true, function(val)
    _v0boleg0gr6.SellWhenFull = val
end)

_vsflv52lm7x(_vexyajw3mdk, _S("80|163|181|188|188|112|157|185|190|112|147|177|195|184|112|164|184|194|181|195|184|191|188|180"), 0, 500000, 0, function(val)
    _v0boleg0gr6.SellMinCash = val
end)

_vaxim674uba(_vexyajw3mdk, _S("83|148|200|199|194|115|166|184|191|191"), false, function(val)
    _v0boleg0gr6.AutoSell = val
    if val then _v6fno2723ag() else _v79fac7g8tn() end
end)

_vsflv52lm7x(_vexyajw3mdk, _S("61|144|162|169|169|93|143|158|161|166|178|176"), 50, 1000, 300, function(val)
    _v0boleg0gr6.SellRadius = val
end)

_vsflv52lm7x(_vexyajw3mdk, _S("95|178|196|203|203|127|163|196|203|192|216"), 1, 50, 3, function(val)
    _v0boleg0gr6.SellDelay = val / 10
end)

_vg9hp9sppst(_vexyajw3mdk, _S("83|128259|115|166|184|191|191|115|180|199|115|161|184|180|197|184|198|199|115|166|187|194|195"), Color3.fromRGB(140, 100, 30), function()
    local shops = _vdiud8l85fq()
    if #shops > 0 then
        _vvtwdchtwpc(shops[1])
    else
        _vr7cusucn10(_S("75|153|186|107|190|179|186|187|190|107|177|186|192|185|175|108"))
    end
end)

_vg9hp9sppst(_vexyajw3mdk, _S("71|128039|103|142|182|103|143|182|180|172|103|118|103|155|172|179|172|183|182|185|187|103|187|182|103|154|175|182|183"), Color3.fromRGB(80, 50, 150), function()
    local shops = _vdiud8l85fq()
    if #shops > 0 then
        _vgxe7cwo18s(shops[1].Part.Position)
        _vr7cusucn10(_S("72|156|173|180|173|184|183|186|188|173|172|104|188|183|130|104") .. shops[1].Name)
    end
end)

_vj4wh40mirs(_vexyajw3mdk, _S("79|128801|111|144|164|163|158|111|145|164|168|111|164|159|150|161|144|147|148|162"))

_vaxim674uba(_vexyajw3mdk, _S("67|132|184|183|178|99|133|184|188|99|147|172|166|174|164|187|168"), false, function(val) _v0boleg0gr6.AutoBuyPickaxe = val end)
_vaxim674uba(_vexyajw3mdk, _S("108|173|225|224|219|140|174|225|229|140|174|205|207|215|220|205|207|215"), false, function(val) _v0boleg0gr6.AutoBuyBackpack = val end)
_vaxim674uba(_vexyajw3mdk, _S("89|154|206|205|200|121|155|206|210|121|165|206|188|196"), false, function(val) _v0boleg0gr6.AutoBuyLuck = val end)
_vaxim674uba(_vexyajw3mdk, _S("69|134|186|185|180|101|135|186|190|101|156|166|183|178|185|173"), false, function(val) _v0boleg0gr6.AutoBuyWarmth = val end)

_vaxim674uba(_vexyajw3mdk, _S("89|154|206|205|200|121|171|190|187|194|203|205|193"), false, function(val) _v0boleg0gr6.AutoRebirth = val end)

_vsflv52lm7x(_vexyajw3mdk, _S("73|155|174|171|178|187|189|177|105|140|170|188|177|105|157|177|187|174|188|177|184|181|173"), 1000, 1000000, 50000, function(val)
    _v0boleg0gr6.RebirthCashThreshold = val
end)

_vaxim674uba(_vexyajw3mdk, _S("66|131|183|182|177|98|133|174|163|171|175|98|134|163|171|174|187|113|133|177|166|167"), false, function(val) _v0boleg0gr6.AutoClaimDaily = val end)

_vrtwjaqschu(_vexyajw3mdk, _S("127|207|241|238|236|238|159|194|238|227|228"), _S("74|"), function(text) _v0boleg0gr6.PromoCode = text end)

_vg9hp9sppst(_vexyajw3mdk, _S("64|127937|96|131|172|161|169|173|96|132|161|169|172|185|96|142|175|183"), Color3.fromRGB(180, 130, 40), function()
    _va932p0e0eg()
    _vr7cusucn10(_S("127|194|235|224|232|236|228|227|159|227|224|232|235|248|159|241|228|246|224|241|227|242"))
end)

_vj4wh40mirs(_vexyajw3mdk, _S("68|128328|100|133|153|152|147|100|153|148|139|150|133|136|137"))

_vaxim674uba(_vexyajw3mdk, _S("129|194|246|245|240|161|214|241|232|243|226|229|230"), false, function(val)
    _v0boleg0gr6.AutoUpgrade = val
    if val then _vdyz378ekxg() else _v472c5i11kp() end
end)

_vg9hp9sppst(_vexyajw3mdk, _S("77|11091|109|162|189|180|191|174|177|178|109|142|185|185"), Color3.fromRGB(50, 130, 180), function()
    _vy1k1bkblg5(_S("99|216|211|202|213|196|199|200"))
    _vy1k1bkblg5(_S("107|205|224|228"))
    _vy1k1bkblg5(_S("83|195|200|197|182|187|180|198|184"))
    _vy1k1bkblg5(_S("129|248|226|243|238|245|233"))
    _vy1k1bkblg5(_S("83|195|188|182|190|180|203|184"))
    _vy1k1bkblg5(_S("122|220|219|221|229|234|219|221|229"))
    _vy1k1bkblg5(_S("98|213|210|199|199|198"))
    _vr7cusucn10(_S("60|130|165|174|161|160|92|177|172|163|174|157|160|161|92|174|161|169|171|176|161|175"))
end)

_vj4wh40mirs(_vexyajw3mdk, _S("68|128046|100|136|137|152|137|135|152|137|136|100|151|140|147|148|151"))

local _v1o3urk5tmk = Instance.new(_S("127|210|226|241|238|235|235|232|237|230|197|241|224|236|228"))
ShopList = _v1o3urk5tmk
ShopList.Name = _S("60|143|164|171|172|136|165|175|176")
ShopList.Size = UDim2.new(1, 0, 0, 90)
ShopList.BackgroundColor3 = Color3.fromRGB(18, 18, 30)
ShopList.BorderSizePixel = 0
ShopList.ScrollBarThickness = 2
ShopList.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
ShopList.CanvasSize = UDim2.new(0, 0, 0, 0)
ShopList.AutomaticCanvasSize = Enum.AutomaticSize.Y
_vriaxtvu37e = _vriaxtvu37e + 1
ShopList.LayoutOrder = _vriaxtvu37e
ShopList.Parent = _vexyajw3mdk

local _vkc18m9kfyr = Instance.new(_S("88|173|161|155|199|202|198|189|202"))
_vkc18m9kfyr.CornerRadius = UDim.new(0, 6)
_vkc18m9kfyr.Parent = ShopList

local _vlatauqzid9 = Instance.new(_S("105|190|178|181|210|220|221|181|202|226|216|222|221"))
_vlatauqzid9.SortOrder = Enum.SortOrder.LayoutOrder
_vlatauqzid9.Padding = UDim.new(0, 2)
_vlatauqzid9.Parent = ShopList

local _vu8e57lxkps = Instance.new(_S("83|168|156|163|180|183|183|188|193|186"))
_vu8e57lxkps.PaddingTop = UDim.new(0, 2)
_vu8e57lxkps.PaddingBottom = UDim.new(0, 2)
_vu8e57lxkps.PaddingLeft = UDim.new(0, 2)
_vu8e57lxkps.PaddingRight = UDim.new(0, 2)
_vu8e57lxkps.Parent = ShopList

local _v3f2lbo05dt = _vk8rzgd44g7[_S("118|187|201|198")]
_vjpmky5qv5g()

_vj4wh40mirs(_v3f2lbo05dt, _S("127|128192|159|196|210|207|159|174|159|213|200|210|212|192|203|210"))

_vaxim674uba(_v3f2lbo05dt, _S("64|131|178|185|179|180|161|172|96|111|96|146|175|163|171|96|133|147|144"), false, function(val)
    _v0boleg0gr6.ESPEnabled = val
    if val then _v1ewlw47rnd() else _vkgp2o1gzvi() end
end)

_vaxim674uba(_v3f2lbo05dt, _S("86|170|200|183|185|187|200|201|118|126|168|197|185|193|201|133|169|190|197|198|201|127"), false, function(val)
    _v0boleg0gr6.Tracers = val
    if not val then _vqgrmy63pns() end
end)

_vaxim674uba(_v3f2lbo05dt, _S("72|152|180|169|193|173|186|104|141|155|152"), false, function(val)
    _v0boleg0gr6.PlayerESP = val
    if not val then _vco2fxbpbyy() end
end)

_vaxim674uba(_v3f2lbo05dt, _S("61|128|165|162|176|177|93|108|93|130|179|162|171|177|93|130|144|141"), false, function(val)
    _v0boleg0gr6.ChestESP = val
    if not val then _vrd0nr6m06z() end
end)

_vaxim674uba(_v3f2lbo05dt, _S("94|164|211|202|202|192|208|199|197|198|210"), false, function(val)
    _v0boleg0gr6.Fullbright = val
    if val then _vjzha7219yk() else _vy6ht3x13qu() end
end)

_vaxim674uba(_v3f2lbo05dt, _S("104|176|209|204|205|136|183|220|208|205|218|136|184|212|201|225|205|218|219"), false, function(val)
    _v0boleg0gr6.HideOtherPlayers = val
    _vcuspak1b50()
end)

_vg9hp9sppst(_v3f2lbo05dt, _S("95|128355|127|177|196|197|209|196|210|199|127|164|178|175"), Color3.fromRGB(50, 90, 160), function()
    if _v0boleg0gr6.ESPEnabled then
        _vlu1zgh3mow()
    else
        _vr7cusucn10(_S("67|136|177|164|165|175|168|99|136|150|147|99|169|172|181|182|183|100"))
    end
end)

_vg9hp9sppst(_v3f2lbo05dt, _S("119|10179|151|186|227|220|216|233|151|188|202|199"), Color3.fromRGB(150, 50, 50), function()
    _vkgp2o1gzvi()
end)

_vj4wh40mirs(_v3f2lbo05dt, _S("68|129772|100|136|137|152|137|135|152|137|136|100|150|147|135|143|151"))

local _v2rvn19y61t = Instance.new(_S("86|169|185|200|197|194|194|191|196|189|156|200|183|195|187"))
RockList = _v2rvn19y61t
RockList.Name = _S("112|194|223|211|219|188|217|227|228")
RockList.Size = UDim2.new(1, 0, 0, 120)
RockList.BackgroundColor3 = Color3.fromRGB(18, 18, 30)
RockList.BorderSizePixel = 0
RockList.ScrollBarThickness = 2
RockList.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
RockList.CanvasSize = UDim2.new(0, 0, 0, 0)
RockList.AutomaticCanvasSize = Enum.AutomaticSize.Y
_vriaxtvu37e = _vriaxtvu37e + 1
RockList.LayoutOrder = _vriaxtvu37e
RockList.Parent = _v3f2lbo05dt

local _vt9y8ovjv40 = Instance.new(_S("68|153|141|135|179|182|178|169|182"))
_vt9y8ovjv40.CornerRadius = UDim.new(0, 6)
_vt9y8ovjv40.Parent = RockList

local _vdzsor3uw1r = Instance.new(_S("88|173|161|164|193|203|204|164|185|209|199|205|204"))
_vdzsor3uw1r.SortOrder = Enum.SortOrder.LayoutOrder
_vdzsor3uw1r.Padding = UDim.new(0, 2)
_vdzsor3uw1r.Parent = RockList

local rLPad = Instance.new(_S("116|201|189|196|213|216|216|221|226|219"))
rLPad.PaddingTop = UDim.new(0, 2)
rLPad.PaddingBottom = UDim.new(0, 2)
rLPad.PaddingLeft = UDim.new(0, 2)
rLPad.PaddingRight = UDim.new(0, 2)
rLPad.Parent = RockList

local _vndhv077fi4 = _vk8rzgd44g7[_S("101|170|221|213|209|212|206|217")]
_vjpmky5qv5g()

_vj4wh40mirs(_vndhv077fi4, _S("79|127969|111|148|167|159|155|158|152|163|162"))

_vaxim674uba(_vndhv077fi4, _S("125|210|235|233|230|234|230|241|226|225|157|191|222|224|232|237|222|224|232"), false, function(val)
    _v0boleg0gr6.UnlimitedBackpack = val
    if val then _vntduntx90g() end
end)

_vaxim674uba(_vndhv077fi4, _S("120|205|230|228|225|229|225|236|221|220|152|196|237|219|227"), false, function(val)
    _v0boleg0gr6.UnlimitedLuck = val
    if val then _vxxxvr0z7ro() end
end)

_vaxim674uba(_vndhv077fi4, _S("112|177|222|228|217|144|180|209|221|209|215|213"), false, function(val)
    _v0boleg0gr6.AntiDamage = val
    if val then _vpnmzxaalc3() else _vbvmf71nvg1() end
end)

_vaxim674uba(_vndhv077fi4, _S("82|147|192|198|187|114|152|196|183|183|204|183|114|122|169|179|196|191|198|186|123"), false, function(val)
    _v0boleg0gr6.AntiFreeze = val
    if val and not _v0boleg0gr6.AntiDamage then
        _v0boleg0gr6.AntiDamage = true
        _vpnmzxaalc3()
    end
end)

_vaxim674uba(_vndhv077fi4, _S("124|211|221|238|233|240|228|156|199|225|225|236|225|238"), false, function(val)
    _v0boleg0gr6.WarmthKeeper = val
    if val or _v0boleg0gr6.StaminaKeeper then _vp8yiekuy38() else _vsx7owh6039() end
end)

_vaxim674uba(_vndhv077fi4, _S("106|189|222|203|215|211|216|203|138|181|207|207|218|207|220"), false, function(val)
    _v0boleg0gr6.StaminaKeeper = val
    if val or _v0boleg0gr6.WarmthKeeper then _vp8yiekuy38() else _vsx7owh6039() end
end)

_vj4wh40mirs(_vndhv077fi4, _S("113|128030|145|190|192|199|182|190|182|191|197"))

_vaxim674uba(_vndhv077fi4, _S("86|169|198|187|187|186|118|152|197|197|201|202"), false, function(val)
    _v0boleg0gr6.SpeedBoost = val
    _v72n95m3eih()
end)

_vsflv52lm7x(_vndhv077fi4, _S("71|158|168|179|178|103|154|183|172|172|171"), 16, 200, 50, function(val)
    _v0boleg0gr6.WalkSpeed = val
    if _v0boleg0gr6.SpeedBoost then _v72n95m3eih() end
end)

_vaxim674uba(_vndhv077fi4, _S("72|150|183|171|180|177|184"), false, function(val)
    _v0boleg0gr6.Noclip = val
    if val then _v02whttlhhw() else _v5ycq2f481o() end
end)

_vaxim674uba(_vndhv077fi4, _S("107|177|215|228"), false, function(val)
    _v0boleg0gr6.FlyEnabled = val
    if val then _vpvz48rnfwo() else _vmvvnsrxdd2() end
end)

_vsflv52lm7x(_vndhv077fi4, _S("113|183|221|234|145|196|225|214|214|213"), 10, 200, 60, function(val)
    _v0boleg0gr6.FlySpeed = val
end)

_vaxim674uba(_vndhv077fi4, _S("127|200|237|229|232|237|232|243|228|159|201|244|236|239"), false, function(val)
    _v0boleg0gr6.InfiniteJump = val
    if val then _vugxsy603hp() else _vrwaicuffkp() end
end)

_vaxim674uba(_vndhv077fi4, _S("112|179|220|217|211|219|144|196|213|220|213|224|223|226|228|144|152|179|228|226|220|155|179|220|217|211|219|153"), false, function(val)
    _v0boleg0gr6.ClickTeleport = val
    if val then _vxmbj27hqip() else _vm9qdwwlk52() end
end)

_vj4wh40mirs(_vndhv077fi4, _S("62|128292|94|135|146|131|139|94|130|147|142|131"))

local dupeInput, dupeTextBox
dupeInput, dupeTextBox = _vrtwjaqschu(_vndhv077fi4, _S("97|165|214|209|198|129|178|213|218"), _S("126|175"), function(text)
    local num = tonumber(text)
    if num and num > 0 then
        _v0boleg0gr6.DupeAmount = math.floor(num)
    end
end)

_vg9hp9sppst(_vndhv077fi4, _S("107|128337|139|175|224|219|208|139|180|223|208|216|222|139|147") .. _v0boleg0gr6.DupeAmount .. _S("101|221|142"), Color3.fromRGB(180, 60, 180), function()
    _vh7eyuxnr23(_v0boleg0gr6.DupeAmount)
end)

_vg9hp9sppst(_vndhv077fi4, _S("97|128327|129|165|211|208|209|129|165|214|209|198|129|174|198|213|201|208|197"), Color3.fromRGB(140, 50, 140), function()
    _vob6o6zcmt3()
end)

_vj4wh40mirs(_vndhv077fi4, _S("97|128322|129|179|166|174|176|181|166|129|166|185|177|173|176|170|181|180"))

_vg9hp9sppst(_vndhv077fi4, _S("114|128407|146|184|219|228|215|146|179|222|222|146|191|219|224|215|146|196|215|223|225|230|215|229"), Color3.fromRGB(160, 40, 40), function()
    _vy1k1bkblg5(_S("88|197|193|198|189"))
    _vy1k1bkblg5(_S("112|212|217|215"))
    _vy1k1bkblg5(_S("112|216|209|226|230|213|227|228"))
    _vy1k1bkblg5(_S("104|203|215|212|212|205|203|220"))
    _vy1k1bkblg5(_S("107|205|221|208|204|214"))
    _vr7cusucn10(_S("122|192|227|236|223|222|154|231|227|232|223|154|236|223|231|233|238|223|237"))
end)

_vg9hp9sppst(_vndhv077fi4, _S("63|128239|95|133|168|177|164|95|128|171|171|95|146|164|171|171|95|145|164|172|174|179|164|178"), Color3.fromRGB(40, 140, 40), function()
    _vy1k1bkblg5(_S("101|216|202|209|209"))
    _vy1k1bkblg5(_S("100|215|201|208|208|197|208|208"))
    _vy1k1bkblg5(_S("90|189|187|205|194"))
    _vy1k1bkblg5(_S("72|181|183|182|173|193"))
    _vy1k1bkblg5(_S("97|213|211|194|197|198"))
    _vr7cusucn10(_S("75|145|180|189|176|175|107|190|176|183|183|107|189|176|184|186|191|176|190"))
end)

_vg9hp9sppst(_vndhv077fi4, _S("79|11093|111|149|184|193|180|111|144|187|187|111|164|191|182|193|176|179|180|111|161|180|188|190|195|180|194"), Color3.fromRGB(40, 100, 160), function()
    _vy1k1bkblg5(_S("122|239|234|225|236|219|222|223"))
    _vy1k1bkblg5(_S("79|177|196|200"))
    _vy1k1bkblg5(_S("119|231|236|233|218|223|216|234|220"))
    _vy1k1bkblg5(_S("76|195|173|190|185|192|180"))
    _vy1k1bkblg5(_S("108|220|213|207|215|205|228|209"))
    _vy1k1bkblg5(_S("119|217|216|218|226|231|216|218|226"))
    _vr7cusucn10(_S("104|174|209|218|205|204|136|221|216|207|218|201|204|205|136|218|205|213|215|220|205|219"))
end)

_vg9hp9sppst(_vndhv077fi4, _S("61|127983|93|131|166|175|162|93|126|169|169|93|137|178|160|168|93|143|162|170|172|177|162|176"), Color3.fromRGB(140, 140, 40), function()
    _vy1k1bkblg5(_S("107|215|224|206|214"))
    _vy1k1bkblg5(_S("75|183|192|174|182|196"))
    _vy1k1bkblg5(_S("90|192|201|204|206|207|200|191"))
    _vy1k1bkblg5(_S("87|185|195|188|202|202|192|197|190"))
    _vr7cusucn10(_S("69|139|174|183|170|169|101|177|186|168|176|101|183|170|178|180|185|170|184"))
end)

_vg9hp9sppst(_vndhv077fi4, _S("83|128246|115|153|188|197|184|115|148|159|159|115|165|184|192|194|199|184|198|115|123|161|200|190|184|124"), Color3.fromRGB(200, 50, 50), function()
    for _, remote in ipairs(State.RemoteCache) do
        pcall(function()
            if remote.Type == _S("86|168|187|195|197|202|187|155|204|187|196|202") then
                remote.Instance:FireServer()
            elseif remote.Type == _S("123|205|224|232|234|239|224|193|240|233|222|239|228|234|233") then
                remote.Instance:InvokeServer()
            end
        end)
    end
    _vr7cusucn10(_S("74|152|159|149|143|142|106|171|182|182|106") .. #State.RemoteCache .. _S("99|131|213|200|208|210|215|200|214|132"))
end)

local _vi97w41tqox = _vk8rzgd44g7[_S("128|212|239|239|236|243")]
_vjpmky5qv5g()

_vj4wh40mirs(_vi97w41tqox, _S("67|128292|99|149|136|144|146|151|136|99|150|147|156"))

_vaxim674uba(_vi97w41tqox, _S("120|202|221|229|231|236|221|152|203|232|241|152|160|196|231|223|152|190|225|234|221|203|221|234|238|221|234|161"), false, function(val)
    _v0boleg0gr6.RemoteSpy = val
    if val then _v83d6ky6izd() else _vy26ugtwp50() end
end)

_vriaxtvu37e = _vriaxtvu37e + 1
local _vf8k0yopakl = Instance.new(_S("123|206|222|237|234|231|231|228|233|226|193|237|220|232|224"))
RemoteSpyList = _vf8k0yopakl
RemoteSpyList.Name = _S("109|191|210|218|220|225|210|192|221|230|185|214|224|225")
RemoteSpyList.Size = UDim2.new(1, 0, 0, 100)
RemoteSpyList.BackgroundColor3 = Color3.fromRGB(12, 12, 22)
RemoteSpyList.BorderSizePixel = 0
RemoteSpyList.ScrollBarThickness = 2
RemoteSpyList.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
RemoteSpyList.CanvasSize = UDim2.new(0, 0, 0, 0)
RemoteSpyList.AutomaticCanvasSize = Enum.AutomaticSize.Y
RemoteSpyList.LayoutOrder = _vriaxtvu37e
RemoteSpyList.Parent = _vi97w41tqox

local _vijtgzpen3f = Instance.new(_S("95|180|168|162|206|209|205|196|209"))
_vijtgzpen3f.CornerRadius = UDim.new(0, 6)
_vijtgzpen3f.Parent = RemoteSpyList

local _vn67fh1ahkl = Instance.new(_S("107|192|180|183|212|222|223|183|204|228|218|224|223"))
_vn67fh1ahkl.SortOrder = Enum.SortOrder.LayoutOrder
_vn67fh1ahkl.Padding = UDim.new(0, 2)
_vn67fh1ahkl.Parent = RemoteSpyList

local _vkihv2c3672 = Instance.new(_S("101|186|174|181|198|201|201|206|211|204"))
_vkihv2c3672.PaddingTop = UDim.new(0, 2)
_vkihv2c3672.PaddingLeft = UDim.new(0, 2)
_vkihv2c3672.PaddingRight = UDim.new(0, 2)
_vkihv2c3672.Parent = RemoteSpyList

_vg9hp9sppst(_vi97w41tqox, _S("80|128545|112|147|188|181|177|194|112|163|192|201|112|156|191|183"), Color3.fromRGB(100, 50, 50), function()
    State.RemoteSpyLogs = {}
    if RemoteSpyList then _v60o6fmnvwr(RemoteSpyList) end
end)

_vj4wh40mirs(_vi97w41tqox, _S("102|128021|134|169|187|185|186|181|179|134|184|171|179|181|186|171"))

_vrtwjaqschu(_vi97w41tqox, _S("125|207|226|234|236|241|226|157|203|222|234|226"), _S("60|"), function(text)
    _v0boleg0gr6.CustomRemoteName = text
end)

_vrtwjaqschu(_vi97w41tqox, _S("112|177|226|215|227|144|152|211|223|221|221|209|144|227|213|224|209|226|209|228|213|212|153"), _S("120|"), function(text)
    _v0boleg0gr6.CustomRemoteArgs = text
end)

_vg9hp9sppst(_vi97w41tqox, _S("73|128713|105|143|178|187|174|105|140|190|188|189|184|182|105|155|174|182|184|189|174"), Color3.fromRGB(160, 80, 40), function()
    _vi09gjpb41y()
end)

_vj4wh40mirs(_vi97w41tqox, _S("71|128276|103|158|136|160|151|150|144|149|155|154"))

_vg9hp9sppst(_vi97w41tqox, _S("88|128278|120|171|185|206|189|146|120|171|192|199|200"), Color3.fromRGB(50, 100, 160), function()
    _vxfyiwl16qj(_S("86|169|190|197|198"))
end)

_vg9hp9sppst(_vi97w41tqox, _S("117|128307|149|200|214|235|218|175|149|187|214|231|226|149|200|229|228|233"), Color3.fromRGB(50, 130, 80), function()
    _vxfyiwl16qj(_S("67|137|164|181|176"))
end)

_vg9hp9sppst(_vi97w41tqox, _S("122|128312|154|205|219|240|223|180|154|205|234|219|241|232"), Color3.fromRGB(80, 80, 140), function()
    _vxfyiwl16qj(_S("96|179|208|193|215|206"))
end)

_vg9hp9sppst(_vi97w41tqox, _S("103|128308|135|187|183|135|8697|135|186|207|214|215"), Color3.fromRGB(40, 90, 140), function()
    _v4ghacq4rpo(_S("70|153|174|181|182"))
end)

_vg9hp9sppst(_vi97w41tqox, _S("68|128273|100|152|148|100|8662|100|138|165|182|177|100|151|180|179|184"), Color3.fromRGB(40, 120, 70), function()
    _v4ghacq4rpo(_S("116|186|213|230|225"))
end)

_vg9hp9sppst(_vi97w41tqox, _S("83|128288|115|167|163|115|8677|115|166|195|180|202|193"), Color3.fromRGB(70, 70, 130), function()
    _v4ghacq4rpo(_S("108|191|220|205|227|218"))
end)

local _vo7fq7gqd9u = _vk8rzgd44g7[_S("90|167|195|205|189")]
_vjpmky5qv5g()

_vj4wh40mirs(_vo7fq7gqd9u, _S("112|9993|144|195|181|196|196|185|190|183|195"))

_vaxim674uba(_vo7fq7gqd9u, _S("122|187|232|238|227|167|187|192|197"), false, function(val)
    _v0boleg0gr6.AntiAFK = val
    if val then _v7eh98094s3() else _v6ssxtr51p4() end
end)

_vaxim674uba(_vo7fq7gqd9u, _S("125|190|242|241|236|157|207|226|240|237|222|244|235|157|168|157|207|226|222|237|237|233|246"), false, function(val)
    _v0boleg0gr6.AutoRespawn = val
end)

_vaxim674uba(_vo7fq7gqd9u, _S("101|171|181|184|133|167|212|212|216|217|202|215"), false, function(val)
    _v0boleg0gr6.FPSBooster = val
    if val then _vln19kjm9vj() end
end)

_vsflv52lm7x(_vo7fq7gqd9u, _S("121|204|222|235|239|222|235|153|193|232|233|153|161|230|226|231|165|153|169|182|232|223|223|162"), 0, 120, 0, function(val)
    _v0boleg0gr6.ServerHopInterval = val
    _v74qcmqphbz()
    if val > 0 then _vzgkchttcjn() end
end)

_vg9hp9sppst(_vo7fq7gqd9u, _S("123|127883|155|206|224|237|241|224|237|155|195|234|235|155|201|234|242"), Color3.fromRGB(60, 100, 160), function()
    _vwyoqlk0j4a()
end)

_vg9hp9sppst(_vo7fq7gqd9u, _S("76|128266|108|159|173|194|177|108|143|187|186|178|181|179"), Color3.fromRGB(50, 120, 80), function()
    _v15t6fbkr59()
end)

_vg9hp9sppst(_vo7fq7gqd9u, _S("121|128315|153|197|232|218|221|153|188|232|231|223|226|224"), Color3.fromRGB(80, 100, 160), function()
    _v13y8wdiwqv()
end)

_vg9hp9sppst(_vo7fq7gqd9u, _S("110|128790|142|190|175|188|183|177|142|150|193|226|221|222|142|175|218|218|151"), Color3.fromRGB(200, 40, 40), function()
    _vw93xyforzm()
end)

_vj4wh40mirs(_vo7fq7gqd9u, _S("82|9082|114|157|151|171|148|155|160|150|165"))
_vriaxtvu37e = _vriaxtvu37e + 1
local _vrvywl18pve = Instance.new(_S("63|147|164|183|179|139|160|161|164|171"))
_vrvywl18pve.Size = UDim2.new(1, 0, 0, 70)
_vrvywl18pve.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
_vrvywl18pve.BorderSizePixel = 0
_vrvywl18pve.Text = _S("78|110|110|160|183|181|182|194|161|182|183|180|194|110|139|110|162|189|181|181|186|179|110|149|163|151|170|188|110|110|148|110|139|110|162|189|181|181|186|179|110|148|186|199|170|188|110|110|149|110|139|110|162|189|181|181|186|179|110|143|195|194|189|110|148|175|192|187|170|188|110|110|150|110|139|110|162|189|181|181|186|179|110|161|187|175|192|194|110|154|189|189|190|170|188|110|110|158|110|139|110|158|175|188|183|177|110|161|194|189|190|110|143|186|186|170|188|110|110|145|194|192|186|121|145|186|183|177|185|110|139|110|145|186|183|177|185|110|162|158|110|118|183|180|110|179|188|175|176|186|179|178|119")
_vrvywl18pve.TextColor3 = Color3.fromRGB(160, 180, 210)
_vrvywl18pve.Font = Enum.Font.Gotham
_vrvywl18pve.TextSize = _v4zeoxluz6v and 9 or 10
_vrvywl18pve.TextXAlignment = Enum.TextXAlignment.Left
_vrvywl18pve.TextYAlignment = Enum.TextYAlignment.Top
_vrvywl18pve.TextWrapped = true
_vrvywl18pve.LayoutOrder = _vriaxtvu37e
_vrvywl18pve.Parent = _vo7fq7gqd9u
local _vcn7lc05gdx = Instance.new(_S("73|158|146|140|184|187|183|174|187"))
_vcn7lc05gdx.CornerRadius = UDim.new(0, 6)
_vcn7lc05gdx.Parent = _vrvywl18pve

_vj4wh40mirs(_vo7fq7gqd9u, _S("66|128269|98|142|145|137"))

local _vc8eng0ghmv = Instance.new(_S("119|202|218|233|230|227|227|224|229|222|189|233|216|228|220"))
LogList = _vc8eng0ghmv
LogList.Name = _S("101|177|212|204|177|206|216|217")
LogList.Size = UDim2.new(1, 0, 0, 100)
LogList.BackgroundColor3 = Color3.fromRGB(12, 12, 20)
LogList.BorderSizePixel = 0
LogList.ScrollBarThickness = 2
LogList.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
LogList.CanvasSize = UDim2.new(0, 0, 0, 0)
LogList.AutomaticCanvasSize = Enum.AutomaticSize.Y
_vriaxtvu37e = _vriaxtvu37e + 1
LogList.LayoutOrder = _vriaxtvu37e
LogList.Parent = _vo7fq7gqd9u

local _vdl6q9jnly3 = Instance.new(_S("97|182|170|164|208|211|207|198|211"))
_vdl6q9jnly3.CornerRadius = UDim.new(0, 6)
_vdl6q9jnly3.Parent = LogList

local _vwi1exnj6um = Instance.new(_S("93|178|166|169|198|208|209|169|190|214|204|210|209"))
_vwi1exnj6um.SortOrder = Enum.SortOrder.LayoutOrder
_vwi1exnj6um.Parent = LogList

local _ve5s5j8iq5e = Instance.new(_S("90|175|163|170|187|190|190|195|200|193"))
_ve5s5j8iq5e.PaddingTop = UDim.new(0, 3)
_ve5s5j8iq5e.PaddingLeft = UDim.new(0, 3)
_ve5s5j8iq5e.PaddingRight = UDim.new(0, 3)
_ve5s5j8iq5e.Parent = LogList

_vj4wh40mirs(_vo7fq7gqd9u, _S("108|128387|140|176|181|191|175|187|190|176|140|195|177|174|180|187|187|183"))

_vaxim674uba(_vo7fq7gqd9u, _S("70|139|180|167|168|178|171|102|157|171|168|174|181|181|177"), false, function(val)
    _v0boleg0gr6.WebhookEnabled = val
end)

_vrtwjaqschu(_vo7fq7gqd9u, _S("112|199|213|210|216|223|223|219|144|197|194|188"), _S("126|"), function(text)
    _v0boleg0gr6.WebhookURL = text
end)

_vaxim674uba(_vo7fq7gqd9u, _S("60|130|157|174|169|92|136|171|163|175"), true, function(val)
    _v0boleg0gr6.WebhookFarm = val
end)

_vaxim674uba(_vo7fq7gqd9u, _S("119|202|220|227|227|151|195|230|222|234"), true, function(val)
    _v0boleg0gr6.WebhookSell = val
end)

_vaxim674uba(_vo7fq7gqd9u, _S("82|165|198|179|198|197|114|158|193|185|197"), true, function(val)
    _v0boleg0gr6.WebhookStats = val
end)

_vg9hp9sppst(_vo7fq7gqd9u, _S("105|128337|137|188|206|215|205|137|188|221|202|221|220|137|183|216|224"), Color3.fromRGB(50, 90, 160), function()
    _vo9omc9lkcd()
    _vr7cusucn10(_S("120|203|221|230|236|152|235|236|217|236|235|152|236|231|152|239|221|218|224|231|231|227"))
end)

_vg9hp9sppst(_vo7fq7gqd9u, _S("99|129613|131|183|200|214|215|131|186|200|197|203|210|210|206"), Color3.fromRGB(90, 60, 140), function()
    _vx0wseiwry8({content = _S("91|133|133|182|168|196|201|192|188|123|168|202|208|201|207|188|196|201|123|209|146|184|133|133|123|178|192|189|195|202|202|198|123|207|192|206|207|123|206|208|190|190|192|206|206|193|208|199|124|123|10080")})
    _vr7cusucn10(_S("87|171|188|202|203|188|187|119|206|188|185|191|198|198|194"))
end)

_vj4wh40mirs(_vo7fq7gqd9u, _S("107|128402|139|192|191|180|183|180|191|180|176|190"))

_vg9hp9sppst(_vo7fq7gqd9u, _S("91|128059|123|175|192|199|192|203|202|205|207|123|207|202|123|174|203|188|210|201"), Color3.fromRGB(60, 90, 140), function()
    local _vax5xfal6lc = _vni9dzwsam5:FindFirstChild(_S("104|187|216|201|223|214|180|215|203|201|220|209|215|214")) or _vni9dzwsam5:FindFirstChild(_S("65|148|177|162|184|175|180")) or _vni9dzwsam5:FindFirstChild(_S("83|159|194|181|181|204"))
    if _vax5xfal6lc then
        if _vax5xfal6lc:IsA(_S("107|173|204|222|208|187|204|221|223")) then
            _vgxe7cwo18s(_vax5xfal6lc.Position)
        else
            local spawn = _vax5xfal6lc:FindFirstChildWhichIsA(_S("104|170|201|219|205|184|201|218|220"))
            if spawn then _vgxe7cwo18s(spawn.Position) end
        end
    else
        _vr7cusucn10(_S("105|183|216|137|220|217|202|224|215|137|207|216|222|215|205|138"))
    end
end)

_vg9hp9sppst(_vo7fq7gqd9u, _S("110|128066|142|194|211|218|211|222|221|224|226|142|226|221|142|187|221|227|220|226|207|215|220|142|194|221|222"), Color3.fromRGB(100, 60, 140), function()
    if _vwnfy35wc3s() then
        local _vr5yfpqregn = _vqzsv3795w7.Position.Y
        local _vrxgfrddkx5 = nil
        for _, part in ipairs(_vni9dzwsam5:GetDescendants()) do
            if part:IsA(_S("84|150|181|199|185|164|181|198|200")) and part.Position.Y > _vr5yfpqregn then
                _vr5yfpqregn = part.Position.Y
                _vrxgfrddkx5 = part
            end
        end
        if _vrxgfrddkx5 then
            _vgxe7cwo18s(_vrxgfrddkx5.Position + Vector3.new(0, 10, 0))
            _vr7cusucn10(_S("101|185|202|209|202|213|212|215|217|202|201|133|217|212|133|205|206|204|205|202|216|217|133|213|212|206|211|217|159|133") .. math.floor(_vr5yfpqregn))
        end
    end
end)

_vg9hp9sppst(_vo7fq7gqd9u, _S("72|128332|104|154|173|178|183|177|182|104|155|173|186|190|173|186"), Color3.fromRGB(100, 100, 50), function()
    pcall(function()
        _vudw9qq35re:Kick(_S("112|194|213|218|223|217|222|217|222|215|158|158|158"))
        task.wait(1)
        game:GetService(_S("67|151|168|175|168|179|178|181|183|150|168|181|185|172|166|168")):TeleportToPlaceInstance(game.PlaceId, game.JobId, _vudw9qq35re)
    end)
end)

_vj4wh40mirs(_vo7fq7gqd9u, _S("75|8580|107|148|153|145|154"))

_vriaxtvu37e = _vriaxtvu37e + 1
local _vkjk8h48nxh = Instance.new(_S("82|166|183|202|198|158|179|180|183|190"))
_vkjk8h48nxh.Size = UDim2.new(1, 0, 0, 50)
_vkjk8h48nxh.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
_vkjk8h48nxh.BorderSizePixel = 0
_vkjk8h48nxh.Text = _S("119|196|224|229|220|216|151|196|230|236|229|235|216|224|229|151|237|174|151|243|151|188|239|220|218|236|235|230|233|177|151") .. Exec.Name .. _S("69|161|179|152|178|166|183|185|101|145|180|180|181|101|193|101|151|170|178|180|185|170|101|152|181|190|101|193|101|138|152|149|112|101|193|101|156|166|190|181|180|174|179|185|184|161|179|137|170|177|185|166|101|252|101|152|190|179|166|181|184|170|101|252|101|144|151|147|145|101|252|101|139|177|186|189|186|184|101|252|101|156|166|187|170|101|252|101|136|180|169|170|189")
_vkjk8h48nxh.TextColor3 = Color3.fromRGB(140, 160, 200)
_vkjk8h48nxh.Font = Enum.Font.Gotham
_vkjk8h48nxh.TextSize = _v4zeoxluz6v and 9 or 10
_vkjk8h48nxh.TextWrapped = true
_vkjk8h48nxh.LayoutOrder = _vriaxtvu37e
_vkjk8h48nxh.Parent = _vo7fq7gqd9u

local _v75s7ad13oy = Instance.new(_S("122|207|195|189|233|236|232|223|236"))
_v75s7ad13oy.CornerRadius = UDim.new(0, 6)
_v75s7ad13oy.Parent = _vkjk8h48nxh

_vij6nc3x023.MouseButton1Click:Connect(function()
    State.IsMinimized = true
    local _v5l9r3sqghl = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local tween = _vbksmzikq46:Create(_vsghk88e6xf, _v5l9r3sqghl, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = _vry77uep8b0,
    })
    tween:Play()
    tween.Completed:Connect(function()
        _vsghk88e6xf.Visible = false
        _vxfabeob23l.Visible = true
        _vxfabeob23l.Size = UDim2.new(0, 0, 0, 0)
        local _v8pxswm8y9i = _vbksmzikq46:Create(_vxfabeob23l, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = _vgd1bcsnpe1,
        })
        _v8pxswm8y9i:Play()
    end)
end)

_v0dtxxyd7x1.MouseButton1Click:Connect(function()
    State.IsMinimized = false
    local _v5l9r3sqghl = TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local tween = _vbksmzikq46:Create(_vxfabeob23l, _v5l9r3sqghl, {
        Size = UDim2.new(0, 0, 0, 0),
    })
    tween:Play()
    tween.Completed:Connect(function()
        _vxfabeob23l.Visible = false
        _vsghk88e6xf.Visible = true
        _vsghk88e6xf.Size = UDim2.new(0, 0, 0, 0)
        local _v8pxswm8y9i = _vbksmzikq46:Create(_vsghk88e6xf, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = _veqp7tbafrq,
        })
        _v8pxswm8y9i:Play()
    end)
end)

local _v6pw0kjba6y = false
local dragInput
local dragStart
local startPos

local function _v5m6hu2xet6(input)
    local delta = input.Position - dragStart
    local _vqrwpfsjjad = State.IsMinimized and _vxfabeob23l or _vsghk88e6xf
    _vqrwpfsjjad.Position = UDim2.new(
        startPos.X.Scale, startPos.X.Offset + delta.X,
        startPos.Y.Scale, startPos.Y.Offset + delta.Y
    )
end

local function _vlszfahitli(frame)
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            _v6pw0kjba6y = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    _v6pw0kjba6y = false
                end
            end)
        end
    end)
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    _vyqj56q1cez.InputChanged:Connect(function(input)
        if input == dragInput and _v6pw0kjba6y then
            _v5m6hu2xet6(input)
        end
    end)
end

_vlszfahitli(_v1j8ojnurb3)
_vlszfahitli(_vxfabeob23l)

local _vvnmtfo9kjt = 0
task.spawn(function()
    while true do
        task.wait(1)
        pcall(_vapyizqoder)
        if _v0boleg0gr6.WebhookEnabled and _v0boleg0gr6.WebhookStats then
            local now = tick()
            if now - _vvnmtfo9kjt >= 30 then
                _vvnmtfo9kjt = now
                pcall(_vo9omc9lkcd)
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(10)
        pcall(function()
            local shops = _vdiud8l85fq()
            if ShopList then
                _v60o6fmnvwr(ShopList)
                for i, shop in ipairs(shops) do
                    if i > 15 then break end
                    local btn = Instance.new(_S("67|151|168|187|183|133|184|183|183|178|177"))
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Color3.fromRGB(30, 35, 50)
                    btn.BorderSizePixel = 0
                    btn.Text = shop.Name .. _S("80|112|171") .. math.floor(shop.Distance) .. _S("90|199|183")
                    btn.TextColor3 = Color3.fromRGB(200, 220, 255)
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = 11
                    btn.LayoutOrder = i
                    btn.Parent = ShopList
                    local _vxajcrcjq20 = Instance.new(_S("72|157|145|139|183|186|182|173|186"))
                    _vxajcrcjq20.CornerRadius = UDim.new(0, 5)
                    _vxajcrcjq20.Parent = btn
                    btn.MouseButton1Click:Connect(function()
                        _vgxe7cwo18s(shop.Part.Position)
                        _vr7cusucn10(_S("124|208|225|232|225|236|235|238|240|225|224|156|240|235|182|156") .. shop.Name)
                    end)
                end
            end
        end)

        pcall(function()
            local rocks = _v9c3jduvi10()
            if RockList then
                _v60o6fmnvwr(RockList)
                for i, rock in ipairs(rocks) do
                    if i > 20 then break end
                    local btn = Instance.new(_S("97|181|198|217|213|163|214|213|213|208|207"))
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Color3.fromRGB(30, 35, 50)
                    btn.BorderSizePixel = 0
                    btn.Text = rock.Name .. _S("83|115|174") .. math.floor(rock.Distance) .. _S("106|215|199") .. (rock.Value > 0 and (_S("121|153|157") .. rock.Value) or _S("60|"))
                    btn.TextColor3 = rock.Value > 0 and Color3.fromRGB(255, 215, 100) or Color3.fromRGB(200, 255, 200)
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = 11
                    btn.LayoutOrder = i
                    btn.Parent = RockList
                    local _vxajcrcjq20 = Instance.new(_S("110|195|183|177|221|224|220|211|224"))
                    _vxajcrcjq20.CornerRadius = UDim.new(0, 5)
                    _vxajcrcjq20.Parent = btn
                    btn.MouseButton1Click:Connect(function()
                        _vgxe7cwo18s(rock.Part.Position)
                        _vr7cusucn10(_S("114|198|215|222|215|226|225|228|230|215|214|146|230|225|172|146") .. rock.Name)
                    end)
                end
            end
        end)
    end
end)

_vyqj56q1cez.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        _vf46h0npein.Enabled = not _vf46h0npein.Enabled
        State.GUIHidden = not _vf46h0npein.Enabled
    elseif input.KeyCode == Enum.KeyCode.F then
        _v0boleg0gr6.FlyEnabled = not _v0boleg0gr6.FlyEnabled
        if _v0boleg0gr6.FlyEnabled then _vpvz48rnfwo() else _vmvvnsrxdd2() end
        _vr7cusucn10(_S("120|190|228|241|178|152") .. (_v0boleg0gr6.FlyEnabled and _S("121|200|199") or _S("65|144|135|135")))
    elseif input.KeyCode == Enum.KeyCode.G then
        _v0boleg0gr6.AutoFarm = not _v0boleg0gr6.AutoFarm
        if _v0boleg0gr6.AutoFarm then _v9lpbo0nirm() else _vjvdni0h55i() end
        _vr7cusucn10(_S("60|125|177|176|171|92|130|157|174|169|118|92") .. (_v0boleg0gr6.AutoFarm and _S("62|141|140") or _S("124|203|194|194")))
    elseif input.KeyCode == Enum.KeyCode.H then
        _v0boleg0gr6.SmartLoop = not _v0boleg0gr6.SmartLoop
        if _v0boleg0gr6.SmartLoop then _v5fbsz8bp5c() else _vzhf8a5i9le() end
        _vr7cusucn10(_S("84|167|193|181|198|200|116|160|195|195|196|142|116") .. (_v0boleg0gr6.SmartLoop and _S("102|181|180") or _S("124|203|194|194")))
    elseif input.KeyCode == Enum.KeyCode.P and _v0boleg0gr6.PanicEnabled then
        _vw93xyforzm()
        _vf46h0npein.Enabled = false
        State.GUIHidden = true
    end
end)

task.spawn(function()
    while true do
        task.wait(3)
        pcall(function()
            if _v0boleg0gr6.Tracers then _v06wr2sk1s4() end
            if _v0boleg0gr6.PlayerESP then _vdc4ulrk87i() end
            if _v0boleg0gr6.ChestESP then _vvqm5jpqluf() end
            if _v0boleg0gr6.HideOtherPlayers then _vcuspak1b50() end
            if _v0boleg0gr6.BypassPromptHold then _ve9naqto4ue(_vni9dzwsam5) end
        end)
    end
end)

_vudw9qq35re.CharacterAdded:Connect(function(char)
    Character = char
    _vqzsv3795w7 = char:WaitForChild(_S("106|178|223|215|203|216|217|211|206|188|217|217|222|186|203|220|222"))
    _vktnt2yiuxx = char:WaitForChild(_S("102|174|219|211|199|212|213|207|202"))
    _vr7cusucn10(_S("76|143|180|173|190|173|175|192|177|190|108|190|177|191|188|173|195|186|177|176"))

    task.delay(1, function()
        if _v0boleg0gr6.SpeedBoost then _v72n95m3eih() end
        if _v0boleg0gr6.FlyEnabled then _vmvvnsrxdd2() _vpvz48rnfwo() end
        if _v0boleg0gr6.InfiniteJump then _vrwaicuffkp() _vugxsy603hp() end
        if _v0boleg0gr6.AutoEquipPickaxe then _voalq60ytij() end
        if _v0boleg0gr6.AutoFarm and not State.FarmConnection then _v9lpbo0nirm() end
        if _v0boleg0gr6.SmartLoop and not State.SmartLoopConn then _v5fbsz8bp5c() end
        if _v0boleg0gr6.WarmthKeeper or _v0boleg0gr6.StaminaKeeper then _vp8yiekuy38() end
    end)
end)

_vudw9qq35re.CharacterRemoving:Connect(function()
    if _v0boleg0gr6.AutoRespawn then
        task.delay(3, function()
            pcall(function()
                if not _vudw9qq35re.Character then
                    Exec.LoadCharacter()
                end
            end)
        end)
    end
end)

if _v4mvpykouqg then
    _v4mvpykouqg:GetPropertyChangedSignal(_S("63|149|168|164|182|175|174|177|179|146|168|185|164")):Connect(function()
        local _ve3boqciib1 = _v4mvpykouqg.ViewportSize
        local isMob = _ve3boqciib1.X < 800
        _veqp7tbafrq = isMob and UDim2.new(0, 310, 0, 400) or UDim2.new(0, 360, 0, 480)
        if not State.IsMinimized then
            _vsghk88e6xf.Size = _veqp7tbafrq
        end
        _vsbtb4fcrcb.TextSize = isMob and 13 or 15
    end)
end

Exec.SetSimRadius()

pcall(function()
    _vr7cusucn10(_S("98|175|203|208|199|195|130|175|209|215|208|214|195|203|208|130|216|153|130|206|209|195|198|199|198|130|209|208|130") .. Exec.Name)
    _vr7cusucn10(_S("119|188|239|220|218|236|235|230|233|151|184|199|192|234|177|151|191|203|203|199|180") .. tostring(Exec.Request ~= nil) .. _S("63|95|135|174|174|170|124") .. tostring(Exec.HasHookMeta) .. _S("95|127|162|203|200|194|202|156") .. tostring(Exec.HasFireClick))
    _vr7cusucn10(_S("63|145|168|166|167|179|146|167|168|165|179|95|124|95|134|148|136|95|187|95|130|160|162|167|164|95|177|164|172|174|179|164|178|95|165|168|177|178|179|96"))
    _ve9naqto4ue(_vni9dzwsam5)
end)

task.delay(3, function()
    pcall(_vui0mhnvd62)
end)
