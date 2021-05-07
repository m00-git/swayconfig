echo "Whos your home user again lol"
read USER
cd /home/$USER
# Get and install preferred font
wget https://github.com/m00-git/install-artix/raw/main/BlockZone.ttf
mkdir -p ~/.local/share/fonts 
mv BlockZone.ttf ~/.local/share/fonts
fc-cache -f -v 
# Rest of configs
rm .vimrc
wget https://raw.githubusercontent.com/m00-git/install-artix/main/configs/.vimrc
rm .bashrc
wget https://raw.githubusercontent.com/m00-git/install-artix/main/configs/.bashrc

mkdir -p ~/.config/termite
cd ~/.config/sway
wget https://github.com/m00-git/install-artix/raw/main/bg.png

mkdir -p ~/.config/waybar
wget https://raw.githubusercontent.com/m00-git/install-artix/main/configs/waybarconfig
mv waybarconfig ~/.config/waybar/config
wget https://raw.githubusercontent.com/m00-git/install-artix/main/configs/waybarstyle.css
mv waybarstyle.css ~/.config/waybar/style.css

mkdir -p ~/.config/sway
wget https://raw.githubusercontent.com/m00-git/install-artix/main/configs/swayconfig
mv swayconfig ~/.config/sway/config

mkdir -p ~/.config/rofi
wget https://raw.githubusercontent.com/m00-git/install-artix/main/configs/rofi-config
mv rofi-config ~/.config/rofi/config
wget https://raw.githubusercontent.com/m00-git/install-artix/main/configs/rofi-theme
mv rofi-theme ~/.config/rofi/orange.rasi

cd ~/termite
wget https://raw.githubusercontent.com/m00-git/install-artix/main/configs/termite-config
mv termite-config config
cd

# my needed packages
trizen -S fedora-firefox-wayland-bin
