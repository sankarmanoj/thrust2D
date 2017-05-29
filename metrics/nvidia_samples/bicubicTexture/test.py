import os
import csv
import json
original_path  = os.getcwd()
path = os.getcwd().replace("metrics/","")
os.chdir(path)
print path
results = {"thrust":[],"native":[]}
texec ="bicubicTexture"
dims = range(10,1000,20)
for dim in dims:
    print os.popen("nvprof -u us --csv --log-file log.txt ./%s -file bob %d"%(texec,dim)).read()
    print dim
    Ttime = float(0)
    Ntime = float(0)
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
            if "memcpy" not in line[6] and "memset" not in line[6] and "fill" not in line[6]:
                if "thrust" in line[6]:
                    Ttime += float(line[3])
                else:
                    Ntime+= float(line[3])
            line = cr.next()
            values = len(line)
    results["thrust"].append((dim,Ttime))
    results["native"].append((dim,Ntime))



print "\n"

os.system("rm log.txt")
os.chdir(original_path)
json.dump(results,open("result.json","w"),indent=4,sort_keys = True, separators=(',', ': '))
