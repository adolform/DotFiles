#!/bin/bash

# Verificar si el script se ejecuta como root (administrador)
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, ejecuta este script como root (usando sudo)."
  exit 1
fi

clear
echo "========================================="
echo "   INSTALADOR DE PROGRAMAS PARA DEBIAN 13"
echo "========================================="
echo

# 1. Actualizar el sistema antes de instalar
echo "[*] Actualizando índices de paquetes..."
apt update && apt upgrade -y
echo "[OK] Sistema listo."
echo

# 2. Instalación de programas generales
echo "[*] Instalando programas base..."
sudo apt install acpi alsa-utils arandr audacious bleachbit build-essential cmatrix cowsay curl diodon dkms eject extrepo feh ftp git gsimplecal i3lock imagemagick innoextract libdrm-dev lightdm linux-headers-$(uname -r) mc mupdf network-manager newsboat p7zip-full papirus-icon-theme pavucontrol picom pulseaudio qbittorrent scrot smartmontools smplayer tlp terminator timeshift udiskie unar unrar-free unattended-upgrades volumeicon-alsa vim wget x11-xserver-utils xcowsay xclip -y
echo "[OK] Programas base completados."
echo

# 3. Condicional IF para componentes Bluetooth
read -p "¿Deseas instalar las aplicaciones y drivers de Bluetooth? (s/n): " respuesta

# Convertir la respuesta a minúscula para validar más fácil
respuesta=$(echo "$respuesta" | tr '[:upper:]' '[:lower:]')

if [ "$respuesta" = "s" ] || [ "$respuesta" = "si" ]; then
    echo
    echo "[*] Instalando componentes de Bluetooth..."
    # Instala el stack de bluetooth, utilidades de consola y el gestor grafico Blueman
    apt install bluez blueman pulseaudio-module-bluetooth bluez-tools -y
    
    echo "[*] Habilitando el servicio de Bluetooth..."
    systemctl enable bluetooth
    systemctl start bluetooth
    echo "[OK] Bluetooth instalado y activo."
else
    echo
    echo "[X] Instalación de Bluetooth omitida."
fi

# 4. Condicional IF para Flatpak
read -p "¿Deseas instalar Flatpak? (s/n): " respuesta

# Convertir la respuesta a minúscula para validar más fácil
respuesta=$(echo "$respuesta" | tr '[:upper:]' '[:lower:]')

if [ "$respuesta" = "s" ] || [ "$respuesta" = "si" ]; then
    echo
    echo "[*] Instalando Flatpak..."
    apt install flatpak -y
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    
else
    echo
    echo "[X] Instalación de Flatpak omitida."
fi

# 5. Condicional IF para Dev Tools
read -p "¿Deseas instalar las Dev Tools? (s/n): " respuesta

# Convertir la respuesta a minúscula para validar más fácil
respuesta=$(echo "$respuesta" | tr '[:upper:]' '[:lower:]')

if [ "$respuesta" = "s" ] || [ "$respuesta" = "si" ]; then
    echo
    echo "[*] Instalando Dev Tools..."
    sudo apt install cmake default-jdk default-jre gdb nodejs npm python3-pip python3-venv putty putty-tools sqlite3 vim-gtk3 emacs -y
    
else
    echo
    echo "[X] Instalación de Dev Tools omitida."
fi

# 6. Condicional IF para Juegos lml
read -p "¿Deseas instalar los juegos? (s/n): " respuesta

# Convertir la respuesta a minúscula para validar más fácil
respuesta=$(echo "$respuesta" | tr '[:upper:]' '[:lower:]')

if [ "$respuesta" = "s" ] || [ "$respuesta" = "si" ]; then
    echo
    echo "[*] Instalando Dev Tools..."
    apt install crawl-tiles xye wesnoth dosbox xboard -y
    
else
    echo
    echo "[X] Instalación de Juegos omitida."
fi
echo
echo "========================================="
echo "   Proceso finalizado con éxito."
echo "========================================="
