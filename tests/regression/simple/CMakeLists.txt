bindgen_add_library(bindgen_regression_simple SOURCES simple.cpp)

if(CMAKE_Fortran_COMPILER_LOADED)
    add_executable(bindgen_regression_simple_driver_fortran driver.f90)
    target_link_libraries(bindgen_regression_simple_driver_fortran bindgen_regression_simple_fortran)
    add_test(NAME bindgen_regression_simple_driver_fortran
        COMMAND $<TARGET_FILE:bindgen_regression_simple_driver_fortran>)
endif()

if(CMAKE_C_COMPILER_LOADED)
    add_executable(bindgen_regression_simple_driver_c driver.c)
    target_link_libraries(bindgen_regression_simple_driver_c bindgen_regression_simple_c)
    add_test(NAME bindgen_regression_simple_driver_c
        COMMAND $<TARGET_FILE:bindgen_regression_simple_driver_c>)
endif()
