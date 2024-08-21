#!/bin/bash

export OPENCAE_PROJECT_ROOT=$(cd $(dirname $(readlink -f "${BASH_SOURCE[0]}")) && pwd)
echo "Setting project location: $OPENCAE_PROJECT_ROOT"

module unload mpi
module unload intel
module load intel/oneapi2023.2_noimpi
module load mpi/mpich/4.1.2-icc-oneapi2023.2-ch4-dbg
#source /data/software/install/oneapi/setvars.sh
#export PATH=/data/software/install/openmpi/4.1.5/bin:$PATH
#export CPATH=/data/software/install/openmpi/4.1.5/include:$CPATH
#export LD_LIBRARY_PATHwhi=/data/software/install/openmpi/4.1.5/lib:$LD_LIBRARY_PATH
#export LIBRARY_PATH=/data/software/install/openmpi/4.1.5/lib:$LIBRARY_PATH
