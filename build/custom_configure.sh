# Function to add apps
add_app () {
    export KRATOS_APPLICATIONS="${KRATOS_APPLICATIONS}$1;"
}

# Set compiler
export CC=gcc
export CXX=g++

# Set variables
export KRATOS_SOURCE=${KRATOS_SOURCE:-"$( cd "$(dirname "$0")" ; pwd -P )"/..}
export KRATOS_BUILD=${KRATOS_BUILD:-"${KRATOS_SOURCE}/build"}
export KRATOS_APP_DIR=${KRATOS_APP_DIR:-"${KRATOS_SOURCE}/applications"}

# Set basic configuration
export KRATOS_BUILD_TYPE=${KRATOS_BUILD_TYPE:-"Release"}
export PYTHON_EXECUTABLE=${PYTHON_EXECUTABLE:-"/usr/bin/python3"}
export KRATOS_INSTALL_PYTHON_USING_LINKS="ON"
export KRATOS_USE_MPI=${KRATOS_USE_MPI:-"OFF"}

# Set applications to compile
export KRATOS_APPLICATIONS=
add_app ${KRATOS_APP_DIR}/LinearSolversApplication
add_app ${KRATOS_APP_DIR}/StructuralMechanicsApplication
add_app ${KRATOS_APP_DIR}/FluidDynamicsApplication
add_app ${KRATOS_APP_DIR}/RomApplication

# Clean
clear
rm -rf "${KRATOS_BUILD}/${KRATOS_BUILD_TYPE}/cmake_install.cmake"
rm -rf "${KRATOS_BUILD}/${KRATOS_BUILD_TYPE}/CMakeCache.txt"
rm -rf "${KRATOS_BUILD}/${KRATOS_BUILD_TYPE}/CMakeFiles"

# Configure
cmake -H"${KRATOS_SOURCE}" -B"${KRATOS_BUILD}/${KRATOS_BUILD_TYPE}"     \
-DUSE_EIGEN_MKL=OFF                                                     \
-DCMAKE_CXX_FLAGS="${KRATOS_CMAKE_CXX_FLAGS} -Wall -Wextra -Wpedantic"  \
-DCMAKE_UNITY_BUILD=ON                                                  \
-DUSE_MPI=${KRATOS_USE_MPI}

# Build
cmake --build "${KRATOS_BUILD}/${KRATOS_BUILD_TYPE}" --target install -- -j1
