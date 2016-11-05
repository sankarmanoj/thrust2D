==6904== NVPROF is profiling process 6904, command: ./affine.o
==6904== Profiling application: ./affine.o
==6904== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 41.69%  120.53us         1  120.53us  120.53us  120.53us  void thrust::for_each_kernel<float, AffineTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::launcher_config, AffineTransformFunctor)
 29.09%  84.115us        11  7.6460us     544ns  74.869us  [CUDA memcpy HtoD]
 25.55%  73.876us         1  73.876us  73.876us  73.876us  [CUDA memcpy DtoH]
  3.66%  10.591us         3  3.5300us  1.1200us  5.6950us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6904== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.52%  526.46ms         7  75.208ms  8.5970us  525.58ms  cudaMalloc
  1.12%  5.9586ms         1  5.9586ms  5.9586ms  5.9586ms  cudaGetDeviceProperties
  0.10%  546.06us         3  182.02us  9.5380us  503.65us  cudaFree
  0.07%  387.46us        90  4.3050us     136ns  144.72us  cuDeviceGetAttribute
  0.05%  243.57us         5  48.713us  9.7600us  178.88us  cudaMemcpy
  0.04%  213.17us         1  213.17us  213.17us  213.17us  cuDeviceTotalMem
  0.04%  187.30us         7  26.757us  3.6680us  162.15us  cudaMemcpyAsync
  0.02%  124.95us         1  124.95us  124.95us  124.95us  cudaDeviceSynchronize
  0.02%  104.92us         4  26.230us  19.454us  35.388us  cudaLaunch
  0.01%  39.789us         1  39.789us  39.789us  39.789us  cuDeviceGetName
  0.01%  39.471us        12  3.2890us  2.5230us  6.7110us  cudaFuncGetAttributes
  0.00%  8.1670us         9     907ns     418ns  2.8240us  cudaGetDevice
  0.00%  8.0520us         6  1.3420us     120ns  6.1340us  cudaSetupArgument
  0.00%  7.2610us         3  2.4200us  2.0870us  2.6030us  cudaEventCreateWithFlags
  0.00%  5.9360us         3  1.9780us  1.5660us  2.1940us  cudaEventRecord
  0.00%  5.2740us        11     479ns     339ns  1.2620us  cudaDeviceGetAttribute
  0.00%  4.1760us         3  1.3920us  1.2520us  1.5160us  cudaEventDestroy
  0.00%  3.5270us         4     881ns     559ns  1.2820us  cudaConfigureCall
  0.00%  2.7770us         2  1.3880us     234ns  2.5430us  cuDeviceGetCount
  0.00%     434ns         2     217ns     184ns     250ns  cuDeviceGet
  0.00%     306ns         1     306ns     306ns     306ns  cudaGetLastError
