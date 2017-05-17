import os
import csv
import json
original_path  = os.getcwd()
path = os.getcwd().replace("metrics/","")
os.chdir(path)
print path
fr = []
results = {}
execs = [ x for x in  os.listdir(path) if x.partition(".")[2]=="o" ]
print execs
for cores in range(1,9):
    results = {}
    for texec in execs:
        results[texec]=[]
    dims = range(100,2000,100) + range(2000,10000,200)
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
