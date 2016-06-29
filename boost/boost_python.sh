#!/usr/bin/env bash
#$ -cwd
#$ -l s_vmem=2G
#$ -j y
#$ -N boost_python

# Load the GCC tools, Boost, and Anaconda Python
module load gnu-build-system
module load boost
module load anaconda

# Warnings during compilation saying "NOTE: Use of this header (ice_or.hpp) is
# deprecated" are from a harmless Boost bug that should be fixed in versions
# newer than 1.60.  Those can be ignored for now.
# https://github.com/boostorg/python/issues/63

# Manual method
g++ -w -fPIC -c boost_python_hello.cpp -o boost_python_hello.o
g++ -shared boost_python_hello.o -lboost_python -lpython2.7 -o hello.so

# Pythonic method.  Currently this only works for interactive logins, because
# distutils detects the Python libraries as being in a path only accessible
# with kerberos tickets.  Ideally it would automatically generate compiler
# commands to link to files in /ad/eng/opt, though, so we should fix this at
# some point.
# The distutils-based example is largely from:
# https://en.wikibooks.org/wiki/Python_Programming/Extending_with_C%2B%2B
#
#python boost_python_setup.py build 
#cd build/lib.linux-x86_64-2.7

python -c 'import hello; print hello.greet()'
