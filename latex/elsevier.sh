#!/usr/bin/env bash
#$ -cwd
#$ -l s_vmem=1G

# Load the "tex" module first so that the third-party files (elsarticle.cls and
# associated files in this case) can be found by the LaTeX commands.  pdflatex
# is called twice below so that citations/labels will be tracked correctly.  The
# output file will show a warning about halfway through about this, but the 
# output from the second run below that should not.

module load tex
pdflatex $1
pdflatex $1
