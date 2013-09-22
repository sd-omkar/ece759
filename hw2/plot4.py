#!/usr/bin/python
import numpy as np
import matplotlib.pyplot as pl

pl.xlabel('Array size')
pl.ylabel('Time in uSec')
pl.title('Prefix scan metrics')

data = np.loadtxt('4scan.dat')
x = data[:, 0]
y = data[:, 1]
pl.plot(x, y, 'bo--')

coeff = np.polyfit(x, y, 1)
poly = np.poly1d(coeff)
y_ = poly(x)
pl.plot(x, y_, 'ro-')

pl.grid('on')
p1 = pl.Rectangle((0, 0), 1, 1, fc="blue")
p2 = pl.Rectangle((0, 0), 1, 1, fc="red")
pl.legend([p1, p2], ['Actual data', 'Linear approximation'], 'upper left')
pl.show()
