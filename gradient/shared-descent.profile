==5109== NVPROF is profiling process 5109, command: ./shared-descent.o 1 0.01
==5109== Profiling application: ./shared-descent.o 1 0.01
==5109== Profiling result:
==5109== Metric result:
Invocations                               Metric Name                        Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::binary_transform_kernel<thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, update_weights>(long, float, thrust::device_ptr<float>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>)
        133                      dram_read_throughput             Device Memory Read Throughput  0.00000B/s  2.1846GB/s  773.43MB/s
        133                     dram_write_throughput            Device Memory Write Throughput  0.00000B/s  96.575MB/s  8.5831MB/s
    Kernel: void thrust::unary_reduce_kernel<float, squareOp, unsigned int=256>(float*, float, unsigned int, squareOp)
        133                      dram_read_throughput             Device Memory Read Throughput  0.00000B/s  1.9765GB/s  589.37MB/s
        133                     dram_write_throughput            Device Memory Write Throughput  0.00000B/s  211.93MB/s  4.7684MB/s
    Kernel: void thrust::binary_reduce_kernel<float, thrust::multiplies<float>, unsigned int=256>(float*, float, float, unsigned int, float)
      13300                      dram_read_throughput             Device Memory Read Throughput  0.00000B/s  17.473GB/s  608.44MB/s
      13300                     dram_write_throughput            Device Memory Write Throughput  0.00000B/s  551.52MB/s  3.8147MB/s
    Kernel: void thrust::binary_transform_kernel<thrust::detail::normal_iterator<thrust::device_ptr<floatD>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, dotProductFunctor<thrust::constant_vector<float>>>(long, floatD, thrust::device_ptr<floatD>, thrust::detail::normal_iterator<thrust::device_ptr<floatD>>, float)
        133                      dram_read_throughput             Device Memory Read Throughput  0.00000B/s  30.019GB/s  0.9853GB/s
        133                     dram_write_throughput            Device Memory Write Throughput  0.00000B/s  5.6392GB/s  84.877MB/s
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
          4                      dram_read_throughput             Device Memory Read Throughput  0.00000B/s  1.3856GB/s  575.07MB/s
          4                     dram_write_throughput            Device Memory Write Throughput  0.00000B/s  65.771MB/s  12.398MB/s
