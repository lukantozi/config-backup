eval "$(gnome-keyring-daemon --start --components=secrets,pkcs11,ssh)"
export SSH_AUTH_SOCK

[[ -f ~/.bashrc ]] && source ~/.bashrc

export QT_QPA_PLATFORMTHEME=qt5ct

if [[ -z $WAYLAND_DISPLAY && $(tty) = /dev/tty1 ]]; then
  exec Hyprland
fi
