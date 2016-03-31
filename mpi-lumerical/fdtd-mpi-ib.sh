#$ -cwd
#$ -pe mpi 16
#$ -l s_vmem=2G
engine="/ad/eng/opt/64/lumerical-fdtd/bin/fdtd-engine-ompi-lcl"
datafile="paralleltest-ib.fsp"
time mpirun -np $NSLOTS "$engine" -logall "$datafile"
