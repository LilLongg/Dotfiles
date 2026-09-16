{ pkgs, ... }: {
  systemd.user.services.mpris-notifier = {
    Unit = {
      Description = "Notifier daemon for MPRIS.";
      Wants = [ "dbus" ];
      After = [ "dbus" ];
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.mpris-notifier}/bin/mpris-notifier";
      Restart = "always";
      RestartSec = 5;
    };
  };
}
