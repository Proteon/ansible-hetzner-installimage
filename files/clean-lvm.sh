#!/bin/bash

# Remove logical volumes and volume groups
readarray -t my_vgs < <(
    vgs --noheadings --options vg_name --reportformat json | jq ".report[0].vg[].vg_name" | sed 's/"//g'
)

# Cleanly exit if there are no volume groups
[ -z "$my_vgs" ] && exit

for vg in "${my_vgs[@]}"; do
    vgremove --yes "$vg"
done

# Remove 'physical' volumes
readarray -t my_pvs < <(pvs --noheadings | awk '{ print $1 }')

for pv in "${my_pvs[@]}"; do
    pvremove "$pv"
done

