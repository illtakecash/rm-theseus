# drift-check quickstart (v0 POC)

The skill is a Markdown procedure. It does not start a daemon, and it does not write `PURPOSE.md` or `DECISIONS.md` from the code.

## Install the skill

Copy the folder `skills/drift-check/` into the client skill directory:

- **Cursor:** `.cursor/skills/drift-check/` in the repo (or `~/.cursor/skills/`).
- **Codex CLI:** `~/.codex/skills/drift-check/` (or reference `SKILL.md` from `AGENTS.md`).
- **Other clients:** `.agents/skills/drift-check/` when that client reads skills from the repo.
- **Gemini CLI:** no skill folder needed: add `@skills/drift-check/SKILL.md` to `GEMINI.md`, or paste it into the prompt.

`sh examples/seeded-drift/check.sh` resolves `SKILL.md` in this order, and uses the first file that exists:

1. `skills/drift-check/SKILL.md` (this repo)
2. `.cursor/skills/drift-check/SKILL.md`
3. `.codex/skills/drift-check/SKILL.md`
4. `.agents/skills/drift-check/SKILL.md`
5. `~/.cursor/skills/drift-check/SKILL.md`
6. `~/.codex/skills/drift-check/SKILL.md`

A checkout that only has the Cursor copy still passes the structural self-test. When both the repo copy and a Cursor copy exist, the repo copy wins.

## Seeded fixture (docs only)

CodeGraph is not required here. The trajectory is `TRAJECTORY.md`.

```
cd examples/seeded-drift
# in your agent: "Run drift-check using PURPOSE.md, DECISIONS.md and TRAJECTORY.md. Write the finding to finding.md."
sh check.sh finding.md     # checks your agent's output
```

Expected: `Verdict: drift` on step 3, citing D1–D3. The `sync` step stores a totals table. A derived `week --csv` export is the alternate path, and it is not that drift. Compare with `EXPECTED.md`.

Self-test (no network, no keys): `sh examples/seeded-drift/check.sh`

## CodeGraph

CodeGraph is how the skill maps implementation structure (symbols and calls) on a source tree. It does not invent or rewrite the objective or the decisions (rule R6 in `.plan/graph.yaml`).

Package: `@colbymchenry/codegraph`. Interface used by the skill, checked against **1.6.2** (run `help` if you have another version; do not add flags it does not list):

```
npx --yes @colbymchenry/codegraph version
npx --yes @colbymchenry/codegraph status <repo> --json
npx --yes @colbymchenry/codegraph explore --path <repo> "<symbols or a short question>"
```

MCP, when the session already has it: tool `codegraph_explore` with a required `query` and a `projectPath` set to the target repo. Cursor needs the server started with `--path <repo>`:

```
npx --yes @colbymchenry/codegraph serve --mcp --path <repo>
```

There is no index until someone initializes it. `init` writes only `.codegraph/` (gitignored in the ledger fixture). Skip `init` when you must not write in that repo, and report the missing index instead:

```
npx --yes @colbymchenry/codegraph init <repo> --yes
```

On a large or real repository, a missing tool or a missing index is `Verdict: insufficient evidence` for a whole-tree "no drift" claim. Do not treat `git log -10` as a substitute. The docs-only seeded fixture is the exception.

## A larger repo, or a repo that still needs purpose files

1. Point the skill at the repo root. It reads `PURPOSE.md` and `DECISIONS.md` there.
2. If either file is missing, the verdict is insufficient evidence. Say which file is missing. Do not draft those files from the source tree, and do not borrow another product's objective. Maxwell (`illtakecash/rm-maxwell`) and Orbital (`illtakecash/rm-orbital`) were not readable from the environment that updated this skill (GitHub 404). Nothing in this repo is their objective.
3. If both files exist and the repo is large or real (a named product repo, more than one service or package, or more than 40 source files), detect CodeGraph as above before accepting "no drift".
4. The in-repo source fixture is `examples/ledger-app` (one Python package, a real call graph, small enough to index). Its `sync` command is planted drift against the same D1–D3 rules as the seeded fixture. From the repo root, after `init` if you have no index:

```
npx --yes @colbymchenry/codegraph explore --path examples/ledger-app "main serve persist_totals WeeklyTotalsRepository weekly_totals write_export"
```

That query is implementation evidence: `main` reaches `serve` and `WeeklyTotalsRepository.save`, which is stored totals plus a server. `week --csv` only reaches `write_export`, which is a derived export. The recorded decisions stay the authority either way.

A rerun of the seeded and ledger scenarios is in `docs/TRIAL-RERUN-2026-11-12.md`.
