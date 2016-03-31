# http://collaborate.bu.edu/engit/Grid/MemoryRequirements
#
# Examples to show how memory resource requests and limits work for grid jobs.
# Note that nothing will completely prevent an out-of-memory situation on a node
# since the load at any given moment is unpredictable and not entirely under
# Grid Engine's control.
#
# The soft limits (s_*) will cause the OS to notify the process when reached
# but allow it to keep running, while the hard limits (h_*) will cause the OS
# to kill the process when reached.
# 
# If we have a memory parameter set to be "requestable and consumable", AND
# the paramter's quantity is defined for a particular host, grid engine will
# track the reserved amount for that host.  See kamil-kisiel's notes here:
#
# http://serverfault.com/questions/241813/sun-grid-engine-set-memory-requirements-per-jobs
#
# Note that in the case of having the above paremters set, but no default value
# defined and none given at runtime, NO memory will be allocated.  So we must
# have a default if using this feature.
#
# Side note:  filesystems stored in RAM (like /dev/shm via tmpfs) do NOT behave
# as you might expect for memory limits; they instead work via filesystem limits
# and will give a "no space left on device" error instead.
#
# See also:
# http://www.linuxdevcenter.com/pub/a/linux/2006/11/30/linux-out-of-memory.html

queue ?= "budge.q"
host_at_queue ?= "budge.q@budge01"
mem_requirement = 1G
mem_soft_limit = 18G
mem_hard_limit = 20G

all: mem_overage
	qstat

# Note that none of the resources actually change here, since we just specified
# that an amount of RAM needs to be *free* when the job starts or is a maximum
# that is allowed to be used, not that it will be *reserved*.
mem_free:
	qstat -F -q $(host_at_queue) | egrep 'mem|virtual|swap'
	@echo
	qsub -N $@ -q $(host_at_queue) -l mem_free=$(mem_requirement) -cwd -j y -b y ./use_ram.py 512

# Here for hosts that have s_vmem defined in "qconf -me hostname" we'll see the
# s_vmem listed decrease once this job starts running (so probably not yet,
# right after running qsub, but a few seconds after, if it starts up by then.)
# If we try to submit more jobs with memory requirements the grid will do the
# bookkeeping to make sure it isn't oversubscribing RAM on that host.  For
# exmaple with 24GB total and 18GB requested by the first job, only 6GB is left
# for the second: less than the requested 18G.  The second will wait until the
# first is finished before starting.
# So long as memory usage stays below the limits, none of this has any relation
# to the actual amount of memory used by the job (512 MB each in this case).
mem_soft_limit:
	qstat -F -q $(host_at_queue) | egrep 'mem|virtual|swap'
	@echo
	qsub -N $@ -q $(host_at_queue) -l s_vmem=$(mem_soft_limit) -cwd -j y -b y ./use_ram.py 512
	@echo
	qsub -N $@ -q $(host_at_queue) -l s_vmem=$(mem_soft_limit) -cwd -j y -b y ./use_ram.py 512

# In this case grid engine will kill the job when it hits the limit even though
# the job will try to use 2GB total.  The job will start even if not much RAM is
# available since we didn't specify mem_free, though if the usage is due to
# other grid jobs it should be accounted for properly.  With this example the
# soft limit will cause the job to stop itself, but if a process was completely
# unresponsive to the signals from the OS, the hard limit would cause the OS to
# forcibly kill the process.
mem_overage:
	qsub -q $(host_at_queue) \
		-N $@ \
		-l s_vmem=1G \
		-l h_vmem=4G \
		-cwd -j y -b y ./use_ram.py 2048


# Example of how this works with parallel jobs.  If I set a limit of 1G, but
# request 2 slots with a parallel environment, it gives me the limit on a
# per-slot basis, not per-job.  In this case with two slots on one host, this
# effectively doubles the total reservation for both hard and soft limits.  This
# is OK accounting-wise because the total h_vmem will still be tracked
# accordingly.
mem_parallel:
	qsub -q $(host_at_queue) \
                -pe mpi 2 \
		-N $@ \
		-l s_vmem=1G \
		-l h_vmem=4G \
		-cwd -j y -b y ./use_ram.py 2048

# And what about parallelization across hosts?  It just allocates s_vmem from
# two different hosts, using 1 GB from each.  So in either case users of any
# parallel environments should just speicfy how much RAM they'll need per slot,
# and the grid will do the rest.
mem_parallel_across:
	qsub -q $(queue) \
                -pe openmpi 2 \
		-N $@ \
		-l s_vmem=1G \
		-l h_vmem=4G \
		-cwd -j y -b y ./use_ram.py 2048

clean:
	rm -f mem_*.{o,po}*
