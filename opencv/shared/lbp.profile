==6850== NVPROF is profiling process 6850, command: ./lbp.o 512
==6850== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==6850== Profiling application: ./lbp.o 512
==6850== Profiling result:
==6850== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::transform_kernel<unsigned char, lbpFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, lbpFunctor)
          1                      dram_read_throughput                 Device Memory Read Throughput  1.9574GB/s  1.9574GB/s  1.9567GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.915658    0.915658    0.915658
          1                         shared_efficiency                      Shared Memory Efficiency      23.24%      23.24%      23.24%
          1                            gld_efficiency                 Global Memory Load Efficiency      31.55%      31.55%      31.55%
          1                            gst_efficiency                Global Memory Store Efficiency      50.00%      50.00%      50.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
