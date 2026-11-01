# Track A — Document-first design

Status: Complete

This is the human-optimized Theseus architecture for this track: a **document canon** whose current identity is a small set of human-readable entries, and whose continuity across replacement is an append-only chain of sealed acts. Realizations are planks. The ship is the intent plus the baseline pointer plus the unbroken authorization chain.

The seven track questions are answered in the sections below.

| Track question | Where it is answered |
| --- | --- |
| Canonical intent, review artifacts, persistent state, triggers, closure, generated outputs | Canonical representation; Assessment and isolation protocol; Persistent state and feedback loop |
| Agents working efficiently on human-readable canon | Canonical representation → Agent operation |
| Independent and contextual execution, sealed assessments, authorized revisions | Assessment and isolation protocol |
| Detect → diagnose → correct → authorize → implement → observe → re-evaluate, including a failed correction | Minimal conceptual fixture |
| How prose hides dependencies, alternatives, and possibility-space contraction | Canonical representation → Narrative and normative lines; Failure modes; Alternatives |
| Minimal runnable conceptual fixture, no implementation code | Minimal conceptual fixture and `fixture/` |
| Seal before cross-track disclosure | `.plan/provenance.md` |

No program is specified as a deliverable of this phase. A person with a text editor and SHA-256 can run the fixture. A later clerk program, if one is ever written, would only check hashes, copy packets, and list review-due entries. It would not become the author of intent.

## Assumptions

These assumptions are part of the design because the shared baseline documents were not read. The track README names `CHARTER.md` and root `.plan/implementation.md` as common baseline. The human instruction for this run was to not read them. The architecture below stands only on `experiments/human-optimized/README.md`, `.plan/README.md`, and the empty section skeletons that were already in this folder.

1. **Theseus, as used here, means continuity of identity while replaceable parts change.** A part may be discarded and a new realization boarded. Identity is not the sameness of the planks.
2. **Ship identity** is the set of intent entries, the current baseline pointer, and a gapless chain of authorizations back to an explicit origin. **Part identity** is a stable anchor (`P-LOAD`, `INV-2`) that survives replacement of the text that fills it.
3. **Origin is an unreviewed axiom.** The first baseline is installed by declaration, not by an infinite regress of prior assessments. Every later move is reviewed. Origin may already contain defects; the first real cycle is allowed to find them.
4. **The other track, consulting-os, Atlas, and Maxwell are out of scope.** Nothing in those names is used. The worked example (a three-part harbor ferry) was invented inside this track so the protocol has something concrete to operate on. It is not a disguised description of any of those systems.
5. **The evaluation headings already in `.plan/evaluation.md` are the whole criterion set** for this track: portability, genuine isolation, intent authority, causal traceability, machine addressability, incremental update cost, human auditability, possibility-space coverage, feedback closure, operational cost, integration friction, and self-review.
6. **Default authority is a human role named in an intent entry.** In the fixture that role is `harbor-master`. Agents may propose, assess, observe, and clerk. An agent authorizes a baseline move only when a sealed intent entry states an exact predicate that the clerk can check by comparing labeled lines. The fixture states no such predicate.
7. **Independent execution means a declared, disjoint input set.** It does not mean a different mind, a different model, or an access-control boundary. Contextual execution means the act's manifest lists the baseline and the files actually in force for that act.
8. **A sealed artifact is immutable bytes plus a recorded SHA-256.** Later correction is a new file. Silent in-place edits are detectable when any later act has quoted the old hash. A party who can rewrite the artifact and every quotation of its hash is outside what this design can stop. There is no external timestamp authority.
9. **Possibility space means alternatives that were written down.** The design keeps refused, failed, and deferred alternatives addressable. It does not invent options nobody conceived. "None conceived" is a legal, visible value.
10. **The canon language is English.** A translation would be a separate, non-normative rendering unless an intent revision says otherwise.
11. **Scale is one sitting.** The authorizer can re-read every current realization in one sitting. The reference size is a few dozen parts, and the fixture has three. Past that size the same rules still apply, and the human-auditability claim gets weaker unless each act's packet stays small.
12. **Observations can be written.** The design does not adjudicate disputed perception except by keeping both observations and leaving the finding open until an authorization names which observation the next proposal must address.
13. **The carrier is UTF-8 Markdown with LF newlines.** Git may store the files. A merge is not an authorization. SHA-256 (`sha256sum` or an equivalent) is the hash.
14. **This session wrote every in-world role in the fixture.** The fixture is runnable by a second person later. It was not independently executed here. Publication seals were applied in batch; a live deployment would seal each act at the time of the act.
15. **No implementation code ships in this phase.** Labeled lines inside Markdown are document conventions, not a program.

## Canonical representation and identity

### What is aboard

At any moment the ship is fully named by four things:

1. **Intent entries** — what must stay true for this ship to still be this ship.
2. **The baseline pointer** — which sealed realization file is aboard for each part anchor.
3. **The authorization chain** — each pointer move quotes the previous baseline, the assessment it relied on, and the human role that accepted it.
4. **The open-finding set** — derived from acts, not stored as a mutable status field that can be quietly overwritten.

A realization that no baseline points at is in the yard. It may be evidence, a failed plank, or a deferred alternative. It is not aboard. Editing a sealed file does not change the ship; it makes the file's bytes disagree with the hash the baseline quotes, which freezes new boarding until a human records an incident.

Ship identity **changes** when an intent entry changes. That is an intent revision: two sealed assessments, from two execution contexts, neither of them the proposer's context, both quoted by the authorizer, and the new intent entry names the previous intent hash as ancestor. The fixture does not perform an intent revision. Part replacement under stable intent **preserves** ship identity even though the plank is new.

