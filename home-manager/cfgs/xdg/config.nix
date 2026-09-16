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
        VENV = "${config.home.homeDirectory}/.venv";
        WPP_CACHE = "${config.xdg.cacheHome}/wpp";
        SCREENSHOTS = "${config.xdg.userDirs.pictures}/Screenshots";
        RECORDS = "${config.xdg.userDirs.videos}/Records";
      };
    };
  };
  home.sessionVariables = {
    GTK_USE_PORTAL = 1;
  };
}
