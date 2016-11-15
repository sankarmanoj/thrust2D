==10788== NVPROF is profiling process 10788, command: ./dilate.o
==10788== Profiling application: ./dilate.o
==10788== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 47.00%  146.56us         1  146.56us  146.56us  146.56us  void thrust::transform_kernel<float, dilateFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, dilateFunctor)
 25.29%  78.850us         6  13.141us  1.1840us  72.801us  [CUDA memcpy HtoD]
 23.71%  73.922us         1  73.922us  73.922us  73.922us  [CUDA memcpy DtoH]
  2.73%  8.5130us         2  4.2560us  3.7130us  4.8000us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.27%  3.9680us         1  3.9680us  3.9680us  3.9680us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==10788== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.44%  552.93ms         8  69.116ms  5.5060us  552.19ms  cudaMalloc
  0.31%  1.7471ms        90  19.412us     115ns  738.43us  cuDeviceGetAttribute
  0.08%  417.47us         6  69.579us  4.6310us  313.85us  cudaMemcpy
  0.05%  277.27us         1  277.27us  277.27us  277.27us  cudaGetDeviceProperties
  0.05%  275.74us         1  275.74us  275.74us  275.74us  cuDeviceTotalMem
  0.04%  217.73us         3  72.576us  23.510us  118.78us  cudaFree
  0.01%  54.857us         1  54.857us  54.857us  54.857us  cuDeviceGetName
  0.01%  53.804us         1  53.804us  53.804us  53.804us  cudaMemcpyAsync
  0.01%  50.420us         4  12.605us  6.6400us  21.421us  cudaLaunch
  0.00%  20.516us        12  1.7090us  1.4140us  3.4750us  cudaFuncGetAttributes
  0.00%  6.3410us         7     905ns     119ns  5.1970us  cudaSetupArgument
  0.00%  3.6780us         9     408ns     215ns  1.3200us  cudaGetDevice
  0.00%  3.3880us         3  1.1290us     758ns  1.6350us  cudaEventCreateWithFlags
  0.00%  3.2760us        11     297ns     206ns  1.0460us  cudaDeviceGetAttribute
  0.00%  2.7750us         3     925ns     663ns  1.2780us  cudaEventRecord
  0.00%  2.1410us         3     713ns     508ns     951ns  cudaEventDestroy
  0.00%  1.7570us         2     878ns     223ns  1.5340us  cuDeviceGetCount
  0.00%  1.6370us         4     409ns     214ns     853ns  cudaConfigureCall
  0.00%     444ns         2     222ns     128ns     316ns  cuDeviceGet
  0.00%     390ns         1     390ns     390ns     390ns  cudaGetLastError
