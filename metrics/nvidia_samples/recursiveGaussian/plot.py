import matplotlib.pyplot as plt
import sys
import json
data = json.load(open("result.json","r"))
plt.title("RecursiveGaussian")

plt.xlabel("Dimension")
plt.ylabel("Time in Microseconds")
names = {"thrust_bilateralFilter":"Non Shared","shared_bilateralFilter":"Shared","_bilateralFilter":"Native","texture_bilateralFilter":"Texture"}
colors = {"Non Shared":"r","thrust":"g","native":"b","Texture":'y'}
for app in data:
    values = data[app]
    dims  = []
    total = []
    for x in values:
        dims.append(x[0])
        total.append(x[1])
    plt.plot(dims,total,colors[app],label=app)

plt.legend(loc=2)

plt.show()
