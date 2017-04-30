==12600== NVPROF is profiling process 12600, command: ./srad.out 502 458 0.5 100 image.pgm image_out.pgm
==12600== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==12600== Profiling application: ./srad.out 502 458 0.5 100 image.pgm image_out.pgm
==12600== Profiling result:
==12600== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::transform_kernel<float, SRADFunctor1>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, SRADFunctor1)
        100                      dram_read_throughput                 Device Memory Read Throughput  13.151GB/s  14.732GB/s  13.879GB/s
        100                        achieved_occupancy                            Achieved Occupancy    0.897163    0.918316    0.907228
        100                         shared_efficiency                      Shared Memory Efficiency      82.80%      82.80%      82.80%
        100                            gld_efficiency                 Global Memory Load Efficiency      50.89%      50.89%      50.89%
        100                            gst_efficiency                Global Memory Store Efficiency      79.51%      79.51%      79.51%
        100      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
        100                         branch_efficiency                             Branch Efficiency      98.61%     100.00%      99.98%
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<extractFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
          1                      dram_read_throughput                 Device Memory Read Throughput  39.669GB/s  39.669GB/s  39.668GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.900468    0.900468    0.900468
          1                         shared_efficiency                      Shared Memory Efficiency       3.12%       3.12%       3.12%
          1                            gld_efficiency                 Global Memory Load Efficiency      59.31%      59.31%      59.31%
          1                            gst_efficiency                Global Memory Store Efficiency      81.75%      81.75%      81.75%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    0.000000    0.000000    0.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<square>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
        100                      dram_read_throughput                 Device Memory Read Throughput  766.75MB/s  25.116GB/s  20.792GB/s
        100                        achieved_occupancy                            Achieved Occupancy    0.950596    0.959533    0.955481
        100                         shared_efficiency                      Shared Memory Efficiency       3.12%       3.12%       3.12%
        100                            gld_efficiency                 Global Memory Load Efficiency      48.62%      48.62%      48.62%
        100                            gst_efficiency                Global Memory Store Efficiency      81.75%      81.75%      81.75%
        100      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    0.000000    0.000000    0.000000
        100                         branch_efficiency                             Branch Efficiency      99.99%      99.99%      99.99%
    Kernel: void thrust::transform_kernel<float, SRADFunctor2>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, SRADFunctor2)
        100                      dram_read_throughput                 Device Memory Read Throughput  24.747GB/s  42.803GB/s  40.949GB/s
        100                        achieved_occupancy                            Achieved Occupancy    0.906653    0.913829    0.910516
        100                         shared_efficiency                      Shared Memory Efficiency      77.88%      77.88%      77.88%
        100                            gld_efficiency                 Global Memory Load Efficiency      71.30%      71.30%      71.30%
        100                            gst_efficiency                Global Memory Store Efficiency      79.51%      79.51%      79.51%
        100      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
        100                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<compressFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
          1                      dram_read_throughput                 Device Memory Read Throughput  40.640GB/s  40.640GB/s  40.640GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.947479    0.947479    0.947479
          1                         shared_efficiency                      Shared Memory Efficiency       3.12%       3.12%       3.12%
          1                            gld_efficiency                 Global Memory Load Efficiency      59.31%      59.31%      59.31%
          1                            gst_efficiency                Global Memory Store Efficiency      81.75%      81.75%      81.75%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    0.000000    0.000000    0.000000
          1                         branch_efficiency                             Branch Efficiency      99.99%      99.99%      99.99%
    Kernel: void thrust::generic_reduce_kernel<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, float, unsigned int=1024, thrust::plus<float>>(float, float*, unsigned int, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>)
        200                      dram_read_throughput                 Device Memory Read Throughput  777.60MB/s  46.166GB/s  25.037GB/s
        200                        achieved_occupancy                            Achieved Occupancy    0.960623    0.978604    0.970016
        200                         shared_efficiency                      Shared Memory Efficiency     100.00%     100.00%     100.00%
        200                            gld_efficiency                 Global Memory Load Efficiency      59.31%      59.31%      59.31%
        200                            gst_efficiency                Global Memory Store Efficiency      12.50%      12.50%      12.50%
        200      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    0.240310    0.240310    0.240310
        200                         branch_efficiency                             Branch Efficiency      99.99%      99.99%      99.99%
