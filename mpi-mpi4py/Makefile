# Test Python MPI with mpi4py and Anaconda Python.
# Note the Ananconda path in the first line of mpi4py_test.py.

queue = bme.q

all: init mpi4py
	qstat
init:
	gridtickets $(queue)
mpi4py:
	qsub -q $(queue) mpi4py_test.sh
clean:
	rm -rf mpi4py.{o,e,po,pe}* 
