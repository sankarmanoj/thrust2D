import matplotlib.pyplot as plt
import sys
import json
data = json.load(open("result.json","r"))
plt.title("SRAD")


plt.xlabel("Dimension")
plt.ylabel("Time in Microseconds")
names = {"srad_non_shared.out":"Non Shared","srad.out":"Shared","cuda_srad.out":"Native","texture_bilateralFilter":"Texture"}
colors = {"Non Shared":"r","Shared":"g","Native":"b","Texture":'y'}
for app in data:
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
