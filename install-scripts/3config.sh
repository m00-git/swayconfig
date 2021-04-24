fdisk -l | grep /dev
echo "Input again the drive you are installing artix to:"
read DRIVE
echo "Input again the name of the user you made earlier:"
read USER
# Create keyfile so you dont have to enter password twice on boot
dd bs=512 count=4 if=/dev/urandom of=/crypto_keyfile.bin
cryptsetup luksAddKey /dev/$DRIVE\1 /crypto_keyfile.bin
mkinitcpio -p linux
chmod 000 /crypto_keyfile.bin
chmod -R g-rwx,o-rwx /boot
# reboot?

### Base System Setup ###
ln -s /etc/runit/sv/NetworkManager /run/runit/service
sv up NetworkManager
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

### Rice me out ###
wget -o /home/$USER/finalconfig.sh https://raw.githubusercontent.com/m00-git/install-artix/main/install-scripts/4finalconfig.sh
echo "You will now be entering your user, run bash 4finalconfig.sh"
su $USER 
