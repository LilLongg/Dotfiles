{ config, ... }: {
  xdg.configFile."wallust/templates" = {
    source = ./templates;
    recursive = true;
  };
  programs.wallust.settings.templates = {
    cava = {
      src = "cava";
      dst = "${config.xdg.configHome}/cava/config";
    };
    colors = {
      src = "colors";
      dst = "${config.xdg.cacheHome}/wal/colors";
    };
    gtk-dark = {
      src = "gtk.css";
      dst = "${config.xdg.dataHome}/themes/linea-nord-color/general/dark.css";
    };
    gtk-light = {
      src = "gtk.css";
      dst = "${config.xdg.dataHome}/themes/linea-nord-color/general/light.css";
    };
    gtkrc = {
      src = "gtkrc";
      dst = "${config.xdg.dataHome}/themes/linea-nord-color/gtk-2.0/gtkrc";
    };
    helix = {
      src = "helix.toml";
      dst = "${config.xdg.configHome}/helix/themes/wallust.toml";
    };
    hyprlock = {
      src = "hyprlock.conf";
      dst = "${config.xdg.configHome}/hypr/colors.conf";
    };
    kitty = {
      src = "kitty.conf";
      dst = "${config.xdg.configHome}/kitty/colors.conf";
    };
    mango = {
      src = "mango.conf";
      dst = "${config.xdg.configHome}/mango/theme.conf";
    };
    niri = {
      src = "niri.kdl";
      dst = "${config.xdg.configHome}/niri/colors.kdl";
    };
    pywalfox = {
      src = "colors.json";
      dst = "${config.xdg.cacheHome}/wal/colors.json";
    };
    rofi = {
      src = "rofi.rasi";
      dst = "${config.xdg.configHome}/rofi/colors.rasi";
    };
    swaync = {
      src = "swaync.css";
      dst = "${config.xdg.configHome}/swaync/colors.css";
    };
    vesktop = {
      src = "vesktop.css";
      dst = "${config.xdg.configHome}/vesktop/settings/quickCss.css";
    };
    waybar = {
      src = "waybar.css";
      dst = "${config.xdg.configHome}/waybar/colors.css";
    };
    wleave = {
      src = "wleave.css";
      dst = "${config.xdg.configHome}/wleave/colors.css";
    };
    wlr-chooser = {
      src = "wlr-chooser.toml";
      dst = "${config.xdg.configHome}/wlr-chooser/theme.toml";
    };
  };
}
