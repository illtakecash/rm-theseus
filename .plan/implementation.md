# Theseus — Agent Implementation Plan

Status: **Planning only; no implementation authorization**  
Depends on: human ratification of `CHARTER.md`.

## Mission for the build agent

Design a standalone, portable architectural-drift review capability from first principles. Do **not** inherit Atlas, Maxwell, consulting-os, Cursor Cloud, or rm-coding-agents-config architecture. These are eventual consumers and test fixtures, not architectural authorities.

Before proposing a language, framework, repository structure, or orchestration engine, articulate the minimal information and execution contracts needed to satisfy the charter.

## Phase 0 — Verify intent and challenge premises

- Read `CHARTER.md`; identify ambiguity, contradictions, and missing authorization.
- State which design decisions are genuinely necessary and which are conveniences.
- Propose at least two materially distinct architectures, including a minimal protocol-first alternative with no resident service.
- Compare portability, verifiable isolation, operating cost, adoption friction, security, and maintainability.
- Explicitly identify assumptions inherited from any existing projects.
- Deliver `.plan/phase-0-design-options.md`; **stop for review**. Do not write implementation code.

## Phase 1 — Specify portable contracts (after approval)

Define versioned, implementation-neutral schemas for:
- intent baseline and authorized supersession lineage
- review request and proposed change
- evaluator input envelope and context-access policy
- independent and contextual assessment
- evidence exchange and reconciliation
- authorization, provenance, and validation outcomes

Specify canonical serialization and hashing, failure states (including `independence_unverified`, `baseline_missing`, `authorization_missing`), and extensibility rules. Do not equate distinct models with independent context.

## Phase 2 — Minimal reference implementation (after approval)

Build a dependency-light validator/comparator and a narrow evaluator-launch interface. Keep model and runtime adapters separate. Ensure the isolated reviewer cannot read implementation repository, previous agent conversation, or contextual assessment before sealing its first output. Validate isolation evidence rather than accepting an unverified declaration.

## Phase 3 — Integration without capture

- Integrate with `rm-coding-agents-config` as a distribution consumer, not a core dependency.
- Validate with consulting-os historical drift and an unrelated synthetic fixture.
- Demonstrate a second agent platform and a distinct execution environment without modifying core protocol or evaluation logic.
- Run Theseus against its own design changes.

## Required deliverables per phase

- Decisions and alternatives, including rejected alternatives and why
- Assumptions and uncertainty
- Explicit charter mapping (goal, principle, invariant, non-goal)
- Independent/contextual findings when applicable
- Provenance: agent identity, execution/session, originating task and human authorization, model/toolchain where available, validation, and parent commit/artifacts
- Tests and documented limitations

## Non-negotiable stop conditions

Stop and request human decision when:
- charter authority is absent or contradictory;
- a proposed solution needs project-specific core logic;
- independent execution cannot be established;
- an implementation decision silently modifies original intent;
- the implementation plan relies on existing architecture solely because it is familiar.

## First exercise

Reconstruct the consulting-os episode as a test case: a competent agent improves controls around an inherited Python architecture, while the original objective was to make implementations disposable. Show how Theseus would distinguish local technical correctness from objective alignment, and what evidence would make it change its assessment.

## Initial human decision requested

Ratify or amend `CHARTER.md`, then review Phase 0 alternatives before authorizing code.
