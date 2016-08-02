#!/usr/bin/env bash
#$ -cwd
#$ -l s_vmem=8G
#$ -N astra-s002-python

# Name of the sample to run
script="s002_data2d"

module load astra-toolbox

# Get Astra's sample file and patch it for non-interactive use
cp -f $ASTRA_ROOT/samples/python/$script.py .
patch --quiet --batch < $script.py.patch
# The Python version of this example also requires an existing data file
cp -u $ASTRA_ROOT/samples/python/phantom.mat .

# Run the example within Python.
python "./$script.py"
