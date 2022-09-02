# Top-level profile
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

if [ -f ~/.host-Anish-Thinkpad ]; then
    source ~/.Anish-Thinkpad
    source ~/.config_linux
fi

if [ -f ~/.host-Anish-Miniserver ]; then
    source ~/.Anish-Miniserver
    source ~/.config_linux
fi

if [ -f ~/.host-cmu-andrew ]; then
    source ~/.cmu-common
    source ~/.cmu-andrew
    source ~/.config_linux
fi

if [ -f ~/.host-cmu-cclub ]; then
    source ~/.cmu-common
    source ~/.cmu-cclub
    source ~/.config_linux
fi

# Git dotfile manager
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export QSYS_ROOTDIR="/home/anish/intelFPGA_lite/21.1/quartus/sopc_builder/bin"
