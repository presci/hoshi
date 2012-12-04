#!/bin/bash


WID=`xdotool search "Mozilla Firefox" | head -1`
## xdotool windowactivate --sync $WID

K=$(( 0 + 0 ))

while :
do

if [ -e  ./edge_env ]; then
    source ./edge_env
fi



xdotool windowactivate --sync $WID
dt=`date`
echo "Starting simulation $dt"
echo "MOving to Replay button 304, 562"
## move to replay button and click
xdotool mousemove 304 562 && xdotool click 1
sleep 6;


TMP_BOOST_TIMEOUT=$(( $boost_timeout + 0 ))
if [ $K -gt  $TMP_BOOST_TIMEOUT ]; then
echo "Select the boost -- $dt"
xdotool mousemove 430 203 && xdotool click 1 
K=$(( 0 + 0 ))
sleep 4;
fi



FIGHT_X=$(( 797 + 0 ))
FIGHT_Y=$(( 647 + 0 ))

echo "MOving to fight button $FIGHT_X : $FIGHT_Y"
## Move to fight button
xdotool mousemove $FIGHT_X $FIGHT_Y && xdotool click 1

sleep 3m ; echo "Sleeping for 3 mins"



## check if we leveled up
echo "Check if lvl up"
LVLUP_X=$(( 707 + 0 ))
LVLUP_Y=$(( 445 - 0 ))
xdotool mousemove $LVLUP_X $LVLUP_Y && xdotool click 1
sleep 5;

echo "Cancel the publish to plus"
## Cancel button
CANCEL_X=$(( 537 + 0 ))
CANCEL_Y=$(( 434 - 0 ))
xdotool mousemove $CANCEL_X $CANCEL_Y && xdotool click 1
sleep 5;

K=$(( $K + 1 ))
done
