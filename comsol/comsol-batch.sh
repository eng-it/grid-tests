#!/bin/bash
#
#$ -N comsol-batch
#$ -cwd
#$ -pe threaded 4
#$ -l s_vmem=3G
#$ -j y

hostname
date

input="/ad/eng/opt/comsol44/models/COMSOL_Multiphysics/Tutorial_Models/micromixer_batch.mph"
output="solved.mph"
comsol-research batch -np $NSLOTS -inputfile "$input" -outputfile "$output"
