#!/usr/bin/env bash

#$ -cwd
#$ -j y
##$ -l gpu=1
##$ -l s_vmem=6G
#$ -N caffe_training

# For full background information see:
#  * http://caffe.berkeleyvision.org/gathered/examples/mnist.html
#  * ./examples/mnist/readme.md
#  * http://sites.duke.edu/rachelmemo/2015/04/03/train-and-test-lenet-on-your-own-dataset/

# Default to CPU mode unless "GPU" was specified
MODE=${1:-CPU}

hostname
date

module load caffe

# (We should already have run create_mnist.sh for the example data, and then
# copied the data here for use.  Attempts to run create_mnist.sh on /mnt/nokrb
# will fail due to file locking limitations on NFS.)

# Set the solver mode for this example
sed -i "s/^solver_mode: .*$/solver_mode: $MODE/" examples/mnist/lenet_solver.prototxt 

### File locking problem:
#
# Training task fails if the data sources defined in this file exist on NFS:
# examples/mnist/lenet_train_test.prototxt
# If we move those data files onto local disk it works, but, how should we be
# doing this?

echo
echo "Training model"
echo
caffe train -solver examples/mnist/lenet_solver.prototxt

echo
echo "Testing trained model"
echo
caffe test -model examples/mnist/lenet_train_test.prototxt -weights examples/mnist/lenet_iter_10000.caffemodel

# ...? how do I see the results of all this training and testing?  Shouldn't
# there be some OCR capability we can show off with now?
#
# It doesn't sound like there's any off-the-shelf way provided to do a full,
# visual example.  Others code their own to make use of the already trained and
# tested model.
# https://clearsite.io/blog/2016/01/24/using-caffe-in-a-flask-application/
# 
# Ahh here we go!
# https://github.com/BVLC/caffe/wiki/Using-a-Trained-Network:-Deploy
# That still uses code for the deployment, but just a tiny bit of matlab.

echo
echo "Done."
