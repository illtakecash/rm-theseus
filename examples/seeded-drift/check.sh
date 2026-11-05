#!/usr/bin/env sh
# Offline structural check for the v0 skill and seeded-drift fixture. No network, no API keys.
# Usage: sh examples/seeded-drift/check.sh [finding.md]   (default: EXPECTED.md)
set -e
here=$(dirname "$0"); root="$here/../.."; f=${1:-$here/EXPECTED.md}; fail=0
need() { grep -q -- "$2" "$1" || { echo "FAIL: $1 missing: $2"; fail=1; }; }
s="$root/skills/drift-check/SKILL.md"
for k in "^name: drift-check" "^description:" "## Triggers" "## Procedure" "Alternate-path challenge" "## Output format" "Optional reviewer CLI contract" "never runs it"; do need "$s" "$k"; done
for k in "Verdict: drift" "D1 (2026-10-01)" "D3 (2026-10-08)" "Alternate path:" "Correction:" "Next trigger:" "step 3"; do need "$f" "$k"; done
[ $fail -eq 0 ] && echo "PASS: skill structure and seeded-drift finding OK" || exit 1
