#!/bin/bash


WID=`xdotool search "Mozilla Firefox" | head -1`
xdotool windowactivate --sync $WID


if [ -e  ./edge_env ]; then
    source ./edge_env
fi

xdotool mousemove --sync $faction_init_x $faction_init_y 
