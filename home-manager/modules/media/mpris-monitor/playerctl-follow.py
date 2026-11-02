#!/usr/bin/env python

import subprocess
from os import environ
from sys import argv
from pathlib import Path
from threading import Thread


follower: subprocess.Popen = subprocess.Popen(["true"])


def get_player() -> str:
    with open("/tmp/mpris-monitor/default-player.txt", "r") as buffer:
        default_player = buffer.read()
    return default_player


def follow(player: str) -> None:
    global follower
    follower.terminate()
    follower = subprocess.Popen(
        ["playerctl", "metadata", "-f", argv[1], "-F", "-p", player],
        stdout=subprocess.PIPE,
        stderr=subprocess.DEVNULL,
        text=True,
    )
    for line in follower.stdout:
        print(line.rstrip(), flush=True)


Thread(target=follow, args=[get_player()]).start()
player_watcher = subprocess.Popen(
    ["inotifywait", "-m", "-e", "moved_to", "/tmp/mpris-monitor"],
    stdout=subprocess.PIPE,
    stderr=subprocess.DEVNULL,
    text=True,
)
for _ in player_watcher.stdout:
    Thread(target=follow, args=[get_player()]).start()
