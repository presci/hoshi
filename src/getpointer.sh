#!/bin/bash


WID=`xdotool search "Edgeworld" | head -1`
xdotool windowactivate --sync $WID


# get initial mouse location
INIT_X=$(xdotool getmouselocation | cut -d " " -f 1 | cut -d ":" -f 2)
INIT_Y=$(xdotool getmouselocation | cut -d " " -f 2 | cut -d ":" -f 2)

echo "$INIT_X : $INIT_Y"
COLOR=$( ./getcolor.py $INIT_X $INIT_Y 2 )

echo "color is $COLOR"
