==7279== NVPROF is profiling process 7279, command: ./pyrdown.o 512
==7279== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==7279== Profiling application: ./pyrdown.o 512
==7279== Profiling result:
==7279== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::for_each_kernel<unsigned char, pyrdownTransformFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, pyrdownTransformFunctor)
          1                      dram_read_throughput                 Device Memory Read Throughput  462.55MB/s  462.55MB/s  462.53MB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.902077    0.902077    0.902077
          1                         shared_efficiency                      Shared Memory Efficiency      22.50%      22.50%      22.50%
          1                            gld_efficiency                 Global Memory Load Efficiency      33.33%      33.33%      33.33%
          1                            gst_efficiency                Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
    Kernel: void thrust::convolutionRowsKernel<unsigned char, float>(unsigned char*, unsigned char, int, int, int, int, thrust::constant_vector<float>)
          1                      dram_read_throughput                 Device Memory Read Throughput  1.6922GB/s  1.6922GB/s  1.6913GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.734894    0.734894    0.734894
          1                         shared_efficiency                      Shared Memory Efficiency      25.00%      25.00%      25.00%
          1                            gld_efficiency                 Global Memory Load Efficiency      50.00%      50.00%      50.00%
          1                            gst_efficiency                Global Memory Store Efficiency      50.00%      50.00%      50.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
    Kernel: void thrust::convolutionColumnsKernel<unsigned char, float>(unsigned char*, unsigned char, int, int, int, int, thrust::constant_vector<float>)
          1                      dram_read_throughput                 Device Memory Read Throughput  0.9989GB/s  0.9989GB/s  0.9984GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.832720    0.832720    0.832720
          1                         shared_efficiency                      Shared Memory Efficiency      25.00%      25.00%      25.00%
          1                            gld_efficiency                 Global Memory Load Efficiency      50.00%      50.00%      50.00%
          1                            gst_efficiency                Global Memory Store Efficiency      50.00%      50.00%      50.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
