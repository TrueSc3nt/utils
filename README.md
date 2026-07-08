# utils

Utility scripts by **TrueSc3nt**

## Mine a Mountain v7

### Load (clean source — no obfuscation)
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/TrueSc3nt/utils/main/minea_loader.lua"))()
```

Simpler alternative (skip the loader)
If you don't want to deal with two files, you can point Delta straight at the main script and skip the loader entirely:

loadstring(game:HttpGet("https://raw.githubusercontent.com/TrueSc3nt/utils/main/minea_clean_test.lua"))()
Then you only need to keep minea_clean_test.lua on GitHub. The only thing you lose is the loader's fancy on-screen "download failed" message — the script itself is identical.

### Mobile
- Tap the green **M** button on the right to open/close the GUI

### Files
- `minea_clean_test.lua` — main script (readable)
- `minea_loader.lua` — loader with error notifications
- `tools/obfuscate_lua.py` — obfuscator (optional, not used in public build right now)
