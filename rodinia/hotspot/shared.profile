==13900== NVPROF is profiling process 13900, command: ./hotspot_shared.out 512 2 2 temp_512 power_512 result.out
==13900== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==13900== Profiling application: ./hotspot_shared.out 512 2 2 temp_512 power_512 result.out
==13900== Profiling result:
==13900== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::for_each_kernel<float, HotspotFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, HotspotFunctor)
          1                      dram_read_throughput                 Device Memory Read Throughput  11.465GB/s  11.465GB/s  11.465GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.977967    0.977967    0.977967
          1                         shared_efficiency                      Shared Memory Efficiency      91.38%      91.38%      91.38%
          1                            gld_efficiency                 Global Memory Load Efficiency      55.74%      55.74%      55.74%
          1                            gst_efficiency                Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    0.562744    0.562744    0.562744
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
