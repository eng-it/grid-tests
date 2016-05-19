// CUDA Example: "Single-precision A*X Plus Y"
// Derived from:
// https://devblogs.nvidia.com/parallelforall/easy-introduction-cuda-c-and-c/
#include <stdio.h>

// CUDA kernel code, to run on GPU
__global__
void saxpy(int n, float a, float *x, float *y)
{
  // blockDim:  dimensions of each thread block
  // threadIdx: index of this thread within its thread block
  // blockIdx:  index of this thread block within grid
  int i = blockIdx.x*blockDim.x + threadIdx.x;
  // The conditional prevents an out-of-bounds issue if the number of elements
  // in the arrays doesn't fit evenly into the number of thread blocks.  The
  // assignment just carries out the operation element-wise, but it will
  // actually be performed in parallel with many separate calls to this
  // function.
  if (i < n) y[i] = a*x[i] + y[i];
}

// Regular C code, to run on CPU.
// The saxpy() call below will execute on the GPU.
int main(void)
{
  printf("CUDA Example \"Single-precision A*X Plus Y\"\n\n");

  int N = 1<<20;
  int bytesneeded = N*sizeof(float);
  printf("Allocating %d float values (%d MB)...\n", N, bytesneeded>>20);

  float *x, *y, *d_x, *d_y;
  // Arrays allocated in host memory
  x = (float*)malloc(N*sizeof(float));
  y = (float*)malloc(N*sizeof(float));
  // Arrays allocated in CUDA device memory
  cudaMalloc(&d_x, N*sizeof(float)); 
  cudaMalloc(&d_y, N*sizeof(float));

  for (int i = 0; i < N; i++) {
    x[i] = 1.0f;
    y[i] = 2.0f;
  }

  printf("Running calculation on GPU...\n");
  // Copy both arrays from the host to the device
  cudaMemcpy(d_x, x, N*sizeof(float), cudaMemcpyHostToDevice);
  cudaMemcpy(d_y, y, N*sizeof(float), cudaMemcpyHostToDevice);

  // Perform SAXPY on 1M elements
  //
  // The syntax is:
  // <<< Thread blocks in grid , threads in thread block >>>
  // So, 256 threads per thread block, and however many thread blocks needed to
  // represent the full array.
  saxpy<<<(N+255)/256, 256>>>(N, 2.0f, d_x, d_y);

  // Copy result from device back to host
  cudaMemcpy(y, d_y, N*sizeof(float), cudaMemcpyDeviceToHost);

  // Since for every element the answer should be 2*1+2 = 4, this will check
  // our results.
  float maxError = 0.0f;
  for (int i = 0; i < N; i++)
    maxError = max(maxError, abs(y[i]-4.0f));
  printf("Done. Max error: %f\n", maxError);
}
