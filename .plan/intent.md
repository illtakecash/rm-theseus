# Intent

Status: **proposed; not self-ratifying.** Only Scott ratifies. Agents may propose revisions below; none take effect until Scott authorizes them.

## I-0 Origin (immutable)

Recorded 2026-11-01. Source: Scott's original-goal challenge, conveyed in [issue #2 comment 6564657965](https://github.com/illtakecash/rm-theseus/issues/2#issuecomment-6564657965). Do not edit these bytes; revise only by appending an `I-n` below.

> A fully portable, agent-native mechanism to detect when an evolving implementation departs from its original goals, principles, and invariants, even when each intermediate engineering choice is defensible. It must combine a context-aware assessment with a genuinely independent assessment lacking inherited implementation context, surface alternatives that may have been prematurely excluded, and support correction or explicitly authorized revision of intent.

North-star question: **Are we still building what we set out to build?**

Charter motto (CHARTER.md): *Replace the planks. Preserve the purpose.*

## Governing principles (derived from I-0 and CHARTER.md; IDs used by `graph.yaml`)

| ID | Principle | Source |
|---|---|---|
| P-TRAJ | Drift is judged over the trajectory and the whole current state, not only per change. | I-0 "evolving … even when each choice is defensible" |
| P-ISO | Independence means controlled information access and separately sealed first passes; prompting to ignore context is not isolation. | CHARTER inv. 2–3 |
| P-NOMUT | Implementation never redefines intent; revisions are appended, versioned, authorized. | CHARTER inv. 4 |
| P-NOAUTH | No invented authority; missing baseline means insufficient evidence, not a score. | CHARTER inv. 5 |
| P-DISSENT | Disagreement is preserved, not forced into consensus. | CHARTER inv. 6 |
| P-SELF | Theseus is reviewed by Theseus. | CHARTER inv. 8 |
| P-EVAL | The evaluator is evaluated (seeded drift, negative controls, baselines). | CHARTER inv. 13 |
| P-PORT | Portable across projects, languages, vendors, hosts. | I-0 "fully portable"; CHARTER inv. 1 |
| P-DETECT-FIRST | No governance machinery is built until a detector beats a plain-prompt baseline. | Proposed in [Grok Bot assessment](https://github.com/illtakecash/rm-theseus/issues/2#issuecomment-6564689616); requested in [comment 6569865770](https://github.com/illtakecash/rm-theseus/issues/2#issuecomment-6569865770). Adopted via I-1 on merge of PR #5. |

## Authorized changes (append-only)

| ID | Date | Change | Authorized by | Status |
|---|---|---|---|---|
| I-0 | 2026-11-01 | Origin objective | Scott | origin |
| I-1 | 2026-11-04 | Adopt P-DETECT-FIRST as a governing principle | Scott, relayed by ChatGPT in [PR #5 comment](https://github.com/illtakecash/rm-theseus/pull/5#issuecomment-6645519315); in force when Scott merges PR #5 | proposed for adoption |

Decisions that are *not* intent changes (they serve intent, they don't redefine it) live in `graph.yaml` as `D-*` nodes, e.g. ADR 0001.

## Pending (not in force)

- None. I-1 moves to the table above; it takes effect when Scott merges PR #5. Full ratification of this file and `CHARTER.md` stays a separate decision.
