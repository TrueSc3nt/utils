--[[
    Mv6
    r4.2.1
]]
local _xD=function(s)local o=tonumber(s:match("^(%d+)%|"))local r=""for c in s:gmatch("(%d+)")do local n=tonumber(c)-o;if n>0 then r=r..string.char(n)end end;return r end
local _j0=4189;local _j1=3085
if math.floor(_j0/937)~=82 then _j1=_j0 end
local _j2=Instance.new("StringValue");_j2.Value=tostring(_j1+_j0)
local _j3=string.rep(tostring(_j1),2);if #_j3>100 then _j3=_j3:sub(1,50) end
local _j4=coroutine.wrap(function()return _j2.Value.._j3 end);_j4()
if type(_j2)~="Instance" then _j0=_j0+1 end

local Players = game:GetService(_xD("71|151|179|168|192|172|185|186"))
local ReplicatedStorage = game:GetService(_xD("44|126|145|156|152|149|143|141|160|145|144|127|160|155|158|141|147|145"))
local Workspace = game:GetService(_xD("84|171|195|198|191|199|196|181|183|185"))
local RunService = game:GetService(_xD("55|137|172|165|138|156|169|173|160|154|156"))
local TweenService = game:GetService(_xD("125|209|244|226|226|235|208|226|239|243|230|224|226"))
local UserInputService = game:GetService(_xD("72|157|187|173|186|145|182|184|189|188|155|173|186|190|177|171|173"))
local HttpService = game:GetService(_xD("52|124|168|168|164|135|153|166|170|157|151|153"))
local StarterGui = game:GetService(_xD("42|125|158|139|156|158|143|156|113|159|147"))
local Lighting = game:GetService(_xD("81|157|186|184|185|197|186|191|184"))

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild(_xD("47|119|164|156|144|157|158|152|147|129|158|158|163|127|144|161|163"))
local Humanoid = Character:WaitForChild(_xD("55|127|172|164|152|165|166|160|155"))

local _vfmg5kpn = {
    _c2li3eru = (false),
    _cwfws4b8 = (false),
    _cg3s4gld = (-1>0),
    _c2thgchu = (-1>0),
    _cpzc4900 = (not true),
    _c4dqc2td = (-1>0),
    _cq1te7c4 = (2<1),
    _c918thr0 = (false),
    _c1n8brbm = (false),
    _c9e96ycq = (1~=1),
    _cydkd467 = (-1>0),
    _c1ucr11a = 500,
    _cad7eor5 = 300,
    _cej1dfa8 = 0.05,
    _cisn9zvr = 0.3,
    _cj4dwkjq = 0.03,
    _cgvcafd5 = 50,
    _csy2f8nq = 100,
    _crz1g3pj = 60,
    _c554l618 = ({}==nil),
    _c19r02ss = (1~=1),
    _co5n0uzl = 1,
    _ccyfm2b6 = "",
    _cvuycazv = (false),
    _cx3jf8cs = (-1<0),
    _cw8dzcqw = (true),
    _c4b0fo94 = (1==1),
}

local _djrfuqzb;if tostring(444)~="nil" then _djrfuqzb=444 else _djrfuqzb=0 end
local _vngy4ui1 = {
    _scab2b23 = nil,
    _s37w3tyc = nil,
    _st9nzgrt = {},
    _s1lqgu7n = nil,
    _sxuhzhw9 = nil,
    _slymxgs2 = nil,
    _shmify3s = nil,
    _sqki7ryk = (nil~=nil),
    _sgakpswy = _xD("102|180|213|212|203"),
    _s52y2tr6 = 0,
    _s6n5p1av = 0,
    _s8p5yacl = 0,
    _s8xv4mfq = 0,
    _s6frkmd6 = 0,
    _sj2gpavs = {},
    _sphwb7rv = {},
    _spab0rkt = {},
    _s5ssv5bx = _xD("44|114|141|158|153"),
}

local _deq4numj;if tostring(521)~="nil" then _deq4numj=521 else _deq4numj=0 end
local _v6zgj6xe = (getgenv ~= nil)
local _vyk1c4k9 = _v6zgj6xe and getgenv() or _G
local _v8j3o8px = (hookmetamethod ~= nil)
local _v7bs887v = (newcclosure ~= nil)
local _v05qb14q = (getrawmetatable ~= nil)
local _vwb7rgkj = (setreadonly ~= nil)
local _dvjs2jjp=pcall(function() return math.sqrt(557) end);if not _dvjs2jjp then _dvjs2jjp=nil end
local _vnpz3du1 = (fireclickdetector ~= nil)
local _vmmcsexa = (fireproximityprompt ~= nil)
local _v8xgtjp3 = (firetouchinterest ~= nil)
local _v3vzub8e = (sethiddenproperty ~= nil)
local _v1s5i06j = (setsimulationradius ~= nil)
local _vk4qou0a = (getconnections ~= nil)
local _v9qavpnu = (syn ~= nil and syn.protect_gui ~= nil)
local _vdxlzjl9 = (checkcaller ~= nil)

local _d19wbwkm=pcall(function() return math.sqrt(230) end);if not _d19wbwkm then _d19wbwkm=nil end
local _vbypg9cl = {}

do

    if (math.abs(0)==0) and (_v8j3o8px and _v7bs887v and _v05qb14q and _vwb7rgkj) then
        local _vxb1ag5b
        _vxb1ag5b = hookmetamethod(game, _xD("52|147|147|162|149|161|153|151|149|160|160"), newcclosure(function(self, ...)
            local method = getnamecallmethod()
            local args = {...}


            if (type(1)=="number") and (method == _xD("90|160|195|200|190|173|191|204|208|195|189|191")) then
                local _l44s4xg4 = args[1]
                if _l44s4xg4 == _xD("76|145|196|188|184|187|181|192|159|177|190|194|181|175|177") or _l44s4xg4 == _xD("42|109|146|143|139|158|125|143|156|160|147|141|143") then
                    return nil
                end
            end


            if method == _xD("114|185|215|230|197|213|228|219|226|230|180|235|230|215|213|225|214|215") then
                if _vdxlzjl9 and checkcaller() then
                    return _vxb1ag5b(self, ...)
                end
            end


            if method == _xD("53|128|158|152|160") and self == LocalPlayer then
                return nil
            end

            return _vxb1ag5b(self, ...)
        end))


        local _v5fnkxwg
        _v5fnkxwg = hookmetamethod(game, _xD("53|148|148|158|163|153|154|173"), newcclosure(function(self, key)
            if self == Humanoid then
                if key == _xD("120|207|217|228|227|203|232|221|221|220") and _vfmg5kpn._c1n8brbm then
                    return 16
                end
                if key == _xD("60|134|177|169|172|140|171|179|161|174") and _vfmg5kpn._csy2f8nq > 50 then
                    return 50
                end
            end
            return _v5fnkxwg(self, key)
        end))


        local _vjr6rx3y
        _vjr6rx3y = hookmetamethod(game, _xD("62|157|157|172|163|181|167|172|162|163|182"), newcclosure(function(self, key, value)
            if (_j0~=nil) and (self == Humanoid) then
                if key == _xD("128|215|225|236|235|211|240|229|229|228") then
                    if _vfmg5kpn._c1n8brbm then
                        return _vjr6rx3y(self, key, _vfmg5kpn._cgvcafd5)
                    end
                end
                if (type(1)=="number") and (key == _xD("44|118|161|153|156|124|155|163|145|158")) then
                    return _vjr6rx3y(self, key, value)
                end
            end
            return _vjr6rx3y(self, key, value)
        end))
    end


    if (type(1)=="number") and (_v8j3o8px and _v7bs887v) then
        local _vxw57wwe
        _vxw57wwe = hookmetamethod(game, _xD("104|199|199|214|201|213|205|203|201|212|212"), newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if method == _xD("60|135|165|159|167") and self == LocalPlayer then
                return nil
            end
            return _vxw57wwe(self, ...)
        end))
    end
end

if false then local _du4paao6=coroutine.create(function() return 812 end) end
local function _fuzf32j8()
    Character = LocalPlayer.Character
    if (math.abs(0)==0) and (Character) then
        HumanoidRootPart = Character:FindFirstChild(_xD("89|161|206|198|186|199|200|194|189|171|200|200|205|169|186|203|205"))
        Humanoid = Character:FindFirstChild(_xD("114|186|231|223|211|224|225|219|214"))
    end
    return Character and HumanoidRootPart and Humanoid
end

local _da04wj4z=pcall(function() return math.sqrt(298) end);if not _da04wj4z then _da04wj4z=nil end
local function _fbtdgwzr(part)
    if not _fuzf32j8() then return math.huge end
    return (HumanoidRootPart.Position - part.Position).Magnitude
end

if false then local _dscz87v6=table.create(729,nil) end
local function _fitqnoqn(position)
    if not _fuzf32j8() then return (0>1) end
    HumanoidRootPart.CFrame = CFrame.new(position + Vector3.new(0, 3, 0))
    task.wait(_vfmg5kpn._cj4dwkjq)
    return (-1<0)
end

if false then local _dgwr5sln=coroutine.create(function() return 439 end) end
local function _ferk280l(cframe)
    if not _fuzf32j8() then return (1~=1) end
    HumanoidRootPart.CFrame = cframe + Vector3.new(0, 3, 0)
    task.wait(_vfmg5kpn._cj4dwkjq)
    return (0<1)
end

local function _fr0i2b8u(message)
    local timestamp = os.date(_xD("74|111|146|132|111|151|132|111|157"))
    table.insert(_vngy4ui1._sj2gpavs, 1, "[" .. timestamp .. "] " .. message)
    if #_vngy4ui1._sj2gpavs > 50 then
        table.remove(_vngy4ui1._sj2gpavs)
    end
    if (_j0~=nil) and (_v6gqiez5) then
        pcall(function()
            _v6gqiez5:ClearAllChildren()
            for i, log in ipairs(_vngy4ui1._sj2gpavs) do
                if i > 15 then break end
                local label = Instance.new("TextLabel")
                label.Size = UDim2.new(1, 0, 0, 18)
                label.BackgroundTransparency = 1
                label.Text = log
                label.TextColor3 = Color3.fromRGB(200, 200, 200)
                label.TextXAlignment = Enum.TextXAlignment.Left
                label.Font = Enum.Font.Gotham
                label.TextSize = 11
                label.Parent = _v6gqiez5
            end
        end)
    end
end

