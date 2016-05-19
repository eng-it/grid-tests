#!/usr/bin/env bash
#$ -cwd
#$ -l s_vmem=2G
#$ -l gpu=1
#$ -N cuda-bandwidthTest

# An NVIDIA-provided CUDA example that reports device bandwidth

module load cuda

nvcc -I$CUDA_PATH/samples/common/inc/ \
     $CUDA_PATH/samples/1_Utilities/bandwidthTest/bandwidthTest.cu \
     -o bandwidthTest \
     && ./bandwidthTest
