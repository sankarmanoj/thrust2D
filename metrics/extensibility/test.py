import os
import csv
import json
original_path  = os.getcwd()
path = os.getcwd().replace("metrics/","")
os.chdir(path)
print path
results = []
execs = execs = [ x for x in  os.listdir(path) if ".o" in x ]
print execs
dims = range(10,1000,20)
for texec in execs:
    times = {".name":texec}
    print texec,
    for dim in dims:
        print os.popen("nvprof -u us --csv --log-file log.txt ./%s 100 0.5  %d %d"%(texec,dim,dim)).read()
        print dim
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
                if "gemm"  in line[6]:
                    try:
                        times[line[6]]
                    except:
                        times[line[6]]=[]
                    times[line[6]].append((dim,float(line[3])))
                line = cr.next()
                values = len(line)
    results.append(times)


print "\n"

os.system("rm log.txt")
os.chdir(original_path)
json.dump(dims,open("dims.json","w"))
json.dump(results,open("result.json","w"),indent=4,sort_keys = True, separators=(',', ': '))
