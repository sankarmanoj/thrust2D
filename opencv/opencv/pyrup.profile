==8203== NVPROF is profiling process 8203, command: ./pyrup.o 512
==8203== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==8203== Profiling application: ./pyrup.o 512
==8203== Profiling result:
==8203== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void cv::cuda::device::imgproc::pyrUp<unsigned char>(cv::cuda::PtrStepSz<unsigned char>, unsigned char)
          1                      dram_read_throughput                 Device Memory Read Throughput  565.73MB/s  565.73MB/s  565.53MB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.903492    0.903492    0.903492
          1                         shared_efficiency                      Shared Memory Efficiency      74.40%      74.40%      74.40%
          1                            gld_efficiency                 Global Memory Load Efficiency      21.21%      21.21%      21.21%
          1                            gst_efficiency                Global Memory Store Efficiency      50.00%      50.00%      50.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
