"""Second entrypoint: a server and a stored totals table. Not in the objective."""

from ledger.csv_store import read_all
from ledger.postgres_totals import WeeklyTotalsRepository
from ledger.totals import weekly_totals


def persist_totals(csv_path):
    rows = read_all(csv_path)
    snapshot = weekly_totals(rows)
    return WeeklyTotalsRepository().save(snapshot)


def serve(csv_path="entries.csv", host="127.0.0.1", port=5000):
    from flask import Flask

    app = Flask("ledger_sync")
    saved = persist_totals(csv_path)

    def health():
        return "ok"

    app.add_url_rule("/health", view_func=health)
    app.run(host=host, port=port)
    return saved
