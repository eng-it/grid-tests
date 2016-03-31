#$ -N gurobi_test_cl
#$ -cwd
#$ -l s_vmem=1G

module load gurobi
gurobi_cl ResultFile=coins.sol $GUROBI_HOME/examples/data/coins.lp
