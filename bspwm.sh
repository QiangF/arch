#!/bin/bash
################################################################################
### Installing The BSPWM Window Manager On Arch Linux By:                    ###
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
    $ZB -S --noconfirm --needed xorg xorg-drivers xorg-xinit xterm kvantum-qt5 terminator mesa lib32-mesa glu lib32-glu mesa-demos lib32-mesa-demos libclc ocl-icd lib32-ocl-icd
}

### Installing the Desktop                                                   ###
function DESKTOP_DE () {
    dialog --infobox "Installing The BSPWM Window Manager." 3 40
    sleep 2
    clear
    $ZB -S --noconfirm --needed pnmixer mugshot polybar bspwm sxhkd dmenu rofi nitrogen picom xfce4-terminal thunar thunar-archive-plugin thunar-media-tags-plugin xfce4-screenshooter onboard ark file-roller unrar p7zip arandr network-manager-applet gnome-disk-utility feh eog lxappearance galculator dunst
    mkdir -p ~/.config/bspwm
    mkdir -p ~/.config/sxhkd
    mkdir -p ~/.config/polybar
    cd ~/.config/bspwm
    wget http://raw.githubusercontent.com/lotw69/arch-scripts/master/bspwmrc
    chmod +x ~/.config/bspwm/bspwmrc
    cd ~/.config/sxhkd
    wget http://raw.githubusercontent.com/lotw69/arch-scripts/master/sxhkdrc
    chmod +x ~/.config/sxhkd/sxhkdrc
    cd ~/.config/polybar
    wget http://raw.githubusercontent.com/lotw69/arch-scripts/master/config-polybar
    cp config-polybar config
    wget http://raw.githubusercontent.com/lotw69/arch-scripts/master/launch.sh
    chmod +x ~/.config/polybar/config
    chmod +x ~/.config/polybar/launch.sh
    cd ~/
    wget http://raw.githubusercontent.com/lotw69/arch-scripts/master/picom.conf
    sudo rm /etc/xdg/picom.conf
    sudo mv picom.conf /etc/xdg/picom.conf
    mkdir -p ~/.config/dunst
    cp /etc/dunst/dunstrc ~/.config/dunst/
    echo "alias conf='nano ~/.config/bspwm/bspwmrc'" >> ~/.bashrc
    echo "alias conf-key='nano ~/.config/sxhkd/sxhkdrc'" >> ~/.bashrc
    echo "alias conf-bar='nano ~/.config/polybar/config'" >> ~/.bashrc
}

### Setting Up Xorg Display Manager                                          ###
function XORG_SET () {
    cp /etc/X11/xinit/xinitrc ~/.xinitrc
    sed -i 's/'twm'/'#twm'/g' ~/.xinitrc
    sed -i 's/'xclock'/'#xclock'/g' ~/.xinitrc
    sed -i 's/'xterm'/'#xterm'/g' ~/.xinitrc
    echo "exec bspwm" >> ~/.xinitrc
}

### Main Program                                                             ###
AUR_HELPER
XORG_DISPLAY
DESKTOP_DE
XORG_SET
