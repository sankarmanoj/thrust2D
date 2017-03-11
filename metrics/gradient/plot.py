import matplotlib.pyplot as plt
import sys
import json
data = json.load(open("result.json","r"))


plt.xlabel("Dimension")
plt.ylabel("Time in microseconds")
keys = data.keys()
names={"descent.o":"Thrust","shared-descent.o":"Thrust++","native.o":"CUDA","nc-shared-descent.o":"NC"}
for key in keys:
    dims = []
    dot = []
    grad = []
    total = []
    for val in data[key]:
        dims.append(val[0])
        dot.append(val[1][0])
        grad.append(val[1][1])
        total.append(val[1][1]+val[1][0])
    plt.plot(dims,total,label=names[key])
    # plt.plot(dims,total,label=key[:-2]+" Total")
    # plt.plot(dims,dot,label=key+" Dot")
    # plt.plot(dims,grad,label=key+" Grad")
plt.legend(loc=2)
plt.show()
