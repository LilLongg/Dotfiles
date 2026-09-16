{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ./style.css;
  };

  imports = [
    ./config.nix
  ];
}
