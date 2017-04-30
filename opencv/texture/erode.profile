==11480== NVPROF is profiling process 11480, command: ./erode.o 512
==11480== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==11480== Profiling application: ./erode.o 512
==11480== Profiling result:
==11480== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::transform_texture_kernel<unsigned char, erodeFunctor>(unsigned __int64, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, erodeFunctor)
          1                      dram_read_throughput                 Device Memory Read Throughput  550.20MB/s  550.20MB/s  549.32MB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.830669    0.830669    0.830669
          1                         shared_efficiency                      Shared Memory Efficiency       0.00%       0.00%       0.00%
          1                            gld_efficiency                 Global Memory Load Efficiency      18.75%      18.75%      18.75%
          1                            gst_efficiency                Global Memory Store Efficiency      50.00%      50.00%      50.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    0.000000    0.000000    0.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
