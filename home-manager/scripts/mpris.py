#!/usr/bin/env python

from collections import defaultdict
import json
import subprocess
import re


try:
    players = (
        subprocess.run(["playerctl", "-l"], capture_output=True, encoding="utf-8")
        .stdout.strip()
        .split("\n")
    )
except Exception as e:
    output = {"text": "Error 󰝛", "tooltip": str(e)}
    print(json.dumps(output))
    exit(0)

players_count = len(players)

if players_count == 0:
    output = {"text": "Error 󰝛", "tooltip": "No media is playing"}
    print(json.dumps(output))
    exit(0)


if (
    running_status := subprocess.run(
        ["playerctl", "status"],
        capture_output=True,
        encoding="utf-8",
    ).stdout.strip()
) == "Stopped":
    output = {"text": "Stopped 󰝛", "tooltip": "No media is playing"}
    print(json.dumps(output))
    exit(0)

metadata_all = subprocess.run(
    ["playerctl", "metadata"],
    capture_output=True,
    encoding="utf-8",
).stdout.split("\n")
data = defaultdict(str)
length = 0
active_player = ""

for metadata in metadata_all:
    field = metadata.split()
    if len(field) < 3:
        continue

    active_player = field[0]

    match field[1]:
        case "xesam:artist":
            data["artist"] = metadata.split("xesam:artist")[1].strip()
        case "xesam:albumArtist":
            data["albumArtist"] = metadata.split("xesam:albumArtist")[1].strip()
        case "xesam:title":
            data["title"] = metadata.split("xesam:title")[1].strip()
        case "xesam:album":
            data["album"] = metadata.split("xesam:album")[1].strip()
        case "mpris:length":
            length = int(field[2]) // 1_000_000
        case "mpris:artUrl":
            data["artUrl"] = field[2]

position = int(
    subprocess.run(
        ["playerctl", "position"],
        capture_output=True,
        encoding="utf-8",
    ).stdout.split(".")[0]
)

loop_status = subprocess.run(
    ["playerctl", "loop"], capture_output=True, encoding="utf-8"
).stdout.strip()
loop_icon = " " if loop_status == "Track" else ""

shuffle_status = subprocess.run(
    ["playerctl", "shuffle"], capture_output=True, encoding="utf-8"
).stdout.strip()
shuffle_icon = " " if shuffle_status == "On" else ""
running_icon = " " if running_status == "Playing" else " "

if re.match("firefox*", active_player):
    active_player = "firefox"
player_icon = {"mpd": "󰝚 ", "mpv": " ", "firefox": "󰈹 "}

artist = data.get("albumArtist", data["artist"])
title = data.get("title", "")
artist_len = len(artist)
title_len = len(title)
ARTIST_THRESHOLD = 20
TITLE_THRESHOLD = 40

if artist_len + title_len > ARTIST_THRESHOLD + TITLE_THRESHOLD:
    truncated_artist = (
        data["artist"]
        if artist_len <= ARTIST_THRESHOLD
        else "".join([artist[: ARTIST_THRESHOLD - 3], "..."])
    )
    truncated_title = (
        data["title"]
        if title_len <= TITLE_THRESHOLD
        else "".join([title[: TITLE_THRESHOLD - 3], "..."])
    )
    media_format = f"{truncated_artist} - {truncated_title}"
else:
    media_format = f"{artist} - {title}"


def format_duration():
    length_min, length_sec = divmod(length, 60)
    length_hour, length_min = divmod(length_min, 60)

    pos_min, pos_sec = divmod(position, 60)
    pos_hour, pos_min = divmod(pos_min, 60)

    if length_hour != 0:
        return f"{pos_hour:02d}:{pos_min:02d}:{pos_sec:02d}/{length_hour:02d}:{length_min:02d}:{length_sec:02d}"
    else:
        return f"{pos_min:02d}:{pos_sec:02d}/{length_min:02d}:{length_sec:02d}"


output = {
    "text": f"{player_icon.get(active_player, active_player)}{running_icon}{loop_icon}{shuffle_icon}- {media_format}",
    "tooltip": f"""
 Player: {active_player} ({running_status})
 Artist: {artist}
 Title: {title}
 Album: {data["album"]}
 Duration: {format_duration()}
 Number of players: {players_count}
""",
}

if length:
    output["text"] = (
        f"{output['text']} <small>({round(100 * position / length)}%)</small>"
    )

print(json.dumps(output))
