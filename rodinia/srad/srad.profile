==11731== NVPROF is profiling process 11731, command: ./srad.out 502 458 0.5 100 image.pgm image_out.pgm
==11731== Profiling application: ./srad.out 502 458 0.5 100 image.pgm image_out.pgm
==11731== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 40.12%  536.65ms       100  5.3665ms  5.1435ms  6.6012ms  void thrust::transform_kernel<float, SRADFunctor2>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, SRADFunctor2)
 26.71%  357.26ms       100  3.5726ms  3.3893ms  4.2607ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<square>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 24.10%  322.40ms       100  3.2240ms  3.0711ms  3.8629ms  void thrust::transform_kernel<float, SRADFunctor1>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, SRADFunctor1)
  8.79%  117.56ms       200  587.80us  563.93us  895.70us  void thrust::generic_reduce_kernel<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, float, unsigned int=1024, thrust::plus<float>>(float, float*, unsigned int, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>)
  0.11%  1.4419ms         1  1.4419ms  1.4419ms  1.4419ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<extractFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.10%  1.2753ms         1  1.2753ms  1.2753ms  1.2753ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<compressFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.06%  792.21us       604  1.3110us     544ns  73.694us  [CUDA memcpy HtoD]
  0.03%  366.72us       201  1.8240us     736ns  74.047us  [CUDA memcpy DtoH]
  0.00%  1.2160us         1  1.2160us  1.2160us  1.2160us  [CUDA memset]

==11731== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 88.61%  1.33962s       803  1.6683ms  3.3850us  11.817ms  cudaMemcpy
 10.08%  152.38ms         3  50.794ms  4.1370us  152.05ms  cudaMallocPitch
  0.44%  6.6960ms         2  3.3480ms  92.012us  6.6040ms  cudaMemcpy2D
  0.38%  5.7871ms       502  11.528us  5.1030us  1.9806ms  cudaLaunch
  0.22%  3.2516ms       604  5.3830us  3.9050us  368.47us  cudaMalloc
  0.09%  1.2932ms         3  431.07us  424.69us  434.47us  cudaGetDeviceProperties
  0.05%  830.75us        90  9.2300us     350ns  323.72us  cuDeviceGetAttribute
  0.04%  632.39us       408  1.5490us  1.3360us  3.7340us  cudaFuncGetAttributes
  0.04%  591.23us         1  591.23us  591.23us  591.23us  cuDeviceTotalMem
  0.02%  245.07us      1702     143ns     107ns     487ns  cudaSetupArgument
  0.01%  110.62us       502     220ns     156ns     932ns  cudaConfigureCall
  0.01%  92.198us       306     301ns     203ns  1.1920us  cudaGetDevice
  0.01%  82.440us       102     808ns     672ns  2.7640us  cudaEventCreateWithFlags
  0.00%  73.929us       102     724ns     604ns  1.9650us  cudaEventRecord
  0.00%  72.921us         1  72.921us  72.921us  72.921us  cuDeviceGetName
  0.00%  60.646us       102     594ns     520ns     981ns  cudaEventDestroy
  0.00%  21.359us         1  21.359us  21.359us  21.359us  cudaMemset2D
  0.00%  3.3740us         2  1.6870us     442ns  2.9320us  cuDeviceGetCount
  0.00%  3.0360us        11     276ns     210ns     716ns  cudaDeviceGetAttribute
  0.00%  1.0760us         2     538ns     390ns     686ns  cuDeviceGet
