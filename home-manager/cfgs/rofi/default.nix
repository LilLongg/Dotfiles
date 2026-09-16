{ config, ... }: {
  programs.rofi = {
    enable = true;
    configPath = "${config.xdg.configHome}/rofi/_.rasi";
  };

  xdg.configFile."rofi/config.rasi".source = ./config.rasi;
  xdg.configFile."rofi/wallpaper.rasi".source = ./wallpaper.rasi;
}
