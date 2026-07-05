--[[
    Mv6
    r4.2.1
]]
local _xD=setmetatable({},{__index=function(s,k)local o=tonumber(k)if not o then return nil end;local function d(a)o=o or tonumber(a[1])local r=""for i=2,#a do r=r..string.char(tonumber(a[i])-o)end;return r end;return d end})

local Players = game:GetService(_xD("71"."151"."179"."168"."192"."172"."185"."186"))
local ReplicatedStorage = game:GetService(_xD("44"."126"."145"."156"."152"."149"."143"."141"."160"."145"."144"."127"."160"."155"."158"."141"."147"."145"))
local Workspace = game:GetService(_xD("84"."171"."195"."198"."191"."199"."196"."181"."183"."185"))
local RunService = game:GetService(_xD("55"."137"."172"."165"."138"."156"."169"."173"."160"."154"."156"))
local TweenService = game:GetService(_xD("125"."209"."244"."226"."226"."235"."208"."226"."239"."243"."230"."224"."226"))
local UserInputService = game:GetService(_xD("72"."157"."187"."173"."186"."145"."182"."184"."189"."188"."155"."173"."186"."190"."177"."171"."173"))
local HttpService = game:GetService(_xD("52"."124"."168"."168"."164"."135"."153"."166"."170"."157"."151"."153"))
local StarterGui = game:GetService(_xD("42"."125"."158"."139"."156"."158"."143"."156"."113"."159"."147"))
local Lighting = game:GetService(_xD("81"."157"."186"."184"."185"."197"."186"."191"."184"))

if false then local _dyhxk2za=coroutine.create(function() return 998 end) end
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild(_xD("47"."119"."164"."156"."144"."157"."158"."152"."147"."129"."158"."158"."163"."127"."144"."161"."163"))
local Humanoid = Character:WaitForChild(_xD("55"."127"."172"."164"."152"."165"."166"."160"."155"))

local _gfmg5kpn = {
    _c2li3eru = false,
    _cwfws4b8 = false,
    _cg3s4gld = false,
    _c2thgchu = false,
    _cpzc4900 = false,
    _c4dqc2td = false,
if false then local _duy0on1y=typeof(Instance.new("Part")) end
    _cq1te7c4 = false,
    _c918thr0 = false,
    _c1n8brbm = false,
    _c9e96ycq = false,
    _cydkd467 = false,
    _c1ucr11a = 500,
    _cad7eor5 = 300,
    _cej1dfa8 = 0.05,
    _cisn9zvr = 0.3,
if false then local _d0r3upwa=coroutine.create(function() return 510 end) end
    _cj4dwkjq = 0.03,
    _cgvcafd5 = 50,
    _csy2f8nq = 100,
    _crz1g3pj = 60,
    _c554l618 = true,
    _c19r02ss = false,
    _co5n0uzl = 1,
    _ccyfm2b6 = "",
if false then local _dup7zo4l=table.create(758,nil) end
    _cvuycazv = false,
    _cx3jf8cs = true,
    _cw8dzcqw = true,
    _c4b0fo94 = true,
}

local _gngy4ui1 = {
    _scab2b23 = nil,
    _s37w3tyc = nil,
    _st9nzgrt = {},
if false then local _d6aodqtk=math.floor(math.random()*681+681) end
    _s1lqgu7n = nil,
    _sxuhzhw9 = nil,
    _slymxgs2 = nil,
    _shmify3s = nil,
    _sqki7ryk = false,
    _sgakpswy = _xD("110"."188"."221"."220"."211"),
    _s52y2tr6 = 0,
    _s6n5p1av = 0,
    _s8p5yacl = 0,
    _s8xv4mfq = 0,
if false then local _dvhjrfuq=string.len(tostring(834)) end
    _s6frkmd6 = 0,
    _sj2gpavs = {},
    _sphwb7rv = {},
    _spab0rkt = {},
    _s5ssv5bx = _xD("105"."175"."202"."219"."214"),
}

local _v6zgj6xe = (getgenv ~= nil)
local _vyk1c4k9 = _v6zgj6xe and getgenv() or _G
if false then local _do76l8sg=table.create(695,nil) end
local _v8j3o8px = (hookmetamethod ~= nil)
local _v7bs887v = (newcclosure ~= nil)
local _v05qb14q = (getrawmetatable ~= nil)
local _vwb7rgkj = (setreadonly ~= nil)
local _vnpz3du1 = (fireclickdetector ~= nil)
local _vmmcsexa = (fireproximityprompt ~= nil)
local _v8xgtjp3 = (firetouchinterest ~= nil)
local _v3vzub8e = (sethiddenproperty ~= nil)
if false then local _d07rhvjs=table.create(919,nil) end
local _v1s5i06j = (setsimulationradius ~= nil)
local _vk4qou0a = (getconnections ~= nil)
local _v9qavpnu = (syn ~= nil and syn.protect_gui ~= nil)
local _vdxlzjl9 = (checkcaller ~= nil)

local _gbypg9cl = {}

do

if false then local _dn2hn519=table.create(732,nil) end
    if _v8j3o8px and _v7bs887v and _v05qb14q and _vwb7rgkj then
        local _gxb1ag5b
        _gxb1ag5b = hookmetamethod(game, _xD("102"."197"."197"."212"."199"."211"."203"."201"."199"."210"."210"), newcclosure(function(self, ...)
            local method = getnamecallmethod()
            local args = {...}


            if method == _xD("89"."159"."194"."199"."189"."172"."190"."203"."207"."194"."188"."190") then
                local _l44s4xg4 = args[1]
                if _l44s4xg4 == _xD("103"."172"."223"."215"."211"."214"."208"."219"."186"."204"."217"."221"."208"."202"."204") or _l44s4xg4 == _xD("77"."144"."181"."178"."174"."193"."160"."178"."191"."195"."182"."176"."178") then
if false then local _de591fn2=Instance.new("Frame") _de591fn2.Size=UDim2.new(0,294,0,294) end
                    return nil
                end
            end


            if method == _xD("119"."190"."220"."235"."202"."218"."233"."224"."231"."235"."185"."240"."235"."220"."218"."230"."219"."220") then
                if _vdxlzjl9 and checkcaller() then
                    return _gxb1ag5b(self, ...)
                end
            end


if false then local _dkgpghzb=coroutine.create(function() return 544 end) end
            if method == _xD("111"."186"."216"."210"."218") and self == LocalPlayer then
                return nil
            end

            return _gxb1ag5b(self, ...)
        end))


        local _g5fnkxwg
        _g5fnkxwg = hookmetamethod(game, _xD("53"."148"."148"."158"."163"."153"."154"."173"), newcclosure(function(self, key)
            if self == Humanoid then
                if key == _xD("99"."186"."196"."207"."206"."182"."211"."200"."200"."199") and _gfmg5kpn._c1n8brbm then
if false then local _d04wj4z6=table.create(369,nil) end
                    return 16
                end
                if key == _xD("53"."127"."170"."162"."165"."133"."164"."172"."154"."167") and _gfmg5kpn._csy2f8nq > 50 then
                    return 50
                end
            end
            return _g5fnkxwg(self, key)
        end))


if false then local _dfzgeba1=Instance.new("Frame") _dfzgeba1.Size=UDim2.new(0,873,0,873) end
        local _gjr6rx3y
        _gjr6rx3y = hookmetamethod(game, _xD("105"."200"."200"."215"."206"."224"."210"."215"."205"."206"."225"), newcclosure(function(self, key, value)
            if self == Humanoid then
                if key == _xD("96"."183"."193"."204"."203"."179"."208"."197"."197"."196") then
                    if _gfmg5kpn._c1n8brbm then
                        return _gjr6rx3y(self, key, _gfmg5kpn._cgvcafd5)
                    end
                end
                if key == _xD("116"."190"."233"."225"."228"."196"."227"."235"."217"."230") then
                    return _gjr6rx3y(self, key, value)
                end
            end
if false then local _d7fgwr5s=Instance.new("Frame") _d7fgwr5s.Size=UDim2.new(0,420,0,420) end
            return _gjr6rx3y(self, key, value)
        end))
    end


    if _v8j3o8px and _v7bs887v then
        local _vxw57wwe
        _vxw57wwe = hookmetamethod(game, _xD("53"."148"."148"."163"."150"."162"."154"."152"."150"."161"."161"), newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if method == _xD("102"."177"."207"."201"."209") and self == LocalPlayer then
                return nil
            end
if false then local _dwlsrr6q=table.create(606,nil) end
            return _vxw57wwe(self, ...)
        end))
    end
end

local function _fuzf32j8()
    Character = LocalPlayer.Character
    if Character then
        HumanoidRootPart = Character:FindFirstChild(_xD("44"."116"."161"."153"."141"."154"."155"."149"."144"."126"."155"."155"."160"."124"."141"."158"."160"))
        Humanoid = Character:FindFirstChild(_xD("52"."124"."169"."161"."149"."162"."163"."157"."152"))
    end
    return Character and HumanoidRootPart and Humanoid
end

if false then local _dbtwo1ob=string.len(tostring(835)) end
local function _fbtdgwzr(part)
    if not _fuzf32j8() then return math.huge end
    return (HumanoidRootPart.Position - part.Position).Magnitude
end

local function _fitqnoqn(position)
    if not _fuzf32j8() then return false end
    HumanoidRootPart.CFrame = CFrame.new(position + Vector3.new(0, 3, 0))
    task.wait(_gfmg5kpn._cj4dwkjq)
    return true
end

if false then local _dlyr6f0m=table.create(109,nil) end
local function _ferk280l(cframe)
    if not _fuzf32j8() then return false end
    HumanoidRootPart.CFrame = cframe + Vector3.new(0, 3, 0)
    task.wait(_gfmg5kpn._cj4dwkjq)
    return true
end

local function _fr0i2b8u(message)
    local timestamp = os.date(_xD("90"."127"."162"."148"."127"."167"."148"."127"."173"))
    table.insert(_gngy4ui1._sj2gpavs, 1, "[" .. timestamp .. "] " .. message)
    if #_gngy4ui1._sj2gpavs > 50 then
if false then local _dfu0nyp7=math.floor(math.random()*874+874) end
        table.remove(_gngy4ui1._sj2gpavs)
    end
    if _v6gqiez5 then
        pcall(function()
            _v6gqiez5:ClearAllChildren()
            for i, log in ipairs(_gngy4ui1._sj2gpavs) do
                if i > 15 then break end
                local label = Instance.new("TextLabel")
                label.Size = UDim2.new(1, 0, 0, 18)
                label.BackgroundTransparency = 1
                label.Text = log
                label.TextColor3 = Color3.fromRGB(200, 200, 200)
                label.TextXAlignment = Enum.TextXAlignment.Left
if false then local _dcgwoxr4=string.len(tostring(955)) end
                label.Font = Enum.Font.Gotham
                label.TextSize = 11
                label.Parent = _v6gqiez5
            end
        end)
    end
end

local function _f9ir2ki1()
if false then local _d3bvssdh=typeof(Instance.new("Part")) end
    _gngy4ui1._spab0rkt = {}
    pcall(function()
        for _, remote in ipairs(ReplicatedStorage:GetDescendants()) do
            if remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction") then
                table.insert(_gngy4ui1._spab0rkt, {
                    Instance = remote,
                    Name = remote.Name,
                    Type = remote.ClassName,
                })
            end
        end
    end)
if false then local _dpebzos2=coroutine.create(function() return 768 end) end
    _fr0i2b8u(_xD("76"."143"."173"."175"."180"."177"."176"."108") .. #_gngy4ui1._spab0rkt .. _xD("42"."74"."156"."143"."151"."153"."158"."143"."157"))
end

local function _femvr8ro(namePattern, ...)
    local args = {...}
    for _, remote in ipairs(_gngy4ui1._spab0rkt) do
        local rName = string.lower(remote.Name)
        local pattern = string.lower(namePattern)
        if string.find(rName, pattern) then
if false then local _dls2yd5m=Instance.new("Frame") _dls2yd5m.Size=UDim2.new(0,722,0,722) end
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

if false then local _dgjn012o=table.create(965,nil) end
local function _fg3ban2j(name, ...)
    local args = {...}
    for _, remote in ipairs(_gngy4ui1._spab0rkt) do
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
if false then local _d0nfhf4w=typeof(Instance.new("Part")) end
    return false
end

local _v3wmfvp3 = {
    _xD("114"."228"."225"."213"."221"), _xD("53"."164"."167"."154"), _xD("53"."168"."169"."164"."163"."154"), _xD("120"."229"."225"."230"."221"."234"."217"."228"), _xD("60"."159"."174"."181"."175"."176"."157"."168"), _xD("62"."165"."163"."171"), _xD("128"."227"."239"."225"."236"), _xD("44"."149"."158"."155"."154"),
    _xD("104"."207"."215"."212"."204"), _xD("60"."160"."165"."157"."169"."171"."170"."160"), _xD("89"."188"."200"."201"."201"."190"."203"), _xD("114"."229"."219"."222"."232"."215"."228"), _xD("60"."174"."177"."158"."181"), _xD("94"."195"."203"."195"."208"."191"."202"."194"), _xD("52"."167"."149"."164"."164"."156"."157"."166"."153"),
    _xD("65"."162"."174"."166"."181"."169"."186"."180"."181"), _xD("74"."184"."185"."174"."175"), _xD("93"."211"."194"."198"."203"), _xD("61"."161"."162"."173"."172"."176"."166"."177"), _xD("127"."225"."238"."244"."235"."227"."228"."241"), _xD("124"."239"."240"."221"."238"."239"."221"."236"."236"."228"."229"."238"."225"),
    _xD("121"."237"."232"."233"."218"."243"), _xD("66"."177"."178"."163"."174"), _xD("60"."172"."161"."157"."174"."168"), _xD("82"."188"."179"."182"."183"), _xD("43"."156"."160"."140"."157"."159"."165"), _xD("53"."164"."151"."168"."158"."153"."158"."150"."163"), _xD("102"."210"."199"."214"."207"."217"),
    _xD("43"."152"."148"."159"."147"."157"."148"."151"), _xD("126"."242"."231"."242"."223"."236"."231"."243"."235"), _xD("130"."242"."238"."227"."246"."235"."240"."247"."239"), _xD("118"."230"."219"."232"."223"."218"."229"."234"), _xD("112"."234"."217"."226"."211"."223"."222"), _xD("83"."186"."180"."197"."193"."184"."199"),
    _xD("85"."182"."198"."202"."182"."194"."182"."199"."190"."195"."186"), _xD("58"."157"."163"."174"."172"."163"."168"."159"), _xD("96"."212"."193"."206"."218"."193"."206"."201"."212"."197"), _xD("77"."186"."188"."188"."187"."192"."193"."188"."187"."178"), _xD("94"."209"."211"."204"."209"."210"."205"."204"."195"),
    _xD("103"."201"."211"."214"."214"."203"."218"."219"."214"."213"."204"), _xD("122"."233"."232"."243"."242"), _xD("47"."163"."158"."164"."161"."156"."144"."155"."152"."157"."148"), _xD("126"."241"."238"."231"."236"."227"."234"), _xD("64"."162"."165"."178"."185"."172"), _xD("44"."143"."148"."141"."152"."143"."145"."144"."155"."154"."165"),
}

if false then local _d08diapm=math.floor(math.random()*294+294) end
local function _fqdk74d8()
    local rocks = {}
    local function _fyupa5bd(parent)
        if not parent then return end
        for _, child in ipairs(parent:GetChildren()) do
            local nameLower = string.lower(child.Name)
            if child:IsA("BasePart") or child:IsA("Model") then
                local matched = false
if false then local _dvk5ibg6=Instance.new("Frame") _dvk5ibg6.Size=UDim2.new(0,276,0,276) end
                for _, pattern in ipairs(_v3wmfvp3) do
                    if string.find(nameLower, pattern) then
                        matched = true
                        break
                    end
                end
                if matched then
                    local part = child:IsA("BasePart") and child or child:FindFirstChildWhichIsA("BasePart")
                    if part then
                        local dist = _fbtdgwzr(part)
                        if dist <= _gfmg5kpn._c1ucr11a then

                            local value = 0
if false then local _d3lmzpbt=coroutine.create(function() return 737 end) end
                            pcall(function()
                                local val = child:FindFirstChild(_xD("105"."191"."202"."213"."222"."206")) or child:FindFirstChild(_xD("64"."144"."178"."169"."163"."165")) or child:FindFirstChild(_xD("123"."210"."234"."237"."239"."227")) or child:FindFirstChild(_xD("61"."147"."158"."169"."178"."162"."140"."179"."162"."175"."175"."166"."161"."162"))
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
if false then local _dndwebt4=string.len(tostring(850)) end
                if #child:GetChildren() > 0 then
                    _fyupa5bd(child)
                end
            end
        end
    end

    local searchAreas = {
        Workspace:FindFirstChild(_xD("110"."192"."221"."209"."217"."225")),
        Workspace:FindFirstChild(_xD("48"."127"."162"."149"."163")),
        Workspace:FindFirstChild(_xD("98"."175"."203"."208"."199"."212"."195"."206"."213")),
        Workspace:FindFirstChild(_xD("78"."155"."183"."188"."179"."193")),
        Workspace:FindFirstChild(_xD("66"."148"."167"."181"."177"."183"."180"."165"."167"."181")),
        Workspace:FindFirstChild(_xD("54"."131"."151"."166")),
if false then local _d5vwlkc0=table.create(835,nil) end
        Workspace:FindFirstChild(_xD("79"."163"."180"."193"."193"."176"."184"."189")),
        Workspace:FindFirstChild(_xD("78"."145"."192"."199"."193"."194"."175"."186"."193")),
        Workspace:FindFirstChild(_xD("115"."192"."226"."232"."225"."231"."212"."220"."225")),
        Workspace,
    }

    for _, area in ipairs(searchAreas) do
        if area then
            _fyupa5bd(area)
        end
    end


if false then local _dtkz5xuf=table.create(988,nil) end
    if _gfmg5kpn._c19r02ss then
        table.sort(rocks, function(a, b) return a.Value > b.Value end)
    elseif _gfmg5kpn._c554l618 then
        table.sort(rocks, function(a, b) return a.Distance < b.Distance end)
    end

    return rocks
end

if false then local _dlda2urb=typeof(Instance.new("Part")) end
local function _fqen8g17()
    local shops = {}
    local function _f1kmjq2l(parent)
        if not parent then return end
        for _, child in ipairs(parent:GetChildren()) do
            local nameLower = string.lower(child.Name)
            if child:IsA("Model") or child:IsA("BasePart") then
                if string.find(nameLower, _xD("46"."161"."150"."157"."158")) or string.find(nameLower, _xD("108"."223"."209"."216"."216")) or
if false then local _d7nqxsjg=string.len(tostring(903)) end
                   string.find(nameLower, _xD("46"."161"."162"."157"."160"."147")) or string.find(nameLower, _xD("87"."196"."188"."201"."186"."191"."184"."197"."203")) or
                   string.find(nameLower, _xD("127"."243"."241"."224"."227"."228"."241")) or string.find(nameLower, _xD("115"."215"."216"."212"."223"."216"."229")) or
                   string.find(nameLower, _xD("104"."213"."201"."218"."211"."205"."220")) or string.find(nameLower, _xD("40"."158"."141"."150"."140"."151"."154")) or
                   string.find(nameLower, _xD("73"."172"."170"."188"."177"."178"."174"."187")) or string.find(nameLower, _xD("100"."198"."217"."221"."201"."214")) or
                   string.find(nameLower, _xD("94"."204"."206"."193")) or string.find(nameLower, _xD("74"."173"."171"."189"."178")) or
                   string.find(nameLower, _xD("130"."234"."241"."239"."231")) or string.find(nameLower, _xD("101"."199"."198"."216"."202")) or
                   string.find(nameLower, _xD("91"."190"."188"."200"."203")) then
                    local part = child:IsA("BasePart") and child or child:FindFirstChildWhichIsA("BasePart") or child:FindFirstChild(_xD("49"."121"."166"."158"."146"."159"."160"."154"."149"."131"."160"."160"."165"."129"."146"."163"."165"))
if false then local _dvywx9gq=coroutine.create(function() return 943 end) end
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
if false then local _d31w7xgv=math.floor(math.random()*915+915) end
                if #child:GetChildren() > 0 then
                    _f1kmjq2l(child)
                end
            end
        end
    end

    _f1kmjq2l(Workspace)
if false then local _dmzawvwx=Instance.new("Frame") _dmzawvwx.Size=UDim2.new(0,117,0,117) end
    table.sort(shops, function(a, b) return a.Distance < b.Distance end)
    return shops
end

local function _f617ez8s(_licqw3d4)
    local rock = _licqw3d4.Instance
    local part = _licqw3d4.Part

if false then local _d8kn0sl7=string.len(tostring(757)) end
    if not rock or not rock.Parent then return false end

    _fr0i2b8u(_xD("51"."128"."156"."161"."156"."161"."154"."109"."83") .. _licqw3d4.Name)


    _fitqnoqn(part.Position)
    task.wait(0.05)


    if _vnpz3du1 then
        local _lcjswygk = rock:FindFirstChildOfClass("ClickDetector") or part:FindFirstChildOfClass("ClickDetector")
        if _lcjswygk then
if false then local _dw3qpuls=Instance.new("Frame") _dw3qpuls.Size=UDim2.new(0,970,0,970) end
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
if false then local _ddti4oex=string.len(tostring(483)) end
        firetouchinterest(HumanoidRootPart, part, 0)
        task.wait(0.01)
        firetouchinterest(HumanoidRootPart, part, 1)
    end


    local tool = Character and Character:FindFirstChildOfClass("Tool")
    if tool then
if false then local _dkkik3c5=coroutine.create(function() return 925 end) end
        tool:Activate()
    end


    _femvr8ro(_xD("127"."236"."232"."237"."228"))
    _femvr8ro(_xD("58"."162"."155"."172"."176"."159"."173"."174"))
    _femvr8ro(_xD("122"."221"."233"."230"."230"."223"."221"."238"))
    _femvr8ro(_xD("114"."212"."228"."215"."211"."221"))
    _femvr8ro(_xD("58"."161"."155"."174"."162"."159"."172"))
    _femvr8ro(_xD("111"."211"."216"."214"))
    _femvr8ro(_xD("50"."162"."155"."149"."157"))
    _femvr8ro(_xD("46"."161"."165"."151"."156"."149"))


if false then local _dcyuljm9=Instance.new("Frame") _dcyuljm9.Size=UDim2.new(0,153,0,153) end
    for _, remote in ipairs(_gngy4ui1._spab0rkt) do
        local rName = string.lower(remote.Name)
        if string.find(rName, _xD("114"."223"."219"."224"."215")) or string.find(rName, _xD("108"."208"."213"."211")) or string.find(rName, _xD("121"."225"."218"."235"."239"."222"."236"."237")) then
            pcall(function()
                if remote.Type == "RemoteEvent" then
                    remote.Instance:FireServer(rock, part)
                elseif remote.Type == "RemoteFunction" then
                    remote.Instance:InvokeServer(rock, part)
                end
            end)
        end
    end

if false then local _dw6yufgz=math.floor(math.random()*107+107) end
    _gngy4ui1._s52y2tr6 = _gngy4ui1._s52y2tr6 + 1

    return true
end

local function _fakpo0ga(_lhu9qmvc)
    if not _lhu9qmvc then return false end

    local shop = _lhu9qmvc.Instance
    local part = _lhu9qmvc.Part

if false then local _de172aby=string.len(tostring(905)) end
    _fr0i2b8u(_xD("73"."156"."174"."181"."181"."178"."183"."176"."105"."170"."189"."131"."105") .. _lhu9qmvc.Name)


    _fitqnoqn(part.Position)
    task.wait(0.1)


    if _vnpz3du1 then
        local _lcjswygk = shop:FindFirstChildOfClass("ClickDetector") or part:FindFirstChildOfClass("ClickDetector")
        if _lcjswygk then
            fireclickdetector(_lcjswygk)
        end
    end


if false then local _dsx19wz1=math.floor(math.random()*819+819) end
    if _vmmcsexa then
        local prompt = shop:FindFirstChildOfClass("ProximityPrompt") or part:FindFirstChildOfClass("ProximityPrompt")
        if prompt then
            fireproximityprompt(prompt)
        end
    end


    if _v8xgtjp3 then
if false then local _daqitt45=coroutine.create(function() return 308 end) end
        firetouchinterest(HumanoidRootPart, part, 0)
        task.wait(0.01)
        firetouchinterest(HumanoidRootPart, part, 1)
    end


    _femvr8ro(_xD("84"."199"."185"."192"."192"))
    _femvr8ro(_xD("90"."205"."194"."201"."202"))
    _femvr8ro(_xD("109"."218"."206"."223"."216"."210"."225"))
    _femvr8ro(_xD("105"."221"."219"."202"."205"."206"))
    _femvr8ro(_xD("101"."200"."198"."216"."205"))
    _femvr8ro(_xD("45"."154"."156"."155"."146"."166"))
    _femvr8ro(_xD("78"."193"."179"."186"."186"."175"."186"."186"))
if false then local _drf7o55o=Instance.new("Frame") _drf7o55o.Size=UDim2.new(0,163,0,163) end
    _femvr8ro(_xD("74"."189"."175"."182"."182"."169"."171"."182"."182"))

    _gngy4ui1._s6n5p1av = _gngy4ui1._s6n5p1av + 1

    return true
end

local function _fx9ryzy2()
    if _gngy4ui1._scab2b23 then return end
    _fr0i2b8u(_xD("64"."129"."181"."180"."175"."96"."134"."161"."178"."173"."96"."147"."148"."129"."146"."148"."133"."132"))

if false then local _dhmwlhrj=Instance.new("Frame") _dhmwlhrj.Size=UDim2.new(0,483,0,483) end
    _gngy4ui1._scab2b23 = RunService.Heartbeat:Connect(function()
        if not _gfmg5kpn._c2li3eru then return end
        if not _fuzf32j8() then return end

        local rocks = _fqdk74d8()
        if #rocks > 0 then
            local target = rocks[1]
            _gngy4ui1._sgakpswy = target.Name
            _f617ez8s(target)
            task.wait(_gfmg5kpn._cej1dfa8)
        else
if false then local _d8emp3bd=Instance.new("Frame") _d8emp3bd.Size=UDim2.new(0,411,0,411) end
            _gngy4ui1._sgakpswy = _xD("119"."202"."220"."216"."233"."218"."223"."224"."229"."222"."165"."165"."165")
        end
    end)
end

local function _fbzpn2e7()
    if _gngy4ui1._scab2b23 then
        _gngy4ui1._scab2b23:Disconnect()
        _gngy4ui1._scab2b23 = nil
    end
if false then local _d8gunop4=Instance.new("Frame") _d8gunop4.Size=UDim2.new(0,665,0,665) end
    _gngy4ui1._sgakpswy = _xD("46"."124"."157"."156"."147")
    _fr0i2b8u(_xD("74"."139"."191"."190"."185"."106"."144"."171"."188"."183"."106"."157"."158"."153"."154"."154"."143"."142"))
end

local function _f347hv6t()
    if _gngy4ui1._s37w3tyc then return end
    _fr0i2b8u(_xD("116"."181"."233"."232"."227"."148"."199"."217"."224"."224"."148"."199"."200"."181"."198"."200"."185"."184"))

    _gngy4ui1._s37w3tyc = RunService.Heartbeat:Connect(function()
        if not _gfmg5kpn._cwfws4b8 then return end
        if not _fuzf32j8() then return end

        local shops = _fqen8g17()
if false then local _dl716zwi=coroutine.create(function() return 467 end) end
        if #shops > 0 then
            _fakpo0ga(shops[1])
            task.wait(_gfmg5kpn._cisn9zvr)
        end
    end)
end

local function _fydyasal()
    if _gngy4ui1._s37w3tyc then
        _gngy4ui1._s37w3tyc:Disconnect()
if false then local _di6k6fgu=math.floor(math.random()*697+697) end
        _gngy4ui1._s37w3tyc = nil
    end
    _fr0i2b8u(_xD("70"."135"."187"."186"."181"."102"."153"."171"."178"."178"."102"."153"."154"."149"."150"."150"."139"."138"))
end

local function _fdjeys13()
    if _gngy4ui1._shmify3s then return end
    _fr0i2b8u(_xD("93"."158"."210"."209"."204"."125"."178"."205"."196"."207"."190"."193"."194"."125"."176"."177"."158"."175"."177"."162"."161"))

if false then local _dgu7gxfu=math.floor(math.random()*634+634) end
    _gngy4ui1._shmify3s = RunService.Heartbeat:Connect(function()
        if not _gfmg5kpn._cg3s4gld then return end


        _femvr8ro(_xD("49"."166"."161"."152"."163"."146"."149"."150"))
        _femvr8ro(_xD("62"."160"."179"."183"))
        _femvr8ro(_xD("126"."238"."243"."240"."225"."230"."223"."241"."227"))
        _femvr8ro(_xD("119"."238"."216"."233"."228"."235"."223"))
        _femvr8ro(_xD("102"."214"."207"."201"."209"."199"."222"."203"))
        _femvr8ro(_xD("97"."195"."194"."196"."204"."209"."194"."196"."204"))
        _femvr8ro(_xD("114"."229"."226"."215"."215"."214"))
        _femvr8ro(_xD("100"."200"."205"."203"))

if false then local _d1m1yoos=string.len(tostring(948)) end
        _gngy4ui1._s8xv4mfq = _gngy4ui1._s8xv4mfq + 1
        task.wait(1)
    end)
end

local function _fzvs1pno()
    if _gngy4ui1._shmify3s then
        _gngy4ui1._shmify3s:Disconnect()
        _gngy4ui1._shmify3s = nil
    end
    _fr0i2b8u(_xD("42"."107"."159"."158"."153"."74"."127"."154"."145"."156"."139"."142"."143"."74"."125"."126"."121"."122"."122"."111"."110"))
end

if false then local _dqciwiqd=coroutine.create(function() return 321 end) end
local function _fiskaoq8()
    for _, highlight in ipairs(_gngy4ui1._sphwb7rv) do
        pcall(function() highlight:Destroy() end)
    end
    _gngy4ui1._sphwb7rv = {}
end

local function _fs8o4sa7()
    _fiskaoq8()

    local rocks = _fqdk74d8()
    for _, rock in ipairs(rocks) do
        if rock.Instance and rock.Instance.Parent then

if false then local _dz5m46t0=table.create(276,nil) end
            local highlight = Instance.new("Highlight")
            highlight.Name = _xD("64"."133"."147"."144"."159") .. rock.Name
            highlight.FillTransparency = 0.6
            highlight.OutlineTransparency = 0
            highlight.OutlineColor = rock.Value > 0 and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(100, 200, 255)
            highlight.FillColor = rock.Value > 0 and Color3.fromRGB(255, 200, 50) or Color3.fromRGB(80, 150, 255)
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = rock.Instance


if false then local _d1qwhjqv=Instance.new("Frame") _d1qwhjqv.Size=UDim2.new(0,310,0,310) end
            local billboard = Instance.new("BillboardGui")
            billboard.Name = _xD("44"."113"."127"."124"."120"."141"."142"."145"."152")
            billboard.Size = UDim2.new(0, 120, 0, 30)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = rock.Part

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 0.4
            label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            label.Text = rock.Name .. (rock.Value > 0 and (_xD("85"."117"."209"."117"."121") .. tostring(rock.Value)) or "")
            label.TextColor3 = rock.Value > 0 and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(100, 200, 255)
            label.Font = Enum.Font.GothamBold
if false then local _dtx2zquk=typeof(Instance.new("Part")) end
            label.TextSize = 11
            label.Parent = billboard

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 4)
            corner.Parent = label

            table.insert(_gngy4ui1._sphwb7rv, highlight)
            table.insert(_gngy4ui1._sphwb7rv, billboard)
        end
    end


if false then local _dhtiqlhr=math.floor(math.random()*558+558) end
    local shops = _fqen8g17()
    for _, shop in ipairs(shops) do
        if shop.Instance and shop.Instance.Parent then
            local highlight = Instance.new("Highlight")
            highlight.Name = _xD("68"."137"."151"."148"."163"."151"."172"."179"."180"."163") .. shop.Name
            highlight.FillTransparency = 0.5
            highlight.OutlineTransparency = 0
            highlight.OutlineColor = Color3.fromRGB(0, 255, 100)
            highlight.FillColor = Color3.fromRGB(50, 255, 100)
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = shop.Instance

if false then local _d66xeex7=string.len(tostring(771)) end
            local billboard = Instance.new("BillboardGui")
            billboard.Name = _xD("126"."195"."209"."206"."209"."230"."237"."238"."202"."223"."224"."227"."234")
            billboard.Size = UDim2.new(0, 100, 0, 25)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = shop.Part

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 0.4
if false then local _dbq322gt=math.floor(math.random()*474+474) end
            label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            label.Text = _xD("120"."203"."192"."199"."200"."178"."152") .. shop.Name
            label.TextColor3 = Color3.fromRGB(0, 255, 100)
            label.Font = Enum.Font.GothamBold
            label.TextSize = 10
            label.Parent = billboard

            table.insert(_gngy4ui1._sphwb7rv, highlight)
            table.insert(_gngy4ui1._sphwb7rv, billboard)
        end
    end

    _fr0i2b8u(_xD("45"."114"."128"."125"."103"."77") .. #rocks .. _xD("111"."143"."225"."222"."210"."218"."226"."155"."143") .. #shops .. _xD("91"."123"."206"."195"."202"."203"."206"))
end

if false then local _dox3dk8u=typeof(Instance.new("Part")) end
local function _fahwopdf()
    if _gfmg5kpn._c2thgchu then
        _fs8o4sa7()

        task.spawn(function()
            while _gfmg5kpn._c2thgchu do
                task.wait(5)
                if _gfmg5kpn._c2thgchu then
if false then local _djdp8pgn=table.create(809,nil) end
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
if false then local _drhjj821=math.floor(math.random()*546+546) end
    if _gngy4ui1._s1lqgu7n then return end
    _fr0i2b8u(_xD("81"."146"."191"."197"."186"."113"."149"."178"."190"."178"."184"."182"."113"."150"."159"."146"."147"."157"."150"."149"))

    _gngy4ui1._s1lqgu7n = RunService.Heartbeat:Connect(function()
        if not _fuzf32j8() then return end


        if Humanoid and Humanoid.Health < Humanoid.MaxHealth then
            Humanoid.Health = Humanoid.MaxHealth
        end


        if _gfmg5kpn._c4dqc2td then
            pcall(function()

if false then local _djrbxw74=table.create(732,nil) end
                local _ldad9zqo = Character:FindFirstChild(_xD("96"."183"."193"."210"."205"."212"."200")) or Character:FindFirstChild(_xD("74"."158"."175"."183"."186"."175"."188"."171"."190"."191"."188"."175")) or Character:FindFirstChild(_xD("115"."182"."226"."223"."215"))
                if _ldad9zqo and _ldad9zqo:IsA("ValueBase") then
                    _ldad9zqo.Value = 100
                end


                local _lgsubcjp = Character:FindFirstChild(_xD("66"."136"."180"."177"."188"."167"."176")) or Character:FindFirstChild(_xD("68"."141"."183"."138"."182"."179"."190"."169"."178")) or Character:FindFirstChild(_xD("94"."164"."208"."195"."195"."216"."199"."204"."197"))
                if _lgsubcjp and _lgsubcjp:IsA("BoolValue") then
                    _lgsubcjp.Value = false
                end


if false then local _dqjqfuzl=math.floor(math.random()*423+423) end
                _femvr8ro(_xD("71"."190"."168"."185"."180"."187"."175"))
                _femvr8ro(_xD("46"."163"."156"."148"."160"."147"."147"."168"."147"))
                _femvr8ro(_xD("60"."164"."161"."157"."176"))
            end)
        end
    end)
end

local function _f8owkba0()
    if _gngy4ui1._s1lqgu7n then
        _gngy4ui1._s1lqgu7n:Disconnect()
        _gngy4ui1._s1lqgu7n = nil
    end
if false then local _dpkb0t96=table.create(462,nil) end
    _fr0i2b8u(_xD("79"."144"."189"."195"."184"."111"."147"."176"."188"."176"."182"."180"."111"."147"."152"."162"."144"."145"."155"."148"."147"))
end

local function _f2jk6i63()
    if not _gfmg5kpn._cq1te7c4 then return end
    _fr0i2b8u(_xD("69"."134"."181"."181"."177"."190"."174"."179"."172"."101"."154"."179"."177"."174"."178"."174"."185"."170"."169"."101"."135"."166"."168"."176"."181"."166"."168"."176"."115"."115"."115"))

    pcall(function()

        local _l59b3it2 = LocalPlayer:FindFirstChild(_xD("112"."178"."209"."211"."219"."224"."209"."211"."219"."179"."209"."224"."209"."211"."217"."228"."233")) or LocalPlayer:FindFirstChild(_xD("124"."201"."221"."244"."191"."221"."238"."238"."245")) or LocalPlayer:FindFirstChild(_xD("67"."134"."164"."181"."181"."188"."142"."138"))
if false then local _d0gr9wlu=math.floor(math.random()*410+410) end
        if _l59b3it2 and _l59b3it2:IsA("ValueBase") then
            _l59b3it2.Value = 999999
        end


        local leaderstats = LocalPlayer:FindFirstChild(_xD("73"."181"."174"."170"."173"."174"."187"."188"."189"."170"."189"."188"))
        if leaderstats then
            for _, stat in ipairs(leaderstats:GetChildren()) do
                local nameLower = string.lower(stat.Name)
if false then local _d1ops95x=Instance.new("Frame") _d1ops95x.Size=UDim2.new(0,129,0,129) end
                if string.find(nameLower, _xD("58"."156"."155"."157"."165"."170"."155"."157"."165")) or string.find(nameLower, _xD("65"."164"."162"."179"."179"."186")) or string.find(nameLower, _xD("86"."185"."183"."198"."183"."185"."191"."202"."207")) or string.find(nameLower, _xD("70"."189"."171"."175"."173"."174"."186")) or string.find(nameLower, _xD("40"."147"."143")) then
                    if stat:IsA("ValueBase") then
                        stat.Value = 999999
                    end
                end
            end
        end


if false then local _dl1frn91=math.floor(math.random()*493+493) end
        _femvr8ro(_xD("88"."186"."185"."187"."195"."200"."185"."187"."195"))
        _femvr8ro(_xD("100"."199"."197"."212"."197"."199"."205"."216"."221"))
        _femvr8ro(_xD("130"."229"."227"."244"."244"."251"))
        _femvr8ro(_xD("52"."169"."164"."155"."166"."149"."152"."153"."147"."150"."149"."151"."159"."164"."149"."151"."159"))
    end)


    task.spawn(function()
        while _gfmg5kpn._cq1te7c4 do
            task.wait(2)
            pcall(function()
                local leaderstats = LocalPlayer:FindFirstChild(_xD("130"."238"."231"."227"."230"."231"."244"."245"."246"."227"."246"."245"))
                if leaderstats then
if false then local _dgz1qk3b=table.create(602,nil) end
                    for _, stat in ipairs(leaderstats:GetChildren()) do
                        local nameLower = string.lower(stat.Name)
                        if string.find(nameLower, _xD("82"."180"."179"."181"."189"."194"."179"."181"."189")) or string.find(nameLower, _xD("129"."228"."226"."243"."243"."250")) or string.find(nameLower, _xD("45"."144"."142"."157"."142"."144"."150"."161"."166")) or string.find(nameLower, _xD("125"."244"."226"."230"."228"."229"."241")) or string.find(nameLower, _xD("104"."211"."207")) then
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

if false then local _dxp0n17y=Instance.new("Frame") _dxp0n17y.Size=UDim2.new(0,971,0,971) end
local function _foqomzy9()
    if not _gfmg5kpn._c918thr0 then return end
    _fr0i2b8u(_xD("129"."194"."241"."241"."237"."250"."234"."239"."232"."161"."214"."239"."237"."234"."238"."234"."245"."230"."229"."161"."205"."246"."228"."236"."175"."175"."175"))

    pcall(function()

        local _lpz1ki9y = LocalPlayer:FindFirstChild(_xD("85"."161"."202"."184"."192")) or LocalPlayer:FindFirstChild(_xD("66"."134"."171"."169"."142"."183"."165"."173")) or LocalPlayer:FindFirstChild(_xD("47"."124"."152"."157"."152"."157"."150"."123"."164"."146"."154"))
        if _lpz1ki9y and _lpz1ki9y:IsA("ValueBase") then
            _lpz1ki9y.Value = 999999
        end


if false then local _dw515ocr=Instance.new("Frame") _dw515ocr.Size=UDim2.new(0,791,0,791) end
        local leaderstats = LocalPlayer:FindFirstChild(_xD("55"."163"."156"."152"."155"."156"."169"."170"."171"."152"."171"."170"))
        if leaderstats then
            for _, stat in ipairs(leaderstats:GetChildren()) do
                local nameLower = string.lower(stat.Name)
                if string.find(nameLower, _xD("70"."178"."187"."169"."177")) then
                    if stat:IsA("ValueBase") then
                        stat.Value = 999999
                    end
                end
            end
        end


if false then local _d9p0haer=Instance.new("Frame") _d9p0haer.Size=UDim2.new(0,306,0,306) end
        _femvr8ro(_xD("107"."215"."224"."206"."214"))
        _femvr8ro(_xD("100"."208"."217"."199"."207"."221"))
        _femvr8ro(_xD("118"."218"."223"."221"."213"."226"."235"."217"."225"))
    end)


    task.spawn(function()
        while _gfmg5kpn._c918thr0 do
            task.wait(2)
            pcall(function()
if false then local _d452ao1j=math.floor(math.random()*622+622) end
                local leaderstats = LocalPlayer:FindFirstChild(_xD("118"."226"."219"."215"."218"."219"."232"."233"."234"."215"."234"."233"))
                if leaderstats then
                    for _, stat in ipairs(leaderstats:GetChildren()) do
                        if string.find(string.lower(stat.Name), _xD("60"."168"."177"."159"."167")) and stat:IsA("ValueBase") then
                            stat.Value = 999999
                        end
                    end
                end
            end)
        end
    end)
end

local function _felt293d(amount)
if false then local _dq6dl4oq=Instance.new("Frame") _dq6dl4oq.Size=UDim2.new(0,307,0,307) end
    _fr0i2b8u(_xD("60"."125"."176"."176"."161"."169"."172"."176"."165"."170"."163"."92"."176"."171"."92"."160"."177"."172"."161"."92") .. amount .. _xD("97"."129"."202"."213"."198"."206"."212"."143"."143"."143"))

    pcall(function()

        for i = 1, amount do
            _femvr8ro(_xD("74"."173"."185"."182"."182"."175"."173"."190"))
            _femvr8ro(_xD("58"."167"."163"."168"."159"))
            _femvr8ro(_xD("102"."206"."199"."216"."220"."203"."217"."218"))
            _femvr8ro(_xD("116"."228"."221"."215"."223"."233"."228"))
            _femvr8ro(_xD("76"."179"."173"."192"."180"."177"."190"))
if false then local _d2yizvak=math.floor(math.random()*463+463) end
            _femvr8ro(_xD("111"."219"."222"."222"."227"))
            _femvr8ro(_xD("65"."176"."163"."181"."162"."170"."175"))
            _femvr8ro(_xD("72"."175"."186"."169"."182"."188"))
            _femvr8ro(_xD("47"."161"."148"."166"."144"."161"."147"))
            task.wait(0.05)
        end


        local leaderstats = LocalPlayer:FindFirstChild(_xD("85"."193"."186"."182"."185"."186"."199"."200"."201"."182"."201"."200"))
        if leaderstats then
            for _, stat in ipairs(leaderstats:GetChildren()) do
if false then local _dm3xof3t=table.create(198,nil) end
                local nameLower = string.lower(stat.Name)
                if string.find(nameLower, _xD("77"."176"."191"."198"."192"."193"."174"."185")) or string.find(nameLower, _xD("75"."186"."189"."176")) or string.find(nameLower, _xD("90"."193"."191"."199")) or string.find(nameLower, _xD("120"."225"."236"."221"."229")) then
                    if stat:IsA("NumberValue") or stat:IsA("IntValue") then
                        stat.Value = stat.Value * amount
                    end
                end
            end
        end


        for i = 1, amount do
            _femvr8ro(_xD("68"."183"."169"."176"."176"))
            task.wait(0.02)
if false then local _dqb6ysyg=coroutine.create(function() return 980 end) end
            _femvr8ro(_xD("85"."183"."202"."206"))
            task.wait(0.02)
        end


        local rocks = _fqdk74d8()
        if #rocks > 0 then
            local _ld1ltkyc = rocks[1]
            for i = 1, amount do
                for _, remote in ipairs(_gngy4ui1._spab0rkt) do
if false then local _dopmem30=table.create(589,nil) end
                    local rName = string.lower(remote.Name)
                    if string.find(rName, _xD("70"."169"."181"."178"."178"."171"."169"."186")) or string.find(rName, _xD("65"."177"."170"."164"."172"."182"."177")) or string.find(rName, _xD("61"."169"."172"."172"."177")) then
                        pcall(function()
                            if remote.Type == "RemoteEvent" then
                                remote.Instance:FireServer(_ld1ltkyc.Instance, _ld1ltkyc.Part)
                            end
                        end)
                    end
                end
if false then local _d0y1aiqf=math.floor(math.random()*695+695) end
                task.wait(0.05)
            end
        end
    end)

    _gngy4ui1._s8p5yacl = _gngy4ui1._s8p5yacl + amount
    _fr0i2b8u(_xD("109"."177"."226"."221"."210"."141"."206"."225"."225"."210"."218"."221"."225"."141"."208"."220"."218"."221"."217"."210"."225"."210"."167"."141") .. amount .. _xD("113"."233"))
end

local function _f6rrymn2()
if false then local _dunz7rmj=typeof(Instance.new("Part")) end
    if _gngy4ui1._sxuhzhw9 then return end
    _fr0i2b8u(_xD("44"."122"."155"."143"."152"."149"."156"."76"."113"."122"."109"."110"."120"."113"."112"))

    _gngy4ui1._sxuhzhw9 = RunService.Stepped:Connect(function()
        if not _gfmg5kpn._c9e96ycq then return end
        if not _fuzf32j8() then return end
        for _, part in ipairs(Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end)
end

if false then local _d375zca8=typeof(Instance.new("Part")) end
local function _fy5u34ix()
    if _gngy4ui1._sxuhzhw9 then
        _gngy4ui1._sxuhzhw9:Disconnect()
        _gngy4ui1._sxuhzhw9 = nil
    end
    _fr0i2b8u(_xD("40"."118"."151"."139"."148"."145"."152"."72"."108"."113"."123"."105"."106"."116"."109"."108"))
end

local _v9etezfn = nil
local _v5joeztm = nil

local function _f1hpcap5()
if false then local _d2hca6fv=string.len(tostring(433)) end
    if _gngy4ui1._slymxgs2 then return end
    if not _fuzf32j8() then return end
    _fr0i2b8u(_xD("114"."184"."222"."235"."146"."183"."192"."179"."180"."190"."183"."182"))


    _v9etezfn = Instance.new("BodyVelocity")
    _v9etezfn.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    _v9etezfn.Velocity = Vector3.new(0, 0, 0)
    _v9etezfn.Parent = HumanoidRootPart

if false then local _dzdbugev=string.len(tostring(540)) end
    _v5joeztm = Instance.new("BodyGyro")
    _v5joeztm.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    _v5joeztm.P = 9e4
    _v5joeztm.Parent = HumanoidRootPart

    _gngy4ui1._slymxgs2 = RunService.RenderStepped:Connect(function()
        if not _gfmg5kpn._cydkd467 then return end
        if not _fuzf32j8() then return end

        local cam = Workspace.CurrentCamera
        local moveDir = Vector3.new(0, 0, 0)

        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
if false then local _dxcylks0=math.floor(math.random()*462+462) end
            moveDir = moveDir + cam.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveDir = moveDir - cam.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveDir = moveDir - cam.CFrame.RightVector
        end
if false then local _d1i6b4dp=Instance.new("Frame") _d1i6b4dp.Size=UDim2.new(0,443,0,443) end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDir = moveDir + cam.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            moveDir = moveDir + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            moveDir = moveDir - Vector3.new(0, 1, 0)
        end

if false then local _d7vljudf=coroutine.create(function() return 810 end) end
        if moveDir.Magnitude > 0 then
            moveDir = moveDir.Unit * _gfmg5kpn._crz1g3pj
        end

        _v9etezfn.Velocity = moveDir
        _v5joeztm.CFrame = cam.CFrame
    end)
end

local function _fkbykdh5()
    if _gngy4ui1._slymxgs2 then
        _gngy4ui1._slymxgs2:Disconnect()
        _gngy4ui1._slymxgs2 = nil
    end
if false then local _d0tuoytc=string.len(tostring(467)) end
    if _v9etezfn then _v9etezfn:Destroy() _v9etezfn = nil end
    if _v5joeztm then _v5joeztm:Destroy() _v5joeztm = nil end
    _fr0i2b8u(_xD("77"."147"."185"."198"."109"."145"."150"."160"."142"."143"."153"."146"."145"))
end

local function _f8qecca1()
    if not _fuzf32j8() then return end
    if _gfmg5kpn._c1n8brbm then
        Humanoid._cgvcafd5 = _gfmg5kpn._cgvcafd5
    else
        Humanoid._cgvcafd5 = 16
    end
end

if false then local _d4ixj300=table.create(461,nil) end
local _vsrkpkv7 = {}
local _vy6ism5j = false

local function _fetm6cpp(data)
    if not _gfmg5kpn._cvuycazv or _gfmg5kpn._ccyfm2b6 == "" then return end
    pcall(function()
        HttpService:PostAsync(_gfmg5kpn._ccyfm2b6, HttpService:JSONEncode(data))
    end)
end

local function _f3g2t33s(itemName)
if false then local _d7fq2muw=math.floor(math.random()*659+659) end
    if not _gfmg5kpn._cx3jf8cs then return end
    _fetm6cpp({
        content = _xD("127"."169"."169"."218"."204"."232"."237"."228"."224"."159"."204"."238"."244"."237"."243"."224"."232"."237"."220"."169"."169"."159"."204"."232"."237"."228"."227"."185"."159") .. itemName .. _xD("102"."134"."226"."134"."186"."213"."218"."199"."210"."160"."134") .. _gngy4ui1._s52y2tr6,
    })
end

local function _fze1huf8()
    if not _gfmg5kpn._cw8dzcqw then return end
    _fetm6cpp({
        content = _xD("84"."126"."126"."175"."161"."189"."194"."185"."181"."116"."161"."195"."201"."194"."200"."181"."189"."194"."177"."126"."126"."116"."167"."195"."192"."184"."116"."189"."200"."185"."193"."199"."116"."208"."116"."168"."195"."200"."181"."192"."116"."199"."185"."192"."192"."199"."142"."116") .. _gngy4ui1._s6n5p1av,
    })
end

if false then local _dmufty5j=table.create(264,nil) end
local function _foxsyh1o()
    if not _gfmg5kpn._c4b0fo94 then return end
    _fetm6cpp({
        content = _xD("61"."103"."103"."152"."138"."166"."171"."162"."158"."93"."138"."172"."178"."171"."177"."158"."166"."171"."93"."144"."177"."158"."177"."176"."154"."103"."103"."93"."138"."166"."171"."162"."161"."119"."93") .. _gngy4ui1._s52y2tr6 .. _xD("122"."154"."246"."154"."205"."223"."230"."230"."237"."180"."154") .. _gngy4ui1._s6n5p1av .. _xD("96"."128"."220"."128"."164"."213"."208"."197"."211"."154"."128") .. _gngy4ui1._s8p5yacl .. _xD("105"."137"."229"."137"."189"."202"."219"."208"."206"."221"."163"."137") .. _gngy4ui1._sgakpswy,
    })
end

local _vav1c6dy = Instance.new("ScreenGui")
_vav1c6dy.Name = _xD("127"."204"."232"."237"."228"."224"."204"."238"."244"."237"."243"."224"."232"."237"."213"."181")
_vav1c6dy.ResetOnSpawn = false
_vav1c6dy.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_vav1c6dy.IgnoreGuiInset = true

if false then local _dt8sfth6=coroutine.create(function() return 538 end) end
if _v9qavpnu then
    pcall(function() syn.protect_gui(_vav1c6dy) end)
end
_vav1c6dy.Parent = game:GetService(_xD("107"."174"."218"."221"."208"."178"."224"."212"))


local ViewSize = Workspace.CurrentCamera.ViewportSize
local _viviujy2 = ViewSize.X < 800
local _v1hdn2zz = _viviujy2 and UDim2.new(0.95, 0, 0, 480) or UDim2.new(0, 380, 0, 540)
local _vay7ze84 = UDim2.new(0, 150, 0, 42)
local GUIPosition = UDim2.new(0.025, 0, 0.08, 0)
if false then local _dqvux0jd=typeof(Instance.new("Part")) end
local MinimizedPosition = UDim2.new(0.025, 0, 0.03, 0)

local _v4n0dhc4 = Instance.new("Frame")
_v4n0dhc4.Name = _xD("87"."164"."184"."192"."197"."157"."201"."184"."196"."188")
_v4n0dhc4.Size = _v1hdn2zz
_v4n0dhc4.Position = GUIPosition
_v4n0dhc4.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
_v4n0dhc4.BackgroundTransparency = 0.15
_v4n0dhc4.BorderSizePixel = 0
_v4n0dhc4.ClipsDescendants = true
_v4n0dhc4.Parent = _vav1c6dy

local _vgqlkepr = Instance.new("UICorner")
if false then local _dqf0h7ti=table.create(789,nil) end
_vgqlkepr.CornerRadius = UDim.new(0, 14)
_vgqlkepr.Parent = _v4n0dhc4


local _vty5ttgn = Instance.new("UIStroke")
_vty5ttgn.Color = Color3.fromRGB(90, 130, 255)
_vty5ttgn.Thickness = 1.5
_vty5ttgn.Transparency = 0.2
_vty5ttgn.Parent = _v4n0dhc4


local _v8nsv97l = Instance.new("ImageLabel")
if false then local _dlprxvjw=coroutine.create(function() return 376 end) end
_v8nsv97l.Name = _xD("73"."144"."181"."170"."188"."188"."139"."181"."190"."187")
_v8nsv97l.Size = UDim2.new(1, 40, 1, 40)
_v8nsv97l.Position = UDim2.new(0, -20, 0, -20)
_v8nsv97l.BackgroundTransparency = 1
_v8nsv97l.Image = "rbxassetid://7669168585"
_v8nsv97l.ImageColor3 = Color3.fromRGB(50, 80, 200)
_v8nsv97l.ImageTransparency = 0.75
_v8nsv97l.ScaleType = Enum.ScaleType.Slice
_v8nsv97l.SliceCenter = Rect.new(45, 45, 45, 45)
_v8nsv97l.Parent = _v4n0dhc4

if false then local _dmpdm7mf=table.create(264,nil) end
local _vlzeri6g = Instance.new("Frame")
_vlzeri6g.Name = _xD("104"."176"."205"."201"."204"."205"."218")
_vlzeri6g.Size = UDim2.new(1, 0, 0, 48)
_vlzeri6g.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
_vlzeri6g.BackgroundTransparency = 0.1
_vlzeri6g.BorderSizePixel = 0
_vlzeri6g.Parent = _v4n0dhc4

local _vulva1ko = Instance.new("UICorner")
_vulva1ko.CornerRadius = UDim.new(0, 14)
_vulva1ko.Parent = _vlzeri6g

if false then local _dy01hfgs=coroutine.create(function() return 706 end) end
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
if false then local _dhubgr53=string.len(tostring(501)) end
_v4a3m1q6.Text = _xD("45"."9980"."77"."122"."150"."155"."146"."142"."77"."122"."156"."162"."155"."161"."142"."150"."155"."77"."163"."99")
_v4a3m1q6.TextColor3 = Color3.fromRGB(130, 170, 255)
_v4a3m1q6.Font = Enum.Font.GothamBold
_v4a3m1q6.TextSize = _viviujy2 and 13 or 15
_v4a3m1q6.TextXAlignment = Enum.TextXAlignment.Left
_v4a3m1q6.Parent = _vlzeri6g


if false then local _dlpwydcm=math.floor(math.random()*547+547) end
local _vnfnvfx4 = Instance.new("TextLabel")
_vnfnvfx4.Size = UDim2.new(0, 28, 0, 18)
_vnfnvfx4.Position = UDim2.new(0.65, 0, 0.5, -9)
_vnfnvfx4.BackgroundColor3 = Color3.fromRGB(60, 100, 255)
_vnfnvfx4.BorderSizePixel = 0
_vnfnvfx4.Text = _xD("42"."160"."96")
_vnfnvfx4.TextColor3 = Color3.fromRGB(255, 255, 255)
_vnfnvfx4.Font = Enum.Font.GothamBold
_vnfnvfx4.TextSize = 10
_vnfnvfx4.Parent = _vlzeri6g

if false then local _dk6kncz4=coroutine.create(function() return 852 end) end
local vCorner = Instance.new("UICorner")
vCorner.CornerRadius = UDim.new(0, 9)
vCorner.Parent = _vnfnvfx4


local _va9mu7w7 = Instance.new("TextButton")
_va9mu7w7.Size = UDim2.new(0, 40, 0, 28)
_va9mu7w7.Position = UDim2.new(1, -48, 0, 10)
if false then local _dopkkb4i=table.create(529,nil) end
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
if false then local _de30qnuh=coroutine.create(function() return 654 end) end
_vbibkfpc.Size = _vay7ze84
_vbibkfpc.Position = MinimizedPosition
_vbibkfpc.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
_vbibkfpc.BackgroundTransparency = 0.15
_vbibkfpc.BorderSizePixel = 0
_vbibkfpc.Visible = false
_vbibkfpc.Parent = _vav1c6dy

local miniCorner = Instance.new("UICorner")
miniCorner.CornerRadius = UDim.new(0, 12)
miniCorner.Parent = _vbibkfpc

if false then local _dhha3l4u=string.len(tostring(872)) end
local miniStroke = Instance.new("UIStroke")
miniStroke.Color = Color3.fromRGB(90, 130, 255)
miniStroke.Thickness = 1.5
miniStroke.Transparency = 0.2
miniStroke.Parent = _vbibkfpc

local _vb3ohd1p = Instance.new("TextLabel")
_vb3ohd1p.Size = UDim2.new(0.6, 0, 1, 0)
if false then local _dtzfoucm=typeof(Instance.new("Part")) end
_vb3ohd1p.Position = UDim2.new(0.06, 0, 0, 0)
_vb3ohd1p.BackgroundTransparency = 1
_vb3ohd1p.Text = _xD("50"."9985"."82"."127"."155"."160"."151"."147")
_vb3ohd1p.TextColor3 = Color3.fromRGB(130, 170, 255)
_vb3ohd1p.Font = Enum.Font.GothamBold
_vb3ohd1p.TextSize = 13
_vb3ohd1p.TextXAlignment = Enum.TextXAlignment.Left
_vb3ohd1p.Parent = _vbibkfpc

local _v061siw4 = Instance.new("TextButton")
_v061siw4.Size = UDim2.new(0, 40, 0, 28)
_v061siw4.Position = UDim2.new(1, -48, 0, 7)
if false then local _dkprvtef=typeof(Instance.new("Part")) end
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

if false then local _ds9tp25w=string.len(tostring(665)) end
local _v29ksdz8 = Instance.new("Frame")
_v29ksdz8.Name = _xD("129"."213"."226"."227"."195"."226"."243")
_v29ksdz8.Size = UDim2.new(1, -12, 0, 32)
_v29ksdz8.Position = UDim2.new(0, 6, 0, 52)
_v29ksdz8.BackgroundTransparency = 1
_v29ksdz8.Parent = _v4n0dhc4

local TabLayout = Instance.new("UIListLayout")
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.Padding = UDim.new(0, 3)
TabLayout.Parent = _v29ksdz8

if false then local _d96h0kz4=string.len(tostring(989)) end
local _lo3nekdl = {_xD("56"."126"."153"."170"."165"), _xD("63"."146"."164"."171"."171"), _xD("52"."121"."135"."132"), _xD("64"."133"."184"."176"."172"."175"."169"."180"), _xD("71"."148"."176"."186"."170")}
local _v7ae9701 = {}
local _vpw6qnkq = {}

for i, tabName in ipairs(_lo3nekdl) do
    local tabBtn = Instance.new("TextButton")
    tabBtn.Name = tabName .. _xD("75"."159"."172"."173")
    tabBtn.Size = UDim2.new(0.2, 0, 1, 0)
    tabBtn.BackgroundColor3 = (tabName == _xD("125"."195"."222"."239"."234")) and Color3.fromRGB(50, 90, 200) or Color3.fromRGB(30, 30, 50)
    tabBtn.BorderSizePixel = 0
    tabBtn.Text = tabName
    tabBtn.TextColor3 = Color3.fromRGB(220, 230, 255)
    tabBtn.Font = Enum.Font.GothamBold
if false then local _dn5kyi1m=coroutine.create(function() return 180 end) end
    tabBtn.TextSize = _viviujy2 and 10 or 11
    tabBtn.LayoutOrder = i
    tabBtn.Parent = _v29ksdz8

    local tCorner = Instance.new("UICorner")
    tCorner.CornerRadius = UDim.new(0, 8)
    tCorner.Parent = tabBtn

    _v7ae9701[tabName] = tabBtn
end

if false then local _diqa978f=Instance.new("Frame") _diqa978f.Size=UDim2.new(0,107,0,107) end
local _vvifiefp = Instance.new("Frame")
_vvifiefp.Name = _xD("97"."164"."208"."207"."213"."198"."207"."213"."162"."211"."198"."194")
_vvifiefp.Size = UDim2.new(1, -12, 1, -90)
_vvifiefp.Position = UDim2.new(0, 6, 0, 88)
_vvifiefp.BackgroundTransparency = 1
_vvifiefp.ClipsDescendants = true
_vvifiefp.Parent = _v4n0dhc4


for _, tabName in ipairs(_lo3nekdl) do
    local tabFrame = Instance.new("ScrollingFrame")
if false then local _d4ak5ayc=string.len(tostring(634)) end
    tabFrame.Name = tabName .. _xD("104"."171"."215"."214"."220"."205"."214"."220")
    tabFrame.Size = UDim2.new(1, 0, 1, 0)
    tabFrame.BackgroundTransparency = 1
    tabFrame.BorderSizePixel = 0
    tabFrame.ScrollBarThickness = 3
    tabFrame.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
    tabFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    tabFrame.Visible = (tabName == _xD("112"."182"."209"."226"."221"))
    tabFrame.Parent = _vvifiefp

if false then local _d0t83rd0=table.create(376,nil) end
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

if false then local _dbkc4zpv=math.floor(math.random()*353+353) end
local function _fx7x1rr6(tabName)
    _gngy4ui1._s5ssv5bx = tabName
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

if false then local _dshah1sm=Instance.new("Frame") _dshah1sm.Size=UDim2.new(0,749,0,749) end
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
if false then local _d2w80lel=string.len(tostring(643)) end
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.LayoutOrder = _vsfa6lk5
    label.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = label
    return label
end

local function _fqblradu(parent, name, default, callback)
if false then local _db6tzwaw=math.floor(math.random()*358+358) end
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

if false then local _dzhl6ucr=Instance.new("Frame") _dzhl6ucr.Size=UDim2.new(0,592,0,592) end
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

if false then local _dn90jrrd=string.len(tostring(636)) end
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 52, 0, 24)
    toggleBtn.Position = UDim2.new(1, -60, 0.5, -12)
    toggleBtn.BackgroundColor3 = default and Color3.fromRGB(50, 180, 90) or Color3.fromRGB(50, 50, 70)
    toggleBtn.BorderSizePixel = 0
    toggleBtn.Text = default and _xD("108"."187"."186") or _xD("126"."205"."196"."196")
    toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.TextSize = 10
    toggleBtn.Parent = frame

    local tCorner = Instance.new("UICorner")
    tCorner.CornerRadius = UDim.new(0, 12)
if false then local _de6t9297=typeof(Instance.new("Part")) end
    tCorner.Parent = toggleBtn

    local toggled = default
    toggleBtn.MouseButton1Click:Connect(function()
        toggled = not toggled
        toggleBtn.BackgroundColor3 = toggled and Color3.fromRGB(50, 180, 90) or Color3.fromRGB(50, 50, 70)
        toggleBtn.Text = toggled and _xD("102"."181"."180") or _xD("60"."139"."130"."130")
        callback(toggled)
    end)

    return frame, toggleBtn
end

if false then local _d9io4cou=string.len(tostring(962)) end
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
if false then local _duzlendt=math.floor(math.random()*163+163) end
    btn.LayoutOrder = _vsfa6lk5
    btn.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    btn.MouseButton1Click:Connect(callback)
    return btn
end

local function _fg7eldna(parent, name, minVal, maxVal, defaultVal, callback)
if false then local _dms59lyx=table.create(320,nil) end
    _vsfa6lk5 = _vsfa6lk5 + 1
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 50)
    frame.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
    frame.BorderSizePixel = 0
    frame.LayoutOrder = _vsfa6lk5
    frame.Parent = parent

if false then local _dcu965dg=string.len(tostring(547)) end
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

if false then local _df5akbpc=Instance.new("Frame") _df5akbpc.Size=UDim2.new(0,619,0,619) end
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Size = UDim2.new(1, -12, 0, 14)
    sliderFrame.Position = UDim2.new(0, 6, 0, 28)
    sliderFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    sliderFrame.BorderSizePixel = 0
    sliderFrame.Parent = frame

    local sCorner = Instance.new("UICorner")
    sCorner.CornerRadius = UDim.new(0, 7)
if false then local _dygi0z8k=typeof(Instance.new("Part")) end
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
if false then local _dnfkd4mr=string.len(tostring(609)) end
    local function updateSlider(input)
        local relX = math.clamp((input.Position.X - sliderFrame.AbsolutePosition.X) / sliderFrame.AbsoluteSize.X, 0, 1)
        local val = math.floor(minVal + (maxVal - minVal) * relX)
        fillBar.Size = UDim2.new(relX, 0, 1, 0)
        label.Text = name .. ": " .. tostring(val)
        callback(val)
    end

    sliderFrame.InputBegan:Connect(function(input)
if false then local _d8yhjm55=table.create(716,nil) end
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
if false then local _diho5836=Instance.new("Frame") _diho5836.Size=UDim2.new(0,497,0,497) end
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            sliding = false
        end
    end)

    return frame
end

local function _flzxyqpx(parent, name, defaultText, callback)
    _vsfa6lk5 = _vsfa6lk5 + 1
if false then local _ddvzp1ci=math.floor(math.random()*498+498) end
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
if false then local _daxowyyb=string.len(tostring(261)) end
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
if false then local _drka605t=table.create(363,nil) end
    input.PlaceholderText = name
    input.TextColor3 = Color3.fromRGB(220, 220, 240)
    input.PlaceholderText3 = Color3.fromRGB(100, 100, 120)
    input.Font = Enum.Font.Gotham
    input.TextSize = _viviujy2 and 10 or 11
    input.ClearTextOnFocus = false
    input.Parent = frame

    local iCorner = Instance.new("UICorner")
    iCorner.CornerRadius = UDim.new(0, 6)
    iCorner.Parent = input

if false then local _db6ytry7=string.len(tostring(544)) end
    input.FocusLost:Connect(function()
        callback(input.Text)
    end)

    return frame, input
end

local _ldgcwjh9 = _vpw6qnkq[_xD("84"."154"."181"."198"."193")]

if false then local _dxegwyjd=table.create(920,nil) end
_ffbdaqdq(_ldgcwjh9, _xD("79"."128281"."111"."162"."163"."144"."163"."162"))
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
if false then local _d88gpcde=typeof(Instance.new("Part")) end
_vxklw9bk.Name = _xD("123"."206"."239"."220"."239"."238"."207"."224"."243"."239")
_vxklw9bk.Size = UDim2.new(1, -12, 1, 0)
_vxklw9bk.Position = UDim2.new(0, 6, 0, 0)
_vxklw9bk.BackgroundTransparency = 1
_vxklw9bk.Text = _xD("95"."172"."200"."205"."196"."195"."153"."127"."143"."127"."219"."127"."178"."196"."203"."203"."210"."153"."127"."143"."127"."219"."127"."179"."192"."209"."198"."196"."211"."153"."127"."173"."206"."205"."196")
_vxklw9bk.TextColor3 = Color3.fromRGB(180, 200, 230)
_vxklw9bk.Font = Enum.Font.Gotham
_vxklw9bk.TextSize = _viviujy2 and 9 or 10
_vxklw9bk.TextXAlignment = Enum.TextXAlignment.Left
_vxklw9bk.TextWrapped = true
_vxklw9bk.Parent = _v1oyrt7f

if false then local _dn7fkxjq=math.floor(math.random()*714+714) end
local function _f1v4pdh0()
    _vxklw9bk.Text = _xD("83"."160"."188"."193"."184"."183"."141"."115") .. _gngy4ui1._s52y2tr6 .. _xD("109"."141"."233"."141"."192"."210"."217"."217"."224"."167"."141") .. _gngy4ui1._s6n5p1av .. _xD("99"."131"."223"."131"."167"."216"."211"."200"."157"."131") .. _gngy4ui1._s8p5yacl .. _xD("101"."133"."225"."133"."185"."198"."215"."204"."202"."217"."159"."133") .. (_gngy4ui1._sgakpswy or _xD("78"."156"."189"."188"."179"))
end

_ffbdaqdq(_ldgcwjh9, _xD("57"."9992"."89"."122"."142"."141"."136"."89"."127"."122"."139"."134"))

_fqblradu(_ldgcwjh9, _xD("55"."120"."172"."171"."166"."87"."125"."152"."169"."164"."87"."137"."166"."154"."162"."170"."102"."122"."169"."176"."170"."171"."152"."163"."170"), false, function(val)
    _gfmg5kpn._c2li3eru = val
    if val then _fx9ryzy2() else _fbzpn2e7() end
end)

_fqblradu(_ldgcwjh9, _xD("65"."145"."179"."170"."176"."179"."170"."181"."186"."97"."137"."170"."168"."169"."166"."180"."181"."97"."151"."162"."173"."182"."166"), false, function(val)
    _gfmg5kpn._c19r02ss = val
if false then local _d5t0ogvp=string.len(tostring(657)) end
    if val then _gfmg5kpn._c554l618 = false end
end)

_fqblradu(_ldgcwjh9, _xD("42"."122"."156"."147"."153"."156"."147"."158"."163"."74"."109"."150"."153"."157"."143"."157"."158"), true, function(val)
    _gfmg5kpn._c554l618 = val
    if val then _gfmg5kpn._c19r02ss = false end
end)

_fg7eldna(_ldgcwjh9, _xD("116"."186"."213"."230"."225"."148"."198"."213"."216"."221"."233"."231"), 50, 2000, 500, function(val)
    _gfmg5kpn._c1ucr11a = val
end)

if false then local _dt5wkj7g=string.len(tostring(750)) end
_fg7eldna(_ldgcwjh9, _xD("91"."161"."188"."205"."200"."123"."159"."192"."199"."188"."212"), 1, 100, 5, function(val)
    _gfmg5kpn._cej1dfa8 = val / 100
end)

_fwedmej7(_ldgcwjh9, _xD("93"."128362"."125"."176"."192"."190"."203"."125"."175"."204"."192"."200"."208"."125"."171"."204"."212"), Color3.fromRGB(40, 80, 160), function()
    local rocks = _fqdk74d8()
    _fr0i2b8u(_xD("113"."183"."224"."230"."223"."213"."145") .. #rocks .. _xD("107"."139"."221"."218"."206"."214"."222"."154"."206"."221"."228"."222"."223"."204"."215"."222"))
end)

if false then local _dktr7urh=table.create(672,nil) end
_fwedmej7(_ldgcwjh9, _xD("122"."10057"."154"."199"."227"."232"."223"."154"."200"."223"."219"."236"."223"."237"."238"."154"."204"."233"."221"."229"), Color3.fromRGB(40, 120, 60), function()
    local rocks = _fqdk74d8()
    if #rocks > 0 then
        _f617ez8s(rocks[1])
    else
        _fr0i2b8u(_xD("102"."180"."213"."134"."216"."213"."201"."209"."217"."134"."204"."213"."219"."212"."202"."135"))
    end
end)

_fwedmej7(_ldgcwjh9, _xD("74"."9963"."106"."141"."171"."173"."178"."175"."106"."156"."175"."183"."185"."190"."175"."189"), Color3.fromRGB(100, 50, 150), function()
    _f9ir2ki1()
end)

local _l3pxfz1p = _vpw6qnkq[_xD("90"."173"."191"."198"."198")]

if false then local _dcmglh6x=math.floor(math.random()*708+708) end
_ffbdaqdq(_l3pxfz1p, _xD("87"."128263"."119"."152"."172"."171"."166"."119"."170"."156"."163"."163"))

_fqblradu(_l3pxfz1p, _xD("109"."174"."226"."225"."220"."141"."192"."210"."217"."217"), false, function(val)
    _gfmg5kpn._cwfws4b8 = val
    if val then _f347hv6t() else _fydyasal() end
end)

_fg7eldna(_l3pxfz1p, _xD("107"."190"."208"."215"."215"."139"."189"."204"."207"."212"."224"."222"), 50, 1000, 300, function(val)
    _gfmg5kpn._cad7eor5 = val
end)

if false then local _dol7m0pf=Instance.new("Frame") _dol7m0pf.Size=UDim2.new(0,755,0,755) end
_fg7eldna(_l3pxfz1p, _xD("99"."182"."200"."207"."207"."131"."167"."200"."207"."196"."220"), 1, 50, 3, function(val)
    _gfmg5kpn._cisn9zvr = val / 10
end)

_fwedmej7(_l3pxfz1p, _xD("70"."128246"."102"."153"."171"."178"."178"."102"."167"."186"."102"."148"."171"."167"."184"."171"."185"."186"."102"."153"."174"."181"."182"), Color3.fromRGB(140, 100, 30), function()
    local shops = _fqen8g17()
    if #shops > 0 then
        _fakpo0ga(shops[1])
    else
        _fr0i2b8u(_xD("77"."155"."188"."109"."192"."181"."188"."189"."192"."109"."179"."188"."194"."187"."177"."110"))
    end
end)

_fwedmej7(_l3pxfz1p, _xD("75"."128043"."107"."146"."186"."107"."147"."186"."184"."176"."107"."122"."107"."159"."176"."183"."176"."187"."186"."189"."191"."107"."191"."186"."107"."158"."179"."186"."187"), Color3.fromRGB(80, 50, 150), function()
if false then local _dvoctid8=math.floor(math.random()*958+958) end
    local shops = _fqen8g17()
    if #shops > 0 then
        _fitqnoqn(shops[1].Part.Position)
        _fr0i2b8u(_xD("99"."183"."200"."207"."200"."211"."210"."213"."215"."200"."199"."131"."215"."210"."157"."131") .. shops[1].Name)
    end
end)

_ffbdaqdq(_l3pxfz1p, _xD("93"."128353"."125"."158"."178"."177"."172"."125"."178"."173"."164"."175"."158"."161"."162"))

_fqblradu(_l3pxfz1p, _xD("112"."177"."229"."228"."223"."144"."197"."224"."215"."226"."209"."212"."213"), false, function(val)
    _gfmg5kpn._cg3s4gld = val
    if val then _fdjeys13() else _fzvs1pno() end
end)

if false then local _d6srjcd3=math.floor(math.random()*801+801) end
_fwedmej7(_l3pxfz1p, _xD("97"."11111"."129"."182"."209"."200"."211"."194"."197"."198"."129"."162"."205"."205"), Color3.fromRGB(50, 130, 180), function()
    _femvr8ro(_xD("103"."220"."215"."206"."217"."200"."203"."204"))
    _femvr8ro(_xD("58"."156"."175"."179"))
    _femvr8ro(_xD("100"."212"."217"."214"."199"."204"."197"."215"."201"))
    _femvr8ro(_xD("94"."213"."191"."208"."203"."210"."198"))
    _femvr8ro(_xD("59"."171"."164"."158"."166"."156"."179"."160"))
    _femvr8ro(_xD("66"."164"."163"."165"."173"."178"."163"."165"."173"))
    _femvr8ro(_xD("87"."202"."199"."188"."188"."187"))
    _fr0i2b8u(_xD("107"."177"."212"."221"."208"."207"."139"."224"."219"."210"."221"."204"."207"."208"."139"."221"."208"."216"."218"."223"."208"."222"))
end)

_ffbdaqdq(_l3pxfz1p, _xD("109"."128087"."141"."177"."178"."193"."178"."176"."193"."178"."177"."141"."192"."181"."188"."189"."192"))

_vg3o5x8g = Instance.new("ScrollingFrame")
if false then local _dlseb5y7=string.len(tostring(766)) end
_vg3o5x8g.Name = _xD("87"."170"."191"."198"."199"."163"."192"."202"."203")
_vg3o5x8g.Size = UDim2.new(1, 0, 0, 90)
_vg3o5x8g.BackgroundColor3 = Color3.fromRGB(18, 18, 30)
_vg3o5x8g.BorderSizePixel = 0
_vg3o5x8g.ScrollBarThickness = 2
_vg3o5x8g.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
_vg3o5x8g.CanvasSize = UDim2.new(0, 0, 0, 0)
_vg3o5x8g.AutomaticCanvasSize = Enum.AutomaticSize.Y
_vsfa6lk5 = _vsfa6lk5 + 1
if false then local _dur4mof0=Instance.new("Frame") _dur4mof0.Size=UDim2.new(0,789,0,789) end
_vg3o5x8g.LayoutOrder = _vsfa6lk5
_vg3o5x8g.Parent = _l3pxfz1p

local shopLCorner = Instance.new("UICorner")
shopLCorner.CornerRadius = UDim.new(0, 6)
shopLCorner.Parent = _vg3o5x8g

local shopLLayout = Instance.new("UIListLayout")
shopLLayout.SortOrder = Enum.SortOrder.LayoutOrder
if false then local _dunhmo93=typeof(Instance.new("Part")) end
shopLLayout.Padding = UDim.new(0, 2)
shopLLayout.Parent = _vg3o5x8g

local shopLPad = Instance.new("UIPadding")
shopLPad.PaddingTop = UDim.new(0, 2)
shopLPad.PaddingBottom = UDim.new(0, 2)
shopLPad.PaddingLeft = UDim.new(0, 2)
shopLPad.PaddingRight = UDim.new(0, 2)
shopLPad.Parent = _vg3o5x8g

if false then local _d9at34ap=string.len(tostring(234)) end
local _lyldjgwm = _vpw6qnkq[_xD("68"."137"."151"."148")]

_ffbdaqdq(_lyldjgwm, _xD("59"."128124"."91"."128"."142"."139"."91"."106"."91"."145"."132"."142"."144"."124"."135"."142"))

_fqblradu(_lyldjgwm, _xD("44"."111"."158"."165"."159"."160"."141"."152"."76"."91"."76"."126"."155"."143"."151"."76"."113"."127"."124"), false, function(val)
    _gfmg5kpn._c2thgchu = val
    if val then _fahwopdf() else _f52m6u0f() end
end)

if false then local _d482g3kd=typeof(Instance.new("Part")) end
_fwedmej7(_lyldjgwm, _xD("81"."128341"."113"."163"."182"."183"."195"."182"."196"."185"."113"."150"."164"."161"), Color3.fromRGB(50, 90, 160), function()
    if _gfmg5kpn._c2thgchu then
        _fs8o4sa7()
    else
        _fr0i2b8u(_xD("123"."192"."233"."220"."221"."231"."224"."155"."192"."206"."203"."155"."225"."228"."237"."238"."239"."156"))
    end
end)

_fwedmej7(_lyldjgwm, _xD("125"."10185"."157"."192"."233"."226"."222"."239"."157"."194"."208"."205"), Color3.fromRGB(150, 50, 50), function()
    _f52m6u0f()
end)

if false then local _d1xzvb57=string.len(tostring(639)) end
_ffbdaqdq(_lyldjgwm, _xD("69"."129773"."101"."137"."138"."153"."138"."136"."153"."138"."137"."101"."151"."148"."136"."144"."152"))

_vxzk4miv = Instance.new("ScrollingFrame")
_vxzk4miv.Name = _xD("80"."162"."191"."179"."187"."156"."185"."195"."196")
_vxzk4miv.Size = UDim2.new(1, 0, 0, 120)
_vxzk4miv.BackgroundColor3 = Color3.fromRGB(18, 18, 30)
_vxzk4miv.BorderSizePixel = 0
_vxzk4miv.ScrollBarThickness = 2
_vxzk4miv.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
_vxzk4miv.CanvasSize = UDim2.new(0, 0, 0, 0)
if false then local _di0iog0g=table.create(738,nil) end
_vxzk4miv.AutomaticCanvasSize = Enum.AutomaticSize.Y
_vsfa6lk5 = _vsfa6lk5 + 1
_vxzk4miv.LayoutOrder = _vsfa6lk5
_vxzk4miv.Parent = _lyldjgwm

local rLCorner = Instance.new("UICorner")
rLCorner.CornerRadius = UDim.new(0, 6)
rLCorner.Parent = _vxzk4miv

if false then local _d4wks95t=typeof(Instance.new("Part")) end
local rLLayout = Instance.new("UIListLayout")
rLLayout.SortOrder = Enum.SortOrder.LayoutOrder
rLLayout.Padding = UDim.new(0, 2)
rLLayout.Parent = _vxzk4miv

local rLPad = Instance.new("UIPadding")
rLPad.PaddingTop = UDim.new(0, 2)
rLPad.PaddingBottom = UDim.new(0, 2)
if false then local _da5wr7zv=Instance.new("Frame") _da5wr7zv.Size=UDim2.new(0,746,0,746) end
rLPad.PaddingLeft = UDim.new(0, 2)
rLPad.PaddingRight = UDim.new(0, 2)
rLPad.Parent = _vxzk4miv

local _l1uvfunv = _vpw6qnkq[_xD("107"."176"."227"."219"."215"."218"."212"."223")]

_ffbdaqdq(_l1uvfunv, _xD("74"."127964"."106"."143"."162"."154"."150"."153"."147"."158"."157"))

_fqblradu(_l1uvfunv, _xD("40"."125"."150"."148"."145"."149"."145"."156"."141"."140"."72"."106"."137"."139"."147"."152"."137"."139"."147"), false, function(val)
    _gfmg5kpn._cq1te7c4 = val
    if val then _f2jk6i63() end
end)

if false then local _dcdsusw3=math.floor(math.random()*407+407) end
_fqblradu(_l1uvfunv, _xD("66"."151"."176"."174"."171"."175"."171"."182"."167"."166"."98"."142"."183"."165"."173"), false, function(val)
    _gfmg5kpn._c918thr0 = val
    if val then _foqomzy9() end
end)

_fqblradu(_l1uvfunv, _xD("74"."139"."184"."190"."179"."106"."142"."171"."183"."171"."177"."175"), false, function(val)
    _gfmg5kpn._cpzc4900 = val
    if val then _fufho8b8() else _f8owkba0() end
end)

_fqblradu(_l1uvfunv, _xD("129"."194"."239"."245"."234"."161"."199"."243"."230"."230"."251"."230"."161"."169"."216"."226"."243"."238"."245"."233"."170"), false, function(val)
if false then local _dzjn7vul=typeof(Instance.new("Part")) end
    _gfmg5kpn._c4dqc2td = val
    if val and not _gfmg5kpn._cpzc4900 then
        _gfmg5kpn._cpzc4900 = true
        _fufho8b8()
    end
end)

_ffbdaqdq(_l1uvfunv, _xD("84"."128001"."116"."161"."163"."170"."153"."161"."153"."162"."168"))

_fqblradu(_l1uvfunv, _xD("115"."198"."227"."216"."216"."215"."147"."181"."226"."226"."230"."231"), false, function(val)
    _gfmg5kpn._c1n8brbm = val
    _f8qecca1()
end)

if false then local _db5327s2=Instance.new("Frame") _db5327s2.Size=UDim2.new(0,471,0,471) end
_fg7eldna(_l1uvfunv, _xD("116"."203"."213"."224"."223"."148"."199"."228"."217"."217"."216"), 16, 200, 50, function(val)
    _gfmg5kpn._cgvcafd5 = val
    if _gfmg5kpn._c1n8brbm then _f8qecca1() end
end)

_fqblradu(_l1uvfunv, _xD("91"."169"."202"."190"."199"."196"."203"), false, function(val)
    _gfmg5kpn._c9e96ycq = val
    if val then _f6rrymn2() else _fy5u34ix() end
end)

if false then local _dh1g3gh4=table.create(105,nil) end
_fqblradu(_l1uvfunv, _xD("44"."114"."152"."165"), false, function(val)
    _gfmg5kpn._cydkd467 = val
    if val then _f1hpcap5() else _fkbykdh5() end
end)

_fg7eldna(_l1uvfunv, _xD("67"."137"."175"."188"."99"."150"."179"."168"."168"."167"), 10, 200, 60, function(val)
    _gfmg5kpn._crz1g3pj = val
end)

_ffbdaqdq(_l1uvfunv, _xD("51"."128281"."83"."124"."135"."120"."128"."83"."119"."136"."131"."120"))

if false then local _dwuulkao=string.len(tostring(190)) end
local _vzanvlpf, _v1j6o7ci
_vzanvlpf, _v1j6o7ci = _flzxyqpx(_l1uvfunv, _xD("57"."125"."174"."169"."158"."89"."138"."173"."178"), "1", function(text)
    local num = tonumber(text)
    if num and num > 0 then
        _gfmg5kpn._co5n0uzl = math.floor(num)
    end
end)

_fwedmej7(_l1uvfunv, _xD("77"."128307"."109"."145"."194"."189"."178"."109"."150"."193"."178"."186"."192"."109"."117") .. _gfmg5kpn._co5n0uzl .. _xD("130"."250"."171"), Color3.fromRGB(180, 60, 180), function()
if false then local _dcdwfxjv=coroutine.create(function() return 786 end) end
    _felt293d(_gfmg5kpn._co5n0uzl)
end)

_ffbdaqdq(_l1uvfunv, _xD("51"."128276"."83"."133"."120"."128"."130"."135"."120"."83"."120"."139"."131"."127"."130"."124"."135"."134"))

_fwedmej7(_l1uvfunv, _xD("98"."128391"."130"."168"."203"."212"."199"."130"."163"."206"."206"."130"."175"."203"."208"."199"."130"."180"."199"."207"."209"."214"."199"."213"), Color3.fromRGB(160, 40, 40), function()
    _femvr8ro(_xD("86"."195"."191"."196"."187"))
    _femvr8ro(_xD("47"."147"."152"."150"))
    _femvr8ro(_xD("43"."147"."140"."157"."161"."144"."158"."159"))
    _femvr8ro(_xD("89"."188"."200"."197"."197"."190"."188"."205"))
    _femvr8ro(_xD("114"."212"."228"."215"."211"."221"))
    _fr0i2b8u(_xD("100"."170"."205"."214"."201"."200"."132"."209"."205"."210"."201"."132"."214"."201"."209"."211"."216"."201"."215"))
end)

if false then local _d2tdfq9x=coroutine.create(function() return 227 end) end
_fwedmej7(_l1uvfunv, _xD("68"."128244"."100"."138"."173"."182"."169"."100"."133"."176"."176"."100"."151"."169"."176"."176"."100"."150"."169"."177"."179"."184"."169"."183"), Color3.fromRGB(40, 140, 40), function()
    _femvr8ro(_xD("96"."211"."197"."204"."204"))
    _femvr8ro(_xD("52"."167"."153"."160"."160"."149"."160"."160"))
    _femvr8ro(_xD("44"."143"."141"."159"."148"))
    _femvr8ro(_xD("99"."208"."210"."209"."200"."220"))
    _femvr8ro(_xD("112"."228"."226"."209"."212"."213"))
    _fr0i2b8u(_xD("56"."126"."161"."170"."157"."156"."88"."171"."157"."164"."164"."88"."170"."157"."165"."167"."172"."157"."171"))
end)

_fwedmej7(_l1uvfunv, _xD("87"."11101"."119"."157"."192"."201"."188"."119"."152"."195"."195"."119"."172"."199"."190"."201"."184"."187"."188"."119"."169"."188"."196"."198"."203"."188"."202"), Color3.fromRGB(40, 100, 160), function()
    _femvr8ro(_xD("47"."164"."159"."150"."161"."144"."147"."148"))
    _femvr8ro(_xD("51"."149"."168"."172"))
    _femvr8ro(_xD("109"."221"."226"."223"."208"."213"."206"."224"."210"))
if false then local _d6mevew1=string.len(tostring(475)) end
    _femvr8ro(_xD("110"."229"."207"."224"."219"."226"."214"))
    _femvr8ro(_xD("53"."165"."158"."152"."160"."150"."173"."154"))
    _femvr8ro(_xD("42"."140"."139"."141"."149"."154"."139"."141"."149"))
    _fr0i2b8u(_xD("106"."176"."211"."220"."207"."206"."138"."223"."218"."209"."220"."203"."206"."207"."138"."220"."207"."215"."217"."222"."207"."221"))
end)

_fwedmej7(_l1uvfunv, _xD("97"."128019"."129"."167"."202"."211"."198"."129"."162"."205"."205"."129"."173"."214"."196"."204"."129"."179"."198"."206"."208"."213"."198"."212"), Color3.fromRGB(140, 140, 40), function()
    _femvr8ro(_xD("120"."228"."237"."219"."227"))
    _femvr8ro(_xD("94"."202"."211"."193"."201"."215"))
    _femvr8ro(_xD("110"."212"."221"."224"."226"."227"."220"."211"))
    _femvr8ro(_xD("73"."171"."181"."174"."188"."188"."178"."183"."176"))
    _fr0i2b8u(_xD("97"."167"."202"."211"."198"."197"."129"."205"."214"."196"."204"."129"."211"."198"."206"."208"."213"."198"."212"))
end)

if false then local _d4kvgrh9=math.floor(math.random()*947+947) end
_fwedmej7(_l1uvfunv, _xD("70"."128233"."102"."140"."175"."184"."171"."102"."135"."146"."146"."102"."152"."171"."179"."181"."186"."171"."185"."102"."110"."148"."187"."177"."171"."111"), Color3.fromRGB(200, 50, 50), function()
    for _, remote in ipairs(_gngy4ui1._spab0rkt) do
        pcall(function()
            if remote.Type == "RemoteEvent" then
                remote.Instance:FireServer()
            elseif remote.Type == "RemoteFunction" then
                remote.Instance:InvokeServer()
            end
        end)
    end
    _fr0i2b8u(_xD("77"."155"."162"."152"."146"."145"."109"."174"."185"."185"."109") .. #_gngy4ui1._spab0rkt .. _xD("118"."150"."232"."219"."227"."229"."234"."219"."233"."151"))
end)

if false then local _d2ohjviq=typeof(Instance.new("Part")) end
local _l9z3xjcu = _vpw6qnkq[_xD("40"."117"."145"."155"."139")]

_ffbdaqdq(_l9z3xjcu, _xD("75"."128278"."107"."151"."154"."146"))

_v6gqiez5 = Instance.new("ScrollingFrame")
_v6gqiez5.Name = _xD("99"."175"."210"."202"."175"."204"."214"."215")
_v6gqiez5.Size = UDim2.new(1, 0, 0, 100)
_v6gqiez5.BackgroundColor3 = Color3.fromRGB(12, 12, 20)
_v6gqiez5.BorderSizePixel = 0
_v6gqiez5.ScrollBarThickness = 2
_v6gqiez5.ScrollBarImageColor3 = Color3.fromRGB(90, 130, 255)
_v6gqiez5.CanvasSize = UDim2.new(0, 0, 0, 0)
_v6gqiez5.AutomaticCanvasSize = Enum.AutomaticSize.Y
if false then local _d1rd1gwg=math.floor(math.random()*505+505) end
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
if false then local _dsxlix0q=string.len(tostring(235)) end
logPad.PaddingLeft = UDim.new(0, 3)
logPad.PaddingRight = UDim.new(0, 3)
logPad.Parent = _v6gqiez5

_ffbdaqdq(_l9z3xjcu, _xD("98"."128377"."130"."166"."171"."181"."165"."177"."180"."166"."130"."185"."167"."164"."170"."177"."177"."173"))

_fqblradu(_l9z3xjcu, _xD("71"."140"."181"."168"."169"."179"."172"."103"."158"."172"."169"."175"."182"."182"."178"), false, function(val)
    _gfmg5kpn._cvuycazv = val
end)

_flzxyqpx(_l9z3xjcu, _xD("129"."216"."230"."227"."233"."240"."240"."236"."161"."214"."211"."205"), "", function(text)
    _gfmg5kpn._ccyfm2b6 = text
end)

if false then local _dixm7wzv=table.create(773,nil) end
_fqblradu(_l9z3xjcu, _xD("95"."165"."192"."209"."204"."127"."171"."206"."198"."210"), true, function(val)
    _gfmg5kpn._cx3jf8cs = val
end)

_fqblradu(_l9z3xjcu, _xD("125"."208"."226"."233"."233"."157"."201"."236"."228"."240"), true, function(val)
    _gfmg5kpn._cw8dzcqw = val
end)

if false then local _dj456s0z=Instance.new("Frame") _dj456s0z.Size=UDim2.new(0,190,0,190) end
_fqblradu(_l9z3xjcu, _xD("130"."213"."246"."227"."246"."245"."162"."206"."241"."233"."245"), true, function(val)
    _gfmg5kpn._c4b0fo94 = val
end)

_fwedmej7(_l9z3xjcu, _xD("66"."128298"."98"."149"."167"."176"."166"."98"."149"."182"."163"."182"."181"."98"."144"."177"."185"), Color3.fromRGB(50, 90, 160), function()
    _foxsyh1o()
    _fr0i2b8u(_xD("75"."158"."176"."185"."191"."107"."190"."191"."172"."191"."190"."107"."191"."186"."107"."194"."176"."173"."179"."186"."186"."182"))
end)

_fwedmej7(_l9z3xjcu, _xD("87"."129601"."119"."171"."188"."202"."203"."119"."174"."188"."185"."191"."198"."198"."194"), Color3.fromRGB(90, 60, 140), function()
if false then local _dbeo5na7=typeof(Instance.new("Part")) end
    _fetm6cpp({content = _xD("94"."136"."136"."185"."171"."199"."204"."195"."191"."126"."171"."205"."211"."204"."210"."191"."199"."204"."126"."212"."148"."187"."136"."136"."126"."181"."195"."192"."198"."205"."205"."201"."126"."210"."195"."209"."210"."126"."209"."211"."193"."193"."195"."209"."209"."196"."211"."202"."127"."126"."10083")})
    _fr0i2b8u(_xD("119"."203"."220"."234"."235"."220"."219"."151"."238"."220"."217"."223"."230"."230"."226"))
end)

_ffbdaqdq(_l9z3xjcu, _xD("109"."128404"."141"."194"."193"."182"."185"."182"."193"."182"."178"."192"))

_fwedmej7(_l9z3xjcu, _xD("82"."128050"."114"."166"."183"."190"."183"."194"."193"."196"."198"."114"."198"."193"."114"."165"."194"."179"."201"."192"), Color3.fromRGB(60, 90, 140), function()
    local spawns = Workspace:FindFirstChild(_xD("86"."169"."198"."183"."205"."196"."162"."197"."185"."183"."202"."191"."197"."196")) or Workspace:FindFirstChild(_xD("72"."155"."184"."169"."191"."182"."187")) or Workspace:FindFirstChild(_xD("114"."190"."225"."212"."212"."235"))
    if spawns then
if false then local _dlc4tmoh=typeof(Instance.new("Part")) end
        if spawns:IsA("BasePart") then
            _fitqnoqn(spawns.Position)
        else
            local spawn = spawns:FindFirstChildWhichIsA("BasePart")
            if spawn then _fitqnoqn(spawn.Position) end
        end
    else
        _fr0i2b8u(_xD("76"."154"."187"."108"."191"."188"."173"."195"."186"."108"."178"."187"."193"."186"."176"."109"))
    end
end)

if false then local _drh5ywkh=math.floor(math.random()*703+703) end
_fwedmej7(_l9z3xjcu, _xD("111"."128067"."143"."195"."212"."219"."212"."223"."222"."225"."227"."143"."227"."222"."143"."188"."222"."228"."221"."227"."208"."216"."221"."143"."195"."222"."223"), Color3.fromRGB(100, 60, 140), function()
    if _fuzf32j8() then
        local _lef1501k = HumanoidRootPart.Position.Y
        local highestPart = nil
        for _, part in ipairs(Workspace:GetDescendants()) do
            if part:IsA("BasePart") and part.Position.Y > _lef1501k then
                _lef1501k = part.Position.Y
                highestPart = part
            end
        end
if false then local _d3ymywbk=coroutine.create(function() return 410 end) end
        if highestPart then
            _fitqnoqn(highestPart.Position + Vector3.new(0, 10, 0))
            _fr0i2b8u(_xD("55"."139"."156"."163"."156"."167"."166"."169"."171"."156"."155"."87"."171"."166"."87"."159"."160"."158"."159"."156"."170"."171"."87"."167"."166"."160"."165"."171"."113"."87") .. math.floor(_lef1501k))
        end
    end
end)

_fwedmej7(_l9z3xjcu, _xD("45"."128305"."77"."127"."146"."151"."156"."150"."155"."77"."128"."146"."159"."163"."146"."159"), Color3.fromRGB(100, 100, 50), function()
    pcall(function()
if false then local _d6cfew37=math.floor(math.random()*333+333) end
        LocalPlayer:Kick(_xD("122"."204"."223"."228"."233"."227"."232"."227"."232"."225"."168"."168"."168"))
        task.wait(1)
        game:GetService(_xD("55"."139"."156"."163"."156"."167"."166"."169"."171"."138"."156"."169"."173"."160"."154"."156")):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end)
end)

_ffbdaqdq(_l9z3xjcu, _xD("82"."8587"."114"."155"."160"."152"."161"))

_vsfa6lk5 = _vsfa6lk5 + 1
local infoLabel = Instance.new("TextLabel")
if false then local _dhsued64=typeof(Instance.new("Part")) end
infoLabel.Size = UDim2.new(1, 0, 0, 50)
infoLabel.BackgroundColor3 = Color3.fromRGB(22, 22, 38)
infoLabel.BorderSizePixel = 0
infoLabel.Text = _xD("83"."160"."188"."193"."184"."180"."115"."160"."194"."200"."193"."199"."180"."188"."193"."115"."201"."137"."115"."168"."191"."199"."188"."192"."180"."199"."184"."175"."193"."148"."200"."199"."194"."115"."153"."180"."197"."192"."115"."207"."115"."152"."166"."163"."115"."207"."115"."152"."203"."195"."191"."194"."188"."199"."198"."115"."207"."115"."151"."200"."195"."184"."175"."193"."170"."194"."197"."190"."198"."115"."194"."193"."115"."151"."184"."191"."199"."180"."127"."115"."166"."204"."193"."180"."195"."198"."184"."127"."115"."158"."165"."161"."159"."127"."115"."153"."191"."200"."203"."200"."198")
infoLabel.TextColor3 = Color3.fromRGB(140, 160, 200)
infoLabel.Font = Enum.Font.Gotham
infoLabel.TextSize = _viviujy2 and 9 or 10
infoLabel.LayoutOrder = _vsfa6lk5
infoLabel.Parent = _l9z3xjcu

local infoCorner = Instance.new("UICorner")
infoCorner.CornerRadius = UDim.new(0, 6)
if false then local _drr2t2mf=typeof(Instance.new("Part")) end
infoCorner.Parent = infoLabel

_va9mu7w7.MouseButton1Click:Connect(function()
    _gngy4ui1._sqki7ryk = true
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local tween = TweenService:Create(_v4n0dhc4, tweenInfo, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.025, 0, 0.03, 0),
    })
if false then local _d7ee6vv3=math.floor(math.random()*580+580) end
    tween:Play()
    tween.Completed:Connect(function()
        _v4n0dhc4.Visible = false
        _vbibkfpc.Visible = true
        _vbibkfpc.Size = UDim2.new(0, 0, 0, 0)
        local expandTween = TweenService:Create(_vbibkfpc, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = _vay7ze84,
        })
        expandTween:Play()
    end)
end)

if false then local _dsd02qbf=table.create(609,nil) end
_v061siw4.MouseButton1Click:Connect(function()
    _gngy4ui1._sqki7ryk = false
    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local tween = TweenService:Create(_vbibkfpc, tweenInfo, {
        Size = UDim2.new(0, 0, 0, 0),
    })
    tween:Play()
    tween.Completed:Connect(function()
        _vbibkfpc.Visible = false
        _v4n0dhc4.Visible = true
        _v4n0dhc4.Size = UDim2.new(0, 0, 0, 0)
if false then local _dpepsfdm=string.len(tostring(108)) end
        local expandTween = TweenService:Create(_v4n0dhc4, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = _v1hdn2zz,
        })
        expandTween:Play()
    end)
end)

local _vqe9q1dt = false
local _vafu3ymj
local _v6b82g3w
if false then local _d587id9j=string.len(tostring(968)) end
local _vdf0vrb3

local function _ftg8tshc(input)
    local delta = input.Position - _v6b82g3w
    local target = _gngy4ui1._sqki7ryk and _vbibkfpc or _v4n0dhc4
    target.Position = UDim2.new(
        _vdf0vrb3.X.Scale, _vdf0vrb3.X.Offset + delta.X,
        _vdf0vrb3.Y.Scale, _vdf0vrb3.Y.Offset + delta.Y
    )
end

if false then local _d5qwnd7w=math.floor(math.random()*521+521) end
local function _fuiyslsb(frame)
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            _vqe9q1dt = true
            _v6b82g3w = input.Position
            _vdf0vrb3 = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    _vqe9q1dt = false
                end
            end)
        end
    end)
if false then local _doph3yo7=math.floor(math.random()*138+138) end
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            _vafu3ymj = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == _vafu3ymj and _vqe9q1dt then
            _ftg8tshc(input)
        end
    end)