if false then local _dr6qrzej=math.floor(math.random()*775+775) end
local function _f9ir2ki1()
    _vngy4ui1._spab0rkt = {}
    pcall(function()
        for _, remote in ipairs(ReplicatedStorage:GetDescendants()) do
            if (type(1)=="number") and (remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction")) then
                table.insert(_vngy4ui1._spab0rkt, {
                    Instance = remote,
                    Name = remote.Name,
                    Type = remote.ClassName,
                })
            end
        end
    end)
    _fr0i2b8u(_xD("93|160|190|192|197|194|193|125") .. #_vngy4ui1._spab0rkt .. _xD("61|93|175|162|170|172|177|162|176"))
end

if false then local _dbzl030p=typeof(Instance.new("Part")) end
local function _femvr8ro(namePattern, ...)
    local args = {...}
    for _, remote in ipairs(_vngy4ui1._spab0rkt) do
        local rName = string.lower(remote.Name)
        local pattern = string.lower(namePattern)
        if string.find(rName, pattern) then
            pcall(function()
                if (type(1)=="number") and (remote.Type == "RemoteEvent") then
                    remote.Instance:FireServer(unpack(args))
                elseif remote.Type == "RemoteFunction" then
                    remote.Instance:InvokeServer(unpack(args))
                end
            end)
        end
    end
end

local function _fg3ban2j(name, ...)
    local args = {...}
    for _, remote in ipairs(_vngy4ui1._spab0rkt) do
        if remote.Name == name then
            pcall(function()
                if remote.Type == "RemoteEvent" then
                    remote.Instance:FireServer(unpack(args))
                elseif remote.Type == "RemoteFunction" then
                    remote.Instance:InvokeServer(unpack(args))
                end
            end)
            return (not (not true))
        end
    end
    return (nil~=nil)
end

local _v3wmfvp3 = {
    _xD("124|238|235|223|231"), _xD("121|232|235|222"), _xD("66|181|182|177|176|167"), _xD("60|169|165|170|161|174|157|168"), _xD("82|181|196|203|197|198|179|190"), _xD("43|146|144|152"), _xD("53|152|164|150|161"), _xD("102|207|216|213|212"),
    _xD("43|146|154|151|143"), _xD("126|226|231|223|235|237|236|226"), _xD("130|229|241|242|242|231|244"), _xD("118|233|223|226|236|219|232"), _xD("112|226|229|210|233"), _xD("83|184|192|184|197|180|191|183"), _xD("85|200|182|197|197|189|190|199|186"),
    _xD("58|155|167|159|174|162|179|173|174"), _xD("96|206|207|196|197"), _xD("77|195|178|182|187"), _xD("94|194|195|206|205|209|199|210"), _xD("103|201|214|220|211|203|204|217"), _xD("122|237|238|219|236|237|219|234|234|226|227|236|223"),
    _xD("47|163|158|159|144|169"), _xD("126|237|238|223|234"), _xD("64|176|165|161|178|172"), _xD("44|150|141|144|145"), _xD("105|218|222|202|219|221|227"), _xD("64|175|162|179|169|164|169|161|174"), _xD("123|231|220|235|228|238"),
    _xD("61|170|166|177|165|175|166|169"), _xD("110|226|215|226|207|220|215|227|219"), _xD("48|160|156|145|164|153|158|165|157"), _xD("98|210|199|212|203|198|209|214"), _xD("78|200|183|192|177|189|188"), _xD("66|169|163|180|176|167|182"),
    _xD("54|151|167|171|151|163|151|168|159|164|155"), _xD("79|178|184|195|193|184|189|180"), _xD("78|194|175|188|200|175|188|183|194|179"), _xD("115|224|226|226|225|230|231|226|225|216"), _xD("46|161|163|156|161|162|157|156|147"),
    _xD("108|206|216|219|219|208|223|224|219|218|209"), _xD("46|157|156|167|166"), _xD("87|203|198|204|201|196|184|195|192|197|188"), _xD("127|242|239|232|237|228|235"), _xD("115|213|216|229|236|223"), _xD("104|203|208|201|212|203|205|204|215|214|225"),
}

local function _fqdk74d8()
    local rocks = {}
    local function _fyupa5bd(parent)
        if not parent then return end
        for _, child in ipairs(parent:GetChildren()) do
            local nameLower = string.lower(child.Name)
            if child:IsA("BasePart") or child:IsA("Model") then
                local matched = (nil~=nil)
                for _, pattern in ipairs(_v3wmfvp3) do
                    if (_j0~=nil) and (string.find(nameLower, pattern)) then
                        matched = (not (nil~=nil))
                        break
                    end
                end
                if matched then
                    local part = child:IsA("BasePart") and child or child:FindFirstChildWhichIsA("BasePart")
                    if part then
                        local dist = _fbtdgwzr(part)
                        if dist <= _vfmg5kpn._c1ucr11a then

                            local value = 0
                            pcall(function()
                                local val = child:FindFirstChild(_xD("40|126|137|148|157|141")) or child:FindFirstChild(_xD("73|153|187|178|172|174")) or child:FindFirstChild(_xD("100|187|211|214|216|204")) or child:FindFirstChild(_xD("94|180|191|202|211|195|173|212|195|208|208|199|194|195"))
                                if (tostring(1)~="nil") and (val and val:IsA("ValueBase")) then
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
                if (tostring(1)~="nil") and (#child:GetChildren() > 0) then
                    _fyupa5bd(child)
                end
            end
        end
    end

    local searchAreas = {
        Workspace:FindFirstChild(_xD("74|156|185|173|181|189")),
        Workspace:FindFirstChild(_xD("130|209|244|231|245")),
        Workspace:FindFirstChild(_xD("101|178|206|211|202|215|198|209|216")),
        Workspace:FindFirstChild(_xD("91|168|196|201|192|206")),
        Workspace:FindFirstChild(_xD("49|131|150|164|160|166|163|148|150|164")),
        Workspace:FindFirstChild(_xD("51|128|148|163")),
        Workspace:FindFirstChild(_xD("127|211|228|241|241|224|232|237")),
        Workspace:FindFirstChild(_xD("58|125|172|179|173|174|155|166|173")),
        Workspace:FindFirstChild(_xD("122|199|233|239|232|238|219|227|232")),
        Workspace,
    }

    for _, area in ipairs(searchAreas) do
        if (tostring(1)~="nil") and (area) then
            _fyupa5bd(area)
        end
    end


    if _vfmg5kpn._c19r02ss then
        table.sort(rocks, function(a, b) return a.Value > b.Value end)
    elseif _vfmg5kpn._c554l618 then
        table.sort(rocks, function(a, b) return a.Distance < b.Distance end)
    end

    return rocks
end

local function _fqen8g17()
    local shops = {}
    local function _f1kmjq2l(parent)
        if not parent then return end
        for _, child in ipairs(parent:GetChildren()) do
            local nameLower = string.lower(child.Name)
            if (math.abs(0)==0) and (child:IsA("Model") or child:IsA("BasePart")) then
                if string.find(nameLower, _xD("114|229|218|225|226")) or string.find(nameLower, _xD("58|173|159|166|166")) or
                   string.find(nameLower, _xD("111|226|227|222|225|212")) or string.find(nameLower, _xD("50|159|151|164|149|154|147|160|166")) or
                   string.find(nameLower, _xD("46|162|160|143|146|147|160")) or string.find(nameLower, _xD("114|214|215|211|222|215|228")) or
                   string.find(nameLower, _xD("108|217|205|222|215|209|224")) or string.find(nameLower, _xD("121|239|222|231|221|232|235")) or
                   string.find(nameLower, _xD("73|172|170|188|177|178|174|187")) or string.find(nameLower, _xD("84|182|201|205|185|198")) or
                   string.find(nameLower, _xD("90|200|202|189")) or string.find(nameLower, _xD("109|208|206|224|213")) or
                   string.find(nameLower, _xD("105|209|216|214|206")) or string.find(nameLower, _xD("101|199|198|216|202")) or
                   string.find(nameLower, _xD("45|144|142|154|157")) then
                    local part = child:IsA("BasePart") and child or child:FindFirstChildWhichIsA("BasePart") or child:FindFirstChild(_xD("78|150|195|187|175|188|189|183|178|160|189|189|194|158|175|192|194"))
                    if part then
                        local dist = _fbtdgwzr(part)
                        table.insert(shops, {
                            Instance = child,
                            Part = part,
                            Distance = dist,
                            Name = child.Name,
                        })
                    end
                end
                if #child:GetChildren() > 0 then
                    _f1kmjq2l(child)
                end
            end
        end
    end

    _f1kmjq2l(Workspace)
    table.sort(shops, function(a, b) return a.Distance < b.Distance end)
    return shops
end

local function _f617ez8s(_licqw3d4)
    local rock = _licqw3d4.Instance
    local part = _licqw3d4.Part

    if not rock or not rock.Parent then return (2<1) end

    _fr0i2b8u(_xD("64|141|169|174|169|174|167|122|96") .. _licqw3d4.Name)


    _fitqnoqn(part.Position)
    task.wait(0.05)


    if _vnpz3du1 then
        local _lcjswygk = rock:FindFirstChildOfClass("ClickDetector") or part:FindFirstChildOfClass("ClickDetector")
        if _lcjswygk then
            fireclickdetector(_lcjswygk)
        end
    end


    if _vmmcsexa then
        local prompt = rock:FindFirstChildOfClass("ProximityPrompt") or part:FindFirstChildOfClass("ProximityPrompt")
        if prompt then
            fireproximityprompt(prompt)
        end
    end


    if _v8xgtjp3 then
        firetouchinterest(HumanoidRootPart, part, 0)
        task.wait(0.01)
        firetouchinterest(HumanoidRootPart, part, 1)
    end


    local tool = Character and Character:FindFirstChildOfClass("Tool")
    if (_j0~=nil) and (tool) then
        tool:Activate()
    end


    _femvr8ro(_xD("119|228|224|229|220"))
    _femvr8ro(_xD("46|150|143|160|164|147|161|162"))
    _femvr8ro(_xD("74|173|185|182|182|175|173|190"))
    _femvr8ro(_xD("116|214|230|217|213|223"))
    _femvr8ro(_xD("70|173|167|186|174|171|184"))
    _femvr8ro(_xD("93|193|198|196"))
    _femvr8ro(_xD("49|161|154|148|156"))
    _femvr8ro(_xD("62|177|181|167|172|165"))


    for _, remote in ipairs(_vngy4ui1._spab0rkt) do
        local rName = string.lower(remote.Name)
        if string.find(rName, _xD("126|235|231|236|227")) or string.find(rName, _xD("119|219|224|222")) or string.find(rName, _xD("102|206|199|216|220|203|217|218")) then
            pcall(function()
                if remote.Type == "RemoteEvent" then
                    remote.Instance:FireServer(rock, part)
                elseif remote.Type == "RemoteFunction" then
                    remote.Instance:InvokeServer(rock, part)
                end
            end)
        end
    end

    _vngy4ui1._s52y2tr6 = _vngy4ui1._s52y2tr6 + 1

    return (-1<0)
end

local function _fakpo0ga(_lhu9qmvc)
    if not _lhu9qmvc then return (false) end

    local shop = _lhu9qmvc.Instance
    local part = _lhu9qmvc.Part

    _fr0i2b8u(_xD("100|183|201|208|208|205|210|203|132|197|216|158|132") .. _lhu9qmvc.Name)


    _fitqnoqn(part.Position)
    task.wait(0.1)


    if (math.abs(0)==0) and (_vnpz3du1) then
        local _lcjswygk = shop:FindFirstChildOfClass("ClickDetector") or part:FindFirstChildOfClass("ClickDetector")
        if _lcjswygk then
            fireclickdetector(_lcjswygk)
        end
    end


    if (math.abs(0)==0) and (_vmmcsexa) then
        local prompt = shop:FindFirstChildOfClass("ProximityPrompt") or part:FindFirstChildOfClass("ProximityPrompt")
        if (math.abs(0)==0) and (prompt) then
            fireproximityprompt(prompt)
        end
    end


    if _v8xgtjp3 then
        firetouchinterest(HumanoidRootPart, part, 0)
        task.wait(0.01)
        firetouchinterest(HumanoidRootPart, part, 1)
    end


    _femvr8ro(_xD("42|157|143|150|150"))
    _femvr8ro(_xD("64|179|168|175|176"))
    _femvr8ro(_xD("44|153|141|158|151|145|160"))
    _femvr8ro(_xD("85|201|199|182|185|186"))
    _femvr8ro(_xD("68|167|165|183|172"))
    _femvr8ro(_xD("126|235|237|236|227|247"))
    _femvr8ro(_xD("120|235|221|228|228|217|228|228"))
    _femvr8ro(_xD("45|160|146|153|153|140|142|153|153"))

    _vngy4ui1._s6n5p1av = _vngy4ui1._s6n5p1av + 1

    return (true)
end

local function _fx9ryzy2()
    if _vngy4ui1._scab2b23 then return end
    _fr0i2b8u(_xD("91|156|208|207|202|123|161|188|205|200|123|174|175|156|173|175|160|159"))

    _vngy4ui1._scab2b23 = RunService.Heartbeat:Connect(function()
        if not _vfmg5kpn._c2li3eru then return end
        if not _fuzf32j8() then return end

        local rocks = _fqdk74d8()
        if #rocks > 0 then
            local target = rocks[1]
            _vngy4ui1._sgakpswy = target.Name
            _f617ez8s(target)
            task.wait(_vfmg5kpn._cej1dfa8)
        else
            _vngy4ui1._sgakpswy = _xD("81|164|182|178|195|180|185|186|191|184|127|127|127")
        end
    end)
end

local function _fbzpn2e7()
    if _vngy4ui1._scab2b23 then
        _vngy4ui1._scab2b23:Disconnect()
        _vngy4ui1._scab2b23 = nil
    end
    _vngy4ui1._sgakpswy = _xD("96|174|207|206|197")
    _fr0i2b8u(_xD("74|139|191|190|185|106|144|171|188|183|106|157|158|153|154|154|143|142"))
end

local function _f347hv6t()
    if _vngy4ui1._s37w3tyc then return end
    _fr0i2b8u(_xD("115|180|232|231|226|147|198|216|223|223|147|198|199|180|197|199|184|183"))

    _vngy4ui1._s37w3tyc = RunService.Heartbeat:Connect(function()
        if not _vfmg5kpn._cwfws4b8 then return end
        if not _fuzf32j8() then return end

        local shops = _fqen8g17()
        if #shops > 0 then
            _fakpo0ga(shops[1])
            task.wait(_vfmg5kpn._cisn9zvr)
        end
    end)
end

local function _fydyasal()
    if _vngy4ui1._s37w3tyc then
        _vngy4ui1._s37w3tyc:Disconnect()
        _vngy4ui1._s37w3tyc = nil
    end
    _fr0i2b8u(_xD("66|131|183|182|177|98|149|167|174|174|98|149|150|145|146|146|135|134"))
end

local function _fdjeys13()
    if _vngy4ui1._shmify3s then return end
    _fr0i2b8u(_xD("68|133|185|184|179|100|153|180|171|182|165|168|169|100|151|152|133|150|152|137|136"))

    _vngy4ui1._shmify3s = RunService.Heartbeat:Connect(function()
        if not _vfmg5kpn._cg3s4gld then return end


        _femvr8ro(_xD("94|211|206|197|208|191|194|195"))
        _femvr8ro(_xD("71|169|188|192"))
        _femvr8ro(_xD("46|158|163|160|145|150|143|161|147"))
        _femvr8ro(_xD("60|179|157|174|169|176|164"))
        _femvr8ro(_xD("79|191|184|178|186|176|199|180"))
        _femvr8ro(_xD("69|167|166|168|176|181|166|168|176"))
        _femvr8ro(_xD("112|227|224|213|213|212"))
        _femvr8ro(_xD("124|224|229|227"))

        _vngy4ui1._s8xv4mfq = _vngy4ui1._s8xv4mfq + 1
        task.wait(1)
    end)
end

local function _fzvs1pno()
    if _vngy4ui1._shmify3s then
        _vngy4ui1._shmify3s:Disconnect()
        _vngy4ui1._shmify3s = nil
    end
    _fr0i2b8u(_xD("67|132|184|183|178|99|152|179|170|181|164|167|168|99|150|151|146|147|147|136|135"))
end

local function _fiskaoq8()
    for _, highlight in ipairs(_vngy4ui1._sphwb7rv) do
        pcall(function() highlight:Destroy() end)
    end
    _vngy4ui1._sphwb7rv = {}
end

local function _fs8o4sa7()
    _fiskaoq8()

    local rocks = _fqdk74d8()
    for _, rock in ipairs(rocks) do
        if rock.Instance and rock.Instance.Parent then

            local highlight = Instance.new("Highlight")
            highlight.Name = _xD("73|142|156|153|168") .. rock.Name
            highlight.FillTransparency = 0.6
            highlight.OutlineTransparency = 0
            highlight.OutlineColor = rock.Value > 0 and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(100, 200, 255)
            highlight.FillColor = rock.Value > 0 and Color3.fromRGB(255, 200, 50) or Color3.fromRGB(80, 150, 255)
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = rock.Instance


            local billboard = Instance.new("BillboardGui")
            billboard.Name = _xD("58|127|141|138|134|155|156|159|166")
            billboard.Size = UDim2.new(0, 120, 0, 30)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = (0<1)
            billboard.Parent = rock.Part

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 0.4
            label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            label.Text = rock.Name .. (rock.Value > 0 and (_xD("86|118|210|118|122") .. tostring(rock.Value)) or "")
            label.TextColor3 = rock.Value > 0 and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(100, 200, 255)
            label.Font = Enum.Font.GothamBold
            label.TextSize = 11
            label.Parent = billboard

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 4)
            corner.Parent = label

            table.insert(_vngy4ui1._sphwb7rv, highlight)
            table.insert(_vngy4ui1._sphwb7rv, billboard)
        end
    end


    local shops = _fqen8g17()
    for _, shop in ipairs(shops) do
        if (type(1)=="number") and (shop.Instance and shop.Instance.Parent) then
            local highlight = Instance.new("Highlight")
            highlight.Name = _xD("70|139|153|150|165|153|174|181|182|165") .. shop.Name
            highlight.FillTransparency = 0.5
            highlight.OutlineTransparency = 0
            highlight.OutlineColor = Color3.fromRGB(0, 255, 100)
            highlight.FillColor = Color3.fromRGB(50, 255, 100)
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = shop.Instance

            local billboard = Instance.new("BillboardGui")
            billboard.Name = _xD("40|109|123|120|123|144|151|152|116|137|138|141|148")
            billboard.Size = UDim2.new(0, 100, 0, 25)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = (-1<0)
            billboard.Parent = shop.Part

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 0.4
            label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            label.Text = _xD("100|183|172|179|180|158|132") .. shop.Name
            label.TextColor3 = Color3.fromRGB(0, 255, 100)
            label.Font = Enum.Font.GothamBold
            label.TextSize = 10
            label.Parent = billboard

            table.insert(_vngy4ui1._sphwb7rv, highlight)
            table.insert(_vngy4ui1._sphwb7rv, billboard)
        end
    end

    _fr0i2b8u(_xD("130|199|213|210|188|162") .. #rocks .. _xD("52|84|166|163|151|159|167|96|84") .. #shops .. _xD("130|162|245|234|241|242|245"))
end

local function _fahwopdf()
    if _vfmg5kpn._c2thgchu then
        _fs8o4sa7()

        task.spawn(function()
            while _vfmg5kpn._c2thgchu do
                task.wait(5)
                if (type(1)=="number") and (_vfmg5kpn._c2thgchu) then
                    _fs8o4sa7()
                end
            end
        end)
    end
end

local function _f52m6u0f()
    _fiskaoq8()
end

local function _fufho8b8()
    if _vngy4ui1._s1lqgu7n then return end
    _fr0i2b8u(_xD("82|147|192|198|187|114|150|179|191|179|185|183|114|151|160|147|148|158|151|150"))

    _vngy4ui1._s1lqgu7n = RunService.Heartbeat:Connect(function()
        if not _fuzf32j8() then return end


        if (_j0~=nil) and (Humanoid and Humanoid.Health < Humanoid.MaxHealth) then
            Humanoid.Health = Humanoid.MaxHealth
        end


        if _vfmg5kpn._c4dqc2td then
            pcall(function()

                local _ldad9zqo = Character:FindFirstChild(_xD("129|216|226|243|238|245|233")) or Character:FindFirstChild(_xD("45|129|146|154|157|146|159|142|161|162|159|146")) or Character:FindFirstChild(_xD("125|192|236|233|225"))
                if _ldad9zqo and _ldad9zqo:IsA("ValueBase") then
                    _ldad9zqo.Value = 100
                end


                local _lgsubcjp = Character:FindFirstChild(_xD("104|174|218|215|226|205|214")) or Character:FindFirstChild(_xD("129|202|244|199|243|240|251|230|239")) or Character:FindFirstChild(_xD("85|155|199|186|186|207|190|195|188"))
                if _lgsubcjp and _lgsubcjp:IsA("BoolValue") then
                    _lgsubcjp.Value = (0>1)
                end


                _femvr8ro(_xD("47|166|144|161|156|163|151"))
                _femvr8ro(_xD("55|172|165|157|169|156|156|177|156"))
                _femvr8ro(_xD("70|174|171|167|186"))
            end)
        end
    end)
end

local function _f8owkba0()
    if _vngy4ui1._s1lqgu7n then
        _vngy4ui1._s1lqgu7n:Disconnect()
        _vngy4ui1._s1lqgu7n = nil
    end
    _fr0i2b8u(_xD("107|172|217|223|212|139|175|204|216|204|210|208|139|175|180|190|172|173|183|176|175"))
end

local function _f2jk6i63()
    if not _vfmg5kpn._cq1te7c4 then return end
    _fr0i2b8u(_xD("100|165|212|212|208|221|205|210|203|132|185|210|208|205|209|205|216|201|200|132|166|197|199|207|212|197|199|207|146|146|146"))

    pcall(function()

        local _l59b3it2 = LocalPlayer:FindFirstChild(_xD("118|184|215|217|225|230|215|217|225|185|215|230|215|217|223|234|239")) or LocalPlayer:FindFirstChild(_xD("118|195|215|238|185|215|232|232|239")) or LocalPlayer:FindFirstChild(_xD("60|127|157|174|174|181|135|131"))
        if _l59b3it2 and _l59b3it2:IsA("ValueBase") then
            _l59b3it2.Value = 999999
        end


        local leaderstats = LocalPlayer:FindFirstChild(_xD("60|168|161|157|160|161|174|175|176|157|176|175"))
        if (_j0~=nil) and (leaderstats) then
            for _, stat in ipairs(leaderstats:GetChildren()) do
                local nameLower = string.lower(stat.Name)
                if string.find(nameLower, _xD("97|195|194|196|204|209|194|196|204")) or string.find(nameLower, _xD("74|173|171|188|188|195")) or string.find(nameLower, _xD("58|157|155|170|155|157|163|174|179")) or string.find(nameLower, _xD("102|221|203|207|205|206|218")) or string.find(nameLower, _xD("116|223|219")) then
                    if (math.abs(0)==0) and (stat:IsA("ValueBase")) then
                        stat.Value = 999999
                    end
                end
            end
        end


        _femvr8ro(_xD("76|174|173|175|183|188|173|175|183"))
        _femvr8ro(_xD("111|210|208|223|208|210|216|227|232"))
        _femvr8ro(_xD("65|164|162|179|179|186"))
        _femvr8ro(_xD("72|189|184|175|186|169|172|173|167|170|169|171|179|184|169|171|179"))
    end)


    task.spawn(function()
        while _vfmg5kpn._cq1te7c4 do
            task.wait(2)
            pcall(function()
                local leaderstats = LocalPlayer:FindFirstChild(_xD("47|155|148|144|147|148|161|162|163|144|163|162"))
                if (type(1)=="number") and (leaderstats) then
                    for _, stat in ipairs(leaderstats:GetChildren()) do
                        local nameLower = string.lower(stat.Name)
                        if string.find(nameLower, _xD("85|183|182|184|192|197|182|184|192")) or string.find(nameLower, _xD("77|176|174|191|191|198")) or string.find(nameLower, _xD("75|174|172|187|172|174|180|191|196")) or string.find(nameLower, _xD("90|209|191|195|193|194|206")) or string.find(nameLower, _xD("120|227|223")) then
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

local function _foqomzy9()
    if not _vfmg5kpn._c918thr0 then return end
    _fr0i2b8u(_xD("68|133|180|180|176|189|173|178|171|100|153|178|176|173|177|173|184|169|168|100|144|185|167|175|114|114|114"))

    pcall(function()

        local _lpz1ki9y = LocalPlayer:FindFirstChild(_xD("85|161|202|184|192")) or LocalPlayer:FindFirstChild(_xD("70|138|175|173|146|187|169|177")) or LocalPlayer:FindFirstChild(_xD("65|142|170|175|170|175|168|141|182|164|172"))
        if _lpz1ki9y and _lpz1ki9y:IsA("ValueBase") then
            _lpz1ki9y.Value = 999999
        end


        local leaderstats = LocalPlayer:FindFirstChild(_xD("61|169|162|158|161|162|175|176|177|158|177|176"))
        if (_j0~=nil) and (leaderstats) then
            for _, stat in ipairs(leaderstats:GetChildren()) do
                local nameLower = string.lower(stat.Name)
                if string.find(nameLower, _xD("109|217|226|208|216")) then
                    if stat:IsA("ValueBase") then
                        stat.Value = 999999
                    end
                end
            end
        end


        _femvr8ro(_xD("113|221|230|212|220"))
        _femvr8ro(_xD("44|152|161|143|151|165"))
        _femvr8ro(_xD("40|140|145|143|135|148|157|139|147"))
    end)


    task.spawn(function()
        while _vfmg5kpn._c918thr0 do
            task.wait(2)
            pcall(function()
                local leaderstats = LocalPlayer:FindFirstChild(_xD("114|222|215|211|214|215|228|229|230|211|230|229"))
                if leaderstats then
                    for _, stat in ipairs(leaderstats:GetChildren()) do
                        if (type(1)=="number") and (string.find(string.lower(stat.Name), _xD("77|185|194|176|184")) and stat:IsA("ValueBase")) then
                            stat.Value = 999999
                        end
                    end
                end
            end)
        end
    end)
end

local function _felt293d(amount)
    _fr0i2b8u(_xD("127|192|243|243|228|236|239|243|232|237|230|159|243|238|159|227|244|239|228|159") .. amount .. _xD("102|134|207|218|203|211|217|148|148|148"))

    pcall(function()

        for i = 1, amount do
            _femvr8ro(_xD("84|183|195|192|192|185|183|200"))
            _femvr8ro(_xD("61|170|166|171|162"))
            _femvr8ro(_xD("122|226|219|236|240|223|237|238"))
            _femvr8ro(_xD("96|208|201|195|203|213|208"))
            _femvr8ro(_xD("105|208|202|221|209|206|219"))
            _femvr8ro(_xD("127|235|238|238|243"))
            _femvr8ro(_xD("107|218|205|223|204|212|217"))
            _femvr8ro(_xD("87|190|201|184|197|203"))
            _femvr8ro(_xD("73|187|174|192|170|187|173"))
            task.wait(0.05)
        end


        local leaderstats = LocalPlayer:FindFirstChild(_xD("104|212|205|201|204|205|218|219|220|201|220|219"))
        if leaderstats then
            for _, stat in ipairs(leaderstats:GetChildren()) do
                local nameLower = string.lower(stat.Name)
                if string.find(nameLower, _xD("45|144|159|166|160|161|142|153")) or string.find(nameLower, _xD("42|153|156|143")) or string.find(nameLower, _xD("50|153|151|159")) or string.find(nameLower, _xD("129|234|245|230|238")) then
                    if (tostring(1)~="nil") and (stat:IsA("NumberValue") or stat:IsA("IntValue")) then
                        stat.Value = stat.Value * amount
                    end
                end
            end
        end


        for i = 1, amount do
            _femvr8ro(_xD("56|171|157|164|164"))
            task.wait(0.02)
            _femvr8ro(_xD("63|161|180|184"))
            task.wait(0.02)
        end


        local rocks = _fqdk74d8()
        if #rocks > 0 then
            local _ld1ltkyc = rocks[1]
            for i = 1, amount do
                for _, remote in ipairs(_vngy4ui1._spab0rkt) do
                    local rName = string.lower(remote.Name)
                    if (tostring(1)~="nil") and (string.find(rName, _xD("52|151|163|160|160|153|151|168")) or string.find(rName, _xD("64|176|169|163|171|181|176")) or string.find(rName, _xD("71|179|182|182|187"))) then
                        pcall(function()
                            if remote.Type == "RemoteEvent" then
                                remote.Instance:FireServer(_ld1ltkyc.Instance, _ld1ltkyc.Part)
                            end
                        end)
                    end
                end
                task.wait(0.05)
            end
        end
    end)

    _vngy4ui1._s8p5yacl = _vngy4ui1._s8p5yacl + amount
    _fr0i2b8u(_xD("75|143|192|187|176|107|172|191|191|176|184|187|191|107|174|186|184|187|183|176|191|176|133|107") .. amount .. _xD("125|245"))
end

local function _f6rrymn2()
    if _vngy4ui1._sxuhzhw9 then return end
    _fr0i2b8u(_xD("97|175|208|196|205|202|209|129|166|175|162|163|173|166|165"))

    _vngy4ui1._sxuhzhw9 = RunService.Stepped:Connect(function()
        if not _vfmg5kpn._c9e96ycq then return end
        if not _fuzf32j8() then return end
        for _, part in ipairs(Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = (nil~=nil)
            end
        end
    end)
end

local function _fy5u34ix()
    if (type(1)=="number") and (_vngy4ui1._sxuhzhw9) then
        _vngy4ui1._sxuhzhw9:Disconnect()
        _vngy4ui1._sxuhzhw9 = nil
    end
    _fr0i2b8u(_xD("104|182|215|203|212|209|216|136|172|177|187|169|170|180|173|172"))
end

local _v9etezfn = nil
local _v5joeztm = nil

local function _f1hpcap5()
    if _vngy4ui1._slymxgs2 then return end
    if not _fuzf32j8() then return end
    _fr0i2b8u(_xD("112|182|220|233|144|181|190|177|178|188|181|180"))


    _v9etezfn = Instance.new("BodyVelocity")
    _v9etezfn.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    _v9etezfn.Velocity = Vector3.new(0, 0, 0)
    _v9etezfn.Parent = HumanoidRootPart

    _v5joeztm = Instance.new("BodyGyro")
    _v5joeztm.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    _v5joeztm.P = 9e4
    _v5joeztm.Parent = HumanoidRootPart

    _vngy4ui1._slymxgs2 = RunService.RenderStepped:Connect(function()
        if not _vfmg5kpn._cydkd467 then return end
        if not _fuzf32j8() then return end

        local cam = Workspace.CurrentCamera
        local moveDir = Vector3.new(0, 0, 0)

        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDir = moveDir + cam.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveDir = moveDir - cam.CFrame.LookVector
        end
        if (math.abs(0)==0) and (UserInputService:IsKeyDown(Enum.KeyCode.A)) then
            moveDir = moveDir - cam.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDir = moveDir + cam.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            moveDir = moveDir + Vector3.new(0, 1, 0)
        end
        if (type(1)=="number") and (UserInputService:IsKeyDown(Enum.KeyCode.LeftShift)) then
            moveDir = moveDir - Vector3.new(0, 1, 0)
        end

        if moveDir.Magnitude > 0 then
            moveDir = moveDir.Unit * _vfmg5kpn._crz1g3pj
        end

        _v9etezfn.Velocity = moveDir
        _v5joeztm.CFrame = cam.CFrame
    end)
end

local function _fkbykdh5()
    if _vngy4ui1._slymxgs2 then
        _vngy4ui1._slymxgs2:Disconnect()
        _vngy4ui1._slymxgs2 = nil
    end
    if _v9etezfn then _v9etezfn:Destroy() _v9etezfn = nil end
    if _v5joeztm then _v5joeztm:Destroy() _v5joeztm = nil end
    _fr0i2b8u(_xD("108|178|216|229|140|176|181|191|173|174|184|177|176"))
end

local function _f8qecca1()
    if not _fuzf32j8() then return end
    if _vfmg5kpn._c1n8brbm then
        Humanoid._cgvcafd5 = _vfmg5kpn._cgvcafd5
    else
        Humanoid._cgvcafd5 = 16
    end
end

local _vsrkpkv7 = {}
local _vy6ism5j = (not true)

local function _fetm6cpp(data)
    if not _vfmg5kpn._cvuycazv or _vfmg5kpn._ccyfm2b6 == "" then return end
    pcall(function()
        HttpService:PostAsync(_vfmg5kpn._ccyfm2b6, HttpService:JSONEncode(data))
    end)
end

local function _f3g2t33s(itemName)
    if not _vfmg5kpn._cx3jf8cs then return end
    _fetm6cpp({
        content = _xD("102|144|144|193|179|207|212|203|199|134|179|213|219|212|218|199|207|212|195|144|144|134|179|207|212|203|202|160|134") .. itemName .. _xD("60|92|184|92|144|171|176|157|168|118|92") .. _vngy4ui1._s52y2tr6,
    })
end

local function _fze1huf8()
    if not _vfmg5kpn._cw8dzcqw then return end
    _fetm6cpp({
        content = _xD("84|126|126|175|161|189|194|185|181|116|161|195|201|194|200|181|189|194|177|126|126|116|167|195|192|184|116|189|200|185|193|199|116|208|116|168|195|200|181|192|116|199|185|192|192|199|142|116") .. _vngy4ui1._s6n5p1av,
    })
end

local function _foxsyh1o()
    if not _vfmg5kpn._c4b0fo94 then return end
    _fetm6cpp({
        content = _xD("79|121|121|170|156|184|189|180|176|111|156|190|196|189|195|176|184|189|111|162|195|176|195|194|172|121|121|111|156|184|189|180|179|137|111") .. _vngy4ui1._s52y2tr6 .. _xD("123|155|247|155|206|224|231|231|238|181|155") .. _vngy4ui1._s6n5p1av .. _xD("95|127|219|127|163|212|207|196|210|153|127") .. _vngy4ui1._s8p5yacl .. _xD("83|115|207|115|167|180|197|186|184|199|141|115") .. _vngy4ui1._sgakpswy,
    })
end

local _vav1c6dy = Instance.new("ScreenGui")
_vav1c6dy.Name = _xD("109|186|214|219|210|206|186|220|226|219|225|206|214|219|195|163")
_vav1c6dy.ResetOnSpawn = (nil~=nil)
_vav1c6dy.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_vav1c6dy.IgnoreGuiInset = (-1<0)

if (tostring(1)~="nil") and (_v9qavpnu) then
    pcall(function() syn.protect_gui(_vav1c6dy) end)
end
_vav1c6dy.Parent = game:GetService(_xD("101|168|212|215|202|172|218|206"))


local ViewSize = Workspace.CurrentCamera.ViewportSize
local _viviujy2 = ViewSize.X < 800
local _v1hdn2zz = _viviujy2 and UDim2.new(0.95, 0, 0, 480) or UDim2.new(0, 380, 0, 540)
local _vay7ze84 = UDim2.new(0, 150, 0, 42)
local GUIPosition = UDim2.new(0.025, 0, 0.08, 0)
local MinimizedPosition = UDim2.new(0.025, 0, 0.03, 0)

local _v4n0dhc4 = Instance.new("Frame")
_v4n0dhc4.Name = _xD("78|155|175|183|188|148|192|175|187|179")
_v4n0dhc4.Size = _v1hdn2zz
_v4n0dhc4.Position = GUIPosition
_v4n0dhc4.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
_v4n0dhc4.BackgroundTransparency = 0.15
_v4n0dhc4.BorderSizePixel = 0
_v4n0dhc4.ClipsDescendants = (0<1)
_v4n0dhc4.Parent = _vav1c6dy

local _vgqlkepr = Instance.new("UICorner")
_vgqlkepr.CornerRadius = UDim.new(0, 14)
_vgqlkepr.Parent = _v4n0dhc4


local _vty5ttgn = Instance.new("UIStroke")
_vty5ttgn.Color = Color3.fromRGB(90, 130, 255)
_vty5ttgn.Thickness = 1.5
_vty5ttgn.Transparency = 0.2
_vty5ttgn.Parent = _v4n0dhc4


local _v8nsv97l = Instance.new("ImageLabel")
_v8nsv97l.Name = _xD("55|126|163|152|170|170|121|163|172|169")
_v8nsv97l.Size = UDim2.new(1, 40, 1, 40)
_v8nsv97l.Position = UDim2.new(0, -20, 0, -20)
_v8nsv97l.BackgroundTransparency = 1
_v8nsv97l.Image = "rbxassetid://7669168585"
_v8nsv97l.ImageColor3 = Color3.fromRGB(50, 80, 200)
_v8nsv97l.ImageTransparency = 0.75
_v8nsv97l.ScaleType = Enum.ScaleType.Slice
_v8nsv97l.SliceCenter = Rect.new(45, 45, 45, 45)
_v8nsv97l.Parent = _v4n0dhc4

local _vlzeri6g = Instance.new("Frame")
_vlzeri6g.Name = _xD("65|137|166|162|165|166|179")
_vlzeri6g.Size = UDim2.new(1, 0, 0, 48)
_vlzeri6g.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
_vlzeri6g.BackgroundTransparency = 0.1
_vlzeri6g.BorderSizePixel = 0
_vlzeri6g.Parent = _v4n0dhc4

local _vulva1ko = Instance.new("UICorner")
_vulva1ko.CornerRadius = UDim.new(0, 14)
_vulva1ko.Parent = _vlzeri6g

local _vv7usdfg = Instance.new("UIGradient")
_vv7usdfg.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 35, 65)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(25, 25, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 65)),
})
_vv7usdfg.Rotation = 90
_vv7usdfg.Parent = _vlzeri6g

local _v4a3m1q6 = Instance.new("TextLabel")
_v4a3m1q6.Size = UDim2.new(0.65, 0, 1, 0)
_v4a3m1q6.Position = UDim2.new(0.04, 0, 0, 0)
_v4a3m1q6.BackgroundTransparency = 1
_v4a3m1q6.Text = _xD("42|9977|74|119|147|152|143|139|74|119|153|159|152|158|139|147|152|74|160|96")
_v4a3m1q6.TextColor3 = Color3.fromRGB(130, 170, 255)
_v4a3m1q6.Font = Enum.Font.GothamBold
_v4a3m1q6.TextSize = _viviujy2 and 13 or 15
_v4a3m1q6.TextXAlignment = Enum.TextXAlignment.Left
_v4a3m1q6.Parent = _vlzeri6g


local _vnfnvfx4 = Instance.new("TextLabel")
_vnfnvfx4.Size = UDim2.new(0, 28, 0, 18)
_vnfnvfx4.Position = UDim2.new(0.65, 0, 0.5, -9)
_vnfnvfx4.BackgroundColor3 = Color3.fromRGB(60, 100, 255)
_vnfnvfx4.BorderSizePixel = 0
_vnfnvfx4.Text = _xD("116|234|170")
_vnfnvfx4.TextColor3 = Color3.fromRGB(255, 255, 255)
_vnfnvfx4.Font = Enum.Font.GothamBold
_vnfnvfx4.TextSize = 10
_vnfnvfx4.Parent = _vlzeri6g

local vCorner = Instance.new("UICorner")
vCorner.CornerRadius = UDim.new(0, 9)
vCorner.Parent = _vnfnvfx4


local _va9mu7w7 = Instance.new("TextButton")
_va9mu7w7.Size = UDim2.new(0, 40, 0, 28)
_va9mu7w7.Position = UDim2.new(1, -48, 0, 10)
_va9mu7w7.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
_va9mu7w7.BorderSizePixel = 0
_va9mu7w7.Text = "—"
_va9mu7w7.TextColor3 = Color3.fromRGB(255, 255, 255)
_va9mu7w7.Font = Enum.Font.GothamBold
_va9mu7w7.TextSize = 14
_va9mu7w7.Parent = _vlzeri6g

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(0, 8)
minCorner.Parent = _va9mu7w7

local _vbibkfpc = Instance.new("Frame")
_vbibkfpc.Size = _vay7ze84
_vbibkfpc.Position = MinimizedPosition
_vbibkfpc.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
_vbibkfpc.BackgroundTransparency = 0.15
_vbibkfpc.BorderSizePixel = 0
_vbibkfpc.Visible = (-1>0)
_vbibkfpc.Parent = _vav1c6dy

local miniCorner = Instance.new("UICorner")
miniCorner.CornerRadius = UDim.new(0, 12)
miniCorner.Parent = _vbibkfpc

local miniStroke = Instance.new("UIStroke")
miniStroke.Color = Color3.fromRGB(90, 130, 255)
miniStroke.Thickness = 1.5
miniStroke.Transparency = 0.2
miniStroke.Parent = _vbibkfpc

local _vb3ohd1p = Instance.new("TextLabel")
_vb3ohd1p.Size = UDim2.new(0.6, 0, 1, 0)
_vb3ohd1p.Position = UDim2.new(0.06, 0, 0, 0)
_vb3ohd1p.BackgroundTransparency = 1
_vb3ohd1p.Text = _xD("93|10028|125|170|198|203|194|190")
_vb3ohd1p.TextColor3 = Color3.fromRGB(130, 170, 255)
_vb3ohd1p.Font = Enum.Font.GothamBold
_vb3ohd1p.TextSize = 13
_vb3ohd1p.TextXAlignment = Enum.TextXAlignment.Left
_vb3ohd1p.Parent = _vbibkfpc

local _v061siw4 = Instance.new("TextButton")
_v061siw4.Size = UDim2.new(0, 40, 0, 28)
_v061siw4.Position = UDim2.new(1, -48, 0, 7)
_v061siw4.BackgroundColor3 = Color3.fromRGB(60, 200, 100)
_v061siw4.BorderSizePixel = 0
_v061siw4.Text = "□"
_v061siw4.TextColor3 = Color3.fromRGB(255, 255, 255)
_v061siw4.Font = Enum.Font.GothamBold
_v061siw4.TextSize = 14
_v061siw4.Parent = _vbibkfpc

local expCorner = Instance.new("UICorner")
expCorner.CornerRadius = UDim.new(0, 8)
expCorner.Parent = _v061siw4

local _v29ksdz8 = Instance.new("Frame")
_v29ksdz8.Name = _xD("113|197|210|211|179|210|227")
_v29ksdz8.Size = UDim2.new(1, -12, 0, 32)
_v29ksdz8.Position = UDim2.new(0, 6, 0, 52)
_v29ksdz8.BackgroundTransparency = 1
_v29ksdz8.Parent = _v4n0dhc4

local TabLayout = Instance.new("UIListLayout")
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.Padding = UDim.new(0, 3)
TabLayout.Parent = _v29ksdz8

local _lo3nekdl = {_xD("107|177|204|221|216"), _xD("122|205|223|230|230"), _xD("102|171|185|182"), _xD("74|143|194|186|182|185|179|190"), _xD("90|167|195|205|189")}
local _v7ae9701 = {}
local _vpw6qnkq = {}

for i, tabName in ipairs(_lo3nekdl) do
    local tabBtn = Instance.new("TextButton")
    tabBtn.Name = tabName .. _xD("87|171|184|185")
    tabBtn.Size = UDim2.new(0.2, 0, 1, 0)
    tabBtn.BackgroundColor3 = (tabName == _xD("109|179|206|223|218")) and Color3.fromRGB(50, 90, 200) or Color3.fromRGB(30, 30, 50)
    tabBtn.BorderSizePixel = 0
    tabBtn.Text = tabName
    tabBtn.TextColor3 = Color3.fromRGB(220, 230, 255)
    tabBtn.Font = Enum.Font.GothamBold
    tabBtn.TextSize = _viviujy2 and 10 or 11
    tabBtn.LayoutOrder = i
    tabBtn.Parent = _v29ksdz8

    local tCorner = Instance.new("UICorner")
    tCorner.CornerRadius = UDim.new(0, 8)
    tCorner.Parent = tabBtn

    _v7ae9701[tabName] = tabBtn
end

local _vvifiefp = Instance.new("Frame")
_vvifiefp.Name = _xD("107|174|218|217|223|208|217|223|172|221|208|204")
_vvifiefp.Size = UDim2.new(1, -12, 1, -90)
_vvifiefp.Position = UDim2.new(0, 6, 0, 88)
_vvifiefp.BackgroundTransparency = 1
_vvifiefp.ClipsDescendants = (-1<0)
_vvifiefp.Parent = _v4n0dhc4


for _, tabName in ipairs(_lo3nekdl) do
    local tabFrame = Instance.new("ScrollingFrame")
    tabFrame.Name = tabName .. _xD("70|137|181|180|186|171|180|186")
    tabFrame.Size = UDim2.new(1, 0, 1, 0)
    tabFrame.BackgroundTransparency = 1
    tabFrame.BorderSizePixel = 0
    tabFrame.ScrollBarThickness = 3
    tabFrame.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
    tabFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    tabFrame.Visible = (tabName == _xD("77|147|174|191|186"))
    tabFrame.Parent = _vvifiefp

    local tabLayout = Instance.new("UIListLayout")
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabLayout.Padding = UDim.new(0, 5)
    tabLayout.Parent = tabFrame

    local tabPad = Instance.new("UIPadding")
    tabPad.PaddingTop = UDim.new(0, 2)
    tabPad.PaddingBottom = UDim.new(0, 2)
    tabPad.PaddingLeft = UDim.new(0, 2)
    tabPad.PaddingRight = UDim.new(0, 2)
    tabPad.Parent = tabFrame

    _vpw6qnkq[tabName] = tabFrame
end

local function _fx7x1rr6(tabName)
    _vngy4ui1._s5ssv5bx = tabName
    for name, frame in pairs(_vpw6qnkq) do
        frame.Visible = (name == tabName)
    end
    for name, btn in pairs(_v7ae9701) do
        btn.BackgroundColor3 = (name == tabName) and Color3.fromRGB(50, 90, 200) or Color3.fromRGB(30, 30, 50)
    end
end

for tabName, btn in pairs(_v7ae9701) do
    btn.MouseButton1Click:Connect(function()
        _fx7x1rr6(tabName)
    end)
end

local _vsfa6lk5 = 0

local function _ffbdaqdq(parent, title)
    _vsfa6lk5 = _vsfa6lk5 + 1
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 26)
    label.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    label.BorderSizePixel = 0
    label.Text = "  " .. title
    label.TextColor3 = Color3.fromRGB(100, 150, 255)
    label.Font = Enum.Font.GothamBold
    label.TextSize = _viviujy2 and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.LayoutOrder = _vsfa6lk5
    label.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = label
    return label
end

local function _fqblradu(parent, name, default, callback)
    _vsfa6lk5 = _vsfa6lk5 + 1
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 38)
    frame.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
    frame.BorderSizePixel = 0
    frame.LayoutOrder = _vsfa6lk5
    frame.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.65, 0, 1, 0)
    label.Position = UDim2.new(0.04, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(200, 210, 240)
    label.Font = Enum.Font.Gotham
    label.TextSize = _viviujy2 and 11 or 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 52, 0, 24)
    toggleBtn.Position = UDim2.new(1, -60, 0.5, -12)
    toggleBtn.BackgroundColor3 = default and Color3.fromRGB(50, 180, 90) or Color3.fromRGB(50, 50, 70)
    toggleBtn.BorderSizePixel = 0
    toggleBtn.Text = default and _xD("75|154|153") or _xD("99|178|169|169")
    toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.TextSize = 10
    toggleBtn.Parent = frame

    local tCorner = Instance.new("UICorner")
    tCorner.CornerRadius = UDim.new(0, 12)
    tCorner.Parent = toggleBtn

    local toggled = default
    toggleBtn.MouseButton1Click:Connect(function()
        toggled = not toggled
        toggleBtn.BackgroundColor3 = toggled and Color3.fromRGB(50, 180, 90) or Color3.fromRGB(50, 50, 70)
        toggleBtn.Text = toggled and _xD("93|172|171") or _xD("112|191|182|182")
        callback(toggled)
    end)

    return frame, toggleBtn
