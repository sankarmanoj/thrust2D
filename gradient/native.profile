==711== NVPROF is profiling process 711, command: ./native.o 1 0.01
==711== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==711== Profiling application: ./native.o 1 0.01
==711== Profiling result:
==711== Metric result:
Invocations                               Metric Name                        Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: getError(int, int, float*, float*, float*)
          1                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          1                            gld_efficiency             Global Memory Load Efficiency     100.00%     100.00%     100.00%
          1                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1                         shared_efficiency                  Shared Memory Efficiency       0.00%       0.00%       0.00%
          1                        shared_utilization                 Shared Memory Utilization    Idle (0)    Idle (0)    Idle (0)
    Kernel: void better_reduce_kernel<unsigned int=1024>(float*, float*, unsigned int, unsigned int)
          1                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          1                            gld_efficiency             Global Memory Load Efficiency     100.00%     100.00%     100.00%
          1                            gst_efficiency            Global Memory Store Efficiency      12.50%      12.50%      12.50%
          1                         shared_efficiency                  Shared Memory Efficiency      99.74%      99.74%      99.74%
          1                        shared_utilization                 Shared Memory Utilization     Low (2)     Low (2)     Low (2)
    Kernel: multiply(int, int, float*, float*, float*)
          1                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          1                            gld_efficiency             Global Memory Load Efficiency      82.56%      82.56%      82.56%
          1                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1                         shared_efficiency                  Shared Memory Efficiency       0.00%       0.00%       0.00%
          1                        shared_utilization                 Shared Memory Utilization    Idle (0)    Idle (0)    Idle (0)
