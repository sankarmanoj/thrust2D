==29538== NVPROF is profiling process 29538, command: ./convolve.o
==29538== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==29538== Profiling application: ./convolve.o
==29538== Profiling result:
==29538== Metric result:
Invocations                               Metric Name                        Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: conv_shared_Kernel(float const *, float const *, float*, int, int)
          1                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          1              gld_transactions_per_request      Global Load Transactions Per Request    6.637036    6.637036    6.637036
          1              gst_transactions_per_request     Global Store Transactions Per Request    3.999801    3.999801    3.999801
          1                         shared_efficiency                  Shared Memory Efficiency      99.30%      99.30%      99.30%
