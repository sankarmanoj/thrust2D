#include <thrust/block_2d.h>
#include <thrust/window_2d.h>
#include <thrust/sequence.h>
#include <iostream>
#define X 7
#define Y 6
using namespace thrust;
// testing zip_iterator
int main()
{
  Block_2D<int> a1(X,Y);
  Block_2D<int> b = a1;
  device_vector<int> a(X*Y);
  sequence(a.begin(),a.end());
  b.copy(a.begin(),a.end());
  window_vector<int> myVector = window_vector<int>(&b,3,3 ,1,1);
  std::cout<<"Size ="<<myVector.end()-myVector.begin()<<std::endl;
  std::cout<<"Size ="<<thrust::make_zip_iterator(thrust::make_tuple(myVector.end(),myVector.end()))-thrust::make_zip_iterator(thrust::make_tuple(myVector.begin(),myVector.begin()))<<std::endl;
  return 0;
}
