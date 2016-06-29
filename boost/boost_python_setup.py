#!/usr/bin/env python
# This is how we can build a module using Python's distutils.   See
# boost_python.sh for more details.

from distutils.core import setup
from distutils.extension import Extension
import distutils.log
distutils.log.set_verbosity(distutils.log.DEBUG)

setup(name="PackageName",
    ext_modules=[
        Extension("hello", ["boost_python_hello.cpp"],
        libraries = ["boost_python"],
        library_dirs = ["/ad/eng/opt/64/anaconda/lib"])
    ])
