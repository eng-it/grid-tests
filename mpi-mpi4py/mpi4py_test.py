#!/ad/eng/bin/64/python-anaconda
from mpi4py import MPI
import numpy
from socket import gethostname
from time import sleep

comm = MPI.COMM_WORLD
rank = comm.Get_rank()
size = comm.Get_size()
sleep(rank) # just for tidy output in this example

N = 100000000 # per-worker array size
if rank == 0:
    print('master: ' + gethostname())
    print('size: ' + str(size))
    data = numpy.arange((size-1)*N, dtype=numpy.int)
    print('data size in MB: ' + str(data.nbytes/(2.0**20)))
    for n in range(size-1):
        comm.Send(data[n*N:(n+1)*N], dest=n+1, tag=13)
else:
    data = numpy.empty(N, dtype=numpy.int)
    comm.Recv(data, source=0, tag=13)
    print('worker: ' + gethostname())
    print('rank: ' + str(rank))
    print('data:')
    print(data)
