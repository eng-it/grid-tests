#!/bin/bash
#$ -cwd
##$ -j y
#$ -pe openmpi 4
#$ -N mpi4py
#$ -l s_vmem=2G

mpirun -np $NSLOTS mpi4py_test.py
