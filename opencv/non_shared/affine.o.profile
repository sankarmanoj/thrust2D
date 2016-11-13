==11725== NVPROF is profiling process 11725, command: ./affine.o
==11725== Profiling application: ./affine.o
==11725== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 34.06%  77.401us         5  15.480us  1.2160us  72.537us  [CUDA memcpy HtoD]
 32.51%  73.882us         1  73.882us  73.882us  73.882us  [CUDA memcpy DtoH]
 24.81%  56.379us         1  56.379us  56.379us  56.379us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<AffineTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  8.63%  19.615us         2  9.8070us  8.8960us  10.719us  [CUDA memset]

==11725== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.95%  155.59ms         6  25.932ms  5.6440us  155.15ms  cudaMalloc
  0.36%  570.54us         1  570.54us  570.54us  570.54us  cuDeviceTotalMem
  0.35%  548.04us        90  6.0890us     338ns  204.15us  cuDeviceGetAttribute
  0.18%  287.67us         6  47.944us  5.5700us  184.01us  cudaMemcpy
  0.07%  114.72us         7  16.389us  3.0650us  53.990us  cudaDeviceSynchronize
  0.03%  50.330us         1  50.330us  50.330us  50.330us  cuDeviceGetName
  0.02%  31.256us         2  15.628us  12.578us  18.678us  cudaMemset
  0.01%  16.242us         1  16.242us  16.242us  16.242us  cudaLaunch
  0.01%  9.7550us         4  2.4380us  1.4340us  3.8110us  cudaFuncGetAttributes
  0.01%  9.6240us         1  9.6240us  9.6240us  9.6240us  cudaConfigureCall
  0.00%  4.6550us        11     423ns     331ns     847ns  cudaDeviceGetAttribute
  0.00%  3.1350us         2  1.5670us     432ns  2.7030us  cuDeviceGetCount
  0.00%  2.8380us         1  2.8380us  2.8380us  2.8380us  cudaSetupArgument
  0.00%  1.9440us         1  1.9440us  1.9440us  1.9440us  cudaEventCreateWithFlags
  0.00%  1.8940us         1  1.8940us  1.8940us  1.8940us  cudaEventRecord
  0.00%  1.8560us         3     618ns     369ns  1.0160us  cudaGetDevice
  0.00%  1.3240us         1  1.3240us  1.3240us  1.3240us  cudaEventDestroy
  0.00%  1.0660us         2     533ns     319ns     747ns  cuDeviceGet
