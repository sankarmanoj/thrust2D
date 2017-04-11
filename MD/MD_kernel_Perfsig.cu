#include <cuda_runtime_api.h>
#include <stdio.h>
#include "cputime.h"

// float *accnew_gpu;
// float *velnew_gpu;
float *parforce_gpu;
float *parpot_gpu;
float *parvel_gpu;
float *acc_gpu;
float *force_gpu;
float *pos_gpu;
float *vel_gpu;

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
	// cudaMalloc ((void**)(&accnew_gpu), nd*np*sizeof(float));
	// cudaMalloc ((void**)(&velnew_gpu), nd*np*sizeof(float));
	cudaMalloc ((void**)(&parforce_gpu), nd*np*sizeof(float));
	cudaMalloc ((void**)(&parpot_gpu), np*sizeof(float));
	cudaMalloc ((void**)(&parvel_gpu), nd*np*sizeof(float));
	cudaMalloc ((void**)(&acc_gpu), nd*np*sizeof(float));
	cudaMalloc ((void**)(&force_gpu), nd*np*sizeof(float));
	cudaMalloc ((void**)(&pos_gpu), nd*np*sizeof(float));
	cudaMalloc ((void**)(&vel_gpu), nd*np*sizeof(float));
}

extern "C"
void copyDataToGPU(float *h_acc, float *h_force, float *h_vel, float *h_pos, int nd, int np)
{
	cudaMemcpy(acc_gpu, h_acc, nd*np*sizeof(float), cudaMemcpyHostToDevice);
	cudaMemcpy(force_gpu, h_force, nd*np*sizeof(float), cudaMemcpyHostToDevice);
	cudaMemcpy(vel_gpu, h_vel, nd*np*sizeof(float), cudaMemcpyHostToDevice);
	cudaMemcpy(pos_gpu, h_pos, nd*np*sizeof(float), cudaMemcpyHostToDevice);
}


__global__ void dummyCopy(float *g_idata, float *g_odata)
{
	int idx = blockIdx.x * blockDim.x + threadIdx.x ;

	g_odata[idx] = g_idata[idx];
	__syncthreads();
}

// START K1 - Compute Force on Particle
__global__ void GPU_compute_forceonparticle_KERNEL(int np, int numberOfThreads, int currentMoleculeIndex, const float PI2,
													float * pos_gpu, float * parforce_gpu, float * parpot_gpu)
{
	float posx, posy, posz, dist, dist2;
    __shared__ float currentposx,currentposy,currentposz;

    int idx = blockIdx.x * blockDim.x + threadIdx.x ;

    if (idx >= numberOfThreads) return ;

    posx = pos_gpu[idx];
    posy = pos_gpu[idx+np];
    posz = pos_gpu[idx+np+np];
    currentposx = pos_gpu[currentMoleculeIndex];
    currentposy = pos_gpu[currentMoleculeIndex+np];
    currentposz = pos_gpu[currentMoleculeIndex+np+np];

    posx = currentposx - posx;
    posy = currentposy - posy;
    posz = currentposz - posz;

    dist = posx*posx + posy*posy + posz*posz;
    dist = sqrt(dist);


    dist2 = (dist < PI2) ? dist : PI2;

    if(idx==currentMoleculeIndex){
			posx=0.0;
    	posy=0.0;
    	posz=0.0;
    	dist=0.0;
    }else{
    	posx= - (posx * sin(2.0 * dist2) / dist);
    	posy= - (posy * sin(2.0 * dist2) / dist);
    	posz= - (posz * sin(2.0 * dist2) / dist);
    	dist= 0.5 * sin(dist2) * sin(dist2);
    }

    parforce_gpu[idx] = posx;
    parforce_gpu[idx+np] = posy;
    parforce_gpu[idx+np+np] = posz;
    parpot_gpu[idx] = dist;
}


