// Adapted from:
// http://www.boost.org/doc/libs/1_60_0/libs/python/doc/html/tutorial/index.html
#include <boost/python.hpp>

char const* greet()
{
	return "\n\nHello, world!\n\n";
}

BOOST_PYTHON_MODULE(hello)
{
	using namespace boost::python;
	def("greet", greet);
}
