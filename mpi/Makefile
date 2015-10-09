# Tests for a basic MPI job, run with loose and tight SGE integration.
# These test should ensure that the MPI environment itself is working correctly
# for OpenMPI with SGE integration.

queue = bme.q

all: init loose tight
	qstat

# We need to copy kerberos credentials to all nodes that might be contacted as
# part of the job (i.e., the whole queue) so that the MPI master can log in on
# each worker node.  Right now the implementation is kerberized SSH using the
# copied credentials from the master node.  The old method was SSH public key
# authentication, with the credentials needed on each worker to allow sshd to
# access the authorized_keys.  Either way needs the same step here, though.
init:
	gridtickets $(queue)

# Submit script as a regular grid job, and then that job starts up workers
# directly using MPI.  Uses static lists of hosts for a few test queues.
# (Don't actually do it this way, though; use tight integration with an SGE
# parallel environment like the next example.)
loose:
	cp -f $(queue).txt hostfile.txt
	qsub -q $(queue) loose-integration-test.sh
# Submit script as a parallel job, using one of the grid's parallel environments.
# Grid chooses workers for the job automatically.
tight:
	qsub -q $(queue) tight-integration-test.sh
# Remove all stdout/stderr files for all test cases.
clean:
	rm -f  *.{o,e,po,pe}*

### OpenMPI mpirun arguments:
# -v                                Verbose mode enabled
# --mca ras_gridengine_debug 100    SGE integration debug verbosity
# --mca ras_gridengine_verbose 100  SGE integration main verbosity
# --mca orte_base_help_aggregate 0  Aggregate duplicate help messages?
