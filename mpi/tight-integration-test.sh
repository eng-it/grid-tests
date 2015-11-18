#!/usr/bin/env bash
# 
#$ -cwd
#$ -pe openmpi 8

echo "Host running job script: $(hostname -f)"
mpirun -v -np $NSLOTS mpitask.sh
