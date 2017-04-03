import matplotlib.pyplot as plt
import sys
import json
from os.path import dirname, abspath
d = (dirname(abspath(__file__)))
data = json.load(open(d+"/result.json","r"))


plt.xlabel("Dimension")
plt.ylabel("Time")
print sys.argv
plt.title(sys.argv[1])
names = {"thrust.o":"Thrust","native.o":"Native"}
colors = {"Thrust":"r","Thrust++":"g","Native":"b"}
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
