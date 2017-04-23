==15255== NVPROF is profiling process 15255, command: ./pyrup.o 4096
==15255== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==15255== Profiling application: ./pyrup.o 4096
==15255== Profiling result:
==15255== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void cv::cuda::device::imgproc::pyrUp<unsigned char>(cv::cuda::PtrStepSz<unsigned char>, unsigned char)
          1                      dram_read_throughput                 Device Memory Read Throughput  5.2152GB/s  5.2152GB/s  5.2145GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.909836    0.909836    0.909836
          1                         shared_efficiency                      Shared Memory Efficiency      74.40%      74.40%      74.40%
          1                            gld_efficiency                 Global Memory Load Efficiency      20.45%      20.45%      20.45%
          1                            gst_efficiency                Global Memory Store Efficiency      50.00%      50.00%      50.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
