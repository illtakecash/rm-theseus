# Folded register

- Kind: projection
- Non-authoritative: true
- Source-hash: fixture/cycle1/observation-o1.md a40b50fde9c11dfa42fa4f91f6c80b2f323f366df14ac016ab1bc190550a2244
- Source-hash: fixture/cycle1/authorization-r1.md 784aa9b49a88040c588eb0b1a7106ffdea21083e625c96d4c38a7c3f3394c06b
- Source-hash: fixture/cycle1/baseline-b1.md 191203092d4260403b80b14d5c66a38567f32f825b56478fc1f00c54864b5467
- Source-hash: fixture/cycle1/observation-o2.md d7b75e953f501021120945eb6fa30b815e2b78eaa6032bf3b43abd649795dbd3
- Source-hash: fixture/cycle2/refusal-r2.md a7ce9546a0dc1e635dfe5274f3c5145490121c484269256484e9725d79cbe791
- Source-hash: fixture/cycle2/observation-o3.md d0a5de834d3ad87aab540f15ebf2eb75451fd1aceb573ec4dafbef8bd6523afa

This file folds the derived-status table in `.plan/design.md`. It is not a status field. If a row disagrees with a walk of the seal log, the walk wins and this file is discarded.

| After act | Derived record |
| --- | --- |
| O1 | F1 open. INV-1 unmet. INV-2 unmet. |
| R1 | F1 authorized for INV-2 and P-NOTICE only. F2 open. ALT-leave-sign refused. ALT-duty-on-notice deferred. |
| B1 | F1 implemented for INV-2. Pointer for P-NOTICE is p-notice-c1.md. P-LOAD and P-CREW remain on the origin parts file. |
| O2 | F1 closed-confirmed for INV-2. F2 remains open. INV-1 was not checked. |
| R2 | C2 refused. No pointer move. ALT-duty-on-notice failed. ALT-crew-count open. Current baseline remains B1. |
| O3 | C2 closed-failed. F2 remains open. Posted text matches the B1 notice. |

Current fold: F1 closed for INV-2; F2 open; C2 closed-failed; aboard baseline B1; ALT-crew-count still conceivable and unattempted.
