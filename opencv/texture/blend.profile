==19153== NVPROF is profiling process 19153, command: ./blend.o 4096
==19153== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==19153== Profiling application: ./blend.o 4096
==19153== Profiling result:
==19153== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::transform_texture_kernel<unsigned char, blendFunctor>(unsigned __int64, unsigned __int64, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, blendFunctor)
          1                      dram_read_throughput                 Device Memory Read Throughput  22.766GB/s  22.766GB/s  22.765GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.795302    0.795302    0.795302
          1                         shared_efficiency                      Shared Memory Efficiency       0.00%       0.00%       0.00%
          1                            gld_efficiency                 Global Memory Load Efficiency      18.75%      18.75%      18.75%
          1                            gst_efficiency                Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    0.000000    0.000000    0.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
