==774== NVPROF is profiling process 774, command: ./shared-descent.o 1 0.01
==774== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==774== Profiling application: ./shared-descent.o 1 0.01
==774== Profiling result:
==774== Metric result:
Invocations                               Metric Name                        Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::binary_transform_kernel<thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, update_weights>(long, float, thrust::device_ptr<float>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>)
          1                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          1                            gld_efficiency             Global Memory Load Efficiency      96.53%      96.53%      96.53%
          1                            gst_efficiency            Global Memory Store Efficiency      96.53%      96.53%      96.53%
          1                         shared_efficiency                  Shared Memory Efficiency      86.88%      86.88%      86.88%
    Kernel: void thrust::binary_transform_kernel<thrust::detail::normal_iterator<thrust::device_ptr<floatD>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, dotProductFunctor>(long, floatD, thrust::device_ptr<floatD>, thrust::detail::normal_iterator<thrust::device_ptr<floatD>>, float)
          1                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          1                            gld_efficiency             Global Memory Load Efficiency      86.53%      86.53%      86.53%
          1                            gst_efficiency            Global Memory Store Efficiency      99.98%      99.98%      99.98%
          1                         shared_efficiency                  Shared Memory Efficiency      41.16%      41.16%      41.16%
    Kernel: void thrust::binary_reduce_kernel<float, thrust::multiplies<float>, unsigned int=1024>(float*, float, float, unsigned int, float)
        139                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        139                            gld_efficiency             Global Memory Load Efficiency      88.88%      99.98%      94.47%
        139                            gst_efficiency            Global Memory Store Efficiency      12.50%      12.50%      12.50%
        139                         shared_efficiency                  Shared Memory Efficiency      99.58%      99.58%      99.58%
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
          4                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          4                            gld_efficiency             Global Memory Load Efficiency       0.00%       0.00%       0.00%
          4                            gst_efficiency            Global Memory Store Efficiency      96.53%      99.98%      98.25%
          4                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
