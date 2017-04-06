import matplotlib.pyplot as plt
import sys
import json
from os.path import dirname, abspath
import os
import numpy as np
import scipy.signal as sp
original_path  = os.getcwd()
path = os.getcwd().replace("metrics/","")
print path
files = ["native_gr.log","thrust_gr.log"]
data  = []
for f in files:
    data.append(open(path+"/"+f,"r"))
sizes = range(100,20000,100)
print len(sizes)
names = {data[0]:"Native",data[1]:"Thrust"}
plt.xlabel("Dimension")
plt.ylabel("Time")
print sys.argv
plt.title(sys.argv[1])
for d  in data:
    dims = []
    total = []
    for x in sizes:
        dims.append(x)
        val = d.readline()
        try:
            total.append(float(val))
        except:
            print val
    total = sp.savgol_filter(total,51,3)
    plt.plot(dims,total,label=names[d])

plt.legend(loc=2)

plt.show()
