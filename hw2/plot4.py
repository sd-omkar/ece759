#!/usr/bin/python
import numpy as np
import matplotlib.pyplot as pl

pl.xlabel('Array size')
pl.ylabel('Time in uSec')
pl.title('Prefix scan metrics')

data = np.loadtxt('4scan.dat')
pl.plot(data[:, 0], data[:, 1], 'bo-')

pl.grid('on')
pl.show()
