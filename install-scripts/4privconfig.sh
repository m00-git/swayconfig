echo "whos your user"
read USER
pacman -S neofetch doas trizen tmux termite wget sway waybar pulseaudio pavucontrol fv vlc virt-manager libvirt-runit qemu bridge-utils qemu-guest-agent-runit nftables nftables-runit openvpn otf-font-awesome transmission-gtk openntpd openntpd-runit

ln -s /etc/runit/sv/libvirtd /run/runit/service
sv up libvrtd
ln -s /etc/runit/sv/qemu-guest-agent /run/runit/service
sv up qemu-guest-agent
ln -s /etc/runit/sv/openntpd /run/runit/service
sv up openntpd
ln -s /etc/runit/sv/virtlockd /run/runit/service
sv up virtlockd
ln -s /etc/runit/virtlogd /run/runit/service
sv up virtlogd

echo "permit $USER" > /etc/doas.conf
pacman -Rns sudo
usermod --append --groups $USER

mkdir /etc/openvpn
cd /etc/openvpn
wget https://raw.githubusercontent.com/m00-git/install-artix/main/sysfiles/update-resolv-conf
chmod +x update-resolv-conf

cd /home/$USER
wget https://raw.githubusercontent.com/m00-git/install-artix/main/install-scripts/5finalconfig.sh
echo "now run bash 5finalconfig.sh"
