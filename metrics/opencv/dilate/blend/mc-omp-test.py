import os
import csv
import json
original_path  = os.getcwd()
path = os.path.dirname(os.getcwd()).replace("metrics/","")
app_name = os.getcwd().split("/")[-1]+".o"
os.chdir(path)
print path, app_name
fr = []
execs = [ "omp/"+app_name, "native_omp/"+app_name ]
print execs
for cores in range(1,9):
    results = {}
    for texec in execs:
        results[texec]=[]
    dims = range(100,2000,50)
    for texec in execs:
        times = {".name":texec,"dims":[]}
        print texec,
        for dim in dims:
            print str(dim)+"  "," ./%s  %d %d "%(texec,dim,cores),
            time_ms = (os.popen(" ./%s  %d %d "%(texec,dim,cores)).read())
            print time_ms
            results[texec].append((dim,float(time_ms)))
    fr.append((cores,results))
os.chdir(original_path)
json.dump(fr,open("result.json","w"),indent=4,sort_keys = True, separators=(',', ': '))