end

local function _fwedmej7(parent, name, color, callback)
    _vsfa6lk5 = _vsfa6lk5 + 1
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 34)
    btn.BackgroundColor3 = color
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = _viviujy2 and 11 or 12
    btn.LayoutOrder = _vsfa6lk5
    btn.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    btn.MouseButton1Click:Connect(callback)
    return btn
end

local function _fg7eldna(parent, name, minVal, maxVal, defaultVal, callback)
    _vsfa6lk5 = _vsfa6lk5 + 1
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 50)
    frame.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
    frame.BorderSizePixel = 0
    frame.LayoutOrder = _vsfa6lk5
    frame.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -12, 0, 20)
    label.Position = UDim2.new(0, 6, 0, 2)
    label.BackgroundTransparency = 1
    label.Text = name .. ": " .. tostring(defaultVal)
    label.TextColor3 = Color3.fromRGB(180, 195, 230)
    label.Font = Enum.Font.Gotham
    label.TextSize = _viviujy2 and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local sliderFrame = Instance.new("Frame")
    sliderFrame.Size = UDim2.new(1, -12, 0, 14)
    sliderFrame.Position = UDim2.new(0, 6, 0, 28)
    sliderFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    sliderFrame.BorderSizePixel = 0
    sliderFrame.Parent = frame

    local sCorner = Instance.new("UICorner")
    sCorner.CornerRadius = UDim.new(0, 7)
    sCorner.Parent = sliderFrame

    local fillBar = Instance.new("Frame")
    local pct = (defaultVal - minVal) / (maxVal - minVal)
    fillBar.Size = UDim2.new(pct, 0, 1, 0)
    fillBar.BackgroundColor3 = Color3.fromRGB(70, 130, 255)
    fillBar.BorderSizePixel = 0
    fillBar.Parent = sliderFrame

    local fCorner = Instance.new("UICorner")
    fCorner.CornerRadius = UDim.new(0, 7)
    fCorner.Parent = fillBar

    local sliding = (-1>0)
    local function updateSlider(input)
        local relX = math.clamp((input.Position.X - sliderFrame.AbsolutePosition.X) / sliderFrame.AbsoluteSize.X, 0, 1)
        local val = math.floor(minVal + (maxVal - minVal) * relX)
        fillBar.Size = UDim2.new(relX, 0, 1, 0)
        label.Text = name .. ": " .. tostring(val)
        callback(val)
    end

    sliderFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            sliding = (-1<0)
            updateSlider(input)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if sliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateSlider(input)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if (_j0~=nil) and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            sliding = (0>1)
        end
    end)

    return frame
