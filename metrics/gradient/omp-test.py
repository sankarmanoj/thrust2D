import os
import csv
import json
original_path  = os.getcwd()
path = os.getcwd().replace("metrics/","")
os.chdir(path)
print path
results = {}
execs = [ x for x in  os.listdir(path) if x.partition(".")[2]=="o" ]
print execs
for texec in execs:
    results[texec]=[]
N = range(100,3000,100) + range(3000,20000,500)
D = [x**0.5 for x in N]
for i in range(len(N)):
    comm = "python genfiles.py %d %d"%(D[i],N[i])
    print comm
    os.popen(comm,'r')
    print "Done Generating file"
    for texec in execs:
        times = {".name":texec,"dims":[]}
        time_ms =  float(os.popen(" ./%s 1000 0.01"%(texec),'r').read())*1000
        print "Time in MS = ",time_ms
        results[texec].append((N[i],time_ms))
        print "\n"

os.system("rm log.txt")
os.chdir(original_path)
json.dump(results,open("result.json","w"),indent=4,sort_keys = True, separators=(',', ': '))
