Cython Tests
==========

Examples of python and Cython code equivalents. I'm trying to learn how to write the best possible cython code while limiting the cython incompatible extensions to a minimum.

All examples, unless otherwise noted on comments, should work in pure python just by commenting the lines that contain cython-specific directives, such as:
* `cdef`
* `cimport`
* `@cython`

# Good practices
* Don't declare and initialize cython typed variables in one statement. Transform thing like
    `cdef int x = 0` to
    `cdef int x
    x = 0`

* Numpy arrays of n dimensions must be defined as n-dimensional in cython as well. the format is `cdef np.ndarray[<type>, __ndim=<number of dimensions>__]`

Next steps:
* Write a preprocessor to eliminate the cython lines
* Change lines that do not follow the best practices above so that preprocessed scripts can run in standard python
* Wrap all this inside a python package so that cython code can be executed (almost) natively in python.
