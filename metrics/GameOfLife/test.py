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
dims = range(10,1000,20)
for texec in execs:
    times = {".name":texec}
    print texec,
    for dim in dims:
        os.popen("nvprof -u us --csv --log-file log.txt ./%s %d"%(texec,dim))
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
                if "memcpy" not in line[6] and "memset" not in line[6] and "fill" not in line[6] and "GOL" in line[6]:
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
json.dump(results,open("result.json","w"),indent=4,sort_keys = True, separators=(',', ': '))
