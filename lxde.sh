#!/bin/bash
################################################################################
### Installing The LXDE Desktop On Arch Linux By:                            ###
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
    dialog --infobox "Installing The LXDE Desktop Environment." 3 44
    sleep 2
    sudo pacman -S --noconfirm --needed lxde gnome-disk-utility gnome-calculator gedit picom variety onboard ark file-roller unrar p7zip
    $ZB -S --noconfirm --needed mugshot
    wget http://raw.githubusercontent.com/lotw69/arch-scripts/master/picom.conf
    sudo rm /etc/xdg/picom.conf
    sudo mv picom.conf /etc/xdg/picom.conf
}

### Setting Up Xorg Display Manager                                          ###
function XORG_SET () {
    cp /etc/X11/xinit/xinitrc ~/.xinitrc
    sed -i 's/'twm'/'#twm'/g' ~/.xinitrc
    sed -i 's/'xclock'/'#xclock'/g' ~/.xinitrc
    sed -i 's/'xterm'/'#xterm'/g' ~/.xinitrc
    echo "exec startlxde" >> ~/.xinitrc
}

### Main Program                                                             ###
AUR_HELPER
XORG_DISPLAY
DESKTOP_DE
XORG_SET
