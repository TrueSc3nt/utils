#!/usr/bin/env python3
"""Lua obfuscator for Roblox executor scripts (string encode + symbol rename + junk)."""

import re
import random
import string
import sys
from pathlib import Path

RESERVED = {
    # Lua
    "and", "break", "do", "else", "elseif", "end", "false", "for", "function",
    "goto", "if", "in", "local", "nil", "not", "or", "repeat", "return",
    "then", "true", "until", "while", "continue",
    # Roblox / Luau globals
    "game", "workspace", "script", "Enum", "Instance", "Color3", "Vector3",
    "UDim", "UDim2", "CFrame", "TweenInfo", "Rect", "Region3", "BrickColor",
    "task", "coroutine", "typeof", "tick", "time", "wait", "delay", "spawn",
    "unpack", "table", "string", "math", "os", "bit32", "buffer",
    "pcall", "xpcall", "ipairs", "pairs", "next", "select", "type",
    "tostring", "tonumber", "error", "warn", "print", "assert",
    "loadstring", "require", "setmetatable", "getmetatable", "rawget", "rawset",
    "_G", "_VERSION", "self", "arg",
    # Decoder / wrapper names we inject
    "_S", "_J",
    # Executor APIs (must stay readable for detection)
    "getgenv", "gethui", "get_hidden_gui", "syn", "fluxus", "KRNL_LOADED",
    "delta", "identifyexecutor", "EXECUTOR_NAME", "hookmetamethod", "newcclosure",
    "newlclosure", "getnamecallmethod", "getcallmethod", "checkcaller",
    "fireclickdetector", "fireproximityprompt", "firetouchinterest",
    "clickdetector", "proximityprompt", "sethiddenproperty", "setsimulationradius",
    "getrawmetatable", "setreadonly", "getconnections", "cloneref",
    "writefile", "readfile", "isfile", "writefileasync", "setclipboard",
    "toclipboard", "loadcharacter", "request", "http", "protectgui",
    "HttpGet", "HttpService",
    # Names that collide with Roblox instance properties
    "LocalPlayer", "Character", "HumanoidRootPart", "Humanoid", "PlayerAdded",
    "CharacterAdded", "CharacterRemoving", "PlayerGui", "PlayerRemoving", "Backpack",
    "Parent", "Name", "Position", "CFrame", "Size", "Text", "Visible", "Value",
    "ClassName", "FireServer", "InvokeServer", "Connect", "WaitForChild",
    "FindFirstChild", "FindFirstChildOfClass", "FindFirstChildWhichIsA", "IsA",
    "GetChildren", "GetDescendants", "Destroy", "Health", "MaxHealth", "WalkSpeed",
    "JumpPower", "Enabled", "CurrentCamera", "ViewportSize", "JobId", "PlaceId",
}


def safe_rename_word(code: str, old: str, new: str) -> str:
    """Rename identifier but never after a dot (property access)."""
    if old == new or old in RESERVED:
        return code
    return re.sub(rf"(?<!\.){re.escape(old)}\b", new, code)

DECODER = (
    'local _S=function(s)local o=tonumber(s:match("^(%d+)%|"))local r=""'
    'for c in s:gmatch("(%d+)")do local n=tonumber(c)-o;if n>0 then r=r..string.char(n)end end;return r end\n'
)


def rand_name(prefix="_"):
    return prefix + "".join(random.choices(string.ascii_lowercase + string.digits, k=random.randint(8, 12)))


def encode_string(s: str) -> str:
    offset = random.randint(60, 130)
    body = "|".join(str(ord(c) + offset) for c in s)
    return f"{offset}|{body}"


def strip_comments(code: str) -> str:
    # Block comments
    code = re.sub(r"--\[\[[\s\S]*?\]\]", "", code)
    # Line comments (keep strings safe: crude but works if no -- inside strings on same line)
    lines = []
    for line in code.splitlines():
        out = []
        i = 0
        in_str = None
        while i < len(line):
            ch = line[i]
            if in_str:
                out.append(ch)
                if ch == "\\" and i + 1 < len(line):
                    i += 1
                    out.append(line[i])
                elif ch == in_str:
                    in_str = None
            elif ch in ("'", '"'):
                in_str = ch
                out.append(ch)
            elif ch == "-" and i + 1 < len(line) and line[i + 1] == "-":
                break
            else:
                out.append(ch)
            i += 1
        lines.append("".join(out).rstrip())
    return "\n".join(lines)


def collect_identifiers(code: str) -> set[str]:
    names = set()
    patterns = [
        r"\blocal\s+function\s+([A-Za-z_][A-Za-z0-9_]*)",
        r"\bfunction\s+([A-Za-z_][A-Za-z0-9_]*)\s*\(",
        r"\blocal\s+([A-Za-z_][A-Za-z0-9_]*)\s*=",
    ]
    for pat in patterns:
        for m in re.finditer(pat, code):
            names.add(m.group(1))
    return names


def encode_strings(code: str) -> str:
    def repl_double(m):
        inner = m.group(1)
        if len(inner) > 500:
            return m.group(0)
        return f'_S("{encode_string(inner)}")'

    def repl_single(m):
        inner = m.group(1)
        if len(inner) > 500:
            return m.group(0)
        return f'_S("{encode_string(inner)}")'

    code = re.sub(r'"((?:[^"\\]|\\.)*)"', repl_double, code)
    code = re.sub(r"'((?:[^'\\]|\\.)*)'", repl_single, code)
    return code


def rename_identifiers(code: str) -> str:
    ids = collect_identifiers(code)
    mapping = {}
    for name in sorted(ids, key=len, reverse=True):
        if name in RESERVED:
            continue
        if len(name) < 4:  # avoid breaking not/Wait/Text/etc.
            continue
        if name.startswith("_") and name in ("_S", "_J"):
            continue
        if re.match(r"^_[A-Za-z0-9]+$", name):
            continue
        mapping[name] = rand_name("_v")

    for old, new in sorted(mapping.items(), key=lambda x: len(x[0]), reverse=True):
        code = safe_rename_word(code, old, new)
    return code


def insert_junk(code: str, density: int = 40) -> str:
    lines = code.splitlines()
    out = []
    counter = 0
    for line in lines:
        out.append(line)
        counter += 1
        stripped = line.strip()
        if counter % density == 0 and stripped and not stripped.startswith("local _S"):
            j = rand_name("_j")
            out.append(f"if false then local {j}={random.randint(1,999)} end")
    return "\n".join(out)


def obfuscate(source: str) -> str:
    random.seed()
    code = strip_comments(source)
    # Remove banner / section divider noise lines
    code = re.sub(r"^--\s*=+\s*.*?\s*=+\s*$", "", code, flags=re.MULTILINE)
    code = re.sub(r"\n{3,}", "\n\n", code)

    code = rename_identifiers(code)
    code = encode_strings(code)
    code = insert_junk(code)

    header = (
        "--[[ protected build | TrueSc3nt | do not redistribute source ]]\n"
        + DECODER
        + f"if false then local {rand_name('_j')}={random.randint(1,999)} end\n"
    )
    return header + code.strip() + "\n"


def main():
    src = Path(sys.argv[1]) if len(sys.argv) > 1 else Path("../minea_clean_test.lua")
    dst = Path(sys.argv[2]) if len(sys.argv) > 2 else Path("../minea_clean_test_obf.lua")
    text = src.read_text(encoding="utf-8")
    out = obfuscate(text)
    dst.write_text(out, encoding="utf-8")
    print(f"Obfuscated {src} -> {dst} ({len(out)} bytes)")


if __name__ == "__main__":
    main()
