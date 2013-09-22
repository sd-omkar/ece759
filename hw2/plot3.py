#!/usr/bin/python
import numpy as np
import matplotlib.pyplot as pl

pl.xlabel('Array size')
pl.ylabel('Time in uSec')
pl.title('Sorting metrics')

data1 = np.loadtxt('3ssort.dat')
x1 = data1[:,0]
y1 = data1[:,1]
pl.loglog(x1, y1, 'ro-', basex=2,basey=10)
#coeff1 = np.polyfit(x1, y1, 1)
#poly1 = np.poly1d(coeff1)
#ys1 = poly1(x1)
#print coeff1
#print poly1
#print ys1
#pl.plot(x1, y1, 'ro-')
#pl.plot(x1, ys1, 'r')

data2 = np.loadtxt('3qsort.dat')
x2 = data2[:,0]
y2 = data2[:,1]
pl.loglog(x2, y2, 'go-', basex=2,basey=10)
#coeff2 = np.polyfit(x2, y2, 1)
#poly2 = np.poly1d(coeff2)
#ys2 = poly1(x2)
#print coeff2
#print poly2
#print ys2
#pl.plot(x2, y2, 'go-')
#pl.plot(x2, ys2, 'g')

p1 = pl.Rectangle((0, 0), 1, 1, fc="red")
p2 = pl.Rectangle((0, 0), 1, 1, fc="green")
pl.legend([p1, p2], ['Manual Selection Sort', 'Standard Library Qsort'], 'upper left')
pl.grid('on')
pl.show()
