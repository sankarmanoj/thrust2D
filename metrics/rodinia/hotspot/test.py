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
dims = [2**x for x in range(6,14)]
for dim in dims:
    print str(dim)+"  ",
    for texec in execs:
        times = {}
        print texec,
        print os.popen("nvprof -u us --csv --log-file log.txt ./%s %d 1 4 temp_512 power_512 result"%(texec,dim)).read()
        with open("log.txt","r") as x:
            cr = csv.reader(x)
            cr.next()
            cr.next()
            cr.next()
            cr.next()
            cr.next()
            line = cr.next()
            values = len(line)
            while values >= 6 :
                if "mempcy" not in line[6]:
                    try:
                        times[line[6]]
                    except:
                        times[line[6]]=[]
                    times[line[6]].append((float(line[3]),dim))
                line = cr.next()
                values = len(line)
    results[texec].append(times)
    print "\n"

os.system("rm log.txt")
os.chdir(original_path)
json.dump(results,open("result.json","w"),indent=4,sort_keys = True, separators=(',', ': '))
