#!/usr/bin/env bash

git lfs install
git lfs clone https://github.com/LilLongg/Wallpaper.git ~/Wallpaper
rm -rf ~/.config/fish

cd ~/Dotfiles
sudo nixos-rebuild switch --flake ~/Dotfiles --impure
sleep 3
home-manager switch --flake ~/Dotfiles --impure
sleep 3
home-manager/scripts/install-themes.sh

pywalfox install
home-manager/scripts/initbg
sudo systemd-cryptenroll --tpm2-device=auto --tpm2-pcrs=0 /dev/nvme0n1p2
