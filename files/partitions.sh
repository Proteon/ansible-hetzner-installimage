#!/bin/bash
set -e

# Temporary solution for partitioning
# TODO: write this either in native ansible or make dynamic, somehow

sfdisk --no-reread /dev/nvme0n1 << EOF

unit: sectors

/dev/nvme0n1p1 : start=        2048, size=     2097152, type=fd
/dev/nvme0n1p2 : start=     2099200, size=   201326592, type=fd
/dev/nvme0n1p3 : start=   203425792, size=  1671959216, type=8e

EOF

# Ensure table in memory is up to date
partprobe

# Copy layout to 2nd disk
sfdisk --dump /dev/nvme0n1 | sfdisk --no-reread /dev/nvme1n1

# Ensure table is up to date again
partprobe

