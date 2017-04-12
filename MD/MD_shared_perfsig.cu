#include <cuda_runtime_api.h>
#include <thrust/device_vector.h>
#include <thrust/shared_algorithms.h>
#include <stdio.h>
#include "cputime.h"

// float *accnew_gpu;
// float *velnew_gpu;
// float *parforce_gpu;
// float *parpot_gpu;
// float *parvel_gpu;
// float *acc_gpu;
// float *force_gpu;
// float *pos_gpu;
// float *vel_gpu;


thrust::device_vector<float> *parforce_gpuX;
thrust::device_vector<float> *parforce_gpuY;
thrust::device_vector<float> *parforce_gpuZ;

thrust::device_vector<float> *parpot_gpu;

thrust::device_vector<float> *acc_gpuX;
thrust::device_vector<float> *acc_gpuY;
thrust::device_vector<float> *acc_gpuZ;

thrust::device_vector<float> *force_gpuX;
thrust::device_vector<float> *force_gpuY;
thrust::device_vector<float> *force_gpuZ;


thrust::device_vector<float> *pos_gpuX;
thrust::device_vector<float> *pos_gpuY;
thrust::device_vector<float> *pos_gpuZ;

thrust::device_vector<float> *vel_gpuX;
thrust::device_vector<float> *vel_gpuY;
thrust::device_vector<float> *vel_gpuZ;


/*
extern "C"
double cputime()
{
	struct timeval tp;
	int rtn;
	rtn=gettimeofday(&tp, NULL);
	return ((double)tp.tv_sec+(1.e-6)*tp.tv_usec);
}
*/

extern "C"
void allocMemOnGPU(int nd, int np)
{


	parforce_gpuX = (new thrust::device_vector<float>(np));
	parforce_gpuY = (new thrust::device_vector<float>(np));
	parforce_gpuZ = (new thrust::device_vector<float>(np));

	parpot_gpu = (new thrust::device_vector<float>(np) );

  acc_gpuX = (new thrust::device_vector<float>(np));
  acc_gpuY = (new thrust::device_vector<float>(np));
  acc_gpuZ = (new thrust::device_vector<float>(np));

  force_gpuX = (new thrust::device_vector<float>(np));
  force_gpuY = (new thrust::device_vector<float>(np));
  force_gpuZ = (new thrust::device_vector<float>(np));


	pos_gpuX = (new thrust::device_vector<float>(np));
  pos_gpuY = (new thrust::device_vector<float>(np));
  pos_gpuZ = (new thrust::device_vector<float>(np));

  vel_gpuX = (new thrust::device_vector<float>(np));
  vel_gpuY = (new thrust::device_vector<float>(np));
  vel_gpuZ = (new thrust::device_vector<float>(np));

}

extern "C"
void copyDataToGPU(float *h_acc, float *h_force, float *h_vel, float *h_pos, int nd, int np)
{
  acc_gpuX->assign( h_acc        ,h_acc + np);
  acc_gpuY->assign( h_acc +np    ,h_acc + 2*np);
  acc_gpuZ->assign( h_acc +2*np  ,h_acc + nd*np);

  force_gpuX->assign( h_force        ,h_force + np);
  force_gpuY->assign( h_force +np    ,h_force + 2*np);
  force_gpuZ->assign( h_force +2*np  ,h_force + nd*np);

  vel_gpuX->assign( h_vel        ,h_vel + np);
  vel_gpuY->assign( h_vel +np    ,h_vel + 2*np);
  vel_gpuZ->assign( h_vel +2*np  ,h_vel + nd*np);

	pos_gpuX->assign( h_pos        ,h_pos + np);
  pos_gpuY->assign( h_pos +np    ,h_pos + 2*np);
  pos_gpuZ->assign( h_pos +2*np  ,h_pos + nd*np);

}


// __global__ void dummyCopy(float *g_idata, float *g_odata)
// {
// 	int idx = blockIdx.x * blockDim.x + threadIdx.x ;
//
// 	g_odata[idx] = g_idata[idx];
// 	__syncthreads();
// }


// START K1 - Compute Force on Particle

