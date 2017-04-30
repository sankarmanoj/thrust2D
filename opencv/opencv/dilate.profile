==8852== NVPROF is profiling process 8852, command: ./dilate.o 512
==8852== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==8852== Profiling application: ./dilate.o 512
==8852== Profiling result:
==8852== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void ForEachTupleByteQuad<unsigned char, int=1, TupleByteQuadFunctor<unsigned char, int=1, DilateReplicateBorderQuadNewFunctor<unsigned char, int=1>>>(Tuple8<unsigned char, int=1>*, int, NppiSize, unsigned char)
          1                      dram_read_throughput                 Device Memory Read Throughput  13.163GB/s  13.163GB/s  13.163GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.259261    0.259261    0.259261
          1                         shared_efficiency                      Shared Memory Efficiency       0.00%       0.00%       0.00%
          1                            gld_efficiency                 Global Memory Load Efficiency      40.47%      40.47%      40.47%
          1                            gst_efficiency                Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    0.000000    0.000000    0.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
    Kernel: void cv::cudev::grid_copy_detail::copy<cv::cudev::RemapPtr1<cv::cudev::BrdBase<cv::cudev::BrdReflect101, cv::cudev::GlobPtr<unsigned char>>, _GLOBAL__N__51_tmpxft_00005e52_00000000_7_copy_make_border_cpp1_ii_71482d89::ShiftMap>, unsigned char, cv::cudev::WithOutMask>(cv::cudev::BrdReflect101, cv::cudev::GlobPtr<unsigned char>, cv::cudev::GlobPtr<unsigned char>, int, int)
          1                      dram_read_throughput                 Device Memory Read Throughput  12.994GB/s  12.994GB/s  12.994GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.876924    0.876924    0.876924
          1                         shared_efficiency                      Shared Memory Efficiency       0.00%       0.00%       0.00%
          1                            gld_efficiency                 Global Memory Load Efficiency      50.10%      50.10%      50.10%
          1                            gst_efficiency                Global Memory Store Efficiency      95.22%      95.22%      95.22%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    0.000000    0.000000    0.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
