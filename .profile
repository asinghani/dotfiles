# Terminal Profile

source ~/.vars
source ~/.script_utils
source ~/.prompt
source ~/.alias

# dotfiles_local must not be pushed to git
touch ~/.dotfiles_local
source ~/.dotfiles_local

# .host file must not be pushed to git
if [ -f ~/.host-Anish-MBP ]; then
    source ~/.Anish-MBP
    source ~/.config_mac
fi

if [ -f ~/.host-Anish-Server ]; then
    source ~/.Anish-Server
    source ~/.config_linux
fi

if [ -f ~/.host-inspiron ]; then
    source ~/.intel_laptop_linux
    source ~/.config_linux
fi

# Git dotfile manager
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

