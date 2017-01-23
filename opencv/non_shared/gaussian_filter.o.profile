==6370== NVPROF is profiling process 6370, command: ./gaussian_filter.o
==6370== Profiling application: ./gaussian_filter.o
==6370== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.12%  4.7310ms         1  4.7310ms  4.7310ms  4.7310ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.07%  51.487us         7  7.3550us     800ns  43.743us  [CUDA memcpy HtoD]
  0.81%  39.263us         1  39.263us  39.263us  39.263us  [CUDA memcpy DtoH]

==6370== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.48%  1.11220s         5  222.44ms  7.2630us  1.11189s  cudaMallocPitch
  0.45%  4.9929ms         3  1.6643ms  20.952us  4.9361ms  cudaMemcpy2D
  0.04%  398.93us        83  4.8060us     768ns  156.86us  cuDeviceGetAttribute
  0.02%  189.06us         5  37.811us  9.9870us  144.08us  cudaMalloc
  0.01%  59.924us         5  11.984us  6.7740us  24.025us  cudaMemcpy
  0.00%  43.511us         1  43.511us  43.511us  43.511us  cuDeviceTotalMem
  0.00%  36.457us         1  36.457us  36.457us  36.457us  cuDeviceGetName
  0.00%  33.803us         1  33.803us  33.803us  33.803us  cudaLaunch
  0.00%  20.045us         4  5.0110us  3.4220us  9.6380us  cudaFuncGetAttributes
  0.00%  14.876us         3  4.9580us     908ns  13.060us  cudaGetDevice
  0.00%  11.176us        11  1.0160us     838ns  1.5370us  cudaDeviceGetAttribute
  0.00%  5.2380us         1  5.2380us  5.2380us  5.2380us  cudaSetupArgument
  0.00%  4.2600us         2  2.1300us     838ns  3.4220us  cuDeviceGetCount
  0.00%  2.8630us         1  2.8630us  2.8630us  2.8630us  cudaEventCreateWithFlags
  0.00%  2.3750us         1  2.3750us  2.3750us  2.3750us  cudaEventRecord
  0.00%  2.0250us         1  2.0250us  2.0250us  2.0250us  cudaEventDestroy
  0.00%  1.9550us         2     977ns     838ns  1.1170us  cuDeviceGet
  0.00%  1.5370us         1  1.5370us  1.5370us  1.5370us  cudaConfigureCall
