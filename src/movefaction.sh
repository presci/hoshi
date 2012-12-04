#!/bin/bash


WID=`xdotool search "Edgeworld" | head -1`
xdotool windowactivate --sync $WID

FACTION=$(( 0 + 0 ))



WARP=$(( 0 + 0 ))

while :
do

if [ -e  ./edge_env ]; then
    source ./edge_env
fi




dt=`date`
echo "Starting simulation $dt"


gohome

## moving between faction

relative_x=$((  180 + 0 ))
relative_y=$(( $faction_rel_y  * $FACTION  ))
xdotool mousemove --sync $faction_init_x $faction_init_y 

if [ $FACTION -eq 0 ] 
then
    xdotool mousemove --sync $faction_init_x $faction_init_y ## && xdotool click 1
elif [ $FACTION -gt 0 ] 
then
    xdotool mousemove_relative --sync  --polar $relative_x $relative_y  ## && xdotool click 1
fi
sleep 3;
FACTION=$(( $FACTION + 1 ))

if [ $FACTION -gt 7 ]
then
FACTION=$(( 0 + 0 ))
fi



done






