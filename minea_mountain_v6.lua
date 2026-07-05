--[[
    Mv6
    r4.2.1
]]
local _xD=function(s)local o=tonumber(s:match("^(%d+)%|"))local r=""for c in s:gmatch("(%d+)")do local n=tonumber(c)-o;if n>0 then r=r..string.char(n)end end;return r end

local Players = game:GetService(_xD("108|188|216|205|229|209|222|223"))
local ReplicatedStorage = game:GetService(_xD("86|168|187|198|194|191|185|183|202|187|186|169|202|197|200|183|189|187"))
local Workspace = game:GetService(_xD("54|141|165|168|161|169|166|151|153|155"))
local RunService = game:GetService(_xD("98|180|215|208|181|199|212|216|203|197|199"))
local TweenService = game:GetService(_xD("63|147|182|164|164|173|146|164|177|181|168|162|164"))
local UserInputService = game:GetService(_xD("122|207|237|223|236|195|232|234|239|238|205|223|236|240|227|221|223"))
local HttpService = game:GetService(_xD("110|182|226|226|222|193|211|224|228|215|209|211"))
local StarterGui = game:GetService(_xD("109|192|225|206|223|225|210|223|180|226|214"))
local Lighting = game:GetService(_xD("101|177|206|204|205|217|206|211|204"))

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild(_xD("120|192|237|229|217|230|231|225|220|202|231|231|236|200|217|234|236"))
local Humanoid = Character:WaitForChild(_xD("99|171|216|208|196|209|210|204|199"))

if false then local _diwwapdq=table.create(856,nil) end
local _vigmhnzg = {
    _cq0k5ozj = false,
    _ci3ro08l = false,
    _czs09h1q = false,
    _cz5fhocm = false,
    _coe01omh = false,
    _cplh5ibi = false,
    _ca54l82p = false,
    _ce4vi9nh = false,
    _cr4fnm79 = false,
    _cqgz5lhy = false,
    _cd4afzmc = false,
    _c2iqjsp8 = 500,
    _chckexjd = 300,
    _chhnsimz = 0.05,
    _c2u7t7zw = 0.3,
    _cece36wd = 0.03,
    _csiv0fed = 50,
    _c7u9wvut = 100,
    _clebcwww = 60,
    _chhggl0w = true,
    _c43hvqpz = false,
    _c5fo1mye = 1,
    _cy11p9hq = "",
    _cr3pam97 = false,
    _cj0i834c = true,
    _c5g5l6rn = true,
    _cqprlben = true,
}

if false then local _di2tl37p=typeof(Instance.new("Part")) end
local _v4a9zyim = {
    _swgzbpa6 = nil,
    _s7il5eud = nil,
    _sdvzpfia = {},
    _senuq237 = nil,
    _st16jmwo = nil,
    _s1lsi2mp = nil,
    _sql8ygxb = nil,
    _snxjsxkt = false,
    _s71sqkis = _xD("96|174|207|206|197"),
    _s0886rnb = 0,
    _sxz16dwg = 0,
    _s181j31y = 0,
    _ss72gz3c = 0,
    _seven93d = 0,
    _s1ik637n = {},
    _sdeowm3i = {},
    _svnug2j5 = {},
    _stz0g3yi = _xD("123|193|220|237|232"),
}

if false then local _dcj55qge=math.floor(math.random()*504) end
local _v0dnugj4 = (getgenv ~= nil)
local _vap6d5pl = _v0dnugj4 and getgenv() or _G
local _v2i6yddw = (hookmetamethod ~= nil)
local _vqdagx5g = (newcclosure ~= nil)
local _vcb67n4d = (getrawmetatable ~= nil)
local _v1ompnhx = (setreadonly ~= nil)
local _vxf2xe69 = (fireclickdetector ~= nil)
local _vs9qz7wy = (fireproximityprompt ~= nil)
local _v1jxcn77 = (firetouchinterest ~= nil)
if false then local _dz0x6fiy=typeof(Instance.new("Part")) end
local _voc7qbo6 = (sethiddenproperty ~= nil)
local _vn8fkdqb = (setsimulationradius ~= nil)
local _v0tzmqfm = (getconnections ~= nil)
local _v37nqx6e = (syn ~= nil and syn.protect_gui ~= nil)
local _v0hy5mx4 = (checkcaller ~= nil)

local _vy6bxj0q = {}

do

    if _v2i6yddw and _vqdagx5g and _vcb67n4d and _v1ompnhx then
        local _v2h3udij
        _v2h3udij = hookmetamethod(game, _xD("40|135|135|150|137|149|141|139|137|148|148"), newcclosure(function(self, ...)
            local method = getnamecallmethod()
            local args = {...}


            if method == _xD("115|185|220|225|215|198|216|229|233|220|214|216") then
                local _lo4v0va2 = args[1]
                if _lo4v0va2 == _xD("52|121|172|164|160|163|157|168|135|153|166|170|157|151|153") or _lo4v0va2 == _xD("67|134|171|168|164|183|150|168|181|185|172|166|168") then
                    return nil
                end
            end


            if method == _xD("58|129|159|174|141|157|172|163|170|174|124|179|174|159|157|169|158|159") then
                if _v0hy5mx4 and checkcaller() then
                    return _v2h3udij(self, ...)
                end
            end


            if method == _xD("71|146|176|170|178") and self == LocalPlayer then
                return nil
            end

            return _v2h3udij(self, ...)
        end))


        local _vr5gsb2q
        _vr5gsb2q = hookmetamethod(game, _xD("108|203|203|213|218|208|209|228"), newcclosure(function(self, key)
            if self == Humanoid then
                if key == _xD("42|129|139|150|149|125|154|143|143|142") and _vigmhnzg._cr4fnm79 then
                    return 16
                end
                if key == _xD("46|120|163|155|158|126|157|165|147|160") and _vigmhnzg._c7u9wvut > 50 then
                    return 50
                end
            end
            return _vr5gsb2q(self, key)
        end))


        local _vopcg2yu
        _vopcg2yu = hookmetamethod(game, _xD("103|198|198|213|204|222|208|213|203|204|223"), newcclosure(function(self, key, value)
            if self == Humanoid then
                if key == _xD("54|141|151|162|161|137|166|155|155|154") then
                    if _vigmhnzg._cr4fnm79 then
                        return _vopcg2yu(self, key, _vigmhnzg._csiv0fed)
                    end
                end
                if key == _xD("58|132|175|167|170|138|169|177|159|172") then
                    return _vopcg2yu(self, key, value)
                end
            end
            return _vopcg2yu(self, key, value)
        end))
    end


    if _v2i6yddw and _vqdagx5g then
        local _vfq5avdn
        _vfq5avdn = hookmetamethod(game, _xD("89|184|184|199|186|198|190|188|186|197|197"), newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if method == _xD("43|118|148|142|150") and self == LocalPlayer then
                return nil
            end
            return _vfq5avdn(self, ...)
        end))
    end
end

if false then local _dywoy7zk=typeof(Instance.new("Part")) end
local function _fawdpprj()
    Character = LocalPlayer.Character
    if Character then
        HumanoidRootPart = Character:FindFirstChild(_xD("127|199|244|236|224|237|238|232|227|209|238|238|243|207|224|241|243"))
        Humanoid = Character:FindFirstChild(_xD("61|133|178|170|158|171|172|166|161"))
    end
    return Character and HumanoidRootPart and Humanoid
end

if false then local _dqa3d442=typeof(Instance.new("Part")) end
local function _fmmryqtb(part)
    if not _fawdpprj() then return math.huge end
    return (HumanoidRootPart.Position - part.Position).Magnitude
end

local function _f6gxrnr7(position)
    if not _fawdpprj() then return false end
    HumanoidRootPart.CFrame = CFrame.new(position + Vector3.new(0, 3, 0))
    task.wait(_vigmhnzg._cece36wd)
    return true
end

local function _fc09jgqw(cframe)
    if not _fawdpprj() then return false end
    HumanoidRootPart.CFrame = cframe + Vector3.new(0, 3, 0)
    task.wait(_vigmhnzg._cece36wd)
    return true
end

if false then local _dvquavg5=table.create(676,nil) end
local function _ffeb10zc(message)
    local timestamp = os.date(_xD("87|124|159|145|124|164|145|124|170"))
    table.insert(_v4a9zyim._s1ik637n, 1, "[" .. timestamp .. "] " .. message)
    if #_v4a9zyim._s1ik637n > 50 then
        table.remove(_v4a9zyim._s1ik637n)
    end
    if _v067lq9m then
        pcall(function()
            _v067lq9m:ClearAllChildren()
            for i, log in ipairs(_v4a9zyim._s1ik637n) do
                if i > 15 then break end
                local label = Instance.new("TextLabel")
                label.Size = UDim2.new(1, 0, 0, 18)
                label.BackgroundTransparency = 1
                label.Text = log
                label.TextColor3 = Color3.fromRGB(200, 200, 200)
                label.TextXAlignment = Enum.TextXAlignment.Left
                label.Font = Enum.Font.Gotham
                label.TextSize = 11
                label.Parent = _v067lq9m
            end
        end)
    end
end

