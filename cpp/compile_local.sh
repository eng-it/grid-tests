#!/usr/bin/env bash
#
#$ -cwd

hostname
g++ hello.cpp -o hello_local
./hello_local
