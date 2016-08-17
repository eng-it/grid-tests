#!/bin/bash
# 
# The default on our queues is now bash.  Shells that are in the login_shells
# list in the SGE configuration will be qsub'd as login shells, with profile
# scripts and such being sourced.  So, they'll get the usual path and module
# settings.  Other shells will be non-login and more stripped-down.
# 
# This script looks weird because it's written to also function as a csh script.
# 
#$ -N qsub-test
#$ -cwd
#$ -l s_vmem=256M
#$ -j y

# Note the difference here between the script's location at $0 (some temporary
# Grid-defined path) and the working directory shown by `pwd`.  Assuming jobs
# are being run with the usual -cwd argument given, any other files needed by a
# job script are probably relative to the current working directory rather than
# the script path.
echo SHELL: $SHELL
echo Script: $0
echo User: `whoami`
echo date: `date`
echo hostname: `hostname -f`
echo working dir: `pwd`
echo kerberos tickets: `bash -c "klist 2>&1"`
echo homedir access: `bash -c "ls -d $HOME/ 2>&1"`
echo MODULESHOME: $MODULESHOME
echo MODULEPATH: $MODULEPATH
echo PATH: $PATH
