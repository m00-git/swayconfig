### System Installation ###
# Install needed packages
pacman -Sy
pacman -S parted
# Create partitions
parted -s /dev/XXX mklabel msdos
parted -s /dev/XXX mkpart primary 2048s 100%
# Create luks container
cryptsetup --type luks1 --cipher aes-xts-plain64 --hash sha512 --use-random --verify-passphrase luksFormat /dev/XXX1
# Create filesystems and subvolumes
cryptsetup open /dev/XXX1 artix
mkfs -t btrfs --force -L artix /dev/mapper/artix
mount -t btrfs -o compress=lzo /dev/mapper/artix /mnt
btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@home
btrfs subvolume create /mnt/@snapshots
# Unmount
umount /mnt
# Set mount options
o=defaults,x-mount.mkdir
o_btrfs=$o,compress=lzo,ssd,noatime
# Remount partitions
mount -o compress=lzo,subvol=@,$o_btrfs /dev/mapper/artix /mnt
mount -o compress=lzo,subvol=@home,$o_btrfs /dev/mapper/artix /mnt/home
mount -o compress=lzo,subvol=@snapshots,$o_btrfs /dev/mapper/artix /mnt/.snapshots
# Install base system
basestrap /mnt base base-devel runit elogind-runit linux linux-headers linux-firmware vim amd-ucode btrfs-progs grub snapper mlocate networkmanager networkmanager-runit network-manager-applet dosfstools cryptsetup doas
# Generate fstab
fstabgen -U /mnt >> /mnt/etc/fstab

artix-chroot /mnt
ln -s /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc
echo "pc" > /etc/hostname
vim /etc/locale.gen # uncomment en_US.UTF-8
locale-gen
echo LANG=en_US.utf8 >> /etc/locale.conf
echo LANGUAGE=en_US >> /etc/locale.conf
echo LC_ALL=C >> /etc/locale.conf
passwd # set root password
useradd -m -G wheel me
passwd me # set user password
vim /etc/mkinitcpio.conf # configure mkinitcpio
# Embed btrfs to initramfs
BINARIES=(/usr/sbin/btrfs)
# Add encrypt to HOOKS before filesystems
HOOKS="base udev autodetect modconf block encrypt filesystems keyboard fsck"
# regen initrd image
mkinitcpio -p linux

# Setup /etc/default/grub, add GRUB_ENABLE_CRYPTODISK=y and GRUB_DISABLE_SUBMENU=y
GRUB_CMDLINE_LINUX="cryptdevice=/dev/sda1:artix:allow-discards"

#Install grub and create configurations
grub-install --target=i386-pc /dev/XXX
grub-mkconfig -o /boot/grub/grub.cfg

# exit, unmount, and reboot
exit
umount -R /mnt
reboot

# Create keyfile so you dont have to enter password twice on boot
dd bs=512 count=4 if=/dev/urandom of=/crypto_keyfile.bin
cryptsetup luksAddKey /dev/XXX1 /crypto_keyfile.bin
vim /etc/mkinitcpio.conf
# add FILES=(/crypto_keyfile.bin)

mkinitcpio -p linux
chmod 000 /crypto_keyfile.bin
chmod -R g-rwx,o-rwx /boot
reboot

### Base System Setup ###
ln -s /etc/runit/sv/NetworkManager /run/runit/service
sv up NetworkManager
pacman -S neofetch doas trizen tmux termite wget sway
echo "permit me" > /etc/doas.conf
pacman -Rns sudo

### Rice me out ###
su me
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
https://raw.githubusercontent.com/m00-git/swayconfig/main/waybarstyle.css
