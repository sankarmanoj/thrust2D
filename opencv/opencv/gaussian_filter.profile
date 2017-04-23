==15363== NVPROF is profiling process 15363, command: ./gaussian_filter.o 4096
==15363== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==15363== Profiling application: ./gaussian_filter.o 4096
==15363== Profiling result:
==15363== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void row_filter::linearRowFilter<int=5, unsigned char, float, cv::cuda::device::BrdRowReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<float>, int, unsigned char)
          1                      dram_read_throughput                 Device Memory Read Throughput  34.279GB/s  34.279GB/s  34.278GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.955835    0.955835    0.955835
          1                         shared_efficiency                      Shared Memory Efficiency     100.00%     100.00%     100.00%
          1                            gld_efficiency                 Global Memory Load Efficiency      98.97%      98.97%      98.97%
          1                            gst_efficiency                Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
    Kernel: void column_filter::linearColumnFilter<int=5, float, unsigned char, cv::cuda::device::BrdColReflect101<float>>(cv::cuda::PtrStepSz<float>, cv::cuda::PtrStep<unsigned char>, int, float)
          1                      dram_read_throughput                 Device Memory Read Throughput  125.13GB/s  125.13GB/s  125.13GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.950053    0.950053    0.950053
          1                         shared_efficiency                      Shared Memory Efficiency     100.00%     100.00%     100.00%
          1                            gld_efficiency                 Global Memory Load Efficiency     100.00%     100.00%     100.00%
          1                            gst_efficiency                Global Memory Store Efficiency      50.00%      50.00%      50.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
