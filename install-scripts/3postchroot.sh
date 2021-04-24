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

### Rice me out ###
cd /home/$USER
wget https://raw.githubusercontent.com/m00-git/install-artix/main/install-scripts/4privconfig.sh
echo "You will now be entering your user, run doas bash 4privconfig.sh from your home dir"
su $USER 
