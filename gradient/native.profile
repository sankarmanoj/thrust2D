==934== NVPROF is profiling process 934, command: ./native.o 1 0.01
==934== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==934== Profiling application: ./native.o 1 0.01
==934== Profiling result:
==934== Metric result:
Invocations                               Metric Name                        Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: update_weights(float*, float*, float)
          1                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          1                            gld_efficiency             Global Memory Load Efficiency     100.00%     100.00%     100.00%
          1                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1                         shared_efficiency                  Shared Memory Efficiency       0.00%       0.00%       0.00%
    Kernel: getdotError(int, int, float*, float*, float*)
          1                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          1                            gld_efficiency             Global Memory Load Efficiency      89.02%      89.02%      89.02%
          1                            gst_efficiency            Global Memory Store Efficiency      99.98%      99.98%      99.98%
          1                         shared_efficiency                  Shared Memory Efficiency       0.00%       0.00%       0.00%
    Kernel: void better_reduce_kernel<unsigned int=256>(float*, float*, float*, unsigned int, unsigned int)
        139                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        139                            gld_efficiency             Global Memory Load Efficiency      88.89%     100.00%      94.48%
        139                            gst_efficiency            Global Memory Store Efficiency      12.50%      12.50%      12.50%
        139                         shared_efficiency                  Shared Memory Efficiency      98.74%      98.74%      98.74%
