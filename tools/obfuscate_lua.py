#!/usr/bin/env python3
"""Lua obfuscator — string encoding only (safe for Roblox executors)."""

import re
import random
import string
import sys
from pathlib import Path

# Never rename these; also block rename if name is substring of any (case-insensitive)
PROTECTED_GLOBALS = [
    "getgenv", "gethui", "get_hidden_gui", "getnamecallmethod", "getcallmethod",
    "hookmetamethod", "fireproximityprompt", "fireclickdetector", "firetouchinterest",
    "sethiddenproperty", "setsimulationradius", "getrawmetatable", "setreadonly",
    "getconnections", "cloneref", "writefile", "readfile", "writefileasync",
    "setclipboard", "toclipboard", "loadcharacter", "identifyexecutor", "newcclosure",
    "newlclosure", "checkcaller", "protectgui", "clickdetector", "proximityprompt",
    "HttpService", "game", "Instance", "Enum", "task", "typeof", "tick",
]

DECODER = (
    'local _S=function(s)local o=tonumber(s:match("^(%d+)%|"))local r=""'
    'for c in s:gmatch("(%d+)")do local n=tonumber(c)-o;if n>0 then r=r..string.char(n)end end;return r end\n'
)


def rand_name(prefix="_j"):
    return prefix + "".join(random.choices(string.ascii_lowercase + string.digits, k=8))


def encode_string(s: str) -> str:
    offset = random.randint(60, 130)
    body = "|".join(str(ord(c) + offset) for c in s)
    return f"{offset}|{body}"


def strip_comments(code: str) -> str:
    code = re.sub(r"--\[\[[\s\S]*?\]\]", "", code)
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


def can_rename(name: str) -> bool:
    if len(name) < 6:
        return False
    lower = name.lower()
    for g in PROTECTED_GLOBALS:
        if lower in g.lower() or g.lower() in lower:
            return False
    # Config/State table field names must stay (accessed as Config.X)
    return True


def collect_rename_candidates(code: str) -> set[str]:
    names = set()
    for pat in [
        r"\blocal\s+function\s+([A-Za-z_][A-Za-z0-9_]*)",
        r"\blocal\s+([A-Za-z_][A-Za-z0-9_]*)\s*=",
    ]:
        for m in re.finditer(pat, code):
            names.add(m.group(1))
    return {n for n in names if can_rename(n)}


def safe_rename(code: str, old: str, new: str) -> str:
    # Only rename whole identifiers, never after dot, never inside larger words
    return re.sub(rf"(?<![.\w]){re.escape(old)}(?![\w])", new, code)


def rename_locals(code: str) -> str:
    mapping = {}
    for name in sorted(collect_rename_candidates(code), key=len, reverse=True):
        mapping[name] = "_v" + "".join(random.choices(string.ascii_lowercase + string.digits, k=10))
    for old, new in sorted(mapping.items(), key=lambda x: len(x[0]), reverse=True):
        code = safe_rename(code, old, new)
    return code


def encode_strings(code: str) -> str:
    def enc(m):
        inner = m.group(1)
        if len(inner) > 800:
            return m.group(0)
        return f'_S("{encode_string(inner)}")'

    code = re.sub(r'"((?:[^"\\]|\\.)*)"', enc, code)
    code = re.sub(r"'((?:[^'\\]|\\.)*)'", enc, code)
    return code


def insert_junk(code: str) -> str:
    """Insert junk only after standalone `end` at brace depth 0."""
    lines = code.splitlines()
    out = []
    depth = 0
    n = 0
    for line in lines:
        stripped = line.strip()
        # track table/function depth roughly
        if stripped.startswith("local ") and "= {" in stripped:
            depth += 1
        if stripped == "}" or (stripped.startswith("}") and stripped.endswith("}")):
            depth = max(0, depth - stripped.count("}"))
        out.append(line)
        if depth == 0 and re.match(r"^end\b", stripped):
            n += 1
            if n % 55 == 0:
                out.append(f"if false then local {rand_name()}=0 end")
    return "\n".join(out)


def obfuscate(source: str) -> str:
    random.seed()
    code = strip_comments(source)
    code = re.sub(r"^--\s*=+.*=+\s*$", "", code, flags=re.MULTILINE)
    code = re.sub(r"\n{3,}", "\n\n", code)
    # Strings first so literals are safe; then rename locals only
    code = encode_strings(code)
    code = rename_locals(code)
    code = insert_junk(code)
    header = (
        "--[[ Minea v7 protected | TrueSc3nt ]]\n"
        + DECODER
        + f"if false then local {rand_name()}=0 end\n"
    )
    return header + code.strip() + "\n"


def main():
    src = Path(sys.argv[1]) if len(sys.argv) > 1 else Path("minea_clean_test.lua")
    dst = Path(sys.argv[2]) if len(sys.argv) > 2 else Path("minea_clean_test_obf.lua")
    out = obfuscate(src.read_text(encoding="utf-8"))
    dst.write_text(out, encoding="utf-8")
    print(f"OK {src.name} -> {dst.name} ({len(out)} bytes)")


if __name__ == "__main__":
    main()
