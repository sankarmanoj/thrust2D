import matplotlib.pyplot as plt
import sys
import json
data = json.load(open("result.json","r"))

Title="Affine"
plt.title(Title,y=0.92)
plt.xlabel("Dimension")
plt.ylabel("Time in Microseconds")
names = {"shared/affine.o":"Shared","opencv/affine.o":"Native","texture/affine.o":"Texture","non_shared/affine.o":"Non Shared"}
colors = {"Non Shared":"r","Shared":"g","Native":"b","Texture":'y'}
enabled={"Texture","Native"}
def getName(app):
    if names[app[".name"]]=="Native":
        return "Native"
    else:
        return "Thrust2D"
for app in data:
    if names[app[".name"]] not in enabled:
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
    plt.plot(dims,total,colors[names[app[".name"]]],label=getName(app))


plt.legend(loc=2)
plt.axis([0,1000,0,100])
plt.savefig("/home/sankarmanoj/Pictures/NT2D/"+Title+".png")
plt.show()
