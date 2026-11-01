# Theseus — Agent Implementation Plan

Status: **Planning only; no implementation authorization**  
Depends on: human ratification of `CHARTER.md`.

## Reconciliation with ADR 0001 (proposed, 2026-11-01)

Phase 0 below is complete and kept for history. Its two tracks produced Track A (PR #1) and Track B, and their synthesis is ADR 0001 (`docs/adr/0001-authoritative-state.md`, ratified by Scott and merged as 525ac5e). ADR 0001 answers Phase 0's representation question and fixes the Phase 1 contracts in outline. Phases 1 to 3 are now delivered by the ADR's build slices, in this order. Phase 4 integration and the full charter acceptance criteria (Atlas, an unrelated project, cloud agents, a second platform) come after the MVP and are not claimed by it.

### Gate

Nothing below starts until Scott has (1) ratified `CHARTER.md`, (2) chosen the reference language and runtime, and (3) approved opening the slice issues. Before that, only documents like this one may change, and they stay non-authoritative.

### Dependency-ordered MVP

| Step | Slice | Depends on | Acceptance check |
|---|---|---|---|
| V1 | Thin vertical slice through 1, 2, 3 (below) | gate | One scripted cycle (origin intent, finding, candidate, accept authorization, baseline install, confirming observation) replays from `log.jsonl` to `closed-confirmed`. Golden hashes are byte-stable across two runs. A one-byte edit to any record makes replay fail with `invalid_record`. Assessments are recorded `independence_unverified` and never relabelled. |
| 1 | Schema, JCS hashing, validator | V1 | Golden-hash vectors for every record kind; every ADR validity rule has a failing example. |
| 2 | Log, replay, baseline chain, `baseline_conflict` | 1 | Two heads block new boardings; a resolution citing only one head is rejected. |
| 3 | Finding fold and candidate fold | 2 | Matches Track A's derived-status table; a refused candidate leaves its finding `open`; a `stop` missing `falsifier` is rejected. |
| 4 | Renderer, packets, stale detection, `propose` parser | 1, 2 | Packet bytes that don't hash to the sealed value, or mismatched source ids, invalidate the authorization even when the renderer version matches. |
| 5 | Isolation launcher interface and local adapter | 4 | The assessor packet excludes diagnosis, rationale, and alternatives; unverifiable isolation yields `independence_unverified`. |
| 6 | Ferry fixture end to end | 1 to 5 | Narrow accept in cycle 1, failed correction in cycle 2, retry cites `differs_from`. |
| 7 | consulting-os fixture | 6 | D1, failed C1, C2, reopen, without rewriting the baseline. |
| 8 | Theseus reviews a change to itself | 1 to 7, ratified charter as origin | The ratified charter is the origin baseline; the change runs through the same validator. |

V1 is the first executable vertical slice. It proves the core loop (record, hash, log, fold) before any projection or launcher exists, and slices 1 to 3 then harden it. Owners are as in ADR 0001.

## Mission for the build agent

Design a standalone, portable architectural-drift review capability from first principles. Do **not** inherit Atlas, Maxwell, consulting-os, Cursor Cloud, or rm-coding-agents-config architecture. These are eventual consumers and test fixtures, not architectural authorities.

Before proposing a language, framework, repository structure, or orchestration engine, articulate the minimal information and execution contracts needed to satisfy the charter.

## Phase 0 — Verify intent and challenge premises

- Read `CHARTER.md`; identify ambiguity, contradictions, and missing authorization.
- State which design decisions are genuinely necessary and which are conveniences.
- Propose at least two materially distinct architectures, including (A) document-first Markdown/review/ledger orchestration and (B) agent-native typed intent, decision, evidence, and outcome objects with explicit relationships and generated human-readable views. Include a minimal protocol-first alternative with no resident service, whether as a third design or a variant.
- Treat representation as a first-class architectural decision: distinguish canonical computational state from human-facing projections. Do not assume prose, a graph database, embeddings, JSON files, or any specific storage engine is canonical before comparing alternatives.
- Test whether each representation allows agents to traverse dependencies, challenge assumptions, preserve unexplored alternatives, and update relationships without repeatedly reconstructing causal structure from narrative.
- Specify how the independent evaluator receives an enforceably restricted information subset; a shorter prompt alone is insufficient.
- For each architecture, trace a complete feedback cycle: detect -> diagnose -> propose correction -> authorize -> implement -> observe -> re-evaluate. Identify who/what initiates the next iteration and how state survives process restarts.
- Compare portability, verifiable isolation, operating cost, adoption friction, security, maintainability, machine addressability, incremental updates, and human auditability.
- Identify possibility-space contraction: which alternatives become difficult to represent, discover, or evaluate under each option? Include explicit falsification criteria and a small comparative fixture.
- Deliver a recommendation with evidence and tradeoffs, not a presumed victory for the agent-native option.
- Explicitly identify assumptions inherited from any existing projects.
- Deliver `.plan/phase-0-design-options.md`; **stop for review**. Do not write implementation code.

## Phase 1 — Specify portable contracts (after approval)

Define versioned, implementation-neutral schemas for:
- intent baseline and authorized supersession lineage
- typed identities and relationships among intent, constraints, decisions, alternatives, evidence, implementations, observations, and outcomes, if selected after Phase 0
- deterministic, traceable human-readable projections from canonical state
- review request and proposed change
- evaluator input envelope and context-access policy
- independent and contextual assessment
- evidence exchange and reconciliation
- authorization, provenance, and validation outcomes
- persistent drift-ledger entries, corrective hypotheses, expected/observed outcomes, next-review triggers, and decision closure/reopening

Specify canonical serialization and hashing, failure states (including `independence_unverified`, `baseline_missing`, `authorization_missing`), and extensibility rules. Do not equate distinct models with independent context.

## Phase 2 — Minimal reference implementation (after approval)

Build a dependency-light validator/comparator and a narrow evaluator-launch interface. Keep model and runtime adapters separate. Ensure the isolated reviewer cannot read implementation repository, previous agent conversation, or contextual assessment before sealing its first output. Validate isolation evidence rather than accepting an unverified declaration.

## Phase 3 — Closed-loop execution (after approval)

- Implement portable append-only or revision-linked drift ledger semantics, independent of storage backend.
- Carry review IDs, parent IDs, pinned baseline IDs, and unresolved findings across iterations.
- Define how corrections are proposed and authorized, and how post-implementation observations are attached.
- Compare predicted with observed outcomes, detect ineffective or harmful corrections, and automatically identify a due review without assuming a resident daemon.
- Define bounded iteration and escalation: no infinite agent loops, no silent acceptance, no unapproved implementation.
- Test a failed first correction and subsequent successful correction, plus reopening of a previously closed decision.

## Phase 4 — Integration without capture

- Integrate with `rm-coding-agents-config` as a distribution consumer, not a core dependency.
- Validate with consulting-os historical drift and an unrelated synthetic fixture.
- Demonstrate a second agent platform and a distinct execution environment without modifying core protocol or evaluation logic.
- Run Theseus against its own design changes.
- Run historical and seeded drift tests to evaluate false positives, missed drift, and evaluator convergence without collapsing all results to a scalar score.

## Required deliverables per phase

- Decisions and alternatives, including rejected alternatives and why
- Assumptions and uncertainty
- Explicit charter mapping (goal, principle, invariant, non-goal)
- Independent/contextual findings when applicable
- Provenance: agent identity, execution/session, originating task and human authorization, model/toolchain where available, validation, and parent commit/artifacts
- Tests and documented limitations
- Linked previous review, corrective action, observed result, remaining drift, and next review trigger

## Non-negotiable stop conditions

Stop and request human decision when:
- charter authority is absent or contradictory;
- a proposed solution needs project-specific core logic;
- a proposed canonical representation is chosen without comparing document-first and agent-native options;
- independent execution cannot be established;
- an implementation decision silently modifies original intent;
- the implementation plan relies on existing architecture solely because it is familiar;
- a review has no specified feedback path, observation criterion, or next trigger;
- an evaluator claims closed-loop success without checking observed outcomes.

## First exercise

Reconstruct the consulting-os episode as a test case: a competent agent improves controls around an inherited Python architecture, while the original objective was to make implementations disposable. Show how Theseus would distinguish local technical correctness from objective alignment, and what evidence would make it change its assessment. Then simulate a correction that fails to restore replaceability, feed that observation into a second review, and show how the next correction changes. The independent first pass must not inherit the previous implementation rationale.

## Initial human decision requested

Ratify or amend `CHARTER.md`, then review Phase 0 alternatives before authorizing code.
