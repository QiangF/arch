#!/bin/bash
################################################################################
### Installing My Selection Of Extra Software For Arch Linux By:             ###
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
function INSTALL_EXTRASOFTWARE() {
  dialog --infobox "Installing Extra Software." 3 31
  sleep 2
  clear
  #3d Printer
  $ZB -S --noconfirm --needed mattercontrol
  #Accessories
  $ZB -S --noconfirm --needed isomaster ventoy-bin mintstick-git rpi-imager cool-retro-term
  #Chat
  $ZB -S --noconfirm --needed skypeforlinux-preview-bin zoom hexchat teamspeak3 telegram-desktop discord
  #Games
  $ZB -S --noconfirm --needed gamemode lib32-gamemode minecraft-launcher extremetuxracer supertux supertuxkart
  #Graphics
  $ZB -S --noconfirm --needed drawio-desktop natron librecad darktable inkscape krita blender openscad luminancehdr freecad
  #Internet
  $ZB -S --noconfirm --needed transmission-gtk fragments remmina
  #Office
  $ZB -S --noconfirm --needed onlyoffice-bin homebank
  #Programming
  $ZB -S --noconfirm --needed meld rust rust-racer uncrustify
  #Sound/Video
  $ZB -S --noconfirm --needed makemkv olive lbry-app-bin openshot shotcut quodlibet vlc flowblade
  #System Utilities
  $ZB -S --noconfirm --needed syncthing dconf-editor dnsmasq pacmanlogviewer deluge plank ncdu peazip-qt5
  $ZB -S --noconfirm --needed dxvk-bin timeshift stacer protontricks protonup-qt
}

### Main Program                                                             ###
clear
AUR_HELPER
INSTALL_EXTRASOFTWARE
