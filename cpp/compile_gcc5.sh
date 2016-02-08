#!/usr/bin/env bash
#
#$ -cwd

hostname
module load gcc
g++ hello.cpp -o hello_gcc5
./hello_gcc5
