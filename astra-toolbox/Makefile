# Examples using the Astra Tomography Toolbox
# http://collaborate.bu.edu/engit/Grid/Astra
#
# Since a GPU resource is requested in the job scripts that need it, a queue
# isn't specificed explicitly here, but access to a GPU-capable queue is
# required to run those examples.
#
# For related grid examples see these other directories:
#  - cuda
#  - matlab
#  - python-anaconda

# Astra has a numbered list of samples written in both MATLAB and Python.  We
# just adapt those same samples for the examples given here.
#
# NOTE: the s001 samples are not running reliably in batch jobs (producing
# output images on some hosts but crashing on others), but they do run under
# qlogin sessions.  Other samples run as expected.
ALL = s001_matlab \
      s001_python \
      s002_matlab \
      s002_python

all: $(ALL)
	qstat

$(ALL):
	qsub $@.sh

clean:
	rm -f *.{o,e,po,pe}*
	rm -f core.*
	rm -f s001_sinogram_par2d.{m,py}
	rm -f s002_data2d.{m,py}
	rm -f *.mat
	rm -f *.{png,svg}
