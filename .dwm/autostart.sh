#!/bin/bash

# configure resolution settings
xrandr -s 1920x1080 &
# wallpaper selector
nitrogen --set-zoom-fill --random &
# compositor, how do windows look
picom --experimental-backends &
dwmblocks &
# notifications
dunst &

