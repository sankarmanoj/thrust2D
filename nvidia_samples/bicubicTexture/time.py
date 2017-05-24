x = open("output","r")
y = x.readline()
count = 0
thrust = 0
native = 0
while y:
    n,t = y.split(" ")
    thrust += float(t)
    native += float(n)
    count  += 1
    y = x.readline()
print "Native ",native," /",count, "=",native/count
print "Thrust ",thrust," /",count, "=",thrust/count
