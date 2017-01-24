namespace thrust
{
  template <class Func>
  __global__ void for_each_kernel(Iterator a, Func F)
  {

  }
  template <class Func>
  void for_each(cuda::shared_policy,Iterator begin1, Iterator end1, Func f)
  {

  }
}
