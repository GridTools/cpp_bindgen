#!/bin/bash

HOST=$(hostname)

if [[ "$HOST" == kesch* || "$HOST" == escha* ]]; then
    module load craype-network-infiniband
    module load craype-haswell
    module load craype-accel-nvidia35
    module load cray-libsci
    module load cudatoolkit/8.0.61
    module load mvapich2gdr_gnu/2.2_cuda_8.0
    module load gcc/5.4.0-2.26
    module load /users/jenkins/easybuild/kesch/modules/all/cmake/3.12.4
    export BOOST_ROOT=/project/c14/install/kesch/boost/boost_1_67_0
    export CUDATOOLKIT_HOME=$CUDA_PATH
    export CUDA_ARCH=sm_37
elif [[ "$HOST" == tave* ]]; then
    module switch PrgEnv-cray PrgEnv-gnu
    module rm CMake
    module load /users/jenkins/easybuild/tave/modules/all/CMake/3.12.4
    export BOOST_ROOT=/project/c14/install/kesch/boost/boost_1_67_0
elif [[ "$HOST" == daint* ]]; then
    module load daint-gpu
    module load cudatoolkit/9.2.148_3.19-6.0.7.1_2.1__g3d9acc8
    module switch PrgEnv-cray PrgEnv-gnu
    module rm CMake
    module load /users/jenkins/easybuild/daint/haswell/modules/all/CMake/3.12.4
    export BOOST_ROOT=/project/c14/install/daint/boost/boost_1_67_0
    export CUDA_ARCH=sm_60
else
    echo "Host $HOST is not supported!"
    exit 1
fi

mkdir -p build && cd build
cmake ..
nice -15 make -j8
make test

