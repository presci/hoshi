#!/bin/bash
WID=`xdotool search "Edgeworld" | head -1`
xdotool windowactivate --sync $WID

source ./edge_env


pvp_select 2