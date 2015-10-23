#!/bin/bash
#
#$ -S /bin/bash
#$ -cwd
#$ -pe threaded 4
#$ -N comsol-batch
#$ -j y

hostname
date

input="/ad/eng/opt/comsol44/models/COMSOL_Multiphysics/Tutorial_Models/micromixer_batch.mph"
output="solved.mph"
#source /etc/profile.d/eng-paths.sh
comsol-research batch -np $NSLOTS -inputfile "$input" -outputfile "$output"
