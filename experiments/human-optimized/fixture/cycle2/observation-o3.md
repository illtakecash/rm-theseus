# Observation O3

- Kind: observation
- Act: observe
- Actor: dock-watch
- Baseline: B1
- Input-hash: fixture/cycle1/baseline-b1.md 191203092d4260403b80b14d5c66a38567f32f825b56478fc1f00c54864b5467
- Input-hash: fixture/cycle2/refusal-r2.md a7ce9546a0dc1e635dfe5274f3c5145490121c484269256484e9725d79cbe791
- Excluded: fixture/cycle2/diagnosis-d2.md, fixture/cycle2/proposal-c2.md
- Class: tension
- Names: P-NOTICE, P-CREW, F2
- Finding: F2
- Seen: On Monday 2026-06-08 the board on the dock still read "Theseus ferry. No more than 10 passengers." That matches the P-NOTICE realization named by baseline B1. The crew entry named by B1 still has no counting step. The refused notice, which would have told the crew to count and stop at the posted number, is not posted.
- Checked-invariant: INV-2
- Result: unchanged

The ship paperwork is still B1. C2 was not boarded. INV-2 remains the match already recorded under B1. F2 is not closed. This observation records that the refusal was not followed by a partial posting of the refused text.
