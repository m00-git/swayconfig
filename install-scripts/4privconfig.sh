# Should all be taken care of
# echo "whos your user"
# read USER
sudo pacman -S artix-archlinux-support archlinux-mirrorlist
sudo echo "[extra]" >> /etc/pacman.conf
sudo echo "Include = /etc/pacman.d/mirrorlist-arch" >> /etc/pacman.conf
sudo echo "[community]" >> /etc/pacman.conf
sudo echo "Include = /etc/pacman.d/mirrorlist-arch" >> /etc/pacman.conf

sudo pacman -S neofetch doas trizen tmux alacritty wget rofi sway waybar pulseaudio pavucontrol vlc nftables nftables-runit openvpn transmission-gtk chrony chrony-runit wl-clipboard grim slurp swappy xorg-xwayland noto-fonts noto-fonts-emoji noto-fonts-extra
# sudo pacman -S virt-manager libvirt-runit qemu bridge-utils qemu-guest-agent-runit

sudo ln -s /etc/runit/sv/libvirtd /run/runit/service
sudo sv up libvirtd
sudo ln -s /etc/runit/sv/qemu-guest-agent /run/runit/service
sudo sv up qemu-guest-agent
sudo ln -s /etc/runit/sv/chrony /run/runit/service
sudo sv up chrony
sudo ln -s /etc/runit/sv/virtlockd /run/runit/service
sudo sv up virtlockd
sudo ln -s /etc/runit/virtlogd /run/runit/service
sudo sv up virtlogd

sudo usermod --append --groups $USER

sudo mkdir /etc/openvpn
cd /etc/openvpn
sudo wget https://raw.githubusercontent.com/m00-git/install-artix/main/sysfiles/update-resolv-conf
sudo chmod +x update-resolv-conf

cd /etc
sudo echo "permit $USER" > doas.conf
sudo pacman -Rns sudo

cd /home/$USER
wget https://raw.githubusercontent.com/m00-git/install-artix/main/install-scripts/5finalconfig.sh
echo "now run bash 5finalconfig.sh"
