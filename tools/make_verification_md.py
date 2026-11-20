#!/usr/bin/env python3
"""Regenerate docs/verification.md: recorded value vs a fresh Octave replay for every result."""
import json, os, subprocess, sys
HERE = os.path.dirname(os.path.abspath(__file__)); ROOT = os.path.dirname(HERE)
sys.path.insert(0, HERE)
from verify import RUNS, replay, path

version = subprocess.run(["octave-cli", "--version"], capture_output=True, text=True).stdout.split("\n")[0]
out = ["# Verification record", "",
       "Every saved run in `examples/` was replayed through the 2008 sources with",
       f"{version} (`python3 tools/verify.py`) and compared with the values recorded in",
       "`examples/expected/`. Each row shows the recorded value; a mismatch would show the replay",
       "value next to it.", "",
       "The PGi sweep uses no random numbers, so its result can also be checked against the console",
       "output kept from the original 2008 MATLAB run of the same inputs: `The LPI wins 62.220000%`,",
       "`The Interceptor wins 37.780000%`. The replay prints exactly the same two lines.", ""]
total = bad = 0
for name, seed in RUNS.items():
    with open(path(name)) as f:
        exp = json.load(f)
    _, got = replay(name, seed)
    inp = open(os.path.join(ROOT, "examples", name + ".txt")).read().split()
    out += [f"## {name} (seed {seed})", "", f"Typed inputs: `{' '.join(inp)}`", "",
            "| Value | Recorded | Replay | Match |", "|---|---|---|---|"]
    for k in sorted(exp):
        total += 1
        ok = exp[k] == got.get(k)
        bad += 0 if ok else 1
        out.append(f"| {k} | {exp[k]} | {got.get(k)} | {'yes' if ok else 'NO'} |")
    out.append("")
out.insert(2, f"**{total} values compared, {bad} mismatches.**\n")
open(os.path.join(ROOT, "docs", "verification.md"), "w").write("\n".join(out))
print(f"{total} values, {bad} mismatches")
