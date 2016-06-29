# Tests for C++ compilation jobs that use our custom Boost installation.
# These example cpp files are from the Getting Started guide for UNIX variants:
# http://www.boost.org/doc/libs/1_60_0/more/getting_started/unix-variants.html
# And also the Boost.Python tutorial:
# http://www.boost.org/doc/libs/1_60_0/libs/python/doc/html/tutorial/index.html

queue = bme.q

# boost_simple: Doesn't use a compiled boost library and only requires the
#               header files be available at compile-time.
# boost_regex:  Uses a compiled library (libboost_regex.so).
# boost_python: Compiles a shared library that can be accessed from Python.
ALL = boost_simple boost_regex boost_python
.PHONY: $(ALL)
all: $(ALL)
	qstat
$(ALL):
	qsub -q $(queue) $@.sh

clean:
	rm -f *.{o,e,po,pe}*
	rm -f *.so
	rm -f boost_simple
	rm -f boost_regex
	rm -rf build/
