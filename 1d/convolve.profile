==11142== NVPROF is profiling process 11142, command: ./convolve.o
==11142== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==11142== Profiling application: ./convolve.o
==11142== Profiling result:
==11142== Metric result:
Invocations                               Metric Name                        Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: conv_shared_Kernel(float const *, float const *, float*, int, int)
          1                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          1                            gld_efficiency             Global Memory Load Efficiency      49.49%      49.49%      49.49%
          1                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1                         shared_efficiency                  Shared Memory Efficiency      99.30%      99.30%      99.30%
          1                        shared_utilization                 Shared Memory Utilization     Low (2)     Low (2)     Low (2)
