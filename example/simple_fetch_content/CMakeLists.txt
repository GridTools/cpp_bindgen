cmake_minimum_required(VERSION 3.12.4) #TODO replace with generated version
project(simple_example_with_fetch_content LANGUAGES CXX Fortran)

# 1) fetch cpp_bindgen from the repository
# TODO: use FetchContent_MakeAvailable() once we require CMake 3.14+
include(FetchContent)
FetchContent_Declare(
  cpp_bindgen
  # In your application remove SOURCE_DIR ...
  SOURCE_DIR       ${CMAKE_CURRENT_LIST_DIR}/../..
  # By the following 2 lines to fetch content directly from github
  # GIT_REPOSITORY https://github.com/GridTools/cpp_bindgen.git
  # GIT_TAG        master # consider replacing master by a tagged version
)
# FetchContent_MakeAvailable(cpp_bindgen) for CMake >= 3.14
FetchContent_GetProperties(cpp_bindgen)
if(NOT cpp_bindgen_POPULATED)
  FetchContent_Populate(cpp_bindgen)
  add_subdirectory(${cpp_bindgen_SOURCE_DIR} ${cpp_bindgen_BINARY_DIR})
endif()

# 2) create a library with bindings. This will generate the files simple.h and simple.f90 which can be included within C and Fortran. In CMake you can use them by linking against `simple_c`or `simple_fortran`.
cpp_bindgen_add_library(simple SOURCES simple.cpp)

# 3) link the generated library to a fortran executable
add_executable(driver driver.f90)
target_link_libraries(driver simple_fortran)
