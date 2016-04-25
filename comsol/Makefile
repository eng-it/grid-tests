# http://collaborate.bu.edu/engit/Grid/BatchComsol
#
# Note that COMSOL insists on having home directory access when starting a run
# (it will crash with a cryptic segfault message otherwise) so we run
# gridtickets across a whole queue to ensure it will start appropriately.
# (TODO: would it work to override HOME for the comsol process instead?)

queue = bme.q

all:
	gridtickets $(queue)
	qsub -q $(queue) comsol-batch.sh
clean:
	rm -f comsol-batch.{o,e,po,pe}*
	rm -f hs_err_pid*.log
	rm -f core.*
	rm -f solved.mph*
