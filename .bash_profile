#
# ~/.bash_profile
#

# Runs once on login, this is where I will set default programs
# VERY necessary for hyprland

# If .bashrc exists, execute it here
[[ -f ~/.bashrc ]] && . ~/.bashrc

# This isn't what was causing vim issues! Vim 9.0 doesn't check XDG_CONFIG_HOME
# Because I'm on ubuntu 22 on my normal work machine, its still v9.0. Arch
# installs v9.1. This is an issue I will work out later.

# On Ubuntu, XDG_CONFIG_HOME might not be set the way it does on arch
# if [[ ! ":XDG_CONFIG_HOME:" == *":$HOME/.config:" ]]; then
	# export XDG_CONFIG_HOME="$XDG_CONFIG_HOME:$HOME/.config"
# fi

export EDITOR=vim
export TERMINAL=kitty
export FILE_MANAGER=dolphin
export LAUNCHER=rofi_launch
export WEB_BROWSER=firefox
