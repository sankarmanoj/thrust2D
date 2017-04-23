==13865== NVPROF is profiling process 13865, command: ./lbp.o 4096
==13865== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==13865== Profiling application: ./lbp.o 4096
==13865== Profiling result:
==13865== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<lbpFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
          1                      dram_read_throughput                 Device Memory Read Throughput  7.2244GB/s  7.2244GB/s  7.2243GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.517002    0.517002    0.517002
          1                         shared_efficiency                      Shared Memory Efficiency       3.12%       3.12%       3.12%
          1                            gld_efficiency                 Global Memory Load Efficiency      44.48%      44.48%      44.48%
          1                            gst_efficiency                Global Memory Store Efficiency      66.67%      66.67%      66.67%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    0.000000    0.000000    0.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
