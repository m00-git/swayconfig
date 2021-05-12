pacman -Sy
pacman -S parted
fdisk -l | grep /dev

echo "Input the drive you wish to install Artix to. Ex: sda"
read DRIVE

echo "DRIVE=$DRIVE" >> vars

parted -s /dev/$DRIVE mklabel msdos
parted -s /dev/$DRIVE mkpart primary 2048s 100%
cryptsetup --type luks1 --cipher aes-xts-plain64 --hash sha512 --use-random --verify-passphrase luksFormat /dev/$DRIVE\1

# Create filesystems and subvolumes
cryptsetup open /dev/$DRIVE\1 artix
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

echo "Is your CPU AMD or INTEL?"
read CPU
if [ "$CPU" == AMD ]
then
# Install base system
basestrap /mnt base base-devel runit elogind-runit linux-hardened linux-hardened-headers usbctl linux-firmware wget vim amd-ucode btrfs-progs grub snapper mlocate networkmanager networkmanager-runit network-manager-applet dosfstools cryptsetup doas
if [ "$CPU" == INTEL ]
then
basestrap /mnt base base-devel runit elogind-runit linux-hardened linux-hardened-headers usbctl linux-firmware wget vim intel-ucode btrfs-progs grub snapper mlocate networkmanager networkmanager-runit network-manager-applet dosfstools cryptsetup doas
else
echo "Input either AMD or INTEL, you inputted $CPU"
fi

# Generate fstab
fstabgen -U /mnt >> /mnt/etc/fstab
cd /mnt
wget https://raw.githubusercontent.com/m00-git/install-artix/main/install-scripts/2chrooted.sh
echo "now run \"artix-chroot /mnt\" then bash 2chrooted.sh"
