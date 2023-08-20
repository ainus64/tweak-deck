#!/bin/bash
appName=Tweak-deck
version=v0.01
author=Ainus
github=""

# Global Variables
APPNAME="${appName} - ${version}"
TERM="x-terminal-emulator"

#TERM="xterm"
commands=""


_check_app_permission(){
    chmod +x "$0"

    set -x
}


# Estructura:
# Root Passwd
# Partición Escritura/Lectura.
# Activar Samba
# Activar SSH
# Instalar Software Adicional
#   DeckyLoader
#   Emudeck
#   Kodi
#   Discord
#   Heroic
#   Lutris
#   ProtonUp-Qt
#   Spotify
#   Navegadores
#       Firefox
#       Chrome
#       Edge
#   WebApps
#       Custom WebApp - Insert URL
#       Netflix
#       Prime Video
#       Google
#       Youtube
#       Twitter
#       Facebook
#       Instagram
#       CrunchyRoll
#       AnimeFlv
#       JkAnime
#



#######################################################################################
##  Change Root Passwd
#######################################################################################
change_passwd(){
    echo "Doing changes in passwd"
    msg_welcome="Set your password for Steamdeck user"
    commands="echo '${APPNAME}' && echo '${msg_welcome}' && echo '' && passwd"
    "${TERM}" -e "${commands}"
    _mainMenu
}

partition_write(){
    echo "Doing changes in partition_write"
     options=$(zenity --list --radiolist \
                    --title="${APPNAME}" \
                    --text="Enable or disable SteamOS SteamOS-readonly Partition System \nSelect an option" \
                    --column="" --column="Options" --column="Description" \
                    --height=250 --width=640 \
                    1 "Disable" "SteamOS-readonly Partition System (Choose this for changes in System)" \
                    2 "Enable" "SteamOS-readonly Partition System"
                    )
                    if [[ $options == "Disable" ]];then
                        echo "sudo steamos-readonly disable"
                    elif [[ $options == "Enable" ]];then
                        echo "sudo steamos-readonly enable"
                    else
                        echo "I Dont know"
                    fi
    _mainMenu
}

ssh(){
    echo "Doing changes in ssh"
}

samba(){
    echo "Doing changes in samba"
}

Software_Extra(){
    echo "Doing changes in Software_extra"
}

Update(){
    echo "Doing changes in Update"
}

About(){
    echo "Doing changes in About"
}
#######################################################################################
##  Main Menu
#######################################################################################
_mainMenu(){
    options=$(zenity --list --radiolist \
                    --title="${APPNAME}" \
                    --text="Select an option" \
                    --column="" --column="Options" --column="Description" \
                    --height=250 --width=640 --extra-button="Update" --extra-button="About"\
                    1 "change_passwd" "Assign a password for Root User" \
                    2 "partition_write" "Enable or disable SteamOS-readonly Partition System" \
                    3 "ssh" "Install and Enable SSH protocol" \
                    4 "samba" "Install and Enable Samba Share protocol" \
                    5 "Software_Extra" "Add more Software to SteamDeck"
                    )
                    
                    echo "Exit code: $?"
                    opt=$?

                    if [[ $opt -eq 1 ]]; then
                        echo "Quit."
                        exit
                    fi

                    if [ $opt -eq 0 ]; then
                        # Check if Options Value is empty or not
                        if [[ $options = "" ]]; then
                            echo "Show a Message and go Main Menu again..."
                        else
                            $options
                        fi
                    fi
} # <- end Main Menu

_mainMenu