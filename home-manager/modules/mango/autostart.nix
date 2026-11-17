{
  wayland.windowManager.mango.autostart_sh = ''
    initbg &
    sleep 5
    blueman-applet &
    iwgtk -i &
    wlr-draw &
    steam -silent &
    ferdium --start-minimized &
    vesktop --start-minimized &
    systemctl --user restart fcitx5-daemon.service &
  '';
}
