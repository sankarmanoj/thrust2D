==4278== NVPROF is profiling process 4278, command: ./sift.o
==4278== Profiling application: ./sift.o
==4278== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 49.91%  612.14us         1  612.14us  612.14us  612.14us  void thrust::transform_kernel<float, siftTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, siftTransformFunctor)
 40.22%  493.33us        12  41.110us  1.1840us  363.13us  [CUDA memcpy HtoD]
  6.72%  82.420us         1  82.420us  82.420us  82.420us  [CUDA memcpy DtoH]
  2.35%  28.806us         4  7.2010us  1.4080us  19.812us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.80%  9.8580us         3  3.2860us  1.6640us  5.5370us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==4278== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.06%  222.25ms        16  13.891ms  5.1620us  220.68ms  cudaMalloc
  1.60%  3.6710ms         2  1.8355ms  243.18us  3.4278ms  cudaGetDeviceProperties
  0.36%  824.65us        90  9.1620us     103ns  376.74us  cuDeviceGetAttribute
  0.27%  617.74us         1  617.74us  617.74us  617.74us  cudaDeviceSynchronize
  0.22%  513.09us         3  171.03us  38.027us  383.05us  cudaMemcpyAsync
  0.15%  342.57us         7  48.939us  5.3220us  113.19us  cudaFree
  0.11%  245.12us        10  24.512us  4.4850us  180.10us  cudaMemcpy
  0.09%  216.51us         1  216.51us  216.51us  216.51us  cuDeviceTotalMem
  0.07%  160.69us         1  160.69us  160.69us  160.69us  cuDeviceGetName
  0.03%  68.640us         8  8.5800us  5.5280us  12.807us  cudaLaunch
  0.02%  44.487us        28  1.5880us  1.4070us  3.1260us  cudaFuncGetAttributes
  0.00%  7.6630us        21     364ns     222ns  1.2440us  cudaGetDevice
  0.00%  6.1810us         7     883ns     621ns  1.4330us  cudaEventCreateWithFlags
  0.00%  5.5020us         7     786ns     589ns  1.3480us  cudaEventRecord
  0.00%  4.4020us         7     628ns     487ns     915ns  cudaEventDestroy
  0.00%  2.7640us         8     345ns     224ns     790ns  cudaConfigureCall
  0.00%  2.6720us        11     242ns     205ns     553ns  cudaDeviceGetAttribute
  0.00%  2.2700us        11     206ns     119ns     291ns  cudaSetupArgument
  0.00%  1.5580us         2     779ns     358ns  1.2000us  cuDeviceGetCount
  0.00%     397ns         2     198ns     152ns     245ns  cuDeviceGet
