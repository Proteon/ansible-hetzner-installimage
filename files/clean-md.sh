#!/bin/bash

# Stop and remove arrays
my_mds=$(find /dev -type b -name 'md*')

# Cleanly exit if there are no active arrays
[ -z "$my_mds" ] && exit

for md in "${my_mds[@]}"; do
    mdadm --stop "$md"
done

# TODO: zero the superblocks for every device that had arrays.
# mdadm --zero-superblock /dev/sdX --force

