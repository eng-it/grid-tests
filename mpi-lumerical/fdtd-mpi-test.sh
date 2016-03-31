# A very basic test that uses a Lumerical binary that estimates the value of Pi.
# This will not specify the network device to use, so if InfiniBand is present
# and working, it should be used automatically.
#
#$ -cwd
#$ -pe mpi 4
#$ -l s_vmem=2G
hostname
date
engine="/ad/eng/opt/64/lumerical/mpitest/cpi-ompi-lcl"
mpirun -np $NSLOTS "$engine"
