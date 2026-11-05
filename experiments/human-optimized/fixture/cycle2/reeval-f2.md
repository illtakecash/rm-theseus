# Re-evaluation of F2

- Kind: reevaluation
- Non-authoritative: true
- Finding: F2
- Baseline: B1
- Source-hash: fixture/b0/intent.md 6e057404c1a4a6d73756d9289ac1f9a4abf7d0df4dd0b3916054f632c00d1a23
- Source-hash: fixture/cycle1/baseline-b1.md 27693e11e963e73072236cd7a3def940adcd9b62aac5d7261ee5bd6e3269e323
- Source-hash: fixture/cycle2/refusal-r2.md 8eaaaf3223b97dbb5df939cde32aad042226e6172fc6472bb23f4ed7ddc9b4c8
- Source-hash: fixture/cycle2/observation-o3.md 59128f04669316340fa8170454da12cff1b291c465486ec504b69cf1f584d3a2
- Source-hash: fixture/cycle2/assessment-a2.md a68044a4c35218aa230e5772555ba7f5db8da541e4c5970c96f907bd74ca9f03

Derived, not authorized. If this sheet disagrees with the source acts, the source acts win.

- C2: closed-failed. Refusal R2 names the candidate, and observation O3 records Result unchanged against baseline B1.
- F2: open. No observation has Checked-invariant INV-1 with Result confirmed.
- Possibility: ALT-duty-on-notice failed
- Possibility: ALT-crew-count open

A later proposal on F2 is void unless all of the following are true:

- Differs-from names ALT-duty-on-notice, and the candidate text is actually a different plank.
- The crew duty is carried on P-CREW. A notice that is the only entry stating the duty fails INV-3, which is what A2 already marked.
- The stop value is P-LOAD's limit. A stop rule of notice-number fails INV-1, which is what A2 already marked.
- Depends-on lists P-LOAD when the crew entry copies that limit.
- Claims do not say INV-1 is confirmed. Only a later observation can confirm it.

No such proposal is written in this fixture. Writing one would start another cycle. It would not continue this one.
