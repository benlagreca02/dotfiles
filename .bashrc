# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# This was here by default, I took out the "if force color prompt" around it
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
else
    color_prompt=
fi

# if we can do a color prompt, do my prompt
if [ "$color_prompt" = yes ]; then
    PS1="\[\033[38;5;46m\]\u@\H\[$(tput sgr0)\][\[$(tput sgr0)\]\[\033[38;5;51m\]\w\[$(tput sgr0)\]]\[$(tput sgr0)\]\[\033[38;5;1m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

unset color_prompt 

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
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


# include external aliases from ~/.bash_aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# just a funny thing for startup
echo "wenk wenk" | cowsay -f tux | lolcat

# PICO SDK path stuff
export PICO_SDK_PATH=/home/ben/pico/pico-sdk
export PICO_EXAMPLES_PATH=/home/ben/pico/pico-examples
export PICO_EXTRAS_PATH=/home/ben/pico/pico-extras
export PICO_PLAYGROUND_PATH=/home/ben/pico/pico-playground

# git alias to headless repo for dotfile management
alias config='/usr/bin/git --git-dir=/home/ben/.cfg --work-tree=/home/ben'


# NOTE: sourcing these filles GREATLY slows down how fast bash boots up
# Source ROS so we can actually run ROS stuff
# source /opt/ros/humble/setup.bash

# sources Xilinx so I can launch Vivado
# source /tools/Xilinx/Vivado/2019.1/settings64.sh
# make vivado work with DWM, https://support.xilinx.com/s/question/0D52E00006iHs04SAC/vivado-hangs-forever-with-white-window-during-startup-linux?language=en_US
# export _JAVA_AWT_WM_NONREPARENTING=1

# for fancy spotify theme, still figuring out
# export PATH=$PATH:/home/ben/.spicetify
