#!/usr/bin/env bash

#$ -cwd
#$ -j y
##$ -l gpu=1
##$ -l s_vmem=2G
#$ -N caffe_classification

hostname
date

module load caffe
module load anaconda
python caffe_classification.py
