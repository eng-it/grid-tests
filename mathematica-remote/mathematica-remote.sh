#!/bin/bash
# 
#$ -N mathematica-remote
#$ -cwd
#$ -l s_vmem=2G
#$ -j y

# Pass the link name as the argument to this job script at qsub time.
wolfram -subkernel -mathlink -linkprotocol TCPIP -linkmode connect -linkname $1
