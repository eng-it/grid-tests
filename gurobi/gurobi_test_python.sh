#$ -N gurobi_test_python
#$ -cwd
#$ -l s_vmem=1G

module load gurobi
module load anaconda
python "$GUROBI_HOME/examples/python/sudoku.py" "$GUROBI_HOME/examples/data/sudoku1"
