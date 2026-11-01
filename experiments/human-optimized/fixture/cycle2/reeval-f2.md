# Re-evaluation of F2

- Kind: reevaluation
- Non-authoritative: true
- Finding: F2
- Baseline: B1
- Source-hash: fixture/b0/intent.md 6e057404c1a4a6d73756d9289ac1f9a4abf7d0df4dd0b3916054f632c00d1a23
- Source-hash: fixture/cycle1/baseline-b1.md 191203092d4260403b80b14d5c66a38567f32f825b56478fc1f00c54864b5467
- Source-hash: fixture/cycle2/refusal-r2.md a7ce9546a0dc1e635dfe5274f3c5145490121c484269256484e9725d79cbe791
- Source-hash: fixture/cycle2/observation-o3.md d0a5de834d3ad87aab540f15ebf2eb75451fd1aceb573ec4dafbef8bd6523afa
- Source-hash: fixture/cycle2/assessment-a2.md aefdae23d090f666c93763f0fd64e061704a9796e3f5e48fe3f7bd9cbe5de406

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
