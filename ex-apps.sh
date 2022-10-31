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
  #Games
  $ZB -S --noconfirm --needed gamemode lib32-gamemode 
  #Programming
  $ZB -S --noconfirm --needed meld rust rust-racer uncrustify
  #System Utilities
  $ZB -S --noconfirm --needed syncthing dconf-editor virt-manager dnsmasq virglrenderer qemu-arch-extra qemu-guest-agent pacmanlogviewer ncdu peazip-qt5
  $ZB -S --noconfirm --needed ovmf virtio-win dxvk-bin timeshift stacer protontricks
  $ZB -S --noconfirm --needed -a ebtables
  sudo systemctl enable libvirtd.service
  sudo systemctl enable virtlogd.service
  sudo sed -i '/\[global\]'/a'Environment="LD_LIBRARY_PATH=/usr/lib"' /etc/systemd/system/multi-user.target.wants/libvirtd.service
  #sed -e '/"Type=simple"'/a'Environment="LD_LIBRARY_PATH=/usr/lib"' /etc/systemd/system/multi-user.target.wants/libvirtd.service
  echo "options kvm-intel nested=1" | sudo tee /etc/modprobe.d/kvm-intel.conf
}

### Main Program                                                             ###
clear
AUR_HELPER
INSTALL_EXTRASOFTWARE
