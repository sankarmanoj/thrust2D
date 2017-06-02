import matplotlib.pyplot as plt
import sys
import json
data = json.load(open("result.json","r"))
plt.title("Hotspot")


plt.xlabel("Dimension")
plt.ylabel("Time in Microseconds")
keys = data.keys()
print keys
names={"hotspot_foreach.out":"Thrust","hotspot_cuda.out":"Native"}
colors = {"Thrust":"r","Native":"b"}
for key in keys:
    dims = []
    dot = []
    grad = []
    total = []
    for val in data[key]:
        dims.append(val[1])
        total.append(val[0])
    plt.plot(dims,total,label=key)
    # plt.plot(dims,total,label=key[:-2]+" Total")
    # plt.plot(dims,dot,label=key+" Dot")
    # plt.plot(dims,grad,label=key+" Grad")
plt.legend(loc=2)
plt.show()
