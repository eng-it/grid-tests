# grid-tests
Ready-to-run tests/examples for various Grid Engine tasks.  Just log onto enggrid, clone this into `/mnt/nokrb/$USER/grid-tests/`, cd into a directory, and run `make`.  For example:

    jesse08@engineering-grid1 /mnt/nokrb/jesse08/grid-tests $ cd qsub/
    jesse08@engineering-grid1 /mnt/nokrb/jesse08/grid-tests/qsub $ ls
    Makefile  qsub-test.sh
    jesse08@engineering-grid1 /mnt/nokrb/jesse08/grid-tests/qsub $ make
    qsub -q bme.q -N qsub-test-bash -S /bin/bash qsub-test.sh
    Your job 7187175 ("qsub-test-bash") has been submitted
    qsub -q bme.q -N qsub-test-sh -S /bin/sh qsub-test.sh
    Your job 7187176 ("qsub-test-sh") has been submitted
    qsub -q bme.q -N qsub-test-default qsub-test.sh
    Your job 7187177 ("qsub-test-default") has been submitted
    qstat
    job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
    -----------------------------------------------------------------------------------------------------------------
    7187175 0.00000 qsub-test- jesse08      qw    10/09/2015 16:40:02                                    1        
    7187176 0.00000 qsub-test- jesse08      qw    10/09/2015 16:40:02                                    1        
    7187177 0.00000 qsub-test- jesse08      qw    10/09/2015 16:40:02                                    1        
    jesse08@engineering-grid1 /mnt/nokrb/jesse08/grid-tests/qsub $ ls
    Makefile  qsub-test-bash.o7187175  qsub-test-default.o7187177  qsub-test.sh  qsub-test-sh.o7187176
    
See the `Makefile` in a given directory for more information.
