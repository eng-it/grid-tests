#!/bin/bash
# 
#$ -S /bin/bash
#$ -cwd

# Note that NSLOTS should be higher than the number of cores on a given node in
# this queue, with hostfile.txt having enough hosts total, to ensure we're
# testing communication between as well as within the nodes.
NSLOTS=8

echo "Host running job script: $(hostname -f)"
mpirun -v -np $NSLOTS --hostfile hostfile.txt mpitask.sh
