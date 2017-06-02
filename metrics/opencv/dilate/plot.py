import matplotlib.pyplot as plt
import sys
import json
data = json.load(open("result.json","r"))
plt.title("Dilate")


plt.xlabel("Dimension")
plt.ylabel("Time in Microseconds")
names = {"non_shared/dilate.o":"Non Shared","shared/dilate.o":"Shared","opencv/dilate.o":"Native"}
colors = {"Non Shared":"r","Shared":"g","Native":"b"}
for app in data:
    dims = range(10,1000,20)
    total = [0 for x in dims]
    keys = app.keys()
    print app['.name']
    keys.remove(".name")

    print "Size = ",
    for key in keys:
        print len(app[key])," ",
    print ""
    nkeys = len(keys)
    for kernel in keys:
        for value in app[kernel]:
            total[dims.index(value[0])]+=value[1]
    plt.plot(dims,total,colors[names[app[".name"]]],label=names[app[".name"]])

plt.legend(loc=2)

plt.show()
