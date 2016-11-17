==9408== NVPROF is profiling process 9408, command: ./sift.o
==9408== Profiling application: ./sift.o
==9408== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 46.52%  639.90us        12  53.325us     576ns  506.59us  [CUDA memcpy HtoD]
 44.47%  611.74us         1  611.74us  611.74us  611.74us  void thrust::transform_kernel<float, siftTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, siftTransformFunctor)
  6.04%  83.040us         1  83.040us  83.040us  83.040us  [CUDA memcpy DtoH]
  2.19%  30.176us         4  7.5440us  1.7600us  19.872us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.78%  10.720us         3  3.5730us  2.0160us  5.8560us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==9408== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.35%  1.35524s        16  84.703ms  5.2340us  1.33890s  cudaMalloc
  1.20%  16.658ms         7  2.3797ms  5.6370us  10.997ms  cudaFree
  0.61%  8.5175ms        90  94.638us     104ns  3.9528ms  cuDeviceGetAttribute
  0.56%  7.8120ms         1  7.8120ms  7.8120ms  7.8120ms  cudaGetDeviceProperties
  0.09%  1.2718ms        10  127.18us  5.2020us  979.46us  cudaMemcpy
  0.06%  847.84us         1  847.84us  847.84us  847.84us  cudaDeviceSynchronize
  0.06%  774.39us         3  258.13us  39.208us  557.67us  cudaMemcpyAsync
  0.04%  539.87us         1  539.87us  539.87us  539.87us  cuDeviceTotalMem
  0.02%  222.86us         1  222.86us  222.86us  222.86us  cuDeviceGetName
  0.01%  168.12us         8  21.014us  6.6190us  30.112us  cudaLaunch
  0.00%  60.169us        28  2.1480us  1.4470us  4.9980us  cudaFuncGetAttributes
  0.00%  12.147us        21     578ns     208ns  2.0870us  cudaGetDevice
  0.00%  10.432us         7  1.4900us     824ns  2.0100us  cudaEventCreateWithFlags
  0.00%  7.9520us         7  1.1360us     627ns  1.4090us  cudaEventRecord
  0.00%  7.1530us        11     650ns     119ns  4.3870us  cudaSetupArgument
  0.00%  6.7670us         7     966ns     519ns  1.2860us  cudaEventDestroy
  0.00%  5.6610us         8     707ns     210ns     978ns  cudaConfigureCall
  0.00%  3.5480us        11     322ns     209ns  1.1030us  cudaDeviceGetAttribute
  0.00%  2.4090us         2  1.2040us     223ns  2.1860us  cuDeviceGetCount
  0.00%     463ns         2     231ns     122ns     341ns  cuDeviceGet
