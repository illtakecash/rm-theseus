"""D3: weekly totals are computed on read. write_export is a derived file, not a store."""


def weekly_totals(rows):
    totals = {}
    for row in rows:
        week = row["day"][:7]
        totals[week] = totals.get(week, 0) + float(row["hours"])
    return totals


def write_export(path, totals):
    """Derived on-read export. Recomputed from entries; not a second source of truth."""
    with open(path, "w", encoding="utf-8") as handle:
        for week, hours in sorted(totals.items()):
            handle.write(f"{week},{hours}\n")
