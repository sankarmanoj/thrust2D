==11332== NVPROF is profiling process 11332, command: ./descent.o 10 0.01
==11332== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==11332== Profiling application: ./descent.o 10 0.01
==11332== Profiling result:
==11332== Metric result:
Invocations                               Metric Name                        Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: unary_transform_functor<dotProductFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
         10                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
         10                            gld_efficiency             Global Memory Load Efficiency      82.14%      82.14%      82.14%
         10                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
         10                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
         10                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: binary_transform_functor<thrust::minus<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
         10                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
         10                            gld_efficiency             Global Memory Load Efficiency     100.00%     100.00%     100.00%
         10                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
         10                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
         10                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: binary_transform_functor<thrust::multiplies<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
        200                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        200                            gld_efficiency             Global Memory Load Efficiency     100.00%     100.00%     100.00%
        200                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
        200                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
        200                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: reduce_detail::reduce_partitions, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=1>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::system::cuda::detail::aligned_decomposition<long>, thrust::detail::normal_iterator<thrust::pointer<float, thrust::system::cuda::detail::tag, thrust::use_default, thrust::use_default>>, float, thrust::plus<float>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=7)
        200                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        200                            gld_efficiency             Global Memory Load Efficiency      97.19%      97.19%      97.19%
        200                            gst_efficiency            Global Memory Store Efficiency      12.50%      12.50%      12.50%
        200                         shared_efficiency                  Shared Memory Efficiency      42.67%      42.67%      42.67%
        200                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: reduce_partitions, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=1>, thrust::detail::normal_iterator<thrust::pointer<float, thrust::system::cuda::detail::tag, thrust::use_default, thrust::use_default>>, thrust::detail::normal_iterator<thrust::pointer<float, thrust::system::cuda::detail::tag, thrust::use_default, thrust::use_default>>, thrust::detail::normal_iterator<thrust::pointer<float, thrust::system::cuda::detail::tag, thrust::use_default, thrust::use_default>>, thrust::plus<float>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=7)
        200                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        200                            gld_efficiency             Global Memory Load Efficiency      12.50%      12.50%      12.50%
        200                            gst_efficiency            Global Memory Store Efficiency      12.50%      12.50%      12.50%
        200                         shared_efficiency                  Shared Memory Efficiency      41.46%      41.46%      41.46%
        200                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
