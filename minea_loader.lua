--[[ Minea Hub v7 Loader | TrueSc3nt ]]
local VERSION = "18"
local URL = "https://raw.githubusercontent.com/TrueSc3nt/utils/main/minea_clean_test.lua?v=" .. VERSION .. "&t=" .. tick()

local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()

local function notify(title, text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = 10,
        })
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

local function httpGet(url)
    local ok, body = pcall(function()
        return game:HttpGet(url, true)
    end)
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

local function isErrorPage(src)
    if not src then return true end
    if src:find("404: Not Found") then return true end
    if src:sub(1, 15) == "<!DOCTYPE html" then return true end
    if src:sub(1, 5) == "<html" then return true end
    if src:find("GitHub Pages") and #src < 500 then return true end
    if #src < 50 then return true end
    return false
end

local ok, err = pcall(function()
    notify("Minea Hub", "Downloading v7...")
    local src = httpGet(URL)
    if not src then
        error("Could not download script\nCheck: executor HTTP enabled, internet, GitHub status")
    end
    if isErrorPage(src) then
        error("Script not found on GitHub (got error page, " .. #src .. " bytes)")
    end
    local compile = loadstring or load
    if not compile then
        error("Executor has no loadstring/load support")
    end
    local fn, compileErr = compile(src)
    if not fn then
        error("Compile error: " .. tostring(compileErr))
    end
    fn()
end)

if not ok then
    warn("[Minea Hub] Load failed:", err)
    notify("Minea Hub Failed", tostring(err):sub(1, 180))
    pcall(function()
        local errGui = Instance.new("ScreenGui")
        errGui.Name = "MineaLoadError"
        errGui.ResetOnSpawn = false
        errGui.DisplayOrder = 9999
        errGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
        local errLabel = Instance.new("TextLabel")
        errLabel.Size = UDim2.new(0, 460, 0, 60)
        errLabel.Position = UDim2.new(0.5, 0, 0, 20)
        errLabel.AnchorPoint = Vector2.new(0.5, 0)
        errLabel.BackgroundColor3 = Color3.fromRGB(40, 10, 10)
        errLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
        errLabel.Font = Enum.Font.Code
        errLabel.TextSize = 11
        errLabel.TextWrapped = true
        errLabel.Text = "[Minea Hub] Load Failed:\n" .. tostring(err):sub(1, 300)
        errLabel.Parent = errGui
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = errLabel
        task.delay(20, function() errGui:Destroy() end)
    end)
end
