# Diagnosis D1

- Kind: diagnosis
- Act: diagnose
- Actor: proposer
- Baseline: B0
- Finding: F1
- Excluded: fixture/cycle1/packet-a1.md

Cause claim: at origin, P-LOAD's limit is 10 and P-NOTICE's shown limit is 12. The notice history says the sign should follow the load rule, and the notice labels do not name P-LOAD, so a dependency trigger could not fire when the limit changed. Twelve people boarded because the posted number was twelve and the crew entry has no count. The repair this diagnosis asks for is a new notice that copies 10 and names the edge.

This file is proposer context. An assessment packet that lists it under Inputs is void.