if false then local _d4ruas3r=typeof(Instance.new("Part")) end
local function _fxwruyyt()
    _v4a9zyim._svnug2j5 = {}
    pcall(function()
        for _, remote in ipairs(ReplicatedStorage:GetDescendants()) do
            if remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction") then
                table.insert(_v4a9zyim._svnug2j5, {
                    Instance = remote,
                    Name = remote.Name,
                    Type = remote.ClassName,
                })
            end
        end
    end)
    _ffeb10zc(_xD("87|154|184|186|191|188|187|119") .. #_v4a9zyim._svnug2j5 .. _xD("122|154|236|223|231|233|238|223|237"))
end

if false then local _dz55pw04=typeof(Instance.new("Part")) end
local function _fzl9jbw2(namePattern, ...)
    local args = {...}
    for _, remote in ipairs(_v4a9zyim._svnug2j5) do
        local rName = string.lower(remote.Name)
        local pattern = string.lower(namePattern)
        if string.find(rName, pattern) then
            pcall(function()
                if remote.Type == "RemoteEvent" then
                    remote.Instance:FireServer(unpack(args))
                elseif remote.Type == "RemoteFunction" then
                    remote.Instance:InvokeServer(unpack(args))
                end
            end)
        end
    end
end

local function _fjmballg(name, ...)
    local args = {...}
    for _, remote in ipairs(_v4a9zyim._svnug2j5) do
        if remote.Name == name then
            pcall(function()
                if remote.Type == "RemoteEvent" then
                    remote.Instance:FireServer(unpack(args))
                elseif remote.Type == "RemoteFunction" then
                    remote.Instance:InvokeServer(unpack(args))
                end
            end)
            return true
        end
    end
    return false
end

local _vnh0gqwm = {
    _xD("40|154|151|139|147"), _xD("118|229|232|219"), _xD("108|223|224|219|218|209"), _xD("101|210|206|211|202|215|198|209"), _xD("63|162|177|184|178|179|160|171"), _xD("59|162|160|168"), _xD("116|215|227|213|224"), _xD("61|166|175|172|171"),
    _xD("110|213|221|218|210"), _xD("55|155|160|152|164|166|165|155"), _xD("67|166|178|179|179|168|181"), _xD("59|174|164|167|177|160|173"), _xD("47|161|164|145|168"), _xD("129|230|238|230|243|226|237|229"), _xD("122|237|219|234|234|226|227|236|223"),
    _xD("41|138|150|142|157|145|162|156|157"), _xD("100|210|211|200|201"), _xD("98|216|199|203|208"), _xD("74|174|175|186|185|189|179|190"), _xD("89|187|200|206|197|189|190|203"), _xD("79|194|195|176|193|194|176|191|191|183|184|193|180"),
    _xD("50|166|161|162|147|172"), _xD("130|241|242|227|238"), _xD("88|200|189|185|202|196"), _xD("112|218|209|212|213"), _xD("109|222|226|206|223|225|231"), _xD("108|219|206|223|213|208|213|205|218"), _xD("97|205|194|209|202|212"),
    _xD("52|161|157|168|156|166|157|160"), _xD("68|184|173|184|165|178|173|185|177"), _xD("104|216|212|201|220|209|214|221|213"), _xD("84|196|185|198|189|184|195|200"), _xD("57|179|162|171|156|168|167"), _xD("88|191|185|202|198|189|204"),
    _xD("114|211|227|231|211|223|211|228|219|224|215"), _xD("52|151|157|168|166|157|162|153"), _xD("115|231|212|225|237|212|225|220|231|216"), _xD("76|185|187|187|186|191|192|187|186|177"), _xD("109|224|226|219|224|225|220|219|210"),
    _xD("112|210|220|223|223|212|227|228|223|222|213"), _xD("43|154|153|164|163"), _xD("121|237|232|238|235|230|218|229|226|231|222"), _xD("127|242|239|232|237|228|235"), _xD("66|164|167|180|187|174"), _xD("111|210|215|208|219|210|212|211|222|221|232"),
}

local function _fkqbf2wo()
    local rocks = {}
    local function _f9y6jhxu(parent)
        if not parent then return end
        for _, child in ipairs(parent:GetChildren()) do
            local nameLower = string.lower(child.Name)
            if child:IsA("BasePart") or child:IsA("Model") then
                local matched = false
                for _, pattern in ipairs(_vnh0gqwm) do
                    if string.find(nameLower, pattern) then
                        matched = true
                        break
                    end
                end
                if matched then
                    local part = child:IsA("BasePart") and child or child:FindFirstChildWhichIsA("BasePart")
                    if part then
                        local dist = _fmmryqtb(part)
                        if dist <= _vigmhnzg._c2iqjsp8 then

                            local value = 0
                            pcall(function()
                                local val = child:FindFirstChild(_xD("46|132|143|154|163|147")) or child:FindFirstChild(_xD("97|177|211|202|196|198")) or child:FindFirstChild(_xD("54|141|165|168|170|158")) or child:FindFirstChild(_xD("53|139|150|161|170|154|132|171|154|167|167|158|153|154"))
                                if val and val:IsA("ValueBase") then
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
                    _f9y6jhxu(child)
                end
            end
        end
    end

    local searchAreas = {
        Workspace:FindFirstChild(_xD("118|200|229|217|225|233")),
        Workspace:FindFirstChild(_xD("128|207|242|229|243")),
        Workspace:FindFirstChild(_xD("52|129|157|162|153|166|149|160|167")),
        Workspace:FindFirstChild(_xD("109|186|214|219|210|224")),
        Workspace:FindFirstChild(_xD("64|146|165|179|175|181|178|163|165|179")),
        Workspace:FindFirstChild(_xD("43|120|140|155")),
        Workspace:FindFirstChild(_xD("106|190|207|220|220|203|211|216")),
        Workspace:FindFirstChild(_xD("71|138|185|192|186|187|168|179|186")),
        Workspace:FindFirstChild(_xD("60|137|171|177|170|176|157|165|170")),
        Workspace,
    }

    for _, area in ipairs(searchAreas) do
        if area then
            _f9y6jhxu(area)
        end
    end


    if _vigmhnzg._c43hvqpz then
        table.sort(rocks, function(a, b) return a.Value > b.Value end)
    elseif _vigmhnzg._chhggl0w then
        table.sort(rocks, function(a, b) return a.Distance < b.Distance end)
    end

    return rocks
end

local function _foyeamoi()
    local shops = {}
    local function _f882m6dx(parent)
        if not parent then return end
        for _, child in ipairs(parent:GetChildren()) do
            local nameLower = string.lower(child.Name)
            if child:IsA("Model") or child:IsA("BasePart") then
                if string.find(nameLower, _xD("74|189|178|185|186")) or string.find(nameLower, _xD("76|191|177|184|184")) or
                   string.find(nameLower, _xD("95|210|211|206|209|196")) or string.find(nameLower, _xD("58|167|159|172|157|162|155|168|174")) or
                   string.find(nameLower, _xD("76|192|190|173|176|177|190")) or string.find(nameLower, _xD("129|229|230|226|237|230|243")) or
                   string.find(nameLower, _xD("85|194|182|199|192|186|201")) or string.find(nameLower, _xD("68|186|169|178|168|179|182")) or
                   string.find(nameLower, _xD("115|214|212|230|219|220|216|229")) or string.find(nameLower, _xD("41|139|158|162|142|155")) or
                   string.find(nameLower, _xD("130|240|242|229")) or string.find(nameLower, _xD("49|148|146|164|153")) or
                   string.find(nameLower, _xD("124|228|235|233|225")) or string.find(nameLower, _xD("52|150|149|167|153")) or
                   string.find(nameLower, _xD("130|229|227|239|242")) then
                    local part = child:IsA("BasePart") and child or child:FindFirstChildWhichIsA("BasePart") or child:FindFirstChild(_xD("92|164|209|201|189|202|203|197|192|174|203|203|208|172|189|206|208"))
                    if part then
                        local dist = _fmmryqtb(part)
                        table.insert(shops, {
                            Instance = child,
                            Part = part,
                            Distance = dist,
                            Name = child.Name,
                        })
                    end
                end
                if #child:GetChildren() > 0 then
                    _f882m6dx(child)
                end
            end
        end
    end

    _f882m6dx(Workspace)
    table.sort(shops, function(a, b) return a.Distance < b.Distance end)
    return shops
end

local function _fmvl0v3o(_lfo8il5l)
    local rock = _lfo8il5l.Instance
    local part = _lfo8il5l.Part

    if not rock or not rock.Parent then return false end

    _ffeb10zc(_xD("63|140|168|173|168|173|166|121|95") .. _lfo8il5l.Name)


    _f6gxrnr7(part.Position)
    task.wait(0.05)


    if _vxf2xe69 then
        local _lthbgfa9 = rock:FindFirstChildOfClass("ClickDetector") or part:FindFirstChildOfClass("ClickDetector")
        if _lthbgfa9 then
            fireclickdetector(_lthbgfa9)
        end
    end


    if _vs9qz7wy then
        local prompt = rock:FindFirstChildOfClass("ProximityPrompt") or part:FindFirstChildOfClass("ProximityPrompt")
        if prompt then
            fireproximityprompt(prompt)
        end
    end


    if _v1jxcn77 then
        firetouchinterest(HumanoidRootPart, part, 0)
        task.wait(0.01)
        firetouchinterest(HumanoidRootPart, part, 1)
    end


    local tool = Character and Character:FindFirstChildOfClass("Tool")
    if tool then
        tool:Activate()
    end


    _fzl9jbw2(_xD("112|221|217|222|213"))
    _fzl9jbw2(_xD("111|215|208|225|229|212|226|227"))
    _fzl9jbw2(_xD("41|140|152|149|149|142|140|157"))
    _fzl9jbw2(_xD("90|188|204|191|187|197"))
    _fzl9jbw2(_xD("121|224|218|237|225|222|235"))
    _fzl9jbw2(_xD("93|193|198|196"))
    _fzl9jbw2(_xD("67|179|172|166|174"))
    _fzl9jbw2(_xD("61|176|180|166|171|164"))


    for _, remote in ipairs(_v4a9zyim._svnug2j5) do
        local rName = string.lower(remote.Name)
        if string.find(rName, _xD("49|158|154|159|150")) or string.find(rName, _xD("47|147|152|150")) or string.find(rName, _xD("94|198|191|208|212|195|209|210")) then
            pcall(function()
                if remote.Type == "RemoteEvent" then
                    remote.Instance:FireServer(rock, part)
                elseif remote.Type == "RemoteFunction" then
                    remote.Instance:InvokeServer(rock, part)
                end
            end)
        end
    end

    _v4a9zyim._s0886rnb = _v4a9zyim._s0886rnb + 1

    return true
end

local function _fwpee97o(_lg9f48y8)
    if not _lg9f48y8 then return false end

    local shop = _lg9f48y8.Instance
    local part = _lg9f48y8.Part

    _ffeb10zc(_xD("123|206|224|231|231|228|233|226|155|220|239|181|155") .. _lg9f48y8.Name)


    _f6gxrnr7(part.Position)
    task.wait(0.1)


    if _vxf2xe69 then
        local _lthbgfa9 = shop:FindFirstChildOfClass("ClickDetector") or part:FindFirstChildOfClass("ClickDetector")
        if _lthbgfa9 then
            fireclickdetector(_lthbgfa9)
        end
    end


    if _vs9qz7wy then
        local prompt = shop:FindFirstChildOfClass("ProximityPrompt") or part:FindFirstChildOfClass("ProximityPrompt")
        if prompt then
            fireproximityprompt(prompt)
        end
    end


    if _v1jxcn77 then
        firetouchinterest(HumanoidRootPart, part, 0)
        task.wait(0.01)
        firetouchinterest(HumanoidRootPart, part, 1)
    end


    _fzl9jbw2(_xD("54|169|155|162|162"))
    _fzl9jbw2(_xD("56|171|160|167|168"))
    _fzl9jbw2(_xD("99|208|196|213|206|200|215"))
    _fzl9jbw2(_xD("78|194|192|175|178|179"))
    _fzl9jbw2(_xD("119|218|216|234|223"))
    _fzl9jbw2(_xD("64|173|175|174|165|185"))
    _fzl9jbw2(_xD("77|192|178|185|185|174|185|185"))
    _fzl9jbw2(_xD("55|170|156|163|163|150|152|163|163"))

    _v4a9zyim._sxz16dwg = _v4a9zyim._sxz16dwg + 1

    return true
end

local function _f9r07484()
    if _v4a9zyim._swgzbpa6 then return end
    _ffeb10zc(_xD("107|172|224|223|218|139|177|204|221|216|139|190|191|172|189|191|176|175"))

    _v4a9zyim._swgzbpa6 = RunService.Heartbeat:Connect(function()
        if not _vigmhnzg._cq0k5ozj then return end
        if not _fawdpprj() then return end

        local rocks = _fkqbf2wo()
        if #rocks > 0 then
            local target = rocks[1]
            _v4a9zyim._s71sqkis = target.Name
            _fmvl0v3o(target)
            task.wait(_vigmhnzg._chhnsimz)
        else
            _v4a9zyim._s71sqkis = _xD("113|196|214|210|227|212|217|218|223|216|159|159|159")
        end
    end)
end

local function _fx3861n5()
    if _v4a9zyim._swgzbpa6 then
        _v4a9zyim._swgzbpa6:Disconnect()
        _v4a9zyim._swgzbpa6 = nil
    end
    _v4a9zyim._s71sqkis = _xD("47|125|158|157|148")
    _ffeb10zc(_xD("83|148|200|199|194|115|153|180|197|192|115|166|167|162|163|163|152|151"))
end

local function _f4c6rv42()
    if _v4a9zyim._s7il5eud then return end
    _ffeb10zc(_xD("43|108|160|159|154|75|126|144|151|151|75|126|127|108|125|127|112|111"))

    _v4a9zyim._s7il5eud = RunService.Heartbeat:Connect(function()
        if not _vigmhnzg._ci3ro08l then return end
        if not _fawdpprj() then return end

        local shops = _foyeamoi()
        if #shops > 0 then
            _fwpee97o(shops[1])
            task.wait(_vigmhnzg._c2u7t7zw)
        end
    end)
end

local function _f76x0nx6()
    if _v4a9zyim._s7il5eud then
        _v4a9zyim._s7il5eud:Disconnect()
        _v4a9zyim._s7il5eud = nil
    end
    _ffeb10zc(_xD("120|185|237|236|231|152|203|221|228|228|152|203|204|199|200|200|189|188"))
end

local function _fa46z6ff()
    if _v4a9zyim._sql8ygxb then return end
    _ffeb10zc(_xD("95|160|212|211|206|127|180|207|198|209|192|195|196|127|178|179|160|177|179|164|163"))

    _v4a9zyim._sql8ygxb = RunService.Heartbeat:Connect(function()
        if not _vigmhnzg._czs09h1q then return end


        _fzl9jbw2(_xD("62|179|174|165|176|159|162|163"))
        _fzl9jbw2(_xD("101|199|218|222"))
        _fzl9jbw2(_xD("79|191|196|193|178|183|176|194|180"))
        _fzl9jbw2(_xD("55|174|152|169|164|171|159"))
        _fzl9jbw2(_xD("93|205|198|192|200|190|213|194"))
        _fzl9jbw2(_xD("76|174|173|175|183|188|173|175|183"))
        _fzl9jbw2(_xD("54|169|166|155|155|154"))
        _fzl9jbw2(_xD("116|216|221|219"))

        _v4a9zyim._ss72gz3c = _v4a9zyim._ss72gz3c + 1
        task.wait(1)
    end)
end

local function _faacm9is()
    if _v4a9zyim._sql8ygxb then
        _v4a9zyim._sql8ygxb:Disconnect()
        _v4a9zyim._sql8ygxb = nil
    end
    _ffeb10zc(_xD("67|132|184|183|178|99|152|179|170|181|164|167|168|99|150|151|146|147|147|136|135"))
end

local function _f6lu4s49()
    for _, highlight in ipairs(_v4a9zyim._sdeowm3i) do
        pcall(function() highlight:Destroy() end)
    end
    _v4a9zyim._sdeowm3i = {}
end

local function _fw8os0nl()
    _f6lu4s49()

    local rocks = _fkqbf2wo()
    for _, rock in ipairs(rocks) do
        if rock.Instance and rock.Instance.Parent then

            local highlight = Instance.new("Highlight")
            highlight.Name = _xD("130|199|213|210|225") .. rock.Name
            highlight.FillTransparency = 0.6
            highlight.OutlineTransparency = 0
            highlight.OutlineColor = rock.Value > 0 and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(100, 200, 255)
            highlight.FillColor = rock.Value > 0 and Color3.fromRGB(255, 200, 50) or Color3.fromRGB(80, 150, 255)
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = rock.Instance


            local billboard = Instance.new("BillboardGui")
            billboard.Name = _xD("106|175|189|186|182|203|204|207|214")
            billboard.Size = UDim2.new(0, 120, 0, 30)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = rock.Part

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 0.4
            label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            label.Text = rock.Name .. (rock.Value > 0 and (_xD("101|133|225|133|137") .. tostring(rock.Value)) or "")
            label.TextColor3 = rock.Value > 0 and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(100, 200, 255)
            label.Font = Enum.Font.GothamBold
            label.TextSize = 11
            label.Parent = billboard

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 4)
            corner.Parent = label

            table.insert(_v4a9zyim._sdeowm3i, highlight)
            table.insert(_v4a9zyim._sdeowm3i, billboard)
        end
    end


    local shops = _foyeamoi()
    for _, shop in ipairs(shops) do
        if shop.Instance and shop.Instance.Parent then
            local highlight = Instance.new("Highlight")
            highlight.Name = _xD("99|168|182|179|194|182|203|210|211|194") .. shop.Name
            highlight.FillTransparency = 0.5
            highlight.OutlineTransparency = 0
            highlight.OutlineColor = Color3.fromRGB(0, 255, 100)
            highlight.FillColor = Color3.fromRGB(50, 255, 100)
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = shop.Instance

            local billboard = Instance.new("BillboardGui")
            billboard.Name = _xD("126|195|209|206|209|230|237|238|202|223|224|227|234")
            billboard.Size = UDim2.new(0, 100, 0, 25)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = shop.Part

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 0.4
            label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            label.Text = _xD("62|145|134|141|142|120|94") .. shop.Name
            label.TextColor3 = Color3.fromRGB(0, 255, 100)
            label.Font = Enum.Font.GothamBold
            label.TextSize = 10
            label.Parent = billboard

            table.insert(_v4a9zyim._sdeowm3i, highlight)
            table.insert(_v4a9zyim._sdeowm3i, billboard)
        end
    end

    _ffeb10zc(_xD("113|182|196|193|171|145") .. #rocks .. _xD("73|105|187|184|172|180|188|117|105") .. #shops .. _xD("81|113|196|185|192|193|196"))
end

local function _f2f3b73m()
    if _vigmhnzg._cz5fhocm then
        _fw8os0nl()

        task.spawn(function()
            while _vigmhnzg._cz5fhocm do
                task.wait(5)
                if _vigmhnzg._cz5fhocm then
                    _fw8os0nl()
                end
            end
        end)
    end
end

local function _fsudja3s()
    _f6lu4s49()
end

local function _fexcruef()
    if _v4a9zyim._senuq237 then return end
    _ffeb10zc(_xD("52|117|162|168|157|84|120|149|161|149|155|153|84|121|130|117|118|128|121|120"))

    _v4a9zyim._senuq237 = RunService.Heartbeat:Connect(function()
        if not _fawdpprj() then return end


        if Humanoid and Humanoid.Health < Humanoid.MaxHealth then
            Humanoid.Health = Humanoid.MaxHealth
        end


        if _vigmhnzg._cplh5ibi then
            pcall(function()

                local _llxlcm5q = Character:FindFirstChild(_xD("128|215|225|242|237|244|232")) or Character:FindFirstChild(_xD("123|207|224|232|235|224|237|220|239|240|237|224")) or Character:FindFirstChild(_xD("98|165|209|206|198"))
                if _llxlcm5q and _llxlcm5q:IsA("ValueBase") then
                    _llxlcm5q.Value = 100
                end


                local _lphstnxw = Character:FindFirstChild(_xD("88|158|202|199|210|189|198")) or Character:FindFirstChild(_xD("114|187|229|184|228|225|236|215|224")) or Character:FindFirstChild(_xD("52|122|166|153|153|174|157|162|155"))
                if _lphstnxw and _lphstnxw:IsA("BoolValue") then
                    _lphstnxw.Value = false
                end


                _fzl9jbw2(_xD("127|246|224|241|236|243|231"))
                _fzl9jbw2(_xD("60|177|170|162|174|161|161|182|161"))
                _fzl9jbw2(_xD("117|221|218|214|233"))
            end)
        end
    end)
end

local function _fqvozuop()
    if _v4a9zyim._senuq237 then
        _v4a9zyim._senuq237:Disconnect()
        _v4a9zyim._senuq237 = nil
    end
    _ffeb10zc(_xD("69|134|179|185|174|101|137|166|178|166|172|170|101|137|142|152|134|135|145|138|137"))
end

local function _fja6ipfm()
    if not _vigmhnzg._ca54l82p then return end
    _ffeb10zc(_xD("94|159|206|206|202|215|199|204|197|126|179|204|202|199|203|199|210|195|194|126|160|191|193|201|206|191|193|201|140|140|140"))

    pcall(function()

        local _l2cuwq64 = LocalPlayer:FindFirstChild(_xD("93|159|190|192|200|205|190|192|200|160|190|205|190|192|198|209|214")) or LocalPlayer:FindFirstChild(_xD("115|192|212|235|182|212|229|229|236")) or LocalPlayer:FindFirstChild(_xD("52|119|149|166|166|173|127|123"))
        if _l2cuwq64 and _l2cuwq64:IsA("ValueBase") then
            _l2cuwq64.Value = 999999
        end


        local leaderstats = LocalPlayer:FindFirstChild(_xD("57|165|158|154|157|158|171|172|173|154|173|172"))
        if leaderstats then
            for _, stat in ipairs(leaderstats:GetChildren()) do
                local nameLower = string.lower(stat.Name)
                if string.find(nameLower, _xD("46|144|143|145|153|158|143|145|153")) or string.find(nameLower, _xD("61|160|158|175|175|182")) or string.find(nameLower, _xD("86|185|183|198|183|185|191|202|207")) or string.find(nameLower, _xD("88|207|189|193|191|192|204")) or string.find(nameLower, _xD("82|189|185")) then
                    if stat:IsA("ValueBase") then
                        stat.Value = 999999
                    end
                end
            end
        end


        _fzl9jbw2(_xD("76|174|173|175|183|188|173|175|183"))
        _fzl9jbw2(_xD("67|166|164|179|164|166|172|183|188"))
        _fzl9jbw2(_xD("51|150|148|165|165|172"))
        _fzl9jbw2(_xD("126|243|238|229|240|223|226|227|221|224|223|225|233|238|223|225|233"))
    end)


    task.spawn(function()
        while _vigmhnzg._ca54l82p do
            task.wait(2)
            pcall(function()
                local leaderstats = LocalPlayer:FindFirstChild(_xD("101|209|202|198|201|202|215|216|217|198|217|216"))
                if leaderstats then
                    for _, stat in ipairs(leaderstats:GetChildren()) do
                        local nameLower = string.lower(stat.Name)
                        if string.find(nameLower, _xD("43|141|140|142|150|155|140|142|150")) or string.find(nameLower, _xD("127|226|224|241|241|248")) or string.find(nameLower, _xD("114|213|211|226|211|213|219|230|235")) or string.find(nameLower, _xD("78|197|179|183|181|182|194")) or string.find(nameLower, _xD("69|176|172")) then
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

local function _fvec0i16()
    if not _vigmhnzg._ce4vi9nh then return end
    _ffeb10zc(_xD("49|114|161|161|157|170|154|159|152|81|134|159|157|154|158|154|165|150|149|81|125|166|148|156|95|95|95"))

    pcall(function()

        local _lu0ddx5d = LocalPlayer:FindFirstChild(_xD("71|147|188|170|178")) or LocalPlayer:FindFirstChild(_xD("97|165|202|200|173|214|196|204")) or LocalPlayer:FindFirstChild(_xD("46|123|151|156|151|156|149|122|163|145|153"))
        if _lu0ddx5d and _lu0ddx5d:IsA("ValueBase") then
            _lu0ddx5d.Value = 999999
        end


        local leaderstats = LocalPlayer:FindFirstChild(_xD("111|219|212|208|211|212|225|226|227|208|227|226"))
        if leaderstats then
            for _, stat in ipairs(leaderstats:GetChildren()) do
                local nameLower = string.lower(stat.Name)
                if string.find(nameLower, _xD("98|206|215|197|205")) then
                    if stat:IsA("ValueBase") then
                        stat.Value = 999999
                    end
                end
            end
        end


        _fzl9jbw2(_xD("92|200|209|191|199"))
        _fzl9jbw2(_xD("44|152|161|143|151|165"))
        _fzl9jbw2(_xD("77|177|182|180|172|185|194|176|184"))
    end)


    task.spawn(function()
        while _vigmhnzg._ce4vi9nh do
            task.wait(2)
            pcall(function()
                local leaderstats = LocalPlayer:FindFirstChild(_xD("99|207|200|196|199|200|213|214|215|196|215|214"))
                if leaderstats then
                    for _, stat in ipairs(leaderstats:GetChildren()) do
                        if string.find(string.lower(stat.Name), _xD("51|159|168|150|158")) and stat:IsA("ValueBase") then
                            stat.Value = 999999
                        end
                    end
                end
            end)
        end
    end)
end

local function _ffq5hqow(amount)
    _ffeb10zc(_xD("129|194|245|245|230|238|241|245|234|239|232|161|245|240|161|229|246|241|230|161") .. amount .. _xD("80|112|185|196|181|189|195|126|126|126"))

    pcall(function()

        for i = 1, amount do
            _fzl9jbw2(_xD("70|169|181|178|178|171|169|186"))
            _fzl9jbw2(_xD("64|173|169|174|165"))
            _fzl9jbw2(_xD("104|208|201|218|222|205|219|220"))
            _fzl9jbw2(_xD("63|175|168|162|170|180|175"))
            _fzl9jbw2(_xD("118|221|215|234|222|219|232"))
            _fzl9jbw2(_xD("49|157|160|160|165"))
            _fzl9jbw2(_xD("49|160|147|165|146|154|159"))
            _fzl9jbw2(_xD("119|222|233|216|229|235"))
            _fzl9jbw2(_xD("114|228|215|233|211|228|214"))
            task.wait(0.05)
        end


        local leaderstats = LocalPlayer:FindFirstChild(_xD("99|207|200|196|199|200|213|214|215|196|215|214"))
        if leaderstats then
            for _, stat in ipairs(leaderstats:GetChildren()) do
                local nameLower = string.lower(stat.Name)
                if string.find(nameLower, _xD("45|144|159|166|160|161|142|153")) or string.find(nameLower, _xD("123|234|237|224")) or string.find(nameLower, _xD("75|178|176|184")) or string.find(nameLower, _xD("60|165|176|161|169")) then
                    if stat:IsA("NumberValue") or stat:IsA("IntValue") then
                        stat.Value = stat.Value * amount
                    end
                end
            end
        end


        for i = 1, amount do
            _fzl9jbw2(_xD("96|211|197|204|204"))
            task.wait(0.02)
            _fzl9jbw2(_xD("75|173|192|196"))
            task.wait(0.02)
        end


        local rocks = _fkqbf2wo()
        if #rocks > 0 then
            local _lijw2jkb = rocks[1]
            for i = 1, amount do
                for _, remote in ipairs(_v4a9zyim._svnug2j5) do
                    local rName = string.lower(remote.Name)
                    if string.find(rName, _xD("64|163|175|172|172|165|163|180")) or string.find(rName, _xD("129|241|234|228|236|246|241")) or string.find(rName, _xD("40|148|151|151|156")) then
                        pcall(function()
                            if remote.Type == "RemoteEvent" then
                                remote.Instance:FireServer(_lijw2jkb.Instance, _lijw2jkb.Part)
                            end
                        end)
                    end
                end
                task.wait(0.05)
            end
        end
    end)

    _v4a9zyim._s181j31y = _v4a9zyim._s181j31y + amount
    _ffeb10zc(_xD("127|195|244|239|228|159|224|243|243|228|236|239|243|159|226|238|236|239|235|228|243|228|185|159") .. amount .. _xD("81|201"))
end

local function _f0jy4yoy()
    if _v4a9zyim._st16jmwo then return end
    _ffeb10zc(_xD("95|173|206|194|203|200|207|127|164|173|160|161|171|164|163"))

    _v4a9zyim._st16jmwo = RunService.Stepped:Connect(function()
        if not _vigmhnzg._cqgz5lhy then return end
        if not _fawdpprj() then return end
        for _, part in ipairs(Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end)
end

local function _fnquejjf()
    if _v4a9zyim._st16jmwo then
        _v4a9zyim._st16jmwo:Disconnect()
        _v4a9zyim._st16jmwo = nil
    end
    _ffeb10zc(_xD("51|129|162|150|159|156|163|83|119|124|134|116|117|127|120|119"))
end

local _v29angbm = nil
local _vz6glwz2 = nil

local function _fcx11s36()
    if _v4a9zyim._s1lsi2mp then return end
    if not _fawdpprj() then return end
    _ffeb10zc(_xD("48|118|156|169|80|117|126|113|114|124|117|116"))


    _v29angbm = Instance.new("BodyVelocity")
    _v29angbm.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    _v29angbm.Velocity = Vector3.new(0, 0, 0)
    _v29angbm.Parent = HumanoidRootPart

    _vz6glwz2 = Instance.new("BodyGyro")
    _vz6glwz2.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    _vz6glwz2.P = 9e4
    _vz6glwz2.Parent = HumanoidRootPart

    _v4a9zyim._s1lsi2mp = RunService.RenderStepped:Connect(function()
        if not _vigmhnzg._cd4afzmc then return end
        if not _fawdpprj() then return end

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
            moveDir = moveDir.Unit * _vigmhnzg._clebcwww
        end

        _v29angbm.Velocity = moveDir
        _vz6glwz2.CFrame = cam.CFrame
    end)
end

local function _fwzi0fa8()
    if _v4a9zyim._s1lsi2mp then
        _v4a9zyim._s1lsi2mp:Disconnect()
        _v4a9zyim._s1lsi2mp = nil
    end
    if _v29angbm then _v29angbm:Destroy() _v29angbm = nil end
    if _vz6glwz2 then _vz6glwz2:Destroy() _vz6glwz2 = nil end
    _ffeb10zc(_xD("95|165|203|216|127|163|168|178|160|161|171|164|163"))
end

local function _ftq12yf5()
    if not _fawdpprj() then return end
    if _vigmhnzg._cr4fnm79 then
        Humanoid._csiv0fed = _vigmhnzg._csiv0fed
    else
        Humanoid._csiv0fed = 16
    end
end

local _vqjog8pv = {}
local _vb5gw2a3 = false

local function _f5maw08x(data)
    if not _vigmhnzg._cr3pam97 or _vigmhnzg._cy11p9hq == "" then return end
    pcall(function()
        HttpService:PostAsync(_vigmhnzg._cy11p9hq, HttpService:JSONEncode(data))
    end)
end

local function _fpsdruks(itemName)
    if not _vigmhnzg._cj0i834c then return end
    _f5maw08x({
        content = _xD("117|159|159|208|194|222|227|218|214|149|194|228|234|227|233|214|222|227|210|159|159|149|194|222|227|218|217|175|149") .. itemName .. _xD("80|112|204|112|164|191|196|177|188|138|112") .. _v4a9zyim._s0886rnb,
    })
end

local function _fmdgtwby()
    if not _vigmhnzg._c5g5l6rn then return end
    _f5maw08x({
        content = _xD("76|118|118|167|153|181|186|177|173|108|153|187|193|186|192|173|181|186|169|118|118|108|159|187|184|176|108|181|192|177|185|191|108|200|108|160|187|192|173|184|108|191|177|184|184|191|134|108") .. _v4a9zyim._sxz16dwg,
    })
end

local function _fy4xfdo6()
    if not _vigmhnzg._cqprlben then return end
    _f5maw08x({
        content = _xD("58|100|100|149|135|163|168|159|155|90|135|169|175|168|174|155|163|168|90|141|174|155|174|173|151|100|100|90|135|163|168|159|158|116|90") .. _v4a9zyim._s0886rnb .. _xD("106|138|230|138|189|207|214|214|221|164|138") .. _v4a9zyim._sxz16dwg .. _xD("76|108|200|108|144|193|188|177|191|134|108") .. _v4a9zyim._s181j31y .. _xD("110|142|234|142|194|207|224|213|211|226|168|142") .. _v4a9zyim._s71sqkis,
    })
end

local _v5lehbk8 = Instance.new("ScreenGui")
_v5lehbk8.Name = _xD("118|195|223|228|219|215|195|229|235|228|234|215|223|228|204|172")
_v5lehbk8.ResetOnSpawn = false
_v5lehbk8.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_v5lehbk8.IgnoreGuiInset = true

if _v37nqx6e then
    pcall(function() syn.protect_gui(_v5lehbk8) end)
end


local guiParented = false

pcall(function()
    if gethui then
        _v5lehbk8.Parent = gethui()
        guiParented = true
    end
end)

if not guiParented then
    pcall(function()
        _v5lehbk8.Parent = game:GetService(_xD("91|158|202|205|192|162|208|196"))
        guiParented = true
    end)
end

if not guiParented then
    pcall(function()
        _v5lehbk8.Parent = LocalPlayer:WaitForChild(_xD("107|187|215|204|228|208|221|178|224|212"))
        guiParented = true
    end)
end


local _v12y8xbo = Workspace.CurrentCamera.ViewportSize
local _vxm3xd37 = _v12y8xbo.X < 800
local _vs51ifck = _vxm3xd37 and UDim2.new(0, 300, 0, 360) or UDim2.new(0, 340, 0, 440)
local _vhhk7oaq = UDim2.new(0, 140, 0, 38)
local _vxx1vuca = UDim2.new(0, 12, 0, 60)
local _v5hcksqs = UDim2.new(0, 12, 0, 60)

local _v1931zu6 = Instance.new("Frame")
_v1931zu6.Name = _xD("79|156|176|184|189|149|193|176|188|180")
_v1931zu6.Size = _vs51ifck
_v1931zu6.Position = _vxx1vuca
_v1931zu6.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
_v1931zu6.BackgroundTransparency = 0.15
_v1931zu6.BorderSizePixel = 0
_v1931zu6.ClipsDescendants = true
_v1931zu6.Parent = _v5lehbk8

local _v6ringne = Instance.new("UICorner")
_v6ringne.CornerRadius = UDim.new(0, 14)
_v6ringne.Parent = _v1931zu6


local _vng5zm79 = Instance.new("UIStroke")
_vng5zm79.Color = Color3.fromRGB(90, 130, 255)
_vng5zm79.Thickness = 1.5
_vng5zm79.Transparency = 0.2
_vng5zm79.Parent = _v1931zu6


local _v06v4b97 = Instance.new("ImageLabel")
_v06v4b97.Name = _xD("55|126|163|152|170|170|121|163|172|169")
_v06v4b97.Size = UDim2.new(1, 40, 1, 40)
_v06v4b97.Position = UDim2.new(0, -20, 0, -20)
_v06v4b97.BackgroundTransparency = 1
_v06v4b97.Image = "rbxassetid://7669168585"
_v06v4b97.ImageColor3 = Color3.fromRGB(50, 80, 200)
_v06v4b97.ImageTransparency = 0.75
_v06v4b97.ScaleType = Enum.ScaleType.Slice
_v06v4b97.SliceCenter = Rect.new(45, 45, 45, 45)
_v06v4b97.Parent = _v1931zu6

local _vci80ezr = Instance.new("Frame")
_vci80ezr.Name = _xD("94|166|195|191|194|195|208")
_vci80ezr.Size = UDim2.new(1, 0, 0, 48)
_vci80ezr.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
_vci80ezr.BackgroundTransparency = 0.1
_vci80ezr.BorderSizePixel = 0
_vci80ezr.Parent = _v1931zu6

local _vpmbkr99 = Instance.new("UICorner")
_vpmbkr99.CornerRadius = UDim.new(0, 14)
_vpmbkr99.Parent = _vci80ezr

local _v5swsg56 = Instance.new("UIGradient")
_v5swsg56.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 35, 65)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(25, 25, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 65)),
})
_v5swsg56.Rotation = 90
_v5swsg56.Parent = _vci80ezr

local _v0carbvl = Instance.new("TextLabel")
_v0carbvl.Size = UDim2.new(0.65, 0, 1, 0)
_v0carbvl.Position = UDim2.new(0.04, 0, 0, 0)
_v0carbvl.BackgroundTransparency = 1
_v0carbvl.Text = _xD("69|295|224|212|101|146|174|179|170|166|101|146|180|186|179|185|166|174|179|101|187|123")
_v0carbvl.TextColor3 = Color3.fromRGB(130, 170, 255)
_v0carbvl.Font = Enum.Font.GothamBold
_v0carbvl.TextSize = _vxm3xd37 and 13 or 15
_v0carbvl.TextXAlignment = Enum.TextXAlignment.Left
_v0carbvl.Parent = _vci80ezr


local _vknwc79t = Instance.new("TextLabel")
_vknwc79t.Size = UDim2.new(0, 28, 0, 18)
_vknwc79t.Position = UDim2.new(0.65, 0, 0.5, -9)
_vknwc79t.BackgroundColor3 = Color3.fromRGB(60, 100, 255)
_vknwc79t.BorderSizePixel = 0
_vknwc79t.Text = _xD("91|209|145")
_vknwc79t.TextColor3 = Color3.fromRGB(255, 255, 255)
_vknwc79t.Font = Enum.Font.GothamBold
_vknwc79t.TextSize = 10
_vknwc79t.Parent = _vci80ezr

local vCorner = Instance.new("UICorner")
vCorner.CornerRadius = UDim.new(0, 9)
vCorner.Parent = _vknwc79t


local _vi0ocmdb = Instance.new("TextButton")
_vi0ocmdb.Size = UDim2.new(0, 40, 0, 28)
_vi0ocmdb.Position = UDim2.new(1, -48, 0, 10)
_vi0ocmdb.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
_vi0ocmdb.BorderSizePixel = 0
_vi0ocmdb.Text = "—"
_vi0ocmdb.TextColor3 = Color3.fromRGB(255, 255, 255)
_vi0ocmdb.Font = Enum.Font.GothamBold
_vi0ocmdb.TextSize = 14
_vi0ocmdb.Parent = _vci80ezr

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(0, 8)
minCorner.Parent = _vi0ocmdb

local _vnsgnr9u = Instance.new("Frame")
_vnsgnr9u.Size = _vhhk7oaq
_vnsgnr9u.Position = _v5hcksqs
_vnsgnr9u.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
_vnsgnr9u.BackgroundTransparency = 0.15
_vnsgnr9u.BorderSizePixel = 0
_vnsgnr9u.Visible = false
_vnsgnr9u.Parent = _v5lehbk8

local miniCorner = Instance.new("UICorner")
miniCorner.CornerRadius = UDim.new(0, 12)
miniCorner.Parent = _vnsgnr9u

local miniStroke = Instance.new("UIStroke")
miniStroke.Color = Color3.fromRGB(90, 130, 255)
miniStroke.Thickness = 1.5
miniStroke.Transparency = 0.2
miniStroke.Parent = _vnsgnr9u

local _v57v46rq = Instance.new("TextLabel")
_v57v46rq.Size = UDim2.new(0.6, 0, 1, 0)
_v57v46rq.Position = UDim2.new(0.06, 0, 0, 0)
_v57v46rq.BackgroundTransparency = 1
_v57v46rq.Text = _xD("52|278|207|195|84|129|157|162|153|149")
_v57v46rq.TextColor3 = Color3.fromRGB(130, 170, 255)
_v57v46rq.Font = Enum.Font.GothamBold
_v57v46rq.TextSize = 13
_v57v46rq.TextXAlignment = Enum.TextXAlignment.Left
_v57v46rq.Parent = _vnsgnr9u

local _vjwx2uxs = Instance.new("TextButton")
_vjwx2uxs.Size = UDim2.new(0, 40, 0, 28)
_vjwx2uxs.Position = UDim2.new(1, -48, 0, 7)
_vjwx2uxs.BackgroundColor3 = Color3.fromRGB(60, 200, 100)
_vjwx2uxs.BorderSizePixel = 0
_vjwx2uxs.Text = "□"
_vjwx2uxs.TextColor3 = Color3.fromRGB(255, 255, 255)
_vjwx2uxs.Font = Enum.Font.GothamBold
_vjwx2uxs.TextSize = 14
_vjwx2uxs.Parent = _vnsgnr9u

local expCorner = Instance.new("UICorner")
expCorner.CornerRadius = UDim.new(0, 8)
expCorner.Parent = _vjwx2uxs

local _v8wj7q5h = Instance.new("Frame")
_v8wj7q5h.Name = _xD("59|143|156|157|125|156|173")
_v8wj7q5h.Size = UDim2.new(1, -12, 0, 32)
_v8wj7q5h.Position = UDim2.new(0, 6, 0, 52)
_v8wj7q5h.BackgroundTransparency = 1
_v8wj7q5h.Parent = _v1931zu6

local TabLayout = Instance.new("UIListLayout")
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.Padding = UDim.new(0, 3)
TabLayout.Parent = _v8wj7q5h

local _l8yp6dwt = {_xD("122|192|219|236|231"), _xD("101|184|202|209|209"), _xD("105|174|188|185"), _xD("100|169|220|212|208|211|205|216"), _xD("73|150|178|188|172")}
local _v0b4dvca = {}
local _v9ijv2j3 = {}

for i, tabName in ipairs(_l8yp6dwt) do
    local tabBtn = Instance.new("TextButton")
    tabBtn.Name = tabName .. _xD("108|192|205|206")
    tabBtn.Size = UDim2.new(0.2, 0, 1, 0)
    tabBtn.BackgroundColor3 = (tabName == _xD("65|135|162|179|174")) and Color3.fromRGB(50, 90, 200) or Color3.fromRGB(30, 30, 50)
    tabBtn.BorderSizePixel = 0
    tabBtn.Text = tabName
    tabBtn.TextColor3 = Color3.fromRGB(220, 230, 255)
    tabBtn.Font = Enum.Font.GothamBold
    tabBtn.TextSize = _vxm3xd37 and 10 or 11
    tabBtn.LayoutOrder = i
    tabBtn.Parent = _v8wj7q5h

    local tCorner = Instance.new("UICorner")
    tCorner.CornerRadius = UDim.new(0, 8)
    tCorner.Parent = tabBtn

    _v0b4dvca[tabName] = tabBtn
end

local _vq8vv3vr = Instance.new("Frame")
_vq8vv3vr.Name = _xD("77|144|188|187|193|178|187|193|142|191|178|174")
_vq8vv3vr.Size = UDim2.new(1, -12, 1, -90)
_vq8vv3vr.Position = UDim2.new(0, 6, 0, 88)
_vq8vv3vr.BackgroundTransparency = 1
_vq8vv3vr.ClipsDescendants = true
_vq8vv3vr.Parent = _v1931zu6


for _, tabName in ipairs(_l8yp6dwt) do
    local tabFrame = Instance.new("ScrollingFrame")
    tabFrame.Name = tabName .. _xD("53|120|164|163|169|154|163|169")
    tabFrame.Size = UDim2.new(1, 0, 1, 0)
    tabFrame.BackgroundTransparency = 1
    tabFrame.BorderSizePixel = 0
    tabFrame.ScrollBarThickness = 3
    tabFrame.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
    tabFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    tabFrame.Visible = (tabName == _xD("56|126|153|170|165"))
    tabFrame.Parent = _vq8vv3vr

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

    _v9ijv2j3[tabName] = tabFrame
end

local function _f1l20xm8(tabName)
    _v4a9zyim._stz0g3yi = tabName
    for name, frame in pairs(_v9ijv2j3) do
        frame.Visible = (name == tabName)
    end
    for name, btn in pairs(_v0b4dvca) do
        btn.BackgroundColor3 = (name == tabName) and Color3.fromRGB(50, 90, 200) or Color3.fromRGB(30, 30, 50)
    end
end

for tabName, btn in pairs(_v0b4dvca) do
    btn.MouseButton1Click:Connect(function()
        _f1l20xm8(tabName)
    end)
end

local _vtzyepru = 0

local function _fm1kc2sz(parent, title)
    _vtzyepru = _vtzyepru + 1
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 26)
    label.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    label.BorderSizePixel = 0
    label.Text = "  " .. title
    label.TextColor3 = Color3.fromRGB(100, 150, 255)
    label.Font = Enum.Font.GothamBold
    label.TextSize = _vxm3xd37 and 10 or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.LayoutOrder = _vtzyepru
    label.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = label
    return label
