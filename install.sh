#!/usr/bin/fish

yay -Syu $(cat packages.txt) --noconfirm

systemctl enable --user --now mpd mpd-notification
stow home --adopt

sudo cp -r custom /usr/share/sddm/themes
sudo cp pixelon.regular.ttf /usr/share/fonts
echo [Current]\nCurrent=custom | sudo tee /etc/sddm.conf
sudo cp grub /etc/default/grub

sudo systemctl enable --now bluetooth firewalld cronie sddm
