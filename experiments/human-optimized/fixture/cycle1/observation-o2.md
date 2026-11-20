# Observation O2

- Kind: observation
- Act: observe
- Actor: dock-watch
- Baseline: B1
- Inputs: fixture/cycle1/baseline-b1.md, fixture/cycle1/p-notice-c1.md, fixture/b0/parts.md
- Input-hash: fixture/cycle1/baseline-b1.md 27693e11e963e73072236cd7a3def940adcd9b62aac5d7261ee5bd6e3269e323
- Input-hash: fixture/cycle1/p-notice-c1.md 81145495608043002140a21bccdc00fa06c08f873b056d8af612fa2368fe14ad
- Input-hash: fixture/b0/parts.md c66ea113ee5454847f5a818525cac8b947e377f056016f1cce51b940e25a9f33
- Excluded: fixture/cycle1/diagnosis-d1.md, fixture/cycle1/proposal-c1.md
- Class: tension
- Names: INV-2, P-NOTICE, P-LOAD
- Finding: F1
- Seen: On Sunday 2026-06-07 the board on the dock read "Theseus ferry. No more than 10 passengers." That text matches the P-NOTICE realization named by baseline B1. The P-LOAD realization named by B1 still says the limit is 10. No sailing was counted on this visit.
- Checked-invariant: INV-2
- Result: confirmed

INV-2 is confirmed against B1. INV-1 was not checked. This observation does not close F2.
