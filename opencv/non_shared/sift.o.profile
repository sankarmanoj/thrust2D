==8793== NVPROF is profiling process 8793, command: ./sift.o
==8793== Profiling application: ./sift.o
==8793== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 53.67%  681.65us         1  681.65us  681.65us  681.65us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<siftTransformFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 37.14%  471.74us        11  42.885us  1.1840us  361.66us  [CUDA memcpy HtoD]
  5.82%  73.887us         1  73.887us  73.887us  73.887us  [CUDA memcpy DtoH]
  2.54%  32.223us         5  6.4440us  1.3440us  17.727us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.83%  10.495us         3  3.4980us  1.4070us  5.0560us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8793== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.14%  306.44ms        16  19.153ms  4.6900us  304.72ms  cudaMalloc
  0.30%  941.59us         9  104.62us  4.7710us  880.68us  cudaMemcpy
  0.18%  563.00us         3  187.67us  32.610us  435.64us  cudaMemcpyAsync
  0.14%  440.27us         8  55.033us  5.2200us  126.18us  cudaFree
  0.10%  296.04us        90  3.2890us     104ns  117.37us  cuDeviceGetAttribute
  0.06%  192.08us         1  192.08us  192.08us  192.08us  cuDeviceTotalMem
  0.03%  80.746us         9  8.9710us  5.9110us  13.288us  cudaLaunch
  0.02%  58.064us        36  1.6120us  1.4060us  3.0270us  cudaFuncGetAttributes
  0.01%  26.223us         1  26.223us  26.223us  26.223us  cuDeviceGetName
  0.00%  14.552us        27     538ns     212ns  5.2320us  cudaGetDevice
  0.00%  8.1100us         9     901ns     643ns  1.4360us  cudaEventCreateWithFlags
  0.00%  6.9790us         9     775ns     553ns  1.3490us  cudaEventRecord
  0.00%  6.3650us         9     707ns     212ns  3.9520us  cudaSetupArgument
  0.00%  5.7400us         9     637ns     507ns     993ns  cudaEventDestroy
  0.00%  3.1830us        11     289ns     205ns     974ns  cudaDeviceGetAttribute
  0.00%  3.0410us         9     337ns     195ns     833ns  cudaConfigureCall
  0.00%  1.3010us         2     650ns     162ns  1.1390us  cuDeviceGetCount
  0.00%     282ns         2     141ns     113ns     169ns  cuDeviceGet
