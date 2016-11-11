==5548== NVPROF is profiling process 5548, command: ./sobel_filter.o
==5548== Profiling application: ./sobel_filter.o
==5548== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 46.55%  951.96us         2  475.98us  474.92us  477.04us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 20.95%  428.43us         1  428.43us  428.43us  428.43us  [CUDA memcpy DtoH]
 18.84%  385.37us        28  13.763us     544ns  370.23us  [CUDA memcpy HtoD]
  3.97%  81.239us         1  81.239us  81.239us  81.239us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.56%  72.888us         2  36.444us  36.220us  36.668us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.54%  72.408us         8  9.0510us     991ns  16.990us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  2.38%  48.604us         2  24.302us  24.126us  24.478us  [CUDA memcpy DtoD]
  0.21%  4.2880us         1  4.2880us  4.2880us  4.2880us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==5548== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.08%  596.98ms        18  33.165ms  6.5830us  585.09ms  cudaMalloc
  1.10%  6.7003ms        90  74.447us     104ns  4.0932ms  cuDeviceGetAttribute
  0.16%  957.35us         2  478.68us  477.76us  479.59us  cudaDeviceSynchronize
  0.15%  921.47us        12  76.789us  7.7560us  671.51us  cudaMemcpy
  0.14%  868.90us        14  62.064us  6.4340us  507.27us  cudaLaunch
  0.08%  507.55us        19  26.713us  3.3500us  422.55us  cudaMemcpyAsync
  0.06%  362.50us         1  362.50us  362.50us  362.50us  cuDeviceGetName
  0.06%  356.08us         2  178.04us  177.52us  178.56us  cudaGetDeviceProperties
  0.05%  319.08us         7  45.582us  4.5200us  130.95us  cudaFree
  0.05%  298.82us         1  298.82us  298.82us  298.82us  cuDeviceTotalMem
  0.02%  147.98us        12  12.331us     531ns  132.83us  cudaEventRecord
  0.02%  130.78us        50  2.6150us  1.3190us  11.398us  cudaFuncGetAttributes
  0.00%  27.205us        38     715ns     198ns  3.2020us  cudaGetDevice
  0.00%  24.650us        12  2.0540us     723ns  6.7230us  cudaEventCreateWithFlags
  0.00%  14.449us        12  1.2040us     453ns  3.1640us  cudaEventDestroy
  0.00%  11.622us        22     528ns     103ns  4.6720us  cudaSetupArgument
  0.00%  10.091us        14     720ns     160ns  3.1810us  cudaConfigureCall
  0.00%  7.6660us        19     403ns     200ns  1.4060us  cudaDeviceGetAttribute
  0.00%  1.6740us         2     837ns     661ns  1.0130us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%  1.6600us         2     830ns     278ns  1.3820us  cuDeviceGetCount
  0.00%     718ns         2     359ns     211ns     507ns  cuDeviceGet
  0.00%     713ns         2     356ns     215ns     498ns  cudaGetLastError
