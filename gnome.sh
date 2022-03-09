#!/bin/bash
################################################################################
### Installing The Gnome Desktop On Arch Linux By:                           ###
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
  dialog --infobox "Installing XORG Display Manager." 3 36
  sleep 2
  sudo pacman -S --noconfirm --needed xorg xorg-drivers xorg-xinit xterm kvantum-qt5 terminator mesa lib32-mesa glu lib32-glu mesa-demos lib32-mesa-demos libclc ocl-icd lib32-ocl-icd
}

### Installing the Gnome Desktop                                             ###
function GNOME_DE () {
    clear
    dialog --infobox "Installing The Gnome Desktop Environment." 3 45
    sleep 2
    sudo pacman -S --noconfirm --needed gnome gnome-extra nautilus-share variety gnome-packagekit gnome-software-packagekit-plugin gtk-engine-murrine gtk-engines gnome-themes-extra
    $ZB -S --noconfirm --needed chrome-gnome-shell
}

### Setting Up Xorg Display Manager                                          ###
function XORG_SET () {
    cp /etc/X11/xinit/xinitrc ~/.xinitrc
    sed -i 's/'twm'/'#twm'/g' .xinitrc
    sed -i 's/'xclock'/'#xclock'/g' .xinitrc
    sed -i 's/'xterm'/'#xterm'/g' .xinitrc
    echo "exec gnome-session" >> .xinitrc
}

### Main Program                                                             ###
AUR_HELPER
XORG_DISPLAY
GNOME_DE
XORG_SET
