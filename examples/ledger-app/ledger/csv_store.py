"""D1: one local CSV is the source of truth for entries."""

import csv


def read_all(path):
    with open(path, newline="") as handle:
        return list(csv.DictReader(handle))


def append_entry(path, day, hours, note):
    with open(path, "a", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow([day, hours, note])
