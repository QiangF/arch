#!/bin/bash
################################################################################
### Installing The Cinnamon Desktop On Arch Linux By:                        ###
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
    dialog --infobox "Installing The Cinnamon Desktop Environment." 3 48
    sleep 2
    clear
    sudo pacman -S --noconfirm --needed cinnamon gnome-disk-utility gnome-system-monitor gnome-calculator gpicview gedit variety onboard ark file-roller unrar p7zip nemo-fileroller nemo-share
    $ZB -S --noconfirm --needed mint-themes mint-x-icons mint-y-icons mint-artwork-cinnamon gvfs-smb
}

### Setting Up Xorg Display Manager                                          ###
function XORG_SET () {
    cp /etc/X11/xinit/xinitrc ~/.xinitrc
    sed -i 's/'twm'/'#twm'/g' ~/.xinitrc
    sed -i 's/'xclock'/'#xclock'/g' ~/.xinitrc
    sed -i 's/'xterm'/'#xterm'/g' ~/.xinitrc
    echo "exec cinnamon-session" >> ~/.xinitrc
}

### Main Program                                                             ###
AUR_HELPER
XORG_DISPLAY
DESKTOP_DE
XORG_SET
