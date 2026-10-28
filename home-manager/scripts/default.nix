{ config, pkgs, ... }: {
  home.file."${config.xdg.binHome}/bgaction".source = ./bgaction;
  home.file."${config.xdg.binHome}/initbg".source = ./initbg;
  home.file."${config.xdg.binHome}/install-themes.sh".source = ./install-themes.sh;
  home.file."${config.xdg.binHome}/screenrec".source = ./screenrec;
  home.file."${config.xdg.binHome}/screenshot".source = ./screenshot;
  home.file."${config.xdg.binHome}/select-cliphist".source = ./select-cliphist;
  home.file."${config.xdg.binHome}/select-wpp".source = ./select-wpp;

  xdg.dataFile."scripts/battery.sh".source = ./battery.sh;
  xdg.dataFile."scripts/cpu-monitor.py".source = ./cpu-monitor.py;
  xdg.dataFile."scripts/image-theme.py".source = ./image-theme.py;
  xdg.dataFile."scripts/record_status".source = ./record_status;
  xdg.dataFile."scripts/remove-bad-files.py".source = ./remove-bad-files.py;
  xdg.dataFile."scripts/restore-browser-data".source = ./restore-browser-data;
  xdg.dataFile."scripts/restore-ferdium-data".source = ./restore-ferdium-data;
  xdg.dataFile."scripts/restore-vesktop-data".source = ./restore-vesktop-data;
  xdg.dataFile."scripts/restore-vscode-data".source = ./restore-vscode-data;
  xdg.dataFile."scripts/save-browser-data".source = ./save-browser-data;
  xdg.dataFile."scripts/save-ferdium-data".source = ./save-ferdium-data;
  xdg.dataFile."scripts/save-vesktop-data".source = ./save-vesktop-data;
  xdg.dataFile."scripts/save-vscode-data".source = ./save-vscode-data;
  xdg.dataFile."scripts/update-icons.py".source = ./update-icons.py;
  xdg.dataFile."scripts/waybar-wttr.py".source = ./waybar-wttr.py;

  home.packages = [
    (pkgs.callPackage ./cpp-scripts.nix { })
  ];
}
