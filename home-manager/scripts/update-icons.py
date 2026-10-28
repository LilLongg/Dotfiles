#!/usr/bin/env python


import os
import json
from pathlib import Path
from itertools import batched
from subprocess import run

from colorspacious import deltaE


COLORS_PATH = (
    Path(os.environ["XDG_CONFIG_HOME"]) / "quickshell" / "Common" / "colors.json"
)
COLORS_THEME = {
    "black": [79, 79, 79],
    "blue": [82, 148, 226],
    "bluegrey": [96, 125, 139],
    "brown": [174, 142, 108],
    "carmine": [163, 0, 2],
    "cyan": [0, 188, 212],
    "darkcyan": [69, 171, 183],
    "deeporange": [235, 102, 55],
    "green": [135, 177, 88],
    "grey": [142, 142, 142],
    "indigo": [92, 107, 192],
    "magenta": [202, 113, 223],
    "orange": [238, 146, 58],
    "palebrown": [209, 191, 174],
    "paleorange": [238, 202, 143],
    "pink": [240, 98, 146],
    "red": [226, 82, 82],
    "teal": [22, 160, 133],
    "violet": [126, 87, 194],
    "white": [228, 228, 228],
    "yellow": [249, 189, 48],
}

with open(COLORS_PATH, "r") as buffer:
    data = json.load(buffer)

accent_color = data["accent"]
accent_rgb = [int(a + b, base=16) for a, b in batched(accent_color[1:], 2)]
closest_color = min(
    COLORS_THEME.items(),
    key=lambda color: deltaE(accent_rgb, color[1], "sRGB255", "CIELab"),
)[0]
run(["papirus-folders", "-C", closest_color], check=False)
