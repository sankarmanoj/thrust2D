==6982== NVPROF is profiling process 6982, command: ./lbp.o
==6982== Profiling application: ./lbp.o
==6982== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 53.72%  195.91us         1  195.91us  195.91us  195.91us  void thrust::transform_kernel<float, lbpFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, lbpFunctor)
 22.53%  82.163us         6  13.693us     768ns  76.436us  [CUDA memcpy HtoD]
 20.27%  73.909us         1  73.909us  73.909us  73.909us  [CUDA memcpy DtoH]
  2.37%  8.6380us         2  4.3190us  3.9350us  4.7030us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.11%  4.0630us         1  4.0630us  4.0630us  4.0630us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6982== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.50%  524.10ms         8  65.513ms  4.6300us  522.97ms  cudaMalloc
  0.93%  4.9591ms        90  55.100us     108ns  3.4232ms  cuDeviceGetAttribute
  0.16%  841.53us         6  140.26us  5.2160us  733.63us  cudaMemcpy
  0.11%  599.73us         1  599.73us  599.73us  599.73us  cudaGetDeviceProperties
  0.11%  581.68us         1  581.68us  581.68us  581.68us  cuDeviceGetName
  0.08%  425.88us         3  141.96us  32.619us  254.29us  cudaFree
  0.05%  269.22us         1  269.22us  269.22us  269.22us  cuDeviceTotalMem
  0.03%  135.88us         1  135.88us  135.88us  135.88us  cudaMemcpyAsync
  0.02%  107.48us         4  26.869us  7.4070us  37.187us  cudaLaunch
  0.00%  25.681us        12  2.1400us  1.4130us  5.7890us  cudaFuncGetAttributes
  0.00%  7.4270us         7  1.0610us     186ns  5.4750us  cudaSetupArgument
  0.00%  5.9420us         9     660ns     218ns  2.4910us  cudaGetDevice
  0.00%  4.7860us         4  1.1960us     255ns  2.3350us  cudaConfigureCall
  0.00%  4.5040us         3  1.5010us     775ns  2.0060us  cudaEventCreateWithFlags
  0.00%  4.1660us         2  2.0830us  1.7970us  2.3690us  cuDeviceGetCount
  0.00%  3.8670us         3  1.2890us     662ns  1.6410us  cudaEventRecord
  0.00%  3.6830us        11     334ns     210ns  1.1970us  cudaDeviceGetAttribute
  0.00%  2.8540us         3     951ns     553ns  1.1840us  cudaEventDestroy
  0.00%     984ns         2     492ns     387ns     597ns  cuDeviceGet
  0.00%     592ns         1     592ns     592ns     592ns  cudaGetLastError
