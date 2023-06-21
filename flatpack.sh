################################################################################
#### Installing Software (Flatpak) Arch script                               ###
#### By Erik Sundquist                                                       ###
################################################################################

### Software Install

### Utilities ###
  function SOFT_UTILS () {
  clear
  echo "################################################################################"
  echo "### Installing Utilities                                                     ###"
  echo "################################################################################"
  sleep 3
  flatpak -y install net.davidotek.pupgui2
  flatpak -y install com.github.tchx84.Flatseal
  flatpak -y install com.system76.Popsicle
  flatpak -y install io.github.peazip.PeaZip
  flatpak -y install com.poweriso.PowerISO
  flatpak -y install io.github.giantpinkrobots.bootqt
  #flatpak -y install io.github.Foldex.AdwSteamGtk
  flatpak -y install com.usebottles.bottles
}

### Games ###
function SOFT_GAMES() {
  clear
  echo "################################################################################"
  echo "### Installing Games                                                         ###"
  echo "################################################################################"
  sleep 3
  flatpak -y install net.sourceforge.ExtremeTuxRacer
  flatpak -y install org.debian.TuxPuck
  flatpak -y install net.supertuxkart.SuperTuxKart
  flatpak -y install com.tux4kids.tuxtype
  flatpak -y install org.tuxpaint.Tuxpaint
  flatpak -y install party.supertux.supertuxparty
  flatpak -y install net.sourceforge.TuxFootball
  flatpak -y install com.tux4kids.tuxmath
  flatpak -y install org.supertuxproject.SuperTux
  flatpak -y install com.mojang.Minecraft
  flatpak -y install org.polymc.PolyMC
  flatpak -y install com.github.k4zmu2a.spacecadetpinball
  flatpak -y install org.gnome.Aisleriot
}

### Sound & Video ###
function SOFT_SOUNDVIDEO () {
  clear
  echo "################################################################################"
  echo "### Installing Sound & Video                                                 ###"
  echo "################################################################################"
  sleep 3
  flatpak -y install fr.handbrake.ghb
  flatpak -y install com.obsproject.Studio
  flatpak -y install org.kde.kdenlive
  flatpak -y install org.openshot.OpenShot
  flatpak -y install org.shotcut.Shotcut
  flatpak -y install com.makemkv.MakeMKV
  flatpak -y install org.olivevideoeditor.Olive
  flatpak -y install io.lbry.lbry-app
  flatpak -y install org.clementine_player.Clementine
  flatpak -y install io.mpv.Mpv
  flatpak -y install io.github.jliljebl.Flowblade
  flatpak -y install org.gpodder.gpodder
  flatpak -y install org.strawberrymusicplayer.strawberry
}

### Graphics ###
function SOFT_GRAPHICS () {
  clear
  echo "################################################################################"
  echo "### Installing Graphics                                                      ###"
  echo "################################################################################"
  sleep 3
  flatpak -y install org.gimp.GIMP
  flatpak -y install org.darktable.Darktable
  flatpak -y install org.inkscape.Inkscape
  flatpak -y install org.kde.krita
  flatpak -y install net.sourceforge.qtpfsqui.LuminanceHDR
  flatpak -y install org.freecadweb.FreeCAD
  flatpak -y install com.jgraph.drawio.desktop
  flatpak -y install org.blender.Blender
  flatpak -y install org.leocad.LeoCAD
  flatpak -y install fr.natron.Natron
  flatpak -y install com.github.buddhi1980.mandelbulber2
  flatpak -y install org.openscad.OpenSCAD  
}

### Office ###
function SOFT_OFFICE () {
  clear
  echo "################################################################################"
  echo "### Installing Office                                                        ###"
  echo "################################################################################"
  sleep 3
  flatpak -y install org.libreoffice.LibreOffice
  flatpak -y install fr.free.Homebank
  flatpak -y install org.onlyoffice.desktopeditors
  flatpak -y install io.posidon.Paper
  flatpak -y install work.openpaper.Paperwork
}

### 3d Printer
function SOFT_3DPRN () {
  clear
  echo "################################################################################"
  echo "### Installing 3d Printer                                                    ###"
  echo "################################################################################"
  sleep 3
  flatpak -y install com.prusa3d.PrusaSlicer
  flatpak -y install com.ultimaker.cura
}

### Chat
function SOFT_CHAT () {
  clear
  echo "################################################################################"
  echo "### Installing Chat                                                          ###"
  echo "################################################################################"
  sleep 3
  flatpak -y install com.teamspeak.TeamSpeak
  flatpak -y install org.telegram.desktop
  flatpak -y install com.skype.Client
  flatpak -y install us.zoom.Zoom
  flatpak -y install com.discordapp.Discord
}

### Internet
function SOFT_INTERNET () {
  clear
  echo "################################################################################"
  echo "### Installing Internet                                                      ###"
  echo "################################################################################"
  sleep 3
  #flatpak -y install org.remmina.Remmina
}

### Programming
function SOFT_PROG () {
  clear
  echo "################################################################################"
  echo "### Installing Programming                                                   ###"
  echo "################################################################################"
  sleep 3
  flatpak -y install com.visualstudio.code-oss
}


################################################################################
### Main Program                                                             ###
################################################################################
SOFT_3DPRN
SOFT_CHAT
SOFT_GAMES
SOFT_GRAPHICS
SOFT_OFFICE
SOFT_INTERNET
SOFT_PROG
SOFT_SOUNDVIDEO
SOFT_UTILS
