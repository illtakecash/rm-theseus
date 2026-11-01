# Track A — Self-evaluation

Status: Complete

This evaluation walks the criteria named in this file's original skeleton. There is no aggregate score. Evidence is the design text and the fixture documents. Unknowns are stated with the criterion they belong to.

The evaluator is the same session that wrote the design (see provenance). Under this design's own rules, that means this file is proposer commentary. It is not a sealed assessment. A packet-only second context was not run.

## Criteria and evidence

### Portability

The canon is UTF-8 Markdown and SHA-256. The fixture names `sha256sum` or any equivalent as the clerk's hash, and it names no runtime, framework, or service. A current-ship audit can be done by reading the baseline file and the realizations it includes. Hash verification needs a SHA-256 implementation; a paper copy of the prose can be read without one and cannot be checked against the seal log without one.

Evidence: `.plan/design.md` sections Canonical representation and Assessment (sealing); `fixture/README.md` runbook.

Unknown: whether ordinary editors will preserve the byte rules (LF, single trailing newline, no trailing spaces) without a human noticing. The design treats a byte change as a different file, which is correct and easy to trip over.

Residual: portability of the prose is high. Portability of the seals depends on a hash tool and on byte discipline.

### Genuine isolation

The protocol's isolation claim is an input claim. The assessor manifest may name the packet and nothing else. The packet's excluded list names the diagnosis and the proposal. A known violation voids the assessment. Intent revisions ask for two contexts. Ordinary boarding asks for one.

Evidence: the exclusion lists on `fixture/cycle1/packet-a1.md` and `fixture/cycle2/packet-a2.md`, the assessments' input lines, and the design's void rules. The fixture README tells a later person to copy one packet into an empty directory.

What this session actually did is weaker than that claim. One author wrote the diagnoses and the example assessments in one context. The checkout contains the rest of the repository. Isolation here is a written procedure, and this phase has no access-control boundary. Provenance records a separate metadata exposure (the HEAD commit subject). The design itself says undisclosed leaks are not visible in the hashes.

Unknown: whether, on a real second sitting, withholding the rationale changes any pass, fail, or unmet mark. That comparison was not run. It is also falsifier 2 in the design.

Residual: same-model correlation is unaddressed. Role separation in the documents is specified. Cognitive independence is not claimed.

### Intent authority

Ship identity is the intent entries. Realizations change under them. A baseline moves when an authorization by `harbor-master` quotes a non-void assessment hash and a later baseline's `Installed-by` quotes that authorization. Agents stop at the proposal. An invariant is confirmed only by an observation that names it. Narrow scope is a legal result, used in cycle 1 so a notice repair cannot silently close the overload.

Evidence: `INV-4` in `fixture/b0/intent.md`; `authorization-r1.md` scope line; `observation-o2.md` confirming `INV-2` only; design rule that origin is the only unreviewed installation.

Unknown: how often a human in the authorizer role will write a refusal-condition that is specific enough to be a check, rather than a formula sentence. The fixture's sentence is specific. One example does not show the habit will hold.

Residual: an insincere authorization that meets the form is still an authorization. The design detects missing form, not bad faith. A pre-authorization predicate could move authority to the clerk later; the fixture contains none, and the design leaves the safe width of such predicates open.

### Causal traceability

Each cycle is a chain of files. Later files quote earlier hashes: packet quotes sources, assessment quotes the packet, authorization quotes the assessment, baseline quotes the authorization and the realization, observation quotes the baseline. The seal log orders them. Refusals stay in the chain. Diagnosis is retained and is not an assessor input, so the story is auditable without being the thing that was graded.

Evidence: cycle 1 and cycle 2 file sets; the derived-status table in the design; `fixture/register.md` as a labeled projection of that table.

Unknown: a reader who was not present still has to follow hash quotations rather than a single narrative. Whether that chain is usable under time pressure was not tested with a participant.

Residual: traceability and isolation pull apart. The design keeps both by putting the diagnosis in the yard and out of the packet. A sloppy packet assembly defeats isolation and leaves the trace looking well-formed until someone compares the excluded list with what the assessor actually saw. Hashes do not record glances.

### Machine addressability

Anchors are the first token of the entry heading. Operative quantities are `Norm` lines. Edges are `Depends-on` lines. Extra prose on a labeled line is forbidden by the vocabulary rules. Projections are allowed only as caches with `Source-hash`. Agents are told to scan a fixed set of line prefixes when the cache is stale, and to read full prose only for the slice.

Evidence: closed vocabulary table in the design; origin parts and both candidate notices; `fixture/b0/projection.md` marked non-authoritative.

Unknown: the line grammar has not been executed by a clerk program, because this phase writes no program. Ambiguity that a human reader skips may show up the moment a scanner exists. The design's falsifier 6 is about agents citing anchors that do not say what they cite. No agent was run against the fixture.

