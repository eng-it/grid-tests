#!/bin/bash
# 
#$ -N mathematica-remote
#$ -cwd
#$ -j y

# Pass the link name as the argument to this job script at qsub time.
wolfram -subkernel -mathlink -linkprotocol TCPIP -linkmode connect -linkname $1
