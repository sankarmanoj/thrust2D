import os
import csv
import json
original_path  = os.getcwd()
path = os.path.dirname(os.getcwd()).replace("metrics/","")
app_name = os.getcwd().split("/")[-1]+".o"
os.chdir(path)
print path, app_name
results = []
execs = [ "omp/"+app_name, "native_omp/"+app_name ]
print execs
dims = range(10,1000,20)
for texec in execs:
    times = {".name":texec,"values":[]}
    print texec,
    for dim in dims:
        stime = (os.popen(" ./%s %d 12"%(texec,dim)).read())
        try:
            time = float(stime)
            print time,"  ",texec," ",dim
            times["values"].append((dim,time))
        except:
            print stime
    results.append(times)


print "\n"

os.chdir(original_path)
json.dump(dims,open("dims.json","w"))
json.dump(results,open("result.json","w"),indent=4,sort_keys = True, separators=(',', ': '))