Residual: addressability is specified at file and entry granularity. There is no query language. Integrity hashes cover whole files, so a narrative wording change changes the realization hash even when every `Norm` line is unchanged. The design treats that as a new file that need not mark dependents review-due. The distinction is a clerk comparison of labeled lines, and it is manual here.

### Incremental update cost

Cycle 1 boards one part. The other two realization pointers stay on `fixture/b0/parts.md`. The new notice is a new file. The origin file is not edited. The cost of that small semantic change is a diagnosis, a proposal, a packet, an assessment, an authorization, a baseline, and an observation, plus seal-log lines.

That is more work than editing the posted sentence in place. It is less work than re-approving the intent. Unchanged planks are cited by hash rather than recopied into the baseline as text. They are recopied into the assessment packet, because the packet has to be readable alone. Packet copying is the expensive step, and it is the step isolation requires.

Evidence: `baseline-b1.md` includes two pointers at the origin parts file and one pointer at `p-notice-c1.md`. Cycle 2 adds a full act set and boards nothing.

Unknown: how the cost behaves past a few dozen parts. Packet size grows with the one-hop neighborhood. The one-sitting assumption is doing a lot of work.

Residual: the protocol is a poor fit for high-frequency edits that carry no invariant. The design says so and does not offer a light path except a future intent predicate this fixture does not contain.

### Human auditability

A person can read the current ship by opening the current baseline and the three realizations it names, plus the intent file. Entries have restatements that repeat operative values in sentences. The yard is there for "why was C2 refused" and is not required to answer "what is posted now."

Evidence: restatements on every part entry; `baseline-b0.md` and `baseline-b1.md`; the trace table in the design; the fixture README's reading order.

Unknown: whether a reader who skips labeled lines and reads only history will still notice that origin `P-NOTICE` does not depend on `P-LOAD`. The history mentions the notebook sentence and also says the label is absent. That is unusually honest prose. A real history line may not confess. The restatement at origin repeats 12, which matches the stale norm, so the restatement check does not catch staleness against `P-LOAD`. `INV-2` does, once someone compares the two entries. The fixture's first observation is what forces that comparison.

Residual: auditability of the current ship is the strong claim. Auditability of the whole yard depends on seal-log order and hash quotations. Volume is already visible in one success plus one failure.

### Possibility-space coverage

Named alternatives in the fixture:

| Alternative | Where it is named | Status after the trace |
| --- | --- | --- |
| ALT-leave-sign | proposal C1, authorization R1 | refused for cycle 1 |
| ALT-duty-on-notice | proposal C1 as deferred, attempted as C2, refused by R2 | failed |
| ALT-crew-count | refusal R2 | open, not attempted |
| none-conceived | not used | the proposals did name options |

Failed and deferred alternatives remain in the act files. A successor on F2 is void unless it names `ALT-duty-on-notice` on `Differs-from`. The design refuses a `retired` status so preference cannot be written down as impossibility. Contracting the space for real requires an intent revision.

Evidence: `proposal-c1.md`, `refusal-r2.md`, `reeval-f2.md`, the possibility rules in the design.

Unknown: the design does not generate options. Coverage equals what the proposer and the authorizer bothered to name. `none-conceived` makes an empty search visible and does nothing to fill it. Whether authorizers will reject empty searches is not tested.

Residual: this criterion is only partly met, and the design should not be described as exploring the space. It keeps a record of the explored slice and blocks silent deletion. That is the actual claim.

### Feedback closure

The state machine closes an invariant only by observation. Cycle 1 implements a notice and the confirming observation closes `INV-2` only. `INV-1` stays open as F2. Cycle 2 refuses the candidate, boards nothing, and the unchanged observation makes C2 `closed-failed` while F2 stays open. Re-evaluation is a derived sheet of constraints, not a claim that the overload is solved.

Evidence: derived-status table in the design; `observation-o2.md`; `observation-o3.md`; `reeval-f2.md`; `register.md`.

Unknown: a live observer can write `Result: confirmed` after a glance. The fixture's O2 is specific about what was seen and what was not checked. The form allows a vaguer sentence that still says `confirmed`.

Residual: closure is structurally blocked when the observation is missing, and weakly judged when the observation is present. That is an honest limit of a document protocol.

### Operational cost

Counted for this fixture, excluding the seal log and the README:

- Shared origin: intent, parts, baseline, projection (4).
- Successful narrow boarding: observation, diagnosis, candidate, proposal, packet, assessment, authorization, baseline, confirming observation (9).
- Failed correction: diagnosis, candidate, proposal, packet, assessment, refusal, unchanged observation, re-evaluation sheet (8).
- Folded register (1), non-authoritative.

Twenty-two documents for one three-part ship, one boarded plank, and one refused plank. A single shared prose spec would have been one edit. The extra documents are the diagnosis (retained and excluded), the packet (isolation), the refusal (memory of the failure), and the unchanged observation (closure of the failed candidate).

Evidence: the file list in the design's fixture section.

Unknown: how many of these a trained clerk could template without thinking, and how many would be skipped in a hurry. Skipped files are not a cheaper protocol; they are a broken chain, and the design freezes boarding when quotations do not resolve. The practical failure mode is people abandoning the protocol, which the documents cannot prevent.

