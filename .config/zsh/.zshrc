#!/bin/sh
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# source files
plug "${ZDOTDIR:-$HOME/.config/zsh}/aliases.zsh"
plug "${ZDOTDIR:-$HOME/.config/zsh}/options.zsh"

# source plugins
plug "zsh-users/zsh-autosuggestions"
plug "hlissner/zsh-autopair"
plug "zap-zsh/vim"
plug "zsh-users/zsh-syntax-highlighting"
plug "wintermi/zsh-starship"
