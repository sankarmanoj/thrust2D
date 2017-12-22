import matplotlib.pyplot as plt
import sys
import json
data = json.load(open("result.json","r"))
plt.title("Blend")


plt.xlabel("Dimension")
plt.ylabel("Time in Microseconds")
names = {
        # "shared/blend.o":"Shared",
        "opencv/blend.o":"Native",
        # "texture/blend.o":"Texture",
        "non_shared/blend.o":"Thrust2D"}
colors = {"Thrust2D":"r","Shared":"g","Native":"b","Texture":'y'}
for app in data:
    if app['.name'] not in names.keys():
        continue
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
