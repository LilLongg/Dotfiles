{
  systemd.user.services.browser-on-ram = {
    Unit = {
      Description = "Save and Restore Browser data on /dev/shm";
      Wants = [ "graphical-session.target" ];
      Before = [ "graphical-session.target" ];
    };
    Install.WantedBy = [ "graphical-session.target" ];
    Service = {
      Type = "oneshot";
      ExecStart = "${./scripts/restore-browser-data}";
      ExecStop = "${./scripts/save-browser-data}";
      RemainAfterExit = true;
    };
  };
}
