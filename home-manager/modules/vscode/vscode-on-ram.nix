{ config, ... }: {
  systemd.user.services.vscode-on-ram = {
    Unit = {
      Description = "Save and Restore Vscode data on /dev/shm";
      Wants = [ "graphical-session.target" ];
      Before = [ "graphical-session.target" ];
    };
    Install.WantedBy = [ "graphical-session.target" ];
    Service = {
      Type = "oneshot";
      ExecStart = "${config.xdg.dataHome}/scripts/restore-vscode-data";
      ExecStop = "${config.xdg.dataHome}/scripts/save-vscode-data";
      RemainAfterExit = true;
    };
  };
}
