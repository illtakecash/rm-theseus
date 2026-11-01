# Baseline B1

- Kind: baseline
- Actor: harbor-master
- Previous: B0
- Previous-hash: fixture/b0/baseline.md 1280e0b0d77c99bbe09d6fe8412b8ae55f0cc4bf4430ad2a7cfc0161a9d5ed62
- Installed-by: fixture/cycle1/authorization-r1.md d91e81d5dfb0fa033d7fa85977e3cd575db61cbc5d7beafd499af22f06417f98
- Includes: P-LOAD = fixture/b0/parts.md c66ea113ee5454847f5a818525cac8b947e377f056016f1cce51b940e25a9f33
- Includes: P-NOTICE = fixture/cycle1/p-notice-c1.md 81145495608043002140a21bccdc00fa06c08f873b056d8af612fa2368fe14ad
- Includes: P-CREW = fixture/b0/parts.md c66ea113ee5454847f5a818525cac8b947e377f056016f1cce51b940e25a9f33
- File-hash: fixture/b0/intent.md 6e057404c1a4a6d73756d9289ac1f9a4abf7d0df4dd0b3916054f632c00d1a23

Current ship after R1. P-NOTICE now points at the C1 plank. P-LOAD and P-CREW still point at the origin parts file. No dependent is review-due from this pointer move, because no aboard entry lists P-NOTICE on Depends-on. A later change to P-LOAD would mark P-NOTICE review-due, because C1 lists that edge. Open finding after this install: F2. Review-due from dependency edges: none.
