#!/bin/bash

################################################################################
### Arch Linux - Additional CLI Software                                     ###
################################################################################

### Fix the Pacman Keyring                                                   ###
function PACMAN_KEYS() {
  clear
  dialog --infobox "Fixing The Pacman (Repos) Keys." 3 35
  sleep 2
   pacman-key --init
   pacman-key --populate archlinux
   reflector --country US --latest 10 --sort rate --verbose --save /etc/pacman.d/mirrorlist
   pacman -Sy
}

### CLI Programs                                                             ###
function CLI_PROGS() {
    clear
    dialog --infobox "Installing some CLI programs." 3 32
    sleep 2
     pacman -S --noconfirm --needed base-devel nano networkmanager man-db man-pages git btrfs-progs systemd-swap xfsprogs reiserfsprogs jfsutils nilfs-utils terminus-font ntp dialog neofetch git wget rsync htop openssh archlinux-wallpaper glances python-defusedxml python-packaging bashtop packagekit reflector bat mc lynx bwm-ng lsd gtop bpytop duf ncdu terminus-font
}

### Set Number Of CPUs In MAKEFLAGS                                          ###
function MAKEFLAGS_CPU() {
  clear
  dialog --infobox "Fixing The Makeflags For The Compiler." 3 42
  sleep 3
  numberofcores=$(grep -c ^processor /proc/cpuinfo)
  case $numberofcores in

      16)
          echo "You have " $numberofcores" cores."
          echo "Changing the makeflags for "$numberofcores" cores."
           sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j16"/g' /etc/makepkg.conf
          echo "Changing the compression settings for "$numberofcores" cores."
           sed -i 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -T 16 -z -)/g' /etc/makepkg.conf
          ;;
      8)
          echo "You have " $numberofcores" cores."
          echo "Changing the makeflags for "$numberofcores" cores."
           sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j8"/g' /etc/makepkg.conf
          echo "Changing the compression settings for "$numberofcores" cores."
           sed -i 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -T 8 -z -)/g' /etc/makepkg.conf
          ;;
      6)
          echo "You have " $numberofcores" cores."
          echo "Changing the makeflags for "$numberofcores" cores."
           sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j8"/g' /etc/makepkg.conf
          echo "Changing the compression settings for "$numberofcores" cores."
           sed -i 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -T 6 -z -)/g' /etc/makepkg.conf
          ;;
      4)
          echo "You have " $numberofcores" cores."
          echo "Changing the makeflags for "$numberofcores" cores."
           sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j4"/g' /etc/makepkg.conf
          echo "Changing the compression settings for "$numberofcores" cores."
           sed -i 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -T 4 -z -)/g' /etc/makepkg.conf
          ;;
      2)
          echo "You have " $numberofcores" cores."
          echo "Changing the makeflags for "$numberofcores" cores."
           sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j2"/g' /etc/makepkg.conf
          echo "Changing the compression settings for "$numberofcores" cores."
           sed -i 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -T 2 -z -)/g' /etc/makepkg.conf
          ;;
      *)
          echo "We do not know how many cores you have."
          echo "Do it manually."
          ;;

  esac
}

### Setting Up Some Things                                                   ###
function SET_VAR() {
  sed -i 's/'#Color'/'Color'/g' /etc/pacman.conf
  sed -i 's/\#ParallelDownloads = 5/ParallelDownloads = 5'/g /etc/pacman.conf
  sed -i '/\Color/aILoveCandy' /etc/pacman.conf
  #sed -i 's/\#Include/Include'/g /etc/pacman.conf
  sed -i '/^#\[multilib\]/{
    N
    s/^#\(\[multilib\]\n\)#\(Include\ .\+\)/\1\2/
  }' /etc/pacman.conf
  sed -i 's/\#\[multilib\]/\[multilib\]'/g /etc/pacman.conf
  echo "set linenumbers" >> /etc/nanorc
  echo 'include "/usr/share/nano/*.nanorc"' >> /etc/nanorc
  echo "FONT=ter-120n" >> /etc/vconsole.conf
}

### Main Program                                                             ###
pacman -S --noconfirm --needed dialog
SET_VAR
PACMAN_KEYS
MAKEFLAGS_CPU
CLI_PROGS
