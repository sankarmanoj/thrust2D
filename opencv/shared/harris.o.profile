==10528== NVPROF is profiling process 10528, command: ./harris.o
==10528== Profiling application: ./harris.o
==10528== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 54.85%  259.01us         1  259.01us  259.01us  259.01us  void thrust::transform_kernel<float, HarrisIntensityFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, HarrisIntensityFunctor)
 23.55%  111.23us        24  4.6340us  1.1840us  83.329us  [CUDA memcpy HtoD]
 19.02%  89.825us        19  4.7270us     320ns  74.401us  [CUDA memcpy DtoH]
  2.58%  12.192us         3  4.0640us  2.1440us  5.2160us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==10528== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.60%  652.98ms         8  81.623ms  5.6780us  652.48ms  cudaMalloc
  0.10%  665.72us        37  17.992us  2.7780us  200.23us  cudaMemcpyAsync
  0.09%  563.13us         6  93.854us  4.9510us  461.62us  cudaMemcpy
  0.05%  335.04us         1  335.04us  335.04us  335.04us  cudaGetDeviceProperties
  0.05%  333.22us         3  111.07us  7.6890us  297.73us  cudaFree
  0.05%  311.69us        90  3.4630us     117ns  116.31us  cuDeviceGetAttribute
  0.03%  207.65us         1  207.65us  207.65us  207.65us  cuDeviceTotalMem
  0.01%  98.066us         4  24.516us  13.443us  39.007us  cudaLaunch
  0.00%  31.574us         1  31.574us  31.574us  31.574us  cuDeviceGetName
  0.00%  29.423us        12  2.4510us  1.9730us  4.3150us  cudaFuncGetAttributes
  0.00%  8.2070us         7  1.1720us     162ns  5.9270us  cudaSetupArgument
  0.00%  6.2750us         3  2.0910us  1.2090us  3.3000us  cudaEventCreateWithFlags
  0.00%  5.9330us         9     659ns     312ns  1.8240us  cudaGetDevice
  0.00%  5.3190us         3  1.7730us  1.1570us  2.4700us  cudaEventRecord
  0.00%  4.3190us         3  1.4390us     923ns  2.2420us  cudaEventDestroy
  0.00%  4.1000us        11     372ns     283ns     830ns  cudaDeviceGetAttribute
  0.00%  3.8680us         4     967ns     673ns  1.3780us  cudaConfigureCall
  0.00%  2.0810us         2  1.0400us     400ns  1.6810us  cuDeviceGetCount
  0.00%     549ns         2     274ns     195ns     354ns  cuDeviceGet
  0.00%     375ns         1     375ns     375ns     375ns  cudaGetLastError
