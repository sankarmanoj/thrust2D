import os
import csv
import json
original_path  = os.getcwd()
path = os.getcwd().replace("metrics/","")
os.chdir(path)
print path
results = []
execs = [ x for x in  os.listdir(path) if x.partition(".")[2]=="o" ]
print execs
for texec in execs:
    dim = 8192
    times = {"a_name":texec,"dims":[]}
    while dim>32:
        os.popen("nvprof --csv --log-file log.txt ./%s %d"%(texec,dim))
        times["dims"].append(dim)
        with open("log.txt","r") as x:
            cr = csv.reader(x)
            cr.next()
            cr.next()
            cr.next()
            cr.next()
            cr.next()
            line = cr.next()
            values = len(line)
            while values > 0:
                try:
                    times[line[6][0:20]]
                except:
                    times[line[6][0:20]]=[]
                times[line[6][0:20]].append(line[3])
                line = cr.next()
                values = len(line)
        dim=dim/2
    results.append(times)

os.system("rm log.txt")
os.chdir(original_path)
json.dump(results,open("result.json","w"),sort_keys=True,indent=4, separators=(',', ': '))
