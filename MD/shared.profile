==8534== NVPROF is profiling process 8534, command: ./shared_perfsig.out 1000 10
==8534== Profiling application: ./shared_perfsig.out 1000 10
==8534== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 44.71%  101.97ms     11000  9.2700us  8.4160us  679.16us  //Non Shared <compute_forceonparticle_functor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 24.42%  55.688ms     44000  1.2650us  1.2160us  8.2880us  //All reduces void thrust::generic_reduce_kernel<thrust::detail::normal_iterator<thrust::device_ptr<float>>, float, unsigned int=256, thrust::plus<float>>(float, thrust::device_ptr<float>*, unsigned int, float)
 22.58%  51.492ms     77033     668ns     320ns  8.2240us  [CUDA memcpy DtoH]
  8.19%  18.687ms     33012     566ns     543ns  7.4240us  [CUDA memcpy HtoD]
  0.03%  76.574us        30  2.5520us  2.4000us  2.8160us  //Non Shared <updateOp>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.03%  64.320us        30  2.1440us  1.9840us  2.4640us  //Non Shared <updateVelOp>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.02%  49.184us        33  1.4900us  1.3760us  1.7280us  //Shared Transform Reduce void thrust::unary_generic_reduce_kernel<thrust::detail::normal_iterator<thrust::device_ptr<float>>, float, squareOp, unsigned int=256, thrust::plus<float>>(float, thrust::device_ptr<float>*, unsigned int, thrust::detail::normal_iterator<thrust::device_ptr<float>>, squareOp)
  0.01%  33.888us        30  1.1290us  1.0240us  1.3440us  //Shared  updateAccOp>(long, float, thrust::device_ptr<float>, thrust::detail::normal_iterator<thrust::device_ptr<float>>)

==8534== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 32.31%  441.02ms     44033  10.015us  8.2300us  682.18us  cudaMemcpy
 24.80%  338.48ms     55139  6.1380us  4.2910us  242.55us  cudaLaunch
 24.08%  328.67ms     66012  4.9780us  2.4240us  14.852ms  cudaMemcpyAsync
  8.85%  120.83ms        18  6.7129ms  3.6950us  120.47ms  cudaMalloc
  4.75%  64.764ms     44304  1.4610us  1.3160us  244.75us  cudaFuncGetAttributes
  1.82%  24.873ms    187361     132ns     104ns  288.64us  cudaSetupArgument
  0.82%  11.160ms     55139     202ns     133ns  205.60us  cudaConfigureCall
  0.75%  10.172ms     11076     918ns     539ns  44.982us  cudaEventCreateWithFlags
  0.73%  9.9313ms     33228     298ns     199ns  201.76us  cudaGetDevice
  0.55%  7.4549ms     11076     673ns     461ns  200.65us  cudaEventRecord
  0.47%  6.3714ms     11076     575ns     398ns  14.292us  cudaEventDestroy
  0.05%  643.27us         3  214.42us  210.34us  217.71us  cudaGetDeviceProperties
  0.02%  293.98us        91  3.2300us      96ns  115.52us  cuDeviceGetAttribute
  0.01%  158.04us         1  158.04us  158.04us  158.04us  cuDeviceTotalMem
  0.00%  28.570us         1  28.570us  28.570us  28.570us  cuDeviceGetName
  0.00%  3.1990us        11     290ns     203ns     782ns  cudaDeviceGetAttribute
  0.00%  1.3480us         3     449ns     120ns  1.0610us  cuDeviceGetCount
  0.00%     606ns         3     202ns     101ns     308ns  cuDeviceGet
