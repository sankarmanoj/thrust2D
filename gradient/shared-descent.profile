==11130== NVPROF is profiling process 11130, command: ./shared-descent.o 10 0.01
==11130== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==11130== Profiling application: ./shared-descent.o 10 0.01
==11130== Profiling result:
==11130== Metric result:
Invocations                               Metric Name                        Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::unary_transform_kernel<thrust::detail::normal_iterator<thrust::device_ptr<floatD>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, dotProductFunctor>(long, floatD, thrust::device_ptr<floatD>, thrust::detail::normal_iterator<thrust::device_ptr<floatD>>)
         10                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
         10                            gld_efficiency             Global Memory Load Efficiency      81.93%      82.14%      82.12%
         10                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
         10                         shared_efficiency                  Shared Memory Efficiency      37.35%      37.35%      37.35%
         10                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: void thrust::binary_transform_kernel<thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::minus<float>>(long, float, thrust::device_ptr<float>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>)
         10                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
         10                            gld_efficiency             Global Memory Load Efficiency     100.00%     100.00%     100.00%
         10                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
         10                         shared_efficiency                  Shared Memory Efficiency      97.66%      97.66%      97.66%
         10                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: void thrust::binary_reduce_kernel<float, thrust::multiplies<float>, unsigned int=256>(float*, float, float, unsigned int, float)
        200                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        200                            gld_efficiency             Global Memory Load Efficiency     100.00%     100.00%     100.00%
        200                            gst_efficiency            Global Memory Store Efficiency      12.50%      12.50%      12.50%
        200                         shared_efficiency                  Shared Memory Efficiency      97.77%      97.77%      97.77%
        200                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
          2                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          2                            gld_efficiency             Global Memory Load Efficiency       0.00%       0.00%       0.00%
          2                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
          2                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
          2                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
