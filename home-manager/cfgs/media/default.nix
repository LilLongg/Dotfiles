{ pkgs, ... }: {
  imports = [
    ./mpd.nix
    ./mpv.nix

    ./mpris-monitor
    ./rmpc
  ];

  services.playerctld.enable = true;
  home.packages = with pkgs; [
    mpc
    rmpc
  ];
}
