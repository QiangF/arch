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

function GNOME_DE () {
    clear
    dialog --infobox "Installing The Gnome Desktop Environment." 3 45
    sleep 2
    sudo pacman -S --noconfirm --needed gnome gnome-extra nautilus-share variety gnome-packagekit gnome-software-packagekit-plugin gtk-engine-murrine gtk-engines gnome-themes-extra
    $ZB -S --noconfirm --needed chrome-gnome-shell
}

### Main Program                                                             ###
AUR_HELPER
GNOME_DE
