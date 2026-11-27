{ pkgs, pkgs-stable, ... }:
{
  home.packages = [
    pkgs.ani-cli
    pkgs.awww
    pkgs.blueman
    pkgs.brightnessctl
    pkgs.cpx
    pkgs.devenv
    pkgs.ffmpeg-full
    pkgs.gtk3
    pkgs.gtk4
    pkgs.inotify-tools
    pkgs.iwgtk
    pkgs.libnotify
    pkgs.nautilus
    pkgs.p7zip
    pkgs.pywalfox-native
    pkgs.trash-cli
    pkgs.viewnior
    pkgs.wget
    pkgs.wget2
    pkgs.wl-clipboard

    (pkgs.python3.withPackages (
      ps: with ps; [
        colorspacious
        opencv-python-headless
      ]
    ))
  ];
}
