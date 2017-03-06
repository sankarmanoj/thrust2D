==23317== NVPROF is profiling process 23317, command: ./sblend.o
==23317== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==23317== Profiling application: ./sblend.o
==23317== Profiling result:
==23317== Metric result:
Invocations                               Metric Name                        Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::binary_transform_kernel<thrust::detail::normal_iterator<thrust::device_ptr<unsigned char>>, thrust::detail::normal_iterator<thrust::device_ptr<unsigned char>>, thrust::detail::normal_iterator<thrust::device_ptr<unsigned char>>, blendFunctor>(long, unsigned char, thrust::device_ptr<unsigned char>, thrust::detail::normal_iterator<thrust::device_ptr<unsigned char>>, thrust::detail::normal_iterator<thrust::device_ptr<unsigned char>>)
        100                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        100              gld_transactions_per_request      Global Load Transactions Per Request    4.000000    4.000000    4.000000
        100              gst_transactions_per_request     Global Store Transactions Per Request    1.000000    1.000000    1.000000
        100                         shared_efficiency                  Shared Memory Efficiency      25.00%      25.00%      25.00%
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
          1                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          1              gld_transactions_per_request      Global Load Transactions Per Request    0.000000    0.000000    0.000000
          1              gst_transactions_per_request     Global Store Transactions Per Request    1.000000    1.000000    1.000000
          1                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
