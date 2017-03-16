#include <thrust/device_vector.h>
#include "window_structures.h"
#include "block_2d.h"

namespace thrust
{
  template <class T,class BinaryFunc>
  void row_reduce (cuda::shared_policy,block_iterator<T> first,block_iterator<T> last, detail::normal_iterator<device_ptr<T> > output, BinaryFunc b);
}
#include "shared_2d_reduce.inl"
