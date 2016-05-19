# Some simple examples and tests of running CUDA code on GPUs.
#
# These examples require access to a queue with CUDA-capable GPU cards:
# http://collaborate.bu.edu/engit/Grid/GridGPU
#
# Note in each job script there are special directives like "#$ -l gpu=1" to
# reserve a GPU for use.  Even though jobs will run without this, it should be
# included to ensure the grid can properly track and allocate GPUs for running
# jobs.
#
# More on CUDA:
#   https://developer.nvidia.com/cuda-zone
#   https://developer.nvidia.com/how-to-cuda-c-cpp
#   http://docs.nvidia.com/cuda/
#   http://developer.download.nvidia.com/compute/cuda/6_0/rel/docs/CUDA_Getting_Started_Linux.pdf

queue = budge.q

# intro:         Just report on software and feature versions
# deviceQuery:   NVIDIA example CUDA program for reporting device details
# bandwidthTest: NVIDIA example CUDA program for reporting device bandwidth
# saxpy:         A very simple compiled CUDA example, written in C
ALL = intro deviceQuery bandwidthTest saxpy
all: $(ALL)
$(ALL):
	qsub -q $(queue) $@.sh

clean:
	rm -f *.{o,e,po,pe}*
	rm -f core.*
	rm -f $(ALL)
