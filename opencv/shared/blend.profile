==17941== NVPROF is profiling process 17941, command: ./blend.o 4096
==17941== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==17941== Profiling application: ./blend.o 4096
==17941== Profiling result:
==17941== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::binary_transform_kernel<unsigned char, blendFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, blendFunctor)
          1                      dram_read_throughput                 Device Memory Read Throughput  21.753GB/s  21.753GB/s  21.753GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.921108    0.921108    0.921108
          1                         shared_efficiency                      Shared Memory Efficiency      25.00%      25.00%      25.00%
          1                            gld_efficiency                 Global Memory Load Efficiency      37.50%      37.50%      37.50%
          1                            gst_efficiency                Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
