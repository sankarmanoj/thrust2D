==4782== NVPROF is profiling process 4782, command: ./erode.o
==4782== Profiling application: ./erode.o
==4782== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 51.95%  181.26us         1  181.26us  181.26us  181.26us  void thrust::transform_kernel<float, erodeFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, erodeFunctor)
 23.20%  80.965us         6  13.494us     608ns  75.493us  [CUDA memcpy HtoD]
 21.39%  74.628us         1  74.628us  74.628us  74.628us  [CUDA memcpy DtoH]
  2.74%  9.5680us         2  4.7840us  4.1600us  5.4080us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.72%  2.4960us         1  2.4960us  2.4960us  2.4960us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==4782== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 95.41%  855.34ms         8  106.92ms  6.7010us  840.50ms  cudaMalloc
  2.30%  20.604ms         1  20.604ms  20.604ms  20.604ms  cudaGetDeviceProperties
  1.12%  10.071ms         3  3.3570ms  28.199us  5.4250ms  cudaFree
  0.92%  8.2638ms        90  91.819us     128ns  4.0581ms  cuDeviceGetAttribute
  0.11%  1.0166ms         6  169.43us  5.6510us  883.96us  cudaMemcpy
  0.06%  519.90us         1  519.90us  519.90us  519.90us  cuDeviceTotalMem
  0.03%  262.00us         1  262.00us  262.00us  262.00us  cuDeviceGetName
  0.02%  192.66us         1  192.66us  192.66us  192.66us  cudaMemcpyAsync
  0.01%  116.90us         4  29.225us  10.783us  38.416us  cudaLaunch
  0.00%  36.629us        12  3.0520us  1.8990us  8.1220us  cudaFuncGetAttributes
  0.00%  8.8590us         9     984ns     304ns  3.1850us  cudaGetDevice
  0.00%  8.4920us         7  1.2130us     116ns  6.6280us  cudaSetupArgument
  0.00%  6.2650us         3  2.0880us  1.3170us  2.4820us  cudaEventCreateWithFlags
  0.00%  4.7020us         3  1.5670us     943ns  2.0270us  cudaEventRecord
  0.00%  4.5760us         4  1.1440us     297ns  1.9040us  cudaConfigureCall
  0.00%  4.3220us        11     392ns     240ns  1.1200us  cudaDeviceGetAttribute
  0.00%  3.6900us         3  1.2300us     783ns  1.4950us  cudaEventDestroy
  0.00%  2.2850us         2  1.1420us     300ns  1.9850us  cuDeviceGetCount
  0.00%     673ns         2     336ns     229ns     444ns  cuDeviceGet
  0.00%     418ns         1     418ns     418ns     418ns  cudaGetLastError
