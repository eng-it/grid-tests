# Lumerical FDTD parallel job over MPI.
#
# The simulations need fast networking (at least gigabit ethernet or ideally
# infiniband) to run faster over multiple hosts than on a single host, so this
# example assumes the user has access to bungee.q to run these sorts of jobs.
queue = "bungee.q"

all: init fdtd-mpi-eth fdtd-mpi-ib

# Get a copy of a test input file to work with, and set up kerberized SSH access
# for mpirun to use within the job.
init:
	cp -u /ad/eng/opt/64/lumerical-fdtd/examples/paralleltest.fsp paralleltest-eth.fsp
	cp -u /ad/eng/opt/64/lumerical-fdtd/examples/paralleltest.fsp paralleltest-ib.fsp
	gridtickets $(queue)
# This version contains an argument to mpirun to only use ethernet
# (no infiniband) for a speed comparison.  It throws some warnings
# due tot this in stderr.
fdtd-mpi-eth:
	qsub -q $(queue) -N fdtd-mpi-eth fdtd-mpi-eth.sh
# This version doesn't specify any network-related things so it should
# automatically use infiniband.  Compare the timed output with the ethernet
# version above.
fdtd-mpi-ib: 
	qsub -q $(queue) -N fdtd-mpi-ib fdtd-mpi-ib.sh
clean:
	rm -f *.log paralleltest-*.fsp
	rm -f fdtd-mpi-eth.{o,e,po,pe}*
	rm -f fdtd-mpi-ib.{o,e,po,pe}*
