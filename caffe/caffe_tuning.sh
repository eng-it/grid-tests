#!/usr/bin/env bash

#$ -cwd
#$ -j y
##$ -l gpu=1
##$ -l s_vmem=2G
#$ -N caffe_tuning

# Default to CPU mode unless "GPU" was specified
MODE=${1:-CPU}

module load caffe

hostname
date

### This one DOES seem OK as far as file locking goes.  Why?
### ... but fails with GPU mode??

# Fetch files needed
# Not all grid nodes can reach the internet by default.  The bu-webproxy module
# will define environment variables for an FTP/HTTP/HTTPS proxy.
module load bu-webproxy
python examples/finetune_flickr_style/assemble_data.py --workers=1 --images=500 --seed 831486
data/ilsvrc12/get_ilsvrc_aux.sh
scripts/download_model_binary.py models/bvlc_reference_caffenet

# Set the solver mode for this example
sed -i "s/^#*solver_mode: .*$/solver_mode: $MODE/" models/finetune_flickr_style/solver.prototxt

# Train
caffe train -solver models/finetune_flickr_style/solver.prototxt -weights models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel
