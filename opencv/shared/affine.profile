==17644== NVPROF is profiling process 17644, command: ./affine.o 4096
==17644== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==17644== Profiling application: ./affine.o 4096
==17644== Profiling result:
==17644== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::for_each_kernel<unsigned char, AffineTransformFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, AffineTransformFunctor)
          1                      dram_read_throughput                 Device Memory Read Throughput  6.4101GB/s  6.4101GB/s  6.4094GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.948104    0.948104    0.948104
          1                         shared_efficiency                      Shared Memory Efficiency      25.00%      25.00%      25.00%
          1                            gld_efficiency                 Global Memory Load Efficiency      25.00%      25.00%      25.00%
          1                            gst_efficiency                Global Memory Store Efficiency      11.22%      11.22%      11.22%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
