{
  systemd.user.services.ferdium-on-ram = {
    Unit = {
      Description = "Save and Restore Ferdium data on /dev/shm";
      Wants = [ "graphical-session.target" ];
      Before = [ "graphical-session.target" ];
    };
    Install.WantedBy = [ "graphical-session.target" ];
    Service = {
      Type = "oneshot";
      ExecStart = "${./scripts/restore-ferdium-data}";
      ExecStop = "${./scripts/save-ferdium-data}";
      RemainAfterExit = true;
    };
  };
}
