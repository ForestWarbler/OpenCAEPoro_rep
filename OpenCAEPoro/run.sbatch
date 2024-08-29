#!/bin/bash
#SBATCH --partition=mars
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=64    
#SBATCH --ntasks-per-socket=32
#SBATCH --cpus-per-task=1
#SBATCH --job-name="cae_zhj"
#SBATCH --output="out-%J.log"
#SBATCH --time=03:00:00

export UCX_TLS=self,sysv,glex
export UCX_NET_DEVICES=all
export UCX_MODULES=^cma

module load mpi/openmpi/5.0.0-icc-oneapi2023.2-ch4
module load blas/3.8.0-icc-oneapi2023.2

echo "Job running on $(scontrol show hostname $SLURM_NODELIST) with $SLURM_NTASKS_PER_NODE tasks per node."
echo "Total number of tasks: $SLURM_NTASKS"
echo "Total number of nodes: $SLURM_JOB_NUM_NODES"

# srun -u --mpi=pmix ./testOpenCAEPoro ./data/test/test.data
# srun -u --mpi=pmix BindNIC
srun -u --mpi=pmix ./testOpenCAEPoro ./data/case1/case1.data
