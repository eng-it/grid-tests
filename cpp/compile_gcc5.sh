#!/usr/bin/env bash
#
#$ -cwd
#$ -l s_vmem=2G

hostname
module load gcc
g++ hello.cpp -o hello_gcc5
./hello_gcc5
