#!/usr/bin/env python

from sys import argv
from subprocess import run


with open("/tmp/mpris-monitor/default-player.txt", "r") as buffer:
    default_player = buffer.read()


run(["playerctl", *argv[1:], "-p", default_player], check=False)
