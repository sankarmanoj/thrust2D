import matplotlib.pyplot as plt
import sys
import json
from os.path import dirname, abspath
import os
original_path  = os.getcwd()
path = os.getcwd().replace("metrics/","")
print path
files = ["native_pf.log","thrust_pf.log"]
data  = []
for f in files:
    data.append(open(path+"/"+f,"r"))
sizes = range(100,10000,100)
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
        total.append(float(d.readline()))
    plt.plot(dims,total,label=names[d])

plt.legend(loc=2)

plt.show()
