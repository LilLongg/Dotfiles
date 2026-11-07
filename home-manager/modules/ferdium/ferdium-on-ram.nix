{ config, ... }: {
  xdg.dataFile."scripts/save-ferdium-data".source = ./scripts/save-ferdium-data;
  xdg.dataFile."scripts/restore-ferdium-data".source = ./scripts/restore-ferdium-data;
  systemd.user.services.ferdium-on-ram = {
    Unit = {
      Description = "Save and Restore Ferdium data on /dev/shm";
      Wants = [ "graphical-session.target" ];
      Before = [ "graphical-session.target" ];
    };
    Install.WantedBy = [ "graphical-session.target" ];
    Service = {
      Type = "oneshot";
      ExecStart = "${config.xdg.dataHome}/scripts/restore-ferdium-data";
      ExecStop = "${config.xdg.dataHome}/scripts/save-ferdium-data";
      RemainAfterExit = true;
    };
  };
}
