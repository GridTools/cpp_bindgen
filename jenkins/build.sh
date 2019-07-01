#!/usr/bin/env bash
# Abort on error
set -e

HOST=$(hostname)

if [[ "$HOST" == kesch* || "$HOST" == escha* ]]; then
    module load cmake/3.13.4
    module load PE/17.06
    module load craype-haswell
    module load craype-network-infiniband
    module load PrgEnv-gnu/17.02
    module load netcdf-fortran/4.4.4-gmvolf-17.02
    module load cudatoolkit/9.2.148
    export BOOST_ROOT=/project/c14/install/kesch/boost/boost_1_67_0
    export CUDATOOLKIT_HOME=$CUDA_PATH
    export CUDA_ARCH=sm_37
    export FC=`which gfortran`
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
    echo "Unknown host ${HOST}, using current environment."
fi

cwd=$(pwd)

# install c_bindings
mkdir -p build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=${cwd}/install -DCPP_BINDGEN_REQUIRE_TEST_C=ON -DCPP_BINDGEN_REQUIRE_TEST_Fortran=ON
nice make -j8 install
ctest .

# compile example using the config from build tree (test for export(package))
cd ${cwd}/example/simple
mkdir -p build && cd build
cmake .. -Dcpp_bindgen_DIR=${cwd}/build
nice make -j8
./driver

# compile examples using the installation
# simple example using installation
cd ${cwd}/example/simple
mkdir -p build && cd build
cmake .. -Dcpp_bindgen_DIR=${cwd}/install/lib/cmake
nice make -j8
./driver

# simple example using FetchContent
cd ${cwd}/example/simple_fetch_content
mkdir -p build && cd build
cmake ..
nice make -j8
./driver

# test gt legacy mode (don't run it on kesch because CUDA 8 is not supported in legacy mode)
if [[ "$HOST" != kesch* ]]; then
    cd ${cwd}
    mkdir -p build_legacy && cd build_legacy
    cmake .. -DCMAKE_INSTALL_PREFIX=${cwd}/install -DCPP_BINDGEN_GT_LEGACY=ON
    nice make -j8 install
    ctest .
fi