end

local function _fp1qs1bk(parent, name, default, callback)
    _vtzyepru = _vtzyepru + 1
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 38)
    frame.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
    frame.BorderSizePixel = 0
    frame.LayoutOrder = _vtzyepru
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
    label.TextSize = _vxm3xd37 and 11 or 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 52, 0, 24)
    toggleBtn.Position = UDim2.new(1, -60, 0.5, -12)
    toggleBtn.BackgroundColor3 = default and Color3.fromRGB(50, 180, 90) or Color3.fromRGB(50, 50, 70)
    toggleBtn.BorderSizePixel = 0
    toggleBtn.Text = default and _xD("117|196|195") or _xD("121|200|191|191")
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
        toggleBtn.Text = toggled and _xD("106|185|184") or _xD("111|190|181|181")
        callback(toggled)
    end)

    return frame, toggleBtn
end

local function _f24dad9i(parent, name, color, callback)
    _vtzyepru = _vtzyepru + 1
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 34)
    btn.BackgroundColor3 = color
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = _vxm3xd37 and 11 or 12
    btn.LayoutOrder = _vtzyepru
    btn.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    btn.MouseButton1Click:Connect(callback)
    return btn
end

local function _fy43dfhc(parent, name, minVal, maxVal, defaultVal, callback)
    _vtzyepru = _vtzyepru + 1
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 50)
    frame.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
    frame.BorderSizePixel = 0
    frame.LayoutOrder = _vtzyepru
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
    label.TextSize = _vxm3xd37 and 10 or 11
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

