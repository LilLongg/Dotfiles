#!/usr/bin/fish

sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB

sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

echo "[chaotic-aur]" "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

cd ..
rm -rf yay-bin

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
