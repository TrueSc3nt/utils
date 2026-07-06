--[[ Minea v7 protected | TrueSc3nt ]]
local _S=function(s)local o=tonumber(s:match("^(%d+)%|"))local t={}for c in s:gmatch("(%d+)")do local n=tonumber(c)-o;if n>0 then t[#t+1]=n end endif utf8 and utf8.char then local ok,res=pcall(utf8.char,table.unpack(t))if ok then return res end endlocal r=""for i=1,#t do if t[i]<=255 then r=r..string.char(t[i])end end;return r end
if false then local _jk9xvp0rh=0 end
local _v3rhsro3ur2 = game:GetService(_S("113|193|221|210|234|214|227|228"))
local _vk057ncn1ru = game:GetService(_S("71|153|172|183|179|176|170|168|187|172|171|154|187|182|185|168|174|172"))
local _v7g1rkzie7j = game:GetService(_S("126|213|237|240|233|241|238|223|225|227"))
local _vaubu7dr6id = game:GetService(_S("78|160|195|188|161|179|192|196|183|177|179"))
local _vzq8shq2n9u = game:GetService(_S("66|150|185|167|167|176|149|167|180|184|171|165|167"))
local _v7g0rk761tx = game:GetService(_S("95|180|210|196|209|168|205|207|212|211|178|196|209|213|200|194|196"))
local HttpService = game:GetService(_S("115|187|231|231|227|198|216|229|233|220|214|216"))
local _v7ig3h2e8ho = game:GetService(_S("95|178|211|192|209|211|196|209|166|212|200"))
local _vsqltgi9up2 = game:GetService(_S("101|177|206|204|205|217|206|211|204"))
local _ve4tayuijtx = game:GetService(_S("100|184|201|208|201|212|211|214|216|183|201|214|218|205|199|201"))
local _vo06vlf6ycd = game:GetService(_S("78|145|189|186|186|179|177|194|183|189|188|161|179|192|196|183|177|179"))

local _vw7mory5oh0 = _v3rhsro3ur2.LocalPlayer
if not _vw7mory5oh0 then
    _vw7mory5oh0 = _v3rhsro3ur2.PlayerAdded:Wait()
end

local Character = _vw7mory5oh0.Character
local _v0p8wj67ppf = Character and Character:FindFirstChild(_S("75|147|192|184|172|185|186|180|175|157|186|186|191|155|172|189|191"))
local _v2y38mxkj21 = Character and Character:FindFirstChild(_S("74|146|191|183|171|184|185|179|174"))
if not Character then
    task.spawn(function()
        local char = _vw7mory5oh0.CharacterAdded:Wait()
        Character = char
        _v0p8wj67ppf = char:WaitForChild(_S("80|152|197|189|177|190|191|185|180|162|191|191|196|160|177|194|196"))
        _v2y38mxkj21 = char:WaitForChild(_S("68|140|185|177|165|178|179|173|168"))
    end)
end

local _v881x2wj21m = {
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
    WebhookURL = _S("88|"),
    WebhookEnabled = false,
    WebhookFarm = true,
    WebhookSell = true,
    WebhookStats = true,

    SmartLoop = false,
    OreFilterEnabled = false,
    OreFilter = _S("95|195|200|192|204|206|205|195|139|209|212|193|216|139|198|206|203|195|139|196|204|196|209|192|203|195|139|210|192|207|207|199|200|209|196|139|210|211|192|209|210|192|207|207|199|200|209|196|139|207|203|192|211|200|205|212|204"),
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
    PromoCode = _S("123|"),

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
    CustomRemoteName = _S("97|"),
    CustomRemoteArgs = _S("88|"),

    ServerHopInterval = 0,
    PanicEnabled = true,
}

local LogList, ShopList, RockList, RemoteSpyList, CashLabel, _v6am7tg9fjc

local State = {
    FarmConnection = nil,
    SellConnection = nil,
    ESPConnections = {},
    AntiDamageConn = nil,
    NoclipConn = nil,
    FlyConn = nil,
    UpgradeConn = nil,
    IsMinimized = false,
    CurrentTarget = _S("90|168|201|200|191"),
    FarmCount = 0,
    SellCount = 0,
    DupeCount = 0,
    UpgradeCount = 0,
    TotalEarnings = 0,
    Logs = {},
    ESPHighlights = {},
    RemoteCache = {},
    TabOpen = _S("74|144|171|188|183"),
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
        for i = 1, select(_S("122|157"), ...) do
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
            Exec.Name = _S("99|182|220|209|196|211|214|200")
        elseif KRNL_LOADED then
            Exec.Name = _S("125|200|207|203|201")
        elseif Fluxus then
            Exec.Name = _S("78|148|186|195|198|195|193")
        elseif delta then
            Exec.Name = _S("90|158|191|198|206|187")
        end
    end)

    Exec.SafeCClosure = newcclosure or newlclosure or function(f) return f end
    Exec.GetNamecallMethod = getnamecallmethod or getcallmethod or function() return _S("101|") end
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
            local cg = game:GetService(_S("96|163|207|210|197|167|213|201"))
            if cloneref then cg = cloneref(cg) end
            parent = cg
        end)
        if parent then return parent end
        return _vw7mory5oh0:WaitForChild(_S("128|208|236|225|249|229|242|199|245|233"))
    end

    Exec.HttpGet = function(url)
        local ok, result = pcall(function() return game:HttpGet(url) end)
        if ok and result then return result end
        if Exec.Request then
            local res = Exec.Request({Url = url, Method = _S("82|153|151|166")})
            if type(res) == _S("86|202|183|184|194|187") then
                return res.Body or res.body or res.BodyText
            end
        end
        return HttpService:GetAsync(url)
    end

    Exec.Post = function(url, body, contentType)
        contentType = contentType or _S("100|197|212|212|208|205|199|197|216|205|211|210|147|206|215|211|210")
        if Exec.Request then
            return Exec.Request({
                Url = url,
                Method = _S("67|147|146|150|151"),
                Headers = {[_S("60|127|171|170|176|161|170|176|105|144|181|172|161")] = contentType},
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
            elseif _vw7mory5oh0.LoadCharacter then _vw7mory5oh0:LoadCharacter() end
        end)
    end

    Exec.SetSimRadius = function()
        pcall(function()
            if setsimulationradius then setsimulationradius(1e9, 1e9) end
        end)
        pcall(function()
            if sethiddenproperty then
                sethiddenproperty(_vw7mory5oh0, _S("115|198|220|224|232|223|212|231|220|226|225|197|212|215|220|232|230"), 1e9)
                sethiddenproperty(_vw7mory5oh0, _S("68|145|165|188|151|173|177|185|176|165|184|173|179|178|150|165|168|173|185|183"), 1e9)
            end
        end)
    end

    local _v2yx5vqgk17 = {}
    local _vi9xf9gbml5 = nil
    local _vdbyaqzt7s7 = false

    function Exec.OnNamecall(fn)
        table.insert(_v2yx5vqgk17, fn)
        if not _vdbyaqzt7s7 and Exec.HasHookMeta then
            _vdbyaqzt7s7 = true
            pcall(function()
                _vi9xf9gbml5 = hookmetamethod(game, _S("69|164|164|179|166|178|170|168|166|177|177"), Exec.SafeCClosure(function(self, ...)
                    local method = Exec.GetNamecallMethod()
                    local args = {...}
                    for _, hook in ipairs(_v2yx5vqgk17) do
                        local block, ret = hook(self, method, args)
                        if block then return ret end
                    end
                    return _vi9xf9gbml5(self, ...)
                end))
            end)
        end
    end

    Exec.NamecallHooks = _v2yx5vqgk17

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

local _v0egrl00sf4 = false

pcall(function()
    if Exec.HasHookMeta and Exec.GetNamecallMethod then
        Exec.OnNamecall(function(self, method, args)

            if _v0egrl00sf4 and (method == _S("84|154|189|198|185|167|185|198|202|185|198") or method == _S("68|141|178|186|179|175|169|151|169|182|186|169|182")) then
                if self:IsA(_S("118|200|219|227|229|234|219|187|236|219|228|234")) or self:IsA(_S("105|187|206|214|216|221|206|175|222|215|204|221|210|216|215")) then
                    pcall(function() _v11aye0ci7z(self.Name, method, args) end)
                end
            end

            if method == _S("107|182|212|206|214") and self == _vw7mory5oh0 then
                return true, nil
            end

            if method == _S("89|159|194|199|189|172|190|203|207|194|188|190") then
                local svc = args[1]
                if svc == _S("95|164|215|207|203|206|200|211|178|196|209|213|200|194|196") or svc == _S("89|156|193|190|186|205|172|190|203|207|194|188|190") then
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
            local _v0uubkt8o74 = hookmetamethod(game, _S("92|187|187|197|202|192|193|212"), Exec.SafeCClosure(function(self, key)
                if _v2y38mxkj21 and self == _v2y38mxkj21 then
                    if key == _S("91|178|188|199|198|174|203|192|192|191") and _v881x2wj21m.SpeedBoost then return 16 end
                    if key == _S("83|157|200|192|195|163|194|202|184|197") and _v881x2wj21m.JumpPower > 50 then return 50 end
                end
                return _v0uubkt8o74(self, key)
            end))
        end)
        pcall(function()
            local _vobpuqrkyv8 = hookmetamethod(game, _S("126|221|221|236|227|245|231|236|226|227|246"), Exec.SafeCClosure(function(self, key, value)
                if _v2y38mxkj21 and self == _v2y38mxkj21 then
                    if key == _S("74|161|171|182|181|157|186|175|175|174") and _v881x2wj21m.SpeedBoost then
                        return _vobpuqrkyv8(self, key, _v881x2wj21m.WalkSpeed)
                    end
                end
                return _vobpuqrkyv8(self, key, value)
            end))
        end)
    end
end

local function _vfkkm03kr7d()
    Character = _vw7mory5oh0.Character
    if Character then
        _v0p8wj67ppf = Character:FindFirstChild(_S("68|140|185|177|165|178|179|173|168|150|179|179|184|148|165|182|184"))
        _v2y38mxkj21 = Character:FindFirstChild(_S("122|194|239|231|219|232|233|227|222"))
    end
    return Character and _v0p8wj67ppf and _v2y38mxkj21
end

local function _v778hx85juz(part)
    if not _vfkkm03kr7d() then return math.huge end
    return (_v0p8wj67ppf.Position - part.Position).Magnitude
end

local function _vdfqhxrkax7(position)
    if not _vfkkm03kr7d() then return false end
    local _vk9b2lzt7ge = CFrame.new(position + Vector3.new(0, 3, 0))
    if _v881x2wj21m.TweenTeleport then
        local dist = (_v0p8wj67ppf.Position - position).Magnitude
        local dur = math.clamp(dist / _v881x2wj21m.TweenTeleportSpeed, 0.08, 2.5)
        _vzq8shq2n9u:Create(_v0p8wj67ppf, TweenInfo.new(dur, Enum.EasingStyle.Linear), {CFrame = _vk9b2lzt7ge}):Play()
        task.wait(dur)
    else
        _v0p8wj67ppf.CFrame = _vk9b2lzt7ge
        task.wait(_v881x2wj21m.TeleportDelay)
    end
    return true
end

local function _vjxa0y3xu88(str)
    local list = {}
    for part in string.gmatch(string.lower(str or _S("67|")), _S("80|171|174|124|117|195|173|123")) do
        table.insert(list, part)
    end
    return list
end

local function _vf85jx89uos(_vnpj0c31l0o)
    if not _v881x2wj21m.OreFilterEnabled then return true end
    local _v746hc29vmz = _vjxa0y3xu88(_v881x2wj21m.OreBlacklist)
    for _, word in ipairs(_v746hc29vmz) do
        if string.find(_vnpj0c31l0o, word, 1, true) then return false end
    end
    local _vlp3pwyo4y0 = _vjxa0y3xu88(_v881x2wj21m.OreFilter)
    if #_vlp3pwyo4y0 == 0 then return true end
    for _, word in ipairs(_vlp3pwyo4y0) do
        if string.find(_vnpj0c31l0o, word, 1, true) then return true end
    end
    return false
end

local function _vtfbacbmtd9(_v3mi5y0zl08)
    local _vuks6p2vxq9 = _vw7mory5oh0:FindFirstChild(_S("121|229|222|218|221|222|235|236|237|218|237|236"))
    if not _vuks6p2vxq9 then return 0 end
    for _, stat in ipairs(_vuks6p2vxq9:GetChildren()) do
        local n = string.lower(stat.Name)
        for _, p in ipairs(_v3mi5y0zl08) do
            if string.find(n, p) and stat:IsA(_S("125|211|222|233|242|226|191|222|240|226")) then
                return stat.Value
            end
        end
    end
    return 0
end

local function _vqstarybcyo()
    return _vtfbacbmtd9({_S("110|209|207|225|214"), _S("77|186|188|187|178|198"), _S("128|227|239|233|238"), _S("119|222|230|227|219"), _S("114|212|211|222|211|224|213|215"), _S("85|183|202|184|192|200")})
end

local function _vvaq4x8umby()
    return _vtfbacbmtd9({_S("73|192|174|178|176|177|189"), _S("120|219|217|234|234|241"), _S("84|191|187"), _S("72|180|183|169|172"), _S("90|188|187|189|197|202|187|189|197")})
end

local function _vfrcbsiz5tb()
    local cap = _vtfbacbmtd9({_S("107|206|204|219|204|206|212|223|228"), _S("99|208|196|219|198|196|213|213|220"), _S("126|235|223|246"), _S("72|180|177|181|177|188"), _S("74|172|171|173|181|186|171|173|181")})
    if cap > 0 then return cap end
    local obj = _vw7mory5oh0:FindFirstChild(_S("65|131|162|164|172|177|162|164|172|132|162|177|162|164|170|181|186")) or _vw7mory5oh0:FindFirstChild(_S("106|183|203|226|173|203|220|220|227"))
    if obj and obj:IsA(_S("82|168|179|190|199|183|148|179|197|183")) then return obj.Value end
    return 100
end

local function _v7mnj8nzkwk()
    if _v881x2wj21m.UnlimitedBackpack then return false end
    local _vdask116kib = _vvaq4x8umby()
    local cap = _vfrcbsiz5tb()
    if cap > 0 and _vdask116kib > 0 then return _vdask116kib >= cap * 0.92 end
    return false
end

local function _vw7wq694b2b(root)
    if not _v881x2wj21m.BypassPromptHold or not root then return end
    pcall(function()
        for _, d in ipairs(root:GetDescendants()) do
            if d:IsA(_S("62|142|176|173|182|167|171|167|178|183|142|176|173|171|174|178")) then
                d.HoldDuration = 0
                d.MaxActivationDistance = math.max(d.MaxActivationDistance, 20)
            end
        end
    end)
end

local function _vrchacjkjdg()
    if not _v881x2wj21m.AutoEquipPickaxe then return end
    pcall(function()
        local bestTool, bestScore = nil, -1
        local function _vu0cqkk3c06(tool)
            if not tool:IsA(_S("120|204|231|231|228")) then return -1 end
            local n = string.lower(tool.Name)
            if not (string.find(n, _S("100|212|205|199|207")) or string.find(n, _S("67|164|187|168")) or string.find(n, _S("130|230|244|235|238|238")) or string.find(n, _S("72|188|183|183|180")) or string.find(n, _S("115|219|212|224|224|216|229"))) then
                return 0
            end
            local s = 0
            if string.find(n, _S("61|161|166|158|170|172|171|161")) then s = s + 100
            elseif string.find(n, _S("112|215|223|220|212")) then s = s + 80
            elseif string.find(n, _S("64|169|178|175|174")) then s = s + 50
            elseif string.find(n, _S("77|192|193|188|187|178")) then s = s + 20 end
            for _, d in ipairs(tool:GetDescendants()) do
                if d:IsA(_S("62|148|159|170|179|163|128|159|177|163")) and (string.find(string.lower(d.Name), _S("72|180|173|190|173|180")) or string.find(string.lower(d.Name), _S("120|236|225|221|234"))) then
                    s = s + d.Value * 10
                end
            end
            return s
        end
        local function scan(container)
            if not container then return end
            for _, t in ipairs(container:GetChildren()) do
                local sc = _vu0cqkk3c06(t)
                if sc > bestScore then bestScore, bestTool = sc, t end
            end
        end
        scan(_vw7mory5oh0.Backpack)
        scan(Character)
        if bestTool and Character and not Character:FindFirstChild(bestTool.Name) then
            _v2y38mxkj21:EquipTool(bestTool)
        end
    end)
end

local function _v0g7p8k0x5l()
    local drops = {}
    local _v3mi5y0zl08 = {_S("62|162|176|173|174"), _S("107|215|218|218|223"), _S("85|190|201|186|194"), _S("93|205|198|192|200|210|205"), _S("99|198|210|207|207|200|198|215"), _S("72|183|186|173"), _S("82|185|183|191"), _S("109|208|223|230|224|225|206|217")}
    local function scan(parent)
        for _, child in ipairs(parent:GetChildren()) do
            local nl = string.lower(child.Name)
            if child:IsA(_S("103|169|200|218|204|183|200|217|219")) or child:IsA(_S("60|137|171|160|161|168")) then
                for _, p in ipairs(_v3mi5y0zl08) do
                    if string.find(nl, p) then
                        local part = child:IsA(_S("97|163|194|212|198|177|194|211|213")) and child or child:FindFirstChildWhichIsA(_S("103|169|200|218|204|183|200|217|219"))
                        if part then
                            local dist = _v778hx85juz(part)
                            if dist <= _v881x2wj21m.FarmRadius then
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
    scan(_v7g1rkzie7j)
    table.sort(drops, function(a, b) return a.Distance < b.Distance end)
    return drops
end

local function _vg8ypavi9y6()
    if not _v881x2wj21m.AutoCollectDrops then return end
    local drops = _v0g7p8k0x5l()
    for i = 1, math.min(3, #drops) do
        local drop = drops[i]
        _vdfqhxrkax7(drop.Part.Position)
        if HasFireTouch then
            Exec.FireTouch(_v0p8wj67ppf, drop.Part, 0)
            task.wait(0.01)
            Exec.FireTouch(_v0p8wj67ppf, drop.Part, 1)
        end
        _vkz9nq2rro5(_S("64|176|169|163|171|181|176"))
        _vkz9nq2rro5(_S("65|164|176|173|173|166|164|181"))
        _vkz9nq2rro5(_S("116|224|227|227|232"))
    end
end

local function _vsu3px9sgsj()
    if _v881x2wj21m.AutoBuyPickaxe then
        _vkz9nq2rro5(_S("99|211|204|198|206|196|219|200")); _vkz9nq2rro5(_S("125|223|242|246|220|237|230|224|232|222|245|226")); _vkz9nq2rro5(_S("101|218|213|204|215|198|201|202|196|213|206|200|208|198|221|202"))
    end
    if _v881x2wj21m.AutoBuyBackpack then
        _vkz9nq2rro5(_S("60|158|157|159|167|172|157|159|167")); _vkz9nq2rro5(_S("116|215|213|228|213|215|221|232|237")); _vkz9nq2rro5(_S("122|239|234|225|236|219|222|223|217|220|219|221|229|234|219|221|229"))
    end
    if _v881x2wj21m.AutoBuyLuck then
        _vkz9nq2rro5(_S("72|180|189|171|179")); _vkz9nq2rro5(_S("71|171|176|174|166|179|188|170|178")); _vkz9nq2rro5(_S("93|201|210|192|200|214"))
    end
    if _v881x2wj21m.AutoBuyWarmth then
        _vkz9nq2rro5(_S("91|210|188|205|200|207|195")); _vkz9nq2rro5(_S("98|202|199|195|214")); _vkz9nq2rro5(_S("81|180|178|190|193|183|186|195|182"))
    end
    if _v881x2wj21m.AutoUpgrade then
        _vkz9nq2rro5(_S("75|192|187|178|189|172|175|176")); _vkz9nq2rro5(_S("128|226|245|249")); _vkz9nq2rro5(_S("116|228|233|230|215|220|213|231|217"))
    end
end

local function _vle9b7fsrkk()
    if not _v881x2wj21m.AutoRebirth then return end
    if _vqstarybcyo() >= _v881x2wj21m.RebirthCashThreshold then
        _vkz9nq2rro5(_S("102|216|203|200|207|216|218|206")); _vkz9nq2rro5(_S("123|235|237|224|238|239|228|226|224")); _vkz9nq2rro5(_S("128|242|229|243|229|244")); _vkz9nq2rro5(_S("80|177|195|179|181|190|180"))
        _vz6fcrdbpna(_S("96|161|213|212|207|128|210|197|194|201|210|212|200|128|193|212|212|197|205|208|212|197|196|128|193|212|128") .. _vqstarybcyo() .. _S("103|135|202|200|218|207"))
    end
end

local function _vhlkrk81tug()
    if not _v881x2wj21m.AutoClaimDaily then return end
    _vkz9nq2rro5(_S("120|220|217|225|228|241")); _vkz9nq2rro5(_S("114|228|215|233|211|228|214")); _vkz9nq2rro5(_S("81|180|189|178|186|190")); _vkz9nq2rro5(_S("86|194|197|189|191|196"))
    _vkz9nq2rro5(_S("130|229|241|230|231")); _vkz9nq2rro5(_S("82|196|183|182|183|183|191"))
    if _v881x2wj21m.PromoCode ~= _S("82|") then
        _vkz9nq2rro5(_S("86|185|197|186|187"), _v881x2wj21m.PromoCode)
        _vkz9nq2rro5(_S("88|202|189|188|189|189|197"), _v881x2wj21m.PromoCode)
    end
end

local function _v0hhgnimxpx()
    if _v7mnj8nzkwk() and _v881x2wj21m.SellWhenFull then return true end
    if _v881x2wj21m.SellMinCash > 0 and _vqstarybcyo() >= _v881x2wj21m.SellMinCash then return true end
    return false
end

local function _vo69jtzgnzr()
    _vz6fcrdbpna(_S("98|166|212|209|210|130|198|215|210|199|156|130|210|203|197|205|215|210|130|213|210|195|207|144|144|144"))
    pcall(function()
        local tool = Character and Character:FindFirstChildOfClass(_S("92|176|203|203|200"))
        if tool then
            tool.Parent = _vw7mory5oh0.Backpack
            task.wait(0.1)
            _v2y38mxkj21:EquipTool(tool)
        end
        for i = 1, _v881x2wj21m.DupeAmount do
            _vkz9nq2rro5(_S("103|203|217|214|215")); _vkz9nq2rro5(_S("90|202|195|189|197|207|202")); _vkz9nq2rro5(_S("97|196|208|205|205|198|196|213"))
            task.wait(0.05)
        end
    end)
end

local function _vgaq47ib5xx(cframe)
    if not _vfkkm03kr7d() then return false end
    _v0p8wj67ppf.CFrame = cframe + Vector3.new(0, 3, 0)
    task.wait(_v881x2wj21m.TeleportDelay)
    return true
end

local function _vjwd631ytch(scrollingFrame)
    for _, child in ipairs(scrollingFrame:GetChildren()) do
        if not child:IsA(_S("71|156|144|147|176|186|187|147|168|192|182|188|187")) and not child:IsA(_S("103|188|176|183|200|203|203|208|213|206")) then
            child:Destroy()
        end
    end
end

local function _vz6fcrdbpna(message)
    local _vf16sbstpef = os.date(_S("83|120|155|141|120|160|141|120|166"))
    table.insert(State.Logs, 1, _S("87|178") .. _vf16sbstpef .. _S("61|154|93") .. message)
    if #State.Logs > 50 then
        table.remove(State.Logs)
    end
    if LogList then
        pcall(function()
            _vjwd631ytch(LogList)
            for i, log in ipairs(State.Logs) do
                if i > 15 then break end
                local label = Instance.new(_S("71|155|172|191|187|147|168|169|172|179"))
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

local function _vfkmt9bge94()
    State.RemoteCache = {}
    pcall(function()
        for _, remote in ipairs(_vk057ncn1ru:GetDescendants()) do
            if remote:IsA(_S("113|195|214|222|224|229|214|182|231|214|223|229")) or remote:IsA(_S("61|143|162|170|172|177|162|131|178|171|160|177|166|172|171")) then
                table.insert(State.RemoteCache, {
                    Instance = remote,
                    Name = remote.Name,
                    Type = remote.ClassName,
                })
            end
        end
    end)
    _vz6fcrdbpna(_S("114|181|211|213|218|215|214|146") .. #State.RemoteCache .. _S("65|97|179|166|174|176|181|166|180"))
end

local function _vkz9nq2rro5(namePattern, ...)
    local args = {...}
    for _, remote in ipairs(State.RemoteCache) do
        local rName = string.lower(remote.Name)
        local _vzhydv2dn4g = string.lower(namePattern)
        if string.find(rName, _vzhydv2dn4g) then
            pcall(function()
                if remote.Type == _S("73|155|174|182|184|189|174|142|191|174|183|189") then
                    remote.Instance:FireServer(Exec.Unpack(args))
                elseif remote.Type == _S("113|195|214|222|224|229|214|183|230|223|212|229|218|224|223") then
                    remote.Instance:InvokeServer(Exec.Unpack(args))
                end
            end)
        end
    end
end

local function _v0grht65p1g(name, ...)
    local args = {...}
    for _, remote in ipairs(State.RemoteCache) do
        if remote.Name == name then
            pcall(function()
                if remote.Type == _S("111|193|212|220|222|227|212|180|229|212|221|227") then
                    remote.Instance:FireServer(Exec.Unpack(args))
                elseif remote.Type == _S("61|143|162|170|172|177|162|131|178|171|160|177|166|172|171") then
                    remote.Instance:InvokeServer(Exec.Unpack(args))
                end
            end)
            return true
        end
    end
    return false
end

local _v1ynumuuus1 = {
    _S("109|223|220|208|216"), _S("128|239|242|229"), _S("123|238|239|234|233|224"), _S("63|172|168|173|164|177|160|171"), _S("114|213|228|235|229|230|211|222"), _S("86|189|187|195"), _S("103|202|214|200|211"), _S("129|234|243|240|239"),
    _S("76|179|187|184|176"), _S("122|222|227|219|231|233|232|222"), _S("115|214|226|227|227|216|229"), _S("85|200|190|193|203|186|199"), _S("89|203|206|187|210"), _S("118|219|227|219|232|215|226|218"), _S("88|203|185|200|200|192|193|202|189"),
    _S("66|163|175|167|182|170|187|181|182"), _S("129|239|240|229|230"), _S("66|184|167|171|176"), _S("77|177|178|189|188|192|182|193"), _S("122|220|233|239|230|222|223|236"), _S("84|199|200|181|198|199|181|196|196|188|189|198|185"),
    _S("83|199|194|195|180|205"), _S("84|195|196|181|192"), _S("99|211|200|196|213|207"), _S("109|215|206|209|210"), _S("66|179|183|163|180|182|188"), _S("107|218|205|222|212|207|212|204|217"), _S("107|215|204|219|212|222"),
    _S("130|239|235|246|234|244|235|238"), _S("81|197|186|197|178|191|186|198|190"), _S("130|242|238|227|246|235|240|247|239"), _S("76|188|177|190|181|176|187|192"), _S("85|207|190|199|184|196|195"), _S("130|233|227|244|240|231|246"),
    _S("62|159|175|179|159|171|159|176|167|172|163"), _S("78|177|183|194|192|183|188|179"), _S("126|242|223|236|248|223|236|231|242|227"), _S("70|179|181|181|180|185|186|181|180|171"), _S("71|186|188|181|186|187|182|181|172"),
    _S("65|163|173|176|176|165|180|181|176|175|166"), _S("100|211|210|221|220"), _S("90|206|201|207|204|199|187|198|195|200|191"), _S("60|175|172|165|170|161|168"), _S("116|214|217|230|237|224"), _S("79|178|183|176|187|178|180|179|190|189|200"),
}

local function _v6dmf6w8na1()
    local rocks = {}
    local function _vzb4hqaf8k0(parent)
        if not parent then return end
        for _, child in ipairs(parent:GetChildren()) do
            local _vnpj0c31l0o = string.lower(child.Name)
            if child:IsA(_S("80|146|177|195|181|160|177|194|196")) or child:IsA(_S("119|196|230|219|220|227")) then
                local _vaehk05iihz = false
                for _, _vzhydv2dn4g in ipairs(_v1ynumuuus1) do
                    if string.find(_vnpj0c31l0o, _vzhydv2dn4g) then
                        _vaehk05iihz = true
                        break
                    end
                end
                if _vaehk05iihz and _vf85jx89uos(_vnpj0c31l0o) then
                    local part = child:IsA(_S("97|163|194|212|198|177|194|211|213")) and child or child:FindFirstChildWhichIsA(_S("61|127|158|176|162|141|158|175|177"))
                    if part then
                        local dist = _v778hx85juz(part)
                        if dist <= _v881x2wj21m.FarmRadius then

                            local value = 0
                            pcall(function()
                                local val = child:FindFirstChild(_S("87|173|184|195|204|188")) or child:FindFirstChild(_S("105|185|219|210|204|206")) or child:FindFirstChild(_S("108|195|219|222|224|212")) or child:FindFirstChild(_S("81|167|178|189|198|182|160|199|182|195|195|186|181|182"))
                                if val and val:IsA(_S("65|151|162|173|182|166|131|162|180|166")) then
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
                    _vzb4hqaf8k0(child)
                end
            end
        end
    end

    local _v6mr8keystl = {
        _v7g1rkzie7j:FindFirstChild(_S("103|185|214|202|210|218")),
        _v7g1rkzie7j:FindFirstChild(_S("100|179|214|201|215")),
        _v7g1rkzie7j:FindFirstChild(_S("89|166|194|199|190|203|186|197|204")),
        _v7g1rkzie7j:FindFirstChild(_S("77|154|182|187|178|192")),
        _v7g1rkzie7j:FindFirstChild(_S("80|162|181|195|191|197|194|179|181|195")),
        _v7g1rkzie7j:FindFirstChild(_S("108|185|205|220")),
        _v7g1rkzie7j:FindFirstChild(_S("100|184|201|214|214|197|205|210")),
        _v7g1rkzie7j:FindFirstChild(_S("63|130|177|184|178|179|160|171|178")),
        _v7g1rkzie7j:FindFirstChild(_S("97|174|208|214|207|213|194|202|207")),
        _v7g1rkzie7j,
    }

    for _, area in ipairs(_v6mr8keystl) do
        if area then
            _vzb4hqaf8k0(area)
        end
    end

    if _v881x2wj21m.PriorityHighestValue then
        table.sort(rocks, function(a, b) return a.Value > b.Value end)
    elseif _v881x2wj21m.PriorityClosest then
        table.sort(rocks, function(a, b) return a.Distance < b.Distance end)
    end

    return rocks
end

local function _v95az4z8xcm()
    local shops = {}
    local function _vs3p1kliobk(parent)
        if not parent then return end
        for _, child in ipairs(parent:GetChildren()) do
            local _vnpj0c31l0o = string.lower(child.Name)
            if child:IsA(_S("95|172|206|195|196|203")) or child:IsA(_S("95|161|192|210|196|175|192|209|211")) then
                if string.find(_vnpj0c31l0o, _S("78|193|182|189|190")) or string.find(_vnpj0c31l0o, _S("68|183|169|176|176")) or
                   string.find(_vnpj0c31l0o, _S("76|191|192|187|190|177")) or string.find(_vnpj0c31l0o, _S("85|194|186|199|184|189|182|195|201")) or
                   string.find(_vnpj0c31l0o, _S("105|221|219|202|205|206|219")) or string.find(_vnpj0c31l0o, _S("80|180|181|177|188|181|194")) or
                   string.find(_vnpj0c31l0o, _S("101|210|198|215|208|202|217")) or string.find(_vnpj0c31l0o, _S("92|210|193|202|192|203|206")) or
                   string.find(_vnpj0c31l0o, _S("68|167|165|183|172|173|169|182")) or string.find(_vnpj0c31l0o, _S("66|164|183|187|167|180")) or
                   string.find(_vnpj0c31l0o, _S("60|170|172|159")) or string.find(_vnpj0c31l0o, _S("89|188|186|204|193")) or
                   string.find(_vnpj0c31l0o, _S("81|185|192|190|182")) or string.find(_vnpj0c31l0o, _S("92|190|189|207|193")) or
                   string.find(_vnpj0c31l0o, _S("67|166|164|176|179")) then
                    local part = child:IsA(_S("112|178|209|227|213|192|209|226|228")) and child or child:FindFirstChildWhichIsA(_S("85|151|182|200|186|165|182|199|201")) or child:FindFirstChild(_S("63|135|180|172|160|173|174|168|163|145|174|174|179|143|160|177|179"))
                    if part then
                        local dist = _v778hx85juz(part)
                        table.insert(shops, {
                            Instance = child,
                            Part = part,
                            Distance = dist,
                            Name = child.Name,
                        })
                    end
                end
                if #child:GetChildren() > 0 then
                    _vs3p1kliobk(child)
                end
            end
        end
    end

    _vs3p1kliobk(_v7g1rkzie7j)
    table.sort(shops, function(a, b) return a.Distance < b.Distance end)
    return shops
end

local function _vtpiuw0mlmi(rockData)
    local rock = rockData.Instance
    local part = rockData.Part

    if not rock or not rock.Parent then return false end

    _vrchacjkjdg()
    _vw7wq694b2b(rock)

    _vz6fcrdbpna(_S("63|140|168|173|168|173|166|121|95") .. rockData.Name)

    _vdfqhxrkax7(part.Position)
    task.wait(0.05)

    local function _v0ld7mz479y()

        if HasFireClick then
            local clickDetector = rock:FindFirstChildOfClass(_S("126|193|234|231|225|233|194|227|242|227|225|242|237|240")) or part:FindFirstChildOfClass(_S("116|183|224|221|215|223|184|217|232|217|215|232|227|230"))
            if clickDetector then Exec.FireClick(clickDetector) end
        end
        if HasFireProximity then
            local prompt = rock:FindFirstChildOfClass(_S("99|179|213|210|219|204|208|204|215|220|179|213|210|208|211|215")) or part:FindFirstChildOfClass(_S("100|180|214|211|220|205|209|205|216|221|180|214|211|209|212|216"))
            if prompt then
                if _v881x2wj21m.BypassPromptHold then prompt.HoldDuration = 0 end
                Exec.FireProximity(prompt)
            end
        end
        if HasFireTouch then
            Exec.FireTouch(_v0p8wj67ppf, part, 0)
            task.wait(0.01)
            Exec.FireTouch(_v0p8wj67ppf, part, 1)
        end

        local tool = Character and Character:FindFirstChildOfClass(_S("98|182|209|209|206"))
        if tool then tool:Activate() end

        _vkz9nq2rro5(_S("95|204|200|205|196")); _vkz9nq2rro5(_S("73|177|170|187|191|174|188|189")); _vkz9nq2rro5(_S("119|218|230|227|227|220|218|235"))
        _vkz9nq2rro5(_S("83|181|197|184|180|190")); _vkz9nq2rro5(_S("62|165|159|178|166|163|176")); _vkz9nq2rro5(_S("81|181|186|184"))
        _vkz9nq2rro5(_S("88|200|193|187|195")); _vkz9nq2rro5(_S("98|213|217|203|208|201"))

        for _, remote in ipairs(State.RemoteCache) do
            local rName = string.lower(remote.Name)
            if string.find(rName, _S("79|188|184|189|180")) or string.find(rName, _S("112|212|217|215")) or string.find(rName, _S("88|192|185|202|206|189|203|204")) then
                pcall(function()
                    if remote.Type == _S("68|150|169|177|179|184|169|137|186|169|178|184") then
                        remote.Instance:FireServer(rock, part)
                    elseif remote.Type == _S("85|167|186|194|196|201|186|155|202|195|184|201|190|196|195") then
                        remote.Instance:InvokeServer(rock, part)
                    end
                end)
            end
        end
    end

    local hits = _v881x2wj21m.RapidMine and _v881x2wj21m.RapidMineCount or 1
    for _ = 1, hits do
        _v0ld7mz479y()
        if hits > 1 then task.wait(0.03) end
    end

    _vg8ypavi9y6()
    State.FarmCount = State.FarmCount + 1
    pcall(function() _v58c9287ww1(rockData.Name) end)

    return true
end

local function _vvvn9iohlxk(shopData)
    if not shopData then return false end

    local shop = shopData.Instance
    local part = shopData.Part

    _vz6fcrdbpna(_S("80|163|181|188|188|185|190|183|112|177|196|138|112") .. shopData.Name)

    _vdfqhxrkax7(part.Position)
    task.wait(0.1)

    if HasFireClick then
        local clickDetector = shop:FindFirstChildOfClass(_S("91|158|199|196|190|198|159|192|207|192|190|207|202|205")) or part:FindFirstChildOfClass(_S("119|186|227|224|218|226|187|220|235|220|218|235|230|233"))
        if clickDetector then Exec.FireClick(clickDetector) end
    end

    if HasFireProximity then
        local prompt = shop:FindFirstChildOfClass(_S("130|210|244|241|250|235|239|235|246|251|210|244|241|239|242|246")) or part:FindFirstChildOfClass(_S("113|193|227|224|233|218|222|218|229|234|193|227|224|222|225|229"))
        if prompt then Exec.FireProximity(prompt) end
    end

    if HasFireTouch then
        Exec.FireTouch(_v0p8wj67ppf, part, 0)
        task.wait(0.01)
        Exec.FireTouch(_v0p8wj67ppf, part, 1)
    end

    _vkz9nq2rro5(_S("60|175|161|168|168"))
    _vkz9nq2rro5(_S("68|183|172|179|180"))
    _vkz9nq2rro5(_S("72|181|169|186|179|173|188"))
    _vkz9nq2rro5(_S("129|245|243|226|229|230"))
    _vkz9nq2rro5(_S("118|217|215|233|222"))
    _vkz9nq2rro5(_S("110|219|221|220|211|231"))
    _vkz9nq2rro5(_S("102|217|203|210|210|199|210|210"))
    _vkz9nq2rro5(_S("95|210|196|203|203|190|192|203|203"))

    State.SellCount = State.SellCount + 1

    return true
end

local function _vd3flhxcpsp()
    if State.FarmConnection then return end
    _vz6fcrdbpna(_S("117|182|234|233|228|149|187|214|231|226|149|200|201|182|199|201|186|185"))

    State.FarmConnection = true
    task.spawn(function()
        while _v881x2wj21m.AutoFarm and State.FarmConnection do
            if _vfkkm03kr7d() then
                local rocks = _v6dmf6w8na1()
                if #rocks > 0 then
                    local _vitb0iwkc7f = rocks[1]
                    State.CurrentTarget = _vitb0iwkc7f.Name
                    _vtpiuw0mlmi(_vitb0iwkc7f)
                else
                    State.CurrentTarget = _S("70|153|171|167|184|169|174|175|180|173|116|116|116")
                end
            end
            task.wait(_v881x2wj21m.FarmDelay)
        end
    end)
end

local function _vzw7r555gpw()
    State.FarmConnection = nil
    State.CurrentTarget = _S("123|201|234|233|224")
    _vz6fcrdbpna(_S("126|191|243|242|237|158|196|223|240|235|158|209|210|205|206|206|195|194"))
end

local function _ve3muz6jcxo()
    if State.SellConnection then return end
    _vz6fcrdbpna(_S("112|177|229|228|223|144|195|213|220|220|144|195|196|177|194|196|181|180"))

    State.SellConnection = true
    task.spawn(function()
        while _v881x2wj21m.AutoSell and State.SellConnection do
            if _vfkkm03kr7d() then
                local _vxn49ztkab6 = true
                if _v881x2wj21m.SellWhenFull and not _v7mnj8nzkwk() then _vxn49ztkab6 = false end
                if _v881x2wj21m.SellMinCash > 0 and _vqstarybcyo() < _v881x2wj21m.SellMinCash then _vxn49ztkab6 = false end
                if _vxn49ztkab6 then
                    local shops = _v95az4z8xcm()
                    if #shops > 0 then
                        _vvvn9iohlxk(shops[1])
                        pcall(_vsx7p23sqlq)
                    end
                end
            end
            task.wait(_v881x2wj21m.SellDelay)
        end
    end)
end

local function _v68j7p81bmw()
    State.SellConnection = nil
    _vz6fcrdbpna(_S("117|182|234|233|228|149|200|218|225|225|149|200|201|196|197|197|186|185"))
end

local function _vv4do4tfqp3()
    if State.UpgradeConn then return end
    _vz6fcrdbpna(_S("69|134|186|185|180|101|154|181|172|183|166|169|170|101|152|153|134|151|153|138|137"))

    State.UpgradeConn = true
    task.spawn(function()
        while _v881x2wj21m.AutoUpgrade and State.UpgradeConn do
            _vkz9nq2rro5(_S("117|234|229|220|231|214|217|218"))
            _vkz9nq2rro5(_S("61|159|178|182"))
            _vkz9nq2rro5(_S("106|218|223|220|205|210|203|221|207"))
            _vkz9nq2rro5(_S("87|206|184|201|196|203|191"))
            _vkz9nq2rro5(_S("108|220|213|207|215|205|228|209"))
            _vkz9nq2rro5(_S("85|183|182|184|192|197|182|184|192"))
            _vkz9nq2rro5(_S("120|235|232|221|221|220"))
            _vkz9nq2rro5(_S("120|220|225|223"))

            State.UpgradeCount = State.UpgradeCount + 1
            task.wait(1)
        end
    end)
end

local function _vmga3jepmvn()
    State.UpgradeConn = nil
    _vz6fcrdbpna(_S("118|183|235|234|229|150|203|230|221|232|215|218|219|150|201|202|197|198|198|187|186"))
end

local function _v81mypu1pnr()
    for _, _vymgf46gwrm in ipairs(State.ESPHighlights) do
        pcall(function() _vymgf46gwrm:Destroy() end)
    end
    State.ESPHighlights = {}
end

local function _v7b9az1lx5x()
    _v81mypu1pnr()

    local rocks = _v6dmf6w8na1()
    for _, rock in ipairs(rocks) do
        if rock.Instance and rock.Instance.Parent then

            local _vymgf46gwrm = Instance.new(_S("100|172|205|203|204|208|205|203|204|216"))
            _vymgf46gwrm.Name = _S("81|150|164|161|176") .. rock.Name
            _vymgf46gwrm.FillTransparency = 0.6
            _vymgf46gwrm.OutlineTransparency = 0
            _vymgf46gwrm.OutlineColor = rock.Value > 0 and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(100, 200, 255)
            _vymgf46gwrm.FillColor = rock.Value > 0 and Color3.fromRGB(255, 200, 50) or Color3.fromRGB(80, 150, 255)
            _vymgf46gwrm.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            _vymgf46gwrm.Parent = rock.Instance

            local _vvqgrw6hraq = Instance.new(_S("78|144|183|186|186|176|189|175|192|178|149|195|183"))
            _vvqgrw6hraq.Name = _S("109|178|192|189|185|206|207|210|217")
            _vvqgrw6hraq.Size = UDim2.new(0, 120, 0, 30)
            _vvqgrw6hraq.StudsOffset = Vector3.new(0, 3, 0)
            _vvqgrw6hraq.AlwaysOnTop = true
            _vvqgrw6hraq.Parent = rock.Part

            local label = Instance.new(_S("60|144|161|180|176|136|157|158|161|168"))
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 0.4
            label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            label.Text = rock.Name .. _S("130|162|221") .. math.floor(rock.Distance) .. _S("68|177|161") .. (rock.Value > 0 and (_S("122|154|246|154|158") .. tostring(rock.Value)) or _S("108|"))
            label.TextColor3 = rock.Value > 0 and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(100, 200, 255)
            label.Font = Enum.Font.GothamBold
            label.TextSize = 11
            label.Parent = _vvqgrw6hraq

            local _vq60qlo0lq3 = Instance.new(_S("101|186|174|168|212|215|211|202|215"))
            _vq60qlo0lq3.CornerRadius = UDim.new(0, 4)
            _vq60qlo0lq3.Parent = label

            table.insert(State.ESPHighlights, _vymgf46gwrm)
            table.insert(State.ESPHighlights, _vvqgrw6hraq)
        end
    end

    local shops = _v95az4z8xcm()
    for _, shop in ipairs(shops) do
        if shop.Instance and shop.Instance.Parent then
            local _vymgf46gwrm = Instance.new(_S("128|200|233|231|232|236|233|231|232|244"))
            _vymgf46gwrm.Name = _S("126|195|209|206|221|209|230|237|238|221") .. shop.Name
            _vymgf46gwrm.FillTransparency = 0.5
            _vymgf46gwrm.OutlineTransparency = 0
            _vymgf46gwrm.OutlineColor = Color3.fromRGB(0, 255, 100)
            _vymgf46gwrm.FillColor = Color3.fromRGB(50, 255, 100)
            _vymgf46gwrm.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            _vymgf46gwrm.Parent = shop.Instance

            local _vvqgrw6hraq = Instance.new(_S("77|143|182|185|185|175|188|174|191|177|148|194|182"))
            _vvqgrw6hraq.Name = _S("101|170|184|181|184|205|212|213|177|198|199|202|209")
            _vvqgrw6hraq.Size = UDim2.new(0, 100, 0, 25)
            _vvqgrw6hraq.StudsOffset = Vector3.new(0, 3, 0)
            _vvqgrw6hraq.AlwaysOnTop = true
            _vvqgrw6hraq.Parent = shop.Part

            local label = Instance.new(_S("119|203|220|239|235|195|216|217|220|227"))
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 0.4
            label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            label.Text = _S("95|178|167|174|175|153|127") .. shop.Name
            label.TextColor3 = Color3.fromRGB(0, 255, 100)
            label.Font = Enum.Font.GothamBold
            label.TextSize = 10
            label.Parent = _vvqgrw6hraq

            table.insert(State.ESPHighlights, _vymgf46gwrm)
            table.insert(State.ESPHighlights, _vvqgrw6hraq)
        end
    end

    _vz6fcrdbpna(_S("80|149|163|160|138|112") .. #rocks .. _S("94|126|208|205|193|201|209|138|126") .. #shops .. _S("112|144|227|216|223|224|227"))
end

local function _vrks3cj2eai()
    if _v881x2wj21m.ESPEnabled then
        _v7b9az1lx5x()

        task.spawn(function()
            while _v881x2wj21m.ESPEnabled do
                task.wait(5)
                if _v881x2wj21m.ESPEnabled then
                    _v7b9az1lx5x()
                end
            end
        end)
    end
end

local function _vjlz2akamkn()
    _v81mypu1pnr()
end

local function _vnvnfs9nwa4()
    if State.AntiDamageConn then return end
    _vz6fcrdbpna(_S("63|128|173|179|168|95|131|160|172|160|166|164|95|132|141|128|129|139|132|131"))

    State.AntiDamageConn = _vaubu7dr6id.Heartbeat:Connect(function()
        if not _vfkkm03kr7d() then return end

        if _v2y38mxkj21 and _v2y38mxkj21.Health < _v2y38mxkj21.MaxHealth then
            _v2y38mxkj21.Health = _v2y38mxkj21.MaxHealth
        end

        if _v881x2wj21m.AntiFreeze then
            pcall(function()

                local _vhb5gupjkri = Character:FindFirstChild(_S("105|192|202|219|214|221|209")) or Character:FindFirstChild(_S("98|182|199|207|210|199|212|195|214|215|212|199")) or Character:FindFirstChild(_S("61|128|172|169|161"))
                if _vhb5gupjkri and _vhb5gupjkri:IsA(_S("75|161|172|183|192|176|141|172|190|176")) then
                    _vhb5gupjkri.Value = 100
                end

                local _vfp5qbzk8oc = Character:FindFirstChild(_S("125|195|239|236|247|226|235")) or Character:FindFirstChild(_S("87|160|202|157|201|198|209|188|197")) or Character:FindFirstChild(_S("108|178|222|209|209|230|213|218|211"))
                if _vfp5qbzk8oc and _vfp5qbzk8oc:IsA(_S("89|155|200|200|197|175|186|197|206|190")) then
                    _vfp5qbzk8oc.Value = false
                end

                _vkz9nq2rro5(_S("111|230|208|225|220|227|215"))
                _vkz9nq2rro5(_S("97|214|207|199|211|198|198|219|198"))
                _vkz9nq2rro5(_S("109|213|210|206|225"))
            end)
        end
    end)
end

local function _vuz6mxo0sy4()
    if State.AntiDamageConn then
        State.AntiDamageConn:Disconnect()
        State.AntiDamageConn = nil
    end
    _vz6fcrdbpna(_S("88|153|198|204|193|120|156|185|197|185|191|189|120|156|161|171|153|154|164|157|156"))
end

local function _vcj58rleeld()
    if not _v881x2wj21m.UnlimitedBackpack then return end
    _vz6fcrdbpna(_S("92|157|204|204|200|213|197|202|195|124|177|202|200|197|201|197|208|193|192|124|158|189|191|199|204|189|191|199|138|138|138"))

    pcall(function()

        local _vopuv7e5wox = _vw7mory5oh0:FindFirstChild(_S("71|137|168|170|178|183|168|170|178|138|168|183|168|170|176|187|192")) or _vw7mory5oh0:FindFirstChild(_S("103|180|200|223|170|200|217|217|224")) or _vw7mory5oh0:FindFirstChild(_S("61|128|158|175|175|182|136|132"))
        if _vopuv7e5wox and _vopuv7e5wox:IsA(_S("68|154|165|176|185|169|134|165|183|169")) then
            _vopuv7e5wox.Value = 999999
        end

        local _vuks6p2vxq9 = _vw7mory5oh0:FindFirstChild(_S("115|223|216|212|215|216|229|230|231|212|231|230"))
        if _vuks6p2vxq9 then
            for _, stat in ipairs(_vuks6p2vxq9:GetChildren()) do
                local _vnpj0c31l0o = string.lower(stat.Name)
                if string.find(_vnpj0c31l0o, _S("116|214|213|215|223|228|213|215|223")) or string.find(_vnpj0c31l0o, _S("61|160|158|175|175|182")) or string.find(_vnpj0c31l0o, _S("77|176|174|189|174|176|182|193|198")) or string.find(_vnpj0c31l0o, _S("105|224|206|210|208|209|221")) or string.find(_vnpj0c31l0o, _S("128|235|231")) then
                    if stat:IsA(_S("66|152|163|174|183|167|132|163|181|167")) then
                        stat.Value = 999999
                    end
                end
            end
        end

        _vkz9nq2rro5(_S("95|193|192|194|202|207|192|194|202"))
        _vkz9nq2rro5(_S("75|174|172|187|172|174|180|191|196"))
        _vkz9nq2rro5(_S("70|169|167|184|184|191"))
        _vkz9nq2rro5(_S("125|242|237|228|239|222|225|226|220|223|222|224|232|237|222|224|232"))
    end)

    task.spawn(function()
        while _v881x2wj21m.UnlimitedBackpack do
            task.wait(2)
            pcall(function()
                local _vuks6p2vxq9 = _vw7mory5oh0:FindFirstChild(_S("84|192|185|181|184|185|198|199|200|181|200|199"))
                if _vuks6p2vxq9 then
                    for _, stat in ipairs(_vuks6p2vxq9:GetChildren()) do
                        local _vnpj0c31l0o = string.lower(stat.Name)
                        if string.find(_vnpj0c31l0o, _S("109|207|206|208|216|221|206|208|216")) or string.find(_vnpj0c31l0o, _S("114|213|211|228|228|235")) or string.find(_vnpj0c31l0o, _S("114|213|211|226|211|213|219|230|235")) or string.find(_vnpj0c31l0o, _S("89|208|190|194|192|193|205")) or string.find(_vnpj0c31l0o, _S("78|185|181")) then
                            if stat:IsA(_S("122|208|219|230|239|223|188|219|237|223")) then
                                stat.Value = 999999
                            end
                        end
                    end
                end
            end)
        end
    end)
end

local function _vm1x4u44hmz()
    if not _v881x2wj21m.UnlimitedLuck then return end
    _vz6fcrdbpna(_S("98|163|210|210|206|219|203|208|201|130|183|208|206|203|207|203|214|199|198|130|174|215|197|205|144|144|144"))

    pcall(function()

        local _v4ab3y0zlw2 = _vw7mory5oh0:FindFirstChild(_S("116|192|233|215|223")) or _vw7mory5oh0:FindFirstChild(_S("108|176|213|211|184|225|207|215")) or _vw7mory5oh0:FindFirstChild(_S("99|176|204|209|204|209|202|175|216|198|206"))
        if _v4ab3y0zlw2 and _v4ab3y0zlw2:IsA(_S("90|176|187|198|207|191|156|187|205|191")) then
            _v4ab3y0zlw2.Value = 999999
        end

        local _vuks6p2vxq9 = _vw7mory5oh0:FindFirstChild(_S("98|206|199|195|198|199|212|213|214|195|214|213"))
        if _vuks6p2vxq9 then
            for _, stat in ipairs(_vuks6p2vxq9:GetChildren()) do
                local _vnpj0c31l0o = string.lower(stat.Name)
                if string.find(_vnpj0c31l0o, _S("73|181|190|172|180")) then
                    if stat:IsA(_S("86|172|183|194|203|187|152|183|201|187")) then
                        stat.Value = 999999
                    end
                end
            end
        end

        _vkz9nq2rro5(_S("77|185|194|176|184"))
        _vkz9nq2rro5(_S("114|222|231|213|221|235"))
        _vkz9nq2rro5(_S("93|193|198|196|188|201|210|192|200"))
    end)

    task.spawn(function()
        while _v881x2wj21m.UnlimitedLuck do
            task.wait(2)
            pcall(function()
                local _vuks6p2vxq9 = _vw7mory5oh0:FindFirstChild(_S("119|227|220|216|219|220|233|234|235|216|235|234"))
                if _vuks6p2vxq9 then
                    for _, stat in ipairs(_vuks6p2vxq9:GetChildren()) do
                        if string.find(string.lower(stat.Name), _S("67|175|184|166|174")) and stat:IsA(_S("100|186|197|208|217|201|166|197|215|201")) then
                            stat.Value = 999999
                        end
                    end
                end
            end)
        end
    end)
end

local function _vnvdhfciei1(amount)
    _vz6fcrdbpna(_S("130|195|246|246|231|239|242|246|235|240|233|162|246|241|162|230|247|242|231|162") .. amount .. _S("94|126|199|210|195|203|209|140|140|140"))

    pcall(function()

        for i = 1, amount do
            _vkz9nq2rro5(_S("110|209|221|218|218|211|209|226"))
            _vkz9nq2rro5(_S("98|207|203|208|199"))
            _vkz9nq2rro5(_S("122|226|219|236|240|223|237|238"))
            _vkz9nq2rro5(_S("116|228|221|215|223|233|228"))
            _vkz9nq2rro5(_S("129|232|226|245|233|230|243"))
            _vkz9nq2rro5(_S("78|186|189|189|194"))
            _vkz9nq2rro5(_S("117|228|215|233|214|222|227"))
            _vkz9nq2rro5(_S("68|171|182|165|178|184"))
            _vkz9nq2rro5(_S("105|219|206|224|202|219|205"))
            task.wait(0.05)
        end

        local _vuks6p2vxq9 = _vw7mory5oh0:FindFirstChild(_S("123|231|224|220|223|224|237|238|239|220|239|238"))
        if _vuks6p2vxq9 then
            for _, stat in ipairs(_vuks6p2vxq9:GetChildren()) do
                local _vnpj0c31l0o = string.lower(stat.Name)
                if string.find(_vnpj0c31l0o, _S("126|225|240|247|241|242|223|234")) or string.find(_vnpj0c31l0o, _S("109|220|223|210")) or string.find(_vnpj0c31l0o, _S("115|218|216|224")) or string.find(_vnpj0c31l0o, _S("99|204|215|200|208")) then
                    if stat:IsA(_S("118|196|235|227|216|219|232|204|215|226|235|219")) or stat:IsA(_S("122|195|232|238|208|219|230|239|223")) then
                        stat.Value = stat.Value * amount
                    end
                end
            end
        end

        for i = 1, amount do
            _vkz9nq2rro5(_S("108|223|209|216|216"))
            task.wait(0.02)
            _vkz9nq2rro5(_S("60|158|177|181"))
            task.wait(0.02)
        end

        local rocks = _v6dmf6w8na1()
        if #rocks > 0 then
            local _v2qckxqry78 = rocks[1]
            for i = 1, amount do
                for _, remote in ipairs(State.RemoteCache) do
                    local rName = string.lower(remote.Name)
                    if string.find(rName, _S("82|181|193|190|190|183|181|198")) or string.find(rName, _S("94|206|199|193|201|211|206")) or string.find(rName, _S("116|224|227|227|232")) then
                        pcall(function()
                            if remote.Type == _S("130|212|231|239|241|246|231|199|248|231|240|246") then
                                remote.Instance:FireServer(_v2qckxqry78.Instance, _v2qckxqry78.Part)
                            end
                        end)
                    end
                end
                task.wait(0.05)
            end
        end
    end)

    State.DupeCount = State.DupeCount + amount
    _vz6fcrdbpna(_S("67|135|184|179|168|99|164|183|183|168|176|179|183|99|166|178|176|179|175|168|183|168|125|99") .. amount .. _S("63|183"))
end

local function _vs1riaxok8q()
    if State.NoclipConn then return end
    _vz6fcrdbpna(_S("65|143|176|164|173|170|177|97|134|143|130|131|141|134|133"))

    State.NoclipConn = _vaubu7dr6id.Stepped:Connect(function()
        if not _v881x2wj21m.Noclip then return end
        if not _vfkkm03kr7d() then return end
        for _, part in ipairs(Character:GetDescendants()) do
            if part:IsA(_S("88|154|185|203|189|168|185|202|204")) then
                part.CanCollide = false
            end
        end
    end)
end

local function _vh5oae28lxf()
    if State.NoclipConn then
        State.NoclipConn:Disconnect()
        State.NoclipConn = nil
    end
    _vz6fcrdbpna(_S("124|202|235|223|232|229|236|156|192|197|207|189|190|200|193|192"))
end

local _vw476zhmykn = nil
local _vi8n4m6rrb0 = nil

local function _v384o9i3btg()
    if State.FlyConn then return end
    if not _vfkkm03kr7d() then return end
    _vz6fcrdbpna(_S("104|174|212|225|136|173|182|169|170|180|173|172"))

    _vw476zhmykn = Instance.new(_S("107|173|218|207|228|193|208|215|218|206|212|223|228"))
    _vw476zhmykn.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    _vw476zhmykn.Velocity = Vector3.new(0, 0, 0)
    _vw476zhmykn.Parent = _v0p8wj67ppf

    _vi8n4m6rrb0 = Instance.new(_S("108|174|219|208|229|179|229|222|219"))
    _vi8n4m6rrb0.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    _vi8n4m6rrb0.P = 9e4
    _vi8n4m6rrb0.Parent = _v0p8wj67ppf

    State.FlyConn = _vaubu7dr6id.RenderStepped:Connect(function()
        if not _v881x2wj21m.FlyEnabled then return end
        if not _vfkkm03kr7d() then return end

        local cam = _v7g1rkzie7j.CurrentCamera
        local _vlw7dohabas = Vector3.new(0, 0, 0)

        if _v7g0rk761tx:IsKeyDown(Enum.KeyCode.W) then
            _vlw7dohabas = _vlw7dohabas + cam.CFrame.LookVector
        end
        if _v7g0rk761tx:IsKeyDown(Enum.KeyCode.S) then
            _vlw7dohabas = _vlw7dohabas - cam.CFrame.LookVector
        end
        if _v7g0rk761tx:IsKeyDown(Enum.KeyCode.A) then
            _vlw7dohabas = _vlw7dohabas - cam.CFrame.RightVector
        end
        if _v7g0rk761tx:IsKeyDown(Enum.KeyCode.D) then
            _vlw7dohabas = _vlw7dohabas + cam.CFrame.RightVector
        end
        if _v7g0rk761tx:IsKeyDown(Enum.KeyCode.Space) then
            _vlw7dohabas = _vlw7dohabas + Vector3.new(0, 1, 0)
        end
        if _v7g0rk761tx:IsKeyDown(Enum.KeyCode.LeftShift) then
            _vlw7dohabas = _vlw7dohabas - Vector3.new(0, 1, 0)
        end

        if _vlw7dohabas.Magnitude > 0 then
            _vlw7dohabas = _vlw7dohabas.Unit * _v881x2wj21m.FlySpeed
        end

        _vw476zhmykn.Velocity = _vlw7dohabas
        _vi8n4m6rrb0.CFrame = cam.CFrame
    end)
end

local function _v734q2b0i64()
    if State.FlyConn then
        State.FlyConn:Disconnect()
        State.FlyConn = nil
    end
    if _vw476zhmykn then _vw476zhmykn:Destroy() _vw476zhmykn = nil end
    if _vi8n4m6rrb0 then _vi8n4m6rrb0:Destroy() _vi8n4m6rrb0 = nil end
    _vz6fcrdbpna(_S("112|182|220|233|144|180|185|195|177|178|188|181|180"))
end

local function _v6zhc4exvkl()
    if not _vfkkm03kr7d() then return end
    if _v881x2wj21m.SpeedBoost then
        _v2y38mxkj21.WalkSpeed = _v881x2wj21m.WalkSpeed
    else
        _v2y38mxkj21.WalkSpeed = 16
    end
end

local function _vv1qfznm7us()
    _v881x2wj21m.AutoFarm = false
    _v881x2wj21m.AutoSell = false
    _v881x2wj21m.AutoUpgrade = false
    _v881x2wj21m.SmartLoop = false
    _v881x2wj21m.ESPEnabled = false
    _v881x2wj21m.FlyEnabled = false
    _v881x2wj21m.Noclip = false
    _v881x2wj21m.RapidMine = false
    _v881x2wj21m.RemoteSpy = false
    _vzw7r555gpw()
    _v68j7p81bmw()
    _vmga3jepmvn()
    State.SmartLoopConn = nil
    _v734q2b0i64()
    _vh5oae28lxf()
    _vjlz2akamkn()
    _vfsh86i3pbj()
    _vlfsefhgt6k()
    _v4hmfy9cv0b()
    if State.InfiniteJumpConn then State.InfiniteJumpConn:Disconnect() State.InfiniteJumpConn = nil end
    if State.ClickTPConn then State.ClickTPConn:Disconnect() State.ClickTPConn = nil end
    if State.WarmthKeeperConn then State.WarmthKeeperConn:Disconnect() State.WarmthKeeperConn = nil end
    if State.DropCollectConn then State.DropCollectConn = nil end
    _vz6fcrdbpna(_S("98|178|163|176|171|165|156|130|163|206|206|130|200|199|195|214|215|212|199|213|130|213|214|209|210|210|199|198"))
end

local function _vho0wlx0qr5()
    if State.SmartLoopConn then return end
    _vz6fcrdbpna(_S("125|208|234|222|239|241|157|201|236|236|237|157|208|209|190|207|209|194|193|157|165|195|222|239|234|157|8719|157|208|226|233|233|157|8719|157|210|237|228|239|222|225|226|166"))
    State.SmartLoopConn = true
    task.spawn(function()
        while _v881x2wj21m.SmartLoop and State.SmartLoopConn do
            if _vfkkm03kr7d() then
                _vrchacjkjdg()
                _vw7wq694b2b(_v7g1rkzie7j)
                if _v0hhgnimxpx() then
                    local shops = _v95az4z8xcm()
                    if #shops > 0 then
                        State.CurrentTarget = _S("74|157|175|182|182|179|184|177|120|120|120")
                        _vvvn9iohlxk(shops[1])
                        pcall(_vsx7p23sqlq)
                        _vsu3px9sgsj()
                        _vle9b7fsrkk()
                    end
                else
                    local rocks = _v6dmf6w8na1()
                    if #rocks > 0 then
                        State.CurrentTarget = rocks[1].Name
                        _vtpiuw0mlmi(rocks[1])
                    else
                        State.CurrentTarget = _S("83|166|184|180|197|182|187|188|193|186|129|129|129")
                        _vg8ypavi9y6()
                    end
                end
                _vhlkrk81tug()
            end
            task.wait(_v881x2wj21m.FarmDelay)
        end
    end)
end

local function _vzdjbze56jl()
    State.SmartLoopConn = nil
    _vz6fcrdbpna(_S("119|202|228|216|233|235|151|195|230|230|231|151|202|203|198|199|199|188|187"))
end

local function _vmszx3a23kp(arg)
    local t = typeof(arg)
    if t == _S("72|145|182|187|188|169|182|171|173") then return arg:GetFullName()
    elseif t == _S("101|187|202|200|217|212|215|152") then return string.format(_S("94|180|195|193|210|205|208|145|134|131|140|143|196|138|131|140|143|196|138|131|140|143|196|135"), arg.X, arg.Y, arg.Z)
    elseif t == _S("100|167|170|214|197|209|201") then return _S("77|144|147|191|174|186|178")
    elseif t == _S("129|245|226|227|237|230") then return _S("127|243|224|225|235|228")
    else return tostring(arg) end
end

local function _v11aye0ci7z(remoteName, remoteType, args)
    local _v5xcnh0p819 = _S("127|")
    for i, a in ipairs(args) do
        _v5xcnh0p819 = _v5xcnh0p819 .. (i > 1 and _S("119|163|151") or _S("114|")) .. _vmszx3a23kp(a)
    end
    local entry = os.date(_S("90|127|162|148|127|167|148|127|173")) .. _S("84|116|208|116") .. remoteType .. _S("119|151|243|151") .. remoteName .. _S("127|167") .. _v5xcnh0p819 .. _S("128|169")
    table.insert(State.RemoteSpyLogs, 1, entry)
    if #State.RemoteSpyLogs > 40 then table.remove(State.RemoteSpyLogs) end
    State.LastRemoteFire = entry
    if RemoteSpyList then
        pcall(function()
            _vjwd631ytch(RemoteSpyList)
            for i, log in ipairs(State.RemoteSpyLogs) do
                if i > 20 then break end
                local lbl = Instance.new(_S("77|161|178|197|193|153|174|175|178|185"))
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

local function _v4a34c01mmk()
    if not Exec.HasHookMeta then
        _vz6fcrdbpna(_S("89|171|190|198|200|205|190|121|172|201|210|121|206|199|186|207|186|194|197|186|187|197|190|121|200|199|121|205|193|194|204|121|190|209|190|188|206|205|200|203"))
        return
    end
    _v0egrl00sf4 = true
    _vz6fcrdbpna(_S("64|146|165|173|175|180|165|96|147|176|185|96|133|142|129|130|140|133|132"))
end

local function _v9kkg3kh95s()
    _v0egrl00sf4 = false
    _v881x2wj21m.RemoteSpy = false
    _vz6fcrdbpna(_S("76|158|177|185|187|192|177|108|159|188|197|108|144|149|159|141|142|152|145|144"))
end

local function _ve9e9w1c7hw()
    if _v881x2wj21m.CustomRemoteName == _S("70|") then
        _vz6fcrdbpna(_S("129|198|239|245|230|243|161|226|161|243|230|238|240|245|230|161|239|226|238|230|161|231|234|243|244|245"))
        return
    end
    local args = {}
    if _v881x2wj21m.CustomRemoteArgs ~= _S("93|") then
        for part in string.gmatch(_v881x2wj21m.CustomRemoteArgs, _S("121|212|215|165|214|164")) do
            part = string.gsub(part, _S("124|218|161|239|166|164|170|169|165|161|239|166|160"), _S("100|137|149"))
            local num = tonumber(part)
            if num then
                table.insert(args, num)
            elseif part == _S("75|191|189|192|176") then
                table.insert(args, true)
            elseif part == _S("117|219|214|225|232|218") then
                table.insert(args, false)
            else
                table.insert(args, part)
            end
        end
    end
    if _v0grht65p1g(_v881x2wj21m.CustomRemoteName, Exec.Unpack(args)) then
        _vz6fcrdbpna(_S("92|162|197|206|193|192|124|193|212|189|191|208|150|124") .. _v881x2wj21m.CustomRemoteName)
    else
        _vkz9nq2rro5(_v881x2wj21m.CustomRemoteName, Exec.Unpack(args))
        _vz6fcrdbpna(_S("109|179|214|223|210|209|141|221|206|225|225|210|223|219|167|141") .. _v881x2wj21m.CustomRemoteName)
    end
end

local function _vtmwzs7sfw9()
    if State.InfiniteJumpConn then return end
    State.InfiniteJumpConn = _v7g0rk761tx.JumpRequest:Connect(function()
        if _v881x2wj21m.InfiniteJump and _vfkkm03kr7d() and _v2y38mxkj21 then
            _v2y38mxkj21:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
    _vz6fcrdbpna(_S("110|183|220|212|215|220|215|226|211|142|184|227|219|222|142|179|188|175|176|186|179|178"))
end

local function _v4v3ywzxf2d()
    if State.InfiniteJumpConn then
        State.InfiniteJumpConn:Disconnect()
        State.InfiniteJumpConn = nil
    end
end

local function _vjgvgdocx3o()
    if State.ClickTPConn then return end
    State.ClickTPConn = _v7g0rk761tx.InputBegan:Connect(function(input, processed)
        if processed or not _v881x2wj21m.ClickTeleport then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1 and _v7g0rk761tx:IsKeyDown(Enum.KeyCode.LeftControl) then
            local cam = _v7g1rkzie7j.CurrentCamera
            if not cam then return end
            local ray = cam:ScreenPointToRay(input.Position.X, input.Position.Y)
            local _vhze65f2lk7 = RaycastParams.new()
            if Character then _vhze65f2lk7.FilterDescendantsInstances = {Character} end
            local _vpse5a8c0ec = pcall(function()
                _vhze65f2lk7.FilterType = Enum.RaycastFilterType.Exclude
            end)
            if not _vpse5a8c0ec then
                _vhze65f2lk7.FilterType = Enum.RaycastFilterType.Blacklist
            end
            local hit = _v7g1rkzie7j:Raycast(ray.Origin, ray.Direction * 2000, _vhze65f2lk7)
            if hit then
                _vdfqhxrkax7(hit.Position)
                _vz6fcrdbpna(_S("122|189|230|227|221|229|154|206|202|154|8716|154") .. math.floor(hit.Position.X) .. _S("117|161") .. math.floor(hit.Position.Y))
            end
        end
    end)
    _vz6fcrdbpna(_S("130|197|238|235|229|237|162|214|210|162|199|208|195|196|206|199|198|162|170|197|246|244|238|173|197|238|235|229|237|171"))
end

local function _vmrja7l9ksk()
    if State.ClickTPConn then
        State.ClickTPConn:Disconnect()
        State.ClickTPConn = nil
    end
end

local function _vhc4zamv669(name)
    if not _vfkkm03kr7d() then return end
    State.Waypoints[name] = _v0p8wj67ppf.Position
    _vz6fcrdbpna(_S("114|197|211|232|215|214|146|233|211|235|226|225|219|224|230|172|146") .. name)
end

local function _v4va91n2kd2(name)
    local pos = State.Waypoints[name]
    if pos then
        _vdfqhxrkax7(pos)
        _vz6fcrdbpna(_S("121|205|201|153|240|218|242|233|232|226|231|237|179|153") .. name)
    else
        _vz6fcrdbpna(_S("64|151|161|185|176|175|169|174|180|96|174|175|180|96|166|175|181|174|164|122|96") .. name)
    end
end

local function _vq8uk0wn8o5()
    if State.AntiAFKConn then return end
    local vu = game:GetService(_S("78|164|183|192|194|195|175|186|163|193|179|192"))
    State.AntiAFKConn = _vw7mory5oh0.Idled:Connect(function()
        if _v881x2wj21m.AntiAFK then
            pcall(function() vu:CaptureController(); vu:ClickButton2(Vector2.new(0, 0)) end)
        end
    end)
    _vz6fcrdbpna(_S("118|183|228|234|223|163|183|188|193|150|187|196|183|184|194|187|186"))
end

local function _vr9grh3cl1k()
    if State.AntiAFKConn then
        State.AntiAFKConn:Disconnect()
        State.AntiAFKConn = nil
    end
end

local function _vz504vqsbsh()
    if State.WarmthKeeperConn then return end
    State.WarmthKeeperConn = _vaubu7dr6id.Heartbeat:Connect(function()
        if not _v881x2wj21m.WarmthKeeper and not _v881x2wj21m.StaminaKeeper then return end
        if not _vfkkm03kr7d() then return end
        pcall(function()
            if _v881x2wj21m.WarmthKeeper then
                for _, name in ipairs({_S("110|197|207|224|219|226|214"), _S("72|156|173|181|184|173|186|169|188|189|186|173"), _S("81|148|192|189|181"), _S("126|198|227|223|242"), _S("117|204|214|231|226")}) do
                    local v = Character:FindFirstChild(name) or _vw7mory5oh0:FindFirstChild(name)
                    if v and v:IsA(_S("128|214|225|236|245|229|194|225|243|229")) then v.Value = 100 end
                end
                _vkz9nq2rro5(_S("68|187|165|182|177|184|172")); _vkz9nq2rro5(_S("124|228|225|221|240")); _vkz9nq2rro5(_S("77|176|174|186|189|179|182|191|178"))
            end
            if _v881x2wj21m.StaminaKeeper then
                for _, name in ipairs({_S("100|183|216|197|209|205|210|197"), _S("63|132|173|164|177|166|184"), _S("101|168|209|206|210|199"), _S("100|179|220|221|203|201|210"), _S("66|132|180|167|163|182|170")}) do
                    local v = Character:FindFirstChild(name) or _vw7mory5oh0:FindFirstChild(name)
                    if v and v:IsA(_S("93|179|190|201|210|194|159|190|208|194")) then v.Value = 100 end
                end
            end
        end)
    end)
    _vz6fcrdbpna(_S("130|217|227|244|239|246|234|177|213|246|227|239|235|240|227|162|205|231|231|242|231|244|162|199|208|195|196|206|199|198"))
end

local function _v1n5vapbqxi()
    if State.WarmthKeeperConn then
        State.WarmthKeeperConn:Disconnect()
        State.WarmthKeeperConn = nil
    end
end

local function _vfsh86i3pbj()
    for _, obj in ipairs(State.TracerObjects) do
        pcall(function() obj:Destroy() end)
    end
    State.TracerObjects = {}
end

local function _vuafz4tpyz6()
    if not _v881x2wj21m.Tracers then _vfsh86i3pbj() return end
    if not _vfkkm03kr7d() then return end
    _vfsh86i3pbj()
    local _v66q4i442t1 = {}
    for _, r in ipairs(_v6dmf6w8na1()) do
        if #_v66q4i442t1 >= 8 then break end
        table.insert(_v66q4i442t1, {Part = r.Part, Color = Color3.fromRGB(100, 200, 255)})
    end
    for _, s in ipairs(_v95az4z8xcm()) do
        if #_v66q4i442t1 >= 10 then break end
        table.insert(_v66q4i442t1, {Part = s.Part, Color = Color3.fromRGB(0, 255, 100)})
    end
    for _, t in ipairs(_v66q4i442t1) do
        local att0 = Instance.new(_S("101|166|217|217|198|200|205|210|202|211|217"))
        att0.Parent = _v0p8wj67ppf
        local att1 = Instance.new(_S("104|169|220|220|201|203|208|213|205|214|220"))
        att1.Parent = t.Part
        local beam = Instance.new(_S("86|152|187|183|195"))
        beam.Attachment0 = att0
        beam.Attachment1 = att1
        beam.Color = ColorSequence.new(t.Color)
        beam.Width0 = 0.15
        beam.Width1 = 0.15
        beam.FaceCamera = true
        beam.Parent = _v0p8wj67ppf
        table.insert(State.TracerObjects, att0)
        table.insert(State.TracerObjects, att1)
        table.insert(State.TracerObjects, beam)
    end
end

local function _vlfsefhgt6k()
    for _, obj in ipairs(State.PlayerESPObjects) do
        pcall(function() obj:Destroy() end)
    end
    State.PlayerESPObjects = {}
end

local function _vun8sjd8giq()
    if not _v881x2wj21m.PlayerESP then _vlfsefhgt6k() return end
    _vlfsefhgt6k()
    for _, plr in ipairs(_v3rhsro3ur2:GetPlayers()) do
        if plr ~= _vw7mory5oh0 and plr.Character then
            local hrp = plr.Character:FindFirstChild(_S("118|190|235|227|215|228|229|223|218|200|229|229|234|198|215|232|234"))
            if hrp then
                local hl = Instance.new(_S("104|176|209|207|208|212|209|207|208|220"))
                hl.FillTransparency = 0.7
                hl.OutlineColor = Color3.fromRGB(255, 80, 80)
                hl.FillColor = Color3.fromRGB(255, 50, 50)
                hl.Parent = plr.Character
                local bb = Instance.new(_S("96|162|201|204|204|194|207|193|210|196|167|213|201"))
                bb.Size = UDim2.new(0, 100, 0, 24)
                bb.StudsOffset = Vector3.new(0, 3, 0)
                bb.AlwaysOnTop = true
                bb.Parent = hrp
                local lbl = Instance.new(_S("101|185|202|221|217|177|198|199|202|209"))
                lbl.Size = UDim2.new(1, 0, 1, 0)
                lbl.BackgroundTransparency = 0.5
                lbl.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                lbl.Text = plr.Name .. _S("90|122|181") .. math.floor(_v778hx85juz(hrp)) .. _S("128|237|221")
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

local function _v4hmfy9cv0b()
    for _, obj in ipairs(State.ChestESPObjects) do
        pcall(function() obj:Destroy() end)
    end
    State.ChestESPObjects = {}
end

local function _vtv05cekvno()
    if not _v881x2wj21m.ChestESP then _v4hmfy9cv0b() return end
    _v4hmfy9cv0b()
    local _v3mi5y0zl08 = {_S("102|201|206|203|217|218"), _S("90|189|204|187|206|191"), _S("109|210|227|210|219|225"), _S("99|202|204|201|215"), _S("75|187|189|176|190|176|185|191"), _S("128|244|242|229|225|243|245|242|229"), _S("77|191|178|196|174|191|177")}
    for _, d in ipairs(_v7g1rkzie7j:GetDescendants()) do
        if d:IsA(_S("69|146|180|169|170|177")) or d:IsA(_S("86|152|183|201|187|166|183|200|202")) then
            local nl = string.lower(d.Name)
            for _, p in ipairs(_v3mi5y0zl08) do
                if string.find(nl, p) then
                    local part = d:IsA(_S("121|187|218|236|222|201|218|235|237")) and d or d:FindFirstChildWhichIsA(_S("71|137|168|186|172|151|168|185|187"))
                    if part then
                        local hl = Instance.new(_S("106|178|211|209|210|214|211|209|210|222"))
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

local function _v9bzxreprvn()
    if State.FullbrightApplied then return end
    State.SavedLighting = {
        Brightness = _vsqltgi9up2.Brightness,
        ClockTime = _vsqltgi9up2.ClockTime,
        FogEnd = _vsqltgi9up2.FogEnd,
        GlobalShadows = _vsqltgi9up2.GlobalShadows,
        Ambient = _vsqltgi9up2.Ambient,
        OutdoorAmbient = _vsqltgi9up2.OutdoorAmbient,
    }
    _vsqltgi9up2.Brightness = 2
    _vsqltgi9up2.ClockTime = 14
    _vsqltgi9up2.FogEnd = 100000
    _vsqltgi9up2.GlobalShadows = false
    _vsqltgi9up2.Ambient = Color3.fromRGB(180, 180, 180)
    _vsqltgi9up2.OutdoorAmbient = Color3.fromRGB(180, 180, 180)
    State.FullbrightApplied = true
    _vz6fcrdbpna(_S("66|136|183|174|174|164|180|171|169|170|182|98|145|144"))
end

local function _vbwploypc7z()
    if not State.FullbrightApplied then return end
    for k, v in pairs(State.SavedLighting) do
        pcall(function() _vsqltgi9up2[k] = v end)
    end
    State.FullbrightApplied = false
    _vz6fcrdbpna(_S("97|167|214|205|205|195|211|202|200|201|213|129|176|167|167"))
end

local function _v6auwxr6mz8()
    for _, plr in ipairs(_v3rhsro3ur2:GetPlayers()) do
        if plr ~= _vw7mory5oh0 and plr.Character then
            for _, p in ipairs(plr.Character:GetDescendants()) do
                if p:IsA(_S("89|155|186|204|190|169|186|203|205")) then p.LocalTransparencyModifier = _v881x2wj21m.HideOtherPlayers and 1 or 0 end
            end
        end
    end
end

local function _v15ix5z44iz()
    if not _v881x2wj21m.FPSBooster then return end
    pcall(function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        for _, d in ipairs(_v7g1rkzie7j:GetDescendants()) do
            if d:IsA(_S("115|195|212|229|231|220|214|223|216|184|224|220|231|231|216|229")) or d:IsA(_S("97|181|211|194|202|205")) or d:IsA(_S("65|148|174|176|172|166")) or d:IsA(_S("66|136|171|180|167")) then
                d.Enabled = false
            end
        end
        _vsqltgi9up2.GlobalShadows = false
    end)
    _vz6fcrdbpna(_S("117|187|197|200|149|183|228|228|232|233|218|231|149|214|229|229|225|222|218|217"))
end

local function _vyj2smabwjg()
    local t = {}
    for k, v in pairs(_v881x2wj21m) do t[k] = v end
    return t
end

local function _vljvjdq7ick(t)
    if type(t) ~= _S("115|231|212|213|223|216") then return false end
    for k, v in pairs(t) do
        if _v881x2wj21m[k] ~= nil then _v881x2wj21m[k] = v end
    end
    return true
end

local function _vmh52zahbfg()
    local ok, json = pcall(function() return HttpService:JSONEncode(_vyj2smabwjg()) end)
    if not ok then _vz6fcrdbpna(_S("66|133|177|176|168|171|169|98|181|163|184|167|98|168|163|171|174|167|166")) return end
    if Exec.WriteFile(_S("60|137|165|170|161|157|137|171|177|170|176|157|165|170|155|127|171|170|162|165|163|106|166|175|171|170"), json) then
        _vz6fcrdbpna(_S("75|142|186|185|177|180|178|107|190|172|193|176|175|107|191|186|107|177|180|183|176"))
    elseif Exec.HasClipboard then
        Exec.SetClipboard(json)
        _vz6fcrdbpna(_S("86|153|197|196|188|191|189|118|185|197|198|191|187|186|118|202|197|118|185|194|191|198|184|197|183|200|186"))
    else
        _vz6fcrdbpna(_S("122|205|219|240|223|154|239|232|219|240|219|227|230|219|220|230|223|154|162|232|233|154|241|236|227|238|223|224|227|230|223|169|221|230|227|234|220|233|219|236|222|163"))
    end
end

local function _v34v0y7hviw()
    local json = Exec.ReadFile(_S("70|147|175|180|171|167|147|181|187|180|186|167|175|180|165|137|181|180|172|175|173|116|176|185|181|180"))
    if json then
        local ok, data = pcall(function() return HttpService:JSONDecode(json) end)
        if ok and _vljvjdq7ick(data) then
            _vz6fcrdbpna(_S("111|178|222|221|213|216|214|143|219|222|208|211|212|211|143|213|225|222|220|143|213|216|219|212"))
            return true
        end
    end
    _vz6fcrdbpna(_S("125|203|236|157|240|222|243|226|225|157|224|236|235|227|230|228|157|227|236|242|235|225"))
    return false
end

local function _vydq7de24ag()
    _vz6fcrdbpna(_S("77|160|178|191|195|178|191|109|181|188|189|189|182|187|180|123|123|123"))
    pcall(function()
        local body = Exec.HttpGet(_S("105|209|221|221|217|220|163|152|152|208|202|214|206|220|151|219|216|203|213|216|225|151|204|216|214|152|223|154|152|208|202|214|206|220|152") .. game.PlaceId .. _S("99|146|214|200|213|217|200|213|214|146|179|216|197|207|204|198|162|214|210|213|215|178|213|199|200|213|160|164|214|198|137|207|204|208|204|215|160|148|147|147"))
        if not body then error(_S("128|200|244|244|240|199|229|244|160|230|225|233|236|229|228")) end
        local _vny75gh6ont = HttpService:JSONDecode(body)
        if _vny75gh6ont and _vny75gh6ont.data then
            for _, srv in ipairs(_vny75gh6ont.data) do
                if srv.id ~= game.JobId and srv.playing < srv.maxPlayers then
                    _ve4tayuijtx:TeleportToPlaceInstance(game.PlaceId, srv.id, _vw7mory5oh0)
                    return
                end
            end
        end
        _ve4tayuijtx:Teleport(game.PlaceId, _vw7mory5oh0)
    end)
end

local function _vifikmtkaf1()
    if State.ServerHopConn then return end
    if _v881x2wj21m.ServerHopInterval <= 0 then return end
    State.ServerHopConn = true
    task.spawn(function()
        while _v881x2wj21m.ServerHopInterval > 0 and State.ServerHopConn do
            task.wait(_v881x2wj21m.ServerHopInterval * 60)
            if _v881x2wj21m.ServerHopInterval > 0 then _vydq7de24ag() end
        end
    end)
end

local function _vus8p4t5sx7()
    State.ServerHopConn = nil
end

local function _vt35pyq69y0()
    if State.DropCollectConn then return end
    State.DropCollectConn = true
    task.spawn(function()
        while _v881x2wj21m.AutoCollectDrops and State.DropCollectConn do
            _vg8ypavi9y6()
            task.wait(1.5)
        end
    end)
end

local _vcn74l2hxk9 = {}
local _v1ny8ofivgv = false

local function _vdhkmbuwhod(data)
    if not _v881x2wj21m.WebhookEnabled or _v881x2wj21m.WebhookURL == _S("62|") then return end
    pcall(function()
        local body = HttpService:JSONEncode(data)
        Exec.Post(_v881x2wj21m.WebhookURL, body)
    end)
end

local function _v58c9287ww1(itemName)
    if not _v881x2wj21m.WebhookFarm then return end
    _vdhkmbuwhod({
        content = _S("70|112|112|161|147|175|180|171|167|102|147|181|187|180|186|167|175|180|163|112|112|102|147|175|180|171|170|128|102") .. itemName .. _S("94|126|218|126|178|205|210|191|202|152|126") .. State.FarmCount,
    })
end

local function _vsx7p23sqlq()
    if not _v881x2wj21m.WebhookSell then return end
    _vdhkmbuwhod({
        content = _S("129|171|171|220|206|234|239|230|226|161|206|240|246|239|245|226|234|239|222|171|171|161|212|240|237|229|161|234|245|230|238|244|161|253|161|213|240|245|226|237|161|244|230|237|237|244|187|161") .. State.SellCount,
    })
end

local function _vg1g4yga0n0()
    if not _v881x2wj21m.WebhookStats then return end
    _vdhkmbuwhod({
        content = _S("68|110|110|159|145|173|178|169|165|100|145|179|185|178|184|165|173|178|100|151|184|165|184|183|161|110|110|100|145|173|178|169|168|126|100") .. State.FarmCount .. _S("123|155|247|155|206|224|231|231|238|181|155") .. State.SellCount .. _S("120|152|244|152|188|237|232|221|235|178|152") .. State.DupeCount .. _S("87|119|211|119|171|184|201|190|188|203|145|119") .. State.CurrentTarget,
    })
end

local Theme = {
    Bg = Color3.fromRGB(15, 15, 17),
    Panel = Color3.fromRGB(22, 22, 26),
    _vxu2w4bs13h = Color3.fromRGB(12, 12, 14),
    Input = Color3.fromRGB(30, 30, 34),
    Accent = Color3.fromRGB(0, 235, 120),
    AccentDark = Color3.fromRGB(0, 170, 88),
    Text = Color3.fromRGB(248, 248, 250),
    SubText = Color3.fromRGB(125, 125, 132),
    Muted = Color3.fromRGB(75, 75, 82),
}

local _vqvy8tvwszx = Instance.new(_S("107|190|206|221|208|208|217|178|224|212"))
_vqvy8tvwszx.Name = _S("70|147|175|180|171|167|147|181|187|180|186|167|175|180|156|125")
_vqvy8tvwszx.ResetOnSpawn = false
_vqvy8tvwszx.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_vqvy8tvwszx.IgnoreGuiInset = true

_vqvy8tvwszx.DisplayOrder = 999

Exec.ProtectGui(_vqvy8tvwszx)
pcall(function() _vqvy8tvwszx.Parent = Exec.GetGuiParent() end)
if not _vqvy8tvwszx.Parent then
    pcall(function() _vqvy8tvwszx.Parent = _vw7mory5oh0:WaitForChild(_S("95|175|203|192|216|196|209|166|212|200")) end)
end

local _vwczviajzu3 = _v7g1rkzie7j.CurrentCamera or _v7g1rkzie7j:WaitForChild(_S("115|182|212|224|216|229|212"), 10)
local _vytxhh69tny = _vwczviajzu3 and _vwczviajzu3.ViewportSize or Vector2.new(428, 926)

local _vnsv0epx5jn = _v7g0rk761tx.TouchEnabled or _vytxhh69tny.X < 900
local _vy8vr3owtwy = _vnsv0epx5jn and 0 or 175
local _v9958zgiko7 = _vnsv0epx5jn and UDim2.new(1, -20, 1, -36) or UDim2.new(0, 700, 0, 440)
local _vxacvhubk95 = UDim2.new(0, _vnsv0epx5jn and 140 or 160, 0, 44)
local _v0zzlkr9ksn = _vnsv0epx5jn and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0.5, -350, 0.5, -220)
local _vswg3f3w27f = _vnsv0epx5jn and UDim2.new(1, -150, 1, -60) or _v0zzlkr9ksn
local _vhbs7jl4s8a = 56
local _vh9reso0cmo = _vnsv0epx5jn and 46 or 54

local _v022toud4u3 = Instance.new(_S("113|183|227|210|222|214"))
_v022toud4u3.Name = _S("88|165|185|193|198|158|202|185|197|189")
_v022toud4u3.Size = _v9958zgiko7
_v022toud4u3.Position = _v0zzlkr9ksn
_v022toud4u3.AnchorPoint = _vnsv0epx5jn and Vector2.new(0.5, 0.5) or Vector2.new(0, 0)
_v022toud4u3.BackgroundColor3 = Theme.Bg
_v022toud4u3.BackgroundTransparency = 0.05
_v022toud4u3.BorderSizePixel = 0
_v022toud4u3.ClipsDescendants = true
_v022toud4u3.Parent = _vqvy8tvwszx

local _vs70qicp4b9 = Instance.new(_S("73|158|146|140|184|187|183|174|187"))
_vs70qicp4b9.CornerRadius = UDim.new(0, 12)
_vs70qicp4b9.Parent = _v022toud4u3

local _vg19utbue3z = Instance.new(_S("64|149|137|147|180|178|175|171|165"))
_vg19utbue3z.Color = Theme.Accent
_vg19utbue3z.Thickness = 1
_vg19utbue3z.Transparency = 0.65
_vg19utbue3z.Parent = _v022toud4u3

local _vci07thybrp = Instance.new(_S("124|194|238|221|233|225"))
_vci07thybrp.Name = _S("77|149|178|174|177|178|191")
_vci07thybrp.Size = UDim2.new(1, 0, 0, _vh9reso0cmo)
_vci07thybrp.BackgroundColor3 = Theme.Sidebar
_vci07thybrp.BorderSizePixel = 0
_vci07thybrp.ZIndex = 5
_vci07thybrp.Parent = _v022toud4u3

local _vvzl1skylzg = Instance.new(_S("91|161|205|188|200|192"))
_vvzl1skylzg.Size = UDim2.new(1, 0, 0, 1)
_vvzl1skylzg.Position = UDim2.new(0, 0, 1, -1)
_vvzl1skylzg.BackgroundColor3 = Theme.Accent
_vvzl1skylzg.BackgroundTransparency = 0.5
_vvzl1skylzg.BorderSizePixel = 0
_vvzl1skylzg.ZIndex = 6
_vvzl1skylzg.Parent = _vci07thybrp

local _vj4uq92104v = Instance.new(_S("80|164|181|200|196|156|177|178|181|188"))
_vj4uq92104v.Size = UDim2.new(0, 36, 0, 36)
_vj4uq92104v.Position = UDim2.new(0, 14, 0.5, -18)
_vj4uq92104v.BackgroundColor3 = Theme.Accent
_vj4uq92104v.Text = _S("108|185")
_vj4uq92104v.TextColor3 = Color3.fromRGB(10, 10, 12)
_vj4uq92104v.Font = Enum.Font.GothamBlack
_vj4uq92104v.TextSize = 22
_vj4uq92104v.ZIndex = 6
_vj4uq92104v.Parent = _vci07thybrp
local logoC = Instance.new(_S("128|213|201|195|239|242|238|229|242"))
logoC.CornerRadius = UDim.new(0, 8)
logoC.Parent = _vj4uq92104v

local _vcgzjb5uyp5 = Instance.new(_S("99|183|200|219|215|175|196|197|200|207"))
_vcgzjb5uyp5.Size = UDim2.new(0, 100, 0, 14)
_vcgzjb5uyp5.Position = UDim2.new(0, 56, 0, 12)
_vcgzjb5uyp5.BackgroundTransparency = 1
_vcgzjb5uyp5.Text = _S("108|185|181|186|209|205|140|177|176|181|192|181|187|186")
_vcgzjb5uyp5.TextColor3 = Theme.Accent
_vcgzjb5uyp5.Font = Enum.Font.GothamBold
_vcgzjb5uyp5.TextSize = 10
_vcgzjb5uyp5.TextXAlignment = Enum.TextXAlignment.Left
_vcgzjb5uyp5.ZIndex = 6
_vcgzjb5uyp5.Parent = _vci07thybrp

_vcgzjb5uyp5.Visible = not _vnsv0epx5jn

local _v1knqproy8l = Instance.new(_S("125|209|226|245|241|201|222|223|226|233"))
_v1knqproy8l.Size = UDim2.new(_vnsv0epx5jn and 0.62 or 0.55, 0, 0, 22)
_v1knqproy8l.Position = UDim2.new(_vnsv0epx5jn and 0.18 or 0.28, 0, 0, _vnsv0epx5jn and 6 or 10)
_v1knqproy8l.BackgroundTransparency = 1
_v1knqproy8l.Text = _S("84|161|189|194|185|181|116|156|201|182|116|175|116|202|139|116|177")
_v1knqproy8l.TextColor3 = Theme.Text
_v1knqproy8l.Font = Enum.Font.GothamBold
_v1knqproy8l.TextSize = _vnsv0epx5jn and 14 or 17
_v1knqproy8l.TextXAlignment = Enum.TextXAlignment.Left
_v1knqproy8l.ZIndex = 6
_v1knqproy8l.Parent = _vci07thybrp

local _v51ierjg1p7 = Instance.new(_S("92|176|193|212|208|168|189|190|193|200"))
_v51ierjg1p7.Size = UDim2.new(0.55, 0, 0, 16)
_v51ierjg1p7.Position = UDim2.new(0.28, 0, 0, 32)
_v51ierjg1p7.BackgroundTransparency = 1
_v51ierjg1p7.Text = _S("90|167|195|200|191|122|187|122|167|201|207|200|206|187|195|200|122|273|122") .. os.date(_S("119|156|184|163|151|156|185|151|156|219|151|156|208"))
_v51ierjg1p7.TextColor3 = Theme.SubText
_v51ierjg1p7.Font = Enum.Font.Gotham
_v51ierjg1p7.TextSize = 10
_v51ierjg1p7.TextXAlignment = Enum.TextXAlignment.Left
_v51ierjg1p7.ZIndex = 6
_v51ierjg1p7.Parent = _vci07thybrp

_v51ierjg1p7.Visible = not _vnsv0epx5jn

local _vs0v6hwokp5 = Instance.new(_S("100|184|201|220|216|166|217|216|216|211|210"))
_vs0v6hwokp5.Size = UDim2.new(0, _vnsv0epx5jn and 40 or 32, 0, _vnsv0epx5jn and 40 or 32)
_vs0v6hwokp5.Position = UDim2.new(1, _vnsv0epx5jn and -46 or -42, 0.5, _vnsv0epx5jn and -20 or -16)
_vs0v6hwokp5.BackgroundTransparency = 1
_vs0v6hwokp5.Text = _S("65|10070")
_vs0v6hwokp5.TextColor3 = Theme.SubText
_vs0v6hwokp5.Font = Enum.Font.GothamBold
_vs0v6hwokp5.TextSize = 16
_vs0v6hwokp5.ZIndex = 6
_vs0v6hwokp5.Parent = _vci07thybrp
_vs0v6hwokp5.MouseButton1Click:Connect(function()
    _v022toud4u3.Visible = false
    _vfxyyrs0nku.Visible = false
    State.GUIHidden = true
    if not _vnsv0epx5jn then
        _vqvy8tvwszx.Enabled = false
    end
end)

local _vff2ha547aq = Instance.new(_S("119|203|220|239|235|185|236|235|235|230|229"))
_vff2ha547aq.Size = UDim2.new(0, _vnsv0epx5jn and 40 or 32, 0, _vnsv0epx5jn and 40 or 32)
_vff2ha547aq.Position = UDim2.new(1, _vnsv0epx5jn and -90 or -78, 0.5, _vnsv0epx5jn and -20 or -16)
_vff2ha547aq.BackgroundTransparency = 1
_vff2ha547aq.Text = _S("114|8326")
_vff2ha547aq.TextColor3 = Theme.SubText
_vff2ha547aq.Font = Enum.Font.GothamBold
_vff2ha547aq.TextSize = 18
_vff2ha547aq.ZIndex = 6
_vff2ha547aq.Parent = _vci07thybrp

local _v0t8gak6a7i = _vff2ha547aq

local _vxu2w4bs13h = Instance.new(_S("125|195|239|222|234|226"))
_vxu2w4bs13h.Name = _S("105|188|210|205|206|203|202|219")
_vxu2w4bs13h.Size = UDim2.new(0, _vy8vr3owtwy, 1, -(_vh9reso0cmo + (_vnsv0epx5jn and _vhbs7jl4s8a or 0)))
_vxu2w4bs13h.Position = UDim2.new(0, 0, 0, _vh9reso0cmo)
_vxu2w4bs13h.Visible = not _vnsv0epx5jn
_vxu2w4bs13h.BackgroundColor3 = Theme.Sidebar
_vxu2w4bs13h.BorderSizePixel = 0
_vxu2w4bs13h.ZIndex = 2
_vxu2w4bs13h.Parent = _v022toud4u3

local _vmdpicituzw = Instance.new(_S("75|145|189|172|184|176"))
_vmdpicituzw.Size = UDim2.new(0, 1, 1, 0)
_vmdpicituzw.Position = UDim2.new(1, -1, 0, 0)
_vmdpicituzw.BackgroundColor3 = Theme.Accent
_vmdpicituzw.BackgroundTransparency = 0.7
_vmdpicituzw.BorderSizePixel = 0
_vmdpicituzw.Parent = _vxu2w4bs13h

local _vtdamybxboo = Instance.new(_S("101|171|215|198|210|202"))
_vtdamybxboo.Size = UDim2.new(1, 0, 1, -8)
_vtdamybxboo.Position = UDim2.new(0, 0, 0, 4)
_vtdamybxboo.BackgroundTransparency = 1
_vtdamybxboo.Parent = _vxu2w4bs13h

local _v5swwltbami = Instance.new(_S("76|161|149|152|181|191|192|152|173|197|187|193|192"))
_v5swwltbami.SortOrder = Enum.SortOrder.LayoutOrder
_v5swwltbami.Padding = UDim.new(0, 4)
_v5swwltbami.Parent = _vtdamybxboo

local _v92brft4pt6 = Instance.new(_S("62|147|135|142|159|162|162|167|172|165"))
_v92brft4pt6.PaddingTop = UDim.new(0, 6)
_v92brft4pt6.PaddingLeft = UDim.new(0, 6)
_v92brft4pt6.PaddingRight = UDim.new(0, 6)
_v92brft4pt6.Parent = _vtdamybxboo

local _v56cqb1u293 = Instance.new(_S("115|185|229|212|224|216"))
_v56cqb1u293.Size = _vnsv0epx5jn and UDim2.new(1, -16, 0, 28) or UDim2.new(1, -_vy8vr3owtwy - 16, 0, 36)
_v56cqb1u293.Position = _vnsv0epx5jn and UDim2.new(0, 8, 0, _vh9reso0cmo + 2) or UDim2.new(0, _vy8vr3owtwy + 8, 0, 62)
_v56cqb1u293.BackgroundTransparency = 1
_v56cqb1u293.Parent = _v022toud4u3

local _vbdblhzopmz = Instance.new(_S("100|184|201|220|216|176|197|198|201|208"))
_vbdblhzopmz.Size = UDim2.new(1, 0, 1, 0)
_vbdblhzopmz.BackgroundTransparency = 1
_vbdblhzopmz.Text = _S("111|182|212|221|212|225|208|219")
_vbdblhzopmz.TextColor3 = Theme.Text
_vbdblhzopmz.Font = Enum.Font.GothamBold
_vbdblhzopmz.TextSize = _vnsv0epx5jn and 14 or 15
_vbdblhzopmz.TextXAlignment = Enum.TextXAlignment.Left
_vbdblhzopmz.Parent = _v56cqb1u293

local _vdciwe5i81d = Instance.new(_S("62|132|176|159|171|163"))
_vdciwe5i81d.Name = _S("130|197|241|240|246|231|240|246|195|244|231|227")
_vdciwe5i81d.Size = _vnsv0epx5jn and UDim2.new(1, -16, 1, -(_vh9reso0cmo + _vhbs7jl4s8a + 38)) or UDim2.new(1, -_vy8vr3owtwy - 16, 1, -108)
_vdciwe5i81d.Position = _vnsv0epx5jn and UDim2.new(0, 8, 0, _vh9reso0cmo + 32) or UDim2.new(0, _vy8vr3owtwy + 8, 0, 98)
_vdciwe5i81d.BackgroundTransparency = 1
_vdciwe5i81d.ClipsDescendants = true
_vdciwe5i81d.Parent = _v022toud4u3

local Tabs = {_S("75|145|172|189|184"), _S("120|203|221|228|228"), _S("122|191|205|202"), _S("126|195|246|238|234|237|231|242"), _S("97|181|208|208|205|212"), _S("103|180|208|218|202")}
local _vxqffm6893r = {
    Farm = {Icon = _S("129|10010"), Title = _S("104|175|205|214|205|218|201|212"), Sub = _S("90|155|207|206|201|122|199|195|200|191|122|128|122|192|187|204|199")},
    Sell = {Icon = _S("95|9984"), Title = _S("63|128|180|179|174|172|160|179|168|162"), Sub = _S("73|156|174|181|181|105|111|105|190|185|176|187|170|173|174|188")},
    ESP = {Icon = _S("96|128161"), Title = _S("72|158|177|187|189|169|180|187"), Sub = _S("111|180|194|191|143|149|143|227|225|208|210|212|225|226")},
    Exploit = {Icon = _S("77|127994"), Title = _S("116|185|236|228|224|227|221|232|231"), Sub = _S("107|184|218|225|208|216|208|217|223|139|145|139|207|224|219|208|222")},
    Tools = {Icon = _S("108|128403"), Title = _S("86|170|197|197|194|201"), Sub = _S("75|158|187|196|107|113|107|194|172|196|187|186|180|185|191|190")},
    Misc = {Icon = _S("73|9954"), Title = _S("119|202|220|235|235|224|229|222|234"), Sub = _S("128|195|239|238|230|233|231|160|166|160|237|233|243|227")},
}
local _vyh0exaykpb = {}
local _vturn1rqwi0 = {}
local _vsvnrnhd0ez = {}

for i, tabName in ipairs(Tabs) do
    local info = _vxqffm6893r[tabName]
    local _v9ysdurccac = Instance.new(_S("105|189|206|225|221|171|222|221|221|216|215"))
    _v9ysdurccac.Name = tabName .. _S("81|165|178|179")
    _v9ysdurccac.Size = _vnsv0epx5jn and UDim2.new(1 / #Tabs, -3, 1, -4) or UDim2.new(1, 0, 0, 52)
    _v9ysdurccac.BackgroundColor3 = Theme.Panel
    _v9ysdurccac.BackgroundTransparency = tabName == _S("71|141|168|185|180") and 0 or 0.35
    _v9ysdurccac.BorderSizePixel = 0
    _v9ysdurccac.Text = _S("87|")
    _v9ysdurccac.AutoButtonColor = false
    _v9ysdurccac.LayoutOrder = i
    _v9ysdurccac.Parent = _vtdamybxboo

    local _vikigr9y3mx = Instance.new(_S("130|215|203|197|241|244|240|231|244"))
    _vikigr9y3mx.CornerRadius = UDim.new(0, 8)
    _vikigr9y3mx.Parent = _v9ysdurccac

    local icon = Instance.new(_S("90|174|191|210|206|166|187|188|191|198"))
    icon.Size = UDim2.new(0, 28, 0, 28)
    icon.Position = UDim2.new(0, 8, 0.5, -14)
    icon.BackgroundTransparency = 1
    icon.Text = info.Icon
    icon.TextColor3 = Theme.Accent
    icon.TextSize = 16
    icon.Font = Enum.Font.GothamBold
    icon.Parent = _v9ysdurccac

    local _v3r417mun9j = Instance.new(_S("118|202|219|238|234|194|215|216|219|226"))
    _v3r417mun9j.Size = UDim2.new(1, -44, 0, 18)
    _v3r417mun9j.Position = UDim2.new(0, 38, 0, _vnsv0epx5jn and 6 or 8)
    _v3r417mun9j.BackgroundTransparency = 1
    _v3r417mun9j.Text = info.Title
    _v3r417mun9j.TextColor3 = Theme.Text
    _v3r417mun9j.Font = Enum.Font.GothamBold
    _v3r417mun9j.TextSize = _vnsv0epx5jn and 10 or 12
    _v3r417mun9j.TextXAlignment = Enum.TextXAlignment.Left
    _v3r417mun9j.Parent = _v9ysdurccac

    local tSub = Instance.new(_S("83|167|184|203|199|159|180|181|184|191"))
    tSub.Size = UDim2.new(1, -44, 0, 14)
    tSub.Position = UDim2.new(0, 38, 0, _vnsv0epx5jn and 24 or 28)
    tSub.BackgroundTransparency = 1
    tSub.Text = info.Sub
    tSub.TextColor3 = Theme.SubText
    tSub.Font = Enum.Font.Gotham
    tSub.TextSize = 9
    tSub.TextXAlignment = Enum.TextXAlignment.Left
    tSub.Parent = _v9ysdurccac
    if _vnsv0epx5jn then
        _v3r417mun9j.Visible = false
        tSub.Visible = false
        icon.Size = UDim2.new(0, 30, 0, 30)
        icon.Position = UDim2.new(0.5, -15, 0.5, -15)
        icon.AnchorPoint = Vector2.new(0.5, 0.5)
    end

    local _v42eva0ajuh = Instance.new(_S("111|181|225|208|220|212"))
    _v42eva0ajuh.Size = _vnsv0epx5jn and UDim2.new(0.65, 0, 0, 3) or UDim2.new(0, 3, 0.7, 0)
    _v42eva0ajuh.Position = _vnsv0epx5jn and UDim2.new(0.175, 0, 0, 2) or UDim2.new(1, -4, 0.15, 0)
    _v42eva0ajuh.BackgroundColor3 = Theme.Accent
    _v42eva0ajuh.BorderSizePixel = 0
    _v42eva0ajuh.Visible = (tabName == _S("95|165|192|209|204"))
    _v42eva0ajuh.Parent = _v9ysdurccac
    local iC = Instance.new(_S("82|167|155|149|193|196|192|183|196"))
    iC.CornerRadius = UDim.new(1, 0)
    iC.Parent = _v42eva0ajuh

    _vyh0exaykpb[tabName] = _v9ysdurccac
    _vsvnrnhd0ez[tabName] = _v42eva0ajuh

    local _vvqe8qoyerh = Instance.new(_S("78|161|177|192|189|186|186|183|188|181|148|192|175|187|179"))
    _vvqe8qoyerh.Name = tabName .. _S("110|177|221|220|226|211|220|226")
    _vvqe8qoyerh.Size = UDim2.new(1, 0, 1, 0)
    _vvqe8qoyerh.BackgroundTransparency = 1
    _vvqe8qoyerh.BorderSizePixel = 0
    _vvqe8qoyerh.ScrollBarThickness = _vnsv0epx5jn and 6 or 3
    _vvqe8qoyerh.ScrollBarImageColor3 = Theme.Accent
    _vvqe8qoyerh.CanvasSize = UDim2.new(0, 0, 0, 0)
    _vvqe8qoyerh.AutomaticCanvasSize = Enum.AutomaticSize.Y
    _vvqe8qoyerh.Visible = (tabName == _S("129|199|226|243|238"))
    _vvqe8qoyerh.Parent = _vdciwe5i81d

    local _vvd9oxaxvw9 = Instance.new(_S("84|169|157|160|189|199|200|160|181|205|195|201|200"))
    _vvd9oxaxvw9.SortOrder = Enum.SortOrder.LayoutOrder
    _vvd9oxaxvw9.Padding = UDim.new(0, 6)
    _vvd9oxaxvw9.Parent = _vvqe8qoyerh

    local _vcnjh79oisk = Instance.new(_S("81|166|154|161|178|181|181|186|191|184"))
    _vcnjh79oisk.PaddingTop = UDim.new(0, 4)
    _vcnjh79oisk.PaddingBottom = UDim.new(0, 8)
    _vcnjh79oisk.PaddingLeft = UDim.new(0, 2)
    _vcnjh79oisk.PaddingRight = UDim.new(0, 6)
    _vcnjh79oisk.Parent = _vvqe8qoyerh

    _vturn1rqwi0[tabName] = _vvqe8qoyerh
end

local BottomBar
if _vnsv0epx5jn then
    BottomBar = Instance.new(_S("82|152|196|179|191|183"))
    BottomBar.Name = _S("120|186|231|236|236|231|229|204|217|218|186|217|234")
    BottomBar.Size = UDim2.new(1, 0, 0, _vhbs7jl4s8a)
    BottomBar.Position = UDim2.new(0, 0, 1, -_vhbs7jl4s8a)
    BottomBar.BackgroundColor3 = Theme.Sidebar
    BottomBar.BorderSizePixel = 0
    BottomBar.ZIndex = 4
    BottomBar.Parent = _v022toud4u3

    local _vzsu7riqjrm = Instance.new(_S("105|175|219|202|214|206"))
    _vzsu7riqjrm.Size = UDim2.new(1, 0, 0, 1)
    _vzsu7riqjrm.BackgroundColor3 = Theme.Accent
    _vzsu7riqjrm.BackgroundTransparency = 0.5
    _vzsu7riqjrm.BorderSizePixel = 0
    _vzsu7riqjrm.Parent = BottomBar

    _vtdamybxboo.Parent = BottomBar
    _vtdamybxboo.Size = UDim2.new(1, -8, 1, -6)
    _vtdamybxboo.Position = UDim2.new(0, 4, 0, 4)
    _v5swwltbami.FillDirection = Enum.FillDirection.Horizontal
    _v5swwltbami.HorizontalAlignment = Enum.HorizontalAlignment.Center
    _v5swwltbami.VerticalAlignment = Enum.VerticalAlignment.Center
    _v5swwltbami.Padding = UDim.new(0, 3)
    _v92brft4pt6.PaddingTop = UDim.new(0, 2)
    _v92brft4pt6.PaddingLeft = UDim.new(0, 2)
    _v92brft4pt6.PaddingRight = UDim.new(0, 2)
end

local function _vu6sz4l5swg()
    if _vnsv0epx5jn then
        _v022toud4u3.Visible = not _v022toud4u3.Visible
        State.GUIHidden = not _v022toud4u3.Visible
        _vfxyyrs0nku.Visible = false
        _vqvy8tvwszx.Enabled = true
    else
        _vqvy8tvwszx.Enabled = not _vqvy8tvwszx.Enabled
        State.GUIHidden = not _vqvy8tvwszx.Enabled
        if _vqvy8tvwszx.Enabled then
            _v022toud4u3.Visible = true
            _vfxyyrs0nku.Visible = false
        end
    end
end

if _vnsv0epx5jn then
    local _vmq4a4nlp7d = Instance.new(_S("130|213|229|244|231|231|240|201|247|235"))
    _vmq4a4nlp7d.Name = _S("66|143|171|176|167|163|143|177|164|171|174|167|150|177|169|169|174|167")
    _vmq4a4nlp7d.ResetOnSpawn = false
    _vmq4a4nlp7d.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    _vmq4a4nlp7d.IgnoreGuiInset = true
    _vmq4a4nlp7d.DisplayOrder = 1000
    Exec.ProtectGui(_vmq4a4nlp7d)
    pcall(function() _vmq4a4nlp7d.Parent = Exec.GetGuiParent() end)
    if not _vmq4a4nlp7d.Parent then
        _vmq4a4nlp7d.Parent = _vw7mory5oh0:WaitForChild(_S("81|161|189|178|202|182|195|152|198|186"))
    end

    local _v2aydvi7885 = Instance.new(_S("116|200|217|236|232|182|233|232|232|227|226"))
    _v2aydvi7885.Name = _S("65|142|176|163|170|173|166|149|176|168|168|173|166")
    _v2aydvi7885.Size = UDim2.new(0, 54, 0, 54)
    _v2aydvi7885.Position = UDim2.new(1, -64, 0.5, 0)
    _v2aydvi7885.AnchorPoint = Vector2.new(0, 0.5)
    _v2aydvi7885.BackgroundColor3 = Theme.Accent
    _v2aydvi7885.BorderSizePixel = 0
    _v2aydvi7885.Text = _S("82|159")
    _v2aydvi7885.TextColor3 = Color3.fromRGB(10, 10, 12)
    _v2aydvi7885.Font = Enum.Font.GothamBlack
    _v2aydvi7885.TextSize = 24
    _v2aydvi7885.ZIndex = 20
    _v2aydvi7885.Parent = _vmq4a4nlp7d
    local mtC = Instance.new(_S("63|148|136|130|174|177|173|164|177"))
    mtC.CornerRadius = UDim.new(1, 0)
    mtC.Parent = _v2aydvi7885
    local mtS = Instance.new(_S("94|179|167|177|210|208|205|201|195"))
    mtS.Color = Theme.Accent
    mtS.Thickness = 2
    mtS.Transparency = 0.3
    mtS.Parent = _v2aydvi7885
    _v2aydvi7885.MouseButton1Click:Connect(_vu6sz4l5swg)
end

local function _va3auv8mmdc(tabName)
    State.TabOpen = tabName
    local info = _vxqffm6893r[tabName]
    if info then _vbdblhzopmz.Text = info.Title end
    for name, frame in pairs(_vturn1rqwi0) do
        frame.Visible = (name == tabName)
    end
    for name, btn in pairs(_vyh0exaykpb) do
        btn.BackgroundTransparency = (name == tabName) and 0 or 0.35
        if _vsvnrnhd0ez[name] then
            _vsvnrnhd0ez[name].Visible = (name == tabName)
        end
    end
end

for tabName, btn in pairs(_vyh0exaykpb) do
    btn.MouseButton1Click:Connect(function()
        _va3auv8mmdc(tabName)
    end)
end

local _vfxyyrs0nku = Instance.new(_S("91|161|205|188|200|192"))
_vfxyyrs0nku.Size = _vxacvhubk95
_vfxyyrs0nku.Position = _vswg3f3w27f
_vfxyyrs0nku.BackgroundColor3 = Theme.Bg
_vfxyyrs0nku.BorderSizePixel = 0
_vfxyyrs0nku.Visible = false
_vfxyyrs0nku.Parent = _vqvy8tvwszx
local miniC = Instance.new(_S("84|169|157|151|195|198|194|185|198"))
miniC.CornerRadius = UDim.new(0, 10)
miniC.Parent = _vfxyyrs0nku
local miniS = Instance.new(_S("79|164|152|162|195|193|190|186|180"))
miniS.Color = Theme.Accent
miniS.Thickness = 1
miniS.Transparency = 0.5
miniS.Parent = _vfxyyrs0nku

local _v33mnxjlvsq = Instance.new(_S("97|181|198|217|213|173|194|195|198|205"))
_v33mnxjlvsq.Size = UDim2.new(0.65, 0, 1, 0)
_v33mnxjlvsq.Position = UDim2.new(0.08, 0, 0, 0)
_v33mnxjlvsq.BackgroundTransparency = 1
_v33mnxjlvsq.Text = _S("97|10032|129|174|202|207|198|194|129|169|214|195")
_v33mnxjlvsq.TextColor3 = Theme.Accent
_v33mnxjlvsq.Font = Enum.Font.GothamBold
_v33mnxjlvsq.TextSize = 12
_v33mnxjlvsq.TextXAlignment = Enum.TextXAlignment.Left
_v33mnxjlvsq.Parent = _vfxyyrs0nku

local _vtgd49xh9gf = Instance.new(_S("79|163|180|199|195|145|196|195|195|190|189"))
_vtgd49xh9gf.Size = UDim2.new(0, 36, 0, 26)
_vtgd49xh9gf.Position = UDim2.new(1, -42, 0.5, -13)
_vtgd49xh9gf.BackgroundColor3 = Theme.Accent
_vtgd49xh9gf.Text = _S("94|9727")
_vtgd49xh9gf.TextColor3 = Color3.fromRGB(10, 10, 12)
_vtgd49xh9gf.Font = Enum.Font.GothamBold
_vtgd49xh9gf.TextSize = 14
_vtgd49xh9gf.Parent = _vfxyyrs0nku
local expC = Instance.new(_S("86|171|159|153|197|200|196|187|200"))
expC.CornerRadius = UDim.new(0, 6)
expC.Parent = _vtgd49xh9gf

local _v0icv9mgna9 = 0

local function _v27p6ott2ry(parent, title)
    _v0icv9mgna9 = _v0icv9mgna9 + 1
    local wrap = Instance.new(_S("98|168|212|195|207|199"))
    wrap.Size = UDim2.new(1, 0, 0, 32)
    wrap.BackgroundTransparency = 1
    wrap.LayoutOrder = _v0icv9mgna9
    wrap.Parent = parent

    local line = Instance.new(_S("125|195|239|222|234|226"))
    line.Size = UDim2.new(1, 0, 0, 1)
    line.Position = UDim2.new(0, 0, 0, 0)
    line.BackgroundColor3 = Theme.Accent
    line.BackgroundTransparency = 0.35
    line.BorderSizePixel = 0
    line.Parent = wrap

    local _vvts9fntpd8 = Instance.new(_S("85|169|186|205|201|161|182|183|186|193"))
    _vvts9fntpd8.Size = UDim2.new(0, 18, 0, 18)
    _vvts9fntpd8.Position = UDim2.new(0, 0, 0, 8)
    _vvts9fntpd8.BackgroundTransparency = 1
    _vvts9fntpd8.Text = _S("129|128402")
    _vvts9fntpd8.TextSize = 12
    _vvts9fntpd8.Parent = wrap

    local label = Instance.new(_S("108|192|209|228|224|184|205|206|209|216"))
    label.Size = UDim2.new(1, -24, 0, 20)
    label.Position = UDim2.new(0, 22, 0, 8)
    label.BackgroundTransparency = 1
    label.Text = title
    label.TextColor3 = Theme.Text
    label.Font = Enum.Font.GothamBold
    label.TextSize = _vnsv0epx5jn and 11 or 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = wrap
    return wrap
end

local function _vo9d10l4wtz(parent, name, default, callback)
    _v0icv9mgna9 = _v0icv9mgna9 + 1
    local frame = Instance.new(_S("123|193|237|220|232|224"))
    frame.Size = UDim2.new(1, 0, 0, _vnsv0epx5jn and 44 or 36)
    frame.BackgroundColor3 = Theme.Panel
    frame.BackgroundTransparency = 0.15
    frame.BorderSizePixel = 0
    frame.LayoutOrder = _v0icv9mgna9
    frame.Parent = parent

    local _vq60qlo0lq3 = Instance.new(_S("70|155|143|137|181|184|180|171|184"))
    _vq60qlo0lq3.CornerRadius = UDim.new(0, 8)
    _vq60qlo0lq3.Parent = frame

    local _vp297p9d6us = Instance.new(_S("87|172|160|170|203|201|198|194|188"))
    _vp297p9d6us.Color = Theme.Accent
    _vp297p9d6us.Thickness = 1
    _vp297p9d6us.Transparency = 0.85
    _vp297p9d6us.Parent = frame

    local label = Instance.new(_S("127|211|228|247|243|203|224|225|228|235"))
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.Text
    label.Font = Enum.Font.Gotham
    label.TextSize = _vnsv0epx5jn and 11 or 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local check = Instance.new(_S("60|144|161|180|176|126|177|176|176|171|170"))
    check.Size = _vnsv0epx5jn and UDim2.new(0, 32, 0, 32) or UDim2.new(0, 20, 0, 20)
    check.Position = _vnsv0epx5jn and UDim2.new(1, -40, 0.5, -16) or UDim2.new(1, -30, 0.5, -10)
    check.BackgroundColor3 = default and Theme.Accent or Theme.Input
    check.BorderSizePixel = 0
    check.Text = default and _S("83|10086") or _S("127|")
    check.TextColor3 = Color3.fromRGB(10, 10, 12)
    check.Font = Enum.Font.GothamBold
    check.TextSize = 14
    check.Parent = frame
    local cC = Instance.new(_S("130|215|203|197|241|244|240|231|244"))
    cC.CornerRadius = UDim.new(0, 4)
    cC.Parent = check

    local _vwddn1e7t5a = default
    check.MouseButton1Click:Connect(function()
        _vwddn1e7t5a = not _vwddn1e7t5a
        check.BackgroundColor3 = _vwddn1e7t5a and Theme.Accent or Theme.Input
        check.Text = _vwddn1e7t5a and _S("65|10068") or _S("78|")
        callback(_vwddn1e7t5a)
    end)
    return frame, check
end

local function _ve99t4qad2u(parent, name, _, callback)
    _v0icv9mgna9 = _v0icv9mgna9 + 1
    local btn = Instance.new(_S("128|212|229|248|244|194|245|244|244|239|238"))
    btn.Size = UDim2.new(1, 0, 0, _vnsv0epx5jn and 44 or 34)
    btn.BackgroundColor3 = Theme.Panel
    btn.BackgroundTransparency = 0.1
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.TextColor3 = Theme.Text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = _vnsv0epx5jn and 11 or 12
    btn.LayoutOrder = _v0icv9mgna9
    btn.AutoButtonColor = false
    btn.Parent = parent

    local _vq60qlo0lq3 = Instance.new(_S("93|178|166|160|204|207|203|194|207"))
    _vq60qlo0lq3.CornerRadius = UDim.new(0, 8)
    _vq60qlo0lq3.Parent = btn

    local _vp297p9d6us = Instance.new(_S("89|174|162|172|205|203|200|196|190"))
    _vp297p9d6us.Color = Theme.Accent
    _vp297p9d6us.Thickness = 1
    _vp297p9d6us.Transparency = 0.55
    _vp297p9d6us.Parent = btn

    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Theme.Input
        _vp297p9d6us.Transparency = 0.2
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Theme.Panel
        btn.BackgroundTransparency = 0.1
        _vp297p9d6us.Transparency = 0.55
    end)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

local function _vmrr3n53x3l(parent, name, minVal, maxVal, defaultVal, callback)
    _v0icv9mgna9 = _v0icv9mgna9 + 1
    local frame = Instance.new(_S("104|174|218|201|213|205"))
    frame.Size = UDim2.new(1, 0, 0, _vnsv0epx5jn and 56 or 48)
    frame.BackgroundColor3 = Theme.Panel
    frame.BackgroundTransparency = 0.15
    frame.BorderSizePixel = 0
    frame.LayoutOrder = _v0icv9mgna9
    frame.Parent = parent

    local _vq60qlo0lq3 = Instance.new(_S("89|174|162|156|200|203|199|190|203"))
    _vq60qlo0lq3.CornerRadius = UDim.new(0, 8)
    _vq60qlo0lq3.Parent = frame

    local label = Instance.new(_S("61|145|162|181|177|137|158|159|162|169"))
    label.Size = UDim2.new(0.7, 0, 0, 18)
    label.Position = UDim2.new(0, 12, 0, 6)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.SubText
    label.Font = Enum.Font.Gotham
    label.TextSize = _vnsv0epx5jn and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local _vyc09apb9hw = Instance.new(_S("87|171|188|207|203|163|184|185|188|195"))
    _vyc09apb9hw.Size = UDim2.new(0, 50, 0, 18)
    _vyc09apb9hw.Position = UDim2.new(1, -58, 0, 6)
    _vyc09apb9hw.BackgroundTransparency = 1
    _vyc09apb9hw.Text = tostring(defaultVal)
    _vyc09apb9hw.TextColor3 = Theme.Accent
    _vyc09apb9hw.Font = Enum.Font.GothamBold
    _vyc09apb9hw.TextSize = 11
    _vyc09apb9hw.TextXAlignment = Enum.TextXAlignment.Right
    _vyc09apb9hw.Parent = frame

    local _v4ahjht7bxu = Instance.new(_S("123|193|237|220|232|224"))
    _v4ahjht7bxu.Size = UDim2.new(1, -24, 0, 8)
    _v4ahjht7bxu.Position = UDim2.new(0, 12, 0, 30)
    _v4ahjht7bxu.BackgroundColor3 = Theme.Input
    _v4ahjht7bxu.BorderSizePixel = 0
    _v4ahjht7bxu.Parent = frame

    local _vy4svs89quf = Instance.new(_S("128|213|201|195|239|242|238|229|242"))
    _vy4svs89quf.CornerRadius = UDim.new(1, 0)
    _vy4svs89quf.Parent = _v4ahjht7bxu

    local pct = (defaultVal - minVal) / (maxVal - minVal)
    local _v0vuj29xyk7 = Instance.new(_S("69|139|183|166|178|170"))
    _v0vuj29xyk7.Size = UDim2.new(pct, 0, 1, 0)
    _v0vuj29xyk7.BackgroundColor3 = Theme.Accent
    _v0vuj29xyk7.BorderSizePixel = 0
    _v0vuj29xyk7.Parent = _v4ahjht7bxu
    local _vetuyagg91z = Instance.new(_S("122|207|195|189|233|236|232|223|236"))
    _vetuyagg91z.CornerRadius = UDim.new(1, 0)
    _vetuyagg91z.Parent = _v0vuj29xyk7

    local _vr636gmt874 = false
    local function _vjymbfu9340(input)
        local relX = math.clamp((input.Position.X - _v4ahjht7bxu.AbsolutePosition.X) / _v4ahjht7bxu.AbsoluteSize.X, 0, 1)
        local val = math.floor(minVal + (maxVal - minVal) * relX)
        _v0vuj29xyk7.Size = UDim2.new(relX, 0, 1, 0)
        _vyc09apb9hw.Text = tostring(val)
        callback(val)
    end

    _v4ahjht7bxu.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            _vr636gmt874 = true
            _vjymbfu9340(input)
        end
    end)
    _v7g0rk761tx.InputChanged:Connect(function(input)
        if _vr636gmt874 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            _vjymbfu9340(input)
        end
    end)
    _v7g0rk761tx.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            _vr636gmt874 = false
        end
    end)
    return frame
end

local function _vrwf0yfji8j(parent, name, defaultText, callback)
    _v0icv9mgna9 = _v0icv9mgna9 + 1
    local frame = Instance.new(_S("120|190|234|217|229|221"))
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.BackgroundColor3 = Theme.Panel
    frame.BackgroundTransparency = 0.15
    frame.BorderSizePixel = 0
    frame.LayoutOrder = _v0icv9mgna9
    frame.Parent = parent

    local _vq60qlo0lq3 = Instance.new(_S("66|151|139|133|177|180|176|167|180"))
    _vq60qlo0lq3.CornerRadius = UDim.new(0, 8)
    _vq60qlo0lq3.Parent = frame

    local label = Instance.new(_S("113|197|214|233|229|189|210|211|214|221"))
    label.Size = UDim2.new(0.38, 0, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.SubText
    label.Font = Enum.Font.Gotham
    label.TextSize = _vnsv0epx5jn and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local input = Instance.new(_S("96|180|197|216|212|162|207|216"))
    input.Size = UDim2.new(0.55, 0, 0, 26)
    input.Position = UDim2.new(0.42, 0, 0.5, -13)
    input.BackgroundColor3 = Theme.Input
    input.BorderSizePixel = 0
    input.Text = defaultText
    input.PlaceholderText = name
    input.TextColor3 = Theme.Text
    input.PlaceholderColor3 = Theme.Muted
    input.Font = Enum.Font.Gotham
    input.TextSize = _vnsv0epx5jn and 10 or 11
    input.ClearTextOnFocus = false
    input.Parent = frame

    local _vbkn148xm1m = Instance.new(_S("66|151|139|133|177|180|176|167|180"))
    _vbkn148xm1m.CornerRadius = UDim.new(0, 6)
    _vbkn148xm1m.Parent = input

    local _v475n2prn52 = Instance.new(_S("94|179|167|177|210|208|205|201|195"))
    _v475n2prn52.Color = Theme.Accent
    _v475n2prn52.Thickness = 1
    _v475n2prn52.Transparency = 0.75
    _v475n2prn52.Parent = input

    input.FocusLost:Connect(function()
        callback(input.Text)
    end)
    return frame, input
end

local function _vluobd54qx3()
    _v0icv9mgna9 = 0
end

local _vlotxgwgyz9 = _vturn1rqwi0[_S("67|137|164|181|176")]
_vluobd54qx3()

_v27p6ott2ry(_vlotxgwgyz9, _S("111|128313|143|194|195|176|195|194"))
_v0icv9mgna9 = _v0icv9mgna9 + 1
local _vgqh8psfe2e = Instance.new(_S("100|170|214|197|209|201"))
_vgqh8psfe2e.Size = UDim2.new(1, 0, 0, 52)
_vgqh8psfe2e.BackgroundColor3 = Theme.Panel
_vgqh8psfe2e.BackgroundTransparency = 0.1
_vgqh8psfe2e.BorderSizePixel = 0
_vgqh8psfe2e.LayoutOrder = _v0icv9mgna9
_vgqh8psfe2e.Parent = _vlotxgwgyz9

local _vjsxp6xhpme = Instance.new(_S("100|185|173|167|211|214|210|201|214"))
_vjsxp6xhpme.CornerRadius = UDim.new(0, 8)
_vjsxp6xhpme.Parent = _vgqh8psfe2e

local _vl8lmfpc94l = Instance.new(_S("108|193|181|191|224|222|219|215|209"))
_vl8lmfpc94l.Color = Theme.Accent
_vl8lmfpc94l.Thickness = 1
_vl8lmfpc94l.Transparency = 0.8
_vl8lmfpc94l.Parent = _vgqh8psfe2e

local _v6am7tg9fjc = Instance.new(_S("118|202|219|238|234|194|215|216|219|226"))
_v6am7tg9fjc.Name = _S("85|168|201|182|201|200|169|186|205|201")
_v6am7tg9fjc.Size = UDim2.new(1, -12, 0, 28)
_v6am7tg9fjc.Position = UDim2.new(0, 10, 0, 4)
_v6am7tg9fjc.BackgroundTransparency = 1
_v6am7tg9fjc.Text = _S("93|170|198|203|194|193|151|125|141|125|217|125|176|194|201|201|208|151|125|141|125|217|125|177|190|207|196|194|209|151|125|171|204|203|194")
_v6am7tg9fjc.TextColor3 = Theme.SubText
_v6am7tg9fjc.Font = Enum.Font.Gotham
_v6am7tg9fjc.TextSize = _vnsv0epx5jn and 9 or 10
_v6am7tg9fjc.TextXAlignment = Enum.TextXAlignment.Left
_v6am7tg9fjc.TextWrapped = true
_v6am7tg9fjc.Parent = _vgqh8psfe2e

CashLabel = Instance.new(_S("129|213|230|249|245|205|226|227|230|237"))
CashLabel.Name = _S("70|137|167|185|174|154|171|190|186")
CashLabel.Size = UDim2.new(1, -12, 0, 18)
CashLabel.Position = UDim2.new(0, 10, 0, 30)
CashLabel.BackgroundTransparency = 1
CashLabel.Text = _S("105|172|202|220|209|163|137|153|137|229|137|192|206|210|208|209|221|163|137|153|152|154|153|153")
CashLabel.TextColor3 = Theme.Accent
CashLabel.Font = Enum.Font.GothamBold
CashLabel.TextSize = _vnsv0epx5jn and 9 or 10
CashLabel.TextXAlignment = Enum.TextXAlignment.Left
CashLabel.Parent = _vgqh8psfe2e

local function _vxrwsubayku()
    _v6am7tg9fjc.Text = _S("95|172|200|205|196|195|153|127") .. State.FarmCount .. _S("116|148|240|148|199|217|224|224|231|174|148") .. State.SellCount .. _S("110|142|234|142|178|227|222|211|168|142") .. State.DupeCount .. _S("88|120|212|120|172|185|202|191|189|204|146|120") .. (State.CurrentTarget or _S("85|163|196|195|186"))
    if CashLabel then
        CashLabel.Text = _S("112|179|209|227|216|170|144") .. _vqstarybcyo() .. _S("78|110|202|110|165|179|183|181|182|194|136|110") .. math.floor(_vvaq4x8umby()) .. _S("95|142") .. math.floor(_vfrcbsiz5tb())
    end
end

_v27p6ott2ry(_vlotxgwgyz9, _S("129|128389|161|212|206|194|211|213|161|205|208|208|209"))

_vo9d10l4wtz(_vlotxgwgyz9, _S("106|189|215|203|220|222|138|182|217|217|218|138|146|176|203|220|215|8700|189|207|214|214|8700|191|218|209|220|203|206|207|147"), false, function(val)
    _v881x2wj21m.SmartLoop = val
    if val then _vho0wlx0qr5() else _vzdjbze56jl() end
end)

_vo9d10l4wtz(_vlotxgwgyz9, _S("80|145|197|196|191|112|149|193|197|185|192|112|146|181|195|196|112|160|185|179|187|177|200|181"), false, function(val)
    _v881x2wj21m.AutoEquipPickaxe = val
end)

_vo9d10l4wtz(_vlotxgwgyz9, _S("90|172|187|202|195|190|122|167|195|200|191|122|130|199|207|198|206|195|135|194|195|206|131"), false, function(val)
    _v881x2wj21m.RapidMine = val
end)

_vmrr3n53x3l(_vlotxgwgyz9, _S("81|163|178|193|186|181|113|158|186|191|182|113|153|186|197|196"), 1, 10, 3, function(val)
    _v881x2wj21m.RapidMineCount = val
end)

_vo9d10l4wtz(_vlotxgwgyz9, _S("129|194|246|245|240|161|196|240|237|237|230|228|245|161|197|243|240|241|244"), false, function(val)
    _v881x2wj21m.AutoCollectDrops = val
    if val then _vt35pyq69y0() else State.DropCollectConn = nil end
end)

_vo9d10l4wtz(_vlotxgwgyz9, _S("72|138|193|184|169|187|187|104|152|186|183|181|184|188|104|144|183|180|172"), true, function(val)
    _v881x2wj21m.BypassPromptHold = val
end)

_vo9d10l4wtz(_vlotxgwgyz9, _S("73|157|192|174|174|183|105|157|174|181|174|185|184|187|189"), false, function(val)
    _v881x2wj21m.TweenTeleport = val
end)

_v27p6ott2ry(_vlotxgwgyz9, _S("63|127982|95|142|145|132|95|133|136|139|147|132|145"))

_vo9d10l4wtz(_vlotxgwgyz9, _S("103|172|213|200|201|211|204|135|182|217|204|135|173|208|211|219|204|217"), false, function(val)
    _v881x2wj21m.OreFilterEnabled = val
end)

_vrwf0yfji8j(_vlotxgwgyz9, _S("77|164|181|182|193|178|185|182|192|193|109|156|191|178|192"), _v881x2wj21m.OreFilter, function(text)
    _v881x2wj21m.OreFilter = text
end)

_vrwf0yfji8j(_vlotxgwgyz9, _S("85|151|193|182|184|192|193|190|200|201|117|164|199|186|200"), _v881x2wj21m.OreBlacklist, function(text)
    _v881x2wj21m.OreBlacklist = text
end)

_v27p6ott2ry(_vlotxgwgyz9, _S("90|10025|122|155|175|174|169|122|160|155|172|167"))

_vo9d10l4wtz(_vlotxgwgyz9, _S("73|138|190|189|184|105|143|170|187|182|105|155|184|172|180|188|120|140|187|194|188|189|170|181|188"), false, function(val)
    _v881x2wj21m.AutoFarm = val
    if val then _vd3flhxcpsp() else _vzw7r555gpw() end
end)

_vo9d10l4wtz(_vlotxgwgyz9, _S("110|190|224|215|221|224|215|226|231|142|182|215|213|214|211|225|226|142|196|207|218|227|211"), false, function(val)
    _v881x2wj21m.PriorityHighestValue = val
    if val then _v881x2wj21m.PriorityClosest = false end
end)

_vo9d10l4wtz(_vlotxgwgyz9, _S("101|181|215|206|212|215|206|217|222|133|168|209|212|216|202|216|217"), true, function(val)
    _v881x2wj21m.PriorityClosest = val
    if val then _v881x2wj21m.PriorityHighestValue = false end
end)

_vmrr3n53x3l(_vlotxgwgyz9, _S("111|181|208|225|220|143|193|208|211|216|228|226"), 50, 2000, 500, function(val)
    _v881x2wj21m.FarmRadius = val
end)

_vmrr3n53x3l(_vlotxgwgyz9, _S("64|134|161|178|173|96|132|165|172|161|185"), 1, 100, 5, function(val)
    _v881x2wj21m.FarmDelay = val / 100
end)

_ve99t4qad2u(_vlotxgwgyz9, _S("103|128372|135|186|202|200|213|135|185|214|202|210|218|135|181|214|222"), Color3.fromRGB(40, 80, 160), function()
    local rocks = _v6dmf6w8na1()
    _vz6fcrdbpna(_S("109|179|220|226|219|209|141") .. #rocks .. _S("74|106|188|185|173|181|189|121|173|188|195|189|190|171|182|189"))
end)

_ve99t4qad2u(_vlotxgwgyz9, _S("76|10011|108|153|181|186|177|108|154|177|173|190|177|191|192|108|158|187|175|183"), Color3.fromRGB(40, 120, 60), function()
    local rocks = _v6dmf6w8na1()
    if #rocks > 0 then
        _vtpiuw0mlmi(rocks[1])
    else
        _vz6fcrdbpna(_S("76|154|187|108|190|187|175|183|191|108|178|187|193|186|176|109"))
    end
end)

_ve99t4qad2u(_vlotxgwgyz9, _S("95|9984|127|162|192|194|199|196|127|177|196|204|206|211|196|210"), Color3.fromRGB(100, 50, 150), function()
    _vfkmt9bge94()
end)

local _vj5vhtul3mw = _vturn1rqwi0[_S("122|205|223|230|230")]
_vluobd54qx3()

_v27p6ott2ry(_vj5vhtul3mw, _S("94|128270|126|159|179|178|173|126|177|163|170|170"))

_vo9d10l4wtz(_vj5vhtul3mw, _S("107|190|208|215|215|139|194|211|208|217|139|173|204|206|214|219|204|206|214|139|177|224|215|215"), true, function(val)
    _v881x2wj21m.SellWhenFull = val
end)

_vmrr3n53x3l(_vj5vhtul3mw, _S("84|167|185|192|192|116|161|189|194|116|151|181|199|188|116|168|188|198|185|199|188|195|192|184"), 0, 500000, 0, function(val)
    _v881x2wj21m.SellMinCash = val
end)

_vo9d10l4wtz(_vj5vhtul3mw, _S("91|156|208|207|202|123|174|192|199|199"), false, function(val)
    _v881x2wj21m.AutoSell = val
    if val then _ve3muz6jcxo() else _v68j7p81bmw() end
end)

_vmrr3n53x3l(_vj5vhtul3mw, _S("96|179|197|204|204|128|178|193|196|201|213|211"), 50, 1000, 300, function(val)
    _v881x2wj21m.SellRadius = val
end)

_vmrr3n53x3l(_vj5vhtul3mw, _S("124|207|225|232|232|156|192|225|232|221|245"), 1, 50, 3, function(val)
    _v881x2wj21m.SellDelay = val / 10
end)

_ve99t4qad2u(_vj5vhtul3mw, _S("66|128242|98|149|167|174|174|98|163|182|98|144|167|163|180|167|181|182|98|149|170|177|178"), Color3.fromRGB(140, 100, 30), function()
    local shops = _v95az4z8xcm()
    if #shops > 0 then
        _vvvn9iohlxk(shops[1])
    else
        _vz6fcrdbpna(_S("111|189|222|143|226|215|222|223|226|143|213|222|228|221|211|144"))
    end
end)

_ve99t4qad2u(_vj5vhtul3mw, _S("100|128068|132|171|211|132|172|211|209|201|132|147|132|184|201|208|201|212|211|214|216|132|216|211|132|183|204|211|212"), Color3.fromRGB(80, 50, 150), function()
    local shops = _v95az4z8xcm()
    if #shops > 0 then
        _vdfqhxrkax7(shops[1].Part.Position)
        _vz6fcrdbpna(_S("106|190|207|214|207|218|217|220|222|207|206|138|222|217|164|138") .. shops[1].Name)
    end
end)

_v27p6ott2ry(_vj5vhtul3mw, _S("95|128817|127|160|180|179|174|127|161|180|184|127|180|175|166|177|160|163|164|178"))

_vo9d10l4wtz(_vj5vhtul3mw, _S("114|179|231|230|225|146|180|231|235|146|194|219|213|221|211|234|215"), false, function(val) _v881x2wj21m.AutoBuyPickaxe = val end)
_vo9d10l4wtz(_vj5vhtul3mw, _S("83|148|200|199|194|115|149|200|204|115|149|180|182|190|195|180|182|190"), false, function(val) _v881x2wj21m.AutoBuyBackpack = val end)
_vo9d10l4wtz(_vj5vhtul3mw, _S("61|126|178|177|172|93|127|178|182|93|137|178|160|168"), false, function(val) _v881x2wj21m.AutoBuyLuck = val end)
_vo9d10l4wtz(_vj5vhtul3mw, _S("98|163|215|214|209|130|164|215|219|130|185|195|212|207|214|202"), false, function(val) _v881x2wj21m.AutoBuyWarmth = val end)

_vo9d10l4wtz(_vj5vhtul3mw, _S("110|175|227|226|221|142|192|211|208|215|224|226|214"), false, function(val) _v881x2wj21m.AutoRebirth = val end)

_vmrr3n53x3l(_vj5vhtul3mw, _S("105|187|206|203|210|219|221|209|137|172|202|220|209|137|189|209|219|206|220|209|216|213|205"), 1000, 1000000, 50000, function(val)
    _v881x2wj21m.RebirthCashThreshold = val
end)

_vo9d10l4wtz(_vj5vhtul3mw, _S("78|143|195|194|189|110|145|186|175|183|187|110|146|175|183|186|199|125|145|189|178|179"), false, function(val) _v881x2wj21m.AutoClaimDaily = val end)

_vrwf0yfji8j(_vj5vhtul3mw, _S("108|188|222|219|217|219|140|175|219|208|209"), _S("62|"), function(text) _v881x2wj21m.PromoCode = text end)

_ve99t4qad2u(_vj5vhtul3mw, _S("85|127958|117|152|193|182|190|194|117|153|182|190|193|206|117|163|196|204"), Color3.fromRGB(180, 130, 40), function()
    _vhlkrk81tug()
    _vz6fcrdbpna(_S("77|144|185|174|182|186|178|177|109|177|174|182|185|198|109|191|178|196|174|191|177|192"))
end)

_v27p6ott2ry(_vj5vhtul3mw, _S("82|128342|114|147|167|166|161|114|167|162|153|164|147|150|151"))

_vo9d10l4wtz(_vj5vhtul3mw, _S("67|132|184|183|178|99|152|179|170|181|164|167|168"), false, function(val)
    _v881x2wj21m.AutoUpgrade = val
    if val then _vv4do4tfqp3() else _vmga3jepmvn() end
end)

_ve99t4qad2u(_vj5vhtul3mw, _S("79|11093|111|164|191|182|193|176|179|180|111|144|187|187"), Color3.fromRGB(50, 130, 180), function()
    _vkz9nq2rro5(_S("94|211|206|197|208|191|194|195"))
    _vkz9nq2rro5(_S("78|176|195|199"))
    _vkz9nq2rro5(_S("118|230|235|232|217|222|215|233|219"))
    _vkz9nq2rro5(_S("106|225|203|220|215|222|210"))
    _vkz9nq2rro5(_S("74|186|179|173|181|171|194|175"))
    _vkz9nq2rro5(_S("92|190|189|191|199|204|189|191|199"))
    _vkz9nq2rro5(_S("88|203|200|189|189|188"))
    _vz6fcrdbpna(_S("78|148|183|192|179|178|110|195|190|181|192|175|178|179|110|192|179|187|189|194|179|193"))
end)

_v27p6ott2ry(_vj5vhtul3mw, _S("60|128038|92|128|129|144|129|127|144|129|128|92|143|132|139|140|143"))

local _vyt4bdlmiyx = Instance.new(_S("73|156|172|187|184|181|181|178|183|176|143|187|170|182|174"))
ShopList = _vyt4bdlmiyx
ShopList.Name = _S("114|197|218|225|226|190|219|229|230")
ShopList.Size = UDim2.new(1, 0, 0, 90)
ShopList.BackgroundColor3 = Theme.Panel
ShopList.BackgroundTransparency = 0.15
ShopList.BorderSizePixel = 0
ShopList.ScrollBarThickness = 3
ShopList.ScrollBarImageColor3 = Theme.Accent
ShopList.CanvasSize = UDim2.new(0, 0, 0, 0)
ShopList.AutomaticCanvasSize = Enum.AutomaticSize.Y
_v0icv9mgna9 = _v0icv9mgna9 + 1
ShopList.LayoutOrder = _v0icv9mgna9
ShopList.Parent = _vj5vhtul3mw

local _vhrmmlh764c = Instance.new(_S("70|155|143|137|181|184|180|171|184"))
_vhrmmlh764c.CornerRadius = UDim.new(0, 6)
_vhrmmlh764c.Parent = ShopList

local _vd91g5kodyk = Instance.new(_S("117|202|190|193|222|232|233|193|214|238|228|234|233"))
_vd91g5kodyk.SortOrder = Enum.SortOrder.LayoutOrder
_vd91g5kodyk.Padding = UDim.new(0, 2)
_vd91g5kodyk.Parent = ShopList

local _vvb1b0my7bz = Instance.new(_S("85|170|158|165|182|185|185|190|195|188"))
_vvb1b0my7bz.PaddingTop = UDim.new(0, 2)
_vvb1b0my7bz.PaddingBottom = UDim.new(0, 2)
_vvb1b0my7bz.PaddingLeft = UDim.new(0, 2)
_vvb1b0my7bz.PaddingRight = UDim.new(0, 2)
_vvb1b0my7bz.Parent = ShopList

local _v1xmtdiovzv = _vturn1rqwi0[_S("123|192|206|203")]
_vluobd54qx3()

_v27p6ott2ry(_v1xmtdiovzv, _S("95|128160|127|164|178|175|127|142|127|181|168|178|180|160|171|178"))

_vo9d10l4wtz(_v1xmtdiovzv, _S("94|161|208|215|209|210|191|202|126|141|126|176|205|193|201|126|163|177|174"), false, function(val)
    _v881x2wj21m.ESPEnabled = val
    if val then _vrks3cj2eai() else _vjlz2akamkn() end
end)

_vo9d10l4wtz(_v1xmtdiovzv, _S("65|149|179|162|164|166|179|180|97|105|147|176|164|172|180|112|148|169|176|177|180|106"), false, function(val)
    _v881x2wj21m.Tracers = val
    if not val then _vfsh86i3pbj() end
end)

_vo9d10l4wtz(_v1xmtdiovzv, _S("118|198|226|215|239|219|232|150|187|201|198"), false, function(val)
    _v881x2wj21m.PlayerESP = val
    if not val then _vlfsefhgt6k() end
end)

_vo9d10l4wtz(_v1xmtdiovzv, _S("118|185|222|219|233|234|150|165|150|187|236|219|228|234|150|187|201|198"), false, function(val)
    _v881x2wj21m.ChestESP = val
    if not val then _v4hmfy9cv0b() end
end)

_vo9d10l4wtz(_v1xmtdiovzv, _S("99|169|216|207|207|197|213|204|202|203|215"), false, function(val)
    _v881x2wj21m.Fullbright = val
    if val then _v9bzxreprvn() else _vbwploypc7z() end
end)

_vo9d10l4wtz(_v1xmtdiovzv, _S("68|140|173|168|169|100|147|184|172|169|182|100|148|176|165|189|169|182|183"), false, function(val)
    _v881x2wj21m.HideOtherPlayers = val
    _v6auwxr6mz8()
end)

_ve99t4qad2u(_v1xmtdiovzv, _S("78|128338|110|160|179|180|192|179|193|182|110|147|161|158"), Color3.fromRGB(50, 90, 160), function()
    if _v881x2wj21m.ESPEnabled then
        _v7b9az1lx5x()
    else
        _vz6fcrdbpna(_S("76|145|186|173|174|184|177|108|145|159|156|108|178|181|190|191|192|109"))
    end
end)

_ve99t4qad2u(_v1xmtdiovzv, _S("109|10169|141|176|217|210|206|223|141|178|192|189"), Color3.fromRGB(150, 50, 50), function()
    _vjlz2akamkn()
end)

_v27p6ott2ry(_v1xmtdiovzv, _S("93|129797|125|161|162|177|162|160|177|162|161|125|175|172|160|168|176"))

local _vivpqbsv0nl = Instance.new(_S("60|143|159|174|171|168|168|165|170|163|130|174|157|169|161"))
RockList = _vivpqbsv0nl
RockList.Name = _S("103|185|214|202|210|179|208|218|219")
RockList.Size = UDim2.new(1, 0, 0, 120)
RockList.BackgroundColor3 = Theme.Panel
RockList.BackgroundTransparency = 0.15
RockList.BorderSizePixel = 0
RockList.ScrollBarThickness = 3
RockList.ScrollBarImageColor3 = Theme.Accent
RockList.CanvasSize = UDim2.new(0, 0, 0, 0)
RockList.AutomaticCanvasSize = Enum.AutomaticSize.Y
_v0icv9mgna9 = _v0icv9mgna9 + 1
RockList.LayoutOrder = _v0icv9mgna9
RockList.Parent = _v1xmtdiovzv

local _vn01hfwn43h = Instance.new(_S("74|159|147|141|185|188|184|175|188"))
_vn01hfwn43h.CornerRadius = UDim.new(0, 6)
_vn01hfwn43h.Parent = RockList

local _vso2yt63ij4 = Instance.new(_S("124|209|197|200|229|239|240|200|221|245|235|241|240"))
_vso2yt63ij4.SortOrder = Enum.SortOrder.LayoutOrder
_vso2yt63ij4.Padding = UDim.new(0, 2)
_vso2yt63ij4.Parent = RockList

local rLPad = Instance.new(_S("77|162|150|157|174|177|177|182|187|180"))
rLPad.PaddingTop = UDim.new(0, 2)
rLPad.PaddingBottom = UDim.new(0, 2)
rLPad.PaddingLeft = UDim.new(0, 2)
rLPad.PaddingRight = UDim.new(0, 2)
rLPad.Parent = RockList

local _vhzyg1p8aol = _vturn1rqwi0[_S("105|174|225|217|213|216|210|221")]
_vluobd54qx3()

_v27p6ott2ry(_vhzyg1p8aol, _S("108|127998|140|177|196|188|184|187|181|192|191"))

_vo9d10l4wtz(_vhzyg1p8aol, _S("81|166|191|189|186|190|186|197|182|181|113|147|178|180|188|193|178|180|188"), false, function(val)
    _v881x2wj21m.UnlimitedBackpack = val
    if val then _vcj58rleeld() end
end)

_vo9d10l4wtz(_vhzyg1p8aol, _S("129|214|239|237|234|238|234|245|230|229|161|205|246|228|236"), false, function(val)
    _v881x2wj21m.UnlimitedLuck = val
    if val then _vm1x4u44hmz() end
end)

_vo9d10l4wtz(_vhzyg1p8aol, _S("127|192|237|243|232|159|195|224|236|224|230|228"), false, function(val)
    _v881x2wj21m.AntiDamage = val
    if val then _vnvnfs9nwa4() else _vuz6mxo0sy4() end
end)

_vo9d10l4wtz(_vhzyg1p8aol, _S("104|169|214|220|209|136|174|218|205|205|226|205|136|144|191|201|218|213|220|208|145"), false, function(val)
    _v881x2wj21m.AntiFreeze = val
    if val and not _v881x2wj21m.AntiDamage then
        _v881x2wj21m.AntiDamage = true
        _vnvnfs9nwa4()
    end
end)

_vo9d10l4wtz(_vhzyg1p8aol, _S("92|179|189|206|201|208|196|124|167|193|193|204|193|206"), false, function(val)
    _v881x2wj21m.WarmthKeeper = val
    if val or _v881x2wj21m.StaminaKeeper then _vz504vqsbsh() else _v1n5vapbqxi() end
end)

_vo9d10l4wtz(_vhzyg1p8aol, _S("103|186|219|200|212|208|213|200|135|178|204|204|215|204|217"), false, function(val)
    _v881x2wj21m.StaminaKeeper = val
    if val or _v881x2wj21m.WarmthKeeper then _vz504vqsbsh() else _v1n5vapbqxi() end
end)

_v27p6ott2ry(_vhzyg1p8aol, _S("120|128037|152|197|199|206|189|197|189|198|204"))

_vo9d10l4wtz(_vhzyg1p8aol, _S("67|150|179|168|168|167|99|133|178|178|182|183"), false, function(val)
    _v881x2wj21m.SpeedBoost = val
    _v6zhc4exvkl()
end)

_vmrr3n53x3l(_vhzyg1p8aol, _S("110|197|207|218|217|142|193|222|211|211|210"), 16, 200, 50, function(val)
    _v881x2wj21m.WalkSpeed = val
    if _v881x2wj21m.SpeedBoost then _v6zhc4exvkl() end
end)

_vo9d10l4wtz(_vhzyg1p8aol, _S("124|202|235|223|232|229|236"), false, function(val)
    _v881x2wj21m.Noclip = val
    if val then _vs1riaxok8q() else _vh5oae28lxf() end
end)

_vo9d10l4wtz(_vhzyg1p8aol, _S("92|162|200|213"), false, function(val)
    _v881x2wj21m.FlyEnabled = val
    if val then _v384o9i3btg() else _v734q2b0i64() end
end)

_vmrr3n53x3l(_vhzyg1p8aol, _S("89|159|197|210|121|172|201|190|190|189"), 10, 200, 60, function(val)
    _v881x2wj21m.FlySpeed = val
end)

_vo9d10l4wtz(_vhzyg1p8aol, _S("129|202|239|231|234|239|234|245|230|161|203|246|238|241"), false, function(val)
    _v881x2wj21m.InfiniteJump = val
    if val then _vtmwzs7sfw9() else _v4v3ywzxf2d() end
end)

_vo9d10l4wtz(_vhzyg1p8aol, _S("79|146|187|184|178|186|111|163|180|187|180|191|190|193|195|111|119|146|195|193|187|122|146|187|184|178|186|120"), false, function(val)
    _v881x2wj21m.ClickTeleport = val
    if val then _vjgvgdocx3o() else _vmrja7l9ksk() end
end)

_v27p6ott2ry(_vhzyg1p8aol, _S("124|128354|156|197|208|193|201|156|192|209|204|193"))

local dupeInput, dupeTextBox
dupeInput, dupeTextBox = _vrwf0yfji8j(_vhzyg1p8aol, _S("71|139|188|183|172|103|152|187|192"), _S("100|149"), function(text)
    local num = tonumber(text)
    if num and num > 0 then
        _v881x2wj21m.DupeAmount = math.floor(num)
    end
end)

_ve99t4qad2u(_vhzyg1p8aol, _S("105|128335|137|173|222|217|206|137|178|221|206|214|220|137|145") .. _v881x2wj21m.DupeAmount .. _S("83|203|124"), Color3.fromRGB(180, 60, 180), function()
    _vnvdhfciei1(_v881x2wj21m.DupeAmount)
end)

_ve99t4qad2u(_vhzyg1p8aol, _S("127|128357|159|195|241|238|239|159|195|244|239|228|159|204|228|243|231|238|227"), Color3.fromRGB(140, 50, 140), function()
    _vo69jtzgnzr()
end)

_v27p6ott2ry(_vhzyg1p8aol, _S("77|128302|109|159|146|154|156|161|146|109|146|165|157|153|156|150|161|160"))

_ve99t4qad2u(_vhzyg1p8aol, _S("82|128375|114|152|187|196|183|114|147|190|190|114|159|187|192|183|114|164|183|191|193|198|183|197"), Color3.fromRGB(160, 40, 40), function()
    _vkz9nq2rro5(_S("126|235|231|236|227"))
    _vkz9nq2rro5(_S("111|211|216|214"))
    _vkz9nq2rro5(_S("75|179|172|189|193|176|190|191"))
    _vkz9nq2rro5(_S("63|162|174|171|171|164|162|179"))
    _vkz9nq2rro5(_S("74|172|188|175|171|181"))
    _vz6fcrdbpna(_S("72|142|177|186|173|172|104|181|177|182|173|104|186|173|181|183|188|173|187"))
end)

_ve99t4qad2u(_vhzyg1p8aol, _S("81|128257|113|151|186|195|182|113|146|189|189|113|164|182|189|189|113|163|182|190|192|197|182|196"), Color3.fromRGB(40, 140, 40), function()
    _vkz9nq2rro5(_S("99|214|200|207|207"))
    _vkz9nq2rro5(_S("128|243|229|236|236|225|236|236"))
    _vkz9nq2rro5(_S("128|227|225|243|232"))
    _vkz9nq2rro5(_S("83|192|194|193|184|204"))
    _vkz9nq2rro5(_S("116|232|230|213|216|217"))
    _vz6fcrdbpna(_S("75|145|180|189|176|175|107|190|176|183|183|107|189|176|184|186|191|176|190"))
end)

_ve99t4qad2u(_vhzyg1p8aol, _S("108|11122|140|178|213|222|209|140|173|216|216|140|193|220|211|222|205|208|209|140|190|209|217|219|224|209|223"), Color3.fromRGB(40, 100, 160), function()
    _vkz9nq2rro5(_S("130|247|242|233|244|227|230|231"))
    _vkz9nq2rro5(_S("100|198|217|221"))
    _vkz9nq2rro5(_S("91|203|208|205|190|195|188|206|192"))
    _vkz9nq2rro5(_S("66|185|163|180|175|182|170"))
    _vkz9nq2rro5(_S("107|219|212|206|214|204|227|208"))
    _vkz9nq2rro5(_S("112|210|209|211|219|224|209|211|219"))
    _vz6fcrdbpna(_S("86|156|191|200|187|186|118|203|198|189|200|183|186|187|118|200|187|195|197|202|187|201"))
end)

_ve99t4qad2u(_vhzyg1p8aol, _S("80|128002|112|150|185|194|181|112|145|188|188|112|156|197|179|187|112|162|181|189|191|196|181|195"), Color3.fromRGB(140, 140, 40), function()
    _vkz9nq2rro5(_S("100|208|217|199|207"))
    _vkz9nq2rro5(_S("108|216|225|207|215|229"))
    _vkz9nq2rro5(_S("89|191|200|203|205|206|199|190"))
    _vkz9nq2rro5(_S("117|215|225|218|232|232|222|227|220"))
    _vz6fcrdbpna(_S("82|152|187|196|183|182|114|190|199|181|189|114|196|183|191|193|198|183|197"))
end)

_ve99t4qad2u(_vhzyg1p8aol, _S("124|128287|156|194|229|238|225|156|189|200|200|156|206|225|233|235|240|225|239|156|164|202|241|231|225|165"), Color3.fromRGB(200, 50, 50), function()
    for _, remote in ipairs(State.RemoteCache) do
        pcall(function()
            if remote.Type == _S("118|200|219|227|229|234|219|187|236|219|228|234") then
                remote.Instance:FireServer()
            elseif remote.Type == _S("94|176|195|203|205|210|195|164|211|204|193|210|199|205|204") then
                remote.Instance:InvokeServer()
            end
        end)
    end
    _vz6fcrdbpna(_S("107|185|192|182|176|175|139|204|215|215|139") .. #State.RemoteCache .. _S("101|133|215|202|210|212|217|202|216|134"))
end)

local _vr8t281ip39 = _vturn1rqwi0[_S("75|159|186|186|183|190")]
_vluobd54qx3()

_v27p6ott2ry(_vr8t281ip39, _S("65|128290|97|147|134|142|144|149|134|97|148|145|154"))

_vo9d10l4wtz(_vr8t281ip39, _S("108|190|209|217|219|224|209|140|191|220|229|140|148|184|219|211|140|178|213|222|209|191|209|222|226|209|222|149"), false, function(val)
    _v881x2wj21m.RemoteSpy = val
    if val then _v4a34c01mmk() else _v9kkg3kh95s() end
end)

_v0icv9mgna9 = _v0icv9mgna9 + 1
local _vx283wz4ind = Instance.new(_S("93|176|192|207|204|201|201|198|203|196|163|207|190|202|194"))
RemoteSpyList = _vx283wz4ind
RemoteSpyList.Name = _S("102|184|203|211|213|218|203|185|214|223|178|207|217|218")
RemoteSpyList.Size = UDim2.new(1, 0, 0, 100)
RemoteSpyList.BackgroundColor3 = Theme.Panel
RemoteSpyList.BackgroundTransparency = 0.15
RemoteSpyList.BorderSizePixel = 0
RemoteSpyList.ScrollBarThickness = 3
RemoteSpyList.ScrollBarImageColor3 = Theme.Accent
RemoteSpyList.CanvasSize = UDim2.new(0, 0, 0, 0)
RemoteSpyList.AutomaticCanvasSize = Enum.AutomaticSize.Y
RemoteSpyList.LayoutOrder = _v0icv9mgna9
RemoteSpyList.Parent = _vr8t281ip39

local _vuj1fp565eb = Instance.new(_S("119|204|192|186|230|233|229|220|233"))
_vuj1fp565eb.CornerRadius = UDim.new(0, 6)
_vuj1fp565eb.Parent = RemoteSpyList

local _vi2dohnensn = Instance.new(_S("124|209|197|200|229|239|240|200|221|245|235|241|240"))
_vi2dohnensn.SortOrder = Enum.SortOrder.LayoutOrder
_vi2dohnensn.Padding = UDim.new(0, 2)
_vi2dohnensn.Parent = RemoteSpyList

local _vz7xo6wvndb = Instance.new(_S("99|184|172|179|196|199|199|204|209|202"))
_vz7xo6wvndb.PaddingTop = UDim.new(0, 2)
_vz7xo6wvndb.PaddingLeft = UDim.new(0, 2)
_vz7xo6wvndb.PaddingRight = UDim.new(0, 2)
_vz7xo6wvndb.Parent = RemoteSpyList

_ve99t4qad2u(_vr8t281ip39, _S("63|128528|95|130|171|164|160|177|95|146|175|184|95|139|174|166"), Color3.fromRGB(100, 50, 50), function()
    State.RemoteSpyLogs = {}
    if RemoteSpyList then _vjwd631ytch(RemoteSpyList) end
end)

_v27p6ott2ry(_vr8t281ip39, _S("116|128035|148|183|201|199|200|195|193|148|198|185|193|195|200|185"))

_vrwf0yfji8j(_vr8t281ip39, _S("71|153|172|180|182|187|172|103|149|168|180|172"), _S("109|"), function(text)
    _v881x2wj21m.CustomRemoteName = text
end)

_vrwf0yfji8j(_vr8t281ip39, _S("96|161|210|199|211|128|136|195|207|205|205|193|128|211|197|208|193|210|193|212|197|196|137"), _S("114|"), function(text)
    _v881x2wj21m.CustomRemoteArgs = text
end)

_ve99t4qad2u(_vr8t281ip39, _S("82|128722|114|152|187|196|183|114|149|199|197|198|193|191|114|164|183|191|193|198|183"), Color3.fromRGB(160, 80, 40), function()
    _ve9e9w1c7hw()
end)

_v27p6ott2ry(_vr8t281ip39, _S("116|128321|148|203|181|205|196|195|189|194|200|199"))

_ve99t4qad2u(_vr8t281ip39, _S("121|128311|153|204|218|239|222|179|153|204|225|232|233"), Color3.fromRGB(50, 100, 160), function()
    _vhc4zamv669(_S("61|144|165|172|173"))
end)

_ve99t4qad2u(_vr8t281ip39, _S("70|128260|102|153|167|188|171|128|102|140|167|184|179|102|153|182|181|186"), Color3.fromRGB(50, 130, 80), function()
    _vhc4zamv669(_S("74|144|171|188|183"))
end)

_ve99t4qad2u(_vr8t281ip39, _S("99|128289|131|182|196|217|200|157|131|182|211|196|218|209"), Color3.fromRGB(80, 80, 140), function()
    _vhc4zamv669(_S("66|149|178|163|185|176"))
end)

_ve99t4qad2u(_vr8t281ip39, _S("74|128279|106|158|154|106|8668|106|157|178|185|186"), Color3.fromRGB(40, 90, 140), function()
    _v4va91n2kd2(_S("106|189|210|217|218"))
end)

_ve99t4qad2u(_vr8t281ip39, _S("114|128319|146|198|194|146|8708|146|184|211|228|223|146|197|226|225|230"), Color3.fromRGB(40, 120, 70), function()
    _v4va91n2kd2(_S("111|181|208|225|220"))
end)

_ve99t4qad2u(_vr8t281ip39, _S("91|128296|123|175|171|123|8685|123|174|203|188|210|201"), Color3.fromRGB(70, 70, 130), function()
    _v4va91n2kd2(_S("92|175|204|189|211|202"))
end)

local _vbzi21tct6w = _vturn1rqwi0[_S("89|166|194|204|188")]
_vluobd54qx3()

_v27p6ott2ry(_vbzi21tct6w, _S("68|9949|100|151|137|152|152|141|146|139|151"))

_vo9d10l4wtz(_vbzi21tct6w, _S("75|140|185|191|180|120|140|145|150"), false, function(val)
    _v881x2wj21m.AntiAFK = val
    if val then _vq8uk0wn8o5() else _vr9grh3cl1k() end
end)

_vo9d10l4wtz(_vbzi21tct6w, _S("65|130|182|181|176|97|147|166|180|177|162|184|175|97|108|97|147|166|162|177|177|173|186"), false, function(val)
    _v881x2wj21m.AutoRespawn = val
end)

_vo9d10l4wtz(_vbzi21tct6w, _S("72|142|152|155|104|138|183|183|187|188|173|186"), false, function(val)
    _v881x2wj21m.FPSBooster = val
    if val then _v15ix5z44iz() end
end)

_vmrr3n53x3l(_vbzi21tct6w, _S("70|153|171|184|188|171|184|102|142|181|182|102|110|179|175|180|114|102|118|131|181|172|172|111"), 0, 120, 0, function(val)
    _v881x2wj21m.ServerHopInterval = val
    _vus8p4t5sx7()
    if val > 0 then _vifikmtkaf1() end
end)

_ve99t4qad2u(_vbzi21tct6w, _S("94|127854|126|177|195|208|212|195|208|126|166|205|206|126|172|205|213"), Color3.fromRGB(60, 100, 160), function()
    _vydq7de24ag()
end)

_ve99t4qad2u(_vbzi21tct6w, _S("66|128256|98|149|163|184|167|98|133|177|176|168|171|169"), Color3.fromRGB(50, 120, 80), function()
    _vmh52zahbfg()
end)

_ve99t4qad2u(_vbzi21tct6w, _S("83|128277|115|159|194|180|183|115|150|194|193|185|188|186"), Color3.fromRGB(80, 100, 160), function()
    _v34v0y7hviw()
end)

_ve99t4qad2u(_vbzi21tct6w, _S("95|128775|127|175|160|173|168|162|127|135|178|211|206|207|127|160|203|203|136"), Color3.fromRGB(200, 40, 40), function()
    _vv1qfznm7us()
end)

_v27p6ott2ry(_vbzi21tct6w, _S("65|9065|97|140|134|154|131|138|143|133|148"))
_v0icv9mgna9 = _v0icv9mgna9 + 1
local _vrtsulfqz3x = Instance.new(_S("106|190|207|226|222|182|203|204|207|214"))
_vrtsulfqz3x.Size = UDim2.new(1, 0, 0, _vnsv0epx5jn and 56 or 70)
_vrtsulfqz3x.BackgroundColor3 = Theme.Panel
_vrtsulfqz3x.BackgroundTransparency = 0.1
_vrtsulfqz3x.BorderSizePixel = 0
_vrtsulfqz3x.Text = _vnsv0epx5jn
    and _S("65|97|97|149|162|177|97|181|169|166|97|168|179|166|166|175|97|142|97|163|182|181|181|176|175|97|181|176|97|176|177|166|175|112|164|173|176|180|166|97|136|150|138|157|175|97|97|150|180|166|97|181|176|168|168|173|166|180|97|170|175|97|166|162|164|169|97|181|162|163|97|105|175|176|97|172|166|186|163|176|162|179|165|97|176|175|97|174|176|163|170|173|166|106")
    or _S("103|135|135|185|208|206|207|219|186|207|208|205|219|135|164|135|187|214|206|206|211|204|135|174|188|176|195|213|135|135|173|135|164|135|187|214|206|206|211|204|135|173|211|224|195|213|135|135|174|135|164|135|187|214|206|206|211|204|135|168|220|219|214|135|173|200|217|212|195|213|135|135|175|135|164|135|187|214|206|206|211|204|135|186|212|200|217|219|135|179|214|214|215|195|213|135|135|183|135|164|135|183|200|213|208|202|135|186|219|214|215|135|168|211|211|195|213|135|135|170|219|217|211|146|170|211|208|202|210|135|164|135|170|211|208|202|210|135|187|183|135|143|208|205|135|204|213|200|201|211|204|203|144")
_vrtsulfqz3x.TextColor3 = Theme.SubText
_vrtsulfqz3x.Font = Enum.Font.Gotham
_vrtsulfqz3x.TextSize = _vnsv0epx5jn and 9 or 10
_vrtsulfqz3x.TextXAlignment = Enum.TextXAlignment.Left
_vrtsulfqz3x.TextYAlignment = Enum.TextYAlignment.Top
_vrtsulfqz3x.TextWrapped = true
_vrtsulfqz3x.LayoutOrder = _v0icv9mgna9
_vrtsulfqz3x.Parent = _vbzi21tct6w
local _v1juze9zlcy = Instance.new(_S("128|213|201|195|239|242|238|229|242"))
_v1juze9zlcy.CornerRadius = UDim.new(0, 6)
_v1juze9zlcy.Parent = _vrtsulfqz3x

_v27p6ott2ry(_vbzi21tct6w, _S("126|128329|158|202|205|197"))

local _vr7ygattome = Instance.new(_S("115|198|214|229|226|223|223|220|225|218|185|229|212|224|216"))
LogList = _vr7ygattome
LogList.Name = _S("80|156|191|183|156|185|195|196")
LogList.Size = UDim2.new(1, 0, 0, 100)
LogList.BackgroundColor3 = Theme.Panel
LogList.BackgroundTransparency = 0.15
LogList.BorderSizePixel = 0
LogList.ScrollBarThickness = 3
LogList.ScrollBarImageColor3 = Theme.Accent
LogList.CanvasSize = UDim2.new(0, 0, 0, 0)
LogList.AutomaticCanvasSize = Enum.AutomaticSize.Y
_v0icv9mgna9 = _v0icv9mgna9 + 1
LogList.LayoutOrder = _v0icv9mgna9
LogList.Parent = _vbzi21tct6w

local _v9vass0aa42 = Instance.new(_S("68|153|141|135|179|182|178|169|182"))
_v9vass0aa42.CornerRadius = UDim.new(0, 6)
_v9vass0aa42.Parent = LogList

local _vvfze062ev0 = Instance.new(_S("106|191|179|182|211|221|222|182|203|227|217|223|222"))
_vvfze062ev0.SortOrder = Enum.SortOrder.LayoutOrder
_vvfze062ev0.Parent = LogList

local _v8akc8pjwzj = Instance.new(_S("121|206|194|201|218|221|221|226|231|224"))
_v8akc8pjwzj.PaddingTop = UDim.new(0, 3)
_v8akc8pjwzj.PaddingLeft = UDim.new(0, 3)
_v8akc8pjwzj.PaddingRight = UDim.new(0, 3)
_v8akc8pjwzj.Parent = LogList

_v27p6ott2ry(_vbzi21tct6w, _S("75|128354|107|143|148|158|142|154|157|143|107|162|144|141|147|154|154|150"))

_vo9d10l4wtz(_vbzi21tct6w, _S("78|147|188|175|176|186|179|110|165|179|176|182|189|189|185"), false, function(val)
    _v881x2wj21m.WebhookEnabled = val
end)

_vrwf0yfji8j(_vbzi21tct6w, _S("98|185|199|196|202|209|209|205|130|183|180|174"), _S("114|"), function(text)
    _v881x2wj21m.WebhookURL = text
end)

_vo9d10l4wtz(_vbzi21tct6w, _S("127|197|224|241|236|159|203|238|230|242"), true, function(val)
    _v881x2wj21m.WebhookFarm = val
end)

_vo9d10l4wtz(_vbzi21tct6w, _S("111|194|212|219|219|143|187|222|214|226"), true, function(val)
    _v881x2wj21m.WebhookSell = val
end)

_vo9d10l4wtz(_vbzi21tct6w, _S("71|154|187|168|187|186|103|147|182|174|186"), true, function(val)
    _v881x2wj21m.WebhookStats = val
end)

_ve99t4qad2u(_vbzi21tct6w, _S("86|128318|118|169|187|196|186|118|169|202|183|202|201|118|164|197|205"), Color3.fromRGB(50, 90, 160), function()
    _vg1g4yga0n0()
    _vz6fcrdbpna(_S("97|180|198|207|213|129|212|213|194|213|212|129|213|208|129|216|198|195|201|208|208|204"))
end)

_ve99t4qad2u(_vbzi21tct6w, _S("72|129586|104|156|173|187|188|104|159|173|170|176|183|183|179"), Color3.fromRGB(90, 60, 140), function()
    _vdhkmbuwhod({content = _S("74|116|116|165|151|179|184|175|171|106|151|185|191|184|190|171|179|184|106|192|129|167|116|116|106|161|175|172|178|185|185|181|106|190|175|189|190|106|189|191|173|173|175|189|189|176|191|182|107|106|10063")})
    _vz6fcrdbpna(_S("113|197|214|228|229|214|213|145|232|214|211|217|224|224|220"))
end)

_v27p6ott2ry(_vbzi21tct6w, _S("77|128372|109|162|161|150|153|150|161|150|146|160"))

_ve99t4qad2u(_vbzi21tct6w, _S("66|128034|98|150|167|174|167|178|177|180|182|98|182|177|98|149|178|163|185|176"), Color3.fromRGB(60, 90, 140), function()
    local _v9wk73pjkm1 = _v7g1rkzie7j:FindFirstChild(_S("106|189|218|203|225|216|182|217|205|203|222|211|217|216")) or _v7g1rkzie7j:FindFirstChild(_S("60|143|172|157|179|170|175")) or _v7g1rkzie7j:FindFirstChild(_S("82|158|193|180|180|203"))
    if _v9wk73pjkm1 then
        if _v9wk73pjkm1:IsA(_S("117|183|214|232|218|197|214|231|233")) then
            _vdfqhxrkax7(_v9wk73pjkm1.Position)
        else
            local spawn = _v9wk73pjkm1:FindFirstChildWhichIsA(_S("100|166|197|215|201|180|197|214|216"))
            if spawn then _vdfqhxrkax7(spawn.Position) end
        end
    else
        _vz6fcrdbpna(_S("74|152|185|106|189|186|171|193|184|106|176|185|191|184|174|107"))
    end
end)

_ve99t4qad2u(_vbzi21tct6w, _S("91|128047|123|175|192|199|192|203|202|205|207|123|207|202|123|168|202|208|201|207|188|196|201|123|175|202|203"), Color3.fromRGB(100, 60, 140), function()
    if _vfkkm03kr7d() then
        local _v491ksvdp0e = _v0p8wj67ppf.Position.Y
        local _v750asyecmm = nil
        for _, part in ipairs(_v7g1rkzie7j:GetDescendants()) do
            if part:IsA(_S("60|126|157|175|161|140|157|174|176")) and part.Position.Y > _v491ksvdp0e then
                _v491ksvdp0e = part.Position.Y
                _v750asyecmm = part
            end
        end
        if _v750asyecmm then
            _vdfqhxrkax7(_v750asyecmm.Position + Vector3.new(0, 10, 0))
            _vz6fcrdbpna(_S("124|208|225|232|225|236|235|238|240|225|224|156|240|235|156|228|229|227|228|225|239|240|156|236|235|229|234|240|182|156") .. math.floor(_v491ksvdp0e))
        end
    end
end)

_ve99t4qad2u(_vbzi21tct6w, _S("92|128352|124|174|193|198|203|197|202|124|175|193|206|210|193|206"), Color3.fromRGB(100, 100, 50), function()
    pcall(function()
        _vw7mory5oh0:Kick(_S("64|146|165|170|175|169|174|169|174|167|110|110|110"))
        task.wait(1)
        game:GetService(_S("99|183|200|207|200|211|210|213|215|182|200|213|217|204|198|200")):TeleportToPlaceInstance(game.PlaceId, game.JobId, _vw7mory5oh0)
    end)
end)

_v27p6ott2ry(_vbzi21tct6w, _S("104|8609|136|177|182|174|183"))

_v0icv9mgna9 = _v0icv9mgna9 + 1
local _vc377ofredl = Instance.new(_S("66|150|167|186|182|142|163|164|167|174"))
_vc377ofredl.Size = UDim2.new(1, 0, 0, 50)
_vc377ofredl.BackgroundColor3 = Theme.Panel
_vc377ofredl.BackgroundTransparency = 0.1
_vc377ofredl.Text = _S("107|184|212|217|208|204|139|179|224|205|139|225|162|139|231|139") .. Exec.Name .. _S("110|202|220|193|219|207|224|226|142|186|221|221|222|142|293|142|192|211|219|221|226|211|142|193|222|231|142|293|142|179|193|190|153|142|293|142|197|207|231|222|221|215|220|226|225")
_vc377ofredl.TextColor3 = Theme.SubText
_vc377ofredl.Font = Enum.Font.Gotham
_vc377ofredl.TextSize = _vnsv0epx5jn and 9 or 10
_vc377ofredl.TextWrapped = true
_vc377ofredl.LayoutOrder = _v0icv9mgna9
_vc377ofredl.Parent = _vbzi21tct6w

local _vx091hchw0v = Instance.new(_S("96|181|169|163|207|210|206|197|210"))
_vx091hchw0v.CornerRadius = UDim.new(0, 6)
_vx091hchw0v.Parent = _vc377ofredl

_v0t8gak6a7i.MouseButton1Click:Connect(function()
    State.IsMinimized = true
    local _vgu080j3ytk = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local tween = _vzq8shq2n9u:Create(_v022toud4u3, _vgu080j3ytk, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = _vswg3f3w27f,
    })
    tween:Play()
    tween.Completed:Connect(function()
        _v022toud4u3.Visible = false
        _vfxyyrs0nku.Visible = true
        _vfxyyrs0nku.Size = UDim2.new(0, 0, 0, 0)
        local _v2jn63qij8r = _vzq8shq2n9u:Create(_vfxyyrs0nku, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = _vxacvhubk95,
        })
        _v2jn63qij8r:Play()
    end)
end)

_vtgd49xh9gf.MouseButton1Click:Connect(function()
    State.IsMinimized = false
    local _vgu080j3ytk = TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local tween = _vzq8shq2n9u:Create(_vfxyyrs0nku, _vgu080j3ytk, {
        Size = UDim2.new(0, 0, 0, 0),
    })
    tween:Play()
    tween.Completed:Connect(function()
        _vfxyyrs0nku.Visible = false
        _v022toud4u3.Visible = true
        _v022toud4u3.Size = UDim2.new(0, 0, 0, 0)
        local _v2jn63qij8r = _vzq8shq2n9u:Create(_v022toud4u3, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = _v9958zgiko7,
        })
        _v2jn63qij8r:Play()
    end)
end)

local _vht1qdv03pw = false
local dragInput
local dragStart
local startPos

local function _v7ypxs3zjrt(input)
    local delta = input.Position - dragStart
    local _vitb0iwkc7f = State.IsMinimized and _vfxyyrs0nku or _v022toud4u3
    _vitb0iwkc7f.Position = UDim2.new(
        startPos.X.Scale, startPos.X.Offset + delta.X,
        startPos.Y.Scale, startPos.Y.Offset + delta.Y
    )
end

local function _vu86e8m2fet(frame)
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            _vht1qdv03pw = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    _vht1qdv03pw = false
                end
            end)
        end
    end)
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    _v7g0rk761tx.InputChanged:Connect(function(input)
        if input == dragInput and _vht1qdv03pw then
            _v7ypxs3zjrt(input)
        end
    end)
end

_vu86e8m2fet(_vci07thybrp)
_vu86e8m2fet(_vfxyyrs0nku)

local _va7s2ok8d3z = 0
task.spawn(function()
    while true do
        task.wait(1)
        pcall(_vxrwsubayku)
        if _v881x2wj21m.WebhookEnabled and _v881x2wj21m.WebhookStats then
            local now = tick()
            if now - _va7s2ok8d3z >= 30 then
                _va7s2ok8d3z = now
                pcall(_vg1g4yga0n0)
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(10)
        pcall(function()
            local shops = _v95az4z8xcm()
            if ShopList then
                _vjwd631ytch(ShopList)
                for i, shop in ipairs(shops) do
                    if i > 15 then break end
                    local btn = Instance.new(_S("114|198|215|234|230|180|231|230|230|225|224"))
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Theme.Input
                    btn.BorderSizePixel = 0
                    btn.Text = shop.Name .. _S("94|126|185") .. math.floor(shop.Distance) .. _S("102|211|195")
                    btn.TextColor3 = Theme.Text
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = 11
                    btn.LayoutOrder = i
                    btn.Parent = ShopList
                    local _v5ja99chhgf = Instance.new(_S("63|148|136|130|174|177|173|164|177"))
                    _v5ja99chhgf.CornerRadius = UDim.new(0, 5)
                    _v5ja99chhgf.Parent = btn
                    btn.MouseButton1Click:Connect(function()
                        _vdfqhxrkax7(shop.Part.Position)
                        _vz6fcrdbpna(_S("86|170|187|194|187|198|197|200|202|187|186|118|202|197|144|118") .. shop.Name)
                    end)
                end
            end
        end)

        pcall(function()
            local rocks = _v6dmf6w8na1()
            if RockList then
                _vjwd631ytch(RockList)
                for i, rock in ipairs(rocks) do
                    if i > 20 then break end
                    local btn = Instance.new(_S("110|194|211|230|226|176|227|226|226|221|220"))
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Theme.Input
                    btn.BorderSizePixel = 0
                    btn.Text = rock.Name .. _S("101|133|192") .. math.floor(rock.Distance) .. _S("82|191|175") .. (rock.Value > 0 and (_S("60|92|96") .. rock.Value) or _S("102|"))
                    btn.TextColor3 = rock.Value > 0 and Theme.Accent or Theme.SubText
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = 11
                    btn.LayoutOrder = i
                    btn.Parent = RockList
                    local _v5ja99chhgf = Instance.new(_S("80|165|153|147|191|194|190|181|194"))
                    _v5ja99chhgf.CornerRadius = UDim.new(0, 5)
                    _v5ja99chhgf.Parent = btn
                    btn.MouseButton1Click:Connect(function()
                        _vdfqhxrkax7(rock.Part.Position)
                        _vz6fcrdbpna(_S("130|214|231|238|231|242|241|244|246|231|230|162|246|241|188|162") .. rock.Name)
                    end)
                end
            end
        end)
    end
end)

_v7g0rk761tx.InputBegan:Connect(function(input, processed)
    if processed or _vnsv0epx5jn then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        _vu6sz4l5swg()
    elseif input.KeyCode == Enum.KeyCode.F then
        _v881x2wj21m.FlyEnabled = not _v881x2wj21m.FlyEnabled
        if _v881x2wj21m.FlyEnabled then _v384o9i3btg() else _v734q2b0i64() end
        _vz6fcrdbpna(_S("104|174|212|225|162|136") .. (_v881x2wj21m.FlyEnabled and _S("68|147|146") or _S("87|166|157|157")))
    elseif input.KeyCode == Enum.KeyCode.G then
        _v881x2wj21m.AutoFarm = not _v881x2wj21m.AutoFarm
        if _v881x2wj21m.AutoFarm then _vd3flhxcpsp() else _vzw7r555gpw() end
        _vz6fcrdbpna(_S("95|160|212|211|206|127|165|192|209|204|153|127") .. (_v881x2wj21m.AutoFarm and _S("61|140|139") or _S("125|204|195|195")))
    elseif input.KeyCode == Enum.KeyCode.H then
        _v881x2wj21m.SmartLoop = not _v881x2wj21m.SmartLoop
        if _v881x2wj21m.SmartLoop then _vho0wlx0qr5() else _vzdjbze56jl() end
        _vz6fcrdbpna(_S("70|153|179|167|184|186|102|146|181|181|182|128|102") .. (_v881x2wj21m.SmartLoop and _S("103|182|181") or _S("102|181|172|172")))
    elseif input.KeyCode == Enum.KeyCode.P and _v881x2wj21m.PanicEnabled then
        _vv1qfznm7us()
        _vqvy8tvwszx.Enabled = false
        State.GUIHidden = true
    end
end)

task.spawn(function()
    while true do
        task.wait(3)
        pcall(function()
            if _v881x2wj21m.Tracers then _vuafz4tpyz6() end
            if _v881x2wj21m.PlayerESP then _vun8sjd8giq() end
            if _v881x2wj21m.ChestESP then _vtv05cekvno() end
            if _v881x2wj21m.HideOtherPlayers then _v6auwxr6mz8() end
            if _v881x2wj21m.BypassPromptHold then _vw7wq694b2b(_v7g1rkzie7j) end
        end)
    end
end)

_vw7mory5oh0.CharacterAdded:Connect(function(char)
    Character = char
    _v0p8wj67ppf = char:WaitForChild(_S("74|146|191|183|171|184|185|179|174|156|185|185|190|154|171|188|190"))
    _v2y38mxkj21 = char:WaitForChild(_S("90|162|207|199|187|200|201|195|190"))
    _vz6fcrdbpna(_S("117|184|221|214|231|214|216|233|218|231|149|231|218|232|229|214|236|227|218|217"))

    task.delay(1, function()
        if _v881x2wj21m.SpeedBoost then _v6zhc4exvkl() end
        if _v881x2wj21m.FlyEnabled then _v734q2b0i64() _v384o9i3btg() end
        if _v881x2wj21m.InfiniteJump then _v4v3ywzxf2d() _vtmwzs7sfw9() end
        if _v881x2wj21m.AutoEquipPickaxe then _vrchacjkjdg() end
        if _v881x2wj21m.AutoFarm and not State.FarmConnection then _vd3flhxcpsp() end
        if _v881x2wj21m.SmartLoop and not State.SmartLoopConn then _vho0wlx0qr5() end
        if _v881x2wj21m.WarmthKeeper or _v881x2wj21m.StaminaKeeper then _vz504vqsbsh() end
    end)
end)

_vw7mory5oh0.CharacterRemoving:Connect(function()
    if _v881x2wj21m.AutoRespawn then
        task.delay(3, function()
            pcall(function()
                if not _vw7mory5oh0.Character then
                    Exec.LoadCharacter()
                end
            end)
        end)
    end
end)

if _vwczviajzu3 then
    _vwczviajzu3:GetPropertyChangedSignal(_S("77|163|182|178|196|189|188|191|193|160|182|199|178")):Connect(function()
        local _vcgrxlimuoa = _vwczviajzu3.ViewportSize
        local isMob = _v7g0rk761tx.TouchEnabled or _vcgrxlimuoa.X < 900
        _v9958zgiko7 = isMob and UDim2.new(1, -20, 1, -36) or UDim2.new(0, 700, 0, 440)
        if not State.IsMinimized then
            _v022toud4u3.Size = _v9958zgiko7
            _v022toud4u3.AnchorPoint = isMob and Vector2.new(0.5, 0.5) or Vector2.new(0, 0)
            _v022toud4u3.Position = isMob and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0.5, -350, 0.5, -220)
        end
        _v1knqproy8l.TextSize = isMob and 14 or 17
    end)
end

Exec.SetSimRadius()

pcall(function()
    _vz6fcrdbpna(_S("103|180|208|213|204|200|135|175|220|201|135|221|158|135|211|214|200|203|204|203|135|214|213|135") .. Exec.Name)
    _vz6fcrdbpna(_S("118|187|238|219|217|235|234|229|232|150|183|198|191|233|176|150|190|202|202|198|179") .. tostring(Exec.Request ~= nil) .. _S("113|145|185|224|224|220|174") .. tostring(Exec.HasHookMeta) .. _S("79|111|146|187|184|178|186|140") .. tostring(Exec.HasFireClick))
    _vz6fcrdbpna(_vnsv0epx5jn and _S("117|201|214|229|149|220|231|218|218|227|149|194|149|215|234|233|233|228|227|149|233|228|149|233|228|220|220|225|218|149|188|202|190") or _S("65|147|170|168|169|181|148|169|170|167|181|97|126|97|136|150|138|97|189|97|132|162|164|169|166|97|179|166|174|176|181|166|180|97|167|170|179|180|181|98"))
    _vw7wq694b2b(_v7g1rkzie7j)
    _v7ig3h2e8ho:SetCore(_S("83|166|184|193|183|161|194|199|188|185|188|182|180|199|188|194|193"), {
        Title = _S("65|142|170|175|166|162|97|137|182|163|97|183|120"),
        Text = _vnsv0epx5jn and _S("65|141|176|162|165|166|165|98|97|149|162|177|97|181|169|166|97|168|179|166|166|175|97|142|97|163|182|181|181|176|175|97|176|175|97|181|169|166|97|179|170|168|169|181|111") or _S("127|203|238|224|227|228|227|160|159|207|241|228|242|242|159|209|232|230|231|243|210|231|232|229|243|159|243|238|159|243|238|230|230|235|228|159|198|212|200|173"),
        Duration = 6,
    })
end)

task.delay(3, function()
    pcall(_vfkmt9bge94)
end)
