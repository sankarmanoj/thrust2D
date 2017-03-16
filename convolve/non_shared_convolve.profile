==29505== NVPROF is profiling process 29505, command: ./non_shared_convolve.o
==29505== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==29505== Profiling application: ./non_shared_convolve.o
==29505== Profiling result:
==29505== Metric result:
Invocations                               Metric Name                        Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::conv_Kernel<float>(float const *, float const , thrust::conv_Kernel<float>*, int, int)
          1                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          1              gld_transactions_per_request      Global Load Transactions Per Request    6.705683    6.705683    6.705683
          1              gst_transactions_per_request     Global Store Transactions Per Request    3.999801    3.999801    3.999801
          1                         shared_efficiency                  Shared Memory Efficiency       0.00%       0.00%       0.00%
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
          3                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          3              gld_transactions_per_request      Global Load Transactions Per Request    0.000000    0.000000    0.000000
          3              gst_transactions_per_request     Global Store Transactions Per Request    3.000000    4.000000    3.666667
          3                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
