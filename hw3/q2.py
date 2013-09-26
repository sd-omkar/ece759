#!/usr/bin/python

import numpy as np
import matplotlib.pyplot as pp

pp.xlabel('Array size')
pp.ylabel('Time in uSec')
pp.title('CUDA vector addition timing metrics')

data_32 = np.loadtxt(q2_32.dat.back)
x_32 = data_32[:, 0]
y_32_incl = data_32[:, 1]
y_32_excl = data_32[:, 2]
pp.plot(x_32, y_32_incl, 'b', linewidth=2)

pp.show()
