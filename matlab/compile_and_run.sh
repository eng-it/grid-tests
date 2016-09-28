#$ -cwd
#$ -N matlabmcctest 
#$ -j y
#$ -pe threaded 4
#$ -l s_vmem=2G

hostname
date

export MATLAB_PREFDIR=/mnt/nokrb/$USER/MATLAB
export MCR_CACHE_ROOT=/tmp/$USER/$RANDOM
MATLAB="/ad/eng/opt/matlab-8.5"
echo
echo "Compiling with mcc"
echo
"$MATLAB/bin/mcc" -v -m gridtest make_pretty_mesh
echo
echo "Executing compiled MATLAB code"
echo
./run_gridtest.sh "$MATLAB"
