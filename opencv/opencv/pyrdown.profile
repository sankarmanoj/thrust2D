==15808== NVPROF is profiling process 15808, command: ./pyrdown.o 4096
==15808== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==15808== Profiling application: ./pyrdown.o 4096
==15808== Profiling result:
==15808== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void cv::cuda::device::imgproc::pyrDown<unsigned char, cv::cuda::device::BrdReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<cv::cuda::PtrStepSz>, unsigned char, int)
          1                      dram_read_throughput                 Device Memory Read Throughput  26.803GB/s  26.803GB/s  26.803GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.899518    0.899518    0.899518
          1                         shared_efficiency                      Shared Memory Efficiency      82.42%      82.42%      82.42%
          1                            gld_efficiency                 Global Memory Load Efficiency      80.25%      80.25%      80.25%
          1                            gst_efficiency                Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    2.000000    2.000000    2.000000
          1                         branch_efficiency                             Branch Efficiency      99.89%      99.89%      99.89%
