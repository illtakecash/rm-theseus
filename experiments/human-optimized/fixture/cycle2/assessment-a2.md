# Assessment A2

- Kind: assessment
- Act: assess
- Actor: assessor
- Baseline: B1
- Finding: F2
- Inputs: fixture/cycle2/packet-a2.md
- Input-hash: fixture/cycle2/packet-a2.md 2f7ace08b63fed0aad6c1418e13f56890bfeb0b7dcbe6f6bbea23631a0c71675
- Excluded: fixture/cycle2/diagnosis-d2.md, fixture/cycle2/proposal-c2.md

Judgments below use the packet only. This assessment does not write a replacement entry.

- INV-2: pass. The candidate Norm shown-limit is 10. The aboard P-LOAD Norm limit is 10. This pass does not board the candidate.
- INV-3: fail. The candidate Norm crew-duty-on-notice is count-and-stop. The aboard P-CREW Norm count-step is none. The notice would be the only entry stating that crew duty.
- INV-1: fail. The candidate Norm stop-rule is notice-number. That stop point is the notice, not P-LOAD's limit. The aboard P-CREW entry is unchanged and still has no counting step, so the procedure that boards people does not gain a count.
- RULE-DEP: pass for the copied limit. The candidate's shown limit is 10 and Depends-on lists P-LOAD. The new stop rule does not copy P-LOAD's limit. That miss is the INV-1 failure above, not a missing edge for the value 10.
- Verdict: refuse
- Scope-noted: none. The candidate is not boardable. INV-1 stays unmet in the world recorded by observation O1, and this plank would also make the notice the sole carrier of a crew duty.
