#!/usr/bin/env bash
#
#$ -cwd
#$ -l s_vmem=2G

hostname
module load gcc
g++ -std=c++14 hello.cpp -o hello_gcc5_v14
./hello_gcc5_v14
