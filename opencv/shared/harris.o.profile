==13110== NVPROF is profiling process 13110, command: ./harris.o
==13110== Profiling application: ./harris.o
==13110== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 88.27%  14.920ms         1  14.920ms  14.920ms  14.920ms  void thrust::transform_texture_kernel<float, HarrisIntensityFunctor>(unsigned __int64, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, HarrisIntensityFunctor)
 10.31%  1.7424ms         3  580.80us  181.21us  782.24us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.79%  133.15us        19  7.0070us     319ns  124.06us  [CUDA memcpy DtoH]
  0.57%  96.699us        24  4.0290us     543ns  82.908us  [CUDA memcpy HtoD]
  0.06%  10.048us         1  10.048us  10.048us  10.048us  [CUDA memcpy DtoD]

==13110== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.60%  4.75176s         8  593.97ms  8.1210us  4.75113s  cudaMalloc
  0.32%  15.383ms         6  2.5638ms  8.5520us  15.328ms  cudaMemcpy
  0.04%  1.7876ms         3  595.88us  224.18us  782.07us  cudaDeviceSynchronize
  0.01%  507.01us         4  126.75us  12.390us  461.94us  cudaLaunch
  0.01%  327.08us        37  8.8400us  3.5290us  67.479us  cudaMemcpyAsync
  0.01%  283.31us         1  283.31us  283.31us  283.31us  cudaMallocPitch
  0.01%  277.44us        91  3.0480us     136ns  125.98us  cuDeviceGetAttribute
  0.00%  205.66us         3  68.553us  35.680us  114.52us  cudaFree
  0.00%  189.84us         1  189.84us  189.84us  189.84us  cuDeviceTotalMem
  0.00%  188.40us         1  188.40us  188.40us  188.40us  cudaGetDeviceProperties
  0.00%  39.904us        12  3.3250us  2.6480us  5.8680us  cudaFuncGetAttributes
  0.00%  33.384us         1  33.384us  33.384us  33.384us  cuDeviceGetName
  0.00%  32.444us         1  32.444us  32.444us  32.444us  cudaMemcpy2D
  0.00%  23.345us         1  23.345us  23.345us  23.345us  cudaCreateTextureObject
  0.00%  7.2770us         9     808ns     428ns  2.3360us  cudaGetDevice
  0.00%  6.1220us        11     556ns     431ns  1.2300us  cudaDeviceGetAttribute
  0.00%  5.6970us         7     813ns     179ns  4.0650us  cudaSetupArgument
  0.00%  5.6140us         3  1.8710us  1.4140us  2.5350us  cudaEventCreateWithFlags
  0.00%  5.0760us         3  1.6920us  1.3000us  2.3190us  cudaEventRecord
  0.00%  3.9250us         3  1.3080us     274ns  2.5530us  cuDeviceGetCount
  0.00%  3.8290us         3  1.2760us  1.0630us  1.6410us  cudaEventDestroy
  0.00%  2.6170us         4     654ns     464ns  1.1890us  cudaConfigureCall
  0.00%  1.6890us         3     563ns     264ns  1.1170us  cuDeviceGet
  0.00%     420ns         1     420ns     420ns     420ns  cudaCreateChannelDesc
