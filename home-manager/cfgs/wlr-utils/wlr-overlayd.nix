{ pkgs, ... }: {
  systemd.user.services.wlr-overlayd = {
    Unit = {
      Description = "Overlay daemon for wlr-switcher and wlr-chooser";
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
      Requisite = [ "graphical-session.target" ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.wlr-utils}/bin/wlr-overlayd";
      Restart = "on-failure";
      RestartSec = 1;
    };
  };
}
