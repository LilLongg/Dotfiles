{ config, ... }: {
  xdg.dataFile."scripts/playerctl.py".source = ./playerctl.py;
  xdg.dataFile."scripts/playerctl-follow.py".source = ./playerctl-follow.py;
  xdg.dataFile."scripts/playerctl-toggle-loop".source = ./playerctl-toggle-loop;
  xdg.dataFile."scripts/mpris-monitor.py".source = ./mpris-monitor.py;

  systemd.user.services.mpris-monitor = {
    Unit = {
      Description = "Monitor the default player controlled by mpris";
      Wants = [
        "dbus.service"
      ];
      After = [
        "dbus.service"
      ];
    };
    Install = {
      WantedBy = [
        "dbus.service"
      ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${config.xdg.dataHome}/scripts/mpris-monitor.py";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
