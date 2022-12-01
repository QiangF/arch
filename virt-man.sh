#!/bin/bash
################################################################################
### Installing Virt-Manager For Arch Linux By:                               ###
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
  #System Utilities
  $ZB -S --noconfirm --needed virt-manager dnsmasq virglrenderer qemu-full
  $ZB -S --noconfirm --needed ovmf virtio-win
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
