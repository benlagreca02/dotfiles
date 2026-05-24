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


# TODO fix this... This doesn't really work like I want it to
# Maybe now with LUA config there's a better way to do this...

# reload kanshi forcibly (someimtes it doesn't on boot)
# This is a hack, I need to find a better way to do this
kanshictl reload
