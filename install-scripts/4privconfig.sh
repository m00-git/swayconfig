echo "whos your user"
read USER
sudo pacman -S neofetch doas trizen tmux termite wget sway waybar pulseaudio pavucontrol fv vlc virt-manager libvirt-runit qemu bridge-utils qemu-guest-agent-runit nftables nftables-runit openvpn otf-font-awesome transmission-gtk openntpd openntpd-runit

sudo ln -s /etc/runit/sv/libvirtd /run/runit/service
sudo sv up libvrtd
sudo ln -s /etc/runit/sv/qemu-guest-agent /run/runit/service
sudo sv up qemu-guest-agent
sudo ln -s /etc/runit/sv/openntpd /run/runit/service
sudo sv up openntpd
sudo ln -s /etc/runit/sv/virtlockd /run/runit/service
sudo sv up virtlockd
sudo ln -s /etc/runit/virtlogd /run/runit/service
sudo sv up virtlogd

sudo echo "permit $USER" > /etc/doas.conf
sudo pacman -Rns sudo

sudo usermod --append --groups $USER

sudo mkdir /etc/openvpn
cd /etc/openvpn
sudo wget https://raw.githubusercontent.com/m00-git/install-artix/main/sysfiles/update-resolv-conf
sudo chmod +x update-resolv-conf

cd /home/$USER
wget https://raw.githubusercontent.com/m00-git/install-artix/main/install-scripts/5finalconfig.sh
echo "now run bash 5finalconfig.sh"
