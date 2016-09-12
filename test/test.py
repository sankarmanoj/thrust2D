import subprocess
import numpy as np
import matplotlib.pyplot as plt
block_dim = 10
i = 0
a = np.zeros((100,26),dtype=float)
while (block_dim <= 1000):
    kernel_dim = 1
    j = 0
    while(kernel_dim <= 51):
        a[i][j] = float (subprocess.Popen("./a.out %d %d" % (block_dim,kernel_dim), shell=True, stdout=subprocess.PIPE).stdout.read().decode('ascii').strip('\n'))
        # print (j)
        kernel_dim += 2
        j += 1
    block_dim += 10
    i += 1
plt.imshow(a)
plt.show()
