# Tests a basic compiled MPI job, using OpenMPI's mpicc and tight integration
# with Grid Engine.

queue = debug.q

all: init compile_and_run
	qstat
init:
	gridtickets $(queue)
compile_and_run:
	qsub -q $(queue) compile_and_run.sh
clean:
	rm -f mpi_c_test.{o,e,po,pe}* basictest
