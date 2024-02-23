#!/bin/bash

# On screen layout change, it is necessary to restart trayer, because it does
# not move, even if layout changes out from under it.
killall -u kressler trayer

# SetPartialStrut false to prevent gap at bottom of screen.
# Offset based on bottom to work both single and dual headed. Assumes that
# laptop screen is lower, and 768 pixels high.
trayer --edge bottom --align right --SetDockType true --SetPartialStrut false --expand true --width 5 --height 17 --transparent true --tint 0x0 --distance -1063 --distancefrom bottom &
