#!/usr/bin/python
import numpy as np
import matplotlib.pyplot as pl

pl.xlabel('Array size')
pl.ylabel('Time in uSec')
pl.title('Sorting metrics')

data1 = np.loadtxt('3ssort.dat')
plot1 = pl.loglog(data1[:,0], data1[:,1], 'ro-', basex=2,basey=10)

data2 = np.loadtxt('3qsort.dat')
plot2 = pl.loglog(data2[:,0], data2[:,1], 'go-', basex=2,basey=10)

p1 = pl.Rectangle((0, 0), 1, 1, fc="red")
p2 = pl.Rectangle((0, 0), 1, 1, fc="green")
pl.legend([p1, p2], ['Manual Selection Sort', 'Standard Library Qsort'], 'upper left')
pl.grid('on')
pl.show()
