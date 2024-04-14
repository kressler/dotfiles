#!/bin/bash

#xrandr --output eDP --mode 1920x1080 --pos 0x540 --scale 1x1 --output HDMI-A-0 --pos 1920x0 --scale 0.75x0.75 --rotate normal --mode 3840x2160 --output DisplayPort-0 --mode 2560x1440 --pos 1920x1620 --scale 1x1 --rotate normal
xrandr --output eDP --mode 1920x1080 --pos 1920x2160 --scale 1x1 --output HDMI-A-0 --pos 3840x540 --scale 0.75x0.75 --rotate normal --mode 3840x2160 --output DisplayPort-4 --mode 2560x1440 --pos 3840x2160 --scale 1x1 --rotate normal --output DisplayPort-2 --mode 3840x2160 --pos 0x0 --scale 1x1 --rotate normal
if [ $? -ne 0 ] ; then
xrandr --output eDP --mode 1920x1080 --pos 1920x2160 --scale 1x1 --output HDMI-A-0 --pos 3840x540 --scale 0.75x0.75 --rotate normal --mode 3840x2160 --output DisplayPort-6 --mode 2560x1440 --pos 3840x2160 --scale 1x1 --rotate normal --output DisplayPort-3 --mode 3840x2160 --pos 0x0 --scale 1x1 --rotate normal
fi


#~/display/trayer.sh
