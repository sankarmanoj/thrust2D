==18891== NVPROF is profiling process 18891, command: ./sobel_filter.o 4096
==18891== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==18891== Profiling application: ./sobel_filter.o 4096
==18891== Profiling result:
==18891== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::transform_texture_kernel<unsigned char, thrust::convolutionFunctor<unsigned char, float>>(unsigned __int64, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, unsigned char)
          2                      dram_read_throughput                 Device Memory Read Throughput  9.3930GB/s  9.3978GB/s  9.3943GB/s
          2                        achieved_occupancy                            Achieved Occupancy    0.886554    0.887258    0.886906
          2                         shared_efficiency                      Shared Memory Efficiency       0.00%       0.00%       0.00%
          2                            gld_efficiency                 Global Memory Load Efficiency      21.88%      21.88%      21.88%
          2                            gst_efficiency                Global Memory Store Efficiency      50.00%      50.00%      50.00%
          2      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    0.000000    0.000000    0.000000
          2                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
          1                      dram_read_throughput                 Device Memory Read Throughput  13.776GB/s  13.776GB/s  13.776GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.995701    0.995701    0.995701
          1                         shared_efficiency                      Shared Memory Efficiency       3.12%       3.12%       3.12%
          1                            gld_efficiency                 Global Memory Load Efficiency      35.23%      35.23%      35.23%
          1                            gst_efficiency                Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    0.000000    0.000000    0.000000
          1                         branch_efficiency                             Branch Efficiency      99.93%      99.93%      99.93%
