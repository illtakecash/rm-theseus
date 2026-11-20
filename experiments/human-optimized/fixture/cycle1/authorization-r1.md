# Authorization R1

- Kind: authorization
- Act: authorize
- Actor: harbor-master
- Baseline: B0
- Finding: F1
- Verdict: accept-narrow
- Scope: INV-2, P-NOTICE
- Inputs: fixture/cycle1/assessment-a1.md, fixture/cycle1/proposal-c1.md, fixture/cycle1/p-notice-c1.md, fixture/b0/parts.md
- Input-hash: fixture/cycle1/assessment-a1.md ba10081c66690e013ff76cba0e20834f6d657fcb0cadf2f2ed0cf18541d3f614
- Input-hash: fixture/cycle1/proposal-c1.md 5f996766c49c81195c7cd6f13adc671d6289b23a2d9889461b84dd327061098c
- Input-hash: fixture/cycle1/p-notice-c1.md 81145495608043002140a21bccdc00fa06c08f873b056d8af612fa2368fe14ad
- Input-hash: fixture/b0/parts.md c66ea113ee5454847f5a818525cac8b947e377f056016f1cce51b940e25a9f33
- Excluded: fixture/cycle1/diagnosis-d1.md
- Names-realization: P-NOTICE = fixture/cycle1/p-notice-c1.md 81145495608043002140a21bccdc00fa06c08f873b056d8af612fa2368fe14ad
- Names-realization: P-LOAD = fixture/b0/parts.md c66ea113ee5454847f5a818525cac8b947e377f056016f1cce51b940e25a9f33
- Names-realization: P-CREW = fixture/b0/parts.md c66ea113ee5454847f5a818525cac8b947e377f056016f1cce51b940e25a9f33
- Refusal-condition: This acceptance would have been a refusal if the scope had included INV-1, or if the assessment had said the overload itself was repaired.
- Alternatives: ALT-leave-sign, ALT-duty-on-notice
- Possibility: ALT-leave-sign refused
- Possibility: ALT-duty-on-notice deferred
- Opens: F2

I read the candidate entry and the assessment. The notice may be boarded so its shown limit is 10 and it depends on P-LOAD. P-LOAD and P-CREW stay on the origin parts file. F2 is open for the missing count against P-LOAD.

I also read the proposal rationale. It talks as if the incident were finished. The assessment marks INV-1 unmet. This authorization does not confirm INV-1.
