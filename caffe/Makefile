# Examples for the Caffe Deep Learning Framework.
#
# https://docs.google.com/presentation/d/1UeKXVgRvvxg9OUdh_UiC5G71UMscNPlvArsWER41PsU/edit#slide=id.gc2fcdcce7_216_0
# https://github.com/BVLC/caffe/wiki/Model-Zoo
#
# See also:
# http://karpathy.github.io/neuralnets/


CAFFE_FILES ?= /ad/eng/opt/64/caffe/caffe-files

# The "mode" setting will allow selection of CPU or GPU computation for
# training and fine-tuning tasks. NOTE: for GPU use, CUDA compute capability
# 2.0 or greater is needed (so no budge.q).
queue = gpu.q
mode = CPU

# This will copy over all the Caffe examples and associated data to read/write
# versions here.  These include setup scripts that, for the examples we've
# worked through, should already have been run to set up any necessary files.
# The model files are provided as-is from Caffe, so any customizations (like
# solver_mode set to CPU versus GPU) would need to be done after this copy
# operation.
init:
	cp -ur $(CAFFE_FILES)/* .

# These examples are roughly what is found on this web page, with modifications
# for what's actually in the latest version's example files.
# http://caffe.berkeleyvision.org/tutorial/interfaces.html

# Device Query:   List GPU details, if any GPU hardware is present.
# Training:       LeNet classification on MNIST handwriting data
# Fine-tuning:    Flickr
# Classification: Image recognition with ImageNet
ALL = caffe_device_query caffe_training caffe_tuning caffe_classification
.PHONY: $(ALL)
all: init caffe_classification
#all: init $(ALL)
	qstat
$(ALL):
	qsub -q $(queue) $@.sh $(mode)

clean:
	rm -f *.{o,e,po,pe}*
	rm -f core.*
