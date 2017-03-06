==14920== NVPROF is profiling process 14920, command: ./shared-descent.o 1 0.01
==14920== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==14920== Profiling application: ./shared-descent.o 1 0.01
==14920== Profiling result:
==14920== Metric result:
Invocations                               Metric Name                        Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::binary_transform_kernel<thrust::detail::normal_iterator<thrust::device_ptr<floatD>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, dotProductFunctor>(long, floatD, thrust::device_ptr<floatD>, thrust::detail::normal_iterator<thrust::device_ptr<floatD>>, float)
          1                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          1                            gld_efficiency             Global Memory Load Efficiency      82.21%      82.21%      82.21%
          1                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1                         shared_efficiency                  Shared Memory Efficiency      41.16%      41.16%      41.16%
    Kernel: void thrust::binary_reduce_kernel<float, thrust::multiplies<float>, unsigned int=1024>(float*, float, float, unsigned int, float)
       1000                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
       1000                            gld_efficiency             Global Memory Load Efficiency     100.00%     100.00%     100.00%
       1000                            gst_efficiency            Global Memory Store Efficiency      12.50%      12.50%      12.50%
       1000                         shared_efficiency                  Shared Memory Efficiency      99.56%      99.56%      99.56%
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
          2                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          2                            gld_efficiency             Global Memory Load Efficiency       0.00%       0.00%       0.00%
          2                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
          2                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
