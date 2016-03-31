#!/usr/bin/env bash
#$ -N cellsort
#$ -cwd
#$ -l s_vmem=2G

# Run the CompuCell3D Demo "cellsort_2D", working in the current directly only.
DIR="$(pwd)"
cc3d-rs -i "$DIR/cellsort_2D/cellsort_2D.cc3d" -f 10 -o "$DIR/cellsort_2D_results" -c cellsort_2D
