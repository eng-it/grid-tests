#$ -N matlabtest 
#$ -cwd
#$ -j y
#$ -pe threaded 4
#$ -l s_vmem=2G

hostname
date

export MATLAB_PREFDIR=/mnt/nokrb/$USER/MATLAB
matlab85 -nodesktop -nosplash -r gridtest
