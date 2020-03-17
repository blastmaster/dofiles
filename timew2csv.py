#! /usr/bin/env python3

''' timew2csv.py - convert timewarrior json-reports to csv.
    Usage: `timew export :yesterday | ./timew2csv.py`
'''

import sys
import json
from datetime import datetime
from typing import Generator

if sys.version_info.minor < 8:
    sys.exit("Error need python version >= python3.8")


TIMEW_DATE_FORMAT = '%Y%m%dT%H%M%SZ'
OUTPUT_FORMAT = '%d-%m-%Y %H:%M:%S'

def decode(data: dict) -> Generator:

    for interval in data:
        if start := interval.get('start'):
            yield datetime.strptime(start, TIMEW_DATE_FORMAT)
        if end := interval.get('end'):
            yield datetime.strptime(end, TIMEW_DATE_FORMAT)
        if tags := interval.get('tags'):
            yield " ".join(tags)


if __name__ == "__main__":
    data = json.load(sys.stdin)
    data_gen = decode(data)
    while True:
        try:
            start_t = next(data_gen)
            end_t = next(data_gen)
            tag_str = next(data_gen)
            print("{},{},{}".format(start_t.strftime(OUTPUT_FORMAT),
                end_t.strftime(OUTPUT_FORMAT), tag_str))
        except StopIteration:
            break

