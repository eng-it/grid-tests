# http://www.mathworks.com/matlabcentral/newsreader/view_thread/335832
# https://devcenter.heroku.com/articles/tuning-glibc-memory-behavior
#
# Note that although -singleCompThread is supposed to limit matlab to one CPU,
# it still  appears to use all available cores according to the command
# feature('numcores').  TODO: investigate this.

queue = bme.q

all: compile_and_run just_run

compile_and_run:
	qsub -q "$(queue)" compile_and_run.sh
just_run:
	qsub -q "$(queue)" just_run.sh
clean:
	# Files left from mcc call
	rm -f gridtest run_gridtest.sh mccExcludedFiles.log readme.txt requiredMCRProducts.txt
	# Job output for compile_and_run
	rm -f matlabmcctest.{o,e,po,pe}*
	# Job output for just_run
	rm -f matlabtest.{o,e,po,pe}*
	# Rendered image from either case
	rm -f mesh.png
