==8744== NVPROF is profiling process 8744, command: ./pyrdown.o 512
==8744== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==8744== Profiling application: ./pyrdown.o 512
==8744== Profiling result:
==8744== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void cv::cuda::device::imgproc::pyrDown<unsigned char, cv::cuda::device::BrdReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<cv::cuda::PtrStepSz>, unsigned char, int)
          1                      dram_read_throughput                 Device Memory Read Throughput  901.62MB/s  901.62MB/s  901.22MB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.891793    0.891793    0.891793
          1                         shared_efficiency                      Shared Memory Efficiency      80.38%      80.38%      80.38%
          1                            gld_efficiency                 Global Memory Load Efficiency      73.92%      73.92%      73.92%
          1                            gst_efficiency                Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    2.000000    2.000000    2.000000
          1                         branch_efficiency                             Branch Efficiency      99.13%      99.13%      99.13%
