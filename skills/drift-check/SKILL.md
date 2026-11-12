---
name: drift-check
description: Use when the user says "drift check", "/drift-check", "are we drifting", or "check the trajectory"; before merging a design-changing pull request; when a change touches a recorded decision; when a proposed step would add a service, component, or dependency; or when checking a large or real codebase such as Maxwell or Orbital.
---

# drift-check (rm-theseus v0, POC)

Compare where a project is heading against its stated objective and dated decisions.
Report one cited drift finding, or "no drift", or "insufficient evidence". Never invent decisions.

This skill runs inside the current session. It does not launch any other agent or model,
and it makes no claim of independence or isolation. It is a procedure, not a daemon.

## Triggers
Run when:
1. The user invokes it manually ("drift check", "/drift-check", "run drift-check on <path>").
2. A change modifies or contradicts a file/decision listed in the decision state.
3. A proposed next step adds a new component, dependency, or service not traceable to the objective.
4. Before merging a PR that changes architecture.
5. The target is a large or real codebase (Maxwell, Orbital, or similar), not the docs-only fixture.
Do not run on typo fixes, formatting, or test-only changes.

## Inputs (compact state format)
Look for `PURPOSE.md` and `DECISIONS.md` at the repo root (or the path the user gives).
If either file is missing, and the user did not supply that text in the conversation, stop.
Verdict: insufficient evidence. Say which file is missing. Do not invent an objective or a
decision from the code, from git history, or from CodeGraph, and do not write those files.

PURPOSE.md:
```
# Purpose
Objective: <one sentence, immutable until an explicit owner amendment>
Non-goals: <bullets, current list>
```

DECISIONS.md (append-only, one line per decision, oldest first):
```
- D<n> YYYY-MM-DD: <decision>. Why: <reason>. Supersedes: <none | one D# | several D# separated by commas>
```
`Supersedes:` lists every decision this one retires. Several IDs are normal.
Example: `Supersedes: D2, D3`. Each listed ID leaves force. IDs not listed stay in force.

## Terms
- **Objective** is the immutable baseline. Do not rewrite it from code, from CodeGraph, or from later work. Only an explicit owner amendment changes it: a recorded decision plus a dated amendment line in `PURPOSE.md`. Until both exist, judge against the Objective as written.
- **Non-goals** are the current list in `PURPOSE.md`. A later decision may amend them; the decision says what was added or removed. That amendment does not change the Objective. Editing the list with no decision is a candidate, because the list and the decisions disagree.
- **Stored** persistent data can become a second source of truth (a table, a database row, a cache later read as the record). **Derived / on-read** data is computed from the source of truth when asked for, including a file written only as that computation (for example `week --csv`). A derived export is not stored. Persisting the same numbers into their own table is stored. D3 "never stored" forbids the table, not the export.
- **Adds structure** means a new service, process, component, dependency, storage system, or network boundary that no objective clause and no in-force decision requires. A flag, a local option, or a helper inside an already-decided component is not new structure. `week --csv` is a local option on `week`. A server plus a database is new structure.

## Procedure
1. **Load state.** Read the objective, non-goals, and every decision. A decision is in force unless a later one lists it in `Supersedes:`. Apply the Terms above before judging.
2. **Classify the target.**
   - **Docs-only.** `examples/seeded-drift`, or a target whose trajectory is only `PURPOSE.md`, `DECISIONS.md`, and a named `TRAJECTORY.md` (no implementation files). CodeGraph is not required. Review that trajectory, the last ~10 commits (`git log --oneline -10`) if this target is its own git repo, and the open diff.
   - **Large or real.** The user named a product repo (Maxwell, Orbital, or similar), or the tree has more than one service or package directory, or more than 40 source files. `git log -10` is not a trajectory review. CodeGraph is required before any `Verdict: no drift`.
   - **Other source trees,** including `examples/ledger-app`. Use CodeGraph when it is available. If it is missing, you may report drift that is fully cited from files you opened, and you must say the graph was not consulted. Do not report `no drift` for the whole tree from a 10-commit skim.
