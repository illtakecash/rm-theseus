# Validation

Precommitted before any run. Changing a criterion after seeing outputs requires a new dated entry here, the old text kept, and Scott's approval.

| ID | Criterion | Pass | Fail means |
|---|---|---|---|
| V-DRIFT | On `theseus-history`, each assessor names the divergence (matching or defensibly extending the sealed key), a causal chain citing decision IDs, one excluded alternative, and a recovery or revision. | All four elements, independent and contextual, judged against the key by Scott or a grader that hasn't seen the outputs' authors. | C-TRAJ/C-CAUSE/C-ALT/C-CORR not demonstrated. |
| V-CTRL | On `control`, neither assessor reports drift. | No drift finding. | False alarm; detector is just pattern-matching "governance = bad". |
| V-BASE | Compare B3 to the B1 plain-prompt baseline on V-DRIFT and V-CTRL. | B3 is better on at least one element and worse on none, or we say plainly that it isn't. | If the baseline ties, the method adds nothing; stop and rethink before B5. |
| V-HELD | `consulting-os`, key sealed before B4, no tuning after unseal. | V-DRIFT elements hold; the finding states that governing the inherited Python implementation is not making implementations replaceable. | Overfit to Theseus. |
| V-TRAJ | Sensitivity: reorder, drop, or insert one decision in `theseus-history`. | Divergence point moves or holds in a way the cause explains. Shuffling all decisions should degrade the finding. | Assessor isn't reading the trajectory. |
| V-ISO | Isolation evidence for the independent pass: process, filesystem, network, model memory, model family. Each marked restricted, disclosed-unrestricted, or unknown. | Report is complete and truthful; anything not restricted is labeled. `independence_unverified` blocks any authorization that cites that assessment. | C-DUAL overstated. |
| V-CORR | Correction loop with one failed correction. | Failed correction leaves the finding open; successful one clears it on re-run. | C-CORR not demonstrated. |
| V-RETAIN | Intent-retention probe: from a loop packet alone (plus pulls), an agent states the governing objective and the principles relevant to the step. | Matches `intent.md` on objective and every principle in the packet's graph slice. | Compression lost intent; enlarge packet or fix graph. |
| V-COST | Total effective context cost per loop: packet tokens + pulled tokens + reconstruction turns, vs. a full-document loop on the same tasks. | Lower total cost with V-RETAIN passing on both. | Compression is a token trick, not a saving. |

**Honest limitations, stated now.** Local isolation can't verify a hosted model's server-side memory. Same-family models (Grok Bot and its own cloud agents) have correlated errors; a cross-family independent run is stronger. Scott writing the keys means grading against his reading of drift, which is the intended authority but not ground truth.
