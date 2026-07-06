#!/usr/bin/env python3
import sys
from pathlib import Path

try:
    import lupa
except ImportError:
    print("SKIP: lupa not installed")
    sys.exit(0)

src = Path(sys.argv[1]).read_text(encoding="utf-8")
lua = lupa.LuaRuntime()
loader = lua.eval("function(s) local f,e=loadstring(s); if f then return true end; return false,e end")
ok, err = loader(src)
if ok:
    print("OK: compiles")
else:
    print("FAIL:", err)
    sys.exit(1)
