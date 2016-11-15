import os
import matplotlib.pyplot as plt
values = []
maxv = 1024
# for x in range(128,maxv,2):
#     os.system("nvprof --log-file %d.prof ./dilate.o %d"%(x,x))
for x in range(128,maxv,2):
    with open("%d.prof"%x,"r") as fi:
        output = fi.read()
        for x in output.split("\n"):
            if "transform_kernel" in x:
                values.append(float(x.strip(" ").split("us")[0].split(" ")[-1]))
plt.plot(range(128,maxv,2),values)
plt.show()
