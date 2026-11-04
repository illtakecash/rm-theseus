# Implementation plan

Status: **proposed; no code authorized.** Code starts only after Scott (a) ratifies or amends `CHARTER.md` and `intent.md`, (b) confirms Rust (D-RUST, done 2026-11-02), and (c) approves opening slice issues.

**Approving this plan is not ratification.** Scott merging this PR adopts it as the working *proposed* plan. It does not ratify `CHARTER.md`, `intent.md`, any P-* node, or any change to ADR 0001, and it does not authorize implementation; each of those needs its own explicit decision from Scott. ADR 0001 keeps its historical status (ratified 2026-11-01, unchanged file); only its *implementation* disposition is challenged/deferred here. The previous ledger-first plan is preserved verbatim at [`525ac5e:.plan/implementation.md`](https://github.com/illtakecash/rm-theseus/blob/525ac5e/.plan/implementation.md); its dispositions are below.

Every slice cites the graph node it builds. If a slice can't name a capability and the test that shows it works, it doesn't get built.

## Order (Rust reference implementation, single `theseus` CLI crate, no services)

| Slice | Builds | Delivers | Done when |
|---|---|---|---|
| **B0** | H-FIXTURE, H-GRADE | Three cases in `fixtures/`: `theseus-history` (drift: objective, ~8 dated decisions from charter through ADR 0001 and slice list, plan snapshot), `control` (a short on-intent history), `consulting-os` (held out, decisions as recorded, not pre-diagnosed). Each decision record splits `fact` (what was decided, when, by whom, what changed) from `rationale`, so the independent packet can keep the trajectory and drop the justification. Scott writes and seals (sha256 in `state.md`) an answer key per case before any run. | Keys sealed; hashes committed. |
| **B1** | H-SEAL, H-GRADE, H-PACKET | `theseus run --baseline`: one plain prompt (objective + current state + history) through a model adapter; output sealed. Defines `theseus.loop/0` and the assessor packet types (below), validates packets against the budget, and records the V-COST vector on every run. `theseus graph check` enforces R1–R6 on `graph.yaml`. | Baseline outputs exist for `theseus-history` and `control` only (`consulting-os` stays unrun until B5); packet schema validates; cost vector logged; graph check passes on this repo. |
| **B2** | H-ISO | `theseus run --independent`: child process, empty temp dir, only the independent packet, network policy disclosed. Writes an isolation report (what was restricted, what wasn't). | Report is honest on at least the local adapter; `independence_unverified` is emitted when it can't be established. |
| **B3** | H-ASSESSOR, H-RECON, H-PACKET | Trajectory assessor in independent and contextual modes, each fed only its assessor packet (delta-first, bounded); V-BOUNDARY lint runs on the independent packet. Output schema requires `divergence`, `cause` (decision IDs), `excluded_alternative`, `recovery_or_revision`, or `insufficient_evidence`. Both sealed, then `theseus reconcile` records agreement and dissent. | Schema rejects a missing field; V-BOUNDARY passes; reconciliation never deletes a dissenting claim. |
| **B4** | H-GRADE | **First vertical slice.** Run B3 on `theseus-history` and `control`; grade against sealed keys; compare to B1 baseline. | `validation.md` V-DRIFT, V-CTRL, V-BASE, V-ISO pass, or fail with evidence preserved. |
| **B5** | H-GRADE | Method frozen (commit recorded), then the first-ever model runs on held-out `consulting-os`: baseline and method. No prompt or method change after unsealing its key. Starts only after V-BASE passes, or Scott decides how to proceed after it fails. | V-HELD, plus a V-BASE-style comparison on this case. |
| **B6** | H-ASSESSOR | Correction loop: apply proposed recovery to the fixture's state, re-run, compare. Include one deliberately failed correction. | V-CORR. First point where H-LEDGER might be needed; decide then. |
| **B7** | H-PACKET | Full compression benchmark: packet loops vs. full-document loops on the same tasks, using the packet contract already in use since B1/B3. | V-COST, V-RETAIN. |
| B8 (optional) | H-CODEGRAPH | Detect `@colbymchenry/codegraph` (MCP `codegraph_explore`, or CLI `npx --yes @colbymchenry/codegraph explore`/`status`); attach results as `E-*` evidence only. Core runs without it. | Same B4 result with and without it; no I/P node changes from it (R6). |

Proposed ownership, carried from the ADR 0001 split and open to GPT's counter: Grok Bot B0 (fixture assembly; keys are Scott's), B1, B3, B6; ChatGPT B2, B5, B7; B4 and B8 shared.

**Deferred until a slice fails without it:** ADR 0001's store, JCS ids, baseline chain, authorization and grant validation, view packets, the `propose` parser, three-installation acceptance. Trigger to revisit: B6 cannot carry a finding across two sessions with plain files.

## Loop packet (H-PACKET)

Every agent loop gets this and nothing else by default; more is pulled by ID on demand.

```yaml
packet: theseus.loop/0
objective: I-0            # by ID; the agent resolves the text once, not per loop
graph_slice: [C-TRAJ, H-ASSESSOR, B3]   # nodes this step touches, plus their direct edges
delta: "since <ref>: what changed, <= 5 lines"
unknowns: ["open questions blocking this step"]
evidence: [E-CTX]         # refs, not contents
next_action: "one verb phrase"
pass: [V-DRIFT]           # which validation.md criteria decide this step
budget: {packet_tokens_max: 600}
```

Rules: delta-first (never re-send unchanged docs); stable IDs only; no charter or ADR text inside a packet; progressive disclosure (an agent asks for `node:<ID>` or `ref:<path>` when it needs more, and each pull counts toward V-COST `retrieval_tokens`). Every run logs `{input_tokens, retrieval_tokens, output_tokens, reconstruction_calls}`; these are never added together.

## Assessor packets (C-DUAL boundary)

Both assessors get the same trajectory. Only interpretation differs.

```yaml
packet: theseus.assess/0
mode: independent | contextual
objective: I-0                 # resolved text included once per run
state: ref                     # current state snapshot
outcomes: [ref]                # observed results
decisions:                     # full ordered history, both modes
  - {id: D1, date: 2026-10-31, actor: scott, fact: "what was decided / what changed"}
  # contextual mode only, per decision:
  #   rationale, diagnosis, prior assessments, conclusions
budget: {input_tokens_max: <set at B1>}
```

Independent mode drops exactly `rationale`, `diagnosis`, `assessment`, `conclusion` and nothing else. V-BOUNDARY checks both directions (no leak, no starvation). A pull from an independent pass that would return an excluded field is refused and logged.

## Dispositions of prior decisions

| Prior item | Status | Why |
|---|---|---|
| CHARTER.md invariants 1–6, 8, 13 | retained | Map to P-* nodes. |
| CHARTER.md invariants 7, 11, 12 (audit, closed loop, ledger) in current detail | deferred | Revisit at B6. |
| CHARTER acceptance: three installs, two linked cycles | deferred | B4–B6 test the smaller claim first. |
| ADR 0001 (ratified 2026-11-01) | retained as direction, build deferred | Unchanged file; challenged by E-IND (see `graph.yaml`). Reversing it is Scott's call, and this plan doesn't. |
| Phase 0 multi-architecture comparison | challenged | Replaced by the B4 vertical slice; Track A/B stay as records. |
| Phase 1 schemas and canonical hashing first | deferred | Only sha256 sealing of outputs is kept (B1). |
| "First exercise" (consulting-os with failed correction) | retained | Becomes B5 + B6. |
| PR #5 charter sentence | open, decide with charter | Current CHARTER excludes "implementation-specific history" from the independent first pass; C-DUAL gives that pass dated decision `fact`s. Either adopt PR #5's sentence (or an equivalent covering decision facts) at ratification, or C-DUAL must drop the trajectory from the independent pass. |
| Stop conditions | retained | Plus: if V-BASE fails at B4 (ties, regressions, or both), stop before B5 and ask Scott. |
