# Candidate realization C1

Plank offered for P-NOTICE. The proposal envelope, including rationale and alternatives, is a separate file so a baseline can point at this plank without pointing at the proposer's argument.

### P-NOTICE — Dock notice

- Kind: part
- Role: Show passengers on the dock the authorized passenger limit before they board.
- Depends-on: P-LOAD
- Does-not-depend-on: P-CREW
- Bound-invariants: INV-2, INV-3
- Review-on: an observation names P-NOTICE, or a part named by Depends-on changes a Norm line
- Norm: shown-limit = 10
- Norm: posted-text = Theseus ferry. No more than 10 passengers.
- Restatement: The dock notice shows 10 and reads: Theseus ferry. No more than 10 passengers.
- History: Replaces the origin notice. The origin notice showed 12. The dependency on P-LOAD is a labeled line on this entry.
