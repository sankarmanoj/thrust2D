==20033== NVPROF is profiling process 20033, command: ./native.o 1 0.01
==20033== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==20033== Profiling application: ./native.o 1 0.01
==20033== Profiling result:
==20033== Metric result:
Invocations                               Metric Name                        Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: getdotError(int, int, float*, float*, float*)
          1                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          1                            gld_efficiency             Global Memory Load Efficiency     100.00%     100.00%     100.00%
          1                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1                         shared_efficiency                  Shared Memory Efficiency       0.00%       0.00%       0.00%
    Kernel: void better_reduce_kernel<unsigned int=1024>(float*, float*, float*, unsigned int, unsigned int)
       1000                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
       1000                            gld_efficiency             Global Memory Load Efficiency     100.00%     100.00%     100.00%
       1000                            gst_efficiency            Global Memory Store Efficiency      12.50%      12.50%      12.50%
       1000                         shared_efficiency                  Shared Memory Efficiency      99.56%      99.56%      99.56%
