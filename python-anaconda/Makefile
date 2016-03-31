# Test a Python script using our custom Anaconda Python installation.
#
# A few options for using a custom Python environment:
# 1) qsub a wrapper shell script that calls the Python script
# 2) qsub the python script directly, using qsub's binary option
#
# Either way we need to specify a valid login shell that will load our
# environment settings so the python call (with the wrapper script method) or
# the first line of the python script (the direct method) knows where to find
# the installation of Anaconda.  /bin/bash will do the trick.  With the wrapper
# script we can embed those options inside the script itself instead of adding
# extra qsub arguments.
#
# The Python script here uses matplotlib to graph some arbitrary data in 3D and
# and saves it to an SVG file.  Enter "display contour.svg" to view the plot.

queue ?= bme.q

all: python-anaconda-direct
	qstat
python-anaconda-direct:
	qsub -q $(queue) -j y -l s_vmem=1G -cwd -b y -N python-anaconda-direct ./python-anaconda-test.py
python-anaconda-wrapper:
	qsub -q $(queue) -j y -l s_vmem=1G python-anaconda-test.sh
clean:
	rm -f python-anaconda-direct.{o,e,po,pe}*
	rm -f python-anaconda.{o,e,po,pe}*
	rm -f contour.svg
