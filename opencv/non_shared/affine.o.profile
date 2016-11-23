==3323== NVPROF is profiling process 3323, command: ./affine.o
==3323== Profiling application: ./affine.o
==3323== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 55.24%  346.38us        10  34.637us     705ns  339.05us  [CUDA memcpy HtoD]
 30.99%  194.33us         1  194.33us  194.33us  194.33us  [CUDA memcpy DtoH]
  9.11%  57.105us         1  57.105us  57.105us  57.105us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<AffineTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.66%  29.194us         3  9.7310us  2.2410us  15.045us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3323== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.12%  1.12778s         6  187.96ms  8.9530us  1.12507s  cudaMalloc
  0.47%  5.3172ms        90  59.080us     129ns  2.7471ms  cuDeviceGetAttribute
  0.23%  2.6311ms         3  877.04us  40.551us  2.5499ms  cudaFree
  0.05%  596.74us         4  149.18us  10.912us  503.04us  cudaMemcpy
  0.04%  440.16us         1  440.16us  440.16us  440.16us  cuDeviceTotalMem
  0.04%  439.21us         1  439.21us  439.21us  439.21us  cuDeviceGetName
  0.03%  326.77us         7  46.681us  3.1330us  300.72us  cudaMemcpyAsync
  0.01%  125.96us         4  31.488us  15.098us  48.291us  cudaLaunch
  0.00%  53.620us         1  53.620us  53.620us  53.620us  cudaDeviceSynchronize
  0.00%  46.900us        16  2.9310us  1.4260us  6.3310us  cudaFuncGetAttributes
  0.00%  8.9100us        12     742ns     229ns  2.0090us  cudaGetDevice
  0.00%  8.6260us         4  2.1560us  1.4360us  3.3100us  cudaEventCreateWithFlags
  0.00%  6.7510us        11     613ns     343ns  1.4950us  cudaDeviceGetAttribute
  0.00%  6.7220us         4  1.6800us  1.1780us  2.6830us  cudaEventRecord
  0.00%  5.6960us         4  1.4240us  1.0210us  1.9970us  cudaEventDestroy
  0.00%  5.5680us         4  1.3920us     382ns  2.9280us  cudaSetupArgument
  0.00%  3.0100us         4     752ns     427ns  1.3500us  cudaConfigureCall
  0.00%  2.1640us         2  1.0820us     652ns  1.5120us  cuDeviceGetCount
  0.00%     693ns         2     346ns     344ns     349ns  cuDeviceGet
