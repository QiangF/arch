#!/bin/bash
################################################################################
### Installing My Standard Arch Software Selection By:                       ###
### Erik Sundquist                                                           ###
################################################################################
### Review and edit before using                                             ###
################################################################################

### Software To Install (My Standard Applications)                           ###
function INSTALL_STDSOFTWARE() {
  clear
  dialog --infobox "Installing Standard Software." 3 33
  sleep 2
  sudo pacman -S --noconfirm --needed firefox winetricks playonlinux steam handbrake obs-studio gimp libreoffice-fresh clementine kdenlive aspell-en youtube-dl paperwork
  #sudo systemctl enable tuned.service
}

### Main Program                                                             ###
clear
INSTALL_STDSOFTWARE
