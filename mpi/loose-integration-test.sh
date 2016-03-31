#!/bin/bash
# 
#$ -cwd
# Since we're not using a parallel environment the grid won't know to allocate
# this much RAM per actual CPU used, so as mentioned in the Makefile, tight MPI
# integration is much better.
#$ -l s_vmem=1G

# Note that NSLOTS should be higher than the number of cores on a given node in
# this queue, with hostfile.txt having enough hosts total, to ensure we're
# testing communication between as well as within the nodes.
NSLOTS=8

echo "Host running job script: $(hostname -f)"
mpirun -v -np $NSLOTS --hostfile hostfile.txt mpitask.sh
