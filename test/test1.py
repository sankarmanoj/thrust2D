import subprocess
import numpy as np
import matplotlib.pyplot as plt
block_dim = 1000
a = np.zeros((41),dtype=float)
b = np.zeros((41),dtype=float)
kernel_dim = 1
j = 0
while(kernel_dim <= 81):
    a[j] = float (subprocess.Popen("./a.out %d %d" % (block_dim,kernel_dim), shell=True, stdout=subprocess.PIPE).stdout.read().decode('ascii').strip('\n'))
    # print (j)
    kernel_dim += 2
    j += 1

kernel_dim = 9
block_dim = 10
j = 0
while(block_dim <= 1230):
    b[j] = float (subprocess.Popen("./a.out %d %d" % (block_dim,kernel_dim), shell=True, stdout=subprocess.PIPE).stdout.read().decode('ascii').strip('\n'))
    # print (j)
    block_dim += 30
    j += 1

plt.plot(np.arange(0, 41, 1),a)
plt.plot(np.arange(0, 41,1),b)
plt.show()
