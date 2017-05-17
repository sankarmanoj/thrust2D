import matplotlib.pyplot as plt
import sys
import json
results = json.load(open("result.json","r"))


plt.xlabel("Dimension")
plt.ylabel("Time in microseconds")
names = {"native_omp.o":"Native", "omp_blend.o":"Thrust"}
colors = {"Thrust":"r","Thrust++":"g","Native":"b"}
for (cores,data) in results[1:5:2]:
    keys = data.keys()
    keys.sort()
    for key in keys:
        dims = []
        total = []
        for val in data[key]:
            dims.append(val[0])
            total.append(val[1])
        plt.plot(dims,total,label="%d Cores"%(cores))

plt.legend(loc=2)
plt.title(sys.argv[1])
plt.show()
