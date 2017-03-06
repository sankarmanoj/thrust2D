import matplotlib.pyplot as plt
import sys
import json
data = json.load(open("result.json","r"))


plt.xlabel("Dimension")
plt.ylabel("Time in microseconds")
keys = data.keys()
for key in keys:
    dims = []
    total = []
    for val in data[key]:
        dims.append(val[0])
        total.append(val[1])
    plt.plot(dims,total,label=key[:-2])

plt.legend(loc=2)

plt.show()
