## Drift finding
Verdict: drift
Where: step 3 (2026-10-15, `sync` command)
Conflicts with: D1 (2026-10-01) "Store entries in one local CSV file", D2 (2026-10-03) "Python standard library only", D3 (2026-10-08) "Weekly totals computed on read, never stored", non-goals "No server", "No database"
Why it is drift: It adds a server and a database, and it persists a weekly_totals table. That table is stored state. A derived `week --csv` export, recomputed from the CSV on read, is not stored and is not this drift.
Alternate path: Keep entries in the one CSV. If a file of totals is needed, `week --csv` writes a derived on-read export. That is a local option, not a new service.
Correction: Revert the `sync` step. If a phone app becomes a goal, the owner amends the objective and records one new decision that supersedes every decision it retires, for example D4 with `Supersedes: D1, D2, D3`.
CodeGraph: not required (docs-only trajectory)
Next trigger: Any commit adding a dependency, network listener, or new storage.
