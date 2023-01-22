#!/bin/zsh

# system
alias poweroff="/usr/bin/sudo poweroff"
alias shutdown="poweroff"
alias reboot="/usr/bin/sudo reboot"
alias mkgrub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias sudo="sudo -v && sudo "
alias su="sudo su"

# fs
alias ls="ls -h --color=auto"
alias l="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"
alias la="ls -la"
alias mkdir="mkdir -p"
alias mv="mv -v"
alias cp="cp -rv"
alias rm="rm -rv"
alias mtar="tar -zcvf" # mtar <archive_compress> <file_list>
alias utar="tar -zxvf" # utar <archive_decompress> <file_list>
alias zip="zip -r" # zip <archive_compress> <file_list>
alias uzip="unzip" # uzip <archive_decompress> -d <dir>

# pacman
alias pacman="sudo pacman"
alias upgrade="yay -Syyu"

# wget
alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"

# neovim
alias vim="nvim"
alias svim="sudo nvim"
