#!/usr/bin/python3
if __name__ == '__main__':
  import sys
  import os
  sys.path.insert(0, os.path.abspath('config'))
  import configure
  configure_options = [
    '--with-debugging=0',
    '--with-fortran-bindings=0',
    '--with-hypre-dir=/GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/depend-install/hypre-2.28.0/install',
    '-diag-disable=10441',
    '-fp-model',
    '-qopenmp',
    '-xHost',
    'CC=mpiicc',
    'CFLAGS=-O3',
    'CXX=mpiicpc',
    'FC=mpiifort',
    'PETSC_ARCH=petsc_install',
    'precise',
  ]
  configure.petsc_configure(configure_options)
