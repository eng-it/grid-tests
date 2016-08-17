# An example of running rllab, using our Anaconda Python installation to create
# and use a custom environment with specialized packages.  See also the
# python-anaconda examples directory.
#
# This example based on the requests in tickets INC11764998 and
# INC11994617/INC12016750.

queue ?= bme.q

all: rllab-example
	qstat

rllab-example:
	qsub -q $(queue) $@.sh

clean:
	rm -rf rllab/
	rm -f rllab-example.{o,e,po,pe}*
	rm -f core.*
