cmake_minimum_required(VERSION 3.12.4) #TODO replace with generated version
project(simple_example LANGUAGES CXX C Fortran)
#TODO add comments

# 1) find installed c_bindings version
find_package(gt_c_bindings)

# 2) extend the CMake module path such that bindings generator can be include within CMake
list(APPEND CMAKE_MODULE_PATH "${gt_c_bindings_MODULE_PATH}")

# 3) include c bindings module
include(gt_bindings)

# 4) create a library with bindings
gt_add_bindings_library(simple SOURCES simple.cpp)

# 5) link the library to a fortran executable
add_executable(driver driver.f90)
target_link_libraries(driver simple_fortran)
