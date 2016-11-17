==18202== NVPROF is profiling process 18202, command: ./hotspot_shared.out 1024 2 2 temp_1024 power_1024 result_shared.out
==18202== Profiling application: ./hotspot_shared.out 1024 2 2 temp_1024 power_1024 result_shared.out
==18202== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 57.02%  2.1826ms         5  436.51us     544ns  1.1449ms  [CUDA memcpy HtoD]
 30.15%  1.1543ms         1  1.1543ms  1.1543ms  1.1543ms  [CUDA memcpy DtoH]
 11.87%  454.42us         1  454.42us  454.42us  454.42us  void thrust::for_each_kernel<float, HotspotFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, HotspotFunctor)
  0.96%  36.768us         2  18.384us  17.216us  19.552us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==18202== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.23%  181.20ms         5  36.239ms  5.9680us  180.88ms  cudaMalloc
  1.31%  2.4448ms         2  1.2224ms  1.1867ms  1.2582ms  cudaMemcpyAsync
  1.01%  1.8915ms         4  472.87us  8.6050us  1.8565ms  cudaMemcpy
  0.12%  218.58us        90  2.4280us      95ns  85.618us  cuDeviceGetAttribute
  0.10%  180.78us         1  180.78us  180.78us  180.78us  cudaGetDeviceProperties
  0.09%  167.14us         1  167.14us  167.14us  167.14us  cuDeviceTotalMem
  0.08%  155.45us         2  77.723us  47.292us  108.15us  cudaFree
  0.02%  40.641us         3  13.547us  11.199us  16.328us  cudaLaunch
  0.01%  24.419us         1  24.419us  24.419us  24.419us  cuDeviceGetName
  0.01%  15.205us         8  1.9000us  1.4110us  4.0800us  cudaFuncGetAttributes
  0.00%  3.6940us         5     738ns     138ns  2.8380us  cudaSetupArgument
  0.00%  3.5390us        11     321ns     206ns     943ns  cudaDeviceGetAttribute
  0.00%  3.3240us         6     554ns     206ns  1.5570us  cudaGetDevice
  0.00%  2.7160us         2  1.3580us     861ns  1.8550us  cudaEventRecord
  0.00%  2.6230us         2  1.3110us  1.1180us  1.5050us  cudaEventCreateWithFlags
  0.00%  1.9110us         3     637ns     459ns     940ns  cudaConfigureCall
  0.00%  1.7220us         2     861ns     730ns     992ns  cudaEventDestroy
  0.00%  1.5920us         2     796ns     597ns     995ns  cuDeviceGetCount
  0.00%     426ns         2     213ns     197ns     229ns  cuDeviceGet
