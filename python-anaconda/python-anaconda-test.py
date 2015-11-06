#!/usr/bin/env python-anaconda
# 
# 3D matplotlib example, taken mainly from this demo:
# http://matplotlib.org/examples/mplot3d/contour3d_demo3.html

print "Python script: starting up"

# If we use a wrapper script with a login shell, it'll assume there's a DISPLAY
# set to render to.  So, we can override that here before importing any more
# plotting things.
# http://matplotlib.org/faq/usage_faq.html#what-is-a-backend
import matplotlib
matplotlib.use('SVG')

from mpl_toolkits.mplot3d import axes3d
import matplotlib.pyplot as plt
from matplotlib import cm

print "Python script: module imports successful"

fig = plt.figure()
ax = fig.gca(projection='3d')
X, Y, Z = axes3d.get_test_data(0.05)
ax.plot_surface(X, Y, Z, rstride=8, cstride=8, alpha=0.3)
cset = ax.contour(X, Y, Z, zdir='z', offset=-100, cmap=cm.coolwarm)
cset = ax.contour(X, Y, Z, zdir='x', offset=-40, cmap=cm.coolwarm)
cset = ax.contour(X, Y, Z, zdir='y', offset=40, cmap=cm.coolwarm)

ax.set_xlabel('X')
ax.set_xlim(-40, 40)
ax.set_ylabel('Y')
ax.set_ylim(-40, 40)
ax.set_zlabel('Z')
ax.set_zlim(-100, 100)

print "Python script: saving plot file"

plt.savefig('contour.svg')
