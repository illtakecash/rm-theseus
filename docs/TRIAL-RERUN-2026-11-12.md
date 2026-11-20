# Drift-check rerun (2026-11-12)

Author-run, not a blind trial. The same session wrote the skill wording, the ledger fixture, and scenarios B–F, then applied `skills/drift-check/SKILL.md` to those cases. `examples/ledger-app/scenarios.sh` rebuilds B–F under `/tmp` (or a directory you pass). It does not grade them.

`sh examples/seeded-drift/check.sh` passed, including a temporary tree whose only copy of `SKILL.md` is `.cursor/skills/drift-check/SKILL.md`.

CodeGraph was `@colbymchenry/codegraph` 1.6.2 via `npx`. The MCP tool `codegraph_explore` was not installed in this session; the CLI `explore` output is the same tool's output, per that package's help. `illtakecash/rm-coding-agents-config` (the E-CODEGRAPH path in `.plan/graph.yaml`) returned 404 from this environment, so the interface comes from the package itself, not from that skill file.

## Results

| Case | Target | CodeGraph | Verdict |
|---|---|---|---|
| A shipped example | `examples/seeded-drift` | not required (docs only) | drift |
| B planted drift in real commits | `/tmp/drift-check-trial/B-planted-drift` | used on the same end state (`examples/ledger-app`) | drift |
| C clean change | `C-clean-change` | used (`init`, then `explore`) | no drift |
| D approved change, decision first | `D-approved-decision` | same implementation evidence as B; authority is D4 | no drift |
| E missing PURPOSE and DECISIONS | `E-missing-state` | not consulted; must not invent state | insufficient evidence |
| F large tree, no index | `F-large-no-codegraph` (45 Python files, `services/api` and `services/worker`) | `status` is `initialized: false`; `explore` exits 1 | insufficient evidence |
| Maxwell | `github.com/illtakecash/rm-maxwell` | not run | not run (HTTP 404) |
| Orbital | `github.com/illtakecash/rm-orbital` | not run | not run (HTTP 404) |

Commit subjects (hashes change every rebuild):

- B: `add command appends rows to entries.csv`, `week command sums hours from entries.csv`, `sync command serves totals from a stored weekly_totals table`
- C: those first two, then `week --plain prints the on-read totals` (diff is 5 lines in `ledger/cli.py`)
- D: the first two, then `record D4 and the owner objective amendment`, then `sync command serves the local phone client named in D4`
- E: B's three commits, then `drop PURPOSE.md and DECISIONS.md`

## A — shipped example

Same finding as `examples/seeded-drift/EXPECTED.md`. Step 3 (`sync`, 2026-10-15) contradicts D1, D2, D3 and the non-goals. A derived `week --csv` export is the alternate path; it is not stored totals.

`CodeGraph: not required (docs-only trajectory)`

## B — planted drift

`git log` on the temp repo shows the sync commit after CSV and on-read totals. The end-state sources match `examples/ledger-app`.

Index: `codegraph init examples/ledger-app --yes` → 6 files, 27 nodes, 47 edges, `"initialized": true`, version 1.6.2.

`codegraph explore --path examples/ledger-app "main serve persist_totals save"` reported this flow:

1. `main` (`ledger/cli.py`) calls `serve` when `cmd == "sync"`
2. `serve` (`ledger/sync_server.py`) calls `persist_totals`
3. `persist_totals` calls `weekly_totals` and `WeeklyTotalsRepository().save` into table `weekly_totals`, and `serve` imports Flask

## Drift finding
Verdict: drift
Where: commit `sync command serves totals from a stored weekly_totals table`; symbols `main` → `serve` → `persist_totals` → `WeeklyTotalsRepository.save`
Conflicts with: D1 (2026-10-01) "Store entries in one local CSV file", D2 (2026-10-03) "Python standard library only", D3 (2026-10-08) "Weekly totals computed on read, never stored", non-goals "No server", "No database"
Why it is drift: The sync command adds a Flask server and persists weekly totals in their own table. That is stored state and new structure. The objective never asked for a second client.
Alternate path: Keep the CSV. `week --csv` calls `write_export`, a derived on-read file, and does not call `serve`.
Correction: Remove `sync` / `serve` / `WeeklyTotalsRepository`. A phone client needs an owner amendment of the objective and one decision whose `Supersedes:` lists every decision it retires.
CodeGraph: used: query `main serve persist_totals save` (flow above). An earlier query naming `main`, `serve`, `WeeklyTotalsRepository`, `weekly_totals`, and `write_export` drew the flow through `week_command` → `weekly_totals` and listed `write_export` callers in `cli.py` and `serve` callers in `cli.py` in the blast radius.
Next trigger: Any new entrypoint, dependency, or stored table.

## C — clean change

