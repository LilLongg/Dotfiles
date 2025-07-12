#!/usr/bin/fish

if test -f ~/.current_wpp
    set -l IMG_PATH (readlink ~/.current_wpp)

    if contains (string split . $IMG_PATH | tail -n1) mp4 gif MP4 GIF
        nice xwinwrap -ov -fs -fdt -ni -- mpv -wid WID -loop $IMG_PATH &
    else
        feh --no-fehbg --bg-scale $IMG_PATH
    end
else
    $HOME/.config/i3/scripts/bgaction.fish (find ~/Wallpaper/* | shuf | head -n1)
end
