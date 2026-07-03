#
# ~/.bash_profile
#
# Runs once on login, this is where I will set default programs
# VERY necessary for hyprland

# If .bashrc exists, execute it here
[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR=vim
export TERMINAL=kitty
export FILE_MANAGER=dolphin
export WEB_BROWSER=firefox
# weird hack scripts
export FEED_READER=newsboat_launch
export LAUNCHER=rofi_launch
