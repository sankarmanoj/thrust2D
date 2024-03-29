import os
import csv
import json
original_path  = os.getcwd()
path = os.getcwd().replace("metrics/","")
os.chdir(path)
print path
results = {}
execs = [ x for x in  os.listdir(path) if x.partition(".")[2]=="out" ]
print execs
for texec in execs:
    results[texec]=[]
dims = range(100,4000,200) + range(2000,20000,450)
for texec in execs:
    times = {".name":texec,"dims":[]}
    print texec,
    for dim in dims:
        print str(dim)+"  ",
        time_ms = (os.popen(" ./%s  %d 1"%(texec,dim)).read())
        print time_ms
        results[texec].append((dim,float(time_ms)))
        # print "\n"

os.system("rm log.txt")
os.chdir(original_path)
json.dump(results,open("result.json","w"),indent=4,sort_keys = True, separators=(',', ': '))
