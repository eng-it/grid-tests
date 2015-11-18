#!/bin/bash
#$ -cwd
##$ -j y
#$ -pe openmpi 4
#$ -N mpi4py

mpirun -np $NSLOTS mpi4py_test.py
