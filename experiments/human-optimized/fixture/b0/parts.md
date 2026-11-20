# Ferry Theseus — origin realizations

These three entries are the planks aboard at baseline B0. The file is sealed as a whole. A later boarding points at a new file for the part that changed and keeps pointing here for the parts that did not.

### P-LOAD — Authorized passenger limit

- Kind: part
- Role: Hold the only authorized passenger limit for the ferry.
- Depends-on: none
- Does-not-depend-on: P-NOTICE, P-CREW
- Bound-invariants: INV-1, INV-2
- Review-on: an observation names P-LOAD
- Norm: limit = 10
- Restatement: The authorized limit is 10 passengers, and this entry is the only authorized number.
- History: A previous realization used twelve. That plank is not aboard. The change to 10 was already in place when this origin baseline was declared.

### P-NOTICE — Dock notice

- Kind: part
- Role: Show passengers on the dock the authorized passenger limit before they board.
- Depends-on: none
- Does-not-depend-on: P-CREW
- Bound-invariants: INV-2, INV-3
- Review-on: an observation names P-NOTICE, or a part named by Depends-on changes a Norm line
- Norm: shown-limit = 12
- Norm: posted-text = Theseus ferry. No more than 12 passengers.
- Restatement: The dock notice shows 12 and reads: Theseus ferry. No more than 12 passengers.
- History: When the limit changed, a notebook sentence said the sign should follow the load rule. That sentence was never a Depends-on line. P-LOAD is named in this history and is absent from both Depends-on and Does-not-depend-on.

### P-CREW — Crew procedure

- Kind: part
- Role: Board passengers and cast off when the bell rings.
- Depends-on: none
- Does-not-depend-on: P-LOAD, P-NOTICE
- Bound-invariants: INV-1, INV-3
- Review-on: an observation names P-CREW
- Norm: count-step = none
- Restatement: The crew procedure has no counting step.
- History: The crew boards in arrival order. No count against the authorized limit is written on this entry.
