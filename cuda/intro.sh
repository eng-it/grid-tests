#!/usr/bin/env bash
#$ -cwd
#$ -l s_vmem=512M
#$ -l gpu=1
#$ -N cuda-intro

# Just a bunch of checks on available features and versions

module load cuda

echo "### NVIDIA CUDA compiler version:"
nvcc --version
echo
echo "### GCC compiler verison:"
gcc --version
echo "### nvidia kernel drivers:"
lsmod | grep ^nvidia | cut -f 1 -d ' '
echo
echo "### nvidia-smi -L results:"
nvidia-smi -L