class compute_forceonparticle_functor
{
  float PI2;
  float currentposx,currentposy,currentposz;
  int currentMoleculeIndex;
public:
  compute_forceonparticle_functor(float PI2,  float currentposx, float currentposy, float currentposz,int currentMoleculeIndex)
  {
    this->PI2 = PI2;
    this->currentposx = currentposx;
    this->currentposy = currentposy;
    this->currentposz = currentposz;
    this->currentMoleculeIndex = currentMoleculeIndex;
  }
  template <typename TupleInput, typename TupleOutput>
  __device__ float operator() (TupleInput input, TupleOutput output)
  {
    float px = this->currentposx - thrust::get<0>(input);
    float py = this->currentposy - thrust::get<1>(input);
    float pz = this->currentposz - thrust::get<2>(input);
    float dist = px*px + py*py + pz*pz;
    dist = sqrt(dist);
    float dist2 = (dist < PI2) ? dist : PI2;
    if(thrust::get<3>(input)==this->currentMoleculeIndex)
    {
        thrust::get<0>(output)= 0;
        thrust::get<1>(output)= 0;
        thrust::get<2>(output)= 0;
        return 0;
    }
    thrust::get<0>(output)=- (px * sin(2.0 * dist2) / dist);
    thrust::get<1>(output)=- (py * sin(2.0 * dist2) / dist);
    thrust::get<2>(output)=- (pz * sin(2.0 * dist2) / dist);
  	return 0.5 * sin(dist2) * sin(dist2);

  }

};
extern "C"
void GPU_compute_forceonparticle(int nd, int np, int currentMoleculeIndex, const float PI2, int step, double *time_elapsed)
{

thrust::transform(thrust::make_zip_iterator(thrust::make_tuple(pos_gpuX->begin(),pos_gpuY->begin(),pos_gpuZ->begin(),thrust::counting_iterator<int>(0))),
                  thrust::make_zip_iterator(thrust::make_tuple(pos_gpuX->end(),pos_gpuY->end(),pos_gpuZ->end(),thrust::counting_iterator<int>(pos_gpuX->end()-pos_gpuX->begin()))),
                  thrust::make_zip_iterator(thrust::make_tuple(parforce_gpuX->begin(),parforce_gpuY->begin(),parforce_gpuZ->begin())),
                  parpot_gpu->begin(),compute_forceonparticle_functor(PI2,(*pos_gpuX)[currentMoleculeIndex],(*pos_gpuY)[currentMoleculeIndex],(*pos_gpuZ)[currentMoleculeIndex],currentMoleculeIndex));
// if(currentMoleculeIndex<100)
// printf("%f \n",(float) parforce_gpuX[0]);
}



float GPU_accumulate_parpot_wShrdMem(int nd, int np, int step, double *time_elapsed)
{
	return thrust::reduce(parpot_gpu->begin(),parpot_gpu->end());
}

//END K2 - Accumulate PE with/without shared memory


//START K3 - Accumulate Force with/without shared memory
void GPU_accumulate_parforce_wShrdMem(int nd, int np, int currentMoleculeIndex, int step, double *time_elapsed)
{
    (*force_gpuX)[currentMoleculeIndex] = thrust::reduce(thrust::cuda::shared,parforce_gpuX->begin(),parforce_gpuX->end());
    // printf("%f\n",(float) force_gpuX[currentMoleculeIndex]);
    (*force_gpuY)[currentMoleculeIndex] = thrust::reduce(thrust::cuda::shared,parforce_gpuY->begin(),parforce_gpuY->end());
    (*force_gpuZ)[currentMoleculeIndex] = thrust::reduce(thrust::cuda::shared,parforce_gpuZ->begin(),parforce_gpuZ->end());

}
//END K3 - Accumulate Force with/without shared memory

//Accumulates PE and Force using K2 and K3
extern "C"
float GPU_seq_wShrdMem_accumulate_parpot_and_parforce(int nd, int np, int currentMoleculeIndex, int step, double *time_elap1, double *time_elap2)
{
	GPU_accumulate_parforce_wShrdMem(nd,np,currentMoleculeIndex, step, time_elap1);
	return GPU_accumulate_parpot_wShrdMem(nd, np, step, time_elap2);
}

//START K4 - Compute and accumulate KE without shared memory
//Compute KE with shared memory

struct squareOp
{
  __device__ float operator() ( const float input) const
  {
    return input*input;
  }
};

extern "C"
float GPU_accumulate_KE_wShrdMem(int nd, int np, float mass, int step, double *time_elapsed)
{
  // for(int i = 0; i<100;i++)
  // {
  //   printf("%f \n",(float) vel_gpuX[i]);
  // }

    float sum = thrust::transform_reduce(thrust::cuda::shared,vel_gpuX->begin(),vel_gpuX->end(),squareOp())
              + thrust::transform_reduce(thrust::cuda::shared,vel_gpuY->begin(),vel_gpuY->end(),squareOp())
              + thrust::transform_reduce(thrust::cuda::shared,vel_gpuZ->begin(),vel_gpuZ->end(),squareOp());
	return 0.5 * mass * sum;
}

//END K4 - Compute and accumulate KE with shared memory


//START K5 - Update position
__global__ void GPU_updatePos(int numberOfThreads, float dt, float * pos_gpu, const float * vel_gpu, const float * acc_gpu)
{
	int idx = blockIdx.x * blockDim.x + threadIdx.x ;
	if (idx >= numberOfThreads)
		return ;
	pos_gpu[idx] += vel_gpu[idx] * dt + 0.5 * acc_gpu[idx] * dt * dt;
}

