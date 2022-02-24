#!/bin/bash

################################################################################
### Arch Linux - Additional CLI Software                                     ###
################################################################################


### BashRC Configuration                                                     ###
function BASHRC_CONF() {
  clear
  dialog --infobox "Setting Up The BashRC Config File." 3 38
  sleep 3
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
}

### Which AUR Helper                                                         ###
function AUR_HELPER() {
  clear
  echo "################################################################################"
  echo "### Which AUR Helper Do You Want To Install?                                 ###"
  echo "### 1)  YAY (Currently Broken)                                               ###"
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
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm --needed
    cd ..
    rm yay -R -f
  fi
  if [ ${ZB} = "paru" ]; then
    dialog --infobox "Installing The AUR Helper Paru." 3 35
    sleep 2
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
  clear
  dialog --infobox "Setting Up The Samba Shares." 3 32
  sleep 2
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

### Main Program                                                             ###
AUR_HELPER
SAMBA_SHARES
PRINTER_SUPPORT
BLUETOOTH_SUPPORT
SOUNDTHEME_SUPPORT
EXTRA_FONTS

AUR_SELECTION
SAMBA_SHARES
BASHRC_CONF
