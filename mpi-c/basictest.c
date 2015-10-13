#include <stdio.h>
#include "mpi.h"
// https://www.open-mpi.org/doc/v1.4/

main(int argc, char *argv[])  {
	MPI_Comm comm = MPI_COMM_WORLD;
	// https://www.open-mpi.org/doc/v1.4/man3/MPI_Comm_rank.3.php
	int rank;
	int size;
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(comm, &rank);
	// https://www.open-mpi.org/doc/v1.4/man3/MPI_Comm_size.3.php
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	// http://www.gnu.org/software/libc/manual/html_node/Sleeping.html
	sleep(rank);

	int N = 20; // per-worker array size
	char hostname[128];
	int data[N];
	gethostname(hostname, 64);
	if (rank == 0)
	{
	    printf("master: %s\n", hostname);
	    printf("size: %i\n", size);
	    int i;
	    for (i=0; i<N; i++)
		    data[i] = i;
	    printf("master data: ");
	    for (i=0; i<N; i++)
		    printf("%d", data[i]);
	    printf("\n");
	    int slice[N];
	    int j;
	    for (i=0; i<size; i++)
	    {
		    for (j=0; j<N; j++)
			    slice[j] = data[i*N+j];
		    MPI_Send(slice, N, MPI_INT, i, 13, comm);
	    }
	}
	else
	{
	    // https://www.open-mpi.org/doc/v1.4/man3/MPI_Recv.3.php
	    //MPI_Recv(data, count, datatype, source, tag, comm, status);
	    //comm.Recv(data, source=0, tag=13)
	    printf("worker: %s\n", hostname);
	    printf("rank: %i\n", rank);
	    printf("data: %s", data);
	    printf("data: ");
	    int i;
	    for (i=0; i<N; i++)
		    printf("%d", data[i]);
	    printf("\n");
	}
	MPI_Finalize();
}
