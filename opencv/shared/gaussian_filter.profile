==17043== NVPROF is profiling process 17043, command: ./gaussian_filter.o 4096
==17043== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==17043== Profiling application: ./gaussian_filter.o 4096
==17043== Profiling result:
==17043== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::convolutionRowsKernel<unsigned char, float>(unsigned char*, unsigned char, int, int, int, int, thrust::constant_vector<float>)
          1                      dram_read_throughput                 Device Memory Read Throughput  41.732GB/s  41.732GB/s  41.732GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.940292    0.940292    0.940292
          1                         shared_efficiency                      Shared Memory Efficiency      25.00%      25.00%      25.00%
          1                            gld_efficiency                 Global Memory Load Efficiency      50.00%      50.00%      50.00%
          1                            gst_efficiency                Global Memory Store Efficiency      50.00%      50.00%      50.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
    Kernel: void thrust::convolutionColumnsKernel<unsigned char, float>(unsigned char*, unsigned char, int, int, int, int, thrust::constant_vector<float>)
          1                      dram_read_throughput                 Device Memory Read Throughput  37.930GB/s  37.930GB/s  37.930GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.965821    0.965821    0.965821
          1                         shared_efficiency                      Shared Memory Efficiency      25.00%      25.00%      25.00%
          1                            gld_efficiency                 Global Memory Load Efficiency      50.00%      50.00%      50.00%
          1                            gst_efficiency                Global Memory Store Efficiency      50.00%      50.00%      50.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
