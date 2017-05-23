#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "cputime.h"
#define PROFILING
const float PI2 = 3.141592653589793 / 2.0;
const int nd = 3;
int np;
float dt = 0.0001;
volatile float e0;
volatile float kinetic;
float mass = 1.0;
volatile float potential;
int seed;
int step;
int step_num;
int step_print;
int step_print_index;
int step_print_num;
double Perf[7][2];


float* acc;
float* box;
float* force;
float* pos;
float* vel;

//extern "C"
//	double cputime();

extern "C"
	void allocMemOnGPU(int, int);
void initialize();
extern "C"
	void copyDataToGPU(float *, float *, float *, float *, int, int);
void compute(int);
extern "C"
	void GPU_compute_forceonparticle(int, int, int, const float, int, double *);
extern "C"
	float GPU_seq_wShrdMem_accumulate_parpot_and_parforce(int, int, int, int , double *, double *);
extern "C"
	float GPU_accumulate_KE_wShrdMem(int, int, float, int, double *);
void computeForceonCPU();
float compute_distance(int, int, float* );
void compute_forceonparticle(int, float, float, float* );
float compute_kineticenergy();
void update(int);
extern "C"
	void GPU_updatePos(int, int, float, int, double *, float *);
extern "C"
	void GPU_updateVel(int, int, float, float, int, double *, float *);
extern "C"
	void GPU_updateAcc(int, int, float, int, double *, float *);
void updateonCPU(float);


int main(int argc, char ** argv)
{

		np = 10000; //ENTERED_NP; //Number of molecules
    step_num = 10; //ENTERED_NUMOFSTEPS; //Number of steps
		if(argc==2)
		{
			np = atoi(argv[1]);
		}
		if(argc==3)
		{
			np = atoi(argv[1]);
			step_num = atoi(argv[2]);
		}
	//Allocate memory on host
	acc = (float*) malloc(nd * np * sizeof (float));
    box = (float*) malloc(nd * sizeof (float));
    force = (float*) malloc(nd * np * sizeof (float));
    pos = (float*) malloc(nd * np * sizeof (float));
    vel = (float*) malloc(nd * np * sizeof (float));

	//Allocate array on device
	allocMemOnGPU(nd, np);
	//Start the program
	#ifndef PROFILING
	printf("|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n");
	printf("A molecular dynamics program.\n");
    printf("    NP, the number of particles in the simulation is: %d\n", np);
    printf("    STEP_NUM, the number of time steps, is          : %d\n", step_num);
    printf("    DT, the size of each time step, is              : %E\n\n", dt);
	#endif
	// Set the dimensions of the box
    int index = nd;
    while (index != 0)
	{
        box[--index] = 10.0;
    }

	double t0, t1;
  #ifndef PROFILING  // Set initial positions, velocities, and accelerations
    printf("Initializing positions, velocities, and accelerations.\n\n");
    t0=cputime();
		#endif

    initialize();


    // Compute the forces and energies.
	step = 0;
    #ifndef PROFILING
		printf("Computing initial forces and energies.");
		#endif

    compute(step);

    // Save the initial total energy for use in the accuracy check.
    e0 = potential + kinetic;
		#ifndef PROFILING
	printf("\n");
    printf("    At each step, we report the potential and kinetic energies.\n");
    printf("    The sum of these energies should be a constant.\n");
    printf("    As an accuracy check, we also print the relative error\n");
    printf("    in the total energy. (Total energy is: %E)\n", e0);
    printf("\n");
    printf("        Step      Potential       Kinetic        (P+K-E0)/E0\n");
    printf("                  Energy P        Energy K       Relative Energy Error\n");
    printf("\n");
		#endif
	//  This is the main time stepping loop:
    //    Compute forces and energies,
    //    Update positions, velocities, accelerations.
    step_print = 0;
    step_print_index = 0;
    step_print_num = 10;

    step = 0;
		#ifndef PROFILING
  	printf("        %d      %E       %E       %E\n", step, potential, kinetic, ((potential + kinetic - e0) / e0));
		#endif
		step_print_index = step_print_index + 1;
  	step_print = (step_print_index * step_num) / step_print_num;
		#ifdef PROFILING
		t0 = cputime();
		#endif

    	for (step = 1; step <= step_num; step++)
			{
				compute(step);
				#ifndef PROFILING
					printf("        %d      %E       %E       %E\n", step, potential, kinetic, ((potential + kinetic - e0) / e0));
				#endif
				update(step);
			}
	t1=cputime();
	#ifndef PROFILING
	printf("\n");

	printf("    Normal end of execution.\n");
	#endif
/*	printf("Time to run K1 is %0.7f (s)\n", Perf[0][0]);
	printf("Time to run K2 is %g (us)\n", Perf[1][0]);
	printf("Time to run K3 is %g (us)\n", Perf[2][0]);
	printf("Time to run K4 is %g (us)\n", Perf[3][0]);
	printf("Time to run K5 is %g (us) on CPU\n", Perf[4][0]);//, Perf[4][1]);
	printf("Time to run K6 is %g (us) on CPU\n", Perf[5][0]);//, Perf[5][1]);
	printf("Time to run K7 is %g (us) on CPU\n", Perf[6][0]);//, Perf[6][1]);
*/
#ifndef PROFILING
	printf("Total time for execution is %g (s)\n", (t1-t0)*iCPS);
#endif
	#ifdef PROFILING
printf("%g\n", (t1-t0)*iCPS);
	#endif
	return 0;
}