local function _f3vsghk5(parent, name, defaultText, callback)
    _vtzyepru = _vtzyepru + 1
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 42)
    frame.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
    frame.BorderSizePixel = 0
    frame.LayoutOrder = _vtzyepru
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
    label.TextSize = _vxm3xd37 and 10 or 11
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
    input.PlaceholderColor3 = Color3.fromRGB(100, 100, 120)
    input.Font = Enum.Font.Gotham
    input.TextSize = _vxm3xd37 and 10 or 11
    input.ClearTextOnFocus = false
    input.Parent = frame

    local iCorner = Instance.new("UICorner")
    iCorner.CornerRadius = UDim.new(0, 6)
    iCorner.Parent = input

    input.FocusLost:Connect(function()
        callback(input.Text)
    end)

    return frame, input
end

local _lrfe53he = _v9ijv2j3[_xD("118|188|215|232|227")]

_fm1kc2sz(_lrfe53he, _xD("110|350|269|257|248|142|193|194|175|194|193"))
_vtzyepru = _vtzyepru + 1
local _vp1856oc = Instance.new("Frame")
_vp1856oc.Size = UDim2.new(1, 0, 0, 40)
_vp1856oc.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
_vp1856oc.BorderSizePixel = 0
_vp1856oc.LayoutOrder = _vtzyepru
_vp1856oc.Parent = _lrfe53he

