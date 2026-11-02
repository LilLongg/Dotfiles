{ config, ... }: {
  systemd.user.services.browser-on-ram = {
    Unit = {
      Description = "Save and Restore Browser data on /dev/shm";
      Wants = [ "graphical-session.target" ];
      Before = [ "graphical-session.target" ];
    };
    Install.WantedBy = [ "graphical-session.target" ];
    Service = {
      Type = "oneshot";
      ExecStart = "${config.xdg.dataHome}/scripts/restore-browser-data";
      ExecStop = "${config.xdg.dataHome}/scripts/save-browser-data";
      RemainAfterExit = true;
    };
  };
}
