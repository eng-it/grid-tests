#!/usr/bin/env bash
#$ -cwd
#$ -l s_vmem=2G
#$ -j y
#$ -N boost_simple

module load boost
module load gnu-build-system

g++ boost_simple.cpp -o boost_simple

# Multiply each integer by 3 and write result to stdout.
echo -e "1 5 7" | ./boost_simple
echo
