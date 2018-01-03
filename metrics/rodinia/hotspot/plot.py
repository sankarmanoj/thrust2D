import matplotlib.pyplot as plt
import sys
import json
data = json.load(open("result.json","r"))
Title="Hotspot"
plt.title(Title,y=0.92)


plt.xlabel("Dimension")
plt.ylabel("Time in Microseconds")
keys = data.keys()
print keys
names={"hotspot_shared.out":"Shared","hotspot_cuda.out":"Native","hotspot.out":"Non Shared"}
colors = {"Non Shared":"r","Shared":"g","Native":"b","Texture":'y'}
enabled = {"Native","Non Shared"}
def getName(app):
    if names[app]=="Native":
        return "Native"
    else:
        return "Thrust2D"
for key in keys:
    if names[key] not in enabled:
        continue
    dims = []
    dot = []
    grad = []
    total = []
    for val in data[key]:
        dims.append(val[1])
        total.append(val[0])
    plt.plot(dims,total,colors[names[key]],label=getName(key))
    # plt.plot(dims,total,label=key[:-2]+" Total")
    # plt.plot(dims,dot,label=key+" Dot")
    # plt.plot(dims,grad,label=key+" Grad")
plt.legend(loc=2)
plt.savefig("/home/sankarmanoj/Pictures/NT2D/"+Title+".png")
plt.show()
