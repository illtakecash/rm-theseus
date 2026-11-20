# Folded register

- Kind: projection
- Non-authoritative: true
- Source-hash: fixture/cycle1/observation-o1.md c530b33a67a07d2fd5c0306d0b2c4cddaca6409f1d6bfdccf29a7179b0377010
- Source-hash: fixture/cycle1/authorization-r1.md d91e81d5dfb0fa033d7fa85977e3cd575db61cbc5d7beafd499af22f06417f98
- Source-hash: fixture/cycle1/baseline-b1.md 27693e11e963e73072236cd7a3def940adcd9b62aac5d7261ee5bd6e3269e323
- Source-hash: fixture/cycle1/observation-o2.md 85be93ea58e1eda6c2d4b7c83270e6c340670218a537e91926102a7a558a705c
- Source-hash: fixture/cycle2/refusal-r2.md 8eaaaf3223b97dbb5df939cde32aad042226e6172fc6472bb23f4ed7ddc9b4c8
- Source-hash: fixture/cycle2/observation-o3.md 59128f04669316340fa8170454da12cff1b291c465486ec504b69cf1f584d3a2

This file folds the derived-status table in `.plan/design.md`. It is not a status field. If a row disagrees with a walk of the seal log, the walk wins and this file is discarded.

| After act | Derived record |
| --- | --- |
| O1 | F1 open. INV-1 unmet. INV-2 unmet. |
| R1 | F1 authorized for INV-2 and P-NOTICE only. F2 open. ALT-leave-sign refused. ALT-duty-on-notice deferred. |
| B1 | F1 implemented for INV-2. The finding id is R1's Finding line; the invariant is the invariant anchor on R1's Scope line. Pointer for P-NOTICE is p-notice-c1.md. P-LOAD and P-CREW remain on the origin parts file. |
| O2 | F1 closed-confirmed for INV-2. F2 remains open. INV-1 was not checked. |
| R2 | C2 refused. No pointer move. ALT-duty-on-notice failed. ALT-crew-count open. Current baseline remains B1. |
| O3 | C2 closed-failed. F2 remains open. Posted text matches the B1 notice. |

Current fold: F1 closed for INV-2; F2 open; C2 closed-failed; aboard baseline B1; ALT-crew-count still conceivable and unattempted.
