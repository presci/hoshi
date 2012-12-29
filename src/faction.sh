#!/bin/bash


WID=`xdotool search "" | head -1`
xdotool windowactivate --sync $WID
sleep 10

source ./config

FACTION=$(( 0 + 0 ))
WARP=$(( 0 + 0 ))
PVP=$(( 1 + 0 ))

PVP_SELECT=$(( 0 + 0 ))

factionmove(){

    xdotool mousemove --sync $faction_sel_x $faction_sel_y && xdotool click 1
    sleep 2
    relative_x=$((  180 + 0 ))
    relative_y=$(( $faction_rel_y  * $FACTION  ))
    xdotool mousemove --sync $faction_init_x $faction_init_y 

    if [ $FACTION -eq 0 ] 
    then
	xdotool mousemove --sync $faction_init_x $faction_init_y  && xdotool click 1
    elif [ $FACTION -gt 0 ] 
    then
	xdotool mousemove_relative --sync  --polar $relative_x $relative_y  && xdotool click 1
    fi
    sleep 5;
    FACTION=$(( $FACTION + 1 ))

    if [ $FACTION -gt 7 ]
    then
	FACTION=$(( 0 + 0 ))
    fi
}


inc_warp_gate(){
WARP=$(( $WARP + 1 ))
if [[ $WARP -gt $WARP_CFG ]];
then
    WARP=$(( 0 + 0 ))
fi
}





while :
do
stime=$(date '+%s')

if [ -e  ./edge_env ]; then
    source ./edge_env
fi

gohome

## moving between faction

printf "Warp %03d\n" $WARP
if [ $WARP -eq 0 ]
then
    if [ -e "/home/prasad/edgeworld/pvp" ]
    then
	lockdownlatch=0
	PVP=$(( 0 + 0 ))
    else
	PVP=$(( 0 + 1 ))
    fi
fi


case $WARP in
    0|1|2)
	if [ $PVP -eq 0 ]
	then
	    pvp_select $PVP_SELECT
	    sleep 2;
	    pvp_attack $attack_a_x $attack_a_y $WARP
	    result=$?
	    if [ $result -eq 1 ] 
	    then
		inc_warp_gate
		continue
	    fi
	else
	    faction_select
	    factionmove
	    xdotool mousemove --sync $attack_a_x $attack_a_y  && xdotool click 1
	fi
;;
    3|4|5)
	if [ $PVP -eq 0 ]
	then
	    pvp_select $PVP_SELECT
	    pvp_attack $attack_b_x $attack_b_y $WARP
	    result=$?
	    if [ $result -eq 1 ] 
	    then
		inc_warp_gate
		continue
	    fi
	else
	    faction_select
	    factionmove
	    xdotool mousemove --sync $attack_b_x $attack_b_y  && xdotool click 1
	fi

;;
    6|7|8)
	faction_select
	factionmove
	moveA1
	xdotool mousemove --sync $attack_a_x $attack_a_y  && xdotool click 1
;;
    9|10|11) 
	factionmove
	moveA1
	xdotool mousemove --sync $attack_b_x $attack_b_y  && xdotool click 1
;;
esac
sleep 4;

case $WARP in
    0|1|2|3|4|5)
	attack 
	doend

;;
    6|7|8|9|10|11)
	attack_a1
	doend
;;
esac

WARP=$(( $WARP + 1 ))
if [[ $WARP -gt $WARP_CFG ]];
then
WARP=$(( 0 + 0 ))
fi

PVP_SELECT=$(( $PVP_SELECT + 1 ))
if [[ $PVP_SELECT -gt $PVP_SELECT_CFG ]];
then
PVP_SELECT=$(( 0 + 0 ))
fi


## time lapse calculator
etime=$(date '+%s')
if [[ -z "$stime" ]]; then 
stime=$etime
fi
dt=$((etime - stime))
ds=$((dt % 60))
dm=$(((dt / 60) % 60))
dh=$((dt / 3600))
printf 'Time elapsed : %d:%02d:%02d\n' $dh $dm $ds

done






