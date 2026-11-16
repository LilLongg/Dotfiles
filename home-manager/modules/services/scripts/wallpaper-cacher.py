#!/usr/bin/env python


import subprocess
from os import environ
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor


WPP_DIR = Path(environ["XDG_WALLPAPER_DIR"])
WPP_CACHE_DIR = Path(environ["XDG_WPP_CACHE_DIR"])


def process_wallpaper(entry: Path) -> None:
    if entry.name.startswith(".git"):
        return

    cached_path = WPP_CACHE_DIR / f"{entry.name}.png"
    if cached_path.exists() and entry.stat().st_mtime <= cached_path.stat().st_mtime:
        return

    match entry.suffix:
        case ".mp4" | ".gif":
            subprocess.run(
                ["ffmpeg", "-y", "-i", entry, "-frames:v", "1", cached_path],
                check=False,
            )
        case _:
            subprocess.run(["ffmpeg", "-y", "-i", entry, cached_path], check=False)


with ThreadPoolExecutor() as executor:
    executor.map(process_wallpaper, WPP_DIR.iterdir())

    wallpaper_watcher = subprocess.Popen(
        ["inotifywait", "-q", "-m", "-e", "modify", WPP_DIR],
        stdout=subprocess.PIPE,
        stderr=subprocess.DEVNULL,
        text=True,
        bufsize=1,
    )
    for change in wallpaper_watcher.stdout:
        changed_file = change.split()[-1]
        executor.submit(process_wallpaper, WPP_DIR / changed_file)
