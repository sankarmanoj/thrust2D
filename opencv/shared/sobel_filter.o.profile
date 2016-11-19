==14053== NVPROF is profiling process 14053, command: ./sobel_filter.o
==14053== Profiling application: ./sobel_filter.o
==14053== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 36.45%  114.21us        26  4.3920us     544ns  100.22us  [CUDA memcpy HtoD]
 30.57%  95.775us         1  95.775us  95.775us  95.775us  [CUDA memcpy DtoH]
 28.29%  88.640us         1  88.640us  88.640us  88.640us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
  3.68%  11.520us         4  2.8800us     960ns  4.8000us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.02%  3.2000us         1  3.2000us  3.2000us  3.2000us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==14053== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 93.14%  231.80ms        12  19.317ms  4.2500us  231.41ms  cudaMalloc
  5.47%  13.605ms        91  149.51us     102ns  5.9211ms  cuDeviceGetAttribute
  0.56%  1.4001ms         1  1.4001ms  1.4001ms  1.4001ms  cuDeviceTotalMem
  0.38%  948.65us         1  948.65us  948.65us  948.65us  cuDeviceGetName
  0.21%  519.39us         8  64.923us  3.0110us  478.88us  cudaMemcpy
  0.07%  180.30us        19  9.4890us  1.7930us  144.45us  cudaMemcpyAsync
  0.07%  162.63us         1  162.63us  162.63us  162.63us  cudaGetDeviceProperties
  0.05%  131.06us         5  26.212us  3.9900us  77.602us  cudaFree
  0.02%  55.759us         6  9.2930us  6.6480us  14.071us  cudaLaunch
  0.01%  31.395us        20  1.5690us  1.3200us  3.3590us  cudaFuncGetAttributes
  0.00%  6.7220us         3  2.2400us     112ns  3.6770us  cuDeviceGetCount
  0.00%  5.6300us        15     375ns     200ns  1.2500us  cudaGetDevice
  0.00%  5.2550us         5  1.0510us     734ns  1.6640us  cudaEventCreateWithFlags
  0.00%  4.4960us         5     899ns     586ns  1.5730us  cudaEventRecord
  0.00%  3.7740us         9     419ns     110ns  2.3400us  cudaSetupArgument
  0.00%  3.5950us         5     719ns     541ns  1.1180us  cudaEventDestroy
  0.00%  3.2480us        11     295ns     197ns     952ns  cudaDeviceGetAttribute
  0.00%  2.0330us         6     338ns     240ns     703ns  cudaConfigureCall
  0.00%  1.3630us         3     454ns     411ns     501ns  cuDeviceGet
  0.00%     370ns         1     370ns     370ns     370ns  cudaGetLastError
