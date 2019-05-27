cmake_minimum_required(VERSION 3.12.4) #TODO replace with generated version
project(simple_example_with_fetch_content LANGUAGES CXX Fortran)

# 1) fetch c_bindings from the repository
include(FetchContent)
FetchContent_Declare(
  c_bindings
  # In your application remove SOURCE_DIR ...
  SOURCE_DIR       ${CMAKE_CURRENT_LIST_DIR}/../..
  # By the following 2 lines to fetch content directly from github
  # GIT_REPOSITORY https://github.com/GridTools/c_bindings.git
  # GIT_TAG        master # consider replacing master by a tagged version
)
FetchContent_GetProperties(c_bindings)
if(NOT c_bindings_POPULATED)
  FetchContent_Populate(c_bindings)
  add_subdirectory(${c_bindings_SOURCE_DIR} ${c_bindings_BINARY_DIR})
endif()

# 2) create a library with bindings. This will generate the files simple.h and simple.f90 which can be included within C and Fortran. In CMake you can use them by linking against `simple_c`or `simple_fortran`.
gt_add_bindings_library(simple SOURCES simple.cpp)

# 3) link the generated library to a fortran executable
add_executable(driver driver.f90)
target_link_libraries(driver simple_fortran)

