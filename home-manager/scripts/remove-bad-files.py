#!/usr/bin/env python

from pathlib import Path

for file in Path.home().iterdir():
    try:
        data = bytes(file)
        data = data.decode()
    except UnicodeDecodeError:
        file.unlink()