Part identity **breaks** when a candidate keeps the anchor but drops the role, or when an assessor marks `identity-break` because the candidate shares no bound invariant with the realization it would replace. An identity-break cannot be boarded as a routine replacement. The authorizer either refuses it, or starts an intent revision that retires the anchor and adds a new one.

### Entries

The normative unit is an **entry**. An entry starts at a heading of the form `### ANCHOR — Title` and ends at the next `### ` heading or at the end of the file. `ANCHOR` is the stable identity. The title is for humans and may change only by a new realization file, never by editing the sealed file.

Two layers live in every part and intent entry:

- **Labeled lines** are normative. A labeled line matches `- Label: value`. Machines and clerks act on these lines.
- **The restatement** is a required plain sentence on `- Restatement: ...`. It must contain every operative value from that entry's `Norm` lines. Humans audit the restatement. If the restatement and the `Norm` lines disagree, the entry is **inconsistent** and cannot be boarded.
- **Any other prose** is narrative. Narrative can explain, remember, and persuade. It cannot fire a trigger, satisfy an invariant, or move a baseline.

This split is the design's answer to prose that looks complete while leaving the operative fact unstated. The narrative may say "the sign should follow the load rule." Until a labeled `Depends-on` says so, no later change to the load rule will mark the sign review-due. The fixture's origin ship contains exactly that defect on purpose.

`Norm` values are the only operative quantities. Historical numbers may appear in lines that start with `History:` and are non-operative. A digit in the restatement that is not a `Norm` value makes the entry inconsistent.

### Closed label vocabulary

Unknown labels are narrative, even if they look official. An act that needs a fact the vocabulary cannot say must stop and record an open question, not invent a label in the moment.

| Label | Use |
| --- | --- |
| Kind | `intent`, `part`, `baseline`, `observation`, `diagnosis`, `proposal`, `packet`, `assessment`, `authorization`, `refusal`, `projection`, `reevaluation` |
| Statement | Intent sentence |
| Violation-looks-like | How a person would notice the intent is broken |
| Binds | Anchors the intent applies to |
| Change-class | `intent-revision` or `realization` |
| Role | What job the part does for the ship |
| Depends-on | Anchors whose Norm values this realization copies or whose change would change this realization's meaning. `none` is a real value |
| Does-not-depend-on | Anchors the author considered and rejected as dependencies. `none` means "no neighbor was considered," which is different from a considered rejection |
| Bound-invariants | Intent anchors this part is judged under |
| Review-on | When this part becomes review-due |
| Norm | `key = value`, one operative quantity, single line |
| Restatement | Plain sentence containing every Norm value in the entry |
| History | Non-operative memory |
| Act | `propose`, `assess`, `authorize`, `refuse`, `observe`, `diagnose` |
| Actor | Role or session id |
| Baseline | Baseline id the act is valid against |
| Inputs | Files the act actually used |
| Input-hash | `filename sha256` |
| Excluded | Files the protocol forbids this act to use |
| Claims | Invariants the candidate claims to restore. Empty claims are allowed; over-claiming is not required |
| Alternatives | Named alternatives conceived for this act |
| Differs-from | Failed or refused alternative anchors this candidate must distinguish, or `none` |
| Drops-label | Labels present on the previous realization and absent here, or `none` |
| Verdict | `accept`, `accept-narrow`, `refuse` |
| Scope | Invariants and anchors an authorization actually boards |
| Refusal-condition | What would have made the authorizer refuse, written even on an acceptance |
| Opens | Finding id created by this act |
| Finding | Finding id this act addresses |
| Class | `tension` or `break` on an observation |
| Seen | What the observer reports |
| Checked-invariant | Invariant an observation actually checked |
| Result | `confirmed`, `unmet`, `unchanged` |
| Source-hash | Hash a projection was built from |
| Includes | `ANCHOR = file` aboard a baseline |
| Installed-by | Authorization hash, or `origin` |
| Previous | Prior baseline id |
| Possibility | Alternative id and status `open`, `deferred`, `refused`, `failed`, `adopted` |
| File-hash | `filename sha256` for a file a baseline or act relies on that is not itself the act's subject |
| Names | Anchors an observation is about |
| Names-realization | `ANCHOR = filename sha256` on an authorization, the planks that may be boarded |
| Previous-hash | `filename sha256` of the previous baseline |
| Candidate-file | Path of the realization file a proposal offers |
| Scope-noted | Assessor's plain statement of what a verdict would board. Not an authorization |
| Current-baseline | Baseline id a refusal leaves in force |
| Non-authoritative | `true` on a projection. The file must not be an assessment input |

`Depends-on` values, `Binds`, `Claims`, `Excluded`, and `Differs-from` are comma-separated anchors or file names, or `none`. Those list labels do not carry extra prose. `Statement`, `Restatement`, `History`, `Seen`, `Role`, `Violation-looks-like`, `Review-on`, `Refusal-condition`, and `Scope-noted` are sentences and may.

### Intent

An intent entry states a condition, names how a violation looks in the world, names the anchors it binds, and is marked `Change-class: intent-revision`. An intent entry with no `Violation-looks-like` line cannot be sealed. Words such as "safe", "appropriate", and "normal" are not violations anyone can re-check, so they are not intent.

The fixture's intent is the ferry's identity: do not carry more than the authorized limit; the posted number matches that limit; crew duties live on the crew entry; the baseline moves only by the harbor-master quoting a sealed assessment. Those four, plus the dependency rule, are the ship's identity. A realization can change without becoming a new ship. Weakening any of those sentences would.

### Parts and realizations

A part anchor is stable. Each boarding is a **new file** containing the full entry, not a patch against the previous file and not an edit of the previous file. The baseline lists, for each anchor, the file whose entry is aboard.

