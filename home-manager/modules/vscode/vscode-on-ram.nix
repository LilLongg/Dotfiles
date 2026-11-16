{
  systemd.user.services.vscode-on-ram = {
    Unit = {
      Description = "Save and Restore Vscode data on /dev/shm";
      Wants = [ "graphical-session.target" ];
      Before = [ "graphical-session.target" ];
    };
    Install.WantedBy = [ "graphical-session.target" ];
    Service = {
      Type = "oneshot";
      ExecStart = "${./scripts/restore-vscode-data}";
      ExecStop = "${./scripts/save-vscode-data}";
      RemainAfterExit = true;
    };
  };
}
