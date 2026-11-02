{ pkgs, ... }: {
  home.packages = with pkgs; [ wlr-utils ];
  imports = [
    ./config.nix
    ./wlr-overlayd.nix
  ];
}
