{ pkgs, pkgs-stable, ... }:
{
  home.packages = [
    pkgs.ani-cli
    pkgs.audacity_3
    pkgs.awww
    pkgs.bc
    pkgs.bluetui
    pkgs.brightnessctl
    pkgs.cava
    pkgs.cpx
    pkgs.devenv
    pkgs.dua
    pkgs.dysk
    pkgs.ffmpeg-full
    pkgs.impala
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
        psutil
        pyqt6
      ]
    ))
  ];
}
