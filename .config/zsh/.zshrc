# Lines configured by zsh-newuser-install
HISTFILE=$XDG_STATE_HOME/zsh/history
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sweathrt/.config/zsh/.zshrc'
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache

autoload -Uz compinit promptinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
# End of lines added by compinstall

PROMPT='[%n@%m:%B%~%b]$ '

[ -f $HOME/.config/aliases ] && source $HOME/.config/aliases
