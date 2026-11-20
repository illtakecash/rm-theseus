# Ferry Theseus — intent

Origin intent for the harbor ferry. These entries are the ship's identity. Replacing any of them is an intent revision, not a routine boarding. The protocol that operates on these entries is the Track A document canon.

### INV-1 — Do not overload

- Kind: intent
- Statement: The ferry carries no more passengers than the limit in P-LOAD.
- Restatement: The ferry carries no more passengers than the limit in P-LOAD.
- Violation-looks-like: A count of people carried is greater than P-LOAD's limit, or a procedure's stop point is any value other than P-LOAD's limit.
- Binds: P-LOAD, P-CREW, P-NOTICE
- Change-class: intent-revision

### INV-2 — Notice matches the authorized limit

- Kind: intent
- Statement: The dock notice's shown limit equals P-LOAD's limit.
- Restatement: The dock notice's shown limit equals P-LOAD's limit.
- Violation-looks-like: The Norm value shown-limit on P-NOTICE differs from the Norm value limit on P-LOAD.
- Binds: P-NOTICE, P-LOAD
- Change-class: intent-revision

### INV-3 — Crew duties live on the crew entry

- Kind: intent
- Statement: A crew duty appears in P-CREW. The dock notice is addressed to passengers and is never the only entry that states a crew duty.
- Restatement: A crew duty appears in P-CREW, and the dock notice is never the only entry that states a crew duty.
- Violation-looks-like: A crew-duty Norm appears on P-NOTICE while P-CREW has no matching duty Norm.
- Binds: P-NOTICE, P-CREW
- Change-class: intent-revision

### INV-4 — The harbor-master boards planks

- Kind: intent
- Statement: The baseline pointer moves only when an authorization act by harbor-master quotes a sealed assessment hash and names the new realization hashes.
- Restatement: The baseline pointer moves only when harbor-master quotes a sealed assessment hash and names the new realization hashes.
- Violation-looks-like: The baseline file's Installed-by is missing, or its quoted hash does not match an authorization act, or the actor is not harbor-master.
- Binds: baseline
- Change-class: intent-revision

### RULE-DEP — Copies name their source

- Kind: intent
- Statement: If a part's Norm value is copied from another part's Norm value, the copying part Depends-on the source part.
- Restatement: A part that copies another part's Norm value lists that part on Depends-on.
- Violation-looks-like: Equal Norm values across parts without a Depends-on edge toward the source.
- Binds: P-LOAD, P-NOTICE, P-CREW
- Change-class: intent-revision
