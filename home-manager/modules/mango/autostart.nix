{ config, ... }: {
  wayland.windowManager.mango.autostart_sh = ''
    ${config.xdg.binHome}/initbg &
    sleep 5
    wlr-draw &
    steam -silent &
    vesktop --start-minimized &
    ferdium --start-minimized &
    systemctl --user restart fcitx5-daemon.service &
  '';
}
