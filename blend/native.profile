==6915== NVPROF is profiling process 6915, command: ./native.o
==6915== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==6915== Profiling application: ./native.o
==6915== Profiling result:
==6915== Metric result:
Invocations                               Metric Name                        Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: blendKernel(unsigned char*, unsigned char*, unsigned char*, float, int)
          1                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          1              gld_transactions_per_request      Global Load Transactions Per Request    4.000000    4.000000    4.000000
          1              gst_transactions_per_request     Global Store Transactions Per Request    1.000000    1.000000    1.000000
          1                         shared_efficiency                  Shared Memory Efficiency       0.00%       0.00%       0.00%
          1                        shared_utilization                 Shared Memory Utilization    Idle (0)    Idle (0)    Idle (0)
