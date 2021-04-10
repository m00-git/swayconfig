echo "Whos your home user again lol"
read USER
cd
rm .vimrc
wget https://raw.githubusercontent.com/m00-git/swayconfig/main/.vimrc
rm .bashrc
wget https://raw.githubusercontent.com/m00-git/swayconfig/main/.bashrc
mkdir ~/.config/
cd ~/.config
mkdir sway
cd sway
wget https://github.com/m00-git/swayconfig/raw/main/bg.png
wget https://raw.githubusercontent.com/m00-git/swayconfig/main/.bashrc
wget https://raw.githubusercontent.com/m00-git/swayconfig/main/waybarconfig
wget https://raw.githubusercontent.com/m00-git/swayconfig/main/swayconfig
wget https://raw.githubusercontent.com/m00-git/swayconfig/main/waybarstyle.css

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
