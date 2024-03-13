#!/bin/bash

# see ~/.config/suckless/dwmblocks-async
# FIXME: scripts aren't sourced by this point, for now I have a hack in
# ~/.bashrc, which adds scripts to path BEFORE the check for interactive
# terminal, but this should really be fixed, I think it slows down things like
# calling scripts such as volume
dwmblocks &

# configure resolution settings
xrandr -s 1920x1080 &

# wallpaper selector
nitrogen --set-zoom-fill --random &

# compositor, how windows look
picom --experimental-backends &

# notifications
dunst &

