#$ -N swig-tcl
#$ -cwd
#$ -l s_vmem=1G

module load swig

swig -tcl example.i
gcc -c -fpic example.c example_wrap.c
gcc -shared example.o example_wrap.o -o example-tcl.so

echo "Example TCL script outputs:"
tclsh swig-tcl.tcl
