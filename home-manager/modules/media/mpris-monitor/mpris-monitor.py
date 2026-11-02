#!/usr/bin/env python

import os
import signal
import subprocess
from pathlib import Path
from tempfile import NamedTemporaryFile


STATE_DIR = Path("/tmp/mpris-monitor")
STATE_DIR.mkdir(parents=True, exist_ok=True)
PLAYER_FILE = STATE_DIR / "default-player.txt"
PLAYER_FILE.touch(exist_ok=True)

default_player = ""


def write_to_file(filepath: Path, data: str) -> None:
    with NamedTemporaryFile("w", dir=filepath.parent, delete=False) as temp_file:
        temp_file_name = temp_file.name
        try:
            temp_file.write(data)
            temp_file.flush()
            os.fsync(temp_file.fileno())
        except:  # noqa: E722
            os.unlink(temp_file_name)
            return

    try:
        os.chmod(temp_file_name, 0o644)
        os.replace(temp_file_name, filepath)
    except:  # noqa: E722
        os.unlink(temp_file_name)


def update_player(new_player: str) -> None:
    global default_player
    default_player = new_player
    write_to_file(PLAYER_FILE, new_player)


def get_player() -> str:
    return subprocess.run(
        ["playerctl", "metadata", "-f", "{{playerName}}"],
        check=False,
        capture_output=True,
        text=True,
    ).stdout.rstrip()


def get_players() -> list[str]:
    return [
        player.split(".")[0]
        for player in subprocess.run(
            ["playerctl", "-l"],
            check=False,
            capture_output=True,
            text=True,
        )
        .stdout.rstrip()
        .split()
    ]


def get_next_player(index: int) -> str:
    players = get_players()
    if not players:
        return ""

    try:
        player_index = (players.index(default_player) + index) % len(players)
    except ValueError:
        player_index = 0

    return players[player_index]


def shift(signum, frame) -> None:
    update_player(get_next_player(1))


def unshift(signum, frame) -> None:
    update_player(get_next_player(-1))


signal.signal(signal.SIGUSR1, shift)
signal.signal(signal.SIGUSR2, unshift)

changes_monitor = subprocess.Popen(
    ["playerctl", "metadata", "-f", "{{playerName}}", "-F"],
    stdout=subprocess.PIPE,
    stderr=subprocess.DEVNULL,
    text=True,
)

for change in changes_monitor.stdout:
    update_player(change.rstrip())