Unchanged parts stay pointed at the old file. A one-part repair moves one pointer. Readers who want "the current notice" read the baseline first, then that one file. They do not guess from which file in the folder was edited most recently.

Well-formed candidate entries:

- repeat the same anchor they would replace
- include every label the previous realization had, or name omissions on `Drops-label`
- keep `Restatement` in agreement with `Norm`
- declare `Depends-on` when they copy another part's Norm value

### Baselines

A baseline file is itself sealed. It contains:

- `Kind: baseline`
- `Previous`
- `Installed-by` (`origin` or an authorization file hash)
- one `Includes` line per part anchor

The baseline's own hash is what later observations quote. Two baselines with the same part hashes and different installers are different ships' paperwork, and the chain is what says which one is current. **Current** means: the baseline that the latest non-void authorization installed, found by reading the seal log in order. A projection may name the current baseline for convenience. The log is the authority for order.

### Narrative and normative lines

Prose-centric structure hides three things this design cares about.

**Dependencies.** A sentence can mention another part without creating an edge. Triggers read `Depends-on` only. The fixture origin describes, in `History`, that the sign ought to follow the load rule, and its `Depends-on` is `none`. The load rule was replaced earlier. No review-due flag was possible, because there was no edge to walk. The human reading the story feels the dependency exists. The protocol correctly treats it as absent until a labeled line exists.

**Alternatives.** A narrative of a fix has a shape with one ending. Other endings feel like they were never real. Every proposal and every authorization carries an `Alternatives` line. Conceivable options are named there, including the option of doing nothing. An authorization copies those names forward so the record does not depend on someone later opening the proposer's file. Statuses are `open`, `deferred`, `refused`, `failed`, and `adopted`. `Refused` and `failed` stay re-openable: a later candidate may attempt them only with `Differs-from` naming that alternative and a sentence saying what is different. `Retired` is not a status. Making an alternative impossible is an intent revision that states the new invariant. Preference is not impossibility.

**Possibility-space contraction.** Local choices become fake invariants when later prose says "we always." The design separates `Change-class: intent-revision` from ordinary realization choices. A choice cited as custom in a later act raises a review of whether someone is about to launder a choice into an identity constraint. The review either promotes it by an intent revision or writes down that it is still a choice. The design does not auto-promote.

Coverage is limited to named alternatives. Silence is not a searched space. A proposal that conceived nothing writes `Alternatives: none-conceived`. That line is an auditable admission. It is not a defect by itself. It is a warning to the authorizer that the space was not explored.

### Agent operation

Human-readable entries stay canonical. Agents stay fast by not treating the archive as a blob they must re-read, and by not being allowed to promote a cache into authority.

An agent that needs to act on one part:

1. Reads the current baseline file and no other baseline.
2. Opens a projection only when its `Source-hash` lines match the files the baseline includes. If they do not match, the agent ignores the projection and scans source files for lines that start with `### `, `- Kind:`, `- Depends-on:`, `- Does-not-depend-on:`, `- Bound-invariants:`, or `- Norm:`.
3. Reads full prose only for the selected realization, the intent entries named by `Bound-invariants` and by the finding, and the realizations named by `Depends-on` (one hop).
4. Pulls an older act only when a labeled line cites its id.
5. Writes a new realization file and a proposal manifest that lists the hash of every file read.
6. Stops. Proposal is not authorization. The agent does not edit sealed files and does not update the baseline pointer.

Citations in proposals, assessments, and authorizations use anchors. An unlabeled claim is commentary. Commentary cannot justify a pointer move.

This is efficient at the reference scale because the scan is a line filter, the prose read is a slice, and unchanged planks are hashes rather than recopied text. It stays honest because any conflict between a projection and a source is resolved by ignoring the projection. An agent that plans from a stale projection produces a void act.

Generated outputs are not a second canon. They are named in Persistent state.

### Review artifacts

| Artifact | What it is | Who may write it | Can it move the ship |
| --- | --- | --- | --- |
| Observation | A seen fact, bound to a baseline hash | Observer | Opens or closes findings only under the derivation rules |
| Diagnosis | A cause claim and the proposer's reasoning | Proposer context | No. Excluded from assessment inputs |
| Proposal | Envelope: claims, alternatives, input hashes, rationale | Proposer context | No |
| Realization candidate | The full replacement entry in its own file | Proposer context | Only after authorization points the baseline at it |
| Packet | The exact bytes the assessor is allowed to read, including copies and source hashes | Clerk | No |
| Assessment | Per-invariant judgment of the packet | Assessor context | No |
| Authorization | Acceptance, narrow or full, by the named human | Authorizer | Yes, by being quoted from a new baseline |
| Refusal | Rejection by the named human | Authorizer | No. The previous baseline stays current |
| Re-evaluation | Derived constraints on any successor | Clerk, as a projection | No |

Packets, assessments, authorizations, and refusals are review artifacts. Diagnoses are retained so the causal story is auditable, and they are excluded from the assessor's inputs so the story is not what gets graded.

## Assessment and isolation protocol

### Roles

| Role | Context it may hold | What it produces |
| --- | --- | --- |
| Proposer | Baseline, intent slice, observations, prior outcome records, its own diagnosis | Diagnosis, candidate entry, proposal envelope |
| Clerk | File names, hashes, label lines. Not a judge of sufficiency | Packets, hash checks, derived finding fold, review-due list |
| Assessor | The packet only | Assessment |
| Authorizer | Assessment, proposal envelope (rationale included), candidate entry, alternatives already on the record | Authorization or refusal |
| Observer | The baseline it claims to look at, and the world | Observation. Diagnosis text is excluded |
| Intent author | The same as authorizer, and only for intent revisions | Intent entry replacement |

The fixture's intent author and authorizer are the same role, `harbor-master`. The assessor is not the authorizer. The proposer is not the assessor.

