#!/bin/bash

# Remove logical volumes and volume groups
my_vgs=$(vgs --noheadings --options vg_name)

# Cleanly exit if there are no volume groups
[ -z "$my_vgs" ] && exit

for vg in "${my_vgs[@]}"; do
    vgremove --yes "$vg"
done

# Remove 'physical' volumes
my_pvs=$(pvs --noheadings | awk '{ print $1 }')

for pv in "${my_pvs[@]}"; do
    pvremove "$pv"
done

