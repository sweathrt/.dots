##
## ZSH Options
##

umask 022
zmodload zsh/zle
zmodload zsh/zpty
zmodload zsh/complist

autoload _vi_search_fix
autoload -U compinit
autoload -Uz colors promptinit
colors

zle -N _vi_search_fix
zle -N _sudo_command_line

# Completion
# my stuff
zstyle :compinstall filename '/home/sweathrt/.config/zsh/.zshrc'
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
#zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

# History
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=1000
SAVEHIST=1000

# Autosuggestion
ZSH_AUTOSUGGEST_USE_ASYNC="true"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor regexp root line)
ZSH_HIGHLIGHT_MAXLENGTH=512
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=$color8,bold"

# Set options
while read -r opt
do 
  setopt $opt
done <<-EOF
AUTOCD
AUTO_MENU
AUTO_PARAM_SLASH
COMPLETE_IN_WORD
NO_MENU_COMPLETE
HASH_LIST_ALL
ALWAYS_TO_END
NOTIFY
NOHUP
MAILWARN
INTERACTIVE_COMMENTS
NOBEEP
APPEND_HISTORY
SHARE_HISTORY
INC_APPEND_HISTORY
EXTENDED_HISTORY
HIST_IGNORE_ALL_DUPS
HIST_IGNORE_SPACE
HIST_NO_FUNCTIONS
HIST_EXPIRE_DUPS_FIRST
HIST_SAVE_NO_DUPS
HIST_REDUCE_BLANKS
EOF

# Unset options
while read -r opt
do 
  unsetopt $opt
done <<-EOF
FLOWCONTROL
NOMATCH
CORRECT
EQUALS
EOF

command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -v

PROMPT='[%n@%m:%B%~%b]$ '
