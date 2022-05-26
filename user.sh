#!/bin/bash

################################################################################
### Arch Linux - Additional CLI Software                                     ###
################################################################################


### BashRC Configuration                                                     ###
function BASHRC_CONF() {
  dialog --infobox "Setting Up The BashRC Config File." 3 38
  sleep 3
  clear
  echo " " >> ~/.bashrc
  echo "# Check to see if neofetch is installed and if so display it" >> ~/.bashrc
  echo "if [ -f /usr/bin/neofetch ]; then clear & neofetch; fi" >> ~/.bashrc
  sed -i 's/alias/#alias'/g ~/.bashrc
  echo "# Setting up some aliases" >> ~/.bashrc
  echo "alias ls='lsd'" >> ~/.bashrc
  echo "alias cat='bat'" >> ~/.bashrc
  echo "alias fd='ncdu'" >> ~/.bashrc
  echo "alias netsp='bwm-ng'" >> ~/.bashrc
  echo "alias df='duf -hide special'" >> ~/.bashrc
  echo "alias font='fontpreview-ueberzug'" >> ~/.bashrc
  echo "alias sysmon='gtop'" >> ~/.bashrc
  echo "alias conf-theme='~/.config/gtk-3.0/settings.ini'" >> ~/.bashrc
  echo "alias video='ytfzf -t --upload-time=today '" >> ~/.bashrc
  echo "alias videos='ytfzf -tS '" >> ~/.bashrc
  echo "alias cpu='cpufetch'" >> ~/.bashrc
  echo "alias info='clear&&neofetch'" >> ~/.bashrc
  echo "alias ref-update='sudo reflector --country US --latest 20 --sort rate --verbose --save /etc/pacman.d/mirrorlist'" >> ~/.bashrc
  echo "alias compress='clear&&sudo btrfs filesystem defragment -c -r -v '" >> ~/.bashrc
}

### Which AUR Helper                                                         ###
function AUR_HELPER() {
  clear
  echo "################################################################################"
  echo "### Which AUR Helper Do You Want To Install?                                 ###"
  echo "### 1)  YAY                                                                  ###"
  echo "### 2)  PARU (Takes a while to compile)                                      ###"
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

### Samba Shares?                                                            ###
function SAMBA_SHARES() {
  clear
  echo "################################################################################"
  echo "### Do you want SAMBA network sharing installed?                             ###"
  echo "### 1)  Yes                                                                  ###"
  echo "### 2)  No                                                                   ###"
  echo "################################################################################"
  read case;

  case $case in
    1)
    SAMBA_SH="yes"
    ;;
    2)
    SAMBA_SH="no"
    ;;
  esac
}

### Printer Support                                                          ###
function PRINTER_SUPPORT() {
  clear
  echo "################################################################################"
  echo "### Do You Want Printer Support?                                             ###"
  echo "### 1)  Yes                                                                  ###"
  echo "### 2)  No                                                                   ###"
  echo "################################################################################"
  read case;

  case $case in
    1)
    PSUPPORT="yes"
    clear
    echo "################################################################################"
    echo "### Do You Want HP Printer Support?                                          ###"
    echo "### 1)  Yes                                                                  ###"
    echo "### 2)  No                                                                   ###"
    echo "################################################################################"
    read case;
    case $case in
      1)
      HP_PRINT="yes"
      ;;
      2)
      HP_PRINT="no"
      ;;
    esac
    clear
    echo "################################################################################"
    echo "### Do You Want Epson Printer Support?                                       ###"
    echo "### 1)  Yes                                                                  ###"
    echo "### 2)  No                                                                   ###"
    echo "################################################################################"
    read case;
    case $case in
      1)
      EP_PRINT="yes"
      ;;
      2)
      EP_PRINT="no"
      ;;
    esac
    ;;
    2)
    PSUPPORT="no"
    ;;
  esac
}

### Bluetooth Support                                                        ###
function BLUETOOTH_SUPPORT() {
  clear
  echo "################################################################################"
  echo "### Do You Want Bluetooth Support?                                           ###"
  echo "### 1)  Yes                                                                  ###"
  echo "### 2)  No                                                                   ###"
  echo "################################################################################"
  read case;

  case $case in
    1)
    BT_SUPPORT="yes"
    ;;
    2)
    BT_SUPPORT="no"
    ;;
  esac
}

