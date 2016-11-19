==3615== NVPROF is profiling process 3615, command: ./gaussian_filter.o
==3615== Profiling application: ./gaussian_filter.o
==3615== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 54.15%  268.08us         1  268.08us  268.08us  268.08us  void thrust::transform_texture_kernel<float, convolutionFunctor>(unsigned __int64, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, convolutionFunctor)
 21.15%  104.73us        25  4.1890us     544ns  81.399us  [CUDA memcpy HtoD]
 19.68%  97.436us        19  5.1280us     320ns  82.487us  [CUDA memcpy DtoH]
  2.19%  10.819us         1  10.819us  10.819us  10.819us  [CUDA memcpy DtoD]
  2.09%  10.372us         3  3.4570us  1.6010us  4.5450us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.74%  3.6490us         1  3.6490us  3.6490us  3.6490us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3615== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.13%  962.44ms        10  96.244ms  5.3030us  950.55ms  cudaMalloc
  1.74%  17.232ms         2  8.6162ms  762.89us  16.470ms  cudaGetDeviceProperties
  0.51%  5.0241ms         1  5.0241ms  5.0241ms  5.0241ms  cudaMallocPitch
  0.38%  3.7266ms         4  931.66us  10.378us  2.4440ms  cudaFree
  0.09%  878.25us        90  9.7580us     116ns  358.93us  cuDeviceGetAttribute
  0.06%  567.08us         7  81.012us  5.1970us  443.40us  cudaMemcpy
  0.03%  337.22us        37  9.1140us  2.1460us  62.111us  cudaMemcpyAsync
  0.03%  264.47us         1  264.47us  264.47us  264.47us  cuDeviceTotalMem
  0.02%  227.36us         1  227.36us  227.36us  227.36us  cuDeviceGetName
  0.01%  97.752us         5  19.550us  7.5050us  27.138us  cudaLaunch
  0.00%  36.185us        16  2.2610us  1.4030us  7.4030us  cudaFuncGetAttributes
  0.00%  32.584us         1  32.584us  32.584us  32.584us  cudaMemcpy2D
  0.00%  12.552us         1  12.552us  12.552us  12.552us  cudaCreateTextureObject
  0.00%  8.1760us        12     681ns     216ns  2.0830us  cudaGetDevice
  0.00%  5.6640us         4  1.4160us     831ns  1.7060us  cudaEventCreateWithFlags
  0.00%  5.0260us         4  1.2560us     722ns  1.4760us  cudaEventRecord
  0.00%  4.6390us         2  2.3190us     664ns  3.9750us  cuDeviceGetCount
  0.00%  3.9400us         4     985ns     520ns  1.2420us  cudaEventDestroy
  0.00%  3.7020us         5     740ns     160ns     980ns  cudaConfigureCall
  0.00%  3.0700us        11     279ns     209ns     719ns  cudaDeviceGetAttribute
  0.00%  2.2680us         8     283ns     118ns     437ns  cudaSetupArgument
  0.00%     885ns         2     442ns     157ns     728ns  cuDeviceGet
  0.00%     160ns         1     160ns     160ns     160ns  cudaCreateChannelDesc
