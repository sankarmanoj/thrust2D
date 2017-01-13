==15003== NVPROF is profiling process 15003, command: ./erode.o 1631
==15003== Profiling application: ./erode.o 1631
==15003== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 75.76%  8.4651ms         1  8.4651ms  8.4651ms  8.4651ms  [CUDA memcpy DtoH]
 17.71%  1.9791ms         5  395.83us     736ns  1.9752ms  [CUDA memcpy HtoD]
  2.98%  332.86us         1  332.86us  332.86us  332.86us  void thrust::transform_texture_kernel<unsigned char, erodeFunctor>(unsigned __int64, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, erodeFunctor)
  1.94%  216.77us         1  216.77us  216.77us  216.77us  [CUDA memcpy DtoD]
  1.61%  179.94us         3  59.978us  57.184us  62.848us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==15003== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 93.60%  708.02ms         7  101.15ms  27.741us  700.96ms  cudaMalloc
  2.65%  20.021ms         2  10.011ms  203.10us  19.818ms  cudaGetDeviceProperties
  1.58%  11.974ms         1  11.974ms  11.974ms  11.974ms  cudaMallocPitch
  1.58%  11.952ms         5  2.3904ms  57.241us  11.609ms  cudaMemcpy
  0.36%  2.7604ms         1  2.7604ms  2.7604ms  2.7604ms  cudaMemcpyAsync
  0.06%  439.18us         4  109.79us  77.701us  134.43us  cudaLaunch
  0.04%  306.47us         1  306.47us  306.47us  306.47us  cuDeviceTotalMem
  0.03%  249.44us         3  83.145us  53.508us  139.28us  cudaFree
  0.03%  247.90us        90  2.7540us     136ns  89.462us  cuDeviceGetAttribute
  0.03%  199.16us         1  199.16us  199.16us  199.16us  cudaMemcpy2D
  0.01%  74.824us        12  6.2350us  2.0060us  20.569us  cudaFuncGetAttributes
  0.01%  40.246us         1  40.246us  40.246us  40.246us  cudaCreateTextureObject
  0.00%  27.752us         9  3.0830us     319ns  9.1620us  cudaGetDevice
  0.00%  27.366us         1  27.366us  27.366us  27.366us  cuDeviceGetName
  0.00%  22.036us         4  5.5090us  3.5040us  8.7880us  cudaConfigureCall
  0.00%  17.453us         3  5.8170us  5.2910us  6.1860us  cudaEventRecord
  0.00%  14.864us         3  4.9540us  4.2140us  5.6830us  cudaEventCreateWithFlags
  0.00%  11.013us        11  1.0010us     297ns  4.6210us  cudaDeviceGetAttribute
  0.00%  10.093us         7  1.4410us     162ns  3.0200us  cudaSetupArgument
  0.00%  9.2260us         3  3.0750us  2.0570us  3.8710us  cudaEventDestroy
  0.00%  2.4320us         2  1.2160us     298ns  2.1340us  cuDeviceGetCount
  0.00%     450ns         2     225ns     138ns     312ns  cuDeviceGet
  0.00%     212ns         1     212ns     212ns     212ns  cudaCreateChannelDesc
