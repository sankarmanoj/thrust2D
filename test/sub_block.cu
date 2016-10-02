#include <thrust/block_2d.h>
#include <thrust/window_2d.h>
#include <thrust/sequence.h>
#include <iostream>
using namespace thrust;
// testing sub block
int main()
{
  block_2d<int> a1(4,5);
  block_2d<int> b = a1;
  device_vector<int> a(20);
  sequence(a.begin(),a.end());
  b.copy(a.begin(),a.end());
  block_2d<int> d(3,3);
  d = *(b.sub_block(1,2,3,4));
  // NOTE: b has also now changed into a sub block.
  std::cout<<"Indexing Test \n";
  for (int i=0; i<3;i++)
  {
    for (int j=0;j<3;j++)
    {
      std::cout<<d[i][j]<< " ";
    }
    std::cout<<"\n";
  }
  std::cout<<"Sub-Block Iterator Test\n";
  block_iterator<int> c = d.begin();
  std::cout<<"Indexing Test \n";
  for (int i=0; i<3;i++)
  {
    for (int j=0;j<3;j++)
    {
      std::cout<<c[i][j]<< " ";
    }
    std::cout<<"\n";
  }
  std::cout<<"Increment Test \n";
  c = b.begin();
  std::cout<<c[0][0]<<"\n";
  c = c + 1;
  std::cout<<c[0][0]<<"\n";
  std::cout<<"block_iterator end() Test \n";
  c = b.end();
  std::cout<<c[0][0]<<"\n";
  std::cout<<"Move Commands Test\nSequence - forward > downward > backward > upward\n(Element, index x, index y)\n";
  c = b.begin();
  std::cout<<c[0][0]<<" "<<c.current_x<<" "<<c.current_y<<"\n";
  c.move_forward();
  std::cout<<c[0][0]<<" "<<c.current_x<<" "<<c.current_y<<"\n";
  c.move_downward();
  std::cout<<c[0][0]<<" "<<c.current_x<<" "<<c.current_y<<"\n";
  c.move_backward();
  std::cout<<c[0][0]<<" "<<c.current_x<<" "<<c.current_y<<"\n";
  c.move_upward();
  std::cout<<c[0][0]<<" "<<c.current_x<<" "<<c.current_y<<"\n";

  std::cout<<"Move Commands Rollover Test \n";
  c = b.begin();
  for (int i=0; i<17; i++)
  {
    std::cout<<c[0][0]<< " ";
    c.move_downward();
  }
  std::cout<<"\n";
  return 0;
}
