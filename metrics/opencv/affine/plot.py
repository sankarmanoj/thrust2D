import matplotlib.pyplot as plt
import sys
import json
data = json.load(open("result.json","r"))
plt.title("Affine")

plt.xlabel("Dimension")
plt.ylabel("Time in Microseconds")
names = {"non_shared/affine.o":"Non Shared","shared/affine.o":"Shared","opencv/affine.o":"Native"}
colors = {"Non Shared":"r","Shared":"g","Native":"b"}
for app in data:
    dims = []
    total = []
    for val in app["values"]:
        dims.append(val[0])
        total.append(val[1])
    plt.plot(dims,total,colors[names[app[".name"]]],label=names[app[".name"]])

plt.legend(loc=2)

plt.show()
