fdisk -l | grep /dev
# This should all be taken care of
# echo "Input again the drive you are installing artix to:"
# read DRIVE
# echo "Input again the name of the user you made earlier:"
# read USER

# Create keyfile so you dont have to enter password twice on boot
dd bs=512 count=4 if=/dev/urandom of=/crypto_keyfile.bin
cryptsetup luksAddKey /dev/$DRIVE\1 /crypto_keyfile.bin
mkinitcpio -p linux-hardened
chmod 000 /crypto_keyfile.bin
chmod -R g-rwx,o-rwx /boot
# reboot?

### Base System Setup ###
ln -s /etc/runit/sv/NetworkManager /run/runit/service
sv up NetworkManager
echo "$USER ALL=(ALL) ALL" >> /etc/sudoers

### Rice me out ###
cd /home/$USER
cp /vars tmpvars
wget https://raw.githubusercontent.com/m00-git/install-artix/main/install-scripts/4privconfig.sh
cat 4privconfig.sh >> tmpvars
mv tmpvars 4privconfig.sh
echo "You will now be entering your user, run bash 4privconfig.sh from your home dir"
su $USER 