3. **CodeGraph (implementation evidence only).** Map symbols, calls, and files onto the objective and the in-force decisions: where a recorded decision landed, and which entrypoints the code actually reaches. Attach results as evidence in the output. They are E-* evidence only. Rule R6: nothing from CodeGraph, and nothing derived from implementation, may create or modify the Objective, the Non-goals, a decision, or any I-* or P-* node. If the graph and the recorded state disagree, the recorded state wins. The graph's own "no index, use other tools" note does not authorize `Verdict: no drift` on a large or real repo.
4. **Test candidates.** A candidate is drift only if it (a) contradicts an in-force decision, (b) hits a current non-goal or the unamended objective, or (c) adds structure that no in-force decision or objective clause requires. Cite the decision IDs and dates. Use the stored-vs-derived and structure-vs-option distinctions in Terms.
5. **Alternate-path challenge.** For each drift, name the simplest path that satisfies the objective and in-force decisions without the drift. If the drifting path is actually better, say so and recommend recording a new decision that supersedes every decision it retires (one `Supersedes:` list, which may contain several IDs) instead of reverting. An objective change still needs an explicit owner amendment; a decision alone does not rewrite the Objective.
6. **Output** exactly the format below.

## CodeGraph detect and call
Package: `@colbymchenry/codegraph`. Prefer an MCP tool when this session already has it; otherwise the CLI. Do not invent flags. Confirm with `npx --yes @colbymchenry/codegraph help <command>` when the installed version may differ. The interface below was taken from package 1.6.2 (its `help`, its README, and the `codegraph_explore` input schema). That version's `help` does not include `status --strict`.

**MCP.** Server command: `npx --yes @colbymchenry/codegraph serve --mcp --path <repo>` (`--path` is required for Cursor, which starts MCP with the wrong working directory). The default listed tool is `codegraph_explore` only. Call it with:
- `query` (string, required): symbol names, file names, or a short question. Name the nouns in the in-force decisions and any new entrypoint (storage, totals, the service under review).
- `projectPath` (absolute path): pass it whenever the session root is not the target repo.
- `maxFiles` (number, optional, default 12).

**CLI** (same explore output as `codegraph_explore`):
```
npx --yes @colbymchenry/codegraph status <repo> --json
npx --yes @colbymchenry/codegraph explore --path <repo> "<query>"
```
Run at least one explore for the decision nouns and one for each new entrypoint the diff or tree adds. Do not paste the whole graph into the finding; cite the symbols and call path you used.

**Missing tool.** No `codegraph_explore` tool, and `npx --yes @colbymchenry/codegraph version` fails. On a large or real repo, do not review with `git log -10` and call that enough.

**Missing index.** The command runs but there is no `.codegraph/` index. Different from a missing tool. Package 1.6.2 `status --json` then has `"initialized": false`. `explore` exits 1 and prints: `CodeGraph isn't available here — no .codegraph/ index exists in <repo>. If you are an AI agent: continue with your usual tools; indexing is the user's decision, do not run it yourself.` For this skill, that sentence means the index is missing. On a large or real repo it does not mean "review with grep and git log, then say no drift."

**Building an index writes `.codegraph/` and does not change purpose or decisions.** Run it only when the user asked for this check and you are allowed to write in that repo:
```
npx --yes @colbymchenry/codegraph init <repo> --yes
```
If you must not write (a read-only checkout, or a repo you were told not to modify), do not run `init`. Report the index as missing and give the command. Never write `PURPOSE.md` or `DECISIONS.md` to fill the gap.

On a large or real repo, a missing tool or a missing index means `Verdict: insufficient evidence` for any whole-tree "no drift" claim. A specific drift already proven from cited files and in-force decisions may still be reported; say that other drift may exist because the graph was not consulted.

Docs-only targets, including `examples/seeded-drift`, skip this section. `CodeGraph: not required (docs-only trajectory)`.

## Output format
Use one verdict label. Do not write "Why it is drift" unless the verdict is drift.
```
## Drift finding
Verdict: drift | no drift | insufficient evidence
Where: <commit, file, symbol, or step, or "n/a">
Conflicts with: <Dn (YYYY-MM-DD) "quote" and/or an objective or non-goal clause, or "none", or "n/a">
Why it is drift: <one or two sentences>                  # verdict drift only
Why it is not drift: <one or two sentences>              # verdict no drift only
What is missing: <the absent file, tool, or index>       # verdict insufficient evidence only
Alternate path: <simplest compliant path, or "n/a">
Correction: <concrete change, or "record new decision D<n+1> superseding D#, D#: ...", or "none", or which inputs to supply>
CodeGraph: <not required | used: query and the call path | missing: the command to run>
Next trigger: <the event that should rerun this check>
```

## Optional reviewer CLI contract
A user may choose to pipe the same inputs to a second CLI they already use, by hand:
```
cat PURPOSE.md DECISIONS.md TRAJECTORY.md | <your-reviewer-cli> "<this skill's Procedure + Output format>"
```
The reviewer must return the Output format above. No provider or model flags are specified here;
use your CLI's own documented options. This skill never runs it for you, and a second reviewer is
not assumed to be independent.
