# Track B — Self-evaluation

Status: **Design-stage assessment; no implementation validation**

## Criteria and evidence

| Criterion | Design assessment | Evidence / limitation |
| --- | --- | --- |
| Portability | Plausible | Logical operations and schema separated from storage/runtime; not exercised across platforms |
| Genuine isolation | Specified, not demonstrated | Allowlisted package and restricted execution required; real platform permissions untested |
| Intent authority | Strong conceptual coverage | Baseline manifest, explicit grants, immutable revisions; authorization adapter not designed |
| Causal traceability | Strong conceptual coverage | Addressable relations, linked events, evidence and parent IDs |
| Machine addressability | Strong | Stable typed IDs and bounded traversal operations |
| Incremental updates | Plausible | Event projections and local slices; performance unknown |
| Human auditability | Conditional | Generated projections with IDs; actual comprehension untested |
| Possibility-space coverage | Limited by construction | Intent-only alternative generation can broaden search, cannot prove completeness |
| Feedback closure | Strong specification | Predicted/observed outcomes and reopening; no runtime evidence |
| Operational cost | Unknown | Atomization, projections, isolation and multiple model runs may be expensive |
| Integration friction | Unknown | Legacy projects may lack explicit authorized intent |
| Self-review | Specified | Same protocol can review its own changes; no execution yet |

## Known weaknesses

1. Typed ontology may silently restrict what agents can express. Extension support alone does not eliminate bias.
2. Event-sourcing may be unnecessary complexity for tiny projects.
3. Enforcing independent evaluator isolation across platforms is likely the hardest deployment constraint.
4. Treating every meaningful statement as a claim risks high token and storage overhead.
5. The design is not independently reviewed; this assessment is by its author.
6. The author saw shared instructions that identify both tracks, but has not read the human track's design artifacts. Repository access is not technically scoped, so track independence is **unverified**.

## What would disprove this design

- A document-first system finds the same seeded drift and unconsidered alternatives with materially less context, latency, and operational complexity.
- Typed decomposition changes the meaning of goals or loses important nuance at a rate unacceptable for authorization.
- Restricted independent evaluation cannot be realized in supported environments.
- Incremental dependency updates are more costly or error-prone than re-reading compact project documents.
- Human reviewers cannot reliably verify the meaning of projected intent and authorization history.

## Unresolved questions

- Appropriate minimum event/claim granularity.
- How to test counterfactual design coverage without privileged knowledge.
- Whether a persistent index is necessary or derivable on demand.
- Which model-independent invariants can be validated mechanically.
- How to bound recursive evaluation cost while retaining meaningful correction.
