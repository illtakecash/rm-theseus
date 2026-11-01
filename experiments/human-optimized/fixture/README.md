# Fixture runbook — harbor ferry

This directory is a paper machine for the Track A document canon. It is one small ship: an authorized passenger limit, a dock notice, and a crew procedure. The protocol itself is `.plan/design.md`. These files are an example execution, written in one session and sealed in batch afterward. In-world dates (2026-06-06 through 2026-06-08) are narrative. Seal-log times are publication times. A live run would seal each act before the next act quoted it.

Nothing here is a program. Roles in the act files are labels. This session wrote every role. That is not a second context and not a second person.

## Byte rules

Before trusting a hash:

- The file is UTF-8.
- Line endings are LF.
- The file ends with exactly one newline.
- No line has trailing spaces or tabs.

SHA-256 is computed over those exact bytes. `sha256sum` is enough. Two digests that differ are different files, even when the prose looks the same.

## What is aboard

Read `fixture/cycle1/baseline-b1.md`, then only the files it names, plus `fixture/b0/intent.md`. That is the current ship.

- `P-LOAD` and `P-CREW` are entries in `fixture/b0/parts.md`.
- `P-NOTICE` is `fixture/cycle1/p-notice-c1.md`.
- `fixture/cycle2/p-notice-c2.md` is in the yard. No baseline points at it.

`fixture/b0/baseline.md` is the origin ship, kept so the chain has a start. `fixture/b0/projection.md` and `fixture/register.md` and `fixture/cycle2/reeval-f2.md` are disposable. If their source hashes do not match, ignore them.

## Verify the example

1. From the repository root, compute SHA-256 for every file listed in `fixture/seal-log.md`.
2. Compare each digest to the `body` field on that file's record.
3. Check the `prev` chain: the first record says `genesis`; each later `prev` is the SHA-256 of the previous record line including its terminating newline.
4. Confirm `baseline-b1.md` quotes the authorization digest, and that the authorization quotes the assessment digest, and that the assessment quotes the packet digest.
5. Confirm packet A1's excluded list names `diagnosis-d1.md` and `proposal-c1.md`, and that those phrases from the diagnosis ("Cause claim") do not appear as the assessment's reasoning. The assessment may name the excluded filename.
6. Do the same for packet A2 and diagnosis D2.

A mismatch freezes the example. Do not "fix" a sealed file in place. A correction would be a new file, and this published example is already sealed.

## Re-run an assessment

Use an empty directory that does not contain this fixture, so neighboring files are not browsable.

Cycle 1: copy only `fixture/cycle1/packet-a1.md` into that directory. Write a verdict with one mark per invariant in the packet: pass, fail, or unmet, plus `accept`, `accept-narrow`, or `refuse`. Do not open `diagnosis-d1.md` or `proposal-c1.md` first.

Cycle 2: same procedure with `fixture/cycle2/packet-a2.md`. Leave out `diagnosis-d2.md` and `proposal-c2.md`.

Afterward, compare marks to `assessment-a1.md` or `assessment-a2.md`. The same sentences are not required. The same pass, fail, and unmet marks are the comparison. A different mark is a finding about the packet, not a typo to be edited into the sealed example.

This session did not perform that separation. The committed assessments are illustrations of well-formed outputs.

## Reading order for the trace

1. `b0/intent.md`, `b0/parts.md`, `b0/baseline.md`
2. `cycle1/observation-o1.md` (detect)
3. `cycle1/diagnosis-d1.md` (diagnose; proposer only)
4. `cycle1/p-notice-c1.md` and `cycle1/proposal-c1.md` (correct)
5. `cycle1/packet-a1.md` and `cycle1/assessment-a1.md` (assess)
6. `cycle1/authorization-r1.md` and `cycle1/baseline-b1.md` (authorize and implement)
7. `cycle1/observation-o2.md` (observe)
8. `cycle2/diagnosis-d2.md`, `cycle2/p-notice-c2.md`, `cycle2/proposal-c2.md`
9. `cycle2/packet-a2.md`, `cycle2/assessment-a2.md`, `cycle2/refusal-r2.md`
10. `cycle2/observation-o3.md`, `cycle2/reeval-f2.md`

The failed correction is cycle 2. The baseline does not move. The refused plank stays addressable.
