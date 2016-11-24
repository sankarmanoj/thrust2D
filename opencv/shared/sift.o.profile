==29278== NVPROF is profiling process 29278, command: ./sift.o
==29278== Profiling application: ./sift.o
==29278== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 46.18%  260.90us        12  21.741us     704ns  193.57us  [CUDA memcpy HtoD]
 38.46%  217.25us         1  217.25us  217.25us  217.25us  void thrust::transform_kernel<unsigned char, siftTransformFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, siftTransformFunctor)
  8.27%  46.721us         7  6.6740us  1.3120us  16.576us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  7.09%  40.032us         1  40.032us  40.032us  40.032us  [CUDA memcpy DtoH]

==29278== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.92%  554.69ms        16  34.668ms  4.7930us  540.41ms  cudaMalloc
  1.43%  8.1619ms         2  4.0809ms  193.17us  7.9687ms  cudaGetDeviceProperties
  1.25%  7.1632ms         7  1.0233ms  8.7270us  3.5396ms  cudaFree
  0.09%  528.21us        10  52.821us  9.1050us  152.86us  cudaMemcpy
  0.08%  453.10us         3  151.03us  39.448us  329.39us  cudaMemcpyAsync
  0.07%  408.01us         8  51.001us  8.5140us  174.58us  cudaLaunch
  0.04%  252.92us        91  2.7790us     126ns  96.921us  cuDeviceGetAttribute
  0.04%  217.36us         1  217.36us  217.36us  217.36us  cudaDeviceSynchronize
  0.03%  184.12us         1  184.12us  184.12us  184.12us  cuDeviceTotalMem
  0.02%  89.953us        28  3.2120us  1.3940us  14.314us  cudaFuncGetAttributes
  0.01%  60.956us         1  60.956us  60.956us  60.956us  cuDeviceGetName
  0.00%  18.892us         7  2.6980us     937ns  5.8260us  cudaEventCreateWithFlags
  0.00%  18.827us        21     896ns     202ns  3.7510us  cudaGetDevice
  0.00%  16.900us         8  2.1120us     297ns  8.7060us  cudaConfigureCall
  0.00%  14.832us         7  2.1180us     741ns  3.9800us  cudaEventRecord
  0.00%  11.709us         7  1.6720us     559ns  3.4670us  cudaEventDestroy
  0.00%  6.5550us        11     595ns     221ns  1.2410us  cudaSetupArgument
  0.00%  6.5080us        11     591ns     310ns  1.2820us  cudaDeviceGetAttribute
  0.00%  4.0850us         3  1.3610us     182ns  3.4720us  cuDeviceGetCount
  0.00%  1.5810us         3     527ns     495ns     579ns  cuDeviceGet
