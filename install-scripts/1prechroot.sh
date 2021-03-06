pacman -Sy
pacman -S parted
fdisk -l | grep /dev

echo "Input the drive you wish to install Artix to. Ex: sda"
read DRIVE

echo "DRIVE=$DRIVE" >> /vars
chmod 666 /vars

parted -s /dev/$DRIVE mklabel msdos
echo "Will this be a SINGLE boot or DUAL boot system?"
read userans
if [ "$userans" == "DUAL" ]
then
parted -s /dev/$DRIVE mkpart primary 2048s 50%
else
parted -s /dev/$DRIVE mkpart primary 2048s 100%
cryptsetup --type luks1 --cipher aes-xts-plain64 --hash sha512 --use-random --verify-passphrase luksFormat /dev/$DRIVE\1
fi

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
else
basestrap /mnt base base-devel runit elogind-runit linux-hardened linux-hardened-headers usbctl linux-firmware wget vim intel-ucode btrfs-progs grub snapper mlocate networkmanager networkmanager-runit network-manager-applet dosfstools cryptsetup doas
fi

# Generate fstab
fstabgen -U /mnt >> /mnt/etc/fstab
cd /mnt
cp /vars tmpvars
wget https://raw.githubusercontent.com/m00-git/install-artix/main/install-scripts/2chrooted.sh
cat 2chrooted.sh >> tmpvars
mv tmpvars 2chrooted.sh
echo "now run \"artix-chroot /mnt\" then bash 2chrooted.sh"
