--[[ Minea Mountain v7 | TrueSc3nt ]]
local url = "https://raw.githubusercontent.com/TrueSc3nt/utils/main/minea_clean_test_obf.lua"
local ok, err = pcall(function()
    local src = game:HttpGet(url, true)
    if not src or src == "" then
        error("Empty script from GitHub")
    end
    local fn = loadstring(src)
    if not fn then
        error("loadstring failed")
    end
    fn()
end)
if not ok then
    warn("[Minea Mountain] Failed to load:", err)
end
