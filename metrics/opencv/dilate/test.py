import os
import csv
import json
original_path  = os.getcwd()
path = os.path.dirname(os.getcwd()).replace("metrics/","")
app_name = os.getcwd().split("/")[-1]+".o"
os.chdir(path)
print path, app_name
results = []
execs = [ "shared/"+app_name, "non_shared/"+app_name,"opencv/"+app_name ]
print execs
dims = range(1000,5000,500) + range(5000,20000,1000)
for texec in execs:
    times = {".name":texec,"values":[]}
    print texec,
    for dim in dims:
        print str(dim)+"  ",
        time_ms = (os.popen("  ./%s  %d 1"%(texec,dim)).read())
        print time_ms
        times["values"].append((dim,float(time_ms)))
    results.append(times)
    print "\n"

os.system("rm log.txt")
os.chdir(original_path)
json.dump(results,open("result.json","w"),indent=4,sort_keys = True, separators=(',', ': '))
