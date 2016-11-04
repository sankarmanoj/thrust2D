==4768== NVPROF is profiling process 4768, command: ./affine.o
==4768== Profiling application: ./affine.o
==4768== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 42.80%  126.76us         1  126.76us  126.76us  126.76us  void thrust::for_each_kernel<float, AffineTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::launcher_config, AffineTransformFunctor)
 28.69%  84.965us        11  7.7240us  1.1840us  72.773us  [CUDA memcpy HtoD]
 24.98%  73.989us         1  73.989us  73.989us  73.989us  [CUDA memcpy DtoH]
  3.52%  10.433us         3  3.4770us  1.4720us  4.9280us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==4768== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.48%  761.65ms         7  108.81ms  5.7420us  757.43ms  cudaMalloc
  1.10%  8.6169ms         1  8.6169ms  8.6169ms  8.6169ms  cudaGetDeviceProperties
  1.07%  8.3683ms         3  2.7894ms  7.6980us  8.3330ms  cudaFree
  0.18%  1.3873ms         1  1.3873ms  1.3873ms  1.3873ms  cuDeviceGetName
  0.04%  318.47us        90  3.5380us     125ns  120.75us  cuDeviceGetAttribute
  0.04%  306.51us         5  61.301us  7.7930us  217.91us  cudaMemcpy
  0.03%  206.19us         1  206.19us  206.19us  206.19us  cuDeviceTotalMem
  0.02%  153.14us         1  153.14us  153.14us  153.14us  cudaDeviceSynchronize
  0.02%  145.24us         7  20.749us  3.0190us  125.21us  cudaMemcpyAsync
  0.01%  107.30us         4  26.824us  20.857us  37.802us  cudaLaunch
  0.00%  38.738us        12  3.2280us  1.9660us  11.433us  cudaFuncGetAttributes
  0.00%  7.0660us         9     785ns     294ns  2.7970us  cudaGetDevice
  0.00%  6.5420us         6  1.0900us     165ns  4.9090us  cudaSetupArgument
  0.00%  6.4270us         3  2.1420us  1.5590us  2.6120us  cudaEventCreateWithFlags
  0.00%  6.1170us         3  2.0390us  1.7200us  2.6210us  cudaEventRecord
  0.00%  4.9240us        11     447ns     292ns  1.1890us  cudaDeviceGetAttribute
  0.00%  4.1460us         3  1.3820us  1.2950us  1.5280us  cudaEventDestroy
  0.00%  4.1020us         4  1.0250us     804ns  1.3520us  cudaConfigureCall
  0.00%  1.6380us         2     819ns     308ns  1.3300us  cuDeviceGetCount
  0.00%     426ns         2     213ns     156ns     270ns  cuDeviceGet
  0.00%     407ns         1     407ns     407ns     407ns  cudaGetLastError
