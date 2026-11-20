# Diagnosis D1

- Kind: diagnosis
- Act: diagnose
- Actor: proposer
- Baseline: B0
- Finding: F1
- Inputs: fixture/b0/baseline.md, fixture/b0/parts.md, fixture/cycle1/observation-o1.md
- Input-hash: fixture/b0/baseline.md 1280e0b0d77c99bbe09d6fe8412b8ae55f0cc4bf4430ad2a7cfc0161a9d5ed62
- Input-hash: fixture/b0/parts.md c66ea113ee5454847f5a818525cac8b947e377f056016f1cce51b940e25a9f33
- Input-hash: fixture/cycle1/observation-o1.md c530b33a67a07d2fd5c0306d0b2c4cddaca6409f1d6bfdccf29a7179b0377010
- Excluded: fixture/cycle1/packet-a1.md

Cause claim: at origin, P-LOAD's limit is 10 and P-NOTICE's shown limit is 12. The notice history says the sign should follow the load rule, and the notice labels do not name P-LOAD, so a dependency trigger could not fire when the limit changed. Twelve people boarded because the posted number was twelve and the crew entry has no count. The repair this diagnosis asks for is a new notice that copies 10 and names the edge.

This file is proposer context. An assessment packet that lists it under Inputs is void.
