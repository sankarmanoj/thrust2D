import matplotlib.pyplot as plt
import sys
import json
data = json.load(open("result.json","r"))
names = []
for entry in data:
    names.append(entry[".name"])
print "Choose Application to plot"
for x in range(len(names)):
    print "%d : %s"%(x,names[x])
try:
    sel_num = int(raw_input())
except:
    print "Invalid Input"
    sys.exit()
if sel_num not in range(len(names)):
    print "Invalid Input"
    sys.exit()

print "Selected Appliction is %s"%(names[sel_num])
app_data = data[sel_num]
dims = app_data['dims']
plt.xlabel("Dimension")
plt.ylabel("Time in microseconds")
plt.title("%s"%app_data[".name"])
keys = app_data.keys()
keys.remove("dims")
keys.remove(".name")
for key in keys:
    # try:
    plt.plot(dims,app_data[key],label=key[0:100])
    # except:
    #     print "ERROR!!"
    #     print key
    #     print dims
    #     print app_data[key]
# print keys
plt.legend()
plt.show()
