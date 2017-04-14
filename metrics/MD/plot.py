import matplotlib.pyplot as plt
import sys
import json
data = json.load(open("result.json","r"))


plt.xlabel("Dimension")
plt.ylabel("Time in Seconds")
names = {"thrust_perfsig.out":"Thrust","shared_perfsig.out":"Thrust++","perfsig.out":"CUDA"}
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