local statsCorner = Instance.new("UICorner")
statsCorner.CornerRadius = UDim.new(0, 8)
statsCorner.Parent = _vp1856oc

local _v9u94k29 = Instance.new("TextLabel")
_v9u94k29.Name = _xD("56|139|172|153|172|171|140|157|176|172")
_v9u94k29.Size = UDim2.new(1, -12, 1, 0)
_v9u94k29.Position = UDim2.new(0, 6, 0, 0)
_v9u94k29.BackgroundTransparency = 1
_v9u94k29.Text = _xD("41|118|146|151|142|141|99|73|89|73|165|73|124|142|149|149|156|99|73|89|73|165|73|125|138|155|144|142|157|99|73|119|152|151|142")
_v9u94k29.TextColor3 = Color3.fromRGB(180, 200, 230)
_v9u94k29.Font = Enum.Font.Gotham
_v9u94k29.TextSize = _vxm3xd37 and 9 or 10
_v9u94k29.TextXAlignment = Enum.TextXAlignment.Left
_v9u94k29.TextWrapped = true
_v9u94k29.Parent = _vp1856oc

local function _fr7sy4yx()
    _v9u94k29.Text = _xD("109|186|214|219|210|209|167|141") .. _v4a9zyim._s0886rnb .. _xD("69|101|193|101|152|170|177|177|184|127|101") .. _v4a9zyim._sxz16dwg .. _xD("124|156|248|156|192|241|236|225|182|156") .. _v4a9zyim._s181j31y .. _xD("124|156|248|156|208|221|238|227|225|240|182|156") .. (_v4a9zyim._s71sqkis or _xD("63|141|174|173|164"))
