#pragma once
#include <thrust/execution_policy.h>
namespace thrust
{
  int iDivUp(int a, int b)
  {
      return (a % b != 0) ? (a / b + 1) : (a / b);
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
  struct launcher_config
  {
    int shared_block_dim_y , shared_block_dim_x ;
    int rows_per_block_by_windows ;
    int operations_per_block , operations_per_thread;
    int shared_memory_size;
    int blocks; // Total blocks
    int blocks_per_row;
    int total_operations;

  };
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
