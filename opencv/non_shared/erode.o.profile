==5840== NVPROF is profiling process 5840, command: ./erode.o
==5840== Profiling application: ./erode.o
==5840== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 44.84%  41.437us         1  41.437us  41.437us  41.437us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<erodeFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 23.75%  21.950us         5  4.3900us     544ns  19.518us  [CUDA memcpy HtoD]
 20.36%  18.815us         1  18.815us  18.815us  18.815us  [CUDA memcpy DtoH]
 11.05%  10.208us         4  2.5520us  2.1440us  3.7120us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==5840== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.79%  281.84ms         8  35.230ms  4.5070us  281.26ms  cudaMalloc
  0.85%  2.4317ms         4  607.92us  4.3140us  2.3980ms  cudaFree
  0.12%  339.56us        90  3.7720us     191ns  129.63us  cuDeviceGetAttribute
  0.12%  331.64us         1  331.64us  331.64us  331.64us  cuDeviceTotalMem
  0.03%  98.145us         5  19.629us  4.4570us  72.195us  cudaMemcpy
  0.03%  77.770us         5  15.554us  6.0190us  32.834us  cudaLaunch
  0.02%  48.785us         1  48.785us  48.785us  48.785us  cudaMemcpyAsync
  0.01%  40.814us        20  2.0400us  1.4000us  4.5420us  cudaFuncGetAttributes
  0.01%  30.874us         1  30.874us  30.874us  30.874us  cuDeviceGetName
  0.00%  8.3350us        15     555ns     220ns  2.3590us  cudaGetDevice
  0.00%  8.2020us         5  1.6400us     631ns  2.9570us  cudaEventCreateWithFlags
  0.00%  6.7810us         5  1.3560us     219ns  3.4470us  cudaSetupArgument
  0.00%  4.8270us         5     965ns     624ns  1.3880us  cudaEventRecord
  0.00%  3.6710us         5     734ns     449ns  1.0850us  cudaEventDestroy
  0.00%  3.1180us        11     283ns     208ns     752ns  cudaDeviceGetAttribute
  0.00%  2.3680us         5     473ns     208ns     795ns  cudaConfigureCall
  0.00%  1.8040us         2     902ns     271ns  1.5330us  cuDeviceGetCount
  0.00%     567ns         2     283ns     212ns     355ns  cuDeviceGet
