==16134== NVPROF is profiling process 16134, command: ./scharr_filter.o 4096
==16134== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==16134== Profiling application: ./scharr_filter.o 4096
==16134== Profiling result:
==16134== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void row_filter::linearRowFilter<int=3, unsigned char, float, cv::cuda::device::BrdRowReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<float>, int, unsigned char)
          2                      dram_read_throughput                 Device Memory Read Throughput  34.678GB/s  34.683GB/s  34.680GB/s
          2                        achieved_occupancy                            Achieved Occupancy    0.952840    0.953543    0.953191
          2                         shared_efficiency                      Shared Memory Efficiency     100.00%     100.00%     100.00%
          2                            gld_efficiency                 Global Memory Load Efficiency      98.97%      98.97%      98.97%
          2                            gst_efficiency                Global Memory Store Efficiency     100.00%     100.00%     100.00%
          2      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          2                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
    Kernel: void column_filter::linearColumnFilter<int=3, float, unsigned char, cv::cuda::device::BrdColReflect101<float>>(cv::cuda::PtrStepSz<float>, cv::cuda::PtrStep<unsigned char>, int, float)
          2                      dram_read_throughput                 Device Memory Read Throughput  122.61GB/s  123.13GB/s  122.87GB/s
          2                        achieved_occupancy                            Achieved Occupancy    0.945947    0.946286    0.946116
          2                         shared_efficiency                      Shared Memory Efficiency     100.00%     100.00%     100.00%
          2                            gld_efficiency                 Global Memory Load Efficiency     100.00%     100.00%     100.00%
          2                            gst_efficiency                Global Memory Store Efficiency      50.00%      50.00%      50.00%
          2      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          2                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
