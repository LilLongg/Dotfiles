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
    pkgs.file-roller
    pkgs.gcc
    pkgs.impala
    pkgs.inotify-tools
    pkgs.libnotify
    pkgs.nautilus
    pkgs.p7zip
    pkgs.proton-vpn
    pkgs.trash-cli
    pkgs.uv
    pkgs.viewnior
    pkgs.wget
    pkgs.wget2
    pkgs.wl-clipboard
    pkgs.wl-mirror
    pkgs.wlr-utils

    (pkgs.python3.withPackages (
      ps: with ps; [
        colorspacious
        opencv-python-headless
        psutil
        requests
      ]
    ))
  ];
}