void initialize()
{
	int i;
	int j;

	seed = 123456789;
	srand(seed);

	float temp = 0.0;
	for (j = 0; j < np; j++)
	{
		pos[j] = temp;
		pos[j + np] = temp;
		pos[j + np + np] = temp;
		temp = temp + 0.00001;
	}

	//Use these random values as scale factors to pick random locations
	//inside the box.
	for (i = 0; i < nd; i++)
	{
		for (j = 0; j < np; j++)
		{
			int tempIndex = i * np + j;
			pos[tempIndex] = box[i] * pos[tempIndex];
		}
	}


	//Velocities and accelerations begin at 0
	for (i = 0; i < nd; i++)
	{
		for (j = 0; j < np; j++)
		{
			int tempIndex = i * np + j;
			vel[tempIndex] = 0.01;
			acc[tempIndex] = 0.0;
		}
	}

	//Copy data to GPU
	copyDataToGPU(acc, force, vel, pos, nd, np);
}


//COMPUTE computes the forces and energies.
//
//  Discussion:
//    The computation of forces and energies is fully parallel.
//    The potential function V(X) is a harmonic well which smoothly
//    saturates to a maximum value at PI/2:
//      v(x) = ( sin ( min ( x, PI2 ) ) )**2
//    The derivative of the potential is:
//      dv(x) = 2.0D+00 * sin ( min ( x, PI2 ) ) * cos ( min ( x, PI2 ) )
//            = sin ( 2.0 * min ( x, PI2 ) )
//
//  Parameters:
//    Input, integer ( kind = 4 ) NP, the number of particles.
//    Input, integer ( kind = 4 ) ND, the number of spatial dimensions.
//    Input, real ( kind = 8 ) POS(ND,NP), the position of each particle.
//    Input, real ( kind = 8 ) VEL(ND,NP), the velocity of each particle.
//    Input, real ( kind = 8 ) MASS, the mass of each particle.
//    Output, real ( kind = 8 ) F(ND,NP), the forces.
//    Output, real ( kind = 8 ) POT, the total potential energy.
//    Output, real ( kind = 8 ) KIN, the total kinetic energy.

void compute(int step)
{
	int i;
	potential = 0.0;
	double time_elap1, time_elap2, time_elapsed=0.0;
	//Compute force on particle on GPU
	for (i = 0; i < np; i++)
	{
		//GPU_compute_forceonparticle(nd, np, i, PI2, step, &time_elapsed);
		//Call functions on GPU
	/*	if(step == 4)
		{
			GPU_compute_forceonparticle(nd, np, i, PI2, step, &time_elapsed);
			Perf[0][0] = time_elapsed;
			time_elapsed= 0.0;
			potential += GPU_seq_woShrdMem_accumulate_parpot_and_parforce(nd,np,i, step, &time_elap1, &time_elap2);
			Perf[2][0] = time_elap1;
			Perf[1][0] = time_elap2;
		}
		else
	*/	{
			GPU_compute_forceonparticle(nd, np, i, PI2, step, &time_elapsed);
			potential += GPU_seq_wShrdMem_accumulate_parpot_and_parforce(nd,np,i, step, &time_elap1, &time_elap2);
		}

	}

	//Compute force on each particle on CPU; accumulating force and PE for each particle
	//computeForceonCPU();

	//Compute KE on GPU
	//Call functions on GPU

	// Compute the total kinetic energy on CPU.
	//kinetic = compute_kineticenergy();

	//Compute total kinetic energy on GPU
	//kinetic = GPU_accumulate_KE_woShrdMem(nd, np, mass);
/*	if(step==4)
	{
		kinetic = GPU_accumulate_KE_wShrdMem(nd, np, mass, step, &time_elapsed);
		Perf[3][0]=time_elapsed;
	}
	else
*/		kinetic = GPU_accumulate_KE_wShrdMem(nd, np, mass, step, &time_elapsed);
}

