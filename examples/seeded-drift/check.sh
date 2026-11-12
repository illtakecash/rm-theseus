#!/usr/bin/env sh
# Offline structural check for the v0 skill and seeded-drift fixture. No network, no API keys.
# Usage: sh examples/seeded-drift/check.sh [finding.md]   (default: EXPECTED.md)
# Finds SKILL.md at the in-repo skills/ path or a normal client install path.
set -e
here=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
root=$(CDPATH= cd -- "$here/../.." && pwd)
f=${1:-$here/EXPECTED.md}
fail=0
need() { grep -q -- "$2" "$1" || { echo "FAIL: $1 missing: $2"; fail=1; }; }

# First existing file wins. In-repo skills/ beats a copied install so the
# canonical copy is what the self-test grades when both are present.
resolve_skill() {
  base=$1
  rel=
  for rel in \
    skills/drift-check/SKILL.md \
    .cursor/skills/drift-check/SKILL.md \
    .codex/skills/drift-check/SKILL.md \
    .agents/skills/drift-check/SKILL.md
  do
    if [ -f "$base/$rel" ]; then
      printf '%s\n' "$base/$rel"
      return 0
    fi
  done
  if [ -n "${HOME:-}" ]; then
    for rel in \
      "$HOME/.cursor/skills/drift-check/SKILL.md" \
      "$HOME/.codex/skills/drift-check/SKILL.md"
    do
      if [ -f "$rel" ]; then
        printf '%s\n' "$rel"
        return 0
      fi
    done
  fi
  return 1
}

s=$(resolve_skill "$root") || { echo "FAIL: SKILL.md not found under skills/, .cursor/skills/, .codex/skills/, or .agents/skills/"; exit 1; }
echo "SKILL: $s"

for k in \
  "^name: drift-check" "^description:" "## Triggers" "## Procedure" \
  "Alternate-path challenge" "## Output format" "Optional reviewer CLI contract" "never runs it" \
  "codegraph_explore" "@colbymchenry/codegraph" "projectPath" "R6" \
  "Supersedes: D2, D3" "derived" "Why it is not drift" "What is missing" \
  "not new structure" "continue with your usual tools" '"initialized": false'
do
  need "$s" "$k"
done

for k in \
  "Verdict: drift" "D1 (2026-10-01)" "D3 (2026-10-08)" \
  "Alternate path:" "Correction:" "Next trigger:" "step 3" \
  "derived" "Why it is drift"
do
  need "$f" "$k"
done

# Install-path discovery. Temporary trees, not the repo.
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
mkdir -p "$tmp/cursor-only/.cursor/skills/drift-check" \
  "$tmp/codex-only/.codex/skills/drift-check" \
  "$tmp/agents-only/.agents/skills/drift-check" \
  "$tmp/prefer/skills/drift-check" \
  "$tmp/prefer/.cursor/skills/drift-check"
cp "$s" "$tmp/cursor-only/.cursor/skills/drift-check/SKILL.md"
cp "$s" "$tmp/codex-only/.codex/skills/drift-check/SKILL.md"
cp "$s" "$tmp/agents-only/.agents/skills/drift-check/SKILL.md"
printf '%s\n' 'canonical' > "$tmp/prefer/skills/drift-check/SKILL.md"
printf '%s\n' 'copied' > "$tmp/prefer/.cursor/skills/drift-check/SKILL.md"

expect_path() {
  got=$(resolve_skill "$1") || { echo "FAIL: no SKILL.md under $1"; fail=1; return; }
  case "$got" in
    "$2") echo "PASS: $(basename "$1") -> $2" ;;
    *) echo "FAIL: $1 resolved to $got, want $2"; fail=1 ;;
  esac
}
expect_path "$tmp/cursor-only" "$tmp/cursor-only/.cursor/skills/drift-check/SKILL.md"
expect_path "$tmp/codex-only" "$tmp/codex-only/.codex/skills/drift-check/SKILL.md"
expect_path "$tmp/agents-only" "$tmp/agents-only/.agents/skills/drift-check/SKILL.md"
expect_path "$tmp/prefer" "$tmp/prefer/skills/drift-check/SKILL.md"

[ $fail -eq 0 ] && echo "PASS: skill structure and seeded-drift finding OK" || exit 1
