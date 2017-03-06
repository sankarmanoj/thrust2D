==23440== NVPROF is profiling process 23440, command: ./native.o
==23440== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==23440== Profiling application: ./native.o
==23440== Profiling result:
==23440== Metric result:
Invocations                               Metric Name                        Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: blendKernel(unsigned char*, unsigned char*, unsigned char*, float, int)
        100                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        100              gld_transactions_per_request      Global Load Transactions Per Request    4.000000    4.000000    4.000000
        100              gst_transactions_per_request     Global Store Transactions Per Request    1.000000    1.000000    1.000000
        100                         shared_efficiency                  Shared Memory Efficiency       0.00%       0.00%       0.00%
