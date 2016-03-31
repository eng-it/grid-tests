#!/usr/bin/env bash
# 
#$ -cwd
#$ -pe openmpi 8
#$ -l s_vmem=1G

echo "Host running job script: $(hostname -f)"
mpirun -v -np $NSLOTS mpitask.sh
