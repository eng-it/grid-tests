# http://collaborate.bu.edu/engit/Grid/Matlab

all: compile_and_run just_run

compile_and_run:
	qsub compile_and_run.sh
just_run:
	qsub just_run.sh
clean:
	rm -f gridtest run_gridtest.sh mccExcludedFiles.log readme.txt
	rm -f matlabmcctest.{o,e}*
	rm -f matlabtest.{o,e}*
