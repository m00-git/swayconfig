cd
# Get and install preferred font
wget https://github.com/m00-git/install-artix/raw/main/BlockZone.ttf
mkdir -p ~/.local/share/fonts 
mv BlockZone.ttf ~/.local/share/fonts
fc-cache -f -v 
# Rest of configs
mv .config/* ~/.config/
mv .vim ~/.vim
mv .vimrc ~/.vimrc
mv .bashrc ~/.bashrc
# my needed packages
trizen -S fedora-firefox-wayland-bin
