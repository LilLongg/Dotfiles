#!/usr/bin/env bash

git lfs clone https://github.com/LilLongg/Wallpaper.git ~/Wallpaper
rm -rf ~/.config/fish

cd ~/Dotfiles
sudo nixos-rebuild switch --flake . --impure
sleep 3
home-manager switch --flake . --impure

pywalfox install
home-manager/scripts/wpg-install.sh -iG
home-manager/scripts/initbg