extern "C"
void GPU_compute_forceonparticle(int nd, int np, int currentMoleculeIndex, const float PI2, int step, double *time_elapsed)
{
	int BLOCK_SIZE = 128;
	int numberOfThreads = np;
	int numBlocks = numberOfThreads / BLOCK_SIZE + (numberOfThreads % BLOCK_SIZE == 0 ? 0 : 1) ;

	dim3 dimGrid(numBlocks) ;
	dim3 dimBlock(BLOCK_SIZE) ;


/*	if(step == 4)
	{
		for(i=0; i<iter; i++)
		{
			//printf("Molecule index is %d in iter %d\n",currentMoleculeIndex, i);
			t0=cputime();
			GPU_compute_forceonparticle_KERNEL<<<dimGrid,dimBlock>>>(np, numberOfThreads, currentMoleculeIndex, PI2, pos_gpu, parforce_gpu, parpot_gpu);
			cudaThreadSynchronize();
			t1=cputime();
			time_sum += (t1-t0)*iCPS*1000*1000;
		}
		*time_elapsed = time_sum/iter;
	}
	else
*/	{
		//t0=cputime();
		//printf("Molecule index is %d in step %d\n", currentMoleculeIndex, step);
		GPU_compute_forceonparticle_KERNEL<<<dimGrid,dimBlock>>>(np, numberOfThreads, currentMoleculeIndex, PI2, pos_gpu, parforce_gpu, parpot_gpu);
		cudaThreadSynchronize();
		//t1=cputime();
		//*time_elapsed = (t1-t0);
	}
}

//END K1 - Compute Force on Particle

//START - GENERAL REDUCTION KERNEL THAT USES SHARED MEMORY
template<class T>
struct SharedMemory
{
    __device__ inline operator       T*()
    {
        extern __shared__ int __smem[];
        return (T*)__smem;
    }

    __device__ inline operator const T*() const
    {
        extern __shared__ int __smem[];
        return (T*)__smem;
    }
};