### Contextual execution

Every act begins with a manifest: `Act`, `Actor`, `Baseline`, `Inputs`, `Input-hash` once hashes exist, and `Excluded`. The manifest is how a later reader knows what "context" meant for that act. An act without a manifest is void.

The proposer is supposed to be contextual. Hiding the incident from the proposer would make the proposal performative. The proposer's diagnosis is preserved as its own file so the chain of thought is inspectable after the fact.

The observer is contextual about the baseline and the world, and is not given the diagnosis. A confirming observation that merely repeats the proposer's theory is not a confirmation. The observation has to say what was seen and which invariant was checked. The fixture's successful observation checks the posted number and explicitly does not claim that a later sailing respected the limit.

### Independent execution

The assessor receives a packet and nothing else in the protocol's sense. "Nothing else" is genuine only when the execution context cannot see the rest of the folder. This repository does not provide that. The fixture states the operational rule: copy the packet file into an empty directory and assess there. A seal applied by someone who could browse the diagnosis is not void on that fact alone, because this phase has no access control, but it also cannot be described as enforced isolation. If the manifest's `Inputs` include a diagnosis file, or the packet's `Excluded` list was not honored and the leakage is known, the assessment is **void** and cannot be quoted by an authorization.

The packet **includes**:

- intent entries the finding binds
- the current realizations of the affected part and of parts named by its `Depends-on` and `Does-not-depend-on`
- the candidate entry
- the triggering observation and any earlier outcome observations on the same finding
- source hashes for each of those

The packet **excludes**:

- the diagnosis file
- the proposal rationale and the proposal's `Alternatives` line
- other assessments that are not yet sealed
- the authorizer's leaning
- any projection

The assessor judges the candidate against intent and against the observations. The assessor does not receive the proposer's argument, so a fluent rationale cannot carry a bad plank. The assessor also does not receive the alternative list, so the grading is not "did they pick the option they said they picked."

The assessor writes, for each bound invariant, `pass`, `fail`, or `unmet`, with the anchor cited and the `Norm` value relied on. The assessor may name a gap. The assessor does not write replacement text. Writing the next plank would collapse assessor into proposer inside one document.

Verdicts:

- `accept` — every claimed invariant passes, and no bound invariant is failed
- `accept-narrow` — the candidate is boardable for a named subset, and at least one bound invariant remains unmet
- `refuse` — a bound invariant fails, or the entry is inconsistent, or an undeclared copy violates the dependency rule

Two assessors, when used, get the same packet and do not see each other until both seals are in the log. The authorizer quotes both. The design does not average them. Intent revisions always require two. Ordinary realization review requires one. A second assessment is allowed whenever the authorizer wants one, and the first assessment stays sealed either way.

Same-model correlation is a limit. Two contexts with disjoint inputs can still share training and habits. The protocol claims input isolation and role separation. It does not claim independent cognition.

### Sealing

1. Freeze the file. Do not insert the hash into the file afterward.
2. Compute SHA-256 over the file bytes (UTF-8, LF, exactly one trailing newline, no trailing spaces).
3. Append a record to the seal log whose `prev` is the hash of the previous log record's exact line, or `genesis` for the first record.
4. Later acts quote that body hash. They do not quote the file name alone.

Verification recomputes the file hash and walks `prev`. A mismatch freezes boarding. The log order is the total order of acts that were sealed. In-world dates inside observations are narrative time. Seal-log time is when the bytes were frozen. In this fixture those differ, because the example was composed and then sealed in batch. A live run seals the act before the next act is allowed to quote it.

### Authorization

An authorization is valid when all of the following hold:

- `Actor` is the role named by the intent entry that governs baseline moves
- it quotes the assessment body hash, and that hash matches the assessment bytes
- the assessment is not void
- `Scope` names only invariants the assessment marked `pass`
- `Refusal-condition` is filled in, including on an acceptance
- `Alternatives` names each alternative the proposal conceived, with a status
- it does not rewrite the assessment

A refusal is the same shape with `Verdict: refuse` and no new baseline.

The authorizer may read the proposer's rationale. That is deliberate. The human is allowed to understand why the plank was offered. The human is not allowed to treat the rationale as a substitute for the assessment, and is not allowed to mark an invariant confirmed. Only an observation can confirm. Authorization means "this realization may be boarded for this scope," not "the world is now fixed."

Narrow authorization is a normal outcome, not a soft failure. The fixture's first cycle boards a corrected notice and leaves the overload incident open on purpose. A design that could only accept or reject the entire story would pressure the human to pretend the notice repair also repaired the boarding practice.

### What the clerk checks before an act can be quoted

- every `Input-hash` matches the file
- the assessment's inputs are the packet hash and nothing else
- the packet's excluded list contains the diagnosis and the proposal
- `Restatement` contains each `Norm` value
- `Differs-from` is present and not `none` when the derived record shows a `failed` or `refused` alternative on the same finding
- `Drops-label` accounts for any missing label
- the authorizer role matches the intent entry

The clerk does not decide whether the plank is good. A failed check makes the act void. Void acts remain in the log.

### Pre-authorized predicates

The default is human authorization of every pointer move. An intent entry may later state an exact predicate, for example: a replacement whose `Norm` lines and `Depends-on` are identical to the realization aboard, and whose assessment verdict is `accept`, may be installed by the clerk. That predicate is itself identity, so adding it is an intent revision. The fixture does not include one. Note-only narrative edits still change the file hash and still need a new baseline line if the new bytes are to be what readers open; they do not mark dependents review-due unless a `Norm`, `Depends-on`, `Role`, or `Bound-invariants` line changed.

## Persistent state and feedback loop

### What persists

