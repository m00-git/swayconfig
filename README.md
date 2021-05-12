# install-artix
This installs artix from a base runit ISO in non-UEFI mode with BTRFS, full LUKS encryption, hardened kernel, and sway.
Not completely automated. Manual work needs to be done when jumping from pre-chroot to post-chroot.
Run the install scripts in their order.

After booting into the live base artix environment
1. Login as root, root:artix
2. pacman -Sy
3. pacman -S wget
4. wget https://raw.githubusercontent.com/m00-git/install-artix/main/install-scripts/1prechroot.sh
5. bash 1prechroot.sh

TODO:
* Change paths and file names so a git clone of this repo in home folder results in all config paths, ex: ~/.config/sway/config
* Update config script to be standalone, merge your configs onto any system. A little interactive "Are you on sway? y/n" if n only bring over .bashrc and .vim config n stuffs.
* Save variables to a file and read from it so doesnt have to ask "what was your drive/user again"
* Have a prompt "would you like to dual boot OpenBSD?" if yes, make half/half partition and set appropiate flags for future openbsd install