end

local function _flzxyqpx(parent, name, defaultText, callback)
    _vsfa6lk5 = _vsfa6lk5 + 1
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 42)
    frame.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
    frame.BorderSizePixel = 0
    frame.LayoutOrder = _vsfa6lk5
    frame.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.35, 0, 1, 0)
    label.Position = UDim2.new(0.03, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(180, 195, 230)
    label.Font = Enum.Font.Gotham
    label.TextSize = _viviujy2 and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local input = Instance.new("TextBox")
    input.Size = UDim2.new(0.55, 0, 0, 26)
    input.Position = UDim2.new(0.4, 0, 0.5, -13)
    input.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    input.BorderSizePixel = 0
    input.Text = defaultText
    input.PlaceholderText = name
    input.TextColor3 = Color3.fromRGB(220, 220, 240)
    input.PlaceholderText3 = Color3.fromRGB(100, 100, 120)
    input.Font = Enum.Font.Gotham
    input.TextSize = _viviujy2 and 10 or 11
    input.ClearTextOnFocus = (-1>0)
    input.Parent = frame

    local iCorner = Instance.new("UICorner")
    iCorner.CornerRadius = UDim.new(0, 6)
    iCorner.Parent = input

    input.FocusLost:Connect(function()
        callback(input.Text)
    end)

    return frame, input
end

local _ldgcwjh9 = _vpw6qnkq[_xD("94|164|191|208|203")]

_ffbdaqdq(_ldgcwjh9, _xD("59|128261|91|142|143|124|143|142"))
_vsfa6lk5 = _vsfa6lk5 + 1
local _v1oyrt7f = Instance.new("Frame")
_v1oyrt7f.Size = UDim2.new(1, 0, 0, 40)
_v1oyrt7f.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
_v1oyrt7f.BorderSizePixel = 0
_v1oyrt7f.LayoutOrder = _vsfa6lk5
_v1oyrt7f.Parent = _ldgcwjh9

local statsCorner = Instance.new("UICorner")
statsCorner.CornerRadius = UDim.new(0, 8)
statsCorner.Parent = _v1oyrt7f

local _vxklw9bk = Instance.new("TextLabel")
_vxklw9bk.Name = _xD("66|149|182|163|182|181|150|167|186|182")
_vxklw9bk.Size = UDim2.new(1, -12, 1, 0)
_vxklw9bk.Position = UDim2.new(0, 6, 0, 0)
_vxklw9bk.BackgroundTransparency = 1
_vxklw9bk.Text = _xD("87|164|192|197|188|187|145|119|135|119|211|119|170|188|195|195|202|145|119|135|119|211|119|171|184|201|190|188|203|145|119|165|198|197|188")
_vxklw9bk.TextColor3 = Color3.fromRGB(180, 200, 230)
_vxklw9bk.Font = Enum.Font.Gotham
_vxklw9bk.TextSize = _viviujy2 and 9 or 10
_vxklw9bk.TextXAlignment = Enum.TextXAlignment.Left
_vxklw9bk.TextWrapped = (true)
_vxklw9bk.Parent = _v1oyrt7f

local function _f1v4pdh0()
    _vxklw9bk.Text = _xD("109|186|214|219|210|209|167|141") .. _vngy4ui1._s52y2tr6 .. _xD("87|119|211|119|170|188|195|195|202|145|119") .. _vngy4ui1._s6n5p1av .. _xD("68|100|192|100|136|185|180|169|126|100") .. _vngy4ui1._s8p5yacl .. _xD("59|91|183|91|143|156|173|162|160|175|117|91") .. (_vngy4ui1._sgakpswy or _xD("44|122|155|154|145"))
end

_ffbdaqdq(_ldgcwjh9, _xD("81|10016|113|146|166|165|160|113|151|146|163|158"))

_fqblradu(_ldgcwjh9, _xD("123|188|240|239|234|155|193|220|237|232|155|205|234|222|230|238|170|190|237|244|238|239|220|231|238"), (not true), function(val)
    _vfmg5kpn._c2li3eru = val
    if val then _fx9ryzy2() else _fbzpn2e7() end
end)

_fqblradu(_ldgcwjh9, _xD("69|149|183|174|180|183|174|185|190|101|141|174|172|173|170|184|185|101|155|166|177|186|170"), (2<1), function(val)
    _vfmg5kpn._c19r02ss = val
    if val then _vfmg5kpn._c554l618 = (false) end
end)

_fqblradu(_ldgcwjh9, _xD("74|154|188|179|185|188|179|190|195|106|141|182|185|189|175|189|190"), (1==1), function(val)
    _vfmg5kpn._c554l618 = val
    if val then _vfmg5kpn._c19r02ss = (0>1) end
end)

_fg7eldna(_ldgcwjh9, _xD("74|144|171|188|183|106|156|171|174|179|191|189"), 50, 2000, 500, function(val)
    _vfmg5kpn._c1ucr11a = val
end)

_fg7eldna(_ldgcwjh9, _xD("129|199|226|243|238|161|197|230|237|226|250"), 1, 100, 5, function(val)
    _vfmg5kpn._cej1dfa8 = val / 100
end)

_fwedmej7(_ldgcwjh9, _xD("84|128353|116|167|183|181|194|116|166|195|183|191|199|116|162|195|203"), Color3.fromRGB(40, 80, 160), function()
    local rocks = _fqdk74d8()
    _fr0i2b8u(_xD("115|185|226|232|225|215|147") .. #rocks .. _xD("116|148|230|227|215|223|231|163|215|230|237|231|232|213|224|231"))
end)

_fwedmej7(_ldgcwjh9, _xD("91|10026|123|168|196|201|192|123|169|192|188|205|192|206|207|123|173|202|190|198"), Color3.fromRGB(40, 120, 60), function()
    local rocks = _fqdk74d8()
    if #rocks > 0 then
        _f617ez8s(rocks[1])
    else
        _fr0i2b8u(_xD("44|122|155|76|158|155|143|151|159|76|146|155|161|154|144|77"))
    end
end)

_fwedmej7(_ldgcwjh9, _xD("67|9956|99|134|164|166|171|168|99|149|168|176|178|183|168|182"), Color3.fromRGB(100, 50, 150), function()
    _f9ir2ki1()
end)

local _l3pxfz1p = _vpw6qnkq[_xD("51|134|152|159|159")]

_ffbdaqdq(_l3pxfz1p, _xD("57|128233|89|122|142|141|136|89|140|126|133|133"))

_fqblradu(_l3pxfz1p, _xD("77|142|194|193|188|109|160|178|185|185"), (not true), function(val)
    _vfmg5kpn._cwfws4b8 = val
    if val then _f347hv6t() else _fydyasal() end
end)

_fg7eldna(_l3pxfz1p, _xD("51|134|152|159|159|83|133|148|151|156|168|166"), 50, 1000, 300, function(val)
    _vfmg5kpn._cad7eor5 = val
end)

_fg7eldna(_l3pxfz1p, _xD("98|181|199|206|206|130|166|199|206|195|219"), 1, 50, 3, function(val)
    _vfmg5kpn._cisn9zvr = val / 10
end)

_fwedmej7(_l3pxfz1p, _xD("86|128262|118|169|187|194|194|118|183|202|118|164|187|183|200|187|201|202|118|169|190|197|198"), Color3.fromRGB(140, 100, 30), function()
    local shops = _fqen8g17()
    if #shops > 0 then
        _fakpo0ga(shops[1])
    else
        _fr0i2b8u(_xD("47|125|158|79|162|151|158|159|162|79|149|158|164|157|147|80"))
    end
end)

_fwedmej7(_l3pxfz1p, _xD("43|128011|75|114|154|75|115|154|152|144|75|90|75|127|144|151|144|155|154|157|159|75|159|154|75|126|147|154|155"), Color3.fromRGB(80, 50, 150), function()
    local shops = _fqen8g17()
    if #shops > 0 then
        _fitqnoqn(shops[1].Part.Position)
        _fr0i2b8u(_xD("89|173|190|197|190|201|200|203|205|190|189|121|205|200|147|121") .. shops[1].Name)
    end
end)

_ffbdaqdq(_l3pxfz1p, _xD("114|128374|146|179|199|198|193|146|199|194|185|196|179|182|183"))

_fqblradu(_l3pxfz1p, _xD("100|165|217|216|211|132|185|212|203|214|197|200|201"), (0>1), function(val)
    _vfmg5kpn._cg3s4gld = val
    if val then _fdjeys13() else _fzvs1pno() end
end)

_fwedmej7(_l3pxfz1p, _xD("96|11110|128|181|208|199|210|193|196|197|128|161|204|204"), Color3.fromRGB(50, 130, 180), function()
    _femvr8ro(_xD("52|169|164|155|166|149|152|153"))
    _femvr8ro(_xD("44|142|161|165"))
    _femvr8ro(_xD("99|211|216|213|198|203|196|214|200"))
    _femvr8ro(_xD("112|231|209|226|221|228|216"))
    _femvr8ro(_xD("56|168|161|155|163|153|176|157"))
    _femvr8ro(_xD("87|185|184|186|194|199|184|186|194"))
    _femvr8ro(_xD("47|162|159|148|148|147"))
    _fr0i2b8u(_xD("51|121|156|165|152|151|83|168|163|154|165|148|151|152|83|165|152|160|162|167|152|166"))
end)

_ffbdaqdq(_l3pxfz1p, _xD("109|128087|141|177|178|193|178|176|193|178|177|141|192|181|188|189|192"))

_vg3o5x8g = Instance.new("ScrollingFrame")
_vg3o5x8g.Name = _xD("110|193|214|221|222|186|215|225|226")
_vg3o5x8g.Size = UDim2.new(1, 0, 0, 90)
_vg3o5x8g.BackgroundColor3 = Color3.fromRGB(18, 18, 30)
_vg3o5x8g.BorderSizePixel = 0
_vg3o5x8g.ScrollBarThickness = 2
_vg3o5x8g.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
_vg3o5x8g.CanvasSize = UDim2.new(0, 0, 0, 0)
_vg3o5x8g.AutomaticCanvasSize = Enum.AutomaticSize.Y
_vsfa6lk5 = _vsfa6lk5 + 1
_vg3o5x8g.LayoutOrder = _vsfa6lk5
_vg3o5x8g.Parent = _l3pxfz1p

local shopLCorner = Instance.new("UICorner")
shopLCorner.CornerRadius = UDim.new(0, 6)
shopLCorner.Parent = _vg3o5x8g

local shopLLayout = Instance.new("UIListLayout")
shopLLayout.SortOrder = Enum.SortOrder.LayoutOrder
shopLLayout.Padding = UDim.new(0, 2)
shopLLayout.Parent = _vg3o5x8g

local shopLPad = Instance.new("UIPadding")
shopLPad.PaddingTop = UDim.new(0, 2)
shopLPad.PaddingBottom = UDim.new(0, 2)
shopLPad.PaddingLeft = UDim.new(0, 2)
shopLPad.PaddingRight = UDim.new(0, 2)
shopLPad.Parent = _vg3o5x8g

local _lyldjgwm = _vpw6qnkq[_xD("53|122|136|133")]

_ffbdaqdq(_lyldjgwm, _xD("42|128107|74|111|125|122|74|89|74|128|115|125|127|107|118|125"))

_fqblradu(_lyldjgwm, _xD("106|173|220|227|221|222|203|214|138|153|138|188|217|205|213|138|175|189|186"), (not true), function(val)
    _vfmg5kpn._c2thgchu = val
    if val then _fahwopdf() else _f52m6u0f() end
end)

_fwedmej7(_lyldjgwm, _xD("97|128357|129|179|198|199|211|198|212|201|129|166|180|177"), Color3.fromRGB(50, 90, 160), function()
    if _vfmg5kpn._c2thgchu then
        _fs8o4sa7()
    else
        _fr0i2b8u(_xD("120|189|230|217|218|228|221|152|189|203|200|152|222|225|234|235|236|153"))
    end
end)

_fwedmej7(_lyldjgwm, _xD("94|10154|126|161|202|195|191|208|126|163|177|174"), Color3.fromRGB(150, 50, 50), function()
    _f52m6u0f()
end)

_ffbdaqdq(_lyldjgwm, _xD("110|129814|142|178|179|194|179|177|194|179|178|142|192|189|177|185|193"))

_vxzk4miv = Instance.new("ScrollingFrame")
_vxzk4miv.Name = _xD("73|155|184|172|180|149|178|188|189")
_vxzk4miv.Size = UDim2.new(1, 0, 0, 120)
_vxzk4miv.BackgroundColor3 = Color3.fromRGB(18, 18, 30)
_vxzk4miv.BorderSizePixel = 0
_vxzk4miv.ScrollBarThickness = 2
_vxzk4miv.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
_vxzk4miv.CanvasSize = UDim2.new(0, 0, 0, 0)
_vxzk4miv.AutomaticCanvasSize = Enum.AutomaticSize.Y
_vsfa6lk5 = _vsfa6lk5 + 1
_vxzk4miv.LayoutOrder = _vsfa6lk5
_vxzk4miv.Parent = _lyldjgwm

local rLCorner = Instance.new("UICorner")
rLCorner.CornerRadius = UDim.new(0, 6)
rLCorner.Parent = _vxzk4miv

local rLLayout = Instance.new("UIListLayout")
rLLayout.SortOrder = Enum.SortOrder.LayoutOrder
rLLayout.Padding = UDim.new(0, 2)
rLLayout.Parent = _vxzk4miv

local rLPad = Instance.new("UIPadding")
rLPad.PaddingTop = UDim.new(0, 2)
rLPad.PaddingBottom = UDim.new(0, 2)
rLPad.PaddingLeft = UDim.new(0, 2)
rLPad.PaddingRight = UDim.new(0, 2)
rLPad.Parent = _vxzk4miv

local _l1uvfunv = _vpw6qnkq[_xD("97|166|217|209|205|208|202|213")]

_ffbdaqdq(_l1uvfunv, _xD("70|127960|102|139|158|150|146|149|143|154|153"))

_fqblradu(_l1uvfunv, _xD("77|162|187|185|182|186|182|193|178|177|109|143|174|176|184|189|174|176|184"), (false), function(val)
    _vfmg5kpn._cq1te7c4 = val
    if val then _f2jk6i63() end
end)

_fqblradu(_l1uvfunv, _xD("40|125|150|148|145|149|145|156|141|140|72|116|157|139|147"), (nil~=nil), function(val)
    _vfmg5kpn._c918thr0 = val
    if val then _foqomzy9() end
end)

_fqblradu(_l1uvfunv, _xD("75|140|185|191|180|107|143|172|184|172|178|176"), (-1>0), function(val)
    _vfmg5kpn._cpzc4900 = val
    if val then _fufho8b8() else _f8owkba0() end
end)

_fqblradu(_l1uvfunv, _xD("98|163|208|214|203|130|168|212|199|199|220|199|130|138|185|195|212|207|214|202|139"), (0>1), function(val)
    _vfmg5kpn._c4dqc2td = val
    if val and not _vfmg5kpn._cpzc4900 then
        _vfmg5kpn._cpzc4900 = (not (-1>0))
        _fufho8b8()
    end
end)

_ffbdaqdq(_l1uvfunv, _xD("125|128042|157|202|204|211|194|202|194|203|209"))

_fqblradu(_l1uvfunv, _xD("130|213|242|231|231|230|162|196|241|241|245|246"), (nil~=nil), function(val)
    _vfmg5kpn._c1n8brbm = val
    _f8qecca1()
end)

_fg7eldna(_l1uvfunv, _xD("66|153|163|174|173|98|149|178|167|167|166"), 16, 200, 50, function(val)
    _vfmg5kpn._cgvcafd5 = val
    if _vfmg5kpn._c1n8brbm then _f8qecca1() end
end)

_fqblradu(_l1uvfunv, _xD("75|153|186|174|183|180|187"), (2<1), function(val)
    _vfmg5kpn._c9e96ycq = val
    if val then _f6rrymn2() else _fy5u34ix() end
end)

_fqblradu(_l1uvfunv, _xD("94|164|202|215"), (false), function(val)
    _vfmg5kpn._cydkd467 = val
    if val then _f1hpcap5() else _fkbykdh5() end
end)

_fg7eldna(_l1uvfunv, _xD("109|179|217|230|141|192|221|210|210|209"), 10, 200, 60, function(val)
    _vfmg5kpn._crz1g3pj = val
end)

_ffbdaqdq(_l1uvfunv, _xD("82|128312|114|155|166|151|159|114|150|167|162|151"))

local _vzanvlpf, _v1j6o7ci
_vzanvlpf, _v1j6o7ci = _flzxyqpx(_l1uvfunv, _xD("86|154|203|198|187|118|167|202|207"), "1", function(text)
    local num = tonumber(text)
    if (_j0~=nil) and (num and num > 0) then
        _vfmg5kpn._co5n0uzl = math.floor(num)
    end
end)

_fwedmej7(_l1uvfunv, _xD("72|128302|104|140|189|184|173|104|145|188|173|181|187|104|112") .. _vfmg5kpn._co5n0uzl .. _xD("114|234|155"), Color3.fromRGB(180, 60, 180), function()
    _felt293d(_vfmg5kpn._co5n0uzl)
end)

_ffbdaqdq(_l1uvfunv, _xD("76|128301|108|158|145|153|155|160|145|108|145|164|156|152|155|149|160|159"))

_fwedmej7(_l1uvfunv, _xD("111|128404|143|181|216|225|212|143|176|219|219|143|188|216|221|212|143|193|212|220|222|227|212|226"), Color3.fromRGB(160, 40, 40), function()
    _femvr8ro(_xD("55|164|160|165|156"))
    _femvr8ro(_xD("45|145|150|148"))
    _femvr8ro(_xD("122|226|219|236|240|223|237|238"))
    _femvr8ro(_xD("55|154|166|163|163|156|154|171"))
    _femvr8ro(_xD("82|180|196|183|179|189"))
    _fr0i2b8u(_xD("83|153|188|197|184|183|115|192|188|193|184|115|197|184|192|194|199|184|198"))
end)

_fwedmej7(_l1uvfunv, _xD("72|128248|104|142|177|186|173|104|137|180|180|104|155|173|180|180|104|154|173|181|183|188|173|187"), Color3.fromRGB(40, 140, 40), function()
    _femvr8ro(_xD("104|219|205|212|212"))
    _femvr8ro(_xD("45|160|146|153|153|142|153|153"))
    _femvr8ro(_xD("108|207|205|223|212"))
    _femvr8ro(_xD("111|220|222|221|212|232"))
    _femvr8ro(_xD("103|219|217|200|203|204"))
    _fr0i2b8u(_xD("66|136|171|180|167|166|98|181|167|174|174|98|180|167|175|177|182|167|181"))
end)

_fwedmej7(_l1uvfunv, _xD("70|11084|102|140|175|184|171|102|135|178|178|102|155|182|173|184|167|170|171|102|152|171|179|181|186|171|185"), Color3.fromRGB(40, 100, 160), function()
    _femvr8ro(_xD("60|177|172|163|174|157|160|161"))
    _femvr8ro(_xD("112|210|229|233"))
    _femvr8ro(_xD("122|234|239|236|221|226|219|237|223"))
    _femvr8ro(_xD("119|238|216|233|228|235|223"))
    _femvr8ro(_xD("96|208|201|195|203|193|216|197"))
    _femvr8ro(_xD("128|226|225|227|235|240|225|227|235"))
    _fr0i2b8u(_xD("110|180|215|224|211|210|142|227|222|213|224|207|210|211|142|224|211|219|221|226|211|225"))
end)

_fwedmej7(_l1uvfunv, _xD("67|127989|99|137|172|181|168|99|132|175|175|99|143|184|166|174|99|149|168|176|178|183|168|182"), Color3.fromRGB(140, 140, 40), function()
    _femvr8ro(_xD("121|229|238|220|228"))
    _femvr8ro(_xD("76|184|193|175|183|197"))
    _femvr8ro(_xD("56|158|167|170|172|173|166|157"))
    _femvr8ro(_xD("130|228|238|231|245|245|235|240|233"))
    _fr0i2b8u(_xD("55|125|160|169|156|155|87|163|172|154|162|87|169|156|164|166|171|156|170"))
end)

_fwedmej7(_l1uvfunv, _xD("42|128205|74|112|147|156|143|74|107|118|118|74|124|143|151|153|158|143|157|74|82|120|159|149|143|83"), Color3.fromRGB(200, 50, 50), function()
    for _, remote in ipairs(_vngy4ui1._spab0rkt) do
        pcall(function()
            if remote.Type == "RemoteEvent" then
                remote.Instance:FireServer()
            elseif remote.Type == "RemoteFunction" then
                remote.Instance:InvokeServer()
            end
        end)
    end
    _fr0i2b8u(_xD("56|134|141|131|125|124|88|153|164|164|88") .. #_vngy4ui1._spab0rkt .. _xD("110|142|224|211|219|221|226|211|225|143"))
end)

local _l9z3xjcu = _vpw6qnkq[_xD("114|191|219|229|213")]

_ffbdaqdq(_l9z3xjcu, _xD("112|128315|144|188|191|183"))

_v6gqiez5 = Instance.new("ScrollingFrame")
_v6gqiez5.Name = _xD("126|202|237|229|202|231|241|242")
_v6gqiez5.Size = UDim2.new(1, 0, 0, 100)
_v6gqiez5.BackgroundColor3 = Color3.fromRGB(12, 12, 20)
_v6gqiez5.BorderSizePixel = 0
_v6gqiez5.ScrollBarThickness = 2
_v6gqiez5.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
_v6gqiez5.CanvasSize = UDim2.new(0, 0, 0, 0)
_v6gqiez5.AutomaticCanvasSize = Enum.AutomaticSize.Y
_vsfa6lk5 = _vsfa6lk5 + 1
_v6gqiez5.LayoutOrder = _vsfa6lk5
_v6gqiez5.Parent = _l9z3xjcu

local logCorner = Instance.new("UICorner")
logCorner.CornerRadius = UDim.new(0, 6)
logCorner.Parent = _v6gqiez5

local logLayout = Instance.new("UIListLayout")
logLayout.SortOrder = Enum.SortOrder.LayoutOrder
logLayout.Parent = _v6gqiez5

local logPad = Instance.new("UIPadding")
logPad.PaddingTop = UDim.new(0, 3)
logPad.PaddingLeft = UDim.new(0, 3)
logPad.PaddingRight = UDim.new(0, 3)
logPad.Parent = _v6gqiez5

_ffbdaqdq(_l9z3xjcu, _xD("57|128336|89|125|130|140|124|136|139|125|89|144|126|123|129|136|136|132"))

_fqblradu(_l9z3xjcu, _xD("98|167|208|195|196|206|199|130|185|199|196|202|209|209|205"), (-1>0), function(val)
    _vfmg5kpn._cvuycazv = val
end)

_flzxyqpx(_l9z3xjcu, _xD("89|176|190|187|193|200|200|196|121|174|171|165"), "", function(text)
    _vfmg5kpn._ccyfm2b6 = text
end)

_fqblradu(_l9z3xjcu, _xD("86|156|183|200|195|118|162|197|189|201"), (0<1), function(val)
    _vfmg5kpn._cx3jf8cs = val
end)

_fqblradu(_l9z3xjcu, _xD("40|123|141|148|148|72|116|151|143|155"), (not (-1>0)), function(val)
    _vfmg5kpn._cw8dzcqw = val
end)

_fqblradu(_l9z3xjcu, _xD("51|134|167|148|167|166|83|127|162|154|166"), (-1<0), function(val)
    _vfmg5kpn._c4b0fo94 = val
end)

_fwedmej7(_l9z3xjcu, _xD("52|128284|84|135|153|162|152|84|135|168|149|168|167|84|130|163|171"), Color3.fromRGB(50, 90, 160), function()
    _foxsyh1o()
    _fr0i2b8u(_xD("101|184|202|211|217|133|216|217|198|217|216|133|217|212|133|220|202|199|205|212|212|208"))
end)

_fwedmej7(_l9z3xjcu, _xD("70|129584|102|154|171|185|186|102|157|171|168|174|181|181|177"), Color3.fromRGB(90, 60, 140), function()
    _fetm6cpp({content = _xD("87|129|129|178|164|192|197|188|184|119|164|198|204|197|203|184|192|197|119|205|141|180|129|129|119|174|188|185|191|198|198|194|119|203|188|202|203|119|202|204|186|186|188|202|202|189|204|195|120|119|10076")})
    _fr0i2b8u(_xD("112|196|213|227|228|213|212|144|231|213|210|216|223|223|219"))
end)

_ffbdaqdq(_l9z3xjcu, _xD("95|128390|127|180|179|168|171|168|179|168|164|178"))

_fwedmej7(_l9z3xjcu, _xD("51|128019|83|135|152|159|152|163|162|165|167|83|167|162|83|134|163|148|170|161"), Color3.fromRGB(60, 90, 140), function()
    local spawns = Workspace:FindFirstChild(_xD("120|203|232|217|239|230|196|231|219|217|236|225|231|230")) or Workspace:FindFirstChild(_xD("93|176|205|190|212|203|208")) or Workspace:FindFirstChild(_xD("43|119|154|141|141|164"))
    if (_j0~=nil) and (spawns) then
        if spawns:IsA("BasePart") then
            _fitqnoqn(spawns.Position)
        else
            local spawn = spawns:FindFirstChildWhichIsA("BasePart")
            if spawn then _fitqnoqn(spawn.Position) end
        end
    else
        _fr0i2b8u(_xD("40|118|151|72|155|152|137|159|150|72|142|151|157|150|140|73"))
    end
end)

_fwedmej7(_l9z3xjcu, _xD("91|128047|123|175|192|199|192|203|202|205|207|123|207|202|123|168|202|208|201|207|188|196|201|123|175|202|203"), Color3.fromRGB(100, 60, 140), function()
    if (type(1)=="number") and (_fuzf32j8()) then
        local _lef1501k = HumanoidRootPart.Position.Y
        local highestPart = nil
        for _, part in ipairs(Workspace:GetDescendants()) do
            if (type(1)=="number") and (part:IsA("BasePart") and part.Position.Y > _lef1501k) then
                _lef1501k = part.Position.Y
                highestPart = part
            end
        end
        if highestPart then
            _fitqnoqn(highestPart.Position + Vector3.new(0, 10, 0))
            _fr0i2b8u(_xD("72|156|173|180|173|184|183|186|188|173|172|104|188|183|104|176|177|175|176|173|187|188|104|184|183|177|182|188|130|104") .. math.floor(_lef1501k))
        end
    end
end)

_fwedmej7(_l9z3xjcu, _xD("81|128341|113|163|182|187|192|186|191|113|164|182|195|199|182|195"), Color3.fromRGB(100, 100, 50), function()
    pcall(function()
        LocalPlayer:Kick(_xD("112|194|213|218|223|217|222|217|222|215|158|158|158"))
        task.wait(1)
        game:GetService(_xD("94|178|195|202|195|206|205|208|210|177|195|208|212|199|193|195")):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end)
end)

_ffbdaqdq(_l9z3xjcu, _xD("94|8599|126|167|172|164|173"))

_vsfa6lk5 = _vsfa6lk5 + 1
local infoLabel = Instance.new("TextLabel")
infoLabel.Size = UDim2.new(1, 0, 0, 50)
infoLabel.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
infoLabel.BorderSizePixel = 0
infoLabel.Text = _xD("93|170|198|203|194|190|125|170|204|210|203|209|190|198|203|125|211|147|125|178|201|209|198|202|190|209|194|185|203|158|210|209|204|125|163|190|207|202|125|217|125|162|176|173|125|217|125|162|213|205|201|204|198|209|208|125|217|125|161|210|205|194|185|203|180|204|207|200|208|125|204|203|125|161|194|201|209|190|137|125|176|214|203|190|205|208|194|137|125|168|175|171|169|137|125|163|201|210|213|210|208")
infoLabel.TextColor3 = Color3.fromRGB(140, 160, 200)
infoLabel.Font = Enum.Font.Gotham
infoLabel.TextSize = _viviujy2 and 9 or 10
infoLabel.LayoutOrder = _vsfa6lk5
infoLabel.Parent = _l9z3xjcu

local infoCorner = Instance.new("UICorner")
infoCorner.CornerRadius = UDim.new(0, 6)
infoCorner.Parent = infoLabel

_va9mu7w7.MouseButton1Click:Connect(function()
    _vngy4ui1._sqki7ryk = ({}==nil)
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local tween = TweenService:Create(_v4n0dhc4, tweenInfo, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.025, 0, 0.03, 0),
    })
    tween:Play()
    tween.Completed:Connect(function()
        _v4n0dhc4.Visible = (not true)
        _vbibkfpc.Visible = (0<1)
        _vbibkfpc.Size = UDim2.new(0, 0, 0, 0)
        local expandTween = TweenService:Create(_vbibkfpc, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = _vay7ze84,
        })
        expandTween:Play()
    end)
end)

