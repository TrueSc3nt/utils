# utils

Utility scripts by **TrueSc3nt**

## Mine a Mountain v7

### For users (obfuscated — do not edit)
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/TrueSc3nt/utils/main/minea_clean_test_obf.lua", true))()
```
Or execute `minea_loader.lua`.

### For development (readable source — keep private)
- Edit `minea_clean_test.lua` locally
- Rebuild obfuscated build:
  ```bash
  python tools/obfuscate_lua.py minea_clean_test.lua minea_clean_test_obf.lua
  ```
- Push only `minea_clean_test_obf.lua` for public releases

### Protection
- Strings encoded at runtime (`_S` decoder)
- Symbol renaming + junk code
- No readable comments or section headers in public build
