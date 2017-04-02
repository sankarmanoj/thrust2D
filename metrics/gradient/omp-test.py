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
N = range(100,2000,100) + range(2000,20000,500)
D = [x**0.5 for x in N]
for i in range(len(N)):
    comm = "python genfiles.py %d %d"%(D[i],N[i])
    print comm
    os.system(comm)
    print "Done Generating file"
    for texec in execs:
        times = {".name":texec,"dims":[]}
        print texec,
        print os.popen(" ./%s 3 0.01"%(texec))
        times["dims"].append((N[i],D[i]))

        # print times
        print "\n"

os.system("rm log.txt")
os.chdir(original_path)
json.dump(results,open("result.json","w"),indent=4,sort_keys = True, separators=(',', ': '))
