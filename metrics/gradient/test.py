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
N = [100,150,200,300,500,750,900,1100,1300,1500,1800,2000,2500,300,4500,5000,6000,7500,8000,9000,10000,12000,13000,14500,15000,16000,18000,19000,20000]
D = [x/10 for x in N]
for x in range(2):
    os.system("python genfiles.py %d %d"%(D[x],N[x]))
    for texec in execs:
        times = {".name":texec,"dims":[]}
        print texec,
        os.popen("nvprof -u us --csv --log-file log.txt ./%s 3 0.01"%(texec))
        times["dims"].append((N[x],D[x]))
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
