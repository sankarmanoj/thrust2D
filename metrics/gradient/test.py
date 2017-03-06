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
N = range(100,2000,100) + range(2000,10000,500) + range(10000,25000,1000)
D = [x**0.5 for x in N]
for i in range(len(N)):
    comm = "python genfiles.py %d %d"%(D[i],N[i])
    print comm
    os.system(comm)
    print "Done Generating file"
    for texec in execs:
        times = {".name":texec,"dims":[]}
        print texec,
        os.popen("nvprof --unified-memory-profiling off -u us --csv --log-file log.txt ./%s 3 0.01"%(texec))
        times["dims"].append((N[i],D[i]))
        with open("log.txt","r") as x:
            cr = csv.reader(x)
            cr.next()
            cr.next()
            cr.next()
            cr.next()
            cr.next()
            line = cr.next()
            values = len(line)
            dt = 0
            gt = 0
            while values >= 6 :
                if "dot" in line[6]:
                    dt+=float(line[1])
                if "reduce" or "multiplies" in line[6]:
                    gt+=float(line[1])
                line = cr.next()
                values = len(line)
            print "DOT = ",dt
            print "GRADIENT = ",gt
            results[texec].append((N[i],(dt,gt)))
        # print times
        print "\n"

os.system("rm log.txt")
os.chdir(original_path)
json.dump(results,open("result.json","w"),indent=4,sort_keys = True, separators=(',', ': '))
