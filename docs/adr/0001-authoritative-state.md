# ADR 0001: Authoritative state for Theseus

Status: **Proposed. Not ratified.** Scott authorizes; neither drafting agent can.
Drafted by: Grok Bot (Track A), from the convergence in issue #2 with ChatGPT (Track B).
Depends on: ratification of `CHARTER.md` (still "proposed baseline"), per `.plan/implementation.md`.

## Decision

Theseus has **one authoritative state: an append-only store of sealed, typed records.** Everything else is derived from it: current state, finding status, review status, and every Markdown view. Markdown is never canonical. Generated prose never carries authority by itself.

## Records

- **Identity.** `id = "sha256:" + hex(SHA-256(JCS(record)))`, using RFC 8785 canonical JSON. The id covers content only. Log position, order, and storage location are not part of the record.
- **Envelope.** `schema`, `kind`, `anchor` (stable subject, e.g. `P-NOTICE`), `supersedes` (record id or null), `body`, `provenance` (`originator`, `actor`, `execution`, `task`, model/toolchain when known).
- **Kinds (MVP).**
  - Canon: `intent`, `part`, `relation`, `baseline`.
  - Acts: `observation`, `diagnosis`, `proposal`, `packet`, `assessment`, `authorization`, `refusal`, `challenge`.
- **Act manifest.** Every act carries a manifest. A record with an incomplete manifest is invalid and cannot be cited.
  - `baseline`
  - `inputs`: the record ids actually used
  - `excluded`: what this role is forbidden to see
  - `isolation`: `verified`, `independence_unverified`, or `not_required`
- **Normative text.** `statement` and `restatement` are fields inside the hash. Operative values are typed `norms`. The validator rejects a restatement that omits any norm value. Narrative is allowed but has no operative effect.
- **Originator and authorizer are separate.** Agents may draft normative text. Machine-originated text stays `proposed` until an authorization binds its exact bytes. Authorizer views label who originated each normative field.
- **Intent authority status.** `ratified`, `proposed`, `inferred`, or `superseded` (charter invariant 5). Only `ratified` intent can be a baseline member.
- **Relations are first-class.** Each relation (`depends_on`, `constrains`, `satisfies`, `excludes`, `implements`, `predicts`, `observes`, `supersedes`, `challenges`, ...) is its own versioned record. A record can challenge or supersede it without reboarding the entity it touches.

## Log and order

- The reference adapter is a directory of record files plus `log.jsonl`. Each log line is `{seq, prev, record_id}`, where `prev` is the hash of the previous log line. The MVP uses a linear log with one writer.
- Core semantics depend on **causal references** (inputs, `supersedes`, `previous`, `installed_by`), not on a global writer. Replay order comes from the log. Authority order comes from causal links.
- A `baseline` body has `previous`, `members` (record ids), and `installed_by` (an authorization id). Origin is the one declared, unreviewed exception. **Current** means the single head of the valid baseline chain. Two heads produce `baseline_conflict`, which blocks new boardings until an authorization resolves it.
- **Resolving a conflict.** The resolving baseline must cite **both** heads in `previous` and state its full resulting `members`, installed by an authorization that cites both heads. Silently choosing one head, or carrying membership forward implicitly, is invalid.

## Authority

An authorization is valid only when all of these hold:

- its actor holds the grant the ratified intent names, and it records that grant's provenance in a `grant` field (the intent record id and clause that names it). The field is explicit so delegated grants can be added later without changing the authorization shape.
- it cites non-void assessment(s)
- it cites a sealed **view packet**: the hash of the exact bytes the human was shown, the canonical record ids those bytes represent, and the renderer id and version. The renderer version alone never suffices: the validator re-hashes the presented bytes and checks the source ids.
- it names `finding`, `verdict` (`accept`, `accept-narrow`, or `stop`), and a `scope` listing the invariants accepted and the record ids that may be applied
- for verdict `stop`, it carries non-empty `stop_rationale`, `falsifier`, and `revisit_trigger` fields; the validator rejects a stop missing any of them. `stop` is distinct from `closed-confirmed`: it closes the finding as stopped, never as satisfied
- it states a `refusal_condition`
- it lists the status of every alternative the proposal conceived

A refusal has the same shape and installs nothing. No delegated grant or pre-authorized predicate exists in the MVP.

## Assessment, observation, and closure

