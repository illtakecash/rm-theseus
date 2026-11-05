---
name: drift-check
description: Architectural drift check. Use when the user says "drift check", "/drift-check", "are we drifting", "check the trajectory", before merging a design-changing PR, when a change touches a recorded decision, or when the next step would add a component the objective did not ask for.
---

# drift-check (rm-theseus v0, POC)

Compare where a project is heading against its stated objective and dated decisions.
Report one cited drift finding, or "no drift", or "insufficient evidence". Never invent decisions.

This skill runs inside the current session. It does not launch any other agent or model,
and it makes no claim of independence or isolation.

## Triggers
Run when:
1. The user invokes it manually ("drift check", "/drift-check", "run drift-check on <path>").
2. A change modifies or contradicts a file/decision listed in the decision state.
3. A proposed next step adds a new component, dependency, or service not traceable to the objective.
4. Before merging a PR that changes architecture.
Do not run on typo fixes, formatting, or test-only changes.

## Inputs (compact state format)
Look for `PURPOSE.md` and `DECISIONS.md` at the repo root (or the path the user gives).
If missing, ask the user for the objective and write them in this format:

PURPOSE.md:
```
# Purpose
Objective: <one sentence, immutable>
Non-goals: <bullets>
```

DECISIONS.md (append-only, one line per decision, oldest first):
```
- D<n> YYYY-MM-DD: <decision>. Why: <reason>. Supersedes: <D# or none>
```

## Procedure
1. **Load state.** Read the objective, non-goals, and every decision. A decision is in force unless a later one supersedes it.
2. **Trajectory review.** Read the recent trajectory: last ~10 commits (`git log --oneline -10`), the open diff, and/or a `TRAJECTORY.md` / proposal the user names. For each step, note which decision or objective clause it serves. A step with none is a candidate.
3. **Test candidates.** A candidate is drift only if it (a) contradicts an in-force decision, (b) hits a non-goal, or (c) adds structure that no decision or objective clause requires. Cite the decision IDs and dates.
4. **Alternate-path challenge.** For each drift, name the simplest path that satisfies the objective and in-force decisions without the drift. If the drifting path is actually better, say so and recommend recording a new superseding decision instead of reverting.
5. **Output** exactly the format below. Use `Verdict: no drift` or `Verdict: insufficient evidence` (say what is missing) when appropriate.

## Output format
```
## Drift finding
Verdict: drift | no drift | insufficient evidence
Where: <commit/file/step>
Conflicts with: D<n> (YYYY-MM-DD) "<quote>" [, objective/non-goal]
Why it is drift: <one or two sentences>
Alternate path: <simplest compliant path>
Correction: <concrete change, or "record new decision D<n+1>: ...">
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
