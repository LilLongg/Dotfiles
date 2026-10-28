{ pkgs, ... }: {
  programs.quickshell = {
    enable = true;
    systemd.enable = true;
  };
  xdg.configFile."quickshell" = {
    source = ./config;
    recursive = true;
  };
  home.packages = with pkgs; [
    qt6.qt5compat
  ];
}
