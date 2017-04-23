==15589== NVPROF is profiling process 15589, command: ./erode.o 4096
==15589== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==15589== Profiling application: ./erode.o 4096
==15589== Profiling result:
==15589== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void cv::cudev::grid_copy_detail::copy<cv::cudev::RemapPtr1<cv::cudev::BrdBase<cv::cudev::BrdReflect101, cv::cudev::GlobPtr<unsigned char>>, _GLOBAL__N__51_tmpxft_00005e52_00000000_7_copy_make_border_cpp1_ii_71482d89::ShiftMap>, unsigned char, cv::cudev::WithOutMask>(cv::cudev::BrdReflect101, cv::cudev::GlobPtr<unsigned char>, cv::cudev::GlobPtr<unsigned char>, int, int)
          1                      dram_read_throughput                 Device Memory Read Throughput  16.202GB/s  16.202GB/s  16.201GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.805450    0.805450    0.805450
          1                         shared_efficiency                      Shared Memory Efficiency       0.00%       0.00%       0.00%
          1                            gld_efficiency                 Global Memory Load Efficiency      50.01%      50.01%      50.01%
          1                            gst_efficiency                Global Memory Store Efficiency      99.37%      99.37%      99.37%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    0.000000    0.000000    0.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
    Kernel: void ForEachTupleByteQuad<unsigned char, int=1, TupleByteQuadFunctor<unsigned char, int=1, ErodeReplicateBorderQuadNewFunctor<unsigned char, int=1>>>(Tuple8<unsigned char, int=1>*, int, NppiSize, unsigned char)
          1                      dram_read_throughput                 Device Memory Read Throughput  31.848GB/s  31.848GB/s  31.848GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.482433    0.482433    0.482433
          1                         shared_efficiency                      Shared Memory Efficiency       0.00%       0.00%       0.00%
          1                            gld_efficiency                 Global Memory Load Efficiency      40.47%      40.47%      40.47%
          1                            gst_efficiency                Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    0.000000    0.000000    0.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