_v061siw4.MouseButton1Click:Connect(function()
    _vngy4ui1._sqki7ryk = (-1>0)
    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local tween = TweenService:Create(_vbibkfpc, tweenInfo, {
        Size = UDim2.new(0, 0, 0, 0),
    })
    tween:Play()
    tween.Completed:Connect(function()
        _vbibkfpc.Visible = (2<1)
        _v4n0dhc4.Visible = ({}==nil)
        _v4n0dhc4.Size = UDim2.new(0, 0, 0, 0)
        local expandTween = TweenService:Create(_v4n0dhc4, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = _v1hdn2zz,
        })
        expandTween:Play()
    end)
end)

local _vqe9q1dt = (2<1)
local _vafu3ymj
local _v6b82g3w
local _vdf0vrb3

local function _ftg8tshc(input)
    local delta = input.Position - _v6b82g3w
    local target = _vngy4ui1._sqki7ryk and _vbibkfpc or _v4n0dhc4
    target.Position = UDim2.new(
        _vdf0vrb3.X.Scale, _vdf0vrb3.X.Offset + delta.X,
        _vdf0vrb3.Y.Scale, _vdf0vrb3.Y.Offset + delta.Y
    )
end

local function _fuiyslsb(frame)
    frame.InputBegan:Connect(function(input)
        if (math.abs(0)==0) and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            _vqe9q1dt = (2>1)
            _v6b82g3w = input.Position
            _vdf0vrb3 = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    _vqe9q1dt = (-1>0)
                end
            end)
        end
    end)
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            _vafu3ymj = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if (type(1)=="number") and (input == _vafu3ymj and _vqe9q1dt) then
            _ftg8tshc(input)
        end
    end)
