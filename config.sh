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
pacman -S neofetch doas trizen tmux termite wget sway waybar
echo "permit $USER" > /etc/doas.conf
pacman -Rns sudo

### Rice me out ###
su $USER
cd
rm .vimrc
wget https://raw.githubusercontent.com/m00-git/swayconfig/main/.vimrc
rm .bashrc
wget https://raw.githubusercontent.com/m00-git/swayconfig/main/.bashrc
mkdir ~/.config/sway; cd ~/.config/sway
wget https://github.com/m00-git/swayconfig/raw/main/bg.png
wget https://raw.githubusercontent.com/m00-git/swayconfig/main/.bashrc
wget https://raw.githubusercontent.com/m00-git/swayconfig/main/waybarconfig
wget https://raw.githubusercontent.com/m00-git/swayconfig/main/swayconfig
wget https://raw.githubusercontent.com/m00-git/swayconfig/main/waybarstyle.css
