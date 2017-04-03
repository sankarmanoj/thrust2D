import matplotlib.pyplot as plt
import sys
import json
data = json.load(open("result.json","r"))


plt.xlabel("Dimension")
plt.ylabel("Time in Seconds")
plt.title(sys.argv[1])
keys = data.keys()
print keys
names={"omp_descent.o":"Thrust","omp_native.o":"Native"}
keys = sorted(keys,key=lambda k:names[k])
colors = {"Thrust":"r","Thrust++":"g","Native":"b"}
for key in keys[:3]:
    dims = []
    dot = []
    grad = []
    total = []
    for val in data[key]:
        dims.append(val[0])
        total.append(val[1])
    plt.plot(dims,total,colors[names[key]],label=names[key])
    # plt.plot(dims,total,label=key[:-2]+" Total")
    # plt.plot(dims,dot,label=key+" Dot")
    # plt.plot(dims,grad,label=key+" Grad")
plt.legend(loc=2)
plt.show()
