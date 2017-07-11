import os
import csv
import json
original_path  = os.getcwd()
path = os.path.dirname(os.getcwd()).replace("metrics/","")
app_name = os.getcwd().split("/")[-1]+".o"
os.chdir(path)
print path, app_name
results = []
execs = [ "shared/"+app_name, "non_shared/"+app_name,"opencv/"+app_name ]
print execs
dims = [128*x for x in range(1,9)]
for texec in execs:
    times = {".name":texec}
    print texec,
    for dim in dims:
        print os.popen("sudo nvprof -u us --csv --log-file log.txt ./%s %d"%(texec,dim)).read()
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
                if "memcpy" not in line[6] and "memset" not in line[6]:
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
