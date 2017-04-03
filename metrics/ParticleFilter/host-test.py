import os
import csv
import json
original_path  = os.getcwd()
path = os.getcwd().replace("metrics/","")
os.chdir(path)
print path
results = {}
p_names = ["likelihood_kernel","normalize_weights_kernel","find_index_kernel","sum_kernel","YOYOYO","scan_","reduce"]
execs = [ x for x in  os.listdir(path) if x.partition(".")[2]=="o" ]
print execs
for texec in execs:
    results[texec]=[]
dims = range(100,2000,100) + range(2000,10000,200)
for texec in execs:
    times = {".name":texec,"dims":[]}
    print texec,
    for dim in dims:
        print str(dim)+"  ",
        time_ms = (os.popen(" ./%s -x  128	-y 128 -z 10 -np %d"%(texec,dim)).read())
        print time_ms
        results[texec].append((dim,float(time_ms)))
        # print "\n"

os.system("rm log.txt")
os.chdir(original_path)
json.dump(results,open("result.json","w"),indent=4,sort_keys = True, separators=(',', ': '))