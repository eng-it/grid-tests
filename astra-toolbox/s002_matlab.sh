#!/usr/bin/env bash
#$ -cwd
#$ -l s_vmem=8G
#$ -N astra-s002-matlab

# Name of the sample to run
script="s002_data2d"

module load astra-toolbox

# Get Astra's sample file and patch it for non-interactive use
cp -f $ASTRA_ROOT/samples/matlab/$script.m .
patch --quiet --batch < $script.m.patch

# Run the example within matlab.  Note the home directory being set to an
# alternate location here, as home directories aren't normally readable in our
# grid jobs.
# The astra-toolbox module loaded above will have also loaded a matlab module.
# This will ensure that the matlab call here points to the right version for
# compatibility with Astra, so we don't have to specify a version manually.
export HOME=/mnt/nokrb/$USER
matlab -nodesktop -nosplash -r "$script; exit"
echo
echo "All done!"
