cmake_minimum_required(VERSION 3.14.5)
project(simple_example_with_fetch_content LANGUAGES CXX Fortran)

# 1) fetch cpp_bindgen from the repository
include(FetchContent)
FetchContent_Declare(
  cpp_bindgen
  # In your application remove SOURCE_DIR ...
  SOURCE_DIR       ${CMAKE_CURRENT_LIST_DIR}/../..
  # By the following 2 lines to fetch content directly from github
  # GIT_REPOSITORY https://github.com/GridTools/cpp_bindgen.git
  # GIT_TAG        master # consider replacing master by a tagged version
)
FetchContent_MakeAvailable(cpp_bindgen)

# 2) create a library with bindings. This will generate the files simple.h and simple.f90 which can be included within C and Fortran. In CMake you can use them by linking against `simple_c`or `simple_fortran`.
bindgen_add_library(simple SOURCES simple.cpp)

# 3) link the generated library to a fortran executable
add_executable(driver driver.f90)
target_link_libraries(driver simple_fortran)

# 4) optional: demonstrates installing the library with CMake
# installs general cpp_bindgen targets
install_cpp_bindgen_targets(
  EXPORT simple_fortran_targets
  Fortran_MODULE_DESTINATION include
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  )
# install your library (simple) and the generated bindings library (simple_fortran) as usual
install(
  TARGETS simple simple_fortran
  EXPORT simple_fortran_targets
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  )
install(EXPORT simple_fortran_targets DESTINATION cmake NAMESPACE simple_fortran::)
