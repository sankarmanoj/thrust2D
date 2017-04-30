==13951== NVPROF is profiling process 13951, command: ./hotspot_cuda.out 512 2 2 temp_512 power_512 result.out
==13951== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==13951== Profiling application: ./hotspot_cuda.out 512 2 2 temp_512 power_512 result.out
==13951== Profiling result:
==13951== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: calculate_temp(int, float*, float*, float*, int, int, int, int, float, float, float, float, float, float)
          1                      dram_read_throughput                 Device Memory Read Throughput  13.600GB/s  13.600GB/s  13.599GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.722903    0.722903    0.722903
          1                         shared_efficiency                      Shared Memory Efficiency      78.08%      78.08%      78.08%
          1                            gld_efficiency                 Global Memory Load Efficiency      66.93%      66.93%      66.93%
          1                            gst_efficiency                Global Memory Store Efficiency      60.95%      60.95%      60.95%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    0.999042    0.999042    0.999042
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
