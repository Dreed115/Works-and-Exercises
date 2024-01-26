from matplotlib import pyplot as plt
from matplotlib.animation import FuncAnimation
import numpy as np

a, b, c = 0.2, 0.2, 5.7
x0, y0, z0 = 1, 1, 1
h = 0.01
Matrix = []

fig = plt.figure()
ax = plt.axes(projection='3d')


def euler(x0,y0,z0,h):
    xk1 = x0 + h*(-y0-z0)
    yk1 = y0 + h*(x0+a*y0)
    zk1 = z0 + h*(b+z0*(x0-c))
    x1= x0 + (h/2)*(-y0-z0 + (-yk1-zk1))
    y1= y0 + (h/2)*(x0+a*y0 + (xk1+a*yk1))
    z1= z0 + (h/2)*(b+z0*(x0-c) + (b+zk1*(xk1-c)))
    return x1, y1, z1




for i in range(0,20000):
    Matrix.append([x0,y0,z0])
    x1, y1, z1 = euler(x0,y0,z0,h)
    x0, y0, z0 = x1, y1, z1

matrix_new = np.array([[float(value) for value in point] for point in Matrix])    

scat = ax.scatter(matrix_new[:, 0], matrix_new[:, 1], matrix_new[:, 2], c='r', marker='.', s=0.1)


plt.show()