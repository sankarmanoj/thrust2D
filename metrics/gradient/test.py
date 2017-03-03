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
N = [1100,1300,1500,1800,2000,2500,3000,4500,5000,6000,7500,8000,9000,10000,12000,13000,14500,15000,16000,17000,18000,19000,20000,21000,22000,24000,25000,26000,27000,28000,29000,30000,32000]
D = [x/10 for x in N]
for i in range(len(N)):
    comm = "python genfiles.py %d %d"%(D[i],N[i])
    print comm
    os.system(comm)
    print "Done Generating file"
    for texec in execs:
        times = {".name":texec,"dims":[]}
        print texec,
        os.popen("nvprof -u us --csv --log-file log.txt ./%s 3 0.01"%(texec))
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
                    dt+=float(line[3])
                if "reduce" or "multiplies" in line[6]:
                    gt+=float(line[3])
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
