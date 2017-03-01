==4806== NVPROF is profiling process 4806, command: ./ns_thrust_p_f.o -x 128 -y 128 -z 1000 -np 100
==4806== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==4806== Profiling application: ./ns_thrust_p_f.o -x 128 -y 128 -z 1000 -np 100
==4806== Profiling result:
==4806== Metric result:
Invocations                               Metric Name                        Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: <normalize_weightsYOYOYOYO, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
       1998                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
       1998                            gld_efficiency             Global Memory Load Efficiency     100.00%     100.00%     100.00%
       1998                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
       1998                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
       1998                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: binary_transform_functor<update_coordsYOYOYOYO>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
       1998                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
       1998                            gld_efficiency             Global Memory Load Efficiency      67.05%      98.68%      96.59%
       1998                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
       1998                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
       1998                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: binary_transform_functor<randn_transformYOYOYOYO>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
       1998                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
       1998                            gld_efficiency             Global Memory Load Efficiency      98.04%      98.04%      98.04%
       1998                            gst_efficiency            Global Memory Store Efficiency      98.68%      98.68%      98.68%
       1998                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
       1998                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: <update_uYOYOYOYO, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
        999                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        999                            gld_efficiency             Global Memory Load Efficiency     100.00%     100.00%     100.00%
        999                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
        999                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
        999                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::counting_iterator<long, thrust::use_default, thrust::use_default, long>, thrust::detail::normal_iterator<thrust::device_ptr<double>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::system::detail::generic::sequence_detail::sequence_functor<double>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
        999                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        999                            gld_efficiency             Global Memory Load Efficiency       0.00%       0.00%       0.00%
        999                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
        999                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
        999                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: binary_transform_functor<calc_likelihood_sumYOYOYOYO>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
        999                         branch_efficiency                         Branch Efficiency      91.65%     100.00%      99.34%
        999                            gld_efficiency             Global Memory Load Efficiency       7.97%      12.29%      11.90%
        999                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
        999                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
        999                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<int>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<int>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
          3                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          3                            gld_efficiency             Global Memory Load Efficiency       0.00%       0.00%       0.00%
          3                            gst_efficiency            Global Memory Store Efficiency      96.15%      99.94%      97.42%
          3                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
          3                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: binary_transform_functor<exp_transformYOYOYOYO>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
        999                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        999                            gld_efficiency             Global Memory Load Efficiency     100.00%     100.00%     100.00%
        999                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
        999                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
        999                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: wrapped_function<ind_calcYOYOYOYO, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
        999                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        999                            gld_efficiency             Global Memory Load Efficiency      87.96%      87.96%      87.96%
        999                            gst_efficiency            Global Memory Store Efficiency      12.50%      12.50%      12.50%
        999                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
        999                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    <!-- Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::counting_iterator<long, thrust::use_default, thrust::use_default, long>, thrust::detail::normal_iterator<thrust::device_ptr<int>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::system::detail::generic::sequence_detail::sequence_functor<int>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
          1                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          1                            gld_efficiency             Global Memory Load Efficiency       0.00%       0.00%       0.00%
          1                            gst_efficiency            Global Memory Store Efficiency      96.15%      96.15%      96.15%
          1                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
          1                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1) -->
    <!-- Kernel: <thrust::detail::device_generate_functor<thrust::detail::fill_functor<double>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
        999                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        999                            gld_efficiency             Global Memory Load Efficiency       0.00%       0.00%       0.00%
        999                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
        999                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
        999                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1) -->
    Kernel: binary_transform_functor<get_indexYOYOYOYO>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
        999                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        999                            gld_efficiency             Global Memory Load Efficiency      29.41%      81.82%      31.43%
        999                            gst_efficiency            Global Memory Store Efficiency      96.15%      96.15%      96.15%
        999                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
        999                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=128, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=7>, unsigned long=128>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::reduce_detail::reduce_partitions, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=1>, thrust::detail::normal_iterator<thrust::device_ptr<double>>, thrust::system::cuda::detail::aligned_decomposition<long>, thrust::detail::normal_iterator<thrust::pointer<double, thrust::system::cuda::detail::tag, thrust::use_default, thrust::use_default>>, double, thrust::plus<double>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=7)
        999                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        999                            gld_efficiency             Global Memory Load Efficiency     100.00%     100.00%     100.00%
        999                            gst_efficiency            Global Memory Store Efficiency      25.00%      25.00%      25.00%
        999                         shared_efficiency                  Shared Memory Efficiency      44.91%      44.91%      44.91%
        999                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=512, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=3>, unsigned long=512>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::scan_detail::inclusive_scan_n, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=1>, thrust::detail::normal_iterator<thrust::device_ptr<double>>, long, thrust::detail::normal_iterator<thrust::device_ptr<double>>, thrust::plus<double>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=3)
        999                         branch_efficiency                         Branch Efficiency      99.85%      99.85%      99.85%
        999                            gld_efficiency             Global Memory Load Efficiency      65.34%      65.34%      65.34%
        999                            gst_efficiency            Global Memory Store Efficiency      86.21%      86.21%      86.21%
        999                         shared_efficiency                  Shared Memory Efficiency      74.19%      74.19%      74.19%
        999                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    <!-- Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<double>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<double>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
          6                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          6                            gld_efficiency             Global Memory Load Efficiency       0.00%       0.00%       0.00%
          6                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
          6                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
          6                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1) -->
