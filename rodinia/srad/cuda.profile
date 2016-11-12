==690== NVPROF is profiling process 690, command: cuda/srad.out 100 0.5 502 458
==690== Profiling application: cuda/srad.out 100 0.5 502 458
==690== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 34.30%  4.8293ms       100  48.293us  46.720us  51.168us  srad(float, int, int, long, int*, int*, int*, int*, float*, float*, float*, float*, float, float*, float*)
 27.91%  3.9295ms       100  39.295us  37.984us  40.864us  srad2(float, int, int, long, int*, int*, int*, int*, float*, float*, float*, float*, float*, float*)
 26.86%  3.7813ms       200  18.906us  12.064us  26.240us  reduce(long, int, int, float*, float*)
  8.50%  1.1971ms       100  11.970us  10.816us  13.056us  prepare(long, float*, float*, float*)
  1.76%  247.71us       201  1.2320us     320ns  72.320us  [CUDA memcpy DtoH]
  0.54%  76.160us         5  15.232us  1.2160us  71.296us  [CUDA memcpy HtoD]
  0.06%  8.9920us         1  8.9920us  8.9920us  8.9920us  extract(long, float*)
  0.06%  8.1920us         1  8.1920us  8.1920us  8.1920us  compress(long, float*)

==690== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 85.98%  123.83ms        12  10.319ms  3.8150us  122.20ms  cudaMalloc
 10.46%  15.058ms       206  73.096us  4.9320us  368.36us  cudaMemcpy
  1.76%  2.5322ms       502  5.0440us  3.0020us  17.006us  cudaLaunch
  0.48%  693.51us      4304     161ns     111ns  1.5610us  cudaSetupArgument
  0.41%  589.02us         1  589.02us  589.02us  589.02us  cuDeviceTotalMem
  0.36%  516.97us        90  5.7440us     263ns  198.78us  cuDeviceGetAttribute
  0.31%  440.01us        12  36.667us  3.4440us  114.66us  cudaFree
  0.14%  202.74us      1104     183ns     109ns     696ns  cudaGetLastError
  0.06%  90.714us       502     180ns     115ns     730ns  cudaConfigureCall
  0.04%  60.904us         1  60.904us  60.904us  60.904us  cuDeviceGetName
  0.00%  3.6240us         2  1.8120us  1.0690us  2.5550us  cuDeviceGetCount
  0.00%  1.0930us         2     546ns     480ns     613ns  cuDeviceGet