void computeForceonCPU()
{
	potential = 0.0;
	int i;
	float* rij;
	float d;
	float d2;
	int j, i1;
	rij = (float*) malloc(nd * sizeof (float));
	for (i = 0; i < np; i++)
	{
		//Compute the potential energy and forces
		for (i1 = 0; i1 < nd; i1++)
		{
			force[i1 * np + i] = 0.0;
		}

		for (j = 0; j < np; j++)
		{
			if (i != j)
			{
				// compute_distance
				d = compute_distance(i, j, rij);

				// Truncate the distance ...  min ( d, PI2 )
				d2 = (d < PI2) ? d : PI2;

				/** This is U shaped energy. Lennard-Jones Potential could be
				 *  another module
				 **/

				// Attribute half of the total potential energy to particle J.
				potential += 0.5 * sin(d2) * sin(d2); // Discuss on potential calculation

				// Add particle J's contribution to the force on particle I.
				compute_forceonparticle(i, d, d2, rij);
			}
		}
	}
}

float compute_distance(int moleculeindexi, int moleculeindexj, float* rij)
{
	float d = 0.0;
	int j1 = 0;
	for (j1 = 0; j1 < nd; j1++)
	{
		rij[j1] = pos[j1 * np + moleculeindexi] - pos[j1 * np + moleculeindexj];
		d = d + pow(rij[j1], 2.0);
	}
	return sqrt(d);
}

void compute_forceonparticle(int moleculeindexi, float distance, float truncated_distance, float* rij)
{
	for (int j1 = 0; j1 < nd; j1++)
	{
		force[j1 * np + moleculeindexi] = force[j1 * np + moleculeindexi] - rij[j1] * sin(2.0 * truncated_distance) / distance;
	}
}

float compute_kineticenergy()
{
	int j1 = 0;
	float temp = 0.0;
	for (j1 = 0; j1 < nd * np; j1++)
	{
		temp = temp + pow(vel[j1], 2.0);
	}
	return 0.5 * mass * temp;
}

void update(int step)
{
	float rmass;
	double time_elapsedCPU;
	float time_elapsedGPU;
	rmass = 1.0 / mass;

	//Call functions on GPU to update
/*	if(step==4)
	{
		GPU_updatePos(nd, np, dt, step, &time_elapsedCPU, &time_elapsedGPU);
		Perf[4][0]=time_elapsedCPU;
		Perf[4][1]=time_elapsedGPU;
		GPU_updateVel(nd, np, dt, rmass, step, &time_elapsedCPU, &time_elapsedGPU);
		Perf[5][0]=time_elapsedCPU;
		Perf[5][1]=time_elapsedGPU;
		GPU_updateAcc(nd, np, rmass, step, &time_elapsedCPU, &time_elapsedGPU);
		Perf[6][0]=time_elapsedCPU;
		Perf[6][1]=time_elapsedGPU;
	}
	else
*/	{
		GPU_updatePos(nd, np, dt, step, &time_elapsedCPU, &time_elapsedGPU);
		GPU_updateVel(nd, np, dt, rmass, step, &time_elapsedCPU, &time_elapsedGPU);
		GPU_updateAcc(nd, np, rmass, step, &time_elapsedCPU, &time_elapsedGPU);
	}

	//Call function on CPU to update
	//updateonCPU(rmass);
}


void updateonCPU(float rmass)
{
	int i, j;
	for (j = 0; j < np; j++)
	{
		for (i = 0; i < nd; i++)
		{
			pos[i * np + j] = pos[i * np + j] + vel[i * np + j] * dt + 0.5 * acc[i * np + j] * dt * dt; // Kernel 1
			vel[i * np + j] = vel[i * np + j] + 0.5 * dt * (force[i * np + j] * rmass + acc[i * np + j]); // Kernel 2
			acc[i * np + j] = force[i * np + j] * rmass; // Kernel 3
		}
	}
}