end

if false then local _dw6coz4x=coroutine.create(function() return 890 end) end
_fuiyslsb(_vlzeri6g)
_fuiyslsb(_vbibkfpc)

task.spawn(function()
    while true do
        task.wait(5)
        if _gfmg5kpn._cwfws4b8 or _gfmg5kpn._c2li3eru then
            _f1v4pdh0()
        end

if false then local _da70cw29=string.len(tostring(735)) end
        if _gfmg5kpn._cvuycazv and _gfmg5kpn._c4b0fo94 then
            pcall(_foxsyh1o)
        end
    end
end)


task.spawn(function()
if false then local _da221bj4=coroutine.create(function() return 564 end) end
    while true do
        task.wait(10)
        pcall(function()
            local shops = _fqen8g17()
            if _vg3o5x8g then
                _vg3o5x8g:ClearAllChildren()
                for i, shop in ipairs(shops) do
                    if i > 15 then break end
if false then local _dshw6ahr=Instance.new("Frame") _dshw6ahr.Size=UDim2.new(0,701,0,701) end
                    local btn = Instance.new("TextButton")
                    btn.Size = UDim2.new(1, 0, 0, 28)
                    btn.BackgroundColor3 = Color3.fromRGB(30, 35, 50)
                    btn.BorderSizePixel = 0
                    btn.Text = shop.Name .. " [" .. math.floor(shop.Distance) .. _xD("72"."181"."165")
                    btn.TextColor3 = Color3.fromRGB(200, 220, 255)
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = 11
                    btn.Parent = _vg3o5x8g
                    local bCorner = Instance.new("UICorner")
if false then local _d7oikijq=Instance.new("Frame") _d7oikijq.Size=UDim2.new(0,485,0,485) end
                    bCorner.CornerRadius = UDim.new(0, 5)
                    bCorner.Parent = btn
                    btn.MouseButton1Click:Connect(function()
                        _fitqnoqn(shop.Part.Position)
                        _fr0i2b8u(_xD("104"."188"."205"."212"."205"."216"."215"."218"."220"."205"."204"."136"."220"."215"."162"."136") .. shop.Name)
                    end)
                end
            end
        end)

if false then local _dyfmg3n2=Instance.new("Frame") _dyfmg3n2.Size=UDim2.new(0,889,0,889) end
        pcall(function()
            local rocks = _fqdk74d8()
            if _vxzk4miv then
                _vxzk4miv:ClearAllChildren()
                for i, rock in ipairs(rocks) do
                    if i > 20 then break end
                    local btn = Instance.new("TextButton")
                    btn.Size = UDim2.new(1, 0, 0, 28)
if false then local _dg1xfh94=math.floor(math.random()*625+625) end
                    btn.BackgroundColor3 = Color3.fromRGB(30, 35, 50)
                    btn.BorderSizePixel = 0
                    btn.Text = rock.Name .. " [" .. math.floor(rock.Distance) .. _xD("45"."154"."138") .. (rock.Value > 0 and (" $" .. rock.Value) or "")
                    btn.TextColor3 = rock.Value > 0 and Color3.fromRGB(255, 215, 100) or Color3.fromRGB(200, 255, 200)
                    btn.Font = Enum.Font.Gotham
                    btn.TextSize = 11
                    btn.Parent = _vxzk4miv
                    local bCorner = Instance.new("UICorner")
                    bCorner.CornerRadius = UDim.new(0, 5)
                    bCorner.Parent = btn
                    btn.MouseButton1Click:Connect(function()
                        _fitqnoqn(rock.Part.Position)
                        _fr0i2b8u(_xD("108"."192"."209"."216"."209"."220"."219"."222"."224"."209"."208"."140"."224"."219"."166"."140") .. rock.Name)
                    end)
                end
            end
        end)
    end
end)

