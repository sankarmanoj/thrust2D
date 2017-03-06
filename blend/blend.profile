==6974== NVPROF is profiling process 6974, command: ./blend.o
==6974== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==6974== Profiling application: ./blend.o
==6974== Profiling result:
==6974== Metric result:
Invocations                               Metric Name                        Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::detail::normal_iterator<thrust::device_ptr<unsigned char>>, thrust::detail::normal_iterator<thrust::device_ptr<unsigned char>>, thrust::detail::normal_iterator<thrust::device_ptr<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<blendFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
          1                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          1              gld_transactions_per_request      Global Load Transactions Per Request    4.000000    4.000000    4.000000
          1              gst_transactions_per_request     Global Store Transactions Per Request    1.000000    1.000000    1.000000
          1                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
          1                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
          1                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          1              gld_transactions_per_request      Global Load Transactions Per Request    0.000000    0.000000    0.000000
          1              gst_transactions_per_request     Global Store Transactions Per Request    1.000000    1.000000    1.000000
          1                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
          1                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
