cmake_minimum_required(VERSION 3.14.5)
project(simple_example LANGUAGES CXX C Fortran)

# 1) find installed cpp_bindgen version
find_package(cpp_bindgen)

# 2) create a library with bindings
bindgen_add_library(simple SOURCES simple.cpp)

# 3) link the library to a fortran executable
add_executable(driver driver.f90)
target_link_libraries(driver simple_fortran)
