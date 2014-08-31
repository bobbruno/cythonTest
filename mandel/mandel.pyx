import numpy as np
import matplotlib.pyplot as plt
from numpy cimport float_t
cimport numpy as np
cimport cython

@cython.boundscheck(False)
@cython.wraparound(False)
cdef int cmandel(float x, float y, int max_iter):
    """
    Given z = x + iy and max_iter, determine whether the candidate
    is in the mandelbrot set for the given number of iterations
    """
    cdef float cx
    cx=x
    cdef float cy
    cy=y
    cdef float zx
    zx = 0
    cdef float zy
    zy = 0
    cdef int i
    for i in range(max_iter):
        zx, zy = (zx*zx - zy*zy + cx), (zx*zy + zy*zx + cy)
        if (zx*zx + zy*zy) >= 4:
            return i

    return max_iter

@cython.boundscheck(False)
@cython.wraparound(False)
def ccreate_fractal(int Nx, int Ny, int xmin, int xmax, int ymin, int ymax, int max_iter):
    """Create and return a fractal image"""
    cdef int x
    cdef np.ndarray[float_t, ndim=2] image
    image = np.zeros((Ny, Nx), dtype=float)
    cdef float dx
    cdef float dy
    cdef float rpart
    cdef float ipart
    cdef int y
    cdef int color
    dx = (xmax - xmin) * 1. / Nx
    dy = (ymax - ymin) * 1. / Ny
    
    for x in range(Nx):
        rpart = xmin + x * dx
        for y in range(Ny):
            ipart = ymin + y * dy
            color = cmandel(rpart, ipart, max_iter)
            image[y, x] = color
    return image

image = ccreate_fractal(800, 600, -2, 1, -1, 1, 20)
plt.imshow(image, cmap=plt.cm.jet)