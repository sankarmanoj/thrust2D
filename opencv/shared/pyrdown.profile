==17752== NVPROF is profiling process 17752, command: ./pyrdown.o 4096
==17752== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==17752== Profiling application: ./pyrdown.o 4096
==17752== Profiling result:
==17752== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::for_each_kernel<unsigned char, pyrdownTransformFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, pyrdownTransformFunctor)
          1                      dram_read_throughput                 Device Memory Read Throughput  18.040GB/s  18.040GB/s  18.040GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.929864    0.929864    0.929864
          1                         shared_efficiency                      Shared Memory Efficiency      22.50%      22.50%      22.50%
          1                            gld_efficiency                 Global Memory Load Efficiency      33.33%      33.33%      33.33%
          1                            gst_efficiency                Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
    Kernel: void thrust::convolutionRowsKernel<unsigned char, float>(unsigned char*, unsigned char, int, int, int, int, thrust::constant_vector<float>)
          1                      dram_read_throughput                 Device Memory Read Throughput  43.416GB/s  43.416GB/s  43.415GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.948435    0.948435    0.948435
          1                         shared_efficiency                      Shared Memory Efficiency      25.00%      25.00%      25.00%
          1                            gld_efficiency                 Global Memory Load Efficiency      50.00%      50.00%      50.00%
          1                            gst_efficiency                Global Memory Store Efficiency      50.00%      50.00%      50.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
    Kernel: void thrust::convolutionColumnsKernel<unsigned char, float>(unsigned char*, unsigned char, int, int, int, int, thrust::constant_vector<float>)
          1                      dram_read_throughput                 Device Memory Read Throughput  39.364GB/s  39.364GB/s  39.364GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.965471    0.965471    0.965471
          1                         shared_efficiency                      Shared Memory Efficiency      25.00%      25.00%      25.00%
          1                            gld_efficiency                 Global Memory Load Efficiency      50.00%      50.00%      50.00%
          1                            gst_efficiency                Global Memory Store Efficiency      50.00%      50.00%      50.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
