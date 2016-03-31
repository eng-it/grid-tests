#$ -cwd
#$ -N mpi_c_test
#$ -pe openmpi 4
#$ -j y 
#$ -l s_vmem=1G

echo "Host running job script: $(hostname -f)"
mpicc basictest.c -o basictest
mpirun -v -np $NSLOTS basictest
