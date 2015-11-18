# Test a very basic shell script with different variants of the shell option,
# including the default setting.

queue ?= bme.q

all: bash sh csh default
	qstat
bash:
	qsub -q $(queue) -N qsub-test-bash -S /bin/bash qsub-test.sh
sh:
	qsub -q $(queue) -N qsub-test-sh -S /bin/sh qsub-test.sh
csh:
	qsub -q $(queue) -N qsub-test-csh -S /bin/csh qsub-test.sh
default:
	qsub -q $(queue) -N qsub-test-default qsub-test.sh
clean:
	rm -f qsub-test-*.o??????? qsub-test-*.e???????
