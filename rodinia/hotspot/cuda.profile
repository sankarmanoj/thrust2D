==18564== NVPROF is profiling process 18564, command: ./hotspot_cuda.out 1024 2 2 temp_1024 power_1024 result.out
==18564== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==18564== Profiling application: ./hotspot_cuda.out 1024 2 2 temp_1024 power_1024 result.out
==18564== Profiling result:
==18564== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: calculate_temp(int, float*, float*, float*, int, int, int, int, float, float, float, float, float, float)
          1                      dram_read_throughput                 Device Memory Read Throughput  14.079GB/s  14.079GB/s  14.078GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.725294    0.725294    0.725294
          1                         shared_efficiency                      Shared Memory Efficiency      78.14%      78.14%      78.14%
          1                            gld_efficiency                 Global Memory Load Efficiency      66.86%      66.86%      66.86%
          1                            gst_efficiency                Global Memory Store Efficiency      60.09%      60.09%      60.09%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    0.999283    0.999283    0.999283
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
