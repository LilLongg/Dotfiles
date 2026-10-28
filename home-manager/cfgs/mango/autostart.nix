{ config, ... }: {
  wayland.windowManager.mango.autostart_sh = ''
    sleep 3
    ${config.xdg.binHome}/initbg &
    wlr-draw &
    steam -silent &
    vesktop --start-minimized &
    ferdium --start-minimized &
  '';
}
