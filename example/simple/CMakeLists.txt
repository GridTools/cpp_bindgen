cmake_minimum_required(VERSION 3.12.4) #TODO replace with generated version
project(simple_example LANGUAGES CXX C Fortran)
#TODO add comments

# 3) find installed c_bindings version
find_package(gt_c_bindings)
   # @GridTools_VERSION@ REQUIRED
   # HINTS @CMAKE_INSTALL_PREFIX@/lib/cmake)
# 4) extend the CMake module path such that bindings generator can be include within CMake
list(APPEND CMAKE_MODULE_PATH "${gt_c_bindings_MODULE_PATH}")

# 5) include c bindings module
include(gt_bindings)

gt_add_bindings_library(simple SOURCES simple.cpp)
# target_link_libraries(simple PRIVATE gt_c_bindings::gt_c_bindings)

add_executable(driver driver.f90)
target_link_libraries(driver simple_fortran)
