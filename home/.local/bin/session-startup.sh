#!/usr/bin/fish

switch $XDG_SESSION_TYPE
    case wayland
        ln -sf ~/.config/dunst/dunstrc-wayland ~/.config/dunst/dunstrc
        ln -sf ~/.config/electron-flags-wl.conf ~/.config/electron-flags.conf
        ln -sf ~/.config/code-flags-wl.conf ~/.config/code-flags.conf
        sed -i "s/terminal=.*/terminal=kitty/g" ~/.config/libfm/libfm.conf
    case x11
        ln -sf ~/.config/dunst/dunstrc-x11 ~/.config/dunst/dunstrc
        rm ~/.config/code-flags.conf ~/.config/electron-flags.conf
        sed -i "s/terminal=.*/terminal=alacritty/g" ~/.config/libfm/libfm.conf
    case '*'
end

dunstctl reload
