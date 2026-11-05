# Projection of B0

- Kind: projection
- Source-hash: fixture/b0/intent.md 6e057404c1a4a6d73756d9289ac1f9a4abf7d0df4dd0b3916054f632c00d1a23
- Source-hash: fixture/b0/parts.md c66ea113ee5454847f5a818525cac8b947e377f056016f1cce51b940e25a9f33
- Non-authoritative: true

Discard this file when either source hash does not match the bytes. If a row disagrees with a labeled line in those files, the labeled line wins and this projection is not an input to any act.

| Anchor | Kind | Depends-on | Norm |
| --- | --- | --- | --- |
| INV-1 | intent |  |  |
| INV-2 | intent |  |  |
| INV-3 | intent |  |  |
| INV-4 | intent |  |  |
| RULE-DEP | intent |  |  |
| P-LOAD | part | none | limit=10 |
| P-NOTICE | part | none | shown-limit=12; posted-text=Theseus ferry. No more than 12 passengers. |
| P-CREW | part | none | count-step=none |
