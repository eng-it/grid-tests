# An example of running rllab, using our Anaconda Python installation to create
# and use a custom environment with specialized packages.  See also the
# python-anaconda examples directory.
#
# This example based on the requests in tickets INC11764998 and
# INC11994617/INC12016750.

queue ?= bme.q

example ?= trpo_gym.py

all: rllab-example
	qstat

# This wrapper scripts will call a specific rllab example Python script, with
# some workarounds for home directory access and graphics rendering.
rllab-example:
	qsub -q $(queue) $@.sh $(example)

clean:
	rm -rf rllab/
	rm -f rllab-example.{o,e,po,pe}*
	rm -f core.*
