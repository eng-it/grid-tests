#$ -N gurobi_test_matlab
#$ -cwd
#$ -l s_vmem=4G

module load gurobi
cp -u $GUROBI_HOME/examples/matlab/mip1.m .
export MATLAB_PREFDIR=/mnt/nokrb/$USER/MATLAB
matlab86 -nodesktop -nosplash -r mip1
