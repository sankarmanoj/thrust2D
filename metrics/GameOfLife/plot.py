import matplotlib.pyplot as plt
import sys
import json
data = json.load(open("result.json","r"))
plt.title("Game Of Life")


plt.xlabel("Dimension")
plt.ylabel("Time in Microseconds")
names={
        "thrust.o":"Thrust2D",
        # "shared-thrust.o":"Thrust2D Shared",
        # "shared-native.o":"Native Shared",
        "texture-thrust.o":"Thrust2D Texture",
        "native.o":"Native",
        "texture-native.o":"Native Texture"}
colors = {"Thrust2D":'r',"Thrust2D Shared":"g","Thrust2D Texture":"y","Native Shared":"c","Native":"b","Native Texture":"m"}
for app in  data: #sorted(data,key=lambda x: names[x[".name"]]):
    if app[".name"] not in names.keys():
        continue
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
