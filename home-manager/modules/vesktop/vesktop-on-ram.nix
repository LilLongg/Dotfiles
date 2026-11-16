{
  systemd.user.services.vesktop-on-ram = {
    Unit = {
      Description = "Save and Restore Vesktop data on /dev/shm";
      Wants = [ "graphical-session.target" ];
      Before = [ "graphical-session.target" ];
    };
    Install.WantedBy = [ "graphical-session.target" ];
    Service = {
      Type = "oneshot";
      ExecStart = "${./scripts/restore-vesktop-data}";
      ExecStop = "${./scripts/save-vesktop-data}";
      RemainAfterExit = true;
    };
  };
}
