# Tests for C++ compilation jobs.  This will compile and run a test program
# using the locally-installed version of GCC, our newer install off the network
# (GCC v5), and the C++14 standard using the newer install.

queue = bme.q

all: compile_local compile_gcc5 compile_gcc5_v14
	qstat

# Compile using the local system's installation of GCC (v4)
compile_local:
	qsub -j y -q $(queue) compile_local.sh

# Compile using our /ad/eng/opt/ installation of GCC (v5)
compile_gcc5:
	qsub -j y -q $(queue) compile_gcc5.sh

# The older complier can't handle C++14, but GCC 5 can
compile_gcc5_v14:
	qsub -j y -q $(queue) compile_gcc5_v14.sh

clean:
	rm -f *.{o,e,po,pe}*
	rm -f hello_local hello_gcc5 hello_gcc5_v14
