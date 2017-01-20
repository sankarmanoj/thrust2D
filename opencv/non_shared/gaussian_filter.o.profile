==21027== NVPROF is profiling process 21027, command: ./gaussian_filter.o
==21027== Profiling application: ./gaussian_filter.o
==21027== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.95%  281.55ms         1  281.55ms  281.55ms  281.55ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.03%  72.961us         1  72.961us  72.961us  72.961us  [CUDA memcpy DtoH]
  0.02%  56.928us         7  8.1320us     896ns  48.096us  [CUDA memcpy HtoD]

==21027== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 93.44%  4.04093s         5  808.19ms  7.9940us  4.04060s  cudaMallocPitch
  6.51%  281.67ms         1  281.67ms  281.67ms  281.67ms  cudaDeviceSynchronize
  0.02%  657.64us       166  3.9610us     180ns  144.74us  cuDeviceGetAttribute
  0.01%  448.41us         1  448.41us  448.41us  448.41us  cudaLaunch
  0.01%  388.49us         3  129.50us  32.148us  252.26us  cudaMemcpy2D
  0.00%  208.13us         5  41.626us  9.8370us  155.11us  cudaMalloc
  0.00%  102.98us         5  20.595us  8.5330us  34.927us  cudaMemcpy
  0.00%  80.759us         2  40.379us  39.734us  41.025us  cuDeviceTotalMem
  0.00%  65.513us         2  32.756us  30.999us  34.514us  cuDeviceGetName
  0.00%  16.769us         4  4.1920us  2.2990us  9.6200us  cudaFuncGetAttributes
  0.00%  6.8080us        11     618ns     337ns  2.5340us  cudaDeviceGetAttribute
  0.00%  6.4520us         1  6.4520us  6.4520us  6.4520us  cudaSetupArgument
  0.00%  6.1340us         1  6.1340us  6.1340us  6.1340us  cudaEventCreateWithFlags
  0.00%  4.4160us         3  1.4720us     346ns  3.5970us  cudaGetDevice
  0.00%  3.8130us         1  3.8130us  3.8130us  3.8130us  cudaEventRecord
  0.00%  3.2380us         2  1.6190us     625ns  2.6130us  cuDeviceGetCount
  0.00%  2.2200us         1  2.2200us  2.2200us  2.2200us  cudaEventDestroy
  0.00%  1.8770us         4     469ns     260ns     766ns  cuDeviceGet
  0.00%  1.6450us         1  1.6450us  1.6450us  1.6450us  cudaConfigureCall
