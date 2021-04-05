cd
rm .vimrc
wget https://raw.githubusercontent.com/m00-git/swayconfig/main/.vimrc
rm .bashrc
wget https://raw.githubusercontent.com/m00-git/swayconfig/main/.bashrc
mkdir ~/.config/
cd ~/.config
mkdir sway
cd sway
wget https://github.com/m00-git/swayconfig/raw/main/bg.png
wget https://raw.githubusercontent.com/m00-git/swayconfig/main/.bashrc
wget https://raw.githubusercontent.com/m00-git/swayconfig/main/waybarconfig
wget https://raw.githubusercontent.com/m00-git/swayconfig/main/swayconfig
wget https://raw.githubusercontent.com/m00-git/swayconfig/main/waybarstyle.css
trizen -S fedora-firefox-wayland-bin
