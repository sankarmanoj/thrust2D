==29416== NVPROF is profiling process 29416, command: ./pyrup.o
==29416== Profiling application: ./pyrup.o
==29416== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 58.52%  1.7564ms         1  1.7564ms  1.7564ms  1.7564ms  [CUDA memcpy DtoH]
 14.51%  435.49us         2  217.75us  216.32us  219.17us  [CUDA memcpy DtoA]
  7.84%  235.20us         1  235.20us  235.20us  235.20us  void thrust::convolutionRowsKernel<float>(float*, int, int, unsigned __int64)
  7.83%  235.11us         1  235.11us  235.11us  235.11us  void thrust::convolutionColumnsKernel<float>(float*, int, int, unsigned __int64)
  5.23%  156.99us         5  31.398us     704ns  153.86us  [CUDA memcpy HtoD]
  3.55%  106.50us         2  53.248us  15.840us  90.657us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  2.37%  71.137us         1  71.137us  71.137us  71.137us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrupTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.15%  4.6400us         1  4.6400us  4.6400us  4.6400us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==29416== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.21%  391.11ms         7  55.873ms  6.1300us  386.23ms  cudaMalloc
  1.05%  4.2296ms         4  1.0574ms  12.780us  4.1133ms  cudaMemcpy
  0.71%  2.8711ms         3  957.03us  109.17us  2.6020ms  cudaFree
  0.45%  1.7914ms        91  19.686us     125ns  1.5173ms  cuDeviceGetAttribute
  0.38%  1.5121ms         1  1.5121ms  1.5121ms  1.5121ms  cudaMallocArray
  0.05%  208.14us         1  208.14us  208.14us  208.14us  cudaDeviceSynchronize
  0.05%  199.15us         1  199.15us  199.15us  199.15us  cuDeviceTotalMem
  0.03%  129.82us         1  129.82us  129.82us  129.82us  cudaMemcpyAsync
  0.02%  78.471us         6  13.078us  5.7230us  28.501us  cudaLaunch
  0.02%  61.203us         2  30.601us  9.7820us  51.421us  cudaMemcpyToArray
  0.01%  45.958us         1  45.958us  45.958us  45.958us  cudaMemcpyToSymbol
  0.01%  39.660us         1  39.660us  39.660us  39.660us  cuDeviceGetName
  0.01%  28.233us        16  1.7640us  1.3610us  4.1890us  cudaFuncGetAttributes
  0.00%  9.5520us         2  4.7760us  2.6000us  6.9520us  cudaCreateTextureObject
  0.00%  5.4600us        12     455ns     200ns  1.5970us  cudaGetDevice
  0.00%  4.9560us         4  1.2390us  1.0260us  1.7970us  cudaEventCreateWithFlags
  0.00%  4.1040us         4  1.0260us     744ns  1.7220us  cudaEventRecord
  0.00%  4.0570us        12     338ns     109ns  1.7810us  cudaSetupArgument
  0.00%  3.6310us        11     330ns     202ns     975ns  cudaDeviceGetAttribute
  0.00%  3.0750us         4     768ns     571ns  1.1350us  cudaEventDestroy
  0.00%  2.9480us         3     982ns     166ns  2.2110us  cuDeviceGetCount
  0.00%  2.5210us         6     420ns     224ns     718ns  cudaConfigureCall
  0.00%  1.8390us         3     613ns     228ns  1.3110us  cuDeviceGet
  0.00%     126ns         1     126ns     126ns     126ns  cudaCreateChannelDesc
