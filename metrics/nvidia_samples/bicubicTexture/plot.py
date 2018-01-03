import matplotlib.pyplot as plt
import sys
import json
data = json.load(open("result.json","r"))
Title="BicubicTexture"
plt.title(Title,y=0.92)
plt.xlabel("Dimension")
plt.ylabel("Time in Microseconds")
names = {"thrust":"Non Shared","shared":"Shared","native":"Native","texture":"Texture"}
colors = {"Non Shared":"r","Shared":"g","Native":"b","Texture":'y'}
for app in data:
    values = data[app]
    dims  = []
    total = []
    for x in values:
        dims.append(x[0])
        total.append(x[1])
    plt.plot(dims,total,colors[names[app]],label=names[app])

plt.legend(loc=2)
plt.axis([0,1000,0,350])
plt.savefig("/home/sankarmanoj/Pictures/NT2D/"+Title+".png")
plt.show()
