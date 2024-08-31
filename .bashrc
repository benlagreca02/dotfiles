# ~/.bashrc: executed by bash(1) for non-login shells.
# Most of these were the "ubuntu default", but I pruned away many of them

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000

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
    PS1="\[\033[38;5;46m\]\u@\H\[$(tput sgr0)\][\[$(tput sgr0)\]\[\033[38;5;51m\]\w\[$(tput sgr0)\]]\[$(tput sgr0)\]\[\033[38;5;1m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"
else
    # Arch default
    PS1='[\u@\h \W]\$'
fi

unset color_prompt 

# enable color support of ls and others
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

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# just a funny thing for startup
echo "wenk wenk" | cowsay -f tux | lolcat

# PICO SDK path stuff
# export PICO_SDK_PATH=/home/ben/pico/pico-sdk
# export PICO_EXAMPLES_PATH=/home/ben/pico/pico-examples
# export PICO_EXTRAS_PATH=/home/ben/pico/pico-extras
# export PICO_PLAYGROUND_PATH=/home/ben/pico/pico-playground

# git alias to headless repo for dotfile management
alias config='/usr/bin/git --git-dir=/home/ben/.cfg --work-tree=/home/ben'


# ROS base layer source, for ROS development
# source /opt/ros/humble/setup.bash

