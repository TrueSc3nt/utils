--[[ Minea Hub v7 Loader | TrueSc3nt ]]
local VERSION = "9"
local URL = "https://raw.githubusercontent.com/TrueSc3nt/utils/main/minea_clean_test_obf.lua?v=" .. VERSION

local StarterGui = game:GetService("StarterGui")

local function notify(title, text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = 10,
        })
    end)
end

local function httpGet(url)
    local ok, body = pcall(function()
        return game:HttpGet(url, true)
    end)
    if ok and type(body) == "string" and body ~= "" then
        return body
    end
    if syn and syn.request then
        local res = syn.request({ Url = url, Method = "GET" })
        if res and type(res.Body) == "string" and res.Body ~= "" then
            return res.Body
        end
    end
    if request then
        local res = request({ Url = url, Method = "GET" })
        if res then
            local b = res.Body or res.body
            if type(b) == "string" and b ~= "" then
                return b
            end
        end
    end
    return nil
end

local ok, err = pcall(function()
    notify("Minea Hub", "Downloading v7...")
    local src = httpGet(URL)
    if not src then
        error("Could not download script (check executor HTTP / GitHub)")
    end
    if src:find("404: Not Found") or src:sub(1, 15) == "<!DOCTYPE html" then
        error("Script not found on GitHub")
    end
    local fn = loadstring(src)
    if not fn then
        error("Script failed to compile")
    end
    fn()
end)

if not ok then
    warn("[Minea Hub] Load failed:", err)
    notify("Minea Hub Failed", tostring(err):sub(1, 180))
end
