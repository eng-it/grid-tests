#!/usr/bin/env bash
#$ -cwd
#$ -l s_vmem=1G
#$ -l gpu=1
#$ -N cuda-saxpy

# A very simple CUDA example with parallel arithmetic.
# https://devblogs.nvidia.com/parallelforall/easy-introduction-cuda-c-and-c/

module load cuda

nvcc saxpy.cu -o saxpy && ./saxpy
