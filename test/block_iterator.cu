#include <thrust/block_2d.h>
#include <thrust/window_2d.h>
#include <thrust/sequence.h>
#include <iostream>
using namespace thrust;
// testing block_iterator
int main()
{
  block_2d<int> a1(4,5);
  block_2d<int> b = a1;
  sequence(b.begin(),b.end());
  // block_iterator<int> c = b.begin();
  // std::cout<<"Indexing Test \n";
  // for (int i=0; i<20;i++)
  // {
  //     std::cout<<c[i]<< " ";
  // }
  // std::cout<<"Increment Test \n";
  // c = b.begin();
  // std::cout<<c[0]<<"\n";
  // c = c + 1;
  // std::cout<<c[0]<<"\n";
  // std::cout<<"block_iterator end() Test \n";
  // c = b.end();
  // std::cout<<c[0]<<"\n";
  // c = b.begin();
  std::cout<<b.begin() - b.end()<<"\n";
  std::cout<<"\n";
  return 0;
}
