==18103== NVPROF is profiling process 18103, command: ./scharr_filter.o 4096
==18103== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==18103== Profiling application: ./scharr_filter.o 4096
==18103== Profiling result:
==18103== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::convolutionRowsKernel<unsigned char, float>(unsigned char*, unsigned char, int, int, int, int, thrust::constant_vector<float>)
          2                      dram_read_throughput                 Device Memory Read Throughput  41.640GB/s  41.763GB/s  41.700GB/s
          2                        achieved_occupancy                            Achieved Occupancy    0.937260    0.939781    0.938521
          2                         shared_efficiency                      Shared Memory Efficiency      25.00%      25.00%      25.00%
          2                            gld_efficiency                 Global Memory Load Efficiency      50.00%      50.00%      50.00%
          2                            gst_efficiency                Global Memory Store Efficiency      50.00%      50.00%      50.00%
          2      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          2                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
          1                      dram_read_throughput                 Device Memory Read Throughput  14.383GB/s  14.383GB/s  14.382GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.995781    0.995781    0.995781
          1                         shared_efficiency                      Shared Memory Efficiency       3.12%       3.12%       3.12%
          1                            gld_efficiency                 Global Memory Load Efficiency      35.23%      35.23%      35.23%
          1                            gst_efficiency                Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    0.000000    0.000000    0.000000
          1                         branch_efficiency                             Branch Efficiency      89.48%      89.48%      89.48%
    Kernel: void thrust::convolutionColumnsKernel<unsigned char, float>(unsigned char*, unsigned char, int, int, int, int, thrust::constant_vector<float>)
          2                      dram_read_throughput                 Device Memory Read Throughput  37.963GB/s  37.979GB/s  37.970GB/s
          2                        achieved_occupancy                            Achieved Occupancy    0.965117    0.965425    0.965271
          2                         shared_efficiency                      Shared Memory Efficiency      25.00%      25.00%      25.00%
          2                            gld_efficiency                 Global Memory Load Efficiency      50.00%      50.00%      50.00%
          2                            gst_efficiency                Global Memory Store Efficiency      50.00%      50.00%      50.00%
          2      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
          2                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
