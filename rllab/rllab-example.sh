#!/usr/bin/env bash
#$ -N rllab-example
#$ -cwd
#$ -j y
#$ -l s_vmem=10G

# Anaconda will try to access our home directory to manage configurations
# (separately from the location of an environment directory itself), and
# doesn't seem to have any specific option for changing this behavior.  This
# won't work in a batch job.  So, we'll manually change our home directory
# within the context of this job.
# In general it would make sense to use /mnt/nokrb/$USER, but in this case
# we'll use this example directory to keep things self-contained.
export HOME_ORIG="$HOME"
export HOME=./conda-home/

# One of rllab's example scripts.  Specify as an argument here or just leave
# the default.
RLLAB_EXAMPLE=${1:-trpo_gym.py}

echo "rllab example: $RLLAB_EXAMPLE"
hostname
date

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

if [ -d $HOME/.conda/envs/rllab ]
then
	echo "Environment directory already exists; skipping install."
else
	echo "Installing to $HOME"
	conda env create --file rllab/environment.yml
fi

# Install complete!  Now we can load our custom environment for use.
source activate rllab

# To actually use rllab, we can try one of the examples included in the
# repository.

# A few points about how the examples run:
#  * PYTHONPATH is given manually since rllab doesn't have a full installation
#    process right now.  This will let Python locate the rllab package.
#  * xvfb-run will create a fake screen to render graphics with.  Some examples
#    require a display even though it's not interactive.  For the required
#    OpenGL support, a screen with a sufficient color depth must be specified
#    as well (the 1024x1024x24 part).
PYTHONPATH="$RLLAB" xvfb-run -s "-screen 0 1024x1024x24" python "$RLLAB/examples/$RLLAB_EXAMPLE"
