echo "Whos your home user again lol"
read USER
cd /home/$USER
# Get and install preferred font
wget https://github.com/m00-git/install-artix/raw/main/BlockZone.ttf
mkdir -p ~/.local/share/fonts 
mv BlockZone.ttf ~/.local/share/fonts
fc-cache -f -v 
# Rest of configs
rm .vimrc
wget https://raw.githubusercontent.com/m00-git/install-artix/main/configs/.vimrc
rm .bashrc
wget https://raw.githubusercontent.com/m00-git/install-artix/main/configs/.bashrc

mkdir -p ~/.config/termite
cd sway
wget https://github.com/m00-git/swayconfig/raw/main/bg.png

mkdir -p ~/.config/waybar
wget https://raw.githubusercontent.com/m00-git/install-artix/main/configs/waybarconfig
mv waybarconfig ~/.config/waybar/config
wget https://raw.githubusercontent.com/m00-git/install-artix/main/configs/waybarstyle.css
mv waybarstyle.css ~/.config/waybar/style.css

mkdir -p ~/.config/sway
wget https://raw.githubusercontent.com/m00-git/install-artix/main/configs/swayconfig
mv swayconfig ~/.config/sway/config

cd ~/termite
wget https://raw.githubusercontent.com/m00-git/install-artix/main/configs/termite-config
mv termite-config config
cd

# my needed packages
pacman -S pulseaudio pavucontrol fv vlc virt-manager libvirt-runit qemu bridge-utils qemu-guest-agent-runit nftables nftables-runit openvpn otf-font-awesome transmission-gtk openntpd openntpd-runit
trizen -S fedora-firefox-wayland-bin

# link and enable services
doas ln -s /etc/runit/sv/libvirtd /run/runit/service
doas sv up libvrtd
doas ln -s /etc/runit/sv/qemu-guest-agent /run/runit/service
doas sv up qemu-guest-agent
doas ln -s /etc/runit/sv/openntpd /run/runit/service
doas sv up openntpd
doas ln -s /etc/runit/sv/virtlockd /run/runit/service
doas sv up virtlockd
doas ln -s /etc/runit/virtlogd /run/runit/service
doas sv up virtlogd

doas usermod --append --groups $USER
cd /etc/openvpn
wget https://raw.githubusercontent.com/m00-git/install-artix/main/update-resolv-conf
doas chmod +x update-resolv-conf
