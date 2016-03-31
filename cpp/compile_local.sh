#!/usr/bin/env bash
#
#$ -cwd
#$ -l s_vmem=2G

hostname
g++ hello.cpp -o hello_local
./hello_local
