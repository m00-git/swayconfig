ln -s /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc
echo "pc" > /etc/hostname
vim /etc/locale.gen # uncomment en_US.UTF-8
locale-gen
echo LANG=en_US.utf8 >> /etc/locale.conf
echo LANGUAGE=en_US >> /etc/locale.conf
echo LC_ALL=C >> /etc/locale.conf
echo "Set your root password"
passwd # set root password
echo "Name of your user?"
read USER
useradd -m -G wheel $USER
echo "Set your user password"
passwd $USER # set user password

rm /etc/mkinitcpio.conf; cd /etc
wget https://raw.githubusercontent.com/m00-git/install-artix/main/sysfiles/mkinitcpio.conf
cd
mkinitcpio -p linux

fdisk -l | grep /dev
echo "Input again the drive you have chosen to install Artix on. Ex: sda"
read DRIVE
wget https://raw.githubusercontent.com/m00-git/install-artix/main/sysfiles/grub-top
wget https://raw.githubusercontent.com/m00-git/install-artix/main/sysfiles/grub-bottom
echo GRUB_CMDLINE_LINUX=\"cryptdevice=/dev/$DRIVE\1:artix:allow-discards\" >> grub-top
cat grub-bottom >> grub-top
cat grub-top > /etc/default/grub
rm grub-*

#Install grub and create configurations
grub-install --target=i386-pc /dev/$DRIVE
grub-mkconfig -o /boot/grub/grub.cfg

cd /home/$USER
wget https://raw.githubusercontent.com/m00-git/install-artix/main/install-scripts/3config.sh
chmod +x 3config.sh

echo "You must now manually enter the following commands: after reboot, as root run bash 3config.sh"
echo "exit"
echo "umount -R /mnt"
echo "reboot"
