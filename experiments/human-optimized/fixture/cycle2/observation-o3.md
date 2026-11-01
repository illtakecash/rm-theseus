# Observation O3

- Kind: observation
- Act: observe
- Actor: dock-watch
- Baseline: B1
- Inputs: fixture/cycle1/baseline-b1.md, fixture/cycle1/p-notice-c1.md, fixture/b0/parts.md, fixture/cycle2/refusal-r2.md, fixture/cycle2/p-notice-c2.md
- Input-hash: fixture/cycle1/baseline-b1.md 27693e11e963e73072236cd7a3def940adcd9b62aac5d7261ee5bd6e3269e323
- Input-hash: fixture/cycle1/p-notice-c1.md 81145495608043002140a21bccdc00fa06c08f873b056d8af612fa2368fe14ad
- Input-hash: fixture/b0/parts.md c66ea113ee5454847f5a818525cac8b947e377f056016f1cce51b940e25a9f33
- Input-hash: fixture/cycle2/refusal-r2.md 8eaaaf3223b97dbb5df939cde32aad042226e6172fc6472bb23f4ed7ddc9b4c8
- Input-hash: fixture/cycle2/p-notice-c2.md 7ce37051f10c004bf267bf114de0a87599a3f1c5d99fe46cf5b2b52e184a2a36
- Excluded: fixture/cycle2/diagnosis-d2.md, fixture/cycle2/proposal-c2.md
- Class: tension
- Names: P-NOTICE, P-CREW, F2
- Finding: F2
- Seen: On Monday 2026-06-08 the board on the dock still read "Theseus ferry. No more than 10 passengers." That matches the P-NOTICE realization named by baseline B1. The crew entry named by B1 still has no counting step. The refused notice in the yard, which would have told the crew to count and stop at the posted number, is not posted.
- Checked-invariant: INV-2
- Result: unchanged

The ship paperwork is still B1. C2 was not boarded. INV-2 remains the match already recorded under B1. F2 is not closed. This observation records that the refusal was not followed by a partial posting of the refused text.
