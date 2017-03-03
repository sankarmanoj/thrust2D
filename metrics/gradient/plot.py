import matplotlib.pyplot as plt
import sys
import json
data = json.load(open("result.json","r"))


plt.xlabel("Dimension")
plt.ylabel("Time in microseconds")
keys = data.keys()
f1 = plt.figure().add_subplot(111)
f2 = plt.figure().add_subplot(111)
f3 = plt.figure().add_subplot(111)
for key in keys:
    dims = []
    dot = []
    grad = []
    total = []
    for val in data[key]:
        dims.append(val[0])
        dot.append(val[1][0])
        grad.append(val[1][1])
        total.append(val[1][1]+val[1][0])
    f1.plot(dims,total,label=key[:-2]+" Total")
    f2.plot(dims,dot,label=key+" Dot")
    f3.plot(dims,grad,label=key+" Grad")
    f1
    # plt.plot(dims,total,label=key[:-2]+" Total")
    # plt.plot(dims,dot,label=key+" Dot")
    # plt.plot(dims,grad,label=key+" Grad")
plt.legend(loc=2)
f1.legend(loc=2)
f2.legend(loc=2)
f3.legend(loc=2)
plt.show()
