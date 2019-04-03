/*
 * This is sample code generated by rpcgen.
 * These are only templates and you can use them
 * as a guideline for developing your own functions.
 */

#include <SDL/SDL.h>
#include <SDL/SDL_thread.h> 
#include "rand.h"

#define N 4			
char *hosts[N];
SDL_mutex *mutex;
SDL_cond *barrierQueue;
int count = 0;
int era = 0;
int x[N];				//The random number of server i
int rns[N][10];				


int rand_prog_1(char *host, int xl, int xr)
{
	CLIENT *clnt;
	int  *result_1;
	params  get_next_random_1_arg;
	
	get_next_random_1_arg.xleft = xl;
	get_next_random_1_arg.xright = xr;

	clnt = clnt_create (host, RAND_PROG, RAND_VERS, "udp");
	if (clnt == NULL) {
		clnt_pcreateerror (host);
		exit (1);
	}

	result_1 = get_next_random_1(&get_next_random_1_arg, clnt);
	if (result_1 == (int *) NULL) {
		clnt_perror (clnt, "call failed");
	}
	
	clnt_destroy (clnt);
	
	return *result_1;
}

void barrier()
{
	int myEra;				//local variable
	SDL_LockMutex(mutex);
	
	count++;
	if(count < N)
	{
		myEra = era;
		
		while(myEra == era)
			SDL_CondWait(barrierQueue, mutex);
	}
	else
	{
		count = 0;			//reset count
		era++;
		SDL_CondBroadcast(barrierQueue);	//signal all threads in queue
	}
	
	SDL_UnlockMutex(mutex);
		
}

int threads(void *data)
{
	int k, i_minus_l, i_plus_l, id, xleft, xright;
	id = *((int *) data);
	printf("Thread %d", id);
	
	for(k = 0; k < 10; k++)
	{
		i_minus_l = id - 1;
		
		if(i_minus_l < 0)
			i_minus_l += N;
		
		xleft = x[i_minus_l];
		i_plus_l = (id+1)%N;
		xright = x[i_plus_l];
		x[id] = rand_prog_1(hosts[id], xleft, xright);
		printf("(%d: %d ) ", id, x[id]);
		rns[id][k] = x[id];
		barrier();
	}
	
	return 0;
}

int main (int argc, char *argv[])
{
	int i, j;
	SDL_Thread *ids[N];

	if (argc < 5) {
		printf ("usage: %s server_host1 host2 hoist3 host4 ... \n", argv[0]);
		exit (1);
	}
	
	mutex = SDL_CreateMutex();
	barrierQueue = SDL_CreateCond();
	
	for(i = 0; i < N; i++)
		x[i] = rand() % 31; //Initial Values
	
	for(i = 0; i < N; i++)
	{
		hosts[i] = argv[i+1];
		ids[i] = SDL_CreateThread(threads, &i);		
	}
	
	for(i = 0; i < N; i++)
		SDL_WaitThread(ids[i], NULL);
	
	//print out results in buffers
	printf("\nRandom Numbers:");
	for(i = 0; i < N; i++)
	{
		printf("\nFrom Server %d:\n", i);
		
		for(j = 0; j < 10; ++j)
			printf("%d, ", rns[i][j]);
	}
	
	printf("\n");	
	exit (0);
}