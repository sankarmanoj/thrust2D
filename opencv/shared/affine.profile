==25284== NVPROF is profiling process 25284, command: ./affine.o 512
==25284== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==25284== Profiling application: ./affine.o 512
==25284== Profiling result:
==25284== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::for_each_kernel<unsigned char, AffineTransformFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, AffineTransformFunctor)
          1                      dram_read_throughput                 Device Memory Read Throughput  589.52MB/s  589.52MB/s  589.37MB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.948254    0.948254    0.948254
          1                         shared_efficiency                      Shared Memory Efficiency      25.00%      25.00%      25.00%
          1                            gld_efficiency                 Global Memory Load Efficiency      25.00%      25.00%      25.00%
          1                            gst_efficiency                Global Memory Store Efficiency      11.22%      11.22%      11.22%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
