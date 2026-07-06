--[[ Minea v7 protected | TrueSc3nt ]]
local _S=function(s)local o=tonumber(s:match("^(%d+)%|"))local t={}for c in s:gmatch("(%d+)")do local n=tonumber(c)-o;if n>0 then t[#t+1]=n end endif utf8 and utf8.char then local ok,res=pcall(utf8.char,table.unpack(t))if ok then return res end endlocal r=""for i=1,#t do if t[i]<=255 then r=r..string.char(t[i])end end;return r end
if false then local _jl4r21pkt=0 end
local _ver979nfack = game:GetService(_S("127|207|235|224|248|228|241|242"))
local _vr82lbb6oq2 = game:GetService(_S("66|148|167|178|174|171|165|163|182|167|166|149|182|177|180|163|169|167"))
local _v4au113ebz2 = game:GetService(_S("111|198|222|225|218|226|223|208|210|212"))
local _vyq77pn2i13 = game:GetService(_S("122|204|239|232|205|223|236|240|227|221|223"))
local _vqf0qk0zahi = game:GetService(_S("80|164|199|181|181|190|163|181|194|198|185|179|181"))
local _vlokuaz0syl = game:GetService(_S("114|199|229|215|228|187|224|226|231|230|197|215|228|232|219|213|215"))
local HttpService = game:GetService(_S("96|168|212|212|208|179|197|210|214|201|195|197"))
local _v5pkwv48d2z = game:GetService(_S("85|168|201|182|199|201|186|199|156|202|190"))
local _v4eu5y7x4em = game:GetService(_S("115|191|220|218|219|231|220|225|218"))
local _vx7a4i41ibp = game:GetService(_S("113|197|214|221|214|225|224|227|229|196|214|227|231|218|212|214"))
local _vm6dzsso528 = game:GetService(_S("94|161|205|202|202|195|193|210|199|205|204|177|195|208|212|199|193|195"))

local _v9q42f8ekfn = _ver979nfack.LocalPlayer
if not _v9q42f8ekfn then
    _v9q42f8ekfn = _ver979nfack.PlayerAdded:Wait()
end

local Character = _v9q42f8ekfn.Character
local _vs1tasghk8v = Character and Character:FindFirstChild(_S("80|152|197|189|177|190|191|185|180|162|191|191|196|160|177|194|196"))
local _vxx3bniaakb = Character and Character:FindFirstChild(_S("118|190|235|227|215|228|229|223|218"))
if not Character then
    task.spawn(function()
        local char = _v9q42f8ekfn.CharacterAdded:Wait()
        Character = char
        _vs1tasghk8v = char:WaitForChild(_S("96|168|213|205|193|206|207|201|196|178|207|207|212|176|193|210|212"))
        _vxx3bniaakb = char:WaitForChild(_S("85|157|202|194|182|195|196|190|185"))
    end)
end

local _v6sw8escnb8 = {
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
    WebhookURL = _S("74|"),
    WebhookEnabled = false,
    WebhookFarm = true,
    WebhookSell = true,
    WebhookStats = true,

    SmartLoop = false,
    OreFilterEnabled = false,
    OreFilter = _S("93|193|198|190|202|204|203|193|137|207|210|191|214|137|196|204|201|193|137|194|202|194|207|190|201|193|137|208|190|205|205|197|198|207|194|137|208|209|190|207|208|190|205|205|197|198|207|194|137|205|201|190|209|198|203|210|202"),
    OreBlacklist = _S("104|203|215|201|212|148|219|220|215|214|205|148|218|215|203|211"),
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
    PromoCode = _S("92|"),

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
    CustomRemoteName = _S("112|"),
    CustomRemoteArgs = _S("108|"),

    ServerHopInterval = 0,
    PanicEnabled = true,
}

local LogList, ShopList, RockList, RemoteSpyList, CashLabel, _vipiftt7ogd

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
    TabOpen = _S("85|155|182|199|194"),
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
        for i = 1, select(_S("80|115"), ...) do
            local v = select(i, ...)
            if v ~= nil then return v end
        end
    end

    Exec.Unpack = table.unpack or unpack
    Exec.Name = _S("103|188|213|210|213|214|222|213")
    pcall(function()
        if identifyexecutor then
            Exec.Name = identifyexecutor()
        elseif EXECUTOR_NAME then
            Exec.Name = EXECUTOR_NAME
        elseif syn then
            Exec.Name = _S("80|163|201|190|177|192|195|181")
        elseif KRNL_LOADED then
            Exec.Name = _S("94|169|176|172|170")
        elseif Fluxus then
            Exec.Name = _S("114|184|222|231|234|231|229")
        elseif delta then
            Exec.Name = _S("101|169|202|209|217|198")
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
            local cg = game:GetService(_S("89|156|200|203|190|160|206|194"))
            if cloneref then cg = cloneref(cg) end
            parent = cg
        end)
        if parent then return parent end
        return _v9q42f8ekfn:WaitForChild(_S("121|201|229|218|242|222|235|192|238|226"))
    end

    Exec.HttpGet = function(url)
        local ok, result = pcall(function() return game:HttpGet(url) end)
        if ok and result then return result end
        if Exec.Request then
            local res = Exec.Request({Url = url, Method = _S("93|164|162|177")})
            if type(res) == _S("79|195|176|177|187|180") then
                return res.Body or res.body or res.BodyText
            end
        end
        return HttpService:GetAsync(url)
    end

    Exec.Post = function(url, body, contentType)
        contentType = contentType or _S("92|189|204|204|200|197|191|189|208|197|203|202|139|198|207|203|202")
        if Exec.Request then
            return Exec.Request({
                Url = url,
                Method = _S("108|188|187|191|192"),
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
            elseif _v9q42f8ekfn.LoadCharacter then _v9q42f8ekfn:LoadCharacter() end
        end)
    end

    Exec.SetSimRadius = function()
        pcall(function()
            if setsimulationradius then setsimulationradius(1e9, 1e9) end
        end)
        pcall(function()
            if sethiddenproperty then
                sethiddenproperty(_v9q42f8ekfn, _S("84|167|189|193|201|192|181|200|189|195|194|166|181|184|189|201|199"), 1e9)
                sethiddenproperty(_v9q42f8ekfn, _S("117|194|214|237|200|222|226|234|225|214|233|222|228|227|199|214|217|222|234|232"), 1e9)
            end
        end)
    end

    local _vhg497m4b64 = {}
    local _vupsdo70fkf = nil
    local _vfp5qulr6c1 = false

    function Exec.OnNamecall(fn)
        table.insert(_vhg497m4b64, fn)
        if not _vfp5qulr6c1 and Exec.HasHookMeta then
            _vfp5qulr6c1 = true
            pcall(function()
                _vupsdo70fkf = hookmetamethod(game, _S("105|200|200|215|202|214|206|204|202|213|213"), Exec.SafeCClosure(function(self, ...)
                    local method = Exec.GetNamecallMethod()
                    local args = {...}
                    for _, hook in ipairs(_vhg497m4b64) do
                        local block, ret = hook(self, method, args)
                        if block then return ret end
                    end
                    return _vupsdo70fkf(self, ...)
                end))
            end)
        end
    end

    Exec.NamecallHooks = _vhg497m4b64

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

local _vinwaiwzonf = false

pcall(function()
    if Exec.HasHookMeta and Exec.GetNamecallMethod then
        Exec.OnNamecall(function(self, method, args)

            if _vinwaiwzonf and (method == _S("71|141|176|185|172|154|172|185|189|172|185") or method == _S("65|138|175|183|176|172|166|148|166|179|183|166|179")) then
                if self:IsA(_S("125|207|226|234|236|241|226|194|243|226|235|241")) or self:IsA(_S("63|145|164|172|174|179|164|133|180|173|162|179|168|174|173")) then
                    pcall(function() _vxtvfay6gw3(self.Name, method, args) end)
                end
            end

            if method == _S("114|189|219|213|221") and self == _v9q42f8ekfn then
                return true, nil
            end

            if method == _S("130|200|235|240|230|213|231|244|248|235|229|231") then
                local svc = args[1]
                if svc == _S("99|168|219|211|207|210|204|215|182|200|213|217|204|198|200") or svc == _S("85|152|189|186|182|201|168|186|199|203|190|184|186") then
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
            local _vvaufdwed48 = hookmetamethod(game, _S("123|218|218|228|233|223|224|243"), Exec.SafeCClosure(function(self, key)
                if _vxx3bniaakb and self == _vxx3bniaakb then
                    if key == _S("84|171|181|192|191|167|196|185|185|184") and _v6sw8escnb8.SpeedBoost then return 16 end
                    if key == _S("108|182|225|217|220|188|219|227|209|222") and _v6sw8escnb8.JumpPower > 50 then return 50 end
                end
                return _vvaufdwed48(self, key)
            end))
        end)
        pcall(function()
            local _v6coj1dsqwk = hookmetamethod(game, _S("96|191|191|206|197|215|201|206|196|197|216"), Exec.SafeCClosure(function(self, key, value)
                if _vxx3bniaakb and self == _vxx3bniaakb then
                    if key == _S("72|159|169|180|179|155|184|173|173|172") and _v6sw8escnb8.SpeedBoost then
                        return _v6coj1dsqwk(self, key, _v6sw8escnb8.WalkSpeed)
                    end
                end
                return _v6coj1dsqwk(self, key, value)
            end))
        end)
    end
end

local function _vv3bejf2upo()
    Character = _v9q42f8ekfn.Character
    if Character then
        _vs1tasghk8v = Character:FindFirstChild(_S("112|184|229|221|209|222|223|217|212|194|223|223|228|192|209|226|228"))
        _vxx3bniaakb = Character:FindFirstChild(_S("61|133|178|170|158|171|172|166|161"))
    end
    return Character and _vs1tasghk8v and _vxx3bniaakb
end

local function _vurfwcailwp(part)
    if not _vv3bejf2upo() then return math.huge end
    return (_vs1tasghk8v.Position - part.Position).Magnitude
end

local function _v8dr8vc6i13(position)
    if not _vv3bejf2upo() then return false end
    local _v7ipk1xfxi4 = CFrame.new(position + Vector3.new(0, 3, 0))
    if _v6sw8escnb8.TweenTeleport then
        local dist = (_vs1tasghk8v.Position - position).Magnitude
        local dur = math.clamp(dist / _v6sw8escnb8.TweenTeleportSpeed, 0.08, 2.5)
        _vqf0qk0zahi:Create(_vs1tasghk8v, TweenInfo.new(dur, Enum.EasingStyle.Linear), {CFrame = _v7ipk1xfxi4}):Play()
        task.wait(dur)
    else
        _vs1tasghk8v.CFrame = _v7ipk1xfxi4
        task.wait(_v6sw8escnb8.TeleportDelay)
    end
    return true
end

local function _v15rmhs830i(str)
    local list = {}
    for part in string.gmatch(string.lower(str or _S("83|")), _S("126|217|220|170|163|241|219|169")) do
        table.insert(list, part)
    end
    return list
end

local function _vwn5kt7xmn9(_vs6hkbeo0n2)
    if not _v6sw8escnb8.OreFilterEnabled then return true end
    local _vx08ixfz5pd = _v15rmhs830i(_v6sw8escnb8.OreBlacklist)
    for _, word in ipairs(_vx08ixfz5pd) do
        if string.find(_vs6hkbeo0n2, word, 1, true) then return false end
    end
    local _vn95sr0a7o3 = _v15rmhs830i(_v6sw8escnb8.OreFilter)
    if #_vn95sr0a7o3 == 0 then return true end
    for _, word in ipairs(_vn95sr0a7o3) do
        if string.find(_vs6hkbeo0n2, word, 1, true) then return true end
    end
    return false
end

local function _vpiu97b51nq(_v8f79y92mmj)
    local _vx01v3xl57x = _v9q42f8ekfn:FindFirstChild(_S("65|173|166|162|165|166|179|180|181|162|181|180"))
    if not _vx01v3xl57x then return 0 end
    for _, stat in ipairs(_vx01v3xl57x:GetChildren()) do
        local n = string.lower(stat.Name)
        for _, p in ipairs(_v8f79y92mmj) do
            if string.find(n, p) and stat:IsA(_S("74|160|171|182|191|175|140|171|189|175")) then
                return stat.Value
            end
        end
    end
    return 0
end

local function _vmay3n2rhhp()
    return _vpiu97b51nq({_S("85|184|182|200|189"), _S("128|237|239|238|229|249"), _S("124|223|235|229|234"), _S("125|228|236|233|225"), _S("92|190|189|200|189|202|191|193"), _S("73|171|190|172|180|188")})
end

local function _v8gl3yj8joa()
    return _vpiu97b51nq({_S("74|193|175|179|177|178|190"), _S("86|185|183|200|200|207"), _S("121|228|224"), _S("106|214|217|203|206"), _S("124|222|221|223|231|236|221|223|231")})
end

local function _v14jr4ebc0z()
    local cap = _vpiu97b51nq({_S("64|163|161|176|161|163|169|180|185"), _S("99|208|196|219|198|196|213|213|220"), _S("102|211|199|222"), _S("74|182|179|183|179|190"), _S("61|159|158|160|168|173|158|160|168")})
    if cap > 0 then return cap end
    local obj = _v9q42f8ekfn:FindFirstChild(_S("117|183|214|216|224|229|214|216|224|184|214|229|214|216|222|233|238")) or _v9q42f8ekfn:FindFirstChild(_S("125|202|222|245|192|222|239|239|246"))
    if obj and obj:IsA(_S("123|209|220|231|240|224|189|220|238|224")) then return obj.Value end
    return 100
end

local function _vw57os9bi4h()
    if _v6sw8escnb8.UnlimitedBackpack then return false end
    local _vmrtuln5egk = _v8gl3yj8joa()
    local cap = _v14jr4ebc0z()
    if cap > 0 and _vmrtuln5egk > 0 then return _vmrtuln5egk >= cap * 0.92 end
    return false
end

local function _vdr4qws4uos(root)
    if not _v6sw8escnb8.BypassPromptHold or not root then return end
    pcall(function()
        for _, d in ipairs(root:GetDescendants()) do
            if d:IsA(_S("95|175|209|206|215|200|204|200|211|216|175|209|206|204|207|211")) then
                d.HoldDuration = 0
                d.MaxActivationDistance = math.max(d.MaxActivationDistance, 20)
            end
        end
    end)
end

local function _vw9kfb4vwri()
    if not _v6sw8escnb8.AutoEquipPickaxe then return end
    pcall(function()
        local bestTool, bestScore = nil, -1
        local function _v7yzca7qa4s(tool)
            if not tool:IsA(_S("77|161|188|188|185")) then return -1 end
            local n = string.lower(tool.Name)
            if not (string.find(n, _S("81|193|186|180|188")) or string.find(n, _S("76|173|196|177")) or string.find(n, _S("88|188|202|193|196|196")) or string.find(n, _S("120|236|231|231|228")) or string.find(n, _S("127|231|224|236|236|228|241"))) then
                return 0
            end
            local s = 0
            if string.find(n, _S("98|198|203|195|207|209|208|198")) then s = s + 100
            elseif string.find(n, _S("85|188|196|193|185")) then s = s + 80
            elseif string.find(n, _S("84|189|198|195|194")) then s = s + 50
            elseif string.find(n, _S("109|224|225|220|219|210")) then s = s + 20 end
            for _, d in ipairs(tool:GetDescendants()) do
                if d:IsA(_S("70|156|167|178|187|171|136|167|185|171")) and (string.find(string.lower(d.Name), _S("114|222|215|232|215|222")) or string.find(string.lower(d.Name), _S("113|229|218|214|227"))) then
                    s = s + d.Value * 10
                end
            end
            return s
        end
        local function scan(container)
            if not container then return end
            for _, t in ipairs(container:GetChildren()) do
                local sc = _v7yzca7qa4s(t)
                if sc > bestScore then bestScore, bestTool = sc, t end
            end
        end
        scan(_v9q42f8ekfn.Backpack)
        scan(Character)
        if bestTool and Character and not Character:FindFirstChild(bestTool.Name) then
            _vxx3bniaakb:EquipTool(bestTool)
        end
    end)
end

local function _vk0pgowvvgt()
    local drops = {}
    local _v8f79y92mmj = {_S("129|229|243|240|241"), _S("114|222|225|225|230"), _S("92|197|208|193|201"), _S("128|240|233|227|235|245|240"), _S("71|170|182|179|179|172|170|187"), _S("69|180|183|170"), _S("96|199|197|205"), _S("93|192|207|214|208|209|190|201")}
    local function scan(parent)
        for _, child in ipairs(parent:GetChildren()) do
            local nl = string.lower(child.Name)
            if child:IsA(_S("125|191|222|240|226|205|222|239|241")) or child:IsA(_S("87|164|198|187|188|195")) then
                for _, p in ipairs(_v8f79y92mmj) do
                    if string.find(nl, p) then
                        local part = child:IsA(_S("111|177|208|226|212|191|208|225|227")) and child or child:FindFirstChildWhichIsA(_S("79|145|176|194|180|159|176|193|195"))
                        if part then
                            local dist = _vurfwcailwp(part)
                            if dist <= _v6sw8escnb8.FarmRadius then
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
    scan(_v4au113ebz2)
    table.sort(drops, function(a, b) return a.Distance < b.Distance end)
    return drops
end

local function _vu0se5lz0nb()
    if not _v6sw8escnb8.AutoCollectDrops then return end
    local drops = _vk0pgowvvgt()
    for i = 1, math.min(3, #drops) do
        local drop = drops[i]
        _v8dr8vc6i13(drop.Part.Position)
        if HasFireTouch then
            Exec.FireTouch(_vs1tasghk8v, drop.Part, 0)
            task.wait(0.01)
            Exec.FireTouch(_vs1tasghk8v, drop.Part, 1)
        end
        _vv8iciwgl48(_S("110|222|215|209|217|227|222"))
        _vv8iciwgl48(_S("89|188|200|197|197|190|188|205"))
        _vv8iciwgl48(_S("122|230|233|233|238"))
    end
end

local function _vazsqq0p00b()
    if _v6sw8escnb8.AutoBuyPickaxe then
        _vv8iciwgl48(_S("73|185|178|172|180|170|193|174")); _vv8iciwgl48(_S("128|226|245|249|223|240|233|227|235|225|248|229")); _vv8iciwgl48(_S("92|209|204|195|206|189|192|193|187|204|197|191|199|189|212|193"))
    end
    if _v6sw8escnb8.AutoBuyBackpack then
        _vv8iciwgl48(_S("61|159|158|160|168|173|158|160|168")); _vv8iciwgl48(_S("105|204|202|217|202|204|210|221|226")); _vv8iciwgl48(_S("127|244|239|230|241|224|227|228|222|225|224|226|234|239|224|226|234"))
    end
    if _v6sw8escnb8.AutoBuyLuck then
        _vv8iciwgl48(_S("123|231|240|222|230")); _vv8iciwgl48(_S("82|182|187|185|177|190|199|181|189")); _vv8iciwgl48(_S("85|193|202|184|192|206"))
    end
    if _v6sw8escnb8.AutoBuyWarmth then
        _vv8iciwgl48(_S("114|233|211|228|223|230|218")); _vv8iciwgl48(_S("124|228|225|221|240")); _vv8iciwgl48(_S("111|210|208|220|223|213|216|225|212"))
    end
    if _v6sw8escnb8.AutoUpgrade then
        _vv8iciwgl48(_S("61|178|173|164|175|158|161|162")); _vv8iciwgl48(_S("60|158|177|181")); _vv8iciwgl48(_S("86|198|203|200|185|190|183|201|187"))
    end
end

local function _vlt70fb0sca()
    if not _v6sw8escnb8.AutoRebirth then return end
    if _vmay3n2rhhp() >= _v6sw8escnb8.RebirthCashThreshold then
        _vv8iciwgl48(_S("112|226|213|210|217|226|228|216")); _vv8iciwgl48(_S("83|195|197|184|198|199|188|186|184")); _vv8iciwgl48(_S("122|236|223|237|223|238")); _vv8iciwgl48(_S("97|194|212|196|198|207|197"))
        _vke6snlfgah(_S("106|171|223|222|217|138|220|207|204|211|220|222|210|138|203|222|222|207|215|218|222|207|206|138|203|222|138") .. _vmay3n2rhhp() .. _S("109|141|208|206|224|213"))
    end
end

local function _v3lmil1tf08()
    if not _v6sw8escnb8.AutoClaimDaily then return end
    _vv8iciwgl48(_S("66|166|163|171|174|187")); _vv8iciwgl48(_S("111|225|212|230|208|225|211")); _vv8iciwgl48(_S("100|199|208|197|205|209")); _vv8iciwgl48(_S("76|184|187|179|181|186"))
    _vv8iciwgl48(_S("79|178|190|179|180")); _vv8iciwgl48(_S("104|218|205|204|205|205|213"))
    if _v6sw8escnb8.PromoCode ~= _S("116|") then
        _vv8iciwgl48(_S("103|202|214|203|204"), _v6sw8escnb8.PromoCode)
        _vv8iciwgl48(_S("120|234|221|220|221|221|229"), _v6sw8escnb8.PromoCode)
    end
end

local function _vnz1zdojgtk()
    if _vw57os9bi4h() and _v6sw8escnb8.SellWhenFull then return true end
    if _v6sw8escnb8.SellMinCash > 0 and _vmay3n2rhhp() >= _v6sw8escnb8.SellMinCash then return true end
    return false
end

local function _vldiorhze7r()
    _vke6snlfgah(_S("80|148|194|191|192|112|180|197|192|181|138|112|192|185|179|187|197|192|112|195|192|177|189|126|126|126"))
    pcall(function()
        local tool = Character and Character:FindFirstChildOfClass(_S("93|177|204|204|201"))
        if tool then
            tool.Parent = _v9q42f8ekfn.Backpack
            task.wait(0.1)
            _vxx3bniaakb:EquipTool(tool)
        end
        for i = 1, _v6sw8escnb8.DupeAmount do
            _vv8iciwgl48(_S("98|198|212|209|210")); _vv8iciwgl48(_S("127|239|232|226|234|244|239")); _vv8iciwgl48(_S("74|173|185|182|182|175|173|190"))
            task.wait(0.05)
        end
    end)
end

local function _vunz8xr80ai(cframe)
    if not _vv3bejf2upo() then return false end
    _vs1tasghk8v.CFrame = cframe + Vector3.new(0, 3, 0)
    task.wait(_v6sw8escnb8.TeleportDelay)
    return true
end

local function _vli1jii61e7(scrollingFrame)
    for _, child in ipairs(scrollingFrame:GetChildren()) do
        if not child:IsA(_S("72|157|145|148|177|187|188|148|169|193|183|189|188")) and not child:IsA(_S("105|190|178|185|202|205|205|210|215|208")) then
            child:Destroy()
        end
    end
end

local function _vke6snlfgah(message)
    local _v08a1du26fs = os.date(_S("114|151|186|172|151|191|172|151|197"))
    table.insert(State.Logs, 1, _S("127|218") .. _v08a1du26fs .. _S("119|212|151") .. message)
    if #State.Logs > 50 then
        table.remove(State.Logs)
    end
    if LogList then
        pcall(function()
            _vli1jii61e7(LogList)
            for i, log in ipairs(State.Logs) do
                if i > 15 then break end
                local label = Instance.new(_S("61|145|162|181|177|137|158|159|162|169"))
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

local function _v7j1h15u98j()
    State.RemoteCache = {}
    pcall(function()
        for _, remote in ipairs(_vr82lbb6oq2:GetDescendants()) do
            if remote:IsA(_S("70|152|171|179|181|186|171|139|188|171|180|186")) or remote:IsA(_S("106|188|207|215|217|222|207|176|223|216|205|222|211|217|216")) then
                table.insert(State.RemoteCache, {
                    Instance = remote,
                    Name = remote.Name,
                    Type = remote.ClassName,
                })
            end
        end
    end)
    _vke6snlfgah(_S("130|197|227|229|234|231|230|162") .. #State.RemoteCache .. _S("88|120|202|189|197|199|204|189|203"))
end

local function _vv8iciwgl48(namePattern, ...)
    local args = {...}
    for _, remote in ipairs(State.RemoteCache) do
        local rName = string.lower(remote.Name)
        local _v57hzl491gc = string.lower(namePattern)
        if string.find(rName, _v57hzl491gc) then
            pcall(function()
                if remote.Type == _S("126|208|227|235|237|242|227|195|244|227|236|242") then
                    remote.Instance:FireServer(Exec.Unpack(args))
                elseif remote.Type == _S("86|168|187|195|197|202|187|156|203|196|185|202|191|197|196") then
                    remote.Instance:InvokeServer(Exec.Unpack(args))
                end
            end)
        end
    end
end

local function _vzebbox61ma(name, ...)
    local args = {...}
    for _, remote in ipairs(State.RemoteCache) do
        if remote.Name == name then
            pcall(function()
                if remote.Type == _S("120|202|221|229|231|236|221|189|238|221|230|236") then
                    remote.Instance:FireServer(Exec.Unpack(args))
                elseif remote.Type == _S("119|201|220|228|230|235|220|189|236|229|218|235|224|230|229") then
                    remote.Instance:InvokeServer(Exec.Unpack(args))
                end
            end)
            return true
        end
    end
    return false
end

local _vnvw1sq18j6 = {
    _S("126|240|237|225|233"), _S("98|209|212|199"), _S("84|199|200|195|194|185"), _S("127|236|232|237|228|241|224|235"), _S("110|209|224|231|225|226|207|218"), _S("111|214|212|220"), _S("74|173|185|171|182"), _S("93|198|207|204|203"),
    _S("103|206|214|211|203"), _S("86|186|191|183|195|197|196|186"), _S("64|163|175|176|176|165|178"), _S("123|238|228|231|241|224|237"), _S("80|194|197|178|201"), _S("117|218|226|218|231|214|225|217"), _S("74|189|171|186|186|178|179|188|175"),
    _S("69|166|178|170|185|173|190|184|185"), _S("105|215|216|205|206"), _S("60|178|161|165|170"), _S("126|226|227|238|237|241|231|242"), _S("108|206|219|225|216|208|209|222"), _S("66|181|182|163|180|181|163|178|178|170|171|180|167"),
    _S("109|225|220|221|206|231"), _S("84|195|196|181|192"), _S("68|180|169|165|182|176"), _S("102|208|199|202|203"), _S("77|190|194|174|191|193|199"), _S("92|203|190|207|197|192|197|189|202"), _S("108|216|205|220|213|223"),
    _S("71|180|176|187|175|185|176|179"), _S("129|245|234|245|226|239|234|246|238"), _S("63|175|171|160|179|168|173|180|172"), _S("82|194|183|196|187|182|193|198"), _S("102|224|207|216|201|213|212"), _S("97|200|194|211|207|198|213"),
    _S("97|194|210|214|194|206|194|211|202|207|198"), _S("126|225|231|242|240|231|236|227"), _S("67|183|164|177|189|164|177|172|183|168"), _S("100|209|211|211|210|215|216|211|210|201"), _S("114|229|231|224|229|230|225|224|215"),
    _S("68|166|176|179|179|168|183|184|179|178|169"), _S("64|175|174|185|184"), _S("75|191|186|192|189|184|172|183|180|185|176"), _S("69|184|181|174|179|170|177"), _S("85|183|186|199|206|193"), _S("103|202|207|200|211|202|204|203|214|213|224"),
}

local function _vvkj7mz5kfi()
    local rocks = {}
    local function _v583ulqzxgz(parent)
        if not parent then return end
        for _, child in ipairs(parent:GetChildren()) do
            local _vs6hkbeo0n2 = string.lower(child.Name)
            if child:IsA(_S("126|192|223|241|227|206|223|240|242")) or child:IsA(_S("127|204|238|227|228|235")) then
                local _vop5uonq3au = false
                for _, _v57hzl491gc in ipairs(_vnvw1sq18j6) do
                    if string.find(_vs6hkbeo0n2, _v57hzl491gc) then
                        _vop5uonq3au = true
                        break
                    end
                end
                if _vop5uonq3au and _vwn5kt7xmn9(_vs6hkbeo0n2) then
                    local part = child:IsA(_S("77|143|174|192|178|157|174|191|193")) and child or child:FindFirstChildWhichIsA(_S("74|140|171|189|175|154|171|188|190"))
                    if part then
                        local dist = _vurfwcailwp(part)
                        if dist <= _v6sw8escnb8.FarmRadius then

                            local value = 0
                            pcall(function()
                                local val = child:FindFirstChild(_S("85|171|182|193|202|186")) or child:FindFirstChild(_S("75|155|189|180|174|176")) or child:FindFirstChild(_S("110|197|221|224|226|214")) or child:FindFirstChild(_S("109|195|206|217|226|210|188|227|210|223|223|214|209|210"))
                                if val and val:IsA(_S("128|214|225|236|245|229|194|225|243|229")) then
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
                    _v583ulqzxgz(child)
                end
            end
        end
    end

    local _vi0e81973lq = {
        _v4au113ebz2:FindFirstChild(_S("69|151|180|168|176|184")),
        _v4au113ebz2:FindFirstChild(_S("73|152|187|174|188")),
        _v4au113ebz2:FindFirstChild(_S("69|146|174|179|170|183|166|177|184")),
        _v4au113ebz2:FindFirstChild(_S("68|145|173|178|169|183")),
        _v4au113ebz2:FindFirstChild(_S("113|195|214|228|224|230|227|212|214|228")),
        _v4au113ebz2:FindFirstChild(_S("109|186|206|221")),
        _v4au113ebz2:FindFirstChild(_S("60|144|161|174|174|157|165|170")),
        _v4au113ebz2:FindFirstChild(_S("113|180|227|234|228|229|210|221|228")),
        _v4au113ebz2:FindFirstChild(_S("75|152|186|192|185|191|172|180|185")),
        _v4au113ebz2,
    }

    for _, area in ipairs(_vi0e81973lq) do
        if area then
            _v583ulqzxgz(area)
        end
    end

    if _v6sw8escnb8.PriorityHighestValue then
        table.sort(rocks, function(a, b) return a.Value > b.Value end)
    elseif _v6sw8escnb8.PriorityClosest then
        table.sort(rocks, function(a, b) return a.Distance < b.Distance end)
    end

    return rocks
end

local function _vkgv156tecx()
    local shops = {}
    local function _vv4a681dnp7(parent)
        if not parent then return end
        for _, child in ipairs(parent:GetChildren()) do
            local _vs6hkbeo0n2 = string.lower(child.Name)
            if child:IsA(_S("64|141|175|164|165|172")) or child:IsA(_S("99|165|196|214|200|179|196|213|215")) then
                if string.find(_vs6hkbeo0n2, _S("86|201|190|197|198")) or string.find(_vs6hkbeo0n2, _S("114|229|215|222|222")) or
                   string.find(_vs6hkbeo0n2, _S("94|209|210|205|208|195")) or string.find(_vs6hkbeo0n2, _S("116|225|217|230|215|220|213|226|232")) or
                   string.find(_vs6hkbeo0n2, _S("73|189|187|170|173|174|187")) or string.find(_vs6hkbeo0n2, _S("112|212|213|209|220|213|226")) or
                   string.find(_vs6hkbeo0n2, _S("90|199|187|204|197|191|206")) or string.find(_vs6hkbeo0n2, _S("130|248|231|240|230|241|244")) or
                   string.find(_vs6hkbeo0n2, _S("62|161|159|177|166|167|163|176")) or string.find(_vs6hkbeo0n2, _S("68|166|185|189|169|182")) or
                   string.find(_vs6hkbeo0n2, _S("74|184|186|173")) or string.find(_vs6hkbeo0n2, _S("67|166|164|182|171")) or
                   string.find(_vs6hkbeo0n2, _S("105|209|216|214|206")) or string.find(_vs6hkbeo0n2, _S("89|187|186|204|190")) or
                   string.find(_vs6hkbeo0n2, _S("123|222|220|232|235")) then
                    local part = child:IsA(_S("96|162|193|211|197|176|193|210|212")) and child or child:FindFirstChildWhichIsA(_S("75|141|172|190|176|155|172|189|191")) or child:FindFirstChild(_S("109|181|226|218|206|219|220|214|209|191|220|220|225|189|206|223|225"))
                    if part then
                        local dist = _vurfwcailwp(part)
                        table.insert(shops, {
                            Instance = child,
                            Part = part,
                            Distance = dist,
                            Name = child.Name,
                        })
                    end
                end
                if #child:GetChildren() > 0 then
                    _vv4a681dnp7(child)
                end
            end
        end
    end

    _vv4a681dnp7(_v4au113ebz2)
    table.sort(shops, function(a, b) return a.Distance < b.Distance end)
    return shops
end

local function _vc594g6v3oz(rockData)
    local rock = rockData.Instance
    local part = rockData.Part

    if not rock or not rock.Parent then return false end

    _vw9kfb4vwri()
    _vdr4qws4uos(rock)

    _vke6snlfgah(_S("70|147|175|180|175|180|173|128|102") .. rockData.Name)

    _v8dr8vc6i13(part.Position)
    task.wait(0.05)

    local function _vss4wxni4mq()

        if HasFireClick then
            local clickDetector = rock:FindFirstChildOfClass(_S("114|181|222|219|213|221|182|215|230|215|213|230|225|228")) or part:FindFirstChildOfClass(_S("81|148|189|186|180|188|149|182|197|182|180|197|192|195"))
            if clickDetector then Exec.FireClick(clickDetector) end
        end
        if HasFireProximity then
            local prompt = rock:FindFirstChildOfClass(_S("87|167|201|198|207|192|196|192|203|208|167|201|198|196|199|203")) or part:FindFirstChildOfClass(_S("120|200|234|231|240|225|229|225|236|241|200|234|231|229|232|236"))
            if prompt then
                if _v6sw8escnb8.BypassPromptHold then prompt.HoldDuration = 0 end
                Exec.FireProximity(prompt)
            end
        end
        if HasFireTouch then
            Exec.FireTouch(_vs1tasghk8v, part, 0)
            task.wait(0.01)
            Exec.FireTouch(_vs1tasghk8v, part, 1)
        end

        local tool = Character and Character:FindFirstChildOfClass(_S("82|166|193|193|190"))
        if tool then tool:Activate() end

        _vv8iciwgl48(_S("110|219|215|220|211")); _vv8iciwgl48(_S("66|170|163|180|184|167|181|182")); _vv8iciwgl48(_S("112|211|223|220|220|213|211|228"))
        _vv8iciwgl48(_S("85|183|199|186|182|192")); _vv8iciwgl48(_S("100|203|197|216|204|201|214")); _vv8iciwgl48(_S("130|230|235|233"))
        _vv8iciwgl48(_S("71|183|176|170|178")); _vv8iciwgl48(_S("96|211|215|201|206|199"))

        for _, remote in ipairs(State.RemoteCache) do
            local rName = string.lower(remote.Name)
            if string.find(rName, _S("86|195|191|196|187")) or string.find(rName, _S("96|196|201|199")) or string.find(rName, _S("118|222|215|232|236|219|233|234")) then
                pcall(function()
                    if remote.Type == _S("102|184|203|211|213|218|203|171|220|203|212|218") then
                        remote.Instance:FireServer(rock, part)
                    elseif remote.Type == _S("91|173|192|200|202|207|192|161|208|201|190|207|196|202|201") then
                        remote.Instance:InvokeServer(rock, part)
                    end
                end)
            end
        end
    end

    local hits = _v6sw8escnb8.RapidMine and _v6sw8escnb8.RapidMineCount or 1
    for _ = 1, hits do
        _vss4wxni4mq()
        if hits > 1 then task.wait(0.03) end
    end

    _vu0se5lz0nb()
    State.FarmCount = State.FarmCount + 1
    pcall(function() _vxjs8905n38(rockData.Name) end)

    return true
end

local function _vyoan4flcrh(shopData)
    if not shopData then return false end

    local shop = shopData.Instance
    local part = shopData.Part

    _vke6snlfgah(_S("65|148|166|173|173|170|175|168|97|162|181|123|97") .. shopData.Name)

    _v8dr8vc6i13(part.Position)
    task.wait(0.1)

    if HasFireClick then
        local clickDetector = shop:FindFirstChildOfClass(_S("116|183|224|221|215|223|184|217|232|217|215|232|227|230")) or part:FindFirstChildOfClass(_S("124|191|232|229|223|231|192|225|240|225|223|240|235|238"))
        if clickDetector then Exec.FireClick(clickDetector) end
    end

    if HasFireProximity then
        local prompt = shop:FindFirstChildOfClass(_S("130|210|244|241|250|235|239|235|246|251|210|244|241|239|242|246")) or part:FindFirstChildOfClass(_S("70|150|184|181|190|175|179|175|186|191|150|184|181|179|182|186"))
        if prompt then Exec.FireProximity(prompt) end
    end

    if HasFireTouch then
        Exec.FireTouch(_vs1tasghk8v, part, 0)
        task.wait(0.01)
        Exec.FireTouch(_vs1tasghk8v, part, 1)
    end

    _vv8iciwgl48(_S("67|182|168|175|175"))
    _vv8iciwgl48(_S("114|229|218|225|226"))
    _vv8iciwgl48(_S("121|230|218|235|228|222|237"))
    _vv8iciwgl48(_S("112|228|226|209|212|213"))
    _vv8iciwgl48(_S("124|223|221|239|228"))
    _vv8iciwgl48(_S("84|193|195|194|185|205"))
    _vv8iciwgl48(_S("94|209|195|202|202|191|202|202"))
    _vv8iciwgl48(_S("85|200|186|193|193|180|182|193|193"))

    State.SellCount = State.SellCount + 1

    return true
end

local function _vuzi1rglazv()
    if State.FarmConnection then return end
    _vke6snlfgah(_S("124|189|241|240|235|156|194|221|238|233|156|207|208|189|206|208|193|192"))

    State.FarmConnection = true
    task.spawn(function()
        while _v6sw8escnb8.AutoFarm and State.FarmConnection do
            if _vv3bejf2upo() then
                local rocks = _vvkj7mz5kfi()
                if #rocks > 0 then
                    local _vgz3vpl9vnp = rocks[1]
                    State.CurrentTarget = _vgz3vpl9vnp.Name
                    _vc594g6v3oz(_vgz3vpl9vnp)
                else
                    State.CurrentTarget = _S("106|189|207|203|220|205|210|211|216|209|152|152|152")
                end
            end
            task.wait(_v6sw8escnb8.FarmDelay)
        end
    end)
end

local function _vfd9vsjy6dq()
    State.FarmConnection = nil
    State.CurrentTarget = _S("65|143|176|175|166")
    _vke6snlfgah(_S("90|155|207|206|201|122|160|187|204|199|122|173|174|169|170|170|159|158"))
end

local function _vbgmozo1ahz()
    if State.SellConnection then return end
    _vke6snlfgah(_S("112|177|229|228|223|144|195|213|220|220|144|195|196|177|194|196|181|180"))

    State.SellConnection = true
    task.spawn(function()
        while _v6sw8escnb8.AutoSell and State.SellConnection do
            if _vv3bejf2upo() then
                local _vbt8w617878 = true
                if _v6sw8escnb8.SellWhenFull and not _vw57os9bi4h() then _vbt8w617878 = false end
                if _v6sw8escnb8.SellMinCash > 0 and _vmay3n2rhhp() < _v6sw8escnb8.SellMinCash then _vbt8w617878 = false end
                if _vbt8w617878 then
                    local shops = _vkgv156tecx()
                    if #shops > 0 then
                        _vyoan4flcrh(shops[1])
                        pcall(_vjri73hvhgu)
                    end
                end
            end
            task.wait(_v6sw8escnb8.SellDelay)
        end
    end)
end

local function _vuq97ifew3y()
    State.SellConnection = nil
    _vke6snlfgah(_S("68|133|185|184|179|100|151|169|176|176|100|151|152|147|148|148|137|136"))
end

local function _vlan4nqf1gk()
    if State.UpgradeConn then return end
    _vke6snlfgah(_S("92|157|209|208|203|124|177|204|195|206|189|192|193|124|175|176|157|174|176|161|160"))

    State.UpgradeConn = true
    task.spawn(function()
        while _v6sw8escnb8.AutoUpgrade and State.UpgradeConn do
            _vv8iciwgl48(_S("113|230|225|216|227|210|213|214"))
            _vv8iciwgl48(_S("73|171|190|194"))
            _vv8iciwgl48(_S("95|207|212|209|194|199|192|210|196"))
            _vv8iciwgl48(_S("79|198|176|193|188|195|183"))
            _vv8iciwgl48(_S("106|218|211|205|213|203|226|207"))
            _vv8iciwgl48(_S("119|217|216|218|226|231|216|218|226"))
            _vv8iciwgl48(_S("63|178|175|164|164|163"))
            _vv8iciwgl48(_S("66|166|171|169"))

            State.UpgradeCount = State.UpgradeCount + 1
            task.wait(1)
        end
    end)
end

local function _vffsy0igmzp()
    State.UpgradeConn = nil
    _vke6snlfgah(_S("96|161|213|212|207|128|181|208|199|210|193|196|197|128|179|180|175|176|176|165|164"))
end

local function _vg9tithre7l()
    for _, _v3n6uxy5v1w in ipairs(State.ESPHighlights) do
        pcall(function() _v3n6uxy5v1w:Destroy() end)
    end
    State.ESPHighlights = {}
end

local function _v6wzkp945uc()
    _vg9tithre7l()

    local rocks = _vvkj7mz5kfi()
    for _, rock in ipairs(rocks) do
        if rock.Instance and rock.Instance.Parent then

            local _v3n6uxy5v1w = Instance.new(_S("127|199|232|230|231|235|232|230|231|243"))
            _v3n6uxy5v1w.Name = _S("101|170|184|181|196") .. rock.Name
            _v3n6uxy5v1w.FillTransparency = 0.6
            _v3n6uxy5v1w.OutlineTransparency = 0
            _v3n6uxy5v1w.OutlineColor = rock.Value > 0 and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(100, 200, 255)
            _v3n6uxy5v1w.FillColor = rock.Value > 0 and Color3.fromRGB(255, 200, 50) or Color3.fromRGB(80, 150, 255)
            _v3n6uxy5v1w.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            _v3n6uxy5v1w.Parent = rock.Instance

            local _vihnx4nvn6t = Instance.new(_S("93|159|198|201|201|191|204|190|207|193|164|210|198"))
            _vihnx4nvn6t.Name = _S("125|194|208|205|201|222|223|226|233")
            _vihnx4nvn6t.Size = UDim2.new(0, 120, 0, 30)
            _vihnx4nvn6t.StudsOffset = Vector3.new(0, 3, 0)
            _vihnx4nvn6t.AlwaysOnTop = true
            _vihnx4nvn6t.Parent = rock.Part

            local label = Instance.new(_S("85|169|186|205|201|161|182|183|186|193"))
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 0.4
            label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            label.Text = rock.Name .. _S("112|144|203") .. math.floor(rock.Distance) .. _S("124|233|217") .. (rock.Value > 0 and (_S("119|151|243|151|155") .. tostring(rock.Value)) or _S("114|"))
            label.TextColor3 = rock.Value > 0 and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(100, 200, 255)
            label.Font = Enum.Font.GothamBold
            label.TextSize = 11
            label.Parent = _vihnx4nvn6t

            local _vq3458w1ts3 = Instance.new(_S("111|196|184|178|222|225|221|212|225"))
            _vq3458w1ts3.CornerRadius = UDim.new(0, 4)
            _vq3458w1ts3.Parent = label

            table.insert(State.ESPHighlights, _v3n6uxy5v1w)
            table.insert(State.ESPHighlights, _vihnx4nvn6t)
        end
    end

    local shops = _vkgv156tecx()
    for _, shop in ipairs(shops) do
        if shop.Instance and shop.Instance.Parent then
            local _v3n6uxy5v1w = Instance.new(_S("78|150|183|181|182|186|183|181|182|194"))
            _v3n6uxy5v1w.Name = _S("85|154|168|165|180|168|189|196|197|180") .. shop.Name
            _v3n6uxy5v1w.FillTransparency = 0.5
            _v3n6uxy5v1w.OutlineTransparency = 0
            _v3n6uxy5v1w.OutlineColor = Color3.fromRGB(0, 255, 100)
            _v3n6uxy5v1w.FillColor = Color3.fromRGB(50, 255, 100)
            _v3n6uxy5v1w.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            _v3n6uxy5v1w.Parent = shop.Instance

            local _vihnx4nvn6t = Instance.new(_S("104|170|209|212|212|202|215|201|218|204|175|221|209"))
            _vihnx4nvn6t.Name = _S("126|195|209|206|209|230|237|238|202|223|224|227|234")
            _vihnx4nvn6t.Size = UDim2.new(0, 100, 0, 25)
            _vihnx4nvn6t.StudsOffset = Vector3.new(0, 3, 0)
            _vihnx4nvn6t.AlwaysOnTop = true
            _vihnx4nvn6t.Parent = shop.Part

            local label = Instance.new(_S("72|156|173|192|188|148|169|170|173|180"))
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 0.4
            label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            label.Text = _S("80|163|152|159|160|138|112") .. shop.Name
            label.TextColor3 = Color3.fromRGB(0, 255, 100)
            label.Font = Enum.Font.GothamBold
            label.TextSize = 10
            label.Parent = _vihnx4nvn6t

            table.insert(State.ESPHighlights, _v3n6uxy5v1w)
            table.insert(State.ESPHighlights, _vihnx4nvn6t)
        end
    end

    _vke6snlfgah(_S("76|145|159|156|134|108") .. #rocks .. _S("94|126|208|205|193|201|209|138|126") .. #shops .. _S("106|138|221|210|217|218|221"))
end

local function _vgj21848tpp()
    if _v6sw8escnb8.ESPEnabled then
        _v6wzkp945uc()

        task.spawn(function()
            while _v6sw8escnb8.ESPEnabled do
                task.wait(5)
                if _v6sw8escnb8.ESPEnabled then
                    _v6wzkp945uc()
                end
            end
        end)
    end
end

local function _v38ajuvobj2()
    _vg9tithre7l()
end

local function _vxztgumrssa()
    if State.AntiDamageConn then return end
    _vke6snlfgah(_S("80|145|190|196|185|112|148|177|189|177|183|181|112|149|158|145|146|156|149|148"))

    State.AntiDamageConn = _vyq77pn2i13.Heartbeat:Connect(function()
        if not _vv3bejf2upo() then return end

        if _vxx3bniaakb and _vxx3bniaakb.Health < _vxx3bniaakb.MaxHealth then
            _vxx3bniaakb.Health = _vxx3bniaakb.MaxHealth
        end

        if _v6sw8escnb8.AntiFreeze then
            pcall(function()

                local _vpn17b8zq38 = Character:FindFirstChild(_S("62|149|159|176|171|178|166")) or Character:FindFirstChild(_S("90|174|191|199|202|191|204|187|206|207|204|191")) or Character:FindFirstChild(_S("70|137|181|178|170"))
                if _vpn17b8zq38 and _vpn17b8zq38:IsA(_S("115|201|212|223|232|216|181|212|230|216")) then
                    _vpn17b8zq38.Value = 100
                end

                local _v80mshce7re = Character:FindFirstChild(_S("66|136|180|177|188|167|176")) or Character:FindFirstChild(_S("85|158|200|155|199|196|207|186|195")) or Character:FindFirstChild(_S("78|148|192|179|179|200|183|188|181"))
                if _v80mshce7re and _v80mshce7re:IsA(_S("116|182|227|227|224|202|213|224|233|217")) then
                    _v80mshce7re.Value = false
                end

                _vv8iciwgl48(_S("68|187|165|182|177|184|172"))
                _vv8iciwgl48(_S("75|192|185|177|189|176|176|197|176"))
                _vv8iciwgl48(_S("112|216|213|209|228"))
            end)
        end
    end)
end

local function _v88qf4v4bra()
    if State.AntiDamageConn then
        State.AntiDamageConn:Disconnect()
        State.AntiDamageConn = nil
    end
    _vke6snlfgah(_S("85|150|195|201|190|117|153|182|194|182|188|186|117|153|158|168|150|151|161|154|153"))
end

local function _vf5maiinbu8()
    if not _v6sw8escnb8.UnlimitedBackpack then return end
    _vke6snlfgah(_S("69|134|181|181|177|190|174|179|172|101|154|179|177|174|178|174|185|170|169|101|135|166|168|176|181|166|168|176|115|115|115"))

    pcall(function()

        local _vtr3ao558en = _v9q42f8ekfn:FindFirstChild(_S("120|186|217|219|227|232|217|219|227|187|217|232|217|219|225|236|241")) or _v9q42f8ekfn:FindFirstChild(_S("114|191|211|234|181|211|228|228|235")) or _v9q42f8ekfn:FindFirstChild(_S("130|197|227|244|244|251|205|201"))
        if _vtr3ao558en and _vtr3ao558en:IsA(_S("105|191|202|213|222|206|171|202|220|206")) then
            _vtr3ao558en.Value = 999999
        end

        local _vx01v3xl57x = _v9q42f8ekfn:FindFirstChild(_S("68|176|169|165|168|169|182|183|184|165|184|183"))
        if _vx01v3xl57x then
            for _, stat in ipairs(_vx01v3xl57x:GetChildren()) do
                local _vs6hkbeo0n2 = string.lower(stat.Name)
                if string.find(_vs6hkbeo0n2, _S("91|189|188|190|198|203|188|190|198")) or string.find(_vs6hkbeo0n2, _S("104|203|201|218|218|225")) or string.find(_vs6hkbeo0n2, _S("94|193|191|206|191|193|199|210|215")) or string.find(_vs6hkbeo0n2, _S("87|206|188|192|190|191|203")) or string.find(_vs6hkbeo0n2, _S("100|207|203")) then
                    if stat:IsA(_S("100|186|197|208|217|201|166|197|215|201")) then
                        stat.Value = 999999
                    end
                end
            end
        end

        _vv8iciwgl48(_S("111|209|208|210|218|223|208|210|218"))
        _vv8iciwgl48(_S("87|186|184|199|184|186|192|203|208"))
        _vv8iciwgl48(_S("130|229|227|244|244|251"))
        _vv8iciwgl48(_S("111|228|223|214|225|208|211|212|206|209|208|210|218|223|208|210|218"))
    end)

    task.spawn(function()
        while _v6sw8escnb8.UnlimitedBackpack do
            task.wait(2)
            pcall(function()
                local _vx01v3xl57x = _v9q42f8ekfn:FindFirstChild(_S("75|183|176|172|175|176|189|190|191|172|191|190"))
                if _vx01v3xl57x then
                    for _, stat in ipairs(_vx01v3xl57x:GetChildren()) do
                        local _vs6hkbeo0n2 = string.lower(stat.Name)
                        if string.find(_vs6hkbeo0n2, _S("112|210|209|211|219|224|209|211|219")) or string.find(_vs6hkbeo0n2, _S("78|177|175|192|192|199")) or string.find(_vs6hkbeo0n2, _S("126|225|223|238|223|225|231|242|247")) or string.find(_vs6hkbeo0n2, _S("91|210|192|196|194|195|207")) or string.find(_vs6hkbeo0n2, _S("88|195|191")) then
                            if stat:IsA(_S("115|201|212|223|232|216|181|212|230|216")) then
                                stat.Value = 999999
                            end
                        end
                    end
                end
            end)
        end
    end)
end

local function _vctsieush67()
    if not _v6sw8escnb8.UnlimitedLuck then return end
    _vke6snlfgah(_S("60|125|172|172|168|181|165|170|163|92|145|170|168|165|169|165|176|161|160|92|136|177|159|167|106|106|106"))

    pcall(function()

        local _v1rbw7bor9p = _v9q42f8ekfn:FindFirstChild(_S("123|199|240|222|230")) or _v9q42f8ekfn:FindFirstChild(_S("117|185|222|220|193|234|216|224")) or _v9q42f8ekfn:FindFirstChild(_S("87|164|192|197|192|197|190|163|204|186|194"))
        if _v1rbw7bor9p and _v1rbw7bor9p:IsA(_S("109|195|206|217|226|210|175|206|224|210")) then
            _v1rbw7bor9p.Value = 999999
        end

        local _vx01v3xl57x = _v9q42f8ekfn:FindFirstChild(_S("120|228|221|217|220|221|234|235|236|217|236|235"))
        if _vx01v3xl57x then
            for _, stat in ipairs(_vx01v3xl57x:GetChildren()) do
                local _vs6hkbeo0n2 = string.lower(stat.Name)
                if string.find(_vs6hkbeo0n2, _S("68|176|185|167|175")) then
                    if stat:IsA(_S("60|146|157|168|177|161|126|157|175|161")) then
                        stat.Value = 999999
                    end
                end
            end
        end

        _vv8iciwgl48(_S("112|220|229|211|219"))
        _vv8iciwgl48(_S("74|182|191|173|181|195"))
        _vv8iciwgl48(_S("60|160|165|163|155|168|177|159|167"))
    end)

    task.spawn(function()
        while _v6sw8escnb8.UnlimitedLuck do
            task.wait(2)
            pcall(function()
                local _vx01v3xl57x = _v9q42f8ekfn:FindFirstChild(_S("126|234|227|223|226|227|240|241|242|223|242|241"))
                if _vx01v3xl57x then
                    for _, stat in ipairs(_vx01v3xl57x:GetChildren()) do
                        if string.find(string.lower(stat.Name), _S("114|222|231|213|221")) and stat:IsA(_S("84|170|181|192|201|185|150|181|199|185")) then
                            stat.Value = 999999
                        end
                    end
                end
            end)
        end
    end)
end

local function _va98mjfm1t4(amount)
    _vke6snlfgah(_S("112|177|228|228|213|221|224|228|217|222|215|144|228|223|144|212|229|224|213|144") .. amount .. _S("79|111|184|195|180|188|194|125|125|125"))

    pcall(function()

        for i = 1, amount do
            _vv8iciwgl48(_S("90|189|201|198|198|191|189|206"))
            _vv8iciwgl48(_S("86|195|191|196|187"))
            _vv8iciwgl48(_S("69|173|166|183|187|170|184|185"))
            _vv8iciwgl48(_S("123|235|228|222|230|240|235"))
            _vv8iciwgl48(_S("127|230|224|243|231|228|241"))
            _vv8iciwgl48(_S("102|210|213|213|218"))
            _vv8iciwgl48(_S("74|185|172|190|171|179|184"))
            _vv8iciwgl48(_S("108|211|222|205|218|224"))
            _vv8iciwgl48(_S("107|221|208|226|204|221|207"))
            task.wait(0.05)
        end

        local _vx01v3xl57x = _v9q42f8ekfn:FindFirstChild(_S("118|226|219|215|218|219|232|233|234|215|234|233"))
        if _vx01v3xl57x then
            for _, stat in ipairs(_vx01v3xl57x:GetChildren()) do
                local _vs6hkbeo0n2 = string.lower(stat.Name)
                if string.find(_vs6hkbeo0n2, _S("129|228|243|250|244|245|226|237")) or string.find(_vs6hkbeo0n2, _S("97|208|211|198")) or string.find(_vs6hkbeo0n2, _S("73|176|174|182")) or string.find(_vs6hkbeo0n2, _S("95|200|211|196|204")) then
                    if stat:IsA(_S("121|199|238|230|219|222|235|207|218|229|238|222")) or stat:IsA(_S("84|157|194|200|170|181|192|201|185")) then
                        stat.Value = stat.Value * amount
                    end
                end
            end
        end

        for i = 1, amount do
            _vv8iciwgl48(_S("116|231|217|224|224"))
            task.wait(0.02)
            _vv8iciwgl48(_S("117|215|234|238"))
            task.wait(0.02)
        end

        local rocks = _vvkj7mz5kfi()
        if #rocks > 0 then
            local _veba8hquni7 = rocks[1]
            for i = 1, amount do
                for _, remote in ipairs(State.RemoteCache) do
                    local rName = string.lower(remote.Name)
                    if string.find(rName, _S("130|229|241|238|238|231|229|246")) or string.find(rName, _S("124|236|229|223|231|241|236")) or string.find(rName, _S("94|202|205|205|210")) then
                        pcall(function()
                            if remote.Type == _S("104|186|205|213|215|220|205|173|222|205|214|220") then
                                remote.Instance:FireServer(_veba8hquni7.Instance, _veba8hquni7.Part)
                            end
                        end)
                    end
                end
                task.wait(0.05)
            end
        end
    end)

    State.DupeCount = State.DupeCount + amount
    _vke6snlfgah(_S("94|162|211|206|195|126|191|210|210|195|203|206|210|126|193|205|203|206|202|195|210|195|152|126") .. amount .. _S("126|246"))
end

local function _vh23oykjfce()
    if State.NoclipConn then return end
    _vke6snlfgah(_S("70|148|181|169|178|175|182|102|139|148|135|136|146|139|138"))

    State.NoclipConn = _vyq77pn2i13.Stepped:Connect(function()
        if not _v6sw8escnb8.Noclip then return end
        if not _vv3bejf2upo() then return end
        for _, part in ipairs(Character:GetDescendants()) do
            if part:IsA(_S("68|134|165|183|169|148|165|182|184")) then
                part.CanCollide = false
            end
        end
    end)
end

local function _vm7ug8ajp1o()
    if State.NoclipConn then
        State.NoclipConn:Disconnect()
        State.NoclipConn = nil
    end
    _vke6snlfgah(_S("85|163|196|184|193|190|197|117|153|158|168|150|151|161|154|153"))
end

local _vgab7cophya = nil
local _vtwzew5o5m3 = nil

local function _vpwcd8goxkp()
    if State.FlyConn then return end
    if not _vv3bejf2upo() then return end
    _vke6snlfgah(_S("93|163|201|214|125|162|171|158|159|169|162|161"))

    _vgab7cophya = Instance.new(_S("126|192|237|226|247|212|227|234|237|225|231|242|247"))
    _vgab7cophya.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    _vgab7cophya.Velocity = Vector3.new(0, 0, 0)
    _vgab7cophya.Parent = _vs1tasghk8v

    _vtwzew5o5m3 = Instance.new(_S("81|147|192|181|202|152|202|195|192"))
    _vtwzew5o5m3.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    _vtwzew5o5m3.P = 9e4
    _vtwzew5o5m3.Parent = _vs1tasghk8v

    State.FlyConn = _vyq77pn2i13.RenderStepped:Connect(function()
        if not _v6sw8escnb8.FlyEnabled then return end
        if not _vv3bejf2upo() then return end

        local cam = _v4au113ebz2.CurrentCamera
        local _vmzicsx832b = Vector3.new(0, 0, 0)

        if _vlokuaz0syl:IsKeyDown(Enum.KeyCode.W) then
            _vmzicsx832b = _vmzicsx832b + cam.CFrame.LookVector
        end
        if _vlokuaz0syl:IsKeyDown(Enum.KeyCode.S) then
            _vmzicsx832b = _vmzicsx832b - cam.CFrame.LookVector
        end
        if _vlokuaz0syl:IsKeyDown(Enum.KeyCode.A) then
            _vmzicsx832b = _vmzicsx832b - cam.CFrame.RightVector
        end
        if _vlokuaz0syl:IsKeyDown(Enum.KeyCode.D) then
            _vmzicsx832b = _vmzicsx832b + cam.CFrame.RightVector
        end
        if _vlokuaz0syl:IsKeyDown(Enum.KeyCode.Space) then
            _vmzicsx832b = _vmzicsx832b + Vector3.new(0, 1, 0)
        end
        if _vlokuaz0syl:IsKeyDown(Enum.KeyCode.LeftShift) then
            _vmzicsx832b = _vmzicsx832b - Vector3.new(0, 1, 0)
        end

        if _vmzicsx832b.Magnitude > 0 then
            _vmzicsx832b = _vmzicsx832b.Unit * _v6sw8escnb8.FlySpeed
        end

        _vgab7cophya.Velocity = _vmzicsx832b
        _vtwzew5o5m3.CFrame = cam.CFrame
    end)
end

local function _vtsizpq0fzh()
    if State.FlyConn then
        State.FlyConn:Disconnect()
        State.FlyConn = nil
    end
    if _vgab7cophya then _vgab7cophya:Destroy() _vgab7cophya = nil end
    if _vtwzew5o5m3 then _vtwzew5o5m3:Destroy() _vtwzew5o5m3 = nil end
    _vke6snlfgah(_S("123|193|231|244|155|191|196|206|188|189|199|192|191"))
end

local function _vrfkp7amk9k()
    if not _vv3bejf2upo() then return end
    if _v6sw8escnb8.SpeedBoost then
        _vxx3bniaakb.WalkSpeed = _v6sw8escnb8.WalkSpeed
    else
        _vxx3bniaakb.WalkSpeed = 16
    end
end

local function _v1rxecgi1m8()
    _v6sw8escnb8.AutoFarm = false
    _v6sw8escnb8.AutoSell = false
    _v6sw8escnb8.AutoUpgrade = false
    _v6sw8escnb8.SmartLoop = false
    _v6sw8escnb8.ESPEnabled = false
    _v6sw8escnb8.FlyEnabled = false
    _v6sw8escnb8.Noclip = false
    _v6sw8escnb8.RapidMine = false
    _v6sw8escnb8.RemoteSpy = false
    _vfd9vsjy6dq()
    _vuq97ifew3y()
    _vffsy0igmzp()
    State.SmartLoopConn = nil
    _vtsizpq0fzh()
    _vm7ug8ajp1o()
    _v38ajuvobj2()
    _vojug3ef0vt()
    _vitpv1dj25h()
    _vhrk3y03yqx()
    if State.InfiniteJumpConn then State.InfiniteJumpConn:Disconnect() State.InfiniteJumpConn = nil end
    if State.ClickTPConn then State.ClickTPConn:Disconnect() State.ClickTPConn = nil end
    if State.WarmthKeeperConn then State.WarmthKeeperConn:Disconnect() State.WarmthKeeperConn = nil end
    if State.DropCollectConn then State.DropCollectConn = nil end
    _vke6snlfgah(_S("83|163|148|161|156|150|141|115|148|191|191|115|185|184|180|199|200|197|184|198|115|198|199|194|195|195|184|183"))
end

local function _vfxmh0gf14j()
    if State.SmartLoopConn then return end
    _vke6snlfgah(_S("79|162|188|176|193|195|111|155|190|190|191|111|162|163|144|161|163|148|147|111|119|149|176|193|188|111|8673|111|162|180|187|187|111|8673|111|164|191|182|193|176|179|180|120"))
    State.SmartLoopConn = true
    task.spawn(function()
        while _v6sw8escnb8.SmartLoop and State.SmartLoopConn do
            if _vv3bejf2upo() then
                _vw9kfb4vwri()
                _vdr4qws4uos(_v4au113ebz2)
                if _vnz1zdojgtk() then
                    local shops = _vkgv156tecx()
                    if #shops > 0 then
                        State.CurrentTarget = _S("68|151|169|176|176|173|178|171|114|114|114")
                        _vyoan4flcrh(shops[1])
                        pcall(_vjri73hvhgu)
                        _vazsqq0p00b()
                        _vlt70fb0sca()
                    end
                else
                    local rocks = _vvkj7mz5kfi()
                    if #rocks > 0 then
                        State.CurrentTarget = rocks[1].Name
                        _vc594g6v3oz(rocks[1])
                    else
                        State.CurrentTarget = _S("71|154|172|168|185|170|175|176|181|174|117|117|117")
                        _vu0se5lz0nb()
                    end
                end
                _v3lmil1tf08()
            end
            task.wait(_v6sw8escnb8.FarmDelay)
        end
    end)
end

local function _vz2b4tz2i8v()
    State.SmartLoopConn = nil
    _vke6snlfgah(_S("126|209|235|223|240|242|158|202|237|237|238|158|209|210|205|206|206|195|194"))
end

local function _va74ygp8u7b(arg)
    local t = typeof(arg)
    if t == _S("95|168|205|210|211|192|205|194|196") then return arg:GetFullName()
    elseif t == _S("130|216|231|229|246|241|244|181") then return string.format(_S("93|179|194|192|209|204|207|144|133|130|139|142|195|137|130|139|142|195|137|130|139|142|195|134"), arg.X, arg.Y, arg.Z)
    elseif t == _S("101|168|171|215|198|210|202") then return _S("83|150|153|197|180|192|184")
    elseif t == _S("112|228|209|210|220|213") then return _S("107|223|204|205|215|208")
    else return tostring(arg) end
end

local function _vxtvfay6gw3(remoteName, remoteType, args)
    local _vvhbh2un3rt = _S("130|")
    for i, a in ipairs(args) do
        _vvhbh2un3rt = _vvhbh2un3rt .. (i > 1 and _S("102|146|134") or _S("119|")) .. _va74ygp8u7b(a)
    end
    local entry = os.date(_S("128|165|200|186|165|205|186|165|211")) .. _S("117|149|241|149") .. remoteType .. _S("71|103|195|103") .. remoteName .. _S("108|148") .. _vvhbh2un3rt .. _S("68|109")
    table.insert(State.RemoteSpyLogs, 1, entry)
    if #State.RemoteSpyLogs > 40 then table.remove(State.RemoteSpyLogs) end
    State.LastRemoteFire = entry
    if RemoteSpyList then
        pcall(function()
            _vli1jii61e7(RemoteSpyList)
            for i, log in ipairs(State.RemoteSpyLogs) do
                if i > 20 then break end
                local lbl = Instance.new(_S("109|193|210|229|225|185|206|207|210|217"))
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

local function _vo9rkwly7oi()
    if not Exec.HasHookMeta then
        _vke6snlfgah(_S("117|199|218|226|228|233|218|149|200|229|238|149|234|227|214|235|214|222|225|214|215|225|218|149|228|227|149|233|221|222|232|149|218|237|218|216|234|233|228|231"))
        return
    end
    _vinwaiwzonf = true
    _vke6snlfgah(_S("85|167|186|194|196|201|186|117|168|197|206|117|154|163|150|151|161|154|153"))
end

local function _vx7y8h74a5n()
    _vinwaiwzonf = false
    _v6sw8escnb8.RemoteSpy = false
    _vke6snlfgah(_S("70|152|171|179|181|186|171|102|153|182|191|102|138|143|153|135|136|146|139|138"))
end

local function _vhes57e8vkt()
    if _v6sw8escnb8.CustomRemoteName == _S("70|") then
        _vke6snlfgah(_S("61|130|171|177|162|175|93|158|93|175|162|170|172|177|162|93|171|158|170|162|93|163|166|175|176|177"))
        return
    end
    local args = {}
    if _v6sw8escnb8.CustomRemoteArgs ~= _S("62|") then
        for part in string.gmatch(_v6sw8escnb8.CustomRemoteArgs, _S("83|174|177|127|176|126")) do
            part = string.gsub(part, _S("66|160|103|181|108|106|112|111|107|103|181|108|102"), _S("62|99|111"))
            local num = tonumber(part)
            if num then
                table.insert(args, num)
            elseif part == _S("113|229|227|230|214") then
                table.insert(args, true)
            elseif part == _S("103|205|200|211|218|204") then
                table.insert(args, false)
            else
                table.insert(args, part)
            end
        end
    end
    if _vzebbox61ma(_v6sw8escnb8.CustomRemoteName, Exec.Unpack(args)) then
        _vke6snlfgah(_S("106|176|211|220|207|206|138|207|226|203|205|222|164|138") .. _v6sw8escnb8.CustomRemoteName)
    else
        _vv8iciwgl48(_v6sw8escnb8.CustomRemoteName, Exec.Unpack(args))
        _vke6snlfgah(_S("78|148|183|192|179|178|110|190|175|194|194|179|192|188|136|110") .. _v6sw8escnb8.CustomRemoteName)
    end
end

local function _vabborehzic()
    if State.InfiniteJumpConn then return end
    State.InfiniteJumpConn = _vlokuaz0syl.JumpRequest:Connect(function()
        if _v6sw8escnb8.InfiniteJump and _vv3bejf2upo() and _vxx3bniaakb then
            _vxx3bniaakb:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
    _vke6snlfgah(_S("110|183|220|212|215|220|215|226|211|142|184|227|219|222|142|179|188|175|176|186|179|178"))
end

local function _v5h8twcc98l()
    if State.InfiniteJumpConn then
        State.InfiniteJumpConn:Disconnect()
        State.InfiniteJumpConn = nil
    end
end

local function _vestfrmfpc5()
    if State.ClickTPConn then return end
    State.ClickTPConn = _vlokuaz0syl.InputBegan:Connect(function(input, processed)
        if processed or not _v6sw8escnb8.ClickTeleport then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1 and _vlokuaz0syl:IsKeyDown(Enum.KeyCode.LeftControl) then
            local cam = _v4au113ebz2.CurrentCamera
            if not cam then return end
            local ray = cam:ScreenPointToRay(input.Position.X, input.Position.Y)
            local _vhz5lzsufck = RaycastParams.new()
            if Character then _vhz5lzsufck.FilterDescendantsInstances = {Character} end
            local _vwpnedpbiv2 = pcall(function()
                _vhz5lzsufck.FilterType = Enum.RaycastFilterType.Exclude
            end)
            if not _vwpnedpbiv2 then
                _vhz5lzsufck.FilterType = Enum.RaycastFilterType.Blacklist
            end
            local hit = _v4au113ebz2:Raycast(ray.Origin, ray.Direction * 2000, _vhz5lzsufck)
            if hit then
                _v8dr8vc6i13(hit.Position)
                _vke6snlfgah(_S("84|151|192|189|183|191|116|168|164|116|8678|116") .. math.floor(hit.Position.X) .. _S("126|170") .. math.floor(hit.Position.Y))
            end
        end
    end)
    _vke6snlfgah(_S("102|169|210|207|201|209|134|186|182|134|171|180|167|168|178|171|170|134|142|169|218|216|210|145|169|210|207|201|209|143"))
end

local function _vhbcvy8y7hc()
    if State.ClickTPConn then
        State.ClickTPConn:Disconnect()
        State.ClickTPConn = nil
    end
end

local function _vxitmwvevj0(name)
    if not _vv3bejf2upo() then return end
    State.Waypoints[name] = _vs1tasghk8v.Position
    _vke6snlfgah(_S("126|209|223|244|227|226|158|245|223|247|238|237|231|236|242|184|158") .. name)
end

local function _vomq738oyz1(name)
    local pos = State.Waypoints[name]
    if pos then
        _v8dr8vc6i13(pos)
        _vke6snlfgah(_S("89|173|169|121|208|186|210|201|200|194|199|205|147|121") .. name)
    else
        _vke6snlfgah(_S("94|181|191|215|206|205|199|204|210|126|204|205|210|126|196|205|211|204|194|152|126") .. name)
    end
end

local function _vh5zi6xqdjt()
    if State.AntiAFKConn then return end
    local vu = game:GetService(_S("72|158|177|186|188|189|169|180|157|187|173|186"))
    State.AntiAFKConn = _v9q42f8ekfn.Idled:Connect(function()
        if _v6sw8escnb8.AntiAFK then
            pcall(function() vu:CaptureController(); vu:ClickButton2(Vector2.new(0, 0)) end)
        end
    end)
    _vke6snlfgah(_S("97|162|207|213|202|142|162|167|172|129|166|175|162|163|173|166|165"))
end

local function _vivikqob5mk()
    if State.AntiAFKConn then
        State.AntiAFKConn:Disconnect()
        State.AntiAFKConn = nil
    end
end

local function _v2bipzjm8pv()
    if State.WarmthKeeperConn then return end
    State.WarmthKeeperConn = _vyq77pn2i13.Heartbeat:Connect(function()
        if not _v6sw8escnb8.WarmthKeeper and not _v6sw8escnb8.StaminaKeeper then return end
        if not _vv3bejf2upo() then return end
        pcall(function()
            if _v6sw8escnb8.WarmthKeeper then
                for _, name in ipairs({_S("97|184|194|211|206|213|201"), _S("84|168|185|193|196|185|198|181|200|201|198|185"), _S("122|189|233|230|222"), _S("74|146|175|171|190"), _S("72|159|169|186|181")}) do
                    local v = Character:FindFirstChild(name) or _v9q42f8ekfn:FindFirstChild(name)
                    if v and v:IsA(_S("65|151|162|173|182|166|131|162|180|166")) then v.Value = 100 end
                end
                _vv8iciwgl48(_S("70|189|167|184|179|186|174")); _vv8iciwgl48(_S("103|207|204|200|219")); _vv8iciwgl48(_S("128|227|225|237|240|230|233|242|229"))
            end
            if _v6sw8escnb8.StaminaKeeper then
                for _, name in ipairs({_S("105|188|221|202|214|210|215|202"), _S("72|141|182|173|186|175|193"), _S("124|191|232|229|233|222"), _S("73|152|193|194|176|174|183"), _S("122|188|236|223|219|238|226")}) do
                    local v = Character:FindFirstChild(name) or _v9q42f8ekfn:FindFirstChild(name)
                    if v and v:IsA(_S("126|212|223|234|243|227|192|223|241|227")) then v.Value = 100 end
                end
            end
        end)
    end)
    _vke6snlfgah(_S("70|157|167|184|179|186|174|117|153|186|167|179|175|180|167|102|145|171|171|182|171|184|102|139|148|135|136|146|139|138"))
end

local function _vtx890mj3yn()
    if State.WarmthKeeperConn then
        State.WarmthKeeperConn:Disconnect()
        State.WarmthKeeperConn = nil
    end
end

local function _vojug3ef0vt()
    for _, obj in ipairs(State.TracerObjects) do
        pcall(function() obj:Destroy() end)
    end
    State.TracerObjects = {}
end

local function _vpoz5mqsik7()
    if not _v6sw8escnb8.Tracers then _vojug3ef0vt() return end
    if not _vv3bejf2upo() then return end
    _vojug3ef0vt()
    local _vhz19hvr2a1 = {}
    for _, r in ipairs(_vvkj7mz5kfi()) do
        if #_vhz19hvr2a1 >= 8 then break end
        table.insert(_vhz19hvr2a1, {Part = r.Part, Color = Color3.fromRGB(100, 200, 255)})
    end
    for _, s in ipairs(_vkgv156tecx()) do
        if #_vhz19hvr2a1 >= 10 then break end
        table.insert(_vhz19hvr2a1, {Part = s.Part, Color = Color3.fromRGB(0, 255, 100)})
    end
    for _, t in ipairs(_vhz19hvr2a1) do
        local att0 = Instance.new(_S("65|130|181|181|162|164|169|174|166|175|181"))
        att0.Parent = _vs1tasghk8v
        local att1 = Instance.new(_S("115|180|231|231|212|214|219|224|216|225|231"))
        att1.Parent = t.Part
        local beam = Instance.new(_S("122|188|223|219|231"))
        beam.Attachment0 = att0
        beam.Attachment1 = att1
        beam.Color = ColorSequence.new(t.Color)
        beam.Width0 = 0.15
        beam.Width1 = 0.15
        beam.FaceCamera = true
        beam.Parent = _vs1tasghk8v
        table.insert(State.TracerObjects, att0)
        table.insert(State.TracerObjects, att1)
        table.insert(State.TracerObjects, beam)
    end
end

local function _vitpv1dj25h()
    for _, obj in ipairs(State.PlayerESPObjects) do
        pcall(function() obj:Destroy() end)
    end
    State.PlayerESPObjects = {}
end

local function _v3gp7hvkeu3()
    if not _v6sw8escnb8.PlayerESP then _vitpv1dj25h() return end
    _vitpv1dj25h()
    for _, plr in ipairs(_ver979nfack:GetPlayers()) do
        if plr ~= _v9q42f8ekfn and plr.Character then
            local hrp = plr.Character:FindFirstChild(_S("98|170|215|207|195|208|209|203|198|180|209|209|214|178|195|212|214"))
            if hrp then
                local hl = Instance.new(_S("92|164|197|195|196|200|197|195|196|208"))
                hl.FillTransparency = 0.7
                hl.OutlineColor = Color3.fromRGB(255, 80, 80)
                hl.FillColor = Color3.fromRGB(255, 50, 50)
                hl.Parent = plr.Character
                local bb = Instance.new(_S("104|170|209|212|212|202|215|201|218|204|175|221|209"))
                bb.Size = UDim2.new(0, 100, 0, 24)
                bb.StudsOffset = Vector3.new(0, 3, 0)
                bb.AlwaysOnTop = true
                bb.Parent = hrp
                local lbl = Instance.new(_S("113|197|214|233|229|189|210|211|214|221"))
                lbl.Size = UDim2.new(1, 0, 1, 0)
                lbl.BackgroundTransparency = 0.5
                lbl.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                lbl.Text = plr.Name .. _S("62|94|153") .. math.floor(_vurfwcailwp(hrp)) .. _S("101|210|194")
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

local function _vhrk3y03yqx()
    for _, obj in ipairs(State.ChestESPObjects) do
        pcall(function() obj:Destroy() end)
    end
    State.ChestESPObjects = {}
end

local function _vt7f1e9gp7q()
    if not _v6sw8escnb8.ChestESP then _vhrk3y03yqx() return end
    _vhrk3y03yqx()
    local _v8f79y92mmj = {_S("91|190|195|192|206|207"), _S("90|189|204|187|206|191"), _S("118|219|236|219|228|234"), _S("92|195|197|194|208"), _S("97|209|211|198|212|198|207|213"), _S("95|211|209|196|192|210|212|209|196"), _S("97|211|198|216|194|211|197")}
    for _, d in ipairs(_v4au113ebz2:GetDescendants()) do
        if d:IsA(_S("101|178|212|201|202|209")) or d:IsA(_S("79|145|176|194|180|159|176|193|195")) then
            local nl = string.lower(d.Name)
            for _, p in ipairs(_v8f79y92mmj) do
                if string.find(nl, p) then
                    local part = d:IsA(_S("74|140|171|189|175|154|171|188|190")) and d or d:FindFirstChildWhichIsA(_S("74|140|171|189|175|154|171|188|190"))
                    if part then
                        local hl = Instance.new(_S("71|143|176|174|175|179|176|174|175|187"))
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

local function _vnda051adsq()
    if State.FullbrightApplied then return end
    State.SavedLighting = {
        Brightness = _v4eu5y7x4em.Brightness,
        ClockTime = _v4eu5y7x4em.ClockTime,
        FogEnd = _v4eu5y7x4em.FogEnd,
        GlobalShadows = _v4eu5y7x4em.GlobalShadows,
        Ambient = _v4eu5y7x4em.Ambient,
        OutdoorAmbient = _v4eu5y7x4em.OutdoorAmbient,
    }
    _v4eu5y7x4em.Brightness = 2
    _v4eu5y7x4em.ClockTime = 14
    _v4eu5y7x4em.FogEnd = 100000
    _v4eu5y7x4em.GlobalShadows = false
    _v4eu5y7x4em.Ambient = Color3.fromRGB(180, 180, 180)
    _v4eu5y7x4em.OutdoorAmbient = Color3.fromRGB(180, 180, 180)
    State.FullbrightApplied = true
    _vke6snlfgah(_S("123|193|240|231|231|221|237|228|226|227|239|155|202|201"))
end

local function _vm8z8ktb1d8()
    if not State.FullbrightApplied then return end
    for k, v in pairs(State.SavedLighting) do
        pcall(function() _v4eu5y7x4em[k] = v end)
    end
    State.FullbrightApplied = false
    _vke6snlfgah(_S("120|190|237|228|228|218|234|225|223|224|236|152|199|190|190"))
end

local function _vlx1pscxgrc()
    for _, plr in ipairs(_ver979nfack:GetPlayers()) do
        if plr ~= _v9q42f8ekfn and plr.Character then
            for _, p in ipairs(plr.Character:GetDescendants()) do
                if p:IsA(_S("72|138|169|187|173|152|169|186|188")) then p.LocalTransparencyModifier = _v6sw8escnb8.HideOtherPlayers and 1 or 0 end
            end
        end
    end
end

local function _vpphhvi3qqb()
    if not _v6sw8escnb8.FPSBooster then return end
    pcall(function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        for _, d in ipairs(_v4au113ebz2:GetDescendants()) do
            if d:IsA(_S("85|165|182|199|201|190|184|193|186|154|194|190|201|201|186|199")) or d:IsA(_S("70|154|184|167|175|178")) or d:IsA(_S("69|152|178|180|176|170")) or d:IsA(_S("109|179|214|223|210")) then
                d.Enabled = false
            end
        end
        _v4eu5y7x4em.GlobalShadows = false
    end)
    _vke6snlfgah(_S("79|149|159|162|111|145|190|190|194|195|180|193|111|176|191|191|187|184|180|179"))
end

local function _v9fa1xc9dbw()
    local t = {}
    for k, v in pairs(_v6sw8escnb8) do t[k] = v end
    return t
end

local function _v8ns5padqpt(t)
    if type(t) ~= _S("64|180|161|162|172|165") then return false end
    for k, v in pairs(t) do
        if _v6sw8escnb8[k] ~= nil then _v6sw8escnb8[k] = v end
    end
    return true
end

local function _vpamlislzxc()
    local ok, json = pcall(function() return HttpService:JSONEncode(_v9fa1xc9dbw()) end)
    if not ok then _vke6snlfgah(_S("103|170|214|213|205|208|206|135|218|200|221|204|135|205|200|208|211|204|203")) return end
    if Exec.WriteFile(_S("92|169|197|202|193|189|169|203|209|202|208|189|197|202|187|159|203|202|194|197|195|138|198|207|203|202"), json) then
        _vke6snlfgah(_S("74|141|185|184|176|179|177|106|189|171|192|175|174|106|190|185|106|176|179|182|175"))
    elseif Exec.HasClipboard then
        Exec.SetClipboard(json)
        _vke6snlfgah(_S("114|181|225|224|216|219|217|146|213|225|226|219|215|214|146|230|225|146|213|222|219|226|212|225|211|228|214"))
    else
        _vke6snlfgah(_S("66|149|163|184|167|98|183|176|163|184|163|171|174|163|164|174|167|98|106|176|177|98|185|180|171|182|167|168|171|174|167|113|165|174|171|178|164|177|163|180|166|107"))
    end
end

local function _v4xzwwjxl6g()
    local json = Exec.ReadFile(_S("109|186|214|219|210|206|186|220|226|219|225|206|214|219|204|176|220|219|211|214|212|155|215|224|220|219"))
    if json then
        local ok, data = pcall(function() return HttpService:JSONDecode(json) end)
        if ok and _v8ns5padqpt(data) then
            _vke6snlfgah(_S("111|178|222|221|213|216|214|143|219|222|208|211|212|211|143|213|225|222|220|143|213|216|219|212"))
            return true
        end
    end
    _vke6snlfgah(_S("68|146|179|100|183|165|186|169|168|100|167|179|178|170|173|171|100|170|179|185|178|168"))
    return false
end

local function _v6idno3rd7y()
    _vke6snlfgah(_S("103|186|204|217|221|204|217|135|207|214|215|215|208|213|206|149|149|149"))
    pcall(function()
        local body = Exec.HttpGet(_S("128|232|244|244|240|243|186|175|175|231|225|237|229|243|174|242|239|226|236|239|248|174|227|239|237|175|246|177|175|231|225|237|229|243|175") .. game.PlaceId .. _S("91|138|206|192|205|209|192|205|206|138|171|208|189|199|196|190|154|206|202|205|207|170|205|191|192|205|152|156|206|190|129|199|196|200|196|207|152|140|139|139"))
        if not body then error(_S("126|198|242|242|238|197|227|242|158|228|223|231|234|227|226")) end
        local _v4rmsvgaoeq = HttpService:JSONDecode(body)
        if _v4rmsvgaoeq and _v4rmsvgaoeq.data then
            for _, srv in ipairs(_v4rmsvgaoeq.data) do
                if srv.id ~= game.JobId and srv.playing < srv.maxPlayers then
                    _vx7a4i41ibp:TeleportToPlaceInstance(game.PlaceId, srv.id, _v9q42f8ekfn)
                    return
                end
            end
        end
        _vx7a4i41ibp:Teleport(game.PlaceId, _v9q42f8ekfn)
    end)
end

local function _vl1hz0cwg9l()
    if State.ServerHopConn then return end
    if _v6sw8escnb8.ServerHopInterval <= 0 then return end
    State.ServerHopConn = true
    task.spawn(function()
        while _v6sw8escnb8.ServerHopInterval > 0 and State.ServerHopConn do
            task.wait(_v6sw8escnb8.ServerHopInterval * 60)
            if _v6sw8escnb8.ServerHopInterval > 0 then _v6idno3rd7y() end
        end
    end)
end

local function _vi1hq7g0yo5()
    State.ServerHopConn = nil
end

local function _vbxesk88vl2()
    if State.DropCollectConn then return end
    State.DropCollectConn = true
    task.spawn(function()
        while _v6sw8escnb8.AutoCollectDrops and State.DropCollectConn do
            _vu0se5lz0nb()
            task.wait(1.5)
        end
    end)
end

local _vm62rfaum93 = {}
local _vawleg0o2j7 = false

local function _vh7yhgsjjgy(data)
    if not _v6sw8escnb8.WebhookEnabled or _v6sw8escnb8.WebhookURL == _S("128|") then return end
    pcall(function()
        local body = HttpService:JSONEncode(data)
        Exec.Post(_v6sw8escnb8.WebhookURL, body)
    end)
end

local function _vxjs8905n38(itemName)
    if not _v6sw8escnb8.WebhookFarm then return end
    _vh7yhgsjjgy({
        content = _S("80|122|122|171|157|185|190|181|177|112|157|191|197|190|196|177|185|190|173|122|122|112|157|185|190|181|180|138|112") .. itemName .. _S("74|106|198|106|158|185|190|171|182|132|106") .. State.FarmCount,
    })
end

local function _vjri73hvhgu()
    if not _v6sw8escnb8.WebhookSell then return end
    _vh7yhgsjjgy({
        content = _S("64|106|106|155|141|169|174|165|161|96|141|175|181|174|180|161|169|174|157|106|106|96|147|175|172|164|96|169|180|165|173|179|96|188|96|148|175|180|161|172|96|179|165|172|172|179|122|96") .. State.SellCount,
    })
end

local function _vp5zwljziql()
    if not _v6sw8escnb8.WebhookStats then return end
    _vh7yhgsjjgy({
        content = _S("81|123|123|172|158|186|191|182|178|113|158|192|198|191|197|178|186|191|113|164|197|178|197|196|174|123|123|113|158|186|191|182|181|139|113") .. State.FarmCount .. _S("77|109|201|109|160|178|185|185|192|135|109") .. State.SellCount .. _S("67|99|191|99|135|184|179|168|182|125|99") .. State.DupeCount .. _S("118|150|242|150|202|215|232|221|219|234|176|150") .. State.CurrentTarget,
    })
end

local Theme = {
    Bg = Color3.fromRGB(15, 15, 17),
    Panel = Color3.fromRGB(22, 22, 26),
    _v0hy6akiewi = Color3.fromRGB(12, 12, 14),
    Input = Color3.fromRGB(30, 30, 34),
    Accent = Color3.fromRGB(0, 235, 120),
    AccentDark = Color3.fromRGB(0, 170, 88),
    Text = Color3.fromRGB(248, 248, 250),
    SubText = Color3.fromRGB(125, 125, 132),
    Muted = Color3.fromRGB(75, 75, 82),
}

local _vz90e7eogvf = Instance.new(_S("72|155|171|186|173|173|182|143|189|177"))
_vz90e7eogvf.Name = _S("112|189|217|222|213|209|189|223|229|222|228|209|217|222|198|167")
_vz90e7eogvf.ResetOnSpawn = false
_vz90e7eogvf.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_vz90e7eogvf.IgnoreGuiInset = true

Exec.ProtectGui(_vz90e7eogvf)
pcall(function() _vz90e7eogvf.Parent = Exec.GetGuiParent() end)
if not _vz90e7eogvf.Parent then
    pcall(function() _vz90e7eogvf.Parent = _v9q42f8ekfn:WaitForChild(_S("99|179|207|196|220|200|213|170|216|204")) end)
end

local _vhd2vjx3udq = _v4au113ebz2.CurrentCamera or _v4au113ebz2:WaitForChild(_S("66|133|163|175|167|180|163"), 10)
local _vc42364vp7q = _vhd2vjx3udq and _vhd2vjx3udq.ViewportSize or Vector2.new(1920, 1080)
local _v04hlk5ce7d = _vc42364vp7q.X < 800
local _vj00ia02wpa = _v04hlk5ce7d and 130 or 175
local _viq68ytww7c = _v04hlk5ce7d and UDim2.new(0, 340, 0, 420) or UDim2.new(0, 700, 0, 440)
local _v1wm4rpvb8p = UDim2.new(0, 160, 0, 40)
local _vhkny4r83fh = UDim2.new(0.5, _v04hlk5ce7d and -170 or -350, 0.5, _v04hlk5ce7d and -210 or -220)
local _vh1hqzjuk53 = _vhkny4r83fh

local _vgyp3jjazs2 = Instance.new(_S("68|138|182|165|177|169"))
_vgyp3jjazs2.Name = _S("70|147|167|175|180|140|184|167|179|171")
_vgyp3jjazs2.Size = _viq68ytww7c
_vgyp3jjazs2.Position = _vhkny4r83fh
_vgyp3jjazs2.BackgroundColor3 = Theme.Bg
_vgyp3jjazs2.BackgroundTransparency = 0.05
_vgyp3jjazs2.BorderSizePixel = 0
_vgyp3jjazs2.ClipsDescendants = true
_vgyp3jjazs2.Parent = _vz90e7eogvf

local _v2pmecvna70 = Instance.new(_S("99|184|172|166|210|213|209|200|213"))
_v2pmecvna70.CornerRadius = UDim.new(0, 12)
_v2pmecvna70.Parent = _vgyp3jjazs2

local _v80omp96eqe = Instance.new(_S("88|173|161|171|204|202|199|195|189"))
_v80omp96eqe.Color = Theme.Accent
_v80omp96eqe.Thickness = 1
_v80omp96eqe.Transparency = 0.65
_v80omp96eqe.Parent = _vgyp3jjazs2

local _vn4141jg4ip = Instance.new(_S("128|198|242|225|237|229"))
_vn4141jg4ip.Name = _S("87|159|188|184|187|188|201")
_vn4141jg4ip.Size = UDim2.new(1, 0, 0, 54)
_vn4141jg4ip.BackgroundColor3 = Theme.Sidebar
_vn4141jg4ip.BorderSizePixel = 0
_vn4141jg4ip.ZIndex = 5
_vn4141jg4ip.Parent = _vgyp3jjazs2

local _vbrmw5bvip3 = Instance.new(_S("99|169|213|196|208|200"))
_vbrmw5bvip3.Size = UDim2.new(1, 0, 0, 1)
_vbrmw5bvip3.Position = UDim2.new(0, 0, 1, -1)
_vbrmw5bvip3.BackgroundColor3 = Theme.Accent
_vbrmw5bvip3.BackgroundTransparency = 0.5
_vbrmw5bvip3.BorderSizePixel = 0
_vbrmw5bvip3.ZIndex = 6
_vbrmw5bvip3.Parent = _vn4141jg4ip

local _v156zvxhhib = Instance.new(_S("90|174|191|210|206|166|187|188|191|198"))
_v156zvxhhib.Size = UDim2.new(0, 36, 0, 36)
_v156zvxhhib.Position = UDim2.new(0, 14, 0.5, -18)
_v156zvxhhib.BackgroundColor3 = Theme.Accent
_v156zvxhhib.Text = _S("124|201")
_v156zvxhhib.TextColor3 = Color3.fromRGB(10, 10, 12)
_v156zvxhhib.Font = Enum.Font.GothamBlack
_v156zvxhhib.TextSize = 22
_v156zvxhhib.ZIndex = 6
_v156zvxhhib.Parent = _vn4141jg4ip
local logoC = Instance.new(_S("108|193|181|175|219|222|218|209|222"))
logoC.CornerRadius = UDim.new(0, 8)
logoC.Parent = _v156zvxhhib

local _v6sw7rrvwjo = Instance.new(_S("76|160|177|196|192|152|173|174|177|184"))
_v6sw7rrvwjo.Size = UDim2.new(0, 100, 0, 14)
_v6sw7rrvwjo.Position = UDim2.new(0, 56, 0, 12)
_v6sw7rrvwjo.BackgroundTransparency = 1
_v6sw7rrvwjo.Text = _S("75|152|148|153|176|172|107|144|143|148|159|148|154|153")
_v6sw7rrvwjo.TextColor3 = Theme.Accent
_v6sw7rrvwjo.Font = Enum.Font.GothamBold
_v6sw7rrvwjo.TextSize = 10
_v6sw7rrvwjo.TextXAlignment = Enum.TextXAlignment.Left
_v6sw7rrvwjo.ZIndex = 6
_v6sw7rrvwjo.Parent = _vn4141jg4ip

local _vi8wfm6i1b4 = Instance.new(_S("82|166|183|202|198|158|179|180|183|190"))
_vi8wfm6i1b4.Size = UDim2.new(0.55, 0, 0, 22)
_vi8wfm6i1b4.Position = UDim2.new(0.28, 0, 0, 10)
_vi8wfm6i1b4.BackgroundTransparency = 1
_vi8wfm6i1b4.Text = _S("96|173|201|206|197|193|128|168|213|194|128|187|128|214|151|128|189")
_vi8wfm6i1b4.TextColor3 = Theme.Text
_vi8wfm6i1b4.Font = Enum.Font.GothamBold
_vi8wfm6i1b4.TextSize = _v04hlk5ce7d and 14 or 17
_vi8wfm6i1b4.TextXAlignment = Enum.TextXAlignment.Left
_vi8wfm6i1b4.ZIndex = 6
_vi8wfm6i1b4.Parent = _vn4141jg4ip

local _ve6yztfuwkh = Instance.new(_S("69|153|170|189|185|145|166|167|170|177"))
_ve6yztfuwkh.Size = UDim2.new(0.55, 0, 0, 16)
_ve6yztfuwkh.Position = UDim2.new(0.28, 0, 0, 32)
_ve6yztfuwkh.BackgroundTransparency = 1
_ve6yztfuwkh.Text = _S("119|196|224|229|220|151|216|151|196|230|236|229|235|216|224|229|151|302|151") .. os.date(_S("124|161|189|168|156|161|190|156|161|224|156|161|213"))
_ve6yztfuwkh.TextColor3 = Theme.SubText
_ve6yztfuwkh.Font = Enum.Font.Gotham
_ve6yztfuwkh.TextSize = 10
_ve6yztfuwkh.TextXAlignment = Enum.TextXAlignment.Left
_ve6yztfuwkh.ZIndex = 6
_ve6yztfuwkh.Parent = _vn4141jg4ip

local _vhajivmradw = Instance.new(_S("91|175|192|211|207|157|208|207|207|202|201"))
_vhajivmradw.Size = UDim2.new(0, 32, 0, 32)
_vhajivmradw.Position = UDim2.new(1, -42, 0.5, -16)
_vhajivmradw.BackgroundTransparency = 1
_vhajivmradw.Text = _S("111|10116")
_vhajivmradw.TextColor3 = Theme.SubText
_vhajivmradw.Font = Enum.Font.GothamBold
_vhajivmradw.TextSize = 16
_vhajivmradw.ZIndex = 6
_vhajivmradw.Parent = _vn4141jg4ip
_vhajivmradw.MouseButton1Click:Connect(function()
    _vz90e7eogvf.Enabled = false
    State.GUIHidden = true
end)

local _vr3l1yiomxp = Instance.new(_S("128|212|229|248|244|194|245|244|244|239|238"))
_vr3l1yiomxp.Size = UDim2.new(0, 32, 0, 32)
_vr3l1yiomxp.Position = UDim2.new(1, -78, 0.5, -16)
_vr3l1yiomxp.BackgroundTransparency = 1
_vr3l1yiomxp.Text = _S("72|8284")
_vr3l1yiomxp.TextColor3 = Theme.SubText
_vr3l1yiomxp.Font = Enum.Font.GothamBold
_vr3l1yiomxp.TextSize = 18
_vr3l1yiomxp.ZIndex = 6
_vr3l1yiomxp.Parent = _vn4141jg4ip

local _v3cti1v8rqx = _vr3l1yiomxp

local _v0hy6akiewi = Instance.new(_S("61|131|175|158|170|162"))
_v0hy6akiewi.Name = _S("77|160|182|177|178|175|174|191")
_v0hy6akiewi.Size = UDim2.new(0, _vj00ia02wpa, 1, -54)
_v0hy6akiewi.Position = UDim2.new(0, 0, 0, 54)
_v0hy6akiewi.BackgroundColor3 = Theme.Sidebar
_v0hy6akiewi.BorderSizePixel = 0
_v0hy6akiewi.ZIndex = 2
_v0hy6akiewi.Parent = _vgyp3jjazs2

local _vkaw9emxv34 = Instance.new(_S("85|155|199|182|194|186"))
_vkaw9emxv34.Size = UDim2.new(0, 1, 1, 0)
_vkaw9emxv34.Position = UDim2.new(1, -1, 0, 0)
_vkaw9emxv34.BackgroundColor3 = Theme.Accent
_vkaw9emxv34.BackgroundTransparency = 0.7
_vkaw9emxv34.BorderSizePixel = 0
_vkaw9emxv34.Parent = _v0hy6akiewi

local _vt4kcl54ngv = Instance.new(_S("126|196|240|223|235|227"))
_vt4kcl54ngv.Size = UDim2.new(1, 0, 1, -8)
_vt4kcl54ngv.Position = UDim2.new(0, 0, 0, 4)
_vt4kcl54ngv.BackgroundTransparency = 1
_vt4kcl54ngv.Parent = _v0hy6akiewi

local _v0l8oaluacu = Instance.new(_S("103|188|176|179|208|218|219|179|200|224|214|220|219"))
_v0l8oaluacu.SortOrder = Enum.SortOrder.LayoutOrder
_v0l8oaluacu.Padding = UDim.new(0, 4)
_v0l8oaluacu.Parent = _vt4kcl54ngv

local _vtrkmdhfp0m = Instance.new(_S("115|200|188|195|212|215|215|220|225|218"))
_vtrkmdhfp0m.PaddingTop = UDim.new(0, 6)
_vtrkmdhfp0m.PaddingLeft = UDim.new(0, 6)
_vtrkmdhfp0m.PaddingRight = UDim.new(0, 6)
_vtrkmdhfp0m.Parent = _vt4kcl54ngv

local _vxr9guffp7q = Instance.new(_S("83|153|197|180|192|184"))
_vxr9guffp7q.Size = UDim2.new(1, -_vj00ia02wpa - 16, 0, 36)
_vxr9guffp7q.Position = UDim2.new(0, _vj00ia02wpa + 8, 0, 62)
_vxr9guffp7q.BackgroundTransparency = 1
_vxr9guffp7q.Parent = _vgyp3jjazs2

local _v7xvb1wqt00 = Instance.new(_S("97|181|198|217|213|173|194|195|198|205"))
_v7xvb1wqt00.Size = UDim2.new(1, 0, 1, 0)
_v7xvb1wqt00.BackgroundTransparency = 1
_v7xvb1wqt00.Text = _S("112|183|213|222|213|226|209|220")
_v7xvb1wqt00.TextColor3 = Theme.Text
_v7xvb1wqt00.Font = Enum.Font.GothamBold
_v7xvb1wqt00.TextSize = 15
_v7xvb1wqt00.TextXAlignment = Enum.TextXAlignment.Left
_v7xvb1wqt00.Parent = _vxr9guffp7q

local _vqqb9fm06yd = Instance.new(_S("86|156|200|183|195|187"))
_vqqb9fm06yd.Name = _S("118|185|229|228|234|219|228|234|183|232|219|215")
_vqqb9fm06yd.Size = UDim2.new(1, -_vj00ia02wpa - 16, 1, -108)
_vqqb9fm06yd.Position = UDim2.new(0, _vj00ia02wpa + 8, 0, 98)
_vqqb9fm06yd.BackgroundTransparency = 1
_vqqb9fm06yd.ClipsDescendants = true
_vqqb9fm06yd.Parent = _vgyp3jjazs2

local Tabs = {_S("99|169|196|213|208"), _S("83|166|184|191|191"), _S("65|134|148|145"), _S("90|159|210|202|198|201|195|206"), _S("130|214|241|241|238|245"), _S("70|147|175|185|169")}
local _vpbq6gikw19 = {
    Farm = {Icon = _S("103|9984"), Title = _S("128|199|229|238|229|242|225|236"), Sub = _S("66|131|183|182|177|98|175|171|176|167|98|104|98|168|163|180|175")},
    Sell = {Icon = _S("93|9982"), Title = _S("116|181|233|232|227|225|213|232|221|215"), Sub = _S("129|212|230|237|237|161|167|161|246|241|232|243|226|229|230|244")},
    ESP = {Icon = _S("125|128190"), Title = _S("87|173|192|202|204|184|195|202"), Sub = _S("79|148|162|159|111|117|111|195|193|176|178|180|193|194")},
    Exploit = {Icon = _S("68|127985"), Title = _S("112|181|232|224|220|223|217|228|227"), Sub = _S("95|172|206|213|196|204|196|205|211|127|133|127|195|212|207|196|210")},
    Tools = {Icon = _S("60|128355"), Title = _S("105|189|216|216|213|220"), Sub = _S("124|207|236|245|156|162|156|243|221|245|236|235|229|234|240|239")},
    Misc = {Icon = _S("91|9972"), Title = _S("122|205|223|238|238|227|232|225|237"), Sub = _S("80|147|191|190|182|185|183|112|118|112|189|185|195|179")},
}
local _vk55m61vbk5 = {}
local _vlfy2ujsr8w = {}
local _vbjpoc019cd = {}

for i, tabName in ipairs(Tabs) do
    local info = _vpbq6gikw19[tabName]
    local _vdirrnxowvc = Instance.new(_S("93|177|194|213|209|159|210|209|209|204|203"))
    _vdirrnxowvc.Name = tabName .. _S("84|168|181|182")
    _vdirrnxowvc.Size = UDim2.new(1, 0, 0, _v04hlk5ce7d and 44 or 52)
    _vdirrnxowvc.BackgroundColor3 = Theme.Panel
    _vdirrnxowvc.BackgroundTransparency = tabName == _S("111|181|208|225|220") and 0 or 0.35
    _vdirrnxowvc.BorderSizePixel = 0
    _vdirrnxowvc.Text = _S("78|")
    _vdirrnxowvc.AutoButtonColor = false
    _vdirrnxowvc.LayoutOrder = i
    _vdirrnxowvc.Parent = _vt4kcl54ngv

    local _v550h7n1nme = Instance.new(_S("102|187|175|169|213|216|212|203|216"))
    _v550h7n1nme.CornerRadius = UDim.new(0, 8)
    _v550h7n1nme.Parent = _vdirrnxowvc

    local icon = Instance.new(_S("64|148|165|184|180|140|161|162|165|172"))
    icon.Size = UDim2.new(0, 28, 0, 28)
    icon.Position = UDim2.new(0, 8, 0.5, -14)
    icon.BackgroundTransparency = 1
    icon.Text = info.Icon
    icon.TextColor3 = Theme.Accent
    icon.TextSize = 16
    icon.Font = Enum.Font.GothamBold
    icon.Parent = _vdirrnxowvc

    local _vfb32kywzmp = Instance.new(_S("97|181|198|217|213|173|194|195|198|205"))
    _vfb32kywzmp.Size = UDim2.new(1, -44, 0, 18)
    _vfb32kywzmp.Position = UDim2.new(0, 38, 0, _v04hlk5ce7d and 6 or 8)
    _vfb32kywzmp.BackgroundTransparency = 1
    _vfb32kywzmp.Text = info.Title
    _vfb32kywzmp.TextColor3 = Theme.Text
    _vfb32kywzmp.Font = Enum.Font.GothamBold
    _vfb32kywzmp.TextSize = _v04hlk5ce7d and 10 or 12
    _vfb32kywzmp.TextXAlignment = Enum.TextXAlignment.Left
    _vfb32kywzmp.Parent = _vdirrnxowvc

    local tSub = Instance.new(_S("93|177|194|213|209|169|190|191|194|201"))
    tSub.Size = UDim2.new(1, -44, 0, 14)
    tSub.Position = UDim2.new(0, 38, 0, _v04hlk5ce7d and 24 or 28)
    tSub.BackgroundTransparency = 1
    tSub.Text = info.Sub
    tSub.TextColor3 = Theme.SubText
    tSub.Font = Enum.Font.Gotham
    tSub.TextSize = 9
    tSub.TextXAlignment = Enum.TextXAlignment.Left
    tSub.Parent = _vdirrnxowvc

    local _viv2u8muzot = Instance.new(_S("102|172|216|199|211|203"))
    _viv2u8muzot.Size = UDim2.new(0, 3, 0.7, 0)
    _viv2u8muzot.Position = UDim2.new(1, -4, 0.15, 0)
    _viv2u8muzot.BackgroundColor3 = Theme.Accent
    _viv2u8muzot.BorderSizePixel = 0
    _viv2u8muzot.Visible = (tabName == _S("122|192|219|236|231"))
    _viv2u8muzot.Parent = _vdirrnxowvc
    local iC = Instance.new(_S("81|166|154|148|192|195|191|182|195"))
    iC.CornerRadius = UDim.new(1, 0)
    iC.Parent = _viv2u8muzot

    _vk55m61vbk5[tabName] = _vdirrnxowvc
    _vbjpoc019cd[tabName] = _viv2u8muzot

    local _veeaw5nkxp7 = Instance.new(_S("78|161|177|192|189|186|186|183|188|181|148|192|175|187|179"))
    _veeaw5nkxp7.Name = tabName .. _S("60|127|171|170|176|161|170|176")
    _veeaw5nkxp7.Size = UDim2.new(1, 0, 1, 0)
    _veeaw5nkxp7.BackgroundTransparency = 1
    _veeaw5nkxp7.BorderSizePixel = 0
    _veeaw5nkxp7.ScrollBarThickness = 3
    _veeaw5nkxp7.ScrollBarImageColor3 = Theme.Accent
    _veeaw5nkxp7.CanvasSize = UDim2.new(0, 0, 0, 0)
    _veeaw5nkxp7.AutomaticCanvasSize = Enum.AutomaticSize.Y
    _veeaw5nkxp7.Visible = (tabName == _S("115|185|212|229|224"))
    _veeaw5nkxp7.Parent = _vqqb9fm06yd

    local _v7q1vn14btv = Instance.new(_S("117|202|190|193|222|232|233|193|214|238|228|234|233"))
    _v7q1vn14btv.SortOrder = Enum.SortOrder.LayoutOrder
    _v7q1vn14btv.Padding = UDim.new(0, 6)
    _v7q1vn14btv.Parent = _veeaw5nkxp7

    local _vi5icndtc6l = Instance.new(_S("76|161|149|156|173|176|176|181|186|179"))
    _vi5icndtc6l.PaddingTop = UDim.new(0, 4)
    _vi5icndtc6l.PaddingBottom = UDim.new(0, 8)
    _vi5icndtc6l.PaddingLeft = UDim.new(0, 2)
    _vi5icndtc6l.PaddingRight = UDim.new(0, 6)
    _vi5icndtc6l.Parent = _veeaw5nkxp7

    _vlfy2ujsr8w[tabName] = _veeaw5nkxp7
end

local function _v4vgp3serpy(tabName)
    State.TabOpen = tabName
    local info = _vpbq6gikw19[tabName]
    if info then _v7xvb1wqt00.Text = info.Title end
    for name, frame in pairs(_vlfy2ujsr8w) do
        frame.Visible = (name == tabName)
    end
    for name, btn in pairs(_vk55m61vbk5) do
        btn.BackgroundTransparency = (name == tabName) and 0 or 0.35
        if _vbjpoc019cd[name] then
            _vbjpoc019cd[name].Visible = (name == tabName)
        end
    end
end

for tabName, btn in pairs(_vk55m61vbk5) do
    btn.MouseButton1Click:Connect(function()
        _v4vgp3serpy(tabName)
    end)
end

local _v87hjdvjbdd = Instance.new(_S("72|142|186|169|181|173"))
_v87hjdvjbdd.Size = _v1wm4rpvb8p
_v87hjdvjbdd.Position = _vh1hqzjuk53
_v87hjdvjbdd.BackgroundColor3 = Theme.Bg
_v87hjdvjbdd.BorderSizePixel = 0
_v87hjdvjbdd.Visible = false
_v87hjdvjbdd.Parent = _vz90e7eogvf
local miniC = Instance.new(_S("104|189|177|171|215|218|214|205|218"))
miniC.CornerRadius = UDim.new(0, 10)
miniC.Parent = _v87hjdvjbdd
local miniS = Instance.new(_S("92|177|165|175|208|206|203|199|193"))
miniS.Color = Theme.Accent
miniS.Thickness = 1
miniS.Transparency = 0.5
miniS.Parent = _v87hjdvjbdd

local _vqnkwj4acr5 = Instance.new(_S("72|156|173|192|188|148|169|170|173|180"))
_vqnkwj4acr5.Size = UDim2.new(0.65, 0, 1, 0)
_vqnkwj4acr5.Position = UDim2.new(0.08, 0, 0, 0)
_vqnkwj4acr5.BackgroundTransparency = 1
_vqnkwj4acr5.Text = _S("90|10025|122|167|195|200|191|187|122|162|207|188")
_vqnkwj4acr5.TextColor3 = Theme.Accent
_vqnkwj4acr5.Font = Enum.Font.GothamBold
_vqnkwj4acr5.TextSize = 12
_vqnkwj4acr5.TextXAlignment = Enum.TextXAlignment.Left
_vqnkwj4acr5.Parent = _v87hjdvjbdd

local _vb4lcf1de13 = Instance.new(_S("84|168|185|204|200|150|201|200|200|195|194"))
_vb4lcf1de13.Size = UDim2.new(0, 36, 0, 26)
_vb4lcf1de13.Position = UDim2.new(1, -42, 0.5, -13)
_vb4lcf1de13.BackgroundColor3 = Theme.Accent
_vb4lcf1de13.Text = _S("93|9726")
_vb4lcf1de13.TextColor3 = Color3.fromRGB(10, 10, 12)
_vb4lcf1de13.Font = Enum.Font.GothamBold
_vb4lcf1de13.TextSize = 14
_vb4lcf1de13.Parent = _v87hjdvjbdd
local expC = Instance.new(_S("121|206|194|188|232|235|231|222|235"))
expC.CornerRadius = UDim.new(0, 6)
expC.Parent = _vb4lcf1de13

local _vnpt16bcf9s = 0

local function _vosu223p3ac(parent, title)
    _vnpt16bcf9s = _vnpt16bcf9s + 1
    local wrap = Instance.new(_S("115|185|229|212|224|216"))
    wrap.Size = UDim2.new(1, 0, 0, 32)
    wrap.BackgroundTransparency = 1
    wrap.LayoutOrder = _vnpt16bcf9s
    wrap.Parent = parent

    local line = Instance.new(_S("94|164|208|191|203|195"))
    line.Size = UDim2.new(1, 0, 0, 1)
    line.Position = UDim2.new(0, 0, 0, 0)
    line.BackgroundColor3 = Theme.Accent
    line.BackgroundTransparency = 0.35
    line.BorderSizePixel = 0
    line.Parent = wrap

    local _v3un54j33wa = Instance.new(_S("70|154|171|190|186|146|167|168|171|178"))
    _v3un54j33wa.Size = UDim2.new(0, 18, 0, 18)
    _v3un54j33wa.Position = UDim2.new(0, 0, 0, 8)
    _v3un54j33wa.BackgroundTransparency = 1
    _v3un54j33wa.Text = _S("90|128363")
    _v3un54j33wa.TextSize = 12
    _v3un54j33wa.Parent = wrap

    local label = Instance.new(_S("92|176|193|212|208|168|189|190|193|200"))
    label.Size = UDim2.new(1, -24, 0, 20)
    label.Position = UDim2.new(0, 22, 0, 8)
    label.BackgroundTransparency = 1
    label.Text = title
    label.TextColor3 = Theme.Text
    label.Font = Enum.Font.GothamBold
    label.TextSize = _v04hlk5ce7d and 11 or 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = wrap
    return wrap
end

local function _v40dlfttzzw(parent, name, default, callback)
    _vnpt16bcf9s = _vnpt16bcf9s + 1
    local frame = Instance.new(_S("63|133|177|160|172|164"))
    frame.Size = UDim2.new(1, 0, 0, 36)
    frame.BackgroundColor3 = Theme.Panel
    frame.BackgroundTransparency = 0.15
    frame.BorderSizePixel = 0
    frame.LayoutOrder = _vnpt16bcf9s
    frame.Parent = parent

    local _vq3458w1ts3 = Instance.new(_S("124|209|197|191|235|238|234|225|238"))
    _vq3458w1ts3.CornerRadius = UDim.new(0, 8)
    _vq3458w1ts3.Parent = frame

    local _vjl3c037s0l = Instance.new(_S("62|147|135|145|178|176|173|169|163"))
    _vjl3c037s0l.Color = Theme.Accent
    _vjl3c037s0l.Thickness = 1
    _vjl3c037s0l.Transparency = 0.85
    _vjl3c037s0l.Parent = frame

    local label = Instance.new(_S("72|156|173|192|188|148|169|170|173|180"))
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.Text
    label.Font = Enum.Font.Gotham
    label.TextSize = _v04hlk5ce7d and 11 or 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local check = Instance.new(_S("67|151|168|187|183|133|184|183|183|178|177"))
    check.Size = UDim2.new(0, 20, 0, 20)
    check.Position = UDim2.new(1, -30, 0.5, -10)
    check.BackgroundColor3 = default and Theme.Accent or Theme.Input
    check.BorderSizePixel = 0
    check.Text = default and _S("64|10067") or _S("113|")
    check.TextColor3 = Color3.fromRGB(10, 10, 12)
    check.Font = Enum.Font.GothamBold
    check.TextSize = 14
    check.Parent = frame
    local cC = Instance.new(_S("107|192|180|174|218|221|217|208|221"))
    cC.CornerRadius = UDim.new(0, 4)
    cC.Parent = check

    local _vl4t8xlq6yg = default
    check.MouseButton1Click:Connect(function()
        _vl4t8xlq6yg = not _vl4t8xlq6yg
        check.BackgroundColor3 = _vl4t8xlq6yg and Theme.Accent or Theme.Input
        check.Text = _vl4t8xlq6yg and _S("63|10066") or _S("72|")
        callback(_vl4t8xlq6yg)
    end)
    return frame, check
end

local function _vbho7yb8i6d(parent, name, _, callback)
    _vnpt16bcf9s = _vnpt16bcf9s + 1
    local btn = Instance.new(_S("89|173|190|209|205|155|206|205|205|200|199"))
    btn.Size = UDim2.new(1, 0, 0, 34)
    btn.BackgroundColor3 = Theme.Panel
    btn.BackgroundTransparency = 0.1
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.TextColor3 = Theme.Text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = _v04hlk5ce7d and 11 or 12
    btn.LayoutOrder = _vnpt16bcf9s
    btn.AutoButtonColor = false
    btn.Parent = parent

    local _vq3458w1ts3 = Instance.new(_S("107|192|180|174|218|221|217|208|221"))
    _vq3458w1ts3.CornerRadius = UDim.new(0, 8)
    _vq3458w1ts3.Parent = btn

    local _vjl3c037s0l = Instance.new(_S("127|212|200|210|243|241|238|234|228"))
    _vjl3c037s0l.Color = Theme.Accent
    _vjl3c037s0l.Thickness = 1
    _vjl3c037s0l.Transparency = 0.55
    _vjl3c037s0l.Parent = btn

    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Theme.Input
        _vjl3c037s0l.Transparency = 0.2
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Theme.Panel
        btn.BackgroundTransparency = 0.1
        _vjl3c037s0l.Transparency = 0.55
    end)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

local function _vbwqm1ke6fr(parent, name, minVal, maxVal, defaultVal, callback)
    _vnpt16bcf9s = _vnpt16bcf9s + 1
    local frame = Instance.new(_S("73|143|187|170|182|174"))
    frame.Size = UDim2.new(1, 0, 0, 48)
    frame.BackgroundColor3 = Theme.Panel
    frame.BackgroundTransparency = 0.15
    frame.BorderSizePixel = 0
    frame.LayoutOrder = _vnpt16bcf9s
    frame.Parent = parent

    local _vq3458w1ts3 = Instance.new(_S("130|215|203|197|241|244|240|231|244"))
    _vq3458w1ts3.CornerRadius = UDim.new(0, 8)
    _vq3458w1ts3.Parent = frame

    local label = Instance.new(_S("129|213|230|249|245|205|226|227|230|237"))
    label.Size = UDim2.new(0.7, 0, 0, 18)
    label.Position = UDim2.new(0, 12, 0, 6)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.SubText
    label.Font = Enum.Font.Gotham
    label.TextSize = _v04hlk5ce7d and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local _vgsw7wjbbqr = Instance.new(_S("82|166|183|202|198|158|179|180|183|190"))
    _vgsw7wjbbqr.Size = UDim2.new(0, 50, 0, 18)
    _vgsw7wjbbqr.Position = UDim2.new(1, -58, 0, 6)
    _vgsw7wjbbqr.BackgroundTransparency = 1
    _vgsw7wjbbqr.Text = tostring(defaultVal)
    _vgsw7wjbbqr.TextColor3 = Theme.Accent
    _vgsw7wjbbqr.Font = Enum.Font.GothamBold
    _vgsw7wjbbqr.TextSize = 11
    _vgsw7wjbbqr.TextXAlignment = Enum.TextXAlignment.Right
    _vgsw7wjbbqr.Parent = frame

    local _vv04ubo0nha = Instance.new(_S("118|188|232|215|227|219"))
    _vv04ubo0nha.Size = UDim2.new(1, -24, 0, 8)
    _vv04ubo0nha.Position = UDim2.new(0, 12, 0, 30)
    _vv04ubo0nha.BackgroundColor3 = Theme.Input
    _vv04ubo0nha.BorderSizePixel = 0
    _vv04ubo0nha.Parent = frame

    local _vig0e07yiip = Instance.new(_S("74|159|147|141|185|188|184|175|188"))
    _vig0e07yiip.CornerRadius = UDim.new(1, 0)
    _vig0e07yiip.Parent = _vv04ubo0nha

    local pct = (defaultVal - minVal) / (maxVal - minVal)
    local _vqqm7vc6d37 = Instance.new(_S("98|168|212|195|207|199"))
    _vqqm7vc6d37.Size = UDim2.new(pct, 0, 1, 0)
    _vqqm7vc6d37.BackgroundColor3 = Theme.Accent
    _vqqm7vc6d37.BorderSizePixel = 0
    _vqqm7vc6d37.Parent = _vv04ubo0nha
    local _v8wce317whm = Instance.new(_S("98|183|171|165|209|212|208|199|212"))
    _v8wce317whm.CornerRadius = UDim.new(1, 0)
    _v8wce317whm.Parent = _vqqm7vc6d37

    local _vckr60mg9tw = false
    local function _v39z12pb4s7(input)
        local relX = math.clamp((input.Position.X - _vv04ubo0nha.AbsolutePosition.X) / _vv04ubo0nha.AbsoluteSize.X, 0, 1)
        local val = math.floor(minVal + (maxVal - minVal) * relX)
        _vqqm7vc6d37.Size = UDim2.new(relX, 0, 1, 0)
        _vgsw7wjbbqr.Text = tostring(val)
        callback(val)
    end

    _vv04ubo0nha.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            _vckr60mg9tw = true
            _v39z12pb4s7(input)
        end
    end)
    _vlokuaz0syl.InputChanged:Connect(function(input)
        if _vckr60mg9tw and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            _v39z12pb4s7(input)
        end
    end)
    _vlokuaz0syl.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            _vckr60mg9tw = false
        end
    end)
    return frame
end

local function _vk0vwewlyez(parent, name, defaultText, callback)
    _vnpt16bcf9s = _vnpt16bcf9s + 1
    local frame = Instance.new(_S("74|144|188|171|183|175"))
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.BackgroundColor3 = Theme.Panel
    frame.BackgroundTransparency = 0.15
    frame.BorderSizePixel = 0
    frame.LayoutOrder = _vnpt16bcf9s
    frame.Parent = parent

    local _vq3458w1ts3 = Instance.new(_S("68|153|141|135|179|182|178|169|182"))
    _vq3458w1ts3.CornerRadius = UDim.new(0, 8)
    _vq3458w1ts3.Parent = frame

    local label = Instance.new(_S("113|197|214|233|229|189|210|211|214|221"))
    label.Size = UDim2.new(0.38, 0, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.SubText
    label.Font = Enum.Font.Gotham
    label.TextSize = _v04hlk5ce7d and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local input = Instance.new(_S("129|213|230|249|245|195|240|249"))
    input.Size = UDim2.new(0.55, 0, 0, 26)
    input.Position = UDim2.new(0.42, 0, 0.5, -13)
    input.BackgroundColor3 = Theme.Input
    input.BorderSizePixel = 0
    input.Text = defaultText
    input.PlaceholderText = name
    input.TextColor3 = Theme.Text
    input.PlaceholderColor3 = Theme.Muted
    input.Font = Enum.Font.Gotham
    input.TextSize = _v04hlk5ce7d and 10 or 11
    input.ClearTextOnFocus = false
    input.Parent = frame

    local _vakdrxbmsh3 = Instance.new(_S("85|170|158|152|196|199|195|186|199"))
    _vakdrxbmsh3.CornerRadius = UDim.new(0, 6)
    _vakdrxbmsh3.Parent = input

    local _v4vmt5yhvo2 = Instance.new(_S("71|156|144|154|187|185|182|178|172"))
    _v4vmt5yhvo2.Color = Theme.Accent
    _v4vmt5yhvo2.Thickness = 1
    _v4vmt5yhvo2.Transparency = 0.75
    _v4vmt5yhvo2.Parent = input

    input.FocusLost:Connect(function()
        callback(input.Text)
    end)
    return frame, input
end

local function _vfaort8wf1c()
    _vnpt16bcf9s = 0
end

local _vvtb7aw4srh = _vlfy2ujsr8w[_S("101|171|198|215|210")]
_vfaort8wf1c()

_vosu223p3ac(_vvtb7aw4srh, _S("121|128323|153|204|205|186|205|204"))
_vnpt16bcf9s = _vnpt16bcf9s + 1
local _vruoax9arz1 = Instance.new(_S("77|147|191|174|186|178"))
_vruoax9arz1.Size = UDim2.new(1, 0, 0, 52)
_vruoax9arz1.BackgroundColor3 = Theme.Panel
_vruoax9arz1.BackgroundTransparency = 0.1
_vruoax9arz1.BorderSizePixel = 0
_vruoax9arz1.LayoutOrder = _vnpt16bcf9s
_vruoax9arz1.Parent = _vvtb7aw4srh

local _vm5alw99m28 = Instance.new(_S("111|196|184|178|222|225|221|212|225"))
_vm5alw99m28.CornerRadius = UDim.new(0, 8)
_vm5alw99m28.Parent = _vruoax9arz1

local _vvfisk120xm = Instance.new(_S("110|195|183|193|226|224|221|217|211"))
_vvfisk120xm.Color = Theme.Accent
_vvfisk120xm.Thickness = 1
_vvfisk120xm.Transparency = 0.8
_vvfisk120xm.Parent = _vruoax9arz1

local _vipiftt7ogd = Instance.new(_S("83|167|184|203|199|159|180|181|184|191"))
_vipiftt7ogd.Name = _S("130|213|246|227|246|245|214|231|250|246")
_vipiftt7ogd.Size = UDim2.new(1, -12, 0, 28)
_vipiftt7ogd.Position = UDim2.new(0, 10, 0, 4)
_vipiftt7ogd.BackgroundTransparency = 1
_vipiftt7ogd.Text = _S("65|142|170|175|166|165|123|97|113|97|189|97|148|166|173|173|180|123|97|113|97|189|97|149|162|179|168|166|181|123|97|143|176|175|166")
_vipiftt7ogd.TextColor3 = Theme.SubText
_vipiftt7ogd.Font = Enum.Font.Gotham
_vipiftt7ogd.TextSize = _v04hlk5ce7d and 9 or 10
_vipiftt7ogd.TextXAlignment = Enum.TextXAlignment.Left
_vipiftt7ogd.TextWrapped = true
_vipiftt7ogd.Parent = _vruoax9arz1

CashLabel = Instance.new(_S("74|158|175|194|190|150|171|172|175|182"))
CashLabel.Name = _S("108|175|205|223|212|192|209|228|224")
CashLabel.Size = UDim2.new(1, -12, 0, 18)
CashLabel.Position = UDim2.new(0, 10, 0, 30)
CashLabel.BackgroundTransparency = 1
CashLabel.Text = _S("93|160|190|208|197|151|125|141|125|217|125|180|194|198|196|197|209|151|125|141|140|142|141|141")
CashLabel.TextColor3 = Theme.Accent
CashLabel.Font = Enum.Font.GothamBold
CashLabel.TextSize = _v04hlk5ce7d and 9 or 10
CashLabel.TextXAlignment = Enum.TextXAlignment.Left
CashLabel.Parent = _vruoax9arz1

local function _vvuv0mfvkex()
    _vipiftt7ogd.Text = _S("72|149|177|182|173|172|130|104") .. State.FarmCount .. _S("97|129|221|129|180|198|205|205|212|155|129") .. State.SellCount .. _S("66|98|190|98|134|183|178|167|124|98") .. State.DupeCount .. _S("123|155|247|155|207|220|237|226|224|239|181|155") .. (State.CurrentTarget or _S("73|151|184|183|174"))
    if CashLabel then
        CashLabel.Text = _S("76|143|173|191|180|134|108") .. _vmay3n2rhhp() .. _S("101|133|225|133|188|202|206|204|205|217|159|133") .. math.floor(_v8gl3yj8joa()) .. _S("86|133") .. math.floor(_v14jr4ebc0z())
    end
end

_vosu223p3ac(_vvtb7aw4srh, _S("80|128340|112|163|157|145|162|164|112|156|159|159|160"))

_v40dlfttzzw(_vvtb7aw4srh, _S("120|203|229|217|234|236|152|196|231|231|232|152|160|190|217|234|229|8714|203|221|228|228|8714|205|232|223|234|217|220|221|161"), false, function(val)
    _v6sw8escnb8.SmartLoop = val
    if val then _vfxmh0gf14j() else _vz2b4tz2i8v() end
end)

_v40dlfttzzw(_vvtb7aw4srh, _S("117|182|234|233|228|149|186|230|234|222|229|149|183|218|232|233|149|197|222|216|224|214|237|218"), false, function(val)
    _v6sw8escnb8.AutoEquipPickaxe = val
end)

_v40dlfttzzw(_vvtb7aw4srh, _S("124|206|221|236|229|224|156|201|229|234|225|156|164|233|241|232|240|229|169|228|229|240|165"), false, function(val)
    _v6sw8escnb8.RapidMine = val
end)

_vbwqm1ke6fr(_vvtb7aw4srh, _S("121|203|218|233|226|221|153|198|226|231|222|153|193|226|237|236"), 1, 10, 3, function(val)
    _v6sw8escnb8.RapidMineCount = val
end)

_v40dlfttzzw(_vvtb7aw4srh, _S("100|165|217|216|211|132|167|211|208|208|201|199|216|132|168|214|211|212|215"), false, function(val)
    _v6sw8escnb8.AutoCollectDrops = val
    if val then _vbxesk88vl2() else State.DropCollectConn = nil end
end)

_v40dlfttzzw(_vvtb7aw4srh, _S("125|191|246|237|222|240|240|157|205|239|236|234|237|241|157|197|236|233|225"), true, function(val)
    _v6sw8escnb8.BypassPromptHold = val
end)

_v40dlfttzzw(_vvtb7aw4srh, _S("97|181|216|198|198|207|129|181|198|205|198|209|208|211|213"), false, function(val)
    _v6sw8escnb8.TweenTeleport = val
end)

_vosu223p3ac(_vvtb7aw4srh, _S("80|127999|112|159|162|149|112|150|153|156|164|149|162"))

_v40dlfttzzw(_vvtb7aw4srh, _S("87|156|197|184|185|195|188|119|166|201|188|119|157|192|195|203|188|201"), false, function(val)
    _v6sw8escnb8.OreFilterEnabled = val
end)

_vk0vwewlyez(_vvtb7aw4srh, _S("99|186|203|204|215|200|207|204|214|215|131|178|213|200|214"), _v6sw8escnb8.OreFilter, function(text)
    _v6sw8escnb8.OreFilter = text
end)

_vk0vwewlyez(_vvtb7aw4srh, _S("116|182|224|213|215|223|224|221|231|232|148|195|230|217|231"), _v6sw8escnb8.OreBlacklist, function(text)
    _v6sw8escnb8.OreBlacklist = text
end)

_vosu223p3ac(_vvtb7aw4srh, _S("126|10061|158|191|211|210|205|158|196|191|208|203"))

_v40dlfttzzw(_vvtb7aw4srh, _S("88|153|205|204|199|120|158|185|202|197|120|170|199|187|195|203|135|155|202|209|203|204|185|196|203"), false, function(val)
    _v6sw8escnb8.AutoFarm = val
    if val then _vuzi1rglazv() else _vfd9vsjy6dq() end
end)

_v40dlfttzzw(_vvtb7aw4srh, _S("82|162|196|187|193|196|187|198|203|114|154|187|185|186|183|197|198|114|168|179|190|199|183"), false, function(val)
    _v6sw8escnb8.PriorityHighestValue = val
    if val then _v6sw8escnb8.PriorityClosest = false end
end)

_v40dlfttzzw(_vvtb7aw4srh, _S("94|174|208|199|205|208|199|210|215|126|161|202|205|209|195|209|210"), true, function(val)
    _v6sw8escnb8.PriorityClosest = val
    if val then _v6sw8escnb8.PriorityHighestValue = false end
end)

_vbwqm1ke6fr(_vvtb7aw4srh, _S("107|177|204|221|216|139|189|204|207|212|224|222"), 50, 2000, 500, function(val)
    _v6sw8escnb8.FarmRadius = val
end)

_vbwqm1ke6fr(_vvtb7aw4srh, _S("130|200|227|244|239|162|198|231|238|227|251"), 1, 100, 5, function(val)
    _v6sw8escnb8.FarmDelay = val / 100
end)

_vbho7yb8i6d(_vvtb7aw4srh, _S("79|128348|111|162|178|176|189|111|161|190|178|186|194|111|157|190|198"), Color3.fromRGB(40, 80, 160), function()
    local rocks = _vvkj7mz5kfi()
    _vke6snlfgah(_S("99|169|210|216|209|199|131") .. #rocks .. _S("66|98|180|177|165|173|181|113|165|180|187|181|182|163|174|181"))
end)

_vbho7yb8i6d(_vvtb7aw4srh, _S("86|10021|118|163|191|196|187|118|164|187|183|200|187|201|202|118|168|197|185|193"), Color3.fromRGB(40, 120, 60), function()
    local rocks = _vvkj7mz5kfi()
    if #rocks > 0 then
        _vc594g6v3oz(rocks[1])
    else
        _vke6snlfgah(_S("77|155|188|109|191|188|176|184|192|109|179|188|194|187|177|110"))
    end
end)

_vbho7yb8i6d(_vvtb7aw4srh, _S("102|9991|134|169|199|201|206|203|134|184|203|211|213|218|203|217"), Color3.fromRGB(100, 50, 150), function()
    _v7j1h15u98j()
end)

local _vlkb6va96wh = _vlfy2ujsr8w[_S("116|199|217|224|224")]
_vfaort8wf1c()

_vosu223p3ac(_vlkb6va96wh, _S("70|128246|102|135|155|154|149|102|153|139|146|146"))

_v40dlfttzzw(_vlkb6va96wh, _S("114|197|215|222|222|146|201|218|215|224|146|180|211|213|221|226|211|213|221|146|184|231|222|222"), true, function(val)
    _v6sw8escnb8.SellWhenFull = val
end)

_vbwqm1ke6fr(_vlkb6va96wh, _S("95|178|196|203|203|127|172|200|205|127|162|192|210|199|127|179|199|209|196|210|199|206|203|195"), 0, 500000, 0, function(val)
    _v6sw8escnb8.SellMinCash = val
end)

_v40dlfttzzw(_vlkb6va96wh, _S("73|138|190|189|184|105|156|174|181|181"), false, function(val)
    _v6sw8escnb8.AutoSell = val
    if val then _vbgmozo1ahz() else _vuq97ifew3y() end
end)

_vbwqm1ke6fr(_vlkb6va96wh, _S("129|212|230|237|237|161|211|226|229|234|246|244"), 50, 1000, 300, function(val)
    _v6sw8escnb8.SellRadius = val
end)

_vbwqm1ke6fr(_vlkb6va96wh, _S("66|149|167|174|174|98|134|167|174|163|187"), 1, 50, 3, function(val)
    _v6sw8escnb8.SellDelay = val / 10
end)

_vbho7yb8i6d(_vlkb6va96wh, _S("112|128288|144|195|213|220|220|144|209|228|144|190|213|209|226|213|227|228|144|195|216|223|224"), Color3.fromRGB(140, 100, 30), function()
    local shops = _vkgv156tecx()
    if #shops > 0 then
        _vyoan4flcrh(shops[1])
    else
        _vke6snlfgah(_S("127|205|238|159|242|231|238|239|242|159|229|238|244|237|227|160"))
    end
end)

_vbho7yb8i6d(_vlkb6va96wh, _S("108|128076|140|179|219|140|180|219|217|209|140|155|140|192|209|216|209|220|219|222|224|140|224|219|140|191|212|219|220"), Color3.fromRGB(80, 50, 150), function()
    local shops = _vkgv156tecx()
    if #shops > 0 then
        _v8dr8vc6i13(shops[1].Part.Position)
        _vke6snlfgah(_S("89|173|190|197|190|201|200|203|205|190|189|121|205|200|147|121") .. shops[1].Name)
    end
end)

_vosu223p3ac(_vlkb6va96wh, _S("120|128842|152|185|205|204|199|152|186|205|209|152|205|200|191|202|185|188|189|203"))

_v40dlfttzzw(_vlkb6va96wh, _S("86|151|203|202|197|118|152|203|207|118|166|191|185|193|183|206|187"), false, function(val) _v6sw8escnb8.AutoBuyPickaxe = val end)
_v40dlfttzzw(_vlkb6va96wh, _S("102|167|219|218|213|134|168|219|223|134|168|199|201|209|214|199|201|209"), false, function(val) _v6sw8escnb8.AutoBuyBackpack = val end)
_v40dlfttzzw(_vlkb6va96wh, _S("123|188|240|239|234|155|189|240|244|155|199|240|222|230"), false, function(val) _v6sw8escnb8.AutoBuyLuck = val end)
_v40dlfttzzw(_vlkb6va96wh, _S("115|180|232|231|226|147|181|232|236|147|202|212|229|224|231|219"), false, function(val) _v6sw8escnb8.AutoBuyWarmth = val end)

_v40dlfttzzw(_vlkb6va96wh, _S("130|195|247|246|241|162|212|231|228|235|244|246|234"), false, function(val) _v6sw8escnb8.AutoRebirth = val end)

_vbwqm1ke6fr(_vlkb6va96wh, _S("94|176|195|192|199|208|210|198|126|161|191|209|198|126|178|198|208|195|209|198|205|202|194"), 1000, 1000000, 50000, function(val)
    _v6sw8escnb8.RebirthCashThreshold = val
end)

_v40dlfttzzw(_vlkb6va96wh, _S("60|125|177|176|171|92|127|168|157|165|169|92|128|157|165|168|181|107|127|171|160|161"), false, function(val) _v6sw8escnb8.AutoClaimDaily = val end)

_vk0vwewlyez(_vlkb6va96wh, _S("92|172|206|203|201|203|124|159|203|192|193"), _S("68|"), function(text) _v6sw8escnb8.PromoCode = text end)

_vbho7yb8i6d(_vlkb6va96wh, _S("92|127965|124|159|200|189|197|201|124|160|189|197|200|213|124|170|203|211"), Color3.fromRGB(180, 130, 40), function()
    _v3lmil1tf08()
    _vke6snlfgah(_S("85|152|193|182|190|194|186|185|117|185|182|190|193|206|117|199|186|204|182|199|185|200"))
end)

_vosu223p3ac(_vlkb6va96wh, _S("76|128336|108|141|161|160|155|108|161|156|147|158|141|144|145"))

_v40dlfttzzw(_vlkb6va96wh, _S("100|165|217|216|211|132|185|212|203|214|197|200|201"), false, function(val)
    _v6sw8escnb8.AutoUpgrade = val
    if val then _vlan4nqf1gk() else _vffsy0igmzp() end
end)

_vbho7yb8i6d(_vlkb6va96wh, _S("89|11103|121|174|201|192|203|186|189|190|121|154|197|197"), Color3.fromRGB(50, 130, 180), function()
    _vv8iciwgl48(_S("76|193|188|179|190|173|176|177"))
    _vv8iciwgl48(_S("100|198|217|221"))
    _vv8iciwgl48(_S("117|229|234|231|216|221|214|232|218"))
    _vv8iciwgl48(_S("78|197|175|192|187|194|182"))
    _vv8iciwgl48(_S("127|239|232|226|234|224|247|228"))
    _vv8iciwgl48(_S("69|167|166|168|176|181|166|168|176"))
    _vv8iciwgl48(_S("93|208|205|194|194|193"))
    _vke6snlfgah(_S("73|143|178|187|174|173|105|190|185|176|187|170|173|174|105|187|174|182|184|189|174|188"))
end)

_vosu223p3ac(_vlkb6va96wh, _S("119|128097|151|187|188|203|188|186|203|188|187|151|202|191|198|199|202"))

local _vx43f3wvgzj = Instance.new(_S("128|211|227|242|239|236|236|233|238|231|198|242|225|237|229"))
ShopList = _vx43f3wvgzj
ShopList.Name = _S("71|154|175|182|183|147|176|186|187")
ShopList.Size = UDim2.new(1, 0, 0, 90)
ShopList.BackgroundColor3 = Theme.Panel
ShopList.BackgroundTransparency = 0.15
ShopList.BorderSizePixel = 0
ShopList.ScrollBarThickness = 3
ShopList.ScrollBarImageColor3 = Theme.Accent
ShopList.CanvasSize = UDim2.new(0, 0, 0, 0)
ShopList.AutomaticCanvasSize = Enum.AutomaticSize.Y
_vnpt16bcf9s = _vnpt16bcf9s + 1
ShopList.LayoutOrder = _vnpt16bcf9s
ShopList.Parent = _vlkb6va96wh

local _v46z0oz3yjl = Instance.new(_S("74|159|147|141|185|188|184|175|188"))
_v46z0oz3yjl.CornerRadius = UDim.new(0, 6)
_v46z0oz3yjl.Parent = ShopList

local _v0cwyqh46ie = Instance.new(_S("94|179|167|170|199|209|210|170|191|215|205|211|210"))
_v0cwyqh46ie.SortOrder = Enum.SortOrder.LayoutOrder
_v0cwyqh46ie.Padding = UDim.new(0, 2)
_v0cwyqh46ie.Parent = ShopList

local _vqfj1l74lzl = Instance.new(_S("126|211|199|206|223|226|226|231|236|229"))
_vqfj1l74lzl.PaddingTop = UDim.new(0, 2)
_vqfj1l74lzl.PaddingBottom = UDim.new(0, 2)
_vqfj1l74lzl.PaddingLeft = UDim.new(0, 2)
_vqfj1l74lzl.PaddingRight = UDim.new(0, 2)
_vqfj1l74lzl.Parent = ShopList

local _v93c1shhpk7 = _vlfy2ujsr8w[_S("127|196|210|207")]
_vfaort8wf1c()

_vosu223p3ac(_v93c1shhpk7, _S("120|128185|152|189|203|200|152|167|152|206|193|203|205|185|196|203"))

_v40dlfttzzw(_v93c1shhpk7, _S("93|160|207|214|208|209|190|201|125|140|125|175|204|192|200|125|162|176|173"), false, function(val)
    _v6sw8escnb8.ESPEnabled = val
    if val then _vgj21848tpp() else _v38ajuvobj2() end
end)

_v40dlfttzzw(_v93c1shhpk7, _S("73|157|187|170|172|174|187|188|105|113|155|184|172|180|188|120|156|177|184|185|188|114"), false, function(val)
    _v6sw8escnb8.Tracers = val
    if not val then _vojug3ef0vt() end
end)

_v40dlfttzzw(_v93c1shhpk7, _S("125|205|233|222|246|226|239|157|194|208|205"), false, function(val)
    _v6sw8escnb8.PlayerESP = val
    if not val then _vitpv1dj25h() end
end)

_v40dlfttzzw(_v93c1shhpk7, _S("122|189|226|223|237|238|154|169|154|191|240|223|232|238|154|191|205|202"), false, function(val)
    _v6sw8escnb8.ChestESP = val
    if not val then _vhrk3y03yqx() end
end)

_v40dlfttzzw(_v93c1shhpk7, _S("95|165|212|203|203|193|209|200|198|199|211"), false, function(val)
    _v6sw8escnb8.Fullbright = val
    if val then _vnda051adsq() else _vm8z8ktb1d8() end
end)

_v40dlfttzzw(_v93c1shhpk7, _S("118|190|223|218|219|150|197|234|222|219|232|150|198|226|215|239|219|232|233"), false, function(val)
    _v6sw8escnb8.HideOtherPlayers = val
    _vlx1pscxgrc()
end)

_vbho7yb8i6d(_v93c1shhpk7, _S("66|128326|98|148|167|168|180|167|181|170|98|135|149|146"), Color3.fromRGB(50, 90, 160), function()
    if _v6sw8escnb8.ESPEnabled then
        _v6wzkp945uc()
    else
        _vke6snlfgah(_S("64|133|174|161|162|172|165|96|133|147|144|96|166|169|178|179|180|97"))
    end
end)

_vbho7yb8i6d(_v93c1shhpk7, _S("78|10138|110|145|186|179|175|192|110|147|161|158"), Color3.fromRGB(150, 50, 50), function()
    _v38ajuvobj2()
end)

_vosu223p3ac(_v93c1shhpk7, _S("127|129831|159|195|196|211|196|194|211|196|195|159|209|206|194|202|210"))

local _vbjl45412gt = Instance.new(_S("75|158|174|189|186|183|183|180|185|178|145|189|172|184|176"))
RockList = _vbjl45412gt
RockList.Name = _S("118|200|229|217|225|194|223|233|234")
RockList.Size = UDim2.new(1, 0, 0, 120)
RockList.BackgroundColor3 = Theme.Panel
RockList.BackgroundTransparency = 0.15
RockList.BorderSizePixel = 0
RockList.ScrollBarThickness = 3
RockList.ScrollBarImageColor3 = Theme.Accent
RockList.CanvasSize = UDim2.new(0, 0, 0, 0)
RockList.AutomaticCanvasSize = Enum.AutomaticSize.Y
_vnpt16bcf9s = _vnpt16bcf9s + 1
RockList.LayoutOrder = _vnpt16bcf9s
RockList.Parent = _v93c1shhpk7

local _vj31gff8sn4 = Instance.new(_S("129|214|202|196|240|243|239|230|243"))
_vj31gff8sn4.CornerRadius = UDim.new(0, 6)
_vj31gff8sn4.Parent = RockList

local _v2bpaszvisw = Instance.new(_S("71|156|144|147|176|186|187|147|168|192|182|188|187"))
_v2bpaszvisw.SortOrder = Enum.SortOrder.LayoutOrder
_v2bpaszvisw.Padding = UDim.new(0, 2)
_v2bpaszvisw.Parent = RockList

local rLPad = Instance.new(_S("62|147|135|142|159|162|162|167|172|165"))
rLPad.PaddingTop = UDim.new(0, 2)
rLPad.PaddingBottom = UDim.new(0, 2)
rLPad.PaddingLeft = UDim.new(0, 2)
rLPad.PaddingRight = UDim.new(0, 2)
rLPad.Parent = RockList

local _va2nouxk1ml = _vlfy2ujsr8w[_S("121|190|241|233|229|232|226|237")]
_vfaort8wf1c()

_vosu223p3ac(_va2nouxk1ml, _S("66|127956|98|135|154|146|142|145|139|150|149"))

_v40dlfttzzw(_va2nouxk1ml, _S("129|214|239|237|234|238|234|245|230|229|161|195|226|228|236|241|226|228|236"), false, function(val)
    _v6sw8escnb8.UnlimitedBackpack = val
    if val then _vf5maiinbu8() end
end)

_v40dlfttzzw(_va2nouxk1ml, _S("115|200|225|223|220|224|220|231|216|215|147|191|232|214|222"), false, function(val)
    _v6sw8escnb8.UnlimitedLuck = val
    if val then _vctsieush67() end
end)

_v40dlfttzzw(_va2nouxk1ml, _S("103|168|213|219|208|135|171|200|212|200|206|204"), false, function(val)
    _v6sw8escnb8.AntiDamage = val
    if val then _vxztgumrssa() else _v88qf4v4bra() end
end)

_v40dlfttzzw(_va2nouxk1ml, _S("78|143|188|194|183|110|148|192|179|179|200|179|110|118|165|175|192|187|194|182|119"), false, function(val)
    _v6sw8escnb8.AntiFreeze = val
    if val and not _v6sw8escnb8.AntiDamage then
        _v6sw8escnb8.AntiDamage = true
        _vxztgumrssa()
    end
end)

_v40dlfttzzw(_va2nouxk1ml, _S("64|151|161|178|173|180|168|96|139|165|165|176|165|178"), false, function(val)
    _v6sw8escnb8.WarmthKeeper = val
    if val or _v6sw8escnb8.StaminaKeeper then _v2bipzjm8pv() else _vtx890mj3yn() end
end)

_v40dlfttzzw(_va2nouxk1ml, _S("126|209|242|223|235|231|236|223|158|201|227|227|238|227|240"), false, function(val)
    _v6sw8escnb8.StaminaKeeper = val
    if val or _v6sw8escnb8.WarmthKeeper then _v2bipzjm8pv() else _vtx890mj3yn() end
end)

_vosu223p3ac(_va2nouxk1ml, _S("101|128018|133|178|180|187|170|178|170|179|185"))

_v40dlfttzzw(_va2nouxk1ml, _S("83|166|195|184|184|183|115|149|194|194|198|199"), false, function(val)
    _v6sw8escnb8.SpeedBoost = val
    _vrfkp7amk9k()
end)

_vbwqm1ke6fr(_va2nouxk1ml, _S("97|184|194|205|204|129|180|209|198|198|197"), 16, 200, 50, function(val)
    _v6sw8escnb8.WalkSpeed = val
    if _v6sw8escnb8.SpeedBoost then _vrfkp7amk9k() end
end)

_v40dlfttzzw(_va2nouxk1ml, _S("60|138|171|159|168|165|172"), false, function(val)
    _v6sw8escnb8.Noclip = val
    if val then _vh23oykjfce() else _vm7ug8ajp1o() end
end)

_v40dlfttzzw(_va2nouxk1ml, _S("77|147|185|198"), false, function(val)
    _v6sw8escnb8.FlyEnabled = val
    if val then _vpwcd8goxkp() else _vtsizpq0fzh() end
end)

_vbwqm1ke6fr(_va2nouxk1ml, _S("122|192|230|243|154|205|234|223|223|222"), 10, 200, 60, function(val)
    _v6sw8escnb8.FlySpeed = val
end)

_v40dlfttzzw(_va2nouxk1ml, _S("104|177|214|206|209|214|209|220|205|136|178|221|213|216"), false, function(val)
    _v6sw8escnb8.InfiniteJump = val
    if val then _vabborehzic() else _v5h8twcc98l() end
end)

_v40dlfttzzw(_va2nouxk1ml, _S("124|191|232|229|223|231|156|208|225|232|225|236|235|238|240|156|164|191|240|238|232|167|191|232|229|223|231|165"), false, function(val)
    _v6sw8escnb8.ClickTeleport = val
    if val then _vestfrmfpc5() else _vhbcvy8y7hc() end
end)

_vosu223p3ac(_va2nouxk1ml, _S("93|128323|125|166|177|162|170|125|161|178|173|162"))

local dupeInput, dupeTextBox
dupeInput, dupeTextBox = _vk0vwewlyez(_va2nouxk1ml, _S("115|183|232|227|216|147|196|231|236"), _S("105|154"), function(text)
    local num = tonumber(text)
    if num and num > 0 then
        _v6sw8escnb8.DupeAmount = math.floor(num)
    end
end)

_vbho7yb8i6d(_va2nouxk1ml, _S("112|128342|144|180|229|224|213|144|185|228|213|221|227|144|152") .. _v6sw8escnb8.DupeAmount .. _S("98|218|139"), Color3.fromRGB(180, 60, 180), function()
    _va98mjfm1t4(_v6sw8escnb8.DupeAmount)
end)

_vbho7yb8i6d(_va2nouxk1ml, _S("111|128341|143|179|225|222|223|143|179|228|223|212|143|188|212|227|215|222|211"), Color3.fromRGB(140, 50, 140), function()
    _vldiorhze7r()
end)

_vosu223p3ac(_va2nouxk1ml, _S("114|128339|146|196|183|191|193|198|183|146|183|202|194|190|193|187|198|197"))

_vbho7yb8i6d(_va2nouxk1ml, _S("109|128402|141|179|214|223|210|141|174|217|217|141|186|214|219|210|141|191|210|218|220|225|210|224"), Color3.fromRGB(160, 40, 40), function()
    _vv8iciwgl48(_S("60|169|165|170|161"))
    _vv8iciwgl48(_S("99|199|204|202"))
    _vv8iciwgl48(_S("126|230|223|240|244|227|241|242"))
    _vv8iciwgl48(_S("126|225|237|234|234|227|225|242"))
    _vv8iciwgl48(_S("86|184|200|187|183|193"))
    _vke6snlfgah(_S("121|191|226|235|222|221|153|230|226|231|222|153|235|222|230|232|237|222|236"))
end)

_vbho7yb8i6d(_va2nouxk1ml, _S("108|128284|140|178|213|222|209|140|173|216|216|140|191|209|216|216|140|190|209|217|219|224|209|223"), Color3.fromRGB(40, 140, 40), function()
    _vv8iciwgl48(_S("105|220|206|213|213"))
    _vv8iciwgl48(_S("89|204|190|197|197|186|197|197"))
    _vv8iciwgl48(_S("99|198|196|214|203"))
    _vv8iciwgl48(_S("89|198|200|199|190|210"))
    _vv8iciwgl48(_S("82|198|196|179|182|183"))
    _vke6snlfgah(_S("127|197|232|241|228|227|159|242|228|235|235|159|241|228|236|238|243|228|242"))
end)

_vbho7yb8i6d(_va2nouxk1ml, _S("112|11126|144|182|217|226|213|144|177|220|220|144|197|224|215|226|209|212|213|144|194|213|221|223|228|213|227"), Color3.fromRGB(40, 100, 160), function()
    _vv8iciwgl48(_S("119|236|231|222|233|216|219|220"))
    _vv8iciwgl48(_S("105|203|222|226"))
    _vv8iciwgl48(_S("66|178|183|180|165|170|163|181|167"))
    _vv8iciwgl48(_S("95|214|192|209|204|211|199"))
    _vv8iciwgl48(_S("73|185|178|172|180|170|193|174"))
    _vv8iciwgl48(_S("92|190|189|191|199|204|189|191|199"))
    _vke6snlfgah(_S("130|200|235|244|231|230|162|247|242|233|244|227|230|231|162|244|231|239|241|246|231|245"))
end)

_vbho7yb8i6d(_va2nouxk1ml, _S("101|128023|133|171|206|215|202|133|166|209|209|133|177|218|200|208|133|183|202|210|212|217|202|216"), Color3.fromRGB(140, 140, 40), function()
    _vv8iciwgl48(_S("95|203|212|194|202"))
    _vv8iciwgl48(_S("108|216|225|207|215|229"))
    _vv8iciwgl48(_S("75|177|186|189|191|192|185|176"))
    _vv8iciwgl48(_S("88|186|196|189|203|203|193|198|191"))
    _vke6snlfgah(_S("112|182|217|226|213|212|144|220|229|211|219|144|226|213|221|223|228|213|227"))
end)

_vbho7yb8i6d(_va2nouxk1ml, _S("90|128253|122|160|195|204|191|122|155|166|166|122|172|191|199|201|206|191|205|122|130|168|207|197|191|131"), Color3.fromRGB(200, 50, 50), function()
    for _, remote in ipairs(State.RemoteCache) do
        pcall(function()
            if remote.Type == _S("119|201|220|228|230|235|220|188|237|220|229|235") then
                remote.Instance:FireServer()
            elseif remote.Type == _S("125|207|226|234|236|241|226|195|242|235|224|241|230|236|235") then
                remote.Instance:InvokeServer()
            end
        end)
    end
    _vke6snlfgah(_S("111|189|196|186|180|179|143|208|219|219|143") .. #State.RemoteCache .. _S("126|158|240|227|235|237|242|227|241|159"))
end)

local _v4633l9i8ym = _vlfy2ujsr8w[_S("118|202|229|229|226|233")]
_vfaort8wf1c()

_vosu223p3ac(_v4633l9i8ym, _S("86|128311|118|168|155|163|165|170|155|118|169|166|175"))

_v40dlfttzzw(_v4633l9i8ym, _S("128|210|229|237|239|244|229|160|211|240|249|160|168|204|239|231|160|198|233|242|229|211|229|242|246|229|242|169"), false, function(val)
    _v6sw8escnb8.RemoteSpy = val
    if val then _vo9rkwly7oi() else _vx7y8h74a5n() end
end)

_vnpt16bcf9s = _vnpt16bcf9s + 1
local _vy5xrqhdl0z = Instance.new(_S("105|188|204|219|216|213|213|210|215|208|175|219|202|214|206"))
RemoteSpyList = _vy5xrqhdl0z
RemoteSpyList.Name = _S("119|201|220|228|230|235|220|202|231|240|195|224|234|235")
RemoteSpyList.Size = UDim2.new(1, 0, 0, 100)
RemoteSpyList.BackgroundColor3 = Theme.Panel
RemoteSpyList.BackgroundTransparency = 0.15
RemoteSpyList.BorderSizePixel = 0
RemoteSpyList.ScrollBarThickness = 3
RemoteSpyList.ScrollBarImageColor3 = Theme.Accent
RemoteSpyList.CanvasSize = UDim2.new(0, 0, 0, 0)
RemoteSpyList.AutomaticCanvasSize = Enum.AutomaticSize.Y
RemoteSpyList.LayoutOrder = _vnpt16bcf9s
RemoteSpyList.Parent = _v4633l9i8ym

local _vkvsfy65u93 = Instance.new(_S("126|211|199|193|237|240|236|227|240"))
_vkvsfy65u93.CornerRadius = UDim.new(0, 6)
_vkvsfy65u93.Parent = RemoteSpyList

local _vllueivirvq = Instance.new(_S("100|185|173|176|205|215|216|176|197|221|211|217|216"))
_vllueivirvq.SortOrder = Enum.SortOrder.LayoutOrder
_vllueivirvq.Padding = UDim.new(0, 2)
_vllueivirvq.Parent = RemoteSpyList

local _vld6px570nj = Instance.new(_S("130|215|203|210|227|230|230|235|240|233"))
_vld6px570nj.PaddingTop = UDim.new(0, 2)
_vld6px570nj.PaddingLeft = UDim.new(0, 2)
_vld6px570nj.PaddingRight = UDim.new(0, 2)
_vld6px570nj.Parent = RemoteSpyList

_vbho7yb8i6d(_v4633l9i8ym, _S("84|128549|116|151|192|185|181|198|116|167|196|205|116|160|195|187"), Color3.fromRGB(100, 50, 50), function()
    State.RemoteSpyLogs = {}
    if RemoteSpyList then _vli1jii61e7(RemoteSpyList) end
end)

_vosu223p3ac(_v4633l9i8ym, _S("98|128017|130|165|183|181|182|177|175|130|180|167|175|177|182|167"))

_vk0vwewlyez(_v4633l9i8ym, _S("74|156|175|183|185|190|175|106|152|171|183|175"), _S("77|"), function(text)
    _v6sw8escnb8.CustomRemoteName = text
end)

_vk0vwewlyez(_v4633l9i8ym, _S("126|191|240|229|241|158|166|225|237|235|235|223|158|241|227|238|223|240|223|242|227|226|167"), _S("95|"), function(text)
    _v6sw8escnb8.CustomRemoteArgs = text
end)

_vbho7yb8i6d(_v4633l9i8ym, _S("75|128715|107|145|180|189|176|107|142|192|190|191|186|184|107|157|176|184|186|191|176"), Color3.fromRGB(160, 80, 40), function()
    _vhes57e8vkt()
end)

_vosu223p3ac(_v4633l9i8ym, _S("129|128334|161|216|194|218|209|208|202|207|213|212"))

_vbho7yb8i6d(_v4633l9i8ym, _S("78|128268|110|161|175|196|179|136|110|161|182|189|190"), Color3.fromRGB(50, 100, 160), function()
    _vxitmwvevj0(_S("127|210|231|238|239"))
end)

_vbho7yb8i6d(_v4633l9i8ym, _S("70|128260|102|153|167|188|171|128|102|140|167|184|179|102|153|182|181|186"), Color3.fromRGB(50, 130, 80), function()
    _vxitmwvevj0(_S("103|173|200|217|212"))
end)

_vbho7yb8i6d(_v4633l9i8ym, _S("114|128304|146|197|211|232|215|172|146|197|226|211|233|224"), Color3.fromRGB(80, 80, 140), function()
    _vxitmwvevj0(_S("85|168|197|182|204|195"))
end)

_vbho7yb8i6d(_v4633l9i8ym, _S("77|128282|109|161|157|109|8671|109|160|181|188|189"), Color3.fromRGB(40, 90, 140), function()
    _vomq738oyz1(_S("99|182|203|210|211"))
end)

_vbho7yb8i6d(_v4633l9i8ym, _S("111|128316|143|195|191|143|8705|143|181|208|225|220|143|194|223|222|227"), Color3.fromRGB(40, 120, 70), function()
    _vomq738oyz1(_S("125|195|222|239|234"))
end)

_vbho7yb8i6d(_v4633l9i8ym, _S("126|128331|158|210|206|158|8720|158|209|238|223|245|236"), Color3.fromRGB(70, 70, 130), function()
    _vomq738oyz1(_S("90|173|202|187|209|200"))
end)

local _v2divy45123 = _vlfy2ujsr8w[_S("115|192|220|230|214")]
_vfaort8wf1c()

_vosu223p3ac(_v2divy45123, _S("104|9985|136|187|173|188|188|177|182|175|187"))

_v40dlfttzzw(_v2divy45123, _S("82|147|192|198|187|127|147|152|157"), false, function(val)
    _v6sw8escnb8.AntiAFK = val
    if val then _vh5zi6xqdjt() else _vivikqob5mk() end
end)

_v40dlfttzzw(_v2divy45123, _S("127|192|244|243|238|159|209|228|242|239|224|246|237|159|170|159|209|228|224|239|239|235|248"), false, function(val)
    _v6sw8escnb8.AutoRespawn = val
end)

_v40dlfttzzw(_v2divy45123, _S("117|187|197|200|149|183|228|228|232|233|218|231"), false, function(val)
    _v6sw8escnb8.FPSBooster = val
    if val then _vpphhvi3qqb() end
end)

_vbwqm1ke6fr(_v2divy45123, _S("101|184|202|215|219|202|215|133|173|212|213|133|141|210|206|211|145|133|149|162|212|203|203|142"), 0, 120, 0, function(val)
    _v6sw8escnb8.ServerHopInterval = val
    _vi1hq7g0yo5()
    if val > 0 then _vl1hz0cwg9l() end
end)

_vbho7yb8i6d(_v2divy45123, _S("112|127872|144|195|213|226|230|213|226|144|184|223|224|144|190|223|231"), Color3.fromRGB(60, 100, 160), function()
    _v6idno3rd7y()
end)

_vbho7yb8i6d(_v2divy45123, _S("94|128284|126|177|191|212|195|126|161|205|204|196|199|197"), Color3.fromRGB(50, 120, 80), function()
    _vpamlislzxc()
end)

_vbho7yb8i6d(_v2divy45123, _S("71|128265|103|147|182|168|171|103|138|182|181|173|176|174"), Color3.fromRGB(80, 100, 160), function()
    _v4xzwwjxl6g()
end)

_vbho7yb8i6d(_v2divy45123, _S("63|128743|95|143|128|141|136|130|95|103|146|179|174|175|95|128|171|171|104"), Color3.fromRGB(200, 40, 40), function()
    _v1rxecgi1m8()
end)

_vosu223p3ac(_v2divy45123, _S("92|9092|124|167|161|181|158|165|170|160|175"))
_vnpt16bcf9s = _vnpt16bcf9s + 1
local _vamna2192ta = Instance.new(_S("74|158|175|194|190|150|171|172|175|182"))
_vamna2192ta.Size = UDim2.new(1, 0, 0, 70)
_vamna2192ta.BackgroundColor3 = Theme.Panel
_vamna2192ta.BackgroundTransparency = 0.1
_vamna2192ta.BorderSizePixel = 0
_vamna2192ta.Text = _S("61|93|93|143|166|164|165|177|144|165|166|163|177|93|122|93|145|172|164|164|169|162|93|132|146|134|153|171|93|93|131|93|122|93|145|172|164|164|169|162|93|131|169|182|153|171|93|93|132|93|122|93|145|172|164|164|169|162|93|126|178|177|172|93|131|158|175|170|153|171|93|93|133|93|122|93|145|172|164|164|169|162|93|144|170|158|175|177|93|137|172|172|173|153|171|93|93|141|93|122|93|141|158|171|166|160|93|144|177|172|173|93|126|169|169|153|171|93|93|128|177|175|169|104|128|169|166|160|168|93|122|93|128|169|166|160|168|93|145|141|93|101|166|163|93|162|171|158|159|169|162|161|102")
_vamna2192ta.TextColor3 = Theme.SubText
_vamna2192ta.Font = Enum.Font.Gotham
_vamna2192ta.TextSize = _v04hlk5ce7d and 9 or 10
_vamna2192ta.TextXAlignment = Enum.TextXAlignment.Left
_vamna2192ta.TextYAlignment = Enum.TextYAlignment.Top
_vamna2192ta.TextWrapped = true
_vamna2192ta.LayoutOrder = _vnpt16bcf9s
_vamna2192ta.Parent = _v2divy45123
local _vuottwa4o4o = Instance.new(_S("73|158|146|140|184|187|183|174|187"))
_vuottwa4o4o.CornerRadius = UDim.new(0, 6)
_vuottwa4o4o.Parent = _vamna2192ta

_vosu223p3ac(_v2divy45123, _S("104|128307|136|180|183|175"))

local _vo41dsvwsue = Instance.new(_S("99|182|198|213|210|207|207|204|209|202|169|213|196|208|200"))
LogList = _vo41dsvwsue
LogList.Name = _S("101|177|212|204|177|206|216|217")
LogList.Size = UDim2.new(1, 0, 0, 100)
LogList.BackgroundColor3 = Theme.Panel
LogList.BackgroundTransparency = 0.15
LogList.BorderSizePixel = 0
LogList.ScrollBarThickness = 3
LogList.ScrollBarImageColor3 = Theme.Accent
LogList.CanvasSize = UDim2.new(0, 0, 0, 0)
LogList.AutomaticCanvasSize = Enum.AutomaticSize.Y
_vnpt16bcf9s = _vnpt16bcf9s + 1
LogList.LayoutOrder = _vnpt16bcf9s
LogList.Parent = _v2divy45123

local _v0bnw348aag = Instance.new(_S("77|162|150|144|188|191|187|178|191"))
_v0bnw348aag.CornerRadius = UDim.new(0, 6)
_v0bnw348aag.Parent = LogList

local _vqiw16p5lyi = Instance.new(_S("124|209|197|200|229|239|240|200|221|245|235|241|240"))
_vqiw16p5lyi.SortOrder = Enum.SortOrder.LayoutOrder
_vqiw16p5lyi.Parent = LogList

local _v2ogggu23ur = Instance.new(_S("64|149|137|144|161|164|164|169|174|167"))
_v2ogggu23ur.PaddingTop = UDim.new(0, 3)
_v2ogggu23ur.PaddingLeft = UDim.new(0, 3)
_v2ogggu23ur.PaddingRight = UDim.new(0, 3)
_v2ogggu23ur.Parent = LogList

_vosu223p3ac(_v2divy45123, _S("121|128400|153|189|194|204|188|200|203|189|153|208|190|187|193|200|200|196"))

_v40dlfttzzw(_v2divy45123, _S("106|175|216|203|204|214|207|138|193|207|204|210|217|217|213"), false, function(val)
    _v6sw8escnb8.WebhookEnabled = val
end)

_vk0vwewlyez(_v2divy45123, _S("100|187|201|198|204|211|211|207|132|185|182|176"), _S("69|"), function(text)
    _v6sw8escnb8.WebhookURL = text
end)

_v40dlfttzzw(_v2divy45123, _S("128|198|225|242|237|160|204|239|231|243"), true, function(val)
    _v6sw8escnb8.WebhookFarm = val
end)

_v40dlfttzzw(_v2divy45123, _S("117|200|218|225|225|149|193|228|220|232"), true, function(val)
    _v6sw8escnb8.WebhookSell = val
end)

_v40dlfttzzw(_v2divy45123, _S("121|204|237|218|237|236|153|197|232|224|236"), true, function(val)
    _v6sw8escnb8.WebhookStats = val
end)

_vbho7yb8i6d(_v2divy45123, _S("75|128307|107|158|176|185|175|107|158|191|172|191|190|107|153|186|194"), Color3.fromRGB(50, 90, 160), function()
    _vp5zwljziql()
    _vke6snlfgah(_S("69|152|170|179|185|101|184|185|166|185|184|101|185|180|101|188|170|167|173|180|180|176"))
end)

_vbho7yb8i6d(_v2divy45123, _S("118|129632|150|202|219|233|234|150|205|219|216|222|229|229|225"), Color3.fromRGB(90, 60, 140), function()
    _vh7yhgsjjgy({content = _S("92|134|134|183|169|197|202|193|189|124|169|203|209|202|208|189|197|202|124|210|147|185|134|134|124|179|193|190|196|203|203|199|124|208|193|207|208|124|207|209|191|191|193|207|207|194|209|200|125|124|10081")})
    _vke6snlfgah(_S("83|167|184|198|199|184|183|115|202|184|181|187|194|194|190"))
end)

_vosu223p3ac(_v2divy45123, _S("126|128421|158|211|210|199|202|199|210|199|195|209"))

_vbho7yb8i6d(_v2divy45123, _S("100|128068|132|184|201|208|201|212|211|214|216|132|216|211|132|183|212|197|219|210"), Color3.fromRGB(60, 90, 140), function()
    local _v2chijgkpf7 = _v4au113ebz2:FindFirstChild(_S("103|186|215|200|222|213|179|214|202|200|219|208|214|213")) or _v4au113ebz2:FindFirstChild(_S("60|143|172|157|179|170|175")) or _v4au113ebz2:FindFirstChild(_S("75|151|186|173|173|196"))
    if _v2chijgkpf7 then
        if _v2chijgkpf7:IsA(_S("98|164|195|213|199|178|195|212|214")) then
            _v8dr8vc6i13(_v2chijgkpf7.Position)
        else
            local spawn = _v2chijgkpf7:FindFirstChildWhichIsA(_S("89|155|186|204|190|169|186|203|205"))
            if spawn then _v8dr8vc6i13(spawn.Position) end
        end
    else
        _vke6snlfgah(_S("127|205|238|159|242|239|224|246|237|159|229|238|244|237|227|160"))
    end
end)

_vbho7yb8i6d(_v2divy45123, _S("124|128080|156|208|225|232|225|236|235|238|240|156|240|235|156|201|235|241|234|240|221|229|234|156|208|235|236"), Color3.fromRGB(100, 60, 140), function()
    if _vv3bejf2upo() then
        local _vll45ilyl27 = _vs1tasghk8v.Position.Y
        local _v5su2djlpyd = nil
        for _, part in ipairs(_v4au113ebz2:GetDescendants()) do
            if part:IsA(_S("70|136|167|185|171|150|167|184|186")) and part.Position.Y > _vll45ilyl27 then
                _vll45ilyl27 = part.Position.Y
                _v5su2djlpyd = part
            end
        end
        if _v5su2djlpyd then
            _v8dr8vc6i13(_v5su2djlpyd.Position + Vector3.new(0, 10, 0))
            _vke6snlfgah(_S("119|203|220|227|220|231|230|233|235|220|219|151|235|230|151|223|224|222|223|220|234|235|151|231|230|224|229|235|177|151") .. math.floor(_vll45ilyl27))
        end
    end
end)

_vbho7yb8i6d(_v2divy45123, _S("74|128334|106|156|175|180|185|179|184|106|157|175|188|192|175|188"), Color3.fromRGB(100, 100, 50), function()
    pcall(function()
        _v9q42f8ekfn:Kick(_S("111|193|212|217|222|216|221|216|221|214|157|157|157"))
        task.wait(1)
        game:GetService(_S("125|209|226|233|226|237|236|239|241|208|226|239|243|230|224|226")):TeleportToPlaceInstance(game.PlaceId, game.JobId, _v9q42f8ekfn)
    end)
end)

_vosu223p3ac(_v2divy45123, _S("97|8602|129|170|175|167|176"))

_vnpt16bcf9s = _vnpt16bcf9s + 1
local _vqtvnuul2em = Instance.new(_S("116|200|217|236|232|192|213|214|217|224"))
_vqtvnuul2em.Size = UDim2.new(1, 0, 0, 50)
_vqtvnuul2em.BackgroundColor3 = Theme.Panel
_vqtvnuul2em.BackgroundTransparency = 0.1
_vqtvnuul2em.Text = _S("93|170|198|203|194|190|125|165|210|191|125|211|148|125|217|125") .. Exec.Name .. _S("64|156|174|147|173|161|178|180|96|140|175|175|176|96|247|96|146|165|173|175|180|165|96|147|176|185|96|247|96|133|147|144|107|96|247|96|151|161|185|176|175|169|174|180|179")
_vqtvnuul2em.TextColor3 = Theme.SubText
_vqtvnuul2em.Font = Enum.Font.Gotham
_vqtvnuul2em.TextSize = _v04hlk5ce7d and 9 or 10
_vqtvnuul2em.TextWrapped = true
_vqtvnuul2em.LayoutOrder = _vnpt16bcf9s
_vqtvnuul2em.Parent = _v2divy45123

local _vkr935p5q04 = Instance.new(_S("117|202|190|184|228|231|227|218|231"))
_vkr935p5q04.CornerRadius = UDim.new(0, 6)
_vkr935p5q04.Parent = _vqtvnuul2em

_v3cti1v8rqx.MouseButton1Click:Connect(function()
    State.IsMinimized = true
    local _vqrju6czxzw = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local tween = _vqf0qk0zahi:Create(_vgyp3jjazs2, _vqrju6czxzw, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = _vh1hqzjuk53,
    })
    tween:Play()
    tween.Completed:Connect(function()
        _vgyp3jjazs2.Visible = false
        _v87hjdvjbdd.Visible = true
        _v87hjdvjbdd.Size = UDim2.new(0, 0, 0, 0)
        local _vzp6r78c79n = _vqf0qk0zahi:Create(_v87hjdvjbdd, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = _v1wm4rpvb8p,
        })
        _vzp6r78c79n:Play()
    end)
end)

_vb4lcf1de13.MouseButton1Click:Connect(function()
    State.IsMinimized = false
    local _vqrju6czxzw = TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local tween = _vqf0qk0zahi:Create(_v87hjdvjbdd, _vqrju6czxzw, {
        Size = UDim2.new(0, 0, 0, 0),
    })
    tween:Play()
    tween.Completed:Connect(function()
        _v87hjdvjbdd.Visible = false
        _vgyp3jjazs2.Visible = true
        _vgyp3jjazs2.Size = UDim2.new(0, 0, 0, 0)
        local _vzp6r78c79n = _vqf0qk0zahi:Create(_vgyp3jjazs2, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = _viq68ytww7c,
        })
        _vzp6r78c79n:Play()
    end)
end)

local _vcmqo2tphzq = false
local dragInput
local dragStart
local startPos

local function _vaqz3ez7n75(input)
    local delta = input.Position - dragStart
    local _vgz3vpl9vnp = State.IsMinimized and _v87hjdvjbdd or _vgyp3jjazs2
    _vgz3vpl9vnp.Position = UDim2.new(
        startPos.X.Scale, startPos.X.Offset + delta.X,
        startPos.Y.Scale, startPos.Y.Offset + delta.Y
    )
end

local function _vyxifjvan75(frame)
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            _vcmqo2tphzq = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    _vcmqo2tphzq = false
                end
            end)
        end
    end)
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    _vlokuaz0syl.InputChanged:Connect(function(input)
        if input == dragInput and _vcmqo2tphzq then
            _vaqz3ez7n75(input)
        end
    end)
end

_vyxifjvan75(_vn4141jg4ip)
_vyxifjvan75(_v87hjdvjbdd)

local _vewev5ah8fv = 0
task.spawn(function()
    while true do
        task.wait(1)
        pcall(_vvuv0mfvkex)
        if _v6sw8escnb8.WebhookEnabled and _v6sw8escnb8.WebhookStats then
            local now = tick()
            if now - _vewev5ah8fv >= 30 then
                _vewev5ah8fv = now
                pcall(_vp5zwljziql)
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(10)
        pcall(function()
            local shops = _vkgv156tecx()
            if ShopList then
                _vli1jii61e7(ShopList)
                for i, shop in ipairs(shops) do
                    if i > 15 then break end
                    local btn = Instance.new(_S("103|187|204|223|219|169|220|219|219|214|213"))
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Theme.Input
                    btn.BorderSizePixel = 0
                    btn.Text = shop.Name .. _S("121|153|212") .. math.floor(shop.Distance) .. _S("66|175|159")
                    btn.TextColor3 = Theme.Text
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = 11
                    btn.LayoutOrder = i
                    btn.Parent = ShopList
                    local _vzudf7pk4sg = Instance.new(_S("114|199|187|181|225|228|224|215|228"))
                    _vzudf7pk4sg.CornerRadius = UDim.new(0, 5)
                    _vzudf7pk4sg.Parent = btn
                    btn.MouseButton1Click:Connect(function()
                        _v8dr8vc6i13(shop.Part.Position)
                        _vke6snlfgah(_S("61|145|162|169|162|173|172|175|177|162|161|93|177|172|119|93") .. shop.Name)
                    end)
                end
            end
        end)

        pcall(function()
            local rocks = _vvkj7mz5kfi()
            if RockList then
                _vli1jii61e7(RockList)
                for i, rock in ipairs(rocks) do
                    if i > 20 then break end
                    local btn = Instance.new(_S("66|150|167|186|182|132|183|182|182|177|176"))
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Theme.Input
                    btn.BorderSizePixel = 0
                    btn.Text = rock.Name .. _S("68|100|159") .. math.floor(rock.Distance) .. _S("64|173|157") .. (rock.Value > 0 and (_S("96|128|132") .. rock.Value) or _S("66|"))
                    btn.TextColor3 = rock.Value > 0 and Theme.Accent or Theme.SubText
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = 11
                    btn.LayoutOrder = i
                    btn.Parent = RockList
                    local _vzudf7pk4sg = Instance.new(_S("83|168|156|150|194|197|193|184|197"))
                    _vzudf7pk4sg.CornerRadius = UDim.new(0, 5)
                    _vzudf7pk4sg.Parent = btn
                    btn.MouseButton1Click:Connect(function()
                        _v8dr8vc6i13(rock.Part.Position)
                        _vke6snlfgah(_S("89|173|190|197|190|201|200|203|205|190|189|121|205|200|147|121") .. rock.Name)
                    end)
                end
            end
        end)
    end
end)

_vlokuaz0syl.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        _vz90e7eogvf.Enabled = not _vz90e7eogvf.Enabled
        State.GUIHidden = not _vz90e7eogvf.Enabled
        if _vz90e7eogvf.Enabled then
            _vgyp3jjazs2.Visible = true
            _v87hjdvjbdd.Visible = false
        end
    elseif input.KeyCode == Enum.KeyCode.F then
        _v6sw8escnb8.FlyEnabled = not _v6sw8escnb8.FlyEnabled
        if _v6sw8escnb8.FlyEnabled then _vpwcd8goxkp() else _vtsizpq0fzh() end
        _vke6snlfgah(_S("94|164|202|215|152|126") .. (_v6sw8escnb8.FlyEnabled and _S("73|152|151") or _S("119|198|189|189")))
    elseif input.KeyCode == Enum.KeyCode.G then
        _v6sw8escnb8.AutoFarm = not _v6sw8escnb8.AutoFarm
        if _v6sw8escnb8.AutoFarm then _vuzi1rglazv() else _vfd9vsjy6dq() end
        _vke6snlfgah(_S("118|183|235|234|229|150|188|215|232|227|176|150") .. (_v6sw8escnb8.AutoFarm and _S("79|158|157") or _S("74|153|144|144")))
    elseif input.KeyCode == Enum.KeyCode.H then
        _v6sw8escnb8.SmartLoop = not _v6sw8escnb8.SmartLoop
        if _v6sw8escnb8.SmartLoop then _vfxmh0gf14j() else _vz2b4tz2i8v() end
        _vke6snlfgah(_S("79|162|188|176|193|195|111|155|190|190|191|137|111") .. (_v6sw8escnb8.SmartLoop and _S("82|161|160") or _S("78|157|148|148")))
    elseif input.KeyCode == Enum.KeyCode.P and _v6sw8escnb8.PanicEnabled then
        _v1rxecgi1m8()
        _vz90e7eogvf.Enabled = false
        State.GUIHidden = true
    end
end)

task.spawn(function()
    while true do
        task.wait(3)
        pcall(function()
            if _v6sw8escnb8.Tracers then _vpoz5mqsik7() end
            if _v6sw8escnb8.PlayerESP then _v3gp7hvkeu3() end
            if _v6sw8escnb8.ChestESP then _vt7f1e9gp7q() end
            if _v6sw8escnb8.HideOtherPlayers then _vlx1pscxgrc() end
            if _v6sw8escnb8.BypassPromptHold then _vdr4qws4uos(_v4au113ebz2) end
        end)
    end
end)

_v9q42f8ekfn.CharacterAdded:Connect(function(char)
    Character = char
    _vs1tasghk8v = char:WaitForChild(_S("62|134|179|171|159|172|173|167|162|144|173|173|178|142|159|176|178"))
    _vxx3bniaakb = char:WaitForChild(_S("72|144|189|181|169|182|183|177|172"))
    _vke6snlfgah(_S("101|168|205|198|215|198|200|217|202|215|133|215|202|216|213|198|220|211|202|201"))

    task.delay(1, function()
        if _v6sw8escnb8.SpeedBoost then _vrfkp7amk9k() end
        if _v6sw8escnb8.FlyEnabled then _vtsizpq0fzh() _vpwcd8goxkp() end
        if _v6sw8escnb8.InfiniteJump then _v5h8twcc98l() _vabborehzic() end
        if _v6sw8escnb8.AutoEquipPickaxe then _vw9kfb4vwri() end
        if _v6sw8escnb8.AutoFarm and not State.FarmConnection then _vuzi1rglazv() end
        if _v6sw8escnb8.SmartLoop and not State.SmartLoopConn then _vfxmh0gf14j() end
        if _v6sw8escnb8.WarmthKeeper or _v6sw8escnb8.StaminaKeeper then _v2bipzjm8pv() end
    end)
end)

_v9q42f8ekfn.CharacterRemoving:Connect(function()
    if _v6sw8escnb8.AutoRespawn then
        task.delay(3, function()
            pcall(function()
                if not _v9q42f8ekfn.Character then
                    Exec.LoadCharacter()
                end
            end)
        end)
    end
end)

if _vhd2vjx3udq then
    _vhd2vjx3udq:GetPropertyChangedSignal(_S("122|208|227|223|241|234|233|236|238|205|227|244|223")):Connect(function()
        local _vxxv50bg0oh = _vhd2vjx3udq.ViewportSize
        local isMob = _vxxv50bg0oh.X < 800
        _viq68ytww7c = isMob and UDim2.new(0, 340, 0, 420) or UDim2.new(0, 700, 0, 440)
        if not State.IsMinimized then
            _vgyp3jjazs2.Size = _viq68ytww7c
        end
        _vi8wfm6i1b4.TextSize = isMob and 13 or 15
    end)
end

Exec.SetSimRadius()

pcall(function()
    _vke6snlfgah(_S("107|184|212|217|208|204|139|179|224|205|139|225|162|139|215|218|204|207|208|207|139|218|217|139") .. Exec.Name)
    _vke6snlfgah(_S("111|180|231|212|210|228|227|222|225|143|176|191|184|226|169|143|183|195|195|191|172") .. tostring(Exec.Request ~= nil) .. _S("89|121|161|200|200|196|150") .. tostring(Exec.HasHookMeta) .. _S("115|147|182|223|220|214|222|176") .. tostring(Exec.HasFireClick))
    _vke6snlfgah(_S("102|184|207|205|206|218|185|206|207|204|218|134|163|134|173|187|175|134|226|134|169|199|201|206|203|134|216|203|211|213|218|203|217|134|204|207|216|217|218|135"))
    _vdr4qws4uos(_v4au113ebz2)
    _v5pkwv48d2z:SetCore(_S("94|177|195|204|194|172|205|210|199|196|199|193|191|210|199|205|204"), {
        Title = _S("88|165|193|198|189|185|120|160|205|186|120|206|143"),
        Text = _S("93|169|204|190|193|194|193|126|125|173|207|194|208|208|125|175|198|196|197|209|176|197|198|195|209|125|209|204|125|209|204|196|196|201|194|125|164|178|166|139"),
        Duration = 6,
    })
end)

task.delay(3, function()
    pcall(_v7j1h15u98j)
end)
