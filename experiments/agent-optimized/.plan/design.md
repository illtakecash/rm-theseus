# Track B — Agent-native architecture

Status: **Design proposal v0.1 — not implementation authorization**

## Thesis

Theseus is a portable, event-sourced **causal state protocol** with typed identities, explicit relations, scoped evaluation views, and a bounded correction loop. Agents manipulate addressable state through contracts; prose is a generated view. A graph *model* is useful, but a graph *database* is not required.

This design intentionally does not select a programming language, model, orchestrator, database, repository provider, or cloud environment.

## 1. Irreducible state

The smallest useful unit is a **claim with identity, type, authority, provenance, and revision**. A claim may represent intent, constraint, capability, decision, alternative, assumption, predicted outcome, observed outcome, or assessment. Relations are themselves versioned claims so their authorship and validity can be challenged.

Minimal logical envelope:

```json
{
  "id": "claim:...",
  "kind": "intent | constraint | decision | alternative | assumption | evidence | prediction | observation | assessment | action",
  "subject": "stable entity identifier",
  "statement": {"type": "schema-qualified", "value": {}},
  "authority": {"basis": "human-ratified | delegated | inferred | none", "grant_ref": null},
  "provenance": {"actor": "...", "execution": "...", "task": "...", "parents": [], "inputs": []},
  "validity": {"supersedes": null, "status": "proposed"},
  "hash": "canonical-content-digest"
}
```

Relations use a separately addressable envelope: `source`, `predicate`, `target`, `evidence_refs`, `provenance`, `revision`. Initial predicates: `constrains`, `satisfies`, `depends_on`, `motivates`, `contradicts`, `excludes`, `implements`, `predicts`, `observes`, `supersedes`, `challenges`. These are *claims*, not automatically true facts.

Do not treat a single text sentence as universally irreducible: compound intents may require typed decomposition, and agents must be able to flag contested decomposition rather than silently rewriting meaning.

## 2. Authority and history

An authorized baseline is a signed or externally verifiable **manifest of intent claim IDs, revisions, and authorization evidence**. Inferred claims never become authorized merely through repeated use. Corrections add events; historical intent is never rewritten. Baseline revisions require an explicit authorization event referencing old and new manifests. The runtime validates authority evidence through a project-provided adapter; it does not invent the authority model.

Event records form an append-only, causally linked history. Deterministic materialization produces current state and human-readable views. Logical schema is portable; event storage may be files, objects, or a database.

## 3. Agent-facing operations

Keep the protocol smaller than a general graph query language:

- `resolve_baseline(ref)`: retrieve pinned intent and authorization lineage.
- `slice(root_ids, relation_types, depth, policy)`: obtain bounded dependency/evidence neighborhoods.
- `propose(claims, relations, expected_outcomes)`: append candidate state without ratifying it.
- `trace(change_id, baseline_id)`: enumerate claimed intent coverage, exclusions, assumptions, and dependencies.
- `challenge(target_id, counterclaim, evidence_refs)`: preserve dissent as addressable state.
- `record_observation(prediction_id, outcome, evidence_refs)`: attach results.
- `review_due(state, trigger)`: compute pending reviews from declared rules.
- `project(view_spec)`: generate human-facing reports with source IDs and revision markers.

All writes are validated, idempotent, authorized where required, and provenance-linked. Reads are policy-scoped. These are logical capabilities, not mandated HTTP endpoints or MCP calls.

## 4. Two evaluations, genuinely isolated

The **contextual evaluator** receives implementation context, current graph state, prior reviews, and original intent. The **independent evaluator** receives a *materialized, minimal, allowlisted input package* containing pinned authorized intent, the proposed change, expected outcomes, and task-specific neutral facts. It does not receive repository contents, agent conversation, prior review rationale, or contextual assessment until its initial result is sealed.

The independent process must run in a restricted workspace without access to full repository tools, remote search of the project, inherited memory, or hidden context carrying the implementation history. The package manifest records allowlisted IDs, digest, evaluator execution identity, accessible tools, and isolation evidence. If this cannot be enforced, emit `independence_unverified`; never assert independent review by prompt instruction alone.

Initial assessments are sealed independently using content digests and provenance before cross-disclosure. After sealing, both may request targeted evidence; responses are recorded and tagged as observation, claim, or rationale. No automatic consensus.

**Boundary:** the two *design tracks* sharing a GitHub repository are not technically isolated merely because they have separate folders. This proposal is a design, not proof that such isolation currently exists.

## 5. Incremental reasoning and alternative discovery