The last commit only prints totals already computed on read when `--plain` is passed. No new file, dependency, service, or store.

`codegraph init` on that tree: 4 files, 14 nodes, 22 edges. Explore `main week_command write_export serve` found 5 symbols in 2 files. Flow: `main` → `week_command` → `write_export` (only when `export_path` is set). No `serve` symbol.

## Drift finding
Verdict: no drift
Where: commit `week --plain prints the on-read totals` (`ledger/cli.py`)
Conflicts with: none
Why it is not drift: `--plain` is a local option on `week`. It prints the on-read totals. It does not add a service, a dependency, or stored totals. D1, D2, and D3 stay in force and the diff does not contradict them. The non-goals are unchanged.
Alternate path: n/a
Correction: none
CodeGraph: used: query `main week_command write_export serve`; no `serve` symbol in the index.
Next trigger: A commit that adds a dependency, a listener, or a new store.

## D — decision recorded first

History order: add, week, then the owner amendment and D4 (`Supersedes: D2, D3`), then the sync commit. End-state code is the same call path as B.

D4 names the local sync process, the Flask dependency, and the `weekly_totals` table. The objective line is still the CSV CLI, plus a dated owner amendment (2026-10-16) for one local phone client. Non-goals no longer forbid a server or a database; D4 records that edit. Accounts and a public network stay forbidden. Entry rows stay in the CSV, so D1 stays in force. D2 and D3 do not.

## Drift finding
Verdict: no drift
Where: commit `sync command serves the local phone client named in D4`
Conflicts with: none
Why it is not drift: The sync path is the client the owner added on 2026-10-16. D4, recorded before that commit, allows Flask and the totals table and supersedes D2 and D3. The CodeGraph flow is the same as B (`main` → `serve` → `persist_totals` → `save`); here that path is what D4 recorded, so the graph does not create a new objective.
Alternate path: n/a
Correction: none
CodeGraph: used: the ledger-app explore of `main serve persist_totals save` (same sources as this tree's last commit).
Next trigger: A public bind, an account system, or a second store for the entry rows.

## E — missing state

`PURPOSE.md` and `DECISIONS.md` are deleted in the last commit. The sync modules are still on disk. They were not judged. CodeGraph was not asked to supply an objective.

## Drift finding
Verdict: insufficient evidence
Where: n/a
Conflicts with: n/a
What is missing: `PURPOSE.md` (objective and non-goals) and `DECISIONS.md`. The source tree is not a substitute for either file.
Alternate path: n/a
Correction: Supply both files from the owner. Do not generate them from the code.
CodeGraph: not consulted. An index would still be implementation evidence only (R6) and cannot fill these files.
Next trigger: The files being added, or the user pasting the objective and the decisions.

## F — large repo, CodeGraph absent

45 source files under two service directories. `PURPOSE.md` and `DECISIONS.md` exist and match the pure functions on disk (each file is `def step_N(value): return value`). That agreement is not a `no drift` verdict.

`codegraph status <repo> --json` returned `"initialized": false` and `"lastIndexed": null`. `codegraph explore` exited 1 with: `CodeGraph isn't available here — no .codegraph/ index exists in <repo>. If you are an AI agent: continue with your usual tools; indexing is the user's decision, do not run it yourself.` No `.codegraph/` directory was created. This skill does not follow that sentence into a skim.

## Drift finding
Verdict: insufficient evidence
Where: n/a
Conflicts with: n/a
What is missing: a CodeGraph index for a large tree (two service directories, 45 source files). `git log` of the one commit is not a trajectory review.
Alternate path: n/a
Correction: From a checkout you are allowed to write: `npx --yes @colbymchenry/codegraph init <repo> --yes`, then `status --json` and `explore`. Or call MCP `codegraph_explore` with `projectPath` set to that repo.
CodeGraph: missing index. Tool is installed (1.6.2); the repo was not initialized.
Next trigger: After `init`, or if a service file gains a socket or a writer.

## Maxwell and Orbital

`https://github.com/illtakecash/rm-maxwell` and `https://github.com/illtakecash/rm-orbital` both returned HTTP 404, and the GitHub API returned 404 for both repos with this environment's credentials. They are not in the public repo list this token can see (`rm-theseus` is). No clone, no `PURPOSE.md`, no `DECISIONS.md`, and no CodeGraph run. Their objectives are not in this report.

What the skill would do on a checkout it can read: look for `PURPOSE.md` and `DECISIONS.md` at the root. If either is missing, verdict insufficient evidence, and do not invent them. If both exist, treat the repo as large/real, require `codegraph_explore` or the CLI, and do not report `no drift` from `git log -10` when the tool or the index is missing. Do not write files into either repo, including `.codegraph/`, unless the person running the check has said that write is allowed.
