#!/bin/bash


WID=`xdotool search "Edgeworld" | head -1`
xdotool windowactivate --sync $WID



if [ -e  ./edge_env ]; then
    source ./edge_env
fi


attack









