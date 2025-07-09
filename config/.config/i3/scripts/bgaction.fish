#!/usr/bin/fish

set -l LOCK_FILE ~/.wppvidlock
set -l IMG_PATH $argv[1]
set -l IMG_NAME (basename $IMG_PATH)
set -l IMG_CACHE ~/.cache/wpp/$IMG_NAME.JPG
ln -sf $IMG_PATH ~/.current_wpp
ln -sf $IMG_CACHE ~/.config/hypr/asset/LOCK.JPG

switch (string split . $IMG_PATH | tail -n1)
    case mp4 MP4
        if not test -f $LOCK_FILE
            touch $LOCK_FILE
        end
        if not test -f $IMG_CACHE
            ffmpeg -i $IMG_PATH -vf "select=eq(n\,0)" -q:v 1 $IMG_CACHE
        end
        nice xwinwrap -ov -fs -fdt -ni -- mpv -wid WID -loop $IMG_PATH &
    case gif GIF
        if test -f $LOCK_FILE
            sh -c "rm $LOCK_FILE"
        end
        if not test -f $IMG_CACHE
            ffmpeg -i $IMG_PATH -vframes 1 $IMG_CACHE
        end
        nice xwinwrap -ov -fs -fdt -ni -- mpv -wid WID -loop $IMG_PATH &
    case '*'
        if test -f $LOCK_FILE
            sh -c "rm $LOCK_FILE"
        end
        kill xwinwrap
        if not test -f $IMG_CACHE
            ffmpeg $IMG_PATH $IMG_CACHE
        end
        feh --no-fehbg --bg-scale $IMG_PATH
end

matugen image $IMG_CACHE
wallust run $IMG_CACHE

cp ~/.cache/wallust/sequences ~/.cache/wal/sequences
sed -i 's/""/"~\/.config\/hypr\/asset\/LOCK.JPG"/g' ~/.cache/wal/colors.json

pywalfox update
pkill -USR2 cava
dunstctl reload
