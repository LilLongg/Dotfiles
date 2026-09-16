{ config, ... }: {
  systemd.user.services.clean-home-directory = {
    Unit = {
      Description = "Remove invalid encoding files in home directory";
      Wants = [
        "multi-user.target"
        "sleep.target"
      ];
      After = [
        "multi-user.target"
        "sleep.target"
      ];
    };
    Install = {
      WantedBy = [
        "multi-user.target"
        "sleep.target"
      ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${config.xdg.dataHome}/scripts/remove-bad-files.py";
    };
  };
}
