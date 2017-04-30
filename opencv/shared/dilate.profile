==7385== NVPROF is profiling process 7385, command: ./dilate.o 512
==7385== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==7385== Profiling application: ./dilate.o 512
==7385== Profiling result:
==7385== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::transform_kernel<unsigned char, dilateFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, dilateFunctor)
          1                      dram_read_throughput                 Device Memory Read Throughput  507.07MB/s  507.07MB/s  506.40MB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.913736    0.913736    0.913736
          1                         shared_efficiency                      Shared Memory Efficiency      22.76%      22.76%      22.76%
          1                            gld_efficiency                 Global Memory Load Efficiency      30.82%      30.82%      30.82%
          1                            gst_efficiency                Global Memory Store Efficiency      50.00%      50.00%      50.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
