# http://collaborate.bu.edu/engit/Grid/Matlab
#$ -cwd
#$ -N matlabmcctest 
#$ -j y
#$ -pe threaded 4
#$ -l s_vmem=2G

hostname
date

export MATLAB_PREFDIR=/mnt/nokrb/$USER/MATLAB
export MCR_CACHE_ROOT=/tmp/$USER/$RANDOM
mcc85 -m gridtest
./run_gridtest.sh /ad/eng/opt/matlab-8.5/
