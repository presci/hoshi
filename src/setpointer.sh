#!/bin/bash


WID=`xdotool search "Edgeworld" | head -1`
xdotool windowactivate --sync $WID

source ./edge_env

sleep 2;
x=$pvp_arr_x
y=$pvp_arr_y


color=$( ./getcolor.py $x $y 3 )
echo "$color"
if [ $color -eq 0 ]
then
    echo "found color"
fi

./getcolor.py $x $y 2 && ls