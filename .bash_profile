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

# Do I really have to do this every time? I feel like this isn't the right way
# to do this... but whatever ( I don't even know if this is working)
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

