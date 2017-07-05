import numpy
import argparse
parser = argparse.ArgumentParser(description="Randomly Generate Value Files for Linear Regression")
parser.add_argument('number',metavar='N',type=int,help='Number of Sample Points')
args = parser.parse_args()
n = args.number
d = int(n**0.5)
output = open("/dev/shm/values.txt","w")
output.write("%d\n%d\n"%(d,args.number))
xvals = (numpy.random.rand(n,d))
# print xvals
# print xvals.mean(axis=0)
# print xvals.std(axis=0)
weight = numpy.random.rand(d,1)
yvals =  numpy.dot(xvals,weight)
rweight = numpy.random.rand(d,1)
numpy.savetxt(output,xvals,'%9.8f',)
numpy.savetxt(output,yvals,'%9.8f',)
numpy.savetxt(output,weight,'%9.8f',)
numpy.savetxt(output,rweight,'%9.8f',)
