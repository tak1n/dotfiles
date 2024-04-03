#!/bin/sh
# Times the screen off and puts it to background
swayidle \
    timeout 10 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' &
# Locks the screen immediately
swaylock --clock --indicator --screenshots --effect-scale 0.4 --effect-vignette 0.2:0.5 --effect-blur 4x2 --datestr "%a %e.%m.%Y" --timestr "%k:%M" --ring-color bd93f9ff --key-hl-color f8f8f2ff --line-color f8f8f2ff --inside-color 282a36dd --separator-color f8f8f2ff --text-color f8f8f2ff --ring-wrong-color f38ba8 --inside-wrong-color f38ba8 --ring-ver-color 89b4fa --inside-ver-color 89b4fa --ring-clear-color f9e2af --inside-clear-color f9e2af
# Kills last background task so idle timer doesn't keep running
kill %%
