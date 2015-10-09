#!/usr/bin/env bash
# 
#$ -S /bin/bash
#$ -cwd
#$ -pe openmpi 8
# TODO how does the use of -V affect MPI jobs?
##$ -V

echo "Host running job script: $(hostname -f)"
#ssh-add -l 2>&1
#klist 2>&1
#ls /tmp/krb5cc_88678* 2>&1
#echo $LD_LIBRARY_PATH
#date
#source $SGE_ROOT/util/dl.sh
#dl 10
#strace -f -s 2000 mpirun -v --mca ras_gridengine_debug 100 --mca ras_gridengine_verbose 100 --mca orte_base_help_aggregate 0 -np $NSLOTS mpitask.sh
mpirun -v -np $NSLOTS mpitask.sh
