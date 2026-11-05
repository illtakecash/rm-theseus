## Drift finding
Verdict: drift
Where: step 3 (2026-10-15, `sync` command)
Conflicts with: D1 (2026-10-01) "Store entries in one local CSV file", D2 (2026-10-03) "Python standard library only", D3 (2026-10-08) "Weekly totals computed on read, never stored", non-goals "No server", "No database"
Why it is drift: It adds a server, a database and stored totals for a phone app the objective never asked for.
Alternate path: Keep CSV; if totals must be shared, `week --csv` writes an export file on demand.
Correction: Revert the `sync` step; if a phone app becomes a goal, first amend the objective and record D4 superseding D1-D3.
Next trigger: Any commit adding a dependency, network listener, or new storage.
