==16788== NVPROF is profiling process 16788, command: ./pyrup.o 4096
==16788== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==16788== Profiling application: ./pyrup.o 4096
==16788== Profiling result:
==16788== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::for_each_kernel<unsigned char, pyrupTransformFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, pyrupTransformFunctor)
          1                      dram_read_throughput                 Device Memory Read Throughput  13.957GB/s  13.957GB/s  13.956GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.926771    0.926771    0.926771
          1                         shared_efficiency                      Shared Memory Efficiency      22.50%      22.50%      22.50%
          1                            gld_efficiency                 Global Memory Load Efficiency      35.29%      35.29%      35.29%
          1                            gst_efficiency                Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
    Kernel: void thrust::convolutionRowsKernel<unsigned char, float>(unsigned char*, unsigned char, int, int, int, int, thrust::constant_vector<float>)
          1                      dram_read_throughput                 Device Memory Read Throughput  51.037GB/s  51.037GB/s  51.036GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.891795    0.891795    0.891795
          1                         shared_efficiency                      Shared Memory Efficiency      25.00%      25.00%      25.00%
          1                            gld_efficiency                 Global Memory Load Efficiency      50.00%      50.00%      50.00%
          1                            gst_efficiency                Global Memory Store Efficiency      50.00%      50.00%      50.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
    Kernel: void thrust::convolutionColumnsKernel<unsigned char, float>(unsigned char*, unsigned char, int, int, int, int, thrust::constant_vector<float>)
          1                      dram_read_throughput                 Device Memory Read Throughput  46.401GB/s  46.401GB/s  46.400GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.969281    0.969281    0.969281
          1                         shared_efficiency                      Shared Memory Efficiency      25.00%      25.00%      25.00%
          1                            gld_efficiency                 Global Memory Load Efficiency      50.00%      50.00%      50.00%
          1                            gst_efficiency                Global Memory Store Efficiency      50.00%      50.00%      50.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
