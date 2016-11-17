==25499== NVPROF is profiling process 25499, command: ./lbp.o
==25499== Profiling application: ./lbp.o
==25499== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 50.12%  208.85us         6  34.809us     609ns  205.43us  [CUDA memcpy HtoD]
 30.64%  127.66us         1  127.66us  127.66us  127.66us  [CUDA memcpy DtoH]
 16.22%  67.578us         1  67.578us  67.578us  67.578us  void thrust::transform_kernel<float, lbpFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, lbpFunctor)
  2.14%  8.9350us         2  4.4670us  3.9070us  5.0280us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.88%  3.6830us         1  3.6830us  3.6830us  3.6830us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==25499== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.33%  711.30ms         8  88.912ms  9.5260us  701.55ms  cudaMalloc
  0.90%  6.5274ms         1  6.5274ms  6.5274ms  6.5274ms  cudaGetDeviceProperties
  0.38%  2.7328ms         3  910.94us  35.229us  2.5736ms  cudaFree
  0.11%  816.95us         6  136.16us  11.389us  554.56us  cudaMemcpy
  0.10%  713.83us        90  7.9310us     135ns  326.62us  cuDeviceGetAttribute
  0.06%  459.38us         1  459.38us  459.38us  459.38us  cudaMemcpyAsync
  0.05%  372.51us         4  93.128us  53.706us  155.48us  cudaLaunch
  0.03%  194.98us         1  194.98us  194.98us  194.98us  cuDeviceTotalMem
  0.01%  58.754us        12  4.8960us  2.0110us  14.674us  cudaFuncGetAttributes
  0.01%  57.040us         1  57.040us  57.040us  57.040us  cuDeviceGetName
  0.00%  20.966us         3  6.9880us  4.2910us  10.289us  cudaEventCreateWithFlags
  0.00%  19.637us         9  2.1810us     334ns  7.4470us  cudaGetDevice
  0.00%  17.779us         3  5.9260us  3.8660us  8.8120us  cudaEventRecord
  0.00%  16.905us         7  2.4150us     149ns  12.551us  cudaSetupArgument
  0.00%  11.572us         3  3.8570us  1.9400us  6.2490us  cudaEventDestroy
  0.00%  11.162us         4  2.7900us  1.7940us  3.7400us  cudaConfigureCall
  0.00%  9.7380us        11     885ns     304ns  4.6870us  cudaDeviceGetAttribute
  0.00%  3.0030us         2  1.5010us     571ns  2.4320us  cuDeviceGetCount
  0.00%     797ns         2     398ns     247ns     550ns  cuDeviceGet
