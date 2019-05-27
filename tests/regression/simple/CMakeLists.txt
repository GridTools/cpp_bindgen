gt_add_bindings_library(simple SOURCES simple.cpp)

add_executable(driver driver.f90)
target_link_libraries(driver simple_fortran)

add_test(NAME driver COMMAND driver)
