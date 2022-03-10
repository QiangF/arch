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
    clear
    dialog --infobox "Installing The Budgie Desktop Environment." 3 46
    sleep 2
    sudo pacman -S --noconfirm --needed budgie-desktop budgie-extras gnome-system-monitor nautilus gnome-disk-utility gnome-control-center gnome-backgrounds gnome-calculator gedit variety onboard ark file-roller unrar p7zip gnome-tweaks
}

### Installing the Desktop                                                   ###
function DESKTOP_DE () {
    clear
    dialog --infobox "Installing The BSPWM Window Manager." 3 40
    sleep 2
    sudo pacman -S --noconfirm --needed bspwm sxhkd dmenu rofi nitrogen picom xfce4-terminal thunar thunar-archive-plugin thunar-media-tags-plugin xfce4-screenshooter onboard ark file-roller unrar p7zip arandr network-manager-applet gnome-disk-utility feh eog lxappearance galculator dunst
    $ZB -S --noconfirm --needed pnmixer mugshot polybar
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
