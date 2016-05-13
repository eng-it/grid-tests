# Test a very basic shell script with different variants of the shell option,
# including the default setting.
#
# Note that for all shells in the grid's login_shells list, it will source the
# full user profile at the start of the job.  If you use a shell not in that
# list (like zsh) it will start as a non-login shell.

queue ?= bme.q

all: bash sh csh default zsh
	qstat
bash:
	qsub -q $(queue) -N qsub-test-bash -S /bin/bash qsub-test.sh
sh:
	qsub -q $(queue) -N qsub-test-sh -S /bin/sh qsub-test.sh
csh:
	qsub -q $(queue) -N qsub-test-csh -S /bin/csh qsub-test.sh
default:
	qsub -q $(queue) -N qsub-test-default qsub-test.sh
zsh:
	qsub -q $(queue) -N qsub-test-zsh -S /bin/zsh qsub-test.sh
clean:
	rm -f qsub-test-*.o??????? qsub-test-*.e???????
