==16936== NVPROF is profiling process 16936, command: ./lbp.o
==16936== Profiling application: ./lbp.o
==16936== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 40.93%  116.25us         6  19.374us     544ns  113.30us  [CUDA memcpy HtoD]
 34.60%  98.265us         1  98.265us  98.265us  98.265us  [CUDA memcpy DtoH]
 17.16%  48.732us         1  48.732us  48.732us  48.732us  void thrust::transform_texture_kernel<float, lbpFunctor>(unsigned __int64, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, lbpFunctor)
  3.54%  10.047us         1  10.047us  10.047us  10.047us  [CUDA memcpy DtoD]
  2.88%  8.1910us         2  4.0950us  4.0000us  4.1910us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.90%  2.5600us         1  2.5600us  2.5600us  2.5600us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==16936== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.90%  396.43ms         8  49.554ms  4.9760us  396.07ms  cudaMalloc
  1.25%  5.0520ms        91  55.516us      98ns  2.4834ms  cuDeviceGetAttribute
  0.42%  1.6972ms         1  1.6972ms  1.6972ms  1.6972ms  cuDeviceTotalMem
  0.13%  515.66us         6  85.943us  3.2820us  455.56us  cudaMemcpy
  0.08%  307.33us         1  307.33us  307.33us  307.33us  cuDeviceGetName
  0.07%  268.52us         1  268.52us  268.52us  268.52us  cudaGetDeviceProperties
  0.05%  194.65us         1  194.65us  194.65us  194.65us  cudaMemcpyAsync
  0.04%  168.01us         1  168.01us  168.01us  168.01us  cudaMallocPitch
  0.03%  140.78us         3  46.926us  7.7180us  94.338us  cudaFree
  0.02%  69.128us         4  17.282us  9.6350us  20.409us  cudaLaunch
  0.01%  25.518us         1  25.518us  25.518us  25.518us  cudaMemcpy2D
  0.01%  20.361us        12  1.6960us  1.3540us  3.6120us  cudaFuncGetAttributes
  0.00%  8.1230us         1  8.1230us  8.1230us  8.1230us  cudaCreateTextureObject
  0.00%  6.0920us         3  2.0300us     120ns  5.7600us  cuDeviceGet
  0.00%  3.6950us         9     410ns     203ns  1.1730us  cudaGetDevice
  0.00%  3.4040us         3  1.1340us     936ns  1.4400us  cudaEventCreateWithFlags
  0.00%  3.2040us        11     291ns     196ns     715ns  cudaDeviceGetAttribute
  0.00%  3.1890us         7     455ns     111ns  2.1420us  cudaSetupArgument
  0.00%  2.9510us         3     983ns     737ns  1.4550us  cudaEventRecord
  0.00%  2.4380us         3     812ns     681ns  1.0690us  cudaEventDestroy
  0.00%  2.2210us         3     740ns     130ns  1.6780us  cuDeviceGetCount
  0.00%  1.7650us         4     441ns     301ns     793ns  cudaConfigureCall
  0.00%     182ns         1     182ns     182ns     182ns  cudaCreateChannelDesc
