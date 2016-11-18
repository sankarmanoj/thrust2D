==6726== NVPROF is profiling process 6726, command: ./pyrup.o
==6726== Profiling application: ./pyrup.o
==6726== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 63.89%  789.56us        19  41.555us     320ns  774.91us  [CUDA memcpy DtoH]
 25.59%  316.19us         1  316.19us  316.19us  316.19us  void thrust::for_each_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, convolutionFunctor)
  8.40%  103.81us        24  4.3250us     544ns  80.447us  [CUDA memcpy HtoD]
  1.87%  23.168us         3  7.7220us  1.6320us  16.672us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.25%  3.1040us         1  3.1040us  3.1040us  3.1040us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6726== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.75%  1.35648s         9  150.72ms  5.4360us  1.35094s  cudaMalloc
  1.20%  16.763ms         4  4.1908ms  19.359us  15.370ms  cudaFree
  1.06%  14.800ms        90  164.45us     102ns  7.9004ms  cuDeviceGetAttribute
  0.43%  5.9920ms         1  5.9920ms  5.9920ms  5.9920ms  cudaGetDeviceProperties
  0.22%  3.0414ms         1  3.0414ms  3.0414ms  3.0414ms  cuDeviceTotalMem
  0.17%  2.4469ms         1  2.4469ms  2.4469ms  2.4469ms  cuDeviceGetName
  0.13%  1.8017ms         6  300.29us  5.3500us  1.7090ms  cudaMemcpy
  0.04%  614.33us        37  16.603us  2.0630us  349.00us  cudaMemcpyAsync
  0.01%  95.010us         5  19.002us  6.9900us  25.796us  cudaLaunch
  0.00%  32.285us        16  2.0170us  1.4020us  5.2980us  cudaFuncGetAttributes
  0.00%  7.0040us        12     583ns     217ns  1.8610us  cudaGetDevice
  0.00%  5.9520us         7     850ns     135ns  4.1820us  cudaSetupArgument
  0.00%  5.1340us         4  1.2830us     704ns  1.8800us  cudaEventCreateWithFlags
  0.00%  4.1740us         4  1.0430us     617ns  1.3670us  cudaEventRecord
  0.00%  3.5720us         4     893ns     538ns  1.0910us  cudaEventDestroy
  0.00%  3.2370us         5     647ns     228ns  1.0140us  cudaConfigureCall
  0.00%  3.0590us        11     278ns     207ns     696ns  cudaDeviceGetAttribute
  0.00%  1.8680us         2     934ns     238ns  1.6300us  cuDeviceGetCount
  0.00%     396ns         2     198ns     135ns     261ns  cuDeviceGet
