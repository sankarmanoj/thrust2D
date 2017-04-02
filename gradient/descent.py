import numpy as np
valfil = open("/dev/shm/values.txt","r")
d = int(valfil.readline())
n = int(valfil.readline())
print "D = %d N = %d"%(d,n)
xval = []
for i in range(n):
    xval.append( np.fromstring(valfil.readline(),sep=" "))
xval =  np.array(xval)
print xval.shape
yactual = np.loadtxt(valfil)
real_weights = yactual[n:n+d]
weights = yactual[n+d:]
yactual = yactual[:n]
print yactual.shape,real_weights.shape,weights.shape

print weights
count = 1
learning = 0.1
try:
    for i in range(count):
        ypred = np.dot(xval,weights)

        error = ypred - yactual
        ersq = np.square(error)
        print "Error = ",error
        gradient = np.dot(np.transpose(xval),error)
        print "Gradient = ",gradient
        weights = weights - learning*gradient/n
except:
    pass
print real_weights
print weights