| State | Where | Mutability |
| --- | --- | --- |
| Intent entries | Sealed files, origin plus any later intent revisions | New file per change. Old file retained |
| Realizations | One sealed file per boarding attempt, including failures | Immutable |
| Baseline pointer | One sealed baseline file per installation | The current pointer is whichever baseline the chain last installed |
| Acts | Observation, diagnosis, proposal, packet, assessment, authorization, refusal | Immutable once sealed |
| Seal log | Append-only chained hash records | Append only. A rewritten history breaks `prev` |
| Alternatives | Named inside proposals and copied onto authorizations and refusals | Status changes by a later act, not by editing the earlier act |
| Finding status | Derived by walking acts in seal-log order | Not a mutable field |
| Projections | Index, review-due list, folded register, re-evaluation sheet | Disposable. Header carries `Source-hash`. Stale projections are not inputs |
| Session memory, drafts, model context | Nowhere in the canon | Ephemeral. If it must survive, it is written as an act |

Git is a storage option for these files. The protocol's memory is the hash chain. A squash that drops a refused candidate from the tree, while a sealed refusal still quotes that candidate's hash, leaves a broken chain and freezes the ship. That is the desired outcome: forgotten failures are a protocol breach, not housekeeping.

### Derived finding status

Walk the seal log from genesis. For each finding id:

| Condition in order | Derived status |
| --- | --- |
| An observation or authorization names `Opens` that id | `open` |
| An authorization with `accept` or `accept-narrow` names the finding in `Scope`, and a later baseline `Installed-by` quotes that authorization and `Includes` the candidate hash | `implemented` for that scope only |
| A later observation names the finding, quotes that baseline hash, names `Checked-invariant` inside the authorized scope, and `Result: confirmed` | `closed-confirmed` for those invariants only |
| A refusal names the candidate | candidate is `refused`; baseline unchanged |
| A later observation quotes the still-current baseline and `Result: unchanged` | that candidate is `closed-failed` |
| A `closed-confirmed` scope is smaller than the finding | the finding stays `open` for the unmet invariants |
| A later break observation names an invariant previously confirmed | the later observation wins; the finding reopens; the earlier observation stays in the log |

Two clerks who follow this table against the same log derive the same status. The folded register in the fixture is a projection of this table. If the projection disagrees with the walk, the walk wins and the projection is discarded.

### Review triggers

A part or finding becomes review-due when any of these is true:

1. **Observation trigger.** An observation with `Class: tension` or `Class: break` names the anchor.
2. **Dependency trigger.** Between the previous baseline and the current one, a part's `Norm`, `Role`, `Depends-on`, or `Bound-invariants` changed, and some aboard realization `Depends-on` that anchor. Those dependents are review-due. Narrative mentions do not count.
3. **Intent trigger.** An intent hash changes. Assessments sealed under the old intent hash remain historical and cannot be quoted for new boardings.
4. **Open-loop trigger.** A finding is `implemented` and no observation has yet addressed that scope. The horizon is whatever the intent's `Review-on` says. The fixture uses "before the next sailing" as narrative horizon; the protocol uses "before any later boarding of a dependent part."
5. **Failed-candidate trigger.** A `closed-failed` candidate on a finding blocks a later candidate on that finding unless `Differs-from` names it.
6. **Custom-laundering trigger.** An act's narrative says a choice is mandatory ("we always") while the cited entry's `Change-class` is `realization`. That opens a review to promote or to reaffirm that it is still a choice.
7. **Stale-cache trigger.** An act lists a projection in `Inputs` when `Source-hash` does not match. The act is void, and the void act is itself an incident observation.
8. **Unauthorized-edit trigger.** A file the baseline quotes no longer hashes to the quoted value. The ship freezes. No new candidate may be assessed until an observation records the incident.
9. **Human trigger.** A person writes an observation or a one-line review request. The line says it was human-opened.

Origin does not satisfy trigger 8 merely by containing a known defect. The defect is aboard because origin said so. The first observation is what makes it review-due.

### Feedback closure

A loop is closed only by an observation.

- Implementation without observation leaves the finding `implemented` and review-due. Writing the plank did not close anything.
- An observation closes only the invariants it names, against the baseline hash it quotes.
- A refusal closes the candidate (`closed-failed`) after an observation shows the previous baseline is still what is aboard. The finding stays open if the underlying break is still there.
- Deleting a failed candidate, or omitting the unchanged observation, leaves the loop open on purpose. There is no shortcut status.

The required cycle is:

**detect → diagnose → correct → authorize → implement → observe → re-evaluate**

Diagnose is contextual and excluded from assessment. Correct produces a candidate, not a boarding. Authorize is the human act. Implement is the new baseline file and nothing else in this phase (there is no code to deploy; "implement" means the pointer now names the new plank). Observe looks at the baseline that is now current, or at the baseline that correctly stayed current. Re-evaluate derives what the successor must satisfy. A failed correction still walks every step: the authorization step is a refusal, the implement step records that no pointer moved, the observation records the unchanged ship, and the re-evaluation records the constraint on the next attempt.

### Generated outputs

| Output | Authority |
| --- | --- |
| Entry index | None. Must carry `Source-hash` of every file it indexed |
| Review-due list | None. Derived from triggers plus the log |
| Folded finding register | None. Derived from the finding table |
| Re-evaluation sheet | None. Derived from intent plus the failed alternative |
| Packet | A review artifact, not a projection. Once sealed, its bytes are what the assessor was allowed to see. It does not update when sources update; a new assessment needs a new packet |
| Human summary of a cycle | None. It must quote hashes if someone is going to rely on it for navigation, and it still cannot be an input to an assessment |

Future built objects, if a later phase creates any, are evidence an observer can look at. They are not entries. If the build and the entry disagree, the entry stays aboard and the disagreement is an observation. The document is not "fixed" to match the build without a candidate and an authorization.

