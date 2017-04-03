import matplotlib.pyplot as plt
import sys
import json
from os.path import dirname, abspath
d = (dirname(abspath(__file__)))
data = json.load(open(d+"/result.json","r"))


plt.xlabel("Dimension")
plt.ylabel("Time in microseconds")
names = {"ns_thrust_p_f.o":"Thrust","thrust_particle_filter.o":"Thrust++","ex_particle_CUDA_float_seq.o":"CUDA"}
colors = {"Thrust":"r","Thrust++":"g","CUDA":"b"}
keys = data.keys()
keys.sort()
for key in keys:
    dims = []
    total = []
    for val in data[key]:
        dims.append(val[0])
        total.append(val[1])
    plt.plot(dims,total,colors[names[key]],label=names[key])

plt.legend(loc=2)

plt.show()