end

_fm1kc2sz(_lrfe53he, _xD("77|303|232|220|109|142|162|161|156|109|147|142|159|154"))

_fp1qs1bk(_lrfe53he, _xD("103|168|220|219|214|135|173|200|217|212|135|185|214|202|210|218|150|170|217|224|218|219|200|211|218"), false, function(val)
    _vigmhnzg._cq0k5ozj = val
    if val then _f9r07484() else _fx3861n5() end
end)

_fp1qs1bk(_lrfe53he, _xD("94|174|208|199|205|208|199|210|215|126|166|199|197|198|195|209|210|126|180|191|202|211|195"), false, function(val)
    _vigmhnzg._c43hvqpz = val
    if val then _vigmhnzg._chhggl0w = false end
end)

_fp1qs1bk(_lrfe53he, _xD("61|141|175|166|172|175|166|177|182|93|128|169|172|176|162|176|177"), true, function(val)
    _vigmhnzg._chhggl0w = val
    if val then _vigmhnzg._c43hvqpz = false end
end)

_fy43dfhc(_lrfe53he, _xD("102|172|199|216|211|134|184|199|202|207|219|217"), 50, 2000, 500, function(val)
    _vigmhnzg._c2iqjsp8 = val
end)

_fy43dfhc(_lrfe53he, _xD("44|114|141|158|153|76|112|145|152|141|165"), 1, 100, 5, function(val)
    _vigmhnzg._chhnsimz = val / 100
end)

