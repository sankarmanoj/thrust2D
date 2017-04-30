==19198== NVPROF is profiling process 19198, command: ./hotspot_shared.out 512 2 2 temp_512 power_512 result.out
==19198== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==19198== Profiling application: ./hotspot_shared.out 512 2 2 temp_512 power_512 result.out
==19198== Profiling result:
==19198== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::transform_kernel<float, HotspotFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, HotspotFunctor)
          1                      dram_read_throughput                 Device Memory Read Throughput  15.686GB/s  15.686GB/s  15.685GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.922903    0.922903    0.922903
          1                         shared_efficiency                      Shared Memory Efficiency      92.06%      92.06%      92.06%
          1                            gld_efficiency                 Global Memory Load Efficiency      58.70%      58.70%      58.70%
          1                            gst_efficiency                Global Memory Store Efficiency       0.00%       0.00%       0.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
