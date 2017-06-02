import matplotlib.pyplot as plt
import sys
import json
data = json.load(open("result.json","r"))

plt.title("OpenMP Erode")
plt.xlabel("Dimension")
plt.ylabel("Time in Milliseconds")
names = {"omp/erode.o":"Thrust","native_omp/erode.o":"Native"}
colors = {"Thrust":"r","Native":"b"}
for app in data:
    dims = []
    total = []
    for val in app['values']:
        dims.append(val[0])
        total.append(val[1])
    plt.plot(dims,total,colors[names[app['.name']]],label=names[app['.name']])

plt.legend(loc=2)

plt.show()
