# Capabilities

Each capability is a testable outcome that serves I-0. Pass criteria are precommitted in `validation.md`. IDs are referenced by `graph.yaml`.

| ID | Capability | Serves | Observable when it works |
|---|---|---|---|
| C-TRAJ | **Trajectory-level drift detection.** Given intent and an ordered decision history plus current state, report whether and where the system departed from intent. | I-0, P-TRAJ | Names the divergence point(s) on a seeded/historical drift case; reports *no* drift on the negative control. |
| C-CAUSE | **Causal explanation.** Explain how locally defensible choices compounded into departure. | I-0 | Names the specific decisions and the mechanism linking them, citable by decision ID. |
| C-ALT | **Alternative discovery.** Surface at least one concrete alternative that the trajectory excluded, including ones never written down. | I-0 "prematurely excluded" | Names an alternative matching (or defensibly extending) the sealed answer key. |
| C-CORR | **Correction or authorized revision.** Propose a recovery that restores intent, or an explicit intent revision for the owner to authorize; re-evaluate after the change. | I-0, P-NOMUT | A recovery whose re-run clears the finding, or a proposed `I-n` that the owner can accept or reject. A failed correction leaves the finding open. |
| C-DUAL | **Independent plus contextual assessment.** Two first passes, sealed before either sees the other; the independent one sees only intent, current state, and outcomes, not implementation rationale. | I-0, P-ISO, P-DISSENT | Both outputs hashed before reconciliation; isolation evidence recorded and honestly labeled; dissent preserved. |
| C-COMPACT | **Compressed operation.** Loops run on bounded, delta-first packets without losing governing intent. | P-PORT (agent-native), hard requirement in comment 6569865770 | Intent-retention probe passes at lower total effective context cost than full-document loops (`validation.md` V-COST, V-RETAIN). |

Explicitly **not** a capability yet: persistence, authorization validation, baseline chains, view packets. They are retained as a deferred direction (ADR 0001), to be pulled in only when a capability fails without them.
