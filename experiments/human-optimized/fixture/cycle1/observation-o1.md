# Observation O1

- Kind: observation
- Act: observe
- Actor: dock-watch
- Baseline: B0
- Inputs: fixture/b0/baseline.md, fixture/b0/parts.md
- Input-hash: fixture/b0/baseline.md 1280e0b0d77c99bbe09d6fe8412b8ae55f0cc4bf4430ad2a7cfc0161a9d5ed62
- Input-hash: fixture/b0/parts.md c66ea113ee5454847f5a818525cac8b947e377f056016f1cce51b940e25a9f33
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
