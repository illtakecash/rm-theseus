"""CLI entrypoint. `week --csv` stays inside the decided command. `sync` does not."""

import sys

from ledger.csv_store import append_entry
from ledger.sync_server import serve
from ledger.totals import weekly_totals, write_export


def read_entries(path):
    from ledger.csv_store import read_all
    return read_all(path)


def week_command(csv_path, export_path=None):
    totals = weekly_totals(read_entries(csv_path))
    if export_path:
        write_export(export_path, totals)
    return totals


def main(argv):
    cmd = argv[1] if len(argv) > 1 else ""
    if cmd == "add":
        return append_entry("entries.csv", argv[2], argv[3], argv[4])
    if cmd == "week":
        export_path = None
        if len(argv) > 3 and argv[2] == "--csv":
            export_path = argv[3]
        return week_command("entries.csv", export_path)
    if cmd == "sync":
        return serve()
    raise SystemExit("usage: add | week [--csv <file>] | sync")


if __name__ == "__main__":
    main(sys.argv)
