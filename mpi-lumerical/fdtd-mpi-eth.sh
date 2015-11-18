#$ -cwd
#$ -pe mpi 16
engine="/ad/eng/opt/64/lumerical-fdtd/bin/fdtd-engine-ompi-lcl"
datafile="paralleltest-eth.fsp"
time mpirun --mca btl_tcp_if_include eth0 -np $NSLOTS "$engine" -logall "$datafile"
