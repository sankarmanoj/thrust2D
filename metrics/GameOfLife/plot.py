import matplotlib.pyplot as plt
import sys
import json
data = json.load(open("result.json","r"))
plt.title("Game Of Life")


plt.xlabel("Dimension")
plt.ylabel("Time in Microseconds")
names={"thrust.o":"Thrust","shared-thrust.o":"Thrust Shared","shared-native.o":"Native Shared","texture-thrust.o":"Thrust Texture","native.o":"Native","texture-native.o":"Native Texture"}
colors = {"Thrust":'k',"Thrust Shared":"r","Thrust Texture":"y","Native Shared":"b","Native":"g","Native Texture":"m"}
for app in sorted(data,key=lambda x: names[x[".name"]]):
    dims = json.load(open("dims.json","r"))
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
