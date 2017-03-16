#pragma once
#include <thrust/execution_policy.h>
namespace thrust
{
  int iDivUp(int a, int b)
  {
      return (a % b != 0) ? (a / b + 1) : (a / b);
  }

  unsigned int previous_power_of_two(unsigned int x )
  {
    if (x == 0) {
        return 0;
    }
    x--; //Uncomment this, if you want a strictly less than 'x' result.
    x |= (x >> 1);
    x |= (x >> 2);
    x |= (x >> 4);
    x |= (x >> 8);
    x |= (x >> 16);
    return x - (x >> 1);
  }

  namespace cuda
  {
    struct shared_policy : device_execution_policy<shared_policy> {};
    shared_policy shared;
    struct shared_first_policy : device_execution_policy<shared_first_policy> {};
    shared_first_policy shared_first;
    struct texture_policy : device_execution_policy<texture_policy> {};
    texture_policy texture;
  }
  struct warp_launcher_config
  {
    int size_along_x, size_along_y;
    int warp_size;
    int stride_x,stride_y;
    int shared_size_x;
    int padding;
    int block_dim_x, block_dim_y;
    int window_dim_x, window_dim_y;
    int shared_total_size;
  };

}
