{ config, ... }: {
  wayland.windowManager.mango.autostart_sh = ''
    sleep 1
    systemctl --user restart waybar &
    ${config.xdg.dataHome}/scripts/initbg &
    ${config.xdg.dataHome}/scripts/remove-bad-files.py &
    sleep 1
    wlr-draw &
    steam -silent &
    vesktop --start-minimized &
    ferdium --start-minimized &
  '';
}
