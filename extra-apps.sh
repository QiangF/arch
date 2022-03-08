#!/bin/bash
################################################################################
### Installing My Selection Of Extra Software For Arch Linux By:             ###
### Erik Sundquist                                                           ###
################################################################################
### Review and edit before using                                             ###
################################################################################
################################################################################
### Software To Install (My Standard Applications)                           ###
################################################################################
function INSTALL_EXTRASOFTWARE() {
  clear
  dialog --infobox "Installing Extra Software." 3 31
  sleep 2
  #3d Printer
  sudo pacman -S --noconfirm --needed cura cura-resources-materials prusa-slicer
  $ZB -S --noconfirm --needed mattercontrol
  #Accessories
  sudo pacman -S --noconfirm --needed cool-retro-term
  $ZB -S --noconfirm --needed isomaster ventoy-bin mintstick-git rpi-imager
  #Chat
  sudo pacman -S --noconfirm --needed hexchat teamspeak3 telegram-desktop discord
  $ZB -S --noconfirm --needed skypeforlinux-preview-bin zoom
  #Games
  sudo pacman -S --noconfirm --needed extremetuxracer supertux supertuxkart
  $ZB -S --noconfirm --needed gamemode lib32-gamemode minecraft-launcher
  #Graphics
  sudo pacman -S --noconfirm --needed librecad darktable inkscape krita blender openscad luminancehdr freecad
  $ZB -S --noconfirm --needed drawio-desktop
  #Internet
  sudo pacman -S --noconfirm --needed transmission-gtk fragments remmina
  #Office
  sudo pacman -S --noconfirm --needed homebank
  #Programming
  sudo pacman -S --noconfirm --needed atom meld rust rust-racer uncrustify
  #Sound/Video
  sudo pacman -S --noconfirm --needed openshot shotcut quodlibet vlc
  $ZB -S --noconfirm --needed makemkv olive lbry-app-bin
  #System Utilities
  sudo pacman -S --noconfirm --needed cockpit cockpit-machines cockpit-pcp cockpit-podman syncthing dconf-editor virt-manager dnsmasq virglrenderer qemu-arch-extra qemu-guest-agent pacmanlogviewer deluge plank cairo-dock cairo-dock-plug-ins ncdu #  hardinfo
  #$ZB -S --noconfirm --needed plank-theme-arc plank-theme-numix plank-theme-namor unity-like-plank-theme
  $ZB -S --noconfirm --needed ovmf virtio-win libguestfs cairo-dock-themes cairo-dock-plug-ins-extras dxvk-bin timeshift stacer protontricks protonup-git protonup-qt
  $ZB -S --noconfirm --needed -a ebtables
  sudo systemctl enable --now cockpit.socket
  sudo systemctl enable libvirtd.service
  sudo systemctl enable virtlogd.service
  sudo sed -i '/\[global\]'/a'Environment="LD_LIBRARY_PATH=/usr/lib"' /etc/systemd/system/multi-user.target.wants/libvirtd.service
  #sed -e '/"Type=simple"'/a'Environment="LD_LIBRARY_PATH=/usr/lib"' /etc/systemd/system/multi-user.target.wants/libvirtd.service
  echo "options kvm-intel nested=1" | sudo tee /etc/modprobe.d/kvm-intel.conf
}

### Main Program                                                             ###
clear
INSTALL_EXTRASOFTWARE
