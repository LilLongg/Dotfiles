{ config, ... }: {
  xdg.dataFile."scripts/save-vesktop-data".source = ./scripts/save-vesktop-data;
  xdg.dataFile."scripts/restore-vesktop-data".source = ./scripts/restore-vesktop-data;
  systemd.user.services.vesktop-on-ram = {
    Unit = {
      Description = "Save and Restore Vesktop data on /dev/shm";
      Wants = [ "graphical-session.target" ];
      Before = [ "graphical-session.target" ];
    };
    Install.WantedBy = [ "graphical-session.target" ];
    Service = {
      Type = "oneshot";
      ExecStart = "${config.xdg.dataHome}/scripts/restore-vesktop-data";
      ExecStop = "${config.xdg.dataHome}/scripts/save-vesktop-data";
      RemainAfterExit = true;
    };
  };
}
