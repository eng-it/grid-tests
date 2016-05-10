# Tests for C++ compilation jobs that use our custom Boost installation.
# These example cpp files are from the Getting Started guide for UNIX variants:
# http://www.boost.org/doc/libs/1_60_0/more/getting_started/unix-variants.html

queue = bme.q

# Both examples use the Boost installation header and library files provided
# by our boost module.
all: boost_simple boost_regex
	qstat

# This example doesn't use a compiled boost library and only requires
# the header files be available at compile-time.
boost_simple:
	qsub -q $(queue) boost_simple.sh

# This example uses a compiled library (libboost_regex.so).
boost_regex:
	qsub -q $(queue) boost_regex.sh

clean:
	rm -f *.{o,e,po,pe}*
	rm -f boost_simple
	rm -f boost_regex
