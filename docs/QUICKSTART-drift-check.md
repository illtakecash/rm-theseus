# drift-check quickstart (v0 POC)

Install by copying the folder `skills/drift-check/` into your client's skill directory:
- **Cursor:** `.cursor/skills/drift-check/` in the repo (or `~/.cursor/skills/`).
- **Codex CLI:** `~/.codex/skills/drift-check/` (or reference `SKILL.md` from `AGENTS.md`).
- **Gemini CLI:** no skill folder needed: add `@skills/drift-check/SKILL.md` to `GEMINI.md`, or paste it into the prompt.
Check your client's current docs if a path has moved; any client that can read a Markdown file works.

Run on the fixture (5 minutes):
```
cd examples/seeded-drift
# in your agent: "Run drift-check using PURPOSE.md, DECISIONS.md and TRAJECTORY.md. Write the finding to finding.md."
sh check.sh finding.md     # checks your agent's output
```
Expected: a `Verdict: drift` on step 3 citing D1-D3; compare with `EXPECTED.md`.

Self-test (no network, no keys): `sh examples/seeded-drift/check.sh`
