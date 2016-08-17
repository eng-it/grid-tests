# Test a very basic shell script with different variants of the shell option,
# including the default setting.
#
# Note that for all shells in the grid's login_shells list, it will source the
# full user profile at the start of the job.  If you use a shell not in that
# list (like zsh) it will start as a non-login shell.  As of this writing
# login_shells is set to sh,bash,ksh,csh,tcsh.  To see the current list run
# "qconf -sconf" and see the login_shells entry there.

queue ?= bme.q

all: bash sh csh default zsh
	qstat
bash:
	qsub -q $(queue) -N qsub-test-bash -S /bin/bash qsub-test.sh
sh:
	qsub -q $(queue) -N qsub-test-sh -S /bin/sh qsub-test.sh
csh:
	qsub -q $(queue) -N qsub-test-csh -S /bin/csh qsub-test.sh
# We have bash set as the default shell on all queues, so this should produce
# similar output as qsub-test-bash.
default:
	qsub -q $(queue) -N qsub-test-default qsub-test.sh
# zsh is included as an example shell that is not in the login_shells list.
# Note that it shows a more stripped-down environment in the output file.
zsh:
	qsub -q $(queue) -N qsub-test-zsh -S /bin/zsh qsub-test.sh
clean:
	rm -f qsub-test-*.o??????? qsub-test-*.e???????
