import matplotlib.pyplot as plt
import sys
import json
data = json.load(open("result.json","r"))
Title="Pyrdown"
plt.title(Title,y=0.92)
plt.xlabel("Dimension")
plt.ylabel("Time in Microseconds")
names = {"non_shared/pyrdown.o":"Non Shared","shared/pyrdown.o":"Shared","opencv/pyrdown.o":"Native"}
colors = {"Non Shared":"r","Shared":"g","Native":"b"}
enabled={"Shared","Native"}
def getName(app):
    if names[app[".name"]]=="Native":
        return "Native"
    else:
        return "Thrust2D"
for app in data:
    if names[app[".name"]] not in enabled:
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
    print total
    while 0 in total:
        index = total.index(0)
        print "Removing ",index, " ", total[index]
        del dims[index]
        del total[index]
    plt.plot(dims,total,colors[names[app[".name"]]],label=getName(app))

plt.legend(loc=2)
# plt.axis([0,1000,0,160])
plt.savefig("/home/sankarmanoj/Pictures/NT2D/"+Title+".png")
plt.show()
