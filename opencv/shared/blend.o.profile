==29193== NVPROF is profiling process 29193, command: ./blend.o
==29193== Profiling application: ./blend.o
==29193== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 40.55%  162.27us         8  20.284us     576ns  78.784us  [CUDA memcpy HtoD]
 36.00%  144.07us         1  144.07us  144.07us  144.07us  void thrust::transform_kernel<float, blendFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, int, int, int, int, int, blendFunctor)
 20.43%  81.760us         1  81.760us  81.760us  81.760us  [CUDA memcpy DtoH]
  3.03%  12.128us         3  4.0420us  3.7440us  4.2240us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==29193== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.25%  557.15ms         9  61.906ms  4.1150us  556.03ms  cudaMalloc
  1.47%  8.5315ms         1  8.5315ms  8.5315ms  8.5315ms  cudaGetDeviceProperties
  1.40%  8.1195ms        90  90.216us     140ns  5.9534ms  cuDeviceGetAttribute
  0.65%  3.7895ms         3  1.2632ms  485.92us  1.9538ms  cudaFree
  0.07%  400.64us         7  57.233us  5.2770us  325.03us  cudaMemcpy
  0.05%  308.10us         1  308.10us  308.10us  308.10us  cuDeviceTotalMem
  0.04%  206.13us         1  206.13us  206.13us  206.13us  cuDeviceGetName
  0.03%  180.99us         2  90.496us  74.593us  106.40us  cudaMemcpyAsync
  0.01%  84.840us         4  21.210us  14.967us  31.149us  cudaLaunch
  0.01%  36.887us        12  3.0730us  2.5150us  5.6120us  cudaFuncGetAttributes
  0.00%  7.4830us        12     623ns     126ns  5.3320us  cudaSetupArgument
  0.00%  6.1680us         9     685ns     336ns  1.8150us  cudaGetDevice
  0.00%  5.2780us        11     479ns     363ns  1.0770us  cudaDeviceGetAttribute
  0.00%  5.2700us         3  1.7560us  1.4090us  2.3610us  cudaEventCreateWithFlags
  0.00%  4.6020us         3  1.5340us  1.2930us  2.0140us  cudaEventRecord
  0.00%  3.3540us         3  1.1180us     962ns  1.3410us  cudaEventDestroy
  0.00%  2.8970us         4     724ns     449ns     997ns  cudaConfigureCall
  0.00%  2.1770us         2  1.0880us     493ns  1.6840us  cuDeviceGetCount
  0.00%     958ns         2     479ns     307ns     651ns  cuDeviceGet
  0.00%     388ns         1     388ns     388ns     388ns  cudaGetLastError
