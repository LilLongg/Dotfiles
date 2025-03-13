#!/usr/bin/fish

sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB

sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

echo [chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist >> /etc/pacman.conf

sudo pacman -Sy yay
yay -S $(cat packages.txt) --noconfirm

stow home --adopt
cp .fcitx5-profile ~/.config/fcitx5/profile

sudo cp update-db.service /etc/systemd/system/
sudo cp -r custom /usr/share/sddm/themes
sudo cp pixelon.regular.ttf /usr/share/fonts
echo [Current]\nCurrent=custom | sudo tee /etc/sddm.conf
echo "#!/bin/bash"\n\npacman -Sy | sudo tee /etc/cron.hourly/update_db
sudo chmod +x /etc/cron.hourly/update_db
sudo cp grub /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
for profile in (find ~/.zen -mindepth 1 -maxdepth 1 -type d); cp -r chrome $profile; end

systemctl enable --user mpd mpd-notification pipewire-pulse wireplumber waybar
sudo systemctl enable bluetooth ufw cronie sddm update-db

reboot
