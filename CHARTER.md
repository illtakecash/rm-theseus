# Theseus — Founding Charter

Status: **Proposed baseline; awaiting human ratification**  
Origin: Scott's discussion of architectural drift and the Ship of Theseus, 2026-11-01.

## Purpose

Detect when agents optimize an inherited implementation while losing sight of the original goals. Preserve access to alternatives that accumulated implementation context may suppress.

**Replace the planks. Preserve the purpose.**

## Hard invariants

1. **Portable by construction.** Core protocol, assessment schema, and evaluation methodology must be independent of project, language, repository layout, agent/model vendor, hosting environment, and version-control provider.
2. **Two complementary perspectives.** The implementing agent evaluates with full project context; a separately executed evaluator initially sees only authorized intent, proposed change, and expected outcomes.
3. **Actual isolation.** Independence requires controlled information access and separately sealed initial assessments. Prompting an agent to ignore context is not isolation.
4. **No silent purpose mutation.** Implementation decisions cannot redefine original intent. Authorized intent revisions are versioned and provenance-linked, never silently overwritten.
5. **No invented authority.** Distinguish ratified goals, inferred goals, superseded goals, and missing/contradictory goals. Missing baseline means insufficient evidence, not a fabricated score.
6. **Disagreement is data.** Preserve both assessments, alternatives, unresolved differences, and evidence exchanged after initial sealing. No forced consensus.
7. **Auditable execution.** Record actor/agent, session, model/toolchain when available, task and authorization, input hashes, isolation claims and verification, validations, parent artifacts, and decisions.
8. **No self-exemption.** Changes to Theseus itself must undergo the same review.
9. **Advisory reasoning, enforceable evidence.** Automated checks validate artifacts, isolation attestations, and required approvals; they do not claim to prove correctness of an LLM's judgment.
10. **Adapters at the edge.** Platform integration belongs in adapters, not the portable protocol.

## Required review sequence

1. Resolve and pin an authorized intent baseline, including historical original intent and authorized revisions.
2. Package the proposed change and intended outcomes without implementation-history rationale.
3. Run and seal the independent evaluator in an isolated context.
4. Run and seal the contextual assessment with full project history. Neither initial assessment may read the other's result.
5. Compare assumptions, alternatives, objective alignment, implementation constraints, and contradictions.
6. Permit targeted evidence exchange, explicitly labeling facts versus justification.
7. Preserve reconciliation and unresolved dissent; request authorization when required.

The two initial assessments may run concurrently; order is not a source of authority.

## Review triggers

Consequential decisions: domain ontology, persistence, architecture boundaries, authority, contracts, major dependencies, irreversible migrations, or changes affecting original invariants. Ordinary implementation changes may use a lighter contextual check. Projects may add triggers but must not weaken the portable core.

## Acceptance criteria

- Install unchanged in consulting-os, Atlas, and an unrelated project; only intent packages and adapters vary.
- Run on local and cloud agents without changing core logic.
- Explicitly fail independence verification when execution isolation cannot be established.
- Detect the consulting-os regression: governing the inherited Python implementation is not equivalent to making implementations replaceable.
- Preserve disagreement and provenance across asynchronous sessions.
- Catch an analogous architectural drift introduced into Theseus itself.

## Non-goals (initial scope)

- Replacing project governance or human authorization.
- Mandating a particular language, runtime, repository host, or agent framework.
- Guaranteeing discovery of every unproposed alternative.
- Turning drift assessments into an opaque scalar score.
- Generalizing immediately into all forms of organizational or research drift.

## Authority

This charter is a proposed founding document, **not self-ratifying**. The project owner must explicitly approve the baseline before agents may treat it as authoritative. Subsequent changes require recorded authorization and a retained history of prior baselines.
