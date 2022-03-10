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
    clear
    dialog --infobox "Installing The Budgie Desktop Environment." 3 46
    sleep 2
    sudo pacman -S --noconfirm --needed budgie-desktop budgie-extras gnome-system-monitor nautilus gnome-disk-utility gnome-control-center gnome-backgrounds gnome-calculator gedit variety onboard ark file-roller unrar p7zip gnome-tweaks
}

### Installing the Desktop                                                   ###
function DESKTOP_DE () {
    clear
    dialog --infobox "Installing The Cinnamon Desktop Environment." 3 48
    sleep 2
    sudo pacman -S --noconfirm --needed cinnamon gnome-disk-utility gnome-system-monitor gnome-calculator gpicview gedit variety onboard ark file-roller unrar p7zip nemo-fileroller nemo-share
    $ZB -S --noconfirm --needed mint-themes cinnamon-sound-effects
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
