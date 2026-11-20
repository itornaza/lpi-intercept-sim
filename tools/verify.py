#!/usr/bin/env python3
"""Replay every saved run in examples/ through the 2008 sources in GNU Octave and compare
each result with the values recorded in examples/expected/*.json.

Needs: python3, octave-cli, gnuplot.
Usage:  python3 tools/verify.py            # compare against examples/expected/
        python3 tools/verify.py --record   # (re)write examples/expected/ from a fresh run
"""
import json, os, re, subprocess, sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)

# Run name -> RNG seed. The PGi sweep uses no random numbers; the seed is recorded anyway.
RUNS = {"pgi-sweep": 2008, **{f"all-random-seed{s}": s for s in range(1, 6)}}
RESULT = re.compile(r"^RESULT (\w+) = (\S+)$")
PERCENT = re.compile(r"^The (LPI|Interceptor) wins ([\d.]+)%$")

def replay(name, seed):
    run = subprocess.run([os.path.join(ROOT, "run-example.sh"),
                          os.path.join(ROOT, "examples", name + ".txt"), str(seed)],
                         capture_output=True, text=True)
    out = {}
    for line in run.stdout.splitlines():
        line = line.strip()
        m = RESULT.match(line)
        if m:
            out[m.group(1)] = m.group(2)
        m = PERCENT.match(line)
        if m:
            out[m.group(1).lower() + "_wins_percent"] = m.group(2)
    return run.returncode, out

def path(name):
    return os.path.join(ROOT, "examples", "expected", name + ".json")

def main():
    record = "--record" in sys.argv
    total = bad = 0
    for name, seed in RUNS.items():
        rc, got = replay(name, seed)
        if record:
            with open(path(name), "w") as f:
                json.dump(got, f, indent=1, sort_keys=True); f.write("\n")
            print(f"{name}: recorded {len(got)} values (seed {seed})")
            continue
        with open(path(name)) as f:
            exp = json.load(f)
        n = 0
        if rc != 0 or set(exp) != set(got):
            bad += 1
            print(f"  {name}: run failed or different set of values")
        for k in sorted(exp):
            total += 1; n += 1
            if exp[k] != got.get(k):
                bad += 1
                print(f"  {name} {k}: expected {exp[k]} replay {got.get(k)}  MISMATCH")
        print(f"{name} (seed {seed}): {n} values compared")
    if not record:
        print(f"\n{total} values compared, {bad} problems")
        sys.exit(1 if bad else 0)

if __name__ == "__main__":
    main()
