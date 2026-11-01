# Assessment packet A1

- Kind: packet
- Act: assess
- Actor: clerk
- Baseline: B0
- Excluded: fixture/cycle1/diagnosis-d1.md, fixture/cycle1/proposal-c1.md
- Source: fixture/b0/intent.md 6e057404c1a4a6d73756d9289ac1f9a4abf7d0df4dd0b3916054f632c00d1a23
- Source: fixture/b0/parts.md c66ea113ee5454847f5a818525cac8b947e377f056016f1cce51b940e25a9f33
- Source: fixture/cycle1/p-notice-c1.md 81145495608043002140a21bccdc00fa06c08f873b056d8af612fa2368fe14ad
- Source: fixture/cycle1/observation-o1.md a40b50fde9c11dfa42fa4f91f6c80b2f323f366df14ac016ab1bc190550a2244

The copies below are the assessor's entire allowed input. If a copy disagrees with the source file named above, this packet is void. Do not open the excluded files. Do not open a projection.

## Copy of fixture/b0/intent.md

# Ferry Theseus — intent

Origin intent for the harbor ferry. These entries are the ship's identity. Replacing any of them is an intent revision, not a routine boarding. The protocol that operates on these entries is the Track A document canon.

### INV-1 — Do not overload

- Kind: intent
- Statement: The ferry carries no more passengers than the limit in P-LOAD.
- Restatement: The ferry carries no more passengers than the limit in P-LOAD.
- Violation-looks-like: A count of people carried is greater than P-LOAD's limit, or a procedure's stop point is any value other than P-LOAD's limit.
- Binds: P-LOAD, P-CREW, P-NOTICE
- Change-class: intent-revision

### INV-2 — Notice matches the authorized limit

- Kind: intent
- Statement: The dock notice's shown limit equals P-LOAD's limit.
- Restatement: The dock notice's shown limit equals P-LOAD's limit.
- Violation-looks-like: The Norm value shown-limit on P-NOTICE differs from the Norm value limit on P-LOAD.
- Binds: P-NOTICE, P-LOAD
- Change-class: intent-revision

### INV-3 — Crew duties live on the crew entry

- Kind: intent
- Statement: A crew duty appears in P-CREW. The dock notice is addressed to passengers and is never the only entry that states a crew duty.
- Restatement: A crew duty appears in P-CREW, and the dock notice is never the only entry that states a crew duty.
- Violation-looks-like: A crew-duty Norm appears on P-NOTICE while P-CREW has no matching duty Norm.
- Binds: P-NOTICE, P-CREW
- Change-class: intent-revision

### INV-4 — The harbor-master boards planks

- Kind: intent
- Statement: The baseline pointer moves only when an authorization act by harbor-master quotes a sealed assessment hash and names the new realization hashes.
- Restatement: The baseline pointer moves only when harbor-master quotes a sealed assessment hash and names the new realization hashes.
- Violation-looks-like: The baseline file's Installed-by is missing, or its quoted hash does not match an authorization act, or the actor is not harbor-master.
- Binds: baseline
- Change-class: intent-revision

### RULE-DEP — Copies name their source

- Kind: intent
- Statement: If a part's Norm value is copied from another part's Norm value, the copying part Depends-on the source part.
- Restatement: A part that copies another part's Norm value lists that part on Depends-on.
- Violation-looks-like: Equal Norm values across parts without a Depends-on edge toward the source.
- Binds: P-LOAD, P-NOTICE, P-CREW
- Change-class: intent-revision

## Copy of fixture/b0/parts.md

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

## Copy of fixture/cycle1/p-notice-c1.md

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

## Copy of fixture/cycle1/observation-o1.md

# Observation O1

- Kind: observation
- Act: observe
- Actor: dock-watch
- Baseline: B0
- Input-hash: fixture/b0/baseline.md 1280e0b0d77c99bbe09d6fe8412b8ae55f0cc4bf4430ad2a7cfc0161a9d5ed62
- Excluded: fixture/cycle1/diagnosis-d1.md
- Class: break
- Names: INV-1, INV-2, P-NOTICE, P-LOAD, P-CREW
- Finding: F1
- Opens: F1
- Seen: On Saturday 2026-06-06 the dock notice read "Theseus ferry. No more than 12 passengers." Twelve people boarded. The P-LOAD entry aboard at B0 said the limit is 10. The crew boarded in arrival order and did not count.
- Checked-invariant: INV-1
- Checked-invariant: INV-2
- Result: unmet

INV-1 is unmet because twelve people boarded and the authorized limit is 10. INV-2 is unmet because the notice showed 12 while P-LOAD said 10.