_f24dad9i(_lrfe53he, _xD("55|295|214|203|196|87|138|154|152|165|87|137|166|154|162|170|87|133|166|174"), Color3.fromRGB(40, 80, 160), function()
    local rocks = _fkqbf2wo()
    _ffeb10zc(_xD("82|152|193|199|192|182|114") .. #rocks .. _xD("120|152|234|231|219|227|235|167|219|234|241|235|236|217|228|235"))
end)

_f24dad9i(_lrfe53he, _xD("52|278|207|195|84|129|157|162|153|84|130|153|149|166|153|167|168|84|134|163|151|159"), Color3.fromRGB(40, 120, 60), function()
    local rocks = _fkqbf2wo()
    if #rocks > 0 then
        _fmvl0v3o(rocks[1])
    else
        _ffeb10zc(_xD("80|158|191|112|194|191|179|187|195|112|182|191|197|190|180|113"))
    end
end)

_f24dad9i(_lrfe53he, _xD("106|332|260|267|138|173|203|205|210|207|138|188|207|215|217|222|207|221"), Color3.fromRGB(100, 50, 150), function()
    _fxwruyyt()
end)

local _l2pno6ae = _v9ijv2j3[_xD("124|207|225|232|232")]

_fm1kc2sz(_l2pno6ae, _xD("65|305|224|211|241|97|130|150|149|144|97|148|134|141|141"))

_fp1qs1bk(_l2pno6ae, _xD("123|188|240|239|234|155|206|224|231|231"), false, function(val)
    _vigmhnzg._ci3ro08l = val
    if val then _f4c6rv42() else _f76x0nx6() end
end)

_fy43dfhc(_l2pno6ae, _xD("126|209|227|234|234|158|208|223|226|231|243|241"), 50, 1000, 300, function(val)
    _vigmhnzg._chckexjd = val
end)

_fy43dfhc(_l2pno6ae, _xD("86|169|187|194|194|118|154|187|194|183|207"), 1, 50, 3, function(val)
    _vigmhnzg._c2u7t7zw = val / 10
end)

_f24dad9i(_l2pno6ae, _xD("59|299|218|205|235|91|142|160|167|167|91|156|175|91|137|160|156|173|160|174|175|91|142|163|170|171"), Color3.fromRGB(140, 100, 30), function()
    local shops = _foyeamoi()
    if #shops > 0 then
        _fwpee97o(shops[1])
    else
        _ffeb10zc(_xD("40|118|151|72|155|144|151|152|155|72|142|151|157|150|140|73"))
    end
end)

_f24dad9i(_l2pno6ae, _xD("67|307|226|210|227|99|138|178|99|139|178|176|168|99|114|99|151|168|175|168|179|178|181|183|99|183|178|99|150|171|178|179"), Color3.fromRGB(80, 50, 150), function()
    local shops = _foyeamoi()
    if #shops > 0 then
        _f6gxrnr7(shops[1].Part.Position)
        _ffeb10zc(_xD("112|196|213|220|213|224|223|226|228|213|212|144|228|223|170|144") .. shops[1].Name)
    end
end)

_fm1kc2sz(_l2pno6ae, _xD("43|283|202|191|175|75|108|128|127|122|75|128|123|114|125|108|111|112"))

_fp1qs1bk(_l2pno6ae, _xD("120|185|237|236|231|152|205|232|223|234|217|220|221"), false, function(val)
    _vigmhnzg._czs09h1q = val
    if val then _fa46z6ff() else _faacm9is() end
end)

_f24dad9i(_l2pno6ae, _xD("101|327|273|235|133|186|213|204|215|198|201|202|133|166|209|209"), Color3.fromRGB(50, 130, 180), function()
    _fzl9jbw2(_xD("92|209|204|195|206|189|192|193"))
    _fzl9jbw2(_xD("40|138|157|161"))
    _fzl9jbw2(_xD("56|168|173|170|155|160|153|171|157"))
    _fzl9jbw2(_xD("41|160|138|155|150|157|145"))
    _fzl9jbw2(_xD("84|196|189|183|191|181|204|185"))
    _fzl9jbw2(_xD("113|211|210|212|220|225|210|212|220"))
    _fzl9jbw2(_xD("70|185|182|171|171|170"))
    _ffeb10zc(_xD("79|149|184|193|180|179|111|196|191|182|193|176|179|180|111|193|180|188|190|195|180|194"))
end)

_fm1kc2sz(_l2pno6ae, _xD("106|346|265|249|276|138|174|175|190|175|173|190|175|174|138|189|178|185|186|189"))

_v1n2acbz = Instance.new("ScrollingFrame")
_v1n2acbz.Name = _xD("90|173|194|201|202|166|195|205|206")
_v1n2acbz.Size = UDim2.new(1, 0, 0, 90)
_v1n2acbz.BackgroundColor3 = Color3.fromRGB(18, 18, 30)
_v1n2acbz.BorderSizePixel = 0
_v1n2acbz.ScrollBarThickness = 2
_v1n2acbz.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
_v1n2acbz.CanvasSize = UDim2.new(0, 0, 0, 0)
_v1n2acbz.AutomaticCanvasSize = Enum.AutomaticSize.Y
_vtzyepru = _vtzyepru + 1
_v1n2acbz.LayoutOrder = _vtzyepru
_v1n2acbz.Parent = _l2pno6ae

local shopLCorner = Instance.new("UICorner")
shopLCorner.CornerRadius = UDim.new(0, 6)
shopLCorner.Parent = _v1n2acbz

local shopLLayout = Instance.new("UIListLayout")
shopLLayout.SortOrder = Enum.SortOrder.LayoutOrder
shopLLayout.Padding = UDim.new(0, 2)
shopLLayout.Parent = _v1n2acbz

local shopLPad = Instance.new("UIPadding")
shopLPad.PaddingTop = UDim.new(0, 2)
shopLPad.PaddingBottom = UDim.new(0, 2)
shopLPad.PaddingLeft = UDim.new(0, 2)
shopLPad.PaddingRight = UDim.new(0, 2)
shopLPad.Parent = _v1n2acbz

local _lo1mr2i1 = _v9ijv2j3[_xD("82|151|165|162")]

_fm1kc2sz(_lo1mr2i1, _xD("55|295|214|200|184|87|124|138|135|87|102|87|141|128|138|140|120|131|138"))

_fp1qs1bk(_lo1mr2i1, _xD("122|189|236|243|237|238|219|230|154|169|154|204|233|221|229|154|191|205|202"), false, function(val)
    _vigmhnzg._cz5fhocm = val
    if val then _f2f3b73m() else _fsudja3s() end
end)

_f24dad9i(_lo1mr2i1, _xD("115|355|274|263|247|147|197|216|217|229|216|230|219|147|184|198|195"), Color3.fromRGB(50, 90, 160), function()
    if _vigmhnzg._cz5fhocm then
        _fw8os0nl()
    else
        _ffeb10zc(_xD("101|170|211|198|199|209|202|133|170|184|181|133|203|206|215|216|217|134"))
    end
end)

_f24dad9i(_lo1mr2i1, _xD("66|292|223|206|98|133|174|167|163|180|98|135|149|146"), Color3.fromRGB(150, 50, 50), function()
    _fsudja3s()
end)

_fm1kc2sz(_lo1mr2i1, _xD("123|363|282|293|291|155|191|192|207|192|190|207|192|191|155|205|202|190|198|206"))

_vpd1qod9 = Instance.new("ScrollingFrame")
_vpd1qod9.Name = _xD("68|150|179|167|175|144|173|183|184")
_vpd1qod9.Size = UDim2.new(1, 0, 0, 120)
_vpd1qod9.BackgroundColor3 = Color3.fromRGB(18, 18, 30)
_vpd1qod9.BorderSizePixel = 0
_vpd1qod9.ScrollBarThickness = 2
_vpd1qod9.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
_vpd1qod9.CanvasSize = UDim2.new(0, 0, 0, 0)
_vpd1qod9.AutomaticCanvasSize = Enum.AutomaticSize.Y
_vtzyepru = _vtzyepru + 1
_vpd1qod9.LayoutOrder = _vtzyepru
_vpd1qod9.Parent = _lo1mr2i1

local rLCorner = Instance.new("UICorner")
rLCorner.CornerRadius = UDim.new(0, 6)
rLCorner.Parent = _vpd1qod9

local rLLayout = Instance.new("UIListLayout")
rLLayout.SortOrder = Enum.SortOrder.LayoutOrder
rLLayout.Padding = UDim.new(0, 2)
rLLayout.Parent = _vpd1qod9

local rLPad = Instance.new("UIPadding")
rLPad.PaddingTop = UDim.new(0, 2)
rLPad.PaddingBottom = UDim.new(0, 2)
rLPad.PaddingLeft = UDim.new(0, 2)
rLPad.PaddingRight = UDim.new(0, 2)
rLPad.Parent = _vpd1qod9

local _l1g1xp3f = _v9ijv2j3[_xD("102|171|222|214|210|213|207|218")]

_fm1kc2sz(_l1g1xp3f, _xD("43|283|202|185|189|75|112|131|123|119|122|116|127|126"))

_fp1qs1bk(_l1g1xp3f, _xD("120|205|230|228|225|229|225|236|221|220|152|186|217|219|227|232|217|219|227"), false, function(val)
    _vigmhnzg._ca54l82p = val
    if val then _fja6ipfm() end
end)

_fp1qs1bk(_l1g1xp3f, _xD("89|174|199|197|194|198|194|205|190|189|121|165|206|188|196"), false, function(val)
    _vigmhnzg._ce4vi9nh = val
    if val then _fvec0i16() end
end)

_fp1qs1bk(_l1g1xp3f, _xD("53|118|163|169|158|85|121|150|162|150|156|154"), false, function(val)
    _vigmhnzg._coe01omh = val
    if val then _fexcruef() else _fqvozuop() end
end)

_fp1qs1bk(_l1g1xp3f, _xD("63|128|173|179|168|95|133|177|164|164|185|164|95|103|150|160|177|172|179|167|104"), false, function(val)
    _vigmhnzg._cplh5ibi = val
    if val and not _vigmhnzg._coe01omh then
        _vigmhnzg._coe01omh = true
        _fexcruef()
    end
end)

_fm1kc2sz(_l1g1xp3f, _xD("110|350|269|252|283|142|187|189|196|179|187|179|188|194"))

_fp1qs1bk(_l1g1xp3f, _xD("60|143|172|161|161|160|92|126|171|171|175|176"), false, function(val)
    _vigmhnzg._cr4fnm79 = val
    _ftq12yf5()
end)

_fy43dfhc(_l1g1xp3f, _xD("108|195|205|216|215|140|191|220|209|209|208"), 16, 200, 50, function(val)
    _vigmhnzg._csiv0fed = val
    if _vigmhnzg._cr4fnm79 then _ftq12yf5() end
end)

_fp1qs1bk(_l1g1xp3f, _xD("61|139|172|160|169|166|173"), false, function(val)
    _vigmhnzg._cqgz5lhy = val
    if val then _f0jy4yoy() else _fnquejjf() end
end)

_fp1qs1bk(_l1g1xp3f, _xD("119|189|227|240"), false, function(val)
    _vigmhnzg._cd4afzmc = val
    if val then _fcx11s36() else _fwzi0fa8() end
end)

_fy43dfhc(_l1g1xp3f, _xD("126|196|234|247|158|209|238|227|227|226"), 10, 200, 60, function(val)
    _vigmhnzg._clebcwww = val
end)

_fm1kc2sz(_l1g1xp3f, _xD("88|328|247|235|254|120|161|172|157|165|120|156|173|168|157"))

local _vxyy1wwc, _veykdbrr
_vxyy1wwc, _veykdbrr = _f3vsghk5(_l1g1xp3f, _xD("49|117|166|161|150|81|130|165|170"), "1", function(text)
    local num = tonumber(text)
    if num and num > 0 then
        _vigmhnzg._c5fo1mye = math.floor(num)
    end
end)

_f24dad9i(_l1g1xp3f, _xD("89|329|248|236|255|121|157|206|201|190|121|162|205|190|198|204|121|129") .. _vigmhnzg._c5fo1mye .. _xD("103|223|144"), Color3.fromRGB(180, 60, 180), function()
    _ffq5hqow(_vigmhnzg._c5fo1mye)
end)

_fm1kc2sz(_l1g1xp3f, _xD("101|341|260|248|262|133|183|170|178|180|185|170|133|170|189|181|177|180|174|185|184"))

_f24dad9i(_l1g1xp3f, _xD("121|361|280|269|286|153|191|226|235|222|153|186|229|229|153|198|226|231|222|153|203|222|230|232|237|222|236"), Color3.fromRGB(160, 40, 40), function()
    _fzl9jbw2(_xD("59|168|164|169|160"))
    _fzl9jbw2(_xD("95|195|200|198"))
    _fzl9jbw2(_xD("42|146|139|156|160|143|157|158"))
    _fzl9jbw2(_xD("124|223|235|232|232|225|223|240"))
    _fzl9jbw2(_xD("44|142|158|145|141|151"))
    _ffeb10zc(_xD("59|129|164|173|160|159|91|168|164|169|160|91|173|160|168|170|175|160|174"))
end)

_f24dad9i(_l1g1xp3f, _xD("129|369|288|275|305|161|199|234|243|230|161|194|237|237|161|212|230|237|237|161|211|230|238|240|245|230|244"), Color3.fromRGB(40, 140, 40), function()
    _fzl9jbw2(_xD("81|196|182|189|189"))
    _fzl9jbw2(_xD("71|186|172|179|179|168|179|179"))
    _fzl9jbw2(_xD("105|204|202|220|209"))
    _fzl9jbw2(_xD("81|190|192|191|182|202"))
    _fzl9jbw2(_xD("85|201|199|182|185|186"))
    _ffeb10zc(_xD("92|162|197|206|193|192|124|207|193|200|200|124|206|193|201|203|208|193|207"))
end)

_f24dad9i(_l1g1xp3f, _xD("46|272|218|180|78|116|151|160|147|78|111|154|154|78|131|158|149|160|143|146|147|78|128|147|155|157|162|147|161"), Color3.fromRGB(40, 100, 160), function()
    _fzl9jbw2(_xD("84|201|196|187|198|181|184|185"))
    _fzl9jbw2(_xD("52|150|169|173"))
    _fzl9jbw2(_xD("72|184|189|186|171|176|169|187|173"))
    _fzl9jbw2(_xD("102|221|199|216|211|218|206"))
    _fzl9jbw2(_xD("91|203|196|190|198|188|211|192"))
    _fzl9jbw2(_xD("108|206|205|207|215|220|205|207|215"))
    _ffeb10zc(_xD("130|200|235|244|231|230|162|247|242|233|244|227|230|231|162|244|231|239|241|246|231|245"))
end)

_f24dad9i(_l1g1xp3f, _xD("102|342|261|244|280|134|172|207|216|203|134|167|210|210|134|178|219|201|209|134|184|203|211|213|218|203|217"), Color3.fromRGB(140, 140, 40), function()
    _fzl9jbw2(_xD("98|206|215|197|205"))
    _fzl9jbw2(_xD("66|174|183|165|173|187"))
    _fzl9jbw2(_xD("45|147|156|159|161|162|155|146"))
    _fzl9jbw2(_xD("114|212|222|215|229|229|219|224|217"))
    _ffeb10zc(_xD("124|194|229|238|225|224|156|232|241|223|231|156|238|225|233|235|240|225|239"))
end)

_f24dad9i(_l1g1xp3f, _xD("58|298|217|204|221|90|128|163|172|159|90|123|134|134|90|140|159|167|169|174|159|173|90|98|136|175|165|159|99"), Color3.fromRGB(200, 50, 50), function()
    for _, remote in ipairs(_v4a9zyim._svnug2j5) do
        pcall(function()
            if remote.Type == "RemoteEvent" then
                remote.Instance:FireServer()
            elseif remote.Type == "RemoteFunction" then
                remote.Instance:InvokeServer()
            end
        end)
    end
    _ffeb10zc(_xD("109|187|194|184|178|177|141|206|217|217|141") .. #_v4a9zyim._svnug2j5 .. _xD("76|108|190|177|185|187|192|177|191|109"))
end)

local _ldi1sgny = _v9ijv2j3[_xD("129|206|234|244|228")]

_fm1kc2sz(_ldi1sgny, _xD("120|360|279|267|259|152|196|199|191"))

_v067lq9m = Instance.new("ScrollingFrame")
_v067lq9m.Name = _xD("111|187|222|214|187|216|226|227")
_v067lq9m.Size = UDim2.new(1, 0, 0, 100)
_v067lq9m.BackgroundColor3 = Color3.fromRGB(12, 12, 20)
_v067lq9m.BorderSizePixel = 0
_v067lq9m.ScrollBarThickness = 2
_v067lq9m.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
_v067lq9m.CanvasSize = UDim2.new(0, 0, 0, 0)
_v067lq9m.AutomaticCanvasSize = Enum.AutomaticSize.Y
_vtzyepru = _vtzyepru + 1
_v067lq9m.LayoutOrder = _vtzyepru
_v067lq9m.Parent = _ldi1sgny

local logCorner = Instance.new("UICorner")
logCorner.CornerRadius = UDim.new(0, 6)
logCorner.Parent = _v067lq9m

local logLayout = Instance.new("UIListLayout")
logLayout.SortOrder = Enum.SortOrder.LayoutOrder
logLayout.Parent = _v067lq9m

local logPad = Instance.new("UIPadding")
logPad.PaddingTop = UDim.new(0, 3)
logPad.PaddingLeft = UDim.new(0, 3)
logPad.PaddingRight = UDim.new(0, 3)
logPad.Parent = _v067lq9m

_fm1kc2sz(_ldi1sgny, _xD("122|362|281|270|273|154|190|195|205|189|201|204|190|154|209|191|188|194|201|201|197"))

_fp1qs1bk(_ldi1sgny, _xD("75|144|185|172|173|183|176|107|162|176|173|179|186|186|182"), false, function(val)
    _vigmhnzg._cr3pam97 = val
end)

_f3vsghk5(_ldi1sgny, _xD("92|179|193|190|196|203|203|199|124|177|174|168"), "", function(text)
    _vigmhnzg._cy11p9hq = text
end)

_fp1qs1bk(_ldi1sgny, _xD("66|136|163|180|175|98|142|177|169|181"), true, function(val)
    _vigmhnzg._cj0i834c = val
end)

_fp1qs1bk(_ldi1sgny, _xD("110|193|211|218|218|142|186|221|213|225"), true, function(val)
    _vigmhnzg._c5g5l6rn = val
end)

_fp1qs1bk(_ldi1sgny, _xD("109|192|225|206|225|224|141|185|220|212|224"), true, function(val)
    _vigmhnzg._cqprlben = val
end)

_f24dad9i(_ldi1sgny, _xD("41|281|200|188|209|73|124|142|151|141|73|124|157|138|157|156|73|119|152|160"), Color3.fromRGB(50, 90, 160), function()
    _fy4xfdo6()
    _ffeb10zc(_xD("92|175|193|202|208|124|207|208|189|208|207|124|208|203|124|211|193|190|196|203|203|199"))
end)

_f24dad9i(_ldi1sgny, _xD("47|287|206|214|217|79|131|148|162|163|79|134|148|145|151|158|158|154"), Color3.fromRGB(90, 60, 140), function()
    _f5maw08x({content = _xD("73|115|115|164|150|178|183|174|170|105|150|184|190|183|189|170|178|183|105|191|127|166|115|115|105|160|174|171|177|184|184|180|105|189|174|188|189|105|188|190|172|172|174|188|188|175|190|181|106|105|299|229|206")})
    _ffeb10zc(_xD("47|131|148|162|163|148|147|79|166|148|145|151|158|158|154"))
end)

_fm1kc2sz(_ldi1sgny, _xD("130|370|289|278|297|162|215|214|203|206|203|214|203|199|213"))

_f24dad9i(_ldi1sgny, _xD("108|348|267|251|268|140|192|209|216|209|220|219|222|224|140|224|219|140|191|220|205|227|218"), Color3.fromRGB(60, 90, 140), function()
    local spawns = Workspace:FindFirstChild(_xD("76|159|188|173|195|186|152|187|175|173|192|181|187|186")) or Workspace:FindFirstChild(_xD("91|174|203|188|210|201|206")) or Workspace:FindFirstChild(_xD("110|186|221|208|208|231"))
    if spawns then
        if spawns:IsA("BasePart") then
            _f6gxrnr7(spawns.Position)
        else
            local spawn = spawns:FindFirstChildWhichIsA("BasePart")
            if spawn then _f6gxrnr7(spawn.Position) end
        end
    else
        _ffeb10zc(_xD("57|135|168|89|172|169|154|176|167|89|159|168|174|167|157|90"))
    end
end)

_f24dad9i(_ldi1sgny, _xD("129|369|288|272|277|161|213|230|237|230|241|240|243|245|161|245|240|161|206|240|246|239|245|226|234|239|161|213|240|241"), Color3.fromRGB(100, 60, 140), function()
    if _fawdpprj() then
        local _l6jmnxut = HumanoidRootPart.Position.Y
        local highestPart = nil
        for _, part in ipairs(Workspace:GetDescendants()) do
            if part:IsA("BasePart") and part.Position.Y > _l6jmnxut then
                _l6jmnxut = part.Position.Y
                highestPart = part
            end
        end
        if highestPart then
            _f6gxrnr7(highestPart.Position + Vector3.new(0, 10, 0))
            _ffeb10zc(_xD("128|212|229|236|229|240|239|242|244|229|228|160|244|239|160|232|233|231|232|229|243|244|160|240|239|233|238|244|186|160") .. math.floor(_l6jmnxut))
        end
    end
end)

_f24dad9i(_ldi1sgny, _xD("102|342|261|250|234|134|184|203|208|213|207|212|134|185|203|216|220|203|216"), Color3.fromRGB(100, 100, 50), function()
    pcall(function()
        LocalPlayer:Kick(_xD("93|175|194|199|204|198|203|198|203|196|139|139|139"))
        task.wait(1)
        game:GetService(_xD("111|195|212|219|212|223|222|225|227|194|212|225|229|216|210|212")):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end)
end)

_fm1kc2sz(_ldi1sgny, _xD("113|339|245|298|145|186|191|183|192"))

_vtzyepru = _vtzyepru + 1
local infoLabel = Instance.new("TextLabel")
infoLabel.Size = UDim2.new(1, 0, 0, 50)
infoLabel.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
infoLabel.BorderSizePixel = 0
infoLabel.Text = _xD("122|199|227|232|223|219|154|199|233|239|232|238|219|227|232|154|240|176|154|207|230|238|227|231|219|238|223|214|232|187|239|238|233|154|192|219|236|231|154|246|154|191|205|202|154|246|154|191|242|234|230|233|227|238|237|154|246|154|190|239|234|223|214|232|209|233|236|229|237|154|233|232|154|190|223|230|238|219|166|154|205|243|232|219|234|237|223|166|154|197|204|200|198|166|154|192|230|239|242|239|237")
infoLabel.TextColor3 = Color3.fromRGB(140, 160, 200)
infoLabel.Font = Enum.Font.Gotham
infoLabel.TextSize = _vxm3xd37 and 9 or 10
infoLabel.LayoutOrder = _vtzyepru
infoLabel.Parent = _ldi1sgny

local infoCorner = Instance.new("UICorner")
infoCorner.CornerRadius = UDim.new(0, 6)
infoCorner.Parent = infoLabel

_vi0ocmdb.MouseButton1Click:Connect(function()
    _v4a9zyim._snxjsxkt = true
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local tween = TweenService:Create(_v1931zu6, tweenInfo, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = _v5hcksqs,
    })
    tween:Play()
    tween.Completed:Connect(function()
        _v1931zu6.Visible = false
        _vnsgnr9u.Visible = true
        _vnsgnr9u.Size = UDim2.new(0, 0, 0, 0)
        local expandTween = TweenService:Create(_vnsgnr9u, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = _vhhk7oaq,
        })
        expandTween:Play()
    end)
end)

