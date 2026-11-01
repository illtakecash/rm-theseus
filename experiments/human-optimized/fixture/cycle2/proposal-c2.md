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
- Input-hash: fixture/cycle1/baseline-b1.md 191203092d4260403b80b14d5c66a38567f32f825b56478fc1f00c54864b5467
- Input-hash: fixture/cycle1/p-notice-c1.md 81145495608043002140a21bccdc00fa06c08f873b056d8af612fa2368fe14ad
- Input-hash: fixture/cycle1/authorization-r1.md 784aa9b49a88040c588eb0b1a7106ffdea21083e625c96d4c38a7c3f3394c06b
- Input-hash: fixture/cycle1/observation-o1.md a40b50fde9c11dfa42fa4f91f6c80b2f323f366df14ac016ab1bc190550a2244
- Input-hash: fixture/cycle1/observation-o2.md d7b75e953f501021120945eb6fa30b815e2b78eaa6032bf3b43abd649795dbd3
- Input-hash: fixture/cycle2/diagnosis-d2.md 4810f0b21db4c7248245513910a61a4bfe0151410fd153b2e3726ca00b848495
- Input-hash: fixture/cycle2/p-notice-c2.md 7ce37051f10c004bf267bf114de0a87599a3f1c5d99fe46cf5b2b52e184a2a36
- Excluded: none

Offer ALT-duty-on-notice, deferred by R1, as the candidate for F2. The candidate keeps shown-limit 10 and adds a crew duty whose stop rule is the notice's own number.

ALT-crew-count would change P-CREW instead, with a stop value taken from P-LOAD. It is named and not the candidate.

Differs-from is none because ALT-duty-on-notice is deferred, not yet failed. This proposal is that alternative, not a successor of a failure.

The next paragraph is rationale for the authorizer. Packet A2 excludes this whole file.

Rationale: the notice is what people look at, so one added sentence is the smallest edit that can close F2. Rewriting the crew entry can wait.
