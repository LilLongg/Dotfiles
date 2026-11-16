{ config, ... }: {
  xdg = {
    enable = true;
    mime.enable = true;
    localBinInPath = true;
    terminal-exec = {
      enable = true;
      settings.default = [ "kitty.desktop" ];
    };
    userDirs = {
      enable = true;
      createDirectories = true;
      setSessionVariables = true;
      extraConfig = {
        RECORDS = "${config.xdg.userDirs.videos}/Records";
        SCREENSHOTS = "${config.xdg.userDirs.pictures}/Screenshots";
        SCRIPTS = "${config.xdg.dataHome}/scripts";
        WALLPAPER = "${config.home.homeDirectory}/Wallpaper";
        WPP_CACHE = "${config.xdg.cacheHome}/wpp";
      };
    };
  };
  home.sessionVariables = {
    GTK_USE_PORTAL = 1;
  };
}
