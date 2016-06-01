#$ -N gurobi_test_matlab
#$ -cwd
#$ -l s_vmem=4G

module load gurobi
export MATLAB_PREFDIR=/mnt/nokrb/$USER/MATLAB
matlab86 -nodesktop -nosplash -r gurobi_test_matlab
