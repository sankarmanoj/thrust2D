==15036== NVPROF is profiling process 15036, command: ./lbp.o 1631
==15036== Profiling application: ./lbp.o 1631
==15036== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 47.59%  2.3135ms         1  2.3135ms  2.3135ms  2.3135ms  [CUDA memcpy DtoH]
 34.25%  1.6650ms         5  333.00us     800ns  1.6608ms  [CUDA memcpy HtoD]
  9.59%  466.02us         1  466.02us  466.02us  466.02us  void thrust::transform_texture_kernel<unsigned char, lbpFunctor>(unsigned __int64, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, lbpFunctor)
  4.86%  236.35us         1  236.35us  236.35us  236.35us  [CUDA memcpy DtoD]
  3.71%  180.45us         3  60.149us  57.728us  61.920us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==15036== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.69%  836.82ms         7  119.55ms  10.804us  835.30ms  cudaMalloc
  0.53%  4.5032ms         5  900.65us  82.927us  4.0299ms  cudaMemcpy
  0.29%  2.4549ms         1  2.4549ms  2.4549ms  2.4549ms  cudaMemcpyAsync
  0.26%  2.1898ms         1  2.1898ms  2.1898ms  2.1898ms  cudaMallocPitch
  0.07%  595.04us         2  297.52us  225.97us  369.07us  cudaGetDeviceProperties
  0.04%  333.77us         3  111.26us  74.639us  179.49us  cudaFree
  0.03%  256.04us        90  2.8440us     135ns  92.797us  cuDeviceGetAttribute
  0.03%  229.60us         4  57.399us  19.571us  126.84us  cudaLaunch
  0.02%  185.30us         1  185.30us  185.30us  185.30us  cuDeviceTotalMem
  0.02%  180.46us         1  180.46us  180.46us  180.46us  cudaMemcpy2D
  0.01%  43.741us        12  3.6450us  1.9180us  12.912us  cudaFuncGetAttributes
  0.00%  37.211us         1  37.211us  37.211us  37.211us  cudaCreateTextureObject
  0.00%  33.464us         1  33.464us  33.464us  33.464us  cuDeviceGetName
  0.00%  14.850us         3  4.9500us  2.2420us  8.2640us  cudaEventCreateWithFlags
  0.00%  11.033us         3  3.6770us  1.9300us  6.7370us  cudaEventRecord
  0.00%  10.969us         9  1.2180us     285ns  4.6590us  cudaGetDevice
  0.00%  10.131us         4  2.5320us     361ns  5.0380us  cudaConfigureCall
  0.00%  7.5550us        11     686ns     287ns  2.7180us  cudaDeviceGetAttribute
  0.00%  7.5310us         3  2.5100us  1.1340us  4.3420us  cudaEventDestroy
  0.00%  5.2730us         7     753ns     160ns  1.8770us  cudaSetupArgument
  0.00%  3.0990us         2  1.5490us  1.0610us  2.0380us  cuDeviceGetCount
  0.00%     519ns         2     259ns     237ns     282ns  cuDeviceGet
  0.00%     179ns         1     179ns     179ns     179ns  cudaCreateChannelDesc
