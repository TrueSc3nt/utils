--[[ Minea Hub v7 Loader | TrueSc3nt
     Robust loader: downloads from multiple CDNs, retries, and REFUSES to run
     an incomplete/stale copy. Incomplete downloads were the real cause of the
     random "attempt to call a nil value" errors. ]]

local VERSION = "22"
local REPO = "TrueSc3nt/utils"
local BRANCH = "main"
local FILE = "minea_clean_test.lua"
local SENTINEL = "--[[MINEA_EOF]]"   -- must exist near the end of the main script
local MIN_BYTES = 20000              -- the real script is >100KB; reject tiny bodies

local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()

local function notify(title, text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = 8,
        })
    end)
end

-- Simple on-screen banner (SetCore notifications don't always show on mobile)
local function banner(text, color)
    pcall(function()
        local gui = Instance.new("ScreenGui")
        gui.Name = "MineaLoaderBanner"
        gui.ResetOnSpawn = false
        gui.DisplayOrder = 9999
        gui.IgnoreGuiInset = true
        gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(0, 320, 0, 44)
        lbl.Position = UDim2.new(0.5, 0, 0, 14)
        lbl.AnchorPoint = Vector2.new(0.5, 0)
        lbl.BackgroundColor3 = color or Color3.fromRGB(18, 18, 22)
        lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
        lbl.Font = Enum.Font.GothamBold
        lbl.TextSize = 13
        lbl.TextWrapped = true
        lbl.Text = text
        lbl.Parent = gui
        local c = Instance.new("UICorner")
        c.CornerRadius = UDim.new(0, 8)
        c.Parent = lbl
        task.delay(6, function() pcall(function() gui:Destroy() end) end)
    end)
end

local function first(...)
    for i = 1, select("#", ...) do
        local v = select(i, ...)
        if v ~= nil then return v end
    end
end

local genv = getgenv and getgenv() or _G
local httpRequest = first(
    syn and syn.request,
    http and http.request,
    request,
    fluxus and fluxus.request,
    genv.request,
    genv.http_request
)

local function rawGet(url)
    local ok, body = pcall(function() return game:HttpGet(url, true) end)
    if ok and type(body) == "string" and body ~= "" then
        return body
    end
    if httpRequest then
        local ok2, res = pcall(function()
            return httpRequest({ Url = url, Method = "GET" })
        end)
        if ok2 and type(res) == "table" then
            local b = res.Body or res.body or res.BodyText
            if type(b) == "string" and b ~= "" then
                return b
            end
        end
    end
    return nil
end

-- A body is only accepted if it is large enough AND contains the end marker,
-- which guarantees we downloaded the complete file (not a stale/partial copy).
local function isComplete(src)
    if type(src) ~= "string" then return false end
    if #src < MIN_BYTES then return false end
    if src:find("404: Not Found", 1, true) then return false end
    if src:sub(1, 15) == "<!DOCTYPE html" then return false end
    if not src:find(SENTINEL, 1, true) then return false end
    return true
end

local function cacheBuster()
    return tostring(tick()):gsub("%.", "") .. tostring(math.random(100000, 999999))
end

-- Multiple sources so one bad/stale CDN edge doesn't break the launch.
local function candidateUrls()
    local b = cacheBuster()
    return {
        "https://raw.githubusercontent.com/" .. REPO .. "/" .. BRANCH .. "/" .. FILE .. "?v=" .. VERSION .. "&t=" .. b,
        "https://cdn.jsdelivr.net/gh/" .. REPO .. "@" .. BRANCH .. "/" .. FILE .. "?t=" .. b,
        "https://raw.githack.com/" .. REPO .. "/" .. BRANCH .. "/" .. FILE .. "?t=" .. b,
    }
end

local function download()
    for attempt = 1, 5 do
        for _, url in ipairs(candidateUrls()) do
            local src = rawGet(url)
            if isComplete(src) then
                return src
            end
        end
        task.wait(1.2)
    end
    return nil
end

-- ================= RUN =================
notify("Minea Hub", "Downloading v7...")
banner("Minea Hub - downloading...", Color3.fromRGB(20, 90, 50))

local src = download()
if not src then
    notify("Minea Hub Failed", "Could not download a complete copy (stale cache / no HTTP). Fully close Roblox, wait 1 min, try again.")
    banner("Minea Hub: download failed. Close app fully, wait 1 min, retry.", Color3.fromRGB(120, 30, 30))
    return
end

local compile = loadstring or load
if not compile then
    notify("Minea Hub Failed", "This executor has no loadstring/load support.")
    banner("Minea Hub: executor unsupported (no loadstring).", Color3.fromRGB(120, 30, 30))
    return
end

local fn, compileErr = compile(src)
if not fn then
    notify("Minea Hub Failed", "Compile error: " .. tostring(compileErr):sub(1, 150))
    banner("Minea Hub: compile error.", Color3.fromRGB(120, 30, 30))
    return
end

local ok, err = pcall(fn)
if not ok then
    warn("[Minea Hub] runtime error:", err)
    notify("Minea Hub Failed", tostring(err):sub(1, 180))
    banner("Minea Hub error: " .. tostring(err):sub(1, 120), Color3.fromRGB(120, 30, 30))
end
