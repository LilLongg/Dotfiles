{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ani-cli
    audacity
    awww
    bc
    bluetui
    brightnessctl
    cava
    cpx
    devenv
    dua
    dysk
    ffmpeg-full
    file-roller
    gcc
    impala
    libnotify
    nautilus
    p7zip
    proton-vpn
    trash-cli
    uv
    viewnior
    wl-clipboard
    wl-mirror
    wlr-utils

    (python3.withPackages (
      ps: with ps; [
        opencv-python-headless
        psutil
        requests
      ]
    ))
  ];
}