### Possibility register

There is no separate mutable register file with authority. Each alternative's latest status is the latest act in seal-log order that names it on `Alternatives` or `Possibility`. Earlier acts remain the history of how the status moved. The fixture's `register.md` prints the fold so a person can read it, and it is marked as a projection.

A successor candidate on a finding with a `failed` or `refused` alternative is void unless `Differs-from` names that alternative. The clerk checks presence. The assessor judges whether the candidate text is actually a different plank. A renamed copy of a failed plank fails assessment even if the label is present.

## Alternatives and tradeoffs

The architecture above was chosen among real options. The rejected ones are named here so this document does not contract its own possibility space.

**Unstructured prose as the only canon.** One narrative specification, edited in place, with memory left to the reader. It is the most portable and the cheapest to write. Dependencies live inside "update the sign accordingly." Failed fixes disappear into the next paragraph. Agents re-read everything and still cannot tell which sentence is operative. This option was rejected as the canon because it fails addressability, closure, and alternative retention. It remains the right medium for `History` lines and for restatements.

**This design: labeled entries inside human-readable files, new files rather than edits, human authorization, disposable projections.** Intent stays in sentences a person can read. Operative facts have addresses. The cost is ceremony: several files per boarding, hash quoting, and a refusal path that produces paperwork instead of a quiet revert. That cost is accepted at the reference scale and is a reason not to use this protocol for bulk text that carries no invariants.

**A machine-canonical graph, with prose generated for humans.** Pointers, edges, and hashes would be native, and incremental updates would be row updates. The prose the human reads would be a rendering. Renderings drift, and the drift becomes the real system the day someone corrects the rendering and forgets the row, or the reverse. This option is the one a document-first track has to resist. Projections in this design are allowed to be graphs. They are never allowed to be the thing an authorization quotes as the invariant itself.

**Executable specification as canon.** Tests and types are checkable and cheap for machines. They are a poor fit for intent that is not executable, they exclude an authorizer who does not read the code, and this phase forbids implementation. They also collapse assessment into "the check passed," which can ratify a possibility space that the checks have already narrowed. A later phase may use checks as observations. Those checks would not become the intent entries.

**Edit in place and let version-control history be the chain.** Familiar, and a reasonable way to store bytes. History does not record what an assessor was forbidden to read, does not distinguish an authorization from an edit, and can be squashed. This design may be stored in git. The seal log, not the commit list, is the chain. A pull request is a transport. Merging it does not board a plank unless the merge result contains an authorization that meets the rules and a baseline that quotes it.

**One shared assessment document that several reviewers edit.** Synthesis is easier, and independence is gone, because the second writer anchors on the first writer's sentences. This design seals separate assessments before either is shown to the authorizer.

**Assessor sees the rationale.** Verdicts get faster when the assessor is told what to notice. That speed is the failure mode: the assessment becomes a grade of the essay. The rationale stays in the authorizer's packet because the human is the one who may be persuaded, and the human's persuasion is on the record as an authorization with a refusal-condition, not disguised as an independent pass.

The tradeoff this design accepts: higher operational cost and worse fit to ordinary edit-and-merge habits, in exchange for a canon a human can audit, a pointer that moves only by a quoted human act, and failed planks that stay addressable. At a scale where nobody re-reads realizations, the human-auditability claim is already false and the ceremony is unpaid. That boundary is an assumption, not a hope.

## Failure modes and mitigations

| Failure | What goes wrong | Mitigation | Residual |
| --- | --- | --- | --- |
| Ceremony bypass | Someone edits the aboard file or repoints the baseline in prose | Quoted hashes; mismatch freezes the ship | A rewriter who updates every quotation wins |
| Hash theater | The same session writes the proposal and the assessment and calls it independent | Packet exclusion rules; void if diagnosis is an input; this track's own fixture is labeled as same-session illustration | Input isolation is not cognitive independence |
| Context leak | Assessor reads the diagnosis anyway | Known leaks void the seal | Undisclosed leaks are not detectable from hashes |
| Rubber-stamp authorization | The human quotes the hash and does not read | `Refusal-condition` and a restated scope are required or the act is void | The design cannot detect an insincere sentence |
| Prose override | A paragraph contradicts `Norm` | Inconsistency blocks boarding; `Norm` is what a clerk compares; the restatement must contain the same values | Narrative outside the restatement can still mislead a skimming reader |
| Label override | The operative number exists only on `Norm` and the human reads the story | Restatement is required and must carry the values | A human who reads neither labels nor restatement is outside the audit claim |
| Hidden dependency | The edge exists only in `History` | Triggers walk `Depends-on` only; assessors fail undeclared copies; origin is allowed to contain the defect so the first cycle can find it | Edges nobody notices stay absent |
| Hidden alternative | The story has one ending | `Alternatives` is required; statuses persist by later acts | Unconceived alternatives are not created |
| Choice laundered into identity | "We always" promotes a local fix | Custom-laundering trigger; retirement of an alternative requires an intent revision | The trigger depends on someone noticing the wording |
| Failed plank retried under a new name | The same sentence returns | `Differs-from` required; assessor can still fail it as the same plank | The clerk only checks that the label exists |
| Identity drift | The anchor now means a different job | `identity-break` cannot board as a routine replacement | Judgment of "different job" is the assessor's |
| Open loop painted shut | The finding is marked closed when the plank lands | Only observations close invariants, and only the ones they name | A shallow observation can still confirm |
| Projection becomes canon | Agents plan from the index | Stale or unhashed projections void the act; sources win | Requires the manifest to be honest |
| Volume | The yard grows until nobody reads it | The current ship is the baseline plus the files it includes; the yard is addressed by id | Audit of "why we refused" still takes a hop into the chain |
| Same-model correlation | Disjoint packets, correlated judgments | Stated limit; intent revisions ask for two contexts anyway | Not mitigated inside one model |
| Disputed observation | Two observers contradict | Both remain; the finding stays open until an authorization names which observation the next candidate must address | The design does not decide who saw the dock |
| Origin defect | The starting ship is already wrong | Origin is explicitly unreviewed; the first observation may name the defect | Anything never observed stays aboard |
| Batch sealing of an example | The fixture's seals are not live act-time seals | Disclosed in provenance and in the fixture README | The fixture does not demonstrate live sequencing, only the recorded shape |

