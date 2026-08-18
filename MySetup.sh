#!/bin/bash

# 1. Define las parejas de rutas: "ORIGEN DESTINO"
ENLACES=(
    "$HOME/DotFiles/.dosbox $HOME/"
    "$HOME/DotFiles/.vimrc $HOME/.vimrc"
    "$HOME/DotFiles/.Xresources $HOME/.Xresources"
    "$HOME/DotFiles/Wallpapers $HOME/"
    "$HOME/DotFiles/.icewm $HOME/"
    "$HOME/DotFiles/gtk-3.0 $HOME/.config/"	
    "$HOME/DotFiles/picom $HOME/.config/"
)

# 2. Crear los enlaces simbólicos
for pareja in "${ENLACES[@]}"; do
    ln -s $pareja
    echo "Enlace creado para: $pareja"
done
