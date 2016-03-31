# Runs an example CompuCell3D simulation from the project's Demos directory.
# Note the use of the wrapper script "cc3ds-rs" and the filesystem paths in the
# job script cellsort.sh.

queue = bme.q

all: init cellsort
	qstat

init:
	cp -ur /ad/eng/opt/64/CompuCell3D/Demos/Models/cellsort/cellsort_2D/ .
cellsort:
	qsub -q $(queue) cellsort.sh
clean:
	rm -f  cellsort.{o,e}*
	rm -rf cellsort_2D_results
