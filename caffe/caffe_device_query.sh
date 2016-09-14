#!/usr/bin/env bash

#$ -cwd
#$ -l s_vmem=2G
#$ -j y
#$ -N caffe_device_query

module load caffe

hostname
caffe device_query -gpu all
