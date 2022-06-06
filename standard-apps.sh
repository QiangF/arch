#!/bin/bash
################################################################################
### Installing My Standard Arch Software Selection By:                       ###
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

### Software To Install (My Standard Applications)                           ###
function INSTALL_STDSOFTWARE() {
  dialog --infobox "Installing Standard Software." 3 33
  sleep 2
  clear
  sudo pacman -S --noconfirm --needed firefox winetricks steam handbrake obs-studio gimp libreoffice-fresh clementine kdenlive aspell-en youtube-dl paperwork terminator
  $ZB -S --noconfirm --needed system-monitoring-center
  #sudo systemctl enable tuned.service
}

### Main Program                                                             ###
clear
AUR_HELPER
INSTALL_STDSOFTWARE