class updateOp
{
  float dt;
public:
  updateOp(float dt)
  {
    this->dt = dt;
  }
  template <typename Tuple>
  __device__ float operator() (Tuple input, float current_value)
  {
    return thrust::get<0>(input) * (this->dt) + (this->dt) * 0.5 * (this->dt) * thrust::get<1>(input) + current_value;
  }
};
extern "C"
void GPU_updatePos(int nd, int np, float dt, int step, double *time_elapsedCPU, float *time_elapsedGPU)
{

	thrust::transform(thrust::make_zip_iterator(thrust::make_tuple(vel_gpuX->begin(),acc_gpuX->begin())),
                    thrust::make_zip_iterator(thrust::make_tuple(vel_gpuX->end(),acc_gpuX->end())),
                    pos_gpuX->begin(),pos_gpuX->begin(),updateOp(dt));
  thrust::transform(thrust::make_zip_iterator(thrust::make_tuple(vel_gpuY->begin(),acc_gpuY->begin())),
                    thrust::make_zip_iterator(thrust::make_tuple(vel_gpuY->end(),acc_gpuY->end())),
                    pos_gpuY->begin(),pos_gpuY->begin(),updateOp(dt));
  thrust::transform(thrust::make_zip_iterator(thrust::make_tuple(vel_gpuZ->begin(),acc_gpuZ->begin())),
                    thrust::make_zip_iterator(thrust::make_tuple(vel_gpuZ->end(),acc_gpuZ->end())),
                    pos_gpuZ->begin(),pos_gpuZ->begin(),updateOp(dt));


}
//END K5 - Update position


//START K6 - Update velocity
__global__ void GPU_updateVel(int numberOfThreads, float dt, float rmass, float * vel_gpu, const float * force_gpu, const float * acc_gpu)
{
	int idx = blockIdx.x * blockDim.x + threadIdx.x ;
	if (idx >= numberOfThreads)
		return ;
	vel_gpu[idx] += 0.5 * dt * (force_gpu[idx] * rmass + acc_gpu[idx]);
}

class updateVelOp
{
  float dt, rmass;
public:
  updateVelOp(float dt, float rmass)
  {
    this->dt = dt;
    this->rmass =rmass;
  }
  template <typename Tuple>
  __device__ float operator() (Tuple input, float current_value)
  {
    return current_value + ( 0.5*(this->dt)*(thrust::get<0>(input)*(this->rmass) + thrust::get<1>(input)) );
  }
};
extern "C"
void GPU_updateVel(int nd, int np, float dt, float rmass, int step, double *time_elapsedCPU, float *time_elapsedGPU)
{
  thrust::transform(thrust::make_zip_iterator(thrust::make_tuple(force_gpuX->begin(),acc_gpuX->begin())),
                    thrust::make_zip_iterator(thrust::make_tuple(force_gpuX->end(),acc_gpuX->end())),
                    vel_gpuX->begin(),vel_gpuX->begin(),updateVelOp(dt,rmass));
  thrust::transform(thrust::make_zip_iterator(thrust::make_tuple(force_gpuY->begin(),acc_gpuY->begin())),
                    thrust::make_zip_iterator(thrust::make_tuple(force_gpuY->end(),acc_gpuY->end())),
                    vel_gpuY->begin(),vel_gpuY->begin(),updateVelOp(dt,rmass));
  thrust::transform(thrust::make_zip_iterator(thrust::make_tuple(force_gpuZ->begin(),acc_gpuZ->begin())),
                    thrust::make_zip_iterator(thrust::make_tuple(force_gpuZ->end(),acc_gpuZ->end())),
                    vel_gpuZ->begin(),vel_gpuZ->begin(),updateVelOp(dt,rmass));
}
//END K6 - Update velocity


//START K7 - Update acceleration

class updateAccOp
{
  float rmass;
public:
  updateAccOp(float rmass)
  {
    this->rmass = rmass;
  }
  __device__ float operator() (float input)
  {
    return input*(this->rmass);
  }
};

extern "C"
void GPU_updateAcc(int nd, int np, float rmass, int step, double *time_elapsedCPU, float *time_elapsedGPU)
{

  thrust::transform(force_gpuX->begin(),force_gpuX->end(),acc_gpuX->begin(),updateAccOp(rmass));
  thrust::transform(force_gpuY->begin(),force_gpuY->end(),acc_gpuY->begin(),updateAccOp(rmass));
  thrust::transform(force_gpuZ->begin(),force_gpuZ->end(),acc_gpuZ->begin(),updateAccOp(rmass));

}
//END K7 - Update acceleration
