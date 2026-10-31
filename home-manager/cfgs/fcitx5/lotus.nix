{ pkgs, config, ... }: {
  xdg.configFile."fcitx5/conf/lotus.conf".source = ./conf/lotus.conf;
  systemd.user.services.fcitx5-lotus-server = {
    Unit = {
      Description = "Fcitx5-lotus-server";
      Wants = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.fcitx5-lotus}/bin/fcitx5-lotus-server -u ${config.home.username}";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
