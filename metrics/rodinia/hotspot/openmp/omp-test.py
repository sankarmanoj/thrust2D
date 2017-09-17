import os
import csv
import json
original_path  = os.getcwd()
path = os.getcwd().replace("metrics/","")
os.chdir(path)
results = []
execs = [ f for f in os.listdir(path) if os.path.isfile(f) and os.access(f,os.X_OK) ]
print execs
dims = range(16,1000,16)
for texec in execs:
    times = {".name":texec,"values":[]}
    print texec,
    for dim in dims:
        time = float(os.popen(" ./%s %d %d 200 12 temp_512 power_512 result"%(texec,dim,dim)).read())
        print time,"  ",texec," ",dim
        times["values"].append((dim,time))
    results.append(times)


print "\n"

os.chdir(original_path)
json.dump(dims,open("dims.json","w"))
json.dump(results,open("result.json","w"),indent=4,sort_keys = True, separators=(',', ': '))
