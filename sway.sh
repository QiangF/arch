#!/bin/bash
################################################################################
### Installing The Sway Window Manager On Arch Linux By:                     ###
### Erik Sundquist                                                           ###
################################################################################
### Review and edit before using                                             ###
################################################################################

### Which AUR Helper did you install?                                        ###
function AUR_HELPER() {
  clear
  echo "################################################################################"
  echo "### Which AUR Helper Did You Install?                                        ###"
  echo "### 1)  YAY                                                                  ###"
  echo "### 2)  PARU                                                                 ###"
  echo "################################################################################"
  read case;

  case $case in
    1)
    ZB="yay"
    ;;
    2)
    ZB="paru"
    ;;
  esac
}

### Installing the Display Manager                                           ###
################################################################################
function XORG_DISPLAY() {
    dialog --infobox "Installing XORG Display Manager." 3 36
    sleep 2
    clear
    sudo pacman -S --noconfirm --needed xorg xorg-drivers xorg-xinit xterm kvantum-qt5 terminator mesa lib32-mesa glu lib32-glu mesa-demos lib32-mesa-demos libclc ocl-icd lib32-ocl-icd
}

### Installing the Desktop                                                   ###
function DESKTOP_DE () {
    dialog --infobox "Installing The Sway Window Manager." 3 39
    sleep 2
    clear
    sudo pacman -S --noconfirm --needed sway swaybg swayidle swaylock waybar dmenu rofi nitrogen onboard ark file-roller unrar p7zip xfce4-terminal thunar thunar-archive-plugin thunar-media-tags-plugin network-manager-applet xfce4-screenshooter papirus-icon-theme arandr gnome-disk-utility polkit-gnome grim feh eog galculator
    $ZB -S --noconfirm --needed mugshot
    #$ZB -S --noconfirm --needed j4-dmenu-desktop
    mkdir -p ~/.config/sway
    cd ~/.config/sway
    wget http://raw.githubusercontent.com/lotw69/arch-scripts/master/config-sway
    cp config-sway config
    cd ~
    echo "alias conf='nano ~/.config/sway/config'" >> ~/.bashrc
    mkdir -p ~/.config/waybar
    cp /etc/xdg/waybar/* ~/.config/waybar/
    mkdir -p ~/Pictures/shots
}

### Setting Up Xorg Display Manager                                          ###
function XORG_SET () {
    cp /etc/X11/xinit/xinitrc ~/.xinitrc
    sed -i 's/'twm'/'#twm'/g' ~/.xinitrc
    sed -i 's/'xclock'/'#xclock'/g' ~/.xinitrc
    sed -i 's/'xterm'/'#xterm'/g' ~/.xinitrc
    echo "exec sway" >> ~/.xinitrc
}

### Main Program                                                             ###
AUR_HELPER
XORG_DISPLAY
DESKTOP_DE
XORG_SET
