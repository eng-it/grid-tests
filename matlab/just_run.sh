# http://collaborate.bu.edu/engit/Grid/Matlab
#$ -cwd
#$ -N matlabtest 
#$ -j y

hostname
date

export MATLAB_PREFDIR=/mnt/nokrb/$USER/MATLAB
export MCR_CACHE_ROOT=/mnt/nokrb/$USER/MATLAB
matlab -r gridtest -nodesktop -nojvm -nosplash
