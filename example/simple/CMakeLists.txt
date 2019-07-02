cmake_minimum_required(VERSION 3.12.4)
project(simple_example LANGUAGES CXX C Fortran)

# 1) find installed c_bindings version
find_package(cpp_bindgen)

# 2) create a library with bindings
cpp_bindgen_add_library(simple SOURCES simple.cpp)

# 3) link the library to a fortran executable
add_executable(driver driver.f90)
target_link_libraries(driver simple_fortran)