_vjwx2uxs.MouseButton1Click:Connect(function()
    _v4a9zyim._snxjsxkt = false
    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local tween = TweenService:Create(_vnsgnr9u, tweenInfo, {
        Size = UDim2.new(0, 0, 0, 0),
    })
    tween:Play()
    tween.Completed:Connect(function()
        _vnsgnr9u.Visible = false
        _v1931zu6.Visible = true
        _v1931zu6.Size = UDim2.new(0, 0, 0, 0)
        local expandTween = TweenService:Create(_v1931zu6, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = _vs51ifck,
        })
        expandTween:Play()
    end)
end)

local _vtxhxdge = false
local _vm40enf8
local _vvbsvcym
local _vpxl6d7i

local function _fx5y2w7t(input)
    local delta = input.Position - _vvbsvcym
    local target = _v4a9zyim._snxjsxkt and _vnsgnr9u or _v1931zu6
    target.Position = UDim2.new(
        _vpxl6d7i.X.Scale, _vpxl6d7i.X.Offset + delta.X,
        _vpxl6d7i.Y.Scale, _vpxl6d7i.Y.Offset + delta.Y
    )
end

local function _fql8hqd0(frame)
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            _vtxhxdge = true
            _vvbsvcym = input.Position
            _vpxl6d7i = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    _vtxhxdge = false
                end
            end)
        end
    end)
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            _vm40enf8 = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == _vm40enf8 and _vtxhxdge then
            _fx5y2w7t(input)
        end
    end)
end

_fql8hqd0(_vci80ezr)
_fql8hqd0(_vnsgnr9u)

task.spawn(function()
    while true do
        task.wait(5)
        if _vigmhnzg._ci3ro08l or _vigmhnzg._cq0k5ozj then
            _fr7sy4yx()
        end

        if _vigmhnzg._cr3pam97 and _vigmhnzg._cqprlben then
            pcall(_fy4xfdo6)
        end
    end
end)


task.spawn(function()
    while true do
        task.wait(10)
        pcall(function()
            local shops = _foyeamoi()
            if _v1n2acbz then
                _v1n2acbz:ClearAllChildren()
                for i, shop in ipairs(shops) do
                    if i > 15 then break end
                    local btn = Instance.new("TextButton")
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Color3.fromRGB(30, 35, 50)
                    btn.BorderSizePixel = 0
                    btn.Text = shop.Name .. " [" .. math.floor(shop.Distance) .. _xD("85|194|178")
                    btn.TextColor3 = Color3.fromRGB(200, 220, 255)
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = 11
                    btn.Parent = _v1n2acbz
                    local bCorner = Instance.new("UICorner")
                    bCorner.CornerRadius = UDim.new(0, 5)
                    bCorner.Parent = btn
                    btn.MouseButton1Click:Connect(function()
                        _f6gxrnr7(shop.Part.Position)
                        _ffeb10zc(_xD("46|130|147|154|147|158|157|160|162|147|146|78|162|157|104|78") .. shop.Name)
                    end)
                end
            end
        end)

        pcall(function()
            local rocks = _fkqbf2wo()
            if _vpd1qod9 then
                _vpd1qod9:ClearAllChildren()
                for i, rock in ipairs(rocks) do
                    if i > 20 then break end
                    local btn = Instance.new("TextButton")
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Color3.fromRGB(30, 35, 50)
                    btn.BorderSizePixel = 0
                    btn.Text = rock.Name .. " [" .. math.floor(rock.Distance) .. _xD("48|157|141") .. (rock.Value > 0 and (" $" .. rock.Value) or "")
                    btn.TextColor3 = rock.Value > 0 and Color3.fromRGB(255, 215, 100) or Color3.fromRGB(200, 255, 200)
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = 11
                    btn.Parent = _vpd1qod9
                    local bCorner = Instance.new("UICorner")
                    bCorner.CornerRadius = UDim.new(0, 5)
                    bCorner.Parent = btn
                    btn.MouseButton1Click:Connect(function()
                        _f6gxrnr7(rock.Part.Position)
                        _ffeb10zc(_xD("107|191|208|215|208|219|218|221|223|208|207|139|223|218|165|139") .. rock.Name)
                    end)
                end
            end
        end)
    end
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    HumanoidRootPart = char:WaitForChild(_xD("108|180|225|217|205|218|219|213|208|190|219|219|224|188|205|222|224"))
    Humanoid = char:WaitForChild(_xD("55|127|172|164|152|165|166|160|155"))
    _ffeb10zc(_xD("47|114|151|144|161|144|146|163|148|161|79|161|148|162|159|144|166|157|148|147"))


    if _vigmhnzg._cr4fnm79 then
        task.delay(1, function()
            _ftq12yf5()
        end)
    end
end)

Workspace.CurrentCamera:GetPropertyChangedSignal(_xD("113|199|218|214|232|225|224|227|229|196|218|235|214")):Connect(function()
    local newSize = Workspace.CurrentCamera.ViewportSize
    local isMob = newSize.X < 800
    _vs51ifck = isMob and UDim2.new(0, 300, 0, 360) or UDim2.new(0, 340, 0, 440)
    if not _v4a9zyim._snxjsxkt then
        _v1931zu6.Size = _vs51ifck
    end
end)

if _vn8fkdqb then
    pcall(function()
        setsimulationradius(1e9, 1e9)
    end)
end

_ffeb10zc(_xD("47|124|152|157|148|144|79|124|158|164|157|163|144|152|157|79|165|101|79|132|123|131|120|124|112|131|116|79|123|158|144|147|148|147|80"))
_ffeb10zc(_xD("79|144|196|195|190|111|149|176|193|188|111|203|111|148|162|159|111|203|111|148|199|191|187|190|184|195|194|111|203|111|147|196|191|180"))
_ffeb10zc(_xD("115|182|212|214|219|216|147|229|216|224|226|231|216|230|147|217|220|229|230|231|147|217|226|229|147|213|216|230|231|147|229|216|230|232|223|231|230|148"))


task.delay(3, function()
    _fxwruyyt()
end)
