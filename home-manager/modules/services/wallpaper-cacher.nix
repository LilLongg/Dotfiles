{ config, ... }: {
  systemd.user.services.wallpaper-cacher = {
    Unit = {
      Description = "Cache wallpapers preview";
      Wants = [ "default.target" ];
      After = [ "default.target" ];
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${./scripts/wallpaper-cacher.py}";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
      Environment = [
        "XDG_WALLPAPER_DIR=${config.xdg.userDirs.extraConfig.WALLPAPER}"
        "XDG_WPP_CACHE_DIR=${config.xdg.userDirs.extraConfig.WPP_CACHE}"
      ];
    };
  };
}