end

_fuiyslsb(_vlzeri6g)
_fuiyslsb(_vbibkfpc)

task.spawn(function()
    while (not (2<1)) do
        task.wait(5)
        if (tostring(1)~="nil") and (_vfmg5kpn._cwfws4b8 or _vfmg5kpn._c2li3eru) then
            _f1v4pdh0()
        end

        if (_j0~=nil) and (_vfmg5kpn._cvuycazv and _vfmg5kpn._c4b0fo94) then
            pcall(_foxsyh1o)
        end
    end
end)


task.spawn(function()
    while ({}==nil) do
        task.wait(10)
        pcall(function()
            local shops = _fqen8g17()
            if _vg3o5x8g then
                _vg3o5x8g:ClearAllChildren()
                for i, shop in ipairs(shops) do
                    if i > 15 then break end
                    local btn = Instance.new("TextButton")
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Color3.fromRGB(30, 35, 50)
                    btn.BorderSizePixel = 0
                    btn.Text = shop.Name .. " [" .. math.floor(shop.Distance) .. _xD("64|173|157")
                    btn.TextColor3 = Color3.fromRGB(200, 220, 255)
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = 11
                    btn.Parent = _vg3o5x8g
                    local bCorner = Instance.new("UICorner")
                    bCorner.CornerRadius = UDim.new(0, 5)
                    bCorner.Parent = btn
                    btn.MouseButton1Click:Connect(function()
                        _fitqnoqn(shop.Part.Position)
                        _fr0i2b8u(_xD("127|211|228|235|228|239|238|241|243|228|227|159|243|238|185|159") .. shop.Name)
                    end)
                end
            end
        end)

        pcall(function()
            local rocks = _fqdk74d8()
            if _vxzk4miv then
                _vxzk4miv:ClearAllChildren()
                for i, rock in ipairs(rocks) do
                    if i > 20 then break end
                    local btn = Instance.new("TextButton")
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Color3.fromRGB(30, 35, 50)
                    btn.BorderSizePixel = 0
                    btn.Text = rock.Name .. " [" .. math.floor(rock.Distance) .. _xD("42|151|135") .. (rock.Value > 0 and (" $" .. rock.Value) or "")
                    btn.TextColor3 = rock.Value > 0 and Color3.fromRGB(255, 215, 100) or Color3.fromRGB(200, 255, 200)
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = 11
                    btn.Parent = _vxzk4miv
                    local bCorner = Instance.new("UICorner")
                    bCorner.CornerRadius = UDim.new(0, 5)
                    bCorner.Parent = btn
                    btn.MouseButton1Click:Connect(function()
                        _fitqnoqn(rock.Part.Position)
                        _fr0i2b8u(_xD("102|186|203|210|203|214|213|216|218|203|202|134|218|213|160|134") .. rock.Name)
                    end)
                end
            end
        end)
    end
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    HumanoidRootPart = char:WaitForChild(_xD("91|163|208|200|188|201|202|196|191|173|202|202|207|171|188|205|207"))
    Humanoid = char:WaitForChild(_xD("53|125|170|162|150|163|164|158|153"))
    _fr0i2b8u(_xD("127|194|231|224|241|224|226|243|228|241|159|241|228|242|239|224|246|237|228|227"))


    if _vfmg5kpn._c1n8brbm then
        task.delay(1, function()
            _f8qecca1()
        end)
    end
end)

