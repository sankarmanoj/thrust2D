==5422== NVPROF is profiling process 5422, command: ./blend.o
==5422== Profiling application: ./blend.o
==5422== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 50.72%  241.96us         8  30.244us     544ns  127.99us  [CUDA memcpy HtoD]
 28.81%  137.42us         1  137.42us  137.42us  137.42us  [CUDA memcpy DtoH]
 17.75%  84.663us         1  84.663us  84.663us  84.663us  void thrust::transform_kernel<float, blendFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, int, int, int, int, int, blendFunctor)
  2.73%  13.021us         3  4.3400us  3.9990us  4.6710us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==5422== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.51%  801.33ms         9  89.037ms  5.3400us  800.83ms  cudaMalloc
  0.97%  7.9414ms        90  88.238us     139ns  3.0609ms  cuDeviceGetAttribute
  0.68%  5.6075ms         1  5.6075ms  5.6075ms  5.6075ms  cudaGetDeviceProperties
  0.49%  4.0363ms         3  1.3454ms  37.337us  2.0012ms  cudaFree
  0.11%  920.35us         1  920.35us  920.35us  920.35us  cuDeviceTotalMem
  0.10%  838.88us         1  838.88us  838.88us  838.88us  cuDeviceGetName
  0.07%  593.71us         7  84.815us  6.4350us  477.18us  cudaMemcpy
  0.05%  374.14us         2  187.07us  140.34us  233.80us  cudaMemcpyAsync
  0.01%  72.552us         4  18.138us  11.048us  33.281us  cudaLaunch
  0.00%  22.764us        12  1.8970us  1.4190us  4.5820us  cudaFuncGetAttributes
  0.00%  14.826us         2  7.4130us  4.1020us  10.724us  cuDeviceGetCount
  0.00%  6.2900us        12     524ns     219ns  3.3470us  cudaSetupArgument
  0.00%  4.8850us         9     542ns     211ns  1.6820us  cudaGetDevice
  0.00%  4.2150us         3  1.4050us  1.1690us  1.7830us  cudaEventCreateWithFlags
  0.00%  4.1740us        11     379ns     212ns  1.3070us  cudaDeviceGetAttribute
  0.00%  3.5710us         3  1.1900us     762ns  2.0050us  cudaEventRecord
  0.00%  2.9170us         3     972ns     752ns  1.2690us  cudaEventDestroy
  0.00%  2.8800us         4     720ns     328ns  1.3810us  cudaConfigureCall
  0.00%  2.3090us         2  1.1540us  1.0130us  1.2960us  cuDeviceGet
  0.00%     553ns         1     553ns     553ns     553ns  cudaGetLastError
