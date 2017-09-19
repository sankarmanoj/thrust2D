import os
import csv
import json
original_path  = os.getcwd()
path = os.getcwd().replace("metrics/","")
os.chdir(path)
print path
results = {}
p_names = ["likelihood","normalize_weights","find_index_kernel","sum_kernel","YOYOYO","randn_transform","scan_","reduce","ind_calc","exp_transform","update_u","get_index","update_coord"]
execs = [ x for x in  os.listdir(path) if x.partition(".")[2]=="o" ]
print execs
for texec in execs:
    results[texec]=[]
dims = [500]
for texec in execs:
    times = {".name":texec,"dims":[]}
    print texec,
    for dim in dims:
        print str(dim)+"  ",
        os.system("nvprof --unified-memory-profiling off -u us --csv --log-file log.txt ./%s -x  128	-y 128 -z 10 -np %d"%(texec,dim))
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
            tval=0
            while values >= 6 :
                for n in p_names:
                    if n in line[6]:
                        tval+=float(line[1])
                line = cr.next()
                values = len(line)
            if tval!=0:
                results[texec].append((dim,tval))
    print "\n"

os.system("rm log.txt")
os.chdir(original_path)
json.dump(results,open("result.json","w"),indent=4,sort_keys = True, separators=(',', ': '))
