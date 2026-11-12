#!/usr/bin/env sh
# Build throwaway git repos for an author rerun of drift-check scenarios B-E.
# Does not judge drift. Prints each repo path and its git log.
# Usage: sh examples/ledger-app/scenarios.sh [parent-dir]
set -e
here=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
parent=${1:-${TMPDIR:-/tmp}/drift-check-trial}
rm -rf "$parent"
mkdir -p "$parent"

git_init() {
  git -C "$1" init -q
  git -C "$1" config user.email "drift-check@example.invalid"
  git -C "$1" config user.name "drift-check scenarios"
}

commit_all() {
  git -C "$1" add -A
  git -C "$1" commit -q -m "$2"
}

# B starts from the committed ledger-app, then history is rebuilt forward.
src="$here"
b="$parent/B-planted-drift"
mkdir -p "$b/ledger"
cp "$src/PURPOSE.md" "$src/DECISIONS.md" "$b/"
cp "$src/ledger/__init__.py" "$src/ledger/csv_store.py" "$b/ledger/"
cat > "$b/ledger/cli.py" <<'PY'
import sys
from ledger.csv_store import append_entry

def main(argv):
    cmd = argv[1] if len(argv) > 1 else ""
    if cmd == "add":
        return append_entry("entries.csv", argv[2], argv[3], argv[4])
    raise SystemExit("usage: add")

if __name__ == "__main__":
    main(sys.argv)
PY
git_init "$b"
commit_all "$b" "add command appends rows to entries.csv"

cp "$src/ledger/totals.py" "$b/ledger/"
cat > "$b/ledger/cli.py" <<'PY'
import sys
from ledger.csv_store import append_entry, read_all
from ledger.totals import weekly_totals, write_export

def week_command(csv_path, export_path=None):
    totals = weekly_totals(read_all(csv_path))
    if export_path:
        write_export(export_path, totals)
    return totals

def main(argv):
    cmd = argv[1] if len(argv) > 1 else ""
    if cmd == "add":
        return append_entry("entries.csv", argv[2], argv[3], argv[4])
    if cmd == "week":
        export_path = None
        if len(argv) > 3 and argv[2] == "--csv":
            export_path = argv[3]
        return week_command("entries.csv", export_path)
    raise SystemExit("usage: add | week [--csv <file>]")

if __name__ == "__main__":
    main(sys.argv)
PY
commit_all "$b" "week command sums hours from entries.csv"

cp "$src/ledger/postgres_totals.py" "$src/ledger/sync_server.py" "$src/ledger/cli.py" "$b/ledger/"
commit_all "$b" "sync command serves totals from a stored weekly_totals table"

# C: clean change on the pre-sync tree. The new commit only adds a --plain flag.
c="$parent/C-clean-change"
mkdir -p "$c"
git clone -q "$b" "$c"
git_init "$c"
git -C "$c" reset -q --hard HEAD~1
cat > "$c/ledger/cli.py" <<'PY'
import sys
from ledger.csv_store import append_entry, read_all
from ledger.totals import weekly_totals, write_export

def week_command(csv_path, export_path=None):
    totals = weekly_totals(read_all(csv_path))
    if export_path:
        write_export(export_path, totals)
    return totals

def main(argv):
    cmd = argv[1] if len(argv) > 1 else ""
    if cmd == "add":
        return append_entry("entries.csv", argv[2], argv[3], argv[4])
    if cmd == "week":
        export_path = None
        if len(argv) > 3 and argv[2] == "--csv":
            export_path = argv[3]
        totals = week_command("entries.csv", export_path)
        if "--plain" in argv:
            print(" ".join(f"{week}={hours}" for week, hours in sorted(totals.items())))
        return totals
    raise SystemExit("usage: add | week [--csv <file>] [--plain]")

if __name__ == "__main__":
    main(sys.argv)
PY
commit_all "$c" "week --plain prints the on-read totals"

# D: the owner amendment and D4 land before the sync commit. End-state code matches B.
d="$parent/D-approved-decision"
mkdir -p "$d"
git clone -q "$b" "$d"
git_init "$d"
git -C "$d" reset -q --hard HEAD~1
cat > "$d/PURPOSE.md" <<'MD'
# Purpose
Objective: A single-user CLI that records time entries to a local CSV file and prints weekly totals.
Objective amended 2026-10-16 (owner, see D4): also serve those entries to one local phone client.
Non-goals:
- No accounts.
- No public network.
MD
cat > "$d/DECISIONS.md" <<'MD'
- D1 2026-10-01: Store entries in one local CSV file. Why: portable, diffable, no setup. Supersedes: none
- D2 2026-10-03: Python standard library only. Why: zero install. Supersedes: none
- D3 2026-10-08: Weekly totals computed on read, never stored. Why: one source of truth. Supersedes: none
- D4 2026-10-16: Allow one local sync process, a Flask dependency, and a weekly_totals table for the phone client. Entry rows stay in the CSV. Non-goals drop "no server" and "no database"; accounts and any public network stay forbidden. Why: the owner amended the objective on this date to include that client. Supersedes: D2, D3
MD
commit_all "$d" "record D4 and the owner objective amendment"
cp "$src/ledger/postgres_totals.py" "$src/ledger/sync_server.py" "$src/ledger/cli.py" "$d/ledger/"
commit_all "$d" "sync command serves the local phone client named in D4"

# E: implementation present, purpose files absent.
e="$parent/E-missing-state"
mkdir -p "$e"
git clone -q "$b" "$e"
git_init "$e"
rm -f "$e/PURPOSE.md" "$e/DECISIONS.md"
commit_all "$e" "drop PURPOSE.md and DECISIONS.md"

# F: large tree (two service dirs, more than 40 source files) with purpose files and no CodeGraph index.
f="$parent/F-large-no-codegraph"
mkdir -p "$f/services/api" "$f/services/worker"
cat > "$f/PURPOSE.md" <<'MD'
# Purpose
Objective: Two local batch workers that rewrite nothing and open no sockets.
Non-goals:
- No network service.
MD
cat > "$f/DECISIONS.md" <<'MD'
- D1 2026-11-01: Keep each worker a single pure function. Why: nothing to deploy. Supersedes: none
MD
n=1
while [ "$n" -le 45 ]; do
  dir="$f/services/api"
  [ "$n" -gt 22 ] && dir="$f/services/worker"
  printf 'def step_%s(value):\n    return value\n' "$n" > "$dir/step_$n.py"
  n=$((n + 1))
done
git_init "$f"
commit_all "$f" "add api and worker steps"

echo "PARENT $parent"
for repo in "$b" "$c" "$d" "$e" "$f"; do
  echo "---- $(basename "$repo") ----"
  git -C "$repo" log --oneline
  echo "source files: $(find "$repo" -name '*.py' | wc -l | tr -d ' ')"
done