Workspace.CurrentCamera:GetPropertyChangedSignal(_xD("98|184|203|199|217|210|209|212|214|181|203|220|199")):Connect(function()
    local newSize = Workspace.CurrentCamera.ViewportSize
    local isMob = newSize.X < 800
    _v1hdn2zz = isMob and UDim2.new(0.95, 0, 0, 480) or UDim2.new(0, 380, 0, 540)
    if (tostring(1)~="nil") and (not _vngy4ui1._sqki7ryk) then
        _v4n0dhc4.Size = _v1hdn2zz
    end
end)

if _v1s5i06j then
    pcall(function()
        setsimulationradius(1e9, 1e9)
    end)
end

_fr0i2b8u(_xD("109|186|214|219|210|206|141|186|220|226|219|225|206|214|219|141|227|163|141|194|185|193|182|186|174|193|178|141|185|220|206|209|210|209|142"))
_fr0i2b8u(_xD("77|142|194|193|188|109|147|174|191|186|109|201|109|146|160|157|109|201|109|146|197|189|185|188|182|193|192|109|201|109|145|194|189|178"))
_fr0i2b8u(_xD("75|142|172|174|179|176|107|189|176|184|186|191|176|190|107|177|180|189|190|191|107|177|186|189|107|173|176|190|191|107|189|176|190|192|183|191|190|108"))


task.delay(3, function()
    _f9ir2ki1()
end)