template <class T>
__global__ void reduce_wShrdMem(T *g_idata, T *g_odata, unsigned int n)
{
    T *sdata = SharedMemory<T>();

    // load shared mem
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x*blockDim.x + threadIdx.x;

    sdata[tid] = (i < n) ? g_idata[i] : 0;

    __syncthreads();

    // do reduction in shared mem
    for(unsigned int s=blockDim.x/2; s>0; s>>=1)
    {
        if (tid < s)
        {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // write result for this block to global mem
	if (tid == 0)
		g_odata[blockIdx.x] = sdata[0];
	__syncthreads();
}
//END - GENERAL REDUCTION KERNEL THAT USES SHARED MEMORY

float GPU_accumulate_parpot_wShrdMem(int nd, int np, int step, double *time_elapsed)
{
	int BLOCK_SIZE = 128;
	int numberOfThreads = np;
	int numBlocks = numberOfThreads / BLOCK_SIZE + (numberOfThreads % BLOCK_SIZE == 0 ? 0 : 1) ;
    	float *parpot, sum;

	dim3 dimBlock = dim3(BLOCK_SIZE, 1, 1);
	dim3 dimGrid;
	int smemSize = (BLOCK_SIZE <= 32) ? 2 * BLOCK_SIZE * sizeof(float) : BLOCK_SIZE * sizeof(float);


/*	if(step==4)
	{
		numBlocksT = numBlocks;
		numberOfThreadsT = numberOfThreads;
		cudaMalloc ((void**)(&parpotT_gpu), np*sizeof(float));
		cudaMemcpy(parpotT_gpu, parpot_gpu, np *sizeof(float), cudaMemcpyDeviceToDevice);
		for(i=0; i<iter; i++)
		{
			cudaMemcpy(parpot_gpu, parpotT_gpu, np *sizeof(float), cudaMemcpyDeviceToDevice);
			numBlocks = numBlocksT;
			numberOfThreads = numberOfThreadsT;
			t0=cputime();
			while(numberOfThreads>512)
			{
				dimGrid = dim3(numBlocks, 1, 1);
				reduce_wShrdMem<float><<< dimGrid, dimBlock, smemSize >>>(parpot_gpu, parpot_gpu, numberOfThreads);
				cudaThreadSynchronize();
				numberOfThreads = numBlocks;
				numBlocks = numberOfThreads / BLOCK_SIZE + (numberOfThreads % BLOCK_SIZE == 0 ? 0 : 1) ;
			}
			t1=cputime();
			time_sum1 += (t1-t0)*iCPS*1000*1000;
		}
		cudaFree(parpotT_gpu);

		parpot = (float*) malloc(numberOfThreads * sizeof (float));
		cudaMemcpy(parpot, parpot_gpu, numberOfThreads*sizeof(float), cudaMemcpyDeviceToHost);

		for(i=0; i<iter; i++)
		{
			sum = 0.0;
			t0=cputime();
			for(int j=0; j<numberOfThreads; j++)
				sum += parpot[j];
			t1=cputime();
			time_sum2 += (t1-t0)*iCPS*1000*1000;
		}
		*time_elapsed = time_sum1/iter + time_sum2/iter;
	}
	else
*/	{
		while(numBlocks > 1)
		//while(numberOfThreads>512)
		{
			dimGrid = dim3(numBlocks, 1, 1);
			reduce_wShrdMem<float><<< dimGrid, dimBlock, smemSize >>>(parpot_gpu, parpot_gpu, numberOfThreads);
			cudaThreadSynchronize();
			numberOfThreads = numBlocks;
			numBlocks = numberOfThreads / BLOCK_SIZE + (numberOfThreads % BLOCK_SIZE == 0 ? 0 : 1) ;
		}

		parpot = (float*) malloc(numberOfThreads * sizeof (float));
		cudaMemcpy(parpot, parpot_gpu, numberOfThreads*sizeof(float), cudaMemcpyDeviceToHost);
		sum = 0.0;
		for(int i=0; i<numberOfThreads; i++)
			sum += parpot[i];
	}
	free(parpot);
	return sum;
}

//END K2 - Accumulate PE with/without shared memory


//START K3 - Accumulate Force with/without shared memory
void GPU_accumulate_parforce_wShrdMem(int nd, int np, int currentMoleculeIndex, int step, double *time_elapsed)
{
	int BLOCK_SIZE = 128;
	int numberOfThreads = np;
	int numBlocks = numberOfThreads / BLOCK_SIZE + (numberOfThreads % BLOCK_SIZE == 0 ? 0 : 1) ;
	int smemSize = (BLOCK_SIZE <= 32) ? 2 * BLOCK_SIZE * sizeof(float) : BLOCK_SIZE * sizeof(float);

	dim3 dimBlock = dim3(BLOCK_SIZE, 1, 1);
	dim3 dimGrid;


/*	if(step ==4)
	{
		numBlocksT = numBlocks;
		numberOfThreadsT = numberOfThreads;
		cudaMalloc ((void**)(&parforceT_gpu), nd*np*sizeof(float));
		cudaMemcpy(parforceT_gpu, parforce_gpu, nd * np *sizeof(float), cudaMemcpyDeviceToDevice);
		for(i=0; i<iter; i++)
		{
			numBlocks = numBlocksT;
			numberOfThreads = numberOfThreadsT;
			cudaMemcpy(parforce_gpu, parforceT_gpu, nd * np *sizeof(float), cudaMemcpyDeviceToDevice);
			t0=cputime();
			while(numberOfThreads>1)
			{
				dimGrid = dim3(numBlocks, 1);
				reduce_wShrdMem<float><<< dimGrid, dimBlock, smemSize >>>(parforce_gpu, parforce_gpu, 													numberOfThreads);
				cudaThreadSynchronize();
				reduce_wShrdMem<float><<< dimGrid, dimBlock, smemSize >>>(parforce_gpu+(np), parforce_gpu+(np), 												numberOfThreads);
				cudaThreadSynchronize();
				reduce_wShrdMem<float><<< dimGrid, dimBlock, smemSize >>>(parforce_gpu+(np*2),
											parforce_gpu+(np*2),numberOfThreads);
				cudaThreadSynchronize();
				numberOfThreads = numBlocks;
				numBlocks = numberOfThreads / BLOCK_SIZE + (numberOfThreads % BLOCK_SIZE == 0 ? 0 : 1);
			}

			dimGrid = dim3(numBlocks, 1);
			reduce_wShrdMem<float><<< dimGrid, dimBlock, smemSize >>>(parforce_gpu, force_gpu+currentMoleculeIndex, 											numberOfThreads);
			cudaThreadSynchronize();
			reduce_wShrdMem<float><<< dimGrid, dimBlock, smemSize >>>(parforce_gpu+(np), force_gpu+
										(np+currentMoleculeIndex), numberOfThreads);
			cudaThreadSynchronize();
			reduce_wShrdMem<float><<< dimGrid, dimBlock, smemSize >>>(parforce_gpu+(np*2), force_gpu+
										(np+np+currentMoleculeIndex), numberOfThreads);
			cudaThreadSynchronize();
			t1=cputime();
			time_sum += (t1-t0)*iCPS*1000*1000;
		}
		*time_elapsed = time_sum/iter;
		cudaFree(parforceT_gpu);
	}
	else
*/	{
		while(numBlocks > 1)
		//while(numberOfThreads>1)
		{
			dimGrid = dim3(numBlocks, 1);
			reduce_wShrdMem<float><<< dimGrid, dimBlock, smemSize >>>(parforce_gpu, parforce_gpu, 												numberOfThreads);
			cudaThreadSynchronize();
			reduce_wShrdMem<float><<< dimGrid, dimBlock, smemSize >>>(parforce_gpu+(np), parforce_gpu+(np), 											numberOfThreads);
			cudaThreadSynchronize();
			reduce_wShrdMem<float><<< dimGrid, dimBlock, smemSize >>>(parforce_gpu+(np*2),
										parforce_gpu+(np*2),numberOfThreads);
			cudaThreadSynchronize();
			numberOfThreads = numBlocks;
			numBlocks = numberOfThreads / BLOCK_SIZE + (numberOfThreads % BLOCK_SIZE == 0 ? 0 : 1);
		}

		dimGrid = dim3(numBlocks, 1);
		reduce_wShrdMem<float><<< dimGrid, dimBlock, smemSize >>>(parforce_gpu, force_gpu+currentMoleculeIndex, 										numberOfThreads);
		// float x;
		// cudaMemcpy(&x,force_gpu + currentMoleculeIndex,sizeof(float),cudaMemcpyDeviceToHost);
		// printf("%f \n",x);
		cudaThreadSynchronize();
		reduce_wShrdMem<float><<< dimGrid, dimBlock, smemSize >>>(parforce_gpu+(np), force_gpu+
									(np+currentMoleculeIndex), numberOfThreads);
		cudaThreadSynchronize();
		reduce_wShrdMem<float><<< dimGrid, dimBlock, smemSize >>>(parforce_gpu+(np*2), force_gpu+
									(np+np+currentMoleculeIndex), numberOfThreads);
		cudaThreadSynchronize();

	}
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
template <class T>
__global__ void  GPU_compute_KE_wShrdMem(T *g_idata, T *g_odata, unsigned int n)
{
    T *sdata = SharedMemory<T>();

    // load shared mem
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x*blockDim.x + threadIdx.x;

    sdata[tid] = (i < n) ? g_idata[i] : 0;
    __syncthreads();

    sdata[tid] *= sdata[tid];
	__syncthreads();
    // do reduction in shared mem
    for(unsigned int s=blockDim.x/2; s>0; s>>=1)
    {
        if (tid < s)
        {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // write result for this block to global mem
	if (tid == 0)
		g_odata[blockIdx.x] = sdata[0];
	__syncthreads();
}

extern "C"
float GPU_accumulate_KE_wShrdMem(int nd, int np, float mass, int step, double *time_elapsed)
{
	int BLOCK_SIZE = 128;
	int numberOfThreads = nd*np;
	int numBlocks = numberOfThreads / BLOCK_SIZE + (numberOfThreads % BLOCK_SIZE == 0 ? 0 : 1) ;
	float* parvel, sum;
	dim3 dimBlock = dim3(BLOCK_SIZE, 1, 1);
	dim3 dimGrid;
	int smemSize = (BLOCK_SIZE <= 32) ? 2 * BLOCK_SIZE * sizeof(double) : BLOCK_SIZE * sizeof(double);
	dimGrid = dim3(numBlocks, 1, 1);
	float val[100];
	cudaMemcpy(val,vel_gpu,100*sizeof(float),cudaMemcpyDeviceToHost);


/*	if(step == 4)
	{
		t0 = cputime();
		for(i=0; i<iter; i++)
		{
			GPU_compute_KE_wShrdMem<float><<< dimGrid, dimBlock, smemSize >>>(vel_gpu, parvel_gpu, numberOfThreads);
			cudaThreadSynchronize();

		}
		t1=cputime();
		time_sum1 = (t1-t0)*iCPS*1000*1000/iter;
		numberOfThreads = numBlocks;
		numberOfThreadsT = numberOfThreads;
		numBlocks = numberOfThreads / BLOCK_SIZE + (numberOfThreads % BLOCK_SIZE == 0 ? 0 : 1) ;
		numBlocksT = numBlocks;
		cudaMalloc ((void**)(&parvelT_gpu), nd*np*sizeof(float));
		cudaMemcpy(parvelT_gpu, parvel_gpu, nd * np *sizeof(float), cudaMemcpyDeviceToDevice);
		for(i=0; i<iter; i++)
		{
			numBlocks = numBlocksT;
			numberOfThreads = numberOfThreadsT;
			cudaMemcpy(parvel_gpu, parvelT_gpu, nd * np *sizeof(float), cudaMemcpyDeviceToDevice);
			t0=cputime();
			while(numBlocks>1)
			{
				dimGrid = dim3(numBlocks, 1, 1);
				reduce_wShrdMem<float><<< dimGrid, dimBlock, smemSize >>>(parvel_gpu, parvel_gpu, numberOfThreads);
				cudaThreadSynchronize();
				numberOfThreads = numBlocks;
				numBlocks = numberOfThreads / BLOCK_SIZE + (numberOfThreads % BLOCK_SIZE == 0 ? 0 : 1) ;
			}
			t1=cputime();
			time_sum2 += (t1-t0)*iCPS*1000*1000;
		}
		cudaFree(parvelT_gpu);

		parvel = (float*) malloc(numberOfThreads * sizeof (float));
		cudaMemcpy(parvel, parvel_gpu, numberOfThreads*sizeof(float), cudaMemcpyDeviceToHost);

		for(i=0; i<iter; i++)
		{
			t0=cputime();
			sum = 0.0;
			for(int j=0; j<numberOfThreads; j++)
			{
				sum += parvel[j];
			}
			t1=cputime();
			time_sum3 += (t1-t0)*iCPS*1000*1000;
		}
		*time_elapsed = time_sum1 + time_sum2/iter + time_sum3/iter;
	}
	else
*/	{
		GPU_compute_KE_wShrdMem<float><<< dimGrid, dimBlock, smemSize >>>(vel_gpu, parvel_gpu, numberOfThreads);
		cudaThreadSynchronize();

		numberOfThreads = numBlocks;
		numBlocks = numberOfThreads / BLOCK_SIZE + (numberOfThreads % BLOCK_SIZE == 0 ? 0 : 1) ;

		while(numBlocks>1)
		{
			dimGrid = dim3(numBlocks, 1, 1);
			reduce_wShrdMem<float><<< dimGrid, dimBlock, smemSize >>>(parvel_gpu, parvel_gpu, numberOfThreads);
			cudaThreadSynchronize();
			numberOfThreads = numBlocks;
			numBlocks = numberOfThreads / BLOCK_SIZE + (numberOfThreads % BLOCK_SIZE == 0 ? 0 : 1) ;
		}

		parvel = (float*) malloc(numberOfThreads * sizeof (float));
		cudaMemcpy(parvel, parvel_gpu, numberOfThreads*sizeof(float), cudaMemcpyDeviceToHost);

		sum = 0.0;
		for(int i=0; i<numberOfThreads; i++)
			sum += parvel[i];
	}
	free(parvel);
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

extern "C"
void GPU_updatePos(int nd, int np, float dt, int step, double *time_elapsedCPU, float *time_elapsedGPU)
{
	int BLOCK_SIZE = 128;
	int numberOfThreads = nd*np;
	int numBlocks = numberOfThreads / BLOCK_SIZE + (numberOfThreads % BLOCK_SIZE == 0 ? 0 : 1) ;

	dim3 dimGrid(numBlocks) ;
	dim3 dimBlock(BLOCK_SIZE) ;


/*	if(step==4)
	{
		cudaEvent_t start, stop;
		cudaEventCreate(&start);
		cudaEventCreate(&stop);
		cudaMalloc ((void**)(&posT_gpu), nd*np*sizeof(float));
		for(i=0; i<iter; i++)
		{
			dummyCopy<<<dimGrid,dimBlock>>>(pos_gpu, posT_gpu); //(input, output)
			t0=cputime();
			//cudaEventRecord(start,0);
			GPU_updatePos<<<dimGrid,dimBlock>>>(numberOfThreads, dt, pos_gpu, vel_gpu, acc_gpu);
			cudaThreadSynchronize();
			//cudaEventRecord(stop,0);
			//cudaEventSynchronize(stop);
			t1=cputime();
			//cudaEventElapsedTime(&time_diff, start, stop);
			if(i<(iter-1))
				dummyCopy<<<dimGrid,dimBlock>>>(posT_gpu, pos_gpu);
			time_sumCPU += (t1-t0)*iCPS*1000*1000;
			//time_diff /= 1000;
			//time_sumGPU += time_diff;
		}
		*time_elapsedCPU=time_sumCPU/iter;
		//*time_elapsedGPU=time_sumGPU/iter;
		cudaFree(posT_gpu);
		cudaEventDestroy(start);
		cudaEventDestroy(stop);
	}
	else
*/	{
		GPU_updatePos<<<dimGrid,dimBlock>>>(numberOfThreads, dt, pos_gpu, vel_gpu, acc_gpu) ;
		cudaThreadSynchronize();
	}
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

extern "C"
void GPU_updateVel(int nd, int np, float dt, float rmass, int step, double *time_elapsedCPU, float *time_elapsedGPU)
{
	int BLOCK_SIZE = 128;
	int numberOfThreads = nd*np;
	int numBlocks = numberOfThreads / BLOCK_SIZE + (numberOfThreads % BLOCK_SIZE == 0 ? 0 : 1) ;

	dim3 dimGrid(numBlocks) ;
	dim3 dimBlock(BLOCK_SIZE) ;


/*	if(step==4)
	{
		cudaEvent_t start, stop;
		cudaEventCreate(&start);
		cudaEventCreate(&stop);
		cudaMalloc ((void**)(&velT_gpu), nd*np*sizeof(float));
		for(i=0; i<iter; i++)
		{
			dummyCopy<<<dimGrid,dimBlock>>>(vel_gpu, velT_gpu); //(input, output)
			t0=cputime();
			//cudaEventRecord(start,0);
			GPU_updateVel<<<dimGrid,dimBlock>>>(numberOfThreads, dt, rmass, vel_gpu, force_gpu, acc_gpu) ;
			cudaThreadSynchronize();
			//cudaEventRecord(stop,0);
			//cudaEventSynchronize(stop);
			t1=cputime();
			//cudaEventElapsedTime(&time_diff, start, stop);
			if(i<(iter-1))
				dummyCopy<<<dimGrid,dimBlock>>>(velT_gpu, vel_gpu);
			time_sumCPU += (t1-t0)*iCPS*1000*1000;
			//time_diff /= 1000;
			//time_sumGPU += time_diff;
		}
		*time_elapsedCPU=time_sumCPU/iter;
		//*time_elapsedGPU=time_sumGPU/iter;
		cudaFree(velT_gpu);
		cudaEventDestroy(start);
		cudaEventDestroy(stop);
	}
	else
*/	{
		GPU_updateVel<<<dimGrid,dimBlock>>>(numberOfThreads, dt, rmass, vel_gpu, force_gpu, acc_gpu) ;
		cudaThreadSynchronize();
	}
}
//END K6 - Update velocity


//START K7 - Update acceleration
__global__ void GPU_updateAcc(int numberOfThreads, float rmass, float * acc_gpu, const float * force_gpu)
{
	int idx = blockIdx.x * blockDim.x + threadIdx.x ;
	if (idx >= numberOfThreads)
		return ;
	acc_gpu[idx] = force_gpu[idx] * rmass;
}

extern "C"
void GPU_updateAcc(int nd, int np, float rmass, int step, double *time_elapsedCPU, float *time_elapsedGPU)
{
	int BLOCK_SIZE = 128;
	int numberOfThreads = nd*np;
	int numBlocks = numberOfThreads / BLOCK_SIZE + (numberOfThreads % BLOCK_SIZE == 0 ? 0 : 1) ;

	dim3 dimGrid(numBlocks) ;
	dim3 dimBlock(BLOCK_SIZE) ;


/*	if(step==4)
	{
		cudaEvent_t start, stop;
		cudaEventCreate(&start);
		cudaEventCreate(&stop);
		for(i=0; i<iter; i++)
		{
			t0=cputime();
			//cudaEventRecord(start,0);
			GPU_updateAcc<<<dimGrid,dimBlock>>>(numberOfThreads, rmass, acc_gpu, force_gpu) ;
			cudaThreadSynchronize();
			//cudaEventRecord(stop,0);
			//cudaEventSynchronize(stop);
			t1=cputime();
			//cudaEventElapsedTime(&time_diff, start, stop);
			time_sumCPU += (t1-t0)*iCPS*1000*1000;
			//time_diff /= 1000;
			//time_sumGPU += time_diff;
		}
		*time_elapsedCPU=time_sumCPU/iter;
		//*time_elapsedGPU = time_sumGPU/iter;
		cudaEventDestroy(start);
		cudaEventDestroy(stop);
	}
	else
*/	{
		GPU_updateAcc<<<dimGrid,dimBlock>>>(numberOfThreads, rmass, acc_gpu, force_gpu) ;
		cudaThreadSynchronize();
	}
}
//END K7 - Update acceleration
