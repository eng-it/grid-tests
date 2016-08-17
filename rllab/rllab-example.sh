#!/usr/bin/env bash
#$ -N rllab-example
#$ -cwd
#$ -j y
#$ -l s_vmem=10G

# Anaconda will try to access our home directory to manage configurations
# (separately from the location of an environment directory itself), and
# doesn't seem to have any specific option for changing this behavior.  This
# won't work in a batch job.  So, we'll manually change our home directory to
# our nokrb directory for any Anaconda-related tasks here, in addition to
# installing our custom environment there.
NOKRB=/mnt/nokrb/$USER
export HOME=$NOKRB
# From this point on the procedure should be the same for either
# interactive-only installs to the actual home directory, or workaround
# installs to /mnt/nokrb/$USER as described above.

# One of rllab's example scripts.  Specify as an argument here or just leave
# the default.
RLLAB_EXAMPLE=${1:-trpo_cartpole_stub.py}

module load anaconda

# Download rllab if needed
if [ ! -d rllab ]; then
	# Load proxy settings if the internet is not reachable
	ping -W 1 -c 1 google.com &>/dev/null || module load bu-webproxy
	git clone https://github.com/rllab/rllab
fi

# Path to the rllab files.  Since we're git-cloning it into the working
# directory, we'll just use that.
RLLAB="./rllab/"

if [ -d $NOKRB/.conda/envs/rllab ]
then
	echo "Environment directory already exists; skipping install."
else
	echo "Installing to $HOME"
	conda env create --file rllab/environment.yml
fi

# Install complete!  Now we can load our custom environment for use.
source activate rllab

# To actually use rllab, we can try one of the examples included in the
# repository.  On first run rllab reports "Personal config created, but you
# should probably edit it before further experiments are run."  If we run it
# again it seems to go to completion.
PYTHONPATH="$RLLAB" python "$RLLAB/examples/$RLLAB_EXAMPLE"
PYTHONPATH="$RLLAB" python "$RLLAB/examples/$RLLAB_EXAMPLE"
