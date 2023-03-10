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
alias mkdir="mkdir -p"
alias mv="mv -v"
alias cp="cp -rv"
alias rm="rm -rvf"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias mtar="tar -zcvf" # mtar <archive_compress> <file_list>
alias utar="tar -zxvf" # utar <archive_decompress> <file_list>
alias zip="zip -r" # zip <archive_compress> <file_list>
alias uzip="unzip" # uzip <archive_decompress> -d <dir>

# pacman
alias pacman="sudo pacman"
alias update="yay -Syyu --devel"

# wget
alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"

# neovim
alias vim="nvim"
alias svim="sudo nvim"

# cs50
alias make50='make CC=clang CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow" LDLIBS="-lcrypt -lcs50 -lm"'
