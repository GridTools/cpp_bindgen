cmake_minimum_required(VERSION 3.12.4) #TODO replace with generated version
project(simple_example LANGUAGES CXX C Fortran)

# 1) find installed c_bindings version
find_package(gt_c_bindings)

# 2) create a library with bindings
gt_add_bindings_library(simple SOURCES simple.cpp)

# 3) link the library to a fortran executable
add_executable(driver driver.f90)
target_link_libraries(driver simple_fortran)