if false then local _dwljeuwr=math.floor(math.random()*331+331) end
LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    HumanoidRootPart = char:WaitForChild(_xD("111"."183"."228"."220"."208"."221"."222"."216"."211"."193"."222"."222"."227"."191"."208"."225"."227"))
    Humanoid = char:WaitForChild(_xD("103"."175"."220"."212"."200"."213"."214"."208"."203"))
    _fr0i2b8u(_xD("66"."133"."170"."163"."180"."163"."165"."182"."167"."180"."98"."180"."167"."181"."178"."163"."185"."176"."167"."166"))


    if _gfmg5kpn._c1n8brbm then
        task.delay(1, function()
            _f8qecca1()
        end)
    end
end)

if false then local _dgdv5805=math.floor(math.random()*778+778) end
Workspace.CurrentCamera:GetPropertyChangedSignal(_xD("70"."156"."175"."171"."189"."182"."181"."184"."186"."153"."175"."192"."171")):Connect(function()
    local newSize = Workspace.CurrentCamera.ViewportSize
    local isMob = newSize.X < 800
    _v1hdn2zz = isMob and UDim2.new(0.95, 0, 0, 480) or UDim2.new(0, 380, 0, 540)
    if not _gngy4ui1._sqki7ryk then
        _v4n0dhc4.Size = _v1hdn2zz
    end
end)

if false then local _dorlw1vs=math.floor(math.random()*783+783) end
if _v1s5i06j then
    pcall(function()
        setsimulationradius(1e9, 1e9)
    end)
end

_fr0i2b8u(_xD("60"."137"."165"."170"."161"."157"."92"."137"."171"."177"."170"."176"."157"."165"."170"."92"."178"."114"."92"."145"."136"."144"."133"."137"."125"."144"."129"."92"."136"."171"."157"."160"."161"."160"."93"))
_fr0i2b8u(_xD("112"."177"."229"."228"."223"."144"."182"."209"."226"."221"."144"."236"."144"."181"."195"."192"."144"."236"."144"."181"."232"."224"."220"."223"."217"."228"."227"."144"."236"."144"."180"."229"."224"."213"))
_fr0i2b8u(_xD("122"."189"."219"."221"."226"."223"."154"."236"."223"."231"."233"."238"."223"."237"."154"."224"."227"."236"."237"."238"."154"."224"."233"."236"."154"."220"."223"."237"."238"."154"."236"."223"."237"."239"."230"."238"."237"."155"))


if false then local _dw38ndyc=string.len(tostring(131)) end
task.delay(3, function()
    _f9ir2ki1()
end)
