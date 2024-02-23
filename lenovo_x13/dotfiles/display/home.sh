#!/bin/bash

xrandr --output eDP --mode 1920x1080 --pos 0x540 --scale 1x1 --output HDMI-A-0 --pos 1920x0 --scale 0.75x0.75 --rotate normal --mode 3840x2160 --output DisplayPort-0 --mode 2560x1440 --pos 1920x1620 --scale 1x1 --rotate normal

~/display/trayer.sh
