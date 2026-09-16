#!/usr/bin/env python

import os
import re
import json
from sys import argv
from pathlib import Path
from subprocess import run
from colorsys import hls_to_rgb, rgb_to_hls


COLORSCHEME = "dark" if len(argv) < 2 else argv[1]
COLORS_PATH = Path(os.environ["XDG_CACHE_HOME"]) / "wal" / "colors.json"
ICON_UPDATE_PATH = (
    Path(os.environ["XDG_DATA_HOME"])
    / "icons"
    / "flattrcolor"
    / "scripts"
    / "replace_folder_file.sh"
)
ICON_UPDATE_RUN = (
    Path(os.environ["XDG_DATA_HOME"])
    / "icons"
    / "flattrcolor"
    / "scripts"
    / "replace_script.sh"
)


def hls_to_hex(h: float, l: float, s: float) -> str:
    r, g, b = hls_to_rgb(h, l, s)
    r_hex = int(r * 255)
    g_hex = int(g * 255)
    b_hex = int(b * 255)
    return f"#{r_hex:02X}{g_hex:02X}{b_hex:02X}"


with open(COLORS_PATH, "r") as buffer:
    colors = json.load(buffer)


icon_color_hex = colors["colors"]["color1"]
icon_r = int(icon_color_hex[1:3], base=16) / 255
icon_g = int(icon_color_hex[3:5], base=16) / 255
icon_b = int(icon_color_hex[5:7], base=16) / 255

icon_h, icon_l, icon_s = rgb_to_hls(icon_r, icon_g, icon_b)
front_l = min(icon_l * 0.8 if COLORSCHEME == "dark" else icon_l * 1.3, 1)
back_l = icon_l * 0.55 if COLORSCHEME == "dark" else icon_l
glyph_l = max(back_l - 0.06, 0)

front_color_hex = hls_to_hex(icon_h, front_l, icon_s)
back_color_hex = hls_to_hex(icon_h, back_l, icon_s)
glyph_color_hex = hls_to_hex(icon_h, glyph_l, icon_s)


with open(ICON_UPDATE_PATH, "r") as buffer:
    entry = re.compile(r"(.*)=(.*)$")
    entry_dict = {}
    for line in buffer:
        if match := entry.search(line):
            entry_dict[match.group(1)] = match.group(2)

with open(ICON_UPDATE_PATH, "w") as buffer:
    buffer.write(f"""
#!/usr/bin/env bash

oldglyph={entry_dict["newglyph"]}
newglyph={glyph_color_hex}
oldfront={entry_dict["newfront"]}
newfront={front_color_hex}
oldback={entry_dict["newback"]}
newback={back_color_hex}

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
        """)

run(ICON_UPDATE_RUN)
