==8554== NVPROF is profiling process 8554, command: ./perfsig.out 1000 10
==8554== Profiling application: ./perfsig.out 1000 10
==8554== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 73.91%  128.37ms     77000  1.6670us  1.6310us  8.1920us  void reduce_wShrdMem<float>(float*, float*, unsigned int)
 21.82%  37.900ms     11000  3.4450us  3.3910us  7.7120us  GPU_compute_forceonparticle_KERNEL(int, int, int, float, float*, float*, float*)
  4.22%  7.3313ms     11022     665ns     639ns  7.6160us  [CUDA memcpy DtoH]
  0.01%  25.728us        11  2.3380us  2.2400us  2.8160us  void GPU_compute_KE_wShrdMem<float>(float*, float*, unsigned int)
  0.01%  20.543us        10  2.0540us  1.4720us  6.2070us  GPU_updateVel(int, float, float, float*, float const *, float const *)
  0.01%  17.568us        10  1.7560us  1.7280us  1.8240us  GPU_updatePos(int, float, float*, float const *, float const *)
  0.01%  11.936us        10  1.1930us  1.1840us  1.2160us  GPU_updateAcc(int, float, float*, float const *)
  0.00%  6.3040us         4  1.5760us  1.5680us  1.6000us  [CUDA memcpy HtoD]

==8554== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 43.33%  476.30ms     88041  5.4100us  1.6020us  706.81us  cudaThreadSynchronize
 33.60%  369.33ms     88041  4.1940us  3.7420us  258.42us  cudaLaunch
 10.21%  112.27ms         7  16.039ms  3.5190us  111.97ms  cudaMalloc
  8.11%  89.194ms     11026  8.0890us  7.5180us  209.03us  cudaMemcpy
  3.59%  39.409ms    308183     127ns     100ns  249.10us  cudaSetupArgument
  1.12%  12.303ms     88041     139ns     116ns  197.62us  cudaConfigureCall
  0.02%  232.73us        91  2.5570us      96ns  90.239us  cuDeviceGetAttribute
  0.01%  152.78us         1  152.78us  152.78us  152.78us  cuDeviceTotalMem
  0.00%  23.688us         1  23.688us  23.688us  23.688us  cuDeviceGetName
  0.00%  1.3120us         3     437ns      90ns  1.0740us  cuDeviceGetCount
  0.00%     678ns         3     226ns     108ns     316ns  cuDeviceGet