## Minimal conceptual fixture

The fixture is a harbor ferry named in the documents as Theseus, with three replaceable parts: the authorized passenger limit (`P-LOAD`), the dock notice (`P-NOTICE`), and the crew procedure (`P-CREW`). It is a paper machine. Running it means checking hashes, copying a packet into an empty directory, and judging that packet. No code is part of the fixture.

Files:

| File | Role |
| --- | --- |
| `fixture/README.md` | How to run the paper machine, including what not to open |
| `fixture/b0/intent.md` | Ship identity |
| `fixture/b0/parts.md` | Origin realizations |
| `fixture/b0/baseline.md` | Origin pointer |
| `fixture/b0/projection.md` | Disposable index, with source hashes |
| `fixture/cycle1/observation-o1.md` | Detect |
| `fixture/cycle1/diagnosis-d1.md` | Diagnose; excluded from the assessor |
| `fixture/cycle1/p-notice-c1.md` | Candidate plank |
| `fixture/cycle1/proposal-c1.md` | Envelope, rationale, alternatives |
| `fixture/cycle1/packet-a1.md` | Assessor's entire allowed input |
| `fixture/cycle1/assessment-a1.md` | Sealed example verdict |
| `fixture/cycle1/authorization-r1.md` | Narrow accept |
| `fixture/cycle1/baseline-b1.md` | Pointer move |
| `fixture/cycle1/observation-o2.md` | Confirm the narrow scope only |
| `fixture/cycle2/diagnosis-d2.md` | Diagnose the failed attempt; excluded |
| `fixture/cycle2/p-notice-c2.md` | Failed plank |
| `fixture/cycle2/proposal-c2.md` | Envelope |
| `fixture/cycle2/packet-a2.md` | Assessor input |
| `fixture/cycle2/assessment-a2.md` | Refuse |
| `fixture/cycle2/refusal-r2.md` | No pointer move |
| `fixture/cycle2/observation-o3.md` | Unchanged ship |
| `fixture/cycle2/reeval-f2.md` | Constraints on any successor |
| `fixture/register.md` | Non-authoritative fold |
| `fixture/seal-log.md` | Hash chain for the example |

In-world roles in those files were written by this session as an illustration. They are not a claim that a second context executed them.

### Origin

`P-LOAD` aboard says the limit is 10. `P-NOTICE` shows 12, depends on nothing, and its `History` line says someone once wrote that the sign should follow the load rule. `P-CREW` boards people in arrival order and has no counting step. `INV-2` is already broken. `INV-1` will break the moment twelve people board, which is what the first observation records. The missing `Depends-on` edge is why the earlier limit change could not have flagged the notice. That is the prose-hiding failure, sitting in the origin ship.

### Cycle 1 — narrow success

1. **Detect.** `observation-o1` records a Saturday on which the notice showed 12, twelve people boarded, and the aboard limit was 10. Class is `break`. Finding `F1` opens.
2. **Diagnose.** `diagnosis-d1` claims the cause is the missing dependency edge and recommends a new notice. That file is listed on the packet's `Excluded` line. The packet does not contain it.
3. **Correct.** `p-notice-c1` is a full replacement entry: shown limit 10, restatement agrees, `Depends-on: P-LOAD`. `proposal-c1` claims only `INV-2`. It names `ALT-leave-sign` and `ALT-duty-on-notice`, and it defers the second. The rationale, which the assessor does not get, talks as if the incident were over. The claim line does not.
4. **Assess.** The packet holds the intent, the three origin parts, the candidate entry, and the observation, plus hashes. `assessment-a1` marks `INV-2` pass, `RULE-DEP` pass, `INV-3` pass, and `INV-1` unmet, because nothing in the candidate changes the crew step and the observation already recorded an overload. Verdict is `accept-narrow`. The assessment contains no replacement wording.
5. **Authorize.** `harbor-master` accepts scope `INV-2` and `P-NOTICE` only, writes a refusal-condition (a claim that `INV-1` was fully repaired would have been refused), records `ALT-leave-sign` as refused for this cycle and `ALT-duty-on-notice` as deferred, and opens `F2` for the missing count.
6. **Implement.** `baseline-b1` points `P-NOTICE` at `p-notice-c1` and points the other two parts at the origin file. `Installed-by` quotes the authorization hash.
7. **Observe.** `observation-o2` checks the notice against `P-LOAD` under baseline `B1` and confirms `INV-2` only. It does not claim a counted sailing.
8. **Re-evaluate.** Derived status: `F1` is `closed-confirmed` for `INV-2` and stays open as `F2` for `INV-1`. No dependent is review-due, because nothing aboard depends on `P-NOTICE`. The new edge means a later change to `P-LOAD` would mark the notice review-due. That forward edge is the point of the repair.

### Cycle 2 — failed correction

