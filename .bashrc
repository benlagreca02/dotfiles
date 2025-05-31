# ~/.bashrc: executed by bash(1) for non-login shells.

# Default program sets are done in hyprland conifg file
# `.config/hypr/configs/programs.conf`

# source my scripts, do this BEFORE interactive check, to make sure that I can
# call scripts from other scripts
export PATH="$PATH:/home/$USER/.local/bin/scripts"

# If NOT running interactively, stop here!
[[ $- != *i* ]] && return

# Fetch the OS "Arch" or "Ubuntu"
os=$(cat /etc/os-release | grep -o -m 1 "Arch")

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=50000
HISTFILESIZE=100000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# This was here by default, I took out the "if force color prompt" around it
# checks for tput, and if its here, it means we can use my fancy color prompt
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
else
    color_prompt=
fi

# if we can do a color prompt, do my crazy prompt
if [ "$color_prompt" = yes ]; then
    PS1="\[\033[38;5;45m\]\u@\H\[$(tput sgr0)\][\[$(tput sgr0)\]\[\033[38;5;51m\]\w\[$(tput sgr0)\]]\[$(tput sgr0)\]\[\033[38;5;1m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"
else
    # Arch default, I just think its a nice plain one
    PS1='[\u@\h \W]\$'
fi
# cleanup variable 
unset color_prompt 

# TODO break aliases into their own file
# enable color support of ls and other simmilar by default
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias ip='ip -c'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# ls aliases, I don't like the default ones ubuntu puts in here
# g: don't print owner
# G: don't print GROUP owner
# t: sort by time
# r: reverse (newest file at BOTTOM of output)
# A: all files (without . and ..)
# l: long list
alias lt='ls -lrAht'  # "List Time"

# Git aliases for general purpose
# Shouldn't interfere with anything
alias gs='git status'
alias gd='git diff'
alias gl='git log'

# git alias to headless repo for dotfile management
alias config='/usr/bin/git --git-dir=/home/$USER/.cfg --work-tree=/home/$USER'

# Super awesome alias, comes in handy when working in LARGE projects
alias vf='vim $(fzf)'


# just a funny thing for startup
if [ "$os" == "Arch" ]; then   
    # Just to verify its loading the right settings
    echo "I use arch btw" | cowsay -f tux | lolcat
else
    echo "wenk wenk" | cowsay -f tux | lolcat
fi

# PICO SDK path stuff
# For rasberry pi pico development work
# export PICO_SDK_PATH=/home/$USER/pico/pico-sdk
# export PICO_EXAMPLES_PATH=/home/$USER/pico/pico-examples
# export PICO_EXTRAS_PATH=/home/$USER/pico/pico-extras
# export PICO_PLAYGROUND_PATH=/home/$USER/pico/pico-playground

# from calling `pipx ensurepath`
# Created by `pipx` on 2024-12-21 16:38:46
export PATH="$PATH:/home/$USER/.local/bin"

# Assumes you have miniconda installed
alias condatime='source ~/.miniconda3/bin/activate'

# =========== ROS =========== 
## ROS base layer source, for ROS development
# source /opt/ros/humble/setup.bash
## ROS moveit source, for if/when I'm doing something with servoing
# source ~/projects/ws_moveit/install/setup.bash
## Extremely helpful alias
# alias sisb='source install/setup.bash'

# ARCH SPECIFIC SETTINGS
if [ "$os" == "Arch" ]; then   
  alias pacman='sudo pacman'
  # discord has fractional scaling issues
  alias discord='discord --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto'
fi
