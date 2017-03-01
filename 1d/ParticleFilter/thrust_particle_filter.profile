==16454== NVPROF is profiling process 16454, command: ./thrust_particle_filter.o -x 128 -y 128 -z 1000 -np 100
==16454== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==16454== Profiling application: ./thrust_particle_filter.o -x 128 -y 128 -z 1000 -np 100
==16454== Profiling result:
==16454== Metric result:
Invocations                               Metric Name                        Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::for_each_kernel<thrust::detail::normal_iterator<thrust::device_ptr<int>>, ind_calcYOYOYOYO>(long, int, thrust::device_ptr<int>)
        999                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        999                            gld_efficiency             Global Memory Load Efficiency      87.96%      87.96%      87.96%
        999                            gst_efficiency            Global Memory Store Efficiency      12.66%      12.66%      12.66%
        999                         shared_efficiency                  Shared Memory Efficiency      78.12%      78.12%      78.12%
        999                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::counting_iterator<long, thrust::use_default, thrust::use_default, long>, thrust::detail::normal_iterator<thrust::device_ptr<double>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::system::detail::generic::sequence_detail::sequence_functor<double>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
        999                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        999                            gld_efficiency             Global Memory Load Efficiency       0.00%       0.00%       0.00%
        999                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
        999                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
        999                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<int>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<int>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
          3                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          3                            gld_efficiency             Global Memory Load Efficiency       0.00%       0.00%       0.00%
          3                            gst_efficiency            Global Memory Store Efficiency      96.15%      99.94%      97.42%
          3                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
          3                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: void thrust::binary_transform_kernel<thrust::detail::normal_iterator<thrust::device_ptr<double>>, thrust::detail::normal_iterator<thrust::device_ptr<double>>, thrust::detail::normal_iterator<thrust::device_ptr<int>>, get_indexYOYOYOYO>(long, double, thrust::device_ptr<double>, thrust::detail::normal_iterator<thrust::device_ptr<double>>, thrust::detail::normal_iterator<thrust::device_ptr<double>>)
        999                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        999                            gld_efficiency             Global Memory Load Efficiency      33.33%      94.44%      36.47%
        999                            gst_efficiency            Global Memory Store Efficiency      96.15%      96.15%      96.15%
        999                         shared_efficiency                  Shared Memory Efficiency      78.12%      78.12%      78.12%
        999                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::counting_iterator<long, thrust::use_default, thrust::use_default, long>, thrust::detail::normal_iterator<thrust::device_ptr<int>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::system::detail::generic::sequence_detail::sequence_functor<int>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
          1                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          1                            gld_efficiency             Global Memory Load Efficiency       0.00%       0.00%       0.00%
          1                            gst_efficiency            Global Memory Store Efficiency      96.15%      96.15%      96.15%
          1                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
          1                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: void thrust::for_each_kernel<thrust::detail::normal_iterator<thrust::device_ptr<double>>, update_uYOYOYOYO>(long, double, thrust::device_ptr<double>)
        999                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        999                            gld_efficiency             Global Memory Load Efficiency     100.00%     100.00%     100.00%
        999                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
        999                         shared_efficiency                  Shared Memory Efficiency      78.12%      78.12%      78.12%
        999                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: void thrust::for_each_kernel<thrust::detail::normal_iterator<thrust::device_ptr<double>>, normalize_weightsYOYOYOYO>(long, double, thrust::device_ptr<double>)
       1998                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
       1998                            gld_efficiency             Global Memory Load Efficiency     100.00%     100.00%     100.00%
       1998                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
       1998                         shared_efficiency                  Shared Memory Efficiency      78.12%      78.12%      78.12%
       1998                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: void thrust::binary_transform_kernel<thrust::detail::normal_iterator<thrust::device_ptr<double>>, thrust::detail::normal_iterator<thrust::device_ptr<int>>, thrust::detail::normal_iterator<thrust::device_ptr<double>>, calc_likelihood_sumYOYOYOYO>(long, double, thrust::device_ptr<double>, thrust::detail::normal_iterator<thrust::device_ptr<double>>, int)
        999                         branch_efficiency                         Branch Efficiency      91.75%     100.00%      99.39%
        999                            gld_efficiency             Global Memory Load Efficiency       8.06%      12.60%      12.18%
        999                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
        999                         shared_efficiency                  Shared Memory Efficiency      78.12%      78.12%      78.12%
        999                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::detail::normal_iterator<thrust::device_ptr<double>>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<double>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
        999                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        999                            gld_efficiency             Global Memory Load Efficiency       0.00%       0.00%       0.00%
        999                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
        999                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
        999                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: void thrust::binary_transform_kernel<thrust::detail::normal_iterator<thrust::device_ptr<double>>, thrust::detail::normal_iterator<thrust::device_ptr<double>>, thrust::detail::normal_iterator<thrust::device_ptr<double>>, exp_transformYOYOYOYO>(long, double, thrust::device_ptr<double>, thrust::detail::normal_iterator<thrust::device_ptr<double>>, thrust::detail::normal_iterator<thrust::device_ptr<double>>)
        999                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        999                            gld_efficiency             Global Memory Load Efficiency     100.00%     100.00%     100.00%
        999                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
        999                         shared_efficiency                  Shared Memory Efficiency      78.12%      78.12%      78.12%
        999                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: void thrust::binary_transform_kernel<thrust::detail::normal_iterator<thrust::device_ptr<double>>, thrust::detail::normal_iterator<thrust::device_ptr<int>>, thrust::detail::normal_iterator<thrust::device_ptr<double>>, randn_transformYOYOYOYO>(long, double, thrust::device_ptr<double>, thrust::detail::normal_iterator<thrust::device_ptr<double>>, int)
       1998                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
       1998                            gld_efficiency             Global Memory Load Efficiency      98.04%      98.04%      98.04%
       1998                            gst_efficiency            Global Memory Store Efficiency      98.68%      98.68%      98.68%
       1998                         shared_efficiency                  Shared Memory Efficiency      78.12%      78.12%      78.12%
       1998                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=512, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=3>, unsigned long=512>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::scan_detail::inclusive_scan_n, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=1>, thrust::detail::normal_iterator<thrust::device_ptr<double>>, long, thrust::detail::normal_iterator<thrust::device_ptr<double>>, thrust::plus<double>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=3)
        999                         branch_efficiency                         Branch Efficiency      99.85%      99.85%      99.85%
        999                            gld_efficiency             Global Memory Load Efficiency      65.34%      65.34%      65.34%
        999                            gst_efficiency            Global Memory Store Efficiency      86.21%      86.21%      86.21%
        999                         shared_efficiency                  Shared Memory Efficiency      74.19%      74.19%      74.19%
        999                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: void thrust::binary_transform_kernel<thrust::detail::normal_iterator<thrust::device_ptr<double>>, thrust::detail::normal_iterator<thrust::device_ptr<int>>, thrust::detail::normal_iterator<thrust::device_ptr<double>>, update_coordsYOYOYOYO>(long, double, thrust::device_ptr<double>, thrust::detail::normal_iterator<thrust::device_ptr<double>>, int)
       1998                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
       1998                            gld_efficiency             Global Memory Load Efficiency      73.39%      99.21%      98.57%
       1998                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
       1998                         shared_efficiency                  Shared Memory Efficiency      78.12%      78.12%      78.12%
       1998                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<double>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<double>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
          6                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          6                            gld_efficiency             Global Memory Load Efficiency       0.00%       0.00%       0.00%
          6                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
          6                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
          6                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: void thrust::better_reduce_kernel<double, unsigned int=32>(double*, double, unsigned int)
        999                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        999                            gld_efficiency             Global Memory Load Efficiency     100.00%     100.00%     100.00%
        999                            gst_efficiency            Global Memory Store Efficiency      25.00%      25.00%      25.00%
        999                         shared_efficiency                  Shared Memory Efficiency      93.45%      93.45%      93.45%
        999                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