1. **Detect.** `F2` is already open. No new incident is required.
2. **Diagnose.** `diagnosis-d2` says the smallest edit is to put the crew duty on the sign, because that is what people look at. Excluded from packet `A2`.
3. **Correct.** `p-notice-c2` keeps the shown limit at 10 and adds a crew duty whose stop point is the notice's own number. This is the deferred alternative `ALT-duty-on-notice`, now attempted. The convenience of the smallest prose edit is the pressure. The defect is on labeled lines, not hidden: the cycle shows a fully labeled plank can still be the wrong plank.
4. **Assess.** Packet `A2` includes the aboard `B1` notice, the unchanged crew entry, the candidate, and the two observations. It excludes the new diagnosis and the proposal. `assessment-a2` fails `INV-3` because the notice would become the only carrier of a crew duty, and fails `INV-1` because the stop point is the notice's number rather than `P-LOAD`, and because `P-CREW` is unchanged so the procedure that actually boards people still has no count. Verdict is `refuse`.
5. **Authorize.** `refusal-r2` refuses. The baseline is not replaced. `ALT-duty-on-notice` becomes `failed`. `ALT-crew-count` (change `P-CREW` so the count compares to `P-LOAD`) is named and left `open`. It is not attempted in this phase.
6. **Implement.** No new baseline. The current pointer remains `B1`.
7. **Observe.** `observation-o3` records that the notice still matches the `B1` realization and the crew entry is unchanged. Result is `unchanged`.
8. **Re-evaluate.** `reeval-f2` is a projection. `C2` is `closed-failed`. `F2` stays `open`. Any successor proposal is void unless `Differs-from` names `ALT-duty-on-notice`, the duty is carried on `P-CREW`, and the stop value is `P-LOAD`'s limit. That successor is not written here. The design stops when the failed correction has been observed and the next constraint is visible.

### What a re-run is

`fixture/README.md` tells a second person to copy only `packet-a1.md` or `packet-a2.md` into an empty directory and write a verdict. Matching prose is not required. Matching pass, fail, and unmet per invariant is the comparison. This session did not perform that separation. The committed assessments are examples of well-formed outputs, written by the same author as the diagnoses.

## Falsification criteria

The design is false, and should be abandoned or narrowed, if a later check shows any of the following.

1. **Audit failure.** An authorizer who did not write the system cannot tell, from the current baseline and the files it includes, what is aboard and which later edits are unauthorized.
2. **Isolation is ceremony.** Assessors given the packet and assessors given the packet plus the diagnosis produce the same pass, fail, and unmet marks on every invariant, across a set of cases large enough to include at least one bad plank with a fluent rationale. Input exclusion would then be paperwork. The opposite result also falsifies the packet rule: assessors given only the packet systematically cannot judge the stated invariants because a necessary observation or entry was withheld.
3. **Edges do not earn their keep.** Replaying a series of historical changes, explicit `Depends-on` review-due flags catch no more missed follow-through than rereading the narrative.
4. **The yard does not remember.** Successors repeat a failed alternative, the `Differs-from` check does not fire, and the failed file is gone or uncited.
5. **Cost without a tighter loop.** Entry-level cycles take longer than editing one prose spec and do not produce a higher rate of observations that actually match the authorized scope.
6. **Addressability is fictional.** Agents citing anchors regularly bind a claim to an entry whose `Norm` lines do not say that claim, and the clerk check does not catch it.
7. **Authority leak.** Under the default rules, with no pre-authorization predicate in the intent, a baseline moves and the chain accepts it without an authorization by the named human role.
8. **Hash instability.** Two clerks who apply the byte rules to the same file compute different SHA-256 digests.
9. **Closure fiction.** A finding can show `closed-confirmed` while the candidate was refused, or while no observation names that invariant.
10. **The fixture does not run.** A person with the fixture README, a text editor, and SHA-256 cannot verify the seals or complete a packet-only verdict without inventing a step this design does not specify.
11. **Identity collapse.** A routine authorization boards a candidate an assessor marked `identity-break`, and the protocol as written allows it.

Any one of these is enough. They are not a score.

## Open questions

1. **How alike is "the same plank" for the assessor's sameness judgment** when the clerk has already checked that `Differs-from` is merely present? The fixture uses a human reading. A later clerk predicate would need a stated comparison this design does not give.
2. **Observers who lived the incident** already know the diagnosis. Excluding the file does not exclude their memory. The protocol's observer rule is enforceable for a fresh agent context and weak for the crew who were on the dock.
3. **Two humans disagree about authorization.** The design names one role. It does not specify a split authority, a deputy, or a deadlock.
4. **Pre-authorization predicates** look like the practical escape from ceremony and also look like a bypass. How narrow a predicate can be before it is just "the clerk may board whatever the assessor accepted" is unsettled, and the fixture avoids it rather than solving it.
5. **Disputed observations** are both kept. There is no rule for when an authorizer may stop waiting and pick one, beyond "write it down."
6. **Secrecy.** The canon is as readable as the authorizers. This is not a design for material that cannot sit in widely readable files.
7. **External hash witness.** A single store an administrator can rewrite can rewrite the chain. Whether seals must be copied to a second medium is open. This phase has no second medium.
8. **Language.** English is assumed. Which text would be normative in a bilingual operation is open.
9. **Scale-up.** The one-sitting assumption will fail. Whether the protocol still holds when the current ship is a slice of a much larger entry set, with the rest attested only by hashes, is open.
10. **Charter unknowns.** Questions the unread shared baseline might already answer are intentionally unanswered here, so this track does not pretend to have inherited them.
11. **Live versus batch seals.** The fixture demonstrates the recorded relationships and does not demonstrate act-time sealing. Whether batch composition changes author behavior enough to matter is something a later independent run would have to measure.
12. **Clerk judgment creeping into assessment.** Several checks (restatement contains the value, undeclared copy, sameness of a failed plank) sit on the border between mechanical and judicial. The design assigns some to the clerk and some to the assessor. A real run may show that split is unstable.
