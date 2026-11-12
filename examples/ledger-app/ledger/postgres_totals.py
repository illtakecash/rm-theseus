"""Stored weekly totals. This table is a second source of truth (contradicts D3)."""


class WeeklyTotalsRepository:
    def __init__(self):
        self.table = "weekly_totals"

    def save(self, totals):
        return {"table": self.table, "rows": list(totals.items())}
