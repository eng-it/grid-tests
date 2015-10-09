# http://collaborate.bu.edu/engit/Grid/Matlab
#$ -S /bin/sh
#$ -cwd
#$ -N matlabmcctest 
#$ -j y

hostname
date

export MATLAB_PREFDIR=/mnt/nokrb/$USER/MATLAB
export MCR_CACHE_ROOT=/tmp/$USER/$RANDOM
mcc83 -m gridtest.m
./run_gridtest.sh /ad/eng/opt/matlab-8.3/
