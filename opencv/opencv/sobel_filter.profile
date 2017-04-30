==8420== NVPROF is profiling process 8420, command: ./sobel_filter.o 512
==8420== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==8420== Profiling application: ./sobel_filter.o 512
==8420== Profiling result:
==8420== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void row_filter::linearRowFilter<int=3, unsigned char, float, cv::cuda::device::BrdRowReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<float>, int, unsigned char)
          2                      dram_read_throughput                 Device Memory Read Throughput  23.389GB/s  24.855GB/s  24.103GB/s
          2                        achieved_occupancy                            Achieved Occupancy    0.806903    0.822631    0.814767
          2                         shared_efficiency                      Shared Memory Efficiency     100.00%     100.00%     100.00%
          2                            gld_efficiency                 Global Memory Load Efficiency      92.31%      92.31%      92.31%
          2                            gst_efficiency                Global Memory Store Efficiency     100.00%     100.00%     100.00%
          2      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          2                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
    Kernel: void column_filter::linearColumnFilter<int=3, float, unsigned char, cv::cuda::device::BrdColReflect101<float>>(cv::cuda::PtrStepSz<float>, cv::cuda::PtrStep<unsigned char>, int, float)
          2                      dram_read_throughput                 Device Memory Read Throughput  64.652GB/s  69.399GB/s  66.941GB/s
          2                        achieved_occupancy                            Achieved Occupancy    0.848546    0.871068    0.859807
          2                         shared_efficiency                      Shared Memory Efficiency     100.00%     100.00%     100.00%
          2                            gld_efficiency                 Global Memory Load Efficiency     100.00%     100.00%     100.00%
          2                            gst_efficiency                Global Memory Store Efficiency      50.00%      50.00%      50.00%
          2      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          2                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
