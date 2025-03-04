#!/usr/bin/fish

yay -Syu $(cat packages.txt) --noconfirm

systemctl enable --user --now mpd mpd-notification
stow home --adopt

sudo cp -r custom /usr/share/sddm/themes
sudo cp pixelon.regular.ttf /usr/share/fonts
echo [Current]\nCurrent=custom | sudo tee /etc/sddm.conf
sudo cp grub /etc/default/grub
sudo grub-grub-mkconfig -o /boot/grub/grub.cfg
for profile in (find ~/.zen -mindepth 1 -maxdepth 1 -type d); cp -r chrome $profile; end

sudo systemctl enable --now bluetooth firewalld cronie sddm
