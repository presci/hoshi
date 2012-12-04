#!/bin/bash


WID=`xdotool search "Edgeworld" | head -1`
xdotool windowactivate --sync $WID

source ./edge_env

sleep 2;
echo " $scout_x $scout_y"

xdotool mousemove --sync $scout_x $scout_y 
color=$( ./getcolor.py $scout_x $scout_y 0 )
echo "$scout_x $scout_y $color"
if [ $color -eq 0 ]
then
    echo "found color"

fi

