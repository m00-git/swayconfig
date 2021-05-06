# install-artix
This installs artix from a base runit ISO in non-UEFI mode with BTRFS, hardened kernel, and sway.
Not completely automated. Manual work needs to be done when jumping from pre-chroot to post-chroot.
Run the install scripts in their order.

After booting into the live base artix environment
1. Login as root, root:artix
2. pacman -Sy
3. pacman -S wget
4. wget https://raw.githubusercontent.com/m00-git/install-artix/main/install-scripts/1prechroot.sh
5. bash 1prechroot.sh
