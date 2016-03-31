#!/bin/bash
# 
# The default on our queues is now bash.  Shells that are in the login_shells
# list in the SGE configuration will be qsub'd as login shells, with profile
# scripts and such being sourced.  So, they'll get the usual path and module
# settings.  Other shells will be non-login and more stripped-down.
# login_shells is currently sh,bash,ksh,csh,tcsh .
# 
# This script looks weird because it's written to also function as a csh script.
# 
#$ -N qsub-test
#$ -cwd
#$ -l s_vmem=256M
#$ -j y
echo SHELL: $SHELL
echo User: `whoami`
echo date: `date`
echo hostname: `hostname -f`
echo working dir: `pwd`
echo kerberos tickets: `bash -c "klist 2>&1"`
echo homedir access: `bash -c "ls -d $HOME/ 2>&1"`
echo MODULESHOME: $MODULESHOME
echo MODULEPATH: $MODULEPATH
echo PATH: $PATH
