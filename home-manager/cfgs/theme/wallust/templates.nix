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
    colors-json = {
      src = "colors.json";
      dst = "${config.xdg.cacheHome}/wal/colors.json";
    };
    gtk3 = {
      src = "gtk.css";
      dst = "${config.xdg.configHome}/gtk-3.0/gtk.css";
    };
    gtk4 = {
      src = "gtk.css";
      dst = "${config.xdg.configHome}/gtk-4.0/gtk.css";
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
    quickshell = {
      src = "quickshell.json";
      dst = "${config.xdg.configHome}/quickshell/Common/colors.json";
    };
    rofi = {
      src = "rofi.rasi";
      dst = "${config.xdg.configHome}/rofi/colors.rasi";
    };
    vesktop = {
      src = "vesktop.css";
      dst = "${config.xdg.configHome}/vesktop/settings/quickCss.css";
    };
    wleave = {
      src = "wleave.css";
      dst = "${config.xdg.configHome}/wleave/colors.css";
    };
    wlr-utils = {
      src = "wlr-utils.toml";
      dst = "${config.xdg.configHome}/wlr-utils/themes/wallust.toml";
    };
  };
}