### Extra Sound Themes                                                       ###
function SOUNDTHEME_SUPPORT() {
  clear
  echo "################################################################################"
  echo "### Do You Want To Install Extra Sound Themes?                               ###"
  echo "### 1)  Yes                                                                  ###"
  echo "### 2)  No                                                                   ###"
  echo "################################################################################"
  read case;

  case $case in
    1)
    SND_THEME="yes"
    ;;
    2)
    SND_THEME="no"
    ;;
  esac
}

### Extra System Fonts                                                       ###
function EXTRA_FONTS() {
  clear
  echo "################################################################################"
  echo "### Do You Want To Install Extra System Font?                                ###"
  echo "### 1)  Yes                                                                  ###"
  echo "### 2)  No                                                                   ###"
  echo "################################################################################"
  read case;

  case $case in
    1)
    EXT_FONTS="yes"
    clear
    echo "################################################################################"
    echo "### Do You Want To Install Nerd Complete Fonts?                              ###"
    echo "### ------------ Warning Large Download So Can Take Some Time -------------- ###"
    echo "### 1)  Yes                                                                  ###"
    echo "### 2)  No                                                                   ###"
    echo "################################################################################"
    read case;

    case $case in
      1)
      NERD_FONTS="yes"
      ;;
      2)
      NERD_FONTS="no"
      ;;
    esac
    ;;
    2)
    E_FONTS="no"
    ;;
  esac
}

### AUR Helper Installation                                                  ###
function AUR_SELECTION() {
  if [ ${ZB} = "yay" ]; then
    dialog --infobox "Installing The AUR Helper YAY." 3 34
    sleep 2
    clear
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm --needed
    cd ..
    rm yay -R -f
  fi
  if [ ${ZB} = "paru" ]; then
    dialog --infobox "Installing The AUR Helper Paru." 3 35
    sleep 2
    clear
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si --noconfirm --needed
    cd ..
    rm paru -R -f
    sudo sed -i 's/#BottomUp/BottomUp/' /etc/paru.conf
  fi
}

### Samba Shares Installation                                                ###
function SAMBA_INSTALL() {
  dialog --infobox "Setting Up The Samba Shares." 3 32
  sleep 2
  clear
  sudo pacman -S --noconfirm --needed samba gvfs-smb avahi nss-mdns
  sudo wget "https://git.samba.org/samba.git/?p=samba.git;a=blob_plain;f=examples/smb.conf.default;hb=HEAD" -O /etc/samba/smb.conf
  sudo sed -i -r 's/MYGROUP/WORKGROUP/' /etc/samba/smb.conf
  sudo sed -i -r "s/Samba Server/$HOSTNAME/" /etc/samba/smb.conf
  sudo systemctl enable smb.service
  sudo systemctl start smb.service
  sudo systemctl enable nmb.service
  sudo systemctl start nmb.service
  #Change your username here
  #sudo smbpasswd -a $(whoami)
  #Access samba share windows
  sudo systemctl enable avahi-daemon.service
  sudo systemctl start avahi-daemon.service
  sudo sed -i 's/dns/mdns dns wins/g' /etc/nsswitch.conf
  #Set-up user sharing (disable this section if you dont want user shares)
  sudo mkdir -p /var/lib/samba/usershares
  sudo groupadd -r sambashare
  sudo chown root:sambashare /var/lib/samba/usershares
  sudo chmod 1770 /var/lib/samba/usershares
  sudo sed -i -r '/\[global\]/a\username path = /var/lib/samba/usershares\nusershare max shares = 100\nusershare allow guests = yes\nusershare owner only = yes' /etc/samba/smb.conf
  sudo gpasswd sambashare -a $(whoami)
}

### Needed Software                                                          ###
function NEEDED_SOFTWARE() {
  dialog --infobox "Adding Some Needed Software." 3 32
  sleep 2
  clear
  $ZB -S --noconfirm --needed tuned fontpreview-ueberzug-git ytfzf cpufetch
}

### Setting Up Bluetooth                                                     ###
function BLUETOOTHSETUP() {
  dialog --infobox "Installing Bluetooth Files." 3 31
  sleep 2
  clear
  sudo pacman -S --noconfirm --needed pulseaudio-bluetooth bluez bluez-libs bluez-utils bluez-plugins blueberry bluez-tools bluez-cups
  sudo systemctl enable bluetooth.service
  sudo systemctl start bluetooth.service
  sudo sed -i 's/'#AutoEnable=false'/'AutoEnable=true'/g' /etc/bluetooth/main.conf
}

