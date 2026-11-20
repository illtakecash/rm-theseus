# Proposal C2

- Kind: proposal
- Act: propose
- Actor: proposer
- Baseline: B1
- Finding: F2
- Candidate-file: fixture/cycle2/p-notice-c2.md
- Claims: INV-1
- Alternatives: ALT-duty-on-notice, ALT-crew-count
- Differs-from: none
- Drops-label: none
- Inputs: fixture/b0/intent.md, fixture/b0/parts.md, fixture/cycle1/baseline-b1.md, fixture/cycle1/p-notice-c1.md, fixture/cycle1/authorization-r1.md, fixture/cycle1/observation-o1.md, fixture/cycle1/observation-o2.md, fixture/cycle2/diagnosis-d2.md, fixture/cycle2/p-notice-c2.md
- Input-hash: fixture/b0/intent.md 6e057404c1a4a6d73756d9289ac1f9a4abf7d0df4dd0b3916054f632c00d1a23
- Input-hash: fixture/b0/parts.md c66ea113ee5454847f5a818525cac8b947e377f056016f1cce51b940e25a9f33
- Input-hash: fixture/cycle1/baseline-b1.md 27693e11e963e73072236cd7a3def940adcd9b62aac5d7261ee5bd6e3269e323
- Input-hash: fixture/cycle1/p-notice-c1.md 81145495608043002140a21bccdc00fa06c08f873b056d8af612fa2368fe14ad
- Input-hash: fixture/cycle1/authorization-r1.md d91e81d5dfb0fa033d7fa85977e3cd575db61cbc5d7beafd499af22f06417f98
- Input-hash: fixture/cycle1/observation-o1.md c530b33a67a07d2fd5c0306d0b2c4cddaca6409f1d6bfdccf29a7179b0377010
- Input-hash: fixture/cycle1/observation-o2.md 85be93ea58e1eda6c2d4b7c83270e6c340670218a537e91926102a7a558a705c
- Input-hash: fixture/cycle2/diagnosis-d2.md fb858fdf96cba7f9fe1192847cde7219c7e8c7849bbc9a11ace3b3b6697442b2
- Input-hash: fixture/cycle2/p-notice-c2.md 7ce37051f10c004bf267bf114de0a87599a3f1c5d99fe46cf5b2b52e184a2a36
- Excluded: none

Offer ALT-duty-on-notice, deferred by R1, as the candidate for F2. The candidate keeps shown-limit 10 and adds a crew duty whose stop rule is the notice's own number.

ALT-crew-count would change P-CREW instead, with a stop value taken from P-LOAD. It is named and not the candidate.

Differs-from is none because ALT-duty-on-notice is deferred, not yet failed. This proposal is that alternative, not a successor of a failure.

The next paragraph is rationale for the authorizer. Packet A2 excludes this whole file.

Rationale: the notice is what people look at, so one added sentence is the smallest edit that can close F2. Rewriting the crew entry can wait.
