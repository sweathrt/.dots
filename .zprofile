#/bin/zsh

export ZDOTDIR="$HOME/.config/zsh"

# Start graphical server on user's current tty if not already running.
#[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"
