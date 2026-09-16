{ pkgs, ... }: {
  imports = [
    ./mpd.nix
    ./mpv.nix
    ./playerctl.nix

    ./mpris-notifier
    ./rmpc
  ];

  home.packages = with pkgs; [
    mpc
    rmpc
  ];
}
