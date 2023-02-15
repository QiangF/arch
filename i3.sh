#!/bin/bash
################################################################################
### Installing The i3 Window Manager On Arch Linux By:                       ###
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
    dialog --infobox "Installing The i3 Window Manager." 3 37
    sleep 2
    clear
    sudo pacman -S --noconfirm --needed i3 gnome-disk-utility onboard ark file-roller unrar p7zip picom dmenu rofi nitrogen feh thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman xfce4-terminal xfce4-screenshooter papirus-icon-theme network-manager-applet arandr scrot lxappearance polkit-gnome galculator dunst ristretto pavucontrol
    $ZB -S --noconfirm --needed mugshot i3exit pnmixer
    #$ZB -S --noconfirm --needed betterlockscreen
    mkdir -p ~/.config/i3
    cd ~/.config/i3
    wget http://raw.githubusercontent.com/lotw69/arch-scripts/master/config-i3
    wget http://raw.githubusercontent.com/lotw69/arch-scripts/master/i3status-config
    cp config-i3 config
    cd ~/
    wget http://raw.githubusercontent.com/lotw69/arch-scripts/master/picom.conf
    sudo rm /etc/xdg/picom.conf
    sudo mv picom.conf /etc/xdg/picom.conf
    mkdir -p ~/.config/dunst
    cp /etc/dunst/dunstrc ~/.config/dunst/
    echo "alias conf='nano ~/.config/i3/config'" >> ~/.bashrc
    echo "alias conf-bar='nano ~/.config/i3/i3status-config'" >> ~/.bashrc
}

### Setting Up Xorg Display Manager                                          ###
function XORG_SET () {
    cp /etc/X11/xinit/xinitrc ~/.xinitrc
    sed -i 's/'twm'/'#twm'/g' ~/.xinitrc
    sed -i 's/'xclock'/'#xclock'/g' ~/.xinitrc
    sed -i 's/'xterm'/'#xterm'/g' ~/.xinitrc
    echo "exec i3" >> ~/.xinitrc
}

### Main Program                                                             ###
AUR_HELPER
XORG_DISPLAY
DESKTOP_DE
XORG_SET
