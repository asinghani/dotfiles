# Terminal Profile

source ~/.vars
source ~/.script_utils
source ~/.prompt
source ~/.alias

touch ~/.dotfiles_local
source ~/.dotfiles_local

if [ -f ~/.Anish-MBP ]; then
    source ~/.Anish-MBP
    source ~/.config_mac
fi


# Git dotfile manager
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
