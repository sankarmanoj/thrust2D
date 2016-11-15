==8265== NVPROF is profiling process 8265, command: ./erode.o
==8265== Profiling application: ./erode.o
==8265== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 37.68%  139.26us         1  139.26us  139.26us  139.26us  [CUDA memcpy DtoH]
 35.16%  129.95us         5  25.990us     607ns  127.24us  [CUDA memcpy HtoD]
 23.00%  85.016us         1  85.016us  85.016us  85.016us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<erodeFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.43%  12.666us         3  4.2220us  3.8380us  4.5740us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.74%  2.7190us         1  2.7190us  2.7190us  2.7190us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8265== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.05%  840.20ms         8  105.02ms  11.161us  830.19ms  cudaMalloc
  0.68%  5.7958ms         4  1.4489ms  46.199us  4.1244ms  cudaFree
  0.14%  1.2224ms         5  244.48us  16.438us  626.59us  cudaMemcpy
  0.03%  223.45us         1  223.45us  223.45us  223.45us  cudaMemcpyAsync
  0.03%  218.62us        90  2.4290us     132ns  76.303us  cuDeviceGetAttribute
  0.03%  212.35us         5  42.469us  13.613us  65.238us  cudaLaunch
  0.02%  181.08us         1  181.08us  181.08us  181.08us  cuDeviceTotalMem
  0.01%  72.338us        20  3.6160us  1.3840us  21.119us  cudaFuncGetAttributes
  0.00%  25.584us         1  25.584us  25.584us  25.584us  cuDeviceGetName
  0.00%  20.337us        15  1.3550us     206ns  6.7260us  cudaGetDevice
  0.00%  12.399us         5  2.4790us     315ns  6.7160us  cudaSetupArgument
  0.00%  12.203us         5  2.4400us  1.9300us  2.8870us  cudaEventCreateWithFlags
  0.00%  10.624us         5  2.1240us  1.3370us  2.6690us  cudaEventRecord
  0.00%  10.542us         5  2.1080us     752ns  6.5490us  cudaConfigureCall
  0.00%  8.7680us         5  1.7530us  1.4390us  2.5010us  cudaEventDestroy
  0.00%  6.3160us        11     574ns     293ns  1.7070us  cudaDeviceGetAttribute
  0.00%  5.0140us         2  2.5070us     499ns  4.5150us  cuDeviceGetCount
  0.00%  1.1810us         2     590ns     307ns     874ns  cuDeviceGet