Residual: cost is front-loaded and per attempt, including failed attempts. That is the point, and it is also the adoption risk.

### Integration friction

Normal edit-and-merge practice fights this protocol in specific ways. Sealed files are not edited in place. A merge is not an authorization. A pull request can carry an authorization and still fail to board anything until a baseline file quotes it. Projections must not be reviewed as if they were intent. Contributors have to learn anchors, manifests, and the difference between a restatement and a history line.

Evidence: design sections Alternatives (version control as storage, not as the chain) and Persistent state.

Unknown: whether a team will keep a second, informal spec "just for editing" and let it diverge. The design says the informal spec would be a projection or narrative and would not be citable. Social pressure toward a side document is likely and unmeasured.

Residual: friction is high on purpose at identity-bearing changes. If this protocol is imposed on every wording tweak, people will bypass it, and bypass is already listed as a freeze condition rather than as something the design can make pleasant.

### Self-review

This file was written in the same session, by the same model, with the design rationale still in context. The design's assessor rules were not followed for the design itself: there was no packet that excluded the author's reasoning, no second context, and no human authorizer quoting a seal over this evaluation.

What the self-review can still do is check internal consistency: every required design section is filled, the fixture walks the full loop including a refusal, the example assessments do not quote the diagnosis files, and the evaluation does not award a single score. Those checks were done by the author. They are clerk checks, not an independent judgment of whether the architecture is good.

A review that would count under the protocol would be a fresh context given the design, the criterion list, and the fixture, with this evaluation excluded, producing per-criterion pass, fail, and unmet marks. That review does not exist yet. Until it does, "self-review" for this track is an open loop in the design's own sense: the text is written, and no independent observation has confirmed it.

## Known weaknesses

1. Same-session authorship of both sides of the fixture. The example assessments illustrate a well-formed verdict. They do not demonstrate that a packet-only reader reaches it.
2. Isolation is behavioral. The repository checkout is the whole repo. The fixture folder places diagnoses next to packets. A reader who ignores the README is not isolated, and nothing technical stops them.
3. HEAD commit subject was visible while identifying the baseline commit. Content outside this folder was not opened. The track rule treats accidental exposure as compromised independence. Provenance says so. The design was not revised to answer that subject line, and there is no way to prove a negative about influence except by stating the limit.
4. Ceremony is heavy enough that bypass is the likely real-world failure, and the mitigation is "freeze," which is correct and socially brittle.
5. Possibility coverage is a log of named options, not a search.
6. Observations close loops if they say they do. Shallowness is not mechanically detectable.
7. Hash witnesses live in the same tree an administrator can rewrite. There is no second medium.
8. The line grammar is specified and not executed by a tool. Addressability for machines is a claim about a convention.
9. Origin is allowed to be wrong. Anything never observed stays aboard indefinitely.
10. One human role, one language, one sitting. The open questions in the design are real gaps, not modesty.

## What would disprove this design

The falsifiers in `.plan/design.md` stand. The ones that would bite this track first, given the evidence above:

1. A packet-only assessor cannot judge `INV-1` on cycle 1 or cycle 2 without the diagnosis, or reaches the opposite verdict whenever the diagnosis is added. Either result breaks the isolation story as written.
2. A reader auditing only `baseline-b1.md`, the intent, `p-notice-c1.md`, and the origin parts file cannot say what the posted limit is, what the crew do, or whether C2 is aboard.
3. A later candidate repeats the C2 notice in different words, omits `Differs-from`, and the written clerk checks still accept it.
4. Two careful hash computations over a fixture file disagree when both claim to follow the byte rules in `fixture/README.md`.
5. The derived-status walk and `fixture/register.md` disagree, and a reread of the act files shows the register is the one that matches the author's intention. That would mean the status table does not actually determine status.
6. A baseline file is accepted as current with `Installed-by` pointing at a proposal or an assessment rather than an authorization by `harbor-master`.

Any one is enough. Partial discomfort with the ceremony is not disproof. It is the cost already recorded under operational cost.

## Unresolved questions

The open questions in `.plan/design.md` are unresolved here as well. Evaluation adds these:

1. No second context has graded the design or re-graded the fixture packets. Until that happens, isolation and self-review are specified and unmeasured.
2. No participant has timed a cycle against an in-place prose edit, so the cost comparison is a file count, not an observed effort.
3. No scanner has been written, so machine addressability has no execution evidence. Writing one was out of scope for this phase.
4. It is unsettled whether the restatement rule will be treated as redundant with `Norm` lines and skipped, which would remove the human-readable half of the consistency check.
5. It is unsettled whether retaining full diagnosis files will, in practice, become the document everyone reads, making the packet a formality.
6. The shared charter was not read. If that charter defines Theseus, isolation, or the criteria differently than the assumptions in the design, this evaluation is about the design that was written, not about compliance with the unread charter. That gap is intentional and unresolved.
