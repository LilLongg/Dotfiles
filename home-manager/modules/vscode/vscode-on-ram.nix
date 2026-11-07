{ config, ... }: {
  xdg.dataFile."scripts/save-vscode-data".source = ./scripts/save-vscode-data;
  xdg.dataFile."scripts/restore-vscode-data".source = ./scripts/restore-vscode-data;
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
