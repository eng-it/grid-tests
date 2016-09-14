#!/usr/bin/env python

# Modified from:
# http://nbviewer.jupyter.org/github/BVLC/caffe/blob/master/examples/00-classification.ipynb
#
# (Mainly just converting the Jupyter notebook into pure Python and customzing
# paths for our environment.  We've also already downloaded extra data using
# the external scripts.)

### 1. Setup
import os
import numpy as np
import matplotlib
import time
# We're doing this non-interactively, so we'll render to files instead of
# displaying to the screen
matplotlib.use('pdf')
import matplotlib.pyplot as plt
import caffe

# set display defaults
plt.rcParams['figure.figsize'] = (10, 10)        # large images
plt.rcParams['image.interpolation'] = 'nearest'  # don't interpolate: show square pixels
plt.rcParams['image.cmap'] = 'gray'  # use grayscale output rather than a (potentially misleading) color heatmap

# We've already copied the example files here in the "init" task in the
# Makefile (if not, run "make init").  The main, read-only Caffe files remain
# elsewhere and will be referred to with the CAFFE_ROOT environment variable.
caffe_files = './'

### 2. Load net and set up input preprocessing

caffe.set_mode_cpu()

model_def = caffe_files + 'models/bvlc_reference_caffenet/deploy.prototxt'
model_weights = caffe_files + 'models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel'

net = caffe.Net(model_def,      # defines the structure of the model
                model_weights,  # contains the trained weights
                caffe.TEST)     # use test mode (e.g., don't perform dropout)

# load the mean ImageNet image (as distributed with Caffe) for subtraction
mu = np.load(os.environ['CAFFE_ROOT'] + '/python/caffe/imagenet/ilsvrc_2012_mean.npy')
mu = mu.mean(1).mean(1)  # average over pixels to obtain the mean (BGR) pixel values
# Commenting this out since we mainly care about the classification:
#print 'mean-subtracted values:', zip('BGR', mu)

# create transformer for the input called 'data'
transformer = caffe.io.Transformer({'data': net.blobs['data'].data.shape})

transformer.set_transpose('data', (2,0,1))  # move image channels to outermost dimension
transformer.set_mean('data', mu)            # subtract the dataset-mean value in each channel
transformer.set_raw_scale('data', 255)      # rescale from [0, 1] to [0, 255]
transformer.set_channel_swap('data', (2,1,0))  # swap channels from RGB to BGR

### 3. CPU classification

# set the size of the input (we can skip this if we're happy
#  with the default; we can also change it later, e.g., for different batch sizes)
net.blobs['data'].reshape(50,        # batch size
                          3,         # 3-channel (BGR) images
                          227, 227)  # image size is 227x227

image = caffe.io.load_image(caffe_files + 'examples/images/cat.jpg')
transformed_image = transformer.preprocess('data', image)
# If you want to see the loaded image for testing:
#plt.savefig('kitty.pdf')

# copy the image data into the memory allocated for the net
net.blobs['data'].data[...] = transformed_image
### perform classification
output = net.forward()
output_prob = output['prob'][0]  # the output probability vector for the first image in the batch
print
print
print 'predicted class is:', output_prob.argmax()

# load ImageNet labels
labels_file = caffe_files + 'data/ilsvrc12/synset_words.txt'
labels = np.loadtxt(labels_file, str, delimiter='\t')
print 'output label:', labels[output_prob.argmax()]

# sort top five predictions from softmax output
top_inds = output_prob.argsort()[::-1][:5]  # reverse sort and take five largest items
print 'probabilities and labels:'
for pair in zip(output_prob[top_inds], labels[top_inds]):
    print "  %.3f: %s" % pair

### 4. Switching to GPU mode

t1 = time.time()
net.forward()
t2 = time.time()
print 'Time for CPU: %.5f' % (t2 - t1)

caffe.set_device(0) # if we have multiple GPUs, pick the first one
caffe.set_mode_gpu()
net.forward()  # run once before timing to set up memory
t1 = time.time()
net.forward()
t2 = time.time()
print 'Time for GPU: %.5f' % (t2 - t1)

### Tutorial sections not covered here:
###   5. Examining intermediate output
###   6. Try your own image
