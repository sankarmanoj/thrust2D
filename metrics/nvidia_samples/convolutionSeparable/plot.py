import matplotlib.pyplot as plt
import sys
import json
data = json.load(open("result.json","r"))
Title="ConvolutionSeparable"
plt.title(Title,y=0.92)


plt.xlabel("Dimension")
plt.ylabel("Time in Microseconds")
names = {"convolutionSeparable-thrust.out":"Shared","convolutionSeparable.out":"Native"}
colors = {"Non Shared":"r","Shared":"g","Native":"b"}
def getName(app):
    if names[app[".name"]]=="Native":
        return "Native"
    else:
        return "Thrust2D"
for app in data:
    dims = []
    total = []
    keys = app.keys()
    print app['.name']
    keys.remove(".name")

    print "Size = ",
    for key in keys:
        print len(app[key])," ",
    print ""
    nkeys = len(keys)
    for pos in range(len(app[keys[0]])):
        dims.append(app[keys[0]][pos][0])
        tval = 0
        for x in range(nkeys):
            try:
                tval+=app[keys[x]][pos][1]
            except:
                print "Value does not exist at ",keys[x],":",pos,"for ",app['.name']
        total.append(tval)
    plt.plot(dims,total,colors[names[app[".name"]]],label=getName(app))

plt.legend(loc=2)
plt.savefig("/home/sankarmanoj/Pictures/NT2D/"+Title+".png")
plt.show()
