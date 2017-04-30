==6636== NVPROF is profiling process 6636, command: ./pyrup.o 512
==6636== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==6636== Profiling application: ./pyrup.o 512
==6636== Profiling result:
==6636== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::for_each_kernel<unsigned char, pyrupTransformFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, pyrupTransformFunctor)
          1                      dram_read_throughput                 Device Memory Read Throughput  9.6182GB/s  9.6182GB/s  9.6178GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.922615    0.922615    0.922615
          1                         shared_efficiency                      Shared Memory Efficiency      22.50%      22.50%      22.50%
          1                            gld_efficiency                 Global Memory Load Efficiency      35.29%      35.29%      35.29%
          1                            gst_efficiency                Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
    Kernel: void thrust::convolutionRowsKernel<unsigned char, float>(unsigned char*, unsigned char, int, int, int, int, thrust::constant_vector<float>)
          1                      dram_read_throughput                 Device Memory Read Throughput  34.189GB/s  34.189GB/s  34.188GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.890415    0.890415    0.890415
          1                         shared_efficiency                      Shared Memory Efficiency      25.00%      25.00%      25.00%
          1                            gld_efficiency                 Global Memory Load Efficiency      50.00%      50.00%      50.00%
          1                            gst_efficiency                Global Memory Store Efficiency      50.00%      50.00%      50.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
    Kernel: void thrust::convolutionColumnsKernel<unsigned char, float>(unsigned char*, unsigned char, int, int, int, int, thrust::constant_vector<float>)
          1                      dram_read_throughput                 Device Memory Read Throughput  31.744GB/s  31.744GB/s  31.743GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.900277    0.900277    0.900277
          1                         shared_efficiency                      Shared Memory Efficiency      25.00%      25.00%      25.00%
          1                            gld_efficiency                 Global Memory Load Efficiency      50.00%      50.00%      50.00%
          1                            gst_efficiency                Global Memory Store Efficiency      50.00%      50.00%      50.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
