==8312== NVPROF is profiling process 8312, command: ./gaussian_filter.o 512
==8312== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==8312== Profiling application: ./gaussian_filter.o 512
==8312== Profiling result:
==8312== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void row_filter::linearRowFilter<int=5, unsigned char, float, cv::cuda::device::BrdRowReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<float>, int, unsigned char)
          1                      dram_read_throughput                 Device Memory Read Throughput  26.983GB/s  26.983GB/s  26.982GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.873680    0.873680    0.873680
          1                         shared_efficiency                      Shared Memory Efficiency     100.00%     100.00%     100.00%
          1                            gld_efficiency                 Global Memory Load Efficiency      92.31%      92.31%      92.31%
          1                            gst_efficiency                Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
    Kernel: void column_filter::linearColumnFilter<int=5, float, unsigned char, cv::cuda::device::BrdColReflect101<float>>(cv::cuda::PtrStepSz<float>, cv::cuda::PtrStep<unsigned char>, int, float)
          1                      dram_read_throughput                 Device Memory Read Throughput  82.845GB/s  82.845GB/s  82.845GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.899062    0.899062    0.899062
          1                         shared_efficiency                      Shared Memory Efficiency     100.00%     100.00%     100.00%
          1                            gld_efficiency                 Global Memory Load Efficiency     100.00%     100.00%     100.00%
          1                            gst_efficiency                Global Memory Store Efficiency      50.00%      50.00%      50.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
