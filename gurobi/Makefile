# Examples using Gurobi optimizer
#
# For more example files from the vendor, see:
# /ad/eng/opt/64/gurobi/gurobi651/examples/

all: gurobi_test_cl gurobi_test_python

# An example of using the Gurobi command-line interface with an input text file
# http://www.gurobi.com/documentation/6.5/quickstart_linux/the_model_file.html
# This will list the solution as an output file (coins.sol)
gurobi_test_cl:
	qsub gurobi_test_cl.sh

# A Python example.  This will take a sudoku puzzle as input and produce the
# solution as output, written to stdout for the job.
gurobi_test_python:
	qsub gurobi_test_python.sh

clean:
	rm -f gurobi.log
	rm -f gurobi_test_cl.{o,e}*
	rm -f gurobi_test_python.{o,e}*
	rm -f coins.sol
	rm -f sudoku.lp
