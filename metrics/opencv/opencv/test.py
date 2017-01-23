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
dims = [32,64,96,128,256,384,512,768,1024,1280,1536,1792,2049]
for texec in execs:
    times = {".name":texec,"dims":[]}
    print texec,
    for dim in dims:
        print str(dim)+"  ",
        os.popen("nvprof -u us --csv --log-file log.txt ./%s %d"%(texec,dim))
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
            while values >=6:
                try:
                    times[line[6]]
                except:
                    times[line[6]]=[]
                times[line[6]].append(line[3])
                line = cr.next()
                values = len(line)
    results.append(times)
    print "\n"

os.system("rm log.txt")
os.chdir(original_path)
json.dump(results,open("result.json","w"),indent=4,sort_keys = True, separators=(',', ': '))
