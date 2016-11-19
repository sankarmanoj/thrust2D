==16848== NVPROF is profiling process 16848, command: ./scharr_filter.o
==16848== Profiling application: ./scharr_filter.o
==16848== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 42.93%  185.04us         1  185.04us  185.04us  185.04us  [CUDA memcpy DtoH]
 34.20%  147.41us        26  5.6690us     512ns  132.92us  [CUDA memcpy HtoD]
 19.99%  86.170us         1  86.170us  86.170us  86.170us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
  2.34%  10.078us         4  2.5190us     832ns  3.9990us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.53%  2.3030us         1  2.3030us  2.3030us  2.3030us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==16848== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.34%  606.77ms        12  50.564ms  7.4050us  605.37ms  cudaMalloc
  1.85%  11.556ms        91  126.99us     131ns  5.6466ms  cuDeviceGetAttribute
  0.38%  2.3801ms         5  476.03us  8.5830us  2.2697ms  cudaFree
  0.15%  917.24us         8  114.65us  9.6170us  772.26us  cudaMemcpy
  0.09%  577.83us         1  577.83us  577.83us  577.83us  cuDeviceGetName
  0.06%  385.16us        19  20.271us  3.4900us  316.17us  cudaMemcpyAsync
  0.04%  269.56us         1  269.56us  269.56us  269.56us  cudaGetDeviceProperties
  0.03%  209.57us         1  209.57us  209.57us  209.57us  cuDeviceTotalMem
  0.02%  151.17us         6  25.194us  13.351us  55.135us  cudaLaunch
  0.01%  70.965us        20  3.5480us  2.4480us  9.1670us  cudaFuncGetAttributes
  0.00%  14.087us        15     939ns     416ns  4.5520us  cudaGetDevice
  0.00%  9.6040us         5  1.9200us  1.4470us  2.5530us  cudaEventCreateWithFlags
  0.00%  8.1500us         5  1.6300us  1.2770us  2.7540us  cudaEventRecord
  0.00%  7.3450us         5  1.4690us  1.1470us  2.2750us  cudaEventDestroy
  0.00%  7.1090us        11     646ns     410ns  1.9740us  cudaDeviceGetAttribute
  0.00%  6.5370us         9     726ns     189ns  3.9520us  cudaSetupArgument
  0.00%  4.8380us         6     806ns     380ns  1.4990us  cudaConfigureCall
  0.00%  4.0850us         3  1.3610us     155ns  3.5910us  cuDeviceGetCount
  0.00%  3.4340us         3  1.1440us     185ns  2.5850us  cuDeviceGet
  0.00%  1.1950us         1  1.1950us  1.1950us  1.1950us  cudaGetLastError
