#!/usr/bin/env bash
# This is the test command to run on each MPI worker node and the master node.

# (Sleep by the node's MPI rank, just as a lazy way to sort the output.)
sleep $OMPI_COMM_WORLD_RANK
echo "--- $(hostname -f) ---"
echo "MPI Rank: $OMPI_COMM_WORLD_RANK"
echo "kerberos tickets: $(klist 2>&1 | head -n 1)"
echo "homedir access: $(ls -d ~/ 2>&1)"
