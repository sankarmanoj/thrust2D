==29309== NVPROF is profiling process 29309, command: ./dilate.o
==29309== Profiling application: ./dilate.o
==29309== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 63.47%  200.42us         1  200.42us  200.42us  200.42us  [CUDA memcpy DtoH]
 23.98%  75.712us         6  12.618us     736ns  71.456us  [CUDA memcpy HtoD]
  7.65%  24.160us         1  24.160us  24.160us  24.160us  void thrust::transform_texture_kernel<unsigned char, dilateFunctor>(unsigned __int64, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, dilateFunctor)
  3.77%  11.904us         3  3.9680us  3.1360us  4.7040us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.12%  3.5520us         1  3.5520us  3.5520us  3.5520us  [CUDA memcpy DtoD]

==29309== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 95.98%  483.68ms         8  60.460ms  5.1650us  478.69ms  cudaMalloc
  1.43%  7.2024ms         2  3.6012ms  3.4066ms  3.7958ms  cudaGetDeviceProperties
  0.79%  3.9652ms        91  43.573us     136ns  2.3616ms  cuDeviceGetAttribute
  0.76%  3.8353ms         1  3.8353ms  3.8353ms  3.8353ms  cudaMallocPitch
  0.65%  3.2582ms         3  1.0861ms  7.8680us  3.1985ms  cudaFree
  0.26%  1.3080ms         6  218.01us  9.2680us  406.41us  cudaMemcpy
  0.04%  211.68us         1  211.68us  211.68us  211.68us  cuDeviceTotalMem
  0.03%  161.45us         4  40.363us  9.5290us  66.805us  cudaLaunch
  0.02%  83.457us         1  83.457us  83.457us  83.457us  cudaMemcpy2D
  0.01%  48.474us         1  48.474us  48.474us  48.474us  cudaMemcpyAsync
  0.01%  39.070us        12  3.2550us  1.4100us  9.3890us  cudaFuncGetAttributes
  0.01%  37.229us         1  37.229us  37.229us  37.229us  cudaCreateTextureObject
  0.01%  35.172us         1  35.172us  35.172us  35.172us  cuDeviceGetName
  0.00%  17.029us         3  5.6760us     968ns  10.653us  cudaEventCreateWithFlags
  0.00%  9.7230us         9  1.0800us     208ns  3.7850us  cudaGetDevice
  0.00%  8.3910us         4  2.0970us     307ns  3.3650us  cudaConfigureCall
  0.00%  7.3420us         3  2.4470us     765ns  3.6520us  cudaEventRecord
  0.00%  6.5420us        11     594ns     321ns  1.9900us  cudaDeviceGetAttribute
  0.00%  5.2650us         3  1.7550us     586ns  2.6360us  cudaEventDestroy
  0.00%  5.2640us         7     752ns     156ns  1.4570us  cudaSetupArgument
  0.00%  4.8910us         3  1.6300us     170ns  4.1170us  cuDeviceGetCount
  0.00%  1.6030us         3     534ns     199ns     757ns  cuDeviceGet
  0.00%     257ns         1     257ns     257ns     257ns  cudaCreateChannelDesc