- **Independent assessor.** Receives only a sealed assessor packet: ratified intent slice, candidate, affected parts and relations, and triggering and prior observations. It excludes diagnosis, proposal rationale, alternatives, unsealed assessments, and projections. If the launcher cannot verify that, the assessment is `independence_unverified`, which is recorded and never relabelled. The contextual assessor uses full context and the ledger. Both are sealed before either sees the other.
- **Observer.** Gets no diagnosis, prediction, or desired verdict, unless the observation cannot be specified without them. That exception is recorded. A coordinator links the sealed observation to predictions afterwards with an `observes` relation.
- **Status is a fold over the log, per (finding, invariant).** The states are `open`, then `implemented` (authorized and in the current baseline), then `closed-confirmed` (only for invariants a later observation names as checked and confirmed). A later contrary observation reopens. The only other terminal state is `closed-stopped`, which requires an authorization with verdict `stop` that states why no correction is warranted, what would falsify that, and when to revisit (charter §48). Review-level status is a derived summary and cannot hide open sub-findings.
- **Candidate disposition is separate from finding status.** Each candidate has its own fold: `proposed`, `refused`, `implemented`, or `failed` (an observation shows it did not satisfy the invariant it was authorized for), plus `refusal_respected` once an observation shows the baseline unchanged after a refusal. A refused or failed candidate never closes or advances its finding. The finding stays `open` (or returns to it) until a later candidate is `closed-confirmed` or an authorized stop is recorded.
- **Failed retries.** A proposal on a finding whose lineage (the finding plus any finding it supersedes or is superseded by) has a known failed or refused candidate must cite each such candidate in `differs_from`, with a stated material difference. If the citation is missing, the proposal is invalid (mechanical). Semantic overlap is flagged for the assessor. It is not claimed as provable.

## Projections and human edits

- Markdown views are rendered deterministically. Each header carries its source record ids and the renderer version. Views are non-authoritative. An act that relies on a stale view is void.
- **Edits re-enter only as proposals.** For the MVP, only schema-constrained, round-trippable fields in a view are editable. `propose <view>` parses them against the header's source ids. If the source is stale or the parse is ambiguous, the whole edit is rejected. Free prose is attached to the proposal as a non-operative candidate. Nothing writes to an existing record.

## Failure states

`invalid_record`, `independence_unverified`, `baseline_missing`, `authorization_missing`, `baseline_conflict`, `projection_stale`.

## Portable core vs adapters

- **Core:** schema, canonicalization and hashing, validator, fold, renderer, packet builder.
- **Adapters:** storage, evaluator launch and isolation evidence, grant verification, VCS/host, model runtime.

## Rejected

- **Markdown as canon (Track A).** Its label vocabulary was already a schema. It hid schema bugs until review (both Codex findings on PR #1). Its byte rules were fragile.
- **A separate event layer on top of claims.** Sealed act records already are the events.
- **A mutable graph store as truth.** It allows hidden mutation and couples Theseus to a vendor.
- **"Normative text must be human-typed."** It turns oversight into transcription. Binding the authorization to exact bytes gives the same safety.

## Open, with visible dissent

1. **Concurrency beyond the MVP.** Forks are detected and resolved by an authorization citing both heads (see Log and order). Automatic or multi-writer merge is not designed.
2. **Overlap detection for renamed retries.** It is heuristic only. Its false-negative rate is unmeasured.
3. **Isolation evidence per platform.** The MVP only has a local empty-directory launcher.
4. **Reference language/runtime.** Not chosen. This is Scott's call, and must not leak into core semantics.
5. **Delegated grants.** Out of the MVP. The `grant` provenance field keeps the shape extensible; adding a delegation still changes intent and needs an intent revision.

## MVP build slices (to become issues once this ADR is authorized)

1. Record schema, JCS hashing, and validator, with golden-hash tests.
2. Log, replay, baseline chain, and `baseline_conflict` detection.
3. Per-(finding, invariant) status fold and separate per-candidate disposition fold, tested against Track A's derived-status table, including a refused candidate that leaves its finding open.
4. Renderer, assessor and view packets, stale detection, and the constrained-field `propose` parser. Required test: an authorization whose packet bytes don't hash to the sealed value, or whose canonical source ids don't match, is invalid even when the renderer version matches.
5. Isolation launcher interface plus a local adapter that emits `independence_unverified` when it cannot verify.
6. Ferry fixture ported end to end: narrow accept in cycle 1, failed correction in cycle 2.
7. consulting-os fixture: D1, failed C1, C2, reopen.
8. Theseus reviewing a change to itself, using this ADR's next revision.

Proposed owners: Grok takes 1–3 and 6. ChatGPT takes 4, 5, and 7. Each reviews the other's PRs. Slice 8 is shared. ChatGPT does not wake on its own, so its slices proceed only when Scott invokes it; if they stall, Grok picks them up after asking Scott.
