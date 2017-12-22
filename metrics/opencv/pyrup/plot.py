import matplotlib.pyplot as plt
import sys
import json
data = json.load(open("result.json","r"))
plt.title("Pyrup")


plt.xlabel("Dimension")
plt.ylabel("Time in Microseconds")
names = {
        # "non_shared/pyrup.o":"Non Shared",
        "shared/pyrup.o":"Shared",
        "opencv/pyrup.o":"Native"}
colors = {"Non Shared":"r","Shared":"g","Native":"b"}
dims = json.load(open("dims.json","r"))
for app in data:
    if app[".name"] not in names.keys():
        continue
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