### Setup Printing                                                           ###
function PRINTERSETUP() {
  dialog --infobox "Installing Printer Subsystem." 3 33
  sleep 2
  clear
  sudo pacman -S --noconfirm --needed cups cups-pdf ghostscript gsfonts gutenprint gtk3-print-backends libcups system-config-printer foomatic-db foomatic-db-ppds foomatic-db-gutenprint-ppds foomatic-db-engine foomatic-db-nonfree foomatic-db-nonfree-ppds
  if [ ${HP_PRINT} = "yes" ]; then
    sudo pacman -S --noconfirm --needed hplip
  fi
  if [ ${EP_PRINT} = "yes" ]; then
    $ZB -S --noconfirm --needed epson-inkjet-printer-escpr
  fi
  sudo systemctl enable cups.service
}

### Check What Video Card Installed                                          ###
function VC_INSTALL() {
  if [[ $(lspci -k | grep VGA | grep -i nvidia) ]]; then
    dialog --infobox "Installing nVidia Video Drivers." 3 36
    sleep 2
    clear
    sudo pacman -S --noconfirm --needed nvidia nvidia-cg-toolkit nvidia-settings nvidia-utils lib32-nvidia-cg-toolkit lib32-nvidia-utils lib32-opencl-nvidia opencl-nvidia cuda ffnvcodec-headers lib32-libvdpau libxnvctrl pycuda-headers python-pycuda
    sudo pacman -R --noconfirm xf86-video-nouveau
  fi

  if [[ $(lspci -k | grep VGA | grep -i amd) ]]; then
    dialog --infobox "Installing AMD Video Drivers." 3 33
    sleep 2
    clear
    sudo pacman -S --noconfirm --needed opencl-mesa lib32-opencl-mesa vulkan-mesa-layers lib32-vulkan-mesa-layers mesa-vdpau lib32-mesa-vdpau intel-compute-runtime intel-graphics-compiler intel-opencl-clang vulkan-icd-loader lib32-vulkan-icd-loader vkd3d lib32-vkd3d vulkan-swrast vulkan-radeon lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver # Testing stuff amdvlk lib32-amdvlk
    $ZB -S --noconfirm --needed rocm-opencl-runtime
    dialog --infobox "Thanks for supporting a free and open vendor." 3 49
    sleep 2
  fi
}

### Install Sound Themes                                                     ###
function INSTALL_SOUNDTHEME() {
  dialog --infobox "Installing Some Sound Themes." 3 33
  sleep 2
  clear
  sudo pacman -S --noconfirm --needed deepin-sound-theme
  $ZB -S --noconfirm --needed sound-theme-smooth sound-theme-elementary-git
}

### Install Extra Fonts                                                      ###
function INSTALL_EXTRAFONTS() {
  dialog --infobox "Installing Some Extra System Fonts." 3 39
  sleep 2
  clear
  sudo pacman -S --noconfirm --needed adobe-source-sans-pro-fonts cantarell-fonts noto-fonts terminus-font ttf-bitstream-vera ttf-dejavu ttf-droid ttf-inconsolata ttf-liberation ttf-roboto ttf-ubuntu-font-family tamsyn-font awesome-terminal-fonts ttf-font-awesome ttf-hack ttf-ibm-plex
  $ZB -S --noconfirm --needed ttf-ms-fonts ttf-mac-fonts siji-git ttf-font-awesome
  if [ ${NERD_FONTS} = "yes" ]; then
    $ZB -S --noconfirm --needed nerd-fonts-complete
  fi
}

### Main Program                                                             ###
AUR_HELPER
SAMBA_SHARES
PRINTER_SUPPORT
BLUETOOTH_SUPPORT
SOUNDTHEME_SUPPORT
EXTRA_FONTS

AUR_SELECTION
NEEDED_SOFTWARE
if [ ${SAMBA_SH} = "yes" ]; then
  SAMBA_INSTALL
fi
if [ ${BT_SUPPORT} = "yes" ]; then
  BLUETOOTHSETUP
fi
if [ ${PSUPPORT} = "yes" ]; then
  PRINTERSETUP
fi
#VC_INSTALL
if [ ${SND_THEME} = "yes" ]; then
  INSTALL_SOUNDTHEME
fi
if [ ${EXT_FONTS} = "yes" ]; then
  INSTALL_EXTRAFONTS
fi
VC_INSTALL

BASHRC_CONF
