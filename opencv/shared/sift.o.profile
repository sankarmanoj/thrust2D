==7128== NVPROF is profiling process 7128, command: ./sift.o
==7128== Profiling application: ./sift.o
==7128== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 63.98%  2.5211ms        12  210.09us     544ns  2.1360ms  [CUDA memcpy HtoD]
 30.55%  1.2037ms         1  1.2037ms  1.2037ms  1.2037ms  void thrust::transform_kernel<float, siftTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, siftTransformFunctor)
  4.60%  181.34us         1  181.34us  181.34us  181.34us  [CUDA memcpy DtoH]
  0.63%  24.768us         4  6.1920us  1.3120us  15.104us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.25%  9.7920us         3  3.2640us  1.5040us  5.1200us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==7128== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.72%  765.14ms        16  47.822ms  6.9110us  747.67ms  cudaMalloc
  0.60%  4.7282ms         7  675.45us  11.465us  3.2626ms  cudaFree
  0.48%  3.7561ms         3  1.2520ms  150.18us  3.0871ms  cudaMemcpyAsync
  0.41%  3.2438ms         1  3.2438ms  3.2438ms  3.2438ms  cudaGetDeviceProperties
  0.22%  1.7558ms        90  19.508us     132ns  687.58us  cuDeviceGetAttribute
  0.19%  1.5069ms        10  150.69us  21.099us  510.67us  cudaMemcpy
  0.16%  1.2665ms         1  1.2665ms  1.2665ms  1.2665ms  cudaDeviceSynchronize
  0.08%  610.39us         8  76.298us  37.131us  149.92us  cudaLaunch
  0.06%  452.47us        28  16.159us  1.4630us  326.02us  cudaFuncGetAttributes
  0.03%  247.44us         1  247.44us  247.44us  247.44us  cuDeviceTotalMem
  0.01%  94.893us         1  94.893us  94.893us  94.893us  cuDeviceGetName
  0.01%  46.666us        21  2.2220us     211ns  9.3110us  cudaGetDevice
  0.00%  39.024us         7  5.5740us  2.5910us  9.7920us  cudaEventCreateWithFlags
  0.00%  36.363us         7  5.1940us  2.0710us  9.6150us  cudaEventRecord
  0.00%  25.768us         7  3.6810us  2.2110us  5.7580us  cudaEventDestroy
  0.00%  20.189us         8  2.5230us     922ns  6.4770us  cudaConfigureCall
  0.00%  16.454us        11  1.4950us     225ns  7.4710us  cudaSetupArgument
  0.00%  6.9290us        11     629ns     320ns  2.3240us  cudaDeviceGetAttribute
  0.00%  5.5220us         2  2.7610us  1.0050us  4.5170us  cuDeviceGetCount
  0.00%  1.2530us         2     626ns     433ns     820ns  cuDeviceGet
  0.00%     490ns         1     490ns     490ns     490ns  cudaGetLastError
