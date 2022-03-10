#!/bin/bash
################################################################################
### Installing The XFCE Desktop On Arch Linux By:                          ###
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
function DESKTOP_DE () {
    clear
    dialog --infobox "Installing The XFCE4 Desktop Environment." 3 45
    sleep 2
    sudo pacman -S --noconfirm --needed xfce4 xfce4-goodies gnome-disk-utility ark file-roller unrar p7zip alacarte gnome-calculator picom variety libnma networkmanager networkmanager-openconnect networkmanager-openvpn networkmanager-pptp nm-connection-editor network-manager-applet onboard
    $ZB -S --noconfirm --needed xfce4-screensaver xfce4-panel-profiles-git mugshot solarized-dark-themes gtk-theme-glossyblack mcos-mjv-xfce-edition xfce4-theme-switcher xts-windows10-theme xts-macos-theme xts-dark-theme xts-arcolinux-theme xts-windowsxp-theme xts-windows-server-2003-theme
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
    echo "exec startxfce4" >> ~/.xinitrc
}

### Main Program                                                             ###
AUR_HELPER
XORG_DISPLAY
DESKTOP_DE
XORG_SET
