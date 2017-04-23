==16023== NVPROF is profiling process 16023, command: ./blend.o 4096
==16023== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==16023== Profiling application: ./blend.o 4096
==16023== Profiling result:
==16023== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void cv::cudev::grid_transform_detail::transformSmart<int=4, unsigned char, unsigned char, unsigned char, _GLOBAL__N__47_tmpxft_00005e96_00000000_7_add_weighted_cpp1_ii_71482d89::AddWeightedOp<unsigned char, unsigned char, unsigned char, float>, cv::cudev::WithOutMask>(cv::cudev::GlobPtr<unsigned char>, cv::cudev::grid_transform_detail::transformSmart<int=4, unsigned char, unsigned char, unsigned char, _GLOBAL__N__47_tmpxft_00005e96_00000000_7_add_weighted_cpp1_ii_71482d89::AddWeightedOp<unsigned char, unsigned char, unsigned char, float, unsigned char>, cv::cudev::WithOutMask>, cv::cudev::grid_transform_detail::transformSmart<int=4, unsigned char, unsigned char, unsigned char, _GLOBAL__N__47_tmpxft_00005e96_00000000_7_add_weighted_cpp1_ii_71482d89::AddWeightedOp<unsigned char, unsigned char, unsigned char, float, unsigned char>, cv::cudev::WithOutMask>, unsigned char, unsigned char, int, int)
          1                      dram_read_throughput                 Device Memory Read Throughput  127.87GB/s  127.87GB/s  127.87GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.828589    0.828589    0.828589
          1                         shared_efficiency                      Shared Memory Efficiency       0.00%       0.00%       0.00%
          1                            gld_efficiency                 Global Memory Load Efficiency     100.00%     100.00%     100.00%
          1                            gst_efficiency                Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    0.000000    0.000000    0.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