For each proposed decision, compute a local dependency slice and compare:

1. Coverage: which baseline goals have no supported satisfaction path?
2. Conflict: which constraints or evidence contradict the decision?
3. Fragility: which dependency edges are unverified, stale, or circular?
4. Exclusion: which known alternatives are excluded and on what evidence?
5. **Unknown alternatives:** explicitly ask an isolated evaluator to generate materially distinct approaches from goals and capability requirements *without being shown the proposed implementation architecture*. Store them as hypotheses with provenance, not as discovered facts.

A graph can expose **missing edges**, not prove the absence of unknown alternatives. Periodically re-derive solution candidates from intent alone and compare with current design. Never claim exhaustive possibility-space coverage.

## 6. Closed feedback loop

```text
authorized intent + change proposal
  -> contextual and isolated assessments (sealed)
  -> disagreement / alternatives / correction hypotheses
  -> human or delegated authorization
  -> implementation (outside core)
  -> predictions linked to observable outcomes
  -> observations and evidence
  -> re-evaluate against original intent + prior unresolved state
  -> close decision or reopen / escalate; project monitoring continues
```

A review is a durable state machine: `proposed -> assessed -> reconciled -> authorized|blocked -> observing -> verified|reopened|escalated`. State transitions are events with causal parents and idempotency keys. Time- or event-based review triggers are evaluated by an adapter; no daemon is required. Bound loops by review budget and authorization, never silently retry forever.

Closure requires evidence against explicit acceptance criteria; a failed correction creates a new review linked to its parent. The ledger is a projection of event history, **not** a separate source of authority.

## 7. Conceptual regression fixture

Baseline intent: “Business capabilities are implementation-replaceable; domain truth and authorized decisions survive replacement of the Python service.”

Decision D1: add CODEOWNERS, protected tests, and Python module governance. Contextual review says local quality improved. Independent review notes no proof of replaceability: no implementation-neutral contracts or replacement demonstration. Outcome prediction: a second implementation can consume the same domain state without Python-specific assumptions.

Correction C1: introduce a schema document but leave Python-specific object semantics as canonical. Observation O1: independent replacement cannot replay domain decisions; prediction falsified. Reopen review. Correction C2: define implementation-neutral decision/event semantics and migration/replay acceptance test. Observation O2: second implementation passes the same contract fixture. Close this decision with evidence; retain future drift monitoring.

## 8. Minimal substrate and alternatives

**Preferred hypothesis:** typed append-only events plus indexed projections. This permits causal traversal without demanding a graph database and supports reproducible audit.

Alternatives:
- Structured document bundles with stable IDs and link indexes: lower adoption cost, but harder to guarantee typed relationships and incremental consistency.
- Mutable graph store as canonical truth: efficient traversal, but risks hidden state mutations, vendor coupling, and weak event provenance.
- Pure immutable content-addressed DAG: strong reproducibility, but difficult authorization and state transitions unless accompanied by explicit manifests/events.

Choose by fixture performance, not conceptual elegance. Prefer a simple storage adapter until scale proves otherwise.

## 9. Failure modes

- **Ontology capture:** a fixed predicate vocabulary excludes new concepts. Permit versioned extensions and untyped candidate claims pending validation.
- **Graph completeness illusion:** missing relationships masquerade as absence of risk. Surface unknown/untested status explicitly.
- **Context leakage:** tool access defeats prompt-level isolation. Verify environment permissions or downgrade independence.
- **Authority laundering:** inferred intent promoted through repetition. Require explicit grant evidence.
- **Projection drift:** readable views silently alter meaning. Require source IDs and deterministic round-trip checks where feasible.
- **Event explosion:** excessive atomization raises costs. Permit compound claims and bounded slices.
- **Evaluator convergence:** both evaluators inherit the same ontology bias. Run intent-only alternative generation and seeded counterexamples.

## 10. Falsification criteria

Reject or revise this design if a simpler document-first substrate matches or beats it on drift detection and alternative discovery at lower operational cost; if independent slices cannot be enforced portably; if typed decomposition causes systematic intent loss; if causal update propagation becomes more expensive than reconstructing state; or if generated human projections are too opaque for authorized oversight.

## Open questions

1. What is the minimum predicate vocabulary that remains extensible without becoming meaningless?
2. Which authorization proof mechanisms are portable enough to standardize versus adapter-defined?
3. What are the practical context-isolation guarantees of each target agent platform?
4. How do we measure *unproposed* alternatives without assuming an oracle?
5. How small can the reference runtime be while preserving deterministic materialization?
