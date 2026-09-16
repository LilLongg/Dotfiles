#!/usr/bin/env bash

nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ./disko.nix
nixos-generate-config --root /mnt
cp ./configuration.nix /mnt/etc/nixos/configuration.nix
nixos-install
nixos-enter --root /mnt -c "passwd TNonggChann"
