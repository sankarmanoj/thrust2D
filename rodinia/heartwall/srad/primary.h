#include <thrust/device_vector.h>
#include <thrust/transform.h>
#include <thrust/sequence.h>
#include <thrust/copy.h>
#include <thrust/fill.h>
#include <thrust/replace.h>
#include <thrust/functional.h>
#include <thrust/window_2d.h>
#include "srad_kernel.cu"
void frame_calculate(int *frame, int rows, int cols,int niter, int nErode, float threshold,float lambda);
