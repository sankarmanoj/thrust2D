==15697== NVPROF is profiling process 15697, command: ./affine.o 4096
==15697== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==15697== Profiling application: ./affine.o 4096
==15697== Profiling result:
==15697== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void cv::cuda::device::imgproc::warp<cv::cuda::device::imgproc::AffineTransform, cv::cuda::device::LinearFilter<cv::cuda::device::BorderReader<cv::cuda::device::imgproc::tex_warp_uchar_reader, cv::cuda::device::BrdConstant<float>>>, unsigned char>(cv::cuda::device::imgproc::tex_warp_uchar_reader, cv::cuda::PtrStepSz<float>)
          1                      dram_read_throughput                 Device Memory Read Throughput  23.935GB/s  23.935GB/s  23.935GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.834142    0.834142    0.834142
          1                         shared_efficiency                      Shared Memory Efficiency       0.00%       0.00%       0.00%
          1                            gld_efficiency                 Global Memory Load Efficiency       0.00%       0.00%       0.00%
          1                            gst_efficiency                Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    0.000000    0.000000    0.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
