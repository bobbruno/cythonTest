import numpy as np
import matplotlib.pyplot as plt 

def mandel(x, y, max_iter):
    """
    Given z = x + iy and max_iter, determine whether the candidate
    is in the mandelbrot set for the given number of iterations
    """
    c = complex(x, y)
    z = 0.0j
    for i in range(max_iter):
        z = z*z + c
        if (z.real*z.real + z.imag*z.imag) >= 4:
            return i

    return max_iter

def create_fractal(Nx, Ny, xmin, xmax, ymin, ymax, max_iter):
    """Create and return a fractal image"""
    image = np.zeros((Ny, Nx), dtype=float)
    dx = (xmax - xmin) * 1. / Nx
    dy = (ymax - ymin) * 1. / Ny
    
    for x in range(Nx):
        rpart = xmin + x * dx
        for y in range(Ny):
            ipart = ymin + y * dy
            color = mandel(rpart, ipart, max_iter)
            image[y, x] = color
    return image

image = create_fractal(300, 200, -2, 1, -1, 1, 20)
plt.imshow(image, cmap=plt.cm.jet)